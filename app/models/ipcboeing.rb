class Ipcboeing < ActiveRecord::Base
	
	attr_accessible :id, :ac_type, :ata, :system, :description, :location, :add_infos, :part_number, :add_material_info, :ipc

  def self.import(file)
    spreadsheet = open_spreadsheet(file) 
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
     row = Hash[[header, spreadsheet.row(i)].transpose]
     ipcboeing = find_by_id(row["id"]) || new
     ipcboeing.attributes = row.to_hash.slice(*accessible_attributes)
     ipcboeing.save!
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
       where("id ||  add_material_info || ata || system || description || location || add_infos || part_number || ipc  like ?","%#{search}%")
    else 
     all
   end
  end
end 

