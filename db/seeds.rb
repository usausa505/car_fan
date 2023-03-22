# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email:"administrator@example.com", password:"administrator")

User.create!(
  [
    {email: 'gtr@example.com', name: 'R35推し', introduction: 'GT-Rが大好きな一般人です！', password: 'asdfgh',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'nsx@example.com', name: 'NSX大好き侍',
    password: 'asdfgh', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'z34@example.com', name: 'Zは不滅', password: 'asdfgh', introduction: 'Zの伝説は不滅。古事記にもそう書いてある(-ω-)',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg")},
    {email: 'grsupra@example.com', name: 'スープラこそ至高', password: 'asdfgh',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg")}
  ]
)

user = User.find(1)

post_data = Post.create!(
  user_id: user.id,
  title: 'TAS2023行ってきました！',
  body: '新型GT-Rカッコイイですよねぇ…'
)

image1 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_gt-r1.jpg"), filename: "post_gt-r1.jpg")
image2 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_gt-r2.jpg"), filename: "post_gt-r2.jpg")
image3 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_gt-r3.jpg"), filename: "post_gt-r3.jpg")
image4 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_gt-r4.jpg"), filename: "post_gt-r4.jpg")
post_data.update(images: [image1, image2, image3, image4])

post_data = Post.create!(
  user_id: user.id,
  title: 'GT-Rについて',
  body: 'R36が出るとしたら、EV化されるんだろうか…'
)


post_data = Post.create!(
  user_id: user.id,
  title: 'GT-R nismoについて',
  body: '値段にさえ目をつむれば、R35の集大成と言えるレベルだよな'
)

user = User.find(2)

post_data = Post.create!(
  user_id: user.id,
  title: 'NSX最高！',
  body: '日本のスーパーカーというなら、ホンダはNSXでしょ'
)

image1 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_nsx1.jpg"), filename: "post_nsx1.jpg")
image2 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_nsx2.jpg"), filename: "post_nsx2.jpg")
post_data.update(images: [image1, image2])

post_data = Post.create!(
  user_id: user.id,
  title: 'NSXの最後',
  body: '2代目NSXも生産終了しちゃったなぁ'
)

user = User.find(3)

post_data = Post.create!(
  user_id: user.id,
  title: '新型Zの雄姿',
  body: 'イカズチイエローのネーミング、良きかな'
)

image1 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_z1.jpg"), filename: "post_z1.jpg")
image2 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_z2.jpg"), filename: "post_z2.jpg")
image3 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_z3.jpg"), filename: "post_z3.jpg")
image4 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_z4.jpg"), filename: "post_z4.jpg")
post_data.update(images: [image1, image2, image3, image4])

post_data = Post.create!(
  user_id: user.id,
  title: 'Zが欲しい…',
  body: 'バージョンSTいいよなぁ…高いけど'
)

user = User.find(4)

post_data = Post.create!(
  user_id: user.id,
  title: 'GRGarage行ってきました',
  body: 'スープラの他にもヤリスとか86もあったわ'
)

image1 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_grsupra1.jpg"), filename: "post_grsupra1.jpg")
image2 = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_grsupra2.jpg"), filename: "post_grsupra2.jpg")
post_data.update(images: [image1, image2])

post_data = Post.create!(
  user_id: user.id,
  title: 'MTの良いところ',
  body: 'MTの良いところは…かっこいいから！w'
)

post_data = Post.create!(
  user_id: user.id,
  title: 'Zも良いよね',
  body: '同じ価格帯だと、Zも普通にカッコイイんだよなぁ'
)