fs = require('fs')

document.body.classList.add("an-old-hope-modify-ui");

atom.commands.add("atom-text-editor", "dot-atom:to-snake-case", () => {
  console.log("converting to snake case! (From Camel Case)");
  let editor = atom.workspace.getActiveTextEditor();
  let text = editor.getSelectedText();
  console.log(text);

  let output = [];
  tokens = text.split(/(?=[A-Z])/);

  tokens.forEach((t) => {
    output.push(t.toLowerCase());
  });

  editor.insertText(output.join("_"));
})

atom.commands.add("atom-text-editor", "dot-atom:to-camel-case", () => {
  console.log("converting to camel case! (From Snake Case)");
  let editor = atom.workspace.getActiveTextEditor();
  let text = editor.getSelectedText();
  console.log(text);

  let output = [];
  tokens = text.split('_');

  tokens.forEach((t) => {
    output.push(t.substr(0, 1).toUpperCase() + t.substr(1));
  });

  editor.insertText(output.join(""));
})


atom.commands.add("atom-text-editor", "dot-atom:copy-relative-path", () => {
  let editor = atom.workspace.getActiveTextEditor();
  let relative_path = atom.project.relativizePath(editor.getPath())[1];
  atom.clipboard.write(relative_path);
});

atom.commands.add("atom-text-editor", "dot-atom:copy-relative-path-and-line", () => {
  let editor = atom.workspace.getActiveTextEditor();
  let relative_path = atom.project.relativizePath(editor.getPath())[1];
  let line_number = editor.getCursorBufferPosition().row  + 1

  atom.clipboard.write(`${relative_path}:${line_number}`);
});

atom.commands.add("atom-text-editor", "dot-atom:open-in-newpane", () => {
  let editor = atom.workspace.getActiveTextEditor();
  let current_path = editor.getPath()
  editor.destroy()
  atom.workspace.open(
      current_path,
      {'split': 'right', 'searchAllPanes': true}
  )
});

// Use full file path as Window title
set_window_title = function() {
  let window = atom.getCurrentWindow();
  let editor = atom.workspace.getActiveTextEditor();

  let window_title = 'Atom';

  if (editor) {
    window_title += ' -';

    let output = atom.project.relativizePath(editor.getPath());

    let project_path = '';
    if (output[0] != null) {
        project_path = output[0].split('/');
        project_path = project_path[project_path.length - 1];
        window_title += ` (${project_path})`;
    }

    let relative_path = output[1];
    window_title += ` ${relative_path}`;
  }

  window.setTitle(window_title);
}

open_pytest_file = function() {
  let editor = atom.workspace.getActiveTextEditor();
  if (editor == null) {
    atom.notifications.addWarning('Tried opening pytest file but editor is null');
    return;
  }

  let output = atom.project.relativizePath(editor.getPath());
  let project_path = output[0];
  let relative_path = output[1];

  if (relative_path == null) {
    atom.notifications.addWarning(
        `Tried opening pytest file for '${output}' but relative path could not be found`
    );
    return
  }

  // Currently only works with python
  if (!relative_path.startsWith('tests/') && relative_path.endsWith('.py')) {
    let path_tokens = relative_path.split('/');
    path_tokens.shift();  // we dont care about the src folder name

    let current_file = path_tokens[path_tokens.length - 1]

    path_tokens[path_tokens.length - 1] = 'test_' + current_file;
    let test_path = project_path + '/tests/' + path_tokens.join('/');

    fs.access(test_path, (err) => {
      if (!err) {
        atom.workspace.open(
            test_path,
            {
              'split': 'right',
              'activatePane': false,
              'activateItem': true,
              'pending': true
            }
        );
      }
    });
  } else {
    atom.notifications.addInfo(
        `Tried opening pytest file for '${relative_path}' but corresonding test file`
    );
  }
}
atom.commands.add("atom-text-editor", "dot-atom:open-pytest-file", open_pytest_file)

set_window_title();
atom.workspace.onDidChangeActivePaneItem(set_window_title);
