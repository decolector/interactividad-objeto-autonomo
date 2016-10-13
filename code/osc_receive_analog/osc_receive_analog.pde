/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import oscP5.*;
import netP5.*;
import processing.serial.*;

//Serial port;

float data = 0.0; 

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(256,512);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  //printArray(Serial.list());
  //port = new Serial(this, Serial.list()[1], 9600);
  textSize(24);
}


void draw() {
  background(int(data/4));
  text(str(data), width/2, height/2);
}

void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
  println("### received an osc message. with address pattern "
    + theOscMessage.addrPattern()+" typetag "+ theOscMessage.typetag()     
    + "message content: "
    + theOscMessage.get(0).floatValue());

  if(theOscMessage.checkAddrPattern("/data")==true) {
    data = theOscMessage.get(0).floatValue();
    //port.write(data);
  }     

}