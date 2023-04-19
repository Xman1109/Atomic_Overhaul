data:extend({
    {
        type = "recipe",
        name = "iridium-rod-recipe",
        icon = se_addon_graphics .. "iridium-fuel-rod.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "fuel-rods",
        order = "e",
        category = "centrifuging",
        enabled = false,
        energy_required = 30,
        ingredients = {
            {type = "item", name = "iridium-192", amount = 5},
            {type = "item", name = "graphite", amount = 3}
        },
        results = {
            {"iridium-fuel-rod", 10}
        }
    }
})