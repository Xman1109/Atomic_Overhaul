data.raw["recipe"]["atomic-bomb"].icon = "__Krastorio2Assets__/icons/ammo/atomic-bomb.png"
data.raw["recipe"]["nuclear-fuel-reprocessing"].localized_name = { "recipe-name.ao-nuclear-fuel-reprocessing" }
-- data.raw["recipe"]["nuclear-fuel-reprocessing"].results = {{
--     type = "item",
--     name = "uranium-238",
--     amount = 6
-- }, {
--     type = "item",
--     name = "plutonium",
--     amount_min = 1,
--     amount_max = 3
-- }, {
--     type = "item",
--     name = "nuclear-waste",
--     amount = 5
-- }, {
--     type = "item",
--     name = "research-data",
--     amount_min = 1,
--     amount_max = 3
-- }, {
--     type = "item",
--     name = "tritium",
--     probability = 0.15,
--     amount = 1
-- }, {
--     type = "item",
--     name = "stone",
--     amount = 4
-- }}
modifyResults("nuclear-fuel-reprocessing", { {
    type = "item",
    name = "uranium-238",
    amount = 6
}, {
    type = "item",
    name = "plutonium",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 5
}, {
    type = "item",
    name = "research-data",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "tritium",
    probability = 0.15,
    amount = 1
}, {
    type = "item",
    name = "stone",
    amount = 4
} })

-- data.raw["recipe"]["uranium-without-research-data"].results = {{
--     type = "item",
--     name = "uranium-238",
--     amount = 6
-- }, {
--     type = "item",
--     name = "plutonium",
--     amount_min = 2,
--     amount_max = 4
-- }, {
--     type = "item",
--     name = "nuclear-waste",
--     amount = 5
-- }, {
--     type = "item",
--     name = "tritium",
--     probability = 0.20,
--     amount = 1
-- }, {
--     type = "item",
--     name = "stone",
--     amount = 4
-- }}
modifyResults("uranium-without-research-data", { {
    type = "item",
    name = "uranium-238",
    amount = 6
}, {
    type = "item",
    name = "plutonium",
    amount_min = 2,
    amount_max = 4
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 5
}, {
    type = "item",
    name = "tritium",
    probability = 0.20,
    amount = 1
}, {
    type = "item",
    name = "stone",
    amount = 4
} })

-- give every tech in list the research-data
if not mods["RealisticFusionPower"] then
    k2_list = { "kr-antimatter-ammo", "kovarex-enrichment-process", "kr-fusion-energy", "kr-antimatter-reactor",
        "kr-antimatter-reactor-equipment", "fusion-reactor-equipment", "spidertron", "kr-rocket-turret",
        "kr-nuclear-locomotive" }
else
    k2_list = { "kr-antimatter-reactor-equipment", "kr-antimatter-ammo", "kr-nuclear-locomotive",
        "kr-nuclear-reactor-equipment", "fusion-reactor-equipment", "spidertron", "kr-rocket-turret" }
end
for _, tech in pairs(k2_list) do
    table.insert(data.raw["technology"][tech].unit.ingredients, {
        type = "item",
        name = "research-data",
        amount = 1
    })
end

-- multiply the fuel_value by 6.25
data.raw["item"]["graphite-fuel-cell"].fuel_value = "19GJ"
data.raw["item"]["plutonium-fuel-cell"].fuel_value = "63GJ"
data.raw["item"]["MOX-fuel-cell"].fuel_value = "75GJ"
data.raw["item"]["thorium-fuel-cell"].fuel_value = "100GJ"

-- data.raw["recipe"]["graphite-fuel-cell-recipe"].results = {{
--     type = "item",
--     name = "graphite-fuel-cell",
--     amount = 1
-- }}
modifyResults("graphite-fuel-cell-recipe", { {
    type = "item",
    name = "graphite-fuel-cell",
    amount = 1
} })
-- data.raw["recipe"]["plutonium-fuel-cell-recipe"].results = {{
--     type = "item",
--     name = "plutonium-fuel-cell",
--     amount = 1
-- }}
modifyResults("plutonium-fuel-cell-recipe", { {
    type = "item",
    name = "plutonium-fuel-cell",
    amount = 1
} })
-- data.raw["recipe"]["MOX-fuel-cell-recipe"].results = {{
--     type = "item",
--     name = "MOX-fuel-cell",
--     amount = 1
-- }}
modifyResults("MOX-fuel-cell-recipe", { {
    type = "item",
    name = "MOX-fuel-cell",
    amount = 1
} })
-- data.raw["recipe"]["thorium-fuel-cell-recipe"].results = {{
--     type = "item",
--     name = "thorium-fuel-cell",
--     amount = 1
-- }}
modifyResults("thorium-fuel-cell-recipe", { {
    type = "item",
    name = "thorium-fuel-cell",
    amount = 1
} })
