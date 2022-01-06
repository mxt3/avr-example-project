#include <avr/io.h>
#include "foo.h"

void setOuput( bool value )
{
	if(value)
		PORTB |= 1 << PINB5;
	else
		PORTB &= ~(1 << PINB5);
}
