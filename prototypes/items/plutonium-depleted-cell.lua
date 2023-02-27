if settings.startup["complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "item",
                name = "plutonium-depleted-cell",
                icon = graphics .. "plutonium-used-up-fuel-cell.png",
                icon_size = 64, icon_mipmaps = 4,
                stack_size = 50,
                group = "atomic-overhaul",
                order = "c",
                subgroup = "used-up-fuel-cells",
            }
        })
end
