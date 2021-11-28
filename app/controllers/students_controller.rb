class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def index
    @students = Student.all
  end

  def create
    # 登録情報を取得
    @student = Student.new(student_params)
    # 登録者と同じクラスの生徒情報を取得
    classmates = Student.where("school_year = ? AND class_num = ?",
       @student[:school_year], @student[:class_num])
    # 座席番号の登録
    # 新規クラスの登録の場合
    if classmates.empty?
      @student[:seats_number] = 0
    # 既存クラスへの登録の場合
    else
      @student[:seats_number] = classmates.max_by{|a| a[:seats_number]} + 1
    end
    if @student.save
      flash[:success] = "「#{@student.last_name}」さんを登録しました！"
      redirect_to new_student_path
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def save_seats_order
    
  end

	private
    def student_params
      params.require(:student).permit(:last_name, :first_name,
         :sex, :school_year, :class_num, :attendance_number, :seats_number)
    end

end
