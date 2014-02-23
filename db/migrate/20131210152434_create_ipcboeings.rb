class CreateIpcboeings < ActiveRecord::Migration
  def change
    create_table :ipcboeings do |t|
      t.string :ac_type, :string, :limit => 6
      t.string :ata, :string, :limit => 5
      t.string :system, :string, :limit => 15
      t.string :description, :string
      t.string :location, :string
      t.string :add_infos, :string, :limit => 20
      t.string :part_number, :string
      t.string :add_material_info, :limit => 20
      t.string :ipc, :string

      t.timestamps
    end
  end
end
