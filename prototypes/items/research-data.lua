data:extend(
    {
        {
            type = "tool",
            name = "research-data",
            localised_description = {"item-description.science-pack"},
            icon = graphics .. "research-data.png",
            icon_size = 64, icon_mipmaps = 4,
            subgroup = "resources",
            order = "z",
            durability = 1,
            stack_size = 100,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        }
    })