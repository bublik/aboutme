class AddGooglePlusId < ActiveRecord::Migration
  def self.up
    add_column :users, :google_plus_id, :string
  end

  def self.down
    remove_column :users, :google_plus_id
  end
end
