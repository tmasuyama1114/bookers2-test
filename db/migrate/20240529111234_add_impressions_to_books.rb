class AddImpressionsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :impressions, :integer, default: 0
  end
end
