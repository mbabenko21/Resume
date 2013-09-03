class ResumeRouter extends Backbone.Router
  routes:
    "about-me":   "aboutMe"
    "node.js":    "nodeJS"
    "php":        "php"
    "database":   "database"
    "javascript": "javascript"
    "unix":       "unix"
    "git":        "git"

  aboutMe:  () ->
    console.log "abountMe"
  nodeJS:   () ->
    console.log "node"
  php:      () ->
    console.log "php"
  database: () ->
    console.log "database"
  javascript: () ->
    console.log "js"
  unix: () ->
    console.log "unix"
  git: () ->
    console.log "git"

window.Router = new ResumeRouter()