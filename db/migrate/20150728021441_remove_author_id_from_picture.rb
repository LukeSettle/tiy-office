class RemoveAuthorIdFromPicture < ActiveRecord::Migration
  def change
    remove_column :pictures, :author_id, :integer
  end
end
