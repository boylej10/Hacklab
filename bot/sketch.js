var talk;
var listen;

function setup(){

  createCanvas(812,812);
  background(0);
  talk = new p5.Speech();
  talk.speak("here I go");

  listen = new p5.SpeechRec();
  listen.continuous = true;
  listen.onResult = showVoice;
  listen.start();

}

function draw(){

  fill(random(255), random(255), random(255), random(100));
  ellipse(mouseX, mouseY, 25, 25);

}

function showVoice(){
  console.log(listen.resultString);
}

function keyPressed(){
  talk.speak("good afternoon ro b")
}
