json.array! @types.each do |type|
  json.id type.id
  json.name type.value
end