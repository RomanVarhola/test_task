require 'rails_helper'

RSpec.describe Article, type: :model do
  
  it "has a valid factory" do
    expect(build(:article)).to be_valid
  end

  it "requires a name" do
    expect(build(:article,title:'')).to_not be_valid
  end

  it "requires a unique name for this user" do
    article = create(:article)
    article_user = create(:user)
    expect(build(:article,title:article.title,user_id:article_user.id)).to be_valid
  end

  it "does not require unique name across users" do
    article = create(:article)
    another_user = create(:user)
    expect(build(:article, title:article.title, user_id:another_user)).to be_valid
  end
end
