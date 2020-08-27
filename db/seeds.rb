3.times do |f|
  Article.create!(
    title: "Article #{f}",
    body: "Some content for #{f}",
    category: "Category#{f}",
    username: "user#{f}",
    user_id: "#{f}#{f+1}"
  )
end

puts "Created 3 articles"