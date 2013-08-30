json.array!(@charts) do |chart|
  json.extract! chart, :care_circle_id
  json.url chart_url(chart, format: :json)
end