class AddUserTokenAuth < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.token_authenticatable
    end

  end

  def self.down
  end
end
