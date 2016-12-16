class User < ActiveRecord::Base
    has_secure_password
    has_many :songs
    has_many :playlist
    has_many :songs_added_to_playlist, through: :playlist, source: :song
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, :email, presence: true
    validates :password, on:create, presence: true
    validates :password, on:create, length: { minimum: 6 }
    validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
