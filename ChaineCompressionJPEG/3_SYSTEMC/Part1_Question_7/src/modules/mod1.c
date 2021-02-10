/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "mod1.h"

void Mod1::mod1(){
	int d[3];
	while( true ){

		d[0] = (int)e.read();
		d[1] = (int)e.read();
		d[2] = (int)e.read();

		i_valid.write(   1 );
		out0=((sc_uint <8> )d[2],(sc_uint <8> )d[1],(sc_uint <8> )d[0]);
		wait();
		i_valid.write ( 0 ); // attend clk'event and clock=1
		wait();
		wait();
	}
}
