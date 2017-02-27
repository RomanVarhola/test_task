require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do

    it "routes to #edit" do
      expect(:get => "/articles/1/comments/1/edit").to route_to("comments#edit",:article_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/articles/1/comments").to route_to("comments#create", :article_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/articles/1/comments/1").to route_to("comments#update",:article_id => "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/articles/1/comments/1").to route_to("comments#update",:article_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/articles/1/comments/1").to route_to("comments#destroy",:article_id => "1", :id => "1")
    end

  end
end
