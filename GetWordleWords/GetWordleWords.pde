import java.util.*;
import java.util.stream.*;

void setup(){

 String [] lines = loadStrings("https://gist.githubusercontent.com/MarvinJWendt/2f4f4154b8ae218600eb091a5706b5f4/raw/36b70dd6be330aa61cd4d4cdfda6234dcb0b8784/wordlist-german.txt");
 saveStrings("words.txt", Stream.of(lines).map(String::toLowerCase).map(line -> line.replaceAll("ä", "ae").replaceAll("ö", "oe").replaceAll("ü", "ue")).filter(line -> line.length() == 5).toArray(String[]::new));
}
