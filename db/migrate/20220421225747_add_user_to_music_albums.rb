class AddUserToMusicAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :music_albums, :user_id, :integer
  end
end
