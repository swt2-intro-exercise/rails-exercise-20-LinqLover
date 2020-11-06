require 'rails_helper'

describe "Author", type: :model do
  it "should have a first_name" do
    name = 'Johanna'
    author = Author.new(first_name: name)
    expect(author.first_name).to eq(name)
  end
  it "should have a last_name" do
    name = 'Doe'
    author = Author.new(last_name: name)
    expect(author.last_name).to eq(name)
  end
  it "should have a homepage" do
    url = 'https://example.com'
    author = Author.new(homepage: url)
    expect(author.homepage).to eq(url)
  end
  it "should have a name" do
    first_name, last_name = 'Johanna', 'Doe'
    author = Author.new(first_name: first_name, last_name: last_name)
    expect(author.name).to eq("#{first_name} #{last_name}")
  end
end
