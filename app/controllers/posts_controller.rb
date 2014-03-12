class PostsController < ApplicationController

   def new
   
    @post = Post.new

   end

   def create
     
     #@post = Post.new(params[:post])
     @post = Post.new(post_params)
   if   @post.save
     redirect_to @post
   else
     render 'new'
   end
     #render({text: params[:post].inspect})
   end

   # the private function means that only the create method can access it. Can't be
   # modified outside these values
  
   def show
     @post = Post.find(params[:id])
   end

   def index
     @posts = Post.all

   end
 # Make sure that all methods defined within this controller come above the private method
 # otherwise it will not work
private
  def post_params
    params.require(:post).permit(:title, :text)
  end

  
  
end

