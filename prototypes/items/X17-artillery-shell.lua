local shell = table.deepcopy(data.raw.ammo["artillery-shell"])
shell.name = "X17-artillery-shell"
shell.icon = graphics .. "X17-artillery-shell.png"
shell.icon_size = 64
shell.icon_mipmaps = 4
shell.group = "atomic-overhaul"
shell.subgroup = "weaponry"
shell.order = "b"
shell.ammo_category = "artillery-shell"
shell.pictures = {
    layers = {
        {
            filename = graphics .. "X17-artillery-shell.png",
            mipmap_count = 4,
            width = 64,
            height = 64,
            size = 64,
            scale = 0.25,
        },
        {
            filename = graphics .. "X17-artillery-shell-light.png",
            mipmap_count = 4,
            width = 64,
            height = 64,
            size = 64,
            scale = 0.25,
            flags = {"light"},
            draw_as_light = true,
        }
    }
}
-- shell.ammo_type.action.action_delivery.projectile = uranium_artillery_projectile --TODO

data:extend({shell})