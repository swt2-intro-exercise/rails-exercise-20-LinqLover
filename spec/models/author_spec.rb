require 'rails_helper'

RSpec.describe Author, type: :model do
  all_fields = {
    first_name: 'a_first_name',
    last_name: 'a_last_name',
    homepage: 'http://homepage.com'
  }

  %i[first_name last_name].each do |part_name|
    describe part_name do
      other_fields = all_fields.except(part_name)
      it "should be required" do
        expect(
          Author.new(other_fields)
        ).to be_invalid
      end
      it "should be rejected if shorter than two characters" do
        expect(
          Author.new(**other_fields, part_name => 'a')
        ).to be_invalid
      end
      it "should be accepted if at least two characters long" do
        expect(
          Author.new(**other_fields, part_name => 'ab')
        ).to be_valid
      end
    end
  end

  describe :homepage do
    other_fields = all_fields.except(:homepage)
    it "should be required" do
      expect(
        Author.new(other_fields)
      ).to be_invalid
    end
    it "should begin with a valid protocol" do
      expect(
        Author.new(**other_fields, homepage: 'www.example.com')
      ).to be_invalid
    end
    it "should be accepted if begins with a valid protocol" do
      expect(
        Author.new(**other_fields, homepage: 'https:example.com')
      ).to be_valid
    end
  end

  describe :name do
    it "should compose first_name and last_name" do
      expect(Author.new(
        homepage: all_fields[:homepage],
        first_name: 'first_name',
        last_name: 'last_name'
      ).name).to eq('first_name last_name')
    end
  end
end
