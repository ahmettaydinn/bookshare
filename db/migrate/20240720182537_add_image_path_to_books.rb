class AddImagePathToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :image_path, :string
  end
end
