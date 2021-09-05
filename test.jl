include("game.jl")

player = Player("test-player")

game = Game_CreateGame(UInt8(1), [ player ])

Player_AppendStatus!(player, Status("test", 1))

println(player.statusEffects)

Game_NextDaytime!(game)
Game_NextDaytime!(game)

println(player.statusEffects)