-- when a technology is researched, ensure the recipe is enabled

function rrCentrifuge(event)
    local force = event.research.force
    local technologies = force.technologies
    local recipes = force.recipes

    if technologies["non-moderated-fuel-processing"].researched then
        recipes["centrifuge"].enabled = true
    end
end