import at.mukprojects.console.*;
import java.util.Scanner;

class Cmd {
    Console console;
    Scanner scanner;
    boolean isVisible = true;

    // Constructor to initialize the console and scanner
    Cmd(PApplet app) {
        console = new Console(app); // Create a console instance linked to the PApplet
        console.start();           // Start the console (redirect standard output)
        scanner = new Scanner(System.in); // Initialize the scanner for user input
    }
    
    void toggle() {
      isVisible = !isVisible;
    }

    void draw() {
      if (isVisible) {
        console.draw();
      }
    }

    // Method to clear the console
    void clean(int lines) {
      for (int i = 0; i < lines; i++) {
        System.out.println();
      }
    }

    // Method to print a message to the console
    void send(String message) {
        System.out.println(message); // Directly print to the standard console
    }

    // Method to read a line of user input
    String last() {
      try {
        return scanner.nextLine();
      } catch (Exception e) {
        return "";
      }
    }
    void sendMany(String[] messages) {
      for (String message : messages) {
        send(message);
      }
    }
    
  boolean alive() {
    return console != null && scanner != null;
  }
}
