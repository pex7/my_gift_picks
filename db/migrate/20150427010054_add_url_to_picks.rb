class AddUrlToPicks < ActiveRecord::Migration
  def change
  	add_column :picks, :url, :string
  end
end
