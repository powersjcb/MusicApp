# == Schema Information
#
# Table name: tracks
#
#  id             :integer          not null, primary key
#  album_id       :integer          not null
#  name           :string           not null
#  lyrics         :text             not null
#  is_bonus_track :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Track < ActiveRecord::Base
  validates :album_id, :name, :lyrics, :is_bonus_track, presence: true
  validates :name, length: { maximum: 255 }
  validates :lyrics, length: { maximum: 16383 }

  belongs_to :album
  has_one(
    :songwriter,
    through: :album,
    source: :band
  )

end
