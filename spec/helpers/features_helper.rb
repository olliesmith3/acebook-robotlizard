def sign_up
  visit "/users/sign_up"
  fill_in :user_first_name, with: "linus"
  fill_in :user_last_name, with: "smit"
  fill_in :user_last_name, with: "smit"
  fill_in :user_email, with: "linus@ollie.com"
  fill_in :user_password, with: "password123"
  fill_in :user_password_confirmation, with: "password123"
  find("input[type=submit][value='Sign up']").click
  User.all.each { |user|
      user.skip_confirmation!
      user.save
    }
end

def sign_in 
  fill_in :user_email, with: "linus@ollie.com"
  fill_in :user_password, with: "password123"
  find("input[type=submit][value='Log in']").click
end

def add_post
  fill_in :post_message, with: "Hello, world!"
  within(".new_post") do
    click_on("Submit")
  end
end

def add_comment
  fill_in :comment_content, with: "I walk the lonely toad"
  within(".new_comment") do
    click_on("Submit")
  end
end