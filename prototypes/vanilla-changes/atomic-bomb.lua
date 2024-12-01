local rocket_ingredients
if settings.startup["ao-complexity-level"].value == "simple" then
    if ao_breeder then
        rocket_ingredients = {
            {type = "item", name = "processing-unit", amount = 10},
            {type = "item", name = "explosives", amount = 10},
            {type = "item", name = "uranium-235", amount = 20},
            {type = "item", name = "plutonium", amount = 10}
        }
    else -- obtaining Pu-239 is a pain, but Kovarex cheat is On
        rocket_ingredients = {
            {type = "item", name = "processing-unit", amount = 10},
            {type = "item", name = "explosives", amount = 10},
            {type = "item", name = "uranium-235", amount = 35},
            {type = "item", name = "plutonium", amount = 3}
        }
    end
else
    rocket_ingredients = {
        {type = "item", name = "processing-unit", amount = 10},
        {type = "item", name = "explosives", amount = 25},
        {type = "item", name = "uranium-235", amount = 25},
        {type = "item", name = "plutonium", amount = 5},
        {type = "item", name = "rocket", amount = 3}
    }
end

data:extend({ {
    type = "recipe",
    name = "atomic-bomb",
    enabled = false,
    energy_required = 50,
    ingredients = rocket_ingredients,
    results = {
        {type = "item", name = "atomic-bomb", amount = 1}
    },
}, {
    type = "ammo",
    name = "atomic-bomb",
    icon = "__Atomic_Overhaul__/graphics/vanilla/atomic-bomb.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
        layers = { {
            size = 64,
            filename = "__Atomic_Overhaul__/graphics/vanilla/atomic-bomb.png",
            scale = 0.5,
            mipmap_count = 4
        }, {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = base_graphics .. "atomic-bomb-light.png",
            scale = 0.5,
            mipmap_count = 4
        } }
    },
    ammo_category = "rocket",
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
} })
