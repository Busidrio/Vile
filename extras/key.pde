import java.util.HashSet;
import java.awt.Robot;
import java.awt.AWTException;
HashSet<Character> pressedKeys = new HashSet<>();

void keyPressed() 
{
    pressedKeys.add(key);
}

void keyReleased() 
{
    pressedKeys.remove(key);
}

class Key {
  //get if provided key is pressed
  boolean pressed(char theKey)
  {
    return pressedKeys.contains(theKey);
  }
  
  // Simulate a key press
  void press(int keyCode) {
    try {
      Robot robot = new Robot();
      robot.keyPress(keyCode);
    } catch (AWTException e) {
      println("Error simulating key press: " + e.getMessage());
    }
  }

  // Simulate a key release
  void release(int keyCode) {
    try {
      Robot robot = new Robot();
      robot.keyRelease(keyCode);
    } catch (AWTException e) {
      println("Error simulating key release: " + e.getMessage());
    }
  }

  // Type a character (press and release a key)
  void type(int keyCode) {
    press(keyCode);
    release(keyCode);
  }

  // Simulate holding a key for a given duration
  void hold(int keyCode, int durationMillis) {
    try {
      press(keyCode);
      delay(durationMillis); // Hold the key for the specified duration
      release(keyCode);
    } catch (Exception e) {
      println("Error holding key: " + e.getMessage());
    }
  }
}
