class PostsController < ApplicationController
    def show    
        @post = Post.find(params[:id])
    end

    def new    
        @post = Post.new
    end

    def create
        @post = Post.create
        redirect_to post_path(@post.id)
    end

    def edit
        @post = Post.find(params[:id])
    end

    def like
        @post = Post.find(params[:id])
        @post.likes +=1
        @post.save
        redirect_to post_path(@post.id)
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
end
