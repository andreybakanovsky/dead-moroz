class ChangeFieldNameToInvitations < ActiveRecord::Migration[6.1]
  def change
    rename_column :invitations, :utl, :url
  end
end
