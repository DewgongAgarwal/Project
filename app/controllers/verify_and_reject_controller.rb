class VerifyAndRejectController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def signed
   
        if params[:id3].to_i == 1
            post = Post.find(params[:id2])
        else
            post = TeacherPost.find(params[:id2])
        end
        post.status = params[:status]
        post.sign_id = params[:key]
        post.signature = params[:signature]
        post.save
  
    end
end
