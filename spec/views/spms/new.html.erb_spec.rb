require 'spec_helper'

describe "spms/new" do
  before(:each) do
    assign(:spm, stub_model(Spm,
      :spm_ref => "MyString",
      :bauteil => "MyString"
    ).as_new_record)
  end

  it "renders new spm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spms_path, "post" do
      assert_select "input#spm_spm_ref[name=?]", "spm[spm_ref]"
      assert_select "input#spm_bauteil[name=?]", "spm[bauteil]"
    end
  end
end
