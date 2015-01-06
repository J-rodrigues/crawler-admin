class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :preco
      t.string :url
      t.string :loja_id
      t.string :categoria_id
      
      t.timestamps
    end
  end
end
