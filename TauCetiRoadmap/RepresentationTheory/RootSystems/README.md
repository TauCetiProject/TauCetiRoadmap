# Roadmap: root systems, Weyl groups, and the Cartan–Killing classification

**Summary.** Complete the theory of finite crystallographic root systems around
the native root combinatorics, Coxeter presentation, chambers, Dynkin
classification and numbered integral models, and develop the sign theory and
faithful geometric representation of arbitrary Coxeter systems, including
infinite rank and infinite exponents. The end results are geometric faithfulness
and its integral form, the length formula on the presented Weyl group, the
rational classification up to isomorphism, the symmetric-group Weyl group of
type A over every characteristic-zero domain, walks to the greatest root, the
semidirect decomposition of root automorphisms with its oriented-diagram and
integral-lattice forms, and componentwise invariant metrics.

## Scope and ownership

This roadmap owns the general Coxeter geometric sign and faithfulness theorems
(Layer 1), the consumer interface of the marked Weyl presentation (Layer 2), the
rational classification and the type A Weyl group over characteristic-zero
domains (Layer 3), coefficient reflections and greatest-root walks (Layer 4),
root automorphisms and the based complement (Layer 5), and the irreducible
components with their invariant metrics (Layer 6).

Mathlib supplies root pairings, bases, integral coordinates, root strings,
abstract Coxeter systems and the two-length theorem for invariant forms. Tau Ceti
supplies positive roots, lowering, inversions, root and abstract exchange, Tits'
theorem with the length–inversion formula, Matsumoto, Bruhat order, Poincaré
polynomials, parabolic restriction, the geometric action of a Coxeter system,
chambers, simple transitivity on bases, the longest element, the finite Cartan
classification and its base independence, Cartan rigidity, the highest root, the
rank-two dihedral and rational type A Weyl groups, and the numbered simply
connected and rational models. These are consumed through the contracts below
and are not construction targets. There is one native `TauCeti.DynkinType`, one
standard Cartan family and one integral datum per valid type. The exported
`DynkinType` in Suggested.lean and the exports of its constructors, rank,
validity and long-root predicate are names for the native declarations, not new
definitions.

[LieHighestWeight, Layers 1–2](../LieHighestWeight/README.md#layer-2-weights-of-a-module-and-their-integrality)
owns the representation-theoretic weight lattices, fundamental and dominant
weights; its Layer 6 owns the Weyl character and dimension formulas. The
numbered simply connected models used here are the native models, not a second
lattice theory.
[ReflectionInvariantTheory, §4](../../ReflectionInvariantTheory/README.md#4-crystallographic-weylcoxeter-dictionary)
owns exponents, invariant degrees and their root-height comparison; its §3 owns
the hyperplane arrangements of general finite real reflection groups, whereas
the chambers here are the native algebraic cones. RootSystemsPartII, Layers 1–4,
owns integral dominance, the Stembridge step, finite diagram folding and
invariant dominance. [ReductiveGroups, §9A.1a-L](../../ReductiveGroups/README.md)
owns kernel-fixing ADE cover lifts, and
[ZigzagPreprojective, Layer 0](../../ZigzagPreprojective/README.md) owns affine
diagrams, quivers and gradings. None of these is an input here. Computational
enumeration and games on arbitrary integer vectors are outside this roadmap.

The ownership boundary with EnriquesSurfaces §5.2 places the general arbitrary-index
geometric sign, faithfulness and integral comparison results here in Layer 1.
Enriques surface geometry, the T246 lattice, its specified integral reflections,
its mod-two action and its congruence kernels belong to EnriquesSurfaces §5.2.
The required direction is from these general results to that lattice
application; no surface or T246 theorem is a supplier here.

## Conventions

A root-pairing statement uses `P : RootPairing ι R V U`, with its perfect pairing
and injective root and coroot families, where R is a commutative
characteristic-zero domain unless a section says otherwise. Finiteness of ι,
crystallographicity and reducedness are explicit hypotheses. Spanning
(`RootPairing.IsRootSystem`) and irreducibility are required only where stated;
the native `RootPairing.IsIrreducible` includes nontriviality of both modules.
Classification of irreducible types also requires nonempty ι: the empty system
has rank zero and is not a valid irreducible Dynkin type. Chamber statements use
real coefficients or the ordered coefficient ring of the supplier contract;
metric statements use ℝ. Full integral data use `RootDatum`, a root pairing over
ℤ, and do not assume integral spanning.

The root and coroot families are indexed by ι; simple roots by `b.support` for
`b : P.Base`. Cartan entries have root rows and coroot columns: Cᵢⱼ = ⟨αᵢ,αⱼ∨⟩.
A simple-root coefficient vector is a column; reflection at i changes its i-th
entry by subtracting Σⱼ Cⱼᵢcⱼ. In the numbered simply connected model, character
coordinates are fundamental-weight coordinates, cocharacter coordinates are
simple-coroot coordinates, and the simple root i is row i of the Cartan matrix.
Bourbaki label k is at zero-based index k−1. Bₙ has short last root and Cₙ long
last root; B₂ has matrix `!![2, -2; -1, 2]`, whereas G₂, short root first, has
`!![2, -1; -3, 2]`. Roots and coordinates have different index sets: A₁ has two
roots in one coordinate, A₂ six roots in two, and G₂ twelve roots in two. Root
lengths in this document are squared lengths. The positive cone uses nonnegative
**integer** simple-root coordinates. Inversions of w are the positive roots sent
negative by w. The forward cocharacter map of a root-pairing equivalence is the
inverse of its contravariant `RootPairing.Equiv.coweightEquiv`.

For a general Coxeter system `cs : CoxeterSystem M W`, the index type I and group
W have arbitrary universes. There is no finiteness hypothesis. Work on the free
real vector space `I →₀ ℝ`, writing αᵢ for `Finsupp.single i 1` and ρ for the
native geometric representation. The Coxeter entry 0 means infinite order,
not order zero; diagonal entries are 1. The Gram form B has diagonal 1 and
B(αᵢ,αⱼ)=−cos(π/mᵢⱼ), with value −1 at an infinite entry. A simple reflection is
x ↦ x−2B(αᵢ,x)αᵢ. The form may be degenerate or indefinite. Positivity means
coordinatewise nonnegativity and nonzero vector, not positive squared norm.

Products act on the left, with the rightmost factor acting first. A right descent
of w is an i with ℓ(wsᵢ)<ℓ(w). `CoxeterSystem.alternatingWord i j k` ends in j
when k>0. In A₂, ρ(sᵢsⱼ)αᵢ=αⱼ, whereas ρ(sⱼsᵢ)αᵢ=−αᵢ−αⱼ. For an infinite
entry, ρ(sᵢsⱼ)αᵢ=3αᵢ+2αⱼ. These values fix the action and word conventions.

**Checks.**

- In B₂, C is `!![2, -2; -1, 2]`; reflection at the short node sends (1,0) to
  (1,2). Using C instead of its transpose in the column formula gives (1,1).
- In A₂, the inversions of s₁s₂ are α₂ and α₁+α₂; α₁ is not an inversion.
  Reversing the action convention interchanges α₁ and α₂.
- For the coordinate permutation σ=(123), the weight map sends e₁ to e₂,
  the contravariant coweight map sends e₁ to e₃, and its inverse sends e₁ to e₂.
  An involution alone would not distinguish these maps.

## Exact supplier contracts

### From Mathlib

Paths in this subsection are relative to Mathlib.

- `RootPairing` in `Mathlib/LinearAlgebra/RootSystem/Defs.lean` bundles a perfect
  pairing, injective root and coroot families, reflection permutations, and the
  diagonal pairing 2. It does not assert finiteness, spanning, reducedness or
  crystallographicity. `RootPairing.ne_neg` excludes a singleton root-index set
  in characteristic zero. `RootPairing.IsRootSystem` adds spanning of both
  families; irreducibility does not replace the nonempty hypothesis used here.
  `RootDatum` in the same file is a root pairing over ℤ.
- `RootPairing.IsCrystallographic` and `RootPairing.pairingIn` in
  `Mathlib/LinearAlgebra/RootSystem/IsValuedIn.lean`; `RootPairing.IsReduced` and
  `RootPairing.IsIrreducible` are in `Reduced.lean` and `Irreducible.lean` in that
  directory.
- `RootPairing.Base` in `Mathlib/LinearAlgebra/RootSystem/Base.lean` has finite
  support, independent simple roots and coroots, and separately signed natural
  expansions for each family. It does not assert a finite root set.
  `RootPairing.Base.IsPos`, `RootPairing.Base.height` and
  `RootPairing.Base.IsPos.reflectionPerm` supply signs, heights and preservation
  under a simple reflection away from its own root. `RootPairing.Base.toWeightBasisInt`
  is a ℤ-basis of `RootPairing.rootSpan`, not of the whole weight lattice;
  `RootPairing.rootSpanMem` embeds each root into that span. `RootPairing.Base.map`
  transports a base along an equivalence. `RootPairing.nonempty_base`
  in `Mathlib/LinearAlgebra/RootSystem/BaseExists.lean` supplies base existence for
  finite reduced crystallographic root systems over characteristic-zero fields.
- `RootPairing.Base.cartanMatrix`, `RootPairing.Base.cartanMatrix_apply_same`,
  `RootPairing.Base.cartanMatrix_le_zero_of_ne`,
  `RootPairing.Base.cartanMatrix_mem_of_ne`,
  `RootPairing.Base.cartanMatrix_nondegenerate`, and
  `RootPairing.Base.cartanMatrix_eq_neg_chainTopCoeff` in
  `Mathlib/LinearAlgebra/RootSystem/CartanMatrix.lean` supply the diagonal,
  off-diagonal, nondegeneracy and root-string identities under their finite,
  characteristic-zero domain and crystallographic hypotheses; nondegeneracy
  also uses spanning. `RootPairing.Base.equivOfCartanMatrixEq` gives
  the isomorphism for a specified simultaneous Cartan relabelling of finite
  reduced crystallographic root systems over the same characteristic-zero domain.
  `RootPairing.Base.map_equiv_cartanMatrix` in the same file identifies the Cartan
  matrix of `RootPairing.Base.map` with simultaneous reindexing by
  `RootPairing.Base.supportMapEquiv`.
- `RootPairing.chainTopCoeff`, `RootPairing.chainBotCoeff` and
  `RootPairing.root_add_nsmul_mem_range_iff_le_chainTopCoeff` in
  `Mathlib/LinearAlgebra/RootSystem/Chain.lean`; use the native independent-root
  hypotheses when interpreting a root string.
- `RootPairing.InvariantForm` in `Mathlib/LinearAlgebra/RootSystem/RootPositive.lean`,
  its symmetric bilinear form, nonzero root self-values and reflection invariance;
  positive definiteness is an additional hypothesis.
  `RootPairing.RootPositiveForm.posForm` and
  `RootPairing.RootPositiveForm.rootLength` in the same file are the positive-form
  and squared-length operations. The canonical positive form on the finite root span
  comes from `RootPairing.posRootForm` in
  `Mathlib/LinearAlgebra/RootSystem/Finite/CanonicalBilinear.lean`;
  `RootPairing.posRootForm_rootFormIn_posDef` in
  `Mathlib/LinearAlgebra/RootSystem/Finite/Nondegenerate.lean` supplies positive
  definiteness on the root span.
- `RootPairing.InvariantForm.apply_eq_or` and
  `RootPairing.InvariantForm.exists_apply_eq_or` in
  `Mathlib/LinearAlgebra/RootSystem/Finite/Lemmas.lean`, for a finite reduced
  irreducible crystallographic pairing and any invariant form: two root
  self-values are equal or in ratio 2 or 3, either way round, and, for a nonempty
  index type, two roots' self-values cover every root. Positive definiteness is not
  assumed there; §6.2 adds it only to order the two values.
- `RootPairing.Equiv.indexHom`, `RootPairing.Equiv.weightHom` and
  `RootPairing.Equiv.coweightHom` in `Mathlib/LinearAlgebra/RootSystem/Hom.lean`;
  the last has opposite-group target. `RootPairing.weylGroup`,
  `RootPairing.weylGroup.ofIdx`, and `RootPairing.weylGroupToPerm` in
  `Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean` supply the actual subgroup of
  root-pairing automorphisms, its reflections and root-index action.
- `CoxeterMatrix` in `Mathlib/GroupTheory/Coxeter/Matrix.lean`, and
  `CoxeterMatrix.Group`, `CoxeterMatrix.toCoxeterSystem`, `CoxeterSystem.lift`,
  `CoxeterSystem.simple`, `CoxeterSystem.wordProd`,
  `CoxeterSystem.alternatingWord`, `CoxeterSystem.length`,
  `CoxeterSystem.IsRightDescent`, `CoxeterSystem.exists_rightDescent_of_ne_one`,
  `CoxeterSystem.length_mul_simple`, and `CoxeterSystem.wordProd_braidWord_eq`
  in `Mathlib/GroupTheory/Coxeter/Basic.lean` and `Length.lean` give the abstract
  presentation and length/descent vocabulary, with no finite-index assumption.
  `CoxeterMatrix.reindexGroupEquiv` in `Mathlib/GroupTheory/Coxeter/Basic.lean`
  maps the group of the reindexed matrix to the original group. Its generator
  equations are `CoxeterMatrix.reindexGroupEquiv_apply_simple` and
  `CoxeterMatrix.reindexGroupEquiv_symm_apply_simple`; the inverse sends the
  generator at i to the generator at e(i).
- `Finsupp.lmapDomain` and `Finsupp.linearEquivFunOnFinite` in
  `Mathlib/LinearAlgebra/Finsupp/Defs.lean` give coordinate transport.
  `MulAction.stabilizer`, `Subgroup.comap` and `Subgroup.IsComplement'` supply
  setwise stabilizers and subgroup complements; `SemidirectProduct.mulEquivSubgroup`
  in `Mathlib/GroupTheory/SemidirectProduct.lean` turns a complement with a normal
  factor into the conjugation semidirect product.

### From Tau Ceti

Paths in this subsection are relative to Tau Ceti; a file name without a directory
is in the directory of the first full path of its bullet, or in
`TauCeti/LinearAlgebra/RootSystem/` when the bullet names none. All declarations
keep their native hypotheses.

- In `TauCeti/LinearAlgebra/RootSystem/Positive.lean`, `TauCeti.posRoots`,
  `TauCeti.negRoots` and `TauCeti.posRootCone` are the native positive and negative
  index sets and the cone of nonnegative integer combinations of simple roots.
  `TauCeti.exists_mem_support_height_reflectionPerm_lt` in `Lowering.lean`
  requires finite root indices, a characteristic-zero domain, crystallographicity
  and reducedness. A positive nonsimple root remains positive and strictly loses
  height under some simple reflection. `TauCeti.inversions` in
  `Inversions/Basic.lean` consists of positive indices whose images are negative.
  `TauCeti.ncard_inversions_mul_ofIdx` in `Inversions/Exchange.lean` gives the
  one-step change, and `TauCeti.exists_wordProd_eraseIdx_eq_mul_ofIdx` and
  `TauCeti.eq_one_of_mapsTo_posRoots` in `Inversions/StrongExchange.lean` give
  root-level deletion and the triviality of a Weyl element keeping every positive
  root positive. `TauCeti.wordProd` in `SimpleReflections.lean` spells a word in
  the simple reflections; `TauCeti.isLeast_ncard_inversions` in
  `Inversions/Length.lean` identifies the inversion count with the least length of
  such a word. `TauCeti.image_root_inversions` and
  `TauCeti.ncard_inversions_eq_ncard_vector_inversions` in `Inversions/Basic.lean`
  identify index inversions with their root-vector images and cardinalities.
- `RootPairing.weylGroupToPerm_injective` and `RootPairing.finite_weylGroup` in
  `TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean` supply root-action
  faithfulness for spanning root systems over any commutative ring; adding
  finite root indices gives finiteness of the Weyl group.
- `TauCeti.weylGroup_eq_closure_simple` in `SimpleReflections.lean`,
  `TauCeti.coxeterMatrixOfBase` in `Coxeter/Matrix.lean`, and, in
  `Coxeter/Presentation.lean`, `TauCeti.weylCoxeterHom`,
  `TauCeti.weylCoxeterHom_apply_simple`, `TauCeti.weylCoxeterHom_wordProd`,
  `TauCeti.weylCoxeterHom_surjective` and `TauCeti.weylCoxeterHom_injective`
  (Tits' theorem) supply generation, the matrix and the marked presentation. The
  same file gives the Weyl group as a Coxeter system on the actual simple
  reflections: `TauCeti.weylCoxeterSystem`, `TauCeti.weylCoxeterSystem_simple`,
  `TauCeti.weylCoxeterSystem_wordProd`, `TauCeti.length_weylCoxeterSystem_eq`
  (Coxeter length equals inversion count), `TauCeti.isReduced_weylCoxeterSystem_iff`
  and `RootPairing.weylCoxeterSystem_isReflection_ofIdx`. The matrix has diagonal
  1 and off-diagonal orders 2,3,4,6 for Cartan products 0,1,2,3. The matrix and
  the homomorphism need finite root indices, a characteristic-zero domain and
  crystallographicity; generation, surjectivity, injectivity and the Coxeter
  system also need reducedness. None of them needs spanning.
- `CoxeterSystem.strongExchange`, `CoxeterSystem.exchangeCondition`, and
  `CoxeterSystem.deletionCondition` in
  `TauCeti/GroupTheory/Coxeter/StrongExchange.lean`, and `TauCeti.matsumoto` in
  `Matsumoto.lean`, supply abstract exchange, deletion and the reduced-word
  property. `CoxeterSystem.parabolic`, `CoxeterSystem.exists_isMinimalCosetRep`,
  `CoxeterSystem.isMinimalCosetRep_iff`,
  `CoxeterSystem.length_mul_of_isMinimalCosetRep` in `Parabolic.lean`, and
  `CoxeterSystem.wordProd_alternatingWord_eq_of_mem_parabolic_pair` in
  `Dihedral.lean` supply the minimal-coset and rank-two inputs.
  `CoxeterSystem.parabolicHom`, `CoxeterSystem.range_parabolicHom`,
  `CoxeterSystem.parabolicHom_injective` and `CoxeterSystem.length_parabolicHom`
  in `Restriction.lean` identify a standard parabolic subgroup with the Coxeter
  group of the restricted matrix, with the same lengths. These hold for arbitrary
  Coxeter index types, independently of geometric faithfulness.
- `CoxeterSystem.BruhatLE`, `CoxeterSystem.BruhatLE.antisymm` and
  `CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq` in
  `TauCeti/GroupTheory/Coxeter/Bruhat.lean` supply the Bruhat order and its
  reduced-subword criterion, without finiteness. `TauCeti.poincarePolynomial`,
  `TauCeti.coeff_poincarePolynomial` and `TauCeti.eval_one_poincarePolynomial` in
  `Poincare.lean` supply the length-generating polynomial, its coefficients and its
  value equal to the group order when W is finite.
- `CoxeterMatrix.geometricForm`, `CoxeterMatrix.geometricForm_single_single`,
  `CoxeterMatrix.geometricReflection`, `CoxeterMatrix.geometricReflection_apply`,
  `CoxeterSystem.geometricRepresentation`,
  `CoxeterSystem.geometricRepresentation_simple`,
  `CoxeterSystem.geometricForm_geometricRepresentation`, and
  `CoxeterSystem.orderOf_simple_mul_simple` in
  `TauCeti/GroupTheory/Coxeter/Geometric.lean` supply the form, action, generator
  formula, form invariance and exact pairwise orders. These require neither
  nondegeneracy nor finite rank. They do not assert faithfulness.
- `RootPairing.dominantChamber` and `RootPairing.openDominantChamber` in
  `TauCeti/LinearAlgebra/RootSystem/Chamber.lean` are the simple-coroot weak and
  strict sign cones. `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` in
  `FundamentalDomain.lean` gives uniqueness also on walls, over a linearly
  ordered strict ordered commutative ring of characteristic zero, with finite ι,
  crystallographicity, reducedness of P and its flip, and spanning. Its
  `TauCeti.stabilizer_eq_closure_wallReflections` describes boundary stabilizers.
  `TauCeti.openWeylChamber` in `Weyl/Chamber.lean` supplies the open chambers.
  `RootPairing.Base.existsUnique_map_eq` in `Weyl/Bases.lean` states that the Weyl
  group acts simply transitively on the bases, for finite reduced crystallographic
  pairings over a characteristic-zero domain, without spanning.
  `TauCeti.longestElement`, `TauCeti.longestElement_sq`,
  `TauCeti.inversions_longestElement` and
  `TauCeti.ncard_inversions_longestElement` in `LongestElement.lean` supply the
  longest element.
- `RootPairing.Base.eq_one_of_forall_indexEquiv_eq`,
  `RootPairing.Base.mem_support_map_iff` and
  `RootPairing.Base.weylGroup_eq_top_of_matrixSymmetryGroup_eq_bot` in
  `Weyl/Automorphism.lean`: with spanning, an automorphism fixing every simple
  index is the identity, the support of a transported base is the image of the
  support, and every automorphism is a Weyl element when the Cartan matrix has no
  nontrivial symmetry.
- `TauCeti.DynkinType`, `TauCeti.DynkinType.Valid`,
  `TauCeti.DynkinType.cartanMatrix`, `TauCeti.HasCartanType` and
  `TauCeti.HasCartanType.map` in `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean`
  supply the oriented dictionary and transport of a Cartan type along a
  root-pairing equivalence. Valid ranks are A≥1, B≥2, C≥3, D≥4 and the five
  exceptional types. `TauCeti.IsFiniteType` in `FiniteType/Basic.lean` means
  generalized Cartan axioms and a positive rational diagonal symmetrizer giving a
  positive-definite matrix. `TauCeti.isFiniteType_cartanMatrix` supplies this for
  a finite crystallographic root system with a base over a characteristic-zero
  domain. `TauCeti.existsUnique_dynkinType` in `FiniteType/Classification.lean`
  requires finite nonempty ι, spanning, reducedness, crystallographicity and
  irreducibility over a characteristic-zero domain and classifies a specified base.
  `TauCeti.HasCartanType.of_base` and
  `TauCeti.nonempty_weylGroup_mulEquiv_of_hasCartanType` in `Weyl/CartanType.lean`
  make the type independent of the base and the Weyl group an invariant of the
  type. `TauCeti.nonempty_equiv_of_hasCartanType` in `Isomorphism.lean` supplies
  rigidity for two bases of the same type, over the same ring.
- `RootPairing.Base.highestRoot`, `RootPairing.Base.root_highestRoot_sub_mem_posRootCone`,
  `RootPairing.Base.forall_root_sub_mem_posRootCone_iff`,
  `RootPairing.Base.height_lt_height_highestRoot`,
  `RootPairing.Base.exists_root_highestRoot_eq_sum_nat` and
  `RootPairing.Base.root_highestRoot_add_root_notMem` in `HighestRoot.lean`: for
  a finite nonempty reduced irreducible crystallographic pairing over a
  characteristic-zero domain, the highest root lies above every root in the
  positive cone, is the only such root, is strictly highest, has positive
  simple coefficients, and admits no addition of a simple root. Spanning is not
  assumed.
- `TauCeti.DynkinType.IsLongSimpleRoot` and `TauCeti.DynkinType.rootLength` in
  `RootLength.lean` and `TauCeti.DynkinType.numRoots` in `NumberOfRoots.lean` fix
  lengths and counts; the lengths satisfy the root-row Cartan convention.
  `TauCeti.DynkinType.simplyConnectedRootDatum`,
  `TauCeti.DynkinType.simplyConnectedBase`, `TauCeti.DynkinType.simpleIndex`,
  `TauCeti.DynkinType.hasCartanType_simplyConnectedRootDatum` and
  `TauCeti.DynkinType.span_coroot_simplyConnectedRootDatum` in
  `SimplyConnectedRootDatum/Assembly.lean` give the actual integral data.
  `TauCeti.DynkinType.rationalRootSystem`, `TauCeti.DynkinType.rationalBase`,
  `TauCeti.DynkinType.cartanMatrix_rationalBase` and
  `TauCeti.DynkinType.hasCartanType_rationalRootSystem` in
  `SimplyConnectedRootDatum/Rational.lean` give their rational realizations.
  All these models take a proof of validity; roots are indexed by `Fin t.numRoots`,
  both lattices by `Fin t.rank → ℤ`. `TauCeti.rootPairingBaseChange` in
  `BaseChange/Pi.lean` is the dot-product base change. The aliases `DynkinType`,
  `DynkinType.A`, `DynkinType.B`, `DynkinType.C`, `DynkinType.D`, `DynkinType.E6`,
  `DynkinType.E7`, `DynkinType.E8`, `DynkinType.F4`, `DynkinType.G2`,
  `DynkinType.rank`, `DynkinType.Valid` and `DynkinType.IsLongSimpleRoot` in
  Suggested.lean refer to these native declarations.
- `TauCeti.DynkinType.diagramSymmetry`, `TauCeti.DynkinType.rationalDiagramAut`,
  `TauCeti.DynkinType.diagramAut` and `TauCeti.DynkinType.diagramAutHom` from
  `SimplyConnectedRootDatum/DiagramAutomorphism.lean` and its imports give the
  numbered diagram action, with its simple-root and coordinate equations.
- `RootPairing.weylGroup_equiv_perm_of_typeA` and
  `RootPairing.card_weylGroup_of_hasCartanType_A` in `Weyl/TypeA/Basic.lean` give,
  for a finite reduced crystallographic **rational** root system with a base of
  type Aₙ and n≥1, a multiplicative equivalence with `Equiv.Perm (Fin (n + 1))`
  and order (n+1)!. `TauCeti.DynkinType.typeARationalWeylGroupEquiv` and
  `TauCeti.DynkinType.typeARationalWeylGroupEquiv_ofIdx_typeASimpleIndex` send
  the simple reflections of the native rational model to adjacent transpositions.
- `TauCeti.hasCartanType_G2_of_isG2` in `RankTwo.lean` identifies the Cartan type
  of any base of a finite crystallographic characteristic-zero-domain pairing
  satisfying `RootPairing.IsG2`.
  `TauCeti.nonempty_dihedralGroup_mulEquiv_weylGroup_of_hasCartanType_G2` and
  `TauCeti.card_weylGroup_of_hasCartanType_G2` in `Weyl/Dihedral.lean` identify
  the G₂ Weyl group with the dihedral group of order 12; its A₂ and B₂
  counterparts give orders 6 and 8. These require finite reduced
  crystallographic pairings over characteristic-zero domains, not spanning.
  `TauCeti.DynkinType.posRootsFinset_g2` in
  `SimplyConnectedRootDatum/G2/Positive.lean` lists the six positive roots of the
  numbered G₂ datum.
- `RootPairing.InvariantForm.two_mul_apply_root` in `InvariantForm/Basic.lean`
  gives 2B(x,αⱼ) = ⟨x,αⱼ∨⟩B(αⱼ,αⱼ), used in §6.2.
- `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix` in
  `FiniteType/Irreducible.lean` makes a system with connected Cartan graph irreducible.

**Checks of the supplied conventions.**

- Finite type holds for [2] with symmetrizer [1] and value 2 at 1. It also
  holds for the empty matrix. For affine A₁, `!![2, -2; -2, 2]`, the value
  at (1,1) is 0 for every symmetrizer, so positive definiteness fails.
- Native validity admits A₁ and B₂ but rejects A₀, B₁, C₂ and D₃. The B₂
  Cartan matrix is `!![2, -2; -1, 2]`, its Coxeter off-diagonal is 4, and the
  A₁ Coxeter matrix is [1], not its Cartan matrix [2].
- The native A₁ datum has root 2 and coroot 1 in simple coordinates; their
  pairing is 2, while a fundamental weight pairs to 1. Reflection sends these
  to −2 and −1. An unmarked isomorphism therefore cannot certify identity of
  the designated simple index.
- In the infinite rational pairing H=`!![2, -3; -3, 2]`, take integral norm
  ±2 vectors as roots and put v∨=(H(v,v)/2)v. The two coordinate vectors form
  a base: opposite-sign nonzero coordinates have norm at least 10. The root
  (1,1) has height 2, but its simple reflections (2,1) and (1,2) have height 3.
  Iterating s₁s₂ on (1,0) gives (8,3), (55,21), (377,144); finiteness cannot
  be dropped from lowering. In A₂, (1,1) instead lowers to height 1.
- In A₁ the closed chamber is [0,∞); reflection fixes 0 but sends 1 to −1.
  Thus uniqueness of a dominant representative does not imply a trivial wall
  stabilizer. The longest element is reflection, has one inversion and squares
  to 1; in rank zero it is the identity and has zero inversions.

## How to read the build

Layer 1 develops geometric signs from the public rank-two reflection formulas and
abstract parabolic theory, then proves faithfulness and integral comparison; it
uses no finite root system. Layer 2 builds the consumer interface of the native
marked presentation. Layer 3 completes the rational classification and the type A
Weyl group over characteristic-zero domains. Layer 4 uses native integral
coordinates, root strings and the highest root for greatest-root walks. Layer 5
uses native simple transitivity on bases for automorphism complements and then
retains the full integral lattices. Layer 6 develops components and metrics
independently of the presentation. The native chamber, classification and
integral-model contracts remain available directly to all consumers; none of the
layers is a premise for rebuilding them.

## Layer 1: geometric roots and faithful representations

### 1.1 Positive vectors and standard roots

Define `GeometricPositive` on `I →₀ ℝ` by nonnegative coefficients and at least one
strictly positive coefficient. The standard roots are the orbit set
{ρ(w)αᵢ : w ∈ W, i ∈ I}; negative roots are those whose negative is positive.
The orbit condition is essential: sign claims are about these roots, not arbitrary
vectors (Humphreys, §5.4, pp.111–113).

- Positivity is equivalent to coordinatewise nonnegativity and a nonzero vector.
- Positive scalar multiplication preserves and reflects positivity when the scalar
  is strictly positive; zero scalar multiplication does not preserve it.
- Sums of positive vectors are positive, and no vector and its negative are both positive.
- The root orbit is W-stable. Its vectors are nonzero and have B-norm 1, by form
  preservation; neither statement asserts positive definiteness of B.
- After §1.2, every standard root is positive or negative. A simple reflection
  permutes the positive roots other than its own simple root: all other
  coefficients are unchanged, and a root supported only at i must be ±αᵢ by norm 1.

**Checks.**

- The coordinate vector αᵢ has coefficient 1 at i and is positive; 0 has no strictly
  positive coefficient and fails. A weak nonnegative-cone definition would admit 0.
- For distinct i,j, αᵢ−αⱼ has coefficients 1,−1 and neither sign is positive.
  A positive-squared-norm predicate would admit this vector in the orthogonal case.
- In infinite dihedral type, αᵢ+αⱼ is positive with norm 0 and is not a root,
  since every root has norm 1. Positivity alone must not define the root orbit.
- For empty I the vector space has only 0 and the root orbit is empty; for I=ℕ
  and all off-diagonal entries 2, a word involving 0 and 1 fixes every αₙ with n≥2.

*Needs:* native geometric action and form preservation; Mathlib finite-support
coordinate arithmetic. The sign and simple-reflection clauses use §1.2.

### 1.2 Rank-two positivity and the sign/length theorem

Prove `rankTwo_nonnegative`: for i,j ∈ I and k with k<mᵢⱼ or mᵢⱼ=0, the image
ρ(word(i,j,k))αᵢ is a nonnegative real combination of αᵢ,αⱼ. If i=j the hypothesis
forces k=0. For i≠j and finite m, put θ=π/m and S(n)=sin(nθ)/sin θ; here m≥2,
so 0<θ<π and the denominator is nonzero. At m=0 define S(n)=n, without division.
The image is S(k+1)αᵢ+S(k)αⱼ for even k and S(k)αᵢ+S(k+1)αⱼ for odd k.
Induction using the reflection formula proves these equations. For k<m the
arguments of sine lie in [0,π], giving the desired signs (Humphreys, §5.4,
dihedral step of the Theorem, pp.112–113; the displayed coefficients are the
explicit recurrence calculation).

Prove `geometric_sign_criterion`: for every w and i, ρ(w)αᵢ is positive if and
only if i is not a right descent of w, and its negative is positive if and only
if i is a right descent. Equivalently, the two cases have lengths ℓ(wsᵢ)=ℓ(w)+1
and ℓ(wsᵢ)+1=ℓ(w), respectively (Humphreys, §5.4, Theorem, pp.111–113).

One route inducts on word length. When i is not a right descent and w≠1, choose
a right descent j, so j≠i. Factor w=u v with u minimal in its coset modulo the
parabolic subgroup on {i,j}, and v in that subgroup, with additive lengths.
The factor v is nontrivial because j is a descent of w; hence ℓ(u)<ℓ(w), and u
has no right descent in {i,j}. Choose a reduced alternating expression for v.
Its last letter cannot be i. If m is finite its length is less than m, since
an alternating word of length m admits both endings by the braid relation.
The rank-two result and induction on u give nonnegative coefficients. The image
is nonzero since ρ(w) is invertible. Apply this positive case also to wsᵢ and use
ρ(sᵢ)αᵢ=−αᵢ to obtain both directions of the negative criterion.

Humphreys assumes a finite generating set in §5.1, p.106. The statement here
extends to arbitrary I: the induction is on a finite word, uses a two-generator
parabolic at each step, and every vector has finite support. All parabolic and
length inputs in the supplier contract already have arbitrary-index signatures.
No finite-rank hypothesis or nondegeneracy enters this argument.

**Checks.**

- For A₂ and k=0,1,2 the coefficient pairs are (1,0),(1,1),(0,1).
  At k=3 the image is (0,−1), excluding replacement of k<m by k≤m.
- For m=2, k=1 gives (1,0); for m=0, k=1,2 gives (1,2),(3,2).
  Replacing an infinite entry by 2 would change (1,2) to (1,0).
- In A₂ take w=sᵢsⱼ. Its lengths are ℓ(w)=2, ℓ(wsᵢ)=3 and ℓ(wsⱼ)=1;
  its images of αᵢ,αⱼ are αⱼ and −αᵢ−αⱼ. Both implications of each sign
  equivalence hold, and swapping left with right descents fails this test.
- For i=j only k=0 is allowed, with image αᵢ. In rank one, 1 sends α to α
  and s sends α to −α, with lengths 0 and 1.

*Needs:* §1.1 positivity; the public reflection formula and Gram entries;
`CoxeterSystem.exists_isMinimalCosetRep`,
`CoxeterSystem.isMinimalCosetRep_iff`,
`CoxeterSystem.length_mul_of_isMinimalCosetRep`,
`CoxeterSystem.wordProd_alternatingWord_eq_of_mem_parabolic_pair`,
`CoxeterSystem.wordProd_braidWord_eq`, and the native right-descent length API.

### 1.3 Faithfulness and transport

Prove `geometric_faithfulness`: ρ is injective for every Coxeter system. If w≠1,
a right descent supplies a simple root with negative image, so ρ(w) cannot be the
identity (Humphreys, §5.4, Corollary, p.113; arbitrary-index extension as in §1.2).

For a bijection e:I≃J preserving entries of matrices M and M′, use the real linear
coordinate equivalence T:(I →₀ ℝ)≃ₗ[ℝ](J →₀ ℝ) determined by Tαᵢ=α′ₑ₍ᵢ₎.
Identify M′ with `M.reindex e` and take f:M.Group≃*M′.Group to be
`(M.reindexGroupEquiv e).symm`, whose generator equation is
`CoxeterMatrix.reindexGroupEquiv_symm_apply_simple`. Prove B′(Tx,Ty)=B(x,y),
T(σᵢx)=σ′ₑ₍ᵢ₎(Tx), and Tρ(w)=ρ′(f(w))T for this specified f.
For J⊆I, let Mⱼ be the restricted Coxeter matrix. The extension-by-zero map
E:(J →₀ ℝ)→ₗ[ℝ](I →₀ ℝ), given by `Finsupp.lmapDomain ℝ ℝ Subtype.val`, satisfies
B(Eu,Ev)=Bⱼ(u,v) and Eσⱼ(u)=σᵢ(Eu) for i the ambient value of j. The
inclusion of generators is the native `CoxeterSystem.parabolicHom`, already
injective onto the standard parabolic subgroup with the same lengths; prove
Eρⱼ(w)=ρ(f(w))E for this f.
These are coordinate comparisons of the native reflection formula (Humphreys,
§5.3, pp.109–110; parabolic theory §5.5).

The transport API includes composition and identity of reindexings, composition
of nested extensions by zero, compatibility with ρ(wv)=ρ(w)ρ(v), and
ρ(w⁻¹)ρ(w)=1. For finite I, transport to `I → ℝ` through
`Finsupp.linearEquivFunOnFinite`; the transported representation is exactly
Tρ(w)T⁻¹, with the same simple-generator formula.

**Checks.**

- For empty I, W is trivial and the representation on the zero space is injective.
  For rank one, ρ(s)=[−1] differs from ρ(1)=[1].
- With infinite dihedral Gram [[1,−1],[−1,1]], determinant is 0 but
  ρ((sᵢsⱼ)ⁿ)αᵢ=(2n+1,2n), giving (1,0),(3,2),(5,4) for n=0,1,2.
- Reindexing the A₂ simple basis by its transposition sends αᵢ to αⱼ and
  sends σᵢ to σⱼ, not to σᵢ; f sends generator 0 to generator 1.
  For w=sᵢsⱼ, both Tρ(w)αᵢ and ρ′(f(w))Tαᵢ equal α′ᵢ.
  The inverse reindexing followed by this reindexing fixes both generators.
- For three orthogonal nodes and e=(0 1 2), f sends generator 0 to generator 1;
  the native forward equivalence instead sends reindexed generator 0 to original
  generator 2. This distinguishes the two directions even when a transposition cannot.
- For the parabolic J={i} in A₂, Eσᵢ(1)=−αᵢ=σᵢE(1).
  For J empty E is the unique map from zero; for J=I it is the identity.

*Needs:* §1.2 for faithfulness; `CoxeterMatrix.reindexGroupEquiv` and
`CoxeterMatrix.reindexGroupEquiv_symm_apply_simple` for the abstract reindexing;
native Coxeter lifting and finite-support linear maps for the geometric
comparisons; `CoxeterSystem.parabolicHom` and `CoxeterSystem.range_parabolicHom`
for the parabolic comparison.

### 1.4 Integral comparison

Prove `integral_geometric_realization`: given any integer matrix A on I with
(Aᵢⱼ:ℝ)=2B(αᵢ,αⱼ) for every i,j, construct a faithful representation on
L=(I →₀ ℤ) whose i-th generator sends x to x−(Σⱼ xⱼAᵢⱼ)eᵢ.
Let c:L→(I →₀ ℝ) be coefficientwise integer inclusion. Its equation is
c(ρℤ(w)x)=ρ(w)c(x), for every w and x, and c is injective. This makes the
normalization and the integral action part of the theorem, rather than allowing
an arbitrary integral representation. No assumption on the determinant is made.
The real action preserves c(L) by the generator formula; it and its inverse
restrict to L. Equality on the real basis then transfers faithfulness
(Humphreys, §5.3 reflection formula, pp.109–110; §5.4 Corollary, p.113).

- The integral action preserves the form Σᵢⱼ xᵢAᵢⱼyⱼ and the integer lattice.
- Its identity, product and inverse laws are the representation laws, and its image
  in the integral linear automorphisms is precisely the subgroup generated by
  the specified integral simple reflections.
- A specified ℤ-basis e:I→L′ of another free module transports the action by the
  coordinate equivalence, sending eᵢ to that very basis vector. After extending
  scalars to ℝ, the induced basis equivalence intertwines this action with ρ.
- With finite I the form is the usual integral Gram matrix. Reduction modulo an
  integer has its induced action, but no faithfulness assertion is made for it.

**Checks.**

- A=[2] gives x↦−x and c(−1)=−1=ρ(s)c(1). A=[1] fails the Gram hypothesis;
  its purported reflection would send 1 to 0.
- A=[[2,−1],[−1,2]] gives sᵢeⱼ=eᵢ+eⱼ, matching the A₂ real action.
- A=[[2,−2],[−2,2]] is degenerate and gives (sᵢsⱼ)eᵢ=(3,2).
  Faithfulness therefore must not require a nonzero determinant.
- In rank one, reduction modulo 2 sends [−1] to [1]; the integral and real
  theorem must not be reused as a mod-two injectivity theorem.

*Needs:* §1.3 faithfulness; injectivity of ℤ→ℝ; native free-module bases and
restriction of linear maps preserving a submodule. No Enriques-specific input.

### Examples

The finite noncrystallographic dihedral system with m=5 has
2cos(π/5)=(1+√5)/2 and satisfies §§1.1–1.3. The integral hypothesis of §1.4 fails
in this standard basis because its off-diagonal Gram entry is irrational.
The infinite dihedral system satisfies all four sections, despite its degenerate
form (Humphreys, §§5.3–5.4).

### Dependencies

Mathlib's abstract Coxeter length API and finite-support linear algebra, and
Tau Ceti's geometric, exchange, parabolic and dihedral modules. There is no
finite-root-system, classification or surface-geometric input.

## Layer 2: the marked Weyl presentation

### 2.1 Completeness of the relations

For a finite reduced crystallographic root pairing over a characteristic-zero
domain and a base b, completeness of the Coxeter relations is supplied:
`TauCeti.weylCoxeterHom_injective` and `TauCeti.weylCoxeterHom_surjective` make
the native homomorphism from the presented group of `TauCeti.coxeterMatrixOfBase P b`
bijective, and `TauCeti.weylCoxeterSystem` is the Coxeter system on the Weyl group
whose generator i is the reflection in the actual root bᵢ
(`TauCeti.weylCoxeterSystem_simple`). No spanning hypothesis is used (Bourbaki,
Ch. VI §1, no. 5, Theorem 2; Humphreys, §1.9, Theorem, pp.16–18).

Build the consumer interface of this presentation. Package the bijection as a
multiplicative equivalence whose forward and inverse maps satisfy the generator
equations on the actual simple reflections and agree on word products. Prove
`presentation_length_eq_inversions`: the length of any element of the presented
group is the cardinality of the native inversion set of its image. The
equivalence carries the presented Coxeter system to `TauCeti.weylCoxeterSystem`
with the same generators, so `TauCeti.length_weylCoxeterSystem_eq` transfers
(Humphreys, §1.7, Corollary, p.14). Prove that the equivalence preserves and
reflects reduced words and right descents; the right descent at i of w is
detected by whether w sends the positive simple root i to a negative root. Any
Coxeter system on the Weyl group with the same simple reflections has the same
length function. These statements concern the specified generators throughout;
an unspecified Coxeter structure is insufficient.

**Checks.**

- In rank zero both groups are trivial; the empty word has length 0 and inversion
  count 0. In A₁ the simple reflection has length 1 and inversion count 1.
- In A₂ the images of the words [], [i], [i,j], [i,j,i] have inversion counts
  0,1,2,3. The word [i,i] has length 2 as a list but spells length 0 and has
  no inversions; list length must not replace minimal length.
- In A₂ the intended generator i sends αᵢ to −αᵢ. Swapping the two generators
  sends αᵢ to αᵢ+αⱼ instead. The native homomorphism's generator equation
  excludes the swap even though it preserves the matrix and abstract length.

*Needs:* the native marked presentation, `TauCeti.weylCoxeterSystem`,
`TauCeti.length_weylCoxeterSystem_eq` and `TauCeti.isReduced_weylCoxeterSystem_iff`;
`TauCeti.ncard_inversions_mul_ofIdx` for descents.

### 2.2 Length and reduced expressions

For the native marked system, deduce that the longest element has length equal
to the number of positive roots, from `TauCeti.ncard_inversions_longestElement`.
Identify the coefficient of qᵏ in the native Poincaré polynomial of
`TauCeti.weylCoxeterSystem` with the number of Weyl elements having k
inversions, and express the native Bruhat subword criterion in words of actual
simple reflections (Bourbaki, Chapter VI §1, no. 6; Björner–Brenti, §2.2 and
Theorem 3.3.1). *Needs:* §2.1; native longest element, Bruhat order and
Poincaré polynomial.

### Examples

- In A₂, 1, s₁, s₁s₂, s₁s₂s₁ have lengths and inversion counts 0,1,2,3;
  s₁s₁ has both values 0. The polynomial is 1+2q+2q²+q³.
- In rank zero both groups have one element, the marking is empty, and the
  length polynomial is 1. In A₁ it is 1+q.
- In G₂ the six positive roots give longest length 6 and the Weyl group has
  order 12. In A₂ the dominant wall point 0 is fixed by the whole Weyl group but
  its orbit meets the closed dominant chamber in just {0}; uniqueness of a point
  in an orbit is distinct from freeness of its stabilizer.

### Dependencies

The native finite root combinatorics, presentation, longest element, Bruhat order
and Poincaré polynomial. Geometric faithfulness, chambers and classification are
not inputs. Abstract exchange and Matsumoto apply to the actual Weyl group through
the marked Coxeter structure; they are not new targets.

## Layer 3: classification and concrete Weyl groups

### 3.1 Classification independent of a base

Base independence is supplied. For a nonempty irreducible finite reduced
crystallographic root system over a characteristic-zero domain,
`TauCeti.existsUnique_dynkinType` gives exactly one valid type of a given base,
`RootPairing.Base.existsUnique_map_eq` carries any base to any other by a unique
Weyl element, and `TauCeti.HasCartanType.of_base` makes that type the type of
every base. `TauCeti.HasCartanType.map` transports a type along an unbased
equivalence, so the unique valid type is an isomorphism invariant (Humphreys,
*Reflection Groups and Coxeter Groups*, §1.4, Theorem and proof, p.10).

Prove `rational_classification`: a nonempty irreducible finite reduced
crystallographic root system over ℚ is isomorphic to the native rational model
of exactly one valid type. The existential validity proof selects a genuine
native model; its root-index set has the number of roots, and both coordinate
spaces have the rank. Existence uses native base existence over ℚ, the type of
that base, `TauCeti.DynkinType.hasCartanType_rationalRootSystem` and
`TauCeti.nonempty_equiv_of_hasCartanType`. Uniqueness transports the type of a
model base along the composite equivalence and applies uniqueness of the valid
type. The classical real classification is summarized in Humphreys,
*Reflection Groups and Coxeter Groups*, §2.9, p.39.

**Checks.**

- A₁ has two bases {α} and {−α}; each has Cartan matrix [2], and its nontrivial
  reflection exchanges them. There is one valid type A 1.
- A₂ has six bases and six roots, but rank 2. Each base has Cartan matrix
  [[2,−1],[−1,2]], determinant 3. The positive root string has top coefficient 1,
  so its off-diagonal Cartan entry is −1.
- The empty matrix is of finite type, but there is no valid rank-zero Dynkin
  type. Nonempty ι in the classification excludes this case.
- Swapping the B₂ indices changes [[2,−2],[−1,2]] to [[2,−1],[−2,2]]:
  Cartan transport is simultaneous reindexing, not literal equality of entries.
  These B₂ and C₂ matrices represent the same valid type B 2. In rank 3 the
  oriented B₃ and C₃ matrices cannot be simultaneously
  relabelled into one another; forgetting edge orientation would conflate them.
- The finite-type condition accepts [2] and the empty matrix. It rejects
  [[2,−2],[−2,2]], since the quadratic form has value 0 at (1,1) for every
  positive symmetrizer; semidefinite must not replace definite.

*Needs:* native base existence over ℚ; `TauCeti.existsUnique_dynkinType`,
`TauCeti.HasCartanType.of_base`, `TauCeti.HasCartanType.map`,
`TauCeti.nonempty_equiv_of_hasCartanType`, and the native rational models and
their Cartan types.

### 3.2 Type A as a permutation group

For a finite reduced crystallographic root pairing P over a characteristic-zero
domain and a base of Cartan type A n, for every n, prove
`weylGroup_equiv_perm_of_typeA`: the Weyl group is multiplicatively equivalent
to `Equiv.Perm (Fin (n + 1))`. This extends the native
`RootPairing.weylGroup_equiv_perm_of_typeA`, which assumes coefficients ℚ,
spanning and n≥1; no spanning hypothesis is used here. Validity of Aₙ, meaning
n≥1, is a convention of the native enumeration and not a hypothesis: for n=0
the base is empty, every root would be 0, so there are no roots and both groups
are trivial. Refine the existence statement by a marked equivalence for any
specified Cartan relabelling, sending the simple reflections to the adjacent
transpositions in that order. The interface includes the action on the roots
eᵢ−eⱼ, the order (n+1)!, positive-root count n(n+1)/2, and agreement of length
with permutation inversions (Humphreys, *Reflection Groups and Coxeter Groups*,
§2.10, type A, p.41; §1.7, Corollary, p.14; Milne C.16 and C.25, pp. 611–613).

One route: P and the native rational model of type A n both carry the native
marked presentation of §2.1, on Coxeter matrices that agree under the Cartan
relabelling, because the Coxeter matrix of a base depends only on its Cartan
products. Compose the two presentations with `CoxeterMatrix.reindexGroupEquiv`
and with `TauCeti.DynkinType.typeARationalWeylGroupEquiv`, whose simple-reflection
equations give the marking. Completeness of the adjacent-transposition relations
is thereby inherited, not assumed from equality of group orders.

**Checks.**

- A₁ gives S₂ of order 2 and one positive root; A₂ gives S₃ of order 6 and
  three positive roots. The two A₂ simple permutations do not commute.
- In ℚ² with dot pairing, roots ±(1,0) and coroots ±(2,0) give type A₁
  with reflection diag(−1,1). The Weyl group has order 2 although the root span
  is only the first axis; the group comparison requires no spanning hypothesis.
- Over R=ℤ[1/2], take V=U=R with dot pairing, roots ±1 and coroots ±2.
  The positive singleton has Cartan matrix [2] and reflection is x↦−x, giving
  W≅S₂. The proper nonzero submodule 3R is reflection-stable, whereas 1∉3R since
  3a=2ᵏ has no integer solution; type A does not require module irreducibility.
- A₃ gives S₄ of order 24, twelve roots and six positive roots. Using the rank
  as the number of permuted letters would instead give order 6.
- Reversing the A₂ node labelling interchanges (0 1) and (1 2); the marked
  equivalence must change with the relabelling. The longest permutation reverses
  three labels and has inversion count 3.
- The empty system has Cartan type A 0, trivial Weyl group and S₁ on the other
  side; it is not of type A 1, whose base has one element.

*Needs:* §2.1's marked presentation and length bridge; the native type A
rational Weyl equivalence and its simple-reflection equations; Cartan
relabelling; Mathlib permutation multiplication, adjacent transpositions and
inversion counts.

### Examples

The supplied numbered A₁ integral datum has roots ±2, coroots ±1 and dot pairing.
Its root span is 2ℤ while its coroot span is ℤ; after rational extension both
span ℚ. This distinguishes a simply connected root datum from an integral root
system with both spans equal to the full lattices.

The G₂ Weyl group is supplied: for a finite `RootPairing.IsG2` system over a
characteristic-zero domain, `TauCeti.hasCartanType_G2_of_isG2` gives the base type
G₂ and `TauCeti.nonempty_dihedralGroup_mulEquiv_weylGroup_of_hasCartanType_G2`
an equivalence with `DihedralGroup 6`. The twelve roots split into six short and
six long, with squared lengths in ratio 1:3. In the short-first orientation the
positive coefficient vectors are (1,0),(0,1),(1,1),(2,1),(3,1),(3,2), with (3,2)
the highest root, and the longest element has six inversions, hence length 6 by
§2.1; an A₂ model would give three positive roots and length 3. The transposed
matrix `!![2, -3; -1, 2]` has the same Coxeter order 6 and the same group but
makes the first root long, so the orientation is a convention of the
coefficients, not of the group. The B₂ long simple node is 0, the G₂ long node
is 1, and F₄ has long nodes 0,1; these native conventions also fix the CFSG
indices (Bourbaki, Ch. VI §4, types A, B, F, G; Milne Appendix C(g), p. 622).

### Dependencies

Native classification, rigidity, base transitivity, positive-root combinatorics
and numbered models. The type A group comparison uses Layer 2. Integral
dominance, folding, Lie representations, invariant degrees and reductive groups
are not prerequisites.

## Layer 4: coefficient reflections and the greatest root

### 4.1 Integral coordinates and reflection orbits

Use `RootPairing.Base.toWeightBasisInt` on the root lattice. For Cᵢⱼ=⟨αᵢ,αⱼ∨⟩,
construct the integral linear reflection on simple-root coefficient columns:
its k-th entry is cₖ−δₖᵢΣⱼCⱼᵢcⱼ. Evaluation into the root lattice intertwines
this map with the actual reflection. Thus with A=2I−Cᵀ the changed coordinate
is ΣⱼAᵢⱼcⱼ−cᵢ (SGA 3 XXI, §1.1.1–§1.1.2, formulas (1)–(3), pp. 63–64;
sga3iii lines 19–42).
*Needs:* native integral basis; root reflection formula; Cᵢᵢ=2.

- Prove involutivity, ℤ-linearity and evaluation compatibility, with source
  and target both the integral coefficient module indexed by b.support.
- Prove compatibility with base reindexing and the numbered native datum.
- Identify the union of the Weyl orbits of all simple coefficient vectors
  with the coefficient set of all roots, including negative roots. Identify
  its nonnegative part with the positive roots (Milne C.21–C.22, p. 612,
  milne17 lines 25088, 25096). This is equality of sets, not an enumeration procedure.

**Checks.**

- In B₂, s₂(1,0)=(1,2) and s₂(1,2)=(1,0). Evaluation gives
  e₁−e₂ ↔ e₁+e₂, agreeing on both sides of the intertwiner.
- In A₁, 1 reflects to −1 and back; the orbit set is {−1,1} and its
  positive part is {1}. Zero is not a root coefficient.
- In B₂, starting with both simples gives all eight roots; starting with
  only the long root gives four and misses the short-root orbit.

### 4.2 Greatest positive roots

For an irreducible finite reduced crystallographic system over a
characteristic-zero domain the greatest root is supplied:
`RootPairing.Base.highestRoot` θ satisfies θ−α ∈ `TauCeti.posRootCone` for every
root α and is the only root with this property
(`RootPairing.Base.root_highestRoot_sub_mem_posRootCone`,
`RootPairing.Base.forall_root_sub_mem_posRootCone_iff`). Read it in the integral
coordinates of §4.1: the simple coefficients of θ dominate those of every
positive root, and every strictly positive integer weighting of the coefficients
has θ as its unique maximum. This is a greatest element, not merely a maximal one
(Milne C.24, p. 612, milne17 line 25111). Prove the root-string characterization
`eq_highestRoot_of_forall_root_add_notMem`: a positive root to which no simple
root can be added within the root set is θ. The converse is
`RootPairing.Base.root_highestRoot_add_root_notMem`. One route takes, among the
positive roots strictly above the given root in the positive cone, one of least
height, and lowers it by a simple root on which it pairs positively.

In the simply-laced case, prove that every other positive root admits a simple
reflection increasing height by exactly one, and that every maximal sequence
of such steps ends at θ. Positions are roots; finiteness bounds strictly
increasing sequences. In other types retain the root-string membership test
for addition of a simple root; reflection may increase a coefficient by 2 or 3
(Bourbaki, Chapter VI §1, nos. 3 and 8).
*Needs:* §4.1; the native highest root and positive cone; native root strings
and the positive invariant form.

**Checks.**

- A₂ has positive coefficient vectors (1,0),(0,1),(1,1). The last is greatest;
  weights (2,1) give 2,1,3, and each simple root rises to it by one step.
- A₁ has greatest vector (1). A₁² has incomparable (1,0),(0,1) and no
  greatest root; the zero-dimensional system has no positive root at all.
- In B₂, positive coefficients are (1,0),(0,1),(1,1),(1,2).
  The root e₁=(1,1) has no increasing simple reflection, but e₁+e₂=(1,2)
  is a root and is greatest. The simply-laced hypothesis cannot be dropped.

### 4.3 Numbered family comparisons

Compare coefficients with the native Bourbaki-numbered data, retaining the
actual root-index correspondence induced by evaluation; no unmarked equivalence
suffices. In the Eᵣ chain order 1—2—⋯—(r−1), with extra node r attached to 3,
transport to Bourbaki labels by (1,2,…,r−1,r)↦(1,3,…,r,2). Prove the Cartan,
root and coroot equations for this reindexing. The coordinates below are
simple-root coefficients, not the fundamental-weight coordinates of the
integral datum (Bourbaki, Chapter VI §4, Planches I–IX).
*Needs:* §4.1–§4.2; native Cartan family, simple indices and root coordinates.

**Checks.**

- E₆,E₇,E₈ have respectively 36,63,120 positive roots, with greatest
  coefficients (1,2,3,2,1,2), (2,3,4,3,2,1,2), (2,4,6,5,4,3,2,3)
  in the stated chain order. Their heights are 11,17,29.
- A₇ has 28 positive roots and greatest vector (1,1,1,1,1,1,1), height 7.
- Cₙ, n≥3, has n² positive roots and greatest vector (2,…,2,1).
  Its update matrix has Aₙ₋₁,ₙ=2 and Aₙ,ₙ₋₁=1. C₄ has 16 positives
  and greatest (2,2,2,1), C₉ has 81 and greatest (2,2,2,2,2,2,2,2,1),
  and C₁₃ has 169. The C₄ positive coefficient set is
  {(1,0,0,0),(0,1,0,0),(0,0,1,0),(0,0,0,1),(1,1,0,0),(0,1,1,0),
  (0,0,1,1),(1,1,1,0),(0,1,1,1),(0,0,2,1),(1,1,1,1),(0,1,2,1),
  (1,1,2,1),(0,2,2,1),(1,2,2,1),(2,2,2,1)}.

### Examples

A₂ distinguishes greatest from maximal, B₂ distinguishes reflection steps from
unit root-string steps, and C₄ distinguishes the two Cartan transposes.

### Dependencies

Native integral coordinates, root strings, lowering, the highest root and the
numbered families; this layer does not require a computational root enumeration.

## Layer 5: root automorphisms and the based complement

### 5.1 The actual base stabilizer

Define `basedAut` as the inverse image under the native index homomorphism of
the setwise stabilizer of b.support. For a finite reduced crystallographic
pairing over a characteristic-zero domain, prove `weyl_based_complement`: W
complements that subgroup in the full root-pairing automorphism group (SGA 3 XXI,
Prop. 6.7.2, p. 99, sga3iii line 1374; Milne C.53, p. 624). One route applies
`RootPairing.Base.existsUnique_map_eq` to b and its image under an automorphism g:
the unique Weyl element w with b.map w = b.map g gives w⁻¹g in the based
subgroup, and uniqueness at the base b itself, with
`RootPairing.Base.mem_support_map_iff`, makes the intersection trivial. Neither
spanning nor real coefficients is assumed, so R=ℤ covers full integral data (§5.3).
*Needs:* native set stabilizer and comap; simple transitivity on bases;
supports of transported bases.

- Membership is exactly g.indexEquiv '' b.support = b.support; identity,
  composition and inverse preserve the support.
- Prove that a root automorphism carries positive systems to positive systems
  and, over ordered coefficients, open chambers to open chambers, using the
  actual coroot inequalities; preservation of the base is equivalent to
  preservation of the open chamber (SGA 3 XXI, Prop. 6.1.3, p. 90, sga3iii line 1051).
- Prove normality by conjugating each generating reflection to the reflection
  at its image root (SGA 3 XXI, Lemma 6.7.1, p. 98, sga3iii line 1368).
- Obtain the conjugation semidirect equivalence from the native complement API.
  Its forward map is (w,δ) ↦ wδ; its inverse gives the unique two factors.
  Prove the root, coroot and change-of-base transport equations. The product
  is (w,δ)(v,η)=(wδ(v),δη); the intersection of the two factors is trivial.

**Checks.**

- In A₁ the base stabilizer is {1}; reflection takes the positive simple index
  to the negative one and is excluded. Aut has order 2=2·1.
- In A₂ the base reversal has order 2 and is outside W; Aut has order 12=6·2.
  Replacing the base stabilizer by all automorphisms would give a nontrivial intersection.
- For the empty spanning real system W and Aut are trivial. For a root-free
  rank-one integral datum the base stabilizer instead has order 2, as in §5.3.

### 5.2 Oriented diagrams and actual isogeny lattices

For a finite reduced crystallographic spanning system over a
characteristic-zero domain, prove `existsUnique_basedAut_of_cartanMatrix`:
for each permutation σ of b.support preserving every Cartan entry, there is
exactly one g in `basedAut` whose index action on every simple i is σ(i).
Together with preservation of the pairings by native root-pairing equivalences,
this identifies the based subgroup with the oriented diagram automorphisms.
Existence extends σ by `RootPairing.Base.equivOfCartanMatrixEq`; uniqueness is
`RootPairing.Base.eq_one_of_forall_indexEquiv_eq`, which needs spanning
(SGA 3 XXI, Prop. 7.3.2, pp. 104–105, Cor. 7.3.4 and Cor. 7.4.5, p. 105, and
Rem. 7.4.6, p. 106; sga3iii lines 1608, 1627, 1654, 1660). When the Cartan matrix
has no nontrivial symmetry, `RootPairing.Base.weylGroup_eq_top_of_matrixSymmetryGroup_eq_bot`
is the resulting rigid case.
For the full integral version this unrestricted diagram identification applies
to semisimple simply connected or adjoint data. For intermediate isogeny forms,
restrict to diagram automorphisms preserving the **actual dual lattices**.
*Needs:* §5.1; `RootPairing.Base.equivOfCartanMatrixEq`;
`RootPairing.Base.eq_one_of_forall_indexEquiv_eq`; native simple-root bases and
pairing preservation.

Define the lattice-preserving subgroup by the two equations g(X₀)=X₀ and
(g.coweightEquiv)⁻¹(Y₀)=Y₀ for specified dual integral lattices in the rational
pairing. Here the lattices are finite free ℤ-submodules spanning the rational
spaces, the pairing restricts to perfect ℤ-duality, and they contain all roots
and coroots respectively. This is the intersection of the inverse images of their
native setwise stabilizers, using the forward weight and cocharacter actions.

- Prove identity, product and inverse closure and that restriction yields an
  integral root-datum automorphism when the lattices contain the respective roots.
- Construct scalar extension from integral automorphisms and prove extension
  and restriction inverse, with root/coroot and pairing equations.
- Identify the based lattice stabilizer under these inverse maps, and restrict
  the semidirect decomposition to it. For reducible systems include permutations
  of isomorphic components that preserve the lattice gluing.

**Checks.**

- A₂ has its reversal, D₄ has S₃ triality, and E₆ has its involution; A₁ has no
  nontrivial diagram permutation. In D₄ the three transpositions and two
  3-cycles give six based automorphisms.
- B₂'s node swap changes entries (−2,−1) to (−1,−2) and is excluded;
  an unoriented graph stabilizer would incorrectly include it.
- D₄ has discriminant group (ℤ/2)². Fixing one nonzero discriminant class
  leaves a subgroup of order 2 in S₃, not all six triality permutations.
- Under σ=(123), forward weight and cocharacter maps both send e₁ to e₂;
  using the contravariant cocharacter map itself sends e₁ to e₃ and fails
  the pairing test ⟨e₂,e₂⟩=1 versus ⟨e₂,e₃⟩=0.

### 5.3 Full integral data and central directions

A finite reduced crystallographic `RootDatum` is a root pairing over ℤ, so §5.1
applies to it with arbitrary character and cocharacter lattices: the Weyl group
complements the based subgroup of the full datum automorphism group. Retain the
central/derived lattice gluing; an integral direct-sum decomposition is not
assumed (SGA 3 XXI, Prop. 6.7.2, p. 99, sga3iii line 1374; Milne C.43 and C.51,
pp. 618, 620). For finite free lattices, compare with the rational scalar
extension, with maps from both lattices preserving the perfect pairing, roots,
coroots, base and reflections.
*Needs:* §5.1 at R=ℤ; §5.2's lattice restriction; finite-free scalar extension
and duality in Mathlib.

- Scalar extension and restriction preserve both pairings and the simple
  indices, and their composites are identity on the specified integral maps.
- The cylinder chamber is the inverse image of the chamber in the root span
  under rational projection along the common coroot kernel. It is preserved
  by exactly the based full-datum automorphisms.
- The based subgroup contains the compatible central automorphisms and may
  be infinite; the complement theorem is not a finiteness theorem about Aut.

**Checks.**

- A root-free rank-r datum has W=1 and Aut=GLᵣ(ℤ); r=0 gives one element,
  r=1 gives {±1}, and r=2 admits the infinite-order shear `!![1, 1; 0, 1]`.
- For GL₂, root (1,−1) and central direction (1,1) span an index-2 subgroup
  of ℤ²: their determinant is 2. A rational splitting does not split the lattice.
- For simply connected A₁, the roots span 2ℤ in the character lattice ℤ;
  imposing integral spanning would exclude this basic case.

### Examples

The A₂ factorization gives 12 elements from W of order 6 and the based involution.
The D₄ isogeny example distinguishes the six diagram symmetries from the two
preserving one nontrivial lattice class. The root-free datum tests every central branch.

### Dependencies

Native simple transitivity on bases, classification, diagram actions and Mathlib
subgroup complements; the lattice comparisons additionally need §5.3's
finite-free scalar extension.

## Layer 6: invariant metrics and root lengths

### 6.1 Irreducible components

For a finite reduced crystallographic spanning real pairing and base, take the
connected components of the graph on b.support whose distinct vertices are
adjacent when Cᵢⱼ≠0. Define each component space as the real span of its simple
roots and give it the restricted root/coroot pairing. Identify this graph
decomposition with the irreducible decomposition (Milne C.23, p. 612, and
C.55, p. 625; milne17 lines 25102, 25585).
*Needs:* native Cartan entries and simple-root basis;
Mathlib graph components and submodules; `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix`.

- Prove that the component spaces form an internal direct sum and that each
  root belongs to exactly one component; the restricted pairings are irreducible.
- Prove that this partition of the roots is independent of the base and is
  carried to the corresponding partition by any root-pairing equivalence.
- Prove different component spaces orthogonal under every positive-definite
  invariant form; construct restrictions and reconstruction by orthogonal sum.

**Checks.**

- A₂ has one component of dimension 2, and (1,1) is in that component.
- A₁² has two one-dimensional components; (1,1) is not a root and does not
  join them. A graph that treats zero Cartan entries as edges gives the wrong partition.
- The empty root system has no components and direct-sum dimension 0.

### 6.2 Positive invariant forms and squared lengths

Prove `invariantMetric_unique_scale` for a finite irreducible spanning real
root pairing: any positive-definite invariant forms B,C satisfy C=cB for a
unique real c>0. Reducedness and crystallographicity are not needed for this
statement. Milne Appendix C(g), p. 621 (milne17 line 25421), states the
reduced crystallographic case. For the generality here, a route starts with a
nonzero root α and sets c=C(α,α)/B(α,α)>0; positivity makes the denominator
nonzero. Apply `RootPairing.InvariantForm.two_mul_apply_root` to both forms:
the symmetric invariant bilinear form D=C−cB satisfies D(x,α)=0 for every x.
Its radical contains α and is reflection-stable, so native irreducibility makes
that radical the whole module. Hence C=cB; evaluating at (α,α) proves uniqueness.
Spanning and nontriviality ensure that a root exists. This derivation uses neither
reducedness nor crystallographicity.
*Needs:* native invariant forms and their coroot identity; native irreducibility;
positive definiteness; spanning; bilinearity and invariance of the radical of D.

In the reduced crystallographic case the two-length theorem is supplied:
`RootPairing.InvariantForm.exists_apply_eq_or` gives two roots whose squared
lengths cover every root, `RootPairing.InvariantForm.apply_eq_or` makes any two
squared lengths equal or in ratio 2 or 3, and positive definiteness orders them,
so there are s>0 and r∈{1,2,3} with each squared root length equal to s or rs.
What this roadmap proves is the identification of r with the native Dynkin type
of each component: r=1 for A,D,E, r=2 for B,C,F₄, and r=3 for G₂, with both
values occurring in the nonsimply-laced types, by comparing the restricted form
on a component with the native length table `TauCeti.DynkinType.rootLength`
through the Cartan comparison (Milne C(g), table (180), pp. 621–622,
milne17 line 25438, and C.56).
*Needs:* §6.1; unique scaling; the supplied two-length lemmas; native
classification and length tables; simple-root lowering and reflection invariance.

Relative to the canonical positive form on each component, construct the
bijection between invariant positive-definite forms and one positive real
scale per component. Restriction and orthogonal reconstruction must be inverse;
prove compatibility with component reindexing and root-pairing equivalences.
Ordinary length ratios are √r, so the squared-length convention is essential.

**Checks.**

- In A₁, B(x,y)=xy and C(x,y)=3xy give the unique scale c=3; c=0
  fails positivity and c=2 fails equality at (1,1).
- In the nonreduced real rank-one pairing with roots ±1, ±2 and respective
  coroots ±2, ±1, B(x,y)=xy and C(x,y)=3xy still give c=3; at α=2,
  the quotient is 12/4=3 and D(x,2)=6x−6x=0. Reducedness is unnecessary.
- In B₂, squared lengths of e₁−e₂ and e₂ are 2 and 1. In G₂,
  squared lengths 1 and 3 give ordinary ratio √3, not 3.
- A₁³ with roots ±eᵢ, coroots ±2eᵢ and B=diag(1,2,5) has squared length
  set {1,2,5}. Coordinate sign changes preserve B; the three independent
  scales disprove an irreducibility-free two-length theorem.
- On the zero space the zero form is positive definite vacuously and every
  positive scalar leaves it unchanged. Native irreducibility excludes this
  from unique scaling; the componentwise parameterization is instead a singleton.

### Examples

The pair B₂/C₂ transposes the Cartan entries while interchanging long and short
nodes; the unordered squared-length ratio remains 2. Three A₁ components permit
any three positive scales. These test both the uniqueness and independence claims.

### Dependencies

Mathlib invariant forms, two-length lemmas, bases and graph components; native
classification and root-length tables. This layer does not consume the Coxeter presentation.

## Downstream consumers

Some roadmaps cite this one by an older six-layer numbering. Each old layer now
lives as follows.

| Old label | Present location |
|---|---|
| Layer 1: root combinatorics | native `TauCeti.posRoots`, `TauCeti.exists_mem_support_height_reflectionPerm_lt`, `TauCeti.inversions`, `TauCeti.ncard_inversions_mul_ofIdx` |
| Layer 2: the Weyl group as a Coxeter system | native `TauCeti.weylCoxeterSystem` and `TauCeti.length_weylCoxeterSystem_eq`; interface in §§2.1–2.2 |
| Layer 3: abstract Coxeter combinatorics | native `CoxeterSystem.strongExchange`, `TauCeti.matsumoto`, `CoxeterSystem.BruhatLE`, `TauCeti.poincarePolynomial` |
| Layer 4: chambers and the longest element | native `RootPairing.dominantChamber`, `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`, `RootPairing.Base.existsUnique_map_eq`, `TauCeti.longestElement` |
| Layer 5: Dynkin diagrams and classification | native `TauCeti.existsUnique_dynkinType` and `TauCeti.HasCartanType.of_base`; rational form in §3.1 |
| Layer 6: Bourbaki numbering and integral data | native `TauCeti.DynkinType.simplyConnectedRootDatum`, `TauCeti.DynkinType.simplyConnectedBase`, `TauCeti.DynkinType.simpleIndex`; coefficients in §4.3 |
| 4A: Weyl/based factorization | §5.1, with §5.2 for diagrams |

- LieHighestWeight Layers 2, 6 and 10 consume the root and chamber vocabulary,
  the based classification and the Weyl group: the native positive roots,
  chambers, classification and numbered data, with the marked presentation of §2.1.
- ClassicalGroups Layer 3 consumes the classical Weyl groups: type A from §3.2,
  the rank-two cases from the native dihedral theorems.
- ReflectionInvariantTheory §4 consumes the marked Weyl/Coxeter dictionary of §2.1.
- CFSGStatement Layer 1 consumes the native numbered integral data
  `TauCeti.DynkinType`, `TauCeti.DynkinType.Valid`,
  `TauCeti.DynkinType.simplyConnectedRootDatum`,
  `TauCeti.DynkinType.simplyConnectedBase`, `TauCeti.DynkinType.simpleIndex` and
  `TauCeti.DynkinType.IsLongSimpleRoot`.
- LieGroups Layer 6 consumes the finite Weyl action for maximal tori; its
  Layer 8 consumes the lengths of §§2.1–2.2 for Bruhat cell dimensions.
- ReductiveGroups consumes the marked presentation of §2.1, the native
  classification `TauCeti.existsUnique_dynkinType` and `TauCeti.HasCartanType`
  with the numbered simply connected data, and the based complement of §5.1 with
  the diagram identification of §5.2 for its §9A.1a-L cover lifts.
- ReductiveGroupsPartII, TopologicalKTheory and SymplecticGeometry's
  ConvexityToric consume abstract Coxeter combinatorics and chambers: the native
  `CoxeterSystem.strongExchange`, `TauCeti.matsumoto`, `CoxeterSystem.BruhatLE`,
  `TauCeti.poincarePolynomial`, `RootPairing.dominantChamber`,
  `TauCeti.openWeylChamber` and `TauCeti.longestElement`.
- RootSystemsPartII Layers 1–4 consume the native positive roots, chambers,
  classification and numbered data, the marked presentation of §2.1, the based
  automorphisms of §§5.1–5.2 for its folds.
- EnriquesSurfaces §5.2 is the integral lattice application of the general
  geometric results of Layer 1; its geometric and congruence statements supply
  nothing in the reverse direction.

These are consumers, not prerequisites for the root-system proofs.

## References

- J. E. Humphreys, *Reflection Groups and Coxeter Groups*, Cambridge, first
  published 1990; corrected paperback edition 1992, reprinted 1994.
  §1.4 Theorem and proof p.10; §1.7 Corollary p.14; §1.9 Theorem pp.16–18;
  §2.9 p.39; §2.10, type A, p.41; §5.1 p.106; §5.3 pp.109–110;
  §5.4 Theorem pp.111–113 and
  Corollary p.113; §5.5. The institutional course copy has the printed numbering:
  [University of Washington](https://sites.math.washington.edu/~billey/classes/reflection.groups/references/Humphreys.ReflectionGroupsAndCoxeterGroups.pdf).
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4–6*, Springer (2002),
  Ch. IV §1, Ch. VI §1, nos. 3, 5, 6, 8, and §4, Planches I–IX,
  DOI 10.1007/978-3-540-34491-9.
- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*,
  Springer (1972), §§9–11, DOI 10.1007/978-1-4612-6398-2.
- A. Björner and F. Brenti, *Combinatorics of Coxeter Groups*, Springer GTM 231
  (2005), §2.2, §3.3 and Theorem 3.3.1, DOI 10.1007/3-540-27596-7.
- V. G. Kac, *Infinite-Dimensional Lie Algebras*, 3rd edition, Cambridge (1990),
  Ch. 4, DOI 10.1017/CBO9780511626234, for the finite/affine/indefinite terminology.
- J. S. Milne, *Algebraic Groups*, 2017, Appendix C, especially C.16–C.25,
  C.43, C.51, C.53, C.55 and C.56, pp. 611–626; source id milne17,
  [author's edition](https://www.jmilne.org/math/Books/iAG2017.pdf).
- M. Demazure, *SGA 3*, Tome III, Exposé XXI, §§1.1, 6.1, 6.7, 7.3–7.4;
  source id sga3iii, [Gille–Polo re-edition, 13 October 2024](https://webusers.imj-prg.fr/~patrick.polo/SGA3/Exp21-13oct24.pdf).
  Proposition and printed-page numbers above refer to this re-edition, not
  the original pagination reproduced in its margins.
