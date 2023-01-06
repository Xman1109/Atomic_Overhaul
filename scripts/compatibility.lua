-- this script replaces the nuclear fuel reprocessing recipe with a custom one
if k2_se then
    script.on_init(
        function()
            for index, force in pairs(game.forces) do
                local technologies = force.technologies
                local recipe = force.recipes
                if technologies["nuclear-fuel-reprocessing"].researched then
                    recipe["ao-nuclear-fuel-reprocessing"].enabled = true
                end
            end
        end)
end

if bobplates then
    script.on_init(
        function()
            for index, force in pairs(game.forces) do
                local technologies = force.technologies
                local recipe = force.recipes
                if recipe["empty-nuclear-fuel-reprocessing"].enabled then
                    technologies["ao-graphite-processing"].enabled = true
                end
            end
        end)
end

if bzcarbon then
    script.on_init(
        function()
            for index, force in pairs(game.forces) do
                local technologies = force.technologies
                if technologies["ao-graphite-processing"].researched then
                    technologies["graphite-processing"].researched = true
                end
            end
        end)
end
