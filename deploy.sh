bundle exec middleman build
cd build && git add . && git commit -m "update" && git push -f origin gh-pages
cd ../
BLOG_PREFIX=true bundle exec middleman build
cd build && git add . && git commit -m "update" && git push -f origin gh-pages:internal
cd ../
