json.array!(@events) do |event|
    json.id event.id
    json.title event.title
    json.start event.starts_at
    json.end event.ends_at
end

# json.〇〇は送るデータの型
# event.〇〇はそれに対応するモデルのカラム