class ChangeFromPhotoToUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :photo, :url
  end
end
