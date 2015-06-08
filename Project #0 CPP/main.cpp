#include <iostream.h>

int main()
{
  int x = 0;
  int y = 1;
  int swap = 0;
  
  for(int i = 0; i < 25; i = i + 1)
  {
	cout << x << endl;
	
	x += y;
	
	swap = x;
	x = y;
	y = swap;
  }
  return 0;
}
