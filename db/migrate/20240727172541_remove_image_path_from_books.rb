class RemoveImagePathFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :image_path, :string
  end
end
