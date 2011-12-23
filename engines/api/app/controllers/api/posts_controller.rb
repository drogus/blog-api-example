class Api::PostsController < Api::ApplicationController
  def show
    respond_with Api::Post.find(params[:id])
  end

  def create
    respond_with Api::Post.create!(params[:post])
  end

  def index
    @posts = ::Post.paginate(:page => params[:page], :per_page => 10)
    respond_with Api::Collection.new(@posts, Api::Post)
  end
end
