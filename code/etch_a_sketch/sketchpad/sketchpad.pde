// By Camilo Martinez, base on code by Tom Igoe
// This example code is in the public domain.

import processing.serial.*;

Serial myPort;        // The serial port
float xPos, yPos, pxPos, pyPos = 0;         // horizontal position of the graph

String[] vals;
void setup () {
  // set the window size:
  size(800, 600);

  // List all the available serial ports
  // if using Processing 2.1 or later, use Serial.printArray()
  println(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[1], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  // set inital background:
  background(0);
}
void draw () {
  //map incoming values to width and height range
  xPos = map(int(vals[0]), 0, 1023, 0, width);
  yPos = map(int(vals[1]), 0, 1023, 0, height);
  stroke(255);
  
  // draw the line:
  line(xPos, yPos, pxPos, pyPos);
  
  //update past variables
  pxPos = xPos;
  pyPos = yPos;
}

//event to process incoming serial data
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    //split values by the ',' char, and store them in a list
    vals = split(inString, ',');
    //just for debugging    
    printArray(vals);
  }
}