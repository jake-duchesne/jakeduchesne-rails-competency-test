class RemoveUsernameFromArticle < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :username, :string
  end
end
