if settings.startup["ao-complexity-level"].value == "simple" then
    data:extend(
        {
            {
                type = "item",
                name = "fissile-products",
                icon = graphics .. "nuclear-waste.png",
                icon_size = 64,
                icon_mipmaps = 4,
                stack_size = 50,
                group = "atomic_overhaul",
                subgroup = "waste-reprocessing",
                order = "a",
            }
        })
else
    data:extend(
        {
            {
                type = "item",
                name = "nuclear-waste",
                icon = graphics .. "nuclear-waste.png",
                icon_size = 64,
                icon_mipmaps = 4,
                stack_size = 50,
                group = "atomic_overhaul",
                subgroup = "other-items",
                order = "a",
            }
        })
end
