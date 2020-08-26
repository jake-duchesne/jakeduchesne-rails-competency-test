3.times do |f|
  Article.create!(
    title: "Article #{f}"
    body: "Some content for #{f}"
    category: "Category #{f}"
    username: "Submitted by: #{f}"
    user_id: "id_#{f}"
  )
end
