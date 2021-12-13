class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.string :email
      t.date :expire_at
      t.text :utl
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
