class CreateDiscussions < ActiveRecord::Migration[6.0]
  def change
    create_table :discussions do |t|
      t.text :body
      t.datetime :date
      t.integer :square_id

      t.timestamps
    end
  end
end
