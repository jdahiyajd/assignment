class UserFileTag < ApplicationRecord
  has_many :taggings
  has_many :user_files, through: :taggings
end
