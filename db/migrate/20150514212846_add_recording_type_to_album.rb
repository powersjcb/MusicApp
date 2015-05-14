class AddRecordingTypeToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :studio_recording, :boolean, null: false
  end
end
