class Song < ActiveRecord::Base
    belongs_to :user
    has_many :playlist
    has_many :times_added_to_playlist, through: :playlist, source: :user
    validates :title, :artist, presence: true
    validates :title, :artist, length: { minimum: 2 }
end
