local rocket_ingredients
if settings.startup["complexity-level"].value == "simple" then
    if mods["SchallUraniumProcessing"] then
        rocket_ingredients = { { "rocket-control-unit", 10 }, { "explosives", 10 }, { "uranium-235", 20 },
            { "plutonium", 10 } }
    else
        rocket_ingredients = { { "rocket-control-unit", 10 }, { "explosives", 10 }, { "plutonium", 20 }}
    end
else
    rocket_ingredients = { { "rocket-control-unit", 10 }, { "explosives", 25 }, { "uranium-235", 30 }, { "plutonium", 15 },
        { "rocket",              3 } }
end

data:extend({{
    type = "recipe",
    name = "atomic-bomb",
    enabled = false,
    energy_required = 50,
    ingredients = rocket_ingredients,
    result = "atomic-bomb"
}, {
    type = "ammo",
    name = "atomic-bomb",
    icon = "__Atomic_Overhaul__/graphics/vanilla/atomic-bomb.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
        layers = {{
            size = 64,
            filename = "__Atomic_Overhaul__/graphics/vanilla/atomic-bomb.png",
            scale = 0.25,
            mipmap_count = 4
        }, {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = base_graphics .. "atomic-bomb-light.png",
            scale = 0.25,
            mipmap_count = 4
        }}
    },
    ammo_type = {
        range_modifier = 1.5,
        cooldown_modifier = 10,
        target_type = "position",
        category = "rocket",
        action = {
            type = "direct",
            action_delivery = {
                type = "projectile",
                projectile = "atomic-rocket",
                starting_speed = 0.05,
                source_effects = {
                    type = "create-entity",
                    entity_name = "explosion-hit"
                }
            }
        }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-c[atomic-bomb]",
    stack_size = 10
}})
