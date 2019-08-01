class SchoolViewStudentPostsController < ApplicationController
    before_action :set_post, only: [:show]
    skip_before_action :verify_authenticity_token
    def show
        @students = Student.find(params[:stud_id].to_i)

    end
    
    def set_post
        @school = School.find(params[:id])
    end
end
