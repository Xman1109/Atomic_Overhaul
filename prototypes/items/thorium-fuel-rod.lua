if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({
        {
            type = "item",
            name = "thorium-fuel-rod",
            icon = graphics .. "thorium-fuel-rod.png",
            icon_size = 128,
            icon_mipmaps = 4,
            subgroup = "fuel-rods",
            order = "e[thorium-fuel-rod]",
            stack_size = 50
        }
    })
end
