# Create Admin User
admin_email = "admin@example.com"
unless User.exists?(email: admin_email)
  User.create!(
    email: admin_email,
    password: "password",
    password_confirmation: "password",
    role: :admin,
    first_name: "Admin",
    last_name: "User"
  )
  puts "✅ Admin user created"
else
  puts "ℹ️ Admin user already exists"
end

# Create 4 Sample Books
books = [
  { title: "The Ruby Way", author: "Hal Fulton", description: "Learn Ruby with best practices.", pages: 450 },
  { title: "Clean Code", author: "Robert C. Martin", description: "A handbook of agile software craftsmanship.", pages: 400 },
  { title: "Eloquent Ruby", author: "Russ Olsen", description: "Write beautiful Ruby code.", pages: 380 },
  { title: "Practical Object-Oriented Design", author: "Sandi Metz", description: "OO design for real-world Ruby apps.", pages: 320 }
]

books.each do |book_attrs|
  Book.find_or_create_by!(title: book_attrs[:title]) do |book|
    book.assign_attributes(book_attrs)
  end
end

puts "✅ Sample books created"
