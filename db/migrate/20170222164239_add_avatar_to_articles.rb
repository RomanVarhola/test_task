class AddAvatarToArticles < ActiveRecord::Migration[5.0]
  def up
    add_attachment :articles, :avatar
  end

  def down
    remove_attachment :articles, :avatar
  end
end
