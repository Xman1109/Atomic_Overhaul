--not ready yet!

data.raw["recipe"]["plutonium-fuel-cell-recipe"].hidden = true
data.raw["recipe"]["empty-fuel-cell-recipe"].hidden = true

data.raw["recipe"]["plutonium-fuel-cell"].subgroup = data.raw["recipe"]["plutonium-fuel-cell-recipe"].subgroup
data.raw["recipe"]["plutonium-fuel-cell"].order = data.raw["recipe"]["plutonium-fuel-cell-recipe"].order
data.raw["recipe"]["empty-nuclear-fuel-cell"].subgroup = data.raw["recipe"]["empty-fuel-cell-recipe"].subgroup
data.raw["recipe"]["empty-nuclear-fuel-cell"].order = data.raw["recipe"]["empty-fuel-cell-recipe"].order

-- for every recipe which uses empty-fuel-cell as an ingredient, replace it with empty-nuclear-fuel-cell
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient[1] == "empty-fuel-cell" then
                ingredient[1] = "empty-nuclear-fuel-cell"
            end
        end
    end
end