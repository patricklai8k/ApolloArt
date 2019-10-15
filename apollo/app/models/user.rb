class User < ActiveRecord::Base
  has_many :submissions
  has_many :comments
  has_secure_password validations: false
end
