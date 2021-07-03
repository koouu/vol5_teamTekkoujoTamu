class AddGitToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :giturl, :text
  end
end
