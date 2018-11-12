class CheckerController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        
        @post = Post.find(params[:id2])
        @teacher = Teacher.find(params[:id])
        @student = Student.find(@post.stud_id)
    end
    
end
