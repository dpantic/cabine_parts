require 'spec_helper'

describe "ipc_airbuses/index" do
  before(:each) do
    assign(:ipc_airbuses, [
      stub_model(IpcAirbus,
        :ac_type => "Ac Type",
        :ata => "Ata",
        :system => "System",
        :description => "Description",
        :fin => "Fin",
        :add_infos => "Add Infos",
        :part_number => "Part Number",
        :add_material_info => "Add Material Info",
        :ipc => "Ipc"
      ),
      stub_model(IpcAirbus,
        :ac_type => "Ac Type",
        :ata => "Ata",
        :system => "System",
        :description => "Description",
        :fin => "Fin",
        :add_infos => "Add Infos",
        :part_number => "Part Number",
        :add_material_info => "Add Material Info",
        :ipc => "Ipc"
      )
    ])
  end

  it "renders a list of ipc_airbuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ac Type".to_s, :count => 2
    assert_select "tr>td", :text => "Ata".to_s, :count => 2
    assert_select "tr>td", :text => "System".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Fin".to_s, :count => 2
    assert_select "tr>td", :text => "Add Infos".to_s, :count => 2
    assert_select "tr>td", :text => "Part Number".to_s, :count => 2
    assert_select "tr>td", :text => "Add Material Info".to_s, :count => 2
    assert_select "tr>td", :text => "Ipc".to_s, :count => 2
  end
end
