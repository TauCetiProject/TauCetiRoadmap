# Roadmap: reductive algebraic groups, part II — local structure and arithmetic models

A root datum alone gives neither a building nor a parahoric group scheme. This roadmap takes a
connected reductive group over a nonarchimedean local field `E`, and over the completion `Ĕ` of its
maximal unramified extension, and builds the structures that local representation theory, Shimura
varieties with parahoric level, local shtukas and geometric Satake need: the topology on rational
points, Weil restriction and the Deligne torus, valued root data and apartments, the Bruhat–Tits
building with its group action, integral models (Bruhat–Tits, parahoric, Néron models of tori, hyperspecial), the
Iwasawa, Cartan and Iwahori–Bruhat decompositions with their double-coset combinatorics, and the
integral dual group with its L-group. The end results are the parahoric group schemes `𝒢°_F` with
their Moy–Prasad filtrations, the decompositions

```text
G(E) = ⊔_{w ∈ W̃} IẇI,      G(E) = K Z(E) K,      G(E) = K P(E),
```

with their index formulas, and the L-group `ᴸG = Ĝ ⋊ Γ` as a group functor over `ℤ`.

It extends the Reductive groups roadmap (`TauCetiRoadmap/ReductiveGroups/README.md`), which remains
the owner of the unvalued theory of its layers 0–9: group schemes as Hopf algebras and their functors
of points, representations, Lie algebras, subgroups and quotients, tori and diagonalizable groups,
unipotent radicals, reductivity, the structure theory of layer 7 (maximal split tori, relative and
absolute root data with Galois action, root subgroups, parabolic and Levi subgroups, Bruhat
decomposition and BN-pairs) and the pinned Chevalley–Demazure groups over `ℤ` of layer 9. The shared algebraic carriers in RG2 refine layer 7 for both local and adelic consumers;
the structure theorems retain that supplier and its library vocabulary.

## Scope and ownership

The roadmap owns, layer by layer:

- RG2.0: affine point topology over topological rings, including the adelic case used by
  AdelicAlgebraicGroups; scheme point topology over local topological rings whose units are open
  and whose inversion is continuous in the subspace topology; integral points and
  congruence subgroups; the completed maximal unramified extension `Ĕ` with its Frobenius. It does
  not own adeles, Haar measures on restricted products or arithmetic quotients, and it does not
  state the compatibility of the scheme point topology with fibre products, the transcendence
  degree of `Ĕ` over `E` in equal characteristic, or a Witt-vector description of `O_Ĕ` for
  `E ≠ ℚ_p`.
- RG2.0a: restriction of scalars for affine schemes along finite locally free maps and its field
  specialization, with affine representability, fibre-product preservation, formal smoothness,
  smoothness and closed immersions; norm tori and abstract quotients of roots-of-unity
  point groups; the Deligne torus. Restriction of scalars for non-affine schemes, general projective
  parameter spaces and algebraic spaces lie outside this roadmap, as do the preservation by
  restriction of scalars of étale and surjective maps and of open immersions, its
  commutation with centres and derived groups, and the multiplicities of the
  relative roots of a Weil-restricted group.
- RG2.1: valued structure only — valuations of root data, apartments, affine roots, the affine Weyl
  group, `π₁(G)`, z-extensions and the Kottwitz homomorphism. The unvalued relative root system and
  the absolute root datum with Galois action are the Reductive groups roadmap's; RG2.1.2 states from
  the coordinate Hopf algebra only the objects of that theory which the valued theory consumes
  (`GeometricRoots`, `LocalRootData`, `AbsoluteRootData`). The vanishing of `κ_G` on unipotent
  elements is not stated.
- RG2.2: the Bruhat–Tits building, its axioms, metric, fixed points, facets and fixers, unramified
  and tame descent, functoriality for finite extensions, central surjections, Levi inclusions and
  twisted Levi subgroups, the lattice-chain models and the tree of `SL_2`. Uniqueness and Galois
  equivariance of toral embeddings into the building of `GL_n` for non-split groups are not stated.
- RG2.3: smooth affine and reductive models, Néron lft models of tori over discrete valuation rings, Bruhat–Tits and parahoric group
  schemes, hyperspecial vertices, Moy–Prasad filtrations, Lang's theorem and level subgroups. RG2.3 is
  the single owner in Tau Ceti of Lang's theorem for connected smooth groups over finite fields, of
  the Moy–Prasad filtrations and of the parahoric group schemes; it does not own affine Grassmannians,
  local models or Schubert varieties. It also owns Lang's theorem for inverse limits of smooth
  connected groups over finite fields; it does not state it for torsors under smooth models with
  connected special fibre.
- RG2.4: the decompositions of `G(E)` and the Iwahori–Weyl combinatorics up to admissible sets. The
  Hecke algebras, the Satake isomorphism and the smooth representations built on them belong to the
  representation-theoretic roadmaps that cite this one.
- RG2.5: the dual group, its Galois action and the L-group as group functors with their
  pointwise product comparisons and standard Levi subgroups over coefficient fields. Spaces of
  Langlands parameters, Weil–Deligne parameters and the moduli of L-parameters are not part of this
  roadmap; neither is Shapiro's lemma comparing parameters of a Weil restriction with those of the
  original group, nor the dual embedding `Ĝ ↪ Ĝ̃` of a z-extension as a morphism of `ℤ`-group
  schemes.

The associated-parahoric interface in RG2.3 is restricted to central surjections. The following
constructions lie outside this roadmap:

- `associatedParahoricAdjoint`: association for arbitrary identified adjoint groups, independence
  of central lifts, and the corresponding morphism and composition API. The source for association
  is [Kisin–Zhou], §2.3.1, arXiv v2 pp. 11–12. The retained `associatedParahoric` uses the apartment
  map of a specified central surjection.
- `r-smooth-torus`: the closure in the restriction of scalars of a non-affine lft Néron model,
  R-smoothness of tori and centralizers, and its independence and base-change criteria
  ([Kisin–Zhou], §2.4.2, Def. 2.4.3, p. 13; [Kisin–Pappas–Zhou], §2.1.4, arXiv v3 p. 11).
  The R-smoothness criteria and Néron closed-immersion
  results of Lem. 2.4.4 and Prop. 2.4.6, pp. 13–14, are also outside the scope. The lft,
  finite-type and connected Néron models themselves remain in RG2.3.2.
- `centralExtension_exact_rSmooth`: the smooth schematic kernel, its components and fppf exact
  sequence for an R-smooth torus kernel ([Kisin–Zhou], §2.4.12, Prop. 2.4.13 and proof,
  pp. 17–18). The split-kernel specialization `centralExtension_exact_split` remains in RG2.3.4.
- `fixer_closedImmersion_of_rSmooth`: fixer immersions under a closed immersion inducing an
  isomorphism of derived groups, and under finite separable field extension ([Kisin–Zhou],
  §2.4.7, Prop. 2.4.8, §2.4.9 and Prop. 2.4.10, pp. 15–16). The latter proposition imposes
  `p > 2`; Prop. 2.4.8 and Prop. 2.4.13 do not. The R-smoothness and Hodge-intersection
  consequences in [Kisin–Pappas–Zhou], Lems. 7.2.11 and 7.2.13, arXiv v3 pp. 84–85,
  are outside the scope as well.

Types for tame groups (Adler–Roche forms and tameness of tori), z-embeddings and central pushouts
`G ×_Z T`, and the identification of the affine Grassmannian embeddings of Zhu are deliberately not
here; they belong to later roadmaps which cite RG2.2–RG2.5.

Six Tau Ceti roadmaps are cited by layer. The Reductive groups roadmap supplies the functor of
points and the three-way dictionary (layer 0), Lie algebras and the adjoint representation
(layer 2), identity components, quotients and exact sequences (layer 3), character modules of groups
of multiplicative type (layer 4; their Galois action is layer 7), unipotent radicals (layer 5),
reductivity and semisimplicity with simply connected covers and central isogenies (layer 6), the
structure theory (layer 7) and the pinned Chevalley–Demazure group schemes over `ℤ` with their
isomorphism theorem (layer 9). The Local fields and ramification roadmap supplies finite extensions
and the extension of the valuation (layer 0), the maximal unramified extension with its Frobenius
(layer 2), and tame ramification (layer 3). The Modular curves roadmap, layer 0F, supplies the
affine finitely presented Hom scheme along a finite locally free map, which RG2.0a extends to
arbitrary affine targets. On finitely presented targets, identify the representing object
and point adjunction with that Hom-scheme supplier by Yoneda, compatibly with base change,
rather than introducing a second Hom-scheme carrier. Its layer 4D supplies strict henselisation. The Root systems roadmap supplies Coxeter combinatorics for a general Coxeter system
(layer 3) and chambers with the fundamental domain (layer 4). The Profinite and pro-p groups
roadmap, layer 3, supplies pro-p groups, and the Class field theory roadmap, layer 9, the local Weil
group for the Weil form of the L-group.

## Conventions

Let `K` be a field complete (or henselian) for a nontrivial discrete valuation `ω` of rank one,
normalized by `ω(ϖ) = 1` for a uniformizer `ϖ`, with valuation ring `O`, maximal ideal `m` and
perfect residue field `κ`. In Lean this is the class `ModelField K`: `ValuativeRel.IsDiscrete`,
`IsNontrivial` and `IsRankLeOne`, a henselian valuation ring and a perfect residue field
(`IsDiscrete` alone admits value groups such as `ℤ × ℤ` ordered lexicographically, for which no
normalized order to `ℤ` exists). The two instances used throughout are a nonarchimedean local field `E` (`κ` finite of
order `q`, `|ϖ| = q^{-1}`, `p = char κ`) and `L = Ĕ`, the completion of the maximal unramified
extension of `E` (residue field an algebraic closure of `κ`), with arithmetic Frobenius `σ` and
`E = L^σ`. `O^sh` is the strict henselization of `O`, `K^sh` its fraction field; `I` is the inertia
group. Mixed characteristic is assumed only where stated.

An affine group scheme over a commutative ring `R` is a commutative Hopf `R`-algebra `H`; its points
over an `R`-algebra `A` form the Tau Ceti convolution group `WithConv (H →ₐ[R] A)`, written `G(A)`.
Smoothness, connectedness and reductivity are hypotheses where stated, never assumptions on every
affine group. "Connected reductive over a field" is the predicate of the Reductive groups roadmap,
layer 6.

For a connected reductive `K`-group `G`: `S` is a maximal `K`-split torus, `Z = Z_G(S)` its
centralizer (the minimal Levi; a torus iff `G` is quasi-split), `N = N_G(S)`, `W_0 = N(K)/Z(K)` the
relative Weyl group, `Φ = Φ(G,S)` the relative root system (possibly non-reduced; `a` is multipliable
when `2a ∈ Φ`), `U_a` the root subgroups, and `V = X_*(S) ⊗ ℝ`. The apartment `A = A(G,S,K)` is an
affine space under `V`; its reduced version is the quotient by `V_Z = X_*(A_G) ⊗ ℝ`, where `A_G` is
the maximal split central torus. The torus valuation map is normalized by `⟨χ, v(z)⟩ = −ω(χ(z))` for
`χ ∈ X^*_K(Z)` and `z ∈ Z(K)`, and `z` acts on `A` by the translation `v(z)`; the Kottwitz
homomorphism of `G_m` is `ω` itself, so the two differ by a sign on split tori. A valuation of a root
datum is a family `φ = (φ_a)_{a ∈ Φ}` of functions `U_a(K) → ℝ ∪ {∞}` in the sense of Bruhat–Tits;
affine roots are the functions `a + k`; `U_{a,x}` is the filtration subgroup at `x ∈ A`.

The building `B(G,K)` is the enlarged building unless the reduced one is named; apartments are the
`G(K)`-translates of `A`. A parahoric subgroup is the group of integral points of the *connected*
Bruhat–Tits group scheme `𝒢°_F` of a facet `F` (over `E`: the `σ`-fixed points of the parahoric over
`L`); the fixer scheme `𝒢_F` and the stabilizer of `F` can be larger. Hyperspecial subgroups exist
only for unramified groups. Over `L`, `π₁(G) = X_*(T)/Q^∨` (Borovoi), `κ_G : G(L) → π₁(G)_I` is the
Kottwitz homomorphism, and the Iwahori–Weyl group is `W̃ = N(K)/Z(K)_0` with `Z(K)_0` the unique
parahoric subgroup of `Z(K)`. The length function on `W̃` is zero exactly on the stabilizer `Ω` of
the base alcove.

The dual group `Ĝ` is the pinned split reductive group over `ℤ` whose based root datum is the flip
of that of `G`, and `ᴸG = Ĝ ⋊ Γ` with `Γ` acting through pinned automorphisms with finite image. No
square root of `q` is part of the integral dual data; the normalizations of Satake transforms are
coefficient choices of the consumers.

Source locators give the theorem or section and the page; for arXiv versions the page numbers are
those of the stated arXiv version, for Numdam scans those printed in the journal. Derivations from a
source's special case are identified as such, with their hypotheses; a statement that no cited
source proves and that is not derived here is not part of the roadmap.

The unvalued core refines ReductiveGroups layer 7, “Root datum … relative root system”.
RG2 owns the shared
`AlgebraicRelativeRoots` declarations: `Character`, `Cocharacter`, `characterValue`, `adjoint`,
`weightSpace`, `Root`, `centralizer`, `normalizer`, `centralizerIdeal` and `rootRayPoints`.
`BruhatTits.GeometricRoots` and AA's `Reduction.GeometricRoots` are abbreviations of these
carriers and operations. Their implementation belongs in an unvalued algebraic-group
module refining ReductiveGroups layer 7, so adelic users can import it without buildings.
RG2 adds valuations and buildings; AA adds the positive system,
`a_P`, logarithms and reduction theory. `RelativeRootData.rootEquiv` is the identity on
characters between the finite enumeration and the shared subtype of nonzero adjoint weights.
`Reduction.localModulus_eq_rg2` equates the local factors on the identical `Root S` and
`weightSpace S χ`, with no independently chosen root indices.

## Exact supplier contracts

| Object | Exact supplier | File |
| --- | --- | --- |
| Dual pairing and double flip | `RootPairing.flip`, `RootPairing.flip_flip` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` |
| Dual base and support | `RootPairing.Base.flip`, `RootPairing.Base.flip_support` | `Mathlib/LinearAlgebra/RootSystem/Base.lean` |
| Points of the dual torus | `TauCeti.DiagonalizableGroup.pointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Basic.lean` |
| L-group projection, inclusion, section, multiplication | `SemidirectProduct.rightHom`, `SemidirectProduct.inl`, `SemidirectProduct.inr`, `SemidirectProduct.mul_left` | `Mathlib/GroupTheory/SemidirectProduct.lean` |
| Projection surjectivity and kernel | `SemidirectProduct.rightHom_surjective`, `SemidirectProduct.range_inl_eq_ker_rightHom` | `Mathlib/GroupTheory/SemidirectProduct.lean` |
| Section and split product | `SemidirectProduct.rightHom_comp_inr`, `SemidirectProduct.mulEquivProd` | `Mathlib/GroupTheory/SemidirectProduct.lean` |
| Norm on units | `TauCeti.Algebra.normUnits`, `TauCeti.Algebra.coe_normUnits` | `TauCeti/RingTheory/Norm/Units.lean` |
| Completion of a uniform space and its dense inclusion | `UniformSpace.Completion`, `UniformSpace.Completion.denseRange_coe` | `Mathlib/Topology/UniformSpace/Completion.lean` |
| Extension of a continuous ring automorphism to completion | `UniformSpace.Completion.mapRingEquiv` | `Mathlib/Topology/Algebra/UniformRing.lean` |
| Valuation comparison on completion | `UniformSpace.Completion.coe_vle_coe_iff` | `Mathlib/Topology/Algebra/ValuativeRel/Completion.lean` |
| Maximal unramified extension, its adjoin presentation and its Frobenius | `TauCeti.maximalUnramifiedExtension`, `TauCeti.maximalUnramifiedExtension_eq_adjoin`, `TauCeti.maximalUnramifiedFrobenius`, `TauCeti.eq_maximalUnramifiedFrobenius_iff`, `TauCeti.fixedField_zpowers_maximalUnramifiedFrobenius` | `TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean` |
| Points of a closed subgroup given by a Hopf ideal | `TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, `TauCeti.CommHopfAlgCat.mem_quotientPointsSubgroup_iff` | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Basic.lean` |
| Adjoint action on counit derivations | `Derivation.adDerivation` | `TauCeti/Algebra/AlgebraicGroup/Tangent/Adjoint.lean` |
| Maps of points along Hopf maps and coefficient maps | `TauCeti.AlgHom.mapDomain`, `TauCeti.AlgHom.mapValue` | `TauCeti/Algebra/AlgebraicGroup/Hopf/Map.lean`, `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean` |
| Points after base change | `TauCeti.AlgHom.baseChangePointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/BaseChange/Basic.lean` |
| Root groups of `GL_n` and their conjugation by the diagonal torus | `TauCeti.transvectionHom`, `TauCeti.diagGL_mul_transvectionUnit_mul_inv` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean` |
| Diagonal torus and root subgroups of `GL_n` | `TauCeti.GeneralLinear.diagonalTorusDefiningIdeal`, `TauCeti.GeneralLinear.isMaximalTorus_diagonalTorusDefiningIdeal`, `TauCeti.GeneralLinear.DiagonalRootIndex`, `TauCeti.GeneralLinear.rootSubgroup` | `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/DiagonalTorus/Maximal.lean`, `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Root/Datum.lean`, `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Root/Subgroup.lean` |
| Extension of a valuative relation and the decomposition group | `ValuativeExtension`, `ValuationSubring.decompositionSubgroup` | `Mathlib/RingTheory/Valuation/ValuativeRel/Basic.lean`, `Mathlib/RingTheory/Valuation/RamificationGroup.lean` |
| Coinvariants of a representation and quotient representations | `Representation.Coinvariants`, `Representation.quotientToCoinvariants`, `Representation.quotient` | `Mathlib/RepresentationTheory/Coinvariants.lean`, `Mathlib/RepresentationTheory/Basic.lean` |
| Induced maps of quotient groups | `QuotientGroup.map` | `Mathlib/GroupTheory/QuotientGroup/Defs.lean` |
| Modular character of a locally compact group | `MeasureTheory.Measure.modularCharacter` | `Mathlib/MeasureTheory/Group/ModularCharacter.lean` |

`NormTorus.norm` differs from the units norm by swapping `k' ⊗[k] R` to `R ⊗[k] k'`
before taking the norm over `R`. The affine point topology here allows general topological
coefficient rings, whereas `TauCeti.Toric.affinePointTopology` in
`TauCeti/Geometry/Toric/Analytic/AffinePoint.lean` concerns complex points of affine toric varieties.
`Model.closure` in `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Closure.lean`
is specific to curve models; it does not supply the general affine Hopf-ideal closure in RG2.3.

The following interfaces use Tau Ceti objects at the pin or an explicit presentation of them.
`MaxUnramifiedCompletion.Unramified` abbreviates
`TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`, whose presentation is supplied by
`TauCeti.maximalUnramifiedExtension_eq_adjoin`, and `unramifiedFrobenius` is
`TauCeti.maximalUnramifiedFrobenius` on it (`TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean`).
Scalar extension of a Hopf ideal uses `TauCeti.CommHopfAlgCat.baseChangeHopfIdeal` and
`TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_toIdeal`
(`TauCeti/Algebra/AlgebraicGroup/HopfIdeal/BaseChange.lean`). The derived subgroup uses
`TauCeti.CommHopfAlgCat.derivedDefiningIdeal`,
`TauCeti.CommHopfAlgCat.commutator_mem_derivedPointsSubgroup` and
`TauCeti.CommHopfAlgCat.derivedDefiningIdeal_eq_augmentation_iff_isCocomm`
(`TauCeti/Algebra/AlgebraicGroup/Derived/Basic.lean`). These modules are imported directly.
`SchematicClosure.closureIdeal` at the zero ideal is `TauCeti.scalarTorsionIdeal`, with Hopf form
`TauCeti.HopfIdeal.scalarTorsion` (`TauCeti/RingTheory/Ideal/ScalarTorsion.lean`,
`TauCeti/Algebra/HopfAlgebra/HopfIdeal/ScalarTorsion.lean`). `IntegralModel.SmoothModel.IsReductive`
is the two-fibre form of `TauCeti.reductiveCommHopfAlgPropertyOver`
(`TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean`). Contraction by a cocharacter is membership
in the imported `TauCeti.Cocharacter.unipotent`, with `TauCeti.Cocharacter.mem_unipotent_iff`
and `TauCeti.Cocharacter.unipotent_eq_bot`
(`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`),
and the torus of `GLBuilding.standardData` is `TauCeti.GeneralLinear.diagonalTorusDefiningIdeal`.
`BruhatTits.IsMinuscule` is the root-pairing condition on an arbitrary coweight, whereas
`TauCeti.IsMinuscule` (`TauCeti/Algebra/Lie/HighestWeight/Minuscule.lean`) concerns dominant weights.


The integral chamber, dominance cone and Weyl vector use `TauCeti.dominantChamber`
(`TauCeti/LinearAlgebra/RootSystem/Chamber.lean`),
`TauCeti.existsUnique_mem_orbit_inter_dominantChamber_of_finite_weylGroup`
(`TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean`), `TauCeti.posRootCone`
(`TauCeti/LinearAlgebra/RootSystem/Positive.lean`) and `TauCeti.twoWeylVector`
(`TauCeti/LinearAlgebra/RootSystem/Weyl/Vector.lean`), applied to the flipped pairing and a base.

### From Mathlib

Mathlib supplies nonarchimedean local fields with their valuative relation and the compactness of
closed balls (`IsNonarchimedeanLocalField`, `IsNonarchimedeanLocalField.isCompact_closedBall`,
`Valuation`), henselian rings, topological groups and open subgroups (`OpenSubgroup`), module
topologies (`IsModuleTopology`), uniform completions (`UniformSpace.Completion`), Witt vectors
(`WittVector.isDiscreteValuationRing`, `FractionRing (WittVector p k)`,
`WittVector.FractionRing.frobenius`), the continuity of polynomial evaluation
(`MvPolynomial.continuous_eval`), the units embedding `Units.isEmbedding_embedProduct` and the
determinant criterion `Matrix.isUnit_iff_isUnit_det`, the algebra categories `CommAlgCat` and
`CommHopfAlgCat`, representability (`CategoryTheory.Functor.RepresentableBy`), tensor products of
algebras (`Algebra.TensorProduct.map`, `Algebra.TensorProduct.basis`, `Algebra.TensorProduct.assoc`,
`Algebra.TensorProduct.cancelBaseChange`), duals (`Module.Dual`), finiteness and smoothness of
algebras (`Algebra.FiniteType`, `Algebra.FinitePresentation`, `Algebra.FormallySmooth`,
`Algebra.Smooth`, `Algebra.FormallyEtale.equivPiOfIsSepClosed`,
`Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`), norms (`Algebra.norm`,
`Algebra.norm_eq_matrix_det`, `AlgHom.card`), ideals (`Ideal.comap`), schemes and their morphism
properties (`AlgebraicGeometry.Scheme`), root pairings with their Weyl groups, bases and flips
(`RootPairing`, `RootPairing.IsReduced`, `RootPairing.Aut`, `RootPairing.flip`,
`RootPairing.Base.flip`, `RootPairing.Base.flip_support`, `RootPairing.flip_flip`), Coxeter
systems with length (`CoxeterSystem`, `CoxeterSystem.length`, `CoxeterSystem.length_inv`,
`CoxeterSystem.length_simple_mul`), double cosets (`DoubleCoset.Quotient`, `DoubleCoset.mk`,
`DoubleCoset.doubleCoset`), subgroup indices and complements (`Subgroup.index`, `Subgroup.relIndex`,
`Subgroup.IsComplement'`, `Subgroup.quotient_finite_of_isOpen'`), quotient groups
(`QuotientGroup.mk'`, `QuotientGroup.lift`), semidirect products (`SemidirectProduct`,
`SemidirectProduct.rightHom`, `SemidirectProduct.rightHom_surjective`,
`SemidirectProduct.range_inl_eq_ker_rightHom`, `SemidirectProduct.map`, `SemidirectProduct.inr`,
`SemidirectProduct.mulEquivProd`), amalgamated products (`Monoid.PushoutI`), Haar measures
(`MeasureTheory.Measure.haar`, `MeasureTheory.Measure.IsHaarMeasure`,
`MeasureTheory.Measure.IsMulRightInvariant`), lattices in modules over a DVR
(`Submodule.IsLattice`), Smith normal form (`Module.Basis.SmithNormalForm`), trees
(`SimpleGraph.IsTree`), absolute Galois groups (`Field.absoluteGaloisGroup`), and group cohomology
with Hilbert 90 (`groupCohomology`, `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`).
Each of these is assumed in its Mathlib form; the roadmap defines no copy of any of them.

### From Tau Ceti

Tau Ceti supplies commutative Hopf algebras as affine group schemes with their convolution groups of
points and points functors (`TauCeti.AlgHom.instGroup`, `TauCeti.HopfAlgebra.pointsFunctor`), the
general linear, special linear and multiplicative groups with their point comparisons
(`TauCeti.GeneralLinear.pointsMulEquiv`, `TauCeti.SpecialLinear.pointsMulEquiv`,
`TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra`
(`TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean`),
`TauCeti.MultiplicativeGroup.pointsMulEquiv`,
`TauCeti.GeneralLinear.instSmoothCoordinateHopfAlgebra`,
`TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`,
`TauCeti.GeneralLinear.diagonalRootDatum`,
`TauCeti.GeneralLinear.commutatorElement_rootSubgroupPoints`, `TauCeti.Symplectic.diagonalTorus`,
`TauCeti.GL2NonSplitTorusHom`), split tori and diagonalizable groups with their character lattices
and pairings (`TauCeti.SplitTorus.pointsMulEquiv`, `TauCeti.DiagonalizableGroup.pointsMulEquiv`,
`TauCeti.DiagonalizableGroup.pairing`, `TauCeti.CommHopfAlgCat.geometricCharacterGroup`,
`TauCeti.CommHopfAlgCat.centerGroupScheme`), Hopf ideals (`TauCeti.HopfIdeal`), smoothness and
reductivity predicates (`TauCeti.smoothCommHopfAlgProperty`, `TauCeti.reductiveCommHopfAlgProperty`,
`TauCeti.torusCommHopfAlgProperty`, `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`), the
unipotent radical (`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical`), the centre, faithfully flat
descent of points (`TauCeti.AlgHom.faithfullyFlatDescentMulEquiv`), the normalized valuation and
unit filtration of a local field (`TauCeti.unitFiltration`,
`unitFiltrationGradedSuccEquivResidueField`, `relIndex_unitFiltration_succ_succ`,
`unitFiltration_one_isProP`), and pro-p groups (`TauCeti.IsProP`). Tau Ceti also has the
maximal unramified extension of a local field with its Frobenius
(`TauCeti.maximalUnramifiedExtension`, `TauCeti.maximalUnramifiedFrobenius`), pinnings of split
groups (`TauCeti.Pinning`), Borel subgroups (`TauCeti.IsBorel`), dynamic parabolic subgroups with
their Levi decompositions (`TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`), central
isogenies (`TauCeti.CommHopfAlgCat.IsCentralIsogeny`), simply connected semisimple groups, root-datum isogenies
(`TauCeti.RootPairingIsogeny`), the flip of a based root pairing (`RootPairing.Base.flipSupportEquiv`),
Tits systems with the Bruhat decomposition (`TauCeti.TitsSystem`,
`TauCeti.TitsSystem.bruhatCells_eq_univ`, `TitsSystem.bruhatCell_mul_eq_of_wordLength_le`,
`bruhatCell_mul_eq_union_of_wordLength_lt`), the Bruhat order on a Coxeter system
(`CoxeterSystem.BruhatLE`, `bruhatPartialOrder`, `BruhatLE.length_lt_of_ne`,
`CoxeterSystem.IsMinimalCosetRep`, `existsUnique_isMinimalCosetRep_mul`), double-coset
decompositions (`DoubleCoset.doubleCoset_eq_iUnion_leftCosets`,
`doubleCoset_eq_iUnion_rightCosets`), dominant chambers (`dominantChamber`,
`existsUnique_mem_orbit_inter_dominantChamber_of_finite_weylGroup`, `posRootCone`,
`twoWeylVector`), norms on units (`Algebra.normUnits`), the toric point topology
(`Toric.affinePointTopology`) and flat closures over a DVR (`Model.closure`,
`HopfIdeal.scalarTorsion`). This roadmap extends those objects; the few targets that restate one
of them through its points or an explicit presentation are listed after the supplier table, each
with the Tau Ceti object it equals.

### From TauCetiRoadmap.ReductiveGroups

Layer 0 is assumed for the functor of points and the three-way dictionary between Hopf algebras,
group schemes and group functors; layer 2 for Lie algebras and the adjoint representation (used by
the congruence quotients of RG2.0 and the Moy–Prasad lattices of RG2.3); layer 3 for identity
components, quotients and exact sequences; layer 4 for character modules of groups of
multiplicative type; layer 5 for unipotent radicals; layer 6 for the predicates "connected
reductive", "semisimple", "simply connected" and for central isogenies; layer 7 for the structure
theory over a field — maximal split tori `S`, `Z = Z_G(S)`, `N`, the relative root system
`Φ(G,S)`, the root subgroups `U_a`, parabolic and Levi subgroups, the absolute root datum with its
Galois action, the Bruhat decomposition and BN-pairs; layer 9 for the pinned Chevalley–Demazure
group schemes over `ℤ` and the isomorphism theorem for pinned groups. The valued theory here
consumes these objects; RG2.1.2 states from the coordinate Hopf algebra the maximal split torus,
relative roots, root subgroups, coroots, centralizer, normalizer and absolute root datum that it
uses, without their structure theory; no parabolic is defined, and the dual group of RG2.5 is
layer 9's Chevalley–Demazure construction applied to the flipped based root datum.

### From TauCetiRoadmap.LocalFieldsRamification

Layer 0 supplies finite extensions of a local field and the extension of the valuation; layer 2
the maximal unramified extension with its Frobenius (which RG2.0 completes to `Ĕ`); layer 3 tame
ramification, used for the tame descent of buildings, quasi-tame groups and the
tame realization of stabilizers.

### From TauCetiRoadmap.ModularCurves

Layer 0F supplies the affine finitely presented Hom scheme along a finite locally free map; for
finitely presented `A'` it is RG2.0a's `(Res A', universal)`, with `finitePresentation_res`
(RG2.0a *weil-restriction-representing-algebra*); layer 4D supplies strict henselisation.

### From TauCetiRoadmap.RepresentationTheory.RootSystems

Layer 3 supplies Coxeter combinatorics for a general Coxeter system (lengths, reduced words,
parabolic subgroups), used for the affine Weyl group and the Iwahori–Weyl group; layer 4 supplies
chambers with the fundamental domain, used for facets, special points and dominance.

### From TauCetiRoadmap.ProfiniteProPGroups and TauCetiRoadmap.ClassFieldTheory

ProfiniteProPGroups layer 3 supplies pro-p groups, for the pro-p property of congruence subgroups and
positive-depth Moy–Prasad subgroups. ClassFieldTheory layer 9 supplies the local Weil group `W_K`
with its map to `Γ_K`, for the Weil form of the L-group.

## How to read the build

`README.md` specifies the mathematics; `Suggested.lean` gives Lean declarations and examples. A
statement marked README-only has no Lean signature; every other target names its Lean declaration,
and every Check names the Lean `example` that mirrors it (the comment `-- Test` followed by the
Check's name), or says why it has none. Read each construction with its stated hypotheses and the
supplier contracts above. RG2.0 gives the topologies on rational points, integral points and
congruence subgroups, and the field `Ĕ`. RG2.0a gives Weil restriction of affine schemes and groups
along finite locally free maps, norm tori and the Deligne torus. RG2.1 gives root data in a group,
valuations, apartments, affine roots and the affine Weyl group, and the arithmetic invariants
`π₁(G)`, z-extensions and the Kottwitz homomorphism. RG2.2 gives the Bruhat–Tits building with its
axioms, metric, fixed points, facets and fixers, unramified and tame descent, functoriality for
finite extensions, central surjections, Levi inclusions and twisted Levi subgroups, the
lattice-chain models and the tree of `SL_2`. RG2.3 gives smooth affine and reductive models, Néron models of tori, Bruhat–Tits
and parahoric group schemes, hyperspecial vertices, Moy–Prasad filtrations, Lang's theorem and level
subgroups. RG2.4 gives the Iwahori–Weyl group, the Iwahori–Bruhat, Cartan and Iwasawa
decompositions, double cosets, indices, admissible sets and unimodularity. RG2.5 gives the dual
based root datum, the Langlands dual group over `ℤ`, its Galois action, the L-group and its
functoriality. Each *Needs:* line identifies mathematical inputs by name or supplier layer.

## Layer RG2.0: topologies on rational points

The point topology on `X(R)` is defined for every topological ring `R` and every affine scheme
`X = Spec A` over a base ring `k` as the coarsest topology making all coordinate evaluations
continuous; for schemes it is glued over affine charts when `R` is a local topological ring whose
units are open and whose inversion is continuous on the units. For a nonarchimedean local field `E`
it makes `G(E)` a Hausdorff, totally disconnected topological group, locally compact and second
countable when `G` is of finite type, makes the integral points of an affine model of finite type a
compact open subset, and makes the congruence subgroups of a finite-type model a neighbourhood basis
of the identity. The layer also constructs the completion `Ĕ` of the maximal unramified extension
with its Frobenius. AdelicAlgebraicGroups AA.0–AA.1 and the smooth-representation and Shimura-level
consumers use these objects under these names: the evaluation topology on `WithConv (H →ₐ[E] R)`
(`PointTopology.instTopologicalSpaceWithConv`), the instances `T2Space`, `TotallyDisconnectedSpace`,
`LocallyCompactSpace` and `SecondCountableTopology` on the local points of a Hopf algebra (the last
two for a Hopf algebra of finite type), `PointTopology.isTopologicalGroup`, the compact open integral
points (`PointTopology.isOpenEmbedding_integralPoints`, `compactSpace_integralPoints`) and the
congruence subgroups `CongruenceSubgroup.subgroup`. Two traps shape the statements. The unit group of
a topological ring with the subspace topology need not be a topological group, so `G_m(R)` carries
the hyperbola topology `xy = 1`; over `ℚ_p` it agrees with the subspace topology (`units_hyperbola`),
and the failure over the adeles is the AdelicAlgebraicGroups check `AdelicPoints.not_product_topology`.
And `GL_n(O)` is the group of integral matrices with unit determinant, not the integral matrices with
nonzero determinant (`generalLinear_integral_iff_det`, `diag_uniformizer_not_integral`).

### RG2.0.1 the point topology

**The topology on points of an affine algebra.** (*affine-point-topology*) Let `A` be a commutative
`k`-algebra and `R` a topological `k`-algebra, with no finiteness and no Hausdorff hypothesis on
either. The point topology on `X(R) = Hom_k(A, R)` is the coarsest topology for which every
evaluation `ev_a : f ↦ f(a)` is continuous, that is, the subspace topology from `R^A`; on
`WithConv (A →ₐ[k] R)` it is transported along `ofConv`. In `PointTopology`, define `topology` as this
initial topology of all `ev_a` on `Hom_k(A, R)` and `instTopologicalSpaceWithConv` as the topology on
`WithConv` induced by `ofConv`; for `R` a topological ring prove `continuous_eval` (every `ev_a` is
continuous), `continuous_iff` (a map `g` into `Hom_k(A, R)` is continuous iff every `ev_a ∘ g` is),
`isEmbedding_toPi` (`f ↦ ⇑f : Hom_k(A, R) → (A → R)` is an embedding) and `isHomeomorph_ofConv`
(`ofConv` is a homeomorphism). [Conrad], Prop. 2.1, p. 2, characterizes this topology for
finite-type algebras over the coefficient ring itself; since `Hom_k(A, R) = Hom_R(R ⊗_k A, R)`, the
four statements above are immediate from the definition for any `k` and `A`. *Needs:*
ReductiveGroups layer 0; Mathlib `MvPolynomial.continuous_eval`.

**Checks.**

- `polynomial_homeomorph` — for `A = k[t]`, `f ↦ f(t)` is a homeomorphism `Hom_k(k[t], R) ≅ R`.
- `pi_compat` — the point topology is the topology induced from Mathlib's product topology on
  `A → R` (proved).
- `discrete_of_discrete` — for `R` discrete and `A` of finite type, `Hom_k(A, R)` is discrete.
- `not_discrete_infinite` (non-example) — without finite type this fails:
  `Hom_{𝔽₂}(𝔽₂[x₀, x₁, …], 𝔽₂)` is the product space `𝔽₂^ℕ`, which is not discrete.
- `units_hyperbola` — `Hom_ℤ(ℤ[t, t⁻¹], ℚ_p) → ℚ_p`, `f ↦ f(t)`, is an embedding: on
  `G_m(ℚ_p) = ℚ_p^×` the hyperbola topology is the subspace topology, because inversion is continuous
  on `ℚ_p^×` ([Conrad], §3, pp. 3–4).

**Presentations give embeddings into affine space.** (*affine-point-topology-embedding*) Let `R` be a
topological `k`-algebra. For a generating family `(a_i)_{i∈I}` of `A`, the map `x ↦ (x(a_i))_i` embeds
`Hom_k(A, R)` in `R^I` (`isEmbedding_eval_generators`). If `R` is T1 and `I` is finite, the embedding
is closed, its image being the common zero locus of the kernel of `k[t_i] ↠ A`
(`isClosedEmbedding_eval_generators`); so the point topology is the topology induced by any finite
presentation. If `R` is Hausdorff and locally compact and `A` is of finite type, then `Hom_k(A, R)` is
locally compact (`locallyCompactSpace_of_finiteType`) ([Conrad], Prop. 2.1 and its proof, pp. 2–3).
*Needs:* *affine-point-topology*; Mathlib `MvPolynomial.continuous_eval`.

**Functoriality of the point topology.** (*affine-point-topology-functoriality*) Let `R` be a
topological `k`-algebra. (1) A `k`-algebra map `φ : B → A` induces a continuous map
`Hom(A, R) → Hom(B, R)` (`continuous_comap`), a closed embedding when `φ` is onto and `R` is T1
(`isClosedEmbedding_comap_of_surjective`). (2) A continuous `k`-algebra map `ψ : R → R'` of
topological rings induces a continuous map `Hom(A, R) → Hom(A, R')` (`continuous_map_codomain`). It is
an embedding when `ψ` is (`isEmbedding_map_codomain`), a closed embedding when `ψ` is
(`isClosedEmbedding_map_codomain`), and an open embedding when `ψ` is and `A` is of finite type
(`isOpenEmbedding_map_codomain`). (3) Restriction to the two factors is a homeomorphism
`Hom_k(A ⊗_k B, R) ≅ Hom_k(A, R) × Hom_k(B, R)` (`isHomeomorph_tensorProduct`), and for a
`k'`-algebra `R` with compatible `k`-structure, restriction along `A → k' ⊗_k A` is a homeomorphism
`Hom_{k'}(k' ⊗_k A, R) ≅ Hom_k(A, R)` (`isHomeomorph_baseChange`). For `R` T1 and `k`-algebra maps
`C → A`, `C → B`, (1) and (3) identify `Hom_k(A ⊗_C B, R)` with the closed subspace
`Hom(A, R) ×_{Hom(C, R)} Hom(B, R)` of `Hom(A, R) × Hom(B, R)`, since `A ⊗_C B` is a quotient of
`A ⊗_k B` ([Conrad], Prop. 2.1 and its proof, pp. 2–3; [Conrad], Ex. 2.2, p. 3, states (2) for `A` of
finite type, and the same argument with `R^A` in place of `R^n` gives the embedding and closed
embedding cases for every `A`). *Needs:* *affine-point-topology*; *affine-point-topology-embedding*.

**Localizations give open embeddings.** (*affine-point-topology-open-immersion*) Let `R` be a
topological `k`-algebra such that `R^×` is open in `R` and inversion is continuous on the subspace
`{r ∈ R : IsUnit r}`. For `f ∈ A`, the map `Hom_k(A_f, R) → Hom_k(A, R)` is an open embedding
(`isOpenEmbedding_localization`); for every `R` its image is `{x : x(f) ∈ R^×}`
(`range_comp_localization`). Both hypotheses are needed: for `A = k[t]` and `f = t` the map is the
inclusion `R^× → R`, which is an embedding only if inversion is continuous on `R^×` and has open
image only if `R^×` is open; over the adeles both fail ([Conrad], §3 and proof of Prop. 3.1,
pp. 3–4). *Needs:* *affine-point-topology-functoriality*.

**The topology on points of a scheme.** (*scheme-point-topology*) Let `R` be a local topological
`k`-algebra with `R^×` open and inversion continuous on `R^×`, and let `X` be a `k`-scheme with
structure map `f : X → Spec k`. `SchemePointTopology.Points f R` consists of the maps `Spec R → X`
whose composite with `f` is the map induced by `k → R`, and `affinePoint` sends a `k`-algebra map
`A → R` to the corresponding point of `Spec A`. In `SchemePointTopology`, define `topology` as the
finest topology on `X(R)` for which the chart map `U(R) → X(R)` is continuous for every affine open
`U`, where `U(R) ≅ Hom_k(Γ(U), R)` carries its affine point topology; this makes sense for every
local `R`. Every `R`-point lands in an affine open `U` containing the image of the closed point, so
`X(R) = ⋃_U U(R)`; when `R^×` is open with continuous inversion the charts are open embeddings, so
`topology` is the unique topology for which each `U(R)` is an open subspace carrying its affine
point topology, and every theorem about it assumes these two properties. Prove
`isOpenEmbedding_affineOpen`
(`U(R) → X(R)` is an open embedding for every affine open `U`), `iUnion_affineOpens` (every `R`-point
factors through an affine open) and `affine_eq` (for `X = Spec A`, `affinePoint` is a homeomorphism
from `Hom_k(A, R)` with the affine point topology onto `X(R)`) ([Conrad], Prop. 3.1 and its proof,
p. 4, for schemes locally of finite type over the coefficient ring itself; `X(R)` over `k` is
`(X ×_k Spec R)(R)` over `R`, and the gluing step, that an affine open of an affine scheme is covered
by basic opens of both, uses only `isOpenEmbedding_localization` and so needs no finiteness). *Needs:*
*affine-point-topology-open-immersion*; Mathlib `AlgebraicGeometry.Scheme`.

**Checks.**

- `basePoint_unique` — `Spec k` has exactly one `R`-point over itself.
- `emptyScheme` — the empty scheme has no points over a local ring (a local ring is nonzero, so
  `Spec R` is nonempty).
- `affineLine` — on the affine line `Spec k[t]`, `r ↦ affinePoint (t ↦ r)` is a homeomorphism
  `R ≅ 𝔸¹(R)`; this is the normalization of [Conrad], Prop. 3.1.
- `conjugation_not_over_complex` (non-example) — complex conjugation induces an endomorphism of
  `Spec ℂ` that fails the base condition of `Points (𝟙 (Spec ℂ)) ℂ`, because `Spec.map` is injective
  and conjugation sends `i` to `−i` while the identity sends `i` to `i` (proved).
- `affinePoint_bijective` — for every `k`-algebra `R`, `affinePoint : Hom_k(A, R) → (Spec A)(R)` is a
  bijection, by the full faithfulness of `Spec` (proved).
- `affinePoint_comp` — for `ψ : A → B` and `φ : B → R`, the point `φ ∘ ψ` of `Spec A` is the point `φ`
  of `Spec B` followed by `Spec ψ` (proved).
- `discrete_of_locallyOfFiniteType` — for a discrete local ring `R` (both hypotheses on units hold)
  and `X` locally of finite type over `k`, `X(R)` is discrete: each `U(R)` is discrete by
  `discrete_of_discrete` and open; without finite type it fails already for affine `X`
  (`not_discrete_infinite`).

**Functoriality of the scheme point topology.** (*scheme-point-topology-functoriality*) For `R` as
above: a morphism over `Spec k` induces a continuous map `X(R) → Y(R)` (`continuous_map`); an open
immersion induces an open embedding (`isOpenEmbedding_of_isOpenImmersion`); a closed immersion
induces a closed embedding when `R` is Hausdorff (`isClosedEmbedding_of_isClosedImmersion`); if `X` is
separated over `k` and `R` is Hausdorff, then `X(R)` is Hausdorff (`t2Space_of_isSeparated`); and if
`X` is locally of finite type over `k` and `R` is Hausdorff and locally compact, then `X(R)` is
locally compact (`locallyCompactSpace_of_locallyOfFiniteType`) ([Conrad], Prop. 3.1, p. 4; closedness
for closed immersions follows from the affine case, [Conrad], Prop. 2.1, p. 2, on an affine cover).
*Needs:* *scheme-point-topology*; *affine-point-topology-functoriality*.

### RG2.0.2 local fields: the topological group of points

**Points over a local field are locally compact and Hausdorff.** (*points-locally-compact-hausdorff*)
Let `E` be a nonarchimedean local field with valuation ring `O = 𝒪[E]`. For `X` separated and locally
of finite type over `E`, `X(E)` is Hausdorff and locally compact
(`SchemePointTopology.locallyCompactSpace_of_localField`). For an affine group `G = Spec H` over `E`,
`G(E)` is a subspace of the Hausdorff, totally disconnected space `E^H`, hence Hausdorff and totally
disconnected (`PointTopology.instT2SpaceLocal`, `instTotallyDisconnectedSpaceLocal`); when `H` is of
finite type, `G(E)` is closed in some `E^n`, hence locally compact and second countable
(`instLocallyCompactSpaceLocal`, `instSecondCountableTopologyLocal`). For `A` of finite type over `O`,
`Hom_O(A, O)` is compact (`compactSpace_integralPoints`), being closed in `O^n`; and since `O` is a
compact Hausdorff local ring with open units and continuous inversion, `𝒳(O)` is locally compact for
every `O`-scheme `𝒳` locally of finite type (`locallyCompactSpace_of_locallyOfFiniteType` with
`R = O`) ([Conrad], Prop. 2.1, p. 2; Prop. 3.1 and Rem. 3.2, p. 4; total disconnectedness is
inherited from `E^H` and second countability from `E^n`). *Needs:*
*scheme-point-topology-functoriality*; *affine-point-topology-embedding*; Mathlib
`IsNonarchimedeanLocalField`, `IsNonarchimedeanLocalField.isCompact_closedBall`.

**Checks.**

- `real_units_not_totallyDisconnected` (non-example) — the local-field hypothesis of
  `instTotallyDisconnectedSpaceLocal` is needed: over `ℝ` the points of `G_m` form `ℝ^×`, which
  contains the connected half-line of positive reals.
- `compactSpace_of_isProper` — for `X` proper over `E`, `X(E)` is compact ([Conrad], proof of
  Prop. 4.4, p. 11, applied to `X → Spec E`; Cor. 5.6, p. 16); since the projective line is covered
  by two affine lines whose spaces of points `E` are not compact, this distinguishes the glued
  topology from a disjoint union of charts.

**The topological group of rational points.** (*points-topological-group*) For a topological
`k`-algebra `R`, with no Hausdorff hypothesis, `G(R) = WithConv (H →ₐ[k] R)` is a topological group
(`PointTopology.isTopologicalGroup`; over `E` this is the instance `instIsTopologicalGroupLocal`). A
Hopf map `H' → H` and a continuous `k`-algebra map `R → R'` induce continuous homomorphisms
`G(R) → G'(R)` and `G(R) → G(R')`: precomposition with a map of Hopf algebras preserves the
convolution product, postcomposition is the homomorphism `TauCeti.AlgHom.mapValue`, and both are
continuous by `continuous_comap`, `continuous_map_codomain` and `isHomeomorph_ofConv` ([Conrad],
Prop. 2.1 and the discussion after it, p. 2). *Needs:*
*affine-point-topology-functoriality*; *points-locally-compact-hausdorff*; Tau Ceti
`TauCeti.AlgHom.instGroup`, `TauCeti.HopfAlgebra.pointsFunctor`.

**Smooth morphisms are open on local points.** (*smooth-morphism-open-map*) Let `E` be a
nonarchimedean local field and `g : X → Y` a smooth morphism of `E`-schemes with `Y` locally of finite
type. Then `X(E) → Y(E)` is open (`SchemePointTopology.isOpenMap_of_smooth`) ([Conrad], §4, the
paragraph before Thm 4.5, p. 11, which treats any field complete for a nontrivial absolute value). In
particular, for a smooth homomorphism `G → G'` of affine finite-type `E`-groups the image of `G(E)` is
an open subgroup of `G'(E)`, and compact open subgroups of `G(E)` map to compact open subgroups of
`G'(E)`. *Needs:* *scheme-point-topology-functoriality*; *points-topological-group*.

### RG2.0.3 integral points and congruence subgroups

**Integral points of an affine model are compact open.** (*integral-points-compact-open*) Let
`O = 𝒪[E]`, let `A` be a finitely generated `O`-algebra and `𝒳 = Spec A`, so that
`X(E) := Hom_O(A, E) = Hom_E(A ⊗_O E, E)` are the `E`-points of the generic fibre. Then
`𝒳(O) = Hom_O(A, O) → X(E)` is an open embedding (`isOpenEmbedding_integralPoints`) with compact source
(`compactSpace_integralPoints`), hence a closed embedding as well, `X(E)` being Hausdorff. For every
`O`-algebra `A`, finitely generated or not, its image is the set of `x` with `x(a) ∈ O` for all
`a ∈ A`, equivalently for all `a` in a generating family (`range_integralPoints`). For an affine
finite-type `O`-group `𝒢 = Spec H`, the map is the group homomorphism
`TauCeti.AlgHom.mapValue (Algebra.ofId O E)`, so `𝒢(O)` is a compact open subgroup of `G(E)`
([Conrad], Ex. 2.3, p. 3, for openness and closedness; compactness because `𝒳(O)` is closed in `O^n`,
[Conrad], Prop. 2.1, p. 2). *Needs:* *affine-point-topology-functoriality*;
*affine-point-topology-embedding*; Mathlib `IsNonarchimedeanLocalField`,
`IsNonarchimedeanLocalField.isCompact_closedBall`.

**GL_n: point topology equals the units topology.** (*general-linear-points-homeomorphism*) For a
topological commutative `k`-algebra `R` and `n ≥ 0`, `generalLinearPointsHomeomorph n` is a
homeomorphism, with underlying map Tau Ceti's `TauCeti.GeneralLinear.pointsMulEquiv`
(`generalLinearPointsHomeomorph_apply`), from the `GL_n` points with the point topology to
`GL (Fin n) R` with the units topology of `M_n(R)`, that is, the topology induced by `g ↦ (g, g^{-1})`.
Over `O = 𝒪[E]`, a matrix of `M_n(E)` comes from a point of `GL_n` over `O` exactly when it has
integral entries and its determinant is a unit of `O`; `diag(ϖ, 1)` has integral entries and nonzero
determinant but does not ([Conrad], §3, p. 3 (`G_m` as the hyperbola `xy = 1`); [Conrad], Ex. 2.3,
p. 3; the determinant criterion is Mathlib's `Matrix.isUnit_iff_isUnit_det`). *Needs:*
*points-topological-group*; *integral-points-compact-open*; Tau Ceti
`TauCeti.GeneralLinear.pointsMulEquiv`; Mathlib `Units.isEmbedding_embedProduct`,
`Matrix.isUnit_iff_isUnit_det`.

**Checks.**

- `generalLinear_integral_iff_det` — `g ∈ M_n(E)` is the image of a point of `GL_n` over `O` iff
  `g` is the image of some `M ∈ M_n(O)` with `det M ∈ O^×`.
- `diag_uniformizer_not_integral` (non-example) — `diag(ϖ, 1) ∈ M_2(O)` has nonzero determinant but
  is not a point of `GL_2` over `O`, since `ϖ ∉ O^×` (proved).
- `generalLinearPointsHomeomorph_isOpenEmbedding` — over `E`, where inversion on `E^×` is continuous,
  `x ↦ generalLinearPointsHomeomorph n x ∈ M_n(E)` is an open embedding: the units topology of
  `GL_n(E)` is the subspace topology of the open subset `GL_n(E) = {det ≠ 0}` of `M_n(E)`.
- `generalLinearPointsHomeomorph_adeles_not_embedding` (non-example) — the target carries the units
  topology, not the subspace topology of `M_n(R)`: for `n = 1` and `R = 𝔸_ℚ` the injective map
  `GL_1(𝔸_ℚ) → M_1(𝔸_ℚ)` is not an embedding, inversion on `𝔸_ℚ^×` being discontinuous for the
  subspace topology ([Conrad], §3, pp. 3–4).

**Congruence subgroups of an integral group model.** (*congruence-subgroup*) Let `E` be a
nonarchimedean local field, `O = 𝒪[E]` with maximal ideal `m`, and `𝒢 = Spec H` an affine `O`-group.
For `n ≥ 0` put `𝒢(O)_n := ker(𝒢(O) → 𝒢(O/m^n))`. In `CongruenceSubgroup`, define `subgroup` as
`𝒢(O)_n ⊂ 𝒢(O)`, the kernel of the homomorphism `TauCeti.AlgHom.mapValue` of the quotient map
`O → O/m^n`; prove `mem_iff` (`x ∈ 𝒢(O)_n` iff `x` and the identity point agree modulo `m^n`),
`normal` (`𝒢(O)_n` is normal in `𝒢(O)`), `antitone` (`n ≤ n'` implies `𝒢(O)_{n'} ≤ 𝒢(O)_n`),
`zero_eq_top` (`𝒢(O)_0 = 𝒢(O)`), `isOpen` (for `H` of finite type, `𝒢(O)_n` is open in `𝒢(O)`, hence
in `G(E)` by `isOpenEmbedding_integralPoints`) and `map` (an `O`-algebra map `H' → H` compatible with
the counits, for instance the Hopf map of a homomorphism `𝒢 → 𝒢'`, carries `𝒢(O)_n` into
`𝒢'(O)_n`). These follow from the definition (`mem_iff`, `normal`, `antitone` and `zero_eq_top`
are proved): `𝒢(O)_n` is the kernel of a group homomorphism,
`m^{n'} ⊆ m^n` for `n ≤ n'`, `m^0 = O`, and for `H` of finite type membership is a congruence on
finitely many generators ([Platonov–Rapinchuk–Rapinchuk], §3.1, p. 126, and §3.3, (3.15), p. 160,
for `𝒢 ⊂ GL_n` in characteristic zero). *Needs:* *integral-points-compact-open*; Tau Ceti
`TauCeti.AlgHom.mapValue`, `TauCeti.HopfAlgebra.pointsFunctor`, `TauCeti.unitFiltration`.

**Checks.**

- `generalLinear_eq` — for `GL_d` over `O`, `𝒢(O)_n` corresponds under `pointsMulEquiv` to
  `{g ∈ GL_d(O) : g ≡ 1 mod m^n}`.
- `multiplicative_eq_unitFiltration` — for `G_m` over `O` and every `n ≥ 0`, `𝒢(O)_n` corresponds
  under `TauCeti.MultiplicativeGroup.pointsMulEquiv` to Tau Ceti's `TauCeti.unitFiltration E n`; for
  `n = 0` both are `O^×`.
- `iInf_eq_bot` — `⋂_n 𝒢(O)_n = 1`, because `⋂_n m^n = 0`.
- `diagonal_mem_first_not_second` (non-example) — `diag(1 + ϖ, 1) ∈ 𝒢(O)_1 \ 𝒢(O)_2` for `GL_2`, so
  `𝒢(O)_1 ≠ 𝒢(O)_2`.

**Congruence subgroups form a neighbourhood basis.** (*congruence-neighbourhood-basis*) For `𝒢 = Spec H`
affine of finite type over `O`, the `𝒢(O)_n` form a neighbourhood basis of `1` in `𝒢(O)`
(`hasBasis_nhds_one`), hence in `G(E)`, and `𝒢(O)_1` is pro-`p` for the residue characteristic `p`
in the sense of Tau Ceti's `TauCeti.IsProP` (`isProP_one`). Consequently `G(E)` is locally profinite,
every compact open `K ⊂ G(E)` contains some `𝒢(O)_n` with finite index, and `[K : K'] < ∞` for every
compact open `K' ⊂ K`; any finite-type `O`-model of `G` may be used. The basis property is the
coordinate description of the topology of `𝒢(O) ⊂ O^N` by finitely many generators. For pro-`p`:
for `n ≥ 1` a point of `𝒢(O/m^{n+1})` reducing to `1` is `ε + D` with `D` an `ε`-derivation into the
square-zero ideal `m^n/m^{n+1}`, and these points form a group isomorphic to the additive group of
such derivations, which is killed by `p`; so each `𝒢(O)_n/𝒢(O)_{n+1}`, `n ≥ 1`, is killed by `p`
([Platonov–Rapinchuk–Rapinchuk], §3.1, p. 126, for the basis and Lem. 3.38, p. 160, for pro-`p`, both
for `𝒢 ⊂ GL_n` in characteristic zero; [Milne AG], 12.5, pp. 184–185, for the description of the
kernel of `G(k[ε]) → G(k)` by derivations over a field). *Needs:* *congruence-subgroup*;
*points-topological-group*; *affine-point-topology-embedding*; Tau Ceti `TauCeti.IsProP`.

**Checks.**

- `not_isProP_zero_generalLinear` (non-example) — the level `1` is needed: `𝒢(O)_0 = GL_2(O)` is not
  pro-`p`, since its open normal subgroup `𝒢(O)_1` has quotient `GL_2(κ)`, of order
  `q(q − 1)(q² − 1)`, which is not a power of `p`.

**Congruence quotients of smooth models.** (*smooth-model-congruence-quotients*) Let `𝒢 = Spec H` be a
smooth affine `O`-group, where `O = 𝒪[E]` has residue field `κ` of order `q`, and let `I = ker ε` be
the augmentation ideal. For `n ≥ 1`, `𝒢(O)_n/𝒢(O)_{n+1}` has `q^d` elements, where `d` is the rank of
the free `O`-module `I/I²` (`natCard_quotient_succ`); `d` is also the dimension of `Lie(𝒢_κ)`. Indeed
the quotient is the group `Hom_O(I/I², m^n/m^{n+1}) ≅ Lie(𝒢_κ) ⊗_κ m^n/m^{n+1}` of
`ε`-derivations described in *congruence-neighbourhood-basis* ([Milne AG], 12.5, pp. 184–185, for
the field case `k[ε] → k`, applied here to the square-zero extension `O/m^{n+1} → O/m^n`), and every
point of `𝒢(O/m^{n+1})`
reducing to `1` lifts to `𝒢(O)` because `𝒢` is smooth and `O` is complete (Mathlib
`Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`). The same lifting identifies
`𝒢(O)/𝒢(O)_1` with `𝒢_κ(κ)`; the surjectivity of `𝒢(O) → 𝒢(κ)` is stated in RG2.3 as
`Lang.smoothModel_reduction_surjective`. *Needs:*
*congruence-neighbourhood-basis*; Mathlib `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`,
`IsNonarchimedeanLocalField`; ReductiveGroups layer 2; ProfiniteProPGroups layer 3.

**Checks.**

- `natCard_quotient_zero_multiplicative` (non-example) — the hypothesis `n ≥ 1` is needed: for `G_m`,
  where `d = 1`, the quotient `𝒢(O)_0/𝒢(O)_1 ≅ κ^×` has `q − 1` elements, not `q`.

### RG2.0.4 the completed maximal unramified extension

**The completed maximal unramified extension Ĕ.** (*completed-maximal-unramified-extension*) Let `E` be
a nonarchimedean local field whose residue field has `q` elements, with uniformizer `ϖ`. In
`MaxUnramifiedCompletion`, `Unramified E` is the intermediate field of `AlgebraicClosure E` generated
by the roots of `X^(q^n) − X` for `n > 0`; by `TauCeti.maximalUnramifiedExtension_eq_adjoin` it is
`TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`. Its valuation is the unique extension of
that of `E` (`unramifiedValuativeRel`, `unramifiedValuativeExtension`) and supplies its uniformity.
`Breve E`, written `Ĕ`, is the uniform completion `UniformSpace.Completion (Unramified E)`; it is
complete, and its valuation is discrete and nontrivial (`breveIsDiscrete`, `breveIsNontrivial`).
`unramifiedFrobenius` sends each root `ζ` of `X^(q^n) − X` to `ζ^q` (`TauCeti.maximalUnramifiedFrobenius_apply_of_pow_natCard_pow_eq_self`), so
it is an abbreviation for `TauCeti.maximalUnramifiedFrobenius E
(AlgebraicClosure E)`; `frobenius`, written `σ`, is its extension to `Ĕ` through
`UniformSpace.Completion.mapRingEquiv`, with `frobenius_coe` (it extends `unramifiedFrobenius`) and
`continuous_frobenius`. Prove `frobenius_congr` (`σ(x) − x^q ∈ m_Ĕ` for `x ∈ O_Ĕ`),
`fixedPoints_frobenius` (`{x ∈ Ĕ : σ x = x}` is the image of `E`), `residueField_isAlgClosed` (the
residue field of `Ĕ` is algebraically closed), `isUniformizer_algebraMap` (a uniformizer of `E`
remains one of `Ĕ`), `isClosedEmbedding_algebraMap` (`E` is a closed subfield of `Ĕ`) and, for `E` of
characteristic zero, `transcendenceDegree_infinite` (`Ĕ` has infinite transcendence degree over `E`).
Since the valuation of `Ĕ` restricts to that of `E`, `fixedPoints_frobenius` also gives
`O_Ĕ^σ = O_E`. Sources: [He 2018], §4.3, p. 12, in the setting of §1.1, p. 5, a nonarchimedean local
field of any characteristic (the field `Ĕ`, its residue field an algebraic closure of `κ`, the
Frobenius `σ`, and `G(E) = G(Ĕ)^σ` for connected reductive `G`, which for `G = G_m` is `Ĕ^σ = E`);
[Kottwitz 1997], 1.1, pp. 257–258; [Chen], §1, p. 730, for `E = ℚ_p` (`Ĕ = W(F̄_p)[1/p]` with its
Frobenius), and Prop. 2.0.3 with its proof, pp. 734–735 (infinite transcendence degree of `Q̆_p` over
`ℚ_p`; a finite extension `E` of `ℚ_p` is algebraic over `ℚ_p`, so the same holds over `E`).
`frobenius_congr` follows from `TauCeti.maximalUnramifiedFrobenius_apply_of_pow_natCard_pow_eq_self`, since every integer of `Unramified E` is
congruent modulo the maximal ideal to a root of some `X^(q^n) − X`, and passes to `Ĕ` by continuity;
`isUniformizer_algebraMap` holds because every finite subextension of `Unramified E` over `E` is
unramified and completion does not change the value group. *Needs:* Mathlib `UniformSpace.Completion`,
`IsNonarchimedeanLocalField`, `WittVector.isDiscreteValuationRing`, `WittVector.FractionRing.frobenius`;
LocalFieldsRamification layer 0; LocalFieldsRamification layer 2; Tau Ceti
`TauCeti.maximalUnramifiedExtension`, `TauCeti.maximalUnramifiedFrobenius`.

**Checks.**

- `unramified_no_sqrt_uniformizer` (non-example) — `ϖ` has no square root in `Unramified E`, so
  `Unramified E` is not the algebraic closure.
- `unramifiedFrobenius_seventh_roots` — residue characteristic `2`: over `ℚ₂`, where `q = 2`, a
  primitive seventh root of unity `ζ` exists in `Unramified ℚ₂` (a root of `X^8 − X` of degree `3`)
  and `unramifiedFrobenius ζ = ζ^2 ≠ ζ^4`; geometric Frobenius would give `ζ^4`.
- `unramifiedFrobenius_fixed` — the elements of `Unramified E` fixed by `unramifiedFrobenius` are
  those of `E` (Tau Ceti `TauCeti.fixedField_zpowers_maximalUnramifiedFrobenius`).
- `unramifiedFrobenius_congr` — on the integers of `Unramified E`, `unramifiedFrobenius x ≡ x^q`
  modulo the maximal ideal: Frobenius reduces to the `q`-th power map of the residue field.
- `completion_dense` — the canonical map `Unramified E → Ĕ` has dense range (Mathlib
  `UniformSpace.Completion.denseRange_coe`; proved).
- `completion_valuation` — the valuation of `Ĕ` restricts to that of `Unramified E` (Mathlib
  `UniformSpace.Completion.coe_vle_coe_iff`; proved).
- `complete` — `Ĕ` is complete; this is the `CompleteSpace` instance of `UniformSpace.Completion`
  (proved).
- `frobenius_two_terms` — for a root `ζ` of `X^(q^n) − X`, `σ(ζ) = ζ^q` and `σ^{-1}(ζ^q) = ζ`
  (proved). This fixes the arithmetic normalization: geometric Frobenius sends a root of `X^(q³) − X`
  of degree `3` over `E` to `ζ^(q²) ≠ ζ^q`.
- `frobenius_ne_one` — `σ` is not the identity: it moves every root of `X^(q²) − X` that does not
  lie in `E`.
- `padic_witt` — for `E = ℚ_p` there is a ring isomorphism `Ĕ ≅ Frac W(F̄_p)` carrying `σ` to the
  Witt-vector Frobenius and `O_Ĕ` onto `W(F̄_p)`.
- `ramificationIndex_one` (non-example) — `ϖ` has no square root in `Ĕ`, as it would have valuation
  `ω = 1/2`; in particular `Ĕ` contains no ramified quadratic extension `E(√ϖ)`.
- `not_algebraic` (non-example, in every characteristic) — `Ĕ` is not algebraic over `E`, so it is not
  `Unramified E` itself.

**Rational points as Frobenius fixed points.** (*frobenius-fixed-points-of-points*) For every
`E`-algebra `A`, `σ` acts on `X(Ĕ) = Hom_E(A, Ĕ)` by `x ↦ σ ∘ x`, continuously for the point topology
(`continuous_map_codomain` with `continuous_frobenius`), and `X(E) = X(Ĕ)^σ` (`points_eq_fixedPoints`),
where `X(E) → X(Ĕ)` is a closed embedding (`isClosedEmbedding_map_codomain` with
`isClosedEmbedding_algebraMap`). For an affine group `G = Spec H`, `x ↦ σ ∘ x` is the group
automorphism `TauCeti.AlgHom.mapValue σ` of `G(Ĕ)`, so `G(E) = G(Ĕ)^σ` as topological groups. For an
`O_E`-algebra `A_O`, an `O_E`-algebra map `A_O → Ĕ` with values in `O_Ĕ` that is fixed by `σ` has
values in `O_E`, because `O_Ĕ^σ = O_E` ([He 2018], §4.3, p. 12, for connected reductive `G`; for
general `A` the statement follows from `fixedPoints_frobenius` applied to the values `x(a)`).
*Needs:* *completed-maximal-unramified-extension*; *affine-point-topology-functoriality*;
*points-topological-group*.

### Examples

The worked examples of this layer are its checks: the affine line `Hom_k(k[t], R) ≅ R` and its
scheme version, the product topology on points and its failure to be discrete without finite type,
the hyperbola topology on `G_m(ℚ_p)`, `GL_n(O)` as the integral matrices of unit determinant with
`diag(ϖ, 1)` outside it, the congruence subgroups of `GL_d` and of `G_m` against Tau Ceti's unit
filtration, the arithmetic normalization of Frobenius on roots of `X^(q^n) − X` (computed on the
seventh roots of unity over `ℚ₂`), and `Ĕ ≅ Frac W(F̄_p)` for `E = ℚ_p`.

### Dependencies

Mathlib and Tau Ceti as listed in the supplier contracts; ReductiveGroups layers 0 and 2;
LocalFieldsRamification layers 0 and 2; ProfiniteProPGroups layer 3.

## Layer RG2.0a: Weil restriction and the Deligne torus

Restriction of scalars along a finite locally free ring map `k → k'` is defined on affine
`k'`-schemes by its functor of points `R ↦ Hom_{k'}(A', k' ⊗_k R)`, represented by an explicit
`k`-algebra built from the dual of `k'` over `k`; finite type and finite presentation are inherited.
Restriction of scalars of non-affine schemes (for instance of the lft Néron models of RG2.3) lies
outside this roadmap. The layer proves the adjunction with base change, compatibility with products,
composition and base change, transport of Hopf structures, the splitting over a separable
extension, the preservation and reflection of reductivity for finite separable field extensions,
the points of Weil-restricted split tori, norm-one tori, the compatibility of the point topology
with RG2.0, Weil restriction of integral points, Edixhoven's tame fixed-point theorem, and the
Deligne torus `S = Res_{ℂ/ℝ} G_m` with its weight and norm conventions. AdelicAlgebraicGroups AA.1
and the Shimura-datum consumers import the functor `WeilRestriction.functor`, the representing
algebra `WeilRestriction.Res`, the point adjunction `WeilRestriction.homEquiv`, the Hopf algebra
`WeilRestriction.ResHopf` with its Hopf structure `WeilRestriction.instHopfAlgebraRes`, point
comparison `WeilRestriction.pointsMulEquiv` and functoriality `WeilRestriction.mapHopf`, and the
Deligne torus from here.

### RG2.0a.1 the functor and its representing algebra

**The Weil restriction functor of an affine scheme.** (*weil-restriction-functor*) Let `k → k'` be a
ring map, `A'` a `k'`-algebra and `X' = Spec A'`. The Weil restriction `Res_{k'/k}(X')` is the functor
`R ↦ Hom_{k'}(A', k' ⊗_k R) = X'(k' ⊗_k R)` on commutative `k`-algebras, contravariant in `A'`; it is
representable by an affine `k`-scheme when `k → k'` is finite locally free, and representability is
needed only there. In `WeilRestriction`, define `functor` as the functor `CommAlgCat k ⥤ Type`,
`R ↦ (A' →ₐ[k'] k' ⊗[k] R)`, and `functorMap` (a map `φ : B' → A'` induces
`functor A' ⟶ functor B'`, `x ↦ x ∘ φ`); prove `functor_obj` (`obj R = (A' →ₐ[k'] k' ⊗[k] R)`
definitionally), `functor_map_apply` (`(map f) x = (id ⊗ f) ∘ x`) and `functorMap_app`
(`x ↦ x ∘ φ`). Its base change along `k → l` is recorded on the representing algebra
(see *weil-restriction-base-change*) ([Stacks], Section 97.11 (Tag 05Y8), definition of
`Res_{Z/B}(X)`, and Proposition 97.11.5 (Tag 05YF), representability by an algebraic space for
`Z → B` finite locally free; [Bruhat–Tits II], 1.5.2, pp. 26–27; [Milne AG], 2.35–2.36, p. 50).
*Needs:* ReductiveGroups layer 0; Mathlib `CommAlgCat`, `Algebra.TensorProduct.map`.

**Checks.**

- `functor_affineLine` — for `A' = k'[t]`, the points over `R` correspond to `k' ⊗_k R` via `x ↦
  x(t)`.
- `functor_trivial_extension` — for `k' = k` the points over `R` are `Hom_k(A', R)`, through
  `k ⊗_k R ≅ R`.
- `functor_not_base_change` (non-example) — for `k = ℝ`, `k' = ℂ`, `A' = ℂ[t]`, the representing
  algebra is not `ℝ[t]`: `Res_{ℂ/ℝ} 𝔸¹` is the affine plane, not the affine line.
- `functor_empty` — for `A' = 0` (the empty scheme) there are no points over `R` as soon as
  `k' ⊗_k R ≠ 0`.
- `functorMap_id` — the identity of `A'` induces the identity of `functor A'`.
- `functorMap_origin` — the `k'`-point `t ↦ 0` of the line, `k'[t] → k'`, induces on points the map
  from the one-point scheme to the line with value the origin, `t ↦ 0`.
- `functorMap_units_injective` — the open immersion `G_m ⊂ 𝔸¹`, `k'[t] → k'[t, t⁻¹]`, induces an
  injection on points.

**The representing algebra of a Weil restriction.** (*weil-restriction-representing-algebra*) For
`k → k'` finite locally free and any `A'`, there is a `k`-algebra `Res_{k'/k} A'` with a `k'`-map
`u : A' → k' ⊗_k Res A'` such that `φ ↦ (id ⊗ φ) ∘ u` is a bijection
`Hom_k(Res A', R) ≅ Hom_{k'}(A', k' ⊗_k R)` natural in `R`; the pair is unique up to unique
isomorphism. Construction: write `A' = Sym_{k'}(k' ⊗_k M)/I` for a free `k`-module `M`, and put
`Res A' = Sym_k((k')^∨ ⊗_k M)/I^♮`, where `(k')^∨ = Hom_k(k', k)`,
`I^♮ = ((λ ⊗ id)(j(x)) : λ ∈ (k')^∨, x ∈ I)` and `j : Sym_{k'}(k' ⊗ M) → k' ⊗_k Sym_k((k')^∨ ⊗ M)`
is the universal map; for `k'` free with basis `(b_i)` and `A' = k'[X_1, …, X_n]/(P_1, …, P_q)` this
is `k[Y_{ij}]` modulo the `b`-coordinates of the `P_t(∑_i b_i Y_{i1}, …, ∑_i b_i Y_{in})`. In
`WeilRestriction`, define `Res` as the representing `k`-algebra `Res_{k'/k} A'` (no property of the
type is asserted when `k'` is not finite projective over `k`), `universal` as the universal `k'`-map
`u : A' → k' ⊗_k Res A'` (for `k → k'` finite locally free) and `map` (a map `φ : B' → A'` induces
`Res B' → Res A'`, the map classifying `u ∘ φ`); prove `homEquiv`
(`Hom_k(Res A', R) ≃ Hom_{k'}(A', k' ⊗_k R)`), `homEquiv_apply` (`homEquiv φ = (id ⊗ φ) ∘ u`),
`homEquiv_naturality` (`homEquiv` is natural in `R`), `map_id`, `homEquiv_comp_map` (`homEquiv` is
natural in `A'`; this is the local target name), `hom_ext` (two maps `Res A' → R` are equal if they agree via `homEquiv`) and
`basisPresentation` (for a basis `b` of `k'` over `k`, `Res k'[X_1, …, X_n] ≃ k[Y_{ij}]` with
`u(X_j) = ∑_i b_i ⊗ Y_{ij}`) ([Bruhat–Tits II], 1.5.1–1.5.7 and 1.5.10, pp. 26–29). For `A'`
finitely presented, `(Res A', u)` represents the affine Hom scheme of ModularCurves layer 0F. Tau
Ceti commits later than the pinned one contain that case as `TauCeti.Algebra.WeilRestriction`
(`TauCeti/RingTheory/WeilRestriction.lean`), with `universalPoint`, `homEquiv`,
`hom_ext`, `instFinitePresentation` and `baseChangeAlgEquiv`; at such a pin the finitely presented
case of `Res`, `universal`, `homEquiv`, `homEquiv_naturality`, `hom_ext`, `finitePresentation_res`
and `baseChangeEquiv` is that API, and the targets here differ by allowing any `A'`. *Needs:*
*weil-restriction-functor*; ModularCurves layer 0F; Mathlib
`CategoryTheory.Functor.RepresentableBy`, `Algebra.TensorProduct.basis`, `Module.Dual`.

**Checks.**

- `res_affineLine_free` — for `k'` free of rank `d` with a basis, `Res_{k'/k}(k'[t]) ≃ MvPolynomial
  (Fin d) k`.
- `res_self` — `Res_{k/k} A' ≃ A'`.
- `res_split_extension` — for `k' = k × k` and `A' = (k × k) ⊗_k B`, `Res A' ≃ B ⊗_k B`: the
  restriction of `X ⊔ X` along `Spec k ⊔ Spec k → Spec k` is `X × X`.
- `res_zero_extension` — for `k' = 0`, `Res A' ≃ k`: every functor value is a point.
- `res_zero_algebra` — for `k'` faithfully flat over `k`, `Res` of the zero algebra is the zero
  ring; for `k' = 0` it is `k`, so the hypothesis is needed.
- `res_units_complex` — `Res_{ℂ/ℝ} ℂ[t, t⁻¹] ≃ ℝ[x, y][(x² + y²)⁻¹]`, the norm form of `ℂ/ℝ` in
  the basis `1, i` being inverted ([Bruhat–Tits II], 1.5.13, p. 30).
- `res_not_flat` (non-example) — over `O = ℤ_p`, `O' = O[ε]/(ε²)` is finite free and
  `A' = O'[x]/(x² − pε)` is free over `O'`, but `Res A' = O[a, b]/(a², 2ab − p)` contains the nonzero
  `p`-torsion element `a`, so it is not flat over `O` (computed here; [Bruhat–Tits II], 1.5.8,
  p. 28, notes that flatness is not inherited even over a complete discrete valuation ring).
- `homEquiv_zero_extension` — for `k' = 0` the target `Hom(A', 0 ⊗_k R)` of `homEquiv` is a single
  point, so `Res A'` has at most one map to every `R`.
- `homEquiv_point` — through `homEquiv`, `Res_{k'/k} k'` has exactly one map to every `R`: the
  restriction of the point `Spec k'` is the point `Spec k`.
- `homEquiv_two_points_complex` — `Spec ℂ[t]/(t² + 1)` is two points over `ℂ`, and its restriction to
  `ℝ` has exactly two `ℝ`-points.
- `universal_trivial_extension` — for `k' = k`, the universal map read in `k ⊗_k Res A' ≅ Res A'` is
  an isomorphism `A' ≅ Res_{k/k} A'`.
- `universal_affineLine_complex` — in the `ℝ`-basis `1, i` of `ℂ`, the universal point of the line is
  `t ↦ 1 ⊗ x + i ⊗ y` for free coordinates `x, y` of `Res_{ℂ/ℝ} ℂ[t] ≅ ℝ[x, y]`.
- `universal_not_surjective_complex` (non-example) — for `ℂ/ℝ` the universal map of the line,
  `ℂ[t] → ℂ[x, y]`, `t ↦ x + iy`, is not surjective, unlike the case `k' = k`.

**Finiteness and coordinates of a Weil restriction.** (*weil-restriction-finiteness*) For `k → k'`
finite locally free, if `A'` is of finite type (resp. finitely presented) then so is `Res A'`
(`finiteType_res`, `finitePresentation_res`); for `k` noetherian finite type suffices. For `k'` free
of rank `d` with a basis, `Res k'[X_1, …, X_n] = k[Y_{ij}]` (`i ≤ d`, `j ≤ n`), a change of basis
being an invertible linear substitution, so `Res 𝔸^n_{k'} ≅ 𝔸^{nd}_k` (`basisPresentation`); and
`Res G_m` is the complement in `𝔸^d` of the hypersurface `N = 0`, `N` the norm form of `k'/k`
([Bruhat–Tits II], 1.5.8 and 1.5.10, pp. 28–29, and 1.5.13, p. 30; [Milne AG], proof of
Lem. 14.38, p. 238; [Harpaz–Wittenberg], §4, p. 15, for `Res G_m ⊂ Res 𝔸¹ ≅ 𝔸^d`). *Needs:*
*weil-restriction-representing-algebra*; Mathlib `Algebra.FiniteType`, `Algebra.FinitePresentation`,
`Algebra.norm_eq_matrix_det`.

**Base change, composition and products of Weil restrictions.** (*weil-restriction-base-change*)
For `k → k'` finite locally free there are isomorphisms respecting the universal maps:
(1) `baseChangeEquiv`, `l ⊗_k Res A' ≅ Res_{l'/l}(l' ⊗_{k'} A')` with `l' = l ⊗_k k'`, for any
`k`-algebra `l`; (2) `compEquiv`, `Res_{k'/k} Res_{k''/k'} A'' ≅ Res_{k''/k} A''` for `k''` finite
locally free over `k'`; (3) `tensorEquiv`, `Res(A' ⊗_{k'} B') ≅ Res A' ⊗_k Res B'`. Each is fixed by
its effect on points: `homEquiv_baseChangeEquiv` (the point of `A'` classified by
`g ∘ baseChangeEquiv` on `1 ⊗ Res A'` is the restriction to `A'` of the point classified by `g`,
read through `l' ⊗_l T ≅ k' ⊗_k T`), `homEquiv_compEquiv` (the two points of `A''` agree through
`k'' ⊗_{k'} (k' ⊗_k R) ≅ k'' ⊗_k R`) and `homEquiv_tensorEquiv` (the point of `A' ⊗ B'` is the
product of the points of the two factors). An isomorphism twisted by an automorphism of the target
satisfies the bare type and fails these statements ([Bruhat–Tits II], 1.5.3–1.5.4, p. 27;
[Milne AG], 2.38–2.41, p. 51). *Needs:* *weil-restriction-representing-algebra*; Mathlib
`Algebra.TensorProduct.cancelBaseChange`, `Algebra.TensorProduct.productMap`.

**Checks.**

- `baseChangeEquiv_natural` — `baseChangeEquiv` is natural in `A'`: for `φ : B' → A'` it
  intertwines `id_l ⊗ map φ` with `map (id_{l'} ⊗ φ)`.
- `baseChangeEquiv_complex_points` — for `ℂ/ℝ`, `l = ℂ` and `A' = ℂ[t]/(t² + 1)`, `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`
  makes `ℂ ⊗_ℝ Res A'` the restriction of two conjugate copies of `A'`, with `2 · 2 = 4` points
  over `ℂ`.
- `baseChangeEquiv_units_complex` — for `ℂ/ℝ` and `l = ℂ`, `ℂ ⊗_ℝ Res_{ℂ/ℝ} G_m ≅ G_m × G_m` over
  `ℂ`.
- `compEquiv_trivial_bottom` — for the tower `k → k → k''`, `compEquiv` composed with the
  isomorphism `B ≅ Res_{k/k} B` given by the universal map (`B = Res_{k''/k} A''`) is the identity.
- `compEquiv_trivial_top` — for the tower `k → k' → k'`, `compEquiv` composed with `map` of the
  isomorphism `A'' ≅ Res_{k'/k'} A''` is the identity.
- `compEquiv_natural` — `compEquiv` is natural in `A''`.
- `tensorEquiv_includeLeft` — the inclusion of `Res A'` in `Res A' ⊗_k Res B'` corresponds under
  `tensorEquiv` to `map` of the inclusion of `A'` in `A' ⊗_{k'} B'`; the twist of `tensorEquiv` by
  the swap of factors (for `A' = B'`) fails this.
- `tensorEquiv_includeRight` — the same for the inclusion of `Res B'`.
- `tensorEquiv_comm` — `tensorEquiv` is compatible with the commutativity of the tensor products on
  both sides.

**Weil restriction is adjoint to base change.** (*weil-restriction-adjunction*) For `k → k'` finite
locally free, `homEquiv` is a bijection `Hom_k(Res A', B) ≅ Hom_{k'}(A', k' ⊗_k B)` natural in `B`
(`homEquiv_naturality`) and in `A'` (`homEquiv_comp_map`): on algebras, `Res` is left adjoint to
`k' ⊗_k −`; on affine schemes, base change along `Spec k' → Spec k` is left adjoint to
`Res_{k'/k}`. In the scheme convention the counit is `u`, `(Res X')_{k'} → X'`, and the unit is
`adjunctionUnit : Res_{k'/k}(k' ⊗_k B) → B`, the map classifying the identity point, which is the
diagonal `X → Res_{k'/k}(X_{k'})`. Prove `adjunctionUnit_surjective`: for `k'` faithfully flat over
`k` the diagonal is a closed immersion ([Milne AG], 2.37–2.38, pp. 50–51; [Bruhat–Tits II], 1.5.11,
p. 29). *Needs:* *weil-restriction-representing-algebra*.

**Checks.**

- `adjunctionUnit_trivial_extension` — for `k' = k` the unit is an isomorphism.
- `adjunctionUnit_zero_extension` (non-example) — for `k' = 0` and `B = k[t]` over a nonzero `k`,
  the unit is `k → k[t]`, not surjective: faithful flatness is needed.
- `adjunctionUnit_not_injective_complex` (non-example) — for `ℂ/ℝ` and `B = ℝ[t]` the unit is
  `ℝ[x, y] → ℝ[t]`, `x ↦ t`, `y ↦ 0`: the diagonal `𝔸¹ → Res_{ℂ/ℝ} 𝔸¹_ℂ = 𝔸²`, `t ↦ (t, 0)`, is a
  closed immersion but not an isomorphism.

### RG2.0a.2 Weil restriction of group schemes

**Weil restriction of an affine group scheme.** (*weil-restriction-group-scheme*) For `k → k'` finite
locally free and `H'` a commutative Hopf `k'`-algebra (group `G'`), `Res_{k'/k} H'` is in a unique way
a commutative Hopf `k`-algebra such that `homEquiv : Res(G')(R) ≅ G'(k' ⊗_k R)` is a group
isomorphism for every `R`; it is natural in `R`, and Hopf maps induce Hopf maps. The points of
`Res G_m`, `Res GL_n` and `Res μ_n` are `(k' ⊗ R)^×`, `GL_n(k' ⊗ R)` and `μ_n(k' ⊗ R)` (the last is
the group `NormTorus.resRootsOfUnity`). In `WeilRestriction`, define `ResHopf` as the algebra `Res`
of `H'`, `instHopfAlgebraRes` as its commutative Hopf `k`-algebra structure, `resHopfAlgEquiv` as the
identity of `Res`, `pointsMulEquiv` (`Res(G')(R) ≃* G'(k' ⊗_k R)`, whose underlying bijection is
`homEquiv`, `pointsMulEquiv_apply`; its multiplicativity fixes the Hopf structure), `mapHopf` (the
Hopf map `Res H'_1 → Res H'_2` induced by a Hopf map, with underlying algebra map `map`,
`mapHopf_apply`), `multiplicativeGroupPoints` (`(Res G_m)(R) = (k' ⊗_k R)^×`), `generalLinearPoints`
(`(Res GL_n)(R) = GL_n(k' ⊗_k R)`) and `diagonal` (on points, `x ↦ id_{k'} ⊗ x` from `G(R)` to
`G_{k'}(k' ⊗_k R)`, the `R`-points of `Res_{k'/k}(G_{k'})`); prove `pointsMulEquiv_apply` and
`pointsMulEquiv_naturality`. The Hopf structure, point equivalence and Hopf morphism API
retain `[Module.Finite k k'] [Module.Projective k k']` as parameters. The underlying
`ResHopf` carrier alone is unconstrained outside this range ([Bruhat–Tits II], 1.5.4, p. 27; [Milne AG], 2.36, p. 50;
[Kaletha], §3.1, p. 10, for `Res μ_n`).
*Needs:* *weil-restriction-representing-algebra*; Tau Ceti `TauCeti.AlgHom.instGroup`,
`TauCeti.MultiplicativeGroup.pointsMulEquiv`, `TauCeti.GeneralLinear.pointsMulEquiv`; Mathlib
`CommHopfAlgCat`.

**Checks.**

- `WeilRestriction.pointsMulEquiv_complex` — the representing group equivalence exists over `ℝ → ℂ`.
- `WeilRestriction.pointsMulEquiv_finiteFreeRing` — it also exists over the finite free ring map
  `ℤ → ℤ × ℤ`, without a field assumption.
- `WeilRestriction.pointsMulEquiv_nonflat_rejected` — for prime `p`, `ZMod p` is not projective over `ℤ`;
  neither the representing point equivalence nor its Hopf instance can be synthesized.
  For the additive group a supposed unrestricted equivalence would inject its `p` points
  at `ℤ` into its single point at `ℚ`, since `𝔽_p ⊗_ℤ ℚ = 0`.
- `res_multiplicative_complex_points` — the `ℝ`-points of `Res_{ℂ/ℝ} G_m` form a group isomorphic to
  `ℂ^×`.
- `res_trivial_group` — `Res_{k'/k}` of the trivial Hopf algebra `k'` is the trivial Hopf algebra `k`.
- `res_not_commutative_of_commutative_base` (non-example) — `Res_{ℂ/ℝ} GL_2` is not commutative: its
  `ℝ`-points `GL_2(ℂ)` are nonabelian.
- `mapHopf_id` — the identity Hopf map induces the identity of `ResHopf`.
- `mapHopf_points` — on points, composing with `mapHopf φ` is composing with `φ`.
- `mapHopf_square` — the squaring map `t ↦ t²` of `G_m` induces the squaring map of
  `(k' ⊗_k R)^×`.
- `multiplicativeGroupPoints_apply` — the unit attached to a point of `Res G_m` is its value on the
  coordinate `t` of `G_m = Spec k'[t, t⁻¹]`.
- `multiplicativeGroupPoints_trivial_extension` — for `k' = k`, `(Res_{k/k} G_m)(R) ≅ R^×`.
- `generalLinearPoints_zero` — `GL_0` is trivial, so its restriction has one point over every `R`.
- `generalLinearPoints_complex` — the `ℝ`-points of `Res_{ℂ/ℝ} GL_2` are `GL_2(ℂ)`.
- `generalLinearPoints_one` — `GL_1 = G_m` through the determinant: `det` of the `1 × 1` matrix
  attached to a point of `Res GL_1` is a bijection onto `(k' ⊗_k R)^×`.

**Weil restriction preserves smoothness and closed immersions.**
(*weil-restriction-smoothness-and-immersions*) For `k → k'` finite locally free, `Res_{k'/k}`
preserves formal smoothness and smoothness of algebras (`formallySmooth_res`, `smooth_res`;
formal smoothness follows from the lifting criterion, as `k' ⊗_k −` keeps square-zero ideals
square-zero) and sends a surjection `B' → A'` (a closed immersion) to a surjection `Res B' → Res A'`
(`map_surjective`). For `k'/k` a finite separable field extension and `A'` of finite type,
`dim Res A' = [k' : k] dim A'` (`ringKrullDim_res`, derived from the splitting
*weil-restriction-separable-splitting*, since dimension does not change under field extension).
Separability is needed: for `k'/k` purely inseparable of degree `p`, say `k' = k(β^{1/p})`, and
`a ∈ k` not a `p`-th power in `k'`, the point `X' = Spec k'[x]/(x^p − a)` has
`Res X' = Spec k[c_0, …, c_{p−1}]/(∑_i β^i c_i^p − a)`, of dimension `p − 1`, because
`(∑_i β^{i/p} c_i)^p = ∑_i β^i c_i^p` in characteristic `p`. Flatness is not preserved
(`res_not_flat`) ([Bruhat–Tits II], 1.5.8–1.5.9, p. 28; the dimension formula and the inseparable
non-example are derived here). *Needs:* *weil-restriction-representing-algebra*;
*weil-restriction-finiteness*; Mathlib `Algebra.FormallySmooth`, `Algebra.Smooth`, `ringKrullDim`.

**Checks.**

- `res_dim_affineSpace` — for a finite field extension `k'/k` of degree `d`, `Res 𝔸^n_{k'}` has
  dimension `nd`.
- `res_point` — the restriction of the point `Spec k'[t]/(t)` is the point `Spec k`.
- `res_dim_inseparable` (non-example) — in the inseparable example above,
  `dim Res X' = p − 1 ≠ p · 0`.

**Splitting of a Weil restriction over a separable extension.** (*weil-restriction-separable-splitting*)
For `k'/k` a finite separable field extension and `Ω` a separably closed field containing `k`,
`splittingEquiv` identifies `(Res A')(Ω)` with the tuples indexed by the `k`-embeddings
`τ : k' → Ω` of `Ω`-points of `A'`, `Ω` being a `k'`-algebra through `τ`; `splittingEquiv_apply`
fixes the `τ`-component as `homEquiv x` followed by `c ⊗ ω ↦ τ(c) ω`. Over a field `Ω` containing
the normal closure of `k'/k` the same holds for algebras, `Ω ⊗_k Res_{k'/k} A' ≅ ⨂_τ (Ω ⊗_{k',τ} A')`,
that is `(Res X')_Ω ≅ ∏_τ X'_{τ,Ω}`, with `σ ∈ Aut(Ω/k)`, acting semilinearly, carrying the
`τ`-factor to the `στ`-factor ([Bruhat–Tits II], 1.5.14–1.5.16, pp. 30–31; [Milne AG], Lem. 14.39,
p. 238, for `G_m`). *Needs:* *weil-restriction-base-change*; Mathlib
`Algebra.FormallyEtale.equivPiOfIsSepClosed`, `AlgHom.card`, `Algebra.TensorProduct.productMap`.

**Checks.**

- `splittingEquiv_complex` — for `ℂ/ℝ` and `Ω = ℂ`, a point `x` with
  `homEquiv x (a) = 1 ⊗ α + i ⊗ β` has the value `α + iβ` at `a` in its component at the identity
  embedding and `α − iβ` in its component at complex conjugation.
- `splittingEquiv_galois` — an automorphism `σ` of `Ω` over `k` carries the `σ^{-1}τ`-component of
  a point to the `τ`-component of its image.
- `splittingEquiv_needs_sepClosed` (non-example) — over `Ω = ℝ` there is no `ℝ`-embedding `ℂ → ℝ`, so
  the tuples form a single point, while `Res_{ℂ/ℝ} 𝔸¹` has the `ℝ`-points `ℂ`.

**Weil restriction of reductive groups.** (*weil-restriction-descent-of-properties*) For `k'/k` a
finite separable field extension and `G'` affine of finite type over `k'`, `Res_{k'/k} G'` is
reductive if and only if `G'` is (`reductive_res_iff`, stated for a finite-type Hopf algebra with a
Hopf isomorphism to `ResHopf k k' H`); [Springer], §3.3, p. 12, gives reductivity of `Res G'` for
reductive `G'` together with its based root datum, and the converse is derived from the splitting
over a separable closure, where `Res G'` becomes the product of the conjugates of `G'`. For a purely
inseparable extension of degree `p`, `Res_{k'/k} G_m` is smooth, connected and commutative but not
reductive: its quotient by `G_m` is unipotent, of dimension `p − 1` since `Res G_m` has dimension
`p` ([Milne AG], 17.23, p. 296, and 22.153–22.154, pp. 426–427). *Needs:*
*weil-restriction-separable-splitting*; *weil-restriction-smoothness-and-immersions*; Tau Ceti
`TauCeti.reductiveCommHopfAlgProperty`; ReductiveGroups layer 6; ReductiveGroups layer 7.

**Character lattices of Weil-restricted tori.** (*weil-restriction-character-lattices*) For `k'/k`
finite separable and `D'` of multiplicative type over `k'` with character module `X^* = M'`,
`Res D'` is of multiplicative type with `X^* = Ind_{Γ_{k'}}^{Γ_k} M' = ℤ[Γ_k] ⊗_{ℤ[Γ_{k'}]} M'`; for
tori `X_*(Res T') ≅ Ind X_*(T')`, compatibly with the pairing. Hence
`X^*(Res G_m) = ℤ[Hom_k(k', k^sep)]` and `X^*(Res μ_n) = (ℤ/n)[Hom_k(k', k^sep)]`, permutation
modules ([Bruhat–Tits II], 1.5.17, pp. 31–32, and [Milne AG], Lem. 14.39, p. 238, for `G_m`;
[Kaletha], §3.1, p. 10, for `μ_n` and `k'/k` Galois, the index set being `Gal(k'/k)`; the general
case is derived from the splitting). In Lean,
`characterGroupEquivInduced` records the point-group form for the rank-`n` split torus: over a
separably closed `Ω`, `(Res T')(Ω)` is a product of copies of `(Ω^×)^n` indexed by the
`k`-embeddings `k' → Ω`. *Needs:* *weil-restriction-separable-splitting*; Tau Ceti
`TauCeti.CommHopfAlgCat.geometricCharacterGroup`, `TauCeti.DiagonalizableGroup.pairing`;
ReductiveGroups layer 4.

**Norm maps and norm-one tori.** (*norm-torus*) For a finite free algebra `k → k'` of rank `d`,
`NormTorus.norm` is the algebra norm on units of `k' ⊗_k R`, after commuting tensor factors
(`norm_points`); `normOne` is its kernel subgroup. `norm_comp_diagonal` gives `Nm(1 ⊗ r) = r^d`.
For a finite separable extension of fields, `normOne_isTorus` recognizes a finite-type Hopf
algebra whose point functor is naturally isomorphic to these kernels. Its hypotheses require
compatibility with every coefficient-algebra homomorphism. `characterGroup_normOne` supplies
only the split point-group comparison over a separably closed field, of rank `d − 1`.
`resRootsOfUnity`, `diagonalRootsOfUnity` and `resRootsOfUnityQuotient` denote the abstract groups
`μ_n(k' ⊗_k R)`, the image of `μ_n(R)`, and their quotient. This quotient is not identified with
the points of the quotient group scheme `(Res_{k'/k} μ_n)/μ_n`, the cokernel of the diagonal in the
exact sequence of [Kaletha], §3.1, display (3.1), p. 10 (stated there for `k'/k` Galois). At
`n = 0`, the first group is the whole unit group. ([Bruhat–Tits II], 1.5.13 and 1.5.17,
pp. 30–32, for the norm on `Res G_m`; [Česnavičius], Rem. 6.3, display (6.3.3), p. 14, for the
norm-one torus of `ℂ/ℝ`.) *Needs:* *weil-restriction-group-scheme*; Mathlib `Algebra.norm`,
`rootsOfUnity`.

**Checks.**

- `norm_complex` — for `ℂ/ℝ`, `Nm(x + iy) = x² + y²` on `ℝ`-points.
- `normOne_complex` — for `ℂ/ℝ`, the norm-one subgroup of `ℝ`-points is the unit circle.
- `norm_trivial_extension` — for `k' = k`, `Nm` is the identity of `G_m` and `R^1 G_m` is trivial.
- `norm_not_surjective_points` (non-example) — for `ℂ/ℝ`, `Nm : ℂ^× → ℝ^×` is not surjective (no
  negatives), though it is surjective as a map of tori.
- `resRootsOfUnityQuotient_one` — `μ_1` and its quotient are trivial over every coefficient ring.
- `resRootsOfUnity_zero` — `μ_0` is the whole unit group, since every unit satisfies `x^0 = 1`.
- `resRootsOfUnityQuotient_complex_real` — for `ℂ/ℝ`, `n = 4` and `R = ℝ`, the quotient has
  two elements: `{±1,±i}/{±1}`.
- `resRootsOfUnityQuotient_trivial_extension` — for `k' = k` the diagonal `μ_n(R)` is all of
  `μ_n(k ⊗_k R)`, so the quotient is trivial.
- `normOne_trivial_extension` — for `k' = k` the norm is the identity, so `normOne` is trivial.
- `normOne_I` — `Nm(i) = i · (−i) = 1`: the real point `i` of `Res_{ℂ/ℝ} G_m` lies in `normOne`.
- `normOne_split_complex` — over `R = ℂ` the norm-one torus of `ℂ/ℝ` splits: its `ℂ`-points form a
  group isomorphic to `ℂ^×`.
- `resRootsOfUnity_complex` — `μ_4(ℂ ⊗_ℝ ℝ) = μ_4(ℂ)` has four elements.
- `resRootsOfUnity_split` — for the split algebra `ℝ × ℝ`, `μ_2((ℝ × ℝ) ⊗_ℝ ℝ) = {±1}²` has four
  elements.
- `diagonalRootsOfUnity_complex` — the diagonal `μ_4(ℝ) = {±1}` in `μ_4(ℂ ⊗_ℝ ℝ)` has two elements.
- `diagonalRootsOfUnity_split` — the diagonal `{(1, 1), (−1, −1)}` in `μ_2(ℝ × ℝ)` has two elements.
- `diagonalRootsOfUnity_trivial_extension` — for `k' = k` the diagonal is the whole group.

**Topology on points of a Weil restriction.** (*weil-restriction-points-topology*) Let `k → k'` be
finite locally free, `R` a topological `k`-algebra with `k' ⊗_k R` carrying the quotient topology
from a free `R`-module mapping onto it, and `A'` of finite type over `k'`. Then
`Res(A')(R) ≅ X'(k' ⊗_k R)` is a homeomorphism for the point topologies ([Conrad], Ex. 2.4, p. 3,
stated there for `k = R`; the general case is its base change along `k → R`);
for groups this bijection is also the group isomorphism `pointsMulEquiv`. In Lean,
`pointsHomeomorph` is the case `R = E` for a finite extension `E'/E` of nonarchimedean local fields
with `E → E'` continuous (the valuation topology on `E'` is then the product topology): the
bijection is `homEquiv` at `R = E` followed by `E' ⊗_E E ≅ E'`. *Needs:*
*weil-restriction-group-scheme*; RG2.0 *affine-point-topology-functoriality*; RG2.0
*points-topological-group*; Mathlib `IsModuleTopology`.

**Checks.**

- `pointsHomeomorph_affineLine` — `Res_{E'/E} 𝔸¹` has the `E`-points `E'` with their own topology:
  evaluation at `t` after `pointsHomeomorph` is a homeomorphism onto `E'`.
- `pointsHomeomorph_units` — for `G_m`, evaluation at `t` after `pointsHomeomorph` is an embedding
  with image `E'^×`: the point topology of `G_m(E')` is the subspace topology of `E'^× ⊂ E'`.
- `pointsHomeomorph_group` — for a Hopf algebra the bijection of `pointsHomeomorph` is
  `pointsMulEquiv` followed by `E' ⊗_E E ≅ E'`.

**Weil restriction of integral points and models.** (*integral-weil-restriction*) For `O → O'`
finite free and `𝒳' = Spec A'` affine over `O'`, `integralPointsEquiv` is `homEquiv` at `R = O`
followed by `O' ⊗_O O ≅ O'`: the `O`-points of `Res 𝒳'` are `𝒳'(O')`. When `O ⊂ O'` are discrete
valuation rings with fraction fields `K ⊂ K'` and `K ⊗_O O' = K'`, the generic fibre of `Res 𝒳'` is
`Res_{K'/K} 𝒳'_{K'}` (`baseChangeEquiv` with `l = K`), `Res 𝒳'` is of finite type, resp. smooth,
when `𝒳'` is (`finiteType_res`, `smooth_res`), and an `O'`-semilinear action of `Γ = Gal(K'/K)` on
`𝒳'` gives an `O`-linear action on `Res 𝒳'` (`inducedAction`, fixed by `homEquiv_inducedAction`:
precomposition with the action of `γ` sends a point `y` to `(γ^{-1} ⊗ id) ∘ y ∘ γ`)
([Edixhoven], 2.4, p. 292, for the induced action; [Kisin–Pappas], proof of Prop. 1.3.3 and
Prop. 1.3.9, displays (1.3.8)–(1.3.10), pp. 142–143, and [Kisin–Pappas–Zhou], §2.1.2, p. 11, for
Bruhat–Tits group schemes). *Needs:* *weil-restriction-base-change*;
*weil-restriction-smoothness-and-immersions*; RG2.0 *completed-maximal-unramified-extension*.

**Checks.**

- `inducedAction_trivial` — the trivial actions on `O'` and `A'` induce the trivial action on
  `Res A'`.
- `inducedAction_conj_nontrivial` — for `ℂ/ℝ`, with `Gal(ℂ/ℝ)` acting on `ℂ` and on the
  coefficients of `ℂ[t]`, the induced action on `Res_{ℂ/ℝ} ℂ[t] ≅ ℝ[x, y]` (`t ↦ x + iy`) is
  `x ↦ x`, `y ↦ −y`; it is not trivial.
- `inducedAction_conj_fixedPoints` — Galois descent of the line: the quotient of `ℝ[x, y]` by the
  ideal of all `γ f − f` is `ℝ[x, y]/(2y) ≅ ℝ[t]`.
- `integralPointsEquiv_gaussian_units` — the `ℤ`-points of `Res_{ℤ[i]/ℤ} G_m` are the four units
  `±1, ±i` of `ℤ[i]`.

**Edixhoven's tame fixed-point theorem.** (*tame-fixed-points-of-weil-restriction*) Let `O` be a
discrete valuation ring, `O'` finite free over `O` with an action of a finite group `Γ` of order
invertible in `O` by `O`-algebra automorphisms, and `X` smooth affine over `O'` with a semilinear
`Γ`-action. Then `(Res_{O'/O} X)^Γ`, the closed subscheme cut out by the functions `γf − f`, is
smooth over `O` (`smooth_fixedPoints`): `Res X` is smooth, and the fixed scheme of a tame action on
a smooth scheme is smooth over any base, with no henselian hypothesis ([Edixhoven], Prop. 3.1, p.
293, for the fixed-point subscheme, and Prop. 3.4, pp. 294–295, for its smoothness). When moreover
`O` is strictly henselian, `K'/K` is tame Galois with group `Γ`, `T` is a `K`-torus split by `K'`
and `𝒯'` is the split `O'`-torus extending `T_{K'}`, with its semilinear `Γ`-action, the neutral
component of `(Res_{O'/O} 𝒯')^Γ` is the connected Néron model of `T` ([Kisin–Pappas], proof of Prop.
1.1.4, p. 129; [Kisin–Pappas–Zhou], proof of Prop. 2.2.2, pp. 12–13, and Rem. 2.4.3(b), p. 16, for
the parahoric case). *Needs:* *integral-weil-restriction*;
*weil-restriction-smoothness-and-immersions*.

### RG2.0a.3 the Deligne torus

**The Deligne torus.** (*deligne-torus*) Put `S := Res_{ℂ/ℝ} G_m = Spec ℝ[x,y,(x²+y²)^{-1}]` with
`z = x+iy`; then `S(R) = (ℂ ⊗_ℝ R)^×` and `S(ℝ) = ℂ^×` as topological groups. The splitting
`S_ℂ ≅ G_m × G_m` sends `S(ℝ) → S(ℂ)` to `z ↦ (z,z̄)`; complex conjugation acts on `S(ℂ)` by
`(z_1,z_2) ↦ (z̄_2,z̄_1)` and on `X^*(S) = ℤ²` (the character `z_1^p z_2^q`) by `(p,q) ↦ (q,p)`. The
pinned maps are `d : G_m → S`, `r ↦ r`; the weight `w := d ∘ inv`, `r ↦ r^{-1}`;
`Nm : S → G_m`, `z ↦ z z̄`, with `Nm ∘ d` the squaring map and `ker Nm = U(1)`; and
`μ : G_{m,ℂ} → S_ℂ`, `z ↦ (z,1)`. In `DeligneTorus`, define `S` as the Hopf `ℝ`-algebra
`Res_{ℂ/ℝ} ℂ[t, t⁻¹]`, `pointsMulEquiv` (`S(R) ≃* (ℂ ⊗_ℝ R)^×`, `multiplicativeGroupPoints`),
`realPointsMulEquiv` (`S(ℝ) ≃* ℂ^×`, through `ℂ ⊗_ℝ ℝ ≅ ℂ`), `complexSplitting`
(`S(ℂ) ≃* ℂ^× × ℂ^×`), `diagonal` as the cocharacter `d : G_m → S` with `d(r) = r` on `ℝ^×`, `weight`
as `w = d ∘ inv` with `w(r) = r^{-1}`, `norm` as `Nm : S → G_m`, `NormTorus.norm` for
`ℂ/ℝ` on real points, `mu` as the cocharacter `μ : G_{m,ℂ} → S_ℂ`, `z ↦ (z, 1)`, and `characterGroup`
(`(p, q) ↦ ((z_1, z_2) ↦ z_1^p z_2^q)` on `S(ℂ)`); prove `isHomeomorph_realPointsMulEquiv`
(`S(ℝ) ≃ ℂ^×` is a homeomorphism for the point topology), `complexSplitting_apply` (the components
of the splitting are `a ⊗ b ↦ ab` and `a ⊗ b ↦ ā b` on `ℂ ⊗_ℝ ℂ`), `complexSplitting_real`
(`S(ℝ) → S(ℂ)` is `z ↦ (z, z̄)`), `conj_swap` (conjugation on `S(ℂ)` is `(z_1,z_2) ↦ (z̄_2,z̄_1)`)
and `characterGroup_conj` (conjugation exchanges the characters `(p, q)` and `(q, p)`)
([Milne ISV], §2, 'Hodge structures as representations of S', p. 26, displays (20)–(23), for
the splitting, the conjugation, the characters, `w(r) = r^{-1}` and `μ`).
*Needs:* *norm-torus*; *weil-restriction-separable-splitting*; *weil-restriction-points-topology*;
Tau Ceti `TauCeti.MultiplicativeGroup.pointsMulEquiv`.

**Checks.**

- `norm_diagonal` — `Nm(d(r)) = r²` for `r ∈ ℝ^×`.
- `weight_eq_inv_diagonal` — `w(r) = d(r)^{-1}` for `r ∈ ℝ^×`, which pins the sign convention.
- `complexSplitting_I` — the real point `i` goes to `(i, −i)` in `S(ℂ) ≅ ℂ^× × ℂ^×`, which pins the
  order of the two factors.
- `kernel_norm_compact` — every real point in the kernel of `Nm` lies on the unit circle `U(1)`.
- `not_split` (non-example) — `S` is not split: `S(ℝ) = ℂ^×` has infinitely many elements of finite
  order, while `(ℝ^×)²` has four.
- `realPointsMulEquiv_apply` — the complex number attached to a real point of `S` is its value on
  the coordinate `t` of `G_m = Spec ℂ[t, t⁻¹]`, read in `ℂ ⊗_ℝ ℝ ≅ ℂ`.
- `weight_two` — `w(2) = 1/2` in `S(ℝ) = ℂ^×`: the weight is `r ↦ r^{-1}`, not `r ↦ r`.
- `norm_weight` — `Nm ∘ w` is `r ↦ r^{-2}`.
- `complexSplitting_weight` — over `ℂ`, `w(r) = (r^{-1}, r^{-1})`.
- `complexSplitting_scalar` — the `ℂ`-point with value `1 ⊗ i` in `(ℂ ⊗_ℝ ℂ)^×` goes to `(i, i)`,
  while the real point `i`, with value `i ⊗ 1`, goes to `(i, −i)`.
- `complexSplitting_mul_real` — on a real point the product of the two components is the norm
  `z z̄ = |z|²`.
- `characterGroup_mu` — the character `(1, 0)` takes the value `z` on `μ(z)` and `(0, 1)` the
  value `1`.
- `weight_eq_mu_mul_conj` — over `ℂ`, `w(r) = μ(r^{-1}) · μ̄(r^{-1})`, where `μ̄ : z ↦ (1, z)` is the
  conjugate of `μ`.
- `mu_not_real` (non-example) — `μ` is not defined over `ℝ`: `μ(−1) = (−1, 1)` is not of the form
  `(z, z̄)`.
- `characterGroup_norm` — on real points the character `(1, 1)` is the norm.
- `characterGroup_weight` — the character `(p, q)` takes the value `r^{−(p+q)}` on `w(r)`.

### Examples

The worked examples are the affine line `Res_{k'/k}(k'[t]) ≃ MvPolynomial (Fin d) k`, the
`ℝ`-points `ℂ^×` of `Res_{ℂ/ℝ} G_m` against `Res_{ℂ/ℝ} 𝔸¹ ≇ 𝔸¹_ℝ` (`Res` is not base change), the
split and zero extensions `k × k` and `0`, the non-flat restriction over `ℤ_p[ε]/(ε²)`, the
inseparable point of dimension `p − 1`, the nonabelian `Res_{ℂ/ℝ} GL_2`, the norm `x² + y²` of `ℂ/ℝ`
and its non-surjectivity on real points, and the Deligne torus with `Nm ∘ d` the squaring map,
`w = d ∘ inv` and the splitting `i ↦ (i, −i)`.

### Dependencies

RG2.0 for the point topology and `Ĕ`; ModularCurves layer 0F; ReductiveGroups layers 0, 4, 6 and 7;
Mathlib and Tau Ceti as listed in the supplier contracts.

## Layer RG2.1: relative roots and valued root data

Over a henselian discretely valued field `K` with perfect residue field, the rational points of a
connected reductive group carry a generating root datum `(Z(K), (U_a(K))_{a ∈ Φ(G,S)})` in the sense
of Bruhat–Tits, indexed by the relative roots of a maximal `K`-split torus `S`. The structure theory
of the unvalued data, namely `S`, `Z = Z_G(S)`, `N`, `Φ(G,S)`, the root subgroups, the parabolics and
the absolute root datum with its Galois action, is the Reductive groups roadmap, layer 7. This layer
states, as the targets of RG2.1.2, exactly those unvalued objects which the valued theory consumes,
constructed from the coordinate Hopf algebra and a chosen maximal split torus; their structure
theory is not developed here. It defines valuations of root data and their apartments, which are affine spaces
under `V = X_*(S) ⊗ ℝ`, together with affine roots and root-group filtrations; it proves the
commutator estimates and the existence of a valuation compatible with the valuation of `K`, for
quasi-split groups by root-group coordinates and in general by unramified descent from `Ĕ` using
Steinberg's theorem; and it builds the affine structure of the apartment: walls, alcoves and
facets, the échelonnage root system, the affine Weyl group, the kernel and image of the action of
`N(K)`, the Frobenius action over `Ĕ`, independence of choices, and minuscule coweights. It also owns
the arithmetic invariants used by every later layer: the algebraic fundamental group `π₁(G)`,
z-extensions and their existence, and the Kottwitz homomorphisms `κ_T` and
`κ_G : G(Ĕ) → π₁(G)_I`. The sign convention is fixed once: `z ∈ Z(K)` acts on the apartment by the
translation `v(z)` with `⟨χ, v(z)⟩ = −ω(χ(z))`, while the Kottwitz homomorphism of `G_m` is `ω`
itself.

### RG2.1.1 quasi-split forms and rational tori over Ĕ

**Steinberg's theorem over the completed unramified field.** (*steinberg-quasi-split*) Let `L` be a
field complete or henselian for a discrete valuation, with algebraically closed residue field `κ_L`
(for instance `L = Ĕ` or `L = K^sh`). Then `H^1(L, H) = 1` for every connected reductive `L`-group
`H`, by Steinberg when `L` is perfect and by Borel–Springer when `L` is imperfect; when
`char L = 0` this holds for every connected linear `H`. Consequently every reductive `L`-group is
quasi-split, and every finite tame Galois extension of `L` is totally ramified and cyclic, of order
prime to the residue characteristic ([Bruhat–Tits II], 5.1.1, p. 145; [Kisin–Pappas], proof of
Prop. 1.1.4, p. 128; [Haines–Rapoport], after Rem. 4, p. 2). It is a statement of the roadmap
without a Lean target of its own; `exists_rational_maximalUnramifiedSplitTorus` below depends on
it. *Needs:* RG2.0
*completed-maximal-unramified-extension*; ReductiveGroups layer 7; LocalFieldsRamification layer 3.

**A rational maximal L-split torus.** (*rational-maximal-unramified-split-torus*) Let `E` be a
nonarchimedean local field, `L = Ĕ`, `σ` the arithmetic Frobenius, and `G` reductive over `E` with a
maximal `E`-split torus `S`. There is an `E`-torus `S_L ⊇ S` whose base change to `L` is a maximal
`L`-split torus. Use `TauCeti.CommHopfAlgCat.baseChangeHopfIdeal` for the base change of a Hopf ideal (the ideal
generated by `1 ⊗ I`, from `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/BaseChange.lean`,
applied to the underlying commutative Hopf algebra), with
`TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_toIdeal` identifying the extended ideal; `exists_rational_maximalUnramifiedSplitTorus`
states the existence for `D : LocalRootData E H`: a Hopf ideal `I ≤ D.splitTorus` (ideal inclusion
reverses subgroup inclusion) whose quotient is an `E`-torus and whose base change to `Ĕ` is a
maximal split torus ([Bruhat–Tits II], Corollary 5.1.12, p. 150, stated there over the strict
henselization `E^sh`; the completion `Ĕ` of `E^sh` has the same absolute Galois group and hence the
same maximal split tori). `exists_unramifiedApartmentData` supplies the compatible valued datum over
`Ĕ` for such a torus, and `apartment_eq_fixedPoints` identifies the apartment of `S` with the
`σ`-fixed points of that of `S_L` ([Bruhat–Tits II], Lemma 5.1.13, p. 150, and Theorem 5.1.20,
pp. 153–154). Two further consequences are statements of the roadmap without a Lean target: the
centralizer `Z_G(S_L)` is a maximal `E`-torus (by *steinberg-quasi-split*, `G_L` is quasi-split),
and the apartment `A(G_L, S_L)` is `σ`-stable with nonempty affine fixed locus. *Needs:*
*steinberg-quasi-split*; ReductiveGroups layer 7.

**Checks.**

- `baseChangeIdeal_bot` — the zero ideal (the whole group) base-changes to the zero ideal.
- `baseChangeIdeal_augmentation` — the augmentation ideal (the trivial subgroup) base-changes to the
  augmentation ideal of the base change.
- `baseChangeIdeal_mem` — `1 ⊗ a` lies in the base change of `I` for every `a ∈ I`.

### RG2.1.2 root data in a group and their valuations

**Generating root datum in an abstract group.** (*root-datum-in-a-group*) Let `Φ` be a root system in
`V*`, possibly non-reduced. A root datum of type `Φ` in a group `G` consists of a subgroup `T ≤ G`,
nontrivial subgroups `U_a ≤ G` and subsets `M_a ⊂ G`, one for each `a ∈ Φ`, satisfying the six axioms
(DR1)–(DR6): `T` and the `U_a` are subgroups and the `U_a` are nontrivial;
`[U_a, U_b] ⊂ ⟨U_{pa+qb} : p, q ≥ 1⟩` for `b ∉ −ℝ₊a`;
`U_{2a} ⊊ U_a` (inclusion and `U_{2a} ≠ U_a`); `M_a` is a right `T`-coset with `U_{−a} ∖ 1 ⊂ U_a M_a U_a`;
`m U_b m^{-1} = U_{s_a b}` for each `m ∈ M_a`; and `T U^+ ∩ U^− = {1}` for the positive
roots specified by a regular vector. In Lean `Φ` is a Mathlib root pairing over `ℝ` with roots in
`M = V*` and coroots in `N = V`, and the axioms are the fields `U_ne_bot`, `commutator_le`,
`le_of_root_eq_two_smul`, `ne_of_root_eq_two_smul`, `reflectionCoset_eq`, `bruhat`, `reflection_conjugates`,
`positiveVector_regular` and `bruhat_separation`. It is generating when `⟨T, U_a⟩ = G`. In
`BruhatTits`, define `RootDatum` as the structure `(T, (U_a, M_a)_{a∈Φ})` with (DR1)–(DR6),
`RootDatum.IsGenerating` as the condition `⟨T, U_a : a ∈ Φ⟩ = G` and `RootDatum.weylNormalizer` as
`N := ⟨T, M_a⟩`; prove `RootDatum.le_normalizer` (`T` normalizes each `U_a`),
`RootDatum.U_ne_of_root_eq_neg` (`U_a ≠ U_{−a}`, from (DR1) and (DR6)),
`RootDatum.reflectionCoset_subset_weylNormalizer` and, for finite `Φ`, `RootDatum.weylGroupEquiv`
(`N/T ≃* W(Φ)`) with `RootDatum.weylGroupEquiv_conj` (`n U_a n^{-1} = U_{ν(n)a}`, which pins the
equivalence) ([Bruhat–Tits I], 6.1.1, p. 107; 6.1.2 (3) and (10), pp. 108–109; 6.1.11 (ii),
p. 115). *Needs:* RootSystems layer 4; Mathlib `RootPairing`.

**Checks.**

- `RootDatum.sl2` — `SL_2(K)` carries a generating root datum of type `A_1` (the Lean example asserts
  existence; the datum of [Bruhat–Tits I], 6.1.3 a), p. 109, is the diagonal torus with the two
  unipotent subgroups).
- `RootDatum.rankZero` — for `Φ = ∅` a root datum is just a subgroup `T`, as for `G = T` a torus.
- `RootDatum.not_of_trivial_U` (non-example) — `U_a = {1}` for some `a` violates (DR1), so this is not
  a root datum.
- `RootDatum.opposite_ne` (non-example) — no group carries a root datum with `U_a = U_{−a}`; in
  particular an abelian group with `U_a = U_{−a} = G` violates (DR6).
- `RootDatum.isGenerating_rankZero` — with no roots, the datum is generating iff `T = G`.
- `RootDatum.weylNormalizer_rankZero` — with no roots, `N = T`.
- `RootDatum.weylNormalizer_reflection` — every element of `M_a` belongs to `N`.
- `RootDatum.weylNormalizer_contains_torus` — the inclusion of `T` agrees with the subgroup
  generated by `T` and the reflection cosets.
- `RootDatum.weylGroupEquiv_reflection` — an element of `M_a` maps to the reflection `s_a`.
- `RootDatum.weylGroupEquiv_torus` — an element of `T` maps to `1`.
- `RootDatum.weylGroupEquiv_reflection_ne_one` (non-example) — `N/T → W(Φ)` is not trivial: by
  (DR5) an element of `M_a` carries `U_a` to `U_{−a} ≠ U_a`, so its image does not fix `a`.

**Rational points carry a root datum.** (*rational-points-root-datum*) Let `G` be reductive over a
field `K`, with `Φ` possibly non-reduced, and let `m_a ∈ N(K)` come from the rank-one subgroups. Then
`(Z(K), (U_a(K), Z(K) m_a))` is a root datum of type `Φ` in `G(K)`, generating
`G(K) = ⟨Z(K), U_a(K)⟩`; `N(K)` is the group `⟨Z(K), M_a⟩`, and `N(K)/Z(K) = W_0`
([Bruhat–Tits I], 6.1.3 c), p. 110, stated there for semisimple `G`; for reductive `G`,
[Bruhat–Tits II], 4.1.19 (ii), pp. 87–88, in the quasi-split case and 5.1.2, p. 146, and
[Springer], §§3.5 and 3.7, pp. 13–14, where `N(S)(K)/Z(S)(K)` is the relative Weyl group and the
Bruhat decomposition of `G(K)` gives generation).
*Needs:* *root-datum-in-a-group*; ReductiveGroups layer 7.

In `BruhatTits`, `subgroupPoints I R` is the subgroup of `R`-points cut out by a Hopf ideal `I`, the
pinned `TauCeti.CommHopfAlgCat.quotientPointsSubgroup` indexed by the coefficient type. In
`BruhatTits.GeometricRoots`, for a Hopf ideal `S`: `Character S` is the group of group-like elements
of `H ⧸ S` (rational characters), `Cocharacter S` its integral dual, `characterValue` the evaluation
of a character on points (pinned by `characterValue_coe`), `adjoint` the adjoint action of `G(K̄)`
on `Lie(G) ⊗ K̄` (the pinned `Derivation.adDerivation`), `Root S` the nonzero weights of `S` on
`Lie(G) ⊗ K̄` tested on `S(K̄)` (meant for a torus `S`), `rootSubgroup S a` the root subgroup
`U_(a)` (including `U_(2a)` when `2a` is a root), `coroot S a` the relative coroot (for `2a ∈ Φ`
twice the coroot of `2a`; [Tits], 3.5, pp. 52–53), `characterLinear` the real extension of the
pairing, `centralizer`, `normalizer` and `centralizerIdeal` the scheme-theoretic centralizer and
normalizer, `restrictCharacter` and `restrictAmbientCharacter` the restrictions of characters of
`Z_G(S)` and of `G` to `S`, and `GeometricCharacter`, `GeometricRoot`, `geometricCoroot` the
absolute counterparts over `K̄`. For `H` reductive and `S` a maximal split torus they satisfy:
`rootSubgroup_points` (for indivisible `a`, `U_(a)` is the intersection of the dynamic unipotent
subgroups `U_G(λ)` over the cocharacters `λ` of `S` with `⟨a, λ⟩ > 0`, tested on every `K`-algebra;
a derivation from [Bruhat–Tits I], 6.1.3 c), p. 110), `rootSubgroup_double` (for a doubled root
`2a` of a quasi-split group, `U_(2a)` is the closed subgroup generated by the commutators of
`U_(a)`; [Bruhat–Tits II], 4.1.9–4.1.10, pp. 82–83), `rootSubgroup_unique` (for any reductive `G`,
`U_(2a)` is the unique smooth, geometrically connected, unipotent closed subgroup normalized by `Z_G(S)`
with Lie algebra the weight space `g_{2a}`; a specialization of [Springer], §3.5, p. 13,
which assumes normalization by `S`), `coroot_reflection`
(`⟨a, a^∨⟩ = 2` and some `n ∈ N(K)` acts on `S` by `χ ↦ χ − ⟨χ, a^∨⟩ a`), `centralizerIdeal_points`
and `centralizerIdeal_points_iff`, `restrictCharacter_value` (for commutative `S`) and
`restrictAmbientCharacter_coe`, and their absolute analogues `geometricCoroot_reflection`,
`geometricEvaluation_tmul` and `geometricCharacterValue_coe` for a maximal torus.

`LocalRootData K H` consists of the reductivity of `H` and a Hopf ideal `splitTorus` minimal among
those whose quotient is a split torus, that is, a maximal split torus `S`.
`LocalRootData.realization` constructs a `RelativeRootRealization` from it: an index type equivalent
to `Root S`, a real vector space identified with `ℝ ⊗ X_*(S)`, a Mathlib `RootPairing` whose
bilinear form is evaluation, whose roots are `characterLinear` of the relative roots and whose
coroots are `1 ⊗ coroot`, and a `RootDatum` in `G(K)` whose torus is `centralizer S`, whose root
groups are the `K`-points of `rootSubgroup`, and whose normalizer is `normalizer S`.
`exists_localRootData` asserts that a maximal split torus exists, and `rationalPointsRootDatum`
states that the datum is generating and that `weylNormalizer` is `N(K)`; with
`RootDatum.weylGroupEquiv` this gives `N(K)/Z(K) ≅ W(Φ)`.

**Checks.**

- `GLBuilding.standard_GL2_roots` — the diagonal torus in the pinned `GL₂` has two roots and cocharacter rank two.
- `SLTwo.roots_and_rank` — the pinned `SL₂/ℚ_p` has two roots and cocharacter rank one;
  `SLTwo.root_coroot_pairing` records `⟨a,a∨⟩ = 2`, which holds in every root pairing.
- `SLTwo.coroot_coordinates` — the coroot of the upper root has coordinate `1` (the cocharacter
  `t ↦ diag(t,t⁻¹)`) and that of the lower root `−1`.
- `SLTwo.roots_opposite` — the lower root is the negative of the upper root.
- `SLTwo.root_values` — at the point of coordinate `1` the upper root takes the value `2` and the
  lower root `−2`.
- `SLTwo.coordinates_reflection` — the reflection of either root acts on the apartment coordinate
  by `c ↦ −c`.
- `NormTorus.quadratic_anisotropic` — for a separable quadratic field extension, the norm-one torus
  has no relative roots and cocharacter rank zero. `NormTorus.coordinateHopf` represents the actual
  norm kernel on every coefficient algebra; `pointsEquiv_natural` identifies its scalar maps.
- `NormTorus.coordinate_trivial_extension` — the norm kernel for `K/K` is the trivial group.
- `NormTorus.coordinate_points_agree` — evaluation through `pointsEquiv` has algebra norm one.
- `LocalRootData.evaluation_pairing` — the root-pairing bilinear map is evaluation on the
  cocharacter vector space, including its central directions.
- `LocalRootData.cocharacter_dimension` — if `X_*(S) = 0` (an anisotropic group) then `V = 0`.
- `LocalRootData.rank_zero_no_roots` — if `V = 0` there are no relative roots.
- `LocalRootData.roots_are_geometric_weights` — each realized root is a nonzero character (a
  restatement of the definition of `Root`, recorded as a computation).
- `LocalRootData.opposite_rootSubgroups` (non-example) — the root subgroups of opposite roots are
  different Hopf ideals.
- `LocalRootData.centralizer_le_normalizer` — `Z_G(S)(K) ⊆ N_G(S)(K)`.
- `subgroupPoints_mem_iff` — membership is vanishing on the ideal, as for the pinned supplier.
- `subgroupPoints_bot` — the zero ideal cuts out the whole group.
- `subgroupPoints_augmentation` — the augmentation ideal cuts out the trivial subgroup.
- `GeometricRoots.adjoint_one` — the identity point acts trivially on `Lie(G) ⊗ K̄`.
- `GeometricRoots.adjoint_mul` — `adjoint` is a left action: `Ad(gh) = Ad(g) ∘ Ad(h)`.
- `GeometricRoots.adjoint_commutative` — for a commutative group (cocommutative `H`) the adjoint
  action is trivial.
- `GeometricRoots.contracts_one` — the identity point lies in every dynamic unipotent subgroup.
- `GeometricRoots.contracts_mul` — the points contracted by `λ` are closed under products.
- `GeometricRoots.contracts_commutative` (non-example) — in a commutative group conjugation by
  `λ(T)` is trivial, so only the identity is contracted: `U_G(λ) = 1`.
- `GeometricRoots.characterValue_zero` — the trivial character evaluates to `1`.
- `GeometricRoots.characterValue_add` — evaluation is multiplicative in the character.
- `GeometricRoots.characterValue_identity` — every character is `1` at the identity point.
- `GeometricRoots.root_augmentation` — the trivial subgroup has no roots.
- `GeometricRoots.root_commutative` — a split torus of a commutative group has no roots.
- `GeometricRoots.root_nonreduced` (non-example) — for `μ_p ⊂ G_m` in characteristic `p` the
  test on `K̄`-points sees no point but the identity, so nonzero characters pass it; `Root` is meant
  for tori.
- `GeometricRoots.rootSubgroup_double_le` — `U_(2a) ⊆ U_(a)`: the Hopf ideal of `U_(a)` is
  contained in that of `U_(2a)`.
- `GeometricRoots.rootSubgroup_unipotent` — `U_(a)` is a smooth unipotent group.
- `RelativeRootRealization.rootSubgroup_ne_augmentation` (non-example) — a root subgroup is never
  the trivial subgroup, since its `K`-points form the nontrivial group `U_a` of the root datum.
- `GeometricRoots.coroot_double_pairing` — `⟨2a, a^∨⟩ = 4`.
- `GeometricRoots.coroot_half_pairing` — when `2a` is a root, `⟨a, (2a)^∨⟩ = 1`, as for the
  quasi-split `SU₃`.
- `GeometricRoots.characterLinear_coroot` — `a(1 ⊗ a^∨) = 2`.
- `GeometricRoots.characterLinear_zero` — the zero character gives the zero functional.
- `GeometricRoots.centralizer_augmentation` — the trivial subgroup is centralized by every point.
- `GeometricRoots.normalizer_bot` — the whole group is normalized by every point.
- `GeometricRoots.centralizer_le_normalizer` — `Z_G(S)(K) ⊆ N_G(S)(K)` for every closed subgroup
  `S`.
- `GeometricRoots.centralizerIdeal_augmentation` — the centralizer subgroup scheme of the trivial
  subgroup is the whole group.
- `GeometricRoots.geometricCharacterValue_zero` — the trivial geometric character evaluates to `1`.
- `GeometricRoots.geometricCharacterValue_add` — geometric evaluation is multiplicative in the
  character.
- `GeometricRoots.geometricCharacterValue_identity` — every geometric character is `1` at the
  identity point.
- `GeometricRoots.geometricRoot_augmentation` — the trivial subgroup has no absolute roots.
- `GeometricRoots.geometricRoot_commutative` — a torus of a commutative group has no absolute roots.
- `GeometricRoots.geometricCoroot_double_pairing` — `⟨2a, a^∨⟩ = 4` for an absolute root.
- `GeometricRoots.geometricCoroot_ne_zero` (non-example) — the zero cocharacter is not a coroot.
- `AbsoluteRootData.geometricCoroot_pairing` — transported along the identifications of
  `AbsoluteRootData`, Mathlib's `⟨a, a^∨⟩ = 2` for `Ψ` is `geometricCoroot a a = 2`.
- `GeometricRoots.geometricEvaluation_one` — at the identity point, evaluation is the counit:
  `r ⊗ a ↦ r ε(a)`.
- `GeometricRoots.geometricEvaluation_unit` — `r ⊗ 1 ↦ r` at every point.
- `GeometricRoots.geometricEvaluation_character` — on a rational character, geometric evaluation
  agrees with `characterValue`.
- `GeometricRoots.ambientCharacterValue_one` — a character of `G` is `1` at the identity.
- `GeometricRoots.ambientCharacterValue_mul` — a character of `G` is multiplicative on rational
  points.
- `GeometricRoots.restrictAmbientCharacter_zero` — the trivial character restricts to the trivial
  character.
- `GeometricRoots.restrictAmbientCharacter_value` — on `S(K)` the restriction of a character of `G`
  takes the values of that character.
- `GeometricRoots.restrictCharacter_ambient` — for a commutative `S`, restricting a character of
  `G` to `Z_G(S)` and then to `S` is restricting it to `S`.
- `RelativeRootRealization.coroot_pairing` — in every realization `a(1 ⊗ a^∨) = 2` for the field
  `GeometricRoots.coroot`, Mathlib's normalization of a root pairing.
- `RelativeRootRealization.torus_trivial_subgroup` — if `S` is the trivial subgroup, the torus
  `Z_G(S)(K)` of the datum is all of `G(K)`.
- `LocalRootData.realization_isGenerating_anisotropic` — for an anisotropic group (`S = 1`) the
  realized root datum is generating, its torus being `G(K)`.
- `LocalRootData.realization_anisotropic_no_roots` — for an anisotropic group the realization has
  no relative roots.
- `LocalRootData.realization_normalizer_anisotropic` — for an anisotropic group `N(K) = G(K)`.
- (non-example, no Lean mirror: the inner form of `Sp₆` is not in the compiled library) let `G` be
  an inner form of `Sp₆` of `K`-rank one (the unitary group of a hermitian form of Witt index one
  over a quaternion division algebra, Tits index `C₃,₁⁽²⁾`) over a field of characteristic two.
  Its relative root system is `BC₁`; over `K̄`, with `S` the image of the cocharacter
  `e₁* + e₂*`, the roots restricting to `a` are `e₁ ± e₃, e₂ ± e₃` and those restricting to `2a`
  are `e₁ + e₂, 2e₁, 2e₂`. The long roots `2eᵢ` arise only from the pairs `eᵢ + e₃, eᵢ − e₃`,
  with Chevalley constant `±2 = 0`, so the commutators of `U_(a)` generate only the
  one-dimensional root group of `e₁ + e₂` inside the three-dimensional `U_(2a)`; hence the
  quasi-split hypothesis of `rootSubgroup_double`.
- (non-example, recorded in the docstring of `restrictCharacter_value`) for `S = SL₂ ⊂ GL₂` over a
  field of characteristic `≠ 2`, the identity character of the centralizer `G_m` takes the value `−1`
  at `−I ∈ SL₂`, while `SL₂` has no nontrivial character; hence the commutativity hypothesis.

**Valuation of a root datum.** (*valuation-of-root-datum*) A family `φ = (φ_a : U_a → ℝ ∪ {∞})` is a
valuation if it satisfies (V0)–(V5): `|φ_a(U_a)| ≥ 3`; each `U_{a,k} := φ_a^{-1}[k, ∞]` is a subgroup
of `U_a` and `U_{a,∞} = 1`; for `m ∈ M_a` the function `u ↦ φ_{−a}(u) − φ_a(mum^{-1})` is constant on
`U_{−a} ∖ 1`; `[U_{a,k}, U_{b,l}] ⊂ ⟨U_{pa+qb,pk+ql} : p, q ≥ 1⟩` when `b` is not a negative
multiple of `a`;
`φ_{2a} = 2φ_a|U_{2a}`; and if `u'uu'' ∈ M_a` with `u ∈ U_a ∖ 1` and `u', u'' ∈ U_{−a}`, then
`φ_{−a}(u') = φ_{−a}(u'') = −φ_a(u)`. It is `ω`-compatible if `φ_a(zuz^{-1}) = φ_a(u) + ω(a(z))` for `z ∈ Z(K)`,
where `ω(a(z))` abbreviates `ω(χ(z))/m` for a rational character `χ` of `Z`
restricting to `m a`, with `m > 0`; it need not be an integral valuation of a root character. Two
valuations are equipollent if `ψ_a = φ_a + a(v)` for some `v ∈ V`. In `BruhatTits`, define
`Valuation` as such a family with (V0)–(V5), `Valuation.filtration` as `U_{a,k} = φ_a^{-1}[k, ∞]`,
`Valuation.valueSet` as `Γ_a = φ_a(U_a ∖ {1}) ⊂ ℝ`, `Equipollent`, `Valuation.shift` by
`(φ + v)_a = φ_a + a(v)` for `v ∈ V`, for finite `Φ` `Valuation.smul` by
`(n·φ)_a(u) = φ_{w^{-1}a}(n^{-1}un)` with `w` the image of `n` under `RootDatum.weylGroupEquiv`
(pinned by `Valuation.smul_apply`), `Valuation.IsCompatible` as
`φ_a(zuz^{-1}) = φ_a(u) + ω(a(z))` for `z ∈ Z(K)`, and `Valuation.IsDiscrete` as each `Γ_a` being
finite on each closed bounded interval in `ℝ`; prove `Valuation.filtration_antitone`
(`k ≤ l ⇒ U_{a,l} ⊂ U_{a,k}`), `Valuation.bruhat_value_left` ((V5) in value form) and
`Valuation.valueSet_neg` (`Γ_{−a} = −Γ_a`) ([Bruhat–Tits I], Def. 6.2.1, pp. 116–117, 6.2.2,
p. 117, 6.2.5, p. 120, and Def. 6.2.21, p. 127; [Bruhat–Tits II], 4.2.7–4.2.9, p. 91).
*Needs:* *root-datum-in-a-group*.

**Checks.**

- `Valuation.sl2_standard` — for a nontrivial real valuation `ω` of `K`, `φ_±(x_±(u)) = ω(u)` is a
  valuation of the root datum of `SL_2(K)` ([Bruhat–Tits I], 6.2.3 a), p. 117), (V5) coming from
  `x_−(−u^{-1})x_+(u)x_−(−u^{-1}) ∈ M_a` for the standard matrix root coordinates.
  At `u = 1` this is `[[1,0],[-1,1]] [[1,1],[0,1]] [[1,0],[-1,1]] = [[0,1],[-1,0]]`.
- `Valuation.one_top` — the identity has value `∞` in every root group.
- `Valuation.rankZero` — an empty root index admits a valuation.
- `Valuation.not_constant` (non-example) — a root-value map with at most two values violates (V0);
  in particular the trivial valuation of `K` gives no valuation of the root datum of `SL_2(K)`.
- `Valuation.opposite_depths` — for the two rank-one Bruhat factorizations with positive-root
  depths `1` and `2`, the opposite factors have depths `−1` and `−2` by (V5).
- `Valuation.shift_zero` — `φ + 0 = φ`.
- `Valuation.smul_one` — the identity of `N` acts trivially.
- `Valuation.smul_reflection` — the sign of the action on valuations: for `m = u'uu'' ∈ M_a` with
  `φ_a(u) = k`, `m·φ = φ − k a^∨` ([Bruhat–Tits I], 6.2.7, p. 121), so `(m·φ)_a = φ_a − 2k`;
  for `k = 1` the values on `U_a` drop by `2`.
- `Valuation.isDiscrete_rankZero` — every valuation of an empty root datum is discrete.
- `Valuation.isDiscrete_shift` — discreteness is invariant under equipollence.
- `Valuation.not_valuation_wrong_sign` (non-example) — by (V5), if `u'uu'' ∈ M_a` and `φ_a(u) = 1`
  then `φ_{−a}(u') ≠ 1`; so for `SL_2` the family `φ_+(x_+(u)) = ω(u)`, `φ_−(x_−(u)) = −ω(u)` is not
  a valuation (at `u = ϖ` it gives `φ_−(x_−(−ϖ^{-1})) = 1`).
- `Equipollent.refl` — `φ` is equipollent to itself.
- `Equipollent.shift` — `φ` is equipollent to `φ + v`.
- `Equipollent.not_same_shift_opposite` (non-example) — raising both `φ_a` and `φ_{−a}` by `1`
  does not give an equipollent valuation, since `a(v) = 1` and `−a(v) = 1` are incompatible.

**The valuation homomorphism of the minimal Levi.** (*torus-valuation-map*) The restriction
`X^*_K(Z) ↪ X^*(S)` has finite cokernel, so `⟨χ, v(z)⟩ = −ω(χ(z))` for `χ ∈ X^*_K(Z)` defines a
homomorphism `v : Z(K) → V`. For the standing nontrivial, discrete, rank-one valuation, its kernel `Z(K)^1`
is, for `K` henselian, the maximal bounded subgroup of `Z(K)` ([Bruhat–Tits II], 4.4.2 (ii), p. 107,
for a torus), compact when `K` is local; its image `Λ` is a full lattice, so `Z(K)/Z(K)^1 ≅ ℤ^{dim S}`; `N(K)` normalizes
`Z(K)^1` and moves `v` by `W_0`. In `BruhatTits`, define `torusValuationMap` as
`v : Z(K) → V` with `⟨χ, v(z)⟩ = −ω(χ(z))`, `boundedPart` as `Z(K)^1 := ker v`, the maximal bounded
subgroup, and `translationLattice` as `Λ := v(Z(K))`, a full lattice in `V`; prove
`torusValuationMap_apply_character` (`⟨χ, v(z)⟩ = −ω(χ(z))` for `χ ∈ X^*_K(Z)`),
`boundedPart_isCompact` (for `K` local, `Z(K)^1` is compact) and
`torusValuationMap_conj` (`v(nzn^{-1}) = w(n)·v(z)` for `n ∈ N(K)`) ([Bruhat–Tits II], 4.2.5–4.2.7,
pp. 90–91; 5.1.22–5.1.23, pp. 154–155; [He 2018], §1.1, p. 5 (citing [Tits], §1); [Richarz],
§1.1, p. 118 (arXiv p. 1)). *Needs:* *rational-points-root-datum*; Mathlib
`Valuation`; ReductiveGroups layer 7.
The formula tests actual rational characters of the minimal Levi. A relative root need only
extend as a rational character: if `Nχ` extends integrally, evaluate its valuation and divide
by `N` ([Bruhat–Tits II], 4.2.5–4.2.6, p. 90). Thus root evaluations of `v(z)` need not be integers.
`translationLattice_span` requires nontriviality, discreteness and rank one. Over a
non-henselian field `ker v` can be unbounded: for the norm-one torus of `ℚ(i)/ℚ` with the `5`-adic
valuation the torus is anisotropic, so `v = 0` and `ker v = T(ℚ)`, which contains
`((3 + 4i)/5)^n` for all `n`.

**Checks.**

- `torusValuationMap.trivial_valuation_not_full` — a homomorphism `Z(K) → V` that is identically
  zero, as the defining formula would give for the trivial valuation, has image spanning `0`, so it
  cannot span a nonzero `V`; hence the nontriviality hypothesis of `translationLattice_span`.
- `torusValuationMap_split` — two rational characters with values `ϖ` and `1` at `z` (the
  coordinates of `t = (ϖ, 1)` in `S = G_m^2`) give the coordinates `−1` and `0` of `v(z)`.
- `torusValuationMap_sign_two_terms` — if `χ(z) = ϖ` then `⟨χ, v(z)⟩ = −1` and
  `⟨χ, v(z²)⟩ = −2`; the opposite convention would give `1` and `2`.
- `normalizedOrder_uniformizer_two_terms` — `ω = 1` at a uniformizer and `2` at its square.
- `normalizedOrder_units` — units of `O` have `ω = 0`.
- `torusValuationMap_anisotropic` — for `S = 1`, `V = 0`, `v = 0` and `Z(K)^1 = Z(K)`.
- `torusValuationMap_not_injective_on_units` (non-example) — `v` is not injective, since the units of
  `O` give `v = 0`, so `v` is no faithful coordinate on `Z(K)`.
- `minimalLeviPoint_one` — the identity of `Z(K)` is the identity point of the centralizer `Z_G(S)`.
- `translationLattice_integral` — every rational character of the minimal Levi takes integer values
  on `Λ`.
- `translationLattice_anisotropic` — for `S = 1`, `Λ = {0}`.
- `translationLattice_ne_univ` (non-example) — for `V ≠ 0`, `Λ ≠ V`.

**The apartment of a valued root datum.** (*apartment*) Let `φ` be a valuation and `Φ ⊂ V*`. The
apartment relative to `φ` consists of pairs `(ψ,v)` with `ψ_a = φ_a + a(v)`. The displacement
`v ∈ V` is retained: vectors annihilated by every root give distinct central points even when they
give the same valuation. Translation adds to this displacement, making the apartment an affine
space under `V`. For finite `Φ` the reduced action `ν : N → Aff(A)` is `ψ ↦ n·ψ` on valuations,
with linear part the image of `n` in `W(Φ)`, and with translation part in the span of the coroots,
which fixes the central coordinate; an element `m = u'uu'' ∈ M_a` with `φ_a(u) = k` acts by the
reflection `x ↦ x − (a(x − φ) + k) a^∨` in the wall `a(x − φ) + k = 0`. For `G(K)` and `φ`
`ω`-compatible, `z ∈ Z(K)` translates by `v(z)`, and `A = A(G, S, K)` is the enlarged apartment. For
`x ∈ A` put `U_{a,x,r} := {u : φ_a(u) + a(x − φ) ≥ r}`. In `BruhatTits`, define `Apartment` as
`A(φ) = {(ψ,v) : ψ_a = φ_a + a(v)}`, `Apartment.instAddTorsor` making `A` an `AddTorsor` under `V`,
`Apartment.action` as the reduced action lifted with fixed central coordinate,
`Apartment.rationalAction` as the enlarged action of the actual `N_G(S)(K)`, `Apartment.transport`
as the change of base point, and `Apartment.filtrationAt` as `U_{a,x,r}` for `x ∈ A`, `a ∈ Φ`,
`r ∈ ℝ`; prove `Apartment.vadd_def` (`(v +ᵥ ψ)_a = ψ_a + a(v)`), `Apartment.vadd_displacement`,
`Apartment.vsub_displacement`, `Apartment.filtrationAt_vadd` (`U_{a,v+x,r} = U_{a,x,r−a(v)}`) and
`Apartment.transport_displacement`; for finite `Φ`, `Apartment.action_val` (`ν(n)ψ = n·ψ`),
`Apartment.action_vsub_mem` (the translation part lies in the span of the coroots),
`Apartment.action_linear` (the linear part of `ν(n)` is the image of `n` in `W(Φ)`),
`Apartment.action_reflection` (the reflection formula) and `Apartment.ker_action` (the kernel lies
in `T`); and, for the enlarged action, `Apartment.action_torus` (`z ∈ Z(K)` acts by the translation
`v(z)`), `Apartment.rationalAction_valuation` and `Apartment.rationalAction_central`
([Bruhat–Tits I], 6.1.11 (ii), p. 115, 6.2.5–6.2.6, p. 120, 6.2.7, p. 121, and 6.2.10,
pp. 122–123; [Bruhat–Tits II], 4.2.16, p. 94; [Bruhat–Tits I], 7.4.1–7.4.3, pp. 170–172). *Needs:*
*valuation-of-root-datum*; *torus-valuation-map*.
The enlarged central translation is determined by `−ω(χ(g))` for rational characters of `G`.
Root-valuation conjugation alone does not determine it. Transport to another base valuation
therefore takes an apartment point with a chosen displacement: coordinates change by
`v ↦ v − v_base`. Its reduced part is canonical; the enlarged identification is only unique
up to central translation ([Bruhat–Tits II], 4.2.16, p. 94).

**Checks.**

- `Apartment.central_transport_ambiguity` — for an empty root system, base points with the same
  valuation and displacements `v ≠ w` give different coordinate transports.
- `Apartment.sl2_reflection` — for a rank-one datum (as for `SL_2`), `m = u'uu''` with `φ_a(u) = 0`
  fixes the base point: the Weyl element acts on `A ≅ ℝ` by the reflection fixing the base
  valuation.
- `Apartment.rankZero_singleton` — for `V = 0` (so `Φ = ∅`), `A` is a single point.
- `Apartment.central_displacement` — with no roots, distinct displacements give distinct
  apartment points although all root valuations agree.
- `Apartment.addTorsor_compat` — `(ψ₁ −ᵥ ψ₂) +ᵥ ψ₂ = ψ₁`.
- `Apartment.filtrationAt_two_terms` — the sign of the translation action on filtrations: if
  `a(v₁) = 1` and `a(v₂) = 2`, then `U_{a,v₁+x,1} = U_{a,x,0} = U_{a,v₂+x,2}`.
- `Apartment.not_linear_space` (non-example) — for `V ≠ 0` no point is fixed by all translations,
  so the apartment has no canonical origin; `A ≅ V` needs a choice of base point.
- `Apartment.filtrationAt_base` — at the base point `U_{a,φ,r} = U_{a,r}`.
- `Apartment.filtrationAt_mem` — the sign of the displacement: `u ∈ U_{a,x,r}` iff
  `φ_a(u) + a(x − φ) ≥ r`.
- `Apartment.transport_base` — the new base point has displacement `0` after transport.
- `Apartment.transport_val` — transport changes coordinates, not points: it keeps the root
  valuations of every point.
- `Apartment.rationalAction_boundedPart` — an element of `Z(K)^1 = ker v` fixes every point.
- `Apartment.rationalAction_conj_torus` — conjugation and the action agree: for `z ∈ Z(K)` with
  `⟨a, v(z)⟩ = −1`, `zU_{a,x,r}z^{-1} = U_{a,z·x,r} = U_{a,x,r+1}`.

**Root-group coordinates in quasi-split groups.** (*quasi-split-root-group-coordinates*) Let `G` be
quasi-split with a fixed Chevalley–Steinberg system, and let `K_a` be the splitting field of `a`. In
case I, `2a ∉ Φ`: `U_a ≅ Res_{K_a/K} G_a` and `x_a : K_a ≅ U_a(K)`. In case II, `2a ∈ Φ`:
`K_a/K_{2a}` is separable quadratic, `U_a ≅ Res_{K_{2a}/K} U_0` with `U_0 ⊂ SU_3(K_a/K_{2a})` the
unipotent radical of a Borel, `U_0(K_{2a}) = H_0 := {(u, v) : v + v̄ = uū}`, `x_a : H_0 ≅ U_a(K)` and
`x_a(0, v) ∈ U_{2a}`. The simply connected cover of the rank-one derived subgroup
`⟨U_a, U_{−a}⟩` is `Res_{K_a/K} SL_2` in case I and `Res_{K_{2a}/K} SU_3` in case II; the subgroup
in `G` can be a central quotient. Another Chevalley–Steinberg system rescales `x_a` by `K_a^×`,
with explicit maps of `H_0` in case II ([Bruhat–Tits II], 4.1.4, p. 78; 4.1.8–4.1.14, pp. 81–85).
The general coordinates `x_a` and the rank-one subgroups are statements of the roadmap without a
Lean target; for `GL_n` the coordinates are the Tau Ceti transvections `TauCeti.transvectionHom`,
with torus conjugation `TauCeti.diagGL_mul_transvectionUnit_mul_inv`
(`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean`). In `BruhatTits.QuasiSplit`,
define `H0` as `H_0 = {v + v̄ = uū}` with the law `(u+u', v+v'+ūu')` and inverse `(−u, v̄)`,
`rootField` as the field `K_a ⊂ K̄` of definition of an absolute root (the subfield of the finite
Galois splitting field fixed by its stabilizer for the Galois action on the based root datum, not
the subfield of all of `K̄`, which for imperfect `K` contains the perfect closure; `L_a` of [Bruhat–Tits II], 4.1.8,
p. 81, for `a` its restriction), pinned by `rootField_le_splittingField` and `rootField_fixed_iff`,
`antidiagonalForm` as the hermitian form defining `SU_3`, and `unitaryCoord` as the matrix
`I + c e_{0i} + d e_{−i,i} − τ(c) e_{−i,0}`; prove `unitaryCoord_mem_iff` (for an involutive `τ`,
`u_i(c, d)` preserves the form iff `τ(c)c + d + τ(d) = 0`) ([Bruhat–Tits II], 4.1.9, p. 82;
[van Hoften], App. A by R. Zhou, A.3.5–A.3.6, pp. 60–61 (arXiv v4 pp. 70–71)).
*Needs:* *rational-points-root-datum*; RG2.0a *weil-restriction-group-scheme*; ReductiveGroups
layer 7.

**Checks.**

- `H0_mul_assoc` — the law and the inverse of `H_0` are the displayed formulas; the group axioms are
  proved in the instance, and `(−u, v̄)` again satisfies `v̄ + v = uū`.
- `not_additive_multipliable` (non-example) — `H_0` is non-commutative: `(u,v)` and `(u',v')` commute
  only up to `(0, ūu' − ū'u) ∈ U_{2a}`; for `2 ≠ 0` and `δ ≠ 0` with `δ̄ = −δ`, the elements
  `(1, ½)` and `(δ, δδ̄/2)` lie in `H_0` and their commutator is `(0, 2δ) ≠ 0`. (Note that `(u, 0)`
  lies in `H_0` only for `u = 0`.)
- `split_case` — if the Galois action on the root datum is trivial, as for a split group, every
  `K_a = K`.
- `rootField_finite` — `K_a/K` is finite.
- `rootField_ne_bot` (non-example) — if some Galois element moves the root, then `K_a ≠ K`.
- `H0_commutator` — `(u,v)(u',v')` and `(u',v')(u,v)` have equal first coordinates and second
  coordinates differing by `ūu' − ū'u`, the coordinate of an element of `U_{2a}`.
- `H0_trivial_star` — for the trivial involution (of `ℝ`) the law is commutative, so the
  noncommutativity of `H_0` comes from the conjugation of the quadratic extension.
- `unitaryCoord_zero` — `u_i(0, 0) = 1`.
- `unitaryCoord_identity` — over `𝔽₂` with `τ = id` (residue characteristic two) the condition reads
  `c² = 0`: `u(0, 1)` preserves the form and `u(1, 0)` does not.
- `unitaryCoord_quadratic` — over `𝔽₄` with the involution `x ↦ x²` the condition `1 + d + d² = 0` is
  solved by a primitive cube root of unity, giving a unitary `u(1, d)`.
- `unitaryCoord_not_cubic` (non-example) — for the order-three automorphism `x ↦ x²` of `𝔽₈` the
  equivalence of `unitaryCoord_mem_iff` fails, so the involution hypothesis is needed.

**The valuation of a quasi-split group.** (*quasi-split-valuation*) Here the field hypothesis is
wider than the standing DVR convention: take a nontrivial real-valued valuation with a unique
extension to a finite Galois splitting field. Let `G` be quasi-split with coordinates `x_a`,
and let `ω_a` be the induced extension to `K_a`. The formulas `φ_a(x_a(u)) = ω_a(u)` in case I,
and `φ_a(x_a(u, v)) = ½ω_a(v)`, `φ_{2a}(x_a(0, v)) = ω_a(v)` in case II, define an `ω`-compatible
valuation `φ`; its value sets are `Γ_a = ω_a(K_a^×)` in case I, and in case II they are given by
[Bruhat–Tits II], 4.2.21, p. 98; other Chevalley–Steinberg systems give equipollent valuations
([Bruhat–Tits II], 4.2.2, p. 89; Theorem 4.2.3, pp. 89–90; Proposition 4.2.9, p. 91).
The Lean targets state the existence of such a valuation, the formulas being statements of the
roadmap: `QuasiSplit.valuation_real` in the non-discrete scope, with the extension uniqueness and
the characters of the minimal Levi computing the torus translations, and `QuasiSplit.valuation`
for a henselian, nontrivial, discrete, rank-one valuation. Quasi-splitness is expressed by the actual centralizer
of the maximal split torus being a torus, as in [Bruhat–Tits II], 4.1.1, p. 77.
*Needs:* *quasi-split-root-group-coordinates*; *valuation-of-root-datum*.

**Affine roots and root-group filtrations.** (*affine-roots-and-filtrations*) Put
`Γ_a := φ_a(U_a ∖ 1)` and `Γ'_a := {φ_a(u) : φ_a(u) is maximal on uU_{2a}}`. The affine roots are
the functions `α = a + k : x ↦ a(x − φ) + k` with `k ∈ Γ'_a`; their half-apartments are `{α ≥ 0}` and
their walls `{α = 0}`; `U_α := U_{a,k}` and `U_{a,k+} := ⋃_{l>k} U_{a,l}`. For reductive groups,
`Γ_a = Γ'_a` is a coset of a discrete group determined by the ramification of `K_a` when `a` is
non-multipliable; otherwise the values come from `SU_3`, and `Γ'_a ⊊ Γ_a` is possible in the
ramified case. In `BruhatTits`, define `Valuation.primedValueSet` as `Γ'_a` (the values `φ_a(u)`,
`u ≠ 1`, maximal on the coset `uU_{2a}`; `Valuation.valueSet` is `Γ_a`), `AffineRoot` as `α = a + k`
with `a ∈ Φ` and `k ∈ Γ'_a` — not `k ∈ Γ_a` — as a map on `A`, `AffineRoot.gradient` as the vector
part `a ∈ Φ` of `α`, `AffineRoot.wall` as `{x : a(x − φ) + k = 0} ⊂ A`, `AffineRoot.rootSubgroup` as
`U_α = U_{a,k}` and `AffineRoot.valueSet` as the set of constants of the affine roots of gradient
`a`, which is `Γ'_a` (`AffineRoot.valueSet_eq`); prove `Valuation.primedValueSet_subset_valueSet`
(`Γ'_a ⊆ Γ_a`), `AffineRoot.rootSubgroup_mono` (if `α ≤ β` on `A` with the same gradient then
`U_β ⊂ U_α`) and `AffineRoot.filtrationAt_antitone` (`U_{a,x,s} ⊂ U_{a,x,r}` for `r ≤ s`)
([Bruhat–Tits I], 6.2.2–6.2.6, pp. 117–120; [Bruhat–Tits II], 4.2.20–4.2.23, pp. 97–99; [He 2018],
proof of Lem. 4.6, pp. 13–14). *Needs:* *apartment*; *quasi-split-valuation*.

**Checks.**

- `AffineRoot.sl2_affine_roots` — for a non-multipliable root with `Γ_a = ℤ` (as for `SL_2` with
  `ω(K^×) = ℤ`, where `U_{a+n} = x_+(ϖ^n O)`), the affine roots of gradient `a` are `a + n`, `n ∈ ℤ`.
- `AffineRoot.rootSubgroup_top` — `U_{a,∞} = ⋂_k U_{a,k} = {1}`.
- `Valuation.primedValueSet_eq_of_not_multipliable` — for a non-multipliable root `Γ'_a = Γ_a`.
- `AffineRoot.wall_base` — the base point lies on the wall of `a + k` iff `k = 0`.
- `AffineRoot.wall_vadd` — `v + x` lies on the wall of `a + k` iff `a(v) + a(x − φ) + k = 0`.
- `AffineRoot.wall_ne_univ` (non-example) — a wall is a proper subset, since `a(a^∨) = 2`.
- `AffineRoot.rootSubgroup_ne_bot` (non-example) — `U_α ≠ 1`: the constant `k ∈ Γ'_a` is the value
  of some `u ≠ 1`, which lies in `U_{a,k}`.
- `AffineRoot.rootSubgroup_le` — `U_α ⊆ U_a` for the gradient `a` of `α`.
- `AffineRoot.not_all_values` (non-example) — for ramified `SU_3` in odd residue characteristic,
  `Γ'_a = ½ℤ ⊊ ¼ℤ = Γ_a` with `ω(K^×) = ℤ` ([Bruhat–Tits II], 4.2.21, p. 98), and using
  `Γ_a` as the set of affine-root values adds spurious walls; the Lean example asserts a valued root
  datum of type `BC₁` with these value sets.

**Commutator estimates for valued root groups.** (*valued-commutator-estimates*) Three estimates.
(1) For non-proportional `a, b`, `[U_{a,x,r}, U_{b,x,s}]` is contained in the subgroup generated by
the `U_{pa+qb,x,pr+qs}`, `p, q ≥ 1`. (2) For `r + s > 0`,
`U_{a,x,r} U_{−a,x,s} ⊂ U_{−a,x,s} Z(K)^1 U_{a,x,r}`, where `Z(K)^1` is the bounded part of the
minimal Levi. (3) For `n ∈ N(K)` with `nU_a n^{-1} = U_b`, `nU_{a,x,r}n^{-1} = U_{b,ν(n)x,r}`; in
particular `zU_{a,x,r}z^{-1} = U_{a,z·x,r}` for `z ∈ Z(K)`. In `BruhatTits`, prove
`AffineRoot.commutator_le` (1), `Apartment.opposite_filtrationAt_mul` (2) and
`Apartment.filtrationAt_conj` (3) ([Bruhat–Tits I], 6.2.1 (V3), p. 117; 6.3.9, p. 131, taking doubled-root depths `2r, 2s`,
and 6.4.7 (QC1), 6.4.9, pp. 135–136; and 6.2.10 (iii), p. 122). For reductive groups the estimates come with explicit Chevalley constants in
`G(K)` ([Bruhat–Tits II], Annexe (Relations de commutation), pp. 169–177). *Needs:*
*affine-roots-and-filtrations*; Tau Ceti `TauCeti.GeneralLinear.commutatorElement_rootSubgroupPoints`.

All geometric building and model signatures use `GeometricValuation D φ`: the field valuation
is nontrivial, discrete and of rank one, and `φ` satisfies `Valuation.IsCompatible` for the actual
`torusValuationMap D`. The abstract V0–V5 theory retains its real-valued scope. In particular,
`QuasiSplit.valuation_real` assumes the specified nontrivial real valuation has a unique extension
to the finite Galois splitting field. `QuasiSplit.valuation` uses a henselian, discrete, rank-one valuation
and quasi-splitness of the actual group, expressed by its minimal Levi being a torus.

**Checks.**

- `GLBuilding.standard_GL2_depths` — upper root parameters `ϖ` and `ϖ²` have depths `1` and `2`.
- `SLTwo.valuation_two_terms` — over `ℚ_p`, `ω(p)=1` and `ω(p²)=2`, including `p=2`.
- `SLTwo.valuation_root_entries` — the upper root-group element with entry `p` has value `1`, the
  lower one with entry `p²` has value `2`.
- `NormTorus.quadratic_torus_translation` — the anisotropic quadratic norm-one torus has zero
  apartment translation; `quadratic_building_point` identifies its building with a singleton.

**Checks for the negative valuation convention.**

- `Valuation.isCompatible_rankZero` — with no relative roots every valuation is compatible with every
  homomorphism `Z(K) → V`.
- `Valuation.isCompatible_iff_filtrationAt` — `φ` is compatible with `v` iff
  `zU_{a,φ,r}z^{-1} = U_{a,v(z)+φ,r}` for all `z ∈ Z(K)`: `z` moves the base point by `v(z)`.
- `Valuation.isCompatible_not_inv` (non-example) — a valuation compatible with both `v` and `v^{-1}`
  has `a(v(z)) = 0` for all `a`, `z`, so the sign of `v` is forced.
- `GLBuilding.torus_two_terms` — diagonal `diag(ϖ,1)` and `diag(ϖ²,1)` translate by `(-1,0)`
  and `(-2,0)`; `standard_torusValuation` computes every coordinate from actual diagonal entries.
- `GLBuilding.torus_units` — diagonal units have zero translation.
- `GLBuilding.torus_scalar_not_zero` — `ϖ·I₂` has nonzero central translation despite acting
  trivially on the reduced building.

### RG2.1.3 existence of the valued root datum

**Existence of the valued root datum.** (*valued-root-datum-existence*) For `G` reductive over `K`,
the root datum `(Z(K), (U_a(K)))` of `G(K)` admits an `ω`-compatible valuation, unique up to
equipollence, two such valuations differing by some `v ∈ V`; this is `exists_valuation_compatible`,
for `K` henselian for a nontrivial, discrete, rank-one valuation with perfect residue field, so for
every `G`
over `E` and over `Ĕ` ([Bruhat–Tits II], 5.1.1, 5.1.20 and 5.1.23, pp. 145–155; [Bruhat–Tits II],
Introduction, p. 7). Other maximal split tori give `G(K)`-conjugate valued root data; this is a
statement of the roadmap without a Lean target. *Needs:* *quasi-split-valuation*;
*steinberg-quasi-split*; *rational-maximal-unramified-split-torus*; *apartment*.

**Valuations and apartments under unramified extension.** (*unramified-descent-of-valuation*) Let
`K'/K` be unramified Galois, finite or the completed maximal unramified extension, and `S ⊂ S'` with
`S'` a `K`-rational maximal `K'`-split torus. The valuation `φ` on `G(K)` is the restriction of a
Galois-invariant compatible valuation `φ'` on `G(K')`: `U_a(K) = (∏_{b↦a} U_b(K'))^{Gal}` and
`φ_a = inf φ'_b`; `A(G, S, K) = A(G, S', K')^{Gal}` equivariantly for the
induced `N(K)` action. An element of `N(K)` need not normalize the chosen `S'`; it is
adjusted by an element of `Z(S)(K')` as in [Tits], §1.10, p. 36; and the affine
roots of `A(G, S, K)` are the restrictions of those of `A(G, S', K')` whose gradient is nonzero on `V`
([Bruhat–Tits II], 5.1.16–5.1.21, pp. 151–154; [Bruhat–Tits I], 9.2.1–9.2.14, pp. 204–209). The
Lean targets are for a nonarchimedean local field `E` and `K' = Ĕ`: `apartmentDescent`,
`apartmentDescent_injective`, `apartment_eq_fixedPoints` (the descended apartment is the
Frobenius-fixed locus), `descentCharacter`, `descentCharacter_value` and
`apartmentDescent_linear_character`, together with `apartmentDescent_filtrationAt` (the descended
filtrations, [Bruhat–Tits II], 5.1.16, pp. 151–152) and `apartmentDescent_central`, stated in
RG2.1.4 *frobenius-action-on-apartment*; the descent of the root groups themselves, the adjustment
of `N(K)` and the restriction of affine roots are statements of the roadmap without a Lean target.
*Needs:* *valued-root-datum-existence*; *rational-maximal-unramified-split-torus*.

### RG2.1.4 the affine structure of the apartment

**Walls, alcoves and facets of the apartment.** (*affine-chamber-structure*) For an affine root
`α = a + k` and a point `x` of the apartment put `α(x) := a(x − φ) + k`, computed from the
displacement of `x` from the base valuation `φ`. The wall of `α` is `H_α := {α = 0}`, and the
facets are the classes of the relation "`sgn α(x) = sgn α(y)` for all `α`", with the value `0`
allowed; this relation makes sense for every valuation. Assume moreover finitely many root directions and
that every `Γ_a ∩ [r,s]` is finite, the `Valuation.IsDiscrete` condition. Then the walls are locally
finite, the alcoves are the connected components of `A ∖ ⋃H_α`, the facets are relatively open
convex polyhedra, ordered by `F ≤ F'` iff `F ⊂ F̄'`, and they are the facets of [Bruhat–Tits I],
1.3.3, pp. 20–21 (see 7.2.5, p. 162; for a dense valuation the facets of 7.2.4 are germs of sets,
which the sign classes do not model). The vertices are the minimal facets of the reduced apartment,
and enlarged facets are the reduced ones times `V_Z`. A point `x` is special iff for every root `a`
some wall through `x` has gradient a positive multiple of `a`, that is, every wall has a parallel
wall through `x` ([Bruhat–Tits I], 1.3.7, p. 22). In `BruhatTits`, define `AffineRoot.eval` as
`α(x)`, `Facet` as the sign classes of points, pinned by `Facet.carrier_nonempty`,
`Facet.existsUnique_mem_carrier` and `Facet.mem_carrier_iff` (every point lies in exactly one facet,
and a facet is a full sign class), `Facet.wall` as the union `⋃ H_α` of the walls,
`Facet.IsAlcove` as the condition that `F` meets no wall (an open facet), `Facet.le` as `F ≤ F'`
expressed through affine roots (every affine root nonnegative on `F'` is nonnegative on `F`), and
`Facet.IsSpecial` as the condition that every root direction is a wall direction at `x`; prove
`AffineRoot.mem_wall_iff` (`x ∈ H_α` iff `α(x) = 0`), `Facet.le_iff` (`F ≤ F' ≤ F` iff `F = F'`, by
sign patterns) and `Facet.locallyFinite` (for a discrete valuation and finitely many roots, a closed
line segment meets finitely many affine-root walls) ([Bruhat–Tits I], 1.3.1–1.3.7, pp. 19–22;
[Bruhat–Tits I], 7.2.1–7.2.7, pp. 161–163). *Needs:* *affine-roots-and-filtrations*; RootSystems
layer 4.

**Checks.**

- `Facet.sl2_alcoves` — if the roots are `±a` and the affine roots of gradient `a` have constants
  exactly `ℤ` (as for `SL_2` with `ω(K^×) = ℤ`), the alcoves are the strips
  `n < a(x − φ) < n + 1`, `n ∈ ℤ`.
- `Facet.rankZero` — for `Φ = ∅`, every facet is the whole apartment and is an alcove.
- `Facet.not_special_barycentre` (non-example) — a point on no wall, such as the barycentre of an
  alcove of `SL_2`, is not special once `Φ ≠ ∅`; in particular it is not a vertex.
- `Facet.not_isAlcove_of_special` (non-example) — once `Φ ≠ ∅`, the facet of a special point is not
  an alcove, since a special point lies on a wall.
- `Facet.le_rankZero` — with no roots every two facets are related by the closure order.
- `Facet.le_refl` — every facet lies in its own closure.
- `Facet.alcove_not_le` (non-example) — an alcove lies in the closure of no other alcove.
- `AffineRoot.eval_base` — at the base point `φ` the affine root `a + k` takes the value `k`.
- `AffineRoot.eval_coroot_two_terms` — moving by `a^∨` and by `2a^∨` raises `α(x)` by `2` and by
  `4`: the gradient of `a + k` enters with the sign of `a`, not of `−a`.

**The échelonnage root system.** (*echelonnage-root-system*) Let `φ` be discrete and `Φ` finite,
possibly non-reduced, and let `Φ_nm = {a ∈ Φ : 2a ∉ Φ}` be the nonmultipliable roots. The wall
gradients, rescaled by the wall spacing, form a reduced root system `Σ ⊂ V*`, the échelonnage: the
walls with gradient proportional to `a` are the `{a = k}` with `k` in a coset of `ℤc_a`, and
`Σ = {a/c_a}`, one root for each `a ∈ Φ_nm`; `Σ` and `Φ` have the same Weyl group. The wall
reflections generate `W(Σ) ⋉ Q^∨(Σ)`. If `Φ` is reduced and every `Γ_a = ℤ`, as for split `G` with
`ω(K^×) = ℤ`, then `Σ = Φ`; in general `Σ` need not be proportional to `Φ_nm` with one common
factor. For the ramified quasi-split `SU_{2n}` (`n ≥ 2`) the relative system is
`C_n = {±e_i ± e_j, ±2e_i}`, the walls of `e_i ± e_j` are spaced by `½` (their root fields are the
ramified quadratic extension) and those of `2e_i` by `1`, so `Σ = {±2(e_i ± e_j), ±2e_i}` is of type
`B_n`; its coroot lattice `{x ∈ (½ℤ)^n : Σx_i ∈ ℤ}` is the translation lattice `v(T(K))`, since an
element `diag(t_1, …, t_n, …)` of the maximal torus has `t_1⋯t_n ∈ K^×`. For the ramified
`SU_{2n+1}`, by contrast, the walls of `e_i` and of `2e_i` together are spaced by `¼` and `Σ` is of
type `C_n`, proportional to `Φ_nm = C_n`. The dominance order on `X_*(T)_I` defined by the positive
coroots of `Σ` belongs to RG2.4 *dominant-coinvariant-cocharacters*. In `BruhatTits`, define
`echelonnage` as `Σ ⊂ V*`, the reduced root pairing of a discrete `φ`, indexed by `Φ_nm` rather than
by all of `Φ`; prove `echelonnage_isReduced` (`Σ` is reduced), `echelonnage_proportional` (each
`α ∈ Σ` is a positive multiple of its index in `Φ_nm`, and so every `a ∈ Φ` is proportional to some
`α ∈ Σ`), `echelonnage_coroot` (`Σ` and `Φ` have the same reflections, so the coroot of
`α = c·a ∈ Σ` is `c^{-1}a^∨`; without it the coroots of `Σ` would be fixed only up to vectors
annihilated by every root), `echelonnage_walls` (for `x₀` special the walls are exactly the
hyperplanes `{α(x − x₀) = k}` with `α ∈ Σ` and `k ∈ ℤ`; one inclusion alone would also hold for `2Σ`) and
`echelonnage_split` (if `Φ` is reduced and every `Γ_a = ℤ` then `Σ = Φ`) ([Bruhat–Tits I],
1.3.8, pp. 22–23, 1.4.1, pp. 25–26, and 6.2.21–6.2.22, p. 127; [Haines], §4.3, pp. 9–10, Thm. 6.1
and Rem. 6.2, p. 13, arXiv v2; [van Hoften], Appendix A by R. Zhou, A.1, p. 54 (arXiv v4 p. 64)).
The `SU` types follow from [Haines], Rem. 6.2, p. 13, which identifies `Σ` with `Φ^∨` for a
non-split simply connected absolutely simple group with reduced relative root system over `Ĕ`, and
with `Φ_nm` when that system is non-reduced. *Needs:* *affine-chamber-structure*; Mathlib
`RootPairing`; Mathlib `RootPairing.IsReduced`.

**Checks.**

- `echelonnage_split_agreement` — for a reduced pairing with every `Γ_a = ℤ`, the coroots of `Σ`
  and of `Φ` agree as well, so `Q^∨(Σ) = Q^∨(Φ)`.
- `echelonnage_BC1_index` — for a pairing with roots `a, −a, 2a, −2a`, exactly `±2a` are
  nonmultipliable, so the échelonnage of a `BC_1` datum has two roots.
- `echelonnage_rank_zero` — for `Φ = ∅`, `Σ = ∅`.
- `echelonnage_BC1_scale` — for `Φ = BC_1` with `Γ'_a = ½ℤ` and `Γ'_{2a} = ½ + ℤ` (the ramified
  `SU_3` in odd residue characteristic with `ω(K^×) = ℤ`), the walls of `±a` and `±2a` together are
  the `{a(x − φ) ∈ ¼ℤ}`, so the root of `Σ` attached to `2a` is `4a`, not `2a`.
- `echelonnage_ne_relative` (non-example) — for the ramified quasi-split `SU_{2n}`, `n ≥ 2`, `Σ` is
  `B_n` while `Φ` is `C_n`; taking `Σ` proportional to `Φ` and normalized by the walls of the short
  roots `e_i ± e_j` gives `{±2e_i ± 2e_j, ±4e_i}`, whose coroot lattice is `(½ℤ)^n` instead of
  `{Σx_i ∈ ℤ}`. The Lean example uses the rank-two relative datum directly: roots
  `±(e₁+e₂), ±(e₁−e₂), ±2e₁, ±2e₂`, half-integral short-root jumps and integral long-root
  jumps. It finds `2(e₁+e₂)` in `Σ` and outside `Φ`; no unitary-group carrier is needed.

**The affine Weyl group.** (*affine-weyl-group*) The reflection in the wall of `α = a + k` is
`x ↦ x − α(x) a^∨`, the orthogonal reflection for every `W_0`-invariant metric
([Bruhat–Tits I], 6.2.10 (ii), p. 122). The affine Weyl group is `W_a := ⟨wall reflections⟩ ⊂ Aff(A)`.
For `φ` discrete and `Φ` finite: `W_a` acts simply transitively on the alcoves; `(W_a, S_aff)` is a
Coxeter system, with `S_aff` the reflections in the walls of an alcove `C`; at a special origin
`W_a = W(Φ) ⋉ Q^∨(Σ)`, where `W(Φ) = W(Σ)`. For every valuation, `W_a` lies in `ν(N)`, its
generators being the images `ν(m)` of the elements `m ∈ M_a` (6.2.10 (ii)), and it is normal there.
In `BruhatTits`, define `AffineRoot.reflection` by the displayed formula
(`AffineRoot.reflection_apply`), `AffineWeylGroup` as the subgroup of `Aff(A)` generated by the
`AffineRoot.reflection`s, `AffineWeylGroup.simpleReflections` as `S_aff` for a chosen alcove `C`
(the reflections in the walls containing a facet of `C̄` that lies on exactly one wall), and
`AffineWeylGroup.coxeterSystem` as the `CoxeterSystem` on `W_a`; prove
`AffineWeylGroup.coxeterSystem_simple` (its generators are `S_aff`),
`AffineWeylGroup.simplyTransitive_alcoves` (`W_a` acts simply transitively on alcoves),
`AffineWeylGroup.semidirect` (at a special point `x`, the elements of `W_a` are exactly the maps
`y ↦ w₀(y − x) + v + x` with `w₀ ∈ W(Φ)` and `v ∈ Q^∨(Σ)`), `AffineWeylGroup.le_range_action`
(`W_a ≤ ν(N)`) and `AffineWeylGroup.normal_in_image` (`W_a ⊲ ν(N)`); `coxeterSystem` and the
first three of these assume `φ` discrete and `Φ` finite, the last two hold for every valuation
([Bruhat–Tits I], 1.3.3–1.3.4, p. 21, 1.3.7–1.3.8, pp. 22–23, 6.2.10–6.2.11, pp. 122–123, 6.2.19,
p. 126, and 6.2.22, p. 127; [Kisin–Zhou], §2.1.4, arXiv v2 p. 7, for the Coxeter system).
*Needs:* *echelonnage-root-system*; RootSystems layer 3; Mathlib `CoxeterSystem`.

**Checks.**

- `AffineWeylGroup.sl2_infinite_dihedral` — the reflections in the parallel walls of `a + k` and
  `a + k + 1` compose to the translation by `−a^∨`; with constants `ℤ`, as for `SL_2`, this makes
  `W_a` infinite dihedral, `s_0s_1` being the translation by a primitive coroot.
- `AffineWeylGroup.rankZero_trivial` — for `Φ = ∅`, `W_a = 1`.
- `AffineRoot.reflection_involutive` — the reflection in the wall of `α` changes the sign of `α`
  and is an involution different from the identity, since `a(a^∨) = 2`.
- `AffineWeylGroup.simpleReflections_rankZero` — for `Φ = ∅` an alcove has no simple reflections.
- `AffineWeylGroup.simpleReflections_involutive` — every simple reflection `s` satisfies
  `s² = 1 ≠ s`.
- `AffineWeylGroup.simpleReflections_sl2` — for roots `±a` with affine-root constants `ℤ` (as for
  `SL_2` with `ω(K^×) = ℤ`), an alcove has exactly two simple reflections.
- `AffineWeylGroup.coxeterSystem_rankZero` — for `Φ = ∅` the Coxeter system has no generators.
- `AffineWeylGroup.coxeterSystem_sl2` — for roots `±a` with affine-root constants `ℤ` the Coxeter
  system has type `Ã_1`: two generators whose product has infinite order.
- `AffineWeylGroup.coxeterSystem_finite` — the Coxeter system has finitely many generators, their
  number being the sum of `1 + dim` over the irreducible factors ([Bruhat–Tits I], 1.3.4, p. 21),
  although `W_a` has infinitely many reflections once `Φ ≠ ∅`.
- `AffineWeylGroup.finite_quotient_compat` — the linear parts of the elements of `W_a` lie in
  Mathlib's `RootPairing.weylGroup` of `Φ`.
- `AffineWeylGroup.not_normal_in_affine` (non-example) — for `φ` discrete and `Φ ≠ ∅`, `W_a` is not
  normal in all of `Aff(A)`: conjugating `x ↦ −x` by the translation by `1/4` gives
  `x ↦ 1/2 − x`, whose intercept `1/2` is not that of a reflection of the integral group.
- `AffineWeylGroup.not_all_of_N` (non-example) — for `PGL_2`, `ν(N(K)) ⊋ W_a`, since `diag(ϖ, 1)`
  translates by half the shortest translation of `W_a` and swaps the vertex types. The pinned
  library has no compiled `PGL_2` carrier, so this check has no Lean mirror.

**Kernel and image of the action on the apartment.** (*apartment-action-kernel*) The kernel of the
enlarged action of `N(K)` on `A` is `Z(K)^1 = ker v` (`Apartment.rationalAction_ker`;
[Bruhat–Tits I], 6.2.10 (i), p. 122; [Bruhat–Tits II], 4.2.16, p. 94; [Richarz], §1.1, p. 118, where
it is the maximal compact subgroup of `Z(K)`). Hence `ν(N(K)) ≅ N(K)/Z(K)^1` is an extension of
`W_0 = N(K)/Z(K)` by the translation lattice `Λ` (`translationLattice`), with no splitting claimed.
For `φ` discrete and an alcove `C`, every element of `ν(N)` is `w·s` with `w ∈ W_a` and `s`
stabilizing `C` (`Examples.normalizer_mem_affineWeyl_mul_stabilizer`; [Bruhat–Tits I], 1.3.18, p. 25; [Richarz],
(1.5)–(1.6), p. 119), and `w` is unique by `AffineWeylGroup.simplyTransitive_alcoves`. For `G`
simply connected over a complete discretely valued field with perfect residue field of cohomological
dimension `≤ 1`, the quotient in [Richarz], (1.5), p. 119, vanishes because the centre of the dual
group is trivial, so `ν(N(K)) = W_a` (see also [Richarz], Rem. 1.5, p. 120); this last statement is
README-only. *Needs:* *apartment*; *affine-weyl-group*; *torus-valuation-map*.

**Affine Frobenius action on the apartment over Ĕ.** (*frobenius-action-on-apartment*)
Choose an actual `E`-torus containing the chosen maximal `E`-split torus and becoming
maximal split over `L = Ĕ`. Its Hopf ideal base-changes to the split torus in `LocalRootData L`;
this equality, torus structure and compatible valuation form `UnramifiedApartmentData`.
Frobenius acts on points by applying field Frobenius to coordinate values; `L`-points of the base
change are compared with `L`-valued points through Tau Ceti's `AlgHom.baseChangePointsMulEquiv`
(`unramifiedPointsEquiv`). Frobenius induces `frobeniusOnApartment`, with linear part dual to the
semilinear action on actual characters, and transports every root filtration. Its action factors
through a finite quotient and has a fixed point ([Bruhat–Tits II], 4.2.12, pp. 92–93, 5.1.4,
p. 147, and Lemma 5.1.13, p. 150). Bruhat–Tits work over the strict henselization `E^{un} ⊂ Ĕ`, over
which the chosen torus already splits (5.1.4). In the central directions Frobenius fixes the origin
of the base valuation: on the enlarged building `𝓑 × V¹` of [Bruhat–Tits II], 4.2.16, p. 94, it acts
linearly on `V¹ = Hom(X^*(G_Ĕ), ℝ)`, so the base point moves only within the span of the coroots
(`frobeniusOnApartment_central`). The linear part, the transport of filtrations and this condition
determine `frobeniusOnApartment`; for a torus, such as the norm-one torus of an unramified quadratic
extension, on whose `V = ℝ` Frobenius acts by `−1`, it is `x ↦ −x` about the base point and not
`x ↦ c − x` with `c ≠ 0`, although every such map has a fixed point and finite order.

`apartmentDescent` embeds the rational apartment in this apartment. Its derivative is the
cocharacter inclusion, characterized by character restriction, and its image is exactly the
Frobenius-fixed affine subspace ([Bruhat–Tits II], Theorem 5.1.20, pp. 153–154). Two further
properties determine it. `apartmentDescent_filtrationAt`: for an `E`-root `b` and `y` the image of
`x`, an element of `U_b(E)` lies in `U_{b,x,r}` iff its image in `G(Ĕ)` lies in the group generated
by the `U_{a,y,r}` for the `Ĕ`-roots `a` restricting to `b` and the `U_{a,y,2r}` for those
restricting to `2b` ([Bruhat–Tits II], 5.1.16, pp. 151–152, with 5.1.20); this fixes the image of every point up
to vectors annihilated by all roots. `apartmentDescent_central`: in the central directions the
origins of the two base valuations correspond, the descent being linear on the central factors
`V¹` of 4.2.16, p. 94. The affine map, character restriction and field action are constructed from
the group and tori; none is an arbitrary input. With finite residue field there is also a
Frobenius-stable alcove, including for inner forms ([Tits], 1.10.3, p. 37); it does not follow from
Lemma 5.1.13, which only gives a fixed point. `frobenius_stable_alcove` retains that conclusion
for a descended torus containing the chosen maximal base-field split torus.

*Needs:* *completed-maximal-unramified-extension*; *unramified-descent-of-valuation*.

**Checks.**

- `Frobenius.point_evaluation` — on points Frobenius is `(σg)(a) = σ(g(a))`.
- `Frobenius.identity_point` — Frobenius fixes the identity point.
- `Frobenius.rational_points_fixed` — Frobenius fixes every point coming from an `E`-point.
- `Frobenius.not_translation` (non-example) — the Frobenius action on the apartment is never a
  translation by a nonzero vector, since it has a fixed point.
- `Frobenius.base_change_tmul` — `unramifiedPointsEquiv` is inverse to base change of points,
  `s ⊗ a ↦ s·g(a)`, with no Frobenius twist on the scalars of `Ĕ`.
- `Frobenius.linear_split` — for a descended torus split over `E` the linear part of Frobenius is
  the identity.
- `Frobenius.character_split` — for such a torus Frobenius fixes every character.
- `Frobenius.character_finiteOrder` — Frobenius acts on the characters of the descended torus with
  finite order ([Bruhat–Tits II], 5.1.4, p. 147).
- `Frobenius.character_root` — Frobenius permutes the roots of `G_Ĕ`.
- `Frobenius.torus_origin` — for a torus over `Ĕ` (no roots), Frobenius fixes the base point.

**Checks for the descended apartment.**

- `Frobenius.descent_torus_origin` — for a torus over `Ĕ` the descent sends the base point of the
  rational apartment to the base point over `Ĕ`.
- `Frobenius.descent_split` — if the descended torus is the chosen `E`-split torus, the descent is
  onto.
- `Frobenius.descent_dimension` — the Frobenius-fixed vectors of `V(Ĕ)` form a space of the
  dimension of `V(E)` ([Bruhat–Tits II], 5.1.13 (ii), p. 150).
- `Frobenius.descentCharacter_frobenius` — a character of the descended torus and its Frobenius
  transform restrict to the same character of `S`.
- `Frobenius.descentCharacter_surjective` — every character of `S` extends to the descended torus.
- `Frobenius.descentCharacter_split` — if the descended torus is `S`, restriction of characters is
  an isomorphism.
- `Frobenius.split_GL2` — for the diagonal torus of split `GL₂`, arithmetic Frobenius is the
  identity on the entire two-dimensional apartment, including its central line.
- `Frobenius.split_SL2` — for the diagonal torus of `SL₂/ℚ_p`, it fixes the apartment pointwise.
- `Frobenius.SL2_base_torus_exists` — the diagonal torus of `SL₂/ℚ_p` is the torus of an
  unramified apartment datum, so the hypothesis of `Frobenius.split_SL2` is satisfiable.
- `Frobenius.ramified_norm_one` — for a quadratic extension generated by `a²=ϖ`, in every residue
  characteristic, the norm-one torus stays anisotropic over the completed unramified extension;
  its apartment is a singleton and Frobenius fixes it. The torus is the represented norm kernel.

**The Levi subgroup centralizing a vector of the apartment.** (*levi-of-apartment-vector*) For
`v ∈ V` (over `Ĕ`, `V = X_*(T)_I ⊗ ℝ`), put `M_v := ⟨Z, U_a : ⟨a, v⟩ = 0⟩`, the Levi subgroup of
the `K`-parabolic of `v`; it contains no `U_a` with `⟨a, v⟩ ≠ 0`. For a generating datum `M_v = G` iff
`v` is central. Over `Ĕ`, `σ(M_v) = M_{ς(v)}` with `ς` the linear Frobenius (this is immediate from
the definitions), so `M_v` is `E`-rational if `ς(v) = v`, and more precisely iff `v` and `ς(v)` are
annihilated by the same roots; the condition `ς(v) = v` is not necessary (for regular `v` with
`ς(v) ≠ v` regular, `M_v = M_{ς(v)} = Z` is rational). In `BruhatTits`, define `leviOfVector` as
`M_v = ⟨Z(K), U_a(K) : ⟨a, v⟩ = 0⟩` for a root datum in a group; prove `leviOfVector_eq_top_iff`
(for a generating datum, `M_v = G` iff `⟨a, v⟩ = 0` for all `a ∈ Φ`), `leviOfVector_smul`
(`M_{cv} = M_v` for real `c ≠ 0`), `leviOfVector_conj` (`nM_vn^{-1} = M_{w(n)v}` for `n` in the group
`N` of the datum, with one Weyl element `w(n)` for all `v`) and `leviOfVector_descends`
(`σ(M_v) = M_{ς(v)}` for an automorphism `σ` permuting the datum compatibly with a linear map `ς`,
so `M_v` is `σ`-stable if `ς(v) = v`) ([Kisin–Zhou], 2.1.6, arXiv v2 p. 8, with `ς` as in 2.1.3,
p. 7, for the rationality of `M_v` when `ς(v) = v`; [He 2018], §6.1, arXiv v3 p. 16). *Needs:*
*apartment*; *frobenius-action-on-apartment*; ReductiveGroups layer 7.

**Checks.**

- `leviOfVector_gl3` — for `GL_3` and `v = (1, 1, 0)`, `M_v` is the block-diagonal `GL_2 × GL_1`.
  The standard `GL_n` datum is declared after this layer, so this check has no Lean mirror here.
- `leviOfVector_zero` — `M_0 = ⟨T, U_a : a ∈ Φ⟩`, which is `G` for a generating datum.
- `leviOfVector_regular` — for regular `v`, `M_v = T`, the minimal Levi.
- `leviOfVector_not_parabolic` (non-example) — `M_v` is not the parabolic of `v`: it contains no
  root group with `⟨a, v⟩ > 0`.
- `leviOfVector_stable_of_regular` (non-example for an "iff") — for the unramified `U_3`,
  `v = (2, 1, 0)` and `ς(v) = (0, −1, −2)` are both regular, so `M_v = M_{ς(v)} = T` is `E`-rational
  although `ς(v) ≠ v`.

**Independence of choices.** (*transport-under-choices*) The apartment `A`, its affine roots and
walls, the groups `U_{a,x,r}` and the action `ν` are canonical, in the following sense. (1) Passing
to an equipollent `φ` with a specified displacement translates `A` and transports affine roots
(`Apartment.transport`, `Apartment.transport_displacement`); without that displacement the enlarged
transport has a central ambiguity. (2) Different Chevalley–Steinberg systems give equipollent `φ`,
and any two `ω`-compatible valuations are equipollent (`exists_valuation_compatible`;
[Bruhat–Tits II], 4.2.9–4.2.10, pp. 91–92, and 5.1.23, p. 155). Two README-only statements, for
`G` reductive over `K` as in RG2.1.3: (3) replacing `S` by `gSg^{-1}`, `g ∈ G(K)`, transports
everything by `Int(g)`, and the transport depends only on the class of `g` modulo `Z(K)^1 = ker ν`
(an element of `N(K)` acts on `A` through `ν`); (4) another maximal split torus `S'` is
`G(K)`-conjugate to `S` and receives the conjugate compatible `φ` ([Bruhat–Tits I], 6.2.5–6.2.12,
pp. 120–125; [Bruhat–Tits II], 4.1.13, p. 84, 4.2.12–4.2.13, pp. 92–93). *Needs:*
*valued-root-datum-existence*; *apartment*; ReductiveGroups layer 7.

**Minuscule coweights and the dominance order.** (*minuscule-coweight*) Let `Ψ` be a root datum with
a base. A coweight `μ ∈ Y` is dominant if `⟨a, μ⟩ ≥ 0` for every positive root `a`, and minuscule if
`⟨a, μ⟩ ∈ {−1, 0, 1}` for every root `a`. For dominant `λ`, `μ`, `λ ≤ μ` iff `μ − λ` lies in the
`ℕ`-span of the simple coroots. With `ρ := ½Σ_{a>0} a`, the pairing `⟨2ρ, μ⟩` is, for minuscule
dominant `μ`, the number of positive roots with `⟨a, μ⟩ = 1`, that is `dim G/P_μ`, and `μ_dom` is the
dominant member of the Weyl orbit `{μ}`. In `BruhatTits`, define `IsMinuscule` by the displayed
root-pairing condition; it differs from Tau Ceti's `TauCeti.IsMinuscule`, a condition on dominant
weights of a Killing Lie algebra phrased through the weights of the irreducible module. Use
`TauCeti.dominantChamber` of the flipped pairing for dominance,
`TauCeti.posRootCone` of the flipped base for the integral coroot cone,
`TauCeti.existsUnique_mem_orbit_inter_dominantChamber_of_finite_weylGroup` for the dominant
representative, and `TauCeti.twoWeylVector` for `2ρ`. Their exact files are listed above
([Kisin–Pappas], §2.1.1, footnote 3, arXiv v3 p. 25, for the definition; [Zhu], §1.4, Prop. 1.23
and Cor. 1.24, arXiv v3 p. 19, for `⟨2ρ, μ⟩ = dim G/P_μ`). *Needs:* Mathlib `RootPairing`;
RootSystems layer 4; ReductiveGroups layer 7.

**Checks.**

- `IsMinuscule.rankZero` — with no roots, every coweight is minuscule.
- `IsMinuscule.zero` — `0` is minuscule.
- `IsMinuscule.negation` — negating a minuscule coweight preserves the condition.
- `IsMinuscule.not_double` (non-example) — if `⟨a, μ⟩ = 1`, then `⟨a, 2μ⟩ = 2`, so `2μ`
  is not minuscule; for `GL_2` this excludes `(2,0)`.

### RG2.1.5 arithmetic invariants: π₁, z-extensions and the Kottwitz homomorphism

**The algebraic fundamental group.** (*algebraic-fundamental-group*) Let `G` be connected reductive
over a field `K`, with absolute root datum `D`: a maximal `K`-torus `T`, the lattices `X^*(T)` and
`X_*(T)` over `K̄`, the coroot lattice `Q^∨ ⊂ X_*(T)` and the based Galois action `μ_G` of `Γ_K`.
Define `π₁(G) := X_*(T)/Q^∨` ([Pappas–Rapoport], §2.a.2, p. 10, after Borovoi). The action of `Γ_K`
through `μ_G` differs from the geometric action by Weyl elements, and the Weyl group acts trivially
on `X_*(T)/Q^∨`; so `π₁(G)` carries one Galois action and does not depend on `T` up to unique
isomorphism ([Kaletha], Lem. 4.2 and its proof, p. 17, stated over a local field of characteristic
`0`; the argument uses only the root datum). The Lean statements below are made for one fixed
absolute root datum `D`, that is one maximal torus, and none of them compares two choices of `T`,
so this independence is not used. The derived group has cocharacter lattice the saturation `Q̄^∨`
of `Q^∨` in `X_*(T)` and is simply connected iff `Q̄^∨ = Q^∨` ([Springer], 2.15 (a) and (e), p. 11,
with the lattices of 1.8, p. 6). Hence the torsion subgroup of `π₁(G)` is the finite group
`Q̄^∨/Q^∨ = π₁(G_der)`, which vanishes iff `G_der` is simply connected; and since `G` is semisimple
iff `Q^∨` has finite index in `X_*(T)`, `π₁(G) = 0` iff `G` is semisimple and simply connected.
A homomorphism `G → G'`
carrying `T` into a maximal torus `T'` induces `X_*(T) → X_*(T')`; it sends coroots into `Q'^∨`,
since the homomorphism lifts to the simply connected covers of the derived groups ([Kaletha],
p. 18, the sentence before (4.3), stated there without proof),
so it induces a `Γ_K`-equivariant map `π₁(G) → π₁(G')`. If `G̃ → G` is a quotient
map whose kernel `Z` is a central torus and `T̃` maps to `T`, then
`0 → X_*(Z) → X_*(T̃) → X_*(T) → 0` is exact and the coroots of `G̃` map bijectively to those of
`G`, so `0 → X_*(Z) → π₁(G̃) → π₁(G) → 0` is exact (derived from these two facts; [Haines–Rapoport],
(2), p. 3, states the sequence of `I`-coinvariants for a z-extension, in the dual notation
`X^*(Z(Ĝ)^I)`). For the standard
Levi subgroup `M` whose simple roots form `levi ⊂ Δ`, `π₁(M) = X_*(T)/⟨a^∨ : a ∈ levi⟩`, and since
`Q^∨ = ⟨a^∨ : a ∈ Δ⟩` the kernel of `π₁(M) → π₁(G)` is spanned by the images of the simple coroots
not in `levi` (derived from the definition). For a subgroup `I ⊂ Γ_K` the coinvariants `π₁(G)_I`
may have torsion; when `I` is normal, `Γ_K/I` acts on them (for `I` the inertia group of `E`,
through `σ`).

In `BruhatTits.AlgebraicFundamentalGroup`, with `AlgebraicFundamentalGroup D := X_*(T)/Q^∨` defined
at the start of `Suggested.lean`, define `cocharacterRepresentation` as `X_*(T)` with `γ` acting by `μ_G(γ)` (Mathlib's
`RootPairing.Equiv.coweightEquiv` is the transpose, which is contravariant, so its inverse is used:
`γ` acts on `X_*(T)` by the inverse transpose of its action on `X^*(T)` and the pairing is
`Γ_K`-invariant; with the transpose itself an element of order three, as for the norm-one torus of
a cyclic cubic extension, would act through its inverse), `galoisAction` as the
induced representation on `π₁(G)` (Mathlib `Representation.quotient`; `galoisAction_mk` computes it
on classes), `inertiaCoinvariants D I` as Mathlib's `Representation.Coinvariants` of `galoisAction`
restricted to `I` (`Mathlib/RepresentationTheory/Coinvariants.lean`; for normal `I`, Mathlib's
`Representation.quotientToCoinvariants` is the action of `Γ_K/I`), `map` as the map induced by a
lattice homomorphism carrying coroots into the coroot lattice (`map_mk`), `torus` as the
identification `π₁ ≃ X_*` when there are no roots (`torus_mk`), `TorusCompatible D D' f` as the
condition that the coordinate map `f` of `G → G'` sends the ideal of `T'` into that of `T`,
`characterPullback` as `X^*(T') → X^*(T)`, fixed by evaluation at `K̄`-points of `T`
(`characterPullback_value`), and `cocharacterMap` as its dual `X_*(T) → X_*(T')`
(`cocharacterMap_pairing`). Prove `torusCompatible_of_torus` (every homomorphism into a torus is
compatible), `cocharacterMap_coroot` (coroots go into `Q'^∨`), `map_galoisAction` (the induced map
on `π₁` is `Γ_K`-equivariant), `exact_central` (for a quotient map with injective coordinate map,
kernel a central torus and compatible tori: the induced map on `π₁` is onto, its kernel is the
image of `ker(cocharacterMap) = X_*(Z)`, and `X_*(Z) ∩ Q̃^∨ = 0`), `leviKernel` (for
`levi ⊆ D.base.support`) and `weyl_invariant` (`W` acts trivially on `X_*(T)/Q^∨`). *Needs:*
ReductiveGroups layer 7; Mathlib `RootPairing`, `Representation.Coinvariants`.

**Checks.**

- `AlgebraicFundamentalGroup.gl_n` — for `n ≥ 1`, `π₁(GL_n) ≅ ℤ` by `(a_1, …, a_n) ↦ Σa_i`, while
  `X_*(T) = ℤ^n`; `GL_0` is trivial and has `π₁ = 0`.
- `AlgebraicFundamentalGroup.sl_n` — `π₁(SL_n) = 0` for every `n`.
- `AlgebraicFundamentalGroup.pgl_n` — for `n ≥ 1`, `π₁(PGL_n) ≅ ℤ/n`, trivial at `n = 1`
  and finite nonzero at `n ≥ 2`. The Lean example uses `AlgebraicFundamentalGroup D` for a
  reductive Hopf-algebra carrier `H`, with an injective coordinate map for `GL_n → H` whose
  kernel on every algebra is precisely the scalar matrices. These hypotheses identify `H`
  with the algebraic central quotient, including in characteristic dividing `n`.
- `AlgebraicFundamentalGroup.not_cocharacters` (non-example) — `π₁(SL_2) = 0` although
  `X_*(T) ≅ ℤ`, so `π₁` is not the cocharacter lattice.
- `AlgebraicFundamentalGroup.galoisAction_gl_n_trivial` — `Γ_K` acts trivially on `π₁(GL_n)`,
  which is detected by the `K`-rational character `det`.
- `AlgebraicFundamentalGroup.galoisAction_normOne` — for the norm-one torus of a separable quadratic
  `L/K`, `π₁ = X_*(T) ≅ ℤ` and every `γ` that moves `L` acts by `−1`.
- `AlgebraicFundamentalGroup.inertiaCoinvariants_bot` — for `I = 1`, `π₁(G)_I = π₁(G)`.
- `AlgebraicFundamentalGroup.map_id` — the identity lattice map induces the identity of `π₁(G)`.
- `AlgebraicFundamentalGroup.cocharacterMap_id` — the identity homomorphism induces the identity of
  `X_*(T)`.
- `AlgebraicFundamentalGroup.cocharacterRepresentation_pairing` — `⟨μ_G(γ)χ, γ·y⟩ = ⟨χ, y⟩`: `γ`
  acts on `X_*(T)` by the inverse transpose of `μ_G(γ)`. This pins the variance: the transpose
  itself fails it for an element of order three (norm-one torus of a cyclic cubic extension), where
  the two choices differ by `γ ↦ γ⁻¹`; for the quadratic norm-one torus they agree.
- `AlgebraicFundamentalGroup.cocharacterRepresentation_torus` — for a torus, `γ` on cocharacters is
  contragredient to the Galois action `γ •` on geometric characters.
- `AlgebraicFundamentalGroup.cocharacterRepresentation_split` — if `μ_G` is trivial (split `G`),
  `Γ_K` acts trivially on `X_*(T)`.
- `AlgebraicFundamentalGroup.galoisAction_split` — likewise `Γ_K` acts trivially on `π₁(G)`.
- `AlgebraicFundamentalGroup.map_comp` — `map` is functorial in the lattice map.
- `AlgebraicFundamentalGroup.map_torus` — with no roots on either side, `map` is the lattice map
  itself under `torus`.
- `AlgebraicFundamentalGroup.inertiaCoinvariants_normOne` — for the norm-one torus of a separable
  quadratic `L/K` and a subgroup `I` containing an element that moves `L`, `π₁(T)_I ≅ ℤ/2`.
- `AlgebraicFundamentalGroup.inertiaCoinvariants_split` — for split `G` and every `I`,
  `π₁(G)_I = π₁(G)`.
- `AlgebraicFundamentalGroup.TorusCompatible_id_iff` — the identity of `G` is compatible with two
  maximal tori iff they are equal (non-example: two distinct maximal tori of `GL_2`).
- `AlgebraicFundamentalGroup.TorusCompatible_points` — compatibility holds iff every `R`-point of
  `T` maps to an `R`-point of `T'`, for every `K`-algebra `R`.
- `AlgebraicFundamentalGroup.TorusCompatible_trivial` — the trivial homomorphism (coordinate map
  `a ↦ ε(a)`) is compatible.
- `AlgebraicFundamentalGroup.characterPullback_id` — the identity pulls back characters
  identically.
- `AlgebraicFundamentalGroup.characterPullback_trivial` — along the trivial homomorphism every
  character pulls back to `0`.
- `AlgebraicFundamentalGroup.characterPullback_comp` — pullback is contravariantly functorial.
- `AlgebraicFundamentalGroup.cocharacterMap_trivial` — the trivial homomorphism induces `0` on
  cocharacters.
- `AlgebraicFundamentalGroup.cocharacterMap_comp` — `cocharacterMap` is functorial.
- `AlgebraicFundamentalGroup.cocharacterMap_torus_equivariant` — for a homomorphism of tori,
  `cocharacterMap` commutes with the action of `Γ_K`.

**z-extensions.** (*z-extension*) A z-extension of `G` over a field `K` is a quotient map
`G̃ ↠ G` of connected reductive `K`-groups whose kernel `Z` is central and an induced torus
`∏ Res_{K_i/K} G_m`, and whose derived group `G̃_der` is simply connected ([Nguyễn Quốc Thắng],
§2.0, p. 4, where centrality is not listed: a normal torus of a connected group is central).
Use `TauCeti.CommHopfAlgCat.derivedDefiningIdeal` from the imported
`TauCeti/Algebra/AlgebraicGroup/Derived/Basic.lean` for the Hopf ideal of `G_der`;
its commutator characterization and its value for a commutative group are supplied by
`le_derivedDefiningIdeal_iff` and `derivedDefiningIdeal_eq_augmentation_iff_isCocomm`.
In `ZExtension`, define `DerivedSimplyConnected` as the statement
that this subgroup is semisimple and simply connected, and `IsZExtension` as the predicate above on
a Hopf morphism: both groups reductive, an injective coordinate map, the kernel cut out by a Hopf
ideal on every coefficient algebra and central on every coefficient algebra, a torus whose geometric
character group has a finite Galois-permuted basis, and a `DerivedSimplyConnected` source. Prove
`surjective_points` (`G̃(K') ↠ G(K')` for every field `K'/K`, since `H¹(K', Z) = 1` by Shapiro's
lemma and Hilbert's Theorem 90), `fundamentalGroup_torsionFree` (`π₁(G̃)` is torsion-free, its
torsion being `π₁(G̃_der) = 0`), `comp_isZExtension_of_iso` (composition with an automorphism of
`G̃`), `kernel_H1_vanishes` (every finite Galois cocycle with values in `Z` is a coboundary in `Z`)
and `connecting_surjective` (a cocycle in `Z` that becomes trivial in `G̃` is the boundary of a
point of `G(K)`; field automorphisms act on points by composition). These are derived as
indicated; [Kottwitz 1997], 7.4, pp. 297–298, uses the surjectivity over `L`. *Needs:* RG2.0a
*weil-restriction-character-lattices*; *algebraic-fundamental-group*; ReductiveGroups layer 6; Tau
Ceti `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`; Tau Ceti `TauCeti.CommHopfAlgCat.IsCentralIsogeny`;
Mathlib `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`.

**Checks.**

- `gl2_pgl2` — `GL_2 → PGL_2` is a z-extension with kernel the scalar `G_m`. This check has no Lean mirror: `Suggested.lean` does not import a `PGL_2` carrier.
- `ZExtension.identity_simplyConnected` — if `G_der` is simply connected then `id_G` is a
  z-extension, with the trivial torus as kernel.
- `ZExtension.rational_lift` — every rational point of `G` lifts to a rational point of `G̃`.
- `ZExtension.no_finite_nontrivial_kernel` — a finite group of geometric kernel points is trivial;
  this excludes `μ₂` in characteristic different from two, and the torus condition also excludes the
  nonreduced `μ₂` in characteristic two.
- `sl2_pgl2_not` (non-example) — `SL_2 → PGL_2` is not a z-extension, since its kernel `μ_2` is not
  a torus. This check has no Lean mirror: `Suggested.lean` does not import a `PGL_2` carrier.
- `ZExtension.derivedIdeal_gl_n` — `D(GL_n) = SL_n`: an `R`-point of `GL_n` lies in the derived
  subgroup iff its determinant is `1`.
- `ZExtension.derivedIdeal_sl_n` — `SL_n` is its own derived subgroup for every `n`, in every
  characteristic.
- `ZExtension.DerivedSimplyConnected_gl_n` — `GL_n` has simply connected derived group `SL_n`.
- `ZExtension.DerivedSimplyConnected_sl_n` — so does `SL_n`.
- `ZExtension.DerivedSimplyConnected_torus` — a torus has trivial derived group, which is
  semisimple and simply connected. (`PGL_2`, whose derived group is itself and not simply
  connected, is the non-example; it has no carrier in `Suggested.lean`.)

**Checks on the geometric inputs.**

- `ZExtension.GL2_identity` — `GL₂` has simply connected derived group, so its identity is a
  z-extension with trivial induced kernel.
- `ZExtension.SL2_identity` — likewise for the pinned `SL₂/ℚ_p`, including `p=2`.
- `ZExtension.quadratic_norm_resolution` — for a separable quadratic `L/K`, the norm-one torus has a
  z-extension with source `Res_{L/K} G_m` (the quotient map is induced by `x/τ(x)`; its kernel is
  the diagonal `G_m`). This applies to ramified quadratic extensions as well.

**Existence of z-extensions.** (*z-extension-existence*) Every connected reductive `G` over any
field `K` has a z-extension, `exists_zExtension` ([Nguyễn Quốc Thắng], Lemma 2.1(a), p. 4, proof
p. 5; the proof divides `G̃_sc × S` by a scheme-theoretic finite central subgroup and embeds that
subgroup in an induced torus, so positive characteristic is included). For a z-extension with kernel
`Z` and compatible maximal tori, `exact_central` and `map_galoisAction` give the `Γ_K`-equivariant
exact sequence `0 → X_*(Z) → π₁(G̃) → π₁(G) → 0`; `surjective_points` and
`fundamentalGroup_torsionFree` give the surjectivity on points and the torsion-freeness of
`π₁(G̃)`. *Needs:* *z-extension*; *algebraic-fundamental-group*; ReductiveGroups layer 6.

**The Kottwitz homomorphism of a torus.** (*kottwitz-homomorphism-torus*) Let `L` be a field with a
nontrivial discrete valuation of rank one whose valuation ring is henselian with separably closed
residue field, and let `T` be an `L`-torus; `I = Γ_L` is the whole absolute Galois group of `L`.
This is the setting of [Haines–Rapoport], p. 1, (1); [Kottwitz 1997], 1.1, pp. 257–258, takes for
`L` the completion of the maximal unramified extension of a `p`-adic field, and [Pappas–Rapoport],
§2.a.2, p. 10, takes `k((t))` with `k` algebraically closed. Kottwitz constructs a functorial
surjection `κ_T : T(L) → X_*(T)_I` (he writes `w_T`) such that for every character `λ` of `T`
defined over `L`, `⟨λ, κ_T(t)⟩ = ω(λ(t))` ([Kottwitz 1997], 7.2, (7.2.1)–(7.2.4), p. 294, and
(7.2.5)–(7.2.7), pp. 295–296, through resolutions by induced tori). In particular `κ_{G_m} = ω` and
`κ(ϖ) = 1` ([Pappas–Rapoport], §2.a.2, Step 1, p. 10); with perfect residue field,
on `Res_{L'/L} G_m` it is `ω_{L'}`,
normalized on `L'` (from the compatibility with finite extensions `L'/L` in [Kottwitz 1997], 7.3,
pp. 296–297). The kernel `T(L)_0` of `κ_T` lies in the
maximal bounded subgroup `T(L)^1`, which is `κ_T^{-1}((X_*(T)_I)_tors)`, so
`T(L)^1/T(L)_0 ≅ (X_*(T)_I)_tors` ([Kottwitz 1997], (7.2.1)–(7.2.4), p. 294, where the kernel of
`X_*(T)_I → Hom(X^*(T)^I, ℤ)` is the torsion; [Bruhat–Tits II], 4.4.2, p. 107, for the maximal
bounded subgroup; [Haines–Rapoport], Remark 10, p. 6, which records
`T(L)/T(L)^1 ≅ X_*(T)_I/torsion`). On split tori `κ_T` and the torus valuation map `v` of
the apartment have opposite signs. In `KottwitzMap`, define `torus D hT` as
`κ_T : T(L) →* X_*(T)_I`, `cocharacterClass` as the quotient map `X_*(T) → X_*(T)_I`, and
`IsBoundedPoints` as boundedness of the valuation of every coordinate function; prove
`torus_surjective` (`κ_T` is onto), `torus_multiplicative` (for `T ≅ G_m`, every class representing
`κ_T(x)` pairs with the identity character to `ω(x)`), `torus_restrictionOfScalars` (for `T ≅ Res_{L′/L} G_m`, with perfect residue field,
the norm character identifies `X_*(T)_I` with `ℤ` and `κ_T` with the normalized valuation of `L′`),
`torus_natural` (for a homomorphism of tori
`f`, `κ_{T'}(f(x))` is the image of `κ_T(x)` under `cocharacterMap`) and `torus_ker` (`ker κ_T` is
bounded, and every bounded subgroup maps into the torsion). The induced rule specifies
the equivalence on every cocharacter class by pairing with the norm character; naturality and
induced resolutions determine `κ_T`, and `kottwitz_torus` and z-extension naturality determine
`κ_G` with the same normalisation. Over a local field, prove the following: for `E` a
finite extension of `ℚ_p` (the setting of [Kottwitz 1997], 1.1), `L = Ĕ` and `T` over `E`,
`κ_T` commutes with `σ` and maps `T(E)` onto
`(X_*(T)_I)^σ`, with kernel `T(E)_0 := T(E) ∩ T(L)_0` ([Kottwitz 1997], 7.5, p. 299, and 7.6–7.7,
pp. 299–301). *Needs:* *algebraic-fundamental-group*; RG2.0a *weil-restriction-character-lattices*;
RG2.0 *completed-maximal-unramified-extension*.

The separable square-root examples `L′ = L(√ϖ)` require `char L ≠ 2`: in characteristic two,
`X² − ϖ` is inseparable. They include residue characteristic two, such as `L = ℚ̆₂`.
The same convention applies to their Néron-model, parahoric and Iwahori–Weyl Checks below.

**Checks.**

- `torus_gm_two_terms` — for `T ≅ G_m`, classes representing `κ(ϖ)` and `κ(ϖ²)` pair with the
  identity character to `1` and `2`. For `GL_2` the apartment translations of `diag(ϖ, 1)` and
  `diag(ϖ², 1)` are `(−1, 0)` and `(−2, 0)` (`GLBuilding.torus_two_terms`): the opposite sign.
- `torus_gm` — `κ_{G_m}(ϖ^n u) = n` for `u ∈ O_L^×`.
- `torus_trivial` — for the trivial torus, `κ` is the zero map.
- `torus_ramified_normOne` — in characteristic different from two, for the norm-one torus of `L' = L(a)` with `a² = ϖ`, the Kottwitz image
  has two elements.
- `torus_ramified_normOne_residue_two` — in mixed characteristic two, for the separable quadratic
  extension `L′ = L(a)`, `a² = ϖ`, with nontrivial automorphism `τ`,
  `κ_T(x/τ(x)) = ω_{L′}(x) mod 2`. A uniformizer gives `1` and every unit gives `0`.
  Thus the connected kernel is specified even when the bounded torus has other index-two subgroups.
- `torus_induced_diagonal` (non-example) — for `T = Res_{L'/L} G_m` with `L'/L` totally ramified of
  degree `e`, `κ_T = ω_{L'}` under `X_*(T)_I = ℤ`, so `κ_T(ϖ_L) = e`: on the diagonal
  `L^× ⊂ T(L)`, `κ_T` is `e·ω_L`, not `ω_L`; assume perfect residue field.
- `IsBoundedPoints.empty` — the empty set is bounded.
- `IsBoundedPoints.units` — the units `O_L^×` form a bounded subset of `G_m(L)`.
- `IsBoundedPoints.not_all` (non-example) — `G_m(L) = L^×` is not bounded.

`torus_ker_connected` and `torus_ft_iff` are stated in layer RG2.3, after the Néron models:
`ker κ_T` is the group of integral points of the connected Néron model `𝒯°`, and the integral
points of the finite-type Néron model `𝒯` are `κ_T^{-1}((X_*(T)_I)_tors)` ([Haines–Rapoport],
proof of Lemma 5, p. 3, citing [Rapoport]; [Pappas–Rapoport], §5.a, p. 20; [Bruhat–Tits II],
4.4.12, pp. 110–111; [Kisin–Zhou], §2.4.1, pp. 12–13, over `Ŏ`). *Needs:* RG2.3
*neron-finite-type-and-connected-models*.

**Checks.**

- `KottwitzMap.connected_zero` — zero Kottwitz invariant means membership in the connected model.
- `KottwitzMap.torsion_not_connected` — nonzero torsion belongs to the finite-type model but not
  the connected model.
- `KottwitzMap.torsionFree_models_agree` — the two integral-point subgroups agree for torsion-free
  coinvariants.
- `KottwitzMap.Examples.normOne_ramified` — if `L'/L` is separable quadratic and `a² = ϖ` for some
  `a ∈ L'` (so `char L ≠ 2` and `L'/L` is ramified), the norm-one torus has coinvariants `ℤ/2` and Kottwitz image of
  order two, in every residue characteristic; the component count is a conclusion. The nontrivial
  element of `Gal(L'/L)` acts on `X_*(T) = ℤ` by `−1`, and `κ_T` is onto (`torus_surjective`).
  Compare [Pappas–Rapoport], §3.b.1, (3.11)–(3.13), p. 14, which computes `κ_T` by the parity of
  `ord(b)` for `t = τ(b)/b` in equal characteristic different from `2`, and [Bruhat–Tits II],
  4.4.13, pp. 111–112, which computes the smoothening of this torus (its case a) in residue
  characteristic `2` has special fibre `ℤ/2 × G_a`).
- `KottwitzMap.Examples.normOne_minus_one_uniformizer` — in the same situation `−1 = a/τ(a)` with
  `ω_{L'}(a) = 1`, so `κ_T(−1)` is the nonzero class.
- `KottwitzMap.Examples.normOne_minus_one_unit` (non-example for residue characteristic `2`) — if
  instead `a² = u` with `u ∈ O_L^×` and `a ∉ L`, which happens only in residue characteristic `2`
  (for instance `L = ℚ̆_2`, `a = i`), then `−1 = a/τ(a)` with `a` a unit, and `κ_T(−1) = 0`.

**The Kottwitz homomorphism.** (*kottwitz-homomorphism*) Keep `L` as above and let `G` be connected
reductive over `L`. Kottwitz constructs a surjection `κ_G : G(L) → π₁(G)_I` ([Kottwitz 1997], 7.4,
pp. 297–298, with target `X^*(Z(Ĝ)^I)`, as in [Haines–Rapoport], p. 1, (1); [Pappas–Rapoport],
§2.a.2, pp. 10–11, construct it with target `π₁(G)_I`):
when `G_der` is simply connected, `κ_G = κ_D ∘ (G ↠ D := G/G_der)`, by (7.4.1), p. 297, and
[Pappas–Rapoport], §2.a.2, Step 3, p. 11; otherwise `κ_G(g)` is the image of `κ_{G̃}(g̃)` for a lift
`g̃` along a z-extension, by (7.4.2), p. 298, and Step 4, p. 11. It is onto, independent of the
choices and functorial in `G`, it agrees with `κ_T` on tori, and for every character `h` of `G`
defined over `L` the restriction `χ` of `h` to `T` satisfies `⟨χ, κ_G(g)⟩ = ω(h(g))`
([Kottwitz 1997], (7.4.3)–(7.4.5), p. 298). It vanishes on the image of `G_sc(L)`, because `κ` is
natural and `π₁(G_sc) = 0` (so `G(L)_1 = G(L)` for `G` semisimple and simply connected:
[Haines–Rapoport], proof of Proposition 3 (b), p. 2). `G(L)_1 := ker κ_G` contains every parahoric
subgroup ([Haines–Rapoport], Proposition 3, p. 1; RG2.3 *parahoric-kottwitz-characterization*). In
`KottwitzMap`, define `kottwitz` as `κ_G : G(L) →* π₁(G)_I` and `kernel` as `G(L)_1`; prove
`kottwitz_surjective` (`κ_G` is onto), `kottwitz_natural` (for a homomorphism whose coordinate map
`f` carries the maximal torus of `D` into that of `D'`, `κ_{G'}(f(x))` is the image of `κ_G(x)`
under `cocharacterMap`), `kottwitz_torus` (`κ_G = κ_T` for a torus `T`), `kottwitz_character` (the
character formula; it fixes `κ_G` modulo the torsion of `π₁(G)_I`, including its sign),
`kottwitz_simplyConnected` (for `G_der` simply connected and the quotient `q : G → D` with kernel
`G_der`, a class `y` represents `κ_G(x)` iff its image represents `κ_D(q(x))`) and
`kottwitz_sc_image` (`κ_G` vanishes on the image of every homomorphism from a simply connected
semisimple group). Over a local field the following is stated here without a Lean target: for `E`
a finite extension of `ℚ_p`, `L = Ĕ` and `G` over `E`, `κ_G` commutes with `σ` and
`κ_G(G(E)) = (π₁(G)_I)^σ` ([Kottwitz 1997], 7.5, p. 299, and 7.7, (7.7.1), p. 300). The construction
in equal characteristic is [Pappas–Rapoport], §2.a.2, Steps 1–4, pp. 10–11. *Needs:*
*kottwitz-homomorphism-torus*; *z-extension-existence*; *algebraic-fundamental-group*;
*steinberg-quasi-split*.

**Checks.**

- `kottwitz_gl_n` — for `GL_n`, a class representing `κ(g)` pairs with the restriction of `det` to
  `T` to `ω(det g)`.
- `kernel_gl_n` — `G(L)_1 = {g ∈ GL_n(L) : ω(det g) = 0}`.
- `kottwitz_sl_n` — for `SL_n`, `π₁ = 0` and `κ` is trivial.
- `kottwitz_pgl2` — for `PGL_2`, `κ` of the image of `(0 1; ϖ 0)` is the nonzero element of
  `ℤ/2`. The Lean example uses the same central-quotient hypotheses as
  `AlgebraicFundamentalGroup.pgl_n`, over the strictly henselian valued field of `kottwitz`,
  and identifies its inertia-coinvariant target with `ZMod 2`.
- `kottwitz_not_det_valuation` (non-example) — for `PGL_2` the scalars shift `ω∘det` by `2ℤ`, so
  only its class modulo `2` is defined on `PGL_2(L)`. The Lean example uses Mathlib's
  `Matrix.ProjGenLinGroup.mk`: multiplying any lift by the scalar `ϖ` preserves its projective
  class and increases its determinant order by exactly `2`.
- `kottwitz_gl_n_two_terms` — for `GL_n`, classes representing `κ(g)` and `κ(g')` with
  `ω(det g) = 1` and `ω(det g') = 2` pair with `det` to `1` and `2` (derived from
  `kottwitz_character`); the apartment translations of `diag(ϖ, 1)` and `diag(ϖ², 1)` are `(−1, 0)`
  and `(−2, 0)` (`GLBuilding.torus_two_terms`).
- `kottwitz_trivial` — for the trivial group, `κ` is trivial.
- `kernel_torus` — for a torus, `G(L)_1 = ker κ_T` (from `kottwitz_torus`).
- `kernel_sl_n` — for `SL_n`, `G(L)_1 = G(L)`.

### Examples

**The valued root datum of SL_2 and PGL_2.** (*sl2-valued-root-datum*) For `SL_2` with `T` diagonal
and `a(diag(t, t^{-1})) = t²`, the family `φ_{±a}(x_±(x)) = ω(x)` is a compatible valuation. With
`A ≅ ℝ` via `a^∨ ↦ 1`, one has `a(x) = 2x`, the affine roots are `±a + ℤ`, the walls are `½ℤ`,
`diag(t, t^{-1})` acts by `−ω(t)`, the Weyl element by `−1`, and `W_a` is generated by the
reflections at `0` and `½`, infinite dihedral, equal to `ν(N(K))`. For `PGL_2` the apartment and the
walls are the same, but `diag(ϖ, 1)` acts by `−½ ∉ W_a`, and `ν(N(K))/W_a ≅ ℤ/2 = π₁(PGL_2)`, while
`π₁(SL_2) = 0`. Sources: the `SL_2` root datum and valuation are [Bruhat–Tits I], 6.1.3 a), p. 109,
and 6.2.3 a), pp. 117–118; the reflection `ν(m(u))` in the hyperplane at `−½ω(u)a^∨`, hence the
walls, is 6.2.10 (ii), p. 122, restated in 6.2.12 b), p. 123 (the `SL_2` application on p. 124
prints the opposite sign, which disagrees with 6.2.10 (ii) and with 10.2.5 (ii), p. 236; with
`m(u) = m(1)·diag(u⁻¹, u)` and `diag(t, t^{-1})` acting by `−ω(t)` one gets `x ↦ −x − ω(u)`);
the infinite dihedral group of a one-dimensional apartment is
2.1.13, p. 35; [Bruhat–Tits I], 10.2.3 and 10.2.5–10.2.6, pp. 236–237, give the `GL_n`/`SL_n`
valuation, the action of the monomial matrices and the translation part of `ν(N(K))`. The
half-step for `PGL_2` and the quotient `ℤ/2` are computed from these formulas; [Tits], 3.10, p. 56,
gives the element of `PGL_n` that rotates an alcove. For an arbitrary valued root datum,
`Examples.normalizer_mem_affineWeyl_mul_stabilizer` states that `ν(N(K))` is `W_a` times the
stabilizer of an alcove (derived from [Bruhat–Tits I], 6.2.10–6.2.11, pp. 122–123: `ν(N)` permutes
the affine roots and normalizes `W_a`; 1.3.3, pp. 20–21: `W_a` is simply transitive on chambers;
6.2.22, p. 127: for discrete valuations `W_a` is an affine Weyl group).
*Needs:* *affine-weyl-group*; *apartment-action-kernel*;
*algebraic-fundamental-group*.

**The quasi-split unitary group in three variables.** (*unitary-rank-one-example*) Let `K'/K` be
separable quadratic and `G = SU_3(K'/K)` for the antidiagonal hermitian form, and write `ω` also for
the unique extension of `ω` to `K'`. Then `dim S = 1`, `Φ = {±a, ±2a}` of type `BC_1`,
`U_a(K) = {(u, v) ∈ K'² : v + v̄ = uū}`, `U_{2a}(K) = {(0, v) : v + v̄ = 0}`,
`φ_a(x_a(u, v)) = ½ω(v)` and `φ_{2a} = 2φ_a|U_{2a}` ([Bruhat–Tits II], 4.1.4, p. 79, and
4.1.9–4.1.12, pp. 81–84; 4.2.2 (3)–(4), p. 89). The sets `Γ_a`, `Γ_{2a}` and `Γ'_a` are explicit and
depend on the ramification ([Bruhat–Tits II], 4.2.20–4.2.21, pp. 97–98): for discrete `ω`,
`Γ_a = ½ω(K'^×)` and `Γ'_a` is a single coset of `ω(K'^×)` in it, so `Γ'_a ⊊ Γ_a` and some values
of `φ_a` give no wall (derived from 4.2.21). The échelonnage is `Σ = A_1`, the only reduced root
system of rank one; in the ramified case the local Dynkin diagram is of type `C-BC_1`
([Bruhat–Tits II], 4.2.23, p. 99). For every valued root datum, axioms DR3 and V4 give
`Γ_{2a} ⊆ 2Γ_a` ([Bruhat–Tits I], 6.1.1, p. 107, and 6.2.1–6.2.2, p. 117;
`Examples.valueSet_double_subset`, proved). For ramified `K'/K` the inclusion is strict: the
trace-zero elements form a `K`-line `K·v₀`, so `Γ_{2a} = ω(v₀) + ω(K^×)` is one of the two cosets of
`ω(K^×)` in `2Γ_a = ω(K'^×)` (derived from 4.2.21; for `K' = K(√ϖ)`, `p ≠ 2`, it is `½ + ω(K^×)`).
If `K'/K` is unramified then `G`
is unramified with a hyperspecial vertex; if `K'/K` is ramified there is none ([Tits], the
paragraph after 1.10.2, p. 36, for hyperspecial points of groups split over an unramified
extension; §1.15 (9)–(10) and the hyperspecial criterion, p. 42; 3.8.1, p. 55). Absence in the
ramified case follows from the unramified-splitting requirement in the definition of hyperspecial.
*Needs:* *quasi-split-valuation*; *echelonnage-root-system*.

**Nonsplit tori: apartments and Kottwitz maps.** (*nonsplit-torus-example*) Let `E'/E` be separable
quadratic and `T = R^1_{E'/E}G_m`. Then `S = 1`, `V = 0`, `A` is a point, `T(E) = T(E)^1` is
compact, and `X_*(T) = ℤ` with the nontrivial element of `Gal(E'/E)` acting by `−1`. In the
unramified case `X_*(T)_I = ℤ` with `σ = −1`, the invariants are `0`, and `κ_T = 0` on
`T(E) = T(E)_0`. In the ramified case `X_*(T)_I = ℤ/2`, fixed by `σ`, and `κ_T|T(E)` is onto with
kernel `T(E)_0` of index `2` ([Kottwitz 1997], 7.6–7.7, pp. 299–301, for `E` p-adic).
Writing `t = y/τ(y)` with
`y ∈ E'Ĕ` (Hilbert 90), `κ_T(t)` is the parity of `ω_{E'Ĕ}(y)`; hence when `p ≠ 2`, `T(E)_0` consists
of the norm-one units `≡ 1` modulo `m_{E'}`, and `−1 ∉ T(E)_0` (derived from [Pappas–Rapoport],
§3.b.1, (3.12)–(3.13), p. 14, in equal characteristic different from `2`, where `t = τ(b)/b`; the
parity is the same). When `p = 2` this congruence description
fails: for `E = ℚ_2` and `E' = ℚ_2(i)`, `−1 = i/τ(i)` with `i` a unit, so `−1 ∈ T(E)_0`, although
every norm-one unit is `≡ 1` modulo `m_{E'}`; for `E' = E(√ϖ)`, `−1 = √ϖ/τ(√ϖ)` and
`−1 ∉ T(E)_0` in every residue characteristic (the Checks
`KottwitzMap.Examples.normOne_minus_one_unit` and `normOne_minus_one_uniformizer`, over `Ĕ`).
*Needs:* *kottwitz-homomorphism-torus*; RG2.0a *norm-torus*; *torus-valuation-map*.

### Dependencies

Layers RG2.0 and RG2.0a of this roadmap; the Reductive groups roadmap, layer 7, for the unvalued
relative and absolute root data, and layer 6 for z-extensions; the Root systems roadmap, layers 3
and 4; the Local fields and ramification roadmap, layer 3; Mathlib `RootPairing`, `CoxeterSystem`,
`Valuation` and `Representation.Coinvariants`.

## Layer RG2.2: buildings and group action

The enlarged Bruhat–Tits building `B(G,K) = G(K) × A / ∼` is glued from the apartment of RG2.1 by
the Bruhat–Tits equivalence relation. This layer proves the building axioms (common apartments,
intersections of apartments, the stabilizer of an apartment, retractions), equips the building with
its complete CAT(0) metric, proves the fixed-point theorem for bounded subgroups, defines facets,
chambers, special points, pointwise fixers and stabilizers, relates the enlarged and the reduced
building, and proves cocompactness of the action and independence of all choices. It then
establishes how buildings behave under unramified and tame descent, finite extensions, Weil
restriction, central surjections, products and Levi subgroups, twisted Levi subgroups, and toral
embeddings into the building of `GL(V)`, the Kisin–Pappas minuscule embeddings included. It
finishes with the concrete models: norms and periodic lattice chains for `GL(V)`, self-dual chains
for `GSp(V)`, `GL_m` over a division algebra, the tree of `SL_2` with Ihara's amalgam, and the
buildings of tori and of anisotropic groups.

### RG2.2.1 the building and its axioms

**The Bruhat–Tits building.** (*building*) Let `K` be a field with a nontrivial discrete valuation
and `φ` a valuation of the root datum `(Z(K), (U_a(K))_{a∈Φ})` compatible with the torus valuation
map (`GeometricValuation`; no henselian hypothesis is needed here), `A` its enlarged apartment and
`ν : N(K) → Aff(A)` the action of RG2.1. For `x ∈ A` put `N(K)_x := {n : ν(n)x = x}`,
`U_{a,x} := U_{a,−a(x)}` and `P_x := ⟨N(K)_x, U_{a,x} (a ∈ Φ)⟩ ⊂ G(K)`. The building is the
quotient `B(G,K) := G(K) × A / ∼`, where `(g,x) ∼ (h,y)` iff there is `n ∈ N(K)` with `y = ν(n)x`
and `g⁻¹hn ∈ P_x`. The group acts by `g·[h,x] = [gh,x]`; `x ↦ [1,x]` embeds `A`; every point is of
the form `g·x` with `x ∈ A`; `n·x = ν(n)x` for `n ∈ N(K)`; and the fixer of `x ∈ A` is `P_x`. The
building depends only on the equipollence class of `φ`. The central part of `Z(K)` translates the
central directions `V_Z` of `A`, which is why this is the enlarged building; the quotient by the
central directions is the reduced building. In `BruhatTits`, define `Building` as
`G(K) × A / ∼` for a compatible valuation `φ` and `Building.mk` as the class `[g, x]` of `(g, x)`;
prove `Building.mk_eq_mk_iff` (`[g,x] = [h,y]` iff there is `n ∈ N(K)` with `y = ν(n)x` and
`g⁻¹hn ∈ P_x`, with `P_x` written as the subgroup generated by `N(K)_x` and the `U_{a,x}`) and
`Building.smul_mk` (`g·[h,x] = [gh,x]`); define `apartmentEmbedding` as `j : A → B(G,K)`,
`x ↦ [1, x]`, and prove `Building.apartmentEmbedding_injective` (`j` is injective),
`Building.normalizer_smul_apartmentEmbedding` (`n·j(x) = j(ν(n)x)` for `n ∈ N(K)`),
`Building.exists_smul_apartmentEmbedding` (every point is `g·j(x)` with `g ∈ G(K)`, `x ∈ A`) and
`Building.stabilizer_apartmentEmbedding` (the stabilizer of `j(x)` is `P_x`)
([Bruhat–Tits I], 7.4.1–7.4.4, pp. 170–172; [Bruhat–Tits II], 4.2.12–4.2.16, pp. 92–95).
*Needs:* RG2.1 *apartment*; RG2.1 *affine-roots-and-filtrations*; RG2.1
*valued-root-datum-existence*.

**Checks.**

- `Building.gl2_tree` — for `GL_2` over a local field with `|κ| = q`, every vertex of the building
  lies in exactly `q + 1` chambers: the reduced building is the `(q+1)`-regular tree.
- `Building.rankZero` — for `Φ(G,S) = ∅` (anisotropic modulo the centre), `B(G,K) = j(A)` and the
  reduced building is a point.
- `Building.gl1_translation` — for `GL_1` (no roots, apartment a line), a uniformizer translates
  `j(A) = B(GL_1, K)` by `−1` and its square by `−2`: the enlarged building is a line although the
  reduced building is a point.
- `Building.not_product` (non-example) — the building is not `G(K) × A`: for `SL_2`, `[g,x] = [gu,x]`
  for every `u ∈ U_{a,x}`, so the quotient map is far from injective.

**Apartments and the building axioms.** (*building-apartment-axioms*) The apartments of `B(G,K)`
are the translates `g·j(A)`; they correspond to the maximal split tori `gSg⁻¹`. Prove the four
affine-building axioms. (1) Two points, two facets, or a facet and a sector germ lie in a common
apartment. (2) The intersection `A ∩ g⁻¹A` is enclosed, and `g` acts on it as some `n ∈ N(K)`;
consequently, for apartments `A', A''` there is `g` fixing `A' ∩ A''` pointwise with `g·A' = A''`.
(3) The stabilizer of `A` is `N(K)`, acting through `ν`, and its pointwise fixer is `Z(K)¹ = ker v`.
(4) For a chamber `C ⊂ A'` there is a unique retraction `ρ_{A',C} : B → A'` which on every
apartment containing `C` is `b⁻¹·` for a `b` fixing `C`. The Lean statements are
`Building.exists_apartment_mem_mem` (two points lie in a common apartment `g·j(A)`) and
`Building.stabilizer_apartment` (the stabilizer of `j(A)` is `N(K)`) ([Bruhat–Tits I], Prop. 7.4.4,
Prop. 7.4.8, Cors. 7.4.9–7.4.10, Thm 7.4.18, Thm 7.4.19, pp. 172–175; [Bruhat–Tits II], 4.2.16,
pp. 94–95, for the enlarged fixer). *Needs:* *building*.

**The building is a complete CAT(0) space.** (*building-metric*) Fix a `W_0`-invariant scalar
product on `V`. There is a unique metric `d` on `B(G,K)` that is Euclidean on apartments; it is
`G(K)`-invariant, complete when `φ` is discrete, uniquely geodesic (geodesic segments lie in
apartments) and contractible, and the CAT(0) inequality

```text
d(z,m)² + d(x,y)²/4 ≤ (d(z,x)² + d(z,y)²)/2,    m the midpoint of [x,y],
```

holds; the chamber retractions are `1`-Lipschitz. On the enlarged building the metric is the
Euclidean product of the reduced metric and a Euclidean metric on `V¹`. The scalar product is a
choice: it is unique only up to a positive factor on each irreducible component of the root system
and on `V¹` ([Bruhat–Tits II], 4.2.12 and 4.2.16, pp. 92 and 94). The Lean metric is the one of a
scalar product chosen once for the group `H`: fix its central form and its scale on each
semisimple component, and transport them to every choice `(D, φ)`. Euclidean apartments,
invariance, completeness, the CAT(0) inequality, bounded sets and fixed points hold for each choice
(for `GL_1` the metric is `c·|s − t|` for some `c > 0`), and `Building.isometry_equivOfChoices`
uses these transported choices for two data of the same group. [Fintzen], §3, p. 12 (before
Prop. 3.12), normalizes the scalar product by `|α(x − y)| ≤ d_E(x,y)` for the roots `α` over a tame
splitting field `E` and takes `d` to be the restriction of `d_E`; that uses the valuation of `E` extending the one of `K`, whereas this roadmap
normalizes the valuation of each field, so that the embedding into the building over a finite
extension multiplies distances by its ramification index (see *building-field-extension-embedding*).
In Lean, `Building.dist_apartmentEmbedding` (on the standard apartment
`d(j x, j y)² = B(x − y, x − y)` for a positive definite symmetric bilinear form `B` on `V`),
`Building.isometry_smul`, `Building.completeSpace` (for `φ` discrete) and
`Building.cat0_inequality` ([Bruhat–Tits I], 6.2.6, p. 120, and Prop. 7.4.20 (with
2.5.1–2.5.16), pp. 43–46 and 175, and Lemma 3.2.1, p. 63 (the CAT(0) inequality);
[Bruhat–Tits I], 2.5.12 and 7.5.1, pp. 45 and 180 (completeness for discrete `φ`);
[Bruhat–Tits II], 4.2.12 and 4.2.16, pp. 92–95). *Needs:* *building-apartment-axioms*.

**Checks.**

- `Building.gl1_dist` — for `GL_1` the metric of `B(GL_1, E) = j(A)` is `c·|s − t|` in the
  coordinate, for some `c > 0` that depends on the chosen scalar product.
- `Building.gl1_dist_two_terms` — a uniformizer of `GL_1(E)` moves every point by the same
  distance `d > 0` and its square moves it by `2d`.

**The Bruhat–Tits fixed point theorem.** (*bruhat-tits-fixed-point-theorem*) Let `φ` be discrete.
(1) A group of isometries with a bounded orbit fixes the circumcentre of that orbit, which lies in
its closed convex hull. (2) Bounded subgroups (for `E` local: compact subgroups) fix a point of
`B_red`, and a point of `B` if they lie in `G(E)¹ := ⋂_{χ ∈ X^*_K(G)} ker(ω∘χ)`. (3) Every maximal
bounded subgroup of `G(K)¹` is the stabilizer of a point (the converse fails: for `SL_2` the
stabilizer of an interior point of an edge is the Iwahori, which is not maximal); for `G` simply
connected semisimple the maximal bounded subgroups are the maximal parahorics, the stabilizers of
vertices, and their conjugacy classes correspond to the vertices of a closed chamber, since `G(K)`
acts type-preservingly when `G` is simply connected. (4) Fixed points of a compact `H ⊂ G(E)`
persist in `B(G,E')` for every finite `E'/E`, through the equivariant map of
*building-field-extension-embedding*. In Lean, `Building.exists_fixedPoint_of_bounded` (a subgroup
of `G(K)` with a bounded orbit fixes a point of `B`) ([Bruhat–Tits I], 3.2.1–3.2.4 and Thm 3.3.1
with Cors. 3.3.2–3.3.3, pp. 63–65; [Garrett], §§14.6–14.8, pp. 229–236). *Needs:*
*building-metric*.

### RG2.2.2 facets, fixers and the reduced building

**Facets, chambers and special points of the building.** (*facets-and-special-points*) The facets
of `B(G,K)` are the `G(K)`-translates `g·j(F)` of the facets `F` of `A`; they partition the
building and carry the `G(K)`-invariant closure order `F ≤ F'` (meaning `F ⊂ closure F'`).
Chambers (alcoves) are the maximal facets and vertices the minimal ones (in the enlarged building
a vertex is a vertex of `B_red` times `V¹`); a point is special if it is special in some,
equivalently in every, apartment containing it. The building is a polysimplicial `G(K)`-complex, and
the type of a facet is its orbit under the type-preserving subgroup, which contains the subgroup
generated by the parahorics. The character `ε_F : Stab(F) → {±1}` is the determinant sign on the affine span
of the reduced facet. The separate combinatorial character is the sign of the permutation
induced on the vertices of `F`. In `BruhatTits`, define `BuildingFacet` as the `G(K)`-translates of
the facets of `A`; prove `BuildingFacet.mem_unique` (each point lies in exactly one facet),
`BuildingFacet.le_iff` (`F ≤ F'` iff `F ⊂ closure(F')`), `BuildingFacet.exists_facet_eq_image` (a
facet meeting `j(A)` is the image `j(F₀)` of a facet `F₀` of `A`, as in RG2.1) and
`BuildingFacet.smul_le_smul_iff` (`G(K)` acts on facets preserving `≤`); define
`BuildingFacet.IsChamber` (maximal facets, the alcoves), `BuildingFacet.IsVertex` (minimal facets),
`BuildingFacet.IsSpecial` (special in some, hence every, apartment containing the point,
`BuildingFacet.isSpecial_iff_forall`) and `BuildingFacet.orientationCharacter` (`ε_F`, with
`BuildingFacet.orientationCharacter_apply`: `ε_F(g)` is the determinant sign on its affine span;
`vertexPermutationCharacter` records the permutation sign of the vertices
of `F` induced by `g`) ([Bruhat–Tits I], Définition 7.4.12, Prop. 7.4.13, Cor. 7.4.14,
pp. 173–174; [Bruhat–Tits I], 1.3.4–1.3.7, pp. 21–22). *Needs:* *building*; RG2.1
*affine-chamber-structure*.

**Checks.**

- `BuildingFacet.tree_facets` — for `GL_2` over a local field every facet is a vertex or a chamber
  (a vertex or an open edge of the tree, times the central line), and none is both.
- `BuildingFacet.rankZero_single` — for `Φ = ∅` the building has one facet, at once a chamber and a
  vertex.
- `BuildingFacet.not_special_barycentre` (non-example) — for `GL_2` the apartment point with
  diagonal coordinates `(1/2, 0)`, the midpoint of a tree edge, lies on no wall and is not special.
- `orientationCharacter_square_reflection` — for the product of two tree edges,
  reversing the first factor has tangent matrix `diag(−1,1)` and orientation `−1`,
  while its permutation of the four vertices is two transpositions, with sign `+1`.
  `orientationCharacter_eq_vertexPermutation_of_simplex` requires affine independence
  of the vertices; it applies to points and tree edges, not to this square.
- `BuildingFacet.gl2_edge_orientation` — for `GL_2`, `(0 1; ϖ 0)` stabilizes the chamber through
  the point `(1/2, 0)` and swaps its two vertices, so `ε_F = −1` on it.
- `BuildingFacet.gl2_scalar_orientation` — for `GL_2`, the central element `ϖ·1` stabilizes every
  facet and fixes its vertices, so `ε_F(ϖ·1) = +1`.
- `BuildingFacet.orientation_fixer` — `ε_F` is trivial on the elements fixing `F` pointwise.
- `BuildingFacet.orientation_vertex` — for a vertex `F`, `ε_F` is trivial.
- `BuildingFacet.nonempty` (non-example) — facets are nonempty: the empty set, adjoined as a bottom
  element, would satisfy `mem_unique`, `le_iff` and `coe_smul` and leave no facet minimal.
- `BuildingFacet.rankZero_chamber_vertex` — for `Φ = ∅` the single facet is a chamber and a vertex.
- `BuildingFacet.smul_isChamber_isVertex` — `G(K)` permutes the chambers and the vertices
  (`smul g` is an order automorphism of the facets).
- `BuildingFacet.smul_rankZero` — for `Φ = ∅` every element stabilizes the single facet.

**Stabilizers and pointwise fixers in the building.** (*stabilizers-and-fixers*) For a nonempty
`Ω ⊂ B(G,K)` the pointwise fixer `G(K)_Ω := {g : g·x = x for all x ∈ Ω}` is contained in the
setwise stabilizer `Stab(Ω) := {g : g·Ω = Ω}`, with equality for points. If `Ω` lies in an
apartment then `G(K)_Ω = ⟨N(K) ∩ G(K)_Ω, U_{a,Ω}⟩` (for a point of `A` this is
`Building.stabilizer_apartmentEmbedding`). For `E` local and `Ω` bounded, `G(E)_Ω` is compact open
and lies in `G(E)¹` (enlarged building); the point stabilizers of `B_red` are open and compact
modulo the centre. The fixer of a facet is the fixer of its closure and the intersection of the
fixers of its vertices (in the reduced building, type-preservingly), while its stabilizer may be
larger, permuting the vertices. In `BruhatTits.Fixer`, define `pointwise` as `G(K)_Ω` and
`stabilizer` as `Stab(Ω)`; prove `pointwise_le_stabilizer` (`G(K)_Ω ≤ Stab(Ω)`), `pointwise_smul`
(`G(K)_{g·Ω} = g G(K)_Ω g⁻¹`), `pointwise_antitone` (`Ω ⊂ Ω'` implies `G(K)_{Ω'} ≤ G(K)_Ω`),
`isCompact_pointwise` (`E` local, `Ω` bounded and nonempty: `G(E)_Ω` is compact), `isOpen_pointwise`
(`E` local, `Ω` bounded: `G(E)_Ω` is open) and `stabilizer_compactModCentre` (point stabilizers of
`B_red` are compact modulo the centre) ([Bruhat–Tits I], 7.1.1–7.1.11 and Prop. 7.4.4,
pp. 156–160 and 172; [Bruhat–Tits II], 4.2.14, 4.2.16 and 4.2.19, pp. 93–97; [Haines–Rapoport],
Rem. 11, p. 7, for the fixer of `Ω × V¹` in the enlarged building). *Needs:* *building*;
*facets-and-special-points*.

**Checks.**

- `gl2_vertex` — for `GL_2(E)` and the point `[O²]` (displacement `0`) of the enlarged building,
  the fixer is `GL_2(O)`, not the reduced-building stabilizer `E^× GL_2(O)`.
- `singleton_eq` — for `Ω` a single point, fixer and stabilizer coincide.
- `gl2_edge_stabilizer_ne_fixer` (non-example) — for `GL_2(E)` and the chamber `F` through the
  apartment point `(1/2, 0)`, `(0 1; ϖ 0) ∈ Stab(F) ∖ G(E)_F`.

**Reduced versus enlarged building.** (*enlarged-and-reduced-building*) Put
`V¹ := Hom(X^*_K(G), ℝ)`, identified with `V_Z := X_*(A_G) ⊗ ℝ ⊂ V`, and let `θ : G(K) → V¹` be
given by `⟨θ(g), χ⟩ = −ω(χ(g))`. The reduced building `B_red(G,K)` has apartment `A/V_Z`; it equals
`B(G_der,K)` and `B(G^ad,K)` as `G(K)`-sets, and the centre of `G(K)` acts trivially on it. There is
an identification `B(G,K) ≅ B_red(G,K) × V¹` with `g·(x,v) = (g·x, v + θ(g))`, under which
apartments, facets and the metric are products; it is canonical only up to translation by `V¹`.
In `BruhatTits`, define `ReducedBuilding` as `B_red(G,K)` and `ReducedBuilding.centralVector` as
`θ : G(K) → V_Z` for the normalized nontrivial discrete rank-one valuation `ω` of `K` (a datum of the valued field, not of the
group alone: for `GL_1` over `ℚ`, `θ(2)` is `−1` for the `2`-adic and `0` for the `3`-adic
valuation) with `ReducedBuilding.centralVector_character` (`⟨θ(g), χ⟩ = −ω(χ(g))` for
rational characters `χ` of `G`); construct `ReducedBuilding.prodEquiv` (`B ≃ B_red × V_Z` with
`g·(x,v) = (g·x, v+θ(g))`, `ReducedBuilding.prodEquiv_smul`), whose central coordinate is affine on
`j(A)` with linear part the projection onto `V_Z` along the coroots
(`ReducedBuilding.prodEquiv_apartment`) and whose slices `B_red × {c}` carry the reduced metric
(`ReducedBuilding.dist_prodEquiv_symm`); prove `ReducedBuilding.centre_smul` (the centre of `G(K)`
acts trivially on `B_red`). The identification `B_red(G,K) ≃ B(G^ad,K)` is
`ReducedBuilding.centralEquiv` for the adjoint quotient (see *building-functoriality-central-extensions*)
([Bruhat–Tits II], 4.2.14–4.2.16, pp. 93–95; [Prasad], Introduction, pp. 1–2, for `G_der`).
*Needs:* *building*; RG2.1 *torus-valuation-map*.

**Checks.**

- `ReducedBuilding.gl_n_centralVector` — for `GL_2`, `θ(ϖ·1) = (−1,−1)` and
  `θ(diag(ϖ,1)) = (−1/2,−1/2)` in diagonal coordinates: pairing with `det` gives `−ω(det g)`, and
  `θ(diag(ϖ,1))` is the central projection of the torus translation `v(diag(ϖ,1)) = (−1,0)`.
- `ReducedBuilding.torus_point` — for `Φ(G,S) = ∅` (a torus, or `G` anisotropic modulo its
  centre), `B_red` is a single point.
- `ReducedBuilding.prodEquiv_not_unique` (non-example) — the identification `B ≅ B_red × V_Z` is not
  unique: a translation of `V_Z` gives another equivariant identification.
- `ReducedBuilding.gl1_centralVector` — two terms for `GL_1`: `θ(u) = 0` for a unit `u` of `O` and
  `θ(ϖ) = −1`.
- `ReducedBuilding.centralVector_rootSubgroup` — `θ` vanishes on the root subgroups `U_a(K)`.
- `centralSubspace_rankZero` — for `Φ = ∅`, `V_Z = V`.
- `centralSubspace_gl2` — for `GL_2`, `V_Z` is the diagonal line `{(t, t)}`.
- `ReducedBuilding.prodEquiv_coroot` — the central coordinate is constant along the coroot
  directions of `j(A)`.
- `ReducedBuilding.prodEquiv_rankZero` — for `Φ = ∅` the central coordinate alone identifies `B`
  with `V_Z`.
- `ReducedBuilding.gl2_not_point` (non-example) — for `GL_2` over a local field `B_red` is the tree,
  not a point.
- `ReducedBuilding.gl2_scalar` — `ϖ·1 ∈ GL_2(E)` fixes every point of `B_red` and moves every point
  of `B`.

**Cocompact action and fundamental domain.** (*building-cocompact-action*) Let `E` be local. The
closure of a chamber of `B_red` is a fundamental domain for `G(E)⁰ := ⟨parahorics⟩`. Hence `G(E)`
has finitely many orbits of facets and finitely many conjugacy classes of parahorics, and it acts
cocompactly on `B_red(G,E)`, and on `B(G,E)` as well because `θ(G(E))` is a lattice in `V¹`
(`Building.exists_bounded_fundamentalDomain`: a bounded subset of `B(G,E)` meets every orbit). The
same holds for a tame twisted Levi `G' ⊂ G` under `G'(E)` ([Bruhat–Tits I], Théorème 7.4.18 and
Remarque 7.4.22, pp. 174–176; 2.2.3–2.2.8, pp. 35–36; [Fintzen], proof of Thm 6.1, after
Lem. 6.1.1, p. 23; [Bruhat–Tits II], 4.2.16, p. 94). *Needs:* *facets-and-special-points*;
*enlarged-and-reduced-building*; RG2.1 *affine-weyl-group*.

**Independence of the building from choices.** (*building-independence-of-choices*) The building
`B(G,K)`, with its action, apartments, facets and affine structure, is independent of the maximal
split torus `S`, of `φ` up to equipollence, and of the Chevalley–Steinberg system: between two
constructions of the reduced building there is a unique `G(K)`-equivariant bijection which is
affine on segments and carries apartments to apartments. The metric depends only on the scalar
product. The enlarged building is determined up to a shift by `V¹`. Isomorphisms `σ` of valued
fields together with the groups transport buildings uniquely. In Lean,
`Building.equivOfChoices` with `Building.equivOfChoices_smul` and `Building.isometry_equivOfChoices`
(an equivariant isometric bijection between the buildings of two local root data of the same group)
([Bruhat–Tits II], 4.2.12–4.2.13, pp. 92–93; [Bruhat–Tits I], Prop. 7.4.3 and Cor. 7.4.32,
pp. 171–172 and 179). *Needs:* *building*; RG2.1 *transport-under-choices*.

**Checks.**

- `Building.equivOfChoices_stabilizer` — the identification preserves point stabilizers.
- `Building.equivOfChoices_apartment` — it carries the standard apartment onto an apartment
  `g·j'(A')`.
- `Building.equivOfChoices_not_unique` (non-example) — following it by a translation of `V_Z` gives
  another equivariant identification, so the enlarged one is not unique.

### RG2.2.3 descent and functoriality

**Buildings under finite field extensions.** (*building-field-extension-embedding*) Let `K` be
henselian for a nontrivial discrete valuation with perfect residue field and `K'/K` finite, with
the valuation of `K'` extending that of `K` (`ValuativeExtension`). There is a canonical injective
`G(K)`-equivariant map `i_{K,K'} : B(G,K) → B(G,K')`, affine from `A(G,S,K)` to `A(G,S',K')` for
maximal split tori `S_{K'} ⊂ S'`, and isometric for the valuation of `K'` extending that of `K`, so
that with the valuation of each field normalized, as in this roadmap, it multiplies distances by
`e(K'/K)` (for scalar products on `S ⊂ S'` that correspond); it is transitive in towers,
equivariant for valued field isomorphisms (`Building.extensionEmbedding_natural`).
The image lies in the Galois-fixed points by *building-extension-fixed-containment*;
its equality with those points is *tame-descent-of-building*, and can fail for wild
ramification ([Tits], 2.6.1, p. 47). For `K'/K`
unramified, a point of `B(G,K)` that is special in `B(G,K')` is special in `B(G,K)`, and
hyperspecial if `G` splits over `K'` ([Tits], 2.6.1, p. 47). For `G` split semisimple, `G^ad(K)`
permutes the special points of `B(G,K)` transitively ([Tits], §2.5, p. 47). In Lean,
`Building.pointsExtension` (the map `G(K) → G(K')`, composed of the library
maps `TauCeti.AlgHom.mapValue`, `TauCeti.AlgHom.baseChangePointsMulEquiv` and
`TauCeti.AlgHom.mapDomain`), `Building.extensionEmbedding` with `Building.extensionEmbedding_injective`,
`Building.extensionEmbedding_smul`, `Building.extensionEmbedding_tower`
(transitivity after the canonical tensor-associativity base-change identification), and `Building.extensionEmbedding_apartment` (an affine map of
apartments when the ideal of `S'` maps into the extended ideal of `S`) ([Bruhat–Tits II], 5.1.41,
pp. 161–162 (with 4.2.24, pp. 99–100); [Tits], §2.6, p. 47). *Needs:* *building*; *building-independence-of-choices*; extension of valuations and
root-group filtrations. Construction and transitivity do not use a fixed-point equality.

**Checks.**

- `Building.extension_needs_valuation_extension` (non-example) — neither hypothesis on the valuations
  can be dropped. Unrelated valuations: `ℚ` with the `2`-adic and with the `3`-adic valuation are both
  discretely valued, but no `SL_2(ℚ)`-equivariant map from the `2`-adic tree to the `3`-adic tree
  exists, since `SL_2(ℤ_(2))` fixes a vertex of the first and contains the unipotent elements with
  entry `3^{−n}`, which have no common fixed point in the second; the Lean example computes the two
  valuations of `3`. Non-henselian base: for `ℚ` with the `5`-adic valuation, `ℚ(i)` with the
  extension in which `2 + i` is a uniformizer, and `T = R¹_{ℚ(i)/ℚ}G_m`, the building `B(T,ℚ)` is a
  point while `(2+i)/(2−i) ∈ T(ℚ)` translates `B(T,ℚ(i)) = ℝ` by `−1`, so no equivariant map exists.
- `Building.extensionEmbedding_stabilizer` — `g ∈ G(K)` fixes `p` iff its image in `G(K')` fixes
  the image of `p` (injectivity with equivariance).
- `Building.extensionEmbedding_trivial` — for `K' = K` the embedding is a bijection.
- `Building.pointsExtension_injective` — `G(K) → G(K')` is injective.
- `Building.pointsExtension_apply` — the image of `g` takes the value `g(a) ∈ K ⊆ K'` on the element
  presenting `1 ⊗ a`.

**Unramified descent of the building.** (*unramified-descent-of-building*) Let `K` be henselian,
discretely valued, with perfect residue field, `K^sh` its strict henselization and
`Σ := Gal(K^sh/K)`. The `G(K)`-equivariant isometry `j : B(G,K) → B(G,K^sh)` has as image the
`Σ`-fixed points: `B(G,K) = B(G,K^sh)^Σ = G(K)·A(G,S,K)`. For `E` local, `B(G,E^ur) = B(G,Ĕ)`, so
`B(G,E) = B(G,Ĕ)^σ` with `σ` the Frobenius. The `E`-facets are the fixed parts of the `σ`-stable
`Ĕ`-facets, and alcoves correspond to maximal `σ`-stable facets. If `Z` is the centralizer of a
maximal `K^sh`-split torus defined over `K`, then `Σ` has a unique fixed point on `B_red(Z)`. In
Lean, `Building.unramifiedDescent` states the local case: for a maximal `Ĕ`-split torus `S'`
containing `S_Ĕ`, an injective `G(E)`-equivariant map `B(G,E) → B(G,Ĕ)`, affine from the apartment of
`S` into that of `S'`, whose image is the set of points fixed by the decomposition group of the
valuation of `Ĕ` over `E` (Mathlib's `ValuationSubring.decompositionSubgroup`)
([Bruhat–Tits II], 5.1.1, pp. 145–146, 5.1.21, p. 154, and 5.1.24–5.1.28, pp. 155–157; 4.2.24,
pp. 99–100, for completions; 4.2.16, p. 94, for the central factor; [Bruhat–Tits I],
9.2.14–9.2.15, pp. 209–210; [He 2018], §4.3, p. 12, for the apartment and the Iwahori–Weyl group).
*Needs:* *building*; RG2.1 *unramified-descent-of-valuation*; RG2.1
*rational-maximal-unramified-split-torus*.

**Fixed points of finite groups of invertible order.** (*finite-group-fixed-points-reductive*) Let
`H` be connected reductive over a field `k` and `Θ` a finite group acting on `H` by automorphisms,
of order invertible in `k`. Then the fixed-point functor `R ↦ H(R)^Θ` is represented by a closed
subgroup `H^Θ` ([Edixhoven], Prop. 3.1, p. 293), which is smooth ([Edixhoven], Prop. 3.4, p. 294),
and `(H^Θ)°` is connected reductive ([Prasad], §2.4, p. 6, citing Prasad–Yu); `H^Θ` itself may be
disconnected (inversion on `G_m` has fixed points `μ_2`), which is why the reductivity clause
concerns the identity component only. If `k = K` is henselian and discretely valued, `Θ` acts on
`B(H,K)` by transport of structure, by isometries for a `Θ`-invariant scalar product, compatibly
with the action of `H(K)` ([Bruhat–Tits II], 4.2.12, p. 92; [Prasad], §2.4, p. 6). If moreover the
residue field is separably closed (the setting of [Prasad]) and `|Θ|` is prime to the residue
characteristic, then for a nonempty bounded `Θ`-stable subset `Ω` of an apartment the fixed-point
functor `(𝓗_Ω)^Θ` of the Bruhat–Tits group scheme is a closed smooth `O`-subgroup scheme with
generic fibre `H^Θ` ([Prasad], §2.5(i), pp. 6–7, by [Edixhoven], Props. 3.1 and 3.4). In Lean,
`TameDescent.smooth_fixedPoints` (a surjective Hopf map `H → H'` onto a smooth `H'` whose `R`-points
are the `Θ`-fixed points of `H(R)` for every `k`-algebra `R`) ([Edixhoven], Props. 3.1 and 3.4,
pp. 293–294). *Needs:* ReductiveGroups layer 6.

**Checks.**

- `TameDescent.fixedPoints_not_connected` (non-example) — for inversion on `G_m` over a field of
  characteristic `≠ 2`, the fixed points `{x : x⁻¹ = x} = {±1}` of `G_m(k)` have two elements.

**Buildings of Weil restrictions.** (*weil-restriction-building*) Let `K'/K` be finite separable,
`G'` connected reductive over `K'` and `H := Res_{K'/K} G'`. There is an `H(K)`-equivariant
bijection `B(H,K) ≅ B(G',K')`, unique up to translation by `V¹` (and unique on the reduced
buildings), affine on apartments (the maximal split torus of `H` is the split part of `Res S'`),
and isometric up to the ratio of normalized valuations. The stabilizer models correspond: the one
for `H` over `O_K` is `Res_{O_{K'}/O_K}` of the one for `G'`, a consequence of the identification of
fixers and of the characterization of `𝒢_Ω` by its strictly henselian points (RG2.3)
([Kisin–Pappas–Zhou], §2.1.2, p. 11; [Bruhat–Tits II], 4.2.12 and 4.2.9, pp. 91–93). *Needs:*
*building*; RG2.0a *weil-restriction-group-scheme*; *building-independence-of-choices*.

**Containment in Galois fixed points.** (*building-extension-fixed-containment*)
For a finite Galois valued extension, `TameDescent.extensionEmbedding_galois_fixed`
asserts that every point in the image of `Building.extensionEmbedding` is fixed under
`galoisBuilding`. This follows from the construction's functoriality for field
isomorphisms; it needs no tameness. The unramified equality above uses unramified
root-group descent; the tame equality below uses both this containment and unramified
 descent ([Tits], §2.6.1, p. 47; [Bruhat–Tits II], 5.1.41, pp. 161–162).
*Needs:* *building-field-extension-embedding*; the transport action on buildings.

**Checks.** `extensionEmbedding_fixed_containment` uses an arbitrary finite Galois
extension, with no tameness hypothesis.

**Tame descent of buildings.** (*tame-descent-of-building*) Let `K` be henselian for a nontrivial
discrete valuation with perfect residue field of characteristic `p` (so that `G` is quasi-split
over the maximal unramified extension, [Bruhat–Tits II], 5.1.1, pp. 145–146), `G` connected
reductive over `K`, and `K̃/K` finite Galois with group `Γ` and ramification index `e` prime to `p`.
Then `Γ` acts on `B(G,K̃)` by isometries, compatibly with its action on `G(K̃)` (whose fixed points are
`G(K)`) and fixing the image of `B(G,K)`; the map `B(G,K) → B(G,K̃)` is injective with image
`B(G,K̃)^Γ`, both sides being buildings with the metric scaled by `e` and valuations normalized.
(The action is the one by transport of structure: the trivial action also fixes the image, and for
it the statement is false.) For the inertia subgroup `I ⊂ Γ`,
`B(G,K̃)^I = B(G,K̃^I)`. If `T` is a maximal `K`-torus split over `K̃`, the apartment `A(T,K̃)` meets
`B(G,K)` (it is `Γ`-stable, so the finite group `Γ` fixes a point of it). If `G_{K̃} ≅ H_{K̃}` with `H`
a pinned Chevalley group, then `G(K) = H(K̃)^Γ` for the twisted action `γ·h = c(γ)γ(h)`, `c` a
cocycle with values in `H^ad(K̃) ⋊ Ξ` (`Ξ` the pinned automorphisms), and likewise
`B(G,K) = B(H,K̃)^Γ`. In Lean, `TameDescent.building_eq_fixedPoints` states the main assertion over
`K` as above (`ModelField`): for `K̃ = K'` with the valuation extending that of `K`, `e` defined by
`ω_{K'}(u) = e·ω_K(u)` on `Kˣ` and `p ∤ e`, the range of `Building.extensionEmbedding` is the set
of points fixed by the decomposition group (all of `Γ`, `K` being henselian), acting through
`TameDescent.galoisBuilding` ([Prasad], §4.5, p. 27, over the maximal unramified extension of `K`,
deduced there from Thm 3.17, p. 23, by Weil restriction, the statement over `K` following by
unramified descent, [Bruhat–Tits II], 5.1.25, p. 155; [Tits], 2.6.1, p. 47, citing Rousseau;
[Kisin–Pappas], §1.2.14, pp. 135–136 (arXiv v3 pp. 13–14); §1.2.22, p. 138 (arXiv v3 pp. 15–16);
display (1.3.8), p. 142 (arXiv v3 p. 19); [Kisin–Pappas–Zhou], §2.1.2, display (2.1.3), p. 11).
*Needs:* *building-field-extension-embedding*; *building-extension-fixed-containment*;
*unramified-descent-of-building*; *finite-group-fixed-points-reductive*; *weil-restriction-building*; RG2.1 *steinberg-quasi-split*;
LocalFieldsRamification layer 3.

**Checks.**

- `TameDescent.unramified_degree_p_is_tame` — an unramified extension has `e = 1` and satisfies
  `p ∤ e` whatever its degree, even degree `p`: the tameness hypothesis is on `e`, not on `[K̃ : K]`.
- `TameDescent.galoisPoints_one` — the identity of `K'` acts trivially on `G(K')`.
- `TameDescent.galoisPoints_rational` — every `σ` fixes the image of `G(K)` in `G(K')`.
- `TameDescent.galoisPoints_descent` — for `K'/K` finite Galois the points of `G(K')` fixed by all
  `σ` are exactly the image of `G(K)`.
- `TameDescent.galoisBuilding_stabilizer` — `σ` carries the stabilizer of `x` into that of `σx`.
- `TameDescent.galoisBuilding_rational` — `σ` commutes with the action of `G(K) ⊆ G(K')`.
- `TameDescent.extensionEmbedding_galois_fixed` — for every finite Galois `K'/K`, tame or not, the
  image of `B(G,K)` is fixed by the Galois group; equality needs tameness.

**Buildings under central extensions and quotients.** (*building-functoriality-central-extensions*)
Let `α : G → G'` be a central surjection of connected reductive groups. `Building.CentralSurjection`
requires injectivity of the coordinate Hopf map and centrality of its kernel on every coefficient
algebra. `centralData` constructs the maximal split torus `α(S)`; `centralRoots` and
`centralRootPoints` are induced by `α`, and `centralValuation` transports `φ` through these root-group
isomorphisms. `mapCentral` is equivariant for the point map `Building.pointsMap` (the library's
`TauCeti.AlgHom.mapDomain`) and restricts to `centralApartment`. The linear apartment map is dual to
`centralCharacter`, pullback of characters along `α|S`; `centralCharacter_value` and
`centralApartment_linear_character` fix these identifications. The reduced map
`ReducedBuilding.centralEquiv` is an equivariant bijection, induced by `mapCentral`. For enlarged
buildings one chooses compatible central origins; other choices differ by central translations.
With the scalar product on `V'` transported from `V`, `centralEquiv` is an isometry
([Bruhat–Tits II], 4.2.12–4.2.16, pp. 92–95, stated there for quasi-split `G`, which covers `G`
over `K^ur` by [Bruhat–Tits II], 5.1.1, pp. 145–146; over `K` the maps are their restrictions to
`Gal(K^ur/K)`-fixed points). *Needs:* *building*;
*enlarged-and-reduced-building*.

**Checks.**

- `Building.pointsMap_id` — the identity Hopf morphism induces the identity on `G(K)`.
- `Building.central_identity` — the map for the identity Hopf morphism is bijective.
- `Building.central_torus_reduced_roots` — a central quotient of a group without relative roots (for
  instance a torus) has no relative roots.
- `ReducedBuilding.central_compat` — `mapCentral` induces `centralEquiv` on reduced buildings:
  passing to `B_red` removes the central fibre, along which `mapCentral` need not be injective.
- `Building.central_rootSubgroup_image` — `α(U_b) = U'_a` for `b = centralRoots a`; another
  bijection of the root indices fails this.
- `Building.central_roots_pullback` — `centralCharacter` carries the root `a` of `G'` to the root
  `centralRoots a` of `G`.
- `Building.central_character_injective` — pulling back characters along `α|_S` is injective.
- `Building.central_identity_roots` — for the identity Hopf morphism the root-group isomorphisms are
  the identity on points and `centralCharacter` is bijective.
- `Building.central_valuation_rootPoints` — the transported valuation takes on `α(u)` the value of
  `φ` on `u`.
- `Building.mapCentral_stabilizer` — `α` carries the stabilizer of `p` into that of its image.
- `Building.centralApartment_identity` — for the identity Hopf morphism the apartment map is a
  bijection.
- `ReducedBuilding.centralEquiv_stabilizer` — `α` carries the stabilizer of `x ∈ B_red` into that of
  its image.
- `ReducedBuilding.centralEquiv_apartment` — on the reduced images of the standard apartments,
  `centralEquiv` is `centralApartment`.

**Products and Levi subgroups.** (*building-products-and-levis*) (1) `B(∏G_i,K) = ∏B(G_i,K)`
equivariantly, with apartments, facets and metrics the products. (2) For `M ⊃ S` a Levi subgroup
of a `K`-parabolic there is an `M(K)`-equivariant toral injection `B(M,K) → B(G,K)` carrying
`A(S)` onto `A(S)`, unique up to translation by `X_*(A_M) ⊗ ℝ ⊂ V_M¹`; its image `M(K)·A` is
canonical. (3) For the block Levi `∏GL(V_i) ⊂ GL(⊕V_i)` the map sends graded chains `(Λ_i, c_i + t_i)`
to the direct-sum chain, and hence norms `(α_i)` to the norm `α` with `α(Σx_i) = min α_i(x_i)` (the
norm of the direct-sum chain) ([Bruhat–Tits I], Définition 7.6.1, Props. 7.6.3–7.6.4, Cor. 7.6.5,
pp. 184–187; [Bruhat–Tits II], 4.2.17–4.2.18, pp. 95–96; [Kisin–Pappas], proof of Prop. 1.2.3
after (1.2.6), p. 133 (arXiv v3 p. 11), stated there for lattices; §1.2.25, p. 138 (arXiv v3
p. 16)). *Needs:* *building*; *enlarged-and-reduced-building*.

`Building.LeviDatum` chooses a split subtorus of `S`; its group is the Hopf quotient for that
subtorus's centralizer. `LeviDatum.inclusion` is the quotient map, `data` constructs the same
maximal split torus in this centralizer, and `valuation` restricts the original root-group
valuation through the inclusion. `leviApartment` identifies their common apartment;
`leviApartment_linear_character` fixes its derivative by the character restriction of the
inclusion, including the central directions; `leviEmbedding_apartment`, `leviEmbedding_smul`,
`leviEmbedding_injective` and `range_leviEmbedding` specify the toral embedding and its canonical
image ([Bruhat–Tits II], 4.2.18, p. 96).

**Checks.**

- `Building.GL2_diagonal_Levi` — centralizing the diagonal torus gives a root-free Levi with
  two-dimensional enlarged apartment.
- `Building.SL2_identity_central` — the identity of the pinned `SL₂/ℚ_p` satisfies the
  central-surjection predicate.
- `Building.norm_one_Levi` — every Levi of an anisotropic quadratic norm-one torus is the whole
  torus, and its building embedding is bijective.
- `Building.LeviDatum.root_inclusion` — a count: the Levi has at most as many roots as `G`, since
  `LeviDatum.roots` is an embedding.
- `Building.LeviDatum.inclusion_surjective` — the coordinate map of `M ⊂ G` is surjective.
- `Building.LeviDatum.inclusion_kernel` — it kills exactly the ideal of the centralizer.
- `Building.LeviDatum.inclusion_points_injective` — `M(K) → G(K)` is injective.
- `Building.leviEmbedding_stabilizer` — the inclusion carries the stabilizer of `x` in `M(K)` into
  the stabilizer of its image in `G(K)`.
- `Building.leviEmbedding_apartment_range` — the image of `B(M,K)` contains `j(A)`.
- `Building.leviApartment_finrank` — the apartments of `M` and `G` have the same dimension (two for
  the diagonal torus of `GL_2`).
- `Building.leviApartment_roots` — on the common apartment the root `M.roots a` of `G` restricts to
  the root `a` of `M`.

**Twisted Levi subgroups and their buildings.** (*twisted-levi-subgroup*) A smooth closed subgroup
`G' ⊂ G` is a twisted Levi if `G'_{K'}` is a Levi subgroup of `G_{K'}` for some finite `K'/K`
([Fintzen], Def. 3.3, p. 9), and tame if `K'` can be chosen tamely ramified Galois (when the tori of
`G` split over tamely ramified extensions, every twisted Levi subgroup is tame, [Fintzen], Rem. 3.9,
p. 11); twisted Levis are connected reductive, torus centralizers being examples. For `K` local,
`G'` tame, `K'/K` tame Galois and `G'_{K'}` a Levi, the
Galois-equivariant Levi embeddings `B(G',K') → B(G,K')` descend to a toral `G'(K)`-equivariant
injection `B(G',K) ↪ B(G,K)` with a well-defined image. In `TwistedLevi`, define `IsTwistedLevi` (a
Hopf ideal whose base change to some finite `K'/K` is the centralizer ideal of a split subtorus of a
maximal `K'`-split torus) and `IsTame` (the same with `K'/K` Galois and ramification index prime to
the residue characteristic); prove `of_isLevi` (a Levi over `K` is a twisted Levi),
`centralizer_torus` (the centralizer of a `K`-torus of a reductive group is a twisted Levi) and
`baseChange` (twisted Levis are stable under finite base change) ([Fintzen], Def. 3.3, p. 9, for
twisted Levi subgroups; [Fintzen], Rem. 3.9, p. 11, for the tame splitting field and the descent of
the embedding). *Needs:* *building-products-and-levis*; *tame-descent-of-building*;
ReductiveGroups layer 7.

**Checks.**

- `maximalTorus` — every maximal `K`-torus of a reductive `G` is a twisted Levi.
- `whole_group` — `G` is a twisted Levi of itself.
- `elliptic_not_levi` (non-example) — for `E'/E` quadratic, `E'^× ⊂ GL_2(E)` is a twisted Levi but a
  Levi of no `E`-parabolic.
- `tame_isTwistedLevi` — a tame twisted Levi subgroup is a twisted Levi subgroup.
- `levi_isTame` — a `K`-Levi subgroup is tame (`K' = K`, `e = 1`).
- `wild_not_tame` (non-example) — for residue characteristic `2` and `E'/E` ramified quadratic,
  `E'^× ⊂ GL_2(E)` is a twisted Levi that is not tame: every extension splitting it contains `E'`,
  so its ramification index is even.

### RG2.2.4 classical groups, the tree and examples

**The building of GL(V) via norms and lattice chains.** (*gl-building-lattice-chains*) Let `K` be
a nonarchimedean local field and `V = K^n`. A norm is a map `α : V → ℝ ∪ {∞}` with `α(tx) = α(x) + ω(t)`,
`α(x+y) ≥ min(α(x), α(y))` and `α⁻¹(∞) = 0`; it is splittable if `α(Σx_i e_i) = min(ω(x_i) + α(e_i))`
in some basis `(e_i)`, which is always the case because `K` is complete. A periodic chain `𝓛` is a
nonempty `K^×`-stable chain of lattices, and a grading is a strictly decreasing `c : 𝓛 → ℝ` with
`c(tΛ) = c(Λ) + ω(t)`, so `c(ϖΛ) = c(Λ) + 1`. For `n > 0`, splittable norms correspond to graded
chains (the lattices are the balls `{α ≥ r}`, with `c_α(Λ) = inf α(Λ)`), and both correspond to the
points of the enlarged building `B(GL(V),K)`, equivariantly and affinely on segments; the central
direction `V_Z = ℝ·(1,…,1) ⊂ V` acts by `t·(1,…,1) : α ↦ α + t` (all gradings shifted by `t`), so
that the scalar `ϖ·1`, with `v(ϖ·1) = (−1,…,−1)`, sends `α` to `α ∘ ϖ^{-1} = α − 1` and
`θ(ϖ·1) = −ω(det(ϖ·1)) = −n` under `V¹ ≅ ℝ` via `det`. A chain has a period `r` (the number of its
homothety classes), `1 ≤ r ≤ n`, and a determining segment `ϖΛ^0 ⊊ Λ^{r−1} ⊊ ⋯ ⊊ Λ^0`, with
`𝓛 = {ϖ^mΛ^i}`. The stabilizer of the point (the norm) is `GL(V)_x = ⋂GL(Λ^i)`. In `B_red` the
vertices are the homothety classes `[Λ]` and the facets the ungraded chains. In `GLBuilding`,
define `SplittableNorm` as the splittable norms `α : K^n → ℝ ∪ {∞}` and `GradedLatticeChain` as the
periodic chains with a grading `c(tΛ) = c(Λ) + ω(t)`; in the Lean total-function representation,
require `c = 0` off the chain. For `n > 0`, construct `normEquivChain` (splittable norms `≃` graded
periodic chains), with `normEquivChain_chain` identifying the chain with all closed norm balls and
`normEquivChain_grading` fixing `c(Λ)=inf α(Λ)`. For every `n ≥ 0`, construct `buildingEquiv`
(`B(GL_n,K) ≃` splittable norms, the central translation `t·(1,…,1)` acting as `α ↦ α + t`; for
`n = 0` both sides are points); prove `smul_apply` (`(g·α)(x) = α(g⁻¹x)`); define `period` as the
period `r` of a chain, with `period_eq_ncard` (`r` is the number of lattices `Λ'` of the chain with
`ϖΛ ⊊ Λ' ⊆ Λ`, for any `Λ` in the chain), `one_le_period` and `period_le` (`r ≤ n`); prove
`stabilizer_eq` (the stabilizer of the norm of a graded chain is `⋂_i GL(Λ^i)`) ([Bruhat–Tits
1984], 1.1, p. 262, 1.4–1.5, pp. 263–264, 1.7–1.8, pp. 266–267, 1.9, p. 268, 1.17(i),
pp. 273–274, 1.25, p. 277, 2.10–2.11, pp. 282–283, and 2.13–2.15, pp. 284–285; [Kisin–Pappas],
§1.1.9, p. 130). The total lattice of a determining segment is the object of RG2.3
*lattice-chain-stabilizer-schemes*. *Needs:* *building*; Mathlib `Submodule.IsLattice`.

The comparison `buildingEquiv n` uses the pinned coordinate Hopf algebra of `GL_n` and
`standardData n`, whose torus is diagonal on every coefficient algebra (`standardData_torus`): it is
the diagonal torus that Tau Ceti defines as `TauCeti.GeneralLinear.diagonalTorusDefiningIdeal`, proved
a maximal torus by `TauCeti.GeneralLinear.isMaximalTorus_diagonalTorusDefiningIdeal`
(`TauCeti/Algebra/AlgebraicGroup/GeneralLinear/DiagonalTorus/Maximal.lean`), stated here through its
points because `standardData` is a `BruhatTits.LocalRootData`. `standardRoots` indexes roots by
`i≠j` (Tau Ceti's `TauCeti.GeneralLinear.DiagonalRootIndex`); `standardCoordinates` gives
`a_ij(v)=v_i−v_j`, with coroot `e_i−e_j`; `standard_rootSubgroup` identifies `U_ij` with the
elementary transvections (the points of `TauCeti.GeneralLinear.rootSubgroup`,
`TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Root/Subgroup.lean`) and `standardValuation_apply`
sets `φ_ij(I+cE_ij)=ω(c)`. `buildingEquiv_smul` uses the pinned matrix-point equivalence, and
`buildingEquiv_apartment` gives `α_v(z)=min_i(ω(z_i)+v_i)`. These identifications are part of the
comparison, not independent hypotheses ([Bruhat–Tits I], 10.2.1–10.2.5, pp. 234–237, and note added
in proof, pp. 238–239; [Bruhat–Tits 1984], 2.11, p. 283; [Bruhat–Tits II], 4.2.16, p. 94, for the
enlarged central factor). The note of [Bruhat–Tits I] writes the norm of the point `φ + v` as
`min_i(ω(x_i) − c_i)` with `c_i = a_i(v)`, because Bruhat–Tits attach the root `a_j − a_i` to the
`(i,j)` entry: their coordinates are the negatives of `standardCoordinates`.

**Checks.**

- `omega_two_terms` — `ω(0) = ∞`, `ω(ϖ) = 1` and `ω(ϖ²) = 2` for a uniformizer `ϖ`.
- `norm_chain_standard_ball` — the chain of the standard norm contains `O^n`.
- `norm_chain_zero_rank` — the zero-dimensional vector space has no graded periodic lattice chain.
- `norm_chain_grading_two_terms` — for the one-dimensional standard norm, `ϖO` and `ϖ²O`
  have grades `1` and `2`.
- `scalar_shift_two_terms` — `ϖ·1` lowers every norm by `1` and `ϖ²·1` by `2`.
- `standard_GL2_roots` — two roots, two apartment coordinates.
- `standard_GL1_central_direction` — no roots, but apartment dimension one.
- `standard_GL0` — no roots and a one-point building; the norm/chain equivalence requires positive
  rank.
- `standard_GL2_depths` — `ϖ` and `ϖ²` in an off-diagonal entry have depths one and two.
- `standard_norm_weights` — apartment displacement `(0,1)` gives basis-vector norms `0,1`.
- `buildingEquiv_torus_two_terms` — `diag(ϖ,1)` moves the standard point to the norm with values
  `−1` at `e_0` and `0` at `e_1` (`(z·α)(e_0) = α(ϖ⁻¹e_0)`, and `v(diag(ϖ,1)) = (−1,0)` on the
  apartment); the action `α ↦ α ∘ z` would give `+1`.
- `buildingEquiv_central_shift` — translating an apartment point by `t·(1,…,1)` adds `t` to its
  norm.
- `buildingEquiv_GL1_line` — for `n = 1` (no roots) every norm is the image of an apartment point:
  the building of `GL_1` is a line.
- `standardValuation_F2` (non-example) — over `𝔽_2` the root groups of `GL_2` have two elements,
  while a valuation of a root datum takes at least three values on each root group, so the root
  datum of `GL_2(𝔽_2)` has no valuation: `standardValuation` needs the local field.
- `dim_one` — for `n = 1` a norm is determined by its value at one nonzero vector `x_0` (the norms
  are `x ↦ ω(x/x_0) + c`, and the building is a line).
- `standard_norm` — the norm `min_i ω(x_i)` has unit ball `O^n`.
- `ball_isLattice` — every ball `{α ≥ r}` of a splittable norm is a lattice.
- `period_standard` — the chain `{ϖ^m O^n}` of the standard norm has period `1`.
- `period_iwahori` — the norm `min(ω(x_0), ω(x_1) + 1/2)` on `K²` has balls
  `O² ⊋ ϖO ⊕ O ⊋ ϖO²` and period `2 = n`.
- `period_dim_one` — every chain in dimension one has period `1`.
- `zero_module_grading` (non-example) — the zero module has exactly one norm (the constant `∞`) but
  no graded periodic chain, since its only lattice is fixed by a uniformizer and a grading would
  satisfy `c = c + 1`; so `normEquivChain` needs `n ≠ 0`.
- `not_grading` (non-example) — `c(ϖΛ) = c(Λ) + 2` is not a grading (a different normalization) and
  defines no point of `B(GL(V),K)`.
- `scalar_not_stabilizer` (non-example) — `ϖ·1` maps every lattice into itself but fixes no norm
  (`α(ϖx) = α(x) + 1`): the stabilizer of a point is `⋂ GL(Λ^i) = {g : gΛ^i = Λ^i}`, not
  `{g : gΛ^i ⊆ Λ^i}`.

**Equivariant toral embeddings into the GL building.** (*toral-embedding-into-gl-building*) Let `K`
be a nonarchimedean local field, `G` a connected reductive `K`-group with maximal split torus `S`,
and `ρ : G → GL(V)`, `V = K^n`, a faithful representation (a closed immersion). (1) There is a
`G(K)`-equivariant toral isometric embedding `ι : B(G,K) → B(GL(V),K)` of enlarged buildings
(Landvogt); toral means that `ι` maps the apartment `A(S)` affinely into the apartment of a maximal
split torus of `GL(V)` containing `ρ(S)`. It is not unique: it depends on the image of a special
point ([Kisin–Pappas], §1.2.1, p. 131). In `GLBuilding`, `exists_toralEmbedding` states, for `ρ`
given by a surjective map `f` of coordinate Hopf algebras, that an injective `G(K)`-equivariant
toral map from `B(G,K)` to `SplittableNorm K n` exists: some `h ∈ GL_n(K)` conjugates `ρ(S(K))` into
the diagonal torus, and `ι` sends the apartment point with displacement `x` to `h · α_{A(x)}`, with
`A` affine and `α_w(z) = min_i(ω(z_i) + w_i)`; isometry is not part of the Lean statement.
(2) For `t ∈ ℝ`, `t + ι` (all gradings shifted by `t`) is again equivariant and toral, with the
same stabilizers, since the central translation commutes with `GL(V)` ([Kisin–Pappas],
Rem. 1.2.7(b), p. 133, in the split setting of *minuscule-toral-embedding*). (3) If
`char K = 0`, `G` is split and `ρ` is irreducible and minuscule, any two `G(K^ur)`-equivariant
toral embeddings `B(G,K^ur) → B(GL(V),K^ur)` differ by a shift `ι' = t + ι` ([Kisin–Pappas],
§1.2.9, Prop. 1.2.10 and Cor. 1.2.11, pp. 134–135). *Needs:* *gl-building-lattice-chains*;
*building-products-and-levis*; *building-independence-of-choices*.

**Checks.**

- `abstract_rep_not_toral` (non-example) — in rank one a matrix `(u)` with `ω(u) = 0` fixes every
  norm; for `K = 𝔽_q((u))`, where `K^×` embeds as an abstract group into `O^×`, an injective
  homomorphism `K^× → GL_1(K)` with image in `O^×` therefore admits no injective equivariant map
  from the building `ℝ` of `G_m`, so the representation must be algebraic.
- `toral_identity` — for the identity representation of `GL_n`, the conclusion of
  `exists_toralEmbedding` holds with `ι = buildingEquiv n`, `h = 1` and `A = standardCoordinates n`.

**Kisin–Pappas minuscule building embeddings.** (*minuscule-toral-embedding*) (1) Let `G` be split
with a reductive model `G_O` and hyperspecial point `x_o` (stabilizer `G_O(O)`), let
`ρ = ⊕ρ_i : G → GL(⊕V_i)` with each `ρ_i` irreducible and factoring through an epimorphism
`a_i : G ↠ G_i` onto a split reductive group (for `K = k((π))`, each `a_i` separable on root
subgroups), and let `Λ_i ⊂ V_i` be `O`-lattices with `ρ_i(G_O(O^ur)) ⊂ GL(Λ_i ⊗ O^ur)`. Then a
Galois- and `G(K^ur)`-equivariant toral `ι : B(G,K^ur) → B(GL(V),K^ur)` with
`ι(x_o) = [(⊕Λ_i) ⊗ O^ur]` exists; if `ρ` is faithful, `ι` is an isometric embedding, it is unique,
and it restricts to a `G(K)`-equivariant embedding of `B(G,K)` ([Kisin–Pappas], Prop. 1.2.3 and
Lem. 1.2.5, pp. 132–133). (2) Let `char K = 0`, let `G` be split over a tame Galois extension
`K̃ ⊃ K^ur`, and let `ρ` be minuscule. The split map for `G_{K̃}` is equivariant for the twisted
Galois action, and passing to inertia fixed points gives a `G(K^ur)`-equivariant toral map for
`G`, compatible with Levi factorizations, which is an embedding when `ρ` is faithful
([Kisin–Pappas], §1.2.14, pp. 135–136; Prop. 1.2.21 and §§1.2.22–1.2.26, pp. 137–138;
(1.3.11)–(1.3.12), p. 143). For `K = k((π))` the same map is obtained when `ρ` is given as a
direct sum of restrictions of scalars of twisted Weyl modules with minuscule highest weight
([Kisin–Pappas], §1.2.27, p. 139). *Needs:* *toral-embedding-into-gl-building*; *tame-descent-of-building*; RG2.1
*minuscule-coweight*; *building-functoriality-central-extensions*.

**The building of GSp(V) via self-dual norms and chains.** (*gsp-building-self-dual-chains*)
Let `ψ` be a perfect alternating form and put
`αᵛ(x) = inf_{y ≠ 0}(ω(ψ(x,y)) − α(y))`. The symplectic building is the locus
`αᵛ = α` of splittable norms. The enlarged similitude building is the locus
`αᵛ = α − m` for a real constant `m`; shifting `α` by `t` replaces `m` by `m+2t`.
Thus it is `B(Sp(V),K) × ℝ`, with coordinate `m/2`. The maximal norms dominated by
`ω(ψ(x,y))` are exactly the self-dual ones ([Bruhat–Tits I], note added in proof,
p. 239, for the split symplectic group; [Bruhat–Tits II], 4.2.16, p. 94).

Keep the GL closed-ball convention `Lα(r)={α≥r}` and write `Lα(r+)={α>r}`.
For the ordinary integral dual `Λᵛ={x:ψ(x,Λ)⊆O}`, prove
`Lα(r)ᵛ = {x : αᵛ(x) > −r−1}`.
Indeed, in a splitting basis with weights `a_i`, the exponents of `Lα(r)` are
`ceil(r−a_i)` and those of its dual are `−ceil(r−a_i)`. This yields the open-ball
formula, including at jumps. For a self-dual norm its closed-ball chain is dual-stable,
but the grade of the dual lattice is the next attained norm value strictly above `−r−1`,
not the negative of the grade of the original lattice. Prove `dualNorm_closedBall` and
`dualNorm_grade` with this convention. In dimension zero the unique norm is self-dual;
the graded-chain dictionary still requires positive dimension.

The ungraded dual-stable chain admits a determining segment
`Λ^{r−1} ⊂ ⋯ ⊂ Λ^0 ⊂ (Λ^0)ᵛ ⊂ ⋯ ⊂ ϖ⁻¹Λ^{r−1}` after reindexing and scaling, with
`(Λ^i)ᵛ=Λ^{−i−a}`, `a∈{0,1}`. Its point stabilizer is `GSp ∩ GL(V)_x`.
Retain the diagonal embedding into the symplectic sum indexed by
`−(r−1)−a≤i≤r−1` and the integral rescaling of `⊕Λ^i`
([Kisin–Pappas], §1.1.11 and (1.1.12), pp. 130–131).
*Needs:* *gl-building-lattice-chains*; *tame-descent-of-building*.

In dimension two `SLTwo.symplecticNormEquiv` identifies this norm model with
`Building (SLTwo.standardData p) (SLTwo.valuation p)` for `Sp₂ = SL₂`.
Its apartment formula is `symplecticNormEquiv_apartment`.

**Checks.**

- `symplecticNormEquiv_weighted_tenth`, `symplecticNormEquiv_generic_interior`: the norm at `1/10` and every `0<a<1/2` give points of the actual Sp₂ building.
- `dualNorm_weighted_tenth` — on `K²`, `α(xe+yf)=min(ω(x)+1/10,ω(y)−1/10)`
  is self-dual and belongs to the symplectic norm model of the building.
- `dualNorm_generic_interior` — for every `0<a<1/2`, the weights `(a,−a)` give
  a self-dual apartment point, including nonvertices and points other than the barycentre.
- `dualNorm_dual_lattices` — `Λ₀=Oe+Of` is its own integral dual;
  `(Oe+ϖOf)ᵛ=ϖ⁻¹Oe+Of`. At `a=1/10` their dual-grade sums are respectively
  `−1/5` and `−4/5`; there is no common grade-negation constant.

**Buildings of GL_m over a division algebra.** (*division-algebra-building*) Let `D` be a central
division algebra of index `d` over `K` with maximal order `O_D` and uniformizer `ϖ_D`, with `ω`
extended to `D` (so `ω(ϖ_D) = 1/d`), and let `V = D^m` as a right `D`-vector space. The enlarged
building `B(GL_D(V))` is identified equivariantly with the splittable `D`-norms on `V` (those with
`α(xt) = α(x) + ω(t)`) and with the graded periodic right `O_D`-chains (with
`c(Λt) = c(Λ) + ω(t)`, so `c(Λϖ_D) = c(Λ) + 1/d`); the stabilizer scheme of a point is the unit
group of the associated order, the closure of `GL_D(V)` in `∏_j GL(Λ_j)` over `O`
([Bruhat–Tits 1984], 1.1–1.8, pp. 262–267, 2.11, p. 283, and 3.2–3.6, pp. 286–288). For an
unramified extension `L/K` of degree `d`, which splits `D`, `B(GL_m(D),K)` is the
`Gal(L/K)`-fixed part of `B(GL_{md},L)` ([Bruhat–Tits 1984], 4.2 and 4.7, pp. 292–294, for the
reduced buildings, and 4.10, pp. 295–296, for the enlarged ones). The Weil restriction
`Res_{K/ℚ_p} GL_m(D)` has the same building (see *weil-restriction-building*), and
[Kisin–Pappas–Zhou], §6.3.1, p. 73, use this chain description for it. *Needs:*
*gl-building-lattice-chains*; RG2.0a *weil-restriction-group-scheme*; *weil-restriction-building*.

**The Bruhat–Tits tree of SL_2.** (*sl2-tree*) Let `K` be a nonarchimedean local field with residue
field `κ` of order `q`. The tree `T_K` is the graph on homothety classes `[Λ]` of lattices
`Λ ⊂ K²`, with `[Λ]` and `[Λ']` adjacent iff `ϖΛ ⊊ Λ' ⊊ Λ` for suitable representatives. It is a
tree and is `(q+1)`-regular: for a representative `Λ`, the neighbours of `[Λ]` are the classes of
the lattices strictly between `ϖΛ` and `Λ`, which correspond to the lines in `Λ/ϖΛ ≅ κ²`. It is
the facet complex of `B_red` for `GL_2`, `PGL_2` and `SL_2`; for the scalar product on `V`
normalized so that an edge has length `1`, the building metric restricts to the path metric on
vertices. The group `PGL_2(K)`, hence `GL_2(K)`, acts by `g[Λ] = [gΛ]`; the type
`type[Λ] := ω(det Λ) mod 2` (the determinant valuation of a basis of `Λ`) is shifted by
`ω(det g)`, and adjacent vertices have different types, so `SL_2(K)` preserves types, acts without
inversion and has two orbits on vertices, whereas `PGL_2(K)` is transitive on vertices and on edges
and inverts an edge: `(0 1; ϖ 0)` swaps `[O²]` and `[O ⊕ ϖO]`. In `BTTree`, define `Vertex` as the
homothety classes of `O`-lattices in `K²`, `Adj` as the relation `ϖΛ ⊊ Λ' ⊊ Λ` for some
representatives, and `tree` as the simple graph `(Vertex, Adj)`; prove `isTree` (`BTTree.tree` is
a tree); construct `neighborEquiv` (for a representative `Λ` and a uniformizer `ϖ`, the neighbours
of `[Λ]` are in bijection with the lattices strictly between `ϖΛ` and `Λ`, and
`neighborEquiv_symm_apply` sends such a lattice `Λ'` to `[Λ']`); define `smul` (`GL_2(K)` acts
through `PGL_2(K)` by automorphisms; `smul_mk`: `g[Λ] = [gΛ]`; `adj_smul`) and `type` (`type_mk`:
the class of the lattice spanned by the columns of `g` has type `ω(det g) mod 2`; `type_smul`: the
type is shifted by `ω(det g)`); prove `sl2_preserves_type` (`SL_2(K)` keeps types and acts without
inversion) ([Garrett], §14.1, p. 222 (trees as one-dimensional affine buildings) and §§19.1–19.3,
pp. 322–330 (lattice classes, type `Ã_1` for `n = 2`, `q + 1` chambers at each vertex, types and
the type-preserving subgroup); [Serre], Ch. II §§1.2–1.3, pp. 104–105 (the subgroup of even
determinant valuation and the inversion `(0 1; ϖ 0)`); [Bruhat–Tits 1984], 1.25, p. 277, and
2.13–2.15, pp. 284–285 (facets as lattice chains, for general `n`); [Bruhat–Tits I], 10.2.2–10.2.3,
pp. 235–236, with `r = 1` (the valued root datum of `SL_2`)). `Vertex`, `Adj`, `tree`,
`neighborEquiv` and `smul` use only the valuation ring and, for `neighborEquiv`, a uniformizer
`ϖ`, so they are stated for any field with a valuation; `type` and the theorems assume `K` local.
*Needs:* *gl-building-lattice-chains*; Mathlib `SimpleGraph.IsTree`; Mathlib `Submodule.IsLattice`.

**Checks.**

- `degree_Q2` — for `K = ℚ_2` (residue field `𝔽_2`) every vertex has degree `3`.
- `degree_residue_card` — every vertex has degree `|κ| + 1`.
- `adj_standard` — `[O²]` and `[O ⊕ ϖO]` are adjacent.
- `adj_type_ne` — adjacent vertices have different types.
- `no_leaves` — every vertex has a neighbour.
- `pgl2_inversion` (non-example) — `(0 1; ϖ 0) ∈ GL_2(K)` swaps `[O²]` and `[O ⊕ ϖO]`, an
  inversion, so types are not preserved.
- `adj_distance_two` (non-example) — `[O²]` and `[O ⊕ ϖ²O]` are not adjacent: no rescaling of
  `O ⊕ ϖ²O` lies strictly between `ϖO²` and `O²`.
- `neighborEquiv_standard` — for the representative `O²`, the neighbour `[O ⊕ ϖO]` corresponds to
  the lattice `O ⊕ ϖO` itself.
- `neighborEquiv_rescaled` — the bijection depends on the representative: for `ϖΛ` in place of
  `Λ`, the neighbour attached to `Λ'` is attached to `ϖΛ'`.
- `neighborEquiv_lines` — there are `q + 1` lattices strictly between `ϖΛ` and `Λ` (the lines of
  `Λ/ϖΛ`), hence, through `neighborEquiv`, `q + 1` neighbours.
- `smul_scalar` — scalar matrices fix every vertex: `GL_2(K)` acts through `PGL_2(K)`.

**Ihara's theorem: SL_2 as an amalgam.** (*ihara-amalgam*) Let `x_0 = [O²]` and `x_1 = [O ⊕ ϖO]`,
which are adjacent. In `SL_2(K)` put `K_0 = SL_2(O) = Stab(x_0)`, `K_1 = gSL_2(O)g⁻¹ = Stab(x_1)`
with `g = diag(1,ϖ)`, and let `I = K_0 ∩ K_1` be the Iwahori subgroup. Then the amalgamated
product `K_0 *_I K_1` is isomorphic to `SL_2(K)` through the inclusions of the factors. Since
`SL_2(K)` acts without inversion and transitively on edges, the same holds for the stabilizers of
any two adjacent vertices; this is `BTTree.ihara`, stated with Mathlib's `Monoid.PushoutI`, for the
action of `SL_2(K)` on vertices through `BTTree.smul` and `SL_2(K) ⊆ GL_2(K)`. Dividing by the
centre `{±1} ⊂ I` gives the same for `PSL_2(K)`. The group `PGL_2(K)` is not the amalgam of the
stabilizers of two adjacent vertices over their intersection, because it inverts edges; one uses
the subgroup `PGL_2(K)^{ev}` of elements with `ω(det)` even, which acts without inversion
([Serre], Ch. I §4.1, Thm. 6, p. 48 (an action without inversion with a segment as fundamental
domain gives an amalgam), and Ch. II §1.4, Thm. 3 and Cor. 1, p. 110 (Ihara's theorem, for any
field with a discrete valuation); [Calegari–Geraghty], §9.1, Rem. 9.7, pp. 89–90 (arXiv v2), for
`PSL_2` and `PGL_2`). *Needs:* *sl2-tree*; *building-cocompact-action*; Mathlib `Monoid.PushoutI`.

**Buildings of tori and anisotropic groups.** (*building-of-tori-and-anisotropic-groups*) (1) For a
torus `T` with split part `S_T`, `B_red` is a point and `B(T,K) = V¹ = X_*(S_T) ⊗ ℝ`, with `T(K)`
acting by the translations `θ` and all stabilizers equal to the maximal bounded subgroup `T(K)¹`.
(2) For `G` anisotropic modulo its centre, `B_red` is a single `G(K)`-fixed point, and for `K = E`
local `G(E)/Z_G(E)` is compact; for `G` anisotropic, `G(K)` is bounded (compact for `K = E` local)
and `B(G,K)` is a point, the unique point of `B(G,K^sh)` fixed by `Gal(K^sh/K)`. (3) For
`R¹_{E'/E}G_m` both buildings are points and `T(E)` is compact ([Bruhat–Tits II], 5.1.26–5.1.27,
p. 156; [Bruhat–Tits II], 4.2.16, p. 94). *Needs:* *enlarged-and-reduced-building*; RG2.1
*nonsplit-torus-example*; *bruhat-tits-fixed-point-theorem*; *unramified-descent-of-building*.

### Examples

The worked examples of this layer are the results of RG2.2.4: the building of `GL(V)` as
splittable norms and graded periodic lattice chains, with the standard norm `min_i ω(x_i)` and the
one-dimensional case as checks; the self-dual chains of `GSp(V)` and the slice `m = 0` of `Sp(V)`;
`GL_m` over a division algebra; the `(q+1)`-regular tree of `SL_2`, its vertex types, the inversion
`(0 1; ϖ 0)` of `PGL_2`, and Ihara's amalgam `SL_2(O) *_I gSL_2(O)g⁻¹ ≅ SL_2(K)`; and the
buildings of tori and anisotropic groups, including the norm-one torus `R¹_{E'/E}G_m`. Along the
way, RG2.2.1 and RG2.2.2 check the `GL_2` building against the `(q+1)`-regular tree, the line
`B(GL_1)` on which a uniformizer translates by `−1` (with metric `c·|s − t|`, the factor `c > 0`
being the choice of scalar product), the vertex fixer `GL_2(O)` of `[O²]` in
`GL_2(E)`, the element `(0 1; ϖ 0)` of `GL_2(E)` that stabilizes an edge chamber without fixing it
and has orientation sign `−1` on it, the non-special midpoint of an edge, the central vector
`θ(ϖ·1) = (−1,−1)` of `GL_2`, and the rank-zero and torus cases in which the reduced building is a
point; RG2.2.3 checks that the tameness hypothesis concerns the ramification index, that the
valuation of `K'` must extend that of `K`, that rational points are fixed by the Galois action on
`G(K')`, and the twisted Levi subgroups of `GL_2`.

### Dependencies

RG2.1 (apartments, affine roots and filtrations, the valued root datum, the affine Weyl group, the
torus valuation map, the Frobenius action and the nonsplit torus example) and RG2.0a for the Weil
restrictions; the Reductive groups roadmap, layers 6 and 7; the Local fields and ramification
roadmap, layer 3, for tame descent; Tau Ceti `AlgHom.mapDomain`, `AlgHom.mapValue` and
`AlgHom.baseChangePointsMulEquiv` for the maps on points; and Mathlib `Submodule.IsLattice`,
`SimpleGraph.IsTree`, `Monoid.PushoutI`, `ValuativeExtension` and
`ValuationSubring.decompositionSubgroup`.

## Layer RG2.3: parahoric and congruence group schemes

This layer builds the integral models. It begins with smooth affine models over the valuation ring
`O`, reductive models (whose `O`-points are the hyperspecial subgroups), schematic closures, the
Bruhat–Tits extension principle (a smooth affine model is determined by its points over the strict
henselization), the big-cell criteria, quotients over a Dedekind base, the Prasad–Yu
closed-immersion criterion and faithful representations of models. It continues with the Néron
models of tori (locally of finite type, of finite type, and the identity component) together with
quasi-tameness, and then with the Bruhat–Tits group scheme `𝒢_Ω` of a bounded
subset of an apartment, its identity component `𝒢°_Ω` (the parahoric group scheme), parahoric,
Iwahori and pro-p Iwahori subgroups, the Haines–Rapoport characterization of parahorics as fixers
inside the Kottwitz kernel, the reductive quotient of the special fibre with its pro-unipotent
radical and the behaviour under nested facets and unramified base change, hyperspecial vertices,
and generic points. The second half of the layer treats associated, quasi- and very special
parahorics, parahorics under central extensions, the integral models of stabilizers for classical
and Hodge-type groups (lattice chains, closed immersions of fixers, tame realization as fixed points
of hyperspecial models), the Moy–Prasad filtrations with their Lie-algebra lattices, Lang's
theorem (of which this layer is the single owner in Tau Ceti) with its fixed-coset form, the
reduction of smooth models, and explicit level subgroups. A parahoric subgroup is always the group of integral
points of the connected group scheme; the fixer and the stabilizer of a facet can be larger.

In Lean the base is `O = 𝒪[K]` for a field `K` with a valuative relation. The definitions of smooth
models (`SmoothModel`, `integralPoints`, `Hom`, `specialFibre`, `HasConnectedFibres`,
`IsReductive`, `IsHyperspecialSubgroup`) make sense for any valuation ring; every theorem below that
uses a discrete valuation ring carries the Mathlib instances `ValuativeRel.IsDiscrete`,
`ValuativeRel.IsNontrivial` and `ValuativeRel.IsRankLeOne` (the first alone also admits valuations of
higher rank). `ModelField K` bundles these with a henselian valuation ring and a perfect residue
field; it is the context of [Bruhat–Tits II], 5.1.1, pp. 145–146, and every nonarchimedean local
field is a `ModelField`.

**Checks.**

- `ModelField.padic` — `ℚ_p` is a `ModelField` (through the local-field instance).
- `ModelField.isDiscreteValuationRing` — the valuation ring of a `ModelField` is a discrete
  valuation ring; a valuation with value group `ℤ × ℤ` ordered lexicographically has a largest value
  below one but is excluded by `IsRankLeOne`.
- `ModelField.trivial_excluded` (non-example) — a trivially valued field is not a `ModelField`.

### RG2.3.1 smooth affine models and their closures

**Smooth affine integral models.** (*smooth-affine-model*) Let `G` be an affine finite-type
`K`-group with Hopf algebra `H`. A smooth affine `O`-model of `G` is a smooth commutative Hopf
`O`-algebra `A` with a Hopf isomorphism `K ⊗_O A ≅ H`. By flatness `A ⊂ K ⊗_O A`, and
`𝒢(R) = Hom_O(A, R) ⊂ G(K ⊗ R)` for every `O`-flat `R`; in particular `𝒢(O) ≤ G(K)` and
`𝒢(O^sh) ≤ G(K^sh)`. Morphisms of models are the Hopf `O`-maps lying over the identity of the
generic fibre; there is at most one between two given models. Now let `O` be a discrete valuation
ring. For `G` connected, the identity component `𝒢°`, the open subgroup with special fibre
`(𝒢_κ)°`, is again a smooth affine model of `G`, and `𝒢` has connected fibres iff `𝒢 = 𝒢°`; for
`G` disconnected `𝒢°` has generic fibre `G° ≠ G`, so connectedness of `G` is a hypothesis of
`identityComponent`. Connected special fibre alone does not imply connected generic fibre:
inside the constant group `ℤ/2` over a DVR, keep the identity component over `O` and the other
component only over `K`. This is the smooth affine group `Spec(O × K)`; its special fibre is a
point and its generic fibre has two points. In `IntegralModel`, define
`SmoothModel` as a smooth Hopf `O`-algebra `A` with `K ⊗_O A ≅ H`, `SmoothModel.specialFibre` as
`κ ⊗_O A`, `SmoothModel.integralPoints` as `𝒢(O) = Hom_O(A, O) ≤ G(K)`, `SmoothModel.Hom 𝒢 𝒢'` as
the Hopf maps `O[𝒢] → O[𝒢']` over the identity of `H` (that is, morphisms `𝒢' → 𝒢`),
`SmoothModel.HasConnectedFibres` as the condition that both `G` and `κ ⊗_O A` are geometrically
connected, and, over a discrete valuation ring, `SmoothModel.identityComponent` as `𝒢°`; prove
`SmoothModel.mem_integralPoints_iff` (`g ∈ 𝒢(O)` iff `g(a) ∈ O` for all `a ∈ A`),
`SmoothModel.hasConnectedFibres_identityComponent`,
`SmoothModel.nonempty_hom_identityComponent_iff` (a model with connected fibres maps to `𝒢°` iff it
maps to `𝒢`, which determines `𝒢°`), and `SmoothModel.integralPoints_identityComponent_le`
together with `SmoothModel.integralPoints_identityComponent_finiteIndex` (`𝒢°(O) ≤ 𝒢(O)`, of
finite index for every residue field, since `𝒢(O)/𝒢°(O)` embeds in the finite group
`π_0(𝒢_κ)(κ)`) ([Bruhat–Tits II], 1.2.2–1.2.5 and 1.2.12, pp. 17–20; [Bruhat–Tits II],
Lemma 2.2.6, p. 46, as used in the proof of 2.2.5 (iii), p. 45, for affineness of `𝒢°`: it is `𝒢`
with finitely many open and closed parts of the special fibre removed;
[Zhu], §0.5, arXiv pp. 6–7 (Annals p. 412; notation only)). *Needs:* RG2.0
*integral-points-compact-open*; Tau Ceti `TauCeti.smoothCommHopfAlgProperty`; Tau Ceti
`TauCeti.GeneralLinear.instSmoothCoordinateHopfAlgebra`; ReductiveGroups layer 3. Tau Ceti's
`TauCeti.HopfAlgebra.identityComponentHopfIdeal` is the identity component of a group over a
field, a closed subgroup; `identityComponent` is the open subgroup scheme of a model over `O`.

**Checks.**

- `SmoothModel.generalLinear` — `GL_n` over `O` is a smooth model with `𝒢(O) = GL_n(O)`, the
  integral matrices with integral inverse.
- `SmoothModel.generalLinear_specialFibre` — the special fibre of that model is `GL_n` over `κ`.
- `SmoothModel.trivial` — the trivial group has the unique model `O`, with trivial `𝒢(O)`.
- `SmoothModel.hom_integralPoints` — a morphism of models `𝒢' → 𝒢` gives `𝒢'(O) ≤ 𝒢(O)`.
- `SmoothModel.integralPoints_compat` — over a nonarchimedean local field `𝒢(O)` is compact open in
  `G(K)` for the point topology of RG2.0.
- `SmoothModel.not_smooth_rootsOfUnity` (non-example) — for `O` of residue characteristic `p` (for
  example `ℤ_p`), `O[x]/(x^p − 1)` is a flat Hopf algebra with generic fibre `μ_p` but is not
  smooth, so it is not a model.
- `SmoothModel.identityComponent_disconnected` (non-example) — a disconnected generic fibre
  excludes `HasConnectedFibres`, which tests both fibres.
- `SmoothModel.integral_inverse` (non-example) — for any model of `GL_1` with coordinate algebra
  `O[t, t⁻¹]`, a point whose entry has valuation `< 1` (for example a uniformizer) has integral
  entries but is not in `𝒢(O)`, because its inverse is not integral; the criterion of
  `SmoothModel.generalLinear` needs both `g` and `g⁻¹`. (The arithmetic witness `2 · (1/2) = 1`,
  `1/2 ∉ ℤ` is the same phenomenon for `ℤ ⊂ ℚ`.)
- `SmoothModel.hasConnectedFibres_generalLinear` — both fibres `GL_{n,K}` and `GL_{n,κ}` of the
  standard `GL_n` model are connected.
- `SmoothModel.identityComponent_generalLinear` — over a discrete valuation ring the standard `GL_n`
  model is its own identity component: there are morphisms of models in both directions.

**Reductive models over O and hyperspecial subgroups.** (*reductive-model*) A reductive
`O`-model of `G` is a smooth affine `O`-model `𝒢` whose generic and special fibres are connected
reductive. Over a discrete valuation ring `O` this is the same as a reductive `O`-group scheme
(smooth, with connected reductive geometric fibres), the condition of Tau Ceti's
`TauCeti.reductiveCommHopfAlgPropertyOver` (`TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean`).
Its group of integral points `𝒢(O) ⊂ G(K)` is then hyperspecial. For `K` henselian with perfect
residue field, a smooth affine model `𝒢` has reductive special fibre iff `G` splits over the strict
henselization `K^sh` and `𝒢 ≅ 𝒢°_x` for a point `x ∈ B(G, K)` that is special in `B(G, K^sh)`
([Bruhat–Tits II], 4.6.31, pp. 136–137, over `K^sh`; 5.1.40, p. 161). Splitting over `K^sh` is
necessary but not sufficient: for a quaternion division algebra `D` over `ℚ_p`, `SL_1(D)` splits
over `ℚ_p^{ur}`, but its building over `ℚ_p` is a single point, the midpoint of an edge of the tree
of `SL_2` over `ℚ_p^{ur}`, so it has no reductive model over `ℤ_p`. When `κ` is finite a reductive
model exists iff `G` is unramified (quasi-split and split over an unramified extension): the
special fibre of a reductive model is quasi-split by Lang's theorem and its Borel subgroup lifts by
smoothness, and conversely an unramified group has hyperspecial points ([Tits], 1.10.2, p. 36). In
`IntegralModel`, define
`SmoothModel.IsReductive` as the condition that both fibres are connected reductive and
`IsHyperspecialSubgroup` as the predicate `P = 𝒢(O)` for some reductive model `𝒢`; prove
`SmoothModel.isReductive_iff_fibres` (over a discrete valuation ring, `𝒢` is reductive iff every
geometric fibre `k ⊗_O A` is connected reductive), `SmoothModel.IsReductive.hasConnectedFibres`
(reductive implies connected fibres) and `SmoothModel.generalLinear_isReductive` (`GL_{n,O}` is a
reductive model) ([Zhu], §0.5, arXiv pp. 6–7 (Annals p. 412; notation only); [Bruhat–Tits II],
4.6.31, pp. 136–137; [Prasad–Yu], Lem. 4.2, p. 7; B. Conrad, *Reductive group schemes*,
Def. 3.1.1). *Needs:* *smooth-affine-model*; Tau Ceti `TauCeti.reductiveCommHopfAlgProperty`; Tau
Ceti `TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`;
ReductiveGroups layer 6.

**Checks.**

- `GroupScheme.parahoric_gl_n_vertex` — the standard vertex model is `GL_n/O`,
  and its integral points are the hyperspecial subgroup `GL_n(O)`.
- `SmoothModel.splitTorus_isReductive` — over a discrete valuation ring, `G_m^r` over `O` is
  reductive, and `(O^×)^r` is the unique hyperspecial subgroup of `(K^×)^r`.
- `SmoothModel.iwahori_not_reductive` (non-example) — the Iwahori group scheme of `GL_2` (the
  parahoric model at displacement `(1/2, 0)` of the standard apartment) is smooth, but its special
  fibre has unipotent radical `≠ 1`, so it is not reductive.

**Schematic closure in an integral model.** (*schematic-closure*) Let `O` be a discrete valuation
ring with fraction field `K`, `A` a flat `O`-algebra, `𝒳 = Spec A`, `I ⊂ K ⊗_O A` an ideal and
`Y := V(I) ⊂ 𝒳_K`. Then `Ȳ := Spec(A/I^♮)` with `I^♮ := A ∩ I` is the unique `O`-flat closed
subscheme of `𝒳` with generic fibre `Y`. If `𝒳` is a group scheme and `Y` a closed subgroup, `I^♮`
is a Hopf ideal. For an `O`-flat domain `O'`, `Ȳ(O') = Y(K ⊗ O') ∩ 𝒳(O')`, and closure commutes
with flat base change. In `SchematicClosure`, define `closureIdeal` as `I^♮ = A ∩ I`, the preimage
of `I` in `A`, and `closure` as `A ⧸ I^♮`, the coordinate ring of `Ȳ`; define
`closure_genericFibre` as the canonical map `K ⊗_O (A ⧸ I^♮) → (K ⊗_O A) ⧸ I`,
`k ⊗ (a mod I^♮) ↦ (k ⊗ a) mod I`, and prove that it is bijective; prove `closure_flat`
(`A ⧸ I^♮` is `O`-flat), `closure_unique` (if `A ⧸ J` is flat and `K ⊗ J = I` then `J = I^♮`),
`closureIdeal_isHopfIdeal`
(for a commutative Hopf `O`-algebra `B` and a Hopf ideal `I` of `K ⊗_O B`, `I^♮` is a Hopf ideal of
`B`) and `mem_closure_points` (for a flat domain `O'`, a point `x` kills `I^♮` iff `K ⊗ x` kills
`I`) ([Bruhat–Tits II], 1.2.5–1.2.7, pp. 17–18; [Kisin–Pappas], proof of Prop. 1.3.3, opening
paragraph, arXiv p. 17). For `I = 0`, `I^♮` is the `O`-torsion ideal of `A`, Tau Ceti's
`TauCeti.scalarTorsionIdeal` (`TauCeti/RingTheory/Ideal/ScalarTorsion.lean`), whose Hopf version
`TauCeti.HopfIdeal.scalarTorsion` (`TauCeti/Algebra/HopfAlgebra/HopfIdeal/ScalarTorsion.lean`) is
the flat closure of the whole generic fibre; `closureIdeal` treats the closure of an arbitrary
closed subscheme of the generic fibre. *Needs:* *smooth-affine-model*; Tau Ceti
`TauCeti.HopfIdeal`; Mathlib `Ideal.comap`.

**Checks.**

- `closure_diagonalTorus` — for `GL_n` over `O`, the closure of the diagonal-torus ideal is generated
  by the off-diagonal entries.
- `closureIdeal_bot` — for flat `A` the closure of the zero ideal is zero, so `𝒳` is the closure of
  `𝒳_K`.
- `closure_nonIntegralPoint` (non-example) — for `A = O[x]` and `I = (x − ϖ^{-1})`, `A ⧸ I^♮ =
  O[x]/(ϖx − 1)` has empty special fibre and no section.
- `closure_genericFibre_tmul` — the identification of the generic fibre sends `k ⊗ (a mod I^♮)` to
  `(k ⊗ a) mod I` (proved).
- `closureIdeal_bot_eq_torsion` — without flatness, `I^♮` for `I = 0` is the `O`-torsion ideal of
  `A` (Mathlib's `Submodule.torsion`): for `A = O × O/(ϖ)` it is `0 × O/(ϖ)`, not `0`.

**The Bruhat–Tits extension principle.** (*extension-principle*) Let `O` be a discrete valuation
ring, henselian with separably closed residue field (strictly henselian), and let `𝒢`, `𝒢'` be
smooth affine `O`-group schemes with generic fibres `G`, `G'`. Then (1)
`O[𝒢] = {f ∈ K[G] : f(𝒢(O)) ⊂ O}`; (2) a `K`-homomorphism `f : G → G'` extends, uniquely, to
`𝒢 → 𝒢'` iff `f(𝒢(O)) ⊂ 𝒢'(O)`; (3) hence a smooth affine model of `G` is determined up to unique
isomorphism by the subgroup `𝒢(O) ⊂ G(K)`. For a discrete valuation ring that is not strictly
henselian the same statements hold with points over the strict henselization `O^sh`
([Bruhat–Tits II], 1.7.1–1.7.6, pp. 37–39, where 1.7.3 c) gives condition (ET) for smooth schemes
over a strictly henselian discrete valuation ring; [Kisin–Pappas], §1.1.2, arXiv pp. 6–7;
[Kisin–Pappas–Zhou], §2.3, Lem. 2.3.3 and its proof, arXiv pp. 14–15, and proof of Prop. 2.4.2,
arXiv p. 16). In `IntegralModel`, prove `extend_iff` ((2) for strictly henselian `O`) and
`eq_of_integralPoints_eq` ((3): equal integral points give morphisms of models in both directions).
*Needs:* *smooth-affine-model*.

**Big-cell criteria.** (*big-cell-criteria*) Let `O` be a DVR. (1) A morphism `𝒢 → 𝒢'` of
smooth affine `O`-groups with connected fibres which is an isomorphism generically and an open
immersion on a fibrewise dense open `U ∋ 1` is an open immersion, and an isomorphism if `𝒢'` has
connected fibres; maps defined on `U` extend uniquely. (2) Let `𝒢` be the closure of `G`,
given by a schematic root datum, in a smooth affine `O`-group; if `𝒢` is flat and the closures
`𝒯`, `𝒰_a` of the torus and of the root groups are smooth, then
`∏_{a<0}𝒰_a × 𝒯 × ∏_{a>0}𝒰_a ↪ 𝒢` is an open dense big cell, `𝒢` is smooth and `𝒢°` is
affine ([Bruhat–Tits II], 1.2.13–1.2.14, pp. 20–21; [Bruhat–Tits II], 2.2.3–2.2.5, pp. 44–45;
[Kisin–Pappas], proof of Prop. 1.1.4 (arXiv p. 8) and step 1) of the proof of Prop. 1.3.3
(arXiv pp. 17–18)). *Needs:* *schematic-closure*; *smooth-affine-model*.

**Quotients of group schemes over a DVR.** (*quotients-over-a-dvr*) Let `S` be locally
noetherian of dimension `dim S ≤ 1`, `𝒢` an lft `S`-group scheme and `ℋ ⊂ 𝒢` a closed `S`-flat
subgroup. The fppf quotient `𝒢/ℋ` is a scheme (of type (FA)) and the categorical quotient, the
map `𝒢 → 𝒢/ℋ` is faithfully flat, the quotient is a group scheme when `ℋ ⊲ 𝒢`, and it is smooth
when `𝒢` is ([Anantharaman], Chapitre IV, 4.0, Théorèmes 4.A–4.D, pp. 53–54; [Kisin–Pappas],
proof of Prop. 1.1.4, arXiv p. 8). *Needs:* *smooth-affine-model*; ReductiveGroups layer 3;
Mathlib `AlgebraicGeometry.Scheme`.

**Prasad–Yu closed-immersion criterion.** (*reductive-closed-immersion-criterion*) Let `O` be a
discrete valuation ring, `𝒢` a reductive `O`-model of `G`, `ℋ` an affine finite-type `O`-group and
`φ : 𝒢 → ℋ` a homomorphism whose generic fibre `φ_K` is a closed immersion. If `char κ ≠ 2`, or if
`G_{K̄}` has no normal subgroup `SO_{2n+1}` with `n ≥ 1`, then `φ` is a closed immersion; the
conclusion fails for `SO_{2n+1}` in characteristic `2`. Consequently, under the same hypothesis on
`char κ` or on `G`, for a faithful `G → GL(V)` with `𝒢(O^sh) ⊂ GL(Λ)(O^sh)`, the induced
`𝒢 ↪ GL(Λ)` is a closed immersion ([Prasad–Yu], Cor. 1.3, p. 2, which rests on Thm 1.2, p. 1
(arXiv math/0405381), for the criterion over an arbitrary discrete valuation ring; [Prasad–Yu],
§7.1, p. 13, and §9.1–9.2, p. 19, for the failure for `SO_{2n+1}`; the consequence combines
Cor. 1.3 with the *extension-principle*, as in [Kisin–Pappas–Zhou], proof of Prop. 2.4.2, arXiv
p. 16). In
`IntegralModel`, prove `surjective_of_reductive_of_generic`, the case `char κ ≠ 2` in Hopf
coordinates (a Hopf map `O[ℋ] → O[𝒢]` that is surjective after `K ⊗_O -` is surjective). *Needs:*
*reductive-model*; *extension-principle*.

**Faithful representations of integral models.** (*faithful-representations-of-models*) Let
`O` be Dedekind and `𝒢` a smooth affine `O`-group. There is a closed immersion `𝒢 ↪ GL_{n,O}`
with `GL_{n,O}/𝒢` quasi-affine, and affine if `𝒢` is reductive; so every smooth affine model is
the closure of `G` in some `GL_{n,O}` along an embedding `G ↪ GL_n` ([Zhu], §1.4.1, arXiv p. 17
(Annals p. 426) (a representation with quasi-affine, resp. affine, quotient; the closed-immersion
form and the description of every smooth affine model as a closure in some `GL_{n,O}` are derived
here)). In `IntegralModel`, prove `exists_closedImmersion_generalLinear`, the closed immersion for
`O = 𝒪[K]` a discrete valuation ring, as a surjective Hopf map onto `O[𝒢]`. *Needs:*
*smooth-affine-model*; *quotients-over-a-dvr*; *reductive-model*; Tau Ceti
`TauCeti.GeneralLinear.pointsMulEquiv`.

### RG2.3.2 Néron models of tori and quasi-tame groups

**The lft Néron model of a torus.** (*neron-lft-model-of-torus*) Let `O` be a discrete valuation
ring (Lean: `ValuativeRel.IsDiscrete`, `ValuativeRel.IsNontrivial` and `ValuativeRel.IsRankLeOne`
on `K`) and let `H` represent a `K`-torus. `NeronModel.lftGroup H hTorus` is a group
object over `Spec O`; `lft` is its underlying scheme and `lftStructure` its base map. It is smooth,
separated and locally of finite type. `genericFibreGroupIso` identifies its generic fibre with the
original torus as a group object over `Spec K`; `genericFibre_group_compat` identifies the underlying
map with `genericFibre`, and `genericFibre_isPullback` makes `genericFibre` the generic fibre.
`mappingProperty` gives a unique extension for every smooth `O`-scheme,
with equality after restriction along the generic-fibre pullback. `lftMappingProperty`
records the affine test-algebra form, with `lftMappingProperty_restrict` its restriction formula,
and `lft_integralPoints` gives all of `T(K)`;
`lft_integralPoints_restrict` identifies it with restriction along the generic point of the base.
Existence follows since a torus acquires no additive subgroup after completed strict henselization
([Bosch–Lütkebohmert–Raynaud], §10.2, Theorem 2, p. 297; [Jordan–Ribet–Scholl], §1.1, p. 4,
states this criterion for an arbitrary discrete valuation ring). *Needs:* *smooth-affine-model*;
Mathlib `AlgebraicGeometry.hopfSpec`, group objects in `Over (Spec O)`, `Over.pullback`;
RG2.0 *scheme-point-topology*.

**Checks.**

- `lft_multiplicative_points` — for `T = G_m`, the integral points are `K^×`.
- `lft_trivialTorus` — the trivial torus has model `Spec O`.
- `lft_not_affine` (non-example) — the lft model of `G_m` is not affine.
- `lftGroup_trivialTorus` — the lft model of the trivial torus is the terminal group object
  `Spec O`.
- `genericFibre_openImmersion` — `genericFibre` is an open immersion, the base change of
  `Spec K → Spec O`.
- `genericFibre_not_surjective` (non-example) — `genericFibre` misses the special fibre.
- `lftMappingProperty_integral` — for `B = O`, `lftMappingProperty` followed by `K ⊗_O O ≅ K` is
  `lft_integralPoints`.
- `ramified_torus_lft_eq_ft` — for the norm-one torus `T` of `L = K(a)`, `a² = ϖ`, inertia acts on
  `X_*(T) = ℤ` by `−1`, the component group `X_*(T)_I = ℤ/2` is finite, and the lft model is the
  finite-type model (`ftToLft` is an isomorphism), hence affine, in contrast with `lft_not_affine`.

**Finite-type and connected Néron models of tori.** (*neron-finite-type-and-connected-models*)
For the same torus over a discrete valuation ring, `NeronModel.ft H hTorus` is its smooth affine
finite-type model, and `connected` is its identity component. `ftToLft` is an open immersion of
group objects over the base (`ftToLft_isOpenImmersion`); `ft_maximal_open` makes it the largest
finite-type open subgroup of `lftGroup`, by factoring every open immersion from a smooth finite-type
torus model. `ftToLft_rational` identifies its rational-point map through the specified
generic-fibre Hopf isomorphism. The connected model's integral points lie in those of `ft`
(`connected_integralPoints_le_ft`), with finite index
(`connected_integralPoints_finiteIndex`). Over a nonarchimedean local field,
`ft_integralPoints_maximal` contains every subgroup of `T(K)` with compact closure, and under
`ModelField K` the connected model's points lie in the parahoric of every point of the apartment
(`connected_le_parahoric`). These claims concern tori. For the norm-one torus of a ramified
quadratic extension `X_*(T)_I = ℤ/2`, so over a strictly henselian base the special fibre of `ft`
has two components, in every residue characteristic ([Kisin–Zhou], §2.4.1, pp. 12–13;
[Bruhat–Tits II], 4.4.13, pp. 111–112, gives explicit equations, but only its case a) in residue
characteristic `2` has the two-component fibre). ([Bruhat–Tits II], 4.4.2, p. 107, 4.4.12–4.4.14,
pp. 110–112; [Kisin–Zhou], §2.4.1, pp. 12–13.) *Needs:* *neron-lft-model-of-torus*;
*smooth-affine-model*.

**Checks.**

- `ft_multiplicative` — the finite-type model of `G_m` has the coordinate algebra `O[t, t⁻¹]` of
  `G_{m,O}` and integral points `O^×`.
- `ft_trivial` — the trivial torus has the finite-type model `O`, with a single integral point.
- `ft_excludes_uniformizer` (non-example) — a uniformizer is not an integral point of the
  finite-type `G_m` model, although it is an integral point of the lft model.
- `ftToLft_trivialTorus` — for the trivial torus `ftToLft` is an isomorphism.
- `ftToLft_multiplicative_not_iso` (non-example) — for `G_m`, `ftToLft` is not an isomorphism: the
  special fibre of the lft model has the components `ϖⁿ G_m`, `n ∈ ℤ`.
- `ramified_torus_ft_disconnected` (non-example) — for the norm-one torus of `L = K(a)`, `a² = ϖ`,
  `ft` does not have connected fibres, and `−1 = a/ā`, with `κ_T(−1) = v_L(a) mod 2 = 1`, lies in
  `𝒯^ft(O)` but not in `𝒯°(O)`, in every residue characteristic.
- `ramified_torus_connected_index` — for the same torus `[𝒯^ft(O) : 𝒯°(O)] = 2`.

**Quasi-tame and essentially tame groups.** (*quasi-tame-group*) Let `K` be a nonarchimedean local
field and `G` connected reductive over `K`. `G` is quasi-tame iff `G ≅ ∏_i Res_{K_i/K} H_i` with
`K_i/K` finite separable and each `H_i` connected reductive over `K_i` and split over a tamely
ramified extension of `K_i`; essentially tame iff `G^ad` is quasi-tame; tamely ramified iff `G` is
split by a finite Galois extension of `K` whose ramification index is prime to the residue
characteristic. A tamely ramified group is quasi-tame (take one factor, `K_1 = K`), and
`Res_{K'/K}` of a quasi-tame `K'`-group is quasi-tame, by transitivity of Weil restriction
([Kisin–Pappas–Zhou], Def. 3.1.4 (1)–(2), arXiv p. 18).
Examples: a split group is quasi-tame with one factor and `K_1 = K`; `Res_{K'/K} G_m` is quasi-tame
for every finite separable `K'/K`, even wildly ramified; the norm-one torus of a wildly ramified
quadratic extension `L` of `ℚ_2` is not quasi-tame, since it is one-dimensional and split exactly
over the extensions containing `L`. These definitions and statements carry no Lean signature.
*Needs:* RG2.0a *weil-restriction-group-scheme*; LocalFieldsRamification
layer 3; Tau Ceti `TauCeti.IsTamelyRamified`.

**Exact sequences of tori and their models.** (*torus-models-exact-sequences*) Let
`1 → T' → T → T'' → 1` be an exact sequence of `K`-tori with `T` tamely split. There is an
fppf-exact sequence `1 → 𝒮' → 𝒯° → 𝒯''° → 1` of smooth `O`-groups lying over it, with
`𝒮'° = 𝒯'°`, `π_0(𝒮'_κ) ⊂ (X_*(T')_I)_tors`, and `𝒮' = 𝒯'°` when `X_*(T')_I` is torsion-free.
For `E` local and `r > 0` the sequence `1 → T'(E)_r → T(E)_r → T''(E)_r → 1` is exact
([Pappas–Rapoport], Lem. 6.7 and its proof, arXiv pp. 28–29 (for `K = k((t))` with `k`
algebraically closed; the strictly henselian case is stated here as [Kisin–Pappas] use it);
[Fintzen], Lem. 7.1, arXiv p. 26; [Kisin–Pappas], proof of Prop. 1.1.4 (`Z` a torus), arXiv
p. 8). *Needs:* *neron-finite-type-and-connected-models*; *quotients-over-a-dvr*; RG2.0a
*tame-fixed-points-of-weil-restriction*.

### RG2.3.3 Bruhat–Tits and parahoric group schemes

**The Bruhat–Tits group scheme of a bounded subset.** (*bruhat-tits-group-scheme*) Let
`K` be a `ModelField` (henselian for a nontrivial discrete valuation of rank one, with perfect
residue field), and let `Ω ⊂ A` be nonempty and bounded. The Bruhat–Tits group scheme `𝒢_Ω` is a
smooth affine `O`-model of `G` with `𝒢_Ω(O^sh) = Fix(Ω) ∩ G(K^sh)^1` and `𝒢_Ω(O) = Fix(Ω) ∩ G(K)^1`;
it depends only on the enclosure of `Ω` and not on the apartment `A`, and `𝒢_{gΩ} = g𝒢_Ωg^{-1}`. Over
`K^sh`, where `G` is quasi-split, it is built from the schematic root datum: the closures
`𝒰_{a,Ω}` with `𝒰_{a,Ω}(O^sh) = U_{a,f_Ω(a)}`, the Néron-type model `𝒵` of `Z`, and the open
big cell `∏_{a<0}𝒰_{a,Ω} × 𝒵 × ∏_{a>0}𝒰_{a,Ω}`; in general it is obtained by étale descent, the
construction being Galois-stable when `Ω` is. If `Z` is a torus, its closure in `𝒢_Ω` is `𝒵^ft`.
The enclosure, conjugation, big-cell and torus-closure statements of this paragraph carry no Lean
signature. In `BruhatTits`, define `groupSchemeOfBounded D φ Ω hne hb` as `𝒢_Ω`, a
commutative Hopf `O`-algebra; `Apartment.IsBounded` means that every linear functional of
displacement is bounded on `Ω`. `GroupScheme.boundedModel` supplies finite type, smoothness and the
generic-fibre Hopf isomorphism; `GroupScheme.boundedModel_points` gives `𝒢_Ω(O)` as the fixer;
`GroupScheme.boundedModel_connected_points` identifies, over a strictly henselian base, its
connected integral points with `Fix(Ω) ∩ ker κ_G` using the absolute root datum, as in
[Haines–Rapoport], Proposition 3 and Remarks 4 and 11, pp. 1–3, 7. `groupScheme` and
`GroupScheme.toSmoothModel` are the nonempty finite-set specializations. On the enlarged building a
nonempty bounded-set fixer is already in `G(K)^1`. Prove `GroupScheme.integralPoints_eq_fixer`
(`𝒢_Ω(O) = Fix(Ω) ∩ G(K)^1`) ([Bruhat–Tits II], 4.6.1–4.6.2 and 4.6.26–4.6.30, pp. 123–136, with
4.6.28 (i), p. 135, for the fixer; [Bruhat–Tits II], 5.1.8–5.1.9 and 5.1.30, pp. 148, 157;
[Haines–Rapoport], Rem. 11, p. 7). Over a strictly henselian base the fixer determines the model
(see *extension-principle*); over a base that is not strictly henselian the `O`-points alone do not
determine a smooth model, and `𝒢_Ω` is the étale descent of its base change to `O^sh`
([Bruhat–Tits II], 5.1.8, p. 148). *Needs:* *extension-principle*; *big-cell-criteria*;
*neron-finite-type-and-connected-models*; RG2.2 *unramified-descent-of-building*; RG2.2
*stabilizers-and-fixers*; RG2.1 *affine-roots-and-filtrations*; RG2.1
*valued-root-datum-existence*.

**Checks.**

- `GroupScheme.gl_n_vertex` — for `GL_n` over a local field and the vertex of the lattice `O^n`
  (displacement `0` in the standard apartment), `𝒢_x(O) = GL_n(O)`.
- `GroupScheme.torus` — for `G = T` a torus (`Φ = ∅`), `𝒢_Ω = 𝒯^ft` for every `Ω`, as models.
- `GroupScheme.integralPoints_compat_fixer` — `𝒢_Ω(O)` is the intersection over `x ∈ Ω` of the
  stabilizers `MulAction.stabilizer` of the points of the building.
- `GroupScheme.ramified_torus_disconnected` (non-example) — for the norm-one torus of `L = K(a)`,
  `a² = ϖ`, the building is a point, `𝒢_x(O) = T(K)` and `𝒢_x ≠ 𝒢°_x`.
- `GroupScheme.pgl2_edge_disconnected` (non-example; no Lean mirror, the `PGL_2` coordinate algebra
  is not among the compiled Tau Ceti modules) — for `PGL_2` and `x` the edge barycentre,
  `(0 1; ϖ 0) ∈ 𝒢_x(O)` is not in the parahoric, so `𝒢_x ≠ 𝒢°_x`.
- `GroupScheme.groupSchemeOfBounded_torus` — for a torus every `groupSchemeOfBounded` is isomorphic
  to the coordinate Hopf algebra of `𝒯^ft`: both have the maximal bounded subgroup as points
  ([Bruhat–Tits II], 4.4.2 (ii), p. 107; 4.4.12, pp. 110–111).
- `GroupScheme.groupSchemeOfBounded_gl_n_vertex` — at the standard `GL_n` vertex both bounded-set
  constructors give `O[GL_n]`.
- `GroupScheme.groupSchemeOfBounded_ramified_torus` (non-example) — for the norm-one torus of
  `L = K(a)`, `a² = ϖ`, the Hopf algebras of `𝒢_x` and `𝒢°_x` are not isomorphic even abstractly:
  their special fibres have two and one geometric components.
- `GroupScheme.boundedModel_mono` — `Ω ⊆ Ω'` gives a morphism of models `𝒢_{Ω'} → 𝒢_Ω`
  ([Bruhat–Tits II], 4.6.27, p. 135).
- `GroupScheme.boundedModel_enclosure_gl2` — the point at displacement `(1/2, 0)` and the pair of
  vertices at displacements `0` and `(1, 0)` of the same `GL_2` alcove have the same enclosure, so
  they give the same model, the Iwahori group scheme ([Bruhat–Tits II], 4.6.27, p. 135).

**Parahoric group schemes.** (*parahoric-group-scheme*) For `Ω ⊂ A` nonempty and bounded, the
parahoric group scheme is `𝒢°_Ω := (𝒢_Ω)°`, a smooth affine model with connected special fibre
and `𝒢°_Ω(O^sh) = P°_Ω`, the connected fixer; its big cell is
`∏_{a<0}𝒰_{a,Ω} × 𝒵° × ∏_{a>0}𝒰_{a,Ω}`. For a facet `F`, `𝒢°_F = 𝒢°_x` for any `x ∈ F` is the
parahoric group scheme of `F`, and it depends only on the image of `F` in the reduced building.
The inclusion `𝒢°_Ω ⊂ 𝒢_Ω` is open and an isomorphism on generic fibres, and it is an equality
iff `(𝒢_Ω)_κ` is connected. In `BruhatTits`, define `parahoricGroupSchemeOfBounded` as `𝒢°_Ω`, with
`GroupScheme.boundedParahoricModel` including its generic-fibre identification with `G`, and
`GroupScheme.boundedModel_connected` giving morphisms in both directions over the identity of `G`
between it and the open identity component; `parahoricGroupScheme`
is the nonempty finite-set specialization, `GroupScheme.parahoricModel` as `𝒢°_Ω` regarded as a
smooth model with connected fibres (`GroupScheme.parahoricModel_eq_identityComponent` gives
morphisms in both directions over the identity of `G`), and
`GroupScheme.toParahoric` as the Hopf map `𝒢_Ω → 𝒢°_Ω`, the morphism of models of the inclusion
(`GroupScheme.toParahoric_isModelHom`); prove `GroupScheme.parahoric_hasConnectedFibres`
(`(𝒢°_Ω)_κ` is connected), `GroupScheme.boundedModels_genericFibre` (the generic fibres of
both bounded-set models are `H`, hence also those of their finite-set specializations),
`GroupScheme.parahoric_integralPoints` (`𝒢°_Ω(O) = P°_Ω`, the
connected fixer), `GroupScheme.parahoric_eq_of_sameFacet` (`x, y ∈ F` give mutually inverse
morphisms of models `𝒢°_x ≅ 𝒢°_y`; the full fixers `𝒢_x`, `𝒢_y` can differ) and
`GroupScheme.parahoric_eq_groupScheme_of_simplyConnected` (for `G` simply connected, `toParahoric`
is an isomorphism for every nonempty finite `Ω`, since `κ_G = 1` makes every fixer a parahoric)
([Bruhat–Tits II], 4.6.28 and 4.6.32, pp. 135–137; [Bruhat–Tits II], 5.2.6, p. 164;
[Haines–Rapoport], Prop. 3 and Rem. 4, pp. 1–3; [Kisin–Pappas], §1.1.2, arXiv pp. 6–7). *Needs:*
*bruhat-tits-group-scheme*; *neron-finite-type-and-connected-models*; *extension-principle*.

**Checks.**

- `GroupScheme.parahoric_gl_n_vertex` — for `GL_n` and the standard vertex, `toParahoric` is an
  isomorphism and `𝒢°_x` is a reductive model, so `𝒢°_x = 𝒢_x = GL_{n,O}`.
- `GroupScheme.parahoric_torus` — for `G = T` a torus, `𝒢°_Ω = 𝒯°` as models and `P°_Ω = 𝒯°(O)`.
- `GroupScheme.parahoric_ne_groupScheme_pgl2` (non-example; no Lean mirror, as for
  `GroupScheme.pgl2_edge_disconnected`) — for `PGL_2` and the edge barycentre, `𝒢°_x ≠ 𝒢_x`: the
  parahoric is the Iwahori, of index `2` in the fixer.
- `GroupScheme.parahoricGroupSchemeOfBounded_torus` — for a torus every
  `parahoricGroupSchemeOfBounded` is isomorphic to the coordinate Hopf algebra of `𝒯°`.

**Parahoric, Iwahori and pro-p Iwahori subgroups.** (*parahoric-subgroup*) A subgroup
`P ⊂ G(K)` is parahoric iff `P = 𝒢°_x(O) = P°_x` for some `x ∈ B(G, K)`; over `E`,
`P°_F(Ĕ)^σ = 𝒢°_F(O_E)` for a `σ`-stable facet `F` of `B(G, Ĕ)`. The Iwahori subgroups, the
parahorics of alcoves, are the minimal parahorics and are `G(K)`-conjugate; `I^+` denotes the
pro-unipotent radical of an Iwahori `I`, a pro-p group. For `E` local the parahorics are compact
open and fall into finitely many conjugacy classes; the maximal ones correspond to the vertices
of the reduced building; the standard ones, those containing a fixed Iwahori, correspond to the
`σ`-stable finite-type sets of affine simple reflections; and `N(P°_F) ⊃ Stab(F)`. In
`BruhatTits.Parahoric`, define `IsParahoric` as the predicate `P = P°_x` for some `x` in the
building and `IsIwahori` as minimality among parahorics (the parahorics `P°_C` of alcoves `C`);
prove `isParahoric_conj` (`P°_{gx} = g P°_x g^{-1}`), `isCompact_parahoric` (for `E` local,
parahorics are compact open in `G(E)`), `iwahori_conj` (Iwahoris are `G(K)`-conjugate),
`parahoric_le_stabilizer` (`P°_x ≤ Fix(x) ≤ Stab(x)`) and `finite_conjClasses` (for `E` local
there are finitely many conjugacy classes) ([Bruhat–Tits II], 5.2.6–5.2.8, pp. 164–165;
[Haines–Rapoport], Def. 1 and Rem. 2, p. 1; [He 2021], §2.1, p. 4). *Needs:*
*parahoric-group-scheme*; RG2.0 *integral-points-compact-open*; RG2.2
*building-cocompact-action*; RG2.2 *facets-and-special-points*.

**Checks.**

- `gl_n_maximal` — `GL_n(O)` is a maximal parahoric of `GL_n(K)`.
- `iwahori_gl2` — at displacement `(1/2, 0)` in the standard apartment of `GL_2`, the parahoric is
  the Iwahori subgroup of matrices in `GL_2(O)` whose lower-left entry lies in `m`.
- `vertex_not_iwahori` (non-example) — `GL_2(O)` is parahoric but not Iwahori.
- `torus_unique` — a torus has the unique parahoric `T(K)_0`, and every group without relative roots
  (anisotropic modulo its centre) likewise has a unique parahoric.
- `stabilizer_not_parahoric_pgl2` (non-example) — for `PGL_2` the stabilizer of an edge, which
  contains `(0 1; ϖ 0)`, strictly contains the Iwahori and is not parahoric. The Lean example
  uses the same algebraic central-quotient hypotheses as `AlgebraicFundamentalGroup.pgl_n`
  with `n = 2`, the existing local root datum and a geometric valuation over a `ModelField`.
  It applies `IsParahoric` to the setwise stabilizer of the image of an apartment alcove.
- `isIwahori_gl1` — for `GL_1` (no relative roots) the parahoric `O^×` of any point is an Iwahori
  subgroup.
- `alcove_stabilizer_not_parahoric_gl2` (non-example) — the stabilizer of a `GL_2` alcove contains
  `(0 1; ϖ 0)`, of determinant `−ϖ`, while every parahoric subgroup has unit determinants; so it is
  not parahoric.

**Parahorics as fixers in the Kottwitz kernel.** (*parahoric-kottwitz-characterization*) Let
`L` be strictly henselian discretely valued with perfect residue field `κ`, let
`G(L)_1 := ker κ_G`, and let `Ω` be a bounded nonempty subset of an apartment, reduced or
enlarged, with reduced image `Ω̄`. Then `P°_Ω = Fix(Ω) ∩ G(L)_1 = Fix(Ω̄) ∩ G(L)_1`, and `G(L)_1` is
the subgroup generated by the parahoric subgroups. Consequently
`𝒢_Ω/𝒢°_Ω(O_L) ↪ (π₁(G)_I)_tors`, and `G(L)_x = G(L)_{x̄} ∩ G(L)^1` with
`G(L)^1 := κ_G^{-1}((π₁(G)_I)_tors)`. Over `E`, `P°_Ω = Fix_{G(E)}(Ω) ∩ ker κ_G`, with `κ_G` the
Kottwitz map over `Ĕ` restricted to `G(E)`, and `𝒢°_x` depends only on `x̄ ∈ B(G^ad, E)`. In
`BruhatTits.Parahoric`, prove `parahoric_eq_fixer_inf_generated` (over a strictly henselian base,
`P°_Ω` is `Fix(Ω)` intersected with the subgroup generated by the parahorics of the points of the
apartment) and `parahoricSubgroup_eq_fixer_inf_kottwitz` (the statement over a nonarchimedean local
field `E`) ([Haines–Rapoport], Def. 1, Prop. 3 and its proof, Rem. 4, pp. 1–3; Rem. 9, p. 5;
Rem. 11, p. 7; Lem. 17, p. 9; [Kisin–Pappas], §1.1.2, arXiv pp. 6–7; [Kisin–Pappas–Zhou], 2.1.1,
arXiv pp. 10–11). *Needs:* *parahoric-group-scheme*; RG2.1 *kottwitz-homomorphism*;
*neron-finite-type-and-connected-models*; RG2.1 *z-extension-existence*; RG2.2
*enlarged-and-reduced-building*.

**Full fixers versus connected parahorics.** (*fixer-versus-parahoric*) Let `G` be over `E` and
`x ∈ B(G, Ĕ)`. (1) `𝒢_x = 𝒢°_x` iff `κ_G(𝒢_x(O_Ĕ)) = 1`, and `π_0((𝒢_x)_κ) ⊂ (π₁(G)_I)_tors`.
(2) If `π₁(G)_I` is torsion-free then `𝒢_x = 𝒢°_x` for all `x`. (3) For types `J ⊂ K`, if the
`K`-parahoric is connected then so is the `J`-parahoric. (4) For `G` simply connected the fixer,
the connected fixer and the type-preserving facet stabilizer coincide. (5) If `G_der` is a product
of Weil restrictions of split groups, `X_*(G_ab)_I` is torsion-free and `x` is very special, then
`𝒢_x = 𝒢°_x`. (6) For `PGL_2` and `x` the edge barycentre,
`Fix(x) = Stab(edge) = N(I) ⊋ I = P°_x`, of index `2` ([van Hoften], §2.2.1, Lem. 2.2.2 and
Lem. 2.2.4, arXiv pp. 13–15; [Kisin–Zhou], Lem. 4.2.4, arXiv pp. 34–35, for (5); [Bruhat–Tits II],
4.6.32, p. 137, for (4)). In `BruhatTits.Parahoric`, prove `fixer_eq_parahoric_of_simplyConnected`
(the fixer of a
point of the apartment is its parahoric when `π₁(G)` is trivial). *Needs:*
*parahoric-kottwitz-characterization*; RG2.1 *algebraic-fundamental-group*; RG2.2
*stabilizers-and-fixers*.

**The reductive quotient of the special fibre.** (*reductive-quotient-of-special-fibre*) For a
facet `F`, or a point `x`, the reductive quotient `𝒢̄_F := 𝒢°_{F,κ}/R_u(𝒢°_{F,κ})`, also written
`G_x`, is connected reductive over `κ`. For a maximal split torus `S` with `F ⊂ A(S)`, the closure
of `S` maps onto a maximal split torus of `𝒢̄_F`; the relative roots of `𝒢̄_F` are the gradients
`a` of the affine roots `a + k` vanishing on `F` (the non-multipliable ones over `κ̄`), and its
Weyl group is `W_F = Fix(F) ⊂ W_aff`. For perfect `κ`, in particular finite or algebraically closed,
`P°_F/P_F^+ ≅ 𝒢̄_F(κ)`, where `P_F^+` is the pro-unipotent radical. The root-system and Weyl-group
statements carry no Lean signature. In `BruhatTits.Parahoric`, define
`reductiveQuotient` as `𝒢̄_F`, a finite-type Hopf `κ`-algebra, and `reductiveQuotientMap` as the
injective Hopf map `κ[𝒢̄_F] → κ ⊗_O A`; prove `reductiveQuotient_isReductive` (`𝒢̄_F` is
connected reductive over `κ`), `reductiveQuotientMap_injective` and `reductiveQuotient_kernel`
(the kernel of `𝒢°_{F,κ} → 𝒢̄_F` is smooth, connected and unipotent, which identifies `𝒢̄_F` with
the quotient by the unipotent radical) ([Bruhat–Tits II], 4.6.12, p. 129; 5.1.31, p. 158;
[Haines–Rapoport], Prop. 12, p. 7; [Fintzen], §3, arXiv pp. 8–9). *Needs:*
*parahoric-group-scheme*; ReductiveGroups layer 5; ReductiveGroups layer 6; ReductiveGroups
layer 3; Tau Ceti `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical`; Tau Ceti
`TauCeti.reductiveCommHopfAlgProperty`; Tau Ceti `TauCeti.smoothUnipotentCommHopfAlgProperty`; Tau
Ceti `TauCeti.CommHopfAlgCat.kernelHopfIdeal`.

**Checks.**

- `reductiveQuotient_gl_n_vertex` — for `GL_n` and the standard vertex, `𝒢̄_x ≅ GL_{n,κ}`.
- `reductiveQuotient_torus` — for a torus `T`, `𝒢̄` is a `κ`-torus, the reductive quotient of
  `𝒯°_κ`.
- `reductiveQuotient_not_specialFibre` (non-example) — for the Iwahori of `GL_2` the special fibre has
  unipotent radical `≠ 1`, so `reductiveQuotientMap` is not surjective and `𝒢̄_C` is a proper
  quotient.
- `reductiveQuotientMap_gl_n_vertex` — at the standard `GL_n` vertex the special fibre is already
  reductive and `reductiveQuotientMap` is bijective.
- `reductiveQuotient_iwahori_gl2` — for the Iwahori of `GL_2`, `𝒢̄_C ≅ G_m²` over `κ`.
- `ramified_torus_reductiveQuotient` — for the norm-one torus of `L = K(a)`, `a² = ϖ`, the maximal
  split torus over `K^sh` is trivial (`X_*(T)^I = 0`), so `𝒢̄_x` has trivial maximal torus
  ([Bruhat–Tits II], 4.6.12 (i), p. 129, over `K^sh`) and is the trivial group, while the special
  fibre of `𝒢°_x` is not (it is `G_a` when `char κ ≠ 2`, from `x² − ϖy² = 1`); so
  `reductiveQuotientMap` is not surjective, `reduction` and `parahoricQuotientEquiv` are trivial and
  `P⁺_x = P°_x`.

**Pro-unipotent radicals, reduction and nested facets.** (*pro-unipotent-radical-and-nested-facets*)
For a facet `F`, the pro-unipotent radical is `P_F^+ := ker(P°_F → 𝒢̄_F(κ))`, which is `G_{x,0+}`.
(1) `P_F^+ ⊲ P°_F`, and `P_F^+` is pro-p when `κ` is finite of characteristic `p`. (2) For perfect `κ`, in particular finite or algebraically closed, `P°_F ↠ 𝒢°_F(κ) ↠ 𝒢̄_F(κ)`. (3) If `F ⊂ F̄'`, there is a
morphism `𝒢°_{F'} → 𝒢°_F` extending the identity of `G`; `P°_{F'} ⊂ P°_F` and
`P_F^+ ⊂ P_{F'}^+`; `P°_{F'}` is the preimage of `p(F')(κ)` for a `κ`-parabolic
`p(F') ⊂ 𝒢̄_F` with Levi `𝒢̄_{F'}`; and `F' ↦ p(F')` is an order-reversing bijection onto the
`κ`-parabolics of `𝒢̄_F` ([Bruhat–Tits II], 4.6.33, pp. 137–138; 5.1.32, p. 158; [van Hoften],
§2.2.3, arXiv p. 14). In `BruhatTits.Parahoric`, define `reduction : P°_Ω → 𝒢̄_Ω(κ)` (reduce an
integral point of `𝒢°_Ω` modulo `m` and compose with `𝒢°_{Ω,κ} → 𝒢̄_Ω`; `reduction_apply`),
`proUnipotentRadical` as `P_Ω^+` and `parahoricQuotientEquiv` as `P°_Ω/P_Ω^+ ≃ 𝒢̄_Ω(κ)`; prove
`proUnipotentRadical_le`, `proUnipotentRadical_eq_ker` (`P_Ω^+` is the kernel of `reduction`),
normality, `parahoricQuotientEquiv_mk` (the isomorphism is induced by `reduction`),
`reduction_surjective` ((2) for perfect `κ`, as supplied by `ModelField`) and `parahoricSubgroup_antitone`
(the inclusions of (3)). *Needs:* *reductive-quotient-of-special-fibre*; RG2.0
*smooth-model-congruence-quotients*; *extension-principle*; ReductiveGroups layer 7.

**Checks.**

- `proUnipotentRadical_gl_n_vertex` — at the standard `GL_n` vertex `P⁺_x = 1 + ϖM_n(O)`: the
  entries of `g − 1` lie in `m`.
- `proUnipotentRadical_iwahori_gl2` — for the Iwahori of `GL_2`, `I⁺` consists of the integral
  matrices with diagonal entries `≡ 1` and lower-left entry `≡ 0` modulo `m`.
- `parahoricQuotient_card_gl_n_vertex` — for `κ = 𝔽_q`, the quotient `P°_x/P⁺_x` identified by
  `parahoricQuotientEquiv` has `|GL_n(𝔽_q)|` elements at the standard vertex.
- `parahoricQuotient_card_iwahori_gl2` — for the Iwahori of `GL_2`, `|I/I⁺| = (q − 1)²`.
- `ramified_torus_reductiveQuotient` (above) — for the ramified norm-one torus, `reduction` and
  `parahoricQuotientEquiv` are trivial and `P⁺_x = P°_x`.

**Parahorics under unramified base change.** (*unramified-base-change-of-parahorics*) Let
`K'/K` be unramified Galois (finite, `K^sh` or `Ĕ`) with integers `O'`, and `Ω` bounded in an
apartment of `B(G, K) ⊂ B(G, K')`. Then `𝒢_Ω ⊗_O O' ≅ 𝒢'_Ω` and `𝒢°_Ω ⊗_O O' ≅ 𝒢'°_Ω`
Galois-equivariantly, `P°_Ω(K) = P°_Ω(K') ∩ G(K) = P°_Ω(K')^{Gal(K'/K)}`, and the `E`-parahorics
of `σ`-stable facets of `B(G, Ĕ)` are the `σ`-fixed `Ĕ`-parahorics ([Bruhat–Tits II],
5.1.8–5.1.9 and 5.1.30–5.1.31, pp. 148, 157–158; 5.2.6–5.2.8, pp. 164–165; [He 2018], §4.3,
p. 12; [van Hoften], §2.2.3, arXiv p. 14). This statement carries no Lean signature; its
local-field consequence for parahoric subgroups is `Parahoric.parahoricSubgroup_eq_fixer_inf_kottwitz`.
*Needs:* *parahoric-group-scheme*; RG2.2 *unramified-descent-of-building*; *extension-principle*.

**Hyperspecial vertices.** (*hyperspecial-vertices*) For `x ∈ B(G, K)` the following are
equivalent: (a) `𝒢°_x` is a reductive model; (b) `𝒢_x` is reductive, in which case
`𝒢_x = 𝒢°_x`. These conditions define a hyperspecial point; by [Bruhat–Tits II], 5.1.40, they
hold iff `G` splits over `K^sh` and `x` is special in `B(G, K^sh)`. Specialness after every finite
unramified extension is the very-special condition and is insufficient here. Hyperspecial points
exist only if `G` splits over `K^sh`, and that alone does not suffice (`SL_1(D)` in
*reductive-model*); for a nonarchimedean local field they exist iff `G` is unramified, and then
reductive `O`-models correspond to the hyperspecial vertices of the
reduced building via `𝒢 = 𝒢_x`, the hyperspecial subgroups are the groups `𝒢_x(O)`, they form one
`G^ad(K)`-orbit, and a hyperspecial point stays hyperspecial after every finite field extension. A
ramified quasi-split `G` has special but no hyperspecial vertices ([Bruhat–Tits II], 4.6.15 and
4.6.31, pp. 130, 136–137; 5.1.40, p. 161; [Bruhat–Tits II], 4.6.26, p. 135 (which refers to Tits's
Corvallis notes, 1.10.2, for the definition of hyperspecial points; existence iff `G` is
unramified and the single `G^ad(K)`-orbit are stated here from that reference); [Prasad–Yu],
Lem. 4.2, p. 7; [Kisin–Pappas–Zhou], proof of Prop. 2.2.2, arXiv p. 12, for finite extensions). In
`BruhatTits.Hyperspecial`, prove `isReductive_iff` ((a) ⟺ (b) for points of the apartment),
`parahoric_eq_of_isReductive` (if `𝒢_x` is reductive, `toParahoric` is an isomorphism) and
`isHyperspecialSubgroup_iff` (the hyperspecial subgroups are the conjugates of the parahorics of
points `x` with `𝒢°_x` reductive). *Needs:* *reductive-quotient-of-special-fibre*;
*reductive-model*; *extension-principle*; RG2.2 *building-field-extension-embedding*; RG2.2
*facets-and-special-points*.

**Checks.** The standard vertex of `GL_n` is hyperspecial (`GroupScheme.parahoric_gl_n_vertex`), a
point inside an alcove of `GL_2` is not (`SmoothModel.iwahori_not_reductive`), and:

- `Hyperspecial.ramified_torus_none` (non-example) — the norm-one torus of a ramified extension
  `L ∋ a` with `a² = ϖ` has no reductive model, hence no hyperspecial subgroup.

**Compact subgroups lie in hyperspecial subgroups after extension.**
(*compact-elements-in-hyperspecial-subgroups*) Let `G` be connected reductive over `ℚ_p`. If
`g ∈ G(ℚ_p)` lies in a compact open subgroup, then for a finite extension `F/ℚ_p` splitting `G` and a
maximal torus containing the semisimple part `g_s`, `g` lies in the parahoric of a hyperspecial
vertex of `B(G, F)` ([Kisin–Zhou], Lem. 6.2.1 and its proof, Rem. 6.2.2, arXiv p. 57). *Needs:*
RG2.2 *bruhat-tits-fixed-point-theorem*; RG2.2 *building-field-extension-embedding*;
*hyperspecial-vertices*; *neron-finite-type-and-connected-models*; ReductiveGroups layer 7.

**Generic points of facets and connected stabilizers.** (*generic-points-and-connected-stabilizers*)
A point `x` of a facet `F ⊂ B(G, K)` is generic iff `𝒢_x = 𝒢_{x'}` for all `x'` near `x` in `F`.
(1) If `𝒢_x = 𝒢°_x` and `y` is generic in the facet of `x`, then `𝒢_y = 𝒢_x`; so the parahoric
group schemes are among the `𝒢_y` with `y` generic. (2) If `G` is unramified over `ℚ_p`, then for
every `x` there is `x'`, generic in the smallest facet containing `x`, with `𝒢°_x = 𝒢_{x'}`
([Kisin–Pappas–Zhou], footnote 3 to Prop. 2.2.2 and the paragraph after it, arXiv p. 12;
[Kisin–Pappas], Rem. 4.2.14 b), arXiv p. 57). In `BruhatTits.Parahoric`, define `IsGeneric`, with
the fixer in place of the group scheme (the two agree over a strictly henselian base by the
*extension-principle*), and prove `fixer_eq_of_connected_of_generic` ((1) on `K`-points). *Needs:*
*fixer-versus-parahoric*; *hyperspecial-vertices*; *parahoric-group-scheme*.

**Checks.**

- `GroupScheme.bounded_singleton` — a point is bounded.
- `GroupScheme.bounded_finite` and `bounded_finite_agreement` — every finite set is bounded and
  the finite constructor agrees with the bounded-set constructor.
- `GroupScheme.unbounded_univ` (non-example) — when the apartment has positive dimension, the
  whole apartment is not bounded.
- `GroupScheme.GL2_standard_parahoric` — the standard `GL₂` vertex gives the pinned `GL₂/O` Hopf algebra.
- `GroupScheme.GL2_standard_parahoric_points` — the standard parahoric is `GL₂(𝒪)`: `g` and `g⁻¹`
  have integral entries.
- `SLTwo.standard_parahoric` — at the standard `SL₂/ℚ_p` vertex the parahoric model is `SL₂/O`.
- `SLTwo.fixer_connected` — at the same vertex the map from the fixer scheme to its identity
  component is an isomorphism.
- `NormTorus.ramified_connected_index` — over any base of the standing context (henselian,
  discretely valued, perfect residue field; for instance `ℚ_p` or `Ĕ`), in every residue
  characteristic, the quadratic norm-one torus with `a²=ϖ` has a singleton building but its
  connected parahoric has index two: `−1 = a/σ(a)` is a norm-one unit whose Kottwitz image is the
  class of `ω_L(a) = 1` in `X_*(T)_I = ℤ/2`.
  Boundedness does not imply connectedness.
- `Parahoric.generic_torus` — when there are no relative roots (for instance for a torus), every
  point of a facet is generic.
- `Parahoric.generic_gl2_vertex` — every point of the facet of the standard `GL_2` vertex (a line in
  the central direction of the enlarged building) is generic.
- `Parahoric.generic_gl2_alcove` — every point of an alcove of `GL_2` is generic.

The nondiscrete construction in [Bruhat–Tits II], 4.6.26, p. 135, additionally assumes (Sch):
the torus model in the schematic root datum has the required smoothening. The constructors here
use the discrete case; the descent is [Bruhat–Tits II], 5.1.9, p. 148.

### RG2.3.4 associated, quasi- and very special parahorics

**Associated parahorics under central surjections.** (*associated-parahorics*) Let `K` be henselian
with a nontrivial discrete valuation and perfect residue field (`ModelField K`), `G` and `G′`
connected reductive, and `G → G′` a central surjection, represented contravariantly by `f : H′ ⟶ H`
with `Building.CentralSurjection f`. Choose `D : LocalRootData K H`, a geometric valuation `φ`, and
a nonempty finite subset `Ω` of its apartment. In `BruhatTits.ParahoricExt`, `associatedParahoric`
is the connected parahoric model of `G′` at the image of `Ω` under `Building.centralApartment`, for
the target datum `Building.centralData` and valuation `Building.centralValuation`.
`associatedParahoric_hom` extends `f` to the integral Hopf algebras, that is, to a morphism
`𝒢°_Ω → 𝒢′°_{f(Ω)}`. `associatedParahoric_generic_fibre` is the generic-fibre identification of
`GroupScheme.parahoricModel` for the target datum, so the generic fibre is `H′`, the coordinate
algebra of the target group; `associatedParahoric_hom_generic` gives compatibility with `f` on
coordinate functions ([Bruhat–Tits II], 4.2.15, pp. 93–94, for the map of buildings, stated there
for quasi-split groups, which covers `G` over `K^ur` ([Bruhat–Tits II], 5.1.1, pp. 145–146), the map
over `K` being its restriction to `Gal(K^ur/K)`-fixed points, RG2.2
*building-functoriality-central-extensions*;
[Kisin–Pappas], §1.1.3, arXiv v3 p. 7, for the extension of `f` to parahorics at a point, over the
fields of their §1.1.1, through the extension principle [Bruhat–Tits II], 1.7.6, p. 39, which gives
the same extension for a finite `Ω`). *Needs:* *parahoric-group-scheme*; *extension-principle*;
RG2.2 *building-functoriality-central-extensions*.

**Checks.**

- `ParahoricExt.associated_identity` — for the identity of `H`, `associatedParahoric_hom` is an
  isomorphism.
- `ParahoricExt.associated_identity_scheme` (degenerate case) — for the identity of `H`,
  `associatedParahoric` is isomorphic to `parahoricGroupScheme D φ {x}`.
- `ParahoricExt.associated_GL1` — for any central surjection of `G_m = GL_1` onto itself (identity,
  inversion, squaring), `associatedParahoric` is `G_m` over `O`, the coordinate Hopf algebra
  `O[t, t^{−1}]` of `GL_1` over `O`.
- `ParahoricExt.associated_hom_not_iso_square` (non-example) — for the squaring isogeny of `G_m`,
  `associatedParahoric_hom` is `t ↦ t²` and is not an isomorphism, in every residue characteristic.
- `ParahoricExt.associated_hom_injective` — `associatedParahoric_hom` is injective on coordinate
  rings: the source is flat over `O`, so it embeds in its generic fibre `H′`, where the map is `f`.
- `ParahoricExt.associated_points_le` — `f` maps `𝒢°_x(O)` into the parahoric subgroup of `G′` at
  the image point.
- `ParahoricExt.associated_points_not_surjective` (non-example) — for the squaring isogeny of
  `G_m = GL_1` over a local field of odd residue characteristic, the image of `O^×` is `(O^×)²`, of
  index two in `O^×`: the integral map need not be onto on `O`-points.

**Quasi-parahoric levels.** (*quasi-parahoric*) Let `K` be as above, `D`, `φ` as above and `x` a
point of the apartment. Write `𝒢_x(O)` for the integral points of the Bruhat–Tits stabilizer scheme
`GroupScheme.toSmoothModel D φ {x}` (the fixer of `x` in the enlarged building, by
`GroupScheme.integralPoints_eq_fixer`) and `𝒢°_x(O) = parahoricSubgroup D φ {x}`. A level subgroup
`𝒦 ⊆ G(K)` is quasi-parahoric if `𝒢°_x(O) ⊆ 𝒦 ⊆ 𝒢_x(O)` for some `x`; this is the sandwich
condition, on `O`-points, in the definition of quasi-parahoric group schemes of [Kisin–Pappas–Zhou],
§2.1.1, arXiv v3 pp. 10–11 (stated there on `Ŏ`-points, for `K` finite over `ℚ_p` or `Q̆_p`, under
the standing hypothesis `p > 2` of that section). In `BruhatTits.ParahoricExt`, define
`IsQuasiParahoric`; prove `isQuasiParahoric_parahoric` (`𝒢°_x(O)` is quasi-parahoric),
`isQuasiParahoric_fixer` (`𝒢_x(O)` is quasi-parahoric), `parahoric_normal_fixer` (`𝒢°_x(O)` is
normal in `𝒢_x(O)`) and `parahoric_index_fixer_finite` (`𝒢°_x(O)` has finite index in `𝒢_x(O)`; the
quotient embeds in the component group of the special fibre of `𝒢_x`) ([Haines–Rapoport], Rem. 11,
p. 7, for `𝒢°_x` as the identity component of `𝒢_x`; [Kisin–Pappas–Zhou], §2.1.1, p. 11, for the
finiteness). By `parahoric_normal_fixer` and Mathlib's correspondence theorem
`QuotientGroup.comapMk'OrderIso`, the quasi-parahoric levels at `x` correspond to the subgroups of
the finite group `𝒢_x(O)/𝒢°_x(O)`. *Needs:* *parahoric-group-scheme*; *extension-principle*;
*fixer-versus-parahoric*.

**Checks.**

- `isQuasiParahoric_simplyConnected` — for `G` simply connected (trivial algebraic fundamental
  group) the fixer is the parahoric (`Parahoric.fixer_eq_parahoric_of_simplyConnected`), so the
  quasi-parahoric levels are exactly the parahoric subgroups `𝒢°_x(O)`; the Lean example is proved.
- `isQuasiParahoric_normTorus_count` — for the separable square-root norm-one torus over any
  model field of characteristic different from two, in every residue characteristic, exactly two levels lie between `𝒯°(O)` and
  `𝒯^ft(O) = T(K)`.
- `not_isQuasiParahoric_stabilizer` (non-example) — for `GL_2` over a local field the scalar `ϖ`
  fixes every point of the reduced building but lies in no `𝒢_x(O)`, so no level containing it is
  quasi-parahoric.
- `isQuasiParahoric_GL` — for `GL_n` the fixers are connected (`π₁(GL_n) = ℤ` is torsion-free), so
  every quasi-parahoric level is a parahoric subgroup.

**Very special points and parahorics.** (*very-special-parahoric*) Let `E` be a nonarchimedean local
field, `D` a local root datum of `G` over `E` with geometric valuation `φ`, and `A` a descended
maximal `Ĕ`-split torus containing `S` (`UnramifiedApartmentData`, `A.torusIdeal ≤ D.splitTorus`),
with the unramified descent `apartmentDescent` from the apartment of `S` over `E` to the apartment
of `A` over `Ĕ` (RG2.1). A point `x` of the apartment over `E` is very special if it is special
(`Facet.IsSpecial`) and its image under `apartmentDescent` is special in the apartment over `Ĕ`
([Haines], §6.2, p. 14, where `G` is quasi-split and a very special vertex is a vertex special over
`Ĕ`; for the vertices of a `σ`-stable alcove this is the condition of [van Hoften], §2.2.5, p. 15,
that the parabolic subgroup of the vertex type maps isomorphically onto the relative Weyl group over
`Ĕ`). In `BruhatTits.ParahoricExt`, define `IsVerySpecial`; prove `IsVerySpecial.isSpecial` (a very
special point is special; proved), `exists_isVerySpecial` (if `G` is quasi-split, that is, the
centralizer of `S` is a torus, a very special point exists; [van Hoften], §2.2.5, p. 15, which cites
Kaletha–Prasad, Prop. 10.2.1; [Haines], §6.2, p. 14) and `parahoric_le_of_mem` (for
`v ∈ Ω`, `𝒢°_Ω(O) ⊆ 𝒢°_v(O)`; for `Ω` the vertex set of the base alcove this puts the Iwahori
subgroup inside every vertex parahoric, very special or not; [Haines–Rapoport], Prop. 3, p. 1, and
Rem. 4, p. 3). *Needs:* *parahoric-subgroup*; *hyperspecial-vertices*; RG2.1
*unramified-descent-of-valuation*; RG2.1 *frobenius-action-on-apartment*; RG2.2
*facets-and-special-points*.

**Checks.**

- `isVerySpecial_GL2_iff` — for split `GL_2`, a point of the standard apartment with coordinates
  `(v₀, v₁)` is very special iff `v₀ − v₁ ∈ ℤ`; these are the vertices, all hyperspecial.
- `not_isVerySpecial_GL2_barycentre` (non-example) — the barycentre `(0, −1/2)` of the standard
  `GL_2` alcove is not very special.
- `isVerySpecial_of_isEmpty_roots` (degenerate case) — when `G` has no roots over `Ĕ` every special
  point is very special; the Lean example is proved.
- `not_isVerySpecial_special_ramified` (non-example) — for the unramified quasi-split `SU_3`, the
  vertex of the base alcove that is special over `E` but is the midpoint of an edge of the
  `Ĕ`-alcove (type `Ã_2` over `Ĕ`) is not very special; the other vertex is hyperspecial. This
  check has no Lean mirror: the file has no carrier for `SU_3`.

**Parahorics under central extensions.** (*central-extensions-of-parahorics*) Let `K` be as in
[Kisin–Pappas], §1.1.1, arXiv v3 p. 6 (finite and totally ramified over `W(k)[1/p]`, or `k((π))`,
with `k` finite or an algebraic closure of `𝔽_p`), `α : G → G̃` a central extension of connected
reductive groups with kernel `Z`, `x̃ = α_*(x)`, and `𝒵 ⊂ 𝒢°_x`, `𝒵′ ⊂ 𝒢_x` the closures of `Z`. (a)
`α` extends uniquely to `𝒢_x → 𝒢̃_x̃` and to `𝒢°_x → 𝒢̃°_x̃`. (b) If `G` splits over a tamely
ramified extension and `Z` is a torus or a finite group of order prime to `p`, then `𝒵` is smooth
and `1 → 𝒵 → 𝒢°_x → 𝒢̃°_x̃ → 1` is exact for the fppf topology; if `Z` is a torus which is a direct
summand of an induced torus, `𝒵` is its connected Néron model. (c) Under the same hypotheses `𝒵′` is
smooth and equals `ker(𝒢_x → 𝒢̃_x̃)`, but `𝒢_x → 𝒢̃_x̃` may fail to be fppf surjective (for instance
when `𝒢_x` is connected and `𝒢̃_x̃` is not) ([Kisin–Pappas], §1.1.3, Prop. 1.1.4 and its proof, Rem.
1.1.8, arXiv v3 pp. 7–8; [Bruhat–Tits II], 1.2.13, p. 20, 1.7.6, p. 39, and 4.2.15, pp. 93–94). These
are statements of this section without a Lean target; the split-kernel case below is the Lean
target. *Needs:* *parahoric-group-scheme*; *extension-principle*; *big-cell-criteria*;
*quotients-over-a-dvr*; *torus-models-exact-sequences*; RG2.2
*building-functoriality-central-extensions*.

The split-kernel specialization `ParahoricExt.centralExtension_exact_split` is stated over a
nonarchimedean local field, with no tameness or residue-characteristic restriction. A Hopf ideal
`Z` cuts out a split torus and identifies the kernel of `f` on every coefficient algebra. For
`x` in the source apartment, the integral map `associatedParahoric_hom` is faithfully flat and
finitely presented ([Kisin–Zhou], Prop. 2.4.13, arXiv v2 p. 17, proof pp. 17–18, whose only
hypothesis is that the kernel is an R-smooth torus; split tori are R-smooth by [Kisin–Zhou],
§2.4.5, p. 14). This specialization asserts fppf surjectivity; it does not specify an integral
kernel model or its components.

### RG2.3.5 integral models of stabilizers for classical and Hodge-type groups

The statements of this subsection are stated with their hypotheses and sources and have no Lean
targets, except the lattice-rescaling step `KisinPappas.hyperspecial_orthogonal_selfDual` of
*classical-hyperspecial-lattices*; the rational-point form of the lattice-chain description is
`GLBuilding.stabilizer_eq` (RG2.2).

**Parahorics of GL and GSp as lattice-chain automorphism groups.**
(*lattice-chain-stabilizer-schemes*) Let `V` be finite-dimensional and let `x ∈ B(GL(V),K)`
correspond to the graded periodic lattice chain `(Λ_•, c)` with determining segment
`ϖΛ_0 ⊂ Λ_{r−1} ⊂ ⋯ ⊂ Λ_0`. (a) The fixer scheme `𝒢ℒ_x` is the schematic closure of `GL(V)` in
`∏_{i<r} GL(Λ_i)`, which is the automorphism scheme `Aut(Λ_•)` of the chain, and it is smooth. (b)
With `tot(L) := ⊕_{i<r} Λ_i ⊂ V^r` (the summand `ϖΛ_0` omitted), the map `𝒢ℒ_x ↪ GL(tot(L))`
extending the diagonal map is a closed immersion. (c) For `ψ` a perfect alternating form and
`x ∈ B(GSp(V),K)` corresponding to an almost self-dual chain with `(Λ^i)^∨ = Λ^{−i−a}`, the fixer
`𝒢𝒮𝒫_x` is the closure of `GSp(V)` in `∏_{−(r−1)−a ≤ i < r} GL(Λ^i)`, which is the scheme of
similitude automorphisms of `Λ^•`, and equally the closure in `GL(Λ′)` for `Λ′ = ⊕_i Λ^i ⊂ ⊕_i V`
with the form `ψ′ = ⊕ψ`; after scaling, `Λ′ ⊂ Λ′^∨` ([Bruhat–Tits 1984], 3.6 Théorème, p. 288, 3.8
and 3.9, p. 289, and [Kisin–Pappas], §1.1.9, arXiv v3 pp. 8–9, for (a); [Kisin–Pappas–Zhou], §2.3
and Lem. 2.3.1, arXiv v3 pp. 13–14, for (b); [Kisin–Pappas], §1.1.11, pp. 9–10, for (c), the memoir
[Bruhat–Tits 1984] treating `GL` only). *Needs:* RG2.2 *gl-building-lattice-chains*; RG2.2
*gsp-building-self-dual-chains*; *bruhat-tits-group-scheme*; *extension-principle*; Mathlib
`Submodule.IsLattice`.

**Closed immersion of fixer schemes for minuscule embeddings.** (*hodge-type-fixer-immersion*) Let
`K` be `p`-adic of characteristic `0` (or `k((π))`, with the data below), let `G` be split over a
finite tame Galois extension `K̃/K` with group `Γ`, let `ρ : G ↪ GL(V)` be a faithful minuscule
algebraic representation and `ι : B(G,K) → B(GL(V),K)` the toral embedding constructed from the
highest-weight lattices and real shifts of [Kisin–Pappas], §1.2.12, p. 13, and (1.2.26) in §1.2.25,
p. 16. In equal characteristic require the representation decomposition into restrictions of scalars
of twisted Weyl modules of §1.2.27, p. 16, and §1.3.13; separability alone does not replace these
conditions. For every `x`, `ρ` extends to a closed immersion `ρ_x : 𝒢_x → 𝒢ℒ_{ι(x)}` of the full
stabilizer scheme. The two ingredients are: (i) for bounded `Ω ⊂ B(G,K) = B(G,K̃)^Γ`,
`𝒢_{Ω,K} ≅ (Res_{Õ/O} 𝒢_{Ω,K̃})^Γ`, a closed subscheme of `Res_{Õ/O} 𝒢_{Ω,K̃}`; (ii) `ρ_x` is a
closed immersion as soon as the closure of `G` in `𝒢ℒ_{ι(x)}` is smooth ([Kisin–Pappas], §1.3.1,
Prop. 1.3.3 and proof, (1.3.5)–(1.3.12), Prop. 1.3.9, §1.3.13, arXiv v3 pp. 16–20 (IHÉS pp.
139–144); [Bruhat–Tits 1984], 3.5, p. 287, 3.6 and 3.9(2), pp. 288–289). Here `ρ` is an algebraic
representation together with the lattice data of `ι`; a homomorphism of point groups does not
suffice, and the minuscule hypothesis is used in the proof ([Kisin–Pappas], Rem. 1.3.7). *Needs:*
RG2.2 *minuscule-toral-embedding*; *lattice-chain-stabilizer-schemes*; *bruhat-tits-group-scheme*;
*schematic-closure*; *big-cell-criteria*; RG2.0a *tame-fixed-points-of-weil-restriction*; RG2.0a
*integral-weil-restriction*.

**Tame realization of stabilizers as fixed points of hyperspecial models.**
(*tame-hyperspecial-realization*) Let `p > 2`, let `K` be finite over `ℚ_p` or over `Q̆_p`, and let
`G` be tame classical: `G^ad` has no exceptional or triality factors, and its factors
`Res_{L/K} PGL_m(D)` have `p ∤ ind D`. Let `x ∈ B(G,K)` be generic in its facet (its stabilizer is
constant on a neighbourhood of `x` in the facet), `𝒢 = 𝒢_x`, and write `R := Res_{Õ/O}`. (1) There
are `x′` with `𝒢_{x′} = 𝒢_x` and a finite tame Galois extension `K̃/K` with group `Γ` such that
`G_{K̃}` is split and `x′` is hyperspecial over `K̃`. (2) `𝒢̃_{x′}` over `Õ` is reductive, `Γ` acts
on it `Õ`-semilinearly extending its action on `G_{K̃}`, and `𝒢 ≅ (R𝒢̃_{x′})^Γ`. (3) Given
`ρ : G ↪ GL(V)`, there is a `Γ`-stable `Õ`-lattice `Λ̃ ⊂ V_{K̃}` with `𝒢̃_{x′} ↪ GL(Λ̃)` a closed
immersion (tameness is not needed for this), and `𝒢 ↪ (R GL(Λ̃))^Γ ↪ GL(Λ̃)` closed; moreover
`(R GL(Λ̃))^Γ = GL(L)` for the chain `L = {(π̃^iΛ̃)^Γ}`, and `tot(L)` is an `O`-direct summand of
`Λ̃` in the totally ramified case. (4) For `F/ℚ_p` finite inside `Q̄_p`, `F^t = F·ℚ_p^t`
([Kisin–Pappas–Zhou], §2.2.1, Prop. 2.2.2 and proof, arXiv v3 pp. 12–13; §2.3.2, Lem. 2.3.3, pp.
14–15; §2.3.6, p. 15; Prop. 2.4.2 and Rem. 2.4.3, p. 16; §2.4.4 and (2.4.5), pp. 16–17; Lem. 6.1.2,
p. 65). *Needs:* *hyperspecial-vertices*; *reductive-closed-immersion-criterion*; RG2.0a
*tame-fixed-points-of-weil-restriction*; *lattice-chain-stabilizer-schemes*; RG2.2
*tame-descent-of-building*; RG2.0a *integral-weil-restriction*.

**Models of similitude, derived and adjoint groups.** (*similitude-and-derived-models*) (a) For
`dim V = 2n` and `h` perfect symmetric, `GO(V,h) = {g : h(gv,gv′) = c(g)h(v,v′)}` has two
components, and `GO^+(V)` is the component where `c(g)^n = det g`. (b) For `p > 2`, `𝒢` smooth over
`ℤ_p` with a closed immersion `𝒢 ↪ GSp(Λ)`, `Λ = Λ^∨`, and containing the central `G_m`, the
similitude character `c : 𝒢 → G_m` is a smooth morphism; hence `ker c`, its fibre over the unit
section, is smooth. (c) Let `p > 2`, `G` tame of Hodge type with `p ∤ |π₁(G^der)|`, and `𝒢_{ℤ_(p)}`
the full stabilizer scheme of `x`. The closure of `G^der` in `𝒢_{ℤ_(p)}` is the stabilizer scheme of
`x^ad` for `G^der`, and its identity component is the parahoric of `G^der`; if `Z_G` is connected or
the order of `Z_{G^der}` is prime to `p`, the parahoric of `G^ad` is the identity component of
`𝒢_{ℤ_(p)}/𝒵`, with `𝒵` the closure of the centre ([Kisin–Pappas–Zhou], §6.2.1, arXiv v3 p. 69;
[Kisin–Pappas–Zhou], Lem. 7.2.14 with proof, p. 85; [Kisin–Pappas], Lem. 4.6.2, arXiv v3 pp. 64–65).
*Needs:* *parahoric-group-scheme*; *central-extensions-of-parahorics*;
*lattice-chain-stabilizer-schemes*.

**Hyperspecial lattices for orthogonal and quaternionic groups.**
(*classical-hyperspecial-lattices*) Let `p > 2`. (a) For `K̃/K` tame Galois with group `Γ`,
`G′ = GO^+(V,h)` split over `K̃`, and `x ∈ B(G′,K̃)` a `Γ`-fixed point with hyperspecial fixer, the
fixer of `x` is the stabilizer of a `Γ`-stable `Õ`-lattice `Λ̃ ⊂ V_{K̃}` with `Λ̃^∨ = π̃^aΛ̃`; after
adjoining `√π̃` and passing to the (still tame) Galois closure one rescales to `Λ̃^∨ = Λ̃`, and the
model is `GO^+(Λ̃,h)` ([Kisin–Pappas–Zhou], proof of Thm 6.2.3, arXiv v3 p. 71). (b) For `D` a
quaternion division algebra over `K` with its main involution, any nondegenerate quaternionic
hermitian form `S` on `T_0 ≅ D^s` has a `D`-basis in which `S = Σ d̄_i d′_i` ([Kisin–Pappas–Zhou],
§6.2.2 (b), p. 70). (c) The representation `σ_{T_0}` is a sum of basic symplectic representations by
(b), and so is `σ_{V_0}` ([Kisin–Pappas–Zhou], §6.2.2 (a), pp. 69–70). The rescaling step of (a) is
`KisinPappas.hyperspecial_orthogonal_selfDual` (proved): for a bilinear form `h` on `Kⁿ` and an
`O`-submodule `Λ ⊆ Kⁿ` (for instance a lattice) with `Λ^∨ := {v : h(v, Λ) ⊆ O} = cΛ`, and `s² = c`
with `s ≠ 0`, `(sΛ)^∨ = sΛ`. *Needs:* *reductive-model*; *hyperspecial-vertices*;
*tame-hyperspecial-realization*; *lattice-chain-stabilizer-schemes*.

### RG2.3.6 Moy–Prasad filtrations

**The Moy–Prasad filtration.** (*moy-prasad-filtration*) Let `K` be henselian discretely valued with
perfect residue field `κ` (`ModelField K`), with valuation `ω` normalized by `ω(ϖ) = 1` and
extended, not renormalized, to algebraic extensions, `y ∈ B^e(G,K)` a point of the enlarged building
and `r ≥ 0`. The construction is made over the maximal unramified extension `K^ur`, over which `G`
is quasi-split: let `A ⊇ S` be a maximal `K^ur`-split torus defined over `K`, so that `T = Z_G(A)`
is a torus, let `T(K^ur)_0` be the parahoric subgroup of `T(K^ur)` and, for `r > 0`,
`T(K^ur)_r = {t ∈ T(K^ur)_0 : ω(χ(t) − 1) ≥ r for all χ ∈ X^*(T)}`. For `x` in the apartment of `A`,
`G(K^ur)_{x,r}` is generated by `T(K^ur)_r` and the affine root subgroups `U_ψ` with `ψ(x) ≥ r`, and
for `x ∈ B(G,K)` the group `G_{x,r}` consists of the `Gal(K^ur/K)`-fixed points of `G(K^ur)_{x,r}`
([Adler], §1.4, pp. 8–9; [Moy–Prasad 1996], §3.2, p. 103, where `ω` is normalized on a splitting
field, so that their indices are the ones here multiplied by its ramification index). The same
construction for the minimal Levi `Z = Z_G(S)` at the points of the apartment of `S` (on which it
does not depend) gives its filtration `Z(K)_r`: `Z(K)_0` is the parahoric subgroup of `Z(K)`, and
when `Z` is a torus (`G` quasi-split) `Z(K)_r = {z ∈ Z(K)_0 : ω(χ(z) − 1) ≥ r}` for all characters
`χ` of `Z` over a splitting field. For a group `Z` which is not a torus, characters do not determine
`Z(K)_r`: for `G = Z = SL_1(D)`, `D` a quaternion division algebra, they would give `Z(K)_r = G(K)`
for every `r`. For other points `G_{gx,r} = gG_{x,r}g^{−1}`, and `G_{y,r+} := ∪_{s>r} G_{y,s}`. In
`MoyPrasad`, define `filtration` (`G_{y,r}`; for `r < 0` it is `G_{y,0}` by the convention
`filtration_of_neg`), `filtrationPlus` (`G_{y,r+}`) and `torusFiltration` (`Z(K)_r`); prove
`filtration_of_neg`, `torusFiltration_zero` (`Z(K)_0` is `minimalLeviParahoric`),
`torusFiltration_le` (`Z(K)_r ⊆ Z(K)`), `filtration_zero` (`G_{x,0} = 𝒢°_x(O)`; [Moy–Prasad 1996],
§3.1–3.2, pp. 102–103), `filtration_antitone` (`r ≤ s` implies `G_{y,s} ⊆ G_{y,r}`),
`filtration_normal` (`G_{y,r} ⊴ G_{y,0}`) and `commutator_filtration_le`
(`[G_{y,r}, G_{y,s}] ⊆ G_{y,r+s}` for `r, s ≥ 0`) ([Adler], Prop. 1.4.2, p. 10; [Moy–Prasad 1996],
§3.2, p. 103), `filtrationPlus_normal` (`G_{y,r+} ⊴ G_{y,r}`, from the normality of every `G_{y,s}`,
`s ≥ 0`, in `G_{y,0}` and from `filtration_of_neg`), `filtration_conj` (`gG_{y,r}g^{−1} = G_{gy,r}`;
[Moy–Prasad 1996], §3.2, p. 103) and `filtration_eq_closure_generators` (for `x` in the apartment of
`S` and `r > 0`, `G_{x,r}` is generated by `Z(K)_r` and the root-group filtration subgroups
`U_{a,x,r}` cut out by the affine roots `α` of gradient `a` with `α(x) ≥ r`: over `K^ur` this is the
definition above, [Adler], §1.4, p. 9, and for split `G` it is used in [Adler], proof of Prop.
1.4.3, p. 11; over `K` it follows by taking `Gal(K^ur/K)`-fixed points in the unique product
decomposition of `G(K^ur)_{x,r}` along the relative roots). These statements need no tameness and no
condition on `p` ([Moy–Prasad 1996], §2.1, p. 100, works with any connected reductive group over a
nonarchimedean local field of any characteristic). The sources state them over a nonarchimedean
local field and its maximal unramified extension; here they are stated over every `K` as above, the
setting of the unramified descent of [Bruhat–Tits II], 5.1.1, pp. 145–146, which includes `Ĕ`.
*Needs:* *parahoric-subgroup*; *reductive-quotient-of-special-fibre*; RG2.1
*affine-roots-and-filtrations*; RG2.1 *valued-commutator-estimates*; RG2.2 *building*; RG2.2
*building-apartment-axioms*; RG2.2 *facets-and-special-points*.

**Checks.**

- `filtration_GL_vertex` — for `GL_n` at the standard vertex and `r > 0`,
  `G_{x,r} = {g ∈ GL_n(O) : g ≡ 1 mod ϖ^{⌈r⌉}}`, read through `TauCeti.GeneralLinear.pointsMulEquiv`
  as `LevelSubgroups.principalCongruence K n ⌈r⌉`.
- `filtration_split_torus` — for the split torus `G_m = GL_1` and `r > 0`, `G_{y,r} = 1 + m^{⌈r⌉}`
  at every point (the unit filtration, Tau Ceti `TauCeti.unitFiltration` over a local field);
  two-term witness: `G_{y,1} = 1 + m` and `G_{y,3/2} = 1 + m²`.
- `filtration_jump_nonexample` (non-example) — for `G_m`, `G_{y,1/2} = G_{y,1}`: the filtration is
  not strictly decreasing in `r`.
- `filtrationPlus_split_torus` — for `G_m` and `r ≥ 0`, `G_{y,r+} = 1 + m^{⌊r⌋+1}`.
- `filtrationPlus_jump` (non-example) — for `G_m`, `G_{y,1+} = 1 + m² ≠ 1 + m = G_{y,1}`.
- `filtrationPlus_zero_eq_proUnipotent` — `G_{x,0+}` is the pro-unipotent radical
  `Parahoric.proUnipotentRadical` of `𝒢°_x(O)` ([Moy–Prasad 1996], §3.1–3.2, pp. 102–103).
- `torusFiltration_GL` — for `GL_n` and `r > 0`, `Z(K)_r` is the diagonal part of
  `1 + ϖ^{⌈r⌉} M_n(O)`.
- `torusFiltration_eq_filtration_of_isEmpty` (degenerate case) — without roots, `G_{y,r} = Z(K)_r`
  at every point.
- `torusFiltration_ne_filtration_GL2` (non-example) — for `GL_2` at the standard vertex,
  `1 + ϖE₁₂ ∈ G_{x,1}` is not in `Z(K)_1`.

**Moy–Prasad lattices in the Lie algebra and its dual.** (*moy-prasad-lie-lattices*) Let
`g := Lie(G)(K)` be the tangent space at the identity, the `K`-module of counit derivations
`Derivation K H (TauCeti.Bialgebra.CounitAlgebra K H K)` of Tau Ceti (ReductiveGroups layer 2), with
the bracket given by the convolution commutator (`Derivation.coe_bracket`) and the adjoint action
`Ad g d = g ⋆ d ⋆ g^{−1}` of `Derivation.adRepresentation`. For `r ∈ ℝ` the `O`-lattice
`g_{x,r} ⊂ g` is constructed like `G_{x,r}`: over `K^ur`, for `x` in the apartment of `A`, it is
spanned by `t(K^ur)_r = {H ∈ Lie(T)(K^ur) : ω(dχ(H)) ≥ r for all χ ∈ X^*(T)}` and the root-space
lattices `u_ψ` with `ψ(x) ≥ r`, and over `K` it consists of the `Gal(K^ur/K)`-fixed points;
`g_{y,r+} := ∪_{s>r} g_{y,s}`, `g*_{y,r} := {X ∈ g* : X(g_{y,(−r)+}) ⊆ m}`, and the depth of
`X ∈ g*` at `y` is `d(y,X) := sup{r : X ∈ g*_{y,r}}`, with `d(y,0) = ∞` ([Adler], §1.1, p. 5, and
§1.4, pp. 8–9; [Moy–Prasad 1994], §3.2, p. 399, and §3.5, p. 400; [Fintzen], §3, arXiv v2 p. 9, for
the depth). In `MoyPrasad`, define `Ad` (from `Derivation.adRepresentation`), `lieLattice`
(`g_{y,r}`), `lieLatticePlus` (`g_{y,r+}`), `dualLattice` (`g*_{y,r}`) and `depth` (in `EReal`);
prove `lieLattice_antitone` (`r ≤ s` implies `g_{y,s} ⊆ g_{y,r}`), `lieLattice_add_one`
(`ϖg_{y,r} = g_{y,r+1}`; [Moy–Prasad 1994], §3.2, p. 399, where the shift is by the ramification
index of a splitting field in their normalization; [Yu], proof of Lem. 8.2, p. 597, for `r = 0`),
`lie_bracket_lieLattice_le` (`[g_{y,r}, g_{y,s}] ⊆ g_{y,r+s}` for all real `r, s`; [Adler], Prop.
1.4.2, p. 10), `lieLattice_ad` (each `g_{y,r}` is stable under `Ad(G_{y,0})`; [Moy–Prasad 1994],
§3.2, p. 399; [Moy–Prasad 1996], §3.3, p. 104), `lieLattice_extension_inter` (for a finite extension
`K′/K` of local fields of ramification index `e`, with the scalar extension of tangent vectors and
the building map `Building.extensionEmbedding`, `g_{y,r} = g ∩ (g_{K′})_{y,e·r}`, depths over `K′`
being normalized by `K′`; [Adler], Prop. 1.4.1, p. 9, for every finite extension, with no tameness
hypothesis; [Fintzen], (1), p. 8, in the extended normalization, where the index is `r`) and
`lieLattice_semicontinuous` (the jumps are discrete: `g_{y,r−ε} = g_{y,r}` for small `ε > 0`;
[Moy–Prasad 1994], §3.4, p. 399, and [Moy–Prasad 1996], §3.3, p. 104, for `r ≥ 0`, and for `r < 0`
by `lieLattice_add_one`). *Needs:* *moy-prasad-filtration*; ReductiveGroups layer 2; RG2.1
*affine-roots-and-filtrations*; RG2.1 *valued-commutator-estimates*; Tau Ceti
`Derivation.adRepresentation`.

**Checks.**

- `Ad_one` and `Ad_mul` — `Ad 1 = id` and `Ad (gh) = Ad g ∘ Ad h`; both Lean examples are proved.
- `Ad_GL` — for `GL_n`, reading `d` as the matrix `(d(x_{ij}))`, `Ad g` is `M ↦ gMg^{−1}`.
- `lieLattice_GL_apartment` — for `gl_n` at the point with coordinates `v`, `d ∈ g_{x,r}` iff
  `r ≤ ω(d(x_{ij})) + v_i − v_j` for all `i, j`; at the standard vertex this is `ϖ^{⌈r⌉} M_n(O)`.
- `lieLattice_not_power_of_m` (non-example) — at the barycentre `(0, −1/2)` of the standard `GL_2`
  alcove, `g_{x,1/2}` (diagonal and lower entries in `m`, upper entry in `O`) is none of the vertex
  lattices `ϖ^k M_2(O)`.
- `lieLatticePlus_GL_vertex` — at the standard vertex of `GL_n`, `d ∈ g_{x,r+}` iff
  `r < ω(d(x_{ij}))` for all `i, j`, that is `g_{x,r+} = ϖ^{⌊r⌋+1} M_n(O)`.
- `dualLattice_trace_GL` — at the standard vertex of `GL_n`, the trace pairing
  `X_A(d) = tr(A·(d(x_{ij})))` has `X_A ∈ g*_{x,r}` iff `r ≤ ω(A_{ij})` for all `i, j`.
- `lieLattice_Gm` — for `G_m = GL_1`, at every point of the building, `d ∈ g_{y,r}` iff
  `r ≤ ω(d(x₀₀))`, that is `g_{y,r} = ϖ^{⌈r⌉}O`.
- `lieLatticePlus_Gm_jump` (non-example) — for `G_m`, `g_{y,0+} = m ≠ O = g_{y,0}`.
- `lieLatticePlus_GL2_barycentre` — at the barycentre `(0, −1/2)` of the standard `GL_2` alcove the
  jumps are at multiples of `1/2`, so `g_{x,0+} = g_{x,1/2}`.
- `dualLattice_Gm` — for `G_m` and `X = c·d(x₀₀)`, `X ∈ g*_{y,r}` iff `r ≤ ω(c)` (every `r` for
  `c = 0`).
- `dualLattice_sign` — for `G_m` and `X = d(x₀₀)`, `X ∈ g*_{y,0}` but `X ∉ g*_{y,1}`; with
  `g_{y,r+}` in place of `g_{y,(−r)+}` the functional would lie in `g*_{y,1}`.
- `depth_zero_eq_top` — `d(y,0) = ⊤`.
- `depth_Gm` and `depth_Gm_uniformizer` — for `G_m = GL_1` and `X = c·d(x₀₀)` with `c ≠ 0`,
  `d(y,X) = ω(c)`; two-term witness fixing the sign `(−r)+`: `c = 1` gives depth `0` and `c = ϖ`
  gives depth `1`.

**Yu's mixed-depth groups and lattices.** (*yu-mixed-depth-groups*) Let `K` be a
nonarchimedean local field, `G⁰ ⊆ ⋯ ⊆ Gᵈ = G` a tame twisted Levi sequence (all stages become
Levi subgroups over one finite tame splitting extension), and `y ∈ Bᵉ(G⁰,K)`, with compatible
building embeddings into the later stages. For real depths `0 ≤ r₀ ≤ ⋯ ≤ r_d`, construct
`G^{→}_{y,r→} = G⁰_{y,r₀} ⋯ Gᵈ_{y,r_d}` and
`g^{→}_{y,r→} = g⁰_{y,r₀} + ⋯ + gᵈ_{y,r_d}`. The product is a subgroup: each earlier factor
normalizes every later factor at these nonnegative depths. Its bounds are
`G_{y,r_d} ⊆ G^{→}_{y,r→} ⊆ G_{y,r₀}`. Equal depths recover `G_{y,r}`; all depths zero recover
the parahoric. For two increasing positive depths `0 < s ≤ t`, its intersection with `G⁰(K)` is
`G⁰_{y,s}`. These constructions use the tame sequence and compatible embeddings of [Yu],
pp. 585–586, as located in [Kim–Yu], §2.4, p. 2, and §3.5, pp. 3–4; the product construction
appears explicitly in [Kim–Yu], §6.1, p. 9, citing [Yu], §3. The arbitrary nondecreasing-depth
formula above uses the same normalization argument, without imposing the strict depth
inequalities or representation-theoretic data needed for a supercuspidal representation.

Also construct Yu's root-defined two-depth group `(G′,G)_{y,s,t}` for
`s ≥ t ≥ s/2 > 0`: over a common tame splitting field, take the torus and roots of `G′` at
depth `s` and the remaining roots at depth `t`, then intersect with `G(K)`. Construct the
analogous Lie lattice, prove independence of the torus and splitting extension, and prove its
intersection with `G′(K)` is `G′_{y,s}`. This decreasing pair is a distinct construction from
the increasing-depth product. Verified locator: [Fintzen], §4, pp. 16–17, immediately before
Definition 4.5, which explicitly attributes independence to [Yu], pp. 585–586. In this
root-defined target impose the standing regime of [Fintzen], Assumption 2.1, p. 7: tame
splitting and residue characteristic `p ∤ |W(G)|`. No unrestricted small-characteristic
extension of those assertions is intended.

The Lean representatives `MoyPrasad.yuGroup` and `yuLieLattice` use the stage Hopf ideals `I_i`
and the ambient image of `y`. They are defined respectively as the supremum of
`G_{y,r_i} ∩ Gⁱ(K)` and the sum of `g_{y,r_i} ∩ Lie(Gⁱ)(K)`; the latter tangent space is
exactly the counit derivations annihilating `I_i`. Constructing the compatible tame building
maps and identifying these intersections with the intrinsic stage filtrations at positive
depth is part of this target, using RG2.2 *twisted-levi-subgroup*. At depth zero, construct
the product from the intrinsic stage parahorics: a twisted Levi's parahoric can be strictly
smaller than its intersection with an ambient parahoric (the ramified norm-one torus gives
an example). Thus the intersection formula represents the positive-depth target and the
listed constant-depth degeneracies, not every nonnegative-depth sequence.
`yuGroup_le`, `yuGroup_self` and `yuGroup_inf_twistedLevi` give the algebraic properties of
that representative. `yuGroup_independent` is the
algebraic comparison once the stage filtrations agree; the geometric independence theorem for
the root-defined group is also a target here. *Needs:* RG2.2 *twisted-levi-subgroup*;
*moy-prasad-filtration*; *moy-prasad-lie-lattices*; RG2.1.2 (relative root groups).

**Checks.** Each check below has an `example` in `Suggested.lean`.

- `yuGroup_split_torus`, `yuLieLattice_split_torus` — the one-stage split torus `G_m` gives
  its ordinary Moy–Prasad subgroup and lattice at every depth.
- `yuGroup_constant`, `yuLieLattice_constant` — a constant depth sequence, with final
  stage `G`, gives `G_{y,r}` and `g_{y,r}` regardless of the intermediate stages.
- `yuGroup_zero`, `yuLieLattice_zero` — all depths zero give the parahoric and the
  depth-zero Lie lattice, including the toral part.
- `yuGroup_GL2_mixed`, `yuLieLattice_GL2_mixed` — diagonal torus inside `GL₂`, depths
  `(1,2)`, standard vertex: diagonal entries of `g−1` (respectively `X`) have valuation
  at least `1`, off-diagonal entries at least `2`. These distinguish the mixed carriers
  from either ordinary depth subgroup or lattice.

**The Moy–Prasad isomorphism.** (*moy-prasad-isomorphism*) (a) For `r > 0`, `G_{y,r}/G_{y,r+}` and
`g_{y,r}/g_{y,r+}` are isomorphic groups; in particular the quotient `G_{y,r}/G_{y,r+}` is abelian
(`groupLieGradedEquiv`; [Moy–Prasad 1996], §3.3, p. 104; [Moy–Prasad 1994], §3.2, p. 399, and §3.8,
pp. 400–401). (b) `G_{x,0}/G_{x,0+}` is the group of `κ`-points of the reductive quotient `𝒢̄_x` for
perfect `κ` (in particular finite or algebraically closed): `Parahoric.parahoricQuotientEquiv` together with the check
`filtrationPlus_zero_eq_proUnipotent` ([Moy–Prasad 1996], §3.1–3.2, pp. 102–103, for algebraically
closed `κ`, and §3.3, p. 104, for finite `κ`). *Needs:* *moy-prasad-lie-lattices*;
*reductive-quotient-of-special-fibre*; *moy-prasad-filtration*.

**Positive-depth subgroups are pro-p and cofinal.** (*positive-depth-filtration-basis*) Let `E` be a
nonarchimedean local field of residue characteristic `p`, `y ∈ B^e(G,E)` and `r > 0`. (a) `G_{y,r}`
is compact open in the point topology of `G(E)` (`isCompact_isOpen_filtration`, also for `r = 0`),
normal in `G_{y,0}` (`filtration_normal`), and pro-`p`: every normal subgroup of finite index has
`p`-power index (`isProP_filtration`; this is the group-theoretic form of Tau Ceti's
`TauCeti.IsProP`). Openness is [Moy–Prasad 1996], §3.2, p. 103; compactness follows from
`G_{y,r} ⊆ G_{y,0}`, a parahoric subgroup; the pro-`p` property follows from the Moy–Prasad
isomorphism, whose graded pieces are finite-dimensional `κ`-vector spaces, the discreteness of the
jumps and (b); in a pro-`p` group every finite quotient, open or not, is a `p`-group, because each
procyclic subgroup is `ℓ`-divisible for every prime `ℓ ≠ p`. (b) The `G_{y,r}`, `r > 0`, form a
neighbourhood basis of `1` (`hasBasis_nhds_one_filtration`; [He 2018], §4.2, p. 12, for the
barycentre of an alcove, where the `I_n := G_{x_C,n}` form a fundamental system of open compact
subgroups); hence every compact open subgroup contains some `G_{y,r}`, with finite index. (c) For an
alcove `C` with barycentre `x_C` and `n ≥ 1`, `I_n` is normal in the Iwahori subgroup
`I = G_{x_C,0}`, decreasing in `n`, and cofinal (the three theorems above). `G_{x,0+} = P_x^+` is
the check `filtrationPlus_zero_eq_proUnipotent`. *Needs:* *moy-prasad-filtration*;
*parahoric-subgroup*; *pro-unipotent-radical-and-nested-facets*; *moy-prasad-isomorphism*; RG2.0
*integral-points-compact-open*; RG2.0 *congruence-neighbourhood-basis*.

**Mock exponential.** (*mock-exponential*) Construct Adler's positive-depth generalized
exponential using tame splitting data. In a split torus, a character basis fixes the map by
`χ_i(e_T(H)) = 1 + dχ_i(H)`; on a root line use the root parametrization, and multiply the
toral and root factors in a chosen order. Its domain contains `g_{y,0+}` for `y` in that
apartment. Descend the quotient maps through a tame splitting extension, scaling depths by
its ramification index. This gives `g_{y,r}/g_{y,s} ≃ G_{y,r}/G_{y,s}` for
`0 < r ≤ s ≤ 2r`, independent of the character basis, root order and splitting choices;
construct a compatible noncanonical homeomorphism `g_{y,0+} → G_{y,0+}`. Locators:
[Adler], §1.5, Lemma 1.5.1 and the construction, pp. 11–13; independence of the torus is
Corollary 1.6.6, p. 16. For the general tame-group target retain `p ∤ |W(G)|` as in
*yu-mixed-depth-groups*.

Prove depth compatibility, additivity modulo depth `r+s` for inputs of positive depths
`r,s`, and the commutator estimate modulo `r+s+min(r,s)` ([Adler], Proposition 1.6.2,
pp. 13–14). Prove `Ad(e(Y))Z − Z − [Y,Z] ∈ g_{y,2r+t}` for
`Y ∈ g_{y,r}`, `r > 0`, and `Z ∈ g_{y,t}`, `t ∈ ℝ`
([Adler], Proposition 1.6.3, pp. 14–15), and parahoric equivariance of the quotient map
(Proposition 1.6.5, pp. 15–16). Independence and equivariance concern these quotients;
the choice of a homeomorphism is not asserted to be canonical.

The Lean representative is `MoyPrasad.mockExp` for `GL_n`: the entrywise equation
`mockExp_matrix` fixes it uniquely as `X ↦ 1 + X` on the actual counit-derivation lattice
at `r > 0`. `mockExp_exists` asserts invertibility and filtration membership;
`mockExp_bijective`, `mockExp_mem` and `mockExp_congr_iff` give its bijectivity and exact
depth congruences. `mockExp_graded` gives the quotient homomorphism in `0 < r ≤ s ≤ 2r`;
`mockExp_ad` fixes the bracket by its matrix commutator; `mockExp_ordering` is the adjacent
factor interchange estimate modulo depth `2r`. The general character-basis/root-coordinate
map, tame descent and its independence theorems are targets of this subsection. There is no
claim of a map on the depth-zero lattice. *Needs:* *moy-prasad-lie-lattices*;
*moy-prasad-filtration*; *moy-prasad-isomorphism*; RG2.2 *twisted-levi-subgroup*;
ReductiveGroups layer 2 (tangent Lie algebra and adjoint action).

**Checks.**

- `mockExp_zero` — zero maps to the identity in `GL_n`.
- `mockExp_abelian` — on `G_m`, the formula is the exponential-free identification
  `x ↦ 1+x`, also in positive characteristic; no analytic exponential is required.
- `mockExp_GL2_cross_term` — the `(0,0)` entry of `e(X)e(Y)−e(X+Y)` is
  `X₀₀Y₀₀ + X₀₁Y₁₀`; the quadratic term explains why additivity is a quotient statement.

**Generation of Moy–Prasad subgroups by a torus and the derived group.**
(*torus-generation-of-filtration*) Let `G′` satisfy [Fintzen], Assumption 2.1, p. 7 (split over a
tamely ramified extension, `p ∤ |W|`), `H′ ∈ {G′^der, G′}`, `T ⊂ G′` a maximal torus split over a
tame extension `E` with `x ∈ A(T,E)` as in [Fintzen], Cor. 7.2, and `r > 0`. Then
`G′_{x,r} = ⟨T(K)_r, H′(K) ∩ G′_{x,r}⟩` ([Fintzen], Lem. 7.1 and Cor. 7.2 with proof, arXiv v2 p.
26, stated there for the groups `G_j` of a twisted Levi sequence, with `H_j` as on p. 16; the proof
applies to `G′`). This general form is a statement of this section; its Lean target is the split
case `filtration_eq_sup_torus_derived`: over a nonarchimedean local field, when the centralizer of
the maximal split torus is a split torus and `y` lies in its apartment, `G_{y,r}` (`r > 0`) is
generated by `Z(K)_r` and its intersection with the points of the schematic derived group
`TauCeti.CommHopfAlgCat.derivedDefiningIdeal`. *Needs:* *moy-prasad-filtration*; *bruhat-tits-group-scheme*;
*torus-models-exact-sequences*.

**Lifting cocharacters of the reductive quotient.** (*lifting-residual-cocharacters*) Let
`x ∈ B(G,K)` and `λ̄ : G_m → 𝒢̄_x` a cocharacter over `κ`. There is a `K`-split torus `S ⊂ G` whose
integral model inside `𝒢°_x` is a split `O`-torus with special fibre mapping onto a maximal split
torus of `𝒢̄_x` containing the image of `λ̄`; `λ̄` lifts uniquely to `λ : G_m → S`; `x ∈ A(S)`; and,
the affine roots being affine functions, `α(x+ελ) − α(x) = ε⟨grad α, λ⟩`. Hence if `X ∈ g*_{x,r}`
and `lim_{t→0} λ̄(t)X̄ = 0` in `V*_{x,r} := g*_{x,r}/g*_{x,r+}` (Fintzen's `V*_{x,−r}`, the dual of
`g_{x,−r}/g_{x,(−r)+}`), then `X ∈ g*_{x+ελ,r+}` for `ε ≪ 1` ([Fintzen], proof of Cor. 3.8, arXiv v2
p. 11). Under [Fintzen], Assumption 2.1, every torus is tame ([Fintzen], p. 7, and Rem. 3.9, p. 11),
so some maximal torus containing `λ` is tamely split, as used on p. 14 and in the proof of Lem.
6.1.2, p. 24. This is a statement of this section without a Lean target. *Needs:*
*reductive-quotient-of-special-fibre*; *moy-prasad-filtration*; *moy-prasad-lie-lattices*; RG2.2
*facets-and-special-points*.

### RG2.3.7 Lang's theorem and lifting

**Lang's theorem.** (*lang-theorem*) Let `H` be a smooth connected group over `F_q` and `F` the
`q`-Frobenius. (a) The Lang map `g ↦ g^{−1}F(g)` is onto `H(F̄_q)` (`Lang.lang_surjective`, for
`H` smooth and geometrically connected of finite type; [Milne AG], Prop. 27.54, v2.00 p. 487, and
Cor. 27.55, p. 488). (b) `H^1(F_q, H) = 1` ([Milne AG], Cor. 27.56, p. 488). (c) If
`1 → H′ → H → H″ → 1` is exact with smooth terms and `H′` connected, then `H(F_q) ↠ H″(F_q)`: by
(b) for `H′` and the exact sequence `H(F_q) → H″(F_q) → H^1(F_q, H′)` ([Milne AG], §27.a, p. 472);
it is used in this form in [Lipnowski–Tsimerman], §5.4.2, arXiv v1 p. 29. Statements (b) and (c)
have no Lean targets. Connectedness is needed: [Milne AG], remark after Cor. 27.56, p. 488, notes
that the surjectivity fails for the constant group `ℤ/2`, whose Lang map is trivial (`F` acts
trivially), so that `H^1(F_q, ℤ/2) = ℤ/2`; the uses in [Kisin–Zhou], proofs of
Lem. 5.2.5 and Cor. 5.2.7, arXiv v2 pp. 52–53, are for smooth groups with connected special fibre.
*Needs:* ReductiveGroups layer 3; Mathlib `groupCohomology`.

**Checks.**

- `lang_not_connected` (non-example) — on the points `{z : z² = 1}` of `μ₂` over a finite field of
  odd order `q` the Lang map is `z ↦ z^{−1}z^q = 1`, so it misses `−1`; the Lean example (a
  computation on the points of `μ₂`) is proved.

**Lang's theorem for pro-algebraic groups.** (*lang-for-pro-algebraic-groups*) Let
`H = lim_i H_i` be a directed inverse limit over `F_q` of smooth geometrically connected
affine groups of finite type, with transition homomorphisms defined over `F_q`. This includes
pro-unipotent groups presented with smooth connected unipotent quotients. On compatible
geometric points the coordinatewise `q`-Frobenius has surjective Lang map
`g ↦ g⁻¹F(g)` (`Lang.lang_proAlgebraic_surjective`). In particular every compatible tuple
`a_i` admits compatible solutions `g_i⁻¹F(g_i)=a_i`; separate choices of solutions at each
stage do not suffice. A constant system is the classical finite-type theorem.

This is a direct inverse-limit consequence of [Milne AG], Proposition 27.54 and its proof,
p. 487, and Corollary 27.55, p. 488: each solution set is finite and nonempty, and the
transition maps carry solutions to solutions. Compactness of a product of finite discrete
sets, together with directedness, gives a compatible solution. Surjectivity of the transition
maps on these fibers is unnecessary. For a directly stated commutative pro-algebraic version,
see [Suzuki–Yoshida], Proposition 3.5(2), p. 176, the Lang exact sequence for a connected
affine pro-algebraic group over a finite field. The noncommutative statement above is the
specified deduction from finite-type Lang, rather than an attribution of that stronger
statement to the commutative source.

The Lean pin is the set of tuples obeying the displayed compatibility equations, with
transition maps actual finite-type coordinate Hopf-algebra morphisms. Frobenius is pinned
by `σ(z)=z^q`; smoothness and geometric connectedness are required at every stage.
The inverse-limit construction and its finite-fiber argument belong to this target.
*Needs:* *lang-theorem*; ReductiveGroups layer 0 (coordinate Hopf algebras and functor of
points); Mathlib compactness and inverse limits.

**Checks.**

- `proAlgebraic_classical_GL` — a constant `GL_n` system recovers classical Lang on
  `GL_n(F̄_q)`, whose Frobenius-fixed points are `GL_n(F_q)`, a finite group of Lie type.
  The Lang map is not claimed to be onto that finite group when restricted to its fixed points.
- `proAlgebraic_additive_product` — the inverse limit of finite-dimensional additive
  groups under truncation gives the simultaneous equations `b_n^q−b_n=a_n` for all `n`.
- `proAlgebraic_disconnected` — the constant inverse system `μ₂` over `𝔽₃` has constant compatible
  tuples of geometric points, and its Lang map misses every nonidentity tuple. Removing
  connectedness makes the claim false.

**Fixed cosets.** (*fixed-coset-lifting*) For a group `H`, `σ ∈ Aut(H)` and a subgroup `J ≤ H`, not
necessarily normal, such that every element of `J` is `z^{−1}σ(z)` for some `z ∈ J`, every coset
`hJ` with `h^{−1}σ(h) ∈ J` contains a `σ`-fixed element (`Lang.fixedCoset_lift`, proved). When `J`
is `σ`-stable, so that `σ` acts on `H/J`, this says that `H^σ/J^σ → (H/J)^σ` is surjective;
injectivity is formal ([He 2018], proof of Lem. 4.5, arXiv v3 p. 13). *Needs:* Mathlib `MulAut`.

**Connected finite-level presentation of an intersection.**
(*positive-depth-intersection-presentation*) Fix a local field `E`, `L=Ĕ`, its actual
arithmetic Frobenius `σ`, a `σ`-stable alcove `C`, `n≥1`, and `g∈G(E)`.
The precise supplier for `J=Ĭ_n∩gĬ_ng⁻¹` consists of a directed inverse system
`(J_i)` of smooth geometrically connected affine groups of finite type over `𝔽_q`,
transition homomorphisms over `𝔽_q`, and a group isomorphism
`J ≅ lim_i J_i(𝔽̄_q)` intertwining `σ` with coordinatewise `q`-power Frobenius.
The point identification must be proved using the positive-depth root filtrations
and completeness of `O_L`, including both injectivity and surjectivity; an abstract
pro-`p` structure does not give this presentation. This is the exact hypothesis of
the concrete lifting endpoint below. Finite-level construction and connectedness
are separate geometric inputs, not consequences attributed to the parahoric
intersection argument of [Haines–Rapoport], Remark 9, p. 5.
*Needs:* *moy-prasad-filtration*; *positive-depth-filtration-basis*;
*unramified-base-change-of-parahorics*; *smooth-model-reduction*.

**Frobenius-fixed coset lifting at positive level.** (*frobenius-fixed-coset-lifting*)
Under *positive-depth-intersection-presentation*, with `I_n=Ĭ_n^σ`, prove
`I_n/(I_n∩gI_ng⁻¹) ≅ (Ĭ_n/(Ĭ_n∩gĬ_ng⁻¹))^σ`.
First apply `Lang.lang_proAlgebraic_surjective` to the specified system and transport
through its Frobenius-equivariant point isomorphism to obtain Lang surjectivity on `J`.
Then apply `Lang.fixedCoset_lift`. The endpoint is conditional on that presentation;
no connectedness assertion for a positive-depth intersection is inferred from
pro-`p` alone. [He 2018], Lemma 4.5 and proof, arXiv v3 p. 13 (published Lemma 15,
pp. 16–17), gives the fixed-coset endpoint; the additional hypothesis here specifies
the geometric input to its Lang step.
*Needs:* *positive-depth-intersection-presentation*; *lang-for-pro-algebraic-groups*;
*fixed-coset-lifting*; *parahoric-subgroup*.

**Reduction of smooth models.** (*smooth-model-reduction*) Over a complete DVR `O`, including `O_E` and `O_Ĕ`, a smooth affine model has
surjective reduction on points (`Lang.completeDVR_reduction_surjective`). There is no
finite-residue-field hypothesis in this lifting theorem. Its specialization
`Lang.smoothModel_reduction_surjective` states `𝒢(O) ↠ 𝒢(κ)` and is proved from Mathlib
`Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `O` being `m`-adically complete (the
same lifting is used in [Kisin–Pappas], proof of Prop. 1.4.3, Step 3, arXiv v3 p. 23). *Needs:*
RG2.0 *smooth-model-congruence-quotients*.

### Examples

The checks of this layer run on `GL_n` at its standard vertex and at the barycentre of its standard
alcove (Moy–Prasad filtration `G_{x₀,r}=1 + ϖ^{⌈r⌉} M_n(O)` for `r>0` at the
standard vertex `x₀`; at the alcove barycentre the entrywise thresholds depend on the
root and the barycentre coordinates; Lie lattices, trace-dual lattices, the
Iwahori and pro-`p` Iwahori subgroups), on `GL_2` (the scalar `ϖ` outside every fixer, very special
vertices), on `G_m = GL_1` (unit filtration, jumps, depth, the squaring isogeny), on the ramified
quadratic norm-one torus (two quasi-parahoric levels, index two, `−1 ∉ 𝒯°(O)`) and on `μ₂` (Lang's
theorem needs connectedness). The two statements below collect the explicit level subgroups and the
torus case.

**Iwahori and congruence levels of classical groups.** (*classical-level-subgroups*) Write
`ḡ := g mod ϖ`. (a) In `GL_n(K)`, for a field `K` with a valuative relation (and `ModelField K` for
`principalCongruence`, which uses powers of the maximal ideal), `LevelSubgroups` defines
`integralGL` (`GL_n(O)`: integral entries and integral inverse), `iwahori`
(`I = {g ∈ GL_n(O) : ḡ upper triangular}`), `proPIwahori` (`I^+ = {g ∈ I : ḡ unipotent}`) and
`principalCongruence` (`1 + ϖ^m M_n(O)`, all of `GL_n(O)` for `m = 0`). Over a local field these are
Bruhat–Tits groups of the `GL_n` building: `LevelSubgroups.iwahori_isParahoric` states that, through
`TauCeti.GeneralLinear.pointsMulEquiv`, `GL_n(O)` is the parahoric subgroup at the standard vertex,
`I` the parahoric subgroup at the barycentre `v_i = −i/n` of the standard alcove and `I^+` its
pro-unipotent radical `G_{x_C,0+}`; `1 + ϖ^m M_n(O) = G_{x_0,m}` for `m ≥ 1` is the check
`MoyPrasad.filtration_GL_vertex` ([Bruhat–Tits 1984], 3.6 Théorème, p. 288, and 3.9, p. 289, for the
parahoric group schemes of lattice chains; [Kisin–Pappas], §1.1.9, arXiv v3 pp. 8–9; [Casselman],
§1.4, proof of Prop. 1.4.4, p. 14, for congruence subgroups and the Iwahori subgroup as the preimage
of a Borel subgroup modulo `ϖ`). The `(1,n−1)`-parahoric
`{g ∈ GL_n(O) : the last row of ḡ lies in (0,…,0,∗)}` is the stabilizer of the chain
`O^n ⊃ O^{n−1} ⊕ ϖO`, by the computation of `g(O^{n−1} ⊕ ϖO)`. (b) In `GSp_4(E)` with `ψ`
antidiagonal, the Iwahori subgroup `Iw` is the fixer of the self-dual chain of the standard alcove
and `Iw_1` its pro-`p` radical, contained in the pro-`p` Iwahori of `GL_4`; hence for `g ∈ Iw_1` the
characteristic polynomial is `≡ (X − 1)^4 mod ϖ` ([Kisin–Pappas], §1.1.11, arXiv v3 pp. 9–10, for
the parahoric subgroups of `GSp` as stabilizers of self-dual chains; the inclusion and the
congruence of the characteristic polynomial are the computation of the check
`proPIwahori_charpoly`). *Needs:* *parahoric-subgroup*; *lattice-chain-stabilizer-schemes*;
*positive-depth-filtration-basis*; RG2.0 *integral-points-compact-open*; Tau Ceti
`TauCeti.GeneralLinear.pointsMulEquiv`; Mathlib `Matrix.isUnit_iff_isUnit_det`.

**Checks.**

- `integralGL_eq_range` — `GL_n(O)` is the image of Mathlib's `Matrix.GeneralLinearGroup.map` along
  `O → K`.
- `not_mem_integralGL` (non-example) — `diag(ϖ, 1)` has integral entries but is not in `GL_2(O)`.
- `principalCongruence_zero` (degenerate case) — level `0` is `GL_n(O)`.
- `principalCongruence_diag` — `diag(1 + ϖ, 1)` lies in level `1` but not in level `2`.
- `iwahori_relIndex_two` — `[GL_2(O) : I] = q + 1`, reduction identifying `GL_2(O)/I` with
  `GL_2(κ)/B(κ) = ℙ^1(κ)`.
- `iwahori_one` (degenerate case) — for `n = 1`, `I = GL_1(O)`.
- `not_mem_iwahori` (non-example) — the lower unipotent matrix with entry `1` lies in `GL_2(O)` but
  not in `I`.
- `proPIwahori_normal` — `I^+` is normal in `I`.
- `proPIwahori_eq_iwahori_of_card_two` (degenerate case) — for residue field `𝔽_2`, `I^+ = I`.
- `proPIwahori_charpoly` — elements of the pro-`p` Iwahori of `GL_4` have characteristic polynomial
  `≡ (X − 1)^4 mod m`.

**Parahorics of nonsplit tori.** (*torus-parahoric-example*) Let `E′/E` be separable quadratic and
`T = R^1_{E′/E}G_m`, so that `T(E)` is compact and `B(T,E)` is a point. (a) If `E′/E` is unramified,
`X_*(T)_I = ℤ` (inertia acts trivially) is torsion-free; `𝒯^ft = 𝒯°` and `T(E)_0 = T(E)`. (b) If
`E′/E` is ramified, `X_*(T)_I = ℤ/2` (inertia acts by `−1`) and `T(E)_0 = ker κ_T` has index `2` in
`T(E) = 𝒯^ft(O)`: writing `u = x/σ(x)` with `x ∈ E′^×` (Hilbert 90, `σ` the nontrivial automorphism
of `E′/E`), functoriality of `κ` along `R_{E′/E}G_m → T`, `x ↦ x/σ(x)`, gives
`κ_T(u) = v_{E′}(x) mod 2`, so `T(E)_0 = {x/σ(x) : x ∈ O_{E′}^×}` and `a/σ(a)`, for a uniformizer
`a` of `E′`, lies in the nontrivial coset; if `a² ∈ E`, then `a/σ(a) = −1`. If moreover `p` is odd,
the coset of `u` is detected by its residue `ū = ±1` (`ū² = N(u) = 1`): since `x/σ(x) ≡ 1` modulo
the maximal ideal of `E′` for a unit `x`, `T(E)_0` consists of the `u ≡ 1`, and `−1` is in the other
coset. For `p = 2` every `ū` is `1` and this test fails.
`LevelSubgroups.normOneTorus_parahoric_index` states (b) for the norm-one torus
`NormTorus.quadraticData` over a nonarchimedean local field of odd residue characteristic, ramified
because `E′` contains a square root of a uniformizer: its parahoric subgroup consists of the
norm-one units `u` with `ω(N_{E′/E}(u − 1)) ≥ 1` (that is, `u ≡ 1` modulo the maximal ideal of `E′`)
and has index two. Over a strictly henselian base, `𝒯^ft(O)/𝒯°(O)` is the torsion subgroup of
`X_*(T)_I`, so the fixer differs from the parahoric exactly when `X_*(T)_I` has torsion
([Haines–Rapoport], proof of Prop. 3 a), p. 2, for the parahoric of a torus as the kernel of `κ_T`,
and Rem. 10–11, pp. 6–7, for the torsion of `X_*(T)_I`; [Kisin–Zhou], §2.4.1, arXiv v2 pp. 12–13,
for the Néron models; the index and congruence computation for the norm-one torus is the one above).
*Needs:* *neron-finite-type-and-connected-models*; RG2.1 *nonsplit-torus-example*; RG2.1
*kottwitz-homomorphism-torus*; RG2.0a *norm-torus*.

**Checks.**

- `normOneTorus_minus_one` — `−1` is a norm-one unit with `N(−1 − 1) = 4` a unit in odd residue
  characteristic, so `−1 ∉ 𝒯°(O)`.
- `normOneTorus_residue_char_two` (non-example) — in residue characteristic `2`,
  `N(−1 − 1) = 4 ∈ m`: the congruence test no longer separates `−1` from `1`, so the odd-residue
  hypothesis cannot be dropped.

### Dependencies

Layers RG2.0, RG2.0a, RG2.1 and RG2.2 of this roadmap; ReductiveGroups layers 2, 3, 5, 6 and 7;
LocalFieldsRamification layer 3; Mathlib `AlgebraicGeometry.Scheme`,
`Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `QuotientGroup.comapMk'OrderIso`,
`Matrix.GeneralLinearGroup.map`, `groupCohomology` and `Submodule.IsLattice`; Tau Ceti
`TauCeti.unitFiltration`, `TauCeti.IsProP`, `TauCeti.HopfIdeal`,
`TauCeti.GeneralLinear.pointsMulEquiv`, `TauCeti.GeneralLinear.genericMatrix`,
`Derivation.adRepresentation` and `Derivation.coe_bracket`.

## Layer RG2.4: decompositions and double cosets

With the parahoric subgroups of RG2.3 in hand, this layer defines the Iwahori–Weyl group
`W̃ = N(K)/Z(K)_0` with its exact sequences, its length function and its Bruhat order, and proves the
Iwahori–Bruhat decomposition together with the affine Tits system of the subgroup generated by the
parahorics (the abstract BN-pair theory is Tau Ceti's `TitsSystem`), the Kottwitz quotient
`G(K) → Ω` and the surjectivity of the Kottwitz map on rational points, the parahoric double-coset
formula, the multiplication and the cardinalities of Iwahori double cosets, and the finiteness of a
compact double coset with its index formula (the Cartan double-coset set itself is infinite). It then
treats dominant inertia-coinvariant cocharacters, the length formula for translations, the dominant
normal form and the `μ`-admissible sets, the Cartan and Iwasawa decompositions at a special point
in their exact generality, unimodularity, the parabolic modulus and the Iwasawa integration
formula, the Iwahori factorization, and the comparison with an unramified group. The layer closes
with the examples (`GL_n`, rank one, nonsplit unitary groups) that show why the index formula of a
split simply connected group cannot be used universally. The Hecke algebras, the Satake isomorphism
and the smooth representations built on these decompositions belong to the representation-theoretic
roadmaps that cite this one.

`K` is as in the Conventions: henselian for a nontrivial discrete valuation with perfect residue
field, the setting of `ModelField` in the Lean file. The statements labelled "over `L`" or
"over `E`" are for those two instances; the statements involving the Kottwitz map follow
[Richarz], who assumes `K` complete with residue field of cohomological dimension at most one, which
covers both `E` and `L`.

### RG2.4.1 the Iwahori–Weyl group

**The Iwahori–Weyl group.** (*iwahori-weyl-group*) Let `K` be as above, `S` a maximal `K`-split
torus, `Z = Z_G(S)` and `N = N_G(S)`. The group `Z(K)` has a unique parahoric subgroup `Z(K)_0` (the
`O`-points of the connected Néron model when `Z` is a torus); it is normal in `N(K)`, and every
parahoric subgroup `P_Ω` of a nonempty finite subset `Ω` of the apartment `A` of `S` meets `Z(K)` in
exactly `Z(K)_0` ([Bruhat–Tits II], 5.2.4, allows every nonempty bounded `Ω`). The Iwahori–Weyl group is `W̃ = N(K)/Z(K)_0`. Since `ker ν` is the maximal bounded
subgroup of `Z(K)` and contains `Z(K)_0`, the group `W̃` acts on `A` by affine maps; the affine Weyl
group `W_a` is a subgroup of `W̃`, and the stabilizer `Ω` of a base alcove `C` is a complement to
`W_a`. Over `L`, `Z(L)_0 = ker κ_Z`; over `E`, `W̃_E ≅ (W̃_L)^σ`, with `σ` acting through `N(L)` (a
statement of this document only: the Lean file has no Frobenius action on `W̃_L`). In the enlarged
apartment an alcove is the product of an alcove of the reduced apartment with `V_Z`, so when
`V_Z ≠ 0` (for instance for `GL_n` or a split torus) it has no vertices; a base alcove is therefore
an alcove together with one of its points, and the Iwahori subgroup `I = 𝒢°_C(O)` is the parahoric
subgroup of any point of the open alcove. A special point is one through which every root
direction has a wall (RG2.1's `Facet.IsSpecial`). In `BruhatTits`, define `BaseAlcove` as an alcove
`C` of RG2.1 (`Facet.IsAlcove`) with a point of `C`, `BaseAlcove.closure` as `C̄`,
`BaseAlcove.iwahori` as `I` and `BaseAlcove.cell` as `IṅI`; prove `exists_baseAlcove`,
`BaseAlcove.exists_special_mem_closure` (every closed alcove contains a special point),
`BaseAlcove.iwahori_eq` (`I` does not depend on the chosen point) and
`parahoricSubgroup_inf_centralizer` (`P_Ω ∩ Z(K) = Z(K)_0`, which pins `minimalLeviParahoric`). In
`BruhatTits.IwahoriWeylGroup`, define `mk` as the quotient map `N(K) →* W̃`, `apartmentAction` as the
action `W̃ →* Aff(A)` induced by `ν`, `affineWeyl` as `W_a ⊂ W̃`, the image of `N(K) ∩ G(K)_1`,
`lengthZero` as the stabilizer `Ω ⊂ W̃` of `C`, `pointStabilizer` as the stabilizer `Stab_W̃(x)` of a
point `x` of `A`, `translations` as `Z(K)/Z(K)_0`, `RelativeWeylGroup` as `W_0 = N(K)/Z(K)` and
`toRelativeWeyl` as the projection `W̃ → W_0` induced by the identity of `N(K)`; prove `mk_surjective`,
`mk_eq_one_iff` (`n ∈ N(K)` maps to `1` in `W̃` iff `n ∈ Z(K)_0`), `apartmentAction_mk` (`mk n` acts on
`A` as `ν(n)`), `toRelativeWeyl_mk`, `map_affineWeyl` (`W_a` acts faithfully on `A`, as RG2.1's
`AffineWeylGroup`) and `affineWeyl_isComplement'_lengthZero` (`W̃ = W_a ⋊ Ω`)
([Haines–Rapoport], Lem. 5, p. 3, Def. 7 and (3), p. 4, Rem. 9, p. 5 (the `σ`-fixed points), and
Lem. 14, p. 9, and p. 10 (`W_a` as the affine Weyl group); [Richarz], Def. 1.1, (1.1) and (1.2),
p. 118 (arXiv p. 1), and Lem. 1.6, p. 120 (arXiv p. 3); [Bruhat–Tits II], 5.2.4 and 5.2.6, p. 164,
and Prop. 5.2.12, p. 166; [Bruhat–Tits I], (1.3.7), p. 22 (special
points); [He 2018], §1.1, p. 5). *Needs:* RG2.1 *apartment-action-kernel*; RG2.3
*neron-finite-type-and-connected-models*; RG2.1 *affine-weyl-group*; RG2.1
*affine-chamber-structure*; RG2.3 *parahoric-subgroup*; Mathlib `QuotientGroup.mk'`,
`QuotientGroup.lift`, `QuotientGroup.map`.

**Checks.**

- `splitTorus` — for a split torus `T` of rank `r`, `W̃ = Z(K)/Z(K)_0 ≅ X_*(T) ≅ ℤ^r`, acting on `A` by
  translations.
- `sl2_eq_affineWeyl` — for `SL_2`, `Ω` is trivial and `W̃ = W_a` is infinite dihedral.
- `not_quotient_by_boundedPart` (non-example) — for the ramified norm-one torus of a quadratic
  extension `K(√ϖ)/K`, over any model field with `char K ≠ 2`, in every residue characteristic, `Z(K)_0` has index two in
  `Z(K) = ker ν`, so `W̃` has two elements while `N(K)/ker ν` is trivial; the quotient by the bounded
  part loses the Iwahori–Bruhat decomposition.
- `apartmentAction_torus_compat` — elements of `Z(K)` act on `A` by translations.
- `unipotentRadical_zero` — `U_0(K) = 1`, no root being positive on `0`.
- `parahoricGenerated_anisotropic` — with no relative roots every parahoric is `Z(K)_0`, so
  `G(K)_1 = Z(K)_0`.
- `isRegularVector_zero` (non-example) — `0` is not regular as soon as there is a root.
- `isRegularVector_gl2` — for `GL_2`, `(1, 0)` is regular and `(1, 1)` is not.
- `unipotentRadical_gl2` — for `GL_2` and `v = (1, 0)`, `U_v(K)` is the upper unipotent root group.
- `parahoricGenerated_gl2` (non-example) — for `GL_2`, `G(K)_1 = {g : ω(det g) = 0} ≠ GL_2(K)`.
- `relativeWeylGroup_gl2` — for `GL_2`, `W_0 = N(K)/Z(K)` has two elements.
- `relativeWeylGroup_gl3` — for `GL_3`, `W_0 = S_3` has six elements.
- `relativeWeylGroup_anisotropic` — with no relative roots `N(K) = Z(K)` and `W_0` is trivial.
- `relativeWeylGroup_weylGroup` — `W_0` is isomorphic to the Weyl group of the relative root system.
- `minimalLeviParahoric_gl2` — for `GL_2`, `Z(K)_0 = T(O)`: `diag(t_1, t_2) ∈ Z(K)_0` iff both `t_i`
  are units, so `diag(ϖ, 1) ∉ Z(K)_0`.
- `minimalLeviParahoric_le_boundedPart` — `Z(K)_0 ⊆ ker ν`; by `not_quotient_by_boundedPart` the
  inclusion can be strict.
- `cell_one` — `I·1·I = I`.
- `mem_cell_self` — `n ∈ IṅI`.
- `cell_gl2_hyperspecial` — for `GL_2` with base alcove `0 < x_1 − x_2 < 1`, the parahoric subgroup
  `GL_2(O)` of the special vertex `0` is `I ∪ IsI`, `s` the permutation matrix.
- `parahoricGenerated_sl2` — for the simply connected `SL_2`, `G(K)_1 = G(K)` ([Bruhat–Tits II],
  5.2.11, p. 166).
- `apartmentAction_gl2_swap` — for `GL_2`, the permutation matrix acts on `A` by swapping the two
  coordinates of the displacement.
- `pointStabilizer_anisotropic` — when `V = 0` the apartment is a point and its stabilizer is all of
  `W̃`; for the ramified norm-one torus this group has two elements while `W_x` is trivial
  (`parahoricWeyl_anisotropic`).
- `pointStabilizer_gl2` — for `GL_2`, the permutation matrix fixes the vertex `0` and
  `diag(ϖ^{-1}, 1)` does not.
- `toRelativeWeyl_mk_eq_one_iff` — `n ∈ N(K)` maps to `1 ∈ W_0` iff `n ∈ Z(K)`.
- `toRelativeWeyl_gl2` — for `GL_2`, `diag(ϖ^{-1}, 1)` maps to `1 ∈ S_2` and the permutation matrix
  does not.
- `toRelativeWeyl_not_injective_gl2` (non-example) — `W̃ → W_0` is not injective for `GL_2`.

**Structure of the Iwahori–Weyl group.** (*iwahori-weyl-exact-sequences*) Four statements. First,
the sequence `1 → Z(K)/Z(K)_0 → W̃ → W_0 → 1` is exact and `Z(K)/Z(K)_0` is commutative; over `L`
(where `T = Z`), the Kottwitz map gives `κ_T : Z(L)/Z(L)_0 ≅ X_*(T)_I`, and over `E` the corresponding
group is `Λ_Z := Z(E)/Z(E)_0 ≅ π₁(Z)_I^σ ≅ X^*(Z(Ẑ))_I^σ`, where `Ẑ` is the
dual of the minimal Levi. The target `minimalLevi_kottwitz_quotient` identifies this
quotient by the Kottwitz map of `Z`, including torsion ([Haines–Rostami], Proposition
1.0.2, p. 3). Only if `Z` is a torus does it specialize to `(X_*(Z)_I)^σ`. Second, `W̃ = W_a ⋊ Ω` with `Ω ≅ W̃/W_a`; over `L`, `κ_G : W̃/W_a ≅ π₁(G)_I`, and
over `E` the quotient is `(π₁(G)_I)^σ`. Third, a special point `x` splits the sequence,
`W_0 ≅ (W_a ∩ Stab_W̃(x)) ⊂ W̃`, so that `W̃ ≅ X_*(T)_I ⋊ W_0` over `L`; this splitting is
`σ`-equivariant only for `σ`-fixed `x`. Over `E` the splitting is
`W̃_E ≅ Λ_Z ⋊ W_0(E)`, and rational Cartan classes are `W_0(E)\Λ_Z`;
Iwasawa parameters likewise use `Λ_Z`. Fourth, `ker(W̃ → Aff(A)) = Z(K)_b/Z(K)_0` is finite and
consists of translations; over `L` it is `(X_*(T)_I)_tors`, so the action on `A` is faithful iff
`X_*(T)_I` is torsion-free. The full stabilizer of `x` can contain torsion translations, which is
why `specialVertex_fixer_bijective` uses its intersection with `W_a`. The translations act via `ν`,
with image a lattice in `V`. In `BruhatTits.IwahoriWeylGroup`, prove `toRelativeWeyl_surjective`,
`ker_toRelativeWeyl`, `translations_commute`, `finite_ker_apartmentAction`,
`ker_apartmentAction_le_translations`, `lengthZero_quotient_bijective` and
`specialVertex_fixer_bijective` ([Haines–Rapoport], (3), p. 4, Rem. 10, p. 6 (for the fourth
statement), Prop. 13, p. 8, and Lem. 14, p. 9; [Richarz], Lem. 1.3, (1.5) and (1.6), p. 119 (arXiv
p. 2), and Lem. 1.6, p. 120 (arXiv p. 3); [Kisin–Zhou], §2.1.2, (2.1.2.1), p. 6). *Needs:*
*iwahori-weyl-group*; RG2.1 *kottwitz-homomorphism*; RG2.1 *algebraic-fundamental-group*; RG2.1
*affine-weyl-group*; Mathlib `Subgroup.IsComplement'`.

**Checks.**

- `minimalLevi_quaternion_quotient` — for a quaternion division algebra `D/E`,
  `G=PGL₁(D)` has `S=1`, `Z=G`, and a point building. The normalized division
  valuation identifies `D×/(E× O_D×)` with `ℤ/2`, since `v_D(E×)=2ℤ`.
  This is the nonzero rational translation quotient `π₁(Z)=ℤ/2`.
- `minimalLevi_quaternion_displacement` — both elements of this quotient act trivially
  on the point building. Real displacement loses its nonidentity element.
- `minimalLevi_quaternion_torus_fixed` — the unramified maximal torus has cocharacters
  `ℤ` with Frobenius `n ↦ −n`; its fixed subgroup is zero, unlike `Λ_Z=ℤ/2`.
- `cartan_unramified_normOne` — the unramified quadratic norm-one torus has zero rational
  quotient; the ramified odd-residue-characteristic norm-one torus retains the index-two
  quotient of `ramified_compact_parahoric_index_odd`.

**Length and Bruhat order on the Iwahori–Weyl group.** (*length-and-bruhat-order*) Let `(W_a, S̃)` be
the Coxeter system of the base alcove `C`. The length of `wτ` with `w ∈ W_a` and `τ ∈ Ω` is
`ℓ(wτ) = ℓ_{W_a}(w)`, the number of walls separating `C` and `wτ(C)`, and `S̃` is the set of elements
of `W_a` of length one. The Bruhat relation is `wτ ≤ w'τ'` iff `τ = τ'` and `w ≤ w'` in `(W_a, S̃)`;
it is a partial order, namely that of `W_a` on each coset `W_aτ`. The elements of length zero are
exactly `Ω`; each `τ ∈ Ω` permutes `S̃` by conjugation, and `ℓ(τwτ^{-1}) = ℓ(w)`. On `W_a` this is the
Bruhat order `CoxeterSystem.BruhatLE` of Tau Ceti (`TauCeti/GroupTheory/Coxeter/Bruhat.lean`); the
Lean relation `bruhatLE` extends it to `W̃ = W_a ⋊ Ω`, which is not a Coxeter group. Over `E`, with
`C` `σ`-stable, the length `ℓ̆` of `W̃_L` restricted to `W̃_E = (W̃_L)^σ` differs in general from `ℓ`:
a simple reflection of `W̃_E` is the longest element of a finite `σ`-orbit parabolic subgroup of
`W̃_L`; the two Bruhat orders are compatible. In `BruhatTits.IwahoriWeylGroup`, define `length` as
the length `ℓ : W̃ → ℕ` of a base alcove, `simpleReflections` as `S̃ ⊂ W_a`, `bruhatLE` as the
reflexive–transitive closure of the length-increasing multiplications `w ↦ (x s x^{-1}) w`
(`s ∈ S̃`, `x ∈ W̃`) and `bruhatPartialOrder` as the resulting partial order; prove `length_eq_ncard`
(`ℓ(w)` is the number of walls separating the base point of `C` from its image under `w`),
`mem_simpleReflections_iff` (`S̃` is the set of length-one elements of `W_a`), `length_mul_lengthZero`
(`ℓ(wτ) = ℓ(w) = ℓ(τw)` for `τ ∈ Ω`), `length_eq_zero_iff` (`ℓ(w) = 0` iff `w ∈ Ω`),
`length_eq_coxeterLength` (on `W_a`, `ℓ` is the Coxeter length of `(W_a, S̃)`), `length_inv`,
`simpleReflections_subset_affineWeyl`, `bruhatLE_iff` (`wτ ≤ w'τ'` iff `τ = τ'` and `w ≤ w'` in
`W_a`) and `length_mono_of_bruhatLE` (`w < w'` implies `ℓ(w) < ℓ(w')`)
([He 2018], §1.1, p. 5; [He 2021], §2.1, pp. 4–5; [Richarz], §1.3, p. 121 (arXiv p. 4; `S̃` as the
length-one elements), Prop. 1.11, p. 122, and Sublemma 1.12, p. 123 (arXiv pp. 4–5), and Lem. 1.6,
p. 120 (arXiv p. 3)). The description of the simple reflections of `W̃_E` as longest elements of
finite `σ`-orbit parabolic subgroups of `W̃_L` is [Geck–Iancu], Theorem 1, p. 1: for a Coxeter system
with finite simple set and a group preserving that set, the fixed group is a Coxeter group generated
by the longest elements of the finite orbit parabolics, and the ambient length restricts to a weight
function (Corollary 6, p. 3); it is a statement of this document only. *Needs:*
*iwahori-weyl-exact-sequences*; RootSystems layer 3; Mathlib `CoxeterSystem`, `CoxeterSystem.length`.

**Checks.**

- `length_simple` — each `s ∈ S̃` has length `1`, and `ℓ(sw) = ℓ(w) ± 1` for every `w`.
- `length_translation_gl2` — for `GL_2` with base alcove `0 < x_1 − x_2 < 1`, the translations by
  `(1, 0)` and `(1, −1)` (the classes of `diag(ϖ^{-1}, 1)` and `diag(ϖ^{-1}, ϖ)`) have lengths `1` and
  `2`.
- `length_orientation_gl2` — in the same apartment, with `t` the translation by `(1, −1)` and `s` the
  reflection in the wall `x_1 = x_2` through the special vertex `0`: `ℓ(t) = 2`,
  `ℓ(st) = 3 = ℓ(s) + ℓ(t)`, while `ℓ(ts) = 1`. This pins the orientation used by
  `length_mul_translation_of_isDominant`.
- `simpleReflections_gl2` — for `GL_2`, `S̃` has two elements (type `Ã_1`).
- `bruhatLE_lengthZero_compat` — right multiplication by a fixed `τ ∈ Ω` preserves and reflects the
  Bruhat relation on `W_a`.
- `not_bruhatLE_of_lengthZero_ne` (non-example) — `1 ≰ τ` for `τ ∈ Ω`, `τ ≠ 1`, although
  `ℓ(1) = ℓ(τ) = 0` (for `PGL_2`, `τ` the element of order two of `Ω`); both the length order and the
  Coxeter order on `S̃ ∪ {τ}` fail.
- `simpleReflections_anisotropic` — with no relative roots there are no walls and `S̃ = ∅`.
- `simpleReflections_gl2_mem` — for `GL_2` and the base alcove `0 < x_1 − x_2 < 1`, the reflection in
  the wall `x_1 = x_2` lies in `S̃` and the translation `diag(ϖ^{-1}, ϖ)` (length `2`) does not.
- `bruhatPartialOrder_lt_simple` — `1 < s` for every `s ∈ S̃`.
- `bruhatPartialOrder_lengthZero_minimal` — nothing lies strictly below an element of `Ω`.
- `bruhatPartialOrder_gl2_incomparable` (non-example) — the order is not total: for `GL_2` the
  translations by `(1, 0)` and `(0, 1)`, both of length `1`, are incomparable.

### RG2.4.2 Iwahori–Bruhat decomposition, the affine Tits system and double cosets

**The affine Tits system of the parahoric subgroup.** (*affine-tits-system*) Let `G(K)_1` be the
subgroup generated by the parahorics, `N(K)_1 = N(K) ∩ G(K)_1`, `I` the Iwahori of `C`, and
`S̃ ⊂ N(K)_1/(N(K)_1 ∩ I)` its wall reflections. First, `(G(K)_1, I, N(K)_1, S̃)` is a Tits system
with Weyl group `W_a = N(K)_1/(N(K)_1 ∩ I)` and Coxeter generators `S̃`; in particular `G(K)_1` is
generated by `I` and `N(K)_1`. Second, over `L`, `G(L)_1 = ker κ_G` is normal in `G(L)` and
`G(L)/G(L)_1 ≅ Ω ≅ π₁(G)_I`; in general `G(K) = ⟨G(K)_1, lifts of Ω⟩`, each lift normalizing `I` and
permuting `S̃` (a double Tits system). Third, the Bruhat covering of `G(K)_1` therefore extends, coset
by coset, to `G(K) = ⋃_{w ∈ W̃} IẇI`. In `BruhatTits`, define `parahoricGenerated` as `G(K)_1`; in
`BruhatTits.Decomposition`, prove `affineTitsSystem_closure` (`⟨I, N(K)_1⟩ = G(K)_1`),
`lengthZero_normalizes_iwahori` and `parahoricGenerated_sup_lengthZero`; the Tits-system axioms
themselves are a statement of this document ([Bruhat–Tits I], §6.5, Théorème, p. 154; [Bruhat–Tits II],
5.2.11 and Prop. 5.2.12, p. 166; [He 2018], §1.1, p. 5; [Richarz], §1.1, (1.2), Lem. 1.2, p. 118,
and Lem. 1.3, p. 119 (arXiv pp. 1–2); [Haines–Rapoport], Lem. 17, p. 9). *Needs:* RG2.3
*parahoric-kottwitz-characterization*; RG2.1 *affine-weyl-group*; Tau Ceti `TauCeti.TitsSystem`,
`TauCeti.TitsSystem.bruhatCells_eq_univ`; RG2.3 *parahoric-subgroup*.

**The Iwahori–Bruhat decomposition.** (*iwahori-bruhat-decomposition*) Let `C` be an alcove
(`σ`-stable over `E`), `I = 𝒢°_C(O)`, and `ẇ ∈ N(K)` a lift of `w ∈ W̃`. The assignment `w ↦ IẇI` is
well defined because `I ⊇ Z(K)_0`, and it is a bijection `W̃ → I\G(K)/I`, so that
`G(K) = ⊔_w IẇI`. Over `E` the double cosets `IẇI` are compact open and countably many. In
`BruhatTits.Decomposition`, define `iwahoriBruhat` as the bijection and prove `iwahoriBruhat_mk`
(`mk n ↦ InI`) and `cell_eq_of_mk_eq` ([Haines–Rapoport], Prop. 8, p. 4; [Richarz], Thm 1.4, p. 119,
and (1.7), p. 120 (arXiv p. 2); [He 2018], §0.6, p. 3, and §2.5, p. 9). *Needs:* *affine-tits-system*;
*iwahori-weyl-exact-sequences*; RG2.3 *parahoric-subgroup*; Mathlib `DoubleCoset.Quotient`,
`DoubleCoset.mk`.

**Checks.**

- `iwahoriBruhat_one_iff` — the double coset attached to `1 ∈ W̃` is `I` itself.
- `iwahoriBruhat_infinite_gl2` — for `GL_2`, `I\G(K)/I` is infinite.
- `iwahoriBruhat_gl2_hyperspecial` — for `GL_2` with base alcove `0 < x_1 − x_2 < 1`, every element of
  `GL_2(O)` lies in the double coset of `1` or of the permutation matrix.

**The Kottwitz quotient G(K) → Ω.** (*kottwitz-quotient*) Let `G(K)_1` be the subgroup generated by
the parahorics. First, `G(K)_1` is normal in `G(K)` and `N(K)/N(K)_1 ≅ G(K)/G(K)_1`, so
`W̃/W_a ≅ Ω` yields a surjection `κ : G(K) → Ω` with `ker κ = G(K)_1`. Second,
`κ(IẇI) = {pr_Ω(w)}`, where `pr_Ω : W_a ⋊ Ω → Ω` is the projection. Third, over `L` and under
`Ω ≅ π₁(G)_I`, `κ = κ_G`; over `E`, `κ_G` lands in `(π₁(G)_I)^σ`. Fourth, for `θ ∈ Aut G(K)`
preserving `I` and `N(K)` (for instance `σ`), `κ(θg) = θκ(g)` and
`κ(hgθ(h)^{-1}) = κ(g) + κ(h) − θκ(h)`, so that only the class `κ(g) ∈ Ω_θ = Ω/(1 − θ)Ω` is invariant
under `θ`-conjugation. In `BruhatTits.Decomposition`, define `kottwitzToLengthZero` as `κ` and prove
`kottwitzToLengthZero_surjective`, `ker_kottwitzToLengthZero` and `kottwitzToLengthZero_mk`
(`κ(n) = τ` when `mk n = wτ`) ([He 2018], §1.1, p. 5, §1.3, p. 6, and §2.1, p. 7; [Richarz], Lem. 1.2,
p. 118, Lem. 1.3, (1.5) and (1.6), p. 119 (arXiv p. 2); [Haines–Rapoport], Lem. 14, p. 9).
*Needs:* *iwahori-bruhat-decomposition*; RG2.1 *kottwitz-homomorphism*; *affine-tits-system*; Mathlib
`QuotientGroup.mk'`.

**Checks.**

- `kottwitz_gl2` — for `GL_2`, `κ` is nontrivial on the class of `diag(ϖ^{-1}, 1)` (it generates
  `Ω ≅ ℤ`) and trivial on the Iwahori subgroup.
- `kottwitzToLengthZero_sl2` — for the simply connected `SL_2`, `κ` is trivial.
- `kottwitzToLengthZero_gl2_det` — for `GL_2`, `κ(g) = κ(g')` iff `|det g| = |det g'|`.

**Surjectivity of the Kottwitz map on rational points.** (*kottwitz-rational-surjectivity*) First,
`κ_G : G(E) → (π₁(G)_I)^σ` is surjective. Second, for `𝒢` a parahoric over `O_E` and
`ρ : G_sc → G_der`, the subgroup `H = ρ(G_sc(E))𝒢(O_E)` is normal in `G(E)` and `κ_G` induces
`G(E)/H ≅ (π₁(G)_I)^σ`, because `ker κ_G ∩ G(E) = H`. Third, for `G` reductive over `ℤ_p`, `T` the
centralizer of a maximal split torus and `Γ = Gal(ℚ̄_p/ℚ_p)`, both `X_*(T)^Γ → π₁(G)^Γ` and
`κ̃_G : G(ℚ_p) → π₁(G)^Γ` are surjective, and `G(ℚ_p)/(ρ(G_sc(ℚ_p))G(ℤ_p)) ≅ π₁(G)^Γ`. Fourth, if
`κ̃_{G_ad}(g_ad)` lifts to `π₁(G)^Γ`, then `g_ad G_ad(ℤ_p)` lies in the image of `G(ℚ_p)/G(ℤ_p)`
([van Hoften], Lem. 3.4.2, p. 40, and its proof, p. 41 (for `G` split over a tamely ramified
extension; the general form of the second statement is derived here from [Richarz], Lem. 1.3, p. 119,
and Rem. 1.5, p. 120 (arXiv pp. 2–3), with [Haines–Rapoport], Lem. 17, p. 9); [Kisin], Lem. (1.2.3)
and Lem. (1.2.4), p. 13 of the linked preprint). *Needs:* *kottwitz-quotient*;
*iwahori-weyl-exact-sequences*; RG2.3 *frobenius-fixed-coset-lifting*; RG2.1
*kottwitz-homomorphism*.

**Double cosets of parahoric subgroups.** (*parahoric-double-cosets*) Let `F, F' ⊂ C̄` be facets,
`P = 𝒢°_F(O)` and `Q = 𝒢°_{F'}(O)` the corresponding parahorics containing `I`, and
`W_F = (P ∩ N(K))/Z(K)_0`, `W_{F'}` the standard parabolic subgroups of `(W_a, S̃)` generated by the
reflections in the walls through `F` and `F'`. The double coset `PẇQ` depends only on `W_F w W_{F'}`,
and `W_F\W̃/W_{F'} ≅ P\G(K)/Q`. Each double coset `W_F w W_{F'}` has a unique element of minimal
length; these elements form `^F W̃^{F'}`, and `G(K) = ⊔_{w ∈ ^F W̃^{F'}} PẇQ`. The Lean statements take
nonempty finite subsets `Ω, Ω'` of `C̄` (the parahoric of such a set is that of a facet of `C̄`). In
`BruhatTits.Decomposition`, define `parahoricWeyl` as `W_Ω` and `parahoricDoubleCosetEquiv` as the
bijection, and prove `finite_parahoricWeyl`, `parahoricWeyl_basePoint` (`I ∩ N(K) = Z(K)_0`, so the
Iwahori has trivial finite Weyl group) and `parahoricDoubleCosetEquiv_mk` (the class of `mk n` goes to
the class of `n`) ([Haines–Rapoport], Lem. 6, p. 3, and Prop. 8 (second part), p. 4; [Richarz],
Thm 1.4, p. 119, and (1.7), p. 120 (arXiv p. 2); [He 2018], §1.1, p. 5). *Needs:*
*iwahori-bruhat-decomposition*; *length-and-bruhat-order*; RG2.3 *parahoric-subgroup*; Mathlib
`DoubleCoset.Quotient`.

**Checks.**

- `parahoricWeyl_gl2` — at the special vertex `0` of the standard `GL_2` apartment, `W_0 = S_2` has
  two elements.
- `parahoricWeyl_anisotropic` — with no relative roots every `W_Ω` is trivial.
- `parahoricWeyl_le_affineWeyl` — `W_Ω ⊆ W_a`.
- `parahoricWeyl_le_pointStabilizer` — `W_x` fixes `x`.
- `parahoricDoubleCosetEquiv_hyperspecial_gl2` — for `GL_2` and `Ω = Ω' = {0}`, the class of
  `diag(ϖ^{-1}, 1)` goes to the double coset `K diag(1, ϖ^{-1}) K` of its `W_0`-conjugate.
- `parahoricDoubleCosetEquiv_alcove` — for `Ω = Ω'` the base point, the bijection is the
  Iwahori–Bruhat bijection `iwahoriBruhat`.
- `parahoricDoubleCosetEquiv_cartan_infinite_gl2` — for `GL_2`, `K\G(K)/K` is infinite at the vertex
  `0`.
- `parahoricDoubleCosetEquiv_mixed_gl2` — for `GL_2`, `Ω = {0}` and `Ω'` the base point, the class of
  the permutation matrix goes to `K·1·I`, while its Iwahori double coset differs from that of `1`.

**Multiplication of Iwahori double cosets.** (*simple-cell-multiplication*) First, for `s ∈ S̃` and
`w ∈ W̃`, `IṡI·IẇI = IṡẇI` if `ℓ(sw) = ℓ(w) + 1` and `IṡI·IẇI = IṡẇI ⊔ IẇI` if
`ℓ(sw) = ℓ(w) − 1`, and the same holds on the right. Hence `IẇI = Iṡ_1I⋯Iṡ_kI·Iτ̇I` for a reduced
expression `w = s_1⋯s_kτ`, and `IẇI·Iẇ'I = Iẇẇ'I` whenever `ℓ(ww') = ℓ(w) + ℓ(w')`. Second, over
`E`, with `I_n` the Moy–Prasad subgroups (`I_1` the pro-`p` radical) and `g_1 ∈ IṡI`, one has
`I_n g_1 I_n ⊆ g_1 I_{n−1}`, because `I_n ṡ I_n ⊂ ṡ I_{n−1}` (`ṡ` moves `U_{a,n}` with `ṡ(a) < 0`
to depth `n−1`). Third, a compact `X ⊂ G(E)` meets only finitely many `IẇI`, and `IẇI·Iẇ'I` is a
finite union of double cosets `Iu̇I` with `ℓ(u) ≤ ℓ(w) + ℓ(w')`. In `BruhatTits.Decomposition`, prove
`simpleCell_mul_cell` (the two length cases on the left) and `cell_mul_cell_of_length_add`
([He 2018], §2.4, p. 8, the proof of Prop. 2.3, p. 8 (compact sets), Prop. 4.3, p. 12, and the proof
of Lem. 4.7, p. 14; [Richarz], (1.14) in the proof of Prop. 1.11, p. 123 (arXiv p. 5);
[Bruhat–Tits I], §6.5, Théorème, p. 154). *Needs:* *iwahori-bruhat-decomposition*;
*length-and-bruhat-order*; RG2.3 *positive-depth-filtration-basis*; *affine-tits-system*.

**The Iwahori factorization.** (*iwahori-factorization*) Let `P = MN` be a `K`-parabolic with Levi
`M ⊇ Z`, `N = ⟨U_a : a ∈ Φ_N⟩` and `N^-` the opposite unipotent group, and let `H` be an Iwahori, a
pro-unipotent radical `P_F^+` for a facet `F ⊂ A`, or a Moy–Prasad subgroup `G_{x,r}` with `r > 0`.
First, the multiplication map `(H ∩ N^-) × (H ∩ M) × (H ∩ N) → H` is bijective in every order;
`H ∩ U_a(K) = U_{a,f_H(a)}`, and `H ∩ N^±` is the product of its root groups in any order. Second,
over `L`, `Ĭ_n = ∏_{Φ_aff(Ĭ_n)} U_{a,n-shifted}·T_n` in a fixed order; for `s` simple,
`Ĭ_n ∩ ṡĬ_nṡ^{-1}` contains the wall root group of `s` at depth `n+1`, whence `Ĭ_n ṡ Ĭ_n/Ĭ_n` is an
affine space of dimension `ℓ̆(s)` over `κ̄`, whose `σ`-fixed points `I_n ṡ I_n/I_n` number
`q^{ℓ̆(s)}`. Third, the dominant monoid `Δ_M = {z ∈ Z(E) : ⟨a, v(z)⟩ ≤ 0, a ∈ Φ_N}` is a submonoid; an
element `z ∈ Δ_M` contracts `H ∩ N` and `z^{-1}` contracts `H ∩ N^-`, so
`HzH = (H ∩ N^-)z(H ∩ M)(H ∩ N)` and

```text
[H : H ∩ zHz^{-1}] = [H ∩ N : z(H ∩ N)z^{-1}] = δ_P(z)^{-1}
```

(two-term witness: for `SL_2`, `H = I` and `z = diag(ϖ, ϖ^{-1})`, `⟨a, v(z)⟩ = −2 ≤ 0`,
`z x_+(u) z^{-1} = x_+(ϖ²u)` contracts `I ∩ N = x_+(O)`, `[I : I ∩ zIz^{-1}] = q²` and
`δ_B(z) = |ϖ²| = q^{−2}`). In the Lean file the contraction is stated for `w = z^{-1}`: if every root
positive on `v` is nonnegative on the translation `ν(w)`, then `w^{-1}(I ∩ U)w ⊆ I ∩ U`. In
`BruhatTits.Decomposition`, prove `iwahoriFactorization`, `iwahoriFactorization_injective` and
`iwahori_unipotent_contract` ([He 2018], proof of Lem. 4.6, pp. 13–14; [Casselman], §1.4, pp. 13–15
(Prop. 1.4.3, the Iwahori factorization, Prop. 1.4.4) and Lem. 1.5.1, p. 16; [Bruhat–Tits I],
Prop. (6.4.9), p. 136, and Prop. (6.4.48), p. 152, via the valued root datum). *Needs:* RG2.3
*moy-prasad-filtration*; RG2.3 *parahoric-subgroup*; RG2.1 *valued-commutator-estimates*; RG2.3
*pro-unipotent-radical-and-nested-facets*.

**Checks.**

- `iwahori_unipotent_contract_sign` (non-example) — for `GL_2`, `v = (1, 0)` and `z = diag(ϖ, ϖ^{-1})`,
  the translation `ν(z) = (−1, 1)` is negative on the upper root, and conjugation by `z^{-1}` expands
  the upper root group: the conclusion of `iwahori_unipotent_contract` fails for `z`.
- `iwahori_unipotent_contract_valuation` (computation) — `ϖ^{-2}u` is not integral for a unit `u` and
  `ϖ ≠ 0` with `|ϖ| < 1`; the hypothesis `ϖ ≠ 0` is needed since `0^{-1} = 0` in Lean.
- `conjugation_two_terms` (computation) — for `z = diag(2, 1/2)` and `x = [[1,1],[0,1]]`,
  `zxz^{-1} = [[1,4],[0,1]]` and `z^{-1}xz = [[1,1/4],[0,1]]`; at the 2-adic valuation the first
  contracts and the second expands.

**Cardinalities of Iwahori double cosets.** (*double-coset-cardinalities*) Let `I` be the Iwahori of a
`σ`-stable alcove, `Ĭ` and `Ĭ_n` the corresponding groups over `L`, `I_n` (`n ≥ 1`) its Moy–Prasad
subgroups, and `ℓ̆` the length of `W̃_L` restricted to `W̃_E = (W̃_L)^σ`. First, `#(IẇI/I) = q^{ℓ̆(w)}`;
for `s ∈ S̃`, `ℓ(s) = 1` while `ĬṡĬ/Ĭ` is an affine space over `κ̄` of dimension `ℓ̆(s)`, and
`ℓ̆(s) = 1` iff the `σ`-orbit of `s` in `S̃_L` is a singleton; `ℓ̆ = ℓ` when `G` is residually split, in
particular when `G` is split. Second, for `n ≥ 1` and `g ∈ IẇI`, `#(I_n g I_n/I_n) = q^{ℓ̆(w)}`,
independently of `g` (via a reduced word in `W̃_L`, contraction, and Lang's theorem). Third, `IẇI`
has `q^{ℓ̆(w)}[I : I_n]` left `I_n`-cosets, hence is a disjoint union of `[I : I_n]` double cosets
of `I_n` ([He 2018], Lem. 4.5, p. 13, Lem. 4.6, pp. 13–14, and the proof of Thm 5.3, p. 16;
[Richarz], Proposition 1.11, p. 122, and Remark 1.13, p. 124 (arXiv pp. 4–5)). These are statements of
this document. *Needs:* *simple-cell-multiplication*; RG2.3 *frobenius-fixed-coset-lifting*;
*length-and-bruhat-order*; *iwahori-factorization*.

**Finiteness of compact double cosets.** (*compact-double-coset-finiteness*) Let `G` be a
topological group, `K` a compact open subgroup, `K'` an open subgroup and `g ∈ G`. First, `KgK'` is
the disjoint union of `[K : K ∩ gK'g^{-1}]` left cosets `hK'`, finitely many; if `K'` is compact as
well, it is also the disjoint union of `[K' : K' ∩ g^{-1}Kg]` right cosets `Kh`. Second,
`μ(KgK') = [K : K ∩ gK'g^{-1}]μ(K')` for a left Haar measure `μ`, and, for `K'` compact,
`μ(KgK') = [K' : K' ∩ g^{-1}Kg]μ(K)` for a right Haar measure. Third, for `K` and `K'` compact open,
`K\G/K'` is finite iff `G` is compact; this fails for `G(E)`: the Cartan set is infinite, and
finiteness holds per double coset. The left-coset decomposition of a double coset is Tau Ceti's
`DoubleCoset.doubleCoset_eq_iUnion_leftCosets` (`TauCeti/GroupTheory/DoubleCoset/Basic.lean`) and
the finiteness of `K/(K ∩ gK'g^{-1})` is Mathlib's `Subgroup.quotient_finite_of_isOpen'`;
`doubleCoset_finite_of_isCompact` adds the count. In `BruhatTits.Decomposition`, prove
`doubleCoset_finite_of_isCompact` and `haar_doubleCoset` (the left-coset and left-Haar statements;
the right-coset and third statements are elementary statements of this document) ([Casselman],
§1.5, proof of Prop. 1.5.2, p. 16, for the index identity when `K' = K`). *Needs:* RG2.0
*congruence-neighbourhood-basis*; Mathlib `Subgroup.index`, `Subgroup.relIndex`,
`Subgroup.quotient_finite_of_isOpen'`, `MeasureTheory.Measure.haar`,
`MeasureTheory.Measure.IsHaarMeasure`, `DoubleCoset.doubleCoset`; Tau Ceti
`DoubleCoset.doubleCoset_eq_iUnion_leftCosets`.

### RG2.4.3 cocharacters, lengths and admissible sets

**Dominant inertia-coinvariant cocharacters.** (*dominant-coinvariant-cocharacters*) Let `S` be a
maximal `L`-split torus defined over `E` and `T = Z_G(S)`. First, `X_*(T)_I` modulo torsion embeds
in `V = X_*(T)_I ⊗ ℝ = X_*(S) ⊗ ℝ`, which carries the échelonnage system `Σ` (reduced, with Weyl
group `W_0` and coroot lattice `X_*(T_sc)_I`); a `σ`-stable alcove `C` and a special vertex `x_0` of
`C̄` fix `Σ^+` and the closed chamber `C^+ = {⟨·, Σ^+⟩ ≥ 0}` at `x_0` containing `C`. For
`λ ∈ X_*(T)_I` define `t^λ` as the inverse image of `−λ` under the
Kottwitz isomorphism `T(L)/T(L)_0 ≅ X_*(T)_I`, embedded in `W̃_L`.
It acts by `λ̄`, but its real displacement does not determine it when there is torsion.
For an actual split cocharacter `λ : G_m → T`, evaluation gives the representative
`λ(ϖ)^{-1}`. Evaluation is not defined on an arbitrary inertia-coinvariant class.
Over `E`, use `λ ∈ Λ_Z` and the same inverse Kottwitz convention, without replacing
`π₁(Z)_I^σ` by a maximal torus lattice. Second,
`λ` (or `t^λ`) is dominant if `λ̄ ∈ C^+`, and the orbit `W_0λ` has a unique dominant element `λ_dom`,
written `λ_w` on the double coset `W_0t^λW_0`. ([Kisin–Zhou] §2.1.3 also takes `C^+` to contain the
alcove; [He 2021] §2.1 takes the dominant chamber opposite to the alcove instead. The formulas below
are stated in the orientation pinned by `length_orientation_gl2` and `isDominant_gl_n`.)
Third, assume the Frobenius action on the based root datum preserves `C^+` and acts linearly
with finite order `m` on `V`; alcove stability alone does not give this hypothesis.
For a dominant Hodge coweight `μ`, define its Hodge average
`μ^♦ = m⁻¹ Σ_{i<m} σ^i(μ)`, which is dominant and Frobenius fixed.
For an arbitrary translation class `λ`, the Newton displacement is instead
`ν_disp(t^λ) = dom(m⁻¹ Σ_{i<m} σ^i(λ̄))`: iterate `(t^λ σ)^m` before taking
the dominant representative. The target `newton_translation_average` proves this from
that iterate identity. It agrees with `λ^♦` when `λ` is dominant. In the usual
valuation normalization our representative has `κ(t^λ) = −λ` and Newton point
`ν_std(t^λ) = dom(−m⁻¹ Σ σ^i(λ̄)) = −w₀ ν_disp(t^λ)`.
Thus neither the sign nor dominantization may be suppressed. Fourth, `λ ≤ λ'` iff
`λ' − λ ∈ ℕΣ^{∨,+} ⊂ X_*(T_sc)_I`, that is, `t^{λ'}(t^λ)^{-1} ∈ W_a` and `λ̄' − λ̄` is a sum of positive
coroots of `Σ`; this is a partial order, compatible with the Bruhat order on translations of equal
`Ω`-part and finer than real dominance. Fifth, the Hodge coweight `μ̄ ∈ X_*(T)_I` of a geometric
conjugacy class `{μ}` is the image of its `B`-dominant member, for `B ⊃ T` over `L` containing the
chamber; it is well defined up to `W_0`, with dominant form `μ̄_dom`. In `BruhatTits.Coinvariants`,
define `translationVector` as `ν(t)` for `t ∈ Z(K)/Z(K)_0`, `IsDominant` as `ν(t) ∈ C^+` (every root
positive on a regular `v` in the chamber of `C` is nonnegative on `ν(t)`), `dominantRep` as the
dominant element of the `W̃`-conjugacy orbit, and `dominanceLE` as the fourth statement; prove
`apartmentAction_translation`, `dominantRep_mem_orbit`, `eq_dominantRep` (uniqueness),
`dominantRep_of_isDominant`, `dominanceLE_trans` and `dominanceLE_antisymm`. The Hodge average, `newton_translation_average`, its normalization conversion, and the Hodge coweight are targets of this document ([Haines–Rapoport], Lem. 15 and
the preceding discussion, pp. 7–9; [Kisin–Zhou], §2.1.3–2.1.5, p. 7; [He 2021], §2.1, p. 5, and §2.2,
p. 6 (`λ^♦`, `λ_w` and the order `≥_ℤ`); [Gleason–Lim–Xu], §2, (2.5)–(2.7), pp. 14–15). *Needs:*
*iwahori-weyl-exact-sequences*; RG2.1 *echelonnage-root-system*; RG2.1 *minuscule-coweight*; RG2.1
*kottwitz-homomorphism*.

**Checks.**

- `newton_translation_resGL2` — for unramified quadratic restriction of `GL₂`, Frobenius
  swaps the factors. For `λ=((1,0),(0,1))`, averaging gives `((1/2,1/2),(1/2,1/2))`,
  whereas averaging `dom λ` gives `((1,0),(1,0))`. The square of the twisted translation
  displaces by `((1,1),(1,1))`; the Newton displacement is central.
- `newton_translation_dominant` — for `λ=((2,0),(1,0))`, both averaging operations
  give the dominant vector `((3/2,0),(3/2,0))`.
- `newton_translation_split_sign` — split `GL₂`: displacements `(1,0)` and `(2,0)`
  correspond to valuation vectors `(-1,0)` and `(-2,0)`, whose dominant Newton points
  are `(0,-1)` and `(0,-2)`; their Kottwitz coordinates are `−1` and `−2`.
- `isDominant_gl_n` — for `GL_n` with base alcove in the chamber `x_1 ≥ ⋯ ≥ x_n`, `t^λ` is dominant iff
  `λ_1 ≥ ⋯ ≥ λ_n`, and `(0, 1)_dom = (1, 0)`; in Lean, for `GL_2` and `v = (1, 0)`, the class of
  `diag(ϖ^{-1}, 1)` (translation `(1, 0)`) is dominant and that of `diag(1, ϖ^{-1})` is not.
- `translationVector_gl2` — the classes of `diag(ϖ^{-1}, 1)` and `diag(ϖ^{-2}, 1)` translate the
  apartment by `(1, 0)` and `(2, 0)`: the sign `ν(t^λ) = λ̄` for `t^λ` the class of `λ(ϖ)^{-1}`.
- `dominantRep_gl2` — for `GL_2` and `v = (1, 0)`, the dominant representative of `t^{(0,1)}` is
  `t^{(1,0)}`.
- `dominantRep_gl3` — for `GL_3` and `v = (2, 1, 0)`, the dominant representative of the translation
  by `(0, 1, 2)` is the translation by `(2, 1, 0)`.
- `dominantRep_one` — `1_dom = 1`.
- `translationVector_one` — `ν(1) = 0`.
- `translationVector_mul` — `ν(tt') = ν(t) + ν(t')`.
- `translationVector_anisotropic` — when `V = 0` every translation vector vanishes, so for the
  ramified norm-one torus `ν` is not injective on `Z(K)/Z(K)_0`.
- `isDominant_one` — `1` is dominant.
- `isDominant_zero_vector` — for `v = 0` every translation is dominant; dominance needs a regular `v`.
- `dominanceLE_refl` — the dominance relation is reflexive.
- `dominance_simpleRoot_negative` (non-example) — for `GL_3` and `v = (2, 1, 0)`, `0 ≤ (1, −1, 0)` (a
  positive coroot) although the simple root `x_2 − x_3` takes the value `−1` on `(1, −1, 0)`:
  dominance is not the coordinatewise order on simple-root values. (In `A_2` coordinates: the Cartan
  matrix `[[2,−1],[−1,2]]` sends the coefficient vector `(1, 0)` to `(2, −1)`.)
- `dominanceLE_gl2` — for `GL_2` and `v = (1, 0)`, `(1, 0) ≤ (2, −1)` via the coroot `(1, −1)`, while
  `(1, 0)` and `(1, 1)` are incomparable because they differ in `π₁ = ℤ`.
- `dominance_not_real_order` (non-example) — a translation outside `W_a` is never `≥ 0`; for `PGL_2`
  with `X_*(T)_I = ℤ`, `0 ≤ 1` holds in `V` (the coroot is `2`) yet `1 ∉ 2ℕ`, so `ℝ`-coefficients
  ignore the `Ω`-part.

**Length of translations.** (*translation-length-formula*) Let `x ∈ C̄` be special, giving
`W̃_L ≅ X_*(T)_I ⋊ W_0(L)` over `L`, or `W̃_E ≅ Λ_Z ⋊ W_0(E)` over `E`,
with the corresponding relative system `Σ^+` and `2ρ_Σ`. First,

```text
ℓ(t^λ) = ⟨λ_dom, 2ρ_Σ⟩ = Σ_{a ∈ Σ^+} |⟨λ, a⟩|,
```

which vanishes iff the real displacement of `λ` is central (in particular on torsion) and is additive on dominant `λ, λ'`. Second, for `λ` dominant and
`x ∈ W_0`, `ℓ(xt^λ) = ℓ(x) + ℓ(t^λ)`, the base alcove `C` lying in the chamber `C^+` at the special
vertex: for `SL_2` with `C = (0, α^∨/2)`, `t^{α^∨} = s_0s_1` has length `2 = ⟨α^∨, α⟩`,
`s_1t^{α^∨} = s_1s_0s_1` has length `3`, while `t^{α^∨}s_1 = s_0` has length `1` (the Lean witness is
`length_orientation_gl2`); the Newton displacement of `t^λ` is `λ^♦` under the based, chamber-preserving
Frobenius hypotheses above. For `G` quasi-split and simple,
the cordiality target transports [He 2021], Theorem 4.2, through the change of
chamber and translation sign: `η_σ(xt^λ) = x`, `xt^λ` is cordial, and
`ℓ(xt^λ) − ℓ(η_σ(xt^λ)) = ⟨λ^♦, 2ρ⟩`. This uses dominant `λ` and the
Hodge average; it makes no assertion that averaging a dominant representative computes
the Newton point of every translation. Third, over
`E`, `ℓ̆(t^λ) = ⟨λ_dom, 2ρ_{Σ_L}⟩`, which in general differs from the `ℓ(t^λ)` computed from `Σ_E`. In
`BruhatTits.Coinvariants`, prove `length_translation_eq_dominantRep`, `length_translation_mul` and
`length_mul_translation_of_isDominant` ([Kisin–Zhou], §2.1.5, (2.1.5.1), p. 7; [He 2021], §4.3 (proof
of Thm 4.2), p. 8; [Richarz], Proposition 1.11, p. 122 (arXiv p. 4)). *Needs:*
*length-and-bruhat-order*; *dominant-coinvariant-cocharacters*; RG2.1 *echelonnage-root-system*.

**Dominant double-coset normal form.** (*dominant-normal-form*) Write `W̃ = Λ ⋊ W_0` via a
special vertex, with `Λ = X_*(T)_I` over `L` and `Λ = Λ_Z` over `E`, let `S` be its simple reflections and `^S W̃` the set of minimal elements of the left
`W_0`-cosets. Every `w ∈ W̃` is uniquely `w = xt^λy` with `λ` dominant, `x, y ∈ W_0` and
`t^λy ∈ ^S W̃`, and then `ℓ(w) = ℓ(x) + ℓ(t^λ) − ℓ(y)`; consequently `W_0\W̃/W_0` corresponds to the
dominant `λ = λ_w`. In `BruhatTits.Coinvariants`, prove `dominantNormalForm`, with `W_0` realized as
the finite Weyl group `W_{x_0}` of the special vertex ([He–Nie–Yu], §2E, p. 1687 (the unique
expression and the length formula), with the setting of §2A, pp. 1684–1685; [He 2021], §2.2, p. 5,
and §4.3, p. 8 (the case `y = 1`); [He 2018], §1.1, p. 5). [He–Nie–Yu] state it for `G` quasi-split
over a local field; for general `G` it is derived here, since only the structure of
`W̃ = (Z(K)/Z(K)_0) ⋊ W_{x_0}` as an extension of the affine Weyl group of `Σ` by `Ω` enters, in the
orientation fixed by `length_orientation_gl2`. *Needs:* *translation-length-formula*;
*length-and-bruhat-order*; *parahoric-double-cosets*.

**The μ-admissible set.** (*admissible-set*) Let `{μ}` be a geometric conjugacy class,
`μ̄ ∈ X_*(T)_I` its dominant Hodge coweight, `≤` the Bruhat order on `W̃ = W_a ⋊ Ω`, and `τ_μ ∈ Ω` the
element with `t^{μ̄} ∈ W_a τ_μ`. The admissible set is `Adm(μ) = {w ∈ W̃ : w ≤ t^{x(μ̄)}, some x ∈ W_0}`.
For a facet `F ⊂ C̄`, `Adm^F(μ) = W_F Adm(μ) W_F`, whose image in `W_F\W̃/W_F` is the set of double
cosets meeting `Adm(μ)`. The set `Adm(μ)` is finite, a lower set, contained in `W_a τ_μ`, and
`σ`-stable if `W_0μ̄` is (for instance when `{μ}` is defined over `E`); its maximal elements are the
`t^{x(μ̄)}`, each of length `⟨μ̄, 2ρ_Σ⟩`; and for `G` split over `L`, `Adm(μ) ⊆ Perm(μ)`, where
`Perm(μ) = {w : w ≡ τ_μ mod W_a and w(v) − v ∈ conv(W_0μ̄)_ad ∀ v ∈ C̄}` uses the reduced apartment.
The congruence condition is essential; displacement alone loses torsion. Equality holds for `GL_n`,
and for `GSp_{2n}` when the dominant cocharacter is a sum of minuscule dominant cocharacters
([Rapoport], Lemma 3.1, p. 9, (3.4) and (3.9), p. 10, Proposition 3.2, p. 11, Theorem 3.4, p. 12).
`Perm(μ)` and the inclusion are statements of this document only. In `BruhatTits.Admissible`, define
`admissibleSet` as `Adm(μ) = {w : w ≤ y t^μ y^{-1}, some y ∈ W_{x_0}}` for a special point `x_0` of `C̄`,
and `parahoricAdmissibleSet` as `W_Ω Adm(μ) W_Ω` for a nonempty finite `Ω ⊂ C̄`; prove
`admissibleSet_finite`, `admissibleSet_lowerSet` (if `w' ≤ w` and
`w ∈ Adm(μ)` then `w' ∈ Adm(μ)`), `translation_mem_admissibleSet` (`t^{x(μ̄)} ∈ Adm(μ)`),
`length_le_of_mem_admissibleSet` (`ℓ(w) ≤ ℓ(t^μ) = ⟨μ̄, 2ρ_Σ⟩`, with equality iff `w = t^{x(μ̄)}`),
`admissibleSet_subset_coset` (`Adm(μ) ⊆ W_a t^μ = W_a τ_μ`), `admissibleSet_map_eq` (an automorphism
of `W̃` preserving the Bruhat relation and `W_{x_0}` and mapping `t^μ` into its `W_{x_0}`-orbit
preserves `Adm(μ)`; `σ` is one when `W_0μ̄` is `σ`-stable),
`admissibleSet_subset_parahoricAdmissibleSet` and `parahoricAdmissibleSet_alcove` (`Adm^C(μ) = Adm(μ)`)
([Gleason–Lim–Xu], §2, (2.3)–(2.4), p. 14, and §3.2, p. 19 (the μ-admissible locus); [van Hoften],
§2.2.15, p. 19 (τ_μ, Adm(μ) ⊆ W_a τ_μ, Adm^F(μ))). The elementary properties are derived from the
definition: a finite union of finite Bruhat intervals is finite and lower; equal-length translation
endpoints are exactly the maximal elements; an automorphism as in `admissibleSet_map_eq` permutes the
endpoints and so preserves their lower sets. Their common length is the translation-length formula.
*Needs:* *length-and-bruhat-order*; *dominant-coinvariant-cocharacters*; *translation-length-formula*;
*parahoric-double-cosets*.

**Checks.**

- `displacement_loses_torsion` — every additive map `ℤ/2 → ℝ` kills the nonzero class. For the ramified
  norm-one torus this is why the zero-dimensional apartment cannot replace the Kottwitz congruence in
  `Perm(μ)`; the Lean example proves the additive obstruction.
- `admissibleSet_gl2_minuscule` — for `GL_2`, the base alcove `0 < x_1 − x_2 < 1`, the special vertex
  `0` and `μ = (1, 0)`, `Adm(μ) = {t^{(1,0)}, t^{(0,1)}, τ}`, three elements.
- `admissibleSet_zero` — `Adm(0) = {1}`.
- `admissibleSet_central` — for `t^μ ∈ Ω` (`μ` central), `Adm(μ) = {t^μ}`, a single element of length
  zero.
- `admissibleSet_ne_lowerSet_of_dominant` (non-example) — a conjugate `y t^μ y^{-1} ≠ t^μ` is never
  below `t^μ`; for `GL_2` and `μ = (1, 0)`, the lower set of `t^{μ̄}` alone is `{t^{(1,0)}, τ}` and
  misses `t^{(0,1)}`.
- `parahoricAdmissibleSet_one` — `Adm^Ω(0) = W_Ω`.
- `parahoricAdmissibleSet_gl2_hyperspecial` — for `GL_2`, the special vertex `0` and `μ = (1, 0)`,
  `Adm^{0}(μ) = W_0 t^μ W_0` has four elements.
- `parahoricAdmissibleSet_subset_coset` — `Adm^Ω(μ) ⊆ W_a t^μ`.

### RG2.4.4 Cartan and Iwasawa decompositions

**The Cartan decomposition.** (*cartan-decomposition*) Let `x` be a special point, `K = 𝒢°_x(O)`,
and `K̂ = 𝒢_x(O)` the fixer. First, `G(K) = KZ(K)K = KN(K)K`. Second, `n ↦ KnK` induces
`W_0\W̃/W_0 ≅ K\G(K)/K` (with `W_0 ≅ W_x`), and this set is `(Z(K)/Z(K)_0)/W_0`, which over `L` is
the set of dominant `λ ∈ X_*(T)_I` and over `E` is `Z(E)/Z(E)_0` modulo `W_0`. Third, for `G` split
and `K = 𝒢(O)` hyperspecial with `𝒢` reductive over `O`, `G(E) = ⊔_{λ ∈ X_*(T)^+} Kλ(ϖ)K`, the
double cosets being distinct for distinct `λ`. Fourth, over `E`, infinitude is controlled by the rational translation quotient
`Z(E)/Z(E)_0` (equivalently its positive free rank, or `S ≠ 1`). Over the completed
unramified field `L`, the translation quotient is `X_*(T)_I`; these are separate assertions; for `K̂` the double cosets are unions over the finite quotient `K̂/K`,
indexed by the orbits of `W_0 ⋉ (K̂/K)`. Fifth, at a non-special point `x`, `G(K) ≠ P_xZ(K)P_x`:
the finite Weyl group `W_x` projects onto a proper subgroup of `W_0`. In `BruhatTits.Decomposition`,
prove `cartan` and `cartan_parahoricWeyl_eq` (`W_x → W_0` is bijective) ([Bruhat–Tits I],
Prop. (4.4.3), p. 80 (for the full fixer, the "bon sous-groupe borné maximal"); [Haines–Rapoport],
Prop. 8, p. 4, and Prop. 13, p. 8; [Zhu], Lem. 1.8 (ii), p. 11, for `GL_n` over `W(k)[1/p]`, and
Prop. 1.23, p. 19, the orbit description of `Gr_μ` resting on the Cartan decomposition). *Needs:*
*parahoric-double-cosets*; *dominant-coinvariant-cocharacters*; *dominant-normal-form*; RG2.3
*hyperspecial-vertices*.

**Checks.**

- `cartan_not_special` (non-example) — at a non-special point `x`, `P_x Z(K) P_x ≠ G(K)`.

**The Iwasawa decomposition.** (*iwasawa-decomposition*) Let `x` be special, `K = 𝒢°_x(O)` and
`K̂ = 𝒢_x(O) = K·(Z(K) ∩ K̂)`, let `P = ZU` be a minimal `K`-parabolic and
`U(K) = ⟨U_a(K), a ∈ Φ^+⟩`. First, `G(K) = KP(K) = KZ(K)U(K) = U(K)Z(K)K`, and the same with `K̂`.
Second, `w ↦ KẇU(K)` induces `W_0\W̃ ≅ K\G(K)/U(K)`, which over `L` is `Z(K)/Z(K)_0 ≅ X_*(T)_I`; for
`K̂` the double cosets `K̂\G(K)/U(K)` are indexed by `Z(K)/(Z(K) ∩ K̂)` instead, a quotient by the finite
group `(Z(K) ∩ K̂)/Z(K)_0`. Third, over `E`, `K̂` is a special maximal compact subgroup,
`K̂ ∩ P(E) = (K̂ ∩ Z(E))(K̂ ∩ U(E))`, and `G(E)/P(E)` is compact. In `BruhatTits.Decomposition`, prove
`iwasawa` and `iwasawa_cells` for `K` ([Bruhat–Tits I], Prop. (7.3.1) and §7.3, p. 164, and
Cor. (7.3.2) (ii), p. 165 (the cells);
[Bruhat–Tits I], Prop. (4.4.3), p. 80; [Casselman], Lem. 1.4.5 and Prop. 1.4.6, p. 15, and §3.1,
p. 32 (`G = PK` for a good compact subgroup `K`)). The third statement is derived here from
(7.3.1), (4.4.3) and Prop. (6.4.9), p. 136; no source states it in this form. *Needs:*
*parahoric-double-cosets*; RG2.3 *parahoric-subgroup*; *iwahori-weyl-exact-sequences*; RG2.2
*stabilizers-and-fixers*.

**Iwasawa decomposition for an arbitrary parabolic and its integral form.** (*iwasawa-parabolic-integral*)
Let `x` be special, `K = 𝒢_x(O)` or `𝒢°_x(O)`, `P = ZU` the minimal `K`-parabolic of
*iwasawa-decomposition*, and `Q = M_Q N_Q` any `K`-parabolic containing `P`, with Levi `M_Q ⊇ Z`
(so `Q = P_v = M_v U_v` for a vector `v` of the coroot space, ReductiveGroups layer 7). First,
`G(K) = KQ(K)`, from `G(K) = KP(K)` and `P ⊆ Q`. Second, `K` is in good position with respect to
`Q`: `K ∩ Q(K) = (K ∩ M_Q(K))(K ∩ N_Q(K))`. Third, over `E`, `G(E)/Q(E)` is compact, being the image
of `K`. Fourth, the integral form: for `𝒢` a reductive `O`-model (RG2.3 *reductive-model*) with
`𝒢(O)` hyperspecial, so that `𝒢(O) = 𝒢°_x(O)` for a hyperspecial `x` (RG2.3 *hyperspecial-vertices*),
and `𝒬 ⊆ 𝒢` the parabolic `O`-subgroup scheme with generic fibre `Q`, `𝒬 = 𝒩 ⋊ ℳ`, one has
`G(E) = 𝒢(O)Q(E)` and `𝒢(O) ∩ Q(E) = 𝒬(O) = 𝒩(O)ℳ(O)`. This is the local statement
"`G(F_v) = K_v P(F_v)` with `K_v ∩ P(F_v) = P(O_v)`" that AdelicAlgebraicGroups AA.3 assembles at
almost all places of a number field, where its model is reductive and hyperspecial. In
`BruhatTits.Decomposition`, define `parabolicOfVector` as `P_v = M_v U_v` (generated by `M_v` of
`leviOfVector` and `U_v(K)`; it differs from Tau Ceti's dynamic `TauCeti.Cocharacter.parabolic` in
taking a real vector and only rational points); prove `parabolicOfVector_mono` (for `v` regular,
`P_v ⊆ P_w` whenever every root positive on `v` is nonnegative on `w`), `iwasawa_parabolic` (the
first statement), `special_inf_parabolic_eq` (the second) and `compactSpace_quotient_parabolic` (the
third, in the point topology of RG2.0) ([Casselman], §3.1, p. 32 (`G = PK` for a good compact
subgroup `K` and every parabolic `P`), and Prop. 1.4.6, p. 15; [Bruhat–Tits I], Prop. (7.3.1),
p. 164, Prop. (4.4.3), p. 80, and Prop. (6.4.9), p. 136; [Gille 2009], §4.2, p. 53 (over a henselian
discrete valuation ring a simply connected semisimple group scheme has generic and special fibres
with the same Tits index, and a minimal parabolic of the special fibre lifts to a parabolic
`O`-subgroup scheme `𝔓 = R_u(𝔓) ⋊ Z_𝔥(𝔖)`)). Items (1)–(4) are derived here from these; no source
states (2) or (4) in this form. *Needs:* *iwasawa-decomposition*; RG2.3 *reductive-model*; RG2.3
*hyperspecial-vertices*; RG2.1 *levi-of-apartment-vector*; ReductiveGroups layer 7; RG2.0
*points-topological-group*.

**Checks.**

- `iwasawa_parabolic_regular` — for `v` regular, `P_v = ZU` and the first statement is
  *iwasawa-decomposition*.
- `parabolicOfVector_zero` — `P_0 = G(K)` when the datum generates.
- `parabolicOfVector_ne_iwahori` (non-example) — no parabolic of an isotropic group is a parahoric.

**The Kneser–Tits theorem over a local field.** (*kneser-tits-local*) Let
`G(K)^+ = ⟨U_a(K) : a ∈ Φ⟩ = ⟨R_u(Q)(K) : Q a K-parabolic⟩`, a normal subgroup of `G(K)`, and let
`W(K,G) = G(K)/G(K)^+` be the Whitehead group. Assume `G` semisimple, simply connected, absolutely
almost simple (irreducible absolute root system, coroots spanning `X_*(T)`) and `K`-isotropic
(`Φ ≠ ∅`). First (Tits), if `#K ≥ 4` then every proper normal subgroup of `G(K)^+` is central in
`G(K)`, and `G(K)^+` is perfect. Second (Kneser–Tits for local fields), for `K = E` a nonarchimedean
local field, `G(E)^+ = G(E)`, that is `W(E,G) = 1` (Platonov 1969 for `char E = 0`;
[Prasad–Raghunathan] in general). Third, consequently `G(E)` has no proper subgroup of finite index:
a finite-index subgroup contains a normal one, which by the first two statements is central or
everything, and the centre is finite; this is the input for the elimination of arithmetic
finite-index closures in AdelicAlgebraicGroups AA.4. Fourth, for `G` anisotropic `G(K)^+ = 1`, and for
`G` not simply connected the second statement fails: `W(E, PGL_2) = E^×/(E^×)²`, and
`GL_2(E)^+ = SL_2(E)`. In `BruhatTits.Decomposition`, define `plusSubgroup` as `G(K)^+`; prove
`plusSubgroup_normal` (it is normal), `unipotentRadical_le_plusSubgroup` (the rational points of every
`R_u(P_v)` lie in it), `tits_simplicity` and `plusSubgroup_commutator` (the first statement),
`kneserTits_local` (the second) and `eq_top_of_finiteIndex` (the third) ([Gille 2009], §1, p. 39
(definition of `G(k)^+` and `W(k,G)`; Tits' simplicity theorem, citing Tits 1964), §4, p. 52 (standing
hypotheses: semisimple, simply connected, absolutely almost simple, isotropic) and Fait 4.1, p. 52
(perfectness), and §3.3, p. 51 (the reduction of `W(k,G)` to groups of relative rank one, due to
[Prasad–Raghunathan]); [Prasad–Raghunathan], Comment. Math. Helv. 60 (1985), 107–121 (the local case)).
Item (3) is derived here; no source states it in this form. *Needs:* *iwasawa-parabolic-integral*;
RG2.1 *algebraic-fundamental-group*; RG2.0 *points-topological-group*; ReductiveGroups layer 6;
ReductiveGroups layer 7.

**Checks.**

- `plusSubgroup_anisotropic` — the fourth statement, `G(K)^+ = 1` for `G` anisotropic.
- `plusSubgroup_le_commutator` — `G(K)^+ ⊆ [G(K), G(K)]` for `#K ≥ 4`, under the hypotheses of the
  first statement.
- `plusSubgroup_gl2` (non-example) — for `GL_2`, whose coroots do not span the cocharacters,
  `G(K)^+ = SL_2(K) ≠ GL_2(K)`.

**Unimodularity, the parabolic modulus and the Iwasawa integration formula.** (*iwasawa-integration-and-unimodularity*)
Let `G` be connected reductive over a nonarchimedean local field `E`. First, `G(E)` is unimodular: its
modular character is trivial ([Cartier], §4.1, p. 144, where `M`, `N` and `K` are also unimodular; in
characteristic zero this follows from the differential-form criterion of
[Platonov–Rapinchuk–Rapinchuk], Theorem 3.71, p. 196: `det Ad` is trivial, because opposite
absolute roots cancel and the central weight is zero; Corollary 3.72, p. 197, states the semisimple
case). In `BruhatTits.Decomposition`, prove `modularCharacter_eq_one` (Mathlib's
`MeasureTheory.Measure.modularCharacter` of `G(E)` in the point topology is `1`).

Second, for `P = MN`, define `δ_P(m) = |det(Ad(m)|Lie N)|_E`. On the split torus `S ⊂ M`,

```text
δ_P(s) = ∏_{a ∈ Φ(N,S)} |a(s)|_E^{dim g_a}
       = q^{Σ_a dim g_a · a(v(s))},    χ(v(s)) = −ω(χ(s)).
```

Here `g_a` is the adjoint weight space. For multipliable `a`, `dim U_a` includes the
`2a` direction and must not replace `dim g_a`. Nor is a relative root automatically a
character on all of the possibly noncommutative minimal Levi. The determinant definition
works there. In Mathlib's right-pushforward convention the modular character is
`modularCharacter(nm)=δ_P(m)`. Cartier's `Δ` in §4.1, (11), p. 145, is its inverse.
The target `LocalIntegration.modularCharacter_eq_adjointModulus` proves the absolute
adjoint-determinant formula for smooth affine groups over every nonarchimedean local
field, including positive characteristic. `LocalIntegration.adjointModulus` uses
`TauCeti.normalizedAbsoluteValue` and `Derivation.adjointAction`, not a supplied
character. For a parabolic, `parabolic_adjointDet_eq_radical` identifies its determinant
with that on `Lie N`, since the Levi is reductive and `Lie P=Lie M⊕Lie N`.
The proof uses local analytic coordinates, the inverse determinant for pushforward
of additive Haar measure, and the semidirect-product integration formula; smooth
charts over local fields work in either characteristic. RG2 owns this local theorem;
AA consumes it for finite-place and adelic-product comparisons, and SR consumes it
for the coefficient-valued modulus under its invertibility assumptions. Square roots
occur only in SR's normalized functors.
The character calculation follows from [Platonov–Rapinchuk–Rapinchuk], Theorem 3.71, p. 196, and the
automorphism-modulus calculation on p. 197. [Casselman], §1.5 and Lemma 1.5.1, p. 16, verify the
determinant convention and the inverse-modulus double-coset volume for contracting elements and a
compact subgroup with Iwahori factorization.

Third (Iwasawa integration formula), let `P = MN` be a minimal parabolic and `K` the stabilizer of a
special vertex, with Haar measures normalized by `vol(K) = vol(M ∩ K) = vol(N ∩ K) = 1` and `dg` the
Haar measure of `G(E)` with `vol(K) = 1`. Then for `f` locally constant with compact support,

```text
∫_{G(E)} f(g) dg = ∫_K ∫_{M} ∫_{N} δ_P(m)^{-1} f(nmk) dn dm dk
```

([Cartier], §4.1, formulas (3), (4) and (9), p. 145). This statement is not formalized in the
Lean file. *Needs:* *iwasawa-decomposition*; Mathlib `MeasureTheory.Measure.haar`,
`MeasureTheory.Measure.IsHaarMeasure`, `MeasureTheory.Measure.IsMulRightInvariant`,
`MeasureTheory.Measure.modularCharacter`; RG2.0 *points-topological-group*.

**Checks.**

- `adjointModulus_trivial` and `adjointModulus_gm` — the zero Lie algebra and the
  trivial adjoint action give modulus one.
- `adjointModulus_q3_upper`, `adjointModulus_f3Laurent_upper` — the upper Borel of
  `GL₂(ℚ₃)` and `GL₂(𝔽₃((t)))` has both adjoint modulus and modular character `1/3`
  at `diag(ϖ,1)`.
- `adjointModulus_q3_opposite`, `adjointModulus_f3Laurent_opposite` — the lower Borel
  gives `3` on those same matrices, detecting the root and Haar convention.
- `nonreduced_modulus_uses_weight_spaces` (computation) — in `SU_3` the positive weight
  multiplicities are `2, 1`, so on a cocharacter with `a(λ) = 1` the exponent is `2·1 + 1·2 = 4`;
  using `dim U_a = 3` would give `5`. The Lean example computes both values.

The ramified quadratic norm-one example exports `NormTorus.quadratic_isCompact` and
`NormTorus.ramified_compact_parahoric_index`: for a local field of odd residue characteristic
and `L=E(√ϖ)`, the rational points are compact and the connected parahoric has index two.
The latter includes both conclusions on the same `NormTorus.coordinateHopf E L`, with the
parahoric `quadraticValuation`. Its proof uses the norm valuation and
`LevelSubgroups.normOneTorus_parahoric_index` ([Haines–Rapoport], proof of Prop. 3(a), p. 2).
SR consumes these stable names to compare ordinary and weakly unramified characters.

**Checks.**

- `ramified_compact_parahoric_index_odd` — the compact torus has one ordinary
  unramified character and two characters trivial on its connected parahoric; the
  compactness/index pair is the RG2 input to SR's character and category Checks.

**Non-injectivity of the Kottwitz map for proper Levis.** (*levi-kottwitz-kernel*) Let `G` be adjoint
and `ℚ_p`-simple, `P ⊊ G` a `ℚ_p`-parabolic with Levi `M`, and `φ` the Frobenius. The map
`ι : π₁(M)_I^φ → π₁(G)_I^φ` is not injective; its kernel has positive rank, because `X_*(A_M)`, for
`A_M ≠ 1` the split centre of `M`, injects into `π₁(M)_I^φ ⊗ ℚ`, while `π₁(G)_I^φ` is finite since
`G` is adjoint ([Gleason–Lim–Xu], Lem. 4.12 and its proof, with (4.15), p. 31 (the argument there
uses θ_P, the sum of the coroots of P, in place of X_*(A_M))). *Needs:* RG2.1
*algebraic-fundamental-group*; *iwahori-weyl-exact-sequences*; *kottwitz-quotient*.

**Rational coset spaces are infinite.** (*split-torus-coset-infinitude*) Let `G` be a group over `ℚ_p`
with a nontrivial `ℚ_p`-split torus `S`, and `K ⊂ G(ℚ_p)` compact open. First, `S(ℚ_p) ∩ K` is
compact, hence contained in `S(ℤ_p) = S(ℚ_p)_b = ker(v : S(ℚ_p) → X_*(S))`, where
`χ(v(s)) = −ω(χ(s))`; therefore `λ ↦ λ(p)K`, `X_*(S) → G(ℚ_p)/K`, is injective. Second, `G(ℚ_p)/K`
is infinite. If additionally `K ≤ ker κ_G`, Kottwitz descends to
`ω_G : G(ℚ_p)/K → π₁(G)_I^φ`; for `G` adjoint this map to a finite group is not
injective: both the coset space and the Cartan set are infinite ([Gleason–Lim–Xu], Prop. 4.11, p. 29,
the displayed maps (4.12)–(4.13) in part (II) of its proof, pp. 30–31, and Lem. 4.12, p. 31).
*Needs:* *cartan-decomposition*; RG2.0 *integral-points-compact-open*; RG2.1
*algebraic-fundamental-group*.

**Checks.**

- `kottwitzCoset_full_edge_fixer` — in `PGL₂`, `τ=class(0 1;ϖ 0)` has order two,
  normalizes the connected Iwahori `I`, and has `κ(τ)=1∈ℤ/2`. The compact open full
  edge fixer `K=I∪τI` fails `K≤ker κ`; `τK=K` forbids an unquotiented descended map.
- `kottwitzCoset_connected_iwahori` — the same connected `I` lies in `ker κ`, so
  `G/I → π₁(G)_I^φ` is defined. For arbitrary compact open `K`, use the quotient
  of the target by `κ(K)` instead; infinitude of `G/K` is unchanged.
- `cartan_unramified_normOne` — for the norm-one torus of an unramified quadratic
  extension, `X_*(T)_I=ℤ`, Frobenius acts by `−1`, and its fixed subgroup is zero.
  Rational points are compact and equal the connected parahoric, so the rational
  Cartan set is a singleton, although the completed-unramified translation group is infinite.

**Transport of root combinatorics to an unramified comparison group.** (*unramified-combinatorial-comparison*)
Let `G` be quasi-split, adjoint and simple over `ℚ_p` (or `E`), with `W̃` over `L` and `σ` preserving the base
alcove. First, some unramified adjoint group `G'` over `ℚ_p` has `(W̃', σ') ≅ (W̃, σ)`, matching `Σ`
with the absolute roots of `G'`, `X_*(T)_I` with `X_*(T')`, `π₁(G)_I` with `π₁(G')`, lengths, Bruhat
orders, Levi subsets (`σ`-stable sets of simple reflections), and dominant `μ̄` with dominant `μ'`
such that `Adm(μ) ↔ Adm(μ')` with equal `(κ, ν)`. Second, for a `σ`-stable lattice `Λ` with
`Q^∨ ⊆ Λ ⊆ P^∨` (the coroot and coweight lattices of `Σ`; for instance `X_*(T)_I` modulo torsion),
the groups `W_a = W_{Q^∨} ⊆ W_Λ = Λ ⋊ W(Σ) ⊆ W_{P^∨}` have compatible lengths, Bruhat orders (on
equal `P^∨/Q^∨`-components), pairings `⟨·, 2ρ⟩`, dominance, positive coroots and `σ`-actions, so
results for `P^∨` (the adjoint case) or `Q^∨` (the simply connected case) transfer along the chain
([van Hoften], §A.3.2, p. 69; [He 2021], §4.1, footnote 1, p. 7 (a reference to He 2014, §6; not a
proof); [Haines–Rapoport], Lem. 15, p. 9). *Needs:* *dominant-coinvariant-cocharacters*;
*translation-length-formula*; *length-and-bruhat-order*; *admissible-set*.

**Checks.**

- `unramifiedComparison_split_A1` — split `PGL₂` compares to itself; the identity on
  the two affine simple reflections intertwines their trivial Frobenius actions.
- `unramifiedComparison_inner_A1_rejected` — for quaternionic `PGL₁(D)`, Frobenius
  interchanges `s₀,s₁`. No bijection of these two reflections intertwines this action
  with the identity action of split `PGL₂`. Splitting over an unramified extension
  does not imply the quasi-split hypothesis of this comparison.

**Generation of parahoric and hyperspecial points by root groups and the torus.** (*hyperspecial-generation*)
First, for every point `x` of the apartment, the parahoric subgroup `𝒢°_x(O)` is generated by
`Z(K)_0 = 𝒢°_x(O) ∩ Z(K)` and its root-group parts `𝒢°_x(O) ∩ U_a(K) = U_{a,x}` ([Bruhat–Tits II],
5.2.4, p. 164). Next let `𝒢` be a split reductive group over a strictly henselian DVR `O_L` (or over
`O`), pinned by `(𝒯, 𝒰_a ≅ G_a)`, with `𝒢(O_L)` hyperspecial at `x_0`, and let `I_C` be the Iwahori of
an alcove `C` with `x_0 ∈ C̄`. Second, `𝒢(O_L) = ⟨𝒯(O_L), 𝒰_a(O_L) : a ∈ Φ⟩`, the first statement at
`x_0`. Third, `𝒢(O_L) = ⟨𝒢_a(O_L) : a ∈ Φ⟩` with `𝒢_a = ⟨𝒯, 𝒰_a, 𝒰_{-a}⟩`; a base `Δ` together with
`𝒯` suffices, since every root is `W_0`-conjugate to a simple one and the Weyl representatives
`w_a(1) = u_a(1)u_{-a}(−1)u_a(1)` lie in `𝒢_a(O_L)`; for `Φ = ∅` the group is `𝒯(O_L)`. Fourth, via the
factorization `I_C = (I_C ∩ 𝒰^-)(I_C ∩ 𝒯)(I_C ∩ 𝒰)` and the decomposition
`𝒢(O_L) = ⊔_{W_0} I_CẇI_C` (whose reduction is `𝒢(κ)`), each cell lies in the generated subgroup. In
`BruhatTits.Decomposition`, prove `parahoric_closure_torus_rootGroups` (the first statement)
([Bruhat–Tits II], 5.2.4, p. 164; [Bruhat–Tits I], Prop. (6.4.9), p. 136 (the factorization), and
Théorème (7.3.4), p. 165 (the Bruhat decomposition)). *Needs:* *iwahori-factorization*; RG2.3
*hyperspecial-vertices*; *parahoric-double-cosets*; RG2.3
*pro-unipotent-radical-and-nested-facets*; RG2.0 *smooth-model-congruence-quotients*.

### Examples

**Decompositions for GL_n.** (*gl-n-decompositions*) Assume `n ≥ 1`. Let `B` be the upper triangular Borel of `GL_n`
and `K = GL_n(O)`. First, `GL_n(E) = ⊔ Kϖ^λK` over `λ_1 ≥ ⋯ ≥ λ_n` in `ℤ^n`, with
`ϖ^λ = diag(ϖ^{λ_i})`; the `λ` of `g` are the elementary divisors of `gO^n`. Second,
`GL_n(E) = KB(E) = B(E)K`, `GL_n(E)/B(E)` is compact, and the Iwasawa cells are `KẇU(E)` for
`w ∈ ℤ^n`. Third, `GL_n(E) = ⊔ IẇI` with `W̃ = ℤ^n ⋊ S_n` and `Ω = ⟨τ⟩ ≅ ℤ`, where `τ` cycles the
vertices of the alcove and `τ^n` is the central translation by `±(1,…,1)`, and `#(IẇI/I) = q^{ℓ(w)}`.
Fourth, for `k` perfect, `GL_n(W(k))` acts transitively on `Gr_μ(k) = {lattices in position μ to
W(k)^n}`, and `Gr(k) = ⊔_{μ dom} Gr_μ(k)`. Fifth, `[Kϖ^{(1,0,…,0)}K : K] = (q^n − 1)/(q − 1)`, the
number of hyperplanes in `𝔽_q^n`, and `[Kϖ^λK : K] = q^{⟨λ, 2ρ⟩}(1 + O(q^{-1}))`, the number of lattices
`Λ ⊂ E^n` of type `λ` (contained in `O^n` when all `λ_i ≥ 0`) ([Zhu], Lem. 1.8 and (1.2.3), p. 11, and §0.5, pp. 6–7; [Garrett], §17.5,
p. 297). The index formulas in (5) are computed here from the lattices of a given elementary-divisor
type and are not taken from a source. *Needs:* *cartan-decomposition*; *iwasawa-decomposition*;
*iwahori-bruhat-decomposition*; *compact-double-coset-finiteness*; Mathlib
`Module.Basis.SmithNormalForm`; Tau Ceti `TauCeti.GeneralLinear.pointsMulEquiv`,
`TauCeti.Module.equiv_pi_prod_pi_quotient_span_pow`.

**Rank-one and nonsplit Cartan sets.** (*rank-one-and-nonsplit-examples*) First, for `SL_2` with
`K = SL_2(O)`, the Cartan set corresponds to `ℕ` via `diag(ϖ^n, ϖ^{-n})`, with index
`(q + 1)q^{2n−1}` for `n ≥ 1`: these are the vertices at distance `2n` in the `(q+1)`-regular tree.
Second, for `PGL_2` with `K = PGL_2(O)`, it corresponds to `ℕ` via `diag(ϖ^n, 1)`, with index
`(q + 1)q^{n−1}` for `n ≥ 1`; odd `n` map nontrivially to `π₁ = ℤ/2`; the element of order `2` in `Ω`
swaps the vertices of the base edge, which `SL_2(E)` cannot do. Third, for the unramified `U_3`,
whose tree is `(q^3+1, q+1)`-biregular, with `K` hyperspecial of valency `q^3+1`, the Cartan set
corresponds to `ℕ` via `λ_n = diag(ϖ^n, 1, ϖ^{-n})`, with index `(q^3+1)q^{4n−3}` for `n ≥ 1`, and
`2n = ℓ_E(t^{λ_n})` whereas `4n = ℓ_L(t^{λ_n})` (the weighted length;
`dim g_a = 2`, `dim g_{2a} = 1`); this is the case
where the index formula of the first statement fails, the tree being biregular. Fourth, for the
ramified `SU_3` with `p` odd, the walls of the apartment are `¼ℤ` (those of `a` at `½ℤ`, those of
`2a` at `¼ + ½ℤ`), both vertices of the base alcove are special with three-dimensional rank-one
reductive quotients (the `a`-type vertex sees the root `a`, the `2a`-type vertex the root `2a`,
each with a one-dimensional root space), so the tree is `(q+1)`-regular; `G(E)` acts
type-preservingly (`Ω = 1`), `K_i\G/K_i` corresponds to `ℕ` at both vertices (since
`X_*(T)_I ≅ ℤ` modulo `W_0 = ℤ/2`, the generating translation `½` moving a vertex to distance `2`),
and the index of `t^n` is `(q + 1)q^{2n−1}` at both, exactly as for `SL_2`: the index formula is a
property of the tree, not of splitness. All four Cartan sets are infinite ([Garrett], §17.5 (Bruhat and Cartan decompositions), p. 297;
[Haines–Rapoport], Prop. 8, p. 4, Lem. 14 and Lem. 15, p. 9; [Bruhat–Tits I], Prop. (4.4.3) and §4.4,
pp. 79–80). The indices in (1)–(4) and the wall pattern of the ramified `SU_3` are computed here from the tree
(see *sl2-tree*), the value sets of *unitary-rank-one-example* and the Iwahori factorization; [Garrett]
is cited for the decompositions only. [Tits], §1.15, formulas (9)–(10), p. 42, gives
the rank-one vertex weights `3,1` in the unramified case and `1,1` in the ramified case;
counting paths in the resulting trees gives the displayed indices. This distinguishes
relative Coxeter length from the unramified weighted length. *Needs:*
*cartan-decomposition*; RG2.1 *unitary-rank-one-example*; *double-coset-cardinalities*;
*compact-double-coset-finiteness*; RG2.3 *hyperspecial-vertices*; *translation-length-formula*.

### Dependencies

RG2.0 (the point topology, compact open integral points and congruence neighbourhood bases), RG2.1
(the apartment, affine chamber structure, affine Weyl group, échelonnage system, Kottwitz
homomorphism and fundamental group), RG2.2 (stabilizers and fixers in the building) and RG2.3
(parahoric subgroups, Néron models, Moy–Prasad filtrations, hyperspecial vertices and
Frobenius-fixed coset lifting). Outside this roadmap: ReductiveGroups layers 6–7, RootSystems layer 3,
Tau Ceti's `TauCeti.TitsSystem`, `CoxeterSystem.BruhatLE` and
`DoubleCoset.doubleCoset_eq_iUnion_leftCosets`, and Mathlib's `CoxeterSystem`,
`DoubleCoset.Quotient`, `QuotientGroup.lift`, `SemidirectProduct`, Haar measures and
`MeasureTheory.Measure.modularCharacter`.

## Layer RG2.5: integral dual data

The dual based root datum is the flip of the absolute based root datum of `G` with the transported
Galois action; the Langlands dual group `Ĝ` is the pinned split reductive group over `ℤ` attached to
it by the Chevalley–Demazure construction of the Reductive groups roadmap, layer 9, and the Galois
group acts on `Ĝ` through pinned automorphisms with finite image. The L-group `ᴸG = Ĝ ⋊ Γ` is a
group functor over `ℤ` with its projection, inclusion and action law, in its finite Galois, absolute
Galois and Weil forms; the layer proves its independence of all choices, identifies the centre of
`Ĝ` with `π₁(G)`, defines the point subgroups attached to Galois-stable based Levi subsets, describes
the duals of central isogenies, products and Weil restrictions and the cocharacter lattices of
z-extensions, and checks the examples (tori, `GL_n`, `SL_n ↔ PGL_n`, the norm-one torus, the
quasi-split unitary groups and the self-duality of `GSp_4`). [Buzzard–Gee] and [Kaletha] define `Ĝ`
over `ℚ̄` and over `ℂ`; the integral group is the pinned split reductive `ℤ`-group of
[Conrad RGS], Theorem 6.1.16(2), p. 196, and Theorem 6.1.17, p. 197, whose base change recovers
theirs. No square root of `q` enters: normalizations used by Satake transforms are coefficient
choices of the consumers. Spaces of Langlands parameters, including the comparison of parameters of
a Weil restriction with those of the original group (Shapiro's lemma), are not part of this
roadmap; nor is the dual embedding `Ĝ ↪ Ĝ̃` of a z-extension `G̃ → G` as a morphism of `ℤ`-group
schemes.

### RG2.5.1 the dual group and its Galois action

`AbsoluteRootData` identifies its lattice with the pinned geometric character group of an
actual maximal torus of the reductive Hopf algebra. Its dual lattice is the integral dual,
the pairing is evaluation, and the roots are the nonzero weights of the differentiated
adjoint action. The coroot reflections are realized by the normalizer on torus characters.
The based Galois action agrees with the actual action on `X^*(T)` up to Weyl transport
([Springer], §3.2, p. 12); for a quasi-split group the actual action already preserves the base
attached to a Borel subgroup defined over `K` ([Bruhat–Tits II], 4.1.2, p. 77). Because the lattices
are those of an actual torus, the trivial group admits only the datum of rank zero
(`AbsoluteRootData.character_rank_zero`).

**The dual based root datum with its Galois action.** (*dual-based-root-datum*) Let
`Ψ_0(G) = (X^*, Δ, X_*, Δ^∨)` be the absolute based root datum of `G` and
`μ_G : Γ_K → Aut(Ψ_0(G))` its base-preserving Galois action. The dual
`Ψ_0(G)^∨ := (X_*, Δ^∨, X^*, Δ)` is the `ℤ`-root-pairing flip of `Ψ_0(G)` (roots and coroots, `X^*`
and `X_*` exchanged) with the base flipped. There is a canonical isomorphism
`Aut(Ψ_0(G)) ≅ Aut(Ψ_0(G)^∨)` with the same index permutation, sending `f` to the automorphism whose
map on `X_*` is the transpose-inverse `(f_X^t)^{-1}` of the map `f_X` of `f` on `X^*`; the inverse
is needed because the transpose `f_X^t` alone reverses composition ([Buzzard–Gee], §2.1, p. 5).
In Mathlib's convention the coweight map `f.coweightEquiv : X_* → X_*` of an automorphism is the
contravariant transpose `f_X^t`, so the weight map of the image of `f` is `f.coweightEquiv.symm`.
The dual action `μ̂_G`, the composite of this isomorphism with `μ_G`,
preserves the dual base and factors through `Gal(K'/K)` for a finite Galois splitting field `K'`,
so it has finite image and open kernel. `AbsoluteRootData` records a reduced `RootPairing`,
its base, a finite Galois `splittingField`, the action `splittingAction` of its Galois group, and
`galoisAction_factor`, identifying the absolute action with restriction followed by that action.
Use `RootPairing.flip` and `RootPairing.Base.flip` directly for the dual datum and base.
In `LanglandsDual`, define `autFlip` as `Aut(Ψ) ≃* Aut(Ψ^∨)` and `dualGaloisAction` as
`μ̂_G = autFlip ∘ μ_G : Γ_K →* Aut(Ψ^∨)`; prove
`autFlip_indexEquiv` (`autFlip f` permutes the index set as `f` does), `autFlip_weightEquiv`
(the weight map of `autFlip f` is `f.coweightEquiv.symm`; since an automorphism is determined by
its weight map, this determines `autFlip`),
`dualGaloisAction_preserves_dualBase` (if `μ_G` preserves `Δ` then `μ̂_G` preserves `Δ^∨`) and
`dualGaloisAction_finite` (`μ̂_G` has finite image) ([Buzzard–Gee], §2.1, pp. 4–5; [Kaletha], §5.6,
pp. 46–47). *Needs:* ReductiveGroups layer 7; Mathlib `RootPairing.flip`, `RootPairing.Base.flip`,
`RootPairing.Aut`, `RootPairing.Equiv.weightEquiv`, `RootPairing.Equiv.coweightEquiv`,
`Field.absoluteGaloisGroup`.

**Checks.**

- `autFlip_reflection` — the image of the reflection in `α_i` is the reflection in `α_i^∨` of the
  flipped pairing.
- `autFlip_pairing` — `f` on `X^*` and `autFlip f` on `X_*` preserve the evaluation pairing,
  `⟨f x, (autFlip f) y⟩ = ⟨x, y⟩`: `autFlip f` acts on `X_*` by the contragredient of `f`.
- `dualRootDatum_gl_n` — for `GL_n` with its diagonal torus (`X^* = X_* = ℤ^n`, roots and coroots
  `e_i − e_j`, pairing the dot product) the flip is isomorphic to the datum itself by an
  isomorphism that is the identity on indices: `GL_n` is self-dual.
- `dualGaloisAction_split` — if `μ_G` is trivial (an inner form of a split group) then `μ̂_G` is
  trivial.
- `AbsoluteRootData.character_rank_zero` — if the geometric character group of the torus is zero,
  so is `X`.
- `AbsoluteRootData.cocharacter_rank_zero` — likewise for `Y`.
- `transpose_antiHom` (non-example) — the transpose without the inverse, `f ↦ (autFlip f)^{-1}`,
  whose map on `X_*` is `f.coweightEquiv = f_X^t`, satisfies `(fg)^t = g^t f^t`; on two automorphisms
  that do not commute (for instance in the group `S_3` of graph automorphisms of type `D_4`) it is
  not multiplicative.

**The Langlands dual group over ℤ.** (*langlands-dual-group*) `Ĝ` is the pinned split reductive
`ℤ`-group scheme of `Ψ_0(G)^∨` given by the Chevalley–Demazure construction: a reductive group over
`ℤ` in the sense of [Conrad RGS], Definition 3.1.1, p. 81 (smooth and affine, with connected
reductive geometric fibres), with root datum `Ψ_0(G)^∨` ([Conrad RGS], Theorem 6.1.16(2), p. 196,
for existence and Theorem 6.1.17, p. 197, for uniqueness of the pinned group), a split maximal torus
`T̂` with character group `X_*(T)` and `T̂(R) = Hom(X_*(T), R^×)`, a Borel `B̂ ⊃ T̂` with simple roots
`Δ^∨`, for each root `α` of `G` a root subgroup `x_{α^∨} : G_a → Ĝ` with
`t x_{α^∨}(r) t⁻¹ = x_{α^∨}(α^∨(t) r)`, and the pinning `(T̂, B̂, (x_{α^∨})_{α∈Δ})`. Over `ℚ̄` this is
the dual group of [Buzzard–Gee], §2.1, pp. 4–5. No `√q`, nor any other root of an integer, is
adjoined: Satake normalizations are the users' choice and not part of `Ĝ` ([Buzzard–Gee], §2.2,
p. 10, for the `√p` that the canonical normalization of the Satake isomorphism introduces). In `LanglandsDual`, define
`dualGroup` as the Hopf `ℤ`-algebra of `Ĝ` built from `Ψ_0(G)^∨`, `dualTorus` as the Hopf
`ℤ`-algebra `ℤ[X_*(T)]` of `T̂`, `dualTorusInclusion` as `T̂(R) → Ĝ(R)` and `dualRootSubgroup` as
`x_{α_i^∨} : (R,+) → Ĝ(R)` for each root `i`. The pinning enters the Lean statements through the
torus inclusion and the root groups `dualRootSubgroup D R i` for `i` in the chosen base. For a
non-simple root the pinning fixes `dualRootSubgroup D R i` only up to `r ↦ −r`; the statements that
use it for every root (injectivity, the conjugation relation, the Levi subgroups) do not depend on
that sign. Use `TauCeti.DiagonalizableGroup.pointsMulEquiv` for `T̂(R) ≃* Hom(X_*(T), R^×)`; prove
`dualTorusInclusion_injective` and `dualRootSubgroup_injective` (both are closed immersions, hence
injective on points), `dualTorusInclusion_natural` and `dualRootSubgroup_natural` (naturality in
`R`: both come from morphisms of `ℤ`-group schemes), `dualRootSubgroup_conj`
(`t x_{α^∨}(r) t⁻¹ = x_{α^∨}(α^∨(t) r)`), `dualGroup_smooth` (`Ĝ` is smooth over `ℤ`),
`dualGroup_reductive_fibres` (`Ĝ_k` is connected reductive for every field `k`) and
`dualGroup_torus_points` (for a torus, `Ĝ(R) ≃* Hom(X_*(T), R^×)`). *Needs:*
*dual-based-root-datum*; ReductiveGroups layer 9; Mathlib `CommHopfAlgCat`; Tau Ceti
`TauCeti.DiagonalizableGroup.pointsMulEquiv`, `TauCeti.AlgHom.mapValue`.

**Checks.**

- `dualGroup_gl_n` — for `G = GL_n` with its diagonal torus, `Ĝ(R) ≃* GL_n(R)`: `Ĝ = GL_n` over `ℤ`
  with the standard pinning.
- `dualRootSubgroup_gl_n` — for the same `GL_n`, there is an isomorphism `Ĝ(R) ≅ GL_n(R)` sending
  `t ∈ T̂(R)` to `diag(t(e_1), …, t(e_n))` and, for a simple coroot `e_k − e_l`, the root group
  `x_{e_k−e_l}(r)` to the elementary matrix `1 + rE_{kl}`.
- `dualRootSubgroup_not_in_torus` (non-example) — `x_{α^∨}(1) ∉ T̂(ℚ)`: conjugation by a `t` with
  `α^∨(t) = 4` moves it, while `T̂(ℚ)` is commutative.
- `dualRootSubgroup_opposite` (non-example) — the root groups of `α^∨` and of `−α^∨` (the index
  `s_α(α)`) meet only in the identity, over every ring.
- `dualTorus_points` — `T̂(A) ≃* Hom(X_*(T), A^×)`, by Tau Ceti's
  `TauCeti.DiagonalizableGroup.pointsMulEquiv`.
- `dualTorus_rank_zero` — if `X_*(T) = 0` (the trivial group), `T̂(A)` is a single point.
- `dualTorus_rank_one` — if `X_*(T) ≅ ℤ` (for instance `G_m` or a norm-one torus), `T̂(A) ≃* A^×`.
- `dualGroup_torus` — for `G` a torus (no roots), `T̂(R) → Ĝ(R)` is bijective, so `Ĝ = T̂` and
  `Ĝ(R) = Hom(X_*(T), R^×)`.
- `dualGroup_rootCount` (non-example) — the trivial group and `G_m` both have no roots, but their
  cocharacter ranks are `0` and `1`; the Lean example proves that `Ĝ(ℚ)` is trivial for the first
  and not for the second, so the dual groups differ although the root index sets are in bijection.
- `dualGroup_not_self` (non-example) — `Ĝ ≠ G` in general: if `π₁(G) ≅ ℤ/2`, as for `PGL_2` (whose
  dual is `SL_2`), the centre of `Ĝ(ℂ)` has two elements, while `PGL_2(ℂ)` has trivial centre; so
  the Chevalley group of `Ψ_0(G)` itself is the wrong group.

**Pinned automorphisms of the dual group.** (*pinned-automorphisms*) (1) `Aut(Ĝ, pinning) ≅ Aut(Ψ_0(G)^∨, Δ^∨)`:
this is the automorphism case of the isomorphism theorem for pinned groups of the Reductive groups
roadmap, layer 9, applied to `Ψ_0(G)^∨`; the integral source is [Conrad RGS],
Theorem 6.1.17, p. 197. (2) Over every field `k`,
`Aut_k(Ĝ_k) = Ĝ^ad(k) ⋊ Aut(Ĝ, pinning)` with `Ĝ^ad = Ĝ/Z_Ĝ` ([Conrad RGS], Proposition 7.1.6,
pp. 243–244).
The first factor consists of adjoint rational points; it need not be the image of `Ĝ(k)`.
Over an algebraically closed field that image is the whole first factor, recovering the
inner/outer formulation ([Springer], Proposition 2.13 and Corollary 2.14, p. 10).
(3) The adjoint group acts simply transitively on pinnings: after conjugating `(B,T)`,
rescaling the simple-root vectors is the simply transitive action of `(T/Z)(k)`
([Conrad RGS], the discussion before Proposition 7.1.6, pp. 242–243). The scheme-level
semidirect product is Theorem 7.1.9(3), p. 246. The lift acts on `Ĝ(R)` for every ring `R` and is
faithful on `Ĝ(R)` for `R` an infinite field, but not for every `R`: on `Ĝ(ℤ) = {±1}` or
`Ĝ(F_2) = 1` for `Ĝ = G_m` the inversion acts trivially (`pinnedLift_exists`,
`pinnedLift_injective`, `pinnedLift_not_injective`). The domain `basedAutomorphisms D` is Mathlib's
`MulAction.stabilizer` of `D.base.support` for the action of `Aut(D.Ψ.flip)` on root indices; Weyl
automorphisms are excluded. *Needs:* *langlands-dual-group*; ReductiveGroups layers 7 and 9;
Mathlib `MulAction.stabilizer`; Tau Ceti `TauCeti.Pinning`.

**Checks.**

- `adjoint_real_point_not_from_sl2` — the class of `diag(−1,1)` in `PGL_2(ℝ)` has no lift to `SL_2(ℝ)`: every scalar representative has determinant `−c²`, never `1` (a matrix computation). This distinguishes adjoint rational points from conjugation by rational points of the original group.
- `basedAutomorphisms_identity` — the identity preserves the base.
- `basedAutomorphisms_galois` — every `μ̂_G(γ)` lies in the stabilizer, because `μ_G(γ)` preserves
  the base.
- `basedAutomorphisms_empty_base` — for an empty base (a torus) the stabilizer is the whole
  automorphism group.
- `basedAutomorphisms_reflection_excluded` (non-example) — the reflection in a simple coroot
  `α_i^∨` sends it to `−α_i^∨`, which is not simple, so it is not in the stabilizer: a Weyl lift
  `Int(n)` preserves `T̂` but not `B̂`, so it is not pinned, and a Galois action twisted by Weyl
  elements would define a different L-group.
- `pinnedLift_not_injective` (non-example) — for a torus, `Ĝ(F_2) = Hom(X_*(T), F_2^×)` is
  trivial, so every homomorphism from the based automorphisms to `Aut(Ĝ(F_2))` is constant,
  although `−1` is a nontrivial based automorphism once the rank is positive.

**The Galois action on the dual group.** (*galois-action-on-dual-group*) Define
`μ̂_G : Γ_K → Aut(Ĝ, pinning)` as the pinned lift composed with the dual Galois action. Then `Γ_K`
acts on each `Ĝ(R)` by automorphisms preserving `T̂(R)`, `B̂(R)` and the pinning, naturally in `R`,
with open kernel and finite image (through a finite splitting field); on `T̂(R) = Hom(X_*(T), R^×)`
it is the left action `(γ·t)(y) = t(γ⁻¹y)` by precomposition, the one for which
`X^*(T̂) = X_*(T)` is `Γ_K`-equivariant. The action on `Ĝ` is trivial iff `μ_G` is: if `μ_G` is
trivial, `Γ_K` acts trivially on `Ĝ(R)` for every ring `R` (`galoisAction_split`), and conversely a
trivial action on `Ĝ(R)` for one infinite field `R` forces `μ_G` to be trivial
(`pinnedLift_injective`); `μ_G` is trivial iff `G` is an inner form of a split group ([Springer],
§3.2, p. 12). The Weil form is the pull-back along
`W_K → Γ_K`, or along any `Γ' → Γ_K`. In `LanglandsDual`, define `galoisActionOnPinned` as
`μ̂_G : Γ_K →* Stab_{Aut(Ψ^∨)}(Δ^∨)`, the corestriction of `dualGaloisAction`, `galoisActionOnPoints`
as `Γ_K →* MulAut(Ĝ(R))` for each ring `R`, and `weilActionOnPoints` as the pull-back along
`W → Γ_K` for a Weil group `W`; prove
`pinnedLift_exists` (the action is a lift of `galoisActionOnPinned` through based automorphisms),
`galoisActionOnPoints_finite` (an open subgroup of `Γ_K` acts trivially), `galoisActionOnPoints_torus`
(the precomposition formula, so `T̂(R) ⊂ Ĝ(R)` is preserved), `galoisActionOnPoints_rootSubgroup`
(`γ · x_{α_i^∨}(r) = x_{α_{γi}^∨}(r)` for `α_i` simple: the pinning is preserved) and
`galoisActionOnPoints_natural` (it commutes with `Ĝ(R) → Ĝ(R')` for `R → R'`) ([Buzzard–Gee], §2.1,
p. 5; [Kaletha], §2, p. 9 (notation), and §5.6, p. 46). *Needs:* *pinned-automorphisms*;
*dual-based-root-datum*; Mathlib `Field.absoluteGaloisGroup`, `OpenSubgroup`,
`MonoidHom.codRestrict`; Tau Ceti `TauCeti.AlgHom.mapValue`; ClassFieldTheory layer 9.

**Checks.**

- `galoisAction_split` — if `μ_G` is trivial then `Γ_K` acts trivially on `Ĝ(R)`.
- `galoisActionOnPoints_torus_direction` — if `γ` carries `y_1` to `y_2` in `X_*(T)`, then `γ·t`
  takes at `y_2` the value `t` takes at `y_1`, not the value at `γ y_2`.
- `galoisAction_unitary` — for a quasi-split unitary group, with the absolute datum of `GL_n` and an
  element `γ` acting on `X^* = ℤ^n` by `(a_k) ↦ (−a_{n+1−k})`, `γ` acts on `Ĝ(R) ≅ GL_n(R)` by
  `g ↦ J (g^t)⁻¹ J⁻¹`, where `J` is antidiagonal with entries `1, −1, 1, …` from the top row. This
  involution preserves the diagonal torus, the upper triangular Borel subgroup and the simple root
  groups `1 + rE_{k,k+1}` with their parameters ([Conrad RGS], Example 7.1.5, p. 243, for the same
  formula on `SL_n`, and Example 7.1.10, p. 247, for its compatibility with the standard pinning).
  For `n = 1` this is the quadratic norm-one torus, with `γ` acting on `Ĝ = G_m` by inversion.
- `weilActionOnPoints_split` — if `μ_G` is trivial, the action pulled back along any `W → Γ_K` is
  trivial.
- `weilActionOnPoints_trivial_map` — along the trivial homomorphism `W → Γ_K` the action is
  trivial, whatever `μ_G` is.
- `weilActionOnPoints_open_kernel` — the preimage in `W` of an open subgroup of `Γ_K` acts
  trivially.

### RG2.5.2 the L-group and its functoriality

**The L-group.** (*l-group*) Use `Γ = Γ_K` itself for the Galois form, the quotient `Γ = Gal(K'/K)` through which the action
factors for the finite form, or pull back along `W_K → Γ_K` for the Weil form. Define
`^LG(R) := Ĝ(R) ⋊ Γ` via `μ̂_G`, with `(g,γ)(g',γ') = (g μ̂_G(γ)g', γγ')`, the projection
`pr : ^LG(R) ↠ Γ` with kernel `Ĝ(R)`, and the section `γ ↦ (1,γ)`, all natural in `R`. The finite form
is an affine `ℤ`-group scheme with `(ᴸG)° = Ĝ` and `π_0 = Gal(K'/K)`; the Galois form is its
inflation and the Weil form its pull-back to `W_K`. No `√q` enters. In `LanglandsDual`, define
`LGroup` as `^LG(R) = Ĝ(R) ⋊ Γ_K`, the Galois form, and use
`SemidirectProduct.rightHom`, `SemidirectProduct.inl` and `SemidirectProduct.inr` for its projection,
inclusion and section, and `SemidirectProduct.rightHom_surjective`,
`SemidirectProduct.range_inl_eq_ker_rightHom` and `SemidirectProduct.mul_left` for surjectivity,
the kernel and the multiplication law. Define `mapCoeff`, the map `^LG(R) →* ^LG(R')` induced by
`R → R'`, as `SemidirectProduct.map` of `TauCeti.AlgHom.mapValue` and the identity, whose
compatibility condition is `galoisActionOnPoints_natural`; `SemidirectProduct.rightHom_comp_map`
says that it lies over `Γ_K`. Define `WeilLGroup` as `Ĝ(R) ⋊ W` for a homomorphism `W → Γ_K`. For
an open normal subgroup `U` of `Γ_K` contained in the kernel of the action, the finite action of
`Γ_K/U` is `QuotientGroup.lift` of `galoisActionOnPoints`, and the inflation
`^LG(R) → Ĝ(R) ⋊ Γ_K/U` is `SemidirectProduct.map` of the identity and `QuotientGroup.mk'`
([Buzzard–Gee], §2.1, p. 5; [Kaletha], §2, p. 9). *Needs:* *galois-action-on-dual-group*; Mathlib
`SemidirectProduct`, `SemidirectProduct.rightHom`, `SemidirectProduct.range_inl_eq_ker_rightHom`,
`SemidirectProduct.rightHom_surjective`, `SemidirectProduct.map`,
`SemidirectProduct.rightHom_comp_map`, `QuotientGroup.lift`; ClassFieldTheory layer 9.

**Checks.**

- `LGroup_split_prod` — if `μ_G` is trivial (for instance for `GL_n`) then
  `^LG(R) ≃* Ĝ(R) × Γ_K` over `Γ_K`.
- `LGroup_trivial` — for a torus, `Ĝ(F_2)` is trivial and `pr` is an isomorphism `^LG(F_2) ≃* Γ_K`.
- `LGroup_not_direct_product` (non-example) — if `μ_G(γ) ≠ 1` (the unitary case), then over an
  infinite field `R` the section does not commute with `Ĝ(R)`, so there is no direct product.
- `mapCoeff_rightHom` — `mapCoeff` lies over `Γ_K`.
- `mapCoeff_id` — the identity of `R` induces the identity of `^LG(R)`.
- `mapCoeff_comp` — `mapCoeff (g ∘ f) = mapCoeff g ∘ mapCoeff f`.
- `WeilLGroup_toLGroup` — for `w : W → Γ_K` there is a homomorphism `Ĝ(R) ⋊ W → ^LG(R)` lying over
  `w`, injective when `w` is.
- `WeilLGroup_split_prod` — if `μ_G` is trivial, `Ĝ(R) ⋊ W ≃* Ĝ(R) × W` over `W`.
- `WeilLGroup_trivial` — for a torus, the projection `Ĝ(F_2) ⋊ W → W` is an isomorphism.

**Independence of the L-group from choices.** (*l-group-change-of-pinning*) `^LG` is canonical over
`Γ`: `changeOfPinning` requires an isomorphism of root pairings carrying the
chosen base onto the chosen base and intertwining both Galois actions. (1) `Ψ_0(G)` and `μ_G` are canonical; (2) for two pinned duals `Ĝ`, `Ĝ'` of `Ψ_0(G)^∨`, the unique
pinned isomorphism `Ĝ ≅ Ĝ'` is `Γ`-equivariant, so `^LG ≅ ^LG'` over `Γ`; (3) for two pinnings of
`Ĝ_k` (`k` algebraically closed) with lifts `μ̂`, `μ̂'` and `h ∈ Ĝ(k)` moving one pinning to the other,
`μ̂' = Int(h)μ̂Int(h)⁻¹`, and `(g,γ) ↦ (hgh⁻¹,γ) : ^LG(k) ≅ ^LG'(k)` over `Γ` depends only on `h`
modulo the centre ([Buzzard–Gee], §2.1, pp. 4–5). *Needs:* *l-group*; *pinned-automorphisms*;
ReductiveGroups layer 9.

**Centre of the dual group and π₁.** (*dual-centre-and-fundamental-group*) `Z(Ĝ) ⊂ T̂` is
diagonalizable over `ℤ` with character group `X_*(T)/Q^∨ = π₁(G)`, `Γ_K`-equivariantly; so
`Z(Ĝ)(R) = Hom(π₁(G), R^×)`, naturally in `R`, and this is the centre of `Ĝ(R)` for `R` algebraically
closed. For `I ≤ Γ_K` (for instance inertia), `X^*(Z(Ĝ)^I) = π₁(G)_I`, the target of the Kottwitz
homomorphism. `Z(Ĝ)` is a torus iff `π₁(G)` is torsion-free, that is, iff `G_der` is simply connected,
and finite iff `G` is semisimple ([Kaletha], §5.3, proof of Prop. 5.3, p. 33; [Springer], 2.15,
pp. 10–11: (b) for the character group of the centre, (e) and (f) for a simply connected derived
group and a connected centre, and the criterion stated after (c) for semisimplicity;
[Haines–Rapoport], introduction, (1), p. 1). In `LanglandsDual`, prove
`dualCentreMulEquiv` (for `R` an algebraically closed field, the centre of `Ĝ(R)` is isomorphic to
`Hom(π₁(G), R^×)`). *Needs:* *langlands-dual-group*; *galois-action-on-dual-group*; RG2.1
*algebraic-fundamental-group*; Tau Ceti `TauCeti.CommHopfAlgCat.centerGroupScheme`,
`TauCeti.DiagonalizableGroup.pointsMulEquiv`.

**Standard Levi subgroups on field-valued points.** (*l-group-levi-subgroup*) Fix a field `R`
and a Galois-stable subset `Δ_M` of the chosen simple roots. `LanglandsDual.leviDual` is the
subgroup generated by the dual torus and the root groups in the integral span of `Δ_M`.
`LLevi` is generated inside `^LG(R)` by that subgroup and the Galois section; its signature
requires both containment in the base and stability under every Galois element. Stability makes
`M̂(R)` stable under the Galois action, so the elements of `LLevi` lying in `Ĝ(R)` are exactly
`M̂(R)` and `LLevi = M̂(R) ⋊ Γ_K`. For the full base the field-valued Levi subgroup is all of
`Ĝ(R)`. ([Kaletha], §5.5, proof of Lem. 5.7,
p. 45, for the standard Levi inside the L-group.)
*Needs:* *l-group*; *pinned-automorphisms*; ReductiveGroups layer 7.

**Checks.**

- `leviDual_empty` — the empty set gives the dual torus, since no coroot is `0`.
- `leviDual_full_base` — for the full base over a field, `leviDual = Ĝ(R)`.
- `leviDual_ne_top` (non-example) — with at least one root, the dual torus is a proper subgroup of
  `Ĝ(ℚ)`.
- `LLevi_empty` — the empty subset generates the dual torus together with the Galois section.
- `LLevi_full_base` — the full chosen base gives all of `^LG(R)` over a field.
- `LLevi_comap_inl` — for a Galois-stable `Δ_M` in the base, the elements of `^LM(R)` lying in
  `Ĝ(R)` form `M̂(R)`.
- `LLevi_unstable_rejected` (non-example) — if a Galois element takes an index in `Δ_M`
  outside it, the stability hypothesis cannot hold.

**Dual groups of isogenies, products and z-extensions.** (*dual-isogenies-and-products*) (1) For
`Z ⊂ G` finite central, `Ḡ = G/Z` and `T̄ = T/Z`, the inclusion `X_*(T) ⊂ X_*(T̄)` is a central
isogeny of dual root data, so there is a pinned, `Γ_K`-equivariant central isogeny `Ĝ̄ → Ĝ` whose
kernel is diagonalizable with character group `X_*(T̄)/X_*(T)`, dual to `X^*(T)/X^*(T̄) = X^*(Z)`;
hence `^LḠ → ^LG` over `Γ` ([Kaletha], §5.3, p. 33, for the dual isogeny, and §4.1, pp. 16–17, for
the duality of `X_*(T̄)/X_*(T)` with `X^*(T)/X^*(T̄)`; [Conrad RGS], Theorem 6.1.16(1), p. 196, for
the isogeny over `ℤ`); this is a README-only statement. (2) With a Hopf identification of the
product group, full pairing-compatible lattice isomorphisms, corresponding bases and Galois-equivariant
character maps, `dualGroup_prod` gives a `Γ_K`-equivariant isomorphism `(G × G')^∧(R) ≅ Ĝ(R) × Ĝ'(R)`,
hence `^L(G × G')(R) = ^LG(R) ×_Γ ^LG'(R)`; it follows from the direct sum of the two based root
data and [Conrad RGS], Theorem 6.1.17, p. 197. (3) For a z-extension `G̃ → G` with induced-torus
kernel `Z`, the sequence `0 → X_*(Z) → X_*(T̃) → X_*(T) → 0` is exact and `Γ_K`-equivariant, the
coroots of `G̃` map bijectively onto those of `G`, `π₁(G̃)` is torsion-free and `Z(Ĝ̃)` is a torus
([Springer], §2.15(b), (e), (f), p. 11, for the centre and the simply connected derived group
through the root and coroot lattices); these are README-only statements about lattices.
*Needs:* *l-group*; *dual-based-root-datum*; RG2.1 *z-extension*; RG2.1 *z-extension-existence*;
ReductiveGroups layer 9; Tau Ceti `TauCeti.RootPairingIsogeny`,
`TauCeti.CommHopfAlgCat.IsCentralIsogeny`.

**The L-group of a Weil restriction.** (*dual-of-weil-restriction*) Let `K'/K` be finite separable,
`G'` connected reductive over `K'` and `H = Res_{K'/K}G'`. Then `Ψ_0(H)` is induced:
`X^*(T_H) = ⊕_{τ : K' → K^sep} X^*(T')_τ` with `Γ_K` permuting the summands and acting inside them
via `μ_{G'}` ([Springer], §3.3, p. 12); so `Ĥ = ∏_τ Ĝ'` and `^LH = Ĥ ⋊ Γ_K`, with
`μ̂_H(γ)(g_τ)_τ = (μ̂_{G'}(γ_τ⁻¹ γ γ_{γ⁻¹τ})(g_{γ⁻¹τ}))_τ`, where for each `K`-embedding
`τ : K' → K^sep` an element `γ_τ ∈ Γ_K` restricting to `τ` on `K'` is fixed, so that
`γ_τ⁻¹ γ γ_{γ⁻¹τ} ∈ Γ_{K'}`. For `Res_{ℂ/ℝ}` this identifies `Ĥ(ℂ)` with `Ĝ'(ℂ)²`
([Buzzard–Gee], §2.3, pp. 13–14). This is a README-only statement. *Needs:* *l-group*;
*dual-isogenies-and-products*; RG2.0a *weil-restriction-character-lattices*; RG2.0a
*weil-restriction-separable-splitting*.

### Examples

**Dual groups of tori and GL_n.** (*torus-and-gl-dual-groups*) (1) For a torus `T`, `T̂` is the split
`ℤ`-torus with character group `X_*(T)`, `Γ_K` acting through `X_*(T)`, and `^LT = T̂ ⋊ Γ`; for `T`
split, `^LT = T̂ × Γ`; for the quadratic norm-one torus, `T̂ = G_m` with the nontrivial element acting
by inversion; for `Res_{K'/K}G_m`, `T̂ = G_m^{[K':K]}` with the factors permuted. (2) `GL_n` is
self-dual: `Ĝ = GL_n` over `ℤ` with the standard pinning and trivial Galois action, so
`^LGL_n = GL_n × Γ`; and `(SL_n)^∧ = PGL_n`, `(PGL_n)^∧ = SL_n` ([Buzzard–Gee], §2.2, Remark 2.2.1,
p. 7, uses `T̂ = X^*(T) ⊗ ℂ^×`). These examples are derived from the lattice duality,
not quoted from that passage: the empty-root datum gives the split torus; for `GL_n`,
`X = Y = ℤ^n` and both roots and coroots are `e_i−e_j`; the root and weight lattices of
`SL_n` and `PGL_n` interchange. The integral realization is [Conrad RGS],
Theorem 6.1.17, p. 197; the norm-one and induced-torus actions follow by dualizing their
character lattices. The Checks `dualGroup_torus`, `dualTorus_rank_one`, `dualRootDatum_gl_n`,
`dualGroup_gl_n`, `dualRootSubgroup_gl_n` and `dualGroup_not_self` of RG2.5.1, and
`galoisAction_unitary` for `n = 1` (the norm-one torus), test these cases. *Needs:*
*l-group*; *galois-action-on-dual-group*; Tau Ceti `TauCeti.DiagonalizableGroup.pointsMulEquiv`,
`TauCeti.GeneralLinear.diagonalRootDatum`, `TauCeti.GeneralLinear.pointsMulEquiv`; RG2.0a
*norm-torus*.

**GSp_4 is its own dual.** (*gsp4-self-dual*) For `GSp_4` over `ℤ` with torus
`T = diag(st_1, st_2, st_2⁻¹, st_1⁻¹)`, the character lattice is
`X^*(T) = {(a_1,a_2;c) ∈ ℤ³ : c ≡ a_1+a_2 (2)}`, where `(a_1,a_2;c)` is the character
`s^c t_1^{a_1} t_2^{a_2}`, with basis `e_1 = (1,0;1)`, `e_2 = (0,1;1)`, `e_3 = (0,0;2)`, and the
cocharacter lattice is `X_*(T) = {(b_1,b_2;d) ∈ (½ℤ)³ : b_i+d ∈ ℤ}` with the dual basis
`f_1 = (1,0;0)`, `f_2 = (0,1;0)`, `f_3 = (−½,−½;½)` ([Pilloni], §5.1.1, p. 20, for the lattices and
the matrix below). The roots `α_1 = e_2−e_1`, `α_2 = e_3−2e_2` with coroots `α_1^∨ = f_2−f_1`,
`α_2^∨ = −f_2` form a base. The map `i : X^*(T) → X_*(T)` with symmetric matrix

```text
((1,1,1), (1,0,1), (1,1,2))
```

in the bases `(e_i)`, `(f_i)` is unimodular (determinant `−1`), with `i(α_1) = α_2^∨` and
`i(α_2) = α_1^∨`; since the matrix is symmetric, `i` is an isomorphism of based root data
`Ψ ≅ Ψ^∨`, and by [Conrad RGS], Theorem 6.1.17, p. 197, `GSp_4` is its own pinned dual over `ℤ`,
with trivial Galois action. The simple roots printed in [Pilloni] are `e_1−e_2` and `e_3−2e_2`
with coroots `f_1−f_2` and `f_2`; they are inconsistent, since `⟨e_3−2e_2, f_2⟩ = −2`, and
`i(e_3−2e_2) = f_2−f_1` is not a printed simple coroot. The Lean examples
`GSp4.duality_matrix_unimodular`, `GSp4.simple_root_images` and
`GSp4.printed_coroot_has_wrong_sign` compute the determinant, the two images and this pairing.
*Needs:* *langlands-dual-group*; *dual-based-root-datum*; Tau Ceti
`TauCeti.Symplectic.diagonalTorus`.

Alongside these, the checks of RG2.5.1–RG2.5.2 run through `GL_n` (self-dual, direct-product
L-group), `PGL_2` (dual `SL_2`, seen through the centre), tori (over `F_2` and `ℚ`), the quasi-split
unitary groups (outer Galois action, no direct product, a non-Galois-stable Levi) and `D_4` (the
transposition without inverse).

### Dependencies

RG2.0a for Weil restrictions and norm tori; RG2.1 for `π₁(G)` and z-extensions; ReductiveGroups
layers 7 and 9; ClassFieldTheory layer 9 for the Weil group; Mathlib `RootPairing`,
`MulAction.stabilizer` and `SemidirectProduct`; Tau Ceti `TauCeti.Pinning`,
`TauCeti.DiagonalizableGroup.pointsMulEquiv`, `TauCeti.AlgHom.mapValue`,
`TauCeti.CommHopfAlgCat.centerGroupScheme`, `TauCeti.RootPairingIsogeny`,
`TauCeti.CommHopfAlgCat.IsCentralIsogeny`.

## Downstream consumers

AdelicAlgebraicGroups consumes RG2.0 (AA.0–AA.1: the evaluation topology
`PointTopology.instTopologicalSpaceWithConv`, the `T2Space`, `TotallyDisconnectedSpace`,
`LocallyCompactSpace` and `SecondCountableTopology` instances, `PointTopology.isTopologicalGroup`, the compact open integral
points `PointTopology.isOpenEmbedding_integralPoints` and `compactSpace_integralPoints`, and the
congruence subgroups `CongruenceSubgroup.subgroup`), RG2.0a (AA.1: `WeilRestriction.functor`,
`WeilRestriction.Res`, `WeilRestriction.homEquiv`, `WeilRestriction.ResHopf` with
`WeilRestriction.instHopfAlgebraRes`, `WeilRestriction.pointsMulEquiv`, `WeilRestriction.mapHopf`
and the Deligne torus), the integral Iwasawa decomposition of RG2.4
(AA.3: `G(F_v) = K_v P(F_v)` with `K_v ∩ P(F_v) = P(O_v)` at almost all places) and the Kneser–Tits
consequence that `G(E)` has no proper subgroup of finite index (AA.4). It states the adelic and
`F_v` instances of RG2.0 and RG2.0a itself. SmoothRepresentationsOfLocalGroups consumes the local
Iwahori decompositions and the modulus clauses of RG2.4 — the Iwahori factorization, the
double-coset cardinalities, the modulus `δ_P` and the Iwasawa integration formula — without
restating them, and
builds Hecke algebras and the Satake isomorphism on the decompositions of RG2.4. The Shimura-datum
and Shimura-level consumers import the Deligne torus of RG2.0a, the parahoric group schemes,
hyperspecial vertices and tame realizations of RG2.3, and the admissible sets of RG2.4. Later
roadmaps on types for tame groups (Adler–Roche forms, tameness of tori), z-embeddings and central
pushouts `G ×_Z T`, affine Grassmannians and local models cite RG2.2–RG2.5 for the building, the
Moy–Prasad filtrations, the Iwahori–Weyl combinatorics and the L-group.

## References

- [Adler] Jeffrey D. Adler, *Refined anisotropic K-types and supercuspidal representations*,
  Pacific J. Math. 185 (1998), 1–32. https://msp.org/pjm/1998/185-1/
- [Anantharaman] Sivaramakrishna Anantharaman, *Schémas en groupes, espaces homogènes et espaces
  algébriques sur une base de dimension 1*, Mém. Soc. Math. France 33 (1973), 5–79.
  http://www.numdam.org/item/MSMF_1973__33__5_0.pdf
- [Bosch–Lütkebohmert–Raynaud] Siegfried Bosch, Werner Lütkebohmert, Michel Raynaud,
  *Néron Models*, Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 21, Springer (1990).
  https://doi.org/10.1007/978-3-642-51438-8
- [Bruhat–Tits 1984] François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes
  classiques sur un corps local*, Bull. Soc. Math. France 112 (1984), 259–301.
  http://www.numdam.org/item/10.24033/bsmf.2006.pdf
- [Bruhat–Tits I] François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données
  radicielles valuées*, Publ. Math. IHÉS 41 (1972), 5–251.
  http://www.numdam.org/item/10.1007/BF02715544.pdf
- [Bruhat–Tits II] François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas
  en groupes. Existence d'une donnée radicielle valuée*, Publ. Math. IHÉS 60 (1984), 5–184.
  http://www.numdam.org/item/10.1007/BF02700560.pdf
- [Buzzard–Gee] Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic
  representations and Galois representations*, LMS Lecture Note Series 414 (2014), 135–187;
  arXiv:1009.0785v3. https://arxiv.org/abs/1009.0785
- [Calegari–Geraghty] Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor–Wiles
  method*, Invent. Math. 211 (2018), 297–433; arXiv:1207.4224v2. https://arxiv.org/abs/1207.4224
- [Cartier] Pierre Cartier, *Representations of p-adic groups: a survey*, in *Automorphic Forms,
  Representations and L-functions* (Corvallis 1977), Proc. Sympos. Pure Math. 33, Part 1, AMS 1979,
  111–155.
- [Casselman] W. Casselman, *Introduction to the theory of admissible representations of p-adic
  reductive groups*, draft of 1 May 1995.
  https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf
- [Česnavičius] Kęstutis Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168 (2019),
  1461–1486; arXiv:1711.06456v4. https://arxiv.org/abs/1711.06456
- [Chen] Miaofen Chen, *Composantes connexes géométriques de la tour des espaces de modules
  de groupes p-divisibles*, Ann. Sci. Éc. Norm. Supér. 47 (2014), 723–764.
  https://www.numdam.org/item/10.24033/asens.2225.pdf
- [Conrad] Brian Conrad, *Weil and Grothendieck approaches to adelic points*, L'Enseignement
  Math. 58 (2012), 61–97; page numbers are those of the author's version dated 31 December 2011.
  https://math.stanford.edu/~conrad/papers/adelictop.pdf
- [Conrad RGS] Brian Conrad, *Reductive group schemes*, author notes (390-page version).
  https://math.stanford.edu/~conrad/papers/luminysga3.pdf
- [Edixhoven] Bas Edixhoven, *Néron models and tame ramification*, Compositio Math. 81 (1992),
  291–306. http://www.numdam.org/item/CM_1992__81_3_291_0.pdf
- [Fintzen] Jessica Fintzen, *Types for tame p-adic groups*, Ann. of Math. 193 (2021), 303–346;
  arXiv:1810.04198v2. https://arxiv.org/abs/1810.04198
- [Garrett] Paul Garrett, *Buildings and Classical Groups*, Chapman & Hall (1997).
  https://www-users.cse.umn.edu/~garrett/m/buildings/book.pdf
- [Geck–Iancu] Meinolf Geck, Lacrimioara Iancu, *Coxeter groups and automorphisms*,
  arXiv:1412.5428v1 (2014). https://arxiv.org/abs/1412.5428
- [Gille 2009] Philippe Gille, *Le problème de Kneser–Tits*, Séminaire Bourbaki, exp. 983,
  Astérisque 326 (2009), 39–81. http://www.numdam.org/item/AST_2009__326__39_0.pdf
- [Gleason–Lim–Xu] Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine
  Deligne–Lusztig varieties*, Invent. Math. 243 (2026), 805–861; arXiv:2208.07195v3.
  https://arxiv.org/abs/2208.07195
- [Haines] Thomas J. Haines, *Dualities for root systems with automorphisms and applications to
  non-split groups*, Represent. Theory 22 (2018), 1–26; arXiv:1604.01468v2.
  https://arxiv.org/abs/1604.01468
- [Haines–Rapoport] Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*, appendix to
  Pappas–Rapoport, *Twisted loop groups and their affine flag varieties*, Adv. Math. 219 (2008),
  118–198. https://www.math.umd.edu/~tjh/HRParahoric3.pdf
- [Harpaz–Wittenberg] Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et
  problème de Galois inverse*, J. Amer. Math. Soc. 33 (2020), 775–805; arXiv:1802.09605v2.
  https://arxiv.org/abs/1802.09605
- [He 2018] Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*, Forum Math. Pi 6
  (2018), e2; arXiv:1610.04791v3. https://arxiv.org/abs/1610.04791
- [He 2021] Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*, Forum
  Math. Pi 9 (2021), e9; arXiv:2001.03325v1. https://arxiv.org/abs/2001.03325
- [He–Nie–Yu] Xuhua He, Sian Nie, Qingchao Yu, *Affine Deligne–Lusztig varieties with finite Coxeter parts*, Algebra & Number Theory 18 (2024), 1681–1714.
  https://msp.org/ant/2024/18-9/ant-v18-n9-p03-p.pdf
- [van Hoften] Pol van Hoften (appendix by Rong Zhou), *Mod p points on Shimura varieties of
  parahoric level*, Forum Math. Pi 12 (2024), e20; arXiv:2010.10496v4.
  https://arxiv.org/abs/2010.10496
- [Jordan–Ribet–Scholl] Bruce W. Jordan, Kenneth A. Ribet, Anthony J. Scholl,
  *Modular curves and Néron models of generalized Jacobians*, arXiv:2207.13203v2,
  [§1.1, p. 4](https://arxiv.org/pdf/2207.13203v2).
- [Kaletha] Tasho Kaletha, *Rigid inner forms of real and p-adic groups*, Ann. of Math. 184 (2016),
  559–632; arXiv:1304.3292v5. https://arxiv.org/abs/1304.3292
- [Kim–Yu] Ju-Lee Kim, Jiu-Kang Yu, *Construction of tame types*, arXiv:1612.04204v1 (2016).
  https://arxiv.org/pdf/1612.04204v1
- [Kisin] Mark Kisin, *Mod p points on Shimura varieties of abelian type*, J. Amer. Math. Soc. 30
  (2017), 819–914. https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf
- [Kisin–Pappas] Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric
  level structure*, Publ. Math. IHÉS 128 (2018), 121–218; arXiv:1512.01149v3.
  https://arxiv.org/abs/1512.01149
- [Kisin–Pappas–Zhou] Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties
  with parahoric level structure, II*, Forum Math. Pi 14 (2026), e14; arXiv:2409.03689v3.
  https://arxiv.org/abs/2409.03689
- [Kisin–Zhou] Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to
  abelian varieties*, Ann. of Math. 202 (2025), 1077–1156; arXiv:2103.09945v2.
  https://arxiv.org/abs/2103.09945
- [Kottwitz 1997] Robert E. Kottwitz, *Isocrystals with additional structure. II*,
  Compositio Mathematica 109 (1997), 255–339,
  [published article](https://doi.org/10.1023/A:1000102604688).
- [Lipnowski–Tsimerman] Michael Lipnowski, Jacob Tsimerman, *How large is A_g(F_q)?*, Duke Math.
  J. 167 (2018), 3403–3453; arXiv:1511.02212v1. https://arxiv.org/abs/1511.02212
- [Milne AG] J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a
  field*, version 2.00 (2015; numbering differs from the CUP 2017 book).
  https://www.jmilne.org/math/CourseNotes/iAG200.pdf
- [Milne ISV] J. S. Milne, *Introduction to Shimura varieties*, revised 2017 (numbering of Clay
  Math. Proc. 4 (2005)). https://www.jmilne.org/math/xnotes/svi.pdf
- [Moy–Prasad 1994] Allen Moy, Gopal Prasad, *Unrefined minimal K-types for p-adic groups*,
  Invent. Math. 116 (1994), 393–408.
- [Moy–Prasad 1996] Allen Moy, Gopal Prasad, *Jacquet functors and unrefined minimal K-types*,
  Comment. Math. Helv. 71 (1996), 98–121.
- [Nguyễn Quốc Thắng] Nguyễn Quốc Thắng, *On corestriction principle in non-abelian Galois
  cohomology over local and global fields. II: Characteristic p > 0*, ICTP IC/2004/78 (2004).
  https://cds.cern.ch/record/984004/files/cer-002647101.pdf
- [Pappas–Rapoport] Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag
  varieties*, Adv. Math. 219 (2008), 118–198. https://arxiv.org/abs/math/0607130
- [Pilloni] Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular
  weights*, Duke Math. J. 169 (2020), 1647–1807; author preprint, §5.1.1 on p. 20.
  https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf
- [Platonov–Rapinchuk–Rapinchuk] V. Platonov, A. Rapinchuk and I. Rapinchuk,
  *Algebraic Groups and Number Theory*, Volume I, 2nd edition, Cambridge Studies in
  Advanced Mathematics 205, Cambridge University Press, 2023.
- [Prasad] Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified
  descent in Bruhat–Tits theory*, Amer. J. Math. 142 (2020), 1239–1267; arXiv:1705.02906v5.
  https://arxiv.org/abs/1705.02906
- [Prasad–Raghunathan] Gopal Prasad, M. S. Raghunathan, *On the Kneser–Tits problem*, Comment.
  Math. Helv. 60 (1985), 107–121.
- [Prasad–Yu] Gopal Prasad, Jiu-Kang Yu (appendix by Brian Conrad), *On quasi-reductive group
  schemes*, J. Algebraic Geom. 15 (2006), 507–549. https://arxiv.org/abs/math/0405381
- [Rapoport] Michael Rapoport, *A guide to the reduction modulo p of Shimura varieties*,
  author preprint (40-page version). https://www.mi.uni-koeln.de/mi/Forschung/Rapoport/redshi.pdf
- [Richarz] Timo Richarz, *On the Iwahori–Weyl group*, Bull. Soc. Math. France 144 (2016), 117–124;
  arXiv:1310.4635v1. https://arxiv.org/abs/1310.4635
- [Serre] Jean-Pierre Serre, *Arbres, amalgames, SL₂*, Astérisque 46, Société Mathématique de
  France (1977); English translation *Trees*, Springer (1980). Page numbers are those of the Numdam
  scan. https://www.numdam.org/item/AST_1983__46__1_0/
- [Springer] T. A. Springer, *Reductive groups*, in *Automorphic Forms, Representations
  and L-functions* (Corvallis 1977), Proc. Sympos. Pure Math. 33, Part 1, AMS 1979, 3–27.
- [Stacks] The Stacks Project Authors, *The Stacks Project*, Tag 05Y8 (restriction of scalars) and
  Tag 05YF. https://stacks.math.columbia.edu/tag/05Y8
- [Suzuki–Yoshida] Takashi Suzuki, Manabu Yoshida, *A refinement of the local class field theory
  of Serre and Hazewinkel*, RIMS Kôkyûroku Bessatsu B32 (2012), 163–191, Proposition 3.5(2), p. 176.
  https://www.kurims.kyoto-u.ac.jp/~kenkyubu/bessatsu/open/B32/pdf/B32_011.pdf
- [Tits] J. Tits, *Reductive groups over local fields*, in *Automorphic Forms,
  Representations and L-functions* (Corvallis 1977), Proc. Sympos. Pure Math. 33,
  Part 1, AMS 1979, 29–69.
- [Yu] Jiu-Kang Yu, *Construction of tame supercuspidal representations*, J. Amer. Math. Soc. 14
  (2001), 579–622.
- [Zhu] Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*, Ann. of
  Math. 185 (2017), 403–492; arXiv:1407.8519v3. https://arxiv.org/abs/1407.8519
