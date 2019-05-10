#include <stdio.h>
#include <module.cpp>

int main(int argc,char *argv[])
{
  double a=1.0,b=2.0;
  double c=sum(a,b);
  printf("%g + %g  = %g\n",a,b,c);
  return 0;
}
