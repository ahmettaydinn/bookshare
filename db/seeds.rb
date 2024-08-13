# Method to handle record creation with error handling
def create_or_update_user(email, password)
  user = User.find_or_initialize_by(email: email)
  if user.new_record?
    user.password = password
    user.password_confirmation = password
    if user.save
      puts "User '#{email}' created successfully."
    else
      puts "Error creating user '#{email}': #{user.errors.full_messages.join(', ')}"
    end
  else
    puts "User '#{email}' already exists. Skipping creation."
  end
  user
end

# Method to handle image attachment with error handling
def attach_image(book, file_name)
  if book.image.attached?
    puts "Image already attached to book '#{book.title}'. Skipping attachment."
  else
    begin
      book.image.attach(
        io: File.open(Rails.root.join('db', 'seeds', 'images', file_name)),
        filename: file_name
      )
      puts "Image '#{file_name}' attached successfully to book '#{book.title}'."
    rescue StandardError => e
      puts "Error attaching image '#{file_name}' to book '#{book.title}': #{e.message}"
    end
  end
end

# Method to create book and handle errors
def create_or_update_book(title, description, user, file_name)
  book = Book.find_or_initialize_by(title: title, user: user)
  if book.new_record?
    book.description = description
    if book.save
      attach_image(book, file_name)
      puts "Book '#{title}' created successfully."
    else
      puts "Error creating book '#{title}': #{book.errors.full_messages.join(', ')}"
    end
  else
    puts "Book '#{title}' already exists. Skipping creation."
  end
end

# Method to add a book to favorites for a user
def add_book_to_favorites(user, book)
  if user.favorite_books.include?(book)
    puts "Book '#{book.title}' is already in #{user.email}'s favorites. Skipping."
  else
    user.favorite_books << book
    puts "Book '#{book.title}' added to #{user.email}'s favorites."
  end
end

# Create users
user1 = create_or_update_user('user1@example.com', 'password123')
user2 = create_or_update_user('user2@example.com', 'password123')

# Create books for user1
book1 = create_or_update_book('Book One', 'Description for Book One', user1, 'book_one.jpg')
book2 = create_or_update_book('Book Two', 'Description for Book Two', user1, 'book_two.jpg')

# Create books for user2
book3 = create_or_update_book('Book Three', 'Description for Book Three', user2, 'book_three.jpg')
book4 = create_or_update_book('Book Four', 'Description for Book Four', user2, 'book_four.jpg')

# Add books to favorites
add_book_to_favorites(user1, book1)
add_book_to_favorites(user1, book3)
add_book_to_favorites(user2, book2)
add_book_to_favorites(user2, book4)
