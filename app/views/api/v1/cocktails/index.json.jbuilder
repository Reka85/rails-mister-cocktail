json.array! @cocktails do |cocktail|
  u = cocktail.user
  json.extract! cocktail, :id, :name
  json.ingredients cocktail.ingredients do |ingredient|
    json.extract! ingredient, :id, :name
  end
end
