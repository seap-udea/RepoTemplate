#include <Module.cpp>

using namespace std;

int foo(void)
{
  double c=1;
}

int main(int argc,char* argv[])
{
  Module *m=new Module();

  double c=m->sumNumbers(2,3);
}
