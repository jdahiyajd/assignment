class CreateUserFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_files do |t|
      t.string :title
      t.string :desc
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
