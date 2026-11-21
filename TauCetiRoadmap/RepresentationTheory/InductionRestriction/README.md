# Roadmap: induction, restriction, and Mackey theory for finite groups

**Summary.** Induction and restriction move representations between a group G and its
subgroups H, K and normal subgroups N, over a commutative ring k for statements about
representations and over a field k for characters and simplicity. The roadmap builds the classical
theory: transitivity and the projection formula, conjugate representations, finite-dimensional
induction, the induced character and Frobenius reciprocity, almost-conjugate subgroups, Mackey's
decomposition and irreducibility criterion, Clifford theory, the virtual-character ring with
Artin's and Brauer's induction theorems, projective representations, Schur multipliers and
universal central extensions. Tau Ceti proves much of it, often over algebraically closed
fields, and each such statement below names the declarations that realise it; the further targets
are the statements over general fields and the constructions that complete the theory.

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

Mathlib supplies the categorical spine (induction, restriction, coinduction, both adjunctions,
characters, group cohomology, group extensions), and Tau Ceti's induction, Clifford and
projective-representation library supplies the theorems the targets generalize and most inputs of
their proofs. The roadmap feeds CharacterTheory (induced and permutation characters, the Mackey
criterion), FiniteGroupInvariants and PolynomialGaloisGroupsPartIII (almost-conjugacy of
subgroups), InverseGaloisAndArithmeticFundamentalGroups and InductionRestrictionPartII
(representation groups), and StableHomotopyKTheory (universal central extensions).

Layer 0 is the functorial core: transitivity, the projection formula and generator formulas for
induction in stages. Layer 1 is the conjugate representation. Layer 2 is finite-dimensional
induction, the induced character, permutation characters and Frobenius reciprocity, with two
sublayers on almost-conjugacy of subgroups: its criteria and adapters (Layer 2.1) and a
nonconjugate almost-conjugate pair in S₁₆ (Layer 2.2). Layer 3 is Mackey's formula, as an
isomorphism of representations and a finite biproduct (Layer 3a) and as a character identity
(Layer 3b). Layer 4 is the Hom-space decomposition, intertwining numbers and Mackey's
irreducibility criterion, with a simple induced representation over ℝ for which the criterion's
disjointness condition fails. Layer 5 is Clifford theory over every field; Layer 6 the
virtual-character ring, the induction theorems of Artin and Brauer and the lattice over a field of
characteristic zero; Layer 7 universal central extensions, projective representations, Schur
multipliers, the scalar Clifford obstruction and division crossed systems.

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
   `⟨(2 3)⟩`, while `s⁻¹ H s` is `⟨(1 3)⟩`. Layer 1 states these facts.
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
    (Layer 2.1) and `AbstractUCE` (§7.1). In Tau Ceti the material lives under
    `TauCeti/RepresentationTheory/Induction/` and `TauCeti/RepresentationTheory/ProjectiveRepresentation/`.

## Layer 0: the functorial core -- transitivity and the projection formula

Everything here is over a commutative ring `k`, on Mathlib's `Rep k G`, and consumes Mathlib's
adjunctions `Ind ⊣ Res ⊣ Coind`.

**Transitivity.** For group homomorphisms `φ : G →* H` and `ψ : H →* K`, restriction, induction
and coinduction along the composite are the composites of the functors along `φ` and `ψ`, as
natural isomorphisms: `Res_ψ ⋙ Res_φ ≅ Res_{ψ ∘ φ}` (an equality of functors, valid for monoids
over a semiring), `Ind_φ ⋙ Ind_ψ ≅ Ind_{ψ ∘ φ}`, and `Coind_φ ⋙ Coind_ψ ≅ Coind_{ψ ∘ φ}` (for
monoids). The induction isomorphism is the one that corresponds to the restriction isomorphism
under the composite adjunction `Ind ⊣ Res`. For subgroups `S ≤ T ≤ G`, inducing a representation of
`S`, viewed as the subgroup `S.subgroupOf T` of `T`, first to `T` and then to `G` is naturally
isomorphic to inducing it from `S` to `G` directly, after the identification
`Subgroup.subgroupOfEquivOfLe` of `S.subgroupOf T` with `S` (Curtis–Reiner §10–11, transitivity).
The functors are taken in one universe, the maximum of those of `k`, the groups and the carriers.
*In Tau Ceti:* `TauCeti.Rep.resFunctorCompIso`, `TauCeti.Rep.indFunctorCompIso`, `TauCeti.Rep.coindFunctorCompIso`, `TauCeti.Rep.conjugateEquiv_indFunctorCompIso_inv`, `TauCeti.Rep.indFunctorSubgroupOfIso`.

**The projection formula and its dual.** For `φ : G →* H`, `X : Rep k G` and `Y : Rep k H`,
`Ind_φ (X ⊗ Res_φ Y) ≅ (Ind_φ X) ⊗ Y` in `Rep k H` (with `k` and `H` in one universe), naturally in
`X` and in `Y`. On generators the forward map is `⟦h ⊗ (x ⊗ y)⟧ ↦ ⟦h ⊗ x⟧ ⊗ ρ_Y(h⁻¹) y` and the
inverse `⟦h ⊗ x⟧ ⊗ y ↦ ⟦h ⊗ (x ⊗ ρ_Y(h) y)⟧`. Taking `H`-coinvariants and composing with Mathlib's
`Rep.coinvariantsTensorIndHom` sends the class of `⟦h ⊗ z⟧` to the class of `z`, which compares the
formula with Mathlib's coinvariant form `Rep.coinvariantsTensorIndNatIso`. Dually, coinduction
satisfies `Coind_φ (Hom(Res_φ Y, X)) ≅ Hom(Y, Coind_φ X)` for the internal Hom of `Rep`, naturally in
`X`. For a subgroup `S` of finite index and finite-dimensional representations over a field,
`Ind_S^G (A ⊗ Res_S B) ≅ (Ind_S^G A) ⊗ B` in `FDRep k G`; on classes this makes induction a
homomorphism of modules over the representation ring (Layer 6) (Curtis–Reiner §10–11, the
projection formula).
*In Tau Ceti:* `TauCeti.indProjection`, `TauCeti.indProjection_hom_hom_apply`, `TauCeti.indProjectionNatIsoLeft`, `TauCeti.indProjectionNatIsoRight`, `TauCeti.coinvariantsTensorIndHom_map_indProjection_mk`, `TauCeti.coindProjection`, `TauCeti.coindProjectionNatIso`, `TauCeti.indFDRepProjection`.

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

Mathlib's induction, restriction and coinduction functors and their adjunctions; Tau Ceti's
transitivity isomorphisms for §0.1. Layer 0 needs no other layer.

## Layer 1: the conjugate representation

Over a ring `k` (the constructions need only a semiring); the character statements over a field.
Layer 1 is independent of Layer 0.

**The conjugation convention.** For `s : G` and `H : Subgroup G`,
`x ∈ MulAut.conj s • H ↔ s⁻¹ * x * s ∈ H`, so `MulAut.conj s • H` is `sHs⁻¹`; it is the image
`H.map (MulAut.conj s)`, and `x ↦ s⁻¹ x s` is a group isomorphism `sHs⁻¹ ≃* H`. Every formula of
this layer is read off this convention, so that no statement can be silently orientation-reversed.
*In Tau Ceti:* `TauCeti.mem_conj_smul`, `TauCeti.map_conj_eq_conj_smul`, `TauCeti.conjSubgroupEquiv`.

**The conjugate representation.** For `s : G`, `H : Subgroup G` and `A : Rep k H`, the conjugate
`{}^s A` is the representation of `sHs⁻¹` on the module of `A` in which `x` acts by
`A.ρ ⟨s⁻¹ x s, _⟩`, that is, the restriction of `A` along `sHs⁻¹ ≃* H`. It is functorial in `A`,
and conjugation by `s` is an equivalence of categories `Rep k H ≌ Rep k (sHs⁻¹)` whose inverse is
conjugation by `s⁻¹`. Conjugation by `1` is the identity and `{}^{st} A = {}^s({}^t A)`, each up to
the canonical identification of the conjugated subgroups (`1 H 1⁻¹ = H` and
`(st) H (st)⁻¹ = s (t H t⁻¹) s⁻¹`): this is the coherence that Mackey and Clifford theory use.
*In Tau Ceti:* `TauCeti.conjRep`, `TauCeti.conjRepFunctor`, `TauCeti.conjRepEquiv`, `TauCeti.conjRep_one`, `TauCeti.conjRep_mul`.

**The conjugate character.** For a field `k` and `A : FDRep k H`, the conjugate `{}^s A` is a
finite-dimensional representation of `sHs⁻¹` with
`({}^s A).character x = A.character ⟨s⁻¹ x s, _⟩` for `x ∈ sHs⁻¹`; in particular
`finrank k ({}^s A) = finrank k A`. The conjugate is irreducible exactly when `A` is, and conjugation
is an equivalence `FDRep k H ≌ FDRep k (sHs⁻¹)`.
*In Tau Ceti:* `TauCeti.conjFDRep`, `TauCeti.char_conjFDRep_mk`, `TauCeti.finrank_conjFDRep`, `TauCeti.isIrreducible_conjFDRep_iff`, `TauCeti.conjFDRepEquiv`.

**Checks.**
- For `G = S₃`, `H = ⟨(1 2)⟩`, `s = (1 2 3)` and the sign `ε` of `H`, the conjugate is a character
  of `sHs⁻¹ = ⟨(2 3)⟩` with `({}^s ε)((2 3)) = ε((1 2)) = −1`, since `s⁻¹ (2 3) s = (1 2)`. The
  opposite reading `s (2 3) s⁻¹ = (1 3)` leaves `H`, so a formula with the conjugation reversed
  would not even be defined.

**Conjugation on a normal subgroup.** For `N` normal in `G`, `MulAut.conj g • N = N` (Mathlib's
`Subgroup.Normal.conj_smul_eq_self`), so conjugation by `g` is an autoequivalence of `Rep k N` and
of `FDRep k N`: `{}^g A` is the representation of `N` in which `x` acts by `A.ρ (g⁻¹ x g)`, with
inverse conjugation by `g⁻¹`. On isomorphism classes of `FDRep k N` this is an action of `G`, the
action Clifford theory (Layer 5) uses.
*In Tau Ceti:* `TauCeti.conjNormalRep`, `TauCeti.conjNormalRepEquiv`, `TauCeti.conjNormalFDRep`, `TauCeti.conjNormalFDRepEquiv`, `TauCeti.conjNormalFDRepSkeletonMulAction`.

### Examples

- For `S₃ ⊃ A₃` and the linear character `λ` of `A₃` with `λ((1 2 3)) = ω`, a primitive cube root
  of unity, the conjugate by `(1 2)` is `λ² = λ⁻¹`, because `(1 2)⁻¹ (1 2 3) (1 2) = (1 3 2)`; the
  conjugates by elements of `A₃` are `λ` itself.

### Dependencies

Mathlib's pointwise conjugation of subgroups and restriction along group isomorphisms
(`Action.res`, `MulEquiv.resFunctorEquiv`). Layer 1 needs no other layer.

## Layer 2: induced characters and Frobenius reciprocity

Finite-dimensional induction and the induced character need a field `k` and a subgroup `S` of
finite index; the averaged formula needs `IsUnit (Nat.card S : k)`; normalized pairings and
reciprocity need `G` finite and `hG : IsUnit (Nat.card G : k)`, and no splitting hypothesis. The
sublayers Layer 2.1 and Layer 2.2 below, on almost-conjugacy of subgroups, need neither the
induced character nor Layers 0 and 1. This layer connects to the
[character-theory roadmap](../CharacterTheory/README.md).

**Finite-dimensional induction and the left-coset model.** For a field `k`, a subgroup `S` of
finite index and a finite-dimensional `A`, the induced representation `Ind_S^G A` is
finite-dimensional with `finrank k (Ind_S^G A) = [G : S] · finrank k A`. Its finite-dimensional
form is a functor `FDRep k S ⥤ FDRep k G` whose composite with the forgetful functor to `Rep` is
Mathlib's induction, up to an equivariant linear equivalence (natural in `A`). Over a commutative
ring and for `S` of finite index, `Ind_S^G A` is, as a module, the product of copies of `A`
indexed by the right cosets of `S`, and, through `Sg ↦ g⁻¹S`, the free left-coset model
`Ind_S^G A ≃ₗ[k] (G ⧸ S →₀ A)`: the generator `⟦g ⊗ a⟧` goes to the vector at the coset `g⁻¹S`
with value `a` corrected by the right-coset factor of `g`, and `x : G` moves the value at a coset
`q` to the coset `x q`, corrected by an element of `S`. The two carriers are not definitionally
equal.
*In Tau Ceti:* `TauCeti.Rep.finiteDimensional_ind`, `TauCeti.Rep.finrank_ind`, `TauCeti.Rep.indSubtypeEquivPi`, `Rep.indLeftCosetCoinvariantEquiv`, `Rep.indLeftCosetCoinvariantEquiv_mk`, `Rep.indLeftCosetCoinvariantEquiv_ρ_apply`, `TauCeti.indFDRep`, `TauCeti.indFDRepFunctor`, `TauCeti.indFDRepForgetEquiv`, `TauCeti.indFDRepForgetIso`, `TauCeti.indFDRepForgetNatIso`, `TauCeti.finrank_indFDRep`.

**The induced-character formula.** For a field `k`, `S` of finite index, `A : FDRep k S` and
`g : G`, the induced character is the sum over the chosen representatives `t` of the left cosets
`G ⧸ S` with `t⁻¹ g t ∈ S`:
`χ_{Ind A}(g) = ∑_{t ∈ G ⧸ S, t⁻¹ g t ∈ S} χ_A(t⁻¹ g t)`. No invertibility of `|S|` is needed.
The summands do not depend on the representatives, because `χ_A` is a class function on `S`. The
same sum defines the induced class function of any function on `S`, and on a character it is the
character of the induced representation (Serre, Part II, §7.2; Isaacs, Ch. 5).
*In Tau Ceti:* `TauCeti.character_indFDRep_sum_quotient`, `Subgroup.indClassFun`, `Subgroup.indClassFunction`, `Subgroup.indClassFun_ofFDRep_character`.

**Checks.**
- For `G = S₃`, `S = ⟨(1 2)⟩` and `A` the sign of `S`, the formula gives `(3, −1, 0)` on the
  identity, the transpositions and the 3-cycles: at `(1 2)` only the coset `S` contributes. A sum
  over all of `G` without the factor `|S|⁻¹` would give `(6, −2, 0)`.

**The averaged form.** For finite `G` and `IsUnit (Nat.card S : k)`,
`χ_{Ind A}(g) = |S|⁻¹ · ∑_{x ∈ G, x⁻¹ g x ∈ S} χ_A(x⁻¹ g x)`. The invertibility of `|S|` is what makes
the factor `|S|⁻¹` meaningful; without it the coset form above is the one to use.
*In Tau Ceti:* `TauCeti.character_ind`.

**Permutation characters and the double-coset pairing.** For `H ≤ G` and a commutative ring `k`,
`Ind_H^G 1 ≅ k[G ⧸ H]`, the permutation representation on the left cosets with `G` acting by left
translation. For `H` of finite index and a field `k`, the character of `Ind_H^G 1` at `g` is the
number of cosets fixed by `g`, cast into `k`. For finite `G` and `hG`, the pairing of the
permutation characters of two finite `G`-sets `X` and `Y` is the number of `G`-orbits on `X × Y`,
so `⟨Ind_H^G 1, Ind_K^G 1⟩_G = #(H \ G / K)`, the natural number cast into `k`; in particular
`⟨Ind_H^G 1, Ind_H^G 1⟩_G = #(H \ G / H)` and, with the one-point `G`-set,
`⟨Ind_H^G 1, 1⟩_G = 1`, which is Frobenius reciprocity against the trivial representation (Serre,
Part II, §7.2).
*In Tau Ceti:* `TauCeti.indTrivialIso`, `TauCeti.char_ind_trivial`, `TauCeti.characterPairing_ofMulAction_eq_card_orbits`, `TauCeti.characterPairing_ind_trivial_eq_card_doubleCosetQuotient`.

**Checks.**
- For `G = S₃` and `H = ⟨(1 2)⟩` the permutation character is `(3, 1, 0)` on the classes of `1`, the
  transpositions and the 3-cycles; `⟨χ, 1⟩ = (3 + 3·1 + 2·0)/6 = 1` and
  `⟨χ, χ⟩ = (9 + 3·1 + 2·0)/6 = 2`, the number of double cosets `H \ S₃ / H`.
- The invertibility of `|G|` is needed: for `k = 𝔽₂`, `G = C₂` and `H = 1`, the factor
  `(Nat.card G : k)⁻¹` is `0` and the pairing is `0`, not `1`.

**Frobenius reciprocity.** For a field `k`, `S` of finite index, `A : FDRep k S` and
`B : FDRep k G`, there are `k`-linear equivalences `Hom_G(Ind_S^G A, B) ≃ Hom_S(A, Res_S B)` and,
since induction from a subgroup of finite index is also right adjoint to restriction,
`Hom_S(Res_S B, A) ≃ Hom_G(B, Ind_S^G A)`. For finite `G` and `hG`, with no splitting hypothesis,
`⟨χ_{Ind A}, χ_B⟩_G = ⟨χ_A, χ_{Res B}⟩_S`, where `⟨f₁, f₂⟩ = |G|⁻¹ ∑_g f₁(g) f₂(g⁻¹)`; written out,
`|G|⁻¹ ∑_g χ_{Ind A}(g) χ_B(g⁻¹) = |S|⁻¹ ∑_s χ_A(s) χ_B(s⁻¹)`, and likewise with the two arguments
exchanged and for induced class functions. The pairing of two characters is the dimension of a
Hom space cast into `k`, `⟨χ_V, χ_W⟩ = finrank k (W ⟶ V)`, so it is `1` for a simple `V` with
scalar endomorphisms, and `0` for two non-isomorphic simple representations over any field. In
characteristic zero a nonzero pairing detects a common constituent; in characteristic `p` the cast
can vanish although the Hom dimension is positive, and a constituent is detected by the
natural-number dimension (§5.1) (Serre, Part II, §7.2; Isaacs, Ch. 5).
*In Tau Ceti:* `FDRep.indResFDRepHomEquiv`, `FDRep.resIndFDRepHomEquiv`, `TauCeti.frobenius_reciprocity`, `TauCeti.frobenius_reciprocity_resFDRep`, `TauCeti.characterPairing_indFDRep`, `TauCeti.characterPairing_resFDRep`, `TauCeti.characterPairing_ind`, `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank`, `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_zero`.

**Checks.**
- The scalar-endomorphism hypothesis is needed for `⟨χ_V, χ_V⟩ = 1`: over `ℝ` the rotation
  representation of `C₃` on `ℝ²` is simple with character `(2, −1, −1)` and
  `⟨χ, χ⟩ = (4 + 1 + 1)/3 = 2`, the dimension of its endomorphism algebra `ℂ`.

### Layer 2.1: almost-conjugacy and permutation representations

`G` is a group, finite where a count needs it; `k` is a commutative ring unless stated.

**Almost-conjugacy.** Two subgroups `H`, `K` of `G` are almost conjugate (Gassmann equivalent) when
they meet every conjugacy class `C` of `G` (Mathlib's `ConjClasses`) in the same number of
elements, `Nat.card (C ∩ H) = Nat.card (C ∩ K)`; equivalently, for every `g : G` they contain
equally many conjugates of `g`. For finite `G` with decidable equality and decidable membership the
relation is decidable, through the same counts with `Fintype.card`. It is reflexive, symmetric and
transitive; it is transported along group isomorphisms, to images and to preimages; it is
invariant under simultaneous conjugation; and conjugate subgroups are almost conjugate.
*In Tau Ceti:* `Subgroup.AlmostConjugate`, `Subgroup.almostConjugate_iff_forall_natCard_isConj`, `Subgroup.AlmostConjugate.refl`, `Subgroup.AlmostConjugate.symm`, `Subgroup.AlmostConjugate.trans`, `Subgroup.AlmostConjugate.equivalence`, `Subgroup.AlmostConjugate.map`, `Subgroup.AlmostConjugate.comap`, `Subgroup.almostConjugate_conj_smul`, `Subgroup.almostConjugate_conj_smul_iff`.

**Checks.**
- Almost-conjugacy is not isomorphism of subgroups: in `C₂ × C₂` every conjugacy class is a single
  element, so two almost-conjugate subgroups are equal, and the three subgroups of order `2` are
  pairwise not almost conjugate.

**The fixed-coset identity and criterion.** For `H ≤ G` and `g : G`,
`#(G ⧸ H)^g · |H| = |C_G(g)| · #(H ∩ [g])`, where `(G ⧸ H)^g` is the set of left cosets fixed by
`g`, `C_G(g)` is the centralizer of `g` (its stabilizer under conjugation) and `[g]` its conjugacy
class: both sides count the `x : G` with `x⁻¹ g x ∈ H`, and no finiteness is needed, `Nat.card` of
an infinite type being `0`. For finite `G`, almost-conjugate subgroups have the same order and the
same index, and `H`, `K` are almost conjugate exactly when every `g : G` fixes as many cosets of
`H` as of `K`.
*In Tau Ceti:* `Subgroup.natCard_fixedBy_mul_natCard`, `Subgroup.AlmostConjugate.natCard_eq`, `Subgroup.AlmostConjugate.index_eq`, `Subgroup.almostConjugate_iff_forall_natCard_fixedBy_eq`.

**Checks.**
- For `G = S₃`, `H = ⟨(1 2)⟩` and `g = (1 2)`: `g` fixes only the coset `H`, `|C_G(g)| = 2`, and
  `H` contains one conjugate of `g`, so both sides are `1 · 2 = 2 · 1`; an identity without the
  factor `|H|` would read `1 = 2`.

**Permutation representations.** For finite `G` and a field `k` of characteristic zero, two finite
`G`-sets `X`, `Y` have equivalent permutation representations `k[X]` and `k[Y]` exactly when every
`g : G` has as many fixed points on `X` as on `Y`. Hence `H` and `K` are almost conjugate exactly
when `k[G ⧸ H]` and `k[G ⧸ K]` are equivalent, equivalently when `Ind_H^G 1` and `Ind_K^G 1` are
(over `ℂ` in particular).
*In Tau Ceti:* `TauCeti.nonempty_equiv_ofMulAction_iff_forall_natCard_fixedBy_eq`, `TauCeti.nonempty_equiv_ind_trivial_iff_forall_natCard_fixedBy_eq`, `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`.

**Transport along isomorphisms.** For `e : G ≃* Γ` and subgroups `H`, `K` of `Γ`: if `H` and `K` are
almost conjugate, so are their preimages `H.comap e` and `K.comap e`, with no finiteness hypothesis;
and the preimages are conjugate in `G`, `∃ σ : G, (H.comap e).map (MulAut.conj σ) = K.comap e`,
exactly when `∃ τ : Γ, H.map (MulAut.conj τ) = K`, so nonconjugacy is transported as well. The
subgroup `H.map (MulAut.conj τ)` is `MulAut.conj τ • H`, the convention of Layer 1, so a consumer
can use either form.
*In Tau Ceti:* `Subgroup.AlmostConjugate.comap`, `Subgroup.exists_map_conj_comap_eq_iff`, `TauCeti.map_conj_eq_conj_smul`.

**Orbit sums.** For a group `I` acting on a finite set `X` and a commutative ring `k`, the
`I`-invariants of `k[X]` are free with basis indexed by the orbit space `orbitRel.Quotient I X`,
the basis vector at an orbit being the sum over that orbit. If a group `D` acts on `X` and `I ≤ D`,
an element `d` normalizing `I` sends the sum over the `I`-orbit of `x` to the sum over the `I`-orbit
of `d • x`. For `I` normal in `D`, the quotient `D ⧸ I` acts on the `I`-orbits, and the orbit sums
are an equivalence between the permutation representation of `D ⧸ I` on the `I`-orbits and the
representation of `D ⧸ I` on the `I`-invariants of `k[X]` (Mathlib's
`Representation.quotientToInvariants`).
*In Tau Ceti:* `TauCeti.invariantOrbitSumBasis`, `TauCeti.ofMulAction_invariantOrbitSumBasis_mk`, `MulAction.orbitRel.Quotient.instMulActionQuotientGroup`, `TauCeti.orbitSumEquiv`.

**The cycle-type determinant.** For a commutative ring `k`, a finite set `S` and `π : Equiv.Perm S`,
let `ρπ` be the linear endomorphism of `S →₀ k` sending the basis vector at `s` to the basis vector
at `π s`. Then `(LinearMap.charpoly ρπ).reverse = (π.fullCycleType.map fun d ↦ 1 - Z ^ d).prod` in
`k[Z]`, where `π.fullCycleType` is the multiset of cycle lengths of `π` including one `1` for each
fixed point, and the product counts repeated lengths with multiplicity; Mathlib's
`Equiv.Perm.cycleType` omits the fixed points. Relabelling the set preserves both cycle types, and
the identity is invariant under an equivariant linear equivalence (Mathlib's
`LinearEquiv.charpoly_conj`).
*In Tau Ceti:* `Equiv.Perm.fullCycleType`, `Equiv.Perm.reverse_charpoly_lmapDomain`, `Equiv.Perm.fullCycleType_permCongr`, `Equiv.Perm.cycleType_permCongr`.

**Checks.**
- For a transposition `π` of a three-element set, the full cycle type is `{2, 1}` and the reversed
  characteristic polynomial is `(1 − Z²)(1 − Z)`, of degree `3`; the product over `cycleType = {2}`
  would give `1 − Z²`, of the wrong degree.

**The cycle-type criterion.** For a finite type `α`, two subgroups of `Equiv.Perm α` are almost
conjugate exactly when, for every multiset `m` of natural numbers, they contain equally many
permutations of cycle type `m`, two permutations being conjugate exactly when they have the same
cycle type (Mathlib's `Equiv.Perm.isConj_iff_cycleType_eq`). This is the criterion Layer 2.2 applies.
*In Tau Ceti:* `Subgroup.almostConjugate_iff_forall_natCard_cycleType_eq`.

### 2.1.1 Restriction and quotient-invariant adapters

Arithmetic applications pass an equivalence of permutation representations to a decomposition
group `D` and to the invariants of an inertia subgroup `I` normal in `D`. For that, define, over a
commutative ring `k`:

- `Gassmann.restrictEquiv`: an equivalence `e` of representations `ρ`, `σ` of `G` restricts, along
  any group homomorphism `f : D →* G`, to an equivalence of `ρ.comp f` and `σ.comp f`, with the same
  underlying linear equivalence.
- `Gassmann.normalInvariantEquiv`: for `I` normal in `G`, `e` induces an equivalence of the
  representations of `G ⧸ I` on the `I`-invariants (Mathlib's `Representation.quotientToInvariants`),
  whose underlying linear map is the restriction of `e` to invariants.

API:

- The underlying linear map of the second adapter is Tau Ceti's
  `Representation.Equiv.invariantsLinearEquiv` of the restriction of `e` to `I`.
- Composed with the orbit-sum equivalence above, which identifies, for a finite `D`-set `X`, the
  representation of `D ⧸ I` on the `I`-invariants of `k[X]` with the permutation representation on
  the `I`-orbits, an equivalence of the permutation representations of `D` on two finite sets
  yields an equivalence of the permutation representations of `D ⧸ I` on their `I`-orbits.

*Needs:* Mathlib `Representation.Equiv`, `Representation.comp`,
`Representation.quotientToInvariants`; Tau Ceti `Representation.Equiv.invariantsLinearEquiv`, and
`TauCeti.orbitSumEquiv` for the second API fact.

### Layer 2.2: a nonconjugate almost-conjugate pair in `S₁₆`

**The cycle type of a regular action.** If a group `G` acts freely on a finite set `X`, then for
`g : G` the permutation of `X` induced by `g` has full cycle type
`Multiset.replicate (Nat.card X / orderOf g) (orderOf g)`; for the left-regular action of a group of
order `m`, an element of order `d` acts with `m / d` cycles of length `d`.
*In Tau Ceti:* `MulAction.fullCycleType_toPerm_eq_replicate`.

**The pair.** Let `A = Multiplicative (ZMod 4) × Multiplicative (ZMod 4)` and
`B = QuaternionGroup 2 × Multiplicative (ZMod 2)`, that is `C₄ × C₄` and `Q₈ × C₂`. Both have order
16 and, for every `n`, equally many elements of order `n`: one of order 1, three of order 2 and
twelve of order 4. Their left-regular actions (Mathlib's `MulAction.toPermHom`, injective), with the
carriers identified with `Fin 16`, embed them in `S₁₆` with the same full cycle-type distribution
`1¹⁶`, `2⁸`, `4⁴` with multiplicities 1, 3 and 12; Mathlib's `cycleType` drops fixed points, so the
identity's raw cycle type is empty and those of orders 2 and 4 are `2⁸` and `4⁴`. By the cycle-type
criterion of Layer 2.1 the two images are almost conjugate, and they are not conjugate because `A`
is abelian and `B` is not. So there are subgroups `H`, `K` of `Equiv.Perm (Fin 16)` of order 16
with `H` and `K` almost conjugate and `¬ ∃ σ, H.map (MulAut.conj σ) = K`. The identification of the
carriers with `Fin 16` is a chosen bijection (`Fintype.equivFinOfCardEq` is noncomputable), so the
statement is not a `decide` computation. No Galois extension or number field is constructed here,
and no claim of minimal degree is made.
*In Tau Ceti:* `TauCeti.natCard_orderOf_zmod_four_prod_eq_quaternionGroup_prod`, `TauCeti.exists_S16_gassmann_pair`.

### Examples

- For `S₄` and the stabilizer `S₃` of a point, `Ind_{S₃}^{S₄} 1` is the permutation representation
  on four points, its character counts fixed points, and it pairs to `1` with the trivial
  character; its pairing with itself is the number `2` of double cosets `S₃ \ S₄ / S₃`.
- For the pair `H`, `K` of Layer 2.2, the permutation representations of `S₁₆` on `S₁₆ ⧸ H` and
  `S₁₆ ⧸ K` are equivalent over `ℚ` (Layer 2.1), and by `Gassmann.restrictEquiv` so are those of
  any subgroup `D` of `S₁₆`.

### Dependencies

Tau Ceti's finite-dimensional induction, characters, character pairing and Frobenius reciprocity
for Layer 2; Tau Ceti's almost-conjugacy, orbit-sum and cycle-type API and Mathlib's
representations for Layers 2.1 and 2.2. Layer 2.2 uses Layer 2.1. Layers 2.1 and 2.2 need neither
Layer 0 nor Layer 1.

## Layer 3: the Mackey decomposition formula

`H` and `K` are subgroups of `G`. The isomorphism form (Layer 3a) is a statement about
representations over a commutative ring and uses the conjugate representation of Layer 1; the
character form (Layer 3b) is over a field and uses Layer 2's finite-dimensional induction.

### Layer 3a: the decomposition as an isomorphism of representations

**The Mackey subgroup and summand.** For `s : G`, the Mackey subgroup `K ⊓ sHs⁻¹` carries two
inclusions: into `K`, along which one induces, and into `sHs⁻¹`, along which the conjugate `{}^s A`
of Layer 1 is restricted. For `A : Rep k H` the Mackey summand at `s` is the representation
`Ind_{K ⊓ sHs⁻¹}^K (Res {}^s A)` of `K`; equivalently, `A` pulled back to `K ⊓ sHs⁻¹` along
`y ↦ s⁻¹ y s` and induced up to `K`. The summands are indexed by `DoubleCoset.Quotient (K : Set G) H`
and built from the chosen representatives `Quotient.out`; no statement is made about a
representative-free summand.
*In Tau Ceti:* `TauCeti.mackeySubgroup`, `TauCeti.mackeyToK`, `TauCeti.mackeyToConjH`, `Rep.mackeySummand`, `Rep.mackeySummand_eq_ind_res_conjRep`.

**The Mackey decomposition.** For a commutative ring `k`, subgroups `H`, `K` of an arbitrary group
`G` and `A : Rep k H`, with `k`, `G` and the carriers in one universe,
`Res_K (Ind_H^G A) ≅ ⨁_{KsH ∈ K\G/H} Ind_{K ⊓ sHs⁻¹}^K (Res {}^s A)` in `Rep k K`, naturally in `A`,
the right side being the direct sum of modules over the double cosets (not a categorical
biproduct). On generators the forward map sends `⟦h s⁻¹ u ⊗ a⟧` to `⟦u ⊗ h⁻¹ a⟧` in the summand of
`KsH`, and the inverse sends `⟦u ⊗ a⟧` in that summand to `⟦s⁻¹ u ⊗ a⟧`. No finiteness is needed
(Mackey 1951; Curtis–Reiner §10–11).
*In Tau Ceti:* `Rep.mackeyDirectSum`, `Rep.mackeyDecomposition`, `Rep.mackeyDecomposition_hom_hom_apply_mk`, `Rep.mackeyDecomposition_inv_hom_apply_lof`, `Rep.mackeyDecompositionNatIso`.

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
`CategoryTheory.Abelian.hasFiniteBiproducts` supplies it. *Route.* The Mackey decomposition above
identifies `Res_K (Ind_H^G A)` with the direct-sum representation `Rep.mackeyDirectSum H K A`, and
its inverse sends the summand at `s` by `⟦u ⊗ a⟧ ↦ ⟦s⁻¹ u ⊗ a⟧`
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

### Layer 3b: the character form

**The character form of the Mackey decomposition.** For a field `k`, `H` of finite index,
`A : FDRep k H` and `x ∈ K`, the character of `Res_K (Ind_H^G A)` at `x` is the sum, over the double
cosets `KsH ∈ K \ G / H`, of the characters at `x` of the finite-dimensional Mackey summands
`Ind_{K ⊓ sHs⁻¹}^K (Res {}^s A)`, each of which is the induced character (Layer 2) of the
restricted conjugate.
*In Tau Ceti:* `TauCeti.character_resFDRep_indFDRep_mackey`, `TauCeti.mackeySummand_eq_indFDRep_res_conjFDRep`.

### Examples

- For `G = S₃`, `H = ⟨(1 2)⟩` and the sign `A` of `H`, the biproduct form gives
  `Res_H Ind_H^G A ≅ sign ⊕ k[H]` over every `k`, while over `ℚ` the induced representation
  `Ind_H^G A ≅ sign ⊕ standard` is reducible.

### Dependencies

Layer 1 (the conjugate representation names the summands); Layer 2 for Layer 3b; Tau Ceti's
Mackey decomposition and Mathlib's biproducts in preadditive categories for §3.1.

## Layer 4: intertwining numbers and the Mackey irreducibility criterion

Throughout, `G` is finite, `H ≤ G`, `k` is a field and `V : FDRep k H`; `hG` and `hSplitG` are the
hypotheses of the Conventions (items 2 and 7).

**Scalar Schur and split group algebras.** For finite `G` and `hG`, the scalar Schur condition
`hSplitG` holds exactly when `k[G]` has a split Wedderburn presentation
`k[G] ≃ₐ[k] ∏ᵢ Matrix (Fin nᵢ) (Fin nᵢ) k`, every `nᵢ` positive. This covers splitting fields that
are not algebraically closed and every characteristic prime to `|G|`; it draws on the
simple-module and block dictionary of
[SemisimpleAlgebras Layers 1–2](../SemisimpleAlgebras/README.md#layer-1-simple-modules-schur-and-isotypic-components).
Algebraic closure supplies `hSplitG`, and `hSplitG` alone does not imply Maschke's theorem.
*In Tau Ceti:* `TauCeti.SplitWedderburnAlgebraPresentation`, `TauCeti.nonempty_splitWedderburnAlgebraPresentation_iff_scalarSchur`.

**Hom spaces into finite biproducts.** In a `k`-linear preadditive category, morphisms into a
finite biproduct are families of morphisms into its summands, `(Y ⟶ ⨁ⱼ Xⱼ) ≃ₗ[k] ∏ⱼ (Y ⟶ Xⱼ)` by
composition with the projections, with inverse `biproduct.lift`; when the Hom spaces are finite
free, `finrank k (Y ⟶ ⨁ⱼ Xⱼ) = ∑ⱼ finrank k (Y ⟶ Xⱼ)`. The same holds in `Rep k K` for morphisms into
a finite direct sum of representations. No algebraic closure and no characteristic hypothesis
enters.
*In Tau Ceti:* `TauCeti.homToBiproductLinearEquiv`, `TauCeti.finrank_homTo_biproduct`, `Rep.homDirectSumLinearEquiv`.

**The Hom-space decomposition.** For finite `G`, subgroups `H`, `K`, a field `k`, `A : FDRep k H`
and `B : FDRep k K`, there is a `k`-linear equivalence, natural in `A` and in `B`, from
`Hom_G(Ind_H^G A, Ind_K^G B)` to the product over the double cosets `D ∈ H \ G / K`, with
representative `s`, of the spaces of intertwiners from `A` restricted to the Mackey subgroup
`H ⊓ sKs⁻¹` to `B` restricted along `y ↦ s⁻¹ y s`. For `K = H` and `A = B = V` this is
`End_G(Ind_H^G V) ≃ₗ[k] ∏_{D ∈ H\G/H} Hom_{J_s}(Res_{J_s} V, W_s)` with `J_s = H ⊓ sHs⁻¹` and
`W_s = Res_{J_s} ({}^s V)`. Its identity component and its behaviour under a change of
representative are §4.1 and §4.2 below.
*In Tau Ceti:* `FDRep.indHomMackeyLinearEquiv`, `FDRep.indHomMackeyLinearEquiv_naturality_left`, `FDRep.indHomMackeyLinearEquiv_naturality_right`, `TauCeti.mackeyToH`.

**The intertwining-number formula.** For finite `G` and every field `k`, in any characteristic,
`dim End_G(Ind_H^G V) = dim End_H(V) + ∑_{HsH ≠ H} dim Hom_{H ⊓ sHs⁻¹}(Res V, {}^s V)` as natural
numbers, the identity double coset being split off. All summands are natural numbers, so
`Ind_H^G V` has a one-dimensional endomorphism algebra exactly when `V` does and every nonidentity
double coset contributes `0`.
*In Tau Ceti:* `TauCeti.finrank_hom_indFDRep_mackey_erase`.

**Mackey disjointness.** `V` is disjoint from its conjugate at `s` when no nonzero intertwiner runs
from the restriction of `V` to `H ⊓ sHs⁻¹` to the restriction of `V` along `y ↦ s⁻¹ y s`.
Disjointness depends only on the double coset: it holds at `h₁ s h₂`, for `h₁, h₂ ∈ H`, exactly when
it holds at `s`. For `H` normal and `V` simple, disjointness at `s` holds exactly when `{}^s V` is
not isomorphic to `V`, over every field.
*In Tau Ceti:* `TauCeti.MackeyDisjoint`, `TauCeti.mackeyDisjoint_iff_subsingleton`, `TauCeti.mackeyDisjoint_mul_left_mul_right_iff`, `TauCeti.mackeyDisjoint_iff_isEmpty_iso_of_normal`.

**Sufficiency over every field.** For finite `G` and `hG`, if `V` is simple and disjoint from its
conjugate at every `s ∉ H`, then `Ind_H^G V` is simple; no splitting hypothesis enters. When every
nonidentity double coset is disjoint, induction is an isomorphism of `k`-algebras
`End_H(V) ≅ End_G(Ind_H^G V)`.
*In Tau Ceti:* `FDRep.simple_indFDRep_of_forall_mackeyDisjoint`, `FDRep.indEndAlgHom`, `FDRep.indEndAlgEquiv`.

**The endomorphism-division characterization.** In a preadditive category with kernels in which
every object is injective, as Mathlib makes `FDRep k G` for finite `G` with `|G|` nonzero in `k`,
an object `X` is simple exactly when `End X` is nontrivial and every nonzero endomorphism of `X`
is a unit. Nontriviality excludes the zero object. Over a field that does not split `G` this, and
not `dim End X = 1`, is the criterion for simplicity.
*In Tau Ceti:* `CategoryTheory.simple_iff_nontrivial_end_and_isUnit`.

**The Mackey irreducibility criterion.** For finite `G`, `hG` and `hSplitG` (a hypothesis on `G`
only; none on `H`), `Ind_H^G V` is simple exactly when `V` is simple and, at the chosen
representative of every double coset `HsH ≠ H`, `V` is disjoint from its conjugate; equivalently
when `V` is simple and disjoint from its conjugate at every `s ∉ H`. For `H` normal the condition
reads: `V` is simple and `{}^s V ≇ V` for every `s ∉ H`. Over an algebraically closed field with
`|G|` nonzero in `k` the criterion holds without stating `hSplitG` (Serre, Part II, §7.4;
Mackey 1951).
*In Tau Ceti:* `FDRep.simple_indFDRep_iff_doubleCoset_of_scalarSchur`, `FDRep.simple_indFDRep_iff_of_scalarSchur`, `FDRep.simple_indFDRep_iff_of_normal_of_scalarSchur`, `TauCeti.simple_indFDRep_iff_doubleCoset`, `TauCeti.simple_indFDRep_iff`.

**Checks.**
- `hSplitG` cannot be dropped from the "only if": §4.4 gives a simple induced representation over
  `ℝ` at which disjointness fails.

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

Layers 0–1, Layer 2's finite-dimensional induction and reciprocity, Layer 3a, Maschke's theorem
and Schur's lemma; not Layer 5. The character form of the criterion also uses Layer 2's characters
and pairing. Mathlib's quaternion group and quaternions for §4.4.

## Layer 5: Clifford theory over a normal subgroup

Throughout, `N` is a normal subgroup of `G` and `k` is a field; `G` is finite in §5.1, and in §5.3
the inertia group has finite index in `G`.

**The action on representations of `N` and the inertia group.** `G` acts on the isomorphism classes
of `FDRep k N` by conjugation (Layer 1). The inertia group of `V : FDRep k N` is the stabilizer of
its class, `{g : G | {}^g V ≅ V}`; it is a subgroup of `G` containing `N`, and isomorphic
representations have the same inertia group.
*In Tau Ceti:* `TauCeti.conjNormalFDRepSkeletonMulAction`, `TauCeti.inertia`, `TauCeti.mem_inertia_iff`, `TauCeti.le_inertia`, `TauCeti.inertia_congr`.

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
  characteristic `p` the pairing is the dimension cast into `k` and can vanish for a constituent;
- restriction to a subgroup `S` preserves semisimplicity, by Maschke's theorem for `S`, whose order
  divides `|G|`.

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
closed field the structural form is Tau Ceti's `FDRep.clifford_restrict_iso`, and, for finite `G`
with `hG`, the character form is `TauCeti.clifford_restrict_character`.
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

Layer 1's conjugation action for the inertia group; §5.2 for §5.3; Tau Ceti's orbit, inertia and
multiplicity results, and its finite-dimensional induction and reciprocity for §5.3. Layer 4's
criterion does not enter the proofs of §§5.2–5.3.

## Layer 6: the virtual-character ring, Artin and Brauer induction

`G` is finite and `k` a field. The induction theorems are over an algebraically closed field of
characteristic zero (`ℂ`, for instance); the description of the virtual-character lattice in §6.1
is over any field of characteristic zero. This layer connects to the
[character-theory roadmap](../CharacterTheory/README.md), whose virtual characters are the lattice
built here.

**The representation ring and the character map.** The representation ring `R(G)` of `FDRep k G`
(classes of finite-dimensional representations, with sum the direct sum, product the tensor
product and unit the trivial representation, split along direct sums) is a commutative ring. The
character map `R(G) → (G → k)` is a ring homomorphism, multiplicative by `FDRep.char_tensor`, whose
image is the virtual-character lattice: the additive subgroup of `G → k` generated by the
characters (an additive subgroup closed under pointwise products, not a raw subring). For finite
`G` and `k` of characteristic zero the character map is injective. Over an algebraically closed
field with `|G|` invertible, the lattice is the `ℤ`-span of the irreducible characters. For finite
`G` with `|G|` nonzero in `k`, `R(G)` is the exact Grothendieck ring of `FDRep k G`, which is the
Grothendieck ring `G₀(k[G])` of finitely generated `k[G]`-modules. Restriction `R(G) → R(H)` is a
ring homomorphism, and induction `R(H) → R(G)` is a homomorphism of `R(G)`-modules,
`Ind (x · Res y) = Ind x · y` (the projection formula of Layer 0, Frobenius reciprocity as a module
identity); on characters, induction is the induced class function of Layer 2.
*In Tau Ceti:* `TauCeti.repRing`, `TauCeti.repRingCharacter`, `TauCeti.virtualCharacters`, `TauCeti.range_repRingCharacter`, `TauCeti.repRingCharacter_injective`, `TauCeti.virtualCharacters_eq_closure_irreducibleCharacters`, `TauCeti.repRingEquivExactK0`, `TauCeti.ExactK0`, `TauCeti.fdRepK0RingEquiv`, `TauCeti.resK0RingHom`, `TauCeti.indK0`, `TauCeti.indK0_mul_resK0`, `TauCeti.repRingRes`, `TauCeti.repRingInd`, `TauCeti.repRingInd_mul_repRingRes`, `Subgroup.indClassFun`.

**Artin's induction theorem.** Over an algebraically closed field of characteristic zero, for every
virtual character `f` of `G` the multiple `|G| • f` lies in the subgroup generated by the
characters induced from (irreducible characters of) cyclic subgroups `C ≤ G`; and the induction map
`⊕_{C cyclic} R(C) → R(G)` becomes surjective after tensoring with `ℚ`. So every character is a
`ℚ`-linear combination of characters induced from cyclic subgroups. A statement about the index of
the integral image is not part of the theorem (Serre, Part II, Ch. 9).
*In Tau Ceti:* `TauCeti.ClassFunction.indVirtualCharacterAddHom`, `TauCeti.ClassFunction.indVirtualCharacters`, `TauCeti.ClassFunction.indVirtualCharacters_eq_closure_indFDRepCharacter`, `TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`, `TauCeti.ClassFunction.natCard_nsmul_mem_indCharacterSpanInt_isCyclic`, `TauCeti.ClassFunction.indVirtualCharacterDirectSumBaseChangeRat_isCyclic_surjective`.

**Artin's corollary for rational representations.** Two finite-dimensional representations `V`, `W`
of `G` over `ℚ` are isomorphic exactly when `dim V^C = dim W^C` for every cyclic subgroup `C ≤ G`:
the dimensions of the fixed spaces on cyclic subgroups are a complete invariant (the converse
direction is immediate), equivalently the sums of the character over the cyclic subgroups, the sum
over `C` being `|C| · dim V^C`.
*In Tau Ceti:* `FDRep.nonempty_iso_of_finrank_invariants_eq_cyclic`, `FDRep.nonempty_iso_of_subgroupCharacterSum_eq_cyclic`.

**Elementary and hyperelementary groups.** For a prime `p`, a group `E` is `p`-elementary when it is
the internal direct product `C × P` of a cyclic subgroup `C` of order prime to `p` and a
`p`-subgroup `P` (they commute elementwise and are complements), and `p`-hyperelementary when it has
a cyclic normal subgroup `C` of order prime to `p` with `E / C` a `p`-group. Elementary means
`p`-elementary for some prime `p`, and likewise hyperelementary; a subgroup is elementary when its
underlying group is. Every `p`-elementary group is `p`-hyperelementary. Mathlib has `IsCyclic` and
`IsPGroup` and no such predicate.
*In Tau Ceti:* `TauCeti.IsPElementary`, `TauCeti.IsPHyperelementary`, `TauCeti.IsElementary`, `TauCeti.IsHyperelementary`, `TauCeti.IsPElementary.isPHyperelementary`.

**Checks.**
- `S₃` is 2-hyperelementary (`C₃ ◁ S₃` with quotient `C₂`) but not elementary: a `p`-elementary
  group is a direct product of commuting factors, and the only factorizations of order 6 as
  (cyclic of order prime to `p`) × (`p`-group) are abelian. A definition with a semidirect instead
  of a direct product would make every hyperelementary group elementary.

**Brauer's induction theorem.** Over an algebraically closed field of characteristic zero, every
virtual character of `G` is a `ℤ`-linear combination of virtual characters induced from elementary
subgroups, and every character is a `ℤ`-linear combination of characters induced from irreducible
characters of elementary subgroups: the induction map `⊕_{E elementary} R(E) → R(G)` is surjective
(Serre, Part II, Ch. 10).
*In Tau Ceti:* `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`, `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary`.

**Brauer's characterization of characters.** Over an algebraically closed field of characteristic
zero, a class function `f` on `G` is a virtual character exactly when its restriction to every
elementary subgroup `E ≤ G` is a virtual character of `E` (Serre, Part II, §11.1).
*In Tau Ceti:* `TauCeti.mem_virtualCharacters_iff_forall_comp_subtype_isElementary`.

**Checks.**
- The class-function hypothesis cannot be dropped: on `S₃`, whose elementary subgroups are all
  cyclic, the function with value `2` at one transposition and `0` elsewhere restricts on its
  `⟨t⟩ ≅ C₂` to `(0, 2) = 1 − sign` and to `0` on every other elementary subgroup, yet it is not
  constant on conjugacy classes.

**The cyclotomic splitting field.** Let `e` be the exponent of `G`. For a field `K` of
characteristic zero with `K/ℚ` the cyclotomic extension by the `e`-th roots of unity, and an
algebraically closed field `L` containing `K`, every simple representation of `G` over `L` is the
scalar extension of a simple representation over `K` with scalar endomorphisms; in particular every
irreducible complex representation is defined over `ℚ(ζ) ⊆ ℂ`, `ζ` a primitive `e`-th root of
unity. This does not follow from the character identities of Brauer's theorem alone: it needs the
field-of-definition form of the induction theorem (Serre, Part II, §12.3). This is the fact the
[character-theory roadmap](../CharacterTheory/README.md) cites at its Layer 4.
*In Tau Ceti:* `FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension`, `FDRep.exists_simple_nonempty_iso_baseChange_adjoin_of_isPrimitiveRoot`.

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

Layer 2's induced-character formula, to define induction on `R(G)`, and Layer 0's projection
formula, for the `R(G)`-module structure; Tau Ceti's virtual-character lattice, representation
ring and linear independence of characters; Mathlib's Maschke theorem. The cyclotomic splitting
field rests on character fields and Schur indices, not on Brauer induction alone.

## Layer 7: projective representations, factor sets, and the Schur multiplier

§7.1 is a theorem about abstract groups and is independent of the rest of the layer. §§7.2–7.4 are
about finite projective representations and factor sets: a normalized choice of invertible
representatives of a projective action gives its `kˣ`-valued factor set over any field, and the
representation-theoretic statements keep their stated field hypotheses. §7.5 is the sublayer
Layer7.ScalarObstruction: for a simple representation with scalar endomorphisms, the obstruction to
extending it is a class in `H²`. §§7.6–7.8 are the sublayer Layer7.DivisionCrossedSystem: over an
arbitrary field the endomorphism division algebra and its outer action replace that class.

<a id="abstract-universal-central-extensions"></a>

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

**Projective representations and factor sets.** For a commutative ring `k` and a group `G`, a
projective representation of `G` on `V` with factor set `α : G → G → kˣ` is a normalized family
`ρ : G → (V ≃ₗ[k] V)`, `ρ(1) = 1`, with `ρ(g) ∘ ρ(h) = α(g, h) · ρ(gh)`, together with the
normalization `α(1, g) = α(g, 1) = 1` and the multiplicative cocycle identity of `α`. This is data
on every module, including `V = 0`, where the operators do not determine `α`; when `kˣ` acts
faithfully on `V` (for instance `V ≠ 0` over a field), a normalized lift that is multiplicative up
to `α` determines `α`, and the normalization and cocycle identity follow from associativity. A
normalized factor set is a multiplicative 2-cocycle `groupCohomology.IsMulCocycle₂` for the
trivial action of `G` on `kˣ`, equivalently `Additive.ofMul ∘ α` lies in
`groupCohomology.cocycles₂ (Rep.trivial ℤ G (Additive kˣ))` (Mathlib's
`groupCohomology.cocyclesOfIsMulCocycle₂`). A projective representation on a module with a finite
basis `b` indexed by `ι` gives a homomorphism `G →* PGL(ι, k)` (Mathlib's `Matrix.ProjGenLinGroup`)
once the basis is chosen, and every homomorphism `G →* PGL(ι, k)` arises from a projective
representation in this way (Isaacs, Ch. 11).
*In Tau Ceti:* `TauCeti.IsProjectiveRep`, `TauCeti.IsFactorSet`, `TauCeti.IsProjectiveRep.of_map_one_mul_apply`, `TauCeti.FactorSet.isMulCocycle₂`, `TauCeti.IsProjectiveRep.toPGL`, `MonoidHom.exists_isProjectiveRep_toPGL_eq`.

**Factor-set classes and the Schur multiplier.** The Schur multiplier `H²(G, kˣ)` is the second
cohomology of `Additive kˣ` with the trivial action, and it classifies factor sets up to
cohomology: the class map is a bijection from factor sets modulo the cohomologous relation onto
`H²`. The class of a projective representation is the class of its factor set; rescaling the lift
by a normalized `c : G → kˣ` changes the factor set by the coboundary of `c` and does not move the
class. When `kˣ` acts faithfully on `V`, two lifts of the same projective action, `ρ' = c · ρ`, have
the same class, and the class vanishes exactly when `ρ` is a homomorphism `G →* (V ≃ₗ[k] V)`
rescaled by scalars; the implication from vanishing to linearization needs no faithfulness.
`H²(G, kˣ)` classifies factor-set classes, not projective representations: a fixed class carries
many non-isomorphic projective representations. The integral Schur multiplier `H₂(G, ℤ)` is a
different object (Scope and ownership).
*In Tau Ceti:* `TauCeti.schurMultiplier`, `TauCeti.FactorSet.cohomologyClass`, `TauCeti.FactorSet.cohomologyClassEquiv`, `TauCeti.IsProjectiveRep.cohomologyClass`, `TauCeti.IsProjectiveRep.cohomologyClass_rescale`, `TauCeti.IsProjectiveRep.cohomologyClass_eq_of_eq_smul`, `TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff`, `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero`.

**The class of a homomorphism to the projective linear group.** Over a field `k` and for a group
`G`, a function `α : G × G → kˣ` satisfying the multiplicative cocycle identity
`α(gh, j) α(g, h) = α(h, j) α(g, hj)` is, written additively, a 2-cocycle of the trivial module
`Additive kˣ`: this is Mathlib's `groupCohomology.cocyclesOfIsMulCocycle₂` for the trivial action
`TauCeti.trivialMulDistribMulAction`, and normalization is not used. For `V` free with a finite
basis `b`, nonzero, prove the converse of Tau Ceti's `TauCeti.IsProjectiveRep.toPGL`: two
projective representations `ρ`, `ρ'` of `G` on `V` with the same image `G →* PGL(ι, k)` differ by a
normalized scalar function, `ρ' g = c g • ρ g` with `c 1 = 1`; consequently, by
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

**The twisted group algebra.** For a normalized factor set `α` (the cocycle identity and
`α(1, g) = α(g, 1) = 1`), the twisted group algebra `k_α[G]` is a `k`-algebra with a basis
`(e_g)_{g ∈ G}` and multiplication `e_g e_h = α(g, h) e_{gh}`, twisting `MonoidAlgebra k G`; its
associativity and unit need the normalized cocycle and fail for an arbitrary `α`. Projective
representations of `G` on `V` with factor set `α` are exactly the `k`-algebra homomorphisms
`k_α[G] → End_k(V)`, that is the `k_α[G]`-module structures on `V`, and cohomologous factor sets
give isomorphic twisted algebras, so `k_α[G]` up to isomorphism depends only on the class of `α`.
This is the module-theoretic home of projective representations, as `k[G]` is of ordinary ones.
*In Tau Ceti:* `TauCeti.twistedMonoidAlgebra`, `TauCeti.TwistedMonoidAlgebra.basis`, `TauCeti.TwistedMonoidAlgebra.of_mul_of`, `TauCeti.isProjectiveRepEquivAlgHom`, `TauCeti.TwistedMonoidAlgebra.nonempty_algEquiv_of_cohomologyClass_eq`.

**Coordinates.** Tau Ceti realizes `k_α[G]` as an algebra of operators on `G →₀ k`. Define on
`G →₀ k` the twisted product, `e_g · e_h = α(g, h) e_{gh}` extended bilinearly, with its value on
basis vectors (no cocycle condition used), and the coordinate identification of `G →₀ k` with
`k_α[G]` through the basis `TauCeti.TwistedMonoidAlgebra.basis`. Prove that the coordinate
identification carries the twisted product to the product of `k_α[G]`.
*Needs:* Tau Ceti `TauCeti.twistedMonoidAlgebra`, `TauCeti.TwistedMonoidAlgebra.basis`,
`TauCeti.TwistedMonoidAlgebra.of_mul_of`, `TauCeti.IsFactorSet`; Mathlib `Finsupp`.

**Checks.**
- For the class of §7.2 on `C₂ × C₂`, `e_a e_b = e_{ab}` and `e_b e_a = −e_{ab}`, with `e_a² = e_b² = 1`:
  the twisted algebra over `ℂ` is `M₂(ℂ)`, whereas the untwisted group algebra is commutative.

### 7.4 The central extension of a normalized factor set, and representation groups

**The central extension of a factor set.** For a normalized factor set `α : G × G → kˣ` for the
trivial action, the set `E_α = kˣ × G` with `(a, g)(b, h) = (a b α(g, h), g h)` is a group; the
construction takes the cocycle identity and the normalization as data, without which the
multiplication is neither associative nor unital. The scalar inclusion `kˣ → E_α` and the
projection `E_α → G` make `1 → kˣ → E_α → G → 1` a group extension (Mathlib's `GroupExtension`),
the image of the inclusion being the kernel of the projection, and the kernel is central. Two
extensions of `G` by an abelian group inducing the same action are equivalent exactly when the
factor sets of normalized sections have the same class, so `H²(G, kˣ)` classifies the central
extensions of `G` by `kˣ` up to equivalence.
*In Tau Ceti:* `TauCeti.FactorSet.Extension`, `TauCeti.FactorSet.Extension.equivProd`, `TauCeti.FactorSet.groupExtension`, `TauCeti.FactorSet.range_inl_eq_ker_rightHom`, `TauCeti.FactorSet.inl_range_le_center`, `TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq`.

**Representation groups.** A representation group (Schur cover) of a finite group `G` is a central
extension `Ĝ → G` with kernel inside `[Ĝ, Ĝ]` through which every projective representation of `G`
over an algebraically closed field lifts to a linear one. Every finite `G` has a finite one: for
`k` algebraically closed there is a finite group `E` with a surjection `p : E → G` whose kernel lies
in the centre and in `[E, E]`, such that every homomorphism `G →* PGL(ι, k)`, `ι` finite, lifts
along `p` to a homomorphism `E →* GL(ι, k)` (for complex representations, Isaacs, Ch. 11).
*In Tau Ceti:* `TauCeti.exists_finite_stem_extension_lifting_pgl`.

The lifting holds for projective representations on arbitrary `k`-modules as well: for `G` finite
and `k` algebraically closed there is a finite stem extension `p : E → G` such that for every
`TauCeti.IsProjectiveRep ρ α` on any `V` there are a homomorphism `π : E →* (V ≃ₗ[k] V)` and
`c : E → kˣ` with `π x = c x • ρ (p x)`. This is an API fact of the section, not a target: it is
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
  define one class `cliffordObstruction V hScalar ∈ H²(Q, kˣ)`, the class of a chosen one;
- `cliffordObstruction_eq_zero_iff`: the class vanishes exactly when an ordinary representation of
  `T` on the same space `V` restricts to the given action of `N`.

Two statements follow from these and are proved in `Suggested.lean`: every compatible projective
extension has the class `cliffordObstruction V hScalar`
(`scalarProjectiveInertiaExtension_class_eq_obstruction`, from the uniqueness statement), and over
an algebraically closed field the class is Tau Ceti's `TauCeti.cliffordObstruction`
(`cliffordObstruction_eq_native`, from Tau Ceti's
`TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction` applied to
the chosen extension).

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
multiplication the composition `(a b)(v) = a(b(v))`. `D` is not assumed to be `k`. Put
`T = TauCeti.inertia V`, `Q = T ⧸ N`, and write `r(n)` for the action of `n ∈ N` on `V`.

**The Clifford extension.** The pairs `(t, U)` in `T × GL_k(V)` with `U` implementing `t` on `N`,
`U r(n) U⁻¹ = r(t n t⁻¹)`, modulo the normal subgroup of the pairs `(n, r(n))`, `n ∈ N`, form a group
extension `1 → Dˣ → C → Q → 1` (Mathlib's `GroupExtension`), whose kernel need not be central; no
scalar-Schur hypothesis is used. A normalized section of it gives a crossed system of `Q` on `D`,
and `Q` acts on `D` modulo inner automorphisms through a homomorphism `Q →* Out_k(D)`, where
`Out_k(D) = Aut_k(D)/Inn(Dˣ)`. The given action of `N` extends to an ordinary representation of `T`
on the same space `V` exactly when the extension splits; the isomorphism classes of such extensions
correspond to the classes of splittings under conjugation by the kernel, and, once a reference
splitting is chosen, to the nonabelian `H¹(Q, Dˣ)` for the induced action.
*In Tau Ceti:* `TauCeti.CliffordExtension.groupExtension`, `FDRep.cliffordCrossedSystem`, `TauCeti.OuterAlgAut`, `FDRep.cliffordOuterAction`, `TauCeti.CliffordExtension.nonempty_splitting_iff`, `FDRep.cliffordExtensionConjClassesEquiv`, `FDRep.cliffordExtensionNonabelianH1Equiv`.

**The operator presentation.** Prove (Curtis–Reiner §11; for complex representations, where
`D = ℂ`, Isaacs, Ch. 11):

- *the algebra `D`*: `D` is a finite-dimensional `k`-algebra, `k` mapping into its centre, and its
  units are the invertible intertwiners (Mathlib's `CategoryTheory.Aut.unitsEndEquivAut`);
- *the operator presentation*: for a normalized section `s : Q → T` and normalized invertible
  operators `U_q` with `U_q r(n) U_q⁻¹ = r(s(q) n s(q)⁻¹)`, put
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

**The multiplicity module.** For the data of §7.6, the crossed product of a normalized crossed
system `(D, σ, a)` of `Q` is a `k`-algebra with finite-support coordinates indexed by `Q`,
`(d[q])(e[r]) = d σ_q(e) a(q, r) [qr]`, and a normalized gauge between two crossed systems, or a
change of Clifford section, induces an isomorphism of their crossed-product algebras. The
multiplicity space of `W : FDRep k T` is `M = Hom_N(V, W)`, a right `D`-module by `f · d = f ∘ d`,
with the semilinear operators `A_q(f) = W(s(q)) f U_q⁻¹`, so that `A_q(f d) = A_q(f) σ_q(d)` and
`A_q A_r(f) = A_{qr}(f) a(q, r)⁻¹`. As a left module, `M` is a module over the crossed product on
`Dᵐᵒᵖ` with action `σ_qᵐᵒᵖ` and factor `op(a(q, r)⁻¹)`, and these modules and their maps form the
multiplicity functor from `FDRep k T`. On the representations of `T` whose restriction to `N` is
semisimple and `V`-isotypic, the multiplicity functor is fully faithful, and `W` is reconstructed
equivariantly from its multiplicities by the evaluation `M ⊗_D V → W`, balanced over `D`.
*In Tau Ceti:* `TauCeti.CrossedSystem.Algebra`, `TauCeti.CrossedSystem.Algebra.gaugeEquiv`, `FDRep.cliffordCrossedProductEquiv`, `TauCeti.CrossedSystem.opInv`, `FDRep.cliffordMultiplicityFunctor`, `FDRep.cliffordMultiplicityFunctor_map_bijective`, `FDRep.cliffordMultiplicityHomEquiv`, `FDRep.cliffordBalancedEvaluationEquiv`.

**The isotypic category.** Prove:

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

§7.1 is independent of the rest of the layer. §7.2–§7.4 use Mathlib's degree-2 group cohomology
and Tau Ceti's projective representations and factor sets, and are independent of Layers 3–4.
§7.5 uses Layer 5's inertia groups and Tau Ceti's compatible projective extensions; §7.6–§7.8 use
Tau Ceti's Clifford extension and crossed products, and §7.7 uses §7.5 for the scalar case. The
isotypic-category equivalence of §7.7 is not an input of the Clifford correspondence of §5.3.

## Worked examples

- **Permutation characters and fixed points.** For `G = S₄` and `H = S₃` the stabilizer of a point,
  `Ind_H^G 1` is the natural permutation representation on four points, and its character at `g`
  is the number of fixed points of `g`. Over a field in which `24` is invertible,
  `⟨Ind_H^G 1, Ind_H^G 1⟩ = #(H \ G / H) = 2`, the two double cosets being the diagonal and the
  off-diagonal `H`-orbits on the four points (equivalently the two orbits of `S₄` on ordered pairs
  of points), and `Ind_H^G 1` is the direct sum of the trivial line and the three-dimensional
  augmentation subrepresentation. This exercises Layer 2 and the double-coset count, and feeds the
  [character-theory roadmap](../CharacterTheory/README.md).
  *In Tau Ceti:* `TauCeti.char_ind_trivial`, `TauCeti.characterPairing_ind_trivial_stabilizer`, `TauCeti.isCompl_invariantLine_augmentationSubrepresentation`.
- **Induced characters from Young subgroups.** For `Sₙ` and a Young subgroup
  `S_λ = S_{λ₁} × ⋯ × S_{λᵣ}`, the induced representation `Ind_{S_λ}^{Sₙ}(1)` is the permutation
  module on `λ`-tabloids, and its character at `σ` is the number of `λ`-tabloids fixed by `σ`, as
  the induced-character formula computes. Do `n = 3, 4` explicitly; the resulting characters, paired
  through Frobenius reciprocity with the irreducible characters, are the multiplicities that
  CharacterTheory's tables record. For `n = 4`, on the identity, the transpositions, the double
  transpositions, the 3-cycles and the 4-cycles, the shape `(2, 2)` gives `(6, 2, 2, 0, 0)`, the sum
  of the trivial, the two-dimensional and the standard characters, and the shape `(2, 1, 1)` gives
  `(12, 2, 0, 0, 0)`, the sum of the trivial, the two-dimensional, twice the standard and the
  sign-twisted standard characters.
  *In Tau Ceti:* `TauCeti.permutationModuleIsoIndTrivial`, `TauCeti.char_permutationModule`, `Nat.Partition.character_indFDRep_trivial_parts_two_two`, `Nat.Partition.character_indFDRep_trivial_parts_two_one_one`, `Nat.Partition.character_indFDRep_trivial_parts_two_two_eq_sum`, `Nat.Partition.character_indFDRep_trivial_parts_two_one_one_eq_sum`, `FDRep.finrank_hom_indFDRep_trivial_parts_two_two`, `FDRep.finrank_hom_indFDRep_trivial_parts_two_one_one`.
- **Mackey on a small group.** For `G = S₃` and `H = ⟨(1 2)⟩ ≅ C₂`, compute `H \ G / H` (two double
  cosets), apply the Mackey decomposition to `Res_H Ind_H^G(sign_H)`, and check the character
  identity of Layer 3b term by term. Inducing the sign character of `H` gives the
  three-dimensional representation `Ind_{C₂}^{S₃}(sign) ≅ sgn ⊕ standard` over `ℂ`, which the
  Mackey criterion correctly reports as reducible; inducing a nontrivial linear character of
  `A₃ = ⟨(1 2 3)⟩` gives the two-dimensional simple representation, and the criterion certifies its
  simplicity.
  *In Tau Ceti:* `TauCeti.not_simple_indFDRep_stabilizer_perm_fin_three`, `TauCeti.simple_indFDRep_ofLinearCharacter_alternatingGroup_fin_three`.
- **The `D₄` dihedral induction.** Induction from the cyclic subgroup `⟨r⟩` of order `4` in
  `D₄ = DihedralGroup 4`, applied to a faithful linear character of `⟨r⟩` (one sending `r` to a
  primitive fourth root of unity), over an algebraically closed field of characteristic zero,
  produces the two-dimensional simple representation of `D₄`; the Mackey criterion certifies its
  simplicity. This is the same group as in the character-theory roadmap.
  *In Tau Ceti:* `TauCeti.simple_indFDRep_ofLinearCharacter_dihedralGroupFourRotationChar`.
- **Clifford on `A₄ ◁ S₄`.** With `N = A₄` normal in `G = S₄`, the linear characters of `A₄` come from
  `A₄ / V₄ ≅ C₃`: the trivial character and two nontrivial ones with values in the cube roots of
  unity. The two nontrivial linear characters form a single `S₄`-orbit and have inertia group
  `A₄`, while the trivial character and the three-dimensional simple representation of `A₄` are
  each `S₄`-stable. Clifford's theorem predicts, and the inertia computation confirms, how the
  simple representations of `S₄` restrict to `A₄`, and the Clifford correspondence recovers the
  simple representations of `S₄` lying over each constituent: over a nontrivial linear character it
  is the two-dimensional one, induced from it.
  *In Tau Ceti:* `TauCeti.inertia_ofLinearCharacter_alternatingGroup`, `FDRep.liesOver_alternatingGroup_iff_nonempty_iso_indFDRep`.

## Downstream consumers

- CharacterTheory builds character tables from induced and permutation characters, Frobenius
  reciprocity and the Mackey criterion (its supplier table cites Layers 2–4).
- FiniteGroupInvariants uses almost-conjugacy and the pair in `S₁₆` (Layers 2.1–2.2), Clifford
  theory (Layer 5) and representation groups (Layer 7).
- PolynomialGaloisGroupsPartIII consumes the almost-conjugacy results of Layers 2.1–2.2 in their
  Tau Ceti form.
- InverseGaloisAndArithmeticFundamentalGroups (IG.3.4) and InductionRestrictionPartII build on the
  representation groups of Layer 7.
- StableHomotopyKTheory uses the universal central extensions of §7.1.
- OddOrderTheorem uses Layers 2 and 5; ClassicalArithmeticCompletion, KTheoryFiniteLocalFields and
  EndoscopicTransferAndUnitaryTraceComparison cite Layer 6 (virtual characters and Brauer
  induction).

## Scope and ownership

**This roadmap owns** Layers 0–7 above, with every statement in them: the functorial core
(Layer 0), the conjugate representation (Layer 1), finite-dimensional induction, induced and
permutation characters and Frobenius reciprocity (Layer 2), almost-conjugacy and its criteria and
adapters (Layer 2.1), the pair in `S₁₆` (Layer 2.2), Mackey's formula (Layers 3a and 3b), the
Hom-space decomposition, intertwining numbers and Mackey's criterion (Layer 4), Clifford theory
(Layer 5), the virtual-character ring and the theorems of Artin and Brauer (Layer 6), and universal
central extensions, projective representations, Schur multipliers, the scalar Clifford obstruction
and division crossed systems (Layer 7), together with the worked examples. Where the pinned Tau
Ceti has a statement, the statement names the declarations that realise it; the targets are the
generator formulas of induction in stages (§0.1); the restriction and quotient-invariant adapters
(§2.1.1); Mackey's formula as a finite biproduct (§3.1); the identity component of the Hom-space
decomposition, the change of double-coset representative, the conjugate-representation form of
disjointness and the real `Q₈` example (§§4.1–4.4); the isotypic decomposition in `FDRep`,
Clifford's theorem over every field and the Clifford correspondence over every field (§§5.1–5.3);
the virtual-character lattice over a field of characteristic zero (§6.1); abstract universal
central extensions (§7.1); the class of a homomorphism to `PGL` and coordinates on the twisted group
algebra (§§7.2–7.3); the scalar Clifford obstruction over an arbitrary field (§7.5); and the
operator presentation and equivalence of division crossed systems, the isotypic-category
equivalence and its restriction–induction comparisons (§§7.6–7.8).

FiniteGroupInvariants cites Layers 2.1 and 2.2 by the names
Gassmann.almostConjugate_iff_permutation_equiv and Gassmann.exists_S16_gassmann_pair, and
PseudodifferentialOperators cites Layer 2.1 by the first; these statements are Tau Ceti's
`TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` and `TauCeti.exists_S16_gassmann_pair`,
named in Layers 2.1 and 2.2 above.

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

The declarations that realise this roadmap's own statements are named in the layers above, each on
the `*In Tau Ceti:*` line of its statement, with the hypotheses stated there. The targets also
consume the following.

- *Layer 0* (`RepresentationTheory/Induction/Transitivity.lean`, over a commutative ring, universe
  `max u v`): `TauCeti.Rep.indFunctorCompIso_hom_app_hom_apply_mk_mk`
  (`⟦κ ⊗ ⟦h ⊗ a⟧⟧ ↦ ⟦ψ h κ ⊗ a⟧`), `TauCeti.Rep.indFunctorCompIso_inv_app_hom_apply_mk`
  (`⟦κ ⊗ a⟧ ↦ ⟦κ ⊗ ⟦1 ⊗ a⟧⟧`), `TauCeti.Rep.indFunctorMulEquivIso`.
- *Layer 2*: `Representation.Equiv.invariantsLinearEquiv` (`RepresentationTheory/Invariants.lean`,
  over a commutative ring); `TauCeti.ClassFunction.characterPairing`, `TauCeti.ClassFunction.ofCharacter`
  and `TauCeti.ClassFunction.ofFDRep` (`RepresentationTheory/CharacterTable/Pairing.lean`; the
  pairing formula `TauCeti.ClassFunction.characterPairing_ofFDRep_eq_finrank` assumes
  `[Invertible (Nat.card G : k)]`).
- *Layer 3* (`RepresentationTheory/Induction/Mackey/Decomposition.lean`; `k`, `G` and the carriers
  in one universe, `G` arbitrary): `Rep.mackeyInclusion` (`⟦u ⊗ a⟧ ↦ ⟦s⁻¹ u ⊗ a⟧`).
- *Layer 4* (`RepresentationTheory/Induction/Mackey/`): `FDRep.indEndAlgHom_injective`,
  `TauCeti.finrank_hom_res_mackeyToH_mul_left_mul_right`.
- *Layer 5* (`RepresentationTheory/Induction/Clifford/`, `RepresentationTheory/Induction/LiesOver.lean`):
  `FDRep.cliffordSum` and `FDRep.finrank_cliffordSum`; `FDRep.LiesOver`;
  `TauCeti.Representation.exists_isAtom_forall_nonempty_linearEquiv_conjSubrep`,
  `Representation.isotypicComponentsEquivQuotientInertia`,
  `Representation.exists_forall_finrank_linearMap_eq` and
  `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` (every field);
  `Subgroup.resFDRep`; `FDRep.clifford_restrict_iso` (algebraically closed),
  `TauCeti.clifford_restrict_character` (finite `G`, algebraically closed, `hG`) and
  `FDRep.cliffordCorrespondence` (finite `G`, algebraically closed, characteristic zero);
  `FDRep.liesOver_indFDRep_of_inertia` (every field, inertia group of finite index) and
  `FDRep.nonempty_iso_of_liesOver_inertia_of_nonempty_iso_indFDRep` (finite `G`, characteristic
  zero, `V` simple); `IsSemisimpleModule.linearEquivIsotypicComponents`,
  `IsSemisimpleModule.exists_linearEquiv_pi_quotient`,
  `LinearEquiv.finrank_linearMap_eq_natCard_mul_finrank_end` and
  `TauCeti.finrank_linearMap_pos_iff_exists_nonempty_linearEquiv` (every field)
  (`RingTheory/SimpleModule/Isotypic.lean`, `RingTheory/Semisimple/Multiplicity.lean`).
- *Layer 6* (`RepresentationTheory/CharacterTable/`, `RepresentationTheory/RepresentationRing/`):
  `TauCeti.irreducibleCharacters`, `TauCeti.irreducibleCharacters_subset_range` and
  `TauCeti.ClassFunction.linearIndependent_character_fdRep` (algebraically closed, invertible
  `|G|`).
- *Layer 7*: `TauCeti.trivialMulDistribMulAction`; `TauCeti.FactorSet`,
  `TauCeti.FactorSet.cohomologyClass_eq_iff`;
  `TauCeti.exists_finite_stem_factorSet_bijective_characterTransgression` and
  `TauCeti.IsProjectiveRep.exists_linearization_of_characterTransgression_surjective`;
  `TauCeti.IsProjectiveInertiaExtension`, `TauCeti.IsProjectiveInertiaExtension.homAction`,
  `TauCeti.IsProjectiveInertiaExtension.isProjectiveRep_homAction`,
  `TauCeti.IsProjectiveInertiaExtension.tensorRep` and
  `TauCeti.IsProjectiveInertiaExtension.evalTensor` (every commutative ring, `k`, `G` and the
  carriers in arbitrary universes);
  `TauCeti.IsProjectiveInertiaExtension.evalTensor_surjective` (every field, `W` irreducible with a
  nonzero `N`-map from `V`); `TauCeti.IsProjectiveInertiaExtension.evalTensor_injective`
  (algebraically closed, `V` simple) and `TauCeti.IsProjectiveInertiaExtension.tensorRepEquiv`
  (algebraically closed, `V` simple, `W` irreducible with a nonzero `N`-map from `V`);
  `TauCeti.exists_isProjectiveInertiaExtension`, `TauCeti.cliffordObstruction` and
  `TauCeti.cliffordObstruction_eq_zero_iff` (algebraically closed, `V` simple);
  `TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction`
  (algebraically closed, `V` simple, `k` and `G` in `Type`);
  `TauCeti.CrossedSystem`, `TauCeti.CrossedSystem.comap`, `TauCeti.CrossedSystem.Algebra.comapHom`,
  `TauCeti.CrossedSystem.Algebra.moduleFinite_rightSubgroup`,
  `TauCeti.CliffordExtension.commutantAction`, `FDRep.commutantAction_gauge`,
  `FDRep.factorSetFun_clifford_gauge` (every field, no simplicity or finiteness unless stated).

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
