# Arithmetic Analysis Lab Assignment 3

## Overview

This project demonstrates how to compute the largest and smallest eigenvalues (and corresponding eigenvectors) of a matrix using both MATLAB's built-in `eig` function and a custom implementation of the **Inverse Power Method with Shift**.

## Files

- `Askisi1.m`: Main script that defines the matrix and initial vector, checks for input validity, computes eigenvalues/eigenvectors using MATLAB and the custom method, loops over shift values, prints results, and compares the two approaches.
- `inverse_power_method.m`: Custom implementation of the inverse power method with shift. Shifts the matrix by value `q`, solves the shifted system iteratively, uses the Rayleigh quotient for eigenvalue estimation, checks convergence, and returns the eigenvalue/eigenvector.
- `Aritmetic_Analysis_Lab_Assignment_3.pdf`: Assignment brief (in Greek).

## How It Works

### Matrix and Vector Setup

A 4x4 matrix `A` and an initial vector `y` are defined in the main script:

A = [16 -8  2  1;
     2 -12 1  0;
    -1  1 -4  1;
     0 -1  2  3];

y = [1; 1; 1; 1];

The script checks for:
- Square matrix (`A`)
- Compatible dimensions (`A` and `y`)

### Eigenvalue Calculation

1. **MATLAB's `eig` Function**
   - Used for reference values and to define shift ranges.

2. **Inverse Power Method with Shift** (`inverse_power_method.m`)
   - For several shift values near the largest and smallest absolute eigenvalues, the script:
     - Shifts the matrix (`B = A - q * eye(size(A))`)
     - Iteratively solves for the eigenvector
     - Estimates the eigenvalue using the Rayleigh quotient
     - Checks convergence against a tolerance
     - Prints shift, eigenvalue, and eigenvector

### Output and Comparison

For each shift value, the script prints:
- The shift value used
- The computed eigenvalue and eigenvector

After all shifts:
- Prints the largest and smallest eigenvalues/eigenvectors found by the custom method
- Prints MATLAB's built-in results for comparison

### Error Handling

If the matrix is not square or the dimensions do not match, the script prints error messages (in Greek).

