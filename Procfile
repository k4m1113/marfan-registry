web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
worker: rake jobs:work
client: sh -c 'rm app/assets/webpack/* || true && cd client && npm run build:development'
