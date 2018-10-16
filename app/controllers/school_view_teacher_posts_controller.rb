class SchoolViewTeacherPostsController < ApplicationController
    before_action :set_post, only: [:show]
    def show
        @teachers = Teacher.where(school: @school.id)
        @status = Status.all
    end
    
    def set_post
        @school = School.find(params[:id])
    end
    
    def verified
        post = Post.find(params[:id2])
        post.status = 3
        post.save
        redirect_to school_view_teacher_post_path(params[:id])
    end
    
    def rejected
        post = Post.find(params[:id2])
        post.status = 5
        post.save
        redirect_to school_view_teacher_post_path(params[:id])
    end

end
