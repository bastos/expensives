ActiveRecord::Base.establish_connection(
   :adapter   => 'postgresql',
   :database  => ENV['DATABASE_URL'] || './db/expensive.db'
)

ActiveRecord::Migration.class_eval do
  unless Post.table_exists?
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :subtitle, :null => false
      t.string :image_url, :null => false
      t.string :slug, :null => false
    end
    # add_index :posts, :slug
  end
end