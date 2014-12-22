json.array!(@events) do |event|
  json.id	event.slug
  json.name event.name
  json.date l event.event_date
  json.url api_event_url(event)
end
