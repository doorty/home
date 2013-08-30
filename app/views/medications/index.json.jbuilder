json.array!(@medications) do |medication|
  json.extract! medication, :care_circle_id, :name
  json.url medication_url(medication, format: :json)
end