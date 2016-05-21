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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/migrations. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

