class SubsController < ApplicationController
  before_action :require_login, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_sub, only: [:edit, :update, :show, :destroy]

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def edit
  end

  def update
    if @sub.moderator == current_user && @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to edit_sub_url(@sub)
    end
  end

  def show
  end

  def index
    @subs = Sub.all
  end

  def set_sub
    @sub = Sub.find_by(id: params[:id])
    redirect_to subs_url if @sub.nil?
  end

  def destroy
    @sub.delete if @sub.moderator == current_user
    redirect_to subs_url
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
