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

include PgSearch
  pg_search_scope :search,
    :against => [ :ac_type, :ata, :system, :description, :fin, :add_infos, :part_number, :add_material_info, :ipc],
    :using => [:tsearch, :dmetaphone, :trigrams],
    :ignoring => :accents
end

 # def self.search(search,type)
 #   if search 
 #      # where("system || description || fin || add_infos || part_number || add_material_info || ipc like ?","%#{search}%")
 #     where("system OR description OR add_infos OR part_number OR add_material_info OR ipc like ?","%#{search}%")
 #       # find(:all, :conditions => ['id || ac_type || ata || system || description || fin || add_infos || part_number || add_material_info || ipc like ?',"%#{search}%"])
 #   else
 #     #find(:all)
 #     #all
 #    scoped
 #  end
 # end
#end