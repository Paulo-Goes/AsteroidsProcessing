void FPS() {
  textAlign(RIGHT, BOTTOM);
  fill(0, 255, 0);
  textSize(12);
  text(int(frameRate) + " FPS", width -10, height -10);
}

void HUD() {
  textAlign(LEFT, BASELINE);
  noFill();
  stroke(255);

  rect(10, 20, 500, 120);

  fill(255);
  textSize(20);
  text("Horizontal Speed: " + nf(player.speedX, 0, 2), 20, 40);
  text("Vertical Speed: " + nf(player.speedY, 0, 2), 20, 60);
  text("Score: " + nf((int)score), 20, 80);
}

void menu() {
  fill(255);
  textSize(48);
  textAlign(CENTER);
  text("Asteroids", width/2, height/2 - 50);
  textSize(24);
  text("1 - Jogar", width/2, height/2 + 100);
  text("2 - Opções", width/2, height/2 + 150);
  text("3 - Sair", width/2, height/2 + 200);

  textAlign(LEFT);

  for (int i = 0; i < asteroidField.size(); i++) {
    asteroidField.get(i).Render();
    asteroidField.get(i).Update();
  }
}

void options() {
  fill(255);
  textSize(48);
  textAlign(CENTER);
  text("Opções", width/2, height/2 - 50);
  textSize(24);
  text("1 - Esconder HUD", width/2, height/2 + 100);
  text("2 - Esconder estrelas", width/2, height/2 + 150);
  text("3 - Menu principal", width/2, height/2 + 200);

  textAlign(LEFT);
}

void killMenuAsteroids() {
  asteroidField.clear();

  for (int i = 0; i < floor(random(20, 40)); i++) {
    asteroidField.add(new Asteroid());
  }
}
