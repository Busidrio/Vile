String concatenateParts(String[] parts, int n) {
  StringBuilder result = new StringBuilder();
  for (int i = 0; i < n; i++) {
    result.append(" "+parts[i]); // Add each part
  }
  return result.toString(); // Convert to a single string
}

void saveTranslation(String[] result, String newFileName) {
  String filename = newFileName;
  String[] parts = filename.split("\\."); // Split by the period
  String name = parts[0]; // Take the first part
  saveStrings("Pde/" + name + ".pde", result);
}

void moveDependency(String name)
{
  String[] content = loadStrings("extras/"+name);
  saveStrings("Pde/"+name, content);
}

String getFileExtension(String fileName) {
    if (fileName != null && fileName.contains(".") && fileName.lastIndexOf(".") != fileName.length() - 1) {
        return fileName.substring(fileName.lastIndexOf("."));
    }
    return ""; // Return an empty string if there's no valid extension
}
