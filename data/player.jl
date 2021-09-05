include("status.jl")
include("card.jl")

mutable struct Player
    name::String
    card::Card
    statusEffects::Vector{Status}
    alive::Bool
end

Player(name) = Player(name, Card("", ""), [ ], true)

function Player_AppendStatus!(player::Player, status::Status)
    push!(player.statusEffects, status)
end

function Player_OnDay!(player::Player, game)
    
end

function Player_OnNight!(player::Player, game)
    for status in player.statusEffects
        status.duration -= 1
        if status.duration == 0
            filter!(e->e!=status, player.statusEffects)
        end
    end
end