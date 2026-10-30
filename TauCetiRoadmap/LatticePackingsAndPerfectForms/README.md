# Roadmap: lattice packings, perfect forms, and the geometric invariants of positive definite lattices

A positive definite integral lattice is a finitely generated free `ℤ`-module with a positive
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
to similarity but are not integral, and `γₙ` is a supremum over all forms. The LMFDB stores
*integral* lattices. The roadmap therefore has two carriers and one dictionary between them:

- a **form** is a real symmetric positive definite matrix `A : Matrix (Fin n) (Fin n) ℝ`, Mathlib's
  `Matrix.PosDef A`, acting on the fixed lattice `ℤⁿ ⊂ ℝⁿ` by `x ↦ xᵀAx`. The group `GL_n(ℤ)` acts by
  `A ↦ UᵀAU`, and *similarity* adds positive scaling. Every geometric invariant is defined on forms
  and proved invariant under similarity;
- a **lattice** is Tau Ceti's `TauCeti.IntegralLattice V` with `IsPosDef`, the carrier of both
  integral-lattices roadmaps. Its invariants are those of the Gram matrix `L.gramMatrix b` of any
  `ℤ`-basis `b`, proved independent of `b` by `GL_n(ℤ)`-invariance.

Metric statements about a form `A` (covering radius, Voronoi cell, designs on spheres) are made in
`FormSpace A`: the vector space `Fin n → ℝ` with the inner product `⟪x, y⟫ = xᵀAy`, in which `ℤⁿ` is a
full `ℤ`-lattice in Mathlib's sense (`IsZLattice ℝ`). This is the same real model the theta-series
roadmap builds for a rational lattice (`realModel`, its 2D), and milestone 0.4 identifies the two.

Suggested homes: `TauCeti/LinearAlgebra/QuadraticForm/PosDefForm/` for Layers 0–4 (forms,
densities, covering, perfect and eutactic forms, Voronoi's theorem and algorithm),
`TauCeti/LinearAlgebra/IntegralLattice/PosDef/Geometry/` for the lattice-side definitions and the
LMFDB columns (Layers 0, 1, 7, 8), `TauCeti/Analysis/SphericalDesign/` and
`TauCeti/NumberTheory/ThetaSeries/Harmonic/` for Layer 5, and
`TauCeti/NumberTheory/IntegralLattice/Universal/` for Layer 6.

## Prerequisites

Every milestone rests on Mathlib at the pin, on Tau Ceti at the pin, on an earlier milestone of
this roadmap, or on a cited milestone of one of the following roadmaps.

- [Integral quadratic forms and lattices](../IntegralLattices/README.md) (IL): 2A finiteness of
  bounded-norm sets, 2B minimum, shells, kissing number and representation numbers, 2C the
  automorphism group `O(L)` and its finiteness, 2D the covolume identity, 2E Minkowski's and
  Hermite's bounds, 2F integral successive minima, 2G Minkowski reduction and class finiteness;
  1B–1D the dual, the discriminant group `A_L`, `b_L` and `q_L`; 1G finite quadratic modules; 6C–6G
  the `E₈` lattice, the rank-16 pair, the Niemeier reference lattices and `|O(E₈)|`; 9A/9B the
  stored-column certificates. All of Layer 2 and most of Layer 1 are Tau Ceti library code (below).
- [Completed integral lattices](../../Completed/IntegralLattices/README.md): the carrier
  `TauCeti.IntegralLattice`, isometries, orthogonal sums, scaling, duals, discriminant forms, the
  rank-one and ADE lattices.
- [Theta series](../ThetaSeries/README.md): Layer 1 Poisson summation for a full lattice in a real
  inner product space, 2D the real model `realModel` of a positive definite rational lattice and the
  bridge, 2G shells and representation numbers of the real model, 8B `r_{E₈}(2) = 240` and 8D
  `r_Λ(4) = 196560` as corollaries of theta identities.
- [Niemeier glue data and explicit Leech constructions](../Rank24LatticeConstructions/README.md):
  Layer 6, the Leech lattice `Λ₂₄` with minimum `4` and no roots.
- [Successive minima and Minkowski's theorems](../SuccessiveMinima/README.md): 1.1 the real
  successive minima `successiveMin L K i` of a convex body with respect to a lattice, 2.1.4 and
  3.21 both halves of Minkowski's second theorem, 3.22 Minkowski's first theorem on the first
  minimum. Real successive minima are consumed from this roadmap and from nowhere else.
- [Geometry of numbers, quadratic forms and homogeneous arithmetic](../GeometryOfNumbersAndQuadraticArithmetic/README.md)
  (GoN): 4.4.1 `latticePackingRadius` and 4.4.2 `latticeCoveringRadius` of a full Euclidean lattice,
  4.5.1 compact star bodies and 4.5.2 Mahler's compactness theorem, 5.1 LLL-reduced bases.
- [Orthogonal Tamagawa comparison and lattice masses](../OrthogonalTamagawaAndLatticeMass/README.md):
  §4, the finite automorphism-group certificates for `E₈`, the rank-16 pair and the rank-24
  lattices, and the mass and class-number columns.
- [Modular forms](../ModularForms/README.md): the level-one graded ring and the dimensions of
  `M_k(SL₂(ℤ))` and `S_k(SL₂(ℤ))`, consumed in Layer 5 through Tau Ceti's
  `TauCeti.ModularForm.mvPolynomialEquivModularForms` and Mathlib's level-one dimension formula.

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
  consequences of the perfect-form enumeration, and `γ₂₄ = 4` (Layer 4).
- Voronoi cells, Voronoi-relevant vectors, the inhomogeneous minimum (covering radius) of a form,
  deep holes, the covering density, Jarník's inequalities, and the identification with GoN's
  `latticeCoveringRadius` of the realized lattice (Layer 3).
- Perfect, eutactic, strongly eutactic and extreme forms; Korkine–Zolotarev's bound; Voronoi's
  theorem; rationality and finiteness of perfect forms; the Ryshkov polyhedron and Voronoi's
  neighbouring algorithm; the enumeration certificates for ranks `≤ 8`; the finiteness of eutactic
  forms up to similarity (Layer 4).
- Spherical `t`-designs in a real inner product space, the moment criterion, design lattices,
  strongly perfect lattices, harmonic polynomials, theta series with harmonic coefficients and
  their modularity, Venkov's theorem (Layer 5).
- Universality, the truant, escalators, the escalation lemma, the 15 theorem and the 290 theorem
  (Layer 6).
- Tensor products of forms and lattices, their rank, determinant, definiteness and minimum,
  Kitaoka's theorem, tensor decomposability; the natural map `O(L) → O(D_L)` and the Festi–Veniani
  index (Layer 7).
- The semantic content of the LMFDB `minimum`, `kissing`, `shortest`, `density` and `hermite`
  columns as a certificate extending IL 9A (Layer 8).

### Consumed, not redefined

- **From Tau Ceti at the pin**, the declarations tabulated under *What Tau Ceti supplies*: the
  carrier and its Gram, norm, scaling and sum API; `minimum`, `kissingNumber`, `vectorsOfNorm`,
  `representationNumber` and their finiteness; the isometry group; the realization theory of
  `PosDef/Covolume`; the discriminant group and pairing; the rank-one and ADE lattices.
  Tau Ceti's `minimum` and `kissingNumber` **are** the LMFDB `minimum` and `kissing` columns;
  Layer 1 identifies them with the form-side definitions and adds no second minimum on the
  rational carrier.
- **From Tau Ceti beyond the pin**, cited by module path and consumed in prose, with no Lean
  declaration here: `TauCeti.IntegralLattice.successiveMinimum` and its API
  (`TauCeti.LinearAlgebra.IntegralLattice.PosDef.SuccessiveMinima`, IL 2F); Minkowski's second
  theorem with the explicit constant `cₙ = (4/π) Γ(n/2+1)^{2/n}`,
  `IsPosDef.prod_successiveMinimum_mul_pi_pow_le`, and Minkowski's bound on the minimum
  `IsPosDef.minimum_le_mul_determinant_rpow` (`…PosDef.Minkowski`, IL 2E); Hermite's inequality
  `IsPosDef.minimum_le_rpow_mul_determinant_rpow` for integral lattices and its sharpness at `A₂`,
  `minimum_typeARootLattice_two_eq_rpow_mul_determinant_rpow` (`…PosDef.Hermite`,
  `…RootLattice.TypeA.Hermite`, IL 2E); Minkowski-reduced bases `IsMinkowskiReduced`,
  `IsPosSemidef.exists_isMinkowskiReduced`, the reduction inequalities and the comparison
  `λᵢ ≤ β(bᵢ,bᵢ) ≤ (i!)² λᵢ` (`…PosDef.Reduction`), the reduced-Gram bounds
  `IsMinkowskiReduced.abs_gramMatrix_mul_pi_pow_le` (`…PosDef.ReducedGram`) and class finiteness
  `finite_of_pairwise_isEmpty_isometry` (`…PosDef.Classes`, IL 2G); the integral Hermite inequality
  on bilinear forms (`TauCeti.LinearAlgebra.BilinearForm.Hermite`); and
  `TauCeti.IntegralLattice.kissingNumber_typeE₈RootLattice : typeE₈RootLattice.kissingNumber = 240`
  (`…RootLattice.TypeE.Roots`, IL 6C).
- **From the theta-series roadmap**: `poissonSummation`, `gaussian`, `fourier_gaussian` (Layer 1);
  `RealSpace M`, `realModel M`, `ratModel`, the invariant comparisons of 2D; `shell`, `repNum` and
  `ncard_vectorsOfNorm_ratModel` (2G); the theta identities `Θ_{E₈} = E₄` and `Θ_Λ = E₄³ − 720Δ`
  with their corollaries `r_{E₈}(2) = 240` (8B) and `r_Λ(4) = 196560` (8D). Layer 5 here builds
  theta series *with harmonic coefficients*, which that roadmap explicitly leaves out; the scalar
  theta series is never redefined.
- **From Successive Minima** (cited by milestone, no Lean declaration here): `successiveMin L K i` (1.1),
  `minkowski_second_lower` (2.1.4), `minkowski_second_upper` (3.21), 3.22. Milestone 1.2 proves
  `min A = successiveMin (ℤⁿ) (closedBall 0 1) 0 ^ 2` in `FormSpace A`.
- **From GoN** (cited by milestone, no Lean declaration here): `latticePackingRadius` (4.4.1),
  `latticeCoveringRadius` (4.4.2), `CompactStarBody`, `criticalDeterminant`, `mahler_compactness`
  (4.5.1–4.5.2), `IsLLLReduced`, `lll_short_vector_factor` (5.1.2, 5.1.4). Milestones 1.4 and 3.3
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
  classes, `mass`); IL 9B is the certificate shape and is consumed by Layer 8 unchanged.
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
- **The sphere packing problem for non-lattice packings** and the Cohn–Elkies linear programming
  bound. `γ₈ = 2` and `γ₂₄ = 4` are stated here as theorems about *lattices* with cited proofs;
  `math-inc/Sphere-Packing-Lean` is the migration source named in 4.11.
- **Label components beyond the intrinsic prefix, orderings fixed by convention, stored lists, and
  the completeness of database tables** are not targets: the lattice label's enumerative index, the
  order of the `shortest` list, and the stored genus representatives. The intrinsic prefix
  `dim.det.level.class_number` is IL's (rank, determinant, level) and Orthogonal Tamagawa's (class
  number); this roadmap contributes no label component.
- **Root systems, Weyl groups and the ADE classification**:
  [Root Systems](../RepresentationTheory/RootSystems/README.md). A root here is a vector of norm
  `2`, as in IL.

## Pinned conventions

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
`π/√12 ≈ 0.90690`, the Leech lattice has `V₂₄ = π¹²/12! ≈ 0.0019296`. ⚠ The LMFDB knowl
`lattice.density` writes "minimum `2ρ`"; read literally, with the minimum a norm, that gives
`π⁴/24 > 1` for `E₈`. The stored values use `ρ = √(min)/2`, and so does this roadmap.

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
on the sphere `S(r) = sphere 0 r` is `σ_r = (toSphere volume).map (· * r)` divided by its total
mass, where `toSphere` is Mathlib's `MeasureTheory.Measure.toSphere`. A finite nonempty
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

## What Mathlib supplies

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
| `SchwartzMap.fourierTransformCLM` | `Mathlib/Analysis/Distribution/FourierSchwartz.lean` | 5.5 |
| `ModularForm`, `CuspForm`, `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `CuspForm.rank_eq_one_of_weight_eq_twelve`, `ModularForm.levelOne_odd_weight_eq_zero`, `discriminantEquiv` | `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean` | 5.6, 5.7 |
| `Nat.sum_four_squares` | `Mathlib/NumberTheory/SumFourSquares.lean` | 6.1, 9 (examples) |
| `TensorProduct`, `LinearMap.BilinForm.tensorDistrib`, `tensorDistrib_tmul`, `Basis.tensorProduct` | `Mathlib/LinearAlgebra/BilinearForm/TensorProduct.lean`, `Mathlib/LinearAlgebra/TensorProduct/Basis.lean` | 7.1 |
| `Matrix.kronecker`, `Matrix.det_kronecker`, `Matrix.kroneckerMap` | `Mathlib/LinearAlgebra/Matrix/Kronecker.lean` | 7.1, 7.2 |
| `Subgroup.index`, `MonoidHom.range`, `AddAut` | `Mathlib/GroupTheory/Index.lean` | 7.5 |

Two limits of the Mathlib API shape the roadmap. First, Mathlib has no polynomial functions on an
abstract inner product space and no harmonic polynomials; 5.1 and 5.4 build both from
`MvPolynomial` and `pderiv`, using an orthonormal basis to transport. Second, Mathlib's level-one
dimension formula gives `S_k(SL₂(ℤ)) = 0` for `k < 12` and `dim S₁₂ = 1`, and the general
`dim M_k` through `discriminantEquiv` and Tau Ceti's graded ring; Layer 5 uses exactly these.

## What Tau Ceti supplies

| Declarations | Location | Consumed by |
| --- | --- | --- |
| `IntegralLattice`, `gramMatrix`, `determinant`, `discriminant`, `ofGramMatrix`, `ofGramMatrix.basis`, `Isometry.ofGramMatrixEq`, `IsPosDef`, `scale`, `orthogonalSum` | `TauCeti/LinearAlgebra/IntegralLattice/{Basic,Gram,Signature,Scaling,Orthogonal/Sum}.lean` | 0.2, 0.5, 7.1 |
| `norm`, `integralNorm`, `vectorsOfNorm`, `representationNumber`, `minimum`, `kissingNumber`, `IsPosDef.finite_vectorsOfNorm`, `IsPosSemidef.isLeast_minimum`, `IsPosDef.minimum_pos`, `TauCeti.IntegralLattice.kissingNumber_eq_representationNumber`, `Isometry.minimum_eq`, `Isometry.kissingNumber_eq` | `…/Norm.lean`, `…/PosDef/{Finite,RepresentationNumber,Minimum}.lean` | 1.2, 1.3, 6.1, 8.1 |
| `Isometry`, `Isometry L L` as a group, `Isometry.det`, `specialOrthogonalGroup`, `IsPosDef.finite_isometry`, `Isometry.dualCarrierEquiv`, `Isometry.discriminantGroupEquiv` | `…/Isometry/{Basic,Group}.lean`, `…/Dual/Basic.lean`, `…/Discriminant/Group.lean` | 7.5, 7.6 |
| realizations: `gram_comp_eq_map_gramMatrix`, `discreteTopology_range`, `covolume_range_sq_eq_determinant` | `…/PosDef/Covolume.lean` | 0.3, 1.5 |
| `dualCarrier`, `DiscriminantGroup`, `discriminantPairing`, `discriminantQuadraticMap` | `…/Dual/Basic.lean`, `…/Discriminant/{Group,Bilinear,Quadratic}.lean` | 7.5 |
| `FiniteBilinearModule.Isometry` and the finite quadratic modules of Completed IL Layer 3 | `TauCeti/LinearAlgebra/FiniteBilinearModule/` | 7.5 |
| `rankOne`, `typeARootLattice`, `checkerboardLattice`, `typeE₈RootLattice`, `d8PlusLattice` | `…/RankOne.lean`, `…/RootLattice/` | 9 (examples) |
| `TauCeti.ModularForm.mvPolynomialEquivModularForms`, the level-one graded ring | `TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.lean` | 5.6 |
| `TauCeti.IntegralLattice.successiveMinimum`, Minkowski's theorems, Hermite's inequality, Minkowski reduction, reduced-Gram bounds, class finiteness, `TauCeti.IntegralLattice.kissingNumber_typeE₈RootLattice` | Tau Ceti beyond the pin, under `TauCeti/LinearAlgebra/IntegralLattice/PosDef/{SuccessiveMinima,Minkowski,Hermite,Reduction,ReducedGram,Classes}.lean` and `…/RootLattice/TypeE/Roots.lean`; cited in prose only | 1.6, 2.3, 4.8, 4.9, 9 |

## What is missing

Nothing under *Owned here* exists in Mathlib, in Tau Ceti, or as a target of another roadmap:
not the form carrier, the minimum of a *real* form, the densities, the Hermite constant, Voronoi
cells and the inhomogeneous minimum, perfection and eutaxy, spherical designs and harmonic theta
series, universality, tensor products of lattices, nor the Festi–Veniani index. Every one is a
milestone below.

---

## The build, in layers

Milestones are numbered `N.M` and may rest only on Mathlib, Tau Ceti at the pin, a cited supplier
milestone, or an earlier milestone of this roadmap. Each layer ends with its dependency table,
where **M** is Mathlib, **T** Tau Ceti at the pin, **T⁺** Tau Ceti beyond the pin (prose only),
**IL**, **TS**, **SM**, **GoN**, **OT**, **R24** the roadmaps of *Prerequisites*, and **L** this
roadmap.

`Suggested.lean` states the definitions and headline theorems that can be written over Mathlib and
the pinned Tau Ceti, each docstring naming its milestone. A milestone with no declaration there is
specified in this README only. In particular the tensor product of lattices (7.1) has no Lean
declaration, and neither has anything stated about it in 7.1–7.3; those three milestones give the
definition in prose and end with **Checks**, the tests a formalisation must pass.

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
similarity class containing an integral form contains exactly one primitive integral form up to
`GL_n(ℤ)` (this is the knowl `lattice.similarity`'s last sentence).

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
`f (gramForm hL b)` for any `b` (`descend`). Every lattice-side invariant below is `descend` of its
form-side version, and the roadmap never defines an invariant twice.

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

### 0.4 The real model of a rational lattice

For `hL : L.IsPosDef` and a basis `b`, construct the linear isometry
`FormSpace (gramForm hL b) ≃ₗᵢ[ℝ] TS.RealSpace L` carrying `stdLattice` onto `TS.realModel L`.
This is the only comparison between the two real models; afterwards every metric statement about
`L` is made in `FormSpace (gramForm hL b)` and is independent of `b` by 0.3. Prove the three
counts agree: `(stdLattice A ∩ sphere 0 √t)` is `TS.shell (realModel L) t` under the isometry, and
both are Tau Ceti's `vectorsOfNorm L t` in cardinality (TS 2G `ncard_vectorsOfNorm_ratModel`).

### 0.5 Basic API

Scaling: `(c • A)[x] = c · A[x]`, `det (c • A) = cⁿ det A`. Orthogonal sums (block diagonal):
`(A ⊕ B)[(x, y)] = A[x] + B[y]`, `det (A ⊕ B) = det A · det B`, and `U ⊕ U'` acts as `U` on the first
block and `U'` on the second. Dual form `A⁻¹`:
`A⁻¹ ∈ PosDefForm n`, `det A⁻¹ = (det A)⁻¹`, `(U • A)⁻¹ = U⁻¹ • A⁻¹`, and `stdLattice (A⁻¹)`
corresponds to `(stdLattice A)^∨` (TS 2A) under `x ↦ A x`.

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
`{x ∈ ℤⁿ | A[x] ≤ C}` is finite for every `C` (it is `stdLattice A ∩ closedBall 0 √C`, finite by
`ZSpan.setFinite_inter` through 0.3), so the infimum is attained, `min A > 0`, `S(A)` is finite,
nonempty and closed under negation, and `A[x] ≥ min A` for all `x ≠ 0`. Prove `GL_n(ℤ)`-invariance
`min (U • A) = min A`, `S(U • A) = U⁻¹ S(A)`, the scaling law `min (c • A) = c · min A`,
`S(c • A) = S(A)`, and the orthogonal-sum law (0.5): `min (A ⊕ B) = min (min A) (min B)` and
`S(A ⊕ B) = S(A) × {0} ∪ {0} × S(B)` when `min A = min B`, one side when they differ (rank `≥ 1`
on both sides). Define the kissing number
`kiss A := #S(A)` and `S⁺(A)`, prove `#S(A) = 2 #S⁺(A)`, and record that `S⁺` is not
`GL_n(ℤ)`-equivariant. Define `IsWellRounded A`
(`span_ℝ S(A) = ⊤`), `IsGeneratedByMinimalVectors A` (`span_ℤ S(A) = ⊤`), and
`IsStronglyWellRounded A` (some `ℤ`-basis of `ℤⁿ` lies in `S(A)`), prove the implications strongly
well-rounded ⇒ generated by minimal vectors ⇒ well-rounded, and prove the three are
`GL_n(ℤ)`- and scaling-invariant. The strictness claims of the knowl (ranks `≥ 5` and `≥ 10`) are
witnessed in 9 by cited examples, not proved as general theorems here.

### 1.2 Identification with Tau Ceti's minimum and kissing number

For `hL : L.IsPosDef` and a basis `b`, prove `(L.minimum : ℝ) = min (gramForm hL b)`,
`L.kissingNumber = kiss (gramForm hL b)`, and that `b.repr` carries
`L.vectorsOfNorm L.minimum \ {0}` bijectively onto `S(gramForm hL b)`. Prove
`min (gramForm hL b) = (SM.successiveMin (stdLattice A) (closedBall 0 1) 0)²`: the first real
successive minimum of the unit ball is the least length, and the minimum here is its square.
Afterwards the LMFDB `minimum` and `kissing` columns are Tau Ceti's `minimum` and `kissingNumber`
*by definition*, and every form-side theorem about them transports.

### 1.3 Normalized minimal vectors

Define `IsNormalized x` for `x : Fin n → ℤ` (the first nonzero coordinate is positive), prove that
exactly one of `x`, `−x` is normalized for `x ≠ 0`, that `S⁺(A) = {x ∈ S(A) | IsNormalized x}`, and
that `S⁺(A)` is a finite set of cardinality `kiss A / 2`. This is the content of the LMFDB
`shortest` column for the stored Gram matrix; the ordering of the stored list is not a target.

### 1.4 Packing radius, center density, density

Define `packingRadius A := √(min A) / 2`, `centerDensity A := packingRadius Aⁿ / √(det A)` and
`density A := Vₙ · centerDensity A` with `Vₙ := π^{n/2} / Γ(n/2 + 1)`. Prove: `Vₙ` is the volume of
the unit ball of any `n`-dimensional real inner product space (`InnerProductSpace.volume_ball`),
with `V₁ = 2`, `V₂ = π`, `V₃ = 4π/3`, `V₄ = π²/2`, `V₈ = π⁴/24`, `V₂₄ = π¹²/12!`; both densities
are similarity invariants. Prove that the open balls of radius
`packingRadius A` about the points of `stdLattice A` are pairwise disjoint and fill the fraction
`density A` of a fundamental domain `F`: `volume (⋃_v ball v ρ ∩ F) / volume F = density A`. Prove
`packingRadius A = GoN.latticePackingRadius (stdLattice A)` (GoN 4.4.1) and
`0 < density A ≤ 1`, the upper bound by the disjointness and the fundamental-domain computation.

### 1.5 The covolume and the Hermite invariant

Define `hermite A := min A / (det A)^{1/n}` (`Real.rpow`), prove its similarity invariance and
`centerDensity A = (hermite A / 4)^{n/2}`, `density A = Vₙ (hermite A / 4)^{n/2}`, so that maximizing
any of `γ`, `δ`, `Δ` over forms of a fixed rank is the same problem. Define the Bergé–Martinet
invariant `γ'(A) := √(hermite A · hermite A⁻¹)`, a similarity invariant with `γ'(A) ≤ γₙ` once 2.1
defines `γₙ`; its own extremal theory is not a milestone here. Prove the lattice-side `hermite_L = L.minimum / (L.determinant)^{1/n}` by `descend`.

### 1.6 Comparison with the integral theory

Record that `T⁺`'s Hermite and Minkowski bounds for `L.minimum` are the integral cases of 1.7
and 1.8, and that `successiveMinimum L 0 = L.minimum`. No declaration here restates them; 1.7 and
1.8 are the real-form versions those modules do not cover.

### 1.7 Minkowski's bound for real forms

Prove `min A ≤ (4/π) Γ(n/2+1)^{2/n} (det A)^{1/n}`, equivalently `(min A)ⁿ Vₙ ≤ 2ⁿ √(det A)`, by
Minkowski's convex body theorem applied to the ball of radius `√(min A)` in `FormSpace A`: an open
ball of volume `> 2ⁿ covolume` contains a nonzero lattice point, and the open ball of radius
`√(min A)` contains none. Deduce `hermite A ≤ (4/π) Γ(n/2+1)^{2/n}` and `density A ≤ 1` again.

### 1.8 Hermite's inequality for real forms

Prove `min A ≤ (4/3)^{(n−1)/2} (det A)^{1/n}` for `n ≥ 1` by Hermite's induction on `n`, following
`T⁺`'s `TauCeti.LinearAlgebra.BilinearForm.Hermite` with the integrality dropped: a minimal vector
is primitive, extends to a basis, and the form induced on the orthogonal projection has
determinant `det A / min A` and minimum `≥ (3/4) min A`. Hence `hermite A ≤ (4/3)^{(n−1)/2}`, and
`sup_A hermite A` is finite. Prove equality for `A₂ = [[2,1],[1,2]]`: `hermite A₂ = 2/√3`.

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

## Layer 2: the Hermite constant

### 2.1 Definition, finiteness, monotonicity

Define `hermiteConstant n := sSup (Set.range (hermite : PosDefForm n → ℝ))` for `n ≥ 1`, and
`hermiteConstant 0 := 1`. Prove the range is bounded above by `(4/3)^{(n−1)/2}` (1.8) and below by
`1` (`ℤⁿ`), so `1 ≤ γₙ ≤ (4/3)^{(n−1)/2}` and also `γₙ ≤ (4/π) Γ(n/2+1)^{2/n}` (1.7). Prove
Mordell's inequality `γₙ^{n−2} ≤ γ_{n−1}^{n−1}` for `n ≥ 2` (the form induced on the dual's
projection; Martinet, Ch. 2, §2.3) and the dual relation `γ(A) γ(A⁻¹) ≤ γₙ²`. Define the *critical*
forms as those with `hermite A = γₙ`.

### 2.2 Attainment

Prove that `γₙ` is attained: the set of forms with `det A = 1` and `min A ≥ γₙ − ε` is, modulo
`GL_n(ℤ)`, contained in a compact set of Minkowski-reduced forms, by GoN's `mahler_compactness`
(4.5.2) applied to `stdLattice A` in `FormSpace A`, so a maximizing sequence has a convergent
subsequence after reduction and `min` is continuous on `PosDefForm n`. State separately the two
continuity facts used: `min` is continuous on `PosDefForm n`, and `det` is. Prove that a critical
form is extreme in the sense of 4.3 (a global maximum is a local one).

### 2.3 The values in ranks one, two and three

Prove `γ₁ = 1` (every form is `(a)`, `min = a = det`). Prove `γ₂ = (4/3)^{1/2}`: Hermite's bound
(1.8) gives `≤`, and `A₂` gives `≥`. Prove `γ₃ = 2^{1/3}` by Gauss's reduction argument: a
Minkowski-reduced ternary form `[[a,·,·],[·,b,·],[·,·,c]]` with `a ≤ b ≤ c`, `2|a_{ij}| ≤ a_{ii}`,
satisfies `det ≥ abc/2`, so `min³ = a³ ≤ abc ≤ 2 det`, with equality for
`A₃ = [[2,1,0],[1,2,1],[0,1,2]]` of determinant `4` and minimum `2`. Minkowski reduction for real
forms in rank `3` is proved inside this milestone (existence by the finiteness of 1.1, one index at
a time); the general real reduction theory is 4.8. Record that the critical forms are `ℤ`, `A₂`,
`A₃` up to similarity in these ranks, with uniqueness in ranks `1` and `2` proved here and
uniqueness in rank `3` proved in 4.10 from the perfect-form enumeration.

| Milestone | Direct prerequisites |
| --- | --- |
| 2.1 | M `sSup`, `Real.rpow`; L 0.5, 1.5, 1.7, 1.8 |
| 2.2 | GoN 4.5.1, 4.5.2; M `IsCompact.exists_isMaxOn`; L 0.3, 1.1, 2.1 |
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

### 3.2 The inhomogeneous minimum, deep holes

Define `coveringRadius A := sSup {Metric.infDist x (stdLattice A) | x : FormSpace A}`; prove the
supremum is attained on `voronoiCell A`, at a vertex of the cell, so
`coveringRadius A = max_{x ∈ vertices} √(A[x])`, and that it is positive in rank `≥ 1`. Define
`IsDeepHole A x :↔ Metric.infDist x (stdLattice A) = coveringRadius A`, prove deep holes exist
and are vertices of Voronoi cells, and that `packingRadius A ≤ coveringRadius A`, with equality exactly in
rank `1` (in rank `≥ 2` the packing balls have density `< 1` by 1.4 and 1.7, so they do not cover). Prove `coveringRadius (c • A) = √c · coveringRadius A` and `GL_n(ℤ)`-invariance. Define
`coveringDensity A := Vₙ coveringRadius Aⁿ / √(det A)` and prove `coveringDensity A ≥ 1` (the
closed balls of radius `μ` cover a fundamental domain).

### 3.3 Identification with GoN

Prove `coveringRadius A = GoN.latticeCoveringRadius (stdLattice A)` (GoN 4.4.2) and record that
GoN's attainment lemma is 3.2's attainment read in the real model. Prove Jarník's inequalities
`λₙ/2 ≤ coveringRadius A ≤ (∑ᵢ λᵢ)/2 ≤ n λₙ/2` with `λᵢ = SM.successiveMin (stdLattice A)
(closedBall 0 1) i` (Gruber–Lekkerkerker, Ch. 2, §13; the knowl `lattice.covering_radius`
states them). The upper bound uses the basis of controlled gauge of
[Heights and units](../HeightsAndUnits/README.md) 2.1 (`ZLattice.exists_basis_gauge_le`, Tau Ceti).

### 3.4 Covering values and the covering constant

Prove the covering radii of the coordinate examples of 9 (`ℤⁿ`: `√n/2`; `A₂`: `√(2/3)`; `A₃`,
`D₄`, `E₈` with minimum `2`: `1`; `Λ₂₄` with minimum `4`: `√2`, the last by citing
Conway–Parker–Sloane, Conway–Sloane Ch. 23, as a theorem whose proof is the classification of the
deep holes and is not a milestone here). Define the lattice covering constant
`Θₙ := sInf {coveringDensity A | A}` and prove `Θₙ ≥ 1`; its values are excluded (see *Explicit
scope exclusions*).

| Milestone | Direct prerequisites |
| --- | --- |
| 3.1 | M `Convex`, `IsCompact`, `IsAddFundamentalDomain`, `ZLattice.covolume`; L 0.3, 1.1 |
| 3.2 | M `Metric.infDist`, `IsCompact.exists_isMaxOn`, `InnerProductSpace.volume_ball`; L 1.4, 3.1 |
| 3.3 | GoN 4.4.2; SM 1.1; T `ZLattice.exists_basis_gauge_le`; L 3.2 |
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
linear system with integer coefficients), so every perfect form is similar to a primitive
integral form (0.1). Prove `ℤⁿ` is perfect only for `n = 1` and that `A₂`, `A₃`, `D₄`, `E₈` are
perfect by exhibiting `n(n+1)/2` independent `x xᵀ`.

### 4.2 Eutaxy

Define `IsEutactic A :↔ ∃ c : S(A) → ℝ, (∀ x, 0 < c x) ∧ A⁻¹ = ∑_x c x • vecMulVec x x`, and
`IsStronglyEutactic A :↔ ∃ c > 0, A⁻¹ = c • ∑_{x ∈ S(A)} vecMulVec x x`; *semi-eutactic* has
`c x ≥ 0`. Prove similarity invariance (the coefficients rescale by `c⁻¹` under `c • A`), that
eutactic implies well-rounded (a `v ⊥_A S(A)` would give `⟪v, v⟫_A = ∑ c_x ⟪v, x⟫_A² = 0`), the
trace identity `n = ∑_x c_x · min A` (take the trace of `A · A⁻¹`), so for strongly eutactic `A`
the coefficient is `c = n / (kiss A · min A)`, and the inner-product form of the definition
`⟪v,v⟫_A = ∑ c_x ⟪v,x⟫_A²` for all `v`. Prove `ℤⁿ`, `A₂`, `A₃`, `D₄`, `E₈` strongly eutactic (their
automorphism groups act irreducibly, which is the criterion of 4.4), and that `[[2,1],[1,3]]` is
not eutactic (`S = {±e₁}` does not span).

### 4.3 Extreme forms

Define `IsExtreme A :↔ IsLocalMax hermite A` in `PosDefForm n`. Prove it is a similarity
invariant and that it is equivalent to `IsLocalMax centerDensity A` and to a local maximum of
`min` on the hypersurface `det = det A` (1.5). Prove that a critical form (2.1) is extreme.

### 4.4 Automorphisms and eutaxy

Define `Aut A := {U ∈ GL_n(ℤ) | Uᵀ A U = A}`, a finite group (it permutes the finite set `S(A)`
and `S(A)` spans when `A` is well-rounded; for a general `A` use Tau Ceti's
`IsPosDef.finite_isometry` through 0.2 when `A` is integral and the same finiteness argument on a
spanning finite shell otherwise). Prove `Aut (gramForm hL b) ≅ Isometry L L` (IL 2C) for integral
forms. Prove: if `Aut A` acts irreducibly on `ℝⁿ` then `A` is strongly eutactic (the matrix
`∑_{x ∈ S(A)} x xᵀ` commutes with the action and is a multiple of `A⁻¹` by Schur's lemma), and
`∑_{x ∈ S(A)} ⟪v, x⟫_A² = (kiss A · min A / n) ⟪v, v⟫_A` for all `v`.

### 4.5 Voronoi's theorem

Prove **extreme ⇔ perfect ∧ eutactic** (Voronoi 1908; Martinet, Ch. 3, §3.4; Schürmann, Ch. 3):
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

### 4.6 Finiteness of perfect forms up to similarity

Prove that the perfect forms of rank `n` fall into finitely many similarity classes. Route: by 4.1
every perfect form is similar to a primitive integral form, and `S(A)` determines `A` up to the
scalar; so it suffices to bound the possible sets `S(A)`. For a Minkowski-reduced basis (4.8) the
coordinates of a minimal vector are bounded by a constant that is a function of `n` alone (4.8), hence
`S(A) ⊆ [−Cₙ, Cₙ]ⁿ`, finitely many subsets, each determining at most one perfect form with
`min = 1`. Record the counts `1, 1, 1, 2, 3, 7, 33, 10916` for `n = 1, …, 8` as the content of the
certificates of 4.10, not as a theorem of this milestone.

### 4.7 Finiteness of eutactic forms up to similarity

Prove that the eutactic forms of rank `n` fall into finitely many similarity classes (Ash 1977;
Bergé–Martinet; Martinet, Ch. 9). Prerequisites made explicit: eutaxy is the condition that `A⁻¹`
lies in the cone of the `x xᵀ`, the first-order (Karush–Kuhn–Tucker) condition for `A` to be a
critical point of `hermite` on `det = 1` (4.5's analysis); well-rounded forms with `det = 1` are
compact modulo `GL_n(ℤ)` (GoN 4.5.2, as in 2.2); and on each stratum `{A | S(A) = S}` the critical
points are isolated. The knowl `lattice.eutactic` quotes this theorem.

### 4.8 Minkowski reduction for real forms

Define `IsMinkowskiReduced A` for a form (the standard basis `e₁, …, eₙ` satisfies: `A[eᵢ] ≤ A[x]`
for every `x ∈ ℤⁿ` such that `e₁, …, e_{i−1}, x` extends to a basis), prove every `GL_n(ℤ)`-orbit
contains a reduced form (greedy choice, each step a minimum over a set made finite by 1.1), the
inequalities `A₁₁ ≤ A₂₂ ≤ ⋯`, `2|Aᵢⱼ| ≤ Aᵢᵢ`, the comparison `λᵢ² ≤ Aᵢᵢ ≤ (i!)² λᵢ²` with the real
successive minima `λᵢ` of the unit ball (SM 1.1; they are lengths, so they enter squared) and the
bound `∏ Aᵢᵢ ≤ (∏ i!)² cₙⁿ det A` (SM 3.21). The integral case is
`T⁺`'s `PosDef.Reduction`/`PosDef.ReducedGram` (Schürmann, Ch. 2), with the same proofs. Deduce the **coordinate bound**: for reduced
`A` and `x ∈ S(A)`, `|xᵢ| ≤ Cₙ` with an explicit `Cₙ` (induction from the top coordinate through the
Gram–Schmidt coefficients, which are bounded by `(∏ i!)² cₙⁿ`), and that the reduced forms with
`det A = 1` form a compact set whose `GL_n(ℤ)`-saturation is everything.

### 4.9 The Ryshkov polyhedron and Voronoi's algorithm

Define the Ryshkov polyhedron `𝓡ₙ := {A ∈ Sym_n(ℝ) | ∀ x ∈ ℤⁿ ∖ 0, A[x] ≥ 1}`, prove it is a
closed convex subset of the positive definite cone, locally finite as an intersection of half-spaces
(near any `A ∈ 𝓡ₙ` only finitely many `x` have `A[x] ≤ 1 + ε`, by 1.1 and continuity), and that its
vertices are exactly the perfect forms with `min = 1` (4.1: `A` is a vertex iff the active
constraints `{x | A[x] = 1} = S(A)` have `x xᵀ` spanning `Sym_n`). Define the Voronoi domain of a
perfect `P` as `cone{x xᵀ | x ∈ S(P)}`, prove the domains tile the rational closure of the
positive definite cone (Voronoi; Schürmann, Ch. 3). Define a *facet normal* of `P` as a symmetric
`N` with `N[x] ≥ 0` for all `x ∈ S(P)` whose zero set `{x ∈ S(P) | N[x] = 0}` has `x xᵀ` spanning a
hyperplane of `Sym_n` (`IsFacetNormal P N`; the facets of the Voronoi domain, finitely many up to
positive scaling), and the *neighbour across `N`* as `voronoiNeighbour P N := P + ρ N` with
`ρ = sup {t ≥ 0 | min (P + tN) = 1}`; prove `ρ` is finite and positive, that the neighbour is
perfect with `min = 1` and its domain shares the facet, and that the neighbour across the
shared facet of `voronoiNeighbour P N` is `P` again. Prove the neighbour graph is connected with
finitely many `GL_n(ℤ)`-orbits (4.6). The algorithm as a procedure is not a milestone.

### 4.10 The enumeration certificates and `γ₄, …, γ₈`

Define `PerfectFormCertificate n`: a finite list of primitive integral forms `P₁, …, P_k` of rank
`n`, each with a proof `IsPerfect Pᵢ` (4.1, decidable: a rank computation), a proof that they are
pairwise not `GL_n(ℤ)`-equivalent (Tau Ceti's finite isometry test through 0.2), and for each `Pᵢ` a
proof that for every facet normal `N` of `Pᵢ` (4.9: finitely many up to scaling, computed from the
facets of its Voronoi domain) the neighbour `voronoiNeighbour Pᵢ N` is similar to some `Pⱼ`. The
certificate never quantifies over perfect forms outside the list. Prove the **completeness theorem**: a certificate's
list meets every similarity class of perfect forms of rank `n` (connectedness of the neighbour
graph, 4.9). Prove the corollary `γₙ = max_i hermite Pᵢ` (a critical form is extreme, 4.3, hence
perfect, 4.5, hence similar to some `Pᵢ`). The certificates for `n = 4, 5` (`D₄`; `D₅` and `A₅`,
`A₅³`), `n = 6` (Barnes), `n = 7` (Jaquet-Chiffelle) and `n = 8` (Dutour Sikirić–Schürmann–Vallentin,
`10916` forms) are finite data; the roadmap asks for the certificate *interface* and its
completeness theorem, for the rank-`4` and rank-`5` certificates as discharged instances (`2`
and `3` forms), and states `γ₄⁴ = 4`, `γ₅⁵ = 8`, `γ₆⁶ = 64/3`, `γ₇⁷ = 64`, `γ₈⁸ = 256` as theorems
whose proofs are the certificates for `n = 6, 7, 8` checked against the stored lists. Uniqueness
of the critical form in rank `3` (`A₃`) and ranks `4`–`8` (`D₄, D₅, E₆, E₇, E₈`) follows from the
same certificates.

### 4.11 `γ₂₄ = 4`, and the two sphere-packing theorems as citations

State `γ₂₄ = 4`, attained by the Leech lattice (`min = 4`, `det = 1`; R24 Layer 6), as a theorem
with the cited proof of Cohn–Kumar (*Optimality and uniqueness of the Leech lattice among
lattices*, Ann. of Math. 170 (2009)), which uses the Cohn–Elkies linear programming bound and is not
reproduced in this portfolio; its hypotheses-free statement is what Layer 8 and the LMFDB
`24.1.1.24.1` record consume. `γ₈ = 2` and `γ₂₄ = 4` are also the lattice cases of
Viazovska's and Cohn–Kumar–Miller–Radchenko–Viazovska's theorems, formalized in
`math-inc/Sphere-Packing-Lean`, the migration source for a proof of 4.11 inside Tau Ceti under
the repository's porting rules. Only the worked examples depend on 4.11.

| Milestone | Direct prerequisites |
| --- | --- |
| 4.1 | M `Matrix.vecMulVec`, `Submodule.span`, `Module.finrank`; L 0.1, 1.1 |
| 4.2 | M `Matrix.trace`, `Matrix.PosDef.inv`; L 0.5, 1.1 |
| 4.3 | M `IsLocalMax`; L 1.5, 2.1 |
| 4.4 | T `IsPosDef.finite_isometry`; IL 2C; L 0.2, 1.1, 4.2 |
| 4.5 | M `fderiv`, `Matrix.det`, `Real.log`, `Convex`; L 1.1, 1.5, 4.1, 4.2, 4.3 |
| 4.6 | L 0.1, 4.1, 4.8 |
| 4.7 | GoN 4.5.2; M `IsCompact`, `fderiv`; L 4.2, 4.5, 4.8 |
| 4.8 | SM 1.1, 3.21; T⁺ `PosDef.Reduction`, `PosDef.ReducedGram` (as the integral case, prose); L 0.1, 1.1 |
| 4.9 | M `Convex`, `ConvexCone`, `IsClosed`; L 1.1, 4.1, 4.6 |
| 4.10 | T `IsPosDef.finite_isometry`; L 0.2, 2.1, 2.2, 4.1, 4.3, 4.5, 4.9 |
| 4.11 | R24 Layer 6; L 2.1 |

## Layer 5: spherical designs and Venkov's theorem

### 5.1 Spherical designs

In a real inner product space `E` with `finrank ℝ E = n ≥ 1`: define `Pol_t E` as in the
conventions, prove it is finite-dimensional and, under an orthonormal basis, is the image of
`MvPolynomial.restrictTotalDegree ℝ t` under evaluation, so that `Pol_t E` is `O(E)`-invariant and
`Pol_s E ≤ Pol_t E` for `s ≤ t`. Define the normalized sphere measure `σ_r` on `sphere 0 r` and prove
it is a probability measure, invariant under every linear isometry of `E`
(`LinearIsometryEquiv.measurePreserving` and the definition of `toSphere`), Define `IsSphericalDesign t X r` for a finite nonempty `X ⊆ sphere 0 r`, prove
it is invariant under isometries, under `X ↦ −X`, and that a `t`-design is an `s`-design for
`s ≤ t`; prove the antipodal case `X = −X` is automatically an odd-degree design in one more degree
(`2k`-design and antipodal ⇒ `(2k+1)`-design: odd polynomials have zero average on both sides).

### 5.2 The moment criterion

Prove (Venkov, *Réseaux et designs sphériques*, §3; Goethals–Seidel): a finite nonempty antipodal
`X ⊆ sphere 0 r` is a `(2k+1)`-design iff for every `j ≤ k` and every `a ∈ E`,
`∑_{x ∈ X} ⟪a, x⟫^{2j} = c_j · #X · r^{2j} · ‖a‖^{2j}` with
`c_j = (1·3·⋯·(2j−1)) / (n(n+2)⋯(n+2j−2))`. The constants are the sphere moments
`∫ ⟪a, x⟫^{2j} dσ_r`, computed from `toSphere` and the Gamma function (`Real.Gamma`), and the
equivalence uses that the `⟪a, ·⟫^{2j}` span the even part of `Pol_{2k} E` (5.1). State the two
cases used below explicitly: `2`-design iff `∑ ⟪a,x⟫² = (#X r²/n) ‖a‖²`, and `4`-design iff in
addition `∑ ⟪a,x⟫⁴ = (3 #X r⁴/(n(n+2))) ‖a‖⁴`.

### 5.3 Design forms, strongly eutactic and strongly perfect

Define `IsDesignForm t A :↔ IsSphericalDesign t (S(A)) √(min A)` in `FormSpace A`. Prove
similarity invariance. Prove **strongly eutactic ⇔ `2`-design form** (4.4's identity is exactly
5.2's `2`-design criterion with `#X = kiss A`, `r² = min A`). Define `IsStronglyPerfect A :↔
IsDesignForm 4 A`, prove strongly perfect ⇒ perfect (if `H ≠ 0` is symmetric with `H[x] = 0` on
`S(A)`, the degree-`4` polynomial `(xᵀHx)²` has average `0` over `S(A)` but positive integral over
the sphere; Venkov §6) and strongly perfect ⇒ strongly eutactic, hence extreme by 4.5; prove the knowl's "strictly stronger" by the witness
`A₃`, which is perfect and strongly eutactic but not a `4`-design (9). Prove that the roots of `E₈`
form a `7`-design and the minimal vectors of `Λ₂₄` an `11`-design as corollaries of 5.7, and
directly that the `6` minimal vectors of `A₂` form a `5`-design (the hexagon) and the `4` of `ℤ²`
a `3`-design but not a `4`-design.

### 5.4 Harmonic polynomials

Define the Laplacian `Δ : MvPolynomial (Fin n) ℝ →ₗ[ℝ] MvPolynomial (Fin n) ℝ`,
`Δ P = ∑ᵢ pderiv i (pderiv i P)`, and `IsHarmonic P :↔ Δ P = 0`; define the homogeneous harmonic
polynomials `Harm_d` of degree `d` as a submodule. Prove `Harm_d` is `O(n)`-invariant,
`dim Harm_d = C(n+d−1, d) − C(n+d−3, d−2)`, the decomposition
`Pol_{≤ t} = ⨁_{d ≤ t} ‖x‖^{2j} Harm_{d−2j}` (Stein–Weiss, Ch. IV, §2), and the design criterion:
`X ⊆ sphere 0 r` antipodal is a `t`-design iff `∑_{x ∈ X} P(x) = 0` for every `P ∈ Harm_d`,
`0 < d ≤ t` (harmonic polynomials of positive degree integrate to zero over the sphere; the
decomposition reduces `Pol_t` to them).

### 5.5 The Fourier transform of a harmonic Gaussian

Prove the Hecke–Bochner identity: for `P ∈ Harm_d` on `ℝⁿ` and `τ ∈ ℍ`, the Schwartz function
`x ↦ P(x) e^{π i τ ‖x‖²}` has Fourier transform `ξ ↦ (τ/i)^{−n/2} τ^{−d} P(ξ) e^{−π i ‖ξ‖²/τ}`
(principal branch, `Re(τ/i) > 0`), in Mathlib's `SchwartzMap.fourierTransformCLM` normalization
`ξ ↦ ∫ f(x) e^{−2π i ⟪x, ξ⟫} dx`. Route: Hecke's identity `𝓕(P e^{−π‖x‖²}) = (−i)^d P e^{−π‖ξ‖²}`
(Stein–Weiss, Ch. IV, Thm. 3.4) and the substitution `x = y/√s`, `s = τ/i`, whose factor
`(−i)^d s^{−d}` is `τ^{−d}`. When `8 ∣ n` the constant is `τ^{−n/2−d}`. This extends Theta Series'
`fourier_gaussian` (the case `d = 0`, same constant `(τ/i)^{−n/2}`) and is owned here because
Theta Series states no polynomial weights.

### 5.6 Theta series with harmonic coefficients

For a positive definite even unimodular lattice `L` of rank `n = 2k`, `8 ∣ n`, realized in
`FormSpace A`, and `P ∈ Harm_d`, define `Θ_{L,P}(τ) := ∑_{x ∈ ℤⁿ} P(x) e^{π i τ A[x]}` on `ℍ`,
prove absolute convergence (`P` has polynomial growth, the Gaussian decays; TS Layer 1's
summability with a polynomial weight), holomorphy, the `q`-expansion
`Θ_{L,P} = ∑_m (∑_{x : A[x] = 2m} P(x)) q^m`, and **Hecke's theorem**: for `d > 0`, `Θ_{L,P}` is a
cusp form of weight `k + d` for `SL₂(ℤ)` (Poisson summation, TS Layer 1, with 5.5; the constant
term vanishes because `P(0) = 0`; the `T`-law is immediate from evenness). Construct it as a Mathlib
`CuspForm 𝒮ℒ (k + d)`. For `d = 0` this is Theta Series' `Θ_L ∈ M_k(SL₂(ℤ))` (its Layer 5), which
is cited and not reproved.

### 5.7 Venkov's theorem

Prove: for an even unimodular lattice `L` of rank `n = 24m + 8r`, `r ∈ {0, 1, 2}`, that is
**extremal** (`min L = 2m + 2`), every nonempty shell `{x ∈ L | A[x] = 2j}` is a spherical
`t`-design with `t = 11, 7, 3` for `r = 0, 1, 2` respectively. Route (Venkov, §§6–7; Martinet,
Ch. 16): for `P ∈ Harm_d`, `0 < d ≤ t`, the cusp form `Θ_{L,P}` of weight `k + d` has
`q`-expansion starting at `q^{m+1}`; the space `S_{k+d}(SL₂(ℤ))` has dimension `⌊(k+d)/12⌋ − 1`
or `⌊(k+d)/12⌋` and every nonzero cusp form in it has order of vanishing at most that dimension at
`∞` (`Δ^{dim} · M_{k+d−12 dim}` structure from Mathlib's `discriminantEquiv` and the graded ring),
which is `< m + 1` exactly in the stated range of `d`; so `Θ_{L,P} = 0` and every shell sum of `P`
vanishes, which is 5.4's criterion. Corollaries: the `240` roots of `E₈` are a `7`-design, the
`196560` minimal vectors of `Λ₂₄` an `11`-design, and every extremal even unimodular lattice of
rank `24m + 8r` is strongly perfect when `t ≥ 4` (so for `r ∈ {0, 1}`), hence extreme (5.3, 4.5).
Record the non-example: `D₁₆⁺` and `E₈²` have `t = 3` (`r = 2`) and are not strongly perfect.

| Milestone | Direct prerequisites |
| --- | --- |
| 5.1 | M `Measure.toSphere`, `LinearIsometryEquiv.measurePreserving`, `MvPolynomial.restrictTotalDegree`, `OrthonormalBasis`; L none |
| 5.2 | M `Real.Gamma`, `integral` over `toSphere`; L 5.1 |
| 5.3 | L 1.1, 4.1, 4.2, 4.4, 4.5, 5.2; examples via 5.7 and 9 |
| 5.4 | M `MvPolynomial.pderiv`, `MvPolynomial.homogeneousSubmodule`; L 5.1 |
| 5.5 | M `SchwartzMap.fourierTransformCLM`; TS `gaussian`, `fourier_gaussian`; L 5.4 |
| 5.6 | TS Layer 1 `poissonSummation`, Layer 5; M `CuspForm`; IL 6C (`E₈` even unimodular); L 0.3, 5.4, 5.5 |
| 5.7 | M `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `discriminantEquiv`; T `mvPolynomialEquivModularForms`; TS 8B, 8D; R24 Layer 6; IL 6C, 6D; L 5.3, 5.4, 5.6 |

## Layer 6: universality

### 6.1 Representation and universality

For `hL : L.IsPosDef`, define `Represents L m :↔ L.representationNumber m ≠ 0` for `m : ℕ` and
`IsUniversal L :↔ ∀ m ≥ 1, Represents L m`; for even `L` define `RepresentsHalf L m :↔
L.representationNumber (2m) ≠ 0` and `IsHalfUniversal L`. Prove `Represents` is decidable in
principle (`vectorsOfNorm` finite, 1.1's box bound), monotone under sublattices
(`L ≤ L'` of the same form ⇒ `Represents L m → Represents L' m`) and orthogonal sums
(`Represents L a → Represents M b → Represents (L ⊕ M) (a + b)`), and that a universal lattice has
`min L = 1`, hence a vector of norm `1`, hence `L ≅ ⟨1⟩ ⊕ L'` (IL 0F's splitting of a unimodular
rank-one sublattice). Prove `ℤ⁴` is universal (Mathlib's `Nat.sum_four_squares`), `ℤ³` is not
(`7` is not a sum of three squares, a congruence modulo `8`), and no lattice of rank `≤ 3` is
universal: a positive definite ternary form is anisotropic at `∞`, hence at some finite `p` by
Hilbert reciprocity ([Global quadratic forms](../GlobalQuadraticForms/README.md) 4.4), and an
anisotropic ternary form over `ℚ_p` omits a square class of `ℚ_p^×`, hence infinitely many
positive integers.

### 6.2 The truant and escalation

Define `truant L := sInf {m ≥ 1 | ¬ Represents L m}` for non-universal `L`, prove it is attained
and `truant L ≤ 15` is *not* claimed here (it is the theorem). Define an *escalation* of `L` by `m`
as a lattice `L' = L + ℤv` with `B(v, v) = m` and `L` of corank one in `L'`, positive definite;
prove that for `m = truant L` the escalations of `L` are finitely many up to isometry (the new Gram
row is bounded by Cauchy–Schwarz: `|B(v, bᵢ)|² ≤ m · B(bᵢ, bᵢ)` and positive definiteness), and the
**escalation lemma**: a universal lattice `M` containing `L` contains an escalation of `L` by
`truant L`. Define the *escalator lattices* `Esc₀ = {⟨1⟩}`, `Esc_{k+1}` = escalations by their
truants of the non-universal members of `Esc_k`, and prove `Esc_k` finite for each `k`.

### 6.3 The 15 theorem

State and prove, with the proof a cited escalator computation plus the universality proofs of the
terminal escalators: a positive definite integral lattice is universal iff it represents
`1, 2, 3, 5, 6, 7, 10, 14, 15` (Conway–Schneeberger; Bhargava 2000). Route: `Esc₁ = {⟨1,1⟩, ⟨1,2⟩}` with truants `3, 5`;
`Esc₂` has `9` lattices; `Esc₃` has `207`, of which `201` are universal and `6` have truant `10` or
`15`; `Esc₄` has `1630`, all universal. Universality of each terminal escalator is proved by exhibiting a
sublattice of the form `T ⊕ ⟨a⟩` with `T` a ternary lattice whose represented set is known exactly
(a class-number-one genus, IL 4A, with GQF 6.1's local criterion), covering all large `m`, and a
finite check below the bound. Define `FifteenCertificate` as this finite data (escalator tree with
truants; per terminal lattice a ternary sublattice, its IL 9B class-number-`1` certificate, the
local data and the finite check), prove that any such certificate implies the 15 theorem, and
state the theorem against the published certificate. The set `{1,2,3,5,6,7,10,14,15}` is minimal: for each
`c` in it there is a lattice representing the other eight but not `c` (Bhargava's nine witnesses;
`⟨1,2,5,5⟩` for `c = 15` is checked in 9).

### 6.4 The 290 theorem

State: an even positive definite lattice is half-norm universal iff its half-norm represents
`1, 2, 3, 5, 6, 7, 10, 13, 14, 15, 17, 19, 21, 22, 23, 26, 29, 30, 31, 34, 35, 37, 42, 58, 93, 110,
145, 203, 290` (Bhargava–Hanke). Define the analogous `TwoNinetyCertificate` (escalation by
half-norms; terminal universality via ternary sublattices and, where no regular ternary exists,
the analytic bounds on representation numbers that Bhargava–Hanke supply), prove its completeness theorem, and state the theorem against
the published data. Both theorems are statements about Tau Ceti's `representationNumber`, so the
LMFDB can assert universality of a stored lattice by a nine-number or twenty-nine-number check
once the theorem is discharged.

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
product `A ⊗ₖ B ∈ PosDefForm (n₁ n₂)` and prove it is `gramForm` of the tensor product.

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

### 7.2 Minima of tensor products

Prove `min (L₁ ⊗ L₂) ≤ min L₁ · min L₂` (a pure tensor of minimal vectors), that for every
`w ∈ L₂` the sublattice `L₁ ⊗ ℤw` is isometric to `L₁` scaled by `B₂(w, w)`, and that for pairwise
orthogonal `w₁, …, wₖ ∈ L₂` these sublattices are mutually orthogonal (so `L₁ ⊗ L₂ ⊇ ⊕ᵢ L₁^{(B₂(wᵢ,wᵢ))}`;
for a non-orthogonal basis they are not). State **Kitaoka's
theorem** (Kitaoka, *Arithmetic of Quadratic Forms*, Ch. 7): if `rank L₁ ≤ 43` then
`min (L₁ ⊗ L₂) = min L₁ · min L₂`, with the rank-`1` and rank-`2` cases proved here (rank `1` is
0.5's scaling; rank `2` by Minkowski reduction of `L₁` and a direct estimate), and the general
statement a milestone whose proof follows Kitaoka. Record that the equality fails in general
(Steinberg's example; Coulangeon), so the inequality is the only unconditional statement.

**Checks.**

- (equality case) — `min (A₂ ⊗ A₂) = 4 = min A₂ · min A₂`, with exactly `18` minimal vectors: the
  pure tensors `x ⊗ y`, `x, y ∈ S(A₂)`, counted once each since `x ⊗ y = (−x) ⊗ (−y)` (`36/2`).
- (rank one) — `⟨m⟩ ⊗ L` is `L` scaled by `m` (0.5), so `min (⟨2⟩ ⊗ A₂) = 4`.
- (no unconditional equality) — the inequality `min (L₁ ⊗ L₂) ≤ min L₁ · min L₂` carries no rank
  hypothesis; equality is stated only under `rank L₁ ≤ 43`.

### 7.3 Tensor decomposability

Define `IsTensorDecomposable L :↔ ∃ L₁ L₂, 2 ≤ rank L₁ ∧ 2 ≤ rank L₂ ∧ Nonempty (Isometry L (L₁ ⊗ L₂))`
and `TensorDecomposition L` as a finite list of factors of rank `≥ 2` with an isometry onto their
iterated tensor product. Prove: a decomposable lattice has composite rank; `det L` is then a
`rank L₂`-th power times a `rank L₁`-th power, so a lattice of squarefree determinant and rank `p`
prime is indecomposable; `E₈ ≇ A₂ ⊗ D₄`-type statements are checked by minima (7.2) or
determinants; `A₂ ⊗ A₂` has rank `4`, determinant `81`, minimum `4` and is decomposable by
definition. The LMFDB has no tensor column; the knowl is served by the predicate and these
criteria.

**Checks.**

- (accepted) — `A₂ ⊗ A₂` and `ℤ⁴ ≅ ℤ² ⊗ ℤ²` are tensor decomposable.
- (rejected: rank-one factor) — `L ≅ ⟨1⟩ ⊗ L` is not a tensor decomposition; a definition that
  drops `2 ≤ rank` on either factor makes every lattice decomposable (*Pinned conventions*).
- (rejected: prime rank) — a lattice of prime rank, such as `A₂`, `ℤ³` or `A₃`, is indecomposable,
  since the rank of a decomposition is a product of two integers `≥ 2`.
- (determinant criterion) — `E₈` is not isometric to `A₂ ⊗ D₄`, although both have rank `8`:
  `det E₈ = 1` and `det (A₂ ⊗ D₄) = 1296`.

### 7.4 Automorphisms of the discriminant form

For a nondegenerate `L`, define `O(D_L)` as `FiniteBilinearModule.Isometry` of `(A_L, b_L)` with
itself when `L` is odd and, when `L` is even, the subgroup preserving `q_L`
(Tau Ceti's `discriminantQuadraticMap`); prove it is a finite group (`A_L` is finite). Define
`φ_L : Isometry L L →* O(D_L)` through `Isometry.discriminantGroupEquiv` and prove it preserves
`b_L` and, for even `L`, `q_L`.

### 7.5 The Festi–Veniani index

Define `fvIndex L := (φ_L.range).index` in `O(D_L)`, prove it is a positive integer, an isometry
invariant, `1` when `A_L` is trivial (unimodular `L`), and `1` whenever `O(D_L) = {±1}` (since
`−1 ∈ O(L)` maps to `−1`), which covers `A₂` (`O(ℤ/3, q) = {±1}`). Prove the rank-one formula: for
`m ≥ 3`, `O(⟨m⟩) = {±1}` maps onto `{±1} ⊂ (ℤ/m)^×`, and `O(D_⟨m⟩)` is `{u ∈ (ℤ/m)^× | u² ≡ 1 (mod m)}`
when `m` is odd (the lattice is odd; `b_L(x,y) = xy/m`) and `{u | u² ≡ 1 (mod 2m)}` when `m` is even
(the lattice is even; `q_L(x) = x²/m mod 2`), so `fvIndex ⟨m⟩` is half the number of those `u`:
`fvIndex ⟨5⟩ = fvIndex ⟨8⟩ = 1`, `fvIndex ⟨12⟩ = fvIndex ⟨15⟩ = 2`. Record that the bilinear and
quadratic groups differ: for `⟨8⟩` the group `O(ℤ/8, b)` has order `4` while `O(ℤ/8, q) = {±1}`, so
the index of an even lattice must be taken in the quadratic group as pinned. `fvIndex (L ⊕ M)` is
not a function of the two indices and no product formula is claimed. Cite Festi–Veniani, *Counting
elliptic fibrations on K3 surfaces*, for the role of the index.

| Milestone | Direct prerequisites |
| --- | --- |
| 7.1 | M `TensorProduct`, `LinearMap.BilinForm.tensorDistrib`, `Basis.tensorProduct`, `Matrix.det_kronecker`; T `ofIntegralForm`, `dualCarrier`; L 0.2 |
| 7.2 | T⁺ `PosDef.Reduction` (prose); L 1.1, 1.2, 7.1 |
| 7.3 | T `Isometry`, `determinant`; L 7.1, 7.2 |
| 7.4 | T `DiscriminantGroup`, `discriminantPairing`, `discriminantQuadraticMap`, `Isometry.discriminantGroupEquiv`, `FiniteBilinearModule.Isometry`; IL 1C, 1D, 1G |
| 7.5 | M `Subgroup.index`; T `IsPosDef.finite_isometry`; L 7.4 |

## Layer 8: what the LMFDB geometric columns assert

### 8.1 The geometric certificate

Define `StoredGeometryCertificate`, extending IL 9A's `StoredGenusCertificate` for a stored Gram
matrix `G` with the fields the geometric columns assert: `minimum = L.minimum` (IL 9A already has
it; 1.2 identifies it with `min G`), `kissing = L.kissingNumber`, `shortest` is a list enumerating
`S⁺(G)` (1.3) without repetition, `density` is a decimal approximation of `density G` (1.4) to the
stored precision, and `hermite` of `hermite G` (1.5). Prove every field is decidable from `G` by
the finite computations of Layer 1 (minimal vectors by the box bound of 1.1; `det` exactly;
densities to any precision since `Vₙ` and `Γ` are computable reals). Exact columns are equalities;
the two real columns are stated as `|stored − value| < 10^{−prec}`, and the certificate never
asserts a floating-point equality. The `aut` column is IL 9A's and OT §4's; `class_number`,
`genus_reps` and `mass` are IL 9B's and OT's; `theta_series` is IL 9A's shell counts; nothing
here restates them.

### 8.2 Knowl predicates on a stored lattice

For each knowl predicate — well-rounded (1.1), perfect, eutactic, strongly eutactic, extreme
(4.1–4.5), `t`-design (5.3), universal (6.1), tensor decomposable (7.3) — prove the decidability
or semi-decidability statement that the LMFDB would need to display it: well-rounded, perfect,
strongly eutactic and `t`-design are decided by finite linear algebra on `S(G)`; eutactic is a
linear-programming feasibility question over `ℚ` and is decidable; extreme is decided through
Voronoi's theorem (4.5), never by sampling `γ`; universal is decided by the 15 or 290 theorem
(6.3, 6.4) once discharged, and before that by exhibiting the truant. Each is a theorem of the
form "the predicate holds for `ofGramMatrix G` iff this finite check succeeds".

| Milestone | Direct prerequisites |
| --- | --- |
| 8.1 | IL 9A; L 1.2, 1.3, 1.4, 1.5 |
| 8.2 | L 1.1, 4.1, 4.2, 4.5, 5.3, 6.3, 6.4, 7.3 |

## Explicit scope exclusions

Beyond *Not owned here*: the covering constants `Θₙ` and the covering analogue of Voronoi's
theory; the kissing number problem for non-lattice arrangements and the lattice kissing maxima in
ranks `9`–`23`; dual-extreme theory beyond the definition of `γ'`; designs that are not shells of
lattices and the Delsarte–Goethals–Seidel bounds; harmonic theta series at level `N > 1`; the
enumeration of universal lattices beyond the two theorems; regular ternary forms; counterexamples
to tensor-minimum multiplicativity as constructions; the K3-surface applications of the
Festi–Veniani index. None of them replaces a milestone above.

## Worked examples (acceptance criteria)

Every number was computed (Sage 10.7) or read from the LMFDB record named. Norms are `B(x,x)`;
`Δ` is the LMFDB `density`, `γ` the LMFDB `hermite`, `μ` the covering radius, `t` the exact
design strength of `S(L)`.

| Lattice (label) | `n`, `det`, `min`, `kiss`, `#Aut` | `δ`, `Δ`, `γ` | `μ`, `Θ` | perfect / eutactic / `t` | Milestones |
| --- | --- | --- | --- | --- | --- |
| `⟨2⟩` (`1.2.4.1.1`, the only rank-`1` record) | `1, 2, 2, 2, 2` | `1/2`, `1`, `1` | `√2/2`, `1` | yes / strongly / all `t` | 1.1–1.5, 2.3, 3.2, 4.1, 4.2 |
| `ℤ²` (`2.1.2.1.1`) | `2, 1, 1, 4, 8` | `1/4`, `π/4 ≈ 0.78540`, `1` | `√2/2`, `π/2` | **no** / strongly / `3` | 1.4, 1.5, 3.2, 4.1, 4.2, 5.3 |
| `A₂` (`2.3.3.1.1`) | `2, 3, 2, 6, 12` | `1/(2√3) ≈ 0.28868`, `π/√12 ≈ 0.90690`, `2/√3 ≈ 1.15470` | `√(2/3) ≈ 0.81650`, `2π/√27 ≈ 1.2092` | yes / strongly / `5` | 1.8, 2.3 (critical, `γ₂`), 3.2, 4.1, 4.2, 4.5, 5.3 |
| `ℤ³` (`3.1.2.1.1`) | `3, 1, 1, 6, 48` | `1/8`, `π/6 ≈ 0.52360`, `1` | `√3/2`, `π√3/2 ≈ 2.7207` | no / strongly / `3` | 1.4, 3.2, 4.2 |
| `A₃ = D₃` (`3.4.8.1.2`) | `3, 4, 2, 12, 48` | `1/(4√2) ≈ 0.17678`, `π/√18 ≈ 0.74048`, `2^{1/3} ≈ 1.25992` | `1`, `2π/3 ≈ 2.0944` | yes / strongly / `3` (not `4`) | 2.3 (critical, `γ₃`), 3.2, 4.1, 4.5, 5.3 |
| `A₃*` (bcc; `3.128.8.1.1`, Gram `[[6,−2,−2],[−2,6,−2],[−2,−2,6]]`, twice the dual of `A₃`) | `3, 128, 6, 8, 48` | `3√3/32 ≈ 0.16238`, `π√3/8 ≈ 0.68017`, `6/128^{1/3} ≈ 1.19055` | `√10/2 ≈ 1.5811`, `5√5π/24 ≈ 1.4635` | **no** / strongly / `3` | 3.2, 4.1, 4.2 (eutactic, not perfect) |
| `⟨15⟩` (Gram `[[15]]`) and `⟨12⟩` | `1, 15, 15, 2, 2` and `1, 12, 12, 2, 2` | `1/2`, `1`, `1` | `√15/2`, `1` | yes / strongly / all `t` | 7.5 (`fvIndex = 2`: `O(ℤ/15, b) = {1,4,11,14}`, `O(ℤ/12, q) = {1,5,7,11}`, image `{±1}`) |
| `⟨5⟩` and `⟨8⟩` | `1, 5, 5, 2, 2` and `1, 8, 8, 2, 2` | `1/2`, `1`, `1` | — | yes / strongly / all `t` | 7.5 (`fvIndex = 1`; for `⟨8⟩` the bilinear group `O(ℤ/8, b)` has order `4` but `O(ℤ/8, q) = {±1}`) |
| `D₄` (`4.4.2.1.1`) | `4, 4, 2, 24, 1152` | `1/8`, `π²/16 ≈ 0.61685`, `√2 ≈ 1.41421` | `1`, `π²/4` | yes / strongly / `5` | 4.1, 4.5, 4.10 (critical, `γ₄`), 5.3 (strongly perfect) |
| `E₈` (`8.1.1.1.1`) | `8, 1, 2, 240, 696729600` | `1/16`, `π⁴/384 ≈ 0.25367`, `2` | `1`, `π⁴/24 ≈ 4.0587` | yes / strongly / `7` | 4.1, 4.5, 4.10–4.11 (critical, `γ₈`), 5.7, 7.5 (`fvIndex = 1`) |
| `E₈ ⊕ E₈` (IL 6D; no LMFDB record) | `16, 1, 2, 480, 2·696729600²` | `1/256`, `π⁸/(8!·256)`, `2` | — | **no** / strongly / `3` | 4.1 (orthogonal sums are never perfect), 5.7 (`r = 2`) |
| `Λ₂₄` (`24.1.1.24.1`) | `24, 1, 4, 196560, 8315553613086720000` | `1`, `π¹²/12! ≈ 0.0019296`, `4` | `√2`, `2¹² π¹²/12! ≈ 7.9035` | yes / strongly / `11` | 3.4, 4.11 (critical, `γ₂₄`), 5.7, 7.5 |
| `[[2,1],[1,3]]` | `2, 5, 2, 2, 4` | `1/(2√5)`, `π/(2√5) ≈ 0.70248`, `2/√5` | — | **no** / **not eutactic**, not well-rounded / — | 1.1 (`S = {±e₁}` does not span), 4.2 |
| `A₂ ⊗ A₂` | `4, 81, 4, 18, 144` | — | — | — | 7.1 (Kronecker Gram, `det = 3⁴`), 7.2 (`min = 2·2`; the `18` minimal vectors are the pure tensors `x ⊗ y`, `x, y ∈ S(A₂)`, with `x ⊗ y = (−x) ⊗ (−y)`), 7.3 (decomposable) |

Universality (Layer 6): `ℤ⁴` is universal (`Nat.sum_four_squares`); `ℤ³` has truant `7` and misses
`7, 15, 23, 28, 31, 39, 47, 55, 60, …`; `⟨1,1,2⟩` has truant `14`; `⟨1,2,5,5⟩` represents
`1, 2, 3, 5, 6, 7, 10, 14` and **not** `15` (its only miss below `2000`), so it is rejected by the
15 theorem's criterion and is the minimality witness for `15`; `⟨1,2,5,10⟩` represents the nine
critical numbers, hence is universal by 6.3 (and misses nothing below `300`); the half-norm form
`x² + xy + y²` of `A₂` has half-norm truant `2`. Hermite constants (2.3, 4.10): `γ₁ = 1`,
`γ₂ = 1.15470…`, `γ₃ = 1.25992…`, `γ₄ = 1.41421…`, `γ₅ = 8^{1/5} = 1.51572…`,
`γ₆ = (64/3)^{1/6} = 1.66537…`, `γ₇ = 64^{1/7} = 1.81144…`, `γ₈ = 2`, `γ₂₄ = 4`.

**Boundary checks.** `ℤ²` and `A₃*` are eutactic but not perfect; `[[2,1],[1,3]]` is neither and
is rejected by `IsWellRounded`; `E₈ ⊕ E₈` shows a sum of extreme forms is not extreme; `A₃` is
perfect and strongly eutactic but not a `4`-design, separating 5.3's "strongly perfect" from
"perfect and strongly eutactic"; the LMFDB record `2.3.6.1.1` (Gram `[[1,0],[0,3]]`, `min 1`,
`kiss 2`, `Δ ≈ 0.45345`, `γ ≈ 0.57735`) has `S = {±e₁}` and is rejected by 1.1 and 4.2.

## Ordering

```text
Layer 0 ──► Layer 1 ──► Layer 2 ──► Layer 4 ──► Layer 5
   │           │                      ▲
   │           ├──► Layer 3            │
   │           ├──► Layer 6            │
   │           └──► Layer 7 (7.1–7.3) ─┘ (7.2 needs 4.8 only for Kitaoka's route)
   └──► Layer 7 (7.4–7.5)
Layers 1–7 ──► Layer 8
```

Layer 0 first. Layers 3, 6 and 7 are independent of one another and of Layers 2, 4 and 5 once Layer
1 is in place, and can proceed in parallel. Layer 2 needs 1.7–1.8 and GoN 4.5.2; Layer 4 needs
Layer 2 for 4.3 and 4.10 and SM 1.1/3.21 for 4.8; Layer 5 needs 4.1–4.5 for 5.3 and Theta Series
Layer 1 for 5.5–5.6. Layer 8 is last and is a certificate layer: it adds no mathematics.

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
  perfect lattices), §§6–7 (theta series with harmonic coefficients; the extremal theorem).
- E. M. Stein, G. Weiss, *Introduction to Fourier Analysis on Euclidean Spaces*, Princeton 1971,
  Ch. IV §2 and Thm. 3.4.
- H. Cohn, A. Kumar, *Optimality and uniqueness of the Leech lattice among lattices*, Ann. of
  Math. 170 (2009), 1003–1050. H. Cohn, N. Elkies, *New upper bounds on sphere packings I*, Ann.
  of Math. 157 (2003), 689–714. M. Viazovska, *The sphere packing problem in dimension 8*, Ann. of
  Math. 185 (2017), 991–1015. H. Cohn, A. Kumar, S. D. Miller, D. Radchenko, M. Viazovska, *The
  sphere packing problem in dimension 24*, Ann. of Math. 185 (2017), 1017–1033.
  `math-inc/Sphere-Packing-Lean` (Lean formalization of both).
- M. Dutour Sikirić, A. Schürmann, F. Vallentin, *Classification of eight-dimensional perfect
  forms*, Electron. Res. Announc. AMS 13 (2007), 21–32.
- M. Bhargava, *On the Conway–Schneeberger fifteen theorem*, in *Quadratic Forms and Their
  Applications*, Contemp. Math. 272 (2000), 27–37. M. Bhargava, J. Hanke, *Universal quadratic
  forms and the 290-theorem*, Invent. Math. (2025).
- Y. Kitaoka, *Arithmetic of Quadratic Forms*, Cambridge Tracts 106, 1993, Ch. 7 (tensor
  products of positive lattices).
- D. Festi, D. C. Veniani, *Counting elliptic fibrations on K3 surfaces*, J. Math. Soc. Japan
  (2023).
- A. Ash, *On eutactic forms*, Canad. J. Math. 29 (1977), 1040–1054.
