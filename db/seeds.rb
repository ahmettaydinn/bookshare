# db/seeds.rb

# Create users
user1 = User.create!(
  email: 'user1@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

user2 = User.create!(
  email: 'user2@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Create books for user1
Book.create!(
  title: 'Book One',
  description: 'Description for Book One',
  user: user1,
  image_path: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhcA3JhI42Wb7mvVoBIlGCA92p9Povi_oMnw&s'
)

Book.create!(
  title: 'Book Two',
  description: 'Description for Book Two',
  user: user1,
  image_path: 'https://i.etsystatic.com/28842740/r/il/b00bc0/3491028187/il_fullxfull.3491028187_71kz.jpg'
)

# Create books for user2
Book.create!(
  title: 'Book Three',
  description: 'Description for Book Three',
  user: user2,
  image_path: 'https://books.forbes.com/wp-content/uploads/2023/03/WittyShelton_The-Authority-Advantage_3d-Render_f-Amazon-e1689267600195-922x1024.png'
)

Book.create!(
  title: 'Book Four',
  description: 'Description for Book Four',
  user: user2,
  image_path: 'https://i2-prod.mirror.co.uk/incoming/article32252835.ece/ALTERNATES/s615b/0_One-Day.jpg'
)
