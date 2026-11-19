# Roadmap: schubert geometry, Demazure sections and flag K-theory

**Summary.** Build the scheme and section interfaces for Schubert varieties in general reductive flag varieties: relative incidence and universal bundles, root-coordinate cells and their closures, all-word Bott–Samelson operations, dominant line-bundle cohomology, compatible Frobenius splitting, all-degree standard monomial theory, exact divisor multiplicities and algebraic flag K-rings. The finite-type Lakshmibai–Seshadri path engine is consumed from the pinned Tau Ceti, whose `TauCeti/RepresentationTheory/LSPath/` and `TauCeti/RepresentationTheory/Crystal/` files already prove its paths, root operators, string lengths, central transport, bond arithmetic and normal-crystal algebra; this roadmap completes it (operator stability of the path set, components, characters and the tensor rule) and builds its geometric section comparison. Compare the complex realization with the existing compact flag topology. The suggested home is `TauCeti/AlgebraicGeometry/Schubert/`.

Use schemes, sheaves of modules, root data and rational representations at their stated hypotheses. A point-set rank condition is a comparison interface for a scheme, not its definition as a variety. Singular Schubert varieties are not declared smooth.

## Scope and ownership

This roadmap owns the general finite-root-datum path theory, Schubert schemes,
word resolutions, geometric sections, splitting, standard monomial theory,
Chevalley divisors and flag K-rings. The relative Grassmannian, generic coherent
cohomology and representation-theoretic foundations have the owners
listed in the supplier contracts below. Abstract Coxeter combinatorics
(exchange, deletion, Matsumoto's theorem, the Bruhat order and its parabolic
quotients), the Weyl group of a root datum as a Coxeter system and the
numbered integral root data are already in the pinned Tau Ceti and are
consumed from it directly, as listed in the supplier contracts. So are the
integral Demazure operators of a root datum (their strings, localization
identity, idempotence, braid relations, word independence, Levi and wall
cases and longest-element formula), the normal crystals (strict morphisms,
components, direct sums, tensor products with Kashiwara's tie convention,
central weight twists and formal characters) and the Lakshmibai–Seshadri
encodings with their rational paths, root operators, string lengths, bond
arithmetic, central transport, stretching and convexity: S3.3–3.4 own only
the geometric interpretation of the Demazure operators through sections, and
S4 owns the operator stability, component, character and tensor theorems of
the path set. The pinned Tau Ceti also has the Grassmannian scheme of a module
over an affine base with its functor of points and properness, the pivots and
echelon cells of a subspace relative to a basis flag with their dimension and
partition count, the isotropic-locus ideal of a bilinear form on the
Grassmannian functor, and the extension of a basis of a Lagrangian subspace to
a symplectic basis; S1.1, S1.3 and S1.5 consume them and build only the scheme
structures they lack. S1.0–1 owns
the relative parabolic quotients and finite-locally-free flag incidence needed
here; S2 owns the
integral word models and S5.6 their Schubert closure and base-change theory.
S9.0 owns the coherent analytic foundations required for S9: complex
analytic spaces with nilpotents, the analytification of complex schemes
locally of finite type with its underlying classical point space X(ℂ) and the
holomorphic charts of smooth schemes, coherent analytification and proper
GAGA. These are prerequisites of the base programme. The holomorphic orbit
submersion of a closed orbit, its holomorphic local sections and the
biholomorphism G(ℂ)/H(ℂ)≃O_x(ℂ) belong to ReductiveGroups §3A.5; S9.1 and
S9.8 apply them to the flags and do not rebuild them.
No layer here constructs or consumes a holomorphic Picard group: S3.1's
forgetful map lands in the Picard group of the scheme G/P−, S5's vanishing theorems are algebraic coherent cohomology, and S9.8 retains
only the algebraic-to-holomorphic equivariant-line adapter, with specified
transition functions and fibre maps. The generic holomorphic Picard group
Pic_hol(M)≃H¹(M,𝒪^×) of a complex manifold and its exponential sequence are
not targets here. The ordinary holomorphic Picard group of the compact flag
K/H, its root-degree basis and the compact character-to-degree forgetful map
belong to GeometricQuantization §§3.3–3.4.
The holomorphic Lefschetz fixed-point formula on the flag and word
analytifications, the word fixed-point formula for the torus Euler character
χ_T(Z_Q,π_Q*L(λ)) that it gives, and the comparison of that formula with
S3's Demazure recurrence are not targets here: they are left to a
SchubertGeometry Part II placed after IndexTheory, whose I8 builds the
generic holomorphic fixed-map trace; nothing is imported from IndexTheory in
this roadmap.
The type-A coordinate-path comparison
and tableau applications are downstream consumers of the general path theory.
The transverse complex Grassmannian incidence count (TensorProductCombinatorics
§6.3) and the ordinary puzzle rule (its Layer 6) are not targets here. Nor is
the general Betti cycle-class map of complex varieties, which is not a target
here: S7.3 constructs only the flag comparison.

## Conventions

Fix a split connected reductive group G over a field k, a pinning when root coordinates are used, T⊂B+ with positive roots Φ+, and the opposite Borel B−. Write X=X*(T), Y=X_*(T), with their actual perfect pairing, W for the Weyl group and I for the simple roots. Keep the central lattice and the isogeny type. Unless separately specified, flags mean right quotients G/P−, with P− containing B−. Minimal representatives belong to W/W_P. The standard Schubert cell is C(w)=B−wP−/P− and X(w) is its schematic closure; its dimension is ℓ(w), e is closed and the longest minimal representative is open. Opposite Schubert loci use B+. Convert left quotients and positive-Borel sources by explicit inversion/opposition maps. An unqualified Schubert union is a finite union for this one fixed Borel, or for one common opposite Borel after the stated transport. Mixed standard/opposite families are named explicitly and retain their own ideal and cohomology conditions.

For λ∈X, the associated line L(λ)=G×^(B−)k_λ has fibre character λ at e. Sections are regular functions f(gb)=λ(b)^−1f(g), with (g·f)(x)=f(g^−1x). Dominant λ have nonnegative pairings with simple coroots; for descent to G/P− require zero pairings on its Levi simple roots. The rank-one restriction has degree ⟨λ,α_i∨⟩. Thus H⁰(G/B−,L(λ)) is ∇(λ), whereas ordinary Δ(λ)* is ∇(−w₀λ). Distinguish this from the pinned contravariant dual D_τΔ(λ)=∇(λ).

Over an arbitrary base S, relative finite-locally-free flags and incidence schemes have their universal functorial meanings. Group flag forms use their actual descent type; individual fundamental line bundles or a chosen pinning need not descend. Integral split calculations use the pinned Chevalley model and its actual character/cocharacter lattices. Characteristic-p splitting is first constructed over perfect fields, including p=2; field extensions and descent are proved before using it for geometric conclusions over other fields. Over a nonreduced S, geometrically reduced fibres do not make the total space reduced.

## Exact supplier contracts

### From Mathlib

The native `Module.Grassmannian` and `Module.Basis.flag` supply the module
points and basis flag, not the relative Schubert schemes. They are defined in
`Mathlib/RingTheory/Grassmannian.lean` and
`Mathlib/LinearAlgebra/Basis/Flag.lean`. The Grassmannian requires a finite
projective quotient of constant stalk rank; Mathlib does not supply a scheme
representing that functor, which Tau Ceti supplies over an affine base (below).
For the symplectic coordinate comparison use
`Matrix.J` (the block matrix [[0,−I],[I,0]]) and `SymplecticGroup.mem_iff'`
(A is symplectic exactly when AᵀJA=J) in
`Mathlib/LinearAlgebra/SymplecticGroup.lean`. For the isotropic rank bound of
S1.5 use `LinearMap.BilinForm.finrank_add_finrank_orthogonal`
(`Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean`): for a reflexive form
on a finite-dimensional space, dim W+dim W^⊥=dim V+dim(W∩V^⊥); an
alternating form is reflexive by `LinearMap.BilinForm.IsAlt.isRefl`.

### From Tau Ceti

`TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, in
`TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`, is the Zariski sheaf
cohomology Hⁱ(X,M) of a sheaf of modules M on a scheme X, obtained by
forgetting the module structure and applying Mathlib's sheaf cohomology. S3,
S5 and S9.0 use it as the carrier of coherent cohomology and assume of it only
additivity, functoriality in M and the identification of H⁰ with global
sections; coherence, Serre vanishing and derived pushforward are the
SchemeAndStackFoundations contracts below.
`TauCeti.AlgebraicGeometry.InvertibleSheaf`, in
`TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`, is the full subcategory of
module sheaves cut out by the locally-free-of-rank-one predicate
`TauCeti.AlgebraicGeometry.SheafOfModules.isInvertible`. S3.1 and S9.8 use it
as the carrier of the associated lines; no chosen trivialization or
linearization is assumed of it. The pinned library has no flag or
Bott–Samelson scheme, Frobenius-splitting carrier, algebraic K-ring of a
scheme or complex analytic space; those carriers are targets of the layers below.

The Picard group of a scheme X is native.
`TauCeti.AlgebraicGeometry.LineBundleClass X`
(`TauCeti/AlgebraicGeometry/LineBundle/Class.lean`) is the type of isomorphism
classes of invertible sheaves on X, a commutative group whose product is
induced by `InvertibleSheaf.tensorProduct` (`LineBundle/TensorProduct.lean`),
whose inverse is induced by `InvertibleSheaf.dual` (`LineBundle/Dual.lean`,
the internal Hom into 𝒪_X) and whose unit is the class of 𝒪_X.
`LineBundleClass.pullbackHom` (`LineBundle/Functoriality.lean`) is pullback of
classes along a morphism of schemes, as a group homomorphism, and
`InvertibleSheaf.pullback` (`LineBundle/Pullback.lean`) is pullback of the
sheaves themselves. Ampleness is the native predicate
`LineBundleClass.IsAmple` (`LineBundle/Ample.lean`) on classes: X is
quasi-compact and every point lies in an affine nonvanishing locus of a global
section of some line bundle in the class of a positive power. Global generation
is the native predicate `InvertibleSheaf.IsGloballyGenerated`
(`LineBundle/GlobalGeneration.lean`): at every point some global section does
not vanish. S3.1's forgetful map lands in `LineBundleClass` of G/P−, its
ampleness and global-generation statements are these two predicates, and S3.5
consumes the latter through S3.1.

The sheaf operations on finite locally free sheaves of a scheme X are native,
each with its pullback comparison along every morphism of schemes: the dual
`TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.dual`
(`TauCeti/AlgebraicGeometry/VectorBundle/Dual/Basic.lean`) with
`FiniteLocallyFreeSheaf.pullbackDualIso` (`VectorBundle/Dual/Pullback.lean`);
the exterior powers `FiniteLocallyFreeSheaf.exteriorPower`
(`VectorBundle/ExteriorPower/Basic.lean`) with
`FiniteLocallyFreeSheaf.pullbackExteriorPowerIso`
(`VectorBundle/ExteriorPower/Pullback.lean`); the determinant
`FiniteLocallyFreeSheaf.det` at locally constant rank
(`VectorBundle/Determinant/LocallyConstantRank.lean`) with
`FiniteLocallyFreeSheaf.pullbackDetIso` (`VectorBundle/Determinant/Pullback.lean`);
and the tensor product of module sheaves on X, whose pullback comparison is
invertible when either factor is quasi-coherent: the left case is
`Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent` and the right case is
`Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent_right`
(`TauCeti/AlgebraicGeometry/Modules/Pullback/Quasicoherent.lean`). S1.0, S1.1
and S1.4 use these sheaf operations and S3.1 the tensor comparison, assuming
nothing beyond their functoriality under pullback. The graded quasi-coherent
algebra `TauCeti.AlgebraicGeometry.GradedQuasicoherentAlgebra`
(`TauCeti/AlgebraicGeometry/Modules/Quasicoherent/GradedAlgebra/Basic.lean`)
is the carrier on which StableReduction Layer 2 builds relative Proj; S5.6 and
S6.1 use it only through that relative Proj.

The Grassmannian of a module M over a commutative ring R is a scheme over
Spec R. `Module.Grassmannian.scheme R M q`
(`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean`) is glued from the
standard affine charts, and `Module.Grassmannian.schemeHomEquiv`
(`Grassmannian/Points.lean`) identifies its morphisms from Spec A over Spec R
with the points of `Module.Grassmannian` over A, that is with A-submodules of
A⊗M whose quotient is finite projective of constant rank q, naturally in A.
`Module.Grassmannian.isProper_toSpec` (`Grassmannian/Proper.lean`) makes it
proper over Spec R for finite M. S1.1 uses these as its ambient Grassmannians
over affine opens and assumes nothing about a non-affine base, which is
ModularCurves §0G's relative version. The pivots of a subspace W of a vector
space with a basis b indexed by `Fin n`, relative to the increasing flag F_j
spanned by the first j basis vectors, are in
`TauCeti/LinearAlgebra/Basis/Flag.lean`: `Module.Basis.flagPivots` is the
zero-based pivot set, `Module.Basis.finrank_inf_flag` gives dim(W∩F_j) as the
number of pivots below j, `Module.Basis.card_flagPivots` gives dim W pivots,
`Module.Basis.flagCellEquiv` identifies the subspaces with a given pivot set
with the functions on the free entries of the reduced echelon matrices, and
`StrictMono.card_echelonFreeEntries_image` counts Σ_i(p_i−i) free entries.
`StrictMono.sum_sub_add_sum_sub_eq_mul` and `StrictMono.antitone_sub_sub`
(`TauCeti/Data/Fin/StrictMono.lean`) say that this count is r(n−r)−|λ| for
the partition λ_i=n−r+i−p_i in the r×(n−r) rectangle. These files work with
subspaces of a vector space over a division ring and construct no cell or
closure as a scheme. For a bilinear form ω on M, `Module.Grassmannian.isotropicLocus`
(`TauCeti/RingTheory/Grassmannian/Isotropic.lean`) is the ideal of A generated
by the values of the base change of ω on a point N of the Grassmannian over A;
`Module.Grassmannian.isotropicLocus_map` says its formation commutes with base
change and `Module.Grassmannian.isotropicLocus_le_ker_iff` that the base change
of N along A→B is isotropic exactly when B kills that ideal. No hypothesis on
ω or on 2 is made there; the file does not glue these ideals into a closed
subscheme. Over a field,
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq`
(`TauCeti/LinearAlgebra/BilinearForm/LagrangianBasis.lean`) extends any basis
e of a Lagrangian U=U^⊥ of a nondegenerate alternating form on a
finite-dimensional space to a basis with Gram matrix Mathlib's `Matrix.J`, the
vectors of e in the first block; thus ω(e_i,f_j)=−δ_ij and ω(f_i,e_j)=δ_ij
for the added vectors f_j, in every characteristic.

For a scheme X over Spec k and a topological k-algebra R,
`TauCeti.SchemePointTopology.topology`
(`TauCeti/Topology/Algebra/PointTopology/Scheme.lean`) is the topology on the
R-points of X over Spec k (`TauCeti.SchemePointTopology.Points`) that is final
for the affine open charts, and `TauCeti.SchemePointTopology.affineHomeomorph`
identifies it on an affine scheme with the topology induced by evaluation of
coordinates; no finiteness is assumed, and the file does not prove that the
charts are open embeddings. `TauCeti.PointTopology.isOpenEmbedding_localization`
(`Localization.lean` in the same folder) makes restriction to a basic open an
open embedding of affine point spaces when the units of R are open and
inversion is continuous on them, and `TauCeti.PointTopology.instT2Space` and
`TauCeti.PointTopology.instSecondCountableTopology` (`Separation.lean`) make
the affine point spaces Hausdorff for Hausdorff R and second countable for
second-countable R and a finite-type coordinate algebra. S9.0 takes the
classical topology on X(ℂ) from these with k=R=ℂ.

For a family x of p vectors in ι→R, with ι linearly ordered and R a
commutative ring, `TauCeti.plucker x`
(`TauCeti/LinearAlgebra/ExteriorPower/Plucker.lean`) is the family of its
Plücker coordinates: at a p-element subset s of ι, the p×p minor on the
columns in s, taken in increasing order. `TauCeti.plucker_sum_smul`
multiplies all of them by det A when x is replaced by its product with a
p×p matrix A, and `TauCeti.plucker_ne_zero_iff` says that, over a domain and
for finite ι, they are not all zero exactly when x is linearly independent.
Over a field, `TauCeti.mk_plucker_eq_mk_plucker_iff`
(`TauCeti/LinearAlgebra/Projectivization/Plucker.lean`) says that two
linearly independent families have the same point of projective space
exactly when they span the same subspace. These files have no Plücker
relations (GroebnerGeometry G5's polynomial straightening), no Grassmannian
charts and no Schubert ideals; S6.2 and the type-A worked example consume
them.

The abstract Coxeter inputs are in `TauCeti/GroupTheory/Coxeter/` and hold for
an arbitrary Coxeter system, finite or not. `CoxeterSystem.strongExchange`,
`CoxeterSystem.exchangeCondition` and `CoxeterSystem.deletionCondition`
(`StrongExchange.lean`) give the strong exchange condition for an arbitrary
word, the exchange condition for a reduced word with a left descent, and the
deletion of two letters from a word that is not reduced. `TauCeti.matsumoto`
and `TauCeti.braidEquivalent_of_isReduced_wordProd_eq` (`Matsumoto.lean`) give
Matsumoto's theorem: two reduced words for one element are related by braid
moves, so a monoid-valued assignment on simple letters satisfying the braid
relations takes one value on all reduced words of an element; no square
relation is required of it. `CoxeterSystem.BruhatLE` and
`CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq` (`Bruhat.lean`) give
the Bruhat order and its subword characterization for a fixed reduced word.
`CoxeterSystem.IsMinimalCosetRep` (`Parabolic.lean`) is the predicate that u
has minimal length in its left coset uW_J; `CoxeterSystem.MinimalCosetRepCovBy` and
`CoxeterSystem.MinimalCosetRepChain` (`Bruhat.lean`) are the covers and
saturated descending chains of W/W_J, and
`CoxeterSystem.exists_minimalCosetRepChain` and
`CoxeterSystem.MinimalCosetRepChain.length_last_add_length`
(`ChainProperty.lean`) join comparable representatives by a saturated chain,
every such chain from x to y having length ℓ(x)−ℓ(y).

The root-datum inputs are Mathlib's `RootPairing`, `RootDatum`,
`RootPairing.Base` and `RootPairing.weylGroup`
(`Mathlib/LinearAlgebra/RootSystem/`). For a finite reduced crystallographic
root pairing with a base b over a characteristic-zero domain,
`TauCeti.weylCoxeterSystem` and `TauCeti.length_weylCoxeterSystem_eq`
(`TauCeti/LinearAlgebra/RootSystem/Coxeter/Presentation.lean`) make the Weyl
group a Coxeter system on the simple reflections of b, with length equal to
the number of positive roots sent to negative roots. Spanning is not assumed,
so the root datum of a reductive group with a central torus qualifies.
`TauCeti.DynkinType.simplyConnectedRootDatum`,
`TauCeti.DynkinType.simplyConnectedBase` and `TauCeti.DynkinType.simpleIndex`
(`TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Assembly.lean`)
give, for each valid Dynkin type, the simply connected root datum on
`Fin rank → ℤ` with its Bourbaki-numbered base and simple-root indices; they
take a proof of validity. `TauCeti.GeneralLinear.diagonalRootDatum n`
(`TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Root/Datum.lean`) is the GLₙ
root datum on the diagonal character lattice `ULift (Fin n) →₀ ℤ`, with roots
e_i−e_j for i≠j; it keeps the central character e₁+⋯+eₙ, which the simply
connected type-A datum does not have.

The integral Demazure operators are in
`TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure/`. For a root datum P (a root
pairing over ℤ) and a root index i, `RootPairing.demazureOperator P i`
(`Basic.lean`) is the ℤ-linear endomorphism D_i of the group ring
`AddMonoidAlgebra ℤ M` of the weight lattice sending e^x, with m=⟨x,α_i∨⟩,
to the string e^x+e^(x−α_i)+⋯+e^(x−mα_i) for m≥0, to 0 for m=−1 and to
−(e^(x+α_i)+⋯+e^(x+(−m−1)α_i)) for m≤−2
(`RootPairing.demazureOperator_single_of_coroot'_eq_natCast`,
`RootPairing.demazureOperator_single_of_coroot'_eq_neg_one`,
`RootPairing.demazureOperator_single_of_coroot'_eq_neg_natCast_sub_one`);
`RootPairing.one_sub_single_neg_root_mul_demazureOperator` is the
localization identity (1−e^(−α_i))D_i(f)=f−e^(−α_i)s_i(f),
`RootPairing.demazureOperator_eq_iff` says it characterizes D_i because
`RootPairing.isLeftRegular_one_sub_single_neg_root` makes 1−e^(−α_i) a
non-zero-divisor, `RootPairing.demazureOperator_demazureOperator` is
D_i²=D_i, `RootPairing.demazureOperator_eq_self_iff` says D_i fixes exactly
the s_i-invariants and `RootPairing.demazureOperator_eq_self_of_isWeylInvariant`
that it fixes Weyl invariants. `Braid.lean` proves the rank-two braid
relations (`RootPairing.commute_demazureOperator_of_isOrthogonal`,
`RootPairing.demazureOperator_braid_three`,
`RootPairing.demazureOperator_braid_four`,
`RootPairing.demazureOperator_braid_six`), their form for the Coxeter matrix
of a base (`RootPairing.prod_map_demazureOperator_braidWord`), word
independence of D_(i₁)⋯D_(i_r) along reduced words of one Weyl group element
for a finite reduced root datum with a base
(`RootPairing.prod_map_demazureOperator_eq_of_wordProd_eq`) and D_iD_w=D_w for
a left descent s_i of w
(`RootPairing.demazureOperator_mul_prod_map_demazureOperator_of_isLeftDescent`).
`LongestElement.lean` proves Demazure's formula
Δ·D_(w₀)(f)=Σ_(w∈W) sgn(w)e^(wρ−ρ)w(f) for a reduced word of the longest
element (`RootPairing.weylDenominator_mul_prod_map_demazureOperator`
and its value `RootPairing.weylDenominator_mul_prod_map_demazureOperator_single`
on e^λ), with Δ=∏_(α>0)(1−e^(−α)) the Weyl denominator
`TauCeti.weylDenominator` (`TauCeti/LinearAlgebra/RootSystem/Weyl/Denominator/Basic.lean`)
and the right side the dot alternatization J(f), `RootPairing.dotAlternatization`
(`Weyl/Denominator/Integral.lean`, which also proves J(1)=Δ as
`RootPairing.dotAlternatization_one`). Here wρ−ρ is minus the sum of the
positive roots that w⁻¹ sends to negative roots, so every exponent lies in the
weight lattice even when ρ does not (for PGL₂, ρ=α/2). `LongestElement.lean`
also proves the Weyl invariance `RootPairing.isWeylInvariant_prod_map_demazureOperator` of
D_(w₀)(f). `Parabolic.lean` proves the Levi case D_vf=f for v∈W_J and
W_J-invariant f (`RootPairing.prod_map_demazureOperator_apply_eq_self_of_mem_parabolic`),
the dependence of D_wf on the coset wW_J
(`RootPairing.prod_map_demazureOperator_apply_eq_of_inv_mul_mem_parabolic`),
the wall case that D_w(e^λ) depends only on wλ for dominant λ
(`RootPairing.prod_map_demazureOperator_single_eq_of_smul_eq`) and the
recursion D_iχ_ξ=χ_(s_iξ) for ⟨ξ,α_i∨⟩≥0 and D_iχ_ξ=χ_ξ for ⟨ξ,α_i∨⟩≤0
(`RootPairing.demazureOperator_prod_map_demazureOperator_single_of_coroot'_nonneg`,
`RootPairing.demazureOperator_prod_map_demazureOperator_single_of_coroot'_nonpos`).
These files treat the combinatorial operator only: identifying D_w(e^λ) with
the character of H⁰(X(w),L(λ)) or of a module is not in them, and the
positive-denominator operator Δ_i of the Knutson handout is not defined
there.

The Lie-algebra form of the Weyl character formula is in
`TauCeti/Algebra/Lie/HighestWeight/`. For a finite-dimensional Lie algebra
with non-degenerate Killing form over an algebraically closed field K of
characteristic 0, a Cartan subalgebra H and a base of its root system,
`TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`
(`Weyl/Character.lean`) says that a finite-dimensional module generated by a
highest-weight vector of weight λ∈H* has formal character, in the group ring
of H*, whose product with `TauCeti.weylDenominator` is the Weyl numerator
`TauCeti.weylNumerator` (`TauCeti/LinearAlgebra/RootSystem/Weyl/Numerator.lean`),
N(λ)=Σ_(w∈W) sgn(w)e^(w(λ+ρ)−ρ), defined for root systems over a ring in
which 2 is invertible. `TauCeti.tensorMultiplicity_eq_sum_weylSign_mul_formalCharacter_coeff`
(`RacahSpeiser.lean`) is the Racah–Speiser formula: for dominant integral
λ, μ and ν, the multiplicity of the simple module L(ν) in L(λ)⊗L(μ) is
Σ_(w∈W) sgn(w) times the coefficient of e^(ν−(w(λ+ρ)−ρ)) in the formal
character of L(μ). These files concern
Lie-algebra modules with weights in H*; they do not compare the root system
of H with the integral root datum of G, nor Lie-algebra modules with rational
G-modules.

Normal crystals are in `TauCeti/RepresentationTheory/Crystal/`.
`TauCeti.NormalCrystal P b B` (`Basic.lean`) bundles, over a root datum with a
base, a weight map, partial raising and lowering maps e_i,f_i:B→Option B and
natural string lengths ε_i,φ_i with the partial-inverse law, the weight
change by α_i, the string identities and φ_i−ε_i=⟨wt,α_i∨⟩; the file also
has the dual crystal, the iterated operators with their string criteria
(`TauCeti.NormalCrystal.isSome_eIter_iff`, `TauCeti.NormalCrystal.isSome_fIter_iff`),
strict morphisms `TauCeti.NormalCrystal.StrictHom`, strict isomorphisms
`TauCeti.NormalCrystal.StrictIso` and transport along a bijection
`TauCeti.NormalCrystal.transport`. `Component.lean` has the crystal graph,
restriction to an operator-closed subset, the connected components
`TauCeti.NormalCrystal.component` as crystals and the decomposition
`TauCeti.NormalCrystal.sigmaComponentsIso` into their direct sum
(`Sigma.lean`); `Tensor.lean` has the tensor product
`TauCeti.NormalCrystal.tensor` on B₁×B₂ with Kashiwara's tie convention (on a
tie e_i acts on the left factor and f_i on the right), its functoriality,
associator and duality; `WeightTwist.lean` has the central weight twist
`TauCeti.NormalCrystal.weightTwist` by a weight killed by the simple coroots,
with its zero, addition and duality laws, the one-element crystal
`TauCeti.NormalCrystal.central` and the identification of the twist with
tensoring by it; `Character.lean` has the formal character
`TauCeti.NormalCrystal.formalCharacter` of a finite crystal in
`AddMonoidAlgebra ℤ X`, its Weyl invariance
`TauCeti.NormalCrystal.isWeylInvariant_formalCharacter` for a finite reduced
root datum and its invariance under strict isomorphism;
`StringReflection.lean` has the string reversal and its weight-fibre
bijection. No crystal structure on the Lakshmibai–Seshadri paths, and no
identification of a formal character with a module character, is in these
files.

The Lakshmibai–Seshadri path engine is in
`TauCeti/RepresentationTheory/LSPath/`, over an ordered field 𝕜 (ℚ for the
rational theory) and a vector space V reached from the weight lattice by an
additive map. `TauCeti.PLPath 𝕜 V` (`PLPath.lean`) is the piecewise-linear
path up to nondecreasing surjective piecewise-linear reparametrization,
modelled by its reduced segment list: `TauCeti.PLPath.normalize` removes
stationary segments and merges adjacent segments on a common ray using only
the vector-space operations, `TauCeti.PLPath.ofSegments_eq_ofSegments_iff`
says two segment lists present one path exactly when the elementary moves
relate them, and the file has the concatenation monoid,
`TauCeti.PLPath.endpoint`, `TauCeti.PLPath.reverse`, `TauCeti.PLPath.straight`
and the linear image `TauCeti.PLPath.map`. `Reparametrization.lean` has timed
presentations, their parametrized paths `TauCeti.PLPath.evalTimed`, the
reparametrization relation `TauCeti.PLPath.IsReparam` and the faithfulness
theorem `TauCeti.PLPath.ofSegments_map_snd_eq_iff_exists_isReparam`: two timed
presentations of positive duration present one path exactly when they are
reparametrizations of a common one, rationality preserved.
`RootOperator.lean` has the minimal height `TauCeti.PLPath.minHeight` of a
linear form along a path, Littelmann's operators `TauCeti.PLPath.lower` and
`TauCeti.PLPath.raise` for a vector x and a form f (the simple root and the
pairing with its coroot), with `none` for Kashiwara's 0, their presentation
independence `TauCeti.PLPath.lower_ofSegments`, the criteria
`TauCeti.PLPath.lower_eq_none_iff` and `TauCeti.PLPath.raise_eq_none_iff`, the
endpoint changes `TauCeti.PLPath.endpoint_of_lower_eq_some` and
`TauCeti.PLPath.endpoint_of_raise_eq_some` by ∓x and the minimal-height
changes by ∓1 when f(x)=2; `PartialInverse.lean` proves
`TauCeti.PLPath.lower_eq_some_iff` and `TauCeti.PLPath.raise_eq_some_iff`
(partial inverses on all paths); `StringLength.lean` proves the string
criteria `TauCeti.PLPath.isSome_lowerIter_iff` and
`TauCeti.PLPath.isSome_raiseIter_iff` and the identities φ=f(π(1))−h and
ε=−h when these are natural numbers
(`TauCeti.PLPath.isSome_lowerIter_iff_of_eq_natCast`,
`TauCeti.PLPath.isSome_raiseIter_iff_of_eq_natCast`); `Concatenation.lean`
proves the tensor rule `TauCeti.PLPath.lower_mul` and
`TauCeti.PLPath.raise_mul` for a concatenation with integral comparison gap;
`LinearMap.lean` the naturality `TauCeti.PLPath.lower_map` and
`TauCeti.PLPath.raise_map`. `TauCeti.LSPath P b λ` (`Basic.lean`) is
Littelmann's encoding (τ;a) of a path of shape λ for a finite reduced root
datum with a base: strictly decreasing minimal coset representatives of the
stabilizer parabolic `RootPairing.wallIndices` of λ, rational times
0=a₀<⋯<a_(l+1)=1 and an a_(j+1)-chain at each internal break, with its
distinguished timed presentation `TauCeti.LSPath.timed`, its path
`TauCeti.LSPath.toPLPath`, the straight encoding `TauCeti.LSPath.straight`,
the two-direction encodings `TauCeti.LSPath.simple`, finiteness
`TauCeti.LSPath.finite` for dominant λ and `TauCeti.LSPath.isAChain` (every
saturated chain between consecutive directions is an a-chain).
`Realization.lean` proves `TauCeti.LSPath.toPLPath_injective` for a dominant
shape and a realization injective on Wλ with no two orbit points on a common
ray; `Distinguished.lean` proves the uniqueness
`TauCeti.PLPath.IsDistinguished.unique` of a presentation with velocities in
a set and changes of velocity at every break, that the presentation of an
encoding is distinguished for dominant λ (`TauCeti.LSPath.isDistinguished_timed`),
that adding t↦tχ is not well defined on reparametrization classes
(`TauCeti.PLPath.not_exists_shiftTimed_on_paths`) and defines the central
shift `TauCeti.PLPath.shiftDistinguished` on paths with a distinguished
presentation; `Central/Transport.lean` has the bijection
`TauCeti.LSPath.centralTransport χ : LSPath P b λ ≃ LSPath P b (λ+χ)` for χ
killed by the simple coroots, equal on realized paths to the central shift
(`TauCeti.LSPath.toPLPath_centralTransport`), with
`TauCeti.LSPath.centralTransport_straight`, the endpoint law
`TauCeti.LSPath.endpoint_toPLPath_centralTransport`, the minimal-height law
`TauCeti.LSPath.minHeight_toPLPath_centralTransport` and the additivity, zero
and inverse laws `TauCeti.LSPath.toPLPath_centralTransport_centralTransport`,
`TauCeti.LSPath.toPLPath_centralTransport_zero` and
`TauCeti.LSPath.toPLPath_centralTransport_neg`; `Highest.lean` proves that the
straight encoding is the only one killed by every raising operator
(`TauCeti.LSPath.forall_raise_eq_none_iff`); `Integrality.lean` proves
integrality of the endpoint against integral forms and of the minimal
simple-coroot heights of a realized encoding
(`TauCeti.LSPath.exists_minHeight_eq_intCast`), hence the exact string lengths
(`TauCeti.LSPath.exists_neg_minHeight_eq_natCast_and_apply_endpoint_sub_minHeight_eq_natCast`);
`ConvexHull.lean` proves π(t)∈t·Conv(S) for a timed presentation with
velocities in S (`TauCeti.PLPath.evalTimed_mem_smul_convexHull`), containment
in Conv(S) when 0∈Conv(S) (`TauCeti.PLPath.evalTimed_mem_convexHull`) and, with
`RootPairing.zero_mem_convexHull_orbit_weylGroup` (`Weyl/Barycenter.lean`),
containment in Conv(Wλ) for a root system with finite Weyl group
(`TauCeti.PLPath.evalTimed_mem_convexHull_orbit_weylGroup`); `Stretch.lean`
and `Subdivision.lean` have the positive-integer stretch
`TauCeti.LSPath.stretch`, its dilation law `TauCeti.LSPath.toPLPath_stretch`
and the uniform integral subdivision
`TauCeti.LSPath.exists_uniform_subdivision`. The bond arithmetic is in
`TauCeti/LinearAlgebra/RootSystem/`: `RootPairing.reflectionBond`
(`ReflectionBond.lean`) is the bond ⟨y,β∨⟩=−⟨x,β∨⟩ of weights y=s_βx for a
positive root β, with `RootPairing.reflectionBond_self` and the central
invariance `TauCeti.reflectionBond_smul_add` (`Weyl/CoverBond.lean`);
`Weyl/ParabolicQuotient.lean` identifies the orbit Wλ of a dominant weight
with W/W_λ through minimal coset representatives (`RootPairing.wallIndices`,
`RootPairing.parabolic_wallIndices_eq_stabilizer`,
`TauCeti.existsUnique_isMinimalCosetRep_smul_eq`) and proves the reflection
test in its three cases
(`TauCeti.bruhatLE_and_ne_iff_coroot'_neg_of_isMinimalCosetRep`,
`TauCeti.eq_iff_coroot'_eq_zero_of_isMinimalCosetRep`); `Weyl/CoverBond.lean`
proves the unique positive root label of a cover of W/W_λ
(`TauCeti.existsUnique_isPos_reflection_smul_eq_of_minimalCosetRepCovBy`), the
strict positivity `TauCeti.reflectionBond_pos_of_minimalCosetRepCovBy` and the
integrality `TauCeti.exists_nat_reflectionBond_eq_of_minimalCosetRepCovBy` of
its bond, and the bond ⟨λ,α_i∨⟩ of the cover of the identity by a simple
reflection off the walls (`TauCeti.reflectionBond_simple_smul_one_smul`);
`Weyl/ChainBond.lean` has the bond gcd `TauCeti.bondGcd` of a saturated chain
(0 for the empty chain), the a-chain predicate `TauCeti.IsAChain`, the
criterion `TauCeti.isAChain_iff_den_dvd_bondGcd`, Littelmann's form
`TauCeti.isAChain_iff_forall_coroot'`, the concatenation law
`TauCeti.bondGcd_smash` and the integrality of heights along a-chains;
`Weyl/IntervalBondGcd.lean` has the interval gcd `TauCeti.intervalBondGcd` and
its chain independence `TauCeti.bondGcd_eq_intervalBondGcd`, proved by a
chain-sorting induction along a left descent, with
`TauCeti.intervalBondGcd_self`, `TauCeti.intervalBondGcd_eq_gcd` and the
a-chain criteria `TauCeti.exists_isAChain_iff_den_dvd_intervalBondGcd` and
`TauCeti.forall_isAChain_iff_den_dvd_intervalBondGcd`;
`Weyl/ReflectedChain.lean` reflects saturated chains lying on one side of a
simple wall (`CoxeterSystem.MinimalCosetRepChain.simpleMul`,
`CoxeterSystem.MinimalCosetRepChain.bondGcd_simpleMul`) and proves
Littelmann's chain conditions at the two ends of a reflected piece
(`TauCeti.IsAChain.exists_isAChain_simple_mul_last`,
`TauCeti.IsAChain.exists_isAChain_simple_mul_head`). These files do not prove
that the root operators carry the realized path of an encoding of shape λ to
the realized path of another encoding of shape λ, do not put a
normal-crystal structure on `TauCeti.LSPath`, and do not prove the
component, character or tensor theorems; those are S4's targets.

### From TauCetiRoadmap.ModularCurves

[ModularCurves §0G](../ModularCurves/README.md) owns finite-locally-free Grassmannian representability over an arbitrary base, glued from Tau Ceti's affine `Module.Grassmannian.scheme`, with its charts, universal quotient and base change. Native `Module.Grassmannian R M q` stores a submodule with locally free quotient of rank q; an r-dimensional subspace of k^N corresponds to q=N−r. S1.1 constructs flags as closed incidence subschemes of products of those Grassmannians; a coherent quotient of a non-locally-free sheaf is not needed for this construction.

### From TauCetiRoadmap.ReductiveGroups

[ReductiveGroups](../ReductiveGroups/README.md) Layers 7–10 (structure theory, field Bruhat theory and algebraic parabolics, classification, the pinned Chevalley–Demazure group schemes over ℤ, rational representations and highest weights) own Hopf/scheme/point and rational-comodule dictionaries, group/root/pinning/central-isogeny structure, and field Bruhat theory. Its integral-distribution/rational-representation extension supplies full-lattice divided-power PBW/Dist(G), Δ/∇/L, induction, pinned extremal vectors and contravariant duality. The algebraic Steinberg input is the simple module Δ((p−1)ρ)=L((p−1)ρ)=∇((p−1)ρ) on the derived simply connected cover, with dimension p^|Φ+| and normalized PBW/extremal pairing. These algebraic constructions do not consume flag splitting or standard monomial theory.

[ReductiveGroups §3A.5](../ReductiveGroups/README.md) supplies, for a closed
orbit O_x of a smooth affine group G of finite type acting on a proper complex
scheme X, with H the scheme stabilizer of x: smoothness of the reduced orbit
model, compactness of O_x(ℂ), the holomorphic orbit submersion G(ℂ)→O_x(ℂ),
its holomorphic local sections and the biholomorphism G(ℂ)/H(ℂ)≃O_x(ℂ).
S9.1 applies it to the G-action on G/P− at eP−, with the classical topology
and holomorphic charts of S9.0. §3A.5 constructs no ringed analytification,
no structure sheaf with nilpotents and no GAGA, and the point topology of an
arbitrary complex scheme locally of finite type is not taken from it; those
are S9.0's.

### From TauCetiRoadmap.GroebnerGeometry

[GroebnerGeometry G5](../GroebnerGeometry/README.md) owns polynomial minor/shuffle/straightening/Gröbner statements, flag-minor algebra and its Gelfand–Tsetlin initial algebra. S6 supplies the scheme, homogeneous coordinate, section and restriction identifications. The original flag algebra is not identified with its toric initial algebra.

### From TauCetiRoadmap.SchemeAndStackFoundations

[SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) Layer 1
(descent, gluing, closed immersions, fibre products and base change), Layer 2
with §2.2 (Leray and Čech spectral sequences) and §2.6 (quasi-coherent
cohomology, projective-space cohomology and Serre vanishing), §4.12 (Chow's
lemma) and Layer 5 with §5.7 (cycles and intersections; coherent and perfect
classes K₀, G₀ and the K-theoretic pushforward) supply generic coherent
cohomology, ample Serre vanishing, relative derived pushforward and base change
and coherent/perfect K-theory at their stated scope. These generic
constructions are not redefined here.

### From TauCetiRoadmap.StableReduction

[StableReduction Layer 2](../StableReduction/README.md) supplies relative Proj
on the native graded quasi-coherent algebra
`TauCeti.AlgebraicGeometry.GradedQuasicoherentAlgebra` (From Tau Ceti); with
Layer 4 it supplies the Rees blowup construction
used in the worked blowup example. S5.6 and S6.1 consume the relative Proj and
do not rebuild it.

### From TauCetiRoadmap.TopologicalKTheory

[TopologicalKTheory T1.5](../TopologicalKTheory/README.md) supplies the single
finite subspace Grassmannian and finite Schubert characteristic maps. S9
compares these with the algebraic models; it does not rebuild their carriers.

### From TauCetiRoadmap.LieGroups

[LieGroups Layer 8](../RepresentationTheory/LieGroups/README.md) (Borel–Weil,
flag manifolds and Bruhat) supplies the compact full and partial flags K/T and
K/K_μ with their homogeneous complex comparisons, used by S2.5, S7.3 and
S9.1–S9.7. S9 compares these with the algebraic models; it does not rebuild
their carriers.

### From TauCetiRoadmap.ComplexKahlerGeometry

[ComplexKahlerGeometry K3–K4](../ComplexKahlerGeometry/README.md) supplies finite-dimensional holomorphic germs, Weierstrass division, local analytic sets and the holomorphic sheaf/bundle calculus. S9.0 extends these local objects to analytic spaces with nilpotents and coherent analytification; K4's bundle theory alone is not coherent GAGA.

### From TauCetiRoadmap.RealAnalyticGeometry

[RealAnalyticGeometry R3.2](../RealAnalyticGeometry/README.md) supplies the
native coherent module-sheaf predicate, coherent kernels and Cartan A/B on
Stein manifolds; S9.0 uses them, with SchemeAndStackFoundations §§2.2, 2.6 and
4.12, in its proof of proper GAGA.

### From TauCetiRoadmap.AlgebraicTopology

[AlgebraicTopology Stage 5, item 3](../AlgebraicTopology/README.md) supplies,
for a finite covering p with connected base and constant fibre cardinality d,
the transfer on singular chains with p_*∘transfer=d·id, and, for a regular
covering with finite deck group G, transfer∘p_*=Σ_(g∈G) g_*. S9.6 applies it to
the free covering K/T→K/N(T) with deck group W: over ℚ the two identities
identify H*(K/N(T);ℚ) with the W-invariants of H*(K/T;ℚ); over ℤ nothing else
is assumed and no averaging is used.

### From TauCetiRoadmap.MorseTheory

[MorseTheory M2](../MorseTheory/README.md) supplies compact-band deformation
across regular levels, the attachment of one index-λ handle at each critical
point of a critical level, and the resulting cell attachments with their
attaching maps ∂D^λ→M_(c−ε) and characteristic maps
(D^λ,∂D^λ)→(M_(c+ε),M_(c−ε)). S9.7 compares these characteristic maps with the
Bruhat cells and S7.3's classes; it assumes only the attachment statements, not
that a Schubert closure is the image of an embedded disc.

### From TauCetiRoadmap.HamiltonianReduction

[HamiltonianReduction R2a](../SymplecticGeometry/HamiltonianReduction/README.md)
supplies, on the coadjoint orbit O_μ=K/K_μ of a compact connected group K, the
heights f_X(p)=B(p,X) with df_X=ι_(X_O)ω and critical set {p:[X,p]=0}, the
root-plane rotations J_α with the KKS form on each root plane, the critical set
Wμ of a regular height and its finite even-index cell model. S9.7 consumes
these on the same orbit and compares them with the algebraic flag; it does not
rebuild the orbit, its form or its heights.

## How to read the build

Construct in this order: S1's relative carriers and early root cells; S2's word/incidence API; S3's early line bundles and rank-one derived push-pull; S4.1–5's completion of the native Lakshmibai–Seshadri path engine; S5's splitting/normalization/coherent comparisons; S7.1–2's divisor valuations; S4.6–7 and S6's geometric path sections and all-degree bases; S7.3's cycle comparison; S8's K-rings; S9's analytic and existing-owner comparisons. S4.1–5 is independent of Schubert splitting, vanishing, standard monomial theory and the concrete type A implementation. S4.6–7 is its geometric application, after S5 and S7.1–2. The generic finite-type engine is the single root-data owner; S9.5 gives its type-A root-datum specialization. The algebraic Steinberg supplier is independent of all these geometric conclusions.

Suggested.lean lists the headline theorems and the carriers missing at the pins.
The API targets and worked calculations belong to this README.

## Layer 1: Relative incidence and the root-cell dictionary (S1)

### 1.0 Relative parabolic quotients and integral root cells (S1.0)

For a reductive group scheme G over any scheme S and an étale-locally constant
parabolic type t invariant under descent, construct the scheme Par_t(G) of
parabolic subgroup schemes of that type. It is smooth and proper over S, has
its universal parabolic, and carries the relatively ample line
det(Lie(P_univ))*; it is projective over affine S. For a parabolic P/S of
type t, construct G/P→Par_t(G), gP↦gPg⁻¹, as an isomorphism of the represented
étale (equivalently fppf) quotient with that type component. Prove schematic
self-normalization of P before using this orbit map (ConradReductive,
Theorem 2.3.6, pp. 72–73, and Corollaries 5.2.8–5.2.9, pp. 155–157).
The Borel-type case agrees with ReductiveGroups Layer 8’s Borel scheme by
its representing property; it is not a second Borel carrier.

- Pullback of the universal subgroup represents change of base along every S′→S.
- Conjugation, quotient projection and change of a chosen parabolic commute
  with pullback and satisfy the composition laws on subgroup functors.
- The ample line is the dual determinant of the universal parabolic Lie algebra;
  arbitrary characters and their associated lines are treated separately in S3.

**Checks.**

- For GL₂ over ℤ, the Borel component is ℙ¹ and the canonical line has degree 2,
  whereas the weight-one associated line has degree 1.
- For P=G, the component is S and the quotient map has a single geometric point
  in every fibre; for a torus there is no positive-dimensional flag component.
- For the adjoint group of the Hamilton quaternion algebra over ℝ, the Borel
  component is the conic x²+y²+z²=0: it has no real point and becomes ℙ¹ over ℂ.
  A relative flag scheme need not admit a section.

For the split pinned ℤ-model of ReductiveGroups Layer 9, construct the standard
parabolics, their above quotients and the root-product charts. An ordered
inversion-root product gives a locally closed cell isomorphic to affine
ℓ(w)-space over ℤ; the cells exhaust the underlying flag space and commute
with arbitrary base change. Derive this from root multiplication and the
open big cell, followed by field Bruhat on every geometric fibre
(ConradReductive, Theorem 5.1.13, p. 143; ReductiveGroups Layer 7).
This is a stratification, not an isomorphism from the disjoint union of cells.
S2 constructs the contracted products over ℤ and then their base changes;
S5.6 proves closure base change without using it as a premise here.

- Cell charts, their inverses on their images and parabolic projections retain
  the chosen normalizer representatives and right-coset convention.
- Base change preserves the charts and their root-coordinate transition maps,
  including over nonreduced bases and at primes 2 and 3.
- Twisted models descend the quotient and its maps, without asserting that
  individual split cells descend when their indices are permuted.

**Checks.**

- On ℙ¹ the closed cell has one point and the open cell has q points over 𝔽_q;
  for q=2,3 their totals are 3,4, not 2 and not an affine-line count.
- For GL₃’s complete flag the cell lengths are 0,1,1,2,2,3; their 𝔽₂-point
  total is 1+2+2+4+4+8=21. A maximal partial flag gives 1+2+4=7 instead.
- Over ℤ[ε]/(ε²), the open rank-one chart is Spec(ℤ[ε][z]/(ε²)); ε remains
  nonzero although each geometric fibre is reduced.

*Needs:* ReductiveGroups Layers 7–9 (parabolics, relative descent and split
pinned groups); SchemeAndStackFoundations Layer 1 (scheme gluing and descent);
for the line det(Lie(P_univ))* and its change of base, the native
`FiniteLocallyFreeSheaf.det`, `FiniteLocallyFreeSheaf.pullbackDetIso`,
`FiniteLocallyFreeSheaf.dual` and `FiniteLocallyFreeSheaf.pullbackDualIso`
(From Tau Ceti).

### 1.1 Finite-locally-free flags and incidence (S1.1)

For a finite locally free E/S and a strictly increasing admissible rank list, construct the universal relative flag with subbundles F_i and locally free quotients as the closed incidence subscheme of the product of ModularCurves §0G quotient Grassmannians. Over an affine base Spec R on which E is the sheaf of a finite projective R-module M, these factors are Tau Ceti's `Module.Grassmannian.scheme R M q`, with points given by `Module.Grassmannian.schemeHomEquiv` and properness by `Module.Grassmannian.isProper_toSpec`; the construction is made there and glued along ModularCurves §0G's base-change comparison. Export empty/single/full flag comparisons, tautological exact sequences, tensor/exterior/determinant pullbacks, forgetful maps, refinement-parameter schemes, annihilator flags in E*, and arbitrary base change. An opposite flag in E needs the displayed splitting/pairing or opposite-Borel data; no canonical opposite/refinement of an arbitrary flag is assumed. Cut out that closed immersion by the vanishing of the universal maps F_i→E/F_j for i<j. Over ℂ, prove that this construction recovers the classical model of BrionFlags §1.2, p. 7 (BrionFlags lines 256–258), where the partial flag variety is the subvariety of the product of Grassmannians, together with its forgetful morphism from complete flags, a fibration whose fibre is the product of the complete flag varieties of the successive quotients (lines 266–272), and, for the line–hyperplane incidence variety in ℙ^(n−1)×ℙ̌^(n−1), its bihomogeneous equation x₁y₁+⋯+x_ny_n=0 (Example 1.2.3(5), pp. 9–10, lines 345–354); Brion indexes flags by the dimensions of successive quotients, which the comparison converts to this rank list. The product is an ambient space, not the flag itself. On a chosen splitting, compare these sheaf maps with polynomial matrix incidence equations. The construction is a deduction from the Grassmannian universal quotient and the closed zero locus of these maps (ModularCurves §0G; SchemeAndStackFoundations Layer 1).

- The universal incidence equations represent nested locally direct summands;
  their functor of points identifies the immersion with the flag functor.
- Forgetting ranks, pulling back E and taking annihilators preserve the
  incidence equations, tautological exact sequences and quotient ranks.
- Iterated Grassmannian presentations give smooth projective flag bundles;
  refinement is a flag bundle of the specified successive quotients.

**Checks.**

- The empty rank list gives S; a single rank r gives the quotient-rank N−r
  Grassmannian, so ranks 0 and N give S rather than an empty scheme.
- In rank 3 with ranks (1,2), the product has dimension 2+2=4, while the flag
  has dimension 3: the scalar incidence equation is essential.
- Over k[ε]/(ε²), the line generated by e₁+εe₃ and plane spanned by e₁,e₂
  give incidence value ε≠0. Their reduced points are nested, but the two
  subbundles do not form a flag; testing only geometric points loses the ideal.

*Needs:* ModularCurves §0G; the native `Module.Grassmannian.scheme`,
`Module.Grassmannian.schemeHomEquiv` and `Module.Grassmannian.isProper_toSpec`
over affine bases; the native tensor product with its pullback comparisons
`Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent` and
`Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent_right`, and
`FiniteLocallyFreeSheaf.dual`, `FiniteLocallyFreeSheaf.exteriorPower` and
`FiniteLocallyFreeSheaf.det` with `FiniteLocallyFreeSheaf.pullbackDualIso`,
`FiniteLocallyFreeSheaf.pullbackExteriorPowerIso` and
`FiniteLocallyFreeSheaf.pullbackDetIso` (From Tau Ceti);
SchemeAndStackFoundations Layer 1 closed immersions and base change.

### 1.2 Root-cell dictionary (S1.2)

Use S1.0’s Par_t(G), actual G/P− and integral root-coordinate charts. Construct the full dictionary from the positive-Borel/left-coset conventions of the Knutson handouts to this model: standard and opposite cells, minimal coset representatives, chosen normalizer representatives, T-fixed points, inversion sets, relative dimension and parabolic projection. The left/right quotient map is P−g↦g^−1P− and on Weyl indices W_Pw↦w^−1W_P; prove its root-coordinate and associated-line character formulas before using the handouts' left-coset statements. The fixed scheme is the finite disjoint union of the indicated sections in the split model; do not identify a general twisted form with that split list. Use actual root subgroup multiplication and quotient universal properties, not merely the cardinality of the Weyl group. Include rank-zero groups, P=G, empty root systems and nontrivial central tori.

- Quotient inversion sends each Weyl coset to its inverse coset and intertwines the actual quotient actions.
- The torus-fixed section indexed by w retains the chosen normalizer representative.
- Parabolic projection respects charts and forgets the indicated flag steps.

**Checks.**

- For S₃, inversion sends (123) to (132), and applying it twice returns (123).
- For a torus the flag has one point and dimension 0, even with nonzero character lattice.
- A GL₃ full flag has six torus-fixed points, while a maximal partial flag has three; projection must identify pairs.

*Needs:* S1.0; ReductiveGroups Layers 7–9. The quotient inversion formulas follow directly from the quotient universal property; the cells use ConradReductive Theorem 5.1.13 and field Bruhat separately.

### 1.3 Type-A ranks and pivots (S1.3)

In type A, compare row/column conventions, a rank-r subspace with quotient rank N−r, one-based pivots p₁<⋯<p_r and the zero-based `Fin N` coordinates p_i−1 of the native pivot set. On points over a field the pivot calculus is native and is not proved again: `Module.Basis.flagPivots` is the pivot set, `Module.Basis.finrank_inf_flag` gives dim(V∩F_j)=#{i:p_i≤j} for the increasing basis flag, `Module.Basis.flagCellEquiv` makes the subspaces with given pivots an affine space on the free echelon entries, `StrictMono.card_echelonFreeEntries_image` counts Σ_i(p_i−i) free entries, and `StrictMono.sum_sub_add_sum_sub_eq_mul` says this is r(N−r)−|λ| for the rectangle partition λ_i=N−r+i−p_i. The targets are what these files leave open. Transport subspace rank r to quotient rank N−r of `Module.Grassmannian` for r≤N. Construct the cell of each pivot set as a locally closed subscheme of S1.1's Grassmannian over ℤ, isomorphic to affine space of dimension Σ_i(p_i−i) by the echelon coordinates and compatible with base change, and identify it through S1.2's dictionary with S1.0's root cell of the corresponding coset; on k-points it is the native echelon cell. Rank 0 and full rank are points and r>N is empty. For N≤1 use the direct point/empty cases, without an A₀/A_(−1) root reference.

- The echelon coordinates give an isomorphism of the cell scheme with affine space of dimension Σ_i(p_i−i), and on k-points they are the native free echelon entries.
- The cell scheme and its echelon chart commute with base change; its k-points are exactly the subspaces with the given pivots.
- Subspace rank r is transported to quotient rank N−r only when r≤N.

**Checks.**

- In Gr(2,4), pivots (1,2),(1,3),(3,4) give dimensions 0,1,4 and partition sizes 4,3,0.
- For N=0, rank 0 gives a point, whereas rank 1 is empty; truncated subtraction cannot identify both with quotient rank 0.
- A line with pivot 2 in k² meets the first basis line in dimension 0 and the full plane in dimension 1.

*Needs:* S1.0–1.2; the native pivot files `TauCeti/LinearAlgebra/Basis/Flag.lean` and `TauCeti/Data/Fin/StrictMono.lean`; Mathlib `Module.Basis.flag` and rank. The pivot calculation is BrionFlags §1.1, pp. 4–5, after Definition 1.1.2; the same echelon-coordinate calculation works over every field and is expressed here in quotient-rank coordinates.

### 1.4 Determinantal incidence (S1.4)

Construct the determinantal rank-condition schemes relative to an actual complete subbundle flag; compare them with S5.6’s Schubert closures on S1.0’s locally split integral flag model, after that closure comparison has been proved. Give their universal ideals, restrictions, saturation/homogeneous presentations, base change and cell decompositions. Two or more arbitrary relative flags give well-defined incidence schemes but not automatic flatness, expected codimension or smooth resolutions. State and prove each such conclusion with its actual versality/transversality/regular-sequence assumptions.

- The defining ideal is generated by the minors of the universal bundle maps of the specified sizes.
- Base change pulls back those actual ideals, not just their geometric zero sets.
- The closure comparison is asserted for a single complete flag; multiple flags retain their stated incidence conditions.

**Checks.**

- Over k[ε]/(ε²), the line e₁+εe₃ and plane span(e₁,e₂) give the nonzero incidence ideal (ε), although the reduced incidence value is 0.
- A minor size exceeding either matrix dimension contributes no generators, hence ideal 0 rather than the unit ideal.
- For the identity complete flag in k², the closed Schubert locus is its specified line and the longest Schubert locus is all ℙ¹.

*Needs:* S1.1–1.3; SchemeAndStackFoundations Layer 1 closed immersions and the native `FiniteLocallyFreeSheaf.exteriorPower` with `FiniteLocallyFreeSheaf.pullbackExteriorPowerIso` (From Tau Ceti); S5.6 only for the Schubert-closure comparison. The determinantal functor follows from vanishing of exterior powers of the universal maps.

### 1.5 Symplectic isotropic flags (S1.5)

For a nondegenerate alternating form ω on k^(2m), the bound dim U≤m for isotropic U⊂k^(2m) is a deduction from Mathlib's `LinearMap.BilinForm.finrank_add_finrank_orthogonal`: dim U+dim U^⊥=2m and U⊆U^⊥. Construct the isotropic Grassmannian of rank-r isotropic subbundles as the closed subscheme of the quotient-rank-(2m−r) Grassmannian `Module.Grassmannian.scheme` cut out on each affine open by the native ideal `Module.Grassmannian.isotropicLocus`, the universal zero locus of the restricted form on the tautological submodule. The local ideals glue because their formation commutes with base change (`Module.Grassmannian.isotropicLocus_map`), and the closed subscheme represents isotropic subbundles by `Module.Grassmannian.isotropicLocus_le_ker_iff`. Prove that Sp_(2m)(k) acts transitively on rank-r isotropic subspaces: an isotropic U lies in a Lagrangian, obtained by adding vectors of U^⊥ outside U one at a time (each enlargement stays isotropic because ω is alternating); a basis of U extends to a basis of that Lagrangian, and `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq` extends it to a basis with Gram matrix `Matrix.J`; the change of basis between two such bases is symplectic by `SymplecticGroup.mem_iff'` and carries the first U to the second. Compare its split group quotient, parabolic stabilizer and dimension r(2m−r)−r(r−1)/2, including characteristic 2 with an actual alternating form. Rank 0 is a point and r>m is empty. Distinguish orthogonal characteristic 2/non-smooth stabilizer issues. General root-type flag examples use the actual corresponding reductive model.


   **Symplectic stabilizer in antidiagonal coordinates.** For 0≤r≤m put
   s=m−r and take the antidiagonal form
   `Q_src=[[0,H_m],[−H_m,0]]`, where H_m has ones on its antidiagonal.
   In one-based coordinates set u_i=e_i and f_i=e_(2m+1−i).
   Let C have ordered columns
   `(u_1,...,u_r; u_(r+1),...,u_m,f_(r+1),...,f_m; f_1,...,f_r)`.
   Prove `Cᵀ Q_src C=J_(r,s)`, where
   ```
   J_(r,s) = [[0,0,I_r],[0,J_0,0],[−I_r,0,0]],
   J_0     = [[0,I_s],[−I_s,0]].
   ```
   Give the actual permutation/reindexing maps to `Fin (2*m)` and the
   sum-indexed native symplectic carrier. The native
   `Matrix.J`
   is `[[0,−I],[I,0]]`; prove the global-negation and permutation comparisons,
   using `SymplecticGroup.mem_iff'` for the column-action equation.

   In these coordinates prove that the stabilizer P_r of
   `U=span(u_1,...,u_r)` consists exactly of the block upper-triangular
   symplectic matrices for block sizes (r,2s,r). Preservation of U forces
   preservation of U-perp=U⊕W_0. Construct the Levi homomorphism
   `l(A,D)=diag(A,D,A^(−T))`, with A∈GL_r and D∈Sp(W_0,J_0),
   and the unipotent matrices
   ```
   u(Y,Z) = [[I_r,YᵀJ_0,Z],[0,I_(2s),Y],[0,0,I_r]],
   Y : Matrix (Fin (2*s)) (Fin r) k,
   Z : Matrix (Fin r) (Fin r) k,
   Z−Zᵀ = YᵀJ_0Y.
   ```
   Prove every element of P_r has a unique factorization u(Y,Z)l(A,D),
   with inverse coordinate extraction from its blocks. Export the laws
   ```
   (Y,Z)(Y',Z') = (Y+Y', Z+Z'+YᵀJ_0Y'),
   (Y,Z)⁻¹      = (−Y,−Zᵀ),
   l(A,D)u(Y,Z)l(A,D)⁻¹ = u(DYAᵀ,AZAᵀ).
   ```
   Identify this kernel as the unipotent radical and construct the split
   projection P_r→GL_r×Sp_(2s), its section and the resulting semidirect
   product on the existing group-scheme/point carriers. Prove the block
   maps and their equations commute with field extension and base change.
   Since YᵀJ_0Y is alternating, choose its strictly upper-triangular part
   Z_0, with `Z_0−Z_0ᵀ=YᵀJ_0Y`; then Z−Z_0 is symmetric.
   This gives affine coordinates of dimension `2sr+r(r+1)/2` on the
   unipotent radical in every characteristic. No division by 2 is used.
   Recover the isotropic-Grassmannian dimension above from this stabilizer.
   At r=0 obtain P_0=Sp_(2m) and trivial radical; at r=m obtain
   GL_m acting on the additive symmetric matrices by Z↦AZAᵀ.
   Compare this positive-coordinate parabolic with the roadmap's negative
   quotient convention by its pinned opposition map before assigning a
   root subset or Schubert index.

- The isotropic zero locus and parabolic stabilizer retain the alternating form and their change-of-basis maps.
- The unique unipotent–Levi factorization has the displayed multiplication, inverse and conjugation laws.
- The root-chart comparison works in characteristic 2, using the upper-triangular part instead of division by 2.

**Checks.**

- For m=2, isotropic ranks 0,1,2 have dimensions 0,3,3, and rank 3 is empty.
- With r=s=1, Y=(1,2), Y′=(3,4), Z=5 and Z′=6, one has YᵀJ₀Y′=−2 and the product coordinates are ((4,6),9); reversing the symplectic sign would give 13.
- At r=m the Y block is empty and the unipotent group is the additive symmetric m×m matrices; at r=0 it is the trivial group.
- For m=1, Q_src=[[0,1],[−1,0]] gives ω(u₁,f₁)=+1, so the basis (u₁,f₁) has Gram matrix −J for J=[[0,−1],[1,0]]. The native extension of the Lagrangian basis (u₁) has second vector −f₁+cu₁, with ω(u₁,−f₁+cu₁)=−1; outside characteristic 2, taking f₁ itself as the partner gives Gram matrix −J instead of J. In characteristic 2 the two matrices coincide, so this sign is visible only in the integral and odd-characteristic comparison.

*Needs:* S1.1–1.2; ReductiveGroups parabolic stabilizers; Mathlib `Matrix.J`, `SymplecticGroup.mem_iff'`, `LinearMap.BilinForm.finrank_add_finrank_orthogonal` and `LinearMap.BilinForm.IsAlt.isRefl`; the native `Module.Grassmannian.scheme`, `Module.Grassmannian.isotropicLocus`, `Module.Grassmannian.isotropicLocus_map`, `Module.Grassmannian.isotropicLocus_le_ker_iff` and `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq`. The displayed block identities are deductions by matrix multiplication and the alternating-form rank bound; no coordinate formula uses division by 2.

### Examples

For Gr(2,4), pivots (1,2), (1,3) and (3,4) have dimensions 0, 1 and 4. The empty and full subspaces each give one point. For a symplectic four-space the Lagrangian rank is 2 and its isotropic Grassmannian has dimension 2(4−2)−2(2−1)/2=3.

### Dependencies

ModularCurves §0G; ReductiveGroups Layers 7–9; SchemeAndStackFoundations Layer 1 descent and closed subschemes; the native affine Grassmannian scheme, basis-flag pivots, isotropic-locus ideal and Lagrangian basis extension of the From Tau Ceti contract for S1.1, S1.3 and S1.5; Mathlib's orthogonal-complement rank formula and `Matrix.J` for S1.5. S1.4’s closure identification additionally uses S5.6; the incidence construction itself does not.

## Layer 2: All-word Bott–Samelson and crank interfaces (S2)


### 2.1 Left and right cranks (S2.1)

For each simple root use the actual minimal parabolic P_i− and projection G/B−→G/P_i−. For X→G/B− construct the right crank X×_(G/P_i−)G/B−, a P¹-bundle over X; construct the left crank P_i−×^(B−)X, an X-bundle over P¹, with its map to G/B− when X is a B−-space. Distinguish the two projection directions, group actions and universal properties. The right crank is the right Bott–Samelson operation of KnutsonBottSamelson §1, p. 1, and the left crank its left operation (KnutsonBottSamelson §5, p. 4). The right projection is smooth proper of relative dimension 1; if X is smooth/proper over k, so is its total space in the corresponding assertion. The left construction is locally an X-bundle over P¹ and inherits smoothness/properness over k when X has that property. Export their base-change and equivariance laws; no absolute properness is asserted for an arbitrary nonproper X.

The two constructions have separate universal maps: the right crank is a fibre product, and the left crank is an associated bundle.

- Their projections and structure maps commute with base change.
- The right projection has relative dimension 1, independently of the dimension of X.
- The left action descends from multiplication on P_i− and the given B− action on X.

**Checks.**

- With X the identity flag, either construction is ℙ¹ of dimension 1.
- For X=𝔸¹ with constant structure map, the right crank is 𝔸¹×ℙ¹; it is proper over 𝔸¹ but not over k.
- For X empty both constructions are empty; a disjoint extra ℙ¹ would violate the fibre-product and associated-bundle descriptions.

*Needs:* S1.0–1.2; SchemeAndStackFoundations Layer 1 fibre products and descent. The bundle assertions follow by trivializing the rank-one quotient.

### 2.2 Word schemes (S2.2)

For every finite word i₁…i_r, including empty and nonreduced words, construct the integral iterated-rank-one model as the contracted product P_i₁−×^(B−)…×^(B−)P_ir−/B−. Construct its quotient charts, scheme structure, iterated P¹-bundle maps, universal flag-chain description and multiplication map π to G/B−. Fix the factor order and compare it with the right-crank iteration order of KnutsonBottSamelson §2, pp. 1–2, and with the contracted-product description of its §5, p. 4. Prove dimension r, smoothness/properness, the B−/T actions, and base-change compatibility. No reducedness of the word is required for these constructions.

- Successively forgetting the last factor gives the specified P¹-bundle tower.
- Multiplication sends the class of (p₁,…,p_r) to p₁⋯p_r B− and is independent of quotient representatives.
- Charts and flag-chain maps commute with arbitrary base change.

**Checks.**

- The empty word is the identity flag, with dimension 0 and one fixed section.
- A one-letter word is ℙ¹, with dimension 1 and two fixed sections.
- The word ii has dimension 2 and four fixed sections; deleting a repeated letter would incorrectly reduce these to 1 and 2.

*Needs:* S2.1 and the split pinned model of S1; scheme gluing and descent. The contracted-product definition and tower are LLM §1.4, pp. 300–301; the integral extension uses the same quotient charts.

### 2.3 Subwords and images (S2.3)

Construct subword closed embeddings, the 2^r T-fixed sections and the image of each indexed subword. For ε∈{0,1}^r put w_j=s_i₁^(ε₁)⋯s_ij^(ε_j). Prove tangent weights β_j=(−1)^(ε_j)w_(j−1)α_ij from the actual successive rank-one charts; the fibre of π*Lλ has weight w_rλ. For reduced words, identify the open product of root parameters with C(w) and prove π proper birational onto X(w), isomorphic on that open cell. Prove the subword/Bruhat criterion from the existing Coxeter exchange/deletion floor and these actual maps; do not infer an isomorphism from a mere bijection of fixed points. A proper fibre can be nonreduced even when its underlying set is one point.
   **Images for every word.** For Q=(i₁,…,i_r), define δ(Q) by δ(∅)=e
   and δ(Qi)=max(δ(Q),δ(Q)s_i) in the fixed right-word convention. Prove
   that the actual scheme-theoretic image of π_Q is X(δ(Q)), using the
   rank-one cell multiplication and induction, with its reduced closure
   and field/base-change comparison. Do not substitute the ordinary group
   product of the letters. At Q=(i,i), the image is X(s_i), not X(e);
   at the empty word it is the identity flag. Reduced words recover the reduced-word birational statement above.
   Keep the all-word map distinct from a reduced-word birational resolution.

- Subword embeddings set omitted factors to the identity coset and commute with multiplication.
- The Demazure product records the image, and is unchanged by appending a descent.
- Fixed-point tangent and line weights retain the same prefix products w_j as multiplication.

**Checks.**

- For Q empty, δ(Q)=e and the image has dimension 0.
- For Q=i, the two tangent weights are α_i and −α_i; the line fibres are λ and s_iλ.
- For Q=ii, δ(Q)=s_i and the image dimension is 1, while the ordinary product is e of length 0; the four fixed sections map to e,s_i,s_i,e.

*Needs:* S2.2; the native `CoxeterSystem.exchangeCondition`, `CoxeterSystem.deletionCondition`, `CoxeterSystem.BruhatLE` and `CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq`, applied to `TauCeti.weylCoxeterSystem`; S5.6 for the actual reduced closures and their base change. The reduced-word charts are the route to the subword comparison. The element δ(Q) is the Bruhat-maximal product of a subword of Q, written w_max(i) and characterised as the product of a longest reduced subword (LLM §3.1, p. 312, LLM lines 804–806); that the images of the initial segments of an arbitrary word form a weakly increasing chain of Schubert varieties, growing exactly at the letters at which δ increases, is the first step of the proof in KnutsonBottSamelson §4, p. 4 (lines 141–145) of the subword statement there, that every word for v contains a reduced subword for v (lines 137–138). That proof then takes the letters at which the image grows as a reduced subword with the product of the word (lines 144–148), but those letters multiply to δ(Q), which differs from the product of the word for some nonreduced words: for Q=(i,i) they give s_i while the product is e (for Q=(i,i,i) both are s_i). Only the chain is used here. The identification of the scheme-theoretic image with X(δ(Q)), with its base change, is the target.

### 2.4 Parabolic words and refinements (S2.4)

Construct generalized words with parabolic letters and their longest elements, refinement/unrefinement maps and composites. Prove the needed reduced-word comparisons by finite zigzags of refinements and unrefinements from actual Coxeter braid/length data. Ordinary reduced words 121 and 212 have no further simple-letter refinements, so no single common word refinement is assumed. The resulting diagrams/correspondences are over the flag; a braid move is not asserted to give an isomorphism of the two word schemes. A parabolic longest element reverses the positive subsystem; it need not fix the other simple roots or negate every simple root individually. Give rank-two braid and nonreduced examples. The parabolic letters and their longest elements follow KnutsonBottSamelson §6, p. 5.

- Refinement multiplies the factors inside the specified parabolic letter.
- Unrefinement respects the final flag and composes with further unrefinements.
- The comparison zigzags preserve the multiplication morphisms, without identifying the intermediate schemes.

**Checks.**

- Refining the empty word does nothing: the result remains a point.
- In A₂, 121 and 212 both represent w₀ of length 3; each has zero further simple-letter refinements.
- In the A₂ parabolic on both roots, w₀ sends α₁ to −α₂, not −α₁; replacing subsystem opposition by individual negation is incorrect.

*Needs:* S2.1–2.3; ReductiveGroups parabolics; the native `TauCeti.braidEquivalent_of_isReduced_wordProd_eq` (braid moves between reduced words) and `TauCeti.length_weylCoxeterSystem_eq` (length as the number of inversions).

### 2.5 Compact word comparison (S2.5)

Compare the complex scheme with the compact model using the actual rank-one group T·SU₂α and its finite central quotient, not an unconditional product SU₂×T^(rank−1). Consume the compact rank-one root representatives from LieGroups. Export full groupoid/functorial chart, bundle and projection comparisons, then compare the type A finite characteristic maps with the normalization of TopologicalKTheory T1.5. Generic word geometry here does not become an extra premise for T1.5's finite CW construction.

- The comparison identifies quotient charts and their transition maps.
- It commutes with the tower projections and multiplication to the flag.
- The finite central kernel is retained when comparing the compact rank-one factors.

**Checks.**

- The empty complex word and compact word are both a point.
- A one-letter complex word is ℙ¹ and its compact model is SU₂/U₁≃S².
- The map SU₂×U₁→U₂ has kernel {(I,1),(−I,−1)} of size 2; treating it as a direct-product isomorphism would give kernel size 1.

*Needs:* S2.2; LieGroups Layer 8, ReductiveGroups §3A.5 and S9.0–9.1 for the complex realization; TopologicalKTheory T1.5 for the type-A characteristic maps. The compact model is Bott and Samelson's, recalled in KnutsonBottSamelson §5, p. 5 (KnutsonBottSamelson lines 168–173), where the rank-one compact factors are written as products SU(2)×T^(n−1) and divided by T; S2.5 uses the actual group T·SU₂α, onto which that product maps with the finite central kernel of the Checks.

### Examples

The empty word has dimension 0 and one fixed section. One simple reflection gives ℙ¹ with two fixed sections of tangent weights α and −α. The word ii has dimension 2 and four fixed sections but image of dimension 1, so its image map is not birational.

### Dependencies

S1.0–2 and ReductiveGroups Layers 7–9 for rank-one parabolics; scheme fibre products and associated-bundle descent; the native exchange, deletion, Matsumoto and Bruhat-order declarations of the supplier contracts for S2.3–2.4.

## Layer 3: Line bundles, sections and rank-one push-pull (S3)


### 3.1 Associated lines and their fibres (S3.1)

Construct L(λ) on the supplied quotient by descent, with its actual linearization, local transition functions and sections. Prove tensor L(λ+μ), dual, pullback, associated-bundle and field/base-change laws. Characterize descent to P− by the Levi pairings and its actual group characters. Over an affine base, prove that the class of L(λ) is ample in the sense of the native `LineBundleClass.IsAmple` when λ is strictly positive on the complementary simple roots, and that L(λ) satisfies the native `InvertibleSheaf.IsGloballyGenerated` when λ is dominant; over a general base both statements are made on the preimage of every affine open; a character not in the original lattice is handled only after the specified cover/flag comparison.
   **Equivariant lines and the fibre inverse.** Over the stated field k,
   construct the equivalence between the groupoid of G-linearized invertible
   sheaves on G/B− (with G-equivariant isomorphisms) and the groupoid of
   one-dimensional rational B−-modules (with B−-linear isomorphisms).
   The fibre functor takes E to E_(eB−), with its actual stabilizer action;
   its inverse is the associated-line construction above. Construct the unit
   v↦[1,v] and the counit [g,v]↦g·v, proving independence of the quotient
   representative, regularity and both inverse and triangle identities by
   descent on the supplied quotient charts. Prove full faithfulness on the
   actual isomorphism spaces, naturality, and compatibility with tensor,
   dual, the trivial line and field extension. This is the homogeneous
   application of the existing associated-bundle/descent machinery, with
   its actual G action; it does not replace that machinery.

   Prove that every algebraic character of B− is trivial on its unipotent
   radical and factors uniquely through T. Thus isomorphism classes of
   these specified G-linearized lines are X*(B−)≃X*(T), with fibre character
   λ for L(λ); retain the scalar automorphisms in the groupoid rather than
   replacing it by a discrete category of weights. A Lie functional in t*
   is not a group character without the actual lattice/integration condition.
   Give the same fibre/associated-line equivalence for G/P− and rational
   characters of P−, and compare restriction to T with precisely the zero
   Levi-coroot-pairing condition already specified above.

   Construct the forgetful map to the ordinary Picard group, the native
   `LineBundleClass` of G/P−, and its tensor laws. Prove that two G-linearizations on the same underlying line differ
   by a unique character of G: use H⁰(G/P−,O)=k and the linearization cocycle
   to identify their fibrewise ratio, and prove its regular dependence on G.
   In particular identify the kernel of forgetting with the restrictions
   of X*(G) inside X*(P−). Do not assert that every ordinary line admits a
   G-linearization. For a root-free torus the flag is a point, so all its
   characters give the same underlying ordinary line with different
   linearizations; the zero character gives the equivariantly trivial line.

- The fibre and associated-line maps are inverse on equivariant isomorphisms, not only on isomorphism classes.
- Tensor adds characters; duality negates them; restriction preserves the fibre at the identity.
- Forgetting equivariance kills precisely the characters extending to G.

**Checks.**

- On SL₂/B− the weight-one line has degree +1; reversing the character would give −1.
- On a torus flag, characters 0 and 1 give the same underlying one-dimensional line and different torus actions.
- A GL₂ determinant character restricts to degree 0 on the flag, while the weight-one SL₂ character has degree 1.
- On SL₂/B− over a field, λ=0 gives 𝒪 on ℙ¹, which is globally generated but not ample because ℙ¹ is proper of dimension 1 and so not quasi-affine, while λ=ω gives O(1), which is ample; granting ampleness to every dominant λ would make the zero class ample. For a torus over an affine base the flag is the base, every character is vacuously strictly positive, and its class is the trivial class, ample because an affine scheme is quasi-affine.

*Needs:* S1's quotient charts; ReductiveGroups rational characters and descent; the native `TauCeti.AlgebraicGeometry.InvertibleSheaf` with `InvertibleSheaf.tensorProduct`, `InvertibleSheaf.dual` and `InvertibleSheaf.pullback`, the tensor pullback comparisons `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent` and `Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent_right`, the Picard group `TauCeti.AlgebraicGeometry.LineBundleClass` with `LineBundleClass.pullbackHom`, and the predicates `LineBundleClass.IsAmple` and `InvertibleSheaf.IsGloballyGenerated` (From Tau Ceti). The fibre equivalence follows from quotient descent. The rank-one degree ⟨λ,α_i∨⟩ is the value of BrionFlags Proposition 1.4.3, p. 16 (BrionFlags lines 613–625 and 636–639), degree λ_i−λ_j on the Schubert curves of the type-A flag G/B+, transported to G/B− by the Chevalley involution, which exchanges B+ and B− and acts by −1 on X: it carries L(λ) to the B+-homogeneous line whose sections satisfy f(gb)=λ(b)f(g). For GL₂ and λ=(1,0), the sections of L(λ) on G/B− are spanned by the two entries of the first row of g⁻¹, and their pullbacks are the two entries of the first column of g, the coordinates of the vector ge₁, which are sections of O(1) on the projective line of lines ge₁, of degree +1=λ₁−λ₂. Brion's displayed action b(g,t)=(gb⁻¹,λ(b)t) on G×ℂ (BrionFlags line 593), read literally, has the opposite sign and gives no sections for this λ, so the comparison is made with the degree of Proposition 1.4.3, and the SL₂ Check above fixes the sign independently.

### 3.2 Sections and extremal spans (S3.2)

Construct the regular-function realization ∇λ from the rational representation supplier and the natural section map. Prove its inverse on quotient charts. On the full flag and dominant λ, compare it with the canonical Weyl/induced pair. On X(w), define sections geometrically and identify the dual of restriction with the actual B−-span in Δ(κ), κ=−w₀λ, generated by the extremal vector of weight−wλ. Prove this comparison using the normalized pairing and the actual section-extension theorem of S5. For λ ample on G/P_λ, prove that inclusion of the corresponding geometric Schubert varieties is equivalent to inclusion of these actual extremal-span modules, using the extremal-weight/subword criterion. On walls compare the correct cosets in W/W_λ; a line contracted by the parabolic projection cannot detect distinct full-flag indices. Convert to positive-Borel Demazure modules using pinned contravariant duality/opposition; ordinary dualization alone changes λ.

- The section map from the induced module to λ-twisted regular functions is a B−-equivariant isomorphism, inverse to evaluation on every quotient chart.
- Restriction from the full flag to X(w) is surjective, and its dual is the B−-submodule of Δ(κ) generated by the extremal vector of weight −wλ.
- For λ ample on G/P_λ, X(v)⊆X(w) holds exactly when the extremal span of v lies in the extremal span of w; on a wall the comparison is made in W/W_λ.

**Checks.**

- For SL₂ and λ=1, X(e) gives the fibre, of dimension 1 and T-weight λ, so its dual has weight −1, the weight of the extremal vector −eλ; X(s)=ℙ¹ gives ∇(1), of dimension 2 and weights ±1, whose dual is all of Δ(1). A model generating the span from weight +wλ would place the wrong weight at e.
- For λ=0 both X(e) and X(s) give the constants k, and restriction is the identity on constants.
- For GL₃ and λ=ω₁, the line L(ω₁) has degree ⟨ω₁,α₂∨⟩=0 on X(s₂), so X(e) and X(s₂) have the same one-dimensional section space and the same extremal span: e and s₂ are one coset in W/W_λ, and comparing full-flag indices instead would separate them.

*Needs:* S3.1; ReductiveGroups' induction, extremal vectors and contravariant duality; S5.5 for section extension. The extremal-span comparison uses restriction and the normalized pairing, not a dimension identification. The extremal span is the Demazure module of LLM §1.1, p. 294, realized as sections in LLM §4.1, p. 315; Jantzen, *Representations of Algebraic Groups*, Part II, Chapter 14 gives the arbitrary-field statement and its contravariant dual.

### 3.3 Integral signed-string operators (S3.3)

For every integer m, specialize SchemeAndStackFoundations §2.6's projective-space cohomology to H⁰/H¹(P¹,O(m)), and construct its actual rank-one T-weight, functoriality, residue/Serre pairing and zero-case comparisons. Build the relative P¹ pushforward and higher-direct-image comparison on the actual rank-one bundle. The integral Demazure Euler operator D_i on the group ring of the character lattice is the native `RootPairing.demazureOperator`, applied to the root datum of G: for m=⟨λ,α_i∨⟩≥0 it gives Σ_(j=0)^m e^(λ−jα_i), for m=−1 it gives 0, and for m≤−2 it gives the negative string −Σ_(j=1)^(−m−1) e^(λ+jα_i); its localization identity (1−e^(−α_i))D_i(eλ)=eλ−e^(−α_i)e^(s_iλ) is `RootPairing.one_sub_single_neg_root_mul_demazureOperator`, and D_i²=D_i is `RootPairing.demazureOperator_demazureOperator`. Prove that the string D_i(eλ) is the T-character of H⁰(P¹,O(m))−H¹(P¹,O(m)) on the rank-one quotient P_i/B−, with the fibre weights of S3.1 and the ℙ¹ cohomology above; this geometric identification is the target, and the operator is not defined again.
   **Positive-denominator convention.** Define the Knutson Demazure handout's
   operator Δ_i on the same group ring as the conjugate Δ_i=ιD_iι by the
   weight inversion ι(eλ)=e^(−λ), and prove its finite-string form: for
   m=⟨λ,α_i∨⟩ it sends eλ to Σ_(j=0)^(−m)e^(λ+jα_i) when m≤0, to 0 when
   m=1, and to −Σ_(j=1)^(m−1)e^(λ−jα_i) when m≥2 (the three native string
   lemmas of D_i transported by ι), and the rational identity
   Δ_i(p)=(p−e^(α_i)s_i(p))/(1−e^(α_i)) as the transport of the native
   localization identity, so that divisibility over ℤ needs no analytic
   removable-pole argument. For N=p−e^(α_i)s_i(p), the exact identity is
   s_i(N)=−e^(−α_i)N, rather than unweighted antisymmetry. Deduce
   s_iΔ_i(p)=Δ_i(p), Δ_i²=Δ_i and the braid comparisons from the native
   laws for D_i by the inversion conjugacy.

   Compare the positive-Borel/left-crank convention of KnutsonDemazure, pp. 1–4, with the
   negative-Borel/right-word one through S1's inversion and S3's
   associated-line/opposition maps. In particular left multiplication
   s_iw becomes w⁻¹s_i after inverting the Weyl index; retain the actual
   character inversion and longest-representative fibre factors as well.
   Use S5's cohomological comparison to pass from Euler character to H⁰ in
   the dominant case. If the next Demazure product is unchanged, the same
   comparison proves that Δ_i fixes the corresponding character; at the
   longest word each simple operator fixes the result, hence it is Weyl
   invariant, and `RootPairing.demazureOperator_eq_self_of_isWeylInvariant`
   is the converse on the native side. The character formula and its
   exercises use these maps, not a guessed sign or an assumed equality of
   the two Borel conventions. The handout's derivation of Δ_i from the two
   fixed fibres of the left-crank map is a fixed-point argument; it belongs
   to the Part II named in the scope, and this comparison does not use it.

   The API of the geometric interpretation is the identification of each
   native string with a rank-one Euler character, its functoriality in the
   fibre weight, and the inversion conjugacy with Δ_i.

   **Checks.**

   - For pairing m=0, D_i(eλ)=eλ, with augmentation 1 (the native string
     lemma at string length 0).
   - For m=−1, D_i(eλ)=0, the empty string; retaining either endpoint would
     give augmentation 1.
   - For m=−2, D_i(eλ)=−e^(λ+α_i), the negative string of length 1, with
     augmentation −1; replacing Euler cohomology by H⁰ on the geometric side
     would incorrectly give 0.
   - For m=1 the handout's Δ_i(eλ) is 0 while D_i(eλ)=eλ+e^(λ−α_i): the two
     conventions differ on the same weight, and only their conjugates by ι
     agree.

   *Needs:* SchemeAndStackFoundations §2.6's projective-line cohomology;
   S1's rank-one quotient; S3.1's line convention; the native
   `RootPairing.demazureOperator` with its string, localization and
   idempotence lemmas on the group ring of the actual character lattice.
   The finite-string algebra is native and independent of S5; only the
   geometric H⁰ interpretation needs S5's vanishing.


### 3.4 Demazure and Weyl characters (S3.4)

The operator identities are native: D_i²=D_i, the braid relations and the word independence of D_w=D_(i₁)⋯D_(i_r) along reduced words (`RootPairing.prod_map_demazureOperator_eq_of_wordProd_eq`, which applies `TauCeti.matsumoto` to the monoid of ℤ-linear endomorphisms of the group ring), D_iD_w=D_w for a left descent, the Levi and wall cases and the recursion D_iχ_ξ=χ_(s_iξ) for ⟨ξ,α_i∨⟩≥0 and D_iχ_ξ=χ_ξ for ⟨ξ,α_i∨⟩≤0 (`Parabolic.lean`), and Demazure's longest-element formula Δ·D_(w₀)(f)=Σ_(w∈W) sgn(w)e^(wρ−ρ)w(f) (`RootPairing.weylDenominator_mul_prod_map_demazureOperator`). Prove the geometric statements on top of them, keeping Euler classes distinct from individual H⁰ outside the vanishing range. For every word Q=(i₁,…,i_r), reduced or not, prove that the torus Euler character χ_T(Z_Q,π_Q*L(λ)) of S2's word scheme is the composite of the operators D_(i_j) applied to eλ, in the order fixed by S2.1's crank convention, by the rank-one push-pull of S3.3 along the tower. For dominant λ, S5 supplies the no-higher-cohomology/pullback comparison needed to identify char H⁰(X(w),Lλ)=D_w(eλ), the Demazure character formula; the native word independence and wall case say that the right side depends only on the coset wW_λ, as X(w) in G/P_λ does. Prove the wall/Levi and longest-word geometric cases: at w₀, char H⁰(G/B−,L(λ))=D_(w₀)(eλ), so the native longest-element formula with J(1)=Δ is the Weyl character formula for the formal character of ∇(λ) in every characteristic. In characteristic 0 identify it with the character of the simple module, Δ(λ)=∇(λ)=L(λ) there (ReductiveGroups Layer 10 §10B); on the Lie-algebra side the same identification is the native Weyl character formula `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`, through the lattice comparison of S4.4; in characteristic p it is the induced/Weyl formal character, which need not be the character of L(λ). Do not replace a positive-characteristic induced module by a simple module.

*Needs:* S3.3 for the geometric rank-one strings; the native `RootPairing.demazureOperator` laws of `Braid.lean`, `LongestElement.lean` and `Parabolic.lean`; S2.3 for the word tower; S5.5 and S5.7 for the dominant geometric interpretation; ReductiveGroups Layer 10 §10B for the characteristic-0 simple module, and the native `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` for its Lie-algebra form. LLM Theorem 5, p. 299 gives the corresponding iterated character formula; S3.3 transports its convention.

### 3.5 Highest-line embeddings (S3.5)

Construct coordinate maps for the complete linear system and the extremal-line orbit, and prove their scheme-theoretic comparison. Basepoint freeness and injectivity on geometric points do not prove a closed immersion in characteristic p. Own the exact stabilizer/separability and closed-immersion argument for the chosen canonical model; for a general highest-weight representation state the actual stabilizer conditions. Test the SL₂ Frobenius representation, where the orbit map can be purely inseparable. Over ℂ in type A the statement is BrionFlags §1.4: the product of the Plücker maps X→∏_d Gr(d,n)→∏_d ℙ(Λ^dℂⁿ) is a closed immersion and L(χ_d) is the pull-back of O(1) under X→Gr(d,n)→ℙ(Λ^dℂⁿ) (BrionFlags lines 562–568 and 653–654, pp. 15 and 17), and Proposition 1.4.1, p. 14 (BrionFlags lines 549–552) says that a divisor is ample exactly when it is a positive combination of the Schubert divisors and that every ample divisor on the flag variety is very ample. The target in every characteristic is the following. Let λ∈X have ⟨λ,α_i∨⟩=0 for the simple roots α_i of the Levi of P− and ⟨λ,α_i∨⟩>0 for the other simple roots. Then over every field k the line L(λ) is very ample on G/P−: the complete linear system G/P−→ℙ(H⁰(G/P−,L(λ))*) is a closed immersion, and it is the orbit map of the B−-stable line of weight −λ in H⁰(G/P−,L(λ))*. Over an algebraically closed field this is Ramanathan1987, Theorem 3.11(i), p. 86 (Ramanathan1987 line 950: in every characteristic the section ring of a line bundle with nonzero sections on G/Q is generated in degree one), together with Remark 2.4, p. 73 (line 490: generation in degree one in all large degrees forces an ample line bundle to be very ample); in characteristic p his input is the compatible splitting of the diagonal of G/Q×G/Q, Theorem 3.5(ii), p. 82 (line 803). Ramanathan works with a simply connected semisimple group (line 750); G/P− is also the flag variety of the simply connected cover of the derived group of G, with L(λ) the associated line of the restriction of λ, and over a non-closed field very ampleness descends from an algebraic closure by flat base change of H⁰ and fpqc descent of closed immersions. The route here is the scheme stabilizer: prove that the scheme-theoretic stabilizer of that line is P−, so that the orbit map is an immersion over k, closed because G/P− is proper. Ramanathan's route through degree-one generation is not used inside this roadmap, since S6.5's normal generation rests on S6.1, which consumes this embedding.

- Evaluation is equivariant and descends to the stated quotient with its scheme stabilizer.
- Its line pullback is the specified L(λ), including its linearization.
- The closed-immersion conclusion requires the full stabilizer scheme, not only its geometric points.

**Checks.**

- SL₂ with L(1) gives the identity embedding of ℙ¹, with differential rank 1.
- With λ=0 the map has point image and differential rank 0; it is not an embedding of ℙ¹.
- In characteristic p the Frobenius-twisted natural representation gives [x:y]↦[x^p:y^p], with differential 0 although the geometric point map is bijective.

*Needs:* S3.1–3.2; S3.1's global generation and the scheme closed-immersion criterion; ReductiveGroups scheme stabilizers. BrionFlags Proposition 1.4.1 and the Plücker closed immersion (lines 549–552 and 562–568) give the complex type-A statement; Ramanathan1987 Theorem 3.11(i) with Remark 2.4 (lines 950 and 490) gives the statement over an algebraically closed field of every characteristic.

### 3.6 A₂ signed-string character calculation (S3.6)

The diagram in KnutsonDemazure §4.0.2, p. 4 motivates this worked test.
The coefficient formula below is a deduction from S3.3’s finite signed strings
and the displayed interlacing inequalities, not a transcription of that diagram.
As a worked test of the integral operators and the geometric comparison,
compute the dominant SL₃ weight λ=2ω₁+5ω₂ using both reduced words 121
and 212. Fix α₁=ε₁−ε₂ and α₂=ε₂−ε₃. Use the GL₃ lift (7,5,0),
whose restriction has this SL₃ highest weight, and write e^(a,b,c) for its
weight monomials. All weights have a+b+c=12; this slice gives distinct
representatives modulo the diagonal SL₃ character relation. Start at the
lowest monomial χ₀=e^(0,5,7) and use S3.3's positive-denominator Δ_i.

Prove the two first stages explicitly:

`χ₁=Δ₁χ₀=Σ_(j=0)^5 e^(j,5−j,7)`,

`χ₂=Δ₂χ₁=Σ_(j=0)^5 Σ_(k=0)^(j+2) e^(j,5−j+k,7−k)`.

Their augmentations are 6 and 33, and every displayed weight has
multiplicity 1. Collect the signed strings of χ₃=Δ₁χ₂: its coefficient
at (a,b,c) is zero unless a+b+c=12 and 0≤a,b,c≤7; on that support it is

`1+min{2,a,b,c,7−a,7−b,7−c}`.

Thus there are 46 weights: 21 of multiplicity 1, 15 of multiplicity 2 and 10
of multiplicity 3, giving dimension 81. In particular the zero SL₃ weight,
represented by (4,4,4), has multiplicity 3. Compare this actual group-ring
character with the Weyl and induced formal characters of highest weight λ
from the rational-representation supplier; identify the geometric section
modules through S3.3's explicit inversion/opposition maps. Independently
compare the type A Gelfand–Tsetlin character: enumerate interlacing rows
`7≥u≥5≥v≥0`, `u≥w≥v`, of weight
`(w,u+v−w,12−u−v)`, and prove their multiplicities equal the formula above.
This is a coefficientwise comparison, not just equality of dimensions.

For the other word, set ψ₁=Δ₂χ₀, ψ₂=Δ₁ψ₁ and ψ₃=Δ₂ψ₂.
Prove the stage dimensions 1, 3, 21, 81 and ψ₃=χ₃; also prove
Δ₁χ₃=Δ₂χ₃=χ₃ and Weyl invariance on this actual character. At each step
retain the numerator identity
`(1−e^α_i)Δ_iχ=χ−e^α_i s_iχ` and its finite divisibility witness.
Negative coefficients in the flipped/shifted numerator are allowed; the
resulting Demazure characters have nonnegative coefficients. These are
explicit tests of signed-string cancellation, braid order and the
source-convention comparison, rather than an additional character engine.

**Checks.**

- The word 121 has successive augmentations 1,6,33,81; the word 212 gives 1,3,21,81.
- The final coefficient histogram is 21,15,10 weights of multiplicities 1,2,3, respectively, totaling 46 weights and dimension 81.
- The central weight (4,4,4) has multiplicity 3, whereas (9,3,0) has multiplicity 0; extending the coefficient formula outside its support gives a wrong value.

*Needs:* S3.3–3.4 for signed strings and characters; the GL₃ character lattice of the native `TauCeti.GeneralLinear.diagonalRootDatum 3`, with α₁=ε₁−ε₂ and α₂=ε₂−ε₃. The displayed interlacing inequalities give an independent finite count.

### Examples

On ℙ¹ the rank-one Euler dimensions for m=0, −1, −2 are 1, 0, −1. For the A₂ weight 2ω₁+5ω₂, both word orders give dimension 81 with 46 weights, as calculated above.

### Dependencies

S1–S2; SchemeAndStackFoundations §2.6; the named rational-representation supplier; the native `RootPairing.demazureOperator` files for S3.3–3.4 and `TauCeti.GeneralLinear.diagonalRootDatum` for S3.6. Dominant geometric section characters additionally use S5.

## Layer 4: Finite-type LS chains, root operators and section indices (S4)


### 4.1 Paths and crystals (S4.1)

The path carrier and the crystal algebra are native. Rational piecewise-linear paths in X⊗ℚ starting at 0, up to nondecreasing surjective piecewise-linear reparametrization, are `TauCeti.PLPath ℚ V` for V=ℚ⊗X, presented by segment lists whose normal form `TauCeti.PLPath.normalize` removes stationary segments and merges adjacent positively collinear ones; `TauCeti.PLPath.ofSegments_eq_ofSegments_iff` identifies presentations related by the elementary moves, `TauCeti.PLPath.ofSegments_map_snd_eq_iff_exists_isReparam` identifies timed presentations that are reparametrizations of a common rational one, and concatenation, `TauCeti.PLPath.endpoint`, `TauCeti.PLPath.reverse` and `TauCeti.PLPath.straight` are the native operations; Euclidean arc lengths play no role. Adding the linear central path t↦tχ, for χ annihilating every simple coroot (equivalently W-fixed), is the native `TauCeti.PLPath.shiftTimed` on timed presentations and is not an operation on reparametrization classes (`TauCeti.PLPath.not_exists_shiftTimed_on_paths`); on a path with a distinguished presentation, whose velocities lie in Wλ and change at every break, it is `TauCeti.PLPath.shiftDistinguished`, well defined by `TauCeti.PLPath.IsDistinguished.unique`, and `TauCeti.LSPath.isDistinguished_timed` says that the presentation of a Lakshmibai–Seshadri encoding by its directions and breaks is distinguished for dominant λ, including λ=0, where the only distinguished presentation is the constant path. The normal path-crystal category is `TauCeti.NormalCrystal` with its partial maps e_i,f_i:B→Option B, weight, ε_i and φ_i, the partial-inverse, weight and string identities, strict morphisms, components (`TauCeti.NormalCrystal.component`, `TauCeti.NormalCrystal.sigmaComponentsIso`), tensor products with Kashiwara's tie convention (`TauCeti.NormalCrystal.tensor`) and transport through bijections (`TauCeti.NormalCrystal.transport`); no classification of arbitrary abstract edge-labelled graphs is assumed from rank-one identities alone.

Construct on these carriers what the native files leave open. Define the set of rational paths with integral endpoint, as a subtype of `TauCeti.PLPath ℚ V`, and its ambient partial root operators from `TauCeti.PLPath.lower` and `TauCeti.PLPath.raise` with x=α_i and f=⟨−,α_i∨⟩; prove that neither all rational paths nor all integral-endpoint paths form a finite crystal, and that a path whose minimal simple-coroot heights and endpoint pairings are integers has the normal string lengths ε_i=−min H_i and φ_i=H_i(1)−min H_i (`TauCeti.PLPath.isSome_raiseIter_iff_of_eq_natCast`, `TauCeti.PLPath.isSome_lowerIter_iff_of_eq_natCast`). The normal crystal on the Lakshmibai–Seshadri encodings of a dominant shape is S4.3's target; S4.1 owns the general dictionary between operator-closed sets of integral paths and normal crystals: a set of paths closed under the ambient operators, on which every minimal simple-coroot height and every endpoint pairing is an integer, is a `TauCeti.NormalCrystal` with weight the endpoint and the string lengths above, and a path map between two such sets that commutes with the operators and preserves endpoints is a strict morphism.
   For the path carrier, the API consists of presentation equivalence,
   reparametrization-invariant endpoints and concatenation, and comparison by
   common rational subdivisions, all native. For the crystal dictionary, the
   API consists of the operator-closed-set construction, its weight map and
   string lengths, and the strict morphisms it produces.

   **Checks.**

   - For SL₂, with X=ℤω and ⟨ω,α∨⟩=1, the set {t↦tω, t↦−tω} is closed under
     the ambient operators: lowering the first gives the second and raising
     the second gives the first. Its minimal heights are 0 and −1 and its
     endpoint pairings 1 and −1, so the dictionary gives the two-element
     crystal of weights ±ω with (ε,φ)=(0,1) and (1,0). Exchanging ε and φ
     would give φ−ε=−1 at weight ω, against ⟨ω,α∨⟩=1.
   - The SL₂ path with segments −ω/2 then 3ω/2 has endpoint ω and minimal
     height −1/2; lowering it gives the path with segments −3ω/2 then ω/2,
     of endpoint −ω and minimal height −3/2, and the two paths form an
     operator-closed set. By the ambient string criteria their string
     lengths are (ε,φ)=(0,1) and (1,0), whereas the pairs
     (−min H, H(1)−min H) are (1/2,3/2) and (3/2,1/2): the integrality
     hypothesis of the dictionary cannot be dropped.
   - For SL₂ the paths with segments kω then −kω, k≥1, are pairwise distinct,
     with endpoint 0, minimal height 0 and endpoint pairing 0, so every
     operator kills each of them: the integral-endpoint paths contain
     infinitely many highest elements of weight 0 and form no finite crystal.
   - For SL₂, let S be the set of the three realized encodings of shape 2ω
     and the constant path. The inclusion of the encodings into S is a strict
     morphism. The bijection σ of S exchanging the encoding with segments −ω
     then ω and the constant path preserves endpoints but is not a strict
     morphism: for the straight path π, f(π) is that encoding, so σ(f(π)) is
     the constant path while f(σ(π))=f(π) is not; σ also changes ε from 1
     to 0.

   *Needs:* Mathlib `RootDatum`, `RootPairing.Base` and `RootPairing.weylGroup`; the native `TauCeti.PLPath`, `TauCeti.PLPath.lower`, `TauCeti.PLPath.raise`, `TauCeti.PLPath.shiftDistinguished` and `TauCeti.NormalCrystal` with the files named in the supplier contract; the native `TauCeti.weylCoxeterSystem` and `CoxeterSystem.BruhatLE`; the native `TauCeti.DynkinType.simplyConnectedRootDatum` for the SL₂ Checks. The path definitions follow Littelmann1995, §1.


### 4.2 Root operators (S4.2)

The running coroot heights H_i(t)=⟨π(t),α_i∨⟩, their minimum `TauCeti.PLPath.minHeight`, and the raising/lowering operators `TauCeti.PLPath.raise` and `TauCeti.PLPath.lower` by record-decreasing/record-increasing segments, equal-height excursions and the final root translation, with their last/first cut-time and tie conventions, are native, as are presentation/subdivision/reparametrization independence (`TauCeti.PLPath.lower_ofSegments`), the partial-inverse law on all paths (`TauCeti.PLPath.lower_eq_some_iff`), the endpoint changes ∓α_i, the minimal-height changes ∓1 and the ambient string criteria (`TauCeti.PLPath.isSome_lowerIter_iff`, `TauCeti.PLPath.isSome_raiseIter_iff`): f_i^n π is defined exactly when n≤H_i(1)−min H_i and e_i^n π exactly when n≤−min H_i. The integrality that turns these into the normal identities ε_i=−min H_i and φ_i=H_i(1)−min H_i on realized Lakshmibai–Seshadri paths is also native (`TauCeti.LSPath.exists_minHeight_eq_intCast`, `TauCeti.LSPath.exists_neg_minHeight_eq_natCast_and_apply_endpoint_sub_minHeight_eq_natCast`); ambient rational formulas on other paths are distinguished from these integral identities.

Prove the operator stability that these files leave open (Littelmann1995, Proposition 4.7 and Corollary 2, pp. 511–512). For dominant λ and an encoding π of shape λ, if f_i(π) is defined on the realized path then it is the realized path of an encoding of shape λ: reflect in s_i the directions of the piece between the last minimum of H_i and the first later time at which H_i has risen by one, insert that time as a new break, and merge equal adjacent directions; the same for e_i with the first minimum and the last earlier time. The chain conditions at the two ends of the reflected piece are `TauCeti.IsAChain.exists_isAChain_simple_mul_last` and `TauCeti.IsAChain.exists_isAChain_simple_mul_head`, and the reflected interior chains are `CoxeterSystem.MinimalCosetRepChain.simpleMul`. Transport the operators from realized paths to encodings through `TauCeti.LSPath.toPLPath_injective`. Before using simplified whole-interval reflections, use the native local-minimum integrality on the relevant components.

- The domain conditions distinguish missing root arrows (`none`) from zero vectors.
- Changing presentations preserves the path class, the operators and the endpoint.
- Raising and lowering are partial inverses and change the endpoint by the specified root; on encodings of a dominant shape they land in encodings whenever they are defined on the realized paths (`exists_toPLPath_eq_of_lower_eq_some`, `exists_toPLPath_eq_of_raise_eq_some`), for any realization whose height forms agree with the simple coroots on the lattice.

**Checks.**

- The SL₂ straight highest-weight-one path has height t; lowering ends at −1 and raising returns endpoint 1.
- At its lower endpoint the next lowering is undefined, since H(1)−min H=−1+1=0<1, rather than a loop at weight −1.
- A central GL₂ path (t,t) has both simple-coroot height and root-string lengths 0; adding a subdivision does not create a root arrow.
- For SL₂ and shape 2, lowering the straight encoding gives the encoding (s₁,1; 0,1/2,1) of endpoint 0, and lowering again gives the reflected straight encoding (s₁; 0,1) of endpoint −2; a stability proof that forgot to merge equal adjacent directions would return the list (s₁,s₁) with a break, which is not an encoding.

*Needs:* S4.1; the roots, coroots and pairing of Mathlib's `RootPairing`; the native operator, string-length and integrality files named in the supplier contract; the native chain lemmas of `Weyl/ReflectedChain.lean`. The cut-time and excursion construction is Littelmann1995 §1; the stability is Littelmann1995, Proposition 4.7, pp. 511–512.

### 4.3 LS chains and interval bonds (S4.3)

The Lakshmibai–Seshadri encodings of shape λ are the native `TauCeti.LSPath P b λ`: decreasing minimal coset representatives τ₀>⋯>τ_s of W/W_λ and rational breaks 0=a₀<a₁<⋯<a_(s+1)=1 with an a_j-chain at each internal break, that is a saturated decreasing Bruhat chain of orbit weights ξ₀=τ_(j−1)λ,…,ξ_l=τ_jλ, ξ_h=s_(β_h)ξ_(h−1), β_h positive, ⟨ξ_(h−1),β_h∨⟩<0 and a_j⟨ξ_(h−1),β_h∨⟩ integral (`TauCeti.IsAChain`, `TauCeti.isAChain_iff_forall_coroot'`). The reflection/order test on the quotient W/W_λ, comparing minimal representatives and not arbitrary W labels for equal weights, the unique positive root label and the positive integral bond b_λ(x,y)=−⟨xλ,β∨⟩=⟨yλ,β∨⟩ of a cover, the bond gcd of a saturated chain with the empty-chain value 0, the chain-independent interval gcd d_λ(u,v) with d_λ(u,u)=0 and d_λ(u,w)=gcd(d_λ(u,v),d_λ(v,w)), the criterion that for a=p/q in lowest terms with q>0 one saturated a-chain from u to v exists iff q divides d_λ(u,v) iff every saturated chain from u to v is an a-chain, finiteness of the encodings of a dominant shape (`TauCeti.LSPath.finite`), the straight and two-direction encodings, the convexity π(t)∈t·Conv(Wλ) of the distinguished representative with the containment in Conv(Wλ) when 0∈Conv(Wλ) (which holds for a finite Weyl group, while a nonzero pure central λ has π(t)=tλ outside {λ} for t<1), and the central transport `TauCeti.LSPath.centralTransport χ : LSPath P b λ ≃ LSPath P b (λ+χ)` with its path formula and its endpoint, height, straight-path, additivity, zero and inverse laws are all native, in the files named in the supplier contract. None of this is constructed again here; incomparable endpoints have no chain and are outside the interval gcd API, and central translation leaves stabilizers and bonds unchanged, so zero and pure central weights and empty root systems give a singleton quotient.

Prove on these carriers what the native files leave open. First, S4.2's operator stability makes `TauCeti.LSPath P b λ`, for dominant λ, an operator-closed set of integral paths; by S4.1's dictionary it is a `TauCeti.NormalCrystal` B(λ) with weight the endpoint, and `TauCeti.LSPath.forall_raise_eq_none_iff` says the straight encoding is its only element killed by all e_i. Prove that B(λ) is connected, that is the operator component of the straight encoding: every encoding is f_(i₁)⋯f_(i_r) of the straight one (Littelmann1995, Corollary 3, p. 512), because an encoding whose first direction τ₀ is not the identity has some ⟨τ₀λ,α_i∨⟩<0, so e_i is defined on it by the native integrality, and at the top of its e_i-string the first direction has become s_iτ₀, which is shorter by the reflection test; induct on the length of τ₀ and then on the number of directions. This is the equivalence of the chain encoding with the generated-path definition. Include λ=0, chamber walls, nontrivial central characters and empty root systems. For a W-fixed character a∈X, B(μ)^a is the native `TauCeti.NormalCrystal.weightTwist` of B(μ) by a, with the same root operators and string data. For W-fixed χ,σ∈X, construct the strict crystal isomorphism T(λ,χ;σ):B(λ)^(σ+χ)→B(λ+χ)^σ from `TauCeti.LSPath.centralTransport χ`: its underlying bijection is independent of σ, it preserves the twisted weights because the transported endpoint moves by χ (`TauCeti.LSPath.endpoint_toPLPath_centralTransport`), and it commutes with the root operators because the transported realized path is the central shift of the original (`TauCeti.LSPath.toPLPath_centralTransport`), which commutes with lowering and raising for forms killing χ (`TauCeti.PLPath.lower_ofSegments_shiftTimed`, `TauCeti.PLPath.raise_ofSegments_shiftTimed`). Prove T(λ,0;σ)=id, the composition law T(λ+χ,ψ;σ)∘T(λ,χ;σ+ψ)=T(λ,χ+ψ;σ) and the inverse formula (T(λ,χ;σ))⁻¹=T(λ+χ,−χ;σ+χ) from the native zero, additivity and inverse laws of the transport, for all central χ,ψ,σ, including λ+χ=0, pure central weights and the empty root system; these offsets make each displayed source, intermediate object and target identical as weighted crystals. The same pointwise formula is not applied to an arbitrary representative of the ambient path quotient. S7 subsequently compares the native bonds with its geometric multiplicities.

- Cover bonds use actual coroot pairings and are invariant under central translation (`TauCeti.reflectionBond_smul_add`).
- On comparable endpoints, interval gcd divisibility is equivalent to the saturated a-chain condition (`TauCeti.exists_isAChain_iff_den_dvd_intervalBondGcd`).
- Concatenations and central transport preserve the distinguished-representative convention, and B(λ) is a connected normal crystal with highest element the straight encoding: the realized path of every encoding of a dominant shape is reached from the realized straight path by finitely many simple lowerings (`reflTransGen_lower_toPLPath_straight`).

**Checks.**

- A rank-one cover at highest weight 2 has bond ⟨2ω,α∨⟩=2; on the one-cover chain a=1/2 is allowed and a=1/3 is not, since 2·(1/2)=1 and 2·(1/3)=2/3.
- For equal endpoints the bond list is empty and its gcd is 0; every positive denominator divides 0, agreeing with the empty chain.
- For nonzero central λ, at t=1/2 the path equals λ/2, which belongs to (1/2)Conv{λ} and not to {λ}; the native unscaled containment needs 0∈Conv(Wλ).
- For SL₂ and shape 2, B(λ) has the three encodings (1; 0,1), (s₁,1; 0,1/2,1) and (s₁; 0,1), of weights 2, 0 and −2, reached from the first by zero, one and two lowerings; a model that admitted the break 1/3 would have five elements and the wrong character.

*Needs:* S4.1–4.2; the native `TauCeti.LSPath`, `TauCeti.LSPath.centralTransport` and `TauCeti.NormalCrystal.weightTwist`; the native bond files `ReflectionBond.lean`, `Weyl/ParabolicQuotient.lean`, `Weyl/CoverBond.lean`, `Weyl/ChainBond.lean` and `Weyl/IntervalBondGcd.lean`; the native quotient Bruhat order `CoxeterSystem.MinimalCosetRepCovBy`, `CoxeterSystem.MinimalCosetRepChain` and `CoxeterSystem.exists_minimalCosetRepChain`; the coroots of Mathlib's `RootPairing`. CFL Definition 2.1 and §7.1 give the bond condition; the connectedness is Littelmann1995, Corollary 3, p. 512.

### 4.4 Characters and tensor components (S4.4)

Construct the generic finite-type character/component theorem on the native carriers, not just its type A specialization. Positive-integer stretching is the native `TauCeti.LSPath.stretch` with the dilation law `TauCeti.LSPath.toPLPath_stretch` and the uniform integral subdivision `TauCeti.LSPath.exists_uniform_subdivision`; the ambient tensor rule for a concatenation is the native `TauCeti.PLPath.lower_mul` and `TauCeti.PLPath.raise_mul` (Kashiwara's tie convention: on the concatenation p*q, lowering acts on p when ε(q)<φ(p) and on q when φ(p)≤ε(q)), and the tensor product of crystals is `TauCeti.NormalCrystal.tensor`. Prove the root-operator word-distance bound and the linked-path subdivision/gluing lemmas required to compare an arbitrary dominant rational PL path of endpoint λ with the straight component, and the isomorphism theorem: the operator component of a path π with π(t) dominant for all t and π(1)=λ is strictly isomorphic to B(λ) (Littelmann1995, Theorem 7.1, p. 518, through Theorem 6.3, p. 517). Prove that the concatenation B(λ)*B(μ) is the native tensor crystal B(λ)⊗B(μ), with the factors in the order of the concatenation, and the tensor-component theorem: it is the direct sum of the components B(λ+η(1)) over the encodings η∈B(μ) with λ+η(t) dominant for all t, the component of η being the one of the concatenation of the straight path of shape λ with η (Littelmann1995, §10, p. 521). Its character form is Littelmann's decomposition formula (Littelmann1995, Introduction, p. 500; proof in §10, p. 521): for dominant λ and μ, char B(λ)·char B(μ)=Σ_η char B(λ+η(1)), the sum over the η∈B(μ) with min_t⟨η(t),α_i∨⟩≥−⟨λ,α_i∨⟩ for every simple root α_i, which is the condition that λ+η(t) be dominant for all t. Stated on the realized endpoints of the encodings, in the group ring of V for an injective realization f whose height forms agree with the simple coroots on the lattice, it needs no crystal structure and is `finsum_mul_finsum_eq_finsum_finsum_of_minHeight`; the crystal decomposition refines it. Derive the formal characters in the group ring ℤ[X] of the actual character lattice: the formal character `TauCeti.NormalCrystal.formalCharacter` of B(λ) satisfies Δ·char B(λ)=J(eλ), where Δ=∏_(α>0)(1−e^(−α)) is `TauCeti.weylDenominator` and J is the dot alternatization `RootPairing.dotAlternatization`, J(eλ)=Σ_(w∈W) sgn(w)e^(w(λ+ρ)−ρ), whose exponents wλ−(ρ−wρ) lie in X because ρ−wρ is a sum of positive roots; stated on the lattice weights of the encodings, that is on wt π∈X with f(wt π)=π(1) for an injective realization f, this identity needs no crystal structure and is `weylDenominator_mul_finsum_single_eq_dotAlternatization`, and it is the identity for `TauCeti.NormalCrystal.formalCharacter` once B(λ) carries its crystal structure. Since ℤ[X] is a domain and Δ≠0, the native longest-element formula of S3.4 then gives char B(λ)=D_(w₀)(eλ). Littelmann's form Σ_(w∈W) sgn(w)e^(wρ)·char B(λ)=Σ_(w∈W) sgn(w)e^(w(λ+ρ)) (Littelmann1995, Theorem 9.1, p. 520, with ρ fixed in his weight lattice at line 811) is this identity multiplied by e^ρ; it holds in ℤ[X+ℤρ] and is not an identity of ℤ[X] when ρ∉X, as for PGL₂. Compare the character with the rational representation supplier: char B(λ)=D_(w₀)(eλ) is the formal character of ∇(λ) (S3.4), and in characteristic 0, where Δ(λ)=∇(λ)=L(λ) (ReductiveGroups Layer 10 §10B), that of the simple rational module. On the Lie-algebra side, let 𝔤 be a semisimple Lie algebra over an algebraically closed field of characteristic 0, with Cartan subalgebra H and an injective map X→H* carrying the roots, coroots and base of the root datum to those of the root system of H; it carries J(eλ) to the Weyl numerator N(λ) and Δ to `TauCeti.weylDenominator`. The image of Δ·char B(λ)=J(eλ) and the native `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` then give Δ·char B(λ)=Δ·char L(λ), so char B(λ)=char L(λ), because the group ring of the torsion-free group H* has no zero divisors and Δ≠0; with the decomposition formula and the native Racah–Speiser formula `TauCeti.tensorMultiplicity_eq_sum_weylSign_mul_formalCharacter_coeff`, the multiplicity of L(ν) in L(λ)⊗L(μ) is the number of η∈B(μ) with λ+η(t) dominant for all t and λ+η(1)=ν. In characteristic p compare the formal Weyl/induced characters, which need not be the simple L(λ) characters; a crystal graph indexes weights and partial root operators, without asserting that actual Lie generators are single-target on a weight basis. The adjoint SL₃ example distinguishes simple generators from all root operators.

   **Checks for the character formula.**

   - For PGL₂, with X=ℤα and λ=α, B(α) has the three encodings of weights
     α, 0, −α, so char B(α)=e^α+1+e^(−α), and Δ=1−e^(−α). Then
     Δ·char B(α)=e^α−e^(−2α), and J(e^α)=e^α−e^(−2α), the reflection term
     being −e^(s(α+ρ)−ρ)=−e^(−α−2ρ)=−e^(−2α); every exponent lies in ℤα.
     Littelmann's form would need e^(±α/2), which is not in ℤ[ℤα].
   - For SL₂, with X=ℤω, α=2ω and λ=ω, char B(ω)=e^ω+e^(−ω) and
     Δ·char B(ω)=e^ω−e^(−3ω)=J(e^ω); here ρ=ω lies in X and multiplying by
     e^ω gives Littelmann's (e^ω−e^(−ω))(e^ω+e^(−ω))=e^(2ω)−e^(−2ω).
   - For λ=0, B(0) is a single element of weight 0 and J(1)=Δ, so
     char B(0)=1. For a nonempty root system the unshifted alternant
     Σ_(w∈W) sgn(w)e^(wλ) is 0 at λ=0 and would give char B(0)=0; for PGL₂ at λ=α it gives e^α−e^(−α), not
     e^α−e^(−2α).

   **Checks for the decomposition formula.**

   - For SL₂ and λ=μ=ω, the encodings t↦tω and t↦−tω of B(ω) have
     minimal heights 0 and −1, and both meet the bound −⟨ω,α∨⟩=−1. The
     right side is char B(2ω)+char B(0)=e^(2ω)+2+e^(−2ω)=(e^ω+e^(−ω))².
   - For SL₂, λ=ω and μ=2ω, the three encodings of B(2ω) have minimal
     heights 0, −1 and −2; the straight path t↦−2tω fails the bound −1. The
     right side is char B(3ω)+char B(ω)=e^(3ω)+2e^ω+2e^(−ω)+e^(−3ω), the
     product (e^ω+e^(−ω))(e^(2ω)+1+e^(−2ω)).
   - For PGL₂ and λ=μ=α, all three encodings of B(α) meet the bound −2, and
     char B(2α)+char B(α)+char B(0)=e^(2α)+2e^α+3+2e^(−α)+e^(−2α)=(e^α+1+e^(−α))².
   - For SL₂, λ=0 and μ=2ω, only the straight encoding stays dominant, so the
     right side is char B(2ω)=char B(0)·char B(2ω). A rule that tested only
     the endpoint λ+η(1) would also admit the encoding (s₁,1;0,1/2,1), whose
     endpoint 0 is dominant but whose minimal height is −1, and would add a
     spurious char B(0).

   **Checks for the adjoint comparison.** Work in characteristic zero and
   use the six matrix units E_ab, a≠b, with H₁=E₁₁−E₂₂ and
   H₂=E₂₂−E₃₃. The bracket formula
   [E_ab,E_cd]=δ_bc E_ad−δ_da E_cb gives the following controls.

   - The simple pair gives [E₁₂,E₂₁]=H₁, whereas the nonsimple pair
     gives [E₁₃,E₃₁]=H₁+H₂. The second image is not a multiple of H₁ or H₂.
   - Each of the four simple generators E₁₂,E₂₃,E₂₁,E₃₂ sends every
     member of this eight-element basis to zero or a multiple of one member:
     for example [E₁₂,H₁]=−2E₁₂ and [E₁₂,H₂]=E₁₂. Thus this adjoint
     example is not an obstruction to single-target simple-generator actions.
   - Requiring all root actions forces the three Cartan lines kH₁, kH₂,
     k(H₁+H₂). Their coordinate determinants in the basis (H₁,H₂) are
     1,1,−1; a two-dimensional weight space cannot contain three basis lines.
     The one-dimensional root spaces force these lines for any weight basis.
   - On the path side θ=α₁+α₂ is ρ for SL₃, so W_θ is trivial and B(θ) has
     the six straight encodings, of weights wθ, and the two encodings
     (s₁s₂,s₂;0,1/2,1) and (s₂s₁,s₁;0,1/2,1), whose covers s₁s₂→s₂ and
     s₂s₁→s₁ have bond 2 and whose endpoints are (−α₁+α₁)/2=0 and
     (−α₂+α₂)/2=0: eight encodings, exactly two of weight 0, the dimension
     of the Cartan weight space. They are f₁ of the straight encoding of
     weight s₂θ=α₁ and f₂ of the one of weight s₁θ=α₂, matching
     [E₂₁,E₁₂]=−H₁ and [E₃₂,E₂₃]=−H₂ for the simple generators; the three
     Cartan lines that single-target actions of all root operators would
     need are not indexed by these two encodings.

   *Needs:* Mathlib's `RootDatum` for the finite root datum; ReductiveGroups' rational
   representations and their formal characters; S4.1–3's crystal B(λ); the
   native `TauCeti.LSPath.stretch`, `TauCeti.PLPath.lower_mul`,
   `TauCeti.PLPath.minHeight`, `TauCeti.NormalCrystal.tensor` and
   `TauCeti.NormalCrystal.formalCharacter`;
   S3.4's native longest-element formula with `TauCeti.weylDenominator` and
   `RootPairing.dotAlternatization`; ReductiveGroups Layer 10 §10B for
   Δ(λ)=∇(λ)=L(λ) in characteristic 0; the native
   `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator` and
   `TauCeti.tensorMultiplicity_eq_sum_weylSign_mul_formalCharacter_coeff` for
   the Lie-algebra comparison;
   Mathlib matrix multiplication for the displayed bracket calculation.
   The character/component route is Littelmann1995, Theorems 6.3, 7.1 and 9.1,
   pp. 517–520, and §10, p. 521, with Theorem 9.1 multiplied by e^(−ρ) to land in
   ℤ[X]; the decomposition formula is stated in its Introduction, p. 500
   (Littelmann1995 lines 89–94), and deduced from Theorem 9.1 in §10; the matrix
   controls are direct deductions from the bracket formula.


### 4.5 Chain simplices (S4.5)

Construct fixed-chain simplices and their face identifications after equal adjacent directions are merged. The finite LS set is the subset of the simplex points whose breaks satisfy the native a-chain conditions `TauCeti.IsAChain`, that is the encodings `TauCeti.LSPath` with the given direction chain; it is not the whole continuum of a simplex. Give the six-vertex S₃ Bruhat-chain complex and its four maximal tetrahedra, distinguishing this realization from the fixed-λ finite path set. The type-A root-datum specialization is S9.5, after the generic construction. No concrete tableau theorem is a premise of this generic component theorem.

- Removing a repeated direction gives the same face point.
- Common faces glue through their identical direction and duration data.
- The finite LS subset is selected by the integral break conditions, not by all real points of the simplex.

**Checks.**

- A one-vertex chain gives a point, not an interval.
- For the S₃ Bruhat poset there are six vertices and four maximal saturated chains from e to w₀, hence four maximal tetrahedra.
- For a rank-one bond 2, the only internal LS break is 1/2; the simplex also contains 1/3, which fails the integral break test, 3 not dividing 2.

*Needs:* S4.3 and the native `TauCeti.LSPath`, `CoxeterSystem.BruhatLE` and `CoxeterSystem.MinimalCosetRepChain`. The simplex realization is the barycentric-duration construction on these chains.

### 4.6 Geometric path sections (S4.6)

After S5 and the divisor calculation S7.1–2, construct geometric path sections in all tensor degrees and their defining-chain API. Use the Schubert poset, extremal sections and the actual codimension-one valuations with Chevalley bonds to build the chain-indexed LS lattice/filtration. Prove the normalized leaves are one-dimensional and identify their indices and character count with S4.1–5. Construct sections lifting those leaves and prove triangular spanning/independence, reduced-word compatibility, weight and restriction support. This is the geometric finite-flag filtration application, not an assumed generic quantum Frobenius/canonical-basis theorem. If a distribution/contraction model is also used for a comparison, prove its exact integral/denominator and specialization maps separately; it is not needed as an unstated premise of this geometric construction.

- Filtration indices retain the extremal weight and the common defining chain.
- Multiplication adds tensor degrees and respects the filtration.
- Restriction retains precisely the indices supported on the indicated Schubert family.

**Checks.**

- For SL₂ with L(1), degree 0 has basis 1 and degree 1 has two sections.
- Degree 2 has three monomials x²,xy,y², rather than the four elements of an ordered tensor-square basis.
- Restricting these degree-two sections to [1:0] keeps x² and kills xy,y², with image dimension 1.

*Needs:* S4.1–4.5; S5.5–5.6; S7.1–7.2. LLM Theorems 4 and 6, pp. 299 and 301 supply the standard-monomial and geometric comparison, with the conventions of S4.7.

### 4.7 Opposition and section weights (S4.7)

Print the opposition/dual dictionary. Set κ=−w₀λ and θ(w)=w₀ww₀. Conjugating G/B− to G/B+ by the chosen longest representative sends X(w) to the positive-Borel X(θ(w)) and pulls the positive-Borel line with fibre−κ back to L(λ), with the actual linearization comparison. In the positive-Borel convention, LS path sections indexed by π∈B(κ) have weight−π(1) and survive on X(θ(w)) exactly when their initial direction is≤θ(w). Transporting gives weight−w₀π(1) on the chosen X(w). For partial flags use the actual minimal-coset projection W/W_P→W/W_λ before making this comparison; do not compare indices in different stabilizer quotients as though they were equal. Prove the terminal-direction formulation from the initial-direction condition of LLM §3.1, Proposition 14, p. 312 (LLM line 809: the LS chains whose initial direction is at most w index a basis of the Demazure module V_λ(w), recalling Littelmann's Demazure basis), realized as sections through the dual embedding of LLM §4.1, pp. 314–315 (line 946), by explicit opposition/reversal, rather than equating the two untransported symbols w. The point and longest-word tests must recover the single fibre λ and the full ∇λ.

- The index test is computed in W/W_κ: a section indexed by π∈B(κ) survives on X(w) exactly when the initial direction τ₀ of π, a minimal representative of W/W_κ, is at most the minimal representative of the coset θ(w)W_κ in the Bruhat order of W/W_κ; this is the condition τ₀≤θ(w) in W, because the projection of W onto minimal representatives is order preserving.
- The surviving section indexed by π has weight −w₀π(1) on X(w), where π(1) is the endpoint of the realized path (`TauCeti.PLPath.endpoint` of `TauCeti.LSPath.toPLPath`); on X(w₀) these weights, with multiplicity, are the weights of ∇(λ).
- For λ descending to G/P−, W_P⊆W_λ and θ(W_P)⊆W_κ, so the test uses the image of θ(w) in W/W_κ, the same for every representative of the coset wW_P; the dictionary commutes with the minimal-coset projections W/W_P→W/W_λ and W/W_θ(P)→W/W_κ, and never compares an index of W/W_P with one of W/W_κ directly.

**Checks.**

- For w=e, θ(e)=e, and the only encoding of B(κ) with initial direction ≤e is the straight one, whose single direction is e; its section has weight −w₀κ=λ, the fibre character of L(λ) at the point X(e) of S3.2. A dictionary that dropped the sign would assign the fibre the weight w₀κ=−λ, one that dropped the w₀ the weight −κ=w₀λ, and one that dropped both the weight κ; for GL₃ and λ=e₁, where κ=−e₃, these are −e₁, e₃ and −e₃, none of them e₁.
- For w=w₀, θ(w₀)=w₀ and every encoding survives; the weights −w₀π(1) over π∈B(κ) are −w₀ applied to the weights of V(κ)=V(λ)*, that is the weights of ∇(λ) with their multiplicities, as S3.4's character formula requires. For GL₃ and λ=ω₁=e₁ they are e₁, e₂, e₃.
- For GL₃, λ=ω₁=e₁ and w=s₂: κ=−w₀e₁=−e₃ (the central lattice is kept, so κ is ω₂ twisted by det⁻¹, not ω₂), θ(s₂)=w₀s₂w₀=s₁ and W_κ=⟨s₁⟩, so the three encodings of B(κ) are straight, with directions the minimal representatives e, s₂, s₁s₂ of W/W_κ and endpoints −e₃, −e₂, −e₁. The coset s₁W_κ has minimal representative e, so only the straight encoding survives: one section, of weight −w₀(−e₃)=e₁, as the S3.2 Check computes, since L(ω₁) has degree ⟨ω₁,α₂∨⟩=0 on the curve X(s₂). Comparing with the untransported index s₂ would admit the directions e and s₂ and give two sections, which is wrong; comparing θ(s₂)=s₁ in W/W_λ=W/⟨s₂⟩ instead of W/W_κ would use the wrong stabilizer quotient.

*Needs:* S4.6; S1.0's inversion and ReductiveGroups opposition/contravariant duality; S3.1–3.2's fibre character and ordinary-dual comparison.

### Examples

For λ=0 the LS component is a singleton with weight 0. A pure central λ has π(t)=tλ: at t=1/2 it lies in (1/2)Conv{λ}, but not in {λ} when λ≠0. In the adjoint example, the simple bracket [E₁₂,E₂₁]=H₁ is single-target, but [E₁₃,E₃₁]=H₁+H₂ is not single-target in the displayed basis.

### Dependencies

Mathlib `RootDatum` and the native Coxeter, Bruhat, numbered root-datum, Demazure, crystal, Lakshmibai–Seshadri path and bond declarations of the supplier contracts; ReductiveGroups rational representations. The path proof route is Littelmann1995, §1, Proposition 4.7 and Corollaries 2–3, Theorems 6.3, 7.1 and 9.1, and §10. S4.6–7 additionally use S5 and S7.1–2.

## Layer 5: Splitting, normality, restriction and cohomology (S5)


### 5.1 Frobenius modules and trace (S5.1)

In characteristic p>0 construct the actual Frobenius module F_*O and O-linear Cartier trace on smooth root-coordinate charts. Identify Hom_O(F_*O,O) with F_*(ω^(1−p)) using the specified duality/pullback convention. On affine coordinates the normalized trace selects exponents congruent to p−1 modulo p; it is p^−1-linear over a perfect field and sends the chosen normalized anticanonical section to 1. Prove independence under changes of root charts and line trivializations. Construct the section from the algebraic Steinberg module and its normalized extremal pairing before using geometric vanishing or standard monomial theory.

The Frobenius module has scalar action a·F_*b=F_*(a^p b). On a polynomial chart with volume form dx₁∧⋯∧dx_n, the raw trace sends x^a to zero unless each a_i≡p−1 modulo p, and then to x^((a−(p−1))/p), taking the pth root of its coefficient. The splitting defined by a local section s is f↦Tr(sf); it is normalized by Tr(s)=1.

- The trace is O-linear for this Frobenius scalar action.
- Volume-form changes transform s as a section of ω^(1−p).
- The normalized splitting retracts O→F_*O and glues by those transitions.

**Checks.**

- In characteristic 2 on k[x], Tr(1)=0, Tr(x)=1 and Tr(x³)=x.
- With s=x, σ(F_*1)=1 and σ(F_*(x²))=x; demanding ordinary k[x]-linearity on the underlying polynomial ring would instead give x².
- For n=0 over a perfect field, Tr(c)=c^(1/p); in particular Tr(1)=1. The zero map fails normalization.

*Needs:* S1's smooth root charts; SchemeAndStackFoundations coherent duality; ReductiveGroups' independent Steinberg representation and extremal pairing. The splitting formalism, the duality Hom(F_*O,O)≅F_*(ω^(1−p)) and the exponent p−1 criterion are Ramanathan1987 Definition 1.1, p. 65, §1.16 and Lemmas 1.18–1.19, pp. 70–71.

### 5.2 Compatible ideals (S5.2)

Prove the resulting splitting is compatible with every standard and opposite Schubert ideal by actual B-canonical/rank-one root-subgroup calculations and word induction. For an ideal I the required statement is σ(F_*I)⊂I, not just reducedness of its zero set. Prove closure under finite sums/intersections of compatible ideals, then conclude scheme-theoretic intersections and reduced unions in this family are reduced in positive characteristic. S5.6 constructs their characteristic-zero mixed-family comparison. The rank-one, point, empty and whole-flag ideals are explicit tests. Do not infer arbitrary Richardson transversality from this reducedness statement.

- Compatibility means preservation of the ideal as a subsheaf of F_*O.
- Finite sums and intersections of compatible ideals remain compatible.
- The induced quotient splitting forces a compatible closed subscheme to be reduced.

**Checks.**

- For σ(f)=Tr(xf) in characteristic 2, the ideals 0, (x) and (1) are preserved.
- The ideal (x²) is not preserved: σ(x²)=x lies outside (x²); its nonreduced quotient cannot be split.
- On ℙ¹ the standard and opposite closed points form {0,∞}; its structure ring is k×k, of dimension 2, not k.

*Needs:* S5.1; S2's rank-one induction; ideal-sheaf sums and intersections from SchemeAndStackFoundations Layer 1. Compatible splitting is Ramanathan1987 Definition 1.1(b–c), p. 65 and Proposition 1.4, p. 66; the simultaneous compatible splitting of all Schubert varieties through the word resolution of w₀ is its Theorem 3.5(i), pp. 82–83.

### 5.3 Central-isogeny descent (S5.3)

Carry out the construction on the derived simply connected cover, where ρ and the Steinberg weight exist in the actual character lattice. Prove the induced map of flags is an fpqc quotient isomorphism and transport the splitting/ideal identities, even when the central kernel is nonreduced. No étale-cover or differential-isomorphism assumption is substituted for that quotient argument. Keep actual line linearizations when passing between isogeny types.

*Needs:* ReductiveGroups central isogenies and fpqc quotients; S5.1–5.2. For SL₂→PGL₂ in characteristic 2 the central kernel is μ₂ with ring k[u]/((u−1)²), so the flag comparison must not use an étale-kernel argument. Ramanathan1987 §3.4, p. 82 states the splitting on the simply connected group; the descent to other isogeny types is a target here.

### 5.4 Normality and structure-sheaf pushforward (S5.4)

Prove normality of each Schubert variety. Construct geometrically connected fibres of the reduced-word map by the actual rank-one gallery/partial-flag induction, with the closed fibre pieces and their intersections; do not infer connectedness merely from a fixed-point count. Apply proper Stein factorization and finite normalization to prove geometric unibranchness. In characteristic p prove the needed weak-normality consequence of Frobenius purity: principal ideals are Frobenius closed, and a finite universal-homeomorphic normalization in the total fraction ring must equal the original ring. Combine this with the constructed unibranchness; splitting alone is not a normality theorem. S5.6 constructs the corresponding characteristic-zero/integral comparison from the actual identified integral fibres, before using the characteristic-zero conclusions of this paragraph. Once X(w) is normal, prove π_*O_Z=O_X(w) by the actual proper birational/Stein comparison. Reduced unions need not be normal; retain their actual ideal exact sequences.

*Needs:* S2 reduced-word maps; S5.1–5.2; SchemeAndStackFoundations normalization and Stein factorization; S5.6 for characteristic-zero comparison. BrionFlags Theorems 2.1.1 and 2.2.3 give the complex case, not a positive-characteristic proof.

### 5.5 Dominant vanishing and restrictions (S5.5)

In positive characteristic, for dominant λ first prove H^q(Z,π*Lλ)=0 for q>0 by the actual rank-one/word splitting calculation: construct a stable splitting along a boundary-supported ample divisor, prove the required iterated splitting and tensor/pushforward maps, and combine it with nefness and Serre vanishing. Construct the ample combination with positive coefficients on every word-boundary component from the iterated projective bundles; compatibility with the reduced boundary alone is not sufficient. Deduce R^qπ_*O_Z=0 for q>0 by twisting with all sufficiently high powers of an ample line on X(w), using projection formula, coherent Leray and Serre to detect the vanishing direct-image sheaves. This deduction does not use the same direct-image theorem as its premise. Then prove H^q(X(w),Lλ)=0, restriction surjectivity from the full flag, and the same statements for finite reduced unions of Schubert varieties for one fixed Borel (or for their common opposite-Borel transforms). Compare H⁰ on X(w) and Z using the already proved π_*O statement. For ample λ use Frobenius iteration and Serre vanishing with the actual ideal sequence. For merely nef/dominant λ, including 0, prove the needed parabolic projection/fibre O-cohomology and pullback comparison; ampleness is not silently assumed. Include empty unions, H⁰(point,L)=its fibre and H⁰(O_Y)=k for a nonempty common-Borel Schubert union Y. Mixed standard/opposite compatible unions retain S5.2's ideal and reducedness conclusions, but their section comparison uses the actual ideal/cohomology exact sequence and proved vanishing hypotheses. It does not assert dominant restriction surjectivity or a common-Borel path basis for every mixed union: in P¹, Y={0,∞} and λ=0 give H⁰(O_Y)=k² and the diagonal restriction k→k², with H¹(I_Y)=k.

*Needs:* S5.1–5.4; S2's iterated projective bundles; SchemeAndStackFoundations §2.2 and §2.6 coherent pushforward, Serre vanishing and projective cohomology. LLM Theorem 6, p. 301 supplies the word vanishing comparison, and Ramanathan1987 Theorem 3.7, p. 84 the Schubert vanishing and restriction surjectivity; the mixed-union counterexample retains the separate ideal exact sequence.

### 5.6 Integral coherent comparisons (S5.6)

Construct the integral Schubert closure and base-change comparison here. Start with S1.0’s smooth projective integral full flag F/ℤ and each smooth iterated-P¹ word model Z/ℤ of S2, their multiplication map π:Z→F and the open root-cell isomorphism; the schematic Schubert closure is not yet assumed to commute with base change. Choose λ in the actual character lattice strictly positive off the chosen parabolic, so Lλ is ample on that flag, and set A_m=H⁰(Z,π*Lλ^(⊗m)), m≥0. First prove the characteristic-p vanishing of these actual nef pullback bundles for every m≥0 by S5.5's stable ample-divisor splitting construction, not by splitting alone. Do the same on F. Construct derived cohomology/base-change on these smooth proper integral sources using their flat bundles, actual coherent complexes and the finite affine Čech comparison. Prove the complexes are perfect over ℤ; the positive-characteristic fibre vanishing and constant Euler ranks then give finite-free H⁰, no higher cohomology, and the required arbitrary-ring base-change maps. This step uses neither flatness nor fibre identification of a putative Schubert closure.

   Construct every restriction map H⁰(F,Lλ^(⊗m))→A_m, including m=0. Their reductions at each prime are surjective by the independently proved characteristic-p Schubert restriction and word direct-image comparisons. The cokernel is a finite ℤ-module; its reduction at every prime is zero, so it is zero. Prove this argument with the actual H⁰ base-change identifications. The resulting graded algebra map is surjective in every degree. Prove finite generation of A via its finite coherent module over the ample section algebra on F, construct Proj A and its closed immersion into F, and compare the morphism from Z given by the pulled-back ample line. Identify its scheme-theoretic image with the schematic root-cell closure using the open-cell isomorphism and the actual homogeneous kernel, not just an equality of geometric point sets. Prove A is normal from the normal integral Z and its invertible sheaf, using the intersection-of-local-valuation or total-line-space argument; hence its Proj is normal. This establishes the characteristic-zero normality needed in S5.4, as well as the integral fibre/section comparison. Treat partial flags with an actual ample character of their lattice and the specified projection, not an assumed fundamental weight outside that lattice.

   For the mixed standard/opposite comparison, construct its additional homological inputs on these same Schubert and opposite Schubert loci. The word boundary has affine-space complement; prove the stable ample-boundary splitting plus strong F-regularity of that regular affine complement gives global F-regularity. Push the actual Frobenius retractions through the proper word map with π_*O=O to obtain global F-regularity of field Schubert images, and prove their Cohen–Macaulay consequence at the stated F-finite/perfect-field hypotheses. Use the identified flat integral models and the precise openness/spreading comparison to obtain the characteristic-zero Cohen–Macaulay statement. Prove proper standard/opposite intersection and Tor independence in the smooth flag by the actual root-cell dimension and Cohen–Macaulay intersection calculation; construct the corresponding flat integral Richardson model and its fibre ideals before spreading reducedness to characteristic 0. Finite compatible mixed unions/intersections require their actual ideal-lattice and exact-sequence/base-change induction. Neither flatness of an intersection nor base change of an arbitrary ideal intersection is assumed for free. These constructions give reducedness/ideal comparisons, not the false all-dominant mixed-union section-surjectivity theorem.

   Export the resulting finite-free section/restriction modules and their arbitrary-base-change maps on these integral Schubert schemes. For common-Borel unions use their actual ideal/section exact sequences and the field restriction/vanishing theorem to construct and compare the integral union; do not normalize a reducible union or infer fibrewise reducedness from saturation alone. Establish the characteristic-zero and arbitrary-field versions of S5.4–5.5 on the identified schemes; descend geometric conclusions from perfect algebraic closures by their actual faithfully flat comparison. Transport these coherent comparisons to relative split Schubert bundles by pullback and to twisted forms by descent for specified torsors preserving the Schubert family and its line linearizations. Prove their fibre and cohomology comparisons using the base-change maps just constructed; the smooth-source H⁰ argument uses the independent splitting calculation.

- Pullback identifies the section modules and their restriction maps degree by degree.
- Their finite-free integral models have the same ranks on every field fibre.
- Descent preserves the specified line linearizations and coherent exchange maps.

**Checks.**

- On ℙ¹/ℤ, degrees 0,1,2 give free modules of ranks 1,2,3, unchanged over 𝔽₂ and 𝔽₃.
- For the empty Schubert union, each section module is zero, including degree 0.
- A rank-one open chart over ℤ[ε]/(ε²) retains ε≠0; fibrewise reducedness is not reducedness of the total space.

*Needs:* S1.0 and S2; S5.4–5.5 in positive characteristic; SchemeAndStackFoundations perfect coherent complexes, projection formula and base change; StableReduction Layer 2 relative Proj. The passage from characteristic p to characteristic 0 through flat models, free section modules over ℤ_(p) and semicontinuity is the argument of Ramanathan1987, proof of Theorem 3.11, p. 86 (Ramanathan1987 lines 960–974), for surjectivity of Schubert restriction and degree-one generation; the smooth-source cohomology argument above carries it out over ℤ. Cohen–Macaulayness of Schubert varieties, and their arithmetic Cohen–Macaulayness in every ample projective embedding, in every characteristic, is Ramanathan1987 Theorem 4.2(i)–(ii), p. 88 (lines 1042–1045). Global F-regularity of Bott–Samelson varieties from a splitting compatible with the boundary and an ample boundary combination, its descent along a map with π_*O=O, and global F-regularity of Schubert varieties in G/P are LRPT2006, Proposition 2.1, pp. 4–5, Lemma 1.2, p. 3, and Theorem 2.2, p. 5 (LRPT2006 lines 165–178, 115–118 and 190–204), over an algebraically closed field of positive characteristic for simply connected semisimple G. Proper intersection of standard and opposite Schubert varieties, and irreducibility of their nonempty intersections, are BrionFlags §1.3, p. 12, and Proposition 1.3.2 (BrionFlags lines 469–477), over ℂ in type A; S5.6 proves them at the stated generality by the root-cell dimension and Cohen–Macaulay intersection calculation.

### 5.7 All-word derived comparison (S5.7)

Construct the all-word coherent comparison with the actual image
   X(δ(Q)) from S2, including nonreduced Q. Use the reduced-word instances
   of S5.4–5.6 first; no assertion that π_Q is birational is made. Prove
   O_X→Rπ_Q*O_Z is a quasi-isomorphism, with its actual unit, equivariance,
   field-change and restriction comparisons. Give the rank-one induction:
   for w=δ(Q), factor the next crank through
   Y=X(w)×_(G/P_i−)G/B−. The map Z_(Qi)→Y is the flat base change of
   π_Q along the P¹-bundle Y→X(w), so proper flat base change transports
   its already proved O-direct-image comparison. If ws_i<w, the image
   X(w) is saturated for the rank-one projection; the other map Y→X(w)
   is a P¹-bundle. Construct its unit and higher-O-vanishing by the rank-one
   projective-bundle calculation and descent. If ws_i>w, compare Y with
   the reduced word for w followed by i. Its proper reduced-word resolution
   of X(ws_i) has the S5.4–5.6 direct-image comparison, while its map to Y
   has the same flat-base-change comparison. The derived composition and
   Leray maps then give the comparison for Y→X(ws_i). Prove these factor
   and base-change squares on the actual flag/word schemes, rather than
   treating the gallery as an abstract equality of point sets.

   Apply projection formula to any specified line bundle L on the flag
   to construct RΓ(X(δ(Q)),L)≃RΓ(Z_Q,π_Q*L), naturally and equivariantly.
   For dominant λ, S5.5–5.6 supply the corresponding higher-cohomology
   vanishing on the image and hence on the word model. This constructs the
   actual H⁰ restriction/pullback isomorphism as well as its higher-degree
   comparison; equality of dimensions or of Euler characters is insufficient.
   The empty word and Q=(i,i) are explicit tests. Compare the specified
   torus-linearized bundle and section action through this same
   isomorphism, so that the torus characters of the two sides agree; no
   fixed-point trace is a premise of this algebraic comparison.

- The derived comparison uses the unit O→Rπ_*O and its composition law.
- Projection formula transports it to every specified invertible sheaf, without a dominance hypothesis.
- Dominance is used only for vanishing, not for the comparison isomorphism.

**Checks.**

- For Q empty, π is the identity of a point, with H⁰=k and higher groups zero.
- For Q=ii, the image is ℙ¹ and π has ℙ¹ fibres; H⁰(O_fibre)=k and H¹(O_fibre)=0 despite dimension 2 of the source.
- For L=O(−2) on this image, H⁰=0 and H¹=k on both sides; replacing derived comparison by dominant vanishing would lose H¹.

*Needs:* S2.3's all-word image; S5.4–5.6; proper flat base change, projection formula and derived composition from SchemeAndStackFoundations Layer 2. The rank-one induction above is a deduction from these inputs.

### Examples

For Y={0,∞} in ℙ¹, H⁰(O_Y)=k² and restriction of constants is the diagonal k→k², so mixed-union surjectivity fails. For ℙ¹ over ℤ and m=0,1,2, H⁰(O(m)) has ranks 1,2,3, unchanged after reduction modulo 2 or 3.

### Dependencies

S1–S3; coherent cohomology, duality, Serre vanishing and Stein factorization from SchemeAndStackFoundations; the independent algebraic Steinberg representation; the integral-model contract specified in S5.6.

## Layer 6: Coordinate rings and all-degree standard monomials (S6)


### 6.1 Section and coordinate algebras (S6.1)

Construct the natural graded map from the homogeneous coordinate algebra of a chosen Plücker/highest-line embedding to ⊕_(m≥0)H⁰(X,L^(⊗m)), with actual multiplication and restriction maps. Keep degree 0, reduced unions and all m≥0. Establish its kernel, saturation, surjectivity in every degree and the section/Proj comparison; a projective embedding alone does not identify these two graded rings. For non-ample dominant λ compare with the contracted partial flag image instead of falsely asserting an embedding of the full flag.

- The comparison preserves degree, the unit and multiplication of actual sections.
- Its kernel is the homogeneous ideal of the stated embedding.
- Restriction to a Schubert subscheme commutes with this graded map.

**Checks.**

- For ℙ¹ with O(1), degrees 0,1,2 have dimensions 1,2,3 on both sides.
- For ℙ¹ with O(2), degree 1 has three sections, not two; the grading remembers the polarization.
- With L=O on ℙ¹ the section algebra has dimension 1 in every degree and Proj a point; it cannot recover the full flag as an embedded scheme.

*Needs:* S3.5; S5.5–5.6; StableReduction Layer 2 relative Proj; SchemeAndStackFoundations coherent section multiplication. For a Schubert variety X in G/Q and a line bundle on G/Q with nonzero sections, surjectivity of the symmetric algebra of H⁰(X,L) onto the section ring in every degree, with kernel generated in degree two, and surjectivity of restriction to a smaller Schubert variety are Ramanathan1987 Theorem 3.11(i)–(ii), p. 86 (Ramanathan1987 lines 950–959), over an algebraically closed field of any characteristic.

### 6.2 Determinant sections in type A (S6.2)

For type A Grassmannians and flags consume GroebnerGeometry G5's polynomial maximal-minor/flag-minor straightening bases, certified orders and initial algebra. The coordinate minors of a frame over a commutative ring are the native `TauCeti.plucker`, with the change-of-frame law `TauCeti.plucker_sum_smul`. Identify every coordinate minor with the actual determinant universal section and its dual T-weight. Prove the complete homogeneous ideal and geometric Schubert restriction ideal, standard-on-X(w) basis and Schubert-union support criterion. The scheme ideal, section restriction and multigrading are part of this comparison; algebraic pointwise vanishing over a field is not the full relative scheme proof.

*Needs:* GroebnerGeometry G5 polynomial straightening and initial algebra; the native `TauCeti.plucker`; S1.1 and S6.1 for the universal determinant sections and scheme comparison. The standard monomial basis of the Plücker coordinate ring of the Grassmannian, with straightening relations expressing each nonstandard monomial in standard ones, is CFL §1.1, p. 1 (CFL lines 22–32), with the Schubert varieties indexed by the same increasing sequences; that the standard monomials restrict to a basis of the dual of a generalized Demazure module is LLM Theorem 4, p. 299 (LLM line 263), and Theorem 6, p. 301 (line 338) identifies that dual with the sections on the Bott–Samelson variety and on its image, a Schubert variety when the module is a Demazure module (lines 333–335).

### 6.3 Minuscule induction (S6.3)

Give the minuscule standard-monomial induction in full on G/P_λ with its actual ample minuscule polarization; full-flag pullbacks use the already proved parabolic cohomology comparison before any Serre argument. The extremal section divisor is a reduced lower-dimensional Schubert union; multiplication gives 0→O_X(m−1)→O_X(m)→O_D(m)→0. Prove the union intersection ideals are reduced by S5 before using Mayer–Vietoris. Prove both the higher-cohomology descent from actual Serre vanishing and the H¹/restriction/dimension step by the exact maps and standard sections. An unexplained dimension count cannot assume the restriction surjectivity being proved. The m=0 boundary case and all nonnegative twists stay included.

*Needs:* S5.2 and S5.5 for reduced unions and cohomology; S7.1–7.2 for minuscule divisor multiplicity; S6.1 for graded restriction. LLM Theorem 4, p. 299 states the resulting basis; the induction is the route to it.

### 6.4 Standard products (S6.4)

For arbitrary finite root type and dominant λ use S4's geometric path sections and defining chains. For an ordered tuple of dominant shapes, a standard product is one whose successive path directions admit a common decreasing lift in W with the specified stabilizer quotients; build its canonical minimal/maximal defining-chain tests and equivalence with the path concatenation criterion. Prove spanning by a well-founded triangular straightening and independence by the normalized filtration. Pairwise weak standardness is not substituted for a common defining chain. Export every multidegree, the single-shape Veronese rings, Demazure character and restriction formulas, and a basis on a finite reduced common-Borel Schubert union by sections standard on at least one component.

- Standardness uses one common defining chain for the whole tuple.
- Standard products retain their multidegrees and weights.
- Schubert restriction is a coordinate projection on the supported standard products.

**Checks.**

- The empty product has degree 0 and equals 1 on a nonempty Schubert variety.
- For SL₂, two degree-one factors produce three standard degree-two products, while the tensor square has dimension 4.
- On the closed point of ℙ¹, exactly one of these three products survives, with dimension 1.

*Needs:* S4.6–4.7; S6.1; S5's restrictions. LLM Theorem 4, p. 299 and Theorem 6, p. 301 give the basis and geometric interpretations.

### 6.5 Ideals and normal generation (S6.5)

Give the compatible ideal and multiplication API: for the fixed-Borel Schubert family, basis vectors failing its support test span the vanishing ideal, ideal intersections/sums match its reduced unions/intersections, and restriction maps are coordinate projections in that compatible basis. Mixed standard/opposite intersections keep their actual S5.2 ideal identities; any section basis or surjectivity comparison there requires its own proved restriction/vanishing hypothesis, not this fixed-Borel assertion. For each normal Schubert variety and the full flag, prove projective normality and normal generation in the ample/actual embedding lane using these all-degree maps and integrality, not by defining the section ring to be the coordinate ring. Reduced unions retain their all-degree coordinate/section comparison and normal-generation theorem, but are not asserted normal without an actual normality hypothesis; a reducible union can fail normality along its intersections. For the toric degeneration of the flag coordinate ring consume GroebnerGeometry G5's Rees/SAGBI comparison and identify the initial algebra; an associated graded toric algebra does not make the original flag algebra toric. General path-based degenerations may be unions of toric components and must keep their actual fan/valuation hypotheses.

*Needs:* S5.2, S5.5–5.6; S6.1–6.4; GroebnerGeometry G5 for the Rees/initial-algebra comparison. Normality is asserted only for the normal Schubert components, not their reducible unions. Normal generation on Schubert varieties is Ramanathan1987 Theorem 3.11(i), p. 86 (line 950); with S5.4's normality it gives projective normality, and arithmetic Cohen–Macaulayness in every ample embedding is Theorem 4.2(ii), p. 88 (line 1044).

### Examples

For Gr(2,4), the six Plücker coordinates satisfy p12*p34−p13*p24+p14*p23=0. Degree 0 has dimension 1 and degree 1 has dimension 6; the toric initial algebra is compared by degeneration, not identified with the original multiplication.

### Dependencies

S1–S5 and S7.1–2 for geometric path sections; GroebnerGeometry G5 for the polynomial minor and straightening theory; the named projective-scheme and coherent suppliers.

## Layer 7: Chevalley divisors and incidence multiplicities (S7)


### 7.1 Divisor valuations (S7.1)

Choose the normalized extremal section nonzero on C(w). For v=w s_β with β>0 and ℓ(v)=ℓ(w)−1, prove that its divisor along X(v) has coefficient ⟨λ,β∨⟩. Show support, valuation at the codimension-one local ring, actual rank-one transverse parameter and compatibility with the chosen left/right quotient and weight. Equivalently express it using the transported extremal weight at v; prove the equality of these formulas rather than transcribing a β convention from BrionFlags Proposition 1.4.5.

- The divisor of the normalized extremal section on X(w) is supported on the Schubert divisors X(v), v=ws_β<w, with coefficient ⟨λ,β∨⟩, computed as a valuation in the rank-one transverse parameter at the generic point of X(v).
- The coefficient is additive in λ and unchanged by central translation of λ.
- Write w̄=wW_λ and v̄=vW_λ. When w̄>v̄ is a strict cover in W/W_λ, the coefficient equals S4.3's bond b_λ(w̄,v̄), with positive root −wβ: −⟨wλ,(−wβ)∨⟩=⟨λ,β∨⟩. The full-flag coefficient remains defined when w̄=v̄ or when the projected interval has intermediate cosets; neither case defines a quotient cover bond.

**Checks.**

- For SL₂ and λ=m, the section of O(m) nonzero on the open cell has divisor m·X(e); m=0,1,2 give coefficients 0,1,2.
- On the GL₃ full flag with λ=ω₁ and w=s₁s₂, the covers are v=s₁ with β=α₂ and v=s₂ with β=α₁+α₂, so the coefficients are ⟨ω₁,α₂∨⟩=0 and ⟨ω₁,(α₁+α₂)∨⟩=1: the pulled-back hyperplane section vanishes along X(s₂) only. For v=s₁ both projected weights are ε₂, so the zero coefficient is not a cover bond.
- With λ=ω₁ and w=s₂s₁, the full-flag cover v=s₂ has β=α₁ and coefficient 1, but projects to ε₃>ε₁ with intermediate ε₂; positivity does not imply a quotient cover. The cover v=s₁ has β=α₁+α₂ and projects to the actual cover ε₃>ε₂, whose bond for the root α₂ is 1.
- With the same w=s₁s₂ and λ=ρ the coefficients are 1 on X(s₁) and 2 on X(s₂); a model assigning coefficient 1 to every boundary component is wrong already here.

*Needs:* S3.1–3.2; S5.4 for codimension-one valuations; ReductiveGroups root coordinates; S4.3's coroot bonds. BrionFlags Proposition 1.4.5 gives the complex type-A formula; the rank-one local-parameter calculation establishes the stated root-datum form.

### 7.2 Boundary multiplicities (S7.2)

Distinguish the effective Cartier divisor of the full section from individual Schubert boundary Weil divisors, which need not be Cartier. Over ℂ in type A, BrionFlags Proposition 1.4.5, pp. 17–18 (BrionFlags lines 667–685), gives the divisor Σ_i(λ_i−λ_(i+1))X_(s_i) of the B−-eigenvector p_λ and the divisor Σ(λ_i−λ_j)X_(ws_ij) of its restriction p_(wλ)|X_w over the Schubert divisors of X_w; its Weil class is defined because X_w is nonsingular in codimension one, BrionFlags Proposition 1.3.5, p. 13 (lines 501–509 and 683). In the minuscule lane all nonzero coefficients are 1 and recover the reduced hyperplane/Pieri boundary used in S6. For general λ retain multiplicities in the cycle/class formula and use an actual coherent boundary filtration; do not tensor a fictitious invertible O(−X(v)) for every component. Include zero coefficients, λ=0 and the empty divisor.

- The Cartier divisor of the normalized section on X(w) has Weil class Σ⟨λ,β∨⟩[X(v)], and its ideal sheaf is the image of L(λ)^(−1)→O_X(w).
- In the minuscule lane every cover in W/W_λ has coefficient 1, so the divisor is the reduced union of the boundary Schubert divisors.
- Individual boundary components are Weil divisors; only their stated combinations are asserted Cartier.

**Checks.**

- For O(m) on ℙ¹ the Cartier divisor is m·[e], of multiplicity 0,1,2 for m=0,1,2; λ=0 gives the empty divisor and the unit section.
- In Gr(2,4) with the standard flag, the Schubert variety X_(1)={V : V∩F₂≠0} is the quadric cone p₃₄=0, p₁₃p₂₄=p₁₄p₂₃ in ℙ⁴ with vertex the point p₁₂; its extremal Plücker coordinate p₂₄ cuts the reduced Cartier divisor X_(2)+X_(1,1), the planes X_(2) with p₂₃=p₂₄=0 and X_(1,1) with p₁₄=p₂₄=0 through the vertex, and neither plane alone is Cartier at the vertex. The pivots (2,4) give λ=(1,0) and dimension 4−1=3. In contrast, X_(2,1) has pivots (1,3), consists of F₁⊂V⊂F₃, and is the smooth ℙ(F₃/F₁)≃ℙ¹ of dimension 4−3=1.
- On the GL₃ full flag with λ=ω₁ and w=s₁s₂, the divisor is X(s₂) with multiplicity 1 and X(s₁) does not occur, in agreement with S7.1's coefficients 1 and 0.

*Needs:* S7.1; SchemeAndStackFoundations divisor and cycle classes; S5.2's reduced boundary ideals; S5.4 for the codimension-one regularity of X(w) in every characteristic. BrionFlags Propositions 1.3.5 and 1.4.5 give the complex type-A divisor and its codimension-one regularity. For O(m) on ℙ¹ the multiplicity is m, giving 0,1,2 at m=0,1,2 rather than a constant multiplicity 1.

### 7.3 Cycle comparison (S7.3)

Construct the flag-specific Chow-to-integral-cohomology comparison from the generic algebraic cycles/localization/refined-intersection API of SchemeAndStackFoundations §5 and the existing LieGroups flag CW/cohomology carrier. Prove the affine-cell filtration spans the Chow group by Schubert closures, and prove independence using opposite-cycle intersection and degree. Send a Schubert generator to the ambient homology class obtained by pushing the complex-oriented fundamental class of its reduced-word resolution; identify its coefficient 1 on the open cell and the corresponding CW generator. Prove the pairing, divisor/Chern class and parabolic projection laws, yielding the flag comparison and its ring compatibility. This is the flag comparison only; the general Betti cycle-class map is not a target here (Scope and ownership). Compare the source Chevalley–Pieri degree calculation, including positivity and the actual multiplicities. General singular intersections retain their refined-intersection hypotheses; the transverse complex Grassmannian point count belongs to TensorProductCombinatorics §6.3.

- The cycle map respects proper pushforward and parabolic projection.
- Complex orientation fixes coefficient +1 on each open cell.
- Opposite-cycle intersection identifies the basis and its dual pairing.

**Checks.**

- A point flag has one degree-zero class, mapping to 1 in ℤ.
- On ℙ¹ the hyperplane has degree 1 and square 0 in the cohomology ring; replacing it by the fundamental class reverses degrees.
- On the GL₃ full flag the six classes have complex dimensions 0,1,1,2,2,3 and Euler characteristic 6; this count alone does not establish the cup products.

*Needs:* S7.1–7.2 and S2 reduced-word resolutions; SchemeAndStackFoundations §5; LieGroups Layer 8 and TopologicalKTheory T1.5. BrionFlags §1.3 supplies the complex cycle and opposite-intersection calculation.

### Examples

On ℙ¹ the root curve has degree 1 against O(1) and degree m against O(m). A type-A simple cover with minuscule fundamental weight has bond 1; replacing every divisor multiplicity by 1 would lose higher pairings.

### Dependencies

S1–S3; S5 normality and cohomology; S4.3 cover bonds; SchemeAndStackFoundations §5 cycles and intersections; LieGroups flag topology.

## Layer 8: Algebraic flag K-rings and characteristic maps (S8)


### 8.1 Flag Grothendieck groups (S8.1)

Consume the generic coherent/exact Grothendieck and perfect-complex owners. On smooth projective G/P verify the hypotheses of the supplied regular/quasi-projective finite-resolution comparison and identify its vector-bundle K₀≃coherent G₀ maps. Do not assert this equality on singular Schubert varieties. Their structure sheaves define ambient classes by proper coherent pushforward and the regular ambient resolution. Export the supplied products, duals, tensor twists, derived proper pushforwards and Tor/flat/perfect-range pullbacks on these flag objects, and construct their actual equivariant character/Schubert comparisons.

- On smooth projective G/P the comparison K₀→G₀ is an isomorphism, by finite locally free resolutions of coherent sheaves.
- The ambient class of a Schubert variety is the proper pushforward of its structure sheaf; S7.2's boundary exact sequences relate structure-sheaf and ideal-sheaf classes.
- Rank and Euler characteristic are additive functionals on these classes; they do not determine the class.

**Checks.**

- On ℙ¹, [O_e]=[O]−[O(−1)] from 0→O(−1)→O→O_e→0; it has rank 0 and Euler characteristic 1.
- For the point flag K₀=G₀=ℤ and the structure-sheaf class is the unit 1.
- On Gr(2,4) all six Schubert structure sheaves, including the singular X_(1), have Euler characteristic 1 by S5.5, and their classes form a ℤ-basis of G₀≅K₀ of rank 6; rank and Euler characteristic alone cannot separate them, and no K₀≃G₀ identification is asserted on X_(1) itself.

*Needs:* SchemeAndStackFoundations coherent/perfect K-theory and regular finite resolutions; S1's smooth flag and proper Schubert immersions. BrionFlags §3.3 gives the smooth-variety K₀/G₀ comparison.

### 8.2 Ordinary characteristic map (S8.2)

Construct c:ℤ[X]=R(T)→K₀(G/B−), eλ↦[Lλ], its augmentation, restriction and Weyl comparisons. If the derived group of G is simply connected, prove the integral presentation R(T)⊗_(R(G))ℤ≅K₀(G/B−), with ℤ carrying dimension augmentation. After identifying the character image with R(T)^W, the ideal is generated by f−ε(f), f invariant; it is not the ideal generated by the whole invariant ring, which contains 1. Prove the integral basis/rank and actual induction/restriction/projective-bundle or Schubert-filtration comparisons establishing surjectivity and kernel.

- The characteristic map takes addition of characters to tensor product and the zero character to the unit.
- Its rank is the dimension augmentation, and each invariant relation is f−ε(f).
- The presentation compares actual associated lines and Schubert classes.

**Checks.**

- On SL₂/B− put t=[O(−1)]; then (1−t)²=0, t has rank 1 and [O(1)]=t⁻¹.
- At λ=0 the class is 1, not 0; quotienting by all invariants would kill this unit.
- For a torus flag the quotient is ℤ: every character becomes 1 under augmentation.

*Needs:* S3.1; S8.1; ReductiveGroups rational representation rings; S5–S7's geometric push-pull and Schubert filtration. The geometric kernel and surjectivity are targets of the stated flag push-pull/filtration argument. The presentation itself is MerkurjevEquivariant, Corollary 6.8, p. 16, in degree 0 and applied to X=G/B− (in the setting of its Theorem 6.6, p. 16: G split reductive over a field with simply connected commutator subgroup), with Corollary 1.12, p. 5, identifying K₀(G;G/B−) with R(B−), and R(B−) with R(T) by restriction, the unipotent radical being split (Theorem 5.1, p. 10, as used in the proof of Proposition 6.5, p. 16); these locators refer to the author draft. The representation-ring freeness input is Steinberg1975, Theorem 2.2, p. 173 (with its explicit basis in Remark 2.3, pp. 173–174). Pittie1972, pp. 199–203, gives the compact-group freeness antecedent, cited by locator only.

### 8.3 Equivariant characteristic map (S8.3)

In the same simply-connected-derived range construct K₀^T(G/B−)≅R(T)⊗_(R(G))R(T), specify which factor is the base character and which gives associated lines, and compare its augmentation to S8.2. For a partial flag use R(P−)=R(L) and the corresponding character presentation, with the actual Levi Weyl subgroup and bundle comparison. Prove the finite free/basis statements needed for these tensors; do not assume rational invariants imply their integral version.

Construct the homogeneous-bundle identification R(P−)→K₀^G(G/P−), [V]↦[G×^(P−)V], with inverse given by the fibre at eP−. Prove the flag change-of-groups isomorphism R(T)⊗_(R(G))K₀^G(G/P−)→K₀^T(G/P−), a⊗[E]↦a·res_T^G[E]; together these give the stated presentation (MerkurjevEquivariant, Corollary 1.12, p. 5, and Proposition 6.5, pp. 15–16, in the author draft). This geometric comparison uses homogeneous descent and equivariant restriction, not merely the freeness of a representation ring.

Specify the equivariant map by a⊗eλ↦a·[L(λ)]: the first factor is the base T-character, the second the associated line. Forgetting equivariance augments the first factor, giving the ordinary presentation after swapping the two displayed tensor factors.

- Restriction to eB− sends a⊗eλ to a·eλ.
- At wB− it sends the same tensor to a·e^(wλ).
- Parabolic pullback is induced by restriction of Levi representations to T.

**Checks.**

- For SL₂ and the weight-one character z, 1⊗z restricts to z at e and z⁻¹ at s, whereas z⊗1 restricts to z at both.
- At λ=0, 1⊗1 restricts to 1 at both fixed points.
- For P=G, the partial presentation is R(T)⊗_(R(G))R(G)=R(T); forgetting equivariance gives ℤ.

*Needs:* S3.1; S8.1–8.2; ReductiveGroups Levi representation rings and restriction; S8.1's equivariant flag comparisons. Steinberg1975, Theorem 2.2, p. 173, supplies representation-ring freeness only; the geometric identification is the flag specialization of MerkurjevEquivariant, Proposition 6.5, pp. 15–16, through the homogeneous-bundle map above.

### 8.4 General isogeny types (S8.4)

For a general isogeny type retain c and its actual integral image. Use the derived simply connected cover's flag isomorphism to present ordinary K₀ with its larger available line lattice, proving compatibility and independence of the displayed choice. Rational comparison from the original lattice is separate. For PGL₂, its flag is P¹ but the root-character line is O(2); its image misses a primitive integral degree-one class. This is a required counterexample to an unqualified integral original-lattice presentation. Keep central torus characters and augmentation relations explicit.

- The original-lattice characteristic map commutes with the central-cover flag isomorphism.
- Ordinary line classes use the cover lattice when descent of a linearization fails.
- Rationalization is compared separately from the integral image.

**Checks.**

- On PGL₂/B≃ℙ¹, with u=[O(1)]−1 and u²=0, the root character gives [O(2)]=1+2u, so the image is ℤ+2ℤu and misses u.
- On the SL₂ cover the weight-one character gives 1+u, recovering the missing primitive class.
- After tensoring with ℚ, u=([O(2)]−1)/2 is in the image; over ℤ this division is not allowed.

*Needs:* S8.2–8.3; ReductiveGroups central-isogeny quotient comparison; S3.1's fibre-character and forgetful maps. The simply-connected hypothesis is the one of Pittie1972 and Steinberg1975; the PGL₂ counterexample shows it is needed integrally.

### 8.5 K-theoretic push-pull (S8.5)

Construct push-pull Demazure operators on these K-groups and compare them with S3's integral character operators, including word/Levi laws. Compute Schubert structure-sheaf and ideal-sheaf bases and pairings using the actual coherent duality and Euler pushforward. Distinguish those bases from line-bundle characters, ordinary cohomology classes and quantum/K-theoretic puzzle rules; none of those extra rules follows from the ordinary puzzle rule of TensorProductCombinatorics Layer 6.

- Push-pull is defined by the actual rank-one projection, not by identifying K₀ with a character ring in every isogeny type.
- The operators satisfy idempotence and braid relations through derived composition.
- Euler pairing compares the structure-sheaf and boundary-ideal bases with their duals.

**Checks.**

- On ℙ¹, χ(O)=1 and χ(O(−1))=0, so their push-pulls are 1 and 0.
- χ(O(−2))=−1, giving −[O] under push-pull; replacing Euler characteristic by h⁰ gives the incorrect value 0.
- For the point flag, push-pull is the identity of ℤ.

*Needs:* S8.1–8.4; S3.3; S5.7; coherent Euler pushforward and duality from SchemeAndStackFoundations. BrionFlags Theorem 3.4.1 supplies the complex flag basis-pairing comparison.

### Examples

For ℙ¹, put t=[O(−1)]; then (1−t)²=0, while its rank is 1. The point flag has K-ring ℤ. These distinguish the rank map from the full flag K-ring.

### Dependencies

S3, S5–S7; SchemeAndStackFoundations coherent/perfect K-theory and Euler pushforward; the actual line-character map and stated isogeny hypotheses.

## Layer 9: Complex realization and existing comparisons (S9)

### 9.0 Coherent analytification and proper comparison (S9.0)

Construct complex analytic spaces as locally ringed spaces locally isomorphic
to zero loci of coherent holomorphic ideals in open subsets of finite-dimensional
complex vector spaces, with the quotient sheaf, not just the reduced zero set.
Allow non-Hausdorff spaces for gluing. Construct their morphisms, open and closed
subspaces, fibre products and gluing. For every locally finite-type complex
scheme X, construct its analytification a_X:Xᵃⁿ→X by its representing property
for morphisms of locally ringed ℂ-spaces from analytic spaces (SGA1, Exposé XII,
Theorem 1.1, retyped p. 239). Prove independence of affine presentations, open
gluing and compatibility with fibre products. The underlying set of Xᵃⁿ is
X(ℂ), naturally in X, and its topology is the native chart topology
`TauCeti.SchemePointTopology.topology` on the ℂ-points over Spec ℂ: the final
topology of the affine open charts, which on an affine scheme is the
coordinate-evaluation topology (`TauCeti.SchemePointTopology.affineHomeomorph`),
that is the subspace topology of the zero locus in ℂⁿ. Prove that the affine
charts are open embeddings, from `TauCeti.PointTopology.isOpenEmbedding_localization`
(the units of ℂ are open and inversion is continuous on them), so that open and
closed immersions become open and closed embeddings; that separated X has
Hausdorff points (the closed diagonal, SGA1, Exposé XII, Proposition 3.1(viii),
p. 244, with `TauCeti.PointTopology.instT2Space` on the affine charts); that
finite-type X has second-countable points (finitely many charts, each second
countable by `TauCeti.PointTopology.instSecondCountableTopology`); and that
proper X has compact Hausdorff points (Proposition 3.2(v), p. 245). For smooth
X the analytic space has complex-manifold charts given by étale coordinates,
Hausdorff when X is separated; regular maps between smooth schemes are
holomorphic and étale maps are local biholomorphisms (Proposition
3.1(iii)–(iv), p. 244).

- At a complex point, the algebraic-to-analytic local-ring map is faithfully
  flat and induces an isomorphism on completed local rings.
- Closed immersions retain their defining ideals and nilpotents; open
  immersions and fibre products have their universal comparison maps.
- Define coherent analytification by a_X*F on the native module-sheaf carrier, using RealAnalyticGeometry R3.2’s coherence predicate.
  Prove exactness, faithful detection of zero coherent sheaves, and tensor,
  locally free dual, coherent Hom and local Ext comparisons. Construct the
  natural cohomology and higher-direct-image exchange maps by adjunction and
  Leray, compatible with composition and coherent exact sequences (SGA1,
  Exposé XII, Proposition 1.3.1 and §4.1, pp. 241, 247–248).

**Checks.**

- For affine n-space with n=0,1,2, the point space is a point, ℂ and ℂ² with
  the Euclidean topology, the coordinates being the identity; the completed
  stalk at the origin is ℂ, ℂ[[z]], ℂ[[z₁,z₂]].
- On G_m=Spec ℂ[x,x⁻¹] the chart topology is that of ℂ^× inside ℂ, and the
  restriction to A¹ is an open embedding; over a coefficient ring whose
  inversion is not continuous on its units, such as the adeles, the same
  restriction is not an open embedding, so the ℂ hypotheses are used.
- The affine line with doubled origin is locally of finite type and not
  separated; its point space is ℂ with a doubled origin, which is not
  Hausdorff, so the Hausdorff conclusion needs separatedness.
- Spec ℂ[ε]/(ε²) has one analytic point but a two-dimensional structure ring:
  ε²=0 and ε≠0 on both sides. Reduction would give dimension 1 instead.
- The nodal curve xy=0 has completed local ring ℂ[[x,y]]/(xy), with nonzero
  x and y but xy=0; a manifold-only construction cannot model this stalk.

*Needs:* the native `TauCeti.SchemePointTopology.topology`,
`TauCeti.SchemePointTopology.affineHomeomorph`,
`TauCeti.PointTopology.isOpenEmbedding_localization`,
`TauCeti.PointTopology.instT2Space` and
`TauCeti.PointTopology.instSecondCountableTopology` for the point space;
ComplexKahlerGeometry K3–K4 (holomorphic germs, Weierstrass division
and sheaves); SchemeAndStackFoundations Layers 1–2 (locally ringed spaces,
module sheaves, gluing and derived cohomology); RealAnalyticGeometry R3.2
(native coherence and coherent kernels). Extend coherence from ambient
holomorphic germs to their coherent ideal quotients here, and construct the
finite-presentation and completion comparison in the proof of SGA1 XII.1.1.

Prove coherent GAGA in its general proper form. For any proper morphism
f:X→Y of locally finite-type complex schemes, any coherent O_X-module F
and q≥0, the canonical exchange map
(R^q f_*F)ᵃⁿ→R^q fᵃⁿ_*(Fᵃⁿ) is an isomorphism. For a proper complex scheme X,
analytification gives an equivalence Coh(X)≃Coh(Xᵃⁿ), compares all coherent
cohomology and Ext groups, and respects tensor products and proper pushforward.
Singularities and nilpotents are allowed (SGA1, Exposé XII, Theorems 4.2 and
4.4, Corollary 4.3, retyped pp. 248–251; SerreGAGA, §12, Theorems 1–3,
pp. 19–20, for the projective starting case).

A proof route constructs the analytic projective-twist cohomology and finite
twist presentations, then uses descending cohomological induction for projective
morphisms and Chow modification with coherent support dévissage for proper ones.
Develop the required analytic coherent cohomology first: coherent quotients of
ambient holomorphic sheaves and exact coherent direct image for closed analytic
immersions. For a closed analytic subspace of a Stein manifold, identify its
coherent cohomology with that of its coherent direct image and apply
RealAnalyticGeometry R3.2’s Cartan B. Apply this general comparison to the
projective cover, and construct the Laurent-series Čech comparison for twists over a polydisc
base, and finite twist presentations of coherent sheaves on projective analytic
space (SerreGAGA, §§13–17, pp. 20–27; SGA1 XII.4.2, projective-case proof).
The proper equivalence uses coherent Hom and Ext¹ comparison to algebraize
extension classes in support induction; an extension is not replaced by its
split direct sum. SchemeAndStackFoundations §4.12 supplies Chow modification.

- Identity and composition of proper morphisms commute with the same exchange
  maps, as do the long exact sequences of coherent cohomology.
- Compare the algebraic and analytic base-change morphisms for cartesian squares;
  conclude an isomorphism when the algebraic base-change theorem applies,
  for example for flat change of base. No arbitrary underived base-change
  isomorphism is asserted.
- Equivariant structures transport by naturality in the action and cocycle
  maps; for proper X this compares the actual cohomology representations,
  rather than just their dimensions.

**Checks.**

- For f=id the exchange in degree 0 is the identity, and higher direct images
  are zero; the zero coherent sheaf gives zero in every degree.
- For ℙ¹ over ℂ, O(−2) has H⁰=0 and H¹=ℂ on both sides. Over the base ℂ[s],
  R¹π_*O(−2)=O, whose analytification allows the holomorphic coefficient exp(s).
- The proper dual-number point has H⁰ with basis 1,ε and zero higher groups.
  In contrast on affine ℂ, the endomorphism exp(z) of the analytic trivial line
  is not algebraic; properness cannot be dropped from full faithfulness.
- Over A=ℂ[t], an extension 0→O(−2)→E→O→0 on ℙ¹_A with class t
  has cohomology complex [A→A] with differential multiplication by t.
  H⁰ is zero over A but becomes ℂ at t=0; the underived degree-zero
  base-change map 0→ℂ is not an isomorphism, on either side of GAGA.

*Needs:* the analytic-space and coherent-pullback construction above;
SchemeAndStackFoundations §§2.2, 2.6, 4.12 (coherent pushforward, projective
cohomology and Chow modification); RealAnalyticGeometry R3.2 (Cartan A/B). This comparison precedes the flag
specialization and uses no Schubert vanishing or standard monomial theorem.

### 9.1 Flag and word specializations (S9.1)

Over ℂ the group G(ℂ), the flag (G/P−)(ℂ), its Schubert varieties and the word schemes carry S9.0's classical topology and, where smooth, its holomorphic charts; multiplication and the action are holomorphic, being regular maps between smooth schemes. Apply §3A.5's closed-orbit theorem to the G-action on the proper flag at eP−. Its orbit model is the smooth scheme G/P− itself, since each fibre of G→G/P− over a complex point is a P−-torsor over ℂ and so has a complex point, and its scheme stabilizer is P−. This gives the holomorphic submersion G(ℂ)→(G/P−)(ℂ), its holomorphic local sections and the biholomorphism G(ℂ)/P−(ℂ)≃(G/P−)(ℂ), compact by properness; these are consumed, not rebuilt. S9.1 owns what is specific to the Schubert models: S1.0's root cells and charts, S2's word towers and multiplication, and the tautological and associated bundles. Use S9.0’s analytification and projective coherent GAGA at the actual objects. Identify the compact homogeneous flag model and its rank-one factors through LieGroups, and compare type A subspace/quotient/Plücker models with ModularCurves §0G and TopologicalKTheory T1.5. Ordinary relative forms and field changes retain their actual algebraic hypotheses; the complex comparison is not their substitute.

- S1.0's root-cell charts are holomorphic charts of S9.0's flag manifold with the same transition maps, and each cell C(w)(ℂ) is a locally closed submanifold biholomorphic to ℂ^ℓ(w).
- Tautological and associated bundles have the same fibre maps and transition functions after analytification.
- Tower maps, multiplication and Schubert restriction commute with analytification.

**Checks.**

- The empty word analytifies to a point, and a one-letter word to ℙ¹(ℂ).
- For SL₂/B−, S1.0's root coordinate z on the open cell is the holomorphic coordinate z of S9.0's chart, with derivative 1, and its complement in the compact ℙ¹(ℂ) is the closed cell {eB−}.
- Over the dual-number base ℂ[ε]/(ε²), the rank-one open-cell chart retains ε≠0; passage to the reduced space would make the bundle comparison lose its base ring.

*Needs:* S1–S2 and S3.1; S9.0 (classical points, smooth charts, coherent analytification and GAGA); ReductiveGroups §3A.5 (the closed-orbit submersion, its local sections and biholomorphism); LieGroups Layer 8 and TopologicalKTheory T1.5. This is the specialization of SGA1 XII.1.1 and XII.4.2 to these models.

### 9.5 Type-A path specialization (S9.5)

Specialize S4.1–5 to the full type-A root datum, retaining the GLₙ central
lattice and its actual SLₙ restriction. Prove that its simple coroot heights
are adjacent coordinate differences, with the same endpoint, concatenation,
root-operator and central-transport laws. For GL₂ the straight path t↦(t,0)
has height t and lowers to t↦(0,t); a central shift by (1,1) preserves the
height and changes the endpoint to (2,1).

*Needs:* S4.1–5; the native `TauCeti.LSPath.centralTransport`; the native `TauCeti.GeneralLinear.diagonalRootDatum n`, which carries the GLₙ central lattice, and, for n≥2, `TauCeti.DynkinType.simplyConnectedRootDatum` at type A_(n−1) for the SLₙ restriction. S9.5 is a deduction from S4.1–5 at these root data and uses no further source.

- Adjacent coordinate differences are the simple-coroot heights under the type-A map.
- Endpoint, concatenation and root operators commute with specialization.
- The native central transport `TauCeti.LSPath.centralTransport` keeps the GLₙ central lattice.

**Checks.**

- The GL₂ path (t,0) has height t and lowers to (0,t), changing endpoint (1,0) to (0,1).
- Adding central (1,1) gives endpoint (2,1) with the same simple height t.
- A pure central path (t,t) has endpoint (1,1) but zero simple height; passing to SL₂ would lose this endpoint data.

### 9.6 Cellular and normalizer comparison (S9.6)

Compare the resulting integral full-flag CW classes with the Schubert Chow/degree comparison of S7.3; no new Grassmannian characteristic-map owner is introduced. As the compact-normalizer application, for compact connected K and maximal torus T use the actual free finite covering K/T→K/N(T) with deck W, the singular-cohomology transfer of AlgebraicTopology Stage 5, item 3, over ℚ and the flag's even-cell Euler characteristic |W|. Prove H⁰(K/N(T);ℚ)=ℚ and all positive-degree groups vanish. Over ℤ averaging is unavailable: for SU₂ identify K/N(T)=ℝP² and compute H⁰=ℤ, H²=ℤ/2 and other positive cohomology zero. The generic compact BG/BT invariant/Chern–Weil comparison remains at CharacteristicClasses C5; the invariant-degree and exterior-cohomology statements quoted in KnutsonSymplectic §4, pp. 4–5 require that owner's actual invariant-theory/transgression interfaces and are not inferred from this rational-normalizer calculation.

- K/T→K/N(T) is a finite covering with deck group W, and the rational transfer identifies H*(K/N(T);ℚ) with the W-invariants of H*(K/T;ℚ).
- H*(K/T;ℚ) is concentrated in even degrees with total dimension |W|, and its W-invariants are ℚ in degree 0.
- Over ℤ the transfer gives no averaging; the integral groups are computed directly in the stated cases.

**Checks.**

- For SU₂, K/T=S² and N(T)/T=ℤ/2 acts antipodally, so K/N(T)=ℝP² with H⁰=ℤ, H¹=0 and H²=ℤ/2; rationally only H⁰ survives.
- For a torus K=T the Weyl group is trivial and K/N(T) is a point with H⁰=ℤ.
- The Euler characteristic of K/N(T) is χ(K/T)/|W|=1, for SU₃ 6/6=1; a model identifying H*(K/N(T);ℚ) with H*(K/T;ℚ) would give 6.

*Needs:* S7.3; LieGroups Layer 8; AlgebraicTopology Stage 5, item 3 (finite-covering transfer). For SU₂ the rational quotient has only H⁰=ℚ, while integral H²=ℤ/2; averaging over its order-two Weyl group cannot be performed integrally.

### 9.7 Moment–Morse comparison (S9.7)

Construct the compact moment-Morse comparison with [HamiltonianReduction R2a](../SymplecticGeometry/HamiltonianReduction/README.md) on its same homogeneous coadjoint orbit (KnutsonSymplectic §§1–3, pp. 1–3, for the KKS form, stabilizers and even-index Morse route). For compact connected K, a real dominant μ∈t and H=K_μ, use LieGroups Layer 8 and S9.1 to identify K/H with the analytic partial flag G/P− whose Levi roots vanish on μ. No integrality or prequantization of μ is required for this diffeomorphism; an associated line still requires the actual character lattice. Compare the inclusion derivative, root-plane coordinates, T action and the actual KKS form. At p∈O_μ∩t construct the invariant complex structure by J_flag|E_α=sign(α(p))J_α on the tangent planes α(p)≠0 and prove that it is the integrable structure transported from this flag. Then ω(v,J_flag w)=B(v,w)/|α(p)| on those planes. Extend the equality equivariantly and construct the positive K-invariant Kähler metric, rather than assume the arbitrary metric used for the Morse chart has this property.

   For regular X in the negative chamber, prove grad(f_X)=J_flag X_O and the complete negative-gradient flow is the complexified action exp(−itX). Construct its coordinate action in the actual root-subgroup charts and prove its unstable manifolds are the standard B− cells C(w), of complex dimension ℓ(w), with backward limit wμ; its stable manifolds are the opposite cells. The compact flow model is being compared to those root-coordinate cells, not used to define the algebraic Schubert schemes. For positive X, retain index(f_X)=dim(O_μ)−2ℓ(w) and use −f_X for the same index-2ℓ(w) model. Zero stabilizer roots are omitted on partial flags, and central components change only the height constant. Prove the convergence/limit and cell-coordinate statements and the parabolic projection when μ lies on a wall, with X still regular in the chosen chamber, not just agreement of cell counts or characters. If instead X lies on a wall, use R2a's centralizer-orbit Morse–Bott strata and their negative normal bundles; do not assert the same isolated-critical-point/Bruhat-cell statement for that height. An arbitrary invariant metric need not have these Bruhat unstable manifolds.

   Compare the MorseTheory M2 negative-handle characteristic maps and the flag characteristic maps of LieGroups Layer 8 and TopologicalKTheory T1.5 by actual relative-pair maps, root-coordinate orientations and compatible finite filtrations. Distinct-value height choices and simultaneous critical levels must give the same labelled comparison under the constructed handle-continuation maps. Use the complex orientation of each negative root-plane sum; check independence from torus choices of normalizer representatives, whose root-plane rotations have positive real determinant. Compare the resulting integral cellular/singular generators with S7.3's pushed-forward resolution classes and their coefficient 1 on the open cells, including the boundary/attaching-map comparison. A singular Schubert closure need not be a ball and is not declared to be the image of an embedded Morse disc. Export the finite even-cell Poincaré polynomial Σ_(w∈W/W_μ)q^(2ℓ(w)), torsion-free integral groups and |W/W_μ| Euler characteristic with these actual comparison maps. Multiplicative Schubert/cohomology formulas retain their S7 construction and the named downstream applications; they do not follow merely from a vanishing cellular differential.

   This is a later application of HamiltonianReduction R2a, the independent compact LieGroups foundations, the existing root-cell/complex-realization maps and MorseTheory's generic attachments. It is not a prerequisite for LieGroups Layer 6 conjugacy, S4's generic LS engine, ReflectionInvariantTheory §§1–3 polynomiality, or CharacteristicClasses C5/C5a Borel/compact cohomology. Retain S9.6's normalizer/Weyl transfer and SU₂/ℝP² test at that single owner.

- The comparison uses the KKS form and the root-plane complex orientation.
- Negative gradient limits identify the Bruhat cells with their actual flow coordinates.
- The handle maps preserve the same integral cellular generators as the resolution classes.

**Checks.**

- For the point orbit, the Poincaré polynomial is 1, the Euler characteristic is 1 and all tangent spaces have dimension 0.
- For the rank-one orbit ℙ¹, the two indices in the negative-chamber convention are 0 and 2, giving Poincaré polynomial 1+q² and Euler characteristic 2.
- For a central height element on the same ℙ¹ orbit, the height is constant and the critical set is all ℙ¹; it is not a pair of isolated points.

*Needs:* HamiltonianReduction R2a; LieGroups Layer 8; S9.1; S7.3; MorseTheory M2. The root-plane KKS formula and flow construction give the comparison route.

### 9.8 Associated-line analytification (S9.8)

For a complex reductive G and parabolic P−, specialize S9.1's tensor-compatible
analytification of locally free sheaves to S3.1's algebraic associated lines.
Construct the holomorphic associated-line model G(ℂ)×^(P−(ℂ))ℂ_λ by the same
fibre character over ReductiveGroups §3A.5's biholomorphism
G(ℂ)/P−(ℂ)≃(G/P−)(ℂ), trivialized by §3A.5's holomorphic local sections, and
compare its transition functions, fibre at eP− and G action with the
analytification. Prove that the algebraic fibre/associated-line unit and counit
become the holomorphic ones, naturally for equivariant isomorphisms, tensor,
dual and parabolic pullback. This is the algebraic-to-holomorphic adapter;
it does not reconstruct the ordinary Picard group or the compact character-to-degree map.

- The comparison sends the fibre class [1,z] to the same fibre element z.
- The tensor comparison sends [g,z]⊗[g,w] to [g,zw], and duality negates the character.
- Restriction along a parabolic projection preserves the associated character and these maps.

**Checks.**

- For SL₂/B−, the weight-one character gives O(1) on both sides and root degree +1.
- The zero character gives the trivial line, with tensor unit mapped to 1.
- For a torus the flag is a point; characters 0 and 1 give the same ordinary
  line but distinct equivariant fibres, so forgetting the action cannot be an equivariant inverse.

*Needs:* S3.1's algebraic equivariant-line equivalence; S9.1's locally free
GAGA comparison; ReductiveGroups §3A.5's homogeneous identification
G(ℂ)/P−(ℂ)≃(G/P−)(ℂ) and its holomorphic local sections. S9.8 is a deduction
from these inputs and uses no further source: exactness and faithfulness of
coherent analytification are SGA1, Exposé XII, Proposition 1.3.1, p. 241 (SGA1
line 9479), applied through S9.0, and its compatibility with tensor products
and duals of locally free sheaves is S9.0's comparison; the associated-line
side is S3.1.

### Examples

For the proper dual-number point, algebraic and analytic H⁰ both retain ℂ[ε]/(ε²), with ε nonzero. For SU₂ the normalizer quotient is ℝP²: rational positive cohomology vanishes but integral H² is ℤ/2. For the point partial flag, its Poincaré polynomial is 1.

### Dependencies

S1–S8 at the targets that use them; S9.0 for classical complex points, smooth charts, coherent analytification and proper GAGA; ReductiveGroups §3A.5 for the homogeneous flag biholomorphism and its local sections; LieGroups Layer 8; HamiltonianReduction R2a; AlgebraicTopology Stage 5, item 3 (finite-covering transfer) and MorseTheory M2.

## Worked examples

- **Type A.** The Plücker coordinates of a two-frame in k⁴ are native: `TauCeti.plucker` gives its six maximal minors, `TauCeti.plucker_sum_smul` multiplies them by the determinant of a change of frame, `TauCeti.plucker_ne_zero_iff` says that they are not all zero exactly for an independent frame, and `TauCeti.mk_plucker_eq_mk_plucker_iff` that two independent frames have the same Plücker point exactly when they span the same plane. For the rows (1,0,2,0) and (0,1,0,3) the minors are p₁₂=1, p₁₃=0, p₁₄=3, p₂₃=−2, p₂₄=0, p₃₄=6, and p₁₂p₃₄−p₁₃p₂₄+p₁₄p₂₃=6−0−6=0; the change of frame by the matrix with rows (1,1) and (0,2), of determinant 2, gives p₁₂=2 and p₃₄=12. Construct on these coordinates the Gr(2,4) Plücker quadric, the coordinate-chart inverse, Schubert ideals, dimensions and all-degree bases. Include signed determinant-one SL representatives, the full block-monomial normalizer/stabilizer dictionary, the symplectic antidiagonal-form block parabolic and KnutsonBorelWeil's root-action/contragredient wedge signs (pp. 2–4). Include zero subspace/full subspace and the determinant line; claims that a tautological subbundle has no global sections need the correct nontrivial-rank range.
- **A fixed-plane stabilizer on a Grassmannian.** Over a field k, fix
  V=k^n, 0≤k₀≤n and a specified k₀-plane U⊂V; write P=Stab_GL(V)(U).
  Use the existing Grassmannian and tautological subbundle S, and the
  actual map S→(V/U)⊗O. For
  max(0,2k₀−n)≤d≤k₀ define the locally closed rank-exact stratum O_d
  by rank(S→V/U)=k₀−d. Its geometric points are exactly the k₀-planes
  W with dim(U∩W)=d. Prove each stratum is one P-orbit and give actual
  transporter matrices: extend a basis of U∩W to adapted bases of U,W,V,
  and map the resulting adapted bases for two planes to one another while
  preserving U. Give the inverse and check the block-matrix equations;
  over k this also proves transitivity on the k-rational points.

  Choose V=U⊕U' and bases u₁,…,u_k₀ and v₁,…,v_(n−k₀). The plane
  W_d=span(u₁,…,u_d,v₁,…,v_(k₀−d)) is an explicit representative.
  Compare these representatives and transporter maps with ReductiveGroups Layer 7b's actual
  parabolic double-coset map, obtaining
  (S_k₀×S_(n−k₀))\S_n/(S_k₀×S_(n−k₀))≃{d:max(0,2k₀−n)≤d≤k₀}.
  Prove the number of orbits is min(k₀,n−k₀)+1. Choose an adapted full
  flag when comparing with S1's Borel conventions; conjugation must carry
  its stabilizer and all the representative maps, not just the count.

  Let Z_d be the closed determinantal scheme cut out by the
  (k₀−d+1)-minors of S→V/U. If this size exceeds the source or target
  rank, there are no such minors and the ideal is zero; in particular
  Z_0=Gr(k₀,V) whenever d=0 is admissible. Prove these schemes are geometrically
  reduced and irreducible by comparison, in an adapted full flag, with
  S1's existing single-flag Schubert rank-condition schemes and their
  reduced closures. Their underlying closed sets satisfy
  closure(O_d)=|Z_d|=⋃_(e≥d)|O_e|, over the admissible e, and
  closure(O_e)⊆closure(O_d) iff d≤e. Prove density and the order using
  the rank charts and actual one-parameter plane degenerations; a count
  of double cosets alone does not determine closure order. This displayed
  union is a stratification of underlying sets, not a scheme union of
  the locally closed strata. Keep determinantal ideals, reducedness and
  field-extension comparisons on the existing scheme carriers.

  For k₀=0 or k₀=n there is exactly one plane and one orbit, including
  n=0; for n=1 these are the only cases. No positive-rank matrix minor
  or nonempty choice of complement vectors is required in these cases.

- For 1≤r≤dim V and nonzero θ∈ΛʳV, prove decomposability iff (ι_ηθ)∧θ=0 for every η∈Λ^(r−1)V*, by constructing the vector-valued contraction-image subspace and its basis. Include θ=0 as the affine-cone origin separately. For r=0 use Λ⁰V=k and its unique projective point, without that vector-valued contraction criterion; for r>dim V the exterior power is zero and its projectivization is empty. Compare this basis-free criterion with the already owned polynomial Plücker ideal and the actual universal image, retaining the exterior-algebra signs in every characteristic.
- For the rank-d tautological subbundle on the full flag over an algebraically closed field, prove H⁰(S_d)=0 when 0<d<N, and explicitly handle d=0 and d=N. Identify H⁰(S_d*) and its determinant sections through the actual induced-module/evaluation map. Multiplication of fundamental section spaces gives the Cartan-product quotient, not an unqualified isomorphism with the entire tensor product.
- For nonempty integral finite-type projective X and nonempty open U, compare the homogeneous degree-zero fraction field with the actual function field k(X)=k(U), and dim X=trdeg_k k(X) over a field. The local regular-section ring O(U) is not itself that fraction field; give the homogeneous affine-chart/homogenization maps and apply them to the Schubert cell dimension calculations.
- The complete flag→incidence product→Plücker→positive Veronese→Segre composite has its actual closed immersion and line pullback. Zero exponents contract flag directions and are not automatically embeddings; strictly positive relevant coefficients give the intended ample partial/full-flag model.
- **The three-dimensional incidence flag and its eight-dimensional representation.**
  Over ℂ fix V=ℂ³ and its ordered basis. Write v=(a,b,c) and
  ω=x(e₂∧e₃)+y(e₃∧e₁)+z(e₁∧e₂). Identify the actual complete flag
  (L,P) with ([v],[ω]) in P(V)×P(Λ²V), where L=ℂv and P is the
  plane represented by ω. Construct the scheme/analytic comparison and
  inverse, with incidence equation `v∧ω=0`, hence `ax+by+cz=0`.
  Under Segre this is a linear equation in the nine coordinates
  ax,ay,az,bx,by,bz,cx,cy,cz; retain the Segre quadratic relations.

  Construct the GL(V)-equivariant isomorphism
  `V⊗Λ²V≃End(V)⊗det(V)` by sending v⊗ω to the map
  `u↦v⊗(u∧ω)`. Prove that its trace is v∧ω. The flag's image thus
  lies in P(sl(V)⊗det(V)), a projective 7-space inside the ambient
  projective 8-space. Prove its linear span is exactly sl(V)⊗det(V):
  obtain the off-diagonal matrix units from incident coordinate pairs
  and diagonal differences from rank-one trace-zero matrices together
  with those units. This is an eight-dimensional submodule, with
  GL₃ highest weight (2,1,0), not the whole nine-dimensional tensor.

  Identify the section representation separately. Twist the incidence
  hypersurface ideal sequence by O(1,1), and use the existing projective
  coherent-cohomology calculation to prove H¹(O) of the product vanishes.
  Restriction then identifies H⁰(Flag(V),O(1,1)) with the quotient of
  `(V⊗Λ²V)*` by the one-dimensional incidence-equation line, hence with
  `(sl(V)⊗det(V))*`. Construct its restriction/evaluation maps, kernel and
  equivariance; its highest weight is (0,−1,−2) for ordinary dual action.
  Preserve this dual distinction when applying S3's line convention.
  Compare negative determinant twists, which change the GL₃ module
  while preserving the underlying projective flag embedding. These maps
  supply the explicit eight-versus-nine calculation of KnutsonBorelWeil, pp. 4–5.
- For the finite chain/convexity API include a single cover, an equal endpoint with gcd 0, incomparable endpoints, the arithmetic a-chain criterion with denominator 1 (outside the internal LS break range), a chamber-wall stabilizer, nonsimply-laced rank-two bonds, and a pure central straight path. The wall case must give equality of cosets when the coroot pairing vanishes; the pure central case must retain the scaled convexity statement.
- For central transport in GL₂, take π(t)=(t,0), χ=(1,1) and the increasing rational PL reparametrization φ(t)=t/2 for t≤1/2 and φ(t)=3t/2−1/2 for t≥1/2. The paths π and π∘φ represent the same class. The shifted π lies on x=2y, whereas (π∘φ)(1/2)+(1/2)χ=(3/4,1/2) does not. Verify this regression against an ambient quotient-level central action, and recover B(λ)→B(λ+χ) through the canonical LS representative instead.
- For SL₂ use P¹, O(m), the m+1 character string and degree m. In characteristic p compare induced, Weyl and simple modules, including the pth symmetric-power/Frobenius stabilizer example and the n=4,p=3 binomial cyclicity counterexample. A unique highest line need not imply a module is generated by that line.
- **The word 121 blowup of the three-dimensional full flag.** Fix a
  three-dimensional vector space V over a field and an initial plane P₀.
  Number the simple changes so that 1 changes a line and 2 changes a plane.
  Compare S2's actual word 121 carrier with triples
  (L₁,P,L), where L₁≤P₀, L₁≤P and L≤P, and all lines/planes have their
  stated ranks. Construct the two-sided scheme and equivariant comparison,
  including the initial flag convention and base change; the final map is
  (L₁,P,L)↦(L,P) in F=Flag(1,2;V). Off C={(L,P₀):L≤P₀}, its inverse is
  L₁=P∩P₀. Construct this intersection as a rank-one subbundle on the open
  P≠P₀, with its regular inverse maps, rather than a pointwise dimension rule.

  Use StableReduction's relative Proj (Layer 2) and Rees blowup (Layer 4),
  with their affine charts and universal property. Over B=Gr(2,V)≃P(V*), the incidence
  pairs (L₁,P) with L₁≤P₀∩P identify with Bl(P₀,B). In a chart at P₀ write
  the moving plane as the graph z=ux+vy relative to P₀. The incidence
  equation is ux+vy=0 on P(P₀); identify its line coordinate [x:y] with
  the blowup direction [−y:x], so the two Rees charts have equations
  v=u·r and u=v·s, with r·s=1 on their overlap. Give the actual chart
  isomorphisms, both inverses and transition maps, valid over every field
  including characteristic 2; no analytic argument or division by 2 is used.

  The projection F→B is the projective bundle of lines in the universal
  plane, hence flat. Prove the flat-base-change comparison of the Rees
  algebras degree by degree and their relative Proj, using the same
  StableReduction supplier, and apply it to the ideal of P₀. This constructs
  BS(121)≃F×_B Bl(P₀,B)≃Bl_C F over F. Record the ideal of C, its pullback
  invertibility, exceptional Cartier divisor, universal factorization and
  compatibility with the open inverse; a proper birational map with P¹
  fibres alone does not establish this blowup identity.

  The center C is P(P₀)≃P¹. Compute N(C/F) from the smooth projection to
  B: it is the constant rank-two bundle T(P₀)B⊗O_C. Construct this
  identification from the chart differentials and their transition maps.
  Thus the exceptional divisor is P_C(N(C/F))≃P¹×P¹, with the first
  factor the final line L and the second the choice L₁/blowup direction;
  its projection to C forgets L₁. Prove the exceptional normal line is the
  tautological O(−1) in the second factor. This identifies the exceptional
  normal line directly, rather than inferring it from a section. Compare with all eight fixed subwords and the existing
  four-tetrahedron model, preserving their actual Borel/action conventions.
- For general root type retain parabolic projection, minuscule versus nonminuscule divisor multiplicities, all-degree Demazure/path bases, scheme-theoretic reduced union/intersection and the degree/Chevalley formula. Kac–Moody and general quantum-group/canonical-basis statements are separate source programmes; the finite-type engine here is not a proof of them. Integral divided-power and rational-module source assertions are consumed from ReductiveGroups §§9A and 9C (the integral enveloping form with its divided powers, and algebraic distributions) and Layer 10 (rational representations), not silently reproved by geometric characteristic-zero arguments.

## Downstream consumers

TensorProductCombinatorics §8.3 owns the coordinate-path and operator comparison
with S4.1–5, and its Layer 6 owns the complex Grassmannian Schubert/puzzle
applications. These applications consume this roadmap's general theory. GeometricQuantization
§§3.3–3.4 consumes S9.1/S9.7's partial-flag, Kähler and root-oriented cell
comparisons for its ordinary Picard and forgetful-map conclusions.

KacMoody §§5.4, 6.4 and 7.2–7.3 consume S4 (the finite-root-datum path crystal,
LS chains and their cover bonds, the interval gcd, convexity and typed central
translation) and S7 (the finite Chevalley divisor coefficient ⟨λ,β∨⟩) as the
finite comparison case of its Layers 5–7. S4's bond, interval-gcd,
central-transport and convexity statements are the Tau Ceti declarations named
in the From Tau Ceti contract (`TauCeti.reflectionBond_pos_of_minimalCosetRepCovBy`,
`TauCeti.bondGcd_eq_intervalBondGcd`, `TauCeti.LSPath.centralTransport`,
`TauCeti.PLPath.evalTimed_mem_convexHull_orbit_weylGroup`), which KacMoody's S4
citation reaches through S4. QuantumEnvelopingAlgebras §8.2 consumes S4 and S7
(finite LS chains, normalized extremal sections and the Chevalley divisor
coefficient). CharacteristicClasses C5a consumes S9.6's rational acyclicity of
K/N(T), its finite-cover transfer and the computation SU(2)/N(T)=ℝP² with
H⁰=ℤ and H²=ℤ/2. FlagVarieties §6.1 consumes S1's incidence comparisons and
B− convention and S2.3's subword closure criterion.


## References

Proof routes include Allen Knutson's Math 261 handouts named below; Peter Littelmann, *Paths and root operators in representation theory*, Annals of Mathematics 142 (1995), 499–525, read from the author's Cologne page (Littelmann1995), for the finite path/linking construction: Proposition 4.7 and Corollaries 2–3, pp. 511–512 (Littelmann1995 lines 502–526), Theorem 6.3, p. 517 (line 726), Theorem 7.1, p. 518 (line 747), Theorem 9.1, p. 520 (line 815), §10, p. 521 (lines 848–865), and the decomposition formula of the Introduction, p. 500 (lines 89–94); Lakshmibai–Littelmann–Magyar's *Standard monomial theory for Bott–Samelson varieties*, Compositio Mathematica 130 (2002), Theorem 4 (§1.3, p. 299) and Theorem 6 (§1.4, p. 301), for the standard bases and section/vanishing comparisons, and Proposition 14 (§3.1, p. 312) with the dual embedding of §4.1, pp. 314–315, for the initial-direction basis of a Demazure module; and the root-coordinate/splitting/coherent constructions stated in S5. For the finite saturated-chain bond theorem use Chirivì–Fang–Littelmann, [*LS algebras, valuations and Schubert varieties*, arXiv:2203.12992v1, Definition 2.1 (p. 4) and §7.1 (p. 18)](https://arxiv.org/abs/2203.12992v1), in its dominant-weight/minimal-parabolic-coset setting; construct its chain-independent gcd through the combinatorial targets of S4.3. Each cited generic foundation retains its single owner.

Source keys: LLM denotes the 2002 article, read in the author copy on
Peter Magyar's page, whose theorem numbering is that of the published
article, with Theorem 4 at LLM line 263, Theorem 6 at LLM line 338,
Proposition 14 at LLM line 809 and the §4.1 dual embedding at LLM line 946. CFL denotes
arXiv:2203.12992v1, with Definition 2.1 at CFL line 188 and the Schubert
bond specialization at CFL line 960. The latter uses a dominant weight and
minimal representatives in the parabolic Weyl quotient; its characteristic-zero
geometric application does not supply positive-characteristic splitting.


For the relative parabolic quotients and integral root charts, use Brian
Conrad, *Reductive group schemes*, Theorem 2.3.6, pp. 72–73, Theorem 5.1.13,
p. 143 and Corollaries 5.2.8–5.2.9, pp. 155–157 (ConradReductive lines 2993,
6011, 6512 and 6551). For coherent analytification and proper GAGA, use
*Revêtements étales et groupe fondamental (SGA 1)*, arXiv:math/0206203v2,
Exposé XII, Theorem 1.1, Proposition 1.3.1, Theorems 4.2 and 4.4 and
Corollary 4.3 (SGA1 lines 9399, 9479, 9738, 9805 and 9801).
Jean-Pierre Serre, *Géométrie algébrique et géométrie analytique*, Annales de
l’Institut Fourier 6 (1956), §12, Theorems 1–3, pp. 19–20, and §§13–17,
pp. 20–27, gives the projective proof (SerreGAGA lines 735, 741 and 746).
The scheme-theoretic nilpotent generality is taken from SGA1.

Michel Brion, *Lectures on the geometry of flag varieties*,
arXiv:math/0410240v1 (2004), §§1.1–1.4, 2.1–2.3 and 3.3–3.4
(BrionFlags): the partial flag variety in the product of Grassmannians and its
forgetful fibration, §1.2, p. 7 (BrionFlags lines 256–258 and 266–272), the
incidence equation of Example 1.2.3(5), pp. 9–10 (lines 345–354), proper intersection of Schubert and opposite Schubert varieties and Proposition 1.3.2, p. 12 (lines 469–477), Proposition 1.3.5, p. 13 (BrionFlags lines 501–509),
Proposition 1.4.1, p. 14 (lines 549–552), the Plücker closed immersion,
p. 15 (lines 562–568), Proposition 1.4.3, p. 16 (lines 613–625 and 636–639, with the homogeneous line of line 593, whose literal sign is opposite to the degree of Proposition 1.4.3) and
Proposition 1.4.5, pp. 17–18 (lines 667–685). This source works over ℂ, with type-A coordinates; its
complex proofs do not supply the positive-characteristic splitting argument.
Allen Knutson's handouts for Math 261 (Berkeley, 2001–2002), on his Cornell
course pages: KnutsonBorelWeil, *Representations of U(n): the Borel–Weil
theorem* (Fall 2001, 5 pages, pi.math.cornell.edu/~allenk/courses/16spring/BorelWeil.pdf),
pp. 4–5 for the eight-versus-nine section calculation and pp. 2–4 for the
wedge-sign conventions; KnutsonBottSamelson, *The Bott–Samelson cranks and
Bott–Samelson manifolds* (Spring 2002, 6 pages,
pi.math.cornell.edu/~allenk/courses/12spring/6500/notes2/BottSamelsons8.pdf),
§1, p. 1 (right crank), §2, pp. 1–2 (iteration order), §5, p. 4 (contracted
product and left crank), §5, p. 5 (the compact picture, lines 168–173) and §6, p. 5 (parabolic letters); KnutsonSymplectic,
*Symplectic geometry of K/T* (Spring 2002, 5 pages,
pi.math.cornell.edu/~allenk/courses/12spring/6500/notes2/symplectic3.pdf),
§§1–3, pp. 1–3 (KKS form, stabilizers, even-index Morse functions) and §4,
pp. 4–5 (rational cohomology of K/N(T) and the SU₂ exercise); and
KnutsonDemazure, *The Atiyah–Bott formula and the Demazure character formula*
(Spring 2002, 4 pages,
pi.math.cornell.edu/~allenk/courses/12spring/6500/notes2/Demazure9.pdf),
pp. 1–4 for the positive-denominator operator and left-crank convention and
§4.0.2, p. 4 (KnutsonDemazure line 142) for the A₂ diagram; S3.6 derives its
coefficient formula from the stated signed strings. These handouts work over
ℂ with positive Borels; S1.2 and S3.3 give the conversions.

A. Ramanathan, *Equations defining Schubert varieties and Frobenius splitting
of diagonals*, Publications Mathématiques de l'IHÉS 65 (1987), 61–90
(Ramanathan1987, Numdam): Definition 1.1, p. 65, Proposition 1.4, p. 66,
§1.16, Proposition 1.17 and Lemmas 1.18–1.19, pp. 70–71, Remark 2.4, p. 73
(line 490), Theorem 3.5(i)–(ii), pp. 82–83 (lines 799–803), Theorem 3.7,
p. 84, Theorem 3.11(i)–(ii) and its proof, p. 86 (lines 950–974), and Theorem 4.2(i)–(ii), p. 88 (lines 1042–1045). The original splitting paper is
V. B. Mehta and A. Ramanathan, *Frobenius splitting and cohomology vanishing
for Schubert varieties*, Annals of Mathematics 122 (1985), 27–40, cited only
through Ramanathan1987. Niels Lauritzen, Ulf Raben-Pedersen and Jesper Funch
Thomsen, *Global F-regularity of Schubert varieties with applications to
D-modules*, Journal of the American Mathematical Society 19 (2006), 345–355,
read as arXiv:math/0402052v3 (LRPT2006), whose numbering is used here: Lemma
1.2, p. 3 (LRPT2006 lines 115–118), Proposition 2.1, pp. 4–5 (lines 165–178)
and Theorem 2.2, p. 5 (lines 190–204), for global F-regularity of Bott–Samelson
and Schubert varieties in positive characteristic. H. Pittie, *Homogeneous vector bundles on homogeneous
spaces*, Topology 11 (1972), 199–203 (Pittie1972), gives the compact-group
freeness theorem and is cited by locator only. R. Steinberg, *On a theorem
of Pittie*, Topology 14 (1975), Theorem 2.2, p. 173, and Remark 2.3, pp. 173–174
(Steinberg1975), supplies algebraic representation-ring freeness and its
explicit basis. For the geometric equivariant identification use Alexander
Merkurjev, [*Equivariant K-theory*, author draft dated 2000](https://www.math.ucla.edu/~merkurev/papers/handbook.pdf)
(MerkurjevEquivariant), Corollary 1.12, p. 5, Theorem 5.1, p. 10, Proposition 6.5, pp. 15–16, and Theorem 6.6 with Corollary 6.8, p. 16 (MerkurjevEquivariant lines 200, 408, 644, 668 and 676);
these locators refer to that draft, not the 2005 Handbook chapter's numbering. J. C. Jantzen, *Representations of Algebraic Groups*, second
edition, Part II, Chapter 14, gives Demazure modules and their contravariant
duals over an arbitrary field; cited by locator only.
