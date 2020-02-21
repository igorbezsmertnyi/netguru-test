class CreateTopComments < ActiveRecord::Migration[5.2]
  def change
    create_table :top_comments do |t|
      t.references :user, foreign_key: true
      t.integer :count, default: 0, null: false

      t.timestamps
    end
  end
end
