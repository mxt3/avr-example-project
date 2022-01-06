# for AVR cpp projects
def FlagsForFile( filename, **kwargs ):
  return {
          'flags': [ '-x', 'c++', '-Wall', '-Wextra', '-std=c++14', 
              '-I', 'C:\\Users\\Maxime\\Desktop\\avr\\avr-gcc-7.2.0-x86-mingw\\avr\\include',
              '-D', '__AVR_ATmega328P__'
              ], 
         }
