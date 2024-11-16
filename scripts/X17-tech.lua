function X17Tech(event)
    local force = event.research.force
    local technologies = force.technologies
    local recipes = force.recipes

    if technologies["X17-weaponry"].researched then
        force.print({"chat-message.X17-weaponry"})
    end
end