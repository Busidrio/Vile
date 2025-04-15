import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.StringSelection;
import java.awt.Robot;
import java.awt.AWTException;
import java.awt.Component;
import java.awt.Point;


class Misc
{
  String clipboard(String content) {
  if (content == null) { // If no content is provided, get clipboard contents
    try {
      Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
      return (String) clipboard.getData(DataFlavor.stringFlavor); // Return clipboard content
    } catch (Exception e) {
      println("Error reading clipboard: " + e.getMessage());
      return "";
    }
  } else { // If content is provided, set clipboard contents
    try {
      Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
      StringSelection selection = new StringSelection(content);
      clipboard.setContents(selection, null); // Set clipboard content
    } catch (Exception e) {
      println("Error setting clipboard: " + e.getMessage());
    }
    return content; // Return the new content for confirmation
  }
}

boolean capsLock(Boolean activate) {
  if (activate == null) { // If no parameter is provided, check Caps Lock state
    return Toolkit.getDefaultToolkit().getLockingKeyState(KeyEvent.VK_CAPS_LOCK); // Check Caps Lock state
  } else { // If a parameter is provided, toggle Caps Lock state
    try {
      Robot robot = new Robot();
      boolean currentState = Toolkit.getDefaultToolkit().getLockingKeyState(KeyEvent.VK_CAPS_LOCK);
      if (currentState != activate) {
        robot.keyPress(KeyEvent.VK_CAPS_LOCK); // Toggle Caps Lock
        robot.keyRelease(KeyEvent.VK_CAPS_LOCK);
      }
      return activate; // Return the requested state
    } catch (AWTException e) {
      println("Error toggling Caps Lock: " + e.getMessage());
      return !activate; // Return opposite state on error
    }
  }
}

// Function to get the X-coordinate of the window
int windowX() {
    java.awt.Component canvas = (java.awt.Component) surface.getNative();
    java.awt.Point position = canvas.getLocationOnScreen(); // Get window position
    return position.x; // Return the X-coordinate
}

// Function to get the Y-coordinate of the window
int windowY() {
    java.awt.Component canvas = (java.awt.Component) surface.getNative();
    java.awt.Point position = canvas.getLocationOnScreen(); // Get window position
    return position.y; // Return the Y-coordinate
}
}
