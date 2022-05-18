class AddDigestToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :digest, :string
  end
end
