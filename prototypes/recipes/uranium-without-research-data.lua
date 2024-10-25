if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({ {
        type = "recipe",
        name = "uranium-without-research-data",
        energy_required = 60,
        enabled = false,
        category = "centrifuging",
        ingredients = { {type="item", name="depleted-uranium-fuel-cell", amount=5} },
        icon = graphics .. "uranium-without-research-recipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "reprocessing-without-research-data",
        order = "b",
        results = {
            {type="item", name="uranium-238", amount=3},
            { type = "item", name = "plutonium",     amount_min = 2, amount_max = 4 },
            { type = "item", name = "nuclear-waste", amount = 5 }
        },
        allow_decomposition = false
    } })
end
