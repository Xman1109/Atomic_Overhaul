-- checking if the mod is loaded on a used savegame for the first time
function checkSave()
    game.print(
        "\nNOTE: If Atomic Overhaul has been added to an already existing savegame, you may need to troubleshoot your nuclear processing.\n")
end

script.on_init(checkSave)

-- this script replaces the nuclear fuel reprocessing recipe with a custom one
if k2_se then
    function replace_nfr()
        for index, force in pairs(game.forces) do
            local technologies = force.technologies
            local recipe = force.recipes
            if technologies["nuclear-fuel-reprocessing"].researched then
                recipe["ao-nuclear-fuel-reprocessing"].enabled = true
            end
        end
    end
end
script.on_init(replace_nfr)

if bobplates then
    function enablestuff()
        for index, force in pairs(game.forces) do
            local technologies = force.technologies
            local recipe = force.recipes
            if recipe["empty-nuclear-fuel-reprocessing"].enabled then
                technologies["ao-graphite-processing"].enabled = true
            end
        end
    end
end
script.on_init(enablestuff)

if bzcarbon then
    function enablestuff()
        for index, force in pairs(game.forces) do
            local technologies = force.technologies
            if technologies["ao-graphite-processing"].researched then
                technologies["graphite-processing"].researched = true
            end
        end
    end
end
script.on_init(enablestuff)
