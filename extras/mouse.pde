import java.util.HashSet;
import java.awt.Robot;
import java.awt.AWTException;


HashSet<Integer> pressedButtons = new HashSet<>();
void mousePressed() {
  pressedButtons.add(mouseButton); // Add pressed button to the set
}

void mouseReleased() {
  pressedButtons.remove(mouseButton); // Remove released button from the set
}

class Mouse {
  // Check if a specific mouse button is pressed
  boolean pressed(int button) {
    return pressedButtons.contains(button);
  }
  // Move the mouse to specific coordinates
  void move(int x, int y) {
    try {
      Robot robot = new Robot();
      robot.mouseMove(x, y);
    } catch (AWTException e) {
      println("Error moving mouse: " + e.getMessage());
    }
  }

  // Simulate a mouse press
  void press(int button) {
    try {
      Robot robot = new Robot();
      robot.mousePress(button);
    } catch (AWTException e) {
      println("Error simulating mouse press: " + e.getMessage());
    }
  }

  // Simulate a mouse release
  void release(int button) {
    try {
      Robot robot = new Robot();
      robot.mouseRelease(button);
    } catch (AWTException e) {
      println("Error simulating mouse release: " + e.getMessage());
    }
  }

  // Simulate mouse wheel scroll
  void scroll(int amount) {
    try {
      Robot robot = new Robot();
      robot.mouseWheel(amount);
    } catch (AWTException e) {
      println("Error simulating mouse wheel scroll: " + e.getMessage());
    }
  }
}
