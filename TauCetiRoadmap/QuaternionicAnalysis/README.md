# Roadmap: quaternionic analysis

**Summary.** Build quaternion-valued analysis on open subsets of the real quaternion algebra `ℍ`,
on Mathlib's `Quaternion ℝ` with its normed-algebra and real Fréchet calculus, keeping two notions
of regularity apart: one-sided quotient differentiability, which is rigid (the differentiable
functions are the affine maps `q ↦ a + q*b` and `q ↦ a + b*q`, with no `C¹` assumption), and the
left and right Cauchy–Riemann–Fueter equations, which carry a Cauchy theory. From the real
coordinates of the multiplication maps, the quotient calculus, the rigidity theorems, the Fueter
operators, the ordered 3-form `Dq`, an affine face adapter over Mathlib's divergence theorem and
the kernel `(q−q₀)⁻¹/|q−q₀|²`, it reaches the left and right Cauchy theorems and Cauchy–Fueter
formulas with normalization `1/(2π²)`, and from them real analyticity, harmonicity, the uniqueness
principle and universal derivative estimates for Fueter-regular functions. Multiplication order is
part of every statement.

## Scope and ownership

This roadmap owns, by section:

- §1 the real `4×4` matrices and component equations of the multiplication maps `Lₐ` and `Rₐ`;
- §2 the left and right quotient derivatives, their limit characterisations, the exact product,
  inverse and composition criteria, and the two-sided slope lemma;
- §3 the connected-open classification of each one-sided class and of the two-sided class, with
  pointwise differentiability as the only hypothesis;
- §4 the left and right Fueter operators, the pointwise regularity predicates, their component
  systems and closure properties, and the reflection `T`;
- §5 the forms `dq` and `Dq`, the raw affine face functional with its reparametrization and
  reflection laws, the axis-box boundary match with Mathlib's divergence theorem, the
  Bochner/box-integral and smooth-form comparisons, the affine change of variables in `Fin n → ℝ`,
  and the left and right Cauchy theorems and Cauchy–Fueter formulas;
- §6 real analyticity, harmonicity, the uniqueness principle, the derivative representation and the
  universal derivative estimates.

It leaves to named owners:

- generic smooth differential forms, exterior derivative, orientations and the integral of a top
  form to DifferentialGeometry Layers 0–2 and 5.2, consumed as stated in the supplier contracts;
  Stokes' theorem with corners (DifferentialGeometry 5.5) is not used, since the Cauchy theorems here
  hold under pointwise differentiability and are proved through Mathlib's divergence theorem;
- the divergence theorem on axis-aligned boxes, the Lebesgue change of variables under linear maps,
  Haar measure in polar form and the volume of balls to Mathlib;
- analyticity of complex-differentiable functions of several variables to Tau Ceti;
- the one-variable complex theory, including the classification of conformal maps, to
  ConformalMapping; no quaternionic conformal classification is stated here;
- Morera-type theorems, primitives, rectifiable-chain versions of the Cauchy theorems, Laurent and
  power-series expansions of regular functions and the Liouville theorem to a Part II roadmap.

## Conventions

- **Coordinates.** `q = t + i x + j y + k z`, in the order `(t, x, y, z) = (re, imI, imJ, imK)`.
  The units are the constructors `qi = ⟨0,1,0,0⟩`, `qj = ⟨0,0,1,0⟩`, `qk = ⟨0,0,0,1⟩`, and `e = (1, i, j, k)`
  indexed by `Fin 4`. The coordinate map `toTuple : ℍ ≃ₗ[ℝ] (Fin 4 → ℝ)` is Mathlib's
  `QuaternionAlgebra.linearEquivTuple (-1) 0 (-1)`; its target carries the sup norm and is used only
  as an integration domain. No measure instance is placed on `ℍ`.
- **Multiplication maps.** For `a = α + iβ + jγ + kδ`, `Lₐ(h) = a*h` and `Rₐ(h) = h*a`. `Lₐ` is
  right-`ℍ`-linear and `Rₐ` is left-`ℍ`-linear; these module-linearity names are not the
  quotient-side names below.
- **Quotient derivatives.** The *left* quotient derivative of `f` at `q` is
  `b = lim_{h→0} h⁻¹*(f(q+h)−f(q))`; its real Fréchet derivative is `R_b : h ↦ h*b`. The *right*
  quotient derivative is `a = lim_{h→0} (f(q+h)−f(q))*h⁻¹`; its real Fréchet derivative is
  `L_a : h ↦ a*h`. A *slope* is the quaternion `b` or `a`. All calculus is `HasFDerivAt` over `ℝ`.
- **Conjugation and reflection.** `conj q = star q`, so `conj(⟨t,x,y,z⟩) = ⟨t,−x,−y,−z⟩`. The
  reflection of a function is `T(f)(q) = conj(f(conj q))`.
- **Complex coordinates for rigidity.** `q = v + j w` with `v = t + i x` and `w = y − i z`. The left
  scalar action is `λ •ₗ q = (λ : ℍ)*q` with coordinates `Φₗ(q) = (v, conj w) ∈ ℂ²`; the right scalar
  action is `λ •ᵣ q = q*(λ : ℍ)` with coordinates `Φᵣ(q) = (v, w)`.
- **Norm.** `‖·‖` on `ℍ` is the Euclidean norm, multiplicative, with `‖q‖² = q * conj q`. Radial
  variables are always this norm, never the sup norm of the tuple carrier.
- **Fueter operators.** `∂̄ₗ f = ∂ₜf + i*(∂ₓf) + j*(∂ᵧf) + k*(∂_zf)` and
  `∂̄ᵣ f = ∂ₜf + (∂ₓf)*i + (∂ᵧf)*j + (∂_zf)*k`. *Regular* always means Fueter regular in the pointwise
  sense of §4.1: a real Fréchet derivative exists at the point and satisfies the ordered equation;
  continuity of the derivative is never a hypothesis.
- **Forms.** `dq = dt + i dx + j dy + k dz` and `Dq = dx∧dy∧dz − i dt∧dy∧dz − j dt∧dz∧dx − k dt∧dx∧dy`.
  Quaternion coefficients multiply in `ℍ` before coordinatewise integration. The boundary of a
  positively oriented parallelepiped carries the outward-first orientation. The Cauchy–Fueter kernel
  is `G(r) = r⁻¹/‖r‖² = conj r/‖r‖⁴`, with junk value `0` at `r = 0`, and the normalization of both
  Cauchy–Fueter formulas is `1/(2π²)`.
- **Vocabulary.** "Biholomorphic" is never used without saying which derivative notion the map and
  its inverse are required to have. "Real analytic on `Ω`" is `AnalyticOnNhd ℝ f Ω`.
- **Generality.** Every statement is for an arbitrary function `f : ℍ → ℍ` with hypotheses on a set;
  the affine change of variables of §5.4 is stated for every `n` and every complete real normed
  codomain.

## Exact supplier contracts

### From Mathlib

All at the pinned Mathlib; file paths under `Mathlib/`.

- `Quaternion ℝ` with `NormedDivisionRing`, `NormedAlgebra ℝ`, `CompleteSpace` and
  `InnerProductSpace ℝ ℍ` (`Analysis/Quaternion.lean`, lines 85, 89, 194, 60): the norm is
  multiplicative and Euclidean, `Quaternion.normSq_eq_norm_mul_self`.
- Coordinates: `QuaternionAlgebra.equivTuple`, `QuaternionAlgebra.linearEquivTuple`, the coordinate
  linear maps `QuaternionAlgebra.reₗ`, `imIₗ`, `imJₗ`, `imKₗ`, and the component multiplication
  formulas `Quaternion.re_mul`, `imI_mul`, `imJ_mul`, `imK_mul` (`Algebra/Quaternion.lean`, lines 96,
  506, 479–500, 823–835); the constructor formulas `QuaternionAlgebra.mk_mul_mk` (line 306, for
  every `ℍ[R,c₁,c₂,c₃]`) and `QuaternionAlgebra.star_mk` (line 598, giving `⟨a₁ + c₂*a₂, −a₂, −a₃, −a₄⟩`,
  so for `ℍ`, where `c₂ = 0`, negation of the three imaginary coordinates). Build every matrix from
  these; introduce no second quaternion carrier and no parallel coordinate API.
- `Quaternion.linearIsometryEquivTuple : ℍ ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 4)` (`Analysis/Quaternion.lean`
  line 158) and `PiLp.volume_preserving_toLp` (`MeasureTheory/Measure/Haar/InnerProductSpace.lean`
  line 139), used only for the radial mass of §5.6.
- `ContinuousLinearMap.mul ℝ ℍ : ℍ →L[ℝ] ℍ →L[ℝ] ℍ` (`Analysis/Normed/Operator/Mul.lean` line 39):
  `L_a = ContinuousLinearMap.mul ℝ ℍ a` and `R_b = (ContinuousLinearMap.mul ℝ ℍ).flip b`.
- Real Fréchet calculus: `HasFDerivAt`, `HasFDerivAt.mul'` (`Analysis/Calculus/FDeriv/Mul.lean`
  line 198, derivative `a x • b' + a' <• b x` of a product in a normed algebra), `hasFDerivAt_inv'`
  (line 735, derivative `-mulLeftRight 𝕜 R x⁻¹ x⁻¹` of inversion at `x ≠ 0`), `HasFDerivAt.comp`
  (`Analysis/Calculus/FDeriv/Comp.lean` line 107), `second_derivative_symmetric`
  (`Analysis/Calculus/FDeriv/Symmetric.lean` line 482), `hasFDerivAt_of_restrictScalars`
  (`Analysis/Calculus/FDeriv/RestrictScalars.lean` line 89, hypothesis `g'.restrictScalars 𝕜 = f'`),
  `iteratedFDeriv_succ_eq_comp_left` (`Analysis/Calculus/ContDiff/FTaylorSeries.lean` line 843),
  `hasFDerivAt_integral_of_dominated_of_fderiv_le` (`Analysis/Calculus/ParametricIntegral.lean`
  line 208).
- Analytic functions: `AnalyticOnNhd` and `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`
  (`Analysis/Analytic/Uniqueness.lean` line 223).
- The Laplacian: the instance `Laplacian (E → F) (E → F)` for a finite-dimensional real inner product
  space `E` and real normed space `F` (`Analysis/InnerProductSpace/Laplacian.lean` line 138) with
  `laplacian_eq_iteratedFDeriv_orthonormalBasis` (line 171), applied to `E = F = ℍ`.
- The divergence theorem `MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable`
  (`MeasureTheory/Integral/DivergenceTheorem.lean` line 266): for `a ≤ b` in `Fin (n+1) → ℝ`, a
  function continuous on `Icc a b`, Fréchet differentiable at every point of the open box
  `pi univ (fun i => Ioo (a i) (b i))` off a countable set, with integrable divergence
  `x ↦ ∑ i, f' x (e i) i`, the integral of the divergence over `Icc a b` equals
  `∑ i, (∫ x in face i, f (frontFace i x) i − ∫ x in face i, f (backFace i x) i)` with
  `face i = Icc (a ∘ Fin.succAbove i) (b ∘ Fin.succAbove i)`, `frontFace i = Fin.insertNth i (b i)`,
  `backFace i = Fin.insertNth i (a i)`. No continuity of the derivative is required.
- Measure theory: `Real.map_linearMap_volume_pi_eq_smul_volume_pi`
  (`MeasureTheory/Measure/Lebesgue/Basic.lean` line 429), `MeasureTheory.integral_map`
  (`MeasureTheory/Integral/Bochner/Basic.lean` line 1076), `MeasureTheory.setIntegral_map`
  (`MeasureTheory/Integral/Bochner/Set.lean` line 554), `MeasureTheory.ContinuousOn.hasBoxIntegral`
  (`Analysis/BoxIntegral/Integrability.lean` line 305), `BoxIntegral.Box.coe_ae_eq_Icc`
  (`Analysis/BoxIntegral/Partition/Measure.lean` line 70), `MeasureTheory.Measure.integral_fun_norm_addHaar`
  (`MeasureTheory/Constructions/HaarToSphere.lean` line 296:
  `∫ x, f ‖x‖ ∂μ = dim E • μ.real (ball 0 1) • ∫ y in Ioi 0, y^(dim E − 1) • f y`),
  `InnerProductSpace.volume_ball_of_dim_even` (`MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean`
  line 359: `volume (ball x r) = r^(2k) * π^k / k!` when `finrank ℝ E = 2k`).
- The cutoff `Real.smoothTransition` (`Analysis/SpecialFunctions/SmoothTransition.lean`): zero
  exactly on `x ≤ 0`, one for `1 ≤ x`, `contDiff`, monotone.
- `ModelWithCorners.ofConvexRange` (`Geometry/Manifold/IsManifold/Basic.lean` line 318), for the
  cube's own model with corners in §5.3.

### From Tau Ceti

- `DifferentiableOn.analyticOnNhd_of_finiteDimensional` in
  `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` (line 275): for `[NormedAddCommGroup E]
  [NormedSpace ℂ E] [CompleteSpace E]` and `[NormedAddCommGroup V] [NormedSpace ℂ V]
  [FiniteDimensional ℂ V]`, `DifferentiableOn ℂ F s → IsOpen s → AnalyticOnNhd ℂ F s`. It is applied
  with `E = V = ℂ × ℂ` in §3.2 and is the only regularity input of the rigidity theorems.

### From TauCetiRoadmap.DifferentialGeometry

- Layers 0–2: real differential forms on normed spaces and manifolds, the exterior derivative with
  its naturality under pullback, and chart-sign orientations, all valid over any model with corners.
  Consumed in §5.1 for the smooth-coefficient reading of `dq` and `Dq` and in §5.3.
- Layer 5.2: `integralTopForm` and its chart characterisation `integralTopForm_of_tsupport_subset_chart`.
  Consumed in §5.3 for the facetwise comparison of the smooth-coefficient face integrals. That
  roadmap's "Boundary and corners" policy is respected: the cubical boundary is never treated as one
  manifold, and Layer 5.5 (Stokes with corners) is not invoked.

## How to read the build

Layer 1 computes the real coordinates of `Lₐ` and `Rₐ` and the component equations that cut out the
two multiplication subspaces. Layer 2 defines the two quotient derivatives as Fréchet derivatives
of the prescribed shape, proves their limit characterisations and their exact calculus, and records
the non-examples. Layer 3 proves the rigidity theorems by transporting a one-sided derivative to a
complex-linear one and using the several-variable analyticity theorem from Tau Ceti. Layer 4
defines the Fueter operators and the pointwise regularity predicates and relates them to Layers 2
and 3. Layer 5 builds the forms, the affine face adapter over Mathlib's divergence theorem, the
affine change of variables, and proves the Cauchy theorems and Cauchy–Fueter formulas under
pointwise hypotheses. Layer 6 draws the regularity consequences: harmonicity, real analyticity, the
uniqueness principle and the universal derivative estimates. Each layer uses only earlier layers
and the suppliers listed above.

## Layer 1: real coordinates and multiplication maps

### 1.1 The matrices of `Lₐ` and `Rₐ`

Define the real `4×4` matrix of `Lₐ` and of `Rₐ` in the coordinate order `(t, x, y, z)` for both
input and output, from the native component multiplication formulas `Quaternion.re_mul`,
`imI_mul`, `imJ_mul`, `imK_mul` and the constructor formula `QuaternionAlgebra.mk_mul_mk` (the
multiplication rules are also FL08, §2.1, p. 7). For `a = α + iβ + jγ + kδ`,

```text
Lₐ = [[ α, -β, -γ, -δ],        Rₐ = [[ α, -β, -γ, -δ],
      [ β,  α, -δ,  γ],              [ β,  α,  δ, -γ],
      [ γ,  δ,  α, -β],              [ γ, -δ,  α,  β],
      [ δ, -γ,  β,  α]]              [ δ,  γ, -β,  α]]
```

Its API:

- each of the sixteen entries of each matrix is the stated expression in `α, β, γ, δ`;
- the matrix of `Lₐ` applied to the coordinate vector of `q` is the coordinate vector of `a*q`, and
  the matrix of `Rₐ` applied to it is the coordinate vector of `q*a`;
- the two matrices agree exactly when `a` is real, and both are then `α` times the identity.

**Checks.**

- `a = i`, `q = j`: the matrix of `Lᵢ` sends `(0,0,1,0)` to `(0,0,0,1)`, the coordinates of `ij = k`;
  the matrix of `Rᵢ` sends it to `(0,0,0,−1)`, the coordinates of `ji = −k`. A definition that swaps
  the two matrices, or reads the input in the order `(x, y, z, t)`, gets one of the two signs wrong.
- `a = 2`: both matrices are `2·I₄`, and `L_2(q) = R_2(q) = 2q`.
- `a = i + j`, `q = 1`: both matrices send `(1,0,0,0)` to `(0,1,1,0)`; the matrices differ only on
  nonreal inputs, so a test on `q = 1` alone cannot distinguish them.

### 1.2 Composition, inverses, norms and determinants

Prove `Lₐ∘L_b = L_{ab}`, `Rₐ∘R_b = R_{ba}`, `Lₐ∘R_b = R_b∘Lₐ`, `Lₐ⁻¹ = L_{a⁻¹}` and `Rₐ⁻¹ = R_{a⁻¹}`
for `a ≠ 0`, `‖Lₐ(q)‖ = ‖Rₐ(q)‖ = ‖a‖‖q‖`, and `det Lₐ = det Rₐ = ‖a‖⁴`, from associativity, the
multiplicativity of the norm, and the matrices of §1.1.

**Checks.**

- `a = i`, `b = j`: `Rᵢ(R_j(1)) = Rᵢ(j) = ji = −k`, which is `R_{ji}(1) = ji`; the wrong order `R_{ij}(1) = k`
  has the opposite sign.
- `a = 2`: `det L_2 = 2⁴ = 16 = ‖2‖⁴`; a formula with `‖a‖²` gives `4`.
- `a = 1 + i`: `‖a‖ = √2`, `det Lₐ = 4`, and `‖Lₐ(j)‖ = ‖j + k‖ = √2 = ‖a‖‖j‖`.
- `a = 0`: both maps are zero, both determinants are `0`, and the inverse statements are not asserted.

### 1.3 Component equations of the multiplication subspaces

Write an output as `K + iL + jM + kN` with real component functions `K, L, M, N` of the input
coordinates `(t, x, y, z)`. Prove the conversion between a real Fréchet derivative
`D : ℍ →L[ℝ] ℍ` and the four output-coordinate partial derivatives, and prove that a real-linear map
is of the form `Lₐ` exactly when its partials satisfy

`K_t = L_x = M_y = N_z`, `K_x = −L_t = M_z = −N_y`, `K_y = −L_z = −M_t = N_x`, `K_z = L_y = −M_x = −N_t`,

and of the form `Rₐ` exactly when

`K_t = L_x = M_y = N_z`, `K_x = −L_t = −M_z = N_y`, `K_y = L_z = −M_t = −N_x`, `K_z = −L_y = M_x = −N_t`.

These systems characterise the two multiplication subspaces among all real-linear maps; they are
not the Fueter equations of §4.

**Checks.**

- `f(q) = i*q`: `K = −x`, `L = t`, `M = −z`, `N = y`; the `Lₐ` system holds (`K_x = −1 = −L_t = M_z = −N_y`)
  and the `Rₐ` system fails at `M_z = −1 ≠ 1 = −K_x`.
- `f(q) = q*i`: `K = −x`, `L = t`, `M = z`, `N = −y`; the `Rₐ` system holds and the `Lₐ` system fails at
  `M_z = 1 ≠ −1 = K_x`.
- `f(q) = conj q`: `K = t`, `L = −x`, `M = −y`, `N = −z`; `K_t = 1 ≠ −1 = L_x`, so conjugation is in
  neither subspace, although it is real-linear and norm-preserving.
- `f(q) = r*q` for real `r`: both systems hold, with all mixed partials zero.

### Examples

The identity is `L_1 = R_1`; left multiplication by `i` is `Lᵢ`, whose matrix is the block
`[[0,−1],[1,0]]` on `(t,x)` and `[[0,1],[−1,0]]` on `(y,z)`; right multiplication by `i` is the same
on `(t,x)` and the opposite sign on `(y,z)`.

### Dependencies

Mathlib's `Quaternion ℝ`, its coordinate maps and component multiplication formulas, matrices and
determinants over `ℝ`.

## Layer 2: one-sided quotient calculus

### 2.1 The quotient-derivative predicates

Define `HasLeftQuotientFDerivAt f q b` as `HasFDerivAt f R_b q` with `R_b = (ContinuousLinearMap.mul ℝ ℍ).flip b`,
and `HasRightQuotientFDerivAt f q a` as `HasFDerivAt f L_a q` with `L_a = ContinuousLinearMap.mul ℝ ℍ a`.
These are the primary definitions; the quotient limits are theorems (§2.2). (D12, §1, p. 2,
lines 46–55 for the two limits; Sudbery 1979, Theorem 1.)

Its API:

- the slope is unique: two left slopes at the same point are equal, and likewise two right slopes
  (uniqueness of the Fréchet derivative and evaluation at `h = 1`);
- a left slope `b` at `q` implies `HasFDerivAt f R_b q` and `DifferentiableAt ℝ f q`, and the real
  derivative is `R_b`; dually for a right slope;
- sum rule and real-scalar rule on each side, with slopes added and scaled;
- the pointwise and setwise interfaces: `f` is left (right) quotient differentiable at `q` when some
  slope exists, and on `Ω` when it exists at every point of `Ω`.

**Checks.**

- `f(q) = q*b` has left slope `b` at every point, since its derivative is `R_b`; its right slopes
  exist exactly when `b` is real.
- `f(q) = b*q` with `b` nonreal has no left slope anywhere: its derivative `L_b` is `R_c` only if
  `b = c` (evaluate at `h = 1`) and `b` is central. The other-order definition would accept it.
- the identity has both slopes `1`; a constant has both slopes `0`.
- `f(q) = q²` at `q = i`: the derivative is `h ↦ h*i + i*h`, which at `h = j` gives `ji + ij = 0`,
  while `R_c(j) = j*c` for the forced `c = 2i` is `2ji = −2k ≠ 0`; so no left slope exists at `i`. At a
  real point `q = r` the derivative is `h ↦ 2rh`, and both slopes are `2r`.

### 2.2 Limit characterisations

Prove, with the same nonzero increment `h` on both sides and all limits along `𝓝[≠] (0 : ℍ)`,

```text
left:   h⁻¹ * (f(q+h) − f(q)) → b   iff   ‖f(q+h) − f(q) − h*b‖ / ‖h‖ → 0,
right:  (f(q+h) − f(q)) * h⁻¹ → a   iff   ‖f(q+h) − f(q) − a*h‖ / ‖h‖ → 0,
```

and that the right-hand sides are `HasLeftQuotientFDerivAt f q b` and `HasRightQuotientFDerivAt f q a`.
Each direction follows from the identity `‖h⁻¹*(Δ) − b‖ = ‖h⁻¹*(Δ − h*b)‖ = ‖Δ − h*b‖/‖h‖` for
`Δ = f(q+h) − f(q)`, by multiplicativity of the norm; the increment is never replaced by its inverse.

**Checks.**

- `f(q) = q*b`, any `q`: `h⁻¹*(Δ) = h⁻¹*h*b = b` exactly, so the left limit is `b`; the right
  quotient `(h*b)*h⁻¹ = h*b*h⁻¹` has no limit at `h → 0` unless `b` is real (take `h` real versus
  `h = εi` with `b = j`: the values are `j` and `i j i⁻¹ = −j`).
- `f(q) = q²` at `q = i`: `h⁻¹*(Δ) = h⁻¹*(h*i + i*h + h²) = i + h⁻¹*i*h + h`, whose limit along real `h`
  is `2i` and along `h = εj` is `i + j⁻¹ i j = i − i = 0`; no left limit exists.
- the remainder identity at `h = 2`, `Δ = 6`, `b = 1`: both sides are `‖3 − 1‖ = 2 = ‖6 − 2‖/2`.

### 2.3 Products, inverses and compositions

For `f` and `g` with left slopes `b_f, b_g` at `q`, the product rule `HasFDerivAt.mul'` gives the real
derivative `h ↦ (h*b_f)*g(q) + f(q)*(h*b_g)`. Prove `left_product_quotient_iff`: the product has
left slope `b_f*g(q) + f(q)*b_g` at `q` exactly when `b_g = 0` or `f(q)` is real. The slope of a
left-quotient-differentiable product is forced to be this value (evaluate the derivative at `h = 1`),
so the statement with the explicit slope is equivalent to "the product has some left slope".
Prove `right_product_quotient_iff`: for right slopes `a_f, a_g`, the product has right slope
`a_f*g(q) + f(q)*a_g` exactly when `a_f = 0` or `g(q)` is real. For `f(q) ≠ 0`, `hasFDerivAt_inv'`
gives the derivative `h ↦ −f(q)⁻¹*(D h)*f(q)⁻¹` of the pointwise inverse; prove
`left_inverse_quotient_iff`: the inverse has left slope `−(f(q)⁻¹*b_f*f(q)⁻¹)` exactly when `b_f = 0`
or `f(q)` is real, and `right_inverse_quotient_iff`: it has right slope `−(f(q)⁻¹*a_f*f(q)⁻¹)` exactly
when `a_f = 0` or `f(q)` is real. In each case the "only if" direction is the fact that the
displayed derivative is a one-sided multiplication map only when the commutator term vanishes for
every `h`, which in the division ring `ℍ` forces the stated alternative. For composition, if `g`
has left slope `b_g` at `q` and `f` has left slope `b_f` at `g(q)`, then `f ∘ g` has left slope
`b_g*b_f` at `q`; with right slopes `a_g`, `a_f` it has right slope `a_f*a_g`; both by `HasFDerivAt.comp`
and associativity. State the general real Fréchet product and inverse rules separately; they
never imply that a quaternionic subclass is closed when the criteria fail. *Needs:* §2.1, Mathlib
`HasFDerivAt.mul'`, `hasFDerivAt_inv'`, `HasFDerivAt.comp`.

**Checks.**

- `f = id`, `g = c` constant: `b_g = 0`, so the product `q*c` has left slope `1*c + q*0 = c`, as in §2.1.
- `f = c` nonreal constant, `g = id`: `b_g = 1 ≠ 0` and `f(q) = c ∉ ℝ`, so the criterion refuses, and
  indeed `q ↦ c*q` has no left slope (§2.1). A criterion with the roles of `f` and `g` exchanged would
  wrongly accept it.
- `f = g = id` at `q = i`: the criterion refuses (`b_g = 1`, `f(i) = i`), matching the failure of `q²`.
- inverse of `id` at `q = i`: `b_f = 1 ≠ 0` and `f(i) = i ∉ ℝ`; the derivative of inversion at `i` is
  `h ↦ −(−i)*h*(−i) = −i*h*i`, which at `h = j` gives `−i j i = −j`, while the forced slope `c = 1`
  gives `R_1(j) = j`; so `q⁻¹` has no left slope at `i`. At a nonzero real point `q = r` the inverse
  has both slopes `−r⁻²`.
- composition `f(q) = q*b`, `g(q) = q*c`: `f(g(q)) = q*c*b`, left slope `c*b = b_g*b_f`; the other
  order `b*c` is wrong when `b = i`, `c = j`.

### 2.4 Elementary examples and the one-form loop integrals

Prove: constants have both slopes `0`; `q ↦ a + q*b` has left slope `b` everywhere; `q ↦ a + b*q`
has right slope `b` everywhere; the coordinate projections `q ↦ t`, `q ↦ x`, `q ↦ y`, `q ↦ z` have no
one-sided slope at any point (their derivatives have rank one, while `R_b` and `L_a` have rank `0`
or `4`); and `q ↦ q²` has neither slope on any nonempty open set (every nonempty open set contains a
nonreal point, and §2.1 applies there). The quotient-differentiable classes carry no loop theorem
for the ordered quaternion-valued 1-form `dq`: this is recorded by the Check below and is unrelated
to the 3-form Cauchy theory of §5.

**Checks.**

- the identity `f(q) = q` has both slopes `1`; on the positively oriented unit square `q = i x + j y`
  with boundary `0 → i → i+j → j → 0`, direct edge integration gives
  `∮ q dq = (−1/2) + (k − 1/2) + (k + 1/2) + (1/2) = 2k` and
  `∮ dq q = (−1/2) + (−k − 1/2) + (1/2 − k) + (1/2) = −2k`; neither vanishes, and a definition of the
  edge integral that commutes the factors would make the two agree.
- `q ↦ q²` at `q = i` and at `q = 1 + i`: no slope on either side; at `q = 3`: both slopes `6`.
- `q ↦ x` (the `imI` coordinate) at `q = 0`: the derivative is `h ↦ x(h)`, of rank one, and no `R_b`
  or `L_a` has rank one, so no slope exists.

### 2.5 Simultaneous slopes at a point

Prove that if `f` has left slope `b` and right slope `a` at the same point then `L_a = R_b` as
real-linear maps, hence `a = b` (evaluate at `h = 1`) and `a*h = h*a` for every `h`, so `a = b` is
real. Prove that this is not implied by bijectivity plus a one-sided differentiable inverse:
`q ↦ i*q` and `q ↦ −i*q` are mutually inverse bijections, each with right slope `±i`, and the slope is
not real.

**Checks.**

- the identity: `a = b = 1`.
- `q ↦ i*q`: right slope `i`, no left slope; a lemma concluding only `a = b` without reality would be
  satisfied by `a = b = i`, which this example refutes as a left slope.
- `q ↦ 3*q`: both slopes `3`, real.

### Examples

`q ↦ q*j` (left slope `j`, no right slope), `q ↦ j*q` (right slope `j`, no left slope),
`q ↦ 2 + 3q` (both slopes `3`), `q ↦ q²` (no slope at `i`, slopes `2r` at real `r`).

### Dependencies

§1; Mathlib's `HasFDerivAt`, `ContinuousLinearMap.mul`, the product, inverse and chain rules.

## Layer 3: rigidity without assumed higher regularity

### 3.1 Complex coordinates and scalar actions

Prove from the native coordinates that `q = v + j w` with `v = t + i x`, `w = y − i z`, that
`λ •ₗ q = (λ : ℍ)*q` has coordinates `Φₗ(λ •ₗ q) = λ·Φₗ(q)` for `Φₗ(q) = (v, conj w)` (because
`λ(v + jw) = λv + j(conj λ)w`), and that `λ •ᵣ q = q*(λ : ℍ)` has coordinates `Φᵣ(λ •ᵣ q) = λ·Φᵣ(q)`
for `Φᵣ(q) = (v, w)`. Prove that `R_b` commutes with `•ₗ` and `L_a` commutes with `•ᵣ`
(associativity), so a real derivative `R_b` is complex-linear for the left structure and `L_a` for
the right one. Prove that if `f(q) = g(v,w) + j h(v,w)` then `Φₗ ∘ f ∘ Φₗ⁻¹` has coordinates
`(g, conj h)` and `Φᵣ ∘ f ∘ Φᵣ⁻¹` has coordinates `(g, h)`.

**Checks.**

- `λ = i`, `q = j`: `i •ₗ j = k`, whose decomposition is `v = 0`, `w = −i` (since `j·(−i) = k`), so
  `Φₗ(k) = (0, i) = i·(0, 1) = i·Φₗ(j)`; the uncorrected coordinates `(v, w)` would give `(0, −i) = −i·(0,1)`,
  which is conjugate-linear.
- `λ = i`, `q = j` for the right action: `j •ᵣ i = ji = −k`, with `v = 0`, `w = i`, so `Φᵣ(−k) = (0, i) = i·Φᵣ(j)`.
- `L_a` does not commute with `•ₗ`: `a = j`, `λ = i`, `q = 1` gives `j*(i*1) = −k` but `i*(j*1) = k`.
- `q = 1 + i + j + k`: `v = 1 + i`, `w = 1 − i`, and `v + j w = 1 + i + j − j i = 1 + i + j + k`.

### 3.2 The left classification

Prove `leftQuotient_rigidity`: for connected open `Ω`, `f` has a left slope at every point of `Ω`
exactly when there are `a, b` with `f(q) = a + q*b` on `Ω`. (Sudbery 1979, Theorem 1; the
statement is also D12, §1, p. 2.) The direction from the affine form is the derivative
`R_b` of `q ↦ a + q*b`. For the other direction let `Fₗ = Φₗ ∘ f ∘ Φₗ⁻¹` on the open set `Φₗ(Ω) ⊆ ℂ²`.
At each point the real derivative is `R_b`, which commutes with `•ₗ`, so `Φₗ R_b Φₗ⁻¹` is
`ℂ`-linear; construct it as `Dℂ : ℂ² →L[ℂ] ℂ²`, prove `Dℂ.restrictScalars ℝ` is the real derivative,
and apply `hasFDerivAt_of_restrictScalars` to get `HasFDerivAt ℂ Fₗ Dℂ`, hence
`DifferentiableOn ℂ Fₗ (Φₗ(Ω))`. Apply `DifferentiableOn.analyticOnNhd_of_finiteDimensional` with
`E = V = ℂ × ℂ` to get `AnalyticOnNhd ℂ Fₗ (Φₗ(Ω))`, so `f` is `C²` on `Ω`: this derived regularity
replaces any `C¹` or `C²` hypothesis. Write `Df(q) = R_{b(q)}`. Symmetry of the second derivative
(`second_derivative_symmetric`) gives `h*Db(k) = k*Db(h)`; `k = 1` gives `Db(h) = h*c` with
`c = Db(1)`, and `h = i`, `k = j` give `(ij − ji)*c = 2k*c = 0`, so `c = 0`. Hence `b` is locally
constant, constant on the connected `Ω`, and `f − q*b` is constant. Prove also the local form on each
connected component of an arbitrary open set, and uniqueness of `a` and `b` when `Ω` is nonempty.
*Needs:* §2.1, §3.1, Tau Ceti `DifferentiableOn.analyticOnNhd_of_finiteDimensional`, Mathlib
`hasFDerivAt_of_restrictScalars`, `second_derivative_symmetric`.

**Checks.**

- `f(q) = 1 + q*i` on `ℍ`: left slope `i` everywhere; the classification returns `a = 1`, `b = i`.
- `f(q) = q²` on any ball: no left slope at nonreal points, consistent with it not being affine.
- `Ω` the union of the two disjoint balls of radius `1` about `0` and about `3`, `f = q*i` on the first
  and `f = q*j` on the second: a left slope exists at every point of `Ω`, but `f` is not of the form
  `a + q*b` on `Ω`; connectedness is necessary.
- `Ω = ∅`: both sides hold vacuously, with any `a, b`.

### 3.3 Reflection and the right classification

Prove that `T(f)(q) = conj(f(conj q))` sends a right slope `a` of `f` at `q` to the left slope
`conj a` of `T(f)` at `conj q`, since `D(Tf)(conj q)(h) = conj(a * conj h) = h * conj a`. Deduce
`rightQuotient_rigidity`: on connected open `Ω`, `f` has a right slope at every point exactly when
`f(q) = a + b*q` on `Ω`, from §3.2 applied to `T(f)` on `star '' Ω`, which is connected and open.
*Needs:* §3.2.

**Checks.**

- `f(q) = b*q`: `T(f)(q) = conj(b * conj q) = q * conj b`, with left slope `conj b`. A reflection
  that conjugates only the argument gives `q ↦ b * conj q`, whose derivative `h ↦ b * conj h` is not a
  right multiplication for any `b ≠ 0`: with `b = 1`, `h = 1` forces the slope `1`, but `h = i` gives
  `−i ≠ i = R_1(i)`.
- `b = i`: the right slope `i` of `q ↦ i*q` becomes the left slope `−i` of `q ↦ −q*i = q*conj i`.
- `Ω = {q : ‖q − i‖ < 1}`: `star '' Ω` is the ball about `−i`, open and connected.

### 3.4 The two-sided classification

Prove `twoSidedQuotient_rigidity`: on connected open `Ω`, `f` has both a left and a right slope at
every point exactly when `f(q) = a + r*q` on `Ω` with `a ∈ ℍ` and `r ∈ ℝ`. From §3.2 and §3.3 both
affine forms hold, and §2.5 at one point makes the common slope real; conversely `q ↦ a + r*q` has
derivative `r·id = L_r = R_r`. (D12, §1, p. 2.) *Needs:* §2.5, §3.2, §3.3.

**Checks.**

- `f(q) = 2 + 3q`: both slopes `3`; the classification returns `r = 3`.
- `f(q) = q*i`: left slope everywhere, no right slope; excluded.
- `f(q) = i*q*i = −t − i x + j y + k z`: its derivative sends `1 ↦ −1` and `j ↦ i j i = k i = j`; the
  slope `−1` forced by `h = 1` would send `j ↦ −j`, so `f` has neither slope and is excluded.
- `f(q) = −q`: both slopes `−1`, so the form `a + r*q` is attained with `r = −1`; the real slope is
  not restricted in sign.

### Examples

`q ↦ 1 + q*i` is left differentiable only; `q ↦ 1 + i*q` right only; `q ↦ 2 + 3q` and `q ↦ −q` both;
`q ↦ i*q*i` neither.

### Dependencies

§2; Tau Ceti's several-variable analyticity theorem; Mathlib's restriction of scalars and symmetry
of the second derivative.

## Layer 4: left and right Fueter operators and pointwise regularity

### 4.1 Operators and predicates

For a real Fréchet derivative `D : ℍ →L[ℝ] ℍ` define `FueterLeft D` as
`D(1) + i*D(i) + j*D(j) + k*D(k) = 0` and `FueterRight D` as `D(1) + D(i)*i + D(j)*j + D(k)*k = 0`,
with the units `qi`, `qj`, `qk`. Define `LeftFueterAt f q` as the existence of `D` with
`HasFDerivAt f D q` and `FueterLeft D`, `RightFueterAt f q` likewise with `FueterRight`, and
`LeftFueterOn f Ω`, `RightFueterOn f Ω` as the pointwise predicates at every point of `Ω`. When `f`
is differentiable at `q` with derivative `D`, `D(1), D(i), D(j), D(k)` are the partials
`∂ₜf, ∂ₓf, ∂ᵧf, ∂_zf`, so `FueterLeft D` is `∂̄ₗ f(q) = 0` and `FueterRight D` is `∂̄ᵣ f(q) = 0`.
(FL08, Definition 1, p. 8, which assumes `C¹`; here the derivative is only required to
exist at the point.)

Its API:

- `FueterLeft` and `FueterRight` are real-linear conditions on `D`, closed under sums and real
  scalars;
- `LeftFueterAt f q` implies `DifferentiableAt ℝ f q`, and the witness `D` is `fderiv ℝ f q`;
- `LeftFueterOn` and `RightFueterOn` are monotone in `Ω`.

**Checks.**

- `f(q) = a + q*b`: `D = R_b`, and `D(1) + i*D(i) + j*D(j) + k*D(k) = b + i i b + j j b + k k b = b − 3b = −2b`;
  left regular exactly when `b = 0`. The wrong-order expression `D(1) + D(i)*i + …` gives
  `b + b i i + b j j + b k k = −2b` as well, so this example does not separate the two operators.
- `f(q) = a + b*q`: `D = L_b`, `D(1) + D(i)*i + … = b + b i i + b j j + b k k = −2b`; right regular
  exactly when `b = 0`.
- `f(q) = t + i x`: `∂ₜf = 1`, `∂ₓf = i`, `∂ᵧf = ∂_zf = 0`, so `∂̄ₗ f = 1 + i*i = 0` and `∂̄ᵣ f = 1 + i*i = 0`:
  nonconstant and regular on both sides; its derivative at `h = j` is `0 ≠ j = R_1(j)`, so it is not a
  multiplication map and has no one-sided slope on any nonempty open set.
- `f(q) = conj q`: `∂̄ₗ f = 1 + i(−i) + j(−j) + k(−k) = 4 ≠ 0`; not regular.
- `f(q) = (t + i x)²`, or any holomorphic function of `v = t + i x`: `∂ₜf = f'(v)`, `∂ₓf = i f'(v)`, so
  `∂̄ₗ f = f'(v) + i·i f'(v) = 0`, and likewise `∂̄ᵣ f = 0` since `v` commutes with `i`.

### 4.2 Component systems

For `f = K + iL + jM + kN`, prove that `FueterLeft (fderiv ℝ f q)` is equivalent to

```text
left:  Kt − Lx − My − Nz = 0,  Lt + Kx + Ny − Mz = 0,
       Mt − Nx + Ky + Lz = 0,  Nt + Mx − Ly + Kz = 0
```

and `FueterRight (fderiv ℝ f q)` to

```text
right: Kt − Lx − My − Nz = 0,  Lt + Kx − Ny + Mz = 0,
       Mt + Nx + Ky − Lz = 0,  Nt − Mx + Ly + Kz = 0,
```

at every point where `f` is differentiable, by expanding `i*(∂ₓf)` etc. with the matrices of §1.1.

**Checks.**

- `f(q) = t + i x`: `K = t`, `L = x`, `M = N = 0`; every row of both systems is `0`.
- `f(q) = q`: `K = t`, `L = x`, `M = y`, `N = z`; the first row is `1 − 1 − 1 − 1 = −2 ≠ 0` on both sides,
  the real part of `−2b` with `b = 1`.
- `f(q) = (t + i x)*j = t j + x k`: `M = t`, `N = x`, `K = L = 0`; the left rows are
  `0, 0, Mt − Nx = 1 − 1 = 0, Nt + Mx = 0 + 0 = 0`, so left regular; the right third row is
  `Mt + Nx = 2 ≠ 0`, so not right regular. A transcription that swaps the signs of `Nx` and `Lz` in the
  third rows exchanges the verdicts.

### 4.3 Relation with quotient differentiability

Prove that on the left-affine class `q ↦ a + q*b` the left Fueter operator is the constant `−2b`,
and on the right-affine class `q ↦ a + b*q` the right Fueter operator is the constant `−2b`; so in
each one-sided affine class Fueter regularity is equivalent to zero slope, and by §3 a function with
a one-sided slope throughout a connected open set is Fueter regular on the corresponding side
exactly when it is constant. Exhibit `f(q) = t + i x` as nonconstant, regular on both sides, and
with no one-sided slope on any nonempty open set (§4.1 Checks). *Needs:* §3.2, §4.1.

**Checks.**

- `q ↦ q*i` (left slope `i`): `∂̄ₗ = −2i ≠ 0`; not left regular.
- `q ↦ 5` (slope `0`): `∂̄ₗ = ∂̄ᵣ = 0`; regular on both sides, and affine.
- `q ↦ t + i x`: regular on both sides, not quotient differentiable; so the regular class is
  strictly larger than the constants, while the quotient-differentiable regular class is the constants.

### 4.4 Closure properties and the reflection

Prove that each side's regular functions are closed under addition, real scalar multiplication,
translation of the argument, real dilation of the argument `q ↦ f(r*q)` for `r ∈ ℝ`, and the matching
constant multiplication: left regularity is preserved by `f ↦ f*b`, right regularity by `f ↦ b*f`,
for constant `b`. All follow from the ordered equation and the chain rule; none follows from the
quotient criteria of §2.3, and no closure under products or compositions of regular functions is
claimed (FL08, p. 8). Prove that `T(f)(q) = conj(f(conj q))` is left regular at
`conj q` exactly when `f` is right regular at `q`, and right regular at `conj q` exactly when `f` is
left regular at `q`, with the derivative `D' = D(Tf)(conj q)` satisfying
`D'(1) + i D'(i) + j D'(j) + k D'(k) = conj(D(1) + D(i) i + D(j) j + D(k) k)` (FL08, Proposition 2,
p. 8). Regularity of `f` on `Ω` corresponds to regularity of `T(f)` on `star '' Ω`.
*Needs:* §4.1.

**Checks.**

- `f(q) = t + i x` and `b = j`: `f*b = t j + x k` has `∂ₜ = j`, `∂ₓ = k`, `∂̄ₗ(f*b) = j + i k = j − j = 0`,
  left regular; `b*f = j t − k x` has `∂̄ₗ(b*f) = j + i(−k) = 2j ≠ 0`. Left regularity is preserved by
  right constant multiplication and not by left constant multiplication.
- `f(q) = t + i x`: `T(f)(q) = conj(t − i x) = t + i x = f`, regular on both sides, consistent with the
  reflection exchanging the sides.
- `f(q) = q*i` (not left regular) and `T(f)(q) = conj(conj(q)*i) = −i*q`, with `∂̄ᵣ(−i q) = −i(1 + i i + j j + k k) = 2i ≠ 0`:
  not right regular, as the reflection rule predicts.
- `f(q) = f₀(2q)` with `f₀ = t + i x`: `f = 2t + 2i x`, regular. Composition with multiplication by
  a nonreal constant is not a closure rule: `q*j = −y − i z + j t + k x`, so `q ↦ f₀(q*j) = −y − i z`,
  whose `∂̄ₗ = j·(−1) + k·(−i) = −j − j = −2j ≠ 0`.

### Examples

`t + i x`, `(t + i x)²`, `(t + i x)*j` are left regular; `j*(t + i x)` is right regular only;
`q`, `conj q`, `q*i` are regular on neither side.

### Dependencies

§1.1, §2.1, §3.2; Mathlib's `HasFDerivAt` and chain rule.

## Layer 5: forms, Cauchy theorem and Cauchy–Fueter formula

### 5.1 The forms `dq` and `Dq`

Define `dq = dt + i dx + j dy + k dz` and the ordered quaternion-valued 3-form
`Dq = dx∧dy∧dz − i dt∧dy∧dz − j dt∧dz∧dx − k dt∧dx∧dy` as alternating maps on `(Fin 4 → ℝ)` with
values in `ℍ`, through DifferentialGeometry Layer 0 for their smooth-coefficient reading. `Dq` is
the form `Dx` of FL08, equation (18), p. 9, since `dt∧dz∧dx = −dt∧dx∧dz`. Prove the value
of `Dq` on the raw `insertNth` tangent triples of §5.3, the effect of quaternion conjugation
`σ(q) = conj q` on it, and the pointwise identity `Σᵢ ∂ᵢ(eᵢ * f) = ∂̄ₗ f`, `Σᵢ ∂ᵢ(f * eᵢ) = ∂̄ᵣ f`, which is
`d(Dq·f) = (∂̄ₗ f) dV` and `d(f·Dq) = (∂̄ᵣ f) dV` for `C¹` coefficients (FL08, Proposition 4, p. 9,
lines 379–384).

**Checks.**

- `Dq(e_x, e_y, e_z) = 1`, `Dq(e_t, e_y, e_z) = −i`, `Dq(e_t, e_x, e_z) = +j` (since
  `dt∧dz∧dx (e_t, e_x, e_z) = −1`), `Dq(e_t, e_x, e_y) = −k`; so `Dq` on the triple obtained by deleting
  the `i`-th coordinate direction is `(−1)^i eᵢ`. A sign error in the `j` term gives `−j` on the third
  triple.
- `σ*Dq = −conj(Dq)`: `σ = diag(1,−1,−1,−1)` sends `dx∧dy∧dz` to `−dx∧dy∧dz` and fixes the three
  terms containing `dt`; the result is `−(dx∧dy∧dz + i dt∧dy∧dz + j dt∧dz∧dx + k dt∧dx∧dy) = −conj(Dq)`.
- `f ≡ 1`: `Σᵢ ∂ᵢ(eᵢ * 1) = 0 = ∂̄ₗ 1`; `f(q) = q`: `Σᵢ ∂ᵢ(eᵢ * q) = Σᵢ eᵢ eᵢ = 1 − 3 = −2 = ∂̄ₗ q`.
- the 1-form `dq` on the unit square of §2.4: `∮ q dq = 2k` and `∮ dq q = −2k`.

### 5.2 The raw affine face functional

For every affine map `A(u) = p + L(u)` on `[0,1]⁴`, `L` linear and possibly singular or of negative
determinant, and every continuous quaternion-valued coefficient, define the raw boundary
functional `Raw(A, ω)` as the sum over the eight coordinate facets of `[0,1]⁴` of the Bochner
integral over `Icc (0 : Fin 3 → ℝ) 1` of the pulled-back coefficient against the ordered
chart-tangent value of `Dq` on that facet, with the parameter-domain orientation of each facet
(outward-first exactly when `det L > 0`). The adapter handles the four ordered coefficients

```text
Dq(v) * f(φ(u)),   f(φ(u)) * Dq(v),   G(φ(u)) * Dq(v) * f(φ(u)),   f(φ(u)) * Dq(v) * G(φ(u)),
```

products being formed in `ℍ` before integration. For a nondegenerate face chart `φ : [0,1]³ → F`
with constant 3-dimensional Jacobian `Jφ` and oriented orthonormal tangent triple `v̂`, the pulled
coefficient is `A(u) = Jφ * B(φ(u))` for each geometric ordered coefficient `B`; the chart tangents
contribute `Jφ` exactly once. For invertible `L` write `C = A([0,1]⁴)`; the raw orientation agrees
with the geometric outward orientation exactly when `det L > 0`, and the geometric Cauchy formula
of §5.6 is stated for `det L > 0`.

Its API:

- bound: `‖∫ A‖ ≤ sup_u ‖A(u)‖ = Jφ · sup_{q∈F} ‖B(q)‖ = vol₃(F) · sup_F ‖B‖`, the parameter cube having
  volume one; existence of every face integral from continuity;
- degenerate face charts: alternation makes the chart-tangent value of `Dq` zero, so the face
  integral is `0`;
- reparametrization: precomposition with `ρ(u₀,u₁,u₂,u₃) = (1−u₀, u₁, u₂, u₃)` negates `Raw`;
- reflection: `Raw(σ∘A, ω) = Raw(A, σ*ω)` for every pulled-back coefficient form `ω`, where
  `σ*Dq = −conj(Dq)`; `ρ` and `σ` both have determinant `−1`, so `σ∘A∘ρ` has positive determinant
  whenever `A` does and parametrizes the reflected parallelepiped with positive orientation;
- rectangular subdivision additivity and cancellation of paired internal facets.

**Checks.**

- `A = id` on `[0,1]⁴` and coefficient `Dq·1`: each pair of opposite facets contributes `+eᵢ` and `−eᵢ`
  times the face volume `1`, so `Raw = 0`; a functional giving both facets of a pair the same sign
  gives `2(1 + i + j + k)`.
- `A = id` precomposed with `ρ`: `Raw(A∘ρ, Dq·f) = −Raw(A, Dq·f)`; on `f(q) = t` with `A = id`, the
  `t`-facets contribute `1·1 − 0·1 = 1` to `Raw(id, Dq·f)` and `−1` after `ρ`.
- a face chart collapsing `[0,1]³` onto a segment: `Jφ = 0`, `Dq` on the tangent triple is `0`, and the
  face integral is `0` whatever the coefficient.
- `σ∘id` on `[0,1]⁴`, coefficient `Dq·1`: `Raw(σ, Dq·1) = Raw(id, σ*Dq·1) = −Raw(id, conj(Dq)·1) = 0`,
  and `det σ = −1`.

### 5.3 Axis-box boundary match and the face-integral comparisons

Expose the axis-box boundary sum in the exact form of Mathlib's divergence theorem: for
`a, b : Fin 4 → ℝ` and a family of face integrands `F i : (Fin 4 → ℝ) → ℍ`, define
`boxBoundarySum a b F = Σᵢ (∫ x in face i, F i (frontFace i x) − ∫ x in face i, F i (backFace i x))`
with `face i = Icc (a ∘ Fin.succAbove i) (b ∘ Fin.succAbove i)`, `frontFace i x = Fin.insertNth i (b i) x`
and `backFace i x = Fin.insertNth i (a i) x`. Prove that for `a < b` coordinatewise, `Raw` of the
axis box `A(u) = a + (b − a)·u` with coefficient `Dq·f` equals `boxBoundarySum a b (fun i x => eᵢ * f(χ⁻¹ x))`
where `χ = toTuple`, and likewise for the other three ordered coefficients: match each of the eight
adapter facets to one front or back term by the 3-dimensional change of variables of §5.4, the
face Jacobian `∏_{j≠i} (b j − a j)` occurring exactly once; since `Dq` on the raw `insertNth` triple is
`(−1)^i eᵢ`, reflect the front-face parameter exactly when `i` is odd and the back-face parameter
exactly when `i` is even, giving outward-first coefficient `+eᵢ` on every front face and `−eᵢ` on
every back face, hence the native `front − back` sum. This match is an equality of Bochner integrals.

Separately, prove the equality of each Bochner face integral with the native `BoxIntegral` for
continuous coefficients, by `ContinuousOn.hasBoxIntegral` and `Box.coe_ae_eq_Icc`; this is a
compatibility theorem and not an ingredient of the match or of the Cauchy theorems. Separately
again, for smooth coefficients prove coefficientwise in `(1, i, j, k)` that each face integral agrees
with `integralTopForm` (DifferentialGeometry 5.2) of the pulled-back top form on that individual
oriented facet: represent the parameter cube `I = Icc (0 : Fin 3 → ℝ) 1` as its own model with
corners by `ModelWithCorners.ofConvexRange` (its range is convex with nonempty interior, with a
continuous coordinate clamp as retraction), whose identity map is one global chart on the closed
cube; give each facet its own model, affine chart and outward-first orientation; and apply
`integralTopForm_of_tsupport_subset_chart` coefficientwise on that chart. Prove pointwise naturality
of pullback and exterior derivative for the fixed affine map (the generic pullback theorem has
stronger smoothness hypotheses). The entire cubical boundary is never treated as a manifold.
*Needs:* §5.1, §5.2, §5.4, Mathlib `integral_divergence_of_hasFDerivAt_off_countable` (for the form
of the sum), `ContinuousOn.hasBoxIntegral`, `Box.coe_ae_eq_Icc`, `ModelWithCorners.ofConvexRange`,
DifferentialGeometry 5.2.

**Checks.**

- the unit box `a = 0`, `b = 1` and `F i x = eᵢ`: `boxBoundarySum = Σᵢ (eᵢ − eᵢ) = 0`.
- the unit box and `F i x = eᵢ * x i`: front faces have `x i = 1`, back faces `x i = 0`, so the sum is
  `Σᵢ eᵢ = 1 + i + j + k`; a definition summing back minus front gives the negative.
- `a = 0`, `b = (2,1,1,1)`, `F i x = eᵢ`: the `t`-faces have volume `1` and the other three faces volume
  `2`; the sum is again `0`, and the face Jacobians `1, 2, 2, 2` each occur once in the match.
- `i = 1` (the `x`-direction): `Dq` on `(e_t, e_y, e_z)` is `−i`, so the front face `x = b 1` is
  reflected to give `+i` and the back face is left alone to give `−i`; without the reflection rule the
  `x`-pair would enter with the sign of `(−1)^1`.

### 5.4 Affine change of variables

For every finite `n`, an invertible continuous linear `L : (Fin n → ℝ) →L[ℝ] (Fin n → ℝ)`, a
translation `p`, the affine map `A(u) = p + L(u)`, a complete real normed space `E`
(`[NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]`) and any function
`w : (Fin n → ℝ) → E`, prove the totalized Bochner identity

```text
∫ u in Icc (0 : Fin n → ℝ) 1, |det L| • w (A u) = ∫ x in A '' Icc 0 1, w x.
```

There are no continuity, measurability or integrability hypotheses on `w`: `A` is a measurable
equivalence transporting `volume` to `|det L|⁻¹ • volume` by
`Real.map_linearMap_volume_pi_eq_smul_volume_pi` and translation invariance, so `integral_map`,
`setIntegral_map` and `Measure.restrict_map` give the identity, and when one side is not integrable
neither is the other and both are `0`. For quaternion-valued coefficients use `E = ℍ` and
`w(x) = f(χ⁻¹ x)`, keeping the codomain quaternion-valued. The theorem is used with `n = 3` for face
scaling, parameter reflections and the axis-face match, and with `n = 4` for bulk parallelepiped
integration and the determinant/cofactor pullback. *Needs:* Mathlib
`Real.map_linearMap_volume_pi_eq_smul_volume_pi`, `integral_map`, `setIntegral_map`.

**Checks.**

- `n = 1`, `L = 2`, `p = 0`: `∫₀¹ 2 w(2u) du = ∫₀² w`.
- `n = 1`, `L = −1`, `p = 0`: `∫₀¹ w(−u) du = ∫_{−1}^{0} w`; a signed-determinant version would give the
  negative.
- `n = 2`, `L = diag(2,3)`, `w ≡ 1`: both sides are `6`.
- `n = 1`, `L = 1`, `w(x) = 1/x` on `[0,1]` (not integrable): both sides are the junk value `0`.

### 5.5 The Cauchy theorems

Prove `left_cauchy_box`: for `a ≤ b` in `Fin 4 → ℝ`, `f` continuous on the closed box `χ⁻¹(Icc a b)` and
left regular at every point of the open box, `boxBoundarySum a b (fun i x => eᵢ * f(χ⁻¹ x)) = 0`;
and `right_cauchy_box`, with integrands `f(χ⁻¹ x) * eᵢ` under right regularity. Apply
`integral_divergence_of_hasFDerivAt_off_countable` to the field `Fᵢ(x) = eᵢ * f(χ⁻¹ x)` (respectively
`f(χ⁻¹ x) * eᵢ`): its divergence at an interior point is `∂̄ₗ f` (respectively `∂̄ᵣ f`) by §5.1, which
vanishes, so the divergence is integrable and the boundary sum is `0`. The hypotheses are exactly
continuity on the closed box and pointwise differentiability with the Fueter equation in its
interior; no continuity of the derivative is used. (FL08, Corollary 8, p. 9, stated
there for `C¹` functions and piecewise `C¹` boundaries.) Extend to affine parallelepipeds `C = A([0,1]⁴)`
with `det A > 0`: `Raw(A, Dq·f) = 0` for `f` continuous on `C` and left regular on its interior, and
`Raw(A, f·Dq) = 0` under right regularity, by the cofactor pullback of §5.4 with `n = 4`, the
naturality of §5.3 and the box theorem. The right statements also follow from the left ones by the
reflection `T` and the laws of §5.2 applied to `σ∘A∘ρ`. *Needs:* §4.1, §5.1–§5.4, Mathlib
`integral_divergence_of_hasFDerivAt_off_countable`.

**Checks.**

- `f ≡ c`: the boundary sum is `Σᵢ (eᵢ c − eᵢ c) = 0` directly.
- `f(q) = t + i x` on the unit box: left regular, and the sum vanishes; computed directly, the
  `t`-pair contributes `(1 + i/2) − i/2 = 1`, the `x`-pair contributes `i·(1/2 + i) − i·(1/2) = −1`,
  and the `y`- and `z`-pairs contribute `0`; total `0`.
- `f(q) = q` on the unit box: not regular, and the sum is `Σᵢ eᵢ eᵢ · 1 = −2 ≠ 0`; a theorem without the
  Fueter hypothesis would be false.
- a degenerate box with `a 0 = b 0`: the open box is empty, the hypothesis is vacuous, and both sides
  of the divergence theorem are `0`.

### 5.6 The kernel and the Cauchy–Fueter formulas

Define `cauchyFueterKernel q q₀ = (q − q₀)⁻¹ / ‖q − q₀‖²`, so `G(r) = r⁻¹/‖r‖² = conj r/‖r‖⁴` off `0`
and `G(0) = 0`. Prove both Fueter equations `∂̄ₗ G = 0` and `∂̄ᵣ G = 0` off `0` (FL08, Proposition 3,
p. 8), the homogeneity `G(λr) = λ⁻³ G(r)` for `λ > 0`, and the pointwise kernel
identity

```text
Σᵢ ∂ᵢ (G(q − q₀) * eᵢ * f(q)) = (∂̄ᵣ G)(q − q₀) * f(q) + G(q − q₀) * (∂̄ₗ f)(q) = 0
```

at every `q ≠ q₀` where `f` is left regular; this is the closedness of the kernel-weighted 3-form,
not a product-closure statement for regular functions.

For the point singularity take the cutoff `ψ(s) = Real.smoothTransition (2s − 1)`, zero for
`s ≤ 1/2` and one for `s ≥ 1`, smooth and monotone, and `ε > 0` with the closed ball of radius `ε` about
`q₀` inside the open box. The field `x ↦ G(q − q₀) * eᵢ * f(q) * ψ(‖q − q₀‖/ε)`, `q = χ⁻¹ x`, is
continuous on the closed box, differentiable at every interior point, and its divergence is
supported on the annulus `ε/2 ≤ ‖q − q₀‖ ≤ ε`, where it equals
`G(r) * (Σᵢ eᵢ ∂ᵢψ) * f(q) = ε⁻¹ ψ'(‖r‖/ε) * ‖r‖⁻³ * f(q)` for `r = q − q₀`, because
`Σᵢ eᵢ ∂ᵢ(ψ(‖r‖/ε)) = ε⁻¹ ψ'(‖r‖/ε) r/‖r‖` and `G(r) * r = ‖r‖⁻²`. It is integrable since `f` is
continuous on the compact annulus. The radial mass is computed in `EuclideanSpace ℝ (Fin 4)`
through `Quaternion.linearIsometryEquivTuple` and `PiLp.volume_preserving_toLp`, with the radial
variable `‖χ⁻¹ x − q₀‖` (never the sup norm of the tuple): by `integral_fun_norm_addHaar`,
`∫ ε⁻¹ ψ'(‖r‖/ε) ‖r‖⁻³ dr = 4 · volume(ball 0 1) · ∫₀^∞ ε⁻¹ ψ'(s/ε) ds = 4 · (π²/2) · 1 = 2π²`, using
`volume_ball_of_dim_even` with `k = 2`. The divergence theorem on the box for the cutoff field,
whose boundary sum equals that of `G * eᵢ * f` since `ψ = 1` on the boundary, gives
`boxBoundarySum = 2π² f(q₀) + ∫ ε⁻¹ ψ'(‖r‖/ε) ‖r‖⁻³ (f(q) − f(q₀))`, and the last term is bounded by
`2π²` times the oscillation of `f` on the annulus, which tends to `0` with `ε`. Hence
`left_cauchyFueter_box`: for `f` continuous on the closed box, left regular on the open box, and
`q₀` in the open box,

```text
f(q₀) = (1/(2π²)) · boxBoundarySum a b (fun i x => G(χ⁻¹ x − q₀) * eᵢ * f(χ⁻¹ x)),
```

that is `f(q₀) = (1/(2π²)) ∫_{∂C} G(q − q₀) Dq f(q)`; and `right_cauchyFueter_box`:

```text
f(q₀) = (1/(2π²)) · boxBoundarySum a b (fun i x => f(χ⁻¹ x) * eᵢ * G(χ⁻¹ x − q₀)),
```

that is `f(q₀) = (1/(2π²)) ∫_{∂C} f(q) Dq G(q − q₀)`, for `f` right regular, with `f` to the left of
`Dq` and the kernel to its right (FL08, Theorem 9, p. 10; Sudbery 1979). The right
formula is proved either directly, with the field `f * eᵢ * G` and the right kernel identity
`(∂̄ᵣ f) * G + f * (∂̄ₗ G) = 0`, or from the left formula by the reflection `T` at `conj q₀`, which
conjugates the kernel (`conj G(r) = G(conj r)`) and reverses coefficient order. Prove also that the
same boundary sums are `0` when `q₀` lies outside the closed box, by §5.5 applied to the kernel-weighted
field. Extend both formulas to affine parallelepipeds `C = A([0,1]⁴)` with `det A > 0` and `q₀` in the
interior of `C`, with `Raw(A, G·Dq·f)` and `Raw(A, f·Dq·G)` in place of the box sums; the reflected
set `σ '' C` is parametrized by the positive-determinant map `σ∘A∘ρ`, and `Raw(σ∘A, ω) = Raw(A, σ*ω)`
with the `ρ` law supplies the sign. General rectifiable chains, Morera theorems and primitives are
not part of this roadmap. *Needs:* §4.1, §4.4, §5.1–§5.5, Mathlib `Real.smoothTransition`,
`integral_fun_norm_addHaar`, `InnerProductSpace.volume_ball_of_dim_even`,
`Quaternion.linearIsometryEquivTuple`, `PiLp.volume_preserving_toLp`.

**Checks.**

- `G(1) = 1`, `G(2) = 1/8 = 2⁻³ G(1)`, `G(i) = i⁻¹/1 = −i`, `G(0) = 0`.
- for `G_s(r) = conj r · ‖r‖⁻ˢ`, `∂̄ₗ G_s = (4 − s) ‖r‖⁻ˢ`: the first term is `Σᵢ eᵢ conj eᵢ = 4` times
  `‖r‖⁻ˢ`, the second is `−s ‖r‖^(−s−2) (Σᵢ eᵢ rᵢ) conj r = −s ‖r‖⁻ˢ`. So `s = 4` is regular and the
  plausible wrong kernel `r⁻¹ = conj r/‖r‖²` (`s = 2`) is not.
- `ψ(1/2) = 0`, `ψ(1) = 1`, `ψ(3/4) = Real.smoothTransition (1/2) = 1/2`.
- radial mass: `4 · (π²/2) · 1 = 2π²`; with the sup norm of the tuple as radial variable the level sets
  are cubes and the value changes.
- `f ≡ c` on the unit box with `q₀` its centre: the formula gives `c`, so the boundary sum of
  `G * eᵢ * c` is `2π² c`; a normalization `1/π²` or `1/(4π²)` fails on this example.
- `q₀` outside the closed box, `f ≡ 1`: the boundary sum of `G(q − q₀) eᵢ` is `0`.

### Examples

For `f ≡ 1` on the unit box about `q₀ = (1/2, 1/2, 1/2, 1/2)` the formula reads
`1 = (1/(2π²)) Σᵢ (∫_{front i} G eᵢ − ∫_{back i} G eᵢ)`. For `f(q) = t + i x`, both Cauchy theorems hold
on every box and the formula reproduces `f(q₀)` at every interior point.

### Dependencies

§4; §5.1–§5.4 within the layer; Mathlib's divergence theorem, Lebesgue change of variables,
polar-coordinates integral and ball volume; DifferentialGeometry Layers 0–2 and 5.2 for §5.3 only.

## Layer 6: regularity consequences and estimates

### 6.1 Smoothness and harmonicity

From the box formula of §5.6, prove that a left (right) regular function on an open `Ω` is `C^∞`
on `Ω`: at each `q₀ ∈ Ω` choose a box about `q₀` inside `Ω`; the kernel and all its parameter
derivatives are bounded on each compact subset of the open box since the pole stays at positive
distance from the faces, and `hasFDerivAt_integral_of_dominated_of_fderiv_le` differentiates under
the finite face integrals, inductively. Then prove `leftFueter_harmonic` and `rightFueter_harmonic`:
`Δ f q = 0` for every `q ∈ Ω`, with Mathlib's Laplacian on `ℍ → ℍ`, which is componentwise by
`laplacian_eq_iteratedFDeriv_orthonormalBasis`. For left regular `f` apply the conjugate operator
`g ↦ ∂ₜg − i ∂ₓg − j ∂ᵧg − k ∂_zg` to `g = ∂̄ₗ f = 0`: with constant unit coefficients and equality of
mixed partials, `(∂ₜ − i∂ₓ − j∂ᵧ − k∂_z)(∂ₜ + i∂ₓ + j∂ᵧ + k∂_z) f = Δ f`, the cross terms cancelling in
pairs (`−ij ∂ₓ∂ᵧ − ji ∂ᵧ∂ₓ = 0`) and `−i·i ∂ₓ² = ∂ₓ²`. For right regular `f` apply
`g ↦ ∂ₜg − (∂ₓg) i − (∂ᵧg) j − (∂_zg) k` to `g = ∂̄ᵣ f`. (FL08, equation (17), p. 8, and
the remark at p. 10.) *Needs:* §5.6, Mathlib `hasFDerivAt_integral_of_dominated_of_fderiv_le`,
the `Laplacian` instance and `laplacian_eq_iteratedFDeriv_orthonormalBasis`.

**Checks.**

- `f(q) = t + i x`: `Δ f = 0`.
- `f(q) = ‖q‖² = t² + x² + y² + z²`: `Δ f = 8 ≠ 0`, and `∂̄ₗ f = 2t + 2i x + 2j y + 2k z = 2q ≠ 0`; not
  regular and not harmonic.
- `f(q) = t² − x²`: harmonic (`Δ f = 2 − 2 = 0`) but `∂̄ₗ f = 2t − 2i x ≠ 0`; harmonic does not imply
  regular, so the implication is one-directional.
- the kernel `G` off `0`: harmonic, since `G = −½ ∇(‖r‖⁻²)` and `‖r‖⁻²` is harmonic on `ℍ ∖ {0}`
  (FL08, Proposition 3).

### 6.2 Real analyticity

Prove `leftFueter_realAnalytic` and `rightFueter_realAnalytic`: a left (right) regular function on
an open `Ω` is `AnalyticOnNhd ℝ` on `Ω`. For `r = q − q₀` on the boundary of a box inside `Ω` and a
parameter increment `h`, write

```text
G(r − h) = (conj r − conj h) / ‖r‖⁴ · (1 − u)⁻²,   u = (2⟪r,h⟫ − ‖h‖²)/‖r‖²,
(1 − u)⁻² = Σₙ₌₀^∞ (n+1) uⁿ,
```

valid when `|u| < 1`; on the ball of increments of radius less than `δ(√2 − 1)` with
`δ = dist(q₀, ∂C) > 0`, one has `|u| ≤ 2‖h‖/δ + (‖h‖/δ)² < 1`. Regroup the uniformly and absolutely
summable terms by total degree in `h`, integrate each coefficient over the finite faces against
`eᵢ f`, and prove that the resulting series has a summable majorant and represents the box formula
on a smaller ball: a `HasFPowerSeriesOnBall` statement for `f` at `q₀`. The derivative estimates of
§6.4 are not used for this, and arbitrary `C^∞` bounds would not give it. (FL08, p. 10,
lines 448–451; Sudbery 1979.) *Needs:* §5.6, §6.1, Mathlib `HasFPowerSeriesOnBall`.

**Checks.**

- `‖r − h‖² = ‖r‖²(1 − u)`: with `r = 1`, `h = 1/2`: left side `1/4`, `u = 1 − 1/4 = 3/4`, right side `1/4`.
- `r = 1`, `h = i/2`: `⟪r,h⟫ = 0`, `u = −1/4`, `‖r − h‖² = 1 + 1/4 = 5/4 = 1 − u`.
- `h = 0`: `u = 0` and the series reduces to `G(r)`.
- the bound `|u| ≤ 2‖h‖/δ + (‖h‖/δ)²` at `‖h‖ = δ/4`: `|u| ≤ 1/2 + 1/16 < 1`.

### 6.3 The uniqueness principle

Prove `leftFueter_eqOn` and `rightFueter_eqOn`: two left (right) regular functions on a connected
open `Ω` that agree on a nonempty open `U ⊆ Ω` agree on `Ω`, by §6.2 and
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`. Equivalently, a regular function all of whose
iterated real derivatives vanish at one point of `Ω` vanishes on `Ω`. An accumulating zero set does
not suffice. *Needs:* §6.2, Mathlib `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

**Checks.**

- `Ω` the union of two disjoint open balls, `f = 0` on one and `f = 1` on the other, `g = 0`: both
  regular, agreeing on the first ball, differing on `Ω`; connectedness is necessary.
- `f(q) = t + i x` and `g = 0` on `Ω = ℍ`: they agree on the plane `{t = x = 0}`, which has accumulation
  points everywhere on itself, yet `f ≠ 0`; agreement on a set with accumulation points is not enough.
- `f(q) = (t + i x)²` and `g(q) = (t + i x)²` on `Ω = ℍ`, `U` any ball: the conclusion is the trivial equality.

### 6.4 Derivative representation and the universal estimate

For a box `C` and every `m`, prove the representation of `iteratedFDeriv ℝ m f q` for every
`q` in the open box as a continuous-multilinear-valued Bochner integral over the finite face
charts,

```text
iteratedFDeriv ℝ m f q = (2π²)⁻¹ · Σ_F ∫_{Icc 0 1} D^m[q ↦ G(φ_F(u) − q)] * Dq(v̂_F) * f(φ_F(u)) * Jφ_F du,
```

where `D^m[q ↦ G(φ_F(u) − q)]` is the iterated real derivative of the parameter function, including
the chain-rule sign `(−1)^m`, by induction on `m` with `iteratedFDeriv_succ_eq_comp_left` fixing the
currying at each step and `hasFDerivAt_integral_of_dominated_of_fderiv_le` differentiating under
the integral, with a common-neighbourhood derivative bound and an integrable dominator on each face
for each compact `K` inside the open box. Regrouped power-series coefficients are not used for this
identity. Then prove `leftFueter_iteratedFDeriv_bound` and `rightFueter_iteratedFDeriv_bound`: for
each `m` there is `C_m > 0`, depending on `m` alone, such that for every left (right) regular `f` on
a set `Ω`, every `q₀`, every `R > 0` with `closedBall q₀ R ⊆ Ω`, and every `M` with `‖f q‖ ≤ M` on
that ball,

```text
‖iteratedFDeriv ℝ m f q₀‖ ≤ C_m · R⁻ᵐ · M.
```

Use the homogeneity `G(λr) = λ⁻³ G(r)`, hence `‖D^m G(r)‖ ≤ c_m ‖r‖^(−3−m)` with
`c_m = sup_{‖u‖=1} ‖D^m G(u)‖ < ∞` by compactness of the unit sphere; choose the axis-aligned cube of
side `R` centred at `q₀`, whose vertices are at distance `R·√4/2 = R` from `q₀`, so that it lies in
`closedBall q₀ R`; its faces are at distance `R/2` from `q₀`, its face Jacobians scale as `R³` and the
differentiated kernel on them is bounded by `c_m (R/2)^(−3−m)`; the constant depends on `m` and the
dimension only, never on `f`, `q₀`, `R` or `Ω`, and no sharp value is required. *Needs:* §5.6, §6.1,
Mathlib `iteratedFDeriv_succ_eq_comp_left`, `hasFDerivAt_integral_of_dominated_of_fderiv_le`.

**Checks.**

- `m = 0`: the estimate is `‖f(q₀)‖ ≤ C_0 M`, true with `C_0 = 1`; a claimed `C_0 < 1` is refuted by `f ≡ 1`.
- `m = 1`, `f(q) = t + i x`, `q₀ = 0`: `‖iteratedFDeriv ℝ 1 f 0‖ = 1` and `M = R` on the ball of radius `R`
  (attained at `q = R`), so `1 ≤ C_1 R⁻¹ R` forces `C_1 ≥ 1`.
- `f ≡ 1`: every derivative of order `m ≥ 1` is `0`, and the bound holds with any `C_m`.
- `R` replaced by `0`: `R⁻¹ = 0` is the junk value and the bound `‖D f(q₀)‖ ≤ 0` is false for
  `f = t + i x`; the hypothesis `R > 0` is necessary.
- the cube of side `R` centred at `q₀` has vertices at distance `R√4/2 = R` from `q₀`, so it lies in
  `closedBall q₀ R`; a cube of side `2R` does not.

### 6.5 Reflection of the regularity consequences

State the domain change for every statement of this layer: regularity of `f` on `Ω` corresponds to
regularity of `T(f)` on `star '' Ω` (§4.4); the reflected box is `σ '' C`, parametrized with positive
orientation by `σ∘A∘ρ`; and the right-sided conclusions follow from the left ones at `conj q₀` with
the factor order tracked, or directly from the right formulas of §5.6. *Needs:* §4.4, §5.6.

**Checks.**

- `f(q) = t + i x`: `T(f) = f`, and each statement of the layer for `f` coincides with its reflection.
- `Ω` the ball about `i`: `star '' Ω` is the ball about `−i`, and `dist(conj q₀, ∂(σ '' C)) = dist(q₀, ∂C)`.
- `f(q) = (t + i x) * j = t j + x k`, left regular: `T(f)(q) = conj((t − i x) j) = conj(t j − x k) = −t j + x k`,
  with `∂ₜ = −j`, `∂ₓ = k`, so `∂̄ᵣ(Tf) = −j + k i = −j + j = 0` and `∂̄ₗ(Tf) = −j + i k = −2j ≠ 0`:
  right regular and not left regular, as §4.4 predicts.

### Examples

`t + i x` and every holomorphic function of `t + i x` are real analytic, harmonic, determined by
their values on any open set, and satisfy the derivative estimates with the constants of §6.4.

### Dependencies

§5.6; Mathlib's parametric integrals, iterated derivatives, Laplacian, analytic functions and
identity principle.

## Downstream consumers

No roadmap on the main branch consumes this one. The natural consumers are a Part II roadmap on
power and Laurent series of regular functions, Liouville and Morera theorems and homogeneous
regular functions, and a Clifford-analysis roadmap generalising the Fueter operator to `ℝⁿ`.

## References

- **FL08**: Igor Frenkel and Matvei Libine, *Quaternionic analysis, representation theory and
  physics*, [arXiv:0711.2699](https://arxiv.org/abs/0711.2699) (Adv. Math. 218 (2008), 1806–1877).
  Locators (page, item and equation numbers) refer to the arXiv version v5: Definition 1, Propositions 2–4,
  Corollaries 5 and 8, Lemma 6, Proposition 7 and Theorem 9 of §2.
- **D12**: Omar Dzagnidze, *On the differentiability of quaternion functions*,
  [arXiv:1203.5619](https://arxiv.org/abs/1203.5619); §1, p. 2 for the two one-sided quotient
  limits and the statement of the classification of the one- and two-sided differentiable functions.
- **Sudbery 1979**: A. Sudbery, *Quaternionic analysis*, Math. Proc. Cambridge Philos. Soc. 85
  (1979), 199–225, [doi:10.1017/S0305004100055638](https://doi.org/10.1017/S0305004100055638);
  Theorem 1 for the rigidity classification, and the Cauchy theorem and Cauchy–Fueter integral
  formula with the 3-form `Dq`. Cited by locator only.
- Mathlib and Tau Ceti declarations as listed in the supplier contracts, at the pinned revisions.
