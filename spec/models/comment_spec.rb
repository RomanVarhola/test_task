require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  it "has a valid factory" do
    expect(build(:comment)).to be_valid
  end

  it "requires a name" do
    expect(build(:comment,description:'')).to_not be_valid
  end

  it "requires a unique name for this user" do
    article = create(:article)
    comment = create(:comment)
    content_user = create(:user)
    expect(build(:comment,description:comment.description,user_id:content_user.id, article_id: article.id)).to be_valid
  end

  it "does not require unique name across users" do
    article = create(:article)
    another_user = create(:user)
    expect(build(:article, title:article.title, user_id:another_user)).to be_valid
  end

end
