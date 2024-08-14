class CreateBooksCategoriesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :books, :categories do |t|
      t.index :book_id
      t.index :category_id
    end
  end
end
