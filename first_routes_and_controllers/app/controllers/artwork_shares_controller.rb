class ArtworkSharesController < ApplicationController
    def create
        @artworkshare = ArtworkShare(artwork_share_pararms)
        if @artwork_share.save
            redirect artwork_share_url(@artwork_share)
        else
            rendor json: @artworkshare.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        
    end

    def artwork_share_pararms
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end