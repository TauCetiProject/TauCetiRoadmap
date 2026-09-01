# Roadmap: Fuchsian groups and orbifold Riemann surfaces

This roadmap develops discrete subgroups of `PSL(2,R)`, their action on the upper half-plane,
the quotient Riemann surfaces and orbifold points produced by elliptic stabilizers, and the
compactification produced by adjoining cusp orbits.  It exposes the actual group action,
stabilizers, quotient maps, local coordinates, and compact Riemann surface.  Orbifold signatures
and presentations are theorems derived from those objects, not substitutes for constructing
them.

The main reusable endpoint is a compactification theorem for cofinite Fuchsian groups.  A
second endpoint applies it to the level-one modular group in the mathematically correct order:
first construct the compact Riemann surface, then descend and extend the normalized modular
`j`-function, then prove that map has degree one, and only then identify the surface
biholomorphically with the Riemann sphere.

Suggested homes: `TauCeti/Analysis/Complex/Fuchsian/` for groups, polygons, and cusps, and
`TauCeti/Geometry/RiemannSurface/Orbifold/` for quotient charts and compactification.

## Scope and completion criterion

The scope is orientation-preserving Fuchsian groups acting on the upper half-plane, with special
attention to cofinite groups, finite elliptic stabilizers, cusp compactification, triangle
groups, polygon presentations, and descent of invariant meromorphic functions. It proves the
standard presentation of the acting Fuchsian group; it does not introduce a general orbifold
groupoid or orbifold fundamental-group carrier.

Teichmüller theory, general Kleinian groups, higher-dimensional locally symmetric spaces,
automorphic representations, and the classification of all two-dimensional orbifolds are
outside this roadmap.  Congruence-subgroup arithmetic, Hecke operators, modular-form dimension
formulas, and the construction and q-expansion of modular forms remain with the modular-forms
roadmap.

The roadmap is complete when Tau Ceti proves the following.

1. `PSL(2,R)` has its effective continuous faithful holomorphic action on Mathlib's
   `UpperHalfPlane`.  Discrete subgroups act properly discontinuously, and all stabilizers are
   finite.
2. The free locus has the standard orbit quotient, covering projection, and complex-manifold
   structure.  At an elliptic point of stabilizer order `m`, a linearizing coordinate identifies
   the local quotient with `z |-> z^m`; the quotient surface remains smooth and the quotient map
   has ramification index `m`.
3. Parabolic fixed points, cusps, normalized cusp data, precisely invariant horodiscs, and
   q-coordinates are constructed. Cusp width belongs to the chosen normalized scaling datum rather
   than to the cusp alone. For a cofinite group there are finitely many cusp orbits.
4. Adjoining those cusp orbits to the coarse quotient gives a compact Hausdorff
   second-countable Riemann surface.  The inclusion of the uncompactified quotient is open, and
   the q-coordinate gives every cusp chart.
5. Invariant holomorphic and meromorphic functions descend through the quotient and extend
   across cusps under exact q-expansion or growth hypotheses.  Local orders upstairs and
   downstairs account for elliptic ramification and cusp widths.
6. A generic compact-Riemann-surface API for local multiplicity, degree, divisor pullback, the
   degree-one biholomorphism theorem, and Riemann--Hurwitz is constructed here, then applied to
   Fuchsian quotients and finite-index maps.
7. Fundamental polygons and the Poincaré polygon theorem produce the expected presentations,
   orbifold signatures, genus formula, and triangle-group examples.
8. The level-one modular quotient is constructed and compactified before any identification
   with `P^1`; the descended normalized `j`-map has degree one and supplies that identification.

## Ownership and dependencies

- **Mathlib owns the upper half-plane and matrix action.**  Consume `UpperHalfPlane`,
  `SL(2,R)`, the Möbius action, fixed-point classification, continuous and proper actions, and
  the theorem that a discrete subgroup of `SL(2,R)` acts properly discontinuously.
- **This roadmap owns the effective projective action.**  Factor the `SL(2,R)` action through
  its center to `PSL(2,R)`, install the quotient topology and topological-group structure, and
  prove faithfulness and holomorphy.  A subgroup of `PSL(2,R)` is the public Fuchsian-group
  input; no bespoke structure repeats a subgroup, topology, action, and discreteness fields.
- **The complex-manifolds roadmap owns `P^1`, general free complex quotients, compatible atlas
  gluing, and the underlying complex-manifold vocabulary.**  This roadmap applies its free
  quotient theorem on the free locus and supplies the elliptic and cusp charts needed beyond
  that theorem.
- **The universal-covers roadmap owns universal covers, deck groups, lifting criteria, and
  induced maps on homotopy groups.**  This roadmap identifies the upper-half-plane quotient as
  an instance of that theory and contributes the Fuchsian and orbifold presentations.
- **The conformal-mapping roadmap owns the Riemann mapping theorem, analytic continuation, and
  Schwarz reflection.**  These are consumed in polygon uniformization and local extension
  arguments.
- **The algebraic-topology roadmap owns finite CW models and Euler characteristic.**  The
  independent `RiemannSurface.Degree` module imports its
  `TauCeti.AlgebraicTopology.Cellular.FiniteCW` module, applies
  `compactManifoldFiniteCWType` in real dimension two, and transports
  `finiteCWEulerCharacteristic` to the compact surface.  No analytic Riemann--Roch theorem is
  used to define genus or prove Riemann--Hurwitz.
- **The modular-forms roadmap owns modular forms and functions before descent, including the
  normalized level-one `j`-function, modular invariance, q-expansion, and exact elliptic orders;
  it also owns congruence-subgroup arithmetic, analytic Riemann--Roch, automorphy sheaves, and
  dimension formulas.** It consumes this roadmap's quotient, compactification, local-multiplicity,
  degree, divisor-pullback, degree-one, and Riemann--Hurwitz declarations. This roadmap does not
  reconstruct modular forms, cohomology, or Riemann--Roch in its level-one application.
- **The algebraic-curves roadmap owns algebraic curves and their function fields.**  This
  roadmap constructs analytic Riemann surfaces.  It proves no GAGA equivalence and creates no
  algebraic curve by declaration.

This roadmap supplies the shared module `TauCeti.Analysis.Complex.RiemannSurface.Degree`. Its
public contract is `RiemannSurface.genus`, `RiemannSurface.localMultiplicity`,
`RiemannSurface.degree`,
`RiemannSurface.degree_comp`, `RiemannSurface.biholomorph_of_degree_eq_one`,
`RiemannSurface.divisor_pullback`, and `RiemannSurface.riemannHurwitz`, all on the compact-surface
and finite holomorphic-map carriers pinned in `Suggested.lean`. These are Layer 5 deliverables,
not imports from a prospective supplier. If matching Mathlib declarations appear, replace the
local declarations and update imports immediately; no work waits for upstream changes.

The import graph is strict:

```text
TauCeti.AlgebraicTopology.Cellular.FiniteCW
    -> TauCeti.Analysis.Complex.RiemannSurface.Degree
        |-> Fuchsian compactification applications
        `-> TauCeti.Analysis.Complex.ModularForms.DimensionFormula

TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs
    -> TauCeti.Analysis.Complex.Fuchsian.LevelOne
```

`RiemannSurface.Degree` imports neither `ModularForms` nor any analytic Riemann--Roch,
automorphy-sheaf, or dimension-formula module.  The separate level-one application consumes the
lower `TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs` module, which contains only the
normalized `j`-function, its invariance, q-expansion, and elliptic orders.  Thus the apparent
roadmap-level cycle is resolved by literal module boundaries rather than by an intended proof
order.

## Pinned conventions

These conventions prevent silent inversions and non-effective actions.

- `PSL(2,R)` means Mathlib's `Matrix.ProjectiveSpecialLinearGroup (Fin 2) R`, the quotient of
  `SL(2,R)` by its center.  The action on `UpperHalfPlane` is the factor of Mathlib's `SL(2,R)`
  action.  Results about stabilizers use this effective action, not an `SL(2,R)` lift containing
  a central element that fixes every point.
- A Fuchsian group is a `Subgroup PSL(2,R)` with the inherited topology and a proof of
  discreteness.  Proper discontinuity is obtained as a theorem or typeclass from that input.
- Hyperbolic area on `UpperHalfPlane` is Mathlib's existing `UpperHalfPlane.volume`, whose density
  is `y⁻² dx dy`; consume its local-finiteness and `GL(2,ℝ)`-invariance theorems. This roadmap
  identifies it with Riemannian volume, defines the covolume of a Fuchsian group from a measurable
  fundamental domain, and proves independence of that domain. A group is cofinite exactly when
  this covolume is finite.
- Quotients are `MulAction.orbitRel.Quotient`; projections are the ordinary quotient maps.  The
  free-locus projection is a covering and local biholomorphism.  The full coarse quotient is not
  falsely claimed to be a covering at elliptic points.
- Stabilizers are `MulAction.stabilizer Γ z`.  Elliptic order is the finite cardinality of that
  subgroup, proved cyclic from the derivative action in a local disc coordinate.
- A cusp is an orbit of a parabolic fixed point in Mathlib's boundary carrier `OnePoint ℝ`.
  A cusp datum stores an actual representative `c`, a projective scaling `σ` with `σ(c)=∞`, a
  positive element `γ`, the equality `⟨γ⟩ = stabilizer Γ c`, its width `w > 0`, and the
  formula `σγσ⁻¹(z)=z+w`. Thus the conjugated full stabilizer is exactly `wℤ`; replacing `γ`
  by a proper power is rejected. Width is not an invariant of the bare cusp. Replacing `σ` by
  `z ↦ a σ(z)+b`, with `a>0`, sends `w` to `a w` and multiplies the q-coordinate by
  `exp(2πib/(aw))`; the compactified complex structure is independent of this choice.
- The coordinate attached to cusp datum `(σ,w)` is
  `q(z)=exp(2*pi*i*σ(z)/w)`. Its selected positive generator fixes `q`. Meridians are
  counterclockwise-positive around `q=0`; prove the associated deck-generator convention and its
  orientation-reversal law.
- Elliptic charts use a coordinate centered at the fixed point in which a generator acts by a
  primitive `m`th root of unity.  The quotient coordinate is `u=z^m`.  Ramification order is
  defined from this map-level local normal form.
- The compactified carrier is the displayed inductive disjoint sum with constructors
  `ofQuotient : MulAction.orbitRel.Quotient Γ UpperHalfPlane → CompactifiedQuotient Γ` and
  `ofCusp : CuspOrbit Γ → CompactifiedQuotient Γ`, together with its explicit equivalence to the
  corresponding `Sum`. The topology glues punctured cusp neighbourhoods across those constructors
  and the charts are subsequently proved. It is neither opaque nor a classified surface.
- Orbifold signature is derived from the genus of the compactification, the list of elliptic
  stabilizer orders, and the number of cusp orbits.  Public theorems continue to expose those
  underlying objects.
- A finite holomorphic map's local multiplicity, degree, divisor pullback, degree-one theorem, and
  Riemann--Hurwitz formula use the exact shared declarations owned in Layer 5 of this roadmap.
  Degree is derived from fibre sums, not supplied as a field of a map record.
- `P^1` is the Riemann sphere supplied by the complex-manifolds roadmap.  A quotient becomes
  `P^1` only through a named biholomorphism proved after the quotient has been compactified.

## Existing foundations to consume

The development starts from the following material.

- `Mathlib/Analysis/Complex/UpperHalfPlane/`: the topology and complex manifold on
  `UpperHalfPlane`, the Möbius action of `SL(2,R)`, fixed points, and properness of the action.
- `Mathlib/Topology/Algebra/Group/DiscontinuousSubgroup.lean` and
  `ProperlyDiscontinuousSMul`, including finiteness of stabilizers and local separation.
- `MulAction.orbitRel.Quotient`, quotient topology, quotient-covering maps on the free locus,
  and Mathlib's charted-space construction for free properly discontinuous quotients.
- Mathlib's complex analytic functions, isolated zeros, removable singularities, power series,
  exponential, winding and argument principles, and one-point compactification.
- `Mathlib.Analysis.Complex.UpperHalfPlane.Measure`, including
  `UpperHalfPlane.volume_def`, local finiteness, and the `GL(2,ℝ)` invariant-measure instance. This
  roadmap constructs only the Riemannian-volume comparison, measurable-fundamental-domain
  covolume, its independence, and Gauss--Bonnet applications.
- The complex-manifolds roadmap's Riemann sphere, complex quotient theorem, atlas gluing, and
  holomorphic local-diffeomorphism/descent APIs.
- The universal-covers roadmap's covering and deck-transformation results.
- The conformal-mapping roadmap's Riemann mapping and Schwarz-reflection results.
- The modular-forms roadmap's normalized level-one `j`, its invariance, q-expansion, and exact
  orders at elliptic points.

## Layer 0: the effective projective Möbius action

1. Equip `PSL(2,R)` with the quotient topology from `SL(2,R)` and prove it is a Hausdorff
   second-countable topological group.  Relate the quotient map to Mathlib's algebraic quotient
   by the center.
2. Construct the canonical homomorphism `PSL(2,R) → PGL(2,R)` and restrict Mathlib's existing
   projective Möbius action along it. Prove compatibility with the `SL(2,R)` action, faithfulness,
   joint continuity of `PSL(2,R) × UpperHalfPlane → UpperHalfPlane`, and that every element acts by
   a biholomorphism. Do not export an unrelated permutation action as a second public action.
3. Prove that a discrete subgroup `Γ <= PSL(2,R)` acts properly discontinuously.  Relate this
   theorem to Mathlib's result for discrete subgroups of `SL(2,R)` through projective lifts,
   without forcing a choice of lift into the public interface.
4. Prove finiteness of every stabilizer.  Classify a nontrivial stabilizer as finite cyclic,
   generated by an elliptic element, and identify its order with the order of the derivative in
   a disc coordinate.
5. Define the free locus by `stabilizer Γ z = bot`; prove it is open and invariant.  Apply the
   generic quotient theorem there and prove the projection is a covering and local
   biholomorphism.

**Source spine:** Beardon, Chapters 7--8; Katok, §§2.1--2.4; Mathlib's
`UpperHalfPlane/ProperAction.lean` and `UpperHalfPlane/FixedPoints.lean`.

## Layer 1: elliptic points and coarse quotient charts

1. For an elliptic fixed point `z` of order `m`, construct an invariant disc whose translates
   are disjoint outside its stabilizer.  Conjugate the stabilizer action holomorphically to
   multiplication by the `m`th roots of unity.
2. Prove the finite cyclic quotient theorem for a disc: `u -> u^m` is the orbit map, its target
   is a disc, it is a local biholomorphism away from zero, and its local multiplicity at zero is
   exactly `m`.
3. Glue these elliptic quotient charts to the free quotient atlas.  Prove the full coarse
   quotient is Hausdorff, second countable, and a Riemann surface; the quotient projection is
   holomorphic and ramified exactly at elliptic orbits.
4. Prove independence from the invariant discs, linearizing coordinates, and stabilizer
   generators.  Record the exact transition law under replacement of a generator by another
   primitive generator.
5. Prove descent and pullback criteria for holomorphic and meromorphic functions, with the local
   order formula
   `ord_z(f upstairs) = m * ord_[z](f descended)` at a point of stabilizer order `m`.

**Source spine:** Farkas--Kra, Chapter I §§4--5; Miranda, Chapter III §§3--4; Katok, §2.4.

## Layer 2: hyperbolic polygons and cofinite groups

1. Consume Mathlib's invariant `UpperHalfPlane.volume`. Compare it with hyperbolic Riemannian
   volume, define measurable fundamental domains, prove their areas agree, define covolume and
   cofiniteness, and derive the Gauss--Bonnet area formula for finite hyperbolic polygons.
2. Develop geodesics, half-planes, convex hyperbolic polygons, sides, vertices, side pairings,
   cycles, and angles using Mathlib's upper-half-plane metric and topology.  Prove the local
   finiteness facts required for translated polygons.
3. Define the input to the Poincaré polygon theorem by separate hypotheses: geodesic
   finite-sidedness; an orientation-reversing fixed-point-free involution on sides; projective
   side-pairing transformations; the exact side-identification law; vertex cycles and angle sums;
   ideal-vertex parabolic cycles; and translated-interior no-overlap plus local finiteness. Prove
   the theorem from these hypotheses, including discreteness, the fundamental-set theorem, and the
   presentation.
4. Prove the converse from a non-elementary finite-covolume group and a Dirichlet centre with
   trivial stabilizer. Construct the finite-sided Dirichlet polygon, its locally finite translates,
   ideal vertices, side pairings, and cycles before deriving the equivalence with cofiniteness.
5. Extract elliptic cycles, parabolic cycles, cusp orbits, genus, and the standard presentation
   from the polygon.  Prove the relation between orientation of the boundary word and orientation
   of meridians in the quotient.
6. Introduce a finite-or-cusp parameter with constructors `elliptic m` carrying `2 ≤ m` and
   `cusp`; its reciprocal is `1/m` and `0`, respectively. Construct hyperbolic triangle groups from
   polygon reflections for triples satisfying the typed inequality that the reciprocal sum is
   less than one. Prove discreteness, faithfulness of the presentation, elliptic orders, and cusp
   count in one theorem family; `(p,q,cusp)` is not untyped infinity notation.

**Source spine:** Beardon, Chapters 9--11; Katok, Chapters 3--4; Stillwell, Chapter 5.

## Layer 3: cusps and q-coordinates

1. Classify parabolic elements and their unique boundary fixed points.  Define cusp orbits in
   `OnePoint ℝ` and prove finiteness for cofinite groups.
2. For each cusp representative `c`, construct a cusp datum: choose a projective
   transformation `σ` with `σ(c)=∞`, prove the full stabilizer is infinite cyclic, orient it,
   select its primitive positive generator `γ`, and prove both `⟨γ⟩ = stabilizer Γ c` and
   `σγσ⁻¹(z)=z+w` for `w>0`. Equivalently, the conjugated full stabilizer is exactly `wℤ`.
   Prove uniqueness only relative to this normalized datum.
3. Construct sufficiently high horodiscs which are precisely invariant under the cusp
   stabilizer.  Prove distinct cusp-orbit horodiscs have disjoint images after shrinking and that
   the complement of their images in a finite-area fundamental polygon is compact.
4. Define `q(z)=exp(2*pi*i*σ(z)/w)`. Prove invariance under the selected generator, identify the
   punctured-disc quotient biholomorphically, and prove `q → 0` along the cusp. For a second datum
   `σ'=aσ+b`, prove `w'=aw` and
   `q'=exp(2πib/(aw))q`, then prove that this nonzero scalar change gives the same compactified
   complex structure.
5. Prove the Laurent/q-expansion criterion: an invariant holomorphic function descends on the
   punctured cusp; boundedness gives a removable singularity, polynomial exponential growth gives
   a pole of controlled order, and decay gives a zero of controlled order.

**Source spine:** Diamond--Shurman, §§2.3--2.4; Katok, §§3.4 and 4.2; Forster, §19.

## Layer 4: compactified quotient Riemann surfaces

The construction order in this layer is normative.

1. Form the carrier as the explicit inductive disjoint sum of the coarse orbit quotient and the
   subtype of parabolic boundary orbits. Use the displayed constructors and sum equivalence in
   `Suggested.lean`. Define cusp neighbourhoods from the precisely invariant horodiscs and prove
   the topology is independent of all height choices.
2. Prove the carrier is Hausdorff and second countable.  For a cofinite group, use the compact
   truncated fundamental polygon plus finitely many cusp discs to prove compactness.
3. Extend the quotient atlas with the q-coordinate at every new point.  Verify transitions with
   free and elliptic charts, then prove `ChartedSpace` and `IsManifold 𝓘(ℂ, ℂ) ∞`.
4. Prove that the original quotient is an open dense submanifold and that the compactifying
   points are exactly the complement. Prove functoriality for conjugate groups. For every
   finite-index inclusion `Γ' ≤ Γ`, extend the quotient map to cusps and prove that compatible data
   give `e_cusp = w_{Γ'}/w_Γ ∈ ℕ`. Compute elliptic ramification from stabilizer indices,
   prove multiplicativity in subgroup towers, and prove the fibre-cardinality and degree formulas.
5. Derive the orbifold signature from the compact surface, elliptic stabilizer orders, and cusp
   set.  Prove the orbifold Euler-characteristic and area formula, including all factors of
   `2*pi` and the effective `PSL` convention.

No step identifies the carrier with `P^1`, a torus, or another classified surface by definition.

**Source spine:** Katok, Chapter 4; Diamond--Shurman, §§2.4--2.5; Forster, §§18--19.

## Layer 5: compact-surface degree theory and Fuchsian applications

1. In the independent lower module `TauCeti.Analysis.Complex.RiemannSurface.Degree`, consume
   AlgebraicTopology's finite CW model of a compact smooth surface and its homotopy-invariant
   Euler characteristic. Define topological genus by `chi(X) = 2 - 2 * genus(X)` and prove that it
   agrees with the usual analytic genus. This module imports neither ModularForms nor analytic
   Riemann--Roch.
2. In that same lower module, define finite nonconstant holomorphic maps, local multiplicity from
   the local analytic normal form, and degree as the sum of local multiplicities over a fibre.
   Prove positivity, fibre finiteness, independence of the chosen fibre, multiplicativity under
   composition, and the degree-one biholomorphism theorem.
3. Define pullback of finite divisors by local multiplicity and construct the ramification
   divisor. Prove first the branched-cover Euler-characteristic formula
   `chi(X) = degree(f) * chi(Y) - ramificationDegree(f)` by excising pairwise-disjoint branch
   discs, applying finite-cover multiplicativity to their complement, and adding back the discs.
   Derive Riemann--Hurwitz by rewriting both Euler characteristics as `2 - 2g`; do not use the
   canonical-divisor formula or Riemann--Roch in this proof spine. The exact public names are
   represented in `Suggested.lean`.
4. Prove that a `Γ`-invariant holomorphic or meromorphic function descends uniquely to the
   coarse quotient.  Combine the elliptic local-order formula and cusp q-expansion criterion to
   extend it to the compactification.
5. Apply the generic declarations to finite-index compactified quotient maps. Reprove neither
   generic fibre finiteness nor independence of the degree sum; identify the local multiplicities
   with the cusp-width and elliptic-stabilizer ratios from Layer 4.
6. Derive the Fuchsian Riemann--Hurwitz and orbifold Euler-characteristic formulas, with the chosen
   effective-action and orientation conventions explicit.

**Source spine:** Forster, §§10, 17, and 19; Miranda, Chapter III §§3--4; Farkas--Kra,
Chapter II §4.

## Layer 6: the level-one modular quotient, in construction order

This layer consumes the modular-forms roadmap's normalized `j`-function, modular invariance,
q-expansion, and exact elliptic orders.

1. Apply Layers 0--4 to the effective level-one modular group.  Construct its coarse quotient,
   elliptic charts, unique cusp, and compact Riemann surface `X(1)`.  Prove its signature from
   the standard fundamental polygon.
2. Descend the normalized `j : UpperHalfPlane -> C` to the uncompactified quotient.  Use its
   q-expansion to extend it meromorphically over the cusp and its elliptic orders to compute all
   local multiplicities on `X(1)`.
3. Regard the extension as a holomorphic map `X(1) -> P^1`.  Prove it has a single simple pole
   over infinity, equivalently degree one, using Layer 5's fibre-counting theorem.
4. Apply the degree-one theorem to obtain a named biholomorphism `X(1) ≃ P^1`.  Normalize it by
   the cusp and elliptic images and prove that this biholomorphism is the descended `j`-map.
5. Transfer no atlas backward by fiat: every statement about `P^1` is obtained through this
   proved biholomorphism after the compact quotient already exists.

**Source spine:** Diamond--Shurman, §§2.3--2.5; Serre, Chapter VII; the modular-forms roadmap's
`j` targets.

## Dependency order and parallel work

| Track | Depends on | Feeds |
| --- | --- | --- |
| L0 effective action and free locus | Mathlib, complex manifolds | L1--L4 |
| L1 elliptic charts | L0, complex-manifold gluing | L4--L6 |
| L2 polygons and presentations | L0, conformal mapping | L3--L4, L6 |
| L3 cusps and q-coordinates | L0, L2 | L4--L6 |
| L4 compactification | L1--L3 | L5--L6 |
| L5 degree theory and applications | complex analysis, compact surfaces, L4 | L6, modular forms |
| L6 level-one example | L0--L5, modular forms | normalized `X(1) ≃ P^1` |

L1 and L2 can proceed in parallel after L0. The local q-coordinate calculation in L3 can proceed
while the global polygon results are completed. The generic part of Layer 5 can proceed in
parallel with Layers 0--4; its Fuchsian applications begin after Layer 4. Matching Mathlib APIs
replace local declarations when available, but no layer waits for them.

## Acceptance checks

- The projective action is effective: an element acting trivially on `UpperHalfPlane` is the
  identity in `PSL(2,R)`.
- A discrete subgroup's stabilizer is finite.  The free-locus quotient projection is a covering,
  while an elliptic point of order `m` has local quotient map `z |-> z^m` and is not mislabeled a
  covering point.
- A cyclic rotation of a disc yields a smooth disc quotient with ramification index equal to the
  group order.
- A cusp datum records a representative sent to infinity and a selected generator whose powers
  are exactly the full stabilizer. A proper power is rejected even though it has a positive
  translation formula. Its q-coordinate descends under the whole stabilizer; replacing `σ` by
  `aσ+b` changes `w` and `q` by the exact formulas above but not the compactified atlas.
- Mathlib's upper-half-plane volume is imported and compared with hyperbolic volume; no second
  invariant measure is constructed.
- A finite-sided cofinite polygon produces a compact surface after one point is adjoined for each
  cusp orbit, with the carrier visibly the coarse quotient plus cusp-orbit subtype and compactness
  proved from a truncated fundamental polygon.
- The triangle-group theorem uses the typed finite-or-cusp parameter and derives the presentation
  and signature from side pairings.
- Invariant functions descend through `MulAction.orbitRel.Quotient`; no choice-based quotient
  section occurs in the public construction.
- Local orders downstairs multiply by elliptic stabilizer order on pullback. Cusp orders use the
  q-coordinate and width from a chosen compatible cusp datum and are proved independent of it.
- The generic degree is a fibre-independent sum of positive local multiplicities, composes
  multiplicatively, pulls back divisors, proves Riemann--Hurwitz, and turns degree one into a
  biholomorphism; these declarations are supplied here rather than attributed to another roadmap.
- The level-one compact quotient is a compact Riemann surface before the normalized `j`-function
  is descended.  The proof of `X(1) ≃ P^1` passes through the theorem that the descended map has
  degree one.
- A structure whose fields assert compactness, the orbifold signature, degree, or the final
  biholomorphism does not satisfy the roadmap.

## References

- Alan Beardon, *The Geometry of Discrete Groups*, Graduate Texts in Mathematics 91,
  Springer, 1983, especially Chapters 7--11.
- Svetlana Katok, *Fuchsian Groups*, Chicago Lectures in Mathematics, University of Chicago
  Press, 1992, especially Chapters 2--4.
- Fred Diamond and Jerry Shurman, *A First Course in Modular Forms*, Graduate Texts in
  Mathematics 228, Springer, 2005, §§2.3--2.5.
- Otto Forster, *Lectures on Riemann Surfaces*, Graduate Texts in Mathematics 81,
  Springer, 1981, especially §§10 and 17--19.
- Hershel Farkas and Irwin Kra, *Riemann Surfaces*, Graduate Texts in Mathematics 71,
  Springer, second edition, 1992.
- Rick Miranda, *Algebraic Curves and Riemann Surfaces*, Graduate Studies in Mathematics 5,
  American Mathematical Society, 1995, Chapter III.
- Jean-Pierre Serre, *A Course in Arithmetic*, Graduate Texts in Mathematics 7,
  Springer, 1973, Chapter VII.
- John Stillwell, *Geometry of Surfaces*, Universitext, Springer, 1992, Chapter 5.
