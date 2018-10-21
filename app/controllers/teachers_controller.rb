class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

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
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id
          
            @students = Student.where(school: @teacher.school)
          
          else
          redirect_to teacherlogin_url
      end
      
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id
          else
          redirect_to teacherlogin_url
      end
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    @stud = Student.where(email: @teacher.email)
    @teach = Teacher.where(email: @teacher.email)
    @sch = School.where(email: @teacher.email)
    respond_to do |format|
    if not @teacher.firstname
        format.html { redirect_to teachers_path, notice: 'First Name cannot be empty' }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
    elsif not @teacher.lastname
        format.html { redirect_to teachers_path, notice: 'Last Name cannot be empty' }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
    elsif not @teacher.email
        format.html { redirect_to teachers_path, notice: 'Email cannot be empty' }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
    elsif not @teacher.password
        format.html { redirect_to teachers_path, notice: 'Password cannot be empty' }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
    elsif not @teacher.school
        format.html { redirect_to teachers_path, notice: 'Select One School' }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
    else
        if @stud.length == 0 and @teach.length == 0 and @sch.length == 0
            if @teacher.save
                format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
                format.json { render :show, status: :created, location: @teacher }
                $student_islogged_in = true
                $teacher_islogged_in = false
                $school_islogged_in = false
                $logger_id = @teacher.id
                else
                format.html { render :new }
                format.json { render json: @teacher.errors, status: :unprocessable_entity }
            end
            else
            format.html { redirect_to teachers_path, notice: 'User Exists' }
            format.json { render json: @teacher.errors, status: :unprocessable_entity }
            end
    end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
      if not student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @student.id
          respond_to do |format|
              if @teacher.update(teacher_params)
                  format.html { redirect_to @teacher, notice: 'Your Account was successfully updated.' }
                  format.json { render :show, status: :ok, location: @teacher }
                  else
                  format.html { render :edit }
                  format.json { render json: @teacher.errors, status: :unprocessable_entity }
              end
          end
          else
          redirect_to teacher_session_path
      end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:firstname, :lastname, :email, :password, :password_confirmation, :school)
    end
end
