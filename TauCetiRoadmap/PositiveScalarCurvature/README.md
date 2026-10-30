# Positive scalar curvature, surgery and bordism

Develop positive-scalar-curvature metrics, their geometric construction and
spin-index obstructions, and the surgery/bordism proof of the closed simply
connected classification in dimensions at least five. Include metric families,
relative constructions, the actual normal-structure hypotheses and exotic
sphere examples. Scalar curvature, Ricci positivity and sectional positivity
are distinct conditions.

## Carriers and suppliers

Use Mathlib's `Bundle.ContMDiffRiemannianMetric I ∞ E (TangentSpace I)`
for smooth metrics on a finite-dimensional smooth manifold. Install its actual
`RiemannianBundle` and smoothness instances for each metric when applying
Tau Ceti's Levi–Civita connection and `CovariantDerivative.scalarCurvature`.
The metric space has the smooth section topology defined in P1; it is not a
set of unrelated typeclass instances. Use the Riemannian distance associated
to the metric when completeness or distance appears. For each g use a
metric-carrying type synonym of M with `TauCeti.MetricSpace.ofRiemannianMetric`
on a connected component and the corresponding extended-distance structure
otherwise, transported charts and the identity diffeomorphism. Compare
connections and scalar curvature through that identity. Metric families
remain sections on the fixed underlying manifold.

[RiemannianGeometry R1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7d5cabbd745d7e1b7e51cc8540b0b6d2e4abef65/TauCetiRoadmap/RiemannianGeometry/README.md) supplies metric scaling/products, conformal and
submersion formulas, R4.7 the normalized round models, R1's projective block
the normalized projective metrics, and R5a Gauss/second fundamental forms.
[SmoothBundlesConnections B1/B5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1c45ab4061b483b832b5d54f597dc69afd3f97a5/TauCetiRoadmap/SmoothBundlesConnections/README.md) supplies smooth principal bundles and connections;
P2 constructs their associated manifold-fibre bundles, including boundary collars.
[ComplexKahlerGeometry K5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md) supplies the Fréchet topology of smooth sections
of finite-rank real bundles; P1 constructs the symmetric-bilinear metric bundle
and its C² section topology before applying that generic smooth-section theory.
[SpinGeometry G4–G6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/312e1bbec838a044c0cd479374d1a62e7a2c1e2e/TauCetiRoadmap/SpinGeometry/README.md) supplies Spin bundles, Clifford-linear Dirac operators,
Lichnerowicz and kernel vanishing. In particular G5.0 constructs
`realCliffordSpinorBundle`, and G6.0 constructs
`realSpinDiracClosedRealization` on the real H¹/L² carriers and
`realSpinDiracIndexClass` in degree KO_n, with its Clifford-sign,
bounded-transform and finite-kernel comparisons. [TangentialBordism B3.0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4a5e27d2dd1b94abcca3e9b2151e9adf460a8a2f/TauCetiRoadmap/TangentialBordism/README.md) owns
`spinABSDiracIndexComparison` and `spinABSComplexificationGenus`, consuming
the real Clifford-linear Spin operator and [GeneralizedCohomology G5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1565ccc1af9dce1ca554ea6bb133a07c461177ef/TauCetiRoadmap/GeneralizedCohomology/README.md)'s
graded Fredholm/ABS construction. [TopologicalKTheory T7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f2c908debdefa440e7dfda339a54cb3b74cdc51c/TauCetiRoadmap/TopologicalKTheory/README.md) owns the real KO
coefficient ring and Clifford-module quotient. Use this real index,
including its mod-two branches; the complex index does not detect them.
TangentialBordism B1–B3 supplies structured geometric bordisms and B6 supplies
the integral point orientation-kernel transfer theorems, including
PSp3-equivariant HP² bundles. [GeometricTopology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/87f0ec5b86d9f2c8668d39f9dde23707c76ffac9/TauCetiRoadmap/GeometricTopology/README.md) supplies tubular neighbourhoods,
framed surgery, high-dimensional Whitney cancellation and relative handles;
this roadmap owns the curvature estimates and metric extension over surgery.

A closed manifold is compact and without boundary. In the classification,
M is nonempty, connected, simply connected and has dimension n≥5; hence it
is orientable. Fix a Spin structure when defining α. Homotopy-sphere recognition
and stable J calculations consume [HomotopySpheres](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34167306e5a1726e2574b039dc1a27f913985f0f/TauCetiRoadmap/HomotopySpheres/README.md)
at commit34167306e5a1726e2574b039dc1a27f913985f0f; the Stage references
below refer to that fixed contract. Their curvature
obstructions are applications here. StringOrientation owns the separate
positive-Ricci Witten/TMF questions, consuming this scalar-curvature theory
only where its hypotheses actually apply.

## P1. Smooth metrics, positivity and families

Construct Sym²(T*M) as the symmetric subbundle of the supplied real
bilinear bundle: use the (b+bᵗ)/2 projection, local frames and constant-rank
gluing. Identify native smooth metrics with its positive-definite smooth
sections and prove the comparison in both directions.
Equip the native smooth-metric carrier with the subspace topology from K5a's
smooth symmetric-bilinear sections. Prove its chart/auxiliary-connection
comparisons and identify the metric cone; consume the generic completeness
and atlas-independence theorems. On closed M compare its C² and C∞ topologies
with the finite-atlas seminorms, explicitly defining the C² topology by
uniform coordinate derivatives of orders 0,1,2 and proving atlas independence.
Define R⁺(M) by
`∀ x, 0 < scalarCurvature(g)(x)`. Prove smoothness of scalar curvature,
its continuity as a second-order metric differential expression, the C²
openness of positivity on compact M and the corresponding C∞ openness.
Establish uniform positive lower bounds for compact parameter families,
including metrics fixed on a neighbourhood of a specified closed subset.

Build pullback by diffeomorphisms, scaling, products, disjoint unions and
restriction, with scalar-curvature and metric-family laws. For c>0,
Scal(cg)=c⁻¹Scal(g). A product has scalar curvature the sum of the two
factors; scale a positive compact factor to dominate a bounded negative
contribution. Prove round S^n(r) has scalar curvature n(n−1)/r² for n≥2,
and give the normalized CP and HP examples on the supplied carriers:
with R1's projective metrics of holomorphic/quaternionic sectional
curvature4, prove Scal(CP^d)=4d(d+1) and Scal(HP^d)=16d(d+2).
Use the real quaternionic trace normalization in the HP formula.
Follow the round-sphere API design of Mathlib
[#43657](https://github.com/leanprover-community/mathlib4/pull/43657)
and consume the actual round-model comparisons from Riemannian R4.7.

Use the standard half-space `ModelWithCorners` for compact bordisms with
boundary; smooth tensors extend locally across boundary charts. Construct
collars and metric restriction/gluing on these models.
Define isotopies as continuous paths in R⁺(M) and concordances as PSC
metrics on M×ℝ equal to g₀+dt² for t≤0 and g₁+dt² for t≥1.
Prove equivalence between concordances on M×ℝ with the specified product tails and PSC metrics on M×[0,1] with product collars. Restriction to [0,1] alone need not produce interior product collars. Given a concordance, first restrict it to [-1,2] and pull it back along a fixed smooth increasing diffeomorphism ψ:[0,1]→[-1,2] that equals t↦t−1 near 0 and t↦t+1 near 1. The pullback is exactly g₀+dt² and g₁+dt² near the endpoints, and remains PSC by diffeomorphism invariance. In the other direction, extend a product-collared metric by the exact product tails. Prove these conversions preserve the endpoint data and witness the same concordance relation. Prove reversal/concatenation and collar-smoothing laws, and that an isotopy
produces a concordance: first smooth the compact parameter path by
finite local combinations of metrics, relative to the endpoints and
within its uniform C²-positive margin; then slow its smooth parameter
with quantitative curvature bounds. Carry the endpoint metric and collar data explicitly.

## P2. Positive fibres and bundle metrics

For compact F construct its full isometry group on the Riemannian-distance
carrier, compare metric isometries with [HopfRinow](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/HopfRinow/README.md)'s smooth Riemannian-isometry
carrier, and prove Myers–Steenrod: it is a compact finite-dimensional
Lie group acting smoothly. Build the compact-open/frame-evaluation
comparison and the Lie/action proof using Riemannian R2/R4 and
[LieGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/85f49c01009d5df11d3a6e8935fe7b14ed21c1cd/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md)' closed-subgroup machinery. First prove metric isometries smooth
using SBC B6.0's convex normal balls and squared distances to finitely many
nearby centers as smooth local
coordinates. First prove the connected-fibre lemma: evaluation at one
orthonormal frame determines an isometry on a connected component and
controls its derivatives through the exponential formula. A compact manifold
has finitely many components. For possibly disconnected F, choose one frame
in each component and retain both the induced finite permutation of components
and the image frame for every chosen frame; prove this data determines each
isometry and controls its derivatives. Use Arzelà–Ascoli for compactness. Prove the no-small-subgroups property: for a compact subgroup
contained in a sufficiently small identity neighbourhood, average its small
orbits to their unique centers in convex normal balls; the resulting
fixed-point map is uniformly C¹-close to identity and a diffeomorphism,
so the subgroup is trivial. Build all uniform Hessian/implicit-function
bounds in that argument. Consume [CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/77f1b53db854fc799c21cd5f2480095f467e50bb/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md)' Peter–Weyl separation to
find finitely many representations whose common kernel lies in that
neighbourhood; no-small-subgroups makes their sum faithful. Its closed
unitary-group image gives the native Lie structure by the supplied
closed-subgroup theorem; frame evaluation/exponential formulas prove the
action smooth. This supplies the source's full
isometry structure group; the bundle construction also applies to a
specified Lie group with a smooth isometric action.

Construct P×_G F for a smooth principal G-bundle and smooth G-action on F:
glue the local U×F charts with their actual action transition maps, prove
the cocycle/Hausdorff/smooth-submersion laws, and identify the quotient
topology and pullbacks. Use base half-space charts and product collars when
the base has boundary. For compact G construct smoothing of continuous
principal bundles over compact smooth bases relative to already smooth
boundary collars: embed G faithfully in an orthogonal group, use finite
Stiefel universal-bundle approximations with connectivity above the base
dimension, smooth the classifying map relative to collars, and identify
the pullback with the original continuous bundle. Construct a smooth
connection by local connection forms and a smooth partition of unity.
For a bundle F→E→B with compact smooth base, compact fibre F carrying
PSC metric g_F, and smooth structure group acting by g_F-isometries,
construct a horizontal distribution from the principal connection and
the connection metric g_ε=π*g_B+ε²g_F. Prove fibres are totally geodesic
and derive the scalar formula
`Scal(g_ε)=Scal(g_B)+ε⁻²Scal(g_F)−ε²|A|²`, with the norm/contraction
of the O'Neill tensor specified here: with a g_B-orthonormal horizontal
frame X_i, use `|A|²=Σ_(i,j) g_F(A_(X_i)X_j,A_(X_i)X_j)` for the
unscaled vertical metric, and prove independence of that frame. Prove uniform estimates and choose a
positive ε making the total scalar curvature positive. Establish smooth
base change and compact-family versions, with product boundary collars
when the base has boundary. Compactness supplies the lower fibre bound
and upper error bound; positivity of the base metric is not assumed.

Apply this construction to the actual associated RP², CP² and HP² bundles
used in TB's transfer theorems, retaining each orientation/Spin structure.
Construct the compact Lie semidirect product PU(3)⋊C₂, with C₂ acting
by complex conjugation, and prove its smooth action on CP² preserves
R1's Fubini–Study metric. HP² uses PSp3 and
TB's descended vertical Spin lift. These are metrics on the transfer's
actual total spaces, not replacement manifolds in the same rational class.

## P3. Metric surgery and relative extension

In a framed tubular neighbourhood of S^k⊂M^n, set q=n−k≥3.
Construct the Gromov–Lawson bending curve and torpedo metric, with
smooth endpoints and all required derivative bounds. Use R1's normal
metric estimates and R5a's Gauss equation to prove scalar positivity
through the bending region. Own the uniform tubular estimates: among the
principal curvatures of a small distance tube, q−1 have leading term
−1/r and the remaining k stay bounded. Prove the rescaled C² comparison
with the normal-connection sphere-bundle metric, including base/vertical
derivative bounds. In the point case pin the bending scalar term as
`(n−1)(n−2)sin²θ/r²−2(n−1)k_γ sinθ/r`, plus the bounded
ambient-curvature and normal-coordinate error terms, with k_γ the chosen
signed curve curvature. Derive the corresponding codimension-q tube
estimate from the actual principal curvatures, controlling its r⁻¹
errors before choosing the bending curve. Supply the first small-angle
bend, straight shrinking interval and final bend with smooth inequalities
throughout; a schematic picture does not choose these constants.
Replace S^k×D^q by D^(k+1)×S^(q−1),
matching the unchanged metric on the exterior collar, and prove the
resulting smooth closed manifold has a PSC metric. Construct the collar
interpolation with a uniform positive margin, not a partition-of-unity
average of PSC metrics.

Construct relative PSC concordances between the results for any two
admissible sufficiently small radii and bending functions: interpolate
the radius/bending data with a uniform curvature bound and positive
scalar gap, and stretch the cylinder parameter so its mixed curvature
terms preserve that gap. Fix the metric outside the surgery neighbourhood
and on its boundary collars. Prove independence by these concordances for choices
of sufficiently small radii and bending functions, naturality under
isometries preserving the framed data, simultaneous disjoint surgeries
and compact parameter-family constructions with supplied framings.
A surgery is the boundary of a handle of index λ=k+1 in dimension n+1;
its belt sphere has dimension n−λ=q−1. Thus q≥3 is exactly belt-sphere
 dimension≥2. Include creation/removal of round components and connected
sums in dimension n≥3, with their actual neck metrics and collars.

## P4. Bordism surgery and normal structures

For a structured bordism W^(n+1) between N and M, n≥5, construct interior
surgeries making the outgoing inclusion M→W two-connected under the
following two normal-structure hypotheses. In the Spin case both M and W
are Spin and M is simply connected. First discard closed components of W
that do not meet either boundary, and join the remaining components by
interior 0-surgeries with their compatible oriented/Spin framings, so W
is connected without changing its boundary. In the oriented nonspin case M is
simply connected and w₂(M)≠0; retain the nonzero w₂ class of the normal
1-type instead of killing it. Use finite generators and embedded circles
to kill π₁(W); prove oriented normal bundles over those circles are
trivial, and choose framings preserving the specified Spin structure.

For π₂ use general position to obtain embedded spheres and identify the
normal framing obstruction with w₂. In the Spin case it vanishes. In
the nonspin case kill the kernel of w₂ and use a sphere from the outgoing
M detecting w₂ to make the outgoing π₂ map surjective. Prove all
normal-structure and relative-boundary comparisons. The bordism dimension
is n+1, so circle surgery uses S¹×D^n; carry the dimensional arithmetic.

Apply GT Layer 1's `framedInteriorSphereSurgery`,
`smoothWhitneyMove`, `smoothHandleCancellation` and
`smoothHandleIndices_le_dim_sub_three` to obtain handles from N of
indices at most (n+1)−3=n−2. Prove the required
connectivity, Whitney and framing hypotheses before using that theorem.
When N has several components, first attach compatible1-handles joining
them and replace it by their connected sum, using P3's connected-sum
PSC metrics and the associated oriented/Spin bordisms. Compose this
bordism with W and verify the now-connected incoming and outgoing
boundaries before applying the connected-boundary handle theorem.
Apply P3 along these handles to transfer PSC from N to M. Treat an empty
incoming boundary by adjoining a round sphere and its nullbordism.
Conclude the Spin and oriented nonspin bordism-invariance statements in
this simply connected range, with n≥5, simple connectivity and the
stated Spin/nonspin normal type as explicit hypotheses.

Define geometric PSC bordism over a CW space X with maps to X and product
collar metrics, its cycles, inverse/disjoint union and equivalence laws.
Construct the forgetful map to TB's structured bordism and its actual
subgroup of classes admitting a PSC representative. Give change-of-space,
product and relative-boundary laws. A theorem for arbitrary fundamental
groups is not inferred from the simply connected argument.

## P5. Spin obstruction and the simply connected classification

Consume the real graded Clifford-linear Dirac index and ABS comparison,
prove that P1's uniform scalar gap implies α(M)=0, and identify it with
the map MSpin→ko→KO on TB's Pontryagin–Thom class. Pin KO_n as ℤ for
n≡0,4 mod8, ℤ/2 for n≡1,2 mod8 and0 otherwise. For n≡0 mod8,
α equals Â. In dimension 8k+4 write α(M)=r·a·b^k and prove
Â(M)=2r through `c(a)=2u²`, `c(b)=u⁴` and B3.0's genus comparison;
the complex chiral index is twice this integer coefficient. Pin the real
Clifford sign/Morita adapters to G5 and verify α(K3)=a.
Preserve the Spin structure in additivity, products and bordism laws.

For α(M)=0 use TB B6's integral point kernel theorem to represent its
Spin bordism class by sums of actual HP² transfer total spaces.
Equip them with P2 metrics, including orientation reversals and disjoint
unions, and apply P4. For the nonspin branch use TB's integral oriented
point-kernel/CP² transfer theorem to give a PSC representative of every
positive-dimensional oriented class, then apply its nonspin normal-type
bordism argument. Prove, on the stated closed simply connected n≥5
carriers, that PSC exists iff M is nonspin or it is Spin with α(M)=0.
Neither zero rational Â nor a mod-two coefficient calculation replaces
this integral statement.

## P6. Examples, metric dependence and exotic spheres

Construct PSC metrics on connected sums, supplied projective bundles and
simply connected closed manifolds of dimensions5,6,7 using the preceding
classification and the actual zero KO groups. For a homotopy sphere Σ^n,
n≥5, compare its unique Spin structure and α with the stable unit/J/ABS
maps. Construct the Hitchin spheres in dimensions 8j+1 and8j+2, j≥1,
by the following explicit chain.

1. Consume PR284 Stage3C.3's unstable Toda brackets with their actual
   adjacent-nullhomotopy data, composition-subgroup indeterminacy,
   suspension laws; consume [BFG F4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/269912e4950a075eeb50885cdc68638b0d08dc2f/TauCetiRoadmap/BordismFormalGroups/README.md)'s stable
   comparison. Own the following coherent Moore-space construction.
   Write M_n=cofib(2ι_n:Sⁿ→Sⁿ), with bottom inclusion i_n:Sⁿ→M_n
   and collapse j_n:M_n→S^(n+1). Construct these on G2's mapping-cone
   carrier with the prescribed sphere/degree conventions; prove their
   suspension comparisons and specified attaching nullhomotopies.
   Prove the reusable extension/coextension lemma, n≥2 and r≥3: for
   a:S^(r−1)→Sⁿ with chosen nullhomotopies of 2ι_n∘a and
   a∘2ι_(r−1), a chosen zero representative of
   {2ι_n,a,2ι_(r−1)} supplies a coextension
   a_tilde:Sʳ→M_n built from the same first nullhomotopy A₀
   occurring in that zero representative, with j_n∘a_tilde≃Ea
   in the fixed cone orientation, and a chosen nullhomotopy
   of a_tilde∘2ι_r. Extend it to A:M_r→M_n with
   A∘i_r≃a_tilde. Construct the maps and tracks by gluing the
   mapping cones; prove their naturality and change-of-nullhomotopy
   comparisons, retaining the full composition-subgroup indeterminacy.
   No unstable degree-two postcomposition is identified with additive
   doubling except under the stated suspension hypothesis.

   Construct Toda's σ'''∈π₁₂(S⁵) of order2 and
   σ''∈π₁₃(S⁶) of order4, prove Eσ'''=2σ'' for Toda's specified low-dimensional classes,
   and prove σ''' stabilizes to the order-two class in π₇ˢ. Construct
   Toda's σ′∈π₁₄(S⁷) and σ₈∈π₁₅(S⁸) with H(σ₈)=ι₁₅.
   Pin the 2-primary normalization using Lemmas5.13–5.14 and
   Proposition5.15: let σ₂ be the 2-primary component of the stable
   image of this σ₈. Prove σ₂ has order16 and
   `E∞σ′=2σ₂`, `E∞σ′′=4σ₂`, `E∞σ′′′=8σ₂`.
   Use `Eσ′′=2σ′`, `Eσ′′′=2σ′′` and the 2-primary relation
   `2Eσ₈=E²σ′`, whose two sides lie in π₁₆(S⁹).
   Build the primary-component comparisons on native
   `AddCommGroup.primaryComponent` and transport the final order-two
   identity to the integral stable stem by its subgroup inclusion.
   The displayed Hopf relation is a 2-primary computation, not an
   identity with the unprojected integral stable Hopf class. Give the
   finite EHP calculation and framing normalization. Set a₁=Eσ'''. Since it
   is a suspension, 2ι₆∘a₁=2a₁=0; precomposition by2 is
   also zero. Prove Toda's particular identity
   Eσ'''∘η₁₃∈{2ι₆,Eσ''',2ι₁₃}⊆π₁₄(S⁶).
   Prove this from Toda Corollary3.7, constructing the Moore-space
   relation 2·1_M=iηj and its bracket comparison. Own the finite integral
   calculation π₁₄(S⁶)≃ℤ/8{ν̄₆}⊕ℤ/2{ε₆}⊕ℤ/3, with an explicit
   odd-primary generator and all generator/order comparisons. Fix
   suspension-compatible order-eight 2-primary classes ν₁₁^(2) and
   ν₁₃^(2), distinct from an unprojected integral quaternionic Hopf class.
   In the 2-primary EHP calculation prove H(ν̄₆)=ν₁₁^(2), H(ε₆)=0 and
   [ι₆,ι₆]∘ν₁₁^(2)=Δ(ν₁₃^(2))=±2ν̄₆ in the fixed normalization.
   Here H:π₁₄(S⁶)→π₁₄(S¹¹) is the sphere EHP Hopf map; it is not
   precomposition by a quaternionic Hopf map. Retain the actual integral
   bracket indeterminacy 2ι₆∘π₁₄(S⁶)+2π₁₄(S⁶). On its 2-primary part
   prove the Hilton–Hopf formula
   (2ι₆)∘x=2x+[ι₆,ι₆]∘H(x); the preceding computations put its image
   in the additive doubles. Degree-two postcomposition is a group
   homomorphism and preserves odd-primary torsion, where multiplication
   by2 is an automorphism. Use both parts to identify the full integral
   indeterminacy with2π₁₄(S⁶), retaining its entire order-three summand.
   The displayed element is zero because
   Eσ'''=2σ'' and precomposition by the suspension η₁₃ is additive.
   Choose this zero representative and its coherent tracks.
   The preceding lemma gives A:M₁₄→M₆, hence A:Σ⁸M₆→M₆
   after the specified suspension comparison. Prove its stabilization
   is a Moore-spectrum Adams map, inducing the unit mod2 on the
   correctly graded reduced complex K group under Bott periodicity.

   Extend η₅:S⁶→S⁵ over M₆ to bar_eta₅:M₆→S⁵, using
   η₅∘2ι₆=0. For every j≥1 form
   A^(j)=A∘Σ⁸A∘…∘Σ^(8(j−1))A:Σ^(8j)M₆→M₆ and define
   μ_(8j+1,5)=bar_eta₅∘A^(j)∘i_(8j+6):S^(8j+6)→S⁵.
   Here i_(8j+6) is transported to Σ^(8j)i₆ by the fixed
   Moore/suspension comparison. This map extends across M_(8j+6),
   so its precomposition by the degree-two domain map is null and
   its homotopy class has order dividing2. Prove all diagram and
   suspension comparisons before naming its stable class μ_(8j+1).
   Choices remain explicit; no canonical choice-independent class or
   arbitrary-member unstable Toda recursion is asserted.
2. Construct the Adams complex e-invariant from the K-theory of the
   mapping cone, its integral/rational lattice and suspension grading.
   Prove its extension/Moore-map detection formula and the real
   d-invariant comparison in degrees8j+1. Compare the preceding
   stabilized cone diagrams with Adams's Moore construction. With
   his bracket order and sign, the formula is
   e_C{h,qι,f}=−q e_C(Ef)e_C(h) moduloℤ. Pin its typing as
   f:S^(2a−2)→S^(2b−1), h:S^(2b−1)→S^(2c), a>b>c>0,
   with qι on the intervening S^(2b−1), and the adjacent-null
   hypotheses; the real analogue requires a,b,c even. Prove its
   well-definedness on the actual indeterminacy.
   The sign follows the Toda-to-Massey comparison. Compute
   e_C(a₁)=1/2, the Moore-map unit, e_C(η)=1/2 and the iterated
   μ value1/2. Thus μ_(8j+1,5) has exact order2. Identify the
   KO unit with TB B3.0's framed-forgetful-Spin/ABS/Dirac comparison
   and derive α(μ_(8j+1))=η b^j and
   α(ημ_(8j+1))=η²b^j, the nonzero KO generators. The η product
   consumes PR284's Hopf class and T7's coefficient laws. This stable
   detection and the fixed S⁵ representatives are separate from any
   statement about all unstable degree-two composition images.
3. Consume PR284 Stages6–8's almost-framed exact sequence, framed
   kernel surgery and obstruction calculation. Apply the zero odd
   obstruction P_(8j+1)=0 to the image of the μ class under Stage8.2's
   injection coker J→almost-framed bordism to obtain a homotopy sphere
   Σ_(8j+1) with this α. For the even class use the product of this
   sphere with the Lie-framed Spin circle. Its middle homology in
   degree4j+1 is zero; prove its framed surgery-normalized Arf
   obstruction is zero and apply the same surgery/realization theorem
   to obtain Σ_(8j+2). Compare stable framings modulo im J and
   prove J has zero Spin/KO image in these dimensions: its framed
   standard sphere has the unique bounding Spin structure. Track the
   actual Spin bordisms so that α remains the detected generator.
   In both dimensions use the full Stage8.2 exact sequence; its
   Stage8.3 isomorphism criterion π_(n−1)(SO)=0 does not hold here.
4. Prove the supplied simply connected high-dimensional h-cobordism
   recognition makes these spheres homeomorphic to the standard sphere,
   with dimension8j+1 or8j+2≥9. Name the local Alexander-trick
   extension on the complementary marked ball in this recognition and
   prove its compatibility with the boundary homeomorphism.
   Apply P5's obstruction to show they
   admit no PSC metric. This compares actual topological and smooth
   manifolds and their metrics.

Give the direct rational-bordism examples: HP^k, k>1, have zero Â by
Lichnerowicz. Pin u=−c₂(γ_H viewed as a complex rank-two bundle),
the standard quaternionic Euler normalization, and prove
p(T HP^k)=(1+u)^(2k+2)/(1+4u), truncated at
degree4k; their top Newton number is `2k+2−4^k`. Compare with
TB's generators and retain the integral theorem separately. Construct
the Dold quotient `(S^a×CP^b)/C2` with antipodal/conjugation action and
its descended product metric. Its scalar curvature is the sum of the
factor scalars and is positive when a≥2 or b≥1; mixed sectional planes
have curvature zero. In particular P(1,2) has an oriented PSC metric
but is not oriented-nullbordant: compute its mod-two cohomology,
w₂=d, w₃=cd and ⟨w₂w₃,[P(1,2)]⟩=⟨cd²,[P(1,2)]⟩=1,
using TB/[CharacteristicClasses](https://github.com/TauCetiProject/TauCetiRoadmap/blob/76a0952b2687a743d384a9ba88769e71d3c9f55e/TauCetiRoadmap/CharacteristicClasses/README.md)' Dold conventions. Keep Ω₅^SO≃ℤ/2
distinct from Ω₅^Spin=0. Construct the reflection mapping-torus examples
and the product-to-circle regular fibres used in the oriented torsion
calculation as the actual isometric bundles, applying P2 over flat tori.
Supply the metric comparisons for TB's Wall representatives; a general
product quotient is not asserted to have positive sectional curvature.

Compare Spin structures on circles/tori and their α values through G5's
Bott/Clifford comparison and TopologicalKTheory T7's coefficient table,
using SpinGeometry's explicit Fourier models. On T² with one
antiperiodic Spin direction prove α=0, while [IndexTheory I7.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/592b12da97670f7eaea4fbed01def6b55554af66/TauCetiRoadmap/IndexTheory/README.md)'s
Gauss–Bonnet identity and χ(T²)=0 exclude PSC. This is an explicit
index-zero counterexample outside P5's simply connected range.
For a compact parameter space P and a continuous C∞ family of PSC
metrics g_p on closed M, prove there is δ>0 with Scal(g_p)(x)≥δ
for all p,x by scalar-curvature continuity and compactness. Identify
the Spinor bundles and L² spaces by the positive metric square-root
and density transformations, and prove the Dirac realizations vary
continuously H¹→L². Using Spin G6/PDO's uniform elliptic estimates,
prove norm continuity of the bounded transforms D_p(1+D_p²)^(-1/2)
on that fixed Hilbert/Clifford-module carrier. Prove uniformly
`D_p²≥δ/4` by Lichnerowicz, and hence
`F(D_p)²≥(δ/4)/(1+δ/4)` by the functional calculus. This uniform
invertibility supplies the null index-family and the metric-path/relative
PSC-bordism comparisons below. Prove the pullback/forgetting
comparison with geometric PSC bordism. Use P1–P3's actual metric paths and
collars to prove isotopy implies concordance. The reverse implication is
not a target of this metric-path comparison.

## Order and references

P1 uses the metric/curvature suppliers. P2 and P3 follow P1. P4 consumes
P3 and GT's independent surgery/handle machinery; P5 consumes P2/P4,
Spin/Index/G5 and TB's independent point-transfer computation. TB's
homogeneous HP² index-zero construction uses its supplied invariant
metric and SpinGeometry's Lichnerowicz theorem, not P5's classification.
P6 uses these results and the stated stable-homotopy examples.

- Gromov–Lawson, [*The classification of simply connected manifolds of positive scalar curvature*](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/827.pdf), for metric surgery and the Spin/nonspin bordism reduction.
- Stolz, [*Simply connected manifolds of positive scalar curvature*](https://doi.org/10.2307/2946598), for the integral classification and its transfer proof, owned in TB.
- Hitchin, *Harmonic spinors*, Advances in Mathematics14 (1974),1–55, for the real index and exotic-sphere examples.
- Crowley–Schick, [*The Gromoll filtration, KO-characteristic classes and metrics of positive scalar curvature*](https://doi.org/10.2140/gt.2013.17.1773), §2.3, for fixed-S⁵ μ representatives, KO detection and the exotic-sphere application. P6's coherent Moore-space extension construction supplies the specified proof route; the generic Toda and sphere-surgery contracts are the supplied owners cited above.
- J. F. Adams, [*On the groups J(X)—IV*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Adams-JX4.pdf),
  Theorems5.3(v),11.1,12.13 and Lemma12.5, for the stable
  Toda/Massey sign, Moore-map construction and complex e detection;
  §7 and the proof of Theorem7.2 give the real d_R comparison
  and detection in degrees1,2 modulo8.
- Toda, *Composition Methods in Homotopy Groups of Spheres*, Lemmas5.13–5.14,
  Proposition5.15 (pp48–50), Corollary3.7 and the finite EHP/π₁₄(S⁶) tables, for P6's named
  unstable base classes and Moore-space bracket identity.
- Kachi–Mukai–Nozaki–Sumita–Tamaki, [*Some cohomotopy groups of suspended projective planes*](https://www.math.okayama-u.ac.jp/mjou/mjou43/_Kachi.pdf), Proposition4.4, for the integral π₁₄(S⁶) decomposition and the distinction between its 2-primary projection and the full quaternionic-Hopf formula. P6 owns the sphere-EHP and Hilton–Hopf comparisons used in the indeterminacy calculation.
- Stolz, [*Positive scalar curvature—constructions and obstructions*](https://arxiv.org/abs/2202.05904), for the normal-type distinctions and proof references.
- Lawson–Michelsohn, *Spin Geometry*, for the real Clifford/Dirac conventions and analytic comparison.
