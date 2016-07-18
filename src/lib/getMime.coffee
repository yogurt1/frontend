module.exports = (base64) -> switch base64.charAt 0
  when '/' then 'image/jpeg'
  when 'R' then 'image/gif'
  when 'i' then 'image/png'
