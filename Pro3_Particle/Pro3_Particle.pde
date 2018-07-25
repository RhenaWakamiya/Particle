ParticleRenderer renderer;

void setup() {
  size(800, 600);
  noStroke();
  background(0);
  renderer = new ParticleRenderer(width, height);
}

void draw() {
  background(0);
  //fill(255, 0, 0);
  //ellipse(100, 100, 100, 100);

  PVector mouse = new PVector(mouseX, mouseY);
  renderer.update(mouse);
  PImage img = renderer.getImage();
  image(img, 0, 0);
}