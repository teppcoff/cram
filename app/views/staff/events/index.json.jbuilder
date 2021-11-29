json.array!(@events) do |event|
    json.id event.id
    json.title event.title
    json.startTime event.starts_at.strftime("%H:%M:%S")
    json.endTime event.ends_at.strftime("%H:%M:%S")
    json.daysOfWeek event.repeats_on.to_s
    json.startRecur event.starts_on
    json.endRecur event.ends_on.next_day(1) 
end

# json.〇〇は送るデータの型
# event.〇〇はそれに対応するモデルのカラム
# startTime,endTimeには時刻のみを入れている
# ends_onが翌日になっているのは、授業最終回として選択した日にも予定を反映させるため