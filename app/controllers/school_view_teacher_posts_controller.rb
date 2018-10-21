class SchoolViewTeacherPostsController < ApplicationController
    before_action :set_post, only: [:show]
    def show
        if not $student_islogged_in and not $teacher_islogged_in and $school_islogged_in and $logger_id == params[:id]
            @teachers = Teacher.where(school: @school.id)
            @status = Status.all
            
            else
            redirect_to schoollogin_url
            
        end
    end
    
    def set_post
        @school = School.find(params[:id])
    end
    
    def verified
        if not $student_islogged_in and not $teacher_islogged_in and $school_islogged_in and $logger_id == params[:id]
            post = Post.find(params[:id2])
            post.status = 3
            post.save
            redirect_to school_view_teacher_post_path(params[:id])
            else
            redirect_to schoollogin_url
            
        end
    end
    
    def rejected
         if not $student_islogged_in and not $teacher_islogged_in and $school_islogged_in and $logger_id == params[:id]
        
            post = Post.find(params[:id2])
            post.status = 5
            post.save
            redirect_to school_view_teacher_post_path(params[:id])
        
        else
        redirect_to schoollogin_url
        
        end
        
    end

end
