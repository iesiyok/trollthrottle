
#! /bin/sh

# Wait for DB services
sh /ledger/wait-for-services.sh


rm -f /ledger/config/pids/unicorn.pid

cd /ledger && taskset -c 1 bundle exec unicorn_rails -c config/unicorn.rb -E development -d