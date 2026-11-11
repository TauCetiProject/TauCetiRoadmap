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
Layer 0 items 1–3, Layer 2 items 1 and 3–5, Layer 4 item 5, Layer 4a and Layer 5 items 5–7,
and no layer here consumes any layer of it. General Kleinian groups, higher-dimensional locally
symmetric spaces, automorphic representations, and the classification of all two-dimensional
orbifolds remain outside this roadmap. Congruence-subgroup arithmetic, Hecke operators,
modular-form dimension formulas, and the construction and q-expansion of modular forms remain with
ModularForms, by the sections listed under Ownership and dependencies.

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
10. `PSL(2,ℝ)` is second countable (Layer 0 item 1). Every element of `GL(2,ℝ)` acts on `ℍ` by an
    isometry of `dist` (Layer 0 item 2) and by a Riemannian isometry of the Poincaré metric; the
    Riemannian distance of the Poincaré metric is Mathlib's `dist`
    (`isRiemannianManifold_upperHalfPlane`); and `x + iy ↦ (x, y)` is a Riemannian isometry onto
    `TauCeti.UpperHalfSpace ℝ` and an isometry `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ`, which carries
    curvature `−1` to the Poincaré metric, whose distance is complete (Layer 2 item 1).

## Ownership and dependencies

- **Mathlib owns the upper half-plane and matrix action.**  Consume `UpperHalfPlane`,
  `SL(2,R)`, the Möbius action, fixed-point classification, continuous and proper actions, and
  the theorem that a discrete subgroup of `SL(2,R)` acts properly discontinuously. Mathlib's
  `UpperHalfPlane.glAction` (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`) is the action of
  `GL(2,ℝ)`, through complex conjugation `UpperHalfPlane.σ g` when `det g < 0`; the same file
  descends it to `MulAction PGL(2, ℝ) ℍ`, `FixedPoints.lean` proves `FaithfulSMul PGL(2, ℝ) ℍ`, and
  `Metric.lean` proves `IsIsometricSMul SL(2, ℝ) ℍ`.
- **Mathlib and Tau Ceti supply the effective projective action; this roadmap owns its
  remaining facts.**  Mathlib defines `PSL(2,R)` as the quotient of `SL(2,R)` by its centre, so
  its quotient topology, topological-group structure and Hausdorffness are Mathlib's
  `QuotientGroup.instTopologicalSpace`, `QuotientGroup.instIsTopologicalGroup` and
  `QuotientGroup.instT2Space`; Tau Ceti factors the `SL(2,R)` action through the centre and proves
  it faithful, continuous and holomorphic (Layer 0 items 2–5). This roadmap owns second
  countability of `PSL(2,ℝ)` (Layer 0 item 1) and the isometry of the negative-determinant
  elements of `GL(2,ℝ)` (Layer 0 item 2). A subgroup of `PSL(2,R)` is the public Fuchsian-group
  input; no bespoke structure repeats a subgroup, topology, action, and discreteness fields.
- **ComplexManifolds Milestones 1, 2 and 4–6** supply Milestone 1's restriction of scalars from
  a complex to the underlying real smooth surface, Milestone 2's canonical orientation of that
  surface, Milestone 4's free properly discontinuous holomorphic quotient, local biholomorphism and
  invariant-map descent, Milestone 5's compatible atlas gluing, and Milestone 6's Hausdorffness,
  second-countability and proper-map comparisons. Apply Milestone 4 on the free locus and supply
  the elliptic and cusp charts beyond its free-action hypotheses; use Milestones 5–6 to glue and
  separate those charts.
- **Tau Ceti supplies the Riemann sphere.** The two-chart atlas on `OnePoint ℂ`, with charts
  `z ↦ z` away from `∞` and `z ↦ z⁻¹` away from `0`, is Tau Ceti's `OnePoint.instChartedSpace`,
  analytic by `OnePoint.instIsManifold`
  (`TauCeti/Geometry/Manifold/Instances/OnePoint/Basic.lean`); ComplexManifolds Milestone 3
  consumes the same instance.
- **UniversalCovers (completed) owns universal covers and deck groups (Stages 0–1), the lifting
  criterion and the correspondence between covers and subgroups of `π₁` (Stage 2), and induced
  maps on higher homotopy groups (Stage 3).** No layer here consumes them: the covering statements
  of this roadmap, that the projection of the free locus is a covering map (Layer 0 item 5) and
  that a lifted cusp meridian of `n` turns ends at the `n`th power of the selected generator
  applied to its starting point (Pinned conventions, Layer 2 item 5), are Tau Ceti's `TauCeti.isCoveringMap_quotientMk_freeLocus`
  and `TauCeti.Subgroup.CuspDatum.meridian_lift_endpoint`, and the presentations of Layer 2 are
  side-pairing presentations read off polygons, not computations of fundamental groups.
- **ConformalMapping (completed) owns the Riemann mapping theorem (Layer 3), and analytic
  continuation and Schwarz reflection across analytic arcs (Layer 4).** No layer here consumes
  them: the polygons of Layer 2 are hyperbolic polygons with side pairings, and the extensions of
  functions across cusps (Layer 3 item 5, Layer 5 item 4, Layer 6 item 2) are removable-singularity
  and q-expansion arguments implemented in Tau Ceti.
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
  number, and ModularForms §10B compares its analytic genus `dim H¹(X, 𝒪)` with Layer 5 item
  1's genus; neither comparison is an input here.
- **ModularForms owns modular forms and functions before descent (Layers 0–9), the
  congruence-subgroup arithmetic of `X(Γ)` (§10A), analytic Riemann–Roch (§10B), and automorphy
  sheaves and dimension formulas (§10C).** Its §10A and
  §10B consume this roadmap's compactified quotients, degree theory and topological genus
  (Layers 0–5), and its §10A and §10D consume the identification `X(1) ≃ P¹` of Layer 6. This
  roadmap does not reconstruct modular forms, cohomology, or Riemann–Roch in its level-one
  application.
- **Tau Ceti supplies the normalized level-one `j`-function**
  (`TauCeti/Analysis/Complex/ModularForms/LevelOne/JInputs.lean`): `TauCeti.ModularForm.j`, defined
  as `E₄³/Δ`; its invariance `TauCeti.ModularForm.j_smul_SL2Z` under `SL(2,ℤ)`;
  `TauCeti.ModularForm.j_sub_1728`, `j − 1728 = E₆²/Δ`; the exact elliptic orders
  `TauCeti.ModularForm.analyticOrderAt_j_comp_ofComplex_ρ` (`j` vanishes to order `3` at `ρ`) and
  `TauCeti.ModularForm.analyticOrderAt_j_sub_1728_comp_ofComplex_I` (`j − 1728` vanishes to order
  `2` at `i`); and the q-expansion `TauCeti.ModularForm.laurentQExpansion_j`, with a simple pole
  `q⁻¹` at the cusp. Layer 6 consumes these and owns the descent of `j` to `X(1)`, its extension
  over the cusp and the degree-one identification `X(1) ≃ P¹`.
- **AlgebraicCurves owns algebraic curves and their function fields (Layer 0, and Layer 12's
  dictionary between function fields and curves).**  This
  roadmap constructs analytic Riemann surfaces.  It proves no GAGA equivalence and creates no
  algebraic curve by declaration.
- **TeichmullerGeometry, a downstream consumer, owns marked Teichmüller space and its
  generic-locus theorems.** It consumes the layers listed under Scope, and this roadmap consumes
  none of its layers.
- **ArithmeticFuchsianGroups, a downstream consumer, owns arithmetic Fuchsian lattices, their
  fixed-signature finiteness, commensurators and the applications built on them.** It consumes the
  layers listed under Scope, and this roadmap consumes none of its layers.

### Implemented in Tau Ceti

Most of Layers 0–5 and all of Layer 6 are implemented in the pinned Tau Ceti; each layer item
names, at its claim, the pinned declarations that prove it. The targets the pins lack are:

- second countability of `PSL(2,ℝ)` (Layer 0 item 1);
- the isometric action of the negative-determinant elements of `GL(2,ℝ)` (Layer 0 item 2);
- the action of `GL(2,ℝ)` by Riemannian isometries of the Poincaré metric, the comparison of the
  Riemannian distance of the Poincaré metric with Mathlib's `dist`, and the identification of the
  Poincaré metric with Tau Ceti's half-space metric on `TauCeti.UpperHalfSpace ℝ`, as a Riemannian
  isometry and as an isometry `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ`, and the constant curvature `−1` and
  the completeness of the Poincaré metric carried along them (Layer 2 item 1);
- the topological genus with `χ = 2 − 2g`, Riemann–Hurwitz in genus form, the Fuchsian
  Riemann–Hurwitz formula and the intrinsic orbifold area formula (Layer 5 items 1, 3, 6 and 7);
- the minimal areas and their equality cases (Layer 4a).

`Suggested.lean` exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and
`RiemannSurface.riemannHurwitz`; `RiemannSurface.genus` is the name under which
PseudoholomorphicCurveAnalysis and NoncongruenceModularForms cite Layer 5 item 1's genus. The
carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`.
All other names in this README that begin with `TauCeti`, `Subgroup`, `UpperHalfPlane`, `Matrix`,
`QuotientGroup`, `OnePoint` or `MeasureTheory` are pinned library declarations.

The import graph is strict:

```text
TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
TauCeti.Analysis.Complex.RiemannSurface.{Degree, Ramification, Divisor, Branch}
    -> Fuchsian Layer 5 genus and Riemann–Hurwitz
        -> Fuchsian compactification applications

TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs
    -> TauCeti.Analysis.Complex.Fuchsian.LevelOne

Fuchsian L0/L1/L2.1/L4/L4a -> downstream consumer TeichmullerGeometry
Fuchsian L0/L2/L4/L4a/L5 -> downstream consumer ArithmeticFuchsianGroups
```

The Riemann-surface degree modules import neither `ModularForms` nor analytic Riemann–Roch,
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
  by a proper power is rejected. Width is not an invariant of the bare cusp. The scaling theorem
  is Tau Ceti's `TauCeti.cuspDatum_width_eq_mul` and `TauCeti.cuspDatum_coordinate_eq`
  (`Fuchsian/Cusp/ChangeScaling.lean`): if two data have the same cusp representative and
  selected positive generator, and `σ'(z)=aσ(z)+b` for `a>0`, conjugating that generator gives
  `w' = a w`, and the q-coordinate transition multiplies by `exp(2πib/(aw))`; the compactified
  complex structure is independent of this choice (Layer 4 item 3).
- The coordinate attached to cusp datum `(σ,w)` is
  `q(z)=exp(2*pi*i*σ(z)/w)`. Its selected positive generator fixes `q`. Meridians are
  counterclockwise-positive around `q=0`: the lift of the meridian with `n` signed turns ends at
  the `n`th power of the selected generator, not its inverse, and reversing a meridian negates
  `n` (Tau Ceti's `TauCeti.Subgroup.CuspDatum.meridian_lift_endpoint` and
  `TauCeti.Subgroup.CuspDatum.meridian_neg`, `Fuchsian/Cusp/Meridian.lean`).
- Elliptic charts use a coordinate centered at the fixed point in which a generator acts by a
  primitive `m`th root of unity.  The quotient coordinate is `u=z^m`.  Ramification order is
  defined from this map-level local normal form.
- The compactified carrier is Tau Ceti's inductive disjoint sum `Subgroup.CompactifiedQuotient`
  (`Fuchsian/Compactification/Basic.lean`), with constructors
  `Subgroup.CompactifiedQuotient.ofQuotient` from `MulAction.orbitRel.Quotient Γ UpperHalfPlane` and
  `Subgroup.CompactifiedQuotient.ofCusp` from `Subgroup.CuspOrbit Γ`, and its equivalence
  `Subgroup.CompactifiedQuotient.equivSum` with the corresponding `Sum`. The topology glues
  punctured cusp neighbourhoods across those constructors and the charts are proved afterwards. It
  is neither opaque nor a classified surface.
- Orbifold signature is derived from the genus of the compactification, the list of elliptic
  stabilizer orders, and the number of cusp orbits.  Public theorems continue to expose those
  underlying objects.
- A finite holomorphic map's local multiplicity, degree, divisor pullback and degree-one theorem
  are Tau Ceti's `TauCeti.RiemannSurface` declarations listed in Layer 5 item 2; degree is the
  fibre sum of local multiplicities, not a field of a map record. Its ramification degree is
  `R(f) = Σₓ (eₓ − 1)`, so the double cover `z ↦ z²` of the sphere has `R = 2`.
- Genus is topological: `genus X = (2 − χ(X))/2` for Tau Ceti's finite-CW Euler characteristic
  `TauCeti.eulerChar`, never the analytic `dim H¹(X, 𝒪)` of ModularForms §10B.
- `P^1` is the Riemann sphere `OnePoint ℂ` with Tau Ceti's atlas `OnePoint.instChartedSpace`,
  listed under Ownership.  A quotient becomes `P^1` only through a named biholomorphism proved
  after the quotient has been compactified.

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
- Tau Ceti's half-space model of hyperbolic space `TauCeti.UpperHalfSpace E`
  (`TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/`): its metric
  `TauCeti.UpperHalfSpace.riemannianMetric`, `(‖dx‖² + dt²)/t²` on `E × ℝ` with `t > 0`, packaged
  with completeness and curvature `−1` as `TauCeti.UpperHalfSpace.hyperbolicMetric`.
- ComplexManifolds Milestones 1, 2 and 4–6 and Tau Ceti's atlas on `OnePoint ℂ`, as listed under
  Ownership.
- AlgebraicTopology Stage 6 items 4 and 5 and Stage 8 item 7, as listed under Ownership.
- The Tau Ceti declarations listed under Ownership.
- Tau Ceti's normalized level-one `j` (`TauCeti.ModularForm.j`), its invariance, q-expansion, and
  exact orders at elliptic points, as listed under Ownership.

## Layer 0: the effective projective Möbius action

1. Mathlib defines `PSL(2,R)` as the quotient of `SL(2,R)` by its centre, so the quotient map is
   Mathlib's algebraic quotient map by definition, and the quotient topology, the
   topological-group structure and the Hausdorff property are Mathlib's
   `QuotientGroup.instTopologicalSpace`, `QuotientGroup.instIsTopologicalGroup` and
   `QuotientGroup.instT2Space` (the centre is closed). Prove that `PSL(2,ℝ)` is second countable:
   `SL(2,ℝ)` carries the subspace topology of `Matrix (Fin 2) (Fin 2) ℝ` through Mathlib's
   `Matrix.SpecialLinearGroup.isClosedEmbedding_val`, so it is second countable, and Mathlib's
   `QuotientGroup.instSecondCountableTopology` passes this to the quotient (this roadmap's own
   derivation from those two Mathlib declarations). Instance search at the pins finds no
   `SecondCountableTopology` instance for `SL(2,ℝ)` or `PSL(2,ℝ)`.
   *Needs:* Mathlib `Matrix.SpecialLinearGroup.isClosedEmbedding_val`,
   `QuotientGroup.instSecondCountableTopology`.
   **Checks.**
   - The centre of `SL(2,ℝ)` is `{±1}`, so the quotient map identifies exactly `A` and `−A`; it
     is open, as every quotient map by a group is, so it carries a countable basis of `SL(2,ℝ)` to
     a countable basis of `PSL(2,ℝ)`.
   - `SL(2,ℝ)` is a closed three-dimensional submanifold of `ℝ⁴`, and the countable family of
     rational balls of `ℝ⁴` meets it in a countable basis; the same holds for every `SL(n,ℝ)`.
   - With the discrete topology, `PSL(2,ℝ)` would be Hausdorff but not second countable, since
     it is uncountable; second countability is a property of the quotient topology, not of every
     group topology.
2. The canonical homomorphism `PSL(2,R) → PGL(2,R)` is Mathlib's
   `Matrix.ProjectiveSpecialLinearGroup.toPGL`. Mathlib's `UpperHalfPlane.glAction` lets
   `A = [[a, b], [c, d]]` act by `z ↦ (az + b)/(cz + d)` when `det A > 0` and by
   `z ↦ (a conj z + b)/(c conj z + d)` when `det A < 0`, descends to `MulAction PGL(2, ℝ) ℍ`, and is
   faithful there (`FaithfulSMul PGL(2, ℝ) ℍ`, `Mathlib/Analysis/Complex/UpperHalfPlane/FixedPoints.lean`).
   The `PSL(2,ℝ)` action is Tau Ceti's `UpperHalfPlane.instMulActionPSL2`
   (`Analysis/Complex/UpperHalfPlane/PSL/Action.lean`): its compatibility with the `SL(2,R)` action
   is `UpperHalfPlane.pslMk_smul`, its agreement with the restriction of `glAction` along `toPGL`
   is `UpperHalfPlane.toPGL_smul`, and its faithfulness is the instance
   `FaithfulSMul PSL(2, ℝ) ℍ` of the same file; joint continuity and isometry are the instances
   `ContinuousSMul PSL(2, ℝ) ℍ` and `IsIsometricSMul PSL(2, ℝ) ℍ` of
   `UpperHalfPlane/ProperAction.lean`, and holomorphy of every element is
   `UpperHalfPlane.instContMDiffConstSMulPSL2` (`UpperHalfPlane/PSL/Manifold.lean`). Prove that
   every element of `GL(2,ℝ)` acts by an isometry of `dist`: a positive-determinant element acts as
   an element of `SL(2,ℝ)`, an isometry by Mathlib's `IsIsometricSMul SL(2, ℝ) ℍ`, and a
   negative-determinant element is such an element composed with Mathlib's `UpperHalfPlane.J`,
   the matrix `diag(−1, 1)` of `GL(2,ℝ)`, which acts by `z ↦ −conj z` and is an isometry by Tau Ceti's
   `TauCeti.UpperHalfPlane.isometry_J_smul` (`UpperHalfPlane/Geodesic/Reflection.lean`) (this
   roadmap's own derivation from those two isometries); negative-determinant elements reverse
   orientation and are antiholomorphic. Do not export an unrelated permutation action as a second
   public action.
   *Needs:* Mathlib `UpperHalfPlane.glAction`, `UpperHalfPlane.J`, `IsIsometricSMul SL(2, ℝ) ℍ`;
   Tau Ceti `TauCeti.UpperHalfPlane.isometry_J_smul`.
   **Checks.**
   - `diag(1, −1)` has determinant `−1` and acts by `z ↦ −conj z`, sending `1 + i` to `−1 + i`
     and fixing `i`; the model without conjugation would send `1 + i` to `−1 − i ∉ ℍ`.
   - `diag(2, 1)` acts by `z ↦ 2z`, as the class of `diag(√2, 1/√2)` in `PSL(2,ℝ)`, and `2·I`
     acts trivially, so the kernel on `GL(2,ℝ)` contains the scalars and nothing else.
   - `diag(1, −1)` preserves `dist(1 + i, 2 + i) = dist(−1 + i, −2 + i)`, both equal to
     `2 arsinh(1/2)`; a map conjugating without the sign, `z ↦ conj z`, leaves `ℍ`.
3. A discrete subgroup `Γ ≤ PSL(2,ℝ)` acts properly discontinuously: this is the
   `ProperlyDiscontinuousSMul Γ ℍ` instance of Tau Ceti's `Analysis/Complex/Fuchsian/ProperAction.lean`,
   proved from properness of the `PSL(2,ℝ)` action, with no choice of lift to `SL(2,ℝ)` in its
   interface.
4. Every stabilizer of a discrete subgroup is finite, by proper discontinuity, and cyclic, by Tau
   Ceti's `Subgroup.isCyclic_stabilizer` (`Analysis/Complex/UpperHalfPlane/Stabilizer.lean`). Its
   order is the order of the derivative in a disc coordinate: `Subgroup.stabilizerDeriv` is an
   injective multiplicative homomorphism to `ℂ` (`Subgroup.stabilizerDeriv_injective`) preserving orders
   (`Subgroup.orderOf_stabilizerDeriv`), and `Subgroup.exists_discCoordinate_generator_transition`
   records how replacing a generator changes the rotation.
5. The free locus is Tau Ceti's `TauCeti.freeLocus`, the points with trivial stabilizer, an
   invariant subset by construction and open by `TauCeti.isOpen_freeLocus`
   (`Topology/Algebra/GroupAction/FreeLocus.lean`). Its projection is a covering map
   (`TauCeti.isCoveringMap_quotientMk_freeLocus`) and a local biholomorphism
   (`Subgroup.isLocalDiffeomorph_quotientMk_freeLocus`, `Analysis/Complex/Fuchsian/FreeLocus.lean`).

**Source spine:** Beardon, Chapters 7–8; Katok, §§2.1–2.4; Mathlib's
`UpperHalfPlane/ProperAction.lean` and `UpperHalfPlane/FixedPoints.lean`.

## Layer 1: elliptic points and coarse quotient charts

1. For an elliptic fixed point `z` of order `m`, the invariant disc and the linearization are Tau
   Ceti's: `Subgroup.stabilizerBall` is the hyperbolic disc about `z` as a set with an action of
   the stabilizer, and `Subgroup.stabilizerBallHomeomorph` (`Analysis/Complex/UpperHalfPlane/Elliptic.lean`)
   identifies it, through the holomorphic disc coordinate, with a Euclidean disc on which the
   stabilizer acts by the `m`th roots of unity. For small radii its translates are disjoint outside
   the stabilizer, in the form that its local orbit space embeds openly in `Γ \ ℍ`
   (`Subgroup.eventually_isOpenEmbedding_orbitRelQuotientMap_stabilizerBall`); the linearizing
   coordinate of the elliptic chart is `Subgroup.LinearizingCoordinate`
   (`Fuchsian/Elliptic/Linearizing.lean`).
2. The finite cyclic quotient theorem for a disc is Tau Ceti's
   `Subgroup.stabilizerBallQuotientHomeomorph`: the orbit space of the invariant disc of radius `ε`
   is the Euclidean disc of radius `tanh(ε/2)^m`, the orbit of `τ` going to the `m`th power of its
   disc coordinate. The resulting chart is `Subgroup.stabilizerBallQuotientChart`, with inverse read
   through `u ↦ u^m` by `Subgroup.stabilizerBallQuotientChart_symm_pow`
   (`Fuchsian/Elliptic/Basic.lean`), and the local multiplicity of the quotient map at `z` is the
   stabilizer order `m`, `Subgroup.localMultiplicity_quotientMk` (`Fuchsian/Ramification.lean`).
3. The glued atlas of the coarse quotient is Tau Ceti's `Subgroup.instChartedSpaceOrbitRelQuotient`,
   analytic by `Subgroup.instIsManifoldOrbitRelQuotient` and second countable by
   `Subgroup.instSecondCountableTopologyOrbitRelQuotient` (`Fuchsian/CoarseQuotient.lean`), and
   Hausdorff by Mathlib's `t2Space_of_properlyDiscontinuousSMul_of_t2Space`. The projection is
   holomorphic (`Subgroup.mdifferentiable_quotientMk`) and ramified exactly at elliptic points
   (`Subgroup.one_lt_localMultiplicity_quotientMk_iff`).
4. Independence of the invariant disc is Tau Ceti's `Subgroup.stabilizerBallQuotientChart_trans_apply`:
   the charts built from discs of two positive radii agree on their common domain. Independence of
   the stabilizer generator, and the exact transition law when a generator is replaced by another
   primitive generator, is `Subgroup.exists_discCoordinate_generator_transition`
   (`Analysis/Complex/UpperHalfPlane/Stabilizer.lean`).
5. Descent of invariant holomorphic and meromorphic functions is Tau Ceti's
   `Subgroup.existsUnique_mdifferentiable_quotientMk` (`Fuchsian/Descent.lean`) and
   `Subgroup.existsUnique_meromorphicAt_quotientMk` (`Fuchsian/MeromorphicDescent.lean`), and the
   local order formula `ord_z(F ∘ π) = m · ord_[z](F)` at a point of stabilizer order `m` is
   `Subgroup.meromorphicOrderAt_comp_quotientMk`.

**Source spine:** Farkas–Kra, §IV.9; Miranda, Chapter III §§3–4; Diamond–Shurman, §§2.1–2.3.

## Layer 2: hyperbolic polygons and cofinite groups

1. **L2.1: the hyperbolic metric, area and covolume.** Tau Ceti's
   `TauCeti.UpperHalfPlane.poincareRiemannianMetric` is the Riemannian metric
   `(Re v Re w + Im v Im w)/y²` on `UpperHalfPlane` (`UpperHalfPlane.poincareRiemannianMetric_inner`),
   and `UpperHalfPlane.riemannianVolume_eq_volume` identifies its Riemannian volume with Mathlib's
   `volume`. Covolume through measurable fundamental domains, independent of the domain, is Mathlib's
   `MeasureTheory.covolume` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean`); the existence of a
   fundamental domain and cofiniteness are Tau Ceti's `Subgroup.exists_isFundamentalDomain` and
   `Subgroup.IsCofinite` (`Fuchsian/Covolume.lean`), and the Gauss–Bonnet formula for finite
   hyperbolic polygons is `TauCeti.UpperHalfPlane.volume_triangle`
   (`Analysis/Complex/UpperHalfPlane/Triangle.lean`) and
   `TauCeti.UpperHalfPlane.CompactConvexPolygon.volume_carrier` (`UpperHalfPlane/Polygon/GaussBonnet.lean`).
   The targets of this item are the following six, each with its own inputs.

   - **(a) Riemannian isometries.** Prove that every element of `GL(2,ℝ)` acts on `ℍ` by a
     Riemannian isometry of the Poincaré metric, an element of Tau Ceti's isometry group
     `TauCeti.Isom 𝓘(ℝ, ℂ) ℍ` (`Riemannian/Isometry/Group.lean`): an element `g = [[a, b], [c, d]]`
     of positive determinant acts holomorphically with derivative `det g/(cz + d)²`, whose modulus
     `det g/|cz + d|²` is the ratio `Im(g • z)/Im z` by Mathlib's `UpperHalfPlane.im_smul_eq_div_normSq`,
     so the tensor is preserved; Mathlib's `UpperHalfPlane.J` acts by `z ↦ −conj z`
     (`UpperHalfPlane.coe_J_smul`), whose differential `v ↦ −conj v` preserves `|v|` while the map
     preserves `Im z`; and an element of negative determinant is `J` composed with one of positive
     determinant, as in Layer 0 item 2 (this roadmap's own derivation from the metric formula).
     *Needs:* Tau Ceti `UpperHalfPlane.poincareRiemannianMetric_inner`, `TauCeti.Isom`; Mathlib
     `UpperHalfPlane.glAction`, `UpperHalfPlane.im_smul_eq_div_normSq`, `UpperHalfPlane.J`,
     `UpperHalfPlane.coe_J_smul`; Layer 0 item 2.
   - **(b) The distance comparison.** Prove `isRiemannianManifold_upperHalfPlane`: Mathlib's metric
     space `ℍ` satisfies Mathlib's `IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ` for the Poincaré metric, that is,
     the Riemannian distance of the Poincaré metric is Mathlib's `dist`. Route: a vertical segment
     from `iy₁` to `iy₂` has length `|log(y₂/y₁)|`, every curve joining them is at least as long
     because `|d log y| ≤ ds`, the `PSL(2,ℝ)` action moves an arbitrary pair to a vertical pair
     without changing either distance (the Riemannian distance because its elements are the
     Riemannian isometries of (a) and Tau Ceti's `TauCeti.RiemannianIsometry.riemannianEDist_eq`
     preserves it under any Riemannian isometry, Mathlib's `dist` by `IsIsometricSMul PSL(2, ℝ) ℍ`),
     and the resulting `arcosh(1 + ((x − x′)² + (y − y′)²)/(2yy′))` agrees with
     `UpperHalfPlane.dist_eq`, including the coincident-point case (Katok, §1.2).
     *Needs:* (a); Tau Ceti `IsIsometricSMul PSL(2, ℝ) ℍ`,
     `TauCeti.RiemannianIsometry.riemannianEDist_eq`; Mathlib `UpperHalfPlane.dist_eq`,
     `IsRiemannianManifold`.
   - **(c) The half-space model.** Prove that `x + iy ↦ (x, y)` is a Riemannian isometry
     `TauCeti.RiemannianIsometry 𝓘(ℝ, ℂ) 𝓘(ℝ, WithLp 2 (ℝ × ℝ)) ℍ (TauCeti.UpperHalfSpace ℝ)` onto
     Tau Ceti's half-space model with its metric `TauCeti.UpperHalfSpace.riemannianMetric`, the plane
     case `E = ℝ` of `(‖dx‖² + dt²)/t²` (`TauCeti.UpperHalfSpace.inner_def`): both tensors are the
     Euclidean one divided by the squared height (this roadmap's own derivation from the two metric
     formulas). Conjugation by it carries the `GL(2,ℝ)` action of (a) to Riemannian isometries of the
     half-space.
     *Needs:* Tau Ceti `UpperHalfPlane.poincareRiemannianMetric_inner`, `TauCeti.RiemannianIsometry`,
     `TauCeti.UpperHalfSpace.riemannianMetric`, `TauCeti.UpperHalfSpace.inner_def`; (a), for the
     conjugated action only.
   - **(d) The comparison isometry.** Give the half-space its Riemannian distance, Tau Ceti's
     `TauCeti.MetricSpace.ofRiemannianMetric` (`Riemannian/Distance.lean`). With (b), Tau Ceti's
     `TauCeti.RiemannianIsometry.riemannianEDist_eq` (`Riemannian/Isometry/Distance.lean`, whose
     `IsometryClass` instance turns a Riemannian isometry between spaces whose distances are their
     Riemannian distances into a metric isometry) makes the map of (c) an isometry
     `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ` from Mathlib's `dist` to the Riemannian distance of the
     half-space; this is the comparison isometry that TeichmullerGeometry consumes.
     *Needs:* (b), (c); Tau Ceti `TauCeti.MetricSpace.ofRiemannianMetric`,
     `TauCeti.RiemannianIsometry.riemannianEDist_eq`.
   - **(e) Curvature.** Tau Ceti's `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff`
     (`Riemannian/Isometry/Curvature.lean`), applied to the map of (c), carries the constant
     sectional curvature `−1` of the half-space, `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`
     (`Hyperbolic/UpperHalfSpace/Curvature.lean`), to the Poincaré metric.
     *Needs:* (c); Tau Ceti `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff`,
     `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`.
   - **(f) Completeness.** The Riemannian distance of the Poincaré metric is complete because, by
     (b), it is Mathlib's `dist`, which is complete by Mathlib's `ProperSpace ℍ` instance
     (`UpperHalfPlane/Metric.lean`).
     *Needs:* (b); Mathlib `ProperSpace ℍ`.

   **Checks.**
   - `diag(2, 1)` sends `i` to `2i` with derivative `2`: the tangent vector `1` at `i` has squared
     Poincaré length `1/1² = 1` and its image `2` at `2i` has `2²/2² = 1`, while the Euclidean
     tensor would give `1` and `4`. The class of `[[0, −1], [1, 0]]` acts by `z ↦ −1/z` with
     derivative `1/z²`, equal to `−1/4` at `2i`: the vector `1` at `2i`, of squared length `1/4`,
     goes to `−1/4` at `i/2`, of squared length `(1/16)/(1/2)² = 1/4`.
   - At `2i` the tangent vector `1` has squared Poincaré length `(1·1 + 0·0)/2² = 1/4`, and its
     image `(1, 0)` at `(0, 2)` has squared half-space length `(1² + 0²)/2² = 1/4`; the disc
     normalisation `4|dz|²/y²` would give `1`, and the height rescaling `x + iy ↦ (x, 2y)` would send
     it to `(1, 0)` at `(0, 4)`, of squared length `1/16`.
   - `dist(i, 2i) = log 2`: the vertical segment has length `∫₁² dy/y = log 2`, and
     `2 arsinh(1/(2√2)) = 2 log √2 = log 2`; the disc-model normalisation `2|dz|/(1 − |z|²)` read on
     `ℍ` as `2|dz|/y` would give `2 log 2`. The comparison isometry sends `i` and `2i` to `(0, 1)`
     and `(0, 2)`, whose half-space Riemannian distance is the length `∫₁² dt/t = log 2` of the
     vertical segment, the same value.
   - `dist(i, 1 + i) = arcosh(3/2) = 2 log((1 + √5)/2) ≈ 0.9624`, the Poincaré length
     `∫ dθ/sin θ` of the arc of the circle of centre `1/2` and radius `√5/2` between the two points;
     the horizontal segment has Poincaré length `∫₀¹ dx/1 = 1 > 0.9624`, so a model in which the
     Riemannian distance is the length of the Euclidean segment is wrong off vertical pairs.
   - The points `i/n` form a Cauchy sequence for the Euclidean distance, with limit `0 ∉ ℍ`, but
     `dist(i/n, i/m) = |log(m/n)|`, so they are not Cauchy for `dist`: completeness in (f) is a
     property of the Poincaré distance, false for the Euclidean distance on `ℍ`.
   - The ideal triangle with vertices `0`, `1`, `∞` has area `π`, the angular defect `π − 0`, while
     the region `{|x| ≤ 1/2, |z| ≥ 1}` has area `π/3`, the covolume of `PSL(2,ℤ)`.
   - `z ↦ −conj z` fixes the imaginary axis pointwise, so it is a reflection: an isometry that
     reverses orientation and is induced by no element of `PSL(2,ℝ)`, since a nontrivial element of
     `PSL(2,ℝ)` fixes at most one point of `ℍ`.
2. Geodesics, convex hyperbolic polygons, sides, vertices, side pairings, cycles and angles are Tau
   Ceti's: geodesics in `Analysis/Complex/UpperHalfPlane/Geodesic/`, convex polygons
   `TauCeti.UpperHalfPlane.ConvexPolygon` with interior angles
   `TauCeti.UpperHalfPlane.ConvexPolygon.interiorAngle`, and side pairings
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing` with vertex-cycle transformations
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.cycleMap`. Local finiteness of translated
   polygons is `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.locallyFinite_smul_carrier_iff_isParabolic_cycleMap`
   (`Fuchsian/FundamentalPolygon.lean`) and
   `TauCeti.UpperHalfPlane.ConvexPolygon.locallyFinite_smul_carrier_of_isCuspPoint`
   (`Fuchsian/Polygon/LocallyFinite.lean`).
3. Poincaré's polygon theorem is Tau Ceti's, for a side-paired convex polygon whose finite vertex
   cycles satisfy the angle condition `ord(cycle transformation) · (cycle angle sum) = 2π` and whose
   ideal vertices have parabolic cycle transformations: the fundamental-set part
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.isFundamentalDomain_carrier_of_isParabolic`,
   discreteness with finite covolume
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.isCofinite_of_isParabolic`, and the
   presentation `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.relatorQuotientTo_bijective_of_isParabolic`
   (`Fuchsian/Polygon/Poincare.lean`).
4. The converse is Tau Ceti's `Subgroup.IsCofinite.exists_sidePairing_relatorQuotientTo_bijective`:
   for a cofinite `Γ` and a Dirichlet centre in the free locus, the Dirichlet domain is a
   finite-sided side-paired convex polygon whose pairing maps lie in `Γ` and present it; and
   `Subgroup.isCofinite_iff_exists_convexPolygon_carrier_eq_dirichletDomain` is the equivalence of
   cofiniteness with the Dirichlet domain being a finite-sided convex polygon
   (`Fuchsian/DirichletDomain/Cofinite.lean`).
5. The elliptic cycles are read off the polygon by Tau Ceti's
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.ellipticOrbitEquiv` and
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_ellipticOrbits`
   (`Fuchsian/Elliptic/Polygon.lean`), the cusp orbits by
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.finite_cuspOrbit`
   (`Fuchsian/Compactification/Polygon.lean`), and the presentation by item 3; the Euler
   characteristic of the compactified quotient `X(Γ)` is computed from the polygon in Layer 5
   item 7. The
   orientation of the boundary word agrees with that of the cusp meridians fixed under Pinned
   conventions, in Tau Ceti's `Fuchsian/Cusp/Polygon.lean`, for a side pairing whose maps lie in
   `Γ` and whose nontrivial `Γ`-translates of the open polygon are disjoint from it: at an ideal
   vertex with parabolic cycle transformation, every scaling sending the vertex to `∞` carries a
   cusp datum whose selected
   generator is that cycle transformation
   (`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.exists_cuspDatum_generator_eq_cycleMap`), the
   selected generator of every datum at that vertex is the cycle transformation, neither its inverse
   nor a proper power (`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.cuspDatum_generator_eq_cycleMap`),
   and a lift of the meridian with `k` signed turns ends at the `k`th power of the cycle word applied
   to its starting point
   (`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.meridian_lift_endpoint_eq_pairingHom_cycleWord_zpow_smul`).
6. The finite-or-cusp parameter is Tau Ceti's `TauCeti.TriangleOrder`, with constructors
   `elliptic m` carrying `2 ≤ m` and `cusp`, and reciprocal `TauCeti.TriangleOrder.reciprocal`,
   equal to `1/m` and `0` respectively (`Fuchsian/TriangleOrder/Basic.lean`). Every triple whose
   reciprocals sum to less than one is realised by
   `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup`: a hyperbolic triangle with
   the corresponding angles whose triangle group
   `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroup`, the orientation-preserving index-two
   subgroup of the group generated by the reflections in its sides, is cofinite and isomorphic to
   the abstract triangle group `Δ(p, q, r) = ⟨x, y, z | x^p, y^q, z^r, zyx⟩`, Tau Ceti's
   `TauCeti.TriangleGroup` at the orders `TauCeti.TriangleOrder.order` (`0`, no relation, at a
   cusp) (`TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv`), with elliptic orders
   and cusp count `TauCeti.UpperHalfPlane.ConvexPolygon.natCard_ellipticOrbits_of_doubleTriangle`
   and `TauCeti.UpperHalfPlane.ConvexPolygon.natCard_cuspOrbit_of_doubleTriangle`
   (`Fuchsian/TriangleOrder/`); `(p,q,cusp)` is not untyped infinity notation.

**Source spine:** Beardon, Chapters 9–11; Katok, Chapters 3–4; Stillwell, Chapter 5.

## Layer 3: cusps and q-coordinates

1. Cusps are Tau Ceti's: `Subgroup.IsCuspPoint` holds at the fixed point of a parabolic element
   of `Γ` (`Subgroup.isCuspPoint_iff_exists_parabolicFixedPoint_eq`,
   `Subgroup.isCuspPoint_iff_exists_mem_stabilizer_isParabolic`), cusp orbits in `OnePoint ℝ` are
   `Subgroup.CuspOrbit` (`Fuchsian/Cusp/Basic.lean`), and a cofinite group has finitely many of
   them, `Subgroup.IsCofinite.finite_cuspOrbit` (`Fuchsian/Cusp/Finite.lean`).
2. The cusp datum is Tau Ceti's `Subgroup.CuspDatum` (`Fuchsian/Cusp/Datum.lean`), whose fields are
   the representative `c`, a scaling `σ` with `σ(c)=∞`, the selected generator `γ` and its width
   `w > 0`, with `⟨γ⟩ = stabilizer Γ c` (`Subgroup.CuspDatum.mem_stabilizer_iff`) and
   `σγσ⁻¹(z)=z+w`, so that the conjugated full stabilizer is exactly `wℤ`
   (`Subgroup.CuspDatum.mem_stabilizer_iff_conj`). Every cusp representative and every scaling
   sending it to `∞` carry a datum (`Subgroup.IsCuspPoint.exists_cuspDatum`), and a datum is
   determined by its representative and its scaling (`Subgroup.CuspDatum.ext`); uniqueness is only
   relative to the normalized datum.
3. Horodiscs are Tau Ceti's `TauCeti.Subgroup.CuspDatum.horodisc` (`Fuchsian/Cusp/Horodisc.lean`):
   from height `w` on they are precisely invariant under the cusp stabilizer
   (`TauCeti.Subgroup.CuspDatum.disjoint_smul_horodisc`), and horodiscs at inequivalent cusps have
   disjoint images (`TauCeti.Subgroup.CuspDatum.disjoint_image_quotientMk_horodisc_iff`). Removing
   their images leaves a compact part of the quotient
   (`TauCeti.UpperHalfPlane.ConvexPolygon.isCompact_compl_iUnion_image_horodisc`,
   `Fuchsian/Compactification/Polygon.lean`).
4. The q-coordinate `q(z)=exp(2*pi*i*σ(z)/w)` is Tau Ceti's `TauCeti.Subgroup.CuspDatum.coordinate`
   (`Fuchsian/Cusp/Coordinate.lean`): it is invariant under the stabilizer
   (`TauCeti.Subgroup.CuspDatum.coordinate_smul`), identifies the quotient by the full stabilizer
   with the punctured disc (`TauCeti.Subgroup.CuspDatum.quotientHomeomorph`), and tends to `0` along
   the cusp, its norm being small exactly on high horodiscs
   (`TauCeti.Subgroup.CuspDatum.norm_qCoordinate_lt_iff_mem_horodisc`). For a second datum
   `σ'=aσ+b`, `w'=aw` and `q'=exp(2πib/(aw))q` are `TauCeti.cuspDatum_width_eq_mul` and
   `TauCeti.cuspDatum_coordinate_eq` (`Fuchsian/Cusp/ChangeScaling.lean`).
5. The q-expansion criterion is Tau Ceti's: for an invariant holomorphic function, the descended
   function on the punctured disc extends holomorphically across `0` when it is bounded
   (`TauCeti.Subgroup.CuspDatum.analyticAt_cuspExtension_zero`, `Fuchsian/Cusp/Extension.lean`),
   meromorphically with a pole of order at most `n` under growth `O(exp(2πn Im σ(z)/w))`
   (`TauCeti.Subgroup.CuspDatum.neg_natCast_le_meromorphicOrderAt_cuspExtension`), and with a zero
   of order at least `n` under decay `O(exp(−2πn Im σ(z)/w))`
   (`TauCeti.Subgroup.CuspDatum.natCast_le_meromorphicOrderAt_cuspExtension`,
   `Fuchsian/Cusp/Growth.lean`).

**Source spine:** Diamond–Shurman, §2.4.

## Layer 4: compactified quotient Riemann surfaces

The construction order in this layer is normative. Declarations below written without a
namespace, such as `isOpenEmbedding_ofQuotient`, are in Tau Ceti's namespace
`Subgroup.CompactifiedQuotient`.

1. The carrier is Tau Ceti's explicit inductive disjoint sum `Subgroup.CompactifiedQuotient` of the
   coarse orbit quotient and the cusp orbits, with constructors
   `Subgroup.CompactifiedQuotient.ofQuotient` and `Subgroup.CompactifiedQuotient.ofCusp` and sum
   equivalence `Subgroup.CompactifiedQuotient.equivSum` (`Fuchsian/Compactification/Basic.lean`).
   Its cusp neighbourhoods `Subgroup.CompactifiedQuotient.cuspNhd` are built from the precisely
   invariant horodiscs, and the topology does not depend on the heights or on the data chosen
   (`exists_cuspNhd_subset`).
2. The carrier is Hausdorff (`Subgroup.CompactifiedQuotient.instT2Space`), second countable
   (`Subgroup.CompactifiedQuotient.instSecondCountableTopology`) and connected
   (`Subgroup.CompactifiedQuotient.instConnectedSpace`); for a cofinite group it is compact,
   `Subgroup.IsCofinite.compactSpace_compactifiedQuotient`
   (`Fuchsian/DirichletDomain/Cofinite.lean`), from a truncated Dirichlet polygon and finitely many
   cusp discs.
3. The atlas extending the coarse-quotient charts by the q-coordinate charts at the cusps is
   `Subgroup.CompactifiedQuotient.instChartedSpace`. It contains the cusp chart of every cusp datum
   of Layer 3 item 2, cut off at any height at least the datum's width (`cuspChart_mem_atlas`), and
   it is analytic, `Subgroup.CompactifiedQuotient.instIsManifold : IsManifold 𝓘(ℂ) ω`
   (`Fuchsian/Compactification/Manifold.lean`), so the compactified complex structure does not
   depend on the cusp datum chosen.
4. The original quotient is open and dense, and the cusps are exactly its complement
   (`isOpenEmbedding_ofQuotient`, `dense_range_ofQuotient`, `compl_range_ofQuotient`). Conjugate
   groups have biholomorphic
   compactifications (`Subgroup.CompactifiedQuotient.conjBiholomorph`,
   `Fuchsian/Compactification/Conj.lean`). For an inclusion `Γ' ≤ Γ` the quotient map extends to
   the cusps as the holomorphic map `Subgroup.compactifiedQuotientMap`
   (`mdifferentiable_compactifiedQuotientMap`). For cusp data with the same representative and
   scaling, its local multiplicity at a cusp is the width ratio `e_cusp = w_{Γ'}/w_Γ ∈ ℕ`,
   `localMultiplicity_compactifiedQuotientMap_ofCusp_eq_widthIndex`,
   with `TauCeti.Subgroup.CuspDatum.width_eq_widthIndex_mul`,
   `TauCeti.Subgroup.CuspDatum.widthIndex_eq_relIndex` (the index of the cusp stabilizers) and
   multiplicativity in towers `TauCeti.Subgroup.CuspDatum.widthIndex_tower`
   (`Fuchsian/Cusp/Tower.lean`). At an elliptic point it is the stabilizer index,
   `localMultiplicity_compactifiedQuotientMap_ofQuotient_eq_ellipticRamificationIndex`
   with `Subgroup.ellipticRamificationIndex_eq_index` and
   `Subgroup.ellipticRamificationIndex_tower`. The fibre cardinality and the degree are
   `Subgroup.card_fiber_compactifiedQuotientMap_eq_card_stabilizerOrbitRelQuotient` and
   `Subgroup.degree_compactifiedQuotientMap`, the index.
5. The orbifold signature is derived from the compact surface, the elliptic stabilizer orders
   and the cusp set, and the orbifold Euler-characteristic and area formula carries all factors of
   `2*pi` and the effective `PSL` convention. Its form for a side-paired fundamental polygon is
   Tau Ceti's `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul`
   (`Fuchsian/Polygon/Area.lean`) and its level-one case
   `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul`; its intrinsic form, with the
   genus of `Γ.CompactifiedQuotient`, is Layer 5 item 7's `covolume_eq_two_pi_mul_signature`.

No step identifies the carrier with `P^1`, a torus, or another classified surface by definition.

**Source spine:** Katok, Chapter 4; Diamond–Shurman, §2.4.

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
   - A compact surface of genus `2` has `χ = −2` and `genus = 2`; the definition
     `g = (−χ/2).toNat`, which agrees on the sphere, would give `1` here and `0` on the torus.
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
   `TauCeti.RiemannSurface.ramificationDegree`.
3. **The branched-cover formula and Riemann–Hurwitz.** The branched-cover formula
   `χ(X) = deg f · χ(Y) − R(f)` for a finite holomorphic map `f : X → Y` of compact connected
   Riemann surfaces is Tau Ceti's
   `TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`,
   given finite CW type of `X`, `Y` and of `Y` minus the branch values, which are finitely many
   (`TauCeti.RiemannSurface.FiniteHolomorphicMap.finite_branchValues`). The finite CW type of the
   punctured target is this roadmap's own step: triangulate `Y` by a finite simplicial complex `K`
   with the branch values among its vertices (AlgebraicTopology Stage 8 item 7, in its form with
   finitely many marked interior points); Tau Ceti's
   `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage` gives the realization of `K` minus
   those vertices finite CW type, and `Homeomorph.finiteCWType` carries it to `Y` minus the branch
   values along the triangulation, restricted to the complements. Prove `riemannHurwitz`, for `X`
   and `Y` in one universe as in the pinned formula:
   `2 genus X − 2 = deg f · (2 genus Y − 2) + R(f)`, by rewriting both Euler characteristics with
   item 1 (Forster, §17; Miranda, Chapter II §4). No canonical divisor and no Riemann–Roch enters.
   *Needs:* item 1; Tau Ceti
   `TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`,
   `TauCeti.RiemannSurface.FiniteHolomorphicMap.finite_branchValues`,
   `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage`, `Homeomorph.finiteCWType`;
   AlgebraicTopology Stage 8 item 7, with marked points.
   **Checks.**
   - The punctured step on `z ↦ z²`: triangulate `P¹` as the boundary of a tetrahedron with `0`
     and `∞` among its four vertices; the complement of those two vertices is a cylinder, of Euler
     characteristic `2 − 2 = 0`, each puncture of a surface lowering `χ` by one. Its preimage is the
     same cylinder, and `0 = 2 · 0` is the punctured formula `χ(X ∖ f⁻¹S) = deg f · χ(Y ∖ S)`; a
     model in which a puncture left `χ` unchanged would turn it into the false `2 = 2 · 2`.
   - `z ↦ z²` on `P¹`: degree `2`, ramified at `0` and `∞`, `R = 2`, and `−2 = 2 · (−2) + 2`; the
     sign error `2g − 2 = d(2g′ − 2) − R` would give `−2 = −6`.
   - The Weierstrass function of a lattice, `ℂ/Λ → P¹`: degree `2`, four ramification points,
     `0 = 2 · (−2) + 4`.
   - An unramified double cover of a genus-`2` surface by a genus-`3` surface: `4 = 2 · 2 + 0`; a
     genus that did not depend on the surface would make the two sides `2c − 2` and `2(2c − 2)`,
     unequal unless `c = 1`.
4. A `Γ`-invariant holomorphic or meromorphic function descends uniquely to the coarse quotient,
   and the elliptic local-order formula and the cusp q-expansion criterion extend it to the
   compactification. This is implemented in Tau Ceti as
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
   `MeasureTheory.covolume_eq_card_mul_covolume` (this roadmap's own derivation from items 3, 5 and
   7 and that theorem). Items 3 and 7 assume finite CW type of `X(Γ′)` and `X(Γ)`, which the pins
   give only for `X(1)` (`TauCeti.ModularGroup.finiteCWType_compactifiedQuotient`); for these
   compact Riemann surfaces (Layer 4 items 2 and 3) it is taken from AlgebraicTopology Stage 8
   item 7 through ComplexManifolds Milestone 1, as in Layer 4a.
   *Needs:* items 3, 5 and 7; Layer 2 item 1; Layer 4 items 2 and 3; Tau Ceti
   `MeasureTheory.covolume_eq_card_mul_covolume`; AlgebraicTopology Stage 8 item 7 with
   ComplexManifolds Milestone 1, for the finite CW type of `X(Γ′)` and `X(Γ)`.
   **Checks.**
   - The image of `Γ(2)` in `PSL(2,ℤ)` has index `6` and `X(2)` has genus `0` with three cusps of
     width `2`: over the cusp `R` gains `3`, over `i` three points of index `2` give `3`, over `ρ`
     two points of index `3` give `4`, and `−2 = 6 · (−2) + 10`.
   - `χ_orb(PSL(2,ℤ)) = 2 − (1/2 + 2/3) − 1 = −1/6` and `χ_orb(Γ(2)) = 2 − 3 = −1 = 6 · (−1/6)`.
7. **The genus bridge and the orbifold area formula.** Let `Γ` be cofinite, with `X(Γ)` of finite
   CW type (`TauCeti.FiniteCWType Γ.CompactifiedQuotient`, the hypothesis under which
   `genus X(Γ)` is defined), and let `σ` pair the sides of a convex `n`-gon `P` whose pairing maps
   lie in `Γ`, whose `Γ`-translates form a locally finite family and whose nontrivial
   `Γ`-translates have interiors disjoint from that of `P` (a Dirichlet polygon of Layer 2 item 4
   is one). Write `k` for the number of self-paired sides, so
   that `n − k` is even, `V = Nat.card σ.FiniteVertexCycle` for the number of finite vertex cycles,
   those with trivial cycle transformation included, and `c = Nat.card σ.IdealVertexCycle` for the
   number of ideal vertex cycles, which is `Nat.card Γ.CuspOrbit` by Tau Ceti's
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_cuspOrbit`
   (`Fuchsian/Cusp/VertexCycle.lean`). Prove the cell count
   `TauCeti.eulerChar X(Γ) = V + c + 1 − (n − k)/2`: the image of `P` in `X(Γ)`, with each cusp
   adjoined through its filled-disc chart, is a finite cell decomposition whose vertices are the `V`
   finite cycles, the `c` cusps and the midpoints of the `k` self-paired sides, whose edges are the
   `(n − k)/2` pairs of distinct paired sides and the `k` halves of the self-paired sides, and whose
   one face is the interior of `P`; its alternating cell count is `TauCeti.eulerChar X(Γ)` by Tau
   Ceti's `TauCeti.eulerChar_eq_cwEulerChar` (`Cellular/EulerCharacteristic/FiniteCWType.lean`). With
   item 1 this is the genus bridge, `(n − k)/2 − 1 − V = 2 genus X(Γ) − 2 + c`: the genus `h` read
   off the polygon, defined by `2 − 2h = V + c + 1 − (n − k)/2`, is `genus X(Γ)`. Substituting it
   into the polygon area formula of Layer 4 item 5,
   `covolume Γ = 2π ((n − k)/2 − 1 − V + Σₑ (1 − 1/mₑ))`, proves
   `covolume_eq_two_pi_mul_signature`:
   `covolume Γ = 2π (2g − 2 + Σₑ (1 − 1/mₑ) + c)`, where `g = genus Γ.CompactifiedQuotient`, `e`
   runs over the elliptic orbits `Subgroup.ellipticOrbits` with stabilizer orders
   `mₑ = TauCeti.cardStabilizerOnOrbit e`, and `c = Nat.card Γ.CuspOrbit` (Martin, Theorem 2.2;
   Beardon, §10.4; Katok, §4.3). Keep the cell count `χ(X(Γ)) = 2 − 2g` distinct from the orbifold
   Euler characteristic `χ_orb = 2 − 2g − Σₑ (1 − 1/mₑ) − c = −covolume Γ / 2π`.
   *Needs:* item 1; Layer 2 items 1, 4 and 5; Layer 4; Tau Ceti
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul`,
   `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_cuspOrbit`,
   `TauCeti.eulerChar_eq_cwEulerChar`, `Subgroup.IsCofinite.finite_ellipticOrbits`,
   `Subgroup.IsCofinite.finite_cuspOrbit`.
   **Checks.**
   - The cell count `(n, k, V, c) ↦ V + c + 1 − (n − k)/2` on `PSL(2,ℤ)`: the standard triangle
     with vertices `ρ`, `ρ + 1`, `∞`, its arc self-paired by `z ↦ −1/z`, is `(3, 1, 1, 1)` and gives
     `2`, genus `0`, which is `χ(X(1)) = 2` (`TauCeti.ModularGroup.eulerChar_compactifiedQuotient`).
     Leaving the midpoints of the self-paired sides out of the vertices, the count
     `V + c + 1 − (n + k)/2`, gives `1` on this polygon, not `χ(X(1))`. Splitting the arc at `i` into
     two sides paired by `z ↦ −1/z` does not give a convex `4`-gon in the sense of Tau Ceti's
     `TauCeti.UpperHalfPlane.ConvexPolygon`: the vertex `ρ + 1` lies on the unit circle, the geodesic
     through `ρ` and `i`, not strictly to its left, so that region is outside the cell count.
   - The image of `Γ(2)`, on the ideal quadrilateral with vertices `−1`, `0`, `1`, `∞`: `(4, 0, 0, 3)`
     gives `2`, genus `0`; leaving the cusps out of the vertices gives `0 + 1 − 2 = −1`, an odd
     value that no closed orientable surface has.
   - The commutator subgroup of `PSL(2,ℤ)`, on an ideal quadrilateral whose four vertices form one
     cycle: `(4, 0, 0, 1)` gives `0`, genus `1`; the regular octagon with angles `π/4` and the
     surface-word pairing of a torsion-free group of genus `2`: `(8, 0, 1, 0)` gives `−2`, genus `2`.
   - `PSL(2,ℤ)`: genus `0`, elliptic orders `2` and `3`, one cusp, and `2π(−2 + 1/2 + 2/3 + 1) = π/3`,
     the pinned `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`, equal to the polygon form
     `2π(1 − 1 − 1 + 1/2 + 2/3)` on `(3, 1, 1, 1)`; dropping the cusp term gives the negative bracket
     `−5/6`.
   - A torsion-free cocompact group of genus `2` has covolume `4π = −2π χ`.
   - The `(2, 3, 7)` triangle group has covolume `π/21`; the formula with `χ_orb` in place of
     `−χ_orb` would give a negative area.

**Source spine:** Forster, §§4, 17 and 19; Miranda, Chapter II §4 and Chapter III §§3–4;
Farkas–Kra, §§I.2 and III.1; Beardon, §10.4; Katok, §4.3.

## Layer 4a: minimal areas of cofinite Fuchsian groups

A cofinite Fuchsian group `Γ` of signature `(g; m₁, …, m_r; c)`, with elliptic orders `mᵢ ≥ 2`
and `c` cusps, has covolume `2π δ` for the deficit `δ = 2g − 2 + Σᵢ (1 − 1/mᵢ) + c` (Layer 5
item 7; Martin, Theorem 2.2). The deficit is positive: Tau Ceti's `MeasureTheory.covolume_pos`
makes the covolume of a discrete group positive, while `ENNReal.ofReal (2π δ)` vanishes for
`δ ≤ 0`. Layer 5 item 7 assumes finite CW type of `X(Γ)`, and the two lower bounds below do not;
their routes take it from AlgebraicTopology Stage 8 item 7, applied to the compact Riemann surface
`X(Γ)` (Layer 4 items 2 and 3) through ComplexManifolds Milestone 1. This layer owns the two minima
of the covolume and their equality cases.

1. **The minimum `π/21`.** Prove `pi_div_twentyOne_le_covolume`: every cofinite Fuchsian group has
   covolume at least `π/21` (Siegel 1945, pp. 708–718; Martin, Theorem 2.1). Without cusps,
   `δ ≥ 1/42` is Tau Ceti's `TauCeti.one_div_forty_two_le_hyperbolic_deficit`
   (`TauCeti/Data/Rat/BranchDeficit.lean`), applied to `g` and the multiset of elliptic orders. With
   `c ≥ 1` cusps, replace each cusp by an elliptic point of order `m`: the deficit becomes
   `δ − c/m`, which is positive once `m ≥ 2` and `m > c/δ`, so the same lemma, applied to `g` and
   the elliptic orders together with `c` copies of `m`, gives `δ > δ − c/m ≥ 1/42`. Prove the
   equality case
   `covolume_eq_pi_div_twentyOne_iff`: the covolume is `π/21` exactly for signature `(0; 2, 3, 7)`,
   that is genus zero, no cusp and one elliptic orbit of each order `2`, `3` and `7` (Martin,
   Theorem 2.1). The value at `(0; 2, 3, 7)` is Tau Ceti's
   `TauCeti.hyperbolic_deficit_two_three_seven`. A cusp makes the inequality strict, by the
   replacement argument; without cusps, uniqueness, which the Tau Ceti lemma does not state, is the
   following case analysis. If `g ≥ 2` then `δ ≥ 2`; if `g = 1`, positivity needs
   `r ≥ 1` and `δ ≥ 1/2`. For `g = 0` positivity needs `r ≥ 3`. For `r ≥ 5`,
   `δ ≥ r/2 − 2 ≥ 1/2`. For `r = 4` the all-order-two signature has `δ = 0`, and otherwise some
   `mᵢ ≥ 3`, so `δ ≥ 1/6`. For `r = 3` sort `m₁ ≤ m₂ ≤ m₃`: `(2, 2, m₃)` has `δ < 0`; `(2, 3, m₃)`
   has `δ = 1/6 − 1/m₃`, positive exactly for `m₃ ≥ 7` and equal to `1/42` only at `m₃ = 7`;
   `(2, 4, m₃)` needs `m₃ ≥ 5` and has `δ ≥ 1/20`; `(2, m₂, m₃)` with `m₂ ≥ 5` has `δ ≥ 1/10`; and
   `m₁ ≥ 3` has `δ ≥ 1/12`, the case `(3, 3, 3)` having `δ = 0`.
   *Needs:* Layer 2 item 1; Layer 4 items 2 and 3; Layer 5 items 1 and 7; Tau Ceti
   `MeasureTheory.covolume_pos`, `TauCeti.one_div_forty_two_le_hyperbolic_deficit`,
   `TauCeti.hyperbolic_deficit_two_three_seven`, `Subgroup.IsCofinite.finite_ellipticOrbits`,
   `Subgroup.IsCofinite.finite_cuspOrbit`; AlgebraicTopology Stage 8 item 7 with ComplexManifolds
   Milestone 1, for the finite CW type of `X(Γ)`.
   **Checks.**
   - `(0; 2, 3, 7)`: `δ = −2 + 1/2 + 2/3 + 6/7 = 1/42`, covolume `π/21`; a bound `π/42`, from
     forgetting the factor `2` in `2π δ`, would not be attained by any group.
   - `(0; 2, 3, 8)`: `δ = 1/24`, covolume `π/12 > π/21`; `(0; 2, 3, 6)` has `δ = 0` and is the
     Euclidean triangle group, not a cofinite Fuchsian group.
   - `(0; 2, 2, 2, 3)`: `δ = 1/6`; `(1; 2)`: `δ = 1/2`; `(2; −)`: `δ = 2`, covolume `4π`, the
     Gauss–Bonnet value `−2π χ` for `χ = −2`.
   - `(0; 2, 2, 2, 2)` has `δ = 0`: the bound is false for nonpositive deficit, and the hypothesis
     `Γ.IsCofinite` is what excludes it.
   - The cusp replacement on `(0; 2, 3; 1)`, with `δ = 1/6` and `c/δ = 6`: the order `m = 7`
     gives `(0; 2, 3, 7)` with `δ − 1/7 = 1/42`, so `1/6 > 1/42`; the order `m = 6` gives the
     Euclidean `(0; 2, 3, 6)` with deficit `0`, to which the lemma does not apply, which is why
     `m > c/δ` is required.
2. **The minimum `π/3` with a cusp.** Prove `minimum_area_finite_area_orbifold`: a cofinite
   Fuchsian group with at least one cusp has covolume at least `π/3`. Prove the equality case
   `covolume_eq_pi_div_three_iff`: the covolume is `π/3` exactly for signature `(0; 2, 3; 1)`, that
   of `PSL(2,ℤ)`, whose covolume is Tau Ceti's `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`.
   Both follow from the area formula (Martin, Theorem 2.2) by the following case analysis, which is
   this roadmap's own; Tau Ceti's deficit lemma has no cusp term:

   | Signature range | Deficit and area |
   |---|---|
   | `g ≥ 2` | `δ ≥ 3`, area at least `6π` |
   | `g = 1` | `δ ≥ 1`, area at least `2π` |
   | `g = 0, c ≥ 3` | `δ ≥ 1`, area at least `2π` |
   | `g = 0, c = 2` | `r = 0` gives `δ = 0`; for `r ≥ 1`, `δ ≥ 1/2`, area at least `π` |
   | `g = 0, c = 1, r ≤ 1` | `δ < 0` |
   | `g = 0, c = 1, r = 2` | sort `m₁ ≤ m₂`; `(2, 2)` gives `δ = 0`, `(2, 3)` the minimum `δ = 1/6`, and every other pair `δ ≥ 1/4` |
   | `g = 0, c = 1, r ≥ 3` | `δ ≥ 1/2`, area at least `π` |

   *Needs:* Layer 2 item 1; Layer 4 items 2 and 3; Layer 5 items 1 and 7; Tau Ceti
   `MeasureTheory.covolume_pos`, `Subgroup.IsCofinite.finite_ellipticOrbits`,
   `Subgroup.IsCofinite.finite_cuspOrbit`, `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`;
   AlgebraicTopology Stage 8 item 7 with ComplexManifolds Milestone 1, for the finite CW type of
   `X(Γ)`.
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

**Source spine:** Siegel 1945; Martin, Theorems 2.1 and 2.2; Beardon, §10.4; Katok, §4.3.

## Layer 6: the level-one modular quotient, in construction order

This layer consumes Tau Ceti's normalized `j`-function `TauCeti.ModularForm.j`, its modular
invariance, q-expansion and exact elliptic orders (listed under Ownership); the whole layer is
implemented in Tau Ceti, in the construction order below.

1. Layers 0–4 applied to the effective level-one modular group `psl2zToPSL2R.range`: it is
   cofinite (`TauCeti.ModularGroup.isCofinite_psl2zToPSL2RRange`), its elliptic orbits are those of
   `ρ` and `i` (`TauCeti.ModularGroup.ellipticOrbits_psl2zToPSL2RRange`), with stabilizer orders `3`
   and `2` (`TauCeti.ModularGroup.card_stabilizer_psl2zToPSL2RRange_ρ`,
   `TauCeti.ModularGroup.card_stabilizer_psl2zToPSL2RRange_I`), it has a unique cusp
   (`TauCeti.ModularGroup.instUniqueCuspOrbit`), and its compactified quotient `X(1)` is compact
   (`TauCeti.ModularGroup.compactSpace_compactifiedQuotient`). Its signature `(0; 2, 3; 1)` and
   covolume are read off the standard fundamental triangle
   (`TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul`). The genus `genus X(1) = 0`,
   expected by ModularForms §10A (its level-one Check of the genus formula), follows from the
   definition of `genus` (Layer 5 item 1) and Tau Ceti's
   `TauCeti.ModularGroup.eulerChar_compactifiedQuotient`, `χ(X(1)) = 2`.
2. The descent of `j` to the uncompactified quotient is `TauCeti.ModularGroup.jQuotient`, with
   local multiplicity `1` at the orbits of `ρ` and `i`
   (`TauCeti.ModularGroup.localMultiplicity_jQuotient_ρ`,
   `TauCeti.ModularGroup.localMultiplicity_jQuotient_I`), and its meromorphic extension over the
   cusp is `TauCeti.ModularGroup.jCompactified` (`TauCeti.ModularGroup.meromorphicAt_jCompactified`,
   `Fuchsian/LevelOne/Extension.lean`).
3. The extension as a holomorphic map `X(1) → P¹` is `TauCeti.ModularGroup.jSphere`, with a single
   simple pole over infinity, at the cusp (`TauCeti.ModularGroup.jSphere_eq_infty_iff`,
   `TauCeti.ModularGroup.localMultiplicity_jSphere_ofCusp`), and degree
   one, `TauCeti.ModularGroup.degree_jSphere`, by the fibre count of Layer 5 item 2.
4. The degree-one theorem gives the named biholomorphism `TauCeti.ModularGroup.jBiholomorph :
   X(1) ≃ P¹`, which is the descended `j`-map (`TauCeti.ModularGroup.coe_jBiholomorph`) and is
   normalized by `ρ ↦ 0` and `i ↦ 1728` (`TauCeti.ModularGroup.jBiholomorph_ρ`,
   `TauCeti.ModularGroup.jBiholomorph_I`, `Fuchsian/LevelOne/Sphere.lean`).
5. No atlas is transferred backward by fiat: every statement about `P^1` is obtained through this
   proved biholomorphism after the compact quotient already exists.

**Source spine:** Diamond–Shurman, §§2.3–2.4; Serre, Chapter VII; Tau Ceti's
`TauCeti/Analysis/Complex/ModularForms/LevelOne/JInputs.lean`.

## Dependency order and parallel work

| Track | Depends on | Feeds |
| --- | --- | --- |
| L0 effective action and free locus | Mathlib, ComplexManifolds Milestone 4 | L1–L4, L6 |
| L1 elliptic charts | L0, ComplexManifolds Milestones 5–6 | L4–L6 |
| L2 polygons and presentations | L0, Tau Ceti half-space model | L3–L6, L4a |
| L3 cusps and q-coordinates | L0, L2 | L4–L6, L4a |
| L4 compactification | L0–L3 | L4a, L5–L6 |
| L5 degree theory and applications | ComplexManifolds Milestones 1–2, AlgebraicTopology Stages 6 and 8, Tau Ceti Euler characteristic and Riemann-surface degree, L1–L4 | L4a, L6, ModularForms §§10A–10B |
| L6 level-one example | L0–L5, Tau Ceti `j` | normalized `X(1) ≃ P^1`; ModularForms §§10A and 10D |
| L4a minimal areas | L2 item 1, L3 item 1, L4, L5 items 1 and 7, Tau Ceti deficit bound, AlgebraicTopology Stage 8 item 7, ComplexManifolds Milestone 1 | area ≥ `π/21`; area ≥ `π/3` with a cusp; equality cases |

The dependency order follows the table, except that Layers 2 and 3 interleave by item. The cusp
points, cusp orbits, cusp data, horodiscs, q-coordinates and q-expansion criterion of Layer 3 use
Layer 0, and the finiteness of the cusp orbits of a cofinite group also the cofiniteness of Layer 2
item 1, but no polygon; Layer 2 items 2, 5 and 6 state their cusp facts with them; and only the
compact part of the quotient outside the horodiscs, in Layer 3 item 3, uses the convex polygons of
Layer 2 item 2. No row depends on TeichmullerGeometry or ArithmeticFuchsianGroups, which consume
this roadmap downstream. L1 and L2 can proceed in parallel after L0. Layer 5 items 1–3 can proceed
in parallel with Layers 0–4; items 4–7 begin after Layer 4, and Layer 4a follows Layer 5 item 7.
Matching Mathlib APIs replace local declarations when available, but no layer waits for them.

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
  `dist(i, 2i) = log 2`, and proves that `x + iy ↦ (x, y)` is an isometry onto the half-space
  model with its Riemannian distance; no second invariant measure is constructed.
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
  Springer, 1983, especially Chapters 7–11.
- Svetlana Katok, *Fuchsian Groups*, Chicago Lectures in Mathematics, University of Chicago
  Press, 1992, especially §1.2 and Chapters 2–4.
- Fred Diamond and Jerry Shurman, *A First Course in Modular Forms*, Graduate Texts in
  Mathematics 228, Springer, 2005, §§2.1–2.4.
- Otto Forster, *Lectures on Riemann Surfaces*, Graduate Texts in Mathematics 81,
  Springer, 1981, especially §§4, 17 and 19.
- Hershel Farkas and Irwin Kra, *Riemann Surfaces*, Graduate Texts in Mathematics 71,
  Springer, second edition, 1992, §§I.2, III.1 and IV.9.
- Rick Miranda, *Algebraic Curves and Riemann Surfaces*, Graduate Studies in Mathematics 5,
  American Mathematical Society, 1995, Chapter II §4 and Chapter III.
- Jean-Pierre Serre, *A Course in Arithmetic*, Graduate Texts in Mathematics 7,
  Springer, 1973, Chapter VII.
- Gaven J. Martin, *The geometry and arithmetic of Kleinian groups*, arXiv:1311.2636 (2013),
  Theorems 2.1 (Siegel's minimal coarea `π/21`, attained only by the `(2, 3, 7)` triangle group)
  and 2.2 (the signature area formula).
- Carl Ludwig Siegel, *Some remarks on discontinuous groups*, Annals of Mathematics 46 (1945),
  708–718, doi:10.2307/1969206 (the minimal covolume `π/21`).
- John Stillwell, *Geometry of Surfaces*, Universitext, Springer, 1992, Chapter 5.
