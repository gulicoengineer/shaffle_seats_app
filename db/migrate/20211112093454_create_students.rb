class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.string :sex
      t.integer :school_year
      t.integer :class
      t.integer :attendance_number
      t.integer :seats_number

      t.timestamps
    end
  end
end
