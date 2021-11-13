class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def index
  end
end
