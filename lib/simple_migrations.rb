require 'fileutils'

module SimpleMigrations
  class << self
    def sql_executor(&block)
      @sql_executor = block
    end

    def ensure_directories
      FileUtils.mkdir_p('db/migrate')
    end

    def ensure_schema_migrations
      exec('SET client_min_messages TO WARNING')
      exec('create table if not exists schema_migrations(id bigint, ran_at timestamp)')
    end

    def stub_migration(name)
      now = Time.now
      stamp = now.year.to_s + now.month.to_s.rjust(2, '0') + now.day.to_s.rjust(2, '0') + now.hour.to_s.rjust(2, '0') + now.min.to_s.rjust(2, '0') + now.sec.to_s.rjust(2, '0')
      FileUtils.touch("db/migrate/#{stamp}_#{name}.sql")
    end

    def migrate
      Dir['db/migrate/*'].each do |filename|
        basename = File.basename(filename)
        id = Integer(basename.split('_').first)
        if run_record = record_for(id)
          puts "#{basename} ran at #{run_record['ran_at']}"
        else
          puts "Running #{basename}..."
          exec('begin')
          sql = File.read(filename)
          puts sql
          exec(sql)
          exec("insert into schema_migrations(id, ran_at) values(#{id}, '#{Time.now.to_s}')")
          exec('commit')
          puts 'Done.'
        end
      end
    end

    private

    def record_for(id)
      exec("select * from schema_migrations where id = #{id}").first
    end

    def exec(sql)
      @sql_executor.call(sql)
    end
  end
end
