require 'spec_helper'

describe "spms/show" do
  before(:each) do
    @spm = assign(:spm, stub_model(Spm,
      :spm_ref => "Spm Ref",
      :bauteil => "Bauteil"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Spm Ref/)
    rendered.should match(/Bauteil/)
  end
end
