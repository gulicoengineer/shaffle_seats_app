class Student < ApplicationRecord
	validates :last_name, presence: true, length: {maximum: 25}
	validates :first_name, presence: true, length: {maximum: 25}
	validates :sex, presence: true, length: {maximum: 5}
	validates :school_year, presence: true, numericality: {less_than: 7}
	validates :class_num, presence: true, numericality: {less_than: 11}
	validates :attendance_number, presence: true, numericality: {less_than: 51}
	validates :seats_number, presence: true, numericality: {less_than: 51}
end
