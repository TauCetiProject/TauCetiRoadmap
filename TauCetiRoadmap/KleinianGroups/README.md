# Roadmap: Kleinian groups, hyperbolic 3-manifolds, and arithmetic volume

This roadmap develops discrete subgroups of `PSL(2,C)` acting on hyperbolic 3-space, their
fundamental domains and covolumes, the Bianchi groups and their congruence subgroups, and the
arithmetic volume of the quotients. Volumes are computed from explicit fundamental domains and
named constants, not asserted.

Hyperbolic 3-space is Tau Ceti's upper half-space model `TauCeti.UpperHalfSpace C`, written
`ℍ³` below, with its Riemannian metric, Riemannian distance and Riemannian volume. This roadmap
adds the Moebius action of `PSL(2,C)` on it and everything Kleinian built on that action.

The main reusable endpoint is the covolume of the two Bianchi groups of smallest discriminant,
computed by integrating over their explicit fundamental domains: the covolume of
`PSL(2, Z[i])` is Catalan's constant over three, and the covolume of `PSL(2, Z[omega])` is
`sqrt 3 * L(2, chi_(-3)) / 8`. These are the two cases of Humbert's formula,
`covolume (PSL(2, O_F)) = |d_F|^(3/2) * zeta_F 2 / (4 * pi^2)`, in which the zeta value factors
through a classical constant; the general formula is stated in layer 4 as motivation and
labeled a roadmap-for-a-roadmap, not a target. A second endpoint is two manifold volumes
obtained from those covolumes by the index law, `20 * catalanConstant` for
`Gamma(2 + i) \ ℍ³` and `21 * sqrt 3 * L(2, chi_(-3))` for `Gamma(3 + omega) \ ℍ³`, as members
of the set of volumes of hyperbolic 3-manifolds. A third endpoint is a faithful statement of
Thurston's twenty-third question, that the volumes of hyperbolic 3-manifolds are not all
rationally related, which is open, together with one explicit finite approximation of it that
is provable.

This roadmap is the three-dimensional counterpart of
[FuchsianOrbifolds](../FuchsianOrbifolds/README.md), which excludes general Kleinian groups
and higher-dimensional symmetric spaces from its scope. It is the explicit, arithmetic
counterpart of layer 7.1 of [GeometricTopology](../GeometricTopology/README.md), which owns
the general theory of hyperbolic `n`-manifolds as quotients `ℍⁿ / Γ`, the statement that the
volume of `ℍⁿ / Γ` is the volume of a fundamental domain, the volume form `y⁻ⁿ dx dy` of the
upper half space, and the identification of the whole of `Isom(ℍ³)` with `PSL₂(ℂ) ⋊ ℤ/2`. This
roadmap consumes the first three of those statements, in layers 0 and 5, and nothing else from
that layer.

Suggested homes: `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Moebius.lean`
for the action; `TauCeti/Geometry/Hyperbolic/Kleinian/` for discrete subgroups, fundamental
domains, and covolume; `TauCeti/NumberTheory/Bianchi/` for the Bianchi groups and their
covolumes; `TauCeti/Analysis/SpecialFunctions/Lobachevsky.lean` for the log-sine integrals.

## Scope and completion criterion

The scope is discrete subgroups of `PSL(2,C)` acting on `ℍ³`, with special attention to
Bianchi groups, congruence subgroups, torsion-free subgroups of finite index, and covolume. It
computes the covolumes of the Bianchi groups of the two smallest discriminants from explicit
fundamental domains; it does not prove Humbert's formula for a general imaginary quadratic
field, does not classify Kleinian groups, does not develop deformation theory, and does not
touch the hyperbolic Dehn surgery that would construct the Weeks manifold.

Mostow rigidity, geometrization, the classification of cusped 3-manifolds by volume,
Teichmueller and quasi-Fuchsian theory, and the irrationality of any ratio of volumes are
outside this roadmap. The last of these is open mathematics, not a missing layer: what this
roadmap delivers about it is a faithful statement and the finite approximations of it that
are provable, never the theorem itself.

The roadmap is complete when Tau Ceti proves the following.

1. `PSL(2,C)` acts on `ℍ³` by Moebius transformations, through an injective homomorphism to
   the Riemannian isometry group `TauCeti.Isom`, so each element is an isometry for the
   Riemannian distance and preserves the Riemannian volume; that volume is `t⁻³ dx dy dt`, and
   the distance satisfies the closed `cosh` formula.
2. A discrete subgroup acts properly discontinuously, its non-free locus is null, and it has
   a measurable fundamental domain; a torsion-free discrete subgroup acts freely; the
   covolume of a discrete subgroup is independent of the fundamental domain, and a subgroup
   of index `n` has `n` times the covolume.
3. For an imaginary quadratic ring of integers `O_F`, the Bianchi group `PSL(2, O_F)` is
   discrete; explicit domains above the unit sphere are fundamental domains for
   `PSL(2, Z[i])` and `PSL(2, Z[omega])`; and the congruence subgroups `Gamma(2 + i)` and
   `Gamma(3 + omega)` are torsion free, of index `60` and `168`.
4. The covolumes of `PSL(2, Z[i])` and `PSL(2, Z[omega])` are `catalanConstant / 3` and
   `sqrt 3 * L 2 chi_(-3) / 8`, by integration over those domains, and the covolumes of
   `Gamma(2 + i)` and `Gamma(3 + omega)` are `20 * catalanConstant` and
   `21 * sqrt 3 * L 2 chi_(-3)`, by the index law.
5. `zeta_(Q(i)) 2 = zeta 2 * L 2 chi_(-4)` and `zeta_(Q(omega)) 2 = zeta 2 * L 2 chi_(-3)`,
   so the two Bianchi covolumes are the values `|d_F|^(3/2) * zeta_F 2 / (4 * pi^2)` that
   Humbert's formula predicts.
6. The set of volumes of hyperbolic 3-manifolds is defined by a witnessing group, contains
   the two manifold volumes of item 4, is closed under multiplication by the index of a
   finite-index subgroup of a witnessing group, and each of its members is the Riemannian
   volume of a finite-volume hyperbolic 3-manifold; Thurston's question is stated against it,
   with `NoSmallRationalRatio 1000` proved as its finite approximation.

## Scope and ownership

Tau Ceti already has hyperbolic space, and this roadmap does not plan it again:
`TauCeti.UpperHalfSpace E` with `TauCeti.UpperHalfSpace.riemannianMetric`,
`TauCeti.UpperHalfSpace.hyperbolicMetric` (curvature `-1` and completeness), the similarities
and inversions of `Riemannian/Isometry/UpperHalfSpace.lean` with their classification
`exists_eq_similarity_or_exists_eq_inversion_mul_similarity`, the Riemannian distance
`TauCeti.MetricSpace.ofRiemannianMetric`, the Riemannian volume `TauCeti.riemannianVolume`,
and its isometry invariance `TauCeti.RiemannianIsometry.measurePreserving_riemannianVolume`.

This roadmap **owns** the Moebius action of `SL(2,C)` and `PSL(2,C)` on
`TauCeti.UpperHalfSpace C`, its coordinate formula and quaternionic description, the
measure and metric instances on `TauCeti.UpperHalfSpace C`, and everything Kleinian:
discreteness, the non-free locus, fundamental domains and covolume in dimension three, Bianchi
groups, their covolumes, and the set of volumes. The action is stated on the carrier
`TauCeti.UpperHalfSpace C`, and a development that needs `PSL(2,C)` acting on the upper
half-space uses it there rather than defining a second action.

It **consumes** rather than rebuilds:

- From Mathlib, `MeasureTheory.IsFundamentalDomain`, `HasFundamentalDomain` and
  `MeasureTheory.covolume`.
- From Tau Ceti's `MeasureTheory/Group/FundamentalDomain.lean`, the subgroup construction
  `IsFundamentalDomain.subgroup_iUnion_out_inv_smul`, the index law
  `covolume_eq_card_mul_covolume`, `covolume_pos`, `covolume_conjAct_smul`, and the tiling
  criterion `IsFundamentalDomain.of_disjoint_smul_interior`; from
  `MeasureTheory/Group/ProperlyDiscontinuous.lean`,
  `exists_isFundamentalDomain_of_properlyDiscontinuousSMul`; from
  `Topology/Algebra/GroupAction/FreeLocus.lean`, `TauCeti.freeLocus` and
  `isCoveringMap_quotientMk_freeLocus`. These are stated for a general group action and are
  exactly what layers 1 and 2 need; no second copy is made in dimension three.
- From GeometricTopology layer 7.1, the density formula of the Riemannian volume of the upper
  half space, the quotient theorem for discrete torsion-free groups of isometries, and the
  statement that the volume of the quotient is the volume of a fundamental domain.
- From AdelicAlgebraicGroups AA.3.4, arithmetic discreteness, through the adapter described in
  layer 3.
- Mathlib's `DirichletCharacter`, `LSeries`, `NumberField` and cyclotomic-field machinery, for
  layers 3 and 4.

## Pinned conventions

These conventions prevent two agents from building locally plausible but mutually unusable
APIs, and they are the places where a three-dimensional development can silently diverge
from the two-dimensional one.

- `ℍ³` is `TauCeti.UpperHalfSpace C`: the points `(w, t)` with `w : C`, `t : R`, `0 < t`, in
  `WithLp 2 (C × R)`, reached through Tau Ceti's coercion and `TauCeti.UpperHalfSpace.height`.
  The horizontal factor is `C` rather than `EuclideanSpace R (Fin 2)`, because the Moebius
  formula is complex arithmetic in `w` and the Bianchi groups are matrices over subrings of
  `C`. The linear isometry `C ≃ₗᵢ[R] EuclideanSpace R (Fin 2)` given by
  `Complex.orthonormalBasisOneI` induces a Riemannian isometry from `ℍ³` to
  `TauCeti.ModelGeometry.hyperbolic.Space`; that isometry is a layer-0 target, and every
  comparison with GeometricTopology goes through it. No private type of hyperbolic space is
  introduced.
- The measurable structure on `ℍ³` is `borel`, and hyperbolic volume is a `MeasureSpace`
  instance whose `volume` is `TauCeti.riemannianVolume 𝓘(R, WithLp 2 (C × R)) ℍ³`, so that
  `volume` names it, exactly as `UpperHalfPlane` does in dimension two. Its description as
  Lebesgue measure on the open half-space weighted by `t⁻³`, `volume_eq_withDensity`, is a
  theorem, the analogue of Mathlib's `UpperHalfPlane.volume_def`, and the integrals of layer 4
  are computed from it.
- Hyperbolic distance is the `MetricSpace` instance
  `TauCeti.MetricSpace.ofRiemannianMetric 𝓘(R, WithLp 2 (C × R)) ℍ³`. The formula
  `cosh (dist p q) = 1 + ‖p - q‖² / (2 * height p * height q)`, with `‖p - q‖` the Euclidean
  distance in `WithLp 2 (C × R)`, and its form `dist_eq` through `arsinh`, are theorems, the
  exact analogues of `UpperHalfPlane.cosh_dist` and `UpperHalfPlane.dist_eq`. On the slice
  `w ∈ R` the distance agrees with Mathlib's `UpperHalfPlane.dist`, so that this roadmap and
  FuchsianOrbifolds cannot drift apart. The name is `dist`, through the instance, not a private
  `hdist`.
- The acting group is `PSL(2,C)`, Mathlib's `Matrix.ProjectiveSpecialLinearGroup (Fin 2) C`,
  as in FuchsianOrbifolds, with the quotient topology Mathlib supplies. `A = (a b; c d)` in
  `SL(2,C)` acts by `J = |c w + d|² + |c|² t²`,
  `A • (w, t) = (((a w + b) * conj (c w + d) + a * conj c * t²) / J, t / J)`. This coordinate
  formula is the definition; `J > 0` because `c = 0` forces `d ≠ 0`. The action factors
  through `PSL(2,C)` because `-A` gives the same formula, and stabilizer and effectiveness
  results are stated for the projective action, whose kernel on `ℍ³` is trivial.
- The group law is not derived from the coordinates. The point `(w, t)` is the quaternion
  `q = re w + (im w) i + t j`, and `toQuaternion (A • p) = (a q + b) (c q + d)⁻¹`, with the
  entries of `A` embedded in `ℍ[R]` along `1, i`; the composition law follows from
  associativity in `ℍ[R]`. Deriving it from the coordinate formula directly is the known way to
  make this layer unpleasant.
- The isometry property is not a Jacobian computation. An element with `c = 0` acts as Tau
  Ceti's `UpperHalfSpace.similarity`: `(a b; 0 a⁻¹)` has scale `|a|²`, rotation
  `w ↦ (a / conj a) w`, and translation `a b`. An element with `c ≠ 0` factors as
  `(1/c a; 0 c) * (0 -1; 1 0) * (1 d/c; 0 1)`, and `(0 -1; 1 0)` acts as
  `UpperHalfSpace.inversion 0 1` followed by the linear isometry `w ↦ -conj w`. So every
  element of `PSL(2,C)` acts by an element of `TauCeti.Isom`, and isometry and volume
  invariance are consequences of Tau Ceti's theorems for `Isom`.
- A **Kleinian action** is free and properly discontinuous by isometries. Discreteness and
  torsion-freeness are derived, not assumed. This is the opposite of the two-dimensional
  convention in FuchsianOrbifolds, where discreteness is the input, and the difference is
  deliberate: a manifold quotient, not an orbifold, is what a volume is being attached to.
  Both directions are proved, so the two entry points meet.
- Covolume is Mathlib's `MeasureTheory.covolume`, valued in `ℝ≥0∞`, of the subgroup acting
  on `ℍ³` with `volume`. Its value on a given fundamental domain comes from
  `IsFundamentalDomain.covolume_eq_volume`, and existence from `HasFundamentalDomain`; this
  roadmap adds no second notion of covolume. A group is **cofinite** exactly when it is
  discrete and its covolume is not `⊤`, the shape of Tau Ceti's `Subgroup.IsCofinite` for
  Fuchsian groups, with discreteness a field of the structure and not a consequence of the
  covolume condition: a nondiscrete group can have covolume `0`, so finiteness alone is not
  a lattice condition. Positivity of the covolume of a cofinite group is a theorem, not part
  of the definition.
- `bianchi F ι` is the image in `PSL(2,C)` of `SL(2, O_F)` under the ring map
  `ι.comp (algebraMap (𝓞 F) F)`, for a number field `F` and an embedding `ι : F →+* C`. The
  definition needs nothing more; the theorems about it assume that `F` is imaginary quadratic,
  stated in Mathlib's vocabulary as `Module.finrank Q F = 2` and `IsTotallyComplex F`. Nothing
  is claimed for other number fields; `PSL(2, Z)` inside `PSL(2,C)` has infinite covolume on
  `ℍ³`. The full group does not depend on the embedding: an automorphism `σ` of `F` permutes
  `O_F`, so `bianchi F (ι.comp σ) = bianchi F ι` as subgroups of `PSL(2,C)`. The embedding is
  still data, because a congruence subgroup of a fixed level does depend on it.
- `bianchiGamma F ι I` is the image in `PSL(2,C)` of the kernel of reduction
  `SL(2, O_F) → SL(2, O_F / I)`. Its quotient in `bianchi F ι` is `SL(2, O_F / I)` modulo the
  image of `{±1}`. That is Mathlib's `PSL(2, O_F / I)`, the quotient by the full centre, only
  when the centre of `SL(2, O_F / I)` is the image of `{±1}`, which holds for a prime `I` but
  not in general: for `O_F = Z[i]` and `I = (5)` the matrix `(2i 5; -5 12i)` has determinant
  `1` and reduces to the central scalar `2i`, which is neither `1` nor `-1`, so the kernel of
  reduction to Mathlib's `PSL(2, O_F / I)` has index `3600` while `bianchiGamma` has index
  `7200`. Embeddings transport levels: `bianchiGamma F (ι.comp σ) I` is
  `bianchiGamma F ι (σ I)`, so the two complex embeddings of `Q(i)` exchange the levels
  `(2 + i)` and `(2 - i)`. Complex conjugation, which relates the two embeddings, acts on
  `ℍ³` as the orientation-reversing isometry `(w, t) ↦ (conj w, t)`; it is not an element of
  `PSL(2,C)`, and it carries `bianchiGamma F ι I` to `bianchiGamma F (conj ∘ ι) I`, so the
  two have the same covolume.
- The two named fields are `CyclotomicField 4 Q` and `CyclotomicField 3 Q`, each embedded in
  `C` by `IsAlgClosed.lift`, with `i` and `omega` the integral primitive roots
  `(IsCyclotomicExtension.zeta_spec n Q _).toInteger`. The two named congruence subgroups are
  `bianchiGamma` at the ideals `(2 + i)` and `(3 + omega)`, of norms `5` and `7`. Their indices,
  `60` and `168`, are the orders of `PSL(2, F_5)` and `PSL(2, F_7)`, since reduction is onto and
  `-1` is not in the kernel; both are torsion free, so the quotients are manifolds.
- Catalan's constant has no name in Mathlib, so layer 4 introduces `catalanConstant`, as the
  sum `∑ (-1)^n / (2n+1)^2`, and proves it equal to `DirichletCharacter.LFunction` at the
  character mod `4` and `s = 2`; `L(2, χ₋₃)` is `lchi3`, treated the same way. The name is not
  `catalan`, which in Mathlib is the Catalan *numbers* `ℕ → ℕ`. Every theorem about volumes
  states the constant, not a decimal enclosure. Numerical enclosures may exist as separate
  lemmas and may never appear in the statement of a volume.
- No `native_decide`, in line with the library's axiom audit. Rational arithmetic on explicit
  matrices is `decide` or `norm_num`.

## Existing foundations to consume

The two-dimensional case is largely in Mathlib and Tau Ceti, and this roadmap is written to
mirror it declaration by declaration rather than to reinvent it.

- **The upper half-plane, in Mathlib.** `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean`
  gives `UpperHalfPlane.volume` as a `MeasureSpace` instance, its `volume_def` through
  `withDensity`, and `SMulInvariantMeasure (GL (Fin 2) R) H volume`.
  `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean` gives the `Dist` instance, `dist_eq`,
  and `cosh_dist`. Layer 0 states the three-dimensional counterparts of these, on Tau Ceti's
  half-space.
- **Hyperbolic space, in Tau Ceti.** `Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/`
  (`Basic.lean`, `Metric.lean`, `Curvature.lean`), `Hyperbolic/Completeness.lean`,
  `Riemannian/Isometry/UpperHalfSpace.lean`, `Riemannian/Isometry/Action.lean` (the evaluation
  action of `Isom` and its faithfulness), `Riemannian/Distance.lean`,
  `Riemannian/VolumeDensity/Volume.lean` and `Riemannian/VolumeDensity/Isometry.lean`, as listed
  under ownership; `Riemannian/ModelGeometry/Basic.lean` for `ModelGeometry.hyperbolic`, whose
  space is `TauCeti.UpperHalfSpace (EuclideanSpace R (Fin 2))`; and
  `Riemannian/GeometricStructure/Basic.lean` for `hasGeometricStructure_quotient`.
- **Fundamental domains.** In Mathlib, `MeasureTheory.IsFundamentalDomain`,
  `HasFundamentalDomain`, `covolume` valued in `ℝ≥0∞`, and
  `IsFundamentalDomain.covolume_eq_volume`, in
  `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`. In Tau Ceti, the declarations of
  `MeasureTheory/Group/FundamentalDomain.lean`, `MeasureTheory/Group/ProperlyDiscontinuous.lean`
  and `Topology/Algebra/GroupAction/FreeLocus.lean` listed under ownership, and
  `Analysis/Complex/Fuchsian/Covolume.lean`, whose `volume_compl_freeLocus`,
  `hasFundamentalDomain` and cofiniteness criterion are the two-dimensional models for layer 1.
- **Groups and quaternions, in Mathlib.** `Matrix.ProjectiveSpecialLinearGroup` with the
  scoped `PSL(n, R)` notation and its quotient topology; `Quaternion` and the normed structure
  in `Mathlib/Analysis/Quaternion.lean`; `ProperlyDiscontinuousSMul` in
  `Mathlib/Topology/Algebra/ConstMulAction.lean`. `T2Space PSL(2,C)` is already an instance,
  from Tau Ceti's `Subgroup.isClosed_center` (`Topology/Algebra/Group/Subgroup.lean`) and
  Mathlib's Hausdorff quotient by a closed normal subgroup; it is not proved again.
- **Number theory, in Mathlib.** `NumberField.dedekindZeta`, `NumberField.discr`,
  `DirichletCharacter.LFunction`, and `CyclotomicField` with `IsCyclotomicExtension.zeta_spec`
  and `IsPrimitiveRoot.toInteger`. Mathlib has the Dedekind zeta function and no special
  values of it at `s = 2`; producing the two this roadmap needs is layer 4's work.
- **What does not exist.** Neither library has an action of `PSL(2,C)` on hyperbolic 3-space,
  a name for Catalan's constant, the Lobachevsky function, or a fundamental domain for a
  Bianchi group. The first is a target of layer 0, the second and third of layer 4, and the
  fourth of layer 2.

## Layer 0: the Moebius action, the measure, and the distance

**What to build.** The coordinate action of `SL(2,C)` on `ℍ³`, its quaternionic description
and group law, its factoring through `PSL(2,C)`, and the homomorphism
`toIsom : PSL(2,C) →* TauCeti.Isom 𝓘(R, WithLp 2 (C × R)) ℍ³` obtained from the
decomposition into similarities and inversions described under the pinned conventions:
`toIsom g` is the element of `Isom` whose underlying map is `p ↦ g • p`, and it is a
homomorphism because the action is. Then the measure and metric instances on
`ℍ³`, their coordinate descriptions, and the comparisons with the two-dimensional model and
with `ModelGeometry.hyperbolic`.

**Deliverables.** The `MulAction SL(2,C) ℍ³` and `MulAction PSL(2,C) ℍ³` instances, `smul_def`
(the coordinate formula) and `toQuaternion_smul`; `toIsom` and `toIsom_injective`;
`isometry_smul`; the `MeasurableSpace`, `BorelSpace` and `MeasureSpace` instances on `ℍ³`, and
`volume_eq_withDensity`; the `MetricSpace` instance, `dist_eq` and `cosh_dist`; the instances
`SecondCountableTopology ℍ³`, `LocallyCompactSpace ℍ³`, `SecondCountableTopology PSL(2,C)`,
`ContinuousConstSMul PSL(2,C) ℍ³`, `MeasurableConstSMul PSL(2,C) ℍ³` and
`SMulInvariantMeasure PSL(2,C) ℍ³ volume`; `ofUpperHalfPlane` and `dist_ofUpperHalfPlane`, the
agreement of the slice `w ∈ R` with Mathlib's upper half-plane distance, together with the
equivariance `ofUpperHalfPlane (g • z) = g • ofUpperHalfPlane z` for `g` in `SL(2,R)`; and
`UpperHalfSpace.congr`, the Riemannian isometry `UpperHalfSpace E ≃ UpperHalfSpace F` induced
by a linear isometry `E ≃ₗᵢ[R] F`, applied to `Complex.orthonormalBasisOneI` to identify `ℍ³`
with `ModelGeometry.hyperbolic.Space`.

`volume_eq_withDensity` is the case `E = C` of the density formula of GeometricTopology layer
7.1, transported along `UpperHalfSpace.congr` by
`RiemannianIsometry.measurePreserving_riemannianVolume`.
*Needs:* GeometricTopology layer 7.1 (the volume form `y⁻ⁿ dx dy` of the upper half space).

**API.** `volume` carries sigma-finiteness, local finiteness, `IsOpenPosMeasure`, the value on
a box in closed form, and absolute continuity in both directions against Lebesgue measure on
the open half-space. `dist` carries the formula for two points on a vertical line, the
geodesic through two points, and completeness, the last from Tau Ceti's
`UpperHalfSpace.completeSpace_of_riemannianMetric`. The action carries continuity, the
stabilizer of a point, transitivity, and the identification of the stabilizer of `(0, 1)` with
`PSU(2)`.

**Unlocks.** Everything below.

## Layer 1: discrete subgroups, fundamental domains, and covolume

**What to build.** Discreteness implies proper discontinuity on `ℍ³`; a torsion-free discrete
subgroup acts freely; `IsKleinian` as the predicate for the quotient being a manifold, with
both implications to the discrete-and-torsion-free form. Then the measure theory of the
non-free locus, which is what lets groups with torsion, the Bianchi groups among them, have
fundamental domains and covolumes:

1. The fixed-point set in `ℍ³` of an element `g ≠ 1` of `PSL(2,C)` is empty or a complete
   geodesic: by the classification of elements by trace (Elstrodt–Grunewald–Mennicke,
   chapter 1), only elliptic elements have fixed points, and an elliptic element fixes its axis
   pointwise and nothing else. A geodesic lies in a vertical plane, which is Lebesgue-null, so
   the fixed-point set is `volume`-null by `volume_eq_withDensity`. Both steps are needed:
   `diag(i, -i)` fixes the whole vertical geodesic `{(0, t)}`, an uncountable set, so the
   countability argument of the two-dimensional `volume_compl_freeLocus` does not transfer;
   and in `SL(2,C)` the element `-1` fixes all of `ℍ³`, so the statement is for the projective
   action.
2. For a countable `Γ ≤ PSL(2,C)`, `volume (freeLocus Γ ℍ³)ᶜ = 0`, as a countable union of the
   null sets of item 1.
3. A discrete subgroup is countable, from second countability of `PSL(2,C)`, and has a
   measurable fundamental domain, from
   `exists_isFundamentalDomain_of_properlyDiscontinuousSMul` with item 2 as its null-set
   hypothesis and the layer-0 instances as its topological ones. This is the
   `HasFundamentalDomain` statement every covolume below uses.

Then covolume: independence of the fundamental domain, the index law, positivity, and the
cofiniteness criterion in the shape of `Fuchsian.Covolume.isCofinite_iff_covolume_ne_top`.
The index law is Tau Ceti's `covolume_eq_card_mul_covolume` specialized to `ℍ³`, and it is
stated with that theorem's orientation and hypotheses: for `Δ ≤ Γ`, the covolume of `Δ` is
`ENat.card (Γ ⧸ Δ.subgroupOf Γ)` times the covolume of `Γ`, the index `[Γ : Δ]` counted in
`ℕ∞` so that infinite index gives `⊤` rather than the zero-totalized `ℕ`-valued
`Subgroup.index`, under `[Countable Γ]` and `[HasFundamentalDomain Γ ℍ³ volume]`. A discrete
`Γ` satisfies both by item 3. A Bianchi group satisfies both without any appeal to
discreteness: it is countable as an image of `SL(2, O_F)`, and its explicit domain of layer 2
is a fundamental domain.

**Deliverables.** `properlyDiscontinuousSMul_of_discrete`, `IsKleinian`,
`isKleinian_iff_discrete_and_torsionFree`, `volume_fixedPoints_eq_zero`,
`volume_compl_freeLocus`, `countable_of_discrete`, `hasFundamentalDomain_of_discrete`,
`covolume_eq_index_mul_covolume` as a corollary of the general lemma, `IsCofinite` as a
structure with `DiscreteTopology Γ` and `covolume Γ ℍ³ volume ≠ ⊤` as its fields,
`isCofinite_iff_covolume_ne_top`, and `IsCofinite.covolume_pos`, the last from Tau Ceti's
`covolume_pos`.
*Needs:* layer 0 (the action, the instances, `volume_eq_withDensity`).

**API.** `IsKleinian` is closed under passing to a subgroup and under conjugation, and is
preserved by the two constructions that produce new groups here, intersection and finite
index. Covolume carries monotonicity under inclusion, invariance under conjugation (Tau
Ceti's `covolume_conjAct_smul`), the value on the trivial group, and the two-sided relation
with commensurability: commensurable cofinite groups have covolumes with rational ratio,
and a group commensurable with a cofinite group is cofinite.

**Design note.** The index law gives a rational relation between the volumes of any two
commensurable groups. It is not the only source of rational relations: there are
incommensurable hyperbolic knot complements of equal volume (Millichap). Layer 5 uses the index
law for closure of the set of volumes and for `rat_ratio_of_commensurable`.

## Layer 2: fundamental domains

**What to build.** Dirichlet domains for a discrete subgroup, centred at a point with trivial
stabilizer, which exists by `volume_compl_freeLocus`; and the explicit fundamental domains of
the two Bianchi groups of smallest discriminant.

The explicit domains, with `p = (w, t)` and `w = x + y i`:

- `gaussianDomain`: `|x| ≤ 1/2`, `0 ≤ y ≤ 1/2`, `|w|² + t² ≥ 1`, for `bianchiGaussian`;
- `eisensteinDomain`: `0 ≤ x ≤ 1/2`, `0 ≤ x + sqrt 3 * y ≤ 1`, `|w|² + t² ≥ 1`, for
  `bianchiEisenstein`.

Each is the region above the unit sphere over a fundamental domain in `C` for the stabilizer of
`∞`, which acts on `w` by `w ↦ u² w + b` with `u` a unit and `b` in the ring of integers: for
`Z[i]` the half-square of area `1/2`, since `u² = ±1`; for `Z[omega]` the rhombus with vertices
`0`, `(1/2, ± 1/(2 sqrt 3))`, `(0, 1/sqrt 3)`, of area `1/(2 sqrt 3)`, since `u²` is a cube root
of unity. Each floor lies in the Voronoi cell of `0` for the lattice of integers, so over it the
unit hemisphere about `0` is the highest of the hemispheres `|w - b|² + t² = 1`. These are the
Bianchi domains of Elstrodt–Grunewald–Mennicke, chapter 7.

The proof that each is a fundamental domain applies Tau Ceti's
`IsFundamentalDomain.of_disjoint_smul_interior` (null-measurable, almost-everywhere covering,
null translated frontiers, disjoint interiors) with these inputs, each a separate lemma:

1. *Height.* For `g = (a b; c d)`, `height (g • p) = t / (|c w + d|² + |c|² t²)`.
2. *Covering.* Every orbit meets the domain. For fixed `p` only finitely many pairs `(c, d)` of
   integers have `|c w + d|² + |c|² t² < 1`, so the orbit has a point of maximal height. Move
   such a point over the floor by the stabilizer of `∞`, which does not change its height. It
   then satisfies `|w|² + t² ≥ 1`, since otherwise `(0 -1; 1 0)` would raise its height.
3. *Disjoint interiors.* Let `p` and `g • p` both lie in the interior, with `g` not fixing `∞`,
   so `c ≠ 0`. If `|c| = 1`, then `d / c` is an integer and `|w + d/c|² + t² > 1` in the
   interior, by the Voronoi property. If `|c|² ≥ 2` (Gaussian) or `|c|² ≥ 3` (Eisenstein), then
   `|c|² t² > 1`, because `t² > 1 - |w|²` and `|w|² ≤ 1/2` or `|w|² ≤ 1/3` on the floor. Either
   way `height (g • p) < height p`, and the same argument for `g⁻¹` gives the reverse
   inequality. If `g` fixes `∞`, the floor is a fundamental domain for its action on `C`.
4. *Null frontier.* The frontier lies in finitely many vertical planes and one sphere, each
   Lebesgue-null.

The torsion of the Bianchi groups plays no part: `IsFundamentalDomain` is stated for any
action, and torsion-freeness is needed only for the membership statements of layer 5.

**Deliverables.** `dirichletDomain` and `isFundamentalDomain_dirichletDomain`;
`gaussianDomain`, `eisensteinDomain`, `isFundamentalDomain_gaussianDomain` and
`isFundamentalDomain_eisensteinDomain`.
*Needs:* layer 1 (`volume_compl_freeLocus`, for the Dirichlet domain of a group with torsion);
layer 3 (`bianchiGaussian`, `bianchiEisenstein`, their stabilizers of `∞`), for the explicit
domains only.

**API.** A Dirichlet domain is open, is star-shaped about its centre, is locally finite, and
changes by the expected equivariance when the centre moves or the group is conjugated. The
congruence subgroups get no explicit domain of their own: theirs are the finite unions of
translates that `IsFundamentalDomain.subgroup_iUnion_out_inv_smul` already supplies, and their
covolumes come from the index law.

**Design note.** The explicit route is the one that reaches a number. The Dirichlet route is
the one that gives a theorem for every group. Build both; do not try to derive the explicit
domains from the general construction.

## Layer 3: Bianchi groups

**What to build.** `bianchi F ι` and `bianchiGamma F ι I` as pinned; their compatibility with
change of embedding; discreteness; the stabilizer of `∞` and the translation subgroup; the
torsion-freeness of the two named congruence subgroups; and their indices
`[PSL(2, Z[i]) : Gamma(2 + i)] = 60` and `[PSL(2, Z[omega]) : Gamma(3 + omega)] = 168`, each a
finite computation in a matrix group over a finite field: reduction mod the ideal is onto
`SL(2, F_5)`, of order `120`, and `SL(2, F_7)`, of order `336`, and `-1` lies in neither kernel.

`isDiscrete_bianchi` is the imaginary-quadratic case of AdelicAlgebraicGroups AA.3.4, the
discreteness of `Reduction.levelArithmetic`, at `x = 1` and the compact open level
`∏_{v finite} SL₂(𝒪_v)`, whose rational preimage is `SL(2, O_F)`. The proof is the adapter
that roadmap describes: `ι` identifies `F_∞` with `C` and transports the archimedean topology,
and discreteness passes to the image in `PSL(2,C)` through the finite centre of `SL(2,C)`. It
does not give a second arithmetic-discreteness proof.
*Needs:* AdelicAlgebraicGroups AA.3.4.

**Deliverables.** `bianchi`, `bianchiGamma`, `bianchi_comp_algEquiv`,
`bianchiGamma_comp_algEquiv`, `isDiscrete_bianchi`, `bianchiGaussian`, `bianchiEisenstein`,
`gammaGaussian`, `gammaEisenstein`, `index_gammaGaussian` and `index_gammaEisenstein` with the
values `60` and `168`, and `isKleinian_gammaGaussian` and `isKleinian_gammaEisenstein`.

**API.** The Bianchi group carries its generators for the two smallest discriminants, the
stabilizer of `∞` and its description as `w ↦ u² w + b`, the translation subgroup and its
identification with `O_F`, the parabolic elements and the cusps they fix, and the inclusion of
`PSL(2, Z)` as a subgroup preserving the vertical plane `y = 0` and acting on it through
Mathlib's upper half-plane action. `PSL(2, Z)` is not the full setwise stabilizer of that
plane: `diag(i, -i)` also preserves it, acting on it as the reflection `x ↦ -x`, and lies in
`PSL(2, Z[i])` but not in `PSL(2, Z)`. The stabilizer itself is not a target. For a nonzero
ideal `I`, the congruence subgroup carries normality, the isomorphism of its quotient with
`SL(2, O_F / I)` modulo the image of `{±1}`, the surjectivity of reduction, and the index
`|SL(2, O_F / I)| / |{±1 mod I}|`, with `|SL(2, O_F / I)|` the product over the prime powers
dividing `I`. Finiteness of the index is stated for `I ≠ ⊥` only, and torsion-freeness for the
two named levels only.

## Layer 4: the two Bianchi covolumes and their special values

**What to build.** The volumes of the two explicit domains of layer 2, which are the covolumes
of the two Bianchi groups; then the covolumes of the two congruence subgroups, by the index
law; then the factorizations of the two Dedekind zeta values.

The integration is pinned so that no constant is left to guesswork. Write
`Л(θ) = -∫₀^θ log |2 sin u| du` for the Lobachevsky function. By `volume_eq_withDensity` and
`∫_{√(1-|w|²)}^∞ t⁻³ dt = 1 / (2 (1 - |w|²))`, the volume of a domain above the unit sphere over
a floor `P` is `∫_P dA / (2 (1 - |w|²))`.

- The Gaussian floor is four copies of the right triangle `0 ≤ y ≤ x ≤ 1/2`, under the
  symmetries `x ↦ -x` and `x ↔ y`, and in polar coordinates that triangle is
  `0 ≤ θ ≤ π/4`, `0 ≤ r ≤ 1 / (2 cos θ)`. So the volume is
  `-∫₀^{π/4} log (1 - 1 / (4 cos² θ)) dθ`.
- The Eisenstein floor is four copies of the right triangle with angle `π/6` at `0` and
  adjacent side `1/2`, cut out by the rays at angles `-π/6`, `0`, `π/6`, `π/3`, `π/2` and the
  lines `x = 1/2` and `x + sqrt 3 * y = 1`. So the volume is
  `-∫₀^{π/6} log (1 - 1 / (4 cos² θ)) dθ`.
- The identity `4 cos² θ - 1 = sin 3θ / sin θ` splits the integrand as
  `log |2 sin 3θ| - log |2 sin θ| - 2 log |2 cos θ|`, and the substitutions `u = 3θ` and
  `u = π/2 - θ` turn the two integrals into `(2/3) Л(π/4)` and `2 Л(π/3) - Л(π/6)`, using
  `Л(π/2) = 0` and that `Л` is odd and `π`-periodic.
- `Л(π/6) = (3/2) Л(π/3)`, from the duplication formula `Л(2θ) = 2 Л(θ) + 2 Л(θ + π/2)` at
  `θ = π/6`. So the Eisenstein volume is `Л(π/3) / 2`.
- `Л(θ) = (1/2) ∑_{n ≥ 1} sin (2 n θ) / n²`, from `-log |2 sin θ| = ∑_{n ≥ 1} cos (2 n θ) / n` on
  `(0, π)`. At `π/4` this gives `Л(π/4) = catalanConstant / 2`, and at `π/3`, where
  `sin (2 n π / 3) = (sqrt 3 / 2) χ₋₃(n)`, it gives `Л(π/3) = sqrt 3 * lchi3 / 4`.

So the Gaussian covolume is `(2/3) (catalanConstant / 2) = catalanConstant / 3` and the
Eisenstein covolume is `(1/2) (sqrt 3 * lchi3 / 4) = sqrt 3 * lchi3 / 8`. The index law with
the indices `60` and `168` gives the manifold volumes `60 * catalanConstant / 3 =
20 * catalanConstant` and `168 * sqrt 3 * lchi3 / 8 = 21 * sqrt 3 * lchi3`.

Separately, the factorizations `zeta_(Q(i)) 2 = zeta 2 * L 2 chi_(-4)` and
`zeta_(Q(omega)) 2 = zeta 2 * L 2 chi_(-3)` identify the two Bianchi covolumes as the values
Humbert's formula predicts. This layer needs no zeta function except in the factorizations,
and its covolumes are what layer 5 consumes.

**Deliverables.** `catalanConstant` and `lchi3` as definitions, each proved equal to
`DirichletCharacter.LFunction` at its character and `s = 2`; `lobachevsky` as a definition,
with `lobachevsky_neg`, `lobachevsky_add_pi`, `lobachevsky_pi_div_two`, the duplication
formula, the Fourier series `hasSum_lobachevsky`, `lobachevsky_pi_div_four` and
`lobachevsky_pi_div_three`, in `TauCeti/Analysis/SpecialFunctions/Lobachevsky.lean`;
`volume_gaussianDomain` and `volume_eisensteinDomain`; `covolume_bianchiGaussian` and
`covolume_bianchiEisenstein`, the two Bianchi covolumes; `covolume_gammaGaussian` and
`covolume_gammaEisenstein`, the two manifold volumes; and `zeta_gaussian_two` and
`zeta_eisenstein_two`, the factorizations of those zeta values, stated with
`NumberField.dedekindZeta` of the two cyclotomic fields.
*Needs:* layers 1, 2 and 3 for the covolumes, with the index law applied under the
countability and fundamental-domain hypotheses of layer 1, so not `isDiscrete_bianchi`;
nothing for the Lobachevsky function.

**Humbert's formula: a roadmap-for-a-roadmap, not a target.** For every imaginary quadratic
field `F`, with a chosen embedding `ι : F →+* ℂ`, the covolume of `PSL(2, O_F)` is
`|d_F|^(3/2) * zeta_F 2 / (4 * pi^2)`. The statement this roadmap would want, once the
definitions of layer 3 exist, is

```lean
theorem covolume_bianchi (F : Type) [Field F] [NumberField F] [IsTotallyComplex F]
    (hF : Module.finrank ℚ F = 2) (ι : F →+* ℂ) :
    (covolume (bianchi F ι) ℍ³ volume).toReal =
      |(discr F : ℝ)| ^ ((3 : ℝ) / 2) * (dedekindZeta F 2).re / (4 * Real.pi ^ 2)
```

and the two covolumes of this layer are its values at the two smallest discriminants. It is
**not** a target of this roadmap, and contributors should not attempt it from here, because
no route to it is grounded in material that exists or is a target: the standard proof
(Elstrodt, Grunewald, Mennicke, chapter 8) goes through the Eisenstein series of
`PSL(2, O_F)`, its Fourier expansion with `zeta_F(2s) / zeta_F(2s - 1)` in the constant
term, its meromorphic continuation, and the residue at the edge of the critical strip, which
is `1 / covolume` up to the class number; the cusps of `PSL(2, O_F) \ ℍ³` correspond to the
ideal classes of `F`, and the constant term is a sum over them. None of that machinery, in
any dimension, is in Mathlib or Tau Ceti, and it is not a layer of this roadmap. A roadmap
for it would start from the cusp-class correspondence and the Eisenstein series on `ℍ³`,
and would consume this roadmap's layers 0 to 3 and its two covolumes as its test cases.

## Layer 5: the set of volumes, and Thurston's question

**What to build.** The set of volumes of finite-volume hyperbolic 3-manifolds, defined by
its witness: `v` is a volume when some Kleinian cofinite subgroup of `PSL(2,C)` has real
covolume `v`. Then the fact that it is nonempty, witnessed by a Bianchi congruence quotient;
closure under the index of a finite cover, from the index law; the geometric meaning of the
witness; and the statement of Thurston's question. Commensurable groups have rationally
related volumes, which is what makes the question non-trivial.

The closure statement is the one the index law actually gives: if `v` is witnessed by `Γ`
and `Δ ≤ Γ` has finite index `n`, then `n * v` is a volume, witnessed by `Δ`, since a
finite-index subgroup of a Kleinian cofinite group is Kleinian and cofinite. That every
positive integer multiple of every volume is a volume is **not** claimed: it would need an
index-`n` subgroup of some witnessing group for every `n`, and no target here supplies one.

The geometric meaning is `quotient_isFiniteVolumeHyperbolic`. For a Kleinian cofinite `Γ`, the
image of `Γ` under `toIsom` and `UpperHalfSpace.congr` is a subgroup of
`Isom(ModelGeometry.hyperbolic.Space)` acting freely and properly discontinuously, so Tau Ceti's
`hasGeometricStructure_quotient` and GeometricTopology layer 7.1 make
`MulAction.orbitRel.Quotient Γ ℍ³` a complete hyperbolic 3-manifold, with the quotient map of
`isCoveringMap_quotientMk_freeLocus` a local isometry. It satisfies `IsFiniteVolumeHyperbolic`,
and the `TauCeti.riemannianVolume` of the whole quotient is `covolume Γ ℍ³ volume`, the cusped,
noncompact case included, by layer 7.1's statement that the volume of the quotient is the
volume of a fundamental domain. This connects `hyperbolicVolumes` to the volume notion of
GeometricTopology without introducing another one.
*Needs:* GeometricTopology layer 7.1 (the quotient theorem and the volume of a quotient);
layers 0 and 1.

**Deliverables.** `hyperbolicVolumes`, `hyperbolicVolumes_nonempty`,
`mul_index_mem_hyperbolicVolumes`, `quotient_isFiniteVolumeHyperbolic`,
`rat_ratio_of_commensurable`, the statement `ThurstonQuestion23`, as a `Prop` that is *not*
proved:
`exists v w, v in hyperbolicVolumes and w in hyperbolicVolumes and forall q : Q, v != q * w`,
the predicate `NoSmallRationalRatio N`, and its one explicit instance
`noSmallRationalRatio_thousand : NoSmallRationalRatio 1000`.

**API.** The set of volumes contains the two manifold volumes of layer 4,
`20 * catalanConstant` and `21 * sqrt 3 * L 2 chi_(-3)`, consists of positive reals, and does
not contain `0`; membership is witnessed by a group, and the witness is recoverable from the
membership proof. The two Bianchi covolumes themselves, `catalanConstant / 3` and
`sqrt 3 * L 2 chi_(-3) / 8`, are **not** members: the Bianchi groups have torsion, so those
are orbifold volumes, about `0.3053` and `0.1692`, below the minimum volume `0.9427` of an
orientable hyperbolic 3-manifold (Milley), and a theorem placing them in the set would be
false.

**The finite approximation.** `NoSmallRationalRatio N` says that no rational with denominator
below `N` equals the ratio of the two manifold volumes. The target is one explicit bound,
`N = 1000`; the predicate for every `N` would be the open question itself, since a rational `q`
is excluded by any `N > q.den`, so no target quantifies over `N`. The proof is elementary and
pinned. Write `G_N` and `L_N` for the sums of the first `N` terms of the series defining
`catalanConstant` and `lchi3`. For even `N`,
`G_N ≤ catalanConstant ≤ G_N + 1 / (2N + 1)²`, by alternation, and
`L_N ≤ lchi3 ≤ L_N + 2 / (3N + 1)³ + 1 / (3 (3N + 1)²)`, bounding the `n`-th summand by
`2 / (3n + 1)³` and the tail by the integral test. With `N = 2000` and
`1732050807 / 10⁹ < sqrt 3 < 1732050808 / 10⁹`, exact rational arithmetic places the ratio
`20 * catalanConstant / (21 * sqrt 3 * lchi3)` strictly between `78/121` and `595/923`. These
are Farey neighbours, `595 * 121 - 78 * 923 = 1`, so every rational strictly between them has
denominator at least `121 + 923 = 1044`. The partial sums, the two tail bounds and the Farey
lemma are named lemmas; the final comparison is `norm_num` on rationals.

**Design note.** This is the one layer whose headline is a statement rather than a theorem,
and the roadmap says so. The candidate pair is the two manifold volumes layer 4 builds,
`20 * catalanConstant` and `21 * sqrt 3 * L 2 chi_(-3)`, which come from fields with different
discriminants and whose ratio is expected to be irrational; irrationality of that ratio would
answer the question. Their ratio is `5 / 14` times the ratio of the two Bianchi covolumes, so
the two irrationality questions are the same, but only the manifold volumes are members of the
set. `ThurstonQuestion23` is the existential statement. It is not the converse of
`rat_ratio_of_commensurable`, which is false, since incommensurable manifolds of equal volume
exist. State the bound in the theorem, never as a claim about the ratio itself.

## Dependency order and parallel work

Layer 0 blocks everything. Layer 1 needs layer 0. The Dirichlet domains of layer 2 need layer
1; its explicit domains need layer 3's definitions of the two Bianchi groups and their
stabilizers of `∞`, but not layer 3's indices or torsion-freeness. Layer 3's definitions need
nothing; its discreteness needs AdelicAlgebraicGroups AA.3.4, and its Kleinian statements need
layer 1. Layer 4's Lobachevsky material is independent of every other layer and can start
immediately; its covolume half needs layers 1, 2 and 3, but not the discreteness of layer 3. Layer 5 needs layers 1, 3 and 4, and
its geometric interpretation needs GeometricTopology layer 7.1.

The two-dimensional material in FuchsianOrbifolds is not a prerequisite anywhere, but the
slice comparison in layer 0 must be kept in step with it.

## Acceptance checks

1. The `volume` of the cusp box `[0,1] × [0,1] × [1, ∞)` in coordinates `(re w, im w, t)` is
   `1/2`, by direct integration of `t⁻³`.
2. `dist` on the slice `w ∈ R` equals Mathlib's `UpperHalfPlane.dist`, and `cosh_dist` has the
   same shape as `UpperHalfPlane.cosh_dist`.
3. `(0 -1; 1 0)` sends `(w, t)` to `(-conj w / (|w|² + t²), t / (|w|² + t²))`, and its `toIsom`
   image is `UpperHalfSpace.inversion 0 1` followed by the linear isometry `w ↦ -conj w`.
4. `-1` acts trivially on `ℍ³`, and `diag(i, -i)` acts as `(w, t) ↦ (-w, t)`, fixing exactly the
   vertical geodesic over `0`.
5. `bianchi` takes the same value at the two complex embeddings of `CyclotomicField 4 Q`, and
   `bianchiGamma` at the ideal `(2 + i)` for one embedding equals `bianchiGamma` at `(2 - i)`
   for the other.
6. For `Z[i]` and `I = (5)`, the matrix `(2i 5; -5 12i)` lies in the kernel of reduction to
   Mathlib's `PSL(2, Z[i] / (5))` but its class is not in `bianchiGamma` at `(5)`; the two
   indices are `3600` and `7200`.
7. The volume of `gaussianDomain` is `catalanConstant / 3`, about `0.3053`, and the volume of
   `eisensteinDomain` is `sqrt 3 * lchi3 / 8`, about `0.1692`; the covolume of `Gamma(2 + i)` is
   `20 * catalanConstant` and that of `Gamma(3 + omega)` is `21 * sqrt 3 * lchi3`, with the
   indices `60` and `168` computed, not existentially quantified.
8. `lobachevsky (π/4) = catalanConstant / 2` and `lobachevsky (π/3) = sqrt 3 * lchi3 / 4`.
9. `NoSmallRationalRatio 1000` is proved from the enclosures above, and nothing about the ratio
   is stated without a bound.
10. The statement of Thurston's question elaborates and is not provable by `decide` or by
    `simp` from the definitions; an auditor given only the Lean statement, with all prose
    stripped, reports back the question Thurston asked.

## References

- Thurston, *Three-dimensional manifolds, Kleinian groups and hyperbolic geometry*,
  Bull. AMS 6 (1982), 357-381; question 23 is on p. 380.
- Elstrodt, Grunewald, Mennicke, *Groups Acting on Hyperbolic Space*, Springer 1998: chapter 1
  for the quaternionic Moebius action and the classification of elements, chapter 7 for the
  Bianchi domains, chapter 8 for Humbert's formula.
- Maclachlan, Reid, *The Arithmetic of Hyperbolic 3-Manifolds*, GTM 219, for commensurability
  and invariant trace fields.
- Ratcliffe, *Foundations of Hyperbolic Manifolds*, GTM 149, for fundamental polyhedra.
- Milnor, *Hyperbolic geometry: the first 150 years*, Bull. AMS 6 (1982), 9-24, for the
  Lobachevsky function and its duplication formula.
- Humbert, *Sur la mesure des classes d'Hermite de discriminant donne*, C. R. Acad. Sci. Paris
  169 (1919).
- Neumann, Yang, *Bloch invariants of hyperbolic 3-manifolds*, Duke Math. J. 96 (1999), for
  why the question is arithmetic.
- Milley, *Minimum volume hyperbolic 3-manifolds*, J. Topol. 2 (2009), 181-192,
  [arXiv:0809.0346](https://arxiv.org/abs/0809.0346), for the bound `0.9427` that keeps the
  Bianchi covolumes out of the set of manifold volumes.
- Millichap, *Mutations and short geodesics in hyperbolic 3-manifolds*, Comm. Anal. Geom. 25
  (2017), 625-683, [arXiv:1406.6033](https://arxiv.org/abs/1406.6033), for incommensurable
  manifolds of equal volume.

## Provenance

The Bianchi domains, the index computations, the integration route and the bound on the ratio
were first formalized in [t4v1/thurston23](https://github.com/t4v1/thurston23), whose README
and `Thurston23Eisenstein.lean` state the domains above. That repository is a cited source,
not the specification.
