class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :path
      t.string :str_ru
      t.string :str_en
      t.string :str_de
      t.string :str_fr
      t.string :str_tr
      t.string :version

      t.timestamps
    end
  end
end
