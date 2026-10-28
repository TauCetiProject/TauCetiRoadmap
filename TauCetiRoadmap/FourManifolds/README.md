# Four-dimensional manifolds, intersection forms and elliptic examples

Build the geometry and algebra of four-manifolds: concrete smooth models and
handles, homotopy classification by intersection forms, topological realization
and classification, Spinᶜ structures and torsion, definite-form restrictions from
anti-self-dual gauge theory, and elliptic surfaces. The constructions, comparison
maps and proof foundations are part of the specification. A named classification
theorem does not replace its geometric or analytic prerequisites.

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

Generic collars, boundary gluing, handles, connected sums and surgery carriers
come from GeometricTopology. Its comparison
item3 supplies topological tangent microbundles, Kister–Mazur representatives,
stable BTOP/BPL and the Kirby–Siebenmann class; its high-dimensional PL existence
theorem is not applied in dimension four. Ordinary chains, products, orientations,
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
consequences below consume that single operation theory.

| Earlier supplier | Exact use and ownership here |
| --- | --- |
| GT Layers1–3 and comparison3 | Handles, collars, locally flat charts and generic microbundle/TOP–PL/CW foundations. F3 owns the dimension-four disk-embedding and classification arguments. |
| GT Layer4 carriers, Layer6 application | Framed links, linking, Seifert surfaces and Arf precede F1/F3. Layer6 consumes F3's cyclic surgery and zero-form theorem for Alexander-one slicing; Layer4's Freedman application then consumes Layer6. |
| AT Stages2–4,6,8 | Native chains/cochains, normalized sphere generators, orientation-local-system duality, ordinary obstruction/EM comparisons and proper8.5 plus its end API for the early opened cobordism and product theorem. F1/F2 own the actual handle/link/intersection computations. |
| IntegralLattices | Native integral symmetric lattices, inertia, parity, characteristic vectors and indefinite/unimodular classification. F3/F5/F7 prove manifold realizations/restrictions. |
| CKG K7, TopK T1/T6 and G4.0b | One native projective/Grassmannian carrier, its smooth model comparison and tautological bundles. F6/F7 own blowup, hypersurface and elliptic constructions on them. |
| AffineMorseLefschetz A4.0 and A0/A5/A6; GroebnerGeometry G1 | A4.0's generic noncompact boundary/BM/support duality precedes the early proper cobordism; single projective zero-locus carrier, weak hyperplane theorem and finite Veronese comparison; single elimination/saturation engine. F6/F7 own cubic/quartic discriminant and elliptic-example comparisons. |
| CC C1.2a/C2/C3; TB B4.1–2 | C1.2a S0–S5's independent supported cochains and collared-pair sequence precede the proper cobordism; single ordinary characteristic/Thom and cup-i/Sq APIs. F4 owns the oriented4/Spinᶜ/torsion consequences and Z/4 Pontryagin square. |
| Spin G6.7; Index I7.2/I7.5 | Untwisted quaternionic kernels, signature formula and analytic Rokhlin theorem. Early F7 derives the K3 analytic index; TB B3.4 alone supplies its KO genus. |
| StringOrientation S1 | Actual stable/finite-rank BString lift and H³ torsor; F4 owns the dimension≤4 consequences on its specified real vector-bundle Spin reduction. |
| HomotopySpheres §3C/§4B/§6C/§9 | Unstable link/Hopf, real stable-space and low-stem inputs to F2/GT3/F3; only its stated contracts are consumed. |
| SBC B1–4, CKG K5, PDO P5–7, Index I4/I7 and HF F0 | Shared principal/connection and Sobolev carriers, estimates/Fredholm theory and generic Sard–Smale. F5 constructs the nonlinear four-dimensional gauge slices, transversality, bubbling and gluing. |

## F1. Models, handles and intersection generators

1. On K7's actual CP² carrier, construct the complex-oriented line and point,
   their fundamental classes and H₀/H₂/H₄ generators, cup ring
   ℤ[h]/(h³), and intersection value +1 for a line. Compare its three-cell
   structure with the Hopf attaching map through AT's sphere generators.
   Orientation reversal changes the form to −1. Build S²×S² with product
   orientation and the factor generators, whose matrix is
   `[[0,1],[1,0]]`. Treat S⁴, the rank-zero form and empty connected-sum lists.
2. Construct the nontrivial oriented S²-bundle over S² from the nonzero
   π₁(SO(3)) clutching class, using the common frame and associated-bundle
   carriers. Compare it with the projective bundle of lines in
   `𝒪 ⊕ 𝒪(−1)` over CP¹ and with CP² blown up at a point. The section
   from the trivial summand has normal line 𝒪(−1); its square is −1,
   the fiber has square0, and their intersection is +1. In the basis
   H=S+F, E=S, the form is diag(+1,−1). Prove the oriented diffeomorphism
   to CP²#(−CP²), retaining these generators.
3. Consume GT's connected-sum operation and prove the homology, fundamental
   group, orientation, Euler characteristic and signature comparisons. For
   connected four-manifolds use punctured-ball Mayer–Vietoris and van Kampen:
   H₂ splits as a direct sum and the intersection form is the orthogonal sum.
   Keep the actual maps from the punctured summands. Prove independence of
   the permitted gluing choices by the corresponding GT isotopies.
4. For a finite oriented framed link in S³ construct its 0/2-handlebody using
   GT's native handle attachment. Prove simple connectivity, H₂≅ℤʳ and
   homotopy type ∨ʳS². Build each generator as its oriented core joined to
   a spanning surface, with the relative normal framing fixed. Its square
   is the attaching framing and the off-diagonal pairing is the oriented
   linking number. The intersection matrix is the full framed linking matrix.
   Pin signs against +1-framed and 0-framed unknots and the positive Hopf link.
5. The pair sequence and Poincaré–Lefschetz duality identify its map
   H₂(W)→H₂(W,∂W) with the adjoint of this matrix and give
   H₁(∂W)≅coker(Q). Prove the corresponding kernel, determinant and torsion
   calculations. Unimodularity gives an integral homology-sphere boundary;
   an actual S³ boundary is required to attach a smooth 4-handle. F3 provides
   the distinct topological contractible caps for other homology spheres.
6. Realize every symmetric integral matrix by an explicit framed link,
   using crossings/clasps for off-diagonal entries and integer framings for
   the diagonal. Prove the realization and changes under Kirby moves on the
   existing link/handle carriers. Construct the +2 E₈ plumbing and identify
   its oriented boundary and intersection generators. Compare its cap in F3;
   no arbitrary homology-sphere boundary is silently replaced by S³.

## Early construction exports from F6/F7

The concrete constructions `ellipticEOne`, `ellipticEOneFiberComplement`,
`quarticKThree` and their orientation/Spin/characteristic comparisons below
are independent of F3's classification, F5's gauge theorem and TangentialBordism
B3's coefficient computations. Build these early construction items from
F1, F6.0b, F7.0 and F7.0b, with F6's vanishing-cycle comparison before consumers that compute spin bordism groups. Later
elliptic classification and gauge consequences use the same objects.

## F2. The homotopy classification

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

Consume IntegralLattices Layer6A's indefinite unimodular normal forms and
Layer0F's primitive splitting to derive
`fourIntersectionForm_primitiveIsotropic`: an indefinite form of a closed
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

## F3. Topological surgery, realization and classification

1. **Disk embedding and its local TOP consequences.** Construct these
   items in the following order, using GT's collars, microbundle charts
   and CW-type theorem.

   **1a. Smooth-ambient immersion data and the disk engine.** On a smooth
   oriented4-manifold, define a proper generic immersed disk/sphere family
   by native smooth maps with injective differential, embedded prescribed
   boundary collars and finitely many transverse double points. Supply
   local sheet charts, normal rank2 bundles, framings and intersection signs;
   extend to locally finite families with proper sheet neighborhoods.
   Define λ and µ in ℤ[π] using the universal-cover/local-coefficient chain
   dictionary, with sheet-order involution g↦g⁻¹ and whiskered labels.
   For fixed normal framing µ takes values in the additive quotient by
   ⟨g−g⁻¹⟩, retaining the identity coefficient. Prove
   λ(f,f)=sym(µ(f))+e(ν_f)·1 with sym([g])=g+g⁻¹,
   together with basepoint, tubing, finger/Whitney/cusp and framing-change
   formulas. Give the analogous PL-ambient chart construction.

   Own the decomposition-space API: upper-semicontinuous decompositions
   of locally compact metrizable spaces, closed/proper quotient maps,
   saturated neighborhoods, relative equivalence and shrinkability by
   homeomorphisms small in a specified quotient cover and shrinking pieces
   in the source metric, fixed on the relative locus. Prove Bing's shrinking
   criterion, countable locally finite/relative forms and compatible limits
   with inverse continuity and properness. Build capped gropes, kinky handles
   and Casson towers from signed rooted-tree stages and attaching product
   collars, with their stage/neighborhood/end comparisons. Prove engulfing,
   re-embedding and shrinking estimates; export
   `cassonHandleHomeomorphOpenTwoHandle`, relative to the attaching region
   and its framing, from the actual shrinking maps.

   First prove `diskBoundaryEmbedding` in smooth/PL ambient manifolds with
   π₁=1 orℤ: a finite immersed disk family with embedded disjoint boundary
   collars and algebraic dual spheres g_j, λ(f_i,g_j)=δ_ij,
   λ(g_i,g_j)=0 and µ(g_j)=0, has disjoint locally flat embedded disks
   with the same framed boundaries and generically immersed framed
   geometric dual spheres. Construct the duals through the Clifford-torus
   capped-surface and tower argument of Powell–Ray–Teichner,
   [Theorem A](https://arxiv.org/abs/2006.05209), and retain their homotopy
   comparisons. Geometric duality means exactly one transverse intersection
   for the matching pair and none for other pairs; prove the complement
   π₁ comparison. Derive `framedDiskEmbedding`: when the disks themselves
   have λ(f_i,f_j)=0 for i≠j and µ(f_i)=0 and framed algebraic duals,
   they are regularly homotopic rel boundary to disjoint locally flat disks,
   by embedding their Whitney disks and performing the relative Whitney
   moves. Prove the tubing, π₁-null grope and subexponential-growth
   counting/control lemmas explicitly for1 andℤ. Also own
   Freedman–Quinn Proposition2.9's group-reduction construction for a
   specified finite normal series with finite/cyclic quotients: replace
   caps after height raising so the grope image is π₁-null, preserving
   its body, attaching region and transverse spheres. Prove the finite
   stage-label pigeonhole case, the cyclic word-growth case and induction
   through the series, with the size bounds used in1b.

   **1b. Controlled disks.** Own the controlled variant of
   Freedman–Quinn §5.7 on this smooth/PL ambient carrier. For a locally
   compact metric control space X, p:E→X and positive ε:X→ℝ,
   assume its local fundamental-group images are poly-(finite or cyclic):
   every x∈U has V⊂U for which each component's
   π₁(p⁻¹V)→π₁(p⁻¹U) image is in that class. Define
   (δ,1)-connected M→E over X by extension of relative2-complex diagrams
   with δ-small error in the control map. Define δ-small immersed families
   and algebraically trivial/dual intersections by the actual δ-small
   Whitney disks pairing all extra intersections. Prove there is positive
   δ:X→ℝ such that every locally finite δ-small disk family with these
   data admits ε-small disjoint embedded disks with the same framed
   boundaries and geometric duals. Pin smallness at every point of the
   image, boundary/relative support and exhaustion compatibility. Prove
   controlled separation, tower-height raising and limiting estimates
   before using this theorem in TOP handle straightening.

   **1b.2. PL controlled h-cobordisms and isotopy.** Before1c, own
   the PL-input controlled h-cobordism theorems of FQ7.5–7.6. A
   simplicial-NDR reference p:E→X includes embeddings E→|K|,X→|L|
   over a simplicial map K→L and neighborhood deformation retractions
   whose homotopies commute with that map. Build restriction, locally
   finite/cofinal models and the controlled relative2-complex extension
   comparison. Construct the local Whitehead coefficient cosheaf from
   GT3d's single K/Whitehead spectra of the neighborhood fundamental
   groups. Define its locally finite homology H₁^lf(X;S(p)) with
   restriction, relative support and cofinal-NDR-model comparisons;
   build its cellular spectral sequence and the convergence/truncation
   needed in total degree1. Identify its coefficients Wh, reduced K₀
   and negative K-groups. Construct the controlled based-chain torsion
   q₁(W,M₀), including basis/change-of-control, additivity and the
   comparison with this homology. For local groups1 orℤ use GT3d's
   vanishing of all these groups to prove q₁=0.

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
   The input here is PL; passage to TOP inputs follows1c.

   Own `properSimplyConnectedFiveHCobordism_product` on PL/smooth input
   before1c: a proper5-dimensional h-cobordism with finitely many ends,
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
   follows1c; the early theorem uses the supplied PL/smooth structure only.

   Own Černavskii–Edwards–Kirby's approximation-implies-isotopy API on
   native homeomorphisms: given h:M→N, closed C⊂M, a neighborhood U
   and positive target control ε, construct δ-close embedding conditions
   on g:U→N that yield an ε-small ambient isotopy of h, constant
   outside U, agreeing with g on C. Retain continuous inverse maps,
   supports, boundary collars and parameter/relative-neighborhood forms.
   Consume GT Layer1's single `puncturedTorusImmersion` and bounded-lift
   comparison, and construct the Alexander isotopy used in this controlled
   torus trick. Prove local
   deformation of embedding spaces by that construction, then handle/chart
   induction and locally finite fragmentation/gluing, retaining the controls. It turns the controlled
   approximation supplied above into the structure isotopies in1c.

   **1c. Smoothing, TOP charts and transversality.** Use1a–1b.2 and
   GT3e's relative dimension5 PL structure theory first to prove Quinn's
   controlled Hauptvermutung: a homeomorphism of smooth/PL4-manifolds,
   already a structure isomorphism on the boundary, is isotopic to a
   structure isomorphism near a prescribed1-complex; for a2-complex
   first allow a displacement by ambient TOP isotopy or regular homotopy.
   Keep support in the specified neighborhood and the prescribed small
   control. Obtain the approximation from the PL5 mapping-cylinder
   smoothing obstruction, whose H⁴ term is H³ of that complex, then
   apply1b.2's singular-set control and approximation-implies-isotopy.
   Use GT3g's compatible PL4 smoothing to obtain the smooth version.
   Construct punctured smoothings, relative to boundary collars, by
   locally finite chart gluing with these controlled comparisons.

   First own `noncompactTopFourUnstableSmoothingComparison`: for a TOP4
   manifold with no compact components, actual smooth structures up to sliced
   concordance correspond to homotopy classes of lifts of its actual rank4
   tangent classifier from BTOP(4) to BO(4), with given smooth boundary germs
   and relative lift homotopies. Construct this unstable comparison by the
   open-manifold immersion/compression theorem and relative chart integration
   (Lees–Lashof; Kirby–Siebenmann Essay V; FQ8.5), before any stabilization
   connectivity or sum-stable theorem. Retain the concordance realization and
   underlying TOP identification; a stable lift alone is not this input.

   Before global classification own
   `contractibleSimplyConnectedAtInfinity_topFourHomeomorph_realFour`:
   a connected boundaryless TOP4-manifold V that is contractible and simply
   connected at infinity is homeomorphic to ℝ⁴. Consume AT8.5's single
   `SimplyConnectedAtInfinity` predicate and compact-exhaustion comparison. Contractibility trivializes the actual rank4 TOP tangent bundle;
   its resulting unstable BO(4) reduction and the preceding comparison give
   an actual smooth structure on V. Choose an open smooth chart ball B⊂V,
   and construct the proper5-dimensional cobordism
   W=(V×[0,1))∪(B×{1}), with incoming V×{0} and outgoing B×{1}.
   Own `openedProductCobordism_isProperHCobordism` with these actual data,
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
   Apply1b.2's
   `properSimplyConnectedFiveHCobordism_product` to obtain V≅B≅ℝ⁴;
   retain the actual inverse and proper end comparisons.

   Export the single early
   `contractibleTopFourWithSphereBoundary_homeomorph_closedBall`: a compact
   contractible TOP4-manifold with its specified collared, oriented boundary
   homeomorphism to S³ is homeomorphic to closed D⁴ extending that marking.
   Its interior is contractible and simply connected at infinity by the
   boundary collar. Under the preceding ℝ⁴ comparison, the inner collar
   sphere is bicollared in S⁴=OnePoint(ℝ⁴). GT Layer2's independent
   `brownGeneralizedSchoenflies` identifies its bounded complementary closure
   with D⁴; reattach the collar and use Alexander extension to fix the given
   boundary marking. This construction uses no four-dimensional annulus
   theorem, global form classification or F4 Spin/KS formula.

   Prove `hyperbolicHypersurfaceHomeomorph` for a closed simply connected
   oriented TOP4-manifold with a framed locally flat hypersurface embedding
   in S⁵, smooth/PL away from a specified point, whose form is kH: construct
   a TOP homeomorphism to #k(S²×S²), realizing its marked form. The point
   may have an exotic smooth S³ end. Use1a's framed disk embeddings to
   represent and split the hyperbolic pairs, keeping the geometric duals
   and simply connected complementary pieces. Recognize the remaining
   contractible component by the early ℝ⁴/ball theorem above. The later
   normal-invariant item compares this result with PL normal surgery;
   that comparison is not an input here. This supplies the actual pieces
   in FQ8.15, with no assumption that their separating S³ is smoothable.
   It uses neither F3.3's realization nor F3.4's global TOP classification.

   Own `topologicalFourStableSmoothing` here before TOP map transversality.
   Given a compact TOP4 manifold with a prescribed boundary smoothing,
   its stable tangent admits the corresponding smooth reduction exactly
   when its relative KS class is zero; realize each such reduction by a
   smoothing after finitely many interior S²×S² stabilizations. Construct
   a smoothing of M×ℝ from GT3e's relative dimension5 theory and GT3g's
   PL/O comparison. Apply the controlled Hauptvermutung and Browder's
   ambient0/1/2-surgeries (Browder, *Surgery on simply-connected manifolds*,
   Chapter V §2, especially V.2.6; FQ8.15) to a transverse slice, with actual traces,
   framings and support, until the inserted pieces are simply connected
   framed hypersurfaces in S⁵. Compute their hyperbolic forms and apply
   `hyperbolicHypersurfaceHomeomorph`, keeping the tangent-reduction
   comparison. Give the relative/concordance form and the induced stable
   bundle homotopy. Consume the earlier
   `noncompactTopFourUnstableSmoothingComparison`, then prove
   TOP(4)/O(4)→TOP/O is4-connected by the sum-stable
   existence/concordance construction and this immersion comparison,
   as in FQ8.19.2. Combine the4-connected comparison with the ordinary relative H⁴
   vanishing on noncompact components to classify their smoothings by the
   chosen stable tangent reductions. Display the lifting and difference
   obstruction groups and their relative vanishings.

   Then own `smoothFourPseudoIsotopy_stablyIsotopicToIdentity`: a smooth
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
   codimension1 uses GT's Brown collar and codimension2 uses GT3b's
   `locallyFlatNormalBundle_lowCodim` with the given smooth boundary germ. Retain relative boundary reductions; use the5-connected stabilization
   comparison and higher-dimensional product structure to match the
   tangent/normal smoothings. For compact components use puncturing and
   retain the TOP chart data at the punctures in the applications below.
   Construct the proper normally charted1-dimensional singular locus
   in a TOP5 manifold triad whose complement is smoothed, then obtain
   relative TOP5 handle structures by cancelling handles near that locus
   with1b.2 and replacing its tapered product neighborhoods.

   Own `locallyFlatNormalBundle_topFour` (FQ9.6–9.8): every proper
   locally flat submanifold of a TOP4-manifold has an actual extendable
   linear normal bundle neighborhood, unique by ambient isotopy rel the
   submanifold and a smaller prescribed neighborhood of a closed subset.
   Pin its zero-section/neighborhood embedding, relative boundary germ and
   radial extension property. Codimension1 uses GT3b's Brown collar;
   codimension2 stabilizes the locally flat embedding by ℝ, applies GT3b's
   ambient5 codimension2 theorem and TOP(2) reduction, then descends by
   the radial controlled5-cobordism construction with ε(r)<r/10 and1b.2.
   Supply its PL handle input through the punctured smoothing before descent.
   For curves construct the rank3 normal atlas by successive interval-chart
   straightening and relative gluing; its reduction uses the low-dimensional
   structure comparison of GT3g. Points use actual TOP4 coordinate balls.
   Prove restriction, isotopy, framing and normal Euler comparisons. This
   locally flat theorem supplies no normal bundle for an arbitrary wild
   codimension2 subset with only a π₁ condition.

   Define generic TOP immersed surfaces by local sheet embeddings
   modelled on transverse coordinate planes in ℝ⁴, finitely or locally
   finitely many double points, plumbed rank2 linear normal neighborhoods,
   signs, framings and regular-homotopy comparisons. Transfer λ,µ and
   both disk theorems through the punctured smooth/PL construction,
   retaining the geometric duals. Separate the transversality targets:
   ambient4 submanifold transversality with supplied normal product data;
   high-ambient TOP map transversality with expected preimage dimension4,
   via the submanifold-smoothing/product-structure argument; and GT3e's
   KS-range transversality outside its stated exceptional dimensions.
   Own `topologicalFourMapTransversality` for a TOP4 domain and arbitrary
   codimension q with expected preimage dimension<4. Its target data are an
   actual TOP normal microbundle of Y⊂X,
   including its zero section and relative germs; no global linear reduction
   of a rank3 or rank4 normal bundle is assumed. For q≥3, use GT3b's proper
   locally flat Euclidean embedding of the domain to replace f by its graph
   in X×ℝ^D and Y by Y×ℝ^D. Apply GT3e's
   `ksSubmanifoldTransversality`: the ambient dimension is increased above4,
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
   Also construct the all-dimension4 extension of GT3e's
   `marinStableMapTransversality` on its precise stable normal microbundle
   germs: retain the locally flat inverse image and the homotopy of the
   stabilized map to a germ morphism with inverse image P×0 fixed at every
   time, exactly as in Marin's Definition1.6.
   For codimension≥3 and expected preimage dimension≠4 consume GT3e's
   actual Marin theorem, including domain dimension4; that case requires no
   FQ adaptation. For expected preimage dimension4 adapt the ordinary proof
   with FQ8.19's relative product structure and stable-germ uniqueness/symmetry.
   For codimension1–2 stabilize the preceding ordinary normal-microbundle
   theorem and compare stable germs. In codimension2 with ambient target
   dimension4 own `stableMapTransversality_codimTwoTopFourTarget` for all
   domain dimensions, using this section's `locallyFlatNormalBundle_topFour`;
   GT3b supplies the other low-codimension normal constructions. Retain the
   exceptional domain/preimage4 arguments above, the full locally flat inverse
   image and controlled relative homotopies. These cases are not assigned to
   Marin's codimension≥3 proof. Include the expected-preimage4
   branch after its preceding submanifold-smoothing construction. Arbitrary
   block atlases or open regular neighborhoods do not replace these data.
   The normal-bordism5 preimage case consumes GT3e's theorem. Construct the
   disk, dual-sphere,
   characteristic-surface and embedded-circle normal charts used here;
   circle traces allow arbitrary ambient π₁. Give restriction, gluing,
   isotopy and stabilization comparisons. TOP controlled-input product
   results follow these immersion/handle constructions.

2. **Normal invariants and relative TOP surgery.** Consume GT3d's single
   stable spherical classifier BG, quadratic surgery groups and their
   algebraic periodicity. Construct BTOP→BG by fiberwise one-point
   compactification and define G/TOP as its actual homotopy fiber. Build
   the comparison G/PL→G/TOP, its stabilization and boundary maps. Define
   its homotopy groups through degree5: π₁=π₃=π₅=0, π₂=ℤ/2,
   π₄=ℤ normalized by the surgery obstruction σ/8. From GT3d's
   TOP/PL fiber and G/PL Postnikov stage prove that its fourth stage is
   K(ℤ/2,2)×K(ℤ,4). Pin the G/PL comparison: the integral degree4
   class b pulls back to GT's `gPLDegreeFourClass`, with mod2 reduction equal to the
   square of the degree2 class;
   the PL surgery coefficient in degree4 maps by multiplication2.
   Export relative lift/action and ordinary cohomology comparisons on
   dimension≤4 CW-type pairs, using AT's single EM models. For a normal
   invariant (a,b) on an oriented closed4-manifold prove the KS difference
   is ⟨a²+ρ₂b,[M]⟩, with identity invariant(0,0).

   Define a degree-one geometric TOP normal map by a proper map of compact pairs
   f:N→M of degree1, a specified stable TOP bundle ξ on M, a stable bundle
   map ν_N→ξ covering f, and a fiber homotopy equivalence of ξ's spherical
   fibration with ν_M's. Include the actual normal trivializations and
   boundary identification; ν uses GT's stable normal complement, with no
   Lie-SO frame requirement. Define relative normal bordism on TOP5 pairs
   with those stable maps. Prove the normal-invariant correspondence with
   relative maps to G/TOP, change-of-reference and coefficient maps,
   identity, pullback under the supplied transversality, and addition/action.

   Own `pinchSelfEquivalenceNormalInvariant` after this correspondence:
   for α∈π₂(M), construct h_α=id∨(α∘η∘Ση) with its actual M→M∨S⁴
   pinch map. In the chosen TOP4-stage prove
   η(h_α)=((1+⟨w₂(M),α⟩)PD(α mod2),0), and prove the geometric
   normal-map composition/action formula. For a PL M retain its G/PL
   normal invariant and `gPLDegreeFourClass`, with the actual G/PL→G/TOP
   comparison; do not replace G/PL by a product. Compare the hyperbolic
   hypersurface homeomorphism with this PL surgery construction here.
   F3.4 consumes the same pinch map and action without redefining them.

   Build the based quadratic surgery kernel of a normal map after the
   relative π₁ surgery, with its form, normal-framing quadratic refinement
   and functorial comparison to GT's algebraic Poincaré-chain model.
   Consume L₄(ℤ)≅ℤ with σ/8 and L₅(ℤ)=0; prove the TOP obstruction
   and zero-obstruction surgery exact sequence in dimension4 for targets
   with π₁=1 orℤ by item1's framed-disk controls. For the cyclic case
   consume GT3d's Laurent L-group splitting and Wh(ℤ)=0; retain its
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
   Own `knotExteriorNormalFillingOfArfZero`: for the canonical degree-one
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

   Prove `topologicalFiveHCobordismProduct`: a compact simply connected
   TOP5 h-cobordism with boundary4 and fixed product side collar is a
   product rel incoming boundary/side collar, by the controlled TOP handles
   and disk replacements. Own the controlled product version for
   a simplicial-NDR p:E→X over a locally compact metric X with local
   fundamental-group images1 orℤ, in1b.2's sense. A δ-h-cobordism W→E has deformation retractions to
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

   Own `topologicalAnnulus_fourDimension`: two disjoint nested locally flat
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

   Own `anrHomologyFourPointFlattening`: if a locally compact metrizable
   ANR integral homology4-manifold W is a TOP4-manifold outside p and
   its punctured neighborhoods are locally1-connected at p, construct
   an open R⁴ chart at p. First prove the stabilized line-normal
   approximation used by FQ9.7: the line {p}×ℝ in W×ℝ has a rank4
   normal neighborhood. Own `anrHomologyFiveLineNormalBundle`: a proper
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
   1b.2 with control ε(r)<r/10 to descend the rank4 normal chart. Supply
   its PL input by the punctured smoothing and GT3e's transverse/collared
   construction of the radial5-cobordism before applying that theorem.
   Prove continuity and inverse continuity at p. This point case uses
   no codimension2 normal-bundle criterion.

   Construct `homologySphereContractibleTopologicalCap` for every oriented
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
   complements and apply `anrHomologyFourPointFlattening` at that point.
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
   `homologySphereContractibleTopologicalCap`, its degree-one normal map and its comparison
   with the positive π₄(G/TOP) generator. Prove disjoint interior insertion,
   addition, reversal and the resulting obstruction-change formula. F3.3's
   general unimodular realization consumes this early block. Thus any
   integer cyclic surgery obstruction can be killed before applying the
   zero-obstruction theorem; no unspecified boundary homeomorphism is added.
3. Realize every integral unimodular symmetric form as the form of a connected
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
4. Prove the oriented homeomorphism classification by form plus
   Kirby–Siebenmann number, including the realization of a given form
   isometry by an oriented homeomorphism. State orientation reversal and
   connected-sum laws. Use native AT cohomology for the obstruction class and
   GT's stable tangent microbundle for its definition. Construct the F2
   homotopy equivalence from the given isometry. Its normal invariant has
   (a,0), since the signatures agree; equality of KS gives ⟨a²,[M]⟩=0.
   By Wu and Hurewicz choose α∈π₂(M) lifting PD(a) with
   ⟨w₂(M),α⟩=0. Consume F3.2's actual pinch self-equivalence and corrected
   normal-invariant formula
   η(h_α)=((1+⟨w₂(M),α⟩)PD(α mod2),0).
   Compose with this self-equivalence to kill the normal invariant,
   construct its normal bordism, and use L₅(ℤ)=0 and the TOP5 product
   theorem to realize the original isometry by a homeomorphism. Pin the
   composition actions and chosen orientations. The KS obstruction remains
   distinct from existence of an unstabilized smooth structure.
5. Construct the E₈ and 2E₈ examples and their KS numbers. Pin the
   positive E₈ plumbing to the eight-vertex tree with arms of lengths1,2,4
   at its trivalent vertex, every framing+2 and linking signs compared with
   the native positive E₈ lattice by an explicit signed basis change.
   Identify its oriented boundary with the appropriately oriented Poincaré
   homology sphere Σ. The boundary-connected double plumbing has form2E₈
   and boundary Σ#Σ. Cap with F3.2's actual contractible TOP cap and retain
   the boundary gluing map; F4 computes the resulting KS values1 and0.
   Thus the unexplained cap in the source is a specified construction.
   Include negative plumbings and orientation reversal when translating
   indefinite normal-form decompositions. Construct the two odd
   rank-one homotopy-CP² examples. F5 proves the definite non-diagonalizable
   forms cannot be smooth. Treat the topological Poincaré conclusion for the
   zero form separately from the unsolved smooth four-sphere problem.
   Compare the earlier single
   `contractibleTopFourWithSphereBoundary_homeomorph_closedBall` with the
   relative-surgery proof: construct the marked degree-one normal map to D⁴;
   relative H² and signature vanish, and F4's relative Spin/KS formula with
   ρ(S³)=0 gives zero relative KS. Identify its vanishing normal invariant
   and surgery obstruction and the product comparison from item2, including
   L₅(ℤ)=0. This is a second proof of the same marked ball export, rather than
   a second constructor; GT Layer6 consumes the early theorem without these
   later classification inputs. No smooth4 Schoenflies theorem is asserted.

## F4. Spinᶜ, Wu and torsion

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

Consume TangentialBordism's single ordinary cup-i/Sq and Thom–Wu theory. Build
the diagonal normal-bundle comparison with TM and prove the oriented
four-dimensional Wu identities, characteristic-vector parity and integral
Spinᶜ lifting theorem. An even form implies Spin when H₁ has no2-torsion,
in particular under simple connectivity; retain w₂=0 as the general criterion.
F7's Enriques example has an even free form and a nonzero torsion w₂.

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
filling; order F6.0b/F7.0b → TB B3 → this F4 application, while the
F3 local engine and analytic Index supplier are independent of that filling. Prove the TOP extension by F3.1's punctured smoothing,
relative cap/normal-bordism comparison and the low G/PL→G/TOP
coefficient calculation, keeping the KS defect in the boundary term.
Consume F3.1c's `topologicalFourStableSmoothing`. Compare the characteristic
surface, membrane data, signature and KS under these stabilizations.
These inputs precede F3.3's realization/classification. For F=∅ the formula
gives the simply connected topological Spin KS/signature relation.
For an arbitrary closed connected oriented TOP Spin4 manifold, construct
TOP5 traces of framed surgeries on finitely many generator loops, choosing
the bounding Spin framing so the stable topological-spin lift extends.
Prove that the resulting boundary is simply connected and that both signature
and the KS characteristic number are bordism invariant by the boundary
fundamental-class calculation. Apply the simply connected relation to prove
`topologicalSpinFour_ks_eq_signature_div_eight` in this general scope.
These traces use F3.1's supplied TOP normal charts, without a Lie Spin frame.
Compare it with the smooth Rokhlin theorem from SpinGeometry's untwisted
four-dimensional quaternionic Dirac modules and IndexTheory I7.5; Â integrality
alone gives only divisibility by8, whereas the quaternionic comparison gives16.

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

## F5. Anti-self-dual gauge theory and the definite-form theorem

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

**F5.G0. All-base deformation and flat strata.** Retain the connection,
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

Construct `asdKuranishiReduction` on these carriers. In the Coulomb slice
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
identity is assumed. Compare it with `asdKuranishiReduction`, whose
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

**F5.G1. Metric transversality on its positive-charge branch.** On a
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

Own `asdMetricUniversal_splitSurjective` before applying HF F0.
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
and `asdLocalStabilizerContinuation`: extend this parallel reducing line
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

**F5.G2. All-charge compactification and obstruction gluing.** Prove
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
representations. On a fixed obstruction/isotropy stratum use the harmonic
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

## F6. Blowups, pencils and torus monodromy

Build the real blowup of ℝ² at0 as the incidence submanifold
{(x,L):x∈L} in ℝ²×RP¹ using AT's native real projective carrier; it is
its tautological real line bundle. Compare it by an actual diffeomorphism
with RP² minus a point, retaining the exceptional circle and its Möbius
normal line. The compact disk blowup is the Möbius band, with its boundary
identified with the original circle. These local models distinguish the real
blowup from the complex construction below.

**F6.0. Early construction.** Build the complex blowup at a point by the
incidence/tautological-line local model and glue it to the unchanged complement.
Prove the exceptional normal 𝒪(−1), oriented connected-sum diffeomorphism,
H₂ generator, Chern, Euler and signature formulas. Use the same projective
smooth structure and tautological line as K7/T6.6. Consume Affine A6's
finite-degree Veronese embedding, local inverse, homogeneous equations
and O(1)-pullback comparison when applying A5 to hypersurfaces.

On the finite coefficient spaces used here own the projective
discriminant comparison, consuming GroebnerGeometry G1's single
elimination/saturation engine. Express a nonzero homogeneous common
zero by the projective chart ideals and saturation by the irrelevant
ideal; prove their elimination comparison with the closed projective
incidence projection on A0's complex-point carrier. Construct the
homogeneous derivative resultant for degree-d hypersurfaces, d≥2,
with its scalar law and vanishing exactly at a projective critical point.
Normalize nonvanishing against the Fermat polynomial. Give finite
parameter restriction, Jacobian-rank/ordinary-node tests and decidable
coefficient tests over ℚ(i), including distinct critical values. These
are the coefficient/discriminant comparisons for the cubic and quartic
families, using the existing polynomial algorithm rather than a second
Gröbner-basis construction.

**F6.0a. Earlier local node and fishtail, independent of global pencils.**
Construct the standard oriented complex node on C^2 using the equation
u v=t (and its explicit linear change from z1^2+z2^2). Build its compact
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
nondegenerate node with this model. The later F6.0b comparison on its
actual blow-up/elliptic atlas remains mandatory for that global consumer;
no global E1 or specified boundary framing follows from the local model.

**F6.0b. Cubic pencil and E1.** Choose two transverse plane cubics with nine distinct common points and a
pencil whose other singular members have the specified nodal transversality.
Prove these parameters exist and the finite exceptional locus is controlled.
Construct the cubic coefficient vector space ℂ¹⁰ and its projectivization
CP⁹, with homogeneous evaluation and scalar-quotient comparison; a pencil
is a projective line in this parameter space, with base CP¹. Distinguish
these equation parameters from curve isomorphism classes; CP⁹ is not the
moduli space of cubics.
Build Bézout and the exact eight-plus-forced-ninth Cayley–Bacharach step needed
here; nine arbitrary generic points do not automatically determine a pencil.
Blow up the actual base points and obtain `ellipticEOne` over CP¹, with sections,
a regular torus fiber and the oriented diffeomorphism
CP²#9(−CP²). Prove c₁=3H−ΣEᵢ, χ=12, σ=−8, and fiber class
F=3H−ΣEᵢ, F²=0 and F characteristic. Its singular fibers are twelve
positive nodes. Construct the complement of a regular fiber and its actual
oriented T³ boundary/fiber-meridian framing. Pin the torus-bundle complement
Kirby description and its fundamental-group calculation before F7 uses it.

Own the local holomorphic Morse lemma for a nondegenerate complex
critical point, with actual holomorphic coordinates and equation z₁²+z₂².
Construct the Milnor fiber, its oriented vanishing cycle and the
Picard–Lefschetz comparison on F6.0b's blow-up/elliptic complex atlas,
consuming CKG K7's projective atlas and F6.0's blow-up chart comparison.
Compare that global atlas with the earlier F6.0a local node constructed here;
this is the global application of the same local theorem, not a second
local owner or a prerequisite of its elementary model. Identify a fishtail with the positive self-plumbing of
the disk bundle over S² of Euler number−2; the immersed sphere has one positive
double point and homological square0. Prove the monodromy is a positive
Dehn twist, with the actual base/fiber orientations.

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

## F7. Elliptic surfaces, K3 and boundary Spin data

**F7.0. Early construction.** Define `quarticKThree` as A0's
`complexProjectiveZeroLocus` of the one equation Σ_(i:Fin4)z_i⁴=0
in K7's native CP³: the chosen carrier is the Fermat quartic. Prove its
projective Jacobian regularity and use A0/K7's induced atlas, complex
orientation and tangent-normal sequence. Prove π₁=0 by A5 after the degree4 Veronese comparison,
c₁=0,c₂[M]=24,p₁[M]=−48, χ=24 and σ=−16. Give the actual Spin lift from
the canonical-line trivialization. It is a concrete oriented Spin K3 generator
for TangentialBordism; no Spin bordism coefficient calculation is an input.
Derive its untwisted complex index2 and quaternionic analytical index1 from
IndexTheory I7.5. TangentialBordism B3.4 consumes these data for its single
comparison that its KO genus is +a through TopologicalKTheory's
c(a)=2u² normalization. With the signature/16 convention its bordism number is−1;
orientation reversal gives+1.

**F7.0b. Lie-spin filling.** Build `ellipticEOneFiberComplement` from
F6.0b's ellipticEOne by deleting a regular fiber's open normal
disk neighborhood, with its actual boundary T²×S¹ identification. The canonical
class is supported on that fiber, so its restriction vanishes. Construct the
Spin lift and a parallelization using the four-dimensional obstruction data and
H⁴ of the complement being0. Compute its simple connectivity using
F6's actual a,b vanishing cycles. Own
`ellipticEOneFiberComplement_boundarySpin_eq_lie`, identifying its actual
boundary Spin structure with the Lie Spin structure on T³ through the
frames/meromorphic volume form. Its signature is−8; F4's Rokhlin comparison
later gives the boundary number8 mod16 as an F4 consequence. This filling is
independent of TangentialBordism B3's Spin-group computations. Its induced
boundary stable framing is distinguished from the Lie framing: the latter
represents η³=12ν≠0 in π₃ˢ≅ℤ/24.

Form E(n), n≥1, by the specified fiber sums, with actual section and gluing
data. Prove π₁=0, χ=12n, σ=−8n, b₂=12n−2 and the Chern formula
c₁=(2−n)F. For even n the form is n(−E₈)⊕(2n−1)H; for odd n it is
I_(2n−1,10n−1). Prove Spin iff n is even, including the fiber's primitivity.
Prove the genus-one positive-factorization classification, with section
and Hurwitz/total-space diffeomorphism comparisons. Construct the actual
elliptic quartic on A0's carrier as follows. In CP³ fix the disjoint lines
L₀={z₂=z₃=0} and L₁={z₀=z₁=0}. The polynomial
`ellipticQuarticSeedPolynomial`,
F₀=z₀³z₂+z₂³z₁+z₁³z₃+z₃³z₀, vanishes on both; its cyclic derivative
equations have no common nonzero zero, since the all-nonzero branch
would give3⁴=1, and any zero forces all coordinates zero.
In the coefficient subspace of quartics containing these two lines,
prove a nonempty open set gives smooth quartics and a basepoint-free Lefschetz fibration
of residual cubics in the planes through L₀: all critical points are
ordinary complex Morse points with distinct critical values. Prove this
by the finite incidence/jet-rank dimension calculation and F6's
discriminant comparisons, including the line charts. Define
`ellipticQuarticPolynomial` as the first tuple in a fixed height-ordered
enumeration of ℚ(i) coefficients satisfying the decidable tests; prove
termination by that nonempty open set and rational coefficient density.
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

Define the Enriques K3 cover on A0's same native projective zero-locus carrier
by the three quadrics `enriquesQuadric j`, Σ_(i:Fin6)t_i^j z_i²=0 for j=0,1,2 and
t_i=i+1. Construct its free involution negating the first three coordinates. Prove regularity, freeness and
simple connectivity, the canonical residue-form action−1 and the quotient
manifold atlas. Compute its Enriques quotient's H₁=ℤ/2, torsion canonical
class, nonzero w₂ and even free form H⊕(−E₈). This gives the required torsion
counterexample to an unqualified even-form-implies-Spin statement.

## Finite presentations, algorithms and exotic four-space

Use Mathlib's native free groups, words, presented groups and computability
carriers. Build the effective finite-presentation complex from a finite
alphabet and relator word list, its simplicial subdivision and a rational
linear general-position embedding into ℝ⁵. Construct its compact smooth
regular neighborhood by the facewise ordered small radii and corner
smoothing, with a computable finite triangulation. Its boundary is a closed
oriented smooth4-manifold, and its fundamental group is the presented
group by the dual-handle/collar comparison. Extend presentation realization
to closed smooth oriented n-manifolds for every n≥4 using the corresponding
(n+1)-dimensional neighborhood; retain the maps identifying π₁.

Own the finite-presentation undecidability inputs rather than presuppose an
oracle for them. Construct the Novikov–Boone simulation of a Turing machine
by a finite presentation and its word map, and the Adian–Rabin transformation
of a fixed group with undecidable word problem to a recursively enumerable
family of presentations P_w that is trivial exactly when the input word
is1. Build the free-product/amalgam/HNN normal forms and Britton/small-
cancellation lemmas used by that transformation, prove its embedding and
trivial-branch collapse, and the effective word/presentation maps, following
[Rabin's construction](https://doi.org/10.2307/1969933). Keep the
numbers of generators and relators fixed; add redundant relators so their
fixed difference k is positive. On the preceding neighborhood boundary,
π₁ is nontrivial in the nontrivial branch. In the trivial branch prove
rank H₂=2k, signature0 by boundary duality, evenness from its actual stable
parallelization in ℝ⁵, and KS=0. F3 and IntegralLattices identify it with
#k(S²×S²). Thus no algorithm decides, on finite triangulations of closed
4-manifolds, homeomorphism to this fixed #k(S²×S²), nor the global
homeomorphism or simple-connectivity problem. This is the Markov
nonrecognition conclusion via the regular-neighborhood/form reduction;
it makes no sphere-recognition assertion. The construction is described in
[Tancer, Theorem1 and Proposition5](https://arxiv.org/abs/2310.07421).

Own `unimodularIntegralFormIsometryDecidable` on finite symmetric integer
matrices with determinant±1. The indefinite case uses IntegralLattices'
rank/signature/parity classification, with computable rational inertia;
rank0 and incompatible inertia are separate. For a positive definite form
Q, enumerate the possible isometry columns v_i from
‖v_i‖²≤Q'_(ii) tr(Q⁻¹), prove the bound using the positive real form,
and test the finite bounded integer matrices for PᵀQP=Q' and det P=±1.
Negate both negative definite forms. Prove termination, soundness and
completeness, retaining the actual isometry when the answer is positive.
On a finite oriented integer-framed link diagram with unimodular linking
matrix, the TOP4 input is F3's smooth handlebody capped by its specified
contractible topological cap. Compute the linking matrix and KS by the
characteristic sublink: solve Qx=diag(Q) mod2 with x∈{0,1}^r,
construct the proper characteristic link C, and prove
KS=(σ(Q)−xᵀQx)/8+Arf(C) mod2. Consume GT Layer4's actual
`properLinkArfInvariant`, its Seifert refinement and radical quotient, which
use TangentialBordism B3.2's single `finiteQuadraticArf` API. Compare it
to F4's membrane formula. Decide oriented homeomorphism by form isometry
and equal KS; allow either Q' or−Q' for unoriented homeomorphism. Compare
with [Bastl et al., §§5–7](https://www.maths.gla.ac.uk/~mpowell/Algorithm_for_simply_connected_4_manifolds.pdf).

Construct the exotic `fourSpaceFromKThree` by the following specified
surgery comparison. Let X=#3(S²×S²) minus an open coordinate ball.
Use F3's Casson/re-embedding controls to construct collared TOP embeddings
i:X→quarticKThree and j:X→#3(S²×S²), with i realizing its3H summand,
j realizing all H₂, and an actual diffeomorphism between neighborhoods
of the images that intertwines i and j. Own the needed
`hyperbolicNeighborhoodReembedding` theorem on these fixed models.
Choose the integral3H basis in F7's K3 form, represent its six classes
by smooth generic immersed spheres using F2 Hurewicz and F3.1a's
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
Casson's relative re-embedding theorem. F3.1a supplies the generic relative
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
GT3g owns uniqueness of Euclidean smooth structures for n≠4 and the
low-dimensional smoothing comparison. No conclusion about smooth S⁴
recognition or the smooth four-dimensional Poincaré conjecture is requested.

## Checks and references

Compute the signed forms and classes of CP²,S²×S²,the twisted sphere bundle,
the E₈ plumbing,E1,E2 and K3 on their actual carriers. Check every cap's boundary,
KS parity, Spin and torsion hypotheses; test the Enriques and rank-zero cases.
Compare the three independent signature routes—intersection form, characteristic
classes and gauge/bordism—through the same orientation. Distinguish the E1
complement's boundary Spin structure from its stable framing.

Proof references include Gompf–Stipsicz, *4-Manifolds and Kirby Calculus*,
Freedman, *The topology of four-dimensional manifolds* (JDG17,1982),
Donaldson, *An application of gauge theory to four-dimensional topology*
(JDG18,1983), Freedman–Quinn,
[*Topology of 4-Manifolds*, 2013 author reformat](https://archive.mpim-bonn.mpg.de/4789/2/FreedmanQuinn-TopologyOf4Manifolds-Reformatted2013.pdf),
§§5.1/5.7,7.4,8.14,9 and10 for the ordered disk/control/local TOP and
stable-smoothing proof engine, and the cited GT,
AT, lattice, gauge-analysis and characteristic-class references. The full
Kirby and Teichner source allocations are tracked separately from this
mathematical specification.
