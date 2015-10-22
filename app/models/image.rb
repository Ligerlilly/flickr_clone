class Image < ActiveRecord::Base
  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
  #validates :title, presence: true
  validates :pic, presence: true
  belongs_to :user
  belongs_to :album
  has_many :tags
  has_many :favorites
  has_many :comments, as: :commentable, dependent: :destroy
end
