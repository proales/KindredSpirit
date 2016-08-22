// Pixel Pusher setup class.
class PixelPusherObserver implements Observer {
  public boolean hasStrips = false;
  public void update(Observable registry, Object updatedDevice) {
    //println("PixelPusher registration changed!");
    if (updatedDevice != null) {
      //println("PixelPusher change: " + updatedDevice);
    }
    this.hasStrips = true;
  }
}

void drawPixelPusher(){
  if (pixelPusherObserver.hasStrips) {
    List<PixelPusher> pusherList = registry.getPushers();
    for(PixelPusher pusher : pusherList) {
      List<Strip> strips = pusher.getStrips();
      for(int stripX = 0; stripX < strips.size(); stripX++) {
        Strip strip = strips.get(stripX);
        Strip stripInverted = strips.get(stripX+3);
        int stripLength = strip.getLength();
        for (int pixelX = 0; pixelX < stripLength; pixelX++) {
           int averageColor = getAverageColor(stripX, pixelX);
           strip.setPixel(averageColor , map400[pixelX]);
           stripInverted.setPixel(averageColor , map400Inverted[pixelX]);
        }
      }
    }
  }
}

int getAverageColor(int sheet, int pixelX) {
  int sheetXOffset = sheetXOffset(sheet);
  int x = pixelX % sheetWidth;
  int y = pixelX / sheetHeight;
  return avgColors[sheetXOffset + x][y];
}

int sheetXOffset(int sheet) {
  /**  Sheets are arranged like so:
   *   Port Side: 0, 1, 2
   *   Starboard: 3, 4, 5
   */
   switch (sheet) {
     case 0: return 0;
     case 1: return sheetWidth;
     case 2: return sheetWidth * 2;
   }
   
   return 0;
}