class AddCreatorToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :creator, :string
  end
end
