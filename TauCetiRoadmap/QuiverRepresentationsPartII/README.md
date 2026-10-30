# Roadmap: quiver representations, path algebras, and Gabriel’s theorem, part II: multisegment duality

**Summary.** Build the duality of finite integral multisegments from generic opposite-degree commuting operators on complex graded spaces. Identify adjacent generic ranks with a weighted inclusion-chain deficit, realize ramified truncation on an actual operator image, and prove its additivity for the canonical maximal split. The final comparison identifies this geometric dual with the Zelevinsky involution on every real translate of an integral cuspidal line, of arbitrary positive cuspidal rank; the resulting combinatorics supplies the general-linear newform arguments of Atobe–Kondo–Yasuda.

## Scope and ownership

This is the integer-grading and commuting-operator continuation of [QuiverRepresentations](../RepresentationTheory/QuiverRepresentations/README.md). It owns occurrence-sensitive interval operations, the finite-window graded adapter, opposite-degree centralizers, generic duality, admissible images, the adjacent Knight–Zelevinsky formula, and the canonical ramified split. The parent owns path algebras and their representation equivalence (Layer 1), Krull–Schmidt (Layer 2), and finite type-A interval classification as part of Gabriel’s theorem (Layer 5). Those results are suppliers, with the exact uses specified below.

SmoothRepresentationsOfLocalGroups, SR.5.2–SR.5.3, owns smooth GLₙ representations, normalized induction, segment and multisegment representations, highest derivatives, and the general representation involution. The integral-segment adapter on any unitary supercuspidal line with a common real translation, its unramified-character application, and the identification of the representation labels with this geometric dual belong here. EndoscopicTransferAndUnitaryTraceComparison can consume that identification; it supplies no geometric input to this build.

General Aubert duality, local Langlands, conductor tuples, and the unipotent newform induction are outside this roadmap; its representation input is precisely the SmoothRepresentationsOfLocalGroups contract above. The rank theorem here concerns adjacent degrees only. The full Knight–Zelevinsky formula for higher powers, Fourier transforms, canonical bases, and variants over finite fields are outside the scope.

General homogeneity belongs to Tau Ceti’s `TauCeti.LinearMap.IsHomogeneous` and `TauCeti.LinearMap.homogeneousSubmodule`, in `TauCeti/LinearAlgebra/Graded/LinearMap`. The coordinate abbreviation `Homogeneous` specializes that predicate to `Space.grade`; no general degree calculus is built here. Tau Ceti’s `Module.End.exists_pow_apply_eq_zero_of_forall_mem_support_lt`, in `TauCeti/LinearAlgebra/End/LocallyNilpotent`, supplies pointwise local nilpotence for a map strictly lowering a well-founded basis weight. The finite-support pair target here requires a single exponent killing the whole map, in both directions, rather than another local nilpotence theorem.

For geometric foundations, reuse the algebraic-group and scheme APIs rather than introduce a second general theory. In particular, Tau Ceti’s `TauCeti.isLocallyClosed_orbit_of_isConstructible`, in `TauCeti/Topology/Algebra/MulAction/Orbit`, supplies local closedness for a constructible orbit in a Noetherian space acted on by homeomorphisms. Its hypothesis still requires a constructibility proof for the graded conjugation action. The Hopf-ideal conormal API concerns closed subgroups at the identity; it is distinct from the orbit conormal bundle needed here. The scoped orbit, incidence, dimension, and fibre comparisons in §2.7 specify the additional geometric interface.

[AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md), L0B and L2B, owns finite locally free sheaves, their rank, geometric total spaces, and the equivalence between the sheaf and geometric bundle presentations. The conormal target here identifies the tangent-annihilator family of this specific orbit action with such a bundle; it does not construct a second general bundle category. The orbit smoothness, dimension and projection comparisons remain scoped targets here, since the bundle equivalence does not assert them.

Mathlib’s `NonemptyInterval ℤ` owns the nonempty closed interval carrier, inclusive membership, extensionality, inclusion order, singleton intervals, and monotone transport. This roadmap specializes that carrier through `Interval` and owns its integer length and optional right shortening, together with the multisegment constructions.

For finite posets, use Mathlib’s `IsChain` and `IsAntichain`. General finite Dilworth and its chain-partition comparison belong to §4.3 here; GraphConnectivityAndFlows, Scope boundaries, excludes Dilworth. Establish weak duality for arbitrary chain covers and a disjoint chain partition attaining the antichain bound, then specialize these results to occurrence labels. Compare chain partitions with split-graph matchings and weighted interval chains.

## Conventions

An interval `[b,e]` has integer endpoints with `b ≤ e`, includes both endpoints, and has length `e-b+1`. Empty intervals are represented by absence, never by a reversed pair of endpoints. A multisegment is a finite **multiset** of intervals. Its cardinality counts interval occurrences; its total length counts basis vectors. All block and poset indices distinguish repeated occurrences.

All operator geometry is over ℂ. Orbit, conormal, and dimension assertions concern reduced finite-type complex varieties; incidence denotes the reduced closed subvariety of the matrix-equation zero locus (Z81 §4.3–4.4, original p.20). Spaces are finite dimensional, with a finite-support ℤ-grading. A VN operator `N` raises degree by one; a WL operator `L` lowers it by one. A graded isomorphism preserves every degree and intertwines the operators. For shifts use

```text
V(c)ₐ = Vₐ₋c.
```

Consequently the VN image of `[b,e]` has unshifted type `[b+1,e]`, while its shift by −1 has type `[b,e-1]`. The WL image has unshifted type `[b,e-1]`. In each case a singleton has zero image. On `[0,1]`, `N(v₀)=v₁` and `L(v₁)=v₀`; this fixes the direction independently of any diagram conventions. The VN matrix in the ordered basis (v₀,v₁) is E₂₁, and the WL matrix is E₁₂.

Genericity always uses the polynomial Zariski topology on complex points: polynomial nonvanishing sets generate the topology. This topology is transported through finite complex bases, and must be distinguished from the usual topology on ℂ. A zero-dimensional vector space is a one-point affine space, with a nonempty dense open whole space.

The commuting equation is `NL = LN`. The trace pairing identifies degree −1 maps with the linear dual of degree +1 maps. For `N=E₂₁` and `L=E₁₂` in the degrees 0 and 1, `NL-LN=diag(-1,1)`; pairing with the degree-zero matrix `diag(1,0)` gives −1. Thus these two arrows do not commute, and the tangent-annihilator condition detects the commutator with the stated sign.

In the representation comparison only, F is a non-archimedean local field, q is its residue cardinality, and `|ϖ|=q⁻¹`. Fix a unitary irreducible supercuspidal representation ρ of GL_d(F), d≥1, and a real translation c; the arbitrary unramified character `χ:F×→ℂ×` is a rank-one application. Induction is normalized by the positive complex square root of the parabolic modulus. `Z` uses the irreducible-subrepresentation convention, while `L` uses the Langlands quotient convention. The empty multisegment corresponds to the one-dimensional trivial representation of GL₀. On a singleton the two conventions agree. For the line of the trivial character, `Z([0,1])` is the determinant character `|det|¹ᐟ²`, while `L([0,1])` is its Steinberg counterpart; `L([0,0]+[1,1]) = Z([0,1])`. These two-term cases fix the convention for the comparison.

The acceptance signatures in `Suggested.lean` lie in `TauCetiRoadmap.QuiverRepresentationsPartII`. This README also specifies the geometric and representation targets whose constructions need mathematical carriers beyond the simple definitions of that file.

## Exact supplier contracts

### From Mathlib

The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. The following contracts are used in their linear specializations over ℂ.

- `NonemptyInterval` (`Mathlib/Order/Interval/Basic`, lines 35–37) stores endpoints `fst`, `snd` and their order proof. Its extensionality theorem `NonemptyInterval.ext`, decidable equality (lines 71–72), `NonemptyInterval.mem_def` (line 126), inclusion order `NonemptyInterval.le_def` (line 77), `NonemptyInterval.pure` (line 134), `NonemptyInterval.map` (line 158), `NonemptyInterval.map_map` (line 166), and the partial order (line 209) supply the general interval API. Membership is inclusive and `s ≤ t` means `t.fst ≤ s.fst ∧ s.snd ≤ t.snd`; translation uses `NonemptyInterval.map` with the order homomorphism adding the given integer. Empty intervals are excluded by this carrier.
- `DirectSum.IsInternal` (`Mathlib/Algebra/DirectSum/Basic`): the canonical map from the external direct sum of an additive family of submodules is bijective. Use it to express the grading, not merely pairwise disjointness of the grades.
- `LinearMap.range` (`Mathlib/Algebra/Module/Submodule/Range`): the range submodule has exactly the set-theoretic image of the linear map. An image pair must use this carrier, or a linear model with an injective embedding onto it.
- `LinearMap.rangeRestrict` (`Mathlib/Algebra/Module/Submodule/Range`, line 155): the map with codomain restricted to its range. Applying it to a range vector expresses the induced operator without a coordinate image construction.
- `Submodule.map` (`Mathlib/Algebra/Module/Submodule/Map`): push a submodule through a linear map by its actual image. This supplies grade intersections and transport of restricted operators.
- `Module.finBasis` (`Mathlib/LinearAlgebra/Dimension/Free`): a finite free module has a basis indexed by `Fin (Module.finrank ℂ V)`. Complex finite-dimensional spaces satisfy the free-module hypothesis.
- `Module.Basis.ofVectorSpace` (`Mathlib/LinearAlgebra/Basis/VectorSpace`): choose a basis of a vector space over a division ring. Combine this with finite-dimensionality when coordinates must be finite.
- `Matrix.rank` (`Mathlib/LinearAlgebra/Matrix/Rank`): rank is the finrank of the range of `mulVecLin`. All matrices here have finite row and column sets and complex coefficients; minor computations must agree with this rank.
- `MvPolynomial.eval` (`Mathlib/Algebra/MvPolynomial/Eval`): evaluation is a ring homomorphism. It defines polynomial zero and nonvanishing loci and turns products of minors into simultaneous conditions.
- `MvPolynomial.funext` (`Mathlib/Algebra/MvPolynomial/Funext`, line 82): over an infinite integral domain, equality at every evaluation implies polynomial equality, for any variable type. Its contrapositive with the zero polynomial supplies a nonzero evaluation of every nonzero complex polynomial.
- `TopologicalSpace.generateFrom` (`Mathlib/Topology/Order`): form the topology generated by the prescribed polynomial nonvanishing sets. No ambient Euclidean instance is substituted.
- `IsChain` (`Mathlib/Order/Preorder/Chain`, definition at line 51) and `IsAntichain` (`Mathlib/Order/Antichain`, definition at line 42): these use `Set.Pairwise`, so only distinct members are tested. Inclusion reflexivity and endpoint-order irreflexivity give the all-pairs descriptions used below.
- `IsIrreducible` (`Mathlib/Topology/Irreducible`): the set is nonempty and preirreducible. This is sufficient for intersections of nonempty open sets after the topology has been supplied; it supplies neither algebraic dimension nor an orbit conormal construction.

### From Tau Ceti

At Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti.QuiverRep`, in `TauCeti/RepresentationTheory/Quiver/Representation/Basic`, is the functor category `CategoryTheory.Paths Q ⥤ ModuleCat k`. Restrict an integer-graded operator to a finite support window and assign its degree-a space to vertex a. Arrows act in the increasing direction for VN and the decreasing direction for WL.

At the same pin, `TauCeti.LinearMap.IsHomogeneous` supplies the degree condition, and `isHomogeneous_def` identifies it with the explicit condition on all homogeneous vectors. Its zero, addition, scalar, and composition API supplies the corresponding closure facts. `homogeneousSubmodule` gives the fixed-degree submodule; the opposite centralizer additionally imposes commutation. This declaration is used directly in the acceptance signatures.

Tau Ceti also supplies these interfaces directly. `TauCeti.quiverRepEquivalence`, in `TauCeti/RepresentationTheory/Quiver/Representation/AsModule`, applies to a finite vertex quiver over a field. In `TauCeti/RepresentationTheory/Quiver/Representation/KrullSchmidt`, `TauCeti.QuiverRep.exists_indecomposable_iso_biproduct` decomposes a pointwise finite-dimensional representation of a finite quiver into a finite family indexed by `Fin n`; `exists_equiv_iso_of_iso_biproduct` matches two such indecomposable families by an index equivalence; `card_iso_eq_card_iso_of_iso_biproduct` preserves each isomorphism-class multiplicity. A finite support window satisfies the finite-vertex and pointwise finite-dimensional hypotheses. Use these declarations when consuming the parent contracts.

The Tau Ceti orbit declaration specified under Scope and ownership is a pinned implementation supplier. Apply it only after establishing its Noetherian-space, translation-continuity, and constructibility hypotheses; do not treat its presence as the dimension and projection theorem of §2.7.

### From TauCetiRoadmap.QuiverRepresentations

The parent roadmap’s Layer 1, `quiverRepEquivalence`, identifies these representations with **left** path-algebra modules, with later arrows multiplying on the left. The adapter must extend by zero outside a finite window, compare different windows by restriction and extension, and preserve graded morphisms and their intertwining equations. No window choice may change an interval label.

From Layer 2 consume `exists_indecomposable_decomposition` and `krullSchmidt_unique`: finite-length modules split into finitely many indecomposable summands, and two such decompositions are matched by isomorphisms. Distinct isomorphic submodules may occur, so multiplicities survive the passage to the multiset of isomorphism classes.

From Layer 5 consume the type-A specialization of the indecomposable/positive-root bijection: on an equioriented finite path, the indecomposables are exactly the one-dimensional interval blocks, with identity arrows inside their support. Reversing orientation gives the same interval supports. The graded adapter in Layer 1 below combines these supplier results; it does not prove a second Gabriel theorem.

### From TauCetiRoadmap.AlgebraicVectorBundles

From AlgebraicVectorBundles L0B and L2B consume `FiniteLocallyFreeSheaf`, `rank`, `totalSpaceScheme`, `totalSpaceEquiv`, and `totalSpaceHomEquiv`: the last identifies a total-space point over a test scheme with a section of the pulled-back sheaf. Finite local freeness and bundle rank are preserved under pullback; the total-space comparisons are natural in the test scheme and in the bundle.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SmoothRepresentationsOfLocalGroups SR.0–SR.3 for the actual smooth admissible representation category, GLₙ(F), normalized parabolic induction, and its equivariant morphisms. Consume SR.5.2, target *segment-representations*, for arbitrary positive-rank unitary supercuspidal labels, real-endpoint segment and multisegment carriers, and the normalized Z subrepresentations and L quotients. Consume SR.5.3, target *highest-derivative-adapter*, for the involution sending `Z(m)` to `L(m)` and the GL₀ unit. These are roadmap contracts; no baseline-ready representation-valued function is presumed.

More explicitly, a supplier segment records a positive-rank unitary supercuspidal representation and real endpoints differing by a nonnegative integer. Its support is the sequence of real norm twists. Ordered normalized products characterize the `Z` and `L` irreducibles; isomorphism classes depend on the unordered multisegment. Common real translation tensors with `|det|ᶜ`, and normalized induction respects that tensoring. The involution has square the identity and fixes cuspidal singletons. Its general construction and classification stay with that supplier; common-twist compatibility follows from its classification characterizations as an adapter law in §5.4. The local adapter and the geometric-label comparison are §5.4 targets, with their proof inputs stated there.

## How to read the build

Layer 0 fixes finite interval combinatorics and one-copy maximal peeling. Layer 1 turns it into finite-support graded operators, with actual images and a reconstruction theorem. Layer 2 supplies commuting coordinates, genericity, and the conormal symmetry establishing duality. Layer 3 makes genericity compatible with images and defines ramified truncation. Layer 4 independently computes adjacent generic ranks by matching and weighted chains. Layer 5 combines reconstruction with those ranks to prove the canonical split, then supplies the representation adapter and the newform example. Layers 3 and 4 meet in the split proof; the representation comparison is unnecessary for the elementary interval identity.

## Layer 0: integer multisegments and maximal peeling

### 0.1 Integral intervals

Use `Interval` as the specialization `NonemptyInterval ℤ`; write `[b,e]` for endpoints `fst=b`, `snd=e`. Define *Interval.length* by the natural number associated to `e-b+1`. Write *Interval.shift s c* for transport by addition of c. Define `Interval.shorten` to return `[b,e-1]` when `b<e` and `none` for a singleton (AKY §2.1, p.7; §2.3, p.8; §3.1, pp.14–15).

The integer interval API has the following laws (AKY §2.1, p.7; §3.1, p.15).

- Every interval has positive length, equal to its number of integer points.
- Translation by c preserves length; an integer a+c belongs to the translated interval exactly when a belongs to the original interval.
- Shortening deletes a singleton and otherwise decreases the right endpoint by one, retaining the endpoint-order proof; the resulting interval has length one less and contains exactly the integers a with `b ≤ a < e`.
- Shortening commutes with translation, interpreting translation of `none` as `none`.

**Checks.**

- The right endpoint 2 belongs to `[0,2]`; 3 does not. A half-open carrier fails this check.
- `[3,3]` shortens to `none`, while `[3,4]` shortens to `[3,3]`. This distinguishes deletion from keeping an empty interval.
- Translating `[2,4]` by −1 gives `[1,3]`, and preserves its length 3. Shortening this result and translating the shortening `[2,3]` by −1 both give `[1,2]`; for `[3,3]` both orders give `none`. The opposite shift sign fails.
- Inclusion holds from `[1,1]` to `[0,2]` and fails in the reverse direction; `[3,3]` is not included in `[0,2]`. The interval `[0,2]` has length 3 and shortens to `[0,1]`. A singleton has length 1, and a reversed endpoint pair is not an interval.

*Needs:* Mathlib’s `NonemptyInterval` API in the exact supplier contract, integer arithmetic and finite interval supports; the supplier’s interval blocks give the interpretation used in Layer 1.

### 0.2 Multisegments and right truncation

Define `Multisegment := Multiset Interval`. For m, *degreeDimension m a* counts its occurrences containing a, and *totalLength m* sums their positive lengths. Define `rightTruncate` by binding each occurrence to its optional shortening; *shiftMultisegment* maps translation over all occurrences. Choose `occurrenceInterval m : Fin m.card → Interval` with the multiset of values equal to m. Subsequent coordinates use this single occurrence model; changing its order gives a permutation, not fewer copies (AKY §2.3, p.8; §3.1, p.15).

The multisegment API supplies the induction measure and matrix dimensions (AKY §2.3, p.8; §3.1, p.15).

- Right truncation preserves multiset addition and commutes with every integer translation.
- Translation preserves occurrence counts and total length and reindexes the degree dimensions by the same shift.
- Grade dimensions add under multiset addition, and total length is the finite sum of all degree dimensions.
- For every interval s, the number of occurrence labels with value s is its count in m; permuting labels preserves this count.
- Right truncation decreases total length by exactly the occurrence cardinality, hence strictly for nonempty m.

**Checks.**

- Truncating `2[1,2]` gives `2[1,1]`. Converting to a set loses one copy.
- Truncating `[0,0]+[1,3]` gives `[1,2]`, with no contribution from the singleton.
- `[0,2]+[1,1]` has degree-1 dimension 2, total length 4, and two occurrence labels. Cardinality and total length are different.
- For `[0,0]+[2,2]`, the multiset of occurrence values is exactly those two distinct intervals, each with count 1. A constant selector fails. Translating `2[2,4]` by −1 gives `2[1,3]`, retaining both copies. The label multiset of `2[0,1]` has count 2 at `[0,1]`; the empty multisegment has no labels. Truncation and translation keep the empty multisegment empty, with length and every degree dimension zero.
- Translation by 0 fixes [0,2], translation by −1 gives [−1,1], and translation followed by its inverse returns [0,2]. The corresponding degree dimensions at 0, −1, and 0 are all 1; reversing the reindexing sign fails at the support boundary.

*Needs:* §0.1, `Multiset` map, filter, bind, count, and finite sums.

### 0.3 Canonical maximal decomposition

Define `maximalPart m` to contain **one** copy of each distinct interval in m that is maximal for inclusion. Define `remainder m` by multiset subtraction. Thus repeated maximal intervals contribute one copy to the maximal part and leave their other copies in the remainder. This differs from retaining every maximal occurrence (AKY §2.4, p.10, definition immediately before Proposition 2.7).

The maximal-decomposition API is multiplicity-sensitive (AKY §2.4, p.10).

- The maximal-part count at s is 1 exactly when s occurs in m and every interval of m containing s equals s; otherwise it is 0.
- The maximal part is a submultiset of m, and its multiset sum with the remainder is m.
- Two members of the maximal part comparable by inclusion are equal.
- Every occurrence of m lies in an inclusion-maximal interval of its finite support; both parts of empty m are empty.

**Checks.**

- `maximalPart (2[0,2]) = [0,2]`, leaving one copy in the remainder.
- The remainder of `[0,2]+[1,1]` is `[1,1]`; containment is decisive even though its endpoints differ.
- Both `[0,0]` and `[2,2]` belong to the maximal part of their sum. The empty multisegment has empty maximal part and remainder.

*Needs:* §0.2, distinct finite support, inclusion from §0.1, and multiset subtraction.

### Examples

For `m=[0,0]+2[1,2]+[2,2]`, the maximal part is `[0,0]+[1,2]` and the remainder is `[1,2]+[2,2]`. After truncation m becomes `[1,1]+[1,1]`, whose maximal part is one `[1,1]`; the other copy remains. This example fixes both multiplicity and the deletion convention before the split theorem (AKY §2.4, p.10; Lemma 3.6, p.19).

### Dependencies

Finite multisets and integer arithmetic from Mathlib. The interpretation by finite type-A blocks uses the parent contracts under Exact supplier contracts.

## Layer 1: graded operators, shifts, and actual images

### 1.1 Finite graded complex spaces

Define a finite-support graded `Space` as `V=⊕ₐ Vₐ` with finite total complex dimension. A coordinate presentation consists of `n:ℕ` and `degree:Fin n→ℤ`, with carrier `Space.Carrier S := Fin n→ℂ`; `Space.grade a` is the submodule of coordinate vectors vanishing outside the basis indices of degree a. *Space.dimension a* is its complex finrank. Every abstract finite-dimensional grading has such a presentation by choosing a basis in each nonzero grade (AKY §3.1, p.14).

Define *constantSpace n a* by putting all n coordinates in grade a. The coordinate model permits arbitrary grade multiplicities (AKY §3.1, p.14).

- `Space.internal` asserts that the grade submodules form an internal direct sum, including n=0.
- Only finitely many grades are nonzero; a grade's complex finrank is the number of coordinates of that degree.
- The carrier is the stated coordinate function space, and membership in a grade is equivalent to vanishing at every coordinate of different degree.
- A constant presentation has dimension n at its chosen grade and zero at all other grades; every finite-dimensional internal grading admits a coordinate presentation.

**Checks.**

- *constantSpace 2 3* has degree-3 dimension 2.
- The same space has degree-4 dimension 0; its grade-4 submodule is bottom.
- For *constantSpace 0 0*, even the grade-0 submodule is bottom, and the internal direct sum is the zero space.
- In degrees (0,1), the vector (1,0) belongs to grade 0 and fails grade 1. The sum (1,0)+(0,1)=(1,1) has its unique two-grade decomposition. In degrees (3,3), the carrier has dimension 2 and all of it is in grade 3; separating repeated grades into different labels fails.

*Needs:* `DirectSum.IsInternal`, `Module.finBasis`, and finite-dimensional submodules.

### 1.2 VN and WL pairs

Define `Direction` with just `up` and `down`, with `Direction.step` equal to +1 and −1 respectively; reversal interchanges these two directions. A `Pair S d` bundles an endomorphism with `Homogeneous S T d.step`, meaning `T(Vₐ) ⊆ Vₐ₊ε`. Write *VN S* and *WL S* for the two cases. A *PairIso P Q* is a complex linear equivalence preserving grades in both directions and satisfying `e(Tv)=T'(ev)`; *Pair.Isomorphic* means such an equivalence exists. *zeroPair* has the zero operator in either direction (AKY §3.1, pp.14–15).

The pair API retains the grading as well as the operator (AKY §3.1, pp.14–15).

- `Pair.nilpotent` has the uniform conclusion `∃ k:ℕ, T^k=0`: repeated applications leave the finite support window, giving one exponent for the whole map.
- Reversal interchanges the two directions, negates the step, and has square the identity. Reflection of degrees by a↦−a interchanges VN and WL and sends [b,e] to [−e,−b].
- A pair isomorphism preserves grade membership in both directions and intertwines the operators. Identity, inverse, and composition give reflexivity, symmetry, and transitivity of graded isomorphism, even for zero operators.
- The zero pair has zero operator with either allowed degree. Homogeneity uses the pinned mapping condition; scalar multiples and sums of fixed-degree operators use its supplier API.

**Checks.**

- The standard VN arrow on `[0,1]` sends `(1,0)` to `(0,1)` and `(0,1)` to zero; its square is zero while the arrow is nonzero. The WL arrow has the reversed action, also square zero.
- Zero VN singletons supported at 0 and 1 are not graded-isomorphic, although their ungraded vector spaces agree.
- The nonzero VN arrow on `[0,1]` is not homogeneous of degree −1. The zero operator is homogeneous in both directions, so it cannot serve as this negative control.
- On the same grades 0 and 1, the zero operator and E₂₁ are not pair-isomorphic: an invertible intertwiner would send a nonzero arrow to zero. Grade preservation alone would admit the identity map.
- Zero maps are homogeneous with steps +1 and −1 and are nilpotent with exponent 1. On a nonzero single grade, the identity has degree 0 and fails the degree +1 condition. The two allowed steps have values +1 and −1; a direction of step 0 is excluded.
- Direction reversal sends up to down, down to up, and twice-reversed up to up, with steps 1, −1, 1. A putative degree-zero direction fails the two-constructor definition.
- On the nonzero arrow N with grades (0,1), the identity is a pair isomorphism, as is scalar multiplication by 2 with inverse multiplication by 1/2. On zero singletons in different grades no graded equivalence exists, although the underlying one-dimensional spaces are isomorphic. A zero linear map on a nonzero space is not an isomorphism.

*Needs:* §1.1 and Tau Ceti’s homogeneous-map API; nilpotence follows directly from the finite grading support.

Construct the *finite-window equivalence*: for integers u≤v, the category of finite-dimensional graded pairs in either fixed direction, vanishing outside [u,v], is equivalent to the category of pointwise finite-dimensional representations of the correspondingly oriented finite type-A path with vertices u,…,v. Restriction and extension by zero are compatible with enlargement of the window, preserve graded morphisms, and retain their intertwining equations. Its functors restrict a pair to its grade spaces and extend a path representation by zero; the unit and counit intertwine arrows and graded morphisms. This construction uses pairs and homogeneous maps, independently of interval classification (AKY §3.1, p.15; QuiverRepresentations Layer 1).

**Checks.**

- A one-vertex window [0,0] gives a vector space with zero arrow; extending it to [−1,1] adds two zero spaces.
- E₂₁ on grades 0 and 1 gives the increasing path arrow with value 1; the decreasing orientation instead uses E₁₂.
- Enlarging [0,1] to [−1,2] and restricting back recovers both arrow and morphism, with zero boundary maps. A wraparound arrow fails.

*Needs:* §1.2’s pair definition and QuiverRepresentations Layer 1; this equivalence precedes the interval type in §1.3.

### 1.3 Standard interval pairs

Construct *standardSpace m* with basis indexed by valid pairs `(occ,a)`, where occ is an occurrence label and a belongs to its interval. Define *standardVector m occ a* to be that basis vector when valid and zero otherwise. *standardPair m up* advances within each block and kills its last vector; *standardPair m down* retreats within each block and kills its first vector. Define *pairType P* through the unique interval multiset of the supplier decomposition (AKY §3.1, p.15).

The standard-pair API fixes the basis for every centralizer block (AKY §3.1, p.15).

- Standard-space grade dimensions and total dimension equal the degree counts and total length of m.
- The standard pair has interval type m in either direction; a pair's interval type is independent of its decomposition and support window.
- The increasing and decreasing arrows act by the stated neighboring-vector formulas, with zero beyond each block boundary.
- A standard vector is nonzero exactly when its grade belongs to its occurrence interval; when valid it is the corresponding member of the standard basis. It belongs to its named grade even when it is zero.
- Distinct valid occurrence-grade labels give distinct basis vectors; the basis spans the whole standard space.

**Checks.**

- The block `[0,2]` has total dimension 3.
- `2[0,1]` has degree-0 dimension 2, with two different occurrence basis vectors.
- The WL singleton `[2,2]` has zero operator and type `[2,2]`; reversing arrows does not translate the support.
- For one `[0,1]` occurrence, its degree-0 standard vector is nonzero and is sent by the VN arrow to its degree-1 vector.
- For that occurrence, the degree-2 standard vector is zero; inventing a basis vector outside its interval fails the nonvanishing criterion.
- For two `[0,1]` occurrences, the degree-0 standard vectors are distinct and linearly independent. Identifying occurrence labels would make them equal.
- The types of the zero pair on grade 2, the nonzero VN arrow on grades 0 and 1, and the zero arrow on those same two grades are respectively [2,2], [0,1], and [0,0]+[1,1]. Thus the arrow, as well as the dimension vector, determines the type.

*Needs:* §§0.2, 1.2, including its finite-window equivalence, and the parent’s Krull–Schmidt and type-A interval contracts.

### 1.4 Finite-window interval comparison

For two pairs in the **same direction**, prove that they are graded-isomorphic if and only if their *pairType* multisets agree. Prove the grade-dimension formula for interval types: the count of intervals containing a equals the dimension of the grade-a subspace. Transport the parent classification along §1.2’s finite-window equivalence, using its extension-by-zero and window-enlargement compatibility for independence of the chosen window and reversed orientation (AKY §3.1, p.15).

For increasing operators let `R(i,j)` be the rank of `N^(j-i):Vᵢ→Vⱼ` for `i≤j`, with `R(i,i)=dim Vᵢ` and zero outside a support window. In the standard decomposition it counts all intervals containing `[i,j]`; hence the multiplicity of `[i,j]` is

```text
R(i,j) - R(i-1,j) - R(i,j+1) + R(i-1,j+1).
```

Use integer differences before identifying the nonnegative multiplicity. The analogous WL ranks run from `Vⱼ` to `Vᵢ`. This rank description also proves that a finite path-rank table determines the type (Z98 §3, formula (2), p.411; the interval-count interpretation applies to any pair type).

*Needs:* §1.3 and the three parent supplier contracts. The rank table uses Mathlib `Matrix.rank` after homogeneous bases are chosen.

### 1.5 Shifts and image pairs

Construct *shiftSpace S c* and *shiftPair P c* using the standing shift convention. Construct *imagePair P* on the **actual** range of T, with grades `range T ∩ Vₐ` and operator the restriction of T. A coordinate *ImageModel P* carries a space, its pair, and an injective linear *embed* whose range is `LinearMap.range T`; its image of each grade is exactly `range T ∩ Vₐ`, and it intertwines the operators. Iterating this construction gives *iteratedImage P k*, embedded onto `range (T^k)`. A multisegment label alone is insufficient to supply an image model (AKY §3.1, pp.15–16; Lemma 3.3, p.16).

The shift and image API uses the actual range throughout (AKY §3.1, pp.15–16; Lemma 3.3, p.16).

- Shifting by c reindexes the grades by a↦a−c and translates both endpoints of every type interval by c; zero shift and composition satisfy the additive shift laws.
- An image model embeds injectively onto the actual range, maps each of its grades onto the range's corresponding grade intersection, and intertwines the restricted operator with the original one.
- The zeroth iterated image is the whole pair; its kth image embeds onto the range of the kth power, and taking one further image gives the (k+1)st image up to its specified graded intertwiner.
- For VN, shifting the image type by −1 gives the right truncation of the original type. For WL the same truncation equality holds without shifting.
- Images of singletons and of the empty pair are zero, and shifting an actual image agrees with taking the image of the shifted pair.

**Checks.**

- The unshifted VN image of `[0,2]` is `[1,2]`, with zero degree-0 dimension.
- Shifting that image by −1 gives `[0,1]`, with degree-0 dimension 1.
- The unshifted WL image of `[0,2]` is `[0,1]`. Its degree-2 subspace is zero, and the singleton image in either direction is zero.
- For N on `[0,2]`, an image model embeds its two basis vectors as v₁,v₂. Its range is span(v₁,v₂), the actual range of N, and its arrow sends v₁ to v₂.
- The zero embedding of that two-dimensional image model has range 0 instead of span(v₁,v₂) and is not injective.
- Embedding the image basis as v₀,v₁ gives span(v₀,v₁), which omits v₂ and is not the range of N; shifting the image label cannot change this required range.
- The zeroth iterated image on `[0,2]` is the entire pair of dimension 3 and type `[0,2]`, since N⁰ is the identity.
- Its first and second iterated images have bases v₁,v₂ and v₂, hence dimensions 2 and 1 and types `[1,2]` and `[2,2]`.
- For k≥3 its iterated image is zero, of empty type. On the zero graded space every iterated image, including k=0, is zero. For the zero operator on a nonzero space, the zeroth image is still the whole space, while every positive image is zero.
- Shifting the VN block [0,1] by −1 gives [−1,0] and retains its nonzero arrow; shifting by 0 gives [0,1], and successive shifts −1 and 2 give [1,2], equal to shift by 1. The empty space remains empty under every shift.

*Needs:* §1.4, `LinearMap.range`, and `Submodule.map`.

### 1.6 Reconstruction from a VN image

Prove `reconstruction_from_image`: if two VN pairs have equal dimensions in every grade and their **unshifted** image pairs are graded-isomorphic, then the original pairs are graded-isomorphic (AKY Lemma 3.1, pp.14–15; AKY line 554). In the acceptance signature the image equivalence acts directly between `LinearMap.range` submodules; grade membership is preserved in both directions, and it intertwines the restricted operators expressed using `LinearMap.rangeRestrict`. The conclusion is a grade-preserving complex linear equivalence intertwining the original operators.

The image ranks determine `R(i,j)` for `i<j`: the grade-`i+1` component of the image is `N(Vᵢ)`, and the relevant restricted power is `N^(j-i-1)` from that component to grade j. The given dimensions determine the diagonal ranks. Apply the multiplicity differences of §1.4 and classification. This formulation avoids choosing incompatible preimage lifts. Equality of ungraded total dimensions alone would not recover singleton positions.

*Needs:* §§1.4–1.5.

### Examples

The pair for `[0,2]+[1,1]` has dimensions `(1,2,1)` in degrees `(0,1,2)`. Its unshifted VN image has type `[1,2]`. The diagonal dimensions distinguish it from `[0,2]`, whose image is the same. Conversely the rank table is `R(0,1)=R(1,2)=R(0,2)=1`, and its finite differences recover exactly one `[0,2]` and one `[1,1]` (AKY Lemma 3.1, pp.14–15).

### Dependencies

Layer 0, finite-dimensional linear algebra, actual ranges, and the parent representation, Krull–Schmidt, and type-A classification contracts.

## Layer 2: centralizers and generic multisegment duality

### 2.1 Opposite-degree centralizers

For a pair `P=(V,T)` of direction ε, define *centralizer P* as the complex submodule of endomorphisms S that have degree −ε and satisfy `ST=TS`. Define *oppositePair P S* using that same S on the same grading. Commutativity preserves the actual range of T, so define the linear map *restrictCentralizer P* by restriction, transported through the chosen image embedding (AKY §3.1, pp.15–16).

The centralizer API records its maps and equations (AKY §3.1, pp.15–16).

- The opposite pair's operator is S itself, with degree −ε, and the endomorphism equation ST=TS holds.
- Restriction is a complex linear map from the opposite centralizer on V to that on the actual image of T. It satisfies *embed (S_restricted v)=S(embed v)* for every image vector.
- Conjugation by any graded intertwining isomorphism gives a linear equivalence of centralizers and commutes with restriction through the induced image isomorphism.
- The zero commuting operator belongs to every centralizer; zero image and zero space give the unique zero restriction maps.

**Checks.**

- The zero map is in the opposite centralizer of every zero VN pair, including the zero space.
- The opposite-degree centralizer of the single VN chain `[0,2]` is zero: a descending nonzero arrow would violate commutativity at a boundary.
- The VN pair `[0,0]+[1,1]` has a one-dimensional opposite centralizer, consisting of the arbitrary scalar map from degree 1 to degree 0. Ordinary full endomorphism centralizers give the wrong dimension.
- For `[0,1]+[1,2]`, write the block bases as x₀,x₁ and y₁,y₂. The commuting opposite map has L(y₁)=λx₀ and L(y₂)=λx₁. Its restriction to span(x₁,y₂), of VN type `[1,1]+[2,2]`, sends y₂ to λx₁, retaining the coefficient λ.
- For `[0,0]+[1,1]`, the map L(v₁)=λv₀ always restricts to zero on the zero VN image. Thus the one-dimensional source centralizer is the restriction kernel.
- On the zero graded space the restriction is the unique map between zero centralizers, with value zero; requiring a nonempty interval would lose this case.
- For the adjacent zero VN pair, the opposite operator sends v₁ to v₀ when its coefficient is 1, sends v₁ to 2v₀ when it is 2, and is zero when it is 0. Each gives precisely that operator in the opposite pair; replacing every coefficient by zero violates the operator formula.

*Needs:* §1.5 and linear submodules of the endomorphism space.

### 2.2 Commuting block coordinates

Prove the centralizer coordinate theorem for the standard VN pair of any m. For a source interval `[t,u]` and target interval `[s,v]`, a degree −1 commuting block has one free complex scalar exactly when

```text
s < t ≤ v+1 ≤ u.
```

Write *Precedes target source* for these inequalities. In an allowed block that scalar multiplies the target vector of degree `a-1` whenever it exists; vectors outside the target interval are zero. Every allowed **ordered occurrence pair** has its own independent scalar, even if its endpoints agree with another pair. The resulting coefficient map is a linear equivalence between the centralizer and the complex function space on all allowed occurrence pairs (MW II.1, p.148; Lemma II.4 and proof, pp.160–161).

Extend coefficients by zero outside both blocks. The equation `NL=LN` equates adjacent coefficients where both compositions are defined. At the two ends it forces the strict endpoint inequalities and the overlap inequality. Conversely constant coefficients on an allowed overlap satisfy the equation, giving both directions of the parameterization. At a cut `a+1→a`, an allowed occurrence pair contributes precisely one matrix entry if both corresponding basis vectors exist.

The coordinate API includes the following consequences (MW Lemma II.4, pp.160–161).

- An allowed ordered occurrence pair supplies exactly one independent coefficient; a forbidden pair supplies the zero block.
- Coefficient extraction and block reconstruction are mutually inverse complex linear maps.
- At a fixed adjacent cut, each allowed entry is its own coefficient; the same coefficient can recur at different cuts.

A self-block is forbidden. Adjacent singletons `[a,a]` and `[a+1,a+1]` admit exactly one block in the descending direction. With two copies in degree a and three in degree a+1 there are six independent coordinates. Dropping occurrence labels, reversing source and target, or allowing equality of the left endpoints fails these controls.

**Checks.**

- *Precedes [0,0] [1,1]* holds, and the corresponding block sends the degree-1 basis vector to the degree-0 basis vector.
- *Precedes [0,2] [0,2]* fails: equal left endpoints forbid a self-block.
- *Precedes [0,0] [2,2]* fails despite both endpoints increasing: the overlap inequality is necessary.
- Two target singletons [0,0] and three source singletons [1,1] give six independent coefficients. At cut 0 their matrix can be [[1,0,0],[0,1,0]], of rank 2; identifying equal occurrences would leave only one coefficient.

*Needs:* §§1.3, 2.1.

### 2.3 Surjective restriction to a VN image

Prove surjectivity of centralizer restriction in the increasing direction: for every VN pair, restriction to its unshifted VN image is a surjective complex linear map of opposite-degree centralizers (AKY Lemma 3.2(1), p.16; AKY line 631; MW Lemma II.4, pp.160–161). The up case of `centralizer_image_extension` states this on the native range: any complex linear endomorphism of the range which lowers its induced grading by one and commutes with the restricted N extends to a degree −1 commuting endomorphism of V, with the same value on every range vector.

In the standard decomposition, the nonzero images of target `[s,v]` and source `[t,u]` are `[s+1,v]` and `[t+1,u]`. An allowed image coefficient satisfies `s+1<t+1≤v+1≤u`, which implies the original coefficient criterion `s<t≤v+1≤u`. Lift its scalar on that original block and set unused coordinates to zero. The restriction formula in §2.1 verifies the lift. Deleted singleton blocks create no extra coefficients, and a zero image has the unique zero centralizer element. No genericity hypothesis is required.

*Needs:* §2.2 and the actual image dictionary of §1.5.

### 2.4 Surjective restriction to a WL image

Prove surjectivity of centralizer restriction in the decreasing direction with the same statement for a WL pair (AKY Lemma 3.2(2), p.16; AKY line 633). This is the down case of `centralizer_image_extension`: the given endomorphism of the native range raises degree by one and commutes with its restricted WL operator, and its extension raises degree by one, commutes on V, and agrees on every range vector.

Reflect all grades by `a↦-a`. Both operator degrees change sign, the interval `[b,e]` becomes `[-e,-b]`, and actual range embeddings remain the same underlying linear maps. Apply §2.3 to the reflected pair and transport back. This proves the descending assertion without applying the VN block inequalities to unreversed endpoints.

*Needs:* §§1.2, 1.5, 2.3.

### 2.5 Polynomial Zariski topology

Define `polynomialTopology n` on `Fin n→ℂ` by generating from sets `D(p)={x | eval x p≠0}` for multivariate complex polynomials p. Transport it to a finite-dimensional vector space through a basis. On centralizers call the result *centralizerTopology*; *ZariskiOpenDense P U* means that U is both open and dense for that topology (AKY §3.1, p.16; Lemma 3.4, p.17; MW Remark II.6.1, p.163).

The topology API is stated for finite-dimensional complex vector spaces, including dimension zero (AKY Lemma 3.4, p.17; MW Remark II.6.1, p.163).

- Polynomial nonvanishing loci are open, and invertible linear coordinate changes transport the generated topology to itself.
- The open-dense predicate requires both openness and density; on an irreducible affine space every nonempty open is dense.
- Surjective linear maps pull open dense sets back to open dense sets.
- A nonempty intersection of an affine subspace with an open dense set is open dense in that subspace; without nonemptiness no such conclusion holds.

Invertible linear coordinate changes pull polynomial functions back to polynomial functions. Apply `MvPolynomial.funext` with the zero polynomial: its contrapositive supplies a nonzero evaluation of every nonzero complex polynomial. A finite product of nonzero polynomials is still nonzero. Prove `polynomial_irreducible`, the irreducibility of the whole coordinate affine space. Its transport gives irreducibility of centralizers and the finite-intersection theorem, including an empty family of opens.

Prove preservation of open dense sets under surjective linear inverse image: a surjective complex linear map between finite-dimensional centralizers pulls back an open dense set to an open dense set. A linear section and kernel complement identify the domain with a product, so the pulled-back nonvanishing conditions are nonzero polynomial conditions. For an affine subspace, intersection with a dense open is dense there **provided the intersection is nonempty**; a dense open may avoid a particular subspace entirely.

**Checks.**

- `{z:ℂ | z≠0}` is polynomial Zariski open, as the nonvanishing locus of the coordinate polynomial.
- It is dense, though it omits the origin. This tests genericity against equality with the whole space.
- The usual complex unit disk `{z | ‖z‖<1}` is not polynomial Zariski open. In one variable every proper algebraic closed set is finite, whereas its complement is infinite.
- In dimension zero the whole one-point space is open, dense, and irreducible; a nonzero constant polynomial has that whole nonvanishing locus.
- The polynomial X(X−1) evaluates to 0,0,2 at 0,1,2; a nonzero polynomial need not be nonzero at every point. In zero variables, the sole evaluation of the constant 3 is 3.
- In the one-dimensional centralizer of the adjacent singleton pair, the nonzero scalar locus is open dense, the whole scalar line is open dense, and the singleton {0} is not dense. Pulling the first locus back through the projection ℂ²→ℂ gives x≠0, containing (1,0) and excluding (0,1); a zero map is not a surjection onto ℂ.
- The nonzero scalar locus misses the affine subspace {0}, but meets {1} in its whole point. The intersection-nonempty hypothesis distinguishes these subspaces.

*Needs:* `MvPolynomial.eval`, `MvPolynomial.funext`, `TopologicalSpace.generateFrom`, `IsIrreducible`, and the two basis contracts; §2.1 for the centralizer specialization.

### 2.6 Generic commuting type

Construct *genericType P* by maximizing all graded path ranks of an opposite operator in *centralizer P*. Within a finite support window only finitely many paths are relevant, with zero paths included as grade dimensions. Each rank has an attained maximum; an attained maximal minor gives a nonzero polynomial. Their rank-maximal loci have nonempty dense open intersection. The rank differences of §1.4 assign one interval multiset to that intersection (Z98 §2, p.410; AKY §3.1, p.16).

Define *genericLocus P* to contain exactly the opposite operators of that type. Its API follows the rank construction (Z98 §2, p.410; AKY §3.1, p.16).

- The full type locus is open dense because its ranks are exactly the attained maxima; its points are precisely the opposite operators with the selected type.
- Graded conjugation preserves the generic type and transports its whole generic locus.
- Any interval type with open dense locus equals the selected type; the intersection argument includes zero-dimensional centralizers.
- Translation of grades translates the generic type and preserves membership in the generic locus under the identity on underlying maps.

Prove translation compatibility of generic type: for either direction and every integer c, *genericType (shiftPair P c) = shiftMultisegment (genericType P) c*. Prove translation compatibility of the generic locus under the identity on underlying endomorphisms: the same opposite map is generic before and after shifting. Reindexing all grades preserves the commuting submodule, its polynomial topology, and every path rank. These targets make genericity available on the shifted image pairs used in §3.5 (AKY §3.1, p.15, shift convention; Proposition 3.5, pp.18–19).

**Checks.**

- The VN chain `[0,2]` has generic opposite type `[0,0]+[1,1]+[2,2]`; its centralizer is zero.
- VN `[0,0]+[1,1]` has generic opposite type `[0,1]`. The generic locus is the nonzero scalar locus, so the zero opposite map is excluded.
- For VN `[0,0]+[2,2]`, the generic opposite type is unchanged: the missing middle grade forces all opposite maps to vanish.
- For the adjacent singleton pair, coefficient 1 is generic and coefficient 0 is not; conjugating by diag(2,1) takes coefficient 1 to 2 and preserves the type [0,1]. Translating both grades by −2 gives the same locus of nonzero coefficients and type [−2,−1]. For the single chain the sole coefficient choice is zero and the generic locus is the whole point.

*Needs:* §§1.4, 2.1, 2.5 and `Matrix.rank`.

### 2.7 Finite-orbit conormal symmetry

Prove generic conormal symmetry: if P is a VN pair and *L∈genericLocus P*, then the generic VN type commuting with `(V,L)` equals *pairType P* (Z81 §4.3 and Proposition 4.4, original pp.20–21; MW Corollary II.7, p.169).

The geometric construction and its necessary comparisons are explicit. For a fixed finite graded dimension vector put `G=∏ₐ GL(Vₐ)`, `E₊=⊕ₐ Hom(Vₐ,Vₐ₊₁)`, and `E₋=⊕ₐ Hom(Vₐ₊₁,Vₐ)`. Realize these as complex affine spaces and the determinant-open algebraic group acting by conjugation. Define *commutingIncidence={(N,L) | NL=LN}* as the reduced closed subvariety defined by its matrix polynomial equations. The pairing `tr(NL)` is nondegenerate block by block. Differentiating conjugation gives `X↦[X,N]`; the equality `tr([X,N]L)=tr(X[N,L])` identifies its annihilator with the centralizer fibre.

The target includes the following scoped geometric statements, all for this particular finite-dimensional action, with the usual algebraic dimension rather than a purely topological surrogate:

- graded-orbit geometry: each orbit is smooth, locally closed, and irreducible, and its tangent space at N is the image of `X↦[X,N]`. Establish constructibility before using the orbit supplier; identify the stabilizer and the differential over characteristic zero.
- the conormal-incidence bundle comparison: over an orbit O, the incidence fibre is its tangent annihilator, forming a conormal vector bundle of rank `dim E₊-dim O`. The trace identification must agree with the polynomial point model.
- the conormal-closure dimension theorem: the closure `C_O` of that bundle is irreducible of dimension `dim E₊`. This uses the dimension of a vector bundle over the orbit and the invariance of dimension under dense closure.
- the incidence-component theorem: the finitely many `C_O` are exactly the incidence components. The interval classification gives finitely many orbits; their conormal bundles cover the incidence, and the equal dimensions prevent proper containment of distinct closures.
- the opposite conormal-closure comparison: projecting a component to `E₋` has image closure with one dense orbit O′. The projection is constructible and G-invariant; a finite orbit stratification of an irreducible closure yields the unique dense orbit. Its inverse image is dense open in the component. On that inverse image the commuting equation places it in the opposite conormal bundle. Closure containment, irreducibility, and equal dimension then identify `C_O` with the opposite conormal closure `C_O′`.
- the generic-fibre comparison: the intersection of O′ with the fixed centralizer fibre over any N in O is nonempty open dense. Use the homogeneous associated bundle with fibre *centralizer(N)* and structure group the stabilizer of N in G to pass from the dense open over O to its fibre; transitivity ensures that every fibre is met. Compare this orbit locus with the rank-defined *genericLocus*.

Swapping `E₊` and `E₋` now gives the required symmetry. Z81 applies Pyasetskii’s finite-orbit theorem; the scoped orbit, bundle, dimension, component, projection, and fibre statements above are the mathematical ingredients to establish for that application. Polynomial irreducibility by itself cannot replace them. They require their algebraic carriers and compatibility maps before this proof is available as a Lean theorem.

**Checks.**

- For the zero graded space, G is the trivial group, both operator spaces are points, the incidence has one component of dimension zero, and the fibre is the whole point.
- With one coordinate in each of degrees 0 and 1, write the up and down arrows as scalars n and l. The incidence is `nl=0`, with the two coordinate-axis components. The nonzero up orbit corresponds to the zero down orbit and conversely.
- On a single VN chain `[0,2]`, the opposite fibre is a point. Its generic type is the three singleton type, whose generic VN commuting type returns the original chain. The commutator witness in Conventions excludes anticommuting equations.
- For the scalar incidence nl=0, the up-axis component projects to the down point {0}, while the down-axis component projects onto the whole down line. The orbit and fibre dimension sums are 1+0=1 and 0+1=1. The fibre over n=0 meets the dense opposite orbit in ℂ×, whereas the fibre over n≠0 is the whole point {0}; this distinguishes orbit conormals from the full cotangent bundle.
- Over the test algebra ℂ[ε]/(ε²), the values n=l=ε satisfy nl=0 although neither value is zero. The resulting test-scheme map need not factor through either axis. The component cover is a cover of the underlying variety, not such a factorization assertion for arbitrary test schemes.

*Needs:* §1.4 for the finite orbit classification; §2.1 for commuting fibres; §§2.5–2.6 for polynomial topology and the rank locus; AlgebraicVectorBundles L0B and L2B for finite locally free sheaves and their geometric total spaces; Tau Ceti’s constructible-orbit theorem with its Noetherian-space and action hypotheses; the action, orbit tangent, bundle-dimension, projection, and fibre comparisons specified in this subsection.

### 2.8 Multisegment duality

Define *dual m := genericType (standardPair m up)*. The duality API is intrinsic to interval types (AKY §3.1, p.16; Z98 §2, p.410).

- For any VN or WL pair P, its generic opposite type is *dual (pairType P)*.
- Duality preserves every grade dimension and hence total length, including the empty type.
- Duality commutes with every integer translation; the standard pair shifted by c has the translated interval type.
- Its square is the identity by §2.9, with the conormal inputs stated there; neither the definition nor the two generic-type identifications uses this assertion as an input.

Prove translation compatibility of duality: *dual (shiftMultisegment m c) = shiftMultisegment (dual m) c* for every m and integer c, using translation compatibility of generic type and the shifted standard-pair isomorphism. For example, translating `[0,0]+[1,1]` by −2 translates its dual `[0,1]` to `[-2,-1]`.

For the VN statement use conjugacy to the standard pair. For the WL statement transpose operators to the graded vector-space dual, keeping the dual of `Vₐ` in grade a. Transposition switches operator directions, preserves interval labels and the commuting equation, and is an algebraic linear isomorphism of the centralizer coordinate spaces. This establishes the WL assertion independently of involutivity. Grade reflection, in contrast, negates the endpoints and is used only with its explicit interval transformation.

**Checks.**

- *dual [0,2] = [0,0]+[1,1]+[2,2]*.
- *dual ([0,0]+[1,1]) = [0,1]*, so duality is not additive on arbitrary sums.
- *dual ([0,0]+[2,2]) = [0,0]+[2,2]*. The empty multisegment is fixed, and a singleton stays at its original degree.

*Needs:* §§1.3, 2.6.

### 2.9 Duality is involutive

Prove involutivity of duality: for every finite integral multisegment m, *dual (dual m)=m* (Z81 §4.3, original p.20; MW Corollary II.7, p.169). Choose L in the nonempty generic locus of its standard VN pair, apply §2.7, and then identify the opposite generic type using §2.8. The empty case uses the one-point centralizer and requires no positive dimension hypothesis.

*Needs:* §§2.7–2.8.

### Examples

For `m=2[0,0]+3[1,1]`, the centralizer is the full `2×3` matrix space. Generic rank is 2, so the dual is `2[0,1]+[1,1]`. Its opposite generic type is again the original five singleton occurrences. This simultaneously tests multiplicity, rectangular rank, and the fixed dimension vector (MW Lemma II.4, pp.160–161; Z98 §2, p.410).

### Dependencies

Layer 1; finite complex linear algebra; polynomial evaluation, finite bases, generated topology, and matrix rank. Conormal symmetry additionally requires the scoped algebraic geometry of §2.7. The adjacent rank argument in Layer 4 does not depend on that symmetry.

## Layer 3: admissible images and ramified truncation

### 3.1 Admissible commuting images

For a VN pair `P=(V,N)` and *L∈centralizer P*, define *Admissible P L* by *pairType(V,L)=dual(pairType P)*. Define *onOppositeImage P L* as the VN pair on the **unshifted actual image** of L; commutativity makes this image N-stable. Define *imageAdmissibleLocus P* to require admissibility on V and also

```text
pairType(Im L, L|Im L) = dual(pairType(Im L, N|Im L)).
```

The second equality is a separate condition on the restricted triple (AKY §3.1, unnumbered paragraph before Lemma 3.3, p.16; Lemma 3.4, p.17).

The admissible-image API retains both the ambient pair and its actual subspace (AKY §3.1, p.16).

- Admissibility is equivalent to membership in the generic locus.
- The opposite image is N-stable and its embedding satisfies *embed(N_restricted v)=N(embed v)* for every image vector.
- Image-admissibility implies ambient admissibility and imposes the additional restricted-type equality, with neither condition replaced by a mere choice of label.
- Graded intertwining conjugation transports both predicates and both actual image operators; shifting grades transports them as in §3.4.

**Checks.**

- The zero commuting triple on the zero space is admissible, and its image is admissible.
- For VN `[0,0]+[1,1]`, zero L is not admissible: its WL type has two singletons instead of the dual chain.
- For the VN chain `[0,2]`, zero L is admissible and image-admissible; its centralizer has no nonzero map and its opposite image is zero.
- With the bases of §2.1 and coefficient 1 on [0,1]+[1,2], the opposite image is span(x₀,x₁), with N(x₀)=x₁, and both ambient types are [0,1]+[1,2]. Its image types are [0,1] for N and [0,0]+[1,1] for L, so the restricted equality holds. A proposed image embedding into span(x₁,y₂) fails: L has range span(x₀,x₁), even though the proposed subspace also has dimension 2.
- For the adjacent singleton pair with coefficient 1, the opposite image is span(v₀), its VN and WL operators are zero, and both image types are [0,0]. Coefficient 0 instead fails the ambient admissibility condition before testing the image.

*Needs:* §§1.5, 2.1, 2.8–2.9.

### 3.2 Generic admissibility on the opposite image

Prove openness and density of image-admissibility for every VN pair over ℂ: the subset *imageAdmissibleLocus P* is Zariski open dense in its centralizer (AKY Lemma 3.4, p.17).

For nonemptiness, choose generic L commuting with N. By the downward restriction surjection, pull the generic VN locus on `Im L` back to the centralizer of L. Intersect with its generic VN locus on V, obtaining N′ for which both triples are admissible. Involutivity identifies N′ and N as graded-isomorphic. Conjugating L by that isomorphism produces an image-admissible operator for the original N.

For openness, restrict first to the generic WL-type locus on V. There the WL image type is the fixed *rightTruncate (dual (pairType P))*. Image admissibility requires the finitely many VN path ranks on that WL image to attain their generic maxima. On a nonzero-minor chart for L, select independent image columns as a homogeneous basis. The restricted matrices have rational entries whose denominator is the chosen nonzero minor. Clear these denominators within the chart to give polynomial open conditions. Their union is open in the generic locus; nonemptiness and irreducibility imply density. No division occurs on a chart where the selected minor is zero.

*Needs:* §§3.1, 2.4–2.5, 2.9.

### 3.3 Simultaneous genericity on iterated VN images

Prove simultaneous genericity on iterated images: for every VN pair there is an open dense set of L in its centralizer that is image-admissible on V and whose restrictions to **every** unshifted `Im N^k` are image-admissible, hence generic. The same original L induces all those restrictions (AKY §3.2, p.18, simultaneous choice preceding Proposition 3.5).

The predicate *simultaneousRestrictions P L* has the following API for every k≥0 (AKY §3.2, p.18).

- The restricted carrier embeds injectively and grade-preservingly onto the actual range of Nᵏ.
- The embedding intertwines the restricted VN operator with N.
- The opposite map is the restriction of this same L: embedding its value agrees with applying L after embedding.
- Simultaneous image-admissibility gives the image-admissibility and genericity of every such restricted triple; at k=0 it gives the ambient condition.

Iterating §2.3 gives a surjective restriction map to each image centralizer. Pull back the image-admissible dense opens from §3.2 and take their finite intersection. Nilpotence bounds the number of nonzero images; later zero images impose an automatic condition. The stronger image-admissibility condition is needed for the second image in §3.5, not merely opposite genericity on the ambient space.

**Checks.**

- On the VN chain `[0,2]` with L=0, the ranges of Nᵏ have dimensions 3,2,1,0 for k=0,1,2,3, and every restricted opposite map is zero. These triples are image-admissible. At k=0 an embedding onto the zero subspace fails: the required range is all of V, of dimension 3.
- On VN `[0,0]+[1,1]` with L(v₁)=λv₀ and λ≠0, k=0 carries L itself, and every k≥1 carries the unique zero map on the zero range. The ambient triple is image-admissible: on Im L the VN and WL types are both `[0,0]`. Replacing the k=0 map by v₁↦2λv₀ still commutes with N=0, but the identification equation on v₁ has values 2λv₀ and λv₀ and fails. Taking ambient L=0 satisfies the restriction equations but fails ambient admissibility.
- On `[0,1]+[1,2]` with the bases of §2.1 and λ≠0, Im N is span(x₁,y₂), of VN type `[1,1]+[2,2]`. The restricted opposite map sends y₂ to λx₁, so its WL type is `[1,2]`; its opposite image is span(x₁), where both restricted types are `[1,1]`. Thus this image triple is image-admissible. Assigning zero instead on Im N gives values 0 and λx₁ in the restriction equation on y₂ and fails, although it commutes with the restricted N=0.

*Needs:* §§1.2, 1.5, 2.3, 2.5, 3.2.

### 3.4 Ramified multisegments

Define

```text
ram(m) = dual(rightTruncate(dual(m))).
```

The ramification API relates the interval operation to an actual VN image (AKY §2.3, p.8; §3.2, p.18).

- Its dual is the right truncation of the dual: *dual(ram m)=rightTruncate(dual m)*.
- For an image-admissible L commuting with a VN pair of type m, the unshifted pair on Im L with restricted N has type *ram m*.
- Its total length is at most that of m, because its carrier is an actual subspace of V.
- Ramification commutes with every integer translation; image-admissibility is preserved under the same regrading.

Prove translation compatibility of ramification, commuting ramification with every integer translation, from translation compatibility of duality and right truncation. The same opposite map is image-admissible on a pair and on its shift: the range carrier stays fixed while all its grades are reindexed. This follows from translation compatibility of the generic locus, the translation formula for interval types, and translation compatibility of duality, and applies in particular to the shift by −1 in §3.5.

The WL image type is *rightTruncate(dual m)* by §1.5. The second admissibility equality and dual involutivity give precisely the claimed VN type. The operation is defined on integral intervals independently of representations or a local field.

**Checks.**

- *ram [0,2]* is empty: the dual consists of three singletons and truncation deletes all three.
- *ram ([0,0]+[1,1])=[0,0]*. Its length is 1, not 2, and its degree is 0, not 1.
- *ram ([0,0]+[2,2])* is empty. The empty multisegment also has empty ramification.

*Needs:* §§1.5, 2.9, 3.1–3.2.

### 3.5 Ram and right truncation commute

Prove commutation of ramification with right truncation for every finite integral m:

```text
ram(rightTruncate m) = rightTruncate(ram m).
```

Choose one L satisfying §3.3. For the left side take the VN image, shift it by −1, and then take the image of restricted L. For the right side take the WL image first, then its VN image and shift by −1. Both are actual copies of `Im(LN)(-1)=Im(NL)(-1)`, with restricted N. Image admissibility on V and `Im N` identifies their ramified types. The common shift is necessary; equality of unshifted ranges alone would give the wrong endpoints (AKY Proposition 3.5 and proof, pp.18–19).

*Needs:* §§1.5, 2.6, 2.8, 3.3–3.4, including their shift compatibilities.

### Examples

For `[0,0]+[1,1]`, right truncation is empty; its ramified type `[0,0]` also truncates to empty. For the VN chain `[0,2]`, ramification vanishes before and after truncation. For `[0,1]+[1,2]`, the generic opposite image has VN type `[0,1]`: truncating it gives `[0,0]`, the same result as ramifying the truncated singleton sum `[0,0]+[1,1]`. These cases detect the VN shift (AKY Proposition 3.5, pp.18–19).

### Dependencies

Layers 1–2, with both centralizer restriction surjections and conormal involutivity; finite intersections of dense opens. All image statements use the actual range embeddings of Layer 1.

## Layer 4: weighted chains and adjacent generic ranks

### 4.1 Cut multisegments and weighted inclusion chains

For `a:ℤ` define `cutPart m a` to retain every occurrence containing a **or** a+1. Write this full submultisegment as `mₐ`. Define `IsInclusionChain A` as Mathlib’s `IsChain (· ≤ ·) (A : Set Interval)`, equivalently pairwise inclusion comparability. Weight A by `∑_{s∈A} mₐ.count s`, and define `chainWeight m a`, written `Eₐ(m)`, as the maximum of that weight over chains in the distinct support of mₐ. The empty chain is allowed. Define *adjacentDualCount m a* as the number of occurrences of *dual m* containing **both** a and a+1 (AKY §3.3, Proposition 3.7, pp.19–20).

The weighted-cut API keeps full multiplicities (AKY Proposition 3.7, pp.19–20).

- A retained interval has its full occurrence count, and an omitted interval has count zero.
- The empty and singleton sets are inclusion chains; a set containing two inclusion-incomparable intervals is not a chain.
- Chain weight is at most the cut cardinality, and is zero if and only if the cut is empty.
- The maximum is attained among the inclusion chains in the distinct finite support, with every chosen interval contributing its full multiplicity.
- The adjacent dual count equals the opposite arrow rank, as proved in §4.4; it counts containment of both grades, whereas the cut itself uses containment of either grade.

The finite maximum is the supremum of weights over the chain-filtered powerset of the support. Counting only that support's size gives a different invariant.

**Checks.**

- `[0,0]+[1,1]` has cut cardinality 2 at a=0, although neither interval contains both endpoints.
- For `2[0,1]+[1,1]`, `E₀=3`: both distinct intervals form an inclusion chain and all copies contribute.
- For `[0,0]+[1,1]`, `E₀=1`; the two intervals are not comparable by inclusion.
- Outside the support, for example a=3 for this last multisegment, the cut and its maximum are both zero. The empty interval set is an inclusion chain, as is `{[0,2],[1,1]}`, whereas `{[0,0],[1,1]}` is not.
- The adjacent dual count of `[0,0]+[1,1]` at a=0 is 1, since its dual `[0,1]` contains both 0 and 1. At a=1 the count is 0, since that interval omits 2.
- The adjacent dual counts at a=0 for `2[0,1]+[1,1]` and `[0,2]+[1,1]` are both zero: their duals are respectively `2[0,0]+3[1,1]` and `[0,0]+2[1,1]+[2,2]`, consisting entirely of singletons.
- For `[0,2]`, its dual `[0,0]+[1,1]+[2,2]` has two occurrences meeting {0,1}, but none containing both; the adjacent dual count is 0, whereas counting occurrences merely meeting the cut gives 2.

*Needs:* §§0.1–0.2 and §2.8 only for *adjacentDualCount*.

### 4.2 The occurrence endpoint poset

For any multisegment q, use its occurrence labels `Fin q.card`. Define `endpointBefore q x y` by strict increase of both endpoints. This is a strict partial order. Equal intervals at different labels are incomparable; equality of just one endpoint also prevents strict comparison (MW II.1, p.148; Lemma II.4, pp.160–161; DIL Theorem 3, pp.6-1–6-2).

Define `IsEndpointAntichain q A` as Mathlib’s `IsAntichain (endpointBefore q) (A : Set (Fin q.card))`, equivalently absence of any endpoint-order edge in A, and `antichainWidth q` as its largest feasible cardinality. Define `IsEndpointMatching q E` for a finite set of ordered pairs by requiring each pair to be an edge and both coordinate projections to be injective on E. `matchingNumber q` is the largest feasible edge count in this split bipartite graph. A vertex can be used once on the left and once on the right, since those are different roles (DIL split-poset construction, p.6-3).

The occurrence-poset API distinguishes vertices from their interval values (DIL pp.6-3–6-4).

- The strict endpoint relation is irreflexive and transitive; its reflexive closure uses equality of occurrence labels.
- A matching has distinct left projections and distinct right projections, and size at most the occurrence cardinality; the two roles may use the same label.
- A bound on either maximum holds if and only if it holds on every feasible matching or antichain, respectively.
- Permuting occurrence labels preserves the matching number and antichain width.
- The empty sets are feasible; both maxima are zero on the empty multisegment, while repeated identical intervals contribute their full antichain multiplicity.

**Checks.**

- For `2[0,1]`, width is 2 and matching number is 0. Making equal copies comparable destroys this value.
- For `[0,0]+[1,1]`, width is 1 and matching number is 1, with the edge from the degree-0 singleton’s left copy to the degree-1 singleton’s right copy.
- For `[0,2]+[1,1]`, width is 2 and matching number is 0; increasing only the left endpoint does not make an edge.
- For `[0,0]+[1,1]+[2,2]`, the two successive edges form a matching of size 2. The middle label appears in opposite roles, which is allowed.
- In the same three-singleton poset, the edges `0→1` and `0→2` fail the matching predicate because they reuse a left vertex. The edges `0→2` and `1→2` fail because they reuse a right vertex. Checking just that the pairs are edges would admit both forbidden sets.
- The empty matching on the empty multisegment is valid and both maxima are zero. Duplicate intervals form an endpoint antichain; adjacent singleton labels do not. Equal left endpoints `[0,0],[0,1]` likewise give no strict endpoint edge.

*Needs:* §0.2, finite powersets, occurrence labels, and integer endpoint comparisons.

### 4.3 Finite chain decomposition

Prove `finite_dilworth`: for every finite partial order, there are an antichain A and a finite set C of nonempty chains, pairwise disjoint and with union the whole carrier, such that A and C have equal cardinalities (DIL Theorem 3, pp.6-1–6-2; DIL line 40). No nonempty-carrier hypothesis is imposed. Weak duality for any chain cover follows because a chain meets an antichain in at most one point; together these statements make A maximum and C minimum.

Prove `weighted_dilworth` for every q:

```text
matchingNumber q + antichainWidth q = q.card.
```

Prove `cut_antichain_width`, identifying `antichainWidth (cutPart m a)` with `Eₐ(m)` (DIL Theorem 3 and its first inductive proof, pp.6-1–6-2; split-graph argument, p.6-3; weighted occurrence discussion, p.6-4).

For finite Dilworth, induct on the poset cardinality. A maximum antichain separating proper lower and upper subposets lets their chain partitions be glued along its vertices. If no such maximum antichain exists, a chain joining a minimal and maximal element can be removed while reducing the width by one. This proves a partition into width-many chains. Successive vertices in each chain give a split-graph matching with `card-width` edges. Conversely matching edges produce an acyclic graph with at most one incoming and one outgoing edge at each vertex; its paths form `card-size` poset chains. These two constructions establish the displayed identity without requiring a flow or polyhedral theorem.

Use the partial order `x ≤ y ↔ x=y ∨ endpointBefore q x y`, so different equal-interval labels remain incomparable. State the finite-poset input as weak duality for arbitrary chain covers and existence of an equal-size antichain and disjoint chain partition, using Mathlib’s chain and antichain vocabulary specified under Scope and ownership. The numerical maxima in §4.2 then summarize these witnesses for the rank formula.

For intervals, two labels are incomparable for the strict endpoint order precisely when their underlying intervals are comparable for inclusion. This also holds when an endpoint agrees or the intervals are equal. Thus endpoint antichains correspond to inclusion chains with selected copies. A maximum antichain can include all copies of each selected interval, giving the weighted value Eₐ. Distinct copies are essential in this correspondence.

**Checks.**

- For the empty partial order, A and C are empty, their union is empty, and both cardinalities are 0. Adding an empty chain would give one part and violate equality.
- For the three-element total order 0<1<2, take A={1} and C={{0,1,2}}; both cardinalities are 1, and the one part meets A once.
- For a three-element antichain, take all three elements as A and their three singleton sets as C. Both cardinalities are 3; combining any two elements into a part would violate the chain condition.

*Needs:* §§4.1–4.2.

### 4.4 Adjacent generic rank from matchings

Prove the adjacent generic-rank theorem: for every m and integer a, the generic rank of `L:Vₐ₊₁→Vₐ` in the opposite centralizer of the standard VN pair equals `matchingNumber mₐ`. Consequently it equals *adjacentDualCount m a* (MW Lemma II.4, pp.160–161; Z98 §3, Theorem 1, pp.410–411, for the surrounding Knight–Zelevinsky rank formula).

At this cut, pad the rows and columns with isolated zero entries for cut occurrences missing the respective grade. An endpoint-order edge automatically has a target containing a and a source containing a+1: otherwise its strict endpoint inequalities contradict membership in the cut. The overlap inequality in §2.2 is then automatic. Each allowed matrix entry is one **different** centralizer coordinate. A nonzero determinant monomial in a minor gives a matching, so rank is bounded by the maximum matching size. Set exactly the coordinates of a maximum matching to 1 and all other coordinates to 0; the selected submatrix is a permutation matrix. This attains the bound, and §2.6 supplies the dense open rank-maximal locus. A WL interval crosses this arrow exactly when it contains `[a,a+1]`.

Only one-arrow ranks enter this proof. The same coordinate can recur in longer powers, so this argument is not asserted for arbitrary powers of L. The two-by-three singleton example in Layer 2 attains rank 2; a single VN chain has no allowed opposite coordinate and rank zero.

*Needs:* §§2.2, 2.6, 4.2 and `Matrix.rank`.

### 4.5 Monotone grid paths

For arbitrary `r,a:ℕ`, define `GridPath r a` to consist of `r+1` integer-coordinate vertices indexed by `Fin (r+1)`, beginning at `(a+1,a)` and ending at `(1,r)`. Each step is `(−1,0)` or `(0,1)`. Define `InWindow m r` by `1≤b≤e≤r` for every interval of m. Define `intervalWeight m i j` to be `m.count [i,j]` when `i≤j` and zero otherwise, and `GridPath.weight p m` as the sum over its vertices (AKY proof of Proposition 3.7, pp.20–21, Figures 1–2).

The path and window API has these laws (AKY Proposition 3.7 proof, pp.20–21).

- Path coordinates are monotone, their total step counts force a≤r, and their valid vertices are distinct nested intervals meeting the adjacent cut.
- Invalid endpoint pairs and absent intervals have weight zero; every valid present interval has its full occurrence multiplicity, and path weight is the sum of these values.
- The support-window predicate bounds both endpoints of every occurrence and holds vacuously on empty input.
- Every path satisfies `GridPath.weight_bound`; under the window hypothesis and a≤r, `grid_path_chain_max` supplies an attaining path.

When a path exists, a≤r; there are exactly a steps decreasing the first coordinate and r−a increasing the second. The path stays in `[1,a+1]×[a,r]`; its only reversed-endpoint vertex is the initial `(a+1,a)`. Prove coordinate monotonicity along any such path and zero weight of its invalid initial vertex. Prove `GridPath.weight_bound`, giving `p.weight m≤Eₐ(m)` for every m, r and a; a window hypothesis is needed only for the attaining path of §4.6. The valid vertices are distinct nested intervals meeting {a,a+1}, even if m has support outside [1,r]. These weights count multiplicities, not the number of visited vertices.

**Checks.**

- For r=3 and a=1 the endpoint is `(1,3)`, not `(1,1)`. The path `(2,1),(1,1),(1,2),(1,3)` has step differences `(−1,0),(0,1),(0,1)`. Replacing its start by `(1,1)` violates the initial condition; replacing a step by `(0,2)` violates the unit-step condition.
- For m=`[1,3]`, the invalid initial vertex `(2,1)` has weight zero.
- For m=`2[1,3]`, the vertex `(1,3)` has weight 2, and the displayed path has vertex weights `(0,0,0,2)` and total weight 2. For the empty multisegment all four weights are zero.
- For r=1 the cuts with a path are a=0 and a=1. Under `InWindow m 1`, their paths `(1,0),(1,1)` and `(2,1),(1,1)` each have weight equal to the multiplicity of `[1,1]`, hence to the cut cardinality. For r=0,a=0 the single invalid vertex `(1,0)` has weight 0, and the window forces m empty, so E₀=0. An absent valid vertex, such as `[1,2]` in m=`[1,3]`, also has weight zero.
- For r=3,a=1 and m=`[0,1]`, every path has weight 0 while E₁=1. This shows why attainment needs the window hypothesis, although the upper bound does not.
- The window predicate holds for `[1,3]` with r=3; the endpoints equal its two allowed extremes.
- It fails for `[0,1]` with r=3 at the lower bound 1≤0, and for `[2,4]` at the upper bound 4≤3. A one-sided window condition would admit one of these.
- The empty multisegment satisfies the window predicate for r=0, whereas `[1,1]` does not, since 1≤0 fails at its right endpoint.

*Needs:* §§0.1–0.2, 4.1 and finite sequences. The endpoint used here is the path definition on AKY p.20; the later converse-path sentence on that page has an inconsistent terminal coordinate.

### 4.6 Paths compute the chain maximum

Prove `grid_path_chain_max`: for `InWindow m r` and `a≤r`, some grid path attains Eₐ(m); §4.5 bounds every path by this value. For a>r no path exists (AKY proof of Proposition 3.7, pp.20–21 treats the interior range 1≤a<r; AKY line 793 and line 863). At a=0 the cut intervals are all `[1,j]` and the all-up path visits every one; at a=r they are all `[i,r]` and the all-left path does so. Each boundary cut is an inclusion chain, so its full cardinality is Eₐ(m).

The valid vertices on a path are nested intervals. Taking all occurrences of their intervals gives a full inclusion-chain submultisegment with weight equal to the path weight. Conversely order any inclusion chain by containment, interpolate its endpoint pairs with permitted unit steps, and extend from `(a+1,a)` to `(1,r)`. Added vertices have nonnegative weights, so an extension has at least the original chain’s weight. Apply this to a maximum chain and combine with the upper bound. This is an equality of maxima, not a bijection between all paths and chains: zero-weight vertices can change the path without changing the selected support.

For the interior range 1≤a<r in the adjacent specialization of the Knight–Zelevinsky monotone minimum, a map `ν:[1,a]×[a+1,r]→{a,a+1}` is increasing for the product order. Its two level regions have a staircase boundary of this form. Moving the two regions by one coordinate reindexes the rank sum as the total cut weight minus boundary weight. Every such staircase arises. This locates the independently proved adjacent formula in the source’s conventions without importing its full higher-power proof (Z98 §3, Theorem 1 and formula (1), pp.410–411; AKY pp.19–21).

**Checks.**

- For a=0,r=2,m=`[1,1]`, the path `(1,0),(1,1),(1,2)` has weights 0,1,0 and attains E₀=1.
- For a=r=2,m=`[1,2]`, the path `(3,2),(2,2),(1,2)` has weights 0,0,1 and attains E₂=1.
- For a=3,r=2 even empty m admits no path: reaching first coordinate 1 from 4 requires three decreasing steps, but a path has only two steps. For r=a=0 the single vertex attains 0=E₀ of the empty window.

*Needs:* §§4.1, 4.5.

### 4.7 The adjacent Knight–Zelevinsky formula

Prove the adjacent chain formula for **every** finite integral m and `a:ℤ`:

```text
adjacentDualCount m a + Eₐ(m) = (cutPart m a).card.
```

Equivalently the dual count is `card(mₐ)-Eₐ(m)`; §4.1 supplies the bound making natural subtraction legitimate. Combine §4.4 with the matching-width identity and §4.3’s weighted inclusion interpretation (AKY Proposition 3.7, pp.19–21).

Translation puts any nonempty support in a finite window. All cuts with 0≤a≤r have the path description of §4.6. A cut outside the support is empty or lies at a boundary where all retained intervals have the same extreme endpoint and are nested; then Eₐ equals the cut cardinality and the adjacent rank is zero. This treats single-grade support and empty m without imposing an artificial `r≥2` hypothesis on the all-integer formula.

*Needs:* §§4.1, 4.3–4.4; §4.6 for the source’s grid description.

### Examples

For `[0,0]+[1,1]` at a=0, cut cardinality is 2, E₀ is 1, and the dual `[0,1]` crosses the cut once. For `2[0,1]+[1,1]`, cut cardinality and E₀ are both 3, so no dual interval crosses the cut. For `[0,2]+[1,1]` the two inclusion-comparable intervals likewise give E₀=2 and zero opposite rank. These are distinct checks for meeting versus containing, repeated weights, and nesting (AKY Proposition 3.7, pp.19–21; MW Lemma II.4, pp.160–161).

### Dependencies

Layer 0 and the coordinate and generic-rank parts of Layer 2. Finite poset induction, determinant minors, and finite maxima suffice for the adjacent formula. Conormal involutivity and the representation comparison are not prerequisites of this layer.

## Layer 5: the canonical ramified split and representation interfaces

### 5.1 Truncation respects maximal peeling

Prove `truncate_maximalPart` and `truncate_remainder` for every m:

```text
maximalPart(rightTruncate m) = rightTruncate(maximalPart m),
remainder(rightTruncate m) = rightTruncate(remainder m).
```

Right truncation is injective on nonsingleton intervals and preserves and reflects their inclusion, since both right endpoints decrease by one. Any original interval containing a surviving nonsingleton also survives. A maximal singleton disappears and cannot contain a nonsingleton. Thus the surviving distinct maxima and their one-copy contributions agree. Truncation additivity and cancellation then identify the remainders (AKY Lemma 3.6, p.19, whose proof is omitted in the source).

*Needs:* §§0.2–0.3.

### 5.2 Weighted chain decrement under peeling

Prove `chainWeight_peeling`: if `cutPart m a≠0`, then

```text
Eₐ(m) = Eₐ(remainder m)+1,     Eₐ(maximalPart m)=1.
```

Also prove that if the cut is empty, all three chain weights are zero (AKY proof of Proposition 2.7, pp.21–22).

A chain contains at most one distinct global maximal interval, so removing one copy of every such interval lowers its weight by at most one. This gives `Eₐ(m)≤Eₐ(remainder m)+1`. For the reverse inequality, extend a maximum remainder chain by a global maximal interval containing its largest interval. This interval still meets the cut. If it already occurs in the chain, restore its removed copy; otherwise append it. When the remainder cut is empty, take any maximal interval containing an original cut member. This produces weight at least one. The maximal part’s nonempty cut is an inclusion antichain of distinct intervals with weight one each, so its chain maximum is exactly one.

The nonempty-cut hypothesis cannot be dropped: with empty m, the formula `0=0+1` would be false. The empty companion supplies the required branch of the split proof.

*Needs:* §§0.3, 4.1.

### 5.3 Ramified additivity for the canonical maximal split

Prove ramified additivity for the maximal split for every finite integral m:

```text
ram m = ram(maximalPart m) + ram(remainder m).
```

This identity concerns the canonical one-copy split (AKY Proposition 2.7, p.10; proof, pp.21–22).

Induct on *totalLength m*, using its strict drop under truncation when m is nonempty. By §5.1 and the induction hypothesis, the split identity holds for the truncated multisegment. Ram/truncation commutation identifies the corresponding VN image types, with their common shift removed using §1.5. Thus the two VN pairs representing the asserted sides have isomorphic **unshifted** VN images.

For degree a, *ram m* is realized as `(Im L,N|Im L)` on an image-admissible locus. Its dimension there is the adjacent rank `rank(L:Vₐ₊₁→Vₐ)`. The adjacent formula computes it as `card(mₐ)-Eₐ(m)`. Cut cardinality is additive for the maximal part and remainder, and §5.2 makes their chain weights sum to Eₐ(m), including the empty-cut case. Hence the graded dimensions of the two sides agree. Apply §1.6 reconstruction and §1.4 classification.

As a negative control, ramification is not additive on arbitrary sums: *ram([0,0]+[1,1])=[0,0]*, whereas each singleton has empty ramification. Repeated maxima are retained correctly: for `m=[0,0]+2[1,2]+[2,2]`, the canonical split from Layer 0 gives *ram m=[0,0]*.

*Needs:* §§1.4–1.6, 3.4–3.5, 4.7, 5.1–5.2.

### 5.4 Comparison with the representation involution

For a non-archimedean local field F, a unitary irreducible supercuspidal representation ρ of GL_d(F), d≥1, and a real c, define the *integral-segment adapter* by sending `[b,e]` to `[b+c,e+c]_ρ`, with its full occurrence multiplicity. Prove the *representation-duality comparison*: for every integral multisegment m, on GLₙ(F), where n=d·totalLength m,

```text
L(integralSegmentAdapter ρ c m) ≅ Z(integralSegmentAdapter ρ c (dual m)).
```

Both ranks agree because duality preserves every grade dimension and hence total length. The empty label uses the GL₀ unit. The comparison concerns actual irreducible smooth representations and their equivariant isomorphisms (MW II.1, pp.147–148; Proposition II.6, pp.162–169; Proposition II.12, pp.175–176; Theorem II.13, pp.176–177).

The integral-segment adapter has the following API (MW II.1, pp.147–148; Theorem II.13, pp.176–177).

- The image of [b,e] has precisely the twists ρ|det|^(b+c),…,ρ|det|^(e+c), retaining each occurrence.
- Translating the integer endpoints by t tensors the representation by |det|ᵗ; the group rank is d times total interval length.
- The empty multisegment gives the GL₀ unit, and a singleton gives its specified cuspidal twist.
- Common real twists commute with normalized induction, Z, L, and the representation involution. Derive these compatibilities from the character-twist functor and the supplier's unique-subrepresentation and unique-quotient characterizations.

The carriers and classification characterizations are SmoothRepresentationsOfLocalGroups SR.5.2, *segment-representations*, and SR.5.3, *highest-derivative-adapter*.

For the unramified rank-one application, write an arbitrary unramified complex character χ as `χ=χ₀|·|ᶜ`, where

```text
c = -log |χ(ϖ)| / log q,       χ₀ = χ |·|⁻ᶜ.
```

Here `|χ(ϖ)|>0` because χ is unit-valued, and `q>1` because F is a non-archimedean local field; thus the logarithmic denominator is nonzero. The character χ₀ is unitary, and the adapter with ρ=χ₀ sends `[b,e]` to `[b+c,e+c]`. Both χ and the norm are trivial on units, so this is independent of the uniformizer (AKY §2.1, p.7).

Prove the following mathematical recurrence for the geometric dual, without defining a second label function. For nonempty m let k be its least left endpoint. Let p≥1 and `j₁<⋯<jₚ` satisfy: j₁ is the least right endpoint at left endpoint k; for 1≤t<p, jₜ₊₁ is the least right endpoint greater than jₜ at left endpoint k+t; and no interval beginning at k+p has right endpoint greater than jₚ. Let m′ replace one occurrence of every `[k+t-1,j_t]` by `[k+t,j_t]`, deleting a singleton. Prove

```text
dual m = dual m′ + [k,k+p-1],       totalLength m′ = totalLength m - p.
```

The empty value is empty. The hypotheses specify occurrence multiplicities and minimum endpoint conditions as a finite mathematical relation. The identity is the recurrence of Z98 §5, p.412, equations (3)–(4). MW II.2, pp.149–150 and Proposition II.6, pp.162–169 identify the corresponding endpoint recurrence with the generic centralizer type. Its proof uses affine slices meeting the generic locus; nonempty intersection is established before applying Remark II.6.1, p.163.

The comparison uses these scoped inputs. In these inputs Z(q) abbreviates Z of the integral-segment adapter with the fixed ρ and c. The MW order on intervals is decreasing lexicographic order of `(left,right)`, with the empty interval smaller than every nonempty one; extend it lexicographically to ordered multisegment lists of fixed support (MW II.1, p.148).

- *Singleton extraction:* for nonempty m in decreasing MW order let k be its greatest left endpoint and choose the last interval beginning there. Delete that interval's left endpoint, dropping a singleton, to obtain m′. With `α=ρ|det|^(k+c)`, there is an embedding *Z(integralSegmentAdapter ρ c m) ↪ α × Z(integralSegmentAdapter ρ c m′)*, and the second factor is the unique irreducible isomorphism class allowing this embedding. Its group rank is smaller by d (MW Lemma II.11, pp.174–175).
- *Involution on embeddings for the rank-one proof:* on the integral twist line of the trivial GL₁ character (ρ=1,c=0), if irreducibles π,π′ satisfy `π ↪ α × π′`, then `τπ ↪ τπ′ × α`; α is fixed by τ and the normalized product order reverses (MW Corollary I.7.2 and Proposition I.7.3, p.147).
- *Right-singleton candidates and matching exclusion:* every irreducible subrepresentation of `Z(q) × α`, where α is the singleton at k on this line, has label q plus `[k,k]` or q with one occurrence ending at k−1 extended to k. For any occurrence A of q ending at k−1, let B be all occurrences of q ending at k−1 strictly smaller than A. If there is an injection from B to occurrences C of q ending at k, with each C at most A extended to k in MW order and *Precedes B C*, then none of the labels obtained by extending a member of B occurs as such a subrepresentation. Both the domain and codomain consist of occurrence labels (MW Lemma II.10.2, pp.172–173; Remark II.10.3, p.174).
- *Complete right-singleton matching:* if there is an injection from **all** occurrences of q ending at k−1 to distinct occurrences ending at k satisfying *Precedes B C*, every extension label is excluded, so the only irreducible-subrepresentation label is q plus `[k,k]`. The bound `C ≤ [k,k]` in MW order is automatic for intervals ending at k. Duplicate labels remain distinct (MW Lemma II.10.2, pp.172–173; Remark II.10.3 and its counting argument, p.174). For the complete-matching clause, the adjacent-endpoint matching in Lemma II.10.2 exhausts the entire extension domain: the neighborhoods are nested initial sets in left-endpoint order, so the existence of a saturating injection forces the ordered maximal matching of that lemma to cover every k−1-ending occurrence. An exchange of two matched pairs proves this saturation assertion. This is a finite endpoint argument applied to the representation lemma, independent of the duality comparison.
- *Dual reinsertion:* for m,m′ in singleton extraction, *dual m* is obtained from *dual m′* by extending some interval A ending at k−1, or adding `[k,k]` if A is absent. All occurrences B of *dual m′* ending at k−1 strictly smaller than A admit an injection to distinct occurrences C ending at k at most the extended A in MW order, with *Precedes B C*. This is the actual-anchor case (MW Lemma II.3, pp.150–151).
- *Singleton-addition reinsertion:* in the absent-A branch of dual reinsertion, **all** occurrences of *dual m′* ending at k−1 admit an injection to distinct occurrences ending at k with *Precedes B C*; again each C is at most `[k,k]`. Prove this complete-matching refinement along with reinsertion by comparing the adjacent-endpoint chains in the recurrence: a lower chain left unmatched would supply a nonempty interval ending at k−1 to extend, whereas the singleton branch leaves none. The comparison retains distinct occurrence labels throughout (MW Lemma II.3, statement pp.150–151, endpoint-chain comparison in its proof, pp.151–160; §5.4’s recurrence).
- *Cuspidal-line independence:* for any irreducible supercuspidals ρ and σ of GL_d(F) and GL_e(F), d,e≥1, let τ_ρ and τ_σ be the label maps induced by the supplier's representation involution on their integral twist lines. For every finite integral m, `τ_ρ(m)=τ_σ(m)`; the groups have ranks d·totalLength m and e·totalLength m respectively. This is a comparison of label maps, not an isomorphism of representations on different groups (MW Proposition II.12, pp.175–176). Common real translation follows from the twist compatibility in this subsection's adapter API.

One proof route establishes the comparison first with ρ trivial on GL₁ and c=0. Singleton extraction, the involution-on-embeddings input, dual reinsertion, and the quantified matching exclusions give the MW label inequality by induction in total length. In the extension branch use the actual-anchor exclusion; in the singleton-addition branch use complete matching and its exclusion of every extension candidate. A second induction in the finite MW order at fixed support, using geometric and representation involutivity, gives equality. Cuspidal-line independence and common twisting give the stated comparison for all ρ and c (MW Theorem II.13 and proof, pp.176–177). The extraction and exclusion statements above are scoped comparison targets here; the general representation classification and involution remain supplier results.

**Checks.**

- For χ unitary, c=0. For χ=`|·|²`, c=2 and χ₀ is trivial, giving `[b+2,e+2]`. At a uniformizer with q=2, `|χ(ϖ)|=1/4` gives `−log(1/4)/log 2=2`, fixing the sign.
- The empty multisegment has rank zero for every d. The singleton `[b,b]` gives `ρ|det|^(b+c)` on GL_d; rank zero and a zero cuspidal representation are excluded as segment labels.
- For ρ trivial and c=0, `L([0,0]+[1,1]) ≅ Z([0,1])`; the determinant-character and Steinberg witness in Conventions distinguishes the two normalizations.
- For a GL₂ supercuspidal ρ, `[0,1]_ρ` is on GL₄. The comparison identifies its L representation with Z of `[0,0]_ρ+[1,1]_ρ`; its Z representation is not a determinant character.
- Over F=𝔽₂((t)) with ρ trivial, the same adjacent-singleton comparison is on GL₂ and q=2. No mixed-characteristic hypothesis is used.
- The recurrence gives *dual [0,2]=[0,0]+[1,1]+[2,2]* and *dual ([0,0]+[1,1])=[0,1]*; applying duality twice returns the original input.
- For `2[0,1]`, the dual is `2[0,0]+2[1,1]`; empty input stays empty. Deduplicating occurrences changes both grade dimensions from 2 to 1.
- In reinsertion, m=`[0,0]+[1,1]` has k=1 and m′=`[0,0]`, so A=`[0,0]` extends to `[0,1]`. For m=`2[0,0]`, A is absent and one singleton is added. For matching exclusion, q=`[0,2]+[1,3]+[2,2]`, k=3, A=`[2,2]`: its sole smaller occurrence `[0,2]` matches `[1,3]`, which is strictly below `[2,3]`. Extending `[0,2]` is therefore excluded.
- For m=`[0,1]+[1,1]`, extraction at k=1 gives m′=`[0,1]`, q=*dual m′*=`[0,0]+[1,1]`, and *dual m*=`[0,0]+2[1,1]`. Reinsertion adds a singleton, although q has the extension candidate `[0,1]+[1,1]`, strictly smaller in MW order. The complete matching `[0,0] ↦ [1,1]` excludes that candidate; an empty matching domain would exclude nothing.
- At k=1, q=`2[0,0]+2[1,1]` has a complete matching using both copies on each side, so only `2[0,0]+3[1,1]` is a subrepresentation label after right multiplication by the singleton. For q=`2[0,0]+[1,1]`, two occurrences cannot inject into one; the complete-matching exclusion does not apply, and an unmatched occurrence gives the extension label `[0,0]+[0,1]+[1,1]`. A matching of distinct interval values would incorrectly pass this negative control.
- For m=`2[0,1]+[1,2]+[2,2]`, singleton extraction at k=2 gives m′=`2[0,1]+[1,2]` and *dual m′=[0,0]+[0,1]+[1,1]+[1,2]*. Reinsertion extends A=`[1,1]`; its smaller occurrence B=`[0,1]` matches C=`[1,2]`, equal to the extended A. The dual of m is `[0,0]+[0,1]+2[1,2]`. Requiring C to be strictly smaller would make this valid reinsertion impossible.

*Needs:* §§0.2, 2.2, 2.6–2.9; SmoothRepresentationsOfLocalGroups SR.0–SR.3, SR.5.2 *segment-representations* and SR.5.3 *highest-derivative-adapter*; the scoped MW comparison inputs above. No local-field hypothesis enters Layers 0–4 or §5.3.

### 5.5 Newform and unipotent-induction interface

Export *ram*, the VN-image realization of ramification, commutation of ramification with right truncation, and ramified additivity for the maximal split to the general-linear newform consumers. Define *newformExample* to be the following multisegment m, and prove the displayed newform ramification identity:

```text
m = [5,6]+[3,7]+[3,4]+[2,5]+[3,3]+[1,2]+[0,0],
ram m = [4,4]+[2,5]+[1,2]+[0,0].
```

The worked-input API records its full multiplicity and its relation to the preceding targets (AKY §2.5, pp.11–13).

- Its seven occurrences give total length 17 and the degree counts obtained by inclusive interval membership.
- Its maximal part and remainder are the one-copy decomposition of §0.3, and their sum recovers the input.
- Applying ramification gives the displayed four-interval multiset; its canonical-split calculation uses §5.3 and its successive remainder.

Its total length decreases from 17 to 8. The output interval lengths and the canonical split equality supply the tuple comparison and the unipotent induction. The consumer defines the tuple and proves the representation-conductor and induction statements (AKY §2.5, pp.11–13; Proposition 2.4, p.9; Corollary 2.8, pp.10–11).

Compute the maximal part `[3,7]+[2,5]+[1,2]+[0,0]`. Its dual is `[7,7]+[5,6]+[4,5]+[2,4]+[0,3]`; right truncation deletes the first singleton and leaves `[5,5]+[4,4]+[2,3]+[0,2]`. Their dual is `[2,5]+[1,2]+[0,0]`. The remainder is `[5,6]+[3,4]+[3,3]`. Its maximal part, the first two intervals, has ramification `[4,4]`, and the remaining singleton has empty ramification. Apply §5.3 twice.

Keep the four surviving shortened intervals with their original labels, or introduce four new labels without another shortening. The prose and diagrams around AKY p.12 use differing labels; the displayed endpoint values above implement exactly one shortening.

**Checks.**

- *newformExample.card=7* and *totalLength newformExample=17*; treating the seven intervals as seven basis vectors fails.
- Its degree-3 dimension is 4: `[3,7]`, `[3,4]`, `[2,5]`, and `[3,3]` each contribute once. Omitting singleton support changes this dimension.
- The ramified output has four occurrences, total length 8, and degree-3 dimension 1. These values distinguish the displayed output from a second shortening or loss of multiplicity.

*Needs:* §5.3 for the interval computation and §5.4 for its representation interpretation.

### Examples

For `m=2[0,2]`, the canonical split leaves one chain in each part and both ramified parts are empty. For `[0,0]+2[1,2]+[2,2]`, the maximal part `[0,0]+[1,2]` has ramification `[0,0]`, and the remainder `[1,2]+[2,2]` has empty ramification. The rank-17 computation of §5.5 then exercises successive peeling beyond these small cases (AKY Proposition 2.7, p.10; §§2.4–2.5, pp.10–13).

### Dependencies

Layers 0–4 for canonical ramified additivity. The final representation comparison alone imports the smooth-representation contracts and its MW comparison interfaces. The newform consumer receives the interval results without owning another copy of multisegment duality.

## Downstream consumers

The general-linear newform work extracted from AKY Proposition 2.4 uses the VN realization of ramification and simultaneous genericity to read conductor differences from ranks on iterated images. Its Corollary 2.8 uses the canonical maximal split to separate the contributions in the unipotent induction. Both consumers receive actual equality of interval multisets, hence equality of their full multiplicities and length data. Arbitrary additivity is unavailable, as the adjacent-singleton control in §5.3 shows.

Representation comparisons consume the representation-duality comparison only after adopting the supplier’s normalized Z/L conventions. Combinatorial uses of adjacent ranks, grid maxima, and maximal peeling depend on no local field, local Langlands parameter, or conductor normalization.

## References

All AKY locators refer to the printed pages of arXiv v4; MW and Z98 locators use printed journal pages, and DIL uses its lecture labels.

- **AKY:** Hiraku Atobe, Satoshi Kondo, Seidai Yasuda, *Local newforms for the general linear groups over a non-archimedean local field*, [arXiv:2110.09070v4](https://arxiv.org/pdf/2110.09070v4), 28 September 2022. Published in *Forum of Mathematics, Pi* 10 (2022), e24, [DOI 10.1017/fmp.2022.17](https://doi.org/10.1017/fmp.2022.17). Segment conventions: §2.1, p.7 and §2.3, p.8; maximal split and consumers: §§2.4–2.5, pp.10–13; graded operators and proofs: §§3.1–3.3, pp.14–22.
- **MW:** Colette Mœglin, Jean-Loup Waldspurger, *Sur l’involution de Zelevinski*, *Journal für die reine und angewandte Mathematik* 372 (1986), 136–177, [GDZ scan](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002204061), [DOI 10.1515/crll.1986.372.136](https://doi.org/10.1515/crll.1986.372.136). Endpoint order and recurrence: II.1–II.2, pp.148–150; commuting coordinates: Lemma II.4, pp.160–161; geometric identification: Proposition II.6, pp.162–169; involutivity: Corollary II.7, p.169; cuspidal-label independence: Proposition II.12, pp.175–176; representation identification: Theorem II.13, pp.176–177.
- **Z81:** Andrei V. Zelevinskii, *p-adic analog of the Kazhdan–Lusztig hypothesis*, *Funktsional’nyi Analiz i ego Prilozheniya* 15:2 (1981), 9–21, [original article](https://www.mathnet.ru/eng/faa1707). English translation in *Functional Analysis and Its Applications* 15 (1981), 83–92, [DOI 10.1007/BF01082279](https://doi.org/10.1007/BF01082279). §4.3 and Proposition 4.4, original pp.20–21, give the conormal correspondence and commuting trace description; §4.5 states the representation comparison as a conjecture, subsequently proved by MW.
- **Z98:** Andrei Zelevinsky, *Multisegment duality, canonical bases and total positivity*, *Documenta Mathematica*, Extra Volume ICM 1998, III, 409–417, [article](https://ems.press/content/book-chapter-files/27254?nt=1). §2, p.410 gives the generic operator description; §3, Theorem 1, pp.410–411 gives the Knight–Zelevinsky formula; §5, p.412 gives the recursive rule.
- **DIL:** Michel X. Goemans, scribe Joungkeun Lim, *18.997 Topics in Combinatorial Optimization, Lecture 6*, MIT, 26 February 2004, [lecture notes](https://ocw.mit.edu/courses/18-997-topics-in-combinatorial-optimization-spring-2004/72c5d7935dea64f0e2773ad376f83d5d_co_lec6.pdf). Theorem 3 and its inductive proof, pp.6-1–6-2; matching/chain correspondence, p.6-3; weighted occurrence constructions, p.6-4.

The adjacent formula is attributed to Knight–Zelevinsky through Z98 Theorem 1 and AKY Proposition 3.7. The adjacent proof route uses independent block coordinates and finite matching; it requires no assertion about the complete higher-power argument of Knight–Zelevinsky’s 1996 article.
