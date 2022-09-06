data:extend({{
    type = "item",
    name = "beryllium-7",
    icon = se_addon_graphics .. "beryllium-7.png",
    pictures = {
        layers = {{
            size = 64,
            filename = se_addon_graphics .. "beryllium-7.png",
            scale = 0.25,
            icon_mipmaps = 4
        }, {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = graphics .. "resource-light.png",
            scale = 0.25,
            icon_mipmaps = 4
        }}
    },
    icon_size = 64,
    icon_mipmaps = 4,
    group = "atomic-overhaul",
    order = "i",
    subgroup = "resources",
    stack_size = 100
}})
