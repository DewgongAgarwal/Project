class SchoolViewStudentPostsController < ApplicationController
    before_action :set_post, only: [:show]
    def show
        @students = Student.where(school: @school.id)
        @status = Status.all
    end
    
    def set_post
        @school = School.find(params[:id])
    end
end
