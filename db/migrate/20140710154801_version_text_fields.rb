class VersionTextFields < ActiveRecord::Migration
  def change
    remove_column :versions, :path
    remove_column :versions, :str_ru
    remove_column :versions, :str_en
    remove_column :versions, :str_de
    remove_column :versions, :str_fr
    remove_column :versions, :str_tr
    add_column :versions, :path, :text
    add_column :versions, :str_ru, :text
    add_column :versions, :str_en, :text
    add_column :versions, :str_de, :text
    add_column :versions, :str_fr, :text
    add_column :versions, :str_tr, :text
    add_index :versions, :path
    add_index :versions, :str_ru
    add_index :versions, :str_en
    add_index :versions, :str_de
    add_index :versions, :str_fr
    add_index :versions, :str_tr
  end
end
