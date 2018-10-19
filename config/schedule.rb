# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron


 every 10.minutes do
   rake "nnodes:peleas" #peleas personas vs superheroe
 end


 every 1.day, at: '12:00 am' do
   rake "nnodes:revivir_todos" #revive todas las personas
   rake "nnodes:reset_ranking" #reinicia ranking
 end

# Learn more: http://github.com/javan/whenever
