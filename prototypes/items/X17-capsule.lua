local capsule = table.deepcopy(data.raw.capsule["poison-capsule"])
capsule.name = "X17-capsule"
capsule.icon = graphics .. "X17-capsule.png"
capsule.icon_size = 64
capsule.icon_mipmaps = 4
capsule.group = "atomic-overhaul"
capsule.subgroup = "weaponry"
capsule.order = "c"
capsule.ammo_category = "capsule"
capsule.pictures = {
    layers = {
        {
            filename = graphics .. "X17-capsule.png",
            mipmap_count = 4,
            width = 64,
            height = 64,
            size = 64,
            scale = 0.25,
        },
        {
            filename = graphics .. "X17-capsule-light.png",
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
capsule.capsule_action.attack_parameters.ammo_type.action[1].action_delivery.projectile = "X17-capsule-projectile"

data:extend({capsule})