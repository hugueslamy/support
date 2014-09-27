json.array!(@statuses) do |status|
  json.extract! status, :id, :name, :initial, :closing
  json.url status_url(status, format: :json)
end
