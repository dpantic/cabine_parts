class CreateIpcAirbuses < ActiveRecord::Migration
  def change
    create_table :ipc_airbuses do |t|
      t.text :ac_type, :string, :limit => 6
      t.text :ata, :string, :limit => 5
      t.text :system, :string
      t.text :description, :string
      t.text :fin, :string
      t.text :add_infos, :string
      t.text :part_number, :string
      t.text :add_material_info
      t.text :ipc, :string

      t.timestamps
    end
  end
end

