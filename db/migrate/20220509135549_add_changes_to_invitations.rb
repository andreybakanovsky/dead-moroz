class AddChangesToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :user_name, :string
    change_column_null :invitations, :email, false
    remove_reference :invitations, :user, foreign_key: true, index: false
  end
end
