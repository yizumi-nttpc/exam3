class AddPictToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :pict, :string
  end
end
