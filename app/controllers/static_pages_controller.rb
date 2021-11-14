class StaticPagesController < ApplicationController
  def main
    @students = Student.first(30)
    # １テーブルの席数
    @table_line_standard_num = @students.size / 3
    gon.students = @students
    # debugger
  end
end
