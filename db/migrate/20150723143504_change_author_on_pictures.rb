class ChangeAuthorOnPictures < ActiveRecord::Migration
  def change
  	remove_column :pictures, :author
  	add_reference :pictures, :author
  end
end
