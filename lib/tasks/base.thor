require File.expand_path('config/environment.rb')
require 'rake'

class Base < Thor::Group

  desc "Rebuilding database..."


  def config_database

    begin_rebuild = Time.now

    system "cd #{Rails.root}"
    system "kill $(ps -ef | grep pgadmin | grep -v grep | awk '{print $2}')"
    system "kill $(ps -ef | grep rails | grep -v grep | awk '{print $2}')"
    system "rake db:drop" rescue puts "failed to drop...the database exists?"
    system "rake db:create"
    system "rake db:migrate"
    #system "rake db:seed"

    puts 10.times {"\n"}

    puts Time.now - begin_rebuild

    system "rails s"

  end

end