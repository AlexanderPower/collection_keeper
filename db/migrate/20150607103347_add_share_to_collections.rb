class AddShareToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :share, :boolean, default: false
  end
end
