json.array!(@care_circles) do |care_circle|
  json.extract! care_circle, 
  json.url care_circle_url(care_circle, format: :json)
end