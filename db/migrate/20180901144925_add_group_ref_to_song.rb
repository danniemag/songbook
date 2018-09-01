class AddGroupRefToSong < ActiveRecord::Migration[5.2]
  def change
    add_reference :songs, :group, index: true, foreign_key: true
  end
end
