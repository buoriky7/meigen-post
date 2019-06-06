class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :speaker
      t.string :sp_word
      t.text :commentary
      t.string :genre
      t.string :word_flag
      t.string :speaker_gender
      t.text :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
