class AddBaseTotalToStats < ActiveRecord::Migration[7.0]
  def change
    add_column :stats, :base_total, :integer
  end
end
