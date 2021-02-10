/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "mod2.h"


void Mod2::mod2(){
  int d[3];

  while( true ){
    if(o_valid==1){
      d[0] = (sc_uint <8>)in0.read();
      d[1] = (sc_uint <8>)in1.read();
      d[2] = (sc_uint <8>)in2.read();


      s.write( (unsigned char)d[0] );
      s.write( (unsigned char)d[1] );
      s.write( (unsigned char)d[2] );
    }

    wait();
  }
}
