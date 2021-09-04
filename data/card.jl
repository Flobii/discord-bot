using TOML
using Images

struct Card
    name::String
    events::[]
    description::String
    image::String
end

"""
    Card_FromFile(file::AbstractString)

# Arguments
- `file::AbstractString`: The file  to 
"""
function Card_FromFile(file::AbstractString)
    cards = Card[]
    file = TOML.parsefile(file)
    for name in keys(file)
        push!(cards, Card(name, file[name]))
    end
end
