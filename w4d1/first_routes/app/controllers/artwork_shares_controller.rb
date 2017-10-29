class ArtworkSharesController < ApplicationController

  def create
    artwork_share = ArtworkShare.new(share_params)
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork_share = ArtworkShare.find_by(id: params[:id])
    if artwork_share
      render json: artwork_share.destroy
    else
      render json: "no such share", status: :unprocessable_entity
    end
  end


private

  def share_params
    params.require(:share).permit(:artwork_id, :viewer_id)
  end

end
