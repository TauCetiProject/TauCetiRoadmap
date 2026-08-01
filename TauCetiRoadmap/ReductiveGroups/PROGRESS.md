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
