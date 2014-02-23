class Spm < ActiveRecord::Base

	attr_accessible :id, :spm_ref, :bauteil

  def self.import(file)

    spreadsheet = open_spreadsheet(file) 
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
     row = Hash[[header, spreadsheet.row(i)].transpose]
     spm = find_by_id(row["id"]) || new
     spm.attributes = row.to_hash.slice(*accessible_attributes)
    # ipc_airbus.attributes = row.to_hash.slice(*IpcAirbus.attribute_names())
    # ipc_airbus.attributes = row.to_hash.slice { |k,v| allowed_attributes.include? k }
     spm.save!
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
       where("id || spm_ref || bauteil like ?","%#{search}%")
    else 
     find(:all)
   end
  end
end 
