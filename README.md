bigmap is a Gamemaker Studio project showing a way to produce large game maps while keeping the object count low.

The game dynamically creates and destroys an active map area that is only a part of the total map. The visible portion is smaller still.
The idea is that activity may take place beyond the player's view but within a reasonable distance, further than that distance and the objects are trashed.
Currently the map is created using a single bitmap as a bitfield but better map strategies are possible.

A more sophisticated version of the game ran in Gamemaker 5.3, and had code to dynamically create tiles as needed using sprite creation commands, but that
code does not play well with HTML5 so it has been removed in favour of simply colouring tiles.

Sadly the actual gameplay never developed beyond navigating a map to a destination marker.
