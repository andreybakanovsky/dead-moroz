class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :deads_choice, default: false
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
