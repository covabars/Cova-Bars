class CreateRolesUsersJoin < ActiveRecord::Migration
  def self.up
    create_table :roles_users, :id => false do |t|
      t.column :role_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
    end
    admin_user = User.create(:username => 'Administrator',
                             :email => 'chris@nomoreart.co.uk',
                             :profile => 'This is me, the admin.',
                             :password => 'diabl0',
                             :password_confirmation => 'diabl0')
    admin_role = Role.find_by_name('Administrator')
    admin_user.roles << admin_role
  end

  def self.down
    drop_table :roles_users
    User.find_by_username('Admin').destroy
  end
end