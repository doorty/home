json.array!(@notes) do |note|
  json.extract! note, :care_circle_id, :content
  json.url note_url(note, format: :json)
end