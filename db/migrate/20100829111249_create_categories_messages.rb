class CreateCategoriesMessages < ActiveRecord::Migration
  def self.up
    create_table :categories_messages, :id => false do |t|
      t.integer :category_id
      t.integer :message_id

      t.timestamps
    end
  end

  def self.down
    drop_table :categories_messages
  end
end
