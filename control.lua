script.on_init(function()
    if remote.interfaces["kr-radioactivity"] then
        remote.call("kr-radioactivity", "add_item", "plutonium-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "plutonium")
        remote.call("kr-radioactivity", "add_item", "plutonium-fuel")
        remote.call("kr-radioactivity", "add_item", "plutonium-depleted-cell")
        remote.call("kr-radioactivity", "add_item", "MOX-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "MOX")
        remote.call("kr-radioactivity", "add_item", "MOX-depleted-cell")
        remote.call("kr-radioactivity", "add_item", "thorium-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "thorium")
        remote.call("kr-radioactivity", "add_item", "thorium-depleted-cell")
        if settings.startup["se-addon"].value == true and game.active_mods["space-exploration"] then
            remote.call("kr-radioactivity", "add_item", "iridium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "iridium-192")
            remote.call("kr-radioactivity", "add_item", "iridium-depleted-cell")
            remote.call("kr-radioactivity", "add_item", "holmium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "holmium-166")
            remote.call("kr-radioactivity", "add_item", "holmium-depleted-cell")
            remote.call("kr-radioactivity", "add_item", "beryllium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "beryllium-7")
            remote.call("kr-radioactivity", "add_item", "beryllium-depleted-cell")
        end
    end
end)
script.on_configuration_changed(function()
    if remote.interfaces["kr-radioactivity"] then
        remote.call("kr-radioactivity", "add_item", "plutonium-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "plutonium")
        remote.call("kr-radioactivity", "add_item", "plutonium-fuel")
        remote.call("kr-radioactivity", "add_item", "plutonium-depleted-cell")
        remote.call("kr-radioactivity", "add_item", "MOX-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "MOX")
        remote.call("kr-radioactivity", "add_item", "MOX-depleted-cell")
        remote.call("kr-radioactivity", "add_item", "thorium-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "thorium")
        remote.call("kr-radioactivity", "add_item", "thorium-depleted-cell")
        if settings.startup["se-addon"].value == true and game.active_mods["space-exploration"] then
            remote.call("kr-radioactivity", "add_item", "iridium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "iridium-192")
            remote.call("kr-radioactivity", "add_item", "iridium-depleted-cell")
            remote.call("kr-radioactivity", "add_item", "holmium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "holmium-166")
            remote.call("kr-radioactivity", "add_item", "holmium-depleted-cell")
            remote.call("kr-radioactivity", "add_item", "beryllium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "beryllium-7")
            remote.call("kr-radioactivity", "add_item", "beryllium-depleted-cell")
        end
    end
end)

-- checking if the mod is loaded on a used savegame for the first time
script.on_init(function()
    game.print(
        "\nNOTE: If Atomic Overhaul has been added to an already existing savegame, you may need to troubleshoot your nuclear processing.\n")
end)

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
