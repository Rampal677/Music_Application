class CreateMusicAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :music_albums do |t|
      t.name :string,
      t.description :text,
      t.price :integer,
      t.publish :boolean,
      t.timestamps
    end
  end
end

