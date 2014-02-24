class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.text :product_type
      t.text :description
      t.text :add_infos
      t.text :mat_nr
      t.text :part_number

      t.timestamps
    end
  end
end
