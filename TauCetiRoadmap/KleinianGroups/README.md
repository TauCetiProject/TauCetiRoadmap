# Roadmap: Kleinian groups, hyperbolic 3-manifolds, and arithmetic volume

**Summary.** Develop discrete subgroups of `PSL(2, ℂ)` acting on hyperbolic 3-space, their
fundamental domains and covolumes, the Bianchi groups `PSL(2, 𝒪_F)` of the imaginary quadratic
fields and their congruence subgroups, and the volumes of the quotients. Hyperbolic 3-space is
Tau Ceti's upper half-space model `TauCeti.UpperHalfSpace ℂ`, written `ℍ³`, with its Riemannian
metric, distance and volume. There are four endpoints:

- **Humbert's formula.** For every imaginary quadratic field `F` with discriminant `d_F`, the
  covolume of `PSL(2, 𝒪_F)` is `|d_F|^(3/2) ζ_F(2) / (4π²)` (§4.6).
- **The two smallest discriminants by integration.** The covolume of `PSL(2, ℤ[i])` is
  `catalanConstant / 3` and that of `PSL(2, ℤ[ω])` is `√3 · L(2, χ₋₃) / 8`, computed by
  integrating over explicit fundamental domains (§§3.5, 4.3). These two values calibrate the
  archimedean constant in the proof of Humbert's formula.
- **Torsion-free congruence subgroups.** For `I ≠ ⊤` with `2, 3 ∉ I`, the principal congruence
  subgroup `Γ(I)` is torsion free (§3.3); the quotients by `Γ(2 + i)` and `Γ(3 + ω)` are
  hyperbolic 3-manifolds of volume `20 · catalanConstant` and `21 · √3 · L(2, χ₋₃)` (§4.4).
- **Thurston's twenty-third question.** The set of volumes of hyperbolic 3-manifolds is defined
  by a witnessing group, and the question whether its members are all rationally related is
  stated against it (§5.3). The question is open; this roadmap states it and proves nothing
  about it.

## Scope and ownership

This roadmap owns:

- the action of `SL(2, ℂ)` and `PSL(2, ℂ)` on the carrier `TauCeti.UpperHalfSpace ℂ`, as an
  instance, with its quaternionic description, the injective homomorphism to `TauCeti.Isom`,
  and the measure, metric and topological instances on that carrier (Layer 0);
- discreteness, proper discontinuity, the non-free locus, fundamental domains, Dirichlet domains
  and covolume for subgroups of `PSL(2, ℂ)` (Layers 1–2);
- the Bianchi groups of every imaginary quadratic field, their principal congruence subgroups,
  their torsion, their indices and the Bianchi domains of `ℤ[i]` and `ℤ[ω]` (Layer 3);
- the constants `catalanConstant` and `lchi3`, the volumes of the two Bianchi domains, the
  factorizations of `ζ_F(2)` for `ℚ(i)` and `ℚ(ω)`, and Humbert's formula (Layer 4);
- the set of volumes of hyperbolic 3-manifolds and the statement of Thurston's question
  (Layer 5).

Boundaries with other roadmaps:

- **Polylogarithms §2.4** owns the coordinate formula of the Möbius action on its upper
  half-space model `upperHalfHyperbolicModel`, its composition law, its independence of the sign
  of the matrix and its preservation of the metric. This roadmap transports the action to
  `TauCeti.UpperHalfSpace ℂ` and proves none of those properties again. Polylogarithms §2.4 also
  owns the Lobachevsky function; this roadmap does not define it, and evaluates the three
  log-sine integrals it needs directly from PolylogarithmFunctions (§4.2).
- **PolylogarithmFunctions** owns `polylog`, its derivative recursion on `ℂ ∖ [1, ∞)` and its
  closed-disc series and continuity at `1`, from which §4.2 evaluates
  `∫₀^θ log(2 sin u) du` at `θ = π/6, π/4, π/3`.
- **GeometricTopology §7.1** owns the general theory of hyperbolic `n`-manifolds `ℍⁿ / Γ`, the
  density of the Riemannian volume of the upper half space, the statement that the volume of a
  quotient is the volume of a fundamental domain, and the identification of `Isom(ℍ³)` with
  `PSL₂(ℂ) ⋊ ℤ/2`. The homomorphism of `exists_toIsom` is the `PSL₂(ℂ)` factor of that
  identification, transported along `UpperHalfSpace.congr` (§0.2).
- **AdelicAlgebraicGroups** owns arithmetic discreteness (AA.3.4), Tamagawa measures and the
  local volumes of `SL_n` (AA.2.4) and strong approximation (AA.4.2).
  **EndoscopicTransferAndUnitaryTraceComparison §6.2** owns `τ(S) = 1` for simply connected
  semisimple `S`. Humbert's formula (§4.6) combines these; this roadmap adds the Euler product
  of `ζ_F(2)` and the archimedean comparison.
- **FuchsianOrbifolds** is the two-dimensional counterpart, with discreteness as its input;
  §0.4 keeps the two distances equal on the slice `w ∈ ℝ`.

Out of scope: classification of Kleinian groups, deformation theory, Mostow rigidity,
geometrization, Teichmüller and quasi-Fuchsian theory, hyperbolic Dehn surgery, the
classification of cusped 3-manifolds by volume, and any proof about the rationality of ratios
of volumes, which is open mathematics.

## Conventions

- **Carrier.** `ℍ³` is `TauCeti.UpperHalfSpace ℂ`: points `(w, t)` with `w : ℂ`, `t : ℝ`,
  `0 < t`, in `WithLp 2 (ℂ × ℝ)`, read through `w` and `TauCeti.UpperHalfSpace.height`. The
  horizontal factor is `ℂ`, not `EuclideanSpace ℝ (Fin 2)`, because the Möbius formula is
  complex arithmetic in `w` and Bianchi groups are matrices over subrings of `ℂ`. Comparisons
  with `TauCeti.ModelGeometry.hyperbolic`, whose space is
  `TauCeti.UpperHalfSpace (EuclideanSpace ℝ (Fin 2))`, go through `UpperHalfSpace.congr` at the
  linear isometry `ℂ ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 2)` of `Complex.orthonormalBasisOneI`.
- **Measure.** The measurable structure is `borel`, and `volume` is the `MeasureSpace` instance
  `TauCeti.riemannianVolume 𝓘(ℝ, WithLp 2 (ℂ × ℝ)) ℍ³`, as `UpperHalfPlane` has in dimension
  two. Its density `t⁻³` is the theorem `volume_eq_withDensity`.
- **Distance.** `dist` is the `MetricSpace` instance
  `TauCeti.MetricSpace.ofRiemannianMetric 𝓘(ℝ, WithLp 2 (ℂ × ℝ)) ℍ³`, with
  `cosh (dist p q) = 1 + ‖p − q‖² / (2 · height p · height q)` for the Euclidean norm of
  `WithLp 2 (ℂ × ℝ)`.
- **Action.** `A = (a b; c d)` in `SL(2, ℂ)` acts by `mobius`:
  `J = |c w + d|² + |c|² t²` (`denom`, positive by `denom_pos`) and
  `A • (w, t) = (((a w + b) conj (c w + d) + a conj c t²) / J, t / J)`. This is the formula of
  Polylogarithms §2.4 in the coordinates of `TauCeti.UpperHalfSpace ℂ`. The action of
  `PSL(2, ℂ)`, Mathlib's `Matrix.ProjectiveSpecialLinearGroup (Fin 2) ℂ` with its quotient
  topology, is the action on representatives; stabilizer and effectiveness statements are for
  the projective action.
- **Kleinian.** A *Kleinian group* is a discrete subgroup of `PSL(2, ℂ)`.
  `IsTorsionFreeKleinian Γ` says that `Γ` acts properly discontinuously and freely, which is
  equivalent to discrete and torsion free (`isTorsionFreeKleinian_iff_discrete_and_torsionFree`);
  its quotient is a manifold.
- **Covolume.** Covolume is Mathlib's `MeasureTheory.covolume Γ ℍ³ volume`, valued in `ℝ≥0∞`.
  `IsCofinite Γ` has the fields `DiscreteTopology Γ` and finite covolume, in the shape of Tau
  Ceti's Fuchsian `Subgroup.IsCofinite`: a nondiscrete group can have covolume `0`.
- **Bianchi groups.** `bianchi F ι` is the image in `PSL(2, ℂ)` of `SL(2, 𝒪_F)` under
  `ι.comp (algebraMap (𝒪 F) F)`, for a number field `F` and `ι : F →+* ℂ`. Theorems assume `F`
  imaginary quadratic, written `Module.finrank ℚ F = 2` and `IsTotallyComplex F`. The group does
  not depend on `ι` (`bianchi_comp_algEquiv`); `ι` is data because congruence subgroups depend
  on it.
- **Congruence subgroups.** `bianchiGamma F ι I` is the image in `PSL(2, ℂ)` of the kernel of
  `SL(2, 𝒪_F) → SL(2, 𝒪_F / I)`. Its quotient in `bianchi F ι` is `SL(2, 𝒪_F / I)` modulo the
  image of `{±1}`, which is Mathlib's `PSL(2, 𝒪_F / I)` only when the centre of
  `SL(2, 𝒪_F / I)` is the image of `{±1}`.
- **Named fields.** `GaussianField` is `CyclotomicField 4 ℚ` and `EisensteinField` is
  `CyclotomicField 3 ℚ`, embedded in `ℂ` by `IsAlgClosed.lift` (`gaussianEmbedding`,
  `eisensteinEmbedding`), with `gaussianI` and `eisensteinOmega` the integral primitive roots
  `(IsCyclotomicExtension.zeta_spec n ℚ _).toInteger`.
- **Constants.** `catalanConstant` is `∑ (−1)ⁿ / (2n + 1)²`; Mathlib's `catalan` is the Catalan
  numbers `ℕ → ℕ`. `lchi3` is `∑ (1/(3n + 1)² − 1/(3n + 2)²)`, which is `L(2, χ₋₃)`. Volume
  theorems state these constants, never a decimal enclosure.
- **Decidability.** No `native_decide`. Rational arithmetic on explicit matrices is `decide` or
  `norm_num`.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.IsFundamentalDomain`, `MeasureTheory.HasFundamentalDomain`,
  `MeasureTheory.covolume` and `IsFundamentalDomain.covolume_eq_volume` in
  `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`.
- `Matrix.ProjectiveSpecialLinearGroup` with the scoped `PSL(n, R)` notation; `Quaternion` and
  `Mathlib/Analysis/Quaternion.lean`; `ProperlyDiscontinuousSMul` in
  `Mathlib/Topology/Algebra/ConstMulAction.lean`.
- `UpperHalfPlane.volume_def`, `UpperHalfPlane.cosh_dist` and `UpperHalfPlane.dist_eq` in
  `Mathlib/Analysis/Complex/UpperHalfPlane/`, the two-dimensional models of §§0.3–0.4.
- `intervalIntegrable_log_sin` in `Mathlib/Analysis/SpecialFunctions/Integrability/Log.lean`
  and `integral_log_sin_zero_pi_div_two` in `Mathlib/Analysis/SpecialFunctions/Integrals/Log.lean`,
  for §4.2.
- `NumberField.dedekindZeta` (the `LSeries` of ideal counts), `NumberField.discr`,
  `DirichletCharacter.LFunction`, `riemannZeta`, `CyclotomicField`,
  `IsCyclotomicExtension.zeta_spec`, `IsPrimitiveRoot.toInteger`, and the Euler-product
  machinery of `Mathlib/NumberTheory/EulerProduct/`.

### From Tau Ceti

- `TauCeti.UpperHalfSpace E`, `TauCeti.UpperHalfSpace.height`,
  `TauCeti.UpperHalfSpace.riemannianMetric` and `TauCeti.UpperHalfSpace.hyperbolicMetric` in
  `Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/`; completeness
  `TauCeti.UpperHalfSpace.completeSpace_of_riemannianMetric` in
  `Geometry/Manifold/Riemannian/Hyperbolic/Completeness.lean`.
- `TauCeti.Isom` in `Geometry/Manifold/Riemannian/Isometry/Group.lean` and its evaluation
  action in `Isometry/Action.lean`; the similarities, inversions and their classification
  `exists_eq_similarity_or_exists_eq_inversion_mul_similarity` in
  `Isometry/UpperHalfSpace.lean`.
- `TauCeti.MetricSpace.ofRiemannianMetric` in `Riemannian/Distance.lean`;
  `TauCeti.riemannianVolume` in `Riemannian/VolumeDensity/Volume.lean`;
  `TauCeti.RiemannianIsometry.measurePreserving_riemannianVolume` in
  `VolumeDensity/Isometry.lean`; `hasGeometricStructure_quotient` in
  `Riemannian/GeometricStructure/Basic.lean`.
- In `MeasureTheory/Group/FundamentalDomain.lean`:
  `IsFundamentalDomain.subgroup_iUnion_out_inv_smul`, the index law
  `covolume_eq_card_mul_covolume` (for `Δ ≤ Γ` with `Γ` countable and having a fundamental
  domain, `covolume Δ = ENat.card (Γ ⧸ Δ.subgroupOf Γ) · covolume Γ`), `covolume_pos`,
  `covolume_conjAct_smul` and `IsFundamentalDomain.of_disjoint_smul_interior`.
- `exists_isFundamentalDomain_of_properlyDiscontinuousSMul` in
  `MeasureTheory/Group/ProperlyDiscontinuous.lean`; `TauCeti.freeLocus` and
  `isCoveringMap_quotientMk_freeLocus` in `Topology/Algebra/GroupAction/FreeLocus.lean`.
- `Subgroup.IsCofinite` and `Subgroup.isCofinite_iff_covolume_ne_top` in
  `Analysis/Complex/Fuchsian/Covolume.lean`, the two-dimensional models of §1.3.
- `T2Space PSL(2, ℂ)`, through `Subgroup.isClosed_center` in
  `Topology/Algebra/Group/Subgroup.lean`.

### From Polylogarithms §2.4

On `upperHalfHyperbolicModel`, the points `(w, h) ∈ ℂ × ℝ` with `h > 0`: the coordinate action
of `SL(2, ℂ)` with `J > 0`, the composition law, independence under `−1`, preservation of the
metric and orientation, and the coordinate identification of the model with the bundled
hyperbolic metric.

### From PolylogarithmFunctions

`polylog n z`, written `Liₙ(z)`, with `Li₁(z) = −Log(1 − z)`; §1.5, the derivative recursion
`z · Li₂′(z) = Li₁(z)` on `Ω = ℂ ∖ [1, ∞)`; §1.7, the closed-disc series
`Li₂(z) = ∑_{m ≥ 1} z^m / m²` for `|z| ≤ 1` and continuity of `Li₂` at `1`, with
`Li₂(1) = ζ(2)`.

### From GeometricTopology §7.1

The Riemannian volume of `TauCeti.UpperHalfSpace (EuclideanSpace ℝ (Fin (n − 1)))` has density
`y⁻ⁿ` against Lebesgue measure; a discrete torsion-free group acting freely by isometries has a
complete hyperbolic quotient; the volume of the quotient is the volume of a fundamental domain;
and `Isom(ℍ³) ≅ PSL₂(ℂ) ⋊ ℤ/2`.

### From AdelicAlgebraicGroups AA.2.4, AA.3.4, AA.4.2

AA.2.4: the Tamagawa measure `τ_G = |d_F|^(−d/2) ρ_G⁻¹ ∏_v λ_v |ω|_v` with the local
normalizations `dx`, `2 dx dy` and `vol(𝒪_v) = 1`; for `SL₂`, whose character lattice is zero,
`λ_v = ρ_G = 1`; the corrected volume `#SL₂(k_v) q_v⁻³ = 1 − q_v⁻²`; and the Tamagawa number
`τ(G) = vol(G(F)\G(𝔸_F))`. AA.3.4: discreteness of `Reduction.levelArithmetic`. AA.4.2,
*strong-approximation-sufficiency*: an absolutely almost simple simply connected group with
noncompact `G_S` has strong approximation with respect to `S`.

### From EndoscopicTransferAndUnitaryTraceComparison §6.2

`τ(S) = 1` for every simply connected semisimple group `S` over a number field; its Checks
include `τ(SL_n) = 1`.

## How to read the build

Layer 0 puts the action, the volume and the distance on `ℍ³`. Layer 1 turns discreteness into
proper discontinuity, proves the non-free locus null and gives every discrete group a
fundamental domain and a covolume. Layer 2 builds Dirichlet domains. Layer 3 defines the Bianchi
groups and congruence subgroups, proves discreteness and torsion-freeness, and gives the two
explicit Bianchi domains. Layer 4 integrates over those domains, evaluates three log-sine
integrals, applies the index law, and proves Humbert's formula for every imaginary quadratic
field, using the Gaussian value to fix the archimedean constant. Layer 5 defines the set of
volumes and states Thurston's question.

## Layer 0: the action, the volume and the distance

### 0.1 The Möbius action

Define `mobius A p` by the formula of the conventions and prove `one_smul'` and `mul_smul'` by
transporting Polylogarithms §2.4's composition law along the coordinate identification
`(w, h) ↦ (w, h)` of `upperHalfHyperbolicModel` with `ℍ³`; give the `MulAction SL(2, ℂ) ℍ³`
instance with these fields. Prove `smul_eq_of_mem_center`, that `±1` act trivially, and give
`MulAction PSL(2, ℂ) ℍ³` on representatives. Prove `toQuaternion_smul`: with `toQuaternion`
sending `(w, t)` to `re w + (im w) i + t j` and `ofComplex` embedding `ℂ` in `ℍ[ℝ]` along
`1, i`, `toQuaternion (A • p) = (a q + b)(c q + d)⁻¹`.

- The action is continuous, transitive, and the stabilizer of `(0, 1)` in `PSL(2, ℂ)` is the
  image of `SU(2)`.
- The projective action is faithful: only the identity of `PSL(2, ℂ)` fixes every point.
- `height (A • p) = height p / denom A p`.

**Checks.**

- `(0 −1; 1 0)` sends `(w, t)` to `(−conj w / (|w|² + t²), t / (|w|² + t²))`; it fixes `(0, 1)`
  and sends `(1, 1)` to `(−1/2, 1/2)`. Omitting `|c|² t²` from `J` makes it undefined over the
  vertical axis `w = 0`.
- `−1` acts trivially, and `diag(i, −i)` acts as `(w, t) ↦ (−w, t)`, fixing exactly the vertical
  geodesic over `0`.
- `(1 b; 0 1)` acts as `(w, t) ↦ (w + b, t)`, and `diag(a, a⁻¹)` with `a > 0` as
  `(w, t) ↦ (a² w, a² t)`.

### 0.2 Isometries

Prove `isometry_smul` and `exists_toIsom`: there is an injective homomorphism
`PSL(2, ℂ) →* TauCeti.Isom 𝓘(ℝ, WithLp 2 (ℂ × ℝ)) ℍ³` whose evaluation at `p` is `g • p`. Each
element is an isometry by Polylogarithms §2.4's preservation of the metric, transported; the
homomorphism property is the composition law, and injectivity is faithfulness (§0.1). Prove
`UpperHalfSpace.congr`: a linear isometry `E ≃ₗᵢ[ℝ] F` induces a Riemannian isometry
`TauCeti.UpperHalfSpace E ≃ TauCeti.UpperHalfSpace F`; at `Complex.orthonormalBasisOneI` it
identifies `ℍ³` with `ModelGeometry.hyperbolic.Space`, and along it the image of
`exists_toIsom` is the `PSL₂(ℂ)` factor of GeometricTopology §7.1's `PSL₂(ℂ) ⋊ ℤ/2`.

**Checks.**

- The image of `(0 −1; 1 0)` is Tau Ceti's `UpperHalfSpace.inversion 0 1` followed by the
  linear isometry `w ↦ −conj w`.
- The image of `(a b; 0 a⁻¹)` is the similarity of scale `|a|²`, rotation `w ↦ (a / conj a) w`
  and translation `a b`.
- Complex conjugation `(w, t) ↦ (conj w, t)` is an isometry not in the image: it reverses
  orientation.

### 0.3 Volume

Give `MeasurableSpace ℍ³ := borel`, `BorelSpace`, `SecondCountableTopology ℍ³`,
`LocallyCompactSpace ℍ³` and the `MeasureSpace` instance of the conventions. Prove
`volume_eq_withDensity`, the case `E = ℂ` of GeometricTopology §7.1's density formula
transported along `UpperHalfSpace.congr` by
`RiemannianIsometry.measurePreserving_riemannianVolume`. Prove `smulInvariantMeasure`,
`continuousConstSMul` and `secondCountableTopology_psl`, and register them, together with
`MeasurableConstSMul PSL(2, ℂ) ℍ³`, as instances.

- `volume` is sigma-finite, locally finite and `IsOpenPosMeasure`, and is mutually absolutely
  continuous with Lebesgue measure on the open half-space.
- The volume of a box `[x₀, x₁] × [y₀, y₁] × [t₀, t₁]` with `0 < t₀ < t₁ ≤ ∞` is
  `(x₁ − x₀)(y₁ − y₀)(t₀⁻² − t₁⁻²)/2`.

**Checks.**

- The cusp box `[0, 1] × [0, 1] × [1, ∞)` has volume `1/2`; the box with `t ∈ [1, 2]` has
  `3/8`. A density `t⁻²` would make the cusp box infinite.
- Translations and `diag(a, a⁻¹)` with `a > 0` preserve the volume of a box: the second scales
  the base by `a⁴` and divides `t₀⁻² − t₁⁻²` by `a⁴`.

### 0.4 Distance

Give the `MetricSpace` instance of the conventions and prove `cosh_dist` and the `arsinh` form
`dist p q = 2 arsinh (‖p − q‖ / (2 √(height p · height q)))`. Define `ofUpperHalfPlane`, the
slice `w ∈ ℝ`, and prove `dist_ofUpperHalfPlane` and the equivariance
`ofUpperHalfPlane (g • z) = g • ofUpperHalfPlane z` for `g ∈ SL(2, ℝ)`.

- On a vertical line, `dist (w, s) (w, t) = |log (t / s)|`; the vertical line is a geodesic.
- The distance is complete, by `TauCeti.UpperHalfSpace.completeSpace_of_riemannianMetric`.

**Checks.**

- `dist (0, 1) (0, 2) = log 2`, since `cosh d = 1 + 1/4 = 5/4`.
- `cosh (dist (0, 1) (1, 1)) = 3/2`; the Euclidean distance is `1`.
- On the slice, `cosh_dist` has exactly the shape of `UpperHalfPlane.cosh_dist`.

### Examples

The element `(0 −1; 1 0)` is an isometric involution of `ℍ³` fixing the geodesic
`{|w|² + t² = 1, w ∈ i ℝ}`; `diag(i, −i)` is a rotation by `π` about the vertical axis over `0`.

### Dependencies

Polylogarithms §2.4 (the action on its model); GeometricTopology §7.1 (density of the volume,
`PSL₂(ℂ) ⋊ ℤ/2`); the Tau Ceti suppliers listed above.

## Layer 1: discrete groups, fundamental domains and covolume

### 1.1 Proper discontinuity and torsion-free Kleinian groups

Prove `properlyDiscontinuousSMul_of_discrete`: a discrete subgroup acts properly
discontinuously, since stabilizers of points are compact. Define `IsTorsionFreeKleinian` and
prove `isTorsionFreeKleinian_iff_discrete_and_torsionFree`: an element of finite order of
`PSL(2, ℂ)` fixes a point, and a properly discontinuous action has finite stabilizers.

- `IsTorsionFreeKleinian` passes to subgroups and is invariant under conjugation.
- A finite-index subgroup of a discrete group is discrete.

**Checks.**

- The trivial group and the translation group `w ↦ w + b`, `b ∈ ℤ[i]`, satisfy
  `IsTorsionFreeKleinian`.
- The group of order two generated by `diag(i, −i)` is discrete but not torsion free; it fixes
  the axis over `0`.
- `SL(2, ℤ)` maps onto a discrete subgroup of `PSL(2, ℂ)` that is not torsion free: it contains
  `(0 −1; 1 0)` of order two.

### 1.2 The non-free locus and fundamental domains

Prove `volume_fixedPoints_eq_zero`: the fixed set of `g ≠ 1` in `PSL(2, ℂ)` is empty or a
geodesic, by the classification of elements by trace (Elstrodt–Grunewald–Mennicke,
Chapter 1); a geodesic lies in a vertical plane or a sphere, which is Lebesgue-null, so the fixed set
is null by `volume_eq_withDensity`. Prove `volume_compl_freeLocus` for countable `Γ`, as a
countable union. Prove `countable_of_discrete`, from `secondCountableTopology_psl`, and
`hasFundamentalDomain_of_discrete`, from
`exists_isFundamentalDomain_of_properlyDiscontinuousSMul` with `volume_compl_freeLocus` as its
null-set hypothesis.

**Checks.**

- `diag(i, −i)` fixes the vertical geodesic `{(0, t)}`, an uncountable null set: the
  countability argument of the two-dimensional `volume_compl_freeLocus` does not transfer.
- In `SL(2, ℂ)` the element `−1` fixes all of `ℍ³`; the statement is for `PSL(2, ℂ)`.
- A parabolic element `(1 1; 0 1)` has no fixed point in `ℍ³`.

### 1.3 Covolume and cofiniteness

Define `IsCofinite` and prove `IsCofinite.covolume_pos` from Tau Ceti's `covolume_pos`. For
`Δ ≤ Γ` with `Γ` countable and having a fundamental domain, the covolume of `Δ` is
`ENat.card (Γ ⧸ Δ.subgroupOf Γ)` times that of `Γ`: this is Tau Ceti's
`covolume_eq_card_mul_covolume` applied to `ℍ³`, with infinite index giving `⊤`. A discrete group
has both hypotheses by §1.2; a Bianchi group has them through its explicit domain (§3.5),
without discreteness. For discrete `Γ`, `IsCofinite Γ` holds iff the covolume is not `⊤`, as in
`Subgroup.isCofinite_iff_covolume_ne_top`.

- Covolume is invariant under conjugation (`covolume_conjAct_smul`).
- For `Δ ≤ Γ`, `covolume Γ ≤ covolume Δ`, by the index law with index at least `1`.
- Commensurable cofinite groups have covolumes with rational ratio, and a group commensurable
  with a cofinite group is cofinite.

**Checks.**

- The translation group by `ℤ[i]` has the fundamental domain `[0, 1)² × (0, ∞)`, of infinite
  volume, so it is discrete and not cofinite.
- `PSL(2, ℤ)` inside `PSL(2, ℂ)` is discrete with covolume `⊤`.
- The index law at `Γ(2 + i) ≤ PSL(2, ℤ[i])` gives `60 · catalanConstant / 3`.

### Examples

Through §§3.5 and 4.3, `PSL(2, ℤ[i])` is cofinite with covolume `catalanConstant / 3`, although
it has torsion.

### Dependencies

Layer 0; the Tau Ceti fundamental-domain, proper-discontinuity and free-locus suppliers.

## Layer 2: Dirichlet domains

### 2.1 Dirichlet domains at a free point

Define `dirichletDomain Γ p₀`, the points at least as close to `p₀` as to every `g • p₀`, and
prove `isFundamentalDomain_dirichletDomain` for discrete `Γ` and `p₀` in the free locus, which
exists by `volume_compl_freeLocus`. The proof: the domain is closed and an intersection of
half-spaces bounded by geodesic planes, so its frontier is null; every orbit has a point
nearest `p₀`, by proper discontinuity; and two points of the interior in one orbit are equal,
because `p₀` has trivial stabilizer.

- A Dirichlet domain is star-shaped about its centre and locally finite, and
  `dirichletDomain (g Γ g⁻¹) (g • p₀) = g • dirichletDomain Γ p₀`.

**Checks.**

- For the group generated by `w ↦ w + 1`, the domain at `(0, 1)` is `{|re w| ≤ 1/2}`, since
  `cosh (dist p (n, 1)) = 1 + (|w − n|² + (t − 1)²)/(2t)`.
- At a centre fixed by `diag(i, −i)`, the "domain" contains each point together with its image,
  so it is not a fundamental domain: the free-point hypothesis is needed.

### Examples

For the translation group by `ℤ[i]`, the Dirichlet domain at `(0, 1)` is the column
`|re w|, |im w| ≤ 1/2`, of infinite volume, as in §1.3.

### Dependencies

Layers 0–1.

## Layer 3: Bianchi groups

### 3.1 Definitions and change of embedding

Define `bianchi` and `bianchiGamma` as in the conventions. Prove `bianchi_comp_algEquiv`, that
`bianchi F (ι ∘ σ) = bianchi F ι` for `σ ∈ Aut(F)`, since `σ` permutes `𝒪_F`, and
`bianchiGamma_comp_algEquiv`, that `bianchiGamma F (ι ∘ σ) I = bianchiGamma F ι (σ I)`.

- `bianchiGamma F ι I` is normal in `bianchi F ι`, reduction `SL(2, 𝒪_F) → SL(2, 𝒪_F / I)` is
  onto, and the index is `|SL(2, 𝒪_F / I)| / |{±1 mod I}|`, with `|SL(2, 𝒪_F / I)|` the product
  over the prime powers dividing `I`.
- The stabilizer of `∞` in `bianchi F ι` acts on `w` by `w ↦ u² w + b`, `u ∈ 𝒪_F^×`, `b ∈ 𝒪_F`;
  its translation subgroup is `𝒪_F`.
- `PSL(2, ℤ)` is a subgroup preserving the plane `im w = 0` and acting on it through Mathlib's
  upper half-plane action. `diag(i, −i)` also preserves that plane, acting as `x ↦ −x`, and is
  in `PSL(2, ℤ[i])` but not in `PSL(2, ℤ)`.
- Complex conjugation carries `bianchiGamma F ι I` to `bianchiGamma F (conj ∘ ι) I`.

**Checks.**

- `bianchi` takes the same value at the two complex embeddings of `GaussianField`, while
  `bianchiGamma` at `(2 + i)` for one embedding is `bianchiGamma` at `(2 − i)` for the other.
- For `ℤ[i]` and `I = (5)`, `(2i 5; −5 12i)` has determinant `1` and reduces to the central
  scalar `2i`, neither `1` nor `−1`: its class lies in the kernel of reduction to Mathlib's
  `PSL(2, ℤ[i]/(5))` but not in `bianchiGamma` at `(5)`, and the two indices are `3600` and
  `7200`.
- At `I = (2)` in `ℤ[i]`, `−1 ≡ 1`, so the index is `|SL(2, ℤ[i]/(2))| = 48`, not `24`.

### 3.2 Discreteness

Prove `isDiscrete_bianchi`, the imaginary-quadratic case of AA.3.4, the discreteness of
`Reduction.levelArithmetic`, at `x = 1` and the compact open level `∏_{v finite} SL₂(𝒪_v)`,
whose rational preimage is `SL(2, 𝒪_F)`. The adapter: `ι` identifies `F_∞` with `ℂ`, and
discreteness passes to `PSL(2, ℂ)` through the finite centre of `SL(2, ℂ)`.

**Checks.**

- For `F = ℚ` the image of `SL(2, ℤ)` is discrete too, but has infinite covolume (§1.3); the
  imaginary-quadratic hypothesis is for the covolume statements, not for discreteness.
- `SL(2, ℤ[√2])` embedded in `SL(2, ℂ)` by a real embedding is not discrete: `ℤ[√2]` is dense
  in `ℝ`.

### 3.3 Torsion in congruence subgroups

Prove `isTorsionFreeKleinian_bianchiGamma`: for `F` imaginary quadratic and an ideal
`I ≠ ⊤` with `2 ∉ I` and `3 ∉ I`, `bianchiGamma F ι I` is torsion free, hence, with §3.2,
`IsTorsionFreeKleinian`. The proof: if `A ≢ ±1` maps to an element of finite order, its
eigenvalues are roots of unity `ζ, ζ̄`, so `tr A = ζ + ζ̄` is real, lies in `𝒪_F ∩ ℝ = ℤ`, and has
absolute value below `2`, so `tr A ∈ {−1, 0, 1}`. `A ≡ 1 mod I` gives `tr A ≡ 2 mod I`, so `3`,
`2` or `1` lies in `I`.

**Checks.**

- At `I = (1 + i)` in `ℤ[i]`, `(1, 1 + i; −1 + i, −1)` has determinant `1`, trace `0`, lies in
  the kernel since `2 ∈ (1 + i)`, and has order `2` in `PSL`: the hypothesis `2 ∉ I` is needed.
- At `I = (√−3)` in `ℤ[ω]`, with `√−3 = 1 + 2ω`, `3 ∈ I`, and `(1, √−3; √−3, −2)` has
  determinant `−2 + 3 = 1`, trace `−1`, lies in the kernel, and has order `3`: the hypothesis
  `3 ∉ I` is needed.
- `(2 + i)` has norm `5` and `(3 + ω)` has norm `7`; neither divides `2` or `3`.

### 3.4 The named fields and groups

Define `GaussianField`, `EisensteinField`, `gaussianEmbedding`, `eisensteinEmbedding`,
`gaussianI`, `eisensteinOmega`, `bianchiGaussian`, `bianchiEisenstein`, and the congruence
subgroups `gammaGaussian` at `(2 + gaussianI)` and `gammaEisenstein` at `(3 + eisensteinOmega)`.
Prove `index_gammaGaussian` and `index_gammaEisenstein`: the indices are `60` and `168`, the
orders of `PSL(2, 𝔽₅)` and `PSL(2, 𝔽₇)`, since reduction is onto `SL(2, 𝔽₅)`, of order `120`, and
`SL(2, 𝔽₇)`, of order `336`, and `−1` is in neither kernel.

**Checks.**

- `gaussianI ^ 2 = −1` and `eisensteinOmega ^ 2 + eisensteinOmega + 1 = 0`.
- `𝒪_F / (2 + i) ≅ 𝔽₅` with `i ↦ 3`, and `𝒪_F / (3 + ω) ≅ 𝔽₇` with `ω ↦ 4`.
- Both `gammaGaussian` and `gammaEisenstein` are `IsTorsionFreeKleinian` by §3.3.

### 3.5 The Bianchi domains

With `p = (w, t)` and `w = x + y i`, define

- `gaussianDomain`: `|x| ≤ 1/2`, `0 ≤ y ≤ 1/2`, `|w|² + t² ≥ 1`;
- `eisensteinDomain`: `0 ≤ x ≤ 1/2`, `0 ≤ x + √3 y ≤ 1`, `|w|² + t² ≥ 1`.

Each is the region above the unit sphere over a fundamental domain in `ℂ` for the stabilizer of
`∞`: for `ℤ[i]` the half-square of area `1/2`, since `u² = ±1`; for `ℤ[ω]` the rhombus with
vertices `0`, `(1/2, ±1/(2√3))`, `(0, 1/√3)`, of area `1/(2√3)`, since `u²` is a cube root of
unity. Each floor lies in the Voronoi cell of `0` for `𝒪_F`, so over it the unit hemisphere about
`0` is the highest of the hemispheres `|w − b|² + t² = 1` (Elstrodt–Grunewald–Mennicke,
Chapter 7).

Prove `isFundamentalDomain_gaussianDomain` and `isFundamentalDomain_eisensteinDomain` by
`IsFundamentalDomain.of_disjoint_smul_interior`, with four lemmas:

1. *Height.* `height (g • p) = t / (|c w + d|² + |c|² t²)`.
2. *Covering.* For fixed `p` only finitely many `(c, d)` have `|c w + d|² + |c|² t² < 1`, so the
   orbit has a point of maximal height. The stabilizer of `∞` moves it over the floor without
   changing its height, and then `|w|² + t² ≥ 1`, since otherwise `(0 −1; 1 0)` raises it.
3. *Disjoint interiors.* If `p` and `g • p` are interior and `c ≠ 0`: for `|c| = 1`, `d/c` is
   integral and `|w + d/c|² + t² > 1` by the Voronoi property; for `|c|² ≥ 2` (Gaussian) or
   `|c|² ≥ 3` (Eisenstein), `|c|² t² > 1` because `t² > 1 − |w|²` and `|w|² ≤ 1/2` or `≤ 1/3` on
   the floor. Either way `height (g • p) < height p`, and `g⁻¹` gives the reverse. If `c = 0`,
   the floor is a fundamental domain for the stabilizer of `∞`.
4. *Null frontier.* The frontier lies in finitely many vertical planes and one sphere.

Torsion plays no part: `IsFundamentalDomain` is stated for any action.

**Checks.**

- `(0, 1/2)` is outside `gaussianDomain`, and `(0 −1; 1 0)` sends it to `(0, 2)`, inside.
- The Gaussian floor has area `1/2` and the Eisenstein floor `1/(2√3) ≈ 0.2887`.
- The full square `|x|, |y| ≤ 1/2` would contain `p` and `diag(i, −i) • p` for `p` off the
  axis, so it is not a fundamental domain: `u² = −1` must be quotiented.

### Examples

The congruence subgroups get no explicit domain: theirs are the finite unions of translates of
`IsFundamentalDomain.subgroup_iUnion_out_inv_smul`, and their covolumes come from the index law.

### Dependencies

Layers 0–1; AA.3.4 for §3.2.

## Layer 4: covolumes, special values and Humbert's formula

### 4.1 The constants

Define `catalanConstant` and `lchi3` and prove each equal to `DirichletCharacter.LFunction` at
the character modulo `4`, respectively `3`, and `s = 2`.

**Checks.**

- The partial sums `1 − 1/9 + 1/25 − 1/49 ≈ 0.90848` and `1 − 1/4 + 1/16 − 1/25 = 0.7725`; the
  limits are `0.915966` and `0.781302`.
- `catalan 2 = 2` in Mathlib is a Catalan number, not this constant.

### 4.2 Three log-sine integrals

Write `I(θ) = ∫₀^θ log(2 sin u) du` for `0 ≤ θ ≤ π`; the integrand is integrable by Mathlib's
`intervalIntegrable_log_sin`, and `I(π/2) = 0` by `integral_log_sin_zero_pi_div_two`. Prove
`integral_log_two_sin_pi_div_four`, `I(π/4) = −catalanConstant / 2`,
`integral_log_two_sin_pi_div_three`, `I(π/3) = −√3 · lchi3 / 4`, and
`integral_log_two_sin_pi_div_six`, `I(π/6) = −3√3 · lchi3 / 8`.

- For `0 < φ < 2π`, `e^{iφ} ∈ Ω`, so PolylogarithmFunctions §1.5 gives
  `d/dφ Li₂(e^{iφ}) = i Li₁(e^{iφ}) = −i Log(1 − e^{iφ})`, whose imaginary part is
  `−log|1 − e^{iφ}| = −log(2 sin(φ/2))`.
- Continuity of `Li₂` at `1` (§1.7), `Im Li₂(1) = 0` and the fundamental theorem of calculus with
  an integrable derivative give `Im Li₂(e^{2iθ}) = −2 I(θ)` for `0 ≤ θ ≤ π`.
- The closed-disc series gives `Im Li₂(e^{2iθ}) = ∑_{m ≥ 1} sin(2mθ)/m²`. At `θ = π/4`,
  `sin(mπ/2) = χ₋₄(m)`; at `θ = π/3`, `sin(2mπ/3) = (√3/2) χ₋₃(m)`; at `θ = π/6`,
  `sin(mπ/3) = (√3/2)(χ₋₃(m) + 2χ₋₃(m/2))`, with the second term only for even `m`, so the sum is
  `(√3/2)(3/2) lchi3`.

This is the Lobachevsky function `Λ(θ) = −I(θ)` of Polylogarithms §2.4 at three points; no
property of `Λ` beyond these values is used.

**Checks.**

- `−I(π/4) ≈ 0.457983`, `−I(π/3) ≈ 0.338314` and `−I(π/6) ≈ 0.507470`.
- `I(π/6) = (3/2) I(π/3)`, consistent with the duplication formula of Polylogarithms §2.4 at
  `θ = π/6`.
- The integrand `log |sin u|` without the factor `2` gives `I(π/2) = −(π/2) log 2 ≠ 0`.

### 4.3 Volumes of the Bianchi domains

Prove `volume_gaussianDomain` and `volume_eisensteinDomain`. By `volume_eq_withDensity` and
`∫_{√(1 − |w|²)}^∞ t⁻³ dt = 1/(2(1 − |w|²))`, the volume over a floor `P` is
`∫_P dA / (2(1 − |w|²))`.

- The Gaussian floor is four copies of the triangle `0 ≤ y ≤ x ≤ 1/2`, in polar coordinates
  `0 ≤ θ ≤ π/4`, `0 ≤ r ≤ 1/(2 cos θ)`, so its volume is `−∫₀^{π/4} log(1 − 1/(4 cos² θ)) dθ`.
- The Eisenstein floor is four copies of the right triangle with angle `π/6` at `0` and adjacent
  side `1/2`, so its volume is `−∫₀^{π/6} log(1 − 1/(4 cos² θ)) dθ`.
- `4 cos² θ − 1 = sin 3θ / sin θ` splits the integrand as
  `log|2 sin 3θ| − log|2 sin θ| − 2 log|2 cos θ|`. With `u = 3θ`, `u = π/2 − θ`, `u = π − θ`
  and `I(π/2) = 0`, the Gaussian volume is `−(2/3) I(π/4)` and the Eisenstein volume is
  `I(π/6) − 2 I(π/3)`.

So the volumes are `catalanConstant / 3` and `√3 · lchi3 / 8`, and with §3.5,
`covolume_bianchiGaussian` and `covolume_bianchiEisenstein`.

**Checks.**

- `catalanConstant / 3 ≈ 0.305322` and `√3 · lchi3 / 8 ≈ 0.169157`.
- Integrating `t⁻²` instead of `t⁻³` would make both volumes infinite.

### 4.4 The two manifold volumes

Prove `covolume_gammaGaussian` and `covolume_gammaEisenstein` by the index law with the indices
`60` and `168`: `60 · catalanConstant / 3 = 20 · catalanConstant` and
`168 · √3 · lchi3 / 8 = 21 · √3 · lchi3`.

**Checks.**

- `20 · catalanConstant ≈ 18.3193` and `21 · √3 · lchi3 ≈ 28.4184`.
- The index enters as a factor, not an exponent: `catalanConstant / 3` raised to the index
  would not be a covolume.

### 4.5 Zeta factorizations

Prove `zeta_gaussian_two`, `ζ_{ℚ(i)}(2) = ζ(2) · catalanConstant`, and `zeta_eisenstein_two`,
`ζ_{ℚ(ω)}(2) = ζ(2) · lchi3`, from the splitting of primes in the two fields and the Euler
product `dedekindZeta_two_eq_tprod`: `ζ_F(2) = ∏_𝔭 (1 − N𝔭⁻²)⁻¹` over the maximal ideals of
`𝒪_F`, from `NumberField.dedekindZeta` as the `LSeries` of ideal counts, unique factorization of
ideals and multiplicativity of the norm.

**Checks.**

- At `p = 5`, split in `ℤ[i]`, the local factor is `(1 − 5⁻²)⁻²`; at `p = 3`, inert, it is
  `(1 − 9⁻²)⁻¹ = (1 − 3⁻²)⁻¹ (1 + 3⁻²)⁻¹`, matching `χ₋₄(3) = −1`.
- At `p = 2`, ramified in `ℤ[i]`, the factor is `(1 − 2⁻²)⁻¹`, matching `χ₋₄(2) = 0`.

### 4.6 Humbert's formula

Prove `covolume_bianchi`: for `F` imaginary quadratic and any `ι`,

```text
covolume (bianchi F ι) = |d_F|^(3/2) · ζ_F(2) / (4π²).
```

The route is the Tamagawa number of `SL₂`:

1. *Local volumes.* For the standard model of `SL₂` over `𝒪_F` and its standard gauge form,
   `|ω|_v(SL₂(𝒪_v)) = 1 − q_v⁻²` at every finite `v` (AA.2.4, corrected volumes), so by
   `dedekindZeta_two_eq_tprod` the product over finite `v` is `ζ_F(2)⁻¹`.
2. *Strong approximation.* `SL₂` is simply connected and `SL₂(ℂ)` is noncompact, so by AA.4.2
   `SL₂(𝔸_F) = SL₂(F) · (SL₂(ℂ) × ∏_v SL₂(𝒪_v))`, and
   `SL₂(F)\SL₂(𝔸_F)` is `SL₂(𝒪_F)\SL₂(ℂ) × ∏_v SL₂(𝒪_v)` as a measure space.
3. *Tamagawa number one.* `τ(SL₂) = 1` (EndoscopicTransfer §6.2) with
   `τ = |d_F|^(−3/2) ∏_v |ω|_v` (AA.2.4, `λ_v = ρ = 1`) gives
   `|ω|_∞(SL₂(𝒪_F)\SL₂(ℂ)) = |d_F|^(3/2) ζ_F(2)`.
4. *Archimedean comparison.* There is `c > 0` with `|ω|_∞({g | g • (0, 1) ∈ E}) = c · volume E`
   for every measurable `E ⊆ ℍ³`, both sides being `SL₂(ℂ)`-invariant Radon measures on
   `SL₂(ℂ)/SU(2) = ℍ³`. For a discrete `Γ ∋ −1` with image `Γ̄` in `PSL(2, ℂ)`, the preimage `D′`
   of a fundamental domain of `Γ̄` satisfies `−D′ = D′`, and its `Γ`-translates cover `SL₂(ℂ)`
   twice, so `|ω|_∞(Γ\SL₂(ℂ)) = (c/2) · covolume Γ̄`.
5. *The constant.* At `F = ℚ(i)`, steps 3 and 4 with `covolume_bianchiGaussian` and
   `zeta_gaussian_two` give `8 · ζ(2) · catalanConstant = (c/2) · catalanConstant / 3`, so
   `c = 8π²`. Steps 3 and 4 at a general `F` then give the formula.

**Checks.**

- At `d_F = −4`: `8 · ζ(2) · catalanConstant / (4π²) = catalanConstant / 3 ≈ 0.305322`.
- At `d_F = −3`, an independent check of the constant `c`:
  `3√3 · ζ(2) · lchi3 / (4π²) = √3 · lchi3 / 8 ≈ 0.169157`, the value of §4.3.
- At `d_F = −7`: `7^(3/2) · ζ(2) · L(2, χ₋₇) / (4π²) ≈ 0.888785`, with `L(2, χ₋₇) ≈ 1.151757`.
- For `F = ℚ`, `SL₂(ℝ)/SO(2)` is two-dimensional; the formula is not claimed, and `PSL(2, ℤ)` has
  infinite covolume on `ℍ³`.

### Examples

`covolume_bianchi` at the two named fields recovers §4.3 through `zeta_gaussian_two` and
`zeta_eisenstein_two`; at `ℚ(i)` that agreement is used in step 5, at `ℚ(ω)` it is a consequence.

### Dependencies

Layers 1 and 3. PolylogarithmFunctions §§1.5 and 1.7 and Mathlib's log-sine integrals for
§4.2. AA.2.4, AA.4.2 and EndoscopicTransfer §6.2 for
§4.6. The index law of §4.4 uses the countability and fundamental-domain hypotheses of §1.3,
not `isDiscrete_bianchi`.

## Layer 5: the set of volumes, and Thurston's question

### 5.1 The set of volumes

Define `hyperbolicVolumes`: `v` is a member when some `IsTorsionFreeKleinian` and `IsCofinite`
subgroup of `PSL(2, ℂ)` has real covolume `v`. Prove `twenty_catalan_mem_hyperbolicVolumes` and
`eisenstein_mem_hyperbolicVolumes` from §§3.3 and 4.4; `mul_index_mem_hyperbolicVolumes`, that a
finite-index subgroup `Δ` of a witness `Γ` witnesses `[Γ : Δ] · v`; and
`rat_ratio_of_commensurable`.

- Members are positive, by `IsCofinite.covolume_pos`; the set is nonempty.
- Closure under every positive integer multiple is not a target: it needs an index-`n` subgroup
  of some witness for every `n`.

**Checks.**

- `catalanConstant / 3 ≈ 0.3053` and `√3 · lchi3 / 8 ≈ 0.1692` are not members: the Bianchi
  groups have torsion, and both values are below the minimum `0.9427` of a closed orientable
  hyperbolic 3-manifold (Milley, Theorem 1.3) and the minimum `2.0299` of a cusped one
  (Cao–Meyerhoff). A theorem placing them in the set would be false.
- `125 · 20 · catalanConstant` is a member, witnessed by `Γ((2 + i)²)`: it is torsion free by
  §3.3 and has index `5³ = 125` in `Γ(2 + i)`.

### 5.2 Geometric meaning

Prove `quotient_isFiniteVolumeHyperbolic`: for `IsTorsionFreeKleinian` and `IsCofinite` `Γ`,
the image of `Γ` under `exists_toIsom` and `UpperHalfSpace.congr` acts freely and properly
discontinuously on `ModelGeometry.hyperbolic.Space`, so `hasGeometricStructure_quotient` and
GeometricTopology §7.1 make `MulAction.orbitRel.Quotient Γ ℍ³` a complete hyperbolic
3-manifold, the quotient map of `isCoveringMap_quotientMk_freeLocus` is a local isometry, the
quotient satisfies `IsFiniteVolumeHyperbolic`, and its `TauCeti.riemannianVolume` is
`covolume Γ ℍ³ volume`, cusped case included.

**Checks.**

- For `Γ(2 + i)` the quotient is noncompact: the parabolic `(1, 2 + i; 0, 1)` lies in `Γ`.
- A group with torsion, such as `PSL(2, ℤ[i])`, gives an orbifold, and the theorem's hypothesis
  excludes it.

### 5.3 Thurston's question

Define `ThurstonQuestion23`: some two members `v, w` of `hyperbolicVolumes` have `v ≠ q · w`
for every rational `q`. Thurston, Bull. AMS 6 (1982), question 23, p. 380. It is a statement and
not a target. Incommensurable manifolds of equal volume exist (Millichap), so it is not the
converse of `rat_ratio_of_commensurable`.

**Checks.**

- `ThurstonQuestion23` unfolds to an existential over two members and a universal over `ℚ`; it
  is not closed by `decide` or `simp` from the definitions.
- Its negation says that all members are rational multiples of one another, not that they are
  rational.

### Examples

The pair `20 · catalanConstant` and `21 · √3 · lchi3` comes from fields with different
discriminants; irrationality of their ratio would answer the question. A worked bound:
with `N = 2000` partial terms, `G_N ≤ catalanConstant ≤ G_N + 1/(2N + 1)²` by alternation, and
`L_N ≤ lchi3 ≤ L_N + 2/(3N + 1)³ + 1/(3(3N + 1)²)` by bounding the `n`-th summand by
`2/(3n + 1)³` and the tail by the integral test. With `1732050807/10⁹ < √3 < 1732050808/10⁹`,
the ratio `≈ 0.6446293` lies strictly between `78/121` and `595/923`. These are Farey
neighbours, `595 · 121 − 78 · 923 = 1`, so a rational equal to the ratio has denominator at
least `121 + 923 = 1044`.

### Dependencies

Layers 1, 3 and 4; GeometricTopology §7.1 for §5.2.

## Downstream consumers

- **AdelicAlgebraicGroups** cites `isDiscrete_bianchi` (§3.2) as its imaginary-quadratic
  application of AA.3.4.
- **ArithmeticLocallySymmetricSpaces** cites `properlyDiscontinuousSMul_of_discrete` (§1.1) as
  its outbound proper-action boundary.
- **BianchiModularForms** and **MaassForms** use `bianchi`, the Bianchi domains and the
  covolumes of §§4.3 and 4.6.

## References

- Thurston, *Three-dimensional manifolds, Kleinian groups and hyperbolic geometry*,
  Bull. AMS 6 (1982), 357–381; question 23 on p. 380.
- Elstrodt, Grunewald, Mennicke, *Groups Acting on Hyperbolic Space*, Springer 1998: Chapter 1
  for the classification of elements by trace; Chapter 7 for the Bianchi domains;
  Chapter 8 for Humbert's formula by Eisenstein series, a different route from §4.6.
- Maclachlan, Reid, *The Arithmetic of Hyperbolic 3-Manifolds*, GTM 219, Springer 2003:
  Chapter 7 for Tamagawa number one of the norm-one group of a quaternion algebra, and
  Chapter 11, Theorem 11.1.3, for the volume formula that specializes to Humbert's.
- Borel, *Commensurability classes and volumes of hyperbolic 3-manifolds*, Ann. Sc. Norm. Sup.
  Pisa 8 (1981), 1–33, for the Tamagawa route to volumes of arithmetic groups.
- Ratcliffe, *Foundations of Hyperbolic Manifolds*, GTM 149, for fundamental polyhedra and
  Dirichlet domains.
- Milnor, *Hyperbolic geometry: the first 150 years*, Bull. AMS 6 (1982), 9–24, for the
  log-sine integrals as volumes.
- Humbert, *Sur la mesure des classes d'Hermite de discriminant donné*, C. R. Acad. Sci. Paris
  169 (1919).
- Neumann, Yang, *Bloch invariants of hyperbolic 3-manifolds*, Duke Math. J. 96 (1999), for why
  the question is arithmetic.
- Milley, *Minimum volume hyperbolic 3-manifolds*, J. Topol. 2 (2009), 181–192,
  [arXiv:0809.0346](https://arxiv.org/abs/0809.0346), Theorem 1.3.
- Cao, Meyerhoff, *The orientable cusped hyperbolic 3-manifolds of minimum volume*, Invent.
  Math. 146 (2001), 451–478.
- Millichap, *Mutations and short geodesics in hyperbolic 3-manifolds*, Comm. Anal. Geom. 25
  (2017), 625–683, [arXiv:1406.6033](https://arxiv.org/abs/1406.6033).

## Provenance

The Bianchi domains, the index computations, the integration route and the bound on the ratio
were first formalized in [t4v1/thurston23](https://github.com/t4v1/thurston23), by the author of
this roadmap, whose README and `Thurston23Eisenstein.lean` state the domains above. It is a
cited source, not the specification.
