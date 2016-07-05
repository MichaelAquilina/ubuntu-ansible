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


atom.commands.add("atom-text-editor", "dot-atom:copy-relative-path", () => {
  let editor = atom.workspace.getActiveTextEditor();
  let relative_path = atom.project.relativizePath(editor.getPath())[1];
  atom.clipboard.write(relative_path);
});


// Use full file path as Window title
set_window_title = function() {
  let window = atom.getCurrentWindow();
  let editor = atom.workspace.getActiveTextEditor();

  let window_title = 'Atom'

  if (editor) {
    window_title += ' -'

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

atom.workspace.onDidChangeActivePaneItem(set_window_title);
set_window_title();
