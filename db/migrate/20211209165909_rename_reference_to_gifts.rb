class RenameReferenceToGifts < ActiveRecord::Migration[6.1]
  def change
    change_table :gifts do |t|
      t.remove_references :imageable, polymorphic: true
      t.references :giftable, polymorphic: true
    end
  end
end
