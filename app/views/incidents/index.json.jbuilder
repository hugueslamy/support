json.array!(@incidents) do |incident|
  json.extract! incident, :id, :requestor_name, :requestor_email, :departement, :title, :body
  json.url incident_url(incident, format: :json)
end
