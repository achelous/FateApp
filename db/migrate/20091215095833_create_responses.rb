class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.column :post_id, :integer
      t.column :email, :string
      t.column :message, :text
      t.column :secret_key, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
