require 'rails_helper'

describe "Authors list page", type: :feature do
  it "should render withour error" do
    visit authors_path
  end
end
