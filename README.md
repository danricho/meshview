
# Meshview

The project serves as a real-time monitoring and diagnostic tool for the Meshtastic mesh network. It provides detailed insights into the network's activity, including message traffic, node positions, and telemetry data.

I recommend using the pablorevilla's original fork unless you can follow what I'm doing in my updates (and my messy Git use) [pablorevilla](https://github.com/pablorevilla-meshtastic/meshview).

Also see sample.config.ini for config options.

# Significant changes I've done in my fork

 - Prioritised the running in Docker - I only use it in this way (see the docker-compose.yml and the docker [README](docker/READEME.md))
 - Changed to PicoCSS... cleaned up layouts throughout (likely missed somne I don't use)
 - Hide columns on nodelist for smaller viewports
 - Add colored dots with short name on nodelist
 - Added Footer Links config option
 - Added using a local TCP node to trigger traceroutes and send messages from the webui.
 - Add configurable Map tile sources.
 - Add configurable allowed area for nodes on map.
 - Changed the technique for dealing with co-located nodes on the map (circle around the actual position) 
 - Added Node colors to Map based on Node ID
 - Added light edges links on standard map (traceroute lines).
 - Added ability to configure a text search filter button in nodelist 
 - Minor bug fixes
 - Tried to keep up with core changes from the original repo (cherrypick/merge)... a learning exercise for me

