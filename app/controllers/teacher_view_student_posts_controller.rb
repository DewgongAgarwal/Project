class TeacherViewStudentPostsController < ApplicationController
    before_action :set_post, only: [:show]
    def show
        @students = Student.where(school: @teacher.school)
        @status = Status.all
    end
    
    def set_post
        @teacher = Teacher.find(params[:id])
    end
    
    def verified
        post = Post.find(params[:id2])
        post.status = 3
        post.save
        redirect_to teacher_view_student_post_path(params[:id])
    end
    
    def rejected
        post = Post.find(params[:id2])
        post.status = 5
        post.save
        redirect_to teacher_view_student_post_path(params[:id])
    end
    
end
