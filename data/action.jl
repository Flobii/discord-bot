include("status.jl")

const ACTION_FUNCTIONS = Dict(

)
 
struct Action
    name::String
    prequisits::Dict{Status, Bool}
end

function Action_Activate(action::Action, player::Player)
    ACTION_FUNCTIONS[action.name](player)
end