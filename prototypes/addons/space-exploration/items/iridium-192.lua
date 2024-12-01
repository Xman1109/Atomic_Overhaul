data:extend({{
    type = "item",
    name = "iridium-192",
    icon = se_addon_graphics .. "iridium-192.png",
    pictures = {
        layers = {{
            size = 64,
            filename = se_addon_graphics .. "iridium-192.png",
            scale = 0.5,
            icon_mipmaps = 4
        }, {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = graphics .. "resource-light.png",
            scale = 0.5,
            icon_mipmaps = 4
        }}
    },
    icon_size = 64,
    icon_mipmaps = 4,
    group = "atomic-overhaul",
    order = "g",
    subgroup = "resources",
    stack_size = 100
}})
