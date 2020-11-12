require 'rails_helper'

RSpec.describe "authors/show", type: :view do
  before(:each) do
    @author = assign(:author, build(:author))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Alan/)
    expect(rendered).to match(/Turing/)
    expect(rendered).to match('wikipedia.de/Alan_Turing')
  end
end
