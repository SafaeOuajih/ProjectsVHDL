/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "ConversionInverse.h"


void ConversionCouleursInverse(int ycbcr[3], int rvb[3]){
  rvb[0] = ycbcr[0]+1.402*(ycbcr[2]-128);
  rvb[1] = ycbcr[0]-0.34414*(ycbcr[1]-128)-0.71414*(ycbcr[2]-128);
  rvb[2] = ycbcr[0]+1.772*(ycbcr[1]-128);
	   	for( int j = 0; j < 4; j++){
		  if( rvb[j]<0 ) 
		    rvb[j] = 0;
		  if( rvb[j]> 255 ) 
		    rvb[j] = 255;
		}

}

void ConversionInverse::do_conversion(){
	int d[3];
	while( true ){
		d[0] = (int)e.read();
		d[1] = (int)e.read();
		d[2] = (int)e.read();
		
		ConversionCouleursInverse(d, t);

		s.write( (unsigned char)t[0] );
		s.write( (unsigned char)t[1] );
		s.write( (unsigned char)t[2] );
	}
}

