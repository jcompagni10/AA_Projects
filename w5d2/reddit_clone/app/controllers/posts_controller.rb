class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  helper_method :all_comments

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def edit
  end

  def update
    if @post.author == current_user && @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_url(@post)
    end
  end

  def show
  end


  def set_post
    @post = Post.find_by(id: params[:id])
    redirect_to posts_url if @post.nil?
  end


  def all_comments
    post = Post.find(params[:id])
    @all_comments ||= post.comments.includes(:author, :children)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content,:parent_id, sub_ids: [])
  end


end
