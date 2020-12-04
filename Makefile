CFLAGS = \
	-std=c++1y \
	-Wall \
	-O3
#SRC_DIR := src
#SRCS = model.hpp #$(wildcard $(SRC_DIR)/*.cpp)
#OBJS = model.o #$(subst .cpp,.o, $(SRCS))
PYTHON3 := $(if $(PYTHON3), $(PYTHON3), python3)


all: generate_pybind 

model.o:
	$(CXX) $(CFLAGS) -c src/model_imp.hpp -o src/model.o

generate_pybind: src/model.o 
	$(CXX) -shared $(CFLAGS) `$(PYTHON3) -m pybind11 --includes` \
		python_exports.cpp -o operations`$(PYTHON3)-config --extension-suffix` \
		src/model.o


.PHONY: all clean distclean

clean:
	rm -f *.o
	$(RM) $(SRC_DIR)/*.o
distclean: clean
	rm -f $(EXE)
