class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.references :song, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
