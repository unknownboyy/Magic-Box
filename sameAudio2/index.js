var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket){
  console.log('a user connected');
  socket.on('disconnect', function(){
    console.log('user disconnected');
  });
  socket.on("link_change",function(msg){
      io.emit("link_change",msg);
  })
  
});


http.listen(3000, function(){
  console.log('listening on *:3000');
});