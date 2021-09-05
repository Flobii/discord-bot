include("data/player.jl")

player = Player("test-player")

Player_AppendStatus!(player, Status("test", -1))

for i in player.statusEffects
    print(i)
end