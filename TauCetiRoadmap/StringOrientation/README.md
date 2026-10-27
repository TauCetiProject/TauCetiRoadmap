# String structures, connections and the Witten genus

Build String structures on stable Spin bundles, their differential refinements,
String bordism and the Witten genus. The development includes obstruction and
classification APIs, geometric representatives, changes of String structure,
integral characteristic-series calculations and the Cayley-plane-bundle kernel
theorem away from 6. Keep a String lift as data, rather than equating a lift with
the vanishing of a characteristic class.

## Conventions and dependencies

HomotopySpheres references name that roadmap's stages and subsections
(Stage 4B, Stage 4C, Stage 9).

The default structure is stable. Consume CharacteristicClasses' finite
compact-Lie classifying spaces, SpinGeometry G4.1's native Spin covers,
and TopologicalKTheory's stable BO/BSO bundle comparison. G5.0 supplies
the designated Spin stabilization and block-sum maps.
GeneralizedCohomology G5.0 owns the compatible BSpin(n) sequence, its
homotopy-colimit classifier BSpin and map to BSO, with stable Spin-bundle
classification and universal underlying real bundle comparisons. S1
consumes that early classifier independently of Thom and ABS coefficients.
AlgebraicTopology Stage 8 supplies the normalized integral Eilenberg–Mac Lane
family, cohomology representability and its mapping-space comparisons.
GeneralizedCohomology supplies the convenient-space, spectrum, Thom-spectrum,
orientation and stable-operation APIs. Build on these actual carriers.

The integral class λ is the unique universal class on stable BSpin satisfying
`2λ=p₁`; H⁴(BSpin;ℤ) is torsion-free, so this equation leaves no sign choice.
On the underlying real quaternionic Hopf line, `λ=-c₂(γ_H)=u=-h`.
For G5.0's quaternionic clutching generator g, normalized on G4's positive
projective chart, prove `⟨λ,hur(g)⟩=-1`. The u-oriented S⁴ used in
TangentialBordism has the opposite fundamental class; the class λ is the same.
For a particular space with 2-torsion, do not define λ by choosing any solution
of `2x=p₁`; pull back the universal class along the specified Spin classifier.
Finite-rank String data is the pullback of this stable definition. In ranks
below 5 do not identify this pullback with a 3-connected cover of Spin(n).

TangentialBordism owns geometric cycles, bordism operations and the generic
Pontryagin–Thom comparison. Its early generic targets precede the String
specialization here; its Cayley-plane example consumes S1 independently of
the later genus and coefficient targets. LieHighestWeight Layer 8 owns the
compact division-octonion and formally real Albert algebra. TangentialBordism
B3 owns the fixed compact rank-one-idempotent OP² carrier, its smooth charts,
F₄/Spin(9) comparison, cells and characteristic numbers. This roadmap uses
that carrier, rather than constructing another octonionic projectivization.

DifferentialGeometry owns forms, smooth-chain integration and Stokes;
CharacteristicClasses owns characteristic classes and Chern–Weil;
SmoothBundlesConnections owns bundles, connections, good covers and their
descent comparisons. S3 owns integral differential cohomology, its character/Deligne comparisons,
the fractional Spin refinement and String trivialization data. IndexTheory I7 supplies the full twisted Atiyah–Singer theorem, and TopologicalKTheory supplies
virtual bundles and symmetric/exterior operations. ModularForms supplies
level-one modular forms, q-expansions and their transformation laws.

EllipticCohomology owns the spectra tmf, Tmf and periodic TMF, their coefficient
computations and the Ando–Hopkins–Rezk orientation. They are distinct from the
integer q-series genus developed here. An equality of bordism ideals does not
identify tmf with a ring-spectrum quotient by a sequence of those classes.

## S1. The universal obstruction and the String classifier

1. Consume G5.0’s stable Spin classifier with its finite-rank maps,
   rank-zero virtual-bundle diagram and classification API. Construct the normalized
   pointed map `λ:BSpin→K(ℤ,4)` representing the specified universal class.
   Define `stableSpinPontryaginOne` and `stableSpinWFour` on this same
   telescope as the unique classes restricting to CC's p₁(γ_n) and w₄(γ_n)
   on each finite BSpin(n+3) stage. Use G3's telescope Milnor sequence;
   H³ of these finite stages vanishes over ℤ and F₂ by their
   3-connectivity, so the relevant lim¹ terms vanish. Prove restriction,
   naturality and stabilization before writing 2λ=p₁ and ρ₂λ=w₄.
   Compute H⁴(BSpin;ℤ)=ℤ and the pullback of p₁ as twice its generator.
   Use the stable quaternionic clutching generator, the stable Spin
   homotopy groups and Hurewicz to prove its pairing is −1 on G5.0's
   specified generator. Export
   finite-rank restriction, stabilization, Whitney-sum and inverse-bundle
   formulas. Prove the rank-4 Hopf normalization directly on the same
   quaternionic line used by GeneralizedCohomology. Include torsion bases,
   where the equation `2λ=p₁` alone does not determine the pullback.
   Prove `spinLambda_modTwo_eq_wFour`: reduction mod 2 of λ equals w₄
   of the underlying real bundle, first universally and then by pullback.
   For a rank-3 adjoint bundle of a specified SU(2) lift V, prove
   `spinLambda_adjoint_eq_neg_two_cTwo`, namely λ(ad V)=−2c₂(V),
   by the torus weights 0,±2x and universal characteristic comparisons.
2. Define BString by GeneralizedCohomology G2's generic mapping-path
   carrier/topology/projection, flattening, Hurewicz lifting and
   compactly generated comparison exports, applied to λ and the normalized basepoint
   of K(ℤ,4). Its topology is inherited from the
   product of BSpin with the compact-open path-function space; do not use
   the topological disjoint sum of endpoint-dependent path fibres.
   Construct its projection, basepoint and path data, the homotopy-fibre
   sequence and its normalized long exact sequence using DGFloer Layer1
   item2. Prove BString is 7-connected and that its composite projection
   to TopK's BO through BSpin and BSO induces isomorphisms on π_i for
   i≥8. This is the connected-cover theorem on these named carriers. Export
   `spinLambdaMap_isEightConnected`, with the native normalized homotopy
   groups: λ induces isomorphisms below degree 8 and a surjection in
   degree 8. Its homotopy fibre has vanishing π_i through degree 7.
   Give the CW model/comparison and homotopy invariance needed for classifiers,
   including the compactly generated replacement and its CW mapping comparison.
   For every finite rank n, define BString(n) as the actual pullback
   BSpin(n)×_(BSpin)BString along G5.0's specified finite-rank map; its
   pulled-back rank-n bundle γ_n^String is the actual finite-rank universal
   real bundle. Export `stringClassifyingSpaceFiniteRank`, its projection,
   bundle pullback isomorphism, stabilization maps/homotopies, and comparison
   with the homotopy fibre of λ restricted to BSpin(n). Include G5.0's
   separate geometric rank-zero branch. The map BString(n)→BString(n+1)
   covers the designated BSpin stabilization strictly on its first
   coordinate, using G5.0's specified stabilization homotopy to transport
   the path datum. Its pulled-back bundle stabilization is the actual
   left-trivial-block isomorphism required by G5.3. Prove the stable telescope comparison
   with BString. The stable virtual class is [γ_n^String]−[ε^n]; there is
   no finite-rank universal bundle on stable BString.
   For n≥5 construct a compactly generated topological group model String(n)
   and a continuous homomorphism to Spin(n), whose homotopy fibre is K(ℤ,2),
   with BString(n) as its classifying space. Own the reduced Kan replacement,
   simplicial loop-group/classifying-space adjunction and realization/product
   comparisons used to strictify the loop-space model and its map to the
   singular simplicial group of Spin(n). Construct the comparison
   `|W̄(Sing Spin(n))|≃BSpin(n)` with G5.0's chosen classifying carrier,
   preserving the universal bundle and basepoint. Lift the classifying
   map to this simplicial bar model and apply the loop-group adjunction
   to obtain the simplicial-group homomorphism before realization. Prove independence up to weak
   equivalence over Spin(n), and the comparison with ΩBString(n). The map
   String(n)→Spin(n) induces isomorphisms in homotopy degrees≥4 and its
   source is 3-connected. Prove it is not homotopy equivalent to a
   finite-dimensional Lie group: such a connected group retracts onto a
   maximal compact subgroup; vanishing π₃ forces that subgroup to be a
   torus. Its vanishing π₁ then makes that torus trivial, so such a
   Lie-group model would be contractible. The K(ℤ,2) homotopy-fibre
   sequence would force Spin(n)≃K(ℤ,3). Use its long exact
   sequence, AT8.7's pointed finite CW-type model of compact Spin(n),
   AT8.3's Hurewicz isomorphism and AT6.1's universal-coefficient
   sequence (H₂=0) to obtain the normalized H³ generator. Apply
   AT8.10 representability on that CW model and transport the resulting
   map Spin(n)→K(ℤ,3); use naturality of Hurewicz to prove it
   induces the degree-three isomorphism. AT8.5's Whitehead theorem for
   spaces of CW type then makes it a homotopy equivalence.
   This contradicts the top rational cohomology of the compact connected
   orientable group Spin(n), in dimension n(n−1)/2≥10, versus
   GeneralizedCohomology G5.6's rational exterior algebra
   H^*(K(ℤ,3);ℚ) on one degree3 generator. Construct Spin(n)'s left-invariant orientation and use
   AT6's fundamental-class duality. Consume G5.0's compact Spin
   carriers and finite-rank classifying comparisons. Own the
   maximal-compact deformation-retraction theorem for connected
   finite-dimensional real Lie groups and the compact-group π₃ criterion
   used here. The claim concerns finite-dimensional Lie groups.
3. For a fixed stable Spin bundle ξ with specified classifier c:X→BSpin,
   a String structure is a lift to BString together with the specified
   projection identification. Use strict lifts on the mapping-path carrier
   and prove their equivalence with lifts commuting up to specified
   projection homotopy by G2.10's Hurewicz lifting. Prove equivalence with a nullhomotopy of
   λ∘c, using the mapping-path carrier and the exponential law. For every
   CW complex X, prove existence iff c*λ=0. For fixed c, lift classes with
   homotopies over c form, when c*λ=0, a nonempty torsor under H³(X;ℤ),
   with a simply transitive
   action and difference class. Identify ΩK(ℤ,4) with K(ℤ,3) by
   AT8.11b's ordinaryEMLoopComparison, with loop coordinate last and the
   increasing unit interval. Act on a nullhomotopy H:λc→0 by appending
   the representative loop of α on the right. The difference from H₀
   to H₁ is represented by reverse(H₀) followed by H₁. The normalized
   boundary ΩK(ℤ,4)→BString uses these same endpoint/loop conventions.
   Prove naturality and the cocycle/difference laws.
   Export `spinLambdaClassifiesSevenDimensionalCW`: for CW X of
   dimension≤7, λ_*:[X,BSpin]≃H⁴(X;ℤ). Prove it by cellular lifting
   and uniqueness for the 7-connected fibre, using AT's cellular/EM
   infrastructure; include the relative and dim≤4 instances used by
   FourManifolds. No generic connected-cover carrier is silently assumed.
   For a stable Spin bundle on arbitrary CW X prove λ=0 iff its
   restriction to the 4-skeleton is stably trivial, equivalently its
   restriction to the 7-skeleton. Every stable Spin bundle is trivial on
   the 3-skeleton; that condition does not characterize a String lift.
   Use the dim≤7 classifier and injectivity of H⁴(X)→H⁴(X⁴).
4. Build pullback, isomorphism and diffeomorphism transport along specified
   data and specified classifier homotopies. For a homotopy c₀→c₁,
   transport a nullhomotopy by precomposing the reverse of its λ image;
   prove functoriality up to the prescribed homotopies, not independence
   from the chosen transport path. A gauge loop of the classifier acts
   by the negative of the λ class of its mapping torus, slanted against
   the positively oriented circle. On the trivial bundle this is the
   negative of Ωλ_*:[X,Spin]→H³(X;ℤ). Prove the S³ test: for the
   rank4 quaternionic clutching loop corresponding to G5.0's positive
   π₄ generator (not the rank3 adjoint inclusion), Ωλ has class −1, so this transport shifts the String torsor by +1.
   Build stabilization, direct sum, trivial bundles and restriction
   to CW subcomplexes and relative lifts on CW pairs. For manifolds, extend
   to open subsets through their specified CW-homotopy comparisons. Prove the compatibility laws and
   identify relative obstructions and differences in H⁴(X,A;ℤ) and
   H³(X,A;ℤ). For direct sum, use addition on AT's realized simplicial
   abelian K(ℤ,4), transported by G's product comparison, and a specified
   pointed homotopy λ∘⊕≃λ∘pr₁+λ∘pr₂. Prove its existence from the
   Whitney formula and uniqueness of its homotopy class from
   H³(BSpin×BSpin;ℤ)=0. Combine the two nullhomotopies with this homotopy
   to construct the sum and its laws on lift classes. S2 owns the higher
   coherent refinement. Keep track of the chosen Spin structure throughout.
   Construct the inverse String lift over the stable inverse Spin bundle:
   pin λ(−ξ)=−λ(ξ) by the sum/inverse homotopy and negate its
   nullhomotopy on K(ℤ,4). Prove inverse, cancellation and stabilization
   laws on lifts, with specified trivializations of ξ⊕(−ξ). On H³ lift
   torsors inverse sends α to −α, and direct sum adds difference classes.
   For a stable tangent/normal trivialization TM⊕ν≃ε^N, construct the
   inverse normal String structure from a tangential one and vice versa,
   retaining Spin data, orientation and boundary trivializations.
   Prove relative/bordism and embedding-change comparisons.
5. Export the obstruction, difference and finite-rank interfaces consumed by
   TangentialBordism B3.8–9, which owns the RP²/CP²/HP²/OP² applications and
   their table. The OP² H⁴=H³=0 calculation gives its one String lift class
   for the fixed Spin structure through this API. No coefficient or genus
   calculation is an input to that application.

## S2. String Thom spectra and geometric bordism

Use S1's finite-rank γ_n^String diagram to construct the Thom spectrum MString
through GeneralizedCohomology G5.3 and compare its stabilization with the stable
virtual-bundle Thom construction. Build the coherent product before asserting
an E∞ orientation: GeneralizedCohomology G5's connective real K spectrum ko
and G3.8's covers give kspin=τ_(≥4)ko. Construct the infinite-loop comparison
Ω∞kspin≃BSpin compatible with G5.0's block sum, unit and permutations.
Its fourth Postnikov section is Σ⁴Hℤ; normalize the spectral projection by
`2λ=p₁` and the −1 quaternionic pairing in S1, and prove its zeroth-space
map agrees with S1's λ. Its spectral fibre τ_(≥8)ko has zeroth space equivalent to S1's BString.
Construct that actual homotopy-fibre equivalence along the preceding
λ comparison, compatibly with the finite BString(n) projections and bundles.
Transport the resulting coherently additive structure and all higher
associativity, symmetry and unit data to the finite-rank bundle diagram.
Construct its symmetric Thom ring and the commutative-ring/E∞ comparison
through G2/G5's positive-model rectification; a cohomological Whitney-sum
identity alone is insufficient. Prove independence of the rectified model.
Give the unit, product and forgetful E∞ map MString→MSpin, with their
orientation conventions. Apply TangentialBordism B5's generic Pontryagin–Thom
comparison to the actual BString(n)→BO(n) diagrams, including pairs,
boundaries, products and changes of lift. Construct the induced ring
isomorphism between geometric String bordism and π*MString. Include the
inverse-classifier equivalence M(−θ_String)≃M(θ_String), constructed
from S1's inverse lifts and S2's coherent sum/inverse data, with products,
boundaries and H³ torsor signs. Thus tangential geometric genus and
normal Pontryagin–Thom models are compared on actual lift data. The spectral
refinement is a later S2 target; the early S1 obstruction API uses neither
ko construction nor String coefficients.

Compute rational H*(BString)=ℚ[p₂,p₃,…] by the homotopy-fibre Serre calculation,
with the λ-normalized transgression. Prove rational Thom/Hurewicz comparison
and derive the polynomial rational String bordism ring, with generators in
degrees 4k for k≥2. Build its characteristic-number pairing and identify
the forgetful map into rational Spin bordism. Integral and rational
String structures remain distinct; vanishing of rational p₁ is insufficient
for the integral lift.

Build the low-cell comparison with the sphere spectrum: the unit S→MString
induces isomorphisms on π_i for i≤6, because the reduced Thom cell diagram
has cells in degrees at least 8. Consume HomotopySpheres Stage 9 item 1's
π₃ˢ≅ℤ/24 and Stage 4C's stable J/change-of-framing theorem, and
TangentialBordism B4's Adams tower/convergence when comparing calculations.
Own Ω₃^String≃Ω₃^fr and its ℤ/24 normalization on the chosen carriers.
For every closed oriented 3-manifold M, prove [M,Spin]≃H³(M;ℤ)
by the 2-connectivity of stable Spin, cellular obstruction theory and
the oriented top-cell collapse on each connected component. For a
String-structure change α∈H³(M;ℤ), identify the corresponding gauge
class through this comparison, and prove the framing-change formula
componentwise by collapsing outside an oriented ball. In particular,
for a change α∈H³(S³;ℤ)=π₃K(ℤ,3), identify
β=(Ωλ)_*⁻¹α∈π₃Spin≃π₃SO. Use normal-trivialization change h∘τ
for the stable-J convention. S1.4's gauge formula makes the tangent
frame change −β; the inverse normal framing therefore changes by β.
Prove that the bordism-class change is J(β), constructing those
actual framing comparisons. In the S1.4 test, if g is G5.0's positive
quaternionic clutching generator with Ωλ(g)=−1, increasing the torsor
coordinate by1 changes the framed class by −J(g). The boundary
map into BString does not have the domain of stable J.
Compare this generator with
HomotopySpheres Stage 9's quaternionic ν and export the resulting exact sign conversion.
Do not construct a second low-stem computation or infer an integral group
from its rationalization or a mod-2 calculation.

## S3. Differential String structures

Build integral differential cohomology in all degrees using differential
characters on smooth singular cycles, with curvature and characteristic-class
maps. Pin h(∂c)=∫_c curv(h) modulo ℤ. Prove its two exact sequences, pullback,
products, homotopy formula, periods and comparison with the good-cover Deligne
complex. Consume DifferentialGeometry's Stokes and smooth-chain/de Rham
comparison; construct the smooth-cycle and cocycle data needed for these
characters, not a private opaque proposition. Use this same carrier to build
the degree-4 differential refinement of λ for a Spin connection. Its characteristic class is λ and its curvature is
half the pinned p₁ Chern–Weil form. Construct this refinement using
CharacteristicClasses C4.3's universal connections and the Cheeger–Simons
existence/uniqueness theorem: prove the integral-period characteristic pair,
the character construction and its universal pullback characterization.
Prove connection change, transgression,
pullback and stabilization formulas with integral periods and signs.

Construct smooth U(1) bundle gerbes on surjective submersions Y→M,
with circle bundles on Y×_M Y, associative products on the triple fibre
product, refinements, 1-isomorphisms on common covering refinements and
2-isomorphisms modulo refinement. Construct bundle 2-gerbes, their
products, duals, associators and pentagons, trivializations and their
2-groupoids. Consume LieGroupoidsPoisson G0.1's submersion normal form
and submersion fibre products, with the manifold comparisons used by
SmoothBundlesConnections B1.1/B1.5. Construct every iterated Y^[k]
by these transverse submersion fibre products, with inherited subspace
topology, dimension k dimY−(k−1)dimM and the map-to-fibre-product
universal property. Prove the face/degeneracy maps are smooth and obey
the simplicial identities, including their common-refinement comparisons.
Own the gerbe-specific descent and
comparison with good-cover Čech/Deligne cocycles. Prove independence of
covers and the 2-stack descent laws; pullback in integral cohomology
along an arbitrary surjective submersion is not assumed injective.
Construct connections and curvings and prove the exact alternating
pullback complex on differential forms using local sections and partitions
of unity, with δ=Σ_(i=1)^k(−1)^(i−1)omit_i*. Establish the degree3/4
differential-cohomology classifications on the preceding carrier.
For Spin(n) with n≥5, construct the basic gerbe representing the generator
η_λ∈H³(Spin(n);ℤ) whose normalized universal transgression is λ,
its multiplicative structure, associator
and pentagon, and its invariant connection/curving. Prove the universal
transgression H³(Spin(n);ℤ)≃H⁴(BSpin(n);ℤ) in degree four, identifying the
chosen gerbe level with S1's restricted λ. Compare its invariant-form
normalization with the finite Spin/quaternionic coordinate orientation and
export the exact conversion to the conventional basic-gerbe level. Use this multiplicative gerbe
to construct the Chern–Simons 2-gerbe of a Spin bundle. Stabilize ranks
below 5 to such a rank and prove independence of stabilization; at rank 3,
a gerbe representing the group generator would have half the stable λ level,
so it is not identified with this construction. Compare its underlying
class and connection with the preceding fractional characteristic refinement.

Construct the comparison with S1 explicitly: send the underlying 2-gerbe
classifying cocycle to its map X→K(ℤ,4), prove it represents λ∘c, and
send a trivializing cocycle to the corresponding nullhomotopy. Prove this
is an equivalence on underlying trivialization classes, equivariant for
H³(X;ℤ), with the same pullback and change-of-classifier laws. Also compare
with Redden's integral string classes on the Spin frame bundle through the
Serre sequence, including restriction to the transgressing fibre generator.

A geometric String structure is a trivialization of this 2-gerbe with
compatible connection data. Prove every S1 String structure admits such
a connection. On a fixed trivialization T with covers π:Y→M and ω:W→Y,
prove compatible connections form an affine space over
`V_T=(Ω²(M)⊕Ω¹(Y)⊕Ω¹(W))/U`, where
`U={(dχ,π*χ+ν,ω*ν):χ∈Ω¹(M),ν∈Ω¹(Y)}`.
Construct the action explicitly and verify compatibility, freeness and
transitivity using the alternating descent complex. Prove that the
2-groupoid of geometric trivializations is a module for gerbes with
connection, and that its isomorphism classes form a torsor under Ĥ³(M;ℤ)
when the integral λ class vanishes. Identify forgetting connections with
S1's H³ torsor by coherent descent and the differential exact sequences.

Construct H∈Ω³(M) with `π*H=K_∇+TP(A)` on the Spin frame bundle,
where K_∇ is the gerbe curvature and TP(A) is the λ-normalized
Chern–Simons form. Prove `dH=curv(λhat)` and
`H_(T·κ)=H_T+curv(κ)`, pullback and connection-change laws.
Distinguish these trivializations from requiring λhat itself to vanish
in differential cohomology.

Construct transgression over closed oriented manifolds in dimensions
0–3: evaluation at dimension0, loop gerbes at dimension1, circle bundles
of surface trivializations at dimension2, and holonomy at dimension3.
Use Mathlib's `DiffeologicalSpace`, `Diffeology.IsPlot` and
`Diffeology.DSmooth` for the mapping-space prerequisites. Construct the
manifold diffeology using `DiffeologicalSpace.CorePlotsOn` and
`DiffeologicalSpace.ofCorePlotsOn`: on open Euclidean parameter domains
its plots are precisely `ContMDiffOn` maps to the given smooth manifold.
Prove independence of the smooth atlas and the comparison
`DSmooth f ↔ ContMDiff I J ∞ f` for finite-dimensional boundaryless source
manifolds, with the specified target manifold diffeology. Construct the
bundled smooth-map carrier and identify it with Mathlib's
`ContMDiffMap I J X M ∞` in this manifold case. Mathlib's diffeology file has no
product, subspace or pullback diffeologies: construct them as instances
of this same class, with their universal properties. In particular, do not introduce a second class of diffeological spaces.

Give the bundled maps X→M their functional diffeology: for every open
U⊆ℝ^n a family p:U→C∞(X,M) is a plot exactly when its adjoint
`(u,x)↦p(u)(x)` is smooth on U×X. Construct this diffeology from
`CorePlotsOn`; prove the open-domain/whole-Euclidean plot comparison,
locality, constants and reparametrization. On arbitrary diffeological
spaces use `DSmooth` for the adjoint, and prove the manifold `ContMDiff`
version by the preceding bridge. Prove smooth evaluation, composition,
currying/uncurrying with inverse equations and naturality, and smooth
pullback of families. Prove the equality of `dTopology` with the given
topology on finite-dimensional boundaryless manifolds and compatibility
with the selected product topology when one D-topology factor is locally
compact. In other topological comparisons carry and discharge
`Diffeology.IsDTopologyCompatible` explicitly; for normed-space smoothness
comparisons use `Diffeology.IsContDiffCompatible`. Do not identify arbitrary
product, subspace or mapping-space topologies with their D-topologies.

Construct differential forms as compatible forms on plots, with exterior
derivative, wedge, pullback and their laws; compare with ordinary manifold
forms. For compact oriented X define fibre integration on the functional
mapping space by pulling a plot family back along evaluation and integrating
in the X direction. Pin the product orientation (parameter first, X second)
and prove the resulting signs, smooth parameter dependence, pullback and
exterior-derivative formulas, including Stokes in the form used here.
Construct the circle-bundle and gerbe descent on this carrier. These are
S3 targets, using DifferentialGeometry's finite-dimensional forms and
integration; no general bordism-with-corners extension is inferred.
The compatible manifold and functional-map development in
[lean-catdg](https://github.com/peabrainiac/lean-catdg/tree/1ee4a2614b033dd1b4aded95759eb31eb9b0fbf4/CatDG/Diffeology)
is a cited comparison for these constructions. Develop the bridges on
Mathlib's present class and conventions; any code adaptation retains its
license and attribution. For loop
transgression prove the covering is loopable in the principal connected
Spin case; carry loopability explicitly for general covers. Prove
curvature, characteristic-class, pullback and trivialization comparisons,
including `exp(2πi∫H)` for the closed 3-manifold holonomy. Forms here
are real with integral periods; Waldorf uses iℝ-valued curvatures.
Pin H_W=2πiH and the same conversion for curvings and transgression,
so exp(∫H_W)=exp(2πi∫H). Construct
Waldorf's closed-manifold transgressed Chern–Simons data and the map
from geometric trivializations to its families of sections. Prove this
map is injective by evaluation at a point. Formulate and prove
surjectivity conditional on the explicit hypothesis that those families
and their compatibility are determined by the point value; an
unconditional comparison with a theory on bordisms with corners requires
additional categorical structure and is not inferred from closed-manifold
transgression.

## S4. Characteristic series and the integral Witten genus

Construct the formal virtual-bundle expression
`Θ_q(V)=⊗_{n≥1} Sym_{q^n}(V_ℂ−rank V)` in completed K-theory,
with coefficientwise finiteness and product/naturality identities.
Pin the scalar characteristic series
`Q(x,q)=(x/2)/sinh(x/2)·∏_(n≥1)(1−q^n)²/
((1−exp(x)q^n)(1−exp(−x)q^n))`.
Set G_(2k)(q)=−B_(2k)/(4k)+Σ_(n≥1)σ_(2k−1)(n)q^n.
Construct its formal expansions, logarithm with coefficients
2G_(2k)/(2k)!, Eisenstein-series coefficients,
degree bounds and the comparison with the Chern character of Θ_q.

For a closed Spin manifold of dimension 4k, prove the coefficient of q^n
in the genus is the integer index of the Dirac operator twisted by the
n-th virtual-bundle coefficient. Apply IndexTheory's actual twisted index
formula and additivity for virtual bundles. Construct the ring map from
Spin bordism to ℤ[[q]], with the A-hat constant term and product formulas.
For Spin manifolds with rational p₁=0, prove the cancellation of the p₁ transformation
anomaly and modularity of weight 2k; in particular this applies to String
manifolds. Prove that each genus value is a modular form
with integral q-expansion, using ModularForms' q-expansion comparison;
integrality of q-coefficients is not an assumption on a rational series.

Prove independence of connection choices and of the chosen String lift
for this primary genus, while retaining lift dependence of the dimension-3
secondary invariant in S2. Give explicit constant-term and weight-zero
tests, vanishing in dimensions with no corresponding modular form, and the
value φ_W(OP²)=0. Use its actual p₂=6u and p₄=39u² to verify the
characteristic-number evaluation, including the normalized orientation.

## S5. Cayley-plane bundles and the kernel away from 6

Construct OP² bundles with connected compact F₄ structure group from the
fixed B3 action. Build vertical tangent, induced Spin data and the obstruction
to a String lift of the total space. A String fibre does not supply a
String vertical family automatically; keep the actual total-space lift
among the bordism-cycle data. Develop pullback, products, bordism and
structure-group reduction for these bundle cycles.

Develop the following proof inputs before the localized kernel theorem.

1. Prove the connected-structure-group OP²-bundle vanishing theorem for the
   S4 Witten genus. Use the F₄/Spin(9) complementary-root formula and the
   Weyl-coset pushforward to obtain the theta/sigma-function identity;
   construct its q-adic characteristic-series comparison and the Jacobi
   triple-product identity used in the cancellation. Prove the identity
   universally, then pull back to every closed String total space. This
   is a family vanishing theorem, independent of the isolated OP² value
   and of the positive-Ricci conjecture. Do not assume that a nontrivial
   S³ action exists on every associated bundle without proving it.
2. Build the reusable ordinary-cohomology pushforward for an oriented
   compact homogeneous fibre G/H with G connected compact and H connected
   of maximal rank, using the existing compact Lie groups, integral root
   lattices, classifying spaces and Thom/Gysin APIs. Prove the vertical
   tangent weights are the roots of G complementary to H, and the
   Weyl-coset formula after restriction to a common torus, with the chosen
   Euler orientations. Derive it from the Weyl alternating-sum formula,
   treating intermediate fractions in the localized root ring and proving
   the sum is a polynomial; over ℤ keep any torsion/restriction-kernel
   qualification, and use ℤ[1/6] for the F₄ application. Consume the
   existing root-system classification to identify the maximal-rank
   Spin(9) inclusion and its integral weight lattice. Verify the three
   cosets and their action on the eight positive half-sum roots. These
   are additional family pushforward targets; TB B3's fixed isotropy
   computation is their input, not a claimed existing Weyl-Gysin proof.
3. Consume BordismFormalGroups F3–F5's BP, BP⟨1⟩, cooperations,
   Wilson space-homology and Hopf-ring constructions, including its
   MU/BP-based Adams–Novikov tower and convergence hypotheses. Build the
   Hovey–Ravenel decomposition of the actual p-local BO⟨4k⟩ spaces
   into BP⟨1⟩ spaces for every p>3 used here, with the connective-cover
   maps. Prove Hovey's ring presentation for π*MString_(p) and its map
   into π*MSpin_(p), including the quotient by the chosen BP cooperation
   generators, the [v₁] map from BP⟨1⟩_(2p+2) to BP⟨1⟩_4, its relations,
   and their indecomposable/mixed-number consequences. Construct the
   spectral and homological comparisons, not only an abstract coefficient
   isomorphism. Prove absence of p-torsion and the forgetful injection
   for p>3. TB B6 supplies oriented/Spin characteristic-number detection;
   GeneralizedCohomology supplies spectral models, covers and Thom maps,
   rather than an unconstructed Adams–Novikov spectral sequence.
4. Prove McTague's generator criterion: in each degree 4n with n>1,
   a set S must contain one M^(4n) whose Newton number has valuation1
   at every p>3 with 2n=p^i−1 or 2n=p^i+p^j (0≤i≤j), and
   valuation0 at every other p>3, simultaneously on that one class.
   For every p>3 and 0<i<j, S must also contain N of dimension
   2(p^i+p^j), with s_((p^i+p^j)/2)[N]=0 and
   s_((p^i+1)/2,(p^j−1)/2)[N]≠0 mod p². Prove these conditions
   imply S generates over ℤ[1/6], using the preceding presentations
   and actual characteristic-number pairing. Item5 constructs the
   designated classes; the criterion is not a statement about all manifolds.
5. Construct the required total spaces over products of smooth complete
   intersections, with the actual torus-to-F₄ map and pulled-back bundle.
   Derive λ=0 using the integral class and the torsion-free degree-four
   comparison; p₁=0 alone is insufficient on a torsion base. Prove
   existence of the complete intersections, regularity/transversality,
   tangent/normal exact sequences and normalized top-class integration,
   consuming AffineMorseLefschetz's projective zero-locus carrier and
   GeometricTopology's transversality. Choose degrees 2 and 3 by the
   elementary nonnegative solution of 3a+8b=N for every N≥14;
   retain every congruence constraint on the torus multiplier. Derive the
   degree equations with vertical contribution 4n_f²(x₁²+x₂²), since
   the torus roots are multiplied by n_f. Use the actual tangent sequence
   0→TV→i*TCP→⊕O(d_j)→0 and its characteristic-class comparison.
   Derive the
   Newton and mixed-number polynomials directly from the weights, with
   homogeneous degree and orientation checks. Prove their gcd valuations
   with Kummer/Lucas and the needed prime-square binomial congruences,
   including the factorial-ratio, harmonic-sum and alternating-binomial
   proofs. Construct the two-family integral combinations killing s_n
   while retaining the mixed number mod p². Supply all dimensions n≥4,
   and the separate degree8/12 generators with their Witten-genus values.

Prove that connected-F₄ OP²-bundle classes generate precisely the kernel
of the Witten genus over ℤ[1/6]. Combine the vanishing, generator criterion
and geometric families, proving the coefficient-ring quotient comparison
with ℤ[1/6][c₄,c₆] and its rational specialization. Preserve the localization
and connected-structure-group hypotheses. This coefficient theorem is
independent of constructing the tmf orientation.

For the Ando–Hopkins–Rezk orientation σ:MString→tmf, define I_OP as the
graded ideal generated by classes of the connected-F₄ OP² bundles equipped
with all specified total-space String structures, including every lift
class over each Spin classifier and their changes. State separately the
integral inclusion question `I_OP⊆ker σ_*` and the equality question
`ker(σ_*:Ω_*^String→π_*tmf)=I_OP`, with the geometric-cycle and family
transfer comparisons specified. These are questions; the established theorem
below away from 6 does not settle either integral assertion. EllipticCohomology supplies the
orientation and target spectrum; this question is not substituted for the
preceding established ℤ[1/6] theorem. Do not claim a ring-spectrum quotient
from a coefficient-ring ideal or replace tmf by periodic TMF.

## S6. Curvature questions and elliptic refinements

Define Ric>0 by positivity of the Ricci quadratic form at every point of
a closed Riemannian manifold. State Stolz's one-direction Witten-genus
vanishing conjecture for closed String manifolds of **positive dimension**
with this metric property; no converse is asserted. Keep the dimension-zero
calibration: a positively oriented point has genus 1 and orientation image
the unit, while positivity on its zero tangent spaces is vacuous. Thus it
is not part of the positive-dimensional conjecture.

Separate this genus conjecture from the source questions whether Ric>0
forces the full class `σ[M,s]∈π_n tmf` or its image in `π_n TMF` to vanish
for an arbitrary chosen String lift s. Record these unrestricted refined
assertions as false and prove the following geometric counterexamples.
For G=SU(3) with its left-invariant tangent framing, use its induced stable
String lift s_L and the bi-invariant metric g=−B, with B the Killing form.
With `R(X,Y)=∇_X∇_Y−∇_Y∇_X−∇_[X,Y]` and `Ric(Y,Z)=tr(X↦R(X,Y)Z)`,
compute on left-invariant fields `∇_X Y=[X,Y]/2`, `R(X,Y)Z=−[[X,Y],Z]/4`
and `Ric(X,Y)=−B(X,Y)/4=g(X,Y)/4`. Give the same calculation for
SU(2)≅S³ and identify the metric with a positive rescaling of the round
metric. Construct the framed Pontryagin–Thom classes using S2's specified
tangent-to-normal inverse and prove the unital diagram
`π_n S → π_n MString → π_n tmf` equals the sphere-unit homomorphism.
Identify the left-framed S³ class with a generator of `π_3 S≅ℤ/24`,
fixing its sign by S2's framing convention. Compute its connective image
as a generator of `π_3 tmf≅ℤ/24`; compute the left-framed SU(3) image
u₈ as the nonzero order-2 element in `π_8 tmf`. Pin the actual framings
and lifts in these statements, rather than identifying all lifts on these
manifolds. Their primary Witten genera vanish: for SU(3) use the trivial
stable tangent bundle and the absence of a positive-degree top component
of the characteristic series; the dimension-3 genus is zero in its
rational target. These zero genera do not kill the refined classes.

Consume EllipticCohomology E4's actual permanent classes
`d₂∈π_192 tmf_(2)`, `d₃∈π_72 tmf_(3)` and
`D∈π_576 tmf`, detected respectively by Δ⁸, Δ³ and Δ²⁴.
Use its ring maps `tmf→Tmf→TMF`, connective-cover comparison and
`tmf[D⁻¹]≃Tmf[D⁻¹]≃TMF`. Prove the compatible choices give
`D_(2)=d₂³` and `D_(3)=d₃⁸` (or specify and prove the corresponding
unit factors). The needed low-class survival statement is on actual
homotopy groups: every `d₂^j·u₈` is nonzero of order2, every
`d₂^j·σ[S³,s_L]_(2)` has order8, and every
`d₃^j·σ[S³,s_L]_(3)` has order3, for all j≥0. Obtain these from
E4's coefficient calculation, including its Δ⁸ polynomial-extension
comparison at2 and Δ³ multiplication injectivity at3, with the sphere
unit detections and additive extensions identified. Do not substitute
algebraic modular Δ, c₄ multiplication or a repeating spectral-sequence
picture for these homotopy statements. Apply the localization criterion
`x/1=0 ↔ ∃j, D^j·x=0`. Deduce the periodic SU(3) image has order2
and the periodic S³ image has order24: localization cannot increase the
connective orders, and the surviving primary parts give the reverse
bounds. This supplies negative answers to both unrestricted refined
questions, independently of q-expansion or a rational calculation.
E4 owns the coefficient/localization engine; S6 owns these framed
geometric and curvature comparisons.

Keep the String-lift H³ action and the orientation's effect on changes of
lift as part of the S1/S2/E5 comparisons for all chosen lifts, including
these examples. Retain the integral and localized kernels and the
Cayley-plane questions of S5, and determine which curvature conclusions
hold for which lifts; the two counterexamples are not a classification of
all refined images. Preserve the literal unrestricted source prompts as
questions with these negative answers; do not replace them by a restricted
claim about torsion-free classes or specially chosen String lifts.
A condition on a metric-canonical 3-form, as in Redden's differently
qualified question, is not Ric>0 alone and is not imposed on this
all-lift programme. S3's arbitrary compatible String connections do not
identify such a metric-canonical condition.

Consume EllipticCohomology E5's genus/elliptic q-expansion comparison;
σ factors through connective tmf with holomorphic modular forms before
periodic TMF localization. Keep its kernel, torsion and the two spectra
explicit: zero q-expansion is not a refined vanishing theorem. Consume
SpinGeometry G6's Lichnerowicz theorem and IndexTheory I7's untwisted
Spin Â-index comparison for Â=0 under positive scalar curvature. Combined
with S4 modularity and level-one modular-form dimensions, this proves
Witten-genus vanishing in dimensions 4, 8, 12, 16, 20 and28: each relevant
modular-form space has dimension at most one and its constant term is
injective. Prove these cases, including the zero space in weight2.
The untwisted argument does not settle the remaining weights of Stolz's
genus conjecture, and does not prove refined vanishing.

## Order and references

S1 uses the normalized classifying, characteristic and EM suppliers, including
G5.0's low-homotopy supplement from HomotopySpheres Stage 4B's independent
real Bott chain. The all-rank fibre construction uses G2's homotopy infrastructure.
TangentialBordism B3's String examples use S1. S2 uses the early generic Thom
and Pontryagin–Thom APIs; S3 uses S1 and the differential/connection suppliers.
S4 integrality uses S2 and IndexTheory I7's full Atiyah–Singer theorem. S5 uses S2, S4 and the fixed
exceptional algebra/geometry, and builds its additional p-local proof inputs.
EllipticCohomology E5 supplies the tmf orientation and genus comparison
used by S5's I_OP questions and S6's tmf/TMF conclusions; E5 consumes
S2's Thom ring and primary genus before those applications. E4's actual
coefficient/localization and sphere-unit calculations precede S6's periodic
counterexamples; no curvature claim is an input to those calculations.
S3's native diffeology/manifold/functional-map bridges precede its
plotwise forms, fibre integration and transgressed descent.
No String genus theorem is an input to the obstruction or classifier.

- Milnor–Stasheff, *Characteristic Classes*, for the characteristic normalization.
- Waldorf, [*String Connections and Chern-Simons Theory*](https://arxiv.org/abs/0906.0117),
  for geometric trivializations and their connections.
- McTague, [*The Cayley plane and String bordism*](https://arxiv.org/abs/1111.4520),
  for the localized kernel theorem and its characteristic-number prerequisites.
- Ando–Hopkins–Rezk, [*Multiplicative orientations of KO-theory and of the
  spectrum of topological modular forms*](https://www-users.cse.umn.edu/~tlawson/tmf-mirror/koandtmf.pdf),
  for the distinct tmf orientation.
- McTague, [*tmf Is Not a Ring Spectrum Quotient of String Bordism*](https://arxiv.org/abs/1312.2440),
  for the distinction between coefficient and spectrum quotients.

- Hovey, [*The homotopy of MString and MU⟨6⟩ at large primes*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Hovey-bpbp1.pdf),
  for the p>3 presentations and Hopf-ring proof inputs.
- Hovey–Ravenel, *The 7-connected cobordism ring at p=3*, and Wilson,
  *The Ω-spectrum for Brown–Peterson cohomology II*, for the connected-cover
  decomposition and BP⟨1⟩ space-homology machinery.
- Borel–Hirzebruch, *Characteristic classes and homogeneous spaces I–II*,
  §§10 and20, and Borel–de Siebenthal, *Les sous-groupes fermés de rang maximum*,
  for the root-lattice, tangent and pushforward comparisons.
- Cheeger–Simons, *Differential characters and geometric invariants*;
  Gawędzki–Reis and Meinrenken on basic gerbes; Carey–Johnson–Murray–Stevenson–Wang
  on bundle 2-gerbes; and Redden, *String structures and canonical 3-forms*,
  for the explicit differential/classifying comparisons of S3.
- Stolz, [*A conjecture concerning positive Ricci curvature and the Witten genus*](https://doi.org/10.1007/BF01446319),
  for the one-direction positive-Ricci conjecture.
- Ando–Blumberg–Gepner–Hopkins–Rezk,
  [*Units of ring spectra, orientations, and Thom spectra via rigid infinite loop space theory*](https://arxiv.org/abs/1403.4320),
  for coherent Thom orientations and the E∞ comparison.
- Hopkins, [*Algebraic topology and modular forms*](https://arxiv.org/abs/math/0212397),
  §4.3, for the low sphere-unit detections and the framed SU(3) example.
- Behrens–Mahowald–Quigley,
  [*The 2-primary Hurewicz image of tmf*](https://arxiv.org/abs/2011.08956),
  Introduction and Theorem1.2, for the actual Δ⁸ periodic-extension and
  sphere-unit comparisons; and Belmont–Shimomura,
  [*Beta families arising from a v₂⁹ self map on S/(3,v₁⁸)*](https://arxiv.org/abs/2109.01059),
  Theorem6.1, Lemma6.3 and Theorem6.5, for Δ³ injectivity and the
  3-primary unit detection. These feed E4's coefficient engine, not a
  second coefficient theory here.
- Mathlib's [diffeology foundation](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Geometry/Diffeology/Basic.lean)
  and peabrainiac's Apache-2.0
  [lean-catdg manifold/functional-map comparison](https://github.com/peabrainiac/lean-catdg/tree/1ee4a2614b033dd1b4aded95759eb31eb9b0fbf4/CatDG/Diffeology),
  for S3's native-carrier construction and its comparison with existing work.
