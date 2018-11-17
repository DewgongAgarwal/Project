class CheckerController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if params[:id3].to_i == 1
            
            @post = Post.find(params[:id2])
            @sign = @post.studentSign
            @person = Student.find(@post.stud_id)
            
        else
            @post = TeacherPost.find(params[:id2])
            @sign = @post.teacherSign
            @person = Teacher.find(@post.teacher_id)
        end
        if params[:id4].to_i == 1
            @signer = Teacher.find(params[:id])
        else
            @signer = School.find(params[:id])
        end
    end
    
end
