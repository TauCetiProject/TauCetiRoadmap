# Roadmap: root systems, Weyl groups, and the Cartan-Killing classification

**Summary.** Complete the connection between finite crystallographic root systems
and Coxeter presentations, using the native root combinatorics, chambers, Dynkin
classification and numbered integral models. Develop the sign theory and faithful
geometric representation of arbitrary Coxeter systems, including infinite rank
and infinite exponents. The end results are the marked Weyl presentation with its
length formula, classification independent of the chosen base, the rational
classification up to isomorphism, and the symmetric-group realization of type A.

## Scope and ownership

This roadmap owns the general root-system/Weyl-group comparison and the general
Coxeter geometric sign and faithfulness theorems. The material already in Mathlib
and Tau Ceti is consumed through the contracts below: positive roots, lowering,
inversions, simple generation, the presentation homomorphism and its surjectivity,
abstract exchange and Matsumoto, closed and open chambers, longest elements,
classification of based Cartan matrices, and numbered integral and rational models.
These are not additional construction targets. The additional presentation result
is injectivity of the specified homomorphism; the additional classification result
makes the type independent of a base and invariant under an unbased isomorphism.
The rank-two dihedral Weyl identifications are also supplied by Tau Ceti.

RepresentationTheory/LieHighestWeight, Layers 1–2 (root-space and weight lattices),
owns the general weight-lattice and highest-weight apparatus. The numbered simply
connected models used here are the native models, not a second lattice theory.
RootSystemsPartII §§1–3 owns integral dominance, the Stembridge step and finite
diagram folding. ReflectionInvariantTheory §4 owns invariant degrees, Coxeter
exponents and their root-height comparison. None is an input to the general
Coxeter geometric theorem.

The ownership boundary with EnriquesSurfaces §5.2 places the general arbitrary-index
geometric sign, faithfulness and integral comparison results here in §1. Enriques
surface geometry, the T246 lattice, its specified integral reflections, its
mod-two action and its congruence kernels belong to EnriquesSurfaces §5.2. The
required direction is from these general results to that lattice application;
no surface or T246 theorem is a supplier here.

## Conventions

A finite root-pairing statement uses `P : RootPairing ι R V U`, where R is a
commutative characteristic-zero domain and V,U are R-modules with additive group
structures. Finiteness of ι, crystallographicity and reducedness are explicit
hypotheses. Spanning (`RootPairing.IsRootSystem`) and irreducibility are required
only where stated. Classification of irreducible types also requires nonempty ι:
the empty system has rank zero and is not a valid irreducible Dynkin type.
Chamber statements use real coefficients, or the explicitly specified ordered
coefficient ring in the supplier contract.

The root and coroot families are indexed by ι; simple roots by `b.support` for
`b : P.Base`. Cartan entry (i,j) is the pairing of root i with coroot j. In the
numbered simply connected model, character coordinates are fundamental-weight
coordinates, cocharacter coordinates are simple-coroot coordinates, and the
simple root i is row i of the Cartan matrix. Bourbaki label i corresponds to
zero-based index i−1. Type B₂ has matrix [[2,−2],[−1,2]], whereas G₂, short root
first, has [[2,−1],[−3,2]]. Roots and coordinates have different index sets: A₁
has two roots in one coordinate, A₂ six roots in two, and G₂ twelve roots in two.

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

## Exact supplier contracts

### From Mathlib

- `RootPairing` in `Mathlib/LinearAlgebra/RootSystem/Defs.lean` bundles a perfect
  pairing, injective root and coroot families, reflection permutations, and the
  diagonal pairing 2. It does not assert finiteness, spanning, reducedness or
  crystallographicity. `RootPairing.ne_neg` excludes a singleton root-index set
  in characteristic zero. `RootPairing.IsRootSystem` adds spanning of both
  families; irreducibility does not replace the nonempty hypothesis used here.
- `RootPairing.Base` in `Mathlib/LinearAlgebra/RootSystem/Base.lean` has finite
  support, independent simple roots and coroots, and separately signed natural
  expansions for each family. It does not assert a finite root set.
  `RootPairing.Base.IsPos`, `RootPairing.Base.height` and
  `RootPairing.Base.IsPos.reflectionPerm` supply signs, heights and preservation
  under a simple reflection away from its own root. `RootPairing.nonempty_base`
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
  `RootPairing.Base.supportMapEquiv`; it needs crystallographic pairings over a
  characteristic-zero commutative ring, but neither finite root indices nor a domain.
- `RootPairing.RootPositiveForm.posForm` and
  `RootPairing.RootPositiveForm.rootLength` in
  `Mathlib/LinearAlgebra/RootSystem/RootPositive.lean` are the positive-form and
  squared-length operations. The canonical positive form on the finite root span
  comes from `RootPairing.posRootForm` in
  `Mathlib/LinearAlgebra/RootSystem/Finite/CanonicalBilinear.lean`;
  `RootPairing.posRootForm_rootFormIn_posDef` in
  `Mathlib/LinearAlgebra/RootSystem/Finite/Nondegenerate.lean` supplies positive
  definiteness on the root span.
- `RootPairing.weylGroup`, `RootPairing.weylGroup.ofIdx`, and
  `RootPairing.weylGroupToPerm` in
  `Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean` supply the actual subgroup of
  root-pairing automorphisms, its reflections and root-index action.
- `CoxeterMatrix`, `CoxeterMatrix.Group`, `CoxeterMatrix.toCoxeterSystem`,
  `CoxeterSystem.lift`, `CoxeterSystem.wordProd`,
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
  `Finsupp.lmapDomain` and `Finsupp.linearEquivFunOnFinite` in
  `Mathlib/LinearAlgebra/Finsupp/Defs.lean` give coordinate transport.

### From Tau Ceti

- In `TauCeti/LinearAlgebra/RootSystem/Positive.lean`, `TauCeti.posRoots` and
  `TauCeti.negRoots` are the native positive and negative index sets.
  `TauCeti.exists_mem_support_height_reflectionPerm_lt` in `Lowering.lean`
  requires finite root indices, a characteristic-zero domain, crystallographicity
  and reducedness. A positive nonsimple root remains positive and strictly loses
  height under some simple reflection. `TauCeti.inversions` in
  `Inversions/Basic.lean` consists of positive indices whose images are negative.
  `TauCeti.ncard_inversions_mul_ofIdx` in `Inversions/Exchange.lean` gives the
  one-step change under the same finite reduced crystallographic hypotheses.
  `TauCeti.isLeast_ncard_inversions` in `Inversions/Length.lean` identifies the
  inversion count with the least length of a word in the actual simple reflections;
  `TauCeti.image_root_inversions` and
  `TauCeti.ncard_inversions_eq_ncard_vector_inversions` in `Inversions/Basic.lean`
  identify index inversions with their root-vector images and cardinalities.
  The least-length result does not identify that length with the length in a presented group.
- `RootPairing.weylGroupToPerm_injective` and `RootPairing.finite_weylGroup` in
  `TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean` supply root-action
  faithfulness for spanning root systems over any commutative ring; adding
  finite root indices gives finiteness of the Weyl group. Finiteness of a positive-root set is the generic
  `Set.toFinite` on a finite index type.
- `TauCeti.weylGroup_eq_closure_simple` in `SimpleReflections.lean`,
  `TauCeti.coxeterMatrixOfBase` in `Coxeter/Matrix.lean`, and
  `TauCeti.weylCoxeterHom`, `TauCeti.weylCoxeterHom_apply_simple`,
  `TauCeti.weylCoxeterHom_wordProd`, `TauCeti.weylCoxeterHom_surjective` in
  `Coxeter/Presentation.lean` supply generation, the matrix and the marked
  surjection. The matrix has diagonal 1 and off-diagonal orders 2,3,4,6 for
  Cartan products 0,1,2,3. The homomorphism needs finite root indices,
  characteristic-zero domain and crystallographicity; surjectivity also needs
  reducedness, but neither requires spanning. Its generator equation sends the
  generator indexed by i to `RootPairing.weylGroup.ofIdx P i`.
- `CoxeterSystem.strongExchange`, `CoxeterSystem.exchangeCondition`, and
  `CoxeterSystem.deletionCondition` in
  `TauCeti/GroupTheory/Coxeter/StrongExchange.lean`, and `TauCeti.matsumoto` in
  `Matsumoto.lean`, supply abstract exchange, deletion and the reduced-word
  property. `CoxeterSystem.parabolic`, `CoxeterSystem.exists_isMinimalCosetRep`,
  `CoxeterSystem.isMinimalCosetRep_iff`,
  `CoxeterSystem.length_mul_of_isMinimalCosetRep` in `Parabolic.lean`, and
  `CoxeterSystem.wordProd_alternatingWord_eq_of_mem_parabolic_pair` in
  `Dihedral.lean` supply the minimal-coset and rank-two inputs. These hold for
  arbitrary Coxeter index types, independently of geometric faithfulness.
- `CoxeterSystem.BruhatLE` and `CoxeterSystem.BruhatLE.antisymm` in
  `TauCeti/GroupTheory/Coxeter/Bruhat.lean` supply the Bruhat order, without
  finiteness. `TauCeti.poincarePolynomial` and
  `TauCeti.eval_one_poincarePolynomial` in `Poincare.lean` supply the length
  generating polynomial and its value equal to the group order when W is finite.
  These consequences of abstract Coxeter theory are consumed with the presentation.
- `CoxeterMatrix.geometricForm`, `CoxeterMatrix.geometricForm_single_single`,
  `CoxeterMatrix.geometricReflection`, `CoxeterMatrix.geometricReflection_apply`,
  `CoxeterSystem.geometricRepresentation`,
  `CoxeterSystem.geometricRepresentation_simple`,
  `CoxeterSystem.geometricForm_geometricRepresentation`, and
  `CoxeterSystem.orderOf_simple_mul_simple` in
  `TauCeti/GroupTheory/Coxeter/Geometric.lean` supply the form, action, generator
  formula, form invariance and exact pairwise orders. These require neither
  nondegeneracy nor finite rank. They do not assert faithfulness.
- `TauCeti.dominantChamber` and `TauCeti.openDominantChamber` in
  `TauCeti/LinearAlgebra/RootSystem/Chamber.lean` are the simple-coroot weak and
  strict sign cones. `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` in
  `FundamentalDomain.lean` gives uniqueness also on walls, over a linearly
  ordered strict ordered commutative ring of characteristic zero, with finite ι,
  crystallographicity, reducedness of P and its flip, and spanning. Its
  `TauCeti.stabilizer_eq_closure_wallReflections` describes boundary stabilizers.
  `TauCeti.longestElement`, `TauCeti.longestElement_sq`,
  `TauCeti.inversions_longestElement` and
  `TauCeti.ncard_inversions_longestElement` in `LongestElement.lean` supply the
  longest element under finite root indices, characteristic-zero domain,
  spanning, crystallographicity and reducedness. No interior-only uniqueness argument is
  used to deduce uniqueness on walls.
- `TauCeti.DynkinType`, `TauCeti.DynkinType.Valid`,
  `TauCeti.DynkinType.cartanMatrix` and `TauCeti.HasCartanType` in
  `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean` supply the oriented dictionary.
  Valid ranks are A≥1, B≥2, C≥3, D≥4 and the five exceptional types.
  `TauCeti.IsFiniteType` in `FiniteType/Basic.lean` means generalized Cartan
  axioms and a positive rational diagonal symmetrizer giving a positive-definite
  matrix. `TauCeti.isFiniteType_cartanMatrix` supplies this for a finite
  crystallographic root system with a base over a characteristic-zero domain.
  `TauCeti.existsUnique_dynkinType` in `FiniteType/Classification.lean` requires
  finite nonempty ι, spanning, reducedness, crystallographicity and irreducibility
  over a characteristic-zero domain and classifies a specified base.
  `TauCeti.nonempty_equiv_of_hasCartanType` in `Isomorphism.lean` supplies rigidity
  for two bases of the same type, over the same ring.
- `TauCeti.DynkinType.IsLongSimpleRoot` in `RootLength.lean` and
  `TauCeti.DynkinType.numRoots` in `NumberOfRoots.lean` fix lengths and counts.
  `TauCeti.DynkinType.simplyConnectedRootDatum`,
  `TauCeti.DynkinType.simplyConnectedBase`,
  `TauCeti.DynkinType.hasCartanType_simplyConnectedRootDatum`,
  `TauCeti.DynkinType.span_coroot_simplyConnectedRootDatum` in
  `SimplyConnectedRootDatum/Assembly.lean` give the actual integral data.
  `TauCeti.DynkinType.rationalRootSystem`, `TauCeti.DynkinType.rationalBase`,
  `TauCeti.DynkinType.cartanMatrix_rationalBase` in
  `SimplyConnectedRootDatum/Rational.lean` give their rational realizations.
  All these models take a proof of validity; roots are indexed by the root count,
  not the rank. The aliases `DynkinType`, `DynkinType.A`, `DynkinType.B`,
  `DynkinType.C`, `DynkinType.D`, `DynkinType.E6`, `DynkinType.E7`, `DynkinType.E8`,
  `DynkinType.F4`, `DynkinType.G2`, `DynkinType.rank`, `DynkinType.Valid` and
  `DynkinType.IsLongSimpleRoot` in Suggested.lean refer to these native declarations.
- `TauCeti.nonempty_dihedralGroup_mulEquiv_weylGroup_of_hasCartanType_G2` in
  `Weyl/Dihedral.lean` identifies the G₂ Weyl group with the dihedral group of
  order 12; its A₂ and B₂ counterparts give orders 6 and 8. These require finite
  reduced crystallographic pairings over characteristic-zero domains, not spanning.

## How to read the build

Layer 1 develops geometric signs from the public rank-two reflection formulas and
abstract parabolic theory, then proves faithfulness and integral comparison.
Layer 2 completes the marked finite Weyl presentation and relates its length to
native inversions. Its root-word proof route uses native root exchange and rank-two
braid relations; it does not assume the conclusion through an unmarked Coxeter
structure. Layer 3 completes base-independent classification and the type A group
identification using the supplied classification and coordinate models. The native
chamber and integral-model contracts remain available directly to all consumers.

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
B(Eu,Ev)=Bⱼ(u,v) and Eσⱼ(u)=σᵢ(Eu) for i the ambient value of j. Lift the
inclusion of generators to Mⱼ.Group→*M.Group, prove Eρⱼ(w)=ρ(f(w))E and use
faithfulness to identify its image with the standard parabolic subgroup.
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
comparisons; faithfulness of both systems for parabolic injectivity.

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
domain and a base b, prove `weylCoxeterHom_injective`. The map's source is the
presented group of the native base matrix and its target is the native Weyl
group. Combine it with surjectivity to obtain a multiplicative equivalence
whose generator i maps to the reflection in the actual root bᵢ. Transport the
native presented Coxeter system across this equivalence. Its simple-generator
equation is mandatory; an unspecified Coxeter structure is insufficient
(Bourbaki, Ch. VI §1; Humphreys, §1.9, Theorem, pp.16–18).

One root-level route proves the braid property for shortest words in the actual
simple reflections, using the native root exchange condition and rank-two
relations; combine it with deletion to reduce any kernel word by braid moves
and cancellations. The braid property for geometric words is an intermediate
target here: two shortest words for the same Weyl element are connected by
rank-two braid moves. Abstract Matsumoto alone cannot establish it before the
presentation is injective. The route must justify these moves in the presented
group, not merely find a shorter word with equal Weyl image.

Prove `presentation_length_eq_inversions`: the length of any element of the
presented group is the cardinality of the native inversion set of its image.
The marked equivalence identifies shortest words on both sides, so the native
least-length characterization applies (Humphreys, §1.7, Corollary, p.14;
§1.9, Theorem, pp.16–18).

The API of the resulting equivalence includes its inverse on actual simple
reflections, equality on word products, the length formula, and preservation
and reflection of reduced words and descents. In particular the right descent
at i is detected by whether w sends the positive simple root i to a negative
root. These statements concern the specified generators throughout.

**Checks.**

- In rank zero both groups are trivial; the empty word has length 0 and inversion
  count 0. In A₁ the simple reflection has length 1 and inversion count 1.
- In A₂ the images of the words [], [i], [i,j], [i,j,i] have inversion counts
  0,1,2,3. The word [i,i] has length 2 as a list but spells length 0 and has
  no inversions; list length must not replace minimal length.
- In A₂ the intended generator i sends αᵢ to −αᵢ. Swapping the two generators
  sends αᵢ to αᵢ+αⱼ instead. The native homomorphism's generator equation
  excludes the swap even though it preserves the matrix and abstract length.
- The A₂ root αᵢ+αⱼ has height 2 and lowers to a simple root of height 1.
  In the infinite integral system with H=[[2,−3],[−3,2]], take roots of H-norm
  ±2 and coroot v∨=(H(v,v)/2)v. The positive root (1,1) has norm −2 and height
  2, but its two simple reflections give (2,1),(1,2), both of height 3.
  This is excluded by finiteness, not by the native base axioms.

*Needs:* native base matrix and marked presentation map; simple generation;
`TauCeti.isLeast_ncard_inversions`; root-level exchange in
`TauCeti/LinearAlgebra/RootSystem/Inversions/StrongExchange.lean` and deletion in
`Inversions/Subword.lean`; rank-two braid relations in `BraidRelation.lean`.
The geometric-word braid target above supplies the missing completeness step.

### Examples

In G₂ the six positive roots give longest length 6 and the Weyl group has order
12. In A₂ the dominant wall point 0 is fixed by the whole Weyl group but its
orbit meets the closed dominant chamber in just {0}; uniqueness of a point in
an orbit is distinct from freeness of its stabilizer. For an interior point,
the stabilizer is trivial. These checks use the supplied dihedral, longest-element
and closed-chamber results, with the new length bridge (Bourbaki, Ch. VI §1).

### Dependencies

The finite root combinatorics and presentation inputs in the supplier contracts.
The root-word route does not consume geometric faithfulness. Abstract exchange
and Matsumoto become applicable to the actual Weyl group through the marked
Coxeter structure; they are not new targets.

## Layer 3: classification and concrete Weyl groups

### 3.1 Classification independent of a base

Prove `classification_independent_base`: for every nonempty irreducible finite
reduced crystallographic root system over a characteristic-zero domain, given one base b₀, exactly
one valid Dynkin type is the type of every base. Prove transitivity on bases as
the intermediate target: for any two bases b,b′, some Weyl element transports
b to b′. Apply `RootPairing.Base.map_equiv_cartanMatrix` to transport Cartan
entries under the induced support bijection. Thus an unbased equivalence
preserves the unique valid type (Bourbaki, Ch. VI §1 and §4; Humphreys,
*Introduction to Lie Algebras and Representation Theory*, §§10–11).

One route compares the positive systems by successive simple reflections,
decreasing the number of positive roots with disagreeing signs. Native positivity,
root lowering and finite inversion theory are the inputs. This is an algebraic
argument on the finite root set; the statement is not restricted to ℝ by the
use of real chambers in another route. Combine base transitivity with the
supplied classification of a specified base and supplied isomorphism rigidity.

Prove `rational_classification`: a nonempty irreducible finite reduced
crystallographic root system over ℚ is isomorphic to the native rational model
of exactly one valid type. The existential validity proof selects a genuine
native model; its root-index set has the number of roots, and both coordinate
spaces have the rank. Base independence supplies uniqueness for unbased
isomorphisms; the native rational realization and rigidity supply existence
(Bourbaki, Ch. VI §4).

**Checks.**

- A₁ has two bases {α} and {−α}; each has Cartan matrix [2], and its nontrivial
  reflection exchanges them. There is one valid type A 1.
- A₂ has six bases and six roots, but rank 2. Each base has Cartan matrix
  [[2,−1],[−1,2]], determinant 3. The positive root string has top coefficient 1,
  so its off-diagonal Cartan entry is −1.
- The empty matrix is of finite type, but there is no valid rank-zero Dynkin
  type. Nonempty ι in both classification headlines excludes this case.
- Swapping the B₂ indices changes [[2,−2],[−1,2]] to [[2,−1],[−2,2]]:
  Cartan transport is simultaneous reindexing, not literal equality of entries.
  These B₂ and C₂ matrices represent the same valid type B 2. In rank 3 the
  oriented B₃ and C₃ matrices cannot be simultaneously
  relabelled into one another; forgetting edge orientation would conflate them.
- The finite-type condition accepts [2] and the empty matrix. It rejects
  [[2,−2],[−2,2]], since the quadratic form has value 0 at (1,1) for every
  positive symmetrizer; semidefinite must not replace definite.

*Needs:* the given base over a domain, and native base existence over ℚ for
the rational statement; positive roots and lowering; base transitivity
above; `TauCeti.existsUnique_dynkinType`,
`TauCeti.nonempty_equiv_of_hasCartanType`, native rational models and their
Cartan matrices; transport of bases by `RootPairing.Base.map` and its Cartan
identity `RootPairing.Base.map_equiv_cartanMatrix`.

### 3.2 Type A as a permutation group

For a finite reduced crystallographic root pairing P over a characteristic-zero
domain, a base of Cartan type A n and n≥1, prove
`weylGroup_equiv_perm_of_typeA`: the Weyl group is multiplicatively equivalent to
`Equiv.Perm (Fin (n + 1))`. Refine the existence statement by a marked equivalence
for any specified Cartan relabelling, sending the simple reflections to the
adjacent transpositions in that order. The API includes the action on the roots
eᵢ−eⱼ, the order (n+1)!, positive-root count n(n+1)/2, and agreement of length
with permutation inversions (Bourbaki, Ch. VI §4, type A).

One route uses the marked presentation from Layer 2 and the usual adjacent-
transposition presentation. Its completeness is a target of this comparison,
proved from the action on the n+1 coordinate labels and the inversion length,
not assumed from equality of group orders. Root models may equivalently be
compared with the native type A model using the specified Cartan relabelling.

**Checks.**

- A₁ gives S₂ of order 2 and one positive root; A₂ gives S₃ of order 6 and
  three positive roots. The two A₂ simple permutations do not commute.
- In ℚ² with dot pairing, roots ±(1,0) and coroots ±(2,0) give type A₁
  with reflection diag(−1,1). The Weyl group has order 2 although the root span
  is only the first axis; the group comparison requires no spanning hypothesis.
- A₃ gives S₄ of order 24, twelve roots and six positive roots. Using the rank
  as the number of permuted letters would instead give order 6.
- Reversing the A₂ node labelling interchanges (0 1) and (1 2); the marked
  equivalence must change with the relabelling. The longest permutation reverses
  three labels and has inversion count 3.

*Needs:* Layer 2's marked presentation and length bridge; the native type A
Cartan/Coxeter matrices, root model and Cartan rigidity; Mathlib permutation
multiplication, adjacent transpositions and inversion counts.

### Examples

The supplied numbered A₁ integral datum has roots ±2, coroots ±1 and dot pairing.
Its root span is 2ℤ while its coroot span is ℤ; after rational extension both
span ℚ. This distinguishes a simply connected root datum from an integral root
system with both spans equal to the full lattices. In G₂ the twelve roots split
into six short and six long, squared lengths in ratio 1:3, and the Cartan matrix
is [[2,−1],[−3,2]]. The B₂ long simple node is 0, the G₂ long node is 1, and
F₄ has long nodes 0,1; these native conventions also fix the CFSG indices
(Bourbaki, Ch. VI §4, types A, B, F, G).

### Dependencies

Native classification, rigidity, positive-root combinatorics and numbered models.
The type A group comparison uses Layer 2. Integral dominance, folding, Lie
representations, invariant degrees and reductive groups are not prerequisites.

## Downstream consumers

RepresentationTheory/LieHighestWeight Layer 2 uses the root and chamber objects
and the classified type; RepresentationTheory/ClassicalGroups Layer 3 uses the
classical root/Weyl specialization. ReflectionInvariantTheory §4 consumes the
marked Weyl/Coxeter dictionary. CFSGStatement L0 and ReductiveGroups §9 use the
native Bourbaki-numbered integral models. EnriquesSurfaces §5.2 is the integral
lattice application of the general geometric results; its geometric and
congruence statements supply nothing in the reverse direction.

## References

- J. E. Humphreys, *Reflection Groups and Coxeter Groups*, Cambridge, first
  published 1990; corrected paperback edition 1992, reprinted 1994.
  §1.7 Corollary p.14; §1.9 Theorem pp.16–18; §5.1 p.106; §5.3 pp.109–110;
  §5.4 Theorem pp.111–113 and
  Corollary p.113; §5.5. The institutional course copy has the printed numbering:
  [University of Washington](https://sites.math.washington.edu/~billey/classes/reflection.groups/references/Humphreys.ReflectionGroupsAndCoxeterGroups.pdf).
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4–6*, Springer (2002),
  Ch. IV §1 and Ch. VI §§1,4, DOI 10.1007/978-3-540-34491-9.
- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*,
  Springer (1972), §§9–11, DOI 10.1007/978-1-4612-6398-2.
- A. Björner and F. Brenti, *Combinatorics of Coxeter Groups*, Springer (2005),
  §3.3, DOI 10.1007/3-540-27596-7, for the abstract word property.
- V. G. Kac, *Infinite-Dimensional Lie Algebras*, 3rd edition, Cambridge (1990),
  Ch. 4, DOI 10.1017/CBO9780511626234, for the finite/affine/indefinite terminology.
