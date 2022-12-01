class AddHowHeardToRegistrations < ActiveRecord::Migration[7.0]
  def change
    add_column :registrations, :how_heard, :string
  end
end
