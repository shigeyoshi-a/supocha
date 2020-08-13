class Post < ApplicationRecord
  validates :name, :discipline, :place, :time, :price, :age, :level, presence: true
  belongs_to :user
  has_many :messages
  mount_uploader :image, ImageUploader
end
