class CheckController < ApplicationController
  def index
      if params[:id2].to_i == 1
          @post = Post.find(params[:id])
          @link = post_path(params[:id3])
      else
        @post = TeacherPost.find(params[:id])
        @link = teacher_post_path(params[:id3])
      end
      
  end
end
