class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :singer
      t.string :key
      t.string :source
      t.string :video_url
      t.text :lyrics
      t.string :sheet

      t.timestamps
    end
  end
end
