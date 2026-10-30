# Roadmap: four-dimensional manifolds, intersection forms and elliptic examples

**Summary.** Build the geometry and algebra of four-manifolds: concrete smooth models and
handles, homotopy classification by intersection forms, topological realization
and classification, Spinᶜ structures and torsion, definite-form restrictions from
anti-self-dual gauge theory, and elliptic surfaces. The constructions, comparison
maps and proof foundations are part of the specification. A named classification
theorem does not replace its geometric or analytic prerequisites.

## Scope and ownership

Generic collars, boundary gluing, handles, connected sums and surgery carriers
come from GeometricTopology. Its comparison
item 3 specifies the Kirby–Siebenmann obstruction to PL structure;
its tangent-microbundle and stable-classifier interfaces are required below; its high-dimensional PL existence
theorem is not applied in dimension four. Its Layer 3 concerns
diffeomorphism groups; the algebraic surgery, normal-bundle and
transversality contracts needed in F3 below are additional generic inputs,
not exports of that layer. Ordinary chains, products, orientations,
duality, CW comparison, obstruction theory and representability come from
AlgebraicTopology. Use the actual integral forms
and boundary dictionaries of IntegralLattices,
without a second lattice carrier.

Projective spaces and their smooth structures come from
ComplexKahlerGeometry K7,
TopologicalKTheory T1/T6 and
GeneralizedCohomology G4.
CharacteristicClasses supplies the common
Euler, Chern, Pontryagin and Stiefel–Whitney classes and bundle comparisons.
SpinGeometry supplies Spin frames and their native
covering adapters. Generic cup-i, Steenrod squares and Thom–Wu theory are owned
by TangentialBordism B4; the four-dimensional
consequences below consume that single operation theory. TangentialBordism
B1.7 owns the Fermat quartic, the rational elliptic surface E(1), its local
blowup and node charts, and the marked Lie Spin fibre complement. Import
its complex orientation, canonical-line Spin lift and characteristic numbers:
χ(K3)=24, σ(K3)=−16, c₁=0 and p₁[K3]=−48; IndexTheory I7.5
then gives complex index 2 and quaternionic index 1. Import E(1)'s section,
vanishing cycles, fibre class 3H−ΣEᵢ and the simply connected complement
of signature −8, with its actual Lie Spin boundary marking. F6 retains
the general blowup laws, coefficient discriminant comparison and torus
factorization theory; F7 retains E(n), the elliptic-quartic comparison,
the Enriques cover and the Rokhlin application to the imported filling.

## Conventions

Smooth manifolds use Mathlib's finite-dimensional real manifold carriers,
Hausdorffness and second countability, with the boundary model displayed when
present. Topological manifolds use continuous chart atlases on the same native
`ChartedSpace` substrate. Closed means compact and boundaryless; connectedness
and orientation are stated separately. A simply connected closed oriented
four-manifold has free finite-rank H₂ and a unimodular intersection form.
Topological four-manifolds need not admit triangulations or handle decompositions.

For every closed connected oriented topological4-manifold, define its
integral intersection form Q_M on H₂(M;ℤ) modulo its native torsion submodule.
Use AT6's local-homology orientation generators and fundamental class;
the smooth frame orientation is their comparison, not the definition on
an arbitrary topological manifold. Cup product and Poincaré duality give
the pairing; prove finite freeness, symmetry and unimodularity, including
the torsion pairing/UCT terms before passing to the quotient. Rationalize
it with native `TauCeti.IntegralLattice.ofIntegralForm`, retaining
`ofIntegralForm.carrierEquiv` and its form comparison. Define the signed
signature as (sigPos:ℤ)−sigNeg on that native lattice; its native `signature`
field is a triple of inertia indices. Prove orientation reversal,
homeomorphism naturality, connected-sum additivity and generator changes.

The intersection-form construction has the following API.

- Cup product and the fundamental class give an integral bilinear form on
  the torsion quotient, natural under oriented homeomorphisms.
- Reversing orientation negates the form and signed signature.
- Connected sum gives an orthogonal direct sum, preserving the displayed
  maps from the punctured summands.

**Checks.**

- On S⁴, the free H₂ has rank 0, the empty determinant is 1, and σ=0.
- On S²×S², the matrix H has determinant −1 and inertia (1,0,1), so σ=0;
  on −CP² the signed signature is −1, excluding natural-number subtraction.
- On the Enriques surface, the order-two class pairs to zero in ℤ;
  the free quotient has rank 10, while the torsion class still contributes
  to w₂ before quotienting.

*Needs:* AlgebraicTopology Stage 6's fundamental class, cup product, UCT
and duality; IntegralLattices Layers 0 and 1 for the integral-form carrier.

## Exact supplier contracts

From Mathlib, use `MvPolynomial`, its evaluation maps, `fderiv`, and
`Projectivization.submodule` and `Projectivization.map` on the native
projective quotient. These supply the polynomial and projective statements
in Layer 7 without an assumed smooth atlas on their zero sets. From Tau Ceti,
use `TopCat.singularCup` in `TauCeti.AlgebraicTopology.Cohomology.Cup` for
the cohomology pairing; its manifold fundamental-class comparison is an
AlgebraicTopology Stage 6 input. The roadmap suppliers are listed below.

| Supplier | Exact use and ownership here |
| --- | --- |
| GT Layers1–3 and comparison3 | Handles, collars, locally flat charts and generic chart and PL foundations, with the additional generic contracts below. F3 owns the dimension-four disk-embedding and classification arguments. |
| GT Layer4 carriers, Layer6 application | Framed links, linking, Seifert surfaces and Arf precede F1/F3. Layer6 consumes F3's cyclic surgery and zero-form theorem for Alexander-one slicing; Layer4's Freedman application then consumes Layer6. |
| AT Stages2–4,6,8 | Native chains/cochains, normalized sphere generators, orientation-local-system duality, ordinary obstruction/EM comparisons and proper8.5 plus its end API for the early opened cobordism and product theorem. F1/F2 own the actual handle/link/intersection computations. |
| IntegralLattices | Native integral symmetric lattices, inertia, parity, characteristic vectors and indefinite/unimodular classification. F3/F5/F7 prove manifold realizations/restrictions. |
| CKG K7, TopK T1/T6 and G4.0b | One native projective/Grassmannian carrier, its smooth model comparison and tautological bundles. F6/F7 own blowup, hypersurface and elliptic constructions on them. |
| AffineMorseLefschetz A4.0 and A0/A5/A6; GroebnerGeometry G1 | A4.0's generic noncompact boundary/BM/support duality precedes the early proper cobordism; single projective zero-locus carrier, weak hyperplane theorem and finite Veronese comparison; single elimination/saturation engine. F6/F7 own cubic/quartic discriminant and elliptic-example comparisons. |
| CC C1.2a/C2/C3; TB B4.1–2 | C1.2a S0–S5's independent supported cochains and collared-pair sequence precede the proper cobordism; single ordinary characteristic/Thom and cup-i/Sq APIs. F4 owns the oriented4/Spinᶜ/torsion consequences and Z/4 Pontryagin square. |
| Spin G6.7; Index I7.2/I7.5; TB B1.7/B3.4 | Untwisted quaternionic kernels, signature and analytic Rokhlin formulas; the concrete K3 and marked E(1) complement with their Spin data; the K3 KO genus. |
| StringOrientation S1 | Actual stable/finite-rank BString lift and H³ torsor; F4 owns the dimension≤4 consequences on its specified real vector-bundle Spin reduction. |
| HomotopySpheres §3C/§4B/§6C/§9 | Unstable link/Hopf, real stable-space and low-stem inputs to F2/F3; only its stated contracts are consumed. |
| SBC B1–4, CKG K5, PDO P5–7, Index I4/I7 and HF F0 | Shared principal/connection and Sobolev carriers, estimates/Fredholm theory and generic Sard–Smale. F5 constructs the nonlinear four-dimensional gauge slices, transversality, bubbling and gluing. |

### Additional generic input contracts for F3

The following contracts specify the inputs to F3's proof routes. GeometricTopology
Layers 1–3 and its smoothing comparison do not specify these stronger interfaces.
They require an extension of the generic theory, with the following boundaries.

- Algebraic surgery: a spherical-fibration classifier BG, compatible G/PL
  and TOP/PL fibres, quadratic Poincaré-chain L-groups, and the degree-four
  G/PL class with its mod-two square relation. The integral normalization
  is σ/8 in L₄(ℤ); L₅(ℤ)=0, whereas the Laurent splitting gives
  L₅(ℤ[ℤ])≅L₅(ℤ)⊕L₄(ℤ)≅ℤ, retaining this action in cyclic surgery.
- Controlled torsion coefficients: a compatible K/Whitehead spectrum on
  neighborhood fundamental groups, Wh, reduced K₀ and negative K-groups,
  with all three kinds vanishing for 1 and ℤ. This is the input to the
  locally finite spectral-sequence calculation, not a consequence of good
  fundamental group alone.
- Relative geometric foundations: the punctured-torus immersion and its
  bounded lift, Brown's bicollared generalized Schoenflies theorem, proper
  locally flat Euclidean embeddings and stable normal complements, the
  low-codimension normal-neighborhood theorems, relative PL structure
  theory in dimension five, compatible low-dimensional PL smoothing,
  and the stated Kirby–Siebenmann and Marin transversality ranges.

These generic contracts supply F3; its dimension-four disk, smoothing and
surgery theorems supply the knot-slicing application in GeometricTopology
Layer 6. The listed contracts cannot be inferred from that later application.

## How to read the build

The model and handle calculations give the generators used in the homotopy
classification. The local disk and controlled-topology constructions precede
normal surgery and topological classification; the characteristic-surface
comparison in F4 is an input to the latter. The polynomial, blowup and local
node constructions in F6–F7 are independent of gauge theory and topological
classification. Gauge theory then supplies the definite-form obstruction,
and the elliptic and exotic examples use these comparisons on the same models.
The labels F1–F8 identify the layers in dependency statements.

## Layer 1: Models, handles and intersection generators

### 1.1 Projective and product generators

On K7's actual CP² carrier, construct the complex-oriented line and point,
their fundamental classes and H₀/H₂/H₄ generators, cup ring
ℤ[h]/(h³), and intersection value +1 for a line. Compare its three-cell
structure with the Hopf attaching map through AT's sphere generators.
Orientation reversal changes the form to −1. Build S²×S² with product
orientation and the factor generators, whose matrix is
`[[0,1],[1,0]]`. Treat S⁴, the rank-zero form and empty connected-sum lists.
*Needs:* ComplexKahlerGeometry K7; AlgebraicTopology Stages 3 and 6;
CharacteristicClasses C2–C3 for the tautological line.

The model and generator constructions have the following API.

- The point, line and product-factor inclusions induce the chosen homology generators.
- Cup multiplication agrees with geometric intersection in these generators.
- Orientation reversal negates the evaluation on the top class.

**Checks.**

- CP² has ranks (1,0,1,0,1) and h²[CP²]=1; h³=0 by dimension.
- On S²×S², a²=b²=0 and a·b=1; the factors cannot both be positive-square generators.
- S⁴ has rank-zero H₂ and χ=2; the empty connected sum uses this model.

### 1.2 The nontrivial sphere bundle

Construct the nontrivial oriented S²-bundle over S² from the nonzero
π₁(SO(3)) clutching class, using the common frame and associated-bundle
carriers. Compare it with the projective bundle of lines in
`𝒪 ⊕ 𝒪(−1)` over CP¹ and with CP² blown up at a point. The section
from the trivial summand has normal line 𝒪(−1); its square is −1,
the fiber has square0, and their intersection is +1. In the basis
H=S+F, E=S, the form is diag(+1,−1). Prove the oriented diffeomorphism
to CP²#(−CP²), retaining these generators.
*Needs:* §1.1; GeometricTopology Layer 1's associated bundles and
gluing; TangentialBordism B1.7's local complex blowup chart.

The sphere-bundle comparison has the following API.

- The clutching map determines the oriented bundle with its marked section and fibre.
- The projective-bundle comparison preserves the exceptional normal line.
- The connected-sum comparison carries the specified basis to the hyperplane and exceptional classes.

**Checks.**

- Zero clutching gives the trivial bundle with hyperbolic even form.
- Nonzero clutching gives S²=−1, F²=0 and S·F=1, an odd form.
- In the new basis (S+F,S), the diagonal is (1,−1) and off-diagonal 0;
  replacing S+F by F leaves off-diagonal 1.

### 1.3 Connected-sum comparisons

Consume GT's connected-sum operation and prove the homology, fundamental
group, orientation, Euler characteristic and signature comparisons. For
connected four-manifolds use punctured-ball Mayer–Vietoris and van Kampen:
H₂ splits as a direct sum and the intersection form is the orthogonal sum.
Keep the actual maps from the punctured summands. Prove independence of
the permitted gluing choices by the corresponding GT isotopies.
*Needs:* GeometricTopology Layer 1's collars and connected sum;
AlgebraicTopology Stages 2, 4 and 6 for van Kampen, Mayer–Vietoris and duality.

The connected-sum comparisons have the following API.

- The two punctured inclusions identify H₂ with the direct sum.
- Their classes are orthogonal and carry the orientations of the summands.
- Permitted gluing isotopies transport these inclusions and characteristic numbers.

**Checks.**

- CP²#−CP² has signature 1−1=0 and χ=3+3−2=4.
- M#S⁴ adds no H₂ and changes χ by 2−2=0.
- CP²#CP² has signature 2; treating orientation reversal as harmless would confuse it with the first example.

### 1.4 Framed-link handlebodies

For a finite oriented framed link in S³ construct its 0/2-handlebody using
GT's native handle attachment. Prove simple connectivity, H₂≅ℤʳ and
homotopy type ∨ʳS². Build each generator as its oriented core joined to
a spanning surface, with the relative normal framing fixed. Its square
is the attaching framing and the off-diagonal pairing is the oriented
linking number. The intersection matrix is the full framed linking matrix.
Pin signs against +1-framed and 0-framed unknots and the positive Hopf link.
*Needs:* GeometricTopology Layers 1, 4 and 5; AlgebraicTopology
Stages 3 and 6; §1.1's orientations.

The framed-link handlebody has the following API.

- Core-plus-spanning-surface classes form the marked H₂ basis.
- Framings give diagonal entries and oriented linking gives off-diagonal entries.
- Kirby moves induce the stated integral changes of basis on this same form.

**Checks.**

- The empty link gives D⁴ with H₂=0.
- The zero-framed unknot gives matrix [0], while the +1-framed unknot gives [1].
- The positive Hopf link with both framings zero gives H and determinant −1;
  reversing one component changes the off-diagonal signs, not the diagonal entries.

### 1.5 Boundary kernel and cokernel

The pair sequence and Poincaré–Lefschetz duality identify its map
H₂(W)→H₂(W,∂W) with the adjoint of this matrix and give
H₁(∂W)≅coker(Q). Prove the corresponding kernel, determinant and torsion
calculations. Unimodularity gives an integral homology-sphere boundary;
an actual S³ boundary is required to attach a smooth 4-handle. F3 provides
the distinct topological contractible caps for other homology spheres.
*Needs:* §1.4; AlgebraicTopology Stage 6's pair duality and UCT;
IntegralLattices' adjoint, kernel and discriminant dictionary.

The boundary comparison has the following API.

- The pair-sequence map is the form adjoint in the specified dual bases.
- Its kernel and cokernel identify the corresponding boundary homology groups.
- Change of handle basis transports the sequence and preserves the torsion order when finite.

**Checks.**

- For [0], kernel and cokernel are both ℤ; no nonzero determinant formula applies.
- For [2], the kernel is 0 and cokernel ℤ/2, of order |det[2]|=2.
- For [1], both are 0; the conclusion is a homology sphere, not an identification with S³.

### 1.6 Matrix realization and E₈ plumbing

Realize every symmetric integral matrix by an explicit framed link,
using crossings/clasps for off-diagonal entries and integer framings for
the diagonal. Prove the realization and changes under Kirby moves on the
existing link/handle carriers. Construct the +2 E₈ plumbing and identify
its oriented boundary and intersection generators. Compare its cap in F3;
no arbitrary homology-sphere boundary is silently replaced by S³.

The matrix-realization construction has the following API.

- Every symmetric integral matrix occurs with its labelled generators.
- Reversing the orientation negates all intersection entries.
- Handle slides compare forms by integral congruence, preserving determinant up to a square of a unit.

**Checks.**

- The 0×0 matrix is realized by the empty link and has determinant 1.
- Framings 1,2 with linking 1 give [[1,1],[1,2]], determinant 1.
- The positive E₈ plumbing has rank 8, determinant 1 and signature 8;
  reversing its orientation gives signature −8 with the same determinant.

*Needs:* GeometricTopology Layers 4–5's framed links and handle slides;
F1's preceding generator and boundary comparisons; IntegralLattices' E₈ form.

### Examples

The complex line in CP² has square +1, while the two factors in S²×S²
have squares zero and mutual pairing +1. The +1-framed unknot gives [1],
the 0-framed unknot gives [0], and the positive Hopf link gives H.

### Dependencies

GeometricTopology Layers 1, 4 and 5 supply collars, gluing, framed links
and handle attachment. AlgebraicTopology Stages 2–4 and 6 supply the pair
sequence, van Kampen, cup products and duality. ComplexKahlerGeometry K7
supplies projective atlases; CharacteristicClasses C2–C3 supplies the
clutching and characteristic-class comparisons. F3's caps are used only
in the later topological applications of the handle calculations.

## Layer 2: The homotopy classification

For any connected simply connected closed oriented topological four-manifold M,
remove an embedded coordinate ball with its locally flat sphere boundary.
GT's topological CW-type theorem applies without a triangulation. Duality and
the pair sequence compute the punctured manifold's homology. Relative Hurewicz
and the simply connected homological Whitehead theorem give its homotopy
equivalence to a finite wedge of two-spheres, naturally with a chosen H₂ basis.
The ball collar gives a cofibration; compare M with the actual mapping cone of
an attaching map S³→∨ʳS².

Compute π₃ of this wedge as a free abelian group on the Hopf maps ηᵢ and the
pairwise Whitehead maps for i<j. Consume the generic Hopf/Whitehead operations
of HomotopySpheres §3C.1–2
and own this particular finite-wedge decomposition and its inverse. Normalize
η by Hopf invariant +1. Normalize the off-diagonal map by the top-cell
attachment of the product-oriented S²×S²; compare it with the supplier's
Whitehead sign. Prove the self-product relation `[ιᵢ,ιᵢ]=2ηᵢ` in these
conventions and calculate the attaching coordinates as
`Σᵢ Cᵢᵢ ηᵢ + Σᵢ<ⱼ Cᵢⱼ [ιᵢ,ιⱼ]`, where
Cᵢⱼ=⟨xᵢ∪xⱼ,[M]⟩ in the H² basis dual to the chosen H₂ sphere
generators. If Q is the homological intersection matrix in those sphere
generators, prove C=Q⁻¹, integrally by unimodularity. Test the
positively linked Hopf link with framings1 and2: its handle matrix is
Q=[[1,1],[1,2]], while C=[[2,−1],[−1,1]], so the attachment has
coordinates2η₁+η₂−[ι₁,ι₂]. CP² and the hyperbolic product remain the
rank1/product sign tests, rather than the only basis-conversion tests.

Own the unstable colored-framed-link comparison for this finite wedge:
a map S³→∨ʳS², made smooth near one selected regular value in each
sphere, gives r disjoint labeled oriented links with their actual normal
2-framings. Construct the tubular collapse inverse, and prove maps are
homotopic exactly when the colored framed links are bordant in S³×I.
Compute the same-color self-linking and distinct-color linking coordinates;
normalize the framed unknot and Hopf link against the chosen ηᵢ and
Whitehead basis. Prove the actual diagram/coordinate equivalence, not only
an abstract rank count. For the top-cell attaching map fill each colored
link by an oriented spanning surface in D⁴, retaining its boundary framing,
and construct the resulting closed classes in M. These classes are PD(x_i),
where x_i is dual to the original sphere generator. Their intersections are
C=Q⁻¹; they are distinct from F1's handle core/spanning-surface basis,
whose matrix is Q. Prove the coordinate assertion through this exact
Pontryagin–Thom/cup/intersection comparison.

The coloured-link and mapping-cone comparisons have the following API.

- Tubular collapse and inverse images of regular values give mutually inverse homotopy/bordism classes.
- Changing normal framings changes the corresponding Hopf coordinates.
- Distinct-colour linking computes the off-diagonal Whitehead coordinates, with the displayed cohomological dual basis.

**Checks.**

- For no colours the wedge is a point and its π₃ is zero.
- One +1-framed unknot has Hopf coordinate 1; its zero framing gives 0.
- A positive two-colour Hopf link has off-diagonal coordinate 1;
  two unlinked zero-framed unknots give all coordinates zero.

*Needs:* GeometricTopology's smooth tubular collapse and link bordism;
HomotopySpheres §3C; AlgebraicTopology's cofibres, cup product and sphere generators.

Consume IntegralLattices Layer6A's indefinite unimodular normal forms and
Layer0F's primitive splitting to derive
the primitive isotropic splitting theorem for indefinite four-manifold forms: an indefinite form of a closed
simply connected oriented4-manifold has a nonzero primitive integral class
v with v²=0. Export an actual companion w with v·w=1, the primitive rank2
summand and its orthogonal complement. Replacing w by w−(w²/2)v when w²
is even gives H; in the odd case use an integer multiple of v to make w²=1,
then the explicit basis (w−v,w) gives diag(−1,+1). Retain the change-of-basis
isometry and unimodularity of the complement. The geometric theorem uses
the integral unimodular hypothesis; an arbitrary indefinite integral form
need not contain an integral isotropic line.

Define the intersection form by the ordinary cup pairing on the oriented
fundamental class and compare it with the homological geometric definition.
Prove basis-change and orientation-change laws. Two such manifolds are
orientation-preserving homotopy equivalent exactly when their integral forms
are isometric; without a prescribed orientation allow isometry with either Q
or −Q. Construct the homotopy equivalence from a form isometry through the
attaching-map calculation. This statement does not classify smooth structures
or identify the two Kirby–Siebenmann choices of an odd form.

### Examples

The homotopy-CP² attaching map is the Hopf generator. For the two-handle
matrix [[1,1],[1,2]], its inverse [[2,−1],[−1,1]] gives the distinct
attaching coordinates 2η₁+η₂−[ι₁,ι₂]. The zero-rank case has no
2-spheres and yields the top-cell model of S⁴.

### Dependencies

F1 supplies the handle generators and intersection pairing; AlgebraicTopology
Stages 2–4, 6 and 8 supply duality, Hurewicz and CW comparison;
HomotopySpheres §3C supplies Hopf and Whitehead operations;
IntegralLattices Layers 0F and 6A supply primitive splitting and normal forms.

## Layer 3: Topological surgery, realization and classification

### 3.1 Disk embedding and its local TOP consequences

Construct these
items in the following order, using GT's collars, microbundle charts
and CW-type theorem.

### 3.2 Smooth-ambient immersion data and the disk engine

On a smooth
oriented4-manifold, define a proper generic immersed disk/sphere family
by native smooth maps with injective differential, embedded prescribed
boundary collars and finitely many transverse double points. Supply
local sheet charts, normal rank2 bundles, framings and intersection signs;
extend to locally finite families with proper sheet neighborhoods.
Define λ and µ using ℤ[π] using the universal-cover/local-coefficient chain
dictionary, with sheet-order involution g↦g⁻¹ and whiskered labels.
For fixed normal framing µ takes values in the additive quotient by
⟨g−g⁻¹⟩, retaining the identity coefficient. Prove
λ(f,f)=sym(µ(f))+e(ν_f)·1 with sym([g])=g+g⁻¹,
together with basepoint, tubing, finger/Whitney/cusp and framing-change
formulas. For unframed homotopy classes of dual spheres, additionally
quotient µ by the identity coefficient; call this reduced µ. It is
independent of cusp changes (Powell–Ray–Teichner, §1.3, p. 6, equation
(1.1)). The framed regular-homotopy statement retains the unreduced µ. Give the analogous PL-ambient chart construction.

The immersed-sheet and intersection constructions have the following API
(Freedman–Quinn §§1.2–1.5).

- Whisker changes transport group-ring labels; sheet interchange inverts
  a label and preserves its class modulo g−g⁻¹.
- Regular homotopies retain the boundary framing; a cusp changes the
  normal Euler term and the identity coefficient of µ compatibly.
- Restriction and locally finite gluing retain sheet neighborhoods and
  the signed intersection sum.

**Checks.**

- A framed embedded disc has µ=0 and e=0, hence λ(f,f)=0.
- One positive double point with e=0 gives µ=1 and λ=2; a negative
  double point gives µ=−1 and λ=−2.
- For π=ℤ, the label t and its inverse give the same symmetrization
  t+t⁻¹; deleting the identity coefficient would instead give 0 for
  the positive-double-point test, contradicting λ=2.

*Needs:* GeometricTopology Layers 1 and 5's smooth tubular neighborhoods
and framings; AlgebraicTopology local-coefficient chains and universal
covers; oriented local sheet charts.

Own the decomposition-space API: upper-semicontinuous decompositions
into compact sets of locally compact metrizable spaces, closed/proper quotient maps,
saturated neighborhoods, relative equivalence and shrinkability by
homeomorphisms small in a specified quotient cover and shrinking pieces
in the source metric, fixed on the relative locus. Prove Bing's shrinking
criterion, countable locally finite/relative forms and compatible limits
with inverse continuity and properness. Build capped gropes, kinky handles
and Casson towers from signed rooted-tree stages and attaching product
collars, with their stage/neighborhood/end comparisons. Prove engulfing,
re-embedding and shrinking estimates; export
the relative Casson-handle homeomorphism to the open two-handle, relative to the attaching region
and its framing, from the actual shrinking maps.

The decomposition and tower constructions have the following API.

- Quotient restriction to a saturated open set commutes with the quotient
  map and retains the prescribed relative locus.
- Controlled shrinking maps have compatible inverse limits; the limit
  map and its inverse are continuous and proper.
- Attaching-region identifications retain the disk framing under tower
  inclusion, re-embedding and passage to the open two-handle.

**Checks.**

- The singleton decomposition of ℝ has identity quotient and pieces of
  diameter zero; it satisfies every positive shrinking tolerance.
- Collapsing [−1,1] in ℝ gives a proper quotient to ℝ, represented by
  q(x)=x+1 for x<−1, q(x)=0 for |x|≤1 and q(x)=x−1 for x>1.
  The collapsed piece has diameter 2 before shrinking; it is not a
  singleton decomposition, although its quotient is again a line.
- Collapsing all of ℝ to one point has inverse image ℝ of a compact
  singleton, hence is not proper; compact decomposition elements are
  required for the proper-quotient assertion.
- An ordinary open two-handle D²×ℝ² has trivial fundamental group,
  while its attaching region S¹×ℝ² has fundamental group ℤ; the
  relative theorem must retain that attaching region.

*Needs:* §3.2's immersed sheets, framed intersections and tower collars;
GeometricTopology Layer 1's collars and handle attachment; the relative
shrinking and re-embedding arguments of Freedman–Quinn §§2–5.

Define a good group Γ by the framed grope condition: for each based
height-1.5 disc-like capped grope and each homomorphism from its
fundamental group to Γ, its attaching circle bounds a generically
immersed disc inside the thickened grope with the prescribed boundary
framing, whose double-point loops all map to 1 in Γ
(Powell–Ray–Teichner, Definition 3.2, p. 9). The body and caps are the
geometric carriers above; this is not a hypothesis asserting disk embedding.

- Prove invariance under group isomorphism and closure under subgroups,
  quotients, extensions and directed colimits; transport the actual
  homomorphisms and framed discs (Powell–Ray–Teichner, p. 3).
- Prove the subexponential-growth theorem through the grope splitting,
  double-point-label counting and contraction estimates; finite groups,
  ℤ and solvable groups are applications of the closure theorems
  (Krushkal–Quinn, unnumbered theorem, p. 408, and §§2–4;
  Powell–Ray–Teichner, p. 3).
- Prove the local version with good images of neighborhood fundamental
  groups. Its control bounds depend on the chosen neighborhoods and
  grope data, not on a uniform growth rate for every good group.

**Checks.**

- A finite group C₂ has at most 2 word-ball elements, and S₃ at most 6;
  both have subexponential growth, despite S₃ being nonabelian.
- In ℤ with generators ±1 the radius-n word ball has 2n+1 elements;
  this is a linear-growth application, not the definition of goodness.
- For the trivial homomorphism every double-point label is 1, while
  a loop mapped to the nonidentity element of C₂ violates the required
  label condition. No assertion about goodness of a nonabelian free
  group follows merely from its being finitely generated.

*Needs:* §3.2's thickened capped gropes, framings and double-point
labels; the grope splitting and growth argument for good groups.

First prove the disk-boundary embedding theorem in smooth/PL ambient manifolds with
good fundamental group: a finite immersed disk family with embedded disjoint boundary
collars and algebraic dual spheres g_j, λ(f_i,g_j)=δ_ij,
λ(g_i,g_j)=0 and reduced µ(g_j)=0, has disjoint locally flat embedded disks
with the same framed boundaries and generically immersed framed
geometric dual spheres. Construct the duals through the Clifford-torus
capped-surface and tower argument of Powell–Ray–Teichner,
[Theorem A, p. 2](https://arxiv.org/abs/2006.05209), and retain their homotopy
comparisons. Geometric duality means exactly one transverse intersection
for the matching pair and none for other pairs; prove the complement
π₁ comparison. Derive the framed disk-embedding theorem: when the disks themselves
have λ(f_i,f_j)=0 for i≠j and µ(f_i)=0 and framed algebraic duals,
they are regularly homotopic rel boundary to disjoint locally flat disks,
by embedding their Whitney disks and performing the relative Whitney
moves. The framed version uses the same good-group hypothesis
(Powell–Ray–Teichner, Theorem A and §5; Freedman–Quinn, Corollary
5.2.1, pp. 87–88, for the Whitney-disc argument). Prove tubing,
π₁-null grope and counting/control lemmas with their label homomorphisms;
1 and ℤ are applications. Also own
Freedman–Quinn Proposition2.9's group-reduction construction for a
specified finite normal series with finite/cyclic quotients: replace
caps after height raising so the grope image is π₁-null, preserving
its body, attaching region and transverse spheres. Prove the finite
stage-label pigeonhole case, the cyclic word-growth case and induction
through the series, with the size bounds used in §3.3.

**Checks.**

- In (RP³×I)#(S²×S²), remove a ball meeting one factor sphere away
  from its intersection with the other. The punctured factor is a
  proper embedded disc f, the other factor is a sphere g, and π₁=C₂,
  λ(f,g)=1, λ(g,g)=0 and µ(g)=0 in ℤ[C₂]. The theorem includes
  this already embedded configuration with its boundary framing.
- Two independent hyperbolic pairs give λ(fᵢ,gⱼ)=δᵢⱼ, the 2×2
  identity matrix. Duplicating a single dual instead gives repeated
  columns and fails the hypotheses.
- One positive double point with normal Euler number zero gives
  λ(f,f)=2 and µ(f)=1. The boundary theorem need not preserve f's
  relative homotopy class; the regular-homotopy variant requires µ(f)=0.

*Needs:* §3.2's good-group grope condition, Clifford tori, tower
shrinking and framed geometric duals (Powell–Ray–Teichner, Theorem A,
Lemmas 4.1–4.2 and §5).

### 3.3 Controlled disks

Own the controlled variant of
Freedman–Quinn §5.7 on this smooth/PL ambient carrier. For a locally
compact metric control space X, p:E→X and positive ε:X→ℝ,
assume its local fundamental-group images are good:
every x∈U has V⊂U for which each component's
π₁(p⁻¹V)→π₁(p⁻¹U) image is in that class. Define
(δ,1)-connected r:M→E over X as follows: every commutative diagram
L→M, K→E with (K,L) a relative CW 2-complex admits an extension
K→M of the map on L, whose composite K→M→E differs from the given
K→E by less than δ after projection to X, measured at the latter image.
This is controlled extension, not merely a surjection on ordinary π₁
(Freedman–Quinn §5.7, p. 90). Define δ-small immersed families
and algebraically trivial/dual intersections by the actual δ-small
Whitney disks pairing all extra intersections. Prove there is positive
δ:X→ℝ such that every locally finite δ-small disk family with these
data admits ε-small disjoint embedded disks with the same framed
boundaries and geometric duals. Pin smallness at every point of the
image, boundary/relative support and exhaustion compatibility. Prove
controlled separation, tower-height raising and limiting estimates
before using this theorem in TOP handle straightening.

The controlled-extension and small-family constructions have the following API.

- Increasing a positive tolerance preserves an existing extension or
  small-family witness; restriction preserves its actual boundary map.
- Control of a set means its diameter is less than δ(y) at every image
  point y. Gluing estimates use the sum of the specified error bounds.
- A δ-algebraic cancellation includes immersed Whitney discs of that
  diameter; equality of group-ring intersection sums alone is insufficient.

**Checks.**

- For identity r and point control, the prescribed bottom map is its
  own lift, and every control error has size 0<δ.
- A track in ℝ from 0 to 1/4 has diameter 1/4: it passes constant
  tolerance 1/2 and fails tolerance 1/8 and strict tolerance 1/4.
- For r:S¹→point and (K,L)=(D²,S¹), the degree-one boundary loop
  has winding 1 and does not extend, even though every control
  distance is 0. Smallness alone does not imply connectedness.

*Needs:* §3.2's good-group contraction, immersed Whitney discs and
towers; AlgebraicTopology Stage 3's relative CW complexes;
Freedman–Quinn §5.7's controlled separation estimates.

### 3.4 PL controlled h-cobordisms and isotopy

Before §3.5, own
the PL-input controlled h-cobordism theorems of Freedman–Quinn,
Theorems 7.5–7.6, pp. 113–114. For a proper controlled cobordism over
such a reference, for every positive continuous ε there is positive
continuous δ such that a (δ,1)-connected δ-h-cobordism has an ε-small
TOP product exactly when its controlled torsion q₁ vanishes. A
simplicial-NDR reference p:E→X with good local fundamental-group images
includes embeddings E→|K|,X→|L|
over a simplicial map K→L and neighborhood deformation retractions
whose homotopies commute with that map. Build restriction, locally
finite/cofinal models and the controlled relative2-complex extension
comparison. Construct the local Whitehead coefficient cosheaf from
the required K/Whitehead spectra of the neighborhood fundamental
groups. Define its locally finite homology H₁^lf(X;S(p)) with
restriction, relative support and cofinal-NDR-model comparisons;
build its cellular spectral sequence and the convergence/truncation
needed in total degree1. Identify its coefficients Wh, reduced K₀
and negative K-groups. Construct the controlled based-chain torsion
q₁(W,M₀), including basis/change-of-control, additivity and the
comparison with this homology. For local groups1 orℤ use the required coefficient
vanishing of all these groups to prove q₁=0.

The reference, coefficient and torsion constructions have the following API
(Freedman–Quinn §§7.4–7.6, pp. 112–114).

- Restricting a simplicial neighborhood-retract diagram transports both the reference map and its covering deformation.
- Cofinal reference models compare the coefficient homology and the torsion class with their actual chain maps.
- Product cobordisms have torsion zero; concatenation adds transported torsions and preserves relative support.

**Checks.**

- Over a point with trivial reference group, the constant coefficient spectrum has the required Wh, reduced K₀ and negative K groups all zero, so the total-degree-one obstruction group is zero.
- The identity reference on an interval has identity neighborhood retractions; all retraction tracks have diameter 0.
- A product M×I over a point has q₁=0; if M is noncompact the constant control map is not proper, since the inverse image of the compact point is the entire noncompact product. This excludes applying the proper theorem from torsion vanishing alone.

*Needs:* The generic K/Whitehead coefficient contract; AlgebraicTopology's
locally finite chains and relative CW comparisons; §3.3's control estimates.
The coefficient-spectrum and convergence constructions require the generic
extension specified in the supplier contracts.

Given open V⊂U⊂X and positive control ε, choose δ so that a
δ-1-connected δ-h-cobordism over U^(2ε), supplied with a δ-small
PL handle structure and no handles over V^(2ε), has the obstruction
in H₁^lf(U^ε−V^ε;S(p)). Here U^ε={x |∃u∈U,dist(x,u)<ε(x)}.
Prove vanishing produces an ε-small TOP handle structure with no
handles over U, agreeing outside U^(2ε)−V. Pin the product on a
smaller neighborhood of V. Its failure to be a PL isomorphism lies
either in an ε-small TOP regular neighborhood of a1-complex or
in a PL regular neighborhood of a PL2-complex K that every PL
immersed surface with boundary disjoint from K can avoid by an
ε-small regular homotopy rel boundary. Give both alternatives and
the mapping-cylinder control on the regular-neighborhood arcs.
The input here is PL; passage to TOP inputs follows §3.5.

Own the proper simply connected five-dimensional h-cobordism product theorem on PL/smooth input
before §3.5: a proper5-dimensional h-cobordism with finitely many ends,
simply connected total space and trivial stable end groups has
an actual TOP product, relative to its incoming boundary and prescribed
side collars. Both boundary inclusions must have proper deformation
retractions. Use AT8.5's actual `endComponents` and
`stableFundamentalGroupAtEnd` (stable image groups, with reference-ray
whiskering); for these finite-ended spaces replace the end hypothesis
equivalently by AT8.5's `SimplyConnectedAtInfinity`. Construct a proper
height map to the cone on the finite end
set; proper retraction homotopies and stable end groups give arbitrarily
small,1-connected controlled h-cobordism data after reparametrizing that
height (FQ7.7.1). Apply the preceding PL-input controlled product theorem
with the trivial local Whitehead/K coefficients, as in FQ7.7.2, and glue
the cofinal products with their relative collar controls. Prove properness,
continuity and inverse compatibility on the exhaustion, not just products
on individual compact pieces. The later extension to TOP handle inputs
follows §3.5; the early theorem uses the supplied PL/smooth structure only.

Own Černavskii–Edwards–Kirby's approximation-implies-isotopy API on
native homeomorphisms: given h:M→N, closed C⊂M, a neighborhood U
and positive target control ε, construct δ-close embedding conditions
on g:U→N that yield an ε-small ambient isotopy of h, constant
outside U, agreeing with g on C. Retain continuous inverse maps,
supports, boundary collars and parameter/relative-neighborhood forms.
Consume the required punctured-torus immersion and bounded-lift
comparison, and construct the Alexander isotopy used in this controlled
torus trick. Prove local
deformation of embedding spaces by that construction, then handle/chart
induction and locally finite fragmentation/gluing, retaining the controls. It turns the controlled
approximation supplied above into the structure isotopies in §3.5.

### 3.5 Smoothing, TOP charts and transversality

Use §3.2–§3.4 and
the required relative dimension-five PL structure theory first to prove Quinn's
controlled Hauptvermutung: a homeomorphism of smooth/PL4-manifolds,
already a structure isomorphism on the boundary, is isotopic to a
structure isomorphism near a prescribed1-complex; for a2-complex
first allow a displacement by ambient TOP isotopy or regular homotopy.
Keep support in the specified neighborhood and the prescribed small
control. Obtain the approximation from the PL5 mapping-cylinder
smoothing obstruction, whose H⁴ term is H³ of that complex, then
apply §3.4's singular-set control and approximation-implies-isotopy.
Use the required compatible PL four-dimensional smoothing to obtain the smooth version.
Construct punctured smoothings, relative to boundary collars, by
locally finite chart gluing with these controlled comparisons.

First own the unstable smoothing comparison for noncompact TOP four-manifolds: for a TOP4
manifold with no compact components, actual smooth structures up to sliced
concordance correspond to homotopy classes of lifts of its actual rank4
tangent classifier from BTOP(4) to BO(4), with given smooth boundary germs
and relative lift homotopies. Construct this unstable comparison by the
open-manifold immersion/compression theorem and relative chart integration
(Lees–Lashof; Kirby–Siebenmann Essay V; FQ8.5), before any stabilization
connectivity or sum-stable theorem. Retain the concordance realization and
underlying TOP identification; a stable lift alone is not this input.

Before global classification own
the recognition theorem for contractible TOP four-manifolds simply connected at infinity:
a connected boundaryless TOP4-manifold V that is contractible and simply
connected at infinity is homeomorphic to ℝ⁴. Consume AT8.5's single
`SimplyConnectedAtInfinity` predicate and compact-exhaustion comparison. Contractibility trivializes the actual rank4 TOP tangent bundle;
its resulting unstable BO(4) reduction and the preceding comparison give
an actual smooth structure on V. Choose an open smooth chart ball B⊂V,
and construct the proper5-dimensional cobordism
W=(V×[0,1))∪(B×{1}), with incoming V×{0} and outgoing B×{1}.
Own the proper h-cobordism comparison for the opened product with these actual data,
rather than using the nonproper vertical projection. First prove W is
contractible and has one simply connected end. For each compact K⊂W,
choose a smaller closed chart ball D⊂B whose interior contains its
outgoing-boundary projection and a height 0≤a<1 above all points of K
outside D. Let C=projection_V(K)∪D, a compact set, and take
K′=(C×[0,a])∪(D×I). It is compact, contains K, and is a subset of W
because D⊂B. Push loops outside K′ vertically to height (a+1)/2,
inside (V\D)×{t}; this stays outside K. Van Kampen gives π₁(V\D)=0,
so those loops contract at that height. Use the same construction for
connectedness at infinity and compatible compact exhaustions.
Boundary inclusions are closed proper maps and ordinary homology
equivalences. Consume AffineA4.0's noncompact boundary duality on W and
CC C1.2a S5's supported pair sequence for the supplied collared boundary: H_c^4(W)=ℤ, the two boundary
restrictions are the signed diagonal unit maps to H_c^4(V)⊕H_c^4(B),
and all other supported groups vanish. Derive this from contractibility,
the two boundary components and the outward boundary-sign formula; in
particular each boundary restriction is an isomorphism. Apply AT8.5's
`properWhiteheadSimplyConnectedCW` to the actual locally finite
triangulations of W,V,B, using V's given simple connectivity at infinity
for the incoming inclusion; B's end condition follows from its actual
chart-ball homeomorphism with ℝ⁴. It gives proper homotopy inverses of both
boundary inclusions. AT8.5's `properStrongDeformationRetract_of_inverse`
rectifies these to proper deformation retractions fixing each boundary, using
the actual boundary subcomplexes/collars from GT. Thus W has the proper
h-cobordism data, not just ordinary contractions. Pin this construction to
Freedman1982 Corollary1.2, p.366, and §10's proper-product theorem,
together with Farrell–Taylor–Wagoner Corollary4.9; no TOP collar end of V
or previously known ℝ⁴ comparison is assumed.
The same escape construction proves AT8.5's `ConnectedAtInfinity`,
hence exactly one `endComponents` class; its finite-end comparison with
`SimplyConnectedAtInfinity` gives the required stable image group0.
Apply §3.4's
the proper simply connected five-dimensional h-cobordism product theorem to obtain V≅B≅ℝ⁴;
retain the actual inverse and proper end comparisons.

Export the early
marked contractible TOP four-ball theorem: a compact
contractible TOP4-manifold with its specified collared, oriented boundary
homeomorphism to S³ is homeomorphic to closed D⁴ extending that marking.
Its interior is contractible and simply connected at infinity by the
boundary collar. Under the preceding ℝ⁴ comparison, the inner collar
sphere is bicollared in S⁴=OnePoint(ℝ⁴). the required independent
Brown generalized Schoenflies theorem identifies its bounded complementary closure
with D⁴; reattach the collar and use Alexander extension to fix the given
boundary marking. This construction uses no four-dimensional annulus
theorem, global form classification or F4 Spin/KS formula.

Prove the hyperbolic hypersurface homeomorphism theorem for a closed simply connected
oriented TOP4-manifold with a framed locally flat hypersurface embedding
in S⁵, smooth/PL away from a specified point, whose form is kH: construct
a TOP homeomorphism to #k(S²×S²), realizing its marked form. The point
may have an exotic smooth S³ end. Use §3.2's framed disk embeddings to
represent and split the hyperbolic pairs, keeping the geometric duals
and simply connected complementary pieces. Recognize the remaining
contractible component by the early ℝ⁴/ball theorem above. The later
normal-invariant item compares this result with PL normal surgery;
that comparison is not an input here. This supplies the actual pieces
in FQ8.15, with no assumption that their separating S³ is smoothable.
It uses neither §3.7's realization nor §3.8's global TOP classification.

Own stable smoothing of topological four-manifolds here before TOP map transversality.
Given a compact TOP4 manifold with a prescribed boundary smoothing,
its stable tangent admits the corresponding smooth reduction exactly
when its relative KS class is zero; realize each such reduction by a
smoothing after finitely many interior S²×S² stabilizations. Construct
a smoothing of M×ℝ from the required relative dimension-five theory and
PL/O comparison. Apply the controlled Hauptvermutung and Browder's
ambient0/1/2-surgeries (Browder, *Surgery on simply-connected manifolds*,
Chapter V §2, especially V.2.6; FQ8.15) to a transverse slice, with actual traces,
framings and support, until the inserted pieces are simply connected
framed hypersurfaces in S⁵. Compute their hyperbolic forms and apply
the hyperbolic hypersurface homeomorphism theorem, keeping the tangent-reduction
comparison. Give the relative/concordance form and the induced stable
bundle homotopy. Consume the earlier
the unstable smoothing comparison for noncompact TOP four-manifolds, then prove
TOP(4)/O(4)→TOP/O is4-connected by the sum-stable
existence/concordance construction and this immersion comparison,
as in FQ8.19.2. Combine the4-connected comparison with the ordinary relative H⁴
vanishing on noncompact components to classify their smoothings by the
chosen stable tangent reductions. Display the lifting and difference
obstruction groups and their relative vanishings.

Then own stable isotopy of smooth four-dimensional pseudo-isotopies to the identity: a smooth
pseudo-isotopy of a compact simply connected smooth4-manifold, fixed on
M×{0} and ∂M×I, becomes isotopic to identity rel those sets after finitely
many S²×S² stabilizations. Construct nested-eye Cerf families, Whitney
spheres, factorization and the sum-square move, following
[Gabai–Gay–Hartman–Krushkal–Powell](https://arxiv.org/pdf/2311.11196),
Theorem1.1 and §§2–4. Include their TOP pseudo-isotopy-to-isotopy theorem
with the same relative sets. Use the stable smooth result to prove
π₄(TOP(4)/O(4))=0, realize the prescribed stable tangent homotopy by an
actual sum-stable isotopy, and complete FQ8.17's5-connectivity via the
D⁴×I relative lifting argument. These isotopy targets follow the earlier
smoothing/concordance construction; they are separate from it.

Prove the FQ8.19 submanifold-smoothing theorem: a proper locally flat
embedded4-manifold with no compact components in a smooth ambient
manifold, smooth near its boundary, admits an ambient isotopy rel
boundary to a smooth submanifold. Construct its required normal
structure and vector-bundle reduction, with the obstruction groups
and noncompact-relative vanishings. Own the normal block-bundle/open
regular-neighborhood carrier, its map to the stable TOP/O fiber and the
k-connected stabilization of block TOP(k)/O(k) used for codimension k>2;
codimension1 uses the Brown collar input and codimension2 uses the required
low-codimension normal-bundle theorem with the given smooth boundary germ. Retain relative boundary reductions; use the5-connected stabilization
comparison and higher-dimensional product structure to match the
tangent/normal smoothings. For compact components use puncturing and
retain the TOP chart data at the punctures in the applications below.
Construct the proper normally charted1-dimensional singular locus
in a TOP5 manifold triad whose complement is smoothed, then obtain
relative TOP5 handle structures by cancelling handles near that locus
with §3.4 and replacing its tapered product neighborhoods.

Own the normal-bundle theorem for locally flat submanifolds of TOP four-manifolds (FQ9.6–9.8): every proper
locally flat submanifold of a TOP4-manifold has an actual extendable
linear normal bundle neighborhood, unique by ambient isotopy rel the
submanifold and a smaller prescribed neighborhood of a closed subset.
Pin its zero-section/neighborhood embedding, relative boundary germ and
radial extension property. Codimension1 uses the Brown collar input;
codimension2 stabilizes the locally flat embedding by ℝ, applies the required
ambient-five codimension-two normal theorem and TOP(2) reduction, then descends by
the radial controlled5-cobordism construction with ε(r)<r/10 and §3.4.
Supply its PL handle input through the punctured smoothing before descent.
For curves construct the rank3 normal atlas by successive interval-chart
straightening and relative gluing; its reduction uses the low-dimensional
PL-to-smooth structure comparison. Points use actual TOP4 coordinate balls.
Prove restriction, isotopy, framing and normal Euler comparisons. This
locally flat theorem supplies no normal bundle for an arbitrary wild
codimension2 subset with only a π₁ condition.

The normal-neighborhood construction has the following API
(Freedman–Quinn §9.5, Theorem 9.6, p. 144, and Theorems 9.7–9.8).

- Restriction retains the zero section and radial extension; prescribed smaller closed-set germs are fixed by uniqueness isotopies.
- Normal framings pull back through ambient isotopies and compare with the sheet normal data.
- The normal Euler class agrees with the framed self-intersection calculation.

**Checks.**

- A unit-radius coordinate tube of a plane in ℝ⁴, parametrized by radial
  compression of its fibres, has rank-two product normal bundle and Euler number 0.
- A complex line in CP² has normal line 𝒪(1) and square +1, so a product normal bundle cannot replace it.
- An exceptional sphere in a complex blowup has normal line 𝒪(−1) and square −1; changing the Euler sign would identify it with the previous example.
- The identity embedding of an entire vector bundle into itself has Euler
  number 0 on a coordinate plane but is not extendable after compressing
  its source onto a proper disk subbundle: its prescribed image already
  fills every ambient fibre. The radial tube has room for the extension.

*Needs:* §3.4's relative control and §3.5's punctured smoothing; the generic
low-codimension normal and PL structure contracts; the stated radial descent.

Define generic TOP immersed surfaces by local sheet embeddings
modelled on transverse coordinate planes in ℝ⁴, finitely or locally
finitely many double points, plumbed rank2 linear normal neighborhoods,
signs, framings and regular-homotopy comparisons. Transfer λ,µ and
both disk theorems through the punctured smooth/PL construction,
retaining the geometric duals, boundary framings and the good-group
hypothesis in both TOP disk theorems. Separate the transversality targets:
ambient4 submanifold transversality with supplied normal product data;
high-ambient TOP map transversality with expected preimage dimension4,
via the submanifold-smoothing/product-structure argument; and the required
Kirby–Siebenmann range of transversality outside its stated exceptional dimensions.
Own map transversality for topological four-manifold domains for a TOP4 domain and arbitrary
codimension q with expected preimage dimension<4. Its target data are an
actual TOP normal microbundle of Y⊂X,
including its zero section and relative germs; no global linear reduction
of a rank3 or rank4 normal bundle is assumed. For q≥3, use the required proper
locally flat Euclidean embedding of the domain to replace f by its graph
in X×ℝ^D and Y by Y×ℝ^D. Apply the required
Kirby–Siebenmann submanifold-transversality theorem: the ambient dimension is increased above4,
the domain4 submanifold meets a target of codimension≥3, and the expected
intersection dimension4−q is not4. Recover the perturbed map, inverse-image
TOP manifold and actual pulled-back normal neighborhood from this graph
construction, retaining the map homotopy and its support. For q=1,2 own
the remaining exceptional graph/handle induction using the preceding
noncompact submanifold-smoothing and relative product-structure theorem,
GT's low-codimension normal reductions when applicable, and the
Kirby–Siebenmann local straightening proof modified by FQ8.19
(FQ9.12.3; Quinn, *Topological transversality holds in all dimensions*,
1988). Give the local normal-neighborhood comparison before invoking smooth
transversality on each smoothed piece; reinsert the prescribed TOP puncture
neighborhoods by the controlled relative construction. For q>4 give the
avoidance conclusion. The parameter theorem concerns the total map with
its total-dimension hypotheses and already transverse parameter-boundary
data; it does not assert simultaneous transversality of every fiber.
Keep the expected-preimage4 theorem separate. Construct the normal
pullback, restriction/gluing and stabilization comparisons,
boundary and compact-puncture forms and the Pontryagin–Thom comparison.
Also construct the all-dimension4 extension of the required
Marin stable-map transversality theorem on its precise stable normal microbundle
germs: retain the locally flat inverse image and the homotopy of the
stabilized map to a germ morphism with inverse image P×0 fixed at every
time, exactly as in Marin's Definition1.6.
For codimension≥3 and expected preimage dimension≠4 consume the required
Marin theorem, including domain dimension4; that case requires no
FQ adaptation. For expected preimage dimension4 adapt the ordinary proof
with FQ8.19's relative product structure and stable-germ uniqueness/symmetry.
For codimension1–2 stabilize the preceding ordinary normal-microbundle
theorem and compare stable germs. In codimension2 with ambient target
dimension4 own stable map transversality for codimension-two submanifolds of TOP four-manifolds for all
domain dimensions, using this section's the normal-bundle theorem for locally flat submanifolds of TOP four-manifolds;
The other low-codimension normal constructions are generic inputs. Retain the
exceptional domain/preimage4 arguments above, the full locally flat inverse
image and controlled relative homotopies. These cases are not assigned to
Marin's codimension≥3 proof. Include the expected-preimage4
branch after its preceding submanifold-smoothing construction. Arbitrary
block atlases or open regular neighborhoods do not replace these data.
The normal-bordism5 preimage case consumes the generic transversality input. Construct the
disk, dual-sphere,
characteristic-surface and embedded-circle normal charts used here;
circle traces allow arbitrary ambient π₁. Give restriction, gluing,
isotopy and stabilization comparisons. TOP controlled-input product
results follow these immersion/handle constructions.

### 3.6 Normal invariants and relative TOP surgery

Consume the required
stable spherical classifier BG, quadratic surgery groups and their
algebraic periodicity. Construct BTOP→BG by fiberwise one-point
compactification and define G/TOP as its actual homotopy fiber. Build
the comparison G/PL→G/TOP, its stabilization and boundary maps. Define
its homotopy groups through degree5: π₁=π₃=π₅=0, π₂=ℤ/2,
π₄=ℤ normalized by the surgery obstruction σ/8. From the required
TOP/PL fiber and G/PL Postnikov stage prove that its fourth stage is
K(ℤ/2,2)×K(ℤ,4). Pin the G/PL comparison: the integral degree4
class b pulls back to the integral degree-four G/PL class, with mod2 reduction equal to the
square of the degree2 class;
the PL surgery coefficient in degree4 maps by multiplication2.
Export relative lift/action and ordinary cohomology comparisons on
dimension≤4 CW-type pairs, using AT's single EM models. For a normal
invariant (a,b) on an oriented closed4-manifold prove the KS difference
is ⟨a²+ρ₂b,[M]⟩, with identity invariant(0,0).

The G/TOP fibre and normal-invariant comparison have the following API
(Freedman–Quinn §11.4, p. 215).

- The homotopy-fibre construction records the stable spherical trivialization, not only a TOP bundle.
- Relative maps and homotopies induce the normal-invariant action with its boundary restriction.
- On dimension-at-most-four CW pairs, the low-stage comparison preserves the mod-two degree-two class and integral degree-four class with the stated G/PL compatibility.

**Checks.**

- A point has a single normal invariant (0,0).
- S² has degree-two choices 0 and 1 in ℤ/2 and no degree-four coordinate.
- S⁴ has integral degree-four coordinate; the zero choice has σ-defect 0 and the positive generator has σ-defect 8, distinguishing σ/8 from σ/16.

*Needs:* AlgebraicTopology Stage 8's EM models and relative lifts; the
spherical-classifier, G/PL and quadratic-surgery generic contracts; §3.5's TOP charts.

Define a degree-one geometric TOP normal map by a proper map of compact pairs
f:N→M of degree1, a specified stable TOP bundle ξ on M, a stable bundle
map ν_N→ξ covering f, and a fiber homotopy equivalence of ξ's spherical
fibration with ν_M's. Include the actual normal trivializations and
boundary identification; ν uses GT's stable normal complement, with no
Lie-SO frame requirement. Define relative normal bordism on TOP5 pairs
with those stable maps. Prove the normal-invariant correspondence with
relative maps to G/TOP, change-of-reference and coefficient maps,
identity, pullback under the supplied transversality, and addition/action.

The normal-map and normal-bordism constructions have the following API
(Freedman–Quinn §11.4, pp. 214–215, normal maps and the surgery sequence).

- Identity maps with the identity stable normal comparison represent
  zero; bundle homotopies give the same normal bordism class.
- Composition transports the specified spherical comparison and normal
  bundle map; boundary restriction retains the actual marking.
- Transverse pullback retains the stable normal data, and the comparison
  with G/TOP intertwines normal bordism and relative homotopy.

**Checks.**

- The identity of S⁴ with its stable normal identification has degree
  1 and invariant (0,0).
- A degree-two map S⁴→S⁴ multiplies H₄ by 2 and fails degree one,
  even when stable bundle maps have been chosen.
- The identity of CP² with candidate ξ a trivial stable bundle has
  degree 1 but cannot identify its stable normal bundle with ξ:
  w₂(ν_CP²)=h mod2≠0 whereas w₂(ξ)=0.

*Needs:* §3.5's TOP transversality and normal charts; the stable normal
complement and spherical-fibration inputs; AlgebraicTopology Stage 6's
degree and Stage 8's relative lifting theory.

Own the pinch self-equivalence normal-invariant formula after this correspondence:
for α∈π₂(M), construct h_α=id∨(α∘η∘Ση) with its actual M→M∨S⁴
pinch map. In the chosen TOP4-stage prove
η(h_α)=((1+⟨w₂(M),α⟩)PD(α mod2),0), and prove the geometric
normal-map composition/action formula. For a PL M retain its G/PL
normal invariant and the integral degree-four G/PL class, with the actual G/PL→G/TOP
comparison; do not replace G/PL by a product. Compare the hyperbolic
hypersurface homeomorphism with this PL surgery construction here.
§3.8 consumes the same pinch map and action without redefining them.

Build the based quadratic surgery kernel of a normal map after the
relative π₁ surgery, with its form, normal-framing quadratic refinement
and functorial comparison to the generic algebraic Poincaré-chain model.
Consume L₄(ℤ)≅ℤ with σ/8 and L₅(ℤ)=0; prove the TOP obstruction
and zero-obstruction surgery exact sequence in dimension4 for targets
with π₁=1 orℤ by item1's framed-disk controls. For the cyclic case
consume the required Laurent L-group splitting and Wh(ℤ)=0; retain its
nonzero L₅ action. Retain the prescribed
boundary normal map/homeomorphism, the L₅ action and the normal-invariant
difference. The geometric TOP kernel and its signature are compared to
these algebraic groups, rather than another definition of them.
Own the relative ℤ[ℤ]-homology-surgery variant: a degree-one normal
map of compact4-pairs with π₁ targetℤ and a boundary map inducing
a chain equivalence on ℤ[ℤ]-local-coefficient chains, using the specified
π₁(boundary)→π₁(target)=ℤ map, need not have a boundary homeomorphism.
These are the infinite-cyclic coefficient chains; the boundary need not
itself have fundamental groupℤ. Define its nonsingular relative kernel and
L₄(ℤ[ℤ]) obstruction. Prove zero obstruction allows interior TOP
surgery to make the absolute map a homotopy equivalence after π₁
surgery, retaining the original boundary normal map and chain
comparison. Include normal-bordism and L₅ action comparisons.
Manifold targets use the normal complement above; finite CW Poincaré
pair targets carry a specified spherical normal fibration and TOP
reduction, with their local-coefficient cap-duality comparison as data.
State the absolute equivalence separately from boundary equivalence.
Own the normal-filling theorem for Arf-zero knots: for the canonical degree-one
boundary normal map g:M_K→S¹×S² of an oriented knot's zero surgery,
with Seifert longitude, meridian marking and the induced normal data,
compute its normal-bordism extension obstruction as Arf(K). Identify
the single degree2 obstruction with the generator of
[S¹×S²,G/TOP]≅H²(S¹×S²;F2), using the constructed low Postnikov stage
and its actual boundary/clutching maps. Prove Arf(K)=0 yields a compact
TOP4 normal filling (W,M_K)→(S¹×D³,S¹×S²), degree1 with its actual
extending stable normal bundle map and the original boundary map fixed.
Use GT4's Seifert refinement and TB B3's Spin bordism over S¹ for the
geometric filling, then own the normal-data extension/rectification via
the displayed G/TOP obstruction; an unmarked Spin filling alone is
insufficient. For Δ_K=1 prove g is a ℤ[ℤ]-chain equivalence through
GT4's actual Seifert matrix and cyclic-cover chain presentation.

Prove the topological five-dimensional h-cobordism product theorem: a compact simply connected
TOP5 h-cobordism with boundary4 and fixed product side collar is a
product rel incoming boundary/side collar, by the controlled TOP handles
and disk replacements. Apply the controlled product theorem to
a simplicial-NDR p:E→X over a locally compact metric X with local
fundamental-group images1 orℤ, in §3.3.2's sense. A δ-h-cobordism W→E has deformation retractions to
both boundaries whose control tracks have radius<δ and is
(δ,1)-connected in item1b's relative-complex sense. For every positive
continuous ε prove there is positive continuous δ such that each
such TOP5 cobordism admits an ε-small product homeomorphism with
its fixed side collar. Consume1b.2's single controlled based-chain
torsion q₁, its H₁^lf(X;S(p)) obstruction, neighborhood restriction and
Wh/reduced K₀/negative K coefficient comparisons; use its vanishing
for local groups1 andℤ. Give the
compatible locally finite exhaustion version, controlling both maps
and inverse maps at the end. This supplies the cap/end applications.

Own the four-dimensional topological annulus theorem: two disjoint nested locally flat
S³ embeddings in ℝ⁴ have an actual closed complementary-region product
S³×[0,1], with one prescribed boundary marking and the induced other
marking. Construct Quinn's relative end/controlled5-h-cobordism by the
preceding TOP handle and disk machinery, reduce its local fundamental
groups to the simply connected controlled product case, and descend its
product with tapering control to the four-dimensional region. Give the
collar, proper-height, inverse and boundary-identification comparisons
(Quinn's dimension4 annulus theorem; FQ7.8). Compatible pairs of boundary
markings require their comparison data. GT Layer2 consumes this n=4
theorem; the earlier marked ball proof uses Brown and is independent.

Own the homology-four-manifold point-flattening theorem: if a locally compact metrizable
ANR integral homology4-manifold W is a TOP4-manifold outside p and
its punctured neighborhoods are locally1-connected at p, construct
an open R⁴ chart at p. First prove the stabilized line-normal
approximation used by FQ9.7: the line {p}×ℝ in W×ℝ has a rank4
normal neighborhood. Own the homology-five-manifold line-normal-neighborhood theorem: a proper
embedded line L in a locally compact finite-dimensional ANR integral
homology5-manifold V, with V−L a TOP manifold and locally1-connected
complement near L, has an extendable rank4 vector-bundle normal
neighborhood, with its specified relative germ. Prove the high-dimensional
ANR resolution/normal-approximation/engulfing result of Quinn, *Ends of
maps I*, §3.4, specialized to the line, with actual neighborhood embedding
and zero-section. Apply it to L={p}×ℝ; codimension2 issues do not enter. Construct its normal bundle
and zero-section map, boundary/relative restriction and tapering.
Intersect that model with W×[0,∞), reparametrize the radial coordinate
to make the punctured comparison a δ-controlled5-cobordism, and use
§3.4 with control ε(r)<r/10 to descend the rank4 normal chart. Supply
its PL input by the punctured smoothing and the generic transverse/collared
construction of the radial5-cobordism before applying that theorem.
Prove continuity and inverse continuity at p. This point case uses
no codimension2 normal-bundle criterion.

Construct the contractible TOP cap of an integral homology sphere for every oriented
integral homology3-sphere Σ, with its boundary identification. Start with
Σ×I and perform framed circle surgeries on generators represented by
boundary circles of disjoint embedded surfaces with trivial normal
bundles, using their induced circle framings. Compute the resulting simply
connected cobordism's hyperbolic form and its geometric dual spheres;
apply item1 to the Whitney disks and surger the resulting framed
embedded spheres, preserving the simply connected complement. This
constructs the homology plus-cobordism from Σ to itself. Glue a
countable sequence of these and compactify its end by one point;
prove local contractibility, local homology, simply connected end
complements and apply the homology-four-manifold point-flattening theorem at that point.
The resulting boundary is Σ throughout. Prove simple
connectivity and contractibility, the relative normal/Spin comparisons,
and the relative cap-uniqueness/homeomorphism statements used by the
framed-link construction. Its absolute H⁴ is0; its fixed-smooth-boundary
relative PL obstruction can be nonzero. Prove the early characteristic
Arf comparison in F4 from item1's local controls before using it for
the even-form KS constraint below. A vanishing signature alone is not
asserted to provide a framed geometric surgery kernel.

Own the geometric realization/action of L₄(ℤ[ℤ])≅ℤ on these fillings:
a positive generator changes the kernel signature by8 while fixing the
boundary normal map and the meridian marking. Construct the signature8
TOP block from the E₈ plumbing capped by the independently constructed
the contractible TOP cap of an integral homology sphere, its degree-one normal map and its comparison
with the positive π₄(G/TOP) generator. Prove disjoint interior insertion,
addition, reversal and the resulting obstruction-change formula. §3.7's
general unimodular realization consumes this early block. Thus any
integer cyclic surgery obstruction can be killed before applying the
zero-obstruction theorem; no unspecified boundary homeomorphism is added.
### 3.7 Realization

Realize every integral unimodular symmetric form as the form of a connected
simply connected closed oriented topological four-manifold. For an even
form the Kirby–Siebenmann number is σ(Q)/8 mod2. For an odd form realize
both values0 and1. Construct these from framed-link pieces and the
topological caps, with explicit form isometries and invariant comparisons.
For an odd form choose a characteristic component in the realizing
framed link and knot it with an Arf-one knot. Prove this preserves
the full linking matrix and changes the characteristic-link Arf by1;
F4's formula then gives the other KS value on the same form.
The parity constraint belongs to the even branch, not to the existence
of a topological realization of a unimodular form.
### 3.8 Homeomorphism classification

Prove the oriented homeomorphism classification by form plus
Kirby–Siebenmann number, including the realization of a given form
isometry by an oriented homeomorphism. State orientation reversal and
connected-sum laws. Use native AT cohomology for the obstruction class and
GT's stable tangent microbundle for its definition. Construct the F2
homotopy equivalence from the given isometry. Its normal invariant has
(a,0), since the signatures agree; equality of KS gives ⟨a²,[M]⟩=0.
By Wu and Hurewicz choose α∈π₂(M) lifting PD(a) with
⟨w₂(M),α⟩=0. Consume §3.6's actual pinch self-equivalence and corrected
normal-invariant formula
η(h_α)=((1+⟨w₂(M),α⟩)PD(α mod2),0).
Compose with this self-equivalence to kill the normal invariant,
construct its normal bordism, and use L₅(ℤ)=0 and the TOP5 product
theorem to realize the original isometry by a homeomorphism. Pin the
composition actions and chosen orientations. The KS obstruction remains
distinct from existence of an unstabilized smooth structure.
### 3.9 Definite and rank-zero examples

Construct the E₈ and 2E₈ examples and their KS numbers. Pin the
positive E₈ plumbing to the eight-vertex tree with arms of lengths1,2,4
at its trivalent vertex, every framing+2 and linking signs compared with
the native positive E₈ lattice by an explicit signed basis change.
Identify its oriented boundary with the appropriately oriented Poincaré
homology sphere Σ. The boundary-connected double plumbing has form2E₈
and boundary Σ#Σ. Cap with §3.6's actual contractible TOP cap and retain
the boundary gluing map; F4 computes the resulting KS values1 and0.
Thus the unexplained cap in the source is a specified construction.
Include negative plumbings and orientation reversal when translating
indefinite normal-form decompositions. Construct the two odd
rank-one homotopy-CP² examples. F5 proves the definite non-diagonalizable
forms cannot be smooth. Treat the topological Poincaré conclusion for the
zero form separately from the unsolved smooth four-sphere problem.
Compare the earlier
marked contractible TOP four-ball theorem with the
relative-surgery proof: construct the marked degree-one normal map to D⁴;
relative H² and signature vanish, and F4's relative Spin/KS formula with
ρ(S³)=0 gives zero relative KS. Identify its vanishing normal invariant
and surgery obstruction and the product comparison from item2, including
L₅(ℤ)=0. This is a second proof of the same marked ball export, rather than
a second constructor; GT Layer6 consumes the early theorem without these
later classification inputs. No smooth4 Schoenflies theorem is asserted.

### Examples

For local group 1 the required obstruction coefficients are Wh=0,
reduced K₀=0 and K₋ᵢ=0 for i>0; the same vanishings hold for ℤ.
In contrast, the surgery groups differ: L₅(ℤ)=0 and
L₅(ℤ[ℤ])≅L₅(ℤ)⊕L₄(ℤ)≅ℤ. The positive E₈ cap has
σ=8 and KS=1; doubling gives σ=16 and KS=0.

### Dependencies

F1–F2 supply the form and homotopy comparisons. The local disk/control
constructions precede the normal-map and product theorems; F4's early
characteristic-surface comparison precedes form realization. The generic
TOP, PL, normal-bundle and algebraic-surgery inputs are the contracts stated
at their individual uses above.

## Layer 4: Spinᶜ, Wu and torsion

### 4.1 Spinᶜ, Wu and torsion

Define Spinᶜ(n) from the native Spin group times the unit circle modulo the
central pair(−1,−1), using SpinGeometry's geometric rank-zero convention.
Build its topological/Lie projection to SO(n), central circle kernel and
character `(s,z)↦z²`, with the complete associated-bundle and lift API.
For a fixed oriented metric vector bundle, Spinᶜ structures are principal
lifts with a specified map to that same SO frame bundle; isomorphisms cover
its identity. Classification concerns these lifts, not quotienting by arbitrary
frame-bundle automorphisms.

Prove existence iff W₃=β(w₂)=0 and the H²(−;ℤ) torsor of lifts on paracompact
Hausdorff CW-type bases. Compare determinant lines: c₁(L) mod2=w₂ and
twisting by a line of class a changes c₁(L) by2a. Prove pullback, sums,
orientation changes, restrictions to boundaries and compatibility with Spin
structures. Construct integral lifts of w₂ for closed oriented four-manifolds,
including the torsion calculation. A characteristic vector of the free form
alone does not detect all of w₂.

The Spinᶜ group, lift and determinant constructions have the following API.

- A lift includes its map to the fixed oriented frame bundle; isomorphisms
  preserve that map. Existence is equivalent to vanishing of β(w₂).
- Line bundles act freely and transitively on isomorphism classes of lifts
  when a lift exists; determinant classes change by twice the line class.
- Determinants reduce mod two to w₂, and lifts and determinant lines commute
  with pullback and boundary restriction.

**Checks.**

- On complex-oriented CP², w₂ is the nonzero reduction of h, but β(w₂)=0;
  the complex Spinᶜ determinant has c₁=3h. Twisting by a line of class h
  gives 5h, not 4h, so determinant change is multiplication by two.
- On S²×S², w₂=0; a Spin-induced lift has determinant class zero,
  and twisting by the first factor's generator a gives determinant 2a.
- On the Enriques surface, the complex Spinᶜ determinant has nonzero
  integral order-two class t, with reduction w₂≠0 and β(w₂)=0. Its free
  intersection form is even, which does not eliminate this torsion class.
  Twisting by the order-two line changes the lift but leaves c₁ fixed,
  since 2t=0; determinant classes do not classify all lifts injectively.

*Needs:* SpinGeometry G4's frame lifts and covering adapters;
CharacteristicClasses C2–C3's Chern and Stiefel–Whitney classes;
AlgebraicTopology Stage 8's obstruction theory and Bockstein sequence.
The Enriques computation uses §7.3 only as an example.

### 4.2 Wu identities and the characteristic-surface formula

Consume TangentialBordism's single ordinary cup-i/Sq and Thom–Wu theory. Build
the diagonal normal-bundle comparison with TM and prove the oriented
four-dimensional Wu identities, characteristic-vector parity and integral
Spinᶜ lifting theorem. An even form implies Spin when H₁ has no2-torsion,
in particular under simple connectivity; retain w₂=0 as the general criterion.
F7's Enriques example has an even free form and a nonzero torsion w₂.

*Needs:* TangentialBordism B4.1–B4.2's Wu identities;
AlgebraicTopology Stage 6's torsion/UCT duality; F4's determinant lifts.



For topological four-manifolds use the stable tangent TOP microbundle and its
w₂-nullhomotopy for the topological Spin condition, not a Lie-SO frame bundle.
Own the early characteristic-surface comparison for a closed simply
connected oriented TOP4 manifold M and an embedded oriented characteristic
surface F with its actual rank2 normal microbundle, normal Euler number
F² and chosen Spin structure on the complement. Construct the membrane
quadratic refinement q_F:H₁(F;F₂)→F₂ from the normal twisting and transverse
intersection counts; prove independence, q(x+y)=q(x)+q(y)+x·y and its
change under the specified Spin/framing data. Prove
KS(M)=(σ(M)−F²)/8+Arf(q_F) mod2, evaluating Arf through
TangentialBordism B3.2's `finiteQuadraticArf` after constructing the geometric
quadratic refinement q_F. Include integral divisibility by8
via the characteristic-vector theorem. First prove the smooth
Freedman–Kirby characteristic-surface formula, including the comparison
of its membrane quadratic form with this q_F, using the untwisted
smooth Rokhlin theorem of SpinGeometry G6.7 and IndexTheory I7.5.
Own its relative-boundary version with the actual boundary Spin
Rokhlin invariant. Define this invariant using TB B3.3's smooth Spin3
filling; order TangentialBordism B1.7 → B3 → this F4 application, while the
F3 local engine and analytic Index supplier are independent of that filling. Prove the TOP extension by §3.1's punctured smoothing,
relative cap/normal-bordism comparison and the low G/PL→G/TOP
coefficient calculation, keeping the KS defect in the boundary term.
Consume §3.5's stable smoothing of topological four-manifolds. Compare the characteristic
surface, membrane data, signature and KS under these stabilizations.
These inputs precede §3.7's realization/classification. For F=∅ the formula
gives the simply connected topological Spin KS/signature relation.
For an arbitrary closed connected oriented TOP Spin4 manifold, construct
TOP5 traces of framed surgeries on finitely many generator loops, choosing
the bounding Spin framing so the stable topological-spin lift extends.
Prove that the resulting boundary is simply connected and that both signature
and the KS characteristic number are bordism invariant by the boundary
fundamental-class calculation. Apply the simply connected relation to prove
the topological Spin four-manifold KS/signature formula in this general scope.
These traces use §3.1's supplied TOP normal charts, without a Lie Spin frame.
Compare it with the smooth Rokhlin theorem from SpinGeometry's untwisted
four-dimensional quaternionic Dirac modules and IndexTheory I7.5; Â integrality
alone gives only divisibility by8, whereas the quaternionic comparison gives16.

The membrane refinement and boundary invariant have the following API.

- Membrane changes preserve q after the specified Spin and framing data
  are fixed; its polarization is the mod-two intersection pairing.
- Boundary Spin diffeomorphisms preserve the signature residue; changing
  a smooth Spin filling changes signature by a multiple of 16.
- Stabilization by S²×S² preserves the characteristic-surface formula
  with its boundary defect and the specified normal Euler comparison.

**Checks.**

- A sphere has H₁=0 and Arf=0; for a complex line in CP² the
  formula gives (1−1)/8+0=0.
- For F empty in the E₈ TOP model, σ/8=1 and KS=1; doubling
  gives 16/8=2≡0. A signature-zero assertion alone cannot detect Arf.
- On a symplectic torus basis a,b, q(a)=q(b)=1 gives q(a+b)=1
  and Arf=1; q(a)=q(b)=0 gives q(a+b)=1 and Arf=0.

*Needs:* §3.1's immersed normal charts and punctured smoothing;
TangentialBordism B3.2–B3.3; IndexTheory I7.5; the low G/PL-to-G/TOP
coefficient comparison for the TOP extension.

### 4.3 Pontryagin square and bundle classification

Own the Pontryagin-square refinement needed for dimension-four bundle data on
the same AT cochains, with coefficient/reduction/naturality and quadratic sum
formula. Pin the degree-two Pontryagin square H²(−;ℤ/2)→H⁴(−;ℤ/4),
also on CW pairs and by homotopy transport on CW-type spaces. For an integral
cochain lift c, use c∪c+c∪₁dc mod4 with TB B4.1's integral signed
higher diagonal and coefficient-reduction comparison with mod2 cup-i.
Pin dD₁+D₁d=AW−TAW, with T the graded tensor flip, and consume
δ(c∪₁dc)=c∪dc−dc∪c−dc∪₁dc. Use dc=2b to prove closure,
lift and representative independence. Its reduction mod2
is x∪x; for an integral lift a of x it is a∪a mod4; and
P(x+y)=P(x)+P(y)+j(x∪y), where j:ℤ/2→+ℤ/4 sends1 to2 and is an
additive coefficient map, not a unital ring homomorphism.
For SO(3) and SO(4) bundles over4-dimensional CW complexes, build the
actual low Postnikov lift classification, including torsion ambiguity.
Fix a chosen w₂ representative map and its Postnikov obstruction
nullhomotopy. Rank3's H⁴(X;ℤ) lift action by a changes p₁ by−4a;
rank4's H⁴(X;ℤ)² action by (a,b) changes p₁ by−2(a+b) and
Euler by b−a, normalized by the two half-spin c₂ generators. Construct
the loops-of-w₂ H¹(X;F₂) action on these lift fibers through the actual
cochain Postnikov invariant, and quotient by that action for absolute
bundle isomorphism classes. The fixed-map lift torsor is not itself the
absolute classification. Prove the characteristic congruences: ρ₄p₁=P(w₂) in rank3 and ρ₄(p₁+2e)=P(w₂) in rank4,
including the actual Postnikov obstruction and fiber action. Do not claim
w₂,p₁,e are injective invariants on arbitrary bases
with torsion H⁴. In the Spin rank4 branch compare the two SU(2) factors and
half-spin classes, with p₁=−2(c₂S⁺+c₂S⁻), e=c₂S⁻−c₂S⁺.
Use the negative Euclidean Clifford form and a positive ordered
orthonormal4-frame: its raw volume e₁e₂e₃e₄ acts by−1 on S⁺ and+1
on S⁻. Compare this convention with the native modules and the SO4
factor order; on the product-oriented S⁴ pin c₂S⁺=−u and c₂S⁻=u,
so e(TS⁴)=2u. Prove these comparisons before using the formulas.

The Pontryagin-square construction and low bundle lifts have the following API.

- Cochain representative and integral-lift changes preserve the mod-four
  class; reduction is the cup square and pullback commutes with the operation.
- The cross term uses the additive inclusion j(1)=2, with the stated
  fixed-w₂ lift actions and subsequent H¹ quotient.
- Characteristic numbers compare with the two half-spin generators in
  the stated order; torsion H⁴ is retained in the lift classification.

**Checks.**

- On CP², P(h mod2)[CP²]=1 mod4; replacing P by twice the square
  would give 2 and fails the integral-lift comparison.
- On S²×S² with factor classes a,b, P(a)=P(b)=0 while
  P(a+b)=2ab mod4; omitting j would give 0 instead of 2.
- On S⁴ the half-spin classes (−u,u) give p₁=0 and e=2u;
  swapping the factors changes the Euler sign to −2u.

*Needs:* TangentialBordism B4.1's integral higher diagonal and mod-two
comparison; AlgebraicTopology cochain coefficients and Stage 8's
Postnikov lifts; CharacteristicClasses C2–C3; SpinGeometry G4–G6.

Construct the source's explicit characteristic-invisible rank3 bundle over
RP²×RP² on AT's actual projective carriers. If a,b are the pullbacks of the
nonzero integral H²(RP²;ℤ) classes, prove a∪b generates
H⁴(RP²×RP²;ℤ)=ℤ/2. Choose the SU(2) bundle with c₂=a∪b through the
four-stage classifier, and take its adjoint oriented real3 bundle.
Its Spin lift gives w₂=0, all its positive Stiefel–Whitney classes vanish,
its Euler class vanishes and p₁=−4c₂=0. Prove it is nontrivial: a change of
Spin lift by H¹(−;ℤ/2) twists the rank2 complex spin bundle by its flat
order2 line, whose c₁²=0 on this product; hence it cannot kill this c₂.
Consume StringOrientation S1's `spinLambda_adjoint_eq_neg_two_cTwo`
and `spinLambdaMap_isEightConnected` on G5.0's single stable BSpin carrier.
Its stable λ is−2c₂=0, so its stabilized Spin bundle is trivial on this
4-dimensional CW base; export the actual finite-rank stable trivialization.
Consume S1's stable Spin bundle classification on dimension≤7 CW bases
and `spinLambda_modTwo_eq_wFour`; specialize its actual comparison
to these dimension4 bases. The equation p₁=2λ alone loses the
2-torsion information. In the non-Spin branch retain the full stable
Postnikov lift/action data, including w₄ changes by reduction of the H⁴
lift action. This example proves both nontriviality before stabilization
and stable triviality, beyond characteristic-number computations.

### Examples

On CP² the characteristic generator h has h²=1, and its Pontryagin
square evaluates to 1 modulo 4. On S²×S², a²=b²=0 and a·b=1,
so P(a+b)=2 modulo 4, detecting the coefficient map 1↦2.
For S⁴ the half-spin values −u and u give p₁=0 and Euler class 2u.

### Dependencies

SpinGeometry G4 and CharacteristicClasses C2–C3 supply lifts and classes.
TangentialBordism B4 supplies the higher diagonals and Wu theory, and B3
supplies the algebraic Arf invariant and Spin fillings. The TOP arguments
use F3's local engine; StringOrientation S1 supplies the stable Spin
comparison on four-dimensional bases.

## Layer 5: Anti-self-dual gauge theory and the definite-form theorem

Consume [SmoothBundlesConnections B8](../SmoothBundlesConnections/README.md#b8-yangmills-energy-and-its-variational-calculus)
for Yang–Mills stationarity, its Hessian, the linear gauge-fixed operator
and four-dimensional conformal invariance, with the energy normalization below.
The nonlinear slices and ASD moduli constructions remain here.

Build principal SU(2) connections and gauge transformations on the existing
bundle carriers, Sobolev affine connection spaces and gauge groups for s≥3,
Coulomb slices, stabilizers, deformation complexes and the determinant
orientation. Consume SmoothBundlesConnections' bundle L²/Sobolev theory,
PseudodifferentialOperators' elliptic estimates and IndexTheory's Fredholm
index comparison; own the nonlinear gauge and moduli-space arguments here.
Use A_s=A₀+H^s(T*M⊗ad P) and H^(s+1) gauge sections of the actual
associated SU(2) group bundle. Prove the four-dimensional Sobolev product,
composition and inversion estimates needed for this action, in the shared
scale, and its smoothness as a map of Banach manifolds. Construct the
Coulomb slice by the Banach IFT on the stabilizer-orthogonal complement
of d_A* d_A; retain the actual inverse and its elliptic estimates.
Irreducible stabilizer μ2 acts trivially, so use the effective gauge quotient;
reducible S¹ stabilizers and their weight2 normal action are retained.
Orient determinant lines from a chosen orientation of
H⁰(M;ℝ)⊕H¹(M;ℝ)⊕H²_+(M;ℝ), with gluing and base-change comparisons.

With anti-Hermitian matrices use the pairing −tr(XY),
`k=⟨c₂(E),[M]⟩=(8π²)⁻¹∫tr(F_A∧F_A)` and energy
`E(A)=∫−tr(F_A∧*F_A)`. Prove
`E(A)=8π²k+2‖F_A⁺‖²`. ASD means F_A⁺=0.
Construct the charge-one BPST solution on the actual oriented S⁴ carrier,
with its two charts, connection/gauge transition, c₂ and energy comparisons.
Supply scale/center/framing parameters and their behavior at the ideal limit.

The connection, gauge quotient and BPST constructions have the following API.

- Gauge transformations act on the actual affine connection space and transport curvature and Coulomb slices.
- Stabilizers retain their representations on slice normals; the effective quotient is used only where the centre acts trivially.
- BPST scale, centre and framing changes preserve charge and the stated energy normalization.

**Checks.**

- A trivial flat SU(2) connection on S⁴ has stabilizer SU(2), of dimension 3, and energy 0.
- A regular irreducible has central stabilizer {±1}, dimension 0; an S¹ reducible instead has dimension 1 and weight-two normal action.
- A charge-one ASD bubble has energy 8π²; replacing it by a flat connection gives charge 0 and energy 0, not the same ideal bubble.

*Needs:* SmoothBundlesConnections B1–B4 and B8; ComplexKahlerGeometry
K5; PseudodifferentialOperators P5–P7; the S⁴ chart and clutching comparison.

### 5.1 All-base deformation and flat strata

 Retain the connection,
gauge, compactification and gluing programme on every closed connected
oriented smooth four-manifold and every SU(2) bundle; do not impose simple
connectivity on this general theory. For each smooth ASD connection A and
a fixed smooth metric g, construct its actual elliptic deformation complex
`Ω⁰(ad P) --d_A--> Ω¹(ad P) --d_A⁺--> Ω²_+(ad P)` and the finite-dimensional
harmonic spaces `H_A⁰=ker d_A`, `H_A¹=ker(d_A*⊕d_A⁺)` and
`H_A²=ker(d_A⁺)*`, with their native Sobolev/closed-operator and smooth-kernel
comparisons. Let `Γ_A` be the actual compact stabilizer of A in the gauge
group, with `Lie Γ_A=H_A⁰`. Construct its action on the complex, harmonic
spaces and Coulomb slice, retaining the centre and the effective quotient.
The index formula is `8k−3(1−b₁+b₂⁺)=dim H_A¹−dim H_A⁰−dim H_A²`;
it is not a manifold-dimension assertion at an obstructed point.

Construct the ASD Kuranishi reduction on these carriers
([Feehan–Leness, arXiv:1910.14580v1, §3.1, pp. 16–17](https://arxiv.org/abs/1910.14580v1)). In the Coulomb slice
write `a=x+v`, with `x∈H_A¹` and v in its L²-orthogonal complement.
The restricted derivative `d_A⁺` is a bounded isomorphism from that
complement in the H^s slice to `(H_A²)^⊥` in H^(s−1) self-dual forms.
Prove closed range, elliptic estimates and bounded inverse `G_A` before
using the Banach IFT. Let Π₂ be the actual harmonic projection to H_A²;
solve `(1−Π₂)(d_A⁺a+(a∧a)⁺)=0` uniquely for v=v(x) near0. Define
`κ_A(x)=Π₂(d_A⁺a(x)+(a(x)∧a(x))⁺)`. Prove κ_A(0)=0, Dκ_A(0)=0,
Γ_A-equivariance, and the actual local moduli comparison with
`κ_A⁻¹(0)/Γ_A`. The invariant orthogonal splittings and uniqueness of the
IFT solution supply equivariance; do not assume a free stabilizer action
or a desired zero-set equivalence. Give the regularity, change-of-Sobolev,
gauge/isometry, metric-variation and overlap/stabilization comparisons.
Across dimension jumps use compatible finite-dimensional reductions;
H_A² is not asserted to be a vector bundle over an arbitrary singular
union of strata.

The deformation, stabilizer and Kuranishi constructions have the following API.

- Harmonic projections and complement inverses agree across Sobolev scales
  on smooth sections; the reconstruction map retains the fixed bundle P.
- The zero set of κ modulo the actual compact stabilizer is the local ASD
  quotient, with κ(0)=0 and derivative zero; a nonzero H² is retained.
- Gauge transformations and metric changes give compatible local reductions;
  dimension jumps use enlarged finite reductions, not a constant-rank bundle.

**Checks.**

- For the trivial flat connection on S⁴, (dim H⁰,dim H¹,dim H²)=(3,0,0),
  and both sides of the index identity are −3.
- On product-oriented S²×S² the dimensions are (3,0,3), giving −6;
  full twisted H² has dimension 6, so replacing the ASD obstruction by
  full H² would give −9 and fails the index identity.
- For the specified irreducible Q₈ representation on Σ₂×Σ₂ below,
  H⁰ has dimension 0, H¹ has dimension 6, and H²_ASD dimension 12:
  6−0−12=−6=−3(1−8+9). The metric derivative at a flat is 0,
  so this example cannot become regular through metric transversality.

*Needs:* SmoothBundlesConnections B1–B4 and B8; ComplexKahlerGeometry K5's
Hodge and Sobolev comparisons; PseudodifferentialOperators P5–P7's closed
range and elliptic regularity; IndexTheory I4; the Coulomb slice above
(Feehan–Leness §3.1, pp. 16–17).

Retain every flat stratum in this construction, including irreducible
flats on bases with nontrivial fundamental group. For a flat A let `L_A`
be its actual unitary adjoint local system, with fibre `su(2)` and pairing
`−tr(XY)`. Compare the full twisted de Rham complex `(Ω*(ad P),d_A)`
with AT's cohomology of this local system, using the shared bundle-valued
forms, elliptic/Hodge estimates and local-coefficient carriers. Keep every
cohomology degree. The ASD complex is a different three-term complex:
construct the chain projection `(id,id,P_g⁺)` in degrees0,1,2, with zero
maps in the higher degrees, from the full complex to
`Ω⁰(ad P)→Ω¹(ad P)→Ω²_+(ad P)`. Flatness gives `d_A²=0` and makes this
a chain map. It is not a quasi-isomorphism of the full complexes.

Prove the closed-oriented metric Hodge comparisons for these actual
flat unitary coefficients. Identify H_A⁰ and H_A¹ with the corresponding
full twisted de Rham cohomology through their harmonic representatives.
For degree1 prove this using Stokes:
`∫⟨d_Aa∧d_Aa⟩=0` and hence `‖(d_Aa)⁺‖²=‖(d_Aa)⁻‖²`, so a Coulomb
ASD infinitesimal deformation is closed. Hodge star preserves the harmonic
twisted two-forms. Construct the full splitting
`H²(M;L_A)=H²_+(M;L_A)⊕H²_−(M;L_A)`, with the induced positive/negative
twisted intersection pairings, and identify `H_A²` with `H²_+(M;L_A)`.
The induced degree2 map is the self-dual harmonic projection, with kernel
`H²_−(M;L_A)`; do not identify H_A² with the full twisted H². These are
metric-dependent Hodge subspaces for the actual local system, not
untwisted Betti numbers multiplied by3 for nontrivial holonomy. Prove the
Sobolev/smooth-kernel, gauge/isometry and parameter/reduction comparisons.
Retain the regression of the trivial flat SU(2) connection on product-oriented
`S²×S²`: `dim H_A²=3` whereas `dim H²(M;L_A)=6`; H_A⁰ has dimension3 and
H_A¹ is zero, giving the ASD index−6 rather than−9.

Construct the flat Maurer–Cartan reduction on the same Coulomb slice
from `d_Aa+a∧a=0`, with obstruction map into the FULL harmonic twisted
H². Use the full de Rham Hodge homotopy/Green operator and a small-ball
contraction to solve the exact-component equation, then the covariant
Bianchi identity and the quantitative smallness estimate to prove that
vanishing of the harmonic obstruction also kills the remaining coexact
residual. Prove this actual zero-set parametrization and Γ_A-equivariance;
no full-curvature inverse onto all two-forms or desired local-model
identity is assumed. Compare it with the ASD Kuranishi reduction, whose
obstruction target is instead H²_+. On a common sufficiently small
neighborhood identify their H¹ harmonic coordinates using the proved
comparison. Send each zero to its actual connection, then to the other
slice reduction by its proved uniqueness. Since the bundle/closed-metric
charge-zero energy identity makes an ASD solution flat and a flat solution
is ASD, these maps are inverse on the zero sets and retain the stabilizer
action. Prove their regularity and overlap/stabilization laws. Their
quadratic obstruction terms compare by P_g⁺ on the cup/Lie-bracket class;
the full nonlinear obstruction maps and their ambient target spaces are
not silently equated away from their zero sets. In families with harmonic
dimension jumps use the earlier compatible finite-dimensional reductions.

Identify Γ_A with the holonomy centralizer. Construct the marked holonomy
and gauge-inverse comparison with the conjugacy classes of
`Hom(π₁(M),SU(2))` whose associated flat bundle is the fixed P, retaining
the full representation space and its associated-bundle class map when
all flat bundles are considered. Compare both local reductions with that
actual flat-moduli carrier; preserve all H⁰, full H¹/H², self-dual and
anti-self-dual data instead of using holonomy to erase obstructions.
A charge-zero ASD connection is flat by the energy identity and elliptic
regularity. Thus its Kuranishi zero set still describes flat solutions,
with actual H_A⁰,H_A¹,H_A² and possibly nonzero obstruction map. It is
not assigned metric-generic regularity. Retain as a regression the Q₈
representation on Σ₂×Σ₂ given by a₁=a₂=i,b₁=b₂=j on the first factor:
its flat connection is irreducible, k=0,b₁=8,b₂⁺=9 and virtual index−6,
so dim H_A²=dim H_A¹+6 for every metric. At F_A=0 the pure metric derivative
`(D_g P⁺)[h]F_A` vanishes. Negative charges have empty ASD moduli by the
same nonnegative-energy identity. These branches are part of the
all-charge programme, not excluded source cases.

The flat Maurer–Cartan and holonomy comparisons have the following API.

- Reconstruction identifies zeros with actual flat connections on P,
  retaining the holonomy centralizer rather than assuming freeness.
- Projection to self-dual harmonic forms compares the quadratic obstruction
  terms; the two reductions agree on reconstructed zero sets.
- Gauge changes and overlap maps preserve that comparison across finite
  reductions, including changes of harmonic dimension.

**Checks.**

- At the trivial representation on S⁴, the stabilizer has dimension 3;
  replacing it by the discrete centre would give dimension 0.
- At the trivial representation on S²×S², full H² has dimension 6 and
  the self-dual target has dimension 3; their ambient targets differ.
- For the Q₈ example, full H² has dimension 24, its two Hodge halves
  dimension 12 each, and H⁰=0. Holonomy does not erase this obstruction.

*Needs:* §5.1's Coulomb and Hodge splittings; AlgebraicTopology's
local-coefficient cohomology; SmoothBundlesConnections' parallel transport,
Bianchi identity and Yang–Mills energy identity.

### 5.2 Metric transversality on its positive-charge branch

 On a
closed connected oriented simply connected smooth four-manifold M, fix a
principal SU(2) bundle P with `k=⟨c₂(P),[M]⟩>0`. Work on the irreducible
Sobolev connection quotient by the effective gauge group and the Banach
manifold of C^ℓ positive metrics, with the chosen homology orientation.
Irreducibility excludes the continuous stabilizer; k>0 excludes flatness
by the energy identity. Construct the bundle of H^(s−1) g-self-dual forms
over this parameter space and the actual universal section
`𝔉([A],g)=P_g⁺F_A`. Near a fixed metric compare self-dual form bundles by
the restricted Hodge projections and prove their local inverse by the
small-operator-norm inverse theorem. Give the gauge/slice transition maps;
no fixed-metric target is silently used for all g.

Own split surjectivity of the universal ASD linearization before applying HF F0.
Its derivative in a Coulomb slice is
`L_(A,g)(a,h)=d_A⁺a+(D_gP⁺)[h]F_A`.
Prove this formula and elliptic regularity for every distributional
cokernel vector. To prove surjectivity, suppose a harmonic self-dual
ad P-valued two-form ψ annihilates both summands. Localize arbitrary
metric variations with compactly supported symmetric tensors. The
pointwise identification of trace-free metric variations with
`Hom(Λ⁻,Λ⁺)` implies that every Lie-algebra component of ψ is orthogonal
to every component of F_A. Prove that linear-algebra identification and
pairing formula in oriented orthonormal frames; conformal directions
contribute zero and are not used to span a cokernel.

Supply the SU(2) rank and unique-continuation argument here. On a region
where ψ has rank1, write ψ=ω⁺⊗σ with σ unit. From d_A*ψ=0 obtain
d_Aψ=0; projecting to σ^⊥ and using invertibility of wedge with the
nonzero self-dual two-form gives d_Aσ=0. Curvature then lies in the
centralizer line of σ, while the annihilator equation makes it orthogonal
to that line, so F_A=0 there. If F_A had rank at least2 where both forms
are nonzero, orthogonality would force this forbidden rank1 case for ψ.
Consequently F_A has rank1 on a nonempty common nonzero region; its
anti-self-dual Bianchi equation similarly constructs a parallel reducing
line. Nonflatness and unique continuation ensure that a nonzero ψ has
such a common region. Prove the needed gauge-covariant unique-continuation
and the local-stabilizer continuation theorem: extend this parallel reducing line
through overlapping Coulomb gauges, including the curvature-zero locus,
prove uniqueness and path-homotopy compatibility, and identify its
monodromy with π₁(M). Simple connectivity removes the monodromy and
orients the line, giving a global parallel adjoint section and a circle
stabilizer, contrary to irreducibility. This continuation lemma and its
regularity estimates are proof targets of F5, not an assumption supplied
by generic Sard–Smale. Thus ψ=0.

Use the closed finite-codimension range of d_A⁺ to choose finitely many
actual smooth metric variations spanning its cokernel. Combine their
bounded finite-dimensional lifting with the elliptic complement inverse
to construct a bounded right inverse to L_(A,g), hence its split kernel.
Consume HF F0's native parameter-projection kernel/cokernel/index algebra
on this actual surjective total linearization. Construct the regular
universal zero manifold, its countable quotient/slice atlas and its
Fredholm projection to metrics, with index `i=8k−3(1−b₁+b₂⁺)`.
Only then apply HF F0's sharp Banach-manifold Sard–Smale theorem.
For an integer index upper bound N choose finite q>max(N,0), s≥3 and
ℓ≥q+s+1, prove the section/projection has this actual C^q regularity,
and prove the preceding elliptic/continuation steps at that regularity.
The native quadratic kernel-bound theorem alone is not the sharp budget.
Construct the residual smooth-metric comparison by compatible finite
collections of smooth localized variations, density, openness and a
countable Baire argument in the smooth topology; do not merely intersect
a Banach residual set with smooth metrics. Export regularity of all
irreducible ASD solutions for those metrics, with H_A²=0. No arbitrary-base,
charge-zero or flat-stratum metric-regularity theorem is asserted here.

*Needs:* §5.1's slices and harmonic complements; the local stabilizer
continuation and bounded splitting constructed in G1; HeegaardFloer F0's
parameterized Sard–Smale theorem; the stated Sobolev regularity estimates.

### 5.3 All-charge compactification and obstruction gluing

 Prove
Uhlenbeck's small-L²-curvature Coulomb-gauge theorem on balls with its
precise boundary condition, estimates and scaling, then removable
singularities, compactness modulo gauge and bubble-energy quantization.
Pin the small-curvature theorem first on the unit Euclidean4-ball:
‖F_A‖_L²<ε yields a gauge with d* a=0, a(ν)=0 on the boundary and
‖a‖_W¹,²+‖a‖_L⁴≤C‖F_A‖_L², modulo constant SU(2) transformations.
Prove the critical-norm approximation/compactness step and higher-L^p
regularity, and transport to controlled metric charts with scale-invariant
L² curvature. Quantize each ASD bubble by its actual S³ clutching class
and compare that charge with the BPST c₂ normalization. Construct the
Uhlenbeck compactification for every charge on the general bases of G0,
including the actual flat and reducible lower-charge strata; do not
assume the compactification is a manifold.

Construct gluing from the actual G0 deformation complexes and stabilizer
representations. The local one-bubble obstruction and stabilizer model is
[Feehan–Leness, arXiv:1910.14580v1, Theorem 3 and Corollaries 5–7,
pp. 7–9](https://arxiv.org/abs/1910.14580v1), whose base is any closed
connected oriented smooth four-manifold. The iteration over bubble trees,
comparison of Sobolev scales and compatibility of reductions specified here
are additional proof targets; that local theorem alone does not assert them. On a fixed obstruction/isotropy stratum use the harmonic
cokernel spaces and cutoff-transport/neck modes to construct a finite
obstruction space and its orthogonal projection for the spliced operator.
Prove the projected operator's elliptic splitting and right inverse on
the specified complements, then solve its projected nonlinear equation
by quantitative contraction. Define the remaining finite-dimensional
obstruction map by projecting the actual ASD residual; its zero set,
modulo the retained stabilizers, is the gluing domain. Construct its
parameter maps, overlap/stabilization comparisons and determinant-line
orientation, including the flat H_A⁰,H_A¹,H_A² data. When dimensions jump,
retain compatible finite-dimensional reduction charts rather than a
fictitious constant-rank obstruction bundle. State the rescaled Sobolev
norms and compact parameter ranges and prove the uniform projected-inverse,
quadratic-error and contraction estimates there, with their scale/end
comparisons. A right inverse to the unprojected operator is used only
after its actual cokernel has been proved zero. The charge1 unobstructed
branch supplies the actual collar and reducible cones below; G1 does not
replace their separate reducible-regularity proof.

The compactification and projected gluing constructions have the following API.

- Ideal limits retain the base connection, bubble points and integer bubble charges, with total charge conserved.
- Projection removes the actual obstruction modes before taking an inverse; zeros of the remaining residual reconstruct genuine ASD connections.
- Gauge, overlap and scale comparisons preserve stabilizers and determinant orientations on compatible finite reductions.

**Checks.**

- With no bubbles, total charge is the base charge plus 0; the chart reduces to the base Kuranishi model.
- A single charge-one BPST bubble over the trivial flat base has total charge 0+1=1 and concentrated energy 8π².
- At the Q₈ flat base the obstruction dimension is 12, not 0; an unprojected right inverse would force cokernel zero and contradict the index calculation 6−12=−6.

*Needs:* §5.1's deformation reductions; the small-curvature and removable-singularity theorems above; projected elliptic estimates on necks; the local construction of Feehan–Leness, Theorem 3 and Corollaries 5–7, pp. 7–9.

For this charge1 negative-definite application, own the separate generic
metric reducible-regularity theorem. For each line class c with c²=−1,
construct the unique abelian ASD connection modulo gauge (H¹(M;ℝ)=0)
and the induced weight2 off-diagonal complex with coefficient L².
Prove a common residual set of smooth metrics has H²_A=0 at every
reducible, retaining the finite set of such classes. The diagonal obstruction
is H²_+(M;ℝ)=0. For the off-diagonal obstruction, build the parameterized
family d_a*⊕d_a^+ on L²-valued forms, its finite-dimensional kernel/cokernel
reductions and the finite metric-variation perturbations eliminating cokernels.
Own the unique-continuation and nonzero abelian-curvature pairing argument
used to obtain those variations, and the passage from C^ℓ perturbations
to the smooth residual set. This is separate from Sard–Smale at irreducible
ASD connections. Its complex normal index3 and vanishing H² give kernelℂ³;
the weight2 circle action yields the actual cone on CP². Compare its link
orientation with the determinant orientation and the collar orientation.

For a negative-definite simply connected closed smooth oriented four-manifold,
charge1 has dimension5. The charge0 flat stratum is the single trivial flat
connection. Prove the charge-one ideal stratum is a collar of M. Reducibles
are unordered pairs±c with Q(c,c)=−1; each has link CP² with the calculated
orientation. Truncate the collar and remove the reducible cones to obtain an
actual compact oriented5-dimensional bordism with boundary M and positively
oriented CP² links. Signature invariance gives as many pairs as b₂. Distinct
unit classes are orthogonal; unimodularity makes them a lattice basis. Derive
Q≅−I. Orientation reversal gives Q≅+I in the positive-definite case.

State the theorem with closed, oriented, smooth and simply connected hypotheses.
Build its E₈/2E₈ and non-diagonal odd definite consequences without converting
it into a classification of arbitrary indefinite smooth four-manifolds.

### Examples

For the trivial flat connection on S²×S² the dimensions are
(dim H⁰,dim H¹,dim H²_ASD)=(3,0,3), whereas full twisted H² has
dimension 6: both index computations give −6. For the irreducible Q₈
example on Σ₂×Σ₂, the full twisted H¹ has dimension 6, full H² has
dimension 24, and its self-dual half has dimension 12; thus the ASD
index is 6−0−12=−6. A regular negative-definite charge-one moduli
space has index 8−3=5, while each regular reducible link is CP².

### Dependencies

SmoothBundlesConnections B8 supplies Yang–Mills calculus;
PseudodifferentialOperators P5–P7 supplies estimates; IndexTheory I4/I7
supplies the index. G0's harmonic complements precede G1's universal
linearization and G2's projected gluing. F1's form generators enter only
the final definite-form application.

## Layer 6: Blowups, pencils and torus monodromy

Build the real blowup of ℝ² at0 as the incidence submanifold
{(x,L):x∈L} in ℝ²×RP¹ using AT's native real projective carrier; it is
its tautological real line bundle. Compare it by an actual diffeomorphism
with RP² minus a point, retaining the exceptional circle and its Möbius
normal line. The compact disk blowup is the Möbius band, with its boundary
identified with the original circle. These local models distinguish the real
blowup from the complex construction below.

The real incidence blowup has the following API.

- Projection to ℝ² is a diffeomorphism off the exceptional circle.
- The zero section has the tautological real normal line; restriction to
  a closed disk retains the original boundary circle.
- Linear coordinate changes induce compatible maps on the incidence model.

**Checks.**

- The fibre over 0 is RP¹, while the fibre over (1,0) is one point.
- One circuit of the exceptional RP¹ reverses the normal line, with
  transition −1; a product cylinder would have transition +1.
- The compact disk model has one boundary component, whereas an annulus
  has two; both have Euler characteristic 0, so χ alone cannot distinguish them.

*Needs:* AlgebraicTopology's real projective carrier; GeometricTopology
Layer 1's smooth gluing and tubular neighborhoods.

### 6.1 General blowup and discriminant comparisons

Extend the incidence/tautological-line model to the blowup of an arbitrary
complex surface at a point, gluing it to the unchanged complement.
Prove the exceptional normal 𝒪(−1), oriented connected-sum diffeomorphism,
H₂ generator, Chern, Euler and signature formulas. Use the same projective
smooth structure and tautological line as K7/T6.6. Consume Affine A6's
finite-degree Veronese embedding, local inverse, homogeneous equations
and O(1)-pullback comparison when applying A5 to hypersurfaces.

The general complex blowup has the following API.

- The blowdown is an isomorphism away from its exceptional divisor;
  the divisor has normal line 𝒪(−1).
- For a closed complex surface, the new integral generator is orthogonal
  to the old H₂ and has square −1; χ increases by 1 and σ decreases by 1.
- Disjoint point blowups commute up to the comparison preserving their
  labelled exceptional classes and the unchanged complement.

**Checks.**

- Blowing up CP² gives χ=3+1=4 and σ=1−1=0.
- The exceptional sphere has square −1; a trivial normal disk bundle
  would instead give square 0 and fails the local model.
- Nine blowups have form diag(1,−1,…,−1), χ=12 and σ=−8;
  the class 3H−ΣEᵢ has square 9−9=0.

*Needs:* TangentialBordism B1.7's incidence model; ComplexKahlerGeometry
K7's projective atlas and tautological line; §1.3's gluing and generator
comparisons; CharacteristicClasses C2–C3.

On the finite coefficient spaces used here own the projective
discriminant comparison, consuming GroebnerGeometry G1's single
elimination/saturation engine. Express a nonzero homogeneous common
zero by the projective chart ideals and saturation by the irrelevant
ideal; prove their elimination comparison with the closed projective
incidence projection on A0's complex-point carrier. Construct the
homogeneous derivative resultant for degree-d hypersurfaces, d≥2,
with its scalar law and vanishing exactly at a projective critical point.
Normalize nonvanishing against the Fermat polynomial. Give finite
parameter restriction and characterize the Jacobian-rank and ordinary-node
loci, including the locus of distinct critical values. These are the
coefficient/discriminant comparisons for the cubic and quartic families.

The discriminant comparison has the following API.

- Saturation removes the affine vertex before passing from homogeneous
  equations to projective incidence, and commutes with chart restriction.
- The derivative resultant vanishes precisely when the projective
  hypersurface has a critical point; rescaling an equation does not change
  this vanishing condition.
- Parameter restrictions retain the Jacobian-rank and node conditions;
  coincidence of distinct critical values is a separate incidence condition.

**Checks.**

- For x²+y² on CP¹, the derivatives 2x,2y have no common projective
  zero; the only affine common zero is (0,0), excluded by saturation.
- For x², the derivative pair (2x,0) vanishes at [0:1]; a nonzero
  equation can therefore lie on the discriminant.
- The zero equation has derivative identically zero but is not a point
  of projective coefficient space. A test that only checks coefficients
  up to arbitrary scalars, including zero, would identify it with x²+y².

The elimination-to-complex-incidence comparison and the marked boundary
charts are additional proof targets; they are not conclusions of a
numerical Euler-characteristic calculation.

*Needs:* GroebnerGeometry G1's elimination and saturation;
AffineMorseLefschetz A0's projective zero loci and coefficient families;
complex differentiation in the projective charts.

### 6.2 Local node and marked monodromy comparisons
For the standard oriented complex node uv=t, compare the coordinates
with z₁²+z₂² and extend the local model to its compact
Milnor tube with rounded corners, the two local discs of the central
fibre and the annular nearby fibre, retaining the boundary parametrizations.
Glue the exterior annular neck so the central fibre is an immersed S^2
with ONE POSITIVE double point and normal Euler number -2. Construct
the actual compact four-manifold with its proper map to the closed disc,
compare the coordinate switches and collars with the positive self-plumbing
of the cotangent DISK bundle of S^2, and prove that deleting the entire
nodal fibre gives a smooth T^2 bundle over the punctured disc. Keep
compact disc fibres/closed torus fibres distinct from noncompact local
affine fibres. Prove the Euler/self-intersection check -2+2=0. A negative
double point on a sphere with the same normal Euler number has square -4
and is not silently the same torus-fibre construction.

Compute monodromy directly from u v=t: trivialize the annular fibre off
a radial cut in the base with its boundary data fixed, follow one
positively oriented base circle and identify the endpoint gluing as the
positive Dehn twist in its vanishing curve. Extend by the identity on
the exterior neck. For an ordered oriented torus basis a dot b=+1 with
a the vanishing curve and column action, prove a maps to a and b maps
to b+a, hence the matrix [[1,1],[0,1]]. Specify base reversal, fibre
orientation, curve/basis and conjugacy comparisons; an unmarked bundle
only determines the corresponding conjugacy class. Construct actual
diffeomorphisms and fibration/relative-collar comparisons, not an answer
inferred from the word fishtail or from the normal Euler number alone.

This local construction uses the ordinary C^2 atlas, explicit plumbing
charts, smooth ODE/trivialization and surface/tube/Dehn-twist interfaces.
It precedes the global cubic/discriminant/existence calculation and
requires none of its projective pencils or E1 models. Prove the local
holomorphic Morse coordinate theorem when comparing a general complex
nondegenerate node with this model. The later §6.3 comparison on its
actual blow-up/elliptic atlas remains mandatory for that global consumer;
no global E1 or specified boundary framing follows from the local model.

The marked local-node comparison has the following API.

- Relative boundary parametrizations identify the smooth nearby annulus
  and extend its monodromy by identity across the exterior neck.
- Positive base orientation gives the positive Dehn twist; reversing
  that loop gives the inverse while a basis change conjugates its matrix.
- The normal Euler number and signed double-point count compare with
  the homological square of the closed nodal fibre.

**Checks.**

- A positive node has e=−2 and one positive double point, hence square
  −2+2=0; changing only the double-point sign gives −2−2=−4.
- The positive loop sends a to a and b to b+a, with matrix
  [[1,1],[0,1]]; reversing it gives [[1,−1],[0,1]].
- The affine fibre uv=1 is ℂ× and is noncompact; the Milnor fibre is
  an annulus and the completed regular elliptic fibre is a closed torus.
  These have respectively 0, 2 and 0 boundary components, but compactness
  separates the first and third.

*Needs:* TangentialBordism B1.7's node model; smooth plumbing and boundary
collars; the ordinary holomorphic Morse coordinate theorem for the
comparison with a general nondegenerate critical point.

### 6.3 Cubic parameter and monodromy comparisons

On the cubic coefficient space ℂ¹⁰ and its projectivization CP⁹,
compare homogeneous evaluation with the scalar quotient and identify a
pencil with a projective line of equations. These parameters describe
embedded equations, not curve isomorphism classes. Apply §6.1's
projective discriminant comparison to the pencil and §6.2's monodromy
comparison to its twelve nodal fibres, retaining the section and the
ordered fibre basis. The comparison with the local model is on the
specified blowup atlas, rather than an inference from the Euler number.

Own the torus mapping-class comparison with SL₂(ℤ), consuming GT's surface
and diffeomorphism carriers and proving the necessary disk/curve isotopy
comparisons. For the ordered symplectic basis a·b=+1, use column action
`A=[[1,1],[0,1]]`, `B=[[1,0],[-1,1]]` and
`S=[[0,-1],[1,0]]`, so B=SAS⁻¹ and (AB)⁶=I.
Construct the monodromy factorization of E1 and prove its Hurwitz/conjugation
comparisons. Compute SL₂(ℤ) abelianization as ℤ/12 with every positive
primitive Dehn twist of class1; every nonempty positive identity factorization
has length divisible by12. The lower bound applies to every such factorization,
not only alternating A/B words.

### Examples

A complex blowup adds a generator of square −1, changes χ by +1 and
σ by −1. The positive node has normal Euler number −2 and one double
point, so its homological square is −2+2=0. The stated torus matrices
satisfy (AB)³=−I and (AB)⁶=I, fixing the length-twelve factorization.

### Dependencies

ComplexKahlerGeometry K7 and AffineMorseLefschetz A0/A5/A6 supply the
projective carriers and hypersurface comparisons; GroebnerGeometry G1
supplies elimination and saturation. The local node requires only its
complex coordinate charts and plumbing, and precedes the cubic pencil.
F1 supplies the connected-sum and generator comparisons.

## Layer 7: Elliptic surfaces, K3 and boundary Spin data

### 7.1 Quartic index and filling comparisons

For the complex-oriented quartic with its canonical-line Spin lift, compare
the untwisted Dirac index to −σ/8=2 and its quaternionic index to −σ/16=1
(IndexTheory I7.5). These are comparisons on the fixed Spin manifold;
orientation reversal negates both indices. The KO genus normalization is
c(a)=2u² and the signature/16 bordism number is −1.

For the marked Lie Spin T³ boundary of the E(1) fibre complement, apply
F4's Rokhlin comparison to obtain ρ(T³)=−8 mod16=8. Distinguish the
induced stable framing from the Lie framing, which represents
η³=12ν in π₃ˢ≅ℤ/24 (Kirby–Melvin, §2(c), p. 99, footnote 3).

**Checks.**

- For K3, −(−16)/8=2 and −(−16)/16=1; equating the two indices
  would lose the quaternionic multiplicity.
- For its orientation reversal, the indices are −2 and −1.
- The complement has σ=−8 and hence boundary number 8 mod16;
  its Lie Spin restrictions are (1,1,1), whereas a meridian bounding
  a Spin disc would give (1,1,0).

*Needs:* TangentialBordism B1.7 and B3.4; IndexTheory I7.5; F4's
boundary Rokhlin comparison for the filling application only.

### 7.2 Elliptic surfaces and the quartic comparison

Form E(n), n≥1, by the specified fiber sums, with actual section and gluing
data. Prove π₁=0, χ=12n, σ=−8n, b₂=12n−2 and the Chern formula
c₁=(2−n)F. For even n the form is n(−E₈)⊕(2n−1)H; for odd n it is
I_(2n−1,10n−1). Prove Spin iff n is even, including the fiber's primitivity.
Prove the genus-one positive-factorization classification, with section
and Hurwitz/total-space diffeomorphism comparisons. Construct the actual
elliptic quartic on A0's carrier as follows. In CP³ fix the disjoint lines
L₀={z₂=z₃=0} and L₁={z₀=z₁=0}. The polynomial
`ellipticQuarticSeedPolynomial`,
F₀=z₀³z₂+z₂³z₁+z₁³z₃+z₃³z₀, vanishes on both.
Define `ellipticQuarticSeedMap` as its evaluation map ℂ⁴→ℂ and prove
`ellipticQuarticSeedMap_fderiv_surjective` for every nonzero v, including
points outside the zero locus. Its cyclic derivative
equations have no common nonzero zero, since the all-nonzero branch
would give3⁴=1, and any zero forces all coordinates zero.
The seed polynomial and evaluation map have the following API.

- Scalar multiplication rescales evaluation by the fourth power.
- Restriction to either specified coordinate line vanishes identically.
- The four partial derivatives have no common nonzero zero; their product
  in the all-nonzero branch would force 81=1.

**Checks.**

- At (a,b,0,0) and (0,0,c,d), evaluation is zero; neither line is omitted.
- At e₀ the derivative is dz₂ and at e₂ it is dz₁, each surjective;
  at 0 it is zero, so the nonzero hypothesis is essential.
- At (1,1,1,1) evaluation is 4 and the derivative is 4Σᵢdzᵢ;
  the derivative claim does not assume membership in the zero cone.

*Needs:* Mathlib polynomial evaluation and complex derivatives; F6's
node and discriminant comparisons; AffineMorseLefschetz A0; the
proper-submersion theorem of SmoothBundlesConnections for the family comparison.

In the coefficient subspace of quartics containing these two lines,
prove a nonempty open set gives smooth quartics and a basepoint-free Lefschetz fibration
of residual cubics in the planes through L₀: all critical points are
ordinary complex Morse points with distinct critical values. Prove this
by the finite incidence/jet-rank dimension calculation and F6's
discriminant comparisons, including the line charts. Prove
this nonempty open coefficient locus contains a polynomial over ℚ(i), by
density of ℚ(i) in ℂ and the monomial-coordinate identification of the
two-line coefficient subspace. Fix any such polynomial as the elliptic
quartic model, retaining its smoothness and Lefschetz hypotheses.
The residual system |H−L₀| is basepoint free, its regular fiber is a
smooth plane cubic, and L₁ is a section since (H−L₀)·L₁=1.
Prove there are24 positive nodal fibers using the quartic Euler number
and the smooth torus fibers. Construct the actual vanishing-cycle
factorization, compare it with (AB)¹² by the genus-one classification,
and obtain the oriented diffeomorphism with E2, retaining the section
and chosen fiber. Own connectedness of the smooth quartic parameter locus: construct the
projective coefficient space and its algebraic discriminant, prove its
complement is path connected by complex lines and finite bad parameters,
and smooth each compact parameter path inside that open set. Restrict A0's
joint incidence family to a lift of such a path in A0's coefficient vector
space P_d outside the discriminant cone, prove properness by projective
compactness and submersion by the fiberwise Jacobian. Consume
SmoothBundlesConnections' proper-submersion Ehresmann theorem to connect
every smooth quartic to the elliptic model through this same family.
This proves the oriented diffeomorphism E2≅K3; it does not assert every quartic
is elliptic as a complex surface. Retain the fiber, section and form comparisons.

The elliptic fibre-sum and quartic-family comparisons have the following API.

- Fibre sums retain the section, fibre orientation and normal-circle gluing; their characteristic numbers are additive with the stated torus correction.
- Hurwitz moves and simultaneous conjugacy compare marked monodromy factorizations and the resulting total spaces.
- Proper smooth paths in the regular quartic incidence family transport the smooth manifolds and complex orientations, without asserting that every complex quartic is elliptic.

**Checks.**

- E(1) has (χ,σ,b₂)=(12,−8,10), c₁=F and is not Spin.
- E(2) has (24,−16,22), c₁=0 and form 2(−E₈)⊕3H, agreeing with the K3 characteristic numbers.
- E(3) has (36,−24,34) and odd form I_(5,29); extending the even-n form formula to it would incorrectly assert Spin.

*Needs:* TangentialBordism B1.7's marked E(1) and K3; F6's monodromy,
discriminant and blowup comparisons; AffineMorseLefschetz A0/A5/A6;
SmoothBundlesConnections' proper-submersion theorem; IntegralLattices' form classification.

### 7.3 The Enriques cover

Define the Enriques K3 cover on A0's same native projective zero-locus carrier
by the three quadrics `enriquesQuadric`, indexed by j, Σ_(i:Fin6)t_i^j z_i²=0 for j=0,1,2 and
t_i=i+1. The specialization `enriquesZeroSet` is the subset of
`Projectivization ℂ (Fin 6 → ℂ)` consisting of lines on which all three
quadrics vanish on every vector; it requires no atlas. Define
`enriquesInvolutionLinear` by negating precisely the first three coordinates,
and `enriquesProjectiveInvolution` by its native projectivization. Prove
`enriquesQuadricJacobian_surjective` for every nonzero v satisfying the
three equations, and `enriquesProjectiveInvolution_no_fixed_point` for
every projective point in `enriquesZeroSet`. For the latter, a fixed line
lies in one of the two sign eigenspaces; each eigenspace has three
coordinates whose coefficient matrix is invertible Vandermonde, forcing
all three coordinate squares to vanish. Prove regularity, freeness and
simple connectivity, the canonical residue-form action−1 and the quotient
manifold atlas. Compute its Enriques quotient's H₁=ℤ/2, torsion canonical
class, nonzero w₂ and even free form H⊕(−E₈). This gives the required torsion
counterexample to an unqualified even-form-implies-Spin statement.

The quadrics, zero set and sign action have the following API.

- Each quadric has degree two; evaluating at λv multiplies its value by λ².
  Membership of a nonzero representative in the common zero cone therefore
  agrees with membership of its line in `enriquesZeroSet`.
- The linear and projective sign changes square to the identity. Each
  quadric is preserved, so the projective map restricts to the zero set.
- The common cone Jacobian is surjective away from its vertex on the zero
  locus; the restricted projective action has no fixed point.

**Checks.**

- The line [e₀] is fixed by the projective sign change, but its quadric
  values are (1,1,1), so it is outside the zero set. Squaring the action
  alone cannot establish freeness.
- For v=(i,√3,i√3,1,0,0), the coordinate squares are (−1,3,−3,1,0,0)
  and the quadric values are (0,0,0). The first and fourth coordinates
  are nonzero and have opposite action signs, so no scalar identifies
  v with its image. Columns 0,1,2 of the Jacobian have determinant −48,
  giving rank three.
- At the zero vector the quadrics and Jacobian are all zero, but this
  vector represents no projective point. At e₀ the Jacobian has rank one,
  so the equations cannot be dropped from its surjectivity theorem.
- On the two possible fixed projective planes the coefficient matrices
  for t=(1,2,3) and t=(4,5,6) both have determinant 2; their only common
  zero vector of coordinate squares is zero.

*Needs:* Mathlib `Projectivization.submodule`, `Projectivization.map`,
polynomial evaluation and derivatives for the algebraic statements;
AffineMorseLefschetz A0 and A5–A6 for the atlas and simple connectivity;
F4 for the torsion/Spin comparison.

### Examples

The Fermat quartic has χ=24 and σ=−16. Its complex index is 2 and its
quaternionic index is 1. The E(1) complement has signature −8; its boundary
Spin structure and stable framing remain different data. The Enriques
quotient has even free form H⊕(−E₈) and nonzero w₂.

### Dependencies

TangentialBordism B1.7 supplies the marked elliptic fibre and K3;
F6 supplies the general blowup, discriminant and monodromy comparisons. The projective
geometry uses AffineMorseLefschetz A0/A5/A6 and ComplexKahlerGeometry K7;
IndexTheory I7.5 supplies the analytic index. F4 identifies the torsion
obstruction; the elementary polynomial and freeness results do not use it.



## Layer 8: Presentation realization, nonrecognition and exotic four-space

### 8.1 Presentation realization and nonrecognition

Every finitely presented group is the fundamental group of a closed connected
oriented smooth n-manifold for every n≥4. Use a finite presentation complex,
a general-position embedding into ℝⁿ⁺¹ and a compact smooth regular
neighborhood; identify the boundary fundamental group through the dual handles
and retain the marking by the presented group. This is a mathematical existence
and comparison theorem.

Prove that there exists a fixed positive integer k for which no algorithm on
finite triangulations of closed connected four-manifolds decides homeomorphism
to #k(S²×S²). Consequently the general homeomorphism problem and the
simple-connectivity problem on these triangulations are undecidable. Use the
Novikov–Boone and Adian–Rabin undecidability theorems for finite presentations
and the regular-neighborhood reduction: in the trivial-group branch the
boundary is simply connected, has rank H₂=2k, signature zero, even form and
KS zero. F3's classification identifies that branch with #k(S²×S²); a
nontrivial fundamental group excludes it in the other branch
([Tancer, arXiv:2310.07421v2, Theorems 1–2 and Proposition 5](https://arxiv.org/abs/2310.07421v2);
[Rabin](https://doi.org/10.2307/1969933)). The finite-presentation
undecidability theorems and the reduction are mathematical proof targets here;
no executable simulation, triangulation routine or recognition program is a
deliverable. No sphere-recognition assertion is made.

### 8.2 Form isometries and topological classification

For positive definite symmetric integer matrices Q and Q′ of the same rank,
prove that each column vᵢ of an integral isometry satisfies
‖vᵢ‖²≤Q′ᵢᵢ tr(Q⁻¹), using the positive real scalar extension and
vᵢᵀQvᵢ=Q′ᵢᵢ. The inverse exists by positive definiteness; in rank zero
use the unique empty matrix. Thus the set of integral isometries is finite
([Bastl et al., arXiv:2411.08775v2, §6, proof of Lemma 6.5, pp. 12–13](https://arxiv.org/abs/2411.08775v2));
the trace bound follows from λ_min(Q)⁻¹≤tr(Q⁻¹).
Negating both negative definite forms gives the corresponding result.
For indefinite unimodular forms consume IntegralLattices' rank, signature
and parity classification, retaining the actual isometries.

On an oriented integer-framed link with unimodular linking matrix Q, cap its
F1 handlebody by F3's contractible topological cap. For a characteristic
vector x with entries zero or one, Qx=diag(Q) mod2, let C be its
characteristic sublink. Prove C is proper and
KS=(σ(Q)−xᵀQx)/8+Arf(C) mod2. Use the Seifert quadratic refinement and
its radical quotient and compare with F4's membrane formula. Classify the
resulting oriented manifolds by form isometry and equal KS; forgetting
orientation allows either Q′ or −Q′
([Bastl et al., arXiv:2411.08775v2, Theorem 5.3 and Proposition 5.6, pp. 9–10, and §7](https://arxiv.org/abs/2411.08775v2)).

**Checks.**

- For Q=Q′=[1], the column bound is v²≤1, and the isometry equation v²=1
  has exactly the two solutions v=±1; the zero column satisfies the bound
  but is not an isometry.
- In rank zero the unique empty matrix has determinant one and gives the
  unique isometry; no division by a zero-dimensional eigenvalue is used.
- For the +1-framed unknot, x=1, σ=1, xᵀQx=1 and Arf(C)=0, so KS=0;
  the signature term alone would not give the required integral quotient.

### 8.3 Exotic four-space

Prove `exoticFourSpace_exists`: there is a type M with a topology and
an atlas modelled on Euclidean four-space, smooth for the real identity
model, homeomorphic to Euclidean four-space and admitting no smooth
diffeomorphism to it. A homeomorphism supplies Hausdorffness, second
countability, nonemptiness and the underlying four-dimensional topology;
the atlas is part of the existential data. The model has no boundary.

**Checks.**

- Standard ℝ⁴ with its standard atlas has its identity diffeomorphism,
  so the non-diffeomorphism condition fails even though the homeomorphism exists.
- An empty type cannot be homeomorphic to ℝ⁴: the latter contains 0.
- On the K3 comparison below, removing 3H leaves the even negative
  definite form 2(−E₈), of rank 16 and signature −16; −I₁₆ has odd
  vectors of square −1 and therefore is not that form.

*Needs:* F3's Casson-handle and marked cap comparisons; F5's definite-form
obstruction; §7.2's marked K3 model (Gompf, Theorem 1.2, pp. 319–320).

Construct the exotic four-space obtained from K3 by the following specified
surgery comparison. Let X=#3(S²×S²) minus an open coordinate ball.
Use F3's Casson/re-embedding controls to construct collared TOP embeddings
i:X→K3 and j:X→#3(S²×S²), with i realizing its3H summand,
j realizing all H₂, and an actual diffeomorphism between neighborhoods
of the images that intertwines i and j. Own the needed
the hyperbolic-neighborhood re-embedding theorem theorem on these fixed models.
Choose the integral3H basis in F7's K3 form, represent its six classes
by smooth generic immersed spheres using F2 Hurewicz and §3.2's
immersion moves, and pin their framed self-intersection0 and hyperbolic
pairing. Convert the extra intersections to the paired Whitney disks
and finite kinky-handle stages, recording each attaching circle,
signed double point, framing and product collar. Construct the compatible
Casson-handle replacements and their TOP core spheres from the chosen
stage data, realizing X and its marked six generators. Prove the
re-embedding/engulfing lemma that realizes the same smooth neighborhood
data inside Y=#3(S²×S²), with finite-stage diffeomorphisms commuting on
the nested neighborhoods and a smooth common-limit neighborhood map.
The proof route is the six Casson handles realizing the chosen hyperbolic
basis in Gompf, §1, Theorem1.2 and its discussion on pp.319–320, using
Casson's relative re-embedding theorem. §3.2 supplies the generic relative
tower re-embedding controls; this section owns the six marked-handle
matching, compatible finite-stage diffeomorphisms and smooth common-limit
neighborhood comparison on these two fixed models.
Construct an ambient TOP homeomorphism of Y carrying j(X) to its
standard punctured model, using the framed core/collar comparisons;
this also pins the end and the compact core of its complement.
Prove the complement
R=#3(S²×S²)\j(X) is homeomorphic to ℝ⁴, with its inherited smooth atlas.
Choose its compact core so every sufficiently far sphere separates that
core from the j(X) end. A diffeomorphism R≃ℝ⁴ would give a smooth S³
in the common collar; transport it to the K3 collar and cap to obtain a
smooth simply connected definite manifold of form2(−E₈), contradicting F5.
Give the actual cap, form and end comparisons. This is
[Gompf, §1, Theorem1.2](https://projecteuclid.org/journals/journal-of-differential-geometry/volume-18/issue-2/Three-exotic-mathbfR4s-and-other-anomalies/10.4310/jdg/1214437666.pdf).
No conclusion about smooth S⁴
recognition or the smooth four-dimensional Poincaré conjecture is requested.

### Examples

The +1-framed unknot has Q=[1] and KS=0, while its negative has
Q=[−1] and KS=0. The form-isometry bound allows exactly ±1 as
isometries of [1]. In the exotic-space contradiction, removing 3H
from the K3 form 2(−E₈)⊕3H leaves the definite rank-16 form
2(−E₈), whose signature is −16 and whose evenness excludes −I₁₆.

### Dependencies

F1 supplies handle forms; F3 supplies TOP classification, caps and
Casson-handle controls; F4 supplies the characteristic-link KS comparison;
F5 supplies Donaldson's obstruction; F7 supplies the marked K3 form.
The nonrecognition statement additionally uses the finite-presentation
undecidability proof described in §8.1.

## Downstream consumers

SeibergWittenTheory SW1 consumes F4's Spinᶜ frame lifts and determinant
line. The topological slicing application of GeometricTopology Layer 6
uses the disk and cyclic-surgery constructions. Elliptic and exotic
four-manifold comparisons retain their actual orientations and marked
intersection forms for subsequent geometric applications.

## References

Proof references include Gompf–Stipsicz, *4-Manifolds and Kirby Calculus*,
Freedman, *The topology of four-dimensional manifolds* (JDG17,1982),
Donaldson, *An application of gauge theory to four-dimensional topology*
(JDG18,1983), Freedman–Quinn,
[*Topology of 4-Manifolds*, 2013 author reformat](https://archive.mpim-bonn.mpg.de/4789/2/FreedmanQuinn-TopologyOf4Manifolds-Reformatted2013.pdf),
§§5.1/5.7,7.4,8.14,9 and10 for the ordered disk/control/local TOP and
stable-smoothing proof engine, and the cited GT,
AT, lattice, gauge-analysis and characteristic-class references.
Krushkal–Quinn, *Subexponential groups in 4-manifold topology*,
Geometry & Topology 4 (2000), 407–430, unnumbered theorem on p. 408
and §§2–4, supplies the growth-based grope-contraction route; the version
is arXiv:math/0001063v3.

Additional local references are Feehan–Leness, *Gluing in geometric analysis
via maps of Banach manifolds with corners and applications to gauge theory*,
arXiv:1910.14580v1, §3.1 and Theorem 3/Corollaries 5–7; and Kirby–Melvin,
*Canonical framings for 3-manifolds*, §2(c), p. 99, footnote 3. The cited
preprint versions determine the theorem numbering used above.
