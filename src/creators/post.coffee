{
  ADD, DEL, EDIT, FETCH
} = {post} = require 'actions'

add = (text) -> type: ADD, text: text
del = (text) -> type: DEL, text: text
edit = (text) -> type: EDIT, text: text
fetch = (id) -> type: FETCH, result: makeServerRequest('posts/id')

module.exports =
  add: add
  del: del
  edit: edit
