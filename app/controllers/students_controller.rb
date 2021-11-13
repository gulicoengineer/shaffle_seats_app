class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def index
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "「#{@student.last_name}」さんを登録しました！"
      redirect_to students_new_path
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  private
    def student_params
      params.require(:student).permit(:last_name, :first_name,
         :sex, :school_year, :class_num, :attendance_number)
    end
end
