require 'rails_helper'

RSpec.describe "authors/new", type: :view do
  before(:each) do
    assign(:author, build(:author))
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do
      assert_select "input[name=?]", "author[first_name]"
      assert_select "input[name=?]", "author[last_name]"
      assert_select "input[name=?]", "author[homepage]"
    end
  end
end
