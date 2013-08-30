json.array!(@appointments) do |appointment|
  json.extract! appointment, :title, :date
  json.url appointment_url(appointment, format: :json)
end