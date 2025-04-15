void vileToJava(String folder, String name)
{
  String lines[] = loadStrings(folder+"/"+name);
  String result[] = new String[lines.length];
  for(int n = 0; n < lines.length; n++)
  {
    String line = lines[n].trim();
    String parts[] = line.split(" ");
    int lineType = identify(line);
    
    if(lineType == 0)
    {
      result[n] = line;
    }
    if(lineType == 1)
    {
      if(line.charAt(line.length()-1) == ';')
      {
        result[n] = line;
      } else
      {
        result[n] = line + ";";
      }
      continue;
    }
    if(lineType == 2)
    {
      if(parts.length > 1)
      {
          result[n] = concatenateParts(parts,parts.length-1) + "{";
      } else
      {
        result[n] = "{";
      }
      continue;
    }
    if(lineType == 3)
    {
      if(parts.length > 1)
      {
          result[n] = concatenateParts(parts,parts.length-1) + "}";
      } else
      {
        result[n] = "}";
      }
      continue;
    }
    if(lineType == 4)
    {
      result[n] = "//"+ line;
      if(getFileExtension(parts[1]).equals(".vile"))
      {
        vileToJava("extras",parts[1]);
      }
      else
      {
        moveDependency(parts[1]);
      }
    }
    if(lineType == -1)
    {
      result[n] = line;
    }
  }
  saveTranslation(result, name);
}

int identify(String line)
{
  String parts[] = line.split(" ");
  if(line.isEmpty() || (line.charAt(0) == '/' && line.charAt(1) == '/'))
  {
    return 0;
  } 
  else if(line.charAt(line.length()-1) == ';')
  {
    return 1;
  }
  else if(parts[parts.length-1].equals("do") || parts[parts.length-1].equals("then") || line.charAt(line.length()-1) == '{')
  {
    return 2;
  }
  else if(parts[parts.length-1].equals("end") || parts[parts.length-1].equals("}"))
  {
    return 3;
  } 
  else if(!(line.charAt(line.length()-1) == ';') && parts[0].equals("import"))
  {
    return 4;
  }
  else
  {
    return -1;
  }
}
