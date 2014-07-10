json.array!(@versions) do |version|
  json.extract! version, :id, :path, :str_ru, :str_en, :str_de, :str_fr, :str_tr, :version
  json.url version_url(version, format: :json)
end
