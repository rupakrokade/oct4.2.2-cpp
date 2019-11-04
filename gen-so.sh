#!/bin/bash
rm -f *.out *.so *.o *.oct test libfun.so

if [[ -z "$*"  ]];
then 
	echo 'Warning: Correct usage ./gen-so.sh <filename>'
	set -- "fun"
fi

#The $1 is the filename that can be passed as an argument to this file. Default is 'fun'

mkoctfile -loctave -loctinterp -fPIC $1.cpp 
g++ -loctave -loctinterp -shared -o lib$1.so $1.o
#sudo cp libfun.so /usr/lib
#sudo /sbin/ldconfig
#g++ -std=c++11 -Wall -L$(pwd) -Wl,-rpath=$(pwd) -o test main.cpp -l$1 -g	
g++ -o test main.cpp -L$(pwd) -Wl,-rpath=$(pwd) -l$1 -loctinterp -loctave


#mkoctfile -fPIC --link-stand-alone $1.cpp -o $1.out
#gcc $1.o -shared -o lib$1.so


#sudo cp libfun.so /usr/lib
#sudo /sbin/ldconfig
#g++ -shared -o lib$1.so $1.o
#g++ -L$(pwd) -Wl,-rpath=$(pwd) -Wall -o oct main.cpp -l$1
cp fun.h ../scilab_octave/thirdparty/linux/include/
cp libfun.so ../scilab_octave/thirdparty/linux/lib/x64/
