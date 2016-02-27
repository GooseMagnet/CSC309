class AddBelongsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :belongs, :integer
  end
end
