class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    user_ids = current_user.timeline_user_ids
    @posts = Post.where(user_id: user_ids).order("created_at DESC")
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def latest
    @latest_post = Post.last
  end
  helper_method :latest
  # in view use <%= latest %> etc. To get the link you have to use:
  #  <a href="<%= root_url %><%= latest.id %>">link</a>, this makes sense for a sidebar/widget area
  #  this is an ungodly hack just for fun....
  
end
