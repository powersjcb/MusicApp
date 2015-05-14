# == Schema Information
#
# Table name: albums
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  band_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  studio_recording :boolean          not null
#

class Album < ActiveRecord::Base
  validates :title, :band_id, :studio_recording, presence: true
  validates :title, length: { maximum: 255 }
  validates :title, uniqueness: { scope: :band_id }

  belongs_to :band
  has_many :tracks

end
