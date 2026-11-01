# Roadmap: root systems, Weyl groups, and the Cartan–Killing classification

**Summary.** Starting with native finite root pairings, bases, Cartan classification,
numbered integral root data and Weyl chambers, complete the Coxeter presentation on
specified simple reflections. Develop the based complement in root automorphism
groups, its full integral root-datum form, componentwise invariant metrics and
highest-root theory. The endpoints include the length–inversion formula, the
semidirect decomposition of root automorphisms, the unique greatest positive root,
and concrete Weyl groups of types A and G₂.

## Scope and ownership

This roadmap owns the remaining root-system conclusions above. Mathlib supplies
root pairings, bases, integral coordinates, root strings and abstract Coxeter
systems. Tau Ceti supplies positive roots, lowering, inversions, exchange,
chambers, the longest element, Bruhat order, Poincaré polynomials, finite Cartan classification and the numbered
simply connected root data. These are inputs, not construction targets here.
In particular there is one native `TauCeti.DynkinType`, one standard Cartan family
and one integral datum per valid type; no second enumeration or transport to a
local copy is needed. The exported `DynkinType` in Suggested.lean denotes that
same native type for consumers using this namespace. The exports of its constructors,
rank, validity and long-root predicate are names for the native declarations, not new definitions.

[LieHighestWeight, Layers 1–2](../LieHighestWeight/README.md#layer-2-weights-of-a-module-and-their-integrality)
owns the representation-theoretic weight lattices, fundamental and dominant
weights; its Layer 6 owns the Weyl character and dimension formulas.
[ReflectionInvariantTheory, §4](../../ReflectionInvariantTheory/README.md#4-crystallographic-weylcoxeter-dictionary)
owns exponents, invariant degrees and their product formulas. Its §3 owns the
hyperplane-arrangement development for general finite real reflection groups;
our chambers are the native algebraic cones.
[RootSystemsPartII, §§2–4](../../RootSystemsPartII/README.md) extends the base
roadmap to folds, fixed Weyl groups and equivariant integral dominance; it is not
an input here. [ReductiveGroups, §9A.1a-L](../../ReductiveGroups/README.md) owns
kernel-fixing ADE cover lifts. [ZigzagPreprojective, Layer 0](../../ZigzagPreprojective/README.md)
owns affine diagrams, quivers and gradings. No stuck-position classification is
attributed to it. Computational enumeration and general games on arbitrary
integer vectors are outside this roadmap.

## Conventions

Use `RootPairing ι R M N`, with its perfect pairing and injective root and coroot
families. `RootPairing.IsRootSystem` asserts spanning of both modules; it does not
assert finiteness, reducedness or crystallographicity. Unless a subsection says
otherwise, assume a commutative characteristic-zero domain R, finite ι, spanning,
reducedness, crystallographicity, and a chosen base b. Irreducible statements
add `RootPairing.IsIrreducible`; this native predicate includes nontriviality of
both modules. Geometric and metric statements use ℝ. Full integral data use
`RootDatum` with both lattices finite free over ℤ and do not assume integral
spanning. The empty spanning system is allowed except in irreducible statements.

Cartan entries have root rows and coroot columns: Cᵢⱼ = ⟨αᵢ,αⱼ∨⟩. A coefficient
vector is a column; reflection changes its i-th entry by subtracting Σⱼ Cⱼᵢcⱼ.
The native Bourbaki node k is at zero-based index k−1. Bₙ has short last root,
Cₙ long last root; G₂ has short first root and matrix `!![2, -1; -3, 2]`.
Root lengths in this document are squared lengths. The positive cone uses
nonnegative **integer** simple-root coordinates. Weyl multiplication acts on
the left; inversions of w are the positive roots sent negative by w.
The forward cocharacter map of a root-pairing equivalence is the inverse of its
contravariant `RootPairing.Equiv.coweightEquiv`.

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

- `RootPairing`, `RootDatum`, `RootPairing.IsRootSystem`, and the reflection
  identities in `Mathlib/LinearAlgebra/RootSystem/Defs.lean`; add finiteness and
  the three other predicates explicitly when needed.
- `RootPairing.IsCrystallographic` and `RootPairing.pairingIn` in
  `Mathlib/LinearAlgebra/RootSystem/IsValuedIn.lean`; integral pairings under the
  characteristic-zero domain hypotheses. `RootPairing.IsReduced` and
  `RootPairing.IsIrreducible` are in `Reduced.lean` and `Irreducible.lean` in that directory.
- `RootPairing.Base.toWeightBasisInt`, `RootPairing.Base.IsPos` and
  `RootPairing.Base.height` in `Mathlib/LinearAlgebra/RootSystem/Base.lean`.
  The basis is on `RootPairing.rootSpan` over ℤ, not the whole weight lattice;
  `RootPairing.rootSpanMem` embeds each root into that span.
- `RootPairing.Base.cartanMatrix` and `RootPairing.Base.equivOfCartanMatrixEq` in
  `Mathlib/LinearAlgebra/RootSystem/CartanMatrix.lean`; the latter compares
  finite reduced crystallographic spanning systems over characteristic-zero domains.
- `RootPairing.chainTopCoeff`, `RootPairing.chainBotCoeff` and
  `RootPairing.root_add_nsmul_mem_range_iff_le_chainTopCoeff` in
  `Mathlib/LinearAlgebra/RootSystem/Chain.lean`; use the native independent-root
  hypotheses when interpreting a root string.
- `RootPairing.InvariantForm` in `Mathlib/LinearAlgebra/RootSystem/RootPositive.lean`,
  its symmetric bilinear form, nonzero root self-values and reflection invariance; positive definiteness
  is an additional hypothesis. `RootPairing.posRootForm` in
  `Mathlib/LinearAlgebra/RootSystem/Finite/CanonicalBilinear.lean` supplies the canonical form;
  `RootPairing.posRootForm_rootFormIn_posDef` in `Finite/Nondegenerate.lean` proves
  positive definiteness on the root span.
- `RootPairing.Equiv.indexHom`, `RootPairing.Equiv.weightHom` and
  `RootPairing.Equiv.coweightHom` in `Mathlib/LinearAlgebra/RootSystem/Hom.lean`;
  the last has opposite-group target. `RootPairing.weylGroup` and
  `RootPairing.weylGroup.ofIdx` are in `WeylGroup.lean` in that directory.
- `CoxeterSystem`, `CoxeterSystem.simple`, `CoxeterMatrix.Group` and
  `CoxeterSystem.lift` in `Mathlib/GroupTheory/Coxeter/Basic.lean`, and
  `CoxeterSystem.length` in `Length.lean` in that directory.
- `MulAction.stabilizer`, `Subgroup.comap` and `Subgroup.IsComplement'` supply
  setwise stabilizers and subgroup complements; `SemidirectProduct.mulEquivSubgroup`
  in `Mathlib/GroupTheory/SemidirectProduct.lean` turns a complement with a normal
  factor into the conjugation semidirect product. No replacement generic API is required.

### From Tau Ceti

Paths in this subsection are relative to Tau Ceti; all preserve their native hypotheses.

- `TauCeti.posRoots`, `TauCeti.negRoots` in
  `TauCeti/LinearAlgebra/RootSystem/Positive.lean`, and
  `TauCeti.exists_mem_support_height_reflectionPerm_lt` in `Lowering.lean` in that
  directory: finite, reduced, crystallographic, characteristic-zero domain; a
  positive nonsimple root stays positive and strictly lowers under some simple reflection.
- `TauCeti.inversions` in `TauCeti/LinearAlgebra/RootSystem/Inversions/Basic.lean`,
  `TauCeti.ncard_inversions_mul_ofIdx` in `Inversions/Exchange.lean`, and
  `TauCeti.exists_wordProd_eraseIdx_eq_mul_ofIdx` in `Inversions/StrongExchange.lean`:
  the root-level deletion and inversion-count statements, before any presentation isomorphism.
- `RootPairing.weylGroupToPerm_injective` and `RootPairing.finite_weylGroup` in
  `TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean`, with finite spanning root-system hypotheses.
- `TauCeti.coxeterMatrixOfBase` in `TauCeti/LinearAlgebra/RootSystem/Coxeter/Matrix.lean`,
  and `TauCeti.weylGroup_eq_closure_simple` in `SimpleReflections.lean` in the root-system directory.
  `TauCeti.weylCoxeterHom`, `TauCeti.weylCoxeterHom_apply_simple` and
  `TauCeti.weylCoxeterHom_surjective` in `Coxeter/Presentation.lean` give the
  homomorphism from the native presented group, its generator equation and surjectivity.
  Injectivity is the remaining assertion in §1.1.
- `CoxeterSystem.strongExchange` in `TauCeti/GroupTheory/Coxeter/StrongExchange.lean` and
  `TauCeti.matsumoto` in `TauCeti/GroupTheory/Coxeter/Matsumoto.lean` give abstract
  Coxeter exchange and reduced-word independence under the braid relations.
- `CoxeterSystem.BruhatLE` and `CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq`
  in `TauCeti/GroupTheory/Coxeter/Bruhat.lean` supply the partial order and
  reduced-subword criterion; `TauCeti.poincarePolynomial` and
  `TauCeti.poincarePolynomial_eq_sum` in `TauCeti/GroupTheory/Coxeter/Poincare.lean`
  supply the length-generating polynomial for any finite Coxeter group.
- `RootPairing.dominantChamber` in `TauCeti/LinearAlgebra/RootSystem/Chamber.lean`;
  `TauCeti.smul_eq_self_of_smul_mem_dominantChamber` and
  `TauCeti.stabilizer_eq_closure_wallReflections` in `FundamentalDomain.lean`;
  `RootPairing.openDominantChamber` and `TauCeti.openWeylChamber` with chamber
  freeness, transitivity and covering in `Weyl/Chamber.lean`. Use ordered
  coefficients and reduced dual pairing as required by these declarations.
- `TauCeti.longestElement`, `TauCeti.inversions_longestElement` and
  `TauCeti.longestElement_sq` in `TauCeti/LinearAlgebra/RootSystem/LongestElement.lean`.
  The supplied length invariant is inversion cardinality; §1.2 compares it to Coxeter length.
- `TauCeti.DynkinType`, `TauCeti.DynkinType.Valid`, `TauCeti.HasCartanType` and the
  native Cartan matrices in `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean`;
  `TauCeti.IsFiniteType` in `FiniteType/Basic.lean`, and
  `TauCeti.existsUnique_dynkinType` in `FiniteType/Classification.lean` in the same
  directory. Classification assumes nonempty irreducible finite reduced
  crystallographic spanning systems. Finite type means a generalized Cartan
  matrix with positive rational diagonal symmetrizer and positive-definite symmetrization.
- `TauCeti.DynkinType.numRoots` in `TauCeti/LinearAlgebra/RootSystem/NumberOfRoots.lean`,
  `TauCeti.DynkinType.rootLength` and `TauCeti.DynkinType.IsLongSimpleRoot` in
  `RootLength.lean`; the lengths satisfy the root-row Cartan convention.
- `TauCeti.DynkinType.simplyConnectedRootDatum`, `TauCeti.DynkinType.simplyConnectedBase`,
  `TauCeti.DynkinType.simpleIndex` and
  `TauCeti.DynkinType.hasCartanType_simplyConnectedRootDatum` in
  `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Assembly.lean`;
  `TauCeti.DynkinType.rationalRootSystem`, `TauCeti.DynkinType.rationalBase` and
  `TauCeti.DynkinType.hasCartanType_rationalRootSystem` in `Rational.lean` in that
  directory. Roots use `Fin t.numRoots`, both lattices use `Fin t.rank → ℤ`,
  character coordinates are fundamental weights, and cocharacter coordinates
  are simple coroots. `TauCeti.rootPairingBaseChange` in
  `TauCeti/LinearAlgebra/RootSystem/BaseChange.lean` is the dot-product base change.
- `TauCeti.DynkinType.diagramSymmetry`, `TauCeti.DynkinType.rationalDiagramAut`,
  `TauCeti.DynkinType.diagramAut` and `TauCeti.DynkinType.diagramAutHom` from
  `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/DiagramAutomorphism.lean`
  and its imports give the numbered diagram action, with its simple-root and
  coordinate equations. The converse based-automorphism identification is §2.2.
- `RootPairing.InvariantForm.two_mul_apply_root` in
  `TauCeti/LinearAlgebra/RootSystem/InvariantForm/Basic.lean` gives
  2B(x,αⱼ) = ⟨x,αⱼ∨⟩B(αⱼ,αⱼ), used in §3.2.

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
  a base: opposite-sign nonzero coordinates have norm at least 10. Both
  embeddings are injective and reflection is an integral isometry. The root
  (1,1) has height 2, but its simple reflections (2,1) and (1,2) have height 3.
  Iterating s₁s₂ on (1,0) gives (8,3), (55,21), (377,144); finiteness cannot
  be dropped from lowering. In A₂, (1,1) instead lowers to height 1.
- In A₁ the closed chamber is [0,∞); reflection fixes 0 but sends 1 to −1.
  Thus uniqueness of a dominant representative does not imply a trivial wall
  stabilizer. The longest element is reflection, has one inversion and squares to 1;
  in rank zero it is identity and has zero inversions.

## How to read the build

Layer 1 completes the marked presentation using the supplied root exchange theory.
Layer 2 uses native chambers for automorphism complements and then retains the
full integral lattices. Layer 3 develops components and metrics independently of
the presentation. Layer 4 uses native integral coordinates and root strings for
greatest roots. Layer 5 identifies concrete Weyl groups. Classification and the
numbered family supply all these layers directly; none is a premise for rebuilding them.

## Layer 1: the marked Coxeter presentation

### 1.1 Completeness of the relations

For the standing finite reduced crystallographic spanning pairing over a
characteristic-zero domain, prove `exists_marked_weylCoxeterSystem`: there is
cs on `TauCeti.coxeterMatrixOfBase P b` with cs.simple i equal to the actual
reflection `RootPairing.weylGroup.ofIdx P i` for every simple index. Prove
injectivity of the supplied homomorphism; combine it with surjectivity to obtain
this marked system (Milne C.22, p. 612, milne17 line 25096).
A route uses root exchange to compare minimal reflection words with abstract
reduced words; every word in the kernel must reduce to the empty word by the
Coxeter relations. Faithfulness of the Weyl action alone does not prove this.
*Needs:* native Coxeter homomorphism and generator equation; root deletion;
abstract strong exchange and Matsumoto.

### 1.2 Length and reduced expressions

For every such marked cs and every w, prove `length_eq_inversions`:
cs.length w equals the number of positive roots made negative by w. Deduce that
reduced words are precisely minimal simple-reflection expressions, that the
native longest element has length the positive-root count. Identify the
coefficients of the native Poincaré polynomial with counts by inversion
cardinality, and express its native Bruhat subword criterion using the actual
simple reflections (Bourbaki, Chapter VI §1, no. 6; Björner–Brenti,
§2.2 and Theorem 3.3.1). *Needs:* §1.1; inversion exchange;
`CoxeterSystem.length`; native longest element; abstract Matsumoto.

### Examples

- In A₂, swapping the two abstract generators preserves all lengths but sends
  α₁ to α₁+α₂ at generator 0 instead of −α₁. The marking in §1.1 excludes it.
- In A₂, 1, s₁, s₁s₂, s₁s₂s₁ have lengths and inversion counts 0,1,2,3;
  s₁s₁ has both values 0. The polynomial is 1+2q+2q²+q³.
- In rank zero both groups have one element, the marking is empty, and the
  length polynomial is 1. In A₁ it is 1+q.

### Dependencies

Only the Mathlib and Tau Ceti contracts for root exchange and abstract Coxeter
systems; no chamber or classification proof depends on this layer.

## Layer 2: root automorphisms and the based complement

### 2.1 The actual base stabilizer

Define `basedAut` as the inverse image under the native index homomorphism of
the setwise stabilizer of b.support. For finite reduced crystallographic
spanning real pairings, prove `weyl_based_complement`: W complements that
subgroup in the full root-pairing automorphism group (SGA 3 XXI, Prop. 6.7.2,
sga3iii line 1374; Milne C.53, p. 624). *Needs:* native set stabilizer and comap;
chamber covering, freeness and transitivity; transport of base inequalities.

- Membership is exactly g.indexEquiv '' b.support = b.support; identity,
  composition and inverse preserve the support.
- Prove that a root automorphism carries positive systems and open chambers
  to positive systems and open chambers, using the actual coroot inequalities;
  preservation of the base is equivalent to preservation of the open chamber
  (SGA 3 XXI, Prop. 6.1.3, sga3iii line 1051).
- Prove normality by conjugating each generating reflection to the reflection
  at its image root (SGA 3 XXI, Lemma 6.7.1, sga3iii line 1368).
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
  rank-one integral datum the base stabilizer instead has order 2, as in §2.3.

### 2.2 Oriented diagrams and actual isogeny lattices

For a finite reduced crystallographic spanning system, identify its based
subgroup with the permutations of its simple support preserving every Cartan
entry. Use the native diagram automorphisms on the simply connected family
for existence and determination on a base for uniqueness (SGA 3 XXI,
Cor. 7.3.4, Cor. 7.4.5 and Rem. 7.4.6, sga3iii lines 1627, 1654, 1660).
For the full integral version this unrestricted diagram identification applies
to semisimple simply connected or adjoint data. For intermediate isogeny forms,
restrict to diagram automorphisms preserving the **actual dual lattices**.
*Needs:* §2.1; native classification, diagram actions and Cartan determination.

Define the lattice-preserving subgroup by the two equations g(X₀)=X₀ and
(g.coweightEquiv)⁻¹(Y₀)=Y₀ for specified dual integral lattices in the rational
pairing. Here the lattices are finite free ℤ-submodules spanning the rational
spaces, the pairing restricts to perfect ℤ-duality, and they contain all roots
and coroots respectively. This is the intersection of the inverse images of their native setwise
stabilizers, using the forward weight and cocharacter actions.

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

### 2.3 Full integral data and central directions

For finite reduced crystallographic `RootDatum` with both lattices finite free,
prove `full_datum_complement`. Construct its rational scalar extension with
maps from both lattices, preserving the perfect pairing, roots, coroots, base
and reflections. Build the chamber argument on the root span and its cylinder
in the ambient rational space. Retain the central/derived lattice gluing; an
integral direct-sum decomposition is not assumed (SGA 3 XXI, Prop. 6.7.2,
sga3iii line 1374; Milne C.43 and C.51, pp. 617, 620).
*Needs:* §2.1's base-transport argument; §2.2's lattice restriction;
finite-free scalar extension and duality in Mathlib.

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

Native chamber geometry, classification, diagram actions and Mathlib subgroup
complements; full integral data additionally need §2.3's general scalar extension.

## Layer 3: invariant metrics and root lengths

### 3.1 Irreducible components

For a finite reduced crystallographic spanning real pairing and base, take the
connected components of the graph on b.support whose distinct vertices are
adjacent when Cᵢⱼ≠0. Define each component space as the real span of its simple
roots and give it the restricted root/coroot pairing (Milne C.23, p. 612,
milne17 line 25102). *Needs:* native Cartan entries and simple-root basis;
Mathlib graph components and submodules; `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix`
in `TauCeti/LinearAlgebra/RootSystem/FiniteType/Irreducible.lean`.

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

### 3.2 Positive invariant forms and squared lengths

Prove `invariantMetric_unique_scale` for a finite irreducible spanning real
root pairing: any positive-definite invariant forms B,C satisfy C=cB for a
unique real c>0. Reducedness and crystallographicity are not needed for this
statement. A route uses the invariant-form identity and irreducibility of the
reflection representation (Milne Appendix C(g), p. 621, milne17 line 25421;
native `RootPairing.InvariantForm.two_mul_apply_root`).
*Needs:* native invariant forms, irreducibility, positive definiteness and spanning.

For the reduced crystallographic case prove `squared_lengths_two_values`:
there are s>0 and r∈{1,2,3} with each squared root length equal to s or rs.
Refine this componentwise using the native Dynkin type: r=1 for A,D,E, r=2
for B,C,F₄, and r=3 for G₂; both values occur in nonsimply-laced types
(Milne C(g), table (180), pp. 621–622, milne17 line 25438, and C.56).
*Needs:* §3.1; unique scaling; native classification and length tables;
simple-root lowering and reflection invariance.

Relative to the canonical positive form on each component, construct the
bijection between invariant positive-definite forms and one positive real
scale per component. Restriction and orthogonal reconstruction must be inverse;
prove compatibility with component reindexing and root-pairing equivalences.
Ordinary length ratios are √r, so the squared-length convention is essential.

**Checks.**

- In A₁, B(x,y)=xy and C(x,y)=3xy give the unique scale c=3; c=0
  fails positivity and c=2 fails equality at (1,1).
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

Mathlib invariant forms, bases and graph components; native classification and
root-length tables. This layer does not consume the Coxeter presentation.

## Layer 4: coefficient reflections and the greatest root

### 4.1 Integral coordinates and reflection orbits

Use `RootPairing.Base.toWeightBasisInt` on the root lattice. For Cᵢⱼ=⟨αᵢ,αⱼ∨⟩,
construct the integral linear reflection on simple-root coefficient columns:
its k-th entry is cₖ−δₖᵢΣⱼCⱼᵢcⱼ. Evaluation into the root lattice intertwines
this map with the actual reflection. Thus with A=2I−Cᵀ the changed coordinate
is ΣⱼAᵢⱼcⱼ−cᵢ (SGA 3 XXI, §1.1.1–§1.1.2, formulas (1)–(3)).
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

Prove `existsUnique_greatest_positive_root` for an irreducible finite reduced
crystallographic spanning system over a characteristic-zero domain: there is
one positive root θ whose integral simple coefficients dominate those of every
positive root. This is a greatest element, not merely a maximal one (Milne
C.24, p. 612, milne17 line 25111). Compare it with the root-string highest-root
characterization. Every strictly positive integer weighting of the coefficients
has θ as its unique maximum. *Needs:* native basis coordinates; root strings;
irreducibility and native classification, or the chamber proof of highest-root existence.

In the simply-laced case, prove that every other positive root admits a simple
reflection increasing height by exactly one, and that every maximal sequence
of such steps ends at θ. Positions are roots; finiteness bounds strictly
increasing sequences. In other types retain the root-string membership test
for addition of a simple root; reflection may increase a coefficient by 2 or 3
(Bourbaki, Chapter VI §1, nos. 3 and 8).
*Needs:* §4.1; greatest-root theorem; native root strings and chamber uniqueness.

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

Native integral coordinates, root strings, lowering, chambers and numbered
families; this layer does not require a computational root enumeration.

## Layer 5: concrete Weyl groups

### 5.1 Type A

For the standing system with base of native type Aₙ, n≥1, prove
`weylGroup_equiv_perm_of_typeA`. On the sum-zero model with roots eᵢ−eⱼ
in rank n+1 coordinates, identify the simple reflections with adjacent
transpositions, then transport to an arbitrary based system of that Cartan
type. Prove order (n+1)! and positive-root count n(n+1)/2
(Milne C.16 and C.25, pp. 611–613). *Needs:* native classification and Cartan
comparison; §1.1; the sum-zero realization and its marked simple roots.

### 5.2 Type G₂

For a finite spanning `RootPairing.IsG2` system over a characteristic-zero
domain, prove `weylGroup_equiv_dihedral_of_isG2`: its base has native G₂ Cartan
type and its Weyl group is `DihedralGroup 6`. Fix the short-first Bourbaki
orientation, six positive roots and longest length 6 (Milne Appendix C(g),
rank-two diagrams, p. 622). *Needs:* native G₂ predicate and rank-two Cartan
constraints; §1.1–§1.2; native classification and longest element.

### Examples

A₁ gives S₂ of order 2, A₂ gives the nonabelian S₃ of order 6, and G₂ gives
a dihedral group of order 12 with reflection product of order 6. The G₂
Cartan off-diagonals are −1,−3; their product 3 gives Coxeter order 6.

### Dependencies

The native finite classification, numbered family and marked presentation.

## Downstream consumers

LieHighestWeight Layers 2 and 6 consume the root and chamber vocabulary for
integral weights and character formulas. ClassicalGroups Layer 3 consumes the
classical Weyl groups. CFSGStatement workstreams L0–L1 consume the native
numbered integral data. LieGroups Layer 6 consumes the finite Weyl action for
maximal tori; its Layer 8 consumes lengths for Bruhat cell dimensions.
ReductiveGroups §9A.1a-L consumes the based-automorphism comparison for ADE
cover lifts. These are consumers, not prerequisites for the root-system proofs.

## References

- J. S. Milne, *Algebraic Groups*, 2017, Appendix C, especially C.19–C.25,
  C.43, C.51, C.53 and C.56, pp. 611–626; source id milne17,
  [author's edition](https://www.jmilne.org/math/Books/iAG2017.pdf).
- M. Demazure, *SGA 3*, Tome III, Exposé XXI, §§1.1, 6.1, 6.7, 7.3–7.4;
  source id sga3iii, [Gille–Polo re-edition, 13 October 2024](https://webusers.imj-prg.fr/~patrick.polo/SGA3/Exp21-13oct24.pdf).
  Proposition numbers above refer to this edition.
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4–6*, Springer, 2002,
  Chapter VI §1, nos. 3, 6, 8, and §4, Planches I–IX; source id bourbaki46.
- A. Björner and F. Brenti, *Combinatorics of Coxeter Groups*, Springer GTM 231,
  2005, §2.2 and Theorem 3.3.1; source id bjornerbrenti05.
