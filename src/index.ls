require! {
  simulacra: bind
  \./components/emojis/index.ls
  \./components/finder/index.ls
  \./actions.ls : {load-emojis}
}

load-emojis!
