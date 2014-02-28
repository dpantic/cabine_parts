class Material < ActiveRecord::Base

	attr_accessible :id, :product_type, :description, :add_infos, :mat_nr, :part_number
   
  def self.import(file) 
    spreadsheet = open_spreadsheet(file) 
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
     row = Hash[[header, spreadsheet.row(i)].transpose]
     material = find_by_id(row["id"]) || new
     material.attributes = row.to_hash.slice(*accessible_attributes)
     material.save!
    end
   end	

   def self.open_spreadsheet(file)
     case File.extname(file.original_filename)
       when ".csv"  then Roo::Csv.new(file.path, nil, :ignore)
       when ".xls"  then Roo::Excel.new(file.path, nil, :ignore)
       when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
     else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.search(search)
   if search 
       where("id || product_type || description || add_infos || mat_nr || part_number like ?","%#{search}%")
       # where("id || product_type || description || add_infos || mat_nr like ?","%#{search}%")
        # find(:all, :conditions => ['id || ac_type || ata || system || description || fin || add_infos || part_number || add_material_info || ipc like ?',"%#{search}%"])
    else
      #find(:all)
      all
   end
  end
end
