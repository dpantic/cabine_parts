class CreateIpcboeings < ActiveRecord::Migration
  def change
    create_table :ipcboeings do |t|
      t.text :ac_type, :string, :limit => 6
      t.text :ata, :string, :limit => 5
      t.text :system, :string, :limit => 15
      t.text :description, :string
      t.text :location, :string
      t.text :add_infos, :string, :limit => 20
      t.text :part_number, :string
      t.text :add_material_info, :limit => 20
      t.text :ipc, :string

      t.timestamps
    end
  end
end
