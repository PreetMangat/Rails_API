# Rails_API

Simple API that serves as an endpoint for user creation, updates, deletion and sessions , using the devise gem.

Sessions are created using a session cookie (encrypted with the users ID) and a CSRF token (generated as a JSON response upon logging in, and checked during user update or deletion).

Front-end MUST send a "X-CSRF-Token" header, containing the CSRF token, when requesting updates or deletes for a logged in user. Anyone can create users, so neither authentication or CSRF checks are done for that operation.

# Install
1. Clone repo
2. Navigate to directory in command line
3. Run "bundle install" in command line
4. Run "rails db:migrate" in command line
5. Run "rails s -p 3000" in command line, where '3000' is the port number

# Routes (assuming server is run on port 3000)
1. POST to 'localhost:3000/users' creates a new user
2. PATCH to localhost:3000/users updates a user
3. DELETE to localhost:3000/users deletes a user
4. POST to localhost:3000/users/sign_in signs a user in
5. DELETE to localhost:3000/users/sign_out signs a user out

# Parameters
1. Creating a user: {user:{email: "email_here", password: "password here"}}
2. Updating a user: {user:{email: "New_email", password: "new_password", current_password: "Your current password"}}
3. Deleting a user: no params
4. Signing in a user: {user:{email: "email_here", password: "password here"}}
5. Signing out a user: no params
