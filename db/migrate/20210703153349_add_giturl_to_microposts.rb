class AddGiturlToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :profile, :text
  end
end
