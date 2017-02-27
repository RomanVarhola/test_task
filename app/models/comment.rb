class Comment < ApplicationRecord
	validates :description, presence:true

	belongs_to :articles
	belongs_to :users
end
