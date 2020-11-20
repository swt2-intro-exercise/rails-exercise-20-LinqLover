require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  let(:valid_attributes) do
    {
      first_name: 'My First Name',
      last_name: 'My Last Name',
      homepage: 'https://example.com',
      papers: [build(:paper)]
    }
  end

  let(:invalid_attributes) do
    {
      first_name: nil,
      last_name: 's',
      homepage: 'not a url',
      papers: nil
    }
  end

  describe "GET #index" do
    it "returns a success response" do
      Author.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end

    render_views
  end

  describe "GET #show" do
    it "returns a success response" do
      author = Author.create! valid_attributes
      get :show, params: {id: author.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      author = Author.create! valid_attributes
      get :edit, params: {id: author.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Author" do
        expect {
          post :create, params: {author: valid_attributes}
        }.to change(Author, :count).by(1)
      end

      it "redirects to the created author" do
        post :create, params: {author: valid_attributes}
        expect(response).to redirect_to(Author.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {author: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          first_name: 'New First Name',
          last_name: 'New Last Name',
          homepage: 'https://example2.com',
          papers: [Paper.new(title: 'A Book', venue: 'A City', year: 1324)]
        }
      end

      it "updates the requested author" do
        author = Author.create! valid_attributes
        put :update, params: {id: author.to_param, author: new_attributes}
        author.reload
        expect(author.first_name).to eq(new_attributes[:first_name])
        expect(author.last_name).to eq(new_attributes[:last_name])
        expect(author.homepage).to eq(new_attributes[:homepage])
      end

      it "redirects to the author" do
        author = Author.create! valid_attributes
        put :update, params: {id: author.to_param, author: valid_attributes}
        expect(response).to redirect_to(author)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        author = Author.create! valid_attributes
        put :update, params: {
          id: author.to_param,
          author: invalid_attributes
        }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested author" do
      author = Author.create! valid_attributes
      expect {
        delete :destroy, params: { id: author.to_param }
      }.to change(Author, :count).by(-1)
    end

    it "redirects to the authors list" do
      author = Author.create! valid_attributes
      delete :destroy, params: { id: author.to_param }
      expect(response).to redirect_to(authors_url)
    end
  end
end
