require 'spec_helper'

describe "materials/new" do
  before(:each) do
    assign(:material, stub_model(Material,
      :id => 1,
      :product_type => "MyText",
      :description => "MyText",
      :add_infos => "MyText",
      :mat_nr => "MyText",
      :part_number => "MyText"
    ).as_new_record)
  end

  it "renders new material form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", materials_path, "post" do
      assert_select "input#material_id[name=?]", "material[id]"
      assert_select "textarea#material_product_type[name=?]", "material[product_type]"
      assert_select "textarea#material_description[name=?]", "material[description]"
      assert_select "textarea#material_add_infos[name=?]", "material[add_infos]"
      assert_select "textarea#material_mat_nr[name=?]", "material[mat_nr]"
      assert_select "textarea#material_part_number[name=?]", "material[part_number]"
    end
  end
end
