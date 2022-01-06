#include <avr/io.h>
#include "foo.h"

// has a _delay_ms() function
/* #include <util/delay.h> */


int main()
{
	volatile unsigned long count = 0;
	// about a second
	const unsigned long MAX_COUNT = 600000;
	
	//setup of pins
	// output direction
	DDRB |= 1 << PINB5;
	// initial value
	PORTB |= 0 << PINB5;

	volatile bool outPutState = false;

	while(1)
	{
		count++;
		if( count >= MAX_COUNT)
		{
			count = 0;
			outPutState = !outPutState;
			setOuput(outPutState);
		}
	}
}

