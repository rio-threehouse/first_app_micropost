(1..1000).each do |number|
  Micropost.create(post: 'test' + number.to_s, user_id: 4)
end
