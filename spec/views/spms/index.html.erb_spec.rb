require 'spec_helper'

describe "spms/index" do
  before(:each) do
    assign(:spms, [
      stub_model(Spm,
        :spm_ref => "Spm Ref",
        :bauteil => "Bauteil"
      ),
      stub_model(Spm,
        :spm_ref => "Spm Ref",
        :bauteil => "Bauteil"
      )
    ])
  end

  it "renders a list of spms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Spm Ref".to_s, :count => 2
    assert_select "tr>td", :text => "Bauteil".to_s, :count => 2
  end
end
