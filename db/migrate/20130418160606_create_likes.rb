class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.user :references
      t.post :references

      t.timestamps
    end
  end
end
