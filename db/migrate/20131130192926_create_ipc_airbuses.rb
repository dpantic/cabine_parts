class CreateIpcAirbuses < ActiveRecord::Migration
  def change
    create_table :ipc_airbuses do |t|
      t.column :ac_type, :string, :limit => 6
      t.column :ata, :string, :limit => 5
      t.column :system, :string
      t.column :description, :string
      t.column :fin, :string
      t.column :add_infos, :string, :limit => 15
      t.column :part_number, :string
      t.column :add_material_info, :limit => 15
      t.column :ipc, :string

      t.timestamps
    end
  end
end

