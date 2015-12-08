atom.commands.add 'atom-workspace', 'dot-atom:to-snake-case', ->
  console.log 'converting to snake case! (From Camel Case)'
  editor = atom.workspace.getActiveTextEditor()
  # need to actually continue this. Also add me to ansible
