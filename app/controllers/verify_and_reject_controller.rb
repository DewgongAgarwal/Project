class VerifyAndRejectController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def signed
        
        if (not $student_islogged_in) and ($teacher_islogged_in or $school_islogged_in) and $logger_id.to_i == params[:id].to_i
            if params[:id3].to_i == 1
                post = Post.find(params[:id2])
            else
                post = TeacherPost.find(params[:id2])
            end
            post.status = params[:status]
            post.sign_id = params[:key]
            post.signature = params[:signature]
            post.save

            
            
            else
            if params[:id4].to_i == 1
                redirect_to teacherlogin_url
                else
                redirect_to schoollogin_url
                end
        end
    end
end
