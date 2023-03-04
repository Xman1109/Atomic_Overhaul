if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "item",
                name = "thorium-depleted-cell",
                icon = graphics .. "thorium-used-up-fuel-cell.png",
                icon_size = 64,
                icon_mipmaps = 4,
                stack_size = 50,
                group = "atomic-overhaul",
                order = "e",
                subgroup = "used-up-fuel-cells",
            }
        })
end
