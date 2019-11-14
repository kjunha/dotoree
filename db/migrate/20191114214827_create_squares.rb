class CreateSquares < ActiveRecord::Migration[6.0]
  def change
    create_table :squares do |t|
      t.string :name
      t.string :detail

      t.timestamps
    end
  end
end
