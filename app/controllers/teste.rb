#!/usr/bin/env ruby
class Teste < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../controllers")

require "open-uri"
require "hpricot"
require "produtos_controller"

site  = Hpricot(open("http://www.americanas.com.br/linha/350392/celulares-e-telefones/smartphone?ofertas.limit=7"))
box   = site.search(".has-invoiceprice")
quant = box.count
loja  = 1

puts "Quantidade de produtos"
puts quant


def crawler(site, quant, loja, box)
	for i in 0..quant-1
		begin
			nome  = box[i].search(".prodTitle").attr('title')
			preco = box[i].search(".sale.price strong .product-price-integer").text
			url   = box[i].search(".productImg .url").attr('href')
			
	    	raise "Produto #{i}: #{nome.split[0] + " " + nome.split[1]}"
	   		rescue Exception => e
	   			puts e.message
	    end
		Produto.create(nome: nome, preco: preco, url: url, loja_id: loja)
	end
end

crawler(site, quant, loja, box)


puts "Rake com sucesso!!!"
end