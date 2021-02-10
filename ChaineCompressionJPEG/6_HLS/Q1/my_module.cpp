#include "my_module.h"
#include "systemc.h"

void my_module::do_action()
{
	int x;
	int y;
	while(true){
		wait();
		x= e.read();
		y = 1000 / (2 * (x * x) - 7 * x + 1);
		s.write(y);
		cout << y << endl;
	}

};
