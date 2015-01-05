class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.string :site_url
      t.string :css_box
      t.string :css_nome
      t.string :css_preco
      t.string :css_url
      t.string :loja_id
      t.string :loja_nome
      t.string :categoria_id
      t.string :categoria_nome
      
      t.timestamps
    end
  end
end
