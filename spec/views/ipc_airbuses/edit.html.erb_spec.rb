require 'spec_helper'

describe "ipc_airbuses/edit" do
  before(:each) do
    @ipc_airbus = assign(:ipc_airbus, stub_model(IpcAirbus,
      :ac_type => "MyString",
      :ata => "MyString",
      :system => "MyString",
      :description => "MyString",
      :fin => "MyString",
      :add_infos => "MyString",
      :part_number => "MyString",
      :add_material_info => "MyString",
      :ipc => "MyString"
    ))
  end

  it "renders the edit ipc_airbus form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ipc_airbus_path(@ipc_airbus), "post" do
      assert_select "input#ipc_airbus_ac_type[name=?]", "ipc_airbus[ac_type]"
      assert_select "input#ipc_airbus_ata[name=?]", "ipc_airbus[ata]"
      assert_select "input#ipc_airbus_system[name=?]", "ipc_airbus[system]"
      assert_select "input#ipc_airbus_description[name=?]", "ipc_airbus[description]"
      assert_select "input#ipc_airbus_fin[name=?]", "ipc_airbus[fin]"
      assert_select "input#ipc_airbus_add_infos[name=?]", "ipc_airbus[add_infos]"
      assert_select "input#ipc_airbus_part_number[name=?]", "ipc_airbus[part_number]"
      assert_select "input#ipc_airbus_add_material_info[name=?]", "ipc_airbus[add_material_info]"
      assert_select "input#ipc_airbus_ipc[name=?]", "ipc_airbus[ipc]"
    end
  end
end
