import oscP5.*;
import netP5.*;
import processing.serial.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

Serial port;


float data = 0;


void setup(){
  size(512, 256);
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("192.168.1.138", 12000);
  port = new Serial(this, Serial.list()[3], 9600);

  textSize(24);
}

void draw(){
  text(str(data), width/2, height/2);
}



void sendData() {
  /* in the following different ways of creating osc messages are shown by example */
    OscMessage myMessage = new OscMessage("/data");
    myMessage.add(data); /* add an int to the osc message */
    /* send the message */
    oscP5.send(myMessage, myRemoteLocation);
}

//event to process incoming serial data
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    //split values by the ',' char, and store them in a list
  
    data = float(inString);
    //just for debugging    
    println(data);
    sendData();

  }
}