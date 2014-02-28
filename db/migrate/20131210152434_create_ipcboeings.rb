class CreateIpcboeings < ActiveRecord::Migration
  def change
    create_table :ipcboeings do |t|
      t.text :ac_type, :limit => 6
      t.text :ata, :limit => 5
      t.text :system, :limit => 15
      t.text :description
      t.text :location
      t.text :add_infos
      t.text :part_number
      t.text :add_material_info
      t.text :ipc

      t.timestamps
    end
  end
end
