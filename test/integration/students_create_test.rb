require "test_helper"

class StudentsCreateTest < ActionDispatch::IntegrationTest
  test "invalid created student infomation" do
    get students_new_path
    assert_no_difference 'Student.count' do
      post students_path, params:{ student: {last_name: "",
        first_name:"", sex:"", school_year:0, class_num:0,
        attendance_number:0}}
    end
    assert_template 'students/new'
  end

  test "valid created student infomation" do
    get students_new_path
    assert_difference 'Student.count' do
      post students_path, params:{ student: {last_name: "松山",
        first_name: "太郎", sex:"男", school_year:1, class_num:1,
        attendance_number:1}}
    end
    follow_redirect!
    assert_template 'students/new'
  end
end
