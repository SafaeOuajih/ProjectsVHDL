/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "Conversion.h"

void ConversionCouleurs(int rvb[3], int ycbcr[3]){
 ycbcr[0]=0.299 * rvb[0]+0.587*rvb[1]+0.114*rvb[2] ;
 ycbcr[1]= -0.1687 * rvb[0]-0.3313*rvb[1]+0.5*rvb[2]+128 ;
 ycbcr[2]= 0.5* rvb[0]-0.4187*rvb[1]-0.0813*rvb[2]+128 ;
	   	for( int j = 0; j < 4; j++){
		  if( ycbcr[j]<0 ) 
		    ycbcr[j] = 0;
		  if( ycbcr[j]> 255 ) 
		    ycbcr[j] = 255;
		}
}

void Conversion::do_conversion(){
	int d[3];
	while( true ){
		d[0] = (int)e.read();
		d[1] = (int)e.read();
		d[2] = (int)e.read();

    	ConversionCouleurs(d, t);


	   s.write( (unsigned char)t[0] );
	   s.write( (unsigned char)t[1] );
	   s.write( (unsigned char)t[2] );
	}
}

