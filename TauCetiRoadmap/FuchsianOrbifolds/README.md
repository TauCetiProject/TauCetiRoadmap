# Roadmap: Fuchsian groups and orbifold Riemann surfaces

**Summary.** A Fuchsian group is a discrete subgroup Γ of PSL(2,ℝ), acting on the upper half-plane ℍ
by Möbius transformations that preserve the hyperbolic metric and the area y⁻² dx dy. This roadmap
builds the geometry of these actions and their quotients, for the effective action of PSL(2,ℝ),
under which every point stabilizer of a Fuchsian group is a finite cyclic group. It constructs the
coarse quotient Γ\ℍ as a Riemann surface, smooth also at the elliptic points (the points with
nontrivial stabilizer), where the quotient map is z ↦ zᵐ in suitable coordinates. It constructs
cusps with normalized scaling data and q-coordinates, hyperbolic polygons with side pairings, and
the Riemann surface X(Γ) obtained by adjoining one point for each cusp orbit. Γ is cofinite when its
covolume, the area of a fundamental domain, is finite. Genus is topological, read off the Euler
characteristic through χ = 2 − 2g; a statement involving a genus assumes that the surface has finite
CW type, the hypothesis under which its Euler characteristic is defined.

The headline theorems are these.

- If Γ is cofinite, X(Γ) is a compact connected Riemann surface. The quotient Γ\ℍ is open and dense
  in it, and each cusp has a chart given by its q-coordinate.
- A finite holomorphic map f : X → Y of compact connected Riemann surfaces satisfies the
  Riemann–Hurwitz formula 2g(X) − 2 = deg f · (2g(Y) − 2) + Σₓ (eₓ − 1), where eₓ is the local
  multiplicity of f at x.
- Let Γ be cofinite, with g the genus of X(Γ), m₁, …, mᵣ the stabilizer orders of its elliptic
  orbits and c the number of its cusp orbits. Then the covolume of Γ is
  2π(2g − 2 + Σᵢ (1 − 1/mᵢ) + c). Every cofinite Fuchsian group has covolume at least π/21, with
  equality exactly when the signature (g; m₁, …, mᵣ; c) is (0; 2, 3, 7). A cofinite group with a cusp
  has covolume at least π/3, with equality exactly for (0; 2, 3; 1), the signature of PSL(2,ℤ).
- The level-one quotient X(1) of PSL(2,ℤ) is constructed as a compact Riemann surface first. The
  modular invariant j then descends to a holomorphic map X(1) → P¹ of degree one, hence a
  biholomorphism, sending the orbits of ρ = exp(2πi/3) and i to 0 and 1728.

Mathlib supplies the upper half-plane with its distance, its invariant measure and the action of
GL(2,ℝ). The Tau Ceti library supplies the effective PSL(2,ℝ) action, the Poincaré metric and the
half-space model, Euler characteristics of spaces of finite CW type, the degree theory of finite
holomorphic maps and the normalized modular invariant. ComplexManifolds supplies the oriented real
surface underlying a Riemann surface and the quotient and gluing framework that the charts here
specialise. AlgebraicTopology supplies finite CW type of compact smooth manifolds, also with marked
points, and Poincaré duality. ModularForms consumes the compactified quotients, the degree theory,
the genus and X(1) ≃ P¹.

Layers 0–4 build the action, the elliptic charts, the metric and polygons, the cusps and the
compactification. Layer 5 proves Riemann–Hurwitz and the area formula, Layer 4a the minimal areas,
and Layer 6 treats level one.

## How to read the build

Layers 0–4 construct the quotients in order, and the construction orders of Layers 4 and 6 are
normative. A section that states a target says *Prove* and carries a *Needs:* line listing what
its statement and its route use, item by item, so that a target proved by another route is not
blocked behind an unrelated layer. The other sections fix, by their library names, the objects and
facts on which the targets rest. Layers 2 and 3 interleave by section. The cusp points, cusp
orbits, cusp data, horodiscs, q-coordinates and q-expansion criterion of Layer 3 use Layer 0. The
finiteness of the cusp orbits of a cofinite group also uses the cofiniteness of §2.1, and uses no
polygon. §§2.2, 2.5 and 2.6 state their cusp facts with these Layer 3 notions. Only the compact part
of the quotient outside the horodiscs, in §3.3, uses the convex polygons of §2.2. §§5.1–5.3 concern
arbitrary compact Riemann surfaces and can proceed in parallel with Layers 0–4; §§5.4–5.7 begin
after Layer 4. Layer 4a follows §5.7, and Layer 6 uses Layers 0–5. Layers 1 and 2 can proceed in
parallel after Layer 0.

## Conventions

1. **The group and its action.** `PSL(2, R)` is Mathlib's `Matrix.ProjectiveSpecialLinearGroup
   (Fin 2) R`, the quotient of `SL(2, R)` by its centre. Its action on Mathlib's `UpperHalfPlane`,
   written ℍ, is the factor of Mathlib's `SL(2, R)` action, the instance
   `UpperHalfPlane.instMulActionPSL2`. Results about stabilizers use this effective action, never
   an `SL(2, R)` lift, in which the central element `−1` fixes every point. The action of
   `GL(2, ℝ)` is Mathlib's `UpperHalfPlane.glAction`: `A = [[a, b], [c, d]]` acts by
   `z ↦ (az + b)/(cz + d)` when `det A > 0` and by `z ↦ (a conj z + b)/(c conj z + d)` when
   `det A < 0` (through complex conjugation `UpperHalfPlane.σ A`).
2. **Fuchsian groups.** A Fuchsian group is a `Γ : Subgroup PSL(2, ℝ)` with
   `[DiscreteTopology Γ]` for the subspace topology. No structure repeats a subgroup, a topology,
   an action and a discreteness field. Proper discontinuity is a theorem from that input (§0.3).
   `Γ` is *cofinite*, `Subgroup.IsCofinite`, when it is discrete of finite covolume.
3. **Area, distance and covolume.** Hyperbolic area is `MeasureTheory.volume : Measure ℍ`, whose
   density `y⁻² dx dy` is `UpperHalfPlane.volume_def`. Hyperbolic distance is Mathlib's `dist` on ℍ
   (`UpperHalfPlane.dist_eq`), the distance of the curvature `−1` metric `|dz|/y`, so that
   `dist(i, 2i) = log 2`. The covolume of a discrete `Γ` is `MeasureTheory.covolume Γ ℍ`, the area
   of any measurable fundamental domain. No second invariant measure is constructed.
4. **Quotients and stabilizers.** Quotients are `MulAction.orbitRel.Quotient`, and projections are
   the quotient maps. Invariant functions descend through these quotients, and no choice of a
   quotient section enters any construction. The projection of the free locus is a covering map and
   a local biholomorphism, and the full coarse quotient is not claimed to be a covering at elliptic
   points. Stabilizers are `MulAction.stabilizer Γ z`. The order of an elliptic point is the
   cardinality of its stabilizer, which is finite and cyclic, and is read from the derivative action
   in a local disc coordinate (§0.4).
5. **Cusps and cusp data.** A cusp is an orbit of a parabolic fixed point in Mathlib's boundary
   carrier `OnePoint ℝ`. A cusp datum, `Subgroup.CuspDatum`, stores the following: an actual
   representative `c`; a projective scaling `σ` with `σ(c) = ∞`; a selected positive generator `γ`
   with `⟨γ⟩ = stabilizer Γ c`; and a width `w > 0` with `σγσ⁻¹(z) = z + w`. The conjugated full
   stabilizer is then exactly `wℤ`, and a proper power of `γ`, although conjugate to a positive
   translation, is not a valid generator. Width belongs to the datum and is not an invariant of the
   bare cusp. Take two data with the same cusp representative and selected positive generator, with
   `σ′(z) = aσ(z) + b` for some `a > 0`. Then `w′ = aw`, and the q-coordinates satisfy
   `q′ = exp(2πib/(aw)) q` (§3.4). The complex structure of the compactification does not depend
   on this choice (§4.3).
6. **q-coordinates and meridians.** The coordinate attached to the datum `(σ, w)` is
   `q(z) = exp(2πiσ(z)/w)`, and the selected generator fixes it. Meridians are
   counterclockwise-positive around `q = 0`. A lift of the meridian with `n` signed turns ends at the
   `n`th power of the selected generator applied to its starting point, not at a power of its
   inverse, and reversing a meridian negates `n` (Tau Ceti's
   `TauCeti.Subgroup.CuspDatum.meridian_lift_endpoint` and `TauCeti.Subgroup.CuspDatum.meridian_neg`).
7. **Elliptic charts.** An elliptic chart uses a coordinate centred at the fixed point, in which a
   generator of the stabilizer acts by a primitive `m`th root of unity. The quotient coordinate is
   `u = zᵐ`, and the ramification order is defined from this local normal form of the map.
8. **The compactification.** `X(Γ)` is the inductive disjoint sum `Γ.CompactifiedQuotient`
   (`Subgroup.CompactifiedQuotient`) of the coarse quotient and the cusp orbits
   `Subgroup.CuspOrbit Γ`. Its constructors are `Subgroup.CompactifiedQuotient.ofQuotient`, from
   `MulAction.orbitRel.Quotient Γ UpperHalfPlane`, and `Subgroup.CompactifiedQuotient.ofCusp`, from
   `Subgroup.CuspOrbit Γ`. It comes with the equivalence `Subgroup.CompactifiedQuotient.equivSum`
   with the corresponding `Sum`. Its topology glues punctured cusp neighbourhoods across the two
   constructors, and its charts are proved afterwards. The carrier is neither opaque nor identified
   by definition with `P¹`, a torus or another classified surface. The carrier written
   `CompactifiedQuotient Γ` in other roadmaps is `Γ.CompactifiedQuotient`.
9. **Signature.** The orbifold signature `(g; m₁, …, mᵣ; c)` of a cofinite `Γ` is derived from three
   objects: the genus `g` of `X(Γ)`; the stabilizer orders `mᵢ` of the elliptic orbits
   `Subgroup.ellipticOrbits`, the orbits whose points have nontrivial stabilizer; and the number `c`
   of cusp orbits. Statements continue to expose these objects. The cell count `χ(X(Γ)) = 2 − 2g` is
   kept distinct from the orbifold Euler characteristic
   `χ_orb = 2 − 2g − Σᵢ (1 − 1/mᵢ) − c = −covolume Γ / 2π`.
10. **Finite holomorphic maps.** The local multiplicity, degree, divisor pullback and degree-one
    biholomorphism of a finite holomorphic map are the `TauCeti.RiemannSurface` declarations of
    §5.2. The degree is the fibre sum of the local multiplicities, not a field of a map record. The
    ramification degree is `R(f) = Σₓ (eₓ − 1)`, so the double cover `z ↦ z²` of the sphere has
    `R = 2`.
11. **Genus.** Genus is topological: `genus X = (2 − χ(X))/2`, truncated at `0`, for Tau Ceti's
    Euler characteristic `TauCeti.eulerChar` of a space of finite CW type (`TauCeti.FiniteCWType`).
    It is never the analytic `dim H¹(X, 𝒪)` of ModularForms §10B. Layer 5 uses no modular form, no
    analytic genus, no Riemann–Roch theorem, no automorphy sheaf and no dimension formula.
12. **The Riemann sphere.** `P¹` is the Riemann sphere `OnePoint ℂ` with Tau Ceti's atlas
    `OnePoint.instChartedSpace`, whose charts are `z ↦ z` away from `∞` and `z ↦ z⁻¹` away from
    `0`. A quotient becomes `P¹` only through a named biholomorphism, proved after the quotient has
    been compactified. From the theory of modular forms, Layer 6 takes only the normalized
    `j`-function, its invariance, its q-expansion and its orders at the elliptic points.
13. **What a construction exposes.** Compactness, the orbifold signature, presentations, degrees and
    the biholomorphism `X(1) ≃ P¹` are theorems about the constructed objects. A structure whose
    fields assert any of them does not meet the roadmap. No unrelated permutation action is
    exported as a second action on ℍ.
14. **Names and homes.** `Suggested.lean` states the headline theorems in the namespace
    `TauCetiRoadmap.FuchsianOrbifolds`. It exports `genus` and `riemannHurwitz` as
    `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`; `RiemannSurface.genus` is the name
    under which PseudoholomorphicCurveAnalysis and NoncongruenceModularForms cite the genus of §5.1.
    Every backticked declaration name that `Suggested.lean` does not declare is a Mathlib or Tau
    Ceti declaration, listed in the supplier contracts; a few, such as `glAction`, `toPGL` and
    `jSphere`, are written in the layers by their last component after their full name. The
    suggested homes are `TauCeti/Analysis/Complex/Fuchsian/` for groups, polygons, cusps, quotient
    charts and the compactification, and `TauCeti/Analysis/Complex/RiemannSurface/` for genus and
    Riemann–Hurwitz.

## Layer 0: the effective projective Möbius action

### 0.1 Second countability of PSL(2,ℝ)

Mathlib defines `PSL(2, ℝ)` as the quotient of `SL(2, ℝ)` by its centre, so the quotient map is
Mathlib's algebraic quotient map by definition. The quotient topology, the topological-group
structure and the Hausdorff property are Mathlib's `QuotientGroup.instTopologicalSpace`,
`QuotientGroup.instIsTopologicalGroup` and `QuotientGroup.instT2Space`, the last because the centre
is closed. Prove that `PSL(2, ℝ)` is second countable, as an instance
`SecondCountableTopology PSL(2, ℝ)`, together with the instance for `SL(2, ℝ)` on which it rests.
The route goes through Mathlib's `Matrix.SpecialLinearGroup.isClosedEmbedding_val`, which makes
`SL(2, ℝ)` a subspace of `Matrix (Fin 2) (Fin 2) ℝ`. That matrix space carries the product
topology of `Fin 2 → Fin 2 → ℝ` and is second countable, so `SL(2, ℝ)` is second countable.
Mathlib's `QuotientGroup.instSecondCountableTopology` then passes this to the quotient. The
derivation from these two Mathlib declarations is this roadmap's own (Beardon, Chapters 7–8;
Katok, §§2.1–2.4).
*Needs:* Mathlib `Matrix.SpecialLinearGroup.isClosedEmbedding_val`,
`QuotientGroup.instSecondCountableTopology`.

**Checks.**

- The centre of `SL(2, ℝ)` is `{±1}`, so the quotient map identifies exactly `A` and `−A`. It is
  open, as every quotient map by a subgroup is, so it carries a countable basis of `SL(2, ℝ)` to a
  countable basis of `PSL(2, ℝ)`.
- `SL(2, ℝ)` is a closed three-dimensional submanifold of `ℝ⁴`, and the countable family of
  rational balls of `ℝ⁴` meets it in a countable basis; the same holds for every `SL(n, ℝ)`.
- With the discrete topology, `PSL(2, ℝ)` would be a Hausdorff topological group but not second
  countable, since it is uncountable. Second countability is a property of the quotient topology,
  not of every group topology.

### 0.2 The GL(2,ℝ) action and its isometries

The canonical homomorphism `PSL(2, ℝ) → PGL(2, ℝ)` is Mathlib's
`Matrix.ProjectiveSpecialLinearGroup.toPGL`. Mathlib's `UpperHalfPlane.glAction` (Convention 1)
descends to `MulAction PGL(2, ℝ) ℍ`, and this action is faithful (`FaithfulSMul PGL(2, ℝ) ℍ`,
`Mathlib/Analysis/Complex/UpperHalfPlane/FixedPoints.lean`). The `PSL(2, ℝ)` action is Tau Ceti's
`UpperHalfPlane.instMulActionPSL2` (`Analysis/Complex/UpperHalfPlane/PSL/Action.lean`). Its
compatibility with the `SL(2, R)` action is `UpperHalfPlane.pslMk_smul`, and its agreement with the
restriction of `glAction` along `toPGL` is `UpperHalfPlane.toPGL_smul`. Its faithfulness is the
instance `FaithfulSMul PSL(2, ℝ) ℍ` of the same file. Joint continuity and isometry are the
instances `ContinuousSMul PSL(2, ℝ) ℍ` and `IsIsometricSMul PSL(2, ℝ) ℍ` of
`UpperHalfPlane/ProperAction.lean`, and holomorphy of every element is
`UpperHalfPlane.instContMDiffConstSMulPSL2` (`UpperHalfPlane/PSL/Manifold.lean`).

Prove that every element of `GL(2, ℝ)` acts on ℍ by an isometry of `dist`, as an instance
`IsIsometricSMul (GL (Fin 2) ℝ) ℍ` (Beardon, Chapters 7–8; Katok, §§2.1–2.4). Route: an element of
positive determinant acts as an element of `SL(2, ℝ)`, an isometry by Mathlib's
`IsIsometricSMul SL(2, ℝ) ℍ`. An element of negative determinant is such an element composed with
Mathlib's `UpperHalfPlane.J`, the matrix `diag(−1, 1)` of `GL(2, ℝ)`. `UpperHalfPlane.J` acts by
`z ↦ −conj z`, an isometry by Tau Ceti's `TauCeti.UpperHalfPlane.isometry_J_smul`. This derivation
from the two isometries is this roadmap's own. The elements of negative determinant reverse
orientation and are antiholomorphic.
*Needs:* Mathlib `UpperHalfPlane.glAction`, `UpperHalfPlane.J`, `IsIsometricSMul SL(2, ℝ) ℍ`; Tau
Ceti `TauCeti.UpperHalfPlane.isometry_J_smul`.

**Checks.**

- `diag(1, −1)` has determinant `−1` and acts by `z ↦ −conj z`: it sends `1 + i` to `−1 + i` and
  fixes `i`. The model without conjugation would send `1 + i` to `−1 − i ∉ ℍ`.
- `diag(2, 1)` acts by `z ↦ 2z`, the same map as the class of `diag(√2, 1/√2)` in `PSL(2, ℝ)`. The
  scalar matrix `2·1` acts trivially. By faithfulness of the `PGL(2, ℝ)` action, the kernel of the
  `GL(2, ℝ)` action consists exactly of the nonzero scalar matrices.
- `diag(1, −1)` preserves the distance of `1 + i` and `2 + i`: `dist(1 + i, 2 + i)` and
  `dist(−1 + i, −2 + i)` are both `2 arsinh(1/2)`. The map `z ↦ conj z`, which conjugates without
  the sign, leaves ℍ.
- The action of `PSL(2, ℝ)` is effective, while the `SL(2, ℝ)` action is not. In `SL(2, ℝ)` the
  element `−1 ≠ 1` fixes every point, and its class in `PSL(2, ℝ)` is the identity, as
  `FaithfulSMul PSL(2, ℝ) ℍ` requires. A stabilizer computed upstairs doubles: the stabilizer of
  `i` in `SL(2, ℤ)` is `{±1, ±S}` with `S = [[0, −1], [1, 0]]`, of order `4`, while in the image of
  `PSL(2, ℤ)` it has order `2`.

### 0.3 Proper discontinuity of discrete subgroups

A discrete subgroup `Γ ≤ PSL(2, ℝ)` acts properly discontinuously. This is the instance
`ProperlyDiscontinuousSMul Γ ℍ` of Tau Ceti's `Analysis/Complex/Fuchsian/ProperAction.lean`. It is
proved from properness of the `PSL(2, ℝ)` action (`ProperSMul PSL(2, ℝ) ℍ`), and no choice of a lift
to `SL(2, ℝ)` appears in its interface (Beardon, Chapters 7–8; Katok, §§2.1–2.4).

### 0.4 Stabilizers

Every stabilizer of a discrete subgroup is finite, by proper discontinuity, and cyclic, by Tau
Ceti's `Subgroup.isCyclic_stabilizer` (`Analysis/Complex/UpperHalfPlane/Stabilizer.lean`). Its order
is the order of the derivative in a disc coordinate. The derivative character
`Subgroup.stabilizerDeriv` is an injective multiplicative homomorphism to `ℂ`
(`Subgroup.stabilizerDeriv_injective`) and preserves orders (`Subgroup.orderOf_stabilizerDeriv`).
`Subgroup.exists_discCoordinate_generator_transition` records how replacing a generator changes the
rotation (Beardon, Chapters 7–8; Katok, §§2.1–2.4).

### 0.5 The free locus

The free locus is Tau Ceti's `TauCeti.freeLocus`, the set of points with trivial stabilizer. It is an
invariant subset by construction and open by `TauCeti.isOpen_freeLocus`
(`Topology/Algebra/GroupAction/FreeLocus.lean`). Its projection is a covering map
(`TauCeti.isCoveringMap_quotientMk_freeLocus`) and a local biholomorphism
(`Subgroup.isLocalDiffeomorph_quotientMk_freeLocus`, `Analysis/Complex/Fuchsian/FreeLocus.lean`)
(Beardon, Chapters 7–8; Katok, §§2.1–2.4).

**Checks.**

- For the image of `PSL(2, ℤ)`, the points `i` and `ρ` lie outside the free locus. On a small disc
  about `i`, every point other than `i` shares its orbit with exactly one other point of the disc,
  its image under `S`, while `i` is alone in its fibre. The fibre cardinality of the coarse
  projection therefore jumps from `2` to `1` at `i`, so the coarse projection is not a covering map
  near `i`. Its restriction to the free locus is a covering map.

### Examples

- The class of `T = [[1, 1], [0, 1]]` acts by `z ↦ z + 1`. The class of `S = [[0, −1], [1, 0]]` acts
  by `z ↦ −1/z`, fixes `i` and has order `2` in `PSL(2, ℝ)`, although `S` has order `4` in
  `SL(2, ℝ)`. The class of `ST` acts by `z ↦ −1/(z + 1)`, fixes `ρ = exp(2πi/3)` and has order `3`.
  In the image of `PSL(2, ℤ)`, the stabilizers of `i` and `ρ` have orders `2` and `3`.
- The image of the principal congruence subgroup `Γ(2)` in `PSL(2, ℝ)` is torsion free. Its free
  locus is all of ℍ, and its quotient map is a covering map.

### Dependencies

Mathlib: the upper half-plane, its distance, the `GL(2, ℝ)` and `PGL(2, ℝ)` actions, the topology of
quotient groups and of `SL(2, ℝ)`. Tau Ceti: the `PSL(2, ℝ)` action and its instances,
`TauCeti.UpperHalfPlane.isometry_J_smul`, proper discontinuity, stabilizers and the free locus.
ComplexManifolds Milestone 4 frames the free quotient. No other layer of this roadmap is used.

## Layer 1: elliptic points and coarse quotient charts

### 1.1 Invariant discs and the linearizing coordinate

Let `z` be an elliptic fixed point of order `m`. The invariant disc and the linearization are Tau
Ceti's. `Subgroup.stabilizerBall` is the hyperbolic disc about `z`, as a set with an action of the
stabilizer. `Subgroup.stabilizerBallHomeomorph` (`Analysis/Complex/UpperHalfPlane/Elliptic.lean`)
identifies it, through the holomorphic disc coordinate, with a Euclidean disc on which the
stabilizer acts by the `m`th roots of unity. For small radii the translates of the disc are
disjoint outside the stabilizer. The form used is that its local orbit space embeds openly in
`Γ\ℍ` (`Subgroup.eventually_isOpenEmbedding_orbitRelQuotientMap_stabilizerBall`). The linearizing
coordinate of the elliptic chart is `Subgroup.LinearizingCoordinate`
(`Fuchsian/Elliptic/Linearizing.lean`) (Farkas–Kra, §IV.9; Miranda, Chapter III §§3–4;
Diamond–Shurman, §§2.1–2.3).

### 1.2 The cyclic quotient of a disc

The finite cyclic quotient theorem for a disc is Tau Ceti's
`Subgroup.stabilizerBallQuotientHomeomorph`. For `ε ≥ 0`, the orbit space of the invariant disc of
radius `ε` is the Euclidean disc of radius `tanh(ε/2)ᵐ`; the orbit of `τ` goes to the `m`th power
of its disc coordinate. The resulting chart is `Subgroup.stabilizerBallQuotientChart`. Its inverse
is read through `u ↦ uᵐ` by `Subgroup.stabilizerBallQuotientChart_symm_pow`
(`Fuchsian/Elliptic/Basic.lean`). The local multiplicity of the quotient map at `z` is the
stabilizer order `m`, by `Subgroup.localMultiplicity_quotientMk` (`Fuchsian/Ramification.lean`)
(Farkas–Kra, §IV.9; Miranda, Chapter III §§3–4; Diamond–Shurman, §§2.1–2.3).

**Checks.**

- The rotation group of order `m` acts on the unit disc by `w ↦ ζw` with `ζ = exp(2πi/m)`.
  The map `w ↦ wᵐ` identifies the orbit space homeomorphically with the unit disc, so the quotient
  is a smooth disc, and its local multiplicity at `0` is `m`. A chart `u = w` is not well defined
  on the orbit space, since `w` and `ζw` lie in one orbit but have different coordinates.
- The hyperbolic disc of radius `ε` about the centre of the disc model has Euclidean radius
  `tanh(ε/2)`, since the distance from `0` to `r` is `2 artanh r`. Its orbit space is the disc of
  radius `tanh(ε/2)ᵐ`, and for `m = 2`, `ε = 2 artanh(1/2)` this radius is `1/4`.

### 1.3 The atlas of the coarse quotient

The glued atlas of the coarse quotient is Tau Ceti's `Subgroup.instChartedSpaceOrbitRelQuotient`.
It is analytic by `Subgroup.instIsManifoldOrbitRelQuotient` and second countable by
`Subgroup.instSecondCountableTopologyOrbitRelQuotient` (`Fuchsian/CoarseQuotient.lean`). It is
Hausdorff by Mathlib's `t2Space_of_properlyDiscontinuousSMul_of_t2Space`. The projection is
holomorphic (`Subgroup.mdifferentiable_quotientMk`) and ramified exactly at the elliptic points
(`Subgroup.one_lt_localMultiplicity_quotientMk_iff`) (Farkas–Kra, §IV.9; Miranda, Chapter III
§§3–4; Diamond–Shurman, §§2.1–2.3).

### 1.4 Independence of the chart data

Independence of the invariant disc is Tau Ceti's `Subgroup.stabilizerBallQuotientChart_trans_apply`:
the charts built from discs of two positive radii agree on their common domain. Independence of the
stabilizer generator, with the exact transition law when a generator is replaced by another
primitive generator, is `Subgroup.exists_discCoordinate_generator_transition`
(`Analysis/Complex/UpperHalfPlane/Stabilizer.lean`) (Farkas–Kra, §IV.9; Miranda, Chapter III §§3–4;
Diamond–Shurman, §§2.1–2.3).

### 1.5 Descent of invariant functions

Descent of invariant holomorphic and meromorphic functions is Tau Ceti's
`Subgroup.existsUnique_mdifferentiable_quotientMk` (`Fuchsian/Descent.lean`) and
`Subgroup.existsUnique_meromorphicAt_quotientMk` (`Fuchsian/MeromorphicDescent.lean`). Neither
assumes freeness. The local order formula `ord_z(F ∘ π) = m · ord_[z](F)`, at a point of stabilizer
order `m`, is `Subgroup.meromorphicOrderAt_comp_quotientMk` (Farkas–Kra, §IV.9; Miranda, Chapter III
§§3–4; Diamond–Shurman, §§2.1–2.3).

**Checks.**

- Under the image of `PSL(2, ℤ)`, `j − 1728` vanishes to order `2` at `i`
  (`TauCeti.ModularForm.analyticOrderAt_j_sub_1728_comp_ofComplex_I`), and the stabilizer of `i`
  has order `2`. Its descent therefore vanishes to order `1` at the orbit of `i`. Likewise `j`
  vanishes to order `3` at `ρ`, whose stabilizer has order `3`, so its descent vanishes to order `1`
  there. A formula without the factor `m` would leave orders `2` and `3` downstairs, making the
  descended `j` ramified at those orbits, against its degree one (§6.3).

### Examples

- For the image of `PSL(2, ℤ)`, the chart of the coarse quotient near the orbit of `i` is
  `u = w²` in a disc coordinate `w` centred at `i`, and near the orbit of `ρ` it is `u = w³`. The
  local multiplicity of the projection is `2` at `i`, `3` at `ρ` and `1` at every point outside
  their orbits.

### Dependencies

Layer 0 (stabilizers, proper discontinuity, the free locus). ComplexManifolds Milestones 5–6 frame
the gluing and separation of the charts. Tau Ceti: the elliptic discs, the linearizing coordinate,
the quotient charts, the coarse atlas, local multiplicities and descent. Mathlib:
`t2Space_of_properlyDiscontinuousSMul_of_t2Space`.

## Layer 2: hyperbolic polygons and cofinite groups

### 2.1 The hyperbolic metric, area and covolume

Tau Ceti's `TauCeti.UpperHalfPlane.poincareRiemannianMetric` is the Riemannian metric
`(Re v Re w + Im v Im w)/y²` on ℍ (`UpperHalfPlane.poincareRiemannianMetric_inner`).
`UpperHalfPlane.riemannianVolume_eq_volume` identifies its Riemannian volume with Mathlib's `volume`.
Covolume through measurable fundamental domains, independent of the domain, is Mathlib's
`MeasureTheory.covolume` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean`). The existence of a
fundamental domain and cofiniteness are Tau Ceti's `Subgroup.exists_isFundamentalDomain` and
`Subgroup.IsCofinite` (`Fuchsian/Covolume.lean`). The Gauss–Bonnet formula for finite hyperbolic
polygons is `TauCeti.UpperHalfPlane.volume_triangle` (`Analysis/Complex/UpperHalfPlane/Triangle.lean`)
and `TauCeti.UpperHalfPlane.CompactConvexPolygon.volume_carrier`
(`UpperHalfPlane/Polygon/GaussBonnet.lean`). The targets of this section are the following six,
each with its own inputs.

**(a) Riemannian isometries.** Prove that every element of `GL(2, ℝ)` acts on ℍ by a Riemannian
isometry of the Poincaré metric, that is, by an element of Tau Ceti's isometry group
`TauCeti.Isom 𝓘(ℝ, ℂ) ℍ` (`Riemannian/Isometry/Group.lean`) whose underlying map is the action of
that element. Route: take `g = [[a, b], [c, d]]` of positive determinant. It acts holomorphically
with derivative `det g/(cz + d)²`. The modulus `det g/|cz + d|²` of that derivative is the ratio
`Im(g • z)/Im z`, by Mathlib's `UpperHalfPlane.im_smul_eq_div_normSq`, so the tensor is preserved.
Mathlib's `UpperHalfPlane.J` acts by `z ↦ −conj z` (`UpperHalfPlane.coe_J_smul`); its differential
`v ↦ −conj v` preserves `|v|`, and the map preserves `Im z`. An element of negative determinant is
`J` composed with one of positive determinant, as in §0.2. The derivation from the metric formula is
this roadmap's own.
*Needs:* Tau Ceti `UpperHalfPlane.poincareRiemannianMetric_inner`, `TauCeti.Isom`; Mathlib
`UpperHalfPlane.glAction`, `UpperHalfPlane.im_smul_eq_div_normSq`, `UpperHalfPlane.J`,
`UpperHalfPlane.coe_J_smul`; §0.2.

**(b) The distance comparison.** Prove `isRiemannianManifold_upperHalfPlane`: Mathlib's metric
space ℍ satisfies Mathlib's `IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ` for the Poincaré metric, that is, the
Riemannian distance of the Poincaré metric is Mathlib's `dist` (Katok, §1.2). Route: a vertical
segment from `iy₁` to `iy₂` has length `|log(y₂/y₁)|`, and every curve joining them is at least as
long, because `|d log y| ≤ ds`. The `PSL(2, ℝ)` action moves an arbitrary pair to a vertical pair
without changing either distance. It preserves the Riemannian distance because its elements are the
Riemannian isometries of (a), and Tau Ceti's `TauCeti.RiemannianIsometry.riemannianEDist_eq` says
that any Riemannian isometry preserves it. It preserves Mathlib's `dist` by
`IsIsometricSMul PSL(2, ℝ) ℍ`. The resulting `arcosh(1 + ((x − x′)² + (y − y′)²)/(2yy′))` agrees
with `UpperHalfPlane.dist_eq`, including the case of coincident points.
*Needs:* (a); Tau Ceti `IsIsometricSMul PSL(2, ℝ) ℍ`, `TauCeti.RiemannianIsometry.riemannianEDist_eq`;
Mathlib `UpperHalfPlane.dist_eq`, `IsRiemannianManifold`.

**(c) The half-space model.** Prove that `x + iy ↦ (x, y)` is a Riemannian isometry
`TauCeti.RiemannianIsometry 𝓘(ℝ, ℂ) 𝓘(ℝ, WithLp 2 (ℝ × ℝ)) ℍ (TauCeti.UpperHalfSpace ℝ)` onto Tau
Ceti's half-space model. The half-space carries its metric `TauCeti.UpperHalfSpace.riemannianMetric`,
the plane case `E = ℝ` of `(‖dx‖² + dt²)/t²` (`TauCeti.UpperHalfSpace.inner_def`). Both tensors are
the Euclidean one divided by the squared height; the derivation from the two metric formulas is
this roadmap's own. Conjugation by this isometry carries the `GL(2, ℝ)` action of (a) to Riemannian
isometries of the half-space.
*Needs:* Tau Ceti `UpperHalfPlane.poincareRiemannianMetric_inner`, `TauCeti.RiemannianIsometry`,
`TauCeti.UpperHalfSpace.riemannianMetric`, `TauCeti.UpperHalfSpace.inner_def`; (a), for the
conjugated action only.

**(d) The comparison isometry.** Give the half-space its Riemannian distance, Tau Ceti's
`TauCeti.MetricSpace.ofRiemannianMetric` (`Riemannian/Distance.lean`). Prove that the map of (c) is
an isometry `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ` from Mathlib's `dist` to the Riemannian distance of the
half-space. Route: by (b), the distance on ℍ is its Riemannian distance. Tau Ceti's
`TauCeti.RiemannianIsometry.riemannianEDist_eq` (`Riemannian/Isometry/Distance.lean`), whose
`IsometryClass` instance turns a Riemannian isometry between spaces whose distances are their
Riemannian distances into a metric isometry, then applies to the map of (c).
*Needs:* (b), (c); Tau Ceti `TauCeti.MetricSpace.ofRiemannianMetric`,
`TauCeti.RiemannianIsometry.riemannianEDist_eq`.

**(e) Curvature.** Prove that the Poincaré metric has constant sectional curvature `−1`. Route: Tau
Ceti's `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff`
(`Riemannian/Isometry/Curvature.lean`), applied to the map of (c), carries the constant sectional
curvature `−1` of the half-space, `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`
(`Hyperbolic/UpperHalfSpace/Curvature.lean`), to the Poincaré metric.
*Needs:* (c); Tau Ceti `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff`,
`TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`.

**(f) Completeness.** Prove that the Riemannian distance of the Poincaré metric is complete. Route:
by (b) it is Mathlib's `dist`, which is complete by Mathlib's `ProperSpace ℍ` instance
(`UpperHalfPlane/Metric.lean`).
*Needs:* (b); Mathlib `ProperSpace ℍ`.

**Checks.**

- `diag(2, 1)` sends `i` to `2i` with derivative `2`. The tangent vector `1` at `i` has squared
  Poincaré length `1/1² = 1`, and its image `2` at `2i` has `2²/2² = 1`; the Euclidean tensor would
  give `1` and `4`. The class of `[[0, −1], [1, 0]]` acts by `z ↦ −1/z`, with derivative `1/z²`,
  equal to `−1/4` at `2i`. The vector `1` at `2i`, of squared length `1/4`, goes to `−1/4` at
  `i/2`, of squared length `(1/16)/(1/2)² = 1/4`.
- At `2i` the tangent vector `1` has squared Poincaré length `(1·1 + 0·0)/2² = 1/4`, and its image
  `(1, 0)` at `(0, 2)` has squared half-space length `(1² + 0²)/2² = 1/4`. The disc normalisation
  `4|dz|²/y²` would give `1`. The height rescaling `x + iy ↦ (x, 2y)` would send the vector to
  `(1, 0)` at `(0, 4)`, of squared length `1/16`.
- `dist(i, 2i) = log 2`: the vertical segment has length `∫₁² dy/y = log 2`, and
  `2 arsinh(1/(2√2)) = 2 log √2 = log 2`. The disc-model normalisation `2|dz|/(1 − |z|²)`, read on ℍ
  as `2|dz|/y`, would give `2 log 2`. The comparison isometry sends `i` and `2i` to `(0, 1)` and
  `(0, 2)`, whose half-space Riemannian distance is the length `∫₁² dt/t = log 2` of the vertical
  segment, the same value.
- `dist(i, 1 + i) = arcosh(3/2) = 2 log((1 + √5)/2) ≈ 0.9624`. This is the Poincaré length
  `∫ dθ/sin θ` of the arc between the two points of the circle with centre `1/2` and radius `√5/2`.
  The horizontal segment has Poincaré length `∫₀¹ dx/1 = 1 > 0.9624`, so a model in which the
  Riemannian distance is the length of the Euclidean segment is wrong off vertical pairs.
- The points `i/n` form a Cauchy sequence for the Euclidean distance, with limit `0 ∉ ℍ`. But
  `dist(i/n, i/m) = |log(m/n)|`, so they are not Cauchy for `dist`: completeness in (f) is a property
  of the Poincaré distance, false for the Euclidean distance on ℍ.
- The ideal triangle with vertices `0`, `1`, `∞` has area `π`, the angular defect `π − 0`. The
  region `{|x| ≤ 1/2, |z| ≥ 1}` has area `π/3`, the covolume of `PSL(2, ℤ)`.
- `z ↦ −conj z` fixes the imaginary axis pointwise, so it is a reflection. It is an isometry that
  reverses orientation and is induced by no element of `PSL(2, ℝ)`, since a nontrivial element of
  `PSL(2, ℝ)` fixes at most one point of ℍ.

### 2.2 Geodesics, convex polygons and side pairings

Geodesics, convex hyperbolic polygons, sides, vertices, side pairings, cycles and angles are Tau
Ceti's. Geodesics are in `Analysis/Complex/UpperHalfPlane/Geodesic/`. Convex polygons are
`TauCeti.UpperHalfPlane.ConvexPolygon`, whose vertices are listed counterclockwise, with every vertex
off a side strictly to the left of it, and whose interior angles are
`TauCeti.UpperHalfPlane.ConvexPolygon.interiorAngle`. Side pairings are
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing`, with vertex-cycle transformations
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.cycleMap`. Local finiteness of translated polygons
is `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.locallyFinite_smul_carrier_iff_isParabolic_cycleMap`
(`Fuchsian/FundamentalPolygon.lean`) and
`TauCeti.UpperHalfPlane.ConvexPolygon.locallyFinite_smul_carrier_of_isCuspPoint`
(`Fuchsian/Polygon/LocallyFinite.lean`) (Beardon, Chapters 9–11; Katok, Chapters 3–4; Stillwell,
Chapter 5).

### 2.3 Poincaré's polygon theorem

Poincaré's polygon theorem is Tau Ceti's. It applies to a side-paired convex polygon whose finite
vertex cycles satisfy the angle condition `ord(cycle transformation) · (cycle angle sum) = 2π` and
whose ideal vertices have parabolic cycle transformations. The fundamental-set part is
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.isFundamentalDomain_carrier_of_isParabolic`.
Discreteness with finite covolume is
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.isCofinite_of_isParabolic`. The presentation, by the
side relations and the finite vertex-cycle relations, is
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.relatorQuotientTo_bijective_of_isParabolic`
(`Fuchsian/Polygon/Poincare.lean`) (Beardon, Chapters 9–11; Katok, Chapters 3–4; Stillwell,
Chapter 5).

### 2.4 Dirichlet polygons of cofinite groups

The converse is Tau Ceti's `Subgroup.IsCofinite.exists_sidePairing_relatorQuotientTo_bijective`.
For a cofinite `Γ` and a Dirichlet centre in the free locus, the Dirichlet domain is a finite-sided
side-paired convex polygon whose pairing maps lie in `Γ` and present it.
`Subgroup.isCofinite_iff_exists_convexPolygon_carrier_eq_dirichletDomain` is the equivalence of
cofiniteness with the Dirichlet domain being a finite-sided convex polygon
(`Fuchsian/DirichletDomain/Cofinite.lean`) (Beardon, Chapters 9–11; Katok, Chapters 3–4; Stillwell,
Chapter 5).

### 2.5 Elliptic cycles, cusp orbits and the orientation of the boundary word

The elliptic cycles are read off the polygon by Tau Ceti's
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.ellipticOrbitEquiv` and
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_ellipticOrbits`
(`Fuchsian/Elliptic/Polygon.lean`). The cusp orbits are read off by
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.finite_cuspOrbit`
(`Fuchsian/Compactification/Polygon.lean`), and the presentation by §2.3. The Euler characteristic of
the compactified quotient `X(Γ)` is computed from the polygon in §5.7.

The orientation of the boundary word agrees with that of the cusp meridians fixed in Convention 6,
in Tau Ceti's `Fuchsian/Cusp/Polygon.lean`. This holds for a side pairing whose maps lie in `Γ` and
whose nontrivial `Γ`-translates of the open polygon are disjoint from it. At an ideal vertex with
parabolic cycle transformation, every scaling sending the vertex to `∞` carries a cusp datum whose
selected generator is that cycle transformation
(`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.exists_cuspDatum_generator_eq_cycleMap`). The
selected generator of every datum at that vertex is the cycle transformation, neither its inverse
nor a proper power (`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.cuspDatum_generator_eq_cycleMap`).
A lift of the meridian with `k` signed turns ends at the `k`th power of the cycle word applied to its
starting point
(`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.meridian_lift_endpoint_eq_pairingHom_cycleWord_zpow_smul`)
(Beardon, Chapters 9–11; Katok, Chapters 3–4; Stillwell, Chapter 5).

### 2.6 Triangle groups

The finite-or-cusp parameter is Tau Ceti's `TauCeti.TriangleOrder`. Its constructors are
`elliptic m`, carrying `2 ≤ m`, and `cusp`, and its reciprocal `TauCeti.TriangleOrder.reciprocal` is
`1/m` and `0` respectively (`Fuchsian/TriangleOrder/Basic.lean`). Every triple whose reciprocals sum
to less than one is realised by `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup`.
It gives a hyperbolic triangle with the corresponding angles whose triangle group
`TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroup`, the orientation-preserving index-two subgroup
of the group generated by the reflections in its sides, is cofinite. This group is isomorphic to the
abstract triangle group `Δ(p, q, r) = ⟨x, y, z | xᵖ, y^q, zʳ, zyx⟩`, Tau Ceti's
`TauCeti.TriangleGroup`, at the orders `TauCeti.TriangleOrder.order` (`0`, no relation, at a cusp)
(`TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv`). Its elliptic orders and cusp count are
`TauCeti.UpperHalfPlane.ConvexPolygon.natCard_ellipticOrbits_of_doubleTriangle` and
`TauCeti.UpperHalfPlane.ConvexPolygon.natCard_cuspOrbit_of_doubleTriangle` (`Fuchsian/TriangleOrder/`).
A cusp is the typed value `cusp`, not an untyped infinity (Beardon, Chapters 9–11; Katok, Chapters
3–4; Stillwell, Chapter 5).

**Checks.**

- The triple `(2, 3, cusp)` has reciprocal sum `1/2 + 1/3 + 0 = 5/6 < 1`. It is realised by a
  triangle with angles `π/2`, `π/3` and `0`, whose triangle group is isomorphic to
  `Δ(2, 3, ∞) = ⟨x, y, z | x², y³, zyx⟩`, the free product `ℤ/2 ∗ ℤ/3`, which is isomorphic to
  `PSL(2, ℤ)`. Reading the cusp as a large finite order `n` would add the relation `zⁿ` and give a
  compact triangle group instead.
- `(2, 3, 7)` has reciprocal sum `41/42 < 1` and is hyperbolic; `(2, 3, 6)` has sum `1` and is not.

### Examples

- The standard fundamental triangle of the image of `PSL(2, ℤ)` has vertices `ρ`, `ρ + 1` and `∞`.
  Its vertical sides are paired by `T` and its arc by `S`, which pairs the arc with itself. The finite
  vertex cycle `{ρ, ρ + 1}` has angle sum `2π/3` and cycle transformation of order `3`, and
  `3 · 2π/3 = 2π`. The midpoint `i` of the self-paired arc is fixed by `S`, of order `2`, with angle
  `π`. The ideal vertex `∞` has the parabolic cycle transformation `T`. Poincaré's theorem gives the
  presentation `⟨S, T | S², (ST)³⟩` and covolume `π/3`.
- The triangle with angles `π/2`, `π/3` and `π/7` has area `π − π/2 − π/3 − π/7 = π/42`. The
  `(2, 3, 7)` triangle group, generated by products of reflections in its sides, has the doubled
  triangle as a fundamental domain, of area `π/21`.

### Dependencies

Layer 0 (the action, its isometries, proper discontinuity and the free locus). Layer 3's cusp points,
cusp data and meridians for the cusp statements of §§2.2, 2.5 and 2.6, which use no polygon (see How
to read the build). Tau Ceti: the Poincaré metric, the half-space model, Riemannian isometries and
distance, polygons, side pairings, Poincaré's theorem, Dirichlet domains and triangle groups.
Mathlib: `IsRiemannianManifold`, `MeasureTheory.covolume`, `ProperSpace ℍ`.

## Layer 3: cusps and q-coordinates

### 3.1 Cusps and cusp orbits

Cusps are Tau Ceti's. `Subgroup.IsCuspPoint` holds at the fixed point of a parabolic element of `Γ`
(`Subgroup.isCuspPoint_iff_exists_parabolicFixedPoint_eq`,
`Subgroup.isCuspPoint_iff_exists_mem_stabilizer_isParabolic`). Cusp orbits in `OnePoint ℝ` are
`Subgroup.CuspOrbit` (`Fuchsian/Cusp/Basic.lean`). A cofinite group has finitely many of them,
`Subgroup.IsCofinite.finite_cuspOrbit` (`Fuchsian/Cusp/Finite.lean`) (Diamond–Shurman, §2.4).

### 3.2 Cusp data

The cusp datum of Convention 5 is Tau Ceti's `Subgroup.CuspDatum` (`Fuchsian/Cusp/Datum.lean`). Its
fields are the representative `c`, a scaling `σ` with `σ(c) = ∞`, the selected generator `γ` and its
width `w > 0`, with `⟨γ⟩ = stabilizer Γ c` (`Subgroup.CuspDatum.mem_stabilizer_iff`) and
`σγσ⁻¹(z) = z + w`. The conjugated full stabilizer is therefore exactly `wℤ`
(`Subgroup.CuspDatum.mem_stabilizer_iff_conj`). Every cusp representative and every scaling sending
it to `∞` carry a datum (`Subgroup.IsCuspPoint.exists_cuspDatum`), and a datum is determined by its
representative and its scaling (`Subgroup.CuspDatum.ext`). Uniqueness holds only relative to the
normalized datum (Diamond–Shurman, §2.4).

**Checks.**

- For the image of `PSL(2, ℤ)` at `c = ∞` with `σ = 1`, the generator `z ↦ z + 1` gives a datum of
  width `1`. The element `z ↦ z + 2` also satisfies `σγσ⁻¹(z) = z + 2`, but it generates a subgroup
  of index two in the stabilizer and gives no datum.
- For the image of `Γ(2)` at `∞` with `σ = 1`, the stabilizer is generated by `z ↦ z + 2`, and the
  width is `2`. The same cusp of the image of `PSL(2, ℤ)` has width `1`.

### 3.3 Horodiscs

Horodiscs are Tau Ceti's `TauCeti.Subgroup.CuspDatum.horodisc`, the sets `{z | A < Im σ(z)}`
(`Fuchsian/Cusp/Horodisc.lean`). From height `w` on they are precisely invariant under the cusp
stabilizer (`TauCeti.Subgroup.CuspDatum.disjoint_smul_horodisc`). Horodiscs at inequivalent cusps
have disjoint images in the quotient (`TauCeti.Subgroup.CuspDatum.disjoint_image_quotientMk_horodisc_iff`).
Removing their images leaves a compact part of the quotient
(`TauCeti.UpperHalfPlane.ConvexPolygon.isCompact_compl_iUnion_image_horodisc`,
`Fuchsian/Compactification/Polygon.lean`) (Diamond–Shurman, §2.4).

### 3.4 The q-coordinate

The q-coordinate `q(z) = exp(2πiσ(z)/w)` is Tau Ceti's `TauCeti.Subgroup.CuspDatum.coordinate`
(`Fuchsian/Cusp/Coordinate.lean`). It is invariant under the stabilizer
(`TauCeti.Subgroup.CuspDatum.coordinate_smul`). It identifies the quotient by the full stabilizer
with the punctured disc (`TauCeti.Subgroup.CuspDatum.quotientHomeomorph`). It tends to `0` along the
cusp, its norm being small exactly on high horodiscs
(`TauCeti.Subgroup.CuspDatum.norm_qCoordinate_lt_iff_mem_horodisc`). For a second datum with
`σ′ = aσ + b`, the formulas `w′ = aw` and `q′ = exp(2πib/(aw)) q` are `TauCeti.cuspDatum_width_eq_mul`
and `TauCeti.cuspDatum_coordinate_eq` (`Fuchsian/Cusp/ChangeScaling.lean`) (Diamond–Shurman, §2.4).

**Checks.**

- For the image of `PSL(2, ℤ)` at `∞`, take `σ = 1`, so `w = 1` and `q = exp(2πiz)`. The scaling
  `σ′(z) = 2z` gives `w′ = 2` and `q′ = exp(2πi · 2z/2) = q`. The scaling `σ′(z) = 2z + 1/2` gives
  `q′ = exp(2πi(1/2)/2) q = i q`; the formula `exp(2πib) q`, without the division by `aw`, would
  give `−q`.
- The q-coordinate descends under the whole stabilizer, not only under a subgroup. For the image of
  `PSL(2, ℤ)`, `exp(πiz)` is invariant under `z ↦ z + 2` but not under `z ↦ z + 1`, so it is not
  the coordinate of a datum.

### 3.5 The q-expansion criterion

The q-expansion criterion is Tau Ceti's. Let `f` be an invariant holomorphic function. The
descended function on the punctured disc extends holomorphically across `0` when it is bounded
(`TauCeti.Subgroup.CuspDatum.analyticAt_cuspExtension_zero`, `Fuchsian/Cusp/Extension.lean`). It
extends meromorphically, with a pole of order at most `n`, under growth `O(exp(2πn Im σ(z)/w))`
(`TauCeti.Subgroup.CuspDatum.neg_natCast_le_meromorphicOrderAt_cuspExtension`). It extends with a
zero of order at least `n` under decay `O(exp(−2πn Im σ(z)/w))`
(`TauCeti.Subgroup.CuspDatum.natCast_le_meromorphicOrderAt_cuspExtension`, `Fuchsian/Cusp/Growth.lean`)
(Diamond–Shurman, §2.4).

**Checks.**

- The order of a function at a cusp does not depend on the datum. Two data at the same cusp have
  coordinates with `q′ = κq` for a constant `κ ≠ 0` (§3.4). An expansion `Σₙ aₙ qⁿ` whose first
  nonzero coefficient is `a_N` becomes `Σₙ aₙ κ⁻ⁿ q′ⁿ`, again with first nonzero coefficient in
  degree `N`.
- `j` has the expansion `q⁻¹ + 744 + …` in `q = exp(2πiz)` (`TauCeti.ModularForm.laurentQExpansion_j`)
  and grows like `exp(2π Im z)`. The criterion with `n = 1` gives a pole of order at most one at the
  cusp, and the expansion shows the order is exactly one.

### Examples

- The image of `PSL(2, ℤ)` has the single cusp orbit of `∞`, with datum `σ = 1`, `γ = T`, `w = 1`
  and `q = exp(2πiz)`.
- The image of `Γ(2)` has three cusp orbits, represented by `∞`, `0` and `1`. Each has width `2` for
  a scaling in the image of `PSL(2, ℤ)` sending it to `∞`, since `Γ(2)` is normal in `SL(2, ℤ)`.

### Dependencies

Layer 0 (the action and stabilizers). §2.1 for the cofiniteness in the finiteness of cusp orbits, and
the convex polygons of §2.2 for the compact part in §3.3 only. Tau Ceti: cusp points and orbits, cusp
data, horodiscs, q-coordinates, change of scaling, meridians, and the extension and growth criteria.

## Layer 4: compactified quotient Riemann surfaces

The construction order of this layer is normative: the carrier, then its topology and its
separation, countability, connectedness and compactness, then the atlas, then the maps.

### 4.1 The carrier and its cusp neighbourhoods

The carrier is Tau Ceti's explicit inductive disjoint sum `Subgroup.CompactifiedQuotient` of the
coarse orbit quotient and the cusp orbits (Convention 8; `Fuchsian/Compactification/Basic.lean`). Its
constructors are `Subgroup.CompactifiedQuotient.ofQuotient` and
`Subgroup.CompactifiedQuotient.ofCusp`, and `Subgroup.CompactifiedQuotient.equivSum` is its sum
equivalence. Its cusp neighbourhoods `Subgroup.CompactifiedQuotient.cuspNhd` are built from the
precisely invariant horodiscs. The topology does not depend on the heights or on the data chosen
(`Subgroup.CompactifiedQuotient.exists_cuspNhd_subset`) (Katok, Chapter 4; Diamond–Shurman, §2.4).

### 4.2 Separation, countability, connectedness and compactness

The carrier is Hausdorff (`Subgroup.CompactifiedQuotient.instT2Space`), second countable
(`Subgroup.CompactifiedQuotient.instSecondCountableTopology`) and connected
(`Subgroup.CompactifiedQuotient.instConnectedSpace`). For a cofinite group it is compact,
`Subgroup.IsCofinite.compactSpace_compactifiedQuotient` (`Fuchsian/DirichletDomain/Cofinite.lean`).
Compactness comes from a truncated Dirichlet polygon and finitely many cusp discs (Katok, Chapter 4;
Diamond–Shurman, §2.4).

**Checks.**

- For the image of `PSL(2, ℤ)`, the truncated standard region `{|x| ≤ 1/2, |z| ≥ 1, y ≤ 2}` is
  compact. Together with the image of the cusp disc `{y > 1}` it covers `X(1)`, which is therefore
  compact.
- Cofiniteness is needed. The cyclic group generated by `z ↦ z + 1` is discrete, of infinite
  covolume, and its only cusp is `∞`. Its quotient is the punctured unit disc through
  `q = exp(2πiz)`, and adjoining the cusp gives the open unit disc, which is not compact.

### 4.3 The analytic atlas

The atlas extending the coarse-quotient charts by the q-coordinate charts at the cusps is
`Subgroup.CompactifiedQuotient.instChartedSpace`. It contains the cusp chart of every cusp datum of
§3.2, cut off at any height at least the datum's width
(`Subgroup.CompactifiedQuotient.cuspChart_mem_atlas`). It is analytic,
`Subgroup.CompactifiedQuotient.instIsManifold : IsManifold 𝓘(ℂ) ω`
(`Fuchsian/Compactification/Manifold.lean`). So the compactified complex structure does not depend
on the cusp datum chosen (Katok, Chapter 4; Diamond–Shurman, §2.4).

**Checks.**

- Replacing `σ` by `aσ + b` changes `w` and `q` by the formulas of §3.4, and the transition between
  the two cusp charts is multiplication by the nonzero constant `exp(2πib/(aw))`, which is
  holomorphic with holomorphic inverse. The atlas is therefore unchanged as a complex structure.

### 4.4 The open quotient, conjugation and maps of compactifications

The original quotient is open and dense, and the cusps are exactly its complement
(`Subgroup.CompactifiedQuotient.isOpenEmbedding_ofQuotient`,
`Subgroup.CompactifiedQuotient.dense_range_ofQuotient`,
`Subgroup.CompactifiedQuotient.compl_range_ofQuotient`). Conjugate groups have biholomorphic
compactifications (`Subgroup.CompactifiedQuotient.conjBiholomorph`,
`Fuchsian/Compactification/Conj.lean`). For an inclusion `Γ′ ≤ Γ` the quotient map extends to the
cusps as the holomorphic map `Subgroup.compactifiedQuotientMap`
(`Subgroup.CompactifiedQuotient.mdifferentiable_compactifiedQuotientMap`).

For cusp data with the same representative and scaling, the local multiplicity of this map at a cusp
is the width ratio `e_cusp = w_Γ′/w_Γ ∈ ℕ`
(`Subgroup.CompactifiedQuotient.localMultiplicity_compactifiedQuotientMap_ofCusp_eq_widthIndex`).
The ratio is related to the widths by `TauCeti.Subgroup.CuspDatum.width_eq_widthIndex_mul`, it is
the index of the cusp stabilizers by `TauCeti.Subgroup.CuspDatum.widthIndex_eq_relIndex`, and it is
multiplicative in towers by `TauCeti.Subgroup.CuspDatum.widthIndex_tower` (`Fuchsian/Cusp/Tower.lean`).
At an elliptic point the local multiplicity is the stabilizer index
(`Subgroup.CompactifiedQuotient.localMultiplicity_compactifiedQuotientMap_ofQuotient_eq_ellipticRamificationIndex`,
with `Subgroup.ellipticRamificationIndex_eq_index` and `Subgroup.ellipticRamificationIndex_tower`).
The fibre cardinality is
`Subgroup.card_fiber_compactifiedQuotientMap_eq_card_stabilizerOrbitRelQuotient`, and the degree is
the index, `Subgroup.degree_compactifiedQuotientMap` (Katok, Chapter 4; Diamond–Shurman, §2.4).

**Checks.**

- For the image of `Γ(2)` inside the image of `PSL(2, ℤ)`, of index `6`, the three cusps of `X(2)`
  have width `2` against width `1` downstairs, so each has `e_cusp = 2`, and `3 · 2 = 6`. Over the
  orbit of `i` lie three points with stabilizer index `2`, and over the orbit of `ρ` two points with
  index `3`. Every fibre sum is `6`, the degree.

### 4.5 The orbifold signature and the polygon area formula

The orbifold signature is derived from the compact surface, the elliptic stabilizer orders and the
cusp set (Convention 9). The orbifold Euler characteristic and the area formula carry all factors of
`2π` and use the effective `PSL` convention. The form of the area formula for a side-paired
fundamental polygon is Tau Ceti's `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul`
(`Fuchsian/Polygon/Area.lean`). For a convex `n`-gon with `k` self-paired sides and `V` finite vertex
cycles, it reads `covolume Γ = 2π((n − k)/2 − 1 − V + Σₑ (1 − 1/mₑ))`. Its intrinsic form, with the
genus of `Γ.CompactifiedQuotient`, is `covolume_eq_two_pi_mul_signature` of §5.7. At level one, with
`−χ(X(1))` in place of `2g − 2`, the intrinsic form is Tau Ceti's
`TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul` (Katok, Chapter 4; Diamond–Shurman,
§2.4).

**Checks.**

- On the standard triangle of the image of `PSL(2, ℤ)`, `(n, k, V) = (3, 1, 1)` and the elliptic
  orders are `2` and `3`, so the polygon form gives `2π(1 − 1 − 1 + 1/2 + 2/3) = π/3`. Counting the
  self-paired arc as an ordinary side, `k = 0`, would give `2π(3/2 − 1 − 1 + 1/2 + 2/3) = 4π/3`.

### Examples

- `X(1)` is the compactified quotient of the image of `PSL(2, ℤ)`, with one cusp. The compactified
  quotient of the image of `Γ(2)` has three cusps, and the map to `X(1)` has degree `6`.

### Dependencies

Layers 0–3. ComplexManifolds Milestones 5–6 frame the gluing and separation. Tau Ceti: the
compactified carrier, its cusp neighbourhoods, separation, compactness, atlas, maps, local
multiplicities, degree, and the polygon area formula.

## Layer 5: compact-surface degree theory and Fuchsian applications

§§5.1–5.3 concern arbitrary compact Riemann surfaces; §§5.4–5.7 apply them to Fuchsian quotients
and finite-index maps.

### 5.1 Topological genus

Let `X` be a compact connected Riemann surface. ComplexManifolds Milestone 1 gives the underlying
real smooth surface, modelled on `EuclideanSpace ℝ (Fin 2)`, and AlgebraicTopology §8.7 gives it
finite CW type, so that Tau Ceti's `TauCeti.eulerChar X` is defined. Define `genus`, on any space of
finite CW type, by `genus X = (2 − χ(X))/2`, truncated at `0`. Prove
`eulerChar_eq_two_sub_two_mul_genus`: if `X` is a Hausdorff, compact, connected space with a complex
atlas of class `C¹` (that is, a compact connected Riemann surface) and has finite CW type, then
`χ(X) = 2 − 2 genus X`, the Euler number of a compact Riemann surface (Miranda, Chapter II §4).

Route: Euler–Poincaré over `ℚ` (`TauCeti.eulerChar_eq_finsum_finrank_singularHomology`) writes
`χ = b₀ − b₁ + b₂`, and connectedness gives `b₀ = 1`. ComplexManifolds Milestone 2 orients `X`,
AlgebraicTopology §6.3 turns that orientation into a fundamental class `[X]`, and the Poincaré
duality of its §6.4 gives `b₂ = b₀ = 1` and `bᵢ = 0` for `i > 2`. The
cup-product pairing `(a, b) ↦ ⟨a ⌣ b, [X]⟩` on `H¹(X; ℚ)` is nondegenerate, by that duality over
the field `ℚ`, and alternating, since Tau Ceti's graded commutativity `TopCat.singularCup_gradedComm`
gives `a ⌣ a = −(a ⌣ a)` in degree one; so `b₁` is even. ComplexKahlerGeometry §7.7, with
`b₁ = 2h^(1,0)`, is another route. No analytic genus and no Riemann–Roch theorem enters.
*Needs:* ComplexManifolds Milestones 1 and 2; AlgebraicTopology §6.3 (from the smooth orientation
to a fundamental class) and §§6.4 and 8.7; Tau Ceti `TauCeti.eulerChar`, `TauCeti.FiniteCWType`,
`TauCeti.eulerChar_eq_finsum_finrank_singularHomology`, `TopCat.singularCup_gradedComm`.

The API of `genus`:

- Homotopy equivalent spaces of finite CW type have the same genus, by Tau Ceti's
  `ContinuousMap.HomotopyEquiv.eulerChar_eq`. In particular homeomorphic, and so biholomorphic,
  compact Riemann surfaces have the same genus (`Homeomorph.eulerChar_eq`).
- The Riemann sphere `OnePoint ℂ` has finite CW type (`TauCeti.finiteCWType_onePoint`) and genus
  `0`, since its Euler characteristic is `1 + (−1)² = 2` (`TauCeti.eulerChar_onePoint`).
- The real torus `∀ i : Fin 2, AddCircle (p i)`, with nonzero periods, has genus `1`, since its Euler
  characteristic is `0` (`TauCeti.eulerChar_torus`).

**Checks.**

- The level-one curve `X(1) ≃ P¹` has `χ = 2` (`TauCeti.ModularGroup.eulerChar_compactifiedQuotient`),
  so its genus is `0`.
- A complex torus `ℂ/Λ` has `χ = 0` and genus `1`. The definition `g = 2 − χ`, without the halving,
  would give `2`.
- A compact surface of genus `2` has `χ = −2` and genus `2`. The definition `g = (−χ/2).toNat`,
  which agrees on the sphere, would give `1` here and `0` on the torus.
- The real projective plane has `χ = 1`. There `genus` returns `0` (integer division), while
  `χ = 2 − 2 · 0` fails: the identity needs the orientable surface underlying a complex structure,
  which `RP²` does not carry.

### 5.2 Degree theory of finite holomorphic maps

The degree theory is Tau Ceti's. The carrier is `TauCeti.RiemannSurface.FiniteHolomorphicMap`, a
holomorphic map that takes two distinct values and has finite fibres. Its local multiplicity is
`TauCeti.RiemannSurface.localMultiplicity`. Its fibre-independent degree is
`TauCeti.RiemannSurface.degree`, with `TauCeti.RiemannSurface.degree_eq_fiber_sum`, and the degree is
multiplicative, `TauCeti.RiemannSurface.degree_comp`. A map of degree one gives the biholomorphism
`TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`, with underlying map given by
`TauCeti.RiemannSurface.biholomorphOfDegreeEqOne_toFun`. Divisor pullback is
`TauCeti.RiemannSurface.divisorPullback`, and the ramification degree `R(f)` of Convention 10 is
`TauCeti.RiemannSurface.ramificationDegree` (Forster, §§4, 17 and 19; Miranda, Chapter II §4).

### 5.3 The branched-cover formula and Riemann–Hurwitz

Let `f : X → Y` be a finite holomorphic map of compact connected Riemann surfaces. The
branched-cover formula `χ(X) = deg f · χ(Y) − R(f)` is Tau Ceti's
`TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`.
It assumes finite CW type of `X`, of `Y`, and of `Y` minus the branch values, which are finitely
many (`TauCeti.RiemannSurface.FiniteHolomorphicMap.finite_branchValues`). The finite CW type of the
punctured target is this roadmap's own step. Triangulate `Y` by a finite simplicial complex `K` with
the branch values among its vertices (AlgebraicTopology §8.7, in its form with finitely many marked
interior points). Tau Ceti's `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage` gives the
realization of `K` minus those vertices finite CW type, and `Homeomorph.finiteCWType` carries it to
`Y` minus the branch values along the triangulation, restricted to the complements.

Prove `riemannHurwitz`: for `X` and `Y` in one universe, as in the branched-cover formula, each a
Hausdorff, compact, connected space with a complex atlas of class `C¹` and of finite CW type, and
`f : X → Y` a finite holomorphic map,
`2 genus X − 2 = deg f · (2 genus Y − 2) + R(f)` (Forster, §17; Miranda, Chapter II §4). The proof
rewrites both Euler characteristics with §5.1. No canonical divisor and no Riemann–Roch theorem
enters.
*Needs:* §5.1; Tau Ceti
`TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`,
`TauCeti.RiemannSurface.FiniteHolomorphicMap.finite_branchValues`,
`AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage`, `Homeomorph.finiteCWType`;
AlgebraicTopology §8.7, with marked points.

**Checks.**

- The punctured step on `z ↦ z²`: triangulate `P¹` as the boundary of a tetrahedron with `0` and
  `∞` among its four vertices. The complement of those two vertices is a cylinder, of Euler
  characteristic `2 − 2 = 0`, each puncture of a surface lowering `χ` by one. Its preimage is the
  same cylinder, and `0 = 2 · 0` is the punctured formula `χ(X ∖ f⁻¹S) = deg f · χ(Y ∖ S)`. A model
  in which a puncture left `χ` unchanged would turn it into the false `2 = 2 · 2`.
- `z ↦ z²` on `P¹` has degree `2` and is ramified at `0` and `∞`, so `R = 2`, and
  `−2 = 2 · (−2) + 2`. The sign error `2g − 2 = d(2g′ − 2) − R` would give `−2 = −6`.
- The Weierstrass function of a lattice, `ℂ/Λ → P¹`, has degree `2` and four ramification points:
  `0 = 2 · (−2) + 4`.
- An unramified double cover of a genus-`2` surface by a genus-`3` surface gives `4 = 2 · 2 + 0`. A
  genus that did not depend on the surface would make the two sides `2c − 2` and `2(2c − 2)`,
  unequal unless `c = 1`.

### 5.4 Descent and extension to the compactification

A `Γ`-invariant holomorphic or meromorphic function descends uniquely to the coarse quotient, by
`Subgroup.existsUnique_mdifferentiable_quotientMk` and `Subgroup.existsUnique_meromorphicAt_quotientMk`
(§1.5). The elliptic local-order formula and the cusp q-expansion criterion extend it to the
compactification. Across cusps this is Tau Ceti's `TauCeti.Fuchsian.exists_meromorphicAt_comp_ofQuotient`
(`Fuchsian/Compactification/Extension.lean`): an invariant function, meromorphic at every point,
holomorphic at large normalized heights and of at most exponential growth at every cusp, extends to a
meromorphic function on the compactified quotient (Forster, §§4, 17 and 19; Miranda, Chapter III
§§3–4).

### 5.5 The compactified quotient map of a finite-index inclusion

The degree theory of §5.2 applies to the compactified quotient map `X(Γ′) → X(Γ)` of a finite-index
inclusion `Γ′ ≤ Γ` of discrete groups. As a finite holomorphic map it is Tau Ceti's
`TauCeti.Fuchsian.compactifiedQuotientFiniteHolomorphicMap`
(`Fuchsian/Compactification/FiniteHolomorphicMap.lean`). Its degree is the index,
`Subgroup.degree_compactifiedQuotientMap` (`Fuchsian/Compactification/Degree.lean`). Its local
multiplicities are the cusp-width ratios at cusps and the stabilizer indices at elliptic points
(§4.4). Neither generic fibre finiteness nor independence of the degree sum is proved again (Forster,
§§4, 17 and 19; Miranda, Chapter III §§3–4).

### 5.6 The Fuchsian Riemann–Hurwitz formula

Let `Γ′ ≤ Γ` be cofinite Fuchsian groups, with `Γ′` of index `d` in `Γ`. Write `g(Γ′)` and `g(Γ)`
for the genera of `X(Γ′)` and `X(Γ)`. These are compact Riemann surfaces (§§4.2–4.3), whose finite
CW type AlgebraicTopology §8.7 provides through ComplexManifolds Milestone 1; finite CW type is a
property, so the genus does not depend on how it is proved. Prove the following two statements, with
the effective-action and orientation conventions explicit. The first is the Fuchsian Riemann–Hurwitz
formula `2g(Γ′) − 2 = d(2g(Γ) − 2) + Σ_P (e_P − 1)`, the sum running over the points `P` of `X(Γ′)`,
with `e_P` the local multiplicity at `P` of the compactified quotient map of §5.5. The second is the
multiplicativity `χ_orb(Γ′) = d χ_orb(Γ)` of the orbifold Euler characteristic
`χ_orb = 2 − 2g − Σᵢ (1 − 1/mᵢ) − c`. Route: the first is §5.3 applied to the map of §5.5. The second is §5.7 for both groups, together with Tau Ceti's
`MeasureTheory.covolume_eq_card_mul_covolume`, which gives `covolume Γ′ = d · covolume Γ`. This
derivation from §§5.3, 5.5 and 5.7 and that theorem is this roadmap's own. At level one, Tau Ceti's
`TauCeti.ModularGroup.finiteCWType_compactifiedQuotient` gives the finite CW type of `X(1)`
directly.
*Needs:* §§5.3, 5.5 and 5.7; §2.1; §§4.2 and 4.3; Tau Ceti
`MeasureTheory.covolume_eq_card_mul_covolume`; AlgebraicTopology §8.7 with ComplexManifolds
Milestone 1, for the finite CW type of `X(Γ′)` and `X(Γ)`.

**Checks.**

- The image of `Γ(2)` in the image of `PSL(2, ℤ)` has index `6`, and `X(2)` has genus `0` with
  three cusps of width `2`. Over the cusp, `R` gains `3`. Over `i`, three points of index `2` give
  `3`. Over `ρ`, two points of index `3` give `4`. So `R = 10`, and `−2 = 6 · (−2) + 10`.
- `χ_orb(PSL(2, ℤ)) = 2 − (1/2 + 2/3) − 1 = −1/6`, and `χ_orb(Γ(2)) = 2 − 3 = −1 = 6 · (−1/6)`.

### 5.7 The genus bridge and the orbifold area formula

Let `Γ` be cofinite, with `X(Γ)` of finite CW type (`TauCeti.FiniteCWType Γ.CompactifiedQuotient`,
the hypothesis under which `genus X(Γ)` is defined). Let `σ` pair the sides of a convex `n`-gon `P`
whose pairing maps lie in `Γ`, whose `Γ`-translates form a locally finite family, and whose
nontrivial `Γ`-translates have interiors disjoint from that of `P`. A Dirichlet polygon of §2.4 is
one. Write `k` for the number of self-paired sides, so that `n − k` is even. Write
`V = Nat.card σ.FiniteVertexCycle` for the number of finite vertex cycles, those with trivial cycle
transformation included. Write `c = Nat.card σ.IdealVertexCycle` for the number of ideal vertex
cycles, which is `Nat.card Γ.CuspOrbit` by Tau Ceti's
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_cuspOrbit` (`Fuchsian/Cusp/VertexCycle.lean`).

Prove the cell count `TauCeti.eulerChar X(Γ) = V + c + 1 − (n − k)/2`. The image of `P` in `X(Γ)`,
with each cusp adjoined through its filled-disc chart, is a finite cell decomposition. Its vertices
are the `V` finite cycles, the `c` cusps and the midpoints of the `k` self-paired sides. Its edges
are the `(n − k)/2` pairs of distinct paired sides and the `k` halves of the self-paired sides. Its
one face is the interior of `P`. Its alternating cell count is `TauCeti.eulerChar X(Γ)` by Tau Ceti's
`TauCeti.eulerChar_eq_cwEulerChar` (`Cellular/EulerCharacteristic/FiniteCWType.lean`). With §5.1 this
is the genus bridge, `(n − k)/2 − 1 − V = 2 genus X(Γ) − 2 + c`: the genus `h` read off the polygon,
defined by `2 − 2h = V + c + 1 − (n − k)/2`, is `genus X(Γ)`.

Substituting it into the polygon area formula of §4.5,
`covolume Γ = 2π((n − k)/2 − 1 − V + Σₑ (1 − 1/mₑ))`, prove `covolume_eq_two_pi_mul_signature`:
`covolume Γ = 2π(2g − 2 + Σₑ (1 − 1/mₑ) + c)`. Here `g = genus Γ.CompactifiedQuotient`, `e` runs
over the elliptic orbits `Subgroup.ellipticOrbits` with stabilizer orders
`mₑ = TauCeti.cardStabilizerOnOrbit e`, and `c = Nat.card Γ.CuspOrbit` (Martin, Theorem 2.2; Beardon,
§10.4; Katok, §4.3). The statement assumes `Γ` cofinite and `X(Γ)` of finite CW type, and involves no
polygon. The cell count `χ(X(Γ)) = 2 − 2g` is kept distinct from the orbifold Euler characteristic
`χ_orb = 2 − 2g − Σₑ (1 − 1/mₑ) − c = −covolume Γ / 2π`.
*Needs:* §5.1; §§2.1, 2.4 and 2.5; Layer 4; Tau Ceti
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul`,
`TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_cuspOrbit`, `TauCeti.eulerChar_eq_cwEulerChar`,
`Subgroup.IsCofinite.finite_ellipticOrbits`, `Subgroup.IsCofinite.finite_cuspOrbit`.

**Checks.**

- The cell count `(n, k, V, c) ↦ V + c + 1 − (n − k)/2` on `PSL(2, ℤ)`: the standard triangle with
  vertices `ρ`, `ρ + 1` and `∞`, its arc self-paired by `z ↦ −1/z`, is `(3, 1, 1, 1)` and gives `2`,
  genus `0`, which is `χ(X(1)) = 2` (`TauCeti.ModularGroup.eulerChar_compactifiedQuotient`). Leaving
  the midpoints of the self-paired sides out of the vertices gives the count
  `V + c + 1 − (n + k)/2`, which is `1` on this polygon, not `χ(X(1))`. Splitting the arc at `i`
  into two sides paired by `z ↦ −1/z` does not give a convex `4`-gon in the sense of Tau Ceti's
  `TauCeti.UpperHalfPlane.ConvexPolygon`. The vertex `ρ + 1` lies on the unit circle, the geodesic
  through `ρ` and `i`, and not strictly to its left, so that region is outside the cell count.
- The image of `Γ(2)`, on the ideal quadrilateral with vertices `−1`, `0`, `1` and `∞`, is
  `(4, 0, 0, 3)` and gives `2`, genus `0`. Leaving the cusps out of the vertices gives
  `0 + 1 − 2 = −1`, an odd value that no closed orientable surface has.
- The commutator subgroup of `PSL(2, ℤ)`, on an ideal quadrilateral whose four vertices form one
  cycle, is `(4, 0, 0, 1)` and gives `0`, genus `1`. The regular octagon with angles `π/4` and the
  surface-word pairing of a torsion-free group of genus `2` is `(8, 0, 1, 0)` and gives `−2`,
  genus `2`.
- `PSL(2, ℤ)` has genus `0`, elliptic orders `2` and `3` and one cusp, and
  `2π(−2 + 1/2 + 2/3 + 1) = π/3`, which is Tau Ceti's `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`.
  It equals the polygon form `2π(1 − 1 − 1 + 1/2 + 2/3)` on `(3, 1, 1, 1)`. Dropping the cusp term
  gives the negative bracket `−5/6`.
- A torsion-free cocompact group of genus `2` has covolume `4π = −2πχ`.
- The `(2, 3, 7)` triangle group has covolume `π/21`. The formula with `χ_orb` in place of `−χ_orb`
  would give a negative area.

### Examples

- The image of `Γ₀(11)` has index `12` in the image of `PSL(2, ℤ)`, no elliptic points, and two
  cusps, of widths `1` and `11`. Over the orbit of `i` lie six points of multiplicity `2`, over the
  orbit of `ρ` four points of multiplicity `3`, and over the cusp the two cusps, of multiplicities
  `1` and `11`. So `R = 6 + 8 + 10 = 24`, and §5.6 gives `2g − 2 = 12 · (−2) + 24 = 0`, so the
  genus is `1`. The area formula gives covolume `2π(0 + 0 + 2) = 4π = 12 · π/3`.

### Dependencies

§§5.1–5.3: ComplexManifolds Milestones 1 and 2; AlgebraicTopology §§6.3, 6.4 and 8.7; Tau Ceti's
Euler characteristic of spaces of finite CW type, the graded commutativity of the cup product and the
degree theory of finite holomorphic maps; no other layer. §§5.4–5.7: Layers 1–4, with §§2.1, 2.4 and
2.5. Layer 5 uses no modular form, no analytic Riemann–Roch theorem, no automorphy sheaf and no
dimension formula (Convention 11).

## Layer 4a: minimal areas of cofinite Fuchsian groups

A cofinite Fuchsian group `Γ` of signature `(g; m₁, …, mᵣ; c)`, with elliptic orders `mᵢ ≥ 2` and
`c` cusps, has covolume `2πδ` for the deficit `δ = 2g − 2 + Σᵢ (1 − 1/mᵢ) + c` (§5.7; Martin,
Theorem 2.2). The deficit is positive: Tau Ceti's `MeasureTheory.covolume_pos` makes the covolume of
a discrete group positive, while `ENNReal.ofReal (2πδ)` vanishes for `δ ≤ 0`. §5.7 assumes finite CW
type of `X(Γ)`. The two lower bounds below do not assume it, and their routes take it from
AlgebraicTopology §8.7, applied to the compact Riemann surface `X(Γ)` (§§4.2–4.3) through
ComplexManifolds Milestone 1. The two equality cases assume `X(Γ)` of finite CW type, as their
signatures involve its genus. This layer owns the two minima of the covolume and their equality
cases.

### 4a.1 The minimum π/21

Prove `pi_div_twentyOne_le_covolume`: every cofinite Fuchsian group has covolume at least `π/21`
(Siegel 1945, pp. 708–718; Martin, Theorem 2.1). Without cusps, `δ ≥ 1/42` is Tau Ceti's
`TauCeti.one_div_forty_two_le_hyperbolic_deficit` (`TauCeti/Data/Rat/BranchDeficit.lean`), applied to
`g` and the multiset of elliptic orders. With `c ≥ 1` cusps, replace each cusp by an elliptic point
of order `m`. The deficit becomes `δ − c/m`, which is positive once `m ≥ 2` and `m > c/δ`. The same
lemma, applied to `g` and the elliptic orders together with `c` copies of `m`, gives
`δ > δ − c/m ≥ 1/42`.

Prove the equality case `covolume_eq_pi_div_twentyOne_iff`: for a cofinite `Γ` with `X(Γ)` of finite
CW type, the covolume is `π/21` exactly when the signature is `(0; 2, 3, 7)`, that is, genus zero, no
cusp, and one elliptic orbit of each order `2`, `3` and `7` (Martin, Theorem 2.1). The value at
`(0; 2, 3, 7)` is Tau Ceti's `TauCeti.hyperbolic_deficit_two_three_seven`. A cusp makes the
inequality strict, by the replacement argument. Without cusps, uniqueness, which the Tau Ceti lemma
does not state, is the following case analysis. If `g ≥ 2` then `δ ≥ 2`. If `g = 1`, positivity
needs `r ≥ 1`, and then `δ ≥ 1/2`. For `g = 0` positivity needs `r ≥ 3`. For `r ≥ 5`,
`δ ≥ r/2 − 2 ≥ 1/2`. For `r = 4` the all-order-two signature has `δ = 0`, and otherwise some
`mᵢ ≥ 3`, so `δ ≥ 1/6`. For `r = 3` sort `m₁ ≤ m₂ ≤ m₃`. Then `(2, 2, m₃)` has `δ < 0`. `(2, 3, m₃)`
has `δ = 1/6 − 1/m₃`, positive exactly for `m₃ ≥ 7` and equal to `1/42` only at `m₃ = 7`.
`(2, 4, m₃)` needs `m₃ ≥ 5` and has `δ ≥ 1/20`. `(2, m₂, m₃)` with `m₂ ≥ 5` has `δ ≥ 1/10`. And
`m₁ ≥ 3` gives `δ ≥ 1/12` when `δ` is positive, the case `(3, 3, 3)` having `δ = 0`.
*Needs:* §2.1; §3.1; §§4.2 and 4.3; §§5.1 and 5.7; Tau Ceti `MeasureTheory.covolume_pos`,
`TauCeti.one_div_forty_two_le_hyperbolic_deficit`, `TauCeti.hyperbolic_deficit_two_three_seven`,
`Subgroup.IsCofinite.finite_ellipticOrbits`, `Subgroup.IsCofinite.finite_cuspOrbit`; AlgebraicTopology
§8.7 with ComplexManifolds Milestone 1, for the finite CW type of `X(Γ)`.

**Checks.**

- `(0; 2, 3, 7)`: `δ = −2 + 1/2 + 2/3 + 6/7 = 1/42`, covolume `π/21`. A bound `π/42`, from forgetting
  the factor `2` in `2πδ`, would be attained by no group.
- `(0; 2, 3, 8)`: `δ = 1/24`, covolume `π/12 > π/21`. `(0; 2, 3, 6)` has `δ = 0`; it is the
  Euclidean triangle group, not a cofinite Fuchsian group.
- `(0; 2, 2, 2, 3)`: `δ = 1/6`. `(1; 2)`: `δ = 1/2`. `(2; −)`: `δ = 2`, covolume `4π`, the
  Gauss–Bonnet value `−2πχ` for `χ = −2`.
- `(0; 2, 2, 2, 2)` has `δ = 0`. The bound is false for nonpositive deficit, and the hypothesis
  `Γ.IsCofinite` is what excludes it.
- The cusp replacement on `(0; 2, 3; 1)`, with `δ = 1/6` and `c/δ = 6`: the order `m = 7` gives
  `(0; 2, 3, 7)` with `δ − 1/7 = 1/42`, so `1/6 > 1/42`. The order `m = 6` gives the Euclidean
  `(0; 2, 3, 6)` with deficit `0`, to which the lemma does not apply, which is why `m > c/δ` is
  required.

### 4a.2 The minimum π/3 with a cusp

Prove `minimum_area_finite_area_orbifold`: a cofinite Fuchsian group with at least one cusp has
covolume at least `π/3`. Prove the equality case `covolume_eq_pi_div_three_iff`: for such a group
with `X(Γ)` of finite CW type, the covolume is `π/3` exactly for signature `(0; 2, 3; 1)`, that of
`PSL(2, ℤ)`. The covolume of `PSL(2, ℤ)` is Tau Ceti's `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`.
Both statements follow from the area formula (Martin, Theorem 2.2) by the following case analysis,
which is this roadmap's own; Tau Ceti's deficit lemma has no cusp term.

| Signature range | Deficit and area |
|---|---|
| `g ≥ 2` | `δ ≥ 3`, area at least `6π` |
| `g = 1` | `δ ≥ 1`, area at least `2π` |
| `g = 0, c ≥ 3` | `δ ≥ 1`, area at least `2π` |
| `g = 0, c = 2` | `r = 0` gives `δ = 0`; for `r ≥ 1`, `δ ≥ 1/2`, area at least `π` |
| `g = 0, c = 1, r ≤ 1` | `δ < 0` |
| `g = 0, c = 1, r = 2` | sort `m₁ ≤ m₂`; `(2, 2)` gives `δ = 0`, `(2, 3)` the minimum `δ = 1/6`, and every other pair `δ ≥ 1/4` |
| `g = 0, c = 1, r ≥ 3` | `δ ≥ 1/2`, area at least `π` |

*Needs:* §2.1; §3.1; §§4.2 and 4.3; §§5.1 and 5.7; Tau Ceti `MeasureTheory.covolume_pos`,
`Subgroup.IsCofinite.finite_ellipticOrbits`, `Subgroup.IsCofinite.finite_cuspOrbit`,
`TauCeti.ModularGroup.covolume_psl2zToPSL2RRange`; AlgebraicTopology §8.7 with ComplexManifolds
Milestone 1, for the finite CW type of `X(Γ)`.

**Checks.**

- `(0; 2, 3; 1)`: `δ = −2 + 1/2 + 2/3 + 1 = 1/6`, covolume `π/3`, the covolume of `PSL(2, ℤ)`.
- `(0; 2; 2)`, the image of `Γ₀(2)`, of index `3`: `δ = 1/2`, covolume `π = 3 · π/3`.
- `(0; −; 3)`, the image of `Γ(2)`, of index `6`: `δ = 1`, covolume `2π = 6 · π/3`. And `(1; −; 1)`,
  the commutator subgroup, of index `6`: also `2π`.
- `(0; 2, 2; 1)` has `δ = 0`, and the compact `(0; 2, 3, 7)` has covolume `π/21 < π/3`: the bound
  needs the cusp.

### Examples

- The `(2, 3, 7)` triangle group of §2.6 is cofinite with signature `(0; 2, 3, 7)` and covolume
  `π/21`, so the bound of §4a.1 is attained. The image of `PSL(2, ℤ)` attains the bound of §4a.2.

### Dependencies

§2.1, §3.1, §§4.2–4.3, §§5.1 and 5.7. Tau Ceti: positivity of covolume, the deficit bound `1/42`
and its value at `(2, 3, 7)`, finiteness of elliptic and cusp orbits, and the covolume of
`PSL(2, ℤ)`. AlgebraicTopology §8.7 with ComplexManifolds Milestone 1 for the finite CW type of
`X(Γ)` in the two lower bounds.

## Layer 6: the level-one modular quotient, in construction order

The layer consumes Tau Ceti's normalized `j`-function `TauCeti.ModularForm.j`
(`Analysis/Complex/ModularForms/LevelOne/JInputs.lean`), its modular invariance, q-expansion and
exact elliptic orders (supplier contracts), and proceeds in the construction order below, which is
normative.

### 6.1 The level-one group and its compactified quotient

Layers 0–4 apply to the effective level-one modular group `psl2zToPSL2R.range`. It is cofinite
(`TauCeti.ModularGroup.isCofinite_psl2zToPSL2RRange`). Its elliptic orbits are those of `ρ` and `i`
(`TauCeti.ModularGroup.ellipticOrbits_psl2zToPSL2RRange`), with stabilizer orders `3` and `2`
(`TauCeti.ModularGroup.card_stabilizer_psl2zToPSL2RRange_ρ`,
`TauCeti.ModularGroup.card_stabilizer_psl2zToPSL2RRange_I`). It has a unique cusp
(`TauCeti.ModularGroup.instUniqueCuspOrbit`), and its compactified quotient `X(1)` is compact
(`TauCeti.ModularGroup.compactSpace_compactifiedQuotient`). Its signature `(0; 2, 3; 1)` and its
covolume are read off the standard fundamental triangle
(`TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul`). The genus `genus X(1) = 0`,
which ModularForms §10A expects in its level-one Check of the genus formula, follows from the
definition of `genus` (§5.1) and Tau Ceti's `TauCeti.ModularGroup.eulerChar_compactifiedQuotient`,
`χ(X(1)) = 2`, with `TauCeti.ModularGroup.finiteCWType_compactifiedQuotient` (Diamond–Shurman,
§§2.3–2.4).

### 6.2 The descent of j

The descent of `j` to the uncompactified quotient is `TauCeti.ModularGroup.jQuotient`, with local
multiplicity `1` at the orbits of `ρ` and `i` (`TauCeti.ModularGroup.localMultiplicity_jQuotient_ρ`,
`TauCeti.ModularGroup.localMultiplicity_jQuotient_I`). Its meromorphic extension over the cusp is
`TauCeti.ModularGroup.jCompactified` (`TauCeti.ModularGroup.meromorphicAt_jCompactified`,
`Fuchsian/LevelOne/Extension.lean`) (Diamond–Shurman, §§2.3–2.4; Serre, Chapter VII).

### 6.3 The map X(1) → P¹ and its degree

The extension as a holomorphic map `X(1) → P¹` is `TauCeti.ModularGroup.jSphere`. It has a single
simple pole over infinity, at the cusp (`TauCeti.ModularGroup.jSphere_eq_infty_iff`,
`TauCeti.ModularGroup.localMultiplicity_jSphere_ofCusp`), and degree one,
`TauCeti.ModularGroup.degree_jSphere`, by the fibre count of §5.2 (Diamond–Shurman, §§2.3–2.4).

**Checks.**

- The fibre of `jSphere` over `∞` is the cusp alone, with local multiplicity `1`, the order of the
  pole of `q⁻¹ + 744 + …`. The fibre over `0` is the orbit of `ρ`, with local multiplicity `1`
  downstairs, although `j` vanishes to order `3` at `ρ` upstairs. A degree read off the upstairs
  order at `ρ` would be `3`.

### 6.4 The biholomorphism X(1) ≃ P¹

The degree-one theorem gives the named biholomorphism
`TauCeti.ModularGroup.jBiholomorph : X(1) ≃ P¹`. It is the descended `j`-map
(`TauCeti.ModularGroup.coe_jBiholomorph`) and is normalized by `ρ ↦ 0` and `i ↦ 1728`
(`TauCeti.ModularGroup.jBiholomorph_ρ`, `TauCeti.ModularGroup.jBiholomorph_I`,
`Fuchsian/LevelOne/Sphere.lean`) (Diamond–Shurman, §§2.3–2.4; Serre, Chapter VII).

### 6.5 No backward transfer of the atlas

No atlas is transferred backward by fiat. Every statement about `P¹` is obtained through the
biholomorphism of §6.4, after the compact quotient already exists. The level-one compact quotient is
a compact Riemann surface before `j` is descended, and the proof of `X(1) ≃ P¹` passes through the
theorem that the descended map has degree one (Diamond–Shurman, §§2.3–2.4).

### Examples

- `j(i) = 1728` and `j(ρ) = 0` (`TauCeti.ModularForm.j_I`, `TauCeti.ModularForm.j_ρ`): indeed
  `j − 1728 = E₆²/Δ` (`TauCeti.ModularForm.j_sub_1728`) and `E₆(i) = 0`, while `j = E₄³/Δ` and
  `E₄(ρ) = 0`. Under `TauCeti.ModularGroup.jBiholomorph` the orbit of `i` goes to `1728`, the orbit of
  `ρ` to `0`, and the cusp to `∞`.

### Dependencies

Layers 0–5. Tau Ceti: the normalized `j`-function `TauCeti.ModularForm.j`, `TauCeti.ModularForm.j_smul_SL2Z`,
`TauCeti.ModularForm.j_sub_1728`, `TauCeti.ModularForm.analyticOrderAt_j_comp_ofComplex_ρ`,
`TauCeti.ModularForm.analyticOrderAt_j_sub_1728_comp_ofComplex_I`, `TauCeti.ModularForm.laurentQExpansion_j`,
and the level-one declarations named above.

## Downstream consumers

- ModularForms §10A and §10B consume the compactified quotients, the degree theory and the
  topological genus of Layers 0–5. Its §10A and §10D consume the identification `X(1) ≃ P¹` of
  Layer 6. ModularForms §10B compares its analytic genus `dim H¹(X, 𝒪)` with the genus of §5.1.
- PseudoholomorphicCurveAnalysis and NoncongruenceModularForms cite the genus of §5.1 as
  `RiemannSurface.genus`.

## Scope and ownership

**This roadmap owns** the geometry of orientation-preserving Fuchsian groups acting on the upper
half-plane, with special attention to cofinite groups, finite elliptic stabilizers, the cusp
compactification, triangle groups, polygon presentations and the descent of invariant meromorphic
functions: Layers 0–6 and Layer 4a above. Its Layer 0 also restricts Mathlib's action of `GL(2, ℝ)`
on ℍ, through `PGL(2, ℝ)`, to the projective action, and proves that every element of `GL(2, ℝ)`,
including the antiholomorphic elements of negative determinant, acts by an isometry of the hyperbolic
distance. Its presentations of the acting Fuchsian group are Poincaré's side-pairing presentations,
by the side relations and the finite vertex-cycle relations (§2.3), and their converse for Dirichlet
polygons (§2.4); it derives from them no canonical presentation by the signature
`(g; m₁, …, mᵣ; c)`. It introduces no general orbifold groupoid and no orbifold fundamental-group
carrier.

The roadmap is complete when the following hold.

1. `PSL(2, ℝ)` has its effective, continuous, faithful and holomorphic action on Mathlib's
   `UpperHalfPlane`. Discrete subgroups act properly discontinuously, and all their point
   stabilizers are finite (§§0.2–0.4).
2. The free locus has the standard orbit quotient, covering projection and complex-manifold
   structure (§0.5). At an elliptic point of stabilizer order `m`, a linearizing coordinate
   identifies the local quotient with `z ↦ zᵐ`. The quotient surface remains smooth there, and the
   quotient map has ramification index `m` (§§1.1–1.4).
3. Parabolic fixed points, cusps, normalized cusp data, precisely invariant horodiscs and
   q-coordinates are constructed. Cusp width belongs to the chosen normalized scaling datum rather
   than to the cusp alone. A cofinite group has finitely many cusp orbits (§§3.1–3.4).
4. Adjoining those cusp orbits to the coarse quotient gives a compact Hausdorff second-countable
   Riemann surface. The inclusion of the uncompactified quotient is open, and the q-coordinate gives
   every cusp chart (§§4.1–4.4).
5. Invariant holomorphic and meromorphic functions descend through the quotient and extend across
   cusps under exact q-expansion or growth hypotheses. Local orders upstairs and downstairs account
   for elliptic ramification and cusp widths (§§1.5, 3.5, 4.4, 5.4).
6. A compact connected Riemann surface has a topological genus `g` with `χ = 2 − 2g`, and every
   finite holomorphic map of compact connected Riemann surfaces satisfies Riemann–Hurwitz in genus
   form (§§5.1, 5.3). Both are applied to Fuchsian quotients and finite-index maps (§5.6), and the
   genus of the compactified quotient enters the orbifold area formula (§5.7).
7. Fundamental polygons and the Poincaré polygon theorem produce the side-pairing presentations,
   orbifold signatures, genus formula and triangle-group examples (§§2.2–2.6, 4.5, 5.7).
8. The level-one modular quotient is constructed and compactified before any identification with
   `P¹`. The descended normalized `j`-map has degree one and supplies that identification (Layer 6).
9. Every cofinite Fuchsian group has covolume at least `π/21`, with equality exactly for signature
   `(0; 2, 3, 7)`. Every cofinite group with a cusp has covolume at least `π/3`, with equality
   exactly for signature `(0; 2, 3; 1)` (Layer 4a).
10. `PSL(2, ℝ)` is second countable (§0.1). Every element of `GL(2, ℝ)` acts on ℍ by an isometry of
    `dist` (§0.2) and by a Riemannian isometry of the Poincaré metric. The Riemannian distance of
    the Poincaré metric is Mathlib's `dist` (`isRiemannianManifold_upperHalfPlane`). The map
    `x + iy ↦ (x, y)` is a Riemannian isometry onto `TauCeti.UpperHalfSpace ℝ` and an isometry
    `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ`; it carries curvature `−1` to the Poincaré metric, whose distance
    is complete (§2.1).

**What the library already has.** Layers 1, 3, 4 and 6, together with §§0.3–0.5, the action part of
§0.2, the metric, volume and covolume facts of §2.1, §§2.2–2.6, §5.2, §5.4 and §5.5, are Tau Ceti
declarations at the pin. They are named at their sections above and listed in the supplier
contracts, and this roadmap does not plan them again. The targets that the pins lack are these:
second countability of `PSL(2, ℝ)` (§0.1), for which instance search at the pins finds no
`SecondCountableTopology` instance on `SL(2, ℝ)` or `PSL(2, ℝ)`; the isometric action of the
elements of `GL(2, ℝ)` of negative determinant (§0.2); the Riemannian statements (a)–(f) of §2.1;
the topological genus with `χ = 2 − 2g`, Riemann–Hurwitz in genus form, the Fuchsian
Riemann–Hurwitz formula with the multiplicativity of `χ_orb`, and the cell count with the intrinsic
orbifold area formula (§§5.1, 5.3, 5.6 and 5.7); and the minimal areas with their equality cases
(§§4a.1 and 4a.2). The pins give the finite CW type of a compactified quotient only for `X(1)`
(`TauCeti.ModularGroup.finiteCWType_compactifiedQuotient`).

**Owned elsewhere, or outside the roadmap.**

- *Teichmüller theory and arithmetic groups.* Marked Teichmüller space and the marked moduli-space
  construction are not part of this roadmap. Nor are arithmetic Fuchsian lattices, their
  fixed-signature finiteness, commensurators and the applications built on them. No layer here
  uses any of them.
- *Outside the roadmap.* General Kleinian groups, higher-dimensional locally symmetric spaces,
  automorphic representations and the classification of all two-dimensional orbifolds.
- *Modular forms.* [ModularForms](../ModularForms/README.md) owns modular forms and functions before
  descent (its Layers 0–9), the congruence-subgroup arithmetic of `X(Γ)`, including the genus
  formula of a congruence subgroup in the index of its image in `PSL(2, ℤ)` and its numbers of
  elliptic points and cusps, which it obtains from the Fuchsian Riemann–Hurwitz formula of §5.6
  (§10A), analytic Riemann–Roch (§10B), and automorphy sheaves and dimension formulas (§10C). Hecke
  operators and the construction and q-expansion of modular forms stay there.
  NoncongruenceModularForms §2.3 proves the same genus formula for every finite-index subgroup of
  `PSL(2, ℤ)`. ModularForms §§10A and 10B consume the
  compactified quotients, degree theory and topological genus of Layers 0–5, and its §§10A and 10D
  consume the identification `X(1) ≃ P¹` of Layer 6. This roadmap does not reconstruct modular
  forms, cohomology or Riemann–Roch in its level-one application. The normalized level-one
  `j`-function and its inputs are Tau Ceti's (supplier contracts); Layer 6 owns the descent of `j` to
  `X(1)`, its extension over the cusp and the degree-one identification `X(1) ≃ P¹`.
- *Universal covers.* [UniversalCovers](../../Completed/UniversalCovers/README.md) owns universal
  covers and deck groups (Stages 0–1), the lifting criterion and the correspondence between covers
  and subgroups of `π₁` (Stage 2), and induced maps on higher homotopy groups (Stage 3). No layer here
  consumes them. The covering statements of this roadmap are Tau Ceti's
  `TauCeti.isCoveringMap_quotientMk_freeLocus`, for the projection of the free locus (§0.5), and
  `TauCeti.Subgroup.CuspDatum.meridian_lift_endpoint`, for the lifted cusp meridian (Convention 6).
  The presentations of Layer 2 are side-pairing presentations read off polygons, not computations
  of fundamental groups.
- *Conformal mapping.* [ConformalMapping](../../Completed/ConformalMapping/README.md) owns the
  Riemann mapping theorem (Layer 3), and analytic continuation and Schwarz reflection across analytic
  arcs (Layer 4). No layer here consumes them. The polygons of Layer 2 are hyperbolic polygons with
  side pairings, and the extensions of functions across cusps (§§3.5, 5.4 and 6.2) are
  removable-singularity and q-expansion arguments.
- *Algebraic topology.* [AlgebraicTopology](../AlgebraicTopology/README.md) owns finite CW type,
  Poincaré duality and the Euler characteristic: its §8.7 gives finite CW type to a compact smooth
  manifold, also with finitely many marked interior points, and its §6.4 supplies Poincaré duality
  of a closed oriented manifold. The Euler characteristic of a space of finite CW type is Tau Ceti's
  `TauCeti.eulerChar`, and the branched-cover formula `χ(X) = deg f · χ(Y) − R(f)` is Tau Ceti's.
  This roadmap owns the topological genus of a compact connected Riemann surface with the identity
  `χ = 2 − 2g` (§5.1), and Riemann–Hurwitz in genus form (§5.3); no analytic genus and no
  Riemann–Roch theorem enters either. [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md)
  §7.7 compares its Hodge genus `h^(1,0)` with the first Betti number, and ModularForms §10B
  compares its analytic genus with the genus of §5.1; neither comparison is an input here.
- *Algebraic curves.* [AlgebraicCurves](../AlgebraicCurves/README.md) owns algebraic curves and
  their function fields (its Layer 0, and the dictionary between function fields and curves of its
  Layer 12). This roadmap constructs analytic Riemann surfaces. It proves no GAGA equivalence and
  creates no algebraic curve by declaration.
- *Complex manifolds.* [ComplexManifolds](../ComplexManifolds/README.md) Milestones 1, 2 and 4–6
  supply the general framework: restriction of scalars to the underlying real surface, its canonical
  orientation, free properly discontinuous holomorphic quotients, atlas gluing, and the separation
  and countability of finite gluings. The free-locus, elliptic and cusp charts of Layers 0, 1 and 4
  specialise it beyond its free-action hypotheses. ComplexManifolds Milestone 3 consumes the same
  Riemann-sphere instance `OnePoint.instChartedSpace` as Layer 6.

## Exact supplier contracts

### From Mathlib

- **The upper half-plane.** `UpperHalfPlane` (`Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean`),
  with its topology and complex manifold structure (`UpperHalfPlane/Topology.lean`,
  `UpperHalfPlane/Manifold.lean`). Its metric `dist`, with `UpperHalfPlane.dist_eq`
  (`dist z w = 2 arsinh(|z − w|/(2√(Im z · Im w)))`), the instance `ProperSpace ℍ` and the
  instance `IsIsometricSMul SL(2, ℝ) ℍ` (`UpperHalfPlane/Metric.lean`). Its measure
  `MeasureTheory.volume`, with `UpperHalfPlane.volume_def` (density `y⁻²`), local finiteness and
  `GL(2, ℝ)`-invariance (`UpperHalfPlane/Measure.lean`).
- **The actions.** `UpperHalfPlane.glAction`, through complex conjugation `UpperHalfPlane.σ g` when
  `det g < 0`; its descent `MulAction PGL(2, ℝ) ℍ`; `UpperHalfPlane.J`, the matrix `diag(−1, 1)`,
  with `UpperHalfPlane.coe_J_smul`; and `UpperHalfPlane.im_smul_eq_div_normSq`, the formula
  `Im(g • z) = |det g| Im z / |cz + d|²` (`UpperHalfPlane/MoebiusAction.lean`). The faithfulness
  instance `FaithfulSMul PGL(2, ℝ) ℍ` (`UpperHalfPlane/FixedPoints.lean`). Continuity and properness
  of the `SL(2, ℝ)` action, and proper discontinuity of discrete subgroups of `SL(2, ℝ)`
  (`UpperHalfPlane/ProperAction.lean`, `Topology/Algebra/Group/DiscontinuousSubgroup.lean`).
- **The groups.** `Matrix.ProjectiveSpecialLinearGroup`, `Matrix.ProjectiveSpecialLinearGroup.toPGL`
  and `Matrix.SpecialLinearGroup.isClosedEmbedding_val` (for `R` a `T1Space`). The quotient-group
  instances `QuotientGroup.instTopologicalSpace`, `QuotientGroup.instIsTopologicalGroup`,
  `QuotientGroup.instT2Space` (for a closed subgroup) and
  `QuotientGroup.instSecondCountableTopology` (for a second-countable topological group).
- **Quotients and actions.** `MulAction`, `MulAction.orbitRel.Quotient`, `MulAction.stabilizer`,
  `FaithfulSMul`, `ContinuousSMul`, `IsIsometricSMul`, `ProperlyDiscontinuousSMul`,
  `SecondCountableTopology` and `t2Space_of_properlyDiscontinuousSMul_of_t2Space`.
- **Covolume.** `MeasureTheory.covolume`, the volume of some fundamental domain, or `0` if none
  exists (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean`).
- **Riemannian geometry.** `IsRiemannianManifold`: the distance is the infimum of the lengths of
  `C¹` paths in the tangent norms (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`).
  `IsometryClass`, `IsManifold`, `EuclideanSpace` and `WithLp`.
- **Complex analysis and topology.** `OnePoint`; analytic functions, isolated zeros, removable
  singularities, power series, the exponential, winding numbers and the argument principle;
  `Nat.card` and `ENNReal.ofReal`.

### From Tau Ceti

Paths are under `TauCeti/`. Every declaration below is proved at the pin.

- **The effective action.** `UpperHalfPlane.instMulActionPSL2`, `UpperHalfPlane.pslMk_smul` and
  `UpperHalfPlane.toPGL_smul`, and the instance `FaithfulSMul PSL(2, ℝ) ℍ`
  (`Analysis/Complex/UpperHalfPlane/PSL/Action.lean`). The instances `ContinuousSMul PSL(2, ℝ) ℍ`,
  `IsIsometricSMul PSL(2, ℝ) ℍ` and `ProperSMul PSL(2, ℝ) ℍ` (`UpperHalfPlane/ProperAction.lean`).
  `UpperHalfPlane.instContMDiffConstSMulPSL2` (`UpperHalfPlane/PSL/Manifold.lean`).
  `TauCeti.UpperHalfPlane.isometry_J_smul`: `z ↦ −conj z` is an isometry
  (`UpperHalfPlane/Geodesic/Reflection.lean`). `psl2zToPSL2R : PSL(2, ℤ) →* PSL(2, ℝ)`
  (`LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean`).
- **Discrete subgroups.** The instance `ProperlyDiscontinuousSMul Γ ℍ` for `[DiscreteTopology Γ]`
  (`Analysis/Complex/Fuchsian/ProperAction.lean`). `Subgroup.isCyclic_stabilizer` (a finite point
  stabilizer is cyclic), `Subgroup.stabilizerDeriv` (a homomorphism `stabilizer Γ z →* ℂ`),
  `Subgroup.stabilizerDeriv_injective`, `Subgroup.orderOf_stabilizerDeriv` and
  `Subgroup.exists_discCoordinate_generator_transition` (`Analysis/Complex/UpperHalfPlane/Stabilizer.lean`).
  `TauCeti.freeLocus`, `TauCeti.isOpen_freeLocus` and `TauCeti.isCoveringMap_quotientMk_freeLocus`,
  for a properly discontinuous action (`Topology/Algebra/GroupAction/FreeLocus.lean`).
  `Subgroup.isLocalDiffeomorph_quotientMk_freeLocus`, for discrete `Γ`
  (`Analysis/Complex/Fuchsian/FreeLocus.lean`).
- **Elliptic charts and the coarse quotient.** `Subgroup.stabilizerBall`,
  `Subgroup.stabilizerBallHomeomorph`, `Subgroup.eventually_isOpenEmbedding_orbitRelQuotientMap_stabilizerBall`
  and `Subgroup.stabilizerBallQuotientHomeomorph` (for `ε ≥ 0` and a finite stabilizer)
  (`Analysis/Complex/UpperHalfPlane/Elliptic.lean`). `Subgroup.LinearizingCoordinate`
  (`Analysis/Complex/Fuchsian/Elliptic/Linearizing.lean`). `Subgroup.stabilizerBallQuotientChart`,
  `Subgroup.stabilizerBallQuotientChart_symm_pow` and `Subgroup.stabilizerBallQuotientChart_trans_apply`
  (`Fuchsian/Elliptic/Basic.lean`). `Subgroup.instChartedSpaceOrbitRelQuotient`,
  `Subgroup.instIsManifoldOrbitRelQuotient`, `Subgroup.instSecondCountableTopologyOrbitRelQuotient`
  and `Subgroup.mdifferentiable_quotientMk` (`Fuchsian/CoarseQuotient.lean`).
  `Subgroup.localMultiplicity_quotientMk` (the local multiplicity at `z` is `Nat.card (stabilizer Γ z)`)
  and `Subgroup.one_lt_localMultiplicity_quotientMk_iff` (`Fuchsian/Ramification.lean`).
  `Subgroup.existsUnique_mdifferentiable_quotientMk` (`Fuchsian/Descent.lean`),
  `Subgroup.existsUnique_meromorphicAt_quotientMk` and `Subgroup.meromorphicOrderAt_comp_quotientMk`
  (`Fuchsian/MeromorphicDescent.lean`), with no freeness assumption.
- **Metric, area and covolume.** `TauCeti.UpperHalfPlane.poincareRiemannianMetric`,
  `UpperHalfPlane.poincareRiemannianMetric_inner` and `UpperHalfPlane.riemannianVolume_eq_volume`
  (`Analysis/Complex/UpperHalfPlane/PoincareMetric.lean`). `Subgroup.exists_isFundamentalDomain`
  (discrete `Γ`) and `Subgroup.IsCofinite`, the structure with fields `DiscreteTopology Γ` and
  `covolume Γ ℍ ≠ ∞` (`Fuchsian/Covolume.lean`). `TauCeti.UpperHalfPlane.volume_triangle`
  (`UpperHalfPlane/Triangle.lean`) and `TauCeti.UpperHalfPlane.CompactConvexPolygon.volume_carrier`
  (`UpperHalfPlane/Polygon/GaussBonnet.lean`). `MeasureTheory.covolume_pos`: a countable group acting
  with a fundamental domain for a nonzero invariant measure has positive covolume.
  `MeasureTheory.covolume_eq_card_mul_covolume`: for `Δ ≤ Γ` with `Γ` countable and having a
  fundamental domain, `covolume Δ = [Γ : Δ] · covolume Γ` in `ℕ∞`
  (`MeasureTheory/Group/FundamentalDomain.lean`).
- **Riemannian geometry.** `TauCeti.Isom` (`Geometry/Manifold/Riemannian/Isometry/Group.lean`).
  `TauCeti.RiemannianIsometry`, a smooth diffeomorphism preserving the inner products of tangent
  vectors (`Riemannian/Isometry/Basic.lean`). `TauCeti.RiemannianIsometry.riemannianEDist_eq`, with
  its `IsometryClass` instance (`Riemannian/Isometry/Distance.lean`).
  `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff` (`Riemannian/Isometry/Curvature.lean`).
  `TauCeti.MetricSpace.ofRiemannianMetric`, for a `T3Space` and `PreconnectedSpace` manifold
  (`Riemannian/Distance.lean`). `TauCeti.UpperHalfSpace`, `TauCeti.UpperHalfSpace.riemannianMetric`
  and `TauCeti.UpperHalfSpace.inner_def` (`Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean`),
  `TauCeti.UpperHalfSpace.hyperbolicMetric`, the metric packaged with completeness and curvature `−1`
  (`…/UpperHalfSpace/Metric.lean`), and `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`
  (`…/UpperHalfSpace/Curvature.lean`).
- **Polygons, presentations and triangle groups.** `TauCeti.UpperHalfPlane.ConvexPolygon` and
  `TauCeti.UpperHalfPlane.ConvexPolygon.interiorAngle` (`Analysis/Complex/UpperHalfPlane/Polygon/Convex.lean`);
  `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing`, `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.cycleMap`, `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.FiniteVertexCycle` and `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.IdealVertexCycle`
  (`UpperHalfPlane/Polygon/SidePairing/`). `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.locallyFinite_smul_carrier_iff_isParabolic_cycleMap`
  (`Fuchsian/FundamentalPolygon.lean`). `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.isFundamentalDomain_carrier_of_isParabolic`,
  `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.isCofinite_of_isParabolic` and `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.relatorQuotientTo_bijective_of_isParabolic`, under the
  angle condition at the finite vertex cycles and parabolicity at the ideal vertices
  (`Fuchsian/Polygon/Poincare.lean`). `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.ellipticOrbitEquiv` and `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_ellipticOrbits`
  (`Fuchsian/Elliptic/Polygon.lean`). `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.finite_cuspOrbit` (`Fuchsian/Compactification/Polygon.lean`).
  `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.exists_cuspDatum_generator_eq_cycleMap`, `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.cuspDatum_generator_eq_cycleMap` and
  `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.meridian_lift_endpoint_eq_pairingHom_cycleWord_zpow_smul` (`Fuchsian/Cusp/Polygon.lean`).
  `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul` and `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_cuspOrbit`, for pairing maps in `Γ` with locally
  finite translates and disjoint translated interiors (`Fuchsian/Polygon/Area.lean`,
  `Fuchsian/Cusp/VertexCycle.lean`). `TauCeti.UpperHalfPlane.ConvexPolygon.locallyFinite_smul_carrier_of_isCuspPoint`
  (`Fuchsian/Polygon/LocallyFinite.lean`) and
  `TauCeti.UpperHalfPlane.ConvexPolygon.isCompact_compl_iUnion_image_horodisc`
  (`Fuchsian/Compactification/Polygon.lean`). `Subgroup.IsCofinite.exists_sidePairing_relatorQuotientTo_bijective`
  (for a Dirichlet centre in the free locus) and
  `Subgroup.isCofinite_iff_exists_convexPolygon_carrier_eq_dirichletDomain`
  (`Fuchsian/DirichletDomain/Cofinite.lean`). `TauCeti.TriangleOrder`,
  `TauCeti.TriangleOrder.reciprocal` and `TauCeti.TriangleOrder.order`
  (`Fuchsian/TriangleOrder/Basic.lean`); `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup`
  and `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroupEquiv` (`Fuchsian/TriangleOrder/Group.lean`);
  `TauCeti.UpperHalfPlane.ConvexPolygon.triangleGroup`
  (`Analysis/Complex/UpperHalfPlane/Polygon/Convex/Triangle/Group.lean`);
  `TauCeti.UpperHalfPlane.ConvexPolygon.natCard_ellipticOrbits_of_doubleTriangle` and
  `TauCeti.UpperHalfPlane.ConvexPolygon.natCard_cuspOrbit_of_doubleTriangle`
  (`Fuchsian/TriangleOrder/Signature.lean`); `TauCeti.TriangleGroup` (`GroupTheory/TriangleGroup/Basic.lean`).
- **Cusps.** `Subgroup.IsCuspPoint`, `Subgroup.isCuspPoint_iff_exists_parabolicFixedPoint_eq`,
  `Subgroup.isCuspPoint_iff_exists_mem_stabilizer_isParabolic` and `Subgroup.CuspOrbit`
  (`Fuchsian/Cusp/Basic.lean`); `Subgroup.IsCofinite.finite_cuspOrbit` (`Fuchsian/Cusp/Finite.lean`).
  `Subgroup.CuspDatum`, `Subgroup.CuspDatum.mem_stabilizer_iff`,
  `Subgroup.CuspDatum.mem_stabilizer_iff_conj`, `Subgroup.IsCuspPoint.exists_cuspDatum` (discrete `Γ`)
  and `Subgroup.CuspDatum.ext` (`Fuchsian/Cusp/Datum.lean`). `TauCeti.Subgroup.CuspDatum.horodisc`,
  `TauCeti.Subgroup.CuspDatum.disjoint_smul_horodisc` (discrete `Γ`, height at least the width),
  `TauCeti.Subgroup.CuspDatum.disjoint_image_quotientMk_horodisc_iff` and
  `TauCeti.Subgroup.CuspDatum.norm_qCoordinate_lt_iff_mem_horodisc` (`Fuchsian/Cusp/Horodisc.lean`).
  `TauCeti.Subgroup.CuspDatum.coordinate`, `TauCeti.Subgroup.CuspDatum.coordinate_smul` and
  `TauCeti.Subgroup.CuspDatum.quotientHomeomorph` (`Fuchsian/Cusp/Coordinate.lean`).
  `TauCeti.cuspDatum_width_eq_mul` and `TauCeti.cuspDatum_coordinate_eq`, for two data with the same
  cusp and `σ′ = aσ + b` (`Fuchsian/Cusp/ChangeScaling.lean`).
  `TauCeti.Subgroup.CuspDatum.meridian_lift_endpoint` and `TauCeti.Subgroup.CuspDatum.meridian_neg`
  (`Fuchsian/Cusp/Meridian.lean`). `TauCeti.Subgroup.CuspDatum.analyticAt_cuspExtension_zero`
  (`Fuchsian/Cusp/Extension.lean`), `TauCeti.Subgroup.CuspDatum.neg_natCast_le_meromorphicOrderAt_cuspExtension`
  and `TauCeti.Subgroup.CuspDatum.natCast_le_meromorphicOrderAt_cuspExtension`
  (`Fuchsian/Cusp/Growth.lean`). `TauCeti.Subgroup.CuspDatum.width_eq_widthIndex_mul`,
  `TauCeti.Subgroup.CuspDatum.widthIndex_eq_relIndex` and `TauCeti.Subgroup.CuspDatum.widthIndex_tower`
  (`Fuchsian/Cusp/Tower.lean`).
- **The compactification.** In `Fuchsian/Compactification/Basic.lean`: `Subgroup.CompactifiedQuotient`,
  `Subgroup.CompactifiedQuotient.ofQuotient`, `Subgroup.CompactifiedQuotient.ofCusp`,
  `Subgroup.CompactifiedQuotient.equivSum`, `Subgroup.CompactifiedQuotient.cuspNhd`,
  `Subgroup.CompactifiedQuotient.exists_cuspNhd_subset`, the instances
  `Subgroup.CompactifiedQuotient.instT2Space`, `Subgroup.CompactifiedQuotient.instSecondCountableTopology`
  and `Subgroup.CompactifiedQuotient.instConnectedSpace`, and
  `Subgroup.CompactifiedQuotient.isOpenEmbedding_ofQuotient`,
  `Subgroup.CompactifiedQuotient.dense_range_ofQuotient` and
  `Subgroup.CompactifiedQuotient.compl_range_ofQuotient`. The topology is defined from
  `[DiscreteTopology Γ]`. `Subgroup.IsCofinite.compactSpace_compactifiedQuotient`
  (`Fuchsian/DirichletDomain/Cofinite.lean`). `Subgroup.CompactifiedQuotient.instChartedSpace`,
  `Subgroup.CompactifiedQuotient.cuspChart_mem_atlas` and `Subgroup.CompactifiedQuotient.instIsManifold`
  (`Fuchsian/Compactification/Manifold.lean`). `Subgroup.CompactifiedQuotient.conjBiholomorph`
  (`Fuchsian/Compactification/Conj.lean`). `Subgroup.compactifiedQuotientMap`
  (`Fuchsian/Compactification/Map.lean`) and
  `Subgroup.CompactifiedQuotient.mdifferentiable_compactifiedQuotientMap`
  (`Fuchsian/Compactification/Holomorphic.lean`).
  `Subgroup.CompactifiedQuotient.localMultiplicity_compactifiedQuotientMap_ofCusp_eq_widthIndex`
  (`Fuchsian/Compactification/Cusp/LocalMultiplicity.lean`) and
  `Subgroup.CompactifiedQuotient.localMultiplicity_compactifiedQuotientMap_ofQuotient_eq_ellipticRamificationIndex`
  (`Fuchsian/Compactification/Elliptic/LocalMultiplicity.lean`), with
  `Subgroup.ellipticRamificationIndex_eq_index` and `Subgroup.ellipticRamificationIndex_tower`
  (`Fuchsian/Elliptic/Ramification.lean`).
  `Subgroup.card_fiber_compactifiedQuotientMap_eq_card_stabilizerOrbitRelQuotient`
  (`Fuchsian/Compactification/Fiber.lean`) and `Subgroup.degree_compactifiedQuotientMap`, for
  discrete `Γ` and `Δ ≤ Γ` of finite index (`Fuchsian/Compactification/Degree.lean`).
  `TauCeti.Fuchsian.exists_meromorphicAt_comp_ofQuotient` (`Fuchsian/Compactification/Extension.lean`)
  and `TauCeti.Fuchsian.compactifiedQuotientFiniteHolomorphicMap`, for `Δ ≤ Γ` of finite index, with
  no compactness hypothesis (`Fuchsian/Compactification/FiniteHolomorphicMap.lean`).
- **Elliptic orbits.** `Subgroup.ellipticOrbits`, the orbits containing a point with nontrivial
  stabilizer (`Fuchsian/Elliptic/Finite.lean`); `Subgroup.IsCofinite.finite_ellipticOrbits`
  (`Fuchsian/Elliptic/Cofinite.lean`). `TauCeti.cardStabilizerOnOrbit`, the stabilizer order as a
  function on the orbit space, counted in the acting group itself, which for `Γ ≤ PSL(2, ℝ)` is the
  effective order (`GroupTheory/GroupAction/Stabilizer/Basic.lean`).
- **Euler characteristic and finite CW type.** `TauCeti.FiniteCWType`, homotopy equivalence to a
  finite CW complex (`Topology/CWComplex/Classical/FiniteCWType.lean`), and `Homeomorph.finiteCWType`.
  `TauCeti.eulerChar`, `TauCeti.eulerChar_eq_finsum_finrank_singularHomology` (Euler–Poincaré over
  any division ring), `TauCeti.eulerChar_eq_cwEulerChar`, `ContinuousMap.HomotopyEquiv.eulerChar_eq`
  and `Homeomorph.eulerChar_eq` (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`).
  `TauCeti.finiteCWType_onePoint` (`Topology/CWComplex/Classical/Sphere/Basic.lean`),
  `TauCeti.eulerChar_onePoint` (`…/EulerCharacteristic/Sphere.lean`) and `TauCeti.eulerChar_torus`
  (`…/EulerCharacteristic/Torus.lean`). `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage`,
  for a complex with finitely many faces
  (`AlgebraicTopology/SimplicialComplex/Realization/Complement.lean`).
  `TopCat.singularCup_gradedComm`, the graded commutativity `b ⌣ a = (−1)^(pq) (a ⌣ b)` of the
  singular cup product of `a` in degree `p` and `b` in degree `q`, for coefficient pairings that
  agree up to the braiding (`AlgebraicTopology/Cohomology/GradedCommutativity.lean`).
- **Finite holomorphic maps.** `TauCeti.RiemannSurface.FiniteHolomorphicMap`, `TauCeti.RiemannSurface.degree`,
  `TauCeti.RiemannSurface.degree_eq_fiber_sum`, `TauCeti.RiemannSurface.degree_comp`,
  `TauCeti.RiemannSurface.biholomorphOfDegreeEqOne` and
  `TauCeti.RiemannSurface.biholomorphOfDegreeEqOne_toFun` (`Analysis/Complex/RiemannSurface/Degree.lean`);
  `TauCeti.RiemannSurface.localMultiplicity` (`…/LocalMultiplicity.lean`);
  `TauCeti.RiemannSurface.divisorPullback` (`…/Divisor/Basic.lean`);
  `TauCeti.RiemannSurface.ramificationDegree` (`…/Ramification.lean`);
  `TauCeti.RiemannSurface.FiniteHolomorphicMap.finite_branchValues` (`…/Branch/Values.lean`). The
  branched-cover formula
  `TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`
  (`…/Branch/EulerCharacteristic.lean`) assumes `X` and `Y` in one universe, charted on `ℂ` with
  `IsManifold 𝓘(ℂ) 1`, Hausdorff and preconnected, `X` compact, and finite CW type of `X`, of `Y`
  and of the complement of the branch values.
- **The Riemann sphere.** `OnePoint.instChartedSpace` and `OnePoint.instIsManifold`
  (`Geometry/Manifold/Instances/OnePoint/Basic.lean`).
- **The deficit bound.** `TauCeti.one_div_forty_two_le_hyperbolic_deficit`: for a genus `γ` and a
  multiset of orders all at least `2`, a positive deficit `2γ − 2 + Σᵢ (1 − 1/eᵢ)` is at least `1/42`;
  and `TauCeti.hyperbolic_deficit_two_three_seven`, its value `1/42` at `(0; 2, 3, 7)`
  (`Data/Rat/BranchDeficit.lean`).
- **The normalized `j`-function** (`Analysis/Complex/ModularForms/LevelOne/JInputs.lean`).
  `TauCeti.ModularForm.j`, defined as `E₄³/Δ`; its invariance `TauCeti.ModularForm.j_smul_SL2Z`
  under `SL(2, ℤ)`; `TauCeti.ModularForm.j_sub_1728`, `j − 1728 = E₆²/Δ`; the exact elliptic orders
  `TauCeti.ModularForm.analyticOrderAt_j_comp_ofComplex_ρ` (`j` vanishes to order `3` at `ρ`) and
  `TauCeti.ModularForm.analyticOrderAt_j_sub_1728_comp_ofComplex_I` (`j − 1728` vanishes to order
  `2` at `i`); the q-expansion `TauCeti.ModularForm.laurentQExpansion_j`, with a simple pole `q⁻¹`
  at the cusp; and the values `TauCeti.ModularForm.j_ρ` (`j(ρ) = 0`) and `TauCeti.ModularForm.j_I`
  (`j(i) = 1728`).
- **Level one.** `TauCeti.ModularGroup.isCofinite_psl2zToPSL2RRange`,
  `TauCeti.ModularGroup.card_stabilizer_psl2zToPSL2RRange_ρ`,
  `TauCeti.ModularGroup.card_stabilizer_psl2zToPSL2RRange_I` and
  `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange` (`Fuchsian/LevelOne/Basic.lean`);
  `TauCeti.ModularGroup.finiteCWType_compactifiedQuotient`,
  `TauCeti.ModularGroup.eulerChar_compactifiedQuotient`,
  `TauCeti.ModularGroup.ellipticOrbits_psl2zToPSL2RRange` and
  `TauCeti.ModularGroup.covolume_psl2zToPSL2RRange_eq_two_pi_mul` (`Fuchsian/LevelOne/Signature.lean`);
  `TauCeti.ModularGroup.instUniqueCuspOrbit` and `TauCeti.ModularGroup.compactSpace_compactifiedQuotient`
  (`Fuchsian/Compactification/LevelOne.lean`); `TauCeti.ModularGroup.jQuotient`,
  `TauCeti.ModularGroup.localMultiplicity_jQuotient_ρ` and
  `TauCeti.ModularGroup.localMultiplicity_jQuotient_I` (`Fuchsian/LevelOne/ModularInvariant.lean`);
  `TauCeti.ModularGroup.jCompactified` and `TauCeti.ModularGroup.meromorphicAt_jCompactified`
  (`Fuchsian/LevelOne/Extension.lean`); `TauCeti.ModularGroup.jSphere`,
  `TauCeti.ModularGroup.jSphere_eq_infty_iff`, `TauCeti.ModularGroup.localMultiplicity_jSphere_ofCusp`,
  `TauCeti.ModularGroup.degree_jSphere`, `TauCeti.ModularGroup.jBiholomorph`,
  `TauCeti.ModularGroup.coe_jBiholomorph`, `TauCeti.ModularGroup.jBiholomorph_ρ` and
  `TauCeti.ModularGroup.jBiholomorph_I` (`Fuchsian/LevelOne/Sphere.lean`).

### From TauCetiRoadmap.ComplexManifolds

Milestone 1: restriction of scalars from a complex to the underlying real smooth surface, and the
coordinate equivalence of `ℂ` with `EuclideanSpace ℝ (Fin 2)`, used by §§5.1 and 5.6 and Layer 4a.
Milestone 2: the canonical orientation of that surface, used by §5.1. Milestone 4: the free properly
discontinuous holomorphic quotient, local biholomorphism and invariant-map descent, which §0.5
specialises. Milestone 5: compatible atlas gluing, and Milestone 6: Hausdorffness, second
countability and proper-map comparisons, which Layers 1 and 4 specialise to the elliptic and cusp
charts.

### From TauCetiRoadmap.AlgebraicTopology

§6.3: the correspondence between smooth orientations and integral homological orientations, used
by §5.1 to pass from the orientation of ComplexManifolds Milestone 2 to a fundamental class of `X`.
§6.4: Poincaré duality for a compact Hausdorff topological manifold with a fundamental class, over
every commutative ring, used by §5.1 over `ℚ` for `b₂ = b₀` and for the nondegeneracy of the
cup-product pairing on `H¹(X; ℚ)`, which gives the evenness of the first Betti number. §8.7: finite
CW type of a compact Hausdorff second-countable smooth manifold with the Euclidean model, including
the form with finitely many prescribed interior marked points; it is used by §5.1, by §5.3 for the
punctured target, and by §5.6 and Layer 4a for the finite CW type of `X(Γ)`. Its conclusion is Tau
Ceti's `TauCeti.FiniteCWType`, and AlgebraicTopology's Euler characteristic of a space of finite CW
type (§7.1) is Tau Ceti's `TauCeti.eulerChar`.

## References

- Alan Beardon, *The Geometry of Discrete Groups*, Graduate Texts in Mathematics 91, Springer,
  1983, especially Chapters 7–11.
- Svetlana Katok, *Fuchsian Groups*, Chicago Lectures in Mathematics, University of Chicago Press,
  1992, especially §1.2 and Chapters 2–4.
- Fred Diamond and Jerry Shurman, *A First Course in Modular Forms*, Graduate Texts in Mathematics
  228, Springer, 2005, §§2.1–2.4.
- Otto Forster, *Lectures on Riemann Surfaces*, Graduate Texts in Mathematics 81, Springer, 1981,
  especially §§4, 17 and 19.
- Hershel Farkas and Irwin Kra, *Riemann Surfaces*, Graduate Texts in Mathematics 71, Springer,
  second edition, 1992, §§I.2, III.1 and IV.9.
- Rick Miranda, *Algebraic Curves and Riemann Surfaces*, Graduate Studies in Mathematics 5,
  American Mathematical Society, 1995, Chapter II §4 and Chapter III.
- Jean-Pierre Serre, *A Course in Arithmetic*, Graduate Texts in Mathematics 7, Springer, 1973,
  Chapter VII.
- Gaven J. Martin, *The geometry and arithmetic of Kleinian groups*, arXiv:1311.2636 (2013),
  Theorems 2.1 (Siegel's minimal coarea `π/21`, attained only by the `(2, 3, 7)` triangle group)
  and 2.2 (the signature area formula).
- Carl Ludwig Siegel, *Some remarks on discontinuous groups*, Annals of Mathematics 46 (1945),
  708–718, doi:10.2307/1969206 (the minimal covolume `π/21`).
- John Stillwell, *Geometry of Surfaces*, Universitext, Springer, 1992, Chapter 5.
