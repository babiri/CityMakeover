class AddFixpointToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :fixpoint, foreign_key: true
  end
end
