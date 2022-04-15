data:extend({
    {
        type = "recipe",
        name = "waste-solution-reprocessing",
        icon = graphics .. "waste-solution-reprocessing.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "chemistry",
        enabled = false,
        energy_required = 10,
        subgroup = "fluid-recipes",
        ingredients = {
            {type = "fluid", name = "waste-solution", amount = 50}
        },
        results = {
            {type = "item", name = "uranium-238", amount =  5, probability = 0.25},
            {type = "item", name = "plutonium", amount =  3, probability = 0.25},
            {type = "item", name = "MOX", amount =  2, probability = 0.25},
            {type = "item", name = "thorium", amount =  1, probability = 0.1},
        }
    }
})