# Roadmap: reductive groups, part III — arithmetic conjugacy quotients and tori

**Summary.** This roadmap builds the arithmetic theory of semisimple conjugacy classes and maximal
tori of reductive groups over number fields and their completions. It uses ArithmeticGaloisRepresentations §1.11’s conjugacy
quotient `Conj(G)=Spec C(G)` of a connected reductive group, where `C(G)` is the algebra of
regular functions invariant under conjugation over every coefficient algebra. It proves the group
form of Chevalley restriction `C(G)≅O(T)^W` and separation of geometric semisimple classes
by characters (Steinberg), using that supplier’s classification by `Conj(G)`. Arithmetic descent follows:
Jordan's covering lemma, rationality of points that are rational at almost every prime, quotient
maps that are injective on geometric points, and inner-form identifications. For tori it proves
Harder's approximation of local maximal tori by a global one, the construction of global torus
classes with prescribed real component, and the real Weyl-cocycle adjustment of a Shimura
cocharacter. It then defines the Serre condition, prime-units and Weil points, and proves that Weil
points of a Serre torus are its prime-units and that neat ones are Zariski dense. Two consequences
follow. One is the Kisin–Madapusi Pera–Shin descent of a family of realizations of one group to a
rational torus embedding, together with the odd unitary Hasse principle. The other is the
reductive-group half of Kisin–Zhou's independence of `ℓ` for abelian varieties: a common rational
Frobenius class in `Conj(G)` for the Mumford–Tate group `G`, a real elliptic representative of it,
and, when `G_der` is simply connected and `G_{ℚ_p}` is quasi-split, a rational representative that
matches the local Frobenius classes away from one auxiliary prime.

The quotient `Conj(G)` records geometric semisimple classes. Its rational points are not rational
conjugacy classes, and a rational point of `Conj(G)` need not lift to a rational element of `G`.
These three notions stay distinct throughout. Torus cohomology controls the passage from local to
global, and dense subgroups of Weil points make comparisons of realization maps rigid.

## Scope and ownership

This roadmap continues **ReductiveGroups** and **ReductiveGroupsPartII**. ReductiveGroups
supplies the algebraic structure theory: representations as comodules (Layer 1),
subgroups and quotients (Layer 3), Jordan decomposition and tori (Layer 4), reductive groups and
central isogenies (Layer 6), maximal tori, root data and Weyl groups (Layer 7), the
isomorphism theorem with inner and outer automorphisms (Layer 9D), and highest-weight theory
(Layer 10). ReductiveGroupsPartII adds the point topology over local fields (RG2.0), Weil restriction
and the Deligne torus (RG2.0a), quasi-split forms (RG2.1.1), the algebraic fundamental group and
`z`-extensions (RG2.1.5) and parahoric group schemes (RG2.3). Neither treats the conjugacy
quotient as an arithmetic object, the descent of Frobenius classes, or the global theory of
maximal tori. That is the subject here.

**Owned here.** The equalizer presentation of class functions; group Chevalley restriction for connected reductive groups over any field; separation of geometric semisimple classes by characters; finiteness of the quotient map of a faithful representation; the orthogonal outer
quotient `Conj′(G)` and the group `Aut′(G)`. Jordan's covering lemma and rational descent of
algebraic points; algebraicity above rational invariants; the inner-form identification of
conjugacy quotients; the quotient injections for diagonal Weil-restriction subgroups and
antidiagonal central products. Global torus classes with prescribed real component; Harder's
approximation of maximal tori; real Weyl cocycles and the global cocharacter twist. The Serre
condition, prime-units, `l`-Weil numbers (as a refinement of Weil numbers), Weil points, the neat
cyclic-closure comparison, the Serre-unit criterion, density of neat Weil points and rigidity under
finite automorphism groups. Conjugacy of common-source realizations, Galois descent of local
embedding classes, rational torus embeddings into quasi-split groups, local-to-global transfer of
maximal tori, rational tori for common realizations and the odd unitary similitude Hasse
principle. The cohomological Mumford–Tate conventions and their explicit normalization witnesses, the auxiliary groups of good-reduction descent, the common rational Frobenius
class obtained from an auxiliary group, real elliptic representatives and the one-prime patching
of rational representatives. Five interfaces at the edge of the cohomology and building suppliers
are owned here as well, each at the point where its supplier stops: the localization exact sequence
of torus cohomology (§2.0; EndoscopicTransferAndUnitaryTraceComparison §1.2(b) identifies the
global-mod-local group with `(X_*(T)_Γ)_tors` but not the map from local classes as the sum of
local Tate–Nakayama maps); the openness of local regular-centralizer loci (§2.1a; its real case is
ShimuraVarieties §P.5, which §2.1a consumes, and ReductiveGroupsPartII §RG2.0.2 supplies analytic
charts and the inverse function theorem only); rational
embeddings in a Galois-stable embedding class into a quasi-split group (§4.3;
EndoscopicTransferAndUnitaryTraceComparison §1.6 transfers maximal tori from an inner form only);
the fixer intersection and very special points for a closed immersion with identical derived
groups (§5.3a; ReductiveGroupsPartII §§RG2.2.3–RG2.2.4 give building maps for field extensions,
Weil restrictions, central surjections, Levi subgroups and the toral embedding into a `GL(V)`
building, and §§RG2.3.3–RG2.3.4 fixers and very special points of a single group, but no fixer
intersection along such an immersion); and the relative obstruction for an inner form (§5.7a;
EndoscopicTransferAndUnitaryTraceComparison §1.15 states the case `G₀=G`).

**Used from other roadmaps, not rebuilt.**

- **ArithmeticGaloisRepresentations** §1.11, *Reductive quotients over fields and DVRs*, owns
  the conjugacy quotient of a connected reductive group, its universal property, flat base change,
  finite generation, the characteristic-polynomial quotient of `GL_n`, and the bijection between
  geometric quotient points and semisimple conjugacy classes, including surjectivity and the
  semisimple-part description of every fibre. Group Chevalley restriction here adds the explicit
  torus restriction isomorphism for arbitrary maximal tori.
- **ShimuraVarieties** §7.0i.1 owns the common open Galois subgroup on which all realizations take
  values in the Mumford–Tate group, its independence of `ℓ`, the finite extension it defines, and
  the inner-form transport under a change of complex embedding. **MotivesAndAlgebraicCycles**
  §6.8 owns the tensor-isomorphism torsor between two fibre functors and the inner twist it
  produces; no target here consumes it. §5.1 fixes the conventions used by the arithmetic
  applications.
- The invariant coordinate algebras under simultaneous conjugation, `O[Hⁿ]^H` for a commutative
  Hopf algebra and every arity `n`, are **IntegralHeckeAndGaloisDeterminants** §0.7. The arity-one
  algebra is the algebra of regular class functions; Layer 0 proves only its presentation as an
  equalizer of two coordinate maps, used to state the headline finiteness theorem.
- The classification of simple rational representations of a split connected reductive group by
  dominant weights and their highest lines, together with the characters of induced and Weyl modules, is **ReductiveGroups** Layer 10B.
  The representation-ring isomorphism `R(G)≅ℤ[X]^W` with highest-weight triangularity, over any field,
  is **SchemeKTheoryOperations** §6.3.1. Group Chevalley restriction consumes both.
- The Lie-algebra Chevalley quotient `𝔤→𝔱/W` is **ReductiveGroups** Layer 11C (over `ℂ`) and
  **EndoscopicTransferAndUnitaryTraceComparison** §3.3. The group quotient here is a different object.
- Weil `q`-numbers of integer weight, their products, inverses and uniqueness of weight are
  **DeligneWeightsAndPurity** §§0.1–0.2. An `l`-Weil number here is such a number for `q=l` that is in
  addition a unit at every finite place not above `l`.
- Neatness of elements and the generation of eigenvalues of algebraic tensor subquotients are
  **AdelicAlgebraicGroups** §4.3; finiteness of class numbers is §3.4. `IsNeatPoint` here is that
  eigenvalue condition for a rational point of a `ℚ`-group, imposed on all its finite-dimensional
  comodules instead of one complex matrix; it is kept to state §3.7.
- Nonabelian Galois cohomology, Tate–Nakayama for tori, stable conjugacy and centralizers, abelianized
  cohomology, inner twists and quasi-split inner forms, Kneser and Hasse principles, Kottwitz duality,
  rational classes in a stable class and the global obstruction are
  **EndoscopicTransferAndUnitaryTraceComparison** §§1.1–1.15.
- Mumford–Tate groups, their connectedness and reductivity, and the additional axiom `SV2*` for data of
  Hodge type are **ShimuraData** §§1.2–1.4 and 4.2–4.3. Real tori compact modulo the centre are
  **ShimuraVarieties** §P.5. Deligne's theorem that Hodge tensors on abelian varieties are absolute
  Hodge (**ShimuraVarieties** §7.0i) and the finite tensor stabilizers of reductive groups
  (**AutomorphicBundles** §1.1) are inputs of ShimuraVarieties §7.0i.1 and are not consumed directly.
- The forms of unitary PEL data and the identification `ker¹(ℚ,Z)≅ker¹(ℚ,G)` for a unitary similitude
  group in an odd number of variables are **PELModuli** §§M3.1–M3.2; §4.6 adds the vanishing when the
  totally real field has odd degree.
- Good-reduction specialization of Tate modules, inertia triviality and arithmetic Frobenius on
  the Tate module are **NeronModelsAndSemistableAbelianVarieties** §§5.0a–5.0b.
- Abelian varieties, the Serre tensor construction, the Betti, de Rham and étale realizations with their
  conventions, the `ℓ`-independent characteristic polynomial and Frobenius semisimplicity are
  **AbelianSchemesAndArithmeticModuli** §§A1.3a, A3.7, A3.9, A4.1, A5.1, A5.7, A6.11 and A6.21.
- Dirichlet-density Chebotarev is **Chebotarev** Layer 10; Artin–Whaples weak approximation is
  **GlobalNumberFields** Layer 1.
- The split, simply-connected-derived Steinberg map over `ℤ` is planned in **GroupSchemesOverABase**
  §7.2, and the integral restriction isomorphism `ℤ[M]^M≅ℤ[T]^W` for split standard dual Levi groups
  over `ℤ` in **LanglandsParameterStacks** §4.26; the restriction theorem here holds for every
  connected reductive group over a field, with a possibly non-split maximal torus. Neither of those statements covers a non-split torus or an
  arbitrary base field.

**Not in this roadmap.** The geometric independence-of-`ℓ` theorem for a good-reduction point of a
Hodge-type Shimura variety with strongly acceptable datum (KZ25 Theorem 5.1.4, KZ25 lines 2104–2106)
and the realization theorem for isogeny groups (KMPS22 Proposition 2.2.2, KMPS22 lines 1122–1123)
are theorems about integral models of Shimura varieties. Here they enter only as explicit hypotheses
of §4.5 and §5.5, stated in group-theoretic terms. A Shimura-variety roadmap that proves them
consumes this roadmap and obtains the unconditional statements by combining them with §4.5 and
§5.5. The basic `σ`-conjugacy classes and Newton strata attached to an elliptic torus belong to
**BunGAndNewtonStrata**. Coadjoint orbits in good characteristic,
characteristic-`p` `σ`-dual homomorphisms, general Levi decompositions of arbitrary affine groups,
integral and modular representation theory of reductive groups and arithmetic gerbs are not part of this
roadmap.

## Conventions

- All algebraic groups are affine of finite type over a field, given by their coordinate Hopf algebras
  as in ReductiveGroups Layer 0. A reductive group is smooth, geometrically connected and has trivial
  geometric unipotent radical; this is Tau Ceti's `TauCeti.reductiveCommHopfAlgProperty`. Points with
  values in a commutative algebra `A` are algebra maps `O(G)→A`, with Tau Ceti's convolution group
  structure on `WithConv (O(G) →ₐ[k] A)`.
- Conjugation is left conjugation `(g,x)↦gxg⁻¹`. Its coordinate map is Tau Ceti's
  `TauCeti.HopfAlgebra.conjugationAlgHom : H →ₐ[R] H ⊗[R] H`, whose first tensor factor is the
  conjugating point and second the acted-on point (`productMap_comp_conjugationAlgHom`).
- `C(G)` is the algebra of regular class functions and `Conj(G)=Spec C(G)`, with quotient morphism
  `χ_G : G→Conj(G)` dual to the inclusion `C(G)⊂O(G)`. A semisimple point is one acting semisimply on
  every finite-dimensional comodule after scalar extension, Tau Ceti's
  `TauCeti.HopfAlgebra.IsSemisimplePoint`.
- Layer 0, apart from `Conj′` (§0.7), and the rigidity theorem §3.8 hold over an arbitrary
  field. `Conj′`, the rest of Layers 1–5 and every Galois-cohomological statement are in
  characteristic zero.
- Galois cohomology is EndoscopicTransferAndUnitaryTraceComparison §1.1's nonabelian `H¹` of continuous cocycles. A cocycle
  satisfies `a_{στ}=a_σ σ(a_τ)`. The real Weyl cocycle of a representative `n` is `n⁻¹c(n)`, where
  `c` is complex conjugation, and the matching coboundary convention is `g⁻¹σ(g)`.
- Tate–Nakayama isomorphisms use EndoscopicTransferAndUnitaryTraceComparison §1.2's sign. Kottwitz's `H¹(F,T)≅(X_*(T)_{Γ})_tors`
  is the local isomorphism used in §2.1.
- Abelian varieties have dimension `g≥1`. For `g=0` every realization is zero, the Mumford–Tate
  group is trivial and every conjugacy class and Frobenius representative is the identity, while the
  multiplier identities below fail (`1≠z²`); that case is trivial and is set aside.
- Cohomology of an abelian variety means `H¹`. Its Betti realization has Hodge types `(1,0),(0,1)`;
  its `ℓ`-adic realization is `H¹_et(A_Ē,ℚ_ℓ)≅(T_ℓA⊗ℚ_ℓ)^∨`. The Hodge action of the Deligne torus
  `S` is `h(z)` acting on `V^{p,q}` by `z^{-p}z̄^{-q}`, so the weight acts on `H¹` by `z^{-1}`. The
  scalar cocharacter `w_s(z)=z·id` is its inverse, and the symplectic multiplier `ν` satisfies
  `ν(w_s(z))=z²`.
- `Fr_v` is a geometric Frobenius at a place `v` of residue cardinality `q`. On `H¹` its eigenvalues
  have absolute value `√q` under every complex embedding, and `ν(ρ_ℓ(Fr_v))=q`.
- Elliptic: a maximal torus of a real reductive group is elliptic when it is anisotropic modulo the
  centre; an element is elliptic when it lies in an elliptic maximal torus.
- `Out′(H)` is the finite étale group of orthogonal outer automorphisms of the actual `SO(2n)`, `n≥4`,
  almost simple factors of `H_der`. The prime is a label: it is neither a derivative nor the full outer
  automorphism group.
- Sources are cited by the keys of the references list with exact theorem numbers and printed pages;
  KZ25 uses the arXiv v2 pagination and KMPS22 the author PDF of 27 January 2021.

## Exact supplier contracts

### From Mathlib

- `AlgHom.equalizer` (`Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`): the subalgebra on which two
  algebra maps agree. It presents the class-function algebra.
- `Algebra.TensorProduct.includeRight`: the second-factor inclusion `h↦1⊗h`.
- `MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group`
  (`Mathlib/GroupTheory/GroupAction/Quotient.lean`): Burnside's count for a finite group acting with
  finite fixed-point sets. Jordan's lemma uses it for the coset action.
- `LinearMap.trace`: the trace of a linear endomorphism, the honest trace on a finite free module.
- `IsConj`: conjugacy in a group.
- `NumberField.InfinitePlace.Completion` and `IsDedekindDomain.HeightOneSpectrum.adicCompletion`:
  the completions of a number field at its archimedean and finite places.
- `NumberField`, `NumberField.RingOfIntegers` and `IsAlgClosed`, for the hypotheses of the Lean statements.
- `Padic` (`ℚ_[v]`), `IsCompact`, `closure`, `minpoly`, `Polynomial.aroots`, `LinearMap.charpoly`,
  `IsIntegral`, `Subgroup.closure` and `IsOfFinOrder`: the carriers of the Layer 3 predicates.
- Scheme language: `AlgebraicGeometry.Scheme`, `IsReduced`, `IrreducibleSpace`, `IsSeparated`.

### From Tau Ceti

- `TauCeti.HopfAlgebra.conjugationAlgHom`, `TauCeti.HopfAlgebra.productMap_comp_conjugationAlgHom`
  and `TauCeti.HopfAlgebra.tensorProduct_map_comp_conjugationAlgHom`
  (`TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean`): the coordinate map of left conjugation, its
  evaluation `gxg⁻¹` at algebra-valued points, and its naturality for bialgebra maps.
- `TauCeti.reductiveCommHopfAlgProperty` and `TauCeti.FiniteTypeCommHopfAlgCat`
  (`TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`, `…/FiniteType/CommHopfAlgCat.lean`): the
  reductivity predicate and the category of finite-type commutative Hopf algebras.
- `TauCeti.HopfAlgebra.IsSemisimplePoint` (`TauCeti/Algebra/AlgebraicGroup/Representation/SemisimplePoint/Basic.lean`):
  semisimple points; closed under inverses, integer powers and conjugation, and under commuting
  products over a perfect field.
- `TauCeti.Comodule.endOfPoint` (`TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean`) and
  `TauCeti.FGComoduleCat` (`TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean`): the action of a
  point on the scalar extension of a comodule, and finite-dimensional comodules.
- `TauCeti.HopfIdeal.IsMaximalTorus` (`TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean`),
  `TauCeti.HopfIdeal.exists_isMaximalTorus` (`…/Torus/Existence.lean`) and
  `TauCeti.HopfIdeal.IsMaximalTorus.conjugate` (`…/Torus/Conjugation.lean`): maximal tori as Hopf
  ideals, their existence and their conjugates by rational points.
- `TauCeti.HopfIdeal.conjugate` (`TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Conjugation.lean`) and
  `TauCeti.CommHopfAlgCat.baseChangeHopfIdeal`, `TauCeti.CommHopfAlgCat.baseChange`
  (`TauCeti/Algebra/AlgebraicGroup/HopfIdeal/BaseChange.lean`, `…/CommHopfAlgCat/BaseChange.lean`):
  conjugation and scalar extension of closed subgroups.
- `TauCeti.PointTopology.topology` with its instance on `WithConv (A →ₐ[k] R)`
  (`TauCeti/Topology/Algebra/PointTopology/Basic.lean`) and
  `TauCeti.PointTopology.isTopologicalGroup` (`…/PointTopology/Group.lean`): the topology on the
  `R`-points of an affine scheme induced from the product topology on `A → R`, for which the points
  of an affine group over a topological ring form a topological group. It is Hausdorff when `R` is
  (`…/PointTopology/Separation.lean`).
- `TauCeti.PointTopology.locallyCompactSpace_of_finiteType`
  (`TauCeti/Topology/Algebra/PointTopology/Basic.lean`), made an instance on the convolution type as
  `TauCeti.PointTopology.instLocallyCompactSpaceWithConv` (`…/PointTopology/Separation.lean`): the
  points of a finite-type algebra with values in a locally compact T1 ring form a locally compact space.
  `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective` (`…/PointTopology/Functoriality.lean`):
  a surjection of coordinate rings, that is a closed immersion, induces a closed embedding of points
  over a T1 ring. The coefficient rings are locally compact by Mathlib's `Padic.instProperSpace`
  (`Mathlib/NumberTheory/Padics/ProperSpace.lean`; a proper space is locally compact) for `ℚ_[v]`,
  and by
  `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`
  (`TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean`; Mathlib's
  `IsNonarchimedeanLocalField` includes local compactness) for the finite completions of a number
  field.
- `TauCeti.splitTorusCommHopfAlgProperty` and `TauCeti.torusCommHopfAlgProperty`
  (`TauCeti/Algebra/AlgebraicGroup/Torus/Basic.lean`): split tori of finite rank, rank zero included,
  and tori as the finite-type Hopf algebras that become split over an algebraic closure.
- `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`
  (`TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean`): Chevalley's
  line-stabilizer theorem, used by ReductiveGroups Layer 10B and not restated here.

### From TauCetiRoadmap.ReductiveGroups

Layer 1: the representation–comodule dictionary, faithful representations as closed immersions and the
embedding theorem. Layer 3: Hopf ideals and closed subgroups, normal subgroups, central quotients,
identity components and finite group quotients. Layer 4: Jordan decomposition and its functoriality,
diagonalizable groups `D(M)` and tori with their character and cocharacter lattices. Layer 6: reductive
and semisimple groups, centre, derived group and central isogenies. Layer 7: Borel subgroups, conjugacy
of maximal tori, root data and Weyl groups, the absolute root datum with its Galois action. Layer 9D: the inner/outer and pinned automorphism interfaces. Layer 10B: dominant-weight classification of simple rational representations
of split connected reductive groups, highest-weight order and Weyl characters.

### From TauCetiRoadmap.ReductiveGroupsPartII

§RG2.0.2, *smooth-group-analytic-charts*: analytic charts on `G(F_v)` and the inverse function
theorem over characteristic-zero local fields, used in §2.1a. The point topology itself, its local
compactness and its closed embeddings are taken from the Tau Ceti pin. §RG2.0a.1–RG2.0a.2:
Weil restriction of affine schemes and group schemes, with `Res_{k′/k}(G′)(R)≅G′(k′⊗R)`.
§RG2.0a.3: the Deligne torus `S`. §RG2.2: enlarged buildings, apartments, affine root groups and
their central functoriality. §RG2.3.3:
*compact-elements-in-hyperspecial-subgroups* (an element of `G(ℚ_p)` in a compact open subgroup lies in
a hyperspecial parahoric over a finite splitting extension) and *fixer-versus-parahoric* (5) (the
fixer of a very special point is the connected parahoric when `G_der` is a product of Weil
restrictions of split groups and `X_*(G_ab)_I` is torsion free). §RG2.3.4: very special points and
parahorics.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§1.11, *Reductive quotients over fields and DVRs*: for a connected reductive group acting on an
integral affine variety over any field, the affine invariant quotient, invariant-morphism universal
property, finite generation and flat base change. For the conjugation action on the group itself,
its geometric points classify semisimple classes; every geometric quotient point lifts, and the
quotient value of any element is that of its semisimple part. Consume the induced quotient map
of a group morphism by this universal property. No simply connected or characteristic-zero
hypothesis is imposed on this field statement.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§0.7, *Connected reductive invariant evaluations*, paragraph *Invariant coordinate algebras under conjugation*: for a commutative Hopf algebra `C` and `n≥0`,
the subalgebra of the arity-`n` tensor coordinates invariant under simultaneous conjugation over every
commutative coefficient algebra. Section 0.1 of this roadmap identifies the arity-one algebra with
`classFunctions`.

### From TauCetiRoadmap.SchemeKTheoryOperations

§6.3.1: for a split connected reductive group over any field, the character isomorphism of the
representation ring onto `ℤ[X]^W`, with highest-weight triangularity. The irreducible characters are a
`ℤ`-basis of `ℤ[X]^W`, unitriangular with respect to Weyl orbit sums.

### From TauCetiRoadmap.DeligneWeightsAndPurity

§0.1: Weil `q`-numbers of integer weight (algebraic over `ℚ`, every conjugate of absolute value
`q^{n/2}`), their nonvanishing and uniqueness of weight. §0.2: products, inverses, powers, and the
reciprocal conjugation formula `conj σ(α)=q^n/σ(α)` for rational `q`.

### From TauCetiRoadmap.AdelicAlgebraicGroups

§4.3: eigenvalues of algebraic tensor subquotients lie in the group generated by the eigenvalues of a
faithful representation; neat elements (target `Neat.IsNeatAut`) (eigenvalue group torsion free) and independence
of the faithful representation. §3.4: *class-number-finite*, finiteness of `G(F)\G(𝔸_f)/K` for compact
open `K`.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§1.1 nonabelian `H¹` and twisting; §1.2 Tate–Nakayama for tori, local `H¹(F,T)≅(X_*(T)_Γ)_tors` and the
global-mod-local group; §1.3 rational, geometric and stable conjugacy, with reductivity of connected
centralizers of semisimple elements; §1.5 abelianized cohomology; §1.6 inner twists, the quasi-split
inner form and transfer of maximal tori from an inner form to the quasi-split form; §1.9 Kneser,
Hasse principle for simply connected groups and the cartesian real-abelianized square; §1.11 Kottwitz's
map and `ker¹(F,G)≅ker¹(F,Z(Ĝ))^D`; §1.14 rational classes in a stable class and Kottwitz's rationality
theorem in a quasi-split group with simply connected derived group; §1.15 the global obstruction and
Kottwitz's rational-realization criterion.

### From TauCetiRoadmap.ShimuraData and TauCetiRoadmap.ShimuraVarieties

ShimuraData §1.2: the Mumford–Tate group of a rational Hodge structure, the smallest `ℚ`-subgroup whose
real points contain `h(S)`; §1.3 connectedness; §1.4 reductivity in the polarizable case; §4.2–4.3:
for a datum inside a Siegel datum, `Int(h(i))` is a Cartan involution of `G_ℝ/w(G_m)` (`SV2*`), so
`Z(ℝ)/w(ℝ^×)` is compact. ShimuraVarieties §P.5: regular semisimple Lie elements, centralizer maximal
tori, and real tori compact modulo the centre. ShimuraVarieties §5.8: the Shimura–Taniyama Frobenius
calculation for CM abelian varieties, used only in a Check of §5.5. ShimuraVarieties §7.0i.1 supplies
simultaneous Mumford–Tate factorization after one finite extension, its independence of `ℓ`,
the inner-form transport of the quotient under a change of complex embedding and the integral
`ℓ`-independent characteristic polynomial of good-reduction Frobenius.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

§A1.3a: the Serre tensor construction over an arbitrary base. §A5.1: `T_ℓA≅Λ⊗ℤ_ℓ` for the period lattice
of a complex abelian variety, for every prime `ℓ`. §A5.7: over `ℂ`, `H¹=Λ^*`; and, for `ℓ` prime to the
characteristic and to the polarization degree, `H¹_et(A_K̄,ℚ_ℓ)=V_ℓ(A)^*` with cohomological multiplier
`χ_ℓ⁻¹`; it is used only under that restriction. §A3.7 (the polarized Weil pairings), §A3.9 (the
rational inverse `λ⁻¹∈Hom⁰(A^∨,A)` of a polarization) and §A4.1 (`AbelianTate.dualPairing`,
`T_ℓ(A^∨)≅Hom(T_ℓA,ℤ_ℓ(1))`): tensored with `ℚ_ℓ`, they give for every `ℓ` prime to the characteristic,
including primes dividing the polarization degree, a nondegenerate alternating pairing on `V_ℓA` with
values in `ℚ_ℓ(1)`, hence the multiplier `χ_ℓ⁻¹` on `V_ℓ(A)^*`. §A6.11: the characteristic polynomial of an endomorphism on `V_ℓA` has integer
coefficients independent of `ℓ≠p`. §A6.21: the `q`-Frobenius is semisimple on `V_ℓA` and satisfies
`π^†π=q`.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§§5.0a–5.0b: finite-étale specialization identifies the generic and special geometric `ℓ`-adic
Tate modules at good reduction for every `ℓ≠p`, compatibly with transition maps and the Weil
pairing; inertia acts trivially, and arithmetic Frobenius on the Tate module is the action of the
`q`-Frobenius endomorphism of the special fibre. On the dual, geometric Frobenius therefore has
the same eigenvalues as that endomorphism. This is the good-reduction comparison used to apply
AbelianSchemesAndArithmeticModuli §A6.21 in §5.5 and §5.7.

### From TauCetiRoadmap.PELModuli

§M3.2, *When the Hasse principle holds*: `hasseCases` (A) states that, for a unitary PEL datum of Case A
with CM centre `F/F⁺` and odd hermitian dimension, the map `ker¹(ℚ,Z)→ker¹(ℚ,G)` from the centre is a
bijection; `unitaryCentre_sha_vanishing`, the vanishing of the all-place obstruction groups of the
finite centre `Z₀` of `G^der`, is an input of its proof and is not consumed directly.

### From TauCetiRoadmap.Chebotarev and TauCetiRoadmap.GlobalNumberFields

Chebotarev Layer 10, implemented at the Tau Ceti pin as
`NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, with
`NumberField.Chebotarev.infinite_frobeniusPrimeSet` and
`NumberField.Chebotarev.hasDirichletDensity_iff_of_finite_symmDiff_frobeniusPrimeSet`
(`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean`): for a finite Galois extension of number
fields every conjugacy class is the Frobenius class of a set of primes of Dirichlet density `#C/#G`,
infinite and stable under finite changes. GlobalNumberFields Layer 1, implemented at the Tau Ceti pin as
`TauCeti.GlobalNumberFields.weakApproximation_denseRange`
(`TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean`): density of a number field in finitely
many mixed completions.

## How to read the build

Layer 0 uses the supplied `Conj(G)` over an arbitrary field and proves group Chevalley restriction and character separation; it adds the orthogonal outer quotient `Conj′` in characteristic
zero. Layer 1 is arithmetic descent: rationality from local data at almost every prime, algebraicity
over rational invariants, inner forms and quotient injections. Layer 2 is the global theory of
tori: classes with a prescribed real component, approximation of local tori, and the real cocharacter
twist. Layer 3 introduces Serre tori, prime-units and Weil points and proves the density and
rigidity statements. Layer 4 combines Layers 0–3 with inner twists to descend a family of
realizations to a rational torus embedding. Layer 5 specializes to Mumford–Tate groups of abelian
varieties: it fixes the cohomological conventions and proves the common rational Frobenius class from an
auxiliary group, the real elliptic representative and the rational representative away from one prime.
Layer 1 needs only Layer 0; Layer 2 uses its own localization and local openness targets; Layer 3 needs Layer 0; Layer 4 needs Layers 0–3; Layer 5 needs
Layers 0–2.

## Layer 0: Conjugacy quotients and semisimple classes

This layer works over an arbitrary field `k` except in §0.7, which assumes characteristic zero.
`G` is an affine group of finite type with coordinate Hopf algebra `O(G)`; from §0.3 on it is
connected reductive.

### 0.1 Regular class functions as an equalizer

For a commutative ring `k` and a commutative Hopf `k`-algebra `H`, `Suggested.lean` defines
`classFunctions k H` as the equalizer `AlgHom.equalizer` of `TauCeti.HopfAlgebra.conjugationAlgHom` and
`Algebra.TensorProduct.includeRight`: an element `f∈H` lies in it exactly when `c*(f)=1⊗f`, where `c*`
is the coordinate map of left conjugation with the conjugating point in the first factor. Prove that
`classFunctions k H` identifies with the arity-one invariant coordinate algebra of IntegralHeckeAndGaloisDeterminants
§0.7: `f` lies in it if and only if `f(gxg⁻¹)=f(x)` for every commutative `k`-algebra `A` and all
points `g,x∈G(A)`. For the forward direction evaluate `c*(f)=1⊗f` under
`Algebra.TensorProduct.productMap g x`, using `productMap_comp_conjugationAlgHom`. For the converse take
`A=H⊗H` with the two universal tensor-factor points; their conjugate is `c*` itself. The algebra is
the coordinate ring of the conjugacy quotient of KZ25 §5.1.3, p.47 (KZ25 lines 2091–2096) and KMPS22
§2.1.8, p.24 (KMPS22 lines 1079–1082), where it is written `O(H)^H`.
*Needs:* Mathlib `AlgHom.equalizer`, `Algebra.TensorProduct.includeRight`,
`Algebra.TensorProduct.productMap`; Tau Ceti `TauCeti.HopfAlgebra.conjugationAlgHom`,
`TauCeti.HopfAlgebra.productMap_comp_conjugationAlgHom`; IntegralHeckeAndGaloisDeterminants §0.7.

The API consists of the following facts.

- An element is a regular class function exactly when its image under the conjugation coordinate map
  is `1⊗f`; equivalently when its values at `gxg⁻¹` and `x` agree for all points with values in every
  commutative `k`-algebra, including nonreduced ones.
- The class functions form a `k`-subalgebra: scalars are class functions, and sums and products of
  class functions are class functions.
- A bialgebra map `φ:H′→H` (a group morphism `G→G′`) sends class functions of `H′` to class functions
  of `H`, by naturality `tensorProduct_map_comp_conjugationAlgHom`; the induced maps respect identities
  and composites.
- If `H` is cocommutative (the group is commutative) every element is a class function.
- For a flat `k`-algebra `K`, the natural map `K⊗C(H)→C(K⊗H)` is an isomorphism, since an equalizer of
  `k`-linear maps commutes with flat scalar extension.

**Checks.**

- For `G=G_m`, `O(G)=k[t,t⁻¹]` and every element is a class function: the class-function algebra is the
  whole Laurent ring, not its scalar subalgebra. A definition that took invariants of a nontrivial
  action would lose `t`.
- For the trivial group, `O(G)=k` and the class functions are `k`.
- Over `ℚ` the `(1,1)` entry of `GL₂` is not a class function: with `x=diag(2,3)` and `g` the
  coordinate swap, `(gxg⁻¹)_{11}=3` while `x_{11}=2`. A definition using invariance under left
  translations alone, or under a subgroup, would test a different condition.
- Trace and determinant of `GL₂` are class functions; `x_{11}+x_{22}` is invariant although neither
  summand is.

### 0.3 Group Chevalley restriction

Let `G` be connected reductive over a field `k`, `T⊂G` a maximal `k`-torus and `W=N_G(T)/T` its Weyl
group, a finite étale group scheme acting on `T` by conjugation. Restriction of functions maps `C(G)`
isomorphically onto `O(T)^W`; hence `Conj(G)≅T/W`.
No splitting, simple connectivity or characteristic assumption is made. Route: injectivity may be
checked over an algebraic closure, where semisimple elements are conjugate into `T` and are dense, so a
class function vanishing on `T` vanishes. Over a separable closure `k^s` the torus splits with character
lattice `X`. Surjectivity: the characters of the
simple representations are class functions (traces of comodules are conjugation invariant), and their
restrictions to `T` are the irreducible characters of ReductiveGroups Layer 10B. By
SchemeKTheoryOperations §6.3.1 these form a `ℤ`-basis of `ℤ[X]^W`, unitriangular with respect to the
Weyl orbit sums. Since `W` permutes the monomial basis of `ℤ[X]`, `k⊗ℤ[X]^W=k[X]^W` over every field,
so the characters span `k[X]^W`. Descend from `k^s` to `k`: class functions and `W`-invariants both
commute with flat scalar extension. The full character lattice `X` is used, including central directions; the result is
not deduced from the simply connected case. (Steinberg65 Lemmas 6.2–6.3 and Corollary 6.4, printed
pp.62–63, Steinberg65 lines 599–624, for semisimple groups over an algebraically closed field.)
*Needs:* §0.1; ArithmeticGaloisRepresentations §1.11 (affine quotient and flat base change); ReductiveGroups
Layers 4, 6, 7 and 10B; SchemeKTheoryOperations §6.3.1.

**Checks.**

- For `G=G_m`, `W=1` and `O(T)^W=k[t,t⁻¹]`: the quotient keeps the whole torus. A general reductive
  quotient is therefore not an affine space.
- For `GL_n` the diagonal torus gives `k[x₁^{±1},…,x_n^{±1}]^{S_n}=k[e₁,…,e_n,e_n⁻¹]`, the coefficients of
  the characteristic polynomial with invertible constant term.
- For `SL₂`, `X=ℤ` with `W` acting by `−1`, so `O(T)^W=k[a+a⁻¹]`; for `PGL₂`, with `α=a²`, it is
  `k[α+α⁻¹]`. The induced map `Conj(SL₂)→Conj(PGL₂)` is `s↦s²−2`. In characteristic different from two
  it is not injective on points: `s` and `−s≠s` collide (`±5/2↦17/4`), reflecting the centre `±1`. In
  characteristic two it is `s↦s²`, the Frobenius: bijective on points over an algebraically closed
  field, since the centre `μ₂` is infinitesimal, but not an isomorphism of schemes.
- For an anisotropic torus `T` (for example the norm-one torus of `ℚ(i)/ℚ`), `W=1` and `Conj(T)=T`,
  although `T` has no split maximal torus over `ℚ`.

### 0.5 Characters separate semisimple classes

For `G` connected reductive over an algebraically closed field `Ω` and semisimple `x,y∈G(Ω)`, prove
`isConj_iff_trace_eq`: `x` and `y` are conjugate if and only if, for every finite-dimensional comodule
`V` of `O(G)`, the traces of the actions of `x` and `y` on `V` agree. Equivalently, the characteristic
polynomials of `x` and `y` agree on every finite-dimensional representation. Route: traces of
representations are class functions, which gives one direction. Conversely, the characters of the
simple representations span `C(G)` by §0.3, so equal traces give equal values on all class functions,
and ArithmeticGaloisRepresentations §1.11 applies. (Steinberg65 Corollary 6.6(a)⇔(c)⇔(d), printed p.63, Steinberg65 lines 628–636;
KZ25 Proposition 5.3.5 and §5.3.6, pp.54–55, KZ25 lines 2392 and 2428–2431, apply it to Frobenius
classes.)
*Needs:* §0.3; ArithmeticGaloisRepresentations §1.11; Tau Ceti `TauCeti.Comodule.endOfPoint`, `TauCeti.FGComoduleCat`; Mathlib
`LinearMap.trace`; ReductiveGroups Layers 1 and 10B.

**Checks.**

- One faithful representation does not separate classes: under `t↦diag(t,t⁻¹)` of `G_m`, the points `2`
  and `1/2` have the same characteristic polynomial `X²−(5/2)X+1` but are distinct, hence not conjugate
  in the commutative group `G_m`. The character `t` itself separates them.
- For `SL₂` the trace of the standard representation already separates semisimple classes, because
  `Conj(SL₂)=𝔸¹` via that trace.
- Without semisimplicity the statement fails: `[[1,1],[0,1]]` and the identity have equal traces on every
  representation.

### 0.6 Finiteness of the quotient map of a faithful representation

Let `G` be connected reductive over a field `k` and `ρ:G→GL(V)` a closed immersion, `V`
finite-dimensional. Prove that `Conj(ρ):Conj(G)→Conj(GL(V))` is finite. Consequently, prove
`finite_classFunctions_map`: for a closed immersion `G→H` into an affine group `H` of finite type over
`k` (not necessarily reductive), given by a surjective bialgebra map `f:O(H)→O(G)`, the induced
algebra map `C(H)→C(G)`, the restriction of `f`, is finite. Indeed, choose a closed immersion
`H→GL(V)`; the composite `C(GL(V))→C(H)→C(G)` is finite by the first statement, and the image of
`C(GL(V))` in `C(G)` lies in the image of `C(H)`. Injectivity of `Conj(G)→Conj(H)` is not claimed.
Route: pass to an algebraic closure and a maximal torus `T`. The weights of `V` generate `X^*(T)`
because `ρ|_T` is a closed immersion. Each weight value is a root of the characteristic polynomial, hence
integral over its coefficients; its inverse is integral once `det⁻¹` is adjoined, by the reciprocal
polynomial. Thus `O(T)` is finite over the image of `C(GL(V))`, and the submodule `O(T)^W` is finite
over that noetherian image. Finiteness descends along the field extension. (KZ25 §5.3.2, p.53, KZ25
lines 2367–2391, use this to obtain algebraicity of Frobenius quotient points.)
*Needs:* §0.3; ArithmeticGaloisRepresentations §1.11; ReductiveGroups Layers 1 (faithful representations are closed immersions, the
embedding theorem) and 4; Mathlib `RingHom.Finite`.

**Checks.**

- `G_m→GL₂`, `t↦diag(t,t⁻¹)`, induces `t↦(t+t⁻¹,1)`, finite of degree two: `2` and `1/2` have the
  same image. Finiteness, not injectivity, is the conclusion.
- `SL₂⊂GL₂` induces the closed immersion `s↦(s,1)` of `𝔸¹` into `𝔸¹×G_m`.
- For the identity of `GL_n` the map is the identity; for the trivial group and `V=0` both quotients
  are a point.

### 0.7 Orthogonal outer automorphisms

Let `H` be connected reductive over a field `F` of characteristic zero. Over `F̄`, `H_der` is the almost
direct product of its almost simple normal subgroups `H_i`, `i∈I`. Let `I_D⊂I` be the set of `i` with
`H_i≅SO(2n_i)` for some `n_i≥4`; it is Galois stable. The finite group `∏_{i∈I_D}O(2n_i)/SO(2n_i)`, each
factor of order two, acts on `H_{F̄}` by improper orthogonal conjugation on the corresponding factor and
trivially on the others and on the connected centre; this is well defined up to inner automorphisms,
which act trivially on `Conj(H)`. With the Galois permutation of `I_D` it descends to a finite étale
`F`-group `Out′(H)` acting on `Conj(H)`. Define `Conj′(H)=Conj(H)/Out′(H)`, the finite affine quotient,
and `Aut′(H)` as the inverse image of `Out′(H)` under `Aut(H)→Out(H)`. Prove: the action is well
defined and independent of the orthogonal realization; `Conj(H)→Conj′(H)` is a finite categorical
quotient; formation commutes with field extension; and two semisimple `F̄`-points have the same image in
`Conj′(H)` if and only if they are conjugate under `Aut′(H)(F̄)`. Only actual `SO(2n)` factors are
selected: neither every factor of type `D` nor triality nor `Spin` factors. (KMPS22 §2.1.8, p.24, KMPS22
lines 1083–1092; §2.2.12, p.29, KMPS22 lines 1332–1338; Remark 2.3.16(2), p.36, KMPS22 lines 1652–1655;
Noot09 §1.5.)
*Needs:* §0.3; ArithmeticGaloisRepresentations §1.11; ReductiveGroups Layers 3 (finite group quotients, central products), 7 and 9D
(automorphism group, inner and outer automorphisms); EndoscopicTransferAndUnitaryTraceComparison §1.6 (Galois descent of
twisted forms).

The API consists of the following facts.

- Each selected factor contributes an order-two orthogonal outer automorphism, and Galois permutes the
  selected factors.
- The descended finite étale group acts on `Conj(H)`; every inner automorphism acts trivially there.
- The quotient map to `Conj′(H)` is finite and is the categorical quotient by `Out′(H)`, with unique
  factorization of invariant morphisms.
- Formation of `Out′`, `Conj′` and `Aut′` commutes with field extension.
- An automorphism lies in `Aut′(H)` exactly when its outer class lies in the selected orthogonal
  subgroup.

**Checks.**

- For `GL_n`, `H_der=SL_n` has no selected factor, so `Out′=1` and `Conj′=Conj`, although `GL_n` has the
  transpose-inverse outer automorphism for `n≥3`.
- For `SO(8)` the group `Out′` has order two, not the order-six triality group of the `D₄` diagram.
- For `Spin(8)` no almost simple factor is isomorphic to `SO(8)`, so `Out′=1`; for `SO(6)≅SL₄/μ₂` the
  bound `n≥4` excludes the factor, so again `Out′=1`.
- The identity point of `Conj(H)` is fixed by `Out′(H)`. For `H=SO(8)` and `t` with eight distinct
  eigenvalues `a₁^{±1},…,a₄^{±1}`, the conjugate of `t` by an improper reflection has a different image in
  `Conj(SO(8))`, because the centralizer of `t` in `O(8)` is a torus inside `SO(8)`, and the same image in
  `Conj′`. For `t` with eigenvalue `1` of multiplicity at least two the two images already agree in
  `Conj`.

### Examples

- `G_m`: `C=k[t,t⁻¹]`, `Conj=G_m`, the restriction theorem is trivial and every point is semisimple.
- `GL_n`, `n≥1`: `Conj(GL_n)=𝔸^{n−1}×G_m` by the coefficients of the characteristic polynomial (KZ25
  lines 2097–2098); semisimple classes are characteristic polynomials. For `n=0`, `GL₀` is trivial,
  `Conj(GL₀)=Spec k` and the characteristic polynomial is `1`.
- `SL₂` and `PGL₂`: both quotients are `𝔸¹`, and `Conj(SL₂)→Conj(PGL₂)` is `s↦s²−2`.
- `SL₁(D)` for a quaternion division algebra: `Conj≅𝔸¹`, with rational points that have no rational
  lift.

### Dependencies

Mathlib: `AlgHom.equalizer`, tensor products of algebras, `LinearMap.trace`, `IsConj`. Tau Ceti: the
conjugation coordinate map, reductivity, semisimple points, comodule point actions. ReductiveGroups
Layers 0, 1, 3, 4, 6, 7, 9D and 10B. IntegralHeckeAndGaloisDeterminants §0.7. SchemeKTheoryOperations
§6.3.1. ArithmeticGaloisRepresentations §1.11. EndoscopicTransferAndUnitaryTraceComparison §1.6, for the outer quotient of this layer's §0.7 only.

## Layer 1: Arithmetic descent and quotient injections

All fields have characteristic zero. The layer separates three notions: algebraicity of a point,
rationality of a quotient point, and rationality of a conjugacy class.

### 1.1 Jordan's covering lemma

Let `Γ` be a finite group and `Δ≤Γ` a subgroup such that every element of `Γ` is conjugate to an element
of `Δ`. Then `Δ=Γ`. Equivalently, every proper subgroup of a finite group misses some conjugacy class.
No normality of `Δ` is assumed. Route: `Γ` acts transitively on `Γ/Δ`, and a conjugate of `g` lies in
`Δ` exactly when `g` fixes a coset. By Burnside's count the average number of fixed cosets is one; the
identity fixes all `[Γ:Δ]` cosets and every other element fixes at least one, which forces
`[Γ:Δ]=1`. (KZ25 proof of Theorem 5.1.4, §5.3.6, p.55, KZ25 lines 2436–2439.)
*Needs:* Mathlib `MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group`.

**Checks.**

- In `S₃` a point stabilizer of order two misses the class of 3-cycles.
- In `Q₈` the subgroup `⟨i⟩` misses the class `{±j}`; in a cyclic group every conjugacy class is a single
  element, so the hypothesis already says `Δ=Γ`.
- Finiteness is needed: in `GL₂(ℂ)` every element is conjugate into the upper triangular Borel subgroup,
  which is proper.

### 1.2 Rational descent from local realizations

(a) Prove `finrank_eq_one_of_embeddings_padic`: let `K` be a number field such that, for all but finitely
many primes `ℓ`, there is a field embedding `K→ℚ_ℓ`. Then `[K:ℚ]=1`, that is `K=ℚ`. (b) Let `X` be an affine `ℚ`-scheme of finite type and `a∈X(ℚ̄)`. Suppose that for
all but finitely many primes `ℓ` there is an embedding `ι_ℓ:ℚ̄→ℚ̄_ℓ` with `ι_ℓ(a)∈X(ℚ_ℓ)`; the
embeddings may vary with `ℓ`. Then `a∈X(ℚ)`. Route: (b) follows from (a) applied to the residue field
`ℚ(a)` of the closed point under `a`, which `ι_ℓ` embeds in `ℚ_ℓ`. For (a), let `L` be a Galois closure,
`Γ=Gal(L/ℚ)` and `Δ=Gal(L/K)`. For `ℓ` unramified in `L`, an embedding `K→ℚ_ℓ` is a degree-one prime of
`K` above `ℓ`, equivalently a prime of `L` above `ℓ` whose Frobenius fixes a coset of `Δ`; so the
Frobenius class meets `Δ`. Chebotarev gives every class of `Γ` as a Frobenius class outside any finite
set, so every class meets `Δ`, and §1.1 gives `Δ=Γ`. (KZ25 §5.3.6, p.55, KZ25 lines 2433–2439.)
*Needs:* §1.1; Chebotarev Layer 10 (`NumberField.Chebotarev.infinite_frobeniusPrimeSet`).

**Checks.**

- A degree-one prime is weaker than complete splitting: for `K=ℚ(∛2)` every `ℓ≡2 mod 3` has a
  degree-one prime, but primes `ℓ≡1 mod 3` with `2` not a cube mod `ℓ` have none, so the hypothesis of
  (a) fails, consistently with `K≠ℚ`. At the ramified prime `2`, the residue degree is one
  but a cube root of `2` would have `2`-adic valuation `1/3`, so there is no embedding into `ℚ₂`;
  the degree-one-prime equivalence in the route is used only at unramified primes.
- "All but finitely many" cannot be weakened to "infinitely many": `ℚ(i)` embeds in `ℚ_ℓ` for every
  `ℓ≡1 mod 4`.
- The hypothesis concerns one fixed geometric point: `X=Spec ℚ[x]/((x²−2)(x²−17)(x²−34))` has a
  `ℚ_ℓ`-point for every prime `ℓ` (at `2` because `17≡1 mod 8`, at `17` because `2≡6² mod 17`, at odd
  `ℓ∤34` because the Legendre symbols of `2`, `17` and `34` multiply to `1`) and a real point, but no
  rational point, while each of its six `ℚ̄`-points is `ℚ_ℓ`-rational only for a set of primes of density
  one half. The superficially similar `(x²−2)(x²−3)(x²−6)` has no `ℚ₂`-point and no `ℚ₃`-point (`3≡3 mod 8`
  is not a `2`-adic square, `2` is not a square mod `3`, and the other two have odd valuation).

### 1.3 Algebraicity above rational invariants

Let `f:X→Y` be a finite morphism of affine `ℚ`-schemes of finite type, `y∈Y(ℚ)`, and `Ω⊇ℚ` a field.
Every `x∈X(Ω)` with `f(x)=y` factors through the finite `ℚ`-scheme `X_y=X×_Y Spec ℚ`, hence through a
closed point of `X_y` whose residue field `K` is a finite extension of `ℚ`, followed by a `ℚ`-embedding
`K→Ω`. So `x` is algebraic: for an algebraic closure `Ω̄` of `Ω` and any embedding `ℚ̄→Ω̄` extending
`K→Ω`, the image of `x` in `X(Ω̄)` comes from a `ℚ̄`-point. There are finitely many such `x`, at most
`dim_ℚ O(X_y)`. No embedding `ℚ̄→Ω` is asserted: `Ω` may be `ℚ`. Applied to §0.6: for a closed immersion `G→GL(V)` of a connected reductive
`ℚ`-group, a point of `Conj(G)(ℚ̄_ℓ)` whose characteristic polynomial has rational coefficients is
algebraic. Equality of these algebraic points for different `ℓ` is a separate input. (KZ25 §5.3.2, p.53,
KZ25 lines 2367–2391, and §5.3.6, KZ25 lines 2433–2434.)
*Needs:* §0.6; Mathlib finite algebras over a field (a finite-dimensional `ℚ`-algebra has finitely
many maximal ideals, each with finite residue field).

**Checks.**

- Finiteness, not finite type, is needed: for `𝔸¹→Spec ℚ` a transcendental element of `ℚ_ℓ` is a
  `ℚ_ℓ`-point that is not algebraic.
- For `G_m→GL₂`, `t↦diag(t,t⁻¹)`, the fibre over `(5/2,1)` is `{2,1/2}`; over `(s,1)` with `s²−4` not a
  square it is a pair of conjugate points over `ℚ(√(s²−4))`.
- For the identity of `GL_n` the fibre is a single rational point. For `X=Y=Spec ℚ`, `f=id` and `Ω=ℚ`
  the fibre has one point with residue field `ℚ`, although no embedding `ℚ̄→ℚ` exists (`√2` has no
  image): only the residue field of the point embeds in `Ω`.

### 1.4 Conjugacy quotients of inner forms

Let `G,G′` be connected reductive over a field `F` of characteristic zero and `ψ:G_F̄→G′_F̄` an inner
twist in the sense of EndoscopicTransferAndUnitaryTraceComparison §1.6. Then `Conj(ψ)` descends to an `F`-isomorphism
`Conj(G)≅Conj(G′)`. It is unchanged when `ψ` is replaced by `ψ∘Int(g)`, it carries geometric semisimple
classes to geometric semisimple classes, it commutes with field extension, it is the identity for
`ψ=id`, and it is compatible with composites of inner twists. Route: for `σ∈Γ_F`, `ψ⁻¹∘σ(ψ)` is inner,
and inner automorphisms act trivially on class functions, so the coordinate map of `Conj(ψ)` is
`Γ_F`-equivariant and descends by Galois descent of affine algebra maps. The isomorphism identifies
quotient points, not rational elements or rational classes. (KZ25 §6.1.1, p.55, KZ25 lines 2458–2462;
Remark 6.2.8, p.59, KZ25 lines 2622–2626.)
*Needs:* §0.1; ArithmeticGaloisRepresentations §1.11; EndoscopicTransferAndUnitaryTraceComparison §1.6 (inner twists and their composition); ReductiveGroups
Layer 0 (Galois descent of affine schemes).

**Checks.**

- For `G′=G` and `ψ=Int(g)` the identification is the identity of `Conj(G)`.
- For a quaternion algebra `D` over `ℚ`, `Conj(D^×)≅Conj(GL₂)=𝔸¹×G_m` by reduced trace and reduced norm.
- The twist must be inner: `U(1)` is an outer form of `G_m` over `ℚ`, and `Conj(U(1))=U(1)` is not
  isomorphic to `Conj(G_m)=G_m`, because their coordinate rings have unit groups `ℚ^×` and `ℚ^×·t^ℤ`.

### 1.5 Diagonal Weil-restriction injection

Let `F/ℚ` be a finite extension, `G` connected reductive over `ℚ`, and `H⊂Res_{F/ℚ}G_F` a connected
reductive `ℚ`-subgroup containing the diagonal image of `G`. Then `Conj(G)(ℚ̄)→Conj(H)(ℚ̄)` is injective
and `Γ_ℚ`-equivariant. For a character `ν:G→G_m`, the common-multiplier fibre product
`Res_{F/ℚ}G_F×_{Res_{F/ℚ}G_m}G_m` contains the diagonal `G`; the statement applies to its identity
component, which is connected reductive and contains the diagonal because `G` is connected, and to the
whole fibre product when `ker ν` is geometrically connected. For nontrivial `ν`, over `ℚ̄` this
fibre product is an extension of `G_m` by `∏_τ ker ν`; for trivial `ν` it is simply
`Res_{F/ℚ}G_F`, again connected reductive. Route: over `ℚ̄`,
`Res_{F/ℚ}G_F≅∏_{τ:F→ℚ̄}G` and the diagonal is `g↦(g,…,g)`. If the images of semisimple `g,g′` are
conjugate by `h=(h_τ)∈H(ℚ̄)`, then `h_τ⁻¹gh_τ=g′` in each factor, so `g` and `g′` are conjugate in
`G(ℚ̄)`; ArithmeticGaloisRepresentations §1.11 turns this into injectivity on quotient points. Equivariance holds because every map is
defined over `ℚ`. The conjugator orientation in the projected display is `h_τ⁻¹gh_τ=g′`. (KZ25 §6.1.6, pp.56–57; Lemma 6.2.6(2) and its proof, pp.58–59, KZ25 lines 2593–2611.)
*Needs:* ArithmeticGaloisRepresentations §1.11; ReductiveGroupsPartII §§RG2.0a.1–RG2.0a.2 (Weil restriction and its split product
formula on geometric points).

**Checks.**

- For `F=ℚ` the map is the identity.
- For `G=G_m`, `F` quadratic and `ν=id`, the fibre product is exactly the diagonal `G_m` and the map of
  quotients is an isomorphism. For `ν(t)=t²` the fibre product is `{(x,y):x²=y²}≅G_m×μ₂` over `ℚ̄`,
  disconnected; the statement applies to its identity component, the diagonal.
- The assertion is injectivity on geometric quotient points, not surjectivity: for `G=SL₂`, `ν=1` and
  `[F:ℚ]=2`, `H=Res_{F/ℚ}SL₂` is `SL₂×SL₂` over `ℚ̄`, and the quotient point with traces `(0,1)` is not
  the image of a point of `Conj(SL₂)`, whose image consists of the pairs `(s,s)`.

### 1.6 Central-product injection

Let `H` be connected reductive over a field of characteristic zero and `T` a torus containing the centre
`Z_H` as a closed subgroup. Put `H₁=(H×T)/Z_H`, with `Z_H` embedded antidiagonally by `z↦(z,z⁻¹)`. The
closed immersion `h↦[(h,1)]` induces an injection `Conj(H)(Ω)→Conj(H₁)(Ω)` for every algebraically closed
`Ω`, compatible with the Galois action over the base field. Route: lift a conjugator to `(h′,t)` using
surjectivity of `H×T→H₁` on `Ω`-points. Conjugation gives `[(h′xh′⁻¹,1)]`; if this equals `[(y,1)]`, then
`(h′xh′⁻¹,1)=(yz,z⁻¹)` for some `z∈Z_H`, so `z=1` and `y=h′xh′⁻¹`. (KZ25 Lemma 6.2.6(2), pp.58–59,
KZ25 lines 2612–2617.)
*Needs:* ArithmeticGaloisRepresentations §1.11; ReductiveGroups Layers 3 and 6 (central quotients, surjectivity on points over an
algebraically closed field).

**Checks.**

- For `H=SL₂` and `T=G_m⊃μ₂`, `H₁=(SL₂×G_m)/μ₂≅GL₂`, and `Conj(SL₂)=𝔸¹→Conj(GL₂)` is `s↦(s,1)`, injective.
- The torus coordinate is indispensable: `SL₂→PGL₂` induces `s↦s²−2`, which identifies the classes of
  `diag(2,1/2)` and `diag(−2,−1/2)`.
- If `Z_H=1`, then `H₁=H×T` and the injection is `x↦(x,1)`.

### Examples

- Jordan's lemma in `S₃` and the descent of §1.2 for `ℚ(∛2)` show why complete splitting is not the
  hypothesis.
- For `G_m→GL₂`, `t↦diag(t,t⁻¹)`, §1.3 gives algebraic fibres of degree two and §0.6 their
  finiteness.
- `GL₂` and `D^×` have the same conjugacy quotient over `ℚ`; `GL₂` contains `(SL₂×G_m)/μ₂` as a central
  product into which `Conj(SL₂)` injects.

### Dependencies

Layer 0. Mathlib Burnside counting. Chebotarev Layer 10. EndoscopicTransferAndUnitaryTraceComparison §1.6. ReductiveGroups Layers 0,
3 and 6. ArithmeticGaloisRepresentations §1.11. ReductiveGroupsPartII §§RG2.0a.1–RG2.0a.2.

## Layer 2: Global tori and real cocharacter adjustment

Fix embeddings `ℚ̄→ℂ` and `ℚ̄→ℚ̄_p`; complex conjugation `c` acts on `ℂ`-points. Three different
assertions recur and stay separate: a rational torus with prescribed local conjugacy types (§2.2), a
global cohomology class with prescribed local components (§2.1), and a twist of a torus together with
its cocharacter (§2.5).

### 2.0 Localization of torus cohomology

For a torus `T` over a number field `F`, let `Γ` be the Galois group of a finite Galois splitting
field and `Γ_v` its decomposition group at a place `v`. Construct the homomorphism from the direct
sum of the local groups `H¹(F_v,T)` to `(X_*(T)_Γ)_tors` by summing the local Tate–Nakayama maps
followed by the projections of coinvariants. Prove that its kernel is exactly the image of
`H¹(F,T)`: a finite-support tuple of local classes comes from a global class if and only if its
sum is zero. No injectivity of localization or surjectivity of this sum is asserted. Use the
cup product with the positive fundamental class of EndoscopicTransferAndUnitaryTraceComparison §1.2, and the same sign
at each place (Kottwitz86 Proposition 2.6, printed p.377; KMPS22 proof of Lemma 1.2.1, pp.13–14,
KMPS22 lines 600–609).
*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§1.1–1.2 (continuous torus cohomology,
local and global Tate–Nakayama, functoriality and the global-mod-local group).

The API consists of the following facts.

- Localization of a global class has finite support and has zero sum of local invariants.
- Every finite-support tuple with zero sum has a global lift; its possible lifts differ by the
  kernel of localization.
- The construction commutes with homomorphisms of tori and extension of the splitting field.

**Checks.**

- For `T=G_m`, Hilbert 90 gives zero at the source and at every local `H¹`, and the lattice
  coinvariants are `ℤ` with torsion subgroup zero: the sequence is `0→0→0`.
- For the norm-one torus of `ℚ(i)`, the real sign class has invariant `1` in `ℤ/2`; at `3`, an inert
  prime, the nontrivial local class also has invariant `1`, so the pair sums to `0` and lifts.
- For that torus the tuple nontrivial only at `∞` has sum `1` and cannot lift. The inverse at one
  place is essential: for an unramified cubic local norm-one torus, label its `ℤ/3` so the
  uniformizer class has invariant `1`; its cancelling class is `2`, since `1+2=0` and `1+1=2≠0`.

### 2.1 Global torus classes with prescribed real component

Let `T` be a torus over `ℚ` and `p` a prime. The localization map `ker(H¹(ℚ,T)→H¹(ℚ_p,T))→H¹(ℝ,T)` is
surjective. More precisely, every `α_∞∈H¹(ℝ,T)` is the real component of a class `α∈H¹(ℚ,T)` whose
component is trivial at every finite place except one auxiliary prime `ℓ≠p`. The prime `ℓ` can be chosen
in a set of primes of positive Dirichlet density avoiding any given finite set. Route: choose a finite
Galois splitting field `E` with group `Γ`, and let `c∈Γ` be the image of complex conjugation. For `ℓ`
unramified in `E` with a Frobenius conjugate to `c`, conjugation identifies the local coinvariants at
`∞` and at `ℓ` compatibly with their projections to `(X_*(T)_Γ)_tors`. Take `α_ℓ` to cancel the image of
`α_∞` there. The exact localization sequence of §2.0 then lifts the family that is
`α_∞` at `∞`, `α_ℓ` at `ℓ` and trivial elsewhere to a global class. Chebotarev supplies infinitely many
such `ℓ` outside any finite set. If `H¹(ℝ,T)=0` the trivial class suffices. (KMPS22 Lemma 1.2.1 and its
proof, pp.13–14, KMPS22 lines 596–624; Kottwitz86 Proposition 2.6, Kottwitz86 line 491.)
*Needs:* EndoscopicTransferAndUnitaryTraceComparison §1.2 (local Tate–Nakayama, `H¹(F_v,T)≅(X_*(T)_{Γ_v})_tors`); §2.0 (localization exactness); Chebotarev Layer 10.

**Checks.**

- For `T=G_m` every group `H¹` here vanishes (Hilbert 90) and `α=0`.
- For the norm-one torus `T` of an imaginary quadratic field `E`, `H¹(ℝ,T)=ℤ/2`, and the nontrivial real
  class needs a nontrivial finite component: `(X_*(T)_Γ)_tors=ℤ/2` and the local invariants of a global
  class sum to zero. The auxiliary `ℓ` is then inert in `E`.
- For `T` split over `ℝ`, `H¹(ℝ,T)=0`; the statement is empty and no auxiliary prime is needed.

### 2.1a Local centralizers of regular Lie elements

Let `F` be a characteristic-zero local field, `G/F` connected reductive and `T⊂G` a maximal
`F`-torus. Prove that the subset of `Lie(G)(F)` consisting of regular semisimple elements whose
centralizer is `G(F)`-conjugate to `T` is open. For `X∈Lie(T)(F)` regular, the differential of
`G/T×Lie(T)_reg→Lie(G)`, `([g],Y)↦Ad(g)Y`, at `(1,X)` is
`(Z mod Lie(T),Y)↦[Z,X]+Y`. It is an isomorphism: after splitting `T`, its root-space factors
are multiplication by the nonzero root values of `X`, and its torus factor is the identity.
The local inverse function theorem gives an open neighborhood in the image at every such
point. Include `F=ℂ` and finite extensions of `ℚ_p`; for `F=ℝ` the statement is the real
regular-centralizer comparison of ShimuraVarieties §P.5. Regularity supplies each required
nonvanishing root value. The openness is the step that the proof of Harder's lemma asserts
without argument: a rational Lie element close to the chosen regular local elements has a
centralizer of the prescribed local type (Harder66 proof of Lemma 5.5.3, printed p.407, Harder66
lines 527–532). Harder chooses local elements with pairwise distinct root values, whereas
regularity suffices for the differential argument above, which proves the step. Harder's
approximation theorem itself is the consumer §2.2 (Borovoi98 Lemma 5.6.3, p.37; KMPS22 Lemma
1.2.2, p.14).
*Needs:* ReductiveGroups Layers 2 and 7 (Lie algebra, root spaces, centralizers);
ReductiveGroupsPartII §RG2.0.2 (local analytic charts and inverse function theorem in the
nonarchimedean case); ShimuraVarieties §P.5 (the real regular-centralizer comparison);
ReductiveGroups §3A.5 (complex Lie charts).

**Checks.**

- For `GL₂` and `X=diag(1,2)`, the two off-diagonal differential factors are `1` and `−1` and
  the diagonal factors are `1`; the centralizer is the split diagonal torus.
- At `X=diag(1,1)`, those off-diagonal factors are `0`, the centralizer is `GL₂`, and the inverse
  function argument fails. Excluding the root hyperplanes is necessary.
- For `GL₂(ℝ)`, a matrix with characteristic polynomial `t²+1` has negative discriminant `−4`;
  this remains negative nearby, giving the open nonsplit-torus locus. A diagonal matrix with
  eigenvalues `1,2` has discriminant `1`, in the distinct split-torus locus.
- For a torus, the root set is empty, `G/T=1`, and the displayed differential is the identity
  on `Lie(T)`, including its zero-dimensional case.

### 2.2 Approximation of maximal tori

Let `F` be a number field, `G` connected reductive over `F`, `S` a finite set of places of `F` (finite or
archimedean) and, for each `v∈S`, `T_v⊂G_{F_v}` a maximal `F_v`-torus. Prove
`exists_isMaximalTorus_conjugate`: there is a maximal `F`-torus `T⊂G` such that `T_{F_v}` is
`G(F_v)`-conjugate to `T_v` for every `v∈S`. This approximates conjugacy types of tori; it is not weak
approximation for `G(F)`. Route: choose regular semisimple `X_v∈Lie(G)(F_v)` with centralizer `T_v`. The
set of regular semisimple elements whose centralizer is `G(F_v)`-conjugate to `T_v` is open. By weak
approximation in the `F`-vector space `Lie(G)(F)`, choose `X∈Lie(G)(F)` in all these opens. Then `X` is
regular semisimple, and its centralizer is a maximal `F`-torus with the required local types. (Harder66
Lemma 5.5.3 and its proof, p.407, Harder66 lines 524–532; KMPS22 Lemma 1.2.2, p.14, KMPS22 lines 625–629;
Borovoi98 Lemma 5.6.3, p.37, Borovoi98 lines 1448–1451.)
*Needs:* §2.1a (local centralizer openness);
GlobalNumberFields Layer 1 (`TauCeti.GlobalNumberFields.weakApproximation_denseRange`, applied
coordinatewise);
ReductiveGroups Layers 2 and 7 (Lie algebra, centralizers of regular semisimple elements); Tau Ceti
`TauCeti.HopfIdeal.IsMaximalTorus`, `TauCeti.HopfIdeal.conjugate`,
`TauCeti.CommHopfAlgCat.baseChangeHopfIdeal`.

**Checks.**

- For `S=∅` the conclusion is the existence of a maximal `F`-torus (`TauCeti.HopfIdeal.exists_isMaximalTorus`).
- For `G=GL₂` over `ℚ` and `S={∞,p}`, prescribing the elliptic real torus `ℂ^×` and the split torus at
  `p` is met by `T=Res_{E/ℚ}G_m` for an imaginary quadratic `E` in which `p` splits.
- For a torus `G=T` the only maximal torus is `T` itself; the statement holds with `T_v=T_{F_v}`, the only
  possible choice.

### 2.3 Global tori with elliptic real fibre

Let `G` be connected reductive over `ℚ`, suppose `G_ℝ` has an elliptic maximal torus, and let `T_p⊂G_{ℚ_p}`
be a maximal torus. There is a maximal `ℚ`-torus `T⊂G` whose real fibre is elliptic and whose `p`-adic
fibre is `G(ℚ_p)`-conjugate to `T_p`. Route: apply §2.2 to `S={∞,p}`; ellipticity is preserved by
`G(ℝ)`-conjugacy. The existence of an elliptic real torus is a hypothesis; for the groups of Layer 5 it
comes from the Cartan involution `Int(h(i))` (§5.1). (KMPS22 proof of Proposition 1.2.5, p.14, KMPS22
lines 653–658.)
*Needs:* §2.2.

**Checks.**

- For split `GL₂` one may prescribe the imaginary quadratic real torus and any maximal torus at `p`.
- For `G=G_m` the torus `G_m` is elliptic, because it is anisotropic modulo the centre `G_m`; ellipticity
  is relative to the centre.
- The hypothesis is needed: for `G=Res_{ℚ(i)/ℚ}SL₂`, `G_ℝ` is `SL₂(ℂ)` viewed as a real group, which has no
  elliptic maximal torus.

### 2.4 Real Weyl cocycles

Let `G` be connected reductive over `ℚ`, `T` a maximal `ℚ`-torus, and `T_sc` its inverse image in the
simply connected cover `G_sc` of `G_der`. Assume `T_sc` is anisotropic over `ℝ`. Then `c` acts by `−1`
on `X_*(T_sc)` and therefore commutes with every element of the Weyl group `W(G,T)(ℂ)`. For `w` in it and
a representative `n∈N_{G_sc}(T_sc)(ℂ)`, define `a=n⁻¹c(n)`. Then `a∈T_sc(ℂ)`, `a·c(a)=1`, so `a` is a real
1-cocycle, and its class in `H¹(ℝ,T_sc)` is independent of `n`. Its image in `H¹(ℝ,G_sc)` is trivial,
since `a` is the coboundary of `n` there. The convention is `n⁻¹c(n)` throughout; the cocycle `n c(n)⁻¹`
used in the source requires the matching coboundary convention `gσ(g)⁻¹`. (KMPS22 proof of Proposition
1.2.5, pp.14–15, KMPS22 lines 665–669.)
*Needs:* ReductiveGroups Layers 4, 6 and 7 (tori, simply connected covers, normalizers and Weyl groups);
EndoscopicTransferAndUnitaryTraceComparison §1.1 (real `H¹`).

The API consists of the following facts.

- The element `n⁻¹c(n)` lies in `T_sc(ℂ)` and satisfies the real cocycle identity.
- Replacing `n` by `nt` with `t∈T_sc(ℂ)` multiplies the cocycle by the coboundary `t⁻¹c(t)`, since `T_sc`
  is commutative; the class depends only on `w`.
- For `w=1` and `n=1` the cocycle and its class are trivial.
- The image of the class in `H¹(ℝ,G_sc)` is trivial, trivialized by `n`.
- Conjugation by `n` carries a cocharacter `μ` of `T` to `wμ`; §2.5 uses this with the cocycle
  orientation fixed above.

**Checks.**

- For `w=1` and `n=1`, `a=1`.
- For the compact torus `SO(2)⊂SL₂(ℝ)`, the element `n=diag(i,−i)∈SL₂(ℂ)` normalizes `SO(2)` and acts by
  inversion, and `n⁻¹c(n)=−1`. Identifying `SO(2)(ℂ)` with `ℂ^×` and `c` with `z↦1/z̄`, the cocycles are the
  real numbers and the coboundaries the positive reals, so `−1` is the nontrivial class of
  `H¹(ℝ,U(1))=ℤ/2`; every representative of the nontrivial Weyl element gives this class.
- The anisotropy hypothesis matters: for the maximal torus of `GL₃(ℝ)` of type `ℂ^×·ℝ^×`, `c` swaps two
  coordinates of `X_*=ℤ³`. For the transposition `w=(1 3)`, `c(n)` has Weyl image `(2 3)`, so `n⁻¹c(n)`
  does not lie in the torus.

### 2.5 Global adjustment of real cocharacters

Let `G` be connected reductive over `ℚ`, `T` a maximal `ℚ`-torus with `T_sc` anisotropic over `ℝ`,
`h:S→T_ℝ` a homomorphism from the Deligne torus and `μ_h` its Hodge cocharacter. Let `μ∈X_*(T)` and
`w∈W(G,T)(ℂ)` satisfy `wμ=μ_h` under the fixed embedding `ℚ̄→ℂ`. Then there is `g∈G_sc(ℚ̄)` such that:
(i) `T′=gTg⁻¹` is defined over `ℚ`; (ii) there is `u∈G_sc(ℝ)` with `h′=Int(u)∘h` factoring through `T′_ℝ`,
so `h′` is `G(ℝ)`-conjugate to `h`, and `μ_{h′}=Int(g)μ`; (iii) there is `t_p∈T_sc(ℚ̄_p)` with
`g_p=gt_p⁻¹∈G_sc(ℚ_p)`, so `Int(g_p)` carries `T_{ℚ_p}` onto `T′_{ℚ_p}` and `μ` to `μ_{h′}` exactly.
Route: choose `n` representing `w` and the class `[a]` of §2.4. By §2.1, lift it to
`α∈H¹(ℚ,T_sc)` with trivial `p`-component. Its image in `H¹(ℚ,G_sc)` is trivial at `∞` and, by
Kneser's theorem, at every finite place, hence trivial by the Hasse principle for `G_sc`. Write
`α_σ=g⁻¹σ(g)` with `g∈G_sc(ℚ̄)`; then `gTg⁻¹` is Galois stable. At `∞`, `g⁻¹c(g)=t⁻¹n⁻¹c(n)c(t)` for some
`t∈T_sc(ℂ)`, so `u=gt⁻¹n⁻¹` is real and `Int(g)μ=Int(u)(wμ)=Int(u)(μ_h)`. At `p`, triviality of `α_p`
gives `t_p`. (KMPS22 Proposition 1.2.5 and its proof, pp.14–15, KMPS22 lines 648–683.)
*Needs:* §2.1; §2.4; EndoscopicTransferAndUnitaryTraceComparison §1.9(a) and (c) (Kneser's vanishing and the Hasse principle
for simply connected groups); ReductiveGroupsPartII §RG2.0a.3 (the Deligne torus).

**Checks.**

- For `w=1` the class is trivial and `g=1`, `T′=T`, `h′=h`.
- For `G=GL₂`, `T=Res_{E/ℚ}G_m` with `E` imaginary quadratic and `h` the standard elliptic Hodge map,
  `μ` and `μ_h` are the two cocharacters `z↦diag(z⁻¹,1)` and `z↦diag(1,z⁻¹)` in a diagonalization
  over `ℂ`, and `w` is the nontrivial Weyl element. At `z=2` their values are `diag(1/2,1)` and
  `diag(1,1/2)`, exchanged by `w`, in the cohomological convention of §5.1. `H¹(ℝ,T_sc)=ℤ/2`, with `T_sc` the norm-one torus, and the conclusion
  produces a rational torus `T′` with `μ_{h′}=Int(g)μ`.
- At `p` the conclusion is `G_sc(ℚ_p)`-conjugacy of the tori with exact transport of `μ`, not equality of
  `T_{ℚ_p}` and `T′_{ℚ_p}`.

### Examples

- `GL₂` over `ℚ` with `S={∞,p}`: the torus `Res_{E/ℚ}G_m` of an imaginary quadratic `E` in which `p` splits
  is elliptic at `∞` and split at `p`.
- The norm-one torus of `ℚ(i)`: its nontrivial real class is realized globally only with an auxiliary
  inert prime.
- `SL₂(ℝ)⊃SO(2)`: the real Weyl cocycle `−1`.

### Dependencies

EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.2 and 1.9. Chebotarev Layer 10. GlobalNumberFields Layer 1. ShimuraVarieties
§P.5. ReductiveGroups Layers 2, 4, 6 and 7 and §3A.5. ReductiveGroupsPartII §§RG2.0.2 and RG2.0a.3. Tau Ceti
maximal-torus, Hopf-ideal conjugation and base-change APIs.

## Layer 3: Serre tori, prime-units, Weil points and rigidity

Fix an embedding `ℚ̄→ℂ` and write `c` for complex conjugation, viewed as an element of `Γ_ℚ`. A torus over
`ℚ` is described by its cocharacter lattice `X_*(T)` with `Γ_ℚ`-action (ReductiveGroups Layer 4).
Weights of Weil numbers are integers; different eigenvalues of one point may have different weights.

### 3.1 The Serre condition

A `ℚ`-torus `T` satisfies the Serre condition, `IsSerreTorus`, when its maximal `ℝ`-split subtorus
`T_s⊂T_ℝ` is the base change of a `ℚ`-split subtorus of `T`. On coordinate Hopf algebras: there is a
Hopf ideal of `O(T)` with split-torus quotient whose base change is minimal among the Hopf ideals of
`O(T_ℝ)` with split-torus quotient. Ideals reverse inclusions of subgroups, and a torus has exactly
one maximal split subtorus, so this minimal ideal defines `T_s`. Prove that this holds if and only if the `(+1)`-eigenspace of `c`
on `X_*(T)⊗ℚ` equals the `Γ_ℚ`-fixed subspace. Under the condition the `(−1)`-eigenspace is
`Γ_ℚ`-stable. Hence the maximal compact real subtorus `T_c` descends to a `ℚ`-subtorus and `T/T_c` is
`ℚ`-split. Route: `X_*(T_s)⊗ℚ` is the `(+1)`-eigenspace, and a subtorus is defined over `ℚ` and split
exactly when its saturated cocharacter lattice is `Γ_ℚ`-fixed; the fixed space always lies in the
`(+1)`-eigenspace because `c∈Γ_ℚ`. By semisimplicity of the rational `Γ_ℚ`-module, a stable complement of
the fixed space is the `(−1)`-eigenspace. The condition is the descent of the maximal real split torus.
Since the `Γ_ℚ`-fixed subspace always lies in the `c`-fixed one, the condition is equivalent to
the equality of ranks `rank_ℚ(T)=rank_ℝ(T_ℝ)`; the eigenspace formulation in addition identifies the
descended subtori. (KMPS22 §2.2.3, p.25, KMPS22 lines 1125–1126; proof of Lemma 2.2.4, KMPS22 lines
1138–1142.)
*Needs:* ReductiveGroups Layers 4 and 7 (tori, cocharacters and the absolute root datum with Galois action);
Tau Ceti `TauCeti.splitTorusCommHopfAlgProperty`, `TauCeti.torusCommHopfAlgProperty`,
`TauCeti.CommHopfAlgCat.baseChangeHopfIdeal`.

The API consists of the following facts.

- The condition is equivalent to equality of the `c`-fixed and `Γ_ℚ`-fixed rational cocharacters.
- Under the condition the maximal compact real subtorus is defined over `ℚ` and the quotient by it is
  `ℚ`-split.
- A product of tori satisfies the condition exactly when both factors do; its real split subtorus is the
  product.
- The condition is invariant under `ℚ`-isogeny, since it depends only on `X_*(T)⊗ℚ`.
- Under the condition, for every geometric character `χ`, the character `χ+cχ` is defined over `ℚ`
  and factors through `T/T_c`. Without it this fails: on the norm-one torus of `ℚ(√3)/ℚ`, `χ+cχ=2χ`
  for the generator `χ`, and `Γ_ℚ` sends `2χ` to `−2χ`.

**Checks.**

- `G_m` and every split torus satisfy the condition, with `T_c=1`. The trivial torus does too: it is
  the split torus of rank zero, and its only subtorus is itself.
- The norm-one torus of an imaginary quadratic field satisfies it: `X_*=ℤ` with `c=−1`, so `T_s=1` and
  `T_c=T`.
- The norm-one torus of `ℚ(√3)/ℚ` fails it: `c` acts trivially on `X_*=ℤ` while `Γ_ℚ` acts by `−1`, so
  `T` is split over `ℝ` but has no nontrivial `ℚ`-split subtorus. The ranks already detect this:
  `rank_ℝ=1` and `rank_ℚ=0`, and equality of the two ranks is equivalent to the condition.
- `Res_{F/ℚ}G_m` for a CM field `F` of degree `2d`, `d>1`, fails it: the `c`-fixed subspace has dimension
  `d` and the `Γ_ℚ`-fixed subspace dimension one.

### 3.2 Prime-units

For a number field `F`, a linear algebraic group `H` over `F`, a prime `l` and `γ∈H(F)`, `γ` is an
`l`-unit when, for every finite place `v` of `F` not dividing `l`, the subgroup `{γⁿ : n∈ℤ}` is relatively
compact in `H(F_v)` for the point topology `TauCeti.PointTopology.topology`, in which `H(F_v)` is
locally compact. `IsPrimeUnit` is this predicate for `F=ℚ`, where the finite places not
dividing `l` are the primes `v≠l` and `F_v=ℚ_v`: the closure of `{γⁿ}` in `H(ℚ_v)` is compact. No condition is imposed at
archimedean places: the source writes "every place `v∤l`", but its Lemma 2.2.4 needs finite places only,
since `l` itself is an `l`-unit of `G_m`. Prove: relative compactness may be tested in one faithful closed
embedding into `GL_n`; for a torus split over `L`, `γ` is an `l`-unit exactly when every character value
`χ(γ)∈L^×` has valuation zero at all finite places of `L` not above `l`. (KMPS22 §2.2.3, p.25, KMPS22
lines 1126–1128.)
*Needs:* Tau Ceti `TauCeti.PointTopology.topology`, `TauCeti.PointTopology.isTopologicalGroup`,
`TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective` (closed immersions give closed
embeddings of local points) and `TauCeti.PointTopology.instLocallyCompactSpaceWithConv` (local
compactness), with Mathlib `Padic.instProperSpace` and Tau Ceti
`IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion` for the local
coefficient fields; ReductiveGroups Layers 1 and 4.

The API consists of the following facts.

- For a torus, the `l`-unit condition is the vanishing of all valuations of all geometric character values
  away from `l`.
- Morphisms of algebraic groups preserve `l`-units, and closed immersions reflect them.
- Integer powers of an `l`-unit are `l`-units, and `1` is one.
- Conjugation by `H(F)` preserves the condition.
- Products and inverses of commuting `l`-units are `l`-units; in a torus the `l`-units form a subgroup.
  The `l`-units of a noncommutative group do not form a subgroup in general.

**Checks.**

- For `H=G_m` over `ℚ`, the `l`-units are exactly `±lⁿ`, `n∈ℤ`.
- Inverse powers matter: for a prime `q≠l`, the positive powers of `q` are bounded in `ℚ_q`, but `{qⁿ}`
  is not relatively compact in `ℚ_q^×`, because `q⁻ⁿ` is unbounded; boundedness in the ambient affine line
  is not the group condition.
- For `q≠l`, `a=[[1,1/q],[0,1]]` is an `l`-unit: its powers lie in the compact set of unipotent matrices
  with upper entry of `q`-adic absolute value at most `q`.
- With `b=[[1,0],[1/q,1]]`, also an `l`-unit, the product `ab` has trace `2+1/q²`, which is not
  `q`-integral, so `ab` lies in no compact subgroup of `GL₂(ℚ_q)` and is not an `l`-unit.

### 3.3 Prime-Weil numbers

For a prime `l` and `w∈ℤ`, an `l`-Weil number of weight `w` is an `α∈ℚ̄^×` that is a Weil `l`-number of
weight `w` in the sense of DeligneWeightsAndPurity §0.1 (`|σ(α)|=l^{w/2}` for every embedding
`σ:ℚ(α)→ℂ`) and is a unit at every finite place of `ℚ(α)` not above `l`. Negative weights are allowed and
`α` need not be integral at `l`. `IsPrimeWeilNumber` is this predicate on complex numbers, through the
fixed embedding `ℚ̄→ℂ`: `α` is algebraic, every root of its minimal polynomial has absolute value `l^{w/2}`,
and `lⁿα` and `lⁿα⁻¹` are algebraic integers for some `n≥0`, which says that `α` is a unit of the ring of
integers with `l` inverted. Zero is excluded by the absolute values. Prove that the unit condition is independent of the number field
containing `α`, and that the `l`-Weil numbers of all weights form a subgroup of `ℚ̄^×`, with weights adding
under products. (KMPS22 §2.2.1, p.24, KMPS22 lines 1107–1109.)
*Needs:* DeligneWeightsAndPurity §§0.1–0.2 (Weil `q`-numbers, uniqueness of weight, products, inverses);
Mathlib number-field valuations.

The API consists of the following facts.

- The weight of an `l`-Weil number is unique (DeligneWeightsAndPurity §0.1).
- Galois conjugates of an `l`-Weil number are `l`-Weil numbers of the same weight.
- The product of `l`-Weil numbers of weights `w,w′` is one of weight `w+w′`; the inverse of one of weight `w`
  has weight `−w`.
- Every root of unity is an `l`-Weil number of weight zero for every `l`.

**Checks.**

- `l` has weight `2` and `l⁻¹` has weight `−2`; both are units away from `l`.
- `(2+i)/(2−i)∈ℚ(i)` has absolute value `1` under both embeddings and is a unit away from `5`, so it is a
  `5`-Weil number of weight `0`. It is neither a root of unity nor an algebraic integer, and it is not an
  `l`-Weil number for any `l≠5`.
- For distinct primes `q,l`, `q` is a Weil `q`-number of weight `2` but not an `l`-Weil number: it is not a
  unit at `q`.
- `2+√3` is a unit at every finite place, but its conjugates have different absolute values, so it is not
  a Weil number of any weight.

### 3.4 Weil points of algebraic groups

For a linear algebraic group `H` over `ℚ` and a prime `l`, `γ∈H(ℚ)` is an `l`-Weil point when, in one
faithful finite-dimensional representation over a field of characteristic zero, every eigenvalue of `γ`
is an `l`-Weil number; different eigenvalues may have different weights. A Weil point is an `l`-Weil point
for some `l`. Semisimplicity is not part of the definition. Prove independence of the faithful
representation. `IsPrimeWeilPoint` imposes the eigenvalue condition on every finite-dimensional
comodule over `ℚ`; by this independence it is the same predicate, and it needs no choice of a
faithful representation. Route: by AdelicAlgebraicGroups §4.3, every eigenvalue of `γ` in any algebraic
representation lies in the multiplicative group generated by its eigenvalues in a faithful one, and the
`l`-Weil numbers form a group (§3.3). (KMPS22 §2.2.1, pp.24–25, KMPS22 lines 1110–1118.)
*Needs:* §3.3; AdelicAlgebraicGroups §4.3 (eigenvalues of algebraic tensor subquotients);
ReductiveGroups Layer 1.

The API consists of the following facts.

- The condition in one faithful representation is equivalent to the condition in every algebraic
  representation.
- Morphisms of algebraic groups preserve `l`-Weil points, compatibly with identities and composites, and
  closed immersions reflect them.
- Every integer power of an `l`-Weil point is one; eigenvalue weights are multiplied by the exponent.
- Conjugation preserves `l`-Weil points.
- For a torus, `γ` is an `l`-Weil point exactly when every geometric character value at `γ` is an
  `l`-Weil number.

**Checks.**

- `diag(l,1)∈GL₂(ℚ)` is an `l`-Weil point with eigenvalue weights `2` and `0`.
- A nonidentity upper unipotent matrix is an `l`-Weil point of weight `0` for every `l`, but it is not
  semisimple: being a Weil point does not give a neat semisimple point.
- The identity is an `l`-Weil point for every `l`, also in the trivial group.
- The scalar `q∈G_m(ℚ)` is not an `l`-Weil point when `q` and `l` are distinct primes.

### 3.5 Neatness and cyclic torus closures

Let `F` be a number field with an embedding `F→ℂ`, `H` linear algebraic over `F`, and `γ∈H(F)` semisimple.
The Zariski closure `S` of `{γⁿ}` is of multiplicative type over `F` and diagonalizable over `F̄`, not
in general over `F`. Prove that `S` is connected, hence an `F`-torus, exactly when
the eigenvalues of `γ` in a faithful `F`-representation generate a torsion-free subgroup of `ℂ^×`, that is,
when `γ` is neat in the sense `Neat.IsNeatAut` of AdelicAlgebraicGroups §4.3. So "neat" in the sense of
KMPS22 §2.1.8 (semisimple with connected cyclic closure) means semisimple and neat. For `F=ℚ`,
`IsNeatPoint` is this eigenvalue condition imposed on every finite-dimensional comodule of `H`; by the
independence of the representation in AdelicAlgebraicGroups §4.3 it agrees with the condition in one
faithful representation. For a `ℚ`-torus `T`
split by `L` and every `γ∈T(ℚ)`, `γ^m` is neat for `m=#μ(L)`. Route: after scalar extension `S` lies in a
split diagonal torus `D`. The map `χ↦χ(γ)` identifies the geometric character group `X^*(S_F̄)` with the
group generated by the eigenvalues, and `S` is connected exactly when `X^*(S_F̄)` is torsion free. Character values of a point of `T(ℚ)` lie in
`L^×`, whose torsion is killed by `m`. Neatness over `F` differs from neatness after restriction of scalars
to `ℚ`, which uses all Galois conjugate eigenvalues. (KMPS22 §2.1.8, p.24, KMPS22 lines 1093–1094; proof of
Lemma 2.2.10, p.29, KMPS22 lines 1317–1322.)
*Needs:* AdelicAlgebraicGroups §4.3 (`Neat.IsNeatAut` and its independence of the representation);
ReductiveGroups Layer 4 (diagonalizable groups `D(M)`); Tau Ceti `TauCeti.HopfAlgebra.IsSemisimplePoint`.

**Checks.**

- `1` is neat, while `−1∈G_m(ℚ)` is not: its cyclic closure is `μ₂`.
- The closure need not be split over the ground field: `γ=(3+4i)/5` in the norm-one torus `T` of
  `ℚ(i)/ℚ` has infinite order, so its closure is `T`, with geometric character group `ℤ` on which complex
  conjugation acts by `−1`; `T` is a connected anisotropic `ℚ`-torus with no nontrivial rational
  character, diagonalizable only over `ℚ(i)`.
- `diag(2,4)` has cyclic closure `{diag(t,t²)}`, a connected one-dimensional torus inside the
  two-dimensional diagonal torus.
- A nontrivial unipotent has connected closure `G_a`, which is not a torus: semisimplicity is needed.
- `√2∈G_m(ℚ(√2))` is neat over `ℚ(√2)`, but as a point of `Res_{ℚ(√2)/ℚ}G_m` its eigenvalues `±√2` generate
  a group containing `−1`.

### 3.6 Weil points from the Serre condition

Let `T` be a `ℚ`-torus satisfying the Serre condition and `l` a prime. Then `γ∈T(ℚ)` is an `l`-Weil point if
and only if it is an `l`-unit (`isPrimeWeilPoint_iff_isPrimeUnit`); consequently the `l`-Weil points of `T(ℚ)` form a subgroup. If `G` is
connected reductive over `ℚ` and every maximal `ℚ`-torus of `G` satisfies the Serre condition, then a
semisimple `γ∈G(ℚ)` is an `l`-Weil point exactly when it is an `l`-unit. Route: Weil points have unit
character values away from `l`, hence bounded powers. Conversely, for a geometric character `χ`, `χ+cχ`
factors through the `ℚ`-split quotient `T/T_c` (§3.1), so its value at an `l`-unit `γ` is a rational
`l`-unit. It is positive, being `|χ(γ)|²` under the fixed embedding, hence equals `l^w` with `w∈ℤ`.
Rationality of `χ+cχ` makes this the same under every embedding, so `|σχ(γ)|=l^{w/2}` for all `σ`. A
semisimple point of `G(ℚ)` lies in a maximal `ℚ`-torus, and closed immersions reflect both properties. No
group statement is made for noncommuting points. (KMPS22 Lemma 2.2.4 and its proof, pp.25–26, KMPS22 lines
1129–1146.)
*Needs:* §§3.1–3.4; ReductiveGroups Layer 7 (semisimple elements of `G(ℚ)` lie in maximal `ℚ`-tori).

**Checks.**

- The Serre hypothesis matters: in the norm-one torus of `ℚ(√3)`, `2+√3` is an `l`-unit for every `l` but
  has real absolute values `2±√3`, so it is not a Weil point.
- For `G_m` the `l`-units `±lⁿ` are `l`-Weil numbers of weight `2n`.
- In the norm-one torus of `ℚ(i)`, `(3+4i)/5` is a `5`-unit and a `5`-Weil point of weight `0`.

### 3.7 Density of neat Weil points

Let `T` be a `ℚ`-torus satisfying the Serre condition and `l` a prime such that `T_{ℚ_l}` is split. Then the
`l`-Weil points of `T(ℚ)` form a Zariski-dense subgroup of `T`, and the neat `l`-Weil points contain a
Zariski-dense subgroup, namely the `m`-th powers of the `l`-Weil points for `m=#μ(L)` and `L` a finite
Galois splitting field. `exists_pow_isNeatPoint_dense` states it as: there is `m>0` such that `γ^m` is
neat for every `l`-Weil point `γ`, and a regular function on `T` vanishing at all these `γ^m` is zero.
Since `T` is reduced, a set of rational points is Zariski dense exactly when no nonzero regular function
vanishes on it; the `γ^m` are `l`-Weil points (§3.4), so the `l`-Weil points are dense as well. Route: let `T′` be the Zariski closure of the `l`-Weil subgroup and suppose `T/T′`
nontrivial, with a nonzero character `χ` of `T/T′`, split at `l`. Choose `y_l∈T(ℚ_l)` with `χ(y_l)` of
positive valuation and let `y` be the finite idele with component `y_l` and trivial components elsewhere.
Finiteness of `T(ℚ)\T(𝔸_f)/K_T` gives `x∈T(ℚ)` and `m₀>0` with `x∈y^{m₀}K_T`. Then `x` is an `l`-unit,
hence an `l`-Weil point (§3.6), while `χ(x)` has positive valuation, so `x∉T′`, a contradiction. The
power map is an isogeny, so `m`-th powers stay dense, and §3.5 makes them neat. The statement does not
say that a single point generates a dense subgroup. (KMPS22 Lemma 2.2.10 and its proof, pp.28–29, KMPS22
lines 1301–1322.)
*Needs:* §3.4 (powers of Weil points); §§3.5–3.6; AdelicAlgebraicGroups §3.4 (*class-number-finite*).

**Checks.**

- For `G_m`, `{l^{mn} : n∈ℤ}` is already a dense subgroup of neat `l`-Weil points: with `m=2` the
  `l`-Weil points `±lⁿ` have squares `l^{2n}`, whose character values generate a subgroup of the
  torsion-free group `l^ℤ`, and a Laurent polynomial vanishing at every `l^{2n}` is zero. The exponent
  `m=1` fails, since `−1` is an `l`-Weil point that is not neat.
- For the trivial torus the only point is the identity, which is a neat `l`-Weil point, and a constant
  vanishing there is zero.
- The splitting hypothesis at `l` is needed: for the norm-one torus of an imaginary quadratic `E` with `l`
  inert in `E`, an `l`-unit of norm one has equal valuations at the prime above `l` and its conjugate,
  summing to zero, so it is a unit everywhere and hence a root of unity; the `l`-Weil points are finite.
- For the norm-one torus of `ℚ(i)` and `l=5` (split), the powers of `(3+4i)/5` are dense in the
  one-dimensional torus.

### 3.8 Rigidity under a finite set of automorphisms

Let `S` be a reduced, irreducible, separated scheme over a field `k`, `Γ⊂S(k)` a set of `k`-points whose
images are dense in the underlying space of `S`, `W` a finite set of `k`-automorphisms of `S`, and `σ` a
`k`-automorphism of `S`. If for each `γ∈Γ` there is `w∈W` with `σ∘γ=w∘γ`, then `σ=w` for one `w∈W`. Route:
for each `w` the equalizer of `σ` and `w` is a closed subscheme, because `S` is separated. The finitely many
equalizers contain the images of `Γ`, so by irreducibility one of them has the whole underlying space, and
because `S` is reduced that closed subscheme is `S`. Reducedness and separatedness ensure that equality on a dense set determines the morphism; no finite-type hypothesis is required. It applies to algebraic tori. (KMPS22
Lemma 2.2.11 and its proof, p.29, KMPS22 lines 1323–1331.)
*Needs:* Mathlib `AlgebraicGeometry.Scheme`, `IsReduced`, `IrreducibleSpace`, `IsSeparated` and equalizers
of morphisms to separated schemes; ReductiveGroups Layer 3.

**Checks.**

- Reducedness is needed: on `Spec k[ε]/(ε²)` in characteristic zero, `ε↦2ε` fixes the unique, dense
  `k`-point, with `W={id}`, but is not the identity.
- Separatedness is needed: on the affine line over `ℚ` with doubled origin, exchanging the two origins fixes every
  point of the dense punctured line, with `W={id}`, but is not the identity.
- For a split torus `G_m^r` over `ℚ` and `W` the inversion group `{±1}`, an automorphism agreeing on a dense
  set of points with the identity or with inversion is one of them.

### Examples

- The norm-one torus of `ℚ(i)` satisfies the Serre condition; its `5`-units are `5`-Weil points, and the
  powers of `(3+4i)/5` are dense.
- The norm-one torus of `ℚ(√3)` fails it, and `2+√3` separates `l`-units from Weil points.
- In `GL₂` the matrices `a=[[1,1/q],[0,1]]` and `b=[[1,0],[1/q,1]]` are `l`-units whose product is not one.

### Dependencies

Layer 0 (semisimple points). ReductiveGroups Layers 1, 3, 4 and 7.
DeligneWeightsAndPurity §§0.1–0.2. AdelicAlgebraicGroups §§3.4 and 4.3. Tau Ceti point topology with
its local compactness and closed embeddings, torus predicates, comodule point actions and base change
of Hopf ideals. Mathlib scheme language and local compactness of `ℚ_[v]`.

## Layer 4: Common realization tori and inner-form transfer

All groups are connected reductive over `ℚ` or its completions. Realizations of one group `I` in another
group `G` are compared over a common algebraically closed field `Ω` of characteristic zero, given with
specified embeddings of all coefficient fields; unrelated local fields are not identified. Three
assertions are distinguished: geometric conjugacy of embeddings, rationality of an embedding into the
quasi-split inner form, and transfer to `G` itself.

### 4.1 Conjugacy of common-source realizations

Let `I,G` be connected reductive over `ℚ` and `(i_a)_{a∈A}` a family of closed embeddings `I_Ω→G_Ω`.
Assume: (i) there is a central semisimple `δ∈I(ℚ)` such that each `i_a` identifies `I_Ω` with the
connected centralizer `Z_G(i_a(δ))°`, and all `i_a(δ)` lie in one `Aut′(G)(Ω)`-orbit (§0.7); (ii) a
maximal `ℚ`-torus `T⊂I` has a Zariski-dense subset `Γ⊂T(ℚ)` such that, for each `γ∈Γ`, the points
`i_a(γ)`, `a∈A`, have the same image in `Conj′(G)(Ω)`. Then all `i_a` are conjugate under `Aut′(G)(Ω)`; if
`Out′(G)=1` they are conjugate under `G(Ω)`. Route: two maximal tori containing a semisimple `γ` lie in the
connected reductive group `Z_G(γ)°` and are conjugate there by an element fixing `γ`. Modify each `i_a` by
`Aut′(G)(Ω)` so that the `i_a(δ)` equal one `δ₀`, and then by `I₀=Z_G(δ₀)°` so that all `i_a(T)` equal one
maximal torus `T₀`. For two indices, `σ=i_b∘i_a⁻¹` is an automorphism of `I₀` preserving `T₀`. At each
`i_a(γ)`, `γ∈Γ`, it agrees with an automorphism of `T₀` induced by an element of `Aut′(G)(Ω)` normalizing
`T₀`; these induced automorphisms form a finite group. §3.8 gives one such element `g` with `σ|_{T₀}=g|_{T₀}`.
Then `g` fixes `δ₀∈T₀`, so it preserves `I₀`, and `g⁻¹σ` fixes `T₀` pointwise, so it is conjugation by an
element of `T₀`. The route uses only conjugacy of maximal tori in a connected reductive centralizer; the
source's description of `Z_G(γ)°` as a Levi subgroup is not needed and is false in general. (KMPS22 §2.2.12
and Proposition 2.2.13 with its proof, pp.29–30, KMPS22 lines 1332–1371.)
*Needs:* §0.7; §3.8; EndoscopicTransferAndUnitaryTraceComparison §1.3 (connected centralizers of semisimple elements are
reductive); ReductiveGroups Layers 7 and 9D (conjugacy of maximal tori; pinned automorphisms and their action on the root datum).

The API includes the following geometric automorphism statement.

- For a connected reductive group `J` over an algebraically closed field of characteristic zero
  and a maximal torus `U`, every algebraic group automorphism fixing `U` pointwise is conjugation
  by an element of `U`. It preserves each root subgroup and each Borel containing `U`; its action
  on the based root datum is trivial. The simple-root scalars determine a point of `U_ad`, which
  lifts to `U` over the algebraically closed field. The pinned automorphism comparison of
  ReductiveGroups Layer 9D then identifies the automorphism with that conjugation. This is the
  step applied to `g⁻¹σ` above (KMPS22, proof of Proposition 2.2.13, p.30, KMPS22 lines 1367–1371).

**Checks.**

- In `SL₂`, conjugation by `diag(2,1/2)` fixes the diagonal torus pointwise and sends
  `[[1,x],[0,1]]` to `[[1,4x],[0,1]]`; fixing the torus does not mean fixing the group pointwise.
- For a torus `J=U`, fixing `U` pointwise means the identity, as does every inner conjugation.
- For `G=GL_n`, `Out′(G)=1` and the conclusion is `G(Ω)`-conjugacy.
- The conclusion is sharp: for a maximal torus `T₀⊂SO(8)`, `I=T₀`, `δ` regular semisimple, `i₁` the
  inclusion and `i₂=s∘i₁` with `s` an improper orthogonal reflection normalizing `T₀`, the hypotheses hold
  and `i₁,i₂` are `Aut′`-conjugate, but not `G(Ω)`-conjugate, since `s|_{T₀}` is not in `W(D₄)`.
- For split `Sp₄` the centralizer of `diag(−1,1,−1,1)` is `SL₂×SL₂`, of type `A₁×A₁`, which is not the
  derived group of a Levi subgroup of `Sp₄`; the route still applies.

### 4.2 Galois invariance from local embedding classes

Let `F` be a number field, `X` a finite set with a continuous `Γ_F`-action and `x∈X`. If, for all but
finitely many finite places `v`, some decomposition group at `v` fixes a point of the orbit `Γ_F·x`, then
`x` is `Γ_F`-fixed. Route: pass to the finite quotient `Q` acting faithfully on the orbit. A decomposition
group fixing `τx` means a conjugate of the Frobenius class meets the stabilizer of `x`; Chebotarev makes
every class of `Q` such a Frobenius class, and §1.1 makes the stabilizer all of `Q`. This applies to the
finite Galois orbit of the geometric conjugacy class of a maximal-torus embedding `T_ℚ̄→G_ℚ̄`, which is
defined over a number field. It proves invariance of the class; choosing a rational representative is
§4.3. (KMPS22 proof of Corollary 2.2.14, p.30, KMPS22 lines 1382–1386.)
*Needs:* §1.1; Chebotarev Layer 10.

**Checks.**

- If `Γ_F` acts trivially on `X` the statement is empty.
- For `X=Hom(ℚ(√2),ℚ̄)` and either embedding `x`, the decomposition group at `ℓ` fixes a point only when `ℓ`
  splits in `ℚ(√2)`, half of the primes, so the hypothesis fails, consistently with `x` not being fixed.
- The hypothesis is quantified as: for all `v` outside a finite set there is `y∈Γ_F·x` fixed by a
  decomposition group at `v`; the conclusion then forces `Γ_F·x={x}`, so `y=x`. At a single place
  another orbit point can be the fixed one: for `X=Hom(ℚ(∛2),ℚ̄)`, `X³−2≡(X−3)(X²+3X+4) mod 5` with an
  irreducible quadratic factor, so Frobenius at `5` fixes exactly one of the three points; at `7`, where
  `2` is not a cube, Frobenius acts as a `3`-cycle and fixes none, so the global hypothesis fails.

### 4.3 Rational embeddings in quasi-split groups

For a characteristic-zero field `F`, a torus `T/F` and a quasi-split connected reductive
`G*/F`, prove that every Galois-stable geometric conjugacy class of embeddings of `T` as a
maximal torus of `G*` contains an embedding defined over `F`. Here the class is a class of
marked embeddings, not just of images or of individual elements. This extends the
transfer-from-an-inner-form interface of EndoscopicTransferAndUnitaryTraceComparison §1.6 to
an arbitrary Galois-stable embedding class (Kottwitz82 Corollary 2.2; KMPS22 proof of
Corollary 2.2.14, p.30, KMPS22 lines 1382–1388).
*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§1.1 and 1.6 (Galois descent, inner twists,
quasi-split forms); ReductiveGroups Layers 7 and 9D (maximal tori, Weyl groups and pinnings).

Let `T` be a `ℚ`-torus and `G*` a quasi-split connected reductive `ℚ`-group. Suppose a finite Galois orbit
of geometric conjugacy classes of embeddings `T_ℚ̄→G*_ℚ̄` as maximal tori has the property that, at almost
every finite place, a decomposition group fixes some class in the orbit. Then the orbit is a single
Galois-stable class, and that class contains an embedding defined over `ℚ`. The embeddings identify `T`
with a maximal torus, not with an arbitrary subtorus, and the conclusion is a rational embedding of the
torus, not a rational point of `Conj(G*)`. Route: §4.2, then the quasi-split embedding theorem.
(KMPS22 proof of Corollary 2.2.14, p.30, KMPS22 lines 1377–1388; Kottwitz82 Corollary 2.2.)
*Needs:* §4.2; the Galois-stable embedding theorem above; EndoscopicTransferAndUnitaryTraceComparison §1.6.

**Checks.**

- For `G*=GL₂` and `T=Res_{E/ℚ}G_m` with `E` quadratic, the regular representation of `E` on `E≅ℚ²` is a
  rational embedding in the Galois-stable class.
- Quasi-splitness is needed: for a quaternion division algebra `D` over `ℚ`, the split torus `G_m²` has a
  Galois-stable class of embeddings into `D^×_ℚ̄≅GL₂`, but no embedding over `ℚ`, since it would make
  `ℚ×ℚ` a subalgebra of `D`.
- A rational point of `Conj(G*)` is not a rational embedding of a prescribed torus: the rational point of
  `Conj(GL₂)` with characteristic polynomial `X²+1` lifts to an element with centralizer
  `Res_{ℚ(i)/ℚ}G_m`, which is not the prescribed split torus `G_m²`.

### 4.4 Local-to-global transfer of maximal tori

Let `G*` be quasi-split over `ℚ`, `ψ:G*_ℚ̄→G_ℚ̄` an inner twist, and `T*⊂G*` a maximal `ℚ`-torus that
transfers to `G` over every completion `ℚ_v`, archimedean ones included. Transfer means that some
`Int(g)∘ψ|_{T*}` with `g∈G(ℚ̄_v)` is defined over `ℚ_v` (KZ25 §6.3.2, KZ25 lines 2664–2670;
EndoscopicTransferAndUnitaryTraceComparison §1.6). If the image `T*_ad` of `T*` in `G*_ad` is anisotropic at one place, then `T*`
transfers to `G` globally: there are a maximal `ℚ`-torus `T⊂G` and a `ℚ`-isomorphism `T*≅T` of the form
`Int(g)∘ψ|_{T*}`. The simply connected Hasse principle is used in its full form, including `E₈`
(EndoscopicTransferAndUnitaryTraceComparison §1.9(c)). Route: the obstruction to transfer lies in `Ĥ⁻¹(Gal(L/ℚ),X_*(T*_sc))`
modulo the images `ξ_v` of the local groups `Ĥ⁻¹(Gal(L_v/ℚ_v),X_*(T*_sc))`, for a splitting field `L`.
At a place `v` where `T*_ad` is anisotropic the local norm vanishes on `X_*(T*_sc)`, so `ξ_v` is surjective
and the obstruction vanishes. The obstruction description is computed from EndoscopicTransferAndUnitaryTraceComparison §§1.2, 1.5
and 1.11 (Tate–Nakayama for the complex of tori `[T*_sc→T*]` and Kottwitz duality); the Hasse principle
turns its vanishing into a global inner conjugation of the embedding. Transfer at almost all places is
not enough: every place is required. (LR87 Lemma 5.6 and its proof, internal p.55, LR87 lines 2907–2923,
which cite Langlands' Lemma 7.15 for the obstruction; KMPS22 proof of Corollary 2.2.14, KMPS22 lines
1389–1391.)
*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§1.2, 1.5, 1.6, 1.9 and 1.11; ReductiveGroups Layer 7.

**Checks.**

- For `D` a quaternion division algebra over `ℚ` ramified at `{p,∞}` and `T*=G_m²⊂GL₂`, transfer to `D^×`
  fails at `p` and `∞`; the hypothesis "every place" excludes this case, and indeed no global transfer
  exists.
- For the same `D` and `T*=Res_{E/ℚ}G_m` with `E` imaginary quadratic and inert at `p`, `T*` transfers
  locally everywhere (`E_v` is a field at both ramified places) and `T*_ad` is anisotropic at `∞`; the
  conclusion is the embedding `E→D`.
- For `G=G*` and `ψ=id` the conclusion holds with `T=T*`.

### 4.5 Rational tori for common realizations

Let `I` and `G` be connected reductive over `ℚ` and `p` a prime. Assume `G_ad` has no factor of type `D`, so
`Out′(G)=1`, and `G_{ℚ_p}` is quasi-split. Let `i_ℓ:I_{ℚ_ℓ}→G_{ℚ_ℓ}` (`ℓ≠p`) be closed embeddings defined
over `ℚ_ℓ`, and `i_p` one defined over a finite extension of `ℚ_p`, compared over a common `Ω` as above.
Assume: (a) every maximal `ℚ`-torus of `I` satisfies the Serre condition; (b) there is a central neat Weil
point `δ∈I(ℚ)` such that each `i_ℓ` identifies `I` with `Z_G(i_ℓ(δ))°` and all `i_ℓ(δ)` are `G(Ω)`-conjugate;
(c) for every neat Weil point `γ∈I(ℚ)` the image of `i_ℓ(γ)` in `Conj(G)` is a rational point independent of
`ℓ`; (d) there is an embedding `i_∞:I_ℝ→G_ℝ` in the common geometric class such that
`i_∞(I_ℝ)/(i_∞(I_ℝ)∩Z_G)` is anisotropic over `ℝ`. Then every maximal `ℚ`-torus `T⊂I` admits a `ℚ`-embedding
`T→G` that is geometrically conjugate to every `i_ℓ|_T`. Route: choose `l` splitting `T`; §3.7 gives a
dense subgroup of neat `l`-Weil points, and (c) with §4.1 makes all `i_ℓ` conjugate. Descend the class
of `i_ℓ|_T` by §4.2 and realize it rationally in the quasi-split inner form `G*` by §4.3. Its image
transfers to `G` at `ℓ≠p` through `i_ℓ`, at `p` because `G_{ℚ_p}` is quasi-split, and at `∞` through `i_∞`;
(d) makes the image of `T` in `G_ad` anisotropic at `∞`, and §4.4 transfers it globally. The resulting
rational embedding is geometrically, not necessarily locally rationally, conjugate to the `i_ℓ`.
For isogeny groups of Hodge-type Shimura varieties the three hypotheses come from three different
inputs: (b) from KMPS22 Corollary 2.1.9 (KMPS22 lines 1095–1105, the identification of the `ℓ`-adic
group with a centralizer, after passing to a sufficiently divisible Frobenius power); (c) from the
realization theorem KMPS22 Proposition 2.2.2 (KMPS22 lines 1122–1123, proved there from Noot09
Theorem 2.4, Lemmas 2.5–2.6 and §3); and (d) from the compactness modulo scalars of KMPS22 §2.1.3
(KMPS22 lines 974–981) through the real realization used in Corollary 2.2.14. They are hypotheses here,
not consequences of a definition of `I`. Compactness modulo the ambient centre is
needed, not just a compact Cartan subgroup. (KMPS22 Corollary 2.2.14 and its proof, p.30, KMPS22 lines
1372–1393.)
*Needs:* §3.7; §§4.1–4.4; EndoscopicTransferAndUnitaryTraceComparison §1.6.

**Checks.**

- The conclusion does not assert `G(ℚ_ℓ)`-conjugacy to `i_ℓ|_T` for every `ℓ`; it asserts conjugacy over `Ω`.
- If `I=T` is a torus with `δ` regular, (b) says each `i_ℓ` is the inclusion of the maximal torus
  `Z_G(i_ℓ(δ))°`, and the theorem is the descent of a maximal-torus embedding.
- A compact Cartan subgroup of `i_∞(I_ℝ)` does not give (d): for `I_ℝ=SL₂(ℝ)`, `SO(2)` is a compact Cartan
  but `SL₂(ℝ)` is not compact, and a split maximal torus of `I` would have non-anisotropic image.

### 4.6 Odd unitary similitude Hasse principle

Let `F/F⁺` be a CM quadratic extension with `F⁺` totally real of odd degree `d` over `ℚ`, let `V` be a
nondegenerate hermitian `F`-space of odd dimension `n`, and let `G` be the unitary similitude group with a
rational multiplier: `G(R)={(g,λ)∈GL_F(V⊗R)×R^× : ⟨gx,gy⟩=λ⟨x,y⟩}`. Then `ker¹(ℚ,G)=1`, where
`ker¹(ℚ,G)=ker(H¹(ℚ,G)→∏_v H¹(ℚ_v,G))`. No imaginary quadratic subfield of `F` is assumed. This refines
PELModuli §M3.2, which for odd `n` identifies `ker¹(ℚ,G)` with `ker¹(ℚ,Z)` for the centre `Z` and records
that it can be nontrivial; the vanishing under odd `d` is the content here. Route: the centre is the torus
`Z≅T₁=Res_{F/ℚ}G_m×_{Res_{F⁺/ℚ}G_m}G_m` of scalars whose similitude factor is rational, and PELModuli
§M3.2 (`hasseCases` (A)) gives `ker¹(ℚ,T₁)≅ker¹(ℚ,G)`. The exact sequence `1→T₁→Res_{F/ℚ}G_m×G_m→Res_{F⁺/ℚ}G_m→1`, with
`(e,λ)↦N_{F/F⁺}(e)λ⁻¹`, Shapiro and Hilbert 90 give
`H¹(k,T₁)=(F⁺⊗k)^×/(N_{F/F⁺}((F⊗k)^×)·k^×)` for `k=ℚ` and every `ℚ_v`. By
EndoscopicTransferAndUnitaryTraceComparison §1.11(b), `ker¹(ℚ,T₁)` is dual to `ker¹(ℚ,T̂₁)`, computed
from the signed-permutation action of `Γ_ℚ` on the embeddings of `F`. Explicitly, if
`Σ=Hom(F,ℚ̄)`, its character lattice is the quotient of `ℤ[Σ]⊕ℤ e₀` by the relations
`e_σ+e_{σc}=e₀`, one for each complex-conjugate pair; `e₀` is fixed and Galois permutes `Σ`.
The dual-cohomology calculation proves that the kernel of restriction to all decomposition
groups vanishes when `d` is odd, with the full permutation action retained. Odd `n` enters through PELModuli
§M3.2 (`T₁` itself does not depend on `n`), and odd `d` through the parity calculation. For `F=F⁺E` with `E` imaginary quadratic this is the calculation of Shin11 (Lemma 3.1
and its proof, Remark 3.2, internal pp.12–14, Shin11 lines 696–727, author-version numbering, published as Lemma 3.1.1); for
arbitrary CM `F` the same calculation runs with the full permutation action. (KMPS22 Remark 2.3.16(1),
p.36, KMPS22 lines 1647–1651.)
*Needs:* PELModuli §M3.2 (`hasseCases` (A): `ker¹(ℚ,Z)≅ker¹(ℚ,G)` for odd hermitian dimension);
EndoscopicTransferAndUnitaryTraceComparison §§1.2 and 1.11(b); ReductiveGroupsPartII §RG2.5.1 (dual
groups with Galois action).

**Checks.**

- For `F⁺=ℚ`, `F=E` imaginary quadratic and any odd `n`, `T₁=Res_{E/ℚ}G_m`, because the norm of `E` is
  automatically rational; `ker¹(ℚ,T₁)=0` by Shapiro and Hilbert 90.
- For `F=F⁺E`, Shin's computation identifies the relevant group `H¹(E/ℚ,Z(Ĝ)^{Γ_E})` as having order two
  when `d` is even, and order one when `d` and `n` are odd: the parity hypotheses are used.
- At the real place in degree `d=3`, the norm quotient is
  `H¹(ℝ,T₁)=(ℝ^×)³/((ℝ_{>0})³·ℝ^×)=({±1}³)/{(1,1,1),(−1,−1,−1)}`.
  It has `4` elements even though its all-place global kernel is zero. Vanishing of
  the global obstruction does not assert vanishing of every local cohomology group.
- `H¹(ℚ,T₁)` is the group `F⁺^×/(N_{F/F⁺}(F^×)·ℚ^×)`, of exponent two because `a²=N_{F/F⁺}(a)`.

### Examples

- `SO(8)` with an improper reflection shows that `Aut′`-conjugacy is the sharp conclusion of §4.1.
- A quaternion division algebra `D` over `ℚ`: the split torus has a Galois-stable embedding class into
  `D^×_ℚ̄` but no rational embedding; an imaginary quadratic field inert at the finite ramified prime
  transfers globally.
- Unitary similitude groups over `E` imaginary quadratic in odd dimension have trivial `ker¹`.

### Dependencies

§0.7, §1.1, §3.7, §3.8. EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.2, 1.3, 1.5, 1.6, 1.9 and 1.11. Chebotarev
Layer 10. ReductiveGroups Layers 7 and 9D. ReductiveGroupsPartII §RG2.5.1. PELModuli §M3.2.

## Layer 5: Mumford–Tate Frobenius classes and rational representatives

Let `A` be an abelian variety of dimension `g≥1` over a number field `E`, with a fixed embedding `E⊂ℂ`
extended to `ℚ̄⊂ℂ`. Write `V_B=H¹_B(A(ℂ),ℚ)`, `G=MT(V_B)` for its Mumford–Tate group (ShimuraData §1.2),
`ρ_ℓ:Γ_E→GL(H¹_et(A_Ē,ℚ_ℓ))` for the `ℓ`-adic representations, and, at a finite place `v` of good reduction
with residue field `𝔽_q`, `q` a power of `p`, `Fr_v∈Γ_E` for a geometric Frobenius at `v`. The geometric
independence-of-`ℓ` theorem for Shimura varieties enters only as the explicit hypothesis of §5.5.

### 5.1 Cohomological Mumford–Tate conventions

Use ShimuraVarieties §7.0i.1’s common finite extension and transported realizations throughout
this layer. The following conventions and explicit witnesses fix the normalization of those
supplied objects for the arithmetic targets.

`V_B` has Hodge types `(1,0),(0,1)`, and the Betti–étale comparison gives
`V_B⊗ℚ_ℓ≅H¹_et(A_Ē,ℚ_ℓ)≅(T_ℓA⊗ℚ_ℓ)^∨`. `G` is connected and reductive (ShimuraData §§1.3–1.4). The
smallest `ℚ`-subgroup of `GL(V_B)` whose complex points contain the image of the Hodge cocharacter `μ_h` is
`G`: a subgroup defined over `ℚ` that contains `μ_h` contains its complex conjugate, and the two together
recover `h_ℂ`. The contragredient identifies the Mumford–Tate groups of `V_B` and of the homology `V_B^∨`. A
polarization embeds `G` in `GSp(V_B)` with multiplier `ν`; the scalar cocharacter `w_s(z)=z·id`, the inverse
of the Hodge weight on `H¹`, satisfies `ν∘w_s(z)=z²`. Finally `Int(h(i))` is a Cartan involution of
`G_ℝ/w_s(G_m)`, so `Z_G/w_s(G_m)` is anisotropic over `ℝ`, and a maximal torus `T⊂G_ℝ` containing `h(S)` is
elliptic with `T/w_s(G_m)` anisotropic. Route: the comparison is AbelianSchemesAndArithmeticModuli §A5.1
(`T_ℓA≅Λ⊗ℤ_ℓ` for every `ℓ`) and §A5.7 over `ℂ` (`H¹=Λ^*`), with invariance of torsion points under `ℚ̄⊂ℂ`;
the `ℓ`-adic realization is `V_ℓ(A)^*` by the convention above. The multiplier `χ_ℓ⁻¹` on `V_ℓ(A)^*` at
every `ℓ`, including `ℓ` dividing the polarization degree, comes from the polarized Weil pairing of §A3.7
with the rational inverse of §A3.9 and the dual pairing of §A4.1, tensored with `ℚ_ℓ`; §A5.7 gives the
same convention directly when `ℓ` is prime to the degree.
The Cartan statement is ShimuraData §4.3's `SV2*` argument: `Int(h(i))` is Cartan on `GSp_ℝ/G_m` and
restricts to the stable reductive subgroup `G_ℝ/w_s(G_m)`. It acts trivially on `T`, so `T/w_s(G_m)` lies
in a compact form. The source assigns `V_B` the homological types `(0,−1),(−1,0)`; with the dual Tate
module realization those types belong to `H₁`, and the cohomological types are used here. (KZ25
§§6.1.1–6.1.3, p.55, KZ25 lines 2445–2469; Deligne82 §§3.4–3.6, pp.24–25.)
*Needs:* ShimuraData §§1.2–1.4 and 4.2–4.3; AbelianSchemesAndArithmeticModuli §§A3.7, A3.9, A4.1, A5.1 and A5.7;
ReductiveGroupsPartII §RG2.0a.3 (the Deligne torus).

**Checks.**

- For a CM elliptic curve with CM field `K`, `G=Res_{K/ℚ}G_m`; for a non-CM elliptic curve, `G=GL₂`.
- `ν(w_s(z))=z²`: the scalar `z` on the `2g`-dimensional `V_B` multiplies the alternating form by `z²`.
- The types `(−1,0),(0,−1)` belong to homology: on an elliptic curve `H^{1,0}=H⁰(Ω¹)` has type `(1,0)`.
- For `GL₂` acting on `H¹` in the basis dual to a homology basis, `h(a+bi)=(a²+b²)⁻¹[[a,−b],[b,a]]`,
  with eigenvalues `z⁻¹,z̄⁻¹` for `z=a+bi≠0`; at `z=2` it is `(1/2)·id` with multiplier `1/4`, the
  weight action on `H¹`. The matrix `[[a,−b],[b,a]]` without the factor is the action on `H₁` and gives
  `2·id` at `z=2`, the wrong weight. The torus `ℂ^×` containing `h(S)` is elliptic, while the diagonal
  torus is split modulo `w_s(G_m)`.
- Positive dimension is needed for the multiplier identities: for `g=0`, `V_B=0`, `G=1`, and `ν∘w_s` is
  trivial, so `ν(w_s(2))=1≠4` and `ν(Fr_v)=1≠q`; this is why `g≥1` is a standing hypothesis.

### 5.3a Building intersection for identical derived groups

Let `K` be a characteristic-zero nonarchimedean local field and `H→H′` a closed immersion of
connected reductive `K`-groups inducing an isomorphism of derived groups. Construct an equivariant
embedding `B(H,K)→B(H′,K)` of enlarged buildings, with the induced map on central apartments; its reduced map is
the identification through the common adjoint group. For a point `x` and its image `x′`, prove
`Fix_H(x)=H(K)∩Fix_H′(x′)` and that `x` is very special exactly when `x′` is. These assertions are
about full point fixers; connected parahorics require the separate connectedness hypotheses of
ReductiveGroupsPartII §RG2.3.3, *fixer-versus-parahoric*. The construction is independent of the
central translation choice for these two assertions. A route identifies the affine roots and
root-group filtrations through the common derived group and uses the injective central apartment
map to reflect zero translations (KZ25 proof of Proposition 6.2.4, pp.57–58, KZ25 lines 2570–2582,
for its common-multiplier application).
*Needs:* ReductiveGroupsPartII §§RG2.2 (enlarged buildings, apartments, affine root groups,
central functoriality), RG2.3.3 (full fixers) and RG2.3.4 (very special points);
ReductiveGroups Layer 6 (centres and derived groups).

The API consists of the following facts.

- The map is injective and intertwines the `H(K)`-action with its action through `H′(K)`;
  on central apartments it is the injective map induced by the inclusion of split centres.
- On reduced buildings it is the identification through the common adjoint group and carries
  very special points exactly to very special points.
- It reflects the condition that a point is fixed by a given element of `H(K)`; translating the
  chosen central apartment map changes neither this condition nor very specialness.

**Checks.**

- For the identity inclusion both building maps and fixer intersections are identities.
- For the diagonal `G_m→G_m²`, the apartment map is `r↦(r,r)` and the fixer intersection is
  `K^×∩(O_K^××O_K^×)=O_K^×`; a uniformizer translates by `(−1,−1)` and fixes no point.
- For `SL₂→GL₂` at the standard vertex, intersecting `GL₂(O_K)` with `SL₂(K)` gives
  `SL₂(O_K)`. The reduced apartments and their special vertices agree.
- A ramified quadratic norm-one torus has a one-point reduced building, but its full bounded
  subgroup has index `2` over its connected parahoric; reduced building coincidence alone must
  not identify full fixers with connected parahorics.

### 5.4 Auxiliary groups for good-reduction descent

Assume `ρ_ℓ` takes values in `G(ℚ_ℓ)` for all `ℓ`, and let `v|p` be a place of good reduction with residue
field `𝔽_q`. Construct: a finite extension `F₀/ℚ_p` splitting `G` such that the image of a Frobenius lift
`Fr_v` in `G(F₀)` lies in a hyperspecial parahoric subgroup; a totally real field `F` with `F_w≅F₀` for every
place `w|p`; the Weil restriction `H′=Res_{F/ℚ}G_F` and its common-multiplier subgroup
`H=H′×_{Res_{F/ℚ}G_m}G_m⊃G` for the multiplier `ν`; a very special parahoric group scheme `𝓗` of `H_{ℚ_p}`
with `𝓗(ℤ_p)=H(ℚ_p)∩𝓗′(ℤ_p)` containing the image of `Fr_v`, where `𝓗′` is the very special parahoric of
`H′_{ℚ_p}≅∏_{w|p}Res_{F_w/ℚ_p}G_{F_w}` whose integral points are the product of the hyperspecial subgroups
of the split groups `G_{F_w}≅G_{F₀}` containing `Fr_v`; a maximal `ℚ`-torus `T⊂H` through which some `h` in
the Hodge class factors, with `T_{ℚ_p}` `H(ℚ_p)`-conjugate to the centralizer of a maximal `ℚ̆_p`-split
torus of `H_{ℚ_p}` defined over `ℚ_p` (KZ25 §6.2.5, KZ25 lines 2584–2587); and the central product
`H₁=(H×T)/Z_H`. Prove that the composite closed embedding `j:G→H₁` induces a `Γ_ℚ`-equivariant injection
`Conj(G)(ℚ̄)→Conj(H₁)(ℚ̄)`. After replacing `E` by a finite extension `E′` with a place `v′|v` of the same
residue field `𝔽_q`, the image of `Γ_{E′}` at `p` lies in `𝓗(ℤ_p)`; a geometric Frobenius at `v′` is a
geometric Frobenius at `v`, so `q` is not replaced by a power. The Serre tensor `A⊗O_F`
(AbelianSchemesAndArithmeticModuli §A1.3a) is an abelian variety over `E′` with good reduction at `v′`, on
whose `H¹` the group `H` acts naturally. Route: ReductiveGroupsPartII §RG2.3.3
(*compact-elements-in-hyperspecial-subgroups*) gives `F₀`. The product decomposition is that of `H′`, not of
`H`: Weil restriction gives `H′_{ℚ_p}≅∏_{w|p}Res_{F_w/ℚ_p}G_{F_w}`. `H` is connected, since
`G=w_s(G_m)·Hdg` with the Hodge group `Hdg` connected, contained in `ker ν` and containing `−1=h(−1)`, so
`ker(ν|_G)=Hdg` and §1.5 applies to the whole fibre product. `H` and `H′` have the same derived group
`Res_{F/ℚ}G_der`, whose base change to `ℚ_p` is a product of Weil restrictions of split groups. With `I` the
inertia group of `ℚ_p`, `X_*(H′_ab)` is a permutation module tensored with `X_*(G_ab)` on which
`Γ_{F₀}` acts trivially, and the map from `X_*(G_ab)` to `ℤ` induced by `ν` is primitive, since `ker ν` is connected.
Choose a section over the splitting field `F₀`; inducing along its local embeddings gives an
`I`-equivariant section onto the permutation lattice of local multipliers. Pulling this back
along the diagonal `ℤ` shows that `X_*(H_ab)` is the direct sum of the induced kernel lattice
and an `I`-fixed diagonal line; so both `X_*(H′_ab)_I` and `X_*(H_ab)_I` are torsion free. Then
§5.3a identifies the fixer of the point of `H` with
`H(ℚ_p)∩𝓗′(ℤ_p)` and makes it very special, and *fixer-versus-parahoric* (5), applied to `H` and to `H′`,
makes both fixers connected parahorics; the image of `Fr_v` lies in it because `G(ℚ_p)⊂H(ℚ_p)`. §2.2
chooses `T`; §1.5 and §1.6 give the injection. That this datum is of Hodge type with strongly acceptable
triple, and the resulting Shimura-variety point, are geometric statements outside this roadmap. (KZ25
Proposition 6.2.4 and its proof, pp.57–58, KZ25 lines 2559–2582; §6.2.5, KZ25 lines 2583–2591; Lemma
6.2.6, KZ25 lines 2592–2618; proof of Theorem 6.2.7, KZ25 lines 2627–2646.)
*Needs:* §1.5; §1.6; §2.2; §5.3a; ShimuraVarieties §7.0i.1; ReductiveGroupsPartII §§RG2.0a.1–RG2.0a.2,
RG2.3.3 (*compact-elements-in-hyperspecial-subgroups*, *fixer-versus-parahoric*) and RG2.3.4 (very
special points); AbelianSchemesAndArithmeticModuli §A1.3a.

**Checks.**

- The auxiliary extension preserves the residue field: replacing `v` by a place with residue field
  `𝔽_{q^m}` would replace `Fr_v` by `Fr_v^m` and compare the wrong Frobenius.
- For `F=ℚ`, `H=G` and `H₁=(G×T)/Z_G`, and the injection is §1.6 alone.
- `H₁^der=H^der`: the central product changes only the centre, which now contains the torus `T`.
- `H` is not `H′`: for `G=GL₂` and `F` quadratic, `H′=Res_{F/ℚ}GL₂` has dimension `8`, `H` (equal rational
  determinants) dimension `7`, and both have the `6`-dimensional derived group `Res_{F/ℚ}SL₂`. At an inert
  `p`, `H′_{ℚ_p}=Res_{F_w/ℚ_p}GL₂` is a Weil restriction of a split group, while `H_{ℚ_p}` is not: its
  parahoric is cut out of `GL₂(O_{F_w})` by the condition that the determinant lie in `ℤ_p^×`.

### 5.5 Common rational Frobenius class from an auxiliary group

Assume `ρ_ℓ` takes values in `G(ℚ_ℓ)` for all `ℓ`, and let `v|p` be a place of good reduction. Let
`j:G→H₁` be a closed embedding of connected reductive `ℚ`-groups inducing an injection
`Conj(G)(ℚ̄)→Conj(H₁)(ℚ̄)` (§5.4 constructs one). Suppose there is `δ∈Conj(H₁)(ℚ)` whose image in
`Conj(H₁)(ℚ_ℓ)` is `χ_{H₁}(j(ρ_ℓ(Fr_v)))` for every `ℓ≠p`. Then there is a unique `γ_v∈Conj(G)(ℚ)` whose
image in `Conj(G)(ℚ_ℓ)` is `χ_G(ρ_ℓ(Fr_v))` for every `ℓ≠p`. Each `ρ_ℓ(Fr_v)` is semisimple, and under
ShimuraVarieties §7.0i.1, for a second embedding `E⊂ℂ` with Mumford–Tate group `G′`, the inner-form
identification `Conj(G)≅Conj(G′)` of §1.4 carries `γ_v` to the corresponding point for `G′`. This is a rational point of the quotient,
not yet a rational element of `G`. Route: `γ_ℓ=χ_G(ρ_ℓ(Fr_v))` lies over `δ` under the finite morphism
`Conj(G)→Conj(H₁)` (§0.6). The fibre over `δ` is a finite `ℚ`-scheme (§1.3), and by injectivity it
has exactly one geometric point. In characteristic zero its reduction is `Spec ℚ`, a rational point
`γ_v`, and every `γ_ℓ` equals it. Uniqueness holds because `Conj(G)(ℚ)→Conj(G)(ℚ_ℓ)` is injective.
Semisimplicity is Frobenius semisimplicity (AbelianSchemesAndArithmeticModuli §A6.21), tested in the
faithful representation `V_B`. For the auxiliary group of §5.4 and `p>2`, the hypothesis on `δ` is
Kisin–Zhou's geometric theorem (KZ25 Theorem 5.1.4, KZ25 lines 2104–2106) applied to the good-reduction
point defined by the Serre tensor `A⊗O_F` (KZ25 lines 2641–2655). (KZ25 Theorem 6.2.7, Remark 6.2.8 and
the proof of 6.2.7, p.59, KZ25 lines 2619–2655.)
*Needs:* §0.6; §1.3; §1.4 (inner-form identification of conjugacy quotients, for the change of
complex embedding); ShimuraVarieties §7.0i.1; §5.4 for the construction of `j`; AbelianSchemesAndArithmeticModuli
§A6.21; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0b, with the realization conventions of §5.1.

**Checks.**

- If `G` is a torus (CM case) and `j` the identity, the hypothesis is the conclusion: `δ=γ_v` is the
  Frobenius of Shimura–Taniyama (ShimuraVarieties §5.8).
- Injectivity is needed: for `G_m→GL₂`, `t↦diag(t,t⁻¹)`, the points `2` and `1/2` of `Conj(G_m)` lie over one
  rational point; points `γ_ℓ` lying over a common `δ` could then vary with `ℓ`.
- The characteristic polynomial of `Fr_v` on `H¹` is monic, integral and independent of `ℓ`, of degree `2g`
  with roots of absolute value `√q` (AbelianSchemesAndArithmeticModuli §§A6.11 and A6.21); it is a rational point of
  `Conj(GL(V_B))`, which alone does not determine the point of `Conj(G)`.

### 5.6 Real representatives in an elliptic torus

Let `G` be connected reductive over `ℝ`, `w_s:G_m→Z_G` a cocharacter, `ν:G→G_m` a character with
`ν∘w_s(z)=z²`, `ρ:G→GL(V)` a closed immersion with `ρ∘w_s(z)=z·id`, and `T⊂G` a maximal torus with
`T/w_s(G_m)` anisotropic. Let `a∈Conj(G)(ℂ)` and suppose that for some `r>0`, `ν(a)=r²` and every eigenvalue
of `ρ` at a semisimple representative of `a` has absolute value `r`. Then `a` has a representative in
`T(ℝ)`. Route: choose a semisimple representative `t∈T(ℂ)` (ArithmeticGaloisRepresentations §1.11) and put `t₀=w_s(r)⁻¹t`. All `ρ`-weights
of `t₀` have absolute value one and `ν(t₀)=1`; the weights generate `X^*(T)`, so every character has
absolute value one at `t₀`. For a character `χ` with `χ∘w_s(z)=z^m`, the characters `χ+cχ` and `mν` agree on
`w_s(G_m)`, and their difference is a `c`-invariant character of the anisotropic torus `T/w_s(G_m)`, hence
zero. Therefore `χ(c(t₀))` is the complex conjugate of `ν(t₀)^m/χ(t₀)`, which is `χ(t₀)`. So `t₀` is real, and
`t=w_s(r)t₀∈T(ℝ)` represents `a`. The representative is chosen semisimple before eigenvalue absolute values
are used, and the scalar `w_s(r)` is restored exactly. (KZ25 Lemma 6.3.3
and its proof, p.60, KZ25 lines 2673–2693.)
*Needs:* ArithmeticGaloisRepresentations §1.11; ReductiveGroups Layers 4 and 7.

**Checks.**

- For `G=G_m`, `ν=t²`, `w_s=id`, `ρ=id`: a point `x` with `|x|=r` and `x²=r²` is `±r`, which is real. An
  arbitrary real lift of the trivial quotient `G_m/w_s(G_m)` would lose the class.
- The semisimple representative is needed: `[[1,1],[0,1]]` has all eigenvalues `1` but unbounded powers,
  so it lies in no compact subgroup of `GL₂(ℂ)`.
- The torus must be anisotropic modulo `w_s(G_m)`: in `GL₂`, `diag(e^{iθ},e^{−iθ})` with `θ∉πℤ` has no
  representative in the split diagonal torus over `ℝ`, but one in the elliptic torus `ℂ^×`.

### 5.7 Real elliptic Frobenius representative

Let `γ∈Conj(G)(ℚ)` be a point whose image in `Conj(G)(ℚ_ℓ)` is `χ_G(ρ_ℓ(Fr_v))` for some `ℓ≠p` (for instance
the `γ_v` of §5.5). Then `γ` has a representative in `G(ℝ)` lying in an elliptic maximal torus. Route:
§5.1 provides the elliptic torus `T` with `T/w_s(G_m)` anisotropic. The cohomological multiplier gives
`ν(ρ_ℓ(Fr_v))=q`, and the eigenvalues of `Fr_v` on `H¹` have absolute value `√q` under every complex
embedding; apply §5.6 with `r=√q` and `ρ=V_B`. Elliptic means contained in a maximal torus anisotropic
modulo the centre, not that the connected centralizer is compact modulo the centre. (KZ25 Lemma 6.3.3,
p.60, KZ25 lines 2671–2673.)
*Needs:* §5.1; §5.6; AbelianSchemesAndArithmeticModuli §§A3.7, A3.9, A4.1 (the multiplier at every `ℓ`) and A6.21; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0b.

**Checks.**

- For a CM elliptic curve, `G=Res_{K/ℚ}G_m` is itself elliptic and the representative is the Frobenius
  `π∈K^×⊂ℂ^×`.
- For a non-CM elliptic curve, `γ` has characteristic polynomial `X²−aX+q` with `a²≤4q`. If `a²<4q` its
  semisimple representative has complex conjugate eigenvalues and lies in a nonsplit real torus of
  `GL₂(ℝ)`. If `a²=4q` (supersingular reduction with `Fr_v=±√q`, possible when `q` is a square),
  `γ` is the central point `±√q`, which lies in every maximal torus, the elliptic one included.
- `ν(γ)=q>0`, so `γ` is not represented in the component of `GSp(ℝ)` with negative multiplier.

### 5.7a Relative obstruction for an inner form

Let `F` be a number field, `G*/F` quasi-split connected reductive with simply connected derived
group, `ψ:G*_F̄→G_F̄` an inner twist, `γ*∈G*(F)` semisimple, and `I*=Z_G*(γ*)` its connected
centralizer. For a semisimple tuple `γ=(γ_v)∈G(𝔸_F)` geometrically conjugate to `ψ(γ*)` at every
place, construct Kottwitz's relative obstruction in the dual of the finite group
`𝔎(I*/F)` of EndoscopicTransferAndUnitaryTraceComparison §1.15. Prove that it vanishes exactly
when the tuple is adelically `G`-conjugate to a rational semisimple element of `G(F)` in this
geometric class. For a replacement of `γ_v` by a rationally different but geometrically
conjugate local semisimple element `γ′_v`, its obstruction is multiplied by the character
`κ↦⟨inv_v(γ_v,γ′_v),κ_v⟩`, using the inner-form identification of the dual centres
of the local centralizer and `I*`. The inverse convention changes both the relative invariant and
this character. There is no rational basepoint in `G` among the hypotheses. The route extends
the supplier's rational-basepoint construction using the inner twisting cocycle and its
abelianized centralizer invariant; use the full simply connected Hasse principle, including
`E₈` (Kottwitz86 §§6.1–6.7, Theorem 6.6, pp.381–384).
*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§1.1–1.2, 1.5–1.6, 1.9, 1.11 and 1.14–1.15
(nonabelian twisting, abelianization, local and global duality, rational-class invariants,
Hasse principle and the obstruction with a rational basepoint).

The API consists of the following facts.

- The obstruction is independent of geometric conjugators and splitting fields.
- Vanishing is equivalent to rational realization with the specified local rational classes.
- A change at finitely many places multiplies the obstruction by the product of the local
  invariant characters; changing a tuple to itself contributes `1` at every place.

**Checks.**

- For `G=G*=GL_n` with identity twist, regular centralizers are products of multiplicative
  restrictions of scalars, their `H¹` vanishes and every local change character is `1`.
- For the elliptic norm-one torus centralizing a regular element of `SL₂`, a nontrivial local
  class pairs with the nontrivial dual element as `−1`; replacing two such local classes
  multiplies by `(−1)(−1)=1`, whereas a single replacement multiplies by `−1`.
- For `G=G*` and `γ_v=γ*` everywhere, the obstruction is `1`. Replacing a local component by a
  rational conjugate keeps `inv_v=0`, so its factor is `1`.
- The connectedness assertion uses simple connectivity: in `PGL₂`, the element represented by
  `diag(1,−1)` is centralized by the coordinate swap as well as the diagonal torus; its
  centralizer has `2` components, outside the stated hypotheses.

### 5.8 Rational representatives with one auxiliary place

Let `G` be connected reductive over `ℚ` with `G_der` simply connected and `G_{ℚ_p}` quasi-split. Let
`a∈Conj(G)(ℚ)` be a semisimple class with a semisimple elliptic representative `γ_∞∈G(ℝ)` and semisimple representatives
`γ_ℓ∈G(ℚ_ℓ)` for `ℓ≠p` such that `(γ_ℓ)_{ℓ≠p}` lies in `G(𝔸_f^p)`. Then there is a set of primes of positive
Dirichlet density, avoiding any given finite set, such that for each `ℓ₀` in it there is `γ₀∈G(ℚ)`,
`G(ℝ)`-conjugate to `γ_∞` and `G(ℚ_ℓ)`-conjugate to `γ_ℓ` for every `ℓ∉{p,ℓ₀}`. The element `γ₀` may depend
on `ℓ₀`. Route: quasi-splitness and simple connectivity give a representative over `ℚ_p` and a rational
representative `γ*` in the quasi-split inner form (EndoscopicTransferAndUnitaryTraceComparison §1.14(d), transported by the inner-form identification of §1.4 of this roadmap). Form the
obstruction of the adelic family transported to `G` (§5.7a). Because `γ_∞` is
elliptic, the global obstruction group injects into the local group at an auxiliary prime whose Frobenius
in a splitting field is conjugate to complex conjugation; such primes have positive density
(Chebotarev). Local duality (EndoscopicTransferAndUnitaryTraceComparison §1.11(a)) and the parametrization of rational classes in
a stable class (EndoscopicTransferAndUnitaryTraceComparison §1.14(b), with Kneser's vanishing) allow the class at `ℓ₀` to be changed so as to cancel the
obstruction, and Kottwitz's criterion produces `γ₀`. Kottwitz states the criterion for `G_sc` without `E₈` factors; the
proof uses that hypothesis only through the Hasse principle for `G_sc`, which holds in general
(EndoscopicTransferAndUnitaryTraceComparison §1.9(c) and §1.15(b)), so no restriction on `G` is kept. The prime comes from the argument's positive-density
set, not from an arbitrary prescribed one. (Kottwitz90 §7, auxiliary-prime argument on p.188, Kottwitz90 lines 6779–6803; Kottwitz86
Theorem 6.6, Kottwitz86 line 706, and §§6.7–6.8, Kottwitz86 lines 757–761; KZ25 Corollary 6.3.4 and Remark
6.3.5(3), pp.60–61, KZ25 lines 2694–2700 and 2716–2718.)
*Needs:* §1.4; EndoscopicTransferAndUnitaryTraceComparison §§1.9, 1.11, 1.14 and 1.15; §5.7a;
Chebotarev Layer 10.

**Checks.**

- For `G=GL_n` the obstruction group is trivial, and `γ₀` can be taken conjugate to `γ_ℓ` at every `ℓ≠p`.
- For `SL₂` and an elliptic stable class, nontrivial local invariants at two places cancel, while a family
  with exactly one nontrivial invariant is not adelically conjugate to a rational element: changing the
  class at `ℓ₀` is what removes it.
- Semisimplicity is required for every representative: in `GL₂`, the identity and
  `[[1,1],[0,1]]` have the same quotient value `(2,1)`, but ranks `0` and `1` for `γ−1`.
  No rational element can be conjugate to the identity at one place and to this unipotent at another.
- The family `(γ_ℓ)` must be adelic, integral at almost every `ℓ`; unrestricted local choices need not
  define an element of `G(𝔸_f^p)`.

### 5.9 Rational Frobenius representative

In the situation of §5.5 with its point `γ_v`, assume in addition that `G_der` is simply connected and
`G_{ℚ_p}` is quasi-split. Then `γ_v` lifts to `γ₀∈G(ℚ)`, elliptic in `G(ℝ)`, such that `γ₀` and `ρ_ℓ(Fr_v)` are
`G(ℚ_ℓ)`-conjugate for all primes `ℓ≠p` except at most one. The exceptional prime can be chosen in a set of
positive Dirichlet density, and changing it may change `γ₀`. No assertion at `ℓ=p` is made. Route: §5.7
gives the elliptic real representative. The family `(ρ_ℓ(Fr_v))_{ℓ≠p}` lies in `G(𝔸_f^p)`, because the
Galois image is a compact subgroup of `G(𝔸_f^p)` and hence lies in a product of compact open subgroups that
are hyperspecial at almost every `ℓ`; apply §5.8. (KZ25 Corollary 6.3.4 and Remarks 6.3.5(1)–(3),
pp.60–61, KZ25 lines 2694–2718; for the compactness, KZ25 lines 2635–2638.)
*Needs:* §5.5; §5.7; §5.8.

**Checks.**

- For a non-CM elliptic curve, `G=GL₂`, and the rational semisimple matrix with characteristic polynomial
  `X²−aX+q` is `GL₂(ℚ_ℓ)`-conjugate to `ρ_ℓ(Fr_v)` for every `ℓ≠p`: no exceptional prime is needed. It is
  the companion matrix when `a²≠4q`, and the scalar `±√q` when `a²=4q`; the companion matrix of `(X∓√q)²`
  is not semisimple and would be the wrong choice.
- Geometric conjugacy at every `ℓ≠p` already follows from §5.5; rational conjugacy at all but one `ℓ` is
  the additional content.
- The hypotheses are used: KZ25 Remark 6.3.5(1) (KZ25 lines 2702–2704) records that without quasi-splitness
  at `p` there is no reason to expect a rational lift.

### Examples

- Non-CM elliptic curves: `G=GL₂`, `γ_v` is the characteristic polynomial `X²−aX+q`, the real representative
  is elliptic (by `a²<4q`, or because it is central when `a²=4q`), and the rational representative is the
  rational semisimple matrix with that characteristic polynomial.
- CM elliptic curves: `G=Res_{K/ℚ}G_m`, `γ_v` is the Frobenius `π∈K^×` and every statement reduces to
  Shimura–Taniyama.
- `G_m→GL₂`, `t↦diag(t,t⁻¹)`, shows why an injective auxiliary quotient map is required in §5.5.

### Dependencies

§0.6, §§1.3–1.6 and §2.2 of this roadmap. ArithmeticGaloisRepresentations §1.11. ShimuraData §§1.2–1.4, 4.2–4.3. ShimuraVarieties §§5.8 and
7.0i.1. AbelianSchemesAndArithmeticModuli §§A1.3a,
A3.7, A3.9, A4.1, A5.1, A5.7, A6.11, A6.21. EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.2, 1.5, 1.6, 1.9, 1.11, 1.14, 1.15.
ReductiveGroups Layers 4, 6 and 7. ReductiveGroupsPartII §§RG2.0a, RG2.2,
RG2.3.3 and RG2.3.4. NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0b.
Chebotarev Layer 10.

## Downstream consumers

A Shimura-variety roadmap proving the geometric independence of `ℓ` for good-reduction points of Hodge-type
Shimura varieties (KZ25 Theorem 5.1.4) and the realization theorem for isogeny groups (KMPS22 Proposition
2.2.2) consumes Layers 0–1 for the quotient, finiteness and descent statements its proofs use, and
combines its theorems with §4.5 and §5.5 to obtain the rational torus embeddings of KMPS22
Corollary 2.2.14 and the unconditional common Frobenius class of KZ25 Theorem 6.2.7.
The non-emptiness of Newton strata (KMPS22 Proposition 1.2.5 and §1.3) consumes §§2.3 and 2.5. The
Honda–Tate theory for Shimura varieties (CM lifts of isogeny classes, KMPS22 §2.3) consumes §2.5,
§4.5 and §4.6.

## Worked examples

- **The supplied quotient and rational classes.** For `GL₂`, its quotient is
  `Spec k[s,d,d⁻¹]`, with `s=tr`, `d=det`; `d=0` is absent. For semisimple matrices,
  `diag(1,2)` and `diag(2,1)` give the same point `(3,2)`, while `diag(1,3)` gives `(4,3)`.
  In `SL₂(ℚ)`, `[[0,1],[−1,0]]` and `[[0,3],[−1/3,0]]` both have quotient trace `0`, but a
  determinant-one conjugator would require `3` to be a norm from `ℚ(i)`, impossible since its
  valuation at the inert prime `3` is odd. For a quaternion division algebra `D/ℚ`, the quotient
  `Conj(SL₁(D))=𝔸¹` has the rational point `5/2` with no rational lift: reduced characteristic
  polynomial `(X−2)(X−1/2)` would force `ℚ×ℚ` into `D` (ArithmeticGaloisRepresentations §1.11;
  §1.4 here; KZ25 §5.1.3, p.47).
- **The supplied geometric classification.** In `SL₂(𝔽̄₂)`, the points `diag(a,a⁻¹)` and
  `diag(a⁻¹,a)` have equal trace and are conjugate by the Weyl element. Every quotient trace
  `s∈Ω` over an algebraically closed field lifts, since `a²−sa+1=0` has a nonzero root. In a
  torus the quotient is the torus itself; for the trivial group it is a single point. In contrast,
  `G_a` is commutative and the class function `t` distinguishes a nonzero unipotent from its
  semisimple part `0` (ArithmeticGaloisRepresentations §1.11; Steinberg65 Corollaries 6.4–6.6,
  pp.62–63).
- **Supplied realization comparisons.** For the same complex embedding and identity transport,
  the tensor-isomorphism torsor has its identity rational point. Changing a geometric
  trivialization `p` to `pg` changes the group comparison by inner conjugation and leaves the
  quotient comparison fixed; three transports compose to the direct comparison. For different
  embeddings no rational torsor point is asserted. For a CM elliptic curve over `ℚ`, the common
  Mumford–Tate factorization field is the CM field `K`: complex conjugation normalizes and does
  not centralize its action. For a non-CM elliptic curve it is the ground field. Retaining the
  Tate line of the polarization permits multiplier `4` for `2·id`; fixing the untwisted form
  instead would impose multiplier `1` (ShimuraVarieties §7.0i.1; MotivesAndAlgebraicCycles §6.8;
  KZ25 §§6.1.1–6.1.4, pp.55–56).
- **`G_m` and the faithful representation `t↦diag(t,t⁻¹)`.** `Conj(G_m)=G_m` maps finitely, with degree two,
  to `Conj(GL₂)`; `2` and `1/2` lie in one fibre. This separates three claims: finiteness of the quotient map
  (true, §0.6), separation by all characters of `G_m` (true, §0.5) and separation by the one faithful
  characteristic polynomial (false).
- **Unipotent elements.** In `GL₂` the identity and `[[1,1],[0,1]]` have the same quotient point; the class
  interpretation of `Conj` requires semisimplicity (ArithmeticGaloisRepresentations §1.11).
- **Prime-units in a noncommutative group.** For `q≠l`, `a=[[1,1/q],[0,1]]` and `b=[[1,0],[1/q,1]]` are
  `l`-units, while `tr(ab)=2+1/q²` is not `q`-integral, so `ab` is not; in a torus commuting products and
  inverses keep the property (§3.2).
- **Serre tori.** The norm-one torus of `ℚ(√3)` fails the Serre condition and its point `2+√3` is a finite
  unit with unequal real absolute values; the norm-one torus of `ℚ(i)` satisfies it, and `(3+4i)/5` is a
  `5`-Weil point whose powers are dense (§3.1, §§3.6–3.7).
- **Real lifting.** In `G_m` with scalar cocharacter `id` and `ν=t²`, dividing by the positive radius gives
  `±1` and restoring it gives `±r` in the prescribed class; in general `χ+cχ=mν` on an elliptic torus does
  the same (§5.6).
- **Rigidity.** On `Spec k[ε]/(ε²)` the automorphism `ε↦2ε` fixes the unique dense point, and on the doubled
  affine line the swap of the origins fixes the dense punctured line; reducedness and separatedness are
  both needed in §3.8, and both hold for tori.

## References

- **KZ25.** M. Kisin, R. Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian
  varieties*, arXiv:2103.09945v2; published Ann. of Math. 202 (2025). Locators use the arXiv v2 pages:
  §5.1.3 and Theorem 5.1.4, pp.47–48; §5.3.2, Proposition 5.3.5 and §5.3.6, pp.53–55; §6.1 and Lemma 6.1.4,
  pp.55–56; Proposition 6.2.4, §6.2.5 and Lemma 6.2.6, pp.57–59; Theorem 6.2.7 and Remark 6.2.8, p.59;
  Lemma 6.3.3, Corollary 6.3.4 and Remarks 6.3.5, pp.60–61.
- **KMPS22.** M. Kisin, K. Madapusi Pera, S. W. Shin, *Honda–Tate theory for Shimura varieties*, Duke Math.
  J. 171 (2022); author PDF of 27 January 2021: Lemmas 1.2.1–1.2.2 and Proposition 1.2.5, pp.13–15; §2.1.8,
  p.24; §§2.2.1–2.2.14, pp.24–30; Remarks 2.3.16, p.36.
- **Steinberg65.** R. Steinberg, *Regular elements of semisimple algebraic groups*, Publ. Math. IHÉS 25
  (1965), 49–80: §6, 6.1–6.6 and 6.11, printed pp.62–64.
- **Kottwitz86.** R. E. Kottwitz, *Stable trace formula: elliptic singular terms*, Math. Ann. 275 (1986),
  365–399: Theorem 2.2, Proposition 2.6, Theorem 6.6, §§6.7–6.8.
- **Kottwitz90.** R. E. Kottwitz, *Shimura varieties and λ-adic representations*, in Automorphic Forms,
  Shimura Varieties, and L-functions I (1990), 161–209: §7, p.188.
- **Kottwitz82.** R. E. Kottwitz, *Rational conjugacy classes in reductive groups*, Duke Math. J. 49
  (1982), 785–806: Corollary 2.2 (cited by its locator).
- **LR87.** R. P. Langlands, M. Rapoport, *Shimuravarietäten und Gerben*, J. reine angew. Math. 378 (1987),
  153–211; author-hosted retyped text: Lemma 5.6, internal p.55.
- **Borovoi98.** M. Borovoi, *Abelian Galois cohomology of reductive groups*, Mem. AMS 132 (1998), no. 626;
  author text: Lemma 5.6.3, p.37.
- **Harder66.** G. Harder, *Über die Galoiskohomologie halbeinfacher Matrizengruppen. II*, Math. Z. 92
  (1966), 396–415: Lemma 5.5.3 and its proof, p.407.
- **Deligne82.** P. Deligne, *Hodge cycles on abelian varieties* (notes by J. S. Milne), in LNM 900 (1982);
  revised author-hosted text: Main Theorem 2.11, p.19; §§3.4–3.6, pp.24–25; Theorem 3.8 and Lemma 3.9,
  pp.26–27.
- **Shin11.** S. W. Shin, *Galois representations arising from some compact Shimura varieties*, Ann. of Math.
  173 (2011); author version: §3.1, Lemma 3.1 (published Lemma 3.1.1) and Remark 3.2, pp.12–14.
- **Noot09.** R. Noot, *Frobenius conjugacy classes and Mumford–Tate groups*, J. London Math. Soc. 79 (2009),
  53–71: §1.5, Theorem 2.4, Lemmas 2.5–2.6, §3 (cited by its locator).
