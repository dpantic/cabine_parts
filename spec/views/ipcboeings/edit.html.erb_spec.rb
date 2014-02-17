require 'spec_helper'

describe "ipcboeings/edit" do
  before(:each) do
    @ipcboeing = assign(:ipcboeing, stub_model(Ipcboeing,
      :ac_type => "MyString",
      :ata => "MyString",
      :system => "MyString",
      :description => "MyString",
      :location => "MyString",
      :add_infos => "MyString",
      :part_number => "MyString",
      :add_material_info => "MyString",
      :ipc => "MyString"
    ))
  end

  it "renders the edit ipcboeing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ipcboeing_path(@ipcboeing), "post" do
      assert_select "input#ipcboeing_ac_type[name=?]", "ipcboeing[ac_type]"
      assert_select "input#ipcboeing_ata[name=?]", "ipcboeing[ata]"
      assert_select "input#ipcboeing_system[name=?]", "ipcboeing[system]"
      assert_select "input#ipcboeing_description[name=?]", "ipcboeing[description]"
      assert_select "input#ipcboeing_location[name=?]", "ipcboeing[location]"
      assert_select "input#ipcboeing_add_infos[name=?]", "ipcboeing[add_infos]"
      assert_select "input#ipcboeing_part_number[name=?]", "ipcboeing[part_number]"
      assert_select "input#ipcboeing_add_material_info[name=?]", "ipcboeing[add_material_info]"
      assert_select "input#ipcboeing_ipc[name=?]", "ipcboeing[ipc]"
    end
  end
end
