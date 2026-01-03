if settings.startup["ao-complexity-level"].value == "simple" then
    data:extend({
        {
            type = "recipe",
            name = "fissile-products-reprocessing",
            icon = graphics .. "waste-solution-reprocessing.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "chemistry",
            enabled = false,
            energy_required = 70,
            subgroup = "waste-reprocessing",
            order = "b",
            ingredients = {
                { type = "item",  name = "fissile-products", amount = 7 },
                { type = "fluid", name = "sulfuric-acid",    amount = 30 }
            },
            results = {
                { type = "item",  name = "plutonium",                  amount = 1 },
                { type = "fluid", name = "radioactive-waste-solution", amount = 20 }
            }
        }
    })
else
    data:extend({
        {
            type = "recipe",
            name = "waste-solution-reprocessing",
            icon = graphics .. "waste-solution-reprocessing.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "chemistry",
            enabled = false,
            energy_required = 10,
            subgroup = "waste-reprocessing",
            order = "b",
            ingredients = {
                { type = "fluid", name = "waste-solution", amount = 50 }
            },
            results = {
                { type = "item", name = "uranium-238", amount = 5, probability = 0.25 },
                { type = "item", name = "plutonium",   amount = 3, probability = 0.25 },
                { type = "item", name = "MOX",         amount = 2, probability = 0.25 },
                { type = "item", name = "thorium",     amount = 1, probability = 0.1 },
            }
        }
    })
end
