using TOML

include("data/player.jl")

@enum Daytime begin
    night=0
    day=1
end

mutable struct Game
    daytime::Daytime
    round::UInt16

    allTeams::Vector{Team}

    maxPlayers::UInt8
    players::Vector{Player}
end

function Game_LoadStd!(game::Game, path::String)
    mainToml = TOML.parsefile(string(path, "/std.toml"))
    for teamName in mainToml["teams"]
        push!(game.allTeams, Team(teamName))
    end
end

function Game_CreateGame(maxPlayers::UInt8, players::Vector{Player})
    # TODO: Append cards to players
    game = Game(night, 0, [ ], maxPlayers, players)
    Game_LoadStd!(game, "std")
    return game
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