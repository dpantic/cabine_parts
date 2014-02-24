require 'spec_helper'

describe "materials/index" do
  before(:each) do
    assign(:materials, [
      stub_model(Material,
        :id => 1,
        :product_type => "MyText",
        :description => "MyText",
        :add_infos => "MyText",
        :mat_nr => "MyText",
        :part_number => "MyText"
      ),
      stub_model(Material,
        :id => 1,
        :product_type => "MyText",
        :description => "MyText",
        :add_infos => "MyText",
        :mat_nr => "MyText",
        :part_number => "MyText"
      )
    ])
  end

  it "renders a list of materials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
