# app.rb
require 'rack'
require 'faye/websocket'

def getFile(path)
  return File.read("./public#{path}")
end

App = lambda do |env|
  req = Rack::Request.new(env)
  print req.path_info
  if Faye::WebSocket.websocket?(env)
    puts "\t\tws"
    ws = Faye::WebSocket.new(env)

    ws.on :onopen do |event|
      puts "socket\tconnected"
    end

    ws.on :message do |event|
      puts "socket\tmessage\t#{event.data}"
      ws.send(event.data)
    end

    ws.on :close do |event|
      puts "socket\tclose\t#{event.code}\t#{event.reason}"
      ws = nil
    end

    # Return async Rack response
    ws.rack_response

  else
    puts "\tstatic"
    case req.path_info
    when '/', '/index.html'
      [ 200, { "Content-Type" => "text/html" }, [ getFile('/index.html') ] ]

    when '/js/sc.js'
      [ 200, { "Content-Type" => "text/javascript" }, [ getFile('/js/sc.js') ] ]

    when '/js/ws.js'
      [ 200, { "Content-Type" => "text/javascript" }, [ getFile('/js/ws.js') ] ]

    when '/css/style.css'
      [ 200, { "Content-Type" => "text/css" }, [ getFile('/css/style.css') ] ]

    else
      [ 404, { "Content-Type" => "text/html" }, [ 'Nah Brah' ] ]

    end
  end
end