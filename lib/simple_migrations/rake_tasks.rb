require 'simple_migrations'

desc 'Run any new migrations'
task migrate: ['migrate:connect'] do
  SimpleMigrations.ensure_schema_migrations
  SimpleMigrations.migrate
end

namespace :migrate do
  desc 'Stub a new migration file'
  task :create, [:name] do |t, args|
    name = args[:name]
    SimpleMigrations.ensure_directories
    SimpleMigrations.stub_migration(name)
  end
end
