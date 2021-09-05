using Discord
using Chain

const AUTH_TOKEN = ""
const PREFIX = ";w"

client = Client(AUTH_TOKEN; presence=(game=(name="$PREFIX help", type=AT_GAME),), prefix = ";w")

function helloWorld()

end

add_command!(
    client,
    :helloWorld,
    (c, m) -> reply(c, m, Embed());
    help = "A little hello World test command."
)
