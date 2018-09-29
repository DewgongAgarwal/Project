class SchoolViewTeacherPostsController < ApplicationController
    before_action :set_post, only: [:show]
    def show
        @teachers = Teacher.where(school: @school.id)
        @status = Status.all
    end
    
    def set_post
        @school = School.find(params[:id])
    end
    
end
