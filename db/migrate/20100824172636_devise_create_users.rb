class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :full_name
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true

    user = User.new(
        :full_name => "Admin pass(administrator)",
        :email => "admin@email.com",
        :password => "administrator",
        :password_confirmation => "administrator"
    )
    raise user.errors.full_messages unless user.save
  end

  def self.down
    drop_table :users
  end
end
