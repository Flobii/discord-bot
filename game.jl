include("data/player.jl")

@enum Daytime begin
    night=0
    day=1
end

mutable struct Game
    daytime::Daytime
    round::UInt16

    maxPlayers::UInt8
    players::Vector{Player}
end

function Game_CreateGame(maxPlayers::UInt8, players::Vector{Player})
    # TODO: Append cards to players
    return Game(night, 0, maxPlayers, players)
end

function Game_NextRound!(game::Game)
    game.round += 1
end

function Game_NextDaytime!(game::Game)
    if (game.daytime == night)
        game.daytime = day
        for player in game.players
            Player_OnDay!(player, game)
        end
    else
        game.daytime = night
        Game_NextRound!(game)
        for player in game.players
            Player_OnNight!(player, game)
        end
    end
end