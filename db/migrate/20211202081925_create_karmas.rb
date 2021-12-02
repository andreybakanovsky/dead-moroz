class CreateKarmas < ActiveRecord::Migration[6.1]
  def change
    create_table :karmas do |t|
      t.integer :value, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
