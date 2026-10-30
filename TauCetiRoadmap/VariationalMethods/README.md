# Roadmap: variational methods and constrained spectral theory

**Summary.** This roadmap builds the variational connectors between Banach-space weak
compactness, quadratic energy minimization and self-adjoint operators on a Hilbert space. From
Mathlib's weak topologies and bidual inclusion, Tau Ceti's real coercive-form solution operators
and BanachSpaceTheory's reflexivity and Eberlein–Šmulian theorems it builds the direct method in
its topological and sequential forms, Euler–Lagrange equations with their real and complex
scalar conventions, the compact form pair (a form domain `V`, a Hilbert space `H` and a compact
injective dense inclusion `j : V → H`, kept distinct throughout), constrained Rayleigh minima on
spheres of `H`-subspaces, successive minima with their complete eigenbasis, Courant–Fischer on
the form domain, the compact-resolvent specialization of UnboundedOperators' represented
operator with its domain expansion and spectrum, the abstract adapter identifying the operator
of a differential energy `‖D u‖²` with the restricted composite `D₀† D₀`, and Ritz–Galerkin
convergence. Its end theorems are the direct method, the constrained Rayleigh minimum and its
restricted Euler–Lagrange equation, the ordered eigenbasis with `λₙ → ∞`, Courant–Fischer on
the form domain, compactness of the shifted inverse of the represented operator, the domain
expansion and spectrum identification, the differential-energy adapter and Ritz–Galerkin
convergence. [Suggested.lean](Suggested.lean) states the headline theorems that are statable
against the pinned libraries; this README is the roadmap.

## Scope and ownership

This roadmap owns, over `𝕜 = ℝ` or `ℂ`: the direct method and its weak lower semicontinuity
API on reflexive Banach spaces (including the real/complex weak-topology dictionary and the
sequential-closure form of Eberlein–Šmulian on weakly compact sets); the first variation on
affine and convex constraints and the subdifferential sum rule with an indicator; quadratic
energies, their expansion, weak equation, energy gap and near-minimizer convergence; the energy
space and the forcing maps of a coercive Hermitian form; semibounded shifts; the compact form
pair with its transport API; constrained spheres, their minima and restricted Euler–Lagrange
equations; the kernel-orthogonal Poincaré connector; successive minima, completeness,
expansions and Courant–Fischer on the form domain; the compact-pair specialization of the
represented operator (compact shifted inverse, eigenbasis identification, domain expansion,
spectrum, resolvent norm, weak equations at and off the spectrum); the abstract
differential-energy adapter; and Ritz–Galerkin convergence with its generalized matrix
eigenvalue problem.

Owned elsewhere and consumed here:

- [BanachSpaceTheory](../BanachSpaceTheory/README.md) B1–B2 owns duality, Mazur's lemma,
  Goldstine, reflexivity (surjectivity of the continuous bidual inclusion), weak compactness of
  the closed unit ball of a reflexive space, Eberlein–Šmulian in its compactness form,
  Milman–Pettis and finite norming sets. Here: their variational applications, the
  sequential-closure form of Eberlein–Šmulian on a weakly compact set (Layer 1.1) and the
  bounded-set adapters for compact maps.
- UnboundedOperators UO-D06 owns the closed-form representation theorem over `[RCLike 𝕜]`: the
  coercive solution map of a shifted Hermitian form over `𝕜` (its scalar-generic adapter of
  Mathlib's real Lax–Milgram, with the identification at `𝕜 = ℝ`), the unique self-adjoint
  partial operator `closedFormOperator` of a closed semibounded form with its graph
  characterization, the real-shift self-adjointness criterion, both adjoint inclusions,
  witness independence, the Friedrichs extension, the complexification of a real form and of
  its represented operator, and the real spectral restriction `realSpectralRestriction` with
  its projection family and bounded real calculus. Here: the compact-pair specialization
  (Layer 5), which consumes that operator by its graph and adds nothing to the general theory.
- [GeneralizedCohomology](../GeneralizedCohomology/README.md) G5.5-RealHilbert owns the Hilbert
  complexification of a complete real inner-product space (its complex inner product, norm
  `√(‖x‖²+‖y‖²)`, isometric real inclusion, antilinear conjugation, completeness, comparison
  with the Taylor-norm `TauCeti.Complexification` and the transport of
  `ContinuousLinearMap.complexify`). This roadmap defines no complexification.
- [SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md) Parts C–E
  own graph norms and cores (SA-C39–SA-C43), form bounds (SA-C76–SA-C85), the resolvent set and
  spectrum of a partial operator (SA-D01–SA-D02), the self-adjoint resolvent estimates
  (SA-D17–SA-D22) and, over `ℂ`, the spectral projections `P_A(B)` and the resolvent formula
  (SA-E01, SA-E03, SA-E05). Here: their identification on a compact form pair.
- [PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) PD-A50–PD-A53 owns the
  finite-dimensional eigenbasis quadratic form, Courant–Fischer, eigenvalue monotonicity and
  Weyl's bound for symmetric endomorphisms. Here: the form-domain versions and the conversion
  of its decreasing order to the increasing form order.
- Tau Ceti `Analysis/InnerProductSpace/Variational/*` owns the real coercive solution
  operator, its compactness, symmetry, kernel, Rayleigh least value, Fredholm alternative and
  eigenbasis; `Analysis/PDE/Spectrum` owns its Dirichlet instance. Here: the semibounded-shift,
  complex-Hermitian, ordered-minimum and operator-domain bridges they do not state, with exact
  comparisons at `𝕜 = ℝ`; no second solution operator is built.

Outside the roadmap, and not consumed: the geometric realizations. The `H²` realization of a
nonnegative Laplace-type system on a compact boundaryless manifold, Rellich compactness of
`H¹(E) → L²(E)`, elliptic regularity of the operator domain, Hodge theory and the comparison
with the realization of `1+∇*∇` belong to ComplexKahlerGeometry K5a and
PseudodifferentialOperators P6–P7, which consume this roadmap (see Downstream consumers); the
course examples on manifolds (mean-zero Poincaré inequalities, Hodge decompositions) are their
acceptance examples. Bounded-domain elliptic forms, boundary conditions and regularity belong to
PDE Lane D–E, which consume Mathlib and Tau Ceti directly.

## Conventions

1. **Scalars and forms.** Scalars are `𝕜 = ℝ` or `ℂ`, written `[RCLike 𝕜]`. Mathlib's inner
   product `inner 𝕜 x y` is conjugate linear in `x`. A bounded Hermitian form is
   `a : V →L⋆[𝕜] V →L[𝕜] 𝕜` with `a u v = star (a v u)`; its quadratic energy is
   `q(u) = RCLike.re (a u u)`, a real number. A represented operator satisfies
   `a u v = inner 𝕜 (A (j u)) (j v)`. Derivatives of real-valued energies on a complex space are
   real Fréchet derivatives on the restriction of scalars, never complex derivatives.
2. **Form-domain pairs.** `V` and `H` are complete inner-product spaces over `𝕜`. A
   form-domain inclusion is a continuous linear map `j : V →L[𝕜] H` with injective, dense
   range; it need not be a topological embedding. Compactness means `IsCompactOperator j`. A
   quantitative lower bound is `c * ‖u‖² ≤ q(u) + ω * ‖j u‖²` with `0 < c` and `ω : ℝ`; `ω` may
   be negative. The shifted form is `a_α(u,v) = a u v + α * inner 𝕜 (j u) (j v)` for `α ≥ ω`;
   its energy `q_α = q + α‖j·‖²` is coercive on `V` and defines an inner product whose norm is
   equivalent to the norm of `V`.
3. **Weak topologies and reflexivity.** The weak topology of a normed space is Mathlib's
   `WeakSpace 𝕜 E` with `toWeakSpace`; duals are `StrongDual 𝕜 E`. Reflexivity means
   surjectivity of the continuous `NormedSpace.inclusionInDoubleDual 𝕜 E`, as in
   BanachSpaceTheory; algebraic `Module.IsReflexive` is a different notion. For a complex space
   the weak topology of the real restriction of scalars (`RestrictScalars ℝ 𝕜 V`, or
   `NormedSpace.complexToReal` on `V` itself) is the complex weak topology (Layer 1.1).
4. **Resolvents and adjoints.** The resolvent of a partial operator is `R_A(z) = (z I − A)⁻¹`,
   as in SelfAdjointSpectralTheory and Tau Ceti; so `(A + α)⁻¹ = −R_A(−α)`. Partial adjoints are
   Mathlib's `LinearPMap.adjoint`, with `inner (T† y) x = inner y (T x)` for `x` in the domain of
   `T` and `y` in the domain of `T†`.
5. **Ordering.** Eigenvalues of a compact form pair are listed with multiplicity in
   nondecreasing order `λ₀ ≤ λ₁ ≤ ⋯`, indexed from `0`. PolarDecomposition's decreasing order on
   a `d`-dimensional space is converted by `k ↦ d − 1 − k`.
6. **Junk values.** The min–max value `rayleighMinMax L n` of a subspace of dimension at most `n`
   is `sInf ∅ = 0`; the real `sInf` of an unbounded-below set is `0`. Every theorem that uses one
   of these values carries the hypothesis that excludes the junk case.

## Exact supplier contracts

### From Mathlib

- Weak topologies: `WeakSpace`, `toWeakSpace`, `Convex.toWeakSpace_closure` and
  `toWeakSpace_closedConvexHull_eq` (`Mathlib/Analysis/LocallyConvex/WeakSpace.lean`): a closed
  convex set has the same norm and weak closure.
- Biduals: `NormedSpace.inclusionInDoubleDual`, `NormedSpace.inclusionInDoubleDualWeak`,
  `NormedSpace.isCompact_closure_of_isBounded` (`Mathlib/Analysis/Normed/Module/DoubleDual.lean`):
  a norm-bounded set whose weak-star bidual closure lies in the range of the inclusion has
  weakly compact closure. Surjectivity of the inclusion makes the range condition automatic.
- Minima: `LowerSemicontinuousOn.exists_isMinOn` (`Mathlib/Topology/Semicontinuity/Basic.lean`)
  on a nonempty compact set; `IsMinOn`, `sInf`.
- Compact operators: `IsCompactOperator` (`Mathlib/Analysis/Normed/Operator/Compact/Basic.lean`).
- First variation: `IsLocalMinOn.hasFDerivWithinAt_nonneg`, `IsLocalMinOn.fderivWithin_eq_zero`,
  `posTangentConeAt` (`Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`);
  `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt_1d`.
- Lax–Milgram over `ℝ`: `IsCoercive`, `IsCoercive.continuousLinearEquivOfBilin`,
  `IsCoercive.unique_continuousLinearEquivOfBilin`
  (`Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean`), for `B : V →L[ℝ] V →L[ℝ] ℝ` on a
  complete real inner-product space.
- Inner-product spaces: `InnerProductSpace.toDual`, `InnerProductSpace.rclikeToReal`
  (`Mathlib/Analysis/InnerProductSpace/Basic.lean`), `InnerProductSpace.toUniformConvexSpace`
  (`Mathlib/Analysis/InnerProductSpace/Convex.lean`), `HilbertBasis`, orthogonal projections onto
  closed submodules.
- Rayleigh quotients of bounded operators: `ContinuousLinearMap.rayleighQuotient`,
  `IsSelfAdjoint.eq_smul_self_of_isLocalExtrOn`, `IsSelfAdjoint.hasEigenvector_of_isMinOn`
  (`Mathlib/Analysis/InnerProductSpace/Rayleigh.lean`); they concern bounded operators on one
  space and do not identify an unbounded operator with a bounded operator on its form domain.
- Partial operators: `LinearPMap`, `LinearPMap.graph`, `LinearPMap.IsClosed`
  (`Mathlib/Topology/Algebra/Module/LinearPMap.lean`), `LinearPMap.adjoint`,
  `LinearPMap.IsFormalAdjoint`, `IsSelfAdjoint` for partial operators
  (`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean`); `LinearPMap.comp` requires the whole
  range of the first operator to lie in the domain of the second and is not the restricted
  composite of Layer 5.3. `LinearEquiv.ofInjective` (`Mathlib/Algebra/Module/Submodule/Equiv.lean`).
- Finite dimension: `Module.finrank`, `FiniteDimensional`.

### From Tau Ceti

- `IsCoercive.formSolutionMap : H →L[ℝ] V`, `IsCoercive.formSolutionOperator : H →L[ℝ] H`,
  `apply_formSolutionMap`, `eq_formSolutionMap`, `isCompactOperator_formSolutionOperator`,
  `isSymmetric_formSolutionOperator`, `ker_formSolutionOperator`,
  `hasEigenvalue_formSolutionOperator_iff`, `finiteDimensional_eigenspace_formSolutionOperator`,
  `exists_hilbertBasis_forall_apply_eq_smul_inner`
  (`TauCeti/Analysis/InnerProductSpace/Variational/Spectrum.lean`): for a real coercive bilinear
  form `B` on a complete `V` and a continuous `J : V →L[ℝ] H`, the solution operator of
  `B u v = inner (h) (J v)`; its kernel is `(range J)ᗮ`, so density of `J` is what discards the
  zero eigenspace; the eigenbasis needs `J` compact and dense and `B` symmetric.
- `IsCoercive.isLeast_rayleighQuotient` (compact nonzero `J`, symmetric `B`) and
  `isGreatest_inv_norm_formSolutionOperator`
  (`TauCeti/Analysis/InnerProductSpace/Variational/Rayleigh.lean`).
- `IsCoercive.formPerturbationOperator`, `isCompactOperator_formPerturbationOperator`,
  `finiteDimensional_ker_one_sub_smul_formPerturbationOperator`,
  `fredholmAlternative_formPerturbation`
  (`TauCeti/Analysis/InnerProductSpace/Variational/Fredholm.lean`).
- `dirichletSolutionOperator`, `IsDirichletEigenvalue`, `exists_hilbertBasis_forall_isDirichletEigenvalue`
  (`TauCeti/Analysis/PDE/Spectrum.lean`): the Dirichlet instance of the real machinery, used
  as an example only.
- `subdifferential B f x` and `mem_subdifferential_iff` (`TauCeti/Analysis/Convex/Subdifferential.lean`),
  for a pairing `B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ` and `f : E → EReal`; `TauCeti/Analysis/Convex/FenchelMoreau.lean`
  for convex duality. Layer 2.1 adds only the constrained-minimum and normal-cone bridge.
- `LinearPMap.resolventSet`, `LinearPMap.IsResolventAt`, `LinearPMap.resolvent`
  (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent.lean`, re-exported with the resolvent
  identities by `TauCeti/Analysis/Normed/Operator/Resolvent/Unbounded.lean`): `z` is in the
  resolvent set when `z • I − A` is a bijection of the domain onto the space with a bounded
  inverse. `LinearPMap.subScalar` (`TauCeti/LinearAlgebra/LinearPMap/Shift.lean`) and
  `mem_resolventSet_subScalar_iff`, `resolvent_subScalar`
  (`TauCeti/Analysis/Normed/Operator/Resolvent/Shift.lean`) for shifted operators.
- `IsSelfAdjoint.smul_sub_bijective` and the surrounding self-adjoint resolvent API
  (`TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean`), for nonreal shifts of
  self-adjoint partial operators.

### From TauCetiRoadmap roadmaps

- BanachSpaceTheory B1: Mazur's lemma in its finite-convex-combination form for weakly
  convergent sequences; weak and weak-star continuity criteria by evaluation; Goldstine.
  BanachSpaceTheory B2: a Banach space is reflexive iff its closed unit ball is weakly compact;
  Eberlein–Šmulian (weakly compact iff weakly sequentially compact, with the relative version);
  Milman–Pettis; the finite norming sets of its James development.
- UnboundedOperators UO-D06: the coercive solution of a shifted Hermitian form over
  `[RCLike 𝕜]` and its identification at `𝕜 = ℝ` with Mathlib's
  `IsCoercive.continuousLinearEquivOfBilin`; `closedFormOperator` with its graph
  characterization `j u ∈ dom A ↔ ∃ h, ∀ v, a u v = inner h (j v)`, `A (j u) = h`; density,
  closedness, lower bound, self-adjointness, both adjoint inclusions, the resolvent estimate
  from shifted coercivity; the witness-independence lemma; the real-shift self-adjointness
  criterion with its form-solution specialization (bounded symmetric inverse `S : H → H`); for a
  real form, the identification of the complexified represented operator with the operator of
  the complexified form; `realSpectralRestriction` and the restricted projection family
  `P_R(B) = π_R ∘ P_{A_ℂ}(B) ∘ ι_H`.
- GeneralizedCohomology G5.5-RealHilbert: the Hilbert complexification, its real inclusion
  `ι_H`, conjugation `J`, completeness and the comparison with the Taylor-norm model.
- SelfAdjointSpectralTheory SA-C39–SA-C43 (graph cores and graph-norm equivalence),
  SA-C76–SA-C85 (form bounds), SA-D02 (`spectrum A` as the complement of the resolvent set),
  SA-D17–SA-D22 (nonreal points are resolvent points, reality of the spectrum, quantitative
  bound, real-point resolvent from a lower bound), SA-E01, SA-E03, SA-E05 (spectral PVM,
  spectral projections, resolvent formula, over `ℂ`).
- PolarDecomposition PD-A50–PD-A53.

## How to read the build

Layer 1 works over `ℝ` and supplies weak lower semicontinuity, the two direct methods and the
behaviour of compact maps on bounded sets, together with the real/complex dictionary through
which complex spaces use it. Layer 2 differentiates: first variations on constraints, quadratic
energies with their exact expansion and weak equation, the energy space and the forcing maps of
a coercive Hermitian form, and semibounded shifts. Layer 3 bundles the compact form pair and
minimizes the energy on constrained spheres of `H`, giving the restricted Euler–Lagrange
equation and the kernel-orthogonal Poincaré inequality. Layer 4 iterates the constrained
minimum into the ordered eigenbasis, proves completeness in the shifted energy inner product
without circularity, expands energies and proves Courant–Fischer on the form domain. Layer 5
specializes UnboundedOperators' represented operator to the compact pair: its shifted inverse
is the compact solution operator, its eigenbasis is Layer 4's, its domain is a weighted
summability condition, its spectrum is the eigenvalue sequence, and for a differential energy it
is the restricted composite `D₀† D₀`. Layer 6 approximates the eigenvalues from
finite-dimensional subspaces and collects the acceptance examples.

## Layer 1: weak lower semicontinuity and the direct method

**Sources:** Ivrii §13.1, Theorem 1 and the proof of Theorem 4; Hunter §4.2.

### 1.1 Energies, admissible sets and scalar restriction

Work on a real normed space `V` with real-valued energies `E : V → ℝ` and admissible sets
`S : Set V`. Define the bounded-sublevel predicate `∀ b : ℝ, Bornology.IsBounded {u ∈ S | E u ≤ b}`,
relative to `S`; prove it equivalent to its sequence formulation (every sequence in `S` with
bounded energy is norm bounded) and implied by `E(u) → +∞` as `‖u‖ → +∞` on `S`. Prove its
stability under restriction of `S`, intersection, affine translation, positive scaling, addition
of an energy bounded below on `S`, and change of variable by a continuous linear equivalence;
the sum of two energies with bounded sublevels need not have bounded sublevels unless one of
them is bounded below (Check below). *Needs:* Mathlib `Bornology.IsBounded`.

Define sequential weak lower semicontinuity of `E` on `S`: `E u ≤ liminf E(uₙ)` whenever
`uₙ ∈ S` and `uₙ ⇀ u ∈ S`, with the lower limit taken in `EReal` so that energy sequences
unbounded above are included; the minimizing-sequence form uses the finite limit. Prove that
weak lower semicontinuity on `S` (Mathlib `LowerSemicontinuousOn` on `toWeakSpace ℝ V '' S`)
is equivalent to weak closedness in `S` of every sublevel, and that it implies the sequential
version. Prove the converse on a weakly compact `K ⊆ S`: if `E` is sequentially weakly lower
semicontinuous on `K`, it is weakly lower semicontinuous there. Its input is the
**sequential-closure form of Eberlein–Šmulian**, owned here: for a weakly compact `K` in a
normed space, every point of the weak closure of `A ⊆ K` is the weak limit of a sequence in
`A`. Route: choose inductively `aₙ ∈ A` and finite norming sets `Dₙ` of the dual unit ball for
the finite-dimensional spans of `x, a₁, …, aₙ₋₁` with `|f(aₙ − x)| < 1/n` on `D₁ ∪ ⋯ ∪ Dₙ`; the
union `D` of the `Dₙ` is `1/2`-norming on the separable closed span `Y` of `{x, a₁, a₂, …}`, so
every weak cluster point `y ∈ Y` of `(aₙ)` satisfies `f(y − x) = 0` on `D` and equals `x`; a
sequence in a compact set with a unique cluster point converges to it. *Needs:* B2's finite
norming sets (Hahn–Banach `exists_dual_vector` and compactness of finite-dimensional spheres),
weak compactness of `K`.

Prove the real/complex dictionary for a normed space `V` over `𝕜`: a continuous real-linear
functional `f` on the restriction of scalars is the real part of exactly one continuous
`𝕜`-linear functional, `ℓ(x) = f(x) − I * f(I • x)`, with `‖ℓ‖ = ‖f‖`; hence the weak topology
of `RestrictScalars ℝ 𝕜 V` is the weak topology of `V`, weak convergence, weak compactness and
weak lower semicontinuity are the same notions over `ℝ` and over `𝕜`, the duals and biduals
correspond isometrically and `V` is reflexive over `𝕜` iff it is reflexive over `ℝ`. Prove that
every complete inner-product space over `𝕜` is reflexive: B2's Milman–Pettis theorem applies
because `InnerProductSpace.toUniformConvexSpace` makes it uniformly convex; the Riesz
isomorphism `InnerProductSpace.toDual` gives a direct route. *Needs:* B2 Milman–Pettis or
Mathlib `InnerProductSpace.toDual`; B1's evaluation criteria.

- Bounded sublevels relative to `S` are inherited by subsets of `S` and by the sum with an
  energy bounded below on `S`.
- Weak lower semicontinuity on `S` is equivalent to weak closedness in `S` of every sublevel,
  and implies sequential weak lower semicontinuity.
- On a weakly compact subset the sequential and topological notions agree.
- The weak topology of a complex normed space equals that of its real restriction; reflexivity
  is scalar independent; complete inner-product spaces are reflexive.

**Checks.**

- `E(u) = u²` on `V = ℝ` has bounded sublevels; `E(u) = u² − u⁴` has the unbounded sublevel
  `{E ≤ 0} ⊇ {|u| ≥ 1}`. The sum of `E₁(u) = u²` and `E₂(u) = −u²` is `0`, whose sublevels are
  unbounded: `E₂` is not bounded below, and the bounded-below hypothesis in the sum rule is
  necessary.
- On `ℓ²` the energy `E(u) = −‖u‖` is norm continuous, so lower semicontinuous, but the
  sequence `eₙ ⇀ 0` has `E(eₙ) = −1 < 0 = E(0)`: it is not sequentially weakly lower
  semicontinuous; `E(u) = ‖u‖` satisfies `E(0) = 0 ≤ liminf 1`.
- For `f = Re` on `ℂ` the dictionary gives `ℓ(1) = 1 − i·Re(i) = 1` and
  `ℓ(i) = Re(i) − i·Re(i²) = i`, so `ℓ` is the identity and is complex linear; the candidate
  `ℓ(x) = f(x) + i f(i x)` would give `ℓ(i) = −i`, which is not complex linear.
- `ℓ¹` is not reflexive (its bidual is `ℓ^∞* ⊋ ℓ¹`), so Milman–Pettis does not apply and `ℓ¹`
  is not uniformly convex: the midpoint of `e₁` and `e₂` has norm `1`.

### 1.2 Convex energies

Prove that a norm-lower-semicontinuous convex real function on a normed space is weakly lower
semicontinuous, by applying `Convex.toWeakSpace_closure` to its closed convex sublevels. Include
continuous convex functions, norms, norm powers `‖·‖ᵖ` with `p ≥ 1`, finite sums, `‖D u‖²` for
a bounded linear `D` (a quadratic energy, not a seminorm), and weakly continuous linear or real
affine terms; for a complex space convexity is real convexity. Give the sequential proof as a
second route: apply B1's Mazur lemma to convex combinations drawn from every tail of a
weakly convergent sequence, along a subsequence realizing the lower limit; convex combinations
of the whole sequence do not control the limiting energy (Check below). *Needs:* Mathlib
`Convex.toWeakSpace_closure`; B1 Mazur.

**Checks.**

- On `ℓ²`, `E(u) = ‖u‖²` and `eₙ ⇀ 0`: `E(0) = 0 ≤ 1 = liminf E(eₙ)`; `E(u) = −‖u‖²` gives
  `0 > −1`: concavity breaks the conclusion.
- The sequence `u_{2n} = eₙ`, `u_{2n+1} = 2 eₙ` in `ℓ²` converges weakly to `0` with
  `liminf ‖uₙ‖² = 1` and `limsup ‖uₙ‖² = 4`. Mazur applied to the tails of the whole sequence
  only gives `E(0) ≤ 4` (every tail contains vectors of energy `4`); applied to the subsequence
  `(eₙ)` realizing the lower limit it gives `E(0) = 0 ≤ 1`, the lower-semicontinuity
  inequality.
- `‖D u‖²` with `D = 0` is the zero energy, weakly lower semicontinuous; with `D` the inclusion
  `ℓ² → ℓ²` it is `‖u‖²`.

### 1.3 Compact maps on bounded sets

For a compact continuous linear map `j` from a normed space `V` to a normed space `F` prove:

1. weakly convergent sequences have norm-convergent images: uniform boundedness bounds the
   sequence, relative compactness gives norm-convergent subsequences, weak continuity of `j`
   identifies every subsequential limit with `j u`;
2. on every norm-bounded `B ⊆ V`, `j` is continuous from the restricted weak topology to the
   norm topology (`compactMap_continuousOn_weak_bounded`): the image lies in a norm-compact
   closure on which the norm and weak topologies of `F` agree, and `j` is weakly continuous;
3. `g ∘ j` for norm-continuous `g : F → ℝ` is sequentially weakly continuous on `V` and weakly
   continuous on bounded subsets; add it to the energies of 1.2 with these conclusions.

Prove the counterexample that fixes the limits of these statements: in an infinite-dimensional
`V` with injective `j`, every weak basic neighbourhood of `0` meets `{u | ‖j u‖ = 1}`, because
the common kernel of finitely many functionals contains a nonzero vector, which is normalized
by its `j`-norm; so `0` is in the weak closure of this sphere
(`zero_mem_weak_closure_embedded_unitSphere`), the sphere is not weakly closed, and `j` is not
globally weak-to-norm continuous. With compact `j` the same sphere is sequentially weakly
closed. Give the native example on `ℓ²`: the diagonal map with coefficients `1/(n+1)` is
compact (norm limit of its finite-rank truncations) and injective. *Needs:* Mathlib
`IsCompactOperator`, `isCompactOperator_of_tendsto` or finite-rank approximation,
`WeakSpace`.

**Checks.**

- For the diagonal `j` on `ℓ²` and `uₙ = (n+1) eₙ`: `uₙ` is not bounded, `‖j uₙ‖ = 1`, and
  `uₙ` does not converge weakly; the sequence `eₙ ⇀ 0` has `‖j eₙ‖ = 1/(n+1) → 0`.
- `j = id` on `ℓ²` is not compact: `eₙ ⇀ 0` but `‖j eₙ‖ = 1`; item 1 fails, as it must.
- With `V` finite dimensional every sphere is weakly closed and the counterexample's
  hypothesis fails: the common kernel of a basis of the dual is `{0}`.

### 1.4 Direct-method theorems

For a nonempty `S` in a reflexive Banach space `V` prove two versions
(`exists_isMinOn_of_weak_closed`, `exists_isMinOn_of_bounded_minimizing_sequence`).

- If `S` is weakly closed, `E` is weakly lower semicontinuous on `S` and the sublevels of `E`
  on `S` are norm bounded, then `E` attains its infimum on `S`. The sublevel at the value of
  one admissible point is nonempty, bounded and weakly closed, hence weakly compact by
  `NormedSpace.isCompact_closure_of_isBounded` and reflexivity; apply
  `LowerSemicontinuousOn.exists_isMinOn` and the transfer lemma below. No lower bound on `E` is
  assumed. The second route minimizes along a sequence and uses B2.
- If `S` is sequentially weakly closed, `E` is bounded below and sequentially weakly lower
  semicontinuous on `S`, and some minimizing sequence in `S` is norm bounded, then `E` attains
  its infimum. B2 (weak compactness of the closed ball and Eberlein–Šmulian) supplies a weakly
  convergent subsequence without separability. Bounded sublevels are a sufficient condition for
  the bounded minimizing sequence; a variant assumes sequential closedness and semicontinuity
  only within one bounded sublevel containing the sequence.

Construct minimizing sequences with `E uₙ < sInf (E '' S) + 1/(n+1)`, identify the attained
value with `sInf (E '' S)` (nonemptiness and lower boundedness), prove the transfer lemma (a
minimum of `E` on a nonempty sublevel `{u ∈ S | E u ≤ b}` is a minimum on `S`), compactness of
bounded sets of minimizers, subsequential weak convergence of bounded near-minimizers, and
stability under restriction to a nonempty weakly (respectively sequentially weakly) closed
subset. Near-minimizers converge in energy only; norm convergence needs the coercivity of
Layer 2.2. *Needs:* 1.1, 1.3; Mathlib `NormedSpace.isCompact_closure_of_isBounded`,
`LowerSemicontinuousOn.exists_isMinOn`; B2 reflexivity and Eberlein–Šmulian for the sequential
version. (Ivrii §13.1, proof of Theorem 4, step 1, is the sequential route for a Dirichlet
energy; Hunter §4.2, p. 95, names the direct method and takes the Riesz route instead.)

**Checks.**

- `E(u) = ‖u‖²` on `S = V = ℓ²`: the minimizer is `0`, the value `sInf = 0`.
- `E(u) = Σ |uₙ|²/(n+1)` on the unit sphere `S` of `ℓ²`: `E` is convex and continuous, hence
  weakly lower semicontinuous, and `S` is bounded, but `S` is not weakly closed (`eₙ ⇀ 0 ∉ S`);
  the infimum `0` (`E(eₙ) = 1/(n+1)`) is not attained since `E > 0` on `S`. The closedness
  hypothesis of both versions is necessary.
- `E(u) = ‖u‖` on `S = ℓ²`, minimizing sequence `uₙ = eₙ/(n+1)`: bounded, `E(uₙ) → 0 = sInf`,
  and the limit `0` is the minimizer; the sequence `uₙ = (n+1) eₙ` is not a minimizing
  sequence, since `E(uₙ) = n + 1`.
- Without the lower bound: `E(u) = −Re⟨e₀, u⟩` on `S = ℓ²` is weakly continuous, `S` is
  sequentially weakly closed, `E` is unbounded below and `sInf (E '' S)` is the junk value `0`;
  the constant sequence `uₙ = 0` is bounded with `E(uₙ) = 0 → 0`, and `E` has no minimizer. The
  hypothesis `BddBelow (E '' S)` is necessary in the sequential version.

### Examples

For the diagonal inclusion `j : ℓ² → ℓ²`, `(j u)ₙ = uₙ/(n+1)`, the energy `E(u) = ‖u‖² − 2 Re⟨e₀, u⟩`
on `S = ℓ²` has bounded sublevels (`‖u‖² − 2‖u‖ ≤ b` bounds `‖u‖`) and is weakly lower
semicontinuous (1.2); its minimizer is `e₀` with value `−1`. The sphere `{‖j u‖ = 1}` contains
`(n+1) eₙ`, which is unbounded and has no weakly convergent subsequence, so the direct method
needs the bounded-sublevel or bounded-sequence hypothesis on it.

### Dependencies

Mathlib only, and BanachSpaceTheory B1–B2 for the sequential routes, Mazur and Milman–Pettis.

## Layer 2: first variations, quadratic energies and shifts

**Sources:** Hunter Definition 4.3, Proposition 4.5, Corollary 4.6, Theorem 4.20, Theorem 4.22.

### 2.1 First variation and normal cones

For a real energy `E` on a Banach space, Fréchet differentiable at a minimizer `u` of `E` on an
affine subspace `u + W`, prove `dE(u) v = 0` for all `v ∈ W` (Hunter Definition 4.3 and the
critical-point remark, p. 94). For a closed convex constraint `C` prove the variational
inequality `dE(u)(v − u) ≥ 0` for all `v ∈ C` at a minimizer `u ∈ C`, through Mathlib
`IsLocalMinOn.hasFDerivWithinAt_nonneg` on the positive tangent cone `posTangentConeAt C u`,
and its converse for a differentiable convex `E`. State `IsLocalMinOn.fderivWithin_eq_zero` as
the two-sided case. For the nonsmooth form, use Tau Ceti `subdifferential B f x` with
`F = StrongDual ℝ V` and the evaluation pairing `B x f = f x`. Define the normal cone
`N_C(u) = {f : StrongDual ℝ V | ∀ v ∈ C, f (v − u) ≤ 0}` and the indicator of `C` with value
`0` on `C` and `⊤` outside. Prove the sum rule `∂(E + indicator C)(u) = ∂E(u) + N_C(u)` for
convex `C` and convex `E` continuous at some point of `C`: separate the epigraph of `E − E(u)`
from the translated set `{(v − u, t) | v ∈ C, t ≤ 0}` in `V × ℝ` and use continuity to obtain a
nonvertical separating functional, whose components are the subgradient and the normal-cone
inequality. For an inequality with a functional `η` on the left, subtract `η` from `E`, apply the
separation at the constrained minimum and restore `η`. Without a qualification condition keep
the unconditional statement `0 ∈ ∂(E + indicator C)(u)` at a constrained minimum. Include
translation, restriction, the unconstrained case and the equivalent one-sided directional
derivative statements with their existence hypotheses. *Needs:* Mathlib
`IsLocalMinOn.hasFDerivWithinAt_nonneg`, `IsLocalMinOn.fderivWithin_eq_zero`,
`posTangentConeAt`; Tau Ceti `subdifferential`; Mathlib geometric Hahn–Banach
(`geometric_hahn_banach_open`).

**Checks.**

- `E(u) = u²` on `V = ℝ`, `C = [1, 2]`: the minimizer is `1`, `dE(1) = 2`, and
  `2 (v − 1) ≥ 0` for `v ∈ C`; the normal cone at `1` is `(−∞, 0]`, and `−2 ∈ N_C(1)` gives
  `0 ∈ ∂E(1) + N_C(1) = {2} + (−∞, 0]`.
- `E(u) = |u|` on `ℝ`, `C = ℝ`: `∂E(0) = [−1, 1] ∋ 0`, the unconstrained nonsmooth condition
  at the minimizer `0`.
- Without the continuity qualification: in `ℝ²` let `C₁` and `C₂` be the closed unit discs
  centred at `(−1, 0)` and `(1, 0)`, touching at `0`, `E` the indicator of `C₁` and `C = C₂`.
  Then `E + indicator C` is the indicator of `{0}`, whose subdifferential at `0` is all of `ℝ²`,
  while `∂E(0) = N_{C₁}(0) = {(t, 0) | t ≥ 0}` and `N_C(0) = {(t, 0) | t ≤ 0}` sum to the line
  `ℝ × {0}`: the sum rule fails, and indeed `E` is continuous at no point of `C`.

### 2.2 Quadratic energies

For a bounded Hermitian form `a` on `V`, a continuous linear functional `ℓ : StrongDual 𝕜 V` and
the real energy `E(u) = q(u) − 2 Re ℓ(u)`, prove the exact expansion
`E(u + t v) − E(u) = 2 t Re(a u v − ℓ v) + t² q(v)` for real `t` (Hunter Proposition 4.5, p. 94,
for the Dirichlet energy with the factor `1/2`), the real derivative formula
`dE(u) v = 2 Re(a u v − ℓ v)`, and at a minimizer on `u + W` the weak equation `a u v = ℓ v` for
`v ∈ W`: over `ℝ` directly, over `ℂ` first the real-part identity and then the test with
`Complex.I • v`, which gives the imaginary part; a real-part identity by itself is not the
weak equation (Check below). Prove the converse with the exact energy gap
`E(u + h) − E(u) = q(h)` at a weak solution (Hunter Corollary 4.6, p. 95), so that the weak
equation and the minimum property are equivalent when `q ≥ 0`. For `q ≥ 0` prove the
Cauchy–Schwarz inequality `|a u v|² ≤ q(u) q(v)` by the real discriminant and the complex phase
test, and the kernel identity `{u | ∀ v, a u v = 0} = {u | q(u) = 0}`. For coercive `q`
(`c‖u‖² ≤ q(u)`) deduce `c‖h‖² ≤ E(u + h) − E(u)`, uniqueness of the minimizer, norm convergence
of every near-minimizer sequence at rate `‖uₙ − u‖² ≤ (E(uₙ) − E(u))/c`, and Lipschitz
dependence of the solution on `ℓ`. Include affine constraints and restrictions. At `𝕜 = ℝ`
identify the weak solution with Mathlib's Lax–Milgram solution
`IsCoercive.continuousLinearEquivOfBilin` (Hunter Theorem 4.20, p. 103) and, for forcing
`ℓ = inner h (j ·)`, with Tau Ceti `IsCoercive.formSolutionMap` through `apply_formSolutionMap`
and `eq_formSolutionMap`. *Needs:* 2.1; Mathlib `IsCoercive.continuousLinearEquivOfBilin`;
Tau Ceti `IsCoercive.eq_formSolutionMap`.

- The expansion and derivative formulas, with their real and complex forms.
- A minimizer on an affine subspace solves the weak equation on the direction space; a weak
  solution is a minimizer with the stated gap.
- Cauchy–Schwarz and the kernel identity for nonnegative forms.
- Uniqueness, norm convergence of near-minimizers and continuity in the forcing for coercive
  forms; identification with the native real solutions.

**Checks.**

- `V = ℂ`, `a u v = conj(u) v`, `ℓ = 0`, `u = 1`, `v = i`: `Re(a u v) = Re(i) = 0` although
  `a u v = i ≠ 0`; the test with `i • v = −1` gives `Re(a u (−1)) = −1 ≠ 0`, so the real-part
  identity alone does not prove the weak equation and the `I`-test is necessary.
- `V = ℝ`, `a u v = u v`, `ℓ v = 2 v`: `E(u) = u² − 4u`, minimizer `u = 2`, `a 2 v = 2v = ℓ v`,
  gap `E(2 + h) − E(2) = h²`.
- `q(u) = −‖u‖²` on `ℝ`: the "weak solution" `u = 0` of `a u v = 0` is a maximizer, and the gap
  formula gives `−h² ≤ 0`; the equivalence needs `q ≥ 0`.
- For `a = diag(1, −1)` on `𝕜²`, `u = (1, 1)` has `q(u) = 0` but `a u (1, 0) = 1 ≠ 0`: the kernel
  identity needs `q ≥ 0`.

### 2.3 Energy space and forcing maps

For a coercive Hermitian form `a` on `V` (`c‖u‖² ≤ q(u)`, `c > 0`), construct the energy space:
`V` with the inner product `a`, a complete inner-product space whose identity map to `V` is a
continuous linear equivalence, by the two-sided norm inequalities
`c‖u‖² ≤ q(u) ≤ ‖a‖ ‖u‖²`; completeness is transported through the equivalence. Consume the
coercive solution of UnboundedOperators UO-D06 over `[RCLike 𝕜]` (equivalently: minimize
`E(u) = q(u) − 2 Re ℓ(u)` on the real restriction by Layer 1.4, whose sublevels are bounded by
coercivity and which is weakly lower semicontinuous by 1.2, and apply 2.2's weak equation with
the `I`-test). Package the two solution maps of a compact form pair with shift `α ≥ ω`
(`CompactFormPair.exists_shifted_solution_maps`): the **`H`-forcing** map `S_α : H →L[𝕜] V`,
`a_α(S_α h, v) = inner h (j v)`, which is `𝕜`-linear since the right side is conjugate linear in
`h` and `a_α` is conjugate linear in its first slot; and the **dual-forcing** map
`F_α : StrongDual 𝕜 V →L⋆[𝕜] V`, `a_α(F_α ℓ, v) = ℓ v`, which is conjugate linear. Prove the
norm estimates `‖S_α h‖ ≤ c⁻¹ ‖j‖ ‖h‖` and `‖F_α ℓ‖ ≤ c⁻¹ ‖ℓ‖`, the identity
`S_α h = F_α (inner h (j ·))`, and that both inverse identities (`a_α(u, ·) = ℓ` iff
`u = F_α ℓ`) hold. At `𝕜 = ℝ` identify `S_α` with Tau Ceti `IsCoercive.formSolutionMap` for the
real bilinear form `a_α` and `j`. Mathlib `IsSelfAdjoint.eq_smul_self_of_isLocalExtrOn` is the
model of the complex-via-real-restriction pattern used throughout. *Needs:* 2.2; UO-D06's
coercive solution, or Layer 1.4 with 2.2; Tau Ceti `IsCoercive.formSolutionMap`.

- The energy space is complete and linearly homeomorphic to `V`.
- `S_α` is linear, `F_α` is conjugate linear, with the stated bounds and the comparison identity.
- The solution of `a_α(u, v) = ℓ v` is unique.

**Checks.**

- `V = H = ℂ`, `j = id`, `a u v = conj(u) v`, `α = 0`: `S_0 h = h` and `F_0 ℓ = conj(ℓ 1)`;
  scaling `ℓ` by `i` scales `F_0 ℓ` by `−i`, confirming conjugate linearity, while `S_0 (i h) = i S_0 h`.
- On `ℝ²` with `a = diag(1, 2)`: `F_0 ℓ = (ℓ e₁, ℓ e₂ / 2)`, and the bound
  `‖F_0 ℓ‖ ≤ c⁻¹‖ℓ‖` holds with `c = 1`; with `c = 2` it fails for `ℓ = e₁*`.
- A non-coercive form, `a = 0` on `ℝ`, has no solution map: `a_0(u, v) = ℓ v` has no solution for
  `ℓ ≠ 0`, and the energy space is not a normed space.

### 2.4 Semibounded shifts

For a form with the quantitative lower bound `c‖u‖² ≤ q(u) + ω‖j u‖²`, prove that every shifted
form `a_α` with `α ≥ ω` is coercive with the same constant `c` (since `(α − ω)‖j u‖² ≥ 0`),
that its energy norms for different `α ≥ ω` are equivalent to the norm of `V`, and that shifted
weak equations differ by `α inner (j u) (j v)`, the `H` inner product and not the `V` inner
product. Recover `a` from `a_α` by subtracting `α inner (j ·) (j ·)` and compare two shifts
through this identity. Independence of the represented operator from the chosen coercivity
and shift witnesses is a consequence of UO-D06's witness-independence lemma, recorded in
Layer 5.1 (Hunter Theorem 4.21 and Theorem 4.22, p. 103–105, for the Dirichlet form with
Gårding constant `γ`). *Needs:* 2.3.

**Checks.**

- `V = H = ℝ`, `j = id`, `q(u) = −u²`: the bound holds with `c = 1`, `ω = 2`; `a_2(u, u) = u²` is
  coercive and `a_1(u, u) = 0` is not: `α ≥ ω` is needed.
- `V = H = ℝ²`, `a = diag(1, −3)`: `ω = 4`, `c = 1`; `a_4 = diag(5, 1)`.
- `ω < 0` is allowed: `a = diag(2, 3)`, `ω = −1`, `c = 1`.

### Examples

For the diagonal pair on `ℓ²` with `(j u)ₙ = uₙ/(n+1)` on `V = ℓ²` and
`a u v = Σ conj(uₙ) vₙ`: `c = 1`, `ω = 0`, `S_0 h = j† h`, that is `(S_0 h)ₙ = hₙ/(n+1)`; the
weak equation `a(u, v) = inner h (j v)` reads `uₙ = hₙ/(n+1)`.

### Dependencies

Layer 1; Mathlib `LocalExtr`, `LaxMilgram`; Tau Ceti `Subdifferential`, `Variational/Spectrum`;
UnboundedOperators UO-D06 (coercive solution over `𝕜`).

## Layer 3: compactly embedded form domains and admissible spheres

**Sources:** Ivrii §13.1, Theorems 1–4; Hunter §4.8, §4.10.

### 3.1 Compact form pairs

Define `CompactFormPair 𝕜 V H` as the bundle of `j : V →L[𝕜] H` with its injectivity, density
and compactness, the bounded Hermitian form `a` with its Hermitian law, and the constants
`c > 0` and `ω` with the quantitative lower bound. Define `CompactFormPair.energy` as `q`.
Prove extensionality, restriction to a closed subspace `V₁ ≤ V` (with `H₁` the closure of
`j(V₁)`, since restriction can lose density), unitary transport in `H`, change to an
equivalent norm on `V`, shifts, finite orthogonal sums of pairs (the pair on `⊕ Vᵢ → ⊕ Hᵢ`
with the sum form, common shift `max ωᵢ` and constant `min cᵢ`), and the real restriction of a
complex pair (the form `Re a` on the real restrictions of scalars, same `c` and `ω`). Prove
that the energy and the constrained spheres do not depend on the witnesses `c` and `ω`. Keep
the native `j` and `a`; no Sobolev space is reconstructed. *Needs:* Mathlib `IsCompactOperator`,
`DenseRange`; 2.4.

- Extensionality in the data `(j, a)`; `c`, `ω` are witnesses.
- Restriction, unitary transport, equivalent norms, shifts, finite sums, real restriction.

**Checks.**

- `V = H = 𝕜ᵈ`, `j = id` (compact in finite dimension), `a` a Hermitian matrix: a pair with
  `c = 1`, `ω = ‖a‖ + 1`.
- The diagonal pair on `ℓ²`: `V = {u | Σ (n+1)² |uₙ|² < ∞}` with its norm, `H = ℓ²`, `j` the
  inclusion (compact: norm limit of truncations, injective, dense since it contains the finitely
  supported vectors), `a u v = Σ (n+1)² conj(uₙ) vₙ`, `c = 1`, `ω = 0`.
- Non-examples: `j = id` on an infinite-dimensional `ℓ²` is not compact; `j = 0` into `H ≠ 0` is
  not dense; the inclusion `ℓ² → ℓ²` of the first coordinate line is not dense.
- The finite sum of the diagonal pair with the `𝕜¹` pair `a = (−3)`: `ω = max(0, 4) = 4`,
  `c = 1`.

### 3.2 Constrained spheres and their minima

For a submodule `W` of `H` define the constrained sphere `CompactFormPair.unitConstraint`,
`S_W = {u : V | j u ∈ W ∧ ‖j u‖ = 1}`. Prove that `S_W` is nonempty iff some `u` has
`j u ∈ W` and `j u ≠ 0`; `W ≠ 0` alone does not suffice (Check below). For norm-closed `W`
prove that `S_W` is sequentially weakly closed (1.3 item 1 and closedness of `W`) and that its
intersection with every closed ball of `V` is weakly compact (reflexivity of `V` by 1.1,
`NormedSpace.isCompact_closure_of_isBounded`, and 1.3 item 2 on the ball). For every real `b`
prove that the sublevel `{u ∈ S_W | q(u) ≤ b}` is norm bounded, by `c‖u‖² ≤ q(u) + ω`, and
weakly compact: on the ball, `q + ω‖j·‖²` is convex and continuous, hence weakly lower
semicontinuous by 1.2, and `‖j u‖ = 1` on the sphere. Apply 1.4 (`exists_isMinOn_of_weak_closed`
on a nonempty sublevel, or the sequential version on `S_W`) to obtain
`CompactFormPair.exists_minimum_on_unitConstraint`: for closed `W` containing a nonzero
form-domain image, `q` attains its minimum on `S_W` (Ivrii §13.1, Theorem 4, item 2, for the
Dirichlet form). Prove normalization (the minimum of `q(u)/‖j u‖²` over `j u ∈ W`, `j u ≠ 0`),
phase invariance, the lower bound `min ≥ −ω`, compactness of the set of minimizers, and, at
`𝕜 = ℝ` and after a shift, agreement with Tau Ceti `IsCoercive.isLeast_rayleighQuotient` (whose
least value is `‖formSolutionOperator‖⁻¹` for the shifted form). *Needs:* 1.1–1.4, 2.4, 3.1;
Tau Ceti `IsCoercive.isLeast_rayleighQuotient`.

- Nonemptiness criterion; sequential weak closedness; bounded sublevels; weak compactness of
  bounded parts and of sublevels.
- Existence of the minimum; Rayleigh-quotient form; minimizer-set compactness.

**Checks.**

- Diagonal pair, `W = H`: the minimum is `1` at `u = e₀`; `q(e₀)/‖j e₀‖² = 1`.
- Diagonal pair, `W = {e₀}ᗮ`: the minimum is `4` at `e₁`.
- Diagonal pair, `W = span{x}` with `xₙ = 1/(n+1)`: `x ∈ ℓ²` but `Σ (n+1)² |xₙ|² = ∞`, so `x ∉ V`
  and `W ∩ range j = 0`; `S_W = ∅` although `W ≠ 0`.
- The sphere `S_H` of the diagonal pair is not weakly closed (1.3): `(n+1) eₙ ∈ S_H` is unbounded
  and `0` is in the weak closure; the sublevel `{q ≤ 1}` on `S_H` is `{e₀ · phase}`, compact.

### 3.3 The restricted Euler–Lagrange equation

Prove that a minimizer `u` of `q` on `S_W` satisfies `a u v = q(u) * inner (j u) (j v)` for every
`v : V` with `j v ∈ W` (`CompactFormPair.equation_of_constrained_minimum`): differentiate
`t ↦ q((u + t v)/‖j (u + t v)‖)` at `t = 0`, first for `v` with `j v ⊥ j u` and then after
splitting off the `j u`-component; over `ℂ` vary `Complex.I • v` as well. Closedness of `W` is
not needed for the equation. The equation is an eigen-equation for the restricted form on
`{v | j v ∈ W}`, not for the operator on `H` when `W` is arbitrary; the extension to all `v`
for successive minima uses the earlier eigenvectors (Layer 4.1). *Needs:* 2.2, 3.2; Mathlib
`IsSelfAdjoint.eq_smul_self_of_isLocalExtrOn` as model.

**Checks.**

- Diagonal pair, `W = H`, `u = e₀`: `a e₀ v = v₀ = q(e₀) inner e₀ v` with `q(e₀) = 1`.
- Diagonal pair, `W = {e₀}ᗮ`, `u = e₁`: `a e₁ v = 4 v₁ = q(e₁) inner e₁ v` for `v ⊥ e₀`; the
  equation also holds for `v = e₀` (both sides `0`), as Layer 4.1 proves in general.
- `𝕜 = ℂ`, `V = H = ℂ²`, `a = diag(1, 2)`, `W = H`: the minimizer `e₀` satisfies the equation
  with the phase test; the vector `u = (1, 1)/√2` with `q(u) = 3/2` is not a minimizer and
  `a u e₁ = 2/√2 ≠ (3/2) inner u e₁ = 3/(2√2)`.

### 3.4 The kernel-orthogonal Poincaré connector

For a pair with `q ≥ 0` define the form kernel `N = {u | ∀ v, a u v = 0}`, equal to
`{u | q(u) = 0}` by 2.2, and its image `j N`. Prove that the `V` and `H` norms are equivalent on
`N` (`c‖u‖² ≤ ω‖j u‖²` there), that compactness of `j` makes `N` finite dimensional and `j N`
closed, and that for `W = (j N)ᗮ` the minimum `δ` of `q` on `S_W` is strictly positive: a
minimizer with `q = 0` lies in `N`, so its image is a unit vector in `j N ∩ (j N)ᗮ`. Deduce
`q(u) ≥ δ ‖j u‖²` for `j u ⊥ j N` and, with the shifted bound, `V`-coercivity of `q` on that
subspace. Include the case `W = 0` (then `N` has `j N = H`, forced by density to be finite
dimensional, so `H` is finite dimensional), the kernel projections, forcing annihilating `N`,
uniqueness modulo `N`, and the best-constant characterization of `δ`. Solve `a u v = ℓ v` for
`ℓ` vanishing on `N`, modulo `N`, and identify the result at `𝕜 = ℝ` with Tau Ceti
`fredholmAlternative_formPerturbation` after the shifted-coercive reduction
(`a = a_α − α inner (j·) (j·)` is a compact perturbation of the coercive `a_α`). Nothing here
uses Layer 4. *Needs:* 2.2, 3.2, 3.3; Tau Ceti `fredholmAlternative_formPerturbation`,
`finiteDimensional_ker_one_sub_smul_formPerturbationOperator`.

**Checks.**

- Diagonal pair with `a u v = Σ n² conj(uₙ) vₙ` (so `e₀` has energy `0`): `N = span e₀`, `δ = 1`
  attained at `e₁`, and `q(u) ≥ ‖j u‖²` for `u ⊥ e₀`.
- `a = diag(1, −1)` on `𝕜²` is not nonnegative; `q(1, 1) = 0` but `(1, 1) ∉ N`: the hypothesis
  `q ≥ 0` is used in identifying `N` with `{q = 0}`.
- `𝕜²` with `a = 0`: `N = V`, `W = 0`, `S_W = ∅`, `δ` is not defined and `H` is finite
  dimensional, as the `W = 0` clause requires.

### Examples

For the Dirichlet form on a bounded open set, Tau Ceti `Analysis/PDE/Spectrum` is the real
instance of this layer: `dirichletSolutionOperator` is `S_0`, `IsDirichletEigenvalue` its
eigenvalues and `firstDirichletEigenvalue` the minimum of 3.2 with `W = H`; the comparison is
through `IsCoercive.formSolutionMap` at `𝕜 = ℝ`.

### Dependencies

Layers 1–2; Tau Ceti `Variational/Rayleigh`, `Variational/Fredholm`.

## Layer 4: successive minima, completeness and min–max

**Sources:** Ivrii §13.1, Theorem 4 and Corollary 1; Hunter Theorem 4.25, Theorem 4.37.

### 4.1 The ordered construction

Construct `u₀` as a minimizer of `q` on `S_H`, then `uₙ` as a minimizer on the sphere of
`W = {j u₀, …, j uₙ₋₁}ᗮ`, which is nonempty as long as fewer than `dim H` vectors have been
chosen: if `range j` lay in the span of finitely many `j uᵢ`, density would bound `dim H`.
Define `λₙ = q(uₙ)`; the sequence is nondecreasing (the spheres shrink) and bounded below by
`−ω`. Prove at each step the full weak eigen-equation `a uₙ v = λₙ inner (j uₙ) (j v)` for every
`v : V`: 3.3 gives it for `j v ⊥ j u₀, …, j uₙ₋₁`, and for `v = uₖ`, `k < n`, both sides vanish
by the Hermitian law and the earlier equations (`a uₙ uₖ = star (a uₖ uₙ) = star(λₖ inner (j uₖ) (j uₙ)) = 0`).
No completeness is used here. In finite dimension the construction stops after `dim H` steps
and yields a `Fin (finrank 𝕜 H)`-indexed orthonormal eigenbasis of `H`, empty for `H = 0`. In
infinite dimension prove `CompactFormPair.exists_ordered_eigenbasis`: a choice-based
`ℕ`-indexed family with `λₙ → +∞` (a bounded subsequence `λ_{nₖ} ≤ M` gives
`c‖u_{nₖ}‖² ≤ M + ω`, so compactness of `j` gives a norm-Cauchy subsequence of the orthonormal
`j u_{nₖ}`, contradicting `‖j uₙ − j uₘ‖² = 2`), and, independently, finite dimensionality of
every variational eigenspace `{u | ∀ v, a u v = λ inner (j u) (j v)}` (the shifted estimate makes
`j` bounded below on it, compactness forces finite dimension), orthogonality of distinct
eigenspaces in `H`, and finiteness of the set of eigenvalues below any bound (Ivrii §13.1,
Theorem 4, items 1 and 3 and its proof; Hunter Theorem 4.25, p. 109, where the finite
multiplicity and `λₙ → ∞` are read off the compact resolvent). State the eigenvalue sequence
with multiplicity and the set of distinct eigenvalues separately. Exhaustion of the eigenspaces
and separability of `H` follow only after 4.2. *Needs:* 3.2, 3.3; Mathlib `HilbertBasis`,
`Module.finrank`.

- Nonemptiness of each successive sphere below `dim H`; monotonicity and the lower bound.
- The full eigen-equation at each step; `λₙ → +∞`; finite multiplicities.

**Checks.**

- Diagonal pair: `uₙ = eₙ`, `λₙ = (n+1)²`, strictly increasing and divergent.
- `𝕜³` with `a = diag(1, 1, 3)`: `λ₀ = λ₁ = 1`, `λ₂ = 3`; the eigenvectors for `λ = 1` are any
  orthonormal pair in the plane `x₂ = 0`, so the family is not canonical and the statement is an
  existence statement.
- `H = 0`: the empty family; `𝕜¹` with `a = (−3)`: `λ₀ = −3 ≥ −ω` for `ω = 4`.
- An energy-orthogonal complement is not an `H`-orthogonal complement: in the diagonal pair,
  for `u = e₀ + e₁` the `a`-orthogonal complement is `{v | v₀ + 4 v₁ = 0}` and the
  `H`-orthogonal complement of `j u` is `{v | v₀ + v₁ = 0}`. The constraints of 4.1 are
  `H`-orthogonality to eigenvectors, where the two agree: for `u = e₀` both are `{v | v₀ = 0}`.

### 4.2 Completeness without circularity

Equip `V` with the shifted energy inner product `a_α`, `α ≥ ω`. From 4.1's equations,
`a_α(uₙ, v) = (λₙ + α) inner (j uₙ) (j v)` with `λₙ + α > 0` (strict: `c‖uₙ‖² ≤ λₙ + ω` and
`uₙ ≠ 0`), so energy-orthogonality to `uₙ` is equivalent to `H`-orthogonality to `j uₙ`. If the
closed energy span of the `uₙ` were proper, an energy-orthogonal `v ≠ 0`, normalized in `H`,
would be admissible at every step, giving `λₙ ≤ q(v)/‖j v‖²` for all `n` and contradicting
`λₙ → +∞`. Hence the `uₙ` span `V` in the energy topology; continuity and density of `j` make
`(j uₙ)` a Hilbert basis of `H` (Ivrii §13.1, proof of Theorem 4, last two paragraphs). In finite
dimension the orthonormal family has length `dim H` and is a basis. Now prove that every
variational eigenspace is spanned by the `uₙ` with that eigenvalue and that `H` is separable.
At `𝕜 = ℝ` prove the exact comparison with Tau Ceti
`exists_hilbertBasis_forall_apply_eq_smul_inner` for the real bilinear form `a_α` and `j`: the
eigenvalues `κ` of the solution operator correspond to `λₙ + α = κ⁻¹`, up to reindexing and
orthonormal changes within equal-eigenvalue blocks. *Needs:* 2.4, 4.1; Mathlib `HilbertBasis`;
Tau Ceti `exists_hilbertBasis_forall_apply_eq_smul_inner`.

**Checks.**

- Diagonal pair: `(eₙ)` is a Hilbert basis of `ℓ²`; in the energy inner product `a_0`, the
  vectors `eₙ/(n+1)` are orthonormal.
- Completeness needs the successive construction, not only divergence: the subfamily
  `(e_{2n})` of the diagonal pair is orthonormal with eigenvalues `(2n+1)² → ∞` but misses `e₁`.
  The vector `e₁` is energy-orthogonal to every `e_{2n}` and has Rayleigh quotient `4 < ∞`; no
  contradiction arises because `e₁` was never a competitor at a step of the subfamily, whereas
  in the full construction it is a competitor at step `1`.
- `𝕜²` with `a = diag(1, 3)`: the two eigenvectors form a basis; the real solution operator of
  `a_0` has eigenvalues `1` and `1/3`, matching `λ₀ + 0 = 1` and `λ₁ + 0 = 3`.

### 4.3 Expansions

Prove Parseval in `H`, `‖x‖² = Σ |inner (j uₙ) x|²`, and in the shifted energy,
`q(u) + α‖j u‖² = Σ (λₙ + α) |inner (j uₙ) (j u)|²` for `u : V`, with convergence in `V` of the
reconstruction `Σ inner (j uₙ) (j u) uₙ` (the energy-orthonormal vectors are `uₙ/√(λₙ+α)` and
`|a_α(uₙ/√(λₙ+α), u)|² = (λₙ + α) |inner (j uₙ) (j u)|²`). Conversely prove that
`x : H` with `Σ (λₙ + α) |inner (j uₙ) x|² < ∞` lies in `range j`. Include the finite-dimensional
versions, the polarized identities, truncation errors `‖u − Σ_{n<N} ⋯‖²_α = Σ_{n≥N} (λₙ+α)|⋯|²`,
the projections onto variational eigenspaces as orthogonal projections onto closed submodules
of `H`, and the finite-dimensional zero eigenspace when `q ≥ 0`. *Needs:* 4.2; Mathlib
`HilbertBasis.repr`, orthogonal projections.

**Checks.**

- Diagonal pair, `u = e₀ + e₁`: `q(u) = 1 + 4 = 5 = 1·|1|² + 4·|1|²`, and with `α = 1`:
  `q(u) + ‖j u‖² = 5 + 2 = 2·1 + 5·1 = 7`.
- `x = (1/(n+1))ₙ ∈ ℓ²`: `Σ (n+1)² |xₙ|² = Σ 1 = ∞`, so `x ∉ range j`, consistent with 3.2's
  Check; `x = (1/(n+1)²)ₙ` has `Σ (n+1)² /(n+1)⁴ < ∞` and lies in `range j`.
- Truncation at `N = 1` for `u = e₀ + e₁`, `α = 0`: `‖u − e₀‖²_0 = q(e₁) = 4`.

### 4.4 Courant–Fischer on the form domain

Define the min–max value `CompactFormPair.rayleighMinMax L n` of a submodule `L ≤ V` as the
infimum, over `(n+1)`-dimensional `M ≤ L`, of the supremum of `q(u)/‖j u‖²` over nonzero
`u ∈ M` (`‖j u‖ ≠ 0` by injectivity). It is the `n`-th successive minimum of the pair restricted
to `L`; for `dim L ≤ n` it is the junk value `0`. Prove Courant–Fischer
(`CompactFormPair.eigenvalue_eq_rayleighMinMax`): for a Hilbert basis `(j uₙ)` of form-domain
eigenvectors with nondecreasing eigenvalues `λₙ`, `λₙ = rayleighMinMax ⊤ n`, with attainment at
`M = span{u₀, …, uₙ}`. Upper estimate: on that span `q(Σ cₖ uₖ) = Σ λₖ |cₖ|² ≤ λₙ Σ |cₖ|²`.
Lower estimate: an `(n+1)`-dimensional `M` contains `u ≠ 0` with `j u ⊥ j u₀, …, j uₙ₋₁`
(`n` linear conditions), and 4.3 gives `q(u) + α‖j u‖² = Σ_{k≥n} (λₖ+α)|⋯|² ≥ (λₙ+α)‖j u‖²`.
The hypothesis is only the basis with monotone eigenvalues; divergence is not used. The
obstacle count is the **first `n`** eigenvectors: Ivrii §13.1, Corollary 1, as printed, takes
an `n`-dimensional `L` and a vector orthogonal to `u₁, …, uₙ`, which are `n` conditions on an
`n`-dimensional space and may leave only `0` (Check below); the count here is the corrected
one. Prove the dual formula `λₙ = sup` over `n`-dimensional obstacle subspaces `Z ≤ H` of the
infimum of `q(u)/‖j u‖²` over `j u ⊥ Z`, `j u ≠ 0`; the obstacles may lie in `H`. Prove
monotonicity under `L ≤ L'` and under `q ≤ q'`, finite-codimension interlacing
(`λₙ(L) ≤ λ_{n+d}(V)` for `L` of codimension `d`), the counting-function characterization of
`#{n | λₙ < t}` as the maximal dimension of a subspace on which `q(u) < t‖j u‖²` for all
`u ≠ 0`, and the perturbation estimate `|λₙ(a) − λₙ(b)| ≤ ε` when `|q_a(u) − q_b(u)| ≤ ε‖j u‖²`
on a shared pair. Courant–Fischer makes `λₙ` independent of every eigenvector choice. These are
form-domain versions; for finite-dimensional matrices consume PolarDecomposition PD-A50–PD-A53
with the order conversion `k ↦ d − 1 − k`. *Needs:* 4.2, 4.3; PolarDecomposition PD-A51–PD-A53.

- The min–max value and its junk case; attainment; the dual obstacle formula.
- Monotonicity, interlacing, counting function, perturbation bound, choice independence.

**Checks.**

- `𝕜³`, `a = diag(1, 3, 5)`, `n = 1`: `M = span{e₀, e₁}` has supremum `3`; `M = span{e₁, e₂}` has
  supremum `5`; the infimum over planes is `3 = λ₁`.
- The obstacle count: for `n = 1` and `M = span{e₀, e₁}`, the vector `e₁ ⊥ e₀` (one condition)
  gives `q(e₁) = 3 ≥ λ₁‖e₁‖²`; requiring orthogonality to `e₀` and `e₁` (two conditions on a
  plane) leaves only `0`, so Ivrii's printed count proves nothing here.
- Junk: `rayleighMinMax (span{e₀}) 1 = sInf ∅ = 0` in `𝕜³`, which is not an eigenvalue of
  `diag(1, 3, 5)`; the theorem is stated for `⊤` and the Ritz theorem of 6.1 only in the limit.
- Perturbation: `a = diag(1, 3)`, `b = diag(1.5, 3.5)` on `𝕜²`, `ε = 1/2`: `|λₙ(a) − λₙ(b)| = 1/2`.
- PD conversion in `𝕜³`: PD's `k = 0` sorted eigenvalue of `diag(1, 3, 5)` is `5 = λ₂`, and
  `d − 1 − 0 = 2`.

### Examples

For the Dirichlet form of the Laplacian on an interval `(0, π)` with `V = H¹₀`, `H = L²`,
`j` the inclusion, the eigenvalues are `λₙ = (n+1)²` with eigenvectors `sin((n+1)x)`, the Ritz
quotient of `sin x + sin 2x` is `(1 + 4)/2 = 5/2`, and Courant–Fischer with `n = 1` on
`span{sin x, sin 2x}` gives `4` (this instance is Tau Ceti's `Analysis/PDE/Spectrum` on an
interval).

### Dependencies

Layers 2–3; PolarDecomposition PD-A50–PD-A53; Tau Ceti `Variational/Spectrum`.

## Layer 5: the represented operator and the differential-energy adapter

**Sources:** Hunter §4.8 (p. 105–106), Theorem 4.25, Example 4.26.

### 5.1 The compact-pair specialization

The operator of a compact form pair is UnboundedOperators UO-D06's `closedFormOperator` on the
pair's `(j, a)` with any admissible shift; the pair's `c`, `ω` discharge D06's quantitative
hypothesis, and D06's witness-independence lemma shows the operator does not depend on them.
Its graph is `{(j u, f) | ∀ v, a u v = inner f (j v)}`; density of `range j` and injectivity make
both representatives unique. Define `CompactFormPair.operatorDomainV` as the submodule of
`u : V` with such an `f`; the operator domain is its image under `j`. Derive from D06's graph
theorem, without a second construction: symmetry, closedness, density, the lower bound `−ω`,
self-adjointness (D06's real-shift criterion applied to `A + α`, surjective by 2.3) and both
adjoint inclusions. Prove `CompactFormPair.exists_compact_selfAdjoint_shifted_inverse`: for
every self-adjoint partial operator `A` whose graph is the representing relation of the pair
and every `α ≥ ω`, there is a compact self-adjoint `S_α : H →L[𝕜] H` with
`A (S_α h) + α S_α h = h` and `S_α (A x + α x) = x`; it is `j ∘ S_α` for the `H`-forcing map of
2.3, compact since `j` is, and symmetric by the Hermitian law. Prove `S_α` positive, injective,
with dense range `dom A`; at `𝕜 = ℝ` identify it with Tau Ceti `IsCoercive.formSolutionOperator`
for the real bilinear form `a_α` and `j` (`formSolutionOperator = J ∘ formSolutionMap`), with
`isCompactOperator_formSolutionOperator` and `isSymmetric_formSolutionOperator` as the native
compactness and symmetry (Hunter §4.8, equation (4.26), p. 106). Normalize signs:
`S_α = (A + α)⁻¹ = −R_A(−α)` since the shared resolvent is `(z I − A)⁻¹`; through Tau Ceti
`mem_resolventSet_subScalar_iff` and `resolvent_subScalar` the shift is `subScalar A (−α)`.
For nonreal `z` consume `IsSelfAdjoint.smul_sub_bijective` and SA-D17–SA-D19. Identify Layer 4's
ordered eigenbasis with the eigenbasis of `A`: `A (j uₙ) = λₙ j uₙ`, and `S_α (j uₙ) = (λₙ+α)⁻¹ j uₙ`.
*Needs:* 2.3, 2.4, 4.1, 4.2; UO-D06 (`closedFormOperator`, graph characterization, witness
independence, real-shift criterion); Tau Ceti `IsCoercive.formSolutionOperator` and its
compactness and symmetry, `mem_resolventSet_subScalar_iff`, `resolvent_subScalar`,
`IsSelfAdjoint.smul_sub_bijective`; SelfAdjointSpectralTheory SA-D17–SA-D22.

- The operator domain is `j (operatorDomainV)` and the action is `j u ↦ f`.
- Compact self-adjoint positive injective `S_α` with dense range, the sign convention, the
  identification at `𝕜 = ℝ`, and the eigenbasis identification.

**Checks.**

- Diagonal pair: `dom A = {x | Σ (n+1)⁴ |xₙ|² < ∞}`, `(A x)ₙ = (n+1)² xₙ`,
  `S_α eₙ = eₙ/((n+1)² + α)`; `R_A(−α) e₀ = e₀/(−α − 1) = −S_α e₀`, confirming the sign.
- `𝕜²`, `a = diag(1, −3)`, `ω = 4`, `α = 4`: `S_4 = diag(1/5, 1)`, positive; `α = 2` is not
  admissible, and `A + 2 = diag(3, −1)` is invertible but not positive: the positivity claim is
  for `α ≥ ω` only.
- `H = 0`: `A` and `S_α` are the zero maps on the zero space; every statement is trivial.
- Witness independence: the diagonal pair with `ω = 0, c = 1` and with `ω = 5, c = 1` has the
  same graph `{(x, ((n+1)² xₙ))}`.

### 5.2 Domain expansions, spectrum and weak equations

Prove the domain expansion `CompactFormPair.mem_operatorDomainV_iff_summable`: for a Hilbert
basis `(j uₙ)` of form-domain eigenvectors, `u ∈ operatorDomainV` iff
`Σ λₙ² |inner (j uₙ) (j u)|² < ∞`, the representative being `f = Σ λₙ inner (j uₙ) (j u) j uₙ`
(from `inner f (j uₙ) = a u uₙ = λₙ inner (j u) (j uₙ)` in one direction and 4.3's polarized
expansion `a u v = Σ λₙ inner (j u) (j uₙ) inner (j uₙ) (j v)` in the other). Prove the
graph-norm Parseval identity, that finite spans of eigenvectors form a graph core (SA-C39),
and the finite-dimensional case. For a complex eigenbasis `b`, its realification is the real
orthonormal family `{bₙ, I • bₙ}`, so a complex eigenspace of dimension `m` has real dimension
`2m`; compare native real multiplicity blocks only after this doubling. Identify the spectrum
(`CompactFormPair.mem_resolventSet_iff`): for a self-adjoint `A` with the representing graph and
an eigenbasis with `λₙ → +∞`, the shift `z • I − A` has a bounded two-sided inverse on `H`
(membership in Tau Ceti `LinearPMap.resolventSet`, unfolded) iff `z ≠ λₙ` for all `n`; the
inverse is the coefficient multiplier `x ↦ Σ (z − λₙ)⁻¹ inner (j uₙ) x j uₙ`, bounded because
`λₙ → ∞` keeps `inf |z − λₙ| > 0`, and at `z = λₙ` the shift kills `j uₙ`. Hence SA-D02's
spectrum is the closed set `{λₙ}`, every `λₙ` is an eigenvalue with the finite-dimensional
eigenspace of 4.1, and for `H ≠ 0` `‖R_A(z)‖ = 1/infDist(z, {λₙ})` (a nearest eigenvalue gives the
lower bound); for `H = 0` the spectrum is empty and every resolvent is `0`. Over `ℂ` identify
SA-E03's `P_A({λ})` with the orthogonal projection onto the `λ`-eigenspace and `P_A(B)` with the
sum of the eigenprojections for `λₙ ∈ B`, and compare SA-E05's resolvent formula with the
coefficient multiplier; for real pairs carry these through UO-D06's complexified operator and
its restricted projection family `P_R`. For the weak equation `a u v − λ inner (j u) (j v) = ℓ v`
at `λ = λₙ`, prove solvability iff `ℓ` annihilates the eigenspace, with solutions unique modulo
it (Hunter §4.10, the alternatives after Theorem 4.25, p. 109–110); off the spectrum prove
uniqueness and the bound through the resolvent. For `ℓ : StrongDual 𝕜 V` use 2.3's dual-forcing
map and the expansion in `V`; distinguish `H`-forcing, dual forcing and membership in `dom A`.
*Needs:* 4.3, 5.1; Tau Ceti `LinearPMap.resolventSet`, `IsResolventAt`; SelfAdjointSpectralTheory
SA-C39, SA-D02, SA-E03, SA-E05; UO-D06 (`realSpectralRestriction`, `P_R`).

**Checks.**

- Diagonal pair, `x = (1/(n+1)³)ₙ`: `Σ (n+1)⁴ /(n+1)⁶ < ∞`, so `x ∈ dom A` with
  `(A x)ₙ = 1/(n+1)`; `x = (1/(n+1)²)ₙ` is in `range j` (4.3) but `Σ (n+1)⁴/(n+1)⁴ = ∞`, so
  `x ∉ dom A`: form domain and operator domain differ.
- Spectrum of the diagonal pair: `{1, 4, 9, …}`; `z = 0` is a resolvent point with
  `‖R_A(0)‖ = 1 = 1/dist(0, {1, 4, …})`; `z = 4` is not, since `(4 − A) e₁ = 0`.
- Complex realification: `𝕜 = ℂ`, `H = ℂ`, eigenvalue `λ₀ = 1` of multiplicity `1`; the real
  restriction has the orthonormal eigenvectors `1` and `i`, multiplicity `2`.
- Weak equation at `λ = 1` in the diagonal pair with `ℓ = inner e₀ (j ·)`: no solution, since
  `ℓ e₀ ≠ 0`; with `ℓ = inner e₁ (j ·)`: the solutions are `e₁/(4 − 1) + t e₀`.

### 5.3 The differential-energy adapter

Suppose `a u v = inner (D u) (D v)` for a bounded `D : V →L[𝕜] K` into an inner-product space `K`
(completeness of `K` is not needed), together with the pair's graph estimate
`c‖u‖² ≤ ‖D u‖² + ω‖j u‖²`. Define `CompactFormPair.differentialOperator D` as the partial
operator `D₀ : H →ₗ.[𝕜] K` with domain `range j` and action `j u ↦ D u`, through the linear
equivalence `V ≃ range j` of the injective `j`. Prove that its graph norm `‖j u‖² + ‖D u‖²` is
equivalent to the norm of `V`, so `D₀` is closed, and densely defined. Prove the identification
(`CompactFormPair.mem_operatorDomainV_iff_mem_adjoint_domain`): with the native partial adjoint
`D₀† : K →ₗ.[𝕜] H`, `u ∈ operatorDomainV` iff `D u ∈ dom D₀†`, and then `a u v = inner (D₀† (D u)) (j v)`,
so the represented operator is `j u ↦ D₀† (D u)`: `D u ∈ dom D₀†` means that `j v ↦ inner (D u) (D v)`
is continuous for the norm of `H` on `range j`, which by Riesz and density is the existence of
the representative. The convention check: Mathlib's `inner (D₀† y) x = inner y (D₀ x)` with
`y = D u`, `x = j v` reads `inner (D₀† (D u)) (j v) = inner (D u) (D v) = a u v`. Define the
domain-restricted composite `D₀† D₀` as a partial operator on `H` with domain
`{j u | D u ∈ dom D₀†}` and action `j u ↦ D₀† (D u)`, with its graph, restriction and equality
API; Mathlib `LinearPMap.comp` is not this operator, since it requires all of `range D₀` in
`dom D₀†`. The Hilbert adjoint of the bounded map `D : V → K` is a map `K → V` and is not `D₀†`.
*Needs:* 3.1, 5.1; Mathlib `LinearPMap.adjoint`, `LinearEquiv.ofInjective`.

- `D₀` is closed and densely defined with graph norm equivalent to `V`'s norm.
- The adjoint-domain identification and the representing vector; the restricted composite.

**Checks.**

- Diagonal pair with `K = ℓ²` and `(D u)ₙ = (n+1) uₙ`: `a u v = inner (D u) (D v)`; `D₀†` has
  domain `{y | ((n+1) yₙ) ∈ ℓ²}` and action `y ↦ ((n+1) yₙ)`; `D u ∈ dom D₀†` iff
  `((n+1)² uₙ) ∈ ℓ²`, which is 5.1's domain, and `D₀† (D u) = ((n+1)² uₙ) = A (j u)`.
- `D = 0`: the form is `0`, `operatorDomainV = V`, `D₀ = 0` on `range j`, `dom D₀† = K`, and
  `D₀† (D u) = 0 = A (j u)`.
- `V = H = K = ℂ`, `j = id`, `D = id`: `D₀ = id`, `D₀† = id`, `A = id`; `D = 2·id` gives
  `a = 4 inner`, `D₀† = 2·id` and `A = 4·id`, so the representative is `D₀†(D u) = 4u`, not `2u`.
- The composite is not `LinearPMap.comp`: in the diagonal example `u = (1/(n+1)²)ₙ` lies in
  `V` (`Σ (n+1)²/(n+1)⁴ < ∞`) but `D u = (1/(n+1))ₙ` is not in `dom D₀†` (`(n+1) · 1/(n+1) = 1`
  is not square summable), so `range D₀ ⊄ dom D₀†`; the restricted composite has domain
  `{j u | ((n+1)² uₙ) ∈ ℓ²}`.

### Examples

For the diagonal pair with `D` as in 5.3 and `α = 0`, the three operators are
`S_0 = diag(1/(n+1)²)`, `A = diag((n+1)²)` on `dom A = {x | ((n+1)² xₙ) ∈ ℓ²}`, and
`D₀† D₀ = A`; the resolvent at `z = 1/2` has norm `1/(1 − 1/2) = 2`.

### Dependencies

Layers 2–4; UnboundedOperators UO-D06; SelfAdjointSpectralTheory Parts C–E; Tau Ceti
`Resolvent/Shift`, `LinearPMap/SelfAdjoint`, `Variational/Spectrum`.

## Layer 6: Ritz–Galerkin approximation

**Sources:** Ivrii §13.1, Corollary 1 (corrected as in 4.4); Hunter Theorem 4.37 (p. 122).

### 6.1 Ritz–Galerkin convergence

For finite-dimensional subspaces `Vₘ ≤ V`, nested and with union dense in `V` (equivalently in
the shifted energy norm), define the `n`-th Ritz value as `rayleighMinMax Vₘ n`, the `n`-th
successive minimum of the pair restricted to `Vₘ → j(Vₘ)` (a finite-dimensional pair with `H`
replaced by the closed image `j(Vₘ)`). For a basis `φ₁, …, φ_d` of `Vₘ` define the energy
matrix `A_{m,ij} = a φᵢ φⱼ` (row index in the conjugate slot) and the Gram matrix
`G_{m,ij} = inner (j φᵢ) (j φⱼ)`, positive definite since `j` is injective; prove that the Ritz
values are the generalized eigenvalues `A_m c = λ G_m c`, `c ≠ 0`, with multiplicity, and equal
the eigenvalues of the Hermitian matrix `G_m^{−1/2} A_m G_m^{−1/2}` in PolarDecomposition's
order after the conversion `k ↦ d − 1 − k`. Coordinate changes must transport the generalized
equation; a basis is not assumed `H`-orthonormal. Prove the convergence theorem
(`CompactFormPair.tendsto_rayleighMinMax`): for every `n`, `rayleighMinMax Vₘ n → λₙ` as
`m → ∞`, for any Hilbert basis of form-domain eigenvectors with nondecreasing eigenvalues.
Lower estimate: `rayleighMinMax Vₘ n ≥ rayleighMinMax ⊤ n = λₙ` by 4.4, once `dim Vₘ > n`.
Upper estimate: approximate `u₀, …, uₙ` in the norm of `V` by vectors of `Vₘ`; for large `m`
they are linearly independent with `H`-Gram matrix close to the identity, and the supremum of
the Rayleigh quotient on their span is within `ε` of that on `span{u₀, …, uₙ}`, which is `λₙ`.
Since the `Vₘ` are nested the Ritz values are nonincreasing in `m` once `dim Vₘ > n`; for
`dim Vₘ ≤ n` the value is the junk `0`, which the limit ignores because `dim Vₘ → ∞`. Give
quantitative error bounds in terms of the energy-norm distance from `span{u₀, …, uₙ}` to `Vₘ`,
convergence of the spectral projections of isolated eigenvalues with an explicit gap, and
subsequential convergence of Ritz vectors up to phases and rotations within multiplicity
blocks. *Needs:* 4.4; PolarDecomposition PD-A50–PD-A53; Mathlib `Matrix.IsHermitian`.

- The Ritz values as generalized eigenvalues and as eigenvalues of the normalized Hermitian
  matrix.
- Monotonicity in `m`, the limit theorem, error bounds, projection and vector convergence.

**Checks.**

- Diagonal pair, `Vₘ = span{e₀, …, e_{m−1}}`: the Ritz values are exactly `1, 4, …, m²`
  (invariant subspaces give equality), and `rayleighMinMax Vₘ n = (n+1)²` for `n < m`.
- `V₁ = span{e₀ + e₁}`: the Ritz value is `q(e₀+e₁)/‖j(e₀+e₁)‖² = 5/2 ≥ λ₀ = 1`, and the Gram
  matrix `G = 2 ≠ 1` shows why the generalized problem, not `A_m` alone (which gives `5`), is
  the right one.
- Density is needed: `Vₘ = span{e₁, …, eₘ}` (nested, never containing `e₀`) has `n = 0` Ritz
  values equal to `4` for every `m`, not converging to `λ₀ = 1`; the union is not dense in `V`.
- `𝕜²`, `a = diag(1, 3)`, basis `φ₁ = e₀`, `φ₂ = e₀ + e₁`: `A_m = [[1, 1], [1, 4]]`,
  `G_m = [[1, 1], [1, 2]]`, and `det(A_m − λ G_m) = (1 − λ)(4 − 2λ) − (1 − λ)² = (1 − λ)(3 − λ)`
  gives the Ritz values `1, 3`, the eigenvalues; `A_m` alone has eigenvalues `(5 ± √13)/2`.

### 6.2 Acceptance examples

Prove, as acceptance examples against the preceding layers: the finite-dimensional matrix pair
of 3.1 with its successive minima by PolarDecomposition; the zero space (`H = 0`, empty
eigenbasis, empty spectrum, zero resolvent); a non-dense `J` (the inclusion of a coordinate
line into `ℓ²`), where Tau Ceti's `ker_formSolutionOperator = (range J)ᗮ` is nonzero and no
eigenbasis of `H` is claimed; and a noncompact embedding (`j = id` on `ℓ²` with
`a u v = Σ (1 + 1/(n+1)) conj(uₙ) vₙ`), where the Rayleigh infimum `1` is not attained, the
spectrum of `A` is `{1 + 1/(n+1)} ∪ {1}` and `1` is not an eigenvalue, so no discrete complete
eigenbasis is asserted (Hunter Example 4.26, p. 109, is the noncompact `−Δ` on `ℝⁿ`). The
Dirichlet instance of Tau Ceti `Analysis/PDE/Spectrum` is the real compact example. *Needs:*
Layers 3–5; Tau Ceti `ker_formSolutionOperator`, `Analysis/PDE/Spectrum`.

**Checks.**

- Non-dense `J`: `V = 𝕜`, `H = 𝕜²`, `J u = (u, 0)`, `a u v = conj(u) v`: `formSolutionOperator`
  is `diag(1, 0)` with kernel `span e₁ = (range J)ᗮ`.
- Noncompact example: `inf q(u)/‖u‖² = 1` is not attained since `q(u) > ‖u‖²` for `u ≠ 0`;
  `R_A(1)` does not exist since `A − 1 = diag(1/(n+1))` has unbounded inverse.
- `H = 0`: `rayleighMinMax ⊤ 0 = sInf ∅ = 0`, a junk value that no theorem of Layers 4–6 uses,
  since all of them assume an infinite-dimensional `H` or `dim L > n`.

### Examples

For the diagonal pair with `Vₘ = span{e₀, …, e_{m−1}}` the Ritz vectors are the exact
eigenvectors and all error bounds are `0`; for `Vₘ = span{e₀ + e₁/m, e₁, …, e_{m−1}}` the Ritz
value for `n = 0` is `≤ q(e₀ + e₁/m)/‖j(e₀ + e₁/m)‖² = (1 + 4/m²)/(1 + 1/m²) → 1`.

### Dependencies

Layers 3–5; PolarDecomposition PD-A50–PD-A53; Tau Ceti `Variational/Spectrum`, `Analysis/PDE/Spectrum`.

## Downstream consumers

- ComplexKahlerGeometry K5a consumes Layers 2–5: the compact form pair of a nonnegative
  Laplace-type system on a compact boundaryless manifold (`V = H¹(E)`, `H = L²(E)`, Rellich
  compactness owned there), 3.1's finite orthogonal sums for component families, the
  represented operator of 5.1 with its compact resolvent and eigen-expansions, and 5.3's
  abstract adapter with `K = L²(F)` and `D` a first-order operator; it owns the identification
  of the operator domain with `H²` by elliptic regularity, the smoothness of eigensections and
  the Hodge-theoretic consequences for `D = d + d*`.
- PseudodifferentialOperators P6–P7 consume K5a's realization and, through it, Layer 5.
- PDE Lane D–E keep their bounded-domain constructions on Mathlib and Tau Ceti directly; Tau
  Ceti `Analysis/PDE/Spectrum` is an instance of Layers 3–5 and is used here only as an example.
- UnboundedOperators UO-D06 is a supplier, not a consumer: nothing in this roadmap is cited by
  its closed-form representation.

## References

- V. Ivrii, *Partial Differential Equations* (online textbook), Chapter 13, §13.1 "Variational
  theory", Theorems 1–4, Remark 2 and Corollary 1,
  <https://www.math.toronto.edu/ivrii/PDE-textbook/Chapter13/S13.1.html>. Corollary 1 as printed
  uses `n` obstacle vectors for an `n`-dimensional subspace; Layer 4.4 uses the first `n` for an
  `(n+1)`-dimensional one.
- J. K. Hunter, *Notes on Partial Differential Equations*, Chapter 4 "Elliptic PDEs":
  Definition 4.3 and Proposition 4.5 (p. 93–94), Corollary 4.6 (p. 95), Theorem 4.20 (Lax–Milgram,
  p. 103), Theorems 4.21–4.22 (p. 103–105), §4.8 (compactness of the resolvent, p. 105–106),
  Theorem 4.25 and Example 4.26 (§4.10, p. 109), Theorem 4.37 (p. 122),
  <https://www.math.ucdavis.edu/~hunter/pdes/pde_notes.pdf>.
- Mathlib: `Mathlib/Analysis/LocallyConvex/WeakSpace.lean`, `Mathlib/Analysis/Normed/Module/DoubleDual.lean`,
  `Mathlib/Topology/Semicontinuity/Basic.lean`, `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`,
  `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean`, `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean`,
  `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean`, `Mathlib/Analysis/InnerProductSpace/Convex.lean`.
- Tau Ceti: `TauCeti/Analysis/InnerProductSpace/Variational/{Spectrum,Rayleigh,Fredholm}.lean`,
  `TauCeti/Analysis/PDE/Spectrum.lean`, `TauCeti/Analysis/Convex/Subdifferential.lean`,
  `TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent.lean`,
  `TauCeti/Analysis/Normed/Operator/Resolvent/{Unbounded,Shift}.lean`,
  `TauCeti/LinearAlgebra/LinearPMap/Shift.lean`, `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean`.
