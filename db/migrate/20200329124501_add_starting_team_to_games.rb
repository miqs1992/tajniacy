class AddStartingTeamToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :starting_team, :string, null: false, default: 'red'
  end
end
