namespace :project do
  desc "Refresh local db from heroku remote"
  task :refresh, :app, :expire, :remove do |t, args|
    Bundler.with_clean_env do
      puts args.inspect
      args.with_defaults(:app => 'android-notification-tracker', :expire => false, remove: false)

      puts "Downloading pg backup of #{args.app}"
      system "pg_dump -h #{ENV['TRACKER_DB_HOST']} -Fc -Z9 -o -U #{ENV['TRACKER_DB_USER']} android-notification-tracker > local/latest.dump"
      puts "Restoring database from backup"

      puts "Running rake db:drop"
      Rake.application.invoke_task("db:drop")

      puts "Running rake db:create"
      Rake.application.invoke_task("db:create")

      system "pg_restore --verbose --no-acl --no-owner -h localhost -U postgres -d android_notification_tracker_development local/latest.dump"

      if args[:remove]
        puts "Removing db dumpfile"
        system "rm local/latest.dump"
      end

      puts "Running rake db:migrate"
      Rake.application.invoke_task("db:migrate")
    end
  end

  module SystemHook
    private
    def system(*args)
      super.tap do |result|
        if result != true
          raise "The command #{args.join(', ')} failed. Aborting task"
        end
      end
    end
  end

  class Object
    prepend SystemHook
  end
end
