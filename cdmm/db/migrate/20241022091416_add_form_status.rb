class AddFormStatus < ActiveRecord::Migration[7.2]
  def change
    add_column :evaluations, :form_status, :string
    add_index :evaluations, :form_status, unique: false
  end
end
