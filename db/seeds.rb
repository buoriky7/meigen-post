# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create!(email: "admin@user", password: "aaaaaa", name: "管理人", prefecture: "東京", user_gender: "男性", user_flag: 1)
user = User.create!(email: "user@user", password: "aaaaaa", name: "一般", prefecture: "東京", user_gender: "男性", user_flag: 0)

word = Word.create!(speaker: "宇宙飛行士", sp_word: "地球は青かった", genre: "nasa", word_flag: "一般人", speaker_gender: "男性", user_id: user.id)

Favorite.create!(user_id: user.id, word_id: word.id)
Favorite.create!(user_id: user.id, word_id: word.id)