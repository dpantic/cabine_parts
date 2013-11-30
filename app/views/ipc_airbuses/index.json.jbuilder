json.array!(@ipc_airbuses) do |ipc_airbus|
  json.extract! ipc_airbus, :ac_type, :ata, :system, :description, :fin, :add_infos, :part_number, :add_material_info, :ipc
  json.url ipc_airbus_url(ipc_airbus, format: :json)
end