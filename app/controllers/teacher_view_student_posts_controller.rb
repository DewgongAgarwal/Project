class TeacherViewStudentPostsController < ApplicationController
     before_action :set_post, only: [:show]
    def show
        @students = Student.where(school: @teacher.school)
        @status = Status.all
    end
    
    def set_post
        @teacher = Teacher.find(params[:id])
    end
    
end
