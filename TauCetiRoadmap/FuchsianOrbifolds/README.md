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
biholomorphically with the Riemann sphere. A downstream application endpoint combines fixed-genus
Fuchsian lattices, finite Gassmann data and the distinct ambient-representation and scalar-spectrum
transplantation theorems.

Suggested homes: `TauCeti/Analysis/Complex/Fuchsian/` for groups, polygons, and cusps, and
`TauCeti/Geometry/RiemannSurface/Orbifold/` for quotient charts and compactification.

## Scope and completion criterion

The core geometric scope is orientation-preserving Fuchsian groups acting on the upper half-plane,
with special attention to cofinite groups, finite elliptic stabilizers, cusp compactification, triangle
groups, polygon presentations, and descent of invariant meromorphic functions. Layers 8 and 9
also use orientation-reversing projective isometries through `PGL₂(ℝ)`; those commensurator and
isometry claims are stated explicitly there. The roadmap proves the standard presentation of the
acting Fuchsian group; it does not introduce a general orbifold groupoid or orbifold
fundamental-group carrier.

Teichmüller theory and the marked moduli-space construction are owned by the separate
`TeichmullerGeometry` roadmap. Its cross-roadmap graph is `RiemannianGeometry R4.7 + Fuchsian L2 → Teichmuller T0`; `Fuchsian L1,L2,L4,L5 → Teichmuller T7`; `Fuchsian L1,L2.1,L4,L4a,L5 → Teichmuller T9`; `Fuchsian L7.4 → Teichmuller T8`; `Teichmuller T7,T8,T9 → T10`; and `Teichmuller T0,T4a,T9,T10 → Fuchsian L9`. Fuchsian L9 consumes Fuchsian L2.1, L5 and L8; Teichmuller T0/T4a/T9/T10; RiemannianGeometry R4.7; and the generic InductionRestriction, NoncompactQuantumSymmetry, and PseudodifferentialOperators interfaces. Fuchsian L0–L8 do not consume TeichmullerGeometry; this section-level graph is acyclic. General Kleinian groups, higher-dimensional
locally symmetric spaces, automorphic representations, and the classification of all
two-dimensional orbifolds remain outside this roadmap. Congruence-subgroup arithmetic, Hecke
operators, modular-form dimension formulas, and the construction and q-expansion of modular
forms remain with the modular-forms roadmap.

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
9. Arithmetic finite-covolume Fuchsian lattices, including the noncocompact split case, are
   constructed from quaternion algebras over totally real fields, their covolumes and invariant
   arithmetic data are identified, and Takeuchi's fixed-signature finiteness theorem is proved.
10. For every finite-covolume lattice, the PSL commensurator dichotomy is proved with its
    arithmeticity criterion, and its exact index-two passage to PGL is established.
11. The compact orbifold minimum `π/21` and the finite-area extension of that minimum to cusp
    signatures are proved from Gauss–Bonnet and integer-signature minimization.
12. For every genus `g ≥ 3`, the Teichmuller common-generic-locus theorem and the finite
    order-32 Gassmann pair give nonisometric, scalar-isospectral degree-eight covers of genus
    `8g−7`, together with the ambient right-regular `PSL(2,ℝ)`-representation equivalence.

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
  `FuchsianOrbifolds.SurfaceInvariants.lean`, with the three target declarations re-exported on
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
- **NumberFieldArithmetic (NFA), the ArithmeticDirichletSeries roadmap (ADS), GlobalNumberFields (GNF),
  [LFunctions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/README.md), [ZerosOfLFunctions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md), QuadraticFormInvariants (QFI), ClassFieldTheory (CFT),
  GlobalQuadraticForms (GQF), [SemisimpleAlgebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3bc32309a596d54160dfbd37136a534f347a4bdb/TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md) (SSA), [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1e875b1e9277da9091c8c1338594ede28d52f342/TauCetiRoadmap/ReductiveGroupsPartII/README.md) (RG2.2),
  [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e464f58f088088cd41cad5b2d2291342ee620c77/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) (AA), and [ThetaSeries](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1bc912d2a927f06d66c5b8e6b92f74a04316131f/TauCetiRoadmap/ThetaSeries/README.md)** own the exact primitives named in Layer 7.
  LFunctions owns completed Dedekind-zeta continuation, poles, residues and functional equation;
  ZerosOfLFunctions owns finite-order/growth and Hadamard/log-derivative tools. Layer 7 owns the
  quaternion-order/Fuchsian construction, Odlyzko specialization and interval certificates, the
  SL₁ quaternion volume comparison, and fixed-signature finiteness. GQF Layers 0.1/0.2 and 6.1 supply
  local-global scalar representation in the reduced-norm image argument; QFI Layer 0 owns the
  representation criterion and QFI 6D owns the local finite-place isotropy target. GQF form
  classification is not used to classify central simple algebras, which uses
  CFT's ABHN sequence and SSA Layers 4 and 6.
- **TeichmullerGeometry owns marked Teichmuller space and its generic-locus theorems.** T7
  consumes Fuchsian L1, L2, L4 and L5; L2 supplies the standard cocompact presentation used by
  T7's abstract-signature adapter. T9 consumes Fuchsian L1, L2.1, L4, L4a and L5, with L2.1's
  projective isometric-action convention; T9 supplies the isometry-lifting and
  `RiemannianIsometry(H²)≃PGL₂(ℝ)` adapters. T8 consumes Fuchsian L7.4. Teichmuller T7, T8, and T9 feed T10;
  Fuchsian L9 consumes Fuchsian L2.1, L5 and L8, Teichmuller T0, T4a, T9 and T10.
- **[InductionRestriction IR2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7f4bfabdd1853a87f68a450756ba95deb068d2a9/TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md#L346-L432) owns generic finite almost-conjugacy and permutation-representation
  equivalence.** Fuchsian L9 owns and verifies the concrete p85 order-32 pair; it consumes only
  IR2.1's generic criterion, not a finite-pair contract from IR. **[NoncompactQuantumSymmetry M1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f42b4ff526e2572c148520494a68fa500cbc9ae1/TauCetiRoadmap/NoncompactQuantumSymmetry/README.md#L664-L699)**
  supplies the finite-index lattice-quotient `L²` adapter for its quasi-invariant induced models.
  **[PseudodifferentialOperators P7a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/063cf517a1dcc4d929e0602c6e6f585953aceab8/TauCetiRoadmap/PseudodifferentialOperators/README.md#L873-L930)** supplies finite-deck scalar-Laplacian transplantation,
  using P7's compact-resolvent spectral theory. Fuchsian Layer 9 proves neither generic
  Hilbert-space induction nor the generic transplantation theorem; it applies those interfaces.

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
        -> Teichmuller T7/T9 and ModularForms10B consumers

TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs
    -> TauCeti.Analysis.Complex.Fuchsian.LevelOne

NFA/ADS/GNF + LF3 + ZLF 1.4/3.4/4.8/5/5.6 + exact rational certificates -> Fuchsian L7.3b; L7.3b + ThetaSeries L1/2A/2C + QFI/CFT/SSA + LocalFieldsRamification + RG2.2.1/2.2.2/2.2.4 + AA.2.4/3.4/4.2 + GQF 0.1/0.2/6.1 + Fuchsian L0–L5/L4a -> Fuchsian L7.4; L7.6 sharp bound separately consumes ZLF 8.4
Fuchsian L0/L2/L7 + LieGroups + SemisimpleAlgebras/RepresentationTheory + RG2.2.1/2.2.2/2.2.4 -> Fuchsian L8
Fuchsian L1/L2.1/L4/L4a/L5 -> TeichmullerGeometry T9
Fuchsian L7.4 -> TeichmullerGeometry T8
Fuchsian L2 + RiemannianGeometry R4.7 -> Teichmuller T0
Fuchsian L1/L2/L4/L5 -> TeichmullerGeometry T7
TeichmullerGeometry T7/T8/T9 -> T10
Fuchsian L2.1 + Teichmuller T0/T4a/T9/T10 + Fuchsian L8 + RiemannianGeometry R4.7 + IR2.1 + NQS M1 + PDO P7a -> Fuchsian L9
Fuchsian L5/L8 + Teichmuller T4a + generic IR2.1 -> Fuchsian L9
NQS M1 quotient-L2 adapter + IR2.1 -> Fuchsian L9 ambient representation
PDO P7a finite-deck transplantation + IR2.1 -> Fuchsian L9 scalar spectrum
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
`r=2` row; L7 consumes the finite-area bound for normalizer indices, and Teichmuller T9 consumes
the compact minimum `π/21` from the preceding theorem.


## Layer 5: compact-surface degree theory and Fuchsian applications

1. Consume SurfaceTopology Layer 8's compact oriented surface classification, standard models,
   genus and topological Euler characteristic; consume PlanarTopology Layers5/6/8's Radó/Hauptvermutung, surface Euler/orientation and compatible-category comparison, with its boundary-count interface, together with GeometricTopology
   Layer 1's smooth/finite-CW comparison adapter and AlgebraicTopology 4.7's CW conversion.
   The Fuchsian leaf `FuchsianOrbifolds.SurfaceInvariants` specializes the generic genus and Euler
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
   Teich T7's quotient by an action with fixed points and to L6's noncompact modular quotient
   before cusp filling. Neither genus is identified by notation alone.

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

## Layer 7: arithmetic Fuchsian groups, invariants, and fixed-signature finiteness

This layer constructs and classifies arithmetic Fuchsian lattices in `PSL₂(ℝ)`, including
noncocompact split examples. The fixed-signature theorem below assumes arithmeticity; no
finiteness claim is made for all lattices of a signature. It owns the named theorem `tamagawaNumberOne_SL1_quaternion` proving
`τ(SL₁(B))=1` by the type-`A₁` specialization of Weil's adelic Tamagawa-number argument. It
consumes the
number-field, local-invariant, building and adelic interfaces named below; it owns the quaternion-order and
norm-one group constructions, their global arithmetic data, covolume comparisons, and the
fixed-signature finiteness proof. AA.2.4 supplies the normalized measure and quotient-volume
interface, but not the quaternion-specific Tamagawa-number-one calculation named above. All assertions below are proof targets with their hypotheses,
not claims that a supplier has already proved arithmetic Fuchsian theory.

1. **Quaternion data and lattice construction.** Let `k` be a totally real number field of degree
   `n`, let `B/k` be a quaternion algebra split at exactly one real place `v₀`, and let `O` be an
   order. Choose `B ⊗_(k,v₀) ℝ ≃ M₂(ℝ)`. The projective image of `O¹`, the reduced-norm-one group,
   is a lattice `Γ(O) ≤ PSL₂(ℝ)`. Consume AA.3.4's arithmetic-quotient finite-volume and
   anisotropic-compactness criteria; prove the quaternion-specific projection to the distinguished
   noncompact factor `SL₂(ℝ)` is a discrete subgroup of finite covolume. Do not reprove the
   generic adelic volume or anisotropic criterion. The other real places are ramified; finite ramification obeys the global parity law derived
   from the ABHN invariant sequence. Specify the chosen real splitting
   `B⊗_{k,v₀}ℝ≃M₂(ℝ)`: conjugacy of the resulting subgroups is in `PSL₂(ℝ)` up to that
   splitting, while the algebraic embedding comparison is naturally in `PGL₂(ℝ)`.
   The split case `k=ℚ`, `B=M₂(ℚ)` includes noncocompact `PSL₂(ℤ)`; cocompactness is equivalent
   to `B` being division. Define arithmetic lattices as subgroups commensurable up to conjugacy
   with these images, including finite-index subgroups and nonmaximal-order constructions.
2. **Order covolumes and comparison.** For a maximal order in the division case, prove
   `Area(Γ(O)\ℍ²) = 8π |d_k|^(3/2) ζ_k(2)/(4π²)^n · ∏_{𝔭∈Ram_f(B)}(N𝔭−1)`
   with the fixed area and projective-kernel conventions. In the split case `k=ℚ`,
   `B=M₂(ℚ)`, `O=M₂(ℤ)`, specialize the same quotient calculation to
   `Area(PSL₂(ℤ)\ℍ²)=π/3`; prove the noncompact quotient and cusp convention directly.
   First define one global reduced-norm-fiber differential and prove each local factor below is
   its localization; independently normalized local coordinate forms cannot be silently assembled.
   Split the proof into four named steps: (a) consume AA.2.4's normalized Tamagawa-measure and
   quotient-volume interface, and prove in L7 the specialization `τ(SL₁(B))=1` of the type-`A₁`
   Tamagawa-number-one calculation. State the exact hypotheses: `B` is a quaternion algebra over
   a number field `F`, `SL₁(B)` is connected semisimple simply connected with zero geometric
   character lattice, and measures use AA's fixed Tamagawa normalization. For division `B`, fix
   the global reduced-trace pairing on its four-dimensional `F`-space, construct the rational top
   form and reduced-norm-fibre residue form, and prove their localizations are the AA.2.4 measures;
   the reduced-trace Gram determinant for a presentation `(a,b)_F` in basis `1,i,j,ij` is
   `−16a²b²`, and the split matrix basis determinant is `−1`. Show each local coordinate factor
   is the absolute square root of the Gram determinant times coordinate Haar measure, and that
   all local factors are localizations of the same rational form, including the basis-change
   determinant. Prove coarea for reduced norm with that form and fibre residue, then use the
   product formula to verify one global gauge. Formalize Voight's measure comparison precisely: his additive and multiplicative measures are
   `τ=D(B)^(−1/2)μ=∏ᵥτᵥ` and `τˣ=D(B)^(−1/2)μˣ=∏ᵥτᵥˣ`; for quaternion `B`, the module is
   `||α||_B=||Nrd(α)||_F²`, its module-one subgroup has quotient measure `dt/(2t)`, and the
   induced reduced-norm-one measure comes from the exact reduced-norm sequence. For each
   finite-dimensional `F`-space `V` with a nondegenerate `F`-bilinear pairing `b` (not assumed
   symmetric), prove
   one restricted-scalars adelic Poisson adapter. Instantiate it for `V=F` with multiplication,
   for `V=F²` with Voight’s standard dot-product pairing `b(y,x)=yᵀx` on column vectors
   (matrix `A=I₂`), and for `V=B` with reduced trace. Construct the rational top form and self-dual measures from the selected additive
   character. At each real factor choose an auxiliary positive-definite inner product and represent
   the transported bilinear pairing by an invertible real linear map A with b(x,y)=⟨Ax,y⟩.
   Consume Mathlib's `MeasureTheory.Integrable.fourierInv_fourier_eq` (or
   `Continuous.fourierInv_fourier_eq`) with its finite-dimensional real inner-product-space,
   integrability, and continuity hypotheses, after transporting the source transform to Euclidean
   Fourier inversion. Consume ThetaSeries 1C/1D/2A's Euclidean Fourier change-of-variables,
   determinant-Jacobian and lattice-biduality results. Fix the right b-dual L^(b)={y: b(ℓ,y)∈ℤ for all ℓ∈L}; prove
   L^(b)=A^(−T)L^∨. The left dual uses the transposed pairing bᵀ(x,y)=b(y,x), and prove
   (L^(b))^(bᵀ)=L. With e(u)=exp(2πiu), use the measure μ_b=|det A|^(1/2)dx and
   F_b f(y)=∫ f(x)e(−b(x,y))dμ_b(x). Derive F_(bᵀ)(F_b f)(x)=f(−x) and reciprocal
   b-dual covolumes from the Euclidean suppliers. For the same-pairing double transform, prove
   F_b(F_b f)(x)=f(−A^(−1)Aᵀx): it gives reflection for symmetric b and the identity for
   alternating b. In Voight (29.11.4)–(29.11.8), `A=I₂`, so the double transform is reflection
   `Φ(−x)`; the lattice sum reindexes by `y↦−y`. Instantiate each source pairing before
   applying inversion or a functional equation. These are pairing-transport adapters, with the generic
   real Fourier and lattice theorems retained by ThetaSeries. Consume ThetaSeries Layers 1, 2A and 2C for Poisson summation on each full
   `ℤ`-lattice in its finite-dimensional real inner-product model and its dual/covolume theorems.
   For a factorizable Schwartz–Bruhat function, write each
   finite-adelic factor as a finite linear combination of characteristic functions of compact-open
   cosets. After restriction of scalars and transport by the actual pairing, prove that each coset
   contributes an affine coset of a full `ℤ`-lattice in the real vector space, with its dual affine
   lattice specified by the local annihilator. Prove that the finite-place, affine-coset and real
   Fourier transforms factor compatibly and that the product measures and lattice covolumes match
   GNF and AA's self-dual adelic measure. Apply the ThetaSeries lattice theorem termwise and sum
   the finite decomposition. L7 owns this restricted-scalars adelic adapter for `F`, `F²`, and `B`,
   including compact-open decomposition, pairing-specific duality, product/Fourier compatibility
   and normalization comparison; it neither reproves generic real lattice Poisson nor treats a
   real-lattice theorem alone as adelic Poisson. Compute the unramified and ramified quaternion
   local integrals.
   Write `d_B²=dim_F B` for the source's central-division degree parameter (so `d_B=2`
   here, not the number-field degree). For central division `B/F` and arbitrary Schwartz `Φ`, prove the integral is
   meromorphic with at most simple poles at `0,1`, functional equation
   `Z_B^Φ(1−s)=Z_B^{Φ∨}(s)`, and exact residues
   `res_(s=1) Z_B^Φ=Φ∨(0)ζ_F^*(1)/d_B`,
   `res_(s=0) Z_B^Φ=−Φ(0)ζ_F^*(1)/d_B`; show when either residue vanishes rather than asserting
   both poles are always present. Define `ζ_F^*(1)=Res_(s=1) ζ_F(s)` for the uncompleted Dedekind zeta. Consume LF3's
   completed residue and prove its conversion by the pinned completion
   `Λ_F(s)=|d_F|^(s/2)Γ_ℝ(s)^(r₁)Γ_ℂ(s)^(r₂)ζ_F(s)`; at `s=1`, the conversion factor is
   `|d_F|^(1/2)Γ_ℝ(1)^(r₁)Γ_ℂ(1)^(r₂)` (with `Γ_ℝ(1)=1` and `Γ_ℂ(1)=1/π`) in
   the provider's normalization. Separately prove
   Main Theorem 29.10.1(c)'s module-one identity `τ̲^(1)(Bˣ\B̲^(1))=ζ_F^*(1)`, which has no
   `1/d_B` factor, and prove the field module-one volume is also `ζ_F^*(1)` under the same
   normalization. Write
   `B̲^(1)={α∈B̲ˣ:||α||_B=1}`, `B̲¹={α∈B̲ˣ:Nrd(α)=1}`,
   `F̲^(1)={x∈𝔄_Fˣ:||x||_F=1}`, and for the set `Ω` of real ramified places put
   `F̲_Ω^(1)={x∈F̲^(1):x_v>0 for every v∈Ω}`. For every quaternion `B/F`, prove Voight
   Lemma 29.11.1's exact sequence
   `1→B̲¹→B̲^(1) --Nrd→F̲_Ω^(1)→1` and compatible quotient-volume identity
   `τ̲^(1)(Bˣ\B̲^(1))=τ̲¹(B¹\B̲¹)τ̲^(1)(Fˣ\F̲^(1))` (29.11.2). The division case of Voight
   Theorem 29.11.3 then gives `τ̲¹(B¹\B̲¹)=1`; for split `B=M₂(F)`, prove its separate
   Poisson summation argument on `𝔄_F²` (printed p. 536). Prove local reduced-norm images are
   `F_vˣ` at finite and split real places and `ℝ_{>0}` at real division places. For division `B`,
   prove the global image `Nrd(Bˣ)=F_{>Ω}ˣ`. Fix `c∈Fˣ` positive at every ramified real place.
   At each completion, first prove local isotropy of the five-dimensional augmented form
   `Nrd_B ⊥ ⟨−c⟩`: use QFI Layer 6D's finite-place isotropy theorem; at a split real place use
   the signature `(2,2)` of `Nrd_B`; at a ramified real place use positive-definiteness of
   `Nrd_B` and `c>0`; at a complex place use isotropy of every nondegenerate quadratic form in
   dimension at least three. These local arguments also show that `Nrd_B` represents `c`; record
   that implication through QFI Layer 0's local representation criterion. Now apply GQF Layer
   6.1 with the regular quadratic form `Q=Nrd_B` and nonzero scalar `c` to obtain a global vector
   `x` with `Nrd_B(x)=c`. This uses the theorem with its actual scalar-representation
   hypotheses. For split `B=M₂(F)`, use `diag(c,1)`. The cited Hasse–Schilling norm-image
   statement is a reference, not a replacement for this L7 proof. Finally prove the local
   differential-form adapter from Voight's `D(B)^(−1/2)μˣ`, the module quotient `dt/(2t)` and
   reduced-norm fibre measure to AA.2.4's
   `|d_F|^(−3/2)ρ_G^(−1)∏ᵥλᵥ|ω|ᵥ`; for `G=SL₁(B)`, prove the zero character lattice and
   `ρ_G=λᵥ=1`, but do not identify the two Tamagawa measures by notation alone. Consume GNF mixed
   weak approximation, GQF Layers 0.1/0.2 and 6.1 (localization and local-global scalar representation),
   CFT local invariant classification, LFunctions
   Layer 3 residue, AA.2.4 normalization, and ThetaSeries Layers 1, 2A and 2C for generic
   Fourier/Poisson and lattice-covolume results. L7 owns the nonsymmetric-pairing `A⁻ᵀ` transport,
   affine-coset, finite-adelic and product-measure adapters. The cited source results
   specify the proof route;
   formalize the quaternion-specific identities and measure comparisons in L7 rather than importing
   their conclusions as axioms. (b) compute the split real determinant-fiber Haar measure in Iwasawa
   coordinates as `dx dy dθ/(2y²)`; the stabilizer angle in `PSL₂(ℝ)` has period `π`, giving
   `(π/2)` times hyperbolic area. At each of the other `n−1` real division places compute
   `vol(SL₁(ℍ))=4π²` from the reduced-trace self-dual measure and coarea on the unit sphere.
   (c) For a finite place of residue cardinality `q`, compute the split factor `1−q⁻²` and the
   division-place volume `(1−q⁻²)/(q−1)`. Use the additive measure self-dual for the reduced-trace pairing and an additive character of
   conductor `𝒪_v`, so `vol(𝒪_v)=1`; then the maximal-order volume is `q⁻¹`, the unit fraction is
   `1−q⁻²`, and the reduced-norm image volume is `1−q⁻¹`. Hence a division place replaces the
   split factor by `(q−1)⁻¹`. Relate this gauge to Voight’s global-character self-dual measures:
   at `v`, Voight’s `τ_v` on `B_v` is `N𝔡_v⁻²` times the conductor-`𝒪_v` self-dual
   measure, and his field measure is `N𝔡_v⁻¹/²` times the corresponding field measure; their
   quotient ratio is `N𝔡_v⁻³/²`. The multiplicative Haar measures on both `B_vˣ` and `F_vˣ`
   also carry the factor `(1−q_v⁻¹)⁻¹`; prove it from Voight Lemma 29.8.24(b) and show it cancels
   in the reduced-norm quotient. The additive ratios multiply to exactly `|d_k|⁻³/²`. Fix the
   `vol(𝒪_v)=1` conductor gauge for local volume calculations, with this displayed global
   discriminant multiplier; do not apply a second discriminant correction. (d) Apply strong approximation
   for `SL₁(B)`, noncompact at `v₀`, and AA.2.4's global `|d_k|^(−3/2)` multiplier to identify
   the adelic quotient with the norm-one lattice quotient and multiply the compatible factors. Consume AA.2.4's Tamagawa measure/quotient-volume interface and
   AA.4.2's strong-approximation theorem for simply connected absolutely almost simple groups.
   This layer owns the quaternionic local stabilizers and volume calculations, real Haar-to-area
   normalization, and the passage from those supplier statements to this formula. In the chosen
   global normalization, derive
   `1=|d_k|^(−3/2)(π/2)Area(Γ(O)\ℍ²)(4π²)^(n−1)ζ_k(2)^(−1)∏_{𝔭∈Ram_f(B)}(N𝔭−1)^(−1)`
   before rearranging to the displayed area formula.
   Compare every order's norm-one group with a maximal-order group containing it and prove exact
   finite-index covolume scaling. For a maximal order `O`, define `N_B⁺(O)={g∈PGL₁(B)(k):gOg⁻¹=O, nrd_(v₀)(g)>0}` under the chosen
   real splitting. Positivity of the reduced norm is well-defined modulo central scalars, and puts the image in `PSL₂(ℝ)`. Prove that this image is a discrete finite-covolume overgroup of
   `Γ(O)` with finite index, define the reduced-norm square-class homomorphism
   `ν:N_B⁺(O)→kˣ/(kˣ)²`, `ν([g])=[Nrd(g)]`, which is well-defined under central rescaling,
   and prove `ker ν=Γ(O)`. Identify the quotient by its image: `N_B⁺(O)/Γ(O)≃im(ν)`; do not
   quotient an already-projective norm image by `(kˣ)²` a second time. Compute its finite subgroup by the local normalizer
   conditions and the image of the global rational points in the adelic normalizer double-coset;
   retain the global class constraint and never replace it by an unconstrained product of local
   quotients. Prove this is finite and give an effective enumeration of its square classes. Prove exactly
   `Area(N_B⁺(O)\ℍ²)=Area(Γ(O)\ℍ²)/[N_B⁺(O):Γ(O)]`. For each order `O′` contained in a maximal order, prove the finite-index covolume scaling for
   `Γ(O′)≤Γ(O)`. Derive maximal-order covolume bounds from the maximal-order volume formula
   and its local normalizer comparison. Build local
   normalizer indices through L7's comparison of RG2.2.2's reduced GL₂ building and RG2.2.1's enlarged-building bounded
   fixed-point theorem with RG2.2.4's typed `BTTree` and type-preserving SL₂ action. Prove the
   required comparison with rank-two lattice-homothety vertices, adjacency, PGL₂ action and
   stabilizers as part of this order-to-building adapter. LocalFieldsRamification supplies
   the local fields, valuation rings and finite residue fields. At each split finite place,
   this layer proves the adapter sending `[L]` to `End_(𝒪_v)(L)`: maximal orders correspond
   to vertices, adjacent maximal orders intersect in level-one Eichler orders, and conjugation
   of orders agrees with the building action. Distinguish the pointwise edge stabilizer from
   the setwise edge stabilizer; the latter can exchange the endpoints and is the normalizer
   relevant to the unoriented Eichler order. Identify order units, scalar quotients and
   normalizers with the appropriate stabilizers, including determinant/norm restrictions.
   At division places prove the corresponding unique-maximal-order and valuation descriptions.
   This layer owns these order-to-building adapters, local normalizer indices, their finite
   product and their role in the global comparison. Obtain maximal-order covolume bounds from
   the maximal-order volume formula and its local normalizer comparison.
3. **Squared-trace data and quaternion envelope (general owner, before arithmetic recovery).**
   Let `Γ≤PSL₂(ℝ)` be nonelementary and finitely generated. Define `Γ^(2)` as the subgroup
   generated by all squares `γ²`; for either lift `γ̃∈SL₂(ℝ)`, `γ̃²` is independent of lift sign.
   Set `K₀(Γ)=ℚ(tr(γ̃²):γ∈Γ)`. Prove `Γ^(2)` has finite index and `K₀(Γ)` is finitely
   generated using a finite generating set and `tr(X)tr(Y)=tr(XY)+tr(XY⁻¹)`. Prove the exact
   trace adapter `K₀(Γ)=ℚ(tr(η̃):η∈Γ^(2))`, with arbitrary lift signs contributing only
   rational sign changes. From the trace character of `Γ^(2)`, build the four-dimensional
   central-simple trace envelope by the concrete definition
   `A_Γ := span_{K₀(Γ)} {X∈SL₂(ℝ) : [X]∈Γ^(2)}` inside `M₂(ℝ)`, using the chosen projective
   action; this set includes both signs of every norm-one lift. Prove its multiplication, trace
   pairing, central simplicity, and dimension four without assuming `K₀` is algebraic.
   Establish named theorems `invariant_squared_trace_data_finite_index` and
   `invariant_squared_trace_data_commensurable` for arbitrary such groups: for every
   finite-index inclusion `Δ≤Γ`, prove `K₀(Δ)=K₀(Γ)`. Since `Δ^(2)≤Γ^(2)`, the concrete span
   definition gives `A_Δ≤A_Γ`; both have dimension four over the common field, so prove
   `A_Δ=A_Γ` as embedded `K₀(Γ)`-subalgebras of `M₂(ℝ)` for the given actions. This gives the
   reduced-trace-preserving algebra isomorphism. Prove conjugation transport
   `A_(cΓc⁻¹)=cA_Γc⁻¹` and transport of the trace field by the identity on real scalars,
   then the conjugate finite-index-subgroup case. The proof uses absolute irreducibility of `Γ^(2)`, the finite
   complex matrix density/Burnside adapter from RepresentationTheory/SemisimpleAlgebras, and
   trace-identity reconstruction. For density, consume Mathlib
   `RingTheory/SimpleModule/Basic`'s `jacobson_density` and
   `Module.Finite.toModuleEnd_moduleEnd_surjective`; RepresentationTheory/SemisimpleAlgebras
   Layer 3 owns the finite-dimensional double-centralizer and Jacobson–Chevalley corollaries and
   the adapter to the finite complex matrix algebra. Prove the required finite-dimensionality,
   absolute irreducibility and scalar commutant for `Γ^(2)` before applying it; do not invoke a
   blanket Burnside theorem without those hypotheses. Do not assume these invariance results from
   arithmeticity.
   This is the single owner of the trace adapter, general quaternion envelope, and finite-index
   and commensurability invariance; L8 consumes these outputs, and L7.4 applies them with the
   arithmetic hypotheses stated below.

   The named L7.3 lemma `integral_trace_lattice_order` applies to a quaternion algebra `A/K`
   over a number field and a subgroup `H≤A¹` whose `K`-span is `A` and whose reduced traces are
   integral at every finite place. It proves that the `𝒪_K`-module generated by `H` is a full
   rank-four order contained in a maximal order: choose a `K`-basis `h₁,…,h₄` from `H`, use
   nondegeneracy of the reduced-trace pairing to form the finite trace-dual lattice `L^#` of
   `L=Σ_i 𝒪_K h_i`, and obtain `L⊆R⊆L^#` from `trd(hh_i)∈𝒪_K`; Noetherianity gives finite
   generation, and the group law gives closure and `1∈R`. The application establishes the full
   span by the concrete definition of `A_Γ` above. Finite generation of `H` is not needed.

   Prove the named arithmetic adapter
   `squared_trace_integrality_of_commensurable_arithmetic_group`: if `Γ` is commensurable up to
   conjugacy with `Γ(O)`, then for each `γ∈Γ` some positive power `γ^m` lies in the conjugate
   of `Γ(O)`. A determinant-one lift has eigenvalue `λ` with `λ^m` and `(λ^m)⁻¹` algebraic
   integers, so `t_m=λ^(2m)+λ^(−2m)` is integral. Since `t_m=P_m(t)` for the monic integral
   Chebyshev polynomial `P_m` and `t=tr(γ̃²)=λ²+λ⁻²`, the monic equation `P_m(t)-t_m=0`
   proves `t` integral. For a determinant-one lift, `(tr γ̃)²=t+2`;
   its monic equation `X²−(t+2)=0` and transitivity of integrality then prove the ordinary
   trace integral as well. This adapter proves integrality for every element of `Γ` and hence for
   every element of `Γ^(2)`. Prove also that the `k`-span of norm-one lifts of `Γ(O)^(2)` is all
   of `B` and that its squared-trace field is `k`; this identifies the trace envelope `A_Γ` with
   `B`. The span assertion is an explicit density target for this square-generated subgroup,
   not an inference from density of `Γ(O)` alone.
   To prove the field assertion, suppose the
   squared-trace field were a proper subfield `k′⊊k`. Since `k` is totally real, an embedding of
   `k′` into `ℝ` extends to at least two real embeddings of `k`; choose extensions corresponding
   to the distinguished split real place and a ramified real place of `B`. Equality of the
   restrictions on `k′` give equality of ordinary characters on the following fixed group:
   let `H≤B¹(k)` be the full norm-one preimage of `Γ(O)^(2)`. The trace adapter gives
   `trd(h)∈k′` for every `h∈H`, including either central sign. The two complex two-dimensional
   representations of this same `H` therefore have characters `σ(trd(h))=τ(trd(h))`.
   Prove their absolute irreducibility and apply the finite-dimensional ordinary character-
   isomorphism theorem to identify them over `ℂ`. That isomorphism would identify the noncompact
   lattice image with a subgroup of the compact norm-one group of the real division algebra,
   which is impossible. For a real splitting, prove Skolem–Noether conjugacy in `PGL₂(ℝ)` and
   treat the possible two `PSL₂(ℝ)`-conjugacy classes separately.
3b. **All-signature discriminant estimates (L7.3b; prerequisite to fixed-signature enumeration).**
   Prove Odlyzko's Theorem 1 estimates (4) and (5) for every signature `(r₁,r₂)` of a number
   field, not only the totally-real case. The completed zeta uses the pinned normalization
   `Λ_k(s)=|d_k|^(s/2)Γ_ℝ(s)^(r₁)Γ_ℂ(s)^(r₂)ζ_k(s)`. For the exact Table 1 row sets stated in
   the proof obligations below, prove the source inequalities
   `D ≥ (60.1)^r₁ (22.2)^(2r₂) exp(f₁−254)` and
   `D ≥ (58.6)^r₁ (21.8)^(2r₂) exp(f₂−70)`, where the displayed positive sums `f₁,f₂`
   are those transcribed below. The 12-row and 9-row rational interval certificates establish
   respectively the real and complex logarithmic margins and pole constants for both signatures;
   the separate exact zero-wise inequalities (11) certify the analytic input for both row sets.
   L7 owns the specialization from the consumed LFunctions/ZerosOfLFunctions analytic interfaces,
   the two exact coefficient sets, and both certificates; it does not claim these certificates are
   already Lean theorems. The proof route is the Stark identity from the completed-zeta
   normalization and Hadamard/log-derivative formula, followed by equations (10)–(12), the
   pointwise zero inequality and the stated rational certificates. These
   certificates must verify the specified rational comparisons as well as the analytic identities;
   numerical agreement alone does not discharge those proof targets.
   L7.3b proves the estimate-(5) bound consumed by L7.4. For totally real fields, positivity of f₂ gives `Δ≥e^(−70)58.6^n`; certify `e^(−70)>10^(−34)` using `e<3` and the integer inequality `3^70<10^34` and export `Δ≥10^(−34)58.6^n`. The sharper
   totally-real Table 2/4 estimate is a separate L7.6 output and is not an input to L7.4 or T8.

Consume LFunctions Layer 3's completed Dedekind-zeta datum, continuation, poles, residues
and functional equation; consume ZerosOfLFunctions Layer 3.4's finite-order/growth theorem
and Layer 5's Hadamard factorization and logarithmic-derivative formulas. Use the general
completion for signature `(r₁,r₂)`,
`Λ_k(s)=|d_k|^(s/2) Γ_ℝ(s)^(r₁) Γ_ℂ(s)^(r₂) ζ_k(s)`, in the provider's pinned
normalization, and specialize to `r₂=0` only for the totally-real discriminant estimate.
L7 does not construct a second completed zeta or Hadamard product. L7.3b owns the Odlyzko
Theorem 1 specialization, its interval certificates, the displayed `Z_j`, `E_j`, `f₁,f₂`
sums, positivity deductions, and the rational weakening and discriminant consequences.
Derive the Stark identity (printed as equation (8) on p. 212) from the consumed completion
and Hadamard/log-derivative interface.

To prove the two all-signature estimates in L7.3b, and to provide the analytic estimate input
also used by the independent sharp-bound output L7.6, formalize Odlyzko's Theorem 1. His equation (7) sets
`A=D^(1/2) 2^(-r₂) π^(-n/2)` and `ψ(s)=Γ'(s)/Γ(s)`. Equation (8) is
`log A=−(r₁/2)ψ(s/2)−r₂ψ(s)−1/(s−1)−1/s+Z(s)+Σ′_ρ 1/(s−ρ)`,
where the sum groups `ρ` with `1−ρ`; p. 209 defines `Z` and
`Z_j(s)=((-1)^j/j!) d^jZ(s)/ds^j`. For real `σ>1`,
`Z(σ)=Σ_𝔭 log(N𝔭)/((N𝔭)^σ−1)` and `Z_j(σ)>0`.
Define `E(σ,z)=Re(1/(σ−z)+1/(σ−1+\bar z))` and for `j≥1`,
`E_j(σ,z)=−Re(1/(σ−z)^j+1/(σ−1+\bar z)^j)`; set
`G(σ)=−(r₁/2)ψ(σ/2)−r₂ψ(σ)` and
`G_j(σ)=((-1)^j/j!)d^jG(σ)/dσ^j`. For `j≥2`, equation (10) is
`(1/2)Σ′_ρ E_j(σ,ρ)=G_{j−1}(σ)−(σ−1)^(−j)−σ^(−j)+Z_{j−1}(σ)`.
Given `σ>1`, positive `a_i`, `σ_i>1`, and integers `k_i≥2`, prove the pointwise
zero inequality (11), `E(σ,ρ)≥Σ_i a_i E_{k_i}(σ_i,ρ)`, for every nontrivial zero.
Equation (12) is the resulting lower bound
`log A ≥ G(σ)+Σ_i a_i G_{k_i−1}(σ_i)−1/(σ−1)−1/σ
−Σ_i a_i((σ_i−1)^(−k_i)+σ_i^(−k_i))+Z(σ)+Σ_i a_i Z_{k_i−1}(σ_i)`.

The actual Table 1 choices are Estimate (4): `σ=1.01`, `N=12`, rows
`(k_i,σ_i,a_i)=(2,2,.5075),(3,1.2,.0282),(3,2.3,.987),(4,1.7,.623),
(4,2,.1388),(4,2.5,1.294),(5,1.2,.003766),(5,1.4,.04325),
(5,1.6,.1),(5,2.25,1.473),(5,2.5,.117),(5,2.75,.732)`;
Estimate (5): `σ=1.1`, `N=9`, rows
`(2,2,.592),(3,1.2,.149),(3,2.3,1.02),(4,1.7,.538),(4,2.5,1.473),
(5,1.6,.0442),(5,2.25,1.785),(5,2.5,.0917),(5,2.75,.758)`.
The printed estimates on p. 210 are
`D ≥ (60.1)^r₁ (22.2)^(2r₂) exp(f₁−254)` and
`D ≥ (58.6)^r₁ (21.8)^(2r₂) exp(f₂−70)`, where
`f₁=2Z(1.01)+1.015Z₁(2)+.0564Z₂(1.2)+1.974Z₂(2.3)+1.246Z₃(1.7)
+.2776Z₃(2)+2.588Z₃(2.5)+.007532Z₄(1.2)+.0865Z₄(1.4)+.2Z₄(1.6)
+2.946Z₄(2.25)+.234Z₄(2.5)+1.464Z₄(2.75)` and
`f₂=2Z(1.1)+1.184Z₁(2)+.298Z₂(1.2)+2.04Z₂(2.3)+1.076Z₃(1.7)
+2.946Z₃(2.5)+.0884Z₄(1.6)+3.57Z₄(2.25)+.1834Z₄(2.5)+1.516Z₄(2.75)`.
Formalize both sums and prove positivity for every signature `(r₁,r₂)`, retaining both
printed estimates (4) and (5). Set `a_i` to half the printed coefficient of `Z_{k_i−1}`;
the `f₁,f₂` expressions above already give these exact coefficients. Define, for every
`j≥0`,
`g^R_j(σ)=−(−1)^j ψ^(j)(σ/2)/(2·j!·2^j)` and
`g^C_j(σ)=−(−1)^j ψ^(j)(σ)/j!`.
Differentiating the real and complex gamma factors in the completed zeta yields
`G_j(σ)=r₁ g^R_j(σ)+r₂ g^C_j(σ)` for `j≥0`, with the corresponding `j=0` formula
`G(σ)=r₁(−ψ(σ/2)/2)+r₂(−ψ(σ))`. For estimate (4) use `σ=101/100`, its twelve rows,
`A_R=601/10`, `A_C=111/5`, and pole bound `−254`; for estimate (5) use `σ=11/10`, its
nine rows, `A_R=293/5`, `A_C=109/5`, and pole bound `−70`. Here the source's bases are
`A_R^r₁ A_C^(2r₂)`, so their logarithmic targets are `r₁ log A_R+2r₂ log A_C`.
For each estimate prove by exact rational directed intervals that
`C_R−log A_R>0` and `C_C−log A_C>0`, where
`C_R=log π−ψ(σ/2)+2Σ_i a_i g^R_(k_i−1)(σ_i)` and
`C_C=log(2π)−ψ(σ)+Σ_i a_i g^C_(k_i−1)(σ_i)`, and prove `C_pole` is at least the
printed pole bound, with
`C_pole=2[−1/(σ−1)−1/σ−Σ_i a_i((σ_i−1)^(−k_i)+σ_i^(−k_i))]`.
Prove these comparisons by exact rational directed-interval certificates: estimate (4) gives real and complex logarithmic margins respectively greater than
`0.0008528244` and `0.0011129219`, with `C_pole≈−253.3465438978>−254`; estimate (5)
gives margins greater than `0.0008515350` and `0.0036156248`, with
`C_pole≈−69.5895030168>−70`. The certificate uses exact rational arithmetic with directed
integer grids; its decimal displays are diagnostics, and the exact interval comparisons are
the proof data. Consume the completed-zeta normalization
`log D=2log A+2r₂log 2+(r₁+2r₂)log π`. This proves the archimedean/pole implication
from Odlyzko's equation (12) to both printed estimates, conditional on the independent
pointwise zero inequality (11); the constants certificate alone does not prove (11). L7.3b also owns the separate interval certificate
for (11) for each of the two row sets, with exact harmonic reduction, tail bounds, and every
subinterval endpoint comparison. Neither positivity of `Z_j` nor the constants certificate
discharges (11).

Page 214 reduces verification of (11) to `x=1,y≥0` by harmonicity, symmetry
`x↦1−x`, and the maximum principle. It says the inequalities hold for `y≥40` by crude
tail estimates and for `0≤y<40` by numerical verification; p. 215 reports use of several
hundred subintervals. The following exact certificate route replaces unchecked numerical
sampling. For `z=y²≥0`, put
`R_(a,k)(z)=Σ_(j=0)^⌊k/2⌋(−1)^j binom(k,2j)a^(k−2j)z^j/(a²+z)^k`.
The boundary function at `x=1` is exactly
`R_(σ−1,1)(z)+R_(σ,1)(z)+Σ_i a_i(R_(σ_i−1,k_i)(z)+R_(σ_i,k_i)(z))`.
Clear the common positive denominator, merging equal `a`-factors at their largest exponent,
and prove by polynomial identity that the numerator has degree 83 for estimate (4) and 65
for estimate (5). Compactify `z=t/(1−t)` and set `Q(t)=(1−t)^dP(t/(1−t))`; its
Bernstein coefficients are `p_i/binom(d,i)` from the ascending monomial coefficients `p_i`
of `P`. Repeatedly bisect at dyadic midpoints using exact de Casteljau averages. For (4),
prove the six leaves at depths at most 5 have every Bernstein coefficient strictly positive;
for (5), prove the four leaves at depths at most 3 have this property and cover `[0,1]`
without gaps. Verify the polynomial identity independently by evaluating both sides at 84 and
66 distinct rational points respectively, using the degree bounds; verify every leaf's exact
rational coefficients, positivity and adjacent coverage. This proves `P(z)>0` for all
`z≥0`, without a sampled tail. The zero-wise function is real harmonic on the open strip,
continuous on its closure, symmetric under `x↦1−x`, and tends uniformly to zero as
`|y|→∞`; apply the minimum principle on rectangles and pass to the limit. Thus (11) holds
throughout the strip for both row sets. The exact polynomial and Bernstein proofs are L7
targets; the numerical certificate is not a Lean proof of the analytic formula. Estimate (6)
has an additional zero-free-region hypothesis and is not used for the unconditional
totally-real bound.

The exact finite-degree and all-larger-degree certificates for the sharp bound are specified
in this independent L7.6 sharp-bound target: the 31 distinct table cutoffs, the 35 degree checks,
and the uniform `n≥36` row, each with its required proof certificate. This count uses those named certificates and
introduces no separate unspecified small-degree input. The ADS roadmap owns generic
ideal-indexed Euler-product and absolute-convergence contracts; the native theorem used here is
`TauCeti.dedekindZeta_eulerProduct_hasProd` in
`TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean`, with hypothesis `Re(s)>1`. LFunctions and ZerosOfLFunctions own the completed zeta and
explicit-formula analytic interfaces.

4. **Fixed-signature finiteness for arithmetic lattices, with the signature domain explicit (L7.4).**
   For each arithmetic lattice `Γ` in the sense of L7.1, let `g,c≥0`, `r≥0`, and `m_j≥2`. Put
   `A=2π(2g−2+Σ_j(1−1/m_j)+c)`. If `A≤0`, prove directly from Gauss–Bonnet that no
   hyperbolic Fuchsian lattice has this signature. For the remaining (and only) case `A>0`, put
   `r₀=2g+r+c` and `C_sig=2^r₀ A`. The presentation has at most `r₀` generators, so
   `[Γ:Γ^(2)]≤2^r₀` and `Area(Γ^(2)\ℍ²)≤C_sig`.
   - Assume `Γ` is arithmetic as defined in L7.1. Consume L7.3's
     `squared_trace_integrality_of_commensurable_arithmetic_group` to obtain integrality of
     `tr(η̃)` for every `η∈Γ^(2)`. Identify the arithmetic trace envelope with `B` as proved in
     L7.3. Let `π:B¹(k)→B¹(k)/{±1}` be projectivization. L7.3's commensurability invariance,
     conjugation transport and arithmetic trace-envelope identification place `Γ^(2)` inside this
     projective image. Its full norm-one preimage `H_Γ=π⁻¹(Γ^(2))` contains both central signs, has `k`-span `B` by L7.3's concrete span
     definition, and has integral reduced trace on every element. Apply the named
     `integral_trace_lattice_order` to `H_Γ`, then extend that order to a maximal order `O`.
     Thus `Γ^(2)≤Λ=Γ(O)` and `Area(Λ\ℍ²)≤Area(Γ^(2)\ℍ²)≤C_sig`.
   - In the division case write `Δ=|d_k|`, `n=[k:ℚ]`, and `F={𝔭∈Ram_f(B)}`. Consume
     the native ADS-module theorem `TauCeti.dedekindZeta_eulerProduct_hasProd` only in its stated region
     `Re(s)>1`; prove absolute convergence and specialize at `s=2` to obtain
     `ζ_k(2)≥1`. Also prove `∏_{𝔭∈F}(N𝔭−1)≥1`; the maximal-order formula gives the
     explicit inequalities
     `8π Δ^(3/2)/(4π²)^n ≤ C_sig`, hence
     `Δ ≤ (C_sig(4π²)^n/(8π))^(2/3)`. Use the direct all-signature estimate-(5) theorem for
     L7.4's finite candidate enumeration. The sharper totally-real Table 2/4 bound is separately
     owned by L7.6 and is not an input to L7.4 or its T8 consumer.
     From L7.3b’s weakening obtain
     `C_sig≥8π·10^(−51)·(58.6^(3/2)/(4π²))^n`. Certify
     `58.6^(3/2)/(4π²)>10` using rational bounds on π, hence
     `C_sig≥24·10^(n−51)`. Choose an integer N with
     `24·10^(N−51)>C_sig` by the Archimedean property; then n<N.
     Combine this degree bound with the displayed discriminant upper bound
     to obtain one finite field list before enumerating ramification.
     `∏_{𝔭∈F}(N𝔭−1)≤M_ram(C_sig):=C_sig(4π²)^n/(8π)`; thus every `𝔭∈F` has
     `N𝔭≤1+M_ram(C_sig)`. These numerical inequalities and rational certificates are targets to prove,
     not assumed library results.

   - Consume Mathlib `NumberField.finite_of_discr_bdd`, on finite-dimensional
     intermediate fields of one fixed extension of `ℚ`. Embed the totally real fields in
     `ℂ` (or a fixed algebraic closure), transport their discriminants, and deduce finiteness
     of field isomorphism classes under the displayed discriminant bound. For each field, prove that only finitely many prime ideals have norm at
     most `1+M_ram(C_sig)` (use a finite-rank integral-basis quotient argument, explicitly formalized
     here); hence only finitely many finite ramification sets. For global quaternion classification, consume QFI's local quaternion-symbol and invariant
     interfaces and CFT Layer 10's ABHN Brauer-invariant sequence. This is classification of
     degree-two central simple algebras by Brauer invariants; it does not invoke or duplicate
     GlobalQuadraticForms' classification of quadratic forms. Specialize the local invariants to `0,1/2`;
     the ramified real places together with finite ramification must have even cardinality.
     Conversely, assign invariant `1/2` at any allowed even finite set of real/finite places
     and `0` elsewhere. ABHN produces a Brauer class; this layer also proves the degree-two
     representative adapter. For a nonempty ramification set consume GlobalNumberFields L1's
     `weakApproximation_denseRange` for mixed real/finite completions. Apply it to negative
     real elements and nonempty open sets of locally nonsquare finite-place elements, obtaining
     `a∈kˣ` and a quadratic field `L=k(√a)` nonsplit at every ramified place. This layer owns
     that nonsquare/sign application and the local-degree-two place bookkeeping. Consume CFT's
     local restriction formula (`inv_restrict`, with its `invMap_brRes` Brauer comparison):
     restriction multiplies the local invariant by the local degree. Prove its specialization
     here makes every invariant zero, and apply CFT Layer 10's ABHN over `L` to split the class.
     Consume SSA Layer 6 for the splitting-field and relative Brauer-kernel facts. QFI 7B supplies the
     degree-`[L:k]` crossed-product representative, `cocycleOfSplitting`, crossed-product/class
     comparison, and `brauerCohomologyEquiv_quaternionClass`; specialize these interfaces to the quadratic extension
     and identify the resulting cyclic algebra with the quaternion symbol `(a,b)_k`. Prove only
     the degree-two representative adapter here; do not redo QFI's cocycle computation or
     cohomology equivalence. For the empty set use `M₂(k)`. Deduce uniqueness from CFT's local-invariant
     injectivity and equal-degree central-simple-algebra classification: SSA Layer 4 proves
     `A≃Mₙ(D)` and `finrank A=(deg A)²`; SSA Layer 6 proves uniqueness of the division
     representative. Thus equal Brauer class and equal degree identify the quaternion algebras. The generic approximation, invariant
     restriction and crossed-product theorems retain these supplier owners.
   - Prove finiteness of maximal-order conjugacy/type classes as follows. For a maximal order
     `O`, form `G=PGL₁(B)` and the subgroup `U` which is the image in `G(𝔸_(k,f))` of the
     normalizer of `Ō`. Prove `U` compact open after quotienting the scalar centre, using the
     local normalizer descriptions. Prove local conjugacy of maximal orders and the integral
     localization/gluing theorem; then construct a bijection from
     `G(k)\G(𝔸_(k,f))/U` to global maximal orders modulo `Bˣ`-conjugacy. Consume
     AdelicAlgebraicGroups AA.3.4 `class-number-finite` (`Reduction.finite_classes`) for this
     compact open subgroup. This layer owns the centre conventions, compact-open and order-class
     bijection adapters; it does not replace them by a definite quaternion class-set theorem.
     Handle the split case separately with its exact covolume formula and noncompact signature;
     for a fixed hyperbolic signature it contributes only when the signature is noncompact.
   - This yields a finite explicit list of candidate norm-one lattices `Λ`. The orbifold
     presentation gives a generating set of size `d=2g_Λ+r_Λ+c_Λ`; from
     `A_Λ=2π(2g_Λ−2+Σ_{j=1}^{r_Λ}(1−1/m_{Λ,j})+c_Λ)≤C_sig`, use `Σ_{j=1}^{r_Λ}(1−1/m_{Λ,j})≥r_Λ/2` to derive
     `d≤A_Λ/π+4≤C_sig/π+4`, hence `d≤floor(C_sig/π+4)`. For each candidate,
     `K=Γ^(2)≤Λ` and area scaling give
     `[Λ:K]=Area(K\ℍ²)/Area(Λ\ℍ²)≤C_sig/Area(Λ\ℍ²)`. Let
     `M_Λ=floor(C_sig/Area(Λ\ℍ²))`; this is a finite index bound, with global bound the maximum over
     the finite candidate list. Obtain a generating set for each `Λ` from its orbifold signature
     presentation. If its size is `d`, explicitly count its index-`m` subgroups by at most
     `m·(m!)^d`: encode the coset action by `d` permutations and the image of a distinguished
     coset. Sum this bound for `1≤m≤M_Λ`. Thus only finitely many `K` occur; this gives the
     bounded-covolume theorem for these arithmetic norm-one lattices without an unnamed subgroup
     estimate.
   - For each such `K`, prove first that `N_PSL(K)` is discrete. If `n_i→1` in the
     normalizer, discreteness of `K` forces `n_iγn_i^{-1}=γ` eventually for each member of a
     finite generating set of `K`; the centralizer of a non-elementary lattice in `PSL₂(ℝ)`
     is trivial. The quotient by this discrete overgroup has finite area. If it is compact, use
     L4a's compact lower bound `π/21`; if it has at least one cusp, use
     `minimum_area_finite_area_orbifold` for the stronger lower bound `π/3`. In either case its
     area is at least `π/21`, so area scaling gives
     `[N_PSL(K):K]≤Area(K\ℍ²)/(π/21)<∞`. Since `K◁Γ` and `[Γ:K]≤2^r₀`, `Γ/K`
     embeds in this finite quotient, so only finitely many overgroups `Γ` recover the
     original signature.
     Convert maximal-lattice counts between PSL and PGL using the explicit index-two map, and keep
     the maximal-normalizer comparison required in item 2 separate from this final overgroup
     argument. This proves fixed-signature finiteness up to `PSL₂(ℝ)`-conjugacy, with the chosen splitting quantified. The associated algebraic embeddings are compared in `PGL₂(ℝ)`.

5. **Independent sharp totally-real discriminant bound (L7.6; not an input to L7.4).**
Prove the sharper totally-real bound `Δ≥a₀R₀^n`, where `a₀=2439/10^7` and `R₀=29.099`.
Its proof is the unconditional Odlyzko Tables 2 and 4 route below; it is separate from the
all-signature estimates in L7.3b and is not used in the L7.4 enumeration or Teichmuller T8.
Use Odlyzko's author-hosted unconditional Tables 2 and 4 (Nov. 29, 1976; files
`https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.table2`,
`https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.table4`, and description
`https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.tables.txt`). For the unconditional Table 4 kernel,
define `h(t)=1+cos(πt)` on `|t|≤1` and zero otherwise; prove
`H=h∗h/3`, where
`H(x)=((2−x)(1+cos(πx)/2))/3+sin(πx)/(2π)` on `0≤x≤2`, extended evenly by zero. This gives
`H≥0` and `Fourier(H)=|Fourier(h)|²/3≥0`. For `|a|<1/2`, compute the Fourier density of
`cosh(ax)/cosh(x/2)` as
`2π cosh(πt) cos(πa)/(sinh²(πt)+cos²(πa))`, which is nonnegative; at `|a|=1/2` the
quotient is the constant `1`, whose Fourier transform is a positive point mass. Hence for
every nontrivial zero `ρ=β+iγ`, the real zero term is the Fourier transform at `γ` of the
positive-definite product
`H(x/b) cosh((β−1/2)x)/cosh(x/2)`, and is nonnegative. Prove conjugation symmetry of
Dedekind-zeta zeros with multiplicity and group conjugate zeros to conclude the full zero sum
is real and nonnegative. Define
`J_ℝ(b)=(1/(2πi))∫_(1+δ) (logDeriv Γ_ℝ)(s)(Φ_b(s)+Φ_b(1−s)) ds` with
`Γ_ℝ(s)=π^(−s/2)Γ(s/2)` from ZLF 1.4, prove that the totally-real archimedean term is
`nJ_ℝ(b)`, and prove `J_ℝ(b)∈ℝ` from the real-valued even kernel and the conjugation/reflection
symmetry of the completed real gamma factor. Establish this before ordering `exp(−J_ℝ(b))` in
the interval certificates. Derive the finite real-integral identity, with Euler's constant `γ_E`,
`J_ℝ(b)=−log π−γ_E+2∫_0^(2b) (e^(−2u)−e^(−u/2)H(u/b)/cosh(u/2))/(1−e^(−2u)) du−log(1−e^(−4b))`.
The quotient integrand has removable endpoint value `−3/4` at `u=0`. Prove this identity
by shifting the gamma contour to `Re(s)=1/2`, using the digamma integral, Fourier inversion,
and the exact tail integral beyond `2b`; the `W^{5,1}` transform bound and the combined
digamma kernel's `O(1+log(2+|t|))` integral bound justify the interchange. Use this compact
real quadrature, with a proved endpoint extension, explicit integration error bounds and
directed enclosures for constants, logarithms and exponentials, to certify the table's
archimedean lower estimates. The pole contribution is exactly
`Φ_b(0)+Φ_b(1)=2∫_ℝ H(x/b) dx=8b/3`, since `∫h=2` and `H=h∗h/3`. Specialize the
provider's Weil formula
`Σ_ρ Φ_b(ρ)=Φ_b(0)+Φ_b(1)+(log D)φ_b(1)+A_K(φ_b)−P_b`; use `φ_b(1)=1`,
`A_K=nJ_ℝ`, and `P_b=f` to derive
`log D=Σ_ρΦ_b(ρ)−8b/3−nJ_ℝ(b)+f`, where both zero and prime sums are nonnegative.
Therefore the exact analytic root is `exp(−J_ℝ(b))`; prove the certified interval bounds
`exp(−J_ℝ(b))≥A_table`, `E_table≥8b/3` for each displayed rational lower bound `A` and
upward-rounded `E`, with interval certificates that establish the required inequalities. The kernel
prime sum is nonnegative by `H≥0`. For each of the 31 distinct Table 2 cutoffs through
`n₀=36`, use its
matching Table 4 row and certify `A exp(−E/n₀)>B` by directed intervals. The required
source-data tuples `(n₀,b,B;A,E)` are:

| `n₀` | `b` | `B` | `A` | `E` |
|---:|---:|---:|---:|---:|
| 1 | .420 | .996 | 3.055 | 1.1201 |
| 2 | .900 | 2.222 | 7.379 | 2.4001 |
| 3 | 1.350 | 3.609 | 11.985 | 3.6001 |
| 4 | 1.750 | 5.062 | 16.259 | 4.6667 |
| 5 | 2.050 | 6.514 | 19.441 | 5.4667 |
| 6 | 2.350 | 7.926 | 22.526 | 6.2667 |
| 7 | 2.600 | 9.279 | 24.987 | 6.9334 |
| 8 | 2.850 | 10.568 | 27.327 | 7.6001 |
| 9 | 3.100 | 11.787 | 29.534 | 8.2667 |
| 10 | 3.300 | 12.941 | 31.202 | 8.8001 |
| 11 | 3.400 | 14.034 | 32.002 | 9.0667 |
| 12 | 3.600 | 15.068 | 33.536 | 9.6001 |
| 13 | 3.800 | 16.044 | 34.984 | 10.134 |
| 14 | 3.900 | 16.971 | 35.676 | 10.401 |
| 15 | 4.000 | 17.849 | 36.347 | 10.667 |
| 16 | 4.200 | 18.684 | 37.629 | 11.201 |
| 17 | 4.300 | 19.479 | 38.241 | 11.467 |
| 18 | 4.400 | 20.234 | 38.833 | 11.734 |
| 19 | 4.600 | 20.954 | 39.964 | 12.267 |
| 20 | 4.700 | 21.642 | 40.502 | 12.534 |
| 21 | 4.800 | 22.299 | 41.024 | 12.801 |
| 22 | 4.900 | 22.929 | 41.529 | 13.067 |
| 23 | 5.000 | 23.531 | 42.018 | 13.334 |
| 24 | 5.100 | 24.109 | 42.492 | 13.601 |
| 25 | 5.200 | 24.664 | 42.951 | 13.867 |
| 26 | 5.300 | 25.196 | 43.395 | 14.134 |
| 28 | 5.400 | 26.203 | 43.826 | 14.401 |
| 30 | 5.600 | 27.138 | 44.646 | 14.934 |
| 32 | 5.800 | 28.008 | 45.415 | 15.467 |
| 34 | 5.900 | 28.821 | 45.782 | 15.734 |
| 36 | 6.100 | 29.582 | 46.482 | 16.267 |

For `n≥n₀`, monotonicity of `A exp(−E/n)` gives the row's root bound. For the 35 degrees
`1≤n≤35`, take the last cutoff at or below `n` and verify by exact rational arithmetic
`B_n^n>a₀R₀^n`; certify that the smallest ratio is at degree 9 and exceeds `1.20369`.
For all `n≥36`, the last row gives `D^(1/n)>29.582>29.099` and `a₀<1`. This proves
`Δ≥a₀R₀ⁿ` with `a₀=2439/10⁷`, `R₀=29.099`; the sharp-bound proof remains separate from
the estimate-(5) finite-candidate enumeration.

The ZLF 8.4 interface consumed by the independent sharp-bound target is the explicit formula for
`φ : ℝ → ℝ` with `ContDiff ℝ ∞ φ` (smoothness with `open scoped ContDiff`),
`HasCompactSupport φ`, and `tsupport φ ⊆ Ioi 0`. Prove the L7 smoothing lemma and invoke
this interface at that same smooth class.
For each `b>0`, put `F_b(x)=H(x/b)/cosh(x/2)` on `|x|≤2b` with its zero extension outside,
and `φ_b(y)=y^(−1/2)F_b(log y)` for `y>0`, with zero extension for `y≤0`. Prove
`tsupport φ_b=[e^(−2b),e^(2b)]`, `φ_b(1)=H(0)=1`, evenness in logarithmic coordinates,
and the stated smooth compactly-supported test functions approximate `φ_b` in `W^{5,1}`
with a common compact support inside `Ioi 0`. The Mellin transform is exactly
`Φ_b(s)=φ̃_b(s)=∫_ℝ F_b(x)e^((s−1/2)x) dx`; `F_b` is compactly supported, `C⁴`, and has fifth weak
derivative in `L¹`. Even compactly supported mollifications converge in `W^{5,1}` with a
common compact support bound. Five integrations by parts give uniform
`O((1+|t|)^(−5))` transform decay on every fixed vertical strip, in particular the zero strip
`0≤Re(s)≤1` and the explicit-formula contours `Re(s)=1+δ` and `Re(s)=−δ`; the zero sum then
converges uniformly by ZLF's `N_K(T)=O_K(T log T)` count, while the finite prime-power sum
and gamma term pass to the limit by compact support and the same decay. This gives the Table 4 formula without
strengthening the generic ZLF test-function API. L7.3b’s 1977 equation-(12) Stark route
provides the separate proof of Odlyzko's Theorem 1 and estimate (5).

**Supplier boundary.** NFA supplies number fields, embeddings, rings of integers, discriminants,
prime ideals and residue norms. The native Tau Ceti theorem
`TauCeti.dedekindZeta_eulerProduct_hasProd` is implemented in the ADS module
`TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean` and applies for
`Re(s)>1`; the generic ADS roadmap specifies ideal-indexed Euler products and
absolute-convergence infrastructure. Neither contract supplies analytic continuation or a
functional equation; those remain with LFunctions and ZerosOfLFunctions. GNF mixed weak approximation is used in exactly two places: the surjectivity step in Voight
29.11.1 and the choice of `a` defining `k(√a)` nonsplit at the specified ramified places.
QFI Layer 0 supplies the local quadratic-form representation criterion. GQF Layers 0.1/0.2
supply localization and local predicates; GQF Layer 6.1 supplies the local-global scalar-
representation theorem. L7 owns `global_reduced_norm_localization`: identify the localization of
the global form `Nrd_B` with `Nrd_{B⊗k k_v}` and transport the local representation hypotheses
through that equality. GQF does not supply a reduced-norm comparison. CFT Layer 10 supplies ABHN and local invariant restriction; QFI supplies local
quaternion symbols and the generic crossed-product/Brauer-cohomology comparison; SSA Layers 4
and 6 supply the matrix-over-division representative, degree formula, and uniqueness. This layer
owns the quaternion degree-two representative construction and its local-global adapter; GQF
form classification is not used to classify central simple algebras, which uses Brauer invariants.

RG2.2.2 supplies the reduced GL₂ building and its conversion from the enlarged carrier; RG2.2.1's
`Building.exists_fixedPoint_of_bounded` is on the enlarged building; RG2.2.4
supplies the `BTTree` type function, `type_smul` and `sl2_preserves_type`. These are distinct
carriers, not a ready-made building/tree equivalence. L7 proves their comparison and the
order-to-vertex/edge adapter. A fixed point in the building may be an edge midpoint. For a
type-preserving compact tree subgroup, prove that a fixed midpoint forces both endpoints to be
fixed and hence obtains a fixed vertex; bounded fixed points are not already tree vertices. LocalFieldsRamification
supplies local fields, valuation rings, and finite residue fields. LFunctions Layer 3 supplies the completed Dedekind-zeta continuation, poles, residues and
functional equation. ZerosOfLFunctions supplies Layer 1.4’s logarithmic derivative of `Γ_K`,
Layer 3.4 finite-order/growth, Layers 4.8 the zero-counting estimate, Layers 5 and 5.6
Hadamard factorization and the grouped zero logarithmic derivative. The ZLF 8.4 supplier
interface consumed by L7.6 is the Weil explicit formula for smooth `ContDiff ℝ ∞` test functions
with compact support in `Ioi 0` under `open scoped ContDiff`. The L7 smoothing adapter
constructs inputs in exactly that class. Layer 7.6 specializes these analytic interfaces to Odlyzko's sharp bound and owns
its specialization and numerical certificates; L7.3b owns the separate all-signature estimate-(5) route. AA.2.4 supplies the normalized Tamagawa
measure and quotient-volume interface; Layer 7 separately proves `τ(SL₁(B))=1` by its
quaternionic adelic zeta-integral calculation.  AA.3.4 supplies compact-open adelic
class-number finiteness; AA.4.2 supplies strong approximation for simply connected absolutely
almost simple groups under its noncompact-place hypothesis. This layer proves the
`PGL₁(B)` compact-open-normalizer model, the order-class double-coset bijection, the
quaternion-specific local volumes, and the conversion to hyperbolic area before consuming those
interfaces. For L7, GNF mixed weak approximation is used in the named Voight 29.11.1 and nonsplitting
adapters. Layer 8 proves its coordinate-density and order-to-group commensurability adapters from the L7 arithmetic input; these adapters are not L7 exports.
SemisimpleAlgebras and RepresentationTheory supply finite-dimensional matrix density, which L7 applies to its trace
envelope. QuaternionicModularForms §0.3 treats totally definite algebras; its finite class set
is not the one-real-split order-class adapter required here. This layer owns quaternion orders
and norm-one groups, arithmetic normalizers, square-generated invariant algebra and recovery,
and the full fixed-signature count.

**Source spine:** Takeuchi, “Arithmetic Fuchsian groups with signature `(1,e)`,” Theorem 2.1
(arbitrary full signature); Belolipetsky–Gelander–Lubotzky–Shalev, “Counting Arithmetic Lattices
and Surfaces,” §§2–5; Maclachlan–Reid, *The Arithmetic of Hyperbolic 3-Manifolds*, §11.3.1;
Vignéras, *Arithmétique des algèbres de quaternions*. Maclachlan–Reid Theorem 11.3.1 gives the
Fuchsian bounded-covolume proof, using the square-subgroup and maximal-order argument of Theorem
11.2.1 and the totally-real Odlyzko bound on p. 346. The explicit discriminant estimate is also stated in A. M. Odlyzko, “Lower Bounds for
Discriminants of Number Fields. II,” *Tohoku Mathematical Journal* 29 (1977), 209–216,
Theorem 1, estimates (4) and (5): the inequalities are on p. 210 and their parameter tables
are on p. 215. Page 216 instead contains the table for conditional estimate (6)
(<https://www.jstage.jst.go.jp/article/tmj1949/29/2/29_2_209/_pdf/-char/en>). Those references guide the proof;
the realization, arithmetic estimates and finiteness adapters remain explicit targets here.

## Layer 8: the arithmetic commensurator criterion and PGL passage

For `G=PSL₂(ℝ)` or `PGL₂(ℝ)`, define `Comm_G(Γ)` by commensurable intersection. The theorem is
for lattices and uses the arithmetic predicate and invariant data of Layer 7. Prove that
commensurability is an equivalence relation, is preserved by conjugation, and is unchanged under
finite-index subgroup replacement. Prove `Comm_G(Γ)` is a subgroup, contains `Γ`, and is unchanged
when `Γ` is replaced by a commensurable subgroup. In particular, if finite-index subgroups of
`Γ` are conjugate by `a∈G`, then `a∈Comm_G(Γ)`; this is the conjugacy-to-commensurator implication consumed in Layer 9.

1. **Discrete/dense dichotomy.** For every finite-covolume lattice `Γ≤PSL₂(ℝ)`, prove
   `Comm_PSL(Γ)` is dense iff `Γ` is arithmetic; if it is not dense, prove it is discrete. For the
   arithmetic-to-dense direction, let `B/k` be the quaternion algebra and `v₀` its distinguished
   split real place. A `k`-basis of `B` maps to an `ℝ`-basis of `B⊗_(k,v₀)ℝ≃M₂(ℝ)`; since
   `ℚ⊂k` is dense in `ℝ`, coordinatewise rational approximation proves `B(k)` is dense in
   `M₂(ℝ)`. The open set of positive determinants is therefore approximated by `g∈Bˣ(k)` with
   `Nrd(g)>0`; projectivization maps this set densely onto `PSL₂(ℝ)`. For each such `g`, prove
   `O` and `gOg⁻¹` are full orders with finite-index intersection. If `mO` lies in that
   intersection, the kernel of `O¹→(O/mO)ˣ` has finite index in `O¹` and lies in
   `(gOg⁻¹)¹`; reverse the roles to obtain commensurability. Thus the projective image of `g`
   commensurates `Γ(O)`, and hence any arithmetic `Γ` commensurable with it. For the converse
   topological step, take the closure `H` of the commensurator.
   Prove that if `H` is nondiscrete then its positive-dimensional identity component is normalized
   by `Γ`; use the closed-subgroup theorem and the adjoint irreducibility of a nonelementary
   subgroup of `PSL₂(ℝ)` to show its Lie algebra is all of `sl₂(ℝ)`, hence `H=PSL₂(ℝ)`. Thus a
   nondense commensurator is discrete. Finally prove a discrete overgroup containing a lattice
   has finite index by covolume scaling.
2. **Dense-commensurator arithmeticity.** Own the converse criterion for a finite-covolume lattice
   `Γ≤PSL₂(ℝ)` as a staged theorem. Do not assume at the outset that its squared-trace field is
   a number field or that its invariant algebra splits at the places being considered.
   Use the definitions of `Γ^(2)` and `K₀=ℚ(tr(γ̃²):γ∈Γ)` fixed in Layer 7.3. Consume
   Layer 7.3's proved finite-index, finite-generation, and trace-identity adapter theorems, along
   with `invariant_squared_trace_data_finite_index` and
   `invariant_squared_trace_data_commensurable`. These outputs include the identification
   `K₀(Γ)=ℚ(tr(η̃):η∈Γ^(2))`, the quaternion envelope, finite-index invariance, conjugation
   transport, and commensurability invariance for arbitrary nonelementary finitely generated
   subgroups. Layer 8 proves none of these statements again. Apply the commensurable theorem to the
   common finite-index intersection for each commensurator element before comparing
   representations.

   Before quantifying over places, prove that `K₀/ℚ` is algebraic and hence finite. The proof
   target `dense_commensurator_squared_trace_field_is_number_field` must include the following
   transcendence contradiction, not treat the number-field conclusion as an input. Consume
   Layer 7's four-dimensional trace-character envelope `A_Γ` over the finitely generated field
   `K₀`. Prove the needed scalar-extension statement: after an embedding `σ:K₀→ℂ`, the
   representation is absolutely irreducible, so the finite-dimensional matrix-density theorem
   identifies `A_Γ⊗_{K₀,σ}ℂ` with `M₂(ℂ)`. For an embedding `σ:K₀→ℂ`, split the scalar
   extension and obtain the associated projective representation
   `ρ_σ:Γ^(2)→PGL₂(ℂ)`. If `K₀` had positive transcendence degree, choose a transcendental
   generator among a finite trace-generating set and an embedding `σ` sending its value to a
   complex number of modulus large enough that the corresponding projective trace invariant
   `tr(A)^2/det(A)` has modulus greater than `4`. This image is unbounded and Zariski dense:
   it is faithful, and a proper algebraic subgroup of `PGL₂(ℂ)` is virtually solvable, whereas
   `Γ^(2)` is not virtually solvable.

   Prove, without assuming `K₀` algebraic and without invoking a general rank-one superrigidity
   theorem, the specialized commensurator-extension lemma for such unbounded Zariski-dense
   representations arising from an embedding of the concrete trace envelope into a split
   scalar extension `A_Γ⊗_{K₀}K≃M₂(K)`, for `K=ℝ,ℂ`, and for nonarchimedean local fields of characteristic zero at split finite places. First construct the algebraic extension
   on the commensurator. For `c∈Comm(Γ)`, the common finite-index subgroup, exact concrete
   envelope equality, and conjugation transport from L7.3 give `c A_Γ c⁻¹=A_Γ` inside
   `M₂(ℝ)`; conjugation fixes each scalar in `K₀` pointwise. Apply Skolem–Noether over this
   field, without assuming it algebraic, to obtain `b_c∈A_Γˣ`, unique modulo `K₀ˣ`, with
   `Ad(b_c)=Ad(c)` on `A_Γ`. Uniqueness gives `[b_cd]=[b_c b_d]`, so
   `c↦[b_c]` is a homomorphism into `PGL₁(A_Γ)(K₀)`. Denote the resulting extension by
   `T_ext`, so `T_ext(c)=[b_c]`; use this notation in the continuity argument below. Its split scalar extension gives the exact projective conjugators and restricts to `ρ_σ` on `Γ^(2)`. Use the boundary pair and
   characteristic-map uniqueness below to prove continuity of this algebraically defined map,
   then extend to `PSL₂(ℝ)`. State the extension theorem with these trace-envelope hypotheses and prove it is nontrivial exactly
   when the original image is unbounded;
   prove uniqueness after fixing its restriction to the finite-index lattice subgroup.

   For the boundary construction, own the boundary-pair data for `G=PSL₂(ℝ)` and its
   finite-covolume lattices. Put `∂₊=∂₋=G/P≃∂ℍ²` with Lebesgue measure class, and prove
   amenability from amenability of the minimal parabolic `P`. Prove that the diagonal action of
   `G` on `∂₋×∂₊` is isometrically ergodic: identify the generic ordered-pair orbit as `G/A′`,
   where `A′` centralizes a maximal split torus; prove the stabilizer action needed for the
   homogeneous-space criterion by Mautner contraction; and formalize the measurable-field,
   induction, and finite-index-lattice inheritance adapters. The resulting diagonal
   `Γ`-action is isometrically ergodic for every separable metric `Γ`-space with isometric action.
   The product measure class is quasi-invariant, not an invariant probability measure.

   For a local field `K` of characteristic zero, put `J=PGL₂(K)` and equip J with its convergence action on
   `ℙ¹(K)`. Prove properness on ordered triples of distinct points and the convergence property
   that, for each fixed probability measure μ, an escaping sequence has a subsequence whose
   pushforwards of μ converge to a measure supported on at most two points. For every projective representation
   `ρ:Γ→PGL₂(K)` with unbounded Zariski-dense image, replace the target by the closure of
   `ρ(Γ)` acting on its minimal limit set, and prove the specialized Bader–Furman
   characteristic-map theorem. Amenability constructs probability maps
   `𝔭_±:∂_±→Prob(ℙ¹(K))`. For almost every `(x,y)`, form the product measure
   `𝔭_-(x)×𝔭_+(y)×(𝔭_-(x)+𝔭_+(y))/2` on triples and restrict it to the open configuration
   space `Y=(ℙ¹(K))^{(3)}` of pairwise distinct triples. If this restricted measure has positive
   mass, normalize it to a measurable equivariant map `∂_-×∂_+→Prob(Y)`. Prove the induced
   action of J on Prob(Y) is proper; prove its orbit quotient is standard Borel.
   Ergodicity then puts any such map in one orbit `J/C_J` with compact stabilizer `C_J≤J`. To use
   isometric ergodicity, construct a nonzero `C_J`-invariant compactly supported `L²(J)` function by
   Haar averaging; prove its left-translation stabilizer is compact and that the orbit map
   `J/C_J→L²(J)` is measurable and equivariant. Isometric ergodicity makes this composite constant,
   so ρ(Γ) lies in that compact stabilizer, contradicting unboundedness. Therefore the off-diagonal mass vanishes almost everywhere, and
   `supp 𝔭_-(x)∪supp 𝔭_+(y)` has at most two points for almost every pair. Prove the support
   dichotomy: either both probability fields are Dirac-valued almost everywhere or the image
   preserves a set of one or two points. Zariski density excludes the latter. Define their
   measurable equivariant point maps `φ_±:∂_±→ℙ¹(K)`. Now the coincidence set
   `E_coinc={(x,y):φ₋(x)=φ₊(y)}` is Γ-invariant, so ergodicity makes it null or conull. In the conull
   case Fubini makes both maps essentially one common constant, hence an equivariant fixed
   point of the Zariski-dense image, a contradiction. Their values are therefore distinct for
   almost every pair. Prove uniqueness by
   averaging any two equivariant probability fields and applying the same dichotomy; their
   average is Dirac-valued, so the fields agree almost everywhere.

   Prove the specialized commensurator-extension step from the characteristic-map uniqueness.
   For each commensurator element use its class `[b_c]` from the concrete trace-envelope
   Skolem–Noether construction above. On the common finite-index lattice subgroup this class
   intertwines the two projective representations exactly. Conjugating and precomposing the
   boundary map gives another equivariant probability map; finite-index inheritance of the
   boundary uniqueness theorem identifies it with the original Dirac map. Compatibility is
   already supplied by `[b_cd]=[b_c b_d]`. If comparing two chosen linear lifts on a subgroup `Δ`, first prove
   their discrepancy is a homomorphism `χ:Δ→{±1}`; it vanishes on `Δ^(2)`, which remains
   finite index by finite generation. This lift-comparison lemma is separate from the exact
   projective trace-envelope construction.
   Prove continuity by the convergence-detection criterion of Bader–Furman Lemma 4.2 in these
   carriers. Choose a probability representative `m` of the boundary measure class and put
   `η=(φ₊)_*m`. Prove `supp(η)` is the minimal limit set of `ρ(Γ)` and has more than two points.
   If `g_n{}_∗η→η` but `(g_n)` escapes compact subsets of `PGL₂(K)`, the convergence property
   gives a subsequential limit supported on at most two points, a contradiction; hence `(g_n)` is
   relatively compact. For each nonidentity `g∈PGL₂(K)`, full support of `η` and nontriviality
   of its action give continuous functions `u,v` with
   `∫(u∘g−u)v dη≠0`. These are exactly the two hypotheses that make convergence of the matrix
   coefficients `∫(u∘g_n−u)v dη→0` detect `g_n→1`. From equivariance,
   `T_ext(c_n)𝔭₊(x)=𝔭₊(c_nx)` almost everywhere; continuity in measure of the boundary action gives
   convergence of these coefficients when `c_n→1`. Therefore `T_ext(c_n)→1`. Extend uniquely from
   the dense commensurator to a continuous homomorphism `PSL₂(ℝ)→PGL₂(K)`. For nonarchimedean `K`, connectedness and total
   disconnectedness make this extension trivial. For `K=ℝ` or `ℂ`, prove the specialized
   classification of nontrivial continuous homomorphisms with Zariski-dense image as the standard
   real projective representation or its complexification. Keep the boundary-pair proof,
   characteristic-map construction, uniqueness, and continuity criterion as owned lemmas with
   their measurable and topological hypotheses; do not invoke general rank-one superrigidity.

   Comparing projective trace invariants gives `σ(tr(η̃))²=(tr(η̃))²` for each `η∈Γ^(2)`.
   In particular for `η=γ²` and `t=tr(γ̃²)` it gives `σ(t)²=t²`. In the transcendence step
   choose a transcendental generator `t` and the embedding with both `|σ(t)|²>4` and
   `σ(t)²≠t²`; this is a contradiction. Hence `K₀` is algebraic; finite generation then makes it a number field.
   This establishes the places used next, rather than using completions to prove their own existence.

   The same envelope `A_Γ` is now over a number field and its projective norm-one group contains
   a finite-index subgroup of `Γ`. Only now quantify over places. At each place `v`, the local target is
   `PGL₁(A_Γ⊗_{K₀}(K₀)_v)`, not unconditionally `PGL₂((K₀)_v)`. At split places identify it
   with `PGL₂((K₀)_v)`; at finite or real division places it is compact; at a complex place it
   is `PGL₂(ℂ)`. The identity real place is split and gives the original lattice representation.
   Treat the local images as follows:
   (a) At split finite places separate relatively compact and unbounded images. In the unbounded
   case prove Zariski density and apply the commensurator-extension lemma above, now with target
   boundary `ℙ¹((K₀)_v)`, its precise measure class and non-elementarity hypotheses. The same
   boundary-pair characteristic-map theorem supplies measurable probability-map uniqueness for
   each finite-index subgroup; do not replace it with pointwise minimality or a separate
   Moore-ergodicity claim. A connected
   group has trivial continuous image in the totally disconnected target, contradicting an
   unbounded Zariski-dense image.
   (b) At each archimedean place use the proved extension lemma and classify continuous
   homomorphisms to its actual local group. At a nonidentity real split place, an unbounded image
   would extend to the standard projective representation. For every `η∈Γ^(2)`, trace comparison
   fixes `σ(tr(η̃))²=(tr(η̃))²`, hence fixes `tr(η̃²)+2`. These values generate `K₀(Γ^(2))`;
   Layer 7's finite-index invariance identifies this field with `K₀(Γ)`. Thus `σ` fixes `K₀`, a
   contradiction; the image is compact. Compact subgroups of `PGL₂(ℝ)` are
   virtually solvable, while `Γ^(2)` embeds faithfully and is not virtually solvable, so such a
   split place is impossible. At a complex place an unbounded image is likewise ruled out by the
   complexified-standard-extension trace comparison. The remaining image is compact. Conjugate
   it into `PU₂`; each reduced-norm-one lift of an element of `Γ^(2)` is then `±U` for some
   `U∈SU₂`, so its trace is real. For each `η∈Γ^(2)`, compactness gives `σ(tr(η̃))∈ℝ`, hence
   `σ(tr(η̃²)+2)∈ℝ`. The elements `tr(η̃²)+2` generate `K₀(Γ^(2))`; by Layer 7 finite-index
   invariance this is `K₀(Γ)`. Thus `σ(K₀)⊆ℝ`, contradicting that this is a complex place. Thus no complex places exist. A real division place has compact local group. It follows
   that `K₀` is totally real and `A_Γ` is split at exactly the distinguished real place.
   (c) At every finite place the lattice image is relatively compact; do not assert compactness
   of the full commensurator. At a finite division place, use the unique maximal order `𝒪_B` in
   the local quaternion division algebra: a reduced-norm-one lift `x` has
   `v_B(x)=v_k(nrd(x))/2=0`, hence lies in `𝒪_B^×`; its reduced trace is integral in `𝒪_v`.
   At a split finite place, if the image is unbounded, apply the nonarchimedean version of the
   commensurator-extension lemma, with target boundary `ℙ¹((K₀)_v)` and its precise measure
   class, non-elementarity and measurable-uniqueness hypotheses from the owned boundary-pair
   theorem. The extension
   of connected `PSL₂(ℝ)` to a totally disconnected target is trivial, a contradiction, so the
   image is relatively compact. Then use
   `Γ^(2)`: every generator that is a square has a lift of reduced norm one, so its determinant
   valuation is zero and it preserves the two vertex types of the Bruhat–Tits tree; products
   preserve type as well. A compact type-preserving subgroup fixes a vertex (not merely an edge
   midpoint), and after conjugacy lies in `PGL₂(𝒪_v)`. For every `η∈Γ^(2)`, choose a reduced-norm-one matrix lift `X`. A vertex stabilizer gives an
     integral invertible matrix lift `A` of the same projective element, so `X=λA` for some scalar `λ`
     and `λ² det(A)=1`. Since `det(A)` is a unit, `λ` is a unit and `tr(X)∈𝒪_v`. Thus every
     reduced trace `tr(η̃)` is integral at this split finite place. The same conclusion at finite
     division places was proved in the preceding finite-place subgroup/vertex argument. Intersect over all finite places to see that every `tr(η̃)` is in `𝒪_{K₀}`. Under the chosen
   splitting, projectivize `A_Γ¹` by its central subgroup `{±1}` and regard `Γ^(2)` as a subgroup
   of that projective image by the embedding defining `A_Γ`. Let `H_Γ` be its full preimage.
   This subgroup contains both central signs and its `K₀`-span is `A_Γ` by definition. Apply
   L7.3's `integral_trace_lattice_order` to `H_Γ` to obtain the order used in (d).
   (d) Complete Takeuchi extraction: prove finite ramification obeys ABHN and the trace-generated
   order's norm-one projective group is commensurable with `Γ`. Give both finite-index inclusions
   and the local-global ramification argument. This is the arithmetic model used in Layer 7.
   Prove all stages as specialized targets; do not assume the number field, split matrix models,
   algebraicity, or blanket rank-one superrigidity as free premises. The discrete case uses the
   finite-index result above.
3. **Projective extension.** Prove `PSL₂(ℝ) ◁ PGL₂(ℝ)` has index two and
   `Comm_PGL(Γ) ∩ PSL = Comm_PSL(Γ)`. If no orientation-reversing element belongs to the
   PGL commensurator, then `Comm_PGL(Γ)=Comm_PSL(Γ)`. Otherwise choose an orientation-reversing
   `a∈Comm_PGL(Γ)` and prove
   `Comm_PGL(Γ)=Comm_PSL(Γ) ∪ a·Comm_PSL(Γ)`; the PGL commensurator is the subgroup and its
   coset, not the coset alone. Establish discreteness in the nonarithmetic case from this
   finite-index reduction; do not apply the connected-group theorem to disconnected PGL.
4. **Maximality consequence.** If a nonarithmetic finite-covolume lattice is maximal among discrete
   subgroups of `PGL₂(ℝ)`, prove `Comm_PGL(Γ)=Γ`. Maximality is only used after discreteness of
   the commensurator is established.

**Supplier boundary.** Layer 7 supplies arithmeticity data, covolume and index. Layers 0 and 2
supply the effective actions, discreteness and area. Use [LieGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/6fcb5d07e8c415c19d70876c0d4b1e6a40ab76e5/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md)' named closed-subgroup and continuous-homomorphism automatic-smoothness theorems;
RG2.2.1's `Building.exists_fixedPoint_of_bounded` on the enlarged building together with
RG2.2.4's `BTTree.type_smul` and `sl2_preserves_type`, plus L7's building/tree and midpoint-to-vertex adapters; GNF mixed weak approximation only in the L7 instances named above; and
SemisimpleAlgebras/RepresentationTheory for finite-dimensional matrix density. Layer 8 owns the
specialized boundary-map construction, measurable uniqueness, boundary-pair ergodicity comparison,
and low-dimensional subgroup/homomorphism classifications used here. TeichmullerGeometry T0
consumes Fuchsian L2’s projective action for its hyperbolic isometry model; T7/T9 consume the
listed quotient, signature and area interfaces. Layer 9 consumes maximality from this layer.

**Source spine:** Margulis, *Discrete Subgroups of Semisimple Lie Groups*, Chapter IX, and the
source article's cited 1974 ICM theorem. The hypotheses and the two directions are stated above;
this layer proves the specialized two-dimensional interface.

## Layer 9: the p85 order-32 Gassmann application

Layer 9 consumes Fuchsian L2.1's projective PGL action, L5's topological genus and covering
formulas, and L8's commensurator criterion. For each `g≥3`, consume TeichmullerGeometry T10's
common-generic-locus theorem to choose a
closed hyperbolic surface `S₀=ℍ²/Γ₀` with `Γ₀` torsion-free and cocompact, trivial full
conformal/anticonformal isometry group, nonarithmetic uniformizing lattice, and maximality
among discrete PGL overgroups. By Layer 8, `Comm_PGL(Γ₀)=Γ₀`.

Use the explicit finite group `Q=(ℤ/8ℤ)ˣ⋉(ℤ/8ℤ)` with product
`(u,a)(v,b)=(uv,a+ub)` and subgroups
`H₁={(1,0),(3,0),(5,0),(7,0)}` and
`H₂={(1,0),(3,4),(5,4),(7,0)}`. Prove `|Q|=32`, `|Hᵢ|=4`, equality of the subgroup
intersection counts with every conjugacy class, nonconjugacy, and generation by
`(1,1),(3,0),(5,0)`. Formalize the finite carrier and multiplication in this layer, then prove
these finite facts as named declarations `p85AffineGroup`, `p85H₁`, `p85H₂`,
`p85AlmostConjugate`, `p85_not_conjugate`, and `p85_generates`. Prove the named IR2.1
adapter `AlmostConjugate p85H₁ p85H₂` from `p85AlmostConjugate`, using IR2.1's `ConjClasses`
intersection-cardinality predicate. This is the specific p85 pair, not InductionRestriction's
separate `S₁₆` pair. Consume only the generic IR2.1 almost-conjugacy/permutation-module
equivalence; this layer owns the concrete pair and its formal finite verification.

Use the geometric surface-group convention fixed by TeichmullerGeometry T4a:
`Π(S₀):=(π₁ⁿᵃᵗ(S₀,x₀))ᵐᵒᵖ`, whose multiplication is first-traverse-then-second-traverse.
Choose the marking isomorphism `Π(S₀)≃Γ₀` and the standard positively oriented polygon
presentation in that convention. Send three `a`-generators to the displayed triple
`(1,1),(3,0),(5,0)` and every other `a`- or `b`-generator to `1`; the displayed triple
satisfies the polygon relation, so this defines the surjection `φ:Γ₀↠Q`. This use of `Π`,
rather than an unqualified native `π₁`, keeps the attaching-word order consistent with the
positive geometric polygon relation and T4a's holonomy convention. Put `Γ=ker φ` and
`Γᵢ=φ⁻¹(Hᵢ)`. Then `Γ◁Γ₀`,
`Γᵢ/Γ≃Hᵢ`, and `[Γ₀:Γᵢ]=8`; the common regular cover is required, while the intermediate
groups need not be normal in `Γ₀`. Since `Γ₀` is torsion-free and cocompact, so are `Γ` and
all `Γᵢ`. The unbranched covers `Sᵢ=ℍ²/Γᵢ→S₀` have genus `8g−7` by Layer 5.

Before applying the finite-cover comparison, descend the hyperbolic metric along the free,
properly discontinuous isometric action of `Γ` to `X=ℍ²/Γ`; prove `X` compact and connected.
The deck group `Q=Γ₀/Γ` acts freely by isometries on `X`. For every `H≤Q`, prove that the
canonical identity-induced map `X/H→ℍ²/φ⁻¹(H)` is a bijective isometry for the quotient metrics.
Separately identify `X→X/H` as the finite regular covering with deck group `H`.
Before invoking any Laplacian or Sobolev-domain interface, construct the quotient carrier as a
closed, connected smooth surface and descend the hyperbolic metric. Prove the Γ action is free,
proper and isometric; prove the finite quotient maps are smooth finite regular covers and local
isometries, and identify their deck actions. Use RiemannianGeometry R4.7's quotient-metric,
covering and smooth-manifold results and TeichmullerGeometry T9’s
`RiemannianIsometry(H²)≃PGL₂(ℝ)` identification and isometry-lifting adapter, consuming R4.7’s generic lifting interface. All quotient groups and maps have been defined
before this metric comparison is used.

Apply the finite-index quotient-`L²` unitary adapter of NQS M1 and the finite-deck scalar
Laplacian transplantation theorem of PDO P7a. Prove the ambient unitary equivalence separately
from scalar isospectrality with multiplicity. Since `Γ₀` is maximal in PGL,
`Comm_PGL(Γ₀)=Γ₀`. Lift an isometry between the intermediate surfaces to `c∈PGL₂(ℝ)`
with `cΓ₁c⁻¹=Γ₂`. Because both Γᵢ have finite index in Γ₀, prove `c∈Comm_PGL(Γ₀)=Γ₀`.
Applying φ then conjugates H₁ to H₂ in Q, a contradiction. This proves the p85 existence statement without claiming a particular coordinate
model for the generic lattice.

### L9.1. Exact marked genericity and full commensurator input

Consume the following precise T9/T10 interfaces on the analytic marked Teichmüller carrier of the fixed closed oriented genus-`g≥3` surface. T9 constructs the finite family of normal subgroups `N◁Π` of index at most `(168(g−1))!`, their marked regular covers `p_N:Σ_N→Σ`, and holomorphic embeddings `Φ_N:Teich(Σ)→Teich(Σ_N)` onto the fixed loci of `Q_N=Π/N`. The deck identification uses T4a's endpoint/opposite-group convention, and its outer action is represented by `n↦γnγ⁻¹` for `γN∈Q_N`. The fixed-locus identification includes the extension argument `L_Q≃E_Q≃Π`, torsion-freeness and freeness of the realized deck group, orientation of the descended marking by finite-cover degree, global injectivity by the trivial centralizer of `N`, and the holomorphic local inverse by the quadratic-differential trace identity `p_*p^*=[Π:N] id`. These are T9 targets for the fixed marked cover.

For every mapping class `a∉Q_N`, T9 proves `Φ_N⁻¹(Fix(a))` is closed nowhere dense. At a fixed point put `F=⟨Q_N,a⟩` in the finite point stabilizer. If `F⁺>Q_N`, the subgroup inclusion gives the finite holomorphic map `Σ_N/Q_N→Σ_N/F⁺` of degree `e=[F⁺:Q_N]≥2`, with no normality assumption on `Q_N≤F⁺`. Its source is a smooth genus-`g` surface. With quotient genus `h` and cone orders `m₁,…,m_r`, L5 gives `2g−2=e(2h−2+Σ(1−1/m_i))`. Positivity and `m_i≥2` imply `r≤2g+2−4h`. T7's invariant-quadratic-differential/Serre-duality/Riemann–Roch theorem gives dimension `3h−3+r`; its codimension in the deck fixed locus is at least `g+h−2>0`. This treats every proper orientable orbifold cover, including nonregular covers and low quotient genus. In genus two equality occurs at the hyperelliptic degree-two cover with signature `(0;2,2,2,2,2,2)`, which is why the generic input starts at genus three.

If `F⁺=Q_N`, the remaining coset induces an antiholomorphic involution on the deck fixed locus, with fixed real dimension `3g−3<6g−6` by T7's finite-action real linearization. This includes free orientation-reversing isometries. The mapping-class indexing sets are countable, so T5's complete metric gives the countable Baire exclusion. T3's finite compact transporters make the closed fixed-locus family locally finite; the finite normal-core family therefore yields the stronger open dense FULL-PGL-maximal locus. Its overgroup correspondence uses the minimum compact orientable orbifold area `π/21` from L4a and the index bound `168(g−1)`.

For arithmetic removal, T8 consumes the full L7.4 fixed-signature theorem in signature `(g;−)`. Finitely many unmarked arithmetic classes lift to finitely many countable mapping-class orbits on marked Teichmüller space. Proper discontinuity makes these orbits locally finite and closed, so their complement is open dense. T10 intersects this complement with T7's full automorphism-free locus and T9's full-PGL-maximal locus. This argument uses the marked topology and Baire/local-finiteness theorems, and proves a nonempty open dense common locus.

Finally L8 proves `Comm_PSL(Γ₀)` discrete for this nonarithmetic lattice. The positive-determinant part of `Comm_PGL(Γ₀)` is exactly `Comm_PSL(Γ₀)` and has index at most two; hence the full commensurator is discrete as well. Full PGL maximality then gives `Comm_PGL(Γ₀)=Γ₀`. Equivalently, after orientation-preserving maximality, a reversing commensurator would normalize `Comm_PSL(Γ₀)=Γ₀` and descend to a forbidden anticonformal isometry. Thus all unoriented isometries are included in the nonisometry conclusion.

### L9.2. Finite pair and quotient transport checks

For the specified pair Q,H₁,H₂ above, prove the conjugation formula `(u,a)(v,b)(u,a)⁻¹=(v,ub+(1−v)a)`. The eleven class representatives in lexicographic order are `(1,0),(1,1),(1,2),(1,4),(3,0),(3,1),(5,0),(5,1),(5,2),(7,0),(7,1)`; their sizes are `1,4,2,1,4,4,2,4,2,4,4`, and both subgroup-intersection sequences are `1,0,0,0,1,0,1,0,0,1,0`. This gives the named almost-conjugacy adapter against every native `ConjClasses` class. Nonconjugacy follows because a conjugate of H₁ matching H₂ would require the translation `a≡2 mod4` from its unit-3 element and `a` odd from its unit-5 element. The normal forms `(1,1)^a(3,0)^j(5,0)^k=(3^j5^k,a)` for `0≤a<8`, `j,k∈{0,1}` prove generation. Prove both subgroup cores trivial before exporting the two coset actions as faithful actions. Their common eight-coset character sequence in the same class order is `8,0,0,0,2,0,4,0,0,2,0`, derived either from the native fixed-point formula or direct fixed-coset counting.

L9 owns the quotient-in-stages identification `X/H≃ℍ²/φ⁻¹(H)` as a smooth Riemannian isometry, including the fact that its underlying map is induced by the identity on `ℍ²`. The action of Q on X is free: if a coset fixes a Γ-orbit, adjust its lift by Γ to obtain an element of torsion-free Γ₀ fixing a point of `ℍ²`, hence the identity. Finite subgroups H act freely and properly by smooth isometries. R4.7 supplies their smooth quotient, the descended metric and covering/local-isometry theorem; L9 proves the comparison to its particular Fuchsian quotient. The common regular cover is compact, connected, smooth and boundaryless before NQS M1 or PDO P7a is applied.

Use Riemannian volume consistently. For `π_H:X→X/H` the normalized scalar pullback is `J_H=|H|^(−1/2)π_H^*`; its isometry follows from the degree-`|H|` integration formula. PDO P7a supplies quadratic-form, Sobolev-domain, resolvent and nonnegative scalar-Laplacian transport and yields equality of multiplicities. For the ambient comparison take `G=PSL₂(ℝ)` and the right-regular representations on `L²(Γᵢ\G)`; its finite left deck action on `L²(Γ\G)` commutes with the right G action because `Γ◁Γ₀`. Normalize Haar measure with probability Haar measure on `K=PSO(2)` and quotient measure on `G/K=ℍ²` equal to hyperbolic area. NQS M1 separately supplies the ambient right-regular quotient-L² unitary equivalence using this quotient normalization and finite left deck action. The concrete finite pair belongs to L9, generic almost-conjugacy/permutation equivalence to IR2.1, and generic spectral/ambient comparison to those respective analytic owners.

**Dependency order:** the section-level graph is `Fuchsian L1,L2,L4,L5 → TeichmullerGeometry T7`;
`Fuchsian L1/L2.1/L4/L4a/L5 → TeichmullerGeometry T9`; `Fuchsian L7.4 → TeichmullerGeometry T8`;
`T7,T8,T9 → T10`; and `T0,T4a,T9,T10,Fuchsian L8,RiemannianGeometry R4.7 → Fuchsian L9`.
Fuchsian L0–L8 have no Teichmuller dependency. L9 also consumes IR2.1, NQS M1's finite-index
quotient adapter, and PDO P7a's finite-deck scalar transplantation theorem.

## Dependency order and parallel work

| Track | Depends on | Feeds |
| --- | --- | --- |
| L0 effective action and free locus | Mathlib, complex manifolds | L1--L4 |
| L1 elliptic charts | L0, complex-manifold gluing | L4--L6 |
| L2 polygons and presentations | L0, conformal mapping, R4.7 native/generic models plus owned L2.1 coordinate/tensor/distance/volume comparison | L3--L4, L6, Teich T0 |
| L3 cusps and q-coordinates | L0, L2 | L4--L6 |
| L4 compactification | L1--L3 | L5--L6 |
| L5 degree theory and applications | complex analysis, SurfaceTopology Layers 5 and 8, PlanarTopology surface invariants, GeometricTopology Layer 1 smooth/finite-CW comparison, native Riemann-surface degree APIs, L4 | L6, Teich T7/T9, modular forms |
| L6 level-one example | L0--L5, modular forms | normalized `X(1) ≃ P^1` |
| L4a compact and finite-area minima | L4, integer-signature minimization | compact area ≥ `π/21` for T9; cusp area ≥ `π/3` for L7 normalizer indices |
| Teichmuller T7 | Fuchsian L1, L2, L4, L5, Teichmuller deformation/moduli theory | marked-surface mapping-class interface |
| Teichmuller T9 | Fuchsian L1/L2.1/L4/L4a/L5, Teichmuller deformation/moduli theory | open dense maximal PGL locus for `g≥3` |
| L7.3b all-signature Odlyzko estimates (4)/(5) | LFunctions LF3, ZLF 1.4/3.4/4.8/5/5.6 and exact rational certificates | both-signature discriminant estimates, consumed by L7.4 |
| L7.4 fixed-signature arithmetic finiteness | NFA/ADS/GNF, ThetaSeries Layers 1, 2A, 2C, LFunctions LF3, ZLF 1.4/3.4/4.8/5/5.6, QFI, CFT, SSA Layers 3, 4 and 6, GQF Layers 0.1/0.2/6.1, LocalFieldsRamification, RG2.2.1/2.2.2/2.2.4, AA.2.4/3.4/4.2, L0--L5, L4a | fixed-signature arithmetic lattice finiteness consumed by T8 |
| L7.6 sharp Odlyzko Table 2/4 theorem | LFunctions LF3, ZLF 1.4/3.4/4.8/5/5.6/8.4 and ThetaSeries smoothing adapters | sharp totally-real discriminant bound; parallel to the T8 path |
| L8 commensurator | L0, L2, L7, LieGroups, RepresentationTheory/SemisimpleAlgebras, RG2.2.1/2.2.2/2.2.4 | finite-covolume PSL/PGL commensurator criterion |
| Teichmuller T8 | Fuchsian L7.4, Teichmuller deformation/moduli theory | fixed-genus torsion-free arithmetic finiteness |
| Teichmuller T10 | Teichmuller T7, T8, T9, Teichmuller deformation/moduli theory | common generic locus for L9 |
| L9 p85 application | L2.1, L5, L8, Teich T0/T4a/T9/T10, RiemannianGeometry R4.7, IR2.1, NQS M1, PDO P7a | genus `8g−7` examples and both equivalences |

The dependency order follows the section graph above: L2+R4.7→T0; L1,L2,L4,L5→T7; L1,L2.1,L4,L4a,L5→T9; L7.4→T8;
T7,T8,T9→T10; and T0,T4a,T9,T10,L8,R4.7 plus the stated IR2.1/NQS M1/PDO P7a interfaces→L9. L1 and L2 can proceed in parallel after L0. The local q-coordinate calculation in L3 can proceed
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
- In Layer 7, `A≤0` signatures are discharged as impossible before any positive covolume bound is
  used; all arithmetic estimates state `A>0`, `m_j≥2`, totally-real field, division/split case,
  and constant hypotheses exactly.
- The L7 field/discriminant, finite-ramification, maximal-order-type, subgroup-index/count, and
  finite-normalizer steps each have named proof targets; no unnamed bounded-covolume count is
  accepted.
- Layer 8 proves the finite-covolume PSL dichotomy, the closed-subgroup density/discreteness step,
  the index-two PGL passage and applies maximality only after commensurator discreteness is proved.
- Layer 9 follows `T0,T4a,T9,T10,L8,R4.7→L9`, uses IR2.1 only for generic permutation equivalence,
  and keeps the concrete p85 pair in L9.
- The concrete quotient surfaces in PDO P7a are proved closed connected smooth Riemannian
  surfaces, with finite regular covering and local-isometry structures, before smooth, Sobolev,
  Friedrichs-domain or spectral arguments are used.
- The two transplantation adapters remain distinct: NQS M1 proves ambient right-regular
  representation equivalence; PDO P7a proves scalar Laplace isospectrality.

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
- Uri Bader and Alex Furman, “Boundaries, rigidity of representations, and Lyapunov exponents,”
  *Annals of Mathematics* 193 (2021), 213–246, arXiv:1404.5107, Definition 2.3, Theorem 2.5,
  Lemma 2.6, Theorem 3.2 and Lemma 4.2: <https://arxiv.org/abs/1404.5107>.
- Armand Borel, “Commensurability classes and volumes of hyperbolic 3-manifolds,” *Ann. Scuola
  Norm. Sup. Pisa* (4) 8 (1981), for arithmetic lattice volume/classification methods.
- Gopal Prasad, “Volumes of S-arithmetic quotients of semi-simple groups,” *Publ. Math. IHÉS* 69
  (1989), for covolume methods.
- Belolipetsky, Gelander, Lubotzky, and Shalev, “Counting arithmetic lattices and surfaces,”
  *Annals of Mathematics* 172 (2010), 2197–2221, §§2–5.
  <https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p17-p.pdf>.
- A. M. Odlyzko, “Discriminant bounds” (Nov. 29, 1976), author-hosted unconditional Tables 2 and 4
  and table description: <https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.table2>,
  <https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.table4>,
  <https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.tables.txt>. Their rows guide
  L7's explicit-formula interval certificates; they are not imported conclusions.
- John Voight, *Quaternion Algebras*, Graduate Texts in Mathematics 288, Springer, 2021,
  Chapter 29, especially Main Theorems 29.10.1(c), 29.11.3 and Lemma 29.11.1,
  <https://link.springer.com/chapter/10.1007/978-3-030-56694-4_29>. L7 proves the stated
  quaternion-specific residue, quotient-volume and Tamagawa specializations from this route.
- André Weil, *Adeles and Algebraic Groups*, for the adelic Tamagawa-number argument specialized
  in L7 to `SL₁(B)` with the AA.2.4 normalization.


## Secondary implementation provenance

The exact rational data for the L7.3b estimate-(4)/(5) numerical audit is recorded in
`root-odlyzko-estimates4-5-all-signatures-certificate-20261016T173212Z` in the source-evidence
collection. The definitive coefficient lists, polynomial/Bernstein comparisons and analytic
proof obligations are stated in L7.3b itself; this audit is not a Lean proof.
