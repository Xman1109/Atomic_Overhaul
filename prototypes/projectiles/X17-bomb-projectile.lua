local projectile = table.deepcopy(data.raw["projectile"]["atomic-rocket"])        -- copy the atomic-bomb projectile
projectile.name =
"X17-bomb-projectile"                                                             -- rename it to X17-bomb-projectile
projectile.action.action_delivery.target_effects[3].entity_name = "X17-explosion" -- set the tint of the explosion to red

data:extend({ projectile }) -- add the projectile to the game

data:extend({
    {
        type = "explosion",
        name = "X17-explosion",
        hidden = true,
        icons =
        {
            { icon = "__base__/graphics/icons/explosion.png" },
            { icon = "__base__/graphics/icons/atomic-bomb.png" }
        },
        order = "a-d-a",
        subgroup = "explosions",
        height = 0,
        animations = {
            width = 628,
            height = 720,
            frame_count = 100,
            draw_as_glow = true,
            priority = "very-low",
            flags = { "linear-magnification" },
            shift = util.by_pixel(0.5, -122.5), --shift = util.by_pixel(0.5, -62.5), shifted by 60 due to scaling and centering
            animation_speed = 0.5 * 0.75,
            scale = 1,
            dice_y = 5,
            allow_forced_downscale = true,
            stripes =
            {
                {
                    filename = entity_graphics .. "X17-explosion/X17-explosion-1.png",
                    width_in_frames = 5,
                    height_in_frames = 5
                },
                {
                    filename = entity_graphics .. "X17-explosion/X17-explosion-2.png",
                    width_in_frames = 5,
                    height_in_frames = 5
                },
                {
                    filename = entity_graphics .. "X17-explosion/X17-explosion-3.png",
                    width_in_frames = 5,
                    height_in_frames = 5
                },
                {
                    filename = entity_graphics .. "X17-explosion/X17-explosion-4.png",
                    width_in_frames = 5,
                    height_in_frames = 5
                }
            },
            usage = "explosion"
        },
        sound = data.raw["explosion"]["nuke-explosion"].sound,
    }
})
