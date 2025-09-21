# Matlab-Craziness ⚡️🧮

This repo is a home for different MATLAB implementations — numerical methods, boundary value problems, PDEs, convergence tests, and whatever else ends up here. The name says it all: sometimes things get messy, but they work. 🚀

---

## Current Directory 📂

### `BoundaryValueProblem1D/`
Implements finite difference methods for solving second-order 1D boundary value problems:

\[
- a(x) u''(x) + v(x) u'(x) + b(x) u(x) = f(x), \quad u(0) = \alpha, \; u(1) = \beta
\]

#### Contents 📑
- **`AG1D.m`** – Builds the tridiagonal system matrix (sparse format).
- **`GetAB.m`** – Computes coefficient functions \(a(x), b(x), v(x)\) and the right-hand side.
- **`Nodes1D.m`** – Generates grid nodes given mesh size \(h\).
- **`Solve1D.m`** – Core solver: assembles the system, applies boundary conditions, solves it.
- **`Test1D.m`** – Driver script: tests the solver across different mesh sizes, reports errors and condition numbers.
- **`convergence_orders.m`** – Computes observed convergence rates 📉.
- **`plot_solutions.m`** – Plots exact vs numerical solutions 📊.
- **`plots/`** – Saved plots from experiments 🖼️.

---

## How to Run ▶️

Run the driver to check accuracy and convergence:

```matlab
>> R = Test1D()
