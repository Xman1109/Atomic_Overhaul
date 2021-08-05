data:extend({
    
    {
            type = "technology",
            name = "thorium-processing",
            icon = "__Atomic_Overhaul__/graphics/icons/group.png",
            icon_size = "128",
            prerequisites = {"uranium-processing"},
            effects =
            {
                {
                   type = "unlock-recipe",
                   recipe = "thorium-recipe"
                }          
            },
            unit =
        {
        count = 2500,
        ingredients =
            {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1},
              {"chemical-science-pack", 1},
            --{"research-data", 1}
            },
        time = 45
        }
    }
    
})