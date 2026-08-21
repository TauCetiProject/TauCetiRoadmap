# Progress log: ReductiveGroups

An append-only record of what landed on the ReductiveGroups roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"1f1d7527e4085f3ac0ffad2ac3ad69cfbebe809c","prs":[45,54,56,62,64,75,78,80,90,97,101,106,109,111,112,113,116,117,118,119,122,123,124,125,126,127,129,135,136,137,138,139,148,155,156,157,158,159,165,166,167,169,181,182,183,185,186,196,234,237,239,240,241,242,243,244,245,282,285,297,314,325,357,361,373,383,386,399,427,428,458,469,478,490,512,515,552,611,665,690,700,748,761,762,769,785,862,890,909,968,976,1024,1027,1134,1139,1146,1163,1214,1280,1321],"roadmap":"ReductiveGroups","to_sha":"ed837d596f81c587c5b9696efed02a869f945e7e"}-->
## ReductiveGroups: 2026-06-04 to 2026-07-29 (`1f1d752` to `ed837d5`)

The largest named result of this window is that the character–cocharacter pairing of a split
torus is perfect: for a split torus of finite rank, the dot-product pairing between the character
lattice `X*(T) = σ →₀ ℤ` and the cocharacter lattice `X_*(T)` induces isomorphisms onto both
`ℤ`-duals (TauCeti#1134). It is available both in the coordinate model of the cocharacter lattice
and, transported back, on the genuine lattice of homomorphisms
`Multiplicative (σ →₀ ℤ) →* Multiplicative ℤ`
([`SplitTorus.instIsPerfPair`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/SplitTorus/Cocharacter.html#TauCeti.SplitTorus.instIsPerfPair)
and `instLatticePairingIsPerfPair`), with the two non-degeneracy directions proved separately.
Underneath it is the character and cocharacter machinery for a general diagonalizable group `D(M)`
(TauCeti#968): characters and cocharacters as homomorphisms of group functors, the integer pairing
[`DiagonalizableGroup.pairing`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Cocharacter.html#TauCeti.DiagonalizableGroup.pairing)
with its bilinearity, and the power endomorphisms of `𝔾ₘ`, which TauCeti#1163 identified with the
canonical integer action on endomorphisms. The roadmap wants the perfect pairing as the input to
root data, and that is exactly where the work stops: nothing here defines a root, a Weyl group, or
a maximal torus sitting inside a larger group, and the perfectness statement is for the split,
finite-rank case only.

Two kernels were computed. `μ_n` is the kernel of the `n`-th power endomorphism of `𝔾ₘ`
(TauCeti#976,
[`RootsOfUnityGroup.range_inclusion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Kernel.html#TauCeti.RootsOfUnityGroup.range_inclusion)),
and `αₚ` is the kernel of the Frobenius endomorphism of `𝔾ₐ` (TauCeti#1146,
[`AlphaP.range_inclusion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/AdditiveFrobeniusKernel/Kernel.html#TauCeti.AlphaP.range_inclusion)).
The same pull request builds that Frobenius endomorphism from the observation that `xᵖ` is
primitive in characteristic `p`, so `x ↦ xᵖ` is a bialgebra endomorphism of the coordinate ring of
`𝔾ₐ`. Both kernel statements are about the functor of points: they are equalities of subgroups of
`G(A)`, natural in the value algebra `A`, and not scheme-theoretic kernels, which do not exist yet.
`αₚ` itself arrived earlier in the window (TauCeti#611) with its coordinate Hopf algebra `R[x]/(xᵖ)`,
its points identified with the `p`-nilpotent elements of `A`, and
[`AlphaP.coordinateRing_not_isReduced`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/AdditiveFrobeniusKernel/Basic.html#TauCeti.AlphaP.coordinateRing_not_isReduced);
TauCeti#1024 adds that over a reduced algebra it has only the identity point. That is the
roadmap's designated non-smooth example behaving as intended: invisible on reduced points, and not
trivial.

Most of the window, by volume, went into comodules, which the roadmap treats as the engine of
Layer 1. The basic structure landed at the start (TauCeti#62,
[`Comodule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Basic.html#TauCeti.Comodule)),
and the rest of the window filled in what a working category needs: an `R`-module of morphisms
(TauCeti#90), preadditivity (TauCeti#106), a zero object (TauCeti#117), binary products carrying
the direct-sum coaction (TauCeti#240), trivial and group-like comodules (TauCeti#101), the regular
comodule (TauCeti#122), corestriction along a coalgebra morphism (TauCeti#97), transport across a
linear equivalence (TauCeti#109), and cofree comodules together with the universal property that
comodule morphisms into `M ⊗[R] C` are just linear maps into `M`
([`Comodule.Hom.cofreeEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Cofree.html#TauCeti.Comodule.Hom.cofreeEquiv),
TauCeti#129). The subobject theory is now reasonably complete: the lattice of subcomodules
(TauCeti#136), inverse images and kernels (TauCeti#241), the induced coaction on the subtype of a
subcomodule (TauCeti#909), quotients with their lift and its uniqueness (TauCeti#785), and on the
coalgebra side subcoalgebra suprema and finiteness (TauCeti#124), images (TauCeti#127), spans of
group-like elements (TauCeti#119), and the order embedding of subcoalgebras into subcomodules of
the regular comodule (TauCeti#138). Over a bialgebra the diagonal tensor product of comodules was
assembled (TauCeti#890, TauCeti#1027) and then restricted to the finitely generated ones, which
now form a monoidal category
([`FGComoduleCat.instMonoidalCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.html#TauCeti.FGComoduleCat.instMonoidalCategory),
TauCeti#1280 and TauCeti#1321). Monoidal, not rigid: there are no duals of comodules here, and
none of the results the roadmap actually wants from this layer, the finite-dimensional
subcoalgebra theorem, faithfulness, the embedding theorem into `GLₙ`, or Tannakian reconstruction,
have been attempted.

The Hopf-ideal lane advanced in parallel and stayed at the Hopf-algebra level. A bialgebra
morphism killing a two-sided coideal factors uniquely through the quotient bialgebra
(TauCeti#237); the kernel of a surjective bialgebra morphism is a Hopf ideal, and the quotient by
it is bialgebra-equivalent to the codomain
([`HopfIdeal.kerLiftBialgEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/HopfAlgebra/Kernel.html#TauCeti.HopfIdeal.kerLiftBialgEquiv),
TauCeti#185); and Hopf ideals pull back along surjections compatibly with the lattice operations
(TauCeti#383). Around these sit the Layer 0 supports: the convolution group structure on
`H →ₐ[R] A` with inverse `f ↦ f ∘ S`
([`AlgHom.instGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.html#TauCeti.AlgHom.instGroup),
TauCeti#45) and its packaging as a functor in the value algebra (TauCeti#54), the points of a
tensor product as the product of the points (TauCeti#167, made natural in TauCeti#458), the points
of the trivial group (TauCeti#428), the Hopf-algebra structure on a symmetric algebra with
antipode `ι x ↦ -ι x` (TauCeti#165), the monoid algebra of a product as a tensor product of
monoid algebras (TauCeti#297), the universal property of a free abelian character group
(TauCeti#282), restriction of scalars on `CommAlgCat` (TauCeti#762), and a coordinate-ring functor
from finitely generated commutative groups to finite-type commutative Hopf algebras
([`DiagonalizableGroup.coordinateRingFunctor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/FiniteType.html#TauCeti.DiagonalizableGroup.coordinateRingFunctor),
TauCeti#1214), which is one direction of the Layer 4 anti-equivalence and not yet the equivalence.
Matrix coefficients also got their first multiplicativity statements: the coefficient submodule of
a tensor product of comodules contains the product of the two coefficient submodules (TauCeti#1139).

Proportion is worth stating plainly. Of the hundred pull requests in this window, fifty-five added
no new declarations at all; they split modules into directories, renamed, adjusted imports, and
consolidated. Of the rest, a large share is the routine `_apply`, `_comp`, and `_toLinearMap`
plumbing that makes the comodule API usable. One other design point is visible throughout the
declaration list: everything is stated over a general commutative base ring `R` rather than over a
field, so the field-specific parts of the roadmap, geometric connectedness, smoothness, and
anything defined after base change to `k̄`, remain untouched.

<!--tauceti-progress:v1 {"from_sha":"ed837d596f81c587c5b9696efed02a869f945e7e","prs":[1505,1508,1514,1516,1518,1521,1617,1620,1626,1627,1632,1640,1644,1651,1652,1661,1664,1669,1671,1672,1674,1676,1678,1683,1689,1691,1692,1694,1696,1697,1709,1711,1729,1753,1776,1805,1809,1813,1815,1816,1817,1818,1825,1831,1833,1841,1843,1845,1853,1856,1862,1863,1869,1889,1905,1906,1910,1921,1924],"roadmap":"ReductiveGroups","to_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd"}-->
## ReductiveGroups: 2026-07-29 to 2026-08-03 (`ed837d5` to `11ef09d`)

Layer 0 reached its summit. `Spec` is now an anti-equivalence from commutative `S`-Hopf algebras
onto affine group schemes over `Spec S`
([`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.html#TauCeti.commHopfAlgCatOpEquivAffineGroupSchemeCat),
TauCeti#1626), the `Γ` direction coming from a Hopf-algebra structure on the global sections of an
affine group scheme, and the functor of points was reconciled with it: it is corepresentable, full
and faithful. So the roadmap's three views are finally interchangeable. Built on that, closed
subgroup schemes of `Spec H` are classified by Hopf ideals under reverse inclusion
([`hopfIdealOrderIsoClosedSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Scheme/Classification.html#TauCeti.CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup)),
and the kernel of a morphism, cut out by the extended augmentation ideal, is the scheme-theoretic
fibre over the identity.

Comodules got their two structural theorems. Every element of a coalgebra over a field lies in a
finite-dimensional subcoalgebra
([`Subcoalgebra.exists_finiteDimensional_subcoalgebra_mem`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Subcoalgebra/Finite.html#TauCeti.Subcoalgebra.exists_finiteDimensional_subcoalgebra_mem)),
and, when the coefficient coalgebra is free, every comodule is the union of its finite subcomodules.
Finite-dimensional comodules over a commutative Hopf algebra now form a rigid symmetric monoidal
category
([`FGComoduleCat.instRigidCategory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Coalgebra/Comodule/Finite/Rigid.html#TauCeti.FGComoduleCat.instRigidCategory)),
duals twisted by the antipode. And the dictionary the roadmap wanted is in place: representations
of the group functor on `V` are exactly comodule structures on `V`
([`pointRepresentationEquivComodule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Basic.html#TauCeti.HopfAlgebra.pointRepresentationEquivComodule)),
with a matching criterion for when a linear map is colinear.

Layer 2 opened: the tangent space at the identity, defined as dual-number points lying over the
identity, is the module of derivations at the counit, and carries the convolution commutator as a
Lie bracket
([`Derivation.instLieAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Tangent/Lie/Basic.html#TauCeti.Derivation.instLieAlgebra)),
with the differential of a Hopf morphism a Lie morphism. The adjoint action is not there. The
worked examples caught up with the scheme language: `GLₙ`, `SLₙ` as a closed subgroup of it, `𝔾ₐ`
as affine one-space, `μ_n` as a closed subgroup of `𝔾ₘ`, and split tori, each with its
scheme-valued points identified with the expected classical group.

<!--tauceti-progress:v1 {"from_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd","prs":[1741,1871,1909,1925,1935,1944,1958,2014,2017,2251,2359,2365,2386,2389,2391,2394,2447,2450,2456,2457,2459,2481,2482,2483,2496,2522,2537,2540,2545,2556,2564,2567,2577,2582,2610,2615,2618,2627,2632,2639,2647,2648,2649,2651,2678,2683,2688,2700,2706,2740,2746,2749,2757,2761,2765,2771,2783,2787,2837,2843],"roadmap":"ReductiveGroups","to_sha":"f7aaa6df91011d8623d880c19e6cc3f69e1d46f4"}-->
## ReductiveGroups: 2026-08-03 to 2026-08-12 (`11ef09d` to `f7aaa6d`)

The embedding theorem landed: every affine group scheme of finite type over a field is a closed
subgroup of some general linear group
([`exists_isClosedImmersion_generalLinear`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear),
TauCeti#2582). It went through the finite-dimensional subcoalgebra theory, as the roadmap asked,
rather than through bare Noetherianity: a finite-type commutative Hopf algebra over a field is a
quotient of the coordinate ring of some `GLₙ`
([`exists_coordinateBialgHom_surjective`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.html#TauCeti.Comodule.exists_coordinateBialgHom_surjective)).
With it came faithfulness in the roadmap's sense: a finite free comodule gives a closed immersion
into `GLₙ` exactly when its matrix coefficients and their antipode images generate the coordinate
Hopf algebra
([`isClosedImmersion_coordinateGroupSchemeHom_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Faithful.html#TauCeti.Comodule.isClosedImmersion_coordinateGroupSchemeHom_iff_matrixCoefficientSubalgebra_sup_antipode_eq_top)).

Tannakian reconstruction is begun, not finished. Points act faithfully by tensor automorphisms on
scalar extension of finite comodules; conversely a tensor automorphism restricts
to compatible functionals on the finite subcomodules of the regular comodule, and these glue to a
multiplicative global functional, hence to a point
([`reconstructedPoint`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Reconstruction.html#TauCeti.Tannaka.reconstructedPoint))
which recovers the point it came from. The other round trip, that every tensor automorphism is the
one induced by its reconstructed point, is not stated, so there is no isomorphism yet. That gap
also holds up Jordan decomposition: the multiplicative Jordan-Chevalley decomposition of a linear
automorphism was built, and the semisimple and unipotent parts of a point's actions were assembled
into commuting tensor automorphisms whose product is the point, but nothing turns them into points
of the group.

Layer 2 arrived nearly whole: the cotangent space at the identity and its dual Lie algebra, the
adjoint action as a point representation and a comodule, the Lie algebra of a closed subgroup or
kernel with its conormal exact sequence, and `Lie(GLₙ)` and `Lie(SLₙ)` identified with matrices and
trace-zero matrices. Elsewhere: normal Hopf ideals and the pointwise quotient presheaf, geometric
connectedness and its stability under base field extension, faithfully flat descent for points, and
base change of affine group schemes.

<!--tauceti-progress:v1 {"from_sha":"f7aaa6df91011d8623d880c19e6cc3f69e1d46f4","prs":[2763,2766,2770,2829,2832,2864,2865,2868,2872,2882,2884,2891,2894,2897,2912,2919,2920,2932,2940,2943,2964,2977,2997,2998,2999,3001,3002,3004,3005,3007,3011,3012,3014,3015,3016,3020,3021,3022,3023,3027,3050,3061,3065,3087,3088,3090,3091,3097,3110,3114,3117,3118,3177,3193,3195,3206,3208,3211,3213,3220,3222,3227,3233,3234,3238,3239,3249,3256,3264,3280,3286,3290,3293,3294,3296,3303,3307,3308,3311,3325,3336,3338,3356,3360,3363,3367,3376,3380,3384,3386,3389,3399,3410,3413,3415,3416,3421,3434,3436,3441,3449,3450,3456,3463,3471,3472,3475,3476,3478,3486,3489,3490,3494,3496,3500,3502,3503,3504,3505,3512,3513,3515,3518,3519,3522,3523,3524,3527,3529,3530,3531,3533,3534,3535,3536,3537,3539,3540,3541,3542,3543,3553,3555,3558,3559,3576,3581,3582,3584,3587,3591,3592,3593,3595,3601,3605,3607,3608,3609,3613,3622,3626,3630,3633,3642,3643,3649,3652,3667,3673,3678,3679,3682,3683,3684,3686,3688,3689,3690,3692,3704,3708,3714,3717,3718],"roadmap":"ReductiveGroups","to_sha":"c4d7989a116c565aa558fb82c318ad7c651bf2f4"}-->
## ReductiveGroups: 2026-08-12 to 2026-08-18 (`f7aaa6d` to `c4d7989`)

Tannakian reconstruction is finished. Points of a commutative Hopf algebra over a field
correspond exactly to tensor automorphisms of scalar extension on its finite-dimensional
comodules
([`fgPointTensorIsoEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.html#TauCeti.Tannaka.fgPointTensorIsoEquiv)),
naturally in the value algebra, so the functor of points and the tensor-automorphism functor
are isomorphic
([`pointsFunctorIsoTensorAutFunctor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.html#TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor)).
On top of it sits the multiplicative Jordan decomposition of a point over a perfect extension
field: commuting semisimple and unipotent factors with product the point, unique among such
factorizations and compatible with homomorphisms of affine groups
([`jordanDecomposition`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.html#TauCeti.HopfAlgebra.Point.jordanDecomposition),
TauCeti#2964).

Layer 3 got its missing pieces. The identity component is a closed subgroup scheme with
connected carrier and normal defining Hopf ideal, and over an algebraically closed field the
component group is finite and agrees with the connected components of the spectrum. Quotients
became sheaves rather than presheaves: the affine fppf topology is subcanonical, points of an
affine group form an fppf sheaf, and the quotient by a normal Hopf ideal is a group object in
fppf sheaves
([`fppfQuotientSheaf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Basic.html#TauCeti.CommHopfAlgCat.fppfQuotientSheaf))
whose projection is locally surjective with the expected torsor kernel pair. Cartier duality
arrived as an anti-equivalence of finite locally free bicommutative Hopf algebras, and a
finite-type Hopf algebra over a field is a torus exactly when it is of multiplicative type,
geometrically connected and geometrically reduced.

Layer 5 opened with the geometric definition of unipotence, verified for `𝔾ₐ` and the
upper-unitriangular groups and stable under products, quotients and extensions; such a group
has no nontrivial characters. Reductivity and
semisimplicity exist only as properties so far: no group has been proved reductive, and there
is no unipotent radical, no Lie-Kolchin theorem and no Borel theory beyond `GL₂`. Separately,
the Chevalley lane built the Serre presentation of split semisimple Lie algebras, the rank-one
Kostant form, and root subgroups of `GLₙ` and `SLₙ` satisfying the type-A commutator relations.
