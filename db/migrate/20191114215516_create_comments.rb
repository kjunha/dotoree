class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.datetime :date
      t.integer :discussion_id

      t.timestamps
    end
  end
end
