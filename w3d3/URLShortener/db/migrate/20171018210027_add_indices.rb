class AddIndices < ActiveRecord::Migration[5.1]
  def change
    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :long_url
  end
end
