# Roadmap: prime products in short intervals

**Summary.** How many distinct products of two primes lie just above a given real number x? The two factor intervals start at t and x/t. A mean-square estimate for primes shows that, for many t, both intervals contain enough primes. Bounding the length of time for which a given pair is counted turns this into a lower bound for the number of distinct products.

Assume the relative mean-square estimate of Chirre and Hagen stated in Layer 3. For every real x ≥ 9.6 · 10³⁷, the open interval from x to x + 384√x (log x)² contains at least (14/3)√x distinct products pq of primes with √x/2 < q < √x < p < 3√x. The sum of their least prime factors divided by the respective products is at least 14/9. Chirre and Hagen establish the input under the classical Riemann hypothesis.

Erdős and Graham's printed interval sum includes all integers. For the composite-only reading, Tao pointed to semiprimes with both factors of size √x times a power of log x, allowing bounded positive or negative exponents. Zhang records the observation in §1.1. The bounds above count products with both factors within fixed multiples of √x.

The [ExplicitPrimeCounting roadmap](../ExplicitPrimeCounting/README.md) studies bounds for prime-counting functions. Here the input concerns increments of Mathlib’s Chebyshev theta function. Layer 1 of [SieveMethodsAndPrimePatterns](../SieveMethodsAndPrimePatterns/README.md) develops Brun and Selberg sieves. An upper bound for a sifted set alone cannot supply the lower bounds at two linked starts needed here. Layer 1 controls the exceptional starts, Layer 2 measures the contribution of each pair and Layer 3 combines the estimates.

## Conventions

All logarithms are natural. The variables x, t, v, Y and d are real. Write θ(y) for the sum of log p over primes p ≤ y, and A_d(v) for the number of primes in (v,(1+d)v]. Use Lebesgue measure for lengths and write |E| for the measure of E. For Y ≥ 1 and d ≥ 0, set

```text
J(Y,d) = ∫₁^Y (θ((1+d)v) − θ(v) − d v)² dv.
```

Prime factors are natural numbers. In the final count the larger factor is p, and both ends of the product interval are open.

## Layer 1: prime windows and exceptional starts

1. For 0 ≤ a ≤ b, express θ(b) − θ(a) as a sum over primes in (a,b]. If b ≤ B and B > 1, dividing the increment by log B gives a lower bound for their number. Establish measurability of the increment as a function of the start and integrability of its squared error on bounded intervals of positive starts.
2. For 1 ≤ a ≤ b ≤ Y and d ≥ 0, let E consist of the v in (a,b] for which θ((1+d)v) − θ(v) < d v/2. The absolute error on E is at least d a/2. By restricting the integral to E, prove (d a/2)² |E| ≤ J(Y,d). Henriksson uses this estimate for each of two bands in §2, between (2) and (3). [Manuscript, p. 2](https://doi.org/10.5281/zenodo.24416597)
3. For N > 0 and measurable E contained in [N/2,∞), prove that the image of E under v ↦ N²/v has measure at most 4|E|. On that half-line the map is injective and its derivative has absolute value at most four. It takes [N/2,2N/3] onto [3N/2,2N]. This controls the loss in good starts in §2, immediately before (3). [Manuscript, p. 2](https://doi.org/10.5281/zenodo.24416597)

## Layer 2: count distinct products by integrating over starts

Fix x > 0, d > 0, u = 1+d and 0 < a ≤ b. Positive factors p and q occupy their two windows when t < p ≤ ut and x/t < q ≤ ux/t. Clearing denominators gives their common set of starts:

```text
{t ∈ [a,b] : t < p ≤ ut and x/t < q ≤ ux/t}
    = [a,b] ∩ [p/u,p) ∩ (x/q,ux/q].
```

The length bound is the useful estimate. If the set is nonempty, then p/u ≤ b, so its length is at most p − p/u = d p/u ≤ d b. The empty set also satisfies the bound. Sum the indicators over any finite family of eligible prime pairs and integrate. Each pair contributes at most d b, so the integral is at most d b times the number of pairs. For disjoint larger- and smaller-factor bands, unique factorization makes (p,q) ↦ pq injective. In §2 this upper bound is combined with the incidence lower bound (4). [Manuscript, pp. 2–3](https://doi.org/10.5281/zenodo.24416597)

**Endpoint check.** With x = 35, u = 2, p = 7, q = 5 and [a,b] = [3,8], the common set is empty: the first window requires t < 7, the second t > 7. With q = 11 instead, the common set is [7/2,70/11]. The identity permits either order of the factors.

## Layer 3: two-scale and global bounds

**Two scales.** For real x ≥ 9.6 · 10³⁷, set N = √x, L = log N and d = 512 L²/N. The theorem `bounds_of_two_scales` assumes J(Y,d) ≤ 3 d Y² L² at Y = 2N and Y = 2N/3. This is the part of the proof of Henriksson’s Theorem 1.1 starting at (2). [Manuscript, §2, pp. 2–3](https://doi.org/10.5281/zenodo.24416597)

Apply Layer 1 on [3N/2,2N] and [N/2,2N/3]. Each exceptional set has measure at most N/24. Pulling back the second through t ↦ x/t costs at most 4N/24. At least 7N/24 of the larger band therefore supplies two good starts, each contributing at least d²N²/(16L²) pairs. By Layer 2 a fixed pair contributes at most 2dN to the integral. Dividing gives at least (14/3)N distinct products. The bounds N/2 < q < N < p < 3N give a weight of 1/p ≥ 1/(3N) per product. Since x < pq ≤ (1+d)²x < x + 3dx and 3dx = 384√x (log x)², these products give the required weight of at least 14/9 inside the open interval.

**Global estimate.** The theorem `bounds_of_global_moment` assumes the following inequality for all real Y and d in the stated range. Chirre and Hagen prove it under RH in §4, Theorem 3. [Published theorem](https://doi.org/10.1007/s40993-026-00767-6)

```text
Y ≥ 10¹³,   0 < d ≤ 10⁻¹³
J(Y,d) ≤ 2.5571 d Y² (log(2.0001/d))².
```

Deduce the hypotheses at both scales for every real x ≥ 9.6 · 10³⁷. With B = 9797 · 10¹⁵ one has B² < 9.6 · 10³⁷ and log B < 656/15. The function (log N)²/N decreases for N > e². Thus d ≤ 512(656/15)²/B < 10⁻¹³ and 2N/3 ≥ 10¹³. Since 2.0001 < dN, one has 0 < log(2.0001/d) ≤ L, giving 2.5571 (log(2.0001/d))² ≤ 3L². Apply the two-scale theorem. This is Henriksson’s derivation of (2) from (1) in the proof of Theorem 1.1. [Manuscript, pp. 1–2](https://doi.org/10.5281/zenodo.24416597)

## Scope and ownership

The roadmap covers the relative theta increment, reciprocal coupling, the incidence argument and the explicit count and weight for coefficient 384. Both headline theorems take moment estimates as hypotheses. The passage from RH to the global estimate belongs to Chirre and Hagen. Henriksson’s Theorem 1.2, for every fixed positive coefficient, uses an additional discrete moment estimate and lies outside this roadmap. [Manuscript, Theorems 1.1–1.2](https://doi.org/10.5281/zenodo.24416597)

## Exact supplier contracts

### From Mathlib: prime counting

Use `Chebyshev.theta`, `Chebyshev.theta_eq_sum_primesLE`, `Chebyshev.theta_mono`, `Nat.primesLE` and `Nat.minFac`. Use prime divisibility of a product to identify the factors. The cardinality is taken over a finite set of natural numbers, counting each product once.

### From Mathlib: real integration

Use `Set.Icc`, `Set.Ioc`, `Set.Ico`, `MeasureTheory.volume`, interval integration and `MeasureTheory.lintegral_image_eq_lintegral_abs_deriv_mul` for one-dimensional change of variables. Integrate a finite sum of measurable indicators to pass from the pair supports to the count. The two neighbouring roadmaps provide context. The target signatures import Mathlib alone.

## References

- P. Erdős and R. L. Graham, *Old and New Problems and Results in Combinatorial Number Theory*, Monographie 28, L’Enseignement Mathématique, Geneva, 1980, p. 92. Only the preceding asymptotic sum carries a prime exclusion. [Graham’s UCSD bibliography](https://mathweb.ucsd.edu/~ronspubs/) · [Scan, printed p. 92](https://mathweb.ucsd.edu/~ronspubs/80_11_number_theory.pdf#page=88)
- T. Tao, comment of 28 September 2025 on Erdős Problem 462. X. Zhang, *On the sum of least prime factors in short intervals*, §1.1, also attributes the semiprime interpretation to Tao. [Discussion](https://www.erdosproblems.com/forum/thread/462) · [arXiv:2608.24930v2](https://arxiv.org/abs/2608.24930v2)
- A. Chirre and M. V. Hagen, *On Goldbach numbers in short intervals*, Research in Number Theory **12**, article 82 (2026), §4, Theorem 3. [DOI 10.1007/s40993-026-00767-6](https://doi.org/10.1007/s40993-026-00767-6) · [arXiv:2512.23534v1](https://arxiv.org/abs/2512.23534v1)
- A. Henriksson, *Balanced semiprimes in short intervals under the Riemann hypothesis*, Theorem 1.1 and §2, equations (1)–(4). The page numbers above refer to the 21 November 2026 manuscript. The v2 Zenodo record contains the PDF as `Erdos-462/preprint.pdf` inside its source archive. [Revised manuscript and checks, DOI 10.5281/zenodo.24416597](https://doi.org/10.5281/zenodo.24416597)
- A. Henriksson, *462 lean*, an earlier version of the companion Lean project. Its third-party notice identifies S. Hubbard’s Apache-2.0-licensed LeanLab code as the source of part of the alternative prime-power argument. The roadmap uses the theta estimate directly and imports no code from either project. [Earlier Lean source and notices, DOI 10.5281/zenodo.24414348](https://doi.org/10.5281/zenodo.24414348) · [Hubbard’s source](https://github.com/sthubbar/lean-lab-preprints/blob/74c2d1ab2c2716ff50d5ace219ce45eab05adb51/LeanLab/ChirreHagen2025/ThetaPsi.lean) · [LeanLab licence](https://github.com/sthubbar/lean-lab-preprints/blob/74c2d1ab2c2716ff50d5ace219ce45eab05adb51/LICENSE)
