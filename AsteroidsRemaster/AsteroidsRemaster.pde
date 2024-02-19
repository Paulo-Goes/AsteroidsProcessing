Player player;
ArrayList<Asteroid> asteroidField;
ArrayList<PhaserBeam> shootout;
IntList asteroidRemove;
IntList phaserBeamRemove;
IntList explosionRemove;
boolean hideStars = false;
boolean gameStarted, showOptions, killMenuAsteroids;

int score;

void setup() {
  fullScreen();
  player = new Player();
  asteroidField = new ArrayList<Asteroid>();
  for (int i = 0; i < floor(random(20, 40)); i++) {
    asteroidField.add(new Asteroid());
  }
  asteroidRemove = new IntList();
  shootout = new ArrayList<PhaserBeam>();
  phaserBeamRemove = new IntList();
  explosionRemove = new IntList();
  gameStarted = false;
  showOptions = false;
  score = 0;
}



void draw() {
  background(0);
  FPS();
  if (gameStarted) {
    Update();
    Render();
    HUD();
  } else {
    if (showOptions) {
      options();
    } else {
      menu();
    }
  }
}

void Update() {
  player.update();
  for (int i = 0; i < asteroidField.size(); i++) {
    asteroidField.get(i).Update();
    if (player.checkCollision(asteroidField.get(i))) {
      player.dead = true;
      gameStarted = !gameStarted;
    }
  }
  for (int i = 0; i < shootout.size(); i++) {
    shootout.get(i).update();
  }
  for (int s = 0; s < shootout.size(); s++) {
    for (int a = 0; a < asteroidField.size(); a++) {
      if (shootout.get(s).checkCollision(asteroidField.get(a))) {
        phaserBeamRemove.append(s);
        asteroidRemove.append(a);
        score++;
        break;
      }
    }
  }

  //Remove
  for (int i = 0; i < phaserBeamRemove.size(); i++) {
    if (phaserBeamRemove.get(i) < shootout.size()) shootout.remove(phaserBeamRemove.get(i));
  }
  phaserBeamRemove.clear();
  for (int i = 0; i < asteroidRemove.size(); i++) {
    if (asteroidRemove.get(i) < asteroidField.size()) asteroidField.remove(asteroidRemove.get(i));
  }
  asteroidRemove.clear();
  explosionRemove.clear();
}
void Render() {
  player.draw();
  for (int i = 0; i < asteroidField.size(); i++) {
    asteroidField.get(i).Render();
  }
  for (int i = 0; i < shootout.size(); i++) {
    shootout.get(i).render();
  }
}
