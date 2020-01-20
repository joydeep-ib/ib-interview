json.id @interview.id
json.title @interview.title
json.description @interview.description
json.startdt @interview.startdt
json.enddt @interview.enddt
json.created_at @interview.created_at
json.participants @interview.participants, :id, :name, :email