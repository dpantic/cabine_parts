require 'spec_helper'

describe "ipcboeings/show" do
  before(:each) do
    @ipcboeing = assign(:ipcboeing, stub_model(Ipcboeing,
      :ac_type => "Ac Type",
      :ata => "Ata",
      :system => "System",
      :description => "Description",
      :location => "Location",
      :add_infos => "Add Infos",
      :part_number => "Part Number",
      :add_material_info => "Add Material Info",
      :ipc => "Ipc"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ac Type/)
    rendered.should match(/Ata/)
    rendered.should match(/System/)
    rendered.should match(/Description/)
    rendered.should match(/Location/)
    rendered.should match(/Add Infos/)
    rendered.should match(/Part Number/)
    rendered.should match(/Add Material Info/)
    rendered.should match(/Ipc/)
  end
end
