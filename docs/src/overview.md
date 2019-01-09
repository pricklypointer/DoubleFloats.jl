This package provides versions of the built-in IEEE 754 Standard floating point types with extended precision significands.

| type name   | significand precision | exponent precision | base type |
|:------------|:---------------------:|:------------------:|:----------|
| `Double64`  | 106 bits              | 11 bits            | `Float64` |
| `Double32`  | &nbsp;48 bits         | &nbsp;8 bits       | `Float32` |
| `Double16`  | &nbsp;22 bits         | &nbsp;5 bits       | `Float16` |


- arithmetic (`+`, `-`, `*`, `/`) is exact
- elementary functions are quite accurate
- often better than C "double-double" libraries

For Double64 arguments within 0.0..2.0 (_except tan(x) where x ~= n*pi/2_)
- expect the absolute error to be ~1e-30 or less
- expect the relative error to be ~1e-28 or less