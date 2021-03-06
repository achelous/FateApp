class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
    # t.column :call_num, :integer     #thinking this might not be needed.
      t.column :name, :string
      t.column :location_text, :string
      t.column :description, :text
      t.column :iam, :integer
      t.column :youare, :integer
      t.column :upfor, :integer
      t.column :secret_key, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
