class AddTitleToUrls < ActiveRecord::Migration[6.0]
  def up
    rename_column :urls, :origial_url, :original_url
    rename_column :urls, :shorted_url, :shorten_url
    add_column :urls, :title, :text
  end
  def down
    rename_column :urls, :original_url, :origial_url
    rename_column :urls, :shorten_url, :shorted_url
    remove_column :urls, :title
  end
end
