30.times do |n|
	l_name = "example-#{n}"
	f_name = "hoge-#{n}"
	sex = 
	if n % 2 == 0
		"男"
	else
		"女"
	end
	Student.create!(last_name: l_name, first_name: f_name, sex: sex,
	school_year: 1, class_num: 1, attendance_number: n)
end