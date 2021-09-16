class AddSlugToUserFiles < ActiveRecord::Migration[6.0]
  def change
    add_column :user_files, :slug, :string
  end
end
