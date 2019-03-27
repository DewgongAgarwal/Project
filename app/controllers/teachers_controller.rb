class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
#  respond_to :html, :js

  # GET /teachers
  # GET /teachers.json
  def index
      $student_islogged_in = false
      $teacher_islogged_in = false
      $school_islogged_in = false
      $logger_id = 0
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
      puts ($logger_id)
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id
          
            @students = Student.where(school: @teacher.school)
          
          else
          redirect_to teacherlogin_url
      end
      
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    @school = School.all
  end


  # POST /teachers
  # POST /teachers.json
  def create
      teacher = Teacher.new()
      teacher.email = params[:email]
      teacher.firstname = params[:firstname]
      teacher.lastname = params[:lastname]
      teacher.school = params[:school]
      teacher.keys = params[:keys]
      stud = Student.where(email: teacher.email)
      teach = Teacher.where(email: teacher.email)
      sch = School.where(email: teacher.email)
      
      if stud.length == 0 and teach.length == 0 && sch.length == 0
          if teacher.save
              $student_islogged_in = false
              $teacher_islogged_in = true
              $school_islogged_in = false
              $logger_id = teacher.id
              redirect_to teacher, notice: 'Teacher was successfully created.'
              else
              redirect_to teachers_path
          end
          else
          redirect_to teachers_path, notice: 'User Exists'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

end
