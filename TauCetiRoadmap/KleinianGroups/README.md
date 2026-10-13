# Roadmap: Kleinian groups, hyperbolic 3-manifolds, and arithmetic volume

This roadmap develops discrete subgroups of `PSL(2,C)`, their action on hyperbolic 3-space,
the quotient manifolds and orbifolds they produce, and the arithmetic volume of the
quotients of Bianchi groups. It exposes the actual group action, fundamental domains,
covolume, and the special values of Dedekind zeta functions that those covolumes are made
of. Volumes are computed from explicit fundamental polyhedra and named `L`-values, not
asserted.

The main reusable endpoint is the covolume of the two Bianchi groups of smallest
discriminant, computed from explicit fundamental polyhedra of torsion-free congruence
subgroups: the covolume of `PSL(2, Z[i])` is Catalan's constant over three, and the
covolume of `PSL(2, Z[omega])` is `sqrt 3 * L(2, chi_(-3)) / 8`. These are the two cases of
Humbert's formula, `covolume (PSL(2, O_F)) = |d_F|^(3/2) * zeta_F 2 / (4 * pi^2)`, in which
the zeta value factors through a classical constant; the general formula is stated in layer
4 as motivation and labeled a roadmap-for-a-roadmap, not a target. A second endpoint is the
two manifold volumes on the way to those covolumes, `20 * catalanConstant` for
`Gamma(2 + i) \ H^3` and `21 * sqrt 3 * L(2, chi_(-3))` for `Gamma(3 + omega) \ H^3`, as
members of the set of volumes of hyperbolic 3-manifolds. A third endpoint is a faithful
statement of Thurston's twenty-third question, that the volumes of hyperbolic 3-manifolds
are not all rationally related, which is open, together with one explicit finite
approximation of it that is provable.

This roadmap is the three-dimensional counterpart of
[FuchsianOrbifolds](../FuchsianOrbifolds/README.md), which excludes general Kleinian groups
and higher-dimensional symmetric spaces from its scope. It is also the concrete,
model-specific counterpart of layer 7 of
[GeometricTopology](../GeometricTopology/README.md), which builds hyperbolic volume the
Riemannian way, from `sqrt (det g)` and Mostow rigidity. The two meet at exactly one
theorem, pinned below: the Lebesgue-with-density measure built here is the Riemannian
volume of the hyperbolic metric. That theorem is owned by layer 7 of GeometricTopology,
which supplies the Riemannian side of it; no target of this roadmap depends on it.

Suggested homes: `TauCeti/Geometry/Hyperbolic/` for the space, its measure, and the Moebius
action; `TauCeti/Geometry/Hyperbolic/Kleinian/` for discrete subgroups, fundamental domains,
and covolume; `TauCeti/NumberTheory/Bianchi/` for the Bianchi groups, Humbert's formula, and
the `L`-value computations.

## Scope and completion criterion

The scope is discrete subgroups of `PSL(2,C)` acting on the upper half-space model of `H^3`,
with special attention to Bianchi groups, congruence subgroups, torsion-free subgroups of
finite index, and covolume. It computes the covolumes of the Bianchi groups of the two
smallest discriminants from explicit fundamental polyhedra; it does not prove Humbert's
formula for a general imaginary quadratic field, does not classify Kleinian groups, does not
develop deformation theory, and does not touch the hyperbolic Dehn surgery that would
construct the Weeks manifold.

Mostow rigidity, geometrization, the classification of cusped 3-manifolds by volume,
Teichmueller and quasi-Fuchsian theory, and the irrationality of any ratio of volumes are
outside this roadmap. The last of these is open mathematics, not a missing layer: what this
roadmap delivers about it is a faithful statement and the finite approximations of it that
are provable, never the theorem itself.

The roadmap is complete when Tau Ceti proves the following.

1. `H^3`, the upper half-space, carries the hyperbolic volume measure and the hyperbolic
   distance, and `PSL(2,C)` acts on it by Moebius transformations that are isometries and
   preserve that measure.
2. A discrete subgroup acts properly discontinuously; a torsion-free discrete subgroup acts
   freely; the covolume of a discrete subgroup is independent of the fundamental domain, and
   a subgroup of index `n` has `n` times the covolume.
3. For an imaginary quadratic ring of integers `O_F`, the Bianchi group `PSL(2, O_F)` is
   discrete, and an explicit polyhedron is a fundamental domain for a named torsion-free
   congruence subgroup of it, `Gamma(2 + i)` of index `60` in `PSL(2, Z[i])` and
   `Gamma(3 + omega)` of index `168` in `PSL(2, Z[omega])`.
4. The covolumes of `Gamma(2 + i)` and `Gamma(3 + omega)` are `20 * catalanConstant` and
   `21 * sqrt 3 * L 2 chi_(-3)`, by integration over their polyhedra, and the covolumes of
   `PSL(2, Z[i])` and `PSL(2, Z[omega])` are `catalanConstant / 3` and
   `sqrt 3 * L 2 chi_(-3) / 8`, by the index law.
5. `zeta_(Q(i)) 2 = zeta 2 * L 2 chi_(-4)` and `zeta_(Q(omega)) 2 = zeta 2 * L 2 chi_(-3)`,
   so the two Bianchi covolumes are the values `|d_F|^(3/2) * zeta_F 2 / (4 * pi^2)` that
   Humbert's formula predicts.
6. The set of volumes of hyperbolic 3-manifolds is defined by a witnessing group, contains
   the two manifold volumes of item 4, is closed under multiplication by the index of a
   finite-index subgroup of a witnessing group, and Thurston's question is stated against
   it, with `NoSmallRationalRatio 1000` proved as its finite approximation.

## Ownership and dependencies

This roadmap owns the upper half-space model and everything Kleinian: the space, its
measure and distance, the quaternionic Moebius action, discreteness, fundamental polyhedra,
and covolume in dimension three.

It **consumes** rather than rebuilds:

- `MeasureTheory.IsFundamentalDomain` and `MeasureTheory.covolume` from Mathlib, and from
  Tau Ceti's `TauCeti/MeasureTheory/Group/FundamentalDomain.lean` the subgroup construction
  `IsFundamentalDomain.subgroup_iUnion_out_inv_smul` and the index law
  `covolume_eq_card_mul_covolume`. These are stated for a general group action and are
  exactly what layer 1 needs; no second copy is made in dimension three.
- `exists_isFundamentalDomain_of_properlyDiscontinuousSMul` from
  `TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean`.
- Mathlib's `DirichletCharacter`, `LSeries`, and `NumberField` machinery, and Tau Ceti's
  `TauCeti/NumberTheory/` Dedekind zeta material, for layer 4.
- Mathlib's `Quaternion` algebra, for the Moebius action.

The Riemannian volume measure of layer 7 of GeometricTopology is **not** a dependency of
any target here: this roadmap defines its measure directly and proves its properties from
that definition. The comparison theorem between the two is a target of that roadmap, which
consumes the `volume` of this one.

## Pinned conventions

These conventions prevent two agents from building locally plausible but mutually unusable
APIs, and they are the places where a three-dimensional development can silently diverge
from the two-dimensional one.

- `H^3` is the upper half-space `{p : EuclideanSpace R (Fin 3) // 0 < p 2}`, not the ball
  model and not an abstract Riemannian manifold. The carrier is `EuclideanSpace`, not
  `Fin 3 -> R`, because the distance formula below uses the ambient Euclidean distance and
  the volume below uses ambient Lebesgue measure, and on a plain pi type `dist` is the
  supremum distance. It is a `def`, not an abbreviation, exactly as `UpperHalfPlane` is, so
  that the subtype's inherited instances do not compete with the declared ones; the point of
  the ambient space is reached through `H3.coe` and its third coordinate through `height`,
  the analogue of `UpperHalfPlane.im`. The model is part of the API: theorems may mention
  coordinates.
- Hyperbolic volume is a `MeasureSpace H^3` instance, so that `volume` names it, exactly as
  `UpperHalfPlane` does in dimension two. Its description, `volume_def`, is the analogue of
  Mathlib's `UpperHalfPlane.volume_def`: the comap of ambient Lebesgue measure, given the
  density `(p 2)^(-3)` through `withDensity`. No Riemannian machinery is involved, so the
  whole development below Humbert's formula is elementary measure theory. The identification
  with the Riemannian volume of the metric `(dx^2 + dy^2 + dz^2) / z^2` is owned by layer 7
  of GeometricTopology.
- Hyperbolic distance is a `Dist H^3` instance defined, as `UpperHalfPlane.dist_eq` defines
  it in dimension two, by `2 * arsinh (dist p q / (2 * sqrt (height p * height q)))`, with
  the closed formula `cosh (dist p q) = 1 + dist p q ^ 2 / (2 * height p * height q)` a
  theorem, the exact analogue of `UpperHalfPlane.cosh_dist`. The name is `dist`, through the
  instance, not a private `hdist`. Agreement with
  the path-length distance is a separate theorem, and on the slice `y = 0` the distance must
  be proved to agree with Mathlib's `UpperHalfPlane.dist`, so that this roadmap and
  FuchsianOrbifolds cannot drift apart.
- The acting group is `PSL(2,C)`, Mathlib's `Matrix.ProjectiveSpecialLinearGroup (Fin 2) C`,
  as in FuchsianOrbifolds. The `SL(2,C)` action is the lift; stabilizer and effectiveness
  results are stated for the projective action, whose kernel on `H^3` is trivial.
- The action is defined through the quaternions: `p = (x, y, t)` is the quaternion
  `x + y*i + t*j`, and `g` acts by `q |-> (a*q + b) * (c*q + d)^(-1)`, which preserves the
  `k`-part zero locus and the sign of the `j`-part. The formula in coordinates is a theorem
  derived from this, not the definition; deriving the group law from coordinates directly is
  the known way to make this layer unpleasant.
- A **Kleinian action** is free and properly discontinuous by isometries. Discreteness and
  torsion-freeness are derived, not assumed. This is the opposite of the two-dimensional
  convention in FuchsianOrbifolds, where discreteness is the input, and the difference is
  deliberate: a manifold quotient, not an orbifold, is what a volume is being attached to.
  Both directions are proved, so the two entry points meet.
- Covolume is Mathlib's `MeasureTheory.covolume`, valued in `ℝ≥0∞`, of the subgroup acting
  on `H^3` with `volume`. Its value on a given fundamental domain comes from
  `IsFundamentalDomain.covolume_eq_volume`, and existence from `HasFundamentalDomain`; this
  roadmap adds no second notion of covolume. A group is **cofinite** exactly when it is
  discrete and its covolume is not `⊤`, the shape of Tau Ceti's `Subgroup.IsCofinite` for
  Fuchsian groups, with discreteness a field of the structure and not a consequence of the
  covolume condition: a nondiscrete group can have covolume `0`, so finiteness alone is not
  a lattice condition. Positivity of the covolume of a cofinite group is a theorem, not part
  of the definition.
- Bianchi groups are `PSL(2, O_F)` for `O_F` the ring of integers of an imaginary quadratic
  field `F`, which is stated in Mathlib's vocabulary as a number field with
  `Module.finrank ℚ F = 2` that is `IsTotallyComplex`, together with a chosen embedding
  `F →+* ℂ`. The embedding is part of the data of `bianchi` and `bianchiGamma`, not an
  instance found by search: `F` has two complex embeddings, and the two subgroups they give
  are conjugate in `PGL(2, C)` by complex conjugation but are not equal. Nothing is stated
  for a general number field; `PSL(2, Z)` inside `PSL(2, C)` has infinite covolume on `H^3`.
  Congruence subgroups are kernels of reduction mod an ideal; the two named ones are
  `Gamma(2 + i)` in `PSL(2, Z[i])`, of index `60`, and `Gamma(3 + omega)` in
  `PSL(2, Z[omega])`, of index `168`, each of which is torsion free, so the quotient is a
  manifold. The indices are the orders of `PSL(2, F_5)` and `PSL(2, F_7)`, since reduction is
  onto and `-1` is not in the kernel.
- Catalan's constant has no name in Mathlib, so layer 4 introduces `catalanConstant`, as the
  sum `∑ (-1)^n / (2n+1)^2`, and proves it equal to `DirichletCharacter.LFunction` at the
  character mod `4` and `s = 2`; `L(2, χ₋₃)` is treated the same way. The name is not
  `catalan`, which in Mathlib is the Catalan *numbers* `ℕ → ℕ`, used in Tau Ceti's
  `Algebra/TemperleyLieb.lean`. Every theorem about
  volumes states the constant, not a decimal enclosure. Numerical enclosures may exist as
  separate lemmas and may never appear in the statement of a volume.
- No `native_decide`, in line with the library's axiom audit. Rational arithmetic on explicit
  matrices is `decide` or `norm_num`.

## Existing foundations to consume

The two-dimensional case is now largely in Mathlib, and this roadmap is written to mirror
it declaration by declaration rather than to reinvent it.

- **The upper half-plane, in Mathlib.** `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean`
  gives `UpperHalfPlane.volume` as a `MeasureSpace` instance, its `volume_def` through
  `withDensity`, the `MeasurableSpace` and `BorelSpace` instances, local finiteness,
  sigma-finiteness, and `SMulInvariantMeasure (GL (Fin 2) R) H volume`.
  `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean` gives the `Dist` instance,
  `dist_eq`, and `cosh_dist`. `MoebiusAction.lean` gives `num`, `denom`, and the
  non-vanishing lemmas; `ProperAction.lean` gives the proper action. Layers 0 and 1 are the
  three-dimensional counterparts of exactly these files.
- **Fundamental domains, in Mathlib.** `MeasureTheory.IsFundamentalDomain`,
  `HasFundamentalDomain`, `covolume` valued in `ℝ≥0∞`, and
  `IsFundamentalDomain.covolume_eq_volume`, all in
  `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`.
- **Groups and quaternions, in Mathlib.** `Matrix.ProjectiveSpecialLinearGroup` with the
  scoped `PSL(n, R)` notation; since `PSL` is an abbreviation for `SL / center`, its topology
  is the quotient topology Mathlib already supplies, once
  `Mathlib/Topology/Algebra/Group/Matrix.lean` and `.../Group/Quotient.lean` are imported, so
  no roadmap target declares one; `Quaternion` and the normed structure in
  `Mathlib/Analysis/Quaternion.lean`; `ProperlyDiscontinuousSMul` in
  `Mathlib/Topology/Algebra/ConstMulAction.lean`.
- **Number theory, in Mathlib.** `NumberField.dedekindZeta` and `NumberField.discr`;
  `DirichletCharacter.LFunction`; `GaussianInt` for `Z[i]` and the cyclotomic API for
  `Z[omega]`. Mathlib has the Dedekind zeta function and the class-number formula
  ingredients, and no special values at `s = 2`; producing the two this roadmap needs is
  layer 4's work.
- **From Tau Ceti.** `MeasureTheory/Group/FundamentalDomain.lean` for
  `IsFundamentalDomain.subgroup_iUnion_out_inv_smul` and `covolume_eq_card_mul_covolume`;
  `MeasureTheory/Group/ProperlyDiscontinuous.lean` for
  `exists_isFundamentalDomain_of_properlyDiscontinuousSMul`;
  `Analysis/Complex/Fuchsian/Covolume.lean`, whose cofiniteness criterion is the
  two-dimensional model for layer 1's.
- **Partly present, and cited as such.** Tau Ceti's
  `Geometry/Manifold/Riemannian/VolumeDensity/` has `chartVolumeDensity`, the `sqrt (det g)`
  density in a chart, `chartRiemannianVolume`, the measure on one chart's source, and
  `chartRiemannianVolume_restrict_overlap`, their agreement on overlaps, which is the descent
  input for a global volume; the global assembly is layer 7 of GeometricTopology's target, not
  this roadmap's. Tau Ceti's `Topology/Algebra/Matrix/ProjectiveSpecialLinearGroup.lean`
  proves `PSL(2, R)` Hausdorff and the discreteness facts a Fuchsian group needs; the `C`
  analogues of those facts are targets of layer 0 here, while the topology itself is Mathlib's.
- **What does not exist anywhere.** There is no hyperbolic space in dimension three in either
  library, no name for Catalan's constant, and no fundamental domain for the modular group
  stated measure-theoretically. The first of these is this roadmap's
  subject, the second belongs to layer 7 of GeometricTopology, and the third and fourth are
  targets here and in FuchsianOrbifolds respectively.

## Layer 0: the space, its measure, and the Moebius action

**What to build.** `H^3` as a type with its measure and distance; the quaternionic Moebius
action of `SL(2,C)`, its factoring through `PSL(2,C)`, and the two facts that make it
useful: every element is an isometry for `dist`, and every element preserves `volume`. The
measure-preservation proof is the one genuinely long computation in this layer, going
through the Jacobian of the coordinate formula, and it is the long proof of this layer.

**Deliverables.** `H3.coe` and `height`, the `MeasureSpace` instance with `volume_def`, the
`Dist` instance with `dist_eq` and `cosh_dist`, `T2Space PSL(2, C)` and the discreteness facts
that mirror Tau Ceti's `PSL(2, R)` ones, the `MeasurableSpace` and `BorelSpace` instances,
the action instance and `pslAction`, `isometry_smul`, the `MeasurableConstSMul PSL(2, C) H^3`
and `SMulInvariantMeasure PSL(2, C) H^3 volume` instances, the coordinate formula `smul_def`,
and `dist_ofUpperHalfPlane`, the agreement of
the `y = 0` slice with Mathlib's upper half-plane distance. Each name matches its
two-dimensional counterpart in `Mathlib/Analysis/Complex/UpperHalfPlane/`.

**API.** `volume` carries what a measure is expected to carry: sigma-finiteness, local
finiteness, `IsOpenPosMeasure`, the value on a box in closed form, absolute continuity in
both directions against Lebesgue measure on the half-space, and the behaviour under the
three coordinate moves the model makes available, translation in `x` and `y`, dilation, and
inversion. `dist` carries a `MetricSpace` instance on `H^3`, completeness, the geodesic
through two points, the triangle inequality by the standard hyperbolic argument rather than
by transport from another model, and the formula for the distance between two points on a
vertical line. The action carries continuity, the stabilizer of a point, transitivity, and
the identification of the stabilizer of `(0, 0, 1)` with `PSU(2)`.

**Unlocks.** Everything below.

## Layer 1: discrete subgroups, fundamental domains, and covolume

**What to build.** Discreteness implies proper discontinuity on `H^3`; a torsion-free
discrete subgroup acts freely; `IsKleinian` as the predicate for the quotient being a
manifold, with both implications to the discrete-and-torsion-free form. Then covolume:
independence of the fundamental domain, the index law consumed from Tau Ceti's general
version, and the cofiniteness criterion in the shape of
`Fuchsian.Covolume.isCofinite_iff_covolume_ne_top`.

The index law is Tau Ceti's `covolume_eq_card_mul_covolume` specialized to `H^3`, and it is
stated with that theorem's orientation and hypotheses: for `Δ ≤ Γ`, the covolume of `Δ` is
`ENat.card (Γ ⧸ Δ.subgroupOf Γ)` times the covolume of `Γ`, the index `[Γ : Δ]` counted in
`ℕ∞` so that infinite index gives `⊤` rather than the zero-totalized `ℕ`-valued
`Subgroup.index`, under `[Countable Γ]` and `[HasFundamentalDomain Γ H^3 volume]`. The two
lemmas that let a discrete subgroup use it are that a discrete subgroup of `PSL(2, C)` is
countable and has a fundamental domain, the latter from
`exists_isFundamentalDomain_of_properlyDiscontinuousSMul`.

**Deliverables.** `properlyDiscontinuousSMul_of_discrete`, `IsKleinian`,
`isKleinian_iff_discrete_and_torsionFree`, `covolume_eq_index_mul_covolume` as a corollary
of the general lemma, `countable_of_discrete`, `IsCofinite` as a structure with
`DiscreteTopology Γ` and `covolume Γ H^3 volume ≠ ⊤` as its fields,
`isCofinite_iff_covolume_ne_top`, `IsCofinite.covolume_pos`, and the existence of a
measurable fundamental domain.

**API.** `IsKleinian` is closed under passing to a subgroup and under conjugation, and is
preserved by the two constructions that produce new groups here, intersection and finite
index. Covolume carries positivity for a nontrivial group, monotonicity under inclusion,
invariance under conjugation, the value on the trivial group, and the two-sided relation
with commensurability: commensurable cofinite groups have covolumes with rational ratio,
and a group commensurable with a cofinite group is cofinite.

**Design note.** The index law is the source of every *known* rational relation between
volumes, which is why Thurston's question is phrased as it is. State it early and cite it in
layer 5.

## Layer 2: fundamental polyhedra

**What to build.** Dirichlet domains for a discrete torsion-free subgroup, and, separately,
the verification tooling for an *explicit* polyhedron: a criterion that a set is a
fundamental domain given a finite set of face-pairing elements, in the shape that a concrete
box or polytope can be fed to. The two named congruence subgroups get their explicit domains
here.

**Deliverables.** `dirichletDomain` and `isFundamentalDomain_dirichletDomain`;
`isFundamentalDomain_of_facePairing`; the explicit domains for `Gamma(2 + i)` and
`Gamma(3 + omega)`, each a box over a fundamental parallelogram for the translation
sublattice.

**API.** A Dirichlet domain is open, is star-shaped about its centre, is locally finite,
and changes by the expected equivariance when the centre moves or the group is conjugated.
The face-pairing criterion is stated so that its hypotheses are checkable for a concrete
polyhedron: a finite set of group elements, a covering condition, and a disjointness
condition on interiors, each of which must be a separate named hypothesis rather than a
bundled structure.

**Design note.** The explicit route is the one that reaches a number. The Dirichlet route is
the one that gives a theorem for every group. Build both; do not try to derive the explicit
domains from the general construction.

## Layer 3: Bianchi groups

**What to build.** `PSL(2, O_F)` for `O_F` imaginary quadratic, through a chosen embedding
`F →+* ℂ`; discreteness; the congruence subgroups and their torsion-freeness; the index
computations `[PSL(2, Z[i]) : Gamma(2 + i)] = 60` and
`[PSL(2, Z[omega]) : Gamma(3 + omega)] = 168`, each a finite computation in a matrix group
over a finite ring: reduction mod the ideal is onto `SL(2, F_5)`, of order `120`, and
`SL(2, F_7)`, of order `336`, and `-1` lies in neither kernel.

**Deliverables.** `bianchi`, `isDiscrete_bianchi`, `bianchiGamma`, `torsionFree_gamma`,
`index_gammaGaussian` and `index_gammaEisenstein` with the values `60` and `168`, and, from
layer 1, that each quotient is a hyperbolic 3-manifold.

**API.** The Bianchi group carries its generators for the two smallest discriminants, the
translation subgroup and its identification with `O_F`, the parabolic elements and the
cusps they fix, and the inclusion of `PSL(2, Z)` as a subgroup preserving the vertical
plane `y = 0` and acting on it through Mathlib's upper half-plane action. `PSL(2, Z)` is
not the full setwise stabilizer of that plane: `diag(i, -i)` also preserves it, acting on it
as the reflection `x |-> -x`, and lies in `PSL(2, Z[i])` but not in `PSL(2, Z)`. The
stabilizer itself is not a target.
The congruence subgroups carry normality, the finite quotient `PSL(2, O_F / I)`, the
surjectivity of reduction, and the index as a product over the prime divisors of `I`.

## Layer 4: the two Bianchi covolumes and their special values

**What to build.** The covolumes of the two named congruence subgroups, computed by
integrating `volume` over the fundamental domains of layer 2 and evaluating the resulting
log-sine integrals: `20 * catalanConstant` for `Gamma(2 + i)` and `21 * sqrt 3 * L 2 chi_(-3)`
for `Gamma(3 + omega)`. Then the covolumes of the two Bianchi groups themselves,
`catalanConstant / 3` and `sqrt 3 * L 2 chi_(-3) / 8`, by dividing by the indices `60` and
`168` of layer 3 through the index law of layer 1. Separately, the factorizations
`zeta_(Q(i)) 2 = zeta 2 * L 2 chi_(-4)` and `zeta_(Q(omega)) 2 = zeta 2 * L 2 chi_(-3)`, which
identify the two covolumes as the values Humbert's formula predicts. The analytic input is
the evaluation of the integral over the fundamental polyhedron, which for these two fields
reduces to a log-sine integral: `-2 * integral over (0, pi/4) of log (2 * sin t)` is
Catalan's constant, and the same integral at `pi/6` gives the `chi_(-3)` value. This layer
needs no zeta function and no class-number theory except in the factorizations, and its
covolumes are what layer 5 consumes.

**Deliverables.** `catalanConstant` and `lchi3` as definitions, each proved equal to
`DirichletCharacter.LFunction` at its character and `s = 2`; `covolume_gammaGaussian` and
`covolume_gammaEisenstein`, the two manifold volumes; `covolume_bianchiGaussian` and
`covolume_bianchiEisenstein`, the two Bianchi covolumes; `zeta_gaussian_two` and
`zeta_eisenstein_two`, the factorizations of those zeta values, stated with
`NumberField.dedekindZeta`; and the two log-sine integrals as named lemmas in
`TauCeti/Analysis/SpecialFunctions/LogSin.lean`.

**Humbert's formula: a roadmap-for-a-roadmap, not a target.** For every imaginary quadratic
field `F`, with a chosen embedding `ι : F →+* ℂ`, the covolume of `PSL(2, O_F)` is
`|d_F|^(3/2) * zeta_F 2 / (4 * pi^2)`. The statement this roadmap would want, once the
definitions of layer 3 exist, is

```lean
theorem covolume_bianchi (F : Type) [Field F] [NumberField F] [IsTotallyComplex F]
    [Fact (Module.finrank ℚ F = 2)] (ι : F →+* ℂ) :
    (covolume (bianchi F ι) H3 volume).toReal =
      |(discr F : ℝ)| ^ ((3 : ℝ) / 2) * (dedekindZeta F 2).re / (4 * Real.pi ^ 2)
```

and the two covolumes of this layer are its values at the two smallest discriminants. It is
**not** a target of this roadmap, and contributors should not attempt it from here, because
no route to it is grounded in material that exists or is a target: the standard proof
(Elstrodt, Grunewald, Mennicke, chapter 8) goes through the Eisenstein series of
`PSL(2, O_F)`, its Fourier expansion with `zeta_F(2s) / zeta_F(2s - 1)` in the constant
term, its meromorphic continuation, and the residue at the edge of the critical strip, which
is `1 / covolume` up to the class number; the cusps of `PSL(2, O_F) \ H^3` correspond to the
ideal classes of `F`, and the constant term is a sum over them. None of that machinery, in
any dimension, is in Mathlib or Tau Ceti, and it is not a layer of this roadmap. A roadmap
for it would start from the cusp-class correspondence and the Eisenstein series on `H^3`,
and would consume this roadmap's layers 0 to 3 and its two covolumes as its test cases.

## Layer 5: the set of volumes, and Thurston's question

**What to build.** The set of volumes of finite-volume hyperbolic 3-manifolds, defined by
its witness: `v` is a volume when some Kleinian cofinite subgroup of `PSL(2, C)` has real
covolume `v`. Then the fact that it is nonempty, witnessed by a Bianchi congruence quotient;
closure under the index of a finite cover, from the index law; and the statement of
Thurston's question. Commensurable groups have rationally related volumes, which is the
statement that makes the question non-trivial.

The closure statement is the one the index law actually gives: if `v` is witnessed by `Γ`
and `Δ ≤ Γ` has finite index `n`, then `n * v` is a volume, witnessed by `Δ`, since a
finite-index subgroup of a Kleinian cofinite group is Kleinian and cofinite. That every
positive integer multiple of every volume is a volume is **not** claimed: it would need an
index-`n` subgroup of some witnessing group for every `n`, and no target here supplies one.

**Deliverables.** `hyperbolicVolumes`, `hyperbolicVolumes_nonempty`,
`mul_index_mem_hyperbolicVolumes`, `rat_ratio_of_commensurable`, the statement
`ThurstonQuestion23`, as a `Prop` that is *not* proved:
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
false. The finite approximation of the design note is the predicate `NoSmallRationalRatio N`,
that no rational with denominator below `N` equals the ratio of the two manifold volumes,
and the target is one explicit bound, `N = 1000`, from rigorous enclosures of
`catalanConstant` and `L 2 chi_(-3)`. The predicate for every `N` would be the open
question itself, since a rational `q` is excluded by any `N > q.den`, so no target
quantifies over `N`.

**Design note.** This is the one layer whose headline is a statement rather than a theorem,
and the roadmap says so. The candidate pair is the two manifold volumes layer 4 builds,
`20 * catalanConstant` and `21 * sqrt 3 * L 2 chi_(-3)`, which come from fields with different
discriminants and whose ratio is expected to be irrational; irrationality of that ratio
would answer the question. Their ratio is `5 / 14` times the ratio of the two Bianchi
covolumes, so the two irrationality questions are the same, but only the manifold volumes
are members of the set. What *is* provable, and worth proving, is the finite approximation:
no rational with denominator below `1000` equals that ratio, from rigorous enclosures of
both constants. State the bound in the theorem, never as a claim about the ratio itself.

## Dependency order and parallel work

Layer 0 blocks everything. Layers 1 and 2 can proceed together once the action exists, since
the Dirichlet construction needs only the metric and proper discontinuity. Layer 3 needs
layer 1 for "the quotient is a manifold" but not layer 2. Layer 4's log-sine integrals are
independent of every other layer and can start immediately; its covolume half needs layers 2
and 3. Layer 5 needs layers 1, 3, and 4.

The two-dimensional material in FuchsianOrbifolds is not a prerequisite anywhere, but the
slice comparison in layer 0 must be kept in step with it.

## Acceptance checks

1. The `volume` of the unit cusp box `[0,1] x [0,1] x [1,infinity)` is `1/2`, by direct
   integration.
2. `dist` on the slice `y = 0` equals Mathlib's `UpperHalfPlane.dist`, and `cosh_dist` has
   the same shape as `UpperHalfPlane.cosh_dist`.
3. A Moebius transformation preserves `volume`, checked against the explicit Jacobian, and
   the invariance is an instance, as `SMulInvariantMeasure (GL (Fin 2) R) H volume` is.
4. The covolume of `Gamma(2 + i)` is `20 * catalanConstant`, and the covolume of
   `PSL(2, Z[i])` is `catalanConstant / 3`, with the index `60` computed, not existentially
   quantified.
5. The covolume of `Gamma(3 + omega)` is `21 * sqrt 3 * L 2 chi_(-3)`, and the covolume of
   `PSL(2, Z[omega])` is `sqrt 3 * L 2 chi_(-3) / 8`, with the index `168` computed.
6. `NoSmallRationalRatio 1000` is proved from enclosures of both constants, and nothing
   about the ratio is stated without a bound.
7. The statement of Thurston's question elaborates and is not provable by `decide` or by
   `simp` from the definitions; an auditor given only the Lean statement, with all prose
   stripped, reports back the question Thurston asked.

## References

- Thurston, *Three-dimensional manifolds, Kleinian groups and hyperbolic geometry*,
  Bull. AMS 6 (1982), 357-381; question 23 is on p. 380.
- Elstrodt, Grunewald, Mennicke, *Groups Acting on Hyperbolic Space*, Springer 1998, for the
  quaternionic Moebius action, Bianchi groups, and Humbert's formula.
- Maclachlan, Reid, *The Arithmetic of Hyperbolic 3-Manifolds*, GTM 219, for commensurability
  and invariant trace fields.
- Ratcliffe, *Foundations of Hyperbolic Manifolds*, GTM 149, for fundamental polyhedra.
- Humbert, *Sur la mesure des classes d'Hermite de discriminant donne*, C. R. Acad. Sci. Paris
  169 (1919).
- Neumann, Yang, *Bloch invariants of hyperbolic 3-manifolds*, Duke Math. J. 96 (1999), for
  why the question is arithmetic.
- Milley, *Minimum volume hyperbolic 3-manifolds*, J. Topol. 2 (2009), 181-192,
  [arXiv:0809.0346](https://arxiv.org/abs/0809.0346), for the bound `0.9427` that keeps the
  Bianchi covolumes out of the set of manifold volumes.
