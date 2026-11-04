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

The headline theorem (PH5.1): let `ℓ ≥ 1` and `p > 2`, let `(Σ, j)` be a Riemann surface
(possibly with boundary), let `J` be a `C^ℓ` almost complex structure on `M`, and let `L ⊆ M` be
a smooth totally real submanifold. A `W^{1,p}_loc` map `u : Σ → M` with `du ∘ j = J(u) ∘ du`
almost everywhere and `u(∂Σ) ⊆ L` is of class `W^{ℓ+1,p}_loc`, hence `C^ℓ`. It is smooth when
`J` is smooth.

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
- [PseudodifferentialOperators](https://github.com/TauCetiProject/TauCetiRoadmap/blob/636402fca8e69477e502482c928dbb6f15942793/TauCetiRoadmap/PseudodifferentialOperators/README.md#62-regularity-and-solvability)
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
  comparison with the alternating Betti sum) and C3.2 (`c₁ = e` in rank one, and the
  determinant-line comparison).
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

- `ψ(ι(L)) ⊆ ℝⁿ` near `x₀`;
- `ψ_* J = i` at every point of `ℝⁿ` in the chart image;
- the chart has `C^ℓ` dependence on parameters when `J` depends `C^ℓ` on a parameter.

The construction is as follows. Take a chart `φ` of `L` at `x₀` and a chart `χ` of `M` at
`ι x₀`, and write `γ = χ ∘ ι ∘ φ⁻¹` and `J_χ` for `J` in the chart. Set
`Φ(x + iy) = γ(x) + Σⱼ yⱼ J_χ(γ(x)) ∂ⱼγ(x)` for `x, y ∈ ℝⁿ`. Its derivative at `(x, 0)` sends
`eⱼ ↦ ∂ⱼγ(x)` and `ieⱼ ↦ J_χ(γ(x))∂ⱼγ(x)`. That derivative is invertible because `TL` is
totally real, and it intertwines `i` with `J_χ`. The inverse function theorem then gives
`ψ = (χ⁻¹ ∘ Φ)⁻¹` near `ι x₀`. Retain the regularity budget: from a `C^ℓ` structure `J` the
chart is `C^ℓ`.

### 2.4 Isothermal coordinates and bordered Riemann surfaces

**Interior.** Let `j` be an almost complex structure of class `C^{ℓ,α}` on a boundaryless
surface, with `ℓ ≥ 1` and `0 < α < 1`. Prove that every point has a `C^{ℓ+1,α}` chart to an open
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
- for data supported in a fixed disc, `T` gains one derivative in `Lᵖ` and in `C^{k,α}`, and
  `B` is bounded on `C^{k,α}`, for every `k ≥ 0` and `0 < α < 1`.

State support radii, cutoffs and constants explicitly. Prove continuity in parameters for
families of data with common support.

### 3.2 Interior estimates and regularity for `∂̄`

For `1 < q < ∞`, `k ≥ 0` and compact `K ⊆ Ω`:

- *Estimate.* For `ξ ∈ W^{k+1,q}_loc(Ω; ℂⁿ)`, prove
  `‖ξ‖_{W^{k+1,q}(K)} ≤ C(‖∂̄ξ‖_{W^{k,q}(Ω')} + ‖ξ‖_{Lq(Ω')})` for an open `Ω'` with
  `K ⊆ Ω' ⋐ Ω`.
- *Weak regularity.* If `ξ ∈ L^q_loc` and the distribution `∂̄ξ` is in `W^{k,q}_loc`, then
  `ξ ∈ W^{k+1,q}_loc`. The case `∂̄ξ = 0` is Weyl's lemma for `∂̄`: `ξ` agrees almost
  everywhere with a holomorphic function.

### 3.3 Interior estimates with Sobolev coefficients

Let `p > 2`, `ℓ ≥ 1`, let `J ∈ W^{ℓ,p}_loc(Ω; End ℝ^{2n})` with `J² = −1` pointwise, and let
`S ∈ W^{ℓ−1,p}_loc(Ω; End ℝ^{2n})`. Put `Dξ = ∂_s ξ + J ∂_t ξ + S ξ`. For
`p/(p−1) ≤ q ≤ p` and `0 ≤ k ≤ ℓ − 1`, prove the following:

- *Weak regularity.* Call `ξ ∈ L^q_loc` a weak solution of `Dξ = η` if it satisfies
  `∫⟨D*φ, ξ⟩ = ∫⟨φ, η⟩` for every test function `φ`, with `D*` the formal adjoint. If
  `η ∈ W^{k,q}_loc`, then `ξ ∈ W^{k+1,q}_loc`.
- *Estimate.* `‖ξ‖_{W^{k+1,q}(K)} ≤ C(‖Dξ‖_{W^{k,q}(Ω')} + ‖ξ‖_{Lq(Ω')})`, where `C` depends
  only on `K`, `Ω'`, `k`, `q`, `p` and bounds for `‖J‖_{W^{ℓ,p}(Ω')}` and
  `‖S‖_{W^{ℓ−1,p}(Ω')}`.
- *Uniformity.* The same constant works for every `(J, S)` in a set bounded in these norms.

The proof freezes `J` at a point, uses a complex-linear frame change to reduce to
`J(z₀) = i`, applies PH3.2, and absorbs the error on small discs by continuity of `J`
(`p > 2`). Higher orders follow by differentiating the equation, using PH1.2's products.
Formulate the frozen-coefficient step as its own lemma.

### 3.4 Totally real boundary conditions on the half-disc

Let `Φ ∈ W^{ℓ,p}(D⁺_r; GL(2n, ℝ))` satisfy `Φ(z) i = J(z) Φ(z)`, and let
`F(z) = Φ(z)ℝⁿ` for `z ∈ D⁺_r ∩ ℝ`. This is the form in which totally real boundary data
arise from PH2.3 and from linearizations. Impose `ξ(z) ∈ F(z)` for `z ∈ D⁺_r ∩ ℝ`. This is a
pointwise condition when `q > 2`, because `W^{1,q}` maps are then continuous; for `q ≤ 2` it is
a condition on traces, using PDE Lane A's trace. Prove the analogues of PH3.2 and PH3.3 on
half-discs, with estimates up to the boundary. After the substitution of step 1 below, a weak
solution `ζ ∈ L^q_loc(D⁺_r)` is defined by testing against smooth `φ` compactly supported in
`D⁺_r`, not required to vanish on `ℝ`, with `φ(z) ∈ ℝⁿ` for `z ∈ ℝ`. With this boundary
condition on `φ`, the boundary term of integration by parts vanishes exactly when `ζ ∈ ℝⁿ`
on `ℝ`.

The route is as follows.

1. Substitute `ξ = Φζ`. This reduces to `F = ℝⁿ`, with `J = i`, and a zeroth-order term in
   `W^{ℓ−1,p}`.
2. For the order-zero step (`ζ ∈ W^{1,q}` up to the boundary), extend `ζ` and the coefficients
   across `ℝ` by the reflection `ζ(z̄) = conj ζ(z)` and `S̃(z̄) = conj ∘ S(z) ∘ conj`. Prove
   that the reflected `ζ` is a weak solution on the full disc, and apply PH3.3 with `ℓ = 1`.
   Tau Ceti's totally real Schwarz reflection is the constant-coefficient case.
3. For higher orders, differentiate tangentially. The difference quotients in `s` preserve the
   boundary condition `ζ ∈ ℝⁿ` and satisfy an equation of the same type. Then recover `∂_t ζ`
   from the equation `∂_t ζ = i(∂_s ζ + Sζ − η)`. Induct on `k ≤ ℓ − 1`.

As a check, take the model operator `∂̄` on the unit disc with `ξ(e^{iθ}) ∈ e^{3iθ/2}ℝ`: its
kernel is `a₀ + a₁z + conj(a₁)z² + conj(a₀)z³`, real dimension 4.

### 3.5 Similarity principle and unique continuation

The *vector similarity principle* says the following. Let `p > 2`, let `A, B ∈ L^p_loc` be
matrix-valued, and let `ξ ∈ W^{1,p}_loc(Ω; ℂⁿ)` solve `∂̄ξ + Aξ + B conj(ξ) = 0`. Then near
every point, `ξ = Φσ` with `Φ` an invertible `W^{1,p}` matrix and `σ` holomorphic. Prove it by
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

Let `ℓ ≥ 1`, `p > 2`, let `J` be a `C^ℓ` domain-dependent structure and `ν` a `C^ℓ`
inhomogeneous term, and let `u` satisfy `IsWeakPseudoholomorphic j J ν p u`. Then
`u ∈ W^{ℓ+1,p}_loc(Σ, M)`, so `u` is `C^ℓ`. If `J` and `ν` are smooth, `u` is smooth. The
same holds up to the boundary when `u` satisfies `MapsBoundaryTo u ι` for a smooth totally
real embedding `ι` for `J`.

The proof is local. In coordinates, `z ↦ J(z, u(z))` is in `W^{1,p}_loc`. By induction, if
`u ∈ W^{m,p}_loc` with `m ≤ ℓ`, then `J(z, u)` and `η(z, u)` are in `W^{m,p}_loc` by PH1.2.
Apply PH3.3 to the linear operator `∂_s + J(z, u(z))∂_t` with `ξ = u` to get
`u ∈ W^{m+1,p}_loc`. At the boundary, use PH2.3's adapted chart, in which `u(z) ∈ ℝⁿ` on the
boundary and `J = i` there, and apply PH3.4.

Corollary: a `C¹` map satisfying `IsPseudoholomorphic j J u` for smooth `J` is smooth, with
the boundary version for `MapsBoundaryTo u ι`. This uses PH4.2's comparison, and the fact that
a `C¹` map is `W^{1,p}_loc` for every `p`.

### 5.2 Uniform estimates

Let `J_m → J` in `C^ℓ` and `ν_m → ν` in `C^ℓ`, both on compact subsets. Let `u_m` satisfy the
weak equations for `(J_m, ν_m)` with boundary on a fixed totally real `ι`. Assume the `u_m`
converge uniformly on compact subsets to a continuous `u`, and that in charts around `u` they
are bounded in `W^{1,p}` on compact subsets. Then:

- the `u_m` are bounded in `W^{ℓ+1,p}` on compact subsets, with constants depending only on the
  `C^ℓ` bounds of the data and the `W^{1,p}` bound;
- a subsequence converges in `W^{ℓ,p}` on compact subsets, hence in `C^{ℓ−1}`;
- `u` satisfies the limiting equation and boundary condition.

For smooth data converging in `C^∞` on compact subsets, the convergence is `C^∞`. State the
gradient-bound corollary used in compactness: if, for a metric on `M`, `|du_m|` is uniformly
bounded on compact subsets and the images of compact sets stay in a fixed compact set, then a
subsequence converges in `C^∞` on compact subsets. The convergence comes from Arzelà–Ascoli,
and the uniform bound from PH3.3's uniformity clause.

*Needs:* PH1–PH4.

## Layer 6: real Cauchy–Riemann operators on bundles over compact surfaces (PH6)

### 6.1 Sobolev sections over compact surfaces with boundary

Let `Σ` be a compact surface with (possibly empty) boundary and `E → Σ` a smooth real vector
bundle with complex structure `J_E`. For `k ≥ 0` and `1 < p < ∞`, construct `W^{k,p}(Σ, E)`:
fix a finite atlas of isothermal charts with trivializations and a subordinate partition of
unity, and give the norm by the PH1.1 norms of the localized pieces. Prove:

- different choices give equivalent norms;
- completeness, density of smooth sections, Rellich compactness `W^{k+1,p} → W^{k,p}`, and the
  Morrey embedding for `kp > 2`;
- multiplication by `W^{k,p}` coefficients for `kp > 2`.

For a totally real subbundle `F ⊆ E|∂Σ` and `kp > 2`, let `W^{k,p}_F(Σ, E)` be the closed
subspace of sections with boundary values in `F`. Construct the target space
`W^{k−1,p}(Σ, Λ^{0,1} ⊗_ℂ E)` the same way.

### 6.2 Real Cauchy–Riemann operators

A real Cauchy–Riemann operator on `E` is a real-linear operator
`D : Ω⁰(Σ, E) → Ω^{0,1}(Σ, E)` satisfying the Leibniz rule `D(fξ) = f Dξ + (∂̄f)ξ` for
real-valued smooth `f`. Prove that any two differ by a zeroth-order term
`Ω⁰(Σ, End_ℝ E)` acting into `(0,1)`-forms, and that a `J_E`-complex connection `∇` gives one,
`D = (∇)^{0,1}`. Allow zeroth-order terms of class `W^{ℓ−1,p}` with `ℓ ≥ 1` and `p > 2`,
which is the regularity of the linearization at a `W^{ℓ,p}` curve.

For `1 ≤ k ≤ ℓ` and `p > 2`, prove the following:

- `D : W^{k,p}_F → W^{k−1,p}` is bounded;
- the elliptic estimate `‖ξ‖_{W^{k,p}} ≤ C(‖Dξ‖_{W^{k−1,p}} + ‖ξ‖_{Lᵖ})` holds, by PH3.3–PH3.4
  in charts;
- `D` is Fredholm, by the estimate and Rellich.

### 6.3 Regularity of the kernel and cokernel

Prove the following:

- the kernel consists of `W^{ℓ,p}` sections (smooth sections when the coefficients are smooth),
  and it is independent of `k ≤ ℓ` and of `p > 2`;
- the cokernel is identified with the kernel of the formal adjoint
  `D* : Ω^{0,1}(E) → Ω⁰(E)` with its dual boundary condition. Fix a `J_E`-Hermitian metric on
  `E` for which `F` is Lagrangian, and prove such a metric exists. Fix also an area form
  compatible with `j`. The adjoint boundary condition is `η(v) ∈ F` for `v` tangent to `∂Σ`.
  On `D⁺_r` with `D = ∂_s + i∂_t` and `F = ℝⁿ`, integration by parts leaves the boundary term
  `−∫_ℝ ⟨iξ, η(∂_s)⟩ ds`, which vanishes for all `ξ ∈ ℝⁿ` exactly when `η(∂_s) ∈ ℝⁿ`;
- an `L^{p'}` functional annihilating the range is a weak solution of `D*η = 0`, and it is as
  regular as the coefficients allow.

`D*` is a real Cauchy–Riemann operator of `∂`-type. Put it in the form of PH3.3 by conjugation
and the metric, and apply PH3.3–PH3.5. Prove unique continuation for kernel and cokernel
elements from PH3.5. Prove that the index is independent of `k` and `p`, and that it is
locally constant along continuous families of zeroth-order terms. For the latter, consume
Mathlib's `IsFredholm.eventually_nhds_index_eq`.

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

Prove the following:

- *Loop formula.* For a trivialization of `E` over `Σ`, `μ(E, F)` is the sum over the boundary
  circles, oriented as the boundary of `Σ`, of Tau Ceti's `TotallyRealLoop.maslovIndex` of `F`
  read in that trivialization. In particular the sum is independent of the trivialization.
- *Naturality* under bundle isomorphisms.
- *Additivity* under direct sums, compared with `maslovIndex_prod`.
- *Normalization.* `μ(ℂ, e^{ikθ/2}ℝ) = k` on the unit disc, for every integer `k`.
- *Composition.* Gluing along boundary circles where the totally real data match adds the
  indices.

For a closed surface write `μ(E) = 2c₁(E)[Σ]`.

### 7.2 Riemann–Roch

For a real Cauchy–Riemann operator `D` on `(E, F)` as in PH6, prove
`ind_ℝ D = nχ(Σ) + μ(E, F)`. In the closed case this is `ind_ℝ D = nχ(Σ) + 2c₁(E)[Σ]`. Here
`χ` is the Euler characteristic of a finite CW model. Identify it with the alternating Betti
sum through CharacteristicClasses C2.3, AlgebraicTopology Stages 6.1, 7.1 and 8.7, and
FuchsianOrbifolds Layer 5's `compactManifoldFiniteCWType`. Prove the formula for an arbitrary
given `j`, independently of uniformization.

The route is as follows:

1. By PH6.3 the index is unchanged along continuous paths of zeroth-order terms, so it
   depends only on `(Σ, j, E, F)`. Moreover any two operators on the same data are joined by
   the straight-line path.
2. *Closed case.* Construct a local parametrix and prove the cut-and-paste index formula for a
   decomposition of the surface along embedded circles with collars. Use it to reduce to the
   two local contributions: the Euler contribution `nχ` and the clutching contribution
   `2c₁`. Compute both on the sphere, where the line bundles of degree `d` have `∂̄`-index
   `2(d + 1)` by Fourier series in an annulus decomposition.
3. *Bordered case.* Choose `D` complex linear and commuting with the reflection near `∂Σ` in
   collar coordinates, which is possible by step 1. It extends to a real Cauchy–Riemann
   operator `D_F` on `E_F` that commutes with the lifted `τ`. The kernel and cokernel of
   `D_F` split into `±1` eigenspaces of `τ`; multiplication by `i` exchanges them, and the
   `+1` part is the kernel and cokernel of `D` with boundary condition `F`. Hence
   `ind D_F = 2 ind D`. The closed formula with `χ(Σ_ℂ) = 2χ(Σ)` and
   `c₁(E_F)[Σ_ℂ] = μ(E, F)` gives the bordered formula.
4. *Check against the disc.* Compute the disc case `(ℂ, e^{ikθ/2}ℝ)` directly by Fourier
   series. For `k ≥ −1` the operator `∂̄` is onto, with kernel of real dimension `1 + k`. For
   `k ≤ −1` it is injective, with cokernel of dimension `−1 − k`. Prove that this agrees with
   step 3.

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
  - F1.1–F1.2 consume PH1 and PH3;
  - the closed and bordered part of F1.5 is PH6–PH7, and F1.5's punctured and weighted theory
    consumes PH6–PH7 for the compact pieces;
  - F2.2's `W^{2,p}` regularity for `C¹` structures is PH5.1 with `ℓ = 1`;
  - F2.3's compactness consumes PH5.2.
- **ComplexCurveModuli**, **TaubesGromov**, **DGFloer** and **HamiltonianFloerOperations** use
  the planar estimates, the Hölder Cauchy–Green operator and closed and bordered
  Riemann–Roch. These are PH3.1–PH3.4 and PH7.2.

## References

- D. McDuff and D. Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed., AMS
  Colloquium Publications 52, 2012: Appendix B (Sobolev spaces, Calderón–Zygmund, elliptic
  bootstrapping), Appendix C (Riemann–Roch), Chapter 3 (the linearized operator and its
  Fredholm theory), Chapter 4 (gradient bounds and compactness).
- I. N. Vekua, *Generalized Analytic Functions*, Chapters I–III (Cauchy and Beurling operators,
  similarity principle).
- L. Ahlfors, *Lectures on Quasiconformal Mappings*, Chapter V (Beltrami equation).
- Y.-G. Oh, *Riemann–Hilbert problem and application to the perturbation theory of analytic
  discs*, Kyungpook Math. J. 35 (1995) (totally real boundary value problems).
