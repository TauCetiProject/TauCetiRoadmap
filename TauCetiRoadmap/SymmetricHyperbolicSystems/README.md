# Roadmap: linear symmetric hyperbolic systems

**Summary.** Build the classical theory of linear first-order systems

    A⁰(t,x) ∂ₜu + Σⱼ Aʲ(t,x) ∂ⱼu + B(t,x) u = F(t,x),    u(0,·) = u₀,

on `ℝ × ℝⁿ` that are symmetric hyperbolic in the sense of Friedrichs: every `Aʲ(t,x)` is
symmetric and `A⁰(t,x)` is symmetric and uniformly positive. The method is Friedrichs' energy
method together with his difference method (F. John, *Partial Differential Equations*, Ch. 5,
§3 (a) and (b)); no Fourier analysis and no Sobolev spaces are used. The end theorems are, for
coefficients that are smooth with bounded derivatives of every order and for smooth compactly
supported `u₀` and `F`: existence of a `C¹` solution of the Cauchy problem on `[0,T]`, compactly
supported in `x` (§6.2 for `A⁰ = 1`, §7.3 in general); uniqueness among all `C¹` solutions and
the domain of dependence with an explicit propagation speed (§2.2, §2.3); the `L²` energy
estimate (§2.3); and convergence of Friedrichs' scheme under the Courant–Friedrichs–Lewy
condition (§6.3). Along the way the roadmap builds reusable material: the criterion "continuous
partial derivatives imply `C¹`" on Euclidean space (§1.1), a toolkit for grid functions on
`hℤⁿ` with discrete norms, summation by parts, the discrete Leibniz rule, a discrete Sobolev
inequality and multilinear interpolation (Layer 3), and the positive-weights lemma (§4.2). The
roadmap is this README; `Suggested.lean` states the headline definitions and theorems.

## Scope and ownership

This roadmap owns, on `ℝ × ℝⁿ` with `n ≥ 1` for the existence theory: linear first-order systems
for an unknown in `ℝᴺ` with `N × N` real matrix coefficients; symmetric
hyperbolicity; classical (`C¹`) solutions; the energy identity, the weighted energy inequality,
finite propagation speed, uniqueness and the `L²` energy estimate; grid functions on the
lattice `hℤⁿ` with their difference quotients, discrete `ℓ²` norms, summation by parts,
discrete Leibniz rule, discrete Sobolev inequality and multilinear interpolation; Friedrichs'
scheme, its stability and the higher-order discrete bounds; existence of classical solutions
and convergence of the scheme; bounds for the derivatives of the inverse square root of a positive definite matrix-valued
function, and the reduction of a general `A⁰` to `A⁰ = 1`.

- **PDE** owns the scalar elliptic and parabolic theory, the Sobolev and Besov spaces and the
  Strichartz estimates for the wave equation (its Layer 8). Nothing here consumes it and it
  consumes nothing here: the wave equation appears in this roadmap only as an example, through
  its first-order reduction, and every statement here is about classical solutions.
- **OneParameterSemigroups** owns strongly continuous semigroups and their generators. The
  evolution here is non-autonomous and is constructed directly; no generator of a symmetric
  hyperbolic operator is stated here.
- Outside this roadmap: quasilinear and nonlinear symmetric hyperbolic systems (Kato, Majda);
  the `Hˢ` theory of hyperbolic systems; weak and distributional solutions; initial-boundary
  value problems; strictly hyperbolic systems without a symmetrizer; Cauchy–Kowalevski and
  Holmgren; rates of convergence of difference schemes; and the case `n = 0`, which is a
  linear ordinary differential equation.

## Conventions

**Spaces.** Physical space is `EuclideanSpace ℝ (Fin n)` with Lebesgue measure `volume`, so
that balls and cones are Euclidean; time is `ℝ`. The unknown takes values in `ℝᴺ`, written
`Fin N → ℝ`, and the coefficients are real matrices `Matrix (Fin N) (Fin N) ℝ` acting by
Mathlib's `mulVec` (`A *ᵥ v`). All quantities in the energy method are written with the dot
product `v ⬝ᵥ w` (`dotProduct`); in prose `⟪v, w⟫ = v ⬝ᵥ w` and `|v|² = v ⬝ᵥ v`. The norm Mathlib
puts on `Fin N → ℝ` (the max norm) enters through regularity hypotheses, where all norms are
equivalent, and through the interpolation bounds (§3.3) and the convergence statement (§6.3),
which hold for any norm; no energy estimate is stated in it.

**Matrix-valued functions.** Mathlib has no default norm on `Matrix`, so a matrix-valued
function `M` is differentiated and bounded as the function `Matrix.of.symm ∘ M` into
`Fin N → Fin N → ℝ`, i.e. entrywise. The entrywise derivatives of
`M : ℝ → EuclideanSpace ℝ (Fin n) → Matrix (Fin N) (Fin N) ℝ` are the matrices `matDt M t x`
and `matDx M j t x` of `Suggested.lean`. Matrix norms `‖A‖` in prose are spectral norms; in
statements they are replaced by quadratic-form bounds, which is what the proofs use.

**Space-time functions** are curried, `u : ℝ → EuclideanSpace ℝ (Fin n) → X`; joint regularity
is regularity of `Function.uncurry u` on `ℝ × EuclideanSpace ℝ (Fin n)` with Mathlib's product
(max) norm. The partial derivatives are

    ∂ₜu(t,x) = deriv (fun s => u s x) t,      ∂ⱼu(t,x) = fderiv ℝ (u t) x (EuclideanSpace.single j 1).

No private partial-derivative wrapper is introduced. For `uncurry u` of class `C¹` on an open
set these are the partial derivatives of `uncurry u` (§1.2).

**Symmetry and positivity.** A matrix is symmetric when `Matrix.IsSymm`. The system is
*symmetric hyperbolic with constant `λ`* when `0 < λ` and, for all `(t,x)`, `A⁰(t,x)` and every
`Aʲ(t,x)` are symmetric and `λ (ξ ⬝ᵥ ξ) ≤ ξ ⬝ᵥ (A⁰(t,x) *ᵥ ξ)` for all `ξ ∈ ℝᴺ`. This is
`(A⁰(t,x) − λ • 1).PosSemidef` (Mathlib's `Matrix.posSemidef_iff_dotProduct_mulVec`). No symmetry
of `B` is assumed.

**Coefficient regularity** is never a standing assumption. Each theorem states its hypotheses
inline: `ContDiff ℝ k` of `p ↦ Matrix.of.symm (Aʲ p.1 p.2)`, quadratic-form bounds such as
`|ξ ⬝ᵥ (B t x *ᵥ ξ)| ≤ M (ξ ⬝ᵥ ξ)`, and "bounded derivatives of every order" as
`∀ m : ℕ, ∃ C, ∀ p, ‖iteratedFDeriv ℝ m f p‖ ≤ C`. In prose this class is written `C_b^∞`.

**Classical solutions.** For `T > 0`, `u` is a classical solution of `Lu = F` on `[0,T]` when
`uncurry u` is `C¹` on `Icc 0 T ×ˢ univ` (Mathlib's `ContDiffOn`, one-sided at the ends) and the
equation holds at every point of the open slab `(0,T) × ℝⁿ`. The initial condition `u 0 = u₀` is
stated separately.

**Propagation speed.** A number `c ≥ 0` is a *speed* for the system when, for all `(t,x)`, all
`ω ∈ ℝⁿ` with `‖ω‖ ≤ 1` and all `ξ ∈ ℝᴺ`,

    |ξ ⬝ᵥ ((Σⱼ ωⱼ Aʲ(t,x)) *ᵥ ξ)| ≤ c (ξ ⬝ᵥ (A⁰(t,x) *ᵥ ξ)).

For `A⁰ = 1` the least speed is the supremum over `(t,x)` and unit `ω` of the largest absolute
value of an eigenvalue of `Σⱼ ωⱼ Aʲ(t,x)`. Cones are open: `{(t,x) : ‖x − x₀‖ < R − c t}`.

**Grids.** The lattice index is `j : Fin n → ℤ`, the mesh is `h > 0`, the time step `k > 0` and
the mesh ratio `μ = k/h` (the letter `λ` is reserved for the positivity constant). The grid point
is `x_j = h j`, written `WithLp.toLp 2 (fun i => h * j i)`. Grid functions are
`v : (Fin n → ℤ) → (Fin N → ℝ)`; `eᵢ = Pi.single i 1`. The difference quotients are

    D₊ᵢ v = h⁻¹ • fwdDiff eᵢ v,   D₋ᵢ v (j) = h⁻¹ • (v j − v (j − eᵢ)),   D₀ᵢ = (D₊ᵢ + D₋ᵢ)/2,

with Mathlib's `fwdDiff`, and `D₊^α = Πᵢ D₊ᵢ^{αᵢ}` for a multi-index `α : Fin n → ℕ` (the factors
commute). The discrete norm is `‖v‖²_h = hⁿ Σ_j v j ⬝ᵥ v j`, written with `tsum`; every statement
about it carries `Function.HasFiniteSupport v`, so the sums are finite. Grid restriction of a
function `f` on `ℝⁿ` is `j ↦ f(x_j)`.

**Constants.** Every estimate states how its constants depend on the data: on `λ`, on the speed,
on the mesh ratio `μ`, on explicit bounds for the coefficients and finitely many of their
derivatives, on `T`, on `n`, on `N` and on the multi-index. An unqualified `∃ C` appears only in
compactness arguments, never in a final estimate.

## Exact supplier contracts

### From Mathlib

- `Matrix.dotProduct` and `Matrix.mulVec` (`Mathlib/Data/Matrix/Mul.lean:76,719`), `Matrix.of`
  (`Mathlib/LinearAlgebra/Matrix/Defs.lean:90`) and `Matrix.IsSymm`
  (`Mathlib/LinearAlgebra/Matrix/Symmetric.lean:33`).
- `Matrix.PosSemidef`, `Matrix.PosDef` and `Matrix.posSemidef_iff_dotProduct_mulVec`
  (`Mathlib/LinearAlgebra/Matrix/PosDef.lean:311`): positivity in the dot-product form used here.
- `hasStrictFDerivAt_uncurry_coprod` (`Mathlib/Analysis/Calculus/FDeriv/Partial.lean:62`):
  continuous partial derivatives of a function of two variables give strict differentiability.
  This is the two-variable case of §1.1; Mathlib has no `n`-variable version.
- `integral_bilinear_fderiv_right_eq_neg_left_of_integrable`
  (`Mathlib/Analysis/Calculus/LineDeriv/IntegrationByParts.lean:195`): integration by parts on a
  finite-dimensional space, the only integration by parts used in Layer 2.
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le`
  (`Mathlib/Analysis/Calculus/ParametricIntegral.lean:569`): differentiation of the energy in `t`.
- `le_gronwallBound_of_liminf_deriv_right_le` (`Mathlib/Analysis/ODE/Gronwall.lean:112`): the
  continuous Grönwall inequality for a one-sided bound `f' ≤ K f + ε`, which is the form the
  energy method supplies (§2.2, §2.3).
- `discrete_gronwall` and `discrete_gronwall_Ico` (`Mathlib/Analysis/ODE/DiscreteGronwall.lean:80,98`):
  the discrete Grönwall inequality for `u (m+1) ≤ (1 + c m) u m + b m`.
- `fwdDiff`, `fwdDiff_smul` and `fwdDiff_iter_eq_sum_shift` (`Mathlib/Algebra/Group/ForwardDiff.lean`):
  forward differences on an additive monoid, the scalar Leibniz rule and the binomial expansion.
- `Function.HasFiniteSupport` (`Mathlib/Algebra/FiniteSupport/Defs.lean`), `tsum_eq_finsum` and
  `Equiv.tsum_eq` (`Mathlib/Topology/Algebra/InfiniteSum/Basic.lean`): finite sums over `ℤⁿ` and
  their invariance under the shifts `Equiv.addRight eᵢ`.
- `BoundedContinuousFunction.arzela_ascoli`
  (`Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:113`) on a compact space, and
  `tendsto_of_subseq_tendsto` (`Mathlib/Order/Filter/AtTopBot/CountablyGenerated.lean:125`).
- `Real.smoothTransition` (`Mathlib/Analysis/SpecialFunctions/SmoothTransition.lean`): the smooth
  monotone cutoff used for the weight of §2.2.
- The continuous functional calculus for Hermitian matrices
  `Matrix.IsHermitian.instContinuousFunctionalCalculus`
  (`Mathlib/Analysis/Matrix/HermitianFunctionalCalculus.lean:98`), the Loewner order on matrices
  under `open scoped MatrixOrder` (`Mathlib/Analysis/Matrix/Order.lean:80`), and with them
  `CFC.sqrt`, `CFC.sqrt_unique`
  (`Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean:232,279`) and
  `Matrix.PosSemidef.inv_sqrt` (`Mathlib/Analysis/Matrix/Order.lean:137`): the positive square
  root of a positive semidefinite matrix, its uniqueness, and `(√A)⁻¹ = √(A⁻¹)`.
- The `L²` operator norm on matrices, a Banach-algebra norm, under
  `open scoped Matrix.Norms.L2Operator` (`Mathlib/Analysis/CStarAlgebra/Matrix.lean:280`); it is
  the norm in which Tau Ceti states the smoothness of the square root, and §7.1 transfers that
  statement to the entrywise norm.
- The Faà di Bruno bound `norm_iteratedFDerivWithin_comp_le`
  (`Mathlib/Analysis/Calculus/ContDiff/Bounds.lean:444`), and `CFC.sqrt_eq_rpow` and
  `CFC.rpow_neg` (`Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean:633,516`).
- `ContinuousLinearMap.hasFDerivAt_of_bilinear` (`Mathlib/Analysis/Calculus/FDeriv/Bilinear.lean:120`):
  the product rule for a bounded bilinear map, applied to `dotProduct` and `mulVec` in §2.1.

### From Tau Ceti

- `Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow`
  (`TauCeti/Analysis/Matrix/Exponential/Log.lean:106,98`): `CFC.sqrt` and `P ↦ P ^ s` are `C^k`
  on the positive definite matrices for every `k`, in the norm of
  `open scoped Matrix.Norms.L2Operator`.
- `TauCeti.fwdDiff_iter_smul` (`TauCeti/Algebra/Group/ForwardDiff.lean:102`): the iterated
  discrete Leibniz rule over a possibly noncommutative ring, used with `j ↦ Matrix.toLin' (a j)`
  in §3.1.

The statements of `Suggested.lean` need only Mathlib. Nothing else in Mathlib or Tau Ceti treats
hyperbolic systems, transport equations or difference schemes; every such item below is a
target.

## How to read the build

Layer 1 sets up the objects and one calculus criterion. Layer 2 is the energy method for
classical solutions: it gives uniqueness and the domain of dependence for general `A⁰` and is
independent of Layers 3–6. Layer 3 is the grid toolkit and depends on nothing in this roadmap.
Layer 4 defines Friedrichs' scheme for `A⁰ = 1` and proves its stability; Layer 5 bounds its
difference quotients of every order; Layer 6 passes to the limit and proves existence and
convergence for `A⁰ = 1`. Layer 7 removes the restriction `A⁰ = 1`. Layers 2 and 3 can be built
in parallel after Layer 1; Layer 4 needs Layer 3; Layer 5 needs Layer 4; Layer 6 needs Layers 2,
3 and 5 and §1.1; Layer 7 needs Layers 2 and 6.

## Layer 1: systems and classical solutions

### 1.1 Continuous partial derivatives give `C¹`

(Rudin, *Principles of Mathematical Analysis*, 3rd ed., Theorem 9.21, p. 219, for maps between
Euclidean spaces.)

Prove that a function `f : EuclideanSpace ℝ ι → G` (`ι` a finite type, `G` a real normed space)
whose partial derivatives `gᵢ(x) = d/dr f(x + r eᵢ)|_{r=0}` exist at every point of an open set
`s` and are continuous on `s` is `C¹` on `s`, with `fderiv ℝ f x v = Σᵢ vᵢ gᵢ(x)`. Prove the same
for `f : ℝ × EuclideanSpace ℝ ι → G`, with the time partial derivative added. The proof is an
induction on the number of coordinates, splitting off one coordinate at a time and applying
Mathlib's two-variable `hasStrictFDerivAt_uncurry_coprod`.

- A version for `ContDiffOn ℝ 1` on open sets and a version at a point (strict differentiability
  from partial derivatives continuous at the point and existing nearby).
- The converse: for `f` of class `C¹` on `s` the partial derivatives exist and are continuous.

**Checks.**

- `f(x) = x₁ x₂` on `ℝ²`: `g₁ = x₂`, `g₂ = x₁`, and `fderiv ℝ f x v = x₂ v₁ + x₁ v₂`.
- Continuity is needed: `f(x) = x₁ x₂ / (x₁² + x₂²)`, `f(0) = 0` has both partial derivatives at
  every point, discontinuous at `0`, and `f` is not even continuous at `0`.

*Needs:* Mathlib's `hasStrictFDerivAt_uncurry_coprod`; `EuclideanSpace.single`,
`EuclideanSpace.basisFun`.

### 1.2 Linear systems, symmetric hyperbolicity and classical solutions

Define the structure `LinearSystem n N` with fields `A0`, `A : Fin n → …` and `B`, each of type
`ℝ → EuclideanSpace ℝ (Fin n) → Matrix (Fin N) (Fin N) ℝ`; the entrywise derivatives `matDt` and
`matDx` of the Conventions; the left-hand side
`S.apply u t x = A⁰ ∂ₜu + Σⱼ Aʲ ∂ⱼu + B u` with the derivatives of the Conventions; the predicate
`IsSymmetricHyperbolic S λ` (Friedrichs 1954, p. 348, where some combination `Σ ξ⁰_μ A^μ` is
required to be positive definite; with the time coefficient `A⁰` positive definite, John 1982,
Ch. 5 §3 (a), (3.1a), p. 163, and Métivier, Definition 4.1.1); and the predicate `IsClassicalSolution S F T u`. The source `F` and
the initial value are not fields of the system.

- `S.apply` is additive and homogeneous in `u` among functions differentiable in the relevant
  variables, so the difference of two classical solutions with the same `F` is a classical
  solution with `F = 0`.
- For `uncurry u` of class `C¹` on an open set, `∂ₜu` and `∂ⱼu` are `fderiv ℝ (uncurry u) (t,x)`
  applied to `(1, 0)` and `(0, eⱼ)`.
- Change of unknown: for `P : ℝ → EuclideanSpace ℝ (Fin n) → Matrix (Fin N) (Fin N) ℝ` with
  entries `C¹` in `(t,x)`, `S.apply (fun t x => P t x *ᵥ v t x)` expands by the product rule into
  `A⁰P ∂ₜv + Σⱼ AʲP ∂ⱼv + (A⁰ ∂ₜP + Σⱼ Aʲ ∂ⱼP + BP) v`. This is the identity consumed by §7.2.
- A speed exists when the `Aʲ` are bounded: `|ξ ⬝ᵥ (Aʲ(t,x) *ᵥ ξ)| ≤ M (ξ ⬝ᵥ ξ)` for all `j`
  gives the speed `√n M / λ`.
- Restriction: a classical solution on `[0,T]` is one on `[0,T']` for `T' ≤ T`.

**Checks.**

- Transport, `n = 1`, `N = 1`, `A⁰ = 1`, `A¹ = a` constant, `B = 0`: `u(t,x) = u₀(x − a t)` is a
  classical solution with `F = 0`, and the least speed is `|a|`.
- Wave equation, `n = 1`: `w_tt = w_xx` becomes, for `u = (w_t, w_x) ∈ ℝ²`, the system with
  `A⁰ = 1` and `A¹ = [[0, −1], [−1, 0]]`, symmetric with eigenvalues `±1`, speed `1`. In `n`
  dimensions `u = (w_t, ∇w) ∈ ℝ^{n+1}` and `Aʲ` has entries `−1` at `(0, j)` and `(j, 0)`;
  `Σⱼ ωⱼ Aʲ` has eigenvalues `±‖ω‖` and `0`.
- The Jordan block `A¹ = [[0, 1], [0, 0]]` has the real eigenvalue `0` but is not symmetric, and
  `∂ₜu + A¹∂ₓu = 0` has no symmetrizer: multiplying by a symmetric `A⁰` gives the coefficient
  `A⁰A¹`, and `A⁰A¹` symmetric forces the `(1,1)` entry of `A⁰` to vanish, so `A⁰` is not positive
  definite.
- The predicate is satisfiable and not vacuous: `A⁰ = 1`, `Aʲ = 0`, `B = 0` is symmetric
  hyperbolic with constant `λ` exactly when `0 < λ ≤ 1` (test `ξ = e₁`, `N ≥ 1`); `A⁰ = 0` is not,
  for any `λ > 0`.
- `matDt`, `matDx`: for `M(t,x) = t x₁ • [[0, 1], [1, 0]]` on `ℝ × ℝ²`,
  `matDt M t x = x₁ [[0, 1], [1, 0]]`, `matDx M 0 t x = t [[0, 1], [1, 0]]` and `matDx M 1 t x = 0`.
- The product rule for `matDt`: for `P(t) = diag(t, 1)`, `matDt (P · P)` at `t = 1` is
  `diag(2, 0) = matDt P · P + P · matDt P`, while `matDt P · matDt P = diag(1, 0)`.
- Junk values: for `M(t) = |t| • 1`, `matDt M 0 = 0` (Mathlib's `deriv` of a non-differentiable
  function), which is why statements about `matDt` assume `C¹`.
- `IsClassicalSolution` excludes non-`C¹` functions: `u(t,x) = |x − t|` solves `∂ₜu + ∂ₓu = 0`
  off the line `x = t`, but `uncurry u` is not `C¹`, so it is not a classical solution.
- For `T < 0` the set `Icc 0 T ×ˢ univ` is empty, so every `u` is a classical solution; the
  existence theorems therefore assume `0 < T`.
- The predicate does not fix `u 0`: with `A⁰ = 1`, `Aʲ = B = F = 0`, every `u(t,x) = g(x)` with
  `g` of class `C¹` is a classical solution.

*Needs:* §1.1; Mathlib's `Matrix.mulVec`, `Matrix.dotProduct`, `Matrix.IsSymm`, `ContDiffOn`.

### Examples

The acceptance examples of this layer are transport `∂ₜu + a∂ₓu = 0` with least speed `|a|`; the
one- and `n`-dimensional wave equation as a symmetric system with speed `1`; the Jordan block
`[[0, 1], [0, 0]]`, which has no symmetrizer; and `f = x₁x₂/(x₁² + x₂²)` for the continuity
hypothesis of §1.1.

### Dependencies

Mathlib only.

## Layer 2: the energy method

### 2.1 The energy identity

For a classical solution of a symmetric hyperbolic system with `A⁰`, `Aʲ` of class `C¹` and `B`
continuous, prove the pointwise identity on `(0,T) × ℝⁿ` (John 1982, (3.5a)–(3.5b), p. 164, where
`C = 2B − ∂ₜA⁰ − Σⱼ ∂ⱼAʲ` has `uᵀCu = −⟪Ku, u⟫`; Métivier, Lemma 4.2.1)

    ∂ₜ⟪A⁰u, u⟫ + Σⱼ ∂ⱼ⟪Aʲu, u⟫ = ⟪K u, u⟫ + 2⟪F, u⟫,
    K = ∂ₜA⁰ + Σⱼ ∂ⱼAʲ − B − Bᵀ,

with `⟪v, w⟫ = v ⬝ᵥ w`, where `∂ⱼAʲ = matDx Aʲ j` is the entrywise partial derivative of `Aʲ` in
`xⱼ` and `Bᵀ` is the transpose. Symmetry of `A⁰` and `Aʲ` is used exactly here:
`∂ⱼ⟪Aʲu, u⟫ = ⟪(∂ⱼAʲ)u, u⟫ + 2⟪Aʲ∂ⱼu, u⟫` needs `Aʲ` symmetric.

**Checks.**

- Transport with constant `a`: `K = 0` and the identity is `∂ₜ(u²) + a ∂ₓ(u²) = 0`.
- Without symmetry the step `∂ⱼ⟪Aʲu, u⟫ = ⟪(∂ⱼAʲ)u, u⟫ + 2⟪Aʲ∂ⱼu, u⟫` fails: for the constant
  Jordan block `A¹` of §1.2 and `u = (1, x)`, `∂ₓ⟪A¹u, u⟫ = ∂ₓ(u₁u₂) = 1` while
  `2⟪A¹∂ₓu, u⟫ = 2 u₁ ∂ₓu₂ = 2`.

*Needs:* §1.2; Mathlib's `ContinuousLinearMap.hasFDerivAt_of_bilinear` applied to `dotProduct`
and `mulVec`.

### 2.2 Finite propagation speed

Let `c ≥ 0` be a speed (Conventions), `A⁰` and `Aʲ` be `C¹` and `B` continuous, and let `u` be a
classical solution on `[0,T]`. If `u₀ = u 0` vanishes on the open ball `B(x₀, R)` and `F`
vanishes on the open cone `{(t,x) : 0 ≤ t ≤ T, ‖x − x₀‖ < R − c t}`, then `u` vanishes on that
cone. No bound on the coefficients outside the cone and no integrability of `u` is assumed.
(Compare Lax 2006, Theorem 4.5, p. 43, uniqueness in a lens-shaped domain with a weakly
spacelike face, and Theorem 4.6, p. 44, where the domain of influence is bounded by the
characteristic conoid; the cone here uses the single speed `c`.)

Proof route: for `ε > 0` put `ρ_ε(x) = √(ε² + ‖x − x₀‖²)`, which is smooth with
`‖∇ρ_ε‖ < 1`, and `φ(t,x) = ψ(ρ_ε(x) + c t)` with `ψ(s) = Real.smoothTransition (R − s)`, so `φ`
is smooth, `0 ≤ φ ≤ 1`, `φ > 0` exactly where `ρ_ε(x) + c t < R`, `φ` has compact support in `x`
uniformly in `t`, and `ψ' ≤ 0`. Let `E(t) = ∫ φ⟪A⁰u, u⟫ dx`. Differentiate under the integral,
insert §2.1, and integrate by parts in each `xⱼ` (the integrand has compact support). The result is

    E'(t) = ∫ ψ'(ρ_ε + c t) (c⟪A⁰u, u⟫ + Σⱼ ∂ⱼρ_ε ⟪Aʲu, u⟫) + ∫ φ⟪Ku, u⟫ + 2∫ φ⟪F, u⟫.

The first integrand is `≤ 0` by the speed hypothesis with `ω = ∇ρ_ε`; the last integral vanishes
because `F = 0` where `φ > 0`; and `⟪Ku, u⟫ ≤ (κ/λ)⟪A⁰u, u⟫` for a number `κ ≥ 0` with
`⟪K ξ, ξ⟫ ≤ κ|ξ|²` on the compact set `[0,T] × closedBall x₀ R`, which exists by continuity. So
`E' ≤ (κ/λ) E`, `E(0) = 0`, `E ≥ 0`, and Grönwall gives `E = 0`. Hence `u = 0` where `ρ_ε(x) + c t < R`, and letting `ε → 0` gives the open cone.

- The local energy inequality itself, for every `ε > 0` and every speed, as a theorem about
  `E(t)` without the vanishing hypotheses: `E(t) ≤ e^{κt/λ}(E(0) + ∫₀ᵗ ∫ φ‖F‖²)` after
  `2⟪F, u⟫ ≤ ‖F‖² + ‖u‖²` (with `κ` replaced by `κ + 1`).

**Checks.**

- Sharpness of the speed: transport with `a = 1`, `x₀ = 0`, `R = 1` and `u₀ > 0` exactly on
  `(−2, −1)`. Then `u(t,·) > 0` exactly on `(−2 + t, −1 + t)`, which meets the cone
  `|x| < 1 − c t` for small `t > 0` whenever `c < 1`. The conclusion holds for `c = 1`.
- `c = 0` forces every `Aʲ = 0` (a symmetric matrix `T` with `⟪Tv, v⟫ = 0` for all `v` is `0`), and
  the theorem says that `u(·, x)` is determined by the ordinary differential equation at `x`.
- The open cone is needed in the statement: with `c = 0` and `R = 0` the closed cone would be the
  line `{x = x₀}`, while the hypotheses on open sets say nothing there.

*Needs:* §2.1; Mathlib's `Real.smoothTransition`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`integral_bilinear_fderiv_right_eq_neg_left_of_integrable` and the Grönwall inequality.

### 2.3 Uniqueness and the `L²` energy estimate

- **Uniqueness.** If the `Aʲ` are bounded, `A⁰` and `Aʲ` are `C¹` and `B` is continuous, two
  classical solutions on `[0,T]` with the same `F` and the same initial value agree on
  `[0,T] × ℝⁿ`. Their difference vanishes on every cone of §2.2 with the speed of §1.2, and every
  point lies in such a cone.
- **Integrated energy identity** (John 1982, (3.6)–(3.8), p. 164, there for `u(·,0) = 0`). If `A⁰` and `Aʲ` are `C¹`, `B` is continuous, `F` is continuous
  on `[0,T] × ℝⁿ` and the classical solution `u` vanishes outside a bounded set of
  `[0,T] × ℝⁿ`, then for `0 ≤ t ≤ T`

      ∫ ⟪A⁰u, u⟫(t) − ∫ ⟪A⁰u, u⟫(0) = ∫₀ᵗ ∫ (⟪Ku, u⟫ + 2⟪F, u⟫) dx ds.

  This is §2.1 integrated over `[0,t] × ℝⁿ`; the divergence terms `∂ⱼ⟪Aʲu, u⟫` integrate to `0`
  because `u(s,·)` has compact support. No bound on the `Aʲ` is needed. In `Suggested.lean` this
  is `integral_dotProduct_A0_sub_eq`, and the estimate below is `integral_dotProduct_A0_le`.
- **Energy estimate** (Lax 2006, Theorem 4.3, pp. 41–42, for `A⁰ = 1` and `F = 0`; p. 45 notes
  the extension to a positive symmetric `A⁰`; Métivier, Proposition 4.2.3; compare John
  1982, (3.9)–(3.12a), p. 165, an integrated form for `u(·,0) = 0`, and the energy integral
  inequality of Friedrichs 1954, §7, Theorem 7, p. 361). Under the
  hypotheses of the integrated identity (again no bound on the `Aʲ`
  is needed), if `ξ ⬝ᵥ (K(t,x) *ᵥ ξ) ≤ κ (ξ ⬝ᵥ ξ)` for all `(t,x)` and `ξ`, with `κ ≥ 0`, then for
  `0 ≤ t ≤ T`

      ∫ ⟪A⁰u, u⟫(t) ≤ e^{(κ+1)t/λ} (∫ ⟪A⁰u, u⟫(0) + ∫₀ᵗ ∫ ‖F‖² dx ds).

  From the integrated identity, `E' ≤ κ‖u‖² + ‖F‖² + ‖u‖² ≤ ((κ + 1)/λ) E + ‖F(t)‖²_{L²}`. With an upper bound
  `ξ ⬝ᵥ (A⁰ *ᵥ ξ) ≤ Λ (ξ ⬝ᵥ ξ)` it gives `‖u(t)‖²_{L²} ≤ e^{(κ+1)t/λ}((Λ/λ)‖u₀‖²_{L²} + λ⁻¹ ∫₀ᵗ ‖F(s)‖²_{L²} ds)`.
- **Time reversal.** The reversed system has coefficients `A⁰(−t,x)`, `−Aʲ(−t,x)`, `−B(−t,x)`;
  it is symmetric hyperbolic with the same `λ` and the same speeds. If `uncurry u` is `C¹` on
  `[−T, 0] × ℝⁿ` and `u` satisfies `Lu = F` on `(−T, 0) × ℝⁿ`, then `t ↦ u(−t)` is a classical
  solution on `[0,T]` of the reversed system with source `−F(−t,x)`. With uniqueness this gives
  backward uniqueness, and with the integrated energy identity it gives conservation of the
  energy backward in time when `K = 0` and `F = 0`.

**Checks.**

- Constant coefficients, `B = 0`, `F = 0`, compactly supported `u`: `K = 0`, and the integrated
  energy identity gives `∫⟪A⁰u, u⟫(t) = ∫⟪A⁰u, u⟫(0)`. The energy estimate alone does not: with
  `λ = 1` and `κ = 0`, applied forward and backward it only gives
  `e^{−t}E(0) ≤ E(t) ≤ e^{t}E(0)`.
- Without symmetry no estimate `‖u(t)‖_{L²} ≤ C‖u₀‖_{L²}` holds: for the Jordan block of §1.2,
  `u₂ = g(x)`, `u₁ = f(x) − t g'(x)` solves `∂ₜu + A¹∂ₓu = 0`; with `g(x) = χ(x) sin(mx)`, `χ` a
  fixed bump, `‖u₀‖_{L²}` stays bounded as `m → ∞` while `‖u(t)‖_{L²} ≥ t ‖g'‖ − ‖f‖` grows like
  `t m ‖χ‖/√2`.
- The exponential factor is genuine: `A⁰ = 1`, `Aʲ = 0`, `B = −β • 1` with `β > 0` and `F = 0`
  give `u(t) = e^{βt}u₀` and energy `e^{2βt}‖u₀‖²`; here `K = 2β`, `κ = 2β`, and the bound
  `e^{(2β+1)t}‖u₀‖²` is consistent with it.
- The bounded-support hypothesis keeps the integrals finite: for `A⁰ = 1`, `Aʲ = 0`, `B = 0`,
  `F = 0` the constant `u = 1` is a classical solution with infinite energy, for which Mathlib's
  `∫` returns the junk value `0`.

*Needs:* uniqueness: §2.2, §1.2 (linearity, speed). Integrated identity: §2.1; Mathlib's
`hasDerivAt_integral_of_dominated_loc_of_deriv_le` and
`integral_bilinear_fderiv_right_eq_neg_left_of_integrable`. Energy estimate: the integrated
identity and `le_gronwallBound_of_liminf_deriv_right_le`, applied on `[0,t]` to
`G(s) = E(s) − ∫₀ˢ ‖F‖²` with `K = (κ+1)/λ` and `ε = K ∫₀ᵗ ‖F‖²`: then `G' ≤ K G + ε`, and
`gronwallBound(E(0), K, ε, t) + ∫₀ᵗ ‖F‖² = e^{Kt}(E(0) + ∫₀ᵗ ‖F‖²)`, the stated bound. Time
reversal: §1.2.

### Examples

The acceptance examples of this layer are transport with `a = 1` and data on `(−2, −1)`, which
shows that the speed `1` is sharp; the one-dimensional wave system, whose energy
`∫(w_t² + w_x²)` is conserved; `B = −β • 1`, where the energy grows like `e^{2βt}`; and the
Jordan block with data `χ(x) sin(mx)`, for which no `L²` estimate holds.

### Dependencies

Layer 1; Mathlib's integration, integration by parts and Grönwall.

## Layer 3: grid functions

### 3.1 Lattice, differences and discrete norms

The results of this section are elementary; their proofs are given in full here.

Define the grid point `gridPoint h j`, the discrete norm `gridNormSq h v = hⁿ Σ_j |v j|²`, the
difference quotients `D₊ᵢ`, `D₋ᵢ`, `D₀ᵢ` and the iterated `D₊^α` of the Conventions, the grid
inner product `⟪v, w⟫_h = hⁿ Σ_j ⟪v j, w j⟫`, and the shift `τᵢ v (j) = v (j + eᵢ)`. For finitely
supported grid functions prove:

- Shift invariance `Σ_j f(j + eᵢ) = Σ_j f(j)`, so `τᵢ` is an isometry for `‖·‖_h`; `D₊ᵢ = h⁻¹(τᵢ − 1)`,
  `D₋ᵢ = D₊ᵢ τᵢ⁻¹`, the `D₊ᵢ`, `D₋ᵢ`, `τᵢ` commute, and `‖D₊ᵢ v‖_h ≤ 2h⁻¹‖v‖_h`.
- Summation by parts: `⟪D₊ᵢ v, w⟫_h = −⟪v, D₋ᵢ w⟫_h`; `⟪D₀ᵢ v, w⟫_h = −⟪v, D₀ᵢ w⟫_h`.
- The matrix Leibniz rule: for `a : (Fin n → ℤ) → Matrix (Fin N) (Fin N) ℝ`, with
  `(a v)(j) = a j *ᵥ v j`, `D₊ᵢ(a v)(j) = a(j + eᵢ) *ᵥ D₊ᵢ v (j) + (D₊ᵢ a)(j) *ᵥ v j`, and its
  iterate `D₊^α(a v)(j) = Σ_{β ≤ α} (α choose β) (D₊^{α−β} a)(j + β) *ᵥ D₊^β v (j)`. The
  one-direction iterate is Tau Ceti's `TauCeti.fwdDiff_iter_smul` applied to
  `j ↦ Matrix.toLin' (a j)` (Mathlib's `fwdDiff_smul` already allows a noncommutative ring); the
  coefficient-shifted form above is the same lemma with step `−eᵢ` at `j + αᵢeᵢ`; the target is
  the multi-index composite.
- Differences of restrictions: if `f : EuclideanSpace ℝ (Fin n) → X` is `C^{|α|}`, then
  `D₊^α (f ∘ gridPoint h)(j)` is an average, with respect to a probability measure on the box
  `x_j + h Πᵢ [0, αᵢ]`, of `∂^α f` (iterated fundamental theorem of calculus), so its norm is at
  most `sup ‖iteratedFDeriv ℝ |α| f‖`.
- Support: if `v` vanishes outside `{‖j‖_∞ ≤ J}` then `τᵢ^{±1} v` and every `D^±ᵢ v` vanish
  outside `{‖j‖_∞ ≤ J + 1}`.
- Restriction of a compactly supported `f : ℝⁿ → ℝᴺ` with `f = 0` outside `‖x‖_∞ ≤ R` has
  `‖f ∘ gridPoint h‖²_h ≤ (2R + 2)ⁿ sup_x |f x|²` for `0 < h ≤ 1`, with `|·|` the Euclidean norm
  (equivalently `N (2R + 2)ⁿ sup_x ‖f x‖²` in the max norm): the count of lattice points in the
  box times `hⁿ`.

**Checks.**

- `n = 1`, `v = w = δ₀`: `⟪D₊ v, w⟫_h = h · (−1/h) = −1`, and `−⟪v, D₋w⟫_h = −h · (1/h) = −1`.
- The factor `2h⁻¹` in `‖D₊ᵢ v‖_h ≤ 2h⁻¹‖v‖_h` is attained in the limit by `v(j) = (−1)^{j₁}`
  cut off to a long block.
- Leibniz with `n = 1`, `a(j) = j • 1` and `v = δ₁` at `j = 0`: the left side is
  `D₊(a v)(0) = h⁻¹(a(1)v(1) − a(0)v(0)) = h⁻¹`, and the right side is
  `a(1) D₊v(0) + D₊a(0) v(0) = 1 · h⁻¹ + h⁻¹ · 0 = h⁻¹`. Evaluating `a` at `j` instead of `j + eᵢ`
  in the first term would give `0`.

*Needs:* Mathlib's `fwdDiff`, `Function.HasFiniteSupport`, `tsum_eq_finsum`, `Equiv.tsum_eq`.

### 3.2 The discrete Sobolev inequality

This inequality turns the `ℓ²` bounds of Layer 5 into the pointwise bounds used in Layer 6; it is
elementary, and its proof is given in full here. It is the discrete analogue of the Sobolev
inequality on a cube proved by induction over the coordinates in John 1982, Ch. 5 §3, Problem 3,
(3.25a)–(3.25d), pp. 169–170 (John's main text uses the Fourier form (3.24), p. 169). For `h > 0` and finitely supported `v`, prove

    |v j|² ≤ Σ_{s ⊆ Fin n} ‖D₊^{1_s} v‖²_h        for every j,

where `1_s` is the indicator multi-index of `s`. The constant is `1`, independent of `h` and `n`.
In one dimension, `|v_j|² = Σ_{i ≥ j}(|v_i|² − |v_{i+1}|²) ≤ Σ_i h |D₊v_i|(|v_i| + |v_{i+1}|)`,
and Cauchy–Schwarz gives `≤ 2‖D₊v‖_h ‖v‖_h ≤ ‖v‖²_h + ‖D₊v‖²_h`. In `n` dimensions apply the
one-dimensional inequality in each coordinate in turn to the slices. Consequently
`sup_j |D₊^β v (j)| ≤ (Σ_{|α| ≤ |β| + n} ‖D₊^α v‖²_h)^{1/2}`.

**Checks.**

- `n = 1`, `v = δ₀`: the left side is `1`, the right side `h + 2/h ≥ 2√2`.
- The difference terms are needed: `v` the indicator of `{0, …, N−1}` with `N` fixed has
  `sup |v| = 1` and `‖v‖²_h = N h → 0` as `h → 0`.
- `n = 2`, `v = δ₀`: the right side is `h² + 2h²(2/h²) + h²(4/h⁴) = h² + 4 + 4/h² ≥ 1`.

*Needs:* §3.1.

### 3.3 Multilinear interpolation

The interpolant is the standard multilinear (`Q₁`) one; its properties below are elementary and
proved in full here.

Define the multilinear interpolant `interp h v : EuclideanSpace ℝ (Fin n) → (Fin N → ℝ)`: for `x`, let
`jᵢ = ⌊xᵢ/h⌋` and `θᵢ = xᵢ/h − jᵢ ∈ [0,1)`, and put

    interp h v x = Σ_{s ⊆ Fin n} (Π_{i ∈ s} θᵢ · Π_{i ∉ s} (1 − θᵢ)) • v(j + 1_s).

Prove:

- `interp h v (x_j) = v j`; `interp h v` is linear in `v` and continuous in `x` (the two formulas
  agree on the faces of the cells).
- `|interp h v x| ≤ sup_j |v j|` for any norm on `ℝᴺ` (a convex combination).
- Shift equivariance: `interp h (τᵢ v) x = interp h v (x + h eᵢ)`; hence
  `(interp h v (x + h eᵢ) − interp h v x)/h = interp h (D₊ᵢ v) x`.
- Lipschitz bound, for any norm on `ℝᴺ` (in Lean the max norm): if `‖D₊ᵢ v (j)‖ ≤ L` for all
  `i, j` then `‖interp h v x − interp h v y‖ ≤ L Σᵢ |xᵢ − yᵢ|`.
- Support: if `v` vanishes outside `{‖j‖_∞ ≤ J}` then `interp h v` vanishes outside
  `{‖x‖_∞ ≤ h(J + 1)}`.

**Checks.**

- `n = 1`, `v = δ₀`: `interp h v x = max(0, 1 − |x|/h)`, the hat function, with Lipschitz
  constant `1/h = sup |D₊ v|`.
- `n = 2`, `v(j) = j₁ j₂`: `interp h v x = x₁x₂/h²`; the interpolant reproduces functions affine
  in each variable separately.
- `n = 2`, `v = δ₀`, `x = (h/2, h/2)`: `interp h v x = 1/4`; piecewise-linear interpolation on
  the two triangles of the cell would give `1/2` or `0`.

*Needs:* §3.1; Mathlib's `Int.floor`.

### Examples

The acceptance examples of this layer are summation by parts for `δ₀`; the Leibniz rule with
`a(j) = j • 1` and `v = δ₁`; the discrete Sobolev inequality for `δ₀` in dimensions `1` and `2`
and its failure without difference terms; the hat function and the bilinear function `x₁x₂/h²`
as interpolants; and the value `1/4` at the centre of a cell.

### Dependencies

Mathlib only.

## Layer 4: Friedrichs' scheme

Throughout this layer and Layers 5 and 6, `n ≥ 1`, `A⁰ = 1` and every `Aⁱ(t,x)` is symmetric.
Without symmetry the weights of §4.2 are not positive semidefinite and the one-step inequality
fails (Check in §4.2). The existence proof of Layers 4–6 is the method of finite differences of
John 1982, Ch. 5 §3 (b); Friedrichs 1954, §15, pp. 373–374, remarks that finite differences give
an existence proof independent of his Hilbert-space method, and uses them in §§19–21 for
regularity.

### 4.1 The scheme

Define one step of Friedrichs' scheme at time `t` with mesh `h` and step `k` (for `n = 1` the
Lax–Friedrichs scheme, Lax 2006, (8.9)–(8.10), p. 84, and in several variables (8.69), p. 104),

    (Q v)(j) = Σᵢ [ (2n)⁻¹ (v(j+eᵢ) + v(j−eᵢ)) − (k/2h) Aⁱ(t, x_j)(v(j+eᵢ) − v(j−eᵢ)) ]
               + k (F(t, x_j) − B(t, x_j) v(j)),

and the iterates `u⁰ = u₀ ∘ gridPoint h`, `u^{m+1} = Q_{t_m} u^m` with `t_m = m k`. Write
`Q v = P v + k(F − B v)`, so `P` is the Friedrichs operator. Prove:

- `P v = v + (h²/2n) Σᵢ D₊ᵢD₋ᵢ v − k Σᵢ Aⁱ D₀ᵢ v`, the form consumed by consistency in Layer 6.
- Linearity of `u^m` in `(u₀, F)`.
- Support: if `u₀` and `F(t,·)` vanish outside `‖x‖_∞ ≤ R` then `u^m` vanishes outside
  `{‖x_j‖_∞ ≤ R + m h}`; for `m k ≤ T` this lies inside `‖x_j‖_∞ ≤ R + T/μ`, the numerical
  domain of dependence with speed `1/μ`.

**Checks.**

- Lax–Friedrichs: for `n = 1`, `A¹ = a`, `B = 0`, `F = 0`,
  `u^{m+1}_j = ½(1 − μa) u^m_{j+1} + ½(1 + μa) u^m_{j−1}`.
- At `μ a = 1` this is `u^{m+1}_j = u^m_{j−1}`, which with `k = h/a` reproduces the exact solution
  `u₀(x − a t)` at grid points.
- `n = N = 1`, `A¹ = 0`, `B = 0`, `F = 0`, `v = δ₀`: `Q v = ½(δ₁ + δ₋₁)` and `‖Q v‖²_h = h/2`;
  without the averaging term the step would return `δ₀`.

*Needs:* §3.1.

### 4.2 Positive weights and the one-step energy inequality

- **Positive-weights lemma** (Friedrichs' stability theorem, Lax 2006, Theorem 8.1, p. 85;
  compare Friedrichs 1954, §19, (19.18)–(19.20), pp. 381–382, where non-negativity of the
  coefficient matrices plays the same role for a one-sided difference scheme). For
  positive semidefinite `W₁, …, W_r ∈ ℝ^{N×N}` with `Σᵢ Wᵢ = 1`
  and any `v₁, …, v_r ∈ ℝᴺ`, `|Σᵢ Wᵢvᵢ|² ≤ Σᵢ ⟪Wᵢvᵢ, vᵢ⟫`. Proof: for any `w`,
  `⟪w, Σ Wᵢvᵢ⟫ = Σ⟪Wᵢw, vᵢ⟫ ≤ Σ⟪Wᵢw, w⟫^{1/2}⟪Wᵢvᵢ, vᵢ⟫^{1/2} ≤ |w|(Σ⟪Wᵢvᵢ, vᵢ⟫)^{1/2}`, using
  Cauchy–Schwarz for the positive semidefinite form `⟪Wᵢ·, ·⟫` and then for the sum.
- **CFL condition** (Courant–Friedrichs–Lewy 1928, Part II §2, pp. 61–62; Lax 2006, (8.11),
  p. 85, and in two space variables (8.70), p. 104). `n μ |⟪Aⁱ(t,x)ξ, ξ⟫| ≤ |ξ|²` for all `i, t, x, ξ`; for symmetric `Aⁱ` this is
  `n μ ‖Aⁱ(t,x)‖ ≤ 1` with the spectral norm. It makes the weights `(2n)⁻¹ ± (μ/2) Aⁱ(t, x_j)`
  positive semidefinite, and they sum to `1`.
- **One-step inequality.** Assume the CFL condition at time `t`, the Lipschitz bound
  `|⟪(Aⁱ(t,x) − Aⁱ(t,y))ξ, ξ⟫| ≤ L‖x − y‖ |ξ|²` and `|B(t,x)ξ| ≤ M|ξ|`. For finitely supported `v` and
  finitely supported grid restriction of `F(t,·)`,

      ‖Q v‖_h ≤ (1 + k(nL/2 + M)) ‖v‖_h + k ‖F(t,·) ∘ gridPoint h‖_h.

  Proof: by the lemma, `‖P v (j)‖² ≤ Σ_± Σᵢ ⟪Wᵢ^±(j) v(j ± eᵢ), v(j ± eᵢ)⟫`. Summing over `j` and
  shifting, `‖P v‖²_h ≤ hⁿ Σ_y ⟪(1 + Δ(y)) v(y), v(y)⟫` with
  `Δ(y) = (μ/2) Σᵢ (Aⁱ(t, y + h eᵢ) − Aⁱ(t, y − h eᵢ))`, and `⟪Δ(y)ξ, ξ⟫ ≤ n μ h L |ξ|² = n k L |ξ|²`. So
  `‖P v‖_h ≤ (1 + nkL)^{1/2}‖v‖_h ≤ (1 + nkL/2)‖v‖_h`; add the `B` and `F` terms.

**Checks.**

- The lemma fails without positivity: scalar weights `2` and `−1` with `v = (1, −1)` give
  `|2 + 1|² = 9 > 2 − 1 = 1`.
- The one-step inequality needs symmetric `Aⁱ`: for `n = 1`, `N = 2`, `A¹ = [[0, 1], [−1, 0]]`
  (so `⟪A¹ξ, ξ⟫ = 0`, and the CFL condition holds with `μ = 1`, `L = M = 0`), `B = F = 0`,
  `h = k = 1` and `v(j) = (cos(jπ/4), −sin(jπ/4))` for `0 ≤ j ≤ 7`, one gets `‖v‖²_h = 8` and
  `‖Q v‖²_h = 14`.
- The CFL condition is necessary for stability: for Lax–Friedrichs with `μ|a| > 1`, the mode
  `u_j = e^{ijθ}` has amplification factor `cos θ − iμa sin θ`, of modulus `μ|a| > 1` at
  `θ = π/2`, and the weights `½(1 ∓ μa)` are not both nonnegative.
- Constant coefficients, `B = 0`, `F = 0`: `L = M = 0` and `‖Q v‖_h ≤ ‖v‖_h`.

*Needs:* §4.1, §3.1; Mathlib's `Matrix.PosSemidef`, `Matrix.posSemidef_iff_dotProduct_mulVec`.

### 4.3 Stability

Under the CFL condition for all `t`, the Lipschitz bound `L` and the bound `M` for all `t`
(Lax 2006, Theorem 8.1, p. 85, iterated; John 1982, Ch. 5 §3 (b)),

    ‖u^m‖_h ≤ e^{(nL/2 + M) m k} (‖u⁰‖_h + k Σ_{l < m} ‖F(t_l,·) ∘ gridPoint h‖_h),

by §4.2 and Mathlib's `discrete_gronwall`. For `u₀` and `F` compactly supported and `0 < h ≤ 1`,
the right side is bounded uniformly in `h` for `m k ≤ T`, by §3.1.

**Checks.**

- The exponent is `0` for constant coefficients with `B = 0`, and the bound is then
  `‖u^m‖_h ≤ ‖u⁰‖_h + k Σ ‖F^l‖_h`.

*Needs:* §4.2; Mathlib's `discrete_gronwall`.

### Examples

The acceptance examples of this layer are the Lax–Friedrichs scheme for transport, exact at
`μa = 1` and unstable for `μ|a| > 1` (amplification factor of modulus `μ|a|` at `θ = π/2`); the
averaging of `δ₀` to `½(δ₁ + δ₋₁)`; and the scalar weights `2, −1`, for which the positive-weights
lemma fails.

### Dependencies

Layer 3.

## Layer 5: higher-order discrete bounds

### 5.1 Difference quotients of the scheme

The difference quotients of the scheme are estimated as in John 1982, Ch. 5 §3 (b); the
continuous analogue, differentiating the equation and applying the energy inequality, is
John 1982, (3.20a)–(3.21), pp. 167–168. For a
multi-index `α`, apply `D₊^α` to `u^{m+1} = P u^m + k(F − B u^m)` and expand with the
Leibniz rule of §3.1. Prove the identity

    D₊^α u^{m+1} = P^{(α)} D₊^α u^m + k R_α^m,

where `P^{(α)}` is the Friedrichs operator with coefficients `Aⁱ(t_m, x_{j+α})` (shifted by
`hα`, so it satisfies the same CFL condition and Lipschitz bound), and

    R_α^m = Σ_{β < α} (α choose β) [ −Σᵢ (D₊^{α−β}Aⁱ)(j+β) D₀ᵢ D₊^β u^m − (D₊^{α−β}B)(j+β) D₊^β u^m ]
            − B(j+α) D₊^α u^m + D₊^α F^m,

with the coefficients restricted to the grid at time `t_m`. The difference quotients of the
weights produce `k` times a centred difference, because
`(k/2h)(D₊^{α−β}Aⁱ)(v(j+eᵢ) − v(j−eᵢ)) = k (D₊^{α−β}Aⁱ) D₀ᵢ v`. Every term of `R_α^m` is of order at
most `|α|` in `u^m`. Hence

    ‖R_α^m‖_h ≤ C_α Σ_{|γ| ≤ |α|} ‖D₊^γ u^m‖_h + ‖D₊^α F^m‖_h,

with `C_α` depending on `α`, `n` and the suprema of the derivatives of `Aⁱ` and `B` of order
`≤ |α|` (§3.1, differences of restrictions).

**Checks.**

- Constant coefficients: `R_α^m = −B D₊^α u^m + D₊^α F^m` and `P^{(α)} = P`.
- The constant must depend on derivatives of the coefficients: for `∂ₜu − x ∂ₓu = 0` near `0`
  (cut off outside `[−2, 2]`), `u(t,x) = u₀(x eᵗ)` and `∂ₓu(t,0) = eᵗ u₀'(0)` grows at the rate
  `sup |∂ₓA¹| = 1`.

*Needs:* §3.1, §4.1.

### 5.2 Uniform bounds

(John 1982, Ch. 5 §3 (b).) Assume the coefficients are `C_b^∞`, the CFL condition holds, and
`u₀`, `F` are smooth and
compactly supported. For every `r` prove, for `0 < h ≤ 1` and `m k ≤ T`,

    Σ_{|α| ≤ r} ‖D₊^α u^m‖_h ≤ C_r,

with `C_r` depending on `r, n, μ, T`, the bounds of the derivatives of the coefficients of order
at most `max(r, 1)`, and the bounds of the derivatives of `u₀` and `F` of order `≤ r` with their support
radius. Proof: by §4.2 for `P^{(α)}` and §5.1, `E_r(m) = Σ_{|α| ≤ r} ‖D₊^α u^m‖_h` satisfies
`E_r(m+1) ≤ (1 + k C'_r) E_r(m) + k Σ_{|α| ≤ r} ‖D₊^α F^m‖_h`; apply `discrete_gronwall`; bound
`E_r(0)` and the `F` terms by §3.1.

Consequences, with §3.2 and `r = n + 3`, uniformly for `0 < h ≤ 1` and `m k ≤ T`:

- `sup_j |D₊^α u^m (j)| ≤ C` for `|α| ≤ 3`;
- `sup_j |(u^{m+1} − u^m)(j)| ≤ C k` and `sup_j |(D₊ᵢu^{m+1} − D₊ᵢu^m)(j)| ≤ C k`, from the form of
  `P` in §4.1: the averaging term is `(h/2nμ) k Σ D₊D₋`, so it costs one more difference.

**Checks.**

- Constant coefficients, `B = 0`, `F = 0`: `D₊^α` commutes with the scheme and
  `‖D₊^α u^m‖_h ≤ ‖D₊^α u⁰‖_h` exactly.

*Needs:* §5.1, §4.2, §3.2; Mathlib's `discrete_gronwall`.

### Examples

The acceptance examples of this layer are constant coefficients with `B = 0` and `F = 0`, where
`D₊^α` commutes with the scheme and the bounds have constant `1`, and `∂ₜu − x∂ₓu = 0`, where `∂ₓu` grows like `eᵗ` and the
constants must depend on the derivatives of the coefficients.

### Dependencies

Layer 4.

## Layer 6: passage to the limit for `A⁰ = 1`

Fix the hypotheses of §5.2 with `T` replaced by `T + 1`, a mesh ratio `μ` satisfying the CFL
condition, and `k = μ h`.

### 6.1 Compactness

The passage to the limit follows John 1982, Ch. 5 §3 (b); compactness is obtained here from
Arzelà–Ascoli. Let `U_h(t,x)` be the linear interpolation in `t` between `interp h u^m` at `t_m` and
`interp h u^{m+1}` at `t_{m+1}`, for `0 ≤ t ≤ T + 1`, and let `W_{h,i}` be the same for
`D₊ᵢ u^m`. By §5.2, §3.3 and §4.1:

- `U_h` and `W_{h,i}` are bounded uniformly in `h ∈ (0,1]`;
- they are Lipschitz in `(t,x)` uniformly in `h`;
- they vanish outside `‖x‖_∞ ≤ R₁ = R + 3 + (T + 1)/μ`, where `u₀` and `F` vanish outside
  `‖x‖_∞ ≤ R`.

Apply `BoundedContinuousFunction.arzela_ascoli` on the compact space
`K = [0, T+1] × {‖x‖_∞ ≤ R₁ + 1}`, with values in a closed ball of `ℝᴺ`, which is compact:
every sequence `h_l → 0` has a subsequence along which `U_h → u` and
`W_{h,i} → wᵢ` uniformly on `K`. Extended by `0`, `u` and `wᵢ` are continuous on
`[0, T+1] × ℝⁿ`.

*Needs:* §5.2, §3.3, §4.1; Mathlib's `BoundedContinuousFunction.arzela_ascoli`.

### 6.2 Existence

Identify the limit and prove that it is a classical solution on `[0,T]` with `u 0 = u₀` (John
1982, Ch. 5 §3 (b)).

- **Space.** Shift equivariance (§3.3) gives
  `U_h(t, x + N h eᵢ) − U_h(t, x) = h Σ_{l < N} W_{h,i}(t, x + l h eᵢ)`; with `N = ⌊s/h⌋` the right
  side is a Riemann sum, and in the limit `u(t, x + s eᵢ) − u(t,x) = ∫₀ˢ wᵢ(t, x + σ eᵢ) dσ`.
- **Time.** Summing the scheme, using §4.1 for `P`,
  `u^m = u⁰ + k Σ_{l<m} [ (h/2nμ) Σᵢ D₊ᵢD₋ᵢ u^l − Σᵢ Aⁱ D₀ᵢ u^l − B u^l + F^l ]` at grid points. The
  first term is `O(h)` by §5.2, `D₀ᵢ u^l = ½(D₊ᵢ u^l + τᵢ⁻¹ D₊ᵢ u^l)` converges with `D₊ᵢ u^l` to
  `wᵢ`, and the coefficients converge by continuity. In the limit
  `u(t,x) = u₀(x) + ∫₀ᵗ G(s,x) ds` with `G = −Σᵢ Aⁱ wᵢ − B u + F`, first at limits of grid
  points and then everywhere by continuity.
- **Regularity.** Extend `u` to `t < 0` by `u(t,x) = u₀(x) + t G(0,x)`, where
  `G(0,·) = −Σᵢ Aⁱ(0,·) ∂ᵢu₀ − B(0,·) u₀ + F(0,·)` is `C¹` because `u₀` is smooth. For `t < 0` put
  `G(t,·) = G(0,·)` and `wᵢ(t,·) = ∂ᵢu₀ + t ∂ᵢG(0,·)`. Both are continuous across `t = 0` because
  `wᵢ(0,·) = ∂ᵢu₀`, and the extension has partial derivatives `∂ₜ = G` and `∂ᵢ = wᵢ` on the open
  slab `(−∞, T + 1) × ℝⁿ`, so it is `C¹` there by §1.1, and `u` is `C¹` on `Icc 0 T ×ˢ univ`. The
  equation holds on `(0, T)` because `∂ₜu = G`. Support: `u(t,·)` vanishes outside
  `‖x‖_∞ ≤ R₁`.

The headline is `exists_isClassicalSolution_of_A0_eq_one` in `Suggested.lean`.

**Checks.**

- Transport with `a = 1` and `μ = 1`: the scheme is exact at grid points (§4.1), so `U_h` at
  grid points is `u₀(x − t)` and the limit is the exact solution.
- The numerical support bound `R + (T+1)/μ` dominates the true one `R + |a|(T+1)` because the
  CFL condition is `μ|a| ≤ 1`.

*Needs:* §6.1, §4.1, §5.2, §3.3, §1.1.

### 6.3 Convergence of the scheme

By uniqueness (§2.3) every subsequential limit in §6.1 is the solution of §6.2 (compare Lax
2006, Theorem 8.3 and its Notes (1)–(2), p. 87: a consistent and stable scheme converges), so
`U_h → u` uniformly on `[0,T] × ℝⁿ` as `h → 0` (Mathlib's `tendsto_of_subseq_tendsto`). At grid
points: for every `ε > 0`, for all sufficiently small `h > 0`, all `m` with `m μ h ≤ T` and all
`j`, `‖u^m(j) − u(m μ h, x_j)‖ ≤ ε`. No rate is claimed.

*Needs:* §6.1, §6.2, §2.3.

### Examples

The acceptance example of this layer is transport with `a = 1` and `μ = 1`, where the scheme is
exact at grid points and the limit is `u₀(x − t)`; its numerical support bound `R + (T + 1)/μ`
dominates the true support `R + |a|(T + 1)`.

### Dependencies

Layers 2, 3 and 5; §1.1.

## Layer 7: general `A⁰`

### 7.1 Derivative bounds for the square root

The square root and `P ↦ P ^ (−1/2 : ℝ)` are `C^k` on the positive definite matrices for every
`k` (Tau Ceti `Matrix.contDiffOn_sqrt`, `Matrix.contDiffOn_rpow`). Transferred from the norm of
`open scoped Matrix.Norms.L2Operator` to the entrywise norm (all norms on matrices are
equivalent), this makes the entries of `x ↦ CFC.sqrt (A x)` and `x ↦ (CFC.sqrt (A x))⁻¹` of class
`C^k` whenever the entries of `A : X → Matrix (Fin N) (Fin N) ℝ` are `C^k` and every `A x` is
positive definite; `Matrix.PosSemidef.inv_sqrt` with `CFC.sqrt_eq_rpow` and `CFC.rpow_neg`
identifies `(CFC.sqrt A)⁻¹` with `A ^ (−1/2 : ℝ)`.

This section is assembled from Tau Ceti's lemmas and Mathlib's chain rule; the target is the
uniform version, `exists_bound_iteratedFDeriv_sqrt_comp` in
`Suggested.lean`: let `A x` be symmetric with `c|ξ|² ≤ ⟪A x ξ, ξ⟫ ≤ Λ|ξ|²` for all `x`, `ξ`, where
`0 < c ≤ Λ`, and let every derivative of the entries of `A` of order `≤ m` be bounded by `C`.
Then every derivative of order `≤ m` of the entries of `x ↦ CFC.sqrt (A x)` and of
`x ↦ (CFC.sqrt (A x))⁻¹` is bounded, by a constant depending on `m`, `N`, `c`, `Λ` and `C`.
Proof: the set `K` of symmetric `T` with `c|ξ|² ≤ ⟪Tξ, ξ⟫ ≤ Λ|ξ|²` is compact and consists of
positive definite matrices, so the iterated derivatives of `CFC.sqrt` and of `P ↦ P ^ (−1/2 : ℝ)`
of order `≤ m` are bounded near `K`, and the chain rule bounds the composites. The set
`{P | P.PosDef}` lies in the proper subspace of symmetric matrices, so for `N ≥ 2` it is not
open and not `UniqueDiffOn`; work instead with `g(P) = CFC.sqrt ((P + Pᵀ)/2)` and
`g'(P) = ((P + Pᵀ)/2) ^ (−1/2 : ℝ)` on the open set `U = {P | ((P + Pᵀ)/2).PosDef}`. They are
`C^k` on `U` by Tau Ceti's lemmas composed with the linear map `P ↦ (P + Pᵀ)/2`
(`ContDiffOn.comp`), agree with the square root and its inverse on symmetric matrices, and have
bounded iterated derivatives on the compact `K ⊆ U`. Then `norm_iteratedFDerivWithin_comp_le`
with `t = U` (open, hence `UniqueDiffOn`) and `s = univ` bounds the composites.

**Checks.**

- `T = [[2, 1], [1, 2]]` (eigenvalues `3`, `1`): `CFC.sqrt T = ½[[√3 + 1, √3 − 1], [√3 − 1, √3 + 1]]`.
- `N = 1`, `A(x) = 2 + sin x`, `c = 1`, `Λ = 3`: `(A x)^{−1/2} = (2 + sin x)^{−1/2}` has derivative
  `−½ cos x (2 + sin x)^{−3/2}`, bounded by `½`.
- The bound depends on `c`: `N = 1`, `A(x) = sin²x + ε` has `c = ε`, `Λ = 1 + ε` and all derivatives
  bounded independently of `ε`, but the second derivative of `√(A x)` at `x = 0` is `ε^{−1/2}`.
  For `ε = 0`, `√(A x) = |sin x|` is not differentiable at `0`.

*Needs:* Tau Ceti's `Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow`; Mathlib's
`Matrix.PosSemidef.inv_sqrt`, `CFC.sqrt_eq_rpow`, `CFC.rpow_neg`,
`norm_iteratedFDerivWithin_comp_le`, `ContDiffOn.comp`, the norm of
`Matrix.Norms.L2Operator`.

### 7.2 Normalization

Let `P = (A⁰)^{−1/2} = (CFC.sqrt A⁰)⁻¹`, with the derivatives `∂ₜP = matDt P` and `∂ⱼP = matDx P j`. Define the normalized system `S.normalize` with

    A⁰' = 1,   Aʲ' = P Aʲ P,   B' = P (A⁰ ∂ₜP + Σⱼ Aʲ ∂ⱼP + B P),

and prove, for `S` symmetric hyperbolic with constant `λ` and `A⁰` of class `C¹` (so that `P` is
`C¹`): `u` is a classical solution of `S` with source `F` on `[0,T]` if and only if
`v = (A⁰)^{1/2} u` is a classical solution of `S.normalize` with source `P F`. This is the change
of unknown of §1.2 with `u = P v`, followed by multiplication by `P`, using `P A⁰ P = 1`.

- `S.normalize` is symmetric hyperbolic with constant `1`; `c` is a speed for `S` if and only if
  it is a speed for `S.normalize`; if `A⁰` is `C_b^∞` with `λ|ξ|² ≤ ⟪A⁰ξ, ξ⟫ ≤ Λ|ξ|²` and `Aʲ`, `B` are
  `C_b^∞`, then the coefficients of `S.normalize` are `C_b^∞` (§7.1).

**Checks.**

- `n = 1`, `A⁰ = diag(1, 4)`, `A¹ = 1`, `B = 0`: `P = diag(1, ½)`, `A¹' = diag(1, ¼)`, `B' = 0`;
  the components travel at speeds `1` and `¼`, and the least speed of both systems is `1`.
- `n = N = 1`, `A⁰ = e^{2t}`, `A¹ = 0`, `B = 0`: `P = e^{−t}`, `B' = P A⁰ ∂ₜP = −1`, and `v = eᵗu`
  solves `∂ₜv − v = e^{−t}F`. The wrong model `B' = P B P` gives `0`.
- `A⁰ = λ • 1` constant: `Aʲ' = Aʲ/λ` and `B' = B/λ`.

*Needs:* §7.1, §1.2.

### 7.3 The Cauchy problem for general `A⁰`

For `n ≥ 1`, a symmetric hyperbolic system with constant `λ` whose coefficients `A⁰`, `Aʲ`, `B`
are `C_b^∞`, and smooth compactly supported `u₀` and `F`, there is a classical solution on
`[0,T]` with `u 0 = u₀`; it is unique (§2.3); and if `u₀` and `F` vanish outside the ball of
radius `R` and `c` is a speed, then `u(t,x) = 0` for `‖x‖ > R + c t`, by §2.2 applied to cones
centred at `x` with radius `‖x‖ − R`. Proof: this theorem is assembled here from §6.2 applied
to `S.normalize`, §7.1 and §7.2; the reduction `u = (A⁰)^{−1/2} v` is the standard one.

**Checks.**

- The example of §7.2 with `u₀` supported in `[−1, 1]`: the first component is supported in
  `[−1 + t, 1 + t]` and the second in `[−1 + t/4, 1 + t/4]`, inside `|x| ≤ 1 + t`.

*Needs:* §7.2, §6.2, §2.2, §2.3.

### Examples

The acceptance examples of this layer are `A⁰ = diag(1, 4)`, `A¹ = 1`, with speeds `1` and `¼`
and supports `[t − 1, t + 1]` and `[t/4 − 1, t/4 + 1]`; `A⁰ = e^{2t}` in one dimension, where
`B' = −1`; constant `A⁰ = λ • 1`; and the square root of `[[2, 1], [1, 2]]`.

### Dependencies

Layers 2 and 6; Mathlib's functional calculus for Hermitian matrices; Tau Ceti's
`Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow`.

## Downstream consumers

No roadmap in this repository consumes this one yet. The quasilinear Cauchy problem for
symmetric hyperbolic systems, which is outside this roadmap, would consume the energy identity
and its integrated form (§2.1, §2.3), finite propagation speed (§2.2) and the linear existence
theorem (§7.3).

## References

- K. O. Friedrichs, *Symmetric hyperbolic linear differential equations*, Comm. Pure Appl. Math.
  7 (1954), 345–392: p. 348 (definition), §7, Theorem 7, p. 361 (energy integral
  inequality), §15, pp. 373–374, and §19, pp. 379–382 (difference operators). Cited at §1.2,
  §2.3, Layer 4 and §4.2.
- F. John, *Partial Differential Equations*, 4th ed., Applied Mathematical Sciences 1, Springer,
  1982: Ch. 5, §3 (a), pp. 163–170 (the basic energy inequality), and §3 (b) (existence of
  solutions by the method of finite differences, announced on p. 167). Cited in the summary,
  §1.2, §2.1, §2.3, §3.2, Layer 4, §4.3, §5.1, §5.2, §6.1 and §6.2.
- R. Courant, K. Friedrichs, H. Lewy, *Über die partiellen Differenzengleichungen der
  mathematischen Physik*, Math. Ann. 100 (1928), 32–74. Cited at §4.2.
- P. D. Lax, *Hyperbolic Partial Differential Equations*, Courant Lecture Notes in Mathematics
  14, Courant Institute and American Mathematical Society, 2006: §4.3, pp. 41–45 (Theorems 4.3,
  4.5, 4.6); §§8.1–8.3, pp. 83–88 ((8.9)–(8.11), Theorems 8.1 and 8.3); §8.7, pp. 103–104
  ((8.69)–(8.70)). Cited at §2.2, §2.3, §4.1, §4.2, §4.3 and §6.3.
- W. Rudin, *Principles of Mathematical Analysis*, 3rd ed., McGraw-Hill, 1976: Theorem 9.21, p. 219.
  Cited at §1.1.
- G. Métivier, lecture notes, Chapter 4, *Symmetric systems. The L² linear theory*,
  https://www.math.u-bordeaux.fr/~gmetivie/NotesPisaChap4.pdf: Definition 4.1.1, Lemma 4.2.1,
  Proposition 4.2.3. Cited at §1.2, §2.1 and §2.3.
