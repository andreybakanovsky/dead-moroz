class AddImagesToGifts < ActiveRecord::Migration[6.1]
  def change
    add_column :gifts, :images, :json
  end
end
