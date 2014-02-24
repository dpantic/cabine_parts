json.array!(@materials) do |material|
  json.extract! material, :id, :product_type, :description, :add_infos, :mat_nr, :part_number
  json.url material_url(material, format: :json)
end