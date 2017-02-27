require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:article_attr) {FactoryGirl.attributes_for(:article)}
  
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "valid user" do
    before do
      sign_in(user)
    end
    
    describe "GET show" do
      before do
        @articles = (0..2).map{user.articles.create! article_attr}
        @articles = Article.find(@articles.map(&:id))
      end
      it "assigns the articles" do
        get :show, {id:user.id}
        expect(assigns(:articles).map(&:id).sort).to  match(@articles.map(&:id).sort)
      end
    end

    describe "GET my_profile" do
      before do
        @articles = (0..2).map{user.articles.create! article_attr}
        @articles = Article.find(@articles.map(&:id))
      end
      it "assigns the articles" do
        get :show, {id:user.id}
        expect(assigns(:articles).map(&:id).sort).to  match(@articles.map(&:id).sort)
      end
    end
  end
end
