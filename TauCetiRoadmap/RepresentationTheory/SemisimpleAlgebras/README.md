# Roadmap: semisimple algebras, Artin–Wedderburn, and the structure of their modules

**Summary.** Develop the structure theory of semisimple rings and finite-dimensional central
simple algebras from simple modules and the Artin–Wedderburn decomposition. The library contracts
below supply the block dictionary, density, tensor products, degree, Brauer group, splitting fields,
index, and real classification. The remaining end theorems are Skolem–Noether for a merely simple
source and the simplicity, dimension, and double-centralizer theorems for a merely simple
subalgebra of a finite-dimensional central simple algebra. These include inseparable subfields
and make the general algebra foundation available to representation theory and arithmetic.

## Scope and ownership

This is the semisimple-algebra component of RepresentationTheory. It owns the general
simple-source conjugacy and simple-subalgebra centralizer statements in Layer 5. The distinction
from the native central-source theorems is that centrality is required of the ambient algebra
instead of the source or subalgebra. No separability restriction is imposed.

The following parts of this roadmap's subject are already in the pinned libraries and are
consumed through the contracts below, not construction targets:

- Mathlib: simple and semisimple modules, Schur's division ring, occurrence of simple modules
  as minimal left ideals, Artin–Wedderburn existence, the Jacobson radical, density, and Maschke.
- Tau Ceti: radical convenience statements and opposite symmetry; the A-linear algebraically
  closed Schur equivalence; isotypic classes, primitive idempotents, chosen presentations,
  intrinsic division rings and multiplicities, full Wedderburn uniqueness, and dimension counts.
- Tau Ceti: faithful finite density, the central division-algebra presentation, scalar extension,
  tensor simplicity, square dimension, degree, the opposite-algebra equivalence, and the
  central-source Skolem–Noether and centralizer theorems, including tensor factorization.
- Tau Ceti: the tensor-product Brauer group, base change, division representatives, splitting
  fields, finite separable splitting, maximal subfields, index, finite-field triviality,
  and the real classification Br(ℝ) ≃ ℤ/2.

Character theory remains with CharacterTheory, Layer 2 (irreducibles, characters, and counting).
Algebraic-group representations remain with ReductiveGroups, Layer 1 (representations and comodules). Neither is a supplier here. There is no new generic carrier, quotient,
splitting predicate, or alternate group structure to construct in this roadmap.

## Conventions

All rings and algebra maps are unital. Semisimplicity means `IsSemisimpleRing`, including the
zero ring; simplicity means `IsSimpleRing`, which excludes it. Modules are left modules.
The division ring of a Wedderburn block attached to a simple module S is
`(Module.End R S)ᵐᵒᵖ`. The endomorphism ring itself acts on S by evaluation.
A presentation has a finite set of blocks, each of strictly positive matrix size; the empty
set of blocks represents the zero ring. For R in universe u the division rings in Mathlib's
existence theorem can also be taken in universe u.

In Layer 5, K is an arbitrary field, A is a finite-dimensional central simple K-algebra,
and B is a simple K-algebra or a simple K-subalgebra of A. Centrality and simplicity are
separate hypotheses: `Algebra.IsCentral K A` and `IsSimpleRing A`. A homomorphism B → A
is injective, so finite-dimensionality of B follows; for a subalgebra it follows from inclusion.
The field, ambient algebra, and source may lie in independent universes. There is no
algebraic-closure, characteristic, or separability convention hidden in these hypotheses.

Write Cₐ(B) for `Subalgebra.centralizer K (B : Set A)`; it consists of elements of A commuting
with every element of B. Conjugacy is oriented as g(b) = u f(b) u⁻¹. Brauer groups use
multiplicative Lean notation, with identity [K].

**Checks.**

- Right multiplication rᵢ followed in composition by rⱼ means rᵢ ∘ rⱼ; on 1 ∈ ℍ it gives
  ji = −k, whereas right multiplication by ij gives k. This fixes the opposite convention.
- For ℂ ⊂ ℍ, conjugation by j takes i to ji(−j) = −i; the identity conjugator takes i to i.
- The zero ring has zero blocks and no simple modules. K has one block of size 1, and K × K
  has two blocks of size 1. Appending M₀(K) to K would give two blocks for a one-block ring
  and is excluded by positivity.

## Exact supplier contracts

### From Mathlib

The paths in this section are relative to the Mathlib repository.

- `Mathlib/RingTheory/SimpleModule/Basic.lean`: `Module.End.instDivisionRing` applies to a
  simple module, and `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule` (line 416)
  realizes every simple module over a semisimple ring as an ideal, hence as a minimal left ideal.
  `Module.Finite.toModuleEnd_moduleEnd_surjective` requires a semisimple module finite over
  its endomorphism ring.
- `Mathlib/RepresentationTheory/AlgebraRepresentation/Basic.lean`, line 28:
  `IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed` concerns
  A-linear endomorphisms of a simple A-module finite over an algebraically closed base field,
  with compatible scalar actions.
- `Mathlib/RingTheory/SimpleModule/Isotypic.lean`: `isotypicComponents` and
  `sSupIndep_isotypicComponents` describe the simple isotypic summands. The finiteness instance
  at line 302 assumes `IsNoetherian R M`; this holds for the regular module of a semisimple
  ring. A bijection of isomorphism classes for a general module asserts no finiteness by itself.
- `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean`:
  `IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing` supplies finite products with
  nonzero block sizes; `IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite` fixes the
  opposite convention. `IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed` in
  `Mathlib/RingTheory/SimpleModule/IsAlgClosed.lean` gives the split finite-dimensional form.
- `Mathlib/RingTheory/Artinian/Module.lean`: `IsArtinianRing.of_finite` derives Artinianness
  from finiteness over a field; `IsArtinianRing.isSemisimpleRing_iff_jacobson` gives the radical
  criterion. `Ring.jacobson` is in `Mathlib/RingTheory/Jacobson/Radical.lean`.
- `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`: `Subalgebra.centralizer` is the commuting
  subalgebra; it imposes no simplicity or centrality. The inclusion in the double centralizer
  is `Subalgebra.le_centralizer_centralizer` in
  `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`, line 969.
  `Subalgebra.eq_of_le_of_finrank_eq` converts an inclusion of finite-dimensional
  subalgebras of equal dimension into equality
  (`Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean`, line 276).
- `Mathlib/Algebra/BrauerGroup/Defs.lean`: `CSA` bundles a finite-dimensional central simple
  algebra, `IsBrauerEquivalent` is matrix-stable equivalence, and `BrauerGroup` is its quotient.
  A zero algebra cannot be a CSA. `Module.finrank_baseChange` and
  `Module.finrank_tensorProduct` give the field-extension and tensor dimensions.

### From Tau Ceti

All declarations below carry the prefix `TauCeti` unless explicitly qualified otherwise.
The file paths are relative to the Tau Ceti repository. Their hypotheses are part of the
contracts, including nontriviality where it is needed.

**Radicals, Schur, and the block dictionary.**

- `TauCeti/RingTheory/Jacobson/FiniteOverArtinian.lean` supplies
  `TauCeti.isSemisimpleRing_iff_jacobson_eq_bot`, `TauCeti.isNilpotent_jacobson`, and
  `TauCeti.isSemisimpleRing_quotient_jacobson` for finite-dimensional algebras over a field.
  `TauCeti/RingTheory/Jacobson/MulOpposite.lean` supplies
  `TauCeti.Ring.coe_jacobson_mulOpposite` and `TauCeti.isSemiprimaryRing_mulOpposite_iff`.
- `TauCeti/RingTheory/Semisimple/Schur.lean`: `TauCeti.hom_eq_zero_of_isEmpty_linearEquiv`
  makes every map between nonisomorphic simple modules zero.
  `TauCeti.endAlgEquivSelfOfIsSimpleModule` identifies `Module.End A S` with k when k is
  algebraically closed, S is simple over A and finite-dimensional over k, and
  `IsScalarTower k A S` holds. It says nothing analogous about all k-linear endomorphisms.
- `TauCeti.simpleSubmoduleClassesEquiv` in
  `TauCeti/RingTheory/Semisimple/RegularIsotypicComponent.lean`, line 156, identifies
  isomorphism classes of simple submodules with isotypic components for any module.
  It asserts no finiteness of either set.
- `TauCeti/RingTheory/Semisimple/PrimitiveIdempotent.lean`:
  `TauCeti.isSimpleModule_iff_exists_isPrimitiveIdempotent` gives the primitive-idempotent
  realization over a semisimple ring. `RingEquiv.exists_simpleSubmodule_of_pi_matrix` in
  `TauCeti/RingTheory/Semisimple/Wedderburn/Blocks.lean` enumerates the simple-module classes
  of a positive-size matrix-product presentation.
- `TauCeti.WedderburnPresentation` in
  `TauCeti/RingTheory/Semisimple/Wedderburn/Presentation.lean`, line 75, stores a natural
  block count, division rings, positive degrees through `instNeZeroDegree`, and a ring
  equivalence. `TauCeti.wedderburnPresentation` chooses one for a semisimple ring; the algebra,
  finite-dimensional, and split variants in that file preserve these conditions.
  `RingEquiv.card_blocks_eq` in `TauCeti/RingTheory/Semisimple/BlockCount.lean` and
  `RingEquiv.wedderburn_blocks_unique` in
  `TauCeti/RingTheory/Semisimple/Wedderburn/Uniqueness.lean`, line 47, identify the counts and
  match every degree and division ring by an index equivalence, assuming positive block sizes.
  The uniqueness theorem also allows arbitrary block index sets and finite nonempty matrix
  index types; the finite presentations here are its specialization.
- `TauCeti.blockDivisionRing` and `TauCeti.blockMultiplicity` in
  `TauCeti/RingTheory/Semisimple/Wedderburn/Canonical.lean` are respectively the opposite
  endomorphism ring and the natural-number length of the regular isotypic component.
  `TauCeti.blockDivisionRingEquiv`, `TauCeti.blockMultiplicity_eq_of_linearEquiv`, and
  `TauCeti.blockMultiplicity_pos` give invariance and, for a simple module over a semisimple
  ring, positivity. `TauCeti.WedderburnPresentation.exists_equiv_degree_eq_blockMultiplicity`
  matches presentation sizes to these intrinsic multiplicities.
- `TauCeti.finrank_eq_sum_sq_finrank` and `TauCeti.finrank_eq_sum_sq_of_isAlgClosed` in
  `TauCeti/RingTheory/Semisimple/DimensionCount.lean` give the dimension sums for a specified
  algebra presentation. In the split case the sum is ∑ᵢ nᵢ².

**Density and central simple algebras.**

- `TauCeti.toModuleEnd_moduleEnd_bijective` and `TauCeti.ringEquivEndEnd` in
  `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean` require a faithful semisimple module
  finite over its endomorphism ring. `TauCeti.toModuleEnd_moduleEnd_bijective_of_isSimpleRing`
  specializes to a simple module over a simple ring.
- `TauCeti.IsSimpleRing.nonempty_linearEquiv_of_finrank_eq` in
  `TauCeti/RingTheory/Semisimple/SimpleArtinian.lean`, line 115, compares two modules over a
  finite-dimensional simple K-algebra: both must be finite-dimensional over K, with compatible
  scalar towers. Equal K-dimension gives an R-linear equivalence.
  `TauCeti.IsSimpleRing.moduleEnd` in `TauCeti/RingTheory/Semisimple/EndAlgebra.lean`, line 102,
  says the endomorphism ring of a nonzero finite module over a simple Artinian ring is simple;
  `TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq`, line 144, gives
  dimₖ(Endᵣ M) dimₖ R = (dimₖ M)² for finite-dimensional compatible K-modules.
- `TauCeti.IsSimpleRing.tensorProduct` and
  `TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right` in
  `TauCeti/Algebra/CentralSimple/TensorProduct.lean`, lines 185 and 227, require both factors
  simple and one specified factor central over K; neither needs finite dimension.
  Thus L ⊗ₖ A is simple for every field extension L/K and central simple A, without claiming
  L central over K. `TauCeti.Algebra.IsCentral.baseChange` in
  `TauCeti/Algebra/Central/BaseChange.lean`, line 89, supplies centrality over L.
- `TauCeti.IsSimpleRing.exists_algEquiv_matrix_centralDivisionRing` in
  `TauCeti/Algebra/CentralSimple/Wedderburn.lean` gives A ≃ Mₙ(D), n > 0, for a finite-dimensional
  central simple A, with D a finite-dimensional central division K-algebra.
  `TauCeti.IsSimpleRing.isSquare_finrank` and `TauCeti.Algebra.deg` in
  `TauCeti/Algebra/CentralSimple/Degree.lean` supply square dimension and its natural square
  root; `TauCeti.Algebra.deg_sq`, `TauCeti.Algebra.deg_tensorProduct`, and
  `TauCeti.Algebra.deg_matrix` give the square and multiplicativity laws for central simple
  algebras. Scalar-extension simplicity precedes the algebraic-closure proof of the square law
  (Stacks, Lemma 4.9, tag 074H, p. 4; Lemma 5.4, tag 074N, p. 5).
- `TauCeti.Algebra.tensorOpAlgEquivEnd` and `TauCeti.Algebra.tensorOpAlgEquivMatrix` in
  `TauCeti/Algebra/CentralSimple/Opposite.lean` use `IsAzumaya`, supplied for finite-dimensional
  central simple algebras by `TauCeti.IsSimpleRing.isAzumaya`. The map sends a ⊗ bᵒᵖ to (x ↦ axb),
  and the matrix size is dimₖ A, not its square root (Stacks, Lemma 4.10, tag 074I, p. 4).
- `TauCeti.skolemNoether` in `TauCeti/Algebra/CentralSimple/SkolemNoether.lean`, line 107,
  assumes the source central simple and the ambient algebra simple and finite-dimensional.
  `TauCeti.exists_unit_conj_of_algEquiv` supplies innerness of automorphisms of a
  finite-dimensional central simple algebra (Stacks, Lemma 6.2, tag 074R, p. 6).
- `TauCeti/Algebra/CentralSimple/Centralizer.lean` supplies `TauCeti.centralizer_isSimpleRing`
  and `TauCeti.finrank_mul_finrank_centralizer` for central simple B in finite-dimensional
  simple A, and `TauCeti.centralizer_centralizer` when A is also central.
  `TauCeti.centralizerAlgEquivEnd` identifies Cₐ(B) with the endomorphism algebra of
  `TauCeti.Bimodule B.val` over B ⊗ₖ Aᵒᵖ, without centrality of B.
  `TauCeti.tensorCentralizerAlgEquiv` sends b ⊗ c to bc for central simple B in finite-dimensional
  simple A; `TauCeti.centralizer_isCentral` additionally requires A central
  (Stacks, Lemma 7.2, tag 074U, p. 6).

**Brauer groups, splitting, and index.**

- `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` and
  `TauCeti.BrauerGroup.nonempty_algEquiv_of_mk_eq_mk` in
  `TauCeti/Algebra/BrauerGroup/Division.lean`, lines 69 and 92, give existence and uniqueness
  up to K-algebra equivalence of a finite-dimensional central division representative of each
  Brauer class (Stacks, Lemma 5.1, tag 074K, pp. 4–5).
- `TauCeti.BrauerGroup.instCommGroup` in `TauCeti/Algebra/BrauerGroup/Group.lean`, line 174,
  is the group on `BrauerGroup.{u, u} K`, with
  `TauCeti.BrauerGroup.mk_tensorProduct`, `TauCeti.BrauerGroup.mk_base`, and
  `TauCeti.BrauerGroup.mk_op` specifying multiplication, identity, and inverse.
  `TauCeti.isBrauerTrivial_matrix` in `TauCeti/Algebra/BrauerGroup/Trivial.lean` requires
  `NeZero n`; `TauCeti.isBrauerTrivial_end` requires a finite-dimensional **nontrivial** V.
  These are classes of Mₙ(K) and Endₖ(V), respectively (Stacks, Definition 5.2, tag 074L, p. 5).
- `TauCeti.BrauerGroup.baseChange` in `TauCeti/Algebra/BrauerGroup/BaseChange.lean` is the
  homomorphism Br(K) → Br(L) for a field extension in the same universe; its identity and
  tower laws are `TauCeti.BrauerGroup.baseChange_self` and
  `TauCeti.BrauerGroup.baseChange_comp`, the latter with an explicit scalar tower.
- `TauCeti.Algebra.IsSplittingField` in `TauCeti/Algebra/CentralSimple/Splitting.lean`, line 120,
  means that L ⊗ₖ A is Mₙ(L) for some n. Its body permits n = 0, so the zero algebra is split
  in this predicate, although it has no Brauer class. The API includes
  `TauCeti.Algebra.isSplittingField_congr`, `TauCeti.Algebra.IsSplittingField.matrix`,
  `TauCeti.Algebra.IsSplittingField.of_isScalarTower`, and
  `TauCeti.Algebra.isSplittingField_iff_deg` (the last for central simple finite-dimensional A).
  Splitting of a CSA is equivalent to its class mapping to 1 by
  `TauCeti.BrauerGroup.mk_mem_ker_baseChange_iff_isSplittingField`
  (Stacks, Definition 8.1, tag 074Y, p. 7).
- `TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable` in
  `TauCeti/Algebra/CentralSimple/FiniteSeparable.lean`, line 45, supplies a finite intermediate
  field of the separable closure splitting any finite-dimensional central simple A; its
  separability is inherited. `TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg` in
  `TauCeti/Algebra/CentralSimple/MaximalSubfield.lean` supplies a splitting maximal subfield
  of a finite-dimensional central division algebra D, of degree deg(D)
  (Stacks, Lemma 8.3, tag 0750, and Proposition 8.5, tag 0752, p. 7).
- `TauCeti.Algebra.index` in `TauCeti/Algebra/CentralSimple/Index.lean` is defined for
  finite-dimensional central simple A as the degree of its division representative.
  `TauCeti.Algebra.index_eq_deg_of_algEquiv_matrix` requires a positive-size presentation;
  `TauCeti.Algebra.index_pos`, `TauCeti.Algebra.index_dvd_deg`,
  `TauCeti.Algebra.isSplittingField_self_iff_index_eq_one`, and
  `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index` give its basic arithmetic API.
- `TauCeti.subsingleton_brauerGroup_of_finite` in `TauCeti/Algebra/BrauerGroup/Trivial.lean`
  gives triviality for every finite field. `TauCeti.Quaternion.brauerGroupMulEquiv` in
  `TauCeti/Algebra/BrauerGroup/Real.lean`, line 102, identifies `BrauerGroup.{0, 0} ℝ` with
  `Multiplicative (ZMod 2)`, taking [ℍ] to the additive class of 1.

**Checks of the supplied interfaces.**

- The one-block presentations K and M₂(K) have multiplicities 1 and 2; K × K has two
  multiplicities 1. Their dimension sums are 1² = 1, 2² = 4, and 1² + 1² = 2.
- For A = M₂(k), S = k² over algebraically closed k, dimₖ Endₐ(S) = 1 but
  dimₖ Endₖ(S) = 4. For k(t) as a simple module over itself over k, its endomorphism
  algebra is k(t), so removing finite-dimensionality would invalidate the scalar conclusion.
- The Jacobson radicals of K, K × K, and K[ε]/(ε²) are 0, 0, and (ε), respectively;
  (ε)² = 0 and the last radical quotient is K. The last algebra is not semisimple.
- M₂(𝔽₂) ⊗ M₂(𝔽₂) is M₄(𝔽₂), of dimension 4 · 4 = 16. In ℂ ⊗ℝ ℍ ≃ M₂(ℂ),
  the complex dimension is 4 = 2², independently of any Brauer-group construction.
- Degree and index of K, M₂(K), ℍ/ℝ, and M₂(ℍ)/ℝ are respectively (1,1), (2,1),
  (2,2), and (4,2). For ℍ, the opposite equivalence has source dimension 4 · 4 = 16
  and target M₄(ℝ) of dimension 16; M₂(ℝ), of dimension 4, would be wrong.
- Splitting gives true for M₂(K)/K, false for ℍ/ℝ over ℝ, true for ℍ/ℝ over ℂ,
  and true for M₀(K)/K. Endₖ(K) has dimension 1 and trivial Brauer class;
  Endₖ(0) has dimension 0 and no CSA representative.
- In Br(ℝ), [ℝ] is 1, [ℍ] ≠ 1, and [ℍ]² = 1. The product [ℝ][ℝ] is [ℝ],
  excluding the abstract two-element group law transported by exchanging [ℝ] and [ℍ].
- ℂ is simple over ℝ but not central: its center has real dimension 2, while the scalars
  have dimension 1. Likewise a proper finite-field extension is a division algebra but not
  central over the smaller field; central finite-field division representatives have dimension 1.

## How to read the build

The supplier contracts provide the semisimple, Wedderburn, density, tensor, and Brauer theory.
Layer 5 develops the general conjugacy and centralizer statements on those objects: §5.1 uses
module classification and tensor simplicity, §5.2 uses endomorphism algebras and their dimension
formula, and §5.3 applies §5.2 twice. The scalar-extension input is available before square
dimension, while Brauer functoriality uses the specified group law. No result of Layer 5 is an
input to any supplied construction used to prove Layer 5. Suggested.lean contains exactly its
four headline theorems, all on native carriers, with no auxiliary definitions.

## Layer 5: Skolem–Noether and the centralizer theorem

### 5.1 Conjugacy for a simple source

Prove `skolemNoether`: for every field K, finite-dimensional central simple K-algebra A,
simple K-algebra B, and two K-algebra homomorphisms f,g : B → A, there exists a unit u of A
such that g(b) = u f(b) u⁻¹ for every b ∈ B. No finite-dimensionality assumption on B is
needed in the signature: injectivity of f supplies it. Neither centrality of B nor separability
of its center is assumed (Stacks, Theorem 6.1, tag 074Q, pp. 5–6).

One proof route equips A with its two left B ⊗ₖ Aᵒᵖ-module structures, using f and g.
This tensor algebra is simple because its right factor is central simple, and it is
finite-dimensional. The two modules have the same K-dimension, so module classification gives
an invertible intertwiner. Right A-linearity makes it left multiplication by u; the inverse
intertwiner makes u a unit, and B-linearity gives the displayed conjugacy formula. These modules
need not be simple, so the route uses classification of all finite modules over a simple
Artinian algebra (Stacks, Lemma 4.6(3), tag 074E, p. 4).

*Needs:* Mathlib `AlgHom`, `IsSimpleRing`, `FiniteDimensional`, `IsArtinianRing.of_finite`;
`TauCeti.Bimodule` and its right-action and intertwining identities in
`TauCeti/Algebra/CentralSimple/Bimodule.lean`;
`TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right`;
`TauCeti.IsSimpleRing.nonempty_linearEquiv_of_finrank_eq`.

**Checks.**

- For f = g, u = 1 gives f(b) = 1 f(b) 1. For B = K and A = M₂(K), the two modules
  both have dimension 4 and length 2 over Aᵒᵖ; demanding simplicity of them would fail.
- For ℂ ⊂ ℍ over ℝ, take f(i) = i and g(i) = −i. Conjugation by j gives ji(−j) = −i,
  allowing a noncentral source. Conjugation by 1 instead gives i and does not intertwine them.
- For A = B = ℂ over ℝ, every inner conjugation fixes i while complex conjugation sends it
  to −i. This rejects dropping centrality of A; it does not justify requiring centrality of B.

### 5.2 Simplicity and dimension of a centralizer

For every simple K-subalgebra B of a finite-dimensional central simple K-algebra A, prove
`centralizer_isSimpleRing`, asserting that C = Cₐ(B) is simple, and
`finrank_mul_finrank_centralizer`, asserting dimₖ B · dimₖ C = dimₖ A
(Stacks, Theorem 7.1(1)–(2), tag 074T, p. 6). The product formula is unchanged when Z(B)
properly contains K. Centrality of C over K is not asserted.

For a proof route, let R = B ⊗ₖ Aᵒᵖ and let M be A with the inclusion action. The right-central
tensor theorem makes R simple Artinian. Identify C with Endᵣ M, whose simplicity follows from
M being nonzero and finite. Its dimension identity is dimₖ C · (dimₖ B · dimₖ A) = (dimₖ A)².
Cancel dimₖ A > 0, which follows from simplicity and finite-dimensionality of A. This route
uses no conjugacy theorem and no centrality of B.

*Needs:* Mathlib `Subalgebra.centralizer`, `Module.finrank_tensorProduct`,
`IsArtinianRing.of_finite`;
`TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right`, `TauCeti.centralizerAlgEquivEnd`,
`TauCeti.IsSimpleRing.moduleEnd`, `TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq`.

**Checks.**

- For B = K ⊂ A = M₂(K), C = M₂(K), and 1 · 4 = 4. For B = A = M₂(K),
  C = K, and 4 · 1 = 4. Both centralizers are simple.
- For ℂ ⊂ ℍ over ℝ, C = ℂ, and 2 · 2 = 4. Its center has dimension 2 over ℝ;
  simplicity holds but centrality over ℝ fails.
- For the diagonal algebra K × K ⊂ M₂(K), C = K × K is not simple. Although 2 · 2 = 4,
  this case must not certify the simplicity theorem: the hypothesis on B fails.
- For the upper triangular algebra B in M₂(K), C is the scalar algebra K, so
  dimₖ B · dimₖ C = 3 · 1 = 3 ≠ 4. Its double centralizer is M₂(K), of dimension 4,
  rather than B, of dimension 3; simplicity of B is essential to both conclusions.
- For K = 𝔽₂(t), L = K(s) with s² = t embedded by its regular action in M₂(K),
  C = L and 2 · 2 = 4. L/K is inseparable, so adding separability would exclude a valid case.
- The zero algebra has dimension 0 and is not simple; the cancelled factor would be 0.
  For B = K in the noncentral ambient A = ℂ over K = ℝ, the centralizer is ℂ and
  1 · 2 = 2, but this example supplies no centrality of A.

### 5.3 Double centralizers

Prove `centralizer_centralizer`: for the same A and simple B as in §5.2, Cₐ(Cₐ(B)) = B
as K-subalgebras of A (Stacks, Theorem 7.1(3), tag 074T, p. 6). The inclusion from B into
its double centralizer follows from commutation. By §5.2, Cₐ(B) is simple, so the dimension
formula applies to it too. Cancelling the positive dimension of Cₐ(B) gives equality of the
dimensions of B and its double centralizer, hence equality of the subalgebras. This does not
require Cₐ(B) to be central over K.

*Needs:* §5.2 `centralizer_isSimpleRing` and `finrank_mul_finrank_centralizer`;
Mathlib `Subalgebra.le_centralizer_centralizer`, `Subalgebra.eq_of_le_of_finrank_eq`.

**Checks.**

- The two centralizers of K ⊂ M₂(K) are M₂(K), then K; for B = M₂(K) they are K,
  then M₂(K). The double-centralizer dimensions are respectively 1 and 4.
- Both centralizers of ℂ ⊂ ℍ are ℂ, of real dimension 2. The double-centralizer theorem
  applies, but multiplication ℂ ⊗ℝ ℂ → ℍ has image ℂ of dimension 2, not 4; the
  tensor-factorization refinement requires centrality of B.
- In the inseparable regular embedding L ⊂ M₂(K) of §5.2, both centralizers are L,
  with K-basis (1,s) and dimension 2.
- For ℝ ⊂ ℂ with ambient algebra ℂ, the double centralizer is ℂ, of real dimension 2,
  whereas B has dimension 1. This rejects omitting ambient centrality.

### Examples

The scalar and full matrix subalgebras give both ends of the centralizer formula in every
characteristic, including 2 and 3. The complex subfield of ℍ tests noncentral B and the
conjugation orientation. The inseparable quadratic regular embedding tests the absence of a
separability restriction. All three headline centralizer conclusions apply to that embedding;
tensor factorization over K is a different assertion with stronger hypotheses.

### Dependencies

The only suppliers are Mathlib and Tau Ceti through the exact contracts above. The tensor
simplicity and module-classification route of §5.1 and the endomorphism-algebra route of §5.2
are independent; §5.3 depends on §5.2. The Brauer group and the real classification are
consumed interfaces, not inputs to these proofs.

## Downstream consumers

CharacterTheory, Layer 2 and its Layer 2.5 indexing, uses the positive-size block/simple-module
dictionary; its split dimension sum consumes Mathlib directly. For a finite group G over an algebraically closed field k with
`NeZero (Nat.card G : k)`, Maschke and the dimension of k[G] give ∑ᵢ nᵢ² = |G|.
For C₁, C₂, and S₃ in characteristic zero the sums are 1, 1 + 1 = 2, and 1 + 1 + 4 = 6;
in characteristic 2 the hypothesis for C₂ fails and k[C₂] has nonzero square-zero augmentation
ideal. ReductiveGroups, Layer 1, uses representations and their endomorphism algebras; it
supplies no prerequisites to the algebra theory here.

## References

- The Stacks Project, *Brauer Groups*, version ed88ff78 (2026): Lemma 4.6 (tag 074E), p. 4;
  Lemmas 4.7–4.10 (tags 074F–074I), p. 4; Definition 5.2 and Lemma 5.4 (tags 074L, 074N),
  p. 5; [Theorem 6.1](https://stacks.math.columbia.edu/tag/074Q), pp. 5–6;
  [Theorem 7.1](https://stacks.math.columbia.edu/tag/074T) and
  [Lemma 7.2](https://stacks.math.columbia.edu/tag/074U), p. 6; Definition 8.1,
  Lemma 8.3, and Proposition 8.5 (tags 074Y, 0750, 0752), p. 7.
  The source uses right modules; the left-module tensor actions and conjugation orientation
  are specified above. The source key is stacks-brauer; the general conjugacy and centralizer
  statements are at stacks-brauer line 215 and stacks-brauer line 235.
