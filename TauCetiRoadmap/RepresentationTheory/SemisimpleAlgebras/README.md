# Roadmap: semisimple algebras, Artin–Wedderburn, and the structure of their modules

**Summary.** Develop the structure theory of semisimple rings and finite-dimensional central
simple algebras from simple modules and the Artin–Wedderburn decomposition. Layers 0–4 and 6
record, notion by notion, the pinned declarations of Mathlib and Tau Ceti that supply the
Jacobson radical, Schur's lemma and isotypic components, the Wedderburn decomposition with its
uniqueness, density, central simple algebras and their tensor products, the Brauer group,
splitting fields, the index, and the real classification. The end theorems, in Layer 5, are
Skolem–Noether for a merely simple source and the simplicity and double-centralizer theorems for
a merely simple subalgebra of a finite-dimensional central simple algebra; the dimension product
for such a subalgebra is a pinned theorem and is consumed. These include inseparable subfields
and make the general algebra foundation available to representation theory and arithmetic.

## Scope and ownership

This is the semisimple-algebra component of RepresentationTheory. It owns the general
simple-source conjugacy and simple-subalgebra centralizer statements in Layer 5. The distinction
from the native central-source theorems is that centrality is required of the ambient algebra
instead of the source or subalgebra. No separability restriction is imposed. The dimension
product dimₖ B · dimₖ Cₐ(B) = dimₖ A is not owned here in any form: Tau Ceti proves it for
every subalgebra B of A such that B ⊗ₖ Aᵒᵖ is simple, which covers a simple B in a central
simple A (Layer 4, §4.4).

The following parts of this roadmap's subject are already in the pinned libraries. They are
consumed through the contracts below and laid out in Layers 0–4 and 6, which name the supplying
declaration of each notion and contain no construction target:

- Mathlib: simple and semisimple modules, Schur's division ring, occurrence of simple modules
  as minimal left ideals, Artin–Wedderburn existence, the Jacobson radical, density, and Maschke.
- Tau Ceti: radical convenience statements and opposite symmetry; the A-linear algebraically
  closed Schur equivalence; isotypic classes, primitive idempotents, chosen presentations,
  intrinsic division rings and multiplicities, full Wedderburn uniqueness, and dimension counts.
- Tau Ceti: faithful finite density, the central division-algebra presentation, scalar extension,
  tensor simplicity, square dimension, degree, the opposite-algebra equivalence, the
  central-source Skolem–Noether and centralizer theorems including tensor factorization, and the
  centralizer dimension count for a subalgebra with simple B ⊗ₖ Aᵒᵖ.
- Tau Ceti: the tensor-product Brauer group, base change, division representatives, splitting
  fields, finite separable splitting, maximal subfields, index, finite-field triviality,
  and the real classification Br(ℝ) ≃ ℤ/2.

Character theory remains with CharacterTheory, Layer 2 (irreducibles, characters, and counting).
Algebraic-group representations remain with ReductiveGroups, Layer 1 (representations and
comodules). Neither is a supplier here. There is no new generic carrier, quotient, splitting
predicate, or alternate group structure to construct in this roadmap.

## Conventions

All rings and algebra maps are unital. Semisimplicity means `IsSemisimpleRing`, including the
zero ring; simplicity means `IsSimpleRing`, which excludes it. Modules are left modules.
The division ring of a Wedderburn block attached to a simple module S is
`(Module.End R S)ᵐᵒᵖ`. The endomorphism ring itself acts on S by evaluation.
A presentation has a finite set of blocks, each of strictly positive matrix size; the empty
set of blocks represents the zero ring. For R in universe u the division rings in Mathlib's
existence theorem can also be taken in universe u.

In Layers 4–6, K is an arbitrary field and A is a finite-dimensional central simple K-algebra
unless a statement says otherwise. In Layer 5, B is a simple K-algebra or a simple K-subalgebra
of A. Centrality and simplicity are separate hypotheses: `Algebra.IsCentral K A` and
`IsSimpleRing A`. A homomorphism B → A is injective, so finite-dimensionality of B follows; for
a subalgebra it follows from inclusion. The field, ambient algebra, and source may lie in
independent universes. There is no algebraic-closure, characteristic, or separability convention
hidden in these hypotheses.

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
- `Mathlib/RingTheory/SimpleRing/Basic.lean`, line 89: the opposite ring of a simple ring is
  simple (an instance). `Mathlib/Algebra/Central/Basic.lean`, line 72: the opposite algebra of a
  central algebra is central (an instance). Together with the right-central tensor theorem of
  Layer 4 these make B ⊗ₖ Aᵒᵖ simple for simple B and central simple A.
- `Mathlib/Algebra/BrauerGroup/Defs.lean`: `CSA` bundles a finite-dimensional central simple
  algebra, `IsBrauerEquivalent` is matrix-stable equivalence, and `BrauerGroup` is its quotient.
  A zero algebra cannot be a CSA. `Module.finrank_baseChange` and
  `Module.finrank_tensorProduct` give the field-extension and tensor dimensions.

### From Tau Ceti

Declarations in Tau Ceti files carry the prefix `TauCeti`, except the three block theorems
`RingEquiv.exists_simpleSubmodule_of_pi_matrix`, `RingEquiv.card_blocks_eq`, and
`RingEquiv.wedderburn_blocks_unique`, which their files declare in the root namespace
`RingEquiv`. The file paths are relative to the Tau Ceti repository. The hypotheses of every
declaration are part of the contract, including nontriviality where it is needed; the layer that
consumes a declaration states them.

- `TauCeti/RingTheory/Jacobson/FiniteOverArtinian.lean` and
  `TauCeti/RingTheory/Jacobson/MulOpposite.lean`: the radical criterion, nilpotence of the
  radical, the semisimple radical quotient, and left–right symmetry (Layer 0).
- `TauCeti/RingTheory/Semisimple/Schur.lean`,
  `TauCeti/RingTheory/Semisimple/RegularIsotypicComponent.lean`, and
  `TauCeti/RingTheory/Semisimple/PrimitiveIdempotent.lean`: Schur's lemma in its vanishing and
  A-linear algebraically closed forms, isotypic classes, and primitive idempotents (Layer 1).
- `TauCeti/RingTheory/Semisimple/Wedderburn/Presentation.lean`,
  `TauCeti/RingTheory/Semisimple/Wedderburn/Blocks.lean`,
  `TauCeti/RingTheory/Semisimple/Wedderburn/Canonical.lean`,
  `TauCeti/RingTheory/Semisimple/Wedderburn/Uniqueness.lean`,
  `TauCeti/RingTheory/Semisimple/BlockCount.lean`, `TauCeti/Algebra/Matrix/Pi.lean`, and
  `TauCeti/RingTheory/Semisimple/DimensionCount.lean`: chosen presentations, the block
  dictionary, intrinsic invariants, uniqueness, and dimension counts (Layer 2).
- `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean`,
  `TauCeti/RingTheory/Semisimple/SimpleArtinian.lean`, and
  `TauCeti/RingTheory/Semisimple/EndAlgebra.lean`: density and modules over simple Artinian
  algebras (Layer 3).
- `TauCeti/Algebra/CentralSimple/TensorProduct.lean`, `TauCeti/Algebra/Central/BaseChange.lean`,
  `TauCeti/Algebra/CentralSimple/Wedderburn.lean`, `TauCeti/Algebra/CentralSimple/Degree.lean`,
  `TauCeti/Algebra/CentralSimple/Opposite.lean`, `TauCeti/Algebra/CentralSimple/SkolemNoether.lean`,
  `TauCeti/Algebra/CentralSimple/Centralizer.lean`, and
  `TauCeti/Algebra/CentralSimple/Bimodule.lean`: tensor products, scalar extension, the division
  presentation, degree, the opposite algebra, the central-source conjugacy and centralizer
  theorems, the general centralizer dimension count, and the bimodule carrier (Layer 4; the
  bimodule carrier and the count are also inputs of Layer 5).
- `TauCeti/Algebra/BrauerGroup/Division.lean`, `TauCeti/Algebra/BrauerGroup/Group.lean`,
  `TauCeti/Algebra/BrauerGroup/Trivial.lean`, `TauCeti/Algebra/BrauerGroup/BaseChange.lean`,
  `TauCeti/Algebra/BrauerGroup/Real.lean`, `TauCeti/Algebra/CentralSimple/Splitting.lean`,
  `TauCeti/Algebra/CentralSimple/FiniteSeparable.lean`,
  `TauCeti/Algebra/CentralSimple/MaximalSubfield.lean`, and
  `TauCeti/Algebra/CentralSimple/Index.lean`: the Brauer group, trivial classes, base change,
  splitting fields, the index, and the finite and real classifications (Layer 6).

## How to read the build

Layers 0–3 are the semisimple theory over a ring; Layers 4 and 6 are the central simple and
Brauer theory over a field. Each of these layers names, notion by notion, the pinned declaration
that supplies it, with its hypotheses, and has no construction target. Layer 5 is the construction
layer: §5.1 proves conjugacy for a simple source by module classification and tensor simplicity,
§5.2 proves simplicity of the centralizer of a simple subalgebra through its endomorphism
algebra, and §5.3 combines §5.2 with the consumed dimension count of §4.4. The scalar-extension
input of §4.1 is available before the square dimension of §4.2, and Brauer functoriality in
Layer 6 uses the specified group law. No result of Layer 5 is an input to any supplied
declaration used to prove Layer 5. Suggested.lean contains exactly the three headline theorems of
Layer 5, all on native carriers, with no auxiliary definitions.

## Layer 0: the Jacobson radical and the semisimplicity criterion

### 0.1 The radical criterion for finite-dimensional algebras

Consume `Ring.jacobson`, `IsArtinianRing.of_finite`, and
`IsArtinianRing.isSemisimpleRing_iff_jacobson` from Mathlib. For a ring A finite over an
Artinian ring K acting compatibly, which includes every finite-dimensional algebra over a field,
`TauCeti.isSemisimpleRing_iff_jacobson_eq_bot` says A is semisimple if and only if its Jacobson
radical is ⊥, `TauCeti.isNilpotent_jacobson` says the radical is a nilpotent two-sided ideal, and
`TauCeti.isSemisimpleRing_quotient_jacobson` says the quotient of A by its radical is semisimple.
These three take the base ring, the module structure with `IsScalarTower K A A`, and
`Module.Finite K A` as hypotheses; nothing is assumed of the characteristic. *Needs:* Mathlib
`Ring.jacobson`, `IsArtinianRing.of_finite`, `IsArtinianRing.isSemisimpleRing_iff_jacobson`;
`TauCeti.isSemisimpleRing_iff_jacobson_eq_bot`, `TauCeti.isNilpotent_jacobson`,
`TauCeti.isSemisimpleRing_quotient_jacobson`.

**Checks.**

- The Jacobson radicals of K, K × K, and K[ε]/(ε²) are 0, 0, and (ε), respectively;
  (ε)² = 0 and the last radical quotient is K. The last algebra is not semisimple.
- The upper triangular algebra T₂(K) has radical the strictly upper triangular matrices, of
  dimension 1 with square zero, and radical quotient K × K; it is not semisimple although its
  radical quotient is. A criterion that tested only the quotient would accept it.

### 0.2 Left–right symmetry

`TauCeti.Ring.coe_jacobson_mulOpposite` identifies the radical of Rᵐᵒᵖ, as a set, with the
`op`-image of the radical of R, for every ring R; `TauCeti.isSemiprimaryRing_mulOpposite_iff`
says Rᵐᵒᵖ is semiprimary if and only if R is. Together they make the radical statements of §0.1
left–right symmetric. *Needs:* `TauCeti.Ring.coe_jacobson_mulOpposite`,
`TauCeti.isSemiprimaryRing_mulOpposite_iff`.

**Checks.**

- For T₂(K), the opposite ring is the lower triangular algebra, whose radical is the strictly
  lower triangular part; it is the `op`-image of the strictly upper triangular part, of the same
  dimension 1. A description that took the radical of Rᵐᵒᵖ to be the radical of R itself as a
  subset would fail here, since the two sets of matrices differ.
- A division ring and its opposite both have radical 0 and are both semiprimary.

### Examples

The algebras K, K × K, K[ε]/(ε²), and T₂(K) separate semisimple from semiprimary. The radical
quotient of T₂(K) is the semisimple K × K and the radical is nilpotent of index 2.

### Dependencies

Mathlib and Tau Ceti only, through the contracts above. No other layer is an input.

## Layer 1: simple modules, Schur, and isotypic components

### 1.1 Schur's lemma

Over any ring, `Module.End.instDivisionRing` makes the endomorphism ring of a simple module a
division ring, and `TauCeti.hom_eq_zero_of_isEmpty_linearEquiv` makes every linear map between
nonisomorphic simple modules zero. For a K-algebra A acting on a simple A-module S with
`IsScalarTower k A S`, k algebraically closed, and S finite-dimensional over k, Mathlib's
`IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed` says the scalar map k → `Module.End A S`
is bijective, and `TauCeti.endAlgEquivSelfOfIsSimpleModule` packages it as a k-algebra
equivalence `Module.End A S ≃ₐ[k] k`. The carrier is the algebra of A-linear endomorphisms;
nothing analogous holds for all k-linear endomorphisms of S. *Needs:* Mathlib
`Module.End.instDivisionRing`, `IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`;
`TauCeti.hom_eq_zero_of_isEmpty_linearEquiv`, `TauCeti.endAlgEquivSelfOfIsSimpleModule`.

**Checks.**

- For A = M₂(k), S = k² over algebraically closed k, dimₖ Endₐ(S) = 1 but
  dimₖ Endₖ(S) = 4. A statement about all k-linear endomorphisms would be false.
- For k(t) as a simple module over itself over k, its endomorphism algebra is k(t), so
  removing finite-dimensionality would invalidate the scalar conclusion.
- Over ℝ, the simple ℂ-module ℂ has A-linear endomorphism algebra ℂ, of real dimension 2:
  algebraic closure of the base field is needed, not only of the acting algebra's center.

### 1.2 Isotypic components

Mathlib's `isotypicComponents` and `sSupIndep_isotypicComponents` give the independent family of
isotypic summands of a semisimple module; its finiteness instance assumes `IsNoetherian R M`,
which the regular module of a semisimple ring satisfies. `TauCeti.simpleSubmoduleClassesEquiv`
identifies the isomorphism classes of simple submodules of any module with its isotypic
components; it asserts no finiteness of either set. *Needs:* Mathlib `isotypicComponents`,
`sSupIndep_isotypicComponents`; `TauCeti.simpleSubmoduleClassesEquiv`.

**Checks.**

- The regular module of K × K has two isotypic components, each of dimension 1; the regular
  module of M₂(K) has one isotypic component, the whole module, in which the two column ideals
  are isomorphic simple submodules. A count of simple submodules instead of classes would give 2
  for M₂(K) in place of 1.
- The zero module has no isotypic component and no simple submodule.

### 1.3 Simple modules as minimal left ideals

Mathlib's `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule` says every simple
module over a semisimple ring is isomorphic to a left ideal, which is then a minimal left ideal.
`TauCeti.isSimpleModule_iff_exists_isPrimitiveIdempotent` characterizes, over a semisimple ring,
the simple modules as those generated by a primitive idempotent. Through §1.2 this identifies
isomorphism classes of all simple modules with the isotypic components of the regular module.
*Needs:* Mathlib `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule`;
`TauCeti.isSimpleModule_iff_exists_isPrimitiveIdempotent`; §1.2.

**Checks.**

- In M₂(K) the matrix unit E₁₁ is a primitive idempotent generating the first column ideal; the
  identity is an idempotent that is not primitive, since 1 = E₁₁ + E₂₂.
- Over ℤ, which is not semisimple, the simple module ℤ/2 is isomorphic to no ideal, since every
  nonzero ideal of ℤ is infinite. The semisimplicity hypothesis cannot be dropped.

### Examples

The scalar algebra, K × K, and M₂(K) exhibit one, two, and one isotypic components with one, two,
and one isomorphism classes of simple modules. The A-linear Schur collapse is tested on M₂(k)
acting on k².

### Dependencies

Mathlib and Tau Ceti only. §1.3 uses §1.2.

## Layer 2: Artin–Wedderburn, assembled with uniqueness

### 2.1 Existence and chosen presentations

Mathlib's `IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing` presents a semisimple ring
as a finite product of matrix rings of positive size over division rings;
`IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite` writes a simple Artinian ring as matrices
over the opposite of the endomorphism ring of a simple module, fixing the opposite convention;
`IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed` gives the split form of a
finite-dimensional semisimple algebra over an algebraically closed field.
`TauCeti.WedderburnPresentation` (`Presentation.lean`, line 75) stores a natural block count,
division rings, positive degrees through `instNeZeroDegree`, and a ring equivalence;
`TauCeti.wedderburnPresentation` chooses one for a semisimple ring, and the algebra,
finite-dimensional, and split variants in that file preserve these conditions. *Needs:* Mathlib
`IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing`,
`IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite`,
`IsSemisimpleRing.exists_algEquiv_pi_matrix_of_isAlgClosed`; `TauCeti.WedderburnPresentation`,
`TauCeti.wedderburnPresentation`.

**Checks.**

- The zero ring has the presentation with zero blocks. K has one block of size 1 and K × K
  two blocks of size 1. Appending M₀(K) to K is excluded by `instNeZeroDegree`.
- For R = M₂(K), the endomorphism ring of the column module K² is K, and the presentation
  is M₂(Kᵐᵒᵖ) = M₂(K). For R = ℍ as a module over itself, the endomorphism ring is ℍᵒᵖ, by
  right multiplications, so the presentation is M₁((ℍᵒᵖ)ᵒᵖ) = M₁(ℍ), consistent with the
  Conventions Check on right multiplications.

### 2.2 The block dictionary

`RingEquiv.exists_simpleSubmodule_of_pi_matrix` takes a presentation of R as a product, indexed
by `Fin n`, of dᵢ × dᵢ matrix rings over division rings Dᵢ with every dᵢ positive, and
produces simple left ideals S₁, …, Sₙ of R,
pairwise nonisomorphic, such that every simple left ideal is isomorphic to exactly one Sᵢ.
With §1.3 this enumerates the isomorphism classes of all simple R-modules by the blocks.
*Needs:* `RingEquiv.exists_simpleSubmodule_of_pi_matrix`; §1.3.

**Checks.**

- For K × K the two simple left ideals K × 0 and 0 × K are nonisomorphic, since the idempotent
  (1, 0) acts as the identity on one and as zero on the other. For M₂(K) the two column ideals
  are isomorphic, so the dictionary lists one class, not two.
- Without positivity, the presentation K ≅ K × M₀(K) would index two classes for a ring with one.

### 2.3 Intrinsic invariants and uniqueness

`TauCeti.blockDivisionRing` of a simple module S is `(Module.End R S)ᵐᵒᵖ`, and
`TauCeti.blockMultiplicity` is the length of the isotypic component of S in the regular module,
as a natural number. `TauCeti.blockDivisionRingEquiv` and
`TauCeti.blockMultiplicity_eq_of_linearEquiv` transport both along an isomorphism of modules,
and `TauCeti.blockMultiplicity_pos` makes the multiplicity of a simple module over a semisimple
ring positive. `TauCeti.WedderburnPresentation.exists_equiv_degree_eq_blockMultiplicity`
matches the chosen degrees of any presentation with these intrinsic multiplicities along an
enumeration of the simple modules. `RingEquiv.card_blocks_eq` says two presentations of the same
ring as `Fin`-indexed products of positive-size matrix rings over simple rings have the same
number of blocks; semisimplicity of the ring is not assumed. `RingEquiv.wedderburn_blocks_unique`
takes two presentations of a ring as products of matrix rings over division rings, with
arbitrary block index sets and finite nonempty matrix index types, and gives a bijection of the
index sets matching the matrix sizes and the division rings up to ring isomorphism; the finite
positive-size presentations of §2.1 are its specialization. *Needs:* `TauCeti.blockDivisionRing`,
`TauCeti.blockMultiplicity`, `TauCeti.blockDivisionRingEquiv`,
`TauCeti.blockMultiplicity_eq_of_linearEquiv`, `TauCeti.blockMultiplicity_pos`,
`TauCeti.WedderburnPresentation.exists_equiv_degree_eq_blockMultiplicity`,
`RingEquiv.card_blocks_eq`, `RingEquiv.wedderburn_blocks_unique`; §2.2.

**Checks.**

- The one-block presentations K and M₂(K) have multiplicities 1 and 2; K × K has two
  multiplicities 1. For M₂(K) the regular module is the direct sum of two column ideals, so the
  length of its single isotypic component is 2.
- M₂(K) × K and M₁(K) × M₂(K) are presentations of the same ring with the blocks permuted; the
  uniqueness theorem matches them by the transposition. M₂(K) and K × K × K × K have the same
  dimension 4 but block counts 1 and 4, so the block count alone shows they are not isomorphic.
- Nonemptiness of the matrix index types is essential: M₀(D) is the zero ring for every D, so a
  presentation could otherwise be padded with blocks over arbitrary division rings.

### 2.4 Dimension counts

`TauCeti.finrank_eq_sum_sq_finrank` in `TauCeti/Algebra/Matrix/Pi.lean` gives, for a specified
presentation of a finite-dimensional algebra A as a product of dᵢ × dᵢ matrix algebras over
division algebras Dᵢ, the sum dimₖ A = ∑ᵢ dᵢ² · dimₖ Dᵢ, with no positivity assumption and
no semisimplicity assumption. `TauCeti.finrank_eq_sum_sq_of_isAlgClosed`
specializes it over an algebraically closed field, where each Dᵢ has dimension 1 wherever its
block is nonzero, to dimₖ A = ∑ᵢ dᵢ². *Needs:* `TauCeti.finrank_eq_sum_sq_finrank`,
`TauCeti.finrank_eq_sum_sq_of_isAlgClosed`.

**Checks.**

- The dimension sums of K, M₂(K), and K × K are 1² = 1, 2² = 4, and 1² + 1² = 2; that of
  M₂(K) × K is 2² · 1 + 1² · 1 = 5.
- Over ℝ, ℍ = M₁(ℍ) has dimension 1² · 4 = 4; the split formula would give 1 and is not
  applicable, since ℝ is not algebraically closed.
- For k[S₃] in characteristic zero the split sum is 1 + 1 + 4 = 6 = |S₃|.

### Examples

The rings K, K × K, M₂(K), M₂(K) × K, and ℍ exhibit the block count, the multiplicities, and
both dimension formulas. Uniqueness is tested on the two orderings of M₂(K) × K.

### Dependencies

Mathlib and Tau Ceti only. §2.2 uses §1.3; §2.3 uses §2.2.

## Layer 3: the double-centralizer (density) theorem

### 3.1 Density

Mathlib's `Module.Finite.toModuleEnd_moduleEnd_surjective` says the natural map from R to the
endomorphisms of M over `Module.End R M` is surjective for a semisimple module M finite over its
endomorphism ring. `TauCeti.toModuleEnd_moduleEnd_bijective` makes it bijective when M is also
faithful, and `TauCeti.ringEquivEndEnd` packages the ring isomorphism;
`TauCeti.toModuleEnd_moduleEnd_bijective_of_isSimpleRing` specializes to a simple module over a
simple ring, where faithfulness is automatic. The hypothesis is finiteness over the
endomorphism ring, not over a base field. *Needs:* Mathlib
`Module.Finite.toModuleEnd_moduleEnd_surjective`; `TauCeti.toModuleEnd_moduleEnd_bijective`,
`TauCeti.ringEquivEndEnd`, `TauCeti.toModuleEnd_moduleEnd_bijective_of_isSimpleRing`.

**Checks.**

- For R = M₂(K) and M = K², the endomorphism ring is K and the map M₂(K) → End_K(K²) is a
  bijection.
- For R = K × K and M = K through the first projection, the module is simple and finite over its
  endomorphism ring K, but not faithful: the map K × K → End_K(K) = K is surjective and not
  injective. Faithfulness cannot be dropped from the bijectivity statement.

### 3.2 Modules over a simple Artinian algebra

`TauCeti.IsSimpleRing.nonempty_linearEquiv_of_finrank_eq` (`SimpleArtinian.lean`, line 115)
compares two modules over a finite-dimensional simple K-algebra R: both must be
finite-dimensional over K with compatible scalar towers, and equal K-dimension gives an R-linear
equivalence. `TauCeti.IsSimpleRing.moduleEnd` (`EndAlgebra.lean`, line 102) says the
endomorphism ring of a nonzero module finite over a simple Artinian ring is simple;
`TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq` (line 144) gives
dimₖ(Endᵣ M) · dimₖ R = (dimₖ M)² for a finite-dimensional module M over a finite-dimensional
simple K-algebra R with compatible scalar actions. *Needs:*
`TauCeti.IsSimpleRing.nonempty_linearEquiv_of_finrank_eq`, `TauCeti.IsSimpleRing.moduleEnd`,
`TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq`.

**Checks.**

- For R = M₂(K) and M = K², dimₖ Endᵣ M · dimₖ R = 1 · 4 = 4 = 2²; for M = M₂(K) as the
  regular module, Endᵣ M = M₂(K)ᵒᵖ and 4 · 4 = 16 = 4².
- For R = K × K, which is semisimple but not simple, and M = K through the first projection,
  dimₖ Endᵣ M · dimₖ R = 1 · 2 = 2 ≠ 1 = (dimₖ M)². Simplicity of R is essential.
- The modules K² and K² ⊕ K² over M₂(K) have dimensions 2 and 4 and are not isomorphic; the
  classification by dimension is an equivalence, not merely a sufficient condition.

### Examples

The column module and the regular module of M₂(K) give both sides of the dimension identity;
K × K is the non-simple control.

### Dependencies

Mathlib and Tau Ceti only. §3.2 is independent of §3.1.

## Layer 4: central simple algebras and their tensor products

### 4.1 Tensor products and scalar extension

`TauCeti.IsSimpleRing.tensorProduct` and `TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right`
(`TensorProduct.lean`, lines 185 and 227) require both factors simple and one specified factor
central over K; neither needs finite dimension. Thus L ⊗ₖ A is simple for every field
extension L/K and central simple A, without claiming L central over K.
`TauCeti.Algebra.IsCentral.baseChange` (`BaseChange.lean`, line 89) supplies centrality of
L ⊗ₖ A over L. Mathlib's `Module.finrank_baseChange` and `Module.finrank_tensorProduct` give the
dimensions. *Needs:* `TauCeti.IsSimpleRing.tensorProduct`,
`TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right`, `TauCeti.Algebra.IsCentral.baseChange`;
Mathlib `Module.finrank_baseChange`, `Module.finrank_tensorProduct`.

**Checks.**

- M₂(𝔽₂) ⊗ M₂(𝔽₂) is M₄(𝔽₂), of dimension 4 · 4 = 16. In ℂ ⊗ℝ ℍ ≃ M₂(ℂ), the complex
  dimension is 4 = 2², independently of any Brauer-group construction.
- ℂ ⊗ℝ ℂ ≅ ℂ × ℂ is not simple: both factors are simple but neither is central over ℝ, so the
  right-central hypothesis cannot be weakened to simplicity of both factors.

### 4.2 The division presentation, square dimension, and degree

`TauCeti.IsSimpleRing.exists_algEquiv_matrix_centralDivisionRing` gives A ≃ Mₙ(D), n > 0, for a
finite-dimensional central simple A, with D a finite-dimensional central division K-algebra.
`TauCeti.IsSimpleRing.isSquare_finrank` and `TauCeti.Algebra.deg` supply square dimension and
its natural square root; `TauCeti.Algebra.deg_sq`, `TauCeti.Algebra.deg_tensorProduct`, and
`TauCeti.Algebra.deg_matrix` give the square and multiplicativity laws for central simple
algebras. Scalar-extension simplicity (§4.1) precedes the algebraic-closure proof of the square
law (Stacks, Lemma 4.9, tag 074H, p. 4; Lemma 5.4, tag 074N, p. 5). *Needs:*
`TauCeti.IsSimpleRing.exists_algEquiv_matrix_centralDivisionRing`,
`TauCeti.IsSimpleRing.isSquare_finrank`, `TauCeti.Algebra.deg`, `TauCeti.Algebra.deg_sq`,
`TauCeti.Algebra.deg_tensorProduct`, `TauCeti.Algebra.deg_matrix`; §4.1.

**Checks.**

- Degrees of K, M₂(K), ℍ/ℝ, and M₂(ℍ)/ℝ are 1, 2, 2, and 4; the dimensions 1, 4, 4, and 16 are
  their squares.
- deg(ℍ ⊗ℝ ℍ) = 2 · 2 = 4 agrees with ℍ ⊗ℝ ℍ ≅ M₄(ℝ); a degree additive on tensor products would
  give 4 as the dimension and is wrong.
- ℂ over ℝ is simple of dimension 2, not a square: centrality is essential to the square law.

### 4.3 The opposite algebra

`TauCeti.Algebra.tensorOpAlgEquivEnd` and `TauCeti.Algebra.tensorOpAlgEquivMatrix` use
`IsAzumaya`, supplied for finite-dimensional central simple algebras by
`TauCeti.IsSimpleRing.isAzumaya`. The map sends a ⊗ bᵒᵖ to (x ↦ axb), and the matrix size is
dimₖ A, not its square root (Stacks, Lemma 4.10, tag 074I, p. 4). *Needs:*
`TauCeti.Algebra.tensorOpAlgEquivEnd`, `TauCeti.Algebra.tensorOpAlgEquivMatrix`,
`TauCeti.IsSimpleRing.isAzumaya`.

**Checks.**

- For ℍ, the opposite equivalence has source dimension 4 · 4 = 16 and target M₄(ℝ) of
  dimension 16; M₂(ℝ), of dimension 4, would be wrong.
- The map sends 1 ⊗ 1ᵒᵖ to the identity and i ⊗ iᵒᵖ to x ↦ ixi, which sends 1 to i² = −1
  and j to iji = ki = j. It is not the identity, and it differs from conjugation x ↦ ixi⁻¹,
  which fixes 1; the convention is multiplication by b on the right, not by b⁻¹.

### 4.4 Central-source conjugacy and centralizers

`TauCeti.skolemNoether` (`SkolemNoether.lean`, line 107) assumes the source central simple and
the ambient algebra simple and finite-dimensional; `TauCeti.exists_unit_conj_of_algEquiv`
supplies innerness of automorphisms of a finite-dimensional central simple algebra (Stacks,
Lemma 6.2, tag 074R, p. 6). `TauCeti.centralizer_isSimpleRing` and
`TauCeti.finrank_mul_finrank_centralizer` hold for central simple B in finite-dimensional simple
A, and `TauCeti.centralizer_centralizer` when A is also central. `TauCeti.centralizerAlgEquivEnd`
identifies Cₐ(B) with the endomorphism algebra of `TauCeti.Bimodule B.val` over B ⊗ₖ Aᵒᵖ, for any
subalgebra B of any algebra A. `TauCeti.tensorCentralizerAlgEquiv` sends b ⊗ c to bc for central
simple B in finite-dimensional simple A; `TauCeti.centralizer_isCentral` additionally requires A
central (Stacks, Lemma 7.2, tag 074U, p. 6).

The general dimension count is
`TauCeti.finrank_mul_finrank_centralizer_of_isSimpleRing_tensorProduct_mulOpposite`
(`Centralizer.lean`, line 318): for a nontrivial finite-dimensional K-algebra A and any
subalgebra B such that B ⊗ₖ Aᵒᵖ is simple, dimₖ B · dimₖ Cₐ(B) = dimₖ A. The simplicity
hypothesis is an instance; for simple B and central simple A it is found from
`TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right`, Mathlib's instance that the opposite of
a simple ring is simple, and Mathlib's instance that the opposite of a central algebra is
central. Neither centrality nor finite-dimensionality of B is assumed, and no separability.
`TauCeti.finrank_mul_finrank_centralizer_of_isField` (line 357) is the same count for a
subfield of a central simple A (Stacks, Theorem 7.1(2), tag 074T, p. 6). *Needs:*
`TauCeti.skolemNoether`, `TauCeti.exists_unit_conj_of_algEquiv`,
`TauCeti.centralizer_isSimpleRing`, `TauCeti.finrank_mul_finrank_centralizer`,
`TauCeti.centralizer_centralizer`, `TauCeti.centralizerAlgEquivEnd`, `TauCeti.Bimodule`,
`TauCeti.tensorCentralizerAlgEquiv`, `TauCeti.centralizer_isCentral`,
`TauCeti.finrank_mul_finrank_centralizer_of_isSimpleRing_tensorProduct_mulOpposite`,
`TauCeti.finrank_mul_finrank_centralizer_of_isField`; §4.1.

**Checks.**

- For ℂ ⊂ ℍ over ℝ, ℂ ⊗ℝ ℍᵒᵖ is simple by the right-central tensor theorem, and the general
  count gives 2 · 2 = 4 with no centrality of ℂ. The central-source count does not apply, since
  the center of ℂ has real dimension 2.
- For the upper triangular algebra B ⊂ M₂(K), B ⊗ₖ M₂(K)ᵒᵖ is not simple, since B is not, and
  the count fails: 3 · 1 = 3 ≠ 4.
- For B = M₂(K) ⊗ 1 ⊂ M₄(K), a central simple subalgebra, the centralizer is 1 ⊗ M₂(K),
  multiplication M₂(K) ⊗ M₂(K) → M₄(K) is an isomorphism, and the double centralizer is B.

### Examples

The complex subfield of ℍ separates the general count from the central-source theorems. The
tensor square of ℍ and the opposite equivalence test the degree and matrix-size conventions.

### Dependencies

Mathlib and Tau Ceti only. §4.2 uses §4.1; §4.4 uses §4.1 for the simplicity instance.

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

### 5.2 Simplicity of a centralizer

For every simple K-subalgebra B of a finite-dimensional central simple K-algebra A, prove
`centralizer_isSimpleRing`, asserting that C = Cₐ(B) is simple (Stacks, Theorem 7.1(1), tag
074T, p. 6). Centrality of C over K is not asserted. The companion count
dimₖ B · dimₖ C = dimₖ A (Theorem 7.1(2)) is consumed from §4.4 and is unchanged when Z(B)
properly contains K.

For a proof route, let R = B ⊗ₖ Aᵒᵖ and let M be A with the inclusion action. The right-central
tensor theorem makes R simple, and R is finite-dimensional over K, hence Artinian. Identify C
with Endᵣ M, whose simplicity follows from M being nonzero and finite over R. This route uses no
conjugacy theorem and no centrality of B.

*Needs:* Mathlib `Subalgebra.centralizer`, `IsArtinianRing.of_finite`;
`TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right`, `TauCeti.centralizerAlgEquivEnd`,
`TauCeti.IsSimpleRing.moduleEnd`.

**Checks.**

- For B = K ⊂ A = M₂(K), C = M₂(K); for B = A = M₂(K), C = K. Both centralizers are simple,
  and the consumed count gives 1 · 4 = 4 and 4 · 1 = 4.
- For ℂ ⊂ ℍ over ℝ, C = ℂ, and 2 · 2 = 4. Its center has dimension 2 over ℝ;
  simplicity holds but centrality over ℝ fails.
- For the diagonal algebra K × K ⊂ M₂(K), C = K × K is not simple. Although 2 · 2 = 4,
  this case must not certify the simplicity theorem: the hypothesis on B fails.
- For the upper triangular algebra B in M₂(K), C is the scalar algebra K, so
  dimₖ B · dimₖ C = 3 · 1 = 3 ≠ 4. Its double centralizer is M₂(K), of dimension 4,
  rather than B, of dimension 3; simplicity of B is essential to both conclusions.
- For K = 𝔽₂(t), L = K(s) with s² = t embedded by its regular action in M₂(K),
  C = L and 2 · 2 = 4. L/K is inseparable, so adding separability would exclude a valid case.
- The zero algebra has dimension 0 and is not simple. For B = K in the noncentral ambient
  A = ℂ over K = ℝ, the centralizer is ℂ and 1 · 2 = 2, but this example supplies no
  centrality of A.

### 5.3 Double centralizers

Prove `centralizer_centralizer`: for the same A and simple B as in §5.2, Cₐ(Cₐ(B)) = B
as K-subalgebras of A (Stacks, Theorem 7.1(3), tag 074T, p. 6). The inclusion from B into
its double centralizer follows from commutation. By §5.2, Cₐ(B) is simple, so the consumed
count of §4.4 applies to B and to Cₐ(B): dimₖ B · dimₖ Cₐ(B) = dimₖ A and
dimₖ Cₐ(B) · dimₖ Cₐ(Cₐ(B)) = dimₖ A. Cancelling the positive dimension of Cₐ(B) gives
equality of the dimensions of B and its double centralizer, hence equality of the subalgebras.
This does not require Cₐ(B) to be central over K.

*Needs:* §5.2 `centralizer_isSimpleRing`;
`TauCeti.finrank_mul_finrank_centralizer_of_isSimpleRing_tensorProduct_mulOpposite` applied to
B and to Cₐ(B), with `TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right` supplying both
simplicity instances; Mathlib `Subalgebra.le_centralizer_centralizer`,
`Subalgebra.eq_of_le_of_finrank_eq`.

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

The scalar and full matrix subalgebras give both ends of the centralizer count in every
characteristic, including 2 and 3. The complex subfield of ℍ tests noncentral B and the
conjugation orientation. The inseparable quadratic regular embedding tests the absence of a
separability restriction. Both headline centralizer conclusions and the consumed count apply to
that embedding; tensor factorization over K is a different assertion with stronger hypotheses.

### Dependencies

Mathlib and Tau Ceti through the exact contracts above, and §4.1, §4.4 for the tensor simplicity
instance and the dimension count. The tensor simplicity and module-classification route of §5.1
and the endomorphism-algebra route of §5.2 are independent; §5.3 depends on §5.2. The Brauer
group and the real classification are consumed interfaces, not inputs to these proofs.

## Layer 6: the Brauer group and splitting fields

### 6.1 The Brauer group and its division representatives

`TauCeti.BrauerGroup.instCommGroup` (`Group.lean`, line 174) is the group on
`BrauerGroup.{u, u} K`, with `TauCeti.BrauerGroup.mk_tensorProduct`, `TauCeti.BrauerGroup.mk_base`,
and `TauCeti.BrauerGroup.mk_op` specifying multiplication by tensor product, identity [K], and
inverse by the opposite algebra. `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` and
`TauCeti.BrauerGroup.nonempty_algEquiv_of_mk_eq_mk` (`Division.lean`, lines 69 and 92) give
existence and uniqueness up to K-algebra equivalence of a finite-dimensional central division
representative of each class (Stacks, Lemma 5.1, tag 074K, pp. 4–5).
`TauCeti.isBrauerTrivial_matrix` requires `NeZero n`, and `TauCeti.isBrauerTrivial_end` requires
a finite-dimensional nontrivial V; these are the trivial classes of Mₙ(K) and Endₖ(V) (Stacks,
Definition 5.2, tag 074L, p. 5). *Needs:* `TauCeti.BrauerGroup.instCommGroup`,
`TauCeti.BrauerGroup.mk_tensorProduct`, `TauCeti.BrauerGroup.mk_base`, `TauCeti.BrauerGroup.mk_op`,
`TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`,
`TauCeti.BrauerGroup.nonempty_algEquiv_of_mk_eq_mk`, `TauCeti.isBrauerTrivial_matrix`,
`TauCeti.isBrauerTrivial_end`; Mathlib `CSA`, `IsBrauerEquivalent`, `BrauerGroup`; §4.1, §4.3.

**Checks.**

- In Br(ℝ), [ℝ] is 1, [ℍ] ≠ 1, and [ℍ]² = [ℍ ⊗ℝ ℍ] = [M₄(ℝ)] = 1; [ℍᵒᵖ] = [ℍ]⁻¹ = [ℍ].
  The product [ℝ][ℝ] is [ℝ], excluding the abstract two-element group law transported by
  exchanging [ℝ] and [ℍ].
- Endₖ(K) has dimension 1 and trivial Brauer class; Endₖ(0) has dimension 0 and no CSA
  representative, so the nontriviality hypothesis cannot be dropped.
- The division representative of [M₂(ℍ)] is ℍ, and that of [M₃(ℝ)] is ℝ; two division
  representatives of one class are isomorphic, so ℍ and ℝ represent different classes.

### 6.2 Base change and splitting fields

`TauCeti.BrauerGroup.baseChange` is the homomorphism Br(K) → Br(L) for a field extension in the
same universe; its identity and tower laws are `TauCeti.BrauerGroup.baseChange_self` and
`TauCeti.BrauerGroup.baseChange_comp`, the latter with an explicit scalar tower.
`TauCeti.Algebra.IsSplittingField` (`Splitting.lean`, line 120) means that L ⊗ₖ A is Mₙ(L) for
some n. Its body permits n = 0, so the zero algebra is split in this predicate, although it has
no Brauer class. The API includes `TauCeti.Algebra.isSplittingField_congr`,
`TauCeti.Algebra.IsSplittingField.matrix`, `TauCeti.Algebra.IsSplittingField.of_isScalarTower`,
and `TauCeti.Algebra.isSplittingField_iff_deg` (the last for central simple finite-dimensional A).
Splitting of a CSA is equivalent to its class mapping to 1 by
`TauCeti.BrauerGroup.mk_mem_ker_baseChange_iff_isSplittingField` (Stacks, Definition 8.1, tag
074Y, p. 7). `TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable`
(`FiniteSeparable.lean`, line 45) supplies a finite intermediate field of the separable closure
splitting any finite-dimensional central simple A; its separability is inherited.
`TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg` supplies a splitting maximal subfield of a
finite-dimensional central division algebra D, of degree deg(D) (Stacks, Lemma 8.3, tag 0750,
and Proposition 8.5, tag 0752, p. 7). *Needs:* `TauCeti.BrauerGroup.baseChange`,
`TauCeti.BrauerGroup.baseChange_self`, `TauCeti.BrauerGroup.baseChange_comp`,
`TauCeti.Algebra.IsSplittingField`, `TauCeti.Algebra.isSplittingField_congr`,
`TauCeti.Algebra.IsSplittingField.matrix`, `TauCeti.Algebra.IsSplittingField.of_isScalarTower`,
`TauCeti.Algebra.isSplittingField_iff_deg`,
`TauCeti.BrauerGroup.mk_mem_ker_baseChange_iff_isSplittingField`,
`TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable`,
`TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg`; §4.1, §4.2, §6.1.

**Checks.**

- Splitting gives true for M₂(K)/K, false for ℍ/ℝ over ℝ, true for ℍ/ℝ over ℂ,
  and true for M₀(K)/K.
- Base change along ℝ ⊂ ℂ kills [ℍ]: ℂ ⊗ℝ ℍ ≅ M₂(ℂ). Base change along the identity
  ℝ ⊂ ℝ fixes it, by the identity law.
- The maximal subfield ℂ ⊂ ℍ has degree 2 = deg ℍ over ℝ and splits ℍ; ℝ itself, of degree 1,
  does not.

### 6.3 The index

`TauCeti.Algebra.index` is defined for finite-dimensional central simple A as the degree of its
division representative. `TauCeti.Algebra.index_eq_deg_of_algEquiv_matrix` requires a
positive-size presentation; `TauCeti.Algebra.index_pos`, `TauCeti.Algebra.index_dvd_deg`,
`TauCeti.Algebra.isSplittingField_self_iff_index_eq_one`, and
`TauCeti.Algebra.exists_isSplittingField_finrank_eq_index` give its basic arithmetic API. *Needs:*
`TauCeti.Algebra.index`, `TauCeti.Algebra.index_eq_deg_of_algEquiv_matrix`,
`TauCeti.Algebra.index_pos`, `TauCeti.Algebra.index_dvd_deg`,
`TauCeti.Algebra.isSplittingField_self_iff_index_eq_one`,
`TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`; §4.2, §6.1, §6.2.

**Checks.**

- Degree and index of K, M₂(K), ℍ/ℝ, and M₂(ℍ)/ℝ are respectively (1,1), (2,1), (2,2),
  and (4,2); the index divides the degree in each case, and equals 1 exactly for the split
  algebras.
- The presentation M₂(ℍ) ≃ M₂(ℍ) over the division algebra ℍ gives index deg ℍ = 2. The
  presentation M₂(ℍ) ≃ M₁(M₂(ℍ)) is not admissible, since its coefficient algebra is not a
  division ring; reading the degree of the coefficient there would give 4, the degree, not
  the index.

### 6.4 Finite and real base fields

`TauCeti.subsingleton_brauerGroup_of_finite` (`Trivial.lean`, line 247) gives triviality of the
Brauer group of every finite field. `TauCeti.Quaternion.brauerGroupMulEquiv` (`Real.lean`,
line 102) identifies `BrauerGroup.{0, 0} ℝ` with `Multiplicative (ZMod 2)`, taking [ℍ] to the
multiplicative image of 1. *Needs:* `TauCeti.subsingleton_brauerGroup_of_finite`,
`TauCeti.Quaternion.brauerGroupMulEquiv`; §6.1.

**Checks.**

- ℂ is simple over ℝ but not central: its center has real dimension 2, while the scalars
  have dimension 1, so ℂ represents no class of Br(ℝ). Likewise 𝔽₄ is a division algebra
  but not central over 𝔽₂; central finite-field division representatives have dimension 1.
- The equivalence sends [ℝ] to the identity and [ℍ] to the generator; a map sending [ℍ] to the
  identity would not be injective.

### Examples

Br(ℝ) with its two classes and Br(𝔽_q) = 1 are the worked cases; ℂ and 𝔽₄ are the
non-central controls.

### Dependencies

Mathlib and Tau Ceti only, with §4.1–4.3 for the tensor, degree, and opposite inputs; §6.2
uses §6.1, and §6.3 uses §6.1–6.2.

## Downstream consumers

- CharacterTheory, Layer 2 and its Layer 2.5 indexing, consumes Layer 1 (the A-linear Schur
  collapse and isotypic components) and Layer 2 (the positive-size block/simple-module
  dictionary); its split dimension sum consumes Mathlib directly. For a finite group G over an
  algebraically closed field k with `NeZero (Nat.card G : k)`, Maschke and the dimension of
  k[G] give ∑ᵢ nᵢ² = |G|. For C₁, C₂, and S₃ in characteristic zero the sums are 1,
  1 + 1 = 2, and 1 + 1 + 4 = 6; in characteristic 2 the hypothesis for C₂ fails and k[C₂]
  has nonzero square-zero augmentation ideal.
- InductionRestriction consumes Layers 1–2 for the simple-module/block dictionary of a split
  group algebra.
- QuiverRepresentations consumes Layer 0 (the Jacobson radical) and Layer 2 (Wedderburn) for
  the finite-dimensional-algebra frame.
- LieHighestWeight consumes the isotypic components of Layer 1 through its enveloping-algebra
  dictionary.
- QuadraticFormInvariants consumes Layer 4 (tensor products of central simple algebras and the
  opposite-algebra package) and Layer 6 (trivial classes, the group law, and finite separable
  splitting).
- ClassicalArithmeticCompletion consumes Layers 1–2, Layer 5 (Skolem–Noether), and Layer 6
  (base change, finite separable and maximal-subfield splitting, and the Brauer groups of finite
  fields and of ℝ).
- FaltingsFinitenessAndIsogenyTheoremsPartII consumes Layers 2–3 and Layer 6, including the
  index.
- ReductiveGroups, Layer 1, uses representations and their endomorphism algebras; it supplies
  no prerequisites to the algebra theory here.

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
