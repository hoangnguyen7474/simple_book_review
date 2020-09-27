class AddImageColumnsToBooks < ActiveRecord::Migration[6.0]
   def up
    add_attachment :books, :image
  end

  def down
    remove_attachment :books, :image
  end
end
