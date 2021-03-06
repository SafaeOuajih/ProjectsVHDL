/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "systemc.h"

SC_MODULE(Gene)          // module (class) declaration
{
	sc_fifo_out<unsigned char> s;

    void do_gen();           // process

	SC_CTOR(Gene)
	{
		SC_THREAD(do_gen);
	}

};
