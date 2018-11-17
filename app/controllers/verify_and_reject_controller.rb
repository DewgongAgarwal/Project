class VerifyAndRejectController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def signed
        
        puts (not $student_islogged_in)
        puts ($teacher_islogged_in)
        puts ($school_islogged_in)
        puts ($logger_id.to_i == params[:id].to_i)
        
        if (not $student_islogged_in) and ($teacher_islogged_in or $school_islogged_in) and $logger_id.to_i == params[:id].to_i
            if params[:id3].to_i == 1
                post = Post.find(params[:id2])
            else
                post = TeacherPost.find(params[:id2])
            end
            post.status = params[:status]
            post.sign_id = params[:id]
            post.signature = params[:signature]
            post.save
            
            if params[:id3].to_i == 1
                if params[:id4].to_i == 1
                    redirect_to teacher_view_student_post_path(params[:id])
                else
                    redirect_to school_view_student_post_path(params[:id])
                end
            else
                redirect_to school_view_teacher_post_path(params[:id])
            end
            
            else
            if params[:id4].to_i == 1
                redirect_to teacherlogin_url
                else
                redirect_to schoollogin_url
                end
        end
    end
end
