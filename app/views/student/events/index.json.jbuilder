json.array!(@events) do |event|
    json.id event.id
    json.title event.title
    json.start event.starts_at
    json.end event.ends_at
    json.event_type event.event_type
    json.student_member_id event.student_member_id
end

# json.〇〇は送るデータの型
# event.〇〇はそれに対応するモデルのカラム