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