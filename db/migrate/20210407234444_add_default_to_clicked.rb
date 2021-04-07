class AddDefaultToClicked < ActiveRecord::Migration[6.0]
  def up
    change_column_default :urls, :clicked, default: 0
  end
  def down
    change_column_default :urls, :clicked, default: nil
  end
end
