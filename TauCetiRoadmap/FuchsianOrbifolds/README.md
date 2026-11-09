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
attention to cofinite groups, finite elliptic stabilizers, cusp compactification, triangle groups,
polygon presentations, and descent of invariant meromorphic functions. Layer 0 also constructs the
action of all of `PGL₂(ℝ)`, whose negative-determinant elements act antiholomorphically, and L2.1
proves that this action is isometric. The roadmap proves the standard presentation of the acting
Fuchsian group; it does not introduce a general orbifold groupoid or orbifold fundamental-group
carrier.

Teichmüller theory and the marked moduli-space construction are owned by the separate
`TeichmullerGeometry` roadmap, a downstream consumer of this one: it takes Layer 0 items 2 and 3,
Layer 1 items 1–3, Layer 2 item 1, Layer 4 item 5 and Layer 4a, and no layer here consumes any
layer of it. Arithmetic Fuchsian lattices, commensurators and their applications are owned by the
separate `ArithmeticFuchsianGroups` roadmap, also a downstream consumer of this one: it takes
Layer 0 items 1–3, Layer 2 items 1, 4 and 5, Layer 4 item 5, Layer 4a and Layer 5 items 4 and 5,
and no layer here consumes any layer of it. General Kleinian groups, higher-dimensional locally
symmetric spaces, automorphic representations, and the classification of all two-dimensional
orbifolds remain outside this roadmap. Congruence-subgroup arithmetic, Hecke operators,
modular-form dimension formulas, and the construction and q-expansion of modular forms remain with
the modular-forms roadmap.

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
6. Native compact-Riemann-surface finite-map, local-multiplicity, degree, divisor-pullback, and
   ramification APIs are consumed directly. [SurfaceTopology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7f2099ebe4dd3e6388764fc67b57461e890de13f/TauCetiRoadmap/SurfaceTopology/README.md) Layer 8 owns compact-surface classification, genus, and topological Euler
   characteristic; SurfaceTopology Layer 5 owns the generic topological branched-cover
   Riemann–Hurwitz theorem. GeometricTopology Layer 1 supplies the smooth/finite-CW comparison
   adapter, and [PlanarTopology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7f2099ebe4dd3e6388764fc67b57461e890de13f/TauCetiRoadmap/PlanarTopology/README.md) supplies triangulation, orientation, boundary, and surface-Euler
   invariance. Fuchsian Layer 5 specializes these interfaces to compact complex curves: it owns
   the curve-to-oriented-surface names and the analytic finite-map-to-topological-branched-cover
   adapter, not a second generic classification or Riemann–Hurwitz proof.
7. Fundamental polygons and the Poincaré polygon theorem produce the expected presentations,
   orbifold signatures, genus formula, and triangle-group examples.
8. The level-one modular quotient is constructed and compactified before any identification
   with `P^1`; the descended normalized `j`-map has degree one and supplies that identification.
9. The compact orbifold minimum `π/21` and the finite-area extension of that minimum to cusp
   signatures are proved from Gauss–Bonnet and integer-signature minimization.

## Ownership and dependencies

- **Mathlib owns the upper half-plane and matrix action.**  Consume `UpperHalfPlane`,
  `SL(2,R)`, the Möbius action, fixed-point classification, continuous and proper actions, and
  the theorem that a discrete subgroup of `SL(2,R)` acts properly discontinuously.
- **This roadmap owns the effective projective action.**  Factor the `SL(2,R)` action through
  its center to `PSL(2,R)`, install the quotient topology and topological-group structure, and
  prove faithfulness and holomorphy.  A subgroup of `PSL(2,R)` is the public Fuchsian-group
  input; no bespoke structure repeats a subgroup, topology, action, and discreteness fields.
- **[ComplexManifolds M3–M6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/581f66fed0f12fe49b8f5dd96aa18d3e435c190a/TauCetiRoadmap/ComplexManifolds/README.md#milestone-3-the-riemann-sphere)** supplies the exact upstream contracts: M3's named two-chart atlas on `OnePoint ℂ`, M4's free properly-discontinuous holomorphic quotient/local-biholomorphism and invariant-map descent, M5's compatible `TopCat.GlueData` atlas gluing, and M6's generated-relation Hausdorffness, finite second-countability and proper-map comparisons. M4 consumes the selected Mathlib quotient API or its explicitly stated local mirror at an older dependency pin; these are written supplier targets, not a claim that all declarations are implemented. Apply M4 on the free locus and supply the elliptic/cusp charts beyond its free-action hypotheses; use M5–M6 to glue and separate those actual charts.
- **The universal-covers roadmap owns universal covers, deck groups, lifting criteria, and
  induced maps on homotopy groups.**  This roadmap identifies the upper-half-plane quotient as
  an instance of that theory and contributes the Fuchsian and orbifold presentations.
- **The [conformal-mapping roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ce3c761ba71177cc8d64ff0b6d4ad196b4f39821/TauCetiRoadmap/ConformalMapping/README.md) owns the Riemann mapping theorem, analytic continuation, and
  Schwarz reflection.**  These are consumed in polygon uniformization and local extension
  arguments.
- **SurfaceTopology Layers5 and8, PlanarTopology Layers5/6/8, and the smooth comparison.** SurfaceTopology
  Layer 8 owns the generic compact-surface classification, standard models, genus, and topological
  Euler characteristic; it consumes PlanarTopology's `Surface.eulerChar`, orientability and
  boundary-count invariance. SurfaceTopology Layer 5 owns topological Riemann–Hurwitz for a
  branched cover of compact connected surfaces. [GeometricTopology Layer 1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/bdc4b6bc82a08ecc2c09f64646c3f12fca36bebd/TauCetiRoadmap/GeometricTopology/README.md#L236-L286) supplies the
  dimension-two smooth/finite-CW comparison adapter, using [AlgebraicTopology 4.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/50af6084a401dffe3db1e50dac46fe4bca36f4fd/TauCetiRoadmap/AlgebraicTopology/README.md#L793-L818)'s
  `simplicialRealizationCW` and `standardCellBallToOrderedSimplex` and native
  `TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex`; it does not define the generic
  classification or genus. Fuchs Layer 5 owns a complex-curve specialization in
  the `SurfaceInvariants` section of `Suggested.lean`, with the three target declarations re-exported on
  `TauCeti.RiemannSurface`, and owns the analytic adapter from native finite holomorphic maps to
  SurfaceTopology's topological branched-cover carrier. For a finite holomorphic map
  `f:X→Y` between compact connected Riemann surfaces, let `B` be its finite branch-value set.
  Prove in charts that near each `x`, `f` is biholomorphically conjugate to `z↦z^{e_x}` by
  factoring `f(z)−f(0)=z^{e_x}u(z)`, taking a local holomorphic `e_x`th root of the nonvanishing
  factor, and applying the holomorphic inverse-function theorem. Show the restriction away from
  `B` and `f⁻¹(B)` is a proper local homeomorphism; identify its sheet count with native degree
  at a regular value and identify each local branching index with native `localMultiplicity`.
  These data satisfy the hypotheses of SurfaceTopology Layer 5's generic Riemann–Hurwitz theorem.
  Compare its branch sum with native `ramificationDegree` using
  `card_fiber_add_sum_localMultiplicity_sub_one`; the resulting formula is the Fuchsian
  `RiemannSurface.riemannHurwitz` adapter. Native degree, fibre-sum, divisor-pullback, and
  ramification carriers are consumed directly. [ComplexKahlerGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md) K7 compares its Hodge
  genus `h^(1,0)` with SurfaceTopology Layer 8's genus, and ModularForms10B 10B(v) compares its
  Čech genus `dim H¹(O)` with that same genus. Neither analytic comparison is an input to the
  topological Riemann–Hurwitz proof.
- **The modular-forms roadmap owns modular forms and functions before descent, including the
  normalized level-one `j`-function, modular invariance, q-expansion, and exact elliptic orders;
  it also owns congruence-subgroup arithmetic, analytic Riemann--Roch, automorphy sheaves, and
  dimension formulas.** It consumes this roadmap's quotient, compactification, local-multiplicity,
  degree, divisor-pullback, degree-one, and Riemann--Hurwitz declarations. This roadmap does not
  reconstruct modular forms, cohomology, or Riemann--Roch in its level-one application.
- **The algebraic-curves roadmap owns algebraic curves and their function fields.**  This
  roadmap constructs analytic Riemann surfaces.  It proves no GAGA equivalence and creates no
  algebraic curve by declaration.
- **TeichmullerGeometry, a downstream consumer, owns marked Teichmüller space and its
  generic-locus theorems.** It consumes the layers listed under Scope, and this roadmap consumes
  none of its layers.
- **ArithmeticFuchsianGroups, a downstream consumer, owns arithmetic Fuchsian lattices, their
  fixed-signature finiteness, commensurators and the applications built on them.** It consumes the
  layers listed under Scope, and this roadmap consumes none of its layers.

Layer 5 consumes the implemented native module
`TauCeti.Analysis.Complex.RiemannSurface.Degree` (and its native `LocalDegree`, `Divisor`, and
`Ramification` dependencies). In particular, use `TauCeti.RiemannSurface.FiniteHolomorphicMap`,
`degree`, `degree_eq_fiber_sum`, `degree_comp`, `biholomorphOfDegreeEqOne`, `divisorPullback`, and
`ramificationDegree` with their native hypotheses. This roadmap does not redeclare those carriers or
identities. Its owned declarations are the complex-curve genus/Euler specializations, the analytic adapter
from native finite holomorphic maps to SurfaceTopology's branched-cover carrier, and the
Fuchsian quotient applications. SurfaceTopology Layers 5 and 8 own the generic topological
Riemann--Hurwitz and compact-surface classification/genus/Euler results; GeometricTopology
Layer 1 supplies the smooth/finite-CW comparison adapter.

The import graph is strict:

```text
TauCeti.Analysis.Complex.RiemannSurface.Degree + LocalDegree + Divisor + Ramification
SurfaceTopology Layer 8 classification/genus/Euler + PlanarTopology surface model
GeometricTopology Layer 1 smooth/finite-CW adapter + AlgebraicTopology 4.7 CW conversion
SurfaceTopology Layer 5 topological branched-cover Riemann–Hurwitz
    -> Fuchsian complex-curve specialization and analytic finite-map/branched-cover adapter
        -> Fuchsian compactification applications
        -> ModularForms10B consumers

TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs
    -> TauCeti.Analysis.Complex.Fuchsian.LevelOne

Fuchsian L0/L1/L2.1/L4/L4a -> downstream consumer TeichmullerGeometry
Fuchsian L0/L2/L4/L4a/L5 -> downstream consumer ArithmeticFuchsianGroups
```

`TauCeti.Analysis.Complex.RiemannSurface.Degree` is a native lower module and imports neither
`ModularForms` nor analytic Riemann--Roch, automorphy-sheaf, or dimension-formula modules. The
separate level-one application consumes the
lower `TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs` module, which contains only the
normalized `j`-function, its invariance, q-expansion, and elliptic orders.  The module boundaries make the dependency graph acyclic.

## Pinned conventions

These conventions prevent silent inversions and non-effective actions.

- `PSL(2,R)` means Mathlib's `Matrix.ProjectiveSpecialLinearGroup (Fin 2) R`, the quotient of
  `SL(2,R)` by its center.  The action on `UpperHalfPlane` is the factor of Mathlib's `SL(2,R)`
  action.  Results about stabilizers use this effective action, not an `SL(2,R)` lift containing
  a central element that fixes every point.
- A Fuchsian group is a `Subgroup PSL(2,R)` with the inherited topology and a proof of
  discreteness.  Proper discontinuity is obtained as a theorem or typeclass from that input.
- Hyperbolic area is `MeasureTheory.volume : Measure UpperHalfPlane`, whose density
  `y⁻² dx dy` is given by `UpperHalfPlane.volume_def`; consume its local-finiteness and
  `GL(2,ℝ)`-invariance theorems. Fuchsian L2.1 owns the dimension-two identity-coordinate comparison `UpperHalfPlane → TauCeti.UpperHalfSpace ℝ`, its pulled-back tensor, the comparison of the induced Riemannian distance with native `UpperHalfPlane.dist_eq`, and its Riemannian-volume identification with `UpperHalfPlane.volume_def`. RiemannianGeometry R4.7 supplies the native half-space model and its generic model/quotient/Killing–Hopf theory; it does not supply these `UpperHalfPlane`-specific adapters. Layer2 proves the PSL/PGL actions are smooth isometries and defines covolume from a measurable fundamental domain with domain independence. A group is cofinite exactly when its covolume is finite.
- Quotients are `MulAction.orbitRel.Quotient`; projections are the ordinary quotient maps.  The
  free-locus projection is a covering and local biholomorphism.  The full coarse quotient is not
  falsely claimed to be a covering at elliptic points.
- Stabilizers are `MulAction.stabilizer Γ z`.  Elliptic order is the finite cardinality of that
  subgroup, proved cyclic from the derivative action in a local disc coordinate.
- A cusp is an orbit of a parabolic fixed point in Mathlib's boundary carrier `OnePoint ℝ`.
  A cusp datum stores an actual representative `c`, a projective scaling `σ` with `σ(c)=∞`, a
  positive element `γ`, the equality `⟨γ⟩ = stabilizer Γ c`, its width `w > 0`, and the
  formula `σγσ⁻¹(z)=z+w`. Thus the conjugated full stabilizer is exactly `wℤ`; replacing `γ`
  by a proper power is rejected. Width is not an invariant of the bare cusp. Prove the scaling
  theorem from the full positive generator: if two data have the same cusp representative and
  selected positive generator, and `σ'(z)=aσ(z)+b` for `a>0`, conjugating that generator gives
  `w' = a w`. The q-coordinate transition then multiplies by
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
- The native `TauCeti.Analysis.Complex.RiemannSurface.{Degree,LocalDegree,Divisor,Ramification}`
  modules own `FiniteHolomorphicMap`, local multiplicity, degree/fibre sums, divisor pullback,
  ramification divisor and degree, the weighted-fibre identity, and the degree-one theorem. L5
  consumes these exact declarations and owns the separate analytic `z↦z^e` normal form, the complex-curve comparison with the public surface Euler/genus invariants, and Fuchsian Riemann–Hurwitz applications. Degree is derived from
  fibre sums, not supplied as a field of a map record.
- `P^1` is the Riemann sphere supplied by the exact ComplexManifolds M3 contract linked above.  A quotient becomes
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
  the `MeasureTheory.volume` instance on `UpperHalfPlane`, `UpperHalfPlane.volume_def`, local
  finiteness, and the `GL(2,ℝ)` invariant-measure instance. This
  roadmap proves its UpperHalfPlane/native-half-space tensor, distance and Riemannian-volume comparison in L2.1, then owns measurable-fundamental-domain covolume, its independence, and Gauss–Bonnet applications. RiemannianGeometry R4.7 supplies its actual generic model, quotient and Killing–Hopf interfaces.
- The exact ComplexManifolds M3–M6 contract linked above: named sphere, free complex quotient, compatible gluing/topology and holomorphic local-biholomorphism/descent APIs.
- The universal-covers roadmap's covering and deck-transformation results.
- The conformal-mapping roadmap's Riemann mapping and Schwarz-reflection results.
- The modular-forms roadmap's normalized level-one `j`, its invariance, q-expansion, and exact
  orders at elliptic points.

## Layer 0: the effective projective Möbius action

1. Equip `PSL(2,R)` with the quotient topology from `SL(2,R)` and prove it is a Hausdorff
   second-countable topological group.  Relate the quotient map to Mathlib's algebraic quotient
   by the center.
2. Construct the projective action of `PGL₂(ℝ)=GL₂(ℝ)/ℝˣ` on `UpperHalfPlane` from matrix
   representatives. For `A=\begin{pmatrix}a&b\c&d\end{pmatrix}` with positive determinant use
   `z↦(az+b)/(cz+d)`; for negative determinant use `z↦(a\bar z+b)/(c\bar z+d)`. Prove the
   formulas are independent of scalar representatives, compose according to matrix multiplication,
   and define a continuous smooth isometric action. Prove the kernel on `GL₂(ℝ)` is exactly the
   nonzero scalar matrices, so the descended PGL action is faithful. Construct the canonical
   homomorphism `PSL₂(ℝ)→PGL₂(ℝ)` and prove its restriction agrees with Mathlib's `SL₂(ℝ)` action,
   including joint continuity and biholomorphy of its orientation-preserving elements. Do not
   export an unrelated permutation action as a second public action.
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

1. **L2.1: owned dimension-two model comparison and projective action.** Consume [RiemannianGeometry R4.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7d5cabbd745d7e1b7e51cc8540b0b6d2e4abef65/TauCetiRoadmap/RiemannianGeometry/README.md#L649-L696)'s native `TauCeti.UpperHalfSpace ℝ` model, its Riemannian metric/distance, generic space-form/Killing–Hopf theorem and free smooth-isometry quotient construction. Prove the following Fuchsian-specific comparison before using that theory on Mathlib's `UpperHalfPlane`:
   - Define the map in literal coordinates `x+iy ↦ (x,y)` in the positive-height subtype of `WithLp 2 (ℝ×ℝ)` and its inverse `(x,y)↦x+iy`. Prove inverse, topology and jointly smooth real-coordinate formulas; do not export a competing hyperbolic carrier.
   - Pull back the native half-space tensor and compute on tangent vectors `v,w∈ℂ` the exact expression `(Re(v)Re(w)+Im(v)Im(w))/y²`. Identify the real-linear coordinate map with the Euclidean/`WithLp 2` isometry and compare the installed native tangent metric, rather than only its notation. Preserve the positive `dx∧dy` orientation.
   - Prove that its induced length distance is the native Mathlib distance on `UpperHalfPlane`. Compare piecewise-C¹ lengths under the coordinate diffeomorphism. Derive vertical geodesic length `|log(y₂/y₁)|` and semicircle geodesics, prove the projective Möbius differential preserves the tensor, and send an arbitrary pair to a vertical pair. The lower bound on every joining curve follows from `|d log y|≤ds`; the vertical curve attains it. Convert the resulting `arcosh(1+((x−x′)²+(y−y′)²)/(2yy′))` formula to `UpperHalfPlane.dist_eq`, including the coincident-point case. Equality of coordinate tensors alone is not a proof about Mathlib's pre-existing metric. This yields the Riemannian isometry to the native half-space metric and transports completeness and curvature `−1`.
   - Compute the Riemannian volume in these coordinates: the metric matrix is `y⁻² I₂`, so its density relative to real coordinate Lebesgue measure is `sqrt(det(g))=y⁻²`. Compare complex Lebesgue measure with the real-coordinate product measure through the fixed Euclidean isometry, then prove equality of Borel measures with `MeasureTheory.volume : Measure UpperHalfPlane` using `UpperHalfPlane.volume_def`. Use positive measurable densities/local chart integration and uniqueness of the resulting measures; local finiteness is retained. This compares to the existing invariant measure, with no second normalization.
   Prove the Layer0 PSL and PGL actions are smooth Riemannian isometries for this identified metric, including antiholomorphic orientation reversal in the negative-determinant case. Define measurable fundamental domains, prove equality of their areas, define covolume/cofiniteness and derive Gauss–Bonnet for finite hyperbolic polygons. R4.7 retains generic Riemannian model, quotient and Killing–Hopf ownership; L2.1 owns the UpperHalfPlane coordinate/tensor/distance/volume adapters and Fuchsian applications.
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

## Layer 4a: minimum area of compact orientable hyperbolic orbifolds

Consume Layer 4's Gauss–Bonnet signature formula. For every compact orientable effective
`PSL₂(ℝ)` orbifold quotient of signature `(g;m₁,…,m_r)` with `m_i≥2` and positive hyperbolic
area, prove
`Area=2π(2g−2+Σ_i(1−1/m_i))≥π/21`, with equality exactly for signature `(0;2,3,7)` up to
permutation. This is an owned theorem, not an implicit consequence of the formula.

Proof target: if `g≥2`, the area is at least `4π`; if `g=1`, hyperbolicity requires at least one
cone point and the area is at least `π`. For `g=0`, hyperbolicity requires `r≥3`. When `r=3`,
sort `m₁≤m₂≤m₃` and minimize the positive gap
`1−(1/m₁+1/m₂+1/m₃)`: if `m₁=2,m₂=2` it is nonpositive; if `(m₁,m₂)=(2,3)`, positivity forces
`m₃≥7` and the gap is at least `1/42`, with equality at 7; if `m₁=2,m₂=4`, then `m₃≥5`
and the gap is at least `1/20`; if `m₁=2,m₂≥5`, the gap is at least `1/10`; and if `m₁≥3`,
positivity forces the gap at least `1/12` (the `(3,3,3)` case is nonhyperbolic). For `r=4`,
the all-order-two signature has zero area and any hyperbolic case has at least one `m_i≥3`, so
the reciprocal sum is at most `11/6`, giving gap at least `1/6`. For `r≥5`,
`Σ1/m_i≤r/2` gives `r−2−Σ1/m_i≥r/2−2≥1/2`. Convert the smallest gap `1/42` by the
factor `2π`. The statement applies to compact quotients; cusps are not part of its scope.

For finite-area orientable signatures `(g;m₁,…,m_r;c)`, with `c≥1` cusps, consume the same
Gauss–Bonnet formula with cusp contribution `c`. Prove the named target
`minimum_area_finite_area_orbifold`: the minimum over all hyperbolic cusp signatures is `π/3`,
attained at `(0;2,3;1 cusp)`. The exhaustive cases are:

| Signature range | Hyperbolicity/minimum consequence |
|---|---|
| `g≥2` | area at least `4π` |
| `g=1, c≥1` | area at least `2π` |
| `g=0, c≥3` | bracket `−2+Σ(1−1/m_i)+c ≥ 1`, hence area at least `2π` |
| `g=0, c=2` | `r=0` has zero area; for `r≥1`, the bracket is at least `1/2`, hence area at least `π` |
| `g=0, c=1, r≤1` | area is nonpositive |
| `g=0, c=1, r=2` | sort `m₁≤m₂`; `(2,2)` is zero-area, `(2,3)` gives the minimum bracket `1/6`, and every other hyperbolic pair has bracket at least `1/4` |
| `g=0, c=1, r≥3` | bracket at least `1/2`, hence area at least `π` |

Own the integer-signature minimization proof in these cases, including the order comparisons in the
`r=2` row; the downstream ArithmeticFuchsianGroups roadmap consumes both minima for normalizer
indices, and the downstream TeichmullerGeometry Layer 10 consumes the compact minimum `π/21` from
the preceding theorem.


## Layer 5: compact-surface degree theory and Fuchsian applications

1. Consume SurfaceTopology Layer 8's compact oriented surface classification, standard models,
   genus and topological Euler characteristic; consume PlanarTopology Layers5/6/8's Radó/Hauptvermutung, surface Euler/orientation and compatible-category comparison, with its boundary-count interface, together with GeometricTopology
   Layer 1's smooth/finite-CW comparison adapter and AlgebraicTopology 4.7's CW conversion.
   The `SurfaceInvariants` section of `Suggested.lean` specializes the generic genus and Euler
   interfaces to the compact connected complex-curve carrier; retain the public
   `TauCeti.RiemannSurface.genus`, `surfaceEulerCharacteristic` and `riemannHurwitz` names as re-exports of the owned specialization/adapters, not declarations supplied by the native Degree module. The adapter identifies the compactified
   quotient's underlying oriented-surface invariants with the Layer 8 model. Consume the native
   `TauCeti.RiemannSurface.FiniteHolomorphicMap`, fibre-sum degree, local-multiplicity, divisor
   pullback, and ramification-divisor/degree APIs. Do not redeclare these native carriers or
   identities.
2. Adapt native finite holomorphic maps to SurfaceTopology Layer 5's generic branched-cover
   theorem. First prove the analytic local normal form: in complex charts factor
   `f(z)−f(0)=z^e u(z)` with `u` holomorphic and nonvanishing, choose a local holomorphic
   `e`th root of `u`, and apply the holomorphic inverse-function theorem to obtain the local
   model `z↦z^e`. The native `LocalDegree` result supplies a local fibre count, not this
   conjugacy. The native ramification theorem gives a finite branch-value set for a finite map
   between compact connected curves. Away from this set the map is a proper local
   homeomorphism; prove its covering degree agrees with native degree at a regular value.
   These constructions define the adapter to SurfaceTopology's `IsBranchedCover` data: the
   underlying compact connected surfaces, finite branch set, degree-`d` covering off that set,
   and local degree at every exceptional point. Identify each local degree with native
   `localMultiplicity`; use `card_fiber_add_sum_localMultiplicity_sub_one` to identify the
   generic branch sum `∑(e_x−1)` with native `ramificationDegree`. Apply SurfaceTopology Layer
   5's theorem to obtain the Euler-characteristic formula. The Layer 8 compact-surface
   comparison from item 1 then gives the genus form `RiemannSurface.riemannHurwitz`. Fuchsian
   Layer 5 owns these complex-analytic carrier adapters and their quotient applications, not a
   second cell-count proof of generic topological Riemann–Hurwitz. No analytic genus comparison
   or analytic Riemann–Roch is an input.

3. Prove that invariant holomorphic or meromorphic functions descend uniquely to the coarse
   quotient. Combine the elliptic local-order formula and cusp q-expansion criterion to extend
   them to the compactification.
4. Apply the native degree and the generic SurfaceTopology Layer 5 Riemann–Hurwitz theorem
   through item 2 to finite-index compactified Fuchsian quotient maps. Identify their local multiplicities with the cusp-width and elliptic-stabilizer
   ratios from Layer 4, then state and prove the Fuchsian Riemann--Hurwitz and orbifold
   Euler-characteristic formulas with the effective-action and orientation conventions explicit.
5. For every cofinite orientation-preserving Fuchsian group, including elliptic stabilizers and
   cusps, prove that the genus `h` in its L2 signature equals the SurfaceTopology Layer 8 genus
   of `CompactifiedQuotient Γ`, using the Fuchsian complex-curve specialization from item 1.
   Construct the compact coarse surface by L4's elliptic charts and cusp fillings. Subdivide the compactified polygon model so every elliptic cycle and cusp
   orbit is a vertex; at cusps use the filled-disc charts to extend the incident sectors. Prove
   that this is a finite cell decomposition of the compact coarse surface, compare it with
   SurfaceTopology Layer 8's standard model through item 1's complex-curve specialization, and obtain
   the unweighted cell count `χ=2−2h`. Keep this count distinct
   from the orbifold value `χ_orb=2−2h−s−Σ_i(1−1/m_i)`, where `s` is the number of cusps and
   `m_i` the elliptic orders. Use the dimension-two smooth/finite-CW comparison from GeometricTopology Layer 1 only for
   smooth clients; the polygon cell count itself is a Fuchsian compactification adapter. This
   named bridge applies both to
   compact coarse quotients with elliptic points, such as a closed surface modulo a finite group
   of automorphisms, and to L6's noncompact modular quotient before cusp filling. Neither genus is identified by notation alone.

**Source spine:** Forster, §§10, 17, and 19; Miranda, Chapter III §§3--4; Farkas--Kra,
Chapter II §4.

## Layer 6: the level-one modular quotient, in construction order

This layer consumes the modular-forms roadmap's normalized `j`-function, modular invariance,
q-expansion, and exact elliptic orders.

1. Apply Layers 0--4 to the effective level-one modular group. Construct its coarse quotient,
   elliptic charts, unique cusp, and compact Riemann surface `X(1)`. Prove its signature from the
   standard fundamental polygon, and use the genus bridge of L5 to prove the named theorem
   `RiemannSurface.genus X(1)=0` expected by ModularForms 10B(vi).
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
| L2 polygons and presentations | L0, conformal mapping, R4.7 native/generic models plus owned L2.1 coordinate/tensor/distance/volume comparison | L3--L4, L6 |
| L3 cusps and q-coordinates | L0, L2 | L4--L6 |
| L4 compactification | L1--L3 | L5--L6 |
| L5 degree theory and applications | complex analysis, SurfaceTopology Layers 5 and 8, PlanarTopology surface invariants, GeometricTopology Layer 1 smooth/finite-CW comparison, native Riemann-surface degree APIs, L4 | L6, modular forms |
| L6 level-one example | L0--L5, modular forms | normalized `X(1) ≃ P^1` |
| L4a compact and finite-area minima | L4, integer-signature minimization | compact area ≥ `π/21`; cusp area ≥ `π/3` |

The dependency order follows the table. No row depends on TeichmullerGeometry or
ArithmeticFuchsianGroups, which consume this roadmap downstream. L1 and L2 can proceed in parallel
after L0. The local q-coordinate calculation in L3 can proceed while the global polygon results are
completed. The generic part of Layer 5 can proceed in
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
- Fuchsian L2.1 proves the literal-coordinate UpperHalfPlane/UpperHalfSpace diffeomorphism, tensor equality, induced/native distance comparison and Riemannian-volume identification with `UpperHalfPlane.volume_def`. RiemannianGeometry R4.7 supplies its native model and generic quotient/Killing–Hopf theory; no UpperHalfPlane-specific comparison is attributed to it and no second invariant measure is constructed.
- A finite-sided cofinite polygon produces a compact surface after one point is adjoined for each
  cusp orbit, with the carrier visibly the coarse quotient plus cusp-orbit subtype and compactness
  proved from a truncated fundamental polygon.
- The triangle-group theorem uses the typed finite-or-cusp parameter and derives the presentation
  and signature from side pairings.
- Invariant functions descend through `MulAction.orbitRel.Quotient`; no choice-based quotient
  section occurs in the public construction.
- Local orders downstairs multiply by elliptic stabilizer order on pullback. Cusp orders use the
  q-coordinate and width from a chosen compatible cusp datum and are proved independent of it.
- Native Riemann-surface modules own degree, local multiplicity, divisor pullback, ramification,
  weighted-fibre count and degree-one declarations. Layer 5 owns the local `z↦z^e` analytic
  normal form, complex-curve Euler/genus specializations, the analytic adapter to the generic
  topological branched-cover theorem, and Fuchsian applications.
- The level-one compact quotient is a compact Riemann surface before the normalized `j`-function
  is descended.  The proof of `X(1) ≃ P^1` passes through the theorem that the descended map has
  degree one.
- A structure whose fields assert compactness, the orbifold signature, degree, or the final
  biholomorphism does not satisfy the roadmap.
- L4a proves the compact minimum `π/21` from the L4 area formula and handles all genus and
  cone-count/order cases; equality is exactly `(0;2,3,7)`.

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
