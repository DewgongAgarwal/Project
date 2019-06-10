class SchoolViewStudentPostsController < ApplicationController
    before_action :set_post, only: [:show]
    def show
        @students = Student.find(params[:stud_id].to_i)

    end
    
    def set_post
        @school = School.find(params[:id])
    end
end
