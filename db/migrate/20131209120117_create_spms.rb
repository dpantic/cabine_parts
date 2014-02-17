class CreateSpms < ActiveRecord::Migration
  def change
    create_table :spms do |t|
      t.string :spm_ref, :limit => 8 
      t.string :bauteil, :limit => 20

      t.timestamps
    end
  end
end
