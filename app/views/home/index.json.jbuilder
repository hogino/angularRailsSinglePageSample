json.array!(@menu) do |m|
  json.field m.first
  json.label m.second
end
