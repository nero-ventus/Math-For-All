package Clases;
import java.util.*;
import java.io.*;
import java.util.concurrent.ThreadLocalRandom;
public class  Numeros {
    private int[] numeros;
    public int[] rando(int[] solutionArray) {
    shuffleArray(solutionArray);
    for (int i = 0; i < solutionArray.length; i++){
      System.out.print(solutionArray[i] + " ");
    }
    System.out.println();
    numeros=solutionArray;
    return numeros;
}
static void shuffleArray(int[] ar)
  {
    Random rnd = ThreadLocalRandom.current();
    for (int i = ar.length - 1; i > 0; i--)
    {
      int index = rnd.nextInt(i + 1);
      int a = ar[index];
      ar[index] = ar[i];
      ar[i] = a;
    }
  }
}