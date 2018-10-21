class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
      $student_islogged_in = false
      $teacher_islogged_in = false
      $school_islogged_in = false
      $logger_id = 0
  end

  # GET /students/1
  # GET /students/1.json
  def show
      if $student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == @student.id
         else
         redirect_to studentlogin_url
        end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
      if $student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == @student.id
          else
          redirect_to studentlogin_url
      end
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @stud = Student.where(email: @student.email)
    @teach = Teacher.where(email: @student.email)
    @sch = School.where(email: @student.email)
    respond_to do |format|
        if not @student.firstname
            format.html { redirect_to students_path, notice: 'First Name cannot be empty' }
            format.json { render json: @student.errors, status: :unprocessable_entity }
            elsif not @student.lastname
            format.html { redirect_to students_path, notice: 'Last Name cannot be empty' }
            format.json { render json: @student.errors, status: :unprocessable_entity }
            elsif not @student.email
            format.html { redirect_to students_path, notice: 'Email cannot be empty' }
            format.json { render json: @student.errors, status: :unprocessable_entity }
            elsif not @student.password
            format.html { redirect_to students_path, notice: 'Password cannot be empty' }
            format.json { render json: @student.errors, status: :unprocessable_entity }
            elsif not @student.school
            format.html { redirect_to students_path, notice: 'Select One School' }
            format.json { render json: @student.errors, status: :unprocessable_entity }
            else
                if @stud.length == 0 and @teach.length == 0 && @sch.length == 0
                    if @student.save
                        format.html { redirect_to @student, notice: 'Student was successfully created.' }
                        format.json { render :show, status: :created, location: @student }
                        $student_islogged_in = true
                        $teacher_islogged_in = false
                        $school_islogged_in = false
                        $logger_id = @student.id
                        else
                        format.html { render :new }
                        format.json { render json: @student.errors, status: :unprocessable_entity }
                    end
                    else
                    format.html { redirect_to students_path, notice: 'User Exists' }
                    format.json { render json: @student.errors, status: :unprocessable_entity }
      
                end
            end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == @student.id
        respond_to do |format|
            if @student.update(student_params)
                format.html { redirect_to @student, notice: 'Student was successfully updated.' }
                format.json { render :show, status: :ok, location: @student }
                else
                format.html { render :edit }
                format.json { render json: @student.errors, status: :unprocessable_entity }
            end
        end
    else
    redirect_to student_session_path
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:firstname, :lastname, :email, :password, :password_confirmation, :school)
    end
end
