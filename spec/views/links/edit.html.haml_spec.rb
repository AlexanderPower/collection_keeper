require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :text => "MyString",
      :collection => nil
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_text[name=?]", "link[text]"

      assert_select "input#link_collection_id[name=?]", "link[collection_id]"
    end
  end
end
