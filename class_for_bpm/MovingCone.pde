class MovingCone {

  float xLocation;
  float yLocation;

  MovingCone(float xTemp, float yTemp) {
    xLocation = xTemp;
    yLocation = yTemp;
  }

  void draw() {
    pushMatrix();
    pushStyle();

    translate(xLocation, yLocation);
    rotateX(radians(60));
    noFill();
    strokeWeight(3);

    for (int j=0; j<10; j++) {

      color red = int(map (   sin(radians(frameCount + j*25.5)), -1, 1, 0, 255        ));
      color green = int(map (   cos(radians(frameCount + j*25.5)), -1, 1, 0, 255        ));
      color blue = j * 25;
      blue = int(map(bpm.triggerNorm, 0, 1, 0, 255));
      stroke(red, green, blue);

      beginShape();
      for (int i=0; i<360; i++) {
        float r = j*10;
        float x = r * cos(radians(i));
        float y = r * sin(radians(i));
        float z = sin(radians(frameCount + j*10))*50;
        float beatSinus = map(easeInOutCirc(bpm.triggerNorm), 0, 1, 0, TWO_PI);
        z = sin(beatSinus+ radians(j*10))*50;
        vertex(x, y, z);
      }
      endShape(CLOSE);
      //line(-100, 0, 100, 0);
    }

    popStyle();
    popMatrix();
  }

  float easeInOutCirc(float x) {
    return x < 0.5 ? 4 * x * x * x : 1 - pow(-2 * x + 2, 3) / 2;
  }
}
