using TOML
using Base: open

include("event.jl")
include("team.jl")

struct File
    adress::String
end

struct Url
    adress::String
end

# Denke nicht, dass ein mutable struct nötig ist, da die events sowieso mutable ist
# (weil Vector)
"""
    Card

# Arguments
- `name::String`: The name of the Card
- `events::Vector{Event}`: A Vector storing all possible Events for the Card
- `description::String`: A helpful description of the Card
- `image::Union{File,Url}`: A file or URL for the Card's Image
- `team::Team`: The Cards Team
"""
struct Card
    name::String
    events::Vector{Event}
    description::String
    image::Union{File,Url}
    team::Team
end

"""
    Card_FromFile(file::AbstractString)

# Arguments
- `file::AbstractString`: The file storing the card(s)
                          see `example.toml` for structure
"""
function Card_FromFile(file::AbstractString)
    cards = Card[]
    file = TOML.parsefile(file)
    for name in keys(file)
        # manipulate image to later determine if file or url
        image = lowercase(file[name]["image"])
        if startswith(image, "url:")
            image = Url(image)
        elseif startswith(image, "file:")
            image = File(replace(image))
        else
            @warn "Cannot determine image type of image for card $name"
        end
    
        # create events for card
        events = Event_CreateEvent.(file[name]["events"])

        description = file[name]["description"]
        push!(cards, Card(name, events, description, image))
    end

    return cards
end
