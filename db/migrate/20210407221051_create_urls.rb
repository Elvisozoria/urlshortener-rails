class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :origial_url
      t.string :shorted_url, unique: true
      t.integer :clicked

      t.timestamps
    end
  end
end
