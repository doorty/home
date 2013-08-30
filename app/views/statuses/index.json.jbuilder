json.array!(@statuses) do |status|
  json.extract! status, :message
  json.url status_url(status, format: :json)
end