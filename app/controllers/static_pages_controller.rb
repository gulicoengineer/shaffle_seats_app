class StaticPagesController < ApplicationController

  def menu

  end

  def setting

  end

  def main
    @students = Student.where("school_year = ? AND class_num = ?",
       params[:school_year], params[:class_num]).order(:seats_number)
    # 指定クラスがない場合
    if @students.empty?
      flash.now[:warning] = "「#{params[:school_year]}-#{params[:class_num]}」に一人も生徒がいません。
      \n#{view_context.link_to '生徒の登録へ', new_student_path}".html_safe
      render '/static_pages/setting'
     # 指定クラスがある場合
    else
      # １テーブルの席数
      students_num = @students.size
      @table_line_standard_num = (students_num % 3) == 0 ? students_num / 3 : students_num / 3 + 1
      gon.students = @students
    end
    # debugger
  end


end
