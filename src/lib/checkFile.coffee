module.exports = (file) ->
  msg = ''
  wrong = 'Wrong file. Only images and text allowed, size must be low then 127k'

  {width, height} = file
  size = if width? and height? then "#{width}x#{height}" else file.size

  {image, allow} = switch file.type
    when 'text/plain'
      image: no, allow: size < 128*1024
    when 'image/png' or 'image/jpeg' or 'image/gif'
      image: yes, allow: size < 128*1024
      # width < 320*240 # Fucking file hasnt propery width and height. WTF?
    else
      image: no, allow: no
  msg = wrong if not allow

  {image, allow, msg, size}
