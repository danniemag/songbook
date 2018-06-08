class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name,     null: false, default: ""
      t.string :singer
      t.string :key,      limit: 2
      t.string :source
      t.string :video_url
      t.text :lyrics
      t.string :sheet

      t.timestamps
    end
  end
end
