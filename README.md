# SysDev Wiki

* Ruby version

* System dependencies
 Rails 5.0.6

* VM Configuration
### Go to [Rails Dev Box](https://github.com/rails/rails-dev-box) and follow the instuction
```bash
cd ~/rails-dev-box/
vagrant up
vagrant ssh
java -version
# if none
apt-get install openjdk-6-jre
sudo add-apt-repository ppa:webupd8team/java
apt-get update
sudo apt-get install oracle-java7-installer
java -version
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.0.zip
unzip elasticsearch-6.6.0.zip
cd elasticsearch-0.90.7wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.4.zip
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.4.zip.sha512
shasum -a 512 -c elasticsearch-6.1.4.zip.sha512 
unzip elasticsearch-6.1.4.zip
cd elasticsearch-6.1.4/
./bin/elasticsearch

Open another terminal 
cd ~/rails-dev-box/
vagrant ssh

# test connection
curl -X GET 'http://localhost:9200'
# cd to project Sysdev-Wiki
# first time setup
bundle install
rails db:create
rails: db:migrate
rails db:seed
rails c
Acticle.reindex 
# This adds the items to elasticsearch with a new index
exit
# end first time setup
rails  s
# this starts the server

```

* Database creation
  ```ruby
   bundle install
   rails db:create
  ```
* Seed Data
  ```ruby
  rails db:seed
  ```

* Database initialization
  ```ruby
   rails db:reset
  ```

* How to run the test suite
  ```ruby
   bundle exec rspec ./spec/controllers/categories_controller_spec.rb:42
  ```
  42 represent that line

* Services (job queues, cache servers, search engines, etc.)
  ```ruby
   brew install elasticsearch
   brew services start elasticsearch
  ```

* Deployment instructions

