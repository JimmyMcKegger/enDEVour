// question 2
// gift basket helper function

float maximumValue = 200;
int dataSize = 7;
// put the array to test in here:
int[] myArray = 
{
  109,
  33,
  7,
  20,
  2,
  60,
  13,
  36
};

void setup()
{
  /* prints "-1" if there's nothing, 
   or the index value of "i0" if it exists */
  println("Index: " + findIndex(myArray, maximumValue));
}

int findIndex(int[] data, float max)
{
  if (data[0] >= max)
  {
    return -1;
  }
  else
  {
    int total = 0;
    int i = 0;
    while (i < dataSize)
    {
      total += data[i];
      if (total < max && //<>//
          total + data[i+1] >= max)
      {
        return i;
      }
      i++; //<>//
    }
  }
  return dataSize - 1;
}
