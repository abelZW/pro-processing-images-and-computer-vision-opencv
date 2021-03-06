PImage img;

void setup() {
  size(750, 750);
  img = createImage(width, height, ARGB);
  noLoop();
}

void draw() {
  background(0);
  img.loadPixels();
  float distMax = max(img.width/2, img.height/2);
  PVector ctr = new PVector(img.width/2, img.height/2);
  for (int y=0; y<img.height; y++) {
    int rows = y*img.width;
    for (int x=0; x<img.width; x++) {
      float d = distance(ctr, new PVector(x, y));
      float c = map(d, 0, distMax, 0, 255);
      color col = color(c, 0, 255-c);
      img.pixels[rows+x] = col;
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}

float distance(PVector p1, PVector p2) {
  float d = p1.dist(p2);
  return d;
}