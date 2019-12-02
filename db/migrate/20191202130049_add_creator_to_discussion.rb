class AddCreatorToDiscussion < ActiveRecord::Migration[6.0]
  def change
    add_column :discussions, :creator, :string
  end
end
