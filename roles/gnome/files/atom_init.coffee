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


set_window_title = ->
  window = atom.getCurrentWindow()
  editor = atom.workspace.getActiveTextEditor()
  if editor
    window.setTitle(editor.getPath())
  else
    window.setTitle("Atom Text Editor - None")


# Use full file path as Window title
atom.workspace.onDidChangeActivePaneItem(set_window_title)
set_window_title()
