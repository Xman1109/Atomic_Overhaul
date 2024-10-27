if settings.startup["ao-complexity-level"].value ~= "simple" then
    if settings.startup["old-graphite-fuel"].value == true then
        data:extend(
            {
                {
                    type = "item",
                    name = "graphite-depleted-cell",
                    icon = graphics .. "graphite-used-up-fuel-cell.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    stack_size = 50,
                    group = "atomic-overhaul",
                    order = "a",
                    subgroup = "used-up-fuel-cells",
                }
            })
    end
end
