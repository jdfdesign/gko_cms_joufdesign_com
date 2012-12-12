# This migration comes from gko_portfolio (originally 20120827070300)
class ChangePolymorphicTypeForGallery < ActiveRecord::Migration
  def up
    if table_exists?(:features)
      connection.execute("UPDATE features SET owner_type='Portfolio' WHERE owner_type='GalleryList'")
      connection.execute("UPDATE features SET owner_type='Project' WHERE owner_type='Gallery'")
    end
    if table_exists?(:categorizations)
      connection.execute("UPDATE categorizations SET categorizable_type='Portfolio' WHERE categorizable_type='GalleryList'")
      connection.execute("UPDATE categorizations SET categorizable_type='Project' WHERE categorizable_type='Gallery'")
    end
    if table_exists?(:stickings)
      connection.execute("UPDATE stickings SET stickable_type='Portfolio' WHERE stickable_type='GalleryList'")
      connection.execute("UPDATE stickings SET stickable_type='Project' WHERE stickable_type='Gallery'")
    end
    
    connection.execute("UPDATE sections SET link_type='Portfolio' WHERE link_type='GalleryList'")
    connection.execute("UPDATE sections SET link_type='Project' WHERE link_type='Gallery'")
  end
end