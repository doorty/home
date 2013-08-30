json.array!(@doctors) do |doctor|
  json.extract! doctor, :care_circle_id, :name, :phone, :address, :city, :state
  json.url doctor_url(doctor, format: :json)
end