json.id @participant.id
json.name @participant.name
json.email @participant.email
json.resume :foo
json.interviews @participant.interviews, :id, :startdt, :enddt, :title