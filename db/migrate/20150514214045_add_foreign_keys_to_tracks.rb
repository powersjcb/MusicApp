class AddForeignKeysToTracks < ActiveRecord::Migration
  def change
    add_foreign_key(
      :tracks, :albums,
      on_delete: :cascade
    )
  end
end
