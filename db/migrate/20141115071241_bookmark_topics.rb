class BookmarkTopics < ActiveRecord::Migration
  def change
    create_table :bookmark_topics do |t|
      t.references :bookmark, index: true
      t.references :topic, index: true

      t.timestamps
    end
  end
end
