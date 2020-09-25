class AddApplicationRoles < ActiveRecord::Migration[6.0]
  def up
    ['admin', 'author', 'reviewer'].each do |role_name|
    Role.create! name: role_name
    end
  end

  def down
    Role.where(name: ['admin', 'author', 'reviewer']).destroy_all
  end
end
