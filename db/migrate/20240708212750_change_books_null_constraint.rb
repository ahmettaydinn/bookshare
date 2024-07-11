class ChangeBooksNullConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :description, false
  end
end
