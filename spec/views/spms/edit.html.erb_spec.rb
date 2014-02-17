require 'spec_helper'

describe "spms/edit" do
  before(:each) do
    @spm = assign(:spm, stub_model(Spm,
      :spm_ref => "MyString",
      :bauteil => "MyString"
    ))
  end

  it "renders the edit spm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spm_path(@spm), "post" do
      assert_select "input#spm_spm_ref[name=?]", "spm[spm_ref]"
      assert_select "input#spm_bauteil[name=?]", "spm[bauteil]"
    end
  end
end
