module ApplicationHelper
	# 男女の色替え
	def gender_color(gender)
		if gender == "男"
			"color:#00CCFF"
		else
			"color:#FF0033"
		end
	end
end
