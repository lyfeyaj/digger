#encoding: utf-8
class PostsController < ApplicationController

  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render post: @post}
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: :index, notice: '博客已经创建'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to action: :index, notice: '博客已修改'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to action: :index, notice: '博客已删除'
    end
  end

  private

  def post_params
    params[:post].permit(:title, :content)
  end
end
