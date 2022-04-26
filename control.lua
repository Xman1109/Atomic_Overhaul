-- checking if the mod is loaded on a used savegame for the first time
function checkSave()
    game.print(
        "\nINFO: If Atomic Overhaul has been added to a used save, you may need to troubleshoot your nuclear processing.\n")
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
