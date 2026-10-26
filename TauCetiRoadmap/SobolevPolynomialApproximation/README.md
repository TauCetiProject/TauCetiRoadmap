# Roadmap: polynomial approximation in Sobolev spaces

Tau Ceti has weak-derivative Sobolev spaces on open sets (`TauCeti.Wkp`, `TauCeti.W1p`), their
completeness, Meyers–Serrin density, Poincaré–Friedrichs inequalities, and the
Poincaré–Wirtinger inequality on convex and star-convex sets with explicit constants
(`TauCeti.eLpNorm_sub_setAverage_le_of_convex`, `TauCeti.enorm_sub_setAverage_le_of_starConvex`).
This roadmap builds the higher-order theory on top of them: how well polynomials of degree
`≤ m` approximate a `W^{m+1,p}` function on a domain, with constants that depend explicitly and
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
  `W^{k,p}(Ω)` is `TauCeti.Wkp volume Ω p k`.
- **Derivatives are basis-free**, as in Tau Ceti: the order-`(j+1)` weak derivative of a
  Sobolev function is a field in `Lᵖ(Ω; TauCeti.IteratedGradient E j)`, the gradient at `j = 0`
  and one more continuous-linear direction on the left at each further order, with operator
  norms. No multi-indices are used. For `G : IteratedGradient E (j + i)` and `h : E`, the
  **contraction** `G⟨h⟩ⁱ : IteratedGradient E j` applies `G` to `h` in its `i` outermost
  arguments; the **full contraction** `G⟨h⟩^{j+i+1} : ℝ` contracts all outer arguments and pairs
  the remaining vector with `h`. Define both, with linearity in `G` and homogeneity of degree
  `i` (respectively `j + i + 1`) in `h`.
- **Polynomials of degree `≤ m`** on `E`: `polynomialsDegLE n m : Submodule ℝ (E → ℝ)`, the image
  of Mathlib's `MvPolynomial.restrictTotalDegree (Fin n) ℝ m` under the evaluation map
  `q ↦ fun x => MvPolynomial.eval (fun i => x i) q`. Prove that evaluation is injective on it,
  that `Module.finrank ℝ (polynomialsDegLE n m) = (n + m).choose n`, and that its elements lie in
  `W^{k,p}(Ω)` for bounded `Ω` and every `k`, through an injective continuous linear map
  `Wkp.ofPolynomialL : polynomialsDegLE n m →L[ℝ] Wkp volume Ω p k` whose range is the
  finite-dimensional subspace `Wkp.polynomialsDegLE`.
- **Star-shaped with respect to a ball**, stated inline as in
  `TauCeti.enorm_sub_setAverage_le_of_starConvex`: hypotheses `0 < ρ` and
  `∀ y ∈ Metric.ball x₀ ρ, StarConvex ℝ y (Ω : Set E)`, with no named predicate. Constants depend
  on the **chunkiness** `γ := diam Ω / ρ` for this explicit `ρ`. Prove that the hypothesis implies
  `Metric.ball x₀ ρ ⊆ Ω` for nonempty `Ω`, and that a convex `Ω` containing `Metric.ball x₀ ρ`
  satisfies it (`Convex.starConvex`). Brenner–Scott (Definition 4.2.2) ask instead that the closed
  convex hull of `{x} ∪ B` lie in `Ω` for every `x ∈ Ω`; the inline hypothesis implies theirs for
  every smaller radius, so their estimates hold with constants in `diam Ω / ρ`, and their
  restriction to balls of radius `> ρ_max / 2` (Lemma 4.3.8) is not needed.

## Milestone 1: Sobolev seminorms and the polynomial kernel

1. **Derivatives and seminorms.** `Wkp.toOrderL (h : j ≤ k) : W^{k,p}(Ω) →L[ℝ] W^{j,p}(Ω)`, the
   iterate of `Wkp.lowerOrderL`, with `toOrderL le_rfl = id`, compatibility with composition,
   and with `Wkp.value` and `Wkp.iteratedGradient`. For `u ∈ W^{k,p}(Ω)` and `j + 1 ≤ k`,
   `D^{j+1} u := Wkp.iteratedGradient j (toOrderL _ u)`. The seminorms are
   `|u|_{j+1,p} := ‖D^{j+1} u‖` (the `Lᵖ` norm of the operator-norm field) and
   `|u|_{0,p} := ‖Wkp.value k u‖`, each a Mathlib `Seminorm`. Prove:
   - for smooth `u`, `D^{j+1} u` is a.e. the classical field `TauCeti.iteratedGradientChain u j`
     (from `TauCeti.Wkp.iteratedGradient_ae_eq_of_contDiffOn`);
   - the comparison with Tau Ceti's norm: with `S(u) := (∑_{j ≤ k} |u|_{j,p}²)^{1/2}` and
     `k ≥ 1`, `S(u) / √2 ≤ ‖u‖_{k,p} ≤ √2 · S(u)` for every `p`, and `‖u‖_{k,p} = S(u)` for
     `p = 2`. At order one this comes from `TauCeti.W1p.norm_value_le`,
     `TauCeti.W1p.norm_gradient_le` and `TauCeti.W1p.norm_le_norm_value_add_norm_gradient`; above
     it from `TauCeti.Wkp.norm_sq_eq_norm_lowerOrder_sq_add_norm_iteratedGradient_sq_succ`;
   - `|q|_{j,p} = 0` for `q ∈ Wkp.polynomialsDegLE m` and `j ≥ m + 1`;
   - **change of exponent:** for `Ω` of finite measure and `1 ≤ q ≤ p`, a continuous linear
     inclusion `Wkp.ofExponentLE : W^{k,p}(Ω) →L[ℝ] W^{k,q}(Ω)` generalizing
     `TauCeti.W1p.ofExponentLE` (same hypothesis `IsFiniteMeasure (volume.restrict Ω)`), that keeps
     the value and every weak derivative field (componentwise `Lp.antitone`, as in
     `W1p.ofExponentLE`; the defining weak-derivative identities do not depend on the exponent),
     with `|u|_{j,q} ≤ volume Ω ^ (1/q − 1/p) · |u|_{j,p}` for every `j ≤ k`.
2. **Integrating polynomial fields.** A polynomial Poincaré lemma, purely algebraic: if
   `P : Fin n → MvPolynomial (Fin n) ℝ` has every `P i ∈ restrictTotalDegree (Fin n) ℝ m` and
   `pderiv j (P i) = pderiv i (P j)` for all `i, j`, then there is
   `Q ∈ restrictTotalDegree (Fin n) ℝ (m + 1)` with `pderiv i Q = P i` for every `i`. Proof by
   homogeneous components, with Mathlib's Euler identity
   (`MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`):
   - `pderiv` lowers degree by one: `homogeneousComponent d (pderiv i R) =
     pderiv i (homogeneousComponent (d + 1) R)`, so the closedness condition holds for the
     homogeneous components `Pᵈ i := homogeneousComponent d (P i)` separately;
   - for each `d ≤ m`, `Qᵈ⁺¹ := (d + 1)⁻¹ • ∑ i, X i * Pᵈ i` satisfies `pderiv j Qᵈ⁺¹ = Pᵈ j`,
     since `pderiv j Qᵈ⁺¹ = (d + 1)⁻¹ • (Pᵈ j + ∑ i, X i * pderiv i (Pᵈ j))` by closedness and the
     sum is `d • Pᵈ j` by Euler;
   - `Q := ∑_{d ≤ m} Qᵈ⁺¹`, assembled with `MvPolynomial.sum_homogeneousComponent`.
3. **Kernel of the top seminorm.** On a preconnected `Ω`, for `u ∈ W^{m+1,p}(Ω)`:
   `|u|_{m+1,p} = 0` if and only if `Wkp.value u` is a.e. equal to an element of
   `polynomialsDegLE n m`. Proof by induction on `m`, starting from
   `TauCeti.W1p.exists_value_ae_eq_const_of_gradient_eq_zero`. In the step, the directional
   derivatives `∂ᵢ u ∈ W^{m+1,p}(Ω)` along the standard basis
   (`TauCeti.Wkp.exists_hasWeakLineDerivOn_value`) have vanishing top seminorm, so they are
   polynomials `Pᵢ` of degree `≤ m` by induction. They satisfy `∂ⱼ Pᵢ = ∂ᵢ Pⱼ` by the symmetry
   of weak derivatives (`TauCeti.HasWeakLineDerivOn.comm`). Item 2 gives `Q` with
   `∂ᵢ Q = Pᵢ`, and `u − Q` has zero gradient.
4. **The quotient.** The quotient normed space `W^{m+1,p}(Ω) ⧸ Wkp.polynomialsDegLE m` and its
   completeness (a finite-dimensional subspace is closed), and the statement that `|·|_{m+1,p}`
   descends to a seminorm on it.

## Milestone 2: higher-order change of variables

5. **Composition with `C^k` diffeomorphisms.** For `Φ : E → E` a `C^k` diffeomorphism of an open
   `Ω'` onto `Ω` with `‖iteratedFDeriv ℝ j Φ x‖ ≤ L` on `Ω'` for `1 ≤ j ≤ k`, `‖D Φ⁻¹‖ ≤ L` on
   `Ω`, and `|det DΦ| ≥ c > 0`, the map `u ↦ u ∘ Φ` is a bounded linear operator
   `W^{k,p}(Ω) → W^{k,p}(Ω')`. Its weak derivatives are given by the chain rule (Mathlib's Faà di
   Bruno formula for iterated derivatives of a composition, applied to the classical fields and
   carried to weak derivatives by density; Mathlib's `HasFTaylorSeriesUpToOn.comp`, whose series
   is `FormalMultilinearSeries.taylorComp`), and its operator norm has an explicit bound in
   `n, k, p, L, c`. This generalizes `TauCeti.W1p.compL` to all orders.
6. **Affine scaling of seminorms.** For `F x = B x + b` with `B` invertible and `Ω' = F ⁻¹' Ω`:
   `|u ∘ F|_{j,p,Ω'} ≤ ‖B‖^j |det B|^{−1/p} |u|_{j,p,Ω}` and
   `|u|_{j,p,Ω} ≤ ‖B⁻¹‖^j |det B|^{1/p} |u ∘ F|_{j,p,Ω'}` for every `j ≤ k`, with `p = ∞` read as
   exponent `0`. The geometric bounds (Ciarlet, Theorem 3.1.3, with radii in place of diameters),
   for bounded `Ω` and `Ω'`: if `Metric.ball y ρ' ⊆ Ω'` then `‖B‖ ≤ diam Ω / (2ρ')`; if
   `Metric.ball z ρ ⊆ Ω` then `‖B⁻¹‖ ≤ diam Ω' / (2ρ)`; and
   `|det B| = volume Ω / volume Ω'`. Boundedness is a hypothesis because Mathlib's `Metric.diam`
   of an unbounded set is `0`.
7. **Affine invariance of polynomials:** `q ∘ F ∈ polynomialsDegLE n m` for
   `q ∈ polynomialsDegLE n m`; this is the invariance the scaling argument uses.

## Milestone 3: the averaged Taylor polynomial

Throughout, `Ω` is bounded and star-shaped with respect to `Metric.ball x₀ ρ`, and
`φ ∈ C_c^∞(Metric.ball x₀ ρ)` is a fixed cutoff with `∫ φ = 1` and `‖φ‖_∞ ≤ C(n) ρ^{−n}`
(from a Mathlib `ContDiffBump` centred at `x₀`).

8. **Taylor polynomials of smooth functions.** For `u` of class `C^m` near `y`,
   `T^m_y u (x) := ∑_{j ≤ m} (1/j!) iteratedFDeriv ℝ j u y (fun _ => x − y)`, an element of
   `polynomialsDegLE n m` in `x`, with the integral form of the remainder along the segment
   from `y` to `x` (from Mathlib's one-variable `taylor_integral_remainder` applied to
   `t ↦ u (y + t (x − y))`).
9. **The averaged Taylor polynomial** `averagedTaylorL φ m : W^{m,p}(Ω) →L[ℝ] polynomialsDegLE n m`.
   For `u ∈ W^{m,p}(Ω)`,
   `Q^m u (x) := ∫ (Wkp.value u) y φ y dy + ∑_{1 ≤ j ≤ m} (1/j!) ∫ (D^j u)(y)⟨x − y⟩^j φ y dy`.
   Every integrand is integrable because `D^j u ∈ Lᵖ(Ω)` and `φ` is bounded with compact support
   in the ball, by Hölder's inequality on a finite measure; no inclusion between Sobolev spaces
   with different exponents is used. Prove:
   - `Q^m u ∈ polynomialsDegLE n m`, and `Q^m` is a continuous linear map from `W^{m,p}(Ω)` to
     the finite-dimensional space `polynomialsDegLE n m`;
   - `Q^m q = q` on `Ω` for `q ∈ polynomialsDegLE n m`;
   - for smooth `u`, `Q^m u = ∫ T^m_y u · φ y dy`;
   - **the derivative identity** (Brenner–Scott, Proposition 4.1.17, basis-free; proved for smooth
     `u` and extended by Meyers–Serrin density in `W^{m,1}(Ω)` after item 1's change of exponent): for
     `0 ≤ j < m`, the classical field `iteratedGradientChain (Q^m u) j` equals
     `x ↦ ∑_{i ≤ m − j − 1} (1/i!) ∫ (D^{j+1+i} u)(y)⟨x − y⟩ⁱ φ y dy`.
10. **The Sobolev representation formula.** For smooth `u ∈ W^{m+1,p}(Ω)` and `x ∈ Ω` (and, by
    Meyers–Serrin density, for every `u ∈ W^{m+1,1}(Ω)` and a.e. `x`, which covers every `p`
    through item 1's change of exponent):
    `u x − Q^m u x = ∫_Ω K x z (D^{m+1} u z) dz` with a kernel
    `K x z : IteratedGradient E m →L[ℝ] ℝ` supported in the convex hull of `{x}` and the ball,
    and `‖K x z‖ ≤ C(n, m, γ) · ‖x − z‖^{m+1−n}`. The kernel estimate integrates along the
    segments from points of the ball to `x`, the same tool as the Riesz-potential estimate in
    `TauCeti/Analysis/Sobolev/Poincare/Potential.lean`; that file's
    `enorm_sub_setAverage_le_of_starConvex` uses star-convexity with respect to the evaluation
    point and an arbitrary set average, so it is a related estimate, not the case `m = 0`.

## Milestone 4: Bramble–Hilbert and Deny–Lions

11. **Bramble–Hilbert lemma** (Brenner–Scott, Lemma 4.3.8). For `Ω` as in Milestone 3,
    `u ∈ W^{m+1,p}(Ω)` (with `Q^m u` taken of `Wkp.toOrderL _ u ∈ W^{m,p}(Ω)`) and every `j ≤ m`:
    `|u − Q^m u|_{j,p} ≤ C(n, m, p, γ) · (diam Ω)^{m+1−j} · |u|_{m+1,p}`, while
    `|u − Q^m u|_{m+1,p} = |u|_{m+1,p}`. Consequently
    `‖u − Q^m u‖_{m+1,p} ≤ C_BH · |u|_{m+1,p}` with
    `C_BH := √2 · (1 + C(n, m, p, γ)² · ∑_{j ≤ m} (diam Ω)^{2(m+1−j)})^{1/2}` (item 1's
    norm comparison), and the same bound for `inf_{q ∈ polynomialsDegLE n m} ‖u − q‖_{m+1,p}`.
    The proof follows Brenner–Scott's, not a compactness argument, for every `1 ≤ p ≤ ∞` (the
    representation formula holds for `u ∈ W^{m+1,p}(Ω)` through item 1's change of exponent to
    `W^{m+1,1}(Ω)`):
    - `j = 0`: the representation formula and the `Lᵖ → Lᵖ` bound for the Riesz potential
      `g x = ∫_Ω ‖x − z‖^{m+1−n} |f z| dz`, `‖g‖_p ≤ C(n, m) (diam Ω)^{m+1} ‖f‖_p` (Brenner–Scott,
      Lemma 4.3.6, by Hölder and Fubini, with `p = 1` and `p = ∞` separately);
    - `0 < j ≤ m`: item 9's derivative identity turns each component `(D^j (u − Q^m u))(x)⟨e_I⟩`
      along an orthonormal basis into the `j = 0` remainder of the corresponding component of
      `D^j u`, which lies in `W^{m+1−j,p}(Ω)` by `TauCeti.Wkp.exists_hasWeakLineDerivOn_value`;
      the operator norm and the basis components are comparable with constants in `n, j`.
    Tracking `diam Ω` through the Riesz-potential bound gives the powers directly, so no
    rescaling to diameter one is needed.
12. **Functional forms.** With `C_BH(m, p)` the constant of item 11 for the same `Ω`:
    - **Sublinear form.** Let `ℓ : W^{m+1,p}(Ω) → ℝ` be subadditive and absolutely homogeneous,
      with `ℓ u ≤ M ‖u‖_{m+1,p}` and `ℓ (u + q) = ℓ u` for every `q ∈ polynomialsDegLE n m`. Then
      `ℓ u ≤ M · C_BH(m, p) · |u|_{m+1,p}`. A bounded linear functional vanishing on
      `polynomialsDegLE n m` is the case `ℓ := |f ·|`.
    - **Bilinear form.** Let `b : W^{m+1,p}(Ω) →L[ℝ] W^{l+1,q}(Ω) →L[ℝ] ℝ` with `b r v = 0` for
      `r ∈ polynomialsDegLE n m` and `b u s = 0` for `s ∈ polynomialsDegLE n l`. Then
      `|b u v| ≤ ‖b‖ · C_BH(m, p) · C_BH(l, q) · |u|_{m+1,p} · |v|_{l+1,q}`, from
      `b u v = b (u − Q^m u) (v − Q^l v)`.
13. **Rellich–Kondrachov in `W^{k,p}`.** For bounded Lipschitz `Ω` (PDE Lane A's
    `Set.IsLipschitzDomainWith`) the inclusion `Wkp.lowerOrderL k : W^{k+1,p}(Ω) → W^{k,p}(Ω)` is
    compact for `1 ≤ p < ∞`, from the first-order result
    `TauCeti.W1p.isCompactOperator_valueL_of_isLipschitzDomainWith`.
14. **Deny–Lions lemma.** For bounded connected Lipschitz `Ω` and `1 ≤ p < ∞`: the quotient
    norm on `W^{m+1,p}(Ω) ⧸ Wkp.polynomialsDegLE m` is equivalent to the descended seminorm
    `|·|_{m+1,p}`, with a non-explicit constant, by the compactness argument (Peetre–Tartar).
    Generalize the first-order pattern of `TauCeti/Analysis/Sobolev/Poincare/Wirtinger/Compactness.lean`.

## Milestone 5: higher-order embedding and point evaluation

Throughout, `Ω` is as in Milestone 3.

15. **`W^{k,p} ⊆ C⁰` for `k p > n`** (and `k ≥ n` when `p = 1`): every `u ∈ W^{k,p}(Ω)` has a
    continuous representative bounded on `Ω`, with
    `sup_Ω |u| ≤ C(n, k, p, γ) ∑_{j ≤ k} (diam Ω)^{j − n/p} |u|_{j,p}` (with `n/p = 0` for
    `p = ∞`). Derive it as Brenner–Scott Lemma 4.3.4 does, not from the whole-space Morrey
    theorem, so the constant is explicit in the same parameters:
    - `u − Q^{k−1} u`: the representation formula of item 10 and the pointwise Riesz-potential
      bound `∫_Ω ‖x − z‖^{k−n} |f z| dz ≤ C(n, k, p) (diam Ω)^{k−n/p} ‖f‖_p` (Brenner–Scott,
      Lemma 4.3.1, by Hölder; `p = ∞` through item 1's change of exponent);
    - `Q^{k−1} u`: directly from its defining integral, `|x − y| ≤ diam Ω` and
      `‖φ‖_∞ ≤ C(n) ρ^{−n}` give `sup_Ω |Q^{k−1} u| ≤ C(n, k) γ^{n/p} ∑_{j < k} (diam Ω)^{j−n/p} |u|_{j,p}`;
    - continuity: the smooth approximants of Meyers–Serrin converge uniformly by the same bound. Point evaluation
    `u ↦ u x` is then a bounded linear functional on `W^{k,p}(Ω)`.
16. **Continuity up to the boundary.** For `p < ∞`:
    - **Density of functions smooth up to the boundary.** The restrictions to `Ω` of functions in
      `C_c^∞(E)` are dense in `W^{k,p}(Ω)`. Proof: for `t > 1` the dilate
      `x₀ + t • (Ω − x₀)` contains `closure Ω` (star-shapedness with respect to the ball), so
      `x ↦ u (x₀ + t⁻¹ • (x − x₀))` is in `W^{k,p}` of a neighbourhood of `closure Ω`, converges
      to `u` as `t → 1`, and is then mollified and cut off.
    - **Uniform continuity.** For `j` with `(k − j) p > n` (and `k − j ≥ n` when `p = 1`), every
      component `x ↦ (D^j u)(x)⟨v⟩^j` with `v ∈ E` (for `j = 0`, `u` itself) has a continuous
      representative that is uniformly continuous on `Ω`, hence extends continuously to
      `closure Ω`. The component lies in `W^{k−j,p}(Ω)` by `TauCeti.Wkp.exists_hasWeakLineDerivOn_value`
      applied `j` times. Apply item 15 to its differences with the approximants from the
      density statement: they converge uniformly on `Ω`, and a uniform limit of uniformly
      continuous functions is uniformly continuous.

## Boundaries

- **In scope:** everything above, for scalar real-valued functions on open subsets of
  `EuclideanSpace ℝ (Fin n)`.
- **Consumed from PDE Lane A:** `Wkp`, `W1p`, weak derivatives, density, the Lipschitz-domain
  predicate, first-order Rellich and Poincaré. This roadmap does not redefine any of them.
- **Not here:** fractional Sobolev spaces; approximation by piecewise polynomials on partitions of
  a domain; finite elements, interpolation operators and their error estimates; and vector-valued or differential-form
  Sobolev spaces.

## Acceptance criteria

- `Wkp.toOrderL`, the seminorms, `polynomialsDegLE`, the averaged Taylor polynomial and the
  quotient space each have their basic API (linearity, norms, behaviour under restriction to a
  subdomain and under affine maps), not only the headline lemmas.
- The Bramble–Hilbert constant is stated with its dependence on `n, m, p` and `γ` only; a test
  file instantiates it on the interior of a simplex (`interior (convexHull ℝ (Set.range v))` for an
  affinely independent `v : Fin (n + 1) → E`) and on an open cube.
- The affine scaling inequalities are proved in both directions and checked against the
  scaling of `x ↦ ‖x‖^j` on a dilated ball.

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
