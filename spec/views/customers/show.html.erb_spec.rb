require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :name => "Name",
      :age => "Age",
      :location => "Location",
      :description => "Description",
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Age/)
    rendered.should match(/Location/)
    rendered.should match(/Description/)
    rendered.should match(/Image Url/)
  end
end
