require 'simple_migrations'

desc 'Run any new migrations'
task migrate: ['migrate:connect'] do
  Migrations.ensure_schema_migrations
  Migrations.migrate
end

namespace :migrate do
  desc 'Stub a new migration file'
  task :create, [:name] do |t, args|
    name = args[:name]
    Migrations.ensure_directories
    Migrations.stub_migration(name)
  end
end
