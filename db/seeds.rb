# db/seeds.rb

# Method to handle record creation with error handling
def create_or_update_user(email, password)
  user = User.find_or_initialize_by(email: email)
  user.password = password
  user.password_confirmation = password
  if user.save
    puts "User '#{email}' created or updated successfully."
  else
    puts "Error creating/updating user '#{email}': #{user.errors.full_messages.join(', ')}"
  end
  user
end

# Method to handle image attachment with error handling
def attach_image(book, file_name)
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

# Delete existing records to avoid duplication
puts 'Deleting existing records...'
Book.destroy_all
User.destroy_all

# Create users
user1 = create_or_update_user('user1@example.com', 'password123')
user2 = create_or_update_user('user2@example.com', 'password123')

# Method to create book and handle errors
def create_or_update_book(title, description, user, file_name)
  book = Book.find_or_initialize_by(title: title, user: user)
  book.description = description
  if book.save
    attach_image(book, file_name)
    puts "Book '#{title}' created or updated successfully."
  else
    puts "Error creating/updating book '#{title}': #{book.errors.full_messages.join(', ')}"
  end
end

# Create books for user1
create_or_update_book('Book One', 'Description for Book One', user1, 'book_one.jpg')
create_or_update_book('Book Two', 'Description for Book Two', user1, 'book_two.jpg')

# Create books for user2
create_or_update_book('Book Three', 'Description for Book Three', user2, 'book_three.jpg')
create_or_update_book('Book Four', 'Description for Book Four', user2, 'book_four.jpg')
