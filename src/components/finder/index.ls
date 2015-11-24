require! {
  simulacra: bind
  \../../util.ls : {QS}
  \../../store.ls : {search-word}
  \../../actions.ls : {finder-on-key-down}
}

template = document.get-element-by-id \finder-template .content
qs = QS template

bindings =
  bind do
    template
    word: bind do
      qs \.finder-input
      (node, word)->
        node
          ..value = word
          ..add-event-listener \keydown, finder-on-key-down

document.get-element-by-id \finder-container .append-child bind search-word, bindings
