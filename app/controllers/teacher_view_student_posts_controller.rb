class TeacherViewStudentPostsController < ApplicationController
    before_action :set_post, only: [:show]
    def show
        if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id
            @students = Student.where(school: @teacher.school)
            @status = Status.all
        else
        redirect_to teacherlogin_url
        end
        
    end
    
    def set_post
        @teacher = Teacher.find(params[:id])
    end
    
    def verified
        if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == params[:id]
            post = Post.find(params[:id2])
            post.status = 3
            post.save
            redirect_to teacher_view_student_post_path(params[:id])
            else
            redirect_to teacherlogin_url
        end
    end
    
    def rejected
        if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == params[:id]
            post = Post.find(params[:id2])
            post.status = 5
            post.save
            redirect_to teacher_view_student_post_path(params[:id])
            else
            redirect_to teacherlogin_url
        end
    end
    
end
