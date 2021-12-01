// Insertion sort

int len = 9;

int[] input = {15, 9, 9, 10, 12, 1, 11, 3, 9};
int[] output = new int[len];

int innerIndex;
int currentStartIndex;

void setup()
{
  println(input);
  
  output = input;
  
  // sorting 
  currentStartIndex = 1;
  while (currentStartIndex < len)
  {
    innerIndex = currentStartIndex;
    
    while ((innerIndex > 0) && (output[innerIndex] < output[innerIndex-1]))
    {
      int temp = output[innerIndex];
      output[innerIndex] = output[innerIndex-1];
      output[innerIndex-1] = temp;
      innerIndex--;
    }
    currentStartIndex++;
  }
  println("Sorted:");
  println(output);
  
}

// or use println(sort(input));
