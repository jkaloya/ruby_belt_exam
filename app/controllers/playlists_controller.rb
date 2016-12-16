class PlaylistsController < ApplicationController

    def create
        song = Song.find( params[:song_id] )
        add = Playlist.create(user: current_user, song: song)
        redirect_to "/songs"
    end

end
