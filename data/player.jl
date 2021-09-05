include("status.jl")
include("card.jl")

struct Player
    name::String
    card::Card
    statusEffects::Vector{Any}
    alive::Bool
end

Player(name) = Player(name, Card("", ""), [ ], true)

function Player_AppendStatus!(player::Player, status::Status)
    push!(player.statusEffects, status)
end