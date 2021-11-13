class RenameStudentsClassColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :class, :class_num
  end
end
