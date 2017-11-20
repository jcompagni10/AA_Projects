json.array! @gifts do |gift|
  json.partial! '/api/gifts/gifts', gifts: gift
end
