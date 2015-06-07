require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      :text => "MyString",
      :collection => nil
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input#link_text[name=?]", "link[text]"

      assert_select "input#link_collection_id[name=?]", "link[collection_id]"
    end
  end
end
