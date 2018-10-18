class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :role, index: true
  end
end
