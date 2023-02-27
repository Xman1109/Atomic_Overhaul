if settings.startup["complexity-level"].value ~= "simple" then
    data:extend({
        {
            type = "item",
            name = "plutonium-fuel-rod",
            icon = graphics .. "plutonium-fuel-rod.png",
            icon_size = 128,
            icon_mipmaps = 4,
            subgroup = "fuel-rods",
            order = "c[plutonium-fuel-rod]",
            stack_size = 50
        }
    })
end
