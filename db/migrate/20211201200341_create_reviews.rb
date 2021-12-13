class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :grade, null: false
      t.text :comment
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
