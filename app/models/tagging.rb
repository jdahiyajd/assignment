class Tagging < ApplicationRecord
  belongs_to :user_file_tag
  belongs_to :user_file
end
