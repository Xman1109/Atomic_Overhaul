if settings.startup["ao-complexity-level"].value == "full" then
    data:extend(
        {
            { --TODO: We need the recipe and implementation for this
                type = "tool",
                name = "isotope-data",
                localised_description = { "item-description.science-pack" },
                icon = graphics .. "isotope-data.png",
                icon_size = 128,
                icon_mipmaps = 4,
                subgroup = "resources",
                order = "zb",
                durability = 1,
                stack_size = 100,
                durability_description_key = "description.science-pack-remaining-amount-key",
                durability_description_value = "description.science-pack-remaining-amount-value"
            }
        })
end
