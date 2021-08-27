json.extract! cancione, :id, :url_youtube, :url_spotify, :nombre, :activo, :temporada_capitulo_id, :descripcion, :created_at, :updated_at
json.url cancione_url(cancione, format: :json)
