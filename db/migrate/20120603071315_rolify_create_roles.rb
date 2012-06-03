class RolifyCreateRoles < ActiveRecord::Migration
  def self.up
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:roles, :name)
    add_index(:roles, [:name, :resource_type, :resource_id])
    add_index(:users_roles, [:user_id, :role_id])
  end

  def self.down
    remove_index(:roles, :name)
    remove_index(:roles, [:name, :resource_type, :resource_id])
    remove_index(:users_roles, [:user_id, :role_id])
    drop_table :roles
    drop_table :users_roles
  end
end
