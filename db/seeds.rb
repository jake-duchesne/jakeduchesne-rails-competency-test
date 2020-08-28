1.times do |f|
  Category.create!(
    title: "Weather"
  )
end

puts "Created Weather Category"

1.times do |f|
  Category.create!(
    title: "Sports"
  )
end

puts "Created Sports Category"


3.times do |f|
  Article.create!(
    title: "Article #{f}",
    body: "Some content for #{f}",
    username: "user#{f}",
    user_id: "#{f}#{f+1}",
    category_id: Category.last.id
  )
end

puts "Created 3 articles"

