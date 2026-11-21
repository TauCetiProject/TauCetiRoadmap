# Roadmap: prime products in short intervals

**Summary.** A mean-square bound for primes in a moving interval can give a pointwise lower bound for the number of products of two primes near a prescribed real number. The starts of the two factor intervals are coupled: they are $t$ and $x/t$. This roadmap develops the measure estimates and the finite counting argument that turn information about the two factors into a bound for distinct products.

Erdős and Graham ask about a short sum of least-prime-factor weights. The interval sum on page 92 includes primes. For the composite-only reading, Tao pointed to semiprimes with both factors of size $x^{1/2}(\log x)^{O(1)}$. Zhang records the observation in §1.1. The application here counts the subset whose factors lie within fixed multiples of $\sqrt{x}$. Assuming the explicit relative theta estimate of Chirre and Hagen, every real $x\ge9.6\cdot10^{37}$ has at least $(14/3)\sqrt{x}$ balanced semiprimes strictly between $x$ and $x+384\sqrt{x}(\log x)^2$. Their total least-prime-factor weight is at least $14/9$. Chirre and Hagen prove the input under classical RH. The formal target here takes the integral bound as a hypothesis.

The ExplicitPrimeCounting roadmap develops bounds for prime-counting functions. This roadmap uses Mathlib's same Chebyshev function and measures its increments. The Selberg sieve in Tau Ceti gives upper bounds for primes in single intervals. The counting argument here needs lower bounds at two linked starts; an upper-bound sieve does not provide them. The first layer controls the starts where a prime interval is deficient, the second integrates over the starts of a fixed prime pair, and the third specializes both estimates.

## Conventions

All logarithms are natural and all start variables are real. Write $\theta(y)=\sum_{p\le y}\log p$ and $A_d(t)=\#\{p:t<p\le(1+d)t\}$. Use ordinary Lebesgue measure, written $|E|$. The relative Selberg integral is
$$J(Y,d)=\int_1^Y\big(\theta((1+d)v)-\theta(v)-dv\big)^2\,dv,$$
used with $Y\ge1$ and $d\ge0$. We order a pair as $(p,q)$ with the larger prime first. The final product interval is open at both ends.

## Layer 1: prime windows and exceptional starts

1. Express a theta increment on $(a,b]$ as a sum of prime logarithms, for $0\le a\le b$. If $b\le B$ and $B>1$, divide by $\log B$ to obtain a lower bound on the prime count. Establish measurability of the increment and integrability of its squared error on bounded intervals of positive starts.
2. Given $1\le a\le b\le Y$, put $E=\{v\in(a,b]:\theta((1+d)v)-\theta(v)<dv/2\}$. Prove $(da/2)^2|E|\le J(Y,d)$ by restricting the integral to $E$. Keep this statement usable for arbitrary $a,b,Y,d$ in those ranges.
3. If $N>0$ and $E$ is measurable with $v\ge N/2$ on $E$, prove $|\{N^2/v:v\in E\}|\le4|E|$. The map is injective there and its derivative has absolute value at most four. For positive $N$, its image of $[N/2,2N/3]$ is exactly $[3N/2,2N]$.

## Layer 2: count distinct products by integrating over the starts

Fix $x>0$, $u=1+d>1$, and a positive band $[a,b]$. A pair $(p,q)$ is present when $t<p\le ut$ and $x/t<q\le ux/t$. Prove the identity
$$\{t\in[a,b]: (p,q)\text{ is present}\}
   =[a,b]\cap[p/u,p)\cap(x/q,ux/q]$$
for positive factors and starts. Its length is at most $db$ when it is nonempty, since $p\le ub$ and $p-p/u\le db$. Sum the indicators over a finite family of pairs before integrating. This gives an upper bound on the integrated pair count in terms of the number of pairs and $db$. For disjoint larger- and smaller-factor bands, prove injectivity of $(p,q)\mapsto pq$ by unique prime factorization.

**Endpoint check.** At $x=35$, $u=2$, $p=7$, $q=5$ and $[a,b]=[3,8]$, the parameter set is empty: the larger factor requires $t<7$, while the smaller requires $t>7$. At the same $x,u,p$ with $q=11$, the parameter set is $[7/2,70/11]$. This second check concerns the geometric identity, which allows either factor order.

## Layer 3: two-scale lower bounds

Use $N=\sqrt{x}$, $L=\log N$, and $d=512L^2/N$. At a single $x$, assume $J(Y,d)\le3dY^2L^2$ for both $Y=2N$ and $2N/3$. Apply Layer 1 on the bands $[3N/2,2N]$ and $[N/2,2N/3]$. Each exceptional set has length at most $N/24$; pulling the smaller one back costs at most a factor four. At least $7N/24$ of the larger band supplies two good starts. At each one there are at least $d^2N^2/(16L^2)$ pairs. By Layer 2 a fixed pair contributes at most $2dN$ to the integral. Dividing gives the lower bound $(14/3)N$ for the number of distinct products.

Check the parameters for all real $x\ge96\cdot10^{36}$. Derive the two local estimates from the following global hypothesis: whenever $Y\ge10^{13}$ and $0<d\le10^{-13}$,
$$J(Y,d)\le 2.5571\,dY^2\log^2(2.0001/d).$$
State the two-scale theorem separately so a different mean-square estimate can supply its input. Prove $N/2<q<N<p<3N$ and $x<pq\le(1+d)^2x<x+3dx$. Since $3dx=384\sqrt{x}(\log x)^2$ and each product contributes $1/p\ge1/(3N)$, these same products give the weight lower bound $14/9$.

## Scope and ownership

The new results concern exceptional starts for relative theta increments, reciprocal coupling, and the passage to distinct products. The two-scale theorem should be available without an RH hypothesis. The analytic implication from RH to the global input remains an external published result in this proposal. The scope is the explicit theorem for coefficient 384; the companion result for arbitrary fixed coefficients in the source paper uses an additional discrete moment estimate.

## Exact supplier contracts

### From Mathlib: primes and Chebyshev functions

Use `Chebyshev.theta`, `Chebyshev.theta_eq_sum_primesLE`, `Chebyshev.theta_mono`, `Nat.primesLE`, and `Nat.minFac`. Use prime divisibility of a product to identify the factors. The counted objects are a finite set of natural numbers, so bounding its cardinality counts each integer once.

### From Mathlib: real integration

Use `Set.Icc`, `Set.Ioc`, `Set.Ico`, `MeasureTheory.volume`, interval integration and the one-dimensional change-of-variables theorem `MeasureTheory.lintegral_image_eq_lintegral_abs_deriv_mul`. Use finite summation and the integral of a measurable indicator to pass from the support identity to the count. The shared prime-counting and sieve areas mentioned above provide context; these signatures need only Mathlib imports.

## References

- P. Erdős and R. L. Graham, *Old and New Problems and Results in Combinatorial Number Theory* (1980), p. 92, the weighted sum over all integers. [Original question](https://mathweb.ucsd.edu/~ronspubs/80_11_number_theory.pdf#page=88)
- T. Tao, comment of 28 September 2025 on the prime convention and the semiprime interpretation. [Erdős Problems discussion](https://www.erdosproblems.com/forum/thread/462)
- X. Zhang, *On the sum of least prime factors in short intervals*, §1.1. [arXiv:2608.24930v2](https://arxiv.org/abs/2608.24930v2)
- A. Chirre and M. V. Hagen, *On Goldbach numbers in short intervals*, Theorem 3, for the global relative theta estimate under RH. [Published paper](https://doi.org/10.1007/s40993-026-00767-6)
- A. Henriksson, *Balanced semiprimes in short intervals under the Riemann hypothesis*, Theorem 1.1 and Section 2. In the accompanying Lean 4.33.1 development, `Erdos462RH.theorem_1_1` gives the count and weight from the global theta estimate, and `Erdos462RH.composite_sum_384` gives the sum over all composites in the closed window. Its prime-power variant adapts S. Hubbard's LeanLab code; the theta-only route specified here does not need that variant. [LeanLab source for the variant](https://github.com/sthubbar/lean-lab-preprints/blob/74c2d1ab2c2716ff50d5ace219ce45eab05adb51/LeanLab/ChirreHagen2025/ThetaPsi.lean)
