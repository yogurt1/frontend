re = /^data\:image\/(png|jpg|jpeg|gif)\;base64\,(\w+)/
#re = /^data\:(\w+)\/(\w+)\;base64\,(\w+)/

module.exports = (str) -> if re.test str then 'image' else 'text'
