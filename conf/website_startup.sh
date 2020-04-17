
#! /bin/sh

# Wait for DB services
sh /website/wait-for-services.sh


rm -f /website/config/pids/unicorn.pid

cd /website && taskset -c 1 bundle exec unicorn_rails -c config/unicorn.rb -E development -d