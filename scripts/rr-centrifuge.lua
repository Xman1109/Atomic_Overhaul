-- when a technology is researched, ensure the recipe is enabled

script.on_event(defines.events.on_research_finished, function(event)
    local force = event.research.force
    local technologies = force.technologies
    local recipes = force.recipes

    if technologies["non-moderated-fuel-processing"].researched then
        recipes["centrifuge"].enabled = true
    end
end)