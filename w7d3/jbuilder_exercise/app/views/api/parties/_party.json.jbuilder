json.extract! party, :name, :location
json.guests do
  json.array! party.guests, :name
end
