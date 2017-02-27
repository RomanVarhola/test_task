class AddAvatarToArticles < ActiveRecord::Migration
  def up
    add_attachment :articles, :avatar
  end

  def down
    remove_attachment :articles, :avatar
  end
end
