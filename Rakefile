require "bundler/gem_tasks"
require "rspec/core/rake_task"

require 'migrations'
require 'pg'
require 'yaml'

namespace :migrate do
  task :connect do
    conn = PG::Connection.new(host: '192.168.33.10', user: 'postgres', dbname: 'migrations_development')
    Migrations.sql_executor do |sql|
      conn.exec(sql)
    end
  end
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
