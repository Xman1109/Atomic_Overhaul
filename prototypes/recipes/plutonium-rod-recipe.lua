if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({
        {
            type = "recipe",
            name = "plutonium-rod-recipe",
            icon = graphics .. "plutonium-fuel-rod.png",
            icon_size = 128,
            icon_mipmaps = 4,
            subgroup = "fuel-rods",
            order = "b",
            category = "centrifuging",
            enabled = false,
            energy_required = 30,
            ingredients = {
                { type = "item", name = "plutonium", amount = 19 },
                { type = "item", name = "graphite",  amount = 1 }
            },
            results = {
                {type="item", name="plutonium-fuel-rod", amount=10}
            }
        }
    })
end
