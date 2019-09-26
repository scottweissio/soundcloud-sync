# soundcloud-sync


## setup
install ruB

setup nginx to forward default port 9292

`gem install bundler`

`cd site` 

```
sudo apt-get install build-essential 
```


```
sudo apt-get install ruby-dev
sudo apt-get install ruby2.0-dev
sudo apt-get install ruby2.2-dev
sudo apt-get install ruby2.3-dev
```


`bundle install`
`./start.sh`



## todo

- rewrite metadata + playlist load to abuse the widget
- queue send list instead of song by song
- volume control
- sync to timecode on load
- split front and backend servers
- in front end split into services `TransportController` >messages> `Websocket` (play,pause,skip,next)
`Websocket` >commands> `PlayerInstance` (Interface for SoundCloud//Spotify//YouTube)
`Websocket` >updates> `Client` (user list, playlist, currently playing song)
`Client` >queries> `PlayerInstance` (metadata, artwork, playlist contents)
`Client` >messages> `Websocket` (playlist manipulation, queue, clear, shuffle)

- store most recent state server side so we can send it on init
- server side user identification and determination of who is allowed to broadcast
- connected user list
- typescript for front end
- unit testing for both services
- one line build/run process and directory monitoring
- fix web socket hardcoded address
- multiple channel/room support 



- youtube integration
- spotify integration (needs authentication so like a db probably and a more legit webserver)
- scrubbing and timecode sync
- prettyfy
- discord integration
