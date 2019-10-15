class Submission < ActiveRecord::Base
  mount_uploader :art, ArtUploader
  has_many :comments
  belongs_to :user
end