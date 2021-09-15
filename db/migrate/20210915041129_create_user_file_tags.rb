class CreateUserFileTags < ActiveRecord::Migration[6.0]
  def change
    create_table :user_file_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
