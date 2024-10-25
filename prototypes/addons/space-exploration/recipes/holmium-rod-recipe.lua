data:extend({
    {
        type = "recipe",
        name = "holmium-rod-recipe",
        icon = se_addon_graphics .. "holmium-fuel-rod.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "fuel-rods",
        order = "f",
        category = "centrifuging",
        enabled = false,
        energy_required = 30,
        ingredients = {
            {type = "item", name = "holmium-166", amount = 5},
            {type = "item", name = "graphite", amount = 3}
        },
        results = {
            {type="item", name="holmium-fuel-rod", amount=10}
        }
    }
})