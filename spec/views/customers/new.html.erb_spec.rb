require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :name => "MyString",
      :age => "MyString",
      :location => "MyString",
      :description => "MyString",
      :image_url => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path, :method => "post" do
      assert_select "input#customer_name", :name => "customer[name]"
      assert_select "input#customer_age", :name => "customer[age]"
      assert_select "input#customer_location", :name => "customer[location]"
      assert_select "input#customer_description", :name => "customer[description]"
      assert_select "input#customer_image_url", :name => "customer[image_url]"
    end
  end
end
