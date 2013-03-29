class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :state
      t.timestamps
    end
  end
end
