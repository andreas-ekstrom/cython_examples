.PHONY: build
build:
	python setup.py build_ext --inplace

clean:
	rm -f -r ./build/
	rm -f *.so *.mod *.o

clean-c:
	rm -f cython_source.c

clean-bck:
	rm -f *.*~ *~

clean-all: clean clean-c clean-bck
