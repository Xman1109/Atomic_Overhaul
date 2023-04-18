local function FixUraniumResources()
    local ao_enrichUranium = (not game.active_mods["SchallUraniumProcessing"]) and
        settings.startup["ao-complexity-level"].value == "simple"
    local ao_breeder = (not game.active_mods["Nuclear Fuel"]) and
        settings.startup["ao-complexity-level"].value == "simple" and
        settings.startup["ao-breeder"].value
    if game.forces["player"].technologies["uranium-processing"].researched and ao_enrichUranium then
        game.forces["player"].recipes["uranium-low-enriched"].enabled = true
        game.forces["player"].recipes["uranium-235"].enabled = true
    end

    for i, force in pairs(game.forces) do
        if ao_breeder and ao_enrichUranium then
            force.technologies["kovarex-enrichment-process"].enabled = false
            force.recipes["kovarex-enrichment-process"].enabled = false
        else
            force.technologies["kovarex-enrichment-process"].enabled = true
            if force.technologies["kovarex-enrichment-process"].researched then
                force.recipes["kovarex-enrichment-process"].enabled = true
            end
        end
    end
end


script.on_init(function() --I will make this more compact in the future
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
    FixUraniumResources()
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
