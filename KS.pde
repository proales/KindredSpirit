void setup() {
  // Define window size
  // Size will only take numbers so keep
  // in sync with global height & width
  size(625, 200);
  
  // No lines
  noStroke();
  
  // Setup pixel pusher
  registry = new DeviceRegistry();
  pixelPusherObserver = new PixelPusherObserver();
  registry.addObserver(pixelPusherObserver);
  registry.setLogging(false);
  registry.setAntiLog(true);
  
  // Setup drawing variables
  avgColors = new int[numberColumns][numberRows];
  
  // Start sending pixels to PixelPushers
  registry.startPushing();
  registry.setAutoThrottle(true);  
}