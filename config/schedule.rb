# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# to check every one minute coin changes type in terminal=> tail -f log/prices.log 

set :output, '/Users/ashok/Desktop/Rails-PostgreSQL-Projects/Backup_11:05/PMS_Three/log/prices.log'

# every 1.hour do
#    rake "currency:btc_inr" , :environment => "development"
# end

# every 1.minute do
#   # this rake file implemented in ..lib/tasks/my_namespace.rake
#    rake "currency:btc_inr" , :environment => "development"
# end


every 5.minutes do
  # this rake file implemented in ..lib/tasks/my_namespace.rake
   rake "currency:btc_inr" , :environment => "development"
end