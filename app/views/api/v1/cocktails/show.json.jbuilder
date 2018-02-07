json.extract! @cocktail, :id, :name
json.user @cocktail.user, :id, :username
json.doses @cocktail.doses do |dose|
  json.extract! dose, :id, :description
  json.extract! dose.ingredient, :name
end
