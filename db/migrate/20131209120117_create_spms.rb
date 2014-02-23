class CreateSpms < ActiveRecord::Migration
  def change
    create_table :spms do |t|
      t.text :spm_ref, :limit => 8 
      t.text :bauteil, :limit => 20

      t.timestamps
    end
  end
end
