require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        :text => "Text",
        :collection => nil
      ),
      Link.create!(
        :text => "Text",
        :collection => nil
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
