# Roadmap: Kleinian groups, hyperbolic 3-manifolds, and arithmetic volume

This roadmap develops discrete subgroups of `PSL(2,C)`, their action on hyperbolic 3-space,
the quotient manifolds and orbifolds they produce, and the arithmetic volume of the
quotients of Bianchi groups. It exposes the actual group action, fundamental domains,
covolume, and the special values of Dedekind zeta functions that those covolumes are made
of. Volumes are computed from explicit fundamental polyhedra and named `L`-values, not
asserted.

The main reusable endpoint is Humbert's formula: for an imaginary quadratic field `F` of
discriminant `d_F`, the covolume of the Bianchi group `PSL(2, O_F)` acting on `H^3` is
`|d_F|^(3/2) * zeta_F 2 / (4 * pi^2)`. A second endpoint applies it in the two cases where
the zeta value factors through a classical constant: `Q(i)`, where the covolume is
Catalan's constant over three, and `Q(omega)`, where it is `sqrt 3 * L(2, chi_(-3)) / 8`.
A third endpoint is a faithful statement of Thurston's twenty-fourth question, that the
volumes of hyperbolic 3-manifolds are not all rationally related, which is open.

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
finite index, and covolume. It proves Humbert's formula and evaluates it at the two smallest
discriminants; it does not classify Kleinian groups, does not develop deformation theory, and
does not touch the hyperbolic Dehn surgery that would construct the Weeks manifold.

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
   discrete, and an explicit polyhedron is a fundamental domain for a named congruence
   subgroup of it.
4. Humbert's formula holds: `covolume (PSL(2, O_F)) = |d_F|^(3/2) * zeta_F 2 / (4 * pi^2)`.
5. `zeta_(Q(i)) 2 = zeta 2 * L 2 chi_(-4)` and `zeta_(Q(omega)) 2 = zeta 2 * L 2 chi_(-3)`,
   so the two covolumes are `catalan / 3` and `sqrt 3 * L 2 chi_(-3) / 8`.
6. The set of volumes of hyperbolic 3-manifolds is defined, is nonempty, is closed under
   multiplication by a positive integer, and Thurston's question is stated against it.

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
  roadmap adds no second notion of covolume. A group is **cofinite** exactly when its
  covolume is neither `0` nor `⊤`.
- Bianchi groups are `PSL(2, O_F)` for `O_F` the ring of integers of an imaginary quadratic
  field, embedded through `O_F -> C`. Congruence subgroups are kernels of reduction mod an
  ideal; the two named ones are `Gamma(2 + i)` in `PSL(2, Z[i])` and `Gamma(3 + omega)` in
  `PSL(2, Z[omega])`, each of which is torsion free, so the quotient is a manifold.
- Catalan's constant has no name in Mathlib, so layer 4 introduces one, as the sum
  `∑ (-1)^n / (2n+1)^2`, and proves it equal to `DirichletCharacter.LFunction` at the
  character mod `4` and `s = 2`; `L(2, χ₋₃)` is treated the same way. Every theorem about
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
  scoped `PSL(n, R)` notation, which carries no topology, so the quotient topology on
  `PSL(2, C)` is a target of layer 0; `Quaternion` and the normed structure in
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
- **What does not exist anywhere.** There is no hyperbolic space in dimension three in
  either library, no topology on `PSL(n, R)`, no Riemannian volume measure
  (`Mathlib/Geometry/Manifold/Riemannian/` reaches metrics and path length and stops), no
  Catalan constant, and no fundamental domain for the modular group stated
  measure-theoretically. The first of these is this roadmap's
  subject, the second belongs to layer 7 of GeometricTopology, and the third and fourth are
  targets here and in FuchsianOrbifolds respectively.

## Layer 0: the space, its measure, and the Moebius action

**What to build.** `H^3` as a type with its measure and distance; the quaternionic Moebius
action of `SL(2,C)`, its factoring through `PSL(2,C)`, and the two facts that make it
useful: every element is an isometry for `dist`, and every element preserves `volume`. The
measure-preservation proof is the one genuinely long computation in this layer, going
through the Jacobian of the coordinate formula, and it is the long proof of this layer.

**Deliverables.** `H3.coe` and `height`, the `MeasureSpace` instance with `volume_def`, the
`Dist` instance with `dist_eq` and `cosh_dist`, the quotient topology on `PSL(2, C)`, the `MeasurableSpace` and `BorelSpace` instances, the action
instance and `pslAction`, `isometry_smul`, the `SMulInvariantMeasure PSL(2, C) H^3 volume`
instance, the coordinate formula `smul_def`, and `dist_ofUpperHalfPlane`, the agreement of
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

**Deliverables.** `properlyDiscontinuousSMul_of_discrete`, `IsKleinian`,
`isKleinian_iff_discrete_and_torsionFree`, `covolume_eq_index_mul_covolume` as a corollary
of the general lemma, `isCofinite_iff_covolume_ne_top`, and the existence of a measurable
fundamental domain.

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

**What to build.** `PSL(2, O_F)` for `O_F` imaginary quadratic; discreteness; the congruence
subgroups and their torsion-freeness; the index computations `[PSL(2, Z[i]) : Gamma(2 + i)]`
and `[PSL(2, Z[omega]) : Gamma(3 + omega)]`, each a finite computation in a matrix group over
a finite ring.

**Deliverables.** `Bianchi O_F`, `isDiscrete_bianchi`, `Gamma`, `torsionFree_gamma`,
`index_gamma`, and, from layer 1, that each quotient is a hyperbolic 3-manifold.

**API.** The Bianchi group carries its generators for the two smallest discriminants, the
translation subgroup and its identification with `O_F`, the parabolic elements and the
cusps they fix, and the relation to `PSL(2, Z)` as the subgroup fixing the vertical plane.
The congruence subgroups carry normality, the finite quotient `PSL(2, O_F / I)`, the
surjectivity of reduction, and the index as a product over the prime divisors of `I`.

## Layer 4: Humbert's formula and the two special values

**What to build.** The covolume of `PSL(2, O_F)` as `|d_F|^(3/2) * zeta_F 2 / (4 * pi^2)`,
and the factorizations `zeta_(Q(i)) 2 = zeta 2 * L 2 chi_(-4)` and
`zeta_(Q(omega)) 2 = zeta 2 * L 2 chi_(-3)`. The analytic input is the evaluation of the
integral over the fundamental polyhedron, which for these two fields reduces to a log-sine
integral: `-2 * integral over (0, pi/4) of log (2 * sin t)` is Catalan's constant, and the
same integral at `pi/6` gives the `chi_(-3)` value.

**Deliverables.** `catalan` and `lchi3` as definitions, each proved equal to
`DirichletCharacter.LFunction` at its character and `s = 2`; `covolume_bianchiGaussian` and
`covolume_bianchiEisenstein`; `covolume_bianchi`, stated with `NumberField.dedekindZeta` and
`NumberField.discr`; `zeta_gaussian_two` and `zeta_eisenstein_two`, the factorizations of
those zeta values; and the two log-sine integrals as named lemmas in
`TauCeti/Analysis/SpecialFunctions/LogSin.lean`.

Layer 4 has two milestones, and both are work this roadmap wants.

**Milestone 4a: the two fields, from their explicit polyhedra.** The covolumes of the two
named congruence subgroups, computed by integrating `volume` over the fundamental domains of
layer 2 and evaluating the resulting log-sine integrals, and then the covolumes of the two
Bianchi groups themselves, `catalan / 3` and `sqrt 3 * L 2 chi_(-3) / 8`, by dividing by the
indices of layer 3 through the index law of layer 1. This milestone is self-contained: it
needs no zeta function and no class-number theory, and it is what layer 5 consumes.

**Milestone 4b: Humbert's formula for every imaginary quadratic field.** The general
covolume formula, which needs the ideal-class decomposition of `zeta_F` and the class
number. Its specialization to `Q(i)` must reproduce the value of milestone 4a, and that
agreement is itself a target: two routes to `catalan / 3` that are proved equal.

**Design note.** The two milestones are ordered, not alternative. 4a fixes the constants
and the integration technique on the cases where everything is explicit; 4b generalizes the
covolume computation with those cases as its test.

## Layer 5: the set of volumes, and Thurston's question

**What to build.** The set of volumes of finite-volume hyperbolic 3-manifolds; the fact that
it is nonempty, witnessed by a Bianchi congruence quotient; closure under multiplication by
a positive integer, from the index law; and the statement of Thurston's question.
Commensurable groups have rationally related volumes, which is the statement that makes the
question non-trivial.

**Deliverables.** `hyperbolicVolumes`, `hyperbolicVolumes_nonempty`,
`rat_ratio_of_commensurable`, and the statement, as a `Prop` that is *not* proved:
`exists v w, v in hyperbolicVolumes and w in hyperbolicVolumes and forall q : Q, v != q * w`.

**API.** The set of volumes is closed under multiplication by a positive integer, contains
the two arithmetic volumes of layer 4, consists of positive reals, and does not contain `0`
or `infinity`; membership is witnessed by a group together with a fundamental domain, and
the witness is recoverable from the membership proof. The finite approximation of the
design note is a family of theorems indexed by a denominator bound `N`, each stating that
no rational with denominator below `N` equals the ratio of the two named volumes, together
with the rigorous enclosures of `catalan` and `L 2 chi_(-3)` that produce it.

**Design note.** This is the one layer whose headline is a statement rather than a theorem,
and the roadmap says so. The candidate pair is the two volumes layer 4 builds, `catalan / 3`
and `sqrt 3 * L 2 chi_(-3) / 8`, which come from fields with different discriminants and
whose ratio is expected to be irrational; irrationality of that ratio would answer the
question. What *is* provable, and worth proving, is the finite
approximation: no rational with denominator below a fixed bound equals that ratio, from
rigorous enclosures of both constants. State the bound in the theorem, never as a claim about
the ratio itself.

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
4. The covolume of `Gamma(2 + i)` is a positive rational multiple of Catalan's constant, and
   the multiple is computed, not existentially quantified.
5. The covolume of `Gamma(3 + omega)` is a positive rational multiple of
   `sqrt 3 * L 2 chi_(-3)`.
6. Humbert's formula specializes to `catalan / 3` for `Q(i)`.
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
