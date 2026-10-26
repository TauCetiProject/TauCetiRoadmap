# Roadmap: polynomial approximation in Sobolev spaces

Tau Ceti has weak-derivative Sobolev spaces on open sets (`TauCeti.Wkp`, `TauCeti.W1p`), their
completeness, Meyers–Serrin density, Poincaré–Friedrichs inequalities, and the
Poincaré–Wirtinger inequality on convex and star-convex sets with explicit constants
(`TauCeti.eLpNorm_sub_setAverage_le_of_convex`, `TauCeti.enorm_sub_setAverage_le_of_starConvex`).
This roadmap builds the higher-order theory on top of them: how well polynomials of degree
`< k` approximate a `W^{k,p}` function on a domain, with constants that depend explicitly and
only on the geometry of the domain. The headline results are the **averaged Taylor
polynomial**, the **Bramble–Hilbert lemma**, the **Deny–Lions lemma**, and the **behaviour of
Sobolev seminorms under affine changes of variables**, together with the higher-order
change-of-variables and embedding results they need.

The bar for "done": an analyst who needs a polynomial approximation estimate in `W^{k,p}` on a
convex or Lipschitz domain, with its constant, finds it here and can use it without re-proving
any of the classical lemmas of Brenner–Scott, Chapter 4, or Ciarlet, Chapter 3.

## Standing setting

- `n : ℕ`, `E := EuclideanSpace ℝ (Fin n)` with Lebesgue measure `volume`; the domain is
  `Ω : TopologicalSpace.Opens E` (Tau Ceti's convention for `Wkp`), bounded where stated
  (`Bornology.IsBounded (Ω : Set E)`).
- `p : ℝ≥0∞` with `[Fact (1 ≤ p)]`; every statement covers `p = ∞` unless it says `p < ∞`.
- `k : ℕ`; `W^{k,p}(Ω)` is `TauCeti.Wkp volume Ω p k`.
- **Polynomials of degree `< k`** on `E`: the functions `x ↦ MvPolynomial.eval (fun i => x i) q`
  for `q : MvPolynomial (Fin n) ℝ` with `q.totalDegree < k`. Name this subspace
  `polynomialsDegLT n k` (a `Submodule ℝ (E → ℝ)`), prove `Module.finrank = (n + k - 1).choose n`,
  and that its elements lie in `W^{k,p}(Ω)` for bounded `Ω` (giving a finite-dimensional
  subspace `Wkp.polynomialsDegLT` of `Wkp volume Ω p k`).
- **Chunkiness:** `Ω` is *star-shaped with respect to the ball* `B = Metric.ball x₀ ρ` if
  `B ⊆ Ω` and `Ω` is star-convex with respect to every point of `B` (`StarConvex ℝ y (Ω : Set E)`
  for all `y ∈ B`). Its chunkiness parameter is `diam Ω / ρ_max`, `ρ_max` the supremum of such
  radii. Every bounded convex open set is star-shaped with respect to a ball of radius equal to
  its inradius; prove this.

## Milestone 1: Sobolev seminorms and the polynomial kernel

1. **The seminorms.** `Wkp.seminorm m u := ‖Wkp.iteratedGradient …‖` for `1 ≤ m ≤ k` (the `Lᵖ`
   norm of the order-`m` weak derivative of `u ∈ W^{k,p}`, read through `Wkp.lowerOrder`), and
   `|u|_{0,p} := ‖Wkp.value u‖`. Prove `‖u‖_{k,p}` is equivalent to `(∑_{m ≤ k} |u|_{m,p}^p)^{1/p}`
   with explicit constants (and the `p = ∞` analogue), the seminorm axioms, and that
   `|u|_{m,p} = 0` for every `u` in `Wkp.polynomialsDegLT` with `m ≥ k`.
2. **Kernel of the top seminorm.** On a preconnected `Ω`, `|u|_{k,p} = 0` if and only if `u` is
   a.e. equal to an element of `polynomialsDegLT n k`. Extend
   `TauCeti.W1p.exists_value_ae_eq_const_of_gradient_eq_zero` by induction on `k`.
3. **The quotient.** The quotient normed space `W^{k,p}(Ω) ⧸ Wkp.polynomialsDegLT`, its
   completeness, and the statement that `|·|_{k,p}` descends to a seminorm on it.

## Milestone 2: higher-order change of variables

4. **Composition with `C^k` diffeomorphisms.** For `Φ : E → E` a `C^k` diffeomorphism of an open
   `Ω'` onto `Ω` with `‖D^j Φ‖ ≤ L` on `Ω'` for `1 ≤ j ≤ k`, `‖D Φ⁻¹‖ ≤ L` on `Ω`, and
   `|det DΦ| ≥ c > 0`, the map `u ↦ u ∘ Φ` is a bounded linear operator
   `W^{k,p}(Ω) → W^{k,p}(Ω')` with the chain rule (Faà di Bruno) for its weak derivatives and an
   explicit operator-norm bound in `n, k, p, L, c`. This generalizes
   `TauCeti.W1p.compL` to all orders.
5. **Affine scaling of seminorms.** For `F x = B x + b` with `B` invertible and `Ω' = F⁻¹' Ω`:
   `|u ∘ F|_{m,p,Ω'} ≤ ‖B‖^m |det B|^{-1/p} |u|_{m,p,Ω}` and
   `|u|_{m,p,Ω} ≤ ‖B⁻¹‖^m |det B|^{1/p} |u ∘ F|_{m,p,Ω'}` for every `m ≤ k`, with `p = ∞`
   read as exponent `0`. Also the bounds `‖B‖ ≤ diam Ω / ρ'` and `‖B⁻¹‖ ≤ diam Ω' / ρ` when
   `F` maps a set containing a ball of radius `ρ'` onto a set of diameter `diam Ω`, and the
   bound on `|det B|` by the volume ratio.
6. **Composition with affine maps on polynomials:** `q ∘ F ∈ polynomialsDegLT n k` for
   `q ∈ polynomialsDegLT n k`; this is the invariance the scaling argument uses.

## Milestone 3: the averaged Taylor polynomial

7. **Taylor polynomials of smooth functions.** For `u` of class `C^{k-1}` near `y`, the Taylor
   polynomial `T^k_y u` of degree `< k` (as an element of `polynomialsDegLT n k`, via Mathlib's
   `iteratedFDeriv`) and the integral form of the remainder along segments.
8. **The averaged Taylor polynomial.** For `Ω` star-shaped with respect to `B` and a fixed cutoff
   `φ ∈ C_c^∞(B)` with `∫ φ = 1` and `‖φ‖_∞ ≤ C ρ^{-n}`, define
   `Q^k u := ∫_B T^k_y u(·) φ(y) dy` for smooth `u`, prove it is a polynomial of degree `< k`,
   and extend it by density to a bounded linear map `Q^k : W^{k-1,1}(Ω) → polynomialsDegLT n k`
   (bounded for every `p` through `W^{k-1,p}(Ω) ⊆ W^{k-1,1}(Ω)` on bounded `Ω`). Prove
   `Q^k q = q` for `q` of degree `< k` and the derivative identity
   `∂^α Q^k u = Q^{k-|α|} ∂^α u`.
9. **The Sobolev representation formula.** For smooth `u` on `Ω`:
   `u(x) − Q^k u(x) = ∑_{|α| = k} ∫_Ω K_α(x, z) ∂^α u(z) dz` with the kernel bound
   `|K_α(x, z)| ≤ C(n, k, chunkiness) |x − z|^{k − n}`. This is the higher-order form of the
   Riesz-potential estimate `TauCeti.enorm_sub_setAverage_le_of_starConvex`, which is the case
   `k = 1`; reuse its potential estimates.

## Milestone 4: Bramble–Hilbert and Deny–Lions

10. **Bramble–Hilbert lemma** (Brenner–Scott, Lemma 4.3.8). For bounded `Ω` star-shaped with
    respect to a ball, `u ∈ W^{k,p}(Ω)` and every `m < k`:
    `|u − Q^k u|_{m,p} ≤ C(n, k, p, chunkiness) · (diam Ω)^{k − m} · |u|_{k,p}`.
    In particular `inf_{q ∈ polynomialsDegLT n k} ‖u − q‖_{k,p} ≤ C · |u|_{k,p}`. State the
    constant's dependence exactly as written; the proof is the representation formula plus the
    Young/Riesz-potential bound, not a compactness argument.
11. **Functional form.** For a bounded linear functional (or a bounded sublinear map)
    `ℓ` on `W^{k,p}(Ω)` that vanishes on `polynomialsDegLT n k`:
    `|ℓ u| ≤ C ‖ℓ‖ |u|_{k,p}`, with the same constant dependence; and the bilinear version
    for maps vanishing on polynomials in either argument.
12. **Rellich–Kondrachov in `W^{k,p}`.** For bounded Lipschitz `Ω` (PDE Lane A's
    `Set.IsLipschitzDomainWith`) the inclusion `W^{k,p}(Ω) → W^{k−1,p}(Ω)` is compact for
    `1 ≤ p < ∞`, from the first-order result `TauCeti.W1p.isCompactOperator_valueL_of_isLipschitzDomainWith`.
13. **Deny–Lions lemma.** For bounded connected Lipschitz `Ω` and `1 ≤ p < ∞`: the quotient
    norm on `W^{k,p}(Ω) ⧸ Wkp.polynomialsDegLT` is equivalent to the descended seminorm
    `|·|_{k,p}`, with a non-explicit constant, by the compactness argument (Peetre–Tartar).
    Generalize the first-order pattern of `TauCeti/Analysis/Sobolev/Poincare/Wirtinger/Compactness.lean`.

## Milestone 5: higher-order embedding and point evaluation

14. **`W^{k,p} ⊆ C⁰` for `k p > n`** (and `k ≥ n` when `p = 1`): on bounded `Ω` star-shaped with
    respect to a ball, every `u ∈ W^{k,p}(Ω)` has a continuous representative bounded on `Ω`, with
    `sup_Ω |u| ≤ C(n, k, p, chunkiness) ∑_{m ≤ k} (diam Ω)^{m − n/p} |u|_{m,p}`. Derive it from the
    representation formula of item 9 (not from the whole-space Morrey theorem), so the constant
    is explicit in the same parameters. Point evaluation `u ↦ u(x)` is then a bounded linear
    functional on `W^{k,p}(Ω)`.
15. **Higher derivatives:** the same for `∂^α u` with `|α| < k − n/p`, giving `W^{k,p}(Ω) ⊆
    C^j(Ω̄)` (continuous derivatives up to order `j` extending continuously to the closure) for
    `j < k − n/p`.

## Boundaries

- **In scope:** everything above, for scalar real-valued functions on open subsets of
  `EuclideanSpace ℝ (Fin n)`.
- **Consumed from PDE Lane A:** `Wkp`, `W1p`, weak derivatives, density, the Lipschitz-domain
  predicate, first-order Rellich and Poincaré. This roadmap does not redefine any of them.
- **Not here:** fractional Sobolev spaces, approximation by piecewise polynomials on partitions of
  a domain, and vector-valued or differential-form Sobolev spaces (the last is the roadmap
  *Sobolev spaces of differential forms and the L² de Rham complex*).

## Acceptance criteria

- `Wkp.seminorm`, `polynomialsDegLT`, the averaged Taylor polynomial and the quotient space each
  have their basic API (linearity, norms, behaviour under restriction to a subdomain and under
  affine maps), not only the headline lemmas.
- The Bramble–Hilbert constant is stated with its dependence on `n, k, p` and the chunkiness
  parameter only; a test file instantiates it on a simplex
  (`convexHull ℝ (Set.range v)` for an affinely independent `v : Fin (n + 1) → E`) and on a cube.
- The affine scaling inequalities are proved in both directions and checked against the
  scaling of `x ↦ ‖x‖^m` on a dilated ball.

## References

- S. C. Brenner, L. R. Scott, *The Mathematical Theory of Finite Element Methods*, 3rd ed.,
  Springer, 2008, Chapter 4 (§4.1–4.4).
- P. G. Ciarlet, *The Finite Element Method for Elliptic Problems*, SIAM, 2002, §3.1.
- J. H. Bramble, S. R. Hilbert, *Estimation of linear functionals on Sobolev spaces with
  application to Fourier transforms and spline interpolation*, SIAM J. Numer. Anal. 7 (1970).
- T. Dupont, R. Scott, *Polynomial approximation of functions in Sobolev spaces*, Math. Comp.
  34 (1980).
- J. Deny, J.-L. Lions, *Les espaces du type de Beppo Levi*, Ann. Inst. Fourier 5 (1954).
- L. C. Evans, *Partial Differential Equations*, 2nd ed., AMS, 2010, Chapter 5.
