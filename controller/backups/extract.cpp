#include <stdlib.h>
#include <string>
#include <iostream>

using namespace std;

int main (int argc, char* argv[])
{
	if (argc != 3)
	{
		cout << "Supply your command line arguments. >:C" << endl;
		return 1;
	}
	string arg1 = argv[1];
	string arg2 = argv[2];
	string sysCall = "./sedtest2.sh "; 	
	sysCall = sysCall + arg1 + " " + arg2;
	cout << sysCall << endl;;
	system(sysCall.c_str());
	return 0;
}
