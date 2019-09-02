class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
      @students = Student.where(school: @school.id)
      @teachers = Teacher.where(school: @school.id)      
  end

  def public_key_by_email
      render :json => School.find_by(email: params[:email]).keys
      end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end
    
end
