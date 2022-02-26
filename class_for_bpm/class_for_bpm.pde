BPM bpm = new BPM(60);
ArrayList <MovingCone> cones = new ArrayList<MovingCone>();

void setup () {
  size(500, 500, P3D);
  fullScreen(P3D);
  pixelDensity(2);
  smooth();
  ortho();
  for (int i=0; i<10; i++) {
    cones.add(new MovingCone(random(width), random(height)));
  }
}

void draw() {
  background(240);
  bpm.run();

  for (int i=0; i<cones.size(); i++) {
    MovingCone c = cones.get(i);
    c.draw();
  }
}
