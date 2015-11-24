require! {
  \isomorphic-fetch : fetch
  \./store.ls
}

exports.emoji-on-click = (emoji, event)--> console.log emoji, event

exports.finder-on-key-down = (event)->
  store.search-word.word = event.target.value

exports.load-emojis = ->
  fetch \//cdn.rawgit.com/jgsme/emo/gh-pages/data/emojis.json
    .then (res)-> res.json!
    .then (emojis)->
      store.emojis.original =
        emojis.map (emoji)->
          emoji
            ..for-search = [emoji.name].concat emoji.keywords .join ','
            ..unicode = emoji.keywords[*-1]
            ..keywords = emoji.keywords.slice 0, -1
