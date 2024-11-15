data:extend(
    {
        {
            type = "ammo",
            name = "X17-magazine",
            icon = graphics .. "X17-magazine.png",
            icon_mipmaps = 4,
            icon_size = 64,
            pictures =
            {
                layers =
                {
                    {
                        filename = graphics .. "X17-magazine.png",
                        mipmap_count = 4,
                        width = 64,
                        height = 64,
                        size = 64,
                        scale = 0.25
                    },
                    {
                        filename = graphics .. "X17-magazine-light.png",
                        mipmap_count = 4,
                        width = 64,
                        height = 64,
                        size = 64,
                        scale = 0.25,
                        flags = {"light"},
                        draw_as_light = true,
                    }
                }
            },
            ammo_category = "bullet",
            ammo_type =
            {
                category = "bullet",
                action =
                {
                    type = "direct",
                    action_delivery =
                    {
                        type = "instant",
                        target_effects =
                        {
                            {
                                type = "damage",
                                damage = { amount = 25, type = "radiation" }
                            },
                            {
                                type = "create-entity",
                                entity_name = "X17-cloud-visual-dummy"
                            }
                        },
                        source_effects =
                        {
                            type = "create-explosion",
                            entity_name = "explosion-gunshot"
                        }
                    }
                }
            },
            magazine_size = 10,
            group = "atomic-overhaul",
            subgroup = "weaponry",
            order = "a",
            stack_size = 10
        }
    })
