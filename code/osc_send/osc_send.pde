import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

boolean on = false;

String msg = "";

void setup(){
  size(512, 256);
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  textSize(24);
}

void draw()
{
  if(on){
    background(255);
    fill(0);
    text("ON", width/2, height/2);
  }else{
    background(0);
    fill(255);
    text("OFF", width/2, height/2 );  
  }
}

void mousePressed() {
  on = !on;
  sendOn();
}

void keyPressed() 
{
  if ( key == 'o' ) {
    on = !on;
    sendOn();
  }
}

void sendOn() {
  /* in the following different ways of creating osc messages are shown by example */
  if(on){
    OscMessage myMessage = new OscMessage("/on");
    myMessage.add(on); /* add an int to the osc message */
    /* send the message */
    oscP5.send(myMessage, myRemoteLocation);
  }else{
    OscMessage myMessage = new OscMessage("/off");
    myMessage.add(on); /* add an int to the osc message */
    /* send the message */
    oscP5.send(myMessage, myRemoteLocation);  
  } 
}