class AddFamilleToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :famille, null: false, foreign_key: true
  end
end
