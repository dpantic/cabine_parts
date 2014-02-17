class IpcAirbus < ActiveRecord::Base
 
	attr_accessible :id, :ac_type, :ata, :system, :description, :fin, :add_infos, :part_number, :add_material_info, :ipc
   
  def self.import(file) 
    spreadsheet = open_spreadsheet(file) 
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
     row = Hash[[header, spreadsheet.row(i)].transpose]
     ipc_airbus = find_by_id(row["id"]) || new
     ipc_airbus.attributes = row.to_hash.slice(*accessible_attributes)
     ipc_airbus.save!
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
       where("id || ac_type || ata || system || description || add_infos || part_number || add_material_info || ipc like ?","%#{search}%")

     #  where("ipc like ?","%#{search}%")
     #  find(:all, :conditions => ['ac_type LIKE ?', "%#{search}%"])
     #  find(:all, :conditions => ['ata LIKE  ?', "%#{search}%"])
    else 
     find(:all)
   end
  end
end 


     

    
     
     
    