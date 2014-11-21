class BookmarkTopics < ActiveRecord::Migration
  def change
    change_table :bookmarks do |t|
      t.integer :topic_id, index: true

      t.timestamps
    end
  end
end
