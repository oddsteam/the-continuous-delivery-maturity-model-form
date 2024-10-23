class AddFormTitle < ActiveRecord::Migration[7.2]
  def change
    add_column :evaluations, :title, :string
  end
end
