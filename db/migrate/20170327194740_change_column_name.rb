class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :image, :fileimg
  end
end
