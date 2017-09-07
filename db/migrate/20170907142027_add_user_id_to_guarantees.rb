class AddUserIdToGuarantees < ActiveRecord::Migration[5.0]
  def change
    add_column :guarantees, :user_id, :integer
  end
end
