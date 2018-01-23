class Post < ApplicationRecord

	has_many :comments, dependent: :destroy
	has_many :reactions, dependent: :destroy

	belongs_to :user

	validates :content, presence: true
end
