if settings.startup["ao-complexity-level"].value  ~= "simple" then
    data:extend({
        {
            type = "recipe",
            name = "uranium-rod-recipe",
            icon = graphics .. "uranium-fuel-rod.png",
            icon_size = 128,
            icon_mipmaps = 4,
            subgroup = "fuel-rods",
            order = "a",
            category = "centrifuging",
            enabled = false,
            energy_required = 30,
            ingredients = {
                { type = "item", name = "uranium-235", amount = 1 },
                { type = "item", name = "graphite",    amount = 19 }
            },
            results = {
                { "uranium-fuel-rod", 10 }
            }
        }
    })
end
