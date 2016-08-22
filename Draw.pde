
void draw() {
  // Setup canvas
  background(0);
  fill(255);
 
  // Get screenshot
  try{
    Robot robot_Screenshot = new Robot();                        
    // 50 for MacOS Header, 0 for offset from top adjustment
    screenshot = new PImage(robot_Screenshot.createScreenCapture(new Rectangle(0, screenshotYAdjustment + 50, 600, 200)));
  }
  catch (AWTException e){ }
  
  // Copy screenshot to canvas
  image(screenshot, 0, 0, pixelColumns, pixelRows);
  
  // Load the canvas pixel buffer
  loadPixels();
  
  // Iterate through to average pixels and apply adjustments
  drawPixelizeImage();
  
  // Send the pixels to the PixelPushers
  drawPixelPusher();

  // Draw box on canvas for current selected color
  fill(colorSelected);
  rect(canvasWidth - colorBandWidth, 0, colorBandWidth, canvasHeight / 2);
  
  // Draw box on canvas for current displayed color
  fill(colorOverlay);
  rect(canvasWidth - colorBandWidth, canvasHeight / 2, colorBandWidth, canvasHeight / 2);
} 