class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :direction
      t.references :voteable, polymorphic: true, index: true
      t.references :user

      t.timestamps null: false
    end
  end
end
