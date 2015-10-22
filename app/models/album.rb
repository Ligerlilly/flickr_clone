class Album < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
