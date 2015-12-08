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
