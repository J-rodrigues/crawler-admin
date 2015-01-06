class Crawler < ActiveRecord::Base

	require "open-uri"
	require "hpricot"
	require "pry"

	def truncateTableProd
		begin		
			ActiveRecord::Base.connection.execute("TRUNCATE table produtos")
			raise "TRUNCATE SUCESSO"
		   	rescue Exception => e
		   			puts e.message
		end
	end

	def qtloja
		@crawler = Crawler.all
		@crawler.count
	end

	def find_by_loja_id(loja_id)
    	@crawler = Crawler.where(:loja_id => loja_id)
 	end

 	def find_by_id(id)
    	@crawler = Crawler.where(:id => id)
    	return @crawler.first.loja_id
 	end

 	def find_cat_by_url_id(id)
    	@crawler = Crawler.where(:id => id)
    	return @crawler.first.categoria_id
 	end

	def box(id)
		find_by_id(id)
		uri  = @crawler.first.site_url
		site = Hpricot(open(uri))
		css  = @crawler.first.css_box
		box  = site.search(css)
		return box
	end

	def nome(id)
		find_by_id(id)
		css = @crawler.first.css_nome
		return css
	end

	def preco(id)
		find_by_loja_id(id)
		css = @crawler.first.css_preco
		return css
	end

	def url(id)
		find_by_id(id)
		css = @crawler.first.css_url
		return css
	end
end


