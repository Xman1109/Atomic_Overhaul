data:extend({
    {
        type = "recipe",
        name = "MOX-fuel-rod",
        icon = graphics .. "MOX-fuel-rod.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "fuel-rods",
        order = "c",
        category = "centrifuging",
        enabled = false,
        energy_required = 30,
        ingredients = {
            {type = "item", name = "MOX", amount = 10},
            {type = "item", name = "graphite", amount = 1}
        },
        results = {
            {"MOX-fuel-rod", 10}
        }
    }
})