json.array! @cocktails do |cocktail|
  json.extract! cocktail, :id, :name
  json.ingredients cocktail.ingredients do |ingredient|
    json.extract! ingredient, :id, :name
  end
end
