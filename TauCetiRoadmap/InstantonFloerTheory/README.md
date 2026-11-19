# Roadmap: instanton Floer theory

**Summary.** Instanton Floer homology is the Morse homology of the Chern–Simons functional on the
connections of an SO(3) bundle over a three-manifold Y: its generators are the flat connections, and
its differential counts anti-self-dual (ASD) connections on ℝ × Y, the downward gradient lines of
the functional. This roadmap builds it from the analysis up. Throughout, Y is closed, connected,
oriented and smooth with a Riemannian metric, and the bundle data are part of every statement: a
Hermitian rank-two bundle E, a Hermitian line bundle w with a connection, and an isomorphism
det E ≅ w. The connections are those of the adjoint SO(3) bundle ad E, and the gauge group consists
of the determinant-one unitary automorphisms of E.

Three theories are built. The admissible theory applies when some integral surface class pairs
oddly with c₁(w); then no flat connection is reducible, and the Floer group I(Y)_w is an integral,
relatively ℤ/8-graded group, with a folded ℤ/4-graded variant. The theory of an integral homology
sphere with its trivial SU(2) bundle keeps the reducible trivial connection in the analysis and
carries Frøyshov's integral reducible maps and reduced groups. The framed theory I#(Y, P) is defined
over ℂ for every Y and every SO(3) bundle P, as the +2 eigenspace of the point operation on the
admissible group of Y # T³.

The headline theorems are four. First, for an admissible pair, I(Y)_w is independent of the metric,
the perturbation and the auxiliary choices, natural for bundle isomorphisms and functorial for
homology-oriented cobordisms, and I(T³)_w = ℤ ⊕ ℤ when w is dual to a circle factor. Second, if c₁(w)
is odd on an embedded torus, the point operation satisfies μ(pt)² = 4 on I(Y)_w ⊗ ℂ, while on
Σ_g × S¹ with g ≥ 1 the operator u² − 64, u = 4μ(pt), is nilpotent of exact order 2⌈g/2⌉ − 1
(Chen–Scaduto). Third, for an integral homology sphere Y, I#(Y) over ℂ is the kernel of u² − 64 on
four consecutive gradings of Frøyshov's reduced group, tensored with H_*(S³), plus a copy of ℂ in
degree 0 (Scaduto); in particular I#(S³) = ℂ. Fourth, besides Floer's surgery exact triangle and
Kronheimer–Mrowka excision, the admissible Atiyah–Floer theorem of Daemi–Fukaya–Lipyanskiy: if Y
splits along a two-component surface on each component of which the bundle is odd, and the two
restriction Lagrangians in the odd-bundle surface moduli space are embedded, the folded integral
instanton complex is isomorphic, with its relative ℤ/4 grading, to their Lagrangian Floer complex.

In Tau Ceti, FourManifolds (Layer 5) supplies the compact four-dimensional SU(2) ASD analysis, which
Layer 1 adapts to SO(3) bundles and extends to cylinders and boundaries. SmoothBundlesConnections
supplies the bundles, connections, curvature, gauge groups and holonomy. GaugeQuiltFieldTheory GQ1
supplies the odd-bundle surface moduli space with its symplectic form, and FukayaTheory and
HeegaardFloer the strip analysis and generic Fredholm theory of the Lagrangian side. Tau Ceti's
homological algebra supplies cross products and the Künneth and universal-coefficient sequences.

Layers 0–4 build the analysis: the Chern–Simons functional, Sobolev gauge theory, holonomy
perturbations, ASD trajectories, compactness, gluing and orientations. Layers 5–8 build the
complexes, cobordism maps and μ-operations, the homology-sphere and framed theories, the surgery
triangle, excision and the computations; Layers 9–10 the Lagrangian side, the mixed equation and the
Atiyah–Floer comparison. The build order is below.

## How to read the build

Layers 0–2 construct the data, the calculus, the adapters to the FourManifolds core, the slices and
the regular perturbations. Layers 3–4 construct trajectories, the compactification, gluing and the
gauge determinant orientations, before Layer 5's integral counts. In parallel, the raw mixed phase
of §10.1 (configurations, Fredholm and index theory, energy, constant caps and determinant lines) is
constructed before §9.4 uses it for paired monotonicity and coherent strip orientations; it needs no
strip or mixed count. Then come §9.4's signed pair-strip complex, §9.5's decorated comparisons, and
Layer 10's signed mixed map (§10.2) with its lifted and enriched refinements (§§10.3–10.6). Layer 6's
operations and Layer 7's reducible and framed modules use the gauge constructions of Layers 3–5;
Layer 8 uses the completed cobordism and neck calculus. §9.2 consumes GaugeQuiltFieldTheory GQ1's
surface moduli, built on HamiltonianReduction R5, independently of Layer 5's homology conclusions,
and §8.4's Morse–Bott comparison for Σ_g × S¹ uses it. No comparison constructs its own
prerequisite complex, no local theorem of FourManifolds depends on an instanton trajectory or a
mixed comparison, and the framed circle, arc and basepoint and the index-two extension remain data
throughout.

The finished roadmap is tested against: the exact Chern–Simons, gauge, ASD energy and deck-index
sign diagrams (Layer 0, §3.3); a nontrivial odd-cycle irreducibility test (§2.2); finiteness of the
regular critical set (§2.3); the compactified index-2 boundary and the signed d² = 0 (§§4.2–4.4,
5.1); two-parameter continuation composition (§5.1); the T³ test ℤ² versus ℤ (§§5.2, 8.4); ordinary
S³ versus framed S³ (§§7.4, 8.4); the genus-one exact point-square relation versus the higher-genus
nilpotent case (§§6.3, 8.4); a core-twisted surgery triangle (§8.1); both excision composites
(§8.3); and a two-component mixed splitting with its full determinant, degree and filtration
comparison (Layer 10). It is also tested against the integral coefficient-2 reducible identity and
its dual sign adapter, the kernel/image reduced point descent and the localized half-point
normalization (§§7.2–7.3); the four-grade Scaduto decomposition with its S³ and exceptional point
terms (§7.6); the U² = T⁻¹ deck and endpoint-grade diagram, the surface-form check that a
Maslov-four sphere has Ω-area 1/2, equal to the half-period action drop, both finite forgetful
quotients and small-loss enriched invariance (§§9.3, 10.3–10.4); and the general coherent-pair
versus simply connected framed decoration and sphere-orientation tests (§§9.4–9.5).

Each section's *Needs:* line lists what its statement and its route use, item by item, so that a
target proved by another route is not blocked behind an unrelated one. Supplier sections are cited
by the labels their roadmaps use.

This README is the roadmap. [Suggested.lean](Suggested.lean) is its acceptance file: its module
docstring names the headline theorems and, for each, the carrier missing at the pinned Mathlib and
Tau Ceti; none of them is statable there, so it states no theorem.

## Conventions

1. **Manifolds.** Unless a section says otherwise, Y is a nonempty closed connected oriented smooth
   three-manifold (Hausdorff, second countable, finite-dimensional) with a smooth Riemannian
   metric. Finite disjoint unions are treated in §5.3. Manifolds with boundary or cylindrical ends
   carry product collars (GeometricTopology §1.1).
2. **Bundle data.** A bundle datum on Y is a Hermitian rank-two bundle E, a Hermitian line bundle w,
   an isomorphism det E ≅ w and a unitary connection on w (§0.1). The connections are the SO(3)
   connections on ad E, compared with the U(2) connections on E inducing the fixed connection on w.
   The integral lift E and its isomorphisms are kept as data until independence of those choices
   is proved (§5.2).
3. **Lie algebra and trace.** su(2) is the space of skew-Hermitian traceless 2 × 2 matrices, tr₂ the
   trace of 2 × 2 matrices (the fundamental trace) and `B(X,Y)=−tr₂(XY)` the positive invariant form.
4. **Gauge action.** Gauge transformations act on the left, `g·A=gAg⁻¹−(dg)g⁻¹`, with infinitesimal
   generator `ξ ↦ −d_Aξ`, and `F_(A+a)=F_A+d_Aa+[a∧a]/2`; this is the convention of
   SmoothBundlesConnections B4.2. G_det is the group of determinant-one unitary automorphisms of E;
   its constant centre ±1 acts trivially, and G_det/{±1} is the effective group. The based group
   (§1.2), G_det and the full SO(3) gauge group of ad E (§0.2) are distinct groups, and stabilizers
   in the effective group and in G_det are different.
5. **Orientation.** ℝ × Y is oriented by ds followed by the orientation of Y. Four-dimensional
   cobordisms carry homology orientations (§6.1).
6. **Normalizations.** The Chern–Simons functional is the transgression with coefficient
   −1/(8π²) and the fundamental trace (§0.3); the L² pairing on one-forms is
   `(1/(4π²))∫_Y B(a∧*b)`; κ = −p₁/4; the Yang–Mills energy is `E_YM=∫|F|²_B=8π²κ` on ASD connections
   and the flow energy is `(1/(4π²))∫|∂_sA|²_B` (§0.4). A source written in another gauge, trace or
   orientation convention is transported through these definitions before it is used.
7. **Gradings.** Gradings are homological: the differential lowers degree by one, and an
   index-one trajectory from α to β contributes when |β| = |α| − 1 (§3.3). The admissible theory is
   integral and relatively ℤ/8-graded; the folded extended-gauge theory is relatively ℤ/4-graded and
   is a different construction; the homology-sphere theory has an absolute ℤ/8 grading with its own
   S³ normalization; the framed theory is over ℂ, with an absolute ℤ/4 grading for untwisted framing
   (§7.5). The graded tensor product of complexes uses `d(x⊗y)=dx⊗y+(−1)^|x| x⊗dy` (§5.3).
8. **Operations.** For a cycle z, μ(z) = −p₁/[z]/4 is a rational operation of cohomological degree
   4 − dim z (§6.2). ν_Z is the integral homological point map, a representative of −p₁ = 4μ(pt);
   u is the endomorphism ν_Z induces, so u = 4μ(pt); over ℤ[1/2], v = ν_Z/2 (§7.3). Rational
   operations, their integral multiples and integer-valued counts are never conflated. The Laurent
   variable U of §10.3 is distinct from the point operation u, and the deck generator T of §0.4 is
   distinct from the Laurent monomial `LaurentPolynomial.T`.
9. **Determinant lines.** The determinant line of a Fredholm operator D is
   `det ker D ⊗ (det coker D)*`, and the orientation of a translation quotient puts the translation
   line first: `det(D)=or(R_translation)⊗det(T M̂)` (§4.4).
10. **Reducibles and quotients.** Infinite-dimensional reducibles and based and unbased gauge
    quotients are handled by the local analysis of Layer 1, not by a theorem on free quotients by
    finite-dimensional groups.
11. **Data are kept.** The bundle, the gauge group, the coefficients and the grading are part of
    every interface; w₂, torsion, based data and orientation lines are not erased by writing only Y.
12. **Carriers.** Statements use the library carriers of the suppliers: smooth principal and
    associated bundles, connections, differential forms, Sobolev sections, continuous linear and
    Fredholm maps, determinant lines, quotients, singular homology and cohomology, chain complexes,
    modules and eigenspaces (supplier contracts below).

## Layer 0: bundles, groups, coefficients and signs

### 0.1 Admissible bundle data

Fix a bundle datum on Y (Convention 2): a Hermitian rank-two bundle E, a Hermitian line bundle w, an
isomorphism det E ≅ w and a connection on w. The traceless connection carrier is the affine space of
SO(3) connections on ad E; compare it with the space of U(2) connections on E inducing the fixed
determinant connection. Keep the integral lift and its isomorphisms until independence of those
choices is proved (§5.2).

Define a **nontrivial admissible datum** as such a datum together with an integral two-cycle S with
⟨c₁(w), S⟩ odd (Kronheimer–Mrowka §7.1, p. 52). Prove the equivalent formulation by a detecting
surface: a datum is nontrivial admissible exactly when there is an embedded closed oriented surface
R ⊂ Y with ⟨w₂(ad E), [R]⟩ ≠ 0 in ℤ/2. (An integral class in H₂(Y; ℤ) is represented by an embedded
oriented surface, and w₂(ad E) is the reduction of c₁(E) = c₁(w) modulo 2.) A bundle with w₂ ≠ 0
but no integral detecting class does not satisfy this hypothesis.

**Checks.**

- `T³` with `w` dual to one circle factor: `⟨c₁(w),[T²]⟩=1` on the transverse torus, so the pair is
  nontrivial admissible (Kronheimer–Mrowka §7.1, p. 52); the same `T³` with `w` trivial carries the
  reducible trivial connection and is not admissible.
- An integral homology sphere has `H₂(Y;ℤ)=0`, so no `w` has an odd pairing; its trivial SU(2)
  bundle is the separate input of §7.1, never an admissible datum.
- `RP³` with the SO(3) bundle `R⊕L⊕L`, `L` the nontrivial real line bundle: `w(R⊕L⊕L)=(1+a)²=1+a²`
  with `a=w₁(L)`, so `w₂=a²≠0` in `H²(RP³;ℤ/2)=ℤ/2`, but `H₂(RP³;ℤ)=0`, so there is no integral
  detecting class; the flat connection with holonomy `diag(1,−1,−1)` is reducible. This is the
  nonzero-`w₂`-without-odd-class exclusion.
- Equivalence of the two formulations: an integral class `S` with `⟨c₁(w),S⟩` odd is represented by
  an embedded oriented surface `R`, and `⟨w₂(ad E),[R]⟩≡⟨c₁(w),[R]⟩ mod 2`; a class detected only
  modulo 2, as on `RP³`, does not give the integral oddness.

*Needs:* SmoothBundlesConnections B2.5 (the adjoint bundle) and B3.1–B3.3 (principal and induced
connections); CharacteristicClasses C3.2 (Stiefel–Whitney and Chern classes); AlgebraicTopology
§§6.3–6.4 (orientation systems and Poincaré–Lefschetz duality, for the detecting surface);
Kronheimer–Mrowka §7.1 (p. 52).

### 0.2 Gauge groups, the centre and the index-two extension

Let G_det be the group of determinant-one unitary automorphisms of E. Prove that its constant
elements ±1 act trivially on connections and that on the irreducible connections the effective
quotient G_det/{±1} acts freely. Retain the ineffective centre in the groupoid, and distinguish the
based group and the full SO(3) gauge group of ad E. Construct the lifting obstruction: a
homomorphism from the full SO(3) gauge group of ad E to H¹(Y; ℤ/2) whose kernel is the image of G_det
(an automorphism of ad E lifts locally to a determinant-one automorphism of E up to sign, and the
signs form the obstruction cocycle).

A chosen odd surface R gives one particular index-two extension of the image of G_det, through the
real line bundle dual to R (Kronheimer–Mrowka §7.1, pp. 52–53); it does not license a quotient by
every extended gauge transformation. Prove that the extended transformation acts with degree four
and is compatible with the perturbations and counts before the folded ℤ/4 theory is defined (§5.2).
Invariant homology, invariant chains and orbit chains over ℤ are not identified by division by 2;
construct their comparison in each coefficient and grading scope claimed.

**Checks.**

- The constant `−1∈G_det` acts trivially on every connection, so on the irreducible locus the free
  group is `G_det/{±1}`; a count that divides by the order of a stabilizer in `G_det` instead of in
  the effective group is off by this centre.
- `T³` with the odd bundle: the determinant-one quotient has two flat classes separated by degree
  4, and the extended gauge transformation of the index-two group identifies them, so the folded
  complex has one generator (Kronheimer–Mrowka §7.1, p. 53; Scaduto §7.6, p. 34).
- On `T³` with `w` dual to the first circle, `H¹(T³;ℤ/2)=(ℤ/2)³`. In SU(2) the lifted holonomies are
  `A₂=i`, `A₃=j` (anticommuting, since `w₂` is odd on the `(2,3)`-torus) and `A₁=±1`, and the two
  flat classes modulo `G_det` are `A₁=1` and `A₁=−1`. The sign change `ε₁` of the first holonomy, which
  is the class dual to the transverse torus `R`, exchanges them; `ε₂` and `ε₃` fix each class, since
  conjugation by `j`, respectively `i`, undoes them. So the index-two extension chosen by `R` acts
  freely on the two classes, while the full group of eight elements has a stabilizer of order four at
  each; a quotient by all eight is not the free folded quotient.

*Needs:* SmoothBundlesConnections B4.2 (the gauge group and its left action) and B1.3 (Čech cocycles,
for the lifting obstruction); CharacteristicClasses C3.5 (`w₂` as the transition-lift cocycle);
§0.1; Kronheimer–Mrowka §7.1 (pp. 52–53).

### 0.3 The Chern–Simons functional and the instanton equation

Use Conventions 3–6. Define the Chern–Simons functional CS relative to a fixed reference connection
by the transgression with coefficient −1/(8π²) and the fundamental trace tr₂ (Donaldson §2.5.2,
p. 16, up to this normalization). Prove that its variation is

`δ CS_A(a)=−(1/(4π²))∫_Y tr₂(a∧F_A)`.

For nontrivial bundles construct the global relative transgression (differential-character)
definition and all change-of-reference laws. For the normalized L² pairing
`(1/(4π²))∫B(a∧*b)` on one-forms, prove `grad CS=*F_A`. Its negative gradient flow is
`∂_sA=−*F_A`, and in temporal gauge this is `F_𝔄⁺=0` on ℝ × Y (Donaldson §2.5.3, p. 20). Construct
temporal gauge and its residual gauges, rather than equating paths of connections with
four-dimensional connections without a gauge comparison.

**Checks.**

- Variation: on a trivial bundle `CS(A)=−(1/(8π²))∫_Y tr₂(A∧dA+(2/3)A∧A∧A)`, and `A↦A+ta` gives
  `(d/dt)CS=−(1/(8π²))·2∫tr₂(a∧F_A)`, the displayed `−(1/(4π²))∫tr₂(a∧F_A)`; the coefficient
  `+1/(8π²)` would turn the negative gradient flow into the self-duality equation.
- Gradient: with `B=−tr₂` and the pairing `(1/(4π²))∫B(a∧*b)`, the identity
  `(1/(4π²))∫(−tr₂)(a∧*grad CS)=−(1/(4π²))∫tr₂(a∧F_A)` forces `*grad CS=F_A`, and `**=1` on the
  forms of a three-manifold gives `grad CS=*F_A`.
- Flow versus ASD: in temporal gauge `F_𝔄=ds∧∂_sA+F_A` and, for the orientation `ds` followed by `Y`,
  `*F_𝔄=*₃∂_sA+ds∧*₃F_A`, so `F_𝔄=−*F_𝔄` is exactly `∂_sA=−*₃F_A` (Donaldson §2.5.3, p. 20); with
  the opposite product orientation the same flow would be self-dual.

*Needs:* SmoothBundlesConnections B3.1–B3.3, B4.1 (curvature and `F_(A+a)`) and B4.2;
CharacteristicClasses C4.1–C4.2 (Chern–Weil forms and their integral comparison, for the
transgression); DifferentialGeometry Layer 5 (integration and Stokes); ComplexKahlerGeometry K5a
§5.1 (the Hodge star); Donaldson §§2.5.2–2.5.3 (pp. 16–23).

### 0.4 Charge, energy and the deck generator

For the traceless curvature convention prove `p₁(ad E)=−(1/(2π²))[tr₂(F∧F)]`, and put κ = −p₁/4.
Prove that an unperturbed ASD trajectory satisfies

`E_flow=(1/(4π²))∫|∂_sA|²_B=CS(A_−)−CS(A_+)=κ`

and `E_YM=∫|F_𝔄|²_B=8π²κ`. On manifolds with ends κ is the relative transgression value with the
stated end lifts, not automatically an integer. Derive both the factor 2 between the spatial and the
four-dimensional curvature norms and the perturbation correction (§3.2). Choose the determinant-one
deck generator using the mapping-torus bundle with κ = 1, and prove that it lowers the real CS lift
by 1 and contributes +8 to the ASD path index (§3.3). Derive the obstruction and half-period law for
the chosen extended gauge transformation separately (§10.3). A sign in a cited source with the
opposite gauge convention is transported through these definitions.

**Checks.**

- `p₁` and κ: for an SU(2) bundle `c₂=(1/(8π²))∫tr₂(F∧F)` and `ad E⊗ℂ≅Sym²E`, so `p₁(ad E)=−4c₂` and
  the displayed `−(1/(2π²))[tr₂(F∧F)]` gives `κ=−p₁/4=c₂`; the coefficient `−(1/(8π²))` would make
  `κ=c₂/4`.
- Energies: on `ℝ×Y` an ASD trajectory has `|F_𝔄|²=|∂_sA|²+|F_A|²=2|∂_sA|²` pointwise, so
  `E_YM=8π²κ` and `E_flow=(1/(4π²))∫|∂_sA|²_B=κ`; this is the factor 2 between the spatial and the
  four-dimensional norms. The charge-one instanton on `S⁴` has `E_YM=8π²`.
- Deck generator: a determinant-one gauge transformation of degree one on `Y` is the clutching map of
  the mapping-torus bundle over `S¹×Y` with `κ=1`; the CS lift drops by exactly 1 and the ASD path
  index along it is `8κ=8`, so the relative grading is `ℤ/8`; the half-period extended-gauge path of
  §10.3 carries `κ=1/2` and index 4.

*Needs:* §0.3; CharacteristicClasses C3.3 (integral Pontryagin classes) and C4.1–C4.2 (Pontryagin
forms and their integral comparison); DifferentialGeometry Layer 5 (Stokes) and Layer 6 (de Rham
classes); §3.3 for the index clause; Donaldson §§2.5.2–2.5.3 (pp. 16–23).

### 0.5 Coefficient and grading scopes

The admissible complex is integral and relatively ℤ/8-graded. Ordinary Floer homology of a homology
sphere has its own S³ normalization (§7.1). The folded extended-gauge complex is relatively
ℤ/4-graded and is a different construction (§5.2). The framed eigensector of §7.4 is over ℂ.
Rational operations μ = −p₁/4, their integral multiples and integer-valued counts are not conflated
(Convention 8). Every later section states its coefficient ring and grading in these terms.

*Needs:* §§0.1–0.4.

### Examples

- `T³` with `w` dual to a circle factor is the standing nontrivial admissible example: two flat
  classes modulo determinant-one gauge, degree difference 4, a deck generator with `κ=1`; it is
  reused in Layer 5, in §7.4 (the framing summand) and in Layer 8.
- `S³` with the trivial SU(2) bundle is not admissible; it is the base case of the homology-sphere
  theory of Layer 7 and gives the calibration `I(S³)=0`, `I#(S³)=ℂ`.
- The bundle `R⊕L⊕L` on `RP³` is the negative example: nonzero `w₂`, no odd integral class, a
  reducible flat connection.

### Dependencies

Mathlib's smooth vector bundles and their smooth sections (`ContMDiffSection`); SmoothBundlesConnections
B1.3, B2.5, B3.1–B3.3, B4.1–B4.2 and B5.2; DifferentialGeometry Layers 5–6; ComplexKahlerGeometry K5a
§5.1; CharacteristicClasses C3.2, C3.3, C3.5 and C4.1–C4.2; AlgebraicTopology §§6.3–6.4. Of later
layers, only the index clause of §0.4 uses §3.3, and the extended-gauge half-period law of §0.4 is
completed in §10.3.

## Layer 1: nonlinear gauge completions and quotient topology

### 1.1 Sobolev connections and gauge groups

Construct H^k connections and H^(k+1) determinant-one gauge transformations for every integer k ≥ 2 in
dimension three, and consume the k ≥ 3 compact four-dimensional SU(2) realization of FourManifolds
Layer 5 through the same bundle Sobolev scale; construct its SO(3) comparison and its weighted and
local end extensions (§§1.3–1.4). Gauge transformations are Sobolev sections of the associated SU(2)
group bundle. For the three-dimensional and extension problems prove multiplication, inversion,
exponential and composition estimates in charts, transition compatibility, smoothness of the action
and of the curvature map one derivative lower, separability, and independence of the atlas, the
reference and the Sobolev order; on the shared compact SU(2) scope consume FourManifolds Layer 5 and
prove the carrier comparison. Retain finite-regularity and compact-parameter estimates with explicit
derivative budgets. Build on ComplexKahlerGeometry K5a's shared carriers `BundleSobolev` and
`RealBundleSobolev` (§5.4) and construct their nonlinear gauge applications (Donaldson–Kronheimer
Chapter 4).

*Needs:* FourManifolds Layer 5 (its carrier `A₀+H^s(T*X⊗ad P)` with `H^(s+1)` gauge transformations,
`s≥3`); ComplexKahlerGeometry K5a §5.4 (`BundleSobolev`, `RealBundleSobolev`); PseudodifferentialOperators
P5 (Sobolev multiplication and mapping estimates); SmoothBundlesConnections B4.2 (the gauge group);
§0.2; Donaldson–Kronheimer Chapter 4.

### 1.2 Slices, stabilizers and the quotient topology

At any smooth reference connection A invert `d_A*d_A` on the complement of H⁰_A, with the Green
comparison of ComplexKahlerGeometry K5a §5.7. Consume FourManifolds Layer 5's compact SU(2) slice and
its inverse, and construct the three-dimensional, SO(3), end and relative versions, with uniqueness
modulo the stabilizer, local properness against remote gauges, the quotient topology, the comparison
of based and unbased quotients and smooth transition laws. At irreducible connections H⁰_A = 0; at
reducible ones keep the stabilizer and its Kuranishi model. Stabilizers in the effective group and in
G_det are different. Prove weak-gauge regularity between smooth fields, local bootstrap and bundle
globalization; a newly smoothed bundle is identified with the original only by an explicit gauge or
bundle isomorphism. Families require common neighbourhoods and estimates, not only individual
smoothing (Donaldson–Kronheimer Chapter 4).

**Checks.**

- The trivial connection `θ` on the trivial SU(2) bundle over `S³` has `H⁰_θ=su(2)`, the constant
  sections; its stabilizer is `SU(2)` in `G_det` and `SO(3)` in the effective group. A slice theorem
  that assumed `H⁰_A=0`, or a count that used the stabilizer in `G_det` for the effective quotient,
  would be wrong exactly there (§7.1).

*Needs:* §1.1; ComplexKahlerGeometry K5a §5.7 (Laplace-type estimates and the Green operator);
PseudodifferentialOperators P6 (ellipticity, parametrices and Fredholm theory); FourManifolds Layer 5
(the compact SU(2) Coulomb slice and its inverse); SmoothBundlesConnections B1.4 (slices and free
proper quotients); Donaldson–Kronheimer Chapter 4.

### 1.3 The four-dimensional SU(2) core and the SO(3) adapter

Consume the compact and local **SU(2)** nonlinear core of FourManifolds Layer 5. Its common carrier is
`A₀+H^s(T*X⊗ad P)` with `H^(s+1)` sections of the associated SU(2) group bundle, for s ≥ 3 in
dimension four, with its stabilizer-orthogonal Coulomb inverse and determinant data. Its unit-ball
critical theorem gives, below the curvature threshold and modulo constant SU(2), a gauge with
`d*a=0`, `a(ν)=0` on the boundary and `‖a‖_(W¹,²)+‖a‖_L⁴≤C‖F_A‖_L²`, with scale, chart, approximation
and higher-regularity comparisons. That theorem, its removable-singularity and local compactness
statements and the compact ASD and Uhlenbeck core have one analytic owner, FourManifolds; neither the
H^k slice nor the surface theory of HamiltonianReduction R5 is a second proof of them.

Own here the **SO(3) adapter and the instanton extensions**. On a contractible four-ball lift the
SO(3) bundle and connection to SU(2), compare the adjoint covariant derivative, the invariant metric,
Coulomb gauge, curvature and the critical norms, and descend the estimates through the central double
cover. On overlaps retain the possible central signs of the lifted transitions, their Čech w₂
cocycle and the gauge identifications, and prove compatibility before patching on the original SO(3)
bundle. A local lift does not give a global SU(2) lift. Compare `p₁(ad E)=c₁(E)²−4c₂(E)` for a U(2)
lift and `κ=c₂(E)−c₁(E)²/4`; when the determinant is trivial this is FourManifolds' charge k = c₂.
Transport its BPST energy 8π² to Layer 0's fundamental trace and relative-end normalization,
retaining nonintegral relative κ where allowed. Compare the common Fredholm and determinant carriers
and the homology orientations through these bundle and trace maps.

**Checks.**

- Split `E=L⊕L'` on a closed four-manifold, `x=c₁(L)−c₁(L')`: `ad E⊗ℂ=ℂ⊕L⁻¹L'⊕L'⁻¹L`, so
  `p₁(ad E)=x²=c₁(E)²−4c₂(E)` and `κ=c₂−c₁²/4=−x²/4`. When `x²` is odd, κ is not an integer:
  `κ∈−(ℤ+1/4)` if `x²≡1 mod 4` and `κ∈−(ℤ+3/4)` if `x²≡3 mod 4`; on `CP²` with `x` the hyperplane class
  `κ=−1/4`. A class `x` that is merely not divisible by 2 need not give a nonintegral charge: on
  `S²×S²`, `x=(1,0)` has `x²=0` and `κ=0`. Trivial determinant gives `κ=c₂∈ℤ`, FourManifolds' `k`.
- The local lift: on a ball every SO(3) bundle lifts to SU(2), two lifts of a trivialization
  differing by the central sign; on `T³` with `w₂≠0` the U(2) lift `E` exists (§7.4: the Bockstein
  vanishes) while no SU(2) lift exists, since an SU(2) lift would force `w₂=0`; the central signs of
  the patched local lifts form the Čech cocycle of `w₂`.
- The trace: FourManifolds' charge-one instanton on `S⁴` has `E_YM=8π²` with the fundamental trace
  `tr₂`, matching `κ=1` under `E_YM=8π²κ` (§0.4); with the trace of the adjoint representation,
  `tr(ad X ad Y)=4tr₂(XY)` on `su(2)`, the same instanton would read `32π²`, which is why the trace is
  part of the interface.

*Needs:* FourManifolds §5.1 (all-base deformation and flat strata) and §5.3 (all-charge
compactification and obstruction gluing, with the unit-ball critical estimate); SmoothBundlesConnections
B1.3 (Čech cocycles) and B2.5; CharacteristicClasses C3.3 and C3.5 (`p₁`, `w₂` as the transition-lift
cocycle); §§0.4, 1.1–1.2; Donaldson–Kronheimer Chapter 4 for the closed-base slice and Uhlenbeck
theory consumed through FourManifolds.

### 1.4 Three-dimensional, cylindrical and boundary realizations

Construct the three-dimensional Sobolev gauges and the curvature and slice compactness directly on
ComplexKahlerGeometry K5a's carriers `BundleSobolev` and `RealBundleSobolev`, which K5a specifies.
Own the cylindrical, weighted, neck and boundary realizations, fixed-collar relative estimates,
holonomy perturbations and their scaling errors (§2.1), path-class and charge bookkeeping, end
breaking, stabilizer and reducible models, and the mixed seam extensions (§10.1). Apply the local
FourManifolds estimates in controlled charts and prove here the global transition compatibility, the
uniform end and parameter estimates and the quotient-topology comparisons. Compact closed-base theory
alone supplies none of these extensions, and no instanton trajectory or mixed comparison theorem is a
premise of FourManifolds' shared local theorem.

*Needs:* §§1.1–1.3; ComplexKahlerGeometry K5a §5.4; PseudodifferentialOperators P5–P6;
GeometricTopology §1.1 (collars); FourManifolds §5.3.

### Examples

- The split U(2) bundle `L⊕L'` on `CP²` with `c₁(L)−c₁(L')` the hyperplane class: `κ=−1/4`, the
  reason relative κ is kept rational on manifolds with ends.
- The BPST instanton of FourManifolds read through the adapter: `κ=1`, `E_YM=8π²`.

### Dependencies

FourManifolds Layer 5 (§§5.1, 5.3); ComplexKahlerGeometry K5a §§5.4, 5.7; PseudodifferentialOperators
P5–P6; SmoothBundlesConnections B1.3, B1.4, B2.5 and B4.2; CharacteristicClasses C3.3, C3.5; GeometricTopology
§1.1; Layer 0.

## Layer 2: holonomy perturbations and regular critical points

### 2.1 Cylinder functions and holonomy perturbations

Define cylinder functions by thickened embedded loops, holonomy in the fixed-determinant bundle,
conjugation-invariant smooth functions of the holonomies and smooth transverse measures (Donaldson
§5.5, p. 134; Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §6.1, p. 75). Construct a separable weighted
Banach space of countably many such functions with summable bounds on all the derivatives required.
Prove differentiability, gauge covariance, the L² gradient and Hessian estimates, self-adjointness on
a slice and the compact lower-order comparison. State spatial and end support and fixed-collar
requirements explicitly. For a perturbation h use `CS_h=CS+h` and the perturbed flat equation
`*F+grad h=0`.

**Checks.**

- For a loop `γ`, the holonomy of `A+ta` changes to first order by `−∫_γ a` conjugated along `γ` by
  partial parallel transport, so the gradient of a cylinder function is a one-form supported in the
  thickened loop, and its Hessian is a lower-order compact perturbation of `*d_A`; a perturbation
  supported in a collar of the detecting surface, as Layer 9 needs, is a special case.

*Needs:* SmoothBundlesConnections B5.2 (holonomy); §§1.1–1.2; HeegaardFloer F0.1 (§2.3, function spaces
and generic functions); Donaldson §5.5 (p. 134); Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §6.1 (p. 75).

### 2.2 Irreducibility, compactness and generic regularity

Prove the odd-cycle obstruction to a reducible projectively flat connection by the integral
line-splitting and curvature comparison, and prove that a sufficiently controlled small perturbation
keeps the relevant critical set irreducible. Establish compactness modulo gauge before deriving this
openness.

Prove density of regular perturbations by the holonomy variation, annihilator and unique-continuation
argument, with all incidence, end and parameter dimensions included (Donaldson §5.5.1, pp. 134–144).
Include paths and two-parameter comparisons relative to already regular end collars, and construct
their nonempty allowable extension spaces before applying Sard–Smale. Fixed critical endpoints
require the constrained perturbation argument, not arbitrary endpoint motion. For each finite list
of indices, energies, classes and parameters, let N bound the universal projection index, including
every parameter and incidence constraint; choose k > max(N, 0) and a finite auxiliary regularity
order covering the Sobolev and composition losses, and prove the universal section and projection are
C^k at that order before invoking the generic theorem. Construct smooth choices by the density and
openness argument in its stated topology; a Banach residual set alone is not a theorem on smooth
choices.

**Checks.**

- Reducibility obstruction: a projectively flat connection reducible to `U(1)×U(1)` splits
  `E=L₁⊕L₂` with equal curvature forms, so `c₁(L₁)=c₁(L₂)` in `H²(Y;ℝ)` and
  `⟨c₁(w),S⟩=2⟨c₁(L₁),S⟩` is even for every integral `S`; the odd datum excludes it. On `S¹×S²` with
  `w` trivial the trivial connection is reducible and the argument has nothing to exclude.
- Unperturbed regular set: on `T³` with the odd bundle the two flat classes are nondegenerate and
  irreducible with `h=0` (Scaduto §7.6, p. 34), so the perturbation needed there is zero; a
  construction that always forced a nonzero perturbation would lose this computation.

*Needs:* §2.1; §§1.1–1.2; HeegaardFloer F0.S (§2.1, finite-dimensional Sard), F0.0 (§2.2, generic
Fredholm sections and determinant lines) and F0.3 (§2.5, universal zero sets and the regular-parameter
projection); Kronheimer–Mrowka §7.1 (p. 52) for the admissible datum; Donaldson §5.5.1 (pp. 134–144).

### 2.3 Finiteness of the regular critical set and the extended-gauge branch

Prove that the regular critical set is discrete and compact, hence finite, for the chosen admissible
data (Donaldson §5.5, pp. 134–144), and for the homology-sphere theory of Layer 7 (Frøyshov §2, p. 4).
Finiteness is not inferred from an elliptic index alone. For the extended-gauge branch choose
compatible perturbations and prove that the extended transformation pairs the relevant critical
generators freely and acts on their orientation lines; handle equivariant regularity on the solution
strata. No freeness on the entire affine configuration space is used without proof.

*Needs:* §§2.1–2.2; §0.2 (the index-two extension); §1.2; Donaldson §5.5 (pp. 134–144); Frøyshov §2
(p. 4).

### Examples

- `T³` with the odd bundle and `h=0`: two nondegenerate irreducible critical points, the complex of
  the `ℤ⊕ℤ` computation of Layer 5.
- `S¹×S²` with the trivial bundle: the reducible trivial connection is the non-example that the
  odd-cycle hypothesis removes.

### Dependencies

HeegaardFloer F0.S, F0.0, F0.1, F0.3 (Layer 2 there); SmoothBundlesConnections B5.2; Layers 0–1.

## Layer 3: cylinder ASD analysis, index and convergence

### 3.1 The weighted Fredholm theory of the linearized operator

For a trajectory from α to β construct the gauge-fixed operator `d_𝔄*⊕d_𝔄⁺` plus the holonomy Hessian
on weighted Sobolev bundles. Choose weights strictly within the gaps of the nondegenerate end
Hessians, identify the kernel and cokernel with the deformation problem, and prove Fredholmness, the
spectral-flow index, index gluing and the determinant exact sequences (Donaldson §3.2, p. 47,
§3.3.1, p. 58). Build the cylindrical parametrix from the spectral decomposition at the ends, cutoffs
and a compact-core comparison; neither a compact-base index theorem nor a weighted Cauchy–Riemann
operator is already this realization.

*Needs:* §§1.1–1.4, 2.1; PseudodifferentialOperators P1 (principal symbols of differential
operators), P5–P7 (Sobolev estimates, ellipticity and parametrices, elliptic powers); IndexTheory I1–I2
(Fredholm connectors, symbol classes and the analytic index); HeegaardFloer F0.2 (§2.4, trajectory path
charts and asymptotically hyperbolic Fredholm theory) and F0.0 (§2.2, determinant lines); Donaldson
§3.2 (p. 47) and §3.3.1 (p. 58).

### 3.2 The perturbed flow: energy, regularity and convergence

For `X_h=grad h` derive `∂_sA=−*F_A−X_h(A)` and, in temporal gauge, `F_𝔄⁺=−(ds∧X_h+*₃X_h)/2`. Prove
that the perturbed flow energy equals the drop of CS_h for s-independent h. For varying h_s include
the explicit integral of `∂_sh_s(A_s)`, with the correct sign and an integrable uniform bound on the
parameter sector. Prove local elliptic regularity, finite-energy limits modulo gauge, exponential
convergence in all controlled derivatives and uniqueness of the limiting critical orbit (Donaldson
§4.1, p. 77). Give constants uniform on compact regular sectors, relative families and necks with a
fixed common end gap; uniform compact-sector estimates are distinct from arbitrary approaches to
degeneracy. Quotient the nonconstant trajectories by translation and prove that this action is free
and proper with genuine slices; stationary trajectories have their own carrier and are not divided by
an ℝ-action as though it were free.

**Checks.**

- Temporal gauge: with `F_𝔄=ds∧∂_sA+F_A` and `*F_𝔄=*₃∂_sA+ds∧*₃F_A` (§0.3), substituting
  `∂_sA=−*₃F_A−X_h` gives `F_𝔄+*F_𝔄=−ds∧X_h−*₃X_h`, twice the displayed `F_𝔄⁺`; the flow
  `∂_sA=−*₃F_A+X_h` would give `+(ds∧X_h+*₃X_h)/2` and be the downward flow of `CS−h`, not of `CS_h`.

*Needs:* §3.1; §§0.3–0.4, 2.1; PseudodifferentialOperators P5–P6; HeegaardFloer F0.2 (§2.4); Donaldson
§4.1 (p. 77) and §§4.2–4.3 (pp. 82–90).

### 3.3 The index formula and the relative grading

For the ASD symbol on a closed connected oriented four-manifold X and an SO(3) bundle P, derive

`ind_R(d_A*⊕d_A⁺)=−2⟨p₁(ad P),[X]⟩−3(1−b₁(X)+b⁺(X))=8κ−3(1−b₁+b⁺)`

from the symbol and index comparison (Donaldson–Kronheimer Chapter 4; Donaldson §3.2, p. 47, for the
tube version), retaining the stabilizer and obstruction spaces in the index. The cylindrical and
cobordism end corrections come from the relative spectral-flow and Fredholm gluing problem; the
closed formula does not supply them by omission. Define the relative degree by the path index modulo
8, and prove independence of the path through the gauge-period and index calculation of §0.4
(Donaldson §3.3.2, p. 64). A trajectory contributes to the differential when its unquotiented index
is 1 and its translation quotient is zero-dimensional; prove the homological convention
|β| = |α| − 1. The degree-four extended-gauge action induces the folded ℤ/4 grading only after its
index and determinant transport have been constructed. Export the orientation-reversal (dual complex)
and disjoint-union comparisons with their exact degree and Koszul conventions.

**Checks.**

- `S⁴`, `κ=1`: `8−3(1−0+0)=5`, the dimension of the charge-one instanton moduli space; a formula
  omitting `b₁` would fail on `S¹×S³`, where `1−b₁+b⁺=0` and the index is `8κ`.
- The cylinder: the deck generator of §0.4 changes the index by `8κ=8`, so the relative degree is
  defined modulo 8 and not modulo 4; the extended-gauge half-period changes it by 4, which is why the
  folded theory is `ℤ/4`-graded (Kronheimer–Mrowka §7.1, p. 53: the involution has degree 4). On
  `ℝ×T³` the path classes between the two flat classes have indices `≡4 mod 8`, for instance the class
  of index 4 and its deck shift of index 12.
- Homological convention: a trajectory from `α` to `β` of unquotiented index 1 contributes to
  `d:C_|α|→C_(|α|−1)`, so `|β|=|α|−1`; the ASD equation is the negative gradient flow, so
  `CS(α)>CS(β)`, in agreement with `E_flow=CS(A_−)−CS(A_+)` of §0.4.
- The untwisted term: for trivial coefficients `d*⊕d⁺:Ω¹→Ω⁰⊕Ω⁺` has index `−(1−b₁+b⁺)=−(χ+σ)/2`,
  from `χ=2−2b₁+b₂` and `σ=b⁺−b⁻`; the factor 3 is `dim su(2)`.

*Needs:* §§3.1–3.2, 0.4; PseudodifferentialOperators P1, P5–P7; IndexTheory I1–I2 and I7 (§7.1 the de
Rham and §7.2 the signature operator, whose indices χ and σ give the untwisted term); SpinGeometry
G6.1 and G6.4 (`D=d+d*` on exterior forms and its symbol, for the symbol of `d_A*⊕d_A⁺`) and G2
(volume, chirality and exterior-form comparisons); HeegaardFloer F0.2 (§2.4); Donaldson–Kronheimer
Chapter 4; Donaldson §3.2 (p. 47) and §3.3.2 (p. 64).

### Examples

- Charge one on `S⁴`: index 5, the translations and dilations of the BPST family.
- `ℝ×T³` between the two flat classes of §2.3: path classes of index `4+8n`, so that the degree
  difference of the generators is 4.

### Dependencies

PseudodifferentialOperators P1, P5–P7; IndexTheory I1–I2, I7; SpinGeometry G2, G6.1, G6.4; HeegaardFloer
F0.0, F0.2; Layers 0–2.

## Layer 4: Uhlenbeck compactification, gluing and orientations

### 4.1 Compactness and energy quantization

Apply FourManifolds' shared local and compact SU(2) ε-regularity, removability and Uhlenbeck core
through the SO(3) lift, transition and trace comparison of §1.3. Construct energy concentration and
quantization, convergence modulo gauge away from finitely many points, and the ideal-connection
topology on the compact SO(3) cobordisms and cylinders, with their boundary and end data and global
bundle data (Donaldson §5.1, p. 113). Include perturbed equations, with the scaling behaviour of
holonomy perturbations, and bounded-energy and fixed-end families. Retain multiplicities, lost
relative charge and determinant bundle data. On an S⁴ bubble the charge is a positive integer and the
unnormalized energy is 8π² times that charge; end breaking and interior bubbling are distinct limiting
phenomena.

*Needs:* FourManifolds §5.3 (ε-regularity, removable singularities and the Uhlenbeck core) through
§1.3; §§1.4, 2.1, 3.2; GeometricTopology §1.1 (collars); Donaldson §5.1 (p. 113); Donaldson–Kronheimer
Chapter 4.

### 4.2 Energy bounds and the exclusion of bubbles in low dimension

Prove fixed-index energy bounds, including the relation between the CS lift and the path class and
the perturbation budget, before compactness is used for counts. For the index-1 and index-2 cylinder
moduli and the low-dimensional continuation families required, establish regularity of all
lower-charge ideal strata and show that bubbles cannot appear. The dimension of an ideal stratum drops
by 4 per simple bubble once its centre is retained, not by 8. Higher-dimensional constrained μ or
sewing moduli require their own compactified cutdown and bubble analysis; this low-dimensional
exclusion is not reused for them.

**Checks.**

- Bubble count: a simple bubble of charge one at a retained centre lowers the dimension of the ideal
  stratum by `8−4=4` (`dim M_(κ−1)+dim X=(d−8)+4`), not by 8; so the index-1 and index-2 cylinder
  moduli, of dimension at most 2 before translation, meet no bubble stratum.

*Needs:* §§4.1, 3.2–3.3, 0.4; §2.2 (regular perturbations); Donaldson §5.1 (p. 113).

### 4.3 Gluing

Construct pregluing for broken trajectories and cylindrical cobordisms, right inverses with norm and
neck bounds, the nonlinear contraction, uniqueness and neighbourhood surjectivity (Donaldson §4.4,
p. 91; Donaldson–Kronheimer Chapter 7). Include all finite breaks, compatible corner and parameter
descriptions and the inverse charts needed to identify the full boundary; a formal broken
configuration is not a gluing theorem. Retain the scale, rotation and centre variables in bubble
charts whenever the operation uses them. Identify which regularity and compactness theorems control
each chart.

*Needs:* §§3.1–3.2, 4.1–4.2; HeegaardFloer F0.0 (§2.2, determinant lines and their gluing) and F1
(Layer 3 there, the Cauchy–Riemann elliptic package; F1.4 its Fredholm, determinant and exact-sequence
interfaces); GeometricTopology §1.1 (collars) and §1.3 (gluing along the boundary); Donaldson §4.4
(p. 91); Donaldson–Kronheimer Chapter 7.

### 4.4 Determinant lines and coherent orientations

Use the real determinant lines `det ker⊗(det coker)*`. Construct coherent orientation lines o_α for
the critical points and ordered gluing maps, with the translation line first and the quotient
orientation defined by `det(D)=or(R_translation)⊗det(T M̂)` (Donaldson §5.4, p. 130;
Donaldson–Kronheimer Chapter 5 for orientability on closed manifolds). Fix the source and target of
determinants and the boundary-normal conventions once, and prove the signed broken-boundary equation
giving d² = 0, including the permutations of parameter lines. Prove gauge and extended-gauge
orientation transport, independence of stabilization, and the composition of homology orientations
for cobordisms. At nontrivial stabilizers use their representation on these lines. A final free sign
± is not a normalization theorem.

**Checks.**

- Determinant order: between `det ker⊗(det coker)*` and the opposite order the comparison sign on a
  fibre with `dim ker=dim coker=1` is `(−1)^(1·1)=−1`; a convention that ignored this would flip the
  sign of every count on a fibre of odd-odd type.
- Translation first: for a trajectory with translation quotient `M̂`, moving the translation line from
  first to last changes the orientation by `(−1)^(dim M̂)`; this is trivial for rigid trajectories and
  equals `−1` on the one-dimensional quotients whose ends give `d²=0`, so the two orders give opposite
  boundary signs and only one of them is the signed broken-boundary equation.

*Needs:* §§3.1, 3.3, 4.3; HeegaardFloer F0.0 (§2.2) and F1.4 (determinant and orientation
interfaces); §0.2 (the extended transformation); Donaldson §5.4 (p. 130); Donaldson–Kronheimer Chapter
5.

### Examples

- Charge-one bubbling on `S⁴`: the energy `8π²` concentrates at a point, the weak limit is the flat
  connection, and the retained centre and scale are the bubble parameters.
- The two-point broken boundary of a one-dimensional translation quotient on `ℝ×T³`: both ends are
  glued from index-one pieces and the signed count of ends is zero.

### Dependencies

FourManifolds §5.3; HeegaardFloer F0.0, F1 (F1.4); GeometricTopology §§1.1, 1.3; Layers 0–3.

## Layer 5: integral complexes, continuation and naturality

### 5.1 The orientation-line complex and continuation

Define `C_i(Y,E,h)=⊕_(|α|=i) o_α` over the finite critical set of §2.3. Rigid trajectories induce
homomorphisms o_α → o_β; compactness makes their signed sum finite. Construct the ℤ/8-graded chain
complex and prove d² = 0 from Layer 4, not from an assumed Floer package (Donaldson §§5.2–5.3,
pp. 122–129). Give chain maps for regular continuation data, with finite sums and energy estimates,
chain homotopies for two-parameter data, and the identity and composition laws. Build the
continuation system and the canonical comparison maps, with coherent choices sufficient for
naturality under diffeomorphisms and bundle isomorphisms; an isomorphism of abstract groups does not
by itself give a natural invariant.

*Needs:* §§2.3, 3.3, 4.1–4.4; AlgebraicTopology §§2.1, 2.6 (relative chains and local coefficient
systems); Mathlib `HomologicalComplex`; HeegaardFloer M.5 (§1.5, continuation chain maps, digon
homotopies and triangle composition, as the template); Donaldson §§5.2–5.3 (pp. 122–129).

### 5.2 Independence, naturality, duality and the folded complex

Prove independence of the metric, the perturbation, the Sobolev order and the reference, and the
comparisons for a change of integral lift and of determinant connection, in the declared bundle
scope, and prove the orientation-reversal duality (Donaldson §5.3, p. 123). Treat determinant twists
and extended-gauge operations with their supplied isomorphisms. Do not erase w₂, torsion, based data or orientation
lines by writing only Y. Export the chosen index-two orbit complex with its integral counts and the
grading-folding comparison (Donaldson §5.6, p. 145; Kronheimer–Mrowka §7.1, pp. 52–53). Over ℂ prove
the corresponding identification of invariants and coinvariants through the free chain action. Any
stronger statement on integral invariant homology requires its own proof.

**Checks.**

- `T³`, odd bundle: two generators of degrees differing by 4, zero differential, `I(T³)_w=ℤ⊕ℤ`
  (Kronheimer–Mrowka §7.1, p. 53); the index-two folded complex has one generator and homology `ℤ`,
  the fixed group of the degree-4 involution exchanging the two summands (Kronheimer–Mrowka §7.1,
  p. 53; Scaduto §7.6, p. 34).
- `S³`, trivial bundle: no irreducible flat connection, so the ordinary complex is zero and
  `I(S³)=0`; the framed `I#(S³)=ℂ` of §7.4 is a different object.

*Needs:* §5.1; §§0.1–0.2, 2.3, 3.3, 4.4; Donaldson §5.3 (p. 123) and §5.6 (p. 145); Kronheimer–Mrowka
§7.1 (pp. 52–53).

### 5.3 Disjoint unions

For a finite disjoint union define the complex as the graded tensor product over ℤ of the component
complexes, the componentwise bundle and admissibility data being part of the datum, with the unit
complex ℤ in degree 0 as the value on the empty union. Each component complex is only relatively
ℤ/8-graded (§0.5), so choose an absolute lift of each component's grading; give x⊗y the degree
|x| + |y| and the differential `d(x⊗y)=dx⊗y+(−1)^|x| x⊗dy`, the parity of |x| being well defined
modulo 8. Shifting the lift of the first factor by k shifts every degree by k and changes the
differential by the isomorphism `x⊗y↦(−1)^(k|y|)x⊗y`; shifting the lift of the second factor changes
only the degrees. The sign `(−1)^(|x||y|)` is that of the symmetry isomorphism
`x⊗y↦(−1)^(|x||y|)y⊗x`, which reorders the components of the union; it is not the sign of the
differential. Over ℤ retain the derived (Künneth) Tor terms (§5.4) rather than identifying the
homology with an underived tensor product without hypotheses; over ℂ give the resulting tensor
comparison.

**Checks.**

- Disjoint union `T³⊔T³`: the graded tensor product `(ℤ⊕ℤ)⊗(ℤ⊕ℤ)=ℤ⁴` with no Tor term, both complexes
  being free with zero differential. A definition taking the direct sum of the complexes also has rank
  4 here, in the same degrees when both lifts put the generators in degrees 0 and 4, so this union
  does not separate the two; three copies of `T³` do (rank 8 against 6), and so does the empty union,
  whose value is the unit `ℤ` in degree 0, not `0`.
- Sign of the differential: take `C` with `e↦f` in degrees 1→0 and `C'` with `g↦h` in degrees 2→1.
  With `(−1)^|x|`, `d(e⊗g)=f⊗g−e⊗h`, `d(f⊗g)=f⊗h` and `d(e⊗h)=f⊗h`, so `d²(e⊗g)=0`. With the symmetry
  sign `(−1)^(|x||y|)` in its place, `d(e⊗g)=f⊗g+e⊗h` and `d²(e⊗g)=2f⊗h≠0`, so that rule does not give
  a complex. Shifting the lift of `C` by 1 gives `d(e⊗g)=f⊗g+e⊗h`, `d(f⊗g)=−f⊗h`, `d(e⊗h)=f⊗h`, and
  `x⊗y↦(−1)^|y|x⊗y`, which fixes `e⊗g` and `f⊗g` and negates `e⊗h` and `f⊗h`, carries the first
  differential to the second.

*Needs:* §§5.1–5.2, 3.3 (the disjoint-union and Koszul conventions); Mathlib `HomologicalComplex`;
§5.4 for the Tor terms; Tau Ceti `HomologicalComplex.homologyCross`.

### 5.4 The cyclically graded Künneth sequence

State and prove the cyclically graded Künneth short exact sequence at the generality of its proof.
Let R be a principal ideal domain, m ≥ 1, and C, C' complexes of R-modules graded by `ZMod (2m)` with
`d:C_p→C_(p−1)`, C degreewise free and C' arbitrary. Their tensor product has
`⊕_(p+q=n)C_p⊗_R C'_q` in degree n and the differential of §5.3, with the sign `(−1)^p` on
`C_p⊗C'_q`; this sign is well defined and additive in p ∈ `ZMod (2m)` exactly because the modulus is
even. Construct the tensor-sign datum `ComplexShape.TensorSigns` on `ComplexShape.down (ZMod (2m))`
with ε(p) = (−1)^p. Then for every n ∈ `ZMod (2m)` the sequence

`0→⊕_(p+q=n)H_p(C)⊗_R H_q(C')→H_n(C⊗_R C')→⊕_(p+q=n−1)Tor₁^R(H_p(C),H_q(C'))→0`

is exact, the sums running over pairs in `ZMod (2m)`. The admissible complexes over ℤ are the case
2m = 8 and the folded extended-gauge complexes the case 2m = 4, each with chosen absolute lifts, and
the coefficient rings ℤ[1/2] and ℂ of Layer 7 are instances of R.

*Route.* Use the free-cycles argument of Tau Ceti's ℕ-indexed sequence. The cycles and boundaries of
C are submodules of free R-modules, hence free, so `0→Z_p→C_p→B_(p−1)→0` splits; tensoring
`0→Z→C→B[−1]→0`, whose outer terms have zero differential, with C' gives a degreewise split short
exact sequence of complexes; the outer homologies are `Z⊗H(C')` and `B[−1]⊗H(C')`, because Z and B are
free with zero differential; the connecting map is, up to sign, the inclusion of boundaries into
cycles tensored with H(C'); and the tensor term is its cokernel and the Tor term its kernel,
`0→B_p→Z_p→H_p(C)→0` being a free resolution. The argument uses no finiteness of either complex and
no hypothesis on C'. The ℕ-indexed sequence does not apply through unrolling: the 2m-periodic
unrolling of C ⊗ C' has 2m summands in each degree while the tensor product of the two unrollings has
infinitely many, so they are different complexes. Over ℂ every complex is chain homotopy equivalent
to its homology with zero differential, so the complex-coefficient homology of a disjoint union is
the graded tensor product of the component homologies; over ℤ this identification holds exactly when
the Tor terms vanish.

**Checks.**

- Tor witness: the `ℤ/8`-graded complex `C` with generators `e` in degree 1 and `f` in degree 0 and
  `de=2f` has homology `ℤ/2` in degree 0; in its tensor square `d(e⊗e)=2f⊗e−2e⊗f` and
  `d(e⊗f)=d(f⊗e)=2f⊗f`, so the degree-1 homology is `ℤ/2`, generated by `e⊗f−f⊗e` modulo twice itself,
  which is `Tor₁(ℤ/2,ℤ/2)`, while the tensor term `⊕_(p+q=1)H_p⊗H_q` is `0`; identifying `H(C⊗C)` with
  `H(C)⊗H(C)` would give `0` in degree 1. The signs `(−1)^|x|` and `(−1)^(|x||y|)` agree on this
  complex, so it does not test the sign. The Floer complexes computed in this roadmap have
  torsion-free homology, which is why no Tor term appears in the Examples.
- Odd modulus: on `ZMod 3` a sign `ε(p)` on `C_p⊗C'_q` would need `ε(p+1)=−ε(p)`, so `ε(2)=ε(0)` and
  `ε(0)=ε(3)=−ε(2)=−ε(0)`, which is impossible. No other sign rule valid for all pairs of complexes
  exists either: each of the nine unit squares of the `(ℤ/3)²` grid needs sign product `−1`, while each
  edge sign lies on exactly two squares, so the nine products multiply to `+1`, not `(−1)^9`.
- Freeness of one factor is needed, and suffices: with `C` as in the Tor witness and `C'=ℤ/2` in
  degree 0 with zero differential, `d(e⊗1)=2f⊗1=0`, so `H_1(C⊗C')=ℤ/2=Tor₁(H_0(C),ℤ/2)` and
  `H_0(C⊗C')=ℤ/2=H_0(C)⊗ℤ/2`, as the sequence predicts for a non-free `C'`; with `C=C'=ℤ/2` in degree 0
  and zero differential, `H_1(C⊗C')=0` while the Tor term in degree 1 would be `Tor₁(ℤ/2,ℤ/2)=ℤ/2`.

*Needs:* Mathlib `HomologicalComplex`, `ComplexShape.down`, `ComplexShape.TensorSigns` and
`CategoryTheory.Tor`; Tau Ceti `HomologicalComplex.homologyCross` (on any shape carrying tensor signs),
`HomologicalComplex.homologyKunnethShortComplex_shortExact` and
`HomologicalComplex.homologyKunnethShortComplexSplitting` (the ℕ-indexed model),
`HomologicalComplex.free_cycles_of_isPrincipalIdealRing`,
`HomologicalComplex.free_cokernel_iCycles_of_isPrincipalIdealRing` and
`HomologicalComplex.isSplitMono_iCycles_of_isPrincipalIdealRing` (free cycles over a principal ideal
domain, on any shape), and `HomologicalComplex.exists_homotopyEquiv_d_eq_zero` with
`HomologicalComplex.isIso_homologyKunneth_of_isSplitMono_of_isSplitEpi` for the comparison over ℂ.

### Examples

- `I(T³)_w=ℤ⊕ℤ` and the folded `ℤ`: the acceptance test of the integral complex and of the
  orientation-line action of the extended gauge transformation.
- Continuation between two metrics on `T³`: the chain map is the identity on the two generators,
  since each flat class persists; the chain homotopy is zero.

### Dependencies

Layers 2–4; AlgebraicTopology §§2.1, 2.6; HeegaardFloer M.5; Mathlib `HomologicalComplex`,
`ComplexShape.TensorSigns`, `CategoryTheory.Tor`; Tau Ceti's cross product, Künneth, free-cycles and
splitting declarations named above.

## Layer 6: cobordisms and universal-class operations

### 6.1 Cobordism maps

For an oriented compact four-dimensional cobordism W : Y₀ → Y₁ with product end collars, a specified
SO(3) and fixed-determinant bundle restricting to the boundary data, and a homology orientation,
construct the cylindrical-end ASD equation and its allowed perturbations (Donaldson §5.3, p. 123).
State the componentwise admissibility and end conditions that guarantee irreducible limiting
problems, and include the index and energy class. Define the appropriately graded map by counting
compact zero-dimensional moduli, and prove the chain-map, cylinder, disjoint-union and gluing laws by
one-dimensional and parameterized compactifications. State hypotheses on closed components
explicitly rather than attaching arbitrary closed components without an analytic definition. Keep
the bundle extension and sums over extensions as distinct data; an unspecified sum need not be
finite. Relate these maps to the closed four-manifold invariants (Donaldson Chapter 6,
pp. 151–167).

*Needs:* §§3.1, 3.3, 4.1–4.4, 5.1–5.3; GeometricTopology §1.1 (collars), §1.3 (gluing along the
boundary, which composes cobordisms) and §1.4 (connected sum); Donaldson §5.3 (p. 123) and Chapter 6
(pp. 151–167).

### 6.2 The universal bundle and the μ-map

Construct the universal adjoint bundle over Y × B* using the based quotient of §1.2 and its descent,
and the slant operations p₁/[z]; no roadmap on main owns a slant product, so it is constructed here.
Define the rational μ(z) = −p₁/[z]/4, of cohomological degree 4 − dim z, and construct its
chain-level geometric representatives and cutdowns and their homotopy and naturality relations
(Donaldson–Kronheimer Chapter 5). Prove any claimed integral normalization or integral multiple
before using it over ℤ. Under homological grading the induced map lowers degree by 4 − dim z; the
point map has degree −4, also written +4 modulo 8. Account for bubble and collision strata in higher
cutdowns and for the changes of universal representative. Chain identities are not inferred from
formal cup products alone.

**Checks.**

- Degrees: `μ(pt)` has cohomological degree `4−0=4` and lowers the homological grading by 4, that is
  raises it by 4 modulo 8; `μ(Σ)` for a surface has degree 2 and `μ(γ)` for a loop degree 3.
- Sign: `μ(Σ)=−(1/4)p₁/[Σ]` agrees with Frøyshov (§2, p. 6) and with Kronheimer–Mrowka, whose `μ(Σ)`
  is half of Muñoz's `α` and whose `μ(y)` is `−β/4` (§7.2, p. 53), while Daemi–Fukaya–Lipyanskiy use
  `+(1/4)p₁` (*Atiyah–Floer*, Theorem 4, p. 5); the sign adapter of §10.6 is forced by this.

*Needs:* §§1.2, 4.1–4.2, 5.1, 6.1; AlgebraicTopology §§6.1–6.4 (cochains, cup and cap products,
orientation systems and duality) for the slant construction; CharacteristicClasses C3.3 and C4.1–C4.3
(the integral `p₁` and its curvature form on the universal bundle); SmoothBundlesConnections B1.4
(slices and free proper quotients); Donaldson–Kronheimer Chapter 5.

### 6.3 The point operation and the genus-one square relation

Construct commuting point and surface operations on homology and the controlled chain homotopies for
their representatives. Relate the integral normalization u to 4μ(pt), including its sign convention,
and prove the squared relation u² = 16μ(pt)² used below. For a nontrivial admissible pair with a
detecting torus, construct the genus-one neck and excision computation giving u² − 64 = 0 over ℂ;
hence μ(pt)² = 4 on that homology (Kronheimer–Mrowka §7.1, pp. 52–53, and §7.2, Proposition 7.1,
p. 53). For a detecting surface of higher genus retain the nilpotent correction, which vanishes again
in genus 2 over ℂ (§8.4); knowing only that the spectrum lies in {±2} does not give the exact square
identity.

**Checks.**

- Normalization: `u=4μ(pt)` gives `u²=16μ(pt)²`; on `I(S¹×Σ)_w` the point class has eigenvalues `±2`
  (Kronheimer–Mrowka Proposition 7.1, p. 53: the simultaneous eigenvalues of `(μ(Σ),μ(pt))` are
  `(i^r·2k,(−1)^r·2)` with `0≤k≤g−1` and `r=0,1,2,3`), so `u` has eigenvalues `±8` and `u²−64` is
  nilpotent; it vanishes in genus one (the exact square) and on `Σ₃×S¹` its nilpotence exponent is 3 (Chen–Scaduto Theorem 1, p. 1), so
  `μ(pt)²=4` is a genus-one statement, not a general identity.

*Needs:* §§6.1–6.2; §4.3 (neck-stretching families); §5.2 (the `T³` computation); Kronheimer–Mrowka
§7.1 (pp. 52–53) and §7.2 Proposition 7.1 (p. 53).

### Examples

- The product cobordism `[0,1]×T³` with the product bundle: the identity map, equal to its own
  composite, the first composition law.
- `T²×S¹` with the odd bundle and the point class: eigenvalues `±2`, `u²=64`, the genus-one exact square
  used by the projector of §7.4.

### Dependencies

Layers 3–5; GeometricTopology §§1.1, 1.3, 1.4; AlgebraicTopology §§6.1–6.4; CharacteristicClasses C3.3,
C4.1–C4.3; SmoothBundlesConnections B1.4.

## Layer 7: homology-sphere reducibles and complex framing

### 7.1 Ordinary Floer homology of an integral homology sphere

For an integral homology sphere with the trivial SU(2) bundle construct ordinary Floer homology from
the irreducible perturbed flat connections, with its absolute ℤ/8 normalization (Frøyshov §2, p. 4).
Keep the trivial connection θ, its SU(2) stabilizer and its different normal and spectral data in the
compactification, even though θ is not an ordinary chain generator. Construct θ-adapted
perturbations, weighted end models, trajectories to and from θ, their stabilizer and framing
parameters, dimension bounds and oriented gluing. Prove the low-dimensional identities needed for the
ordinary irreducible differential and for continuation, including the exclusion or the explicit
contribution of every reducible broken end. No admissibility argument removes θ, and no framed
replacement is declared equal to the ordinary I(Y).

*Needs:* Layers 1–5 (with the reducible θ retained in §§1.2, 3.1 and 4.1–4.4); Frøyshov §2 (p. 4);
Donaldson §7.1 (p. 168).

### 7.2 Integral reducible maps and the reduced subquotient

Write C_i for the ordinary integral orientation-line complex of §7.1, with `d:C_i→C_(i−1)`. Construct
the reducible counts

    δ : C_1 → ℤ,   δ' : ℤ → C_4,   ν_Z : C_i → C_(i−4),
    δ d = 0,   d δ' = 0,   d ν_Z − ν_Z d + 2 δ' δ = 0.

All degrees in this display are modulo 8; ν_Z is the homological point map, of degree −4, hence also
+4 modulo 8. Construct it from the point representative of −p₁ = 4μ(pt), using two sections of the
complexified adjoint evaluation bundle and their dependence locus on four-dimensional trajectory
moduli. Derive the coefficient 2 and its sign from the compactified one-dimensional cutdown and its
reducible gluing parameter, not by dividing an integral operator by 2. Compare the suspension SO(3)
clutching calculation with the point representative. The line of the trivial connection and the
gluing orientation convention remain data (Donaldson §7.1, p. 168).

Pin the source convention explicitly. Frøyshov's complex CF^* is a cochain complex; his reducible
maps are `δ_F:CF⁴→ℤ` and `δ'_F∈CF¹` (Frøyshov §2, p. 4), and his integral point-count map
`v_F:CF^i→CF^(i+4)` satisfies `d v_F−v_F d+2δ_F⊗δ'_F=0`, with δ_F = 0 outside degree 4 modulo 8
(Frøyshov Theorem 4(ii), p. 7). The subscript F marks his letters; δ, δ', ν_Z are the homological maps
displayed above. Use the dual finite free chain complex `C_i=(CF^i)*`, and set `ν_Z=(v_F)*`,
`δ=(δ'_F)*` and `δ'=−(δ_F)*`; the transpose reverses the commutator and gives exactly the displayed
homological relation. Construct this orientation and duality adapter and prove that it agrees with the
selected geometric end orientations. Dualize the finite free complexes before taking homology, and
retain the Hom/Ext universal-coefficient sequence over ℤ instead of identifying an integral homology
group with the naive dual of cohomology. Neither Frøyshov's v_F, nor Scaduto's v (half of v_F and four
times Donaldson's U, Scaduto §9.2, p. 54), nor the Laurent U of §10.3 is identified by name with ν_Z or
u; only the displayed normalizations relate them.

For j ≥ 0 prove that `δ_j=δν_Z^j` is a map on ordinary homology in degree 1 + 4j modulo 8, and that
`δ'_j=[ν_Z^jδ'(1)]` is a homology class of degree 4 − 4j modulo 8. Define, with all maps zero in other
degrees (the homological form of Frøyshov Definition 1, p. 14),

    Z(I) = ⋂_(j≥0) ker δ_j,   B(I) = Σ_(j≥0) im δ'_j,   Î_Z(Y) = Z(I)/B(I).

Prove B(I) ⊂ Z(I), and construct the descended degree −4 endomorphism u induced by ν_Z. On a cycle in
Z(I) the extra term of the commutator vanishes; changing a representative by dy changes its point
image by a boundary plus 2δ'δy, which lies in B(I). This defines a subquotient of homology, not a
chain quotient whose restricted boundaries could change it. Construct the continuation comparison
identities for the iterates, including their triangular change by lower iterates, and deduce the
independence of Z(I), B(I), the reduced module and the descended point map; no individual δ_j is
asserted to be an invariant before these comparisons. For reduced cobordism maps pin the source's
domain: connected cylindrical SU(2) cobordisms between homology spheres with H₁(W; ℤ) = 0 and
negative-definite intersection form (Frøyshov Theorems 6–8, pp. 11–14), retaining the homology
orientation and end data, with product continuation as the case of the zero form. Derive the extra
reducible boundary terms in the commutation of the point and cobordism maps and prove that they
preserve the reduced subquotient. The full admissible maps and operations of Layer 6 keep their
original scope; no unrestricted reduced cobordism theorem is inferred by omitting these hypotheses.

**Checks.**

- The transpose: dualizing `d v_F−v_F d+2δ_F⊗δ'_F=0` with `∂=d*` and `ν_Z=(v_F)*` gives
  `ν_Z∂−∂ν_Z+2(δ_F)*(δ'_F)*=0`; with `δ'=−(δ_F)*` and `δ=(δ'_F)*` this is the displayed
  `∂ν_Z−ν_Z∂+2δ'δ=0`, while `δ'=+(δ_F)*` would give `−2δ'δ`, the wrong sign.
- Degrees: `ν_Z` has degree `−4`, `δ` lives on degree 1 and `δ'` lands in degree 4, so `δ_j=δν_Z^j` is
  nonzero only on degree `1+4j` and `δ'_j` lies in degree `4−4j`; `j` even gives degrees 1 and 4, `j`
  odd gives 5 and 0, the four special gradings of Scaduto §9.3 (p. 55). Since `δ` vanishes off degree
  1, the defect `2δ'δ` never meets a chain of degree `2+4j`, so `ν_Z^j∂y=∂ν_Z^jy` there and `δ_j` is
  well defined on homology.
- Poincaré sphere `Σ(2,3,5)`: two irreducible flat classes, nondegenerate, generators in degrees 4 and
  0, zero differential; Frøyshov's `δ_F` is an isomorphism on his `HF⁴=ℤ` and his `v_F` is
  multiplication by `±8` from `HF⁰=ℤ` to `HF⁴` (Frøyshov Proposition 2, p. 19), so his integral
  reduced group is zero. In the dual homological convention `δ'_0` generates `H_4=ℤ` and
  `δ'_1=[ν_Zδ'(1)]` is `±8` times the generator of `H_0=ℤ`, so the homological subquotient `Î_Z` is
  `ℤ/8` in degree 0 and `0` in degree 4. The two integral objects are not dual to each other and agree
  only after inverting 2; this is why the Hom/Ext sequence is retained and division by 2 waits for
  localization.
- `B(I)⊂Z(I)`: `B(I)` lives in degrees 0 and 4 and every `δ_j` vanishes there, so the inclusion holds
  degreewise; the descended `u` is well defined since `∂(ν_Zx)=ν_Z∂x−2δ'δx=0` for a cycle `x` with
  `δx=0`, and `ν_Z∂y=∂ν_Zy+2δ'(δy)∈im ∂+im δ'_0⊂B(I)`.

*Needs:* §7.1; §§6.2–6.3 (the point operation); Mathlib `HomologicalComplex` on the shape
`ComplexShape.down (ZMod 8)`; Tau Ceti `TauCeti.ChainComplex.extToHomology`,
`TauCeti.ChainComplex.extToHomology_injective` and `TauCeti.ChainComplex.exact_extToHomology_kronecker`
(the Hom/Ext universal-coefficient sequence for chain complexes indexed by an additive
right-cancellative semigroup with 1, which includes `ZMod 8`), with
`HomologicalComplex.free_cycles_of_isPrincipalIdealRing` and
`HomologicalComplex.isSplitMono_iCycles_of_isPrincipalIdealRing` for its hypotheses on the finite free
integral complexes; Frøyshov §2 (p. 4), Theorem 4 (p. 7), Theorems 6–8 and Definition 1 (pp. 11–14),
Proposition 2 (p. 19); Scaduto §§9.2–9.3 (pp. 54–55); Donaldson §7.1 (p. 168).

### 7.3 Inverting two

Construct the same package over ℤ[1/2] and its coefficient and duality comparison from the integral
counts. On the finite free total cyclic complex use Cayley–Hamilton for the point matrix to reduce the
infinite family of kernel and image conditions to finitely many, and use flat localization for the
resulting base-change statement, retaining torsion instead of an underived universal-coefficient
assertion for arbitrary rings. Only after inverting 2 define v = ν_Z/2, so that

    d v − v d + δ' δ = 0,   u = 2v = 4μ(pt)

on the appropriate descended groups (Scaduto §§9.2–9.3, pp. 54–55). Scaling the j-th iterate by the
unit 2^(−j) identifies the localized reduced subquotient with the corresponding v-iterate
subquotient. Keep the ordinary integral groups, the integral reducible counts and the integral
reduced group as outputs separate from this localized normalization. State nilpotence and
periodicity, and the framed decomposition of §7.6, at their inverted-two or field hypotheses; no
factor 1/2 or 1/4 and no semisimple decomposition is used over ℤ.

**Checks.**

- `Σ(2,3,5)`: the integral `Î_Z=ℤ/8` of §7.2 becomes `ℤ/8⊗ℤ[1/2]=0` after inverting 2, agreeing with
  Frøyshov's reduced group `0`; and `v=ν_Z/2` is `±4` from degree 4 to degree 0, so the `v`-iterate
  subquotient is again generated by `δ'_0` and a unit multiple of the degree-0 generator.

*Needs:* §7.2; Mathlib's localization (`IsLocalization`) and flatness of localization; Scaduto
§§9.2–9.3 (pp. 54–55); Frøyshov Theorem 9 (p. 20) for nilpotence over ℤ.

### 7.4 The framed group

For any closed connected oriented Y and any SO(3) bundle P, first construct a U(2) lift: the
obstruction is the integral Bockstein of w₂, which vanishes because H³(Y; ℤ) has no 2-torsion; retain
the line and determinant choices and their comparison. Choose a base ball and framing and form
Y # T³ with P joined to the bundle on T³ whose w₂ is dual to one circle. Prove nontrivial
admissibility using the transverse T², and independence under the bundle and gluing comparisons.
Over ℂ set (Kronheimer–Mrowka Definition 7.3, p. 55, and the genus-one remark in the proof of
Theorem 7.7, p. 57)

`I#(Y,P)=ker(μ(pt)−2·id : I(Y#T³,P#P_T;ℂ)→I(Y#T³,P#P_T;ℂ))`,

after reducing the ℤ/8 grading to ℤ/4 so that μ(pt) is an endomorphism of degree zero. Use the exact
genus-one square relation of §6.3 to obtain the projector (μ(pt) + 2·id)/4 and the ±2 splitting.
Establish geometrically the relation with the integral index-two gauge (orbit) model C#(Y) of Scaduto
§7.1 (p. 29), the orientation-line complex of the critical set modulo the framed gauge group generated
by the even gauge transformations and one degree-four transformation; it is not an integral eigenspace
shortcut. Construct chain-level representatives or a functorial derived comparison adequate to define
its maps, rather than treating a homology eigenspace as a chain complex. Keep the general-Y framing
and the ordinary homology-sphere and reduced comparison as separate outputs.

**Checks.**

- The lift: `β(w₂)∈H³(Y;ℤ)=ℤ` is 2-torsion, hence zero, so every SO(3) bundle on a closed oriented
  three-manifold is `ad E` for a U(2) bundle `E`; on `RP³` two lifts of the same bundle differ by
  tensoring with the line bundle of order 2, which is the retained choice.
- The projector: from `μ(pt)²=4`, `((μ+2)/4)²=(μ²+4μ+4)/16=(4μ+8)/16=(μ+2)/4`, an idempotent, and
  `(μ+2)/4+(2−μ)/4=1`; its image is `ker(μ−2)` since `(μ−2)(μ+2)=0`. Without the genus-one square
  relation `μ²−4` would only be nilpotent and no such projector would exist.
- `S³`: `I#(S³)=ℤ` in degree 0 over the integers and `ℂ` over `ℂ` (Scaduto §7.6, p. 34), from the
  single folded generator of `T³`; `I#(Σ(2,3,5))` has rank one, in degree 0 (Scaduto §1, p. 3),
  consistent with §7.6 and with the vanishing of the reduced group over a field.

*Needs:* §§5.1–5.2, 6.3; CharacteristicClasses C3.3 (the Bockstein `W₃=β(w₂)`); GeometricTopology §1.4
(connected sum with explicit choices); Mathlib `Module.End.eigenspace`; Kronheimer–Mrowka Definition
7.3 (p. 55) and the genus-one remark (p. 57); Scaduto §7.1 (p. 29) and §7.6 (p. 34).

### 7.5 Framed cobordism maps

For a framed cobordism retain the embedded arc joining the base balls, its normal framing, the
extended bundle, the product collars and the homology orientation. Construct the connected-sum (tube)
map, prove that it commutes with μ(pt) and hence restricts to the +2 sector, and establish the
identity, composition and change-of-framing laws in the exact data category (Scaduto §§2–7). Without
orientation data the corresponding invariant is projective; no sign-free functor is asserted. Prove
the absolute ℤ/4 normalization for untwisted framing using I#(S³) = ℂ in degree 0; retain the correct
relative grading for general twists until its additional normalization is established.

*Needs:* §§6.1, 6.3, 7.4; GeometricTopology §1.4 (connected sum) and §1.5 (tubular neighbourhoods, for
the framed arc); Scaduto §§2–7.

### 7.6 Exact reduced/framed comparison

Over ℂ construct the connected-sum chain comparison, its reducible and point-operation terms and its
metric-stretching homotopies giving, for an integral homology sphere Y,

    I#(Y) ≅ ker( u² − 64 : ⊕_(j=0..3) Î(Y;ℂ)_j → ⊕_(j=0..3) Î(Y;ℂ)_j ) ⊗ H_*(S³;ℂ) ⊕ H_*(pt;ℂ)

as absolutely ℤ/4-graded modules. Here u is the descended ν_Z = 4μ(pt) normalization, not v = u/2;
the point term is in degree 0 and the S³ factor has its homological degrees 0 and 3. Prove the
connected-sum orientation, grading and coefficient adapters to Scaduto Theorem 1.3 (p. 2), which states
this formula over a field of characteristic different from 2. In the nontrivial admissible case the
corresponding formula uses four consecutive gradings of the ordinary I(Y, P; ℂ) and has no
exceptional point term; construct that comparison too, with the bundle label and the relative
grading. The kernel formula is a field-linear consequence of the connected-sum complex and its
nilpotence and linear algebra, not a definition of I# or an integral direct-sum splitting. Retain the
connected-sum chain and cobordism construction even though the reduced output is defined as a
homology subquotient. Verify the S³ calibration: the ordinary and reduced groups vanish, while the
framed point summand is ℂ in degree 0.

**Checks.**

- `S³`: `Î=0`, so `ker(u²−64)⊗H_*(S³)=0` and the formula gives `H_*(pt;ℂ)=ℂ` in degree 0, which is
  `I#(S³)`.
- `Σ(2,3,5)`: `Î⊗ℂ=0` by the Poincaré-sphere check of §7.2, so the formula gives rank one in degree 0
  (Scaduto §1, p. 3).
- The nontrivial admissible form has no point term (Scaduto Theorem 1.3, p. 2): for `T³` with its odd
  bundle the formula is `ker(u²−64)⊗H_*(S³)` on four consecutive gradings of `I(T³)_w`, where `u²=64`
  (§6.3), giving rank 2; adding an `H_*(pt)` term would overcount by one.

*Needs:* §§7.2–7.4 (the integral package, the localized v and the framed group); §§6.1, 6.3 (the point
operation and connected-sum cobordism maps); §4.3 (metric-stretching families); Mathlib's linear
algebra over a field (`Module.End.maxGenEigenspace`, `Module.End.eigenspace`); Scaduto Theorem 1.3
(p. 2) and §9 (pp. 54–60: Theorems 9.1–9.4, the connected-sum theorems); Frøyshov Theorem 9 (p. 20)
for the nilpotence over ℤ.

### Examples

- `S³`: ordinary `I=0`, reduced `Î=0`, framed `I#=ℂ` in degree 0.
- `Σ(2,3,5)`: ordinary `ℤ⊕ℤ` in degrees 4 and 0, Frøyshov's reduced group `0`, the homological
  subquotient `ℤ/8` in degree 0, framed rank one in degree 0.
- `T³` with its odd bundle as the framing summand: one folded generator, the source of `I#(S³)`.

### Dependencies

Layers 2–6; CharacteristicClasses C3.3; GeometricTopology §§1.4, 1.5; Mathlib eigenspaces and
localization; Tau Ceti's universal-coefficient sequence and free-cycles declarations.

## Layer 8: surgery, excision and finite computations

### 8.1 The surgery exact triangle

Construct the following surgery theorem. Let K be a framed knot in Y disjoint from a closed
unoriented one-manifold λ representing the Poincaré dual of w₂ over ℤ/2, let Y₀ and Y₁ be the 0- and
1-surgeries on K, and let m₀ be the surgery core in Y₀. The bundle triad is (Y, λ), (Y₀, λ ∪ m₀),
(Y₁, λ) (Scaduto Theorem 2.1, p. 5). For the ordinary triangle each of the three bundle pairs is
either a nontrivial admissible pair with an odd integral detecting surface as in §0.1, or the trivial
SO(3) bundle on an integral homology sphere with the reducible-aware construction of §7.1; all three
satisfy one of these two alternatives, with the displayed surgery bundle identifications, and no
odd-cycle hypothesis is claimed on a homology sphere. Construct the two-handle bundle extensions and
the oriented cobordism maps, their nullhomotopies of consecutive composites and the next
metric-stretching family giving the triangle-detection identity, and deduce the exact triangle
(Scaduto §§3–6). Pin the signs by the determinant and homology-orientation calculus, and include the
mod 8 and mod 4 map degrees. The core is placed in exactly one of the three bundles.

**Checks.**

- Core placement: for `Y=S³`, `K` the unknot and `λ=∅`, `Y₀=S¹×S²` with `λ₀=m₀` and `Y₁=S³`; the triad
  `(S³,∅),(S¹×S²,m₀),(S³,∅)` has two homology spheres with the construction of §7.1 and one nontrivial
  admissible pair, `m₀` being dual to the generator of `H²(S¹×S²;ℤ)`. Omitting `m₀` would make
  `(S¹×S²,∅)` neither admissible nor a homology sphere, and the triangle would not be stated.
- Exactness on that triad forces `I(S¹×S²)_(m₀)=0` from `I(S³)=0`, and indeed the nontrivial bundle on
  `S¹×S²` has no flat connection: a flat SO(3) bundle over `S¹×S²` is pulled back from `S¹` and has
  `w₂=0`.
- The core lies in exactly one bundle: `λ∪m₀` on `Y₀` and `λ` on `Y` and `Y₁`; moving it to `Y₁` is one
  of the two other variants (§8.2) and changes which bundle is nontrivial.

*Needs:* §§0.1, 5.1–5.2, 6.1, 7.1; §4.3 (metric-stretching families); GeometricTopology §1.3 (handle
attachment, for the two-handle cobordisms) and Layer 5 (§5.2, Dehn surgery, slopes and cores); Scaduto
Theorem 2.1 (p. 5) and §§3–6.

### 8.2 The framed triangle and link surgery

The framed triangle over ℂ has the same three twist labels for arbitrary Y: perform the surgeries
away from the T³ summand and prove compatibility of the whole triangle with the μ(pt) = 2 sectors.
State the other two core-placement variants through explicit bundle identifications. Construct
finite multi-handle metric families and their face identities as the link-surgery enhancement,
retaining its twisting and grading hypotheses; no spectral sequence from a merely sketched cube is
asserted (Scaduto §§2–7).

*Needs:* §§7.4–7.5, 8.1; GeometricTopology §1.3 and Layer 5; Scaduto §§2–7.

### 8.3 Excision

Construct the following complex-coefficient excision theorem (Kronheimer–Mrowka Theorem 7.7, p. 57,
with the sectors of Definition 7.3, p. 55). Let Y have one or two components, and let Σ₁, Σ₂ be
disjoint oriented embedded surfaces of the same positive genus g, with equal odd determinant
pairings. If Y has two components put one surface in each; if Y is connected retain the condition
that the surfaces are not homologous. Supply an orientation-compatible diffeomorphism of the surfaces
and a lift to the determinant line, cut along both surfaces, cross-reglue and keep the induced
bundles. Write I(Y|Σ) for the simultaneous generalized eigenspace of the surface and point operations
μ(Σ) and μ(pt) on I(Y)_w ⊗ ℂ for the top eigenvalue pair (2g − 2, 2); it contains the simultaneous
eigenspace by which Definition 7.3 defines I(Y|Σ). On these sectors construct the excision
isomorphism by the cut-and-reglue cobordisms and their inverse composites, and its restriction to the
simultaneous eigenspaces. For disconnected input the source is the specified tensor product (§5.3).
This does not assert an integral eigensector theorem or an excision isomorphism on every unprojected
group.

**Checks.**

- Two components, genus one: `Y=S¹×T²⊔S¹×T²` with `Σᵢ={pt}×T²`; cutting both along their tori and
  regluing crosswise joins the two intervals into one circle, giving one copy of `S¹×T²` that contains
  the two parallel tori `Σ̃₁⊔Σ̃₂`; the left side is the tensor product `ℂ⊗ℂ=ℂ` of the two components
  and the right side is the single group `ℂ` (Proposition 7.4, p. 55, the two tori being homologous);
  a description leaving two components would put a tensor product on both sides.
- Genus one and the sectors: `(2g−2,2)=(0,2)`. On `I(T³)_w⊗ℂ=ℂ⊕ℂ`, with generators in degrees
  differing by 4, `μ(T²)` has degree 2 and vanishes, and `μ(pt)` has the eigenvalues `±2`
  (Proposition 7.1 with `g=1`, `k=0`: the pairs `(0,±2)`), so `I(T³|T²)_w=ℂ` is the `+2` eigenspace of
  the point class. More generally in genus one `μ(pt)` is semisimple by the exact square of §6.3, and
  on its `+2` eigenspace `μ(Σ)` has `0` as its only eigenvalue (Kronheimer–Mrowka Corollary 7.2), so
  `I(Y|Σ)` is the `+2` eigenspace of `μ(pt)` (Kronheimer–Mrowka §7.3, p. 57).
- Genus zero is excluded: with `w` odd on a sphere the whole group vanishes (Chen–Scaduto Corollary 1,
  p. 2), and `2g−2=−2` names no eigenvalue of a nonzero group.

*Needs:* §§5.3, 6.1–6.3; GeometricTopology §1.3 (gluing along the boundary) and §1.1 (collars);
Mathlib `Module.End.maxGenEigenspace`; Kronheimer–Mrowka Definition 7.3, Propositions 7.1 and 7.4,
Corollary 7.2 and Theorem 7.7 (pp. 53–57).

### 8.4 Finite computations and nilpotence

Calculate T³ with the odd bundle: the determinant-one integral theory is ℤ ⊕ ℤ with generators
separated by 4, and the chosen index-two folded theory is ℤ (Kronheimer–Mrowka §7.1, p. 53). Derive
the zero differential, the orientation and gauge action and the complex ±2 point sectors from
projective holonomy representatives. Obtain I#(S³) = ℂ and the ordinary I(S³) = 0 without identifying
them.

For Σ_g × S¹, g ≥ 1, with odd determinant dual to S¹, construct the Morse–Bott and perturbation
comparison with the surface moduli of §9.2, its clean deformation and normal analysis, and the top
joint sector ℂ (Kronheimer–Mrowka Proposition 7.4, p. 55); include g = 1 separately. Compare the
operations with the surface-bundle picture, and prove the genus-dependent nilpotence relation of
u² − 64 from the ring and neck construction. Over ℂ, for Σ_g × S¹ with its odd bundle, prove that the
least positive nilpotence exponent of u² − 64 is 2⌈g/2⌉ − 1 (Chen–Scaduto Theorem 1, p. 1); for an
arbitrary nontrivial admissible pair with an odd detecting surface of genus g ≥ 1, prove the upper
bound by that exponent through the neck factorization (Chen–Scaduto Corollary 1, p. 2). An odd sphere
detector gives the separate vanishing case. In particular genus 2 has the exact square relation over
ℂ; no nonzero correction is asserted for every higher genus. A guessed Morse–Bott spectral sequence
or an equality of critical manifolds is not a proof of its differentials or convergence (Frøyshov §5,
pp. 19–20, and Theorem 9, p. 20). Work out a surgery example with all bundle and core labels and
degrees, and a product and excision example with both directions of the maps.

**Checks.**

- `T³`: `I(T³)_w=ℤ⊕ℤ`, the folded group `ℤ`, and over `ℂ` the point class has eigenvalues `±2` with
  surface eigenvalue `0` (Proposition 7.1 with `g=1`, `k=0`: the pairs `(0,±2)`), so `I(T³|T²)_w=ℂ`.
- `S³`: `I(S³)=0` since there is no irreducible flat connection; `I#(S³)=ℂ` from the single folded `T³`
  generator; identifying the two would equate `0` with `ℂ`.
- `Σ_g×S¹`, `g≥1`: top sector `ℂ` (Proposition 7.4, p. 55); the nilpotence exponents of `u²−64` on
  `I(Σ_g×S¹)_w` for `g=1,2,3,4` are `2⌈g/2⌉−1=1,1,3,3`, so genus 2 has the exact square and genus 3 does
  not; an odd sphere detector gives `I=0`. The bound for a general pair is monotone in `g`, so a
  detecting surface of larger genus than the minimal one gives a weaker bound, never a false one.

*Needs:* §§5.1–5.2, 6.1–6.3, 7.4, 8.1, 8.3; §9.2 (the surface moduli, through GaugeQuiltFieldTheory
GQ1) for the Morse–Bott comparison; GeometricTopology §1.3, Layer 5 (Dehn surgery) and Layer 9 (§9.1,
Heegaard splittings); Kronheimer–Mrowka §7.1, Propositions 7.1 and 7.4 (pp. 53–55); Chen–Scaduto
Theorem 1 and Corollary 1 (pp. 1–2); Frøyshov §5 (pp. 19–20) and Theorem 9 (p. 20).

### Examples

- Surgery on the unknot in `S³`: the triad `(S³,∅),(S¹×S²,m₀),(S³,∅)` with all labels, and the
  vanishing `I(S¹×S²)_(m₀)=0`.
- Excision for two copies of `S¹×T²` along their tori, producing one `S¹×T²` with two parallel tori:
  `ℂ⊗ℂ≅ℂ` in both directions, the maps being the two cut-and-reglue cobordisms whose composites are the
  identities.
- `Σ₃×S¹`: nilpotence exponent 3, the first genus where `u²−64≠0`.

### Dependencies

Layers 5–7; §9.2 for the Morse–Bott comparison; GeometricTopology §§1.1, 1.3, Layer 5 and Layer 9.

## Layer 9: surface and three-manifold boundary data

### 9.1 Admissible splittings

For the comparison fix an admissible SO(3) pair decomposed as Y₀ ∪_Σ (−Y₁), where each Yᵢ is
connected and Σ has exactly two connected components (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §1,
p. 3). The bundle is odd on each surface component, and the collars carry compatible product metrics,
orientations and bundle identifications. Prove the topological construction of such a splitting for
a supplied nice detecting class, and the framed construction with Σ = Σ_(g+1) ⊔ T² from a Heegaard
splitting after adding the T³ summand of §7.4. Prove that a single connected separating Heegaard
surface cannot carry an odd extending w₂, by evaluating the closed class on the boundary of a
handlebody.

**Checks.**

- Single connected Heegaard surface: for a handlebody `H` with `∂H=Σ`, `⟨w₂,[Σ]⟩=⟨w₂|_H,[∂H]⟩=0` since
  `[∂H]=0` in `H₂(H;ℤ/2)`; an odd bundle needs the two-component seam.

*Needs:* §§0.1, 7.4; GeometricTopology §1.1 (collars) and Layer 9 (§9.1, handlebodies and Heegaard
splittings); Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §1 (pp. 3–4).

### 9.2 The odd-bundle surface moduli space

The odd-bundle surface moduli space is owned by GaugeQuiltFieldTheory GQ1; consume it rather than
rebuilding it from HamiltonianReduction R5. On each component of Σ restrict the U(2) lift E of §0.1,
its determinant line w with connection and the isomorphism det E ≅ w; this is GQ1's decorated object
(P, δ) with r = 2 and d = ⟨c₁(w), Σ⟩ odd, and GQ1's line-tensoring comparison reduces d to 1. The
moduli space of Σ is the product over its two components. Take from GQ1 the smooth compact quotient
M(P, δ) by determinant-one gauge transformations, its tangent space as the H¹ of the trace-free
deformation complex, its symplectic form, dimension 6g − 6 for g ≥ 2, simple connectivity, the
genus-one point and the empty sphere, and `c₁(M(P,δ))=4[Ω]`. Construct here the adapter to the SO(3)
connections on ad E of Layer 0. The full SO(3) quotient differs from M(P, δ) by the finite action of
H¹(Σ; ℤ/2), which has fixed points; it is not the smooth target (Daemi–Fukaya–Lipyanskiy,
*Atiyah–Floer*, §2.2, pp. 7–8).

**Checks.**

- Dimension `−3χ(Σ_g)=6g−6` (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §2.2, p. 7): `g=2` gives 6, `g=1`
  gives 0 (a point), `g=0` gives `−6` (empty), matching GQ1's `(2g−2)(r²−1)` at `r=2`.
- The `H¹(Σ;ℤ/2)` action is not free: at genus one the point `A=diag(i,−i)`, `B` the quarter-turn
  rotation satisfies `BAB⁻¹=−A` and `ABA⁻¹=−B`, so all four sign changes fix it (GQ1's check); the full
  SO(3) quotient is a quotient of `M(P,δ)` with isotropy and not the smooth target.
- Line tensoring: `d↦d+2ℓ` takes `d=2k+1` to 1 with `ℓ=−k`, and `d=−3` to 1 with `ℓ=2`.

*Needs:* GaugeQuiltFieldTheory GQ1 (the rank-two odd-degree `M(P,δ)`, its tangent space, `Ω`, dimension,
simple connectivity, `c₁=4[Ω]`, line tensoring, the `H¹(Σ;ℤ/2)` action); SymplecticGeometry/HamiltonianReduction
R5 through GQ1 (the surface quotient and holonomy); §§0.1–0.2, 9.1; Daemi–Fukaya–Lipyanskiy,
*Atiyah–Floer*, §2.2 (pp. 7–8).

### 9.3 The symplectic form, the complex structure and the restriction Lagrangians

GQ1 normalizes the form as `Ω(a,b)=−(1/(4π²))∫_Σ tr₂(a∧b)` on trace-free one-forms, with the same
fundamental trace and left gauge action as Layer 0. The unnormalized pairing `−∫_Σ tr₂(a∧b)` equals
4π²Ω, and every area, energy and monotonicity constant here uses Ω. Prove that Ω is the boundary
two-form of the Chern–Simons transgression of §0.3, with coefficient −1/(8π²), with the sign fixed by
orienting Σ as the boundary of Y₀. GQ1 states no complex structure: for a chosen surface metric
construct here the Hodge-star complex structure on harmonic representatives (Daemi–Fukaya–Lipyanskiy,
*Atiyah–Floer*, eq. (2.5) and `⟨c,c'⟩=Ω(c,Jc')`, p. 8), prove `Ω(a,*a)=(1/(4π²))‖a‖²_B` and the
compatibility with Ω, and give its metric dependence.

Construct the perturbed flat moduli space of each three-manifold with boundary and its restriction
map to the surface moduli, its deformation theory and index, and the Lagrangian property. Own the
three-dimensional boundary elliptic and gauge problem; the surface slice does not give it. State and
retain the embeddedness hypothesis: for every ε > 0 there is an ε-small allowed perturbation making
each boundary restriction a regular embedding (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, Hypothesis 1,
p. 12). Prove the stated sufficient case, surjectivity on fundamental groups, through the restriction
and holonomy model (Proposition 2.21, p. 13). Arbitrary immersed Lagrangians are not replaced by
embedded ones without this input.

**Checks.**

- A sphere class of Chern number 2 has Maslov index `2·2=4` and `Ω`-area `2/4=1/2`, since
  `c₁(M(P,δ))=4[Ω]`; this is the action drop of the half-period `J` of §10.3, of path index 4, and
  under the unnormalized pairing the same class has area `4π²·(1/2)=2π²`. Consistently with §0.4, a
  charge-one instanton has index 8 and action drop 1, twice both numbers.
- `Ω(a,*a)=−(1/(4π²))∫tr₂(a∧*a)=(1/(4π²))∫B(a∧*a)=(1/(4π²))‖a‖²_B>0` for `a≠0`, and `Ω(*a,*b)=Ω(a,b)`
  since `*` is a rotation on the one-forms of a surface and `**=−1` there; so `J=*` is
  `Ω`-compatible with `J²=−1`.
- The boundary form: for `A↦A+ta` on `Y₀` with `∂Y₀=Σ`,
  `δCS(a)=−(1/(4π²))∫_(Y₀)tr₂(a∧F_A)−(1/(8π²))∫_Σ tr₂(a∧A)`; the exterior derivative of the boundary
  one-form `θ_A(a)=−(1/(8π²))∫_Σ tr₂(a∧A)` is `dθ(a,b)=(1/(4π²))∫_Σ tr₂(a∧b)=−Ω(a,b)`, with
  `dθ(a,b)=∂_aθ(b)−∂_bθ(a)` and `tr₂(b∧a)=−tr₂(a∧b)` for one-forms; it has the magnitude of `Ω`, and
  reversing the orientation of `Y₀` reverses its sign.
- Embeddedness witness: for `Y₀=Σ₀×[0,1]`, with `Σ=Σ₀⊔Σ₁` its two boundary components, the inclusion of
  `Σ₀` induces an isomorphism on `π₁`, so Proposition 2.21 applies with `h=0`, and the restriction
  Lagrangian is the embedded graph of the identity.

*Needs:* §9.2; §§0.3, 2.1–2.2 (connections, gauge, perturbations); SmoothBundlesConnections B4.2 and
B5.2 (gauge group, holonomy); ComplexKahlerGeometry K5a §5.1 (the Hodge star on the surface);
DifferentialGeometry Layer 5 (Stokes, for the boundary form); GeometricTopology §1.1 (collars);
HeegaardFloer F0.0 and F0.3 (§§2.2, 2.5, generic perturbations of the restriction map);
Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §2.2 (pp. 7–8), Hypothesis 1 (p. 12) and Proposition 2.21
(p. 13).

### 9.4 Raw mixed phase and the general coherently oriented pair-strip target

Before signed strip counts, construct the raw gauge, strip and mixed configurations and the Fredholm
determinant families of §10.1, their index, energy and gluing comparisons, and the constant mixed
caps. These use Layers 1–4 and raw totally real strip analysis, not the mixed chain isomorphism. Use
them to prove paired monotonicity, that the Maslov image lies in 4ℤ, and orientability of the strip
determinant families. Prove the minimum-4 computation in the nontrivial disc-class case, and retain
the vanishing-disc case and the zero-dimensional torus and point cases separately. The
finite-dimensional endpoint is not obtained solely from curvature being a moment map.

For the **general two-component admissible embedded pair** the integral symplectic target is the
coherently oriented pair-strip complex. For every path class p : α → β in the Lagrangian path space
construct its Sobolev strip configuration component B^S_p, its Fredholm determinant line D^S_p and its
orientation torsor Λ^S_p. A coherent system is a section λ_p of that torsor compatible with the
ordered strip-gluing isomorphism `Λ_p⊗Λ_q→Λ_(p#q)` and the chosen constant-strip normalization.
Construct it from gauge determinant orientations as follows: glue a constant mixed cap to a strip
family, shift to a symplectically constant mixed family, identify its determinant with the gauge
determinant and the acyclic constant-cap line, orient the latter by its unit (kernel and cokernel
zero), and transport back. Prove independence of components and loops, gauge invariance and
compatibility of all gluing maps, including the homology orientation and the permutations of
translation lines. This is the orientation construction behind the pair-strip complex; no
unspecified preferred brane spin lift is an input to the general theorem.

Define its free integral orientation-line chain group on the finite transverse intersection set, the
differential by the signed finite rigid strip counts, and d² = 0 from the complete one-dimensional
boundary with the specified bubble hypotheses (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, Definition
2.37, p. 16). Its degree is relative ℤ/4, and its translation quotient uses the convention of §4.4,
translation line first. Construct continuation with the mixed orientation system and the allowed
perturbation families. Invariance is not inferred from an unproved embedded Lagrangian cobordism, and
arbitrary choices of path-class signs are not treated as generator rescalings.

**Checks.**

- Minimal Maslov number 4 (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, Theorem 1, p. 4; Proposition 2.27,
  p. 14): the Chern-number-2 sphere of §9.3 has Maslov index 4 and the vanishing-disc case gives no
  smaller positive value; a strip of index at most 2 cannot split off a disc of Maslov index at least
  4, since the remaining strip would have negative index, so `d²=0` needs only strip breaking.
- The constant strip at an intersection point has index 0 and trivial kernel and cokernel, and its
  determinant line is canonically `ℝ`; a coherent system is normalized by this unit and is then
  determined by its values on path classes. Reversing the orientation of one generator's line instead
  multiplies by `−1` every count into or out of that generator, an isomorphic complex: a generator
  rescaling, which is not a change of coherent system.
- Degree: the relative grading is `ℤ/4` because the Maslov image is `4ℤ`; a monotone pair of minimal
  Maslov number 2 would give only `ℤ/2`, and `ℤ/4` is what the folded gauge side matches.

*Needs:* §10.1 (the raw mixed configurations, caps, Fredholm and determinant families and their
gluing; not its counts); FukayaTheory FK2 (bordered domains and the nonlinear Cauchy–Riemann section,
FK2.2), FK3 (classical regularity and raw compactness) and FK6.1 (monotone data) as raw strip analysis;
HeegaardFloer F0.0 (§2.2, determinant lines) and F0.5 (§2.7, regularity-loss comparisons for surface
and strip Cauchy–Riemann sections); §4.4 (gauge determinant orientations); §§9.1–9.3;
Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, Theorem 1 (p. 4), Proposition 2.27 (p. 14) and Definition 2.37
(p. 16).

### 9.5 Decorated Fukaya comparison at the actual orientation domain

Retain a genuine identification with FukayaTheory's decorated monotone branch. Its input domain
includes a common ambient background presentation B on the three-skeleton, spin lifts of
`TL_i⊕B|L_i` on the two-skeleta of the supports, fourfold Maslov-cover (phase) lifts, coefficient and
local-system lines and the determinant ordering. Construct those data in the cases claimed below, not
from the statement that a support is oriented or monotone. §4.4 and the raw mixed system use
`det ker⊗(det coker)*`; compare with a supplier using the opposite order by the graded interchange,
fibrewise `(−1)^(dim ker·dim coker)`, with its stabilized family version. Include all cap,
translation, parameter and boundary-normal permutations in this adapter; agreement of relative
degrees does not fix these signs. On any further pair where such data are supplied, form the ratio
sign character between its spin-induced strip system and the mixed gauge-induced one; construct the
signed chain comparison when that character is trivialized, and retain the character (a local-system
twist) when it is not. Existence of a common background or of a trivialization of path-class signs is
not asserted for every embedded pair.

In the simply connected case prove the explicit comparison criterion: if both orientation systems
respect gluing of **every** sphere class in the relevant ambient factors, their ratio for p : α → β is
independent of p; strip concatenation then makes it ε(β) − ε(α), and multiplying the generator lines
by `(−1)^ε(α)` intertwines the differentials, continuation and mixed maps. Construct the sphere-gluing
and cap maps used in that argument. For two surface factors of genus at least two, where π₂ has two
summands, simultaneous sphere compatibility is not inferred from compatibility with one summand. The
general coherent pair-strip theorem of §9.4 needs no such universal brane identification.

For the framed Heegaard splitting Σ_(g+1) ⊔ T², construct the holonomy models of the two supports,
with the odd holonomies of T² fixing the residual projective frame. Choose the anticommuting SU(2)
lifts of the odd torus holonomies; their simultaneous centralizer is the ineffective ±1. The remaining
g free handle holonomies give the explicit support model SU(2)^g, with central signs and boundary
identifications retained. Identify each support by this model (including the point when g = 0),
transport its product right-invariant tangent spin lift and choose the common zero background.
Construct the fourfold grading lifts and the trivial integral coefficient lines, and prove their
comparisons under the framing, Heegaard and base-ball identifications. For g ≥ 1 only the genus-(g+1)
factor contributes nonzero π₂; the T² moduli space is a point. Use the raw mixed shifting and
determinant construction to normalize the gauge orientation system against that sphere generator and
compare it with the spin-induced system. For g = 0 both relevant moduli spaces are points and the
constant-cap unit fixes the comparison without a sphere generator. The generator-sign criterion then
gives the decorated Fukaya identification for framing, also on lifted action-filtered complexes. This
consumes the precise framing topology and does not import a universal absolute-spin assertion about
arbitrary gauge correspondences. Prove coherence of these brane, line and grading identifications
under the declared comparisons. Unweighted integral, rational and complex scalar extensions retain
their orientation and coefficient maps (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §2.2, p. 8, and
Definition 2.37, p. 16).

**Checks.**

- The interchange: on a fibre with `dim ker=dim coker=1` the two determinant orders differ by
  `(−1)^(1·1)=−1`; on a family over a circle where `dim ker` jumps by one the sign is constant only
  after the stabilization is tracked, which is the stabilized family version.
- The ratio character: two coherent systems on the same complex differ by a function `ε` of the path
  class; when it depends only on the endpoints, `ε(p)=ε(β)−ε(α)` and `x_α↦(−1)^(ε(α))x_α` intertwines
  the differentials; when it depends on the sphere class of `p`, no generator rescaling does, and the
  twist is a genuine local system.
- The framed support model: the anticommuting lifts `A=diag(i,−i)` and `B` the quarter-turn rotation of
  the two odd torus holonomies have common centralizer `{±1}` in SU(2), and the remaining `g` handle
  holonomies are free, so the support is `SU(2)^g` modulo the ineffective centre; at `g=0` it is a
  point and no sphere generator exists.
- `π₂`: for `Σ=Σ_(g+1)⊔T²` with `g≥1`, `π₂(M)=π₂(M(Σ_(g+1)))⊕π₂(M(T²))=ℤ⊕0` (Daemi–Fukaya–Lipyanskiy,
  *Atiyah–Floer*, §2.2, p. 8), so there is a single sphere generator to normalize against; for two
  factors of genus at least two `π₂=ℤ⊕ℤ`, and compatibility with one summand does not give the other.
  A factor of genus one is a point and contributes nothing.

*Needs:* §9.4 (the coherent pair-strip complex); FukayaTheory FK1.1 (geometric and orientation
carriers: relative spin lifts and backgrounds), FK1.2b (labelled integral classes, caps and coefficient
transport), FK6 (the monotone decorated branch) and FK8.0 (sign laws); SpinGeometry G4 (G4.2 principal
spin lifts, G4.3 the spin obstruction); §4.4 and §10.1 (the gauge and mixed determinant systems); §7.4
(the framing data); Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §2.2 (p. 8) and Definition 2.37 (p. 16).

### Examples

- `Y₀=Σ₀×[0,1]`: the restriction Lagrangian is the embedded diagonal; a pair of such products is the
  mapping-torus setting to which Theorem 2 of Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, specializes
  (§1, p. 4).
- The framed Heegaard splitting of genus `g=0`: `Σ=T²⊔T²`, both supports are points, and the comparison
  is fixed by the constant-cap unit alone.
- `Σ₂⊔T²` (the case `g=1`): one sphere generator, from the genus-two factor of dimension 6.

### Dependencies

GaugeQuiltFieldTheory GQ1; SymplecticGeometry/HamiltonianReduction R5 through GQ1; FukayaTheory FK1–FK3,
FK6, FK8; HeegaardFloer F0.0, F0.3, F0.5; SpinGeometry G4; ComplexKahlerGeometry K5a §5.1;
SmoothBundlesConnections B4.2, B5.2; DifferentialGeometry Layer 5; GeometricTopology §1.1 and Layer 9;
Layers 0–4, §7.4, and the raw part of §10.1.

## Layer 10: mixed comparison and its exact reach

### 10.1 The raw mixed linear phase

Construct the mixed problem on a specified quintuple: an oriented Riemannian four-manifold with
cylindrical and product seam collars, its SO(3) bundle, a Riemann surface with a matching boundary
arc, the odd-bundle surface symplectic moduli space and its boundary Lagrangians. Along the matching
arc the restricted connection is flat and represents the value of the map in the surface moduli; on
the remaining arcs impose the specified Lagrangian boundary conditions. Solve the ASD equation on the
gauge side and the perturbed Cauchy–Riemann equation on the surface side with compatible seam data
(Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §3, pp. 23–33).

Build mixed Sobolev charts, gauge fixing, the trace and matching linearization, Fredholm boundary and
seam estimates and index gluing, determinant orientations and spectral decay (Daemi–Fukaya–Lipyanskiy,
*mixed equation*, §5, pp. 40–58). Prove mixed ε-regularity and removal of singularities and
compactness at the gauge interior, the symplectic interior, the seam and the ends, retaining their
different bubbling mechanisms and energy budgets. Construct the special gauge-to-strip quintuple with
gauge, strip and mixed ends, supported primary and secondary perturbations preserving all seam and end
conditions, universal regularity, neck gluing and neighbourhood surjectivity. Give the dimension
exclusions for the zero- and one-dimensional comparison moduli. Closed-curve compactness or ordinary
strip gluing does not prove this seam theorem. The raw configurations, the constant caps, the family
Fredholm, index and energy theory and the determinant gluing and orientation comparisons of this
section are constructed before the signed pair-strip complex of §9.4; they use neither its counts nor
the chain isomorphism of §10.2. Prove the gauge-to-mixed-to-strip orientation-system map first, with
all loop and gluing compatibilities, and only then form signed strip and mixed counts.

**Checks.**

- Energy additivity on the special quintuple: a solution with gauge ends and strip ends has total
  energy equal to the CS drop on the gauge part plus the `Ω`-area of the strip part, and index equal to
  the gauge path index plus the strip Maslov index; the constant mixed cap has energy 0 and index 0,
  which is the `+1` normalization of §10.4.
- Regularity and compactness inputs: smoothness of `L^p_1` solutions for `2<p<4` and `C^∞` convergence of
  `L^p_1`-convergent smooth solutions (Daemi–Fukaya–Lipyanskiy, *mixed equation*, Theorems 3.4 and 3.6,
  p. 14); energy quantization with constants `κ,ℏ` (Theorem 4.2, p. 20); removal of a point singularity
  on the seam under finite gauge and finite strip energy (Theorem 4.44, p. 30); a seam bubble needs
  both energies finite, not one.
- Dimension exclusion: the comparison moduli have index 0 and 1; a gauge bubble costs 8, a sphere
  bubble on the symplectic side at least 4 (`c₁=4[Ω]`), and seam bubbles carry the energy quantum of
  Theorem 4.2, so none meets the fixed-index moduli, and only end breaking contributes to the
  one-dimensional boundary.

*Needs:* Layers 1–4 (SO(3) Sobolev gauges, cylindrical analysis, compactification, determinant lines);
§§9.2–9.3 (`M(P,δ)` with `Ω` and `J=*`, the restriction Lagrangians); FukayaTheory FK2–FK3 (bordered
domains, the nonlinear Cauchy–Riemann section, raw compactness) for the strip side; HeegaardFloer F0.5
(§2.7); PseudodifferentialOperators P5–P6 (boundary and seam elliptic estimates);
Daemi–Fukaya–Lipyanskiy, *mixed equation*, Theorems 3.4 and 3.6 (p. 14), 4.2 (p. 20), 4.44 (p. 30) and
§5 (pp. 40–58); Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §3 (pp. 23–33: special quintuples and the
comparison map N), §4.4 (mixed shifting, p. 53), §4.7 (orientability of the mixed determinant lines,
p. 59), §5 (pp. 60–73: the mixed Chern–Simons functional, exponential decay and compactness) and §6
(pp. 74–82: cylinder functions, holonomy and secondary perturbations).

### 10.2 The signed mixed comparison

Count rigid mixed solutions to define a chain comparison from the integral degree-folded index-two
gauge model (§5.2) to the **coherently oriented pair-strip complex** of §9.4. Prove its signed
chain-map identity, its degree and orientation normalization, and the inverse comparison by an energy
and order argument or an inverse-family construction. Deduce the relatively ℤ/4-graded integral
isomorphism for the full two-component admissible splitting and the regular-embeddedness data
(Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, Theorem 2, p. 4, and Theorem 3.29, p. 33). At the
decoration and sphere-compatibility domain of §9.5 compose with its signed brane identification,
including the framed case. Construct the lifted and invariant filtered framed comparison below
(§§10.3–10.4) and its complex μ-sector comparison with Layer 7. These are the admissible Atiyah–Floer
theorem and the stated framed refinements, not the unrestricted singular or reducible Heegaard
comparison.

*Needs:* §10.1; §§5.1–5.2 (the folded gauge complex); §§9.4–9.5 (the pair-strip complex and the
decorated identification); Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, Theorem 2 (p. 4) and Theorem 3.29
(p. 33).

### 10.3 Lifted Laurent complexes and the deck-sign adapter

Construct a period cover of the critical set of the selected index-two gauge model. A lift is an
endpoint together with a path to a fixed reference configuration, modulo the zero-period equivalence
justified by the CS and index transport and the orientation-line transport; it is not just the
endpoint orbit. Identify the analogous strip lift through constant mixed caps and mixed shifting
(Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §4.4, p. 53). Define its action A_h by the normalized
relative CS_h (topological-energy) difference, and an integer Floer lift i such that every
differential trajectory has i(α̃) − i(β̃) = 1. Prove the uniqueness and period statements for this
cover and the gauge-to-strip comparison, rather than identifying full gauge path groups solely from
their period images.

Use Mathlib's `LaurentPolynomial ℤ` (the `AddMonoidAlgebra ℤ ℤ` carrier of
`Mathlib/Algebra/Polynomial/Laurent.lean`) with the coefficient inclusion `LaurentPolynomial.C` and the
monomials `LaurentPolynomial.T n`; its monomial of exponent 1 represents the variable called U below,
not the gauge deck T of §0.4. Use its evaluation at a unit and its localization structure
(`LaurentPolynomial.eval₂`, `LaurentPolynomial.isLocalization`) and the ordinary module and quotient
APIs for the forgetful comparisons. Construct the real-action and integer-degree decorations on this
finitely supported carrier.

Use a Laurent variable U, distinct from the point operation u, acting by

    U : (i, A_h) ↦ (i+4, A_h + 1/2),   C̄_G = ⊕_(α in the finite folded set) ℤ[U,U⁻¹] ⊗ o_α̃.

Derive this normalization from Layer 0. Its determinant-one deck T is the **forward path** α̃ → Tα̃ of
charge 1 and ASD path index +8, whose target action is lower by 1. Since a path index is the
difference of the Floer gradings of its endpoints, the generator Tα̃ has grading i(α̃) − 8; the path's
+8 is not the grading shift of the target generator. Choose the half-period extended-gauge path J
with charge 1/2, path index 4 and action drop 1/2. Prove J² = T on the period cover, with its
determinant and orientation-line action; this is not an equality of arbitrary full gauge
transformations. Thus the source's upward-action variable is U = J⁻¹, and **U² = T⁻¹** on this cover
(Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §7.1, pp. 83–84, and Definition 7.4, p. 85). Transport CS_h
and its perturbation normalization through the source's tr₂, energy and surface-form conventions.
Retain the nonautonomous error integral for continuation (§3.2). A variable name alone fixes none of
these signs.

Define the differential by counting each rigid trajectory in its path class and transporting the
input lift to the corresponding output lift. Prove its finite support as a Laurent expression, its
U-equivariance, its integer degree −1 and that it does not increase A_h. Give C̄_S the same period
cover through the mixed cap and shifting path map; prove its degree and action formula by the mixed
energy and index identities, then define its lifted signed differential. No Novikov completion is
introduced to conceal unproved finiteness. Define the lifted mixed map by the same class transport and
prove its degree 0, Laurent linearity and action bound.

Construct the forgetful diagrams as chain and coefficient comparisons:

    C̄/(U−1) ≅ C_fold,   C̄/(U²−1) ≅ C_det,

with the mod 4 and the mod 8 grading respectively and the orientation actions. The second uses the
two lift classes over each folded generator, not an invariant-chain shortcut. Forgetting the integer
and action gradings and setting U = 1 does not retain a real filtration on a finite orbit generator.
Over ℂ compare the folded framed model with the μ(pt) = 2 sector of §7.4 by the torus-neck and gauge
construction; U is never identified with μ or with its point-projector polynomial.

**Checks.**

- The deck diagram: `U:(i,A_h)↦(i+4,A_h+1/2)`, so `U²:(i,A_h)↦(i+8,A_h+1)`; the deck `T` sends `(i,A_h)`
  to `(i−8,A_h−1)`, hence `T=U⁻²`, and the path `α̃→Tα̃` has index `i−(i−8)=8`. The source's
  `deg_I(Uα̃)−deg_I(α̃)=1/2` and `U C_(i,j)⊂C_(i+4,j+1/2)` (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §7.1,
  p. 83, and Definition 7.4(i), p. 85) is the same `U`.
- `J²=T`: `J` sends `(i,A_h)` to `(i−4,A_h−1/2)`, so `J²` sends it to `(i−8,A_h−1)`, which is `T`; thus
  `U=J⁻¹`, and reading `U=J` instead would reverse the direction of the action filtration.
- Forgetful quotients: over one folded generator `α` with lifts `U^nα̃`, `ℤ[U^±1]/(U−1)` has rank 1 (the
  folded complex) and `ℤ[U^±1]/(U²−1)` has rank 2, the lifts `α̃` and `Jα̃` of the determinant-one
  complex; the second identification needs the free `J` action on generators secured in §2.3.

*Needs:* §§10.1–10.2 (the signed mixed map); §§5.1–5.2 (the folded and determinant-one complexes);
§0.4 (the deck generator and the CS lift); §3.2 (the nonautonomous energy integral); §9.4 (the strip
lift via caps); Mathlib `LaurentPolynomial`, `LaurentPolynomial.C`, `LaurentPolynomial.T`,
`LaurentPolynomial.eval₂`, `LaurentPolynomial.isLocalization`; Daemi–Fukaya–Lipyanskiy,
*Atiyah–Floer*, §4.4 (p. 53), §7.1 (pp. 83–84) and Definition 7.4 (p. 85).

### 10.4 Invariant enriched filtered framing

For the untwisted added-T³ model use its flat reference family and choose a base connection α₀ in it.
Construct a sequence of adapted regular perturbations tending to zero, with α₀ retained and the
required normalized action, regular embeddings and intersections and end conditions. Define F^a C̄ by
action ≤ a. A level-λ map has f(F^a) ⊂ F^(a+λ) and preserves the integer Floer degree; a level-λ chain
homotopy raises that degree by 1 and obeys the same action bound. Construct maps f_i^j with f_i^i = id
and homotopies f_j^k f_i^j ≃ f_i^k such that all maps and homotopies with indices ≥ n have level
≤ λ_n and λ_n → 0. Derive these bounds from the integrable variation-of-perturbation term and the
fixed reference normalization, not from an unquantified continuation isomorphism.

Define the enriched category on these sequences: morphism maps and their naturality homotopies have
tail losses tending to zero, composition is by the chain maps with additive loss bounds, and inverse
comparisons hold up to homotopies with losses tending to zero. Prove independence of the adapted
sequence and of the framed Heegaard, metric and reference choices in this category. For reference
changes use the exact transgression and action translation; in the canonical untwisted model prove
independence inside the specified flat reference family. The output is the invariant enriched
filtered object and the gauge-symplectic equivalence in that category, not a fixed-perturbation
filtered homology group or an unqualified inverse limit of groups.

Normalize the diagonal constant mixed terms to +1 by the orientation comparison. For sufficiently
small perturbations construct each mixed map N_i = id + K_i, where K_i strictly lowers action and
preserves the integer Floer degree. In every degree the finite Laurent basis makes K_i nilpotent:
prove this finite-triangular assertion and write the finite inverse id − K_i + K_i² − …; it has level 0
and introduces no denominators. Transport gauge continuation by `g_i^j=N_j f_i^j N_i⁻¹` and conjugate
its homotopies; this constructs the symplectic enriched system and the equivalence, rather than
assuming it. Integral orientation-line counts and this finite inverse give the integral refinement as
an explicit target. Rationalization identifies it with Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*,
Definitions 7.4–7.6 and Theorem 7.7 (pp. 85–87), whose stated I-graded category is over ℚ[U, U⁻¹]; no
unproved integral coefficient assertion is attributed to that source. The general admissible
unfiltered integral mixed theorem is §10.2.

**Checks.**

- Nilpotence: in a fixed Floer degree `i` each folded generator has at most one lift (`U` shifts the
  degree by 4), so the degree-`i` piece is a finite free `ℤ`-module and a strictly action-lowering
  endomorphism of it is nilpotent; `id−K+K²−…` is a finite sum and `N_i⁻¹` is of level 0 with integral
  entries.
- Levels compose additively: a level-`λ` map followed by a level-`μ` map has level `λ+μ`, so
  `g_i^j=N_j f_i^j N_i⁻¹` has the level of `f_i^j` once the `N` are of level 0, and the tails `λ_n→0`
  are preserved.
- Rationalization: Definition 7.4 is over `ℚ[U^±1]` while the complexes here are `ℤ[U^±1]`-modules
  (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, p. 83 and Definition 7.4, p. 85); the integral enriched
  object maps to the rational one by base change, and nothing in the source asserts the integral
  statement.

*Needs:* §10.3 (lifted complexes and the mixed map); §5.1 (continuation systems); §3.2 (the
nonautonomous energy integral); §7.4 (framing data); Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, §7
(pp. 83–87: Definitions 7.4–7.6 and Theorem 7.7).

### 10.5 Twisted framing

Retain the arbitrary-bundle framing of §7.4. For a specified nontrivial twist on the summand M,
construct the analogous enriched **relative-action-torsor** object using a reference connection
(which need not be flat), with its prescribed determinant and bundle data and its reference-change
translations. Derive small-loss continuation by the same normalized energy argument, and construct
its lifted mixed comparison for the corresponding admissible embedded splitting. The untwisted flat
reference family is not assumed to exist for that twist, and a relative-action torsor is not promoted
to a canonically zero-based numerical filtration. This twisted construction and comparison is an
explicit target here; the cited source's untwisted filtered theorem is not claimed to prove it.

**Checks.**

- A twist without a flat reference: on `S¹×S²` the SO(3) bundle whose `w₂` is the class dual to the
  circle factor pairs oddly with `[S²]` and carries no flat connection (a flat bundle is pulled back
  from `S¹` and has `w₂=0`), so for such a summand the reference connection is a nonflat choice and the
  action is a torsor, not a numerical filtration.
- The reference change: replacing the reference by another in the same path class translates every
  action by the CS difference of the two references, a constant, so the enriched object is unchanged up
  to the translation isomorphism; a reference in a different path class translates by that constant
  plus the integer period, which the `U`-module structure absorbs.

*Needs:* §§10.3–10.4; §7.4 (general twists); §3.2; §0.3 (change of reference).

### 10.6 Operations and the reach of the comparison

Over ℚ construct the comparison with the operations from H₁(Σ) ⊕ H₂(Σ), using the universal-bundle
sign and slant convention on each side; a source using +p₁/4 requires the explicit sign adapter to this
roadmap's μ = −p₁/4 (Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, Theorem 3, p. 5, Theorem 4, p. 5, and
§7.2, p. 87). General operations and coefficient extensions require their own geometric comparison and
are not inferred from that stated range.

GaugeQuiltFieldTheory supplies one input here, GQ1's surface moduli with its form Ω, consumed in §9.2.
Its GQ2–GQ5 own connected generalized-quilt categories, elementary three-bordism correspondences and
their connected sewing theorem in its coprime fixed-determinant decorated category; those are neither
a prerequisite nor a conclusion of the mixed isomorphism here. The symplectic side of that isomorphism
is the pair of perturbed restriction Lagrangians of §9.3 and the pair-strip complex of §9.4, not a
quilt functor or a composite of elementary correspondences. The theorem of this layer is the
two-component admissible, regular-embedded comparison with the stated rational operation range; it
does not identify the ordinary homology-sphere I with a Floer theory of the singular unframed Heegaard
character variety. Neither comparison asserts a disconnected symmetric-monoidal or point-level fully
extended theorem.

*Needs:* §§10.2–10.5; §6.2 (the H₁(Σ) ⊕ H₂(Σ) operations and their sign); Mathlib `LaurentPolynomial`
and localization; Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, Theorem 3 (p. 5), Theorem 4 (p. 5) and §7.2
(p. 87).

### Examples

- Two products `Σ₀×[0,1]` glued along both boundary components (the mapping-torus case of the
  identity): the comparison of Theorem 2 of Daemi–Fukaya–Lipyanskiy, *Atiyah–Floer*, with both
  Lagrangians the diagonal.
- `S³` with the framed splitting `T²⊔T²`: one folded generator, `C̄_G=ℤ[U^±1]`, `d=0`, a single
  filtration level, `N=id`.
- A nontrivial twist on `S¹×S²`: the relative-action torsor with a nonflat reference.

### Dependencies

Layers 0–5, §§6.2, 7.4, Layer 9; FukayaTheory FK2–FK3; HeegaardFloer F0.5; PseudodifferentialOperators
P5–P6; Mathlib `LaurentPolynomial`.

## Scope and ownership

**This roadmap owns** the construction of three-dimensional Chern–Simons (instanton) Floer theory from
four-dimensional ASD connections: the nontrivial admissible theory over ℤ, the separate
reducible-aware theory of integral homology spheres with Frøyshov's reducible maps and reduced
groups, and the complex framed theory for every closed connected oriented three-manifold and every
specified SO(3) bundle; continuation, naturality, oriented cobordism maps, universal-class operations,
exact surgery triangles, excision and the admissible mixed-equation Atiyah–Floer comparison (Layers
0–10 above). The actual bundle, gauge group, coefficients and grading are part of every interface. It
also owns, as constructions without another owner on main: the Chern–Simons differential character,
the gauge-period and index comparison, the universal configuration bundles with their slant products
p₁/[z] (no roadmap on main owns a slant product), and the gauge-theoretic gluing applications
(Layers 0, 3, 4 and 6); the SO(3) lifting and globalization of FourManifolds' SU(2) core and its
three-dimensional, cylindrical, perturbed and mixed extensions (Layer 1), with the cylindrical
weighted, spectral-flow, relative ASD and perturbed, boundary and mixed compactification
applications (Layers 3, 4 and 10); the holonomy perturbation space, its universal annihilator
argument and the ASD determinant and gluing applications (Layers 2 and 4); the tensor signs on
`ZMod (2m)` and the `ZMod (2m)`-graded Künneth sequence over a principal ideal domain (§5.4; no
roadmap on main owns a cyclically graded Künneth theorem); the SO(3) and determinant adapter to GQ1's
surface moduli, the Hodge-star complex structure and all three-dimensional restriction data
(§§9.2–9.3); the general gauge-induced coherently oriented pair-strip complex and its decorated
identification on the domain of §9.5, including framing (Layer 9); and the mixed
ASD/Cauchy–Riemann seam analysis and comparison (Layer 10).

**Owned elsewhere and consumed here.**

- *Bundles, connections and gauge*: SmoothBundlesConnections B1–B6 (principal and associated bundles,
  affine smooth connections, curvature and bracket-wedge identities, the left gauge action, holonomy,
  and the rank-one integral characteristic comparisons of B6). SmoothBundlesConnections assigns the ASD
  energy comparisons, the BPST solution, instanton moduli and nonlinear gauge slices to FourManifolds
  together with this roadmap's Layer 1; the split is the one stated in the next item.
- *The four-dimensional SU(2) core*: FourManifolds Layer 5 (§5.1 all-base deformation and flat strata,
  §5.2 metric transversality, §5.3 all-charge compactification and obstruction gluing, with the
  unit-ball critical estimate) owns the common compact and local SU(2) Sobolev, Coulomb,
  removable-singularity, Uhlenbeck and compact ASD core with all stabilizer and obstruction strata, and
  the SU(2) index formula 8k − 3(1 − b₁ + b⁺) on closed four-manifolds. This roadmap gives its SO(3),
  normalization and instanton-extension contracts (§§1.3–1.4) and the index formula for SO(3) bundles
  with arbitrary w₂ and its cylindrical version (§3.3), which recovers FourManifolds' formula when
  w₂ = 0.
- *Forms, integration and topology*: DifferentialGeometry Layer 5 (integration and Stokes) and Layer 6
  (the de Rham complex, which is Tau Ceti's `TauCeti.deRhamComplex`); AlgebraicTopology Layer 2
  (§2.1 relative singular chains, §2.6 local coefficient systems) and §§6.1–6.4 (cochains, cup and cap
  products, orientation local systems, Poincaré–Lefschetz duality); CharacteristicClasses C3.2, C3.3
  and C3.5 (Stiefel–Whitney and integral Pontryagin classes, the Bockstein classes `W_k=β(w_(k−1))`, `w₂`
  as the transition-lift cocycle) and C4.1–C4.3 (Chern–Weil and Pontryagin forms and their integral
  comparison); GeometricTopology Layer 1 (§1.1 collars, §1.3 boundary gluing and handle attachment,
  §1.4 connected sum, §1.5 tubular neighbourhoods), Layer 5 (Dehn surgery) and Layer 9 (Heegaard
  splittings). Four-dimensional cobordisms are compact oriented four-manifolds with collared boundary,
  composed by gluing along the boundary (GeometricTopology §1.3); the two-handle cobordisms of §8.1 use
  its handle attachment, and no handle calculus of cobordisms is used.
- *Linear analysis*: ComplexKahlerGeometry K5a (§5.1 the pointwise real Hodge star on every exterior
  degree, §5.4 the shared carriers `BundleSobolev` and `RealBundleSobolev`, §5.7 the Green operator);
  PseudodifferentialOperators P1 and P5–P7 (principal symbols, Sobolev estimates, closed-base elliptic
  estimates, parametrices and Fredholm theory, elliptic powers); IndexTheory I1–I2 and I7 (Fredholm
  connectors, symbol classes and the analytic index, the de Rham and signature applications);
  SpinGeometry G2, G6.1 and G6.4 (exterior-form and Clifford/de Rham symbol comparisons, which supply the
  symbol of `d_A*⊕d_A⁺` for §3.3). Closed-base estimates alone do not supply cylindrical or nonlinear
  gauge theory.
- *Generic Fredholm theory*: HeegaardFloer F0 (its Layer 2: the generic Banach implicit-function and
  Sard–Smale theory, generic Fredholm sections and determinant lines, function spaces, trajectory
  charts, universal zero sets, regularity-loss comparisons), F1 (its Layer 3, the Cauchy–Riemann
  elliptic package, with F1.4's determinant and exact-sequence interfaces) and M.5 (continuation
  templates). Cauchy–Riemann regularity is not ASD
  compactness. HeegaardFloer F0.0 assigns the cylindrical ASD operator, gauge and analytic gluing
  comparison to this roadmap's Layers 3–4.
- *Surface gauge theory*: SymplecticGeometry/HamiltonianReduction R5 (the surface connection quotient,
  the specified bundle, determinant and holonomy comparisons, the twisted deformation pairing and
  surface rough and smooth topology), reaching Layer 9 through GQ1; it is not a three-dimensional gauge
  slice or a four-dimensional instanton theorem. GaugeQuiltFieldTheory GQ1 is the one owner of the
  fixed-determinant coprime surface moduli M(P, δ) on R5's carriers, with its symplectic normalization,
  deformation complex, low-genus models, Chern evaluations and line-tensoring comparison; at rank two
  and odd degree it is the odd-bundle surface moduli of §9.2. GaugeQuiltFieldTheory GQ2–GQ5 are not
  inputs (§10.6), and GQ5 assigns the instanton theories and the Atiyah–Floer comparison to this
  roadmap.
- *Lagrangian Floer theory*: FukayaTheory (raw totally real and monotone strip analysis, FK2–FK3 and
  FK6.1, and the decorated brane branch, FK1.1, FK1.2b, FK6 and FK8, at its relative-spin, background,
  grading and coefficient hypotheses). No ordinary Fukaya theorem supplies gauge orientations or a mixed
  equation; those are Layers 9–10 here. SpinGeometry G4 supplies spin lifts and their obstruction.
- *Homological algebra*: Tau Ceti's homology cross product on any shape with tensor signs, the
  ℕ-indexed Künneth short exact sequence with its splitting, the free-cycles splittings over a principal
  ideal domain on any shape, the Künneth isomorphism for split complexes, the chain homotopy
  equivalence of a split complex with its homology, and the universal-coefficient (Hom/Ext) sequence
  for chain complexes indexed by an additive right-cancellative semigroup with 1; Mathlib's homological
  complexes, tensor signs on `ComplexShape.down ℕ` and `ComplexShape.up ℤ`, derived `Tor`,
  eigenspaces and Laurent polynomials. The exact declarations are in the supplier contracts.

## Exact supplier contracts

### From Mathlib

- `ContMDiffSection` (`Mathlib/Geometry/Manifold/VectorBundle/ContMDiffSection.lean`): smooth
  sections of smooth vector bundles, the carrier on which the bundle data of Layer 0 sit.
- `HomologicalComplex`, `ComplexShape.down` and `ComplexShape.TensorSigns`
  (`Mathlib/Algebra/Homology/ComplexShapeSigns.lean`): the tensor-sign datum, with instances for
  `ComplexShape.down ℕ` and `ComplexShape.up ℤ` only; §5.4 constructs it on
  `ComplexShape.down (ZMod (2m))`.
- `CategoryTheory.Tor` (`Mathlib/CategoryTheory/Monoidal/Tor.lean`): the derived functor
  `Tor n : C ⥤ C ⥤ C`, used for the Tor term of §5.4.
- `Module.End.eigenspace`, `Module.End.genEigenspace` and `Module.End.maxGenEigenspace`
  (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean`): the eigenspaces and generalized eigenspaces of an
  endomorphism, for the ±2 sectors of §7.4 and the eigensectors of §§7.6 and 8.3.
- `LaurentPolynomial` (`Mathlib/Algebra/Polynomial/Laurent.lean`), defined as `AddMonoidAlgebra R ℤ`,
  with `LaurentPolynomial.C`, `LaurentPolynomial.T`, `LaurentPolynomial.eval₂` and the instance
  `LaurentPolynomial.isLocalization` (it is the localization of `R[X]` away from `X`): the carrier of
  §10.3.
- `IsLocalization` and flatness of localization, for §7.3.

### From Tau Ceti

Paths are under `TauCeti/` at the pinned Tau Ceti; all declarations below are proved there.

- `HomologicalComplex.homologyCross` (`Algebra/Homology/Monoidal/Homology/Cross.lean`): the homology
  cross product `Hₚ(K)⊗H_q(L)→Hₙ(K⊗L)` for `p+q=n`, on any complex shape carrying
  `ComplexShape.TensorSigns`, in a preadditive monoidal category.
- `HomologicalComplex.homologyKunneth` and the instance
  `HomologicalComplex.isIso_homologyKunneth_of_isSplitMono_of_isSplitEpi`
  (`Algebra/Homology/Monoidal/Homology/Kunneth/Basic.lean`): the Künneth map on any shape with tensor
  signs, an isomorphism for complexes of modules whose cycles split off their terms and whose homology
  splits off their cycles (complexes of vector spaces, in particular).
- `HomologicalComplex.homologyKunnethShortComplex_shortExact` and
  `HomologicalComplex.homologyKunnethShortComplexSplitting`
  (`Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean`): the Künneth short exact sequence
  `0→⊕_(p+q=m+1)Hₚ(K)⊗H_q(L)→H_(m+1)(K⊗L)→⊕_(p+q=m)Tor₁(Hₚ(K),H_q(L))→0` for chain complexes of
  modules over a commutative ring **indexed by ℕ**, the cycles of `L` and the quotients of its terms by
  them being projective, no hypothesis on `K`; and its splitting when the cycles of `K` split off. This
  is the model of §5.4 and does not apply to `ZMod (2m)`-graded complexes.
- `HomologicalComplex.free_cycles_of_isPrincipalIdealRing`,
  `HomologicalComplex.isSplitMono_iCycles_of_isPrincipalIdealRing` and
  `HomologicalComplex.free_cokernel_iCycles_of_isPrincipalIdealRing`
  (`Algebra/Homology/PrincipalIdealRing.lean`): over a principal ideal ring without zero divisors, on
  any complex shape, the cycles of a projective term are free, the inclusion of the cycles splits when
  the next term is projective, and the quotient by the cycles is then free.
- `HomologicalComplex.exists_homotopyEquiv_d_eq_zero` (`Algebra/Homology/Split.lean`): a complex in an
  abelian category whose cycles split off its terms and whose homology splits off its cycles is chain
  homotopy equivalent to a complex with zero differential.
- `TauCeti.ChainComplex.extToHomology`, `TauCeti.ChainComplex.extToHomology_injective` and
  `TauCeti.ChainComplex.exact_extToHomology_kronecker` (`Algebra/Homology/UniversalCoefficient/Basic.lean`):
  for a chain complex `X : ChainComplex C α` in a `k`-linear abelian category, with `α` an additive
  right-cancellative semigroup with `1` (which includes `ZMod 8` with `d:C_i→C_(i−1)`), in degree `i=j+1`,
  when the cycles in degree `j` are projective and split off, the map `Ext¹(H_j(X),Y)→Hⁱ(Hom(X,Y))` is
  injective and its image is the kernel of the Kronecker map; this is the Hom/Ext sequence of §7.2.
- `TauCeti.deRhamComplex` and `TauCeti.deRhamCohomology` (`Geometry/Manifold/DeRham/Basic.lean`): the
  de Rham complex of smooth real forms and its cohomology, the carrier of DifferentialGeometry Layer 6.

### From TauCetiRoadmap.SmoothBundlesConnections

B1.3 (cocycles and nonabelian Čech H¹), B1.4 (slices, free proper quotients and homogeneous spaces;
the based gauge quotient of a three-manifold is constructed here, §1.2), B2.5 (frame bundles,
reductions and the adjoint bundle), B3.1–B3.3 (principal connections, the Atiyah sequence, induced
connections), B4.1 (curvature and `F_(A+a)=F_A+d_Aa+½[a∧a]`), B4.2 (the gauge group and its left
action `u·A=Ad(u)A−du·u⁻¹`), B5.2 (holonomy and flat connections, flat bundles as conjugacy classes of
representations of π₁), B6 (rank-one integral classes and Chern–Weil).

### From TauCetiRoadmap.FourManifolds

Layer 5: its carrier `A_s=A₀+H^s(T*M⊗ad P)` with gauge groups for s ≥ 3; §5.1 (the deformation
complex, stabilizers and the index `8k−3(1−b₁+b₂⁺)`); §5.2 (metric transversality); §5.3 (all-charge
compactification and obstruction gluing, with the unit-ball critical estimate: below a curvature
threshold a gauge with `d*a=0`, `a(ν)=0` and `‖a‖_W¹,²+‖a‖_L⁴≤C‖F_A‖_L²`, modulo constant SU(2)); the
energy identity `E(A)=8π²k+2‖F_A⁺‖²` and the charge-one bubble energy 8π².

### From TauCetiRoadmap.DifferentialGeometry

Layer 5 (integration of forms and Stokes' theorem); Layer 6 (the de Rham complex and its cohomology).

### From TauCetiRoadmap.AlgebraicTopology

§2.1 (relative chain quotients) and §2.6 (local systems and twisted chains); §6.1 (local-system
cochains), §6.2 (cup and cap products, including local coefficients), §6.3 (homological orientation,
the orientation local system and fundamental classes), §6.4 (Poincaré–Lefschetz duality).

### From TauCetiRoadmap.CharacteristicClasses

C3.2 (Stiefel–Whitney and Chern classes), C3.3 (Pontryagin classes `p_i(E)=(−1)^i c_(2i)(E_ℂ)` and the
integral Bockstein classes `W_k(E)=β(w_(k−1)(E))`), C3.5 (`w₂` as the universal transition-lift
cocycle), C4.1 (invariant polynomials and Chern–Weil forms), C4.2 (Chern and Pontryagin forms and their
integral comparison), C4.3 (the universal Chern–Weil map).

### From TauCetiRoadmap.GeometricTopology

§1.1 (smooth collars), §1.3 (gluing along the boundary and handle attachment), §1.4 (connected sum),
§1.5 (tubular neighbourhoods), Layer 5 (Dehn surgery: §5.2 Dehn filling and surgery along slopes),
Layer 9 (§9.1 handlebodies and Heegaard splittings).

### From TauCetiRoadmap.ComplexKahlerGeometry

K5a: §5.1 (pointwise algebra, including the Hodge star on every exterior degree, transported to real
forms), §5.4 (the compact-bundle Sobolev scale `BundleSobolev E s` and `RealBundleSobolev`, with
`RealBundleSobolev V 0 ≃L[ℝ] L²(V)`), §5.7 (Laplace-type estimates, spectral theory, the harmonic
projection and the Green operator).

### From TauCetiRoadmap.PseudodifferentialOperators

P1 (differential operators and their principal symbols), P5 (Sobolev, Lᵖ and Hölder mapping
estimates), P6 (ellipticity, parametrices and Fredholm theory), P7 (elliptic powers and changes of
order).

### From TauCetiRoadmap.IndexTheory

I1 (Hilbert Fredholm connectors), I2 (symbol classes and the analytic index), I7 (§7.1 the de Rham
operator and §7.2 the signature operator).

### From TauCetiRoadmap.SpinGeometry

G2 (volume, chirality and exterior-form comparisons), G4 (G4.2 principal spin lifts, G4.3 the spin
obstruction), G6.1 (the pinned symbols) and G6.4 (the exterior Dirac operator `D=d+d*`).

### From TauCetiRoadmap.HeegaardFloer

F0 (its Layer 2): F0.S (§2.1, sharp finite-dimensional Sard), F0.0 (§2.2, generic Fredholm maps,
sections and determinant lines), F0.1 (§2.3, function spaces and generic functions), F0.2 (§2.4,
trajectory path charts and asymptotically hyperbolic Fredholm theory), F0.3 (§2.5, universal zero sets
and the regular-parameter projection), F0.5 (§2.7, regularity-loss comparisons for surface and strip
Cauchy–Riemann sections). F1 (its Layer 3, the Cauchy–Riemann elliptic package; F1.4 consumes F0.0's
determinant line, dual, exact-sequence and orientation-transport interfaces). M.5 (its §1.5,
continuation chain maps, digon homotopies and triangle composition).

### From TauCetiRoadmap.SymplecticGeometry.HamiltonianReduction

R5 (gauge actions over a surface: Sobolev gauge spaces and the Coulomb slice, smooth and weak-flat
quotients, based and unbased, holonomy, the twisted surface Poincaré-duality pairing on H¹_A, the fixed
central level with a specified determinant connection), consumed through GQ1.

### From TauCetiRoadmap.GaugeQuiltFieldTheory

GQ1 (fixed-determinant coprime surface moduli `M(P,δ)` with `B(ξ,η)=−tr(ξη)/(4π²)` and `Ω=∫B(a∧b)`, the
left action `g·A=gAg⁻¹−(dg)g⁻¹`, dimension `(2g−2)(r²−1)`, simple connectivity, the empty sphere and the
genus-one point, `c₁=2r[Ω]` with `c₁=4[Ω]` at `r=2`, line tensoring `d↦d+rℓ`, the `H¹(X;ℤ/2)` action and
its fixed points at genus one, the tangent space as the H¹ of the deformation complex). GQ2–GQ5 are not
consumed.

### From TauCetiRoadmap.FukayaTheory

FK1.1 (geometric and orientation carriers: background classes and relative spin lifts), FK1.2b
(labelled integral classes, caps and coefficient transport), FK2 with FK2.2 (bordered domains, the
nonlinear Cauchy–Riemann section and its linearization), FK3 (classical regularity, raw compactness and
smooth data, with the monotone data of FK3.1), FK6 with FK6.1 (monotone fixed-potential categories and
monotone geometric data), FK8 with FK8.0 (units and sign laws).

## References

- [Kronheimer–Mrowka, Knots, sutures and excision](https://arxiv.org/html/0807.4891v2), §7: gauge
  choices, integral and complex variants, operations and the specified excision theorem (§7.1,
  pp. 52–53; §7.2, Proposition 7.1, p. 53, and Corollary 7.2; Definition 7.3 and Proposition 7.4, p. 55;
  Theorem 7.7, p. 57).
- [Scaduto, Instantons and odd Khovanov homology](https://arxiv.org/html/1401.2093v3), §§2–7 and 9:
  surgery bundles, metric-stretching maps, framed data, signs and reducible-aware comparisons (§1,
  p. 3; Theorem 1.3, p. 2; Theorem 2.1, p. 5; §7.1, p. 29; §7.6, p. 34; §§9.2–9.3, pp. 54–55; §9,
  pp. 54–60).
- [Chen–Scaduto, Nilpotency in instanton homology](https://arxiv.org/html/1612.08690v1):
  genus-sensitive point-operation and surface-product calculations (Theorem 1, p. 1; Corollary 1, p. 2).
- [Daemi–Fukaya–Lipyanskiy, Lagrangians, SO(3)-instantons and the Atiyah–Floer Conjecture](https://arxiv.org/abs/2109.07032v1),
  cited as *Atiyah–Floer*, at version v1 with its page numbers: §1 (admissible splittings, Theorems
  1–4), §2.2 (`M(Σ,F)`, eq. (2.5), Remark 2.2), Hypothesis 1 and Proposition 2.21, Proposition 2.27 and
  Definition 2.37, §3 (the mixed equation on special quintuples and Theorem 3.29), §§4.4, 4.7, 5, 6,
  §7 (Definitions 7.4–7.6 and Theorem 7.7): the admissible splitting and embeddedness theorem and the
  mixed comparison, with its exact coefficient and operation range.
- [Daemi–Fukaya–Lipyanskiy, Lagrangians, SO(3)-instantons and mixed equation](https://arxiv.org/abs/2109.07038v1),
  cited as *mixed equation*, at version v1: Theorems 3.4 and 3.6 (regularity, p. 14), Theorem 4.2
  (energy quantization, p. 20), Theorem 4.44 (removable singularities, p. 30) and §5 (Fredholm theory,
  pp. 40–58): the mixed analytic framework.
- Donaldson, *Floer Homology Groups in Yang–Mills Theory* (Cambridge Tracts in Mathematics 147, 2002),
  cited by section and page, not in an open repository: §2.5.2 the Chern–Simons functional (p. 16) and
  §2.5.3 the instanton equation (p. 20) for Layer 0; §3.2 the index (p. 47), §3.3.1 weighted spaces
  (p. 58) and §3.3.2 Floer's grading function and the Atiyah–Patodi–Singer comparison (p. 64) for
  Layer 3; §4.1 exponential decay (p. 77), §§4.2–4.3 moduli theory and weighted spaces (pp. 82–90) and
  §4.4 gluing instantons (p. 91) for Layers 3–4; §5.1 compactness (p. 113), §§5.2–5.3 the groups and
  independence of metric (pp. 122–129), §5.4 orientations (p. 130), §5.5 deforming the equations with
  §5.5.1 transversality (pp. 134–144) and §5.6 SU(2) and SO(3) connections (p. 145) for Layers 2, 4
  and 5; Chapter 6 (pp. 151–167) for Layer 6; §7.1 the maps D₁, D₂ (p. 168) for §§7.1–7.2. The analytic
  and orientation constructions cited there are realized through the interfaces above.
- Donaldson–Kronheimer, *The Geometry of Four-Manifolds* (Oxford Mathematical Monographs, 1990), cited
  by chapter, not in an open repository: Chapter 4, Yang–Mills moduli spaces (deformation theory, the
  index formula and Uhlenbeck compactness on closed four-manifolds, consumed through FourManifolds
  Layer 5) for Layers 1, 3 and 4; Chapter 5, Topology and connections (orientability of the moduli
  spaces and the universal bundle) for Layers 4 and 6; Chapter 7, Excision and gluing, for Layer 4.
- [Frøyshov, Equivariant aspects of Yang–Mills Floer theory](https://arxiv.org/html/math/9903083),
  §§2–3: the integral point-count and reducible boundary identity and the reduced kernel/image
  construction, with the cohomological-to-homological sign adapter of §7.2 (§2, pp. 4 and 6;
  Theorem 4, p. 7; Theorems 6–8 and Definition 1, pp. 11–14; §5 and Proposition 2, pp. 19–20;
  Theorem 9, p. 20). The field-coefficient framed decomposition is the separate Scaduto theorem.
