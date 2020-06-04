class CommentsController < ApplicationController
    before_action :find_post

    def new
        @comment = Comment.new
    end

    def create
        # @comment = @post.comments.build(comment_params)
        # @comment.user_id = current_user.id

        @comment = @post.comments.new(comment_params)
        @comment.user_id = current_user.id
        
        @comment.save
        
        redirect_to post_path(@post)
    end

    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:text)
    end
end