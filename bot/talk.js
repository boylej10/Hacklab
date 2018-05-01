var talk = new p5.Speech();
var listen = new p5.SpeechRec();

var bot;

var a,b,q;

function setup(){
  createCanvas(100,100);
  background(0);

  b = select('#sumbit');
  q = select('#user');
  a = select('#response');
  //b.mousePressed(chatBot);

  bot = new RiveScript();
  bot.loadFile("./brain.rive", botReady, botError);

  talk.speak("Hello, you are talking to rivescript")

  listen.continuous = true;
  listen.onResult = showResult;
  listen.start();
}

function botReady(){
  bot.sortReplies();
}

function botError(){

}

function chatBot(){
  var question = q.value();
  var reply = bot.reply("local-user", question);

  a.value(reply);
  talk.speak(reply);
}

function draw(){
  fill(random(200),random(200),random(200),90);
  ellipse(mouseX,mouseY,10,10)
}

function showResult(){
  console.log(listen.resultString)
  q.value(listen.resultString);
  chatBot();
}

function keyPressed(){

}
