data:extend({
    {
        type = "recipe",
        name = "xenon-recipe",
        icon = graphics .. "xenon.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "cold-fusion",
        order = "b",
        category = "chemistry",
        enabled = false,
        energy_required = 30,
        ingredients = {
            { type = "item", name = "thorium", amount = 10 },
            { type = "item", name = "iron-plate", amount = 5 },
            { type = "fluid", name = "steam", amount = 100 },
            { type = "item", name = "explosives", amount = 1}
        },
        results = {
            { type = "fluid", name = "xenon", amount = 100 },
            { type = "item", name = "isotope-scrap", amount = 1 }
        }
    }
})
