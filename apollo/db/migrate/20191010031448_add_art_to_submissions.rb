class AddArtToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :art, :string
  end
end
