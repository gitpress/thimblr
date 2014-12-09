class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def latest
    @post = Post.last(:limit => 1)
  end
  helper_method :latest
  # in view use <%= latest %>
  
  
end
