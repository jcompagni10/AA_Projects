class CatRentalRequestsController < ApplicationController

  def new
    render :new
  end

  def create
    rental = CatRentalRequest.new(rental_params)
    if rental.save
      redirect_to cats_url
    else
      redirect_to new_cat_rental_request_url
      # render json: rental.errors.full_messages
    end
  end

  def deny
    crr = CatRentalRequest.find_by(id: params[:id])
    crr.deny!
    redirect_to cats_url
  end

  def approve
    crr = CatRentalRequest.find_by(id: params[:id])
    crr.approve!
    redirect_to cats_url
  end

  private
    def rental_params
      params.require(:rental).permit(:cat_id, :start_date, :end_date)
    end

end
