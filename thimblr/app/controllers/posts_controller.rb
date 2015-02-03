class PostsController < ApplicationController
  
  def index
    @posts = Post.all
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
