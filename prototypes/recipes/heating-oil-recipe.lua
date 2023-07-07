if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({ {
        type = "recipe",
        name = "heating-oil-recipe",
        icon = graphics .. "heating-oil.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "oil-processing",
        group = "intermediate-products",
        subgroup = "fluid-recipes",
        order = "z",
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = "fluid",  name = "crude-oil", amount = 100 }
        },
        results = {
            { type = "fluid", name = "heating-oil", amount = 50 }
        }
    } })
end
