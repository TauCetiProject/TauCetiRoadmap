# Roadmap: Sobolev spaces of differential forms and the L² de Rham complex

**Summary.** Build the Sobolev theory of differential forms on a Euclidean domain: the weak exterior
derivative, the Banach spaces `WᵖΛᵏ(Ω)` for `1 ≤ p ≤ ∞` and their Hilbert case `HΛᵏ(Ω) := W²Λᵏ(Ω)`,
the
**L² de Rham complex** as a Hilbert complex with its Hodge decomposition, pullback under
diffeomorphisms
and bi-Lipschitz maps, traces, Green's formula and gluing across interfaces, and **compactness and
closed
range** of the complex on bounded Lipschitz domains (Picard). Someone working with mixed
formulations,
Maxwell's equations or Hodge Laplacians on a domain finds these spaces with the API they expect,
connected
to the scalar Sobolev spaces in degree `0` and to the divergence in degree `n − 1`.

## Scope and ownership

This roadmap owns, for real-valued forms on open subsets of `EuclideanSpace ℝ (Fin n)`:

- Layer 1: the type `Covector n k` carrying the Gram inner product, `LᵖΛᵏ(Ω)`, the agreement of the
  star's
  volume form with the standard normalization, the codifferential, and `d` on test forms;
- Layers 2 and 3: the weak exterior derivative, `WᵖΛᵏ(Ω)`, `WᵖΛᵏ₀(Ω)`, `H*Λᵏ(Ω)`, the adjoints of
  `d`, density,
  the degree-zero and top-degree identifications, and the weak divergence link;
- Layer 4: pullback under `C¹` diffeomorphisms and bi-Lipschitz maps;
- Layer 5: tangential traces, Green's formula, the zero-trace characterization and gluing;
- Layer 6: abstract Hilbert complexes and the L² de Rham complex;
- Layer 7: the Gaffney identity on the cube, Lipschitz charts as bi-Lipschitz cubes, Picard's
  compactness and
  its consequences.

It leaves to named owners:

- the Gram inner product on alternating maps, their identification with exterior powers and the
  pointwise
  Hodge star to ComplexKahlerGeometry K5a;
- scalar Sobolev spaces, Lipschitz domains, the scalar trace and Rellich to PDE Lane A;
- Gauss–Green, BV traces and BV gluing to GeometricMeasureTheory G6;
- smooth forms and `extDeriv` to Mathlib, and forms on manifolds to DifferentialGeometry.

It does not contain the L² theory on Riemannian manifolds; the identification of the harmonic spaces
on a
Lipschitz domain with de Rham cohomology; boundary conditions on a part of the boundary; regularized
Poincaré
and Bogovskiĭ operators and explicit Poincaré constants; vector-field proxies (`H(curl)`, `H(div)`)
and Piola
transforms; the `Lᵖ` Hodge decomposition and closed range for `p ≠ 2`; fractional trace spaces; or
approximation
of forms by piecewise polynomial forms.

## Conventions

- **Setting.** `n : ℕ`, `E := EuclideanSpace ℝ (Fin n)`, Lebesgue measure; `Ω :
  TopologicalSpace.Opens E`,
  bounded where stated. A `k`-form is a function `E → Covector n k`, with conditions on `Ω`.
- **Exponents.** `p : ℝ≥0∞` with `[Fact (1 ≤ p)]`, as for `TauCeti.W1p`; every statement covers `p =
  ∞` unless
  it says `p < ∞`. In exponents `1/p` is `0` at `p = ∞`.
- **Orientation and volume.** `vol` sends the wedge of the standard basis to `1`. This is
  `Orientation.volumeForm` of the standard orientation, by `Orientation.volumeForm_robust`, exactly
  and not up
  to a factor.
- **Codifferential.** On `k`-forms, `δ := (−1)^{n(k+1)+1} ⋆ d ⋆`, equivalent to `⋆δω = (−1)^k d⋆ω`
  (Arnold–Falk–Winther 2006, (2.7)).
- **Lean names.** The names below live in `TauCetiRoadmap.SobolevDifferentialForms` in
  `Suggested.lean`.

## Exact supplier contracts

### From Mathlib

All at the pinned Mathlib; file paths under `Mathlib/`.

- `extDeriv`, `extDeriv_extDeriv` (`Analysis/Calculus/DifferentialForm/Basic.lean`);
  `ContinuousAlternatingMap.alternatizeUncurryFin`
  (`Analysis/Normed/Module/Alternating/Uncurry/Fin.lean`).
- `exteriorPower.alternatingMapLinearEquiv` (`LinearAlgebra/ExteriorPower/Basic.lean`);
  `LinearMap.BilinForm.exteriorPower`, `LinearMap.BilinForm.bijective_exteriorPower`
  (`LinearAlgebra/ExteriorPower/BilinForm.lean`); the inner product on `⋀[ℝ]^k E`,
  `exteriorPower.inner_ιMulti_ιMulti`, `OrthonormalBasis.exteriorPower`
  (`Analysis/InnerProductSpace/ExteriorPower.lean`).
- `Orientation.volumeForm_robust` (`Analysis/InnerProductSpace/Orientation.lean`).
- `LinearPMap`, `LinearPMap.IsClosed` (`Topology/Algebra/Module/LinearPMap.lean`),
  `LinearPMap.adjoint`,
  `LinearPMap.IsFormalAdjoint` (`Analysis/InnerProductSpace/LinearPMap.lean`).
- `Lp`, `WithLp`, Rademacher's theorem, mollification and the Lebesgue change of variables.

### From Tau Ceti

All at the pinned Tau Ceti; file paths under `TauCeti/Analysis/`.

- `TauCeti.HasWeakFDerivOn`, `TauCeti.HasWeakLineDerivOn` (`Sobolev/WeakDeriv/Basic.lean`).
- `TauCeti.W1p`, with jets `WithLp 2 (ℝ × E)` (`Sobolev/W1p/Basic.lean`); `TauCeti.W1p0`
  (`Sobolev/W1p/Zero.lean`); `TauCeti.Wkp`.
- `W1p0.isCompactOperator_valueL` (`Sobolev/RellichKondrachov.lean`);
  `W1p.dense_contDiffOn_representatives` (`Sobolev/W1p/MeyersSerrin.lean`).
- Test functions `𝓓(Ω, F)`.

### From TauCetiRoadmap.ComplexKahlerGeometry

K5a, specialised to `V = E` with the standard orientation: the Gram inner product on `E [⋀^Fin
k]→L[ℝ] ℝ` and its
identification with `⋀[ℝ]^k E`; the pointwise Hodge star, characterized by `α ∧ ⋆β = ⟪α, β⟫ vol`,
with
`⋆⋆ = (−1)^{k(n−k)}` on degree `k`, isometry and oriented-isometry naturality.

### From TauCetiRoadmap.PDE

Lane A.6: the Lipschitz-domain predicate for open Euclidean sets (at each frontier point, after an
affine
isometry, the domain in an open product cylinder is the region above a Lipschitz graph over a
hyperplane); on
bounded Lipschitz domains the `W^{1,p}` trace, extension, and Rellich; the normalized Hausdorff
measure
`μHE[n−1]` on the frontier.

### From TauCetiRoadmap.GeometricMeasureTheory

G6: Gauss–Green with the outward normal, BV traces, integration by parts with the trace term on
Lipschitz domains,
and gluing across a Lipschitz interface.

## How to read the build

Layer 1 fixes the pointwise geometry and `d` on test forms. Layer 2 defines the weak exterior
derivative by
duality. Layer 3 builds the spaces, their boundary-value versions and the adjoints of `d`. Layer 4
proves pullback.
Layer 5 relates the spaces to the boundary through G6. Layer 6 proves the abstract Hilbert-complex
theorems,
independent of forms, and applies them. Layer 7 reduces a Lipschitz domain to the cube by
bi-Lipschitz pullback,
absorbs the resulting weight by Layer 6's weight independence, and proves the model case by the
Gaffney identity and
Rellich. Each layer uses only earlier layers and the suppliers above.

## Layer 1: pointwise geometry and test forms

### 1.1 Covectors

Mathlib's norm on `E [⋀^Fin k]→L[ℝ] ℝ` is the operator norm, which is not a Hilbert norm, so the
Hilbert structure
lives on a type wrapper: `Covector n k` is a one-field structure around `E [⋀^Fin k]→L[ℝ] ℝ` in the
shape of
Mathlib's `WithLp`, with `toCovector` and `ofCovector`.

The musical map `Covector.toExteriorPower : Covector n k →ₗ[ℝ] ⋀[ℝ]^k E` sends a covector to a
linear functional on
`⋀[ℝ]^k E` by `exteriorPower.alternatingMapLinearEquiv`, and that functional to an element of
`⋀[ℝ]^k E` by the
bijection `LinearMap.BilinForm.exteriorPower (innerₗ E) k`. It is injective
(`injective_toExteriorPower`), and `Covector n k` carries the induced
`NormedAddCommGroup`, `InnerProductSpace ℝ` and `FiniteDimensional ℝ` instances. This is K5a's Gram
inner product.

`LᵖΛᵏ(Ω) := Lp (Covector n k) p (volume.restrict Ω)`, a Banach space, and a Hilbert space for `p =
2`.

Its API: the musical map is a surjective isometry; the bilinear form above is Mathlib's inner
product on `⋀[ℝ]^k E`;
for the standard orthonormal basis `⟪α, β⟫ = ∑_I α(e_I) β(e_I)`, with `I` over `Set.powersetCard
(Fin n) k`; every
linear isometry of `E` acts isometrically; a two-sided comparison with the operator norm, with
constants in `n, k`.

*Needs:* Mathlib `exteriorPower.alternatingMapLinearEquiv`,
`LinearMap.BilinForm.bijective_exteriorPower`; K5a.

**Checks.**

- `n = 4`, `k = 2`, `α = e¹∧e² + e³∧e⁴`: Gram norm `√2`, operator norm `1`, so the two norms differ
  for `k ≥ 2`.
- `k = 1`: `⟪α, β⟫ = ∑ᵢ α(eᵢ) β(eᵢ)` is the Euclidean dual pairing, and the two norms coincide.
- `k = 0`: one term, `α() β()`. `k > n`: the sum is empty and `Covector n k` is zero.

### 1.2 The Hodge star and the codifferential

The star `⋆ : Covector n k ≃ₗᵢ[ℝ] Covector n l` for `k + l = n` is K5a's pointwise star for the
standard orientation,
transported along §1.1. Mathlib's `exteriorPower.hodgeStar` with `vol` of the Conventions gives the
same map, through
the musical map; prove this agreement. On forms it acts pointwise. On a smooth `k`-form, `δ` is the
codifferential of
the Conventions.

*Needs:* §1.1; K5a; Mathlib `exteriorPower.hodgeStar`, `Orientation.volumeForm_robust`.

**Checks.**

- `n = 2`, `k = 1`: `⋆e₁ = e₂`, `⋆e₂ = −e₁`, so `⋆⋆ = −1 = (−1)^{1·1}`.
- `n = 2`, `k = 1`: `δ(f dx₁ + g dx₂) = −(∂₁f + ∂₂g)`.
- The standard basis has `⟪vol⁻¹ 1, vol⁻¹ 1⟫ = det Gram = 1`, so `vol` has unit Gram determinant.

### 1.3 `d` on test forms

Define `d : 𝓓(Ω, Covector n k) → 𝓓(Ω, Covector n (k+1))`, the pointwise `extDeriv` with its support
and smoothness
proofs, and the test-form codifferential `δ` in the same way.

Its API: linearity and continuity; `d ∘ d = 0`, from `extDeriv_extDeriv`; the adjointness
`∫ ⟪dφ, ψ⟫ = ∫ ⟪φ, δψ⟫` on test forms (Arnold–Falk–Winther 2006, (2.8)).

*Needs:* §1.1, §1.2; Mathlib `extDeriv`, `extDeriv_extDeriv`; Tau Ceti test functions.

**Checks.**

- `k = 0`, `φ` a bump on `ℝ`: `dφ = φ′ dx`, `δ(ψ dx) = −ψ′`, and adjointness is integration by
  parts.
- `k = n`: `d = 0`, since the target `Covector n (n+1)` is zero.
- `n = 2`, `k = 0`: `ddφ = (∂₁∂₂φ − ∂₂∂₁φ) dx₁∧dx₂ = 0`.

### Examples

`ℝ²` with `α = dx₁`, `⋆α = dx₂`, and `d` on test functions and test `1`-forms.

### Dependencies

Mathlib's exterior powers and `extDeriv`; ComplexKahlerGeometry K5a.

## Layer 2: the weak exterior derivative

### 2.1 Definition

`HasWeakExtDerivOn Ω u w`, for `u, w` locally integrable on `Ω`: for every `ψ ∈ 𝓓(Ω, ℝ)` and `v :
Fin (k+1) → E`,
`∫ ψ x · w x v = − ∑ j, (−1)^j ∫ u x (Fin.removeNth j v) · fderiv ℝ ψ x (v j)`.

Its API: uniqueness a.e.; linearity; agreement with Mathlib's `extDeriv` for `C¹` forms; if
`TauCeti.HasWeakFDerivOn volume Ω u U` then `HasWeakExtDerivOn Ω u w` with `w` the alternatization
of `U` by
`ContinuousAlternatingMap.alternatizeUncurryFin`, the two being equivalent for `k = 0`; the
equivalent duality
formulation against the test forms of §1.3 through `δ`; locality (restriction to open subsets and
gluing over an open
cover).

The converse to the alternatization fails for `1 ≤ k ≤ n − 1`, with `n ≥ 2`: `sign x₁ dx₁ ∧ dx₂ ∧ ⋯
∧ dx_k` has weak
exterior derivative `0` and no weak derivative.

*Needs:* §1.1, §1.3; Tau Ceti `HasWeakFDerivOn`; Mathlib
`ContinuousAlternatingMap.alternatizeUncurryFin`.

**Checks.**

- `k = 0`, `v = (v₀)`: the identity is `∫ ψ w(v₀) = −∫ u ∂_{v₀}ψ`, the weak directional derivative.
- `k = 1`, smooth `u`, `v = (v₀, v₁)`: the right side is `∫ ψ [∂_{v₀} u(v₁) − ∂_{v₁} u(v₀)]`,
  Mathlib's `extDeriv`.
- `u = sign x₁ dx₁`, `n ≥ 2`: `du = ∂₁ sign(x₁) dx₁∧dx₁ = 0`, while `∂₁ sign x₁ = 2δ(x₁) ∉ L¹_loc`.

### 2.2 `d ∘ d = 0`

`HasWeakExtDerivOn.ae_eq_zero`: if `HasWeakExtDerivOn Ω u w` and `HasWeakExtDerivOn Ω w z` then `z =
0` a.e. Every weak
exterior derivative is therefore weakly closed.

*Needs:* §2.1.

**Checks.**

- `k = 0`, `u ∈ W^{1,1}_loc`: `∫ z(v₀, v₁) ψ = ∫ u (∂_{v₀}∂_{v₁} − ∂_{v₁}∂_{v₀}) ψ = 0`.
- `u` smooth: this is `extDeriv_extDeriv`.
- `k + 2 > n`: the target is zero and the conclusion is vacuous.

### 2.3 Leibniz rule with smooth factors

`d(φ ∧ u) = dφ ∧ u + (−1)^j φ ∧ du` for a smooth bounded `j`-form `φ` with bounded derivative, with
the wedge product
of covectors as the alternatization of the tensor product.

*Needs:* §2.1; Mathlib `ContinuousAlternatingMap`.

**Checks.**

- `j = 0`: `d(φ u) = dφ ∧ u + φ du`.
- `φ = 1`: both sides are `du`.
- `n = 1`, `j = 0`, `u = x`, `φ = x`: `d(x²) = 2x dx`.

### Examples

`u = |x|` on `(−1,1)`, `du = sign x dx`, with `d(sign x dx) = 0` in top degree.

### Dependencies

Layer 1; Tau Ceti weak derivatives.

## Layer 3: the spaces `WᵖΛᵏ(Ω)`

### 3.1 Definition

`WᵖΛᵏ(Ω) := {u ∈ LᵖΛᵏ(Ω) | ∃ w ∈ LᵖΛᵏ⁺¹(Ω), HasWeakExtDerivOn Ω u w}` as the closed subspace of `Lᵖ`
jets valued in
`WithLp 2 (Covector n k × Covector n (k+1))`, with the graph norm, as `TauCeti.W1p`. It is a Banach
space; `d` is bounded
into `LᵖΛᵏ⁺¹(Ω)` with range in the kernel of `d` on `WᵖΛᵏ⁺¹(Ω)`. `HΛᵏ(Ω) := W²Λᵏ(Ω)` is a Hilbert
space with
`⟪u, v⟫ + ⟪du, dv⟫`.

*Needs:* §2.1, §2.2; Tau Ceti `W1p` as the pattern.

**Checks.**

- `Ω = (0,1)`, `k = 0`, `p = 2`, `u = x`: `‖u‖² = 1/3 + 1`.
- `u = 1_{(1/2,1)}`, `k = 0`: not in `W²Λ⁰`.
- `u = sign(x₁ − 1/2) dx₁` on the unit square, `k = 1`: in `HΛ¹` with `du = 0`.

### 3.2 Zero boundary values

For `p < ∞`, `WᵖΛᵏ₀(Ω)` is the closure of test forms and `HΛᵏ₀(Ω) := W²Λᵏ₀(Ω)`; `d` maps `WᵖΛᵏ₀`
into `WᵖΛᵏ⁺¹₀`; extension
by zero is an isometry `WᵖΛᵏ₀(Ω) → WᵖΛᵏ(E)` commuting with `d`.

*Needs:* §1.3, §3.1.

**Checks.**

- `Ω = (0,1)`, `k = 0`: `x(1−x)` belongs and `1` does not.
- `Ω = (0,1)`, `k = 1 = n`: `HΛ¹₀ = L²Λ¹`, since test forms are dense in `L²`.
- `Ω = E`: `WᵖΛᵏ₀ = WᵖΛᵏ` by cutoff and mollification.

### 3.3 Density

For `p < ∞`, `C^∞(Ω) ∩ WᵖΛᵏ(Ω)` is dense in `WᵖΛᵏ(Ω)` for every open `Ω`, by the Meyers–Serrin
argument with mollification
commuting with `d` on interior subdomains.

*Needs:* §2.3, §3.1; Tau Ceti `W1p.dense_contDiffOn_representatives` as the pattern.

**Checks.**

- `k = 0`: this is Meyers–Serrin.
- `u = sign(x₁) dx₁` on the unit ball: mollifiers in `x₁` converge in `HΛ¹` although `u` has no weak
  derivative.
- `p = ∞`, `k = 0`, `u = |x|`: no smooth approximation in norm, so `p < ∞` is load-bearing.

### 3.4 `d` as an unbounded operator and its adjoints

`d` is a closed operator `LᵖΛᵏ(Ω) → LᵖΛᵏ⁺¹(Ω)` with domain `WᵖΛᵏ(Ω)` (`LinearPMap`,
`LinearPMap.IsClosed`), densely defined
for `p < ∞`. Define `H*Λᵏ(Ω) := {u ∈ L²Λᵏ(Ω) | ⋆u ∈ HΛⁿ⁻ᵏ(Ω)}` and `H*Λᵏ₀(Ω) := {u ∈ L²Λᵏ(Ω) | ⋆u ∈
HΛⁿ⁻ᵏ₀(Ω)}`, with the weak
`δ`. The adjoint of `d` with domain `HΛᵏ⁻¹₀(Ω)` is `δ` on `H*Λᵏ(Ω)`, and the adjoint of `d` with
domain `HΛᵏ⁻¹(Ω)` is `δ` on
`H*Λᵏ₀(Ω)` (Arnold–Falk–Winther 2006, (2.10)–(2.11); 2010, Theorem 4.1).

*Needs:* §1.2, §1.3, §3.2, §3.3; Mathlib `LinearPMap.adjoint`.

**Checks.**

- `Ω = (0,1)`, `k = 1`: `d` on `H¹₀` has adjoint `−d/dx` on `H¹`.
- `Ω = (0,1)`, `k = 1`: `d` on `H¹` has adjoint `−d/dx` on `H¹₀`.
- `Ω = E`: the two adjoints coincide.

### 3.5 Degree zero and top degree

`WᵖΛ⁰(Ω) = W^{1,p}(Ω)` with equal norms (with `TauCeti.W1p volume Ω p`), `WᵖΛ⁰₀(Ω) = W^{1,p}_0(Ω)`
for `p < ∞`
(with `TauCeti.W1p0`), and `WᵖΛⁿ(Ω) = LᵖΛⁿ(Ω)` (`hasWeakExtDerivOn_top`).

*Needs:* §1.1, §2.1, §3.1, §3.2; Tau Ceti `W1p`, `W1p0`.

**Checks.**

- `Covector n 0 ≅ ℝ` and `Covector n 1 ≅ E` isometrically, with jets `WithLp 2` on both sides, so
  the norms are equal.
- `k = n`, `u ∈ L¹_loc`: `∑_j (−1)^j u_x(removeNth j v) ℓ(v_j) = (ℓ ∧ u_x)(v) = 0`, an `(n+1)`-form
  on `ℝⁿ`.
- `Ω = (0,1)`: `WᵖΛ¹ = Lᵖ`, while `sign(x − 1/2)` is not in `WᵖΛ⁰`.

### 3.6 Divergence in degree `n − 1`

The **weak divergence** of a field `g` with weak derivative `G` (`TauCeti.HasWeakFDerivOn volume Ω g
G`) is `x ↦ tr (G x)`.
Then the `(n−1)`-form `⋆` of the `1`-form `x ↦ ⟪g x, ·⟫` has weak exterior derivative `tr G · vol`.
The weak `d` in degree
`n − 1` itself needs no weak derivative of `g`.

*Needs:* §1.2, §2.1; Tau Ceti `HasWeakFDerivOn`.

**Checks.**

- `n = 2`: `⋆g♭ = g₁ dx₂ − g₂ dx₁`, and `d⋆g♭ = (∂₁g₁ + ∂₂g₂) dx₁∧dx₂`.
- `n = 1`: `d(g) = g′ dx`.
- `g = id` on `ℝⁿ`: `tr G = n`.

### Examples

`Ω = (0,1)`, with `WᵖΛ⁰ = W^{1,p}`, `WᵖΛ¹ = Lᵖ`, and `d` the derivative.

### Dependencies

Layers 1 and 2; Tau Ceti `W1p`, `W1p0`.

## Layer 4: pullback and change of variables

### 4.1 Pullback

For a `C¹` diffeomorphism `Φ : Ω' → Ω` with `‖DΦ‖, ‖DΦ⁻¹‖ ≤ L`, the pullback `Φ^* u` maps `WᵖΛᵏ(Ω)`
to `WᵖΛᵏ(Ω')`, commutes with
the weak `d`, and has explicit norm bounds in `n, k, p, L`. For affine `F x = B x + b` with `B`
invertible:
`‖F^* u‖_{LᵖΛᵏ(F⁻¹ Ω)} ≤ ‖B‖^k |det B|^{−1/p} ‖u‖_{LᵖΛᵏ(Ω)}`.

The same holds for a bi-Lipschitz homeomorphism `Φ : Ω' → Ω` with Lipschitz constants `≤ L` for `Φ`
and `Φ⁻¹`, with `DΦ` defined
a.e. by Rademacher's theorem: `Φ^*` maps `WᵖΛᵏ(Ω)` to `WᵖΛᵏ(Ω')` and, for `p < ∞`, `WᵖΛᵏ₀(Ω)` to
`WᵖΛᵏ₀(Ω')`, commutes with the
weak `d`, and has norm bounds in `n, k, p, L` (Picard, Chapter 3, pp. 161–162).

*Needs:* §3.1, §3.2, §3.3; Mathlib Rademacher's theorem and change of variables.

**Checks.**

- `B = 2·Id`, any `u`: `(F^* u)(x) = 2^k u(2x + b)`, and `‖F^* u‖_p = 2^k 2^{−n/p} ‖u‖_p`, an
  equality.
- `Φ = id`: the identity.
- `k = 0`, `Φ(x) = 2x`, `u = x`: `F^* u = 2x`, with `d(F^* u) = F^*(du) = 2 dx`.

### Examples

Affine maps of the cube `Q = (0,1)ⁿ`, and the map `(s, t) ↦ (s, t − |s|)` onto a half-space.

### Dependencies

Layer 3; Mathlib's Rademacher theorem.

## Layer 5: traces, Green's formula and gluing

### 5.1 Tangential trace of continuous forms

For a bounded Lipschitz domain `Ω` and a form `u` continuous on `closure Ω`, the tangential trace
`tr u` on `frontier Ω` is the
restriction of `u x` to the approximate tangent space, defined `μHE[n−1]`-a.e. through the outward
normal of G6.

*Needs:* §1.1; PDE Lane A.6; GeometricMeasureTheory G6.

**Checks.**

- `Ω = (0,1)²`, `u = dx₂`: on `{0} × (0,1)`, `tr u = dx₂`; on `(0,1) × {0}`, `tr u = 0`.
- `k = 0`: the trace is the restriction.
- `k = n`: the trace vanishes, as the tangent space has dimension `n − 1`.

### 5.2 Green's formula

For `u` a `k`-form and `φ` an `(n−k−1)`-form, both Lipschitz on `closure Ω` of a bounded Lipschitz
domain:
`∫_Ω du ∧ φ + (−1)^k ∫_Ω u ∧ dφ = ∫_{∂Ω} tr u ∧ tr φ` (the boundary integral against `μHE[n−1]` and
the outward normal), from
G6's integration by parts applied to the components (Arnold–Falk–Winther 2006, §2).

*Needs:* §2.3, §3.1, §5.1; GeometricMeasureTheory G6.

**Checks.**

- `n = 1`, `k = 0`, `Ω = (0,1)`, `u = x`, `φ = 1`: `1 + 0 = [x]₀¹ = 1`.
- `n = 2`, `k = 0`, `φ = g♭` rotated: the divergence theorem.
- Compactly supported `u` in `Ω`: the boundary term vanishes, recovering §1.3's adjointness.

### 5.3 Weak characterization of zero trace

For bounded Lipschitz `Ω` and `p < ∞`: `u ∈ WᵖΛᵏ₀(Ω)` if and only if `u ∈ WᵖΛᵏ(Ω)` and
`∫_Ω du ∧ φ + (−1)^k ∫_Ω u ∧ dφ = 0` for every smooth `φ` on `E`, smooth up to the boundary and not
compactly supported in `Ω`.

*Needs:* §3.2, §3.3, §5.2; PDE Lane A.6.

**Checks.**

- `Ω = (0,1)`, `k = 0`, `u = x(1−x)`: `[x(1−x) φ]₀¹ = 0` for every `φ`.
- `u = 1`, `φ = x`: `0 + 1 ≠ 0`, so `u` is excluded.
- `k = n`: the identity is empty, since `φ` has negative degree, and `WᵖΛⁿ₀ = Lᵖ`.

### 5.4 Gluing across interfaces

Let `Ω` be open and `Ω₁, …, Ω_m ⊆ Ω` pairwise disjoint bounded Lipschitz domains with `Ω ⊆ ⋃ closure
Ωᵢ`. Let `u ∈ LᵖΛᵏ(Ω)` be
Lipschitz on each `closure Ωᵢ`, as a restriction. Then `u ∈ WᵖΛᵏ(Ω)`, with weak derivative the
piecewise classical `du` a.e., if and
only if on every shared boundary piece `frontier Ωᵢ ∩ frontier Ωⱼ ∩ Ω` the tangential traces from
`Ωᵢ` and `Ωⱼ` agree `μHE[n−1]`-a.e.
For `k = 0`, with §3.5, a function Lipschitz on each piece is in `W^{1,p}(Ω)` if and only if its
traces agree on interfaces, from G6's
BV gluing and A.6's trace.

*Needs:* §3.5, §5.1, §5.2; GeometricMeasureTheory G6.

**Checks.** With `Ω₁ = (−1,0) × (0,1)`, `Ω₂ = (0,1) × (0,1)`, and `Ω` the interior of their closure:

- `u = sign(x₁) dx₁`: tangential traces are both `0` on the interface, and `u ∈ HΛ¹(Ω)` with `du =
  0`.
- `u = sign(x₁) dx₂`: tangential part jumps, `du` has a singular part, and `u ∉ HΛ¹(Ω)`.
- `k = 0`, `u = |x₁|` belongs and `u = sign x₁` does not.

### Examples

The two half-cubes of §5.4 in dimension `3`, with `dx₁`, `dx₂` and piecewise constant coefficients.

### Dependencies

Layers 1 to 3; PDE Lane A.6; GeometricMeasureTheory G6.

## Layer 6: the L² de Rham complex as a Hilbert complex

### 6.1 Abstract Hilbert complexes

For closed densely defined `d₀ : W₀ →ₗ.[ℝ] W₁`, `d₁ : W₁ →ₗ.[ℝ] W₂` between Hilbert spaces with
`rangePMap d₀ ≤ kerPMap d₁`
(Arnold–Falk–Winther 2010, §3.1.3, (14)–(16); 2006, Theorems 2.1–2.3 and (2.18); Brüning–Lesch as a
work), with
`harmonic d₀ d₁ := kerPMap d₁ ⊓ kerPMap d₀*`, prove:

- `hodge_decomposition`: `W₁ = closure (range d₀) ⊕ harmonic d₀ d₁ ⊕ closure (range d₁*)`,
  orthogonally;
- `isClosed_range_iff_poincare`: `range d₁` is closed if and only if `‖u‖ ≤ c ‖d₁ u‖` for `u ∈ dom
  d₁ ∩ (ker d₁)ᗮ`;
- `CompactProperty.isClosed_range`: if `dom d₁ ∩ dom d₀*`, with its graph norm, embeds compactly
  into `W₁`, the ranges of `d₀` and
  `d₁` are closed and the harmonic space is finite dimensional;
- `compactProperty_iff_weight` (Picard, Lemma 2, p. 157; Lim–Sprekeler–Waurick, Theorem 2.11): for a
  bounded, self-adjoint,
  uniformly positive `ε` on `W₁`, the compactness property holds for `d₀*` if and only if it holds
  for the adjoint
  `d₀*_ε = d₀* ∘ ε` of `d₀` with respect to `⟪ε ·, ·⟫`. The proof compares the two orthogonal
  decompositions
  `W₁ = closure (range d₀) ⊕ ker d₀*` and its `ε` version; Lim–Sprekeler–Waurick prove one
  direction, and the same statement for
  `ε⁻¹` gives the other;
- the dual complex, and the abstract Hodge Laplacian and its well-posedness when the ranges are
  closed and the harmonic spaces are
  finite dimensional.

*Needs:* Mathlib `LinearPMap`, `LinearPMap.IsClosed`, `LinearPMap.adjoint`.

**Checks.**

- `W₀ = 0`: the harmonic space is `ker d₁`, and the decomposition is `W₁ = 0 ⊕ ker d₁ ⊕ (ker d₁)ᗮ`.
- `d₁` diagonal on `ℓ²` with entries `1/m`: bounded, injective, with non-closed range, and no
  Poincaré constant.
- `ε = Id` and `ε = 2·Id`: both domains agree, so the weight statement is immediate.

### 6.2 The L² de Rham complex

`L²Λ⁰ → L²Λ¹ → ⋯ → L²Λⁿ` with domains `HΛᵏ(Ω)`, and the version with domains `HΛᵏ₀(Ω)`, are Hilbert
complexes; the dual complex of each is
the codifferential complex of the other, through §3.4.

*Needs:* §3.1, §3.2, §3.4, §6.1.

**Checks.** On `Ω = (0,1)`:

- domains `HΛᵏ`: `d` from `H¹` onto `L²`, with harmonic spaces of dimension `1, 0`, the constants in
  degree `0`;
- domains `HΛᵏ₀`: `d` from `H¹₀` onto mean-zero functions, with harmonic spaces of dimension `0, 1`,
  the constants in degree `1`;
- the dual of the first complex is the second, by §3.4.

### Examples

The interval of §6.2, and the operator `d₀ = 0`, `d₁ = id` on a Hilbert space.

### Dependencies

Layer 3; Mathlib's `LinearPMap`.

## Layer 7: compactness and closed range on bounded Lipschitz domains

The proof is Picard's: reduce to a model domain by a partition of unity and bi-Lipschitz pullback,
absorb the weight by §6.1, and prove the
model case by `H¹` regularity and Rellich. The model domain is `Q := (0,1)ⁿ`, this roadmap's choice
following Lim–Sprekeler–Waurick, where the
`H¹` regularity has an elementary proof by Fourier sine and cosine series.

### 7.1 Gaffney on the cube

Every `u ∈ HΛᵏ₀(Q) ∩ H*Λᵏ(Q)` has coefficients `u(e_I)` in `W^{1,2}(Q)` (`TauCeti.W1p volume Q 2`),
with
`∑_I ‖∇ u(e_I)‖² = ‖du‖² + ‖δu‖²` (Lim–Sprekeler–Waurick, Theorem 4.10, for `k = 1`; the general `k`
is this roadmap's, with the same
proof). The forms whose coefficient `u(e_I)` is a product of cosines in the directions of `I` and
sines in the others, so that the tangential part
vanishes on every face, span a common core for `d` on `HΛᵏ₀(Q)` and `δ` on `H*Λᵏ(Q)`; on that core
the identity follows by integrating by parts,
and it extends by closedness. Hence `HΛᵏ₀(Q) ∩ H*Λᵏ(Q) ↪ L²Λᵏ(Q)` is compact, by PDE Lane A.6's
Rellich applied to each coefficient.

*Needs:* §3.2, §3.4; PDE Lane A.6; Tau Ceti `W1p`.

**Checks.**

- `n = 2`, `k = 1`, `a₁ = cos(πm₁x₁) sin(πm₂x₂)`, `a₂ = sin(πm₁′x₁) cos(πm₂′x₂)`: the difference of
  the two sides is
  `2∫(∂₁a₁ ∂₂a₂ − ∂₁a₂ ∂₂a₁)`, a boundary term that vanishes on all four sides.
- `k = 0`: `H¹₀(Q)` with the identity `‖∇u‖² = ‖du‖²`.
- `k = n`: `H¹(Q)` through `⋆`, with `δ` the gradient.

### 7.2 Lipschitz charts are bi-Lipschitz cubes

Every chart region of a Lipschitz domain of PDE Lane A.6, the part of an open product cylinder above
a Lipschitz graph, is the image of `Q` under a
bi-Lipschitz homeomorphism of `E`, with constants in terms of the chart's Lipschitz constant and
dimensions. Every bounded Lipschitz domain is covered by
finitely many open sets `Uᵢ` such that each `Uᵢ ∩ Ω` is a bi-Lipschitz image of `Q`.

*Needs:* PDE Lane A.6.

**Checks.**

- Graph `ξ = 0`: the map is affine.
- Graph `ξ = |s|`: `(s, t) ↦ (s, t − |s|)` is bi-Lipschitz with constant bounded by `2`.
- `Ω = Q`: `Q` is its own image under the identity.

### 7.3 Compact embedding (Picard)

For a bounded Lipschitz domain `Ω`, `HΛᵏ₀(Ω) ∩ H*Λᵏ(Ω) ↪ L²Λᵏ(Ω)` is compact.

- Multiplication by a smooth partition of unity subordinate to §7.2's cover is bounded on `HΛᵏ₀ ∩
  H*Λᵏ` (§2.3 for `d`, and through `⋆` for `δ`), which reduces
  the claim to a single `Uᵢ ∩ Ω`.
- The bi-Lipschitz pullback (§4.1) maps `HΛᵏ₀(Uᵢ ∩ Ω)` onto `HΛᵏ₀(Q)` and turns `δ` into a weighted
  codifferential, with weight `±⋆Φ^*⋆(Φ^*)⁻¹`, bounded and
  uniformly positive (Picard, Chapter 3, p. 162).
- §6.1's weight independence removes the weight, and §7.1 concludes.

*Needs:* §2.3, §3.4, §4.1, §6.1, §7.1, §7.2.

**Checks.**

- `k = 0`: `HΛ⁰₀ ∩ H*Λ⁰ = H¹₀`, compact into `L²` by Rellich.
- `k = n`: `HΛⁿ₀ ∩ H*Λⁿ ≅ H¹(Ω)`, as `d = 0` on `n`-forms, compact by A.6.
- `Ω = Q`: this is §7.1, with no pullback.

### 7.4 Consequences

- Dual boundary conditions: `HΛᵏ(Ω) ∩ H*Λᵏ₀(Ω) ↪ L²Λᵏ(Ω)` is compact, by applying `⋆` to §7.3 in
  degree `n − k` (Picard, (2.3), p. 157).
- Weighted versions: both embeddings stay compact with `δ` taken with respect to any bounded,
  symmetric, uniformly positive measurable weight `ε`.
- On a bounded Lipschitz domain, both complexes of §6.2 have closed ranges and finite-dimensional
  harmonic spaces, the Poincaré inequality `‖u‖ ≤ c ‖du‖`
  holds on `HΛᵏ(Ω) ∩ (ker d)ᗮ` and on `HΛᵏ₀(Ω) ∩ (ker d)ᗮ` with a non-explicit constant, and the
  abstract Hodge Laplacian is well posed.

*Needs:* §6.1, §6.2, §7.3.

**Checks.**

- `Ω = (0,1)`: the harmonic spaces of §6.2, of dimensions `1, 0` and `0, 1`, are finite.
- `Ω` an annulus in `ℝ²`, `k = 1`, domains `HΛᵏ`: the harmonic space contains `dθ`, of dimension
  `1`.
- `ε = Id`: the weighted version is §7.3.

### Examples

The unit square with `k = 1`, and the annulus, using §7.4.

### Dependencies

Layers 2 to 6; PDE Lane A.6.

## Downstream consumers

No roadmap on the main branch consumes this one. The natural consumers are a roadmap on finite
element exterior calculus, and on mixed formulations of Maxwell's
equations and Hodge Laplacians on domains.

## References

- D. N. Arnold, R. S. Falk, R. Winther, *Finite element exterior calculus, homological techniques,
  and applications*, Acta Numerica 15 (2006), §2–3 (locators as
  given above); *Finite element exterior calculus: from Hodge theory to numerical stability*, Bull.
  AMS 47 (2010), arXiv:0906.4325v3, §3.1.3 and Theorem 4.1.
- J. Brüning, M. Lesch, *Hilbert complexes*, J. Funct. Anal. 108 (1992): the general framework,
  cited as a work.
- R. Picard, *An elementary proof for a compact imbedding result in generalized electromagnetic
  theory*, Math. Z. 187 (1984), 151–164: Lemma 2 and (2.3), p. 157;
  Chapter 3, pp. 161–162, whose model domain is the unit ball.
- Z. Lim, T. Sprekeler, M. Waurick, *Revisiting Picard's proof of the Picard–Weber–Weck selection
  theorem*, arXiv:2608.31054v1: Theorem 2.11 (weight independence, one
  direction), Theorem 4.10 (the Gaffney equality on the cube, vector fields).
