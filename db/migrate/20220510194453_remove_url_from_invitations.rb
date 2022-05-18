class RemoveUrlFromInvitations < ActiveRecord::Migration[6.1]
  def change
    remove_column :invitations, :url, :text
  end
end
