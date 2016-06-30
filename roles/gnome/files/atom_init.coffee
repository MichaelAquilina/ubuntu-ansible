document.body.classList.add('an-old-hope-modify-ui')

atom.commands.add 'atom-workspace', 'dot-atom:to-snake-case', ->
  console.log 'converting to snake case! (From Camel Case)'
  editor = atom.workspace.getActiveTextEditor()
  text = editor.getSelectedText()
  console.log text

  output = []
  tokens = text.split(/(?=[A-Z])/)
  console.log JSON.stringify(tokens)
  for t in tokens
    output.push(t.toLowerCase())

  editor.insertText(output.join('_'))


# Use full file path as Window title
set_window_title = ->
  window = atom.getCurrentWindow()
  editor = atom.workspace.getActiveTextEditor()
  if editor
    [project_path, relative_path] = atom.project.relativizePath(editor.getPath())
    window.setTitle("Atom - #{relative_path}")
  else
    window.setTitle("Atom - None")

atom.workspace.onDidChangeActivePaneItem(set_window_title)
set_window_title()
