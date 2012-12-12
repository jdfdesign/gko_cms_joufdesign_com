# This migration comes from gko_portfolio (originally 20120826122500)
class RenameGalleryToPortfolio < ActiveRecord::Migration
  def up
    connection.execute("UPDATE sections SET type='Portfolio' WHERE type='GalleryList'")
    connection.execute("UPDATE contents SET type='Project' WHERE type='Gallery'")
  end
end