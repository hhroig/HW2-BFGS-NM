## Algoritmos quasi-Newton (BFGS) y Newton-Modificado
Homework2: quasi-Newton con actualización BFGS y Newton-Modificado. 

# Introducción:

Se desea encontrar los mínimos de las funciones de $\mathbb{R}^2 \rightarrow \mathbb{R}$:

	$$f_1(x_1, x_2) & = & x_1^2 + 5x_2^2 + x_1 -5 x_2$$
	$$(x_1, x_2) & = &  x_1^2 + 5x_1x_2 + 100 x_2^2 - x_1 + 4 x_2 $$
	$$f_3(x_1, x_2) & = &  e^{(x_1 + 3x_2 - 0.1)} + e^{(x_1 - 3x_2 -0.1)} + e^{(-x_1 -0.1)}$$
	$$f_4(x_1, x_2) & = &  100 (x_2 - x_1^2)^2 + (1-x_1)^2	\hspace{1cm} \mbox{(\emph{función de Rosenbrock})} $$


Para enfrentarnos a este problema de optimización no-lineal sin restricciones se implementaron dos métodos:
* Método Broyden–Fletcher–Goldfarb–Shanno (BFGS), perteneciente a la familia de los quasi-Newton.
*  Método de Newton-Modificado (NM) con regla de actualización: $B_k = H_k + \lambda I$.

# Uso de las funciones:

* Con la función "main" es posible ejecutar los algoritmos programados, para un valor inicial prefijado $x_0$.
* Cada función $f_i$ tiene un script que permite evaluar la misma, así como su gradiente y Hessiano, en un punto $x_k$.
* La función "sols_by_matlab" calcula los mínimos "verdaderos" de acuerdo al bult-in de MATLAB "fminsearch".
* La función "BFGS" tiene implementado el método cuasi-Newton con actualización BFGS:

$${\displaystyle B_{k+1}=B_{k}+{\frac {y_{k}y_{k}^{\mathrm {T} }}{y_{k}^{\mathrm {T} }s_{k}}}-{\frac {B_{k}s_{k}s_{k}^{\mathrm {T} }B_{k}}{s_{k}^{\mathrm {T} }B_{k}s_{k}}}}$$

* La función "mod_Newton" tiene implementada una Modificiación del Método de Newton con actualización: 

$$B_k = H_k + \lambda I$$
