class AddUserIdToSquares < ActiveRecord::Migration[6.0]
  def change
    add_column :squares, :user_id, :integer
  end
end
