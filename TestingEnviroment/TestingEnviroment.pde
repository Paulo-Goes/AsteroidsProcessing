Asteroid asteroid;

void setup(){
  fullScreen();
}

void draw(){
  background(0);
  
  showPositions();
  
  asteroid = new Asteroid();
  asteroid.Update();
  asteroid.Render();
  delay(2000);
}

void showPositions(){
  textAlign(LEFT, BASELINE);
  stroke(255);
  textSize(20);
  
  text(width, width - 40, height / 2);
  text("0", 10 , height / 2);
  
  text(height, width / 2, height - 20);
  text("0", width / 2 , 20);
}