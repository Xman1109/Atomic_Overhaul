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
            {type="item", name="se-delivery-cannon-capsule", amount=1},
            {type="item", name="se-heat-shielding", amount=20}
            --WIP
        },
        group = "atomic-overhaul",
        subgroup = "delivery-capules",
        order = "a",
        results = {{ type = "item", name = "lead-delivery-capsule", amount = 1 }}
    }
})
