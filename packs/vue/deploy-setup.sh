ORIGIN_VUE_APP_API_SERVER=http://localhost:5000/
source .env.production
find -name 'main.*.js' -exec sed -i -e "s|${ORIGIN_VUE_APP_API_SERVER}|${VUE_APP_API_SERVER}|g" '{}' \;
