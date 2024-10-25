data.raw["recipe"]["nuclear-fuel"].icon = base_graphics .. "nuclear-fuel.png"
data.raw["recipe"]["nuclear-fuel"].icon_size = 64
data.raw["recipe"]["nuclear-fuel"].icon_mipmaps = 4
modifyResults("nuclear-fuel-reprocessing", { {
    type = "item",
    name = "plutonium",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "uranium-238",
    amount = 3
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 5
}, {
    type = "item",
    name = "research-data",
    amount_min = 1,
    amount_max = 3
} })
regroup("r", "breeder-fuel-cell", nil, "fuel-cells", "c[plutonium-fuel-cell-recipe]-d[breeder-fuel-cell]")
modifyIngredients("breeder-fuel-cell", { {type="item", name="empty-fuel-cell", 10 }, {type="item", name="plutonium", amount=1}, { "uranium-238", amount=19} })
regroup("r", "breeder-fuel-reprocessing", nil, "reprocessing",
    "c[plutonium-fuel-reprocessing]-d[breeder-fuel-reprocessing]")
hideType("t", "mox-fuel")
hideType("r", { "mox-fuel-cell", "nuclear-fuel-pu" })
modifyEffects("nuclear-rocket-fuel", { {
    type = "unlock-recipe",
    recipe = "nuclear-fuel"
} })

data:extend({ {
    type = "recipe",
    name = "atomic-bomb",
    enabled = false,
    energy_required = 50,
    ingredients = { {type="item", name="processing-unit", 10 }, {type="item", name="explosives", 25 }, { "uranium-235", amount=30}, { "plutonium", amount=15},
        {type="item", name="rocket", amount=3} },
    results = {{ type = "item", name = "atomic-bomb", amount = 1 }}
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
            scale = 0.25,
            mipmap_count = 4
        }, {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = base_graphics .. "atomic-bomb-light.png",
            scale = 0.25,
            mipmap_count = 4
        } }
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
} })
