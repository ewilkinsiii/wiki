
Group.create!(name: "Test")

puts "1 Group created"

category_list = [
    "blue",
    "red",
    "yellow",
    "purple",
    "green"
  ]
 
category_list.each do |name|
  Category.create!(name: name)
end

puts "5 Categories created"

User.create!(email: "ewilkinsiii@gmail.com",
            password: "password",
            password_confirmation: "password",
            first_name: "Eugene",
            last_name: "Wilkins"
             )

puts "1 User created"

10.times do |article|
  Article.create!(
    name: "My Article Post " + article.to_s,
    description: "Something new something great",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    link: "google.com",
    jira_ticket: "12334",
    status: 0,
    user_id: 1,
    category_id: 3
    )
end
puts "10 Articles created"

UserGroup.create!(user_id: 1, group_id: 1)
puts "1 user added to Test group"

GroupCategory.create!(group_id: 1, category_id: 3)
GroupCategory.create!(group_id: 1, category_id: 4)
puts "2 categories added to Test group"