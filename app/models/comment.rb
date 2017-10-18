class Comment < ApplicationRecord
	validates :description, presence: true

	belongs_to :article
	belongs_to :user
end
