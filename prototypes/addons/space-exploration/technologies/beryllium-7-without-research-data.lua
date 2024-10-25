data:extend({

    {
            type = "technology",
            name = "beryllium-7-without-research-data",
            icon = se_addon_graphics .. "beryllium-7-without-research-data.png",
            icon_size = 256,
            prerequisites = {"beryllium-7-reprocessing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "beryllium-7-without-research-data-recipe"
                }
            },
            unit =
        {
        count = 500,
        ingredients =
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"se-rocket-science-pack", 1},
            {"se-energy-science-pack-1", 1},
            {"research-data", 1}
        },
        time = 50
        }
    }
})