# Plan for building auth

## User model:
### Database
+ identifier (username, email)
+ password_digest
+ session_token

### Validations
+ username - unique
+ password_digest - not nill
+ password - length: minimum: 6
+ session_token - exists

### Methods
+ ::find_by_credentials(identifier, password)
+ ::generate_session_token
+ \#ensure_session_token
+ \#reset_session_token!
+ \#is_password?(pw)

## Users controller:

### Views & Actions
+ Sign-up page
+ Sign-up action


## Sessions controller:
+ Log in page
+ Log in action
+ Log out action


## Applications controller
### Methods
+ \#current_user [helper method]
+ \#log_in_user!(user)
+ \#log_out
+ \#logged_in?
