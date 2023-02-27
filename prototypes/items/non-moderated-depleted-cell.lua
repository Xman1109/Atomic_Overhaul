if settings.startup["complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "item",
                name = "non-moderated-depleted-cell",
                icon = graphics .. "non-moderated-used-up-fuel-cell.png",
                icon_size = 64, icon_mipmaps = 4,
                stack_size = 50,
                group = "atomic-overhaul",
                order = "a",
                subgroup = "used-up-fuel-cells",
            }
        })
end
