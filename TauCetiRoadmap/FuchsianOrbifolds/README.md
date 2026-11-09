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

Suggested homes: `TauCeti/Analysis/Complex/Fuchsian/` for groups, polygons, cusps, quotient charts
and the compactification, and `TauCeti/Analysis/Complex/RiemannSurface/` for genus and
Riemann–Hurwitz.

## Scope and completion criterion

The scope is orientation-preserving Fuchsian groups acting on the upper half-plane, with special
attention to cofinite groups, finite elliptic stabilizers, cusp compactification, triangle groups,
polygon presentations, and descent of invariant meromorphic functions. Layer 0 also restricts
Mathlib's action of `GL(2,ℝ)` on `UpperHalfPlane`, through `PGL(2,ℝ)`, to the projective action,
and proves that every element of `GL(2,ℝ)`, including the antiholomorphic negative-determinant
ones, acts by an isometry of the hyperbolic distance. The roadmap proves the standard
presentation of the acting Fuchsian group; it does not introduce a general orbifold groupoid or
orbifold fundamental-group carrier.

Teichmüller theory and the marked moduli-space construction are owned by the separate
`TeichmullerGeometry` roadmap, a downstream consumer of this one: it takes Layer 0 items 2 and 3,
Layer 1 items 1–3, Layer 2 item 1, Layer 4 item 5 and Layer 4a, and no layer here consumes any
layer of it. Arithmetic Fuchsian lattices, commensurators and their applications are owned by the
separate `ArithmeticFuchsianGroups` roadmap, also a downstream consumer of this one: it takes
Layer 0 items 1–3, Layer 2 items 1, 4 and 5, Layer 4 item 5, Layer 4a and Layer 5 items 5–7,
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
6. A compact connected Riemann surface has a topological genus `g` with `χ = 2 − 2g`, and every
   finite holomorphic map of compact connected Riemann surfaces satisfies Riemann–Hurwitz in genus
   form. Both are applied to Fuchsian quotients and finite-index maps, and the genus of the
   compactified quotient enters the orbifold area formula.
7. Fundamental polygons and the Poincaré polygon theorem produce the expected presentations,
   orbifold signatures, genus formula, and triangle-group examples.
8. The level-one modular quotient is constructed and compactified before any identification
   with `P^1`; the descended normalized `j`-map has degree one and supplies that identification.
9. Every cofinite Fuchsian group has covolume at least `π/21`, with equality exactly for signature
   `(0;2,3,7)`, and every cofinite group with a cusp has covolume at least `π/3`, with equality
   exactly for signature `(0;2,3;1)`.

## Ownership and dependencies

- **Mathlib owns the upper half-plane and matrix action.**  Consume `UpperHalfPlane`,
  `SL(2,R)`, the Möbius action, fixed-point classification, continuous and proper actions, and
  the theorem that a discrete subgroup of `SL(2,R)` acts properly discontinuously. Mathlib's
  `UpperHalfPlane.glAction` (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`) is the action of
  `GL(2,ℝ)`, through complex conjugation `UpperHalfPlane.σ g` when `det g < 0`; the same file
  descends it to `MulAction PGL(2, ℝ) ℍ`, `FixedPoints.lean` proves `FaithfulSMul PGL(2, ℝ) ℍ`, and
  `Metric.lean` proves `IsIsometricSMul SL(2, ℝ) ℍ`.
- **This roadmap owns the effective projective action.**  Factor the `SL(2,R)` action through
  its center to `PSL(2,R)`, install the quotient topology and topological-group structure, and
  prove faithfulness and holomorphy.  A subgroup of `PSL(2,R)` is the public Fuchsian-group
  input; no bespoke structure repeats a subgroup, topology, action, and discreteness fields.
- **ComplexManifolds Milestones 1–6** supply Milestone 1's restriction of scalars from a complex
  to the underlying real smooth surface, Milestone 2's canonical orientation of that surface,
  Milestone 3's named two-chart atlas on `OnePoint ℂ`, Milestone 4's free properly discontinuous
  holomorphic quotient, local biholomorphism and invariant-map descent, Milestone 5's compatible
  atlas gluing, and Milestone 6's Hausdorffness, second-countability and proper-map comparisons.
  Apply Milestone 4 on the free locus and supply the elliptic and cusp charts beyond its free-action
  hypotheses; use Milestones 5–6 to glue and separate those charts.
- **The universal-covers roadmap (completed) owns universal covers, deck groups, lifting
  criteria, and induced maps on homotopy groups.**  This roadmap identifies the upper-half-plane
  quotient as an instance of that theory and contributes the Fuchsian and orbifold presentations.
- **The conformal-mapping roadmap (completed) owns the Riemann mapping theorem, analytic
  continuation, and Schwarz reflection.**  These are consumed in polygon uniformization and local
  extension arguments.
- **AlgebraicTopology owns finite CW type, Poincaré duality and the Euler characteristic.**
  AlgebraicTopology Stage 8 item 7 proves that a compact smooth manifold, also with finitely many
  marked interior points, has finite CW type; Stage 6 items 4 and 5 supply Poincaré duality and
  the intersection pairing of a closed oriented manifold. The Euler characteristic of a space of
  finite CW type is Tau Ceti's `TauCeti.eulerChar`
  (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`), and the
  branched-cover formula `χ(X) = deg f · χ(Y) − R(f)` is Tau Ceti's
  `TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`
  (`TauCeti/Analysis/Complex/RiemannSurface/Branch/EulerCharacteristic.lean`). Layer 5 item 1 owns
  the topological genus of a compact connected Riemann surface and the identity `χ = 2 − 2g`;
  Layer 5 item 3 owns Riemann–Hurwitz in genus form. No analytic genus and no Riemann–Roch theorem
  enters either. ComplexKahlerGeometry K7 compares its Hodge genus `h^(1,0)` with the first Betti
  number, and ModularForms Layer 10B(v) compares its Čech genus `dim H¹(X, 𝒪)` with Layer 5 item
  1's genus; neither comparison is an input here.
- **The modular-forms roadmap owns modular forms and functions before descent, including the
  normalized level-one `j`-function, modular invariance, q-expansion, and exact elliptic orders;
  it also owns congruence-subgroup arithmetic, analytic Riemann--Roch, automorphy sheaves, and
  dimension formulas.** It consumes this roadmap's quotient, compactification, local-multiplicity,
  degree, divisor-pullback, degree-one, genus and Riemann--Hurwitz declarations. This roadmap does
  not reconstruct modular forms, cohomology, or Riemann--Roch in its level-one application.
- **The algebraic-curves roadmap owns algebraic curves and their function fields.**  This
  roadmap constructs analytic Riemann surfaces.  It proves no GAGA equivalence and creates no
  algebraic curve by declaration.
- **TeichmullerGeometry, a downstream consumer, owns marked Teichmüller space and its
  generic-locus theorems.** It consumes the layers listed under Scope, and this roadmap consumes
  none of its layers.
- **ArithmeticFuchsianGroups, a downstream consumer, owns arithmetic Fuchsian lattices, their
  fixed-signature finiteness, commensurators and the applications built on them.** It consumes the
  layers listed under Scope, and this roadmap consumes none of its layers.

### Implemented in Tau Ceti

Much of Layers 0–6 is implemented in the pinned Tau Ceti, and the layers below cite those
declarations rather than restate them. The effective action is `UpperHalfPlane.instMulActionPSL2`
with `UpperHalfPlane.pslMk_smul`, `UpperHalfPlane.toPGL_smul` and `FaithfulSMul PSL(2, ℝ) ℍ`
(`Analysis/Complex/UpperHalfPlane/PSL/Action.lean`), with
continuity and isometry in `UpperHalfPlane/ProperAction.lean` and holomorphy in
`UpperHalfPlane/PSL/Manifold.lean`; the
boundary action is `MulAction PSL(2, K) (OnePoint K)` with
`Matrix.ProjectiveSpecialLinearGroup.toPGL_smul`
(`Topology/Compactification/OnePoint/ProjectiveLine.lean`). Proper discontinuity of a discrete
subgroup is the instance of `Analysis/Complex/Fuchsian/ProperAction.lean`, the free locus is
`TauCeti.freeLocus` (`Topology/Algebra/GroupAction/FreeLocus.lean`), and descent of invariant
holomorphic and meromorphic functions is `Subgroup.existsUnique_mdifferentiable_quotientMk`
(`Fuchsian/Descent.lean`) and `Subgroup.existsUnique_meromorphicAt_quotientMk`
(`Fuchsian/MeromorphicDescent.lean`). The coarse quotient is a Riemann surface by
`Subgroup.instIsManifoldOrbitRelQuotient` (`Fuchsian/CoarseQuotient.lean`). Cusps are
`Subgroup.IsCuspPoint`, `Subgroup.BoundaryOrbit`, `Subgroup.IsCuspOrbit` and `Subgroup.CuspOrbit`
(`Fuchsian/Cusp/Basic.lean`); normalized cusp data are `Subgroup.CuspDatum` with
`Subgroup.CuspDatum.mem_stabilizer_iff_conj` (`Fuchsian/Cusp/Datum.lean`); the q-coordinate is
`TauCeti.Subgroup.CuspDatum.coordinate` with `TauCeti.Subgroup.CuspDatum.coordinate_smul`
(`Fuchsian/Cusp/Coordinate.lean`); and the change of scaling is `TauCeti.cuspDatum_generator_eq`,
`TauCeti.cuspDatum_width_eq_mul` and `TauCeti.cuspDatum_coordinate_eq`
(`Fuchsian/Cusp/ChangeScaling.lean`). The typed triangle parameter is `TauCeti.TriangleOrder` with
`TauCeti.TriangleOrder.reciprocal` (`Fuchsian/TriangleOrder/Basic.lean`), and every hyperbolic
triple is realised by `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup`
(`Fuchsian/TriangleOrder/Group.lean`). Covolume and cofiniteness are `MeasureTheory.covolume`,
`Subgroup.exists_isFundamentalDomain` and `Subgroup.IsCofinite` (`Fuchsian/Covolume.lean`).
Poincaré's polygon theorem is
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.relatorQuotientTo_bijective_of_isParabolic`
(`Fuchsian/Polygon/Poincare.lean`) and its converse
`Subgroup.IsCofinite.exists_sidePairing_relatorQuotientTo_bijective`
(`Fuchsian/DirichletDomain/Cofinite.lean`). The compactified carrier is
`Subgroup.CompactifiedQuotient` with `Subgroup.CompactifiedQuotient.equivSum`
(`Fuchsian/Compactification/Basic.lean`), its atlas `Subgroup.CompactifiedQuotient.instChartedSpace`
and analytic structure `Subgroup.CompactifiedQuotient.instIsManifold`
(`Fuchsian/Compactification/Manifold.lean`), and compactness for a cofinite group
`Subgroup.IsCofinite.compactSpace_compactifiedQuotient`. The degree theory of finite holomorphic
maps is `TauCeti.RiemannSurface.FiniteHolomorphicMap`, `TauCeti.RiemannSurface.localMultiplicity`,
`TauCeti.RiemannSurface.degree`, `TauCeti.RiemannSurface.degree_eq_fiber_sum`,
`TauCeti.RiemannSurface.degree_comp` and `TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`
(`Analysis/Complex/RiemannSurface/Degree.lean`), `TauCeti.RiemannSurface.divisorPullback`
(`RiemannSurface/Divisor/Basic.lean`) and `TauCeti.RiemannSurface.ramificationDegree`
(`RiemannSurface/Ramification.lean`). The level-one curve is identified with the Riemann sphere by
`TauCeti.ModularGroup.jBiholomorph` (`Fuchsian/LevelOne/Sphere.lean`).

`Suggested.lean` keeps two names for the modular-forms roadmap, whose `Suggested.lean` imports this
roadmap's: `CompactifiedQuotient`, the roadmap's name for `Subgroup.CompactifiedQuotient`, and
`compactifiedChartedSpace`, its atlas. It also exports the native degree API and this roadmap's
`genus` and `riemannHurwitz` under the short names `RiemannSurface.*` that the modular-forms
roadmap uses. All other names in this README that begin with `TauCeti`, `Subgroup`,
`UpperHalfPlane` or `MeasureTheory` are pinned library declarations.

The import graph is strict:

```text
TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
TauCeti.Analysis.Complex.RiemannSurface.{Degree, Ramification, Divisor, Branch}
    -> Fuchsian Layer 5 genus and Riemann–Hurwitz
        |-> Fuchsian compactification applications
        `-> TauCeti.Analysis.Complex.ModularForms.DimensionFormula

TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs
    -> TauCeti.Analysis.Complex.Fuchsian.LevelOne

Fuchsian L0/L1/L2.1/L4/L4a -> downstream consumer TeichmullerGeometry
Fuchsian L0/L2/L4/L4a/L5 -> downstream consumer ArithmeticFuchsianGroups
```

The Riemann-surface degree modules import neither `ModularForms` nor analytic Riemann--Roch,
automorphy-sheaf, or dimension-formula modules. The separate level-one application consumes the
lower `TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs` module, which contains only the
normalized `j`-function, its invariance, q-expansion, and elliptic orders.  The module boundaries
make the dependency graph acyclic.

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
  `GL(2,ℝ)`-invariance theorems. Hyperbolic distance is Mathlib's `dist` on `UpperHalfPlane`
  (`UpperHalfPlane.dist_eq`), the distance of the curvature `−1` metric `|dz|/y`, so that
  `dist(i, 2i) = log 2`. The covolume of a discrete `Γ` is `MeasureTheory.covolume Γ ℍ`, the area of
  any measurable fundamental domain, and `Γ` is cofinite (`Subgroup.IsCofinite`) exactly when it is
  discrete of finite covolume.
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
- A finite holomorphic map's local multiplicity, degree, divisor pullback and degree-one theorem
  are Tau Ceti's `TauCeti.RiemannSurface` declarations listed under Ownership; degree is the
  fibre sum of local multiplicities, not a field of a map record. Its ramification degree is
  `R(f) = Σₓ (eₓ − 1)`, so the double cover `z ↦ z²` of the sphere has `R = 2`.
- Genus is topological: `genus X = (2 − χ(X))/2` for Tau Ceti's finite-CW Euler characteristic
  `TauCeti.eulerChar`, never the analytic `dim H¹(X, 𝒪)` of ModularForms Layer 10B.
- `P^1` is the Riemann sphere `OnePoint ℂ` of ComplexManifolds Milestone 3.  A quotient becomes
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
  finiteness, and the `GL(2,ℝ)` invariant-measure instance, and Tau Ceti's Poincaré metric
  `TauCeti.UpperHalfPlane.poincareRiemannianMetric` with `UpperHalfPlane.riemannianVolume_eq_volume`
  (`Analysis/Complex/UpperHalfPlane/PoincareMetric.lean`).
- RiemannianGeometry R4 item 7: the half-space model of hyperbolic space and its isometries.
- ComplexManifolds Milestones 1–6, as listed under Ownership.
- AlgebraicTopology Stage 6 items 4 and 5 and Stage 8 item 7, as listed under Ownership.
- The Tau Ceti declarations listed under Ownership.
- The universal-covers roadmap's covering and deck-transformation results.
- The conformal-mapping roadmap's Riemann mapping and Schwarz-reflection results.
- The modular-forms roadmap's normalized level-one `j`, its invariance, q-expansion, and exact
  orders at elliptic points.

## Layer 0: the effective projective Möbius action

1. Equip `PSL(2,R)` with the quotient topology from `SL(2,R)` and prove it is a Hausdorff
   second-countable topological group.  Relate the quotient map to Mathlib's algebraic quotient
   by the center.
2. Construct the canonical homomorphism `PSL(2,R) → PGL(2,R)` and restrict Mathlib's existing
   projective Möbius action along it. Mathlib's `UpperHalfPlane.glAction` lets `A = [[a, b], [c, d]]`
   act by `z ↦ (az + b)/(cz + d)` when `det A > 0` and by `z ↦ (a conj z + b)/(c conj z + d)` when
   `det A < 0`, descends to `MulAction PGL(2, ℝ) ℍ`, and is faithful there
   (`FaithfulSMul PGL(2, ℝ) ℍ`, `Mathlib/Analysis/Complex/UpperHalfPlane/FixedPoints.lean`); Tau
   Ceti's `UpperHalfPlane.toPGL_smul` proves that the restriction is the `PSL(2,R)` action. Prove
   compatibility with the `SL(2,R)` action, faithfulness, joint continuity of
   `PSL(2,R) × UpperHalfPlane → UpperHalfPlane`, and that every element acts by a biholomorphism.
   Prove that every element of `GL(2,ℝ)` acts by an isometry of `dist`: a positive-determinant
   element acts as an element of `SL(2,ℝ)`, an isometry by Mathlib's
   `IsIsometricSMul SL(2, ℝ) ℍ`, and a negative-determinant element is such an element composed
   with `z ↦ −conj z`, which preserves `dist` by `UpperHalfPlane.dist_eq`; negative-determinant
   elements reverse orientation and are antiholomorphic. Do not export an
   unrelated permutation action as a second public action.
   *Needs:* Mathlib `UpperHalfPlane.glAction`, `UpperHalfPlane.dist_eq`, `IsIsometricSMul SL(2, ℝ) ℍ`;
   Tau Ceti `UpperHalfPlane.toPGL_smul`; item 1.
   **Checks.**
   - `diag(1, −1)` has determinant `−1` and acts by `z ↦ −conj z`, sending `1 + i` to `−1 + i`
     and fixing `i`; the model without conjugation would send `1 + i` to `−1 − i ∉ ℍ`.
   - `diag(2, 1)` acts by `z ↦ 2z`, as the class of `diag(√2, 1/√2)` in `PSL(2,ℝ)`, and `2·I`
     acts trivially, so the kernel on `GL(2,ℝ)` contains the scalars and nothing else.
   - `diag(1, −1)` preserves `dist(1 + i, 2 + i) = dist(−1 + i, −2 + i)`, both equal to
     `2 arsinh(1/2)`; a map conjugating without the sign, `z ↦ conj z`, leaves `ℍ`.
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

1. **L2.1: the hyperbolic metric, area and covolume.** Tau Ceti's
   `TauCeti.UpperHalfPlane.poincareRiemannianMetric` is the Riemannian metric
   `(Re v Re w + Im v Im w)/y²` on `UpperHalfPlane`, and `UpperHalfPlane.riemannianVolume_eq_volume`
   identifies its Riemannian volume with Mathlib's `volume`. Prove that its Riemannian distance is
   Mathlib's `dist`: a vertical segment from `iy₁` to `iy₂` has length `|log(y₂/y₁)|`, every curve
   joining them is at least as long because `|d log y| ≤ ds`, the isometric `PSL(2,ℝ)` action moves
   an arbitrary pair to a vertical pair, and the resulting
   `arcosh(1 + ((x − x′)² + (y − y′)²)/(2yy′))` agrees with `UpperHalfPlane.dist_eq`, including the
   coincident-point case (Katok, §1.2). Identify this metric, through `x + iy ↦ (x, y)`, with the
   dimension-two half-space model of RiemannianGeometry R4 item 7, which transports completeness and
   curvature `−1`; the `PSL(2,ℝ)` and `PGL(2,ℝ)` actions are then Riemannian isometries by Layer 0
   item 2. Covolume through measurable fundamental domains, its independence of the domain, and
   cofiniteness are Tau Ceti's `Subgroup.exists_isFundamentalDomain`, `MeasureTheory.covolume` and
   `Subgroup.IsCofinite` (`Fuchsian/Covolume.lean`), and the Gauss–Bonnet formula for finite
   hyperbolic polygons is `TauCeti.UpperHalfPlane.volume_triangle`
   (`Analysis/Complex/UpperHalfPlane/Triangle.lean`) and
   `TauCeti.UpperHalfPlane.CompactConvexPolygon.volume_carrier` (`UpperHalfPlane/Polygon/GaussBonnet.lean`).
   *Needs:* Tau Ceti `TauCeti.UpperHalfPlane.poincareRiemannianMetric`,
   `UpperHalfPlane.riemannianVolume_eq_volume`; Mathlib `UpperHalfPlane.dist_eq`; RiemannianGeometry
   R4 item 7; Layer 0 item 2.
   **Checks.**
   - `dist(i, 2i) = log 2`: the vertical segment has length `∫₁² dy/y = log 2`, and
     `2 arsinh(1/(2√2)) = 2 log √2 = log 2`; the disc-model normalisation `2|dz|/(1 − |z|²)` read on
     `ℍ` as `2|dz|/y` would give `2 log 2`.
   - The ideal triangle with vertices `0`, `1`, `∞` has area `π`, the angular defect `π − 0`, while
     the region `{|x| ≤ 1/2, |z| ≥ 1}` has area `π/3`, the covolume of `PSL(2,ℤ)`.
   - `z ↦ −conj z` fixes the imaginary axis pointwise, so it is a reflection: an isometry that
     reverses orientation and is induced by no element of `PSL(2,ℝ)`, since a nontrivial element of
     `PSL(2,ℝ)` fixes at most one point of `ℍ`.
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
   `2*pi` and the effective `PSL` convention. Its form for a side-paired fundamental polygon is
   Tau Ceti's `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul`
   (`Fuchsian/Polygon/Area.lean`) and its level-one case
   `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul`; its intrinsic form, with the
   genus of `CompactifiedQuotient Γ`, is Layer 5 item 7's `covolume_eq_two_pi_mul_signature`.

No step identifies the carrier with `P^1`, a torus, or another classified surface by definition.

**Source spine:** Katok, Chapter 4; Diamond--Shurman, §§2.4--2.5; Forster, §§18--19.

## Layer 5: compact-surface degree theory and Fuchsian applications

1. **Topological genus.** For a compact connected Riemann surface `X`, ComplexManifolds Milestone 1
   gives the underlying real smooth surface, modelled on `EuclideanSpace ℝ (Fin 2)`, and
   AlgebraicTopology Stage 8 item 7 gives it finite CW type, so that Tau Ceti's `TauCeti.eulerChar X`
   is defined. Define `genus X = (2 − χ(X))/2`, truncated at `0` (`genus`, on any space of finite
   CW type), and prove `eulerChar_eq_two_sub_two_mul_genus`: `χ(X) = 2 − 2 genus X`, the Euler
   number of a compact Riemann surface (Miranda, Chapter II §4). Route:
   Euler–Poincaré over `ℚ` (`TauCeti.eulerChar_eq_finsum_finrank_singularHomology`) writes
   `χ = b₀ − b₁ + b₂`; connectedness gives `b₀ = 1`; ComplexManifolds Milestone 2 orients `X`, and
   AlgebraicTopology Stage 6 item 4's Poincaré duality gives `b₂ = b₀ = 1` and `bᵢ = 0` for
   `i > 2`; Stage 6 item 5's intersection pairing on `H₁(X; ℚ)` is nondegenerate and alternating,
   so `b₁` is even. ComplexKahlerGeometry K7's `b₁ = 2 h^(1,0)` is another route. No analytic genus and no Riemann–Roch enters.
   *Needs:* ComplexManifolds Milestones 1 and 2; AlgebraicTopology Stage 6 items 4 and 5 and
   Stage 8 item 7; Tau Ceti `TauCeti.eulerChar`, `TauCeti.eulerChar_eq_finsum_finrank_singularHomology`.
   **Checks.**
   - The level-one curve `X(1) ≃ P¹` has `χ = 2` (`TauCeti.ModularGroup.eulerChar_compactifiedQuotient`),
     so `genus = 0`.
   - A complex torus `ℂ/Λ` has `χ = 0` and genus `1`; the definition `g = 2 − χ`, without the
     halving, would give `2`.
   - A compact surface of genus `2` has `χ = −2` and `genus = 2`; the definition `g = −χ/2`, which
     agrees on the torus, would give `1`.
   - The real projective plane has `χ = 1`, and `genus` returns `0` (integer division) while
     `χ = 2 − 2 · 0` fails: the identity needs the orientable surface underlying a complex
     structure, which `RP²` does not carry.
2. **Degree theory of finite holomorphic maps.** This item is implemented in Tau Ceti: the carrier
   `TauCeti.RiemannSurface.FiniteHolomorphicMap`, local multiplicity
   `TauCeti.RiemannSurface.localMultiplicity`, the fibre-independent degree
   `TauCeti.RiemannSurface.degree` with `TauCeti.RiemannSurface.degree_eq_fiber_sum`,
   multiplicativity `TauCeti.RiemannSurface.degree_comp`, the degree-one biholomorphism
   `TauCeti.RiemannSurface.biholomorphOfDegreeEqOne` with
   `TauCeti.RiemannSurface.biholomorphOfDegreeEqOne_toFun`, divisor pullback
   `TauCeti.RiemannSurface.divisorPullback` and the ramification degree
   `TauCeti.RiemannSurface.ramificationDegree`. `Suggested.lean` exports them, with `genus` and
   `riemannHurwitz`, under the short names `RiemannSurface.*` used by ModularForms Layer 10B.
3. **The branched-cover formula and Riemann–Hurwitz.** The branched-cover formula
   `χ(X) = deg f · χ(Y) − R(f)` for a finite holomorphic map `f : X → Y` of compact connected
   Riemann surfaces is Tau Ceti's
   `TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`,
   given finite CW type of `X`, `Y` and of `Y` minus the finitely many branch values, which
   AlgebraicTopology Stage 8 item 7 supplies with marked points. Prove `riemannHurwitz`:
   `2 genus X − 2 = deg f · (2 genus Y − 2) + R(f)`, by rewriting both Euler characteristics with
   item 1 (Forster, §17; Miranda, Chapter II §4). No canonical divisor and no Riemann–Roch enters.
   *Needs:* item 1; Tau Ceti
   `TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`;
   AlgebraicTopology Stage 8 item 7.
   **Checks.**
   - `z ↦ z²` on `P¹`: degree `2`, ramified at `0` and `∞`, `R = 2`, and `−2 = 2 · (−2) + 2`; the
     sign error `2g − 2 = d(2g′ − 2) − R` would give `−2 = −6`.
   - The Weierstrass function of a lattice, `ℂ/Λ → P¹`: degree `2`, four ramification points,
     `0 = 2 · (−2) + 4`.
   - An unramified double cover of a genus-`2` surface by a genus-`3` surface: `4 = 2 · 2 + 0`; a
     genus that did not depend on the surface would make the two sides `2c − 2` and `2(2c − 2)`,
     unequal unless `c = 1`.
4. Prove that a `Γ`-invariant holomorphic or meromorphic function descends uniquely to the coarse
   quotient, and combine the elliptic local-order formula and cusp q-expansion criterion to extend
   it to the compactification. This is implemented in Tau Ceti as
   `Subgroup.existsUnique_mdifferentiable_quotientMk`, `Subgroup.existsUnique_meromorphicAt_quotientMk`
   and, across cusps, `TauCeti.Fuchsian.exists_meromorphicAt_comp_ofQuotient`
   (`Fuchsian/Compactification/Extension.lean`).
5. Apply the degree theory of item 2 to the compactified quotient map `X(Γ′) → X(Γ)` of a
   finite-index inclusion `Γ′ ≤ Γ` of discrete groups. Its degree is the index, Tau Ceti's
   `Subgroup.degree_compactifiedQuotientMap` (`Fuchsian/Compactification/Degree.lean`), and its
   local multiplicities are the cusp-width ratios at cusps and the stabilizer indices at elliptic
   points (Layer 4 item 4). As a finite holomorphic map it is Tau Ceti's
   `TauCeti.Fuchsian.compactifiedQuotientFiniteHolomorphicMap`
   (`Fuchsian/Compactification/FiniteHolomorphicMap.lean`). Reprove neither generic fibre finiteness
   nor independence of the degree sum.
6. Derive the Fuchsian Riemann–Hurwitz formula and the multiplicativity of the orbifold Euler
   characteristic, with the effective-action and orientation conventions explicit: for cofinite
   `Γ′ ≤ Γ` of index `d`, `2g(Γ′) − 2 = d (2g(Γ) − 2) + Σ_P (e_P − 1)` over the points `P` of
   `X(Γ′)`, from item 3 and item 5, and `χ_orb(Γ′) = d χ_orb(Γ)` for
   `χ_orb = 2 − 2g − Σᵢ (1 − 1/mᵢ) − c`, from item 7 and Tau Ceti's
   `MeasureTheory.covolume_eq_card_mul_covolume`.
   *Needs:* items 3, 5 and 7.
   **Checks.**
   - The image of `Γ(2)` in `PSL(2,ℤ)` has index `6` and `X(2)` has genus `0` with three cusps of
     width `2`: over the cusp `R` gains `3`, over `i` three points of index `2` give `3`, over `ρ`
     two points of index `3` give `4`, and `−2 = 6 · (−2) + 10`.
   - `χ_orb(PSL(2,ℤ)) = 2 − (1/2 + 2/3) − 1 = −1/6` and `χ_orb(Γ(2)) = 2 − 3 = −1 = 6 · (−1/6)`.
7. **The genus bridge and the orbifold area formula.** For a cofinite `Γ`, prove that the genus
   read off a side-paired fundamental polygon (Layer 2 item 5) equals `genus (CompactifiedQuotient Γ)`
   of item 1: subdivide the compactified polygon so that every elliptic cycle and every cusp orbit
   is a vertex, extending the incident sectors at cusps through the filled-disc charts; this is a
   finite cell decomposition of `X(Γ)` whose cell count is `2 − 2h` for the polygon genus `h`.
   Combined with the polygon area formula of Layer 4 item 5 this proves
   `covolume_eq_two_pi_mul_signature`:
   `covolume Γ = 2π (2g − 2 + Σₑ (1 − 1/mₑ) + c)`, where `g = genus (CompactifiedQuotient Γ)`, `e`
   runs over the elliptic orbits `Subgroup.ellipticOrbits` with stabilizer orders
   `mₑ = TauCeti.cardStabilizerOnOrbit e`, and `c = Nat.card Γ.CuspOrbit` (Beardon, §10.4; Katok,
   §4.3). Keep the cell count `χ(X(Γ)) = 2 − 2g` distinct from the orbifold Euler characteristic
   `χ_orb = 2 − 2g − Σₑ (1 − 1/mₑ) − c = −covolume Γ / 2π`.
   *Needs:* item 1; Layer 2 items 4 and 5; Layer 4; Tau Ceti
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul`,
   `Subgroup.IsCofinite.finite_ellipticOrbits`, `Subgroup.IsCofinite.finite_cuspOrbit`.
   **Checks.**
   - `PSL(2,ℤ)`: genus `0`, elliptic orders `2` and `3`, one cusp, and `2π(−2 + 1/2 + 2/3 + 1) = π/3`,
     the pinned `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`; dropping the cusp term gives the
     negative bracket `−5/6`.
   - A torsion-free cocompact group of genus `2` has covolume `4π = −2π χ`.
   - The `(2, 3, 7)` triangle group has covolume `π/21`; the formula with `χ_orb` in place of
     `−χ_orb` would give a negative area.

**Source spine:** Forster, §§10, 17, and 19; Miranda, Chapter II §4 and Chapter III §§3--4;
Farkas--Kra, Chapter II §4; Beardon, §10.4; Katok, §4.3.

## Layer 4a: minimum area of compact orientable hyperbolic orbifolds

A cofinite Fuchsian group `Γ` of signature `(g; m₁, …, m_r; c)`, with elliptic orders `mᵢ ≥ 2`
and `c` cusps, has covolume `2π δ` for the deficit `δ = 2g − 2 + Σᵢ (1 − 1/mᵢ) + c`, which is
positive (Layer 5 item 7). This layer owns the two minima of the covolume and their equality cases.

1. **The minimum `π/21`.** Prove `pi_div_twentyOne_le_covolume`: every cofinite Fuchsian group has
   covolume at least `π/21` (Siegel 1945). Without cusps, `δ ≥ 1/42` is Tau Ceti's
   `TauCeti.one_div_forty_two_le_hyperbolic_deficit` (`TauCeti/Data/Rat/BranchDeficit.lean`),
   applied to `g` and the multiset of elliptic orders; with a cusp, item 2 gives the larger bound
   `π/3`. Prove the equality case `covolume_eq_pi_div_twentyOne_iff`: the covolume is `π/21` exactly
   for signature `(0; 2, 3, 7)`, that is genus zero, no cusp and one elliptic orbit of each order
   `2`, `3` and `7`. The value at `(0; 2, 3, 7)` is Tau Ceti's
   `TauCeti.hyperbolic_deficit_two_three_seven`. Uniqueness, which the Tau Ceti lemma does not
   state, is the following case analysis. If `g ≥ 2` then `δ ≥ 2`; if `g = 1`, positivity needs
   `r ≥ 1` and `δ ≥ 1/2`. For `g = 0` positivity needs `r ≥ 3`. For `r ≥ 5`,
   `δ ≥ r/2 − 2 ≥ 1/2`. For `r = 4` the all-order-two signature has `δ = 0`, and otherwise some
   `mᵢ ≥ 3`, so `δ ≥ 1/6`. For `r = 3` sort `m₁ ≤ m₂ ≤ m₃`: `(2, 2, m₃)` has `δ < 0`; `(2, 3, m₃)`
   has `δ = 1/6 − 1/m₃`, positive exactly for `m₃ ≥ 7` and equal to `1/42` only at `m₃ = 7`;
   `(2, 4, m₃)` needs `m₃ ≥ 5` and has `δ ≥ 1/20`; `(2, m₂, m₃)` with `m₂ ≥ 5` has `δ ≥ 1/10`; and
   `m₁ ≥ 3` has `δ ≥ 1/12`, the case `(3, 3, 3)` having `δ = 0`.
   *Needs:* Layer 5 item 7; Tau Ceti `TauCeti.one_div_forty_two_le_hyperbolic_deficit`,
   `TauCeti.hyperbolic_deficit_two_three_seven`, `Subgroup.IsCofinite.finite_ellipticOrbits`,
   `Subgroup.IsCofinite.finite_cuspOrbit`.
   **Checks.**
   - `(0; 2, 3, 7)`: `δ = −2 + 1/2 + 2/3 + 6/7 = 1/42`, covolume `π/21`; a bound `π/42`, from
     forgetting the factor `2` in `2π δ`, would not be attained by any group.
   - `(0; 2, 3, 8)`: `δ = 1/24`, covolume `π/12 > π/21`; `(0; 2, 3, 6)` has `δ = 0` and is the
     Euclidean triangle group, not a cofinite Fuchsian group.
   - `(0; 2, 2, 2, 3)`: `δ = 1/6`; `(1; 2)`: `δ = 1/2`; `(2; −)`: `δ = 2`, covolume `4π`, the
     Gauss–Bonnet value `−2π χ` for `χ = −2`.
   - `(0; 2, 2, 2, 2)` has `δ = 0`: the bound is false for nonpositive deficit, and the hypothesis
     `Γ.IsCofinite` is what excludes it.
2. **The minimum `π/3` with a cusp.** Prove `minimum_area_finite_area_orbifold`: a cofinite
   Fuchsian group with at least one cusp has covolume at least `π/3`. Prove the equality case
   `covolume_eq_pi_div_three_iff`: the covolume is `π/3` exactly for signature `(0; 2, 3; 1)`, that
   of `PSL(2,ℤ)`, whose covolume is Tau Ceti's `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`.
   Tau Ceti's deficit lemma has no cusp term, so the case analysis is owned here:

   | Signature range | Deficit and area |
   |---|---|
   | `g ≥ 2` | `δ ≥ 3`, area at least `6π` |
   | `g = 1` | `δ ≥ 1`, area at least `2π` |
   | `g = 0, c ≥ 3` | `δ ≥ 1`, area at least `2π` |
   | `g = 0, c = 2` | `r = 0` gives `δ = 0`; for `r ≥ 1`, `δ ≥ 1/2`, area at least `π` |
   | `g = 0, c = 1, r ≤ 1` | `δ < 0` |
   | `g = 0, c = 1, r = 2` | sort `m₁ ≤ m₂`; `(2, 2)` gives `δ = 0`, `(2, 3)` the minimum `δ = 1/6`, and every other pair `δ ≥ 1/4` |
   | `g = 0, c = 1, r ≥ 3` | `δ ≥ 1/2`, area at least `π` |

   *Needs:* Layer 5 item 7; Tau Ceti `Subgroup.IsCofinite.finite_ellipticOrbits`,
   `Subgroup.IsCofinite.finite_cuspOrbit`, `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`.
   **Checks.**
   - `(0; 2, 3; 1)`: `δ = −2 + 1/2 + 2/3 + 1 = 1/6`, covolume `π/3`, the pinned covolume of
     `PSL(2,ℤ)`.
   - `(0; 2; 2)`, the image of `Γ₀(2)` of index `3`: `δ = 1/2`, covolume `π = 3 · π/3`.
   - `(0; −; 3)`, the image of `Γ(2)` of index `6`: `δ = 1`, covolume `2π = 6 · π/3`; and
     `(1; −; 1)`, the commutator subgroup of index `6`, also `2π`.
   - `(0; 2, 2; 1)` has `δ = 0`, and the compact `(0; 2, 3, 7)` has covolume `π/21 < π/3`: the
     bound needs the cusp.

The downstream ArithmeticFuchsianGroups roadmap consumes both minima for normalizer indices, and
the downstream TeichmullerGeometry Layer 10 consumes the equality case of item 1.

**Source spine:** Siegel 1945; Beardon, §10.4; Katok, §4.3.

## Layer 6: the level-one modular quotient, in construction order

This layer consumes the modular-forms roadmap's normalized `j`-function, modular invariance,
q-expansion, and exact elliptic orders.

1. Apply Layers 0--4 to the effective level-one modular group. Construct its coarse quotient,
   elliptic charts, unique cusp, and compact Riemann surface `X(1)`. Prove its signature from the
   standard fundamental polygon. The genus `RiemannSurface.genus X(1) = 0` expected by
   ModularForms 10B(vi) follows from Layer 5 item 1's definition and Tau Ceti's
   `TauCeti.ModularGroup.eulerChar_compactifiedQuotient`, `χ(X(1)) = 2`.
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
| L2 polygons and presentations | L0, conformal mapping, RiemannianGeometry R4 item 7 | L3--L4, L6 |
| L3 cusps and q-coordinates | L0, L2 | L4--L6 |
| L4 compactification | L1--L3 | L5--L6 |
| L5 degree theory and applications | ComplexManifolds Milestones 1--2, AlgebraicTopology Stages 6 and 8, Tau Ceti Euler characteristic and Riemann-surface degree, L2, L4 | L4a, L6, modular forms |
| L6 level-one example | L0--L5, modular forms | normalized `X(1) ≃ P^1` |
| L4a minimal areas | L5 item 7, Tau Ceti deficit bound | area ≥ `π/21`; area ≥ `π/3` with a cusp; equality cases |

The dependency order follows the table. No row depends on TeichmullerGeometry or
ArithmeticFuchsianGroups, which consume this roadmap downstream. L1 and L2 can proceed in parallel
after L0. The local q-coordinate calculation in L3 can proceed while the global polygon results are
completed. Layer 5 items 1--3 can proceed in parallel with Layers 0--4; items 4--7 begin after
Layer 4, and Layer 4a follows Layer 5 item 7. Matching Mathlib APIs
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
- L2.1 identifies the Riemannian distance of the Poincaré metric with Mathlib's `dist`, so that
  `dist(i, 2i) = log 2`; no second invariant measure is constructed.
- A finite-sided cofinite polygon produces a compact surface after one point is adjoined for each
  cusp orbit, with the carrier visibly the coarse quotient plus cusp-orbit subtype and compactness
  proved from a truncated fundamental polygon.
- The triangle-group theorem uses the typed finite-or-cusp parameter and derives the presentation
  and signature from side pairings.
- Invariant functions descend through `MulAction.orbitRel.Quotient`; no choice-based quotient
  section occurs in the public construction.
- Local orders downstairs multiply by elliptic stabilizer order on pullback. Cusp orders use the
  q-coordinate and width from a chosen compatible cusp datum and are proved independent of it.
- Genus is topological, `χ = 2 − 2g` on compact connected Riemann surfaces, and Riemann–Hurwitz
  in genus form follows from Tau Ceti's branched-cover Euler-characteristic formula without
  Riemann–Roch; `z ↦ z²` on `P¹` checks it with `R = 2`.
- The level-one compact quotient is a compact Riemann surface before the normalized `j`-function
  is descended.  The proof of `X(1) ≃ P^1` passes through the theorem that the descended map has
  degree one.
- A structure whose fields assert compactness, the orbifold signature, degree, or the final
  biholomorphism does not satisfy the roadmap.
- L4a proves the minimum `π/21` from the area formula of Layer 5 item 7 and handles all genus and
  cone-count/order cases; equality is exactly `(0;2,3,7)`. With a cusp the minimum is `π/3`, with
  equality exactly `(0;2,3;1)`.

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
  American Mathematical Society, 1995, Chapter II §4 and Chapter III.
- Jean-Pierre Serre, *A Course in Arithmetic*, Graduate Texts in Mathematics 7,
  Springer, 1973, Chapter VII.
- Carl Ludwig Siegel, *Some remarks on discontinuous groups*, Annals of Mathematics 46 (1945),
  708–718, doi:10.2307/1969206 (the minimal covolume `π/21`).
- John Stillwell, *Geometry of Surfaces*, Universitext, Springer, 1992, Chapter 5.
