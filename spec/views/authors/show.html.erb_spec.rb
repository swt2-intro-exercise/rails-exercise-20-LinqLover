require 'rails_helper'

RSpec.describe "authors/show", type: :view do
  before(:each) do
    @author = assign(:author, build(:author))
    @author.id = 1337
    @author.papers = [build(:paper)]
    @author.papers[0].id = 42
    # TODO: This is HACKED
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Alan/)
    expect(rendered).to match(/Turing/)
    expect(rendered).to match('wikipedia.de/Alan_Turing')
    expect(rendered).to match(/COMPUTING MACHINERY AND INTELLIGENCE/)
  end
end
