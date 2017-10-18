class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments

  has_attached_file :avatar, styles: { medium: "500x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
