$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../models")
require "open-uri"
require "hpricot"
require "crawler"
require "pry"

class Produto < ActiveRecord::Base
	belongs_to :dashboard

	def crawlerProdutos
		crawler = Crawler.new 
		qt_loja = crawler.qtloja
		crawler.truncateTableProd

		for l in 1..qt_loja
			puts ""
			puts "Coleta por url-Id: #{l}"
			id = l
			loja_id = crawler.find_by_id(id)
			boxP    = crawler.box(id)
			nomeP   = crawler.nome(id)
			precoP  = crawler.preco(id)
			urlP    = crawler.url(id)
			cat_id  = crawler.find_cat_by_url_id(id)
			quantP  = boxP.count

			for i in 0..quantP-1
				begin
					nome  = boxP[i].search(nomeP).attr('title')
					preco = boxP[i].search(precoP).text
					url   = boxP[i].search(urlP).attr('href')
					
			    	raise "Produto #{i}: #{nome}"
			   		rescue Exception => e
			   			puts e.message
			    end
			    if (preco == nil || preco == '' || preco == ' ' )
					puts "Sem preco: #{i}"
				else
					Produto.create(nome: nome, preco: preco, url: url, loja_id: id, categoria_id: cat_id)
				end
			end
		end
	end	
end
