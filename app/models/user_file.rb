class UserFile < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_many :taggings
  has_many :user_file_tags, through: :taggings

  def self.tagged_with(name)
    UserFileTag.find_by!(name: name).user_files
  end

  def self.tag_counts
    UserFileTag.select('user_file_tags.*, count(taggings.user_file_tag_id) as count').joins(:taggings).group('taggings.user_file_tag_id')
  end

  def tag_list
    user_file_tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.user_file_tags = names.split(',').map do |n|
      UserFileTag.where(name: n.strip).first_or_create!
    end
  end
  
end
