json.extract! pessoa, :id, :nome, :rua, :numero, :bairro, :cidade, :estado, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
