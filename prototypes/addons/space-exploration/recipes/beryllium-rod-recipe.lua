data:extend({
    {
        type = "recipe",
        name = "beryllium-rod-recipe",
        icon = se_addon_graphics .. "beryllium-fuel-rod.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "fuel-rods",
        order = "g",
        category = "centrifuging",
        enabled = false,
        energy_required = 30,
        ingredients = {
            {type = "item", name = "beryllium-7", amount = 5},
            {type = "item", name = "graphite", amount = 3}
        },
        results = {
            {"beryllium-fuel-rod", 10}
        }
    }
})