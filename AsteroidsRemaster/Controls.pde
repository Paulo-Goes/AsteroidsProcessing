void mouseMoved() {
  float rotationSpeed = 0.5;
  float rotation = player.rotation;

  rotation -= (pmouseX - mouseX) * rotationSpeed;
  player.rotation = rotation;
}

void keyPressed() {
  if (gameStarted) {
    playerControls();
  } else if (showOptions) {
    optionsControls();
  } else {
    if (key == '1') {
      setup();
      killMenuAsteroids();
      gameStarted = !gameStarted;
    } else if (key == '2') {
      showOptions = !showOptions;
    } else if (key == '3') {
      exit();
    }
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    player.moveForward = false;
  }
  if (key == ' ') {
    player.triggerHappy = false;
  }
}

void playerControls() {
  if (key == 'w' || key == 'W') {
    player.moveForward = true;
  }
  if (key == ' ') {
    if (!player.triggerHappy) {
      PhaserBeam pew = player.FirePhaser();
      if (pew != null) {
        shootout.add(pew);
        player.triggerHappy = true;
      }
    }
  }
  if (key == '4') {
    gameStarted = !gameStarted;
    killMenuAsteroids();
  }
}

void optionsControls() {
  if (key == '1') {
  } else if (key == '2') {
    hideStars = !hideStars;
  } else if (key == '3') {
    showOptions = !showOptions;
  }
}
