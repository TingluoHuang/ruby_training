class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :facebook_likes
      t.string :year
      t.string :plot_keyworks
      t.string :director
    end
  end
end
