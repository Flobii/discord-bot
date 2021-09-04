module TestStatus
include("status.jl")
end

import .TestStatus

const ACTION_FUNCTIONS = Dict(

)
 
struct Action
    name::String
end

function Action_Activate(action::Action, player::Player)
    ACTION_FUNCTIONS[action.name](player)
end