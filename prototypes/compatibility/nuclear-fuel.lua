data.raw["recipe"]["nuclear-fuel"].icon = "__base__/graphics/icons/nuclear-fuel.png"
data.raw["recipe"]["nuclear-fuel"].icon_size = 64
data.raw["recipe"]["nuclear-fuel"].icon_mipmaps = 4

-- data.raw["recipe"]["nuclear-fuel-reprocessing"].results = {{
--     type = "item",
--     name = "plutonium",
--     amount_min = 1,
--     amount_max = 3
-- }, {
--     type = "item",
--     name = "uranium-238",
--     amount = 3
-- }, {
--     type = "item",
--     name = "nuclear-waste",
--     amount = 5
-- }, {
--     type = "item",
--     name = "research-data",
--     amount_min = 1,
--     amount_max = 3
-- }}
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

-- data.raw["recipe"]["breeder-fuel-cell"].subgroup = "fuel-cells"
-- data.raw["recipe"]["breeder-fuel-cell"].order = "c[plutonium-fuel-cell-recipe]-d[breeder-fuel-cell]"
regroup("breeder-fuel-cell", nil, "fuel-cells", "c[plutonium-fuel-cell-recipe]-d[breeder-fuel-cell]")
-- data.raw["recipe"]["breeder-fuel-cell"].ingredients = {{"empty-fuel-cell", 10}, {"plutonium", 1}, {"uranium-238", 19}}
modifyIngredients("breeder-fuel-cell", { { "empty-fuel-cell", 10 }, { "plutonium", 1 }, { "uranium-238", 19 } })

-- data.raw["recipe"]["breeder-fuel-reprocessing"].subgroup = "reprocessing"
-- data.raw["recipe"]["breeder-fuel-reprocessing"].order = "c[plutonium-fuel-reprocessing]-d[breeder-fuel-reprocessing]"
regroup("r", "breeder-fuel-reprocessing", nil, "reprocessing",
    "c[plutonium-fuel-reprocessing]-d[breeder-fuel-reprocessing]")

-- data.raw["technology"]["mox-fuel"].hidden = true
hideType("t", "mox-fuel")
-- data.raw["recipe"]["nuclear-fuel-pu"].hidden = true
-- data.raw["recipe"]["mox-fuel-cell"].hidden = true
hideType("r", { "mox-fuel-cell", "nuclear-fuel-pu" })

-- data.raw["technology"]["nuclear-rocket-fuel"].effects = { {
--     type = "unlock-recipe",
--     recipe = "nuclear-fuel"
-- }, {
--     type = "unlock-recipe",
--     recipe = "plutonium-fuel-recipe"
-- } }
modifyEffects("nuclear-rocket-fuel", { {
    type = "unlock-recipe",
    recipe = "nuclear-fuel"
}, {
    type = "unlock-recipe",
    recipe = "plutonium-fuel-recipe"
} })

data:extend({ {
    type = "recipe",
    name = "atomic-bomb",
    enabled = false,
    energy_required = 50,
    ingredients = { { "rocket-control-unit", 10 }, { "explosives", 25 }, { "uranium-235", 30 }, { "plutonium", 15 },
        { "rocket", 3 } },
    result = "atomic-bomb"
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
