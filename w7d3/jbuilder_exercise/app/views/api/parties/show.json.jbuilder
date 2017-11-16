
json.extract! @party, :name, :location

json.guests do
  json.array! @party.guests do |guest|
    json.extract! guest, :name
    json.gifts do
      json.array! guest.gifts, :id, :title
    end
  end
end
