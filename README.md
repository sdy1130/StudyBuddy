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

# Features

## Files management
- Active storage from rails
## Rich text editor
- Action text from rails
## User 
- Devise gem
- Signup
- Email confirmation 
- Resend email confirmation
- Sign in and sign out
- Forgot password
## Home and search
- Course list
- Search bar is the same as the one as home page
- Organized courses based on year with collapsable titles (Bootstrap)
- Each listed course is a link to the course page
## Course page
- List all the posts for that class along with the user who posted it
    - Course title is the link to the post link
    - User name is the link to that user’s profile
- When logged out/ not signed in:
    - There is a join course button that links you with the course.
- This will show up on the user profile page
- Create post
    - If not signed in you will be directed to the login page 
    - If you are signed in you will be directed to the create post page
- Create repo
    - If not signed in you will be directed to the login page 
    - If you are signed in you will be directed to the create repo page
## Repo page
- Upload files, delete files
- Show the list of files
- PDF viewer
- Download files
## User profile
- Edit user information (change password, user info)
- Show recent posts 
- Show joined repo -> click into it to go into it
- Show joined class -> click into it and go into it 
- Profile picture
## Services
- Payment 
    - Stripe gem
- Service booking confirmation via email
- Google Map
    - geocoder gem
    - gmap4rails gem
## About us
## Contact us
## FAQ
## Terms and conditions 

