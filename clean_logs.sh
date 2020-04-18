#!/bin/bash

rm -f logs/issuer/*.log ;\
touch logs/issuer/unicorn.stderr.log ;\
touch logs/issuer/unicorn.stdout.log ;\

rm -f logs/id_verifier/*.log ;\
touch logs/id_verifier/unicorn.stderr.log ;\
touch logs/id_verifier/unicorn.stdout.log ;\

rm -f logs/ledger/*.log ;\
touch logs/ledger/unicorn.stderr.log ;\
touch logs/ledger/unicorn.stdout.log ;\

rm -f logs/website/*.log ;\
touch logs/website/unicorn.stderr.log ;\
touch logs/website/unicorn.stdout.log ;\

rm -f logs/sign_verifier/*.log ;\
touch logs/sign_verifier/unicorn.stderr.log ;\
touch logs/sign_verifier/unicorn.stdout.log ;\

rm -f logs/nginx/error.log ;\
touch logs/nginx/error.log ;\

rm -f data/de/result/*.log ;\
rm -f data/nytimes/result/*.log ;\
rm -f data/reddit/result/*.log ;\

echo "Logs deleted" ;
