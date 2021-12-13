class ChangeReferenceToReviews < ActiveRecord::Migration[6.1]
  def change
    change_table :reviews do |t|
      t.remove_references :imageable, polymorphic: true
      t.references :good, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
