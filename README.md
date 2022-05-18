# Simple Migrations

Rake tasks for basic migration management

## Usage

Here's an example using Postgres, but any SQL database should be fine. Add the following to your Rakefile:
```
require 'simple_migrations'
require 'pg'

namespace :migrate do
  task :connect do
    # pretend this was loaded from a file or ENV
    conf = { host: '192.168.33.10', user: 'postgres', dbname: 'migrations_development' }

    # Using Postgres here, but any DB should be fine
    conn = PG::Connection.new(conf)

    # set up a block that allows SimpleMigrations run SQL
    SimpleMigrations.sql_executor do |sql|
      conn.exec(sql)
    end
  end
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

