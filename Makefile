CFLAGS = \
	-std=c++1y \
	-Wall \
	-O3
#SRC_DIR := src
#SRCS = model.hpp #$(wildcard $(SRC_DIR)/*.cpp)
#OBJS = model.o #$(subst .cpp,.o, $(SRCS))
PYTHON3 := $(if $(PYTHON3),$(PYTHON3),python3)


all: generate_pybind 

generate_pybind:  
	$(CXX) -shared $(CFLAGS) -fPIC `$(PYTHON3) -m pybind11 --includes` \
		python_exports.cpp -o operations`$(PYTHON3)-config --extension-suffix` 


.PHONY: all clean distclean

clean:
	rm -f *.o
	$(RM) $(SRC_DIR)/*.o
distclean: clean
	rm -f $(EXE)
