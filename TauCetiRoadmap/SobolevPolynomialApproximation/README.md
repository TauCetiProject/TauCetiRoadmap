# Roadmap: polynomial approximation in Sobolev spaces

**Summary.** Build the higher-order theory of `W^{k,p}(Ω)` on top of Tau Ceti's weak-derivative
Sobolev spaces: how well polynomials of degree `≤ m` approximate a `W^{m+1,p}` function on a domain,
with constants that depend explicitly and only on the geometry of the domain. From the seminorms,
all-order directional derivatives and the polynomial kernel of the top seminorm, through
higher-order
change of variables and affine scaling, it reaches the **averaged Taylor polynomial**, the **Sobolev
representation formula**, the **Bramble–Hilbert lemma** and its functional forms, the **Deny–Lions
lemma**, and the embedding `W^{k,p} ⊆ C⁰` for `kp > n` with continuity up to the boundary. An
analyst who needs a polynomial approximation estimate in `W^{k,p}` on a convex or Lipschitz domain,
with its constant, finds it here and can use it without re-proving the classical lemmas of
Brenner–Scott, Chapter 4, or Ciarlet, Chapter 3.

## Scope and ownership

This roadmap owns, for scalar real-valued functions on open subsets of `EuclideanSpace ℝ (Fin n)`:

- Layer 1: contractions, polynomials of bounded degree and their Sobolev classes, order truncation
  and seminorms, change of exponent in every order, the bundled directional derivative of all orders,
  the polynomial Poincaré lemma, the kernel of the top seminorm, and the quotient by polynomials;
- Layer 2: composition with `C^k` diffeomorphisms, affine scaling and its geometric bounds;
- Layer 3: Taylor polynomials, the averaged Taylor polynomial on `L¹`, and the representation
  formula;
- Layer 4: Bramble–Hilbert, its functional forms, Rellich–Kondrachov in `W^{k,p}`, and Deny–Lions;
- Layer 5: `W^{k,p} ⊆ C⁰` with explicit constants, density of functions smooth up to the boundary,
  and uniform continuity.

It leaves to named owners:

- `W^{k,p}` and its first-order theory, Meyers–Serrin density, Poincaré inequalities, Lipschitz
  domains, first-order Rellich and extension to PDE Lane A, implemented in Tau Ceti and consumed as
  listed in the supplier contracts; nothing there is redefined here;
- the Sobolev theory of differential forms to SobolevDifferentialForms.

It does not contain fractional Sobolev spaces, approximation by piecewise polynomials on partitions
of a domain, finite elements or their interpolation operators, or vector-valued Sobolev spaces.

## Conventions

- **Setting.** `n : ℕ`, `E := EuclideanSpace ℝ (Fin n)` with Lebesgue measure `volume`; the domain
  is
  `Ω : TopologicalSpace.Opens E`, bounded where stated (`Bornology.IsBounded (Ω : Set E)`), because
  Mathlib's `Metric.diam` of an unbounded set is `0`.
- **Exponents.** `p : ℝ≥0∞` with `[Fact (1 ≤ p)]`; every statement covers `p = ∞` unless it says
  `p < ∞`. In exponents `1/p` is `0` at `p = ∞`. `W^{k,p}(Ω)` is `TauCeti.Wkp volume Ω p k`.
- **Derivatives are basis-free.** The order-`(j+1)` weak derivative is a field in
  `Lᵖ(Ω; TauCeti.IteratedGradient E j)`: the gradient at `j = 0`, with one more continuous-linear
  direction on the left at each further order, and operator norms. Multi-indices are not used for
  derivatives of Sobolev functions.
- **Polynomial degree.** `m` is the total degree, so Brenner–Scott's averaged polynomial of order
  `r`
  is the degree `m = r − 1` polynomial here.
- **Star-shaped with respect to a ball** is stated inline: `0 < ρ` and
  `∀ y ∈ Metric.ball x₀ ρ, StarConvex ℝ y (Ω : Set E)`, with no named predicate. The **chunkiness**
  is `γ := diam Ω / ρ` for this explicit `ρ`. The empty set satisfies the hypothesis
  (`starConvex_empty`); statements that need a point say `Ω` is nonempty.
- **Constants.** `C(a, b, …)` depends on the listed parameters and nothing else.

## Exact supplier contracts

### From Mathlib

All at the pinned Mathlib.

- `MvPolynomial.restrictTotalDegree`, `MvPolynomial.mem_restrictTotalDegree`
  (`RingTheory/MvPolynomial/Basic.lean`), `MvPolynomial.funext`
  (`Algebra/MvPolynomial/Funext.lean`),
  `MvPolynomial.pderiv`, `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`
  (`RingTheory/MvPolynomial/EulerIdentity.lean`), `MvPolynomial.sum_homogeneousComponent`
  (`RingTheory/MvPolynomial/Homogeneous.lean`).
- `StarConvex`, `starConvex_empty` (`Analysis/Convex/Star.lean`), `Convex.starConvex`.
- `taylor_integral_remainder` (`Analysis/Calculus/Taylor.lean`), which requires `ContDiffOn` of
  order
  `n + 1` on the whole interval.
- `HasFTaylorSeriesUpToOn.comp`, `FormalMultilinearSeries.taylorComp`
  (`Analysis/Calculus/ContDiff/FaaDiBruno.lean`): classical composition only.
- `Lp.antitone` (`MeasureTheory/Function/LpSpace/Basic.lean`), `ContDiffBump`, Hölder's inequality,
  Fubini's theorem, and the Lebesgue change of variables under linear maps.

### From Tau Ceti

All as Tau Ceti implements them on its main branch, some later than the pinned revision;
`Suggested.lean` uses only those at the pin. File paths under `TauCeti/Analysis/`.

- `TauCeti.Wkp`, `Wkp.lowerOrderL`, `Wkp.iteratedGradient`, `Wkp.value`, `Wkp.ext`, `Wkp.mk`,
  `Wkp.hasWeakFDerivOn_iteratedGradient`, and the recursive norm
  `Wkp.norm_sq_eq_norm_lowerOrder_sq_add_norm_iteratedGradient_sq_succ` (`Sobolev/Wkp/Basic.lean`);
  `Wkp.restrictL` (`Sobolev/Wkp/Restriction.lean`); `Wkp.iteratedGradient_ae_eq_of_contDiffOn`
  (`Sobolev/Wkp/Classical.lean`); `Wkp.tendsto_mollified_iteratedGradient`
  (`Sobolev/Wkp/Approximation.lean`), for `p ≠ ∞`.
- Directional derivatives: `Wkp.exists_hasWeakLineDerivOn_value`,
  `Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn`,
  `Wkp.inner_iteratedGradient_one_apply_ae_eq` (`Sobolev/Wkp/LineDeriv.lean`);
  `HasWeakLineDerivOn.comm` (`Sobolev/WeakDeriv/Symmetry.lean`).
- Meyers–Serrin in every order: `Wkp.dense_contDiffOn_representatives`
  (`Sobolev/Wkp/MeyersSerrin.lean`), for `p ≠ ∞` and arbitrary open `Ω`.
- `TauCeti.IteratedGradient`, `TauCeti.iteratedGradientChain` (`Calculus/IteratedGradient.lean`).
- `TauCeti.W1p`, `W1p.norm_value_le`, `W1p.norm_gradient_le`, `W1p.norm_le_norm_value_add_norm_gradient`,
  `W1p.ofExponentLE` (`Sobolev/W1p/Basic.lean`).
- `W1p.compL`, `W1p.value_compL_ae`, `W1p.gradient_compL_ae` (`Sobolev/W1p/ChangeOfVariables.lean`):
  first-order change of variables for `p ≠ ∞`, with `‖DΦ‖ ≤ L` and `c ≤ |det DΦ|`.
- `W1p.exists_value_ae_eq_const_of_gradient_eq_zero` (`Sobolev/Poincare/Wirtinger/W1p.lean`).
- `Set.IsLipschitzDomainWith`, on open subsets of `WithLp 2 (ℝ × E')` (`Sobolev/LipschitzDomain/Basic.lean`);
  `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith`
  (`Sobolev/LipschitzDomain/RellichKondrachov.lean`).
- `ContinuousLinearMap.exists_pos_mul_norm_le_of_compact_estimate` (Peetre's estimate,
  `Normed/Operator/Compact/Estimate.lean`) and its use in
  `W1p.exists_eLpNorm_value_sub_setAverage_le_of_isCompactOperator`
  (`Sobolev/Poincare/Wirtinger/Compactness.lean`).
- `TauCeti.enorm_sub_setAverage_le_of_starConvex` (`Sobolev/Poincare/Potential.lean`): star-convexity
  with respect to the evaluation point and an arbitrary set average, so a related estimate, not the
  case `m = 0` of §3.5.

### From TauCetiRoadmap.PDE

Lane A owns the Tau Ceti declarations above: A.1 the weak derivatives, the line-derivative bridge
and symmetry; A.2 Meyers–Serrin in every order; A.5 the constant-on-connected lemma and the Wirtinger
estimate by compactness; A.6 the Lipschitz predicate and Rellich. Tau Ceti provides `W1p.compL` and
Peetre's estimate, which no roadmap plans. This roadmap adds no target to Lane A. On `E`, a **bounded
Lipschitz domain** for `n ≥ 1` means the image of an open `Ω' ⊆ WithLp 2 (ℝ × E')` satisfying
`Set.IsLipschitzDomainWith`, bounded, under a linear isometry onto `E`, with `finrank ℝ E' = n − 1`.

## How to read the build

Layer 1 sets up the objects: contractions, polynomials, seminorms, change of exponent and all-order
directional derivatives, and proves the kernel of the top seminorm from the polynomial Poincaré
lemma.
Layer 2 proves the change-of-variables theory and scaling. Layer 3 constructs the averaged Taylor
polynomial on `L¹` and proves the representation formula. Layer 4 draws Bramble–Hilbert from that
formula with explicit constants, and Deny–Lions by compactness. Layer 5 proves the embedding and the
behaviour at the boundary from the same formula. Each layer uses only earlier layers and the
suppliers
above; Layer 4's Bramble–Hilbert uses no compactness and no Lipschitz predicate.

## Layer 1: seminorms, derivatives and the polynomial kernel

### 1.1 Contractions

For `G : IteratedGradient E (j + i)` and `h : E`, the **contraction** `G⟨h⟩ⁱ : IteratedGradient E j`
applies `G` to `h` in its `i` outermost arguments. The **full contraction**
`G⟨h⟩^{j+1} : ℝ` for `G : IteratedGradient E j` contracts all `j` outer arguments and pairs the
remaining vector with `h`.

Its API: linearity in `G`; homogeneity of degree `i` (respectively `j + 1`) in `h`; the norm bound
`‖G⟨h⟩ⁱ‖ ≤ ‖G‖ ‖h‖ⁱ`.

*Needs:* Tau Ceti `IteratedGradient`.

**Checks.** On `E = ℝ`, for `u(x) = x²` and `h = 3`:

- gradient `2x`, full contraction `6x`, and doubling `h` gives `12x = 2 · 6x`;
- Hessian `2`, applied once gives `6`, and the full second contraction gives `18`;
- doubling `h` in the second contraction gives `72 = 2² · 18`, which excludes a degree-one scaling.

### 1.2 Polynomials on `E`

`evalₗ n : MvPolynomial (Fin n) ℝ →ₗ[ℝ] (E n → ℝ)` is evaluation, and `polynomialsDegLE n m` is the
image of `MvPolynomial.restrictTotalDegree (Fin n) ℝ m` under it.

Its API: `evalₗ n` is injective (`MvPolynomial.funext`); `finrank_polynomialsDegLE`:
`Module.finrank ℝ (polynomialsDegLE n m) = (n + m).choose n`.

*Needs:* Mathlib `MvPolynomial`.

**Checks.**

- `(n, m) = (0, 2), (1, 2), (2, 2)`: dimensions `1, 3, 6`, matching `choose`.
- `m = 0`: `0` and `1` belong and `X` does not, so the degree is total degree and includes zero.
- `0`, `1` and `X` in one variable take the values `0, 1, 0` at `x = 0` and `0, 1, 1` at `x = 1`.

### 1.3 Truncation and seminorms

`toOrderL (h : j ≤ k) : W^{k,p}(Ω) →L[ℝ] W^{j,p}(Ω)` is the iterate of `Wkp.lowerOrderL`. For
`j + 1 ≤ k`, `D^{j+1} u := Wkp.iteratedGradient j (toOrderL _ u)`. The seminorm `seminorm k j _ u`,
written `|u|_{j,p}`, is `‖D^j u‖` for `j ≥ 1` and `‖Wkp.value k u‖` for `j = 0`.

Its API:

- `toOrderL le_rfl = id`, compatibility with composition, with `Wkp.value`, with
  `Wkp.iteratedGradient` and with `Wkp.restrictL`;
- each `|·|_{j,p}` is a Mathlib `Seminorm`;
- for `u` with a smooth representative, `D^{j+1} u` is a.e. the classical field
  `iteratedGradientChain u j` (from `Wkp.iteratedGradient_ae_eq_of_contDiffOn`);
- the norm comparison `norm_le_sqrt_two_mul`, `sqrt_le_sqrt_two_mul_norm`: with
  `S(u) := (∑_{j ≤ k} |u|_{j,p}²)^{1/2}` and `k ≥ 1`, `S(u) / √2 ≤ ‖u‖_{k,p} ≤ √2 · S(u)` for every
  `p`,
  and `‖u‖_{k,p} = S(u)` for `p = 2`. Order one comes from `W1p.norm_value_le`,
  `W1p.norm_gradient_le`
  and the triangle inequality in the graph norm, and higher orders from
  `Wkp.norm_sq_eq_norm_lowerOrder_sq_add_norm_iteratedGradient_sq_succ`.

*Needs:* §1.1; Tau Ceti `Wkp`, `Wkp.lowerOrderL`, `Wkp.restrictL`, `W1p`.

**Checks.**

- `j = k = 1`, `u(x) = x` on `(0,1)`: `toOrderL` is the identity and `|u|_{1,2} = 1`; a zero map
  fails.
- `u = x²`, `Ω = (0,1)`, `p = 2`, `k = 2`: `|u|_0, |u|_1, |u|_2 = 1/√5, 2/√3, 2`.
- `u = x` on `(0,1)`, `k = 1`, `p = 2`: `S = 2/√3` is the graph norm. `u = sin x` on `(0, 2π)`,
  `p = ∞`: `S = √2` and the graph norm is `1`, the lower comparison being an equality, so the
  graph norm is not `S` for all `p`.

### 1.4 Change of exponent

For `Ω` of finite measure and `1 ≤ q ≤ p`, a continuous linear inclusion `W^{k,p}(Ω) →L[ℝ] W^{k,q}(Ω)`
generalizes `W1p.ofExponentLE` (same hypothesis `IsFiniteMeasure (volume.restrict Ω)`). It keeps the
value and every weak derivative field, by `Lp.antitone` in each component, since the defining
weak-derivative identities do not depend on the exponent.

Its API: `|u|_{j,q} ≤ volume Ω ^ (1/q − 1/p) · |u|_{j,p}` for every `j ≤ k`; compatibility with
`toOrderL`; the identity at `q = p`.

*Needs:* §1.3; Mathlib `Lp.antitone`; Tau Ceti `W1p.ofExponentLE`, `Wkp.mk`.

**Checks.**

- `u = 1`, `Ω = (0,2)`, `p = 2`, `q = 1`: norms `√2` and `2`, factor `2^{1/2}`, and `2 ≤ √2 · √2`.
- `q = p`: the constant `1` keeps value `1`; a zero map sends it to `0`.
- `Ω = ℝ`, `p = 2`, `q = 1`: `1/(1 + |x|)` is in `L²` and not in `L¹`, so finite measure is
  load-bearing.

### 1.5 The bundled directional derivative

Tau Ceti supplies existence and symmetry: `Wkp.exists_hasWeakLineDerivOn_value` gives each directional
weak derivative in `W^{k,p}(Ω)`, and `HasWeakLineDerivOn.comm` commutes them. Bundle them: for `v : E`,
the continuous linear map `∂_v : W^{k+1,p}(Ω) →L[ℝ] W^{k,p}(Ω)` has value the weak derivative, unique by
`Wkp.ext`, and for `j + 1 ≤ k` it satisfies `D^{j+1} (∂_v u) = (D^{j+2} u)⟨v⟩¹` a.e.

Its API: linearity in `v`; `|∂_v u|_{j,p} ≤ ‖v‖ |u|_{j+1,p}`; the components of `D^j u` along directions
`h₁, …, h_j` are the values of the iterates `∂_{h₁} ⋯ ∂_{h_j} u ∈ W^{k−j,p}(Ω)`, in every order.

*Needs:* §1.1, §1.3; Tau Ceti `Wkp.exists_hasWeakLineDerivOn_value`, `HasWeakLineDerivOn.comm`, `Wkp.ext`,
`Wkp.hasWeakFDerivOn_iteratedGradient`.

**Checks.** On `Ω = (0,1)`, `u = x²`, `v = 3`:

- `∂_v u = 6x ∈ W^{1,p}` with `D¹(∂_v u) = 6`, and `(D²u)⟨3⟩¹ = 2 · 3 = 6`;
- `|∂_v u|_{0,∞} = 6 ≤ 3 · |u|_{1,∞} = 3 · 2`, with equality;
- in two variables, `u = xy`, `v = e₁`, `w = e₂`: `∂_v ∂_w u = ∂_w ∂_v u = 1`.

### 1.6 Sobolev classes of polynomials and the polynomial Poincaré lemma

**Classes.** For bounded `Ω`, a continuous linear map from `polynomialsDegLE n m` to `W^{k,p}(Ω)`
sends
`q` to the class with value `q` a.e. on `Ω`. For nonempty `Ω` it is injective and its
finite-dimensional
range is the subspace of **polynomial classes of degree `≤ m`**. `|q|_{j,p} = 0` for `j ≥ m + 1`.

**Polynomial Poincaré lemma** (`exists_pderiv_eq`), purely algebraic: if
`P : Fin n → MvPolynomial (Fin n) ℝ` has every `P i ∈ restrictTotalDegree (Fin n) ℝ m` and
`pderiv j (P i) = pderiv i (P j)` for all `i, j`, then there is
`Q ∈ restrictTotalDegree (Fin n) ℝ (m + 1)` with `pderiv i Q = P i` for every `i`. Proof by
homogeneous
components and Euler's identity:

- `homogeneousComponent d (pderiv i R) = pderiv i (homogeneousComponent (d + 1) R)`, so the
  closedness condition holds for the components `Pᵈ i := homogeneousComponent d (P i)` separately;
- for each `d ≤ m`, `Qᵈ⁺¹ := (d + 1)⁻¹ • ∑ i, X i * Pᵈ i` satisfies `pderiv j Qᵈ⁺¹ = Pᵈ j`, since
  `pderiv j Qᵈ⁺¹ = (d + 1)⁻¹ • (Pᵈ j + ∑ i, X i * pderiv i (Pᵈ j))` by closedness and the sum is
  `d • Pᵈ j` by Euler;
- `Q := ∑_{d ≤ m} Qᵈ⁺¹`, assembled with `MvPolynomial.sum_homogeneousComponent`.

*Needs:* §1.2, §1.3; Mathlib `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`,
`MvPolynomial.sum_homogeneousComponent`.

**Checks.**

- `Ω = (0,1)`, `k = m = 0`, `p = 2`: the classes of `0` and `1` have norms `0` and `1`; on `Ω = ∅`
  both
  are the unique element of `L²(∅)`, so nonemptiness is load-bearing for injectivity.
- `Ω = ℝ`, `p = 2`, `q = 1`: `∫ |q|² = ∞`, so boundedness is load-bearing for the map.
- `P = (y, x)`, `m = 1`: `Q = xy`. `P = (−y, x)` has mixed derivatives `−1 ≠ 1` and is not closed.
- `n = 1`, `m = 0`, `P = 3`: `Q = 3x`, with denominator `d + 1 = 1`; for `n = 0` the family is empty
  and
  `Q = 0`.

### 1.7 Kernel of the top seminorm

`seminorm_top_eq_zero_iff`: on a preconnected `Ω`, for `u ∈ W^{m+1,p}(Ω)`, `|u|_{m+1,p} = 0` if and only if
`Wkp.value u` is a.e. equal to an element of `polynomialsDegLE n m`. Proof by induction on `m`, from
`W1p.exists_value_ae_eq_const_of_gradient_eq_zero`. In the step, `∂ᵢ u := ∂_{eᵢ} u ∈ W^{m,p}(Ω)` have
vanishing top seminorm, so they are polynomials `Pᵢ` of degree `≤ m − 1`, closed by §1.5. §1.6 gives
`Q` with `∂ᵢ Q = Pᵢ`, and `u − Q` has zero gradient.

*Needs:* §1.5, §1.6; Tau Ceti `W1p.exists_value_ae_eq_const_of_gradient_eq_zero`.

**Checks.**

- `Ω = (0,1)`, `m = 1`: `u = x` has top seminorm `0` and witness `x`; `u = x²` has top seminorm `2`
  and no
  affine witness.
- `Ω = (0,1) ∪ (2,3)`, `m = 0`, `u = 0` then `1`: zero gradient and no global constant, so
  preconnectedness is load-bearing.
- `n = 0`: the gradient vanishes and every function is constant on the point.

### 1.8 The quotient

For bounded `Ω`, the quotient normed space of `W^{m+1,p}(Ω)` by the polynomial classes of degree `≤
m`,
its completeness (a finite-dimensional subspace is closed), and the descent of `|·|_{m+1,p}` to a
seminorm on it.

*Needs:* §1.6, §1.7.

**Checks.**

- `Ω = (0,1)`, `p = 2`, `m = 0`: `u = x` has quotient norm `√(13/12)` and top seminorm `1`.
- `u = 1` has quotient norm and top seminorm `0`.
- `Ω = ℝ` is excluded: the constant `1` is not in `W^{1,2}(ℝ)`.

### Examples

`u = x²` on `(0,1)` in `W^{2,2}`, with the seminorms of §1.3, the derivatives of §1.5 and the
quotient
class of §1.8 for `m = 1`.

### Dependencies

Mathlib's multivariate polynomials and `Lp` spaces; Tau Ceti's `Wkp`, `W1p` and weak derivatives.

## Layer 2: change of variables

### 2.1 Composition with `C^k` diffeomorphisms

Let `k ≥ 1`, let `Φ` be `C^k` on an open `Ω'` and `Ψ` be `C¹` on an open `Ω`, mutually inverse
bijections
between them, with `‖iteratedFDeriv ℝ j Φ x‖ ≤ L` on `Ω'` for `1 ≤ j ≤ k` and `‖fderiv ℝ Ψ x‖ ≤ L`
on `Ω`.
This gives `|det DΦ| ≥ L^{−n}`. Then `u ↦ u ∘ Φ` is a bounded linear operator
`W^{k,p}(Ω) → W^{k,p}(Ω')` with operator norm at most `C(n, k, p, L)` (`exists_norm_comp_le`).

At `k = 1` and `p ≠ ∞` this is `W1p.compL`, with its value and gradient laws `W1p.value_compL_ae` and
`W1p.gradient_compL_ae`. For `k ≥ 2`, `HasFTaylorSeriesUpToOn.comp` gives the classical fields for smooth
`u`, and `Wkp.dense_contDiffOn_representatives` carries them to every `u`, since `W^{k,p}(Ω')` is closed
under the graph limit. At `p = ∞` the weak identities are local: on relatively compact open subsets,
apply the finite-exponent case through §1.4.

*Needs:* §1.3, §1.4, §1.5; Mathlib `HasFTaylorSeriesUpToOn.comp`; Tau Ceti `W1p.compL`,
`Wkp.dense_contDiffOn_representatives`, `Wkp.restrictL`.

**Checks.**

- `Φ(x) = 2x`, `u = x²`, `Ω' = (0,1)`, `Ω = (0,2)`: `u ∘ Φ = 4x²` with second derivative `8`, which
  is
  the chain term `2 · 2²` plus `2(2x) · 0`.
- `Φ = id`: the operator is the identity.
- `k = 1`: the formula reduces to `∇(u ∘ Φ) = (DΦ)ᵀ (∇u) ∘ Φ`.

### 2.2 Affine scaling of seminorms

For `F x = B x + b` with `B` invertible and `Ω' = F ⁻¹' Ω`, the composition of §2.1 satisfies, order
by
order (`exists_affine_scaling`):
`|u ∘ F|_{j,p,Ω'} ≤ ‖B‖^j |det B|^{−1/p} |u|_{j,p,Ω}` and
`|u|_{j,p,Ω} ≤ ‖B⁻¹‖^j |det B|^{1/p} |u ∘ F|_{j,p,Ω'}` for every `j ≤ k`, with exponent `0` at `p =
∞`.

*Needs:* §2.1.

**Checks.** With `F(x) = 2x`, `Ω' = (0,1)`, `Ω = (0,2)`, `u = x`:

- `p = 2`, `j = 0`: `2^{−1/2} √(8/3) = 2/√3`, the norm of `2x` on `(0,1)`; the reverse bound
  recovers
  `√(8/3)`.
- `p = 2`, `j = 1`: `2 · 2^{−1/2} · √2 = 2`, and the reverse is `(1/2) · √2 · 2 = √2`.
- `p = ∞`, `j = 1`: `2 ≤ 2 · 1`, confirming the exponent-zero convention.

### 2.3 Geometric bounds and invariance of polynomials

With `F` as in §2.2, `Ω` and `Ω'` bounded (Ciarlet, Theorem 3.1.3, with radii in place of
diameters):

- if `0 < ρ'` and `Metric.ball y ρ' ⊆ Ω'` then `‖B‖ ≤ diam Ω / (2ρ')`;
- if `0 < ρ` and `Metric.ball z ρ ⊆ Ω` then `‖B⁻¹‖ ≤ diam Ω' / (2ρ)`;
- `volume Ω = |det B| · volume Ω'`, so `|det B| = volume Ω / volume Ω'` when `0 < volume Ω' < ∞`.

**Invariance:** `q ∘ F ∈ polynomialsDegLE n m` for `q ∈ polynomialsDegLE n m`.

*Needs:* §1.2, §2.2; Mathlib Lebesgue change of variables under linear maps.

**Checks.**

- `B = id`, `Ω = Ω' = (0,1)`, centre `1/2`, radius `1/2`: `1 ≤ 1`. Radius `0` would give `1 ≤ 1/0 =
  0`.
- `Ω = Ω' = ∅`: `0 = 1 · 0`, while the ratio form would read `1 = 0/0 = 0`.
- `q = x²`, `F = 2x + 1`, `m = 2`: `q ∘ F = 4x² + 4x + 1` has degree `2`.

### Examples

`F(x) = 2x + 1` on intervals, with the scaling of §2.2 and the polynomial of §2.3.

### Dependencies

Layer 1; Mathlib's composition formula for iterated derivatives and linear change of variables.

## Layer 3: the averaged Taylor polynomial

Throughout, `Ω` is bounded, nonempty and star-shaped with respect to `Metric.ball x₀ ρ`, and
`φ ∈ C_c^∞(Metric.ball x₀ ρ)` is a fixed cutoff with `∫ φ = 1` and `‖φ‖_∞ ≤ C(n) ρ^{−n}` (from a
Mathlib
`ContDiffBump` centred at `x₀`).

### 3.1 Star-shaped domains

The hypothesis implies `Metric.ball x₀ ρ ⊆ Ω` for nonempty `Ω`, and a convex `Ω` containing
`Metric.ball x₀ ρ` satisfies it (`Convex.starConvex`). Brenner–Scott (Definition 4.2.2, p. 96) ask
instead
that the closed convex hull of `{x} ∪ B` lie in `Ω` for every `x ∈ Ω`; the inline hypothesis implies
theirs
for every smaller radius, so their estimates hold with constants in `diam Ω / ρ`, and their
restriction to
balls of radius `> ρ_max / 2` (Lemma 4.3.8) is not needed.

*Needs:* Mathlib `StarConvex`, `Convex.starConvex`.

**Checks.**

- `Ω = ∅`: the hypothesis holds and the ball inclusion fails, so nonemptiness is load-bearing.
- `Ω = (−1,1)` with radius `1`: the closed hull of `{1/2}` and the ball is `[−1,1]`, not in `Ω`, and
  with
  radius `1/2` it is `[−1/2, 1/2]`, in `Ω`; so the smaller radius is required.
- `Ω = (−R, R)`, `ρ = R`: `γ = 2`, independent of `R`.

### 3.2 Taylor polynomials of smooth functions

For `u` of class `C^m` near `y`,
`T^m_y u (x) := ∑_{j ≤ m} (1/j!) iteratedFDeriv ℝ j u y (fun _ => x − y)`, an element of
`polynomialsDegLE n m` in `x`.

If moreover `u` is `C^{m+1}` on a neighbourhood of the segment from `y` to `x`, then
`u x − T^m_y u x = (1/m!) ∫₀¹ (1−t)^m iteratedFDeriv ℝ (m+1) u (y + t (x − y)) (fun _ => x − y) dt`,
from
`taylor_integral_remainder` applied to `t ↦ u (y + t (x − y))`.

*Needs:* §1.2; Mathlib `taylor_integral_remainder`.

**Checks.**

- `u = x²`, `y = 1`, `x = 3`, `m = 2`: `T = 1 + 2 · 2 + (2/2!) · 2² = 9 = u(3)`; without the
  factorial it
  is `13`.
- `u(t) = t²`, `y = 0`, `x = 1`, `m = 1`: remainder `1 = ∫₀¹ 2(1−t) dt`.
- `m = 0`, `y = 0`, `x = 1`, `u` equal to `0` below `1/2` and `1` above: smooth near `y`, remainder
  `1`,
  a.e. derivative integral `0`; so regularity along the whole segment is load-bearing.

### 3.3 The averaged Taylor polynomial on `L¹`

(Brenner–Scott, Definitions 4.1.1 and 4.1.3, Propositions 4.1.9 and 4.1.12, pp. 93–95.) Write
`B := Metric.ball x₀ ρ`. For `x, y : E` define

`Ψ_m(x, y) := ∑_{j ≤ m} ((−1)^j / j!) ∑_{I : Fin j → Fin n} ∂_{y, I 0} ⋯ ∂_{y, I (j−1)} [ (∏_{l} (x − y)_{I l}) φ(y) ]`,

smooth in `y` with support in `tsupport φ`, and of degree `≤ m` in `x`. The **averaged Taylor
polynomial**
of degree `≤ m` is the continuous linear map `Q^m : Lp ℝ 1 (volume.restrict B) →L[ℝ]
polynomialsDegLE n m`,
`Q^m f (x) := ∫_B f y · Ψ_m(x, y) dy`. Each coefficient is finite for `f ∈ L¹(B)` because `Ψ_m(x,
·)` is
bounded. For `u ∈ Lᵖ(Ω)`, `Q^m u` means `Q^m` of the restriction of `u` to `B`, in `L¹(B)` by Hölder
on a
finite measure.

Its API: linearity and continuity; `Q^m q = q` for `q ∈ polynomialsDegLE n m`.

*Needs:* §1.2, §3.1; Mathlib integrals of smooth compactly supported functions.

**Checks.** Let `μᵣ = ∫ yʳ φ` on `ℝ`, with `φ` even, so `μ₀ = 1`, `μ₁ = 0`, `μ₂ > 0`.

- `m = 1`: `Ψ₁(x, y) = (1 + n) φ y − ⟪x − y, ∇φ y⟫`, and `Q¹ 1 = 1`, `Q¹ x = x` by integrating by
  parts.
- `Q¹ x² = −μ₂`, which is not `x²`, so the degree is truly truncated; `Q² x² = x²`.
- `u` the indicator of half of `B`: in `L¹(B)`, not in `W^{1,1}(B)`, with every coefficient finite.

### 3.4 On Sobolev functions

For `u ∈ W^{m,p}(Ω)`, integrating by parts against the test functions of §3.3 (which is the
definition of
the weak derivatives, so no density is needed) gives the **derivative form**

`Q^m u (x) = ∫ (Wkp.value u) y φ y dy + ∑_{1 ≤ j ≤ m} (1/j!) ∫ (D^j u)(y)⟨x − y⟩^j φ y dy`,

and for smooth `u`, `Q^m u = ∫ T^m_y u · φ y dy`. So `Q^m` is continuous from `W^{m,p}(Ω)` to
`polynomialsDegLE n m`.

**The derivative identity** (Brenner–Scott, Proposition 4.1.17, p. 95, basis-free). For `j < m`,
`u ∈ W^{j+1,1}(B)` and `h : E`:
`(iteratedGradientChain (Q^m u) j x)⟨h⟩^{j+1} = Q^{m−j−1} [ (D^{j+1} u)⟨h⟩^{j+1} ] (x)`.
It requires only the regularity it differentiates.

*Needs:* §1.1, §1.3, §1.4, §1.5, §3.2, §3.3.

**Checks.** With `μᵣ` as in §3.3:

- `m = 0`: `Q⁰ 1 = 1` and `Q⁰ x = μ₁ = 0`.
- `m = 1`, `u = x²`: `Q¹ x² = 2xμ₁ − μ₂`, from the derivative form, equal to the value in §3.3.
- `m = 2`, `u = x²`, `h = 1`, `j = 0`: gradient `2x` equals `Q¹[2y]`; `j = 1`: Hessian `2` equals
  `Q⁰[2]`.

### 3.5 The Sobolev representation formula

(Brenner–Scott, Proposition 4.2.8, pp. 97–99.) For `n ≥ 1`, every `u ∈ W^{m+1,1}(Ω)` and a.e. `x ∈
Ω`,
and for every `x ∈ Ω` when `u` is smooth:
`u x − Q^m u x = ∫_Ω K x z (D^{m+1} u z) dz` with a kernel `K x z : IteratedGradient E m →L[ℝ] ℝ`
supported
in the convex hull of `{x}` and the ball, and `‖K x z‖ ≤ C(n, m, γ) · ‖x − z‖^{m+1−n}`. This covers
`W^{m+1,p}(Ω)` through §1.4. Prove it for smooth `u` from §3.2 and extend by Meyers–Serrin density
in
`W^{m+1,1}(Ω)` (`Wkp.dense_contDiffOn_representatives`). The kernel estimate integrates along the segments from points of the
ball to `x`, the same tool as `TauCeti/Analysis/Sobolev/Poincare/Potential.lean`. For `n = 0`, `Ω`
is a
point and both sides vanish.

*Needs:* §1.4, §3.1, §3.2, §3.4; Tau Ceti `Wkp.dense_contDiffOn_representatives`.

**Checks.**

- `n = 1`, `m = 0`, `u = x`, `x = 1/2`, even `φ`: `u x − Q⁰ u x = 1/2`, and the averaged segment
  integral
  `∫ φ y (1/2 − y) dy = 1/2`; a reversed difference would give `−1/2`.
- `u = x²`, `m = 2`: `u − Q² u = 0` and `D³ u = 0`.
- `n = 0`: both sides are `0`.

### Examples

The interval `(−1,1)` with an even cutoff, computing `Q⁰, Q¹, Q²` on `1, x, x²` by hand.

### Dependencies

Layers 1 and 2; Tau Ceti's Meyers–Serrin.

## Layer 4: Bramble–Hilbert and Deny–Lions

### 4.1 The Bramble–Hilbert lemma

(Brenner–Scott, Lemma 4.3.8, pp. 102–104; `exists_bramble_hilbert`.) For `Ω` as in Layer 3,
`u ∈ W^{m+1,p}(Ω)` (with `Q^m u` taken of `toOrderL _ u`) and every `j ≤ m`:
`|u − Q^m u|_{j,p} ≤ C(n, m, p, γ) · (diam Ω)^{m+1−j} · |u|_{m+1,p}`, while
`|u − Q^m u|_{m+1,p} = |u|_{m+1,p}`. Consequently `‖u − Q^m u‖_{m+1,p} ≤ C_BH · |u|_{m+1,p}` with
`C_BH := √2 · (1 + C(n, m, p, γ)² · ∑_{j ≤ m} (diam Ω)^{2(m+1−j)})^{1/2}` (§1.3), and the same bound
for
`inf_{q ∈ polynomialsDegLE n m} ‖u − q‖_{m+1,p}`.

The proof follows Brenner–Scott's, with no compactness, for every `1 ≤ p ≤ ∞`:

- `j = 0`: §3.5 and the `Lᵖ → Lᵖ` bound for the Riesz potential
  `g x = ∫_Ω ‖x − z‖^{m+1−n} |f z| dz`, `‖g‖_p ≤ C(n, m) (diam Ω)^{m+1} ‖f‖_p` (Brenner–Scott, Lemma
  4.3.6,
  pp. 101–102, by Hölder and Fubini, with `p = 1` and `p = ∞` separately);
- `0 < j ≤ m`: §3.4 turns each component of `D^j (u − Q^m u)` along an orthonormal basis into the `j
  = 0`
  remainder of degree `m − j` of the corresponding component of `D^j u`, in `W^{m+1−j,p}(Ω)` by
  §1.5; the
  operator norm and the basis components are comparable with constants in `n, j`.

Tracking `diam Ω` through the Riesz-potential bound gives the powers directly, so no rescaling to
diameter
one is needed.

*Needs:* §1.3, §1.4, §1.5, §3.4, §3.5; Mathlib Hölder and Fubini.

**Checks.**

- `Ω = (−1,1)`, `m = 0`, `p = ∞`, `u = x`, `j = 0`: error norm `1`, right side `2C`, requiring `C ≥
  1/2`.
- `m = 1`, `u = x²`, `j = 1`: error derivative norm `2 ≤ 4C`; top equality `2 = 2`.
- `u = x`, `m = 1`: the error vanishes in every order and the top seminorm is `0`; `Q = 0` fails at
  `j = 0`.
- Riesz bound with `n = 1`, `m = 0`, `f = 1`, `Ω = (0,1)`: kernel exponent `0`, `g = 1`, and
  `‖g‖_p = ‖f‖_p = diam Ω = 1` for `p = 1, 2, ∞`.

### 4.2 Functional forms

With `C_BH(m, p)` the constant of §4.1 for the same `Ω`:

- **Sublinear form.** Let `ℓ : W^{m+1,p}(Ω) → ℝ` be subadditive and absolutely homogeneous, with
  `ℓ u ≤ M ‖u‖_{m+1,p}` and `ℓ (u + q) = ℓ u` for every polynomial class `q` of degree `≤ m`. Then
  `ℓ u ≤ M · C_BH(m, p) · |u|_{m+1,p}`. A bounded linear functional `f` vanishing on the polynomials
  is the
  case `ℓ := |f ·|`. (Bramble–Hilbert, Theorem 2, pp. 114–115, states the linear case; the sublinear
  and
  bilinear forms are consequences.)
- **Bilinear form.** Let `b : W^{m+1,p}(Ω) →L[ℝ] W^{l+1,q}(Ω) →L[ℝ] ℝ` with `b r v = 0` for
  polynomial
  classes `r` of degree `≤ m` and `b u s = 0` for polynomial classes `s` of degree `≤ l`. Then
  `|b u v| ≤ ‖b‖ · C_BH(m, p) · C_BH(l, q) · |u|_{m+1,p} · |v|_{l+1,q}`, from
  `b u v = b (u − Q^m u) (v − Q^l v)`.

*Needs:* §1.6, §4.1.

**Checks.**

- `Ω = (0,1)`, `ℓ u = |∫ u′|`, `u = x`, `q = 3`: `ℓ u = 1 = ℓ (u + 3)`, and the top `L²` seminorm is
  `1`.
- `b u v = (∫ u′)(∫ v′)`, `u = x`, `v = 2x`: `b = 2`, seminorm product `2`, and either constant
  gives `0`.
- `ℓ = 0` satisfies all hypotheses, with both sides `0`.

### 4.3 Rellich–Kondrachov in `W^{k,p}`

For bounded Lipschitz `Ω` (as in the supplier contracts) and `1 ≤ p < ∞`, the map
`Wkp.lowerOrderL k : W^{k+1,p}(Ω) → W^{k,p}(Ω)` is compact, from
`W1p.isCompactOperator_valueL_of_isLipschitzDomainWith`, transported along the isometry by §2.1, applied
to the components of §1.5.

*Needs:* §1.5, §2.1; Tau Ceti `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith`.

**Checks.**

- `Ω = (0,π)`, `p = 2`, `k = 0`, `u_N = sin(Nx)/N`: bounded in `W^{1,2}`, with `‖u_N‖²₀ = π/(2N²) →
  0`.
- The same `u_N` have `‖u_N′‖² = π/2`, so the identity of `W^{1,2}` is not compact.
- `k = 0` is `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith`.

### 4.4 The Deny–Lions lemma

For bounded connected Lipschitz `Ω` and `1 ≤ p < ∞`: the quotient norm of §1.8 is equivalent to the
descended seminorm `|·|_{m+1,p}`, with a non-explicit constant. Proof by Peetre's compact-error estimate
`ContinuousLinearMap.exists_pos_mul_norm_le_of_compact_estimate` with §4.3, generalizing
`W1p.exists_eLpNorm_value_sub_setAverage_le_of_isCompactOperator`; §1.7 identifies the kernel.

(Bramble–Hilbert, Theorem 1, p. 114, on strong-cone domains with a diameter-weighted norm;
Deny–Lions,
Chapter III §2, Definition 2.1 and Theorem 2.1, p. 366, for the abstract quotient. The formulation
on
Lipschitz domains is this roadmap's.)

*Needs:* §1.7, §1.8, §4.3; Tau Ceti `ContinuousLinearMap.exists_pos_mul_norm_le_of_compact_estimate`.

**Checks.**

- `Ω = (0,1)`, `m = 0`, `p = 2`: `u = x` has quotient norm `√(13/12)` and top seminorm `1`.
- Constants have both equal to `0`.
- Two unit intervals with `u = 0` then `1`: distance to global constants `1/√2`, gradient seminorm
  `0`, so
  connectedness is load-bearing.

### Examples

A test file instantiates §4.1 on the interior of a simplex
(`interior (convexHull ℝ (Set.range v))` for an affinely independent `v : Fin (n + 1) → E`) and on
an open
cube, using §3.1, and reads off the constant's dependence on `n, m, p` and `γ` only.

### Dependencies

Layers 1 to 3; Tau Ceti's Lipschitz domains and Rellich.

## Layer 5: higher-order embedding and point evaluation

Throughout, `Ω` is as in Layer 3.

### 5.1 `W^{k,p} ⊆ C⁰`

(Brenner–Scott, Lemmas 4.3.1 and 4.3.4, pp. 100–101; `exists_continuous_representative`.) For `k p >
n`, or
`p = 1` and `k ≥ n`, every `u ∈ W^{k,p}(Ω)` has a continuous representative bounded on `Ω`, with
`sup_Ω |u| ≤ C(n, k, p, γ) ∑_{j ≤ k} (diam Ω)^{j − n/p} |u|_{j,p}`. Derive it as Brenner–Scott do,
not from
the whole-space Morrey theorem, so the constant is explicit in the same parameters. For `n = k = 0`,
`Ω` is
a point and there is nothing to prove; below, `k ≥ 1`.

- `u − Q^{k−1} u`: §3.5 and the pointwise Riesz-potential bound
  `∫_Ω ‖x − z‖^{k−n} |f z| dz ≤ C(n, k, p) (diam Ω)^{k−n/p} ‖f‖_p`, by Hölder.
- `Q^{k−1} u`: directly from its derivative form, `|x − y| ≤ diam Ω` and `‖φ‖_∞ ≤ C(n) ρ^{−n}` give
  `sup_Ω |Q^{k−1} u| ≤ C(n, k) γ^{n/p} ∑_{j < k} (diam Ω)^{j−n/p} |u|_{j,p}`.
- **Continuity.** For `p < ∞`, the smooth approximants of `Wkp.dense_contDiffOn_representatives` converge uniformly by the
  same
  bound. For `p = ∞`, smooth functions are not dense in the `W^{k,∞}` norm, so fix a finite `r ≥ 1`
  with
  `r > n/k` and apply the finite-exponent case to the image of `u` under §1.4.

Point evaluation `u ↦ u x` is then a bounded linear functional on `W^{k,p}(Ω)`.

*Needs:* §1.3, §1.4, §3.4, §3.5; Tau Ceti `Wkp.dense_contDiffOn_representatives`.

**Checks.**

- `Ω = (−1,1)`, `k = n = p = 1`, `u = x`: `sup = 1`, and the sum is `2^{−1} · 1 + 2⁰ · 2 = 5/2`.
- `u = |x|` on `(−1,1)`, `k = 1`, `p = ∞`: for every smooth `v`, `ess sup |v′ − sign x| ≥ 1`, while
  `√(x² + ε²)` converges uniformly with error `≤ ε` and in `W^{1,r}` for finite `r`.
- `u = x` on `(0,1)`, `p = 2`, `k = 1`: evaluation at `1/2` is `1/2`, against `‖u‖ = 2/√3`.

### 5.2 Density of functions smooth up to the boundary

(`dense_contDiff_restrict`; compare Brenner–Scott, Exercise 4.x.20, p. 127.) For `p < ∞`, the
restrictions
to `Ω` of functions in `C_c^∞(E)` are dense in `W^{k,p}(Ω)`. Proof: for `t > 1` the dilate
`x₀ + t • (Ω − x₀)` contains `closure Ω`, so `x ↦ u (x₀ + t⁻¹ • (x − x₀))` is in `W^{k,p}` of a
neighbourhood
of `closure Ω`, converges to `u` as `t → 1`, and is then mollified and cut off.

*Needs:* §2.2, §3.1; Tau Ceti `Wkp.tendsto_mollified_iteratedGradient`.

**Checks.**

- `Ω = (−1,1)`, `x₀ = 0`, `t = 2`, `u = x`: `closure Ω ⊂ (−2,2)`, the pullback is `x/2`, with
  `W^{1,2}`
  difference `√(2/3)`.
- As `t ↓ 1` that difference is `|1 − 1/t| √(8/3) → 0`.
- `p = ∞` is excluded: `|x|` of §5.1 is not a limit.

### 5.3 Continuity up to the boundary

For `p < ∞`, `j ≤ k` with `(k − j) p > n` (or `p = 1` and `k − j ≥ n`), and `v : E`, the component
`x ↦ (D^j u)(x)⟨v⟩^j` (for `j = 0`, `u` itself) has a continuous representative that is uniformly
continuous
on `Ω`, hence extends continuously to `closure Ω`. The component lies in `W^{k−j,p}(Ω)` by §1.5.
Apply §5.1
to its differences with the approximants of §5.2: they converge uniformly on `Ω`, and a uniform
limit of
uniformly continuous functions is uniformly continuous.

*Needs:* §1.5, §5.1, §5.2.

**Checks.**

- `u = x²`, `k = 2`, `p = 2`, `n = 1`, `j = 0`: boundary value `1` at `x = 1`.
- `j = 1`, `v = 3`: the component is `6x`, boundary value `6`.
- `j = k`, `n ≥ 1`: excluded by the hypothesis, as the top derivative is only in `Lᵖ`.

### Examples

`u = x²` on `(0,1)`, with its continuous representative, boundary values and point evaluation.

### Dependencies

Layers 1 to 4; Tau Ceti's Meyers–Serrin.

## Downstream consumers

No roadmap on the main branch consumes this one. The natural consumer is a roadmap on interpolation
and
approximation by finite elements, whose error estimates are Bramble–Hilbert (§4.1) composed with
affine
scaling (§2.2) and whose element-wise point evaluations are §5.1.

## References

- S. C. Brenner, L. R. Scott, *The Mathematical Theory of Finite Element Methods*, 3rd ed.,
  Springer, 2008,
  Chapter 4; locators as given in Layers 3 to 5.
- P. G. Ciarlet, *The Finite Element Method for Elliptic Problems*, SIAM, 2002, §3.1, Theorem 3.1.3.
- J. H. Bramble, S. R. Hilbert, *Estimation of linear functionals on Sobolev spaces with application
  to
  Fourier transforms and spline interpolation*, SIAM J. Numer. Anal. 7 (1970), 112–124; Theorems 1
  and 2.
- T. Dupont, R. Scott, *Polynomial approximation of functions in Sobolev spaces*, Math. Comp. 34
  (1980):
  the same averaged-polynomial construction, cited as a work.
- J. Deny, J.-L. Lions, *Les espaces du type de Beppo Levi*, Ann. Inst. Fourier 5 (1954); Chapter
  III §2.
- L. C. Evans, *Partial Differential Equations*, 2nd ed., AMS, 2010, Chapter 5: background on weak
  derivatives, cited as a work.
