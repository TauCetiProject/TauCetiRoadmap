# Roadmap: induction, restriction, and Mackey theory for finite groups

**Summary.** Induction and restriction move representations between a finite group G and its
subgroups H, K and normal subgroups N, over a commutative ring k for statements about
representations and over a field k for characters and simplicity. The classical theory runs from
transitivity and the projection formula, through conjugate representations, induced characters,
Frobenius reciprocity, Mackey's decomposition and irreducibility criterion and Clifford theory, to
Artin's and Brauer's induction theorems, projective representations and Schur multipliers. Mathlib
and Tau Ceti carry its core, much of it over algebraically closed fields; the targets here are the
statements over general fields and the constructions that complete it.

The headline theorems are these.

- *Clifford's theorem over every field.* A simple finite-dimensional representation W of a group
  G (finite or not) over any field restricts to a normal subgroup N as the direct sum of e ≥ 1
  copies of each G-conjugate of one simple representation V of N, the distinct conjugates indexed
  by the finitely many cosets of the inertia group T of V.
- *The Clifford correspondence over every field.* If T has finite index in G (for instance if G is
  finite), induction from T is a bijection, on isomorphism classes, from the simple
  representations of T lying over V to those of G lying over V; no invertibility of |G| and no
  splitting hypothesis is needed.
- *The universal central extension of a perfect group.* For G perfect with a free presentation
  F → G of kernel R, the group [F, F]/[F, R] is perfect, maps onto G with central kernel
  (R ∩ [F, F])/[F, R], and maps uniquely over G to every central extension of G.
- *Clifford obstructions over every field.* If the endomorphisms of V are scalars, its compatible
  projective extensions to T define one class in H²(T/N, kˣ), which vanishes exactly when V extends
  to a representation of T on the same space. If its endomorphism algebra D is a larger division
  algebra, a crossed system of T/N on D governs the extension, and the representations of T whose
  restriction to N is a sum of copies of V are the modules over its crossed-product algebra.

The roadmap also writes Mackey's formula as a finite biproduct, refines the Hom-space decomposition
behind Mackey's criterion, and gives a simple induced representation over ℝ for which the
criterion's disjointness condition fails.

Mathlib supplies the categorical spine (induction, restriction, coinduction, both adjunctions,
characters, group cohomology, group extensions), and Tau Ceti's induction, Clifford and
projective-representation library supplies the theorems the targets generalize and most inputs of
their proofs. The roadmap feeds CharacterTheory (induced and permutation characters, the Mackey
criterion), FiniteGroupInvariants and PolynomialGaloisGroupsPartIII (almost-conjugacy of
subgroups), InverseGaloisAndArithmeticFundamentalGroups and InductionRestrictionPartII
(representation groups), and StableHomotopyKTheory (universal central extensions).

Layer 0 gives generator formulas for induction in stages; Layer 2 two adapters for almost-conjugacy
and Checks on the normalization of the character pairing; Layer 3 Mackey's formula as a biproduct;
Layer 4 the refinements of the Hom-space decomposition and the example over ℝ; Layer 5 Clifford
theory over every field; Layer 6 the virtual-character lattice over a field of characteristic zero;
Layer 7 universal central extensions, projective representations, the scalar obstruction and
division crossed systems. There is no Layer 1: the conjugate representation is a supplier's, as the
Scope section below records.

## Conventions

1. **Groups and subgroups.** `G` is a group (`[Group G]`), finite (`[Finite G]` or `[Fintype G]`)
   exactly where a statement needs it. For `S : Subgroup G` we induce up along `S.subtype : S →* G`
   and restrict down along the same map; `[S.FiniteIndex]` is a hypothesis of the statements that
   need it, and an instance when `G` is finite. Functorial statements
   are made for an arbitrary `φ : G →* H`, as in Mathlib, and specialized to `S.subtype` where the
   subgroup structure is used.
2. **Coefficients in three regimes.** Each statement carries exactly the hypotheses it uses;
   "algebraically closed and of characteristic prime to `|G|`" is never bundled into a class.
   (i) Statements about representations (induction, restriction, Mackey's formula) are over a
   commutative ring `k`. (ii) Statements about traces and characters are over a field; the
   induced character is a sum over coset representatives with no division by `|S|`, and the
   averaged form carries `IsUnit (Nat.card S : k)`. (iii) Normalized pairings and semisimplicity
   arguments carry `hG : IsUnit (Nat.card G : k)`; criteria that need endomorphisms of simple
   objects to be scalars carry that hypothesis explicitly (item 7).
3. **Spine and mirror.** Representations are Mathlib's `Rep k G`; characters are traces on
   `FDRep k G` (`FDRep.character`). Finite-dimensional induction from a subgroup of finite index is
   Tau Ceti's `TauCeti.indFDRep`, and restriction to a subgroup is `Subgroup.resFDRep`.
4. **Adjunctions.** The primary adjunction is induction left adjoint to restriction, Mathlib's
   `Rep.indResAdjunction`: `Hom_G(Ind_S^G A, B) ≃ Hom_S(A, Res_S B)`. For a subgroup of finite index
   induction agrees with coinduction (`Rep.indCoindIso`), so restriction is also left adjoint to
   induction (`Rep.resIndAdjunction`). "Frobenius reciprocity" names the character identity.
5. **Conjugation.** For `s : G` and `H : Subgroup G`, `MulAut.conj s • H` is `sHs⁻¹`: its members
   are the `x` with `s⁻¹ * x * s ∈ H` (Tau Ceti's `TauCeti.mem_conj_smul`), and it equals
   `H.map (MulAut.conj s)` (`TauCeti.map_conj_eq_conj_smul`). The conjugate `{}^s A` of a
   representation `A` of `H` is the representation `TauCeti.conjRep s A` of `sHs⁻¹` on the same
   space, `x` acting as `A.ρ (s⁻¹ x s)`; its character is `({}^s χ)(x) = χ(s⁻¹ x s)`. For a normal
   subgroup `N` the conjugate of `V : FDRep k N` is again a representation of `N`,
   `TauCeti.conjNormalFDRep g V`, and the inertia group `TauCeti.inertia V` is the set of `g` with
   `{}^g V ≅ V`. For example, in `S₃` with `s = (1 2 3)` and `H = ⟨(1 2)⟩`, `MulAut.conj s • H` is
   `⟨(2 3)⟩`, while `s⁻¹ H s` is `⟨(1 3)⟩`.
6. **Double cosets.** Mackey summands are indexed by `DoubleCoset.Quotient (K : Set G) H`, the
   double cosets `K \ G / H`, each with the representative `Quotient.out`. The Mackey subgroup of
   `s` is `TauCeti.mackeySubgroup s H K = K ⊓ sHs⁻¹`, and the summand at `s` is
   `Ind_{K ⊓ sHs⁻¹}^K (Res {}^s A)` (`Rep.mackeySummand`), built from the fixed representative.
7. **Scalar Schur.** "`k` splits `G`" is the hypothesis
   `hSplitG : ∀ W : FDRep k G, Simple W → finrank k (W ⟶ W) = 1`; for a single simple `V` it is
   `∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V`. Splitting `G` does not imply splitting a subgroup (`ℚ`
   splits `S₃` but not its subgroup `A₃`), so each subgroup's hypothesis is stated separately.
   Algebraic closure supplies all of them (Mathlib's `CategoryTheory.finrank_endomorphism_simple_eq_one`).
   The scalar Schur hypothesis does not imply Maschke's theorem: an algebraically closed field of
   characteristic dividing `|G|` satisfies the first and not the second.
8. **Factor sets.** A projective representation is Tau Ceti's `TauCeti.IsProjectiveRep ρ α`: a
   normalized family `ρ : G → (V ≃ₗ[k] V)` with `ρ g ∘ ρ h = α g h • ρ (g h)` and a curried
   normalized factor set `α : G → G → kˣ`. It is data on every module, including `V = 0`, where
   every normalized factor set is allowed; the class of a projective action is intrinsic only when
   `kˣ` acts faithfully on `V` (`[FaithfulSMul kˣ V]`, which holds for nonzero `V` over a field).
   `G` acts trivially on `kˣ` (`TauCeti.trivialMulDistribMulAction`), and `H²(G, kˣ)` is
   `TauCeti.schurMultiplier k G`, the second cohomology of `Additive kˣ` with the trivial action.
9. **Universes.** The statements over `FDRep` and `Rep` put the coefficient ring, the group and
   the carriers in one universe, as Tau Ceti's Mackey decomposition and Clifford correspondence
   do. The exception is the existence of a compatible projective extension (§7.5), stated for `k`
   and `G` in arbitrary universes, as Tau Ceti's algebraically closed version is. The other
   statements of Layer 7 about factor sets and Schur multipliers are made for `Type`, as
   `TauCeti.schurMultiplier` is.
10. **Names.** `Suggested.lean` states its targets in the namespace
    `TauCetiRoadmap.RepresentationTheory.InductionRestriction`, with the sub-namespaces `Gassmann`
    (Layer 2) and `AbstractUCE` (§7.1). In Tau Ceti the material lives under
    `TauCeti/RepresentationTheory/Induction/` and `TauCeti/RepresentationTheory/ProjectiveRepresentation/`.

## Layer 0: the functorial core -- transitivity and the projection formula

### 0.1 Induction in stages through an intermediate subgroup

Let `S ≤ T` be subgroups of `G` (witness `h`) and `k` a commutative ring. Tau Ceti's
`TauCeti.Rep.indFunctorSubgroupOfIso h` identifies inducing a representation `A` of
`S.subgroupOf T` first to `T` and then to `G` with restricting `A` along the identification
`Subgroup.subgroupOfEquivOfLe h` of `S.subgroupOf T` with `S` and inducing from `S` to `G`. Prove
its generator formulas: the forward map sends `⟦g ⊗ ⟦t ⊗ a⟧⟧` to `⟦t g ⊗ a⟧` (`g ∈ G`, `t ∈ T`) and
the inverse sends `⟦g ⊗ a⟧` to `⟦g ⊗ ⟦1 ⊗ a⟧⟧`. These are the formulas Tau Ceti proves for
`TauCeti.Rep.indFunctorCompIso` (`TauCeti.Rep.indFunctorCompIso_hom_app_hom_apply_mk_mk`,
`TauCeti.Rep.indFunctorCompIso_inv_app_hom_apply_mk`), and the isomorphism is that one followed by
the identification of induction along an isomorphism with restriction along its inverse
(`TauCeti.Rep.indFunctorMulEquivIso`), so the proof evaluates the latter on `⟦1 ⊗ a⟧`
(Curtis–Reiner §10–11, transitivity). Induction is `Rep.ind`, whose generators satisfy
`⟦φ(s) g ⊗ ρ(s) a⟧ = ⟦g ⊗ a⟧` and on which `x : G` acts by `⟦g ⊗ a⟧ ↦ ⟦g x⁻¹ ⊗ a⟧`.
*Needs:* Tau Ceti `TauCeti.Rep.indFunctorSubgroupOfIso`, `TauCeti.Rep.indFunctorCompIso` with its
generator lemmas, `TauCeti.Rep.indFunctorMulEquivIso`; Mathlib `Rep.ind`, `Representation.ind_mk`,
`Subgroup.subgroupOfEquivOfLe`.

### Examples

- For `S = 1`, `Ind_1^T A` is `k[T] ⊗ A`, and inducing further to `G` gives the coinvariants of
  `k[G] ⊗ k[T] ⊗ A` under `T`; the forward map `⟦g ⊗ ⟦t ⊗ a⟧⟧ ↦ ⟦t g ⊗ a⟧` is induced by the
  multiplication `(t, g) ↦ t g`, and it is well defined because `⟦x g ⊗ ⟦t x⁻¹ ⊗ a⟧⟧` and
  `⟦g ⊗ ⟦t ⊗ a⟧⟧` both go to `⟦t g ⊗ a⟧`.

### Dependencies

Tau Ceti's transitivity isomorphisms and Mathlib's induction functor.

## Layer 2: induced characters and Frobenius reciprocity

### 2.1 Almost-conjugacy: restriction and quotient-invariant adapters

Two subgroups `H`, `K` of `G` are almost conjugate (Gassmann equivalent) when they meet every
conjugacy class of `G` in the same number of elements; this is Tau Ceti's `Subgroup.AlmostConjugate`,
and, for finite `G` and over a field of characteristic zero, it holds exactly when the permutation
representations on `G ⧸ H` and `G ⧸ K` are equivalent
(`TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`).
Arithmetic applications pass such an equivalence to a decomposition group `D` and to the invariants
of an inertia subgroup `I` normal in `D`. For that, define, over a commutative ring `k`:

- `Gassmann.restrictEquiv`: an equivalence `e` of representations `ρ`, `σ` of `G` restricts, along
  any group homomorphism `f : D →* G`, to an equivalence of `ρ.comp f` and `σ.comp f`, with the same
  underlying linear equivalence.
- `Gassmann.normalInvariantEquiv`: for `I` normal in `G`, `e` induces an equivalence of the
  representations of `G ⧸ I` on the `I`-invariants (Mathlib's `Representation.quotientToInvariants`),
  whose underlying linear map is the restriction of `e` to invariants.

API:

- The underlying linear map of the second adapter is Tau Ceti's
  `Representation.Equiv.invariantsLinearEquiv` of the restriction of `e` to `I`.
- Composed with Tau Ceti's `TauCeti.orbitSumEquiv`, which identifies, for a finite `D`-set `X`,
  the representation of `D ⧸ I` on the `I`-invariants of `k[X]` with the permutation
  representation on the `I`-orbits, an equivalence of the permutation representations of `D` on
  two finite sets yields an equivalence of the permutation representations of `D ⧸ I` on their
  `I`-orbits.

*Needs:* Mathlib `Representation.Equiv`, `Representation.comp`,
`Representation.quotientToInvariants`; Tau Ceti `Representation.Equiv.invariantsLinearEquiv`, and
`TauCeti.orbitSumEquiv` for the second API fact.

### 2.3 Permutation characters and the normalization of the pairing

Over a field `k` with `hG : IsUnit (Nat.card G : k)` and `G` finite, Tau Ceti's character pairing
`TauCeti.ClassFunction.characterPairing` (`⟨f₁, f₂⟩ = |G|⁻¹ ∑_g f₁(g) f₂(g⁻¹)`) is normalized as
follows, and the Checks below test the normalization; neither statement is a target, since each
follows in a line from Tau Ceti.

- The character of the permutation representation `Ind_H^G 1` pairs to `1` with the trivial
  character of `G`: this is Frobenius reciprocity with the trivial representations (Serre,
  Part II, §7.2), and `TauCeti.characterPairing_ofMulAction_eq_card_orbits` with a one-point set
  gives it as the number `1` of orbits of `G` on `G ⧸ H`.
- A simple finite-dimensional representation `V` of `G` with scalar endomorphisms
  (`finrank k (V ⟶ V) = 1`) has `⟨χ_V, χ_V⟩ = 1`: Tau Ceti's
  `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank` gives the pairing of two characters
  as the dimension of the Hom space cast into `k`.

*Needs:* Tau Ceti `TauCeti.ClassFunction.characterPairing`, `TauCeti.ClassFunction.ofCharacter`,
`TauCeti.ClassFunction.ofFDRep`, `TauCeti.char_ind_trivial`, `TauCeti.characterPairing_ind`
(or `TauCeti.characterPairing_ofMulAction_eq_card_orbits` with a one-point set),
`TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank`.

**Checks.**
- For `G = S₃` and `H = ⟨(1 2)⟩` the permutation character is `(3, 1, 0)` on the classes of `1`, the
  transpositions and the 3-cycles, and `⟨χ, 1⟩ = (3 + 3·1 + 2·0)/6 = 1`.
- The invertibility of `|G|` is needed: for `k = 𝔽₂`, `G = C₂` and `H = 1`, the factor
  `(Nat.card G : k)⁻¹` is `0` and the pairing is `0`, not `1`.
- The scalar-endomorphism hypothesis is needed: over `ℝ` the rotation representation of `C₃` on
  `ℝ²` is simple with character `(2, −1, −1)` and `⟨χ, χ⟩ = (4 + 1 + 1)/3 = 2`, the dimension of its
  endomorphism algebra `ℂ`.

### Examples

- The regular actions of `C₄ × C₄` and `Q₈ × C₂` embed both groups in `S₁₆`. Both have one element
  of order 1, three of order 2 and twelve of order 4, so the full cycle types (fixed points
  included) are `1¹⁶`, `2⁸` and `4⁴` with multiplicities 1, 3 and 12; Mathlib's `cycleType` drops
  fixed points, so the identity's is empty and those of orders 2 and 4 are `2⁸` and `4⁴`. The two
  images are almost conjugate by the cycle-type criterion and not conjugate, since one group is
  abelian and the other is not; this is the pair of §2.2 (Scope and ownership). Through §2.1 the
  permutation representations of any subgroup `D` on the two coset spaces are equivalent over `ℚ`.
- For `S₄` and the stabilizer `S₃` of a point, `Ind_{S₃}^{S₄} 1` is the permutation representation
  on four points, its character counts fixed points, and it pairs to `1` with the trivial
  character; its pairing with itself is the number `2` of double cosets `S₃ \ S₄ / S₃`.

### Dependencies

Tau Ceti's almost-conjugacy, orbit-sum and character-pairing API; Mathlib's representations.

## Layer 3: the Mackey decomposition formula

### 3.1 The decomposition as a finite biproduct

Let `H`, `K` be subgroups of `G` with finitely many double cosets `K \ G / H`, `k` a commutative
ring and `A` a representation of `H`. For each double coset with representative `s`, Tau Ceti's
`Rep.mackeyInclusion K s A` is the morphism from the Mackey summand `Ind_{K ⊓ sHs⁻¹}^K (Res {}^s A)`
to `Res_K (Ind_H^G A)` sending `⟦u ⊗ a⟧` to `⟦s⁻¹ u ⊗ a⟧`. Prove
`isIso_biproductDesc_mackeyInclusion`: the morphism out of the categorical biproduct of the
summands whose components are these inclusions is an isomorphism in `Rep k K`, so that
`Res_K (Ind_H^G A) ≅ ⨁_{KsH} Ind_{K ⊓ sHs⁻¹}^K (Res {}^s A)` (Mackey 1951; Curtis–Reiner §10–11).
The statement takes `HasFiniteBiproducts (Rep k K)` as a hypothesis, as the pinned Mathlib does
not infer it for `Rep`; it always holds, since `Rep k K` is abelian and Mathlib's
`CategoryTheory.Abelian.hasFiniteBiproducts` supplies it. *Route.* Tau Ceti's
`Rep.mackeyDecomposition A` identifies `Res_K (Ind_H^G A)` with the direct-sum representation
`Rep.mackeyDirectSum H K A`, and its inverse sends the summand at `s` by `⟦u ⊗ a⟧ ↦ ⟦s⁻¹ u ⊗ a⟧`
(`Rep.mackeyDecomposition_inv_hom_apply_lof`); it remains to identify the finite direct sum of
modules with the categorical biproduct. The summands are built from the chosen representatives; no
statement is made about a representative-free summand.
*Needs:* Tau Ceti `Rep.mackeyInclusion`, `Rep.mackeySummand`, `Rep.mackeyDirectSum`,
`Rep.mackeyDecomposition`, `Rep.mackeyDecomposition_inv_hom_apply_lof`; Mathlib
`DoubleCoset.Quotient`, `CategoryTheory.Limits.biproduct.desc`, `HasFiniteBiproducts`,
`CategoryTheory.Abelian.hasFiniteBiproducts`.

**Checks.**
- For `G = S₃`, `H = K = ⟨(1 2)⟩` and `A` the sign of `H`, there are two double cosets, of sizes 2
  and 4. The summand at `s = 1` is the sign of `H`; at `s = (1 3)` the Mackey subgroup is trivial
  and the summand is the regular representation of `H`. The dimensions `1 + 2 = 3 = [G : H]` agree,
  and the character `(3, −1)` of `Res_H Ind_H^G (sign)` on `1`, `(1 2)` is `(1, −1) + (2, 0)`. An
  indexing by `G / H` or `K \ G` would give three summands.
- For `K = 1` every Mackey subgroup is trivial and the summands are copies of the underlying module
  of `A`, one for each coset in `G / H`.

### Examples

- For `G = S₃`, `H = ⟨(1 2)⟩` and the sign `A` of `H`, the biproduct form gives
  `Res_H Ind_H^G A ≅ sign ⊕ k[H]` over every `k`, while over `ℚ` the induced representation
  `Ind_H^G A ≅ sign ⊕ standard` is reducible.

### Dependencies

Tau Ceti's Mackey decomposition, Mathlib's biproducts in preadditive categories.

## Layer 4: intertwining numbers and the Mackey irreducibility criterion

Throughout, `G` is finite, `H ≤ G`, `k` is a field and `V : FDRep k H`. Tau Ceti's
`FDRep.indHomMackeyLinearEquiv V V` is a `k`-linear equivalence from `End_G(Ind_H^G V)` to the
product, over the double cosets `D ∈ H \ G / H` with representative `s`, of the spaces of
intertwiners from `V` restricted to the Mackey subgroup `H ⊓ sHs⁻¹` to the restriction of `V` along
`y ↦ s⁻¹ y s` (`TauCeti.mackeyToH`); `TauCeti.MackeyDisjoint V s` says that the space at `s` is zero.

### 4.1 The identity component

Let `h₀` be the chosen representative of the identity double coset `H · 1 · H`; it lies in `H`, so
the Mackey subgroup at `h₀` is all of `H` and the intertwiner space at `h₀` is
`Hom_H(V, Res_{y ↦ h₀⁻¹ y h₀} V)`, which composition with the action of `h₀` identifies with
`End_H(V)`. Prove that under `FDRep.indHomMackeyLinearEquiv V V` the image of the induced
endomorphism `FDRep.indEndAlgHom V f`, for `f ∈ End_H(V)`, has component `0` at every double coset
other than the identity one, and that the map sending `f` to the component of that image at the
identity double coset is a `k`-linear isomorphism `End_H(V) ≅ Hom_H(V, Res_{y ↦ h₀⁻¹ y h₀} V)`
(Serre, Part II, §7.4). In particular `FDRep.indEndAlgHom V` is an injective algebra
homomorphism onto the endomorphisms supported at the identity double coset, and it is an algebra
isomorphism exactly when every other component space is zero (Tau Ceti's `FDRep.indEndAlgEquiv`
proves the "if" by counting dimensions).
*Needs:* Tau Ceti `FDRep.indHomMackeyLinearEquiv`, `FDRep.indEndAlgHom`,
`FDRep.indEndAlgHom_injective`, `TauCeti.mackeyToH`, `Rep.mackeyDecomposition`; Mathlib
`DoubleCoset.mk`.

**Checks.**
- For `G = C₂`, `H = 1` and `V = k`, `End_G(Ind V) = End_G(k[C₂])` is `k[C₂]`, of dimension `2`;
  the two double cosets contribute `End(k) = k` each. The image of `f = c` is `c` times the identity
  of `k[C₂]`, which has component `c` at the identity double coset and `0` at the other; placing
  `f` at the other component would send the identity of `V` to the swap of the two basis vectors.

### 4.2 Change of double-coset representative

For `s ∈ G` and `h₁, h₂ ∈ H`, construct a `k`-linear equivalence between the intertwiner spaces at
`s` and at `h₁ s h₂`, built from the action of `h₁` and `h₂` on `V` and the identification of the
Mackey subgroups `H ⊓ sHs⁻¹` and `H ⊓ (h₁ s h₂) H (h₁ s h₂)⁻¹` by conjugation with `h₁`. Tau Ceti
proves that the two spaces have the same dimension
(`TauCeti.finrank_hom_res_mackeyToH_mul_left_mul_right`) and hence the invariance of disjointness
(`TauCeti.mackeyDisjoint_mul_left_mul_right_iff`); the target is the equivalence itself, which
transports the components of the decomposition of §4.1 between representatives.
*Needs:* Tau Ceti `TauCeti.mackeySubgroup`, `TauCeti.mackeyToH`,
`TauCeti.finrank_hom_res_mackeyToH_mul_left_mul_right`; Mathlib `CategoryTheory.Linear.homCongr`.

### 4.3 Disjointness in conjugate-representation form

Prove that `TauCeti.MackeyDisjoint V s` holds exactly when every intertwiner from the restriction
of `V` to `H ⊓ sHs⁻¹` (a subgroup of `G`, along its inclusion into `H`) to the restriction of the
conjugate `TauCeti.conjFDRep s V` (along the inclusion of `H ⊓ sHs⁻¹` into `sHs⁻¹`) is zero
(Serre, Part II, §7.4). This is the form in which the criterion is usually stated; the two
formulations differ by the identification of `H ⊓ sHs⁻¹` with the subgroup
`(H ⊓ sHs⁻¹).subgroupOf H` of `H` and by `{}^s V` restricted to `H ⊓ sHs⁻¹` being `V` restricted
along `y ↦ s⁻¹ y s`.
*Needs:* Tau Ceti `TauCeti.MackeyDisjoint`, `TauCeti.mackeyDisjoint_iff_subsingleton`,
`TauCeti.conjFDRep`, `TauCeti.mackeySummand_eq_indFDRep_res_conjFDRep`; Mathlib
`Subgroup.inclusion`, `Action.res`.

### 4.4 A simple induced representation over a non-splitting field

Let `G = Q₈` (Mathlib's `QuaternionGroup 2`), `H = ⟨i⟩` and `V = ℂ`, viewed as a real
representation of `H` on which `i` acts by multiplication by `i`. Prove over `ℝ`:

- `Ind_H^G V` is isomorphic to the real quaternions `ℍ` with `G` acting by left multiplication, and
  is simple. In Mathlib's coordinates, where `⟦h g ⊗ h v⟧ = ⟦g ⊗ v⟧` and `x · ⟦g ⊗ v⟧ = ⟦g x⁻¹ ⊗ v⟧`,
  the isomorphism is `⟦g ⊗ v⟧ ↦ g⁻¹ v`, so `⟦1 ⊗ v⟧ + ⟦j⁻¹ ⊗ w⟧ ↦ v + j w`;
- `End_H(V) ≅ ℂ` and `End_G(Ind_H^G V) ≅ ℍᵐᵒᵖ`, of real dimensions `2` and `4`;
- at the representative `j` of the other double coset the intertwiner space is nonzero (complex
  conjugation intertwines `V` with `{}^j V`, on which `i` acts by `−i`), so `V` is not disjoint
  from its conjugate, and `ℝ` does not split `Q₈`.

So the induced representation is simple although the disjointness condition fails: without
scalar endomorphisms the criterion is sufficient (Tau Ceti's
`FDRep.simple_indFDRep_of_forall_mackeyDisjoint`) and not necessary, and the division-algebra
characterization `Simple X ↔ Nontrivial (End X) ∧ ∀ f ≠ 0, IsUnit f` (Tau Ceti's
`CategoryTheory.simple_iff_nontrivial_end_and_isUnit`) is the criterion that applies.
*Needs:* Mathlib `QuaternionGroup`, `Quaternion`, `Rep.ind`; Tau Ceti `TauCeti.indFDRep`,
`FDRep.indHomMackeyLinearEquiv`, `CategoryTheory.simple_iff_nontrivial_end_and_isUnit`.

**Checks.**
- In this example the two double cosets contribute real dimensions `2` (the identity, `End_H(V)`)
  and `2` (at `j`, the maps `z ↦ a z̄`), and `2 + 2 = 4 = dim End_G(ℍ)`; a computation that
  dropped the inverse in `x · ⟦g ⊗ v⟧ = ⟦g x⁻¹ ⊗ v⟧` would not make `⟦g ⊗ v⟧ ↦ g⁻¹ v` equivariant.

### Examples

- For `S₃`, `H = A₃` and a nontrivial linear character `λ` of `A₃` over `ℂ`, the conjugate by
  `(1 2)` is `λ²`, so `λ` is disjoint from it and `Ind λ` is the simple two-dimensional
  representation; for `H = ⟨(1 2)⟩` and the sign, the Mackey subgroup at `(1 3)` is trivial, the
  intertwiner space there is `ℂ`, and `Ind(sign) ≅ sign ⊕ standard`.
- For `D₄ = DihedralGroup 4`, `H = ⟨r⟩` and a linear character `ψ` of `H` over `ℂ`, conjugation by a
  reflection inverts `r`, so `{}^s ψ = ψ⁻¹`; `Ind ψ` is simple exactly when `ψ(r)² ≠ 1`, that is when
  `ψ` is faithful (`ψ(r) = ±i`), and it is the two-dimensional simple representation of `D₄`.

### Dependencies

Tau Ceti's Mackey decomposition, Hom-space decomposition, disjointness predicate and criteria;
Mathlib's quaternion group and quaternions for §4.4.

## Layer 5: Clifford theory over a normal subgroup

Throughout, `N` is a normal subgroup of `G` and `k` is a field; `G` is finite in §5.1, and in §5.3
the inertia group has finite index in `G`.

### 5.1 Isotypic decomposition in `FDRep`

Transport the isotypic decomposition of semisimple modules and the Hom-dimension count of
multiplicities (Tau Ceti's `IsSemisimpleModule.linearEquivIsotypicComponents`,
`IsSemisimpleModule.exists_linearEquiv_pi_quotient`,
`LinearEquiv.finrank_linearMap_eq_natCard_mul_finrank_end`) to `FDRep k G`, for
`hG : IsUnit (Nat.card G : k)` (Curtis–Reiner §10–11; Isaacs, Ch. 6):

- every `W : FDRep k G` is isomorphic to a finite biproduct of simple objects;
- for simple `V`, the `V`-isotypic component of `W` is a subobject of `W`, and `W` is the
  biproduct of its isotypic components;
- if `V` is simple with scalar endomorphisms, the number of summands isomorphic to `V` in any
  decomposition of `W` into simple objects is `finrank k (V ⟶ W)`;
- a simple `V` occurs in `W` exactly when its isotypic component is nonzero,
  equivalently when `finrank k (V ⟶ W) ≠ 0`, in any characteristic prime to `|G|`;
- if `k` has characteristic zero, `V` occurs in `W` exactly when `⟨χ_V, χ_W⟩ ≠ 0`. In
  characteristic `p` the pairing is the dimension cast into `k` and can vanish for a constituent.

*Needs:* Tau Ceti `IsSemisimpleModule.linearEquivIsotypicComponents`,
`IsSemisimpleModule.exists_linearEquiv_pi_quotient`,
`LinearEquiv.finrank_linearMap_eq_natCard_mul_finrank_end`,
`TauCeti.finrank_linearMap_pos_iff_exists_nonempty_linearEquiv`,
`TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank`; Mathlib Maschke's theorem
(`IsSemisimpleModule k[G] V` under `IsUnit (Nat.card G : k)`), `FDRep.forget₂HomLinearEquiv`.

**Checks.**
- Scalar endomorphisms are needed in the multiplicity statement: over `ℚ`, the regular
  representation of `C₃` is `1 ⊕ U` with `U` simple of dimension `2` and endomorphism algebra
  `ℚ(ω)`; `U` occurs once and `finrank ℚ (U ⟶ ℚ[C₃]) = 2`.
- Detection by the pairing fails in positive characteristic: over `𝔽₃`, for `G = C₂` and `W` three
  copies of the trivial representation, `⟨1, χ_W⟩ = 3 = 0` in `𝔽₃` while `finrank (1 ⟶ W) = 3`.

### 5.2 Clifford's theorem over every field

Let `W : FDRep k G` be simple. Prove `exists_resFDRep_iso_cliffordSum`: there are a simple
`V : FDRep k N` and `e ≠ 0` with `Res_N W ≅ V.cliffordSum e`, the direct sum of `e` copies of each
conjugate `{}^q V`, `q` running over `G ⧸ TauCeti.inertia V` (Tau Ceti's `FDRep.cliffordSum`).
Prove its character form `clifford_restrict_character`: with `reps` a left transversal of the
inertia group, `χ_W(n) = e · ∑_{g ∈ reps} χ_{{}^g V}(n)` for `n ∈ N`. No finiteness of `G`, no
invertibility of `|G|` and no splitting is assumed: the conjugates of `V` are finitely many because
`W` is finite-dimensional, and in positive characteristic the character form sees only `(e : k)`
(Curtis–Reiner §11; for complex characters, Isaacs, Ch. 6).

API:

- `finrank k W = e · [G : T] · finrank k V`, with `T = TauCeti.inertia V`, from the dimension of
  `FDRep.cliffordSum`;
- `e` is the number of copies of `V` in `Res_N W`; when `V` has scalar endomorphisms it is
  `finrank k (V ⟶ Res_N W)`, and in general that dimension is `e · finrank k (V ⟶ V)`.

*Route.* Tau Ceti proves over every field that the isotypic components of `Res_N W` form one orbit
under `G` (`TauCeti.Representation.exists_isAtom_forall_nonempty_linearEquiv_conjSubrep`), that
they are indexed by `G ⧸ T` (`Representation.isotypicComponentsEquivQuotientInertia`), and that
the Hom dimension into each is the same (`Representation.exists_forall_finrank_linearMap_eq`);
semisimplicity of `Res_N W` is `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`.
Dividing the Hom dimension by `finrank k (V ⟶ V)`
(`LinearEquiv.finrank_linearMap_eq_natCard_mul_finrank_end`) gives the number of copies, and
assembling the components gives the isomorphism with `V.cliffordSum e`. Over an algebraically
closed field this is Tau Ceti's `FDRep.clifford_restrict_iso`.
*Needs:* Tau Ceti `TauCeti.inertia`, `TauCeti.conjNormalFDRep`, `FDRep.cliffordSum`,
`FDRep.finrank_cliffordSum`, `Subgroup.resFDRep`, the orbit, index and multiplicity results above.

**Checks.**
- Over `ℚ`, for `G = C₄ = ⟨g⟩` acting on `ℚ²` by the rotation through a right angle and
  `N = ⟨g²⟩`, `g²` acts as `−1`, so `Res_N W` is two copies of the sign of `N`: `V` is the sign,
  `T = G`, `e = 2`, and `χ_W(g²) = −2 = 2 · (−1)`. Over `ℂ`, `W` splits into the characters
  `g ↦ ±i`, each restricting to the sign with `e = 1`; computing `e` after extending scalars would
  give the wrong value over `ℚ`.
- No invertibility of `|G|` is needed: over `𝔽₂`, `S₃ ≅ GL₂(𝔽₂)` acts simply on `𝔽₂²`; an element
  of order `3` has characteristic polynomial `x² + x + 1`, irreducible over `𝔽₂`, so the
  restriction to `A₃` is simple, `e = 1` and `T = S₃`.

### 5.3 The Clifford correspondence over every field

Let `V : FDRep k N` be simple with inertia group `T` of finite index in `G`
(`[(TauCeti.inertia V).FiniteIndex]`, an instance when `G` is finite); `G` need not be finite, and
no invertibility of `|G|` in `k` and no splitting hypothesis is assumed. Prove
`clifford_correspondence`: for every simple
`U : FDRep k T` lying over `V` (Tau Ceti's `FDRep.LiesOver`, a nonzero intertwiner from `V` into
the restriction of `U`), `TauCeti.indFDRep U` is simple and lies over `V`; every simple
representation of `G` lying over `V` is isomorphic to such an induced representation; and two
such `U` with isomorphic inductions are isomorphic. So induction is a bijection
`Irr(T | V) ≅ Irr(G | V)` on isomorphism classes, which reduces the classification of the simple
representations of `G` over `V` to that of `T` over `V` (Curtis–Reiner §11; for complex
characters, Isaacs, Ch. 6).
*Route.* For simple `U` over `T` lying over `V`, `Res_N U` is semisimple and `V`-isotypic (§5.2
for `T`, which fixes `V`), and `Res_N Ind_T^G U` is the direct sum of the translates `gU`,
`g ∈ G ⧸ T`, with `gU` isotypic of type `{}^g V`; so the `V`-isotypic part of `Res_N Ind U` is
`U`. A nonzero `G`-submodule `X` of `Ind U` has semisimple restriction to `N`, so it is the sum of
its intersections with the `gU`; as `X` is `G`-stable it meets `U`, so it contains the simple
`T`-module `U` and is `Ind U`: `Ind U` is simple. For simple `W` lying over
`V`, the `V`-isotypic part `W_V` of `Res_N W` is a `T`-module with `W = ⊕_{g ∈ G ⧸ T} g W_V`, so
the map `Ind_T^G W_V → W` adjoint to the inclusion (`FDRep.indResFDRepHomEquiv`) is onto between
spaces of the same dimension; `W_V` is simple, because the translates of a nonzero `T`-submodule
`Y` of `W_V` sum to `W`, which forces `Y = W_V`. An isomorphism `Ind U ≅ Ind U'` maps `V`-isotypic
part to `V`-isotypic part, so `U ≅ U'`. Neither Maschke's theorem nor the Mackey criterion
`FDRep.simple_indFDRep_of_forall_mackeyDisjoint`, which assumes `|G|` invertible, enters. Over an
algebraically closed field of characteristic zero the bijection is Tau Ceti's
`FDRep.cliffordCorrespondence` (for finite `G`). Tau Ceti proves two clauses more generally: `Ind U`
lies over `V` over every field (`FDRep.liesOver_indFDRep_of_inertia`), and, for finite `G`,
induction is injective over every field of characteristic zero
(`FDRep.nonempty_iso_of_liesOver_inertia_of_nonempty_iso_indFDRep`);
the simplicity of `Ind U`, the surjectivity, and the injectivity in positive characteristic or
for infinite `G` are what this target adds. The route uses the finiteness of `G ⧸ T` only.
The further reduction from `T` to the quotient `T / N` needs `V` to extend to `T` and to have
scalar endomorphisms (§7.5); for a division algebra of endomorphisms it is the crossed-product
theory of §7.6–§7.7. Neither enters the proof of the correspondence.
*Needs:* Tau Ceti `TauCeti.inertia`, `TauCeti.le_inertia`, `TauCeti.indFDRep`,
`TauCeti.finrank_indFDRep`, `FDRep.LiesOver`, `FDRep.indResFDRepHomEquiv`,
`TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`,
`FDRep.liesOver_indFDRep_of_inertia`,
`FDRep.nonempty_iso_of_liesOver_inertia_of_nonempty_iso_indFDRep`; Mathlib `isotypicComponent`;
§5.2.

**Checks.**
- For `S₄ ⊃ V₄` over `ℚ`, which splits `S₄`, and the character `χ` of `V₄` with kernel
  `⟨(1 3)(2 4)⟩`, the inertia group is a Sylow 2-subgroup `T` of order 8; two of the four linear
  characters of `T` restrict to `χ`, and inducing them gives the two simple three-dimensional
  representations of `S₄` (each of norm `1`, mutually orthogonal). Inducing `χ` itself from `V₄`
  gives a six-dimensional representation of norm `2`, their sum.
- The inertia group depends on `k`: for `A₃ ◁ S₃` over `ℚ`, the two-dimensional simple
  representation `U = ℚ(ω)` of `A₃` is isomorphic to its conjugate by `(1 2)` through complex
  conjugation, so its inertia group is `S₃`, and `Irr(S₃ | U)` is the standard representation
  alone; over `ℂ` each constituent `λ`, `λ²` of `U` has inertia group `A₃`.

### Examples

- For `A₄ ◁ S₄` over `ℂ`, the two nontrivial linear characters of `A₄` (through `A₄ / V₄ ≅ C₃`) form
  one `S₄`-orbit with inertia group `A₄`, and induction sends each to the two-dimensional simple
  representation of `S₄`; the trivial character and the three-dimensional simple representation of
  `A₄` are `S₄`-stable, the first lying under the trivial and sign representations of `S₄` and the
  second under the two three-dimensional ones.

### Dependencies

§5.2 for §5.3; Tau Ceti's orbit, inertia and multiplicity results, and its finite-dimensional
induction and reciprocity for §5.3.

## Layer 6: the virtual-character ring, Artin and Brauer induction

### 6.1 The virtual-character lattice over a field of characteristic zero

Let `G` be finite and `k` a field of characteristic zero; `k` need not split `G`. Prove that the
lattice of virtual characters `TauCeti.virtualCharacters k G`, the additive subgroup of `G → k` generated by
the characters of finite-dimensional representations and the image of the representation ring
under the character map, is the `ℤ`-span of the irreducible characters
`TauCeti.irreducibleCharacters k G`, and that the characters of pairwise non-isomorphic simple
representations are linearly independent, so that they form a basis of the lattice and the
character map identifies the representation ring with it (over `ℂ`: Serre, Part II, §9–10). For
an algebraically closed field these are Tau Ceti's
`TauCeti.virtualCharacters_eq_closure_irreducibleCharacters` and
`TauCeti.ClassFunction.linearIndependent_character_fdRep`; the target removes algebraic closure.
*Route.* By Maschke's theorem every character is a natural-number combination of irreducible
characters; the characters of pairwise non-isomorphic simple representations are orthogonal for
the pairing (`TauCeti.ClassFunction.characterPairing_ofFDRep_eq_zero`), with
`⟨χ_V, χ_V⟩ = dim_k End(V)` (`TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank`), which
is nonzero in characteristic zero; an orthogonal family with nonzero norms is linearly independent.
*Needs:* Tau Ceti `TauCeti.virtualCharacters`, `TauCeti.irreducibleCharacters`,
`TauCeti.irreducibleCharacters_subset_range`, `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank`,
`TauCeti.ClassFunction.characterPairing_ofFDRep_eq_zero`,
`TauCeti.repRingCharacter`, `TauCeti.range_repRingCharacter`, `TauCeti.repRingCharacter_injective`;
Mathlib Maschke's theorem.

**Checks.**
- For `S₃` over `ℚ` the irreducible characters are `(1, 1, 1)`, `(1, −1, 1)` and `(2, 0, −1)` on the
  classes of `1`, the transpositions and the 3-cycles. The permutation character `(3, 1, 0)` is
  `(1, 1, 1) + (2, 0, −1)`; the class function `(1, 0, 0)` is not in the lattice, although six times
  it, the regular character, is.

### Examples

- For `C₃` over `ℚ`, which does not split it, the lattice is spanned by `1` and the character
  `(2, −1, −1)` of the two-dimensional simple representation; the complex characters `g ↦ ω^{±1}`
  are not `ℚ`-valued, and `(2, −1, −1)` has norm `2`.

### Dependencies

Tau Ceti's virtual-character lattice, representation ring and linear independence of characters;
Mathlib's Maschke theorem.

## Layer 7: projective representations, factor sets, and the Schur multiplier

### 7.1 Abstract universal central extensions

For an abstract group `G` (no finiteness), a central extension is a surjective homomorphism onto
`G` whose kernel lies in the centre. Take the canonical free
presentation `AbstractUCE.presentation : FreeGroup G →* G` with kernel `R`
(`AbstractUCE.relations`), `[F, F]` (`AbstractUCE.derived`), `[F, R]`
(`AbstractUCE.relationCommutators`), and `U = [F, F]/[F, R]` (`AbstractUCE.Cover`, the quotient
of `[F, F]` by `[F, R]` viewed as its subgroup `AbstractUCE.relationsInsideDerived`) with the
induced map `AbstractUCE.projection : U → G`. For every group `G`, prove (Weibel, Ch. III,
Example 5.3.4):

- `AbstractUCE.ker_projection_le_center`: the kernel of the projection is central;
- `AbstractUCE.kernelMap_bijective`: the canonical homomorphism `AbstractUCE.kernelMap` from
  `(R ∩ [F, F])/[F, R]` to the kernel, sending the class of `x` to the class of `x`, is bijective,
  so that the kernel of `U → G` is `(R ∩ [F, F])/[F, R]`.

For `G` perfect, prove (Weibel, Ch. III, Example 5.3.4, Lemmas 5.3.2–5.3.3 and Theorem 5.4):

- `AbstractUCE.projection_surjective`: the projection is surjective;
- `AbstractUCE.cover_isPerfect`: `U` is perfect (for nontrivial `G` the free group's commutator
  subgroup is not). Perfection of `G` gives `F = [F, F]·R`, and `R` is central modulo `[F, R]`, so
  every commutator of `F` is congruent modulo `[F, R]` to a commutator of two elements of
  `[F, F]`. Weibel's proof of Theorem 5.4 applies Lemma 5.3.3 to `U` without this step;
- `AbstractUCE.universal`: for every surjective `p : E → G` with central kernel, in any universe,
  there is exactly one homomorphism `f : U → E` with `p ∘ f` the projection.

API: `AbstractUCE.relationCommutators_le_relations` places `[F, R]` inside `R`, as `R` is normal;
`[F, R] ≤ [F, F]` is monotonicity of commutators. The kernel of the projection is the image of
`R ∩ [F, F]` in `U`: the projection is a `QuotientGroup.lift`, so this is Mathlib's
`QuotientGroup.ker_lift`, which gives the surjectivity half of `AbstractUCE.kernelMap_bijective`.
Independence of the presentation: for any free presentation `F' → G` with kernel `R'`,
`[F', F']/[F', R']` is isomorphic to `U` over `G`, by the universal property. *Route.* Lift the
free generators to `E`; on `[F, F]` the lift kills `[F, R]` and does not depend on the choice of
lifts, because two choices differ by central elements; perfection of `U` gives uniqueness. This is a theorem about abstract groups; it says nothing about topology or the
universal covering of a Lie group.
*Needs:* Mathlib `Group.IsPerfect`, `FreeGroup`, `FreeGroup.prod`, `commutator`,
`Subgroup.center`, `QuotientGroup.lift`, `QuotientGroup.ker_lift`.

**Checks.**
- For a group that is not perfect, such as `C₂`, the image of `U` is `[G, G] = 1`, so the
  projection is not surjective; the perfectness hypothesis of `AbstractUCE.projection_surjective`
  cannot be dropped.
- For `G = A₅`, `U` is `SL₂(𝔽₅)` and the kernel `(R ∩ [F, F])/[F, R]` has order `2`.

### 7.2 Projective representations, the projective linear group and cocycles

Over a field `k` and for a group `G`, a function `α : G × G → kˣ` satisfying the multiplicative
cocycle identity `α(gh, j) α(g, h) = α(h, j) α(g, hj)` is, written additively, a 2-cocycle of the
trivial module `Additive kˣ`: this is Mathlib's `groupCohomology.cocyclesOfIsMulCocycle₂` for the
trivial action `TauCeti.trivialMulDistribMulAction`, and normalization is not used. For `V` free
with a finite basis `b`, nonzero, prove the converse of Tau Ceti's `TauCeti.IsProjectiveRep.toPGL`:
two projective representations `ρ`, `ρ'` of `G` on `V` with the same image `G →* PGL(ι, k)` differ
by a normalized scalar function, `ρ' g = c g • ρ g` with `c 1 = 1`; consequently, by
`TauCeti.IsProjectiveRep.cohomologyClass_eq_of_eq_smul`, every homomorphism `G →* PGL(ι, k)` has a
well-defined class in `H²(G, kˣ)`, that of any of its lifts
(`MonoidHom.exists_isProjectiveRep_toPGL_eq`). A projective representation lands in `PGL(ι, k)`
only after the basis is chosen (Isaacs, Ch. 11).

*Needs:* Tau Ceti `TauCeti.IsProjectiveRep`, `TauCeti.IsProjectiveRep.toPGL`,
`MonoidHom.exists_isProjectiveRep_toPGL_eq`, `TauCeti.IsProjectiveRep.cohomologyClass_eq_of_eq_smul`,
`TauCeti.trivialMulDistribMulAction`; Mathlib `groupCohomology.cocycles₂`,
`groupCohomology.IsMulCocycle₂`, `groupCohomology.cocyclesOfIsMulCocycle₂`, `Rep.trivial`,
`Matrix.ProjGenLinGroup`.

**Checks.**
- A projective action is not determined by its factor set: `C₂` acting on `ℂ²` trivially and
  through `diag(1, −1)` has factor set `1` both times, and the two images in `PGL₂(ℂ)` differ.
- On `V = 0` every normalized `α` is the factor set of the unique family `ρ`, so no intrinsic class
  exists there; this is why the converse above assumes `V` nonzero.
- For `C₂ × C₂ = ⟨a, b⟩` acting on `ℂ²` by `ρ(a) = X = [[0, 1], [1, 0]]`, `ρ(b) = Z = diag(1, −1)`
  and `ρ(ab) = XZ`, one has `α(a, b) = 1` and `α(b, a) = −1`, since `ZX = −XZ`; the ratio
  `α(a, b)/α(b, a)` is unchanged by coboundaries, so the class is nonzero.
- A constant function `α ≡ c` with `c ≠ 1` satisfies the cocycle identity and lies in `cocycles₂`
  although it is not normalized.

### 7.3 Coordinates on the twisted group algebra

For a normalized factor set `α`, Tau Ceti's `TauCeti.twistedMonoidAlgebra k G α` is the twisted
group algebra `k_α[G]`, with basis `TauCeti.TwistedMonoidAlgebra.basis` indexed by `G` and
multiplication `e_g e_h = α(g, h) e_{gh}` (`TauCeti.TwistedMonoidAlgebra.of_mul_of`); projective
representations with factor set `α` are its modules (`TauCeti.isProjectiveRepEquivAlgHom`), and
cohomologous factor sets give isomorphic algebras. Define on `G →₀ k` the twisted product,
`e_g · e_h = α(g, h) e_{gh}` extended bilinearly, with its value on basis vectors (no cocycle
condition used), and the coordinate identification of `G →₀ k` with `k_α[G]` through the basis.
Prove that the coordinate identification carries the twisted product to the product of `k_α[G]`.
Associativity and the unit of the twisted product hold for normalized cocycles and fail for an
arbitrary `α`.
*Needs:* Tau Ceti `TauCeti.twistedMonoidAlgebra`, `TauCeti.TwistedMonoidAlgebra.basis`,
`TauCeti.TwistedMonoidAlgebra.of_mul_of`, `TauCeti.IsFactorSet`; Mathlib `Finsupp`.

**Checks.**
- For the class of §7.2 on `C₂ × C₂`, `e_a e_b = e_{ab}` and `e_b e_a = −e_{ab}`, with `e_a² = e_b² = 1`:
  the twisted algebra over `ℂ` is `M₂(ℂ)`, whereas the untwisted group algebra is commutative.

### 7.4 The central extension of a normalized factor set, and representation groups

For a normalized factor set `α : G × G → kˣ`, bundled as Tau Ceti's `TauCeti.FactorSet G kˣ` for
the trivial action, the central extension `1 → kˣ → E_α → G → 1` is Tau Ceti's
`TauCeti.FactorSet.Extension α`: the set `kˣ × G` (`TauCeti.FactorSet.Extension.equivProd`) with
`(a, g)(b, h) = (a b α(g, h), g h)`. Tau Ceti proves that the image of the scalar inclusion is the
kernel of the projection (`TauCeti.FactorSet.range_inl_eq_ker_rightHom`), so that
`TauCeti.FactorSet.groupExtension` is a Mathlib `GroupExtension kˣ E_α G`, and that the scalars
are central for the trivial action (`TauCeti.FactorSet.inl_range_le_center`). This section
consumes that extension.

A representation group (Schur cover) of a finite group `G` is a central extension `Ĝ → G` with
kernel inside `[Ĝ, Ĝ]` through which every projective representation of `G` over an algebraically
closed field lifts to a linear one. Tau Ceti proves its existence with lifting for homomorphisms to
`PGL(ι, k)` (`TauCeti.exists_finite_stem_extension_lifting_pgl`). The lifting holds for projective
representations on arbitrary `k`-modules as well: for `G` finite and `k` algebraically closed there
is a finite stem extension `p : E → G` such that for every `TauCeti.IsProjectiveRep ρ α` on any `V`
there are a homomorphism `π : E →* (V ≃ₗ[k] V)` and `c : E → kˣ` with `π x = c x • ρ (p x)` (for
complex representations, Isaacs, Ch. 11). This is an API fact of the section, not a target: it is
the composition of the two lemmas from which Tau Ceti assembles the `PGL` case.
`TauCeti.exists_finite_stem_factorSet_bijective_characterTransgression` gives a finite stem factor
set `γ` with bijective character transgression, `p` being the projection of its extension, and
`TauCeti.IsProjectiveRep.exists_linearization_of_characterTransgression_surjective` gives `π` and
the scalars, `c x = χ(a) · c₀(g)` for `x = (a, g)` with a character `χ` of the kernel and a function
`c₀ : G → kˣ`.
*Needs:* Tau Ceti `TauCeti.IsProjectiveRep`,
`TauCeti.exists_finite_stem_factorSet_bijective_characterTransgression`,
`TauCeti.IsProjectiveRep.exists_linearization_of_characterTransgression_surjective`.

**Checks.**
- For `G = C₂ = {1, g}` and `α(g, g) = −1`, `α` is not a coboundary over `ℝ` (that would need
  `c(g)² = −1`) but is over `ℂ`; in `E_α` the element `(1, g)` squares to the central `(−1, 1)`.
- `Q₈ → C₂ × C₂` is a representation group: the projective representation of §7.2 by `X` and `Z`
  lifts to the two-dimensional representation of `Q₈`, and the kernel `{±1}` lies in
  `[Q₈, Q₈] = {±1}`.

### 7.5 The scalar Clifford obstruction over an arbitrary field

Let `k` be any field, `N` normal in `G` (no finiteness), `V : FDRep k N` simple with scalar
endomorphisms (`hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V`; simplicity makes `V` nonzero and `c`
unique), `T = TauCeti.inertia V` and `Q = T ⧸ N`. A compatible projective extension is Tau Ceti's
`TauCeti.IsProjectiveInertiaExtension V ρ β`: a projective representation `ρ` of `T` on `V` agreeing
with `V` on `N`, with normalized factor set `β` pulled back from `Q`. Prove (for complex
representations, Isaacs, Ch. 11):

- `exists_scalarProjectiveInertiaExtension`: a compatible projective extension exists;
- `scalarProjectiveInertiaExtension_class_eq`: any two have cohomologous factor sets, so they
  define one class `cliffordObstruction V hScalar ∈ H²(Q, kˣ)`
  (`scalarProjectiveInertiaExtension_class_eq_obstruction`);
- `cliffordObstruction_eq_zero_iff`: the class vanishes exactly when an ordinary representation of
  `T` on the same space `V` restricts to the given action of `N`;
- `cliffordObstruction_eq_native`: over an algebraically closed field it is Tau Ceti's
  `TauCeti.cliffordObstruction`.

API: the class is unchanged when `V` is replaced by an isomorphic representation (whose inertia
group is the same, `TauCeti.inertia_congr`) and transported along an isomorphism of quotient
models of `Q`. No class is defined for a representation without scalar endomorphisms, and none
for the zero representation.

*The tensor factorization.* For every representation `W` of `T` over a commutative ring, Tau Ceti
makes the multiplicity space `Hom_N(V, W)` a projective representation of `Q` with factor set
`β⁻¹` (`TauCeti.IsProjectiveInertiaExtension.homAction`,
`TauCeti.IsProjectiveInertiaExtension.isProjectiveRep_homAction`), makes `V ⊗ X`, for any
projective representation `X` of `Q` with factor set `β⁻¹`, an ordinary representation of `T`
(`TauCeti.IsProjectiveInertiaExtension.tensorRep`), and makes evaluation
`V ⊗ Hom_N(V, W) → W`, `x ⊗ φ ↦ φ(x)`, an intertwiner (`TauCeti.IsProjectiveInertiaExtension.evalTensor`).
Over every field evaluation is onto when `W` is simple and lies over `V`
(`TauCeti.IsProjectiveInertiaExtension.evalTensor_surjective`), and over an algebraically closed
field it is injective (`TauCeti.IsProjectiveInertiaExtension.evalTensor_injective`,
`TauCeti.IsProjectiveInertiaExtension.tensorRepEquiv`). Prove, over any field and under `hScalar`,
that evaluation `V ⊗_k Hom_N(V, W) → W` is bijective for every representation `W` of `T` whose
restriction to `N` is semisimple and `V`-isotypic. *Route.* Under `hScalar`, Jacobson density
(Mathlib's `Module.Finite.toModuleEnd_moduleEnd_surjective`) makes `k[N] → End_k(V)` onto, and the
injectivity argument of the algebraically closed case applies; the image of evaluation contains the
image of every `N`-map `V → W`, and these images sum to `W`. For finite-dimensional `W` one may
instead compare evaluation with Tau Ceti's `FDRep.cliffordBalancedEvaluationEquiv` through
`End_N(V) = k`.
*Needs:* Tau Ceti `TauCeti.IsProjectiveInertiaExtension`, `TauCeti.inertia`, `TauCeti.le_inertia`,
`TauCeti.inertia_congr`, `TauCeti.schurMultiplier`, `TauCeti.cliffordObstruction`,
`TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction`,
`TauCeti.FactorSet.cohomologyClass_eq_iff`, and for the tensor factorization
`TauCeti.IsProjectiveInertiaExtension.homAction`,
`TauCeti.IsProjectiveInertiaExtension.isProjectiveRep_homAction`,
`TauCeti.IsProjectiveInertiaExtension.tensorRep`, `TauCeti.IsProjectiveInertiaExtension.evalTensor`
and, for the alternative route, `FDRep.cliffordBalancedEvaluationEquiv`; Mathlib
`Module.Finite.toModuleEnd_moduleEnd_surjective`; §7.2.

**Checks.**
- For `Q₈ ⊃ Z = {±1}` over `ℂ` and the nontrivial character `V` of `Z`, the inertia group is `Q₈`
  and `Q = C₂ × C₂`; every linear character of `Q₈` is trivial on `−1 ∈ [Q₈, Q₈]`, so `V` does not
  extend and the class is the nonzero class of §7.2.
- For `A₃ ◁ S₃` over `ℚ` and the two-dimensional simple `U = ℚ(ω)` of `A₃`, the endomorphism algebra
  is `ℚ(ω)`, so `hScalar` fails and no scalar class is attached; §7.6 treats this case.

### 7.6 Division crossed systems

Let `k` be any field, `N` normal in `G`, `V : FDRep k N` simple and finite-dimensional, and
`D = End_N(V)`, Mathlib's `CategoryTheory.End V`, a division ring by Schur's lemma, with
multiplication the composition `(a b)(v) = a(b(v))`. `D` is not assumed to be `k`. Tau Ceti builds
the Clifford extension of `Q = T ⧸ N` by `Dˣ` (`TauCeti.CliffordExtension.groupExtension V`, the
subgroup of pairs `(t, U)` in `T × GL_k(V)` with `U` implementing `t` on `N`, modulo the pairs
`(n, r(n))`), its crossed system `FDRep.cliffordCrossedSystem V s hs` for a normalized section `s`,
its outer action `FDRep.cliffordOuterAction`, splittings, gauges and the non-abelian `H¹`
classification. Prove (Curtis–Reiner §11; for complex representations, where `D = ℂ`, Isaacs,
Ch. 11):

- *the algebra `D`*: `D` is a finite-dimensional `k`-algebra, `k` mapping into its centre, and its
  units are the invertible intertwiners (Mathlib's `CategoryTheory.Aut.unitsEndEquivAut`);
- *the operator presentation*: for a normalized section `s : Q → T` and normalized invertible
  operators `U_q` with `U_q r(n) U_q⁻¹ = r(s(q) n s(q)⁻¹)`, `r` the action of `N`, put
  `k(q, r) = s(q) s(r) s(qr)⁻¹ ∈ N`, `σ_q = Ad(U_q)` on `D`, and define `a(q, r) ∈ Dˣ` by
  `U_q U_r = a(q, r) r(k(q, r)) U_{qr}`. Prove `σ_1 = id`, `a(1, q) = a(q, 1) = 1`,
  `σ_q σ_r = Ad(a(q, r)) σ_{qr}` and `a(q, r) a(qr, t) = σ_q(a(r, t)) a(q, rt)`, and that
  `(σ, a)` is the crossed system `FDRep.cliffordCrossedSystem` of the corresponding section of the
  Clifford extension;
- *gauges*: for `U'_q = b_q U_q` with `b_1 = 1`, `σ'_q = Ad(b_q) σ_q` and
  `a'(q, r) = b_q σ_q(b_r) a(q, r) b_{qr}⁻¹`; for a change of section `s'_q = n_q s_q`, take
  `U'_q = r(n_q) U_q` first and prove the corresponding identities. Define equivalence of crossed
  systems by normalized gauges and algebra transports, prove it is an equivalence relation, and
  prove the crossed system is independent of the section and the operators up to equivalence;
- *the presented multiplication*: under a section, the Clifford extension is `Dˣ × Q` with
  `(d, q)(e, r) = (d σ_q(e) a(q, r), q r)`.

Only `q ↦ [σ_q]` is a homomorphism, into `Out_k(D) = Aut_k(D)/Inn(Dˣ)`
(`TauCeti.OuterAlgAut`); the chosen `σ` need not be an action, and a non-commutative gauge orbit is
not replaced by an abelian `H²(Q, kˣ)`.
*Needs:* Tau Ceti `TauCeti.CliffordExtension.groupExtension`, `FDRep.cliffordCrossedSystem`,
`TauCeti.CrossedSystem`, `TauCeti.CliffordExtension.commutantAction`,
`FDRep.commutantAction_gauge`, `FDRep.factorSetFun_clifford_gauge`, `TauCeti.OuterAlgAut`,
`FDRep.cliffordOuterAction`; Mathlib `CategoryTheory.End`, Schur's lemma for simple objects.

**Checks.**
- For `A₃ ◁ S₃` over `ℚ` and `U = ℚ(ω)`: `D = ℚ(ω)`, `T = S₃`, `Q = C₂`, and `σ` is complex
  conjugation on `ℚ(ω)`, a nontrivial outer action (`D` is commutative, so `Inn` is trivial). The
  standard representation of `S₃` extends `U`, so a gauge makes `a ≡ 1`.

### 7.7 Crossed-product modules and the isotypic category

For the data of §7.6, the multiplicity space of `W : FDRep k T` is `M = Hom_N(V, W)`, a right
`D`-module by `f · d = f ∘ d`, with the semilinear operators `A_q(f) = W(s(q)) f U_q⁻¹`, so that
`A_q(f d) = A_q(f) σ_q(d)` and `A_q A_r(f) = A_{qr}(f) a(q, r)⁻¹`. As a left module, `M` is a module
over the crossed product on `Dᵐᵒᵖ` with action `σ_qᵐᵒᵖ` and factor `op(a(q, r)⁻¹)`
(`TauCeti.CrossedSystem.opInv`); Tau Ceti proves this, the balanced evaluation `M ⊗_D V → W` and the
full faithfulness of the multiplicity functor `FDRep.cliffordMultiplicityFunctor` on
representations whose restriction to `N` is a direct sum of copies of `V`. Prove:

- `exists_cliffordMultiplicityFunctor_obj_iso`: every module over this crossed product that is
  finite-dimensional over `k` is, up to isomorphism, the multiplicity space of a finite-dimensional
  representation of `T` whose restriction to `N` is semisimple and isotypic of type `V`; with Tau
  Ceti's full faithfulness (`FDRep.cliffordMultiplicityFunctor_map_bijective`) the multiplicity
  functor is then an equivalence between the finite-dimensional
  representations of `T` whose restriction to `N` is a direct sum of copies of `V` and the
  finite-dimensional modules over the crossed product; this needs no Maschke hypothesis;
- simple representations correspond to simple modules, and endomorphism algebras correspond;
- the equivalence is compatible with the gauge and section changes of §7.6 through Tau Ceti's
  `FDRep.cliffordCrossedProductEquiv` and `TauCeti.CrossedSystem.Algebra.gaugeEquiv`;
- for `D = k` the action `σ` is trivial, `a` is the scalar factor set `β` of §7.5, the multiplicity
  algebra is `k_{β⁻¹}[Q]`, and the equivalence becomes the tensor factorization of §7.5.

*Needs:* §7.5–§7.6; Tau Ceti `FDRep.cliffordMultiplicityFunctor`,
`FDRep.cliffordMultiplicityFunctor_map_bijective`, `FDRep.cliffordMultiplicityHomEquiv`,
`FDRep.cliffordBalancedEvaluationEquiv`,
`TauCeti.CrossedSystem.Algebra`, `TauCeti.CrossedSystem.opInv`, `FDRep.cliffordCrossedProductEquiv`,
`TauCeti.CrossedSystem.Algebra.gaugeEquiv`.

**Checks.**
- For `A₃ ◁ S₃` over `ℚ` and `U = ℚ(ω)` the crossed product with trivial factor is the cyclic
  algebra `(ℚ(ω)/ℚ, σ, 1) ≅ M₂(ℚ)`, with one simple module; correspondingly the standard
  representation is the only simple representation of `S₃` lying over `U`, and `Ind_{A₃}^{S₃} U` is
  two copies of it. A treatment with `D` replaced by `ℚ` would see two simple modules of
  `ℚ[C₂]` and predict two.

### 7.8 Restriction and induction between intermediate subgroups

For `N ≤ T' ≤ T`, with `Q' = T' ⧸ N` identified with its image in `Q`, restrict the section and the
crossed system to `Q'` (the section takes values in `T'`, the full preimage of `Q'`); Tau Ceti has
the restricted crossed system `TauCeti.CrossedSystem.comap` and the injective inclusion of
crossed-product algebras `TauCeti.CrossedSystem.Algebra.comapHom`. Prove, with the opposite and
inverse conventions of §7.7:

- under the multiplicity equivalences, restriction from `T` to `T'` is restriction of scalars along
  the inclusion of crossed-product algebras;
- if `[T : T']` is finite, induction from `T'` to `T` stays finite-dimensional and is extension of
  scalars `A(Q) ⊗_{A(Q')} M`, with the natural comparison to the induced representation and the
  evaluation map;
- for arbitrary index, the same comparisons hold in `Rep` for representations of `T` whose
  restriction to `N` is an algebraic direct sum of copies of `V`, with arbitrary right `D`-modules as
  multiplicity spaces and finitely supported induction, with explicit universe bounds; no such
  output is regarded as finite-dimensional.

*Needs:* §7.7; Tau Ceti `TauCeti.CrossedSystem.comap`, `TauCeti.CrossedSystem.Algebra.comapHom`,
`TauCeti.CrossedSystem.Algebra.moduleFinite_rightSubgroup`; Mathlib `Rep.ind`, `Rep.res`.

**Checks.**
- For `T' = N` the quotient `Q'` is trivial, the crossed product is `Dᵐᵒᵖ`, and restriction to `N`
  of a representation with multiplicity module `M` is `M ⊗_D V`, a direct sum of
  `dim_D M` copies of `V`.

### Examples

- For `Q₈ ⊃ {±1}` over `ℂ` (§7.5) the two-dimensional simple representation of `Q₈` restricts to
  two copies of the nontrivial character of the centre; its multiplicity space is a projective
  representation of `C₂ × C₂` with the inverse of the class of §7.2.

### Dependencies

§7.1 is independent of the rest of the layer. §7.2–§7.4 use Tau Ceti's projective representations
and factor sets. §7.5 uses Tau Ceti's inertia groups and compatible projective
extensions; §7.6–§7.8 use Tau Ceti's Clifford extension and crossed products, and §7.7 uses §7.5
for the scalar case.

## Downstream consumers

- CharacterTheory builds character tables from induced and permutation characters, Frobenius
  reciprocity and the Mackey criterion (its supplier table cites Layers 2–4).
- FiniteGroupInvariants uses almost-conjugacy and the pair in `S₁₆` (§§2.1–2.2), Clifford theory
  (Layer 5) and representation groups (Layer 7).
- PolynomialGaloisGroupsPartIII consumes the almost-conjugacy results of §§2.1–2.2 in their Tau
  Ceti form.
- InverseGaloisAndArithmeticFundamentalGroups (IG.3.4) and InductionRestrictionPartII build on the
  representation groups of Layer 7.
- StableHomotopyKTheory uses the universal central extensions of §7.1.
- OddOrderTheorem uses Layers 2 and 5; ClassicalArithmeticCompletion, KTheoryFiniteLocalFields and
  EndoscopicTransferAndUnitaryTraceComparison cite Layer 6 (virtual characters and Brauer
  induction).

## Scope and ownership

**This roadmap owns** the generator formulas of induction in stages (§0.1); the restriction and
quotient-invariant adapters for equivalences (§2.1); Mackey's formula as a finite biproduct (§3.1);
the identity component of the Hom-space decomposition, the change of double-coset representative,
the conjugate-representation form of disjointness and the real `Q₈` example (§§4.1–4.4); the
isotypic decomposition in `FDRep`, Clifford's theorem over every field and the Clifford
correspondence over every field (§§5.1–5.3); the virtual-character lattice over a field of
characteristic zero (§6.1); abstract universal central extensions (§7.1); the class of a
homomorphism to `PGL` and coordinates on the twisted group algebra (§§7.2–7.3); the scalar
Clifford obstruction over an arbitrary field (§7.5); and
the operator presentation and equivalence of division crossed systems, the isotypic-category
equivalence and its restriction–induction comparisons (§§7.6–7.8).

**Already in Tau Ceti.** The rest of the classical theory is proved at the Tau Ceti pin and is
consumed, not planned again. Other roadmaps cite it under this roadmap's layer and section numbers,
which resolve as follows.

| Item (former layer or section) | In Tau Ceti |
|---|---|
| Layer 0: transitivity of induction, restriction and coinduction | `TauCeti.Rep.indFunctorCompIso`, `TauCeti.Rep.resFunctorCompIso`, `TauCeti.Rep.coindFunctorCompIso`, `TauCeti.Rep.indFunctorSubgroupOfIso`, with their adjunction compatibilities (`TauCeti.Rep.conjugateEquiv_indFunctorCompIso_inv`) |
| Layer 0: the projection formula and its dual | `TauCeti.indProjection` (`Ind(A ⊗ Res B) ≅ Ind A ⊗ B`, forward generator `⟦h ⊗ (a ⊗ b)⟧ ↦ ⟦h ⊗ a⟧ ⊗ ρ(h⁻¹) b`), `TauCeti.indProjectionNatIsoLeft`, `TauCeti.indProjectionNatIsoRight`, `TauCeti.coinvariantsTensorIndHom_map_indProjection_mk`, `TauCeti.coindProjection`, `TauCeti.coindProjectionNatIso`, `TauCeti.indFDRepProjection` |
| Layer 1: the conjugate representation | `TauCeti.mem_conj_smul`, `TauCeti.conjSubgroupEquiv`, `TauCeti.conjRep`, `TauCeti.conjRepFunctor`, `TauCeti.conjRepEquiv`, `TauCeti.conjFDRep`, `TauCeti.conjFDRepEquiv`, `TauCeti.char_conjFDRep_mk`, `TauCeti.finrank_conjFDRep`, `TauCeti.isIrreducible_conjFDRep_iff`, `TauCeti.conjRep_one`, `TauCeti.conjRep_mul`, `TauCeti.conjNormalFDRep`, `TauCeti.conjNormalFDRepEquiv` |
| Layer 2: finite-dimensional induction and the left-coset model | `TauCeti.Rep.indSubtypeEquivPi`, `TauCeti.Rep.finrank_ind`, `TauCeti.indFDRep`, `TauCeti.indFDRepFunctor`, `TauCeti.indFDRepForgetEquiv`, `TauCeti.finrank_indFDRep`, `Rep.indLeftCosetCoinvariantEquiv` (`Ind_S^G A ≃ₗ (G ⧸ S →₀ A)`) |
| Layer 2: the induced-character formula | `TauCeti.character_indFDRep_sum_quotient` (coset form, every field), `TauCeti.character_ind` (averaged form, `IsUnit (Nat.card S : k)`) |
| Layer 2: permutation characters and the double-coset pairing | `TauCeti.indTrivialIso`, `TauCeti.char_ind_trivial`, `TauCeti.characterPairing_ind_trivial_eq_card_doubleCosetQuotient` |
| Layer 2: Frobenius reciprocity | `TauCeti.frobenius_reciprocity`, `TauCeti.frobenius_reciprocity_resFDRep`, `TauCeti.characterPairing_indFDRep`, `TauCeti.characterPairing_resFDRep`, `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank`, `FDRep.resIndFDRepHomEquiv` |
| §2.1: almost-conjugacy | `Subgroup.AlmostConjugate` with its equivalence-relation lemmas and decidability, `Subgroup.almostConjugate_conj_smul`, `Subgroup.natCard_fixedBy_mul_natCard`, `Subgroup.AlmostConjugate.natCard_eq`, `Subgroup.AlmostConjugate.index_eq`, `Subgroup.almostConjugate_iff_forall_natCard_fixedBy_eq`, `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`, `Subgroup.AlmostConjugate.comap`, `Subgroup.exists_map_conj_comap_eq_iff`, `TauCeti.invariantOrbitSumBasis`, `TauCeti.ofMulAction_invariantOrbitSumBasis_mk`, `TauCeti.orbitSumEquiv`, `Equiv.Perm.fullCycleType` (cycle lengths with fixed points), `Equiv.Perm.fullCycleType_permCongr`, `Equiv.Perm.cycleType_permCongr`, `Equiv.Perm.reverse_charpoly_lmapDomain` (`(charpoly π).reverse = ∏ (1 − Zᵈ)` over the full cycle type), `Subgroup.almostConjugate_iff_forall_natCard_cycleType_eq` |
| §2.2: a nonconjugate almost-conjugate pair in `S₁₆` | `TauCeti.exists_S16_gassmann_pair`, from the regular actions of `C₄ × C₄` and `Q₈ × C₂` (`MulAction.fullCycleType_toPerm_eq_replicate`, `TauCeti.natCard_orderOf_zmod_four_prod_eq_quaternionGroup_prod`) |
| Layer 3: Mackey's formula and its character form | `Rep.mackeyDecomposition`, `Rep.mackeyDecompositionNatIso`, `Rep.mackeySummand_eq_ind_res_conjRep`, `TauCeti.mackeySubgroup`, `TauCeti.mackeyToConjH`, `TauCeti.character_resFDRep_indFDRep_mackey` |
| Layer 4: Hom decomposition, intertwining numbers, criteria | `TauCeti.homToBiproductLinearEquiv`, `TauCeti.finrank_homTo_biproduct`, `Rep.homDirectSumLinearEquiv`, `FDRep.indHomMackeyLinearEquiv`, `FDRep.indHomMackeyLinearEquiv_naturality_left`, `FDRep.indHomMackeyLinearEquiv_naturality_right`, `TauCeti.finrank_hom_indFDRep_mackey_erase` (every field), `TauCeti.MackeyDisjoint`, `TauCeti.mackeyDisjoint_mul_left_mul_right_iff`, `TauCeti.mackeyDisjoint_iff_isEmpty_iso_of_normal`, `FDRep.simple_indFDRep_of_forall_mackeyDisjoint`, `FDRep.simple_indFDRep_iff_doubleCoset_of_scalarSchur`, `FDRep.simple_indFDRep_iff_of_scalarSchur`, `FDRep.simple_indFDRep_iff_of_normal_of_scalarSchur`, `TauCeti.simple_indFDRep_iff_doubleCoset`, `TauCeti.simple_indFDRep_iff`, `CategoryTheory.simple_iff_nontrivial_end_and_isUnit`, `TauCeti.nonempty_splitWedderburnAlgebraPresentation_iff_scalarSchur` |
| Layer 5: inertia, Clifford over an algebraically closed field | `TauCeti.inertia`, `TauCeti.mem_inertia_iff`, `TauCeti.le_inertia`, `FDRep.clifford_restrict_iso`, `TauCeti.clifford_restrict_character`, `FDRep.cliffordCorrespondence` |
| Layer 6: representation ring, Artin, Brauer, cyclotomic fields | `TauCeti.repRing`, `TauCeti.repRingCharacter`, `TauCeti.range_repRingCharacter`, `TauCeti.repRingCharacter_injective`, `TauCeti.repRingInd_mul_repRingRes`, `TauCeti.repRingEquivExactK0`, `TauCeti.indK0_mul_resK0`, `TauCeti.virtualCharacters`, `Subgroup.indClassFun`, `TauCeti.ClassFunction.indVirtualCharacters_eq_closure_indFDRepCharacter`, `TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`, `TauCeti.ClassFunction.natCard_nsmul_mem_indCharacterSpanInt_isCyclic`, `TauCeti.ClassFunction.indVirtualCharacterDirectSumBaseChangeRat_isCyclic_surjective`, `FDRep.nonempty_iso_of_finrank_invariants_eq_cyclic` (Artin's corollary; the converse is immediate), `TauCeti.IsPElementary`, `TauCeti.IsPHyperelementary`, `TauCeti.IsElementary`, `TauCeti.IsHyperelementary`, `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary`, `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`, `TauCeti.mem_virtualCharacters_iff_forall_comp_subtype_isElementary`, `FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension`, `FDRep.exists_simple_nonempty_iso_baseChange_adjoin_of_isPrimitiveRoot` |
| Layer 7: factor sets, Schur multiplier, twisted algebras, representation groups, Clifford extensions | `TauCeti.IsProjectiveRep`, `TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff`, `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` (no faithfulness needed), `TauCeti.FactorSet.cohomologyClass`, `TauCeti.FactorSet.cohomologyClassEquiv`, `TauCeti.schurMultiplier`, `TauCeti.twistedMonoidAlgebra`, `TauCeti.TwistedMonoidAlgebra.nonempty_algEquiv_of_cohomologyClass_eq`, `TauCeti.FactorSet.groupExtension`, `TauCeti.FactorSet.inl_range_le_center`, `TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq`, `TauCeti.exists_finite_stem_extension_lifting_pgl`, `TauCeti.exists_isProjectiveInertiaExtension`, `TauCeti.cliffordObstruction`, `TauCeti.cliffordObstruction_eq_zero_iff`, `TauCeti.CliffordExtension.groupExtension`, `TauCeti.CliffordExtension.nonempty_splitting_iff`, `FDRep.cliffordExtensionConjClassesEquiv`, `FDRep.cliffordExtensionNonabelianH1Equiv` |
| Worked examples: `S₄` on four points, Young subgroups, `S₃`, `D₄`, `A₄ ◁ S₄` | `TauCeti.characterPairing_ind_trivial_stabilizer`, `TauCeti.isCompl_invariantLine_augmentationSubrepresentation`, `TauCeti.permutationModuleIsoIndTrivial`, `Nat.Partition.character_indFDRep_trivial_parts_two_two`, `TauCeti.char_permutationModule`, `TauCeti.not_simple_indFDRep_stabilizer_perm_fin_three`, `TauCeti.simple_indFDRep_ofLinearCharacter_alternatingGroup_fin_three`, `TauCeti.simple_indFDRep_ofLinearCharacter_dihedralGroupFourRotationChar`, `TauCeti.inertia_ofLinearCharacter_alternatingGroup`, `FDRep.liesOver_alternatingGroup_iff_nonempty_iso_indFDRep` |

The former headings resolve as follows. Layer 2.1, "almost-conjugacy and permutation
representations", is now §2.1 together with the §2.1 row of the table, and Layer 2.2 is the §2.2
row. Layer 3a, "the decomposition as an isomorphism of representations", is Tau Ceti's
`Rep.mackeyDecomposition` together with §3.1, and Layer 3b is the Layer 3 row. The subsection
"Abstract universal central extensions" of Layer 7 is now §7.1; Layer7.ScalarObstruction is now
§7.5 and Layer7.DivisionCrossedSystem is §§7.6–7.8. The list "What Mathlib already has (consume)"
is now From Mathlib under Exact supplier contracts below.

FiniteGroupInvariants cites §2.1 and §2.2 by the names
Gassmann.almostConjugate_iff_permutation_equiv and Gassmann.exists_S16_gassmann_pair, and
PseudodifferentialOperators cites §2.1 by the first; these statements are Tau Ceti's
`TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` and `TauCeti.exists_S16_gassmann_pair`.
The comparison of the scalar Schur hypothesis with split Wedderburn presentations of `k[G]`, which
draws on SemisimpleAlgebras Layers 1–2, is Tau Ceti's
`TauCeti.nonempty_splitWedderburnAlgebraPresentation_iff_scalarSchur`.

**Not planned here.** The integral Schur multiplier `M(G) = H₂(G, ℤ)`, its duality with
`H²(G, ℂˣ)` and the identification of the kernel of a representation group with it belong to
InverseGaloisAndArithmeticFundamentalGroups IG.3.4, which takes `M(G)` to be Mathlib's
`groupHomology.H2`. Statements about the index of the integral image in Artin's induction theorem
(its finiteness, or a power of `|G|` it divides) are not part of the induction theorem and are not
targets. The reduced-multiplier theory of marked central extensions is InductionRestrictionPartII.
For the pair in `S₁₆` no Galois extension or number field is constructed here and no claim of
minimal degree is made.

## Exact supplier contracts

### From Mathlib

- *Representations and induction* (`Mathlib/RepresentationTheory/`): `Rep`, `FDRep`,
  `Representation.ind` with `Representation.ind_mk` (`x · ⟦g ⊗ a⟧ = ⟦g x⁻¹ ⊗ a⟧`), `Rep.ind`,
  `Rep.indFunctor`, `Rep.res`, `Rep.resFunctor`, `Rep.coind`, `Rep.coindFunctor`,
  `Rep.indResAdjunction`, `Rep.indResHomEquiv`, `Rep.resCoindAdjunction`, `Rep.resCoindHomEquiv`,
  `Rep.indCoindIso`, `Rep.indCoindNatIso` and `Rep.resIndAdjunction` (finite index),
  `Rep.coindResAdjunction`, `Rep.coinvariantsTensorIndNatIso`, `Rep.trivial`, `Rep.ofMulAction`,
  `Representation.ofMulAction`, `Representation.Equiv`, `Representation.comp`,
  `Representation.quotientToInvariants`, `Action.res`.
- *Characters and simplicity*: `FDRep.character` with `FDRep.char_one`, `FDRep.char_conj`,
  `FDRep.char_tensor`, `FDRep.char_iso`, `FDRep.scalar_product_char_eq_finrank_equivariant`;
  `Representation.IsIrreducible`, `Representation.IsSemisimpleRepresentation`, Maschke's theorem
  (`MonoidAlgebra.Submodule.exists_isCompl` and the instance `IsSemisimpleModule k[G] V` for
  `IsUnit (Nat.card G : k)`), `CategoryTheory.Simple`, `FDRep.forget₂HomLinearEquiv`;
  `IsSemisimpleModule`, `isotypicComponent`, `IsIsotypicOfType`, `Representation.asModule`,
  `ModuleCat`.
- *Schur's lemma* (`Mathlib/CategoryTheory/Preadditive/Schur.lean`): the division ring `End X` of a
  simple object, `CategoryTheory.finrank_endomorphism_simple_eq_one` and
  `CategoryTheory.endomorphism_simple_eq_smul_id` (algebraically closed field, finite-dimensional
  endomorphisms), `CategoryTheory.Aut.unitsEndEquivAut`; Jacobson density
  `Module.Finite.toModuleEnd_moduleEnd_surjective` (`Mathlib/RingTheory/SimpleModule/Basic.lean`,
  a semisimple module finite over its endomorphism ring).
- *Groups*: `Subgroup.FiniteIndex`, `Subgroup.index`, `Subgroup.subgroupOf`,
  `Subgroup.subgroupOfEquivOfLe`, `Subgroup.inclusion`, `MulAut.conj` with
  `Subgroup.Normal.conj_smul_eq_self`, `DoubleCoset.Quotient`, `DoubleCoset.mk`, `Group.IsPerfect`,
  `FreeGroup`, `FreeGroup.prod`, `commutator`, `Subgroup.center`, `QuotientGroup.lift`,
  `QuotientGroup.ker_lift`, `GroupExtension`, `QuaternionGroup`, `DihedralGroup`, `Quaternion`.
- *Cohomology and projective linear groups*: `groupCohomology.cocycles₂`,
  `groupCohomology.IsMulCocycle₂`, `groupCohomology.cocyclesOfIsMulCocycle₂`,
  `groupCohomology.H2`, `Rep.ofMulDistribMulAction`, `Matrix.ProjGenLinGroup`.
- *Categories*: `CategoryTheory.Limits.biproduct.desc`, `HasFiniteBiproducts`,
  `CategoryTheory.Abelian.hasFiniteBiproducts` (with the instance `Abelian (Rep k G)`),
  `CategoryTheory.Linear.homCongr`.
- *Vocabulary of the supplied theory and the examples*: `Rep.ofQuotient`, `FDRep.char_dual`,
  `FDRep.char_mul_comm`, `FDRep.average_char_eq_finrank_invariants`, `FDRep.char_orthonormal`,
  `Representation.linHom`, `Representation.dual`, `Representation.IsIrreducible.bijective_or_eq_zero`,
  `Representation.irreducible_iff_isSimpleModule_asModule`, `CategoryTheory.finrank_hom_simple_simple`,
  `DoubleCoset.iUnion_quotToDoubleCoset`, `DoubleCoset.disjoint_out`,
  `DoubleCoset.doubleCoset_union_leftCoset`, `Subgroup.card_mul_index`, `IsCyclic`, `IsPGroup`,
  `Subgroup.zpowers`, `GroupExtension.Equiv`, `GroupExtension.Section`, `GroupExtension.Splitting`,
  `groupCohomology.H2π`, `groupCohomology.coboundaries₂`, `groupCohomology.IsMulCoboundary₂`,
  `Matrix.ProjGenLinGroup.mk`, `Equiv.Perm.cycleType` (which omits fixed points),
  `Equiv.Perm.isConj_iff_cycleType_eq`, `LinearEquiv.charpoly_conj`, `MulAction.toPermHom`,
  `Fintype.equivFinOfCardEq`.

### From Tau Ceti

Every declaration of the table in the Scope section, with the hypotheses stated there, and:

- *Layer 0* (`RepresentationTheory/Induction/Transitivity.lean`): `TauCeti.Rep.indFunctorSubgroupOfIso`
  (over a commutative ring, universe `max u v`), `TauCeti.Rep.indFunctorCompIso` with
  `TauCeti.Rep.indFunctorCompIso_hom_app_hom_apply_mk_mk` (`⟦κ ⊗ ⟦h ⊗ a⟧⟧ ↦ ⟦ψ h κ ⊗ a⟧`) and
  `TauCeti.Rep.indFunctorCompIso_inv_app_hom_apply_mk` (`⟦κ ⊗ a⟧ ↦ ⟦κ ⊗ ⟦1 ⊗ a⟧⟧`),
  `TauCeti.Rep.indFunctorMulEquivIso`.
- *Layer 2*: `Representation.Equiv.invariantsLinearEquiv` (`RepresentationTheory/Invariants.lean`,
  over a commutative ring); `TauCeti.orbitSumEquiv` (`RepresentationTheory/OfMulAction.lean`);
  `TauCeti.ClassFunction.characterPairing`, `TauCeti.ClassFunction.ofCharacter`,
  `TauCeti.ClassFunction.ofFDRep`, `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_zero` and
  `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank`
  (`[Invertible (Nat.card G : k)]`, the pairing of `V` and `W` is `finrank k (W ⟶ V)`)
  (`RepresentationTheory/CharacterTable/Pairing.lean`); `TauCeti.characterPairing_ind` and
  `TauCeti.characterPairing_ofMulAction_eq_card_orbits`.
- *Layer 3* (`RepresentationTheory/Induction/Mackey/Decomposition.lean`; `k`, `G` and the carriers
  in one universe, `G` arbitrary): `Rep.mackeyInclusion` (`⟦u ⊗ a⟧ ↦ ⟦s⁻¹ u ⊗ a⟧`),
  `Rep.mackeySummand`, `Rep.mackeyDirectSum` (a direct sum of modules, not a categorical
  biproduct), `Rep.mackeyDecomposition`, `Rep.mackeyDecomposition_inv_hom_apply_lof`.
- *Layer 4* (`RepresentationTheory/Induction/Mackey/`): `FDRep.indHomMackeyLinearEquiv` (finite `G`,
  every field), `FDRep.indEndAlgHom`, `FDRep.indEndAlgHom_injective`, `FDRep.indEndAlgEquiv`,
  `TauCeti.mackeyToH` (`y ↦ s⁻¹ y s`), `TauCeti.mackeyDisjoint_iff_subsingleton`,
  `TauCeti.finrank_hom_res_mackeyToH_mul_left_mul_right`, `TauCeti.conjFDRep`,
  `TauCeti.mackeySummand_eq_indFDRep_res_conjFDRep`; `CategoryTheory.simple_iff_nontrivial_end_and_isUnit`
  (`CategoryTheory/Simple/Endomorphism.lean`, in a category in which every object is injective,
  as Mathlib makes `FDRep k G` for `NeZero (Nat.card G : k)`).
- *Layer 5* (`RepresentationTheory/Induction/Clifford/`, `RepresentationTheory/Induction/LiesOver.lean`):
  `FDRep.cliffordSum` and `FDRep.finrank_cliffordSum`; `FDRep.LiesOver`;
  `TauCeti.Representation.exists_isAtom_forall_nonempty_linearEquiv_conjSubrep`,
  `Representation.isotypicComponentsEquivQuotientInertia`,
  `Representation.exists_forall_finrank_linearMap_eq` and
  `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` (every field);
  `FDRep.indResFDRepHomEquiv`; `Subgroup.resFDRep`; `FDRep.liesOver_indFDRep_of_inertia` (every
  field, inertia group of finite index) and
  `FDRep.nonempty_iso_of_liesOver_inertia_of_nonempty_iso_indFDRep` (finite `G`, characteristic
  zero, `V` simple); `IsSemisimpleModule.linearEquivIsotypicComponents`,
  `IsSemisimpleModule.exists_linearEquiv_pi_quotient`,
  `LinearEquiv.finrank_linearMap_eq_natCard_mul_finrank_end` and
  `TauCeti.finrank_linearMap_pos_iff_exists_nonempty_linearEquiv` (every field)
  (`RingTheory/SimpleModule/Isotypic.lean`, `RingTheory/Semisimple/Multiplicity.lean`).
- *Layer 6* (`RepresentationTheory/CharacterTable/`, `RepresentationTheory/RepresentationRing/`):
  `TauCeti.irreducibleCharacters`, `TauCeti.irreducibleCharacters_subset_range`,
  `TauCeti.virtualCharacters_eq_closure_irreducibleCharacters` and
  `TauCeti.ClassFunction.linearIndependent_character_fdRep` (algebraically closed, invertible
  `|G|`).
- *Layer 7*: `TauCeti.IsProjectiveRep.toPGL`, `MonoidHom.exists_isProjectiveRep_toPGL_eq`
  (`ProjectiveRepresentation/PGL/Basic.lean`); `TauCeti.IsProjectiveRep.cohomologyClass_eq_of_eq_smul`
  (`[FaithfulSMul kˣ V]`); `TauCeti.trivialMulDistribMulAction`; `TauCeti.IsFactorSet`,
  `TauCeti.TwistedMonoidAlgebra.basis`, `TauCeti.TwistedMonoidAlgebra.of_mul_of`,
  `TauCeti.isProjectiveRepEquivAlgHom`; `TauCeti.FactorSet`, `TauCeti.FactorSet.Extension`,
  `TauCeti.FactorSet.Extension.equivProd`, `TauCeti.FactorSet.range_inl_eq_ker_rightHom`,
  `TauCeti.FactorSet.cohomologyClass_eq_iff`;
  `TauCeti.exists_finite_stem_factorSet_bijective_characterTransgression` and
  `TauCeti.IsProjectiveRep.exists_linearization_of_characterTransgression_surjective`;
  `TauCeti.IsProjectiveInertiaExtension`, `TauCeti.IsProjectiveInertiaExtension.homAction`,
  `TauCeti.IsProjectiveInertiaExtension.isProjectiveRep_homAction`,
  `TauCeti.IsProjectiveInertiaExtension.tensorRep` and
  `TauCeti.IsProjectiveInertiaExtension.evalTensor` (every commutative ring, `k`, `G` and the
  carriers in arbitrary universes); `TauCeti.inertia_congr` (every ring);
  `TauCeti.IsProjectiveInertiaExtension.evalTensor_surjective` (every field, `W` irreducible with a
  nonzero `N`-map from `V`); `TauCeti.IsProjectiveInertiaExtension.evalTensor_injective`
  (algebraically closed, `V` simple) and `TauCeti.IsProjectiveInertiaExtension.tensorRepEquiv`
  (algebraically closed, `V` simple, `W` irreducible with a nonzero `N`-map from `V`);
  `TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction`
  (algebraically closed, `V` simple, `k` and `G` in `Type`);
  `TauCeti.CrossedSystem`, `TauCeti.CrossedSystem.opInv`, `TauCeti.CrossedSystem.comap`,
  `TauCeti.CrossedSystem.Algebra`, `TauCeti.CrossedSystem.Algebra.comapHom`,
  `TauCeti.CrossedSystem.Algebra.gaugeEquiv`, `TauCeti.CrossedSystem.Algebra.moduleFinite_rightSubgroup`,
  `TauCeti.CliffordExtension.commutantAction`, `TauCeti.OuterAlgAut`, `FDRep.cliffordCrossedSystem`,
  `FDRep.cliffordOuterAction`, `FDRep.commutantAction_gauge`, `FDRep.factorSetFun_clifford_gauge`,
  `FDRep.cliffordMultiplicityFunctor`, `FDRep.cliffordMultiplicityFunctor_map_bijective`,
  `FDRep.cliffordMultiplicityHomEquiv`,
  `FDRep.cliffordBalancedEvaluationEquiv`, `FDRep.cliffordCrossedProductEquiv` (every field, no
  simplicity or finiteness unless stated).

## References

- J.-P. Serre, *Linear Representations of Finite Groups*, Springer GTM 42 (1977). Part II, §7
  (induced representations, the induced character), §7.2 (the reciprocity formula), and the
  Mackey irreducibility criterion (§7.4). Part II, §§9–12 (the ring `R(G)` and Artin's theorem
  in Ch. 9, Brauer's theorem in Ch. 10, Brauer's characterization of characters in §11.1,
  realizability over cyclotomic fields in §12.3), for Layer 6.
- I. M. Isaacs, *Character Theory of Finite Groups*, Academic Press (1976), reprinted as AMS
  Chelsea Publishing vol. 359. Ch. 5 (induced characters, Frobenius reciprocity), Ch. 6 (Clifford
  theory, the inertia group, the Clifford correspondence), and Ch. 11 (projective
  representations), for Layer 7.
- C. W. Curtis, I. Reiner, *Methods of Representation Theory, Vol. I*, Wiley (1981). §10–11
  (induction and restriction of modules, the Mackey decomposition and subgroup theorems,
  transitivity, the projection formula) and §11 (Clifford theory) in module-theoretic generality.
- G. James, M. Liebeck, *Representations and Characters of Groups*, 2nd ed., CUP (2001). Ch. 21
  (induced modules and characters), with the `Sₙ` and permutation-character examples.
- J. L. Alperin, R. B. Bell, *Groups and Representations*, Springer GTM 162 (1995). §16
  (induction), the last section of the chapter on group representations.
- G. W. Mackey, *On induced representations of groups*, Amer. J. Math. 73 (1951), 576–592. The
  original decomposition and irreducibility theorems.
- C. A. Weibel, *The K-book: an Introduction to Algebraic K-theory*, AMS Graduate Studies in
  Mathematics 145 (2013), in the chapter files on the author's web page. Ch. III, Lemmas
  5.3.2–5.3.3, Example 5.3.4 and Theorem 5.4 (the central extension `[F, F]/[F, R]` of a free
  presentation and the universal central extension of a perfect group), for §7.1.
- Lean Zulip, [Category Rep and restriction of scalars](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Category.20Rep.20and.20restriction.20of.20scalars/with/607304102):
  representation maps are constructed first and categorical wrappers derived from them.
