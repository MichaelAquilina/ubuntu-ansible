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


// Use full file path as Window title
set_window_title = function() {
  let window = atom.getCurrentWindow();
  let editor = atom.workspace.getActiveTextEditor();
  if (editor) {
    let relative_path = atom.project.relativizePath(editor.getPath())[1];
    window.setTitle(`Atom - ${relative_path}`);
  } else {
    window.setTitle("Atom - None");
  }
}

atom.workspace.onDidChangeActivePaneItem(set_window_title);
set_window_title();
