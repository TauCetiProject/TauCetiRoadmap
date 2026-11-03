# Roadmap: lattice packings, perfect forms, and the geometric invariants of positive definite lattices

**Summary.** A positive definite integral lattice is a finitely generated free `ℤ`-module with a positive
definite integer-valued symmetric bilinear form; equivalently, up to the choice of a basis, a
positive definite symmetric integer matrix `G`, its Gram matrix. The arithmetic of such lattices
(dual, discriminant group, genus, class number, theta series) is the subject of the
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md), the
[completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md) it extends, and the
[theta-series roadmap](../ThetaSeries/README.md). What those roadmaps leave out, and what this one
builds, is the **geometry** of the lattice: the sphere packing it defines, the covering it defines,
the shape of its set of shortest vectors, and the extremal problems these pose over *all*
lattices, integral or not: minimum and kissing number, packing and covering densities, the
Hermite constant, Voronoi's theory of perfect and eutactic forms, spherical designs on shells,
universality, tensor decompositions and the Festi–Veniani index (the list under *Owned here* is
the table of contents). These are exactly the invariants of the LMFDB lattice section that no other roadmap owns: its
`minimum`, `kissing`, `shortest`, `density` and `hermite` columns, and the knowls
`lattice.covering_radius`, `lattice.perfect`, `lattice.eutactic`, `lattice.extreme`,
`lattice.well_rounded`, `lattice.spherical_design`, `lattice.successive_minima`,
`lattice.tensor_decomposition`, `lattice.festi_veniani_index`. Each becomes a Lean definition
with the theory that makes it usable, and each stored value becomes a provable statement about the
stored Gram matrix.

**Two carriers.** Voronoi's theory and the Hermite constant are statements about *real*
positive definite quadratic forms on `ℤⁿ`: the perfect forms of a given rank are finitely many up
to similarity but need not be integral, and `γₙ` is a supremum over all forms. The LMFDB stores
*integral* lattices. The roadmap therefore has two carriers and one dictionary between them:

- a **form** is a real symmetric positive definite matrix `A : Matrix (Fin n) (Fin n) ℝ`, Mathlib's
  `Matrix.PosDef A`, acting on the fixed lattice `ℤⁿ ⊂ ℝⁿ` by `x ↦ xᵀAx`. The group `GL_n(ℤ)` acts by
  `A ↦ UᵀAU`, and *similarity* adds positive scaling. The scale-free invariants (kissing number, densities and Hermite invariant)
  are similarity invariant; minimum scales by c and radii by √c under A ↦ cA;
- a **lattice** is Tau Ceti's `TauCeti.IntegralLattice V` with `IsPosDef`, the carrier of both
  integral-lattices roadmaps. Its invariants are those of the Gram matrix `L.gramMatrix b` of any
  `ℤ`-basis `b`, proved independent of `b` by `GL_n(ℤ)`-invariance.

Metric statements about a form `A` (covering radius, Voronoi cell, designs on spheres) are made in
`FormSpace A`: the vector space `Fin n → ℝ` with the inner product `⟪x, y⟫ = xᵀAy`, in which `ℤⁿ` is a
full `ℤ`-lattice in Mathlib's sense (`IsZLattice ℝ`). This is the same real model the theta-series
roadmap builds for a rational lattice (`realModel`, its 2D), and milestone 0.4 identifies the two.

Suggested homes: `TauCeti/LinearAlgebra/QuadraticForm/PosDefForm/` for Layers 0–4 (forms,
densities, covering, perfect and eutactic forms, Voronoi's theorem and adjacency),
`TauCeti/LinearAlgebra/IntegralLattice/PosDef/Geometry/` for the lattice-side definitions and the
LMFDB columns (Layers 0, 1, 7, 8), `TauCeti/Analysis/SphericalDesign/` and
`TauCeti/NumberTheory/ThetaSeries/Harmonic/` for Layer 5, and
`TauCeti/NumberTheory/IntegralLattice/Universal/` for Layer 6.

## Scope and ownership

### Owned here

- The form carrier, the `GL_n(ℤ)`-action, similarity, `FormSpace A`, the lattice `ℤⁿ` in it, and
  the dictionary with `TauCeti.IntegralLattice` through Gram matrices (Layer 0).
- Minimum and minimal vectors of a form, kissing number, normalized minimal vectors,
  well-rounded, generated-by-minimal-vectors, strongly well-rounded; the Hermite invariant; packing
  radius, center density and density with the LMFDB normalizations; the real Minkowski and Hermite
  upper bounds on the Hermite invariant (Layer 1).
- The Hermite constant `γₙ`: its finiteness, attainment, monotonicity relations, and the proved
  values `γ₁ = 1`, `γ₂ = (4/3)^{1/2}`, `γ₃ = 2^{1/3}` (Layer 2); the values `γ₄, …, γ₈` as
  consequences of the perfect-form classification, and `γ₂₄ = 4` (Layer 4).
- Voronoi cells, Voronoi-relevant vectors, the inhomogeneous minimum (covering radius) of a form,
  deep holes, the covering density, Jarník's inequalities, and the identification with GoN's
  `latticeCoveringRadius` of the realized lattice (Layer 3).
- Perfect, eutactic, strongly eutactic and extreme forms; Korkine–Zolotarev's bound; Voronoi's
  theorem; rationality and finiteness of perfect forms; the Ryshkov polyhedron and Voronoi's
  neighbour relation; finite classifications for ranks `≤ 8`; the finiteness of eutactic
  forms up to similarity (Layer 4).
- Spherical `t`-designs in a real inner product space, the moment criterion, design lattices,
  strongly perfect lattices, Gram-metric harmonicity, theta series with harmonic coefficients and
  their modularity, Venkov's theorem (Layer 5).
- Universality, the truant, escalators, the escalation lemma, the 15 theorem and the 290 theorem
  (Layer 6).
- Tensor products of forms and lattices, their rank, determinant, definiteness and minimum,
  Kitaoka's theorem, tensor decomposability; the natural map `O(L) → O(D_L)` and the Festi–Veniani
  index (Layer 7).
- The geometric meanings of the LMFDB minimum, kissing, shortest, density and Hermite columns.

### Consumed, not redefined

- **From Tau Ceti at the pin**, the declarations tabulated under *What Tau Ceti supplies*: the
  carrier and its Gram, norm, scaling and sum API; `minimum`, `kissingNumber`, `vectorsOfNorm`,
  `representationNumber` and their finiteness; the isometry group; the realization theory of
  `PosDef/Covolume`; the discriminant group and pairing; the rank-one and ADE lattices.
  Tau Ceti's `minimum` and `kissingNumber` **are** the LMFDB `minimum` and `kissing` columns;
  Layer 1 identifies them with the form-side definitions and adds no second minimum on the
  rational carrier.
- **From Tau Ceti at the pin**: `TauCeti.IntegralLattice.successiveMinimum`
  (`TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean`) and
  `IsPosDef.minimum_le_rpow_mul_determinant_rpow`
  (`TauCeti/LinearAlgebra/IntegralLattice/PosDef/Hermite.lean`). The remaining integral
  Minkowski, reduction and class-finiteness inputs are consumed from IntegralLattices
  §§2E–2G, and the E₈ root count from its §6G; they are not new targets here.
- **From GeometryOfNumbersAndQuadraticArithmetic §4.3**: `polynomialLaplacian`,
  `polynomial_fischer_decomposition`, `polynomial_sphere_harmonic_span`, and
  `fourier_harmonic_gaussian`. Layer 5 adds the Gram-coordinate adapter, the design
  application and the complex-parameter Fourier identity.
- **From the theta-series roadmap**: `poissonSummation`, `gaussian`, `fourier_gaussian` (Layer 1);
  `RealSpace M`, `realModel M`, `ratModel`, the invariant comparisons of 2D; `shell`, `repNum` and
  `ncard_vectorsOfNorm_ratModel` (2G); the theta identities `Θ_{E₈} = E₄` and `Θ_Λ = E₄³ − 720Δ`
  with their corollaries `r_{E₈}(2) = 240` (8B) and `r_Λ(4) = 196560` (8D). Layer 5 here builds
  theta series *with harmonic coefficients*, which that roadmap explicitly leaves out; the scalar
  theta series is never redefined.
- **From Successive Minima** (cited by milestone, no Lean declaration here): `successiveMin L K i` (1.1),
  `minkowski_second_lower` (2.1.4); the upper theorem is GoN §1.3. Milestone 1.2 proves
  `min A = successiveMin (ℤⁿ) (closedBall 0 1) 0 ^ 2` in `FormSpace A`.
- **From GoN** (cited by milestone, no Lean declaration here): `latticePackingRadius` (4.4.1),
  `latticeCoveringRadius` (4.4.2), `StarBody` (4.5.1), with boundedness imposed where used,
  `criticalDeterminant` (4.5.2), `mahler_compactness` (4.5.8, n ≥ 2 and a positive shortest-length bound), `IsLLLReduced`, `lll_short_vector_factor` (5.1.2, 5.1.4). Milestones 1.4 and 3.3
  identify the packing radius and the inhomogeneous minimum of a form with the first two.
- **From Orthogonal Tamagawa** (open roadmap): the automorphism-order certificates of §4 for
  `E₈`, the rank-16 pair and the 24 rank-24 lattices, and the mass and `class_number` columns.
  This roadmap proves no automorphism order and no class number.
- **From Rank 24 constructions**: Layer 6, the Leech lattice with `min Λ₂₄ = 4`.
- **From Mathlib**: everything under *What Mathlib supplies*.

### Not owned here

- **The arithmetic of the lattice**: dual, discriminant forms, level, genus and genus symbols,
  class number, spinor genus, neighbours, Nikulin's theory, the low-rank unimodular
  classification, and the automorphism group with its order: IL and Completed IL.
- **The mass formula and the class number as a stored column**: Orthogonal Tamagawa (`#` of
  classes, `mass`); IL 9B is the certificate shape and is consumed by the downstream applications unchanged.
- **Theta series**: `Θ_L`, its `q`-expansion, the `T` and `S` laws, Hecke–Schoeneberg, and every
  modularity statement about a scalar theta series, including the identification of
  representation numbers with `q`-coefficients. Theta Series. The theta series of an
  **odd**-rank lattice as a half-integral weight modular form is the
  `HalfIntegralWeightModularForms` roadmap's; the **Siegel** theta series of degree `g`, with or
  without pluriharmonic coefficients, is `SiegelModularForms`' (its Layer 5). Layer 5 here is
  degree one, even rank, and its harmonic coefficients are polynomials on the real model, which is
  neither of those.
- **The ternary form of a quaternion order** and the even Clifford correspondence:
  `QuaternionArithmetic` (its Layer 2). The ternary lattices of Layer 6 here are escalators of
  `ℤ`-lattices and never carry an order.
- **Real successive minima of convex bodies** and Minkowski's second theorem: Successive Minima.
  **Lattice-point counting, transference, star bodies, critical determinants, Siegel's mean value
  theorem, lattices from codes, LLL**: GoN. The LLL *algorithm* is `hex-lll`, cited by GoN 5.1.
- **Short-vector enumeration** (Fincke–Pohst) as an algorithm:
  [Effective Diophantine methods](../EffectiveDiophantineMethods/README.md) §1.8.
- **The sphere packing problem for non-lattice packings**. The lattice Cohn–Elkies
  bound and the dimension-24 auxiliary function belong to §4.11 here. `γ₈ = 2` and `γ₂₄ = 4` are stated here as theorems about *lattices* with cited proofs;
  `math-inc/Sphere-Packing-Lean` is the migration source named in 4.11.
- **Label components beyond the intrinsic prefix, orderings fixed by convention, stored lists, and
  the completeness of database tables** are not targets: the lattice label's enumerative index, the
  order of the `shortest` list, and the stored genus representatives. The intrinsic prefix
  `dim.det.level.class_number` is IL's (rank, determinant, level) and Orthogonal Tamagawa's (class
  number); this roadmap contributes no label component.
- **Root systems, Weyl groups and the ADE classification**:
  [Root Systems](../RepresentationTheory/RootSystems/README.md). A root here is a vector of norm
  `2`, as in IL.

## Conventions

**Forms.** `PosDefForm n` is the subtype `{A : Matrix (Fin n) (Fin n) ℝ // A.PosDef}` of Mathlib's
`Matrix.PosDef`, which for real matrices is `A.IsHermitian ∧ ∀ x ≠ 0, 0 < x ⬝ᵥ A *ᵥ x`, so symmetry
is part of the predicate. The value of `A` at `x : Fin n → ℝ` is `A[x] := x ⬝ᵥ (A *ᵥ x)`, written
`xᵀAx` in prose; `A[x, y] := x ⬝ᵥ (A *ᵥ y)`. `GL_n(ℤ)` is `Matrix.GeneralLinearGroup (Fin n) ℤ`, and
`U` acts by `A ↦ Uᵀ A U` (so `(U • A)[x] = A[Ux]`); `A ∼ B` (similar) means `B = c • Uᵀ A U` for
some `c > 0` and `U ∈ GL_n(ℤ)`. The topology on `PosDefForm n` is the subspace topology of
`Matrix (Fin n) (Fin n) ℝ`.

**Norm, never halved.** The norm of `x` is `xᵀAx`, a squared length. The *minimum* `min A` is a
norm, so for `A₂` it is `2` and for `ℤⁿ` it is `1`; this is the LMFDB `minimum` column ("minimal
vector length" there means this norm) and Tau Ceti's `IntegralLattice.minimum`. Lengths are
written with an explicit square root: the packing radius is `√(min A)/2`.

**Minimal vectors.** `S(A) = {x ∈ ℤⁿ | x ≠ 0 ∧ xᵀAx = min A}`, a finite set closed under negation;
the kissing number is `#S(A)`, so it counts `x` and `−x` separately and is even in positive rank.
`S⁺(A)` is the half of `S(A)` whose first nonzero coordinate is positive; `#S⁺(A) = #S(A)/2`. `S⁺`
depends on the basis (it is a property of the coordinates, not of the lattice) and is the LMFDB
`shortest` column for the stored Gram matrix. In rank `0`, `min A = 0`, `S(A) = ∅` and the kissing
number is `0`, matching Tau Ceti.

**Density.** `Vₙ = π^{n/2} / Γ(n/2 + 1)` is the volume of the unit ball, Mathlib's
`InnerProductSpace.volume_ball` at radius `1`. For `A` of rank `n ≥ 1` with packing radius
`ρ(A) = √(min A)/2`: the *center density* is `δ(A) = ρ(A)ⁿ / √(det A)` and the *density* is
`Δ(A) = Vₙ · δ(A)`. The LMFDB `density` column is `Δ`: `E₈` has `π⁴/384 ≈ 0.25367`, `A₂` has
`π/√12 ≈ 0.90690`, the Leech lattice has `V₂₄ = π¹²/12! ≈ 0.0019296`. For E₈, radius √2/2 gives
π⁴/384, whereas radius 1 would give π⁴/24 > 1; the square root in ρ = √(min)/2 is essential.

**Hermite invariant and constant.** `γ(A) = min A / (det A)^{1/n}` for `n ≥ 1`; it is invariant
under similarity, and `δ(A) = (γ(A)/4)^{n/2}`. The LMFDB `hermite` column is `γ`. The Hermite
constant is `γₙ = sup {γ(A) | A : PosDefForm n}`, a real number by 1.8; it is *not* `γₙⁿ`, and the
classical table is quoted as `γₙⁿ = 1, 4/3, 2, 4, 8, 64/3, 64, 256` for `n = 1, …, 8`, and
`γ₂₄ = 4`.

**Covering.** The *inhomogeneous minimum* of `A` is
`μ(A) = sup_{x ∈ ℝⁿ} inf_{v ∈ ℤⁿ} √((x − v)ᵀ A (x − v))`, a length (the knowl
`lattice.covering_radius` is a length too). A *deep hole* is a point attaining it. The *covering
density* is `Θ(A) = Vₙ μ(A)ⁿ / √(det A) ≥ 1`. The *Voronoi cell* is
`𝒱(A) = {x ∈ ℝⁿ | ∀ v ∈ ℤⁿ, xᵀAx ≤ (x − v)ᵀA(x − v)}`, the cell of the origin; cells of other
lattice points are its translates.

**Perfection and eutaxy.** `A` is *perfect* when `{x xᵀ | x ∈ S(A)}` spans the space
`Sym_n(ℝ)` of real symmetric matrices (dimension `n(n+1)/2`); *eutactic* when
`A⁻¹ = ∑_{x ∈ S(A)} c_x · x xᵀ` for some coefficients `c_x > 0`; *strongly eutactic* when the
coefficients can be taken equal; *extreme* when `A` is a local maximum of `γ` on `PosDefForm n`
(Mathlib's `IsLocalMax γ A`). In the inner product `⟪·,·⟫_A` of `FormSpace A` the eutaxy identity
reads `⟪v, v⟫ = ∑ c_x ⟪v, x⟫²` for all `v`, which is the knowl's form; the matrix form is the one
stated in Lean.

**Well-rounded.** `A` is *well-rounded* when `S(A)` spans `ℝⁿ`; *generated by minimal vectors*
when `span_ℤ S(A) = ℤⁿ`; *strongly well-rounded* when `S(A)` contains a `ℤ`-basis of `ℤⁿ`.

**Spherical designs.** In a real inner product space `E` of dimension `n ≥ 1`, the polynomial
functions of degree `≤ t` are `Pol_t(E) = span_ℝ {x ↦ ⟪a, x⟫^k | a ∈ E, k ≤ t}`; for `E = ℝⁿ` this is
the space of polynomials in the coordinates of total degree `≤ t`. The normalized surface measure
on the sphere `S(r) = sphere 0 r`, for r ≥ 0, is `σ_r = (toSphere volume).map (· * r)` divided by its total
mass, where `toSphere` is Mathlib's `MeasureTheory.Measure.toSphere`; σ₀ is the point mass at zero. A finite nonempty
`X ⊆ S(r)` is a *spherical `t`-design* when `(1/#X) ∑_{x ∈ X} f x = ∫ f dσ_r` for every
`f ∈ Pol_t(E)`. A form `A` is a *`t`-design form* when `S(A) ⊂ FormSpace A` is a `t`-design on
`S(√(min A))`; it is *strongly perfect* when it is a `4`-design form.

**Universality.** A positive definite integral lattice `L` *represents* `m : ℕ` when
`L.representationNumber m ≠ 0`, that is, `B(x,x) = m` for some `x ∈ L`; it is *universal* when it
represents every `m ≥ 1`. For *even* `L` the *half-norm* representation uses `B(x,x)/2`, and
*half-norm universal* means every `m ≥ 1` is a half-norm. The 15 theorem is about universality,
the 290 theorem about half-norm universality; both are stated against Tau Ceti's
`representationNumber`. The *truant* of a non-universal `L` is the least `m ≥ 1` it does not
represent.

**Tensor products.** `L₁ ⊗ L₂` is the lattice on `L₁ ⊗_ℤ L₂` with
`B(v₁ ⊗ w₁, v₂ ⊗ w₂) = B₁(v₁, v₂) B₂(w₁, w₂)`, Mathlib's `LinearMap.BilinForm.tensorDistrib`
applied to the integral forms and rationalized by `ofIntegralForm`; its Gram matrix in a product
basis is the Kronecker product `G₁ ⊗ₖ G₂` (Mathlib's `Matrix.kronecker`). A *tensor decomposition*
has every factor of rank `≥ 2`. ⚠ The knowl `lattice.tensor_decomposition` omits this; without it
`L ≅ ⟨1⟩ ⊗ L` makes every lattice decomposable.

**Festi–Veniani index.** `D_L` is the discriminant form of `L`: the finite quadratic module
`(A_L, q_L)` when `L` is even and the finite bilinear module `(A_L, b_L)` when `L` is odd, both Tau
Ceti's. `O(D_L)` is its isometry group, and `φ_L : O(L) → O(D_L)` is the natural map through
`Isometry.discriminantGroupEquiv`. The Festi–Veniani index is `[O(D_L) : φ_L(O(L))]`. For a
nondegenerate `L` the group `O(D_L)` is finite, so the index is a positive integer.

**Rank zero.** Every definition is total. In rank zero `min = 0`, `S = ∅`, the kissing number is
`0`, `δ = Δ = 1`, `γ = 0` (the quotient `min / det^{1/0} = 0 / 1`; `γ₀ := 1` is set separately in
2.1), `μ = 0`, `𝒱 = {0}`, and `A` is perfect, eutactic and extreme vacuously; the
LMFDB has no rank-zero lattice. Positive definiteness is in the type of a form and is a hypothesis
`hL : L.IsPosDef` on the lattice side; nothing is stated for indefinite lattices.

## Exact supplier contracts

### From the supplier roadmaps

Every milestone rests on Mathlib at the pin, on Tau Ceti at the pin, on an earlier milestone of
this roadmap, or on a cited milestone of one of the following roadmaps.

- [Integral quadratic forms and lattices](../IntegralLattices/README.md) (IL): 2A finiteness of
  bounded-norm sets, 2B minimum, shells, kissing number and representation numbers, 2C the
  automorphism group `O(L)` and its finiteness, 2D the covolume identity, 2E Minkowski's and
  Hermite's bounds, 2F integral successive minima, 2G Minkowski reduction and class finiteness;
  1B–1D the dual, the discriminant group `A_L`, `b_L` and `q_L`; 1G finite quadratic modules; 6C–6G
  the `E₈` lattice, the rank-16 pair, the Niemeier reference lattices and `|O(E₈)|`; 9A/9B the
  stored-column certificates.
- [Completed integral lattices](../../Completed/IntegralLattices/README.md): the carrier
  `TauCeti.IntegralLattice`, isometries, orthogonal sums, scaling, duals, discriminant forms, the
  rank-one and ADE lattices (Layer 5).
- [Theta series](../ThetaSeries/README.md): Layer 1 Poisson summation for a full lattice in a real
  inner product space, 2D the real model `realModel` of a positive definite rational lattice and the
  bridge, 2G shells and representation numbers of the real model, 8B `r_{E₈}(2) = 240` and 8D
  `r_Λ(4) = 196560` as corollaries of theta identities.
- [Niemeier glue data and explicit Leech constructions](../Rank24LatticeConstructions/README.md):
  Layer 6, the Leech lattice `Λ₂₄` with minimum `4` and no roots.
- [Successive minima and Minkowski's theorems](../SuccessiveMinima/README.md): 1.1 the real
  successive minima `successiveMin L K i` of a convex body with respect to a lattice, 2.1.4 the lower half of Minkowski's second theorem. The upper half is consumed
  from GeometryOfNumbersAndQuadraticArithmetic §1.3; first-theorem uses below are the pinned
  Mathlib convex-body declarations. Real successive minima are consumed from this roadmap and from nowhere else.
- [Geometry of numbers, quadratic forms and homogeneous arithmetic](../GeometryOfNumbersAndQuadraticArithmetic/README.md)
  (GoN): 4.4.1 `latticePackingRadius` and 4.4.2 `latticeCoveringRadius` of a full Euclidean lattice,
  4.5.1 star bodies and 4.5.8 Mahler's compactness theorem, 5.1 LLL-reduced bases.
- [Orthogonal Tamagawa comparison and lattice masses](../OrthogonalTamagawaAndLatticeMass/README.md):
  §4, the finite automorphism-group certificates for `E₈`, the rank-16 pair and the rank-24
  lattices, and the mass and class-number columns.
- [Modular forms](../ModularForms/README.md): the level-one graded ring and the dimensions of
  `M_k(SL₂(ℤ))` and `S_k(SL₂(ℤ))`, consumed in Layer 5 through Tau Ceti's
  `TauCeti.ModularForm.mvPolynomialEquivModularForms` and Mathlib's level-one dimension formula.

### From Mathlib

| Declarations | File | Consumed by |
| --- | --- | --- |
| `Matrix.PosDef`, `Matrix.PosDef.det_pos`, `Matrix.PosDef.transpose`, `Matrix.posDef_iff_dotProduct_mulVec`, `Matrix.PosDef.inv` | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | 0.1, 0.2, 4.1 |
| `Matrix.GeneralLinearGroup`, `Matrix.det_mul`, `Int.isUnit_iff` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | 0.1 |
| `Matrix.vecMulVec`, `Matrix.trace` | `Mathlib/Data/Matrix/Mul.lean` | 4.1, 4.2 |
| `InnerProductSpace.ofCore`, `InnerProductSpace.Core` | `Mathlib/Analysis/InnerProductSpace/Defs.lean` | 0.3 |
| `IsZLattice`, `ZSpan.instIsZLatticeRealSpan`, `ZSpan.setFinite_inter`, `ZLattice.covolume`, `ZLattice.covolume_eq_det`, `ZLattice.covolume_comap` | `Mathlib/Algebra/Module/ZLattice/Basic.lean`, `Covolume.lean` | 0.3, 1.4, 1.5 |
| `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` (Minkowski's convex body theorem) | `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean` | 1.7 |
| `InnerProductSpace.volume_ball`, `EuclideanSpace.volume_ball`, `InnerProductSpace.volume_ball_of_dim_even` | `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean` | 1.5, 1.7, 3.4 |
| `MeasureTheory.Measure.toSphere`, `toSphere_apply_univ`, `measurePreserving_homeomorphUnitSphereProd` | `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean` | 5.1 |
| `Metric.infDist`, `Metric.infDist_le_dist_of_mem`, `IsCompact.exists_isMaxOn` | `Mathlib/Topology/MetricSpace/HausdorffDistance.lean`, `Mathlib/Topology/Order/Compact.lean` | 3.1, 3.2 |
| `IsLocalMax`, `IsLocalMaxOn` | `Mathlib/Topology/Order/LocalExtr.lean` | 4.3, 4.5 |
| `fderiv`, `HasFDerivAt` | `Mathlib/Analysis/Calculus/FDeriv/` | 4.5, 4.7 |
| `MvPolynomial`, `MvPolynomial.pderiv`, `MvPolynomial.totalDegree`, `MvPolynomial.restrictTotalDegree`, `MvPolynomial.eval` | `Mathlib/Algebra/MvPolynomial/PDeriv.lean`, `Mathlib/RingTheory/MvPolynomial/Basic.lean` | 5.1, 5.4 |
| `SchwartzMap.fourierTransformCLM` | `Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean` | 5.5 |
| `ModularForm`, `CuspForm`, `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `CuspForm.rank_eq_one_of_weight_eq_twelve`, `ModularForm.levelOne_odd_weight_eq_zero`, `discriminantEquiv` | `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean` | 5.6, 5.7 |
| `Nat.sum_four_squares` | `Mathlib/NumberTheory/SumFourSquares.lean` | 6.1, 9 (examples) |
| `TensorProduct`, `LinearMap.BilinForm.tensorDistrib`, `tensorDistrib_tmul`, `Basis.tensorProduct` | `Mathlib/LinearAlgebra/BilinearForm/TensorProduct.lean`, `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` | 7.1 |
| `Matrix.kronecker`, `Matrix.det_kronecker`, `Matrix.kroneckerMap` | `Mathlib/LinearAlgebra/Matrix/Kronecker.lean` | 7.1, 7.2 |
| `Subgroup.index`, `MonoidHom.range`, `AddAut` | `Mathlib/GroupTheory/Index.lean` | 7.5 |

Section 5.1 transports polynomial functions to inner product spaces; §5.4 consumes
GeometryOfNumbersAndQuadraticArithmetic §4.3 for harmonic theory. Mathlib's level-one
dimension formula gives `S_k(SL₂(ℤ)) = 0` for `k < 12` and `dim S₁₂ = 1`, and the general
`dim M_k` through `discriminantEquiv` and Tau Ceti's graded ring; Layer 5 uses exactly these.

### From Tau Ceti

| Declarations | Location | Consumed by |
| --- | --- | --- |
| `IntegralLattice`, `gramMatrix`, `determinant`, `discriminant`, `ofGramMatrix`, `ofGramMatrix.basis`, `Isometry.ofGramMatrixEq`, `IsPosDef`, `scale`, `orthogonalSum` | `TauCeti/LinearAlgebra/IntegralLattice/{Basic,Gram,Signature,Scaling,Orthogonal/Sum}.lean` | 0.2, 0.5, 7.1 |
| `norm`, `integralNorm`, `vectorsOfNorm`, `representationNumber`, `minimum`, `kissingNumber`, `IsPosDef.finite_vectorsOfNorm`, `IsPosSemidef.isLeast_minimum`, `IsPosDef.minimum_pos`, `TauCeti.IntegralLattice.kissingNumber_eq_representationNumber`, `Isometry.minimum_eq`, `Isometry.kissingNumber_eq` | `…/Norm.lean`, `…/PosDef/{Finite,RepresentationNumber,Minimum}.lean` | 1.2, 1.3, 6.1, 8.1 |
| `Isometry`, `Isometry L L` as a group, `Isometry.det`, `specialOrthogonalGroup`, `IsPosDef.finite_isometry`, `Isometry.dualCarrierEquiv`, `Isometry.discriminantGroupEquiv` | `…/Isometry/{Basic,Group}.lean`, `…/Dual/Basic.lean`, `…/Discriminant/Group.lean` | 7.5, 7.6 |
| realizations: `gram_comp_eq_map_gramMatrix`, `discreteTopology_range`, `covolume_range_sq_eq_determinant` | `…/PosDef/Covolume.lean` | 0.3, 1.5 |
| `dualCarrier`, `DiscriminantGroup`, `discriminantPairing`, `discriminantQuadraticMap` | `…/Dual/Basic.lean`, `…/Discriminant/{Group,Bilinear,Quadratic}.lean` | 7.5 |
| `FiniteBilinearModule.Isometry` and the finite quadratic modules of Completed IL Layer 3 | `TauCeti/LinearAlgebra/FiniteBilinearModule/` | 7.5 |
| `rankOne`, `typeARootLattice`, `checkerboardLattice`, `typeE₆RootLattice`, `typeE₇RootLattice`, `typeE₈RootLattice`, `d8PlusLattice` | `…/RankOne.lean`, `…/RootLattice/TypeA/Basic.lean`, `…/RootLattice/TypeD/Basic.lean`, `…/RootLattice/TypeE.lean`, `…/RootLattice/D8Plus/Basic.lean` | 4.10, worked examples |
| `TauCeti.ModularForm.mvPolynomialEquivModularForms`, the level-one graded ring | `TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.lean` | 5.6 |
| `TauCeti.IntegralLattice.successiveMinimum`, Minkowski's theorems, Hermite's inequality, Minkowski reduction, reduced-Gram bounds, class finiteness, `TauCeti.IntegralLattice.kissingNumber_typeE₈RootLattice` | IntegralLattices §§2E–2G and §6G, with intended homes under `TauCeti/LinearAlgebra/IntegralLattice/PosDef/{SuccessiveMinima,Minkowski,Hermite,Reduction,ReducedGram,Classes}.lean` and `…/RootLattice/TypeE/Roots.lean`; cited in prose only | 1.6, 2.3, 1.9, 4.9, 9 |

## How to read the build

Milestones are numbered `N.M` and may rest only on Mathlib, Tau Ceti at the pin, a cited supplier
milestone, or an earlier milestone of this roadmap. Each layer ends with its dependency table,
where **M** is Mathlib, **T** Tau Ceti at the pin, **T⁺** IntegralLattices §§2E–2G,
**IL**, **TS**, **SM**, **GoN**, **OT**, **R24** the roadmaps of *Exact supplier contracts*, and **L** this
roadmap.

`Suggested.lean` states the definitions and headline theorems that can be written over Mathlib and
the pinned Tau Ceti, each docstring naming its milestone. A milestone with no declaration there is
specified in this README only. The bundled tensor product of lattices (7.1) is specified
in prose; its form-side minimum theorem (7.2) is stated using the reindexed Kronecker
Gram matrix. The perfect-class counts (4.10) are stated on the similarity quotient.

## Layer 0: forms, lattices, and the dictionary

### 0.1 The form carrier and the similarity action

Define `PosDefForm n := {A : Matrix (Fin n) (Fin n) ℝ // A.PosDef}`, the evaluation `A[x]` and the
pairing `A[x, y]`, with `A[x] > 0` for `x ≠ 0`, `A[x] = 0 ↔ x = 0`, and the polarization identity.
Define the right action of `GL_n(ℤ)` by `U • A := Uᵀ A U` and prove it is a group action on
`PosDefForm n` (`Uᵀ A U` is again positive definite because `U` is invertible over `ℝ`), that
`(U • A)[x] = A[U x]`, and that `det (U • A) = det A` because `det U = ±1`. Define the similarity
relation `A ∼ B :↔ ∃ c > 0, ∃ U, B = c • (U • A)`, prove it is an equivalence relation, and prove
the two generators commute. Define the integral forms `A ∈ Sym_n(ℤ)` as the subtype whose entries
are integers, and *primitive* integral forms as those whose entries have gcd `1`; prove that a
positive-rank similarity class containing an integral form contains exactly one primitive integral form up to
`GL_n(ℤ)` (this is the knowl `lattice.similarity`'s last sentence).

API and acceptance statements:

- `eval`: The value `xᵀAx` of the form at a real vector.
- `pairing`: The pairing `xᵀAy`.
- `actGL`: The right action `A ↦ UᵀAU` of `GL_n(ℤ)` on forms.
- `smulPos`: The positive scaling `c • A` of a form, `c > 0`.
- `Similar`: Similarity: `B = c · UᵀAU` for some `c > 0` and `U ∈ GL_n(ℤ)`. The Hermite invariant and densities are similarity invariant; minima and radii scale.
- `IsIntegralForm`: An integral form is a form with integer entries; `primitive` adds that the entries have no common factor.

API:

- The right congruence action preserves determinant and positivity, and positive scaling commutes with it.
- Similarity is an equivalence relation; in positive rank an integral class has one primitive representative up to congruence.

**Checks.**

- For A = I₂, the identity fixes A; the shear U = [[1,1],[0,1]] gives [[1,1],[1,2]], determinant 1.
- For U = [[1,1],[0,1]] and V = Uᵀ, applying U then V gives [[5,3],[3,2]] = (UV)ᵀ(UV), whereas the reverse order gives [[2,3],[3,5]].
- In rank zero the gcd of the empty entries is 0, so primitive normalization is excluded; [4] normalizes to [1] in rank one.
- For A = [[2,1],[1,2]], A[e₁,e₂] = 1 and A[e₁+e₂] = 6 = 2+2+2·1;
  replacing the pairing by the diagonal part would give 0 and break polarization.
- The form [√2] is positive definite but not integral; [2] is integral but not primitive,
  and [1] is both. Scaling [2] by 3 gives [6], while scaling by 0 leaves the positive cone.
- Similarity identifies [2] and [6], whereas congruence in GL₁(ℤ) fixes [2];
  in rank two I₂ and A₂ are not similar because their kissing numbers are 4 and 6.

*Needs:* M `Matrix.PosDef`, `Matrix.GeneralLinearGroup`, `Matrix.det_mul`, `Int.isUnit_iff`.

### 0.2 The dictionary with Tau Ceti's lattices

For `L : IntegralLattice V` with `hL : L.IsPosDef` and a `ℤ`-basis `b : Basis (Fin n) ℤ L`, prove
that `L.gramMatrix b`, cast to `ℝ`, is in `PosDefForm n` (`gramForm hL b`); prove that two bases
give `GL_n(ℤ)`-equivalent forms (`gramForm hL b' = U • gramForm hL b` with `U = b.toMatrix b'`);
conversely for a symmetric integral `A` with `A.PosDef`, Tau Ceti's `ofGramMatrix` on the standard
basis of `ℚⁿ` is positive definite (`isPosDef_ofGramMatrix`), and its Gram matrix in
`ofGramMatrix.basis` is `A`. Prove that an `Isometry L M` carries a basis to a basis with the same
Gram matrix, and that `GL_n(ℤ)`-equivalent integral forms give isometric lattices (Tau Ceti's
`Isometry.ofGramMatrixEq`). Hence a function `f : PosDefForm n → X` constant on `GL_n(ℤ)`-orbits
descends to an isometry invariant `f_L` of positive definite lattices of rank `n`, defined as
`f (gramForm hL b)` for any `b` (descend). Every lattice-side invariant below is descend of its
form-side version, and the roadmap never defines an invariant twice.

API and acceptance statements:

- `gramForm_eq_actGL`: Two bases give `GL_n(ℤ)`-equivalent forms.

API:

- Changing the integral basis changes the Gram form by an integral unimodular congruence.
- Lattice isometries carry bases to bases with equal Gram matrices.

**Checks.**

- The lattice of Gram [2] evaluates its basis vector to 2; replacing the basis by its negative leaves [2].
- Changing the I₂ basis by the shear gives [[1,1],[1,2]], with determinant 1 on both sides.
- Gram [0] fails positive definiteness in rank one, whereas the empty Gram matrix is positive definite in rank zero.

*Needs:* T `gramMatrix`, `ofGramMatrix`, `Isometry.ofGramMatrixEq`, `IsPosDef`; L 0.1.

### 0.3 `FormSpace A` and the lattice `ℤⁿ`

Define `FormSpace A` as a type synonym of `Fin n → ℝ` with the inner product `⟪x, y⟫ = A[x, y]`
through `InnerProductSpace.ofCore`, and the lattice `stdLattice A : Submodule ℤ (FormSpace A)` as
the image of `ℤⁿ`. Prove `DiscreteTopology (stdLattice A)` and `IsZLattice ℝ (stdLattice A)` as
instances (Mathlib's `ZSpan` instances transport along the norm equivalence), `‖x‖² = A[x]`, and
`ZLattice.covolume (stdLattice A) = √(det A)` for the volume of the inner product (Tau Ceti's
`covolume_range_sq_eq_determinant` for integral `A`; the same Gram-determinant argument through
`ZLattice.covolume_eq_det` for real `A`). Prove that `U ∈ GL_n(ℤ)` induces a linear isometry
`FormSpace (U • A) ≃ₗᵢ[ℝ] FormSpace A` carrying `stdLattice` to `stdLattice`, that `c > 0` induces
a homothety scaling norms by `√c`, and that the block sum `A ⊕ B` gives
`FormSpace (A ⊕ B) ≃ₗᵢ FormSpace A × FormSpace B`.

API and acceptance statements:

- `intCast`: The integer vector `x : Fin n → ℤ` read in `ℝⁿ`.
- `toCoords`: The coordinates of a point of `FormSpace A`.
- `formSpaceAddCommGroup`: The additive group of the coordinate space.
- `formSpaceModule`: The real scalar action on the coordinate space.
- `formSpaceFiniteDimensional`: The coordinate space has finite real dimension n.
- `formCore`: The inner-product core of `FormSpace A`: the inner product is `xᵀAy`, and the axioms are the symmetry and positivity of `A`.
- `formSpaceNormedAddCommGroup`: The norm induced by the positive Gram form.
- `formSpaceInnerProductSpace`: The inner product induced by the Gram matrix.
- `formSpaceMeasurableSpace`: The Borel sigma algebra of the Gram metric.
- `formSpaceBorelSpace`: The chosen measurable structure is the Borel structure.
- `stdBasis`: The standard basis of `FormSpace A` (orthonormal only when `A = 1`).
- `stdLattice_eq_span`: `stdLattice A` is the `ℤ`-span of a real basis, so Mathlib's `ZSpan` instances apply to it.
- `stdLatticeDiscreteTopology`: The integral coordinate lattice is discrete.
- `stdLatticeIsZLattice`: The integral coordinate lattice spans the real space.
- `covolume_stdLattice`: `covolume (ℤⁿ ⊂ FormSpace A) = √(det A)`: the volume is that of the inner product `⟪·,·⟫_A` (`MeasureSpace` of a finite-dimensional inner product space).

**Checks.**

- For A = [4], the coordinate vector 1 has norm 2 and the fundamental interval has volume 2 = √det A.
- For A = I₂ the norm of (1,1) is √2; the sup norm 1 would be the wrong metric.
- In rank zero the lattice and space are singletons and the covolume is 1 = √det([]).

*Needs:* M `InnerProductSpace.ofCore`, `ZSpan.instIsZLatticeRealSpan`, `ZLattice.covolume_eq_det`; T `covolume_range_sq_eq_determinant`; L 0.1.

### 0.4 The real model of a rational lattice

For `hL : L.IsPosDef` and a basis `b`, construct the linear isometry
`FormSpace (gramForm hL b) ≃ₗᵢ[ℝ] TS.RealSpace L` carrying `stdLattice` onto `TS.realModel L`.
This is the only comparison between the two real models; afterwards every metric statement about
`L` is made in `FormSpace (gramForm hL b)` and is independent of `b` by 0.3. For t ≥ 0, prove the three
counts agree: `(stdLattice A ∩ sphere 0 √t)` is `TS.shell (realModel L) t` under the isometry, and
both are Tau Ceti's `vectorsOfNorm L t` in cardinality (TS 2G `ncard_vectorsOfNorm_ratModel`).

API:

- The comparison is a real linear isometry and carries the full integral lattice onto the real model.
- For nonnegative squared radius it identifies shells and preserves their cardinalities.

**Checks.**

- For [1] and t = −1 the squared-norm shell is empty; sphere 0 √t contains zero, so the sphere identification is excluded.
- For [1] and t = 0 both shells contain only zero and have cardinality 1.
- For [2] and t = 2 both shells consist of ±1 in the chosen basis and have cardinality 2.

*Needs:* TS 2D, 2G; T `vectorsOfNorm`; L 0.2, 0.3.

### 0.5 Basic API

Scaling: `(c • A)[x] = c · A[x]`, `det (c • A) = cⁿ det A`. Orthogonal sums (block diagonal):
`(A ⊕ B)[(x, y)] = A[x] + B[y]`, `det (A ⊕ B) = det A · det B`, and `U ⊕ U'` acts as `U` on the first
block and `U'` on the second. Dual form `A⁻¹`:
`A⁻¹ ∈ PosDefForm n`, `det A⁻¹ = (det A)⁻¹`, `(Uᵀ A U)⁻¹ = U⁻¹ A⁻¹ U⁻ᵀ`, equivalently `(U • A)⁻¹ = U⁻ᵀ • A⁻¹`.
The map x ↦ Ax is an isometry from the dual lattice in FormSpace A onto stdLattice A⁻¹;
its inverse is y ↦ A⁻¹y (TS 2A).

API:

- Positive scaling multiplies the quadratic value by c and the determinant by cⁿ.
- Block sums add quadratic values and multiply determinants; inversion uses the contragredient action.

**Checks.**

- For A = I₂ and U = [[1,1],[0,1]], both sides of the inverse formula are [[2,−1],[−1,1]]; using U⁻¹ as the right-action matrix gives [[1,−1],[−1,2]].
- For A = [4], the dual generator 1/4 maps under A to 1 in FormSpace [1/4]; both have squared norm 1/4.
- The orthogonal sum [2] ⊕ [3] has determinant 6 and evaluates (1,1) to 5; scaling [2] by 3 gives determinant 6.
- I₂ is self-dual and has determinant 1; diag(1,4) has dual diag(1,1/4),
  determinant 1/4 and double dual diag(1,4). The empty block sum with [3] is [3].

*Needs:* M `Matrix.PosDef.inv`; TS 2A; L 0.1, 0.3.

### Examples

The local Checks above and the worked examples below fix the normalizations used in this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 0.1 | M `Matrix.PosDef`, `Matrix.GeneralLinearGroup`, `Matrix.det_mul`, `Int.isUnit_iff` |
| 0.2 | T `gramMatrix`, `ofGramMatrix`, `Isometry.ofGramMatrixEq`, `IsPosDef`; L 0.1 |
| 0.3 | M `InnerProductSpace.ofCore`, `ZSpan.instIsZLatticeRealSpan`, `ZLattice.covolume_eq_det`; T `covolume_range_sq_eq_determinant`; L 0.1 |
| 0.4 | TS 2D, 2G; T `vectorsOfNorm`; L 0.2, 0.3 |
| 0.5 | M `Matrix.PosDef.inv`; TS 2A; L 0.1, 0.3 |

## Layer 1: minimum, minimal vectors, kissing number, and density

### 1.1 The minimum and the minimal vectors of a form

Define `min A := sInf {A[x] | x ∈ ℤⁿ, x ≠ 0}` (`sInf ∅ = 0` in rank `0`) and
`S(A) := {x : Fin n → ℤ | x ≠ 0 ∧ A[x] = min A}`. Prove, for `n ≥ 1`: the set
`{x ∈ ℤⁿ | A[x] ≤ C}` is finite for every `C` (for C < 0 it is empty; for C ≥ 0 it identifies with
`stdLattice A ∩ closedBall 0 √C`, finite by `ZSpan.setFinite_inter` through 0.3), so the infimum is attained, `min A > 0`, `S(A)` is finite,
nonempty and closed under negation, and `A[x] ≥ min A` for all `x ≠ 0`. Prove `GL_n(ℤ)`-invariance
`min (U • A) = min A`, `S(U • A) = U⁻¹ S(A)`, the scaling law `min (c • A) = c · min A`,
`S(c • A) = S(A)`, and the orthogonal-sum law (0.5): `min (A ⊕ B) = min (min A) (min B)` and
`S(A ⊕ B) = S(A) × {0} ∪ {0} × S(B)` when `min A = min B`, one side when they differ (rank `≥ 1`
on both sides). Define the kissing number
`kiss A := #S(A)` and `S⁺(A)`, prove `#S(A) = 2 #S⁺(A)`, and record that `S⁺` is not
`GL_n(ℤ)`-equivariant. Define IsWellRounded A
(`span_ℝ S(A) = ⊤`), IsGeneratedByMinimalVectors A (`span_ℤ S(A) = ⊤`), and
IsStronglyWellRounded A (some `ℤ`-basis of `ℤⁿ` lies in `S(A)`), prove the implications strongly
well-rounded ⇒ generated by minimal vectors ⇒ well-rounded, and prove the three are
`GL_n(ℤ)`- and scaling-invariant.

API and acceptance statements:

- `minimalVectors`: The minimal vectors `S(A)`.
- `finite_setOf_eval_le`: Sets of bounded norm in `ℤⁿ` are finite (`ZSpan.setFinite_inter` through 0.3).
- `finite_minimalVectors`: The shortest-vector shell of a positive definite form is finite.

API:

- The minimal vectors are finite, invariant under negation, and nonempty in positive rank.
- Strong roundedness implies integral generation, which implies real spanning; all three predicates are invariant under similarity.

**Checks.**

- For diag(1,4), the minimum is 1, S = {±e₁} and the kissing number is 2; its span has dimension 1, so it is not well-rounded.
- For I₂, the minimum is 1 and S = {±e₁,±e₂}; the two basis vectors show all three roundedness conditions.
- In rank zero min = 0 and S is empty. For [1], sublevel C = −1 is empty, C = 0 is {0}, and C = 1 is {−1,0,1}.

*Needs:* M `ZSpan.setFinite_inter`, `Nat.sInf_mem`; L 0.1, 0.3, 0.5.

### 1.2 Identification with Tau Ceti's minimum and kissing number

For `hL : L.IsPosDef` and a basis `b`, prove `(L.minimum : ℝ) = min (gramForm hL b)`,
`L.kissingNumber = kiss (gramForm hL b)`, and that `b.repr` carries
`L.vectorsOfNorm L.minimum \ {0}` bijectively onto `S(gramForm hL b)`. For n > 0 prove
`min (gramForm hL b) = (SM.successiveMin (stdLattice A) (closedBall 0 1) 0)²`: the first real
successive minimum of the unit ball is the least length, and the minimum here is its square.
Afterwards the LMFDB `minimum` and `kissing` columns are Tau Ceti's `minimum` and `kissingNumber`
*by definition*, and every form-side theorem about them transports.

API and acceptance statements:

- `minimum_eq_min`: Tau Ceti's `minimum` **is** the form-side minimum of any Gram matrix: the LMFDB `minimum` column is `TauCeti.IntegralLattice.minimum`.
- `kissingNumber_eq_kissingNumber`: Tau Ceti's `kissingNumber` is the form-side kissing number.

**Checks.**

- For Gram [2], native and form minima are 2 and both kissing numbers are 2.
- For Gram diag(1,4), the real successive lengths are 1 and 2, whose squares are 1 and 4.
- In rank zero both minima and kissing numbers are 0; no first successive-minimum index exists.

*Needs:* T `minimum`, `kissingNumber`, `vectorsOfNorm`, `IsPosSemidef.isLeast_minimum`; SM 1.1; L 0.2, 0.3, 1.1.

### 1.3 Normalized minimal vectors

Define IsNormalized x for `x : Fin n → ℤ` (the first nonzero coordinate is positive), prove that
exactly one of `x`, `−x` is normalized for `x ≠ 0`, that `S⁺(A) = {x ∈ S(A) | IsNormalized x}`, and
that `S⁺(A)` is a finite set of cardinality `kiss A / 2`. This is the content of the LMFDB
`shortest` column for the stored Gram matrix; the ordering of the stored list is not a target.

API:

- Every nonzero vector has exactly one normalized sign.
- The normalized half has half the cardinality of the minimal shell; it depends on the chosen coordinates.

**Checks.**

- The vector (0,1) is normalized and (0,−1) is not.
- The zero vector is not normalized, so it cannot enter the normalized half.
- For I₂ the normalized half is {e₁,e₂}, of size 2, while the full minimal shell has size 4.

*Needs:* L 1.1.

### 1.4 Packing radius, center density, density

Define `packingRadius A := √(min A) / 2`, `centerDensity A := packingRadius Aⁿ / √(det A)` and
`density A := Vₙ · centerDensity A` with `Vₙ := π^{n/2} / Γ(n/2 + 1)`. Prove: `Vₙ` is the volume of
the unit ball of any `n`-dimensional real inner product space (`InnerProductSpace.volume_ball`),
with `V₁ = 2`, `V₂ = π`, `V₃ = 4π/3`, `V₄ = π²/2`, `V₈ = π⁴/24`, `V₂₄ = π¹²/12!`; both densities
are similarity invariants. For n > 0, prove that the open balls of radius
`packingRadius A` about the points of `stdLattice A` are pairwise disjoint and fill the fraction
`density A` of a fundamental domain `F`: `volume (⋃_v ball v ρ ∩ F) / volume F = density A`. Prove
`packingRadius A = GoN.latticePackingRadius (stdLattice A)` (GoN 4.4.1) and
`0 < density A ≤ 1`, the upper bound by the disjointness and the fundamental-domain computation.

API and acceptance statements:

- `unitBallVolume`: `Vₙ = √πⁿ / Γ(n/2 + 1)`, the volume of the unit ball in dimension `n`, in the form Mathlib's `EuclideanSpace.volume_ball` produces.
- `density_le_one`: The packing balls are disjoint, so the density is at most one.

API:

- The packing radius scales by √c, while both densities are similarity invariant.
- In positive rank the disjoint packing balls occupy the stated fraction of a fundamental domain.

**Checks.**

- For [4], the packing radius is 1, center density 1/2 and density 1.
- For I₂, the radius is 1/2 and density π/4; multiplying the Gram matrix by 4 doubles the radius and keeps density π/4.
- In rank zero radius = 0 and the open-ball union is empty, of volume 0, while the total density definition gives 1; the volume interpretation requires positive rank.

*Needs:* M `InnerProductSpace.volume_ball`, `ZLattice.covolume`, `IsAddFundamentalDomain`; GoN 4.4.1; L 0.3, 1.1.

### 1.5 The covolume and the Hermite invariant

Define `hermite A := min A / (det A)^{1/n}` (`Real.rpow`), prove its similarity invariance and
`centerDensity A = (hermite A / 4)^{n/2}`, `density A = Vₙ (hermite A / 4)^{n/2}`, so that maximizing
any of `γ`, `δ`, `Δ` over forms of a fixed rank is the same problem. Define the Bergé–Martinet
invariant `γ'(A) := √(hermite A · hermite A⁻¹)`, a similarity invariant with `γ'(A) ≤ γₙ` once 2.1
defines `γₙ`; its own extremal theory is not a milestone here. Prove the lattice-side `hermite_L = L.minimum / (L.determinant)^{1/n}` by descend.

API:

- The Hermite invariant is similarity invariant and relates center density by the power n/2.
- The Bergé–Martinet invariant is unchanged by duality and bounded by the Hermite constant.

**Checks.**

- For diag(1,4), γ = 1/2, δ = 1/8 and Δ = π/8; (γ/4)¹ = 1/8.
- For [4], γ = 1 and δ = 1/2; (1/4)^(1/2) = 1/2.
- For I₂ both γ and its dual value are 1, so the Bergé–Martinet invariant is 1; scaling by 4 preserves all three.
- For diag(1,1,4), γ = 4^(−1/3) and γ of the dual is 4^(−2/3); γ′ = 1/2, excluding a constant-one invariant.
- A₂ and its dual have γ = 2/√3, so γ′ = 2/√3 > 1.

*Needs:* M `Real.rpow`; L 0.2, 1.4.

### 1.6 Comparison with the integral theory

Record that `T⁺`'s Hermite and Minkowski bounds for `L.minimum` are the integral cases of 1.7
and 1.8, and that `successiveMinimum L 0 = L.minimum`. No declaration here restates them; 1.7 and
1.8 are the real-form versions those modules do not cover.

**Checks.**

- For Gram [4], the native minimum is 4 and the real first length is 2.
- For diag(1,4), the native successive minima are 1,4, rather than the lengths 1,2.
- For A₂, minimum = 2 and determinant = 3, so the integral and real Hermite invariants both equal 2/√3.

*Needs:* T⁺ `PosDef.Hermite`, `PosDef.Minkowski`, `PosDef.SuccessiveMinima`; L 1.2.

### 1.7 Minkowski's bound for real forms

Prove `min A ≤ (4/π) Γ(n/2+1)^{2/n} (det A)^{1/n}`, equivalently `(min A)^{n/2} Vₙ ≤ 2ⁿ √(det A)`, by
Minkowski's convex body theorem applied to the ball of radius `√(min A)` in `FormSpace A`: an open
ball of volume `> 2ⁿ covolume` contains a nonzero lattice point, and the open ball of radius
`√(min A)` contains none. Deduce `hermite A ≤ (4/π) Γ(n/2+1)^{2/n}` and `density A ≤ 1` again.

API and acceptance statements:

- `hermite_le_minkowski`: Minkowski's bound for real forms: `min A ≤ (4/π) Γ(n/2+1)^{2/n} (det A)^{1/n}`, from Mathlib's convex body theorem applied to the ball of radius `√(min A)` in `FormSpace A`.

**Checks.**

- For [4], (min A)^(n/2) Vₙ = 2·2 = 4 and 2ⁿ√det A = 4; using exponent n gives the false 8 ≤ 4.
- For I₂ the two sides are π and 4, so the bound is strict.
- Rank zero has min = 0 and γ₀ = 1 by convention; the positive-rank formula is not used at n = 0.

*Needs:* M `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `InnerProductSpace.volume_ball`; L 0.3, 1.1, 1.4, 1.5.

### 1.8 Hermite's inequality for real forms

Prove `min A ≤ (4/3)^{(n−1)/2} (det A)^{1/n}` for `n ≥ 1` by Hermite's induction on `n`, following
`T⁺`'s `TauCeti.LinearAlgebra.BilinearForm.Hermite` with the integrality dropped: a minimal vector
is primitive, extends to a basis, and the form induced on the orthogonal projection has
determinant `det A / min A` and minimum `≥ (3/4) min A`. Hence `hermite A ≤ (4/3)^{(n−1)/2}`, and
`sup_A hermite A` is finite. Prove equality for `A₂ = [[2,1],[1,2]]`: `hermite A₂ = 2/√3`.

API and acceptance statements:

- `hermite_le_pow`: Hermite's inequality for real forms: `γ(A) ≤ (4/3)^{(n−1)/2}`.

**Checks.**

- For [4], γ = 1 and the upper bound is 1.
- For A₂, γ = 2/√3 equals (4/3)^(1/2).
- For I₂, γ = 1 < 2/√3, so equality does not hold for every form.

*Needs:* M `Int.exists_two_mul_abs_sub_mul_le`, Schur complements `Matrix.det_fromBlocks₁₁`; L 0.1, 1.1, 1.5.

### 1.9 Minkowski reduction for real forms

Define `IsMinkowskiReduced A` for a form (the standard basis `e₁, …, eₙ` satisfies: `A[eᵢ] ≤ A[x]`
for every `x ∈ ℤⁿ` such that `e₁, …, e_{i−1}, x` extends to a basis), prove every `GL_n(ℤ)`-orbit
contains a reduced form (greedy choice, each step a minimum over a set made finite by 1.1), the
inequalities `A₁₁ ≤ A₂₂ ≤ ⋯`, `2|Aᵢⱼ| ≤ Aᵢᵢ`, the comparison `λᵢ² ≤ Aᵢᵢ ≤ (i!)² λᵢ²` with the real
successive minima `λᵢ` of the unit ball (SM 1.1; they are lengths, so they enter squared) and the
bound `∏ Aᵢᵢ ≤ (∏ i!)² cₙⁿ det A` (GoN §1.3, Minkowski upper inequality). The integral case is
`T⁺`'s `PosDef.Reduction`/`PosDef.ReducedGram` (Schürmann, Ch. 2), with the same proofs. Deduce the **coordinate bound**: for reduced
`A` and `x ∈ S(A)`, `|xᵢ| ≤ Cₙ` with an explicit `Cₙ` (induction from the top coordinate through the
Gram–Schmidt coefficients, which are bounded by `(∏ i!)² cₙⁿ`), and that the reduced forms with
`det A = 1` and min A ≥ η, for a fixed η > 0, form a compact set. Their
GLₙ(ℤ)-saturation is precisely that same determinant-one minimum lower-bound restriction.
Without η > 0 the reduced family diag(1/t,t), t ≥ 1, is unbounded.

API:

- Every congruence orbit has a Minkowski-reduced representative.
- Reduced diagonal and coordinate bounds control shortest vectors; compactness at determinant one requires a positive minimum bound.

**Checks.**

- The family diag(1/t,t), t ≥ 1, is reduced with determinant 1 and minimum 1/t; min ≥ η restricts t to at most 1/η.
- For η = 1/4, t = 4 passes and t = 5 fails; without η, the second diagonal entry is unbounded.
- For [a], a > 0, the unique reduced diagonal has determinant and minimum a; at determinant one it is [1].

*Needs:* SM 1.1; GoN 1.3; T⁺ `PosDef.Reduction`, `PosDef.ReducedGram` (as the integral case, prose); L 0.1, 1.1.

### Examples

The local Checks above and the worked examples below fix the normalizations used in this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 1.1 | M `ZSpan.setFinite_inter`, `Nat.sInf_mem`; L 0.1, 0.3, 0.5 |
| 1.2 | T `minimum`, `kissingNumber`, `vectorsOfNorm`, `IsPosSemidef.isLeast_minimum`; SM 1.1; L 0.2, 0.3, 1.1 |
| 1.3 | L 1.1 |
| 1.4 | M `InnerProductSpace.volume_ball`, `ZLattice.covolume`, `IsAddFundamentalDomain`; GoN 4.4.1; L 0.3, 1.1 |
| 1.5 | M `Real.rpow`; L 0.2, 1.4 |
| 1.6 | T⁺ `PosDef.Hermite`, `PosDef.Minkowski`, `PosDef.SuccessiveMinima`; L 1.2 |
| 1.7 | M `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `InnerProductSpace.volume_ball`; L 0.3, 1.1, 1.4, 1.5 |
| 1.8 | M `Int.exists_two_mul_abs_sub_mul_le`, Schur complements `Matrix.det_fromBlocks₁₁`; L 0.1, 1.1, 1.5 |
| 1.9 | SM 1.1; GoN 1.3; T⁺ `PosDef.Reduction`, `PosDef.ReducedGram` (as the integral case, prose); L 0.1, 1.1 |

## Layer 2: the Hermite constant

### 2.1 Definition, finiteness, monotonicity

Define `hermiteConstant n := sSup (Set.range (hermite : PosDefForm n → ℝ))` for `n ≥ 1`, and
`hermiteConstant 0 := 1`. Prove the range is bounded above by `(4/3)^{(n−1)/2}` (1.8) and contains
`1` (the value at `ℤⁿ`), so `1 ≤ γₙ ≤ (4/3)^{(n−1)/2}` and also `γₙ ≤ (4/π) Γ(n/2+1)^{2/n}` (1.7). Prove
Mordell's inequality `γₙ^{n−2} ≤ γ_{n−1}^{n−1}` for `n ≥ 2` (the form induced on the dual's
projection; Martinet, Ch. 2, §2.3) and the dual relation `γ(A) γ(A⁻¹) ≤ γₙ²`. Define the *critical*
forms as those with `hermite A = γₙ`.

API and acceptance statements:

- `hermiteConstant_pow_le`: Mordell's inequality `γₙ^{n−2} ≤ γ_{n−1}^{n−1}`.

API:

- The Hermite range is nonempty, positive in positive rank and bounded above.
- The identity form gives a value 1 in the range; the Hermite constant bounds every form.

**Checks.**

- For I₂, γ = 1 belongs to the range, whereas diag(1,4) gives 1/2; the lower bound 1 is on the supremum.
- For diag(1,t²), t ≥ 1, γ = 1/t tends to 0; the range has no positive lower bound in rank two.
- At n = 2 Mordell gives γ₂⁰ = 1 = γ₁¹; at n = 3 it gives γ₃ = 2^(1/3) ≤ γ₂² = 4/3.
- The critical-form predicate accepts A₂ since γ(A₂) = γ₂ = 2/√3 and every [a], a > 0,
  since γ([a]) = γ₁ = 1. It rejects I₂ since 1 < 2/√3.

*Needs:* M `sSup`, `Real.rpow`; L 0.5, 1.5, 1.7, 1.8.

### 2.2 Attainment

Prove that `γₙ` is attained. For n ≥ 2 choose 0 < ε < γₙ, so η = γₙ − ε > 0.
The forms with det A = 1 and min A ≥ η have a compact set of reduced representatives.
Transport their lattices isometrically into one fixed Euclidean space and apply GoN §4.5.8
on SLₙ(ℝ)/SLₙ(ℤ), with shortest length at least √η; use the reduced-Gram bounds of 1.9 to lift
compactness to representatives. Rank one has the unique determinant-one form [1], so a maximizing sequence has a convergent
subsequence after reduction and `min` is continuous on `PosDefForm n`. State separately the two
continuity facts used: `min` is continuous on `PosDefForm n`, and `det` is. Prove that a critical
form is extreme in the sense of 4.3 (a global maximum is a local one).

API and acceptance statements:

- `exists_hermite_eq_hermiteConstant`: The constant is attained: there is a critical form (Mahler compactness, GoN 4.5.8).

**Checks.**

- In rank one the determinant-one representative is [1], whose γ is 1.
- For n = 2 and η = 1/4, diag(1/t,t) is allowed only for 1 ≤ t ≤ 4.
- Choosing ε = γₙ gives η = 0 and admits the unbounded diagonal family, so ε < γₙ is essential.

*Needs:* GoN 4.5.1, 4.5.8; M `IsCompact.exists_isMaxOn`; L 0.3, 1.1, 2.1.

### 2.3 The values in ranks one, two and three

Prove `γ₁ = 1` (every form is `(a)`, `min = a = det`). Prove `γ₂ = (4/3)^{1/2}`: Hermite's bound
(1.8) gives `≤`, and `A₂` gives `≥`. Prove `γ₃ = 2^{1/3}` by Gauss's reduction argument: a
Minkowski-reduced ternary form `[[a,·,·],[·,b,·],[·,·,c]]` with `a ≤ b ≤ c`, `2|a_{ij}| ≤ a_{ii}`,
satisfies `det ≥ abc/2`, so `min³ = a³ ≤ abc ≤ 2 det`, with equality for
`A₃ = [[2,1,0],[1,2,1],[0,1,2]]` of determinant `4` and minimum `2`. Minkowski reduction for real
forms in rank `3` is proved inside this milestone (existence by the finiteness of 1.1, one index at
a time); the general real reduction theory is 1.9. Record that the critical forms are `ℤ`, `A₂`,
`A₃` up to similarity in these ranks, with uniqueness in ranks `1` and `2` proved here and
uniqueness in rank `3` proved in 4.10 from the perfect-form enumeration.

API and acceptance statements:

- `hermiteConstant_two_sq`: `γ₂² = 4/3`, attained by `A₂`.
- `hermiteConstant_three_pow`: `γ₃³ = 2`, attained by `A₃` (Gauss).

**Checks.**

- The rank-one value is a/a = 1 for [a], a > 0.
- For A₂, γ² = 2²/3 = 4/3.
- For A₃, γ³ = 2³/4 = 2; for I₃ it is 1 < 2.

*Needs:* L 1.1, 1.8, 2.1.

### Examples

The local Checks above and the worked examples below fix the normalizations used in this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 2.1 | M `sSup`, `Real.rpow`; L 0.5, 1.5, 1.7, 1.8 |
| 2.2 | GoN 4.5.1, 4.5.8; M `IsCompact.exists_isMaxOn`; L 0.3, 1.1, 2.1 |
| 2.3 | L 1.1, 1.8, 2.1 |

## Layer 3: Voronoi cells and covering

### 3.1 The Voronoi cell

Define `voronoiCell A := {x : Fin n → ℝ | ∀ v : Fin n → ℤ, A[x] ≤ A[x − v]}`. Prove it is a
compact convex polytope containing `0` in its interior, symmetric under `−1`, that its translates
by `ℤⁿ` cover `ℝⁿ` and overlap only in their boundaries, so it is a fundamental domain with
`volume (voronoiCell A) = √(det A)` (in `FormSpace A`); that `voronoiCell (U • A) = U⁻¹ voronoiCell A`
and `voronoiCell (c • A) = voronoiCell A`. Define the *Voronoi-relevant* vectors as the `v ∈ ℤⁿ ∖ 0`
for which `{x | A[x] = A[x − v]} ∩ voronoiCell A` has dimension `n − 1`, prove they are finite,
contain `S(A)`, and that `v` is relevant exactly when `±v` are the only shortest vectors of the
coset `v + 2ℤⁿ` (Voronoi's criterion; Conway–Sloane, Ch. 21, §3). Hence the cell is the
intersection of the finitely many half-spaces `A[x] ≤ A[x − v]` over relevant `v`.

API and acceptance statements:

- `isCompact_voronoiCell`: The closed Voronoi cell of a full lattice is compact.
- `isAddFundamentalDomain_voronoiCell`: The Voronoi cell is a fundamental domain for `ℤⁿ` in `FormSpace A`.

API:

- The Voronoi cell is closed and convex, and its lattice translates cover the space with measure-zero overlaps.
- A nonzero vector is Voronoi-relevant precisely when it and its negative are the only shortest vectors in its coset modulo twice the lattice.

**Checks.**

- For [4], the Voronoi interval in coordinates is [−1/2,1/2] and has metric volume 2.
- For I₂ the cell is the square [−1/2,1/2]² of volume 1.
- The cell is closed, so the boundary point 1/2 in rank one belongs to two translated cells; these overlaps have measure zero.
- In ℤ², e₁ is relevant: ±e₁ are the only minimum-norm vectors of its parity coset,
  and its bisector cuts out the edge x₁ = 1/2. The vector (1,1) is not relevant:
  its parity coset has four shortest vectors (±1,±1), and its bisector meets the square only at one vertex.
- For A₂, e₁−e₂ is relevant: its parity coset has exactly ±(e₁−e₂) of norm 2,
  while ±(e₁+e₂) have norm 6. This distinguishes the relevant set from the coordinate vectors alone.

*Needs:* M `Convex`, `IsCompact`, `IsAddFundamentalDomain`, `ZLattice.covolume`; L 0.3, 1.1.

### 3.2 The inhomogeneous minimum, deep holes

Define `coveringRadius A := sSup {Metric.infDist x (stdLattice A) | x : FormSpace A}`; prove the
supremum is attained on `voronoiCell A`, at a vertex of the cell, so
`coveringRadius A = max_{x ∈ vertices} √(A[x])`, and that it is positive in rank `≥ 1`. Define
`IsDeepHole A x :↔ Metric.infDist x (stdLattice A) = coveringRadius A`, prove deep holes exist
and are vertices of Voronoi cells, and that `packingRadius A ≤ coveringRadius A`, with equality exactly in
rank `1` when n > 0 (in rank `≥ 2` the packing balls have density `< 1` by 1.4 and 1.7, so they do not cover). Prove `coveringRadius (c • A) = √c · coveringRadius A` and `GL_n(ℤ)`-invariance. Define
`coveringDensity A := Vₙ coveringRadius Aⁿ / √(det A)` and prove `coveringDensity A ≥ 1` (the
closed balls of radius `μ` cover a fundamental domain).

API and acceptance statements:

- `exists_isDeepHole`: Distance to a full lattice attains its maximum.
- `IsDeepHole.exists_sub_mem_extremePoints`: A deep hole is, up to a lattice translation, a vertex (extreme point) of the Voronoi cell; the covering radius is the largest `√(A[x])` over those vertices.
- `one_le_coveringDensity`: Covering by the balls of covering radius forces covering density at least one.

API:

- The covering radius is attained, invariant under unimodular congruence and multiplied by √c under scaling.
- Deep holes occur at vertices up to translation; the covering density is at least one.

**Checks.**

- For [4], covering and packing radii are both 1; deep holes have coordinates 1/2 modulo ℤ.
- For I₂, covering radius = √2/2 > 1/2 and covering density = π/2.
- In rank zero both radii are 0; this is excluded from the equality-if-and-only-if-rank-one assertion.

*Needs:* M `Metric.infDist`, `IsCompact.exists_isMaxOn`, `InnerProductSpace.volume_ball`; L 1.4, 3.1.

### 3.3 Identification with GoN

Prove `coveringRadius A = GoN.latticeCoveringRadius (stdLattice A)` (GoN 4.4.2) and record that
GoN's attainment lemma is 3.2's attainment read in the real model. Prove Jarník's inequalities
`λₙ/2 ≤ coveringRadius A ≤ (∑ᵢ λᵢ)/2 ≤ n λₙ/2` with `λᵢ = SM.successiveMin (stdLattice A)
(closedBall 0 1) i` (Gruber–Lekkerkerker, Ch. 2, §13; the knowl `lattice.covering_radius`
states them). For the upper bound, choose real-linearly independent lattice vectors of lengths λᵢ
(SuccessiveMinima §1.5). Their integral span has finite index in the full lattice. Rounding
the coordinates in this smaller lattice gives distance at most (∑ᵢ λᵢ)/2, hence also bounds
the distance to the full lattice; no integral basis attaining every minimum is required.

**Checks.**

- For diag(1,4), λ₁ = 1 and λ₂ = 2; the bounds give 1 ≤ √5/2 ≤ 3/2 ≤ 2.
- For [4], both Jarník bounds are 2/2 = 1, equal to the covering radius.
- For I₂, rounding in the sublattice generated by (1,1),(1,−1) gives bound √2; it still bounds √2/2 for the full lattice although the sublattice has index 2.

*Needs:* GoN 4.4.2; SM 1.1, 1.5; L 3.2.

### 3.4 Covering values and the covering constant

Prove the covering radii of the coordinate examples of 9 (`ℤⁿ`: `√n/2`; `A₂`: `√(2/3)`; `A₃`,
`D₄`, `E₈` with minimum `2`: `1`; `Λ₂₄` with minimum `4`: `√2`, the last by citing
Conway–Parker–Sloane, Conway–Sloane Ch. 23, as a theorem whose proof is the classification of the
deep holes. This subsection owns that geometric classification: prove that, up to
lattice translations and lattice isometries, the Voronoi vertices are the finitely many
Conway–Parker–Sloane hole types in Chapter 23, with every squared radius at most 2 and
at least one equal to 2. Completeness of those types and their distance formulas supply
the upper and lower covering bounds). Define the lattice covering constant
`Θₙ := sInf {coveringDensity A | A}` and prove `Θₙ ≥ 1`; its values are excluded (see *Explicit
scope exclusions*).

**Checks.**

- For I₃ the radius is √3/2 and covering density π√3/2.
- For A₂ the squared covering radius is 2/3 and covering density 2π/√27.
- For the Leech lattice squared covering radius is 2 and determinant 1, giving covering density 2¹²π¹²/12!.
- The covering-density range in rank one is {1}, so its infimum is 1; in rank zero
  the total convention also gives the range {1}. In rank two A₂ contributes
  2π/√27, so 1 ≤ Θ₂ ≤ 2π/√27; no equality with the value of I₂, π/2, follows.

*Needs:* L 1.4, 3.2; R24 Layer 6 for `Λ₂₄`.

### Examples

The local Checks above and the worked examples below fix the normalizations used in this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 3.1 | M `Convex`, `IsCompact`, `IsAddFundamentalDomain`, `ZLattice.covolume`; L 0.3, 1.1 |
| 3.2 | M `Metric.infDist`, `IsCompact.exists_isMaxOn`, `InnerProductSpace.volume_ball`; L 1.4, 3.1 |
| 3.3 | GoN 4.4.2; SM 1.1, 1.5; L 3.2 |
| 3.4 | L 1.4, 3.2; R24 Layer 6 for `Λ₂₄` |

## Layer 4: perfect, eutactic and extreme forms

### 4.1 Perfection

Define `IsPerfect A :↔ Submodule.span ℝ {vecMulVec x x | x ∈ S(A)} = ⊤` in the space `Sym_n(ℝ)` of
symmetric matrices (the submodule `{M | Mᵀ = M}` of `Matrix (Fin n) (Fin n) ℝ`, of dimension
`n(n+1)/2`). Prove: perfection is a similarity invariant; a perfect form is well-rounded; a perfect
form is **determined by its minimal vectors**: if `IsPerfect A`, `min A = min B` and `S(A) ⊆ S(B)`
then `A = B` (the linear system `B[x] = min` for `x ∈ S(A)` has the unique solution `A`); the
Korkine–Zolotarev bound `kiss A ≥ n(n+1)` for perfect `A` (at least `n(n+1)/2` pairs); and
**rationality**: a perfect form with `min A = 1` has rational entries (the unique solution of a
linear system with integer coefficients), so every positive-rank perfect form is similar to a primitive
integral form (0.1; Dutour Sikirić–Schürmann–Vallentin, arXiv:math/0609388v3, §1, p.2). For n > 0, prove `ℤⁿ` is perfect iff `n = 1` and that `A₂`, `A₃`, `D₄`, `E₈` are
perfect by exhibiting `n(n+1)/2` independent `x xᵀ`.

API and acceptance statements:

- `rankOneMatrix`: The rank-one matrix `x xᵀ` of an integer vector, over `ℝ`.
- `IsPerfect.eq_of_minimalVectors_subset`: A perfect form is determined by its minimal vectors.
- `IsPerfect.le_kissingNumber`: Korkine–Zolotarev: a perfect form has at least `n(n+1)` minimal vectors.
- `IsPerfect.exists_similar_isIntegralForm`: Rationality: a perfect form is similar to an integral form.

API:

- Perfection is similarity invariant and forces the minimal vectors to span the real space.
- Fixing the minimum and minimal vectors determines a perfect form; a minimum-one perfect form has rational entries.

**Checks.**

- For I₂ the rank-one shell matrices span dimension 2 < 3, so it is not perfect.
- For A₂ they span dimension 3, and the six minimal vectors meet the lower bound n(n+1) = 6.
- For rank zero both span dimension and n(n+1)/2 are 0; perfection is true although min = 0.

*Needs:* M `Matrix.vecMulVec`, `Submodule.span`, `Module.finrank`; L 0.1, 1.1.

### 4.2 Eutaxy

Define `IsEutactic A :↔ ∃ c : S(A) → ℝ, (∀ x, 0 < c x) ∧ A⁻¹ = ∑_x c x • vecMulVec x x`, and
`IsStronglyEutactic A :↔ ∃ c > 0, A⁻¹ = c • ∑_{x ∈ S(A)} vecMulVec x x`; *semi-eutactic* has
`c x ≥ 0`. Prove similarity invariance (the coefficients rescale by `c⁻¹` under `c • A`), that
eutactic implies well-rounded (a `v ⊥_A S(A)` would give `⟪v, v⟫_A = ∑ c_x ⟪v, x⟫_A² = 0`), the
trace identity `n = ∑_x c_x · min A` (take the trace of `A · A⁻¹`), so for strongly eutactic `A` of positive rank
the coefficient is `c = n / (kiss A · min A)`, and the inner-product form of the definition
`⟪v,v⟫_A = ∑ c_x ⟪v,x⟫_A²` for all `v`. Prove `ℤⁿ`, `A₂`, `A₃`, `D₄`, `E₈` strongly eutactic (their
automorphism groups act irreducibly, which is the criterion of 4.4), and that `[[2,1],[1,3]]` is
not eutactic (`S = {±e₁}` does not span).

API:

- Positive eutaxy coefficients rescale by c⁻¹ and imply real spanning.
- The trace identity is n = min A times the sum of coefficients; in positive rank strong eutaxy has coefficient n/(kiss A · min A).

**Checks.**

- For I₂ the shell outer-product sum is 2I, so the eutaxy coefficient is 1/2 = 2/(4·1).
- For A₂, Q = [[4,−2],[−2,4]] = 6A⁻¹; coefficient 1/6 equals 2/(6·2).
- For rank zero every positive coefficient satisfies the empty matrix equation; n/(kiss·min) is 0/0 = 0 and cannot be the asserted positive coefficient.
- For [[2,1],[1,3]], every shell outer product has second diagonal 0, whereas A⁻¹ has
  second diagonal 2/5; even nonnegative coefficients cannot give semi-eutaxy.
  The positive coefficients 1/2 for I₂ and 1/6 for A₂ give semi-eutaxy as well as eutaxy.

*Needs:* M `Matrix.trace`, `Matrix.PosDef.inv`; L 0.5, 1.1.

### 4.3 Extreme forms

Define `IsExtreme A :↔ IsLocalMax hermite A` in `PosDefForm n`. Prove it is a similarity
invariant and that it is equivalent to `IsLocalMax centerDensity A` and to a local maximum of
`min` on the hypersurface `det = det A` (1.5). Prove that a critical form (2.1) is extreme
(Dutour Sikirić–Schürmann–Vallentin, arXiv:math/0609388v3, §1, p.2;
the equivalences follow from the strictly increasing relation `Δ = Vₙ(γ/4)^{n/2}` in positive rank).

API:

- Extremality is similarity invariant and equivalent to local maximality of center density.
- A global Hermite maximizer is extreme.

**Checks.**

- A₂ attains γ₂ = 2/√3, so it is a local maximum.
- For A(t) = [[1,t],[t,1]] with 0 < |t| < 1/2, min = 1 and γ = 1/√(1−t²) > 1; I₂ is not extreme.
- Every rank-one [a], a > 0, has γ = 1, so the local maximum is not strict along scaling.

*Needs:* M `IsLocalMax`; L 1.5, 2.1.

### 4.4 Automorphisms and eutaxy

Define Aut A := {U ∈ GL_n(ℤ) | Uᵀ A U = A}. Prove it finite: choose C ≥ 0 with
C ≥ A[eᵢ] for every standard basis vector. The finite sublevel {x ∈ ℤⁿ | A[x] ≤ C}
contains that basis, and Aut A acts faithfully by permutations on it (1.1).
This also covers rank zero, when Aut A is the trivial group. Prove Aut (gramForm hL b) ≅ Isometry L L (IL 2C) for integral
forms. For n > 0, prove: if Aut A acts irreducibly on `ℝⁿ` then `A` is strongly eutactic
(Venkov, §6, discussion after Definition 6.1, pp.20–21).
Writing Q = ∑ x xᵀ, invariance gives UQUᵀ = Q and UᵀAU = A. Thus QA, not Q,
commutes with U. The A-self-adjoint endomorphism QA has invariant eigenspaces, so real
irreducibility makes QA a scalar identity and Q a multiple of A⁻¹. Prove
`∑_{x ∈ S(A)} ⟪v, x⟫_A² = (kiss A · min A / n) ⟪v, v⟫_A` for all `v`.

API:

- The automorphism group is finite and agrees with the lattice-isometry group in an integral basis.
- In positive rank irreducibility forces the moment operator QA to be scalar, hence strong eutaxy.

**Checks.**

- For A₂, Q = [[4,−2],[−2,4]] and A = [[2,1],[1,2]] give QA = 6I.
- With U = [[−1,−1],[0,1]], UQ = [[−2,−2],[−2,4]] and QU = [[−4,−6],[2,6]]; these differ while UQA = QAU.
- For I₂, Q = 2I and the moment sum at v = e₁ is 2 = (4·1/2)·1.
- For A = [[1,√2/10],[√2/10,√3]], det A = √3 − 1/50 > 0.
  Independence of 1, √2, √3 over ℚ makes each nonzero norm shell a pair {±x},
  of span dimension 1. The sublevel A[x] ≤ √3 is {0,±e₁,±e₂}, of span dimension 2;
  it gives a faithful permutation action even though no shell spans.
- For [a], a > 0, Aut A = {±1} has order 2; in rank zero its order is 1.

*Needs:* T `IsPosDef.finite_isometry`; IL 2C; L 0.2, 1.1, 4.2.

### 4.5 Voronoi's theorem

Prove **extreme ⇔ perfect ∧ eutactic** (Ash, §4, Corollary, p.1052;
Dutour Sikirić–Schürmann–Vallentin, arXiv:math/0609388v3, §1, p.2):
- *perfect ∧ eutactic ⇒ extreme.* For a symmetric `H` small, `min (A + H) ≤ min A + min_{x ∈ S(A)} H[x]`
  by minimality of a near-minimal vector, while `det (A + H) = det A (1 + tr(A⁻¹H) + O(‖H‖²))`;
  eutaxy writes `tr(A⁻¹H) = ∑ c_x H[x]`, a positive combination of the `H[x]` whose weights
  `c_x min A / n` sum to `1` (4.2's trace identity), so `min_x H[x] < (1/n) ∑ c_x H[x] min A`
  unless all `H[x]` are equal; in the equal case `H − (H[x]/min A) A` vanishes on `S(A)`, hence is
  `0` by perfection, and `A + H` is a multiple of `A` with the same `hermite`. The analysis uses
  `fderiv` of `det` and `log`.
- *extreme ⇒ perfect.* If not perfect, choose `H ≠ 0` symmetric with `H[x] = 0` for all
  `x ∈ S(A)`; then `min (A + tH) = min A` for small `|t|` (1.1's finiteness of near-minimal vectors)
  while `t ↦ det (A + tH)` is log-concave on the positive definite cone and non-constant, so one
  sign of `t` lowers `det` and raises `hermite`.
- *extreme ⇒ eutactic.* `A` is already perfect by the previous direction. If `A⁻¹` is not in the
  relative interior of `cone{x xᵀ | x ∈ S(A)}` (which is open in `Sym_n` by perfection), separate
  it: there is symmetric `H ≠ 0` with `tr(A⁻¹H) ≤ 0` and `H[x] ≥ 0` for all `x ∈ S(A)`, not all
  zero (perfection forbids `H[x] = 0` on all of `S(A)`); then `min (A + tH) ≥ min A` for small
  `t > 0` while `det (A + tH) < det A` (strict concavity of `log det` along a direction that is not a
  multiple of `A`, or the strict first-order drop), so `A` is not a local maximum.
State the three directions as separate theorems so that 4.6 and 4.10 can cite them.

API and acceptance statements:

- `isExtreme_iff`: : extreme iff perfect and eutactic.

**Checks.**

- For A₂, perfection and eutaxy are both true and γ = 2/√3 is extreme.
- For I₂, eutaxy holds with coefficient 1/2 but the span rank 2 < 3 prevents perfection and extremality.
- For [[2,1],[1,3]], S = {±e₁}; the span rank is 1 and the inverse has nonzero second diagonal 2/5, so both criteria fail.

*Needs:* M `fderiv`, `Matrix.det`, `Real.log`, `Convex`; L 1.1, 1.5, 4.1, 4.2, 4.3.

### 4.6 Finiteness of perfect forms up to similarity

Prove that the perfect forms of rank `n` fall into finitely many similarity classes. Route: by 4.1
every perfect form is similar to a primitive integral form, and `S(A)` determines `A` up to the
scalar; so it suffices to bound the possible sets `S(A)`. For a Minkowski-reduced basis (1.9) the
coordinates of a minimal vector are bounded by a constant that is a function of `n` alone (1.9), hence
`S(A) ⊆ [−Cₙ, Cₙ]ⁿ`, finitely many subsets, each determining at most one perfect form with
`min = 1`. Record the counts `1, 1, 1, 2, 3, 7, 33, 10916` for `n = 1, …, 8` as the classification target of 4.10, not as a theorem of this milestone.

API and acceptance statements:

- `finite_perfect_quotient`: Finiteness of perfect forms up to similarity.

**Checks.**

- Rank one has one perfect similarity class: [a] is similar to [1] for a > 0.
- Rank two has one class represented by A₂, whereas I₂ is excluded by span rank 2 < 3.
- Rank zero has one empty matrix class; finiteness holds without primitive normalization.

*Needs:* L 0.1, 4.1, 1.9.

### 4.7 Finiteness of eutactic forms up to similarity

Prove that the eutactic forms of rank `n` fall into finitely many similarity classes (Ash, §4, Theorem 3, p.1052). Prerequisites made explicit: eutaxy is the condition that `A⁻¹`
lies in the cone of the `x xᵀ`, the first-order (Karush–Kuhn–Tucker) condition for `A` to be a
critical point of `hermite` on `det = 1` (4.5's analysis); well-rounded forms with `det = 1` are
compact modulo `GL_n(ℤ)` (GoN 4.5.8, as in 2.2); and on each stratum `{A | S(A) = S}` the critical
points are isolated. The knowl `lattice.eutactic` quotes this theorem.

API and acceptance statements:

- `finite_eutactic_quotient`: Finiteness of eutactic forms up to similarity (Ash).

**Checks.**

- All rank-one forms have coefficient 1/(2a), but only one similarity class.
- I₂ is eutactic with coefficient 1/2 despite not being perfect, so the eutactic quotient is not the perfect quotient.
- The unequal form [[2,1],[1,3]] has no positive eutaxy expression because every shell outer product has zero second row.

*Needs:* GoN 4.5.8; M `IsCompact`, `fderiv`; L 4.2, 4.5, 1.9.

### 4.9 The Ryshkov polyhedron and Voronoi neighbours

Define the Ryshkov polyhedron `𝓡ₙ := {A ∈ Sym_n(ℝ) | ∀ x ∈ ℤⁿ ∖ 0, A[x] ≥ 1}`, prove it is a
closed convex subset of the positive definite cone, locally finite as an intersection of half-spaces
(near any `A ∈ 𝓡ₙ` only finitely many `x` have `A[x] ≤ 1 + ε`, by 1.1 and continuity), and that its
vertices, for n > 0, are exactly the perfect forms with `min = 1` (4.1: `A` is a vertex iff the active
constraints `{x | A[x] = 1} = S(A)` have `x xᵀ` spanning `Sym_n`). Define the Voronoi domain of a
perfect `P` as `cone{x xᵀ | x ∈ S(P)}`, prove the domains tile the rational closure of the
positive definite cone (Voronoi; Schürmann, Ch. 3). Define a *facet normal* of `P` as a symmetric
`N` with `N[x] ≥ 0` for all `x ∈ S(P)` whose zero set `{x ∈ S(P) | N[x] = 0}` has `x xᵀ` spanning a
hyperplane of `Sym_n` (`IsFacetNormal P N`; the facets of the Voronoi domain, finitely many up to
positive scaling), and the *neighbour across `N`* as `voronoiNeighbour P N := P + ρ N` with
`ρ = sup {t ≥ 0 | P + tN is positive definite and min (P + tN) = min P}`.
For n ≥ 2 prove ρ is finite and positive, and that the neighbour is distinct from P,
perfect with minimum min P and its domain shares the facet, and that the neighbour across the
shared facet of `voronoiNeighbour P N` is `P` again. In rank one all forms are similar; the normalized graph is a single isolated vertex,
and the formula gives ρ = 0. Prove the graph of minimum-one perfect forms is connected,
with finitely many GLₙ(ℤ)-orbits (4.6). The algorithm as a procedure is not a milestone.

API and acceptance statements:

- `isPerfect_voronoiNeighbour`: A Voronoi neighbour of a perfect form is perfect, including the isolated rank-one case.
- `min_voronoiNeighbour`: Voronoi neighbours preserve the input minimum.

API:

- The Ryshkov set is closed and convex, with locally finitely many active inequalities.
- In positive rank its vertices are the minimum-one perfect forms; neighbours preserve minimum and are distinct in rank at least two.

**Checks.**

- For P = [1], N = [1], the zero span has dimension 0 = dim Sym₁ − 1; the admissible step set is {0}, so ρ = 0.
- For P = [2], N = [1], the preserved level is 2 and the step is again 0; a minimum-one formula has an empty admissible set.
- At rank zero the Ryshkov set is the singleton empty matrix, whose minimum is 0; the minimum-one vertex characterization excludes this case.
- For P = A₂ = [[2,1],[1,2]] and N = [[0,−1],[−1,0]], the zero shell vectors
  ±e₁, ±e₂ have outer-product span dimension 2 = dim Sym₂ − 1.
  The admissible interval is [0,2], so ρ = 2 and the neighbour is [[2,−1],[−1,2]],
  of determinant 3 and minimum 2, with new minimal vectors ±(1,1).
  Returning P would miss these vectors; N replaced by 2N has step 1 and the same endpoint.
- For that P, N = I₂ is not a facet normal: its zero shell is empty and has span dimension 0, not 2.
- In rank two, I₂ is in the Ryshkov set but is not a vertex (active span dimension 2 < 3);
  A₂/2 is a vertex (dimension 3), whereas I₂/2 is outside since its minimum is 1/2.
- The Voronoi domain of A₂ is generated by e₁e₁ᵀ, e₂e₂ᵀ and (e₁−e₂)(e₁−e₂)ᵀ.
  It contains I₂ on its boundary and A₂⁻¹ in its interior with all three coefficients 1/3;
  A₂ itself is outside, since the generators have nonpositive off-diagonal entries.

*Needs:* M `Convex`, `ConvexCone`, `IsClosed`; L 1.1, 4.1, 4.6.

### 4.10 Finite perfect-form families and the sharp Hermite constants

For n > 0, prove `perfectForms_complete`: every nonempty finite family of perfect forms
closed under every Voronoi neighbour up to similarity meets every perfect similarity class.
The proof uses connectedness from 4.9; in rank one there is just one similarity class.
Consequently γₙ is the maximum Hermite invariant of such a family, by attainment and Voronoi's
theorem. No integrality or pairwise inequivalence assumption is needed for this implication.

Prove the finite classifications in ranks 4–8 up to similarity, with respectively
2, 3, 7, 33 and 10916 classes, and the sharp values
γ₄⁴ = 4, γ₅⁵ = 8, γ₆⁶ = 64/3, γ₇⁷ = 64 and γ₈⁸ = 256.
The critical forms are uniquely D₄, D₅, E₆, E₇ and E₈ up to similarity; rank-three uniqueness
is A₃. These are mathematical classification and extremal-value targets, not enumeration
procedures (Dutour Sikirić–Schürmann–Vallentin, arXiv:math/0609388v3,
§1, Table 1 and Theorem 1.1, p.3).

API and acceptance statements:

- `hermiteConstant_four_pow`: `γ₄⁴ = 4`, `γ₅⁵ = 8`, `γ₆⁶ = 64/3`, `γ₇⁷ = 64`, `γ₈⁸ = 256`, by the perfect-form classification (Korkine–Zolotarev; Blichfeldt).
- `card_perfect_quotient_four`: There are 2 perfect similarity classes in rank 4.
- `card_perfect_quotient_five`: There are 3 perfect similarity classes in rank 5.
- `card_perfect_quotient_six`: There are 7 perfect similarity classes in rank 6.
- `card_perfect_quotient_seven`: There are 33 perfect similarity classes in rank 7.
- `card_perfect_quotient_eight`: There are 10916 perfect similarity classes in rank 8.
- `hermiteConstant_five_pow`: The sharp rank-five Hermite value, attained by D₅.
- `hermiteConstant_six_pow`: The sharp rank-six Hermite value, attained by E₆.
- `hermiteConstant_seven_pow`: The sharp rank-seven Hermite value, attained by E₇.
- `hermiteConstant_eight_pow`: The sharp rank-eight Hermite value, attained by E₈.

**Checks.**

- The empty family has no representative of [1] and is excluded by nonemptiness.
- In rank one the family {[1]} meets every perfect class; its Hermite maximum is 1.
- D₅, E₆ and E₇ have minimum 2 and determinants 4, 3 and 2, so γⁿ is respectively
  32/4 = 8, 64/3 and 128/2 = 64.

*Needs:* Layers 2.2, 4.5, 4.6 and 4.9; Completed/IntegralLattices Layer 5 for the root lattices, with the pinned ADE modules in the supplier contract.

### 4.11 The Leech upper bound and γ₂₄ = 4

Develop the lattice form of the Cohn–Elkies bound in every positive dimension: for a real
Schwartz function f on a Euclidean space, with Fourier phase exp(−2πi⟨x,ξ⟩), assume
f̂ ≥ 0, f̂(0) > 0, and f(x) ≤ 0 when ‖x‖ ≥ r > 0. Prove that every full lattice has
center density at most (r/2)ⁿ f(0)/f̂(0), by scaling its shortest length to r and applying
Poisson summation to it and its dual. The sign hypotheses imply f(0) > 0; both denominators
are nonzero (Cohn–Elkies, Theorem 3.1, p.694, with rescaling).

Construct the real radial Schwartz function in dimension 24 with f(0) = f̂(0) = 1,
f(x) ≤ 0 for ‖x‖ ≥ 2 and f̂(ξ) ≥ 0 for all ξ. The construction targets include the two
radial Fourier eigenfunctions of signs +1 and −1 defined by the modular contour integrals,
their Schwartz estimates and removable singularities, and the sign inequalities for their
specified linear combination. These are analytic identities and inequalities, including
the bounds on their Fourier expansions used to prove the signs, not numerical verification
procedures (Cohn–Kumar–Miller–Radchenko–Viazovska, arXiv:1603.06518v4,
§§2–4 and Appendix A, pp.1020–1032).
This gives center density ≤ 1, hence γ₂₄ ≤ 4. The Leech lattice of
Rank24LatticeConstructions Layer 6 has minimum 4 and determinant 1, so it attains equality.
Prove `hermiteConstant_twentyFour`. The external sphere-packing formalization is provenance,
not a library prerequisite; the analytic input is owned in this subsection.

API:
- The general bound is unchanged by positive rescaling of f.
- Rescaling the independent variable by a > 0 changes the sign radius to r/a and the
  Fourier value at zero by a⁻ⁿ, leaving the density bound unchanged.
- The 24-dimensional function has zeros at all Leech vector lengths √(2k), k ≥ 2;
  this matches equality in the two Poisson inequalities.

API and acceptance statements:

- `centerDensity_le_cohnElkies`: The lattice Cohn–Elkies bound for a real-valued Schwartz function with nonnegative real Fourier transform, positive Fourier value at zero and sign radius r.
- `exists_leech_auxiliary`: The dimension-24 auxiliary Schwartz function proving the sharp Leech bound.

**Checks.**

- With r = 2 and f(0)/f̂(0) = 1 the bound is δ ≤ 1 and γ₂₄ ≤ 4.
- The Leech lattice has δ = (√4/2)²⁴/√1 = 1 and γ = 4.
- Multiplying f by 3 leaves f(0)/f̂(0) = 3/3 = 1; f = 0 is excluded by f̂(0) > 0.

*Needs:* ThetaSeries Layer 1 (Poisson summation and dual covolumes); Mathlib Schwartz and
Fourier APIs; ModularForms Layer 1 (valence formula), Mathlib level-one Eisenstein series; Layers 1.4–1.5 and 2.1;
Rank24LatticeConstructions Layer 6 for the lower witness.

### Examples

The local Checks above and the worked examples below fix the normalizations used in this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 4.1 | M `Matrix.vecMulVec`, `Submodule.span`, `Module.finrank`; L 0.1, 1.1 |
| 4.2 | M `Matrix.trace`, `Matrix.PosDef.inv`; L 0.5, 1.1 |
| 4.3 | M `IsLocalMax`; L 1.5, 2.1 |
| 4.4 | T `IsPosDef.finite_isometry`; IL 2C; L 0.2, 1.1, 4.2 |
| 4.5 | M `fderiv`, `Matrix.det`, `Real.log`, `Convex`; L 1.1, 1.5, 4.1, 4.2, 4.3 |
| 4.6 | L 0.1, 4.1, 1.9 |
| 4.7 | GoN 4.5.8; M `IsCompact`, `fderiv`; L 4.2, 4.5, 1.9 |
| 4.9 | M `Convex`, `ConvexCone`, `IsClosed`; L 1.1, 4.1, 4.6 |
| 4.10 | T `IsPosDef.finite_isometry`; L 0.2, 2.1, 2.2, 4.1, 4.3, 4.5, 4.9 |
| 4.11 | TS Layer 1; ModularForms Layer 1; M Schwartz and Fourier APIs; R24 Layer 6; L 1.4, 1.5, 2.1 |

## Layer 5: spherical designs and Venkov's theorem

### 5.1 Spherical designs

In a real inner product space `E` with `finrank ℝ E = n ≥ 1`: define `Pol_t E` as in the
conventions, prove it is finite-dimensional and, under an orthonormal basis, is the image of
`MvPolynomial.restrictTotalDegree ℝ t` under evaluation, so that `Pol_t E` is `O(E)`-invariant and
`Pol_s E ≤ Pol_t E` for `s ≤ t`. For r ≥ 0 define the normalized sphere measure `σ_r` on `sphere 0 r`, with σ₀ the point mass at zero, and prove
it is a probability measure, invariant under every linear isometry of `E`
(`LinearIsometryEquiv.measurePreserving` and the definition of `toSphere`). Define `IsSphericalDesign t X r` for a finite nonempty `X ⊆ sphere 0 r`, prove
it is invariant under isometries, under `X ↦ −X`, and that a `t`-design is an `s`-design for
`s ≤ t`; prove the antipodal case `X = −X` is automatically an odd-degree design in one more degree
(`2k`-design and antipodal ⇒ `(2k+1)`-design: odd polynomials have zero average on both sides).

API and acceptance statements:

- `polynomialsOfDegreeLE`: Polynomial functions of degree `≤ t` on a real inner product space: the span of the powers `⟪a, ·⟫^k`, `k ≤ t`.

API:

- Polynomial functions of degree at most t form a finite-dimensional space invariant under isometries.
- Spherical designs are preserved by isometry and by lowering degree; antipodal 2k-designs are (2k+1)-designs.

**Checks.**

- On the rank-one sphere {−1,1}, the uniform average of x is 0 and of x² is 1, equal to the sphere averages.
- The singleton {1} has average x = 1, not 0, so fails degree one.
- The empty set is rejected even though many empty sums are 0; nonemptiness is part of the definition.
- In E = ℝ, σ₁ assigns mass 1/2 to each of −1 and 1, with total sphere mass 1;
  σ₀ assigns mass 1 to {0}. At r = −1 the sphere is empty and has mass 0
  under the scaled unit-sphere probability, so the support assertion excludes negative r.
- On ℝ, Pol₀ consists of constants, Pol₁ has basis 1,x, and Pol₂ has basis 1,x,x²;
  their dimensions are 1,2,3. Values of x at 0,1 differ, excluding x from Pol₀;
  x² has second difference 2 at 0,1,2, excluding it from Pol₁.

*Needs:* M `Measure.toSphere`, `LinearIsometryEquiv.measurePreserving`, `MvPolynomial.restrictTotalDegree`, `OrthonormalBasis`; L none.

### 5.2 The moment criterion

Prove (Venkov, *Réseaux et designs sphériques*, §3; Goethals–Seidel): a finite nonempty antipodal
`X ⊆ sphere 0 r`, with r > 0, is a `(2k+1)`-design iff for every `j ≤ k` and every `a ∈ E`,
`∑_{x ∈ X} ⟪a, x⟫^{2j} = c_j · #X · r^{2j} · ‖a‖^{2j}` with
`c_j = (1·3·⋯·(2j−1)) / (n(n+2)⋯(n+2j−2))`. The constants are the sphere moments
`∫ ⟪a, x⟫^{2j} dσ_r`, computed from `toSphere` and the Gamma function (`Real.Gamma`), and the
equivalence uses that the `⟪a, ·⟫^{2j}` span the even part of `Pol_{2k} E` (5.1). State the two
cases used below explicitly: `2`-design iff `∑ ⟪a,x⟫² = (#X r²/n) ‖a‖²`, and `4`-design iff in
addition `∑ ⟪a,x⟫⁴ = (3 #X r⁴/(n(n+2))) ‖a‖⁴`.

API and acceptance statements:

- `isSphericalDesign_iff_moments`: The moment criterion for antipodal sets: a `(2k+1)`-design iff the even moments `∑ ⟪a, x⟫^{2j}` equal `c_j #X r^{2j} ‖a‖^{2j}`, with `c_j = (1·3⋯(2j−1)) / (n(n+2)⋯(n+2j−2))`.

**Checks.**

- For {±1}, r = 1 and a = 1, each even moment sum is 2; the coefficient product is 1 and the right side is 2.
- For the four unit vectors of I₂ and a = e₁, the second moment is 2 = 4/2.
- Their fourth moment is 2, whereas 3·4/(2·4) = 3/2; the set is not a 4-design.

*Needs:* M `Real.Gamma`, `integral` over `toSphere`; L 5.1.

### 5.3 Design forms, strongly eutactic and strongly perfect

Define `IsDesignForm t A :↔ IsSphericalDesign t (S(A)) √(min A)` in `FormSpace A`. Prove
similarity invariance. For n > 0 prove **strongly eutactic ⇔ `2`-design form** (4.4's identity is exactly
5.2's `2`-design criterion with `#X = kiss A`, `r² = min A`). Define `IsStronglyPerfect A :↔
IsDesignForm 4 A`, prove strongly perfect ⇒ perfect (if `H ≠ 0` is symmetric with `H[x] = 0` on
`S(A)`, the degree-`4` polynomial `(xᵀHx)²` has average `0` over `S(A)` but positive integral over
the sphere; Venkov §6) and strongly perfect ⇒ strongly eutactic, hence extreme by 4.5; prove the knowl's "strictly stronger" by the witness
`A₃`, which is perfect and strongly eutactic but not a `4`-design (9). Prove that the roots of `E₈`
form a `7`-design and the minimal vectors of `Λ₂₄` an `11`-design as corollaries of 5.7, and
directly that the `6` minimal vectors of `A₂` form a `5`-design (the hexagon) and the `4` of `ℤ²`
a `3`-design but not a `4`-design.

API and acceptance statements:

- `minimalVectorsFinset`: The minimal vectors as a `Finset` in `FormSpace A` (finite by 1.1).
- `isStronglyEutactic_iff_isDesignForm_two`: Strongly eutactic iff `2`-design form.
- `IsStronglyPerfect.isPerfect`: A lattice whose minimal shell is a spherical 4-design is perfect.

API:

- Design-form and strongly perfect predicates are similarity invariant.
- Strong perfection implies perfection and strong eutaxy, hence extremality.

**Checks.**

- I₂ is strongly eutactic and a 2-design, but its fourth moments 2 and 3/2 disagree.
- The six A₂ minimal vectors have normalized degree-four moment 6·3/8 = 9/4 on the unit circle.
- At rank zero the minimal set is empty and is not a design, while strong eutaxy is vacuous; positive rank is needed for the equivalence.

*Needs:* L 1.1, 4.1, 4.2, 4.4, 4.5, 5.2; examples via 5.7 and 9.

### 5.4 Harmonic polynomials in Gram coordinates

Consume GeometryOfNumbersAndQuadraticArithmetic §4.3: `polynomialLaplacian`,
`polynomial_fischer_decomposition` and `polynomial_sphere_harmonic_span` in every positive
real dimension. In a lattice basis with positive Gram matrix A, define `gramLaplacian A P`
as Σᵢⱼ (A⁻¹)ᵢⱼ ∂ᵢ∂ⱼP and `IsHarmonic A P` as its vanishing. Prove that transport to an
orthonormal basis intertwines this operator with the supplier's Laplacian. Homogeneity is
preserved by that linear change of coordinates. For a finite nonempty antipodal subset X
of a sphere of radius r > 0 in positive dimension, prove the design criterion: X is a
t-design iff every homogeneous harmonic polynomial of degree 0 < d ≤ t sums to zero on X.
This follows from the supplier's sphere decomposition and the vanishing of the integral of
positive-degree harmonics (Venkov, §3).

API:
- The Gram Laplacian is linear and reduces homogeneous degree by two.
- An isometry of Gram spaces intertwines their Laplacians under pullback.
- With A = I it equals the supplier's coordinate Laplacian.

**Checks.**

- For A = I, the polynomials 1, X₀² and X₀² − X₁² have Laplacians 0, 2 and 0.
- For A = diag(1,4), X₀² − X₁² has Gram Laplacian 3/2; X₀² − 4X₁² has Laplacian 0.
- For the pinned E₈ Cartan matrix, the inverse diagonal entries at 0 and 7 are 4 and 2.
  Thus X₀² − X₇² has Gram Laplacian 4 and root-shell sum 120, whereas
  X₀² − 2X₇² has Gram Laplacian 0 and shell sum 240 − 240 = 0.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.3; Layer 0.3; Layers 5.1–5.2.

### 5.5 The Fourier transform of a harmonic Gaussian

Prove `fourier_harmonic_gaussian_complex`, the Hecke–Bochner identity: for `P ∈ Harm_d` on `ℝⁿ` and `τ ∈ ℍ`, the Schwartz function
`x ↦ P(x) e^{π i τ ‖x‖²}` has Fourier transform `ξ ↦ (τ/i)^{−n/2} τ^{−d} P(ξ) e^{−π i ‖ξ‖²/τ}`
(principal branch, `Re(τ/i) > 0`), in Mathlib's `SchwartzMap.fourierTransformCLM` normalization
`ξ ↦ ∫ f(x) e^{−2π i ⟪x, ξ⟫} dx`. Route: Hecke's identity `𝓕(P e^{−π‖x‖²}) = (−i)^d P e^{−π‖ξ‖²}`
(GeometryOfNumbersAndQuadraticArithmetic §4.3, `fourier_harmonic_gaussian`).
First rescale by a positive real s. Extend the resulting identity to Re s > 0 by
holomorphic continuation, using locally uniform Schwartz bounds to differentiate the Fourier
integral; then put s = τ/i. The factor `(−i)^d s^{−d}` equals `τ^{−d}`. When `8 ∣ n` the constant is `τ^{−n/2−d}`. This extends Theta Series'
`fourier_gaussian` (the case `d = 0`, same constant `(τ/i)^{−n/2}`) and owns the extension from the supplier's positive real parameter to τ ∈ ℍ.
At τ = i the phase is (−i)^d, giving −i for d = 1 and −1 for d = 2.

**Checks.**

- At τ = i and d = 1, the Fourier multiplier is −i.
- At τ = i and d = 2, it is −1; the opposite Fourier phase would give the wrong odd-degree sign.
- For real s = 4, n = 2 and d = 0, the prefactor is s⁻¹ = 1/4; a complex substitution in a real integral is not used.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.3 `fourier_harmonic_gaussian`;
M `SchwartzMap.fourierTransformCLM`; TS Layer 1 `gaussian`, `fourier_gaussian`; L 5.4.

### 5.6 Theta series with harmonic coefficients

For a positive definite even unimodular lattice `L` of rank `n = 2k`, `8 ∣ n`, realized in
`FormSpace A`, and P homogeneous of degree d with `IsHarmonic A P` in the chosen Gram coordinates, define `Θ_{L,P}(τ) := ∑_{x ∈ ℤⁿ} P(x) e^{π i τ A[x]}` on `ℍ`,
prove absolute convergence (`P` has polynomial growth, the Gaussian decays; TS Layer 1's
summability with a polynomial weight), holomorphy, the `q`-expansion
`Θ_{L,P} = ∑_m (∑_{x : A[x] = 2m} P(x)) q^m`, and **Hecke's theorem**: for `d > 0`, `Θ_{L,P}` is a
cusp form of weight `k + d` for `SL₂(ℤ)` (Venkov, Theorem 16.1, p.59; Poisson summation, TS Layer 1, with 5.5; the constant
term vanishes because `P(0) = 0`; the `T`-law is immediate from evenness). Construct it as a Mathlib
`CuspForm 𝒮ℒ (k + d)`. For d = 0 the polynomial is constant, say P = c, and
`Θ_{L,c} = c · Θ_L` by linearity. In particular P = 1 recovers Theta Series'
Θ_L ∈ M_k(SL₂(ℤ)) (its Layer 5).

API and acceptance statements:

- `harmonicTheta`: The theta series with harmonic coefficient `P`: `Θ_{A,P}(τ) = ∑_{x ∈ ℤⁿ} P(x) e^{π i τ xᵀAx}`.
- `summable_harmonicTheta`: Every polynomially weighted positive definite theta series converges absolutely on the upper half-plane.
- `exists_cuspForm_harmonicTheta`: For an even unimodular lattice of rank `n = 2k` and a homogeneous harmonic `P` of degree `d > 0`, `Θ_{L,P}` is a cusp form of weight `k + d` for `SL₂(ℤ)`; stated as the existence of a Mathlib `CuspForm` with the same values.

API:

- The weighted theta series is linear in its polynomial and has the stated shell sums as Fourier coefficients.
- Positive homogeneous harmonic degree removes the constant term; odd degree cancels identically.

**Checks.**

- For odd-degree P, x and −x cancel, giving theta coefficient 0 on every shell.
- For constant P = 1 the zero vector contributes 1, so the theta series is not cuspidal; d > 0 excludes it.
- For P = 2 on E₈, the constant coefficient is 2 = 2·1 and the norm-two coefficient
  is 480 = 2·240; for P = 0 both are 0. Degree zero alone does not normalize P to 1.
- For E₈, P = X₀² − 2X₇² is Gram harmonic, its first shell sum is 0, and the weight-six cusp space has dimension 0.

*Needs:* TS Layer 1 `poissonSummation`, Layer 5; M `CuspForm`; IL 6C (`E₈` even unimodular); L 0.3, 5.4, 5.5.

### 5.7 Venkov's theorem

Prove: for an even unimodular lattice `L` of rank `n = 24m + 8r`, `r ∈ {0, 1, 2}`, that is
**extremal** (`min L = 2m + 2`), every nonempty shell `{x ∈ L | A[x] = 2j}` is a spherical
`t`-design with `t = 11, 7, 3` for `r = 0, 1, 2` respectively. Route (Venkov, Theorem 16.4, p.61, equation (16.6) and its proof, p.62):
odd homogeneous degrees cancel under x ↦ −x. For even d with 0 < d ≤ t, the cusp form `Θ_{L,P}` of weight `k + d` has
`q`-expansion starting at `q^{m+1}`; the space `S_{k+d}(SL₂(ℤ))` has dimension `⌊(k+d)/12⌋ − 1`
or `⌊(k+d)/12⌋` and every nonzero cusp form in it has order of vanishing at most that dimension at
`∞` (`Δ^{dim} · M_{k+d−12 dim}` structure from Mathlib's `discriminantEquiv` and the graded ring),
which is `< m + 1` throughout the stated range of `d`; so `Θ_{L,P} = 0` and every shell sum of `P`
vanishes, which is 5.4's criterion. Corollaries: the `240` roots of `E₈` are a `7`-design, the
`196560` minimal vectors of `Λ₂₄` an `11`-design, and every extremal even unimodular lattice of
rank `24m + 8r` is strongly perfect when `t ≥ 4` (so for `r ∈ {0, 1}`), hence extreme (5.3, 4.5).
Record the non-example: `D₁₆⁺` and `E₈²` have `t = 3` (`r = 2`) and are not strongly perfect.

API and acceptance statements:

- `venkov_shell_isSphericalDesign`: Every nonempty shell of an extremal even unimodular lattice of rank `24m + 8r` is a spherical `t`-design, `t = 11, 7, 3` for `r = 0, 1, 2`. The shell of norm `2j` is read in `FormSpace (gramForm hL b)`.

**Checks.**

- For E₈, n = 8 means m = 0, r = 1 and t = 7.
- For E₈ ⊕ E₈, n = 16 gives m = 0, r = 2 and t = 3; it does not assert a 4-design.
- For the Leech lattice, n = 24 gives m = 1, r = 0, min = 4 and t = 11.
- At n = 24 the even degrees d = 2,4,6,8,10 give cusp dimensions 0,1,1,1,1,
  all less than m+1 = 2. Degree 14 also gives dim S₂₆ = dim M₁₄ = 1 < 2,
  while degree 12 gives dim S₂₄ = 2; the extra isolated vanishing does not give a 14-design
  (Venkov, Remark 16.5, p.61).

*Needs:* M `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `discriminantEquiv`; T `mvPolynomialEquivModularForms`; TS 8B, 8D; R24 Layer 6; IL 6C, 6D; L 5.3, 5.4, 5.6.

### Examples

The local Checks above and the worked examples below fix the normalizations used in this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 5.1 | M `Measure.toSphere`, `LinearIsometryEquiv.measurePreserving`, `MvPolynomial.restrictTotalDegree`, `OrthonormalBasis`; L none |
| 5.2 | M `Real.Gamma`, `integral` over `toSphere`; L 5.1 |
| 5.3 | L 1.1, 4.1, 4.2, 4.4, 4.5, 5.2; examples via 5.7 and 9 |
| 5.4 | M `MvPolynomial.pderiv`, `MvPolynomial.homogeneousSubmodule`; L 5.1 |
| 5.5 | GoN §4.3 `fourier_harmonic_gaussian`; M `SchwartzMap.fourierTransformCLM`; TS Layer 1 `gaussian`, `fourier_gaussian`; L 5.4 |
| 5.6 | TS Layer 1 `poissonSummation`, Layer 5; M `CuspForm`; IL 6C (`E₈` even unimodular); L 0.3, 5.4, 5.5 |
| 5.7 | M `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `discriminantEquiv`; T `mvPolynomialEquivModularForms`; TS 8B, 8D; R24 Layer 6; IL 6C, 6D; L 5.3, 5.4, 5.6 |

## Layer 6: universality

### 6.1 Representation and universality

For `hL : L.IsPosDef`, define `Represents L m :↔ L.representationNumber m ≠ 0` for `m : ℕ` and
`IsUniversal L :↔ ∀ m ≥ 1, Represents L m`; for even `L` define `RepresentsHalf L m :↔
L.representationNumber (2m) ≠ 0` and `IsHalfUniversal L`. Prove representation is equivalent
to the existence of a vector of the specified norm, using finiteness of vectors of that norm;
it is monotone under sublattices
(`L ≤ L'` of the same form ⇒ `Represents L m → Represents L' m`) and orthogonal sums
(`Represents L a → Represents M b → Represents (L ⊕ M) (a + b)`), and that a universal lattice has
`min L = 1`, hence a vector of norm `1`, hence `L ≅ ⟨1⟩ ⊕ L'` (IL 0F's splitting of a unimodular
rank-one sublattice). Prove `ℤ⁴` is universal (Mathlib's `Nat.sum_four_squares`), `ℤ³` is not
(`7` is not a sum of three squares, a congruence modulo `8`), and no lattice of rank `≤ 3` is
universal: a positive definite ternary form is anisotropic at `∞`, hence at some finite `p` by
Hilbert reciprocity ([Global quadratic forms](../GlobalQuadraticForms/README.md) 4.4), and an
anisotropic ternary form over `ℚ_p` omits a square class of `ℚ_p^×`, hence infinitely many
positive integers.

API and acceptance statements:

- `not_isUniversal_of_finrank_le_three`: No lattice of rank at most three is universal.

API:

- Representation is preserved by isometric embeddings, and represented values add under orthogonal sums.
- A universal lattice has minimum one and splits off a norm-one orthogonal line.

**Checks.**

- The residues of three squares modulo 8 exclude 7, so ℤ³ is not universal.
- ℤ⁴ represents 7 as 4 + 1 + 1 + 1 and is universal by the four-square theorem.
- For A₂, norm 2 is represented and norm 1 is not; half-norm 1 is represented but half-norm 2 is not.
- Gram 2I₄ is half-norm universal and has minimum 2, so it is not norm universal;
  Gram [2] represents half-norm 1 but not 2 and is not half-norm universal.

*Needs:* T `representationNumber`, `IsPosDef.finite_vectorsOfNorm`; M `Nat.sum_four_squares`; IL 0F; GQF 6.1; L 1.1, 1.2.

### 6.2 The truant and escalation

Define truant L := sInf {m ≥ 1 | ¬ Represents L m} for non-universal `L`, prove it is attained
and truant L ≤ 15 is *not* claimed here (it is the theorem). Define an *escalation* of `L` by `m`
as a positive definite integral lattice L′ = L + ℤv with B(v,v) = m.
Its rank may equal rank L or rank L + 1 (Bhargava, §2, p.28);
prove that for `m = truant L` the escalations of `L` are finitely many up to isometry (the integral pairings with a fixed basis satisfy
|B(v,bᵢ)|² ≤ m B(bᵢ,bᵢ), so only finitely many rows occur. A nonsingular augmented Gram
matrix gives a rank-increasing extension; in the singular case quotient the free module
on these generators by its radical, obtaining the same-rank extension), and the
**escalation lemma**: a universal lattice `M` containing `L` contains an escalation of `L` by
truant L. Define the *escalator lattices* `Esc₀ = {⟨1⟩}`, `Esc_{k+1}` = escalations by their
truants of the non-universal members of `Esc_k`, and prove `Esc_k` finite for each `k`.

API:

- The truant is the least positive missed integer for a nonuniversal lattice.
- Escalation represents that truant and may preserve or increase rank by one; each level has finitely many isometry classes.

**Checks.**

- For L = 2ℤ⁴ in ℤ⁴, min = 4 and truant = 1; adjoining e₁ preserves rank 4 and gives index 2 over L.
- For Gram [1], truant = 2, and adjoining an orthogonal vector of norm 2 gives rank two with Gram diag(1,2).
- The zero lattice has truant 1; its escalation has Gram [1], showing the initial step from rank zero.
- Esc₀ has the single class [1]. Esc₁ has the two classes I₂ and diag(1,2), from pairings
  1 and 0 with an adjoined norm-two vector; their determinants 1 and 2 distinguish them.
  Esc₂ has nine ternary classes (Bhargava, §3, p.28); adjoining a norm-four vector
  to [1] is not escalation by its truant 2.

*Needs:* T `ofGramMatrix`, `IsPosDef`; L 1.1, 6.1.

### 6.3 The 15 theorem

State `isUniversal_iff_fifteen`: a positive definite integral lattice is universal iff
it represents 1, 2, 3, 5, 6, 7, 10, 14, 15 (Bhargava, §6(ii), p.31).
A route is the classification of the escalations of §6.2, allowing same-rank extensions,
and universality of the resulting terminal lattices. Develop the representation argument
using ternary sublattices T and orthogonal lines: identify which integers are represented
by T through its genus and local conditions, and prove that subtracting an appropriate
line norm puts each integer into that represented set (Bhargava, §§3–5, pp.28–31).
The nine test integers are minimal: for each omitted integer c construct a lattice
representing the other eight but not c (Bhargava, §6(iii), p.31).

*Needs:* Layers 6.1–6.2; IntegralLattices §4A (genera); GlobalQuadraticForms §6.1.

**Checks.**

- Gram diag(1,2,5,5) represents the eight smaller test integers and misses 15, so the final condition is necessary.
- Gram diag(1,2,5,10) represents all nine test integers, so the theorem declares it universal.
- Gram [1] misses 2 and is rejected; ℤ⁴ represents all nine and passes.

### 6.4 The 290 theorem

State: an even positive definite lattice is half-norm universal iff its half-norm represents
`1, 2, 3, 5, 6, 7, 10, 13, 14, 15, 17, 19, 21, 22, 23, 26, 29, 30, 31, 34, 35, 37, 42, 58, 93, 110,
145, 203, 290` (Bhargava–Hanke, institutional preprint, Theorem 1).
The mathematical route uses escalation, the representation sets of ternary sublattices,
and the Eisenstein/cusp decomposition of a quaternary theta series (§4.2 of that preprint).
For every positive definite integer-valued quaternary form Q, develop bounds on its actual
theta coefficients r_Q(m) = a_E(m) + a_f(m), with all local densities, including those at 2
and at anisotropic primes, included. For every such Q of level N and character χ, and every choice B of upper bounds for
the valuations at its finitely many anisotropic primes, prove there are constants
C_E(Q,B) > 0 and C_f(Q) ≥ 0 such that every locally represented positive integer m with
those valuation bounds satisfies
`a_E(m) ≥ C_E(Q,B) m ∏_{p | m, p ∤ N, χ(p) = −1} (p−1)/(p+1)` and
`|a_f(m)| ≤ C_f(Q) 2^{ω(m)} d(m) √m`, where ω counts distinct prime divisors and d counts
positive divisors. Prove that failure of the strict lower-bound/upper-bound comparison
occurs for only finitely many such m (Bhargava–Hanke, §4.2.1–§4.2.3, pp.6–7; Hanke,
pp.351–388, for the local-density theory). Treat larger valuations by the local reduction maps,
not by discarding those integers. Prove representation of the remaining integers for each
terminal escalation. These representation theorems and local reductions are mathematical
targets of this subsection, not a certificate format or an executable procedure.

*Needs:* Layers 6.1–6.2; ThetaSeries §5 (theta modularity); ModularForms Layers 0 and 4–5
(Eisenstein decomposition and newforms); WeightsInEtaleCohomology §6.1
(good-prime Ramanujan bound), with ModularForms Layer 4
(bad-prime eigenvalues) and Layer 2 (Hecke recurrences); IntegralLattices §4A and
GlobalQuadraticForms §6.1 for the local representation conditions.

API and acceptance statements:

- `isHalfUniversal_iff_twoNinety`: (Bhargava–Hanke), for the half-norms of an even lattice.

**Checks.**

- For Gram 2I₄ the half-norm is the sum of four squares, so all 29 test integers are represented.
- For Gram [2], half-norm 1 is represented but 2 is not; the criterion rejects it.
- For Gram A₂, norm 2 is represented but norm 4 is not; applying the test to norm m instead of norm 2m would misread the half-norm convention.

### Examples

The local Checks above and the worked examples below fix the normalizations used in this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 6.1 | T `representationNumber`, `IsPosDef.finite_vectorsOfNorm`; M `Nat.sum_four_squares`; IL 0F; GQF 6.1; L 1.1, 1.2 |
| 6.2 | T `ofGramMatrix`, `IsPosDef`; L 1.1, 6.1 |
| 6.3 | IL 4A, 9B; GQF 6.1; L 6.1, 6.2 |
| 6.4 | T `IsEven`; L 6.1, 6.2, 6.3 |

## Layer 7: tensor products and the Festi–Veniani index

### 7.1 The tensor product

For `L₁ : IntegralLattice V₁`, `L₂ : IntegralLattice V₂` define `L₁ ⊗ L₂ : IntegralLattice (V₁ ⊗[ℚ] V₂)`
with carrier the image of `L₁.carrier ⊗[ℤ] L₂.carrier` and form
`LinearMap.BilinForm.tensorDistrib ℚ ℚ (L₁.form ⊗ₜ L₂.form)`; prove integrality, symmetry,
`rank (L₁ ⊗ L₂) = rank L₁ · rank L₂`, that the Gram matrix in the product of bases is the Kronecker
product `G₁ ⊗ₖ G₂`, hence `det (L₁ ⊗ L₂) = (det L₁)^{rank L₂} (det L₂)^{rank L₁}`
(`Matrix.det_kronecker`); positive definite if both factors are; even if one factor is even;
`⟨1⟩ ⊗ L ≅ L`; commutativity and associativity up to isometry; functoriality in isometries; and
`(L₁ ⊗ L₂)^∨ = L₁^∨ ⊗ L₂^∨` with `A_{L₁ ⊗ L₂}` of order `det`. Define the form-side Kronecker
product `A ⊗ₖ B ∈ PosDefForm (n₁ n₂)` and prove it is `gramForm` of the tensor product
(Coulangeon–Nebe, arXiv:1201.1832v1, §2, p.2, for the Euclidean tensor pairing;
rank, Gram, determinant and dual laws follow on product bases from
`Basis.tensorProduct`, `LinearMap.BilinForm.tensorDistrib_tmul` and `Matrix.det_kronecker`).

API:

- Tensor products are functorial in isometries, commutative and associative up to isometry.
- Ranks multiply and Gram matrices form Kronecker products; determinant, dual and parity laws follow with the stated hypotheses.

**Checks.**

- (computation) — for `L₁ = L₂ = A₂` (Gram `[[2,1],[1,2]]`) the Gram matrix of `A₂ ⊗ A₂` in the
  product basis is the Kronecker product `[[4,2,2,1],[2,4,1,2],[2,1,4,2],[1,2,2,4]]`, of rank `4`
  and determinant `81 = 3² · 3²`.
- (determinant formula) — `det (A₂ ⊗ D₄) = 3⁴ · 4² = 1296`, as `(det L₁)^(rank L₂) · (det L₂)^(rank L₁)` predicts.
- (unit) — `⟨1⟩ ⊗ L ≅ L` for every `L`, and `ℤ² ⊗ ℤ² ≅ ℤ⁴` (the Kronecker product of identity
  matrices is the identity).
- (comparison with Mathlib) — on pure tensors the form is `LinearMap.BilinForm.tensorDistrib_tmul`,
  `B(v₁ ⊗ w₁, v₂ ⊗ w₂) = B₁(v₁, v₂) · B₂(w₁, w₂)`, and the Gram matrix in `Basis.tensorProduct` of
  two carrier bases is `Matrix.kronecker` of the two Gram matrices.

*Needs:* M `TensorProduct`, `LinearMap.BilinForm.tensorDistrib`, `Basis.tensorProduct`, `Matrix.det_kronecker`; T `ofIntegralForm`, `dualCarrier`; L 0.2.

### 7.2 Minima of tensor products

Prove `min (L₁ ⊗ L₂) ≤ min L₁ · min L₂` (a pure tensor of minimal vectors), that for every
nonzero `w ∈ L₂` the sublattice `L₁ ⊗ ℤw` is isometric to `L₁` scaled by `B₂(w, w) > 0` (both factors positive definite), and that for pairwise
orthogonal nonzero `w₁, …, wₖ ∈ L₂` these sublattices are mutually orthogonal (so `L₁ ⊗ L₂ ⊇ ⊕ᵢ L₁^{(B₂(wᵢ,wᵢ))}`;
for a non-orthogonal basis they are not). State **Kitaoka's
theorem**: if `rank L₁ ≤ 43` then
`min (L₁ ⊗ L₂) = min L₁ · min L₂`, with the rank-`1` and rank-`2` cases proved here (rank `1` is
0.5's scaling; rank `2` by Minkowski reduction of `L₁` and a direct estimate), and the general
statement a milestone whose proof follows Kitaoka. The same equality holds for positive definite
real forms: `min_tensor_kitaoka` states C.min = A.min · B.min for A of rank n ≤ 43,
B of arbitrary rank m, and C whose Gram matrix is A ⊗ₖ B reindexed by
`finProdFinEquiv`. Integrality is unnecessary (Coulangeon–Nebe, arXiv:1201.1832v1,
§2, proof of Corollary 2.3, p.3, citing Kitaoka, Theorem 7.1.1: minimal vectors are pure tensors).
The zero-rank case follows from min = 0. Equality fails without a rank restriction
(Coulangeon–Nebe, Remark 2.4(1), p.3), so the inequality is the only unconditional statement.

API:

- The tensor minimum is at most the product of the two minima.
- A nonzero vector in the second positive definite factor gives a scaled copy of the first factor; orthogonal nonzero vectors give orthogonal copies.

**Checks.**

- (equality case) — `min (A₂ ⊗ A₂) = 4 = min A₂ · min A₂`, with exactly `18` minimal vectors: the
  pure tensors `x ⊗ y`, `x, y ∈ S(A₂)`, counted once each since `x ⊗ y = (−x) ⊗ (−y)` (`36/2`).
- For w = 0 the tensor sublattice has rank zero, while scaling a rank-one carrier by zero leaves rank one; this vector is excluded. For w = 2 in Gram [1], the tensor sublattice and scaled lattice both have Gram [4].
- (rank one) — `⟨m⟩ ⊗ L` is `L` scaled by `m` (0.5), so `min (⟨2⟩ ⊗ A₂) = 4`.
- For real forms [√2] and [3], the product has minimum 3√2 = √2·3;
  integrality is not needed. An empty factor gives minimum 0 = 0·min B.
- Taking A = B = [2] but C = [1] gives 1 ≠ 4; the Kronecker Gram equality excludes this unrelated C.
- (no unconditional equality) — the inequality `min (L₁ ⊗ L₂) ≤ min L₁ · min L₂` carries no rank
  hypothesis; equality is stated only under `rank L₁ ≤ 43`.

*Needs:* T⁺ `PosDef.Reduction` (prose); L 1.1, 1.2, 7.1.

### 7.3 Tensor decomposability

Define `IsTensorDecomposable L :↔ ∃ L₁ L₂, 2 ≤ rank L₁ ∧ 2 ≤ rank L₂ ∧ Nonempty (Isometry L (L₁ ⊗ L₂))`
and `TensorDecomposition L` as a finite list of factors of rank `≥ 2` with an isometry onto their
iterated tensor product. Prove: a decomposable lattice has composite rank; `det L` is then a
`rank L₂`-th power times a `rank L₁`-th power, so a lattice of squarefree determinant and rank `p`
prime is indecomposable; `E₈ ≇ A₂ ⊗ D₄`-type statements are checked by minima (7.2) or
determinants; `A₂ ⊗ A₂` has rank `4`, determinant `81`, minimum `4` and is decomposable by
definition. The LMFDB has no tensor column; the knowl is served by the predicate and these
criteria.

API:

- Tensor decomposability requires both ranks at least two, and therefore forces composite rank.
- It is preserved by isometry; determinant and minimum identities give obstruction tests.

**Checks.**

- (accepted) — `A₂ ⊗ A₂` and `ℤ⁴ ≅ ℤ² ⊗ ℤ²` are tensor decomposable.
- (rejected: rank-one factor) — `L ≅ ⟨1⟩ ⊗ L` is not a tensor decomposition; a definition that
  drops `2 ≤ rank` on either factor makes every lattice decomposable (*Pinned conventions*).
- (rejected: prime rank) — a lattice of prime rank, such as `A₂`, `ℤ³` or `A₃`, is indecomposable,
  since the rank of a decomposition is a product of two integers `≥ 2`.
- (determinant criterion) — `E₈` is not isometric to `A₂ ⊗ D₄`, although both have rank `8`:
  `det E₈ = 1` and `det (A₂ ⊗ D₄) = 1296`.

*Needs:* T `Isometry`, `determinant`; L 7.1, 7.2.

### 7.4 Automorphisms of the discriminant form

For a nondegenerate L, use `FiniteBilinearModule.Isometry` of its discriminant bilinear
module with itself when L is odd, and `FiniteQuadraticModule.Isometry` of its discriminant
quadratic module when L is even. Composition and inverse give finite groups; the native
isometry carriers and their induced maps are supplied by Tau Ceti. Bundle
`Isometry.discriminantBilinearIsometry` as `discriminantHom` and
`Isometry.discriminantQuadraticIsometry` as `discriminantQuadraticHom`.
The group instances `bilinearIsometryGroup` and `quadraticIsometryGroup` use composition
f · g = f ∘ g. Both maps carry this explicit nondegeneracy assumption.

API:
- Identity lattice isometries induce identity discriminant isometries.
- Composition and inverse commute with passage to the discriminant form.
- Forgetting the quadratic refinement recovers the bilinear action for an even lattice.

**Checks.**

- For Gram [8], the bilinear isometry group has four elements, but the quadratic group has two.
- For Gram [12], the quadratic group has four elements and the lattice image has two.
- A unimodular lattice has a one-element discriminant module and trivial action; its index is 1.
- On the discriminant of 2I₃, let f and g permute coordinates by (12) and (23).
  Then (f·g)(e₁/2) = e₂/2, but (g·f)(e₁/2) = e₃/2; both induced maps use this
  composition order. Identity fixes all eight classes and f² fixes each class.
  The quadratic value of each eᵢ/2 is 1/4, with polar self-pairing 1/2 modulo ℤ.

*Needs:* Tau Ceti Discriminant/Bilinear and Discriminant/Quadratic; IntegralLattices §§1C–1D, 1G.

### 7.5 The Festi–Veniani index

For nondegenerate L define `fvIndex L := (φ_L.range).index` in `O(D_L)`, prove it is a positive integer, an isometry
invariant, `1` when `A_L` is trivial (unimodular `L`), and `1` whenever `O(D_L) = {±1}` (since
`−1 ∈ O(L)` maps to `−1`), which covers `A₂` (`O(ℤ/3, q) = {±1}`). Prove the rank-one formula: for a lattice with a singleton integral basis of Gram entry
m ≥ 3, `O(⟨m⟩) = {±1}` maps onto `{±1} ⊂ (ℤ/m)^×`, and `O(D_⟨m⟩)` is `{u ∈ (ℤ/m)^× | u² ≡ 1 (mod m)}`
when `m` is odd (the lattice is odd; `b_L(x,y) = xy/m`) and `{u | u² ≡ 1 (mod 2m)}` when `m` is even
(the lattice is even; `q_L(x) = x²/(2m) mod ℤ`), so `fvIndex ⟨m⟩` is half the number of those `u`:
The Lean theorem `fvIndex_rankOne` uses that singleton basis and its Gram entry;
Tau Ceti's `rankOne m` instead has Gram entry 2m. In Gram-entry notation, `fvIndex ⟨5⟩ = fvIndex ⟨8⟩ = 1`, `fvIndex ⟨12⟩ = fvIndex ⟨15⟩ = 2`. Record that the bilinear and
quadratic groups differ: for `⟨8⟩` the group `O(ℤ/8, b)` has order `4` while `O(ℤ/8, q) = {±1}`, so
the index of an even lattice must be taken in the quadratic group as pinned. `fvIndex (L ⊕ M)` is
not a function of the two indices and no product formula is claimed. Cite Festi–Veniani, *Counting
elliptic fibrations on K3 surfaces*, for the role of the index.

API:

- The index is positive and isometry invariant on nondegenerate lattices.
- It is one for a unimodular lattice or when its discriminant-isometry group consists only of ±1.

**Checks.**

- For Gram [8], the generator e/8 has norm 1/8 and quadratic value 1/16 modulo ℤ.
  The condition u² = 1 modulo 16 leaves residues 1,7, so the index is 2/2 = 1;
  u = 3 has q(3e/8) = 9/16 ≠ 1/16 despite preserving the bilinear form.
- For Gram [12], the four residues 1,5,7,11 square to 1 modulo 24, so the index is 4/2 = 2.
- For Gram [15], residues 1,4,11,14 give index 2; native rankOne 15 instead has Gram [30] and is not the same input.

*Needs:* M `Subgroup.index`; T `IsPosDef.finite_isometry`; L 7.4.

### Examples

The local Checks above and the worked examples below fix the normalizations used in this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 7.1 | M `TensorProduct`, `LinearMap.BilinForm.tensorDistrib`, `Basis.tensorProduct`, `Matrix.det_kronecker`; T `ofIntegralForm`, `dualCarrier`; L 0.2 |
| 7.2 | T⁺ `PosDef.Reduction` (prose); L 1.1, 1.2, 7.1 |
| 7.3 | T `Isometry`, `determinant`; L 7.1, 7.2 |
| 7.4 | T `DiscriminantGroup`, `discriminantPairing`, `discriminantQuadraticMap`, `Isometry.discriminantGroupEquiv`, `FiniteBilinearModule.Isometry`; IL 1C, 1D, 1G |
| 7.5 | M `Subgroup.index`; T `IsPosDef.finite_isometry`; L 7.4 |

## Downstream consumers

The LMFDB geometric columns use the Gram dictionary of §§0.2 and 1.2: minimum and kissing
number are the native lattice invariants, shortest denotes the unordered normalized half
of the minimal vectors, and density and Hermite invariant have the normalizations of
§§1.4–1.5. A decimal value d with precision p denotes the inequality |d − value| < 10⁻ᵖ,
not equality to a floating-point number. The universality, design, perfection and tensor
results explain the corresponding mathematical predicates. Stored-column certificates
remain IntegralLattices §9A–9B's responsibility; no database procedure is a target here.

## Explicit scope exclusions

Beyond *Not owned here*: exact values of the covering constants Θₙ and the covering analogue of Voronoi's
theory; the kissing number problem for non-lattice arrangements and the lattice kissing maxima in
ranks `9`–`23`; dual-extreme theory beyond the definition of `γ'`; designs that are not shells of
lattices and the Delsarte–Goethals–Seidel bounds; harmonic theta series at level `N > 1`; the
enumeration of universal lattices beyond the two theorems; regular ternary forms; counterexamples
to tensor-minimum multiplicativity as constructions; the K3-surface applications of the
Festi–Veniani index. None of them replaces a milestone above.

## Worked examples (acceptance criteria)

The examples fix the Gram normalizations; the parenthesized LMFDB labels identify their intended records. Norms are `B(x,x)`;
`Δ` is the LMFDB `density`, `γ` the LMFDB `hermite`, `μ` the covering radius, `t` the exact
design strength of `S(L)`.

| Lattice (label) | `n`, `det`, `min`, `kiss`, `#Aut` | `δ`, `Δ`, `γ` | `μ`, `Θ` | perfect / eutactic / `t` | Milestones |
| --- | --- | --- | --- | --- | --- |
| `⟨2⟩` (`1.2.4.1.1`, the only rank-`1` record) | `1, 2, 2, 2, 2` | `1/2`, `1`, `1` | `√2/2`, `1` | yes / strongly / all `t` | 1.1–1.5, 2.3, 3.2, 4.1, 4.2 |
| `ℤ²` (`2.1.2.1.1`) | `2, 1, 1, 4, 8` | `1/4`, `π/4 ≈ 0.78540`, `1` | `√2/2`, `π/2` | **no** / strongly / `3` | 1.4, 1.5, 3.2, 4.1, 4.2, 5.3 |
| `A₂` (`2.3.3.1.1`) | `2, 3, 2, 6, 12` | `1/(2√3) ≈ 0.28868`, `π/√12 ≈ 0.90690`, `2/√3 ≈ 1.15470` | `√(2/3) ≈ 0.81650`, `2π/√27 ≈ 1.2092` | yes / strongly / `5` | 1.8, 2.3 (critical, `γ₂`), 3.2, 4.1, 4.2, 4.5, 5.3 |
| `ℤ³` (`3.1.2.1.1`) | `3, 1, 1, 6, 48` | `1/8`, `π/6 ≈ 0.52360`, `1` | `√3/2`, `π√3/2 ≈ 2.7207` | no / strongly / `3` | 1.4, 3.2, 4.2 |
| `A₃ = D₃` (`3.1.9.1.2`) | `3, 4, 2, 12, 48` | `1/(4√2) ≈ 0.17678`, `π/√18 ≈ 0.74048`, `2^{1/3} ≈ 1.25992` | `1`, `2π/3 ≈ 2.0944` | yes / strongly / `3` (not `4`) | 2.3 (critical, `γ₃`), 3.2, 4.1, 4.5, 5.3 |
| `A₃*` (bcc; `3.128.8.1.1`, Gram `[[6,−2,−2],[−2,6,−2],[−2,−2,6]]`, the dual of `A₃` with its bilinear form multiplied by 8 (lengths multiplied by √8)) | `3, 128, 6, 8, 48` | `3√3/32 ≈ 0.16238`, `π√3/8 ≈ 0.68017`, `6/128^{1/3} ≈ 1.19055` | `√10/2 ≈ 1.5811`, `5√5π/24 ≈ 1.4635` | **no** / strongly / `3` | 3.2, 4.1, 4.2 (eutactic, not perfect) |
| `⟨15⟩` (Gram `[[15]]`) and `⟨12⟩` | `1, 15, 15, 2, 2` and `1, 12, 12, 2, 2` | `1/2`, `1`, `1` | `√15/2`, `1` | yes / strongly / all `t` | 7.5 (`fvIndex = 2`: `O(ℤ/15, b) = {1,4,11,14}`, `O(ℤ/12, q) = {1,5,7,11}`, image `{±1}`) |
| `⟨5⟩` and `⟨8⟩` | `1, 5, 5, 2, 2` and `1, 8, 8, 2, 2` | `1/2`, `1`, `1` | — | yes / strongly / all `t` | 7.5 (`fvIndex = 1`; for `⟨8⟩` the bilinear group `O(ℤ/8, b)` has order `4` but `O(ℤ/8, q) = {±1}`) |
| `D₄` (`4.4.2.1.1`) | `4, 4, 2, 24, 1152` | `1/8`, `π²/16 ≈ 0.61685`, `√2 ≈ 1.41421` | `1`, `π²/4` | yes / strongly / `5` | 4.1, 4.5, 4.10 (critical, `γ₄`), 5.3 (strongly perfect) |
| `E₈` (`8.1.1.1.1`) | `8, 1, 2, 240, 696729600` | `1/16`, `π⁴/384 ≈ 0.25367`, `2` | `1`, `π⁴/24 ≈ 4.0587` | yes / strongly / `7` | 4.1, 4.5, 4.10–4.11 (critical, `γ₈`), 5.7, 7.5 (`fvIndex = 1`) |
| `E₈ ⊕ E₈` (IL 6D; no LMFDB record) | `16, 1, 2, 480, 2·696729600²` | `1/256`, `π⁸/(8!·256)`, `2` | — | **no** / strongly / `3` | 4.1 (orthogonal sums are never perfect), 5.7 (`r = 2`) |
| `Λ₂₄` (`24.1.1.24.1`) | `24, 1, 4, 196560, 8315553613086720000` | `1`, `π¹²/12! ≈ 0.0019296`, `4` | `√2`, `2¹² π¹²/12! ≈ 7.9035` | yes / strongly / `11` | 3.4, 4.11 (critical, `γ₂₄`), 5.7, 7.5 |
| `[[2,1],[1,3]]` | `2, 5, 2, 2, 4` | `1/(2√5)`, `π/(2√5) ≈ 0.70248`, `2/√5` | — | **no** / **not eutactic**, not well-rounded / — | 1.1 (`S = {±e₁}` does not span), 4.2 |
| `A₂ ⊗ A₂` | `4, 81, 4, 18, 144` | — | — | — | 7.1 (Kronecker Gram, `det = 3⁴`), 7.2 (`min = 2·2`; the `18` minimal vectors are the pure tensors `x ⊗ y`, `x, y ∈ S(A₂)`, with `x ⊗ y = (−x) ⊗ (−y)`), 7.3 (decomposable) |

For the bcc normalization, let A₃ = [[2,1,0],[1,2,1],[0,1,2]] and
U = [[−1,0,0],[−1,0,1],[0,−1,1]]. Then det U = −1 and Uᵀ(8A₃⁻¹)U
is the displayed bcc Gram matrix: determinant 8³/4 = 128 and minimum 8·(3/4) = 6.
Scaling the dual Gram by 2 would instead give determinant 2 and minimum 3/2.

Universality (Layer 6): `ℤ⁴` is universal (`Nat.sum_four_squares`); `ℤ³` has truant `7` and misses
`7, 15, 23, 28, 31, 39, 47, 55, 60, …`; `⟨1,1,2⟩` has truant `14`; `⟨1,2,5,5⟩` represents
`1, 2, 3, 5, 6, 7, 10, 14` and **not** `15` (its only miss below `2000`), so it is rejected by the
15 theorem's criterion and is the minimality witness for `15`; `⟨1,2,5,10⟩` represents the nine
critical numbers, hence is universal by 6.3 (and misses nothing below `300`); the half-norm form
`x² + xy + y²` of `A₂` has half-norm truant `2`. Hermite constants (2.3, 4.10): `γ₁ = 1`,
`γ₂ = 1.15470…`, `γ₃ = 1.25992…`, `γ₄ = 1.41421…`, `γ₅ = 8^{1/5} = 1.51572…`,
`γ₆ = (64/3)^{1/6} = 1.66537…`, `γ₇ = 64^{1/7} = 1.81144…`, `γ₈ = 2`, `γ₂₄ = 4`.

**Boundary checks.** `ℤ²` and `A₃*` are eutactic but not perfect; `[[2,1],[1,3]]` is neither and
is rejected by IsWellRounded; `E₈ ⊕ E₈` shows a sum of extreme forms is not extreme; `A₃` is
perfect and strongly eutactic but not a `4`-design, separating 5.3's "strongly perfect" from
"perfect and strongly eutactic"; the LMFDB record `2.3.6.1.1` (Gram `[[1,0],[0,3]]`, `min 1`,
`kiss 2`, `Δ ≈ 0.45345`, `γ ≈ 0.57735`) has `S = {±e₁}` and is rejected by 1.1 and 4.2.

## Ordering

```text
Layer 0 ──► Layer 1 ──► Layer 2 ──► Layer 4 ──► Layer 5
   │           │                      ▲
   │           ├──► Layer 3            │
   │           ├──► Layer 6            │
   │           └──► Layer 7 (7.1–7.3) ─┘ (7.2 needs 1.9 only for Kitaoka's route)
   └──► Layer 7 (7.4–7.5)
Layers 1–7 ──► downstream applications
```

Layer 0 first. Layers 3, 6 and 7 are independent of one another and of Layers 2, 4 and 5 once Layer
1 is in place, and can proceed in parallel. Layer 2 needs 1.7–1.8 and GoN 4.5.8; Layer 4 needs
Layer 2 for 4.3 and 4.10; Layer 1.9 consumes SM 1.1 and GoN 1.3; Layer 5 needs 4.1–4.5 for 5.3 and Theta Series
Layer 1 for 5.5–5.6. The downstream applications consume these results.

## References

- J. H. Conway, N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed., Springer 1999:
  Ch. 1 §1.1–1.5 (density, center density, Hermite constant table), Ch. 2 §1–2 (covering radius,
  Voronoi cells), Ch. 4 §§6–8 (`Dₙ`, `E₈`, covering radii), Ch. 21 §3 (Voronoi-relevant vectors),
  Ch. 23 (deep holes of the Leech lattice, covering radius `√2`).
- J. Martinet, *Perfect Lattices in Euclidean Spaces*, Grundlehren 327, Springer 2003: Ch. 2
  (Hermite's constant, Mordell's inequality, reduction), Ch. 3 §§3.1–3.5 (perfection, eutaxy,
  Voronoi's theorem, finiteness of perfect lattices), Ch. 7 (Voronoi's algorithm), Ch. 9 (eutactic
  lattices, Ash's finiteness), Ch. 16 (spherical designs, strongly perfect lattices).
- A. Schürmann, *Computational Geometry of Positive Definite Quadratic Forms*, Univ. Lecture Ser.
  48, AMS 2009: Ch. 2 (Minkowski reduction), Ch. 3 (the Ryshkov polyhedron, Voronoi's algorithm,
  perfect forms up to dimension 8).
- G. Voronoi, *Nouvelles applications des paramètres continus à la théorie des formes
  quadratiques, I*, J. Reine Angew. Math. 133 (1908), 97–178.
- J. W. S. Cassels, *An Introduction to the Geometry of Numbers*, Springer 1971: Ch. II, VIII, X.
- P. M. Gruber, C. G. Lekkerkerker, *Geometry of Numbers*, 2nd ed., North-Holland 1987, Ch. 2 §13
  (inhomogeneous minimum, Jarník's inequalities).
- B. Venkov, *Réseaux et designs sphériques*, in *Réseaux euclidiens, designs sphériques et formes
  modulaires*, Monogr. Enseign. Math. 37 (2001), 10–86: §3 (moment criterion), §6 (strongly
  perfect lattices), Theorem 16.1, p.59 (weighted theta modularity), Theorem 16.4, p.61 and equation (16.6), p.62 (extremal shells).
- E. M. Stein, G. Weiss, *Introduction to Fourier Analysis on Euclidean Spaces*, Princeton 1971,
  Ch. IV §2 and Thm. 3.4.
- H. Cohn, A. Kumar, *Optimality and uniqueness of the Leech lattice among lattices*, Ann. of
  Math. 170 (2009), 1003–1050. H. Cohn, N. Elkies, *New upper bounds on sphere packings I*, Ann.
  of Math. 157 (2003), 689–714. M. Viazovska, *The sphere packing problem in dimension 8*, Ann. of
  Math. 185 (2017), 991–1015. H. Cohn, A. Kumar, S. D. Miller, D. Radchenko, M. Viazovska, *The
  sphere packing problem in dimension 24*, Ann. of Math. 185 (2017), 1017–1033.
  `math-inc/Sphere-Packing-Lean` (Lean formalization of both).
- M. Dutour Sikirić, A. Schürmann, F. Vallentin, *Classification of eight-dimensional perfect
  forms*, arXiv:math/0609388v3, §1, pp.2–3, Table 1 and Theorem 1.1
  (version used here; the journal version is Electron. Res. Announc. AMS 13 (2007), 21–32).
- M. Bhargava, *On the Conway–Schneeberger fifteen theorem*, in *Quadratic Forms and Their
  Applications*, Contemp. Math. 272 (2000), 27–37. M. Bhargava, J. Hanke, *Universal quadratic
  forms and the 290-theorem*, institutional preprint, §§2–6 (the version used here).
- R. Coulangeon, G. Nebe, *The unreasonable effectiveness of the tensor product*,
  arXiv:1201.1832v1 (2012), §2, pp.2–3, especially the proof of Corollary 2.3 and Remark 2.4(1).
- Y. Kitaoka, *Arithmetic of Quadratic Forms*, Cambridge Tracts 106, 1993, Ch. 7 (tensor
  products of positive lattices).
- D. Festi, D. C. Veniani, *Counting elliptic fibrations on K3 surfaces*, J. Math. Soc. Japan
  (2023).
- J. Hanke, *Local densities and explicit bounds for representability by a quadratic form*,
  Duke Math. J. 124 (2004), 351–388.
- A. Ash, *On eutactic forms*, Canad. J. Math. 29 (1977), 1040–1054.
