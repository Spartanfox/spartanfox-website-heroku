class ChangeDownloads < ActiveRecord::Migration[5.1]
  def change
    rename_column :downloads, :download, :download_url
  end
end
