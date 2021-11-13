require "test_helper"

class StudentTest < ActiveSupport::TestCase

  def setup
    @student = Student.new(last_name: "江崎", first_name: "雅彦",
       sex: "man", school_year: 6, class_num: 2, attendance_number: 6,
        seats_number: 2)
  end

  test "should be valid" do
    assert @student.valid?
  end

  # 存在性チェック
  test "last_name should be present" do
    @student.last_name = " "
    assert_not @student.valid?
  end

  test "first_name should be present" do
    @student.first_name = " "
    assert_not @student.valid?
  end

  test "sex should be present" do
    @student.sex = " "
    assert_not @student.valid?
  end

  test "school_year should be present" do
    @student.school_year = " "
    assert_not @student.valid?
  end

  test "class_num should be present" do
    @student.class_num = " "
    assert_not @student.valid?
  end

  test "attendance_num should be present" do
    @student.attendance_number = " "
    assert_not @student.valid?
  end

  # 長さチェック
  test "last_name should be too long" do
    @student.last_name = "a" * 26
    assert_not @student.valid?
  end

  test "first_name should be too long" do
    @student.first_name = "a" * 26
    assert_not @student.valid?
  end
  
  test "sex should be too long" do
    @student.sex = "a" * 6
    assert_not @student.valid?
  end
  
  test "school_year should be too large" do
    @student.school_year = 7
    assert_not @student.valid?
  end
  
  test "class_num should be too large" do
    @student.class_num = 11
    assert_not @student.valid?
  end
  
  test "attendance_number should be too large" do
    @student.attendance_number = 51
    assert_not @student.valid?
  end
  
  # test "seats_number should be too large" do
    # @student.seats_number = 51
    # assert_not @student.valid?
  # end
  
end
