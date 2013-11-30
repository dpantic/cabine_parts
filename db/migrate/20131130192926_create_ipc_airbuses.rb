class CreateIpcAirbuses < ActiveRecord::Migration
  def change
    create_table :ipc_airbuses do |t|
      t.string :ac_type
      t.string :ata
      t.string :system
      t.string :description
      t.string :fin
      t.string :add_infos
      t.string :part_number
      t.string :add_material_info
      t.string :ipc

      t.timestamps
    end
  end
end
