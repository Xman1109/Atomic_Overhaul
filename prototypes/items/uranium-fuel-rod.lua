if not settings.startup["complexity-level"].value == "simple" then
    data:extend({
        {
            type = "item",
            name = "uranium-fuel-rod",
            icon = graphics .. "uranium-fuel-rod.png",
            icon_size = 128,
            icon_mipmaps = 4,
            subgroup = "fuel-rods",
            order = "b[uranium-fuel-rod]",
            stack_size = 50
        }
    })
end