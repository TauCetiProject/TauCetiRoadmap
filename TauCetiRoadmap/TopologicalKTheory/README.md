# Topological K-theory of vector bundles

Build real and complex topological K-theory as usable functors of spaces and pairs,
with bundle operations, compact supports, complex Bott periodicity, complex Thom
isomorphisms and compact-Lie-group equivariance. The basic objects are actual
finite-rank Mathlib vector bundles and their isomorphisms. Virtual classes must
retain their rank information and relative classes must retain their gluing map.
The endpoint includes the support and associated-bundle products needed to turn
an elliptic symbol into topological data.

## Scope, carriers and suppliers

Construct ordinary bundle K⁰ and KO⁰ by group completion of the finite-rank
complex and real bundle categories over paracompact Hausdorff bases, including
noncompact manifolds. Ranks are locally constant functions with finite values at
each point; they need not be bounded across components. Use numerable bundles,
which on these bases include every locally trivial finite-rank bundle. T1 and
T2.0 construct this basic functor and its comparison with the compact-base theory.
Outside T1's explicitly paracompact bundle constructions and T2.0's basic functor,
an ordinary statement with no broader base hypothesis continues to mean compact
Hausdorff X. The finite-cover/complement, compact-pair exactness, Bott, Thom and
equivariant conclusions retain their stated hypotheses; the basic extension
asserts no new global finite trivial complement or classifying-space representability.
Compactly supported theory is separately defined for locally compact Hausdorff
spaces. Relative compact pairs have a closed subspace; cofibration/CW hypotheses
are displayed when skeletal or obstruction arguments need them. T1.6's numerable
bundle classification is distinct from compact-support theory.
A class on a noncompact space is never silently called compactly supported.

Use `FiberBundle`, `VectorBundle`, `VectorBundleCore`, `Bundle.TotalSpace`, their
pullbacks and Mathlib's Hom/dual bundle constructions. A variable-rank object is
a locally constant rank `r:X→N`, topological-module fibres `E x`, and actual
`VectorBundle C (Fin n→C)` structures on each subtype `{x // r x=n}`. Give
constructed tensor/dual/exterior fibres their module topology and prove its
comparison with the transported chart topology; fibre norms are metric data,
not part of the object. The real carrier uses the same construction over R.
The `FiniteRankAtlas` prototype specifies an equivalent small cocycle model
using actual `VectorBundleCore` data indexed by the points of each stratum.
For `X:Type u`, pin `K(X):Type u` and `KO(X):Type u`; the full category may
have fibres in `Type v`, but prove essential smallness in universe u and a
ULift/change-of-fibre-universe equivalence, including invariance of the group
presentation and operations. Prove the comparison with the glued total space. Bundle morphisms are continuous maps of total spaces
covering the base map and linear on fibres; invertible morphisms carry the actual
inverse. Build the category and its small isomorphism-class model in T1. Construct zero morphisms, a zero object, Whitney-sum binary biproducts,
`Preadditive`, `MonoidalPreadditive` and the symmetric tensor structure on this
genuine category. Define K/KO with existing `TauCeti.SplitK0.{u}` and consume
`of_biprod`, `liftEquiv`, `grothendieckAddGroupEquiv` and the monoidal K-ring API;
prove their comparison with the bundle pair/group-completion model. No private
manifold, bundle or group-completion vocabulary replaces an existing API.

- [AlgebraicTopology](../AlgebraicTopology/README.md) supplies CW pairs,
  cofibrations, homotopies, relative homotopy sequences and ordinary
  (co)homology. T1 supplies the bundle-specific section-extension argument; T3
  supplies K-theory's own exact sequences.
- [DGFloer Layer 1 item 2](../DGFloer/README.md) supplies the Serre-fibration
  homotopy sequence and bundle-to-Serre comparison used by T1.5.
- [GrothendieckEulerForms](../GrothendieckEulerForms/README.md) supplies the
  categorical presentation/universal-property infrastructure. Topological
  bundle categories and comparisons with their direct-sum monoids belong here.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) supplies
  smooth principal/associated bundles, connections and smooth bundle operations.
  T1 and T6 build continuous counterparts and their smoothing/descent comparisons.
- [GeneralizedCohomology G4.0b](../GeneralizedCohomology/README.md) supplies
  the smooth graph-chart upgrade on T1.5's existing finite real/complex
  Grassmannian carriers for T6.6's homogeneous-space diffeomorphism.
  Its direct inputs from this roadmap are T1.5–T1.6's topological carriers;
  the join-classifier input through CharacteristicClasses C1.1 consumes T6.4.
  All precede T6.6, and those classifiers do not consume the smooth upgrade
  or T6.6.
- [CharacteristicClasses C1.1a–b](../CharacteristicClasses/README.md) supplies
  the finite orientation-cover/cyclic-SO precursor before T1.6, then the
  numerable join/frame specialization after T1.6 and T6.4. The early
  precursor uses neither the join nor T6.4; stable BSO comparisons belong
  to T1.6 and are consumed by C1.1b and T7.
- [ComplexKahlerGeometry K5–K7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md) supplies
  static Laplace-type estimates, Dolbeault Hodge theory, Kähler identities and
  projective examples. T6 owns the continuous-parameter, vertically smooth
  family bridges needed for its projective transfer. A static Hodge theorem does not
  supply those family bridges.
- [CompactGroups Layer5.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e081fe4d3c5837231222ed50cf396ffcf51a8d46/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md)
  supplies Haar averaging, Peter–Weyl and the generic G-finite-vector density
  theorem for strongly continuous Banach representations. T6.1 owns the
  continuous-section and L²-section actions and finite equivariant embedding
  applications. [NoncompactQuantumSymmetry M0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6afdcaea14fd4be5cdff6df091710bbc70aaa02/TauCetiRoadmap/NoncompactQuantumSymmetry/README.md)
  retains its Hilbert isotypic projections, multiplicity/tensor decomposition,
  smooth-vector comparisons and later noncompact theory; its K-finite
  predicate is compared with the same orbit-span definition.
- [BanachAlgebras A2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4ca3e99e0e27255fdcf8aea71e4e9aef052a3d77/TauCetiRoadmap/BanachAlgebras/README.md)
  owns the holomorphic calculus, Riesz idempotents and fixed-contour
  continuity. T4.4 supplies finite-matrix generalized-eigenspace,
  image-subbundle and clutching applications of that one projector.
- [LieGroups](../RepresentationTheory/LieGroups/README.md) supplies the compact
  Lie subgroup/torus vocabulary. T6 constructs continuous finite-dimensional
  representation rings and their bundle comparison.
- [SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md)
  supplies Clifford algebras, their graded tensor products, exterior spin modules
  and algebraic periodicity. Existing Tau Ceti `Spin.Structure`, `Spin.OddStructure`
  and `Spin.Polarization.CliffordAction` are consumed; algebraic periodicity does
  not prove topological periodicity.
- [HomotopySpheres §4A–4B](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1287)
  supplies stable O/SO, the loop comparison with T1.6's oriented classifier,
  and the full real Bott loop chain with its Clifford comparison. T1.5–T1.6
  own the finite Grassmannian carriers, fixed-rank BO(n)/BSO(n), stable BO/BSO
  colimits, universal bundles and their finite-CW/numerable classification.
  CharacteristicClasses C1.1a supplies only the earlier finite oriented-cover
  and lifted-cell precursor; C1.1b consumes these same classifier carriers.
  HomotopySpheres uses them for its stable group/loop, clutching and framing
  applications; any distinct homogeneous model has a named comparison to
  these carriers, not a second classifier definition. T7 owns the geometric
  KO/ABS and multiplicative normalization. Consume the supplier's exact
  §4B.1–4B.9 real loop proof contract and construct unavailable mathematics in
  Tau Ceti in that shape before its comparison is used.
- Mathlib `Analysis/Normed/Operator/Fredholm/{Basic,Open}` supplies
  native Fredholm packages, composition, openness and local index constancy.
  Tau Ceti `Analysis/Fredholm/{SmallPerturbation,CompactPerturbation,ContinuousFamily}`
  supplies its additional perturbation and continuous-family interfaces. T6.5
  owns finite-bundle stabilization and the kernel-bundle family index; an
  closed-manifold index consumer must reuse this construction.
- [GeometricTopology Layer1](../GeometricTopology/README.md) supplies smooth
  embeddings and tubular neighbourhoods. T5 supplies K-theory extension through
  a tubular neighbourhood for an embedding with complex normal bundle. The
  tangent/cotangent normal comparison, topological index and Atiyah–Singer
  theorem are consumers of this interface, not prerequisites for Bott or Thom.

Characteristic cohomology classes, Chern character, Chern–Weil and genera are
outside this roadmap. Exterior-power operations are built here without invoking
characteristic classes. Smooth Clifford bundles, spin lifts and Dirac operators
also have their geometric owners. The closed-manifold index proof consumes the
relative, equivariant and Thom APIs below.

## Conventions

K⁰(pt)=KO⁰(pt)=Z by dimension, and an operator triple `[E,F,σ]` has absolute image
`[E]−[F]`. Reduced K is the kernel of restriction to the chosen basepoint;
K(X,empty)=K(X) uses an adjoined disjoint basepoint. Reduced and relative rings
are generally nonunital. A pullback on compact supports requires a proper map.
An open inclusion has a covariant extension map defined by the relative/triple
model, not an ordinary contravariant bundle pullback.

Identify S² with the one-point compactification of C using `CP¹ ∋ [z:1] ↔ z`.
Pin the first disc `D₀={|z|≤1}` and the second disc D∞ in the reciprocal
coordinate. For a triple `[E,F,σ]`, put E over D₀ and F over D∞, and use σ as
the first-to-second coordinate transition in the compactification comparison.
Let L have transition `z ↦ z`. On the overlap its frames satisfy
`s₀=(z,1)=z·s∞`, so L is the tautological O(−1); prove this isomorphism using
ComplexKahlerGeometry K7's actual projective/one-point charts and O(−1).
Set `β=[L]−1`, and fix the compact-support generator on C to map to β.
The complex Thom class of E uses the Koszul complex on `π*Λ• E*` with
contraction by the tautological vector; equivalently its folded even-to-odd map
is contraction plus its Hermitian adjoint. Its zero-section restriction is
`λ_(−1)(E*)`. Prove comparison with the wedge-only complex on `π*Λ• E`: on rank-r strata
its class is `(-1)^r [π*det(E)]·u_dual(E)`, by exterior degree reversal.
Prove the actual differential/folding intertwining maps and their signs; these
conventions are not interchangeable.
With the stated first-to-second disc gluing convention, the folded rank-one
Koszul symbol is conjugate z, so its compact-support class is −β; prove this
comparison. Higher-rank trivial Koszul classes are the external products of
these generators. Tensor products use the Koszul sign for Z/2 gradings.

## T1. Continuous finite-rank bundles as a category

1. Construct the finite-rank numerable bundle category on each paracompact
   Hausdorff base, with continuous total-space maps linear on fibres, morphism
   composition and fibrewise exactness; give fixed-rank and clopen-stratum
   comparisons. For X:Type u use the actual point-indexed `FiniteRankAtlas X`
   small model. On each rank stratum X_n choose a trivializing neighbourhood
   U_x and a frame at every x∈X_n, with model Fin n→𝕜, and take the core's chart
   index type to be X_n itself. Record U_x, indexAt(x)=x and the continuous
   finite-matrix transition maps, with their inverse and cocycle laws. Frames
   chosen in the original fibre universe are used only to construct these maps;
   they are not chart labels or fields of the small object. All stored data live
   in Type u, independently of the original fibre universe. Reconstruct the
   bundle by `VectorBundleCore` and give its actual isomorphism to the original
   bundle. Encode morphisms by compatible finite-matrix functions in these same
   charts and prove the resulting functor fully faithful and essentially
   surjective. These constructions prove essential smallness and the stated
   universe-u/ULift comparisons. Covers may be infinite; use a numerable
   refinement when needed, with no finite-cover or globally bounded-rank
   assumption. On compact bases recover the finite-cover/finite-matrix model.
   Cover zero rank and disconnected/empty bases. This basic category precedes
   T2.0; T1.6's later classifying-space results are not premises for it.
2. Build pullback, direct sum, tensor, dual, conjugate, Hom, exterior powers,
   determinant, realification and complexification, including
   `Λ^j(L⊗E)≃L^(⊗j)⊗Λ^j(E)` for a line bundle L, with identity/composition,
   rank, associativity, symmetry, distributivity and base-change isomorphisms.
   On compact spaces rank has finite image. Short exact bundle sequences have
   locally constant ranks and continuous kernels/images/quotients when fibre
   rank is locally constant; prove this from local matrices, not as an assumption
   on a symbol record.
3. Construct continuous positive-definite real/Hermitian metrics by partitions
   of unity. Every bundle over a compact Hausdorff base embeds into a finite
   trivial bundle; construct its orthogonal complementary bundle and prove
   `E⊕Eperp≃trivial N`. Prove splitting of short exact sequences, independence
   of complements and homotopy of metric choices. For paracompact bases use
   locally finite partitions; assert a finite trivial complement only with an
   additional finite-generation/finite-cover hypothesis.
4. Prove numerable bundle homotopy invariance over X×I for paracompact
   Hausdorff X by the following anchored cylinder-transport construction. On
   X×I×I write E_s,E_t for the two pullbacks of the cylinder bundle. The opens
   U×J×J on which E is trivial over U×J cover the diagonal s=t. Choose a
   locally finite partition of unity on the whole paracompact product,
   subordinate to these opens together with the complement of the diagonal.
   A chart supplies the continuous fibre map T_i(x;s,t):E_s→E_t with
   T_i(x;s,s)=id. Extend the partition-weighted maps by zero and sum in the
   actual Hom bundle. Divide by the sum of the chart weights on its positive
   locus. This gives B(x;s,t) with B(x;s,s)=id; openness of invertibility yields
   an open neighbourhood of the entire diagonal where B is invertible. No
   arbitrary average of invertible matrices is asserted invertible. By compactness
   only of I and a numerable refinement on X construct a positive continuous
   δ:X→(0,1] so B is invertible whenever |t−s|≤δ(x)/2. Set
   t_j(x,t)=min(t,jδ(x)/2) and compose B(x;t_j,t_(j+1)):E_(t_j)→E_(t_(j+1)) from 0 to t. Prove that this product is locally finite, since δ has a positive
   lower bound near each x and all later factors are id. It defines a
   continuous bundle isomorphism pr_X*E_0≃E, equal to id at time zero.
   Prove its inverse, equality of endpoint bundle classes independently of the
   choices, and pullback naturality at the class level. This construction precedes
   T1.6 and assumes neither a finite global complement nor representability.
   For compact Hausdorff X retain the relative extension:
   for every closed Y⊆X, extend a specified cylinder trivialization over Y×I
   that is the identity at time0 to one over X×I, retaining its exact agreement
   with the specified data. Prove the compact CW case as a corollary. Establish
   extension of bundle maps from closed subsets to neighbourhoods and extension
   of fibrewise invertibility by a uniform bound. Construct clutching over closed
   disc/cone decompositions, its functoriality, dependence on the gluing map up to
   homotopy and changes of trivialization.
5. Construct the single finite Grassmannian carrier `finiteGrassmannian 𝕜 r N`
   for 𝕜=ℝ or ℂ as the native subtype
   `{V : Submodule 𝕜 (Fin N→𝕜) // Module.finrank 𝕜 V = r}`.
   Compare this subspace convention, for r≤N, with Mathlib's native
   `Module.Grassmannian 𝕜 (Fin N→𝕜) (N−r)` (locally free quotients),
   retaining the underlying submodule; the native algebraic functor and
   quotient-rank convention in `Mathlib/RingTheory/Grassmannian.lean` are
   used as supplied. The topological subspace construction below supplies
   its field-specialized comparison rather than another algebraic functor.
   Give it the quotient topology of the full-rank frame-span map, where frames
   are linearly independent r-tuples in Fin N→𝕜 with the inherited coordinate
   topology. Prove surjectivity, the GL(r,𝕜)-orbit/fibre identification, quotient
   maps and the comparison with orthonormal frames using native
   EuclideanSpace/WithLp coordinate transport and Gram–Schmidt. Treat r=0,
   r=N and r>N explicitly. Construct the continuous graph charts, their
   transitions, and agreement with these quotient topologies. Throughout these
   coordinate models use zero-based Fin positions and e_i=Pi.single i 1.
   Construct the
   tautological and orthogonal-complement bundles, finite Stiefel principal
   bundles and their local trivializations, stabilization, direct-sum and
   scalar-forgetting maps on these same carriers. GeneralizedCohomology G4.0b
   supplies the smooth graph-chart/native-projective upgrade; this item owns
   the topological construction, used unchanged by T1.6 and T6.6. Compare its
   local-coordinate bundle charts with Mathlib bundles. Construct the finite
   Schubert characteristic maps for the standard coordinate flag and their CW
   structure, with the quotient topology equal to its weak topology. In the
   complex case, for `N≥2` and `0≤a≤N` write the rank as `a`, the ambient
   dimension as `N=a+q`, and index the cells by length-`N` binary words `w`
   with `a` ones at one-based positions `p₁<⋯<pₐ`. These word positions are
   combinatorial; coordinate basis vectors use zero-based `Fin N` indices, so
   pivot `p_i` is `e_(p_i−1)`. The `N=0` carrier is rank zero. For `N=1`, `a=0` and `a=1` each give a
   point and are handled directly; neither the `N≤1` cases nor `a>N` uses the
   type-A root comparison. Let `F` be the standard increasing
   coordinate flag and
   use the cell with exact pivot dimensions
   `dim(V∩F_j)=#ones(w[1..j])`. Use the type-A permutation model from
   RootSystems' `A_(N−1)` example and its Layer 3 Coxeter exchange/deletion and
   Bruhat-order floor; instantiate the finite-permutation subword criterion
   needed for these boundaries here, rather than assuming an additional
   Schubert-resolution theorem. For each cell take its minimal Grassmannian
   coset representative and a reduced adjacent-transposition word. For each
   letter use the compact `SU₂` rotation in its two coordinates,
   `[[cos r,−e^(−iθ)sin r],[e^(iθ)sin r,cos r]]`, `0≤r≤π/2`, multiplied
   by that letter's Weyl representative. At `r=0` the angle is immaterial;
   at `r=π/2` the letter is replaced by a torus factor. Fix the Weyl block
   `s=[[0,−1],[1,0]]`. Use complex disc parameter `d=−sin(r)e^(−iθ)`;
   the product block is `[[d,−cos r],[cos r,conj d]]` and its open-cell
   affine coordinate is `z=d/cos r=−tan(r)e^(−iθ)`. This fixes the complex
   orientation of the open disc. Multiply these factors and project to the
   Grassmannian, proving that the open product-disc restriction is the
   row-echelon cell homeomorphism. Construct the required rank-one partial-flag
   incidence spaces and projection comparisons for each adjacent-transposition
   step; this is the local incidence adapter owned here, not a generic
   Bott–Samelson resolution. On the boundary, push torus factors through later
   rotations and use the finite type-A subword/Bruhat comparison derived above to land in
   smaller Schubert cells. Prove the product-disc-to-disc radial homeomorphism
   and weak-topology agreement by compactness and Hausdorffness. Pin the
   ambient inclusion as appending the last coordinate by Fin.castSucc. Pin
   shift as e_i↦e_(i+1), using Fin.succ in finite coordinates and
   Finsupp.mapDomain Nat.succ on U=ℕ→₀𝕜. The rank inclusion is
   s(V)=𝕜e₀⊕shift(V). The latter sends pivot symbol τ to
   (0,τ+1) and is a homeomorphism onto the closed Schubert subcomplex of planes
   containing e₀. Prove strict commutation of rank and ambient inclusions,
   and the tautological comparison s*γ_(k+1)≅1⊕γ_k, with the new line first.
   This finite carrier/cell/map construction precedes CC C1.1a and T1.6.
   Prove the real `(n−k−1)` and complex `2(n−k)` connectivity bounds for k-frames in
   n-space. The first-column stabilizer includes its contractible off-diagonal
   factor; construct its deformation comparison with the smaller classical
   group before using a fibration sequence. On finite-dimensional CW pairs,
   prove existence/uniqueness of section extensions with the corresponding
   strict/weak dimension bounds, applied to the bundle of surjections E→F.
   **T1.5a. First Stiefel groups and normalized boundary.** On these same
   finite orthonormal-frame carriers write V_r(R^n), 0≤r≤n, m=n−r. Construct
   the last-vector forgetful map, local trivializations and sphere fibre S^m.
   Consume the native bundle-to-Serre adapter and DGF1.2's actual based LES.
   For m≥1 prove (m−1)-connectivity. For r=1 the space is S^m and π_m=Z
   for either parity. For r≥2,m≥1 prove π_m=Z when m is even and Z/2 when
   m is odd, with the bottom-fibre Z map the stated quotient and generator.
   For r=2 the preceding boundary is the tangent-sphere clutching evaluation
   x↦2⟨x,e⟩x−e on S^m. Compute its degree directly by the hemispheres as
   1−(−1)^m; for m=1 this is the degree2 double-angle map. This is a sphere
   degree calculation, independent of later Euler/Poincare–Hopf theory.
   For r>2 fix the first r−2 frame vectors and prove the naturality square
   with this r=2 bundle. The inductive bottom sphere generates the preceding
   Z first group when m is odd, hence the boundary image is2Z. When m is
   even the preceding first group is finite (or r=2 has boundary0), so its
   map to Z vanishes. Prove all actual generator/LES/group comparisons.
   The m=0 full-frame carrier is O(n), with determinant components; its
   identity component is SO(n), with π1=0 for n≤1, Z for n=2 and Z/2 for
   n≥3. Treat n=0 and r=0 separately. Construct the relative triple
   (SO(n),SO(k+1),SO(k)) and its inclusion/boundary square on the actual
   positive-rank quotient carriers, retaining every k=0/low-rank exception.
   For complex r-frames prove2(n−r)-connectivity and first group
   π_(2(n−r)+1)=Z by the same sphere LES, whose preceding base is sufficiently
   connected to leave the bottom sphere group unchanged. Export basepoint
   change, coordinate permutations, stabilization and the actual orientation
   action local systems. This early phase consumes finite-frame charts,
   ordinary sphere degree and the actual fibration LES; it has no Schubert,
   universal-class, Bott or later CC obstruction premise.

6. **T1.6a. Stable carriers and classification.** Build stable complex/unoriented real Grassmannian classification of bundles
   of bounded rank over compact bases and stable classes over finite CW bases,
   with clutching naturality. For oriented real bundles of fixed positive rank
   n≥1 compare using CharacteristicClasses C1.1a's finite oriented-cover
   precursor. Own the fixed-rank BSO(n) ambient colimits in this range and
   `stableOrientedGrassmannian` BSO as the positive-cofinal rank-colimit on
   those lifted cells, with their universal bundle diagrams and stabilization.
   Set BSO(0)=pt for the canonically positively oriented zero bundle.
   HomotopySpheres §4A consumes this carrier/classification and owns ΩBSO≃SO
   and its comparison with its stable homogeneous-space models.
   This supplies T7's BO/BSO classification input. Prove numerable fixed-rank
   BO(n)/BU(n) classification for n≥0 and BSO(n) classification for n≥1
   over paracompact Hausdorff bases, with the universal numerable bundle and
   locally finite partition/classifying-map proof explicitly constructed.
   Oriented classification is up to isomorphisms preserving the supplied
   orientation; a bare SO(0) frame reduction does not classify arbitrary
   chosen zero-dimensional orientations.

   In rank0 retain a chosen orientation as a locally constant sign
   σ:X→{+1,−1}, equivalently a section of the trivial two-point orientation
   cover. Construct its comparison with the actual native
   `Orientation ℝ (Fin 0→ℝ) (Fin 0)` and the canonical positive empty-basis
   ray. Native `Orientation.eq_or_eq_neg_of_isEmpty` gives the two signs,
   and `Orientation.map_of_isEmpty` fixes each sign under every
   zero-dimensional linear isomorphism. Thus the two oriented zero bundles
   over a point are not isomorphic as oriented bundles, whereas [pt,BSO(0)]
   is a singleton. Give the rank0 sign classification and its pullback,
   reversal and ordered-product laws separately from the BSO(0) classifier.
   For variable rank, apply the positive-rank theorem on its clopen strata
   and retain this sign datum on the rank0 stratum. The canonical rank0 point
   in the stable tower carries only the positive empty-basis orientation.
   Compare the positive-cofinal stable tower with this canonical starting
   point. To stabilize a supplied signed zero bundle, adjoin the specified
   positively oriented trivial line and construct its actual oriented-bundle
   and classifying-map comparisons. Retain the original σ and these maps;
   do not recover or equate the unstabilized signs from their stable
   classifier images. No fixed-rank rank0 signed-classification theorem is
   inferred from the positive-rank or stable theorem.

   Name the fixed-rank universal carrier `Gr_k∞(𝕜)` as the union of the
   T1.5 carriers finiteGrassmannian 𝕜 k (N+k) along coordinate closed embeddings,
   appending the last coordinate by Fin.castSucc, with the final topology
   for those inclusions. This fixed-rank carrier is used for numerable
   complex/unoriented real classification, including its canonical rank0 point.
   Use T1.5's finite Schubert cells and pinned rank/ambient maps to construct
   the CW structure, proving agreement of the weak topology with the
   compactly generated colimit. Construct the universal tautological bundle
   by those compatible finite stages. CC C1.1a owns the positive-rank finite
   oriented lift of T1.5's new-line-first rank map and its last-column SO
   comparison; its rank0 point has the canonical positive convention above.
   Define `stableRealGrassmannian` and `stableComplexGrassmannian` as the
   rank-colimits of the fixed-rank unoriented real/complex carriers in
   CompactlyGenerated, with underlying weak-CW union topology and the
   transported Schubert cells. The basepoint is the image of the canonical
   rank0 point, represented in rank k by span(e₀,…,e_(k−1)). Pin the universal
   stable bundle and pullback classification; BO/BU denote these connected
   Grassmannian models.

   **T1.6b. Actual BO/BU sum and coherent coordinate homotopies.** Define
   the finite-stage block sum by interleaving: i↦2i on the first ambient
   𝕜^a and j↦2j+1 on the second inside 𝕜^(2 max(a,b)), then sum the
   two images. Prove continuity, the actual tautological-bundle comparison
   μ*γ_(k+l)≃pr₁*γ_k⊕pr₂*γ_l, ambient compatibility and classification
   naturality. Retain the strict diagonal identity
   μ_(k+1,k+1)∘(s×s)=s²∘μ_(k,k), and prove the paired-tower/product
   comparison in CompactlyGenerated to obtain the based stable map.
   The based unit endpoints are μ_(k,k)(V,*_k), μ_(k,k)(*_k,V)
   and s^k V in rank2k. Associativity compares
   μ_(2k,2k)(μ_(k,k)(U,V),s^k W) with
   μ_(2k,2k)(s^k U,μ_(k,k)(V,W)) in rank4k.
   Construct the unit, associativity and symmetry homotopies together with
   their unit triangles, associativity pentagon, symmetry involution and
   mixed symmetry/associativity face compatibilities. Each finite coherence
   diagram has prescribed labelled faces; constructing only a path between
   its endpoint subspaces does not construct its relative filler.

   Use one based coordinate-choice carrier (J,P). Put U=ℕ→₀𝕜 with its
   finite-coordinate Hermitian form. For j labelled input copies, J is a
   linear isometric embedding U^j→U, and P is an unframed finite padding
   plane orthogonal to J. It sends input k-planes to
   J(V₁⊕⋯⊕V_j)⊕P, of target rank N=jk+dim P. At the basepoint require
   J(B)⊂*_N and P=*_N∩J(B)^perp for
   B=(span(e₀,…,e_(k−1)))^j; hence the total output is literally *_N.
   For units use one variable input and its specified trivial input/padding;
   for associativity use three labelled inputs. Symmetry uses TWO labelled
   embeddings: after a positive k-line stabilization of μ, its endpoints
   in rank3k are (J₀,P₀) and (J₀∘τ,P₀), where τ literally permutes the
   two entire input copies, including their frames. Both have the same
   underlying based output, and carry the actual Whitney swap isomorphism.
   The extra padding carries no virtual class: every target operation is
   read as [output]−[1^N]=Σ_i([V_i]−[1^k]).

   Equip these embedding spaces with the weak finite-coordinate topology
   and its compactly generated compact-open comparison. Construct their
   finite orthonormal-frame tower, forgetful Serre fibrations and relative
   extension API. For every finite collection of coherence polytopes,
   first construct its complete closed boundary in the (J,P) carrier:
   use the labelled direct-sum, permutation and unit isomorphisms, literal
   permutation endpoints, already chosen lower faces and one common positive
   padding. Prove equality on every face intersection before extending.
   The equalities of permutations and associators supply the endpoint
   identifications, not a sign-forgetting map from planes to frames.

   At a bottom rank k and common target rank N=rk, r≥j+1, the based
   input-frame problem is V_(jk)(𝕜^N). For the binary symmetry it is
   V_(2k)(𝕜^(3k)), of connectivity k−1 over ℝ and 2k over ℂ.
   For a finite d-dimensional relative parameter complex choose a cofinal
   bottom rank k₀ with N−jk₀−1≥d−1 over ℝ, respectively
   2(N−jk₀)≥d−1 over ℂ; increase r as well when needed. Apply the
   relative Stiefel extension theorem to the ACTUAL closed boundary map.
   Simultaneously extend the remaining input-ambient frames into *_N^perp
   after separately increasing the external ambient dimension so its
   corresponding finite Stiefel connectivity meets the same bound. These
   are two distinct extension problems. Pass through their finite-frame
   tower to the remaining U-input embedding, with compact parameter
   families on finitely many coordinates contained in a common finite
   ambient stage. Set P=*_N∩J(B)^perp continuously; no global padding
   frame is assumed. Include rank0, zero padding where applicable, and all
   relative parameter faces.

   Prove rank compatibility of these choices, not only their existence at
   one rank. For a j-input operation landing in rank rk, require
   J^(k+1)∘shift=shift^r∘J^k on every old input copy. Put
   D=span(e₀,…,e_(r−1))⊕shift^r(P^k). Choose the j new labelled input
   lines in D relative to all specified faces; the orthogonal remainder is
   P^(k+1). Here dim D=r+(r−j)k, so its new-frame space is
   V_j(𝕜^dim D); choose the tail/padding so its connectivity also permits
   each relative extension. Prove its rank equations, basepoint condition,
   ambient compatibility and agreement on all lower boundary strata.
   For the unit and associativity homotopies retain
   H_unit^(k+1)∘s=s²∘H_unit^k and
   H_assoc^(k+1)∘(s,s,s)=s⁴∘H_assoc^k.
   Compare different sufficient tails/paddings by the same relative
   construction, then use CW homotopy extension and the paired-tower
   comparison to obtain the coherent stable diagrams with their fixed
   endpoints. Export the actual coordinate homotopies and fillers, not
   only equality of induced K-classes. GeneralizedCohomology G2.8 owns
   the subsequent generic permutative/group-completion machine.

   The simultaneous quarter-turn R_t on each coordinate pair is retained
   as an auxiliary based homotopy between the block-sum SUBSPACES. Its
   endpoint has a minus sign on one labelled frame, so its double swap
   need not bound the unit/symmetry diagram; it is not the prescribed
   coherent symmetry above. For the oriented classifier, transport the
   constructed BO diagrams by the based covering lift of T1.6c. Keep its
   actual determinant/padding orientation transport and ε_k finite formula,
   strict diagonal-rank identity and positive-trivial stabilization
   comparison. Do not identify the literal Whitney swap with an
   orientation-preserving frame permutation without its determinant sign.

   **T1.6c. Actual oriented sum.**
   On the oriented model construct `stableOrientedGrassmannianWhitneySum`.
   Prove that orientation forgetting BSO→BO is the based universal double cover
   from C1.1a's finite covers and the cellular colimits, with path/homotopy
   lifting, consuming native IsCoveringMap.liftHomotopy and liftHomotopyRel.
   BSO and BSO×BSO are simply connected and locally path connected by their
   Hausdorff CW structures. Consume the existing Tau Ceti
   IsCoveringMap.existsUnique_continuousMap_lifts_of_subsingleton_fundamentalGroup
   criterion. Define the oriented sum as the
   unique based lift of the actual BO sum composed with forgetting on both
   inputs. Export the exact forgetting square and the based units,
   associativity and commutativity homotopies, lifting the BO diagrams relative
   to all specified boundaries. Compare it with the natural finite Whitney
   orientation (v₁,…,v_k,w₁,…,w_l). At equal rank k the finite coordinate
   Whitney orientation of μ(*_k,*_k)=*_(2k) has sign
   (−1)^(k(k−1)/2) against the standard coordinate orientation,
   and μ(sV,sW) has sign (−1)^k against s²μ(V,W).
   Prove the finite-stage identity: at equal rank k this based lift is
   ε_k times the finite Whitney orientation, where ε_k=(−1)^(k(k−1)/2).
   Export μtilde_k*γtilde_(2k)≅
   (pr₁*γtilde_k⊕pr₂*γtilde_k, ε_k·Whitney), retaining the oriented bundles.
   Prove this sign identity for the normalized based lift. Since ε_k ε_(k+1)(−1)^k=1, the normalized oriented maps satisfy
   the strict diagonal-rank identity; the natural ordered finite Whitney maps
   alone do not. Their lifted law homotopies are rank-compatible by unique
   path lifting. Export the stable classification comparison: the ordinary
   Whitney-oriented sum of two classified stable bundles is classified by this
   based map. Compare with the finite formula after adding a positive trivial
   line, rotating it through a fresh normal direction by π exactly when
   k≡2 or3 mod4. The rotation changes the underlying plane during the path.
   This comparison uses an orientation-preserving stabilized
   bundle isomorphism and its classifying homotopy; the unit/overlap comparisons
   are relative to the normalized based lift. T7 consumes this actual oriented
   sum, and GeneralizedCohomology G5.0 owns its subsequent Spin lift and
   projection/sum H-map comparison.

   **T1.6d. Component and companion-model comparisons.**
   On BO×ℤ and BU×ℤ also add the integer components. Construct the
   HomotopySpheres §4B.1 R₀ comparison using T1.6's own 2n-dimensional
   homogeneous tower, cofinally compared with the supplier's tower: the orbit
   map from O(2n)/(O(k)×O(2n−k)) sends
   a matrix to the span of its first k columns in T1.5's carrier.
   Label that stage by k−n, with the added-first-line/append-last-ambient
   stabilization preserving this virtual dimension. Prove the cofinal
   based homotopy equivalence over ℤ, compatibility with the supplier's
   finite-dimensional inclusions up to the elementary coordinate homotopies,
   and transport the block sum along it.
   T2.1 supplies the group-completion comparison for BU×ℤ.
   In rank one use Gr_1(𝕜^(N+1)): name `RP∞` for 𝕜=ℝ and `CP∞` for 𝕜=ℂ,
   with one cell in each nonnegative degree or each even nonnegative degree,
   respectively, using the rank-one Schubert cells just constructed.
   CharacteristicClasses C1.5 compares these cells with AT4.6's finite RPⁿ
   and CKG K7's finite CPⁿ characteristic maps and owns the cellular/cup comparisons
   with these carriers. The carrier/bundle/CW construction precedes classification
   and uses earlier AT CW/Whitehead tools, without AT8.10–8.12.
   For these rank-one carriers also construct the direct finite-projective
   model before general classification: identify Gr_1(𝕜^(N+1)) with native
   Projectivization, transport AT4.6's real and CKG K7.2's complex characteristic
   cells through the actual ratio charts, and compare the rank-one Schubert
   labels and stage inclusions. Their weak CW union is the SAME RP∞/CP∞ carrier.
   Use its compact-image finite-subcomplex theorem and the finite-coordinate
   unit-sphere tower to prove contractibility of the universal sphere total
   space by connectivity and CW Whitehead. Keep the real double-cover and
   complex principal-circle local trivializations and actual colimit quotient
   comparison. This rank-one producer needs no general Dynkin classification,
   bundle representability or ordinary EM theorem; later arbitrary-rank
   Schubert/classification/coherence programmes remain required unchanged.
   On smooth finite-dimensional manifolds prove that
   continuous bundles admit smooth representatives, continuous isomorphisms
   admit smooth representatives, and continuous homotopies induce the same
   stable smooth classes, using partitions and the matrix models above.

## T2. K-rings, universal properties and exterior operations

**T2.0. Ordinary bundle Grothendieck functors.** On T1's genuine essentially
small real/complex numerable bundle category over each paracompact Hausdorff X,
use the same native `TauCeti.SplitK0.{u}` carrier. Construct its comparison with
isomorphism classes under Whitney sum and with the pair relation
`(E,F)~(E′,F′)` iff `∃G,E⊕F′⊕G≃E′⊕F⊕G`. Prove the class-map relation,
induction, additive universal property and equality criterion with a common
bundle summand; no triviality of that summand is asserted. Tensor product induces
the commutative unital ring, with the trivial line as unit; prove all laws using
T1's actual associativity, symmetry and distributivity isomorphisms. The empty
base gives the zero ring.

Every continuous map f:X→Y between these bases induces the bundle pullback
functor and a unital ring map f*:K⁰(Y)→K⁰(X), and likewise for KO⁰. Prove identity,
composition, isomorphism invariance and equality of the maps induced by a
homotopy, using T1.4's numerable cylinder theorem. These ordinary pullbacks do
not require f proper. Extend dual and conjugate as ring involutions, realification
as an additive map, and complexification as a unital ring map, with `r c=2` and
`c r=1+conjugation`. For each j construct the actual exterior-power operation
and its sum law. The constant-one formal series λ_t extends to virtual classes
by formal inversion, yielding its coefficient operations; if ranks are unbounded,
λ_t(E) need not be a polynomial on X. No substitution at t=−1 or finite alternating
sum is inferred without a global rank bound.

Export the rank ring map to `LocallyConstant X ℤ`, with no bounded-image
restriction, and its splitting by differences of trivial bundles of the locally
constant positive and negative ranks. A chosen basepoint gives the evaluation
augmentation and splits off one copy of ℤ, not every component's rank. For a
set-indexed disjoint union of such bases prove `K⁰(∐_i X_i)≃∏_i K⁰(X_i)` and
the KO analogue as rings: restrict and paste actual bundles, choose virtual-pair
representatives componentwise, and paste their common stabilizing summands for
injectivity. Arbitrary, not finite-support, products occur because ranks may be
unbounded between components. Finite disjoint unions are its finite-product case.

For compact Hausdorff X compare this construction naturally with the same compact
bundle category and K/KO carriers used below. Keep K_c on locally compact
Hausdorff spaces separate, with its proper pullback/open extension laws; where X
is also paracompact construct the forget-support map by restriction of the actual
compactification/triple representatives, proving the compact-X identification.
As a noncompact regression compute ordinary K⁰(ℝ)=ℤ by bundle homotopy invariance
and K_c⁰(ℝ)=Kred⁰(S¹)=0 by the circle calculation. Neither equality of ordinary and compactly supported K-theory,
a global finite trivial complement, nor `[X,ℤ×BU]`/`[X,ℤ×BO]` representability
on arbitrary paracompact bases follows from this basic functor API.

For the numbered bundle-theoretic constructions T2.1 onward, retain compact
Hausdorff X unless a different relative/support scope is explicitly displayed.
Their pure algebraic monoid and formal power-series statements retain their
stated unrestricted algebraic hypotheses. In particular T2.3's polynomial
λ_(−1) evaluation and special λ identities, and T2.5's flag/Adams comparisons,
concern those compact-base bundle classes; they are not additional arbitrary-
paracompact conclusions of T2.0.

1. For this same group completion prove universality, induction, functoriality
   and equality `[E]=[F]` iff `∃G,E⊕G≃F⊕G`. For compact X replace
   G by a common trivial stabilization; unequal trivial ranks also change the
   absolute rank. Prove equivalence of the pair model
   `(E,F)~(E',F')` iff `∃G,E⊕F'⊕G≃E'⊕F⊕G` with the categorical presentation.
   Define `complexKClassifyingMap` from homotopy classes of maps
   X→BU×ℤ to K(X), for compact Hausdorff X, using T1.6's actual stable
   Grassmannian carrier. Write a map as (f,n), with n locally constant;
   compactness places f in a finite-rank stage Gr_k∞ and gives
   [f*γ_k]−[𝟙^k]+n, where n denotes the difference of trivial bundles
   on its finitely many rank strata. Prove independence of the stage,
   naturality, bijectivity and compatibility with block sum and addition.
   Build `realKOClassifyingMap` from [X,BO×ℤ] to KO(X) by the same
   stage-independent formula and proof, with its real bundle comparison.
2. Tensor product gives a commutative unital ring; pullbacks are ring maps.
   Extend dual/conjugate/realification/complexification, with realification
   additive but not a unital ring map in its usual normalization. Prove
   `r c=2` on KO and `c r=1+conjugation` on K. Export the locally constant rank
   ring map, its ring-map splitting by trivial bundles and basepoint reduced decomposition
   `K(X)≃Kred(X)⊕Z`; do not identify all rank-zero classes using one basepoint
   on a disconnected space.
3. Build λ_t(E)=Σ[Λ^j E]t^j for actual bundles and the direct-sum product
   identity. Extend λ_t to virtual classes as a unit formal power series with
   constant1 and prove its inverse identity. Construct on each rank-r stratum
   `Λ^j(E*)≃Λ^(r−j)(E)⊗det(E*)` for 0≤j≤r and base-change compatibility.
   Extract individual λ^j operations and their sum law. After T5's projective
   flag pullback injectivity, prove the universal polynomial product laws for
   λ^j(E⊗F) by reduction to split lines, and extend them to virtual classes.
   Evaluating at t=−1 is allowed for an actual finite-rank bundle polynomial;
   no arbitrary infinite-series evaluation is asserted. Relative operations in
   T3 must preserve the chosen trivialization.
4. Prove the monoid exercise: a surjective monoid homomorphism to a group whose
   identity fibre consists just of the identity is an isomorphism, by first
   constructing inverses in the source. Use it when establishing the stabilized
   sequence model, not to declare an unstabilized tuple monoid a group.

5. **Positive Adams operations.** After T5's flag injection has proved
   T2.3's special λ-product identities, construct `adamsOperation`
   for each integer k≥1 as a unital ring endomorphism of the same complex
   K(X), natural on compact Hausdorff bases. Define it by the integral
   Newton polynomial N_k in λ¹,…,λᵏ; consume Mathlib's
   `MvPolynomial.psum_eq_mul_esymm_sub_sum`, rather than divide by k or
   apply a rational logarithm. Pin
   Σ_(k≥1)(−1)^(k−1)ψᵏ(x)t^(k−1)=λ'_t(x)λ_t(x)⁻¹
   on T2.3's constant1 unit power series as the named
   `adamsOperation_lambdaSeriesComparison` with the Newton definition.
   On ℚ-algebras compare this integral unit-derivative expression with
   Tau Ceti's native `PowerSeries.logDeriv`. Prove independence of virtual
   presentations, additivity, multiplicativity, ψᵏ(1)=1, rank preservation,
   ψ¹=id, ψᵏψˡ=ψ^(kl), commutation with dual/conjugation and every
   continuous pullback. On a line L prove ψᵏ([L])=[L^⊗k], and prove
   ψᵖ(x)−xᵖ lies in pK(X) for each prime p, including torsion K-groups.
   Prove the integral universal Newton congruence N_p≡e₁^p mod p
   in ℤ[e₁,…,e_p] and evaluate it on λ-classes;
   `adamsOperation_frobeniusModPrime` is the resulting quotient-ring
   identity. For the
   multiplicativity/composition splitting proofs handle virtual differences
   and disconnected rank strata; split E⊕1 when E has rank0 so the
   projectivization is nonempty, then remove the trivial-line term.

   Consume the generic `AdamsOperations` and `AdamsHom` interfaces of
   [Mathlib PR42468](https://github.com/leanprover-community/mathlib4/pull/42468)
   over ℤ: package the constructed operations, composition and prime
   congruence on K(X), and package pullbacks as `AdamsHom`. Set its index0
   to the locally constant rank endomorphism followed by trivial bundles;
   prove the composition and pullback laws also at0. If this interface is unavailable, provide it in
   Tau Ceti in the same shape. The integral λ-series/Newton comparison
   and topological bundle construction belong here; the supplier's
   rational symmetric-function action applies after constructing the
   `AdamsOperations ℚ (ℚ ⊗[ℤ] K(X))` instance by tensoring the actual
   operations; prove its base-change comparison and pullback `AdamsHom`.

   Preserve the augmentation and transport to `Kred(X)`, T3's relative
   triples through the actual compact-pair quotient comparison, and
   compact supports through the one-point compactification. Prove pair
   naturality, external products, rank maps, proper pullback
   and open extension, retaining the chosen relative trivialization and
   support comparison. On T4's β=[L]−1∈Kred(S²), prove ψᵏβ=kβ.
   For β_n on S^(2n) from the ordered external Bott product and the
   smash-quotient comparison, export `adamsOperation_bottSphere`:
   ψᵏ(β_n)=k^n β_n, including n=0. Pin its generator comparison to
   T3.4's right suspension order and AT's single sphere/smash homeomorphisms.
   The Bott compatibility square has the explicit factor k; the K⁰
   operations are not asserted to be integral periodic KU-spectrum ring
   endomorphisms when k is not a unit. The construction and its Newton,
   splitting and Bott calculations follow
   [Hatcher, §2.3, Adams operations and splitting](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf).

## T3. Relative complexes, compact support and exactness

1. Define relative triples `(E,F,σ:E|Y≃F|Y)` with isomorphism, homotopy and
   stabilization by `(G,G,id)`; construct addition/inverse, degenerate classes
   and their relations. Retain σ as data. Prove comparison with
   `Kred(X/Y)` for compact Hausdorff closed pairs, including the empty pair
   and based point. Supply neighbourhood extension/gluing and the quotient
   descent proof, rather than assuming a boundary isomorphism determines a
   class uniquely. For the finite-dimensional RelativeSymbol prototype,
   retain both finite-dimensional model-fibre hypotheses as actual declaration
   parameters. In finite local trivializations, fibrewise bijectivity puts
   its boundary matrices in GL; continuous matrix inversion gives the
   continuous inverse family and the total-space bundle isomorphism over Y.
   Compare this global-morphism representative with the intrinsic boundary
   isomorphism model, including neighbourhood extension and stabilization.
2. First construct the source's finite sequences of bundles on X with their
   differentials defined only on Y, exact there, and isomorphism, homotopy and
   adjacent identity-pair stabilization. Separately construct global complexes
   exact on Y and prove their stable-homotopy comparison with that sequence
   model. Extend the split exact sequence to a neighbourhood using the metric
   image/kernel projections and their locally constant ranks; supply projection
   extension and correction of d²=0, then use a cutoff for a global differential.
   If stabilization is needed, prove its precise effect on the class. Do not
   assume arbitrary independent extensions still form a complex. Prove append-zero `L_n→L_(n+1)`
   is an isomorphism for n≥1, both directions, using T1's surjection extension
   for finite CW pairs and extension/gluing for general compact pairs. Prove
   their Euler class agrees with the triple model and is uniquely natural with
   alternating absolute image. Give a proof for the general compact case rather
   than applying a finite-dimensional rank bound to an arbitrary compact space.
   Folding uses an adjoint and is invertible on Y; the original complex differential
   and the folded parity operator are separate maps.
3. Define compact-support K via one-point compactification and prove the
   complex/triple description with an isomorphism off a compact subset,
   uniform compact support for homotopies, and equivalence with the filtered
   colimit over compact pairs/neighbourhoods. Prove metric-independent support
   control, Kc(X)=K(X) for compact X, proper pullback, and open extension with
   identity/composition and pullback/extension compatibility.
4. Construct nonpositive degrees by iterated right reduced suspension
   `suspensionRight`, appending each S¹ coordinate after the base coordinates,
   in order x then y for the two-coordinate comparison with C via x+iy.
   Construct connecting maps `coneBoundary` by clutching/cones with parameter
   increasing from0 to1 and endpoint boundary signs(−0,+1) and the long exact sequence of a pair. Prove
   exactness and naturality in every constructed degree, reduced wedge
   additivity for finite wedges, excision and Mayer–Vietoris, including compact
   supports and their support hypotheses. The sequence `K(X,Y)→K(X)→K(Y)`
   is exact at the middle; its first map need not be injective.
   Reversing the cone parameter negates the boundary, and switching suspension
   factors carries the corresponding graded sign. No blanket
   surjection from the two K-groups of an open cover is asserted.
5. Build relative products
   `K(X,Y)×K(X,Z)→K(X,Y∪Z)` and external products into
   `K(X×X',Y×X'∪X×Y')`; prove independence, graded associativity/commutativity,
   module laws and compatibility with connecting maps and suspensions.
   For compact support the noninvertibility set of the graded tensor complex
   lies in the product of the two compact supports. Specify the block matrix
   with its actual row/column bundle order. For σ:E₀→E₁ and τ:F₀→F₁ use
   `M=[[σ⊗1,−1⊗τ*],[1⊗τ,σ*⊗1]]` from E₀F₀⊕E₁F₁ to E₁F₀⊕E₀F₁.
   Prove M*M has diagonal blocks `σ*σ⊗1+1⊗τ*τ` and
   `σσ*⊗1+1⊗ττ*`; MM* has blocks `σσ*⊗1+1⊗τ*τ` and
   `σ*σ⊗1+1⊗ττ*`. All cross terms cancel. These positive endomorphisms
   prove invertibility outside the support product.

## T4. Complex Bott periodicity without an index theorem

Prove the external-product isomorphism
`K(X)⊕K(X)→K(X×S²), (a,b)↦a⊠1+b⊠β` for compact Hausdorff X.
The proof follows the elementary clutching/polynomial approach of Atiyah–Bott;
all steps below are targets, including independence of the constructed inverse.

1. Construct generalized clutching from an automorphism of the pullback of a
   bundle E→X over X×S¹, in the D₀-to-D∞ direction fixed above. Prove every bundle over X×S² arises this way by T1
   homotopy invariance on the two discs, and give precisely the equivalence
   under changes of trivialization. A clutching map is a continuous family of
   invertible linear maps, not a group homomorphism in the circle variable.
2. Prove uniform approximation of continuous endomorphism-valued circle
   families by finite Laurent polynomials with continuous bundle-endomorphism
   coefficients. Use trigonometric Stone–Weierstrass or Poisson/Fejér means;
   ordinary Fourier partial sums of an arbitrary continuous function need not
   converge uniformly. Prove the relative parameter version over X×I, retaining
   prescribed polynomial endpoints, uniform degree bounds and invertibility
   by a uniform inverse-norm bound. Local approximants are patched as
   endomorphisms in the same bundle, not averaged as automorphisms.
3. Clear negative powers and linearize a polynomial clutching function of
   degree d by the explicit `(d+1)`-block companion pencil with upper rows
   `(1,−z)` and final row `(p_d,…,p_0)`. Prove invertibility on the circle and
   elementary-row/column homotopy to `diag(id_(E^d),p(z))`;
   export additivity and naturality of this stabilization.
4. Consume BanachAlgebras A2's holomorphic calculus and fixed-contour Riesz
   idempotent for continuous endomorphism families whose spectrum avoids S¹.
   Compare its normalized contour formula with the finite-dimensional
   generalized-eigenspace projector: on generalized eigenvectors it is1
   for |λ|<1 and0 for |λ|>1. Prove the two constructions equal, including
   their contour orientation and normalization, and use this one projector
   thereafter. Own its local-matrix/bundle covariance, locally constant
   rank and actual inside/outside image subbundles, finite-dimensional
   generalized-eigenspace characterization and clutching/pullback
   naturality. The scalar/resolvent identities and fixed-contour continuity
   are the generic A2 inputs; self-adjoint spectral theory does not suffice
   for a general companion pencil.
5. Reduce `Az+B` to a pencil with invertible leading coefficient through
   `H_t(z)=(A+tB)z+(tA+B)`, with one uniform t<1 sufficiently close to1 on
   compact X; prove the circle Möbius identity and endpoint invertibility.
   Normalize by the actual left/right inverse in the correct multiplication
   order. Apply the spectral splitting to prove the clutch bundle decomposes
   as the L-twist of one subbundle plus the untwisted other subbundle. Prove
   independence of the extracted K-class from the admissible choice of t by
   a uniform parameter homotopy. Prove the explicit rotation homotopy
   `L⊕L≃L²⊕1`, hence β²=0, here before negative-power clearance uses it.
6. For polynomial p on E define the bundle V_d(E,p) extracted from its
   stabilized linear pencil. Prove its K-class is independent of polynomial
   homotopy and increasing d, that multiplying p by z adds E to V, and that
   direct sum and bundle pullback commute with V. These prove independence
   from Laurent approximation, power clearance and chosen clutching coordinates.
   V_d is the image of the inside Riesz projection of `−A′⁻¹B′` in the
   normalized companion pencil, matching the strict |z|<1 spectral choice.
   The coefficient of β for `z^(−m)p` is `[V_d(E,p)]−m[E]`; prove the sign
   and constant coefficient by computing z, z^(−1), identity and scalar powers.
7. Construct the inverse to the product map, prove both inverse laws, rank
   and basepoint compatibility. Extract `K(S²)≃Z[β]/(β²)` as a corollary of
   the product theorem, not a premise in its injectivity proof.
8. Use T3 relative exactness to pass to smash products and prove
   `Kred(X)≃Kred(S²∧X)`. Extend to compact pairs, compact supports and every
   suspension degree. Define the full Z-graded 2-periodic theory with natural
   products, connecting maps and periodicity comparisons. Compute all sphere
   groups and the coefficients `K*(pt)=Z[u,u^−1]` with |u|=−2. Pin
   `Σ²S⁰≃C⁺` by `(x,y)↦x+iy` with its ordered coordinates and set u=β
   under the reduced-sphere/right-suspension comparison. Positive degrees
   and their boundaries use multiplication by u and its inverse. Compute the
   endpoint normalization: if γ∈K^(−1)(I,∂I) is carried to u by the ordered
   right suspension, then `coneBoundary(0,1)=u^(−1)γ` in K¹(I,∂I). Derive
   it from the negative-degree cone map before transporting by periodicity.

## T5. Complex Thom classes and pushforwards

1. Construct the Koszul class of a finite-rank complex bundle E→X on its total
   space, using disc/sphere or compact-support relative data. Prove exactness
   away from zero, its folded invertibility, metric independence, zero-section
   restriction `λ_(−1)(E*)`, pullback, direct sums and graded tensor formulas.
   If X is noncompact the class is fibre-compact; define the corresponding
   multiplier on Kc(X), and prove the product has genuine compact support in E.
   Do not call the bare class compactly supported over a noncompact base.
2. For a complex bundle E of CONSTANT rank r≥1, prove the ordinary
   projective-bundle theorem with t=[O_(P(E))(−1)], basis
   1,t,…,t^(r−1) over K(X), and relation
   `Σ_(j=0)^r (−1)^j [Λ^j E] t^(r−j)=0`.
   For r=0, P(E)=∅ and its K-group is0, with the empty basis; the
   corresponding relation is1=0 in this zero target ring, not CP^(−1).
   For locally constant variable rank apply the constant-rank theorem on
   each clopen rank stratum X_r, and assemble the idempotent-stratum
   module description. A compact base has finitely many such strata;
   no global free module of one fixed rank is asserted. The relative
   version uses (X_r,Y∩X_r); compact supports meet only finitely many
   rank strata and assemble through T3.3. First give CP^(r−1) its affine-cell
   filtration and identify the relative cell generator with the Koszul external
   Bott product from T4, including the factor (−1)^k for a k-dimensional
   complex cell in the dual-Koszul convention. For every compact Hausdorff parameter A run the
   filtration on A×(CP^k,CP^(k−1)); T4's relative Bott identifies its relative
   groups with K*(A). Compute K*(A×CP^(r−1)) through this parameterized
   filtration, proving it free over K*(A) on 1,…,t^(r−1), and identify
   the powers of the tautological class, including the transition signs. Then
   prove the K-theory Leray–Hirsch statement for a finite trivializing cover by
   Mayer–Vietoris and its degree-shifted diagram: fibre basis classes supplied
   globally on P(E) give the module isomorphism. Use compact closed refinements
   or compact-support open-cover statements with their exact hypotheses, not
   an unqualified K-group surjection from an open cover. The tautological
   bundle sequence and λ-identities give the displayed relation. Prove the
   corresponding free-basis theorem for K(X,Y) on compact closed pairs, and
   its compact-support colimit version on noncompact bases.
   Build the coordinate-free twisted-line proof as well, for M→X and
   P(M⊕1), following Atiyah–Bott §§2–5. Laurent coefficients for clutching
   E₀→E∞ on S(M) are maps M^k⊗E₀→E∞; companion stabilization retains
   those line powers. For a linear pencil p(z)=az+b define the two intrinsic
   projectors `Q₀=(1/(2πi))∮p⁻¹dp` and `Q∞=(1/(2πi))∮dp p⁻¹`.
   Prove their continuity, frame independence, idempotence and
   `p Q₀=Q∞ p`. The pointwise calculation uses T4's resolvent lemma, but
   no global leading-coefficient normalization is assumed. Prove the split
   pencil is invertible outside/inside S(M) and homotope it by scaling b on
   its outside block and a on its inside block. Construct the global inverse,
   its homotopy/degree/Laurent-clearance independence and both inverse laws.
   With tautological t this proves the rank2 relation `(t−1)(t−[M])=0`.
   This intrinsic proof supplies T6's equivariant line case without invoking
   a nonequivariant local cover.
3. Prove the Thom isomorphism `Kc(X)→Kc(E)` by multiplication by the Koszul
   class. For a trivial line it is −β, so compare its multiplier with the
   negative of T4's β Bott map and prove both inverse laws in that convention.
   For a line bundle prove
   it using the projective compactification/exact sequence in item2. Pull back
   a higher-rank bundle to its iterated projective flag bundle, where it splits
   into lines; prove K-theory pullback injective by the projective basis theorem
   for the splitting identities. Prove the ordinary Thom isomorphism by
   finite-cover Mayer–Vietoris from the trivial
   Bott theorem, with its support diagrams. T6 supplies a different transfer
   argument for general compact-group equivariance. At this point prove the
   λ-product identities of T2.3 using the injective flag pullback.
4. Prove Thom module, naturality, direct-sum, zero-section and inverse laws,
   comparison of relative disc/sphere and full-bundle compactification models,
   and agreement with the Clifford exterior action from SpinRepresentations
   in its negative-metric convention. Export the Euclidean Bott inverse with
   normalization at the point.
5. For a closed smooth embedding of compact manifolds with a specified complex
   structure on its normal bundle, compose Thom with open tubular extension
   to define the K pushforward. Prove independence of metric/tube choices,
   isotopy and direct-sum stabilization, composition under compatible complex
   normal structures, projection formula and transverse pullback. Consume
   GeometricTopology's actual tubular map; K-theory owns its support/extension
   comparison. For proper embeddings of noncompact manifolds state support
   conditions and prove the compact-support version.

## T6. Equivariant K-theory and associated-bundle products

G is a compact Lie group. Base actions are continuous and bundle actions are
continuous, fibrewise linear and cover the base action. Use compact G-spaces for
ordinary theory, locally compact Hausdorff G-spaces for compact support, and
invariant closed pairs. Smoothness is an extra hypothesis on the manifold
comparisons, not an assumption on every K-object.

1. Construct equivariant bundle metrics by Haar averaging, sums/tensors/duals,
   pullbacks and their small category. Prove equivariant splitting of bundle
   exact sequences. Consume CompactGroups Layer5.1's G-finite-vector
   predicate and density for strongly continuous Banach representations,
   with its integrated-action normalization. Construct the sup-norm action
   on continuous sections and prove strong continuity. For a finite invariant
   Radon measure and invariant continuous Hermitian metric construct the
   L²-section action, prove strong continuity and unitarity, and compare
   continuous sections with their L² realizations. Applying the same generic
   density theorem to these two spaces is an application here, distinct from
   NQS M0's isotypic projection/multiplicity decomposition.
   For a compact G-base choose finitely many sections with surjective
   evaluation; approximate them by G-finite sections sufficiently in sup norm
   to retain surjectivity, sum their finite-dimensional orbit spans and
   construct X×V→E. Use its invariant Hermitian complement to obtain the
   finite equivariant embedding. The ambient representation need not be
   trivial. Peter–Weyl for C(G) or an L²-density statement alone is not
   substituted for this sup-norm section argument.
2. Construct K_G, relative and compact-support groups and products by T2/T3's
   same machinery; prove equivariant homotopy invariance, proper pullback,
   invariant-open extension, exact and Mayer–Vietoris sequences. Define R(G)
   as SplitK0 of the finite-dimensional full subcategory of genuine continuous
   representations: use Mathlib ContRepresentation with the additional
   continuity of G→(V→L[C]V), which that carrier alone does not require.
   Construct biproduct/monoidal instances and compare with compact-group
   representation models. This algebraic representation-ring construction is
   independent of K_G and precedes Bott or analytic indices. Construct the
   external tensor product R(G)×R(H)→R(G×H), induced by external tensor
   of continuous finite-dimensional representations; prove bilinearity,
   compatibility with tensor multiplication, restriction and forgetful maps,
   and its tensor-of-irreducibles comparison using compact-group Schur
   and complete reducibility. Export the forgetful ring map to TauCeti.repRing C G;
   prove it an isomorphism for finite discrete G, not for arbitrary compact G
   where abstract representations may be discontinuous. Prove the ring
   isomorphism K_G(pt)≃R(G), restriction maps
   and naturality under continuous homomorphisms. No injectivity of restriction
   to a connected torus of a disconnected group is presumed.
3. Make T4's approximation, companion homotopy and spectral splitting
   equivariant: average endomorphism coefficients, use uniform approximation
   before homotopy, and prove contour projections intertwine the action.
   Obtain equivariant Bott for the trivial complex line. Make T5.2's typed
   twisted-line Laurent coefficients, line-power companion blocks and intrinsic
   two-projector integrals equivariant. Prove equivariant Fejér approximation
   over the circle bundle, covariance of dp and frame-independent projectors,
   and use its block-scaling homotopy, which respects the line action. The
   trivial-line Möbius homotopy is not asserted for a nontrivial character.
   Prove the quotient-polynomial inverse and both inverse laws equivariantly;
   identify the supported kernel generator with the stated Koszul class.
   This gives equivariant Thom for complex line bundles, and for their direct
   sums by the Koszul tensor identity. No assertion that an arbitrary
   equivariant bundle splits into lines on an invariant cover is used.
4. Let H be a compact Lie group. For a free proper H-action whose quotient
   map is a numerable principal
   bundle, construct equivariant-bundle descent and its inverse, retaining a
   commuting G-action, and prove
   `K_(G×H)(Y)≃K_G(Y/H)` and relative/compact-support versions. Build the
   continuous principal/associated-bundle category needed here and compare
   smooth descent with SmoothBundlesConnections. Prove the supported-subset
   correspondence and properness of the quotient for compact H. Also prove
   change-of-group `K_H(X)≃K_G(G×_H X)` for a closed subgroup H of G,
   consuming SmoothBundlesConnections B1.4's principal map G→G/H.
5. Construct the following family index specifically for the unitary subgroup
   transfer. For compact Hausdorff parameter X and the fixed compact complex
   projective fibre F=CP^(r−1), every topological finite-rank bundle on X×F admits
   a representative smooth in the fibre direction, with continuous dependence
   on X in all required vertical derivative seminorms. Prove the corresponding
   relative and equivariant approximation/isomorphism/homotopy statements.
   Pin this carrier by an equivariant self-adjoint idempotent matrix
   `p:X×F→M_N(C)` acting on a unitary representation with fixed model
   `EuclideanSpace C (Fin N)`,
   with all derivatives in F continuous on X×F; E is its actual image bundle
   from T1. Give this regularity the finite-chart C^k seminorms and prove their
   chart independence. Construct the projected vertical connection
   `∇=p∘d_F∘p` and compare other vertical connections through affine homotopies.
   Realize L²/H¹ fibres as the images of multiplication by p on fixed
   `L²/H¹(F,C^N⊗Λ^(0,•))`, proving boundedness and nearby-image charts from
   continuity of p and d_F p. This is the continuous-base/smooth-vertical
   carrier; X itself has no asserted manifold structure.
   Obtain L² and integer Sobolev Hilbert bundles by local identification of
   nearby projection images over the compact fibre, comparing with
   SmoothBundlesConnections B2 and K5's actual carriers. Prove separability and
   compare these complete Hilbert spaces with one fixed Hilbert model on each
   rank stratum, using orthonormal-basis classification; construct the actual
   Mathlib bundle instances. Zero-rank and point-fibre cases use their finite
   models separately. Prove that vertical
   even-to-odd Dolbeault–Dirac operators twisted by these bundles define a
   continuous family of bounded maps H¹(Ω^(0,even)⊗E)→L²(Ω^(0,odd)⊗E). Their squares have Laplace-type principal
   part; prove uniform local estimates, compact embeddings, regularity and
   Fredholmness from K5's static estimates plus compact parameter/fibre
   localization, with every uniformity bridge explicit. In particular derive
   `‖u‖_(H¹)≤C(‖D_x u‖_(L²)+‖u‖_(L²))` with one C on a compact
   parameter neighbourhood, and the adjoint estimate. Prove distributional
   adjoint-kernel regularity, finite kernel/cokernel and closed range; a
   second-order static estimate alone is not the asserted first-order API.

   Stabilize a continuous family of Fredholm maps by a finite equivariant
   bundle W of target sections so that `(D,W)` is fibrewise surjective; over
   a compact base choose W from a finite-dimensional group representation
   using item1. Prove operator-norm openness of surjectivity for the infinite
   Hilbert target: a surjective Fredholm map has a bounded right inverse from
   its complemented kernel, and a Neumann-series perturbation retains a right
   inverse. Consume the native Fredholm package's neighbourhood normal form.
   Prove its kernels
   form a continuous finite-rank bundle, with local graph charts and constant
   dimension where asserted. Define `[ker(D,W)]−[W]`; prove independence of
   stabilization, changes of vertical connection, smoothing choices and
   homotopy, plus direct sum, pullback and the projection formula under
   tensoring by a bundle pulled from X. Consume Mathlib's native Fredholm
   package/openness/index APIs and the additional Tau Ceti perturbation/family
   APIs named above. Export this kernel-bundle family-index construction for
   the closed-manifold index development's finite-family consumers; its elliptic construction here is
   limited to the projective transfer. This is not an
   Atiyah–Singer theorem or a theorem about arbitrary elliptic symbol families.
6. Construct the block subgroup H_r=U(r−1)×U(1), its principal quotient,
   and the equivariant diffeomorphism `U(r)/H_r≃CP^(r−1)` with the projective
   charts of ComplexKahlerGeometry K7 and GeneralizedCohomology G4.0b's
   smooth graph charts on T1.5's same complex Grassmannian carrier.
   Consume G4.0b's rank-one graph-chart/native-Projectivization diffeomorphism
   with K7's same projective smooth structure; prove
   this homogeneous quotient diffeomorphism and its U(r)-equivariance by
   composing that comparison with the actual frame/plane quotient maps.
   Own the bundle comparison carrying T1.5's tautological line through that
   rank-one map to K7.2's O(−1), retaining the underlying fibre inclusion and
   U(r)-action.
   Consume K7's projective Dolbeault/Hodge calculation to extract
   `H^(0,0)(CP^(r−1))=C`, with trivial U(r)-action, and
   `H^(0,q)(CP^(r−1))=0` for q>0. Prove the constant-function/action comparison;
   a bare dimension equality is insufficient. Include r=1 point and rank0
   cases separately.

   For compact Lie G and a compact G×U(r)-space X, use the family of item5
   and change of group
   `K_(G×H_r)(X)≃K_(G×U(r))(X×CP^(r−1))` to define the projective transfer
   `K_(G×H_r)(X)→K_(G×U(r))(X)`. Prove its module projection formula and
   transfer(1)=1 from those harmonic representations, hence that it is a left
   inverse of restriction. Iterate with the remaining U(r−1) factor, treating
   the U(1) factors as commuting spectators, to construct
   `K_(G×T)(X)→K_(G×U(r))(X)` left inverse to torus restriction. Prove the
   compact-support and relative versions by the exact sequences, and prove
   extension and Koszul-multiplier compatibility. This is the general
   equivariant splitting needed for Thom, established by projective families
   before using any equivariant projective-bundle module-basis theorem.
7. For any complex G-bundle E, lift to its unitary frame principal U(r)-bundle
   P, retaining the commuting G-action. On P the pullback is the trivial
   `(G×U(r))`-bundle with standard U(r) fibre action. Restrict U(r) to T;
   its standard representation splits into character lines, so item3 gives
   Thom there. Use the transfer on base and total space and its Koszul
   compatibility to prove injectivity and surjectivity before descending along
   P→X by item4. Treat variable ranks on invariant clopen strata. This proves
   general complex equivariant Thom and representation Bott
   `R(G)≃K_(G,c)(V)`, including nontrivial G-action on V. Afterwards derive
   the equivariant projective/flag module-basis and relation theorems from
   these Thom/transfer maps, with the explicit inverse and descent laws.
8. For a smooth principal bundle P→X of a compact Lie group H, with commuting
   smooth G-action and compact smooth base X, and a compact smooth
   G×H-manifold F, set Z=P×_H F. Build associated bundles of representations,
   exterior/tensor/pullback comparisons, the vertical tangent bundle and
   `0→T(Z/X)→TZ→π*TX→0`. Choose an invariant splitting and prove its space
   is contractible. Construct
   `K_(G,c)(TX)×K_(G×H,c)(TF)→K_(G,c)(TZ)` and
   `R(G×H)→K_G(X)` with bilinearity, associativity, base change, extension
   and Thom compatibility. Prove compactness of the product support from
   the factor supports and compactness of H in principal local trivializations;
   also prove the noncompact X/F version for classes whose supports K_A⊆TX
   and K_B⊆TF are compact. Before multiplication, the pullback of the TF symbol
   to P×TF is a vertical-support multiplier, exact outside P×K_B, not a Kc
   class. Define that relative-complex multiplier and multiply with the TX
   symbol; the resulting support lies above K_A and K_B simultaneously.
   Prove that intersection compact after quotient using compact H and finite
   principal trivializations over the compact projection of K_A. No nonproper
   pullback on Kc is used.
   These are products of classes, not assertions about operator kernels.
9. Prove associated Thom-class naturality: exterior powers, Koszul
   differentials and folding commute with association. For a real O(n)-bundle
   N, apply this to its complexification and prove its class is associated
   to the O(n)-equivariant Koszul class of C^n. Export this interface for the
   index embedding proof without proving an analytic index value.

## T7. Real K-theory and concrete acceptance calculations

**T7.0. Stable classifier inverses.** Use T1.6a's actual
`stableRealGrassmannian` BO and stable oriented classifier, with their
trivial-bundle basepoints and prepend-line tower, T1.6b's actual BO sum μ and
T1.6c's `stableOrientedGrassmannianWhitneySum`. Retain its proved ε_k·Whitney
finite formula, normalized diagonal and natural stable Whitney comparison.
This inverse construction follows T1.6 and precedes the real Bott comparison
of item1 and G5.0's stable-Spin inverse supplement.

On AT4.5's native CW product P=k(BO×BO), with the pair of marked trivial
0-cells as basepoint, identify P with T1.6b's CompactlyGenerated product
by the k coreflection universal property. Construct the based shear
`stableRealGrassmannianShear`, sh(x,y)=(x,μ(x,y)), and the continuous
map x↦(x,*) through that identification, using `cwProductKelley`. Its basepoint equation is strict,
since μ(*,*)=*. Consume AT8.1's `homotopyGroupKelleyProduct` for the
native product homotopy-group comparison.
The based unit homotopies identify the two restrictions of μ with identity;
prove μ_*(a,b)=a+b. In degree1 prove commutativity by the Eckmann–Hilton
comparison between loop composition and the H-space sum; in higher degrees
use the native group law, and treat components using connectedness of BO.
Thus sh_* is (a,b)↦(a,a+b), with inverse (a,b)↦(a,b−a).
Apply AT8.5's full CW Whitehead theorem, then AT4.5's
`basedHomotopyInverseOfEquivalence` on the marked 0-cell cofibrations to
obtain a based homotopy inverse g with both inverse homotopies rel basepoint.
Export g and those actual homotopies with their endpoint equations.

Define `stableRealGrassmannianInverse` by ν(x)=pr₂(g(x,*)), and export the
actual based continuous self-map. The first projection of sh∘g≃id identifies
pr₁(g(x,*)) with x; combine this homotopy with its second projection to
construct μ(x,ν(x))≃*. Derive μ(ν(x),x)≃* by T1.6b's commutativity,
and ν∘ν≃id by associativity, unit homotopies and cancellation. All these
homotopies are rel basepoint. Compare ν with the group inverse on compact
Hausdorff bases through T2.1's actual real classifying/group-completion map.
On each finite Grassmannian Gr(k,ℝ^N) compare it with the reduced
orthogonal-complement class [γ^perp]−[1^(N−k)], using the actual
bundle isomorphism γ⊕γ^perp≃1^N. In BO×ℤ pair this with rank−k to
recover the full inverse [γ^perp]−[1^N], with the BO×ℤ inverse defined
by (x,n)↦(νx,−n). Export the unbased comparison homotopy and named
`stableGrassmannianInverseComplementComparison_stabilization` homotopies
for its ambient/rank stabilization squares. Track the coordinate basepoint
path from span(e_k,…,e_(N−1)) to the standard (N−k)-plane in
Gr(N−k,ℝ^(2N)): for each i=0,…,N−k−1 first perform a positive
quarter-turn in the ordered plane (e_(k+i),e_(N+i)), then in
(e_(N+i),e_i), with the path parameter increasing in that order. The
endpoint frame is (e₀,…,e_(N−k−1)); the raw finite
complement map is not a based map. Require the comparison from that
complement map to ν to have this precise projected basepoint track.
Prove π₁(BO) acts trivially on the based-to-free map-class comparison
using its H-group sum, so the unbased comparison can be given that track;
retain it in the cancellation diagrams. Include k=0 and k=N (the latter
has the empty complement frame and constant path). At k=0 the specified
track is the null-homotopic backtracking loop. No finite-rank
complement over the full stable classifier is asserted.

Lift ν composed with orientation forgetting through T1.6c's universal
BSO→BO cover, using the simply connected based CW domain BSO, to
`stableOrientedGrassmannianInverse`. Export its exact forgetting square,
left/right cancellation with `stableOrientedGrassmannianWhitneySum`,
double-inversion homotopy and the corresponding finite-complement
comparisons with their orientation and basepoint paths. Orient V^perp by
placing an oriented frame of V first and a frame of V^perp second in the
positive ambient frame. Thus γ̃⊕γ̃^perp≃1^N preserves its natural
Whitney orientation. Use T1.6c's natural stable Whitney comparison and
uniqueness of the oriented inverse to obtain the finite comparison,
retaining its actual orientation/basepoint paths. Use existing
Tau Ceti based-cover lifting and Mathlib relative homotopy lifting, keeping
the positive trivial orientation at the basepoint throughout each lifted
homotopy. GeneralizedCohomology G5.0 owns the further based Spin lift and
its characteristic-class consequences; G2.8 owns the generic
Γ/permutative infinite-loop machine.

1. Develop KO⁰'s finite-bundle/relative/support API and all negative suspension
   degrees, reusing T1.6's unoriented BO classification and its oriented BSO
   comparison. First work on finite CW pairs. Use HomotopySpheres §4B.1–4B.9's
   actual stable-space maps, increasing-connectivity comparisons and Clifford
   comparison; identify the eight coefficient groups by sphere clutching.
   Construct the category of finite-dimensional Z/2-graded real Clifford
   modules, its restriction functors and the cokernels of their Grothendieck
   group maps; these graded-module interfaces are additional work here, beyond
   SpinRepresentations' algebra classification. Define the real ABS classes
   using those graded modules and Clifford
   multiplication on the disc, modulo extension to one higher Clifford algebra.
   Prove this respects that quotient and agrees with the sphere-clutching
   comparison, and that graded tensor product corresponds to external product.
   Compute the module restriction cokernels and tensor products in degrees0–8
   from SpinRepresentations' real Clifford classification. Choose η in degree−1
   as Möbius−1, a in degree−4 and b in degree−8 by the specified irreducible
   module representatives, with negative quadratic form Cl(0,n): the raw
   volume e₁⋯e₄ acts by −1 on the even part for a, and e₁⋯e₈ by +1
   for b. Prove the
   low-degree geometric comparison: Möbius clutching in degree1, the explicit
   winding-one SO(2) loop and its stable Z/2 class in degree2, quaternionic Hopf
   clutching in degree4, and the degree8 class compared with the supplier's
   real Bott map. In particular prove the Clifford tensor square of the
   degree1 representative gives that nonzero stable loop; an additive table
   alone cannot show η²≠0. Prove η² is the nonzero degree−2 generator,
   `2η=η³=ηa=0` and `a²=4b`. On the Clifford-module quotient side prove
   eightfold periodicity via a graded-Clifford Morita equivalence: construct
   tensoring with the degree8 irreducible graded module, prove it intertwines
   restriction, and compute its action on both simple-module generators using
   grading/volume-element signs and dimensions. The ungraded matrix-algebra
   periodicity of the supplier is an input to that proof, not the entire proof.
   For every n≥0 prove the precise geometric bridge: the coefficient map B_n
   induced by RB's composite eight loop equivalences satisfies
   `B_n(α_n(m))=α_(n+8)(m⊗λ₈)` for the ABS maps α and chosen graded
   degree8 module λ₈. Construct the pointed comparison homotopies from the
   supplier's concrete geodesic/stable maps, respecting the ordered eight
   Clifford generators and stabilization; this full-degree compatibility is
   a target here, beyond citing §4B.9's general comparison statement. Using
   the degree0–7 clutching checks and the two periodic isomorphisms, prove
   α_n bijective for every n. ABS multiplicativity then identifies B_n with
   external product by b in every degree, including ηb≠0 and the other
   torsion generators. No additive period table alone proves this bridge. This
   proves the ring, not just the additive table. Pin complexification by
   `c(a)=2u²`, `c(b)=u⁴`, where u is T4's degree−2 generator; compute c and r
   on all eight degrees with the real/quaternionic module comparisons.
   In particular prove `r(1)=2`, `r(u)=η²`, `r(u²)=a`, `r(u³)=0`,
   `r(u⁴)=2b`, and c kills the η-torsion. The KO coefficients in degrees
   0,−1,…,−7 are respectively Z,Z/2,Z/2,0,Z,0,0,0, with periodicity
   given by this b, not just an unnamed additive isomorphism.

   Multiplication by this actual b is a natural map of relative cohomology
   theories. Prove it an isomorphism on finite CW pairs by the cell relative
   groups and five-lemma induction. In degree0 use the attaching-map mapping
   cylinder pair `(M_f,∨S^(k−1))`, whose quotient is the attached skeleton,
   so KO⁰ of that skeleton is central in five defined nonpositive-degree
   exact-sequence terms; do not use an undefined positive-degree endpoint.
   The construction precedes identifying a weak stable-space
   equivalence with an arbitrary compact-source mapping equivalence. Extend
   to all compact Hausdorff pairs by the following continuity theorem, owned
   here: represent a compact base by its finite-coordinate finite-polyhedral
   neighbourhood system in a cube and prove the K/KO groups are the filtered
   colimits of those finite CW groups. Supply the system and refinement maps;
   prove descent of matrix-projection representatives, stabilized isomorphisms
   and homotopies by uniform approximation and spectral projection, including
   the relative data and X×I version. Then pass product-by-b and exact sequences
   through that colimit, and through the compact-support colimit of T3.3.
   Export the full Z-graded theory and coefficient ring
   `Z[η,a,b,b^−1]/(2η,η³,ηa,a²−4b)`, with degrees−1,−4,−8. Algebraic Clifford
   periodicity supplies the module calculation, while the geometric identification
   uses the real Bott proof supplier; neither substitutes for the other.
2. Compute K⁰(S¹)=Z, KO⁰(S¹)=Z⊕Z/2 and their geometric generators; the
   reduced real generator is Möbius−1. Compute the ring K⁰(S²)=Z[β]/(β²)
   with the specified gluing line, all complex sphere groups, and verify
   real/complex dimension-zero and disconnected-base rank examples.
3. Give explicit failures of relative injection and restriction surjection:
   for the pair (D²,S¹), `K(D²,S¹)≃Z→K(D²)` is zero, whereas for
   `(D³,S²)` the restriction `K(D³)→K(S²)` misses β. Include the full long
   exact fragments and the connecting generators.
4. Prove the doubled-space formula
   `K(X,Y)≃ker(K(X∪_Y X)→K(X))`, where the restriction is to one copy and
   the folding map splits it; construct the triple/gluing comparison. Prove
   finite-sequence append-zero stabilization and the alternating Euler map
   give the relative ring isomorphism L1≃K. Apply T2.4's trivial-kernel
   monoid criterion to the stabilized sequence model.
   Verify graded external-product supports and the exact block-map ordering.
5. On the disc/sphere of a complex bundle verify zero-section λ_(−1)(E*),
   complex Thom naturality and exterior-product multiplicativity. Check the
   equivariant point ring and the free-action descent examples. Construct the
   sphere de Rham symbol on the continuous dual of Mathlib's tangent bundle:
   fibres `TangentSpace I x →L[R] R` with model `R^n →L[R] R`, using Mathlib's
   Hom/dual bundle construction and SmoothBundlesConnections B2's dual metric.
   Prove the real metric identification with tangent fibres and its O(n)
   equivariance. For Sⁿ=Rⁿ∪{∞}, define the finite-support point classes q₀ and
   q∞ by invariant coordinate-ball representatives, extending through the open
   chart inclusions of T3.3. In the first chart fix the complex coordinate
   `w=v−ix` on `R^n_x⊕R^n_v`. Compare the wedge representative `w∧−`
   with T6.7's O(n)-representation Bott class of Cⁿ and T5's dual-Koszul
   convention, retaining the explicit determinant/parity conversion.
   Prove the two-chart homotopies `(v−isx)∧−` and `(v+isx)∧−`, their compact
   support control, the reflection transition on the equator and cotangent
   negation. Prove the global equation `ρ_(Sⁿ)=q₀+f* q∞` in that wedge
   convention, where `f(x,v)=(x,−v)`. The q-classes are these explicit chart
   extensions, not undefined embedding pushforwards; no analytic index value
   normalizes the equation.

## Dependency order and references

T1→T2's additive/λ-sum basics→T3 supplies the cohomology machinery used by T4;
T1.6 constructs the stable carriers before T2.1's BU×ℤ classifying comparison.
T7.0 constructs their inverses from the connected H-space shear using AT4.5,
AT8.1, AT8.5 and T2.1; it consumes neither the real Bott proof nor characteristic classes.
T2's λ-product identities and T2.5's Adams operations follow the T5
splitting theorem; their Bott-sphere calculation uses the earlier T4 Bott
comparison and no Hopf-invariant-one or bordism coefficient input. T4 precedes T5. T6 first constructs equivariant bundles and line Thom, then
descent, the projective-family index and normalized transfer; only then does it prove
general equivariant Thom and projective comparisons. T7's real
periodicity consumes the existing HomotopySpheres proof, independently of the
complex Thom and index developments. Every analytic step in T4 concerns finite
matrix/bundle families; no elliptic operator or index theorem proves Bott.

- Atiyah–Bott, [*On the periodicity theorem for complex vector bundles*](https://doi.org/10.1007/BF02391772), Acta Math.112 (1964), 229–247, for the polynomial-clutching proof.
- Hatcher, [*Vector Bundles and K-Theory*](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), §1 and §§2.2–2.3, for bundle/classification foundations, the elementary product proof and Adams operations.
- Kriz–May, [*Operads, algebras, modules, and motives*](https://www.math.uchicago.edu/~may/BOOKS/KM.pdf), the section “The linear isometries operad”, for the finite-support universe and compactly generated coordinate-choice topology; T1.6 builds the actual frame/coherence comparisons.
- Freed's K-theory lectures, [notes by Arun Debray](https://www.math.purdue.edu/~adebray/lecture_notes/m392c_Knotes.pdf), §§5–6, for the companion-pencil, spectral bundle and inverse-independence proof spine, with uniform approximation and signs proved as specified above.
- Segal, [*Equivariant K-theory*](https://www.numdam.org/item/PMIHES_1968__34__129_0/), Publ.Math.IHÉS34 (1968), for equivariant bundles, representation embeddings, descent and complex Thom theory.
- Atiyah, [*Bott periodicity and the index of elliptic operators*](https://doi.org/10.1093/qmath/19.1.113), Quart.J.Math.19 (1968), §§2 and4 (especially Proposition4.9), for the minimal family-index transfer; prove the analytic bridges of T6.5 rather than importing a general index theorem.
- Atiyah–Bott–Shapiro, [*Clifford modules*](https://doi.org/10.1016/0040-9383(64)90003-5), Topology3 Supplement1 (1964), §§6 and11, for the graded-module product computation and its geometric comparison in T7.
