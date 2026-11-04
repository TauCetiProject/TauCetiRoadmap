# Roadmap: elliptic analysis of pseudoholomorphic curves

**Summary.** Build the elliptic regularity theory of the Cauchy–Riemann equation as symplectic
topology uses it. That means Sobolev maps from Riemann surfaces into almost complex manifolds,
including surfaces with boundary and totally real boundary conditions. It also means the weak
nonlinear Cauchy–Riemann equation with finite-regularity, domain-dependent and inhomogeneous
data, and the linear estimates for real Cauchy–Riemann operators whose coefficients are only
Sobolev. Building on these, prove the nonlinear bootstrapping theorem, its uniform version for
sequences, and Fredholm theory and Riemann–Roch for real Cauchy–Riemann operators on compact
surfaces with boundary. The spine is McDuff–Salamon, *J-holomorphic Curves and Symplectic
Topology* (2nd ed., AMS Colloquium Publications 52, 2012), Appendices B and C and Chapter 3.

The headline theorem (PH5.1, McDuff–Salamon Theorem B.4.1 and Remark B.4.3): let `p > 2` be
finite, let `(Σ, j)` be a Riemann surface, and let `J` be a `C^ℓ` almost complex structure on
`M`. A `W^{1,p}_loc` map `u : Σ → M` with `du ∘ j = J(u) ∘ du` almost everywhere is of class
`W^{ℓ+1,p}_loc` when `ℓ ≥ 1` and `∂Σ = ∅`. If instead `u(∂Σ) ⊆ L` for a closed smooth totally
real submanifold `L ⊆ M`, then `u` is of class `W^{ℓ,p}_loc` up to the boundary when `ℓ ≥ 2`.
In both cases `u` is smooth when `J` is smooth.

## Scope and ownership

This roadmap owns:

- the local `W^{k,p}` theory of maps from planar domains and half-discs into finite-dimensional
  real normed spaces (PH1);
- `C^ℓ` almost complex structures, totally real embedded submanifolds, and isothermal
  coordinates on surfaces (PH2);
- the linear planar Cauchy–Riemann estimates: the Cauchy and Beurling operators on Hölder and
  `Lᵖ` scales, interior and totally real boundary estimates with Sobolev coefficients, weak
  solution regularity, the similarity principle and unique continuation (PH3);
- intrinsic `W^{k,p}_loc` maps from surfaces into manifolds and the weak pseudoholomorphic
  equation (PH4);
- nonlinear bootstrapping and its uniform version for sequences (PH5);
- Sobolev sections of bundles over compact surfaces with boundary, real Cauchy–Riemann
  operators on them, and their Fredholm theory (PH6);
- the Maslov index of a bundle pair and closed and bordered Riemann–Roch (PH7).

Outside this roadmap:

- [PDE](../PDE/README.md) Lane A owns the scalar Sobolev spaces `W^{k,p}(Ω)` of Euclidean
  domains, their embeddings, extension, trace and Rellich theory. PDE Lane E owns scalar
  second-order elliptic regularity. This roadmap consumes Lane A and never restates it.
- [HeegaardFloer](../HeegaardFloer/README.md) owns:
  - Banach manifolds of `W^{k,p}` maps and Fredholm sections (Layer 2);
  - spectral flow, Conley–Zehnder indices and determinant lines (F1.3–F1.4);
  - punctured surfaces with cylindrical ends and weighted Sobolev spaces (F1.5);
  - the local theory of Chapter 2 of McDuff–Salamon: critical points, intersections and
    somewhere injectivity (F2.2);
  - compactness, transversality and gluing for moduli spaces (F2.3–F2.5).

  HeegaardFloer consumes this roadmap and supplies nothing to it.
- [PseudodifferentialOperators](../PseudodifferentialOperators/README.md#62-regularity-and-solvability)
  P6 owns elliptic regularity and Fredholm theory for smooth-coefficient operators of
  arbitrary order on closed manifolds. This roadmap owns the first-order Cauchy–Riemann case
  with Sobolev coefficients and totally real boundary conditions, which P6 does not cover.
  PH6.4 proves the agreement on their common case.

Every surface here is two-dimensional and every target manifold is finite-dimensional. Elliptic
systems in other dimensions, Hilbert-scale `H^s` spaces of non-integer order, and
pseudodifferential parametrices are outside this roadmap and belong to the roadmaps above.

## Conventions

- **Domains.** `ℂ` carries Lebesgue measure `volume` and coordinate `z = s + it`. Write
  `ℍ̄ = {z : 0 ≤ Im z}` for the closed upper half-plane. A *half-disc* is `D⁺_r = {z ∈ ℍ̄ :
  |z| < r}`; it is relatively open in `ℍ̄`, and its boundary part is `D⁺_r ∩ ℝ`.
- **Cauchy–Riemann operator.** For a map into a complex vector space,
  `∂̄ = (∂_s + i ∂_t)/2`, which is Tau Ceti's
  [`conjWirtingerDeriv u z 1`](https://github.com/TauCetiProject/TauCeti/blob/333c9e49143de812ed1452b412193ee9c05501e7/TauCeti/Analysis/Complex/Wirtinger/Basic.lean).
  For a map `u` into a real vector space `V` with a complex structure field `J : V → End V`,
  the nonlinear operator is `∂_s u + J(u) ∂_t u`; it is twice `∂̄` when `J` is constant. On a
  surface it is `∂̄_J(u) = ½(du + J(u) ∘ du ∘ j)`, a section of `Λ^{0,1} ⊗_J u*TM`. This is
  McDuff–Salamon's normalization.
- **Exponents.** `p` is an extended real `1 < p < ∞` unless stated. Every nonlinear statement
  assumes `p > 2`, which makes `W^{1,p}_loc` maps continuous in dimension two.
  Statements with `k ≥ 1` and `kp > 2` use the Banach-algebra property of `W^{k,p}_loc`.
- **Almost complex structures.** `C^ℓ` with `ℓ : ℕ∞`, `ℓ ≥ 1`. The case `ℓ = ∞` is Tau Ceti's
  [`SmoothAlmostComplexStructure`](https://github.com/TauCetiProject/TauCeti/blob/358314d4ab97483df4fc4cb8adcc02e74a8d9f5a/TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean).
  A *domain-dependent* structure on `M` over `Σ` is a `C^ℓ` section of the bundle over `Σ × M`
  whose fiber at `(z, x)` is `End(T_xM)`, with square `−1` in each fiber.
- **Inhomogeneous terms.** An inhomogeneous term is a `C^ℓ` section `ν` of the bundle over
  `Σ × M` with fiber `Hom(T_zΣ, T_xM)`, complex antilinear for `j(z)` and `J(z, x)`. The
  equation is `∂̄_J(u)(z) = ν(z, u(z))`. Floer's equation `∂_s u + J_t(u)(∂_t u − X_t(u)) = 0`
  on a strip or cylinder is the case
  `ν(z, x) = ½(ds ⊗ J_t(x) X_t(x) + dt ⊗ X_t(x))`: evaluating `∂̄_J(u)` on `∂_s` gives
  `½(∂_s u + J_t ∂_t u) = ½ J_t X_t`, and `ν(∂_t) = −J ν(∂_s)`. Pin this formula in PH4.3.
- **Totally real submanifolds.** A *totally real embedding* for `J` is a smooth embedding
  `ι : L → M` in Mathlib's sense
  ([`Manifold.IsSmoothEmbedding`](https://github.com/leanprover-community/mathlib4/blob/f6090c7095e1e56b3464c1daba5f24631f1290d2/Mathlib/Geometry/Manifold/SmoothEmbedding.lean))
  with `2 dim L = dim M`, whose tangent image at every point is maximal totally real for
  `J(ι x)` in Tau Ceti's sense
  ([`TauCeti.IsMaximalTotallyReal`](https://github.com/TauCetiProject/TauCeti/blob/358314d4ab97483df4fc4cb8adcc02e74a8d9f5a/TauCeti/LinearAlgebra/TotallyReal/Basic.lean)).
  Domain-dependent `J` requires the condition for `J(z, ·)` at every boundary point `z`.
- **Surfaces.** All surfaces are Hausdorff and second countable.
  - A *Riemann surface without boundary* is a smooth real two-dimensional manifold with a
    smooth almost complex structure `j`. PH2.4 proves that isothermal charts exist and form a
    holomorphic atlas, and compares this with Mathlib's charted spaces modelled on `ℂ` with
    analytic transition maps.
  - A *Riemann surface with boundary* is a charted space modelled on `ℍ̄` with `HasGroupoid`
    for the *bordered holomorphic groupoid* of PH2.4. That groupoid consists of the
    homeomorphisms between relatively open subsets of `ℍ̄` that are smooth up to the boundary
    and holomorphic in the interior. Such a surface is a smooth manifold with boundary in
    Mathlib's sense and carries an induced `j`.

  Both kinds are written `(Σ, j)`. *Isothermal charts* are the holomorphic charts of the
  respective atlas.
- **Sobolev classes of maps** are local: `W^{k,p}_loc(Σ, M)` never presupposes a metric on `M`.
  Global spaces appear only for sections of vector bundles over compact surfaces (PH6).

Mathlib's current Sobolev discussion
([#mathlib4 > Sobolev spaces](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Sobolev.20spaces.20.28and.20formalization.20done.20by.20Armstrong.20and.20Kemp.29))
settles on Sobolev spaces on normed spaces first, with manifold and bundle versions on top, in
the pattern of `fderiv` and `mfderiv`. PH1 and PH4 follow that pattern. If Mathlib adopts
vector-valued Sobolev spaces, PH1 adopts its API.

## Exact supplier contracts

### From Mathlib

- Manifolds and bundles: `ModelWithCorners`, `𝓡∂ 2`, `IsManifold`, `mfderiv`, `ContMDiff`,
  `ContMDiffSection`, `VectorBundle`, `IsSmoothEmbedding`, `IsImmersionAt`.
- Fredholm operators: `ContinuousLinearMap.IsFredholm` and its index,
  `IsFredholm.comp`, `IsFredholm.eventually_nhds_index_eq` and `index_continuousOn_isFredholm`.
- Analysis: `TestFunction`, `MeasureTheory.Lp`, `HasFDerivAt`, the Cauchy integral formula,
  Fourier series on `AddCircle` and Arzelà–Ascoli.

### From Tau Ceti

At the pinned revision
[`358314d4`](https://github.com/TauCetiProject/TauCeti/tree/358314d4ab97483df4fc4cb8adcc02e74a8d9f5a):

- `HasWeakFDerivOn` (vector-valued weak derivatives on `Opens E`), `W1p`, `Wkp`, and the `W1p`
  files `Morrey`, `HolderEmbedding`, `ChainRule`, `Multiplication`,
  `SupercriticalMultiplication`, `Mollification`, `Restriction` and `LocalCompactness`;
- `SmoothAlmostComplexStructure`, `IsPseudoholomorphic` and its `At`, `On` and `WithinAt`
  variants, the normed-space predicate `IsJHolomorphic` and `isPseudoholomorphicAt_iff_isJHolomorphicAt`;
- `IsMaximalTotallyReal`, `TotallyRealLoop.maslovIndex`, `maslovIndex_map` and
  `maslovIndex_prod`;
- Schwarz reflection across an affine maximal totally real subspace
  (`Analysis/Complex/Conformal/Reflection/TotallyReal`);
- `ContinuousLinearMap.index_comp` and the Fredholm files under `Analysis/Fredholm`.

At [`333c9e49`](https://github.com/TauCetiProject/TauCeti/tree/333c9e49143de812ed1452b412193ee9c05501e7), which postdates the pin:

- the Cauchy–Pompeiu formula and the Cauchy transform with parameters
  (`Analysis/Complex/Pompeiu/Basic`, `Parameter`);
- the Calderón–Zygmund inequality `‖Du‖_{Lᵖ} ≤ C‖∂̄u‖_{Lᵖ}` for compactly supported smooth
  `u : ℂ → F`
  (`exists_eLpNorm_fderiv_le_eLpNorm_conjWirtingerDeriv_of_hasCompactSupport`,
  `Analysis/Complex/Wirtinger/CalderonZygmund`);
- local solutions of `∂̄u = f` (`Wirtinger/Potential`) and the scalar similarity principle
  (`Wirtinger/Similarity`);
- `CkHolderSpace` (`Analysis/Holder/Iterated`).

### From other roadmaps

- [PDE](../PDE/README.md) Lane A: `W^{k,p}` of Lipschitz domains, Sobolev and Morrey
  embeddings, Rellich–Kondrachov, extension and trace; Lane A7's Hölder spaces.
- [CharacteristicClasses](../CharacteristicClasses/README.md) C2.3 (the diagonal trace
  comparison with the alternating Betti sum) and C3.2 (`c₁ = e` in rank one, the Whitney sum
  formula and the determinant-line comparison).
- [ModularForms](../ModularForms/README.md) Layer 10B (iv)–(v) (`dim H⁰(Ω¹) = g_an` and
  `analyticGenus_eq_topologicalGenus` on compact Riemann surfaces), and
  [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Layer 5's `RiemannSurface.genus`.
- [PseudodifferentialOperators](../PseudodifferentialOperators/README.md)
  P5.2 (bundle `W^{k,p}` on compact boundaryless bases) and P6 (for PH6.4).
- [AlgebraicTopology](../AlgebraicTopology/README.md) Stages 6.1 (universal coefficients over a
  field), 7.1 (Euler–Poincaré and independence of the finite CW model) and 8.7 (finite CW type
  of compact smooth manifolds).
- [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Layer 5's
  `compactManifoldFiniteCWType`.

## How to read the build

PH1 and PH2.1–PH2.3 are independent foundations. PH3 consumes PH1 and the Tau Ceti
Cauchy–Riemann files. PH2.4 consumes PH3.1. PH4 consumes PH1 and PH2. PH5 is the nonlinear payoff of PH3 and PH4. PH6 consumes PH3
and PH4's chart calculus. PH7 consumes PH6. The interior statements of PH3, PH5 and PH6 come
before their boundary versions, which add one reflection argument each.

## Layer 1: local Sobolev maps on planar domains and half-discs (PH1)

### 1.1 Vector-valued local Sobolev classes

For a finite-dimensional real normed space `F`, an open `Ω ⊆ ℂ`, `k : ℕ` and `p`, define
`MemWkpLoc p Ω k u` for `u : ℂ → F`. It holds when the iterated weak derivatives
`D^i u : ℂ → (ℂ [×i]→L[ℝ] F)` exist on `Ω` for `i ≤ k`, each a `HasWeakFDerivOn` derivative of
the previous one, and each `D^i u` is in `Lᵖ(K)` for every compact `K ⊆ Ω`. For `F = ℝ` prove
that membership is equivalent to `u|_W ∈ Wkp volume W p k` for every relatively compact open
`W` with closure in `Ω`. For every continuous linear `A : F →L[ℝ] G`, prove that membership of
`u` gives membership of `A ∘ u`. A map lies in the class exactly when its coordinates in one
(equivalently every) basis of `F` do. Prove closure under addition, scalar multiplication,
restriction to smaller opens and the sheaf property: membership on each set of an open cover
gives membership on the union.

Do the same for half-discs. For a relatively open `U ⊆ ℍ̄`, the weak derivatives are taken on
the interior `U ∖ ℝ`, and the `Lᵖ` bounds are required on `K ∖ ℝ` for every compact `K ⊆ U`.
So the bounds reach the boundary, while the test functions are those of the interior. Prove
that a `W^{k,p}`
map on `D⁺_r` extends to a `W^{k,p}` map on `D_r` by higher-order reflection, with a bound.
Use PDE Lane A's extension theorem where it applies, and give the explicit reflection formula
for the half-disc.

### 1.2 Embeddings, products and composition

For `kp > 2` with `k ≥ 1`, prove the following, both in the interior and on half-discs:

- *Morrey.* Members of `W^{k,p}_loc` have continuous representatives, and for `p > 2` they
  have `C^{k−1,1−2/p}` representatives, with local bounds.
- *Algebra.* Members of `W^{k,p}_loc` form an algebra under bilinear continuous maps
  `F × G → H`, with a local bound.
- *Composition.* If `g : F → G` is `C^ℓ` with `ℓ ≥ k` and `u ∈ W^{k,p}_loc`, then
  `g ∘ u ∈ W^{k,p}_loc`, with the chain rule for weak derivatives and a local bound depending
  on `‖g‖_{C^k}` on a neighbourhood of the image of `u` and on `‖u‖_{W^{k,p}}`.
- *Continuity of composition.* The map `u ↦ g ∘ u` is continuous for `W^{k,p}` on compact
  subsets when `ℓ ≥ k + 1`.
- *Change of variables.* `W^{k,p}_loc` is invariant under `C^{k}` diffeomorphisms between
  planar domains, and under those between half-discs that preserve `ℝ`.

Consume Tau Ceti's `W1p` Morrey, chain-rule and supercritical-multiplication files at `k = 1`.
Prove the higher orders by induction on `k` from them.

### 1.3 Local compactness

Prove local Rellich for these classes: a sequence bounded in `W^{k+1,p}` on compact subsets of
`Ω` (or of a half-disc) has a subsequence converging in `W^{k,p}` on compact subsets. Deduce
`C^{k}` convergence on compact subsets when `p > 2`.

*Needs:* Tau Ceti `HasWeakFDerivOn`, `W1p`, `Wkp`; PDE Lane A's extension, embeddings and
Rellich.

## Layer 2: almost complex structures, totally real submanifolds and isothermal coordinates (PH2)

### 2.1 Finite-regularity almost complex structures

Define `ContMDiffAlmostComplexStructure I M ℓ`: a `ContMDiffSection` of class `ℓ` of the
tangent endomorphism bundle with square `−1` in every fiber. Its fields and API follow
`SmoothAlmostComplexStructure`, and the two carriers are equivalent at `ℓ = ∞`. Give
restriction to `C^m` for `m ≤ ℓ`, pullback along diffeomorphisms, products, and the
coordinate expression: in a chart, `J` becomes a `C^ℓ` map `V → End V` on an open subset of
the model space with square `−1` pointwise. Define the domain-dependent and inhomogeneous
data of the Conventions with the same API.

### 2.2 Totally real embeddings

Define `IsTotallyRealEmbedding J ι` as in the Conventions. Prove that a Lagrangian embedding is
totally real for every `ω`-tame `J`, consuming Tau Ceti's linear Lagrangian/totally real
comparison. Prove that totally real embeddings are stable under `C^1`-small perturbation of
`J` on compact subsets of `L`.

### 2.3 Adapted coordinates along a totally real submanifold

For a totally real embedding `ι : L → M` for a `C^ℓ` structure `J` and a point `x₀ ∈ L`,
construct a `C^ℓ` chart `ψ` of `M` near `ι x₀` into `ℂⁿ` with the following properties:

- `ψ(ι(L)) = ψ(U) ∩ ℝⁿ` on its domain `U`;
- `dψ(x) ∘ J(x) = i ∘ dψ(x)` for `x ∈ U ∩ ι(L)`, so the pushed-forward structure `ψ_* J`,
  which is only `C^{ℓ−1}`, equals `i` along `ℝⁿ`;
- for `J_m → J` in `C^ℓ`, the charts `ψ_m` can be chosen to converge to `ψ` in `C^ℓ`.

This is McDuff–Salamon Exercise B.4.10 (p. 577). The construction is as follows. Take a chart
`φ` of `L` at `x₀` and a chart `χ` of `M` at `ι x₀`, and write `γ = χ ∘ ι ∘ φ⁻¹` and `J_χ` for
`J` in the chart. Set `Φ(x + iy) = γ(x) + Σⱼ yⱼ J_χ(γ(x)) ∂ⱼγ(x)` for `x, y ∈ ℝⁿ`. Its
derivative at `(x, 0)` sends `eⱼ ↦ ∂ⱼγ(x)` and `ieⱼ ↦ J_χ(γ(x))∂ⱼγ(x)`. That derivative is
invertible because `TL` is totally real, and it intertwines `i` with `J_χ`. The inverse
function theorem then gives `ψ = (χ⁻¹ ∘ Φ)⁻¹` near `ι x₀`. The pushforward costs one
derivative of `J`, which is why the boundary statements of PH5 need `ℓ ≥ 2`.

### 2.4 Isothermal coordinates and bordered Riemann surfaces

**Interior.** Let `j` be an almost complex structure of class `C^{ℓ,α}` on a boundaryless
surface, with `ℓ ≥ 1` and `0 < α < 1`. McDuff–Salamon prove this integrability twice, as
Corollary C.5.3 (from Riemann–Roch) and Theorem E.3.1 (p. 664, Newlander–Nirenberg); the route
here is the direct Beltrami one. Prove that every point has a `C^{ℓ+1,α}` chart to an open
subset of `ℂ` in which `j = i`. For smooth `j` the chart is smooth.

Use the Beltrami equation. In a smooth chart, write `j` through its Beltrami coefficient `μ`,
with `|μ| < 1`. Normalize by a real-linear change of coordinates so that `μ(0) = 0`. Rescale to
`μ_ε(z) = χ(z)μ(εz)`, which tends to `0` in `C^{ℓ,α}`. Then solve `h = μ_ε(1 + Bh)` by
contraction on the closed subspace of `C^{ℓ,α}` data supported in a fixed disc, where `B = ∂T`
is the Beurling operator of PH3.1. The function `ψ = z + Th` has `∂̄ψ = μ_ε ∂ψ` and is
`C¹`-close to the identity, so it is a local diffeomorphism. After subtracting `ψ(0)` and
dividing by `∂ψ(0)`, it is the chart.

Prove that the transition map between two `C¹` charts in which `j = i` satisfies the
Cauchy–Riemann equations, so it is holomorphic. Consequently, for smooth `j`, the chart
obtained at `ℓ = 1` differs from the one obtained at each `ℓ = m` by a holomorphic map, so it
is `C^{m+1,α}` for every `m`, hence smooth. So the isothermal charts form an analytic atlas
modelled on `ℂ`. Prove the converse: such an atlas induces a smooth `j`, and
the two constructions are mutually inverse.

**Boundary.** Construct the model with corners `ModelWithCorners ℝ ℂ ℍ̄` for the closed
upper half-plane as a subtype of `ℂ`, and compare it with `𝓡∂ 2` through `z ↦ (s, t)`. Define
the bordered holomorphic groupoid on `ℍ̄` of the Conventions as a Mathlib `StructureGroupoid`. Prove that it is contained in the smooth groupoid of `𝓡∂ 2`, so that a
Riemann surface with boundary is a smooth manifold with boundary. Prove also that its
transition maps send `ℝ` to `ℝ`. Prove that the induced `j` is smooth up to the boundary, and
that the interior of a Riemann surface with boundary is a Riemann surface without boundary.

**Double.** Construct the *Schottky double* of a compact Riemann surface with boundary. It is a
closed Riemann surface with an antiholomorphic involution whose fixed set is the boundary.
Build it by gluing the surface to its conjugate along the boundary, using `z ↦ z̄` on boundary
charts.

*Needs:* Mathlib manifolds, `ContMDiffSection`, `IsSmoothEmbedding`, the inverse function
theorem; Tau Ceti `SmoothAlmostComplexStructure`, `IsMaximalTotallyReal`, the Lagrangian/totally
real files; PH3.1's Cauchy and Beurling operators on Hölder spaces.

## Layer 3: linear Cauchy–Riemann estimates on the plane and the half-plane (PH3)

### 3.1 Cauchy and Beurling operators

Consume Tau Ceti's Cauchy–Pompeiu files. Define `T f = π⁻¹ ∫ (w − z)⁻¹ f(z) dz` on compactly
supported `f` and the Beurling operator `B = ∂T`. Prove the following:

- `∂̄T = id` and `∂T = B` on compactly supported `C¹` data, extended by density to `Lᵖ` data
  with compact support, `1 < p < ∞`;
- `B` is bounded on `Lᵖ(ℂ)`, `1 < p < ∞`; obtain this from Tau Ceti's Calderón–Zygmund
  inequality;
- for data supported in a fixed disc `D_r`, and every bounded output disc `D_R`, the map
  `T : Lᵖ(D_r) → W^{1,p}(D_R)` is bounded, and `T : C^{k,α}(D_r) → C^{k+1,α}(D_R)` is
  bounded, for every `k ≥ 0` and `0 < α < 1`. A global statement is only the derivative
  bound `‖D(Tf)‖_{Lᵖ(ℂ)} ≤ C‖f‖_{Lᵖ}`: for `1 < p ≤ 2` and data with nonzero integral,
  `Tf(w) ~ c/w` at infinity, so `Tf ∉ Lᵖ(ℂ)`;
- `B` is bounded on `C^{k,α}` of data supported in `D_r`, into `C^{k,α}(D_R)`.

State support radii, cutoffs and constants explicitly. Prove continuity in parameters for
families of data with common support.

Cite existing work in [t4v1/damian_formalizare](https://github.com/t4v1/damian_formalizare),
`MorseFloer/Part2/CauchyPompeiu.lean` and `CauchyHolder.lean`, for its Cauchy/Beurling
Hölder-scale development. Compare its differential and kernel normalization with
`∂̄ = (∂_s + i∂_t)/2` here. Any code integration follows the README's author-coordination and
licence requirements.

### 3.2 Interior estimates and regularity for `∂̄`

For `1 < q < ∞`, `k ≥ 0` and compact `K ⊆ Ω`:

- *Estimate.* For `ξ ∈ W^{k+1,q}_loc(Ω; ℂⁿ)`, prove
  `‖ξ‖_{W^{k+1,q}(K)} ≤ C(‖∂̄ξ‖_{W^{k,q}(Ω')} + ‖ξ‖_{Lq(Ω')})` for an open `Ω'` with
  `K ⊆ Ω' ⋐ Ω`.
- *Weak regularity.* If `ξ ∈ L^q_loc` and the distribution `∂̄ξ` is in `W^{k,q}_loc`, then
  `ξ ∈ W^{k+1,q}_loc`. The case `∂̄ξ = 0` is Weyl's lemma for `∂̄`: `ξ` agrees almost
  everywhere with a holomorphic function.

### 3.3 Interior estimates with Sobolev coefficients

Let `p > 2` be finite and `ℓ ≥ 1`. Let `J ∈ W^{ℓ,p}_loc(Ω; End ℝ^{2n})` with `J² = −1`
pointwise, let `m ∈ {ℓ − 1, ℓ}`, and let `S ∈ W^{m,p}_loc(Ω; End ℝ^{2n})`. Put
`Dξ = ∂_s ξ + J ∂_t ξ + S ξ`. For `p/(p−1) < q ≤ p` and `0 ≤ k ≤ m`, prove the following:

- *Weak regularity.* Call `ξ ∈ L^q_loc` a weak solution of `Dξ = η` if it satisfies
  `∫⟨D*φ, ξ⟩ = ∫⟨φ, η⟩` for every test function `φ`, with `D*` the formal adjoint. If
  `η ∈ W^{k,q}_loc`, then `ξ ∈ W^{k+1,q}_loc`.
- *Estimate.* `‖ξ‖_{W^{k+1,q}(K)} ≤ C(‖Dξ‖_{W^{k,q}(Ω')} + ‖ξ‖_{Lq(Ω')})`, where `C` depends
  only on `K`, `Ω'`, `k`, `q`, `p` and bounds for `‖J‖_{W^{ℓ,p}(Ω')}` and
  `‖S‖_{W^{m,p}(Ω')}`.
- *Uniformity.* The same constant works for every `(J, S)` in a set bounded in these norms.

The lower bound on `q` is strict: the first step below needs `1/p + 1/q < 1`. The case
`m = ℓ` (including `S = 0`) gains the full derivative, and PH5.1 uses exactly this case. For
`S = 0` these are the interior cases of McDuff–Salamon Lemma B.4.6 (p. 573) and Proposition
B.4.9 (p. 575).

Prove it in three lemmas, following McDuff–Salamon §B.4.

1. *Exponent ladder* (Lemma B.4.4, p. 572). For `p > 2` there are finitely many exponents
   `q₀ < ⋯ < q_N` with `p/(p−1) < q₀ ≤ p`, `q_{N−1} < 2p/(p−2) < q_N`, and
   `q_{j+1} = 2r_j/(2 − r_j)` for `r_j = pq_j/(p + q_j)`.
2. *Order zero* (Lemma B.4.6). If `J ∈ W^{1,p}`, `S ∈ Lᵖ`, `ξ ∈ L^q_loc` and `η ∈ L^r_loc` with
   `1/p + 1/q = 1/r`, then `ξ ∈ W^{1,r}_loc`, with the estimate. The proof rewrites the weak
   equation as `Δξ = ∂_s f + ∂_t g` for `f, g ∈ L^r`, and consumes the `Lʳ` regularity of the
   Laplacian from PDE Lane B. Climbing the ladder with Sobolev embedding gives `ξ ∈ W^{1,p}_loc`
   when `η ∈ Lᵖ`, and `ξ ∈ W^{1,q}_loc` when `η ∈ L^q`.
3. *Differentiated equation* (Proposition B.4.9, Steps 2–3). If `ξ ∈ W^{j,q}_loc` solves
   `Dξ = η` with `j ≤ k`, then `∂_s ξ` and `∂_t ξ` solve
   `D(∂ξ) = ∂η − (∂J) ∂_t ξ − (∂S) ξ` weakly, with right side in `W^{j−1,q}` by PH1.2's products
   (McDuff–Salamon Lemma B.4.5 at `j = 1`). Order zero then gives `ξ ∈ W^{j+1,q}_loc` with the
   stated estimate.

### 3.4 Totally real boundary conditions on the half-disc

Keep the hypotheses of PH3.3 on a relatively open `Ω ⊆ ℍ̄`, and assume that `J(s) = i` for
`s ∈ Ω ∩ ℝ`. Impose `ξ(s) ∈ ℝⁿ` for `s ∈ Ω ∩ ℝ`. This is a pointwise condition when `q > 2`,
because `W^{1,q}` maps are then continuous; for `q ≤ 2` it is a condition on traces, using PDE
Lane A's trace. A weak solution `ξ ∈ L^q_loc(Ω)` is defined by testing against smooth `φ`
compactly supported in `Ω`, not required to vanish on `ℝ`, with `φ(s) ∈ ℝⁿ` for `s ∈ ℝ`. The
weak equation is McDuff–Salamon (B.4.3): `∫⟨∂_s φ + Jᵀ ∂_t φ, ξ⟩ = −∫⟨φ, η + (∂_t J)ξ⟩`, with
the zeroth-order term added. Prove the analogues of PH3.3 on `Ω`, with estimates up to the
boundary, for `0 ≤ k ≤ m`. This is McDuff–Salamon Lemma B.4.6 and Proposition B.4.9 in full,
with `S` added.

The route is as follows.

1. *Order zero.* Reflect across `ℝ`, by `ξ(s, −t) = Rξ(s, t)` with `R = conj`, and by the
   corresponding reflections of the auxiliary functions `f` and `g` of PH3.3's order-zero
   lemma. Prove that the reflected functions satisfy the weak Laplace equation on the doubled
   domain, by splitting each test function into a part satisfying the boundary condition and
   two parts with prescribed parity in `t`. Then apply the interior lemma, and recover the
   boundary condition for the limit from the trace. Tau Ceti's totally real Schwarz reflection
   is the constant-coefficient case.
2. *Higher orders.* Tangential derivatives `∂_s` preserve the boundary condition
   `ξ ∈ ℝⁿ` and satisfy the differentiated equation, so the order-zero step bounds `∂_s ξ`
   up to the boundary. Recover the normal derivative from the equation,
   `∂_t ξ = J(∂_s ξ + Sξ − η)`, which uses `J⁻¹ = −J`, and conclude by PH1.2's products.
   Induct on `j ≤ k`.

Every smooth totally real boundary condition on a bundle is put in this form by smooth
trivializations. For nonlinear boundary conditions, use PH2.3's adapted charts.

As a check, take the model operator `∂̄` on the unit disc with `ξ(e^{iθ}) ∈ e^{3iθ/2}ℝ`: its
kernel is `a₀ + a₁z + conj(a₁)z² + conj(a₀)z³`, real dimension 4.

### 3.5 Similarity principle and unique continuation

The *vector similarity principle* is McDuff–Salamon Theorem 2.3.5 (p. 23), the Carleman
similarity principle. Let `p > 2`, let `J ∈ W^{1,p}_loc(Ω; GL(2n, ℝ))` with `J² = −1` and
`C ∈ L^p_loc(Ω; End ℝ^{2n})`, and let `ξ ∈ W^{1,p}_loc(Ω; ℝ^{2n})` solve
`∂_s ξ + J∂_t ξ + Cξ = 0` with `ξ(z₀) = 0`. Then near `z₀`, `ξ = Φσ` with `Φ ∈ W^{1,p}`
invertible, `Φ⁻¹JΦ = i`, and `σ` holomorphic with `σ(z₀) = 0`. Prove it by
absorbing `B conj(ξ)` into an `L^p` matrix acting on `ξ`, then solving the small-disc Cauchy
integral equation for `Φ`. Consume Tau Ceti's scalar similarity principle as the `n = 1`,
`C^k` case and prove the comparison. Derive the following:

- unique continuation: a solution vanishing on a nonempty open set, or to infinite order at a
  point, vanishes on the connected component;
- isolated zeros with positive orders;
- the boundary version on half-discs with totally real boundary condition, by reflection as in
  PH3.4.

*Needs:* PH1; Tau Ceti's Pompeiu, Calderón–Zygmund, Potential, Similarity and totally real
reflection files; `CkHolderSpace`; PDE Lane A7.

## Layer 4: Sobolev maps from surfaces and the weak Cauchy–Riemann equation (PH4)

### 4.1 Local Sobolev maps between manifolds

Let `(Σ, j)` be a surface and `M` a manifold, with `k ≥ 1` and `kp > 2`. Define
`MemWkpLocMap j p k u` for `u : Σ → M`. It requires `u` to be continuous, and it requires
`ψ ∘ u ∘ φ⁻¹` to satisfy PH1.1's `MemWkpLoc` for every isothermal chart `φ` of PH2.4 and every
chart `ψ` of `M`, on the open part of `φ`'s target where `u` maps into `ψ`'s source. Prove:

- *Chart independence.* It suffices to test one atlas of each, using PH1.2's composition and
  change-of-variables theorems.
- Smooth maps belong to the class.
- Composition with `C^ℓ` maps `M → N`, for `ℓ ≥ k`, preserves the class.
- *Weak differential.* `du` exists as an a.e.-defined measurable section of
  `Hom(TΣ, u*TM)` with locally `Lᵖ` coordinate expressions. It agrees a.e. with `mfderiv` when
  `u` is `C¹`.

### 4.2 The weak pseudoholomorphic equation

For `J` a `C^ℓ` domain-dependent structure with `ℓ ≥ 1`, `ν` an inhomogeneous term and `p > 2`,
define `IsWeakPseudoholomorphic j J ν p u`. It holds when `u ∈ W^{1,p}_loc(Σ, M)` and
`du + J(z, u) ∘ du ∘ j = 2ν(z, u)` holds almost everywhere. For boundary conditions, define
`MapsBoundaryTo u ι` as `u(∂Σ) ⊆ ι(L)` for a totally real embedding `ι`; continuity of `u`
makes this pointwise. Prove:

- *Coordinates.* In isothermal coordinates on `Σ` and a chart on `M`, the equation is
  `∂_s u + J(z, u)∂_t u = η(z, u)` a.e., with `η` the coordinate form of `2ν(z, u)(∂_s)`.
- *Comparison.* For `ν = 0`, `J` independent of `z`, `ℓ = ∞` and `u` of class `C¹`, the
  predicate is equivalent to Tau Ceti's `IsPseudoholomorphic`.
- *Invariance.* The predicate is invariant under biholomorphisms of `(Σ, j)` and under
  diffeomorphisms of `M`, transporting `J`, `ν` and `ι`.
- *Locality.* It is a sheaf condition on `Σ`.

### 4.3 Examples

Pin the following:

- holomorphic maps between Riemann surfaces;
- graphs: `u` solves the inhomogeneous equation iff `z ↦ (z, u(z))` is pseudoholomorphic for
  Gromov's structure on `Σ × M`;
- Floer's equation with the formula of the Conventions;
- the constant-structure case `M = ℂⁿ`, `J = i`, where the predicate is `∂̄u = 0` weakly.

*Needs:* PH1, PH2; Tau Ceti `IsPseudoholomorphic`.

## Layer 5: nonlinear bootstrapping (PH5)

### 5.1 Elliptic bootstrapping

Let `p > 2` be finite, let `J` be a `C^ℓ` domain-dependent structure and `ν` a `C^ℓ`
inhomogeneous term, and let `u` satisfy `IsWeakPseudoholomorphic j J ν p u`.

- *Interior.* If `ℓ ≥ 1`, then `u ∈ W^{ℓ+1,p}_loc` on the interior of `Σ`, so `u` is `C^ℓ`
  there (McDuff–Salamon Remark B.4.3, p. 571).
- *Boundary.* If `ℓ ≥ 2` and `u` satisfies `MapsBoundaryTo u ι` for a smooth totally real
  embedding `ι` for `J` with closed image, then `u ∈ W^{ℓ,p}_loc` up to the boundary, so `u` is
  `C^{ℓ−1}` up to the boundary (Theorem B.4.1, p. 571).
- *Smooth case.* If `J` and `ν` are smooth, `u` is smooth, up to the boundary in the boundary
  case.

The proof is local. In coordinates, `z ↦ J(z, u(z))` is in `W^{1,p}_loc`. By induction, if
`u ∈ W^{m,p}_loc` with `1 ≤ m ≤ ℓ`, then `J(z, u)` and `η(z, u)` are in `W^{m,p}_loc` by PH1.2.
Apply PH3.3 in the case `S = 0` to the linear operator `∂_s + J(z, u(z))∂_t` with `ξ = u`,
`η = η(z, u)` and `k = m`; this gives `u ∈ W^{m+1,p}_loc`. At the boundary, a PH2.3 chart puts
`u(z) ∈ ℝⁿ` on the boundary with `J = i` there, at the cost of making the structure `C^{ℓ−1}`.
Then PH3.4 runs the same induction for `m ≤ ℓ − 1`, which is where `ℓ ≥ 2` and the conclusion
`W^{ℓ,p}` come from.

The conclusions require `p < ∞`; a `W^{1,∞}_loc` solution is `W^{1,q}_loc` for every finite
`q > 2`, so the smooth case is unaffected. A `C¹` function `f` near `0` with
`f(z) = z² log log(1/|z|)` has `C¹` derivative `∂̄f` and unbounded second derivatives. Its
graph is pseudoholomorphic for the `C¹` structure `J(z, w)(v, a) = (iv, ia − 2i(∂̄f)(z) v̄)`,
so it is a `W^{1,∞}` solution that is not `W^{2,∞}`. Record this example.

Corollary: a `C¹` map satisfying `IsPseudoholomorphic j J u` for smooth `J` is smooth, with
the boundary version for `MapsBoundaryTo u ι`. This uses PH4.2's comparison, and the fact that
a `C¹` map is `W^{1,p}_loc` for every `p`.

### 5.2 Uniform estimates

This is McDuff–Salamon Theorem B.4.2 (p. 571) with Remark B.4.3, extended to domain-dependent
and inhomogeneous data. Let `p > 2` be finite. Let `J_m → J` and `ν_m → ν` in `C^ℓ` on compact
subsets, and `j_m → j` in `C^∞`. Let `U_m ⊆ Σ` be an increasing sequence of open sets with union
`Σ`, and let `u_m : U_m → M` satisfy the weak equations for `(j_m, J_m, ν_m)` with
`u_m(U_m ∩ ∂Σ) ⊆ ι(L)`, for a fixed totally real `ι` whose image is closed in `M`. Without
closedness the boundary condition fails in the limit: for `L = (0, 1) ⊆ ℝ ⊆ ℂ` the constant
maps `u_m = 1/(m + 2)` converge to `0 ∉ L`.

Assume that for every compact `Q ⊆ Σ` there are a compact `K ⊆ M` and `c` with
`u_m(Q) ⊆ K`, and with `‖du_m‖_{Lᵖ(Q)} ≤ c` for large `m`, measured in charts or for a
metric on `M`. Then:

- if `∂Σ = ∅` and `ℓ ≥ 1`, the `u_m` are bounded in `W^{ℓ+1,p}` on compact subsets, with
  constants depending only on the `C^ℓ` bounds of the data and `c`, and a subsequence
  converges in `C^ℓ` on compact subsets;
- in the boundary case with `ℓ ≥ 2`, the `u_m` are bounded in `W^{ℓ,p}` on compact subsets up
  to the boundary, and a subsequence converges in `C^{ℓ−1}` on compact subsets;
- the limit satisfies the limiting equation and boundary condition.

For smooth data converging in `C^∞`, the convergence is `C^∞`. Also prove the gradient-bound
corollary used in compactness, McDuff–Salamon Theorem 4.1.1 (p. 76). If `|du_m|` is uniformly
bounded on compact subsets for a metric on `M`, and the images of compact sets stay in a fixed
compact set, then a subsequence converges in `C^∞` on compact subsets. The convergence comes
from PH1.3 and Arzelà–Ascoli, and the uniform bound from PH3.3's uniformity clause.

*Needs:* PH1–PH4.

## Layer 6: real Cauchy–Riemann operators on bundles over compact surfaces (PH6)

### 6.1 Sobolev sections over compact surfaces with boundary

Let `Σ` be a compact surface with (possibly empty) boundary and `E → Σ` a smooth real vector
bundle with smooth complex structure `J_E`. For `k ≥ 0` and `1 < p < ∞`:

- If `∂Σ = ∅`, consume PseudodifferentialOperators P5.2's bundle `W^{k,p}` carrier on compact
  boundaryless bases, with its completeness, smooth density and norm equivalences. Prove that
  its localizations in isothermal charts and trivializations are PH1.1's local classes.
- If `∂Σ ≠ ∅`, construct `W^{k,p}(Σ, E)` the same way. Fix a finite atlas of isothermal charts
  (half-discs at the boundary) with trivializations and a subordinate partition of unity, and
  give the norm by the PH1.1 norms of the localized pieces. Prove that different choices give
  equivalent norms, completeness, density of sections smooth up to the boundary, Rellich
  compactness `W^{k+1,p} → W^{k,p}`, the Morrey embedding for `kp > 2`, and multiplication by
  `W^{k,p}` coefficients for `kp > 2`. Prove that restriction to the interior agrees with
  P5.2's carrier on every compact boundaryless subsurface.

For a smooth totally real subbundle `F ⊆ E|∂Σ` and `kp > 2`, let `W^{k,p}_F(Σ, E)` be the
closed subspace of sections with boundary values in `F`. Construct the target space
`W^{k−1,p}(Σ, Λ^{0,1} ⊗_ℂ E)` the same way.

### 6.2 Real Cauchy–Riemann operators

A *smooth* real Cauchy–Riemann operator on `E` is a real-linear operator
`D₀ : Ω⁰(Σ, E) → Ω^{0,1}(Σ, E)` satisfying the Leibniz rule `D₀(fξ) = f D₀ξ + (∂̄f)ξ` for
real-valued smooth `f`. Prove that any two differ by a smooth zeroth-order term in
`Ω^{0,1}(Σ, End_ℝ E)`, and that a `J_E`-complex connection `∇` gives one, `D₀ = (∇)^{0,1}`.
Prove that every real-linear operator is the sum of a complex-linear one and a zeroth-order
complex antilinear term (McDuff–Salamon Exercise C.1.7).

Following McDuff–Salamon Definition C.1.5 (p. 581), a real Cauchy–Riemann operator *of class
`W^{ℓ−1,p}`*, for an integer `ℓ ≥ 1` and finite `p > 2`, is `D = D₀ + α`. Here `D₀` is a smooth
complex-linear Cauchy–Riemann operator and `α ∈ W^{ℓ−1,p}(Σ, Λ^{0,1} ⊗ End_ℝ E)`. The exponent
`p` is fixed with `α`. The realizations use the exponents of McDuff–Salamon Theorem C.1.10
(p. 583): integers `k ∈ {1, …, ℓ}` and reals `q > 1` with `k − 2/q ≤ ℓ − 2/p`. For such `(k, q)`,
prove the following:

- `D_F : W^{k,q}_F(Σ, E) → W^{k−1,q}(Σ, Λ^{0,1} ⊗ E)` is bounded;
- *Compact perturbation* (McDuff–Salamon Lemma C.2.2, p. 587): multiplication by `α` is
  compact from `W^{k,q}_F` to `W^{k−1,q}`;
- the elliptic estimate `‖ξ‖_{W^{k,q}} ≤ C(‖Dξ‖_{W^{k−1,q}} + ‖ξ‖_{L^q})` holds, by PH3.3 and
  PH3.4 in charts.

PH6.1's spaces are needed here at exponents `q ≤ 2`, with `W^{k,q}_F` defined through traces
when `kq ≤ 2`.

### 6.3 Fredholm property, kernel and cokernel

Fix a `J_E`-Hermitian metric on `E` *compatible with* `F`, meaning `J_E F = F^⊥`, and prove such
a metric exists. Fix also an area form compatible with `j`. The dual operator `D_F*` is the
formal adjoint `D*` restricted to (0,1)-forms `η` with `η(T∂Σ) ⊆ F`. Prove that
`∫⟨D_F* η, ξ⟩ = ∫⟨η, D_F ξ⟩` for smooth `ξ` and `η` satisfying the two boundary conditions
(McDuff–Salamon Lemma C.1.9, p. 582). On `D⁺_r` with `D = ∂_s + i∂_t` and `F = ℝⁿ`,
integration by parts leaves the boundary term `−∫_ℝ ⟨iξ, η(∂_s)⟩ ds`, which vanishes for all
`ξ ∈ ℝⁿ` exactly when `η(∂_s) ∈ ℝⁿ`. `D*` is a real Cauchy–Riemann operator of `∂`-type. Put it
in the form of PH3.3 by conjugation and the metric.

Prove McDuff–Salamon Theorem C.1.10 (i), which they prove as Theorem C.2.3 (p. 588), in this
order:

1. *Smooth operators.* For smooth `D` and every admissible `(k, q)`, the operators `D_F` and
   `D_F*` have closed range and finite-dimensional kernel, by the estimate and Rellich. An
   element annihilating the range of `D_F` is a weak solution of `D_F* η = 0`. Since the
   coefficients are smooth, PH3.3–PH3.4 apply at every exponent and make `η` smooth.
   Hence `D_F` is Fredholm.
2. *Duality.* Prove (C.1.3) and (C.1.4): `η ∈ im D_F` exactly when `η` is `L²`-orthogonal to
   `ker D_F*`, and symmetrically.
3. *Rough operators.* For `D = D₀ + α` of class `W^{ℓ−1,p}`, `D_F` is a compact perturbation of
   `(D₀)_F` by PH6.2. So it is Fredholm with the same index. Consume Tau Ceti's
   compact-perturbation Fredholm files under `Analysis/Fredholm`.
4. *Kernel regularity.* The kernels of `D_F` and `D_F*` lie in `W^{ℓ,p}`, so they are
   independent of `(k, q)`. They consist of smooth sections when `α` is smooth.
5. *Unique continuation* for kernel and cokernel elements, from PH3.5.
6. *Deformation.* The index is locally constant along continuous families of zeroth-order
   terms in `W^{ℓ−1,p}`. Consume Mathlib's `IsFredholm.eventually_nhds_index_eq`.

### 6.4 Agreement with the smooth-coefficient theory

On a closed surface with smooth coefficients, prove that the kernel and cokernel of PH6.2, for
any `p > 2`, coincide as spaces of smooth sections with those of PseudodifferentialOperators
P6's realization `H^{s+1} → H^s` of the same operator. Hence the indices agree.

*Needs:* PH2.4, PH3, PH4.1; Mathlib `IsFredholm`; Tau Ceti `index_comp`;
PseudodifferentialOperators P6 for PH6.4 only.

## Layer 7: Maslov index and Riemann–Roch (PH7)

### 7.1 Maslov index of a bundle pair

Let `Σ` be a compact Riemann surface with nonempty boundary, `E` a complex bundle of rank `n`,
and `F ⊆ E|∂Σ` a totally real subbundle. Let `Σ_ℂ` be the Schottky double of PH2.4 with its
antiholomorphic involution `τ`. Construct the *doubled bundle* `E_F → Σ_ℂ`: glue `E` over `Σ`
to the conjugate bundle `Ē` over `τ(Σ)` along `∂Σ`. The gluing identifies the fiber of `E`
with that of `Ē` by the antilinear involution of `E|∂Σ` with fixed set `F`. Use collars to make
the result a smooth complex bundle, prove that it is independent of the choices up to
isomorphism, and lift `τ` to an antilinear involution of `E_F` fixing `F`. Define
`μ(E, F) = c₁(E_F)[Σ_ℂ]`, using CharacteristicClasses C3.2's `c₁` and the complex fundamental
class.

Prove the following. The last four are the axioms of McDuff–Salamon Theorem C.3.5 (p. 595),
and the loop formula is their Theorem C.3.6 (trivial bundle), which they use as the definition:

- *Loop formula.* For a trivialization of `E` over `Σ`, `μ(E, F)` is the sum over the boundary
  circles, oriented as the boundary of `Σ`, of Tau Ceti's `TotallyRealLoop.maslovIndex` of `F`
  read in that trivialization. In particular the sum is independent of the trivialization.
- *Naturality* under bundle isomorphisms.
- *Additivity* under direct sums, compared with `maslovIndex_prod`.
- *Normalization.* `μ(ℂ, e^{ikθ/2}ℝ) = k` on the unit disc, for every integer `k`.
- *Composition.* Gluing along boundary circles where the totally real data match adds the
  indices.

For a closed surface write `μ(E) = 2c₁(E)[Σ]`, the Chern class property of McDuff–Salamon
Theorem C.3.6.

### 7.2 Riemann–Roch

For a real Cauchy–Riemann operator `D` on `(E, F)` as in PH6, prove
`ind_ℝ D = nχ(Σ) + μ(E, F)` (McDuff–Salamon Theorem C.1.10 (ii), p. 583). In the closed case this is `ind_ℝ D = nχ(Σ) + 2c₁(E)[Σ]`. Here
`χ` is the Euler characteristic of a finite CW model. Identify it with the alternating Betti
sum through CharacteristicClasses C2.3, AlgebraicTopology Stages 6.1, 7.1 and 8.7, and
FuchsianOrbifolds Layer 5's `compactManifoldFiniteCWType`. Prove the formula for an arbitrary
given `j`, independently of uniformization. Work with connected `Σ`; the general case is the
sum over components.

The closed case follows these steps.

1. *Invariance.* By PH6.3 the index is unchanged along the straight-line path between two
   operators on the same data, so it depends only on `(Σ, j, E)`. It is additive under direct
   sums, and invariant under bundle isomorphisms.
2. *Splitting.* If `rank_ℂ E ≥ 2`, a generic smooth section of `E` has no zeros, because real
   rank `≥ 4 > 2 = dim Σ`. Prove this with Tau Ceti's Morse–Sard theorem
   `ContDiff.addHaar_image_criticalPoints_eq_zero` in charts. A nowhere-zero section and a
   Hermitian metric split `E ≅ ℂ ⊕ E'`. By induction, `E ≅ ℂ^{n−1} ⊕ L` with
   `c₁(L) = c₁(E)`, using the Whitney sum formula of CharacteristicClasses C3.2.
3. *Holomorphic structures.* A complex-linear Cauchy–Riemann operator on a line bundle has
   local holomorphic frames by PH3.5's similarity principle. So it is a holomorphic structure,
   and its kernel is the space of holomorphic sections.
4. *Point twisting.* For a holomorphic line bundle `L` and a point `x`, construct the
   holomorphic line bundle `L(x)` with a holomorphic section `s_x` of `𝒪(x)` vanishing simply at
   `x`. Prove `ind_ℝ ∂̄_{L(x)} = ind_ℝ ∂̄_L + 2` and `c₁(L(x)) = c₁(L) + 1`. Prove the index
   statement from the exact sequence
   `0 → ker ∂̄_L → ker ∂̄_{L(x)} → L(x)_x → coker ∂̄_L → coker ∂̄_{L(x)} → 0`. Here the first map
   is multiplication by `s_x`, and the second is evaluation at `x`. The connecting map sends a
   value `c` to the class of `∂̄(χ σ_c)/s_x`, for a local holomorphic section `σ_c` with value
   `c` and a cutoff `χ`. Prove exactness from PH6.3's identification of cokernels with adjoint
   kernels and from unique continuation. This is the operator form of the induction in
   [ModularForms](../ModularForms/README.md) Layer 10B (iii) along
   `0 → 𝒪_D → 𝒪_{D+P} → ℂ_P → 0`. It is stated for arbitrary holomorphic line bundles because
   it is needed before any line bundle is known to be `𝒪(D)` for a divisor `D`.
5. *Reduction to the trivial bundle.* A generic smooth section of `L` has finitely many
   transverse zeros `xᵢ` with signs `εᵢ`, whose signed count is `c₁(L)[Σ]` by
   CharacteristicClasses C3.2's `c₁ = e`. Twisting the trivial holomorphic bundle at those
   points, by `𝒪(xᵢ)` for `εᵢ = 1` and its dual for `εᵢ = −1`, gives a holomorphic bundle.
   Prove it is smoothly isomorphic to `L`, using the section to build the isomorphism. So
   `ind_ℝ ∂̄_L = ind_ℝ ∂̄_ℂ + 2c₁(L)[Σ]`.
6. *Trivial bundle.* The kernel of `∂̄` on functions is the constants, of real dimension 2.
   By PH6.3, the cokernel is the space of antiholomorphic `(0,1)`-forms, which conjugation
   identifies with the holomorphic 1-forms. Consume ModularForms Layer 10B (iv)–(v):
   `dim_ℂ H⁰(Ω¹) = g_an`, and `analyticGenus_eq_topologicalGenus`, which says that `g_an` equals
   FuchsianOrbifolds Layer 5's `RiemannSurface.genus`, defined by `χ = 2 − 2·genus`. Transport
   through PH2.4's comparison of `(Σ, j)` with analytic charted spaces, and prove that the
   holomorphic 1-forms of PH6 agree with ModularForms' holomorphic differentials. Hence
   `ind_ℝ ∂̄_ℂ = 2 − 2·genus = χ(Σ)`.

Combining the steps gives `ind_ℝ D = (n − 1)χ + χ + 2c₁(E)[Σ]`.

The comparison of this formula with divisor Riemann–Roch, `ind_ℂ ∂̄_{𝒪(D)} = deg D + 1 − g`
against ModularForms Layer 10B (iii), belongs to ComplexCurveModuli, which consumes PH7.2 for
it. It is not repeated here.

The bordered case follows from the closed case.

7. *Doubling.* Choose `D` complex linear and commuting with the reflection near `∂Σ` in collar
   coordinates, which is possible by step 1. It extends to a real Cauchy–Riemann operator
   `D_F` on `E_F` that commutes with the lifted `τ`. The kernel and cokernel of `D_F` split
   into `±1` eigenspaces of `τ`; multiplication by `i` exchanges them, and the `+1` part is the
   kernel and cokernel of `D` with boundary condition `F`. Hence `ind D_F = 2 ind D`. The closed
   formula with `χ(Σ_ℂ) = 2χ(Σ)` and `c₁(E_F)[Σ_ℂ] = μ(E, F)` gives the bordered formula.
8. *Check against the disc.* Compute the disc case `(ℂ, e^{ikθ/2}ℝ)` directly by Fourier
   series, as in McDuff–Salamon Theorem C.4.1 (p. 598). For `k ≥ −1` the operator `∂̄` is onto, with kernel of real dimension `1 + k`. For
   `k ≤ −1` it is injective, with cokernel of dimension `−1 − k`. Prove that this agrees with
   step 7.

Finally prove the line-bundle vanishing theorem, McDuff–Salamon Theorem C.1.10 (iii). For
`n = 1`, `D_F` is injective if `μ(E, F) < 0`, and surjective if `μ(E, F) + 2χ(Σ) > 0`. In the
closed case, first prove the *zero count*: a section of a complex line bundle over a closed
connected Riemann surface, in the kernel of a real Cauchy–Riemann operator and not identically
zero, has isolated zeros of positive integer order (PH3.5), and the sum of the orders is
`c₁(E)[Σ]`. Compare the orders with the transverse signed count of CharacteristicClasses C3.2's
`c₁ = e`. So a nonzero kernel element forces `μ(E) = 2c₁(E)[Σ] ≥ 0`. Surjectivity follows by
applying injectivity to `D_F*`, a real Cauchy–Riemann operator on a line bundle with
`μ = −μ(E, F) − 2χ(Σ)`, through PH6.3's duality. In the bordered case, reduce to the closed
case by doubling, as McDuff–Salamon do in their proof of (iii) (p. 603).

### 7.3 Checks

- `c₁(TS²)[S²] = 2`, so `∂̄` on `TS²` has index `2 + 4 = 6`, the dimension of `PSL₂(ℂ)`.
- The disc with `(ℂⁿ, ℝⁿ)` has index `n`.
- The annulus with `(ℂ, ℝ)` on both boundary circles has index `0`.

*Needs:* PH6; Tau Ceti `maslovIndex`, `maslovIndex_map`, `maslovIndex_prod`;
CharacteristicClasses C2.3, C3.2; AlgebraicTopology 6.1, 7.1, 8.7; FuchsianOrbifolds Layer 5.

## Downstream consumers

The targets here are the single owner of the planar and compact Cauchy–Riemann theory. The
roadmaps below consume them and must not rebuild them:

- **HeegaardFloer**:
  - F1.1 consumes PH1 and PH6.1, and F1.2 consumes PH2.3–PH2.4, PH3, PH6.3 and PH7.2's zero
    count. F1.2 keeps its normalized disc solvers with prescribed centre and first jet;
  - the closed and bordered part of F1.5 is PH6–PH7, and F1.5's punctured and weighted theory
    consumes PH6–PH7 for the compact pieces;
  - F2.2's `W^{2,p}` regularity for `C¹` structures is PH5.1 with `ℓ = 1`;
  - F2.3's compactness consumes PH5.2.
- **ComplexCurveModuli**, **TaubesGromov**, **DGFloer** and **HamiltonianFloerOperations** use
  the planar estimates, the Hölder Cauchy–Green operator and closed and bordered
  Riemann–Roch. These are PH3.1–PH3.4 and PH7.2.

## References

- D. McDuff and D. Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed., AMS
  Colloquium Publications 52, 2012. Printed page numbers:
  - §2.3 (pp. 21–25): Theorem 2.3.5, the Carleman similarity principle (PH3.5);
  - §4.1: Theorem 4.1.1, convergence under gradient bounds (p. 76, PH5.2);
  - Appendix B: Theorems B.1.11–B.1.12, Sobolev embeddings (p. 555); Proposition B.1.19,
    products (p. 560); Theorem B.2.7, Calderón–Zygmund (p. 565); §B.4, elliptic bootstrapping
    (pp. 571–578), with Theorems B.4.1–B.4.2 and Remark B.4.3 (p. 571), Lemma B.4.4 (p. 572),
    Lemmas B.4.5–B.4.6 (p. 573), Proposition B.4.9 (p. 575) and Exercise B.4.10 (p. 577)
    (PH3.3–PH3.4, PH2.3, PH5);
  - Appendix C: Definition C.1.5 (p. 581), Exercise C.1.7, Lemma C.1.9 (p. 582) and
    Theorem C.1.10 (p. 583) (PH6–PH7); Lemma C.2.2 (p. 587) and Theorem C.2.3 (p. 588) (PH6);
    Theorems C.3.5–C.3.6 (p. 595), the boundary Maslov index (PH7.1); Theorem C.4.1 (p. 598),
    the disc case (PH7.2); Corollary C.5.3, integrability on surfaces (p. 605, PH2.4);
  - Appendix E: Theorem E.3.1, Newlander–Nirenberg (p. 664, PH2.4).
- I. N. Vekua, *Generalized Analytic Functions*, Chapters I–III (Cauchy and Beurling operators,
  similarity principle).
- L. Ahlfors, *Lectures on Quasiconformal Mappings*, Chapter V (Beltrami equation).
- Y.-G. Oh, *Riemann–Hilbert problem and application to the perturbation theory of analytic
  discs*, Kyungpook Math. J. 35 (1995) (totally real boundary value problems).
