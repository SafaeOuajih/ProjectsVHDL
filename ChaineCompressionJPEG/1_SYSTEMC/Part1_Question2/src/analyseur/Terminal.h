/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "systemc.h"

SC_MODULE(Terminal)
{
	sc_fifo_in<unsigned char> e;

	void do_print();

	SC_CTOR(Terminal)
	{
		SC_THREAD(do_print);
	}
};
