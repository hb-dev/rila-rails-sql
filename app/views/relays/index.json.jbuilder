json.array!(@relays) do |relay|
  json.extract! relay, :id, :run_id, :name
  json.url relay_url(relay, format: :json)
end
