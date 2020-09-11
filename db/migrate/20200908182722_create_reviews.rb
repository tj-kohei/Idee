class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :idea_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
