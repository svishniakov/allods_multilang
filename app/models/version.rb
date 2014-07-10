class Version < ActiveRecord::Base
  attr_accessible :name, :path, :str_de, :str_en, :str_fr, :str_ru, :str_tr, :version

  mount_uploader :version, VersionUploader

  def self.import(temp_path)
    workbook = Dullard::Workbook.new temp_path

    # First row is a header
    header = workbook.sheets[0].rows.first

    # Cleaning versions table
    Version.delete_all

    workbook.sheets[0].rows.each do |row|
      output_row = Hash[[header,row].transpose]
      version = Version.new
      version.attributes = output_row.to_hash.slice(*accessible_attributes)
      version.save!
    end
  end

end
