json.array!(@runs) do |run|
  json.extract! run, :name, :relay, :minis, :kids
  json.id run.slug
end