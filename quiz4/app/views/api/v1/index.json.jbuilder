json.array! @companies do |company|
  json.name company.name.capitalize
  json.products company.products do |product|
    product.name
  end
end
