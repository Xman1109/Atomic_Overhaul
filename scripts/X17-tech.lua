-- when X17-weaponry is researched, print a chat message to the force
function X17Tech(event)
    if event.research.name == "X17-weaponry" then
        event.research.force.print({ "chat-message.X17-weaponry" })
    end
end
