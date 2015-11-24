require! {
  simulacra: bind
  \../../util.ls : {QS}
  \../../store.ls : {emojis}
  \../../actions.ls : {emoji-on-click}
}

template = document.get-element-by-id \emojis-template .content
qs = QS template

bindings =
  bind do
    template
    original: bind do
      qs \.emoji
      (node, emoji)->
        node
          ..class-name = "emo emo-margin emoji s_#{emoji.name}"
          ..add-event-listener \click, emoji-on-click emoji

document.get-element-by-id \emojis-container .append-child bind emojis, bindings
