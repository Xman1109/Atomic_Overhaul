local shielding_material = "se-heat-shielding"
if data.raw["item"]["lead-plate"] then
    shielding_material = "lead-plate"
end

data:extend({
    {
        type = "recipe",
        name = "lead-delivery-recipe",
        enabled = false,
        energy_required = 10,
        ingredients = {
            { "se-delivery-cannon-capsule", 1 },
            { "se-heat-shielding", 20 }
            --WIP
        },
        group = "atomic-overhaul",
        subgroup = "delivery-capules",
        order = "a",
        result = "lead-delivery-capsule"
    }
})
