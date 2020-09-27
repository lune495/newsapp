class AddVideoyoutubeToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :videoyoutube, :text
  end
end
