# ECE444-Study-Buddy-Group-10

# Getting Started
https://guides.rubyonrails.org/getting_started.html

# Setup
```
git clone https://github.com/yui-wong/ECE444-Study-Buddy-Group-10
bundle install
rails db:migrate RAILS_ENV=development
```

Rerunning all migration files
```
rake db:drop db:create db:migrate
```

# User signup (email confirmation steps):
Based on this: https://stackoverflow.com/questions/8186584/how-do-i-set-up-email-confirmation-with-devise

For development:
   1. run: "gem install mailcatcher"
   2. On a terminal do: "mailcatcher"
   3. Go to http://localhost:1080/ to see the email sent 

For production:
Not done yet