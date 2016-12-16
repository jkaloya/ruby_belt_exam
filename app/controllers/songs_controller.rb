class SongsController < ApplicationController
    before_action :require_login, only: [:index, :create]

    def index
        @user = current_user
        @songs = Song.all
        @playlists = Playlist.all
    end

    def create
        @user = current_user
        @song = @user.songs.create( songs_params )
        if @song.save
            redirect_to "/songs"
        else
            initialize_flash
            flash[:errors] = @song.errors.full_messages
            redirect_to "/songs"
        end
    end

    def show
        @song = Song.find( params[:id] )
        @playlists = Song.find(params[:id]).playlist
    end

    private
    def songs_params
        params.require(:song).permit(:title, :artist, :user_id)
    end
end
