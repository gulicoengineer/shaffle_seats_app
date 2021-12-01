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

  # 座席番号を保存
  def save_seats_order
    students = params[:_json]
    students.sort_by!{|a| a[:id]}
    classmates = Student.where("school_year = ? AND class_num = ?",
      students.first[:school_year], students.first[:class_num]).order(:id)
    students.each_with_index {|student, index|
      if classmates[index].update(seats_number: student[:seats_number])
      else
        render body: nil, status: 201
      end

    }


      render body: nil, status: 200
    # debugger
    

  end

	private
    def student_params
      params.require(:student).permit(:last_name, :first_name,
         :sex, :school_year, :class_num, :attendance_number, :seats_number)
    end

end
