require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :first_name => "First",
        :last_name => "Last",
        :homepage => "http://first.la.st"
      ),
      Author.create!(
        :first_name => "First",
        :last_name => "Last",
        :homepage => "http://first.la.st"
      )
    ])
  end

  it "renders a list of papers" do
    render
    assert_select "tr>td", :text => "First".to_s, :count => 2
    assert_select "tr>td", :text => "Last".to_s, :count => 2
    assert_select "tr>td", :text => "http://first.la.st".to_s, :count => 2
  end
end
