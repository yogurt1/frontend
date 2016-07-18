module.exports =
parse: (res) -> switch res.headers.get 'Content-Type'
  when 'application/json' then do res.json
  when 'blob' then do res.blob
  when 'arraybuffer' then do res.arraybuffer
  when 'application/x-ww-form-urlencoded' or 'multipart/form-data'
    do res.formData
  when 'text/plain' then do res.text
  else do res.text #res.body

catchErr: (err) -> throw new Error err

status: (res) ->
  if res.ok then res
  else
    err = new Error res.statusText
    err.res = res
    throw err
