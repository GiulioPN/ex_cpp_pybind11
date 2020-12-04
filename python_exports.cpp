#include <pybind11/pybind11.h>

#include <string.h>

#include "src/model.hpp" 

namespace py = pybind11;

double multiplyByTwo(double num){
	Operations op;
	return op.numeric_product(num, 2.0);
}



PYBIND11_MODULE(operations, m) {
    m.doc() = "easy life"; // optional module docstring

    m.def("multiplyByTwo", &multiplyByTwo,
          "obtain the double of a number");

}
