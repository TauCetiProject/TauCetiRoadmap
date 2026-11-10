# Smooth orbifolds with finite isotropy

Construct smooth orbifolds with their finite isotropy, including ineffective isotropy: usable
proper étale presentations and finite charts, generalized maps and pullbacks, orbibundles,
invariant differential forms, weighted integration and rational duality. Construct compatible
coarse triangulations and the actual comparison between the classifying space and coarse space.
Include globally collared saturated domains and parameter-box products, with individually labelled
faces, used by parameter families and cobordisms.

The definitive specification is this README. `Suggested.lean` gives suggested forms and is not
an exhaustive checklist.

## Conventions and suppliers

A presentation has finite-dimensional Hausdorff second-countable smooth object and arrow
manifolds. Source and target are local diffeomorphisms, and `(s,t)` is proper, expressed using native
[`IsProperMap`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Maps/Proper/Basic.lean). Dimensions are
fixed on each connected component. The coarse space is the actual orbit quotient with its
quotient topology. Retain every arrow; two distinct arrows can induce the same germ on objects.
An orientation is preserved by all arrows, including isotropy. A boundaryless oriented assertion
therefore has orientation-preserving local isotropy. The boundary/corner carrier is the full
restriction to `D={x | rho_i(x)≥0 for all i}` in a boundaryless presentation, for a finite
family of arrow-invariant smooth functions with linearly independent active differentials
and supplied compatible invariant collars, together with products `Γ×[0,1]^k`. O1.6 constructs
these global corner groupoids and their charts. Each labelled face is preserved individually;
face-permuting quadrant actions are outside this carrier. Reflection loci of boundaryless
quotient charts remain distinct from these designated faces.

An orbifold map is represented by a principal bibundle, equivalently by a refinement span of
smooth functors with its 2-isomorphisms. A coarse continuous map alone is not such data.
Effectivization preserves the coarse space but need not preserve the orbifold. For a nontrivial
finite group `K`, the point presentation `[*/K]` retains isotropy `K` and is not equivalent to a
point with trivial isotropy.

Use ordinary cohomology `H*(BΓ;R)` for a presentation `Γ`. It is distinct from Chen–Ruan
cohomology. Rational comparison with the coarse space concerns constant coefficients, and the
orientation local system on locally orientable presentations, meaning each isotropy group
acts trivially on its local orientation line. Construct its descended coarse local system
and the pullback identification. These comparisons do not identify arbitrary integral or
isotropy-sensitive local systems with coarse ones. If isotropy reverses orientation, this
descent hypothesis fails: reflection on ℝ with the sign coefficient has local
`H^*(B(ℤ/2);ℚ_sign)=0`, and no rank-one coarse orientation local system is asserted.
Weighted integration is an operation on the orbifold, not ordinary manifold integration on
its generally infinite-dimensional classifying space. Use `[N/K]` for a quotient orbifold and
`BΓ` for its classifying space. Weighted integration uses the full finite isotropy
orders. In particular `∫_[*/K]1=1/|K|`.

- [LieGroupoidsPoisson](../LieGroupoidsPoisson/README.md) G0 supplies the native categorical
  groupoid, total-arrow topology/smooth structure and transverse-fiber-product interfaces;
  G3.5 supplies principal bibundles, balanced composition and Morita/isotropy comparison.
  Use those carriers and operations, including the direction `gh = h ≫ g` for first `h`, then
  `g`. This roadmap constructs the proper étale subtheory and its finite-chart reconstruction.
- [SmoothBundlesConnections](https://github.com/TauCetiProject/TauCetiRoadmap/pull/887) B1.4 supplies proper
  finite-dimensional action slices, the free quotient and finite-isotropy local quotient
  charts. Finite Bochner linearization is constructed in O2.1. B2 supplies ordinary frame and bundle operations. Consume these for the action
  specialization and frame construction; build the arbitrary proper étale atlas here.
  B3 supplies ordinary connections, their affine one-form action and existence by partitions
  of unity; B4 supplies curvature, covariant exterior derivative and Bianchi. O2.4 and O4
  construct their invariant and nerve-level adapters using those exact contracts.
- [DifferentialGeometry](../DifferentialGeometry/README.md) supplies manifold forms,
  orientations, outward-normal-first boundary convention, smooth integration and de Rham
  comparison. [CharacteristicClasses](https://github.com/TauCetiProject/TauCetiRoadmap/pull/896) and
  [TopologicalKTheory](../TopologicalKTheory/README.md) supply ordinary characteristic classes
  and bundle classifiers. Consume CC C4.1's invariant homogeneous polynomials, curvature
  evaluation and connection transgression, and C4.3's degreewise finite-Stiefel universal
  Chern–Weil/stabilization contract. O4-W constructs the simplicial/universal comparison. For O4-T also consume CC C1.1b's numerable join classification/Dold theorem, C1.2's actual counit comparison, C1.5's normalized torus models, AT4.7/6.1 and HomotopySpheres §3A's compactly generated products/realizations. These are ordinary generic topology/bundle inputs; the proper-groupoid topology, cochain and represented-torus adapters are constructed here. For the dual-character circle normalization consume SBC B6.1–B6.3's integral/real comparison and curvature law, together with CC C1.5's generator comparison; the torus application is proved in O4-T/O4-W.
- [AlgebraicTopology](../AlgebraicTopology/README.md) supplies singular chains/cochains,
  relative and small-chain comparison, subdivision, ordinary cup/cap products, realization,
  finite-group bar theory and cellular comparison. O5 owns the rational-homology-manifold
  compact-class/local-to-global duality extension using these generic chain APIs.
  O4 constructs the required finite-orbifold-atlas descent adapter from these, with actual
  maps. No general theorem about arbitrary singular-space sheaf cohomology is an input.
- [LieGroups](../RepresentationTheory/LieGroups/README.md) supplies the orthogonal Lie groups and their smooth
  matrix actions, consumed with SBC frames.
- [GeometricTopology](../GeometricTopology/README.md) supplies smooth manifold triangulation
  and relative collars. O3 constructs the extra orbit-stratum, locally-polyhedral and
  quotient-compatible triangulation theory needed for coarse orbifolds.
- [ComplexKahlerGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/pull/953) K1 supplies complex orientations
  and their manifold comparison for complex-chart examples. A complex deformation family,
  a nodal domain, or a moduli-specific properness/slice theorem is additional geometric data,
  not supplied by a generic orbifold presentation.

[HamiltonianReduction R3](../SymplecticGeometry/HamiltonianReduction/README.md) owns its actual possibly ineffective Hamiltonian level presentation, restricted symplectic form and moment/kernel/descent application. O1–O4 own the generic proper étale, invariant-form/Morita and represented-bundle interfaces instantiated there. [ConvexityToric T4](../SymplecticGeometry/ConvexityToric/README.md) consumes O4-N/S/R/K/W/T and O5 for its full effective and ineffective DH, reduced-volume and character-Chern normalization applications. O4-T contains the additional generic thin-topology and torus-classifier proof floors. Generic O1–O5 uses its own displayed sources and supplied presentation/bundle data, with no CT integration or DH premise. O7 comparisons follow both constructions. No second moment map, symplectic reduction or toric classification is constructed here.
[FuchsianOrbifolds](../FuchsianOrbifolds/README.md) retains its specified elliptic/cusp quotients
and area/signature calculations; O7 provides their generic orbifold comparison.

## O1. Presentations, maps and finite-action models

1. Define the Hausdorff proper étale subcategory on LGP G0's actual groupoid carrier, proving
   closure under the specified open restrictions, products and smooth equivalences. Consume
   LGP's unit/action groupoids and their total-arrow topology, together with native
   `CategoryTheory.ActionCategory` and `MulAction.orbitRel.Quotient`. Construct the adapter
   using `ActionCategory.objEquiv`; objects are not identified with X definitionally.
   Identify the total arrow space with `G×X` by its source and element label, and prove the
   topology, source, target, unit, inverse and multiplication formulas. Construct
   `MulAction.stabilizer G x ≃* CategoryTheory.Aut (CategoryTheory.ActionCategory.objEquiv G X x)`
   with multiplication `gh=h≫g`, comparing the native End/stabilizerSubmonoid interface and
   the opposite vertex-group convention. Retain labels even for elements acting trivially.
2. Consume LGP G0.4's smooth functors/natural isomorphisms and G3.5's principal bibundles,
   balanced composition, associators/unitors and their coherence. Construct the
   refinement-span/principal-bibundle comparison on this proper étale Hausdorff subcategory,
   its composition/refinement laws and equivariant-object descent. Prove coarse maps compose
   and Morita equivalences induce coarse homeomorphisms and isotropy isomorphisms. Prove the
   coarse quotient is Hausdorff, second countable, locally compact and paracompact. These
   adapters extend the existing carriers rather than define a second functor or bibundle theory.
3. Construct weak fiber products as actual triples `(x,h,y)` with `h:f(x)→g(y)` and the
   commuting arrow pairs, using LGP's transverse fiber products. State the required
   transversality of the displayed object/arrow maps; a submersion hypothesis is a sufficient
   case. Prove smoothness, proper étaleness, universal property up to natural isomorphism,
   composition/base-change and Morita independence under these hypotheses. A pullback whose
   fiber is a singular nodal curve is not asserted to be a smooth orbifold by this theorem.
4. Construct the étale presentation of a proper locally-free finite-dimensional Lie-group
   action with finite stabilizers from a countable collection of SBC slices, retaining actual
   transporting group elements. Construct its Morita bibundle to the action groupoid and
   prove slice-refinement independence. This is a general action specialization; the
   Hamiltonian comparison is O7. Do not assume every ineffective orbifold is a global
   compact-Lie-group quotient via an effective frame construction.
5. Use LGP G3.1's algebraic fibered action carrier to construct continuous equivariant
   families `p:Z→Γ₀`, with their actual continuous fibered action map and continuous
   intertwining maps, where `Z` is an arbitrary topological space. Construct the topological
   action groupoid and base-change along
   continuous maps of object charts. Supply the underlying fiber-product homeomorphisms.
   The smooth specialization uses O1.3's manifold/transversality hypotheses; it is separate
   from this topological construction.

6. Construct the global collared-domain carrier from the finite invariant `rho_i` data in
   the conventions. Its objects are D and its arrows are the full saturated restriction;
   prove saturation, inherited composition and properness. Use active rho coordinates and
   the supplied compatible collar fields to construct actual quadrant charts on objects
   and arrows. Prove source/target are face-preserving local diffeomorphisms in those charts
   and all structure maps smooth on the relative corner domains. Construct restrictions,
   neat face intersections, changes/refinements of this data and products with ordered
   boxes. Average local straightening data where needed, preserving the individually fixed
   faces and the collar compatibility equations. These are explicit globally collared
   orbifolds with faces; arbitrary corner actions are not part of this assertion.

   Pin the supplied collars as inward maps `c_i:F_i×[0,epsilon_i)→D` on their stated
   neighborhoods, with `c_i(x,0)=x`, `rho_i(c_i(x,t))=t` and
   `rho_j(c_i(x,t))=rho_j(x)` for `j≠i`. They commute on common domains and are equivariant
   for the actual arrows, including their restrictions to all labelled intersections.
   Collar radii may be positive invariant functions. Retain this compatible collar datum
   as a hypothesis of the carrier. O1.6 owns the box product, face-restriction and averaged
   straightening maps; their orientation conventions and integral laws occur later.

   Define the full topological restriction to the closed union `∂D=⋃_i F_i` and its nerve,
   using the face/intersection charts rather than assuming that this union is a single
   smooth object chart. Construct compatible invariant NDR/collar data for
   `(N_pΓ_D,N_pΓ_∂D)` in every nerve degree, compatible with all structure maps, and the
   closed-subspace/relative-pair comparison after fat realization. The corner-union
   retraction is constructed from the commuting collars and continuous quadrant face
   coordinates; it is not the saturated-open restriction theorem. These maps give the
   good pair `(BΓ_D,BΓ_∂D)` used in O4-P.

## O2. Retained-arrow charts, averaging and effective reduction

1. At each object `x`, construct a sufficiently small invariant neighborhood `U` and an
   isomorphism `Γ|U ≅ Γ_x⋉U`. Prove finiteness of `Γ_x` by properness and étaleness. Choose
   actual local bisections for its elements, shrink so all multiplication identities hold,
   and use properness to exclude additional arrows near `(x,x)`. Keep the distinct label
   `g` even if its action on all of `U` is the identity. Own finite Bochner linearization:
   choose `c:U→T_xU` with `c(x)=0` and `dc_x=id`, write `L_g=d(g)_x`, and set
   `A(y)=|G|⁻¹Σ_g L_g⁻¹ c(g·y)`. Prove `A(h·y)=L_h A(y)` and `dA_x=id`.
   Apply the inverse function theorem, shrink simultaneously, and average an inner product
   to obtain an invariant ball and the equivariant chart. This works for nonfaithful
   actions and proves the derivative representation detects the ineffective kernel.
2. Construct finite-chart atlas data with actual overlap-arrow torsors, composition and
   natural transformations. The overlap data include the separated/proper condition on the
   resulting arrow relation. Construct the presenting smooth groupoid, prove properness,
   refinement and the two inverse comparisons up to Morita equivalence. Replacing overlaps
   by only germs of chart diffeomorphisms would erase ineffective isotropy and is not the
   chart model. Prove local change-of-chart and stabilizer-conjugation formulas, restriction,
   products and the independence of the chosen local linearization.
3. Define the ineffective kernel by arrows inducing the identity germ. Prove it is locally a
   finite normal kernel acting trivially on the connected chart, construct the effective
   quotient presentation and prove equality of coarse spaces. Prove the kernel-order
   function is locally constant on each connected orbifold component; retain the actual
   kernel groups and their conjugation/monodromy. Prove the full stabilizer equals this
   kernel on a dense principal open subset by the faithful finite linear fixed-subspace
   calculation. Give the trivial gerbe `K×N⇒N` as a
   required example. Effective reduction is not asserted to be a Morita equivalence.

   On an O1.6 face or labelled intersection prove that its ineffective germ kernel equals
   the ambient ineffective kernel. If g fixes its face germ, its derivative is the identity
   on the face tangent space. Preservation of each active rho gives identity on the normal
   quotient, so `dg=Id+N`, where N maps normal directions to tangent directions and N²=0.
   Finite order gives `0=(Id+N)^m-Id=mN`, hence N=0 over ℝ. O2.1's Bochner chart then gives
   the ambient identity germ. The converse is restriction. Thus the same kernel order k
   appears on all incident labelled faces, including at corners; conjugation identifies
   these kernel groups along arrows.
4. Reuse
   [`GroupAlgebra.average`, `Representation.invariants`, `averageMap` and `isProj_averageMap`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Invariants.lean) for finite representations over a coefficient ring in which the group
   order is invertible. Prove the intertwiner and change-of-group compatibilities needed
   here, exactness of invariants by averaging lifts, and the resulting positive-degree
   finite-group cohomology contraction with the native bar/action convention. Construct
   invariant smooth partitions and finite-action metric averages. Construct affine
   averaging of connections on a fixed equivariant bundle: after choosing ∇₀, differences
   of connections are End(E)-valued one-forms by SBC B3, so average the pulled-back connections in
   this affine space and prove independence of ∇₀, invariance, Leibniz and refinement laws.
   Native linear `averageMap` alone is not this affine construction. Consume AT8.8's actual
   bar/group-cohomology comparison for the stated finite-group contraction. These have
   actual coefficient/order hypotheses; integral invariants are not advertised as exact.

   Also construct a smooth cutoff c≥0 on objects of each stated Hausdorff second-countable proper étale presentation, with `Σ_(s(g)=x)c(t(g))=1` and `s:supp(c∘t)→Γ₀` proper. Use a locally finite saturated cover of the paracompact coarse space and compactly supported object-chart bumps meeting every orbit; sum and normalize their translates. Prove smoothness/local finiteness from cutoff support and proper `(s,t)`. Construct the actual insertion/averaging contraction of the positive-degree augmented nerve cochain complex, with restriction/refinement laws. For forms its degree-zero kernel is exactly the arrow-invariant forms; retain nerve pullback and total-complex signs. This global proper-groupoid construction is stronger than finite representation averaging and uses no integration or CT theorem.
5. For each dimension `n`, let `Γ₀^(n)` be the union of **all** connected components of the
   object manifold having dimension `n`, and let `Γ^(n)` denote the full restriction of the
   groupoid to that union (including every arrow between its objects). Construct an invariant
   positive metric and the orthonormal object-frame bundle `E_n→Γ₀^(n)`. Prove Γ₀^(n)
   is saturated, open and closed, and `Γ≅⊔_n Γ^(n)` as an actual groupoid. Apply the lift
   to `Γ_eff^(n)`, the effective reduction of that restriction; prove its frame action
   free and proper. Construct its smooth quotient `F_n:=E_n/Γ_eff^(n)` as a manifold. The residual right
   `O(n)` action on `F_n` is proper and locally free, using LieGroups/SBC smooth O(n). Prove the effective presentation
   restricted to `Γ^(n)` is Morita equivalent to `F_n⋊O(n)` and that
   `F_n/O(n)≅|Γ^(n)|`. Assemble componentwise as `E=⊔_n E_n`, `F=⊔_n F_n`, and
   `|Γ|≅⊔_n(F_n/O(n))`; no single `O(n)` acts across components of different dimensions.
   Use SBC frame/quotient and Lie-group interfaces. For an ineffective presentation apply
   this construction only to its effective reduction for coarse-space purposes; its kernel
   fixes object frames and cannot be discarded in the original groupoid, its bundles or
   integration.

6. Construct the coarse diffeology using native
   [`DiffeologicalSpace`, `Diffeology.IsPlot`, `DSmooth`, `dTopology` and
   `IsDTopologyCompatible`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Geometry/Diffeology/Basic.lean).
   First construct the manifold diffeology from smooth chart plots, proving chart independence
   and equality of its D-topology with the stated manifold topology. For a finite smooth
   action on `U`, construct the quotient diffeology on the native orbit carrier: a map from
   a Cartesian test space is a plot precisely when it locally lifts to a smooth plot of
   `U`. Use native `DiffeologicalSpace.ofCorePlotsOn` to construct the structure and prove
   the required generated/coinduced-plot lemmas. Prove constant, reparametrization and locality laws, smoothness and the subduction
   property of the quotient projection, and the descent criterion for a function out of
   the quotient to be `DSmooth`. Prove its D-topology equals the ordinary quotient topology.
   Supply open restrictions, common refinements and the finite-product comparison, proving
   topology compatibility for these models rather than assuming D-topology preserves
   arbitrary products or subspaces. O3.4 constructs the separate relative quadrant adapter.

   Glue the finite-chart quotient plots to the coarse space of a presentation. Prove Morita
   independence and functoriality for the actual generalized maps of O1, including natural
   isomorphisms and compositions. Construct the local linear-quotient identifications for
   the effective reduction. Compare this coarse local-model notion with the effective
   finite-linear-subgroup formulation in
   [Eltschig's existing diffeological development](https://github.com/peabrainiac/lean-catdg/blob/1ee4a2614b033dd1b4aded95759eb31eb9b0fbf4/CatDG/Diffeology/LocallyModelled.lean).
   This comparison concerns the underlying coarse smooth space. Keep the retained-arrow
   presentation as the orbifold carrier: identical coarse diffeologies do not determine
   ineffective isotropy, its representations or weighted integration. Compare its fixed
   dimension-n formulation per Γ_eff^(n), not on a mixed-dimensional disjoint union.

## O3. Coarse triangulation, finite covers and boundary models

1. Prove the Yang/Cairns route for a proper locally free smooth action of a compact Lie
   group on a separable metric manifold, with finite stabilizers. Use SBC slices and O2.1's
   finite linearization to prove local finiteness of the needed orbit types and construct
   regular locally-polyhedral slice/join charts with frontier compatibility. Own the full
   Cairns locally-polyhedral triangulation proof needed by Yang's reduction, including
   locally finite construction, relative subdivision/gluing and its realized homeomorphism.
   Apply it separately to each `(F_n,O(n))`; take their dimension-indexed disjoint union.
2. Transport this triangulation to the coarse space and construct atlas-subordinate stellar
   refinements. Closed simplices and sufficiently small star closures lie in designated
   charts; isotropy is constant on simplex interiors, with face subgroup inclusions and
   conjugation maps. Prove the simplex/star lift homeomorphisms and their compatible
   restrictions. Lift to the original ineffective charts with their full groups. Prove
   local finiteness and compactness-implies-finiteness. This construction precedes descent
   and duality and does not use those comparisons to establish triangulation.
3. On each dimension-n coarse component construct a locally finite barycentric open-star
   cover of multiplicity at most n+1, with its actual intersection/refinement diagram.
   Supply chart models, contractible lifted intersections with equivariant contractions
   whenever used, centred isotropy-fixed charts for the required point-local models,
   isotropy maps and commuting restrictions. Its Čech complexes use products for cochains
   and direct sums for chains. Fix a total order on the vertices and first use strictly
   increasing-index Čech cochains; equivalently construct the alternating normalized
   complex. Multiplicity bounds its horizontal degree by n. For unrestricted ordered
   tuples, including repetitions, construct the normalization/alternation chain maps and
   homotopies before applying that bound. Construct small-chain augmentations,
   cover/refinement homotopies and singular/cellular comparisons. Compact coarse space
   gives a finite cover/finite CW model. For an open U in the coarse space reapply O3.1–3
   to `Γ|q⁻¹U`, whose dimension-n frame manifold is the open O(n)-invariant restriction of
   F_n. Such an open need not be a subcomplex of the previous triangulation. There is no
   globally uniform dimension bound
   across unbounded-dimensional components; apply the construction componentwise and use
   the actual component product/sum decompositions. The coarse CW model is not a finite CW
   model of BΓ, which retains finite-group integral cohomology.
4. For O1.6's global collared domains construct face-adapted relative triangulations using
   compatible collars/doubling and the additional relative locally-polyhedral gluing proof.
   Prove each labelled face is a subcomplex after refinement, and obtain finite CW pairs in
   the compact case. Construct the quadrant diffeology by locally smooth extension plots;
   prove its D-topology equals the given relative topology and prove the smooth-extension
   criterion relating DSmooth to the manifold-with-corners chart notion on these models.
   Supply the face-preserving gluing/refinement and finite-product laws. Neither this
   quadrant smoothness theorem nor the relative triangulation is inferred from Yang's
   boundaryless result. Parameter coordinates have trivial isotropy and face swaps are excluded.
5. On O1.6's existing products and face/collar maps construct the outward-normal-first
   product orientations and their index-transport laws. Prove codimension-two oriented
   face cancellation and the two interval-end signs. Integral Stokes identities belong
   to O5.2. Reflection strata of a
   boundaryless quotient remain singular strata, not designated boundary faces. Smooth
   transverse parameter families use this carrier and its actual collar hypotheses.

## O4. Orbibundles, forms and the finite-atlas comparison

1. Define real/complex finite-rank orbibundles and principal bundles as ordinary bundles on
   objects with coherent smooth arrow actions. Construct pullbacks on refinement spans and
   generalized maps, tensor/dual/exterior operations, metrics, connections, sections and
   their Morita equivalences. Include nontrivial representations of ineffective kernels on
   fibers. The coarse total space need not be a vector bundle and invariant sections need
   not give an invariant local frame. Construct equivariant connections from ordinary local
   frames, SBC B3's affine connection/existence contract, O2.4 finite averages and
   invariant partitions, without that false frame assumption. Use SBC B4 for curvature,
   Bianchi and connection pullback; the orbifold descent equations are proved here.
2. Define invariant forms by `s*ω=t*ω`, with the actual manifold exterior derivative, wedge,
   contractions where defined and pullbacks. Prove Morita descent and chain-level maps.
   Support is measured in the coarse space. Compact-support pullback requires the displayed
   coarse/support map to be proper on the relevant support. Construct extension by zero for
   compactly supported forms on open suborbifolds, restriction and relative complexes,
   Mayer–Vietoris and their support maps. For `R→point`, pulling back the function `1` does
   not preserve compact support, so no arbitrary-map compact-support statement is used.
3. **O4-N: the classifying model.** Define BΓ primarily as the fat realization of the
   topological nerve, with the inherited topology on every composable-arrow manifold and
   its actual face maps. Define `q:BΓ→|Γ|` by the orbit of any vertex. For saturated open U,
   prove its preimage is precisely the fat realization of the full restricted nerve, as a
   subspace with the same quotient topology. This open-restriction equality is primary.
   Consume O4-T's single generic owner of good-degeneracy/NDR lemmas for these manifold nerves, the canonical fat-to-thin weak equivalence and the comparison with realization of diagonal objectwise Sing. Apply its naturality, product and realization/diagonal laws to O4-N's primary fat model and its coarse restriction maps. The topological-nerve adapters are constructed in O4-T; a discrete nerve realization is not substituted for these manifold nerves.

   Prove realization descent for the Čech nerve of a numerable surjective submersion: use
   actual local sections, a subordinate locally finite partition of unity and barycentric
   contraction to construct the augmentation weak equivalence and its homotopies. Apply the
   bisimplicial realization comparison to common refinements of principal bibundles, including
   their required auxiliary submersion-pullback Lie groupoids. Obtain Morita weak equivalences
   with refinement/composition coherence. The auxiliary groupoids need not be étale; their
   nerve good-degeneracy and numerability premises are constructed here in precisely this
   use. Compare a finite-action chart with `EG×_G U`. For any invariant contractible U,
   the projection `EG×_G U→BG` is a weak equivalence, by its associated-bundle contractible
   fiber and the constructed fibration comparison. A fixed point x with an equivariant
   contraction to x is a sufficient local model that additionally identifies this G with
   Γ_x and supplies a specified equivalence with BΓ_x. No necessity assertion about fixed
   points is used.
4. **O4-S: locally finite descent.** On every dimension-n component and every open subset,
   reapply O3's bounded-multiplicity locally finite open-star construction to that open
   restriction, using full restricted subgroupoids
   and O4-N's actual preimage maps. Form the two augmented Čech/singular cochain double
   complexes with products over strictly increasing intersections, horizontal degree0
   through n after O3.3's normalization, and
   `d_tot=δ+(-1)^p d`. Construct small-chain/subdivision augmentations, common-refinement
   maps and actual cochain homotopies. The finite horizontal filtration proves the
   quasi-isomorphisms without a cohomology-of-exhaustion or inverse-limit assertion.
   Local finite-group averaging and the centred contractions identify q* on each local
   cohomology group over ℚ/ℝ. Prove the global ring isomorphism
   `q*:H*(|Γ|;R)≅H*(BΓ;R)` and the chain/homology comparison, using direct-sum chain
   totalizations rather than an unrestricted coefficient duality shortcut. Prove cup and
   Alexander–Whitney compatibility with total product sign `(-1)^(q p')`.
   Apply the same absolute theorem to `|Γ|\K` for every closed K, and the pair long exact
   sequences/five lemma to obtain the relative isomorphism for that K. Apply componentwise
   product/sum decompositions when dimensions vary. This finite-atlas/local-finiteness
   adapter uses AT's generic chains; its local and comparison steps are proved in the clauses below.

   **O4-P: collared pairs.** For every O1.6 carrier construct the actual pair map
   `q_D:(BΓ_D,BΓ_∂D)→(|D|,|∂D|)` and prove its homology and cohomology isomorphisms over
   ℚ/ℝ, with the descended orientation coefficients under the stated local-orientability
   hypothesis. Use O3.4's face-adapted star covers on D and the closed union of faces,
   their intersection maps and O1.6's closed-face NDR/realization comparison. The lifted
   intersections and their boundary-star restrictions have the finite-action contractible
   or averaged-acyclic models constructed there. Apply the same finite-horizontal
   augmentations to get both absolute comparisons, then the natural pair LES and five
   lemma. Construct boundary-map, cup/cap, refinement and all labelled-face compatibilities.
   This is a theorem for the closed pair, not an application of the saturated-open equality.
   O2.3's equality of ambient and face ineffective kernels supplies the same k on the
   boundary and interior in every later weighted boundary equation.
5. **O4-R: forms and descent.** On those same covers construct the invariant-form Čech
   double complex, finite averaged Poincaré contractions and locally finite partition
   homotopies. Construct the zigzag to the constant Čech complex and O4-S singular cochains,
   with actual maps, products, common-refinement and pullback homotopies. Use the bounded
   horizontal filtration on noncompact opens as well. Construct levelwise smooth-singular
   integration and its realization/Eilenberg–Zilber comparison when using forms on the
   manifold nerve. A coarse singular simplex is not assumed globally smoothly liftable.
6. Relative pairs use the actual O1.6/O3 collared domains. Define coarse-compact classifying
   support by `H^*_{c,q}(BΓ;R)=colim_(K compact in |Γ|)H^*(BΓ,BΓ\q⁻¹K;R)` and the actual
   relative restriction maps. O4-S proves q* for each closed K before taking this compact
   colimit. At fixed K the form model is the actual mapping-fiber complex
   `Cone(Ω_inv(X)→Ω_inv(X\K))[-1]`, with its native cone/shift signs and comparison map
   to relative cochains. It is not the complex of smooth forms supported in K. Construct
   these maps for every K, then the compact-K colimit and its comparison with compactly
   supported invariant forms using partitions and extension by zero. Prove all support
   enlargement, restriction and proper-support pullback squares. The map q need not be proper;
   this is not ordinary compact support on BΓ.
   Pullback with compact support requires the displayed coarse map to be proper on that
   support. Distinguish full cochain products from compact-support sums. No interchange of
   exhaustion cohomology with a limit is part of this construction. For locally orientable
   presentations construct the descended coarse orientation line and the same comparisons
   with that coefficient; its isotropy-triviality hypothesis is retained throughout.
7. **O4-K: the represented bundle.** From an arrow-equivariant bundle construct the actual
   topological vector/principal bundle `E_B→BΓ`, using nerve-level vertex pullbacks and arrow
   identifications. Prove local triviality/numerability on fat realization via the specified
   local-section/barycentric covers, compatibility with diagonal-Sing comparison and
   pullback/refinement/Morita laws. Nontrivial ineffective kernel representations remain in
   E_B. Consume CC/TopK ordinary classes on this represented bundle. State precise descent
   conditions for a coarse bundle; a rational cohomology isomorphism alone is not descent.
8. **O4-W: simplicial Chern–Weil comparison.** For an invariant connection on an orbibundle,
   pull the bundle to each vertex of N_pΓ and use actual composite-arrow bundle isomorphisms
   to identify them with the vertex0 pullback. On `Δ^p×N_pΓ` form the barycentric affine
   connection `Σ_i t_i∇_i` using SBC B3/B4. For an invariant connection these arrow bundle
   isomorphisms identify every ∇_i with ∇_0; the barycentric connection is then constant
   in simplex directions. Prove compatibility under every face and degeneracy, including
   the vertex0 gauge transformation; apply CC C4.1's invariant polynomials to its curvature.
   Construct Chern–Simons forms for changes of connection and their face/degeneracy and
   higher-parameter transgression identities. Integrate over oriented simplices to the
   total complex with O4-S's differential/product signs and compare to singular cochains.
   Construct the numerable classifying map of E_B to the stable ordinary classifier.
   On each component of fixed object dimension and bundle rank, choose Stiefel/Grassmann
   stages N(p) on its finite-dimensional simplicial cover, growing
   with p and, where needed, with the finite subdiagram under comparison. Construct
   finite-stage classifying maps and connection comparisons using the finite-dimensional
   paracompact cover/order bound, relative face extension and common refinements; prove
   their stabilized face, degeneracy and higher-concordance compatibility. No single
   finite universal bundle is asserted to classify E_B over the whole infinite realization.
   Apply CC C4.3's degreewise universal Chern–Weil/stable compatibility and the explicit
   affine transgression to prove the resulting total class is the pullback of
   the ordinary universal characteristic class. This owns the simplicial-to-universal
   bridge, not a deduction from agreement on small charts. Prove refinement/Morita/products
   and support-compatible laws. Integral characteristic classes and kernel representations
   remain in E_B even when their real Chern–Weil images vanish.

### O4-T. Thin/CW topology and normalized principal-torus comparison

The generic fat/thin and diagonal comparison block treats Hausdorff second-countable proper étale presentations, including ineffective isotropy, the O1.6 globally collared corner and labelled face/intersection models, and their stated closed face-union restrictions. First O4-N constructs its primary fat carrier and coarse restriction maps. This O4-T block then constructs the good-degeneracy/proper-simplicial comparison on those underlying nerves, and O4-N consumes the resulting natural comparison maps. Keep `B_fat(S)=BΓ`, the thin model `B_top(S)` and the diagonal-Sing CW model `BS` below distinct. The unit subspace is open by étaleness and closed by Hausdorffness; finite unions of unit-insertion images give clopen latching inclusions, also for these face restrictions. Own the corresponding proper-realization and levelwise-Sing comparison, using the nerve/counit formulas and the NDR pair data of O1.6. Export compatibility with the specified collars, closed faces, products, saturated restrictions and refinements. This generic block uses no boundaryless local-stalk or sheaf lemma.

The subsequent thin-model local-contractibility, sheaf, form and normalized principal-torus supplement retains its stated boundaryless hypotheses, except where a separate torus bar-space argument is given. Compare its induced singular/cohomology/form maps with the already constructed O4-S/R maps by actual cochain homotopies. The finite-star O4-S proof is independent of this later thin-model sheaf route. Thus the early fat carrier, generic realization comparison and later boundaryless supplement have distinct proof phases.

For the principal-torus specialization fix a compact connected abelian Lie group T with a supplied continuous character-basis isomorphism `T≃(S¹)^m`, m≥0. Prove basis-change independence and naturality for the specified torus homomorphisms. CT T1 supplies this actual datum in its applications; no period/isogeny theorem is reproved here. O4-K's general represented-bundle scope remains unchanged. Compare its fat principal T-bundle with the thin bundle below by the canonical equivariant nerve map: after proving both bundles locally trivial, its map into the pullback over the same base is a principal-bundle isomorphism. Pulling to BS therefore gives the same represented bundle and integral character classes. No arbitrary realization-pullback theorem is assumed.

Apply componentwise when dimensions vary, with the actual countable coproduct/product cochain laws. The generic nerve and realization comparison below retains the O1.6 closed-face/corner/NDR scope. The later paracompactness/local-stalk/sheaf and horizontal form arguments are stated for boundaryless nerve manifolds and separately the specified torus bar spaces. The horizontal form contraction uses O2.4's actual proper-groupoid cutoff/counting-Haar extension. None of these generic constructions consumes CT integration, convexity or DH. R3's Hamiltonian input and T1's character datum are supplied only when instantiating the later application.

For a presenting proper étale groupoid S, construct its topological nerve N•S. Each N_pS is the
space of composable p-tuples with its actual manifold/subspace topology. Consume HomotopySpheres §3A's compactly generated category, k-ification, products, exponentials and
sequential-colimit interfaces; do not define a second compact-generation carrier. This O4 supplement owns the
geometric nerve realization and its groupoid-specific topology. Define the ordinary
(topological, or “thin”) nerve realization B_top(S)=|N•S| in compactly generated spaces, and its
coarse map q:B_top(S)→|S|. For every saturated open V⊂|S|, prove the exact identity
q⁻¹(V)=B_top(S|V). Do not assert this identity for the preimage under the singular-diagonal
CW model below.

Apply the native singular functor levelwise; its preservation of the fiber products defining
the nerve identifies the corresponding singular nerve levels; the resulting bisimplicial set is
Sing(N•S), and D=diag Sing(N•S). Set BS=|D| using AlgebraicTopology 4.7's
simplicial-set realization and CW structure. Define a natural simplicial comparison
D→Sing(B_top(S)): an n-simplex σ:Δⁿ→N_nS is sent to t↦[σ(t),t] in B_top(S). Prove the face
and degeneracy identities and prove its realization ε:BS→|Sing(B_top(S))| is a weak equivalence:
identify realization of a bisimplicial set's diagonal with its iterated realization. Prove the
proper-simplicial-space lemma needed here: realization preserves levelwise weak equivalences for a proper simplicial space when each
latching inclusion L_nX→X_n is a closed cofibration in compactly generated spaces. For N•S, L_nS is the finite union of degeneracy images. Each degeneracy inserts a unit arrow, whose image is open by étaleness and closed by Hausdorffness; hence L_nS is clopen and L_nS↪N_nS is a closed cofibration. For p↦|Sing(N_pS)|, the latching object is the finite union of degeneracy-image subcomplexes, so its inclusion is a subcomplex cofibration. Apply
CharacteristicClasses C1.2's counit weak-equivalence theorem levelwise to N_pS. These generic fat/thin and diagonal comparisons apply to the preceding collared corner and face models, with their specified relative pairs, independently of the following boundaryless theorem. For numerability and the sheaf comparison, prove a topology lemma for every proper étale Lie groupoid whose object and
arrow spaces are Hausdorff, second-countable manifolds; apply it to S, every restriction S|V, the
finite action groupoids G⋉B below, the action groupoid S⋉P, the countable atlas
refinement S[U], and S[U]⋉P|U. Prove the latter two eligible by the proper-map
base-change square and countable chart atlas. Do not apply the étale lemma to the
one-object torus groupoid T, whose source map is not étale when dim T>0; the torus bar realizations
have their separate good-simplicial-manifold argument below.

For each eligible groupoid, build B_top(S) with its weak compactly generated realization topology.
Prove its paracompact Hausdorff topology using the following closed-attachment argument for the stated skeletal filtration. Write each skeletal stage as the
pushout X_n=X_(n−1)∪_{f_n}Y_n, where Y_n=N_nS×Δ^n and the closed attaching subspace is
A_n=(L_nS×Δ^n)∪(N_nS×∂Δ^n). Units are open by étaleness and closed
by Hausdorffness; L_nS, the finite union of degeneracy images, is therefore clopen.
Thus the nondegenerate locus is also clopen, as needed for the boundary collars. The
second-countable Hausdorff manifold N_nS times the compact simplex is normal and Lindelöf, and A_n
is closed. Prove the exact pushout lemma: if X and Y are normal T1, A⊂Y is
closed, and f:A→X is continuous, then X∪_fY is normal T1 and X embeds as a closed subspace.
For disjoint closed sets F,G in the pushout, choose a Urysohn function on X equal to 0 on F∩X
and 1 on G∩X. On the closed subset A∪F_Y∪G_Y of Y, paste its composite with f with the values 0
on F_Y and 1 on G_Y; verify agreement on overlaps using F∩G=∅, then extend by Tietze to Y. This
gives a continuous separator on the pushout. Prove the closed embedding and T1 assertions directly
from the pushout topology. This gives normal T1 stages inductively.

Prove the weak-colimit version explicitly. The raw skeletal colimit is normal T1: for disjoint
closed F,G, construct compatible functions X_n→[0,1] equal to 0 on F∩X_n and 1 on G∩X_n. At
each step extend from the closed subset X_n∪(F∩X_(n+1))∪(G∩X_(n+1)) of the next normal stage by
Tietze; the prescriptions agree on overlaps. The weak final topology makes the resulting function
continuous. The colimit is Lindelöf as a quotient
of the countable coproduct of the Lindelöf spaces Y_n. Show that compact subsets of the raw colimit
lie in a finite stage: otherwise choose distinct x_n in that compact set outside X_n,
passing to increasing stage indices also containing all earlier chosen points. For each fixed
stage, this set and every subset of it meet the stage in finitely many points, hence in a closed
set by T1. The weak topology therefore makes the chosen set closed and discrete, contradicting
compactness. Since stages are k-spaces, this finite-stage compactness
criterion proves the raw weak topology is already compactly generated. Thus the actual
compactly-generated realization is this normal Lindelöf T1 space. Own the short
regular-Lindelöf paracompactness proof: given an open cover, choose open V_x with
closure(V_x) inside one cover member U_x. Select a countable subcover V_n by
Lindelöfness. The open sets `W_n=U_n\⋃_{k<n}closure(V_k)` refine the original
cover and cover by the least index whose closure contains a point. At a point of
V_m, this family meets only indices n≤m, hence is locally finite. Normal T1
also gives Hausdorffness. This proves paracompact Hausdorffness for the stated realization.
Supply the same closed-attachment and colimit proof for the torus bar realizations below,
whose levels are compact Hausdorff manifolds and whose latching inclusions are closed.
This proves their paracompact Hausdorff topology, without claiming a collar of their
union of degeneracy subtori or using local contractibility of the torus bar space.

For local contractibility of the eligible étale nerves, separately construct small
neighborhoods by collars. Start with a point and any prescribed open neighborhood W in
the realization. Prove inductively that each finite stage admits a contractible
neighborhood of the point inside W∩X_n, starting with manifold chart neighborhoods
and using the nondegenerate-simplex boundary collars at each attachment. Pull this
neighborhood back along every later attaching map. Use paracompactness and a partition
of unity on each attaching locus to choose a continuous positive collar depth so
that every extension stays inside W and over the preceding contractible neighborhood.
Group all collar branches under the inherited neighborhood; the clopen nondegenerate
locus ensures the ordinary simplex-boundary collars apply. Prove the resulting
recursive neighborhood is open in the weak topology and lies inside W. Contract each collar to the preceding-stage neighborhood,
then contract there; concatenate the stagewise contractions on [2^(−n−1),2^(−n)]. Verify
continuity as follows. Work in compactly generated spaces. Since [0,1] is locally compact Hausdorff, −×[0,1] is left adjoint to the compact-open mapping-space functor and therefore preserves colimits; the canonical comparison is the natural homeomorphism (colim X_n)×[0,1]≅colim(X_n×[0,1]). Apply HomotopySpheres §3A’s compactly generated product interface to this skeletal diagram, rather than assuming an ordinary final-topology product formula. For the concatenation, define stagewise homotopies compatibly on the skeletal inclusions and matching endpoints; verify each finite-stage restriction is continuous and stabilizes near the accumulating parameter value t=0. The compactly generated colimit/product comparison then gives continuity of the induced homotopy. This proves local contractibility under the stated hypotheses.
Prove the same comparison after restricting to every saturated open V. Own the restricted
realization-comparison proof under the same properness hypotheses. Since both source models
are CW, the comparison is a homotopy equivalence by Whitehead. The orbit projection on N_pS
induces D→Sing(|S|); its realization followed by the counit defines p:BS→|S| and agrees with
q∘c∘ε on the nose, where c:|Sing(B_top(S))|→B_top(S) is the
realization-singular counit. For the local argument, use q⁻¹(V)=B_top(S|V) and the
restricted weak-equivalence square; do not identify p⁻¹(V) with |diag Sing N•(S|V)| without
proving a small-singular-simplices comparison.

Prove presentation/Morita comparison for this model by the double nerve of an atlas refinement or
Morita bibundle: its augmented Čech resolutions have local sections and numerable covers.
Prove their realization equivalences by the augmented numerable Čech-resolution theorem described
below, then compare the double and single nerves by diagonal/iterated realization. A levelwise
covering map alone is not a weak equivalence. State and prove the local hypotheses used
(properness, étaleness, Hausdorff second-countable object and arrow manifolds, and numerable atlas
refinements). Sing preserves the fiber products defining N_pS, so
D is also the diagonal nerve of the simplicial groupoid Sing(S); this is the model in
van den Berg–Moerdijk's BG=δ*(NG). These groupoid-specific adapters are targets here, not assumed
native simplicial-topological realization APIs.

Use ordinary singular cohomology from AlgebraicTopology 6.1. Own the bisimplicial Eilenberg–Zilber
comparison: for Y_{p,q}=Sing_q(N_pS), construct the natural Alexander–Whitney and shuffle maps
between normalized chains on diag(Y) and the total complex of the normalized bicomplex, and prove
the chain-homotopy equivalence. Its cohomological spectral sequence has
E₁^{p,q}=H^q(N_pS;R) and converges degreewise to H^{p+q}(BS;R); prove the first-quadrant
convergence and product/naturality statements. This is the required comparison to Tot, rather than
an unsupported direct descent over |S|.

For rational coarse cohomology, take saturated open slice neighborhoods V with S|V Morita
equivalent to a finite group G acting linearly on a ball B. Prove the action-groupoid homeomorphism
B_top(G⋉B)≅EG×_G B by identifying N_n(G⋉B)=G^n×B with the diagonal quotient of
E_nG×B, E_nG=G^(n+1). The radial contraction of B is G-equivariant, so EG×_G B≃BG;
finite-group averaging gives H^j(BG;ℚ)=0 for j>0 and H^0=ℚ. Separately B/G is radially
contractible, but it is not the model for the B_top(S) stalk. The required stalk calculation is
H_sing^j(B_top(S|V);ℚ)≅H^j(B(S|V);ℚ)≅H^j(B(G⋉B);ℚ)≅H^j(EG×_G B;ℚ),
using the restricted realization/counit and Morita cohomology comparisons. It is ℚ for j=0 and zero
for j>0, including ineffective finite isotropy. Use the topology lemma above for paracompactness and local contractibility of B_top(S); the
finite-isotropy slice models below compute cohomology stalks only and supply no topology of the
whole realization. Construct a countable numerable saturated slice basis on |S|. O4-T owns the local stalk
calculation on the original groupoid realization, the singular-cochain sheaf resolution and its
acyclicity there, and the derived-direct-image/Leray argument for q:B_top(S)→|S|. CC C1.2b
supplies its Čech/singular comparison and locally acyclic sheaf resolution on a Hausdorff CW
representative; its CW-type hypothesis does not transfer stalkwise local acyclicity to the
original groupoid space. Verify the comparison hypotheses on both spaces and apply the generic
cohomology comparison only after O4-T's local stalk and topology arguments are established.
Construct
the Leray spectral sequence for q:B_top(S)→|S| from the derived direct image of the constant
rational sheaf. Compute stalks of R^j q_*Q from the saturated slice basis: Q in degree zero and
zero for j>0. Use the established sheaf-to-singular comparison on both spaces; the Leray sequence then gives q*:H*(|S|;Q)≃H*(B_top(S);Q), including ineffective isotropy. Use a Čech spectral sequence only when every finite intersection in its chosen cover has been
proved to retain the required slice model. Do not identify p⁻¹(V) with a restricted diagonal realization. Apply
CharacteristicClasses C1.2's unrestricted counit weak-equivalence theorem to
c:|Sing(B_top(S))|→B_top(S); together with ε and the rational coarse comparison this proves
p*=(q∘c∘ε)* is an isomorphism.

For the orbifold de Rham theorem let Ω^q(S)=Ω^q(S₀)^S be O4.2's invariant-form complex and form the
bicomplex C^{p,q}=Ω^q(N_pS), with horizontal differential the alternating sum of nerve pullbacks, vertical differential the de Rham
differential, and total differential d_h+(-1)^p d_v on bidegree (p,q). Consume O2.4's cutoff and its explicit augmented-nerve averaging contraction, with the same
counting Haar convention. Verify its restriction/refinement naturality on the nerve maps used
here and the bidegree/total-complex signs; its degree-zero kernel is the arrow-invariant forms
Ω^q(S). O4-T assembles the bicomplex comparison by consuming O2.4’s augmented-nerve averaging contraction and verifies its naturality, signs and invariant-form kernel. Vertically, consume DifferentialGeometry 8.4–8.5's manifold de Rham integration, Stokes,
quasi-isomorphism and smooth-to-continuous singular comparison on each N_pS. Verify the required
smooth face maps and assemble DG's natural comparison into this bicomplex; do not reprove its
manifold de Rham or integration theorem here. Compare the resulting total complex with the
singular-cochain Tot above by this levelwise comparison and the bisimplicial Eilenberg–Zilber
comparison. This proves H*(Ω(S))≃H*(BS;ℝ). This O4 supplement owns the bicomplex assembly, proper-groupoid
averaging contraction, product and atlas/Morita naturality; invariant partitions of unity and
finite-isotropy averaging remain explicit parts of those groupoid-specific proofs.

For an orbifold principal torus bundle P→S, choose a countable numerable cover U→S₀ by
trivializing charts and form its groupoid refinement S[U], with objects U and arrows
U×_{S₀}S₁×_{S₀}U; source, target and composition are induced by those of S. The chosen local
sections give the continuous transition functor F:S[U]→T (the one-object groupoid of T): for an
arrow represented by (g,u₀,u₁), define F by the unique equation
g·s_i(u₀)=s_j(u₁)·F(g,u₀,u₁), where the left S-action commutes with the right T-action. Prove
continuity and, for composable arrows, F(g₂g₁)=F(g₂)F(g₁).

Prove B S[U]→BS is a weak equivalence by the double-nerve/Morita argument. Do not claim that
U→S₀ is itself a levelwise weak equivalence. Use the numerable Čech-resolution theorem for a map
with local sections: the augmented Čech nerve realizes to a homotopy equivalence, proved using the
partition-of-unity contraction (or the contractible fiber nerve and extra degeneracy); compare the
double nerve with the two groupoid nerves by diagonal/iterated realization. This gives a homotopy
equivalence of the CW models. Define φ:S[U]→S as the projection and
Bφ=|diag Sing(N•φ)|. The classifier κ defined below is intrinsic. The bundle comparison below and
C1.1b uniqueness show that the class of the transition-functor comparison κ_ref
is independent of the refinement, including comparisons through common refinements.

For an orbifold principal torus bundle P→S, let S⋉P be its action groupoid and set
E_S=|N•(S⋉P)|→B_top(S). The left S-action commutes with the free right T-action on P. Prove
S⋉P is proper étale with Hausdorff second-countable object and arrow manifolds: its source is the
pullback of the étale source of S, and properness follows by pulling compact source-target data
back along P→S₀. Apply the groupoid topology lemma to E_S and B_top(S). The levelwise quotient
N_n(S⋉P)/T≅N_nS is canonical; prove quotient commutes with the realization colimit in compactly
generated spaces, giving E_S/T≅B_top(S), and prove the induced T-action is free.

Prove E_S→B_top(S) is a numerable principal T-bundle by the following explicit torus argument,
using the torus bar construction and its explicit free action, separately from the étale-nerve lemma. The
space E_S is paracompact Hausdorff, hence normal. Each orbit eT is closed and isomorphic to T.
Choose a character basis T≅(S¹)^m. Extend the coordinate characters on eT to bounded complex
functions f_j on E_S by Tietze extension of real and imaginary parts. Average
F_j(x)=∫_T χ_j(t)^(−1)f_j(x·t)dt using normalized Haar measure; prove continuity and
F_j(x·g)=χ_j(g)F_j(x), while F_j(e)=1. On the invariant neighborhood where all F_j are nonzero,
normalize their phases to an equivariant map u into T. The map x↦x·u(x)^(−1) is constant on
orbits and descends continuously through the quotient map, giving a local section and a product
trivialization. Prove these neighborhoods cover the quotient; paracompactness then gives numerability.
Include the m=0 case. Write c_S=c_{B_top(S)} and let E_join→B_join(T) be
C1.1b’s Milnor universal bundle. Define κ:BS→B_join(T) directly as the
classifier of the numerable bundle `(c_S∘ε_S)^*E_S`. Prove the following
atlas/transition-functor comparison theorem for this same intrinsic classifier.

Over the groupoid refinement S[U], the levelwise nerve identity is
N•(S[U]⋉P|U)=N•S[U]×_{N•S}N•(S⋉P). The induced T-equivariant map from E_{S[U]} to the
pullback of E_S over B_top(S[U]) is over the same base and between principal T-bundles, hence is
an isomorphism; prove that the map and comparison are the ones induced by the displayed levelwise
identity, using local trivializations rather than a general realization-pullback theorem. The
transition functor F:S[U]→T from the chosen local sections also gives a strict levelwise
T-bundle isomorphism from N•(S[U]⋉P|U) to the pullback of the T-bar universal bundle along F.
After realization, the induced equivariant map between the resulting principal bundles over the
same base is again an isomorphism. The simplex maps describe transport; the displayed levelwise bundle isomorphism supplies the bundle-descent comparison.

The torus bar groupoid is not étale. Give its universal bundle separate topology: its bar levels
T^n and total-space levels T^(n+1) are compact Hausdorff manifolds with closed
degeneracy/latching inclusions (finite unions of coordinate subtori).
Apply the closed-attachment realization lemma to prove Hausdorffness and
paracompactness of the weak colimit; no collar of the latching subtori is assumed. The total bar realization is contractible
by the extra degeneracy, the T-action is free, and the quotient is B_top(T); prove numerable
principal charts by the same averaged-character argument. Pull this actual bar bundle back along
c_{B_top(T)}:|Sing(B_top(T))|→B_top(T). On this CW base define κ_T:|Sing(B_top(T))|→B_join(T)
to classify the pulled-back bar bundle, with the actual bundle isomorphism
`κ_T^*E_join≅c_{B_top(T)}^*E_T` over that same CW base. Classification supplies
this isomorphism; weak contractibility of total spaces alone does not. C1.1b supplies join classification and CW numerable-bundle
classification; C1.5 supplies finite torus models and normalized dual-character generators.

Choose r:BS→B S[U] as a homotopy inverse of the refinement equivalence and
set κ_ref=κ_T∘|Sing(B_top(F))|∘ε_{S[U]}∘r. Prove `κ_ref≃κ` by the
following bundle comparison and C1.1b uniqueness on BS. Write E_T for the
T-bar bundle and use the same counit shorthand for S[U] and T. The strict nerve maps and the local
trivializations give E_{S[U]}≅B_top(F)^*E_T and
E_{S[U]}≅B_top(φ)^*E_S, both as bundles over B_top(S[U]).
Naturality of ε and the realization-singular counit, together with
Bφ∘r≃id on the CW model BS, gives the well-typed pullback chain
κ_ref^*E_join≅(B_top(F)∘c_{S[U]}∘ε_{S[U]}∘r)^*E_T
≅(c_{S[U]}∘ε_{S[U]}∘r)^*E_{S[U]}
≅(B_top(φ)∘c_{S[U]}∘ε_{S[U]}∘r)^*E_S
≅(c_S∘ε_S∘Bφ∘r)^*E_S≅(c_S∘ε_S)^*E_S≅κ^*E_join.
Use homotopy invariance of numerable bundles over the CW base for the last step.
No arbitrary realization-pullback assertion is used.

Let j_S:S₀→B_top(S) be the zero-skeleton inclusion and
ι:Sing(S₀)→diag Sing(N•S) send an n-simplex σ to its total degeneracy, the string of n
identity arrows at σ. This is a strict simplicial map. Set ĵ_S=|ι|. The degeneracy relation gives
ε∘ĵ_S=|Sing(j_S)| on the nose, and counit naturality gives
c∘ε∘ĵ_S=j_S∘c_{S₀}. Prove j_S^*E_S=P from the unique
nondegenerate-simplex normal form: an action-groupoid arrow (g,p) is an
identity exactly when g is, so the preimage of the zero skeleton is precisely P.
It follows that ĵ_S^*κ^*E_join≅c_{S₀}^*P over
|Sing(S₀)|. Thus the actual bundle comparison uses the global E_S and the strict object map; it
needs no Čech descent or refinement-compatible choice of homotopy inverse for the object inclusion.
The chosen r only enters κ_ref. Any two homotopy inverses are homotopic, and
κ_ref≃κ shows that its bundle class is independent of both r and the atlas.
The intrinsic κ and its Chern classes use neither choice.

Define `ET_model→BT_model` to be CC C1.5's actual colimit of `ET_N=(S^(2N+1))^m→BT_N=(CP^N)^m`, with its specified weak/CW and compactly generated comparisons. Consume C1.5's universal-bundle comparison `b_T:BT_model→B_join(T)`, its homotopy equivalence and `b_T^*E_join≅ET_model`; do not construct a second generic universal-model equivalence here. Choose its homotopy inverse r_T and set `κ_model=r_T∘κ`. Prove `b_T∘κ_model≃κ` and `κ_model^*ET_model≅κ^*E_join`. Identify this composite with the actual intrinsic κ and the displayed κ_ref construction by the explicit bundle pullback chain above and C1.1b's classification uniqueness on BS. Independence of r_T and compatibility with objects/refinements follow through these same bundle maps.

Transport C1.5's dual-character classes `h_i=−u_i` to B_join(T) through `(b_T^*)⁻¹`, and pull them back by κ; equivalently use `κ_model^*h_i`. Take their rational images and, using p*, their coarse rational images. Under O4-W's simplicial/universal Chern–Weil comparison, specialize to each dual-character line and prove the curvature class is the real image of this same integral class with SBC's 2π and dual-character conventions. Prove agreement with the intrinsic Milnor classifier, object pullback and every refinement. Rationality concerns these Chern classes, not arbitrary real two-form classes. O5 separately owns full-isotropy integration and Stokes; the classifying/cohomology/bundle argument does not consume that later theorem.

## O5. Weighted integration, Thom classes and rational duality

1. Construct the arrow-invariant orientation line and its orientation transport from DG.
   For an oriented orbifold and compactly supported top form define the local integral on
   `U/G` by `|G|⁻¹∫_U`, including the full ineffective kernel. Prove chart-change and
   isotropy-index formulas, partition/refinement and Morita independence, additivity and
   product/Fubini. Work over `ℚ` for rational classes and `ℝ` for forms; versions over a
   different coefficient ring state that every required isotropy order is invertible.
2. Prove the integral Stokes identity on O1.6's existing global collared domains and box
   products with the orientation/sign maps fixed in O3.5, using DG's boundary integration
   theorem. The identity includes both interval signs and codimension-two cancellation.
   Prove refinement/change-of-variables invariance. The trivial gerbe
   `K×N⇒N` has integral `(1/|K|)∫_N`; `[*/K]` has integral1 equal to1/|K|. These are
   orbifold integrals, not ordinary integration over the infinite CW space B(K).
3. **O5-L: local homology.** Prove the relative rational homology calculation for an
   orientation-preserving finite linear ball quotient and its punctured/sphere pair, from
   the admissible subdivision, equivariant chains and finite averaging. It has one oriented
   top generator and no other relative rational homology. Include the compatible half-space
   and labelled-corner pair calculations for the supplied global face carrier. An isotropy
   orientation reversal fails this hypothesis and is not repaired by calling the coarse
   singular locus a boundary.
4. **O5-A then O5-P: compact classes and duality.** Own the rational-homology-manifold
   extension of the compact-class lemma on O3's locally finite coarse complexes, using
   O5-L and only AT's generic excision, Mayer–Vietoris, cap and coefficient maps.
   For each compact K in a boundaryless dimension-n coarse component, prove
   `H_i(X,X\K;ℚ)=0` for i>n, injectivity of the degree-n restriction to all point-local
   classes on K, and existence of a unique class for each compatible local orientation
   section. Construct the class map and restriction/additivity laws by compact
   neighborhood subdivision and relative Mayer–Vietoris gluing; existence is a target,
   not inferred from matching stalks alone. Supply the corresponding orientation-line
   version using the coarse orientation local system already constructed in O4.6 under
   its local-orientability hypothesis. This constructs the local-to-global
   bridge beyond AT's manifold-specific theorem.

   From these compact classes prove rational cap duality by Mayer–Vietoris induction on
   the adapted neighborhoods, with direct limits over compact supports. Prove the compact
   boundaryless PD theorem and Poincaré–Lefschetz for O1.6's compact collared pairs, using
   collars for the boundary-relative class. Construct their actual fundamental classes,
   cap maps and perfect compact cup pairings over ℚ and ℝ. For a compact connected oriented
   component with generic ineffective order k, **define** the weighted BΓ fundamental
   class by `q_*[Γ]_orb=(1/k)[|Γ|]` through O4-S, and for a collared pair through O4-P.
   Prove compatibility with the boundary map using the same face kernel order from O2.3.
   The substantive normalization theorem is that evaluation under O4-R's de Rham comparison
   equals O5.1's chartwise full-isotropy integral. Prove it by comparing O5-L's local
   generator with DG's oriented chart generator and then partition/refinement and compact
   gluing. The weighted-class equation is its definition, not a substitute for this theorem.
   A noncompact component is used through
   compact-support comparisons; no ordinary noncompact fundamental class is asserted here.
5. **O5-T: Thom and wrong-way maps.** For an oriented rank-r orbibundle use its represented
   ordinary bundle `π_B:E_B→BΓ`. The Thom target is the actual pair
   `(E_B,E_B\0_B)` (equivalently its constructed disk/sphere bundle pair), and the
   isomorphism is `a↦π_B* a∪u` with degree shift r. Pullback to each ordinary oriented
   fiber has Thom generator1. Construct its form representative with compact vertical
   support, the zero-section Euler pullback, orientation reversal, products and excision.
   Combine vertical compact support with coarse-compact base support for the integration
   formula `∫_E π*α∧Φ=∫_Γ α`. In a U/G chart both sides use the same1/|G| factor, so the
   weights cancel; an effective/coarse re-normalization has its separate kernel factor.

   Own the equivariant tubular-neighborhood theorem for a representable proper smooth
   embedding with identified oriented normal orbibundle: construct invariant metrics,
   compatible normal exponentials and a positive invariant radius function, then prove
   the global open normal-neighborhood comparison with chart/refinement independence.
   For the collared carrier require neatness and compatible labelled-face collars.
   Use this actual tubular data and Thom excision to define the Gysin map. Proper oriented
   submersions with compact fibers use integration along fibers with stated vertical/base
   supports. Prove transverse base change, projection/products and refinement laws. A
   generalized map alone supplies neither tubular data nor a Gysin operation.

## O6. Maps, families and comparison laws

Prove bundle/form/cohomology functoriality for generalized maps and 2-isomorphisms, with the
actual common-refinement maps and higher composition laws needed for families. Prove the
relative and compact-support projection formulas under their stated properness/orientation
hypotheses. Construct parameter products and restrictions at all faces, naturality of Stokes,
Thom and Gysin comparison, and the corresponding collared-cobordism laws. Here a cobordism
is an O1.6 oriented carrier W with disjoint designated incoming/outgoing boundary unions,
actual face-presentation identifications with Γ_0 and Γ_1, and compatible collars; any remaining
faces and support restrictions are specified. The boundary orientation is outward first,
`∂W=−Γ_0 ⊔ Γ_1` on those designated faces. Require a closed coarse support that is compact
(or proper over a stated compact parameter support), restricts to compact supports on the
faces, and avoids any other faces. For closed forms whose degree admits Stokes, prove equality
of the outgoing/incoming supported integrals with these signs; relative cohomology and class
maps use O4-P and retain the same support data. Integration and the cohomology comparison
use the retained-arrow presentation
throughout, even when its coarse model is obtained by effective reduction.

For a supplied continuous equivariant family `p:Z→Γ₀`, construct O1.5's topological action
groupoid, chart pullbacks and overlap maps. For a supplied complex or nodal family retain
its actual local models, including `xy=a` where specified. Recover its actual fiber after pullback to an object chart;
its coarse forgetful fiber can be a quotient by automorphisms. Smooth transverse families use
O1.3. For supplied nodal families retain their singular fibers and their separate complex-domain
family carrier; construct the compatibility of the presentation maps without asserting that the
nodal fiber is a smooth orbifold. Domain deformation, map stability/slicing and virtual
obstruction/perturbation data are additional constructions of their respective theories.

## O7. Required examples and overlap comparisons

- A manifold with unit groupoid, a finite effective linear quotient, and a point with arbitrary
  finite isotropy. Test classifying/coarse comparison, isotropy, bundles and integration on
  each, including a nontrivial kernel representation over a point.
- Trivial finite gerbes over oriented manifolds; compute the weighted fundamental class,
  product/interval signs and characteristic-class comparison. Effective reduction preserves
  the coarse space but not these isotropy-sensitive objects.
- For the compact Hamiltonian locally-free quotient model of HamiltonianReduction R3, use R3’s O1.4 identification and compare its actual retained-group-element slice groupoid and refinement bibundles with O2.1’s finite linearized action charts and O2.2’s retained-arrow atlas charts. Compare the invariant/symplectic forms on the possibly ineffective HR model;
  no HR integral or characteristic-class construction is presumed. After CT T4's applications are constructed, compare the actual represented principal-torus bundles, dual-character classes, forms and weighted reduced volumes through O4-N/S/R/K/W/T and O5 on the same effective or ineffective presentation. This comparison is not restricted to effective inputs. For generic ineffective order k, compare effective reduction only through actual coarse/form and bundle data: for corresponding coarse forms prove `∫_effective=k·∫_full`, componentwise, while an isotropy-sensitive bundle need not descend. Symplectic descent, full reduced volume and common-weight examples remain CT applications. O7 uses the completed models and is not a prerequisite for O1–O5 or CT T4.
- Compare finite Fuchsian elliptic quotient charts with the corresponding finite-action
  orbifold charts and their orientation/area normalization. Cusp compactification and
  hyperbolic area/signature calculations remain in FuchsianOrbifolds.
- For any supplied stable finite-isotropy complex-domain chart groupoid, compare its complex
  orientation with O5 and its true chart-pulled-back universal family with O6. The input
  includes the actual moduli-specific deformation charts and properness proof. A prestable
  object with positive-dimensional automorphisms is not an orbifold merely by naming its
  coarse quotient. Similarly a nonregular stable-map space does not acquire a virtual class
  from these regular orbifold APIs.

## Construction order

O1.1–5 consume LGP carriers/maps and SBC slices. O2.1 supplies finite Bochner linearization and the finite metric/straightening averages used in O1.6. Construct O2.2's retained-arrow atlas, then O1.6's labelled collars and face restrictions before O2.3's face-kernel comparison. O2.4 supplies affine connection averaging and the proper-groupoid cutoff/averaging contraction consumed by the later O4-T form supplement. O4-N first constructs the primary fat carrier and coarse restriction maps. O4-T's generic proper-simplicial block uses that carrier and owns the fat/thin and diagonal-Sing comparison for the stated boundaryless and O1.6 collared corner/face models; O4-N then consumes those comparisons. Later O4-T topology/sheaf/classifier work compares the completed O4-S/R maps and is not a premise of the initial generic comparison.
Effective frames and the native coarse-diffeology adapter remain boundaryless O2 constructions; O3
builds coarse triangulation, relative pairs and cover diagrams without using rational coarse
cohomology or PD. O4 uses those covers and O2's finite/proper-groupoid averaging for local-to-global comparison, O4-P and the independent simplicial characteristic-class bridge. O4-T adds boundaryless thin-model topology/sheaf/nerve-form and normalized principal-torus comparisons on supplied torus data and compares them with primary fat O4-S/R/K/W maps without CT integration. The application order is R3's actual presentation, instantiated generic O1–O5, then CT's classes/volume/DH theorem; O7 follows both. T1 supplies the character datum at this instantiation, not CT's later integration or convexity. The descended coarse orientation line in O4.6 precedes the
orientation-line compact-class theorem. O1.6's carrier/NDR data precede O5-L. O5-L precedes
O5-A compact-class existence, then O5-P duality; the equivariant tubular construction
precedes Thom/Gysin. O5 constructs the weighted integration/duality and Thom operations; O6 and
O7 prove their map/family and overlap laws. The triangulation proof does not use the O4
comparison to establish its own existence. The classifying space and coarse finite model are
kept distinct at every step.

## References

- I. Moerdijk, [*Orbifolds as Groupoids: an Introduction*](https://arxiv.org/abs/math/0203100),
  §§2–4, for retained-arrow presentations, generalized maps, local charts and coarse comparison.
- I. Moerdijk and D. Pronk, *Orbifolds, Sheaves and Groupoids*, K-Theory 12 (1997), 3–21,
  for the effective specialization; its faithful-slice theorem is not substituted for the
  ineffective chart theorem here.
- I. Moerdijk and D. Pronk,
  [*Simplicial Cohomology of Orbifolds*](https://arxiv.org/abs/q-alg/9708021), §1.2,
  for adapted simplex/star lifts and atlas refinements.
- C. T. Yang, *The triangulability of the orbit space of a differentiable transformation group*,
  Bull. AMS 69 (1963), 405–408, and S. S. Cairns, contribution to
  *Lectures in Topology*, University of Michigan, 1941, pp.143–157,
  for the locally-polyhedral triangulation floor used in the orbit-space route;
  the triangulation and relative proof floors used here are explicit O3 targets.
- A. Adem, J. Leida and Y. Ruan, *Orbifolds and Stringy Topology*, Cambridge, 2007,
  Chapters 1–2, for ineffective groupoids, bundles, forms and weighted integration.

Mathlib's native diffeology foundation originates in
[PR #26484](https://github.com/leanprover-community/mathlib4/pull/26484).
The existing [lean-catdg development](https://github.com/peabrainiac/lean-catdg)
provides effective coarse local-model work. Reuse the native definitions and construct the
stated compatibility adapters; its effective coarse notion does not replace the
retained-arrow orbifold and general ineffective bundle theory here.

The [D-topology development in Mathlib PR #27274](https://github.com/leanprover-community/mathlib4/pull/27274)
describes a compatible generated-plot/coinduced-topology API direction. Follow that direction and
construct the required lemmas for these smooth quotient models. Its continuous diffeology
uses all continuous plots and has delta-generated D-topology; it is not the smooth
finite-quotient diffeology specified above.
