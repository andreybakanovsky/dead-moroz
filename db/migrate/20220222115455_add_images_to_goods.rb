class AddImagesToGoods < ActiveRecord::Migration[6.1]
  def change
    add_column :goods, :images, :json
  end
end
