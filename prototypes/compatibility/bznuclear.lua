local function replace_ingredient_partly(recipe_name, old, old_amount, new, new_amount)
    local recipe = data.raw.recipe[recipe_name]
    if recipe ~= nil and recipe.ingredients ~= nil then
        for i, existing in pairs(recipe.ingredients) do
            if existing[1] == new or existing.name == new then
                return
            end
        end
        for i, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == old then
                ingredient.amount = math.max(1, ingredient.amount - old_amount)
            end
            if ingredient[1] == old then
                ingredient[2] = math.max(1, ingredient[2] - old_amount)
            end
        end
        table.insert(recipe.ingredients, { new, new_amount })
    end
end

local function replace_ingredient(recipe_name, old, new)
    local recipe = data.raw.recipe[recipe_name]
    if recipe ~= nil and recipe.ingredients ~= nil then
        for i, existing in pairs(recipe.ingredients) do
            if existing[1] == new or existing.name == new then
                return
            end
        end
        for i, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == old then
                ingredient.name = new
            end
            if ingredient[1] == old then
                ingredient[1] = new
            end
        end
    end
end

if settings.startup["ao-complexity-level"].value == "simple" then
    if mods.bzlead then -- replace iron with lead like for standard cells
        replace_ingredient("MOX-fuel-cell-recipe", "iron-plate", "lead-plate")
        if ao_breeder then replace_ingredient("ao-breeder-fuel-cell-recipe", "iron-plate", "lead-plate") end
    end

    if mods.bzzirconium then -- adding zirconium like for standard cells
        local nuclear_plate = mods.bzlead and "lead-plate" or "iron-plate"
        local nuclear_z = data.raw.item["zircaloy-4"] and "zircaloy-4" or "zirconium-plate"

        replace_ingredient_partly("uranium-fuel-cell", nuclear_plate, 1, nuclear_z, 1)
        replace_ingredient_partly("MOX-fuel-cell-recipe", nuclear_plate, 1, nuclear_z, 1)
        if ao_breeder then
            replace_ingredient_partly("ao-breeder-fuel-cell-recipe", nuclear_plate, 1, nuclear_z, 1)
            table.insert(data.raw.recipe["apm_nuclear_breeder-recipe"].ingredients, { nuclear_z, 150 })
        end
    end
end
