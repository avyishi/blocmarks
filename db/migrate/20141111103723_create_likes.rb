class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :bookmark
      t.references :user

      t.timestamps
    end
  end
end
