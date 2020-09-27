class Post < ApplicationRecord
  belongs_to :user
  belongs_to :famille	
  has_one_attached :clip
  validates :titre, presence: true
  validates :contenu, presence: true
  validates :famille, presence: true
  include ImageUploader::Attachment.new(:image)
  
  
end
