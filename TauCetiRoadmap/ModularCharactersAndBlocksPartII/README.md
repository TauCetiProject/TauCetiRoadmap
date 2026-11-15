# Roadmap: modular characters and blocks, Part II — the Glauberman correspondence and heights of characters

**Summary.** This roadmap continues ModularCharactersAndBlocks, which builds `p`-modular systems,
Brauer characters, blocks, defect groups, Brauer's three main theorems and the behaviour of blocks
under normal `p`- and `p'`-subgroups, and stops before the arithmetic of character degrees inside
a block and before any character correspondence attached to a group action. Part II develops two
strands on that base. The first is the character theory of coprime actions: for finite groups `S`
and `Γ` of coprime orders with `S` acting on `Γ` by automorphisms, the action of `S` on `Irr(Γ)`,
Gallagher's normalised extension of an invariant representation to `Γ ⋊ S`, the canonical
extension and Gallagher's correspondence, Brauer's permutation lemma, the cyclic, `p`-group and
solvable cases of Glauberman's construction, the uniqueness of the resulting family of bijections
and its compatibility with normal subgroups of `S`, and the degree relations, ending in the
**Glauberman correspondence** `θ ↦ θ*` between `Irr_S(Γ)` and `Irr(C_Γ(S))` and the divisibility
`θ(1) ∣ |Γ : C_Γ(S)| θ*(1)`. The second strand is the theory of heights: the central characters of
blocks and Osima's formula, **Brauer's theorem on heights**, heights and height zero characters,
the Min–Max theorem, block covering through central characters, domination modulo an arbitrary
normal subgroup, the **Fong–Reynolds correspondence** with its preservation of heights, Fong's
theorem, the extended first main theorem, the structure of blocks of `P C_G(P)` with defect group
`P`, and **Reynolds' theorem**: a block with a normal defect group `D` has all its characters of
height zero exactly when `D` is abelian. Brauer's height zero conjecture and the Alperin–McKay
conjecture are stated as predicates on blocks, with their proved instances. The block strand is
stated for every splitting `p`-modular system of `G`.

The end theorems are the canonical extension (`existsUnique_canonicalExtension`) and its values
(`canonicalExtension_values`), Gallagher's correspondence (`gallagher_bijOn`), the `p`-group
characterisation of the correspondent (`existsUnique_restrict_pairing_not_dvd`), the count of
invariant characters (`ncard_invariantIrreducibleCharacters`), the existence and uniqueness of the
Glauberman family (`exists_isGlaubermanFamily`, `IsGlaubermanFamily.apply_eq`) with its sign
formula for a cyclic acting group (`IsGlaubermanFamily.exists_sign_of_isCyclic`) and its
constituent, field-of-values and degree laws (`IsGlaubermanFamily.restrict_pairing_ne_zero`,
`IsGlaubermanFamily.adjoin_range_eq`, `IsGlaubermanFamily.index_mul_degree_eq`), Brauer's theorem
on heights (`brauer_height`), the Fong–Reynolds correspondence (`fongReynolds`,
`existsUnique_fongReynolds`), Reynolds' height formula (`reynolds_heights`) and Reynolds' theorem
(`reynolds`).

Suggested homes: `TauCeti/RepresentationTheory/CharacterTable/Glauberman/` and
`TauCeti/RepresentationTheory/Block/Height.lean`, beside the base's
`TauCeti/RepresentationTheory/Block/`.

## Scope and ownership

ModularCharactersAndBlocks (the base) owns its Layers 0–8 and is consumed by section below. This
Part II starts where the base stops and owns:

- the action of a group acting by automorphisms on the irreducible characters of a finite group,
  the invariant characters, the fixed-class lemma for coprime actions, and Brauer's permutation
  lemma for automorphisms (Layer 1);
- Gallagher's determinant-normalised extension theorem, the canonical extension of an invariant
  character to `Γ ⋊ S` with its field of values and integral values on `S`, and Gallagher's
  correspondence in character form for any normal subgroup and any extendible irreducible
  character (Layer 2);
- the cyclic case of the Glauberman correspondence with its sign, and Glauberman's restriction
  formulas (Layer 3);
- the composition-series construction for solvable `S`, the `p`-group characterisation, the
  independence of the series, equivariance, bijectivity, the counting theorem, the uniqueness of
  the family of bijections and its compatibility law, and the action of field automorphisms (Layer
  4);
- the degree relation `θ(1) ∣ |Γ : C| θ*(1)` and Glauberman degree-divisibility as a named
  predicate with its proved instances (Layer 5);
- the central characters of blocks over the splitting system of the base §1.1 at a place over `p`,
  Osima's formula, the existence and `p`-regularity of the defect classes of the base §6.2,
  Brauer's theorem on heights, heights, defects and height zero characters, and their transport
  under a change of place, under a change of the cyclotomic level from `ℚ(ζ_{exp H})` to `ℚ(ζ_e)`
  for `exp(H) ∣ e`, and under a change from the system at a place to an arbitrary splitting
  `p`-modular system (Layer 6);
- the Min–Max theorem, covering through central characters, domination of the blocks of `G/N` for
  an arbitrary normal subgroup `N` (the base §8.1 states it for normal `p`-subgroups) and defect
  groups under domination, the Fong–Reynolds correspondence, regular blocks, Fong's theorem and
  the extended first main theorem (Layer 7);
- vanishing off defect groups, the blocks of `P C_G(P)` with defect group `P`, heights of blocks
  with a normal defect group, and Reynolds' theorem (Layer 8);
- Brauer's height zero conjecture and the Alperin–McKay conjecture as predicates, with their
  proved instances (Layer 9).

Already in the libraries, and consumed rather than rebuilt:

- **Characters, the pairing and the table.** `TauCeti.irreducibleCharacters` (a `Set (G → k)`),
  `TauCeti.mem_irreducibleCharacters_iff`, `TauCeti.card_irreducibleCharacters`,
  `TauCeti.ClassFunction.characterPairing`, `TauCeti.characterTable`,
  `TauCeti.sum_characterTable_mul_conj`, `TauCeti.virtualCharacters`,
  `Representation.nonempty_equiv_of_character_eq`; Mathlib's
  `Representation.isIntegral_character`.
- **Conjugation, inertia and Clifford theory.** `TauCeti.conjNormalFDRep`,
  `TauCeti.conjNormalFDRep_ρ`, `TauCeti.char_conjFDRep`, `TauCeti.inertia`, `TauCeti.le_inertia`,
  `TauCeti.mem_inertia_iff`, `FDRep.cliffordCorrespondence`,
  `FDRep.clifford_restrict_dvd_finrank`, `FDRep.clifford_restrict_inertia_eq_top_of_coprime`,
  `TauCeti.clifford_restrict_character`,
  `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`; Mathlib's
  `Rep.indResAdjunction`.
- **Tensor factorisation over an extension.** `TauCeti.IsProjectiveInertiaExtension`,
  `TauCeti.IsProjectiveInertiaExtension.tensorRep`,
  `TauCeti.IsProjectiveInertiaExtension.tensorRepEquiv`,
  `TauCeti.IsProjectiveInertiaExtension.isIrreducible_tensorRep_iff`,
  `TauCeti.IsProjectiveInertiaExtension.tmulIntertwining_bijective`,
  `TauCeti.exists_isProjectiveInertiaExtension`.
- **Galois action, fields of values, central characters and degrees.**
  `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction`,
  `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply`, `FDRep.characterField`,
  `TauCeti.Representation.centralCharacter`,
  `TauCeti.Representation.centralCharacter_classSumCenter_mul_character_one`,
  `TauCeti.Representation.isIntegral_centralCharacter_classSumCenter`,
  `TauCeti.Representation.finrank_dvd_card`, `TauCeti.Representation.primitiveCentralIdempotent`,
  `TauCeti.classSum`, `TauCeti.classSumCenter`.
- **Group theory.** Mathlib's `SemidirectProduct` with `SemidirectProduct.inl`,
  `SemidirectProduct.inr`, `SemidirectProduct.inl_aut`, `SemidirectProduct.rightHom`;
  `MulDistribMulAction`, `MulDistribMulAction.toMulAut`, `arrowAction` (the action of a group on
  functions out of a set it acts on), `FixedPoints.subgroup`, `FixedPoints.mem_subgroup`, the
  quotient action `MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)` of
  `Mathlib/GroupTheory/GroupAction/OfQuotient.lean`, the conjugation action of a normaliser
  (`Subgroup.normalizerMonoidHom`), `Subgroup.exists_right_complement'_of_coprime`, `Sylow`,
  `IsPGroup`, `Group.IsSolvable`, `IsMulCommutative`, `padicValNat`; Tau Ceti's
  `SemidirectProduct.range_monoidHomSubgroup`.
- **Blocks, idempotents and induced class functions.** Tau Ceti's `TauCeti.IsPrimitiveIdempotent`
  (a nonzero idempotent that is not the sum of two nonzero orthogonal idempotents), applied in the
  centre `Subalgebra.center O (MonoidAlgebra O G)`, and `Subgroup.indClassFun` (the induced class
  function, a coset sum with no division); Mathlib's `MonoidAlgebra.mapRingHom`,
  `MonoidAlgebra.mapDomain`, `MonoidAlgebra.of`, `MonoidAlgebra.coeff` and
  `Representation.asAlgebraHom`.

Planned by other roadmaps, and imported by name and section:

- ModularCharactersAndBlocks, its Conventions and §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1,
  6.1–6.3, 7.1–7.2, 8.1–8.2: `p`-modular and splitting `p`-modular systems, the splitting
  `p`-modular system at a place over `p`, the lifting of block idempotents, Brauer characters,
  decomposition numbers, projective characters, the ordinary and modular block partitions,
  generalized decomposition numbers, relative traces and the Brauer homomorphism, defect groups
  and their characterisations, including the central characters of blocks and the defect classes,
  Brauer pairs, block induction, the first main theorem in its Brauer-projection form and the
  second main theorem, domination by normal `p`-subgroups, and covering for arbitrary normal
  subgroups.
- InverseGaloisAndArithmeticFundamentalGroups IG.3.4, target *Conjugacy of coprime complements*
  (the conjugacy half of Schur–Zassenhaus, when the normal subgroup or the quotient is solvable).
- RepresentationTheory/CharacterTheory §2.1 (the sum of the squares of the degrees), §3.5 (column
  orthogonality and primitive central idempotents), §3.6 (irreducible characters of a direct
  product), §4.3 (central characters and their integrality), §4.4 (the Galois action and the field
  of values), §4.5 (Brauer's splitting field: a field of characteristic zero containing a
  primitive `exp(G)`-th root of unity splits `G`).
- RepresentationTheory/InductionRestriction Layer 1 (conjugate representations), Layer 2 (induced
  characters and Frobenius reciprocity), Layer 5 (Clifford theory) and Layer 7 (the scalar
  extension obstruction and the tensor factorisation over a compatible projective extension). Its
  Layer 7 owns the module-level equivalence between representations of the inertia group over a
  simple `V` and projective representations of the inertia quotient; §2.4 here owns only its
  character form for an ordinary extension, Gallagher's bijection `β ↦ χ̂ β` on irreducible
  characters.

One supplier gap, which this roadmap consumes and does not plan (see *Exact supplier contracts*):
the Clifford divisibility `χ(1)/θ(1) ∣ |G : N|` for `N ⊴ G` and `θ` under `χ`, a statement about
projective representations that InductionRestriction Layer 7 is to provide
(gap:clifford-multiplicity-dvd-index).

Cited and not planned: Kessar and Malle's proof that abelian defect groups force height zero
(kessar-malle line 25, Theorem 1.1); Malle, Navarro, Schaeffer Fry and Tiep's proof of the
converse for odd `p` (mnst line 70, Theorem A); Ruhstorfer's proof of the Alperin–McKay conjecture
and of the height zero conjecture for `p = 2` (ruhstorfer line 20, Theorem A, and line 33,
Corollary B); and Glauberman degree-divisibility in general (geck line 29, completing
hartley-turull line 84, Theorem A). These rest on the classification of finite simple groups and
on Lusztig's theory; Layers 5 and 9 state the predicates they concern. Not owned: Brauer's
permutation lemma for the Galois action on characters and classes, which FiniteGroupInvariants
§6.2 states (§1.3 here is the version for a group automorphism, which Glauberman's argument
needs); the Isaacs correspondence for `Γ` of odd order and arbitrary `S` (isaacs-1973), its
agreement with Glauberman's, Turull's theory above the correspondence, inductive conditions and
reduction theorems, blocks with cyclic defect groups, and Dade's conjectures.

## Conventions

- **Groups and actions.** `Γ` and `S` are finite groups, `S` acts on `Γ` by automorphisms through
  Mathlib's `MulDistribMulAction S Γ`, and *coprime* means
  `Nat.Coprime (Nat.card S) (Nat.card Γ)`. `C = C_Γ(S)` is `FixedPoints.subgroup S Γ`. Statements
  are universe-polymorphic in `Γ` and `S` and carry `Finite` instances. A subgroup `S ≤ N_G(Γ)` of
  an ambient group acting by conjugation is the special case obtained from Mathlib's
  `MulDistribMulAction (normalizer Γ) Γ` along the inclusion; each theorem is stated for the
  external action and transported to the internal case through the multiplication map
  `Γ ⋊ S → Γ S`, which is an isomorphism when `Γ ∩ S = 1`, in particular for coprime orders.
- **The semidirect product.** `Γ ⋊ S` is `Γ ⋊[MulDistribMulAction.toMulAut S Γ] S`. Mathlib's
  `SemidirectProduct.inl_aut` gives `inr s · inl g · inr s⁻¹ = inl (s • g)`. Elements of `Γ` and
  `S` are identified with their images under `inl` and `inr`.
- **Conjugate characters.** For `χ : Γ → ℂ`, `s · χ` is given by Mathlib's `arrowAction` for the
  action of `S` on `Γ`, so `(s · χ)(g) = χ(s⁻¹ • g)`; this is a left action, and it is the
  character of the conjugate representation by `inr s` in the sense of `TauCeti.char_conjFDRep`
  (`({}^x χ)(y) = χ(x⁻¹ y x)`). Witness: `Γ = C₇ = ⟨r⟩`, `S = C₃` acting by `r ↦ r²`, `χ(r) = ζ₇`;
  then `s⁻¹ • r = r⁴` and `(s · χ)(r) = ζ₇⁴`, whereas `χ(s • r) = ζ₇²`. `Irr_S(Γ)` is the set of
  `S`-invariant members of `TauCeti.irreducibleCharacters ℂ Γ`.
- **Characters and multiplicities.** Characters are complex-valued functions on the group. The
  pairing is Tau Ceti's `[f₁, f₂] = |G|⁻¹ Σ_g f₁(g) f₂(g⁻¹)`; on characters it equals the
  Hermitian inner product, and `[χ|_C, λ]` is the natural-number multiplicity of `λ ∈ Irr(C)` in
  the restriction `χ|_C = χ ∘ C.subtype`. A character `β` of `S` is inflated to `Γ ⋊ S` as
  `β ∘ rightHom`. `Irr(G | θ)`, for `θ ∈ Irr(N)` and `N ⊴ G`, is the set of `χ ∈ Irr(G)` with
  `[χ|_N, θ] ≠ 0`.
- **Determinantal character.** For a character `η` afforded by `ρ`, `det η (g) = det ρ(g)`; it
  does not depend on `ρ`. Witness: the two-dimensional character of `S₃` has `det = sgn`, value
  `−1` at a transposition.
- **Galois conjugates.** For `j` coprime to `|Γ|`, `χ^{(j)}(g) = χ(g^j)`; by
  `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply` it is the image of `χ` under the
  automorphism `ζ ↦ ζ^j` of `ℚ(ζ_{|Γ|})`, and it is irreducible when `χ` is. Witness: on `C₅` with
  `χ(r) = ζ₅`, `χ^{(2)}(r) = ζ₅²` and `χ^{(3)}(r) = ζ₅³`.
- **Composition series.** For solvable `S`, a composition series is a chain
  `S = S₀ ⊵ S₁ ⊵ ⋯ ⊵ S_m = 1` with each `S_i ⊴ S_{i−1}` and `S_{i−1}/S_i` of prime order. For
  `T ⊴ S`, `S/T` acts on `C_Γ(T)` by Mathlib's quotient action, and `C_{C_Γ(T)}(S/T) = C_Γ(S)`.
- **Signs.** `ε ∈ {1, −1} ⊆ ℤ`. In the cyclic case the sign is the one with `χ̂(a t) = ε χ*(t)`;
  witness: for `SL(2,3) = Q₈ ⋊ C₃` and the two-dimensional character of `Q₈`, `ε = −1`.
- **Blocks.** A **splitting `p`-modular system** of `G` (base Conventions) is a triple
  `(K, O, k)`: `O` a complete discrete valuation ring with maximal ideal `m`, its fraction field
  `K` of characteristic zero containing a primitive `exp(G)`-th root of unity, and its residue
  field `k = O/m` of characteristic `p`. The system of base §1.1 at a finite place `v` of
  `F = ℚ(ζ_e) ⊆ ℂ` over `p`, `e = exp(G)`, is one: `K = F_v`, `O` its valuation ring, `k` a finite
  field, and `F → K` the canonical map of base §1.1. The base develops its Layers 2–8 for the
  system at a place, its second main theorem of §7.2 in particular, at every place `v` over `p`.
  The places over `p` correspond to the primes `𝔭_v = m ∩ O_F` of the ring of integers `O_F` over
  `p`, which are the ideals `M ∩ O_F` for the maximal ideals `M ∋ p` of the algebraic integers, as
  in base §4.2 (`SameBlock`). Each statement of Layers 6–9 is made for every splitting `p`-modular
  system of `G`: it is proved at the system at a place and carried to an arbitrary splitting
  system by the change of system of §6.1; how the blocks at two places compare is the change of
  place of §6.3. A statement of Layers 6–8 about a subgroup, a quotient or a quotient of a
  subgroup `H` of `G` (a normaliser `N_G(D)`, the stabiliser of a block, `D C_G(D)`, `G/N`) is
  read at the system of `G`, which splits `H` as well since `exp(H)` divides `exp(G)`; at the
  system of `G` at a place `v` it follows from the same statement for `H` at the place of
  `ℚ(ζ_{exp H})` below `v` by the change of level of §6.3. For `S₃` and `p = 2`, the Brauer
  correspondent of `B₀` is a block of `𝔽₄[C₂]`, while the system of `C₂` itself is `(ℚ₂, ℤ₂, 𝔽₂)`.
  Witness: for `S₃` and `p = 2`, `F = ℚ(ζ₃)` has one place over `2`, with `K = ℚ₂(ζ₃)` and
  `k = 𝔽₄`; for `C₇ × C₂` and `p = 2`, `F = ℚ(ζ₇)` has `6/3 = 2` places over `2`, as `2` has order
  `3` modulo `7`, each with `k = 𝔽₈`. For `S₃` and `p = 2`, the `2`-adic completion of the
  localisation of `ℤ₂[ζ₃][T]` at the prime `2` is a complete discrete valuation ring with residue
  field `𝔽₄(T)` whose fraction field contains `ζ₆ = −ζ₃²`: a splitting system that is not at a
  place, for which the base does not state its second main theorem; Layers 6–9 reach it through
  the change of system. `Irr(G)` means the `K`-valued irreducible characters; their values lie in
  the image of `F` under the embedding `F → K` fixed by a primitive `exp(G)`-th root of unity of
  `K` (CharacterTheory §4.5), and at a place the base identifies them with the complex ones
  through `F ⊆ ℂ` and `F → K` (base §§1.1, 4.2). A block `B` is a block of `k[G]` with its unique
  central lift `e_B ∈ Z(O[G])` (base `existsUnique_blockIdempotent_map_residue`); `χ ∈ Irr(B)`
  exactly when `e_B e_χ = e_χ` in `K[G]`, where `e_χ = χ(1) |G|⁻¹ Σ_g χ(g⁻¹) g` (base §4.2),
  equivalently when `e_B` acts as the identity on a representation affording `χ`. Defect groups
  and defect classes are those of base §6.2: the defect groups of `B` are the maximal
  `p`-subgroups `P` with `Br_P(e_B) ≠ 0`, and `Br_P(e_B)` is the truncation of `e_B` to `C_G(P)`,
  nonzero exactly when some coefficient of `e_B` at an element of `C_G(P)` is nonzero (sambale
  line 341, Definition 1.3, and line 350, Definition 1.4, over a complete discrete valuation ring
  with algebraically closed residue field, sambale line 312). For `N ⊴ G`, a block `B` of `G`
  **covers** a block `b` of `N` (base §8.2) exactly when `e_B e_b ≠ 0` (sambale line 483,
  Definition 1.16), read in `k[G]` or in `O[G]` alike: `e_B e_b` is an idempotent of `O[G]`, and
  an idempotent lying in `m O[G]` lies in every `mⁿ O[G]`, hence is `0`. The **stabiliser** of `b`
  is `{g ∈ G : g e_b g⁻¹ = e_b}`. For a block `B` with defect group `D`, its **Brauer
  correspondent** is the block `b'` of `k[N_G(D)]` with `e_{b'} = Br_D(e_B)`: base §6.2 states,
  over the residue field `k` of the system and with no algebraic-closure hypothesis, that
  `Br_D(e_B)` is a block idempotent of `k[N_G(D)]` with defect group `D` and that every such block
  arises from exactly one `B`, and base §7.1 gives `b'^G = B`. Witness: `S₃`, `p = 2`, `D = ⟨t⟩`
  for a transposition `t`: `N_G(D) = C_G(D) = D`, `Br_D(1 + r + r²) = 1`, the block idempotent of
  `k[D]`, so `b'` is the block of `D` for `B₀`, while `Br_D(r + r²) = 0` for the block of defect
  zero.
- **Blocks in `Suggested.lean`.** The system is a commutative ring `O` with `IsDomain`,
  `IsDiscreteValuationRing`, `IsAdicComplete (IsLocalRing.maximalIdeal O) O` and `CharZero O`,
  with `K = FractionRing O`, an element `ζ : K` with `IsPrimitiveRoot ζ (Monoid.exponent G)`, and
  `CharP (IsLocalRing.ResidueField O) p`. A block is a primitive idempotent `b` of
  `Subalgebra.center O (MonoidAlgebra O G)` in the sense of `TauCeti.IsPrimitiveIdempotent`, the
  central lift of a block of `k[G]` (base §1.3). `blockCharacters`, applied to `b`, is the set of
  characters of irreducible representations of `G` on coordinate spaces `Fin n → K` on which the
  image of `b` in `K[G]` acts as the identity, which is `Irr(B)` as above.
  `IsBlockDefectGroup p e P`, for `e ∈ k[G]`, says that `P` is a `p`-subgroup, that `e` has a
  nonzero coefficient at some element of `C_G(P)`, and that no strictly larger `p`-subgroup has a
  nonzero coefficient on its centraliser: the base §6.2 definition of a defect group, written with
  coefficients. The defect groups of `b` are those of its reduction
  `MonoidAlgebra.mapRingHom G (IsLocalRing.residue O) b`. A degree is read as a natural number `n`
  with `χ(1) = n` in `K`, which determines `n` as `K` has characteristic zero. Witnesses for
  `IsBlockDefectGroup`, with `r` a `3`-cycle and `t` a transposition. In `k[S₃]` at `p = 2`, for
  `e = 1 + r + r²`, the reduction of the principal block idempotent `(1 + r + r²)/3`, the subgroup
  `⟨t⟩` qualifies (coefficient `1` at `1 ∈ C_G(⟨t⟩) = {1, t}`, and `⟨t⟩` is a Sylow `2`-subgroup),
  while `1` satisfies the first two clauses and fails only maximality, so a definition without the
  maximality clause would accept the trivial group. For `e = r + r²`, the reduction of the
  defect-zero idempotent `(2 − r − r²)/3` (as `−1/3 ≡ 1` modulo `2`), the coefficients at `1` and
  `t` vanish, so `⟨t⟩` fails and `1` is the defect group, whereas a definition reading the
  coefficients on all of `G` would accept `⟨t⟩`. In `k[S₄]` at `p = 3`, the character `χ` with
  values `3, 1, −1, 0, −1` on the classes of `1, (12), (12)(34), (123), (1234)` has defect zero and
  idempotent `(1/8) Σ_g χ(g) g`, with coefficients `3/8, 1/8, −1/8, 0, −1/8` on these classes,
  which reduce to `0, 2, 1, 0, 1` (as `8 ≡ 2` and `2⁻¹ ≡ 2` modulo `3`); as a control, the central
  character, `2, −1, −2` on the class sums of the transpositions, the double transpositions and
  the `4`-cycles, gives `2·2 + (−1) + (−2) = 1` on this element. The reduced idempotent vanishes
  on `C_G(⟨(123)⟩) = ⟨(123)⟩`, and the four Sylow `3`-subgroups are self-centralising, so the defect
  group is `1`; with the normaliser `S₃` of `⟨(123)⟩` in place of its centraliser, the
  transpositions, of coefficient `2`, would make `⟨(123)⟩` qualify. Witnesses for
  `blockCharacters`. Over `O = ℤ₂[ζ₃]`, whose fraction field contains a primitive sixth root of
  unity, `b = (1 + r + r²)/3 ∈ O[S₃]` gives `{1, sgn}`: it acts as `1` on both and as `0` on `std`,
  where `r` has eigenvalues `ζ₃, ζ₃²` and `1 + ζ₃ + ζ₃² = 0`; `b = (2 − r − r²)/3` gives `{std}`, on
  which it acts as `(2 + 1)/3 = 1`; `b = 1` gives every irreducible `K`-character, and `b = 0` the
  empty set, an irreducible representation being nonzero. The definition does not ask for a
  splitting system: over `O = ℤ₂`, whose fraction field `ℚ₂` lacks `ζ₃`,
  `b = (2 − r − r²)/3 ∈ ℤ₂[C₃]` gives the single character `2, −1, −1` of the two-dimensional
  irreducible `ℚ₂`-representation, on which `r` acts with minimal polynomial `X² + X + 1`, while a
  definition through complex characters would give the two linear characters `λ, λ̄` of `C₃`.
- **Valuations and heights.** `ν = padicValNat p` on natural numbers and `ν_p = padicValRat p` on
  rationals; both send `0` to `0`. `|G|_p = p^a` with `a = ν(|G|)`; for a block with defect group
  `D`, `|D| = p^d`. For `q ∈ ℚ ⊆ K`, `q ∈ O` exactly when `ν_p(q) ≥ 0`, and `q ∈ m` exactly when
  `q = 0` or `ν_p(q) > 0`. Witness at `p = 2`: `0 ∈ m` although `ν_p(0) = 0`; `3/2 ∉ O`, with
  `ν_p(3/2) = −1`; `2/3 ∈ m`, with `ν_p(2/3) = 1`.
- **Central characters.** For `χ ∈ Irr(G)`, a class `𝒞` with class sum `𝒞⁺` and `x ∈ 𝒞`,
  `ω_χ(𝒞⁺) = |𝒞| χ(x)/χ(1)`, an element of `F = ℚ(ζ_e) ⊆ ℂ`. Over `ℂ` it is the value at
  `TauCeti.classSumCenter 𝒞` of the native central character
  `TauCeti.Representation.centralCharacter` of a representation affording `χ`
  (`TauCeti.Representation.centralCharacter_classSumCenter_mul_character_one`, with `χ(1) ≠ 0`).
  The native map is defined over algebraically closed fields only, so over `K` the symbol
  `ω_χ : Z(K[G]) → K` denotes the `K`-linear map with these values on the class sums, read through
  the embedding `F → K` of base §1.1; §6.1 proves that it is an algebra homomorphism with values
  in `O` on the class sums. `λ_B : Z(k[G]) → k` is the central character of a block (base §6.2).
  `a_B(𝒞)` is the coefficient of `𝒞⁺` in `e_B ∈ Z(k[G])`. Witness: `S₃`, `p = 2`, `K = ℚ₂(ζ₃)`,
  `k = 𝔽₄`, the class of the transpositions: `ω = 3, −3, 0` for the trivial, sign and
  two-dimensional characters, with reductions `1, 1, 0`, and `λ_{B₀} = 1` there.

## Exact supplier contracts

### From Mathlib

`SemidirectProduct`, `SemidirectProduct.inl`, `SemidirectProduct.inr`, `SemidirectProduct.inl_aut`
(`inl (φ g n) = inr g * inl n * inr g⁻¹`), `SemidirectProduct.rightHom`,
`SemidirectProduct.range_inl_eq_ker_rightHom`; `MulDistribMulAction`,
`MulDistribMulAction.toMulAut`, `arrowAction` (`Mathlib/Algebra/Group/Action/Basic.lean`: for
`[DivisionMonoid G] [MulAction G A]`, the action `(g • F)(a) = F(g⁻¹ • a)` on `A → B`, with its
action laws; a definition, not an instance), `FixedPoints.subgroup` (the elements fixed by every
`m`, with `FixedPoints.mem_subgroup`), the instance
`MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)` for normal `H`
(`Mathlib/GroupTheory/GroupAction/OfQuotient.lean`), the conjugation action
`MulDistribMulAction (normalizer H) H` and `Subgroup.normalizerMonoidHom`
(`Mathlib/GroupTheory/Subgroup/Centralizer.lean`); `Subgroup.exists_right_complement'_of_coprime`
(for a normal subgroup `N` with `Nat.Coprime (Nat.card N) N.index`, a subgroup `H` with
`Subgroup.IsComplement' N H` exists; existence only: the file
`Mathlib/GroupTheory/SchurZassenhaus.lean` proves no conjugacy of complements beyond the abelian
case), `Subgroup.IsComplement'`, `MulAction.stabilizer`; `Sylow`, `IsPGroup`,
`Group.IsSolvable`, `IsCyclic`, `ConjClasses`, `MulAut.conj`, `Subgroup.index`, `QuotientGroup`;
`Representation`, `Representation.character`, `Representation.IsIrreducible`,
`Representation.isIntegral_character`
(`Mathlib/RepresentationTheory/Character.lean`: for a finite group and a finite-dimensional
representation over a field, the character values are integral over `ℤ`), `LinearMap.det`,
`FDRep`, `Rep.indResAdjunction` (`Mathlib/RepresentationTheory/Induced.lean`: for a commutative
ring `k` and a group homomorphism `φ : G →* H`, induction `Rep k G ⥤ Rep k H` along `φ` is left
adjoint to restriction along `φ`, with no hypothesis on `k`; used with `φ` the inclusion of a
normal subgroup and `k` the residue field); `IsCyclotomicExtension`, `IsPrimitiveRoot.autToPow`,
`ZMod.chineseRemainder`, `IsGalois`, `IntermediateField.adjoin`, `IntermediateField.fixedField`,
`IsIntegral`; `padicValNat`, `padicValRat`; `IsDiscreteValuationRing`, `IsAdicComplete`,
`IsLocalRing.ResidueField`, `MonoidAlgebra`, `Subalgebra.center`;
`Ideal.exists_smul_eq_of_isGaloisGroup` (`Mathlib/NumberTheory/RamificationInertia/Galois.lean`:
for a finite group `G` acting on `B` as a Galois group over `A`, `IsGaloisGroup G A B`, two primes
of `B` lying over the same ideal of `A` are exchanged by some element of `G`), used with `A = ℤ`,
`B = 𝓞 F` and the instance `IsGaloisGroup G ℤ (𝓞 L)` of
`Mathlib/FieldTheory/Galois/IsGaloisGroup.lean` for a Galois group of a number field `L` over `ℚ`;
`IsDedekindDomain.HeightOneSpectrum.adicCompletion`
(`Mathlib/RingTheory/DedekindDomain/AdicValuation/Completion.lean`: for a Dedekind domain `R` with
fraction field `K` and a height-one prime `v`, the completion of `K` for the `v`-adic valuation, a
structure wrapping the uniform-space completion `(v.valuation K).Completion`; with `R = 𝓞 F` it is
the completion `F_w` of a number field at a finite place) and `UniformSpace.Completion.extension`
(`Mathlib/Topology/UniformSpace/Completion.lean`: the extension of a map `f : α → β` to the
completion of `α`, uniformly continuous when `β` is complete, and equal to `f` on `α` when `f` is
uniformly continuous and `β` is `T0Space`, by `UniformSpace.Completion.extension_coe`; for a map
that is not uniformly continuous it is a junk constant), used in the change of system of §6.1 to
identify the closure of `ℚ(ζ_{exp H})` in a complete `K'` with the completion at the place `w`
below `m'`. Assumed: their statements, nothing more.

### From Tau Ceti

The declarations listed under *Already in the libraries*, read at their files:
`TauCeti/RepresentationTheory/CharacterTable/Table.lean` (`TauCeti.irreducibleCharacters`,
`TauCeti.card_irreducibleCharacters`, the latter over an algebraically closed field in which `|G|`
is invertible), `CharacterTable/Pairing.lean`, `CharacterTable/Degree.lean`
(`TauCeti.Representation.finrank_dvd_card`, algebraically closed of characteristic zero),
`CharacterTable/CentralCharacter.lean` (`TauCeti.Representation.centralCharacter` with its
class-sum identity and the integrality of its values on class sums, for an irreducible
finite-dimensional representation over an algebraically closed field; used over `ℂ` and
transported to `K` through `F = ℚ(ζ_e)` as in Conventions),
`CharacterTable/CentralIdempotent.lean`, `CharacterTable/FieldOfValues.lean`
(`FDRep.characterField`, the intermediate field generated by the values),
`CharacterTable/Cyclotomic/Action.lean` (`IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction`,
with `K`, `L`, `G` in one universe and the value formula `χ(g^j)`), `Induction/Conjugate.lean`,
`Induction/Inertia.lean`, `Induction/Clifford/Basic.lean`
(`TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`: over any field, the restriction
of a finite-dimensional irreducible representation to a normal subgroup is semisimple, with no
hypothesis on the characteristic or on algebraic closure), `Induction/Clifford/Decomposition.lean`
(`TauCeti.clifford_restrict_character`: for finite `G` over an algebraically closed field in which
`|G|` is a unit, the character of the restriction of a simple representation to `N` is a positive
multiple of the sum of the distinct conjugates of a simple constituent; used over `ℂ` only),
`Induction/Clifford/Classes.lean` (`FDRep.cliffordCorrespondence`, algebraically closed of
characteristic zero, on classes of simple representations lying over a simple `V`, with the field
and the group in one universe, so over `ℂ` for `G : Type`; a group in another universe is first
replaced by its `ULift`, which has the same characters),
`Induction/Clifford/Dimension.lean` (`FDRep.clifford_restrict_dvd_finrank`: over an algebraically
closed field, for simple `W`, a constituent `V` of `Res_N W` with `dim V ∣ dim W` and
`[G : inertia V] ∣ dim W`; used over `ℂ` only), `Induction/Clifford/Obstruction.lean`,
`Induction/Clifford/TensorFactorization.lean` (`tensorRepEquiv`: an irreducible representation of
the inertia group lying over a simple `A` over an algebraically closed field is
`A ⊗ Hom_N(A, W)`), `Induction/Clifford/ProjectiveCorrespondence.lean`
(`isIrreducible_tensorRep_iff`, `tmulIntertwining_bijective`), `Induction/ClassFunction.lean`
(`Subgroup.indClassFun`: for a subgroup `H` of finite index and `f : H → k`, the function
`g ↦ Σ_t f(t⁻¹ g t)` over fixed left coset representatives `t` with `t⁻¹ g t ∈ H`, with no
division, which on a character is the character of the induced representation),
`TauCeti/RingTheory/Idempotents/Primitive/Basic.lean` (`TauCeti.IsPrimitiveIdempotent`: an
idempotent, nonzero, not the sum of two nonzero orthogonal idempotents; in a commutative ring such
as a centre, primitive among central idempotents), and
`TauCeti/GroupTheory/SemidirectProduct.lean`. Assumed of them: what their statements say. In
particular the tensor factorisation is stated for a projective extension with factor set `β` and a
projective multiplicity representation with factor set `β⁻¹`; this roadmap uses it with `β = 1`.

### From TauCetiRoadmap.RepresentationTheory.ModularCharactersAndBlocks

- Conventions: a `p`-modular system `(K, O, k)` is a complete discrete valuation ring `O`
  (`IsAdicComplete` for its maximal ideal) with fraction field `K` of characteristic zero and
  residue field `k` of characteristic `p`; it is splitting for `G` when `K` contains a primitive
  `exp(G)`-th root of unity, and then `K` and `k` split `G` and all its subgroups. A block of
  `R[G]` is a primitive idempotent of the centre `Z(R[G])`.
- §0.2: block idempotents of `R[G]` as primitive idempotents of the centre, the decomposition
  `k[G] ≅ ∏_B e_B k[G]`, and the blocks of modules.
- §1.1: the splitting `p`-modular system `(F_v, O, k)` at a finite place `v` of `F = ℚ(ζ_e)` over
  `p`, with finite residue field `k`, the canonical map `F → F_v` and the root bijection, for `G`
  and all its subgroups, centralisers and quotients. The base's Layers 2–8 use this system; every
  statement of Layers 6–9 here is proved for it, at an arbitrary place `v` over `p`, and carried
  to an arbitrary splitting `p`-modular system by the change of system of §6.1.
- §1.2: stable lattices, and the compatibility of reduction with restriction and induction.
- §1.3: `existsUnique_blockIdempotent_map_residue`, the uniqueness of the central lift of a
  central idempotent of `k[G]` to `Z(O[G])`, and surjectivity of `Z(O[G]) → Z(k[G])`.
- §2.1–2.2: Brauer characters, their induction formula and linear independence of `IBr(G)`.
- §2.3: a field of characteristic `p` containing a primitive root of unity of order the `p'`-part
  of the exponent splits `G` and its subgroups, in particular the residue field of a splitting
  system, so central characters of simple modules take values in `k`; and the radical base change
  `rad(k'[G]) = k' ⊗_k rad(k[G])` for an extension `k ⊆ k'` of such a field, so that scalar
  extension is a bijection on simple modules.
- §2.4: decomposition numbers `χ|_{p-reg} = Σ_φ d_{χφ} φ`, surjectivity of the decomposition map,
  so every Brauer character is a `ℤ`-combination of restricted ordinary characters, and the
  compatibility of the decomposition map with a change of splitting modular system.
- §3.1: projective characters `Φ_φ = Σ_χ d_{χφ} χ`, vanishing on `p`-singular elements, and
  `|G|_p ∣ Φ_φ(1)`.
- §4.1–4.3: the idempotents `e_χ`; `e_B = Σ_{χ ∈ Irr(B)} e_χ`; the partitions of `Irr(G)` and
  `IBr(G)`; the central-character criterion; block-diagonality of the decomposition matrix; the
  principal block.
- §5.1: generalized decomposition numbers `χ(u v) = Σ_φ d^u_{χφ} φ(v)` for a `p`-element `u` and
  `p`-regular `v ∈ C_G(u)`.
- §6.1: relative traces, `k[G]^P_Q = Tr_Q^P(k[G]^Q)` an ideal of `k[G]^P`, the Brauer projection
  and its factorisation for `Q ≤ P`.
- §6.2: `IsDefectGroup`, `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero`,
  the central character `λ_B : Z(k[G]) → k` of a block, the algebra homomorphism with
  `λ_B(e_B) = 1`, over a field `k` of characteristic `p` that splits `G`, the agreement with the
  minimality of `P` with `e ∈ Tr_P^G(k[G]^P)` and with defect classes (Martínez, Definition 3.2: a
  defect class of `B` is a class `𝒞` with `a_B(𝒞) λ_B(𝒞⁺) ≠ 0`, and the defect groups of `B` are
  the Sylow `p`-subgroups of `C_G(x)` for `x` in a defect class); the defect classes are the
  base's, and this roadmap does not redefine them. Also `O_p(G)` in every defect group, `⟨x⟩` in
  every defect group of every block of `C_G(x)` for a `p`-element `x`, the characterisation of
  defect zero (`Irr(B) = {χ}`, `IBr(B) = {χ⁰}`, `|G|_p ∣ χ(1)`), and the first main theorem in its
  Brauer-projection form: for a block `B` with defect group `D`, `Br_D(e_B)` is a block idempotent
  of `k[N_G(D)]` with defect group `D`, and every such block arises from exactly one `B`. This
  last statement is made over the residue field `k` of the system, without an algebraic-closure
  hypothesis, and defines the Brauer correspondent (Conventions). With §3.1 and the
  block-diagonality of §4.2 the characterisation of defect zero gives `Φ_{χ⁰} = χ`, so a character
  of defect zero vanishes on `p`-singular elements. Finally the scalar extension: for fields
  `k ⊆ k'` of characteristic `p` with `k` splitting a subgroup `H`, the blocks of `k[H]` are
  exactly those of `k'[H]`, the central character over `k'` extends `λ_b`, and the defect classes,
  `Br_P(e_b)`, the defect groups and the principal block are the same over `k` and over `k'`; §6.3
  uses it for the change of level.
- §6.3: Brauer pairs, the order relation, and the maximal `B`-Brauer pairs, whose first components
  are the defect groups.
- §7.1: block induction `b^G`, defined through the central characters of §6.2 when `C_G(D_b) ≤ H`,
  its transitivity, and `Br_P(e_B) = Σ_{b^G = B} e_b` for `P C_G(P) ≤ H ≤ N_G(P)`. The base's
  `brauer_first_main` is stated over an algebraically closed field; its form over a field
  splitting `G` and all its subgroups (base §7.1) agrees with the Brauer correspondent of
  Conventions, which is taken from §6.2: with `H = N_G(D)` the formula above makes
  `Br_D(e_B) = e_{b'}` the sum of the `e_b` with `b^G = B`, so `b'` is the only such block and the
  bijection of §7.1 sends `b'` to `B`.
- §7.2: the second main theorem, stated for the system of §1.1, whose residue field is finite:
  `d^u_{χφ} ≠ 0` for `φ ∈ IBr(b)` implies that `(⟨u⟩, b)` is a Brauer pair of the block of `χ`.
- §8.1: for a normal `p`-subgroup `N`, `N` acts trivially on simple `k[G]`-modules, so the simple
  modules and Brauer characters of `G/N` are those of `G` by inflation, and every block of `G/N`
  lies in the image of exactly one block of `G`. Domination for an arbitrary normal subgroup is
  §7.3 here.
- §8.2: normal `p'`-subgroups; and block covering for an arbitrary normal subgroup `N ⊴ G`: the
  sum of the block idempotents over the `G`-orbit of a block `b` of `k[N]` is the sum of the `e_B`
  over the blocks `B` of `G` that cover `b` (Martínez, Definition 7.3), and `B` covers `b` exactly
  when some `χ ∈ Irr(B) ∪ IBr(B)` has an irreducible constituent of `χ_N` in `b`, exactly when for
  every `χ ∈ Irr(B) ∪ IBr(B)` every irreducible constituent of `χ_N` lies in a `G`-conjugate of
  `b` (Martínez, Theorem 7.7). As `e_B` is `G`-invariant, `B` covers `b` exactly when
  `e_B e_b ≠ 0`.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

- IG.3.4, target *Conjugacy of coprime complements*: for a finite group `G` and a normal subgroup
  `N` with `Nat.Coprime (Nat.card N) N.index` and `N` or `G/N` solvable, any two complements of
  `N` are conjugate by an element of `N`. §1.2 uses it in `Γ ⋊ S` and in a point stabiliser there,
  with `S` or `Γ` solvable: the normal subgroups are `inl(Γ)` and subgroups of it, solvable when
  `Γ` is, and the quotients are isomorphic to `S`. §3.1 uses it in `Γ ⋊ A` with `A` cyclic.

### From TauCetiRoadmap.RepresentationTheory.CharacterTheory

§2.1 (the sum of the squares of the degrees), §3.5 (column orthogonality, primitive central
idempotents), §3.6 (the irreducible characters of `G × H` are the products `ψ × ξ`), §4.1 (over
`ℂ`, `ρ(g)` is diagonalisable with root-of-unity eigenvalues, a diagonalisable endomorphism with a
single eigenvalue is scalar, and the equality case of the triangle inequality for unit complex
numbers; together, `|χ(g)| = χ(1)` makes `ρ(g)` scalar, which §3.4 uses), §4.3 (central
characters, `ω_χ(𝒞⁺) = |𝒞| χ(x)/χ(1)`, integrality), §4.4 (the Galois action and
`fieldOfValues_eq_map_fixedField_stabilizer`), §4.5 (Brauer's splitting field: for a field `K` of
characteristic zero containing a primitive `exp(G)`-th root of unity, every irreducible
representation of `G` over an algebraically closed extension of `K` is the scalar extension of an
absolutely irreducible representation over `K`, so `K`, and with it every extension of `K`, splits
`G`; §4.5 also transports the realisation along `ULift` and `Shrink` to a group in another universe
than the fields). It is used in Conventions, for the values of the `K`-valued irreducible characters, and
in the change of system of §6.1, where it applies to the closure `K_w` of `ℚ(ζ_{exp H})` in `K'`.

### From TauCetiRoadmap.RepresentationTheory.InductionRestriction

Layer 1 (`conjRep` and the conjugate character), Layer 2 (the induced character and Frobenius
reciprocity), Layer 5 (Clifford's theorem and the Clifford correspondence), Layer 7 (the scalar
obstruction `cliffordObstruction` and the tensor factorisation over a compatible projective
extension). Layers 2 and 5 state reciprocity and Clifford theory with `IsUnit (Nat.card G : k)`,
so this roadmap consumes them for ordinary characters only, over `ℂ`; the characteristic-`p` step
of §7.2 uses instead the field-general Mathlib `Rep.indResAdjunction` and Tau Ceti
`TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`.

What InductionRestriction must provide (gap:clifford-multiplicity-dvd-index): for a finite group
`G`, `N ⊴ G`, `χ ∈ Irr(G)` and an irreducible constituent `θ` of `χ|_N`, the quotient `χ(1)/θ(1)`
is a natural number dividing `|G : N|` (isaacs Corollary 11.29; the step used in the proof of
reynolds line 531, Theorem 8, at line 538). The supplying section is Layer 7, "projective
representations, factor sets, and the Schur multiplier": it owns the tensor factorisation of an
irreducible representation of the inertia group of `θ` as a compatible projective extension of `θ`
tensored with a projective representation of the inertia quotient, and the lifting of projective
representations to a central extension, but states no degree divisibility. The divisibility
reduces, through the Clifford correspondence of Layer 5 and that factorisation, to Schur's theorem
that the degree of an irreducible projective representation of a finite group divides the order of
the group, which follows from the lifting to a finite central extension and the divisibility of
the degree of an irreducible representation by the index of a central subgroup (isaacs Theorem
3.12). §8.3 uses it for Reynolds' height formula.

## How to read the build

Layers 1–5 are the coprime-action strand and use no block theory. Layer 1 fixes the action on
characters and proves the fixed-class lemma and Brauer's permutation lemma; Layer 2 constructs the
canonical extension and Gallagher's correspondence; Layer 3 treats a cyclic acting group; Layer 4
builds the correspondence for solvable `S`, proves its characterisations, and defines the
Glauberman correspondence as the unique compatible family; Layer 5 proves the degree relation and
states degree-divisibility. Layers 6–9 are the block strand, on the base. Layer 6 proves Brauer's
theorem on heights and defines heights; Layer 7 develops blocks and normal subgroups up to the
Fong–Reynolds correspondence and the extended first main theorem; Layer 8 proves the structure of
blocks with a normal defect group and Reynolds' theorem; Layer 9 states the two conjectures as
predicates. `Suggested.lean` states the headline theorems: the canonical extension, its values and
Gallagher's correspondence (§§2.2–2.4), the count of invariant characters (§4.4), the `p`-group
characterisation of the correspondent, the existence and uniqueness of the Glauberman family and
its sign formula for a cyclic acting group (§4.5), its constituent and field-of-values laws (§4.6)
and its degree law (§5.1), Brauer's theorem on heights (§6.2), the Fong–Reynolds correspondence
(§7.4), Reynolds' height formula (§8.3) and Reynolds' theorem (§8.4). It adds the four definitions
they need: the invariant characters (§1.1), the defining laws of the Glauberman family (§4.5), and
the defect groups and ordinary characters of a block in their coefficient forms (Conventions). The
two predicates of Layer 9 and degree-divisibility (§5.2) are definitions whose general validity is
cited, not proved here, so they stay in this text.

## Layer 1: coprime actions on characters

### 1.1 Conjugate characters and invariant characters

Take the action of `S` on functions `Γ → ℂ` to be Mathlib's `arrowAction` for the action of `S` on
`Γ`, so `(s · χ)(g) = χ(s⁻¹ • g)`; its action laws are Mathlib's. Define
`invariantIrreducibleCharacters`, which sends `S` and `Γ` to the set `Irr_S(Γ)` of
`χ ∈ TauCeti.irreducibleCharacters ℂ Γ` with `χ(s • g) = χ(g)` for all `s ∈ S` and `g ∈ Γ`; as `s`
runs over a group, this is the fixed set of the action `s · χ`. Take the fixed-point subgroup
`C = C_Γ(S)` to be Mathlib's `FixedPoints.subgroup S Γ` (glauberman line 94, the conjugate `η^a`;
hartley-turull line 302). No coprimality is assumed in this subsection. *Needs:* Mathlib
`MulDistribMulAction`, `arrowAction`, `FixedPoints.subgroup`, `SemidirectProduct.inl_aut`; Tau
Ceti `TauCeti.irreducibleCharacters`, `TauCeti.conjNormalFDRep`, `TauCeti.char_conjFDRep`,
`TauCeti.inertia`; InductionRestriction Layer 1.

- The action `s · χ` preserves class functions, characters, irreducibility, degrees
  `(s · χ)(1) = χ(1)` and the pairing `[s · χ, s · ψ] = [χ, ψ]`; so `S` permutes `Irr(Γ)` and
  `Irr_S(Γ)` is the fixed set.
- `s · χ` is the character of the conjugate of a representation affording `χ` by `inr s` in
  `Γ ⋊ S`; hence `χ ∈ Irr_S(Γ)` exactly when the inertia group `TauCeti.inertia` of a
  representation affording `χ` in `Γ ⋊ S` is everything.
- If `K` is the kernel of `S → MulAut Γ`, then `Irr_S(Γ) = Irr_{S/K}(Γ)` and `C_Γ(S) = C_Γ(S/K)`,
  for the induced action of `S/K`.
- In the internal case `S ≤ N_G(Γ)`, `(s · χ)(g) = χ(s⁻¹ g s)`.

**Checks.**
- `Γ = C₇ = ⟨r⟩`, `S = C₃` acting by `r ↦ r²`: `(s · χ)(r) = χ(r⁴)`; the only invariant
  irreducible character is the trivial one, `C = 1`, and the convention `χ(s • g)` would send `ζ₇`
  to `ζ₇²` instead of `ζ₇⁴`.
- `Γ = Q₈`, `S = C₃` acting as in `SL(2,3)`: `S` permutes the three nontrivial linear characters
  cyclically and fixes the trivial and the two-dimensional character, so `Irr_S(Q₈)` has two
  elements, and `C = Z(Q₈) = {±1}`.
- Trivial action, or `S = 1`: `Irr_S(Γ) = Irr(Γ)` and `C = Γ`.

### 1.2 Fixed classes under a coprime action

Let `S` be coprime to `Γ`, with `S` or `Γ` solvable. Prove: two elements of `C` that are conjugate
in `Γ` are conjugate in `C`; an `S`-invariant conjugacy class of `Γ` meets `C`; and if `H ≤ Γ` is
`S`-invariant and `s • (g H) = g H` for all `s`, the coset `g H` meets `C`. Hence `t ↦` (the
`Γ`-class of `t`) is a bijection from the conjugacy classes of `C` to the `S`-invariant conjugacy
classes of `Γ` (glauberman line 287, Lemma 3 (a)–(c), stated there for every relatively prime
operator group; the solvability hypothesis here is the one under which
InverseGaloisAndArithmeticFundamentalGroups IG.3.4 supplies the conjugacy of coprime complements).
Route, through Glauberman's lemma (isaacs, Chapter 13), proved from complements: let a finite
group `X`, on which `S` acts by automorphisms with `|X|` coprime to `|S|` and `S` or `X` solvable,
act transitively on a finite set `Ω` on which `S` also acts, compatibly:
`s · (x · ω) = (s • x) · (s · ω)`. Then `X ⋊ S` acts on `Ω`, and the stabiliser `M` of a point `ω`
satisfies `inl(X) M = X ⋊ S`, so `M ∩ inl(X)` is a normal subgroup of `M` of order dividing `|X|`
and index `|S|`. A complement of `M ∩ inl(X)` in `M` (Mathlib
`Subgroup.exists_right_complement'_of_coprime`) is a complement of `inl(X)` in `X ⋊ S`, hence
`z inr(S) z⁻¹` for some `z ∈ inl(X)` (IG.3.4), and `S` fixes `z⁻¹ · ω`. If `S` fixes `ω` and
`x · ω` with `x ∈ X`, then `inr(S)` and `x⁻¹ inr(S) x` are complements of `M ∩ inl(X)` in `M`, so
`x⁻¹ inr(S) x = y inr(S) y⁻¹` for some `y ∈ M ∩ inl(X)` (IG.3.4 in `M`, where `M ∩ inl(X)` is
solvable when `X` is and `M/(M ∩ inl(X)) ≅ S`); then `x y` normalises `inr(S)`, hence centralises
it, because a commutator `[x y, s]` lies in `inl(X) ∩ inr(S) = 1`, so `x y ∈ C_X(S)` and
`(x y) · ω = x · ω`: the `S`-fixed points of `Ω` form one `C_X(S)`-orbit. Apply this with `X = Γ`
acting by conjugation on a class (the class of `t ∈ C` is `S`-invariant and its `S`-fixed points
are its elements in `C`, which gives the first statement; the second is the existence of a fixed
point) and with `X = H` acting on `g H` by `h · x = x h⁻¹` (the third, `H` being solvable when `Γ`
is). *Needs:* InverseGaloisAndArithmeticFundamentalGroups IG.3.4, target *Conjugacy of coprime
complements*; Mathlib `Subgroup.exists_right_complement'_of_coprime`, `Subgroup.IsComplement'`,
`SemidirectProduct`, `MulAction.stabilizer`, `ConjClasses`, `FixedPoints.subgroup`.

**Checks.**
- `Q₈` with `C₃`: the invariant classes are `{1}` and `{−1}`, two, the number of classes of
  `C = {±1}`.
- Without coprimality the count fails: `S = ⟨t⟩` of order `2` acting on `S₃` by conjugation by a
  transposition `t` fixes all three classes, while `C = ⟨t⟩` has two classes.
- Without coprimality the coset statement fails: `C₂` swapping the factors of `Γ = C₂ × C₂` has
  `C` the diagonal, and the invariant coset `(1, 0) + C = {(1,0), (0,1)}` contains no fixed point.
- A nonsolvable `S` over a solvable `Γ`: `S = A₅` (order `60`) permuting the coordinates of
  `Γ = 𝔽₇⁵` (order `7⁵`). As `A₅` is transitive on five points, `C` is the line of constant
  vectors; the classes of the abelian `Γ` are its elements, so the `S`-invariant classes are the
  `7` elements of `C`, and `C` has `7` classes. The `S`-invariant subgroup `H = {Σ_i v_i = 0}` has
  the `S`-invariant cosets `{Σ_i v_i = c}`, each containing the constant vector with entries
  `3c = c/5`. A version requiring `S` solvable does not apply here; in the route, `X = H` is
  abelian and acts on the coset by translations, freely, so `M ∩ inl(H) = 1`, `M ≅ A₅` is a
  complement of `inl(H)` in `H ⋊ A₅`, and IG.3.4 applies through the solvability of `H`. Over
  `𝔽₅⁵`, where `5 ∣ |A₅|`, the invariant coset `{Σ_i v_i = 1}` contains no constant vector, since
  `5 c = 0`.

### 1.3 Brauer's permutation lemma for automorphisms

For a finite group `Γ` and `σ ∈ MulAut Γ`, prove that the number of `χ ∈ Irr(Γ)` with `χ ∘ σ = χ`
equals the number of conjugacy classes `K` with `σ(K) = K`. Consequently, for a cyclic group `A`
acting on `Γ`, `|Irr_A(Γ)|` equals the number of `A`-invariant classes, and for any finite `A` the
numbers of `A`-orbits on `Irr(Γ)` and on the classes agree (glauberman line 355, citing Brauer;
isaacs Theorem 6.32). Route: `σ` permutes the rows and the columns of the character table `X`,
giving permutation matrices with `P X = X Q`; `X` is invertible by column orthogonality, so
`tr P = tr Q`; Burnside's lemma gives the orbit count. *Needs:* Tau Ceti `TauCeti.characterTable`,
`TauCeti.sum_characterTable_mul_conj`; CharacterTheory §3.5; §1.1.

**Checks.**
- `C₃` with inversion: one fixed character, one fixed class; `Q₈` with an element of order `3`:
  two and two; an inner automorphism of `S₃`: three and three.
- For a noncyclic group the fixed-point counts of the whole group can differ:
  `A = ⟨a, b⟩ ≅ C₂ × C₂` acting on `𝔽₂³` by `a = 1 + E₁₂`, `b = 1 + E₁₃` fixes the two vectors of
  `𝔽₂ e₁` but the four characters `v ↦ (−1)^{w·v}` with `w₁ = 0`; each nonidentity element fixes
  four vectors and four characters and the identity fixes eight of each, as the lemma requires,
  and both orbit counts are `(8 + 4 + 4 + 4)/4 = 5`.
- `Γ = 1`: one character, one class.

### Examples

`SL(2,3) = Q₈ ⋊ C₃`: `Irr_S(Q₈) = {1, χ₂}`, `C = {±1}`, two invariant classes, and the counts of
§§1.2–1.3 are `2 = 2 = 2`.

### Dependencies

Mathlib actions, fixed points, semidirect products and conjugacy classes; Tau Ceti characters,
conjugation, inertia and the character table; Mathlib
`Subgroup.exists_right_complement'_of_coprime`, `Subgroup.IsComplement'` and
`MulAction.stabilizer`; InverseGaloisAndArithmeticFundamentalGroups IG.3.4; CharacterTheory §3.5;
InductionRestriction Layer 1.

## Layer 2: the canonical extension and Gallagher's correspondence

### 2.1 Gallagher's normalised extension

Let `Γ` be a group, `A` a finite group acting on `Γ` by automorphisms, `F` a field, `V` a nonzero
finite-dimensional `F`-vector space and `ρ` a representation of `Γ` on `V` all of whose
`F[Γ]`-endomorphisms are scalars. Assume `Nat.Coprime (Nat.card A) (finrank F V)` and that for
every `a ∈ A` the twisted representation `g ↦ ρ(a • g)` is isomorphic to `ρ`. Prove that there is
a unique representation `ρ*` of `Γ ⋊ A` on `V` with `ρ*(inl g) = ρ(g)` for all `g` and
`det ρ*(inr a) = 1` for all `a` (glauberman line 100, Theorem 1). Route: write
`m = finrank F V`. For each `a ∈ A` pick an automorphism of `V` intertwining `ρ` with its twist by
`a`; by the hypothesis on endomorphisms these operators form a projective representation of `A`
with a scalar-valued 2-cocycle. Taking determinants shows that the `m`-th power of the cocycle is
a coboundary, and multiplying the cocycle identity over all values of its last variable shows the
same for its `|A|`-th power; as `m` and `|A|` are coprime, the cocycle is a coboundary, and
rescaling the operators makes them a homomorphism from `A`. Its determinant `δ` is a linear
character of `A` with `δ^{|A|} = 1`; multiplying the operators by `δ^{−k}`, where
`k m ≡ 1 (mod |A|)`, makes every determinant `δ^{1 − k m} = 1`. Two normalised extensions differ
by a homomorphism from `A` to the scalars whose values have order dividing both `m` and `|A|`,
hence trivial. No finiteness of `Γ` and no coprimality with `|Γ|` is used. For
`inl(Γ) ⊴ Γ ⋊ A`, where the twist hypothesis makes the inertia group of `ρ` everything, the
existence part says that the scalar extension obstruction of InductionRestriction Layer 7 vanishes
(Tau Ceti defines this obstruction for simple representations over an algebraically closed field
only); the theorem adds the normalisation and uniqueness, over every field. *Needs:* Mathlib
`SemidirectProduct`, `LinearMap.det`; InductionRestriction Layer 7.

- For `B ≤ A`, the restriction of `ρ*` to `Γ ⋊ B` is the normalised extension for `B`.
- `ρ*` is natural for isomorphisms of `ρ` and commutes with scalar extension of `F`.

**Checks.**
- `Γ = 1`, `V = F = ℚ`, `A = C₂`: `ρ*` is trivial on `A`; the extension by the sign of `A` also
  extends `ρ` but has determinant `−1`.
- The coprimality is needed: `Γ = Q₈` with `A = C₂` acting by conjugation by `i` and `ρ` the
  two-dimensional representation over `ℂ`; the implementing operators of order dividing `2` are
  `±√−1 · ρ(i)`, both of determinant `−1`, so no extension has determinant `1`.
- `Γ = Q₈`, `A = C₃` as in `SL(2,3)`: `ρ*` is the natural embedding of `SL(2,3)` in `SL₂(ℂ)`; an
  element of order `3` has eigenvalues `ω, ω²`, trace `−1` and determinant `1`.
- `A = 1`: `ρ* = ρ`.

### 2.2 The canonical extension

For `Γ`, `S` finite and coprime and `χ ∈ Irr_S(Γ)`, prove that there is a unique `χ̂ ∈ Irr(Γ ⋊ S)`
with `χ̂ ∘ inl = χ` and `det χ̂` trivial on `inr(S)`, equivalently with `det χ̂` of order coprime
to `|S|`; call it the canonical extension of `χ` (glauberman line 234, Theorem 2 (a), and line
263; hartley-turull line 304, Definition 3.1). No solvability of `S` is assumed. The headline
`existsUnique_canonicalExtension` states it with the determinant read on a representation: there
is exactly one `χ̂ ∈ Irr(Γ ⋊ S)` with `χ̂ ∘ inl = χ` that is the character of a representation `ρ`
on some `Fin n → ℂ` with `det ρ(inr s) = 1` for every `s ∈ S`. Route: `χ(1) ∣ |Γ|` is coprime to
`|S|`; invariance gives the twisted isomorphisms by character recognition; §2.1 over `ℂ`. The two
normalisations agree because `det χ̂` restricted to `Γ` is `det χ`, of order dividing `|Γ|`, and a
linear character of `Γ ⋊ S` has order coprime to `|S|` exactly when it is trivial on `S`. *Needs:*
§2.1; Tau Ceti `TauCeti.Representation.finrank_dvd_card`,
`Representation.nonempty_equiv_of_character_eq`; §1.1.

- For `T ≤ S`, the canonical extension for `T` is the restriction of `χ̂` to `Γ ⋊ T`.
- For an automorphism `α` of `Γ ⋊ S` mapping `inl(Γ)` and `inr(S)` to themselves, the canonical
  extension of `χ ∘ α⁻¹` is `χ̂ ∘ α⁻¹`.
- For `j` coprime to `|Γ ⋊ S|`, the canonical extension of `χ^{(j)}` is `χ̂^{(j)}`.
- The canonical extension of the trivial character is trivial.

**Checks.**
- `SL(2,3)`: the canonical extension of the two-dimensional `χ₂` of `Q₈` is the character of the
  natural representation, value `−1` at an element of order `3`; the other extensions `χ̂ λ`, `λ`
  a nontrivial linear character of `C₃`, have `det = λ² ≠ 1` on `S`.
- Trivial action: `Γ ⋊ S = Γ × S` and `χ̂ = χ × 1_S`.
- `S₃ = C₃ ⋊ C₂`: the canonical extension of `1_{C₃}` is `1`, not `sgn`, whose determinant is `−1`
  on `C₂`.

### 2.3 Values of the canonical extension

Prove that for coprime positive integers `m`, `n`, `ℚ(ζ_m) ∩ ℚ(ζ_n) = ℚ` in `ℂ` and that
automorphisms of `ℚ(ζ_m)` and `ℚ(ζ_n)` extend to a common automorphism of `ℚ(ζ_{mn})` (glauberman
line 173, Lemma 1). Prove that `ℚ(χ̂) = ℚ(χ)` and that `χ̂(s) ∈ ℤ` for every `s ∈ S` (glauberman
line 238, Theorem 2 (b)); this is the headline `canonicalExtension_values`, for the character `χ̂`
characterised as in §2.2. Route: an automorphism fixing `ℚ(χ)` sends `χ̂` to an extension with the
same determinant normalisation, hence to `χ̂`; `χ̂(s)` is an algebraic integer in
`ℚ(χ) ∩ ℚ(ζ_{|S|}) ⊆ ℚ(ζ_{|Γ|}) ∩ ℚ(ζ_{|S|}) = ℚ`. *Needs:* §2.2; Mathlib `IsCyclotomicExtension`,
`IsPrimitiveRoot.autToPow`, `ZMod.chineseRemainder`, `IsGalois`, `IntermediateField.fixedField`,
`IsIntegral`, `Representation.isIntegral_character`; Tau Ceti
`IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply`, `FDRep.characterField`;
CharacterTheory §4.4.

**Checks.**
- `SL(2,3)`: all values of the canonical `χ̂` are rational (`2, −2, 0, −1, 1`), while `χ̂ ω` takes
  the value `−ω ∉ ℤ` at an element of order `3`.
- Trivial action of `C₂` on `C₃` with `χ(r) = ζ₃`: `χ̂(s) = 1` and `ℚ(χ̂) = ℚ(ζ₃) = ℚ(χ)`.
- `ℚ(ζ₄) ∩ ℚ(ζ₃) = ℚ`, while for the non-coprime pair `4, 8` the intersection is `ℚ(i)`.

### 2.4 Gallagher's correspondence

Let `N ⊴ G` be finite, `θ ∈ Irr(N)` and `χ̂ ∈ Irr(G)` with `χ̂|_N = θ`. Prove that
`β ↦ χ̂ · (β ∘ π)`, `π : G → G/N`, is a bijection from `Irr(G/N)` onto `Irr(G | θ)` (glauberman
line 240, Theorem 2 (c), citing Gallagher; isaacs Corollary 6.17); this is `gallagher_bijOn`, with
`Irr(G | θ)` the set of `χ ∈ Irr(G)` with `Σ_{n ∈ N} χ(n) θ(n⁻¹) ≠ 0`. Route: `θ` is
`G`-invariant, so its inertia group is `G`; a representation affording `χ̂` is a compatible
extension with trivial factor set, and `tensorRepEquiv`, `isIrreducible_tensorRep_iff` and
`tmulIntertwining_bijective` identify the irreducible representations of `G` over `θ` with the
tensor products by irreducible representations of `G/N`, the multiplicity space being recovered;
the character of the tensor product is the product of characters. This is the character form of
the tensor factorisation of InductionRestriction Layer 7 in the case of an ordinary extension.
*Needs:* Tau Ceti `TauCeti.IsProjectiveInertiaExtension`,
`TauCeti.IsProjectiveInertiaExtension.tensorRepEquiv`,
`TauCeti.IsProjectiveInertiaExtension.isIrreducible_tensorRep_iff`,
`TauCeti.IsProjectiveInertiaExtension.tmulIntertwining_bijective`, `TauCeti.inertia`;
InductionRestriction Layer 7. Applied with `N = Γ`, `G = Γ ⋊ S`, `χ̂` canonical, it describes
`Irr(Γ ⋊ S | χ)` as `{χ̂ β : β ∈ Irr(S)}`.

**Checks.**
- `SL(2,3)` over `χ₂`: `Irr(C₃)` has three members and `Irr(SL(2,3) | χ₂)` consists of the three
  two-dimensional characters `χ̂, χ̂ ω, χ̂ ω²`.
- Degenerate cases: `N = G` gives `{θ}`. For `N = 1` the hypothesis `χ̂|_1 = θ = 1` makes `χ̂` a
  linear character, not necessarily trivial, and the bijection is multiplication by `χ̂`, a
  permutation of `Irr(G)`: for `G = C₂` and `χ̂ = sgn` it exchanges `1` and `sgn`, and it is the
  identity only for `χ̂ = 1`.
- The extension hypothesis is needed: `N = Z(Q₈)`, `θ` the faithful linear character, has no
  extension to `Q₈`, and `Irr(Q₈ | θ)` has one member against `|Irr(Q₈/N)| = 4`.

### Examples

For `SL(2,3)` the canonical extension of `χ₂` is the natural two-dimensional character; its value
at an element `a` of order `3` is `−1`, at `−a` it is `1`, and its products with the three linear
characters of `C₃` are the three two-dimensional irreducible characters.

### Dependencies

Layer 1; Tau Ceti degree divisibility, character recognition, inertia, Galois action, field of
values and tensor factorisation; Mathlib semidirect products, determinants, cyclotomic fields,
Galois theory and the integrality of character values; CharacterTheory §4.4; InductionRestriction
Layer 7.

## Layer 3: the cyclic case

### 3.1 Cosets of a cyclic acting group

Let `A = ⟨a⟩` be cyclic and coprime to `Γ`. Prove: every element `inr a · inl g` of `Γ ⋊ A` is
conjugate to some `inr a · inl t` with `t ∈ C`; for `t₁, t₂ ∈ C`, `inr a · inl t₁` and
`inr a · inl t₂` are conjugate in `Γ ⋊ A` exactly when `t₁` and `t₂` are conjugate in `C`; and the
centraliser of `inr a · inl t` is `inr(A) · inl(C_C(t))` (glauberman line 266, Lemma 2). Route:
for `π` the set of primes dividing `|A|`, the `π`-part of `a g` (the power of `a g` whose order is
the largest divisor of the order of `a g` built from primes in `π`) has order `|A|`, because
`(a g)^{|A|}` lies in `Γ` and so has order prime to `|A|`; it generates a complement of `inl(Γ)`
in `Γ ⋊ A`, conjugate to `inr(A)` by an element of `inl(Γ)` by
InverseGaloisAndArithmeticFundamentalGroups IG.3.4, target *Conjugacy of coprime complements*,
since `inl(Γ)` is a normal subgroup of order coprime to its index and the quotient `A` is cyclic,
hence solvable; the conjugacy and centraliser statements use `k |Γ| ≡ 1 (mod |A|)` to recover `a`
as a power of `a t`. *Needs:* InverseGaloisAndArithmeticFundamentalGroups IG.3.4 (*Conjugacy of
coprime complements*); Mathlib `SemidirectProduct`, `IsCyclic`.

**Checks.**
- `S₃ = C₃ ⋊ C₂`: the coset of `a` consists of the three transpositions, all conjugate to `a`;
  `C = 1` and the centraliser of `a` is `⟨a⟩`.
- `SL(2,3)`: the coset `a Q₈` splits into the classes of `a` and of `a · (−1)`, of sizes
  `24/6 = 4` each, matching the two classes of `C = {±1}`. Here `π = {3}`: `a · (−1)` has order
  `6` and `3`-part `(a · (−1))⁴ = a`, of order `|A| = 3`; its `2`-part `(a · (−1))³ = −1` lies in
  `Q₈` and generates no complement. The complements of `Q₈` are the four subgroups of order `3`,
  one orbit under conjugation by `Q₈`, as IG.3.4 requires with the cyclic quotient `C₃`.
- Coprimality is needed: in `D₈ = C₄ ⋊ C₂` the reflection `a x` is not conjugate to `a` or to
  `a x²`, the only elements `a t` with `t ∈ C = {1, x²}`.

### 3.2 The cyclic correspondence and its sign

Let `A` be cyclic and coprime to `Γ`, `χ ∈ Irr_A(Γ)` and `χ̂` its canonical extension. Prove that
there are a unique sign `ε(χ)` and a unique `χ*_cyc ∈ Irr(C)` with `χ̂(a t) = ε(χ) χ*_cyc(t)` for
all `t ∈ C` and every generator `a` of `A`, and that `χ ↦ χ*_cyc` is a bijection
`Irr_A(Γ) → Irr(C)` (glauberman line 299, Theorem 3; hartley-turull line 306, Proposition 3.2, for
the sign as a function of cyclic subgroups). Route: independence of the generator from the
power-map value law and `ℚ(χ̂) ⊆ ℚ(ζ_{|Γ|})`; the class function `Σ_β β(a⁻¹) χ̂ β` and Gallagher
give `Σ_{g ∈ Γ} |χ̂(a g)|² = |Γ|`; writing `χ̂|_{A × C}` through the products of irreducible
characters of `A` and `C` gives `χ̂(a t) = Σ_λ m_λ λ(t)` with rational integers `m_λ`, and §3.1,
which makes the sum of `|χ̂|²` over the coset `a Γ` equal to `|Γ : C|` times its sum over `a C`,
turns the norm identity into `Σ_λ m_λ² = 1`; injectivity uses Gallagher again and surjectivity
the counts of §§1.2–1.3. *Needs:* §§1.2, 1.3, 2.2–2.4, 3.1; CharacterTheory §§3.6, 4.4; Tau Ceti
`IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply`.

- The pair `(ε(χ), χ*_cyc)` is determined by the function `t ↦ χ̂(a t)` on `C`.
- `ε(χ) χ*_cyc(1) = χ̂(a) ∈ ℤ`.

**Checks.**
- `SL(2,3)`: `χ̂(a) = −1` and `χ̂(−a) = 1` give `ε = −1` and `χ₂*_cyc = sgn` on `C = {±1}`; the
  same values arise for the generator `a²`. A rule without the sign cannot produce an irreducible
  character from `t ↦ χ̂(a t)` here.
- Trivial action of `C₂` on `C₃`: `χ̂(a t) = χ(t)`, so `ε = 1` and `χ*_cyc = χ`.
- `C₂` inverting `C₅`: `Irr_A(Γ) = {1}`, `C = 1`, and `χ̂(a) = 1` gives `ε = 1`.
- `A = 1`: the generator is `1`, `χ̂ = χ`, `ε = 1` and `χ*_cyc = χ`.

### 3.3 One element of the acting group

For `A` coprime to `Γ` (not necessarily cyclic), `χ ∈ Irr_A(Γ)`, `a ∈ A` and `C_a = C_Γ(a)`, prove
that there are a sign `ε` and `λ ∈ Irr(C_a)` with `χ̂(a t) = ε λ(t)` for all `t ∈ C_a` (glauberman
line 364, Corollary 4). Route: the restriction of `χ̂` to `Γ ⋊ ⟨a⟩` is the canonical extension
there (§2.2); apply §3.2. *Needs:* §§2.2, 3.2.

**Checks.**
- `SL(2,3)`, `a` of order `3`: `C_a = {±1}`, `ε = −1`, `λ = sgn`.
- `a = 1`: `C_a = Γ`, `ε = 1`, `λ = χ`.
- A noncyclic `A = C₃ × C₃` acting on `Q₈` through its first factor as in `SL(2,3)`: the canonical
  extension of `χ₂` is `η × 1` on `SL(2,3) × C₃`; for `a` in the kernel of the action, `C_a = Q₈`,
  `ε = 1` and `λ = χ₂`, while for `a` acting nontrivially `C_a = {±1}`, `ε = −1` and `λ = sgn`.

### 3.4 Glauberman's restriction formulas

Let `A` be cyclic and coprime to `Γ`, `B < A` such that `C_Γ(a) = C` for every `a ∈ A ∖ B`,
`χ ∈ Irr_A(Γ)` and `λ = χ*_cyc`. Prove that there are a sign `ε'` and a linear character `θ₀` of
`A` with `θ₀² = 1` such that: (a) `χ̂(a t) = ε' θ₀(a) λ(t)` for `a ∈ A ∖ B`, `t ∈ C`; (b) if
`χ|_C = ε' λ` then `ε' = 1` and `Γ = C · ker χ`, and otherwise `|A : B|⁻¹ (χ|_C − ε' λ)` is a
character of `C` (glauberman line 375, Corollary 5 (a)–(b), and line 454, Corollary 6 (c) for
`B = 1`). For a generator `a`, `ε' θ₀(a) = ε(χ)`. When `|A|` is odd, `θ₀² = 1` forces `θ₀ = 1`
and `ε' = ε(χ)`. When `|A|` is even, `θ₀` is trivial or the unique linear character of `A` of
order `2`, which is `−1` at every generator, and in the second case `ε' = −ε(χ)`: for `|A| = 2`
and `B = 1` both choices satisfy (a) and (b), and for `|A| = 4` the second can be forced (Checks).
Route: for a faithful linear character `ξ` of `A/B`, inflated to `Γ ⋊ A`, the virtual character
`χ̂ − χ̂ ξ` vanishes on `Γ ⋊ B` and has norm `2`, its two terms being distinct (their determinants
on `inr(A)` are `1` and `ξ^{χ(1)} ≠ 1`). For `a ∈ A ∖ B` the fixed points of `⟨a⟩` are `C`, so §3.1
for `⟨a⟩` makes the sum of `|χ̂ − χ̂ ξ|²` over the coset `a Γ` equal to `|Γ : C|` times its sum over
`a C`; hence the restriction to `A × C = inr(A) · inl(C)` also has norm `2` and is the difference of
two distinct irreducible characters of `A × C`, each a linear character of `A` times an irreducible
character of `C` (CharacterTheory §3.6). Vanishing on `C` gives the two the same factor on `C`,
which is `λ` by §3.3 at the elements of `A ∖ B` and §3.2 at a generator; comparing the factors on
`A` there shows that their product is `ξ` and that at least one of them squares to `1`; such a
factor is a `θ₀` for (a), with `ε' = 1` when it belongs to the term with sign `+` and `ε' = −1`
otherwise. For (b), by (a) the class function `χ̂|_{A × C} − ε' θ₀ λ` vanishes off `B × C`, so it is
unchanged by multiplication by `ξ`; its restriction `χ|_C − ε' λ` to `C` is therefore `|A : B|`
times a virtual character `Δ`, whose multiplicities away from `λ` are those of `χ|_C` divided by
`|A : B|`, while `[χ|_C, λ] = ε' + |A : B| [Δ, λ] ≥ 0` with `|A : B| ≥ 2` excludes `[Δ, λ] < 0`. If
`χ|_C = ε' λ`, then `ε' = 1` and `χ̂(a) = θ₀(a) χ(1)` for a generator `a`, so `inr a` acts by a
scalar in a representation affording `χ̂` (CharacterTheory §4.1); hence `a` fixes every coset of
`ker χ`, and the coset statement of §1.2 gives `Γ = C · ker χ`. *Needs:* §§1.2, 2.2, 3.1, 3.2, 3.3;
CharacterTheory §§3.6, 4.1.

**Checks.**
- `SL(2,3)`, `B = 1`: `ε' = ε = −1`, `χ₂|_C = 2 sgn ≠ −sgn` and `(2 sgn + sgn)/3 = sgn` is a
  character.
- `χ = 1`: `χ|_C = 1 = ε' λ` with `ε' = 1`, and `Γ = C · Γ`.
- The extraspecial group `3^{1+2}_+` with the involution `a` of §4.2, `B = 1`, and a faithful `χ`
  of degree `3`: `χ|_C = 3 ω`; the eigenvalues of `inr a` are `±1` with product `1` and
  `|χ̂(a)| = χ*_cyc(1) = 1`, so they are `−1, −1, 1`, `χ̂(a) = −1`, `ε(χ) = −1` and `λ = ω`. The
  choice `ε' = 1` with `θ₀` the nontrivial character of `A` gives `(3 ω − ω)/2 = ω`, and the
  choice `ε' = −1`, `θ₀ = 1` gives `(3 ω + ω)/2 = 2 ω`, both characters.
- `|A| = 4` can force the nontrivial `θ₀`: `A = ⟨a⟩ ≅ C₄` acting on `Γ = 3^{1+2}_+`, with
  multiplication `(x, y, z)(x', y', z') = (x + x', y + y', z + z' + x y')`, by
  `a · (x, y, z) = (−y, x, z − x y)`, an automorphism whose square is the involution of §4.2;
  every `a^j ≠ 1` has fixed points `C = Z(Γ)`, so `B = 1` qualifies. For a faithful `χ` of degree
  `3`, `χ|_C = 3 ω`. By §2.2 the canonical extension restricts on `Γ ⋊ ⟨a²⟩` to that of the
  previous Check, so `χ̂(a²) = −1`; the eigenvalues of `inr a` square to `−1, −1, 1`, their product
  is `1` and their sum `χ̂(a)` is an integer (§2.3), so they are `i, −i, 1`, `χ̂(a) = 1`,
  `ε(χ) = 1` and `λ = ω`. Then (a) at `a²`, where `θ₀(a²) = 1`, gives `ε' = −1`, and (a) at `a`
  gives `θ₀(a) = −1`, so `ε' = −ε(χ)`; (b) reads `(3 ω + ω)/4 = ω`, whereas `ε' = 1` would give
  `ω/2`.
- `C₂` inverting the `C₅` factor of `Γ = C₃ × C₅`, `B = 1`, `χ = ψ × 1`: `χ|_C = ψ = λ`, and
  `Γ = C · ker χ = C₃ · C₅`.

### Examples

For `A` of prime order `p`, §3.4 (b) says that `χ|_C − ε' χ*_cyc` is zero or `p` times a character
for a suitable sign `ε'`; for `SL(2,3)` it is `3 sgn`.

### Dependencies

Layers 1–2; Mathlib semidirect products and cyclic groups; Tau Ceti Galois action on characters;
InverseGaloisAndArithmeticFundamentalGroups IG.3.4; CharacterTheory §§3.6, 4.1, 4.4.

## Layer 4: the solvable case

### 4.1 Induced actions and the composition-series correspondence

Let `S` be solvable and coprime to `Γ`. For `T ⊴ S`, `S/T` acts on `C_Γ(T)` by Mathlib's quotient
action, coprimely, with fixed subgroup `C_Γ(S)`. Prove that for a group `B` acting on `Γ` by
automorphisms (no coprimality required of `B`) and a cyclic normal subgroup `A ⊴ B` coprime to
`Γ`, acting by restriction, the cyclic correspondence of §3.2 commutes with every `β ∈ B`: `β`
preserves `C_Γ(A)` and `(β · χ)*_cyc = β · χ*_cyc` (glauberman line 481, Lemma 4; the canonical
extension of `β · χ` is the transport of `χ̂` along the automorphism of `Γ ⋊ A` induced by `β`,
§2.2). For a composition series `S = S₀ ⊵ ⋯ ⊵ S_m = 1`, define `Λ_C : Irr(C_Γ(S)) → Irr(Γ)` by
`λ₀ = λ` and `λ_i = Λ^{cyc}_i(λ_{i−1})`, where `Λ^{cyc}_i : Irr(C_Γ(S_{i−1})) → Irr(C_Γ(S_i))` is
the inverse of the cyclic correspondence for `S_{i−1}/S_i` acting on `C_Γ(S_i)`, and
`Λ_C(λ) = λ_m` (glauberman line 503, Definition (a)). When every `S_i` is normal in `S`, prove
that each `λ_i` is `S`-invariant and that the inverse construction is defined on `Irr_S(Γ)` and
inverts `Λ_C` (glauberman line 524, Lemma 5). *Needs:* §§2.2, 3.2; Mathlib
`MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)`, `Group.IsSolvable`.

- The identification `C_{C_Γ(T)}(S/T) = C_Γ(S)` is an equality of subgroups of `Γ`.
- `Λ_C` for a series of length one is the inverse of the cyclic correspondence.
- `Λ_C(λ)` lies in `Irr(Γ)` for every `λ ∈ Irr(C_Γ(S))`.

**Checks.**
- `S = C₃` on `Q₈`: the series `C₃ ⊵ 1` gives `Λ_C(sgn) = χ₂` and `Λ_C(1) = 1`.
- `S = C₁₅ = C₃ × C₅` acting on `Γ = Q₈ × C₁₁` (`gcd(15, 88) = 1`), the `C₃` factor on `Q₈` as in
  `SL(2,3)` and a generator of the `C₅` factor sending `r` to `r³` in `C₁₁` (the powers of `3`
  modulo `11` are `3, 9, 5, 4, 1`, so this action has order `5` and fixes only `1`):
  `C = {±1} × 1`. Along `C₁₅ ⊵ C₃ ⊵ 1` the first step, for `C₅` on `C_Γ(C₃) = {±1} × C₁₁`, sends
  `sgn` to `sgn × 1`, and the second, for `C₃` on `Γ`, sends it to `χ₂ × 1`; along `C₁₅ ⊵ C₅ ⊵ 1`
  the first step, for `C₃` on `C_Γ(C₅) = Q₈ × 1`, sends `sgn` to `χ₂`, and the second, for `C₅` on
  `Γ`, sends it to `χ₂ × 1`. Every factor acts coprimely, whereas an acting group of even order on
  a group containing `Q₈`, such as `C₆` on `Q₈ × C₅` with `gcd(6, 40) = 2`, is outside the
  construction.
- `S = 1`: the empty series and `Λ_C = id`.

### 4.2 The `p`-group case

Let `S` be a `p`-group coprime to `Γ` and `C` a composition series. Prove that for every
`λ ∈ Irr(C_Γ(S))` there is a sign `ε` such that `(Λ_C(λ)|_C − ε λ)/p` is zero or a character of
`C` (glauberman line 540, Theorem 4 (a)). Route: induction on `|S|` through the first term `S₁`,
which is normal in `S` of index `p`. The last term `S_{m−1}` need not be normal in `S`, and then
`S` does not act on `C_Γ(S_{m−1})`: for the monomial `D₈ ≤ GL₂(3)` acting on `𝔽₃²` and the series
`D₈ ⊵ V₄ ⊵ ⟨diag(1, −1)⟩ ⊵ 1`, the swap carries `C_Γ(⟨diag(1, −1)⟩) = 𝔽₃ × 0` to `0 × 𝔽₃`. Let
`λ₁ ∈ Irr(C_Γ(S₁))` be the first step of the construction of `Λ_C(λ)`: `λ` is the cyclic
correspondent of `λ₁` for `S/S₁` acting on `C_Γ(S₁)`, whose fixed subgroup is `C`, and `Λ_C(λ)`
is the image of `λ₁` along the series `S₁ ⊵ ⋯ ⊵ S_m` of `S₁`. The induction hypothesis for `S₁`
acting on `Γ` gives a sign `ε₁` with `Λ_C(λ)|_{C_Γ(S₁)} − ε₁ λ₁ = p X`, and §3.4 (b) with `B = 1`
for `S/S₁` gives a sign `ε₀` with `λ₁|_C − ε₀ λ = p Y`, where `X` and `Y` are zero or characters.
Restricting the first identity to `C` and adding `ε₁` times the second,
`Λ_C(λ)|_C − ε₁ ε₀ λ = p (X|_C + ε₁ Y)`, so the quotient by `p` is a virtual character of `C`. Its
multiplicities away from `λ` are those of `Λ_C(λ)|_C` divided by `p`, hence nonnegative, and its
multiplicity at `λ` is the integer `([Λ_C(λ)|_C, λ] − ε₁ ε₀)/p`, nonnegative because
`[Λ_C(λ)|_C, λ] ≥ 0` is congruent to `ε₁ ε₀ = ±1` modulo `p`; so `ε = ε₁ ε₀` works. *Needs:*
§§3.4, 4.1.

**Checks.**
- `SL(2,3)`: `Λ(sgn)|_C = χ₂|_C = 2 sgn`, `ε = −1`, `(2 sgn + sgn)/3 = sgn`.
- The extraspecial group `Γ = 3^{1+2}_+` with `S = C₂` acting by `(x, y, z) ↦ (−x, −y, z)`:
  `C = Z(Γ)`, a faithful three-dimensional `χ` restricts to `3 ω` for a linear `ω` of `Z(Γ)`, and
  `(3 ω − ω)/2 = ω`.
- `S = 1`: `Λ(λ) = λ`, `ε = 1` and the quotient is zero.

### 4.3 Agreement with the cyclic case and independence of the series

Prove that for cyclic `S`, `Λ_C` is the inverse of the cyclic correspondence of §3.2 for every
composition series `C`, and that for solvable `S`, `Λ_C = Λ_D` for any two composition series
(glauberman line 542, Theorem 4 (b), (c)). Consequently, for any chain `1 = T₀ ⊴ T₁ ⊴ ⋯ ⊴ T_r = S`
with each `T_{i+1}/T_i` a `p_i`-group, `Λ` is the composite of the `p_i`-group correspondences of
`T_{i+1}/T_i` on `C_Γ(T_i)`, by refining the chain to a composition series. Route: induction
on `|S|`, with §4.2 for prime-power order, §3.4 (b) for the cyclic `p`-group
case, for cyclic `S` not of prime-power order the decomposition `S = P × E` into its Sylow
`p`-subgroup `P` and its Hall `p'`-subgroup `E`, where `p = |S : S₁|` is the order of the top
factor of the series (glauberman line 562), with §§2.2, 3.2, and for two series with different
first terms the quotient by their intersection. *Needs:* §§3.2, 3.4, 4.1, 4.2.

**Checks.**
- The two series of `C₁₅` acting on `Q₈ × C₁₁` in §4.1 give the same `Λ(sgn) = χ₂ × 1`.
- `S = C₉` acting on `Γ = C₁₉` through `C₉ ≤ Aut(C₁₉) ≅ C₁₈`: `C = 1`, `Irr_S(Γ) = {1}`, and the
  unique series agrees with §3.2.
- `S` acting trivially: every series gives the identity of `Irr(Γ)`.

### 4.4 Equivariance, bijectivity and the count

Write `Λ = Λ_C` (§4.3). Prove: if `S ⊴ B` for a group `B` acting on `Γ`, then
`Λ(β · λ) = β · Λ(λ)` for `β ∈ B` (glauberman line 601, Corollary 7); `Λ(λ) ∈ Irr_S(Γ)` and
`Λ : Irr(C_Γ(S)) → Irr_S(Γ)` is a bijection (glauberman line 607, Corollary 8); and
`|Irr_S(Γ)| = |Irr(C_Γ(S))|`, which is the number of `S`-invariant conjugacy classes of `Γ`, so
`S` fixes a nontrivial irreducible character whenever `C_Γ(S) ≠ 1` (glauberman line 623, Corollary
9). The last statement is Brauer's permutation lemma for a coprime solvable acting group. The
headline `ncard_invariantIrreducibleCharacters` states the count: for `S` solvable and coprime to
`Γ`, `|Irr_S(Γ)| = |Irr(C)|`, and `|Irr_S(Γ)|` is the number of conjugacy classes `c` of `Γ` with
`s • g ∈ c` for all `s ∈ S` and `g ∈ c`. *Needs:* §§1.2, 4.1, 4.3; Tau Ceti
`TauCeti.card_irreducibleCharacters`.

**Checks.**
- `SL(2,3)`: `2 = 2 = 2`; the extraspecial example of §4.2: `3 = 3 = 3`.
- `C₇ ⋊ C₃` with the automorphism inverting `C₇` and fixing `C₃`: `C = C₃`, the two
  three-dimensional characters are swapped, and `3 = 3 = 3`.
- `C₃` acting on `C₇` by `r ↦ r²`: `1 = 1 = 1`.

### 4.5 The Glauberman correspondence

Prove that there is exactly one assignment, to every finite group `Γ` in a fixed universe and
every finite solvable `S` in a fixed universe acting on it coprimely, of a bijection
`π(Γ, S) : Irr_S(Γ) → Irr(C_Γ(S))`, such that: when `S` is a `p`-group, `π(Γ, S)(χ)` is an
irreducible constituent of `χ|_C` of multiplicity prime to `p`; and, for every `T ⊴ S` and every
`χ ∈ Irr_S(Γ)`, the character `π(Γ, T)(χ)` of `C_Γ(T)` is `S/T`-invariant and
`π(Γ, S)(χ) = π(C_Γ(T), S/T)(π(Γ, T)(χ))`; the invariance is part of the law, since only then is
`π(Γ, T)(χ)` in `Irr_{S/T}(C_Γ(T))`, the domain of `π(C_Γ(T), S/T)`, and for the family
constructed here it holds by §4.4 (glauberman line 537, Theorem 4, line 601, Corollaries 7–8;
spath-vallejo line 118 and line 129 for the compatibility law; navarro-2018, Chapter 2, for the
uniqueness formulation). For a `p`-group `S` prove further that for every `χ ∈ Irr_S(Γ)` there is
exactly one `λ ∈ Irr(C)` with `p ∤ [χ|_C, λ]`, that `[χ|_C, λ] ≡ ±1 (mod p)` and that
`[χ|_C, μ] ≡ 0 (mod p)` for all other `μ ∈ Irr(C)` (glauberman line 540, Theorem 4 (a); isaacs,
Chapter 13). Define the **Glauberman correspondence** by `θ* = π(Γ, S)(θ)`. Route: existence with
`π(Γ, S) = Λ⁻¹` (§§4.3–4.4), the compatibility law by choosing a composition series through `T`,
the `p`-group property from §4.2; uniqueness by induction on `|S|` through a normal subgroup `T`
of prime index, which exists for solvable `S ≠ 1`, the factor `π(C_Γ(T), S/T)` being fixed by the
`p`-group property. *Needs:* §§4.2–4.4.

In `Suggested.lean` a family is a function `π` giving, for all `Γ`, `S` and actions, a map
`(Γ → ℂ) → (C_Γ(S) → ℂ)`; its values off `Irr_S(Γ)`, and for nonsolvable or noncoprime pairs, are
unconstrained. `IsGlaubermanFamily` holds of `π` when, for every solvable `S` acting coprimely on
`Γ`, three laws hold: `π(Γ, S)` maps `Irr_S(Γ)` bijectively onto `Irr(C_Γ(S))`; if `S` is a
`p`-group then `p ∤ [χ|_C, π(Γ, S)(χ)]`; and for every `T ⊴ S`, `π(Γ, T)(χ)` lies in
`Irr_{S/T}(C_Γ(T))` and the values of `π(C_Γ(T), S/T)(π(Γ, T)(χ))` and of `π(Γ, S)(χ)` agree at
elements of `C_{C_Γ(T)}(S/T)` and of `C_Γ(S)` with the same image in `Γ`. The headlines are
`exists_isGlaubermanFamily`, the existence, and `IsGlaubermanFamily.apply_eq`, the uniqueness: two
families satisfying the laws agree on `Irr_S(Γ)` for every solvable coprime pair. The `p`-group
statement is the headline `existsUnique_restrict_pairing_not_dvd`: exactly one `λ ∈ Irr(C)` has
`[χ|_C, λ]` a natural number prime to `p`, and every multiplicity prime to `p` is `≡ ±1 (mod p)`.

- For the trivial action, or `S = 1`, `θ* = θ`.
- `π(Γ, S)` is computed by every chain of subnormal subgroups with prime-power factors (§4.3).
- For cyclic `S`, `θ* = θ*_cyc` (§3.2): for a generator `a` and the canonical extension `χ̂`,
  `χ̂(a t) = ε θ*(t)` for all `t ∈ C` with a sign `ε = ±1`. This is the headline
  `IsGlaubermanFamily.exists_sign_of_isCyclic`, stated for every family with the laws above and
  every `a` whose powers exhaust `S`.
- If `K` is the kernel of the action, `π(Γ, S) = π(Γ, S/K)`.

**Checks.**
- `SL(2,3)`: `χ₂* = sgn` and `1* = 1`; the multiplicity `[χ₂|_C, sgn] = 2 ≡ −1 (mod 3)`.
- `S = C₂` swapping the factors of `Γ = C₃ × C₃`: `C` is the diagonal, `Irr_S(Γ) = {ψ_a × ψ_a}`,
  and `(ψ_a × ψ_a)* = ψ_{2a}` on the diagonal (`ψ_a(r) = ζ₃^a`), not `ψ_a`.
- Coprimality is needed: `C₂` swapping the factors of `C₂ × C₂` fixes the characters `(1,1)` and
  `(−1,−1)`, both restricting to the trivial character of the diagonal with multiplicity `1`, so
  no injective assignment with the `p`-group property exists.
- The law at its ends: for `T = 1` it says that `π(Γ, 1)(χ) = χ` is `S`-invariant, true for
  `χ ∈ Irr_S(Γ)`; for `T = S` it reads `π(Γ, S) = π(C, 1) ∘ π(Γ, S)`, where `π(C, 1)` is the
  identity, since the trivial group is a `p`-group for every `p` and `λ` is the only constituent
  of `λ|_C = λ`, of multiplicity `1`. For `S = C₆` and `T = C₃` it gives
  `π(Γ, C₆) = π(C_Γ(C₃), C₂) ∘ π(Γ, C₃)`, both factors fixed by the `p`-group property at `p = 3`
  and `p = 2`.

### 4.6 Equivariance under automorphisms and fields

Let `S` be solvable and coprime to `Γ` and `θ ∈ Irr_S(Γ)`. Prove: (a) if `α ∈ MulAut Γ` and
`φ ∈ MulAut S` satisfy `α(s • g) = φ(s) • α(g)`, equivalently `α` and `φ` come from an
automorphism of `Γ ⋊ S` preserving `inl(Γ)` and `inr(S)`, then `α(C) = C` and
`(θ ∘ α⁻¹)* = θ* ∘ α⁻¹`; (b) for `j` coprime to `|Γ|`, `(θ^{(j)})* = (θ*)^{(j)}`; (c)
`ℚ(θ*) = ℚ(θ)` as subfields of `ℂ`; (d) `[θ|_C, θ*] ≠ 0` (glauberman line 636, Theorem 5 (a)–(d)).
Route: (a) from §4.4 after reducing to a faithful action and taking `B` generated by `S` and `α`
in `MulAut Γ`; (b) for prime order from §3.2 with `j' ≡ j (mod |Γ|)`, `j' ≡ 1 (mod |S|)`, then by
the compatibility law; (c) from (b) and the Galois correspondence in `ℚ(ζ_{|Γ|})`; (d) from §4.5
for prime order and the compatibility law. For every family with the laws of §4.5, (d) is the
headline `IsGlaubermanFamily.restrict_pairing_ne_zero`, `Σ_{t ∈ C} θ(t) θ*(t⁻¹) ≠ 0`, and (c) is
the headline `IsGlaubermanFamily.adjoin_range_eq`, the equality of the intermediate fields of `ℂ`
over `ℚ` generated by the values. *Needs:* §§2.3, 3.2, 4.4, 4.5; Tau Ceti
`IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply`, `FDRep.characterField`;
CharacterTheory §4.4.

**Checks.**
- (a) for `C₂` swapping `C₃ × C₃` and `α` the inversion of `Γ`, which commutes with the swap:
  `α|_C` is the inversion and `(ψ_{−a} × ψ_{−a})* = ψ_{−2a} = ψ_{2a} ∘ α⁻¹`.
- (b) on the same example with `j = 2`: `(ψ_{2a} × ψ_{2a})* = ψ_{4a} = ψ_a = (ψ_{2a})^{(2)}`.
- (c) and (d) for `SL(2,3)`: `ℚ(χ₂) = ℚ = ℚ(sgn)` and `[χ₂|_C, sgn] = 2 ≠ 0`.

### Examples

For `SL(2,3)` the correspondence is `1 ↦ 1`, `χ₂ ↦ sgn`; for the swap action on `C₃ × C₃` it is
`ψ_a × ψ_a ↦ ψ_{2a}`; for the extraspecial group `3^{1+2}_+` with the involution of §4.2 it sends
the two faithful three-dimensional characters to the two nontrivial linear characters of `Z(Γ)`
with the same central character.

### Dependencies

Layers 1–3; Mathlib quotient actions on fixed points and solvable groups; Tau Ceti character
counts, Galois action and fields of values; CharacterTheory §4.4.

## Layer 5: degree relations

### 5.1 The degree bound

For `S` solvable and coprime to `Γ` and `θ ∈ Irr_S(Γ)`, prove `θ(1) ∣ |Γ : C| θ*(1)` (glauberman
line 644, Theorem 5 (e)); the headline `IsGlaubermanFamily.index_mul_degree_eq` states it for
every family with the laws of §4.5 as `|Γ : C| θ*(1) = q θ(1)` for a natural number `q`. Route: by
the compatibility law and multiplicativity of indices it suffices to treat `S = A` of prime order;
there `[Γ ⋊ A : C_{Γ ⋊ A}(a)] χ̂(a)/χ̂(1)` is an algebraic integer (central-character
integrality), `C_{Γ ⋊ A}(a) = A × C` (§3.1), `χ̂(1) = θ(1)` and `χ̂(a) = ±θ*(1)` (§3.2), so
`|Γ : C| θ*(1)/θ(1)` is a rational algebraic integer. *Needs:* §§3.1, 3.2, 4.5; Tau Ceti
`TauCeti.Representation.isIntegral_centralCharacter_classSumCenter`,
`TauCeti.Representation.centralCharacter_classSumCenter_mul_character_one`; CharacterTheory §4.3.

**Checks.**
- `SL(2,3)`: `2 ∣ 4 · 1`.
- The extraspecial example: `3 ∣ 9 · 1`; trivial action: `θ(1) ∣ 1 · θ(1)`.
- The reverse divisibility fails: for `θ = 1` and `C ≠ Γ`, `|Γ : C| · 1 ∤ 1`.

### 5.2 Glauberman degree-divisibility

Define **Glauberman degree-divisibility** (for a universe of groups) as the proposition: for every
finite `Γ`, every finite solvable `S` acting coprimely and every `θ ∈ Irr_S(Γ)`, `θ*(1) ∣ θ(1)`
(geck line 29; hartley-turull line 84, Theorem A). Prove that it is equivalent to its case of `S`
of prime order, where `θ*` is the constituent of `θ|_C` of multiplicity prime to `|S|`
(hartley-turull line 91 for the reduction), by the compatibility law and transitivity of
divisibility. Prove that `θ* = θ|_C` whenever `θ|_C` is irreducible, by §4.6 (d); in particular
for abelian `Γ` and for the trivial action, so the divisibility holds in these cases. The
proposition holds for all finite groups by Hartley and Turull's reduction completed by Geck (geck
line 34): this is cited and not planned, since it rests on the classification and on Lusztig's
theory. *Needs:* §§4.5, 4.6.

- If the proposition holds, `θ*(1) ∣ θ(1) ∣ |Γ : C| θ*(1)` for every `θ ∈ Irr_S(Γ)` (§5.1).

**Checks.**
- `SL(2,3)`: `χ₂*(1) = 1 ∣ 2`; the extraspecial example: `1 ∣ 3`.
- Abelian `Γ`: every `θ` is linear and `θ* = θ|_C`, `1 ∣ 1`.
- The variant `θ(1) ∣ θ*(1)` is false: `2 ∤ 1` for `SL(2,3)`.

### Examples

For `S` of prime order `p` and `θ|_C = ε θ* + p Δ` (§4.5), `θ(1) ≡ ε θ*(1) (mod p)`; for
`SL(2,3)`, `2 ≡ −1 (mod 3)`.

### Dependencies

Layers 3–4; Tau Ceti central characters; CharacterTheory §4.3.

## Layer 6: heights

### 6.1 Central characters of blocks, Osima's formula and defect classes

Let `(K, O, k)` be the system of Conventions at a place `v` of `F` over `p`, and `B` a block.
Prove:

- Change of system. Let `H` be a finite group and `(K', O', k')` a splitting `p`-modular system of
  `H`. A primitive `exp(H)`-th root of unity of `K'` embeds `F_H = ℚ(ζ_{exp H})` in `K'`; as the
  ring of integers `O_{F_H}` is integral over `ℤ`, it lands in `O'`, and `m' ∩ O_{F_H}` is a
  nonzero prime containing `p`, the prime of a finite place `w` of `F_H` over `p`. The valuation
  of `K'` restricts on `F_H` to one equivalent to the `w`-adic valuation, so the closure of `F_H`
  in `K'` is a complete field in which `F_H` is dense, a copy of the completion `K_w`, with
  `O_w = O' ∩ K_w`, `m_w = m' ∩ O_w` and residue fields `k_w ⊆ k'`. Let `X` be a subgroup, a
  quotient or a quotient of a subgroup of `H`. Then `k_w` splits `X` (base §2.3), so scalar
  extension `e_B ↦ 1 ⊗ e_B` is a bijection from the blocks of `k_w[X]` to those of `k'[X]`,
  keeping the coefficients `a_B(𝒞)`, extending `λ_B`, and keeping the defect classes, the Brauer
  projections `Br_P(e_B)`, the defect groups and the principal block (the scalar extension of base
  §6.2); the central lift of `1 ⊗ e_B` is the image of the central lift of `e_B` under
  `O_w[X] → O'[X]` (uniqueness of central lifts, base §1.3). Every irreducible `K'`-representation
  of `X` is the scalar extension of an irreducible `K_w`-representation, as `K_w` contains a
  primitive `exp(X)`-th root of unity and splits `X` (CharacterTheory §4.5), with the same
  character read through `K_w ⊆ K'` and the same degree, so `Irr(1 ⊗ B) = Irr(B)`. The simple
  `k_w[X]`-modules stay simple over `k'` and give all simple `k'[X]`-modules (the radical base
  change of base §2.3), with the same Brauer characters, so `IBr(1 ⊗ B) = IBr(B)` with the same
  decomposition numbers (base §2.4, change of splitting modular system). Covering, the stabiliser
  of a block, block induction and the Brauer correspondent are defined through idempotents and
  central characters (base §§6.2, 7.1, 8.2) and are carried over. So a statement of Layers 6–9
  about the blocks of `H` and of its subquotients, their ordinary and Brauer characters, degrees
  and defect groups holds at `(K', O', k')` exactly when it holds at the system at the place `w`.
- for `χ ∈ Irr(B)`, the `K`-linear map `ω_χ : Z(K[G]) → K` of Conventions is a `K`-algebra
  homomorphism, and for every class `𝒞`, `ω_χ(𝒞⁺) ∈ O` and `λ_B(𝒞⁺) = ω_χ(𝒞⁺) mod m`, `λ_B` being
  the unique `k`-algebra homomorphism `Z(k[G]) → k` with `λ_B(e_B) = 1` (martinez line 351 and
  line 373; sambale Chapter 1). Route for the comparison with the native central character: the
  class sums form an `F`-basis of `Z(F[G])` with structure constants in `ℤ`, `F = ℚ(ζ_e)`; the
  native `TauCeti.Representation.centralCharacter` over `ℂ` of a representation affording `χ`
  takes the values `|𝒞| χ(x)/χ(1) ∈ F` on them, so it restricts to an `F`-algebra homomorphism
  `Z(F[G]) → F`, whose `K`-linear extension along `F → K` (base §1.1) is `ω_χ`; these values are
  algebraic integers (`TauCeti.Representation.isIntegral_centralCharacter_classSumCenter`), so
  their images lie in `O`, which is integrally closed;
- Osima's formula: for a union `A` of connected components of the Brauer graph (`χ` linked to `ψ`
  when `d_{χφ} ≠ 0 ≠ d_{ψφ}` for some `φ`), `g` `p`-regular and `x ∈ G`,
  `Σ_{χ ∈ A} χ(g) χ(x) = Σ_{φ ∈ IBr(A)} φ(g) Φ_φ(x)` (martinez line 414, Proposition 2.3); hence
  the coefficients `|G|⁻¹ Σ_{χ ∈ A} χ(1) χ(x⁻¹)` of `f_A = Σ_{χ ∈ A} e_χ` lie in `O` and vanish
  for `p`-singular `x` (martinez line 512, Proposition 2.5), and `Irr(B)` is a single connected
  component (martinez line 566, Corollary 2.7);
- the defect classes of `B` (base §6.2: the classes `𝒞` with `a_B(𝒞) λ_B(𝒞⁺) ≠ 0`) exist, since
  `e_B = Σ_𝒞 a_B(𝒞) 𝒞⁺` and `λ_B(e_B) = 1`, and consist of `p`-regular elements, since `a_B(𝒞)` is
  the reduction of the coefficient of `f_{Irr(B)}`, which vanishes on the `p`-singular classes by
  the preceding statement (martinez line 696 and line 760).

The base §6.2 identifies the defect groups of `B` with the Sylow `p`-subgroups of `C_G(x)`, `x` in
a defect class. *Needs:* base §§1.1, 1.3, 2.3, 2.4, 3.1, 4.1, 4.2, 6.2; for the change of system
also base Conventions and §§7.1, 8.2, CharacterTheory §4.5 and Mathlib's completion of a number
field at a finite place, `IsDedekindDomain.HeightOneSpectrum.adicCompletion`, with the extension
property `UniformSpace.Completion.extension`; CharacterTheory §4.3; Tau Ceti
`TauCeti.Representation.centralCharacter`,
`TauCeti.Representation.centralCharacter_classSumCenter_mul_character_one`,
`TauCeti.Representation.isIntegral_centralCharacter_classSumCenter`, `TauCeti.classSumCenter`.

**Checks.**
- `S₃`, `p = 2`, `B₀` with `e_{B₀} = 1 + r + r²`: the coefficient of `{1}` is
  `(1 + 1)/6 = 1/3 ≡ 1`, of the `3`-cycles `(1 + 1)/6 ≡ 1`, of the transpositions `(1 − 1)/6 = 0`;
  `{1}` is a defect class (`λ = 1`) with Sylow `2`-subgroup of `C_G(1)` of order `2`, while the
  `3`-cycles have `λ_{B₀} = 2 ≡ 0`.
- The defect-zero block `r + r²`: coefficients `2 · 2/6 ≡ 0` at `1` and `2 · (−1)/6 ≡ 1` at the
  `3`-cycles; the class of `r` is a defect class (`λ = 2 · (−1)/2 = −1 ≠ 0`) with `C_G(r) = C₃`,
  Sylow `2`-subgroup trivial.
- Osima at `x = r` for `B₀`: `IBr(B₀) = {1}`, `Φ₁ = 1 + sgn`, and `2/6 · 1 = 1/3` agrees with the
  coefficient. The set `{1}` is not a union of components (`1` and `sgn` share the Brauer
  character `1`), and `f_{{1}} = (1/6) Σ_g g` has the coefficient `1/6 ∉ ℤ₂`.
- The values of `ω_χ` lie in `F`, not in `ℚ_p`: `C₃`, `p = 2`, `K = ℚ₂(ζ₃)`, `k = 𝔽₄`,
  `χ(r) = ζ₃`. Then `ω_χ({r}⁺) = ζ₃`, a unit of `O = ℤ₂[ζ₃]` reducing to a root of `X² + X + 1` in
  `𝔽₄`, so the central character of the defect-zero block `{χ}` takes a value outside `𝔽₂`; and
  `ω_χ({r}⁺ {r²}⁺) = ω_χ({1}⁺) = 1 = ζ₃ · ζ₃²`, as an algebra homomorphism requires.
- Change of system, `S₃`, `p = 2`, and the system `(K', O', k')` with `k' = 𝔽₄(T)` of Conventions:
  `ζ₃ ∈ K'` embeds `ℚ(ζ₃)`, the place below is the one place over `2`, with `K_w = ℚ₂(ζ₃)` and
  `k_w = 𝔽₄ ⊆ 𝔽₄(T)`. The blocks of `𝔽₄(T)[S₃]` are `1 + r + r²` and `r + r²`, with defect groups
  `⟨t⟩` and `1` and characters `{1, sgn}` and `{std}`, as over `𝔽₄`, although the residue field
  has grown from the finite `𝔽₄` to the infinite `𝔽₄(T)`; heights `0, 0` and `0` on both sides.
- The change of system needs the root of unity: for `C₃`, `p = 2` and `(ℚ₂, ℤ₂, 𝔽₂)`, which has no
  primitive cube root of unity, nothing embeds `ℚ(ζ₃)`. There the block `r + r²` of `𝔽₂[C₃]`, with
  central lift `(2 − r − r²)/3` and defect group `1`, holds a single irreducible `ℚ₂`-character,
  of degree `2` and values `2, −1, −1`, while over `𝔽₄` and `ℚ₂(ζ₃)` it is the sum of two blocks,
  each with a linear character.

### 6.2 Brauer's theorem on heights

Let `B` be a block of `G` with defect group `D`, `|G|_p = p^a`, `|D| = p^d`. Prove that
`p^{a−d} ∣ χ(1)` for every `χ ∈ Irr(B)` and that some `χ ∈ Irr(B)` has `ν(χ(1)) = a − d` (martinez
line 728, Theorem 3.4, proof lines 783–831; mnst line 51; navarro-1998, Chapter 3; feit, Chapter
IV). Route: for a defect class `𝒞 = Cl(x)`, `ν(|𝒞|) = a − d`; `λ_B(𝒞⁺) ≠ 0` makes
`ω_χ(𝒞⁺) = |𝒞| χ(x)/χ(1)` a unit, so `|𝒞|/χ(1) ∉ m` and `ν(|𝒞|) ≤ ν(χ(1))`; `a_B(𝒞) ≠ 0` and
Osima's formula with `Φ_φ(1)/|G| ∈ O` give `φ(x⁻¹)` a unit for some `φ ∈ IBr(B)`, hence `χ(x⁻¹)` a
unit for some `χ ∈ Irr(B)` (every Brauer character of `B` is a `ℤ`-combination of the `χ⁰`,
`χ ∈ Irr(B)`, by base §2.4 and block-diagonality), and integrality of `ω_χ(𝒞⁺_{x⁻¹})` gives
`ν(χ(1)) ≤ ν(|𝒞|)`. The headline `brauer_height` is the statement for an arbitrary splitting
`p`-modular system, the block given as a primitive idempotent `b` of `Z(O[G])`, `Irr(B)` as
`blockCharacters b`, and `D` a defect group of the reduction of `b` in the sense of
`IsBlockDefectGroup`; it follows from the statement at a place by the change of system of §6.1.
*Needs:* §6.1; base §§2.2, 2.4, 3.1, 4.2, 6.2.

**Checks.**
- `S₃`, `p = 2`: `B₀` has `a = d = 1` and degrees `1, 1`; the defect-zero block has `d = 0` and
  `2 ∣ 2`.
- `SL(2,3)`, `p = 3`: the block `{χ₂, χ₂ ω, χ₂ ω²}` has `a = d = 1` and `ν₃(2) = 0`; the
  defect-zero block `{χ₃}` has `3 ∣ 3`.
- `A₅`, `p = 2`: `B₀` has `D = V₄`, `a = d = 2`, degrees `1, 3, 3, 5`; the block `{χ₄}` has defect
  zero and `4 ∣ 4`. The model `p^a ∣ χ(1)` fails on `B₀`.
- The splitting hypothesis is needed: for `C₃` over `(ℚ₂, ℤ₂, 𝔽₂)` the block with central lift
  `(2 − r − r²)/3` has defect group `1`, so `a − d = 0`, and its only irreducible `ℚ₂`-character
  has degree `2`, of `2`-adic valuation `1`; no character of the block has `ν(χ(1)) = a − d`.

### 6.3 Heights, defects and height zero characters

Define, for `χ ∈ Irr(B)`, the height `h(χ) = ν(χ(1)) − (a − d)` and the defect
`d(χ) = a − ν(χ(1))`, both natural numbers (by §6.2 and `χ(1) ∣ |G|`), and the set
`Irr₀(B) = {χ ∈ Irr(B) : h(χ) = 0}` (martinez line 718, §3.2, where the parenthesis at line 725
compares `d(B)` with `χ(1)_p` and should compare `p^{a−d(B)}` with `χ(1)_p`; reynolds line 60).
Prove: `h` and `Irr₀(B)` do not depend on the choice of the defect group; `Irr₀(B) ≠ ∅`;
`h(χ) = 0 ⟺ d(χ) = d ⟺ ν(χ(1)) = a − d`; `d = max_{χ ∈ Irr(B)} d(χ)` (the numerical defect of
martinez line 719). *Needs:* §6.2, and §6.1 for the change of system; base `isDefectGroup_conj`;
Mathlib `padicValNat`; Tau Ceti `TauCeti.Representation.finrank_dvd_card`; for the change of place
below, base §§1.1, 4.2, 6.2, CharacterTheory §4.4 and Mathlib
`Ideal.exists_smul_eq_of_isGaloisGroup`; for the change of level below, base §§1.1, 1.3, 2.1, 2.3,
2.4, 4.1, 4.2, 6.1, 6.2, 7.1, 8.2.

- `h(χ) + d(χ) = d`.
- Heights are invariant under group isomorphisms and under conjugation of characters.
- Change of system: for a splitting `p`-modular system of `G` and the place `w` below it (§6.1),
  `Irr(1 ⊗ B) = Irr(B)` with the same degrees and the same defect groups, so heights, defects,
  `Irr₀` and Brauer correspondents are the same at the two systems.
- Change of place: for `σ ∈ Gal(F/ℚ)` and a place `v` of `F` over `p`, let `σv` be the place whose
  prime is `σ(𝔭_v)`. As `σ` carries the `𝔭_v`-adic valuation of `F` to the `σ(𝔭_v)`-adic one, it
  extends to an isomorphism `F_v → F_{σv}` of complete valued fields, hence of the systems of
  Conventions at `v` and at `σv`, restricting to `σ` on `F` and inducing `O_F/𝔭_v ≅ O_F/σ(𝔭_v)` on
  the residue fields. Applied to coefficients it carries, for every `H ≤ G`, the blocks of
  `k_v[H]` to those of `k_{σv}[H]` with their central characters, defect classes, Brauer
  projections `Br_P` and defect groups; on characters it is `χ ↦ σ ∘ χ` (CharacterTheory §4.4), so
  that `Irr(σB) = {σ ∘ χ : χ ∈ Irr(B)}`, which is the central-character congruence of base §4.2
  transported by `σ`. Hence `h_{σv}(σ ∘ χ) = h_v(χ)`, `Irr₀(σB) = {σ ∘ χ : χ ∈ Irr₀(B)}`, and the
  Brauer correspondent of `σB` is the image of that of `B`. `Gal(F/ℚ)` is transitive on the places
  over `p` (Mathlib `Ideal.exists_smul_eq_of_isGaloisGroup`, for `O_F` over `ℤ`), so a property of
  the heights, defect groups and Brauer correspondents of all blocks of `G` holds at one place
  over `p` exactly when it holds at every place over `p`.
- Change of level, that is, of the cyclotomic field `ℚ(ζ_e)` of Conventions: let `H` be a finite
  group, `e` a positive multiple of `exp(H)`, `v` a place of `ℚ(ζ_e)` over `p`, and `w` the place
  of `ℚ(ζ_{exp H}) ⊆ ℚ(ζ_e)` below `v`. The closure of `ℚ(ζ_{exp H})` in `K_v` is the completion
  `K_w`, with `O_w = O_v ∩ K_w`, `m_w = m_v ∩ O_w` and residue fields `k_w ⊆ k_v`; the canonical
  maps of base §1.1 commute with these inclusions, so complex characters are read in `K_w` and in
  `K_v` compatibly and the root bijections at `w` and at `v` agree. Let `X` be a subgroup, a
  quotient or a quotient of a subgroup of `H`. Its exponent divides `exp(H)`, so `k_w` contains a
  primitive root of unity of order the `p'`-part of `exp(X)` and splits `X` and all its subgroups
  (base §2.3). Then scalar extension `e_B ↦ 1 ⊗ e_B` is a bijection from the blocks of `k_w[X]` to
  those of `k_v[X]`; it keeps the coefficients `a_B(𝒞)`, `λ_{1⊗B}` extends `λ_B`, and the defect
  classes, the Brauer projections `Br_P(e_B)`, the defect groups and the principal block are the
  same (the scalar extension of base §6.2); it commutes with conjugation by `H`, with block
  induction (base §7.1, defined through central characters) and with covering for normal subgroups
  of `X` (base §8.2, through orbit sums of block idempotents). The central lift of `1 ⊗ e_B` is
  the image of the central lift of `e_B` under `O_w[X] → O_v[X]` (uniqueness of central lifts,
  base §1.3), and every `e_χ` has its coefficients in `ℚ(ζ_{exp H})` (base §4.1), so
  `Irr(1 ⊗ B) = Irr(B)`; equivalently, by base
  `exists_blockIdempotent_iff_centralCharacter_congr`, the differences
  `|𝒞|(χ(g)/χ(1) − ψ(g)/ψ(1))` are algebraic integers of `ℚ(ζ_{exp H})`, hence in `O_w`, and lie
  in `m_v` exactly when they lie in `m_w`. The simple `k_w[X]`-modules stay simple over `k_v` and
  give all simple `k_v[X]`-modules (the radical base change of base §2.3), with the same Brauer
  characters, so `IBr(1 ⊗ B) = IBr(B)` with the same decomposition numbers (base §2.4, change of
  splitting modular system). Hence heights, defects and `Irr₀` are the same at `w` and at `v`, and
  the Brauer correspondent of `1 ⊗ B` is `1 ⊗ b'`. A statement of Layers 6–8 about `H` at its own
  system at `w` therefore holds at `v`; this is how Conventions reads such statements for
  subgroups and quotients of `G`.

**Checks.**
- `SL(2,3)`, `p = 2`, a single block with `D = Q₈`: degrees `1, 1, 1, 2, 2, 2, 3` have heights
  `0, 0, 0, 1, 1, 1, 0`, and `|Irr₀(B)| = 4`.
- `D₈`, `p = 2`: heights `0, 0, 0, 0, 1`; the trivial group: one block, height `0`.
- The natural-number subtractions never truncate: `ν(χ(1)) ≥ a − d` by §6.2 and `ν(χ(1)) ≤ a` by
  `χ(1) ∣ |G|`; for `S₃`, `p = 2`, `std` has `ν = 1 = a`, `d(std) = 0`.
- Change of place, `C₇ × C₂`, `p = 2`: `Gal(F/ℚ) ≅ (ℤ/7)ˣ`, and the decomposition group of each of
  the two places over `2` is `{1, 2, 4}`, generated by the Frobenius `ζ₇ ↦ ζ₇²`; so `σ : ζ₇ ↦ ζ₇³`
  exchanges the two places, while `ζ₇ ↦ ζ₇²` fixes each. At each place the blocks are
  `{ψ × 1, ψ × sgn}`, `ψ ∈ Irr(C₇)`, with defect group `1 × C₂` and heights `0`, and `σ` sends the
  block of `ψ` at `v` to the block of `σ ∘ ψ` at `σv`, where `(σ ∘ ψ)(r) = ψ(r)³`; the defect
  group and the heights are unchanged.
- Change of level, `C₂ ≤ S₃`, `p = 2`, `e = 6`: `ℚ(ζ₆) = ℚ(ζ₃)` has one place `v` over `2`, with
  `k_v = 𝔽₄` (`2` has order `2` modulo `3`), and `w` is the `2`-adic place of `ℚ(ζ₂) = ℚ`, with
  `k_w = 𝔽₂`, which splits `C₂`. Each side has one block, with idempotent `1`; for the generator
  `t`, `ω_1({t}⁺) − ω_sgn({t}⁺) = 1 − (−1) = 2` lies in `m_w = 2ℤ₂` and in `m_v`, so the block
  holds `{1, sgn}` at both levels, with defect group `C₂` and heights `0 − (1 − 1) = 0`:
  `|Irr₀(b')| = 2` over `𝔽₄`, the value §6.4 compares with `|Irr₀(B₀(S₃))| = 2`.
- Change of level, `Q₈ ≤ SL(2,3)` and `A₄ ≤ A₅`, `p = 2`: `exp(Q₈) = 4` and `exp(SL(2,3)) = 12`
  give `K_w = ℚ₂(i)`, `k_w = 𝔽₂` and `K_v = ℚ₂(ζ₁₂)`, `k_v = 𝔽₄`; `Q₈` has one block on each side,
  with five characters of heights `0, 0, 0, 0, 1`, which is what §8.3 takes from §8.2. For
  `exp(A₄) = 6` and `exp(A₅) = 30`, `2` has order `2` modulo `3` and order `4` modulo `15`, so
  `k_w = 𝔽₄ ⊆ 𝔽₁₆ = k_v`; `A₄` has one block on each side, with heights `0, 0, 0, 0`, the four
  height zero characters that §9.2 counts for the Brauer correspondent of `B₀(A₅)`.
- The comparison needs `exp(X)` to divide the lower level: `X = C₃` is not a subquotient of
  `H = 1`, and at the `2`-adic place of `ℚ(ζ₁) = ℚ` the residue field `𝔽₂` does not split `C₃`;
  the block `r + r²` of `𝔽₂[C₃]` becomes the sum of the two blocks `1 + α² r + α r²` and
  `1 + α r + α² r²` of `𝔽₄[C₃]` (`α² + α = 1`, base §6.2), so scalar extension from that level is
  not a bijection on blocks.

### 6.4 Heights in special blocks

Prove: `Irr₀(B₀(G))` is the set of characters of the principal block of degree prime to `p`, since
its defect groups are the Sylow `p`-subgroups (base
`isDefectGroup_iff_sylow_of_augmentation_ne_zero`); a block of defect zero has
`Irr(B) = {χ} = Irr₀(B)` with `χ(1)_p = |G|_p`, and a block containing a character `χ` with
`χ(1)_p = |G|_p` has defect zero (base §6.2); for the Brauer correspondent `b'` of `B` in `N_G(D)`
(Conventions: `e_{b'} = Br_D(e_B)`, base §6.2), `D` is a defect group of `b'` and
`Irr₀(b') = {ψ ∈ Irr(b') : ψ(1)_p = |N_G(D) : D|_p}` (martinez line 718, §3.2; martinez line 583,
Theorem 2.8, for defect zero). *Needs:* §6.3, with its change of level for the blocks of `N_G(D)`;
base §§4.3, 6.2, 7.1.

**Checks.**
- `S₃`, `p = 2`: `Irr₀(B₀) = {1, sgn}`, both of odd degree.
- `A₅`, `p = 2`: `Irr₀(B₀)` has four members (degrees `1, 3, 3, 5`); in `N_G(V₄) = A₄`, whose
  single `2`-block is the Brauer correspondent, all four characters (degrees `1, 1, 1, 3`) have
  height zero.
- `SL(2,3)`, `p = 3`: the non-principal block of defect `1` has Brauer correspondent a block of
  `N_G(C₃) = C₆` with three height zero characters.
- `S₃`, `p = 2`, over the splitting residue field `k = 𝔽₄` of base §1.1, which is not
  algebraically closed: `Br_{⟨t⟩}(1 + r + r²) = 1`, so the Brauer correspondent of `B₀` is the
  block of `N_G(⟨t⟩) = C₂`, and `|Irr₀(B₀)| = 2 = |Irr₀(b')|`, the second read over `𝔽₄` through
  the change of level of §6.3; no algebraic closure enters.

### Examples

`SL(2,3)` at `p = 2`: one block, defect group `Q₈`, `Irr₀` the four characters of odd degree. At
`p = 3`: blocks `{1, ω, ω²}` (principal), `{χ₂, χ₂ ω, χ₂ ω²}` (defect group `C₃`) and `{χ₃}`
(defect zero).

### Dependencies

Base Conventions and §§1.1, 1.3, 2.1–2.4, 3.1, 4.1–4.3, 6.1–6.2, 7.1, 8.2 (§§7.1 and 8.2 for the
changes of system and of level only); CharacterTheory §§4.3, 4.4, 4.5 (§4.5 for the change of
system); Tau Ceti central characters and degrees; Mathlib `padicValNat`; Mathlib
`Ideal.exists_smul_eq_of_isGaloisGroup` for the change of place, and
`IsDedekindDomain.HeightOneSpectrum.adicCompletion` with `UniformSpace.Completion.extension` for
the change of system.

## Layer 7: blocks and normal subgroups

### 7.1 The Min–Max theorem and defect groups of induced blocks

Let `B` be a block of `G` with defect group `D_B`, `x ∈ G` and `D_x` a Sylow `p`-subgroup of
`C_G(x)`. Prove: if `λ_B(𝒞⁺_x) ≠ 0` then `D_B` is contained in a conjugate of `D_x`; if
`a_B(Cl(x)) ≠ 0` then `D_x` is contained in a conjugate of `D_B` (martinez line 710, Theorem 3.3).
For `H ≤ G` and a block `b` of `H` with `b^G` defined, prove that every defect group of `b` is
contained in a defect group of `b^G` (martinez line 984, Lemma 4.4). Route: the second statement
because `Br_{D_x}(e_B)` contains the contribution of `𝒞⁺_x`, nonzero on `x ∈ C_G(D_x)` with
supports of distinct classes disjoint; the first because `𝒞⁺_x = |C_G(x) : D_x|⁻¹ Tr_{D_x}^G(x)`
lies in the ideal `Tr_{D_x}^G(k[G]^{D_x}) ∩ Z(k[G])`, and in the local algebra `Z(k[G]) e_B` the
element `𝒞⁺_x e_B` is a unit, so `e_B` lies in that ideal and the minimality characterisation of
base §6.2 applies; the induced statement from the first applied in `H` to a class `ℒ ⊆ 𝒞 ∩ H` with
`λ_b(ℒ⁺) ≠ 0`, `𝒞` a defect class of `b^G`. *Needs:* §6.1; §6.3 (the change of level, for the
blocks of `H`); base §§6.1, 6.2, 7.1.

**Checks.**
- `S₃`, `p = 2`, `B₀`: at a transposition `λ_{B₀} = 3 ≡ 1` and `D_t = ⟨t⟩` contains a conjugate of
  `D_{B₀}`; at a `3`-cycle `a_{B₀} = 1` and `D_r = 1 ≤ D_{B₀}`.
- `S₃`, `p = 3`, the single block: at a transposition `λ = 3 ≡ 0` (else `C₃` would lie in
  `D_t = 1`); at a `3`-cycle `λ = 2 ≢ 0` and `D_r = C₃ = D_B`.
- `G = 1`: one class, `D_B = D_1 = 1`.

### 7.2 Covering through central characters

Let `N ⊴ G`. Prove: `χ ∈ Irr(G)` lies over `θ ∈ Irr(N)` exactly when `ω_χ(𝒞⁺) = ω_θ(𝒞⁺)` for every
`G`-class `𝒞 ⊆ N` (martinez line 1652, Proposition 7.6); a block `B` of `G` covers a block `b` of
`N` exactly when `λ_B(𝒞⁺) = λ_b(𝒞⁺)` for every `G`-class `𝒞 ⊆ N` (martinez line 1790, Proposition
7.11); in `Z(O[G])` the central lifts satisfy `Σ_{B covers b} e_B = Σ_{b'} e_{b'}`, `b'` running
over the `G`-conjugates of `b`, the lift to `O` of the identity over `k` by which base §8.2 defines
covering (martinez line 1642); the blocks of `N` covered by `B` form one `G`-orbit (martinez line
1760, Corollary 7.8); if `B` covers `b`, every `θ ∈ Irr(b)` lies under some `χ ∈ Irr(B)` and every
`φ ∈ IBr(b)` under some member of `IBr(B)` (martinez line 1763, Proposition 7.9); and if `b^G` is
defined it covers `b` (martinez line 1976, Lemma 8.6). Route: for the first, Clifford's theorem in
character form over `ℂ`, where `Irr(G)` is read (Conventions), so that the unit and
algebraic-closure hypotheses of Tau Ceti `TauCeti.clifford_restrict_character` hold; it gives
`ω_χ = ω_ξ` on the `G`-class sums in `N` for every `ξ` under `χ`, and `ω_ψ(e_η) = δ_{ψη}` on the
orbit idempotent `Σ_i e_{θ_i}` (`θ_i` the `G`-conjugates of `θ`), a combination of `G`-class sums in
`N`, so that `ω_ξ = ω_θ` there only for `ξ` conjugate to `θ`; for the third, the sum of the `e_{b'}`
over the `G`-orbit of `b` is a `G`-invariant idempotent of `Z(O[N])`, hence central in `O[G]` and
the sum of the block idempotents of `G` below it (base §0.2); its reduction is the orbit sum over
`k`, which base §8.2 writes as the sum of the block idempotents of `k[G]` of the blocks covering
`b`, and a central idempotent of `k[G]` has exactly one central lift (base §1.3), so the blocks
below it are those covering `b`; for the second, in one direction the first applied to some
`χ ∈ Irr(B)` over some `θ ∈ Irr(b)` (base §8.2) with `λ_B(𝒞⁺) = ω_χ(𝒞⁺) mod m` (§6.1), and in the
other the third: `Σ_{B' covers b} e_{B'}` is a combination of `G`-class sums in `N`, on which `λ_B`
agrees with `λ_b`, and `λ_b` is `1` on it, so `B` is one of the `B'`; for the fourth, the third and
the orthogonality of the idempotent sums of two distinct orbits, which therefore share no `e_B`; for
the fifth, connectivity of `Irr(b)` in the Brauer graph (§6.1), the decomposition of `χ⁰` (base
§2.4), Frobenius reciprocity for ordinary characters (InductionRestriction Layer 2), and, for the
modular step that a simple `k[G]`-module `W` with a simple `k[N]`-module `V` among the composition
factors of `Res_N W` is a quotient of `Ind_N^G V`, two statements that hold over every field, in
particular over the residue field `k`, which is finite and so not algebraically closed (it is `𝔽₄`
for `S₃` at `p = 2`, base §1.1): the restriction of a simple module to a normal subgroup is
semisimple (Tau Ceti `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`), so `V` is a
submodule of `Res_N W`, and induction is left adjoint to restriction (Mathlib
`Rep.indResAdjunction`), so `Hom_G(Ind_N^G V, W) ≅ Hom_N(V, Res_N W) ≠ 0`; base §2.1 identifies the
Brauer character of `Ind_N^G V` with `φ^G`; for the sixth, the second and
`λ_{b^G}(𝒞⁺) = λ_b((𝒞 ∩ N)⁺) = λ_b(𝒞⁺)` for a `G`-class `𝒞 ⊆ N`, which is the definition of `b^G`
(base §7.1). *Needs:* §6.1; §6.3 (the change of level, for the blocks of `N`); base §§0.2, 1.3, 2.1,
2.4, 3.1, 4.2, 7.1, 8.2; InductionRestriction Layers 2 and 5; Tau Ceti
`TauCeti.clifford_restrict_character`,
`TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`; Mathlib `Rep.indResAdjunction`.

**Checks.**
- `S₃`, `N = C₃`, `p = 2`: `B₀` covers `{1_N}` and the defect-zero block covers both `{λ}` and
  `{λ̄}`, one orbit; on the class `{r, r²}`, `ω_std = 2 · (−1)/2 = −1 = λ(r) + λ(r²) = ω_λ`.
- `S₃`, `N = C₃`, `p = 3`: one block on each side, and it covers.
- `N = 1`: every block covers the unique block of `1`; `N = G`: `B` covers `b` exactly when
  `B = b`.
- The modular step needs no invertibility of `|N|`: `S₄`, `N = A₄`, `p = 2`, `k ⊇ 𝔽₄`. The
  two-dimensional simple `k[S₄]`-module `W`, inflated from `S₃`, restricts to `λ ⊕ λ̄` with `λ`
  inflated from `A₄/V₄ ≅ C₃`, a semisimple restriction although `2` divides `|A₄|`; the adjunction
  gives a nonzero map `Ind_{A₄}^{S₄} λ → W`, onto as `W` is simple, hence an isomorphism (both of
  dimension `2`), with Brauer character `2, −1` on the classes of `1` and of a `3`-cycle. So
  `λ, λ̄ ∈ IBr(A₄)` lie under `W`, as the fifth statement requires for the single `2`-blocks of
  `A₄` and `S₄`, while a supplier assuming `|G|` invertible in `k` (`24 = 0` in `k`) does not
  apply.

### 7.3 Domination modulo a normal subgroup

Let `N ⊴ G` be any normal subgroup and `π : k[G] → k[G/N]` the algebra map induced by the quotient
map. Say that a block `B` of `G` **dominates** a block `B̄` of `G/N` when `e_{B̄} π(e_B) = e_{B̄}`
(martinez line 1897, Definition 8.3, through `Irr(B̄) ⊆ Irr(B)`, the two forms agreeing by
martinez line 1907, Proposition 8.4). Prove: every block of `G/N` is dominated by exactly one
block of `G`; `π(e_B)` is the sum of the `e_{B̄}` over the blocks `B̄` that `B` dominates, and is
`0` when there are none; and when `B` dominates `B̄`, inflation along `G → G/N` carries `Irr(B̄)`
into `Irr(B)` and `IBr(B̄)` into `IBr(B)` (martinez line 1895, Corollary 8.2, and line 1907,
Proposition 8.4). For a block `B̄` dominated by `B` and a defect group `D` of `B`, prove that some
defect group of `B̄` is contained in `D N/N` (martinez line 1928, Theorem 8.5 (i)). The base §8.1
is the case of a normal `p`-subgroup `N`, where every block of `G` dominates at least one block of
`G/N` (martinez line 1931, Theorem 8.5 (ii)); in general a block may dominate none. Route: `π` is
surjective, so it maps `Z(k[G])` into `Z(k[G/N])`, and the `π(e_B)` are orthogonal central
idempotents with sum `1`; for a block `B̄`, `e_{B̄} = Σ_B e_{B̄} π(e_B)` with each term a central
idempotent below the primitive central idempotent `e_{B̄}`, so exactly one term is `e_{B̄}` and
the others vanish. For the characters, the map `O[G] → O[G/N]` sends the lift `e_B ∈ Z(O[G])` to
the central idempotent lifting `π(e_B)`, which is the sum of the lifts of the `e_{B̄}` that `B`
dominates (uniqueness of central lifts, base §1.3), and `K[G] → K[G/N]` sends `e_χ` to `e_χ̄` when
`N ≤ ker χ` and to `0` otherwise (martinez line 1909); a simple `k[G/N]`-module in `B̄`, inflated
to `G`, is acted on by `e_B` as by `π(e_B) e_{B̄} = e_{B̄}`, the identity. For the defect groups:
`e_B ∈ Tr_D^G(k[G]^D)` (base §6.2), and `π` sends `Tr_D^G(a)` to
`|N : N ∩ D| · Tr_{DN/N}^{G/N}(ā)`, `ā` being `DN/N`-invariant; `π(e_B) ≠ 0` because it contains
`e_{B̄}`, so the factor `|N : N ∩ D|` is a unit, and `e_{B̄} = e_{B̄} π(e_B)` lies in the ideal
`Tr_{DN/N}^{G/N}(k[G/N]^{DN/N})`; the minimality characterisation of base §6.2 in `G/N` applies.
*Needs:* base §§0.2, 1.3, 4.1, 4.2, 6.1, 6.2; for the last bullet, §6.3 (the change of level).

- `B` dominates `B̄` exactly when `λ_{B̄}(π(e_B)) = 1`, and then `λ_{B̄} ∘ π = λ_B` on `Z(k[G])`
  (martinez line 1924).
- For `N = 1`, domination is equality of blocks.
- Domination is compatible with the change of level of §6.3: `π` commutes with the scalar
  extension `k_w → k_v`, so `B` dominates `B̄` over `k_w` exactly when `1 ⊗ B` dominates `1 ⊗ B̄`
  over `k_v`.

**Checks.**
- `S₃`, `N = C₃`, `p = 2` (`N` a `p'`-group): `π(1 + r + r²) = 3 = 1` and `π(r + r²) = 2 = 0` in
  `k[C₂]`, so `B₀` dominates the single block of `C₂` and the defect-zero block dominates none;
  `D N/N = C₂`, the defect group of the block of `C₂`.
- `S₃`, `N = C₃`, `p = 3`: the single block maps to `1 = e₊ + e₋` in `k[C₂]`, so it dominates both
  blocks of `C₂`, of defect zero, inside `C₃ N/N = 1`; `π(e_B)` is not a single block idempotent,
  and domination is not a bijection.
- `N` neither a `p`- nor a `p'`-group: `G = S₃ × C₂`, `N = S₃ × 1`, `p = 2`, `|N| = 6`. The blocks
  of `G` have idempotents `1 + r + r²` (principal, defect group `D = ⟨t⟩ × C₂`) and `r + r²`
  (defect group `1 × C₂`), with images `1` and `0` in `k[C₂]`; the single block of `G/N ≅ C₂` is
  dominated by the principal block only, and its defect group `C₂` equals `D N/N`.
- `N = G`: `π` is the augmentation, so the block of the trivial group is dominated by the
  principal block `B₀(G)` alone (base §4.3); `N = 1`: `B̄ = B`.

### 7.4 The Fong–Reynolds correspondence

Let `N ⊴ G`, `b` a block of `N` and `T` its stabiliser in `G`. Prove: `B ↦ B^G` is a bijection
from the blocks of `T` covering `b` to the blocks of `G` covering `b`; `ψ ↦ ψ^G` is a bijection
`Irr(B) → Irr(B^G)` and `IBr(B) → IBr(B^G)`, preserving decomposition numbers; every defect group
of `B` is a defect group of `B^G`; and `h(ψ^G) = h(ψ)` for `ψ ∈ Irr(B)` (martinez line 1823,
Theorem 7.12; reynolds line 133, Theorem 1; sambale Chapter 1, Theorem 1.19). Route: with
`f = Σ_{g ∈ G/T} e_b^g`, the idempotents `e_b^g` are orthogonal and `e_b k[G] e_b = k[T] e_b`, so
`k[G] f` is a matrix algebra over `k[T] e_b` and the centres correspond; the corresponding blocks
are `B` and `B^G` because `ψ^G` is irreducible for `ψ` over `θ ∈ Irr(b)` (`G_θ ≤ T`, Clifford) and
`ω_{ψ^G}(𝒞⁺) = Σ ω_ψ(ℒ⁺)` over the `T`-classes `ℒ ⊆ 𝒞` (reynolds line 149, Theorem 2); induction
from `T` to `G` gives the correspondence of simple modules and of lattices; the defect groups by
§7.1 and the degree count `min ν(ψ^G(1)) = ν(|G : T|) + min ν(ψ(1))` with §6.2; heights by the
same count. The headlines state the correspondence at an arbitrary splitting `p`-modular system,
with blocks as primitive idempotents of the centres of `O[N]`, `O[T]` and `O[G]`, covering as
`e_B e_b ≠ 0`, `T` as the stabiliser of `e_b` and `ψ^G` as `Subgroup.indClassFun T ψ`:
`fongReynolds` gives, for a block `B` of `T` covering `b`, a block `B'` of `G` covering `b` (it is
`B^G`) such that `ψ ↦ ψ^G` maps `Irr(B)` bijectively onto `Irr(B')` and every defect group of `B`
is a defect group of `B'`; `existsUnique_fongReynolds` says that every block of `G` covering `b`
receives the induced characters of exactly one block of `T` covering `b`. With
`ψ^G(1) = |G : T| ψ(1)` they give `h(ψ^G) = h(ψ)`. *Needs:* §§6.2, 6.3 (with its change of level,
for the blocks of `T` and `N`), 7.1, 7.2; base §§0.2, 1.2, 2.1, 7.1, 8.2; Tau Ceti
`FDRep.cliffordCorrespondence`, `Subgroup.indClassFun`.

- `B^G` is defined for `B` covering `b`, and covers `b`.
- The correspondence is natural for conjugation by `G`.

**Checks.**
- `S₃`, `N = C₃`, `p = 2`, `b = {λ}`: `T = C₃`, the block `{λ}` of `T` induces to `{std}`, and
  `h(λ) = 0 − (0 − 0) = 0 = 1 − (1 − 0) = h(std)`.
- `T = G` (b invariant): the correspondence is the identity.
- The stabiliser is that of the idempotent, not of a character: `S₃`, `N = C₃`, `p = 3`, where
  `k[C₃]` has the single block `1`, fixed by every element, so `T = S₃` and the correspondence is
  the identity on the one block of `S₃`, although conjugation by a transposition moves the
  characters `λ`, `λ̄` of `C₃` in that block; a model taking `T` to be the inertia group `C₃` of
  `λ` would induce the trivial character of that block of `C₃` to `1 + sgn`, which is reducible.
- `S₄`, `N = V₄`, `p = 3`, `b = {λ}` with `ker λ = ⟨(13)(24)⟩`: `T` is the dihedral group of order
  `8` containing `V₄`, `λ` has two linear extensions to `T`, each a block of defect zero, and they
  induce to the two irreducible characters of degree `3` of `S₄`, each of defect zero; the heights
  are `0` on both sides.

### 7.5 Regular blocks and Fong's theorem

Call a block `B` of `G` regular with respect to `N ⊴ G` when `λ_B(𝒞⁺) = 0` for every class `𝒞 ⊄ N`
(martinez line 2264). Prove: for `B` covering `b`, `B` is regular exactly when `b^G` is defined
and equals `B` (martinez line 2267, Proposition 9.3); a block with defect group `D` and
`C_G(D) ≤ N` is regular (martinez line 2279, Proposition 9.4); for a normal `p`-subgroup `Q` and a
block `b` of `Q C_G(Q)`, `b^G` is the unique block covering `b` (martinez line 2288, Corollary
9.5); and Fong's theorem: for a `G`-invariant block `b` of `N` and a block `B` covering `b` of
maximal defect among those covering `b`, with defect group `P`, `p ∤ |G : P N|` and `P ∩ N` is a
defect group of `b` (martinez line 2161, Proposition 9.1, and line 2222, Theorem 9.2). *Needs:*
§6.3 (the change of level, for the blocks of `N` and `Q C_G(Q)`); §§7.1, 7.2; base §§6.2, 7.1.

- Regularity depends only on `λ_B`, not on blocks of `N`; as `λ_{1⊗B}` extends `λ_B`, it is the
  same before and after the change of level of §6.3.

**Checks.**
- `S₃`, `N = C₃`, `p = 2`: `B₀` has `λ_{B₀}(𝒞⁺_t) = 3 ≡ 1 ≠ 0` at the transpositions, so it is not
  regular with respect to `C₃`; the defect-zero block has `λ = 0` there and is regular, equal to
  `{λ}^G`.
- `S₄`, `p = 2`, `N = V₄`: as `C_G(V₄) = V₄` and every block covers the single block `b` of the
  `2`-group `V₄`, the third statement above for `Q = V₄` makes the principal block `B₀` the only
  block, with defect group `D₈`, and `λ_{B₀}(𝒞⁺)` is `|𝒞|` modulo `2`. The classes outside
  `V₄`, of the transpositions, the `3`-cycles and the `4`-cycles, have sizes `6, 8, 6`, so `B₀` is
  regular with respect to `V₄`, as `C_G(D₈) = Z(D₈) ≤ V₄` predicts, and it is `b^G`. With respect
  to `N = 1` it is not regular: the double transpositions form a class outside `1` of size `3`,
  where `λ_{B₀} = 1`.
- `G = C₂ = ⟨t⟩`, `p = 2`, `N = 1`: the single block has `λ(t) = 1 ≠ 0` on the class `{t} ⊄ 1`,
  so it is not regular; accordingly `b^G` is not defined for the block `b` of `1`, since the
  candidate `z ↦` (the coefficient of `z` at `1`) sends `t` to `0` and `t · t = 1` to `1`, and is
  not multiplicative.
- `Q = O_p(G)` with `Q C_G(Q) = G`: `b^G = b`.
- `S₃`, `p = 3`, `N = C₃`, `b` the block of `N`: the covering block has defect group `P = C₃`,
  `|G : P N| = 2` is prime to `3`, and `P ∩ N = C₃` is the defect group of `b`.

### 7.6 The extended first main theorem

Let `P` be a `p`-subgroup of `G`. Prove: for a block `B` with defect group `P`, the blocks `b` of
`P C_G(P)` with `b^G = B` form one `N_G(P)`-orbit, all have defect group `P`, and `b^{N_G(P)}` is
the Brauer correspondent of `B` (martinez line 1985, Theorem 8.8); and for a block `b` of
`P C_G(P)` with defect group `P` and stabiliser `N_G(P, b)` in `N_G(P)`, `b^G` has defect group
`P` exactly when `p ∤ |N_G(P, b) : P C_G(P)|` (martinez line 2295, Theorem 9.6; sambale Chapter 1,
Theorem 1.18). *Needs:* §6.3 (the change of level, for the blocks of `P C_G(P)` and `N_G(P)`);
§§7.1, 7.2, 7.4, 7.5; base §§6.2, 7.1.

- The blocks of `G` with defect group `P` correspond to the `N_G(P)`-orbits of blocks of
  `P C_G(P)` with defect group `P` and inertial index prime to `p`.

**Checks.**
- `S₃`, `p = 2`, `P = ⟨t⟩`: `P C_G(P) = P`, inertial index `1`, and `b^G = B₀`.
- `S₃`, `p = 3`, `P = C₃`: `N_G(P) = S₃` stabilises the block of `C₃`, inertial index `2`, prime
  to `3`.
- The index condition is needed: `S₄`, `p = 2`, `P = V₄`: `P C_G(P) = V₄`, the block of `V₄` has
  stabiliser `S₄` and index `6`, divisible by `2`, and indeed the unique `2`-block of `S₄` has
  defect group `D₈`, not `V₄`.

### Examples

`S₃` at `p = 2` with `N = C₃`: the Fong–Reynolds correspondence for `b = {λ}` sends the block
`{λ}` of `C₃` to the defect-zero block `{std}` of `S₃`; for `b = {1}`, `T = S₃` and the
correspondence is the identity on `B₀`.

### Dependencies

Layer 6; base §§0.2, 1.2, 1.3, 2.1, 2.4, 3.1, 4.1, 4.2, 6.1–6.2, 7.1, 8.2; InductionRestriction
Layers 2 and 5; Tau Ceti Clifford theory and induced class functions; Mathlib
`Rep.indResAdjunction`.

## Layer 8: blocks with a normal defect group

### 8.1 Vanishing off the defect groups

For `χ ∈ Irr(B)` and `g ∈ G` whose `p`-part lies in no defect group of `B`, prove `χ(g) = 0`
(martinez line 2011, Theorem 8.10; navarro-1998, Theorem 5.9). Route: write
`χ(u v) = Σ_φ d^u_{χφ} φ(v)` with `u` the `p`-part; a nonzero `d^u_{χφ}`, `φ ∈ IBr(b)`, makes
`(⟨u⟩, b)` a `B`-Brauer pair by the second main theorem, contained in a maximal one whose first
component is a defect group. *Needs:* base §§5.1, 6.3, 7.2.

**Checks.**
- `S₃`, `p = 2`, the defect-zero block: `std(t) = 0` at a transposition.
- `SL(2,3)`, `p = 3`, the defect-zero `χ₃`: `χ₃` vanishes at the elements of order `3` and `6`.
- `B₀` of a group with Sylow subgroup `D`: every `p`-part lies in a conjugate of `D`, and no
  vanishing is forced.

### 8.2 Blocks of `P C_G(P)` with defect group `P`

Let `P` be a `p`-subgroup with `G = P C_G(P)` and `B` a block with defect group `P`. Prove: there
is a unique `θ ∈ Irr(B)` with `P ≤ ker θ`, and `ν(θ(1)) = ν(|G : P|)`; `IBr(B) = {θ⁰}`; for
`ξ ∈ Irr(P)` the function `θ_ξ`, equal to `θ(g_{p'}) ξ(g_p)` when the `p`-part `g_p` lies in `P`
and to `0` otherwise, is in `Irr(B)`, and `ξ ↦ θ_ξ` is a bijection `Irr(P) → Irr(B)` with
`θ_ξ(1) = θ(1) ξ(1)`; hence `h(θ_ξ) = ν(ξ(1))` and the set of heights of `B` is
`{ν(ξ(1)) : ξ ∈ Irr(P)}` (martinez line 2018, Theorem 8.11, and line 2131, Corollary 8.12;
reynolds line 509, Theorem 7). Route: every block of `G/P` dominated by `B` has defect zero
(§7.3); two such blocks coincide, since their central characters vanish on `p`-singular classes (a
character of defect zero is the projective character `Φ_{χ⁰}` of base §3.1, which vanishes on
`p`-singular elements) and agree on `p`-regular ones, a `p`-regular class of `G` meeting `x P`
only in `x` because `p`-regular elements centralise `P`; so `θ` is unique and `IBr(B) = {θ⁰}` by
domination. For `χ ∈ Irr(B)`, `χ|_P = e ξ` (`G` acts on `Irr(P)` through inner automorphisms of
`P`), `χ(g) = d_{χθ⁰} ξ(1)⁻¹ θ(g_{p'}) ξ(g_p)` by §8.1 and the direct product `⟨g_{p'}⟩ × P`, and
`[χ, χ] = 1` gives `d_{χθ⁰} = ξ(1)`; surjectivity because `Φ_{θ⁰} = Σ_{χ ∈ Irr(B)} ξ_χ(1) χ`
vanishes on `P ∖ 1`, so `Σ_χ ξ_χ(1) ξ_χ` is a multiple of the regular character of `P` (reynolds
line 201). *Needs:* §§6.3, 7.3, 8.1; base §§3.1, 4.2, 6.2, 8.1.

- The canonical character `θ` is determined by `B`.
- `θ` regarded as a character of `G/P` has defect zero.

**Checks.**
- `G = P = D₈`, `p = 2`: `θ = 1`, `Irr(B) = Irr(D₈)`, heights `{0, 1}`.
- `G = C₂ × C₃`, `p = 2`, `P = C₂`: three blocks `B_ψ`, `ψ ∈ Irr(C₃)`, with `θ = 1 × ψ` and
  `Irr(B_ψ) = {ξ × ψ}`, heights `0`.
- `P = 1`: `G = C_G(1)`, `B` has defect zero, and `θ_1 = θ` is its only character.
- `SL(2,3)` at `p = 2` is not of this form: `C_G(Q₈) = Z(Q₈) ≤ Q₈ ≠ G`.

### 8.3 Heights of blocks with a normal defect group

Let `D ⊴ G` be a defect group of `B`, `N = D C_G(D)`, `b` a block of `N` with `b^G = B` (§7.6) and
`T` its stabiliser, so that `p ∤ |T : N|` (§7.6) and `N = D C_N(D)` (§8.2 applies to `b`, read at
the system of `G` through the change of level of §6.3). Prove: for `χ ∈ Irr(B)` lying over
`θ_ξ ∈ Irr(b)`, `ξ ∈ Irr(D)`, `h(χ) ≥ ν(ξ(1))`, and every `θ_ξ` lies under some `χ ∈ Irr(B)`
(§7.2). Route: `χ = ψ^G` with `ψ ∈ Irr(T | θ_ξ)` (Clifford, `G_{θ_ξ} ≤ T`), `θ_ξ(1) ∣ ψ(1)`,
`ν(|G : D|) = ν(|G : T|) + ν(|N : D|)`. Prove further Reynolds' height formula: `h(χ) = ν(ξ(1))`
for every irreducible constituent `ξ` of `χ|_D`, so the set of heights of `B` is
`{ν(ξ(1)) : ξ ∈ Irr(D)}` (reynolds line 531, Theorem 8, for the formula; martinez line 2131,
Corollary 8.12, for the block `b` of `N = D C_N(D)`, the situation of martinez line 2018, Theorem
8.11, and martinez lines 2331–2347, in the proof of Theorem 9.8, for the passage from `b` to `B`
through the stabiliser `T`), using
gap:clifford-multiplicity-dvd-index (applied to `N ⊴ T`) to make `ψ(1)/θ_ξ(1)` prime to `p`. The
headline `reynolds_heights` is the height formula at an arbitrary splitting `p`-modular system:
for a block `b` of `O[G]` whose reduction has the normal defect group `D`, the set of heights
`ν(n) − (a − d)`, `n` running over the degrees of the members of `blockCharacters b`, is the set
of `ν(ξ(1))`, `ξ` running over the complex irreducible characters of `D`. *Needs:* §§6.3 (with its
change of level, for the blocks of `N` and `T`), 7.2, 7.6, 8.2; Tau Ceti
`FDRep.cliffordCorrespondence`, `FDRep.clifford_restrict_dvd_finrank`;
gap:clifford-multiplicity-dvd-index (InductionRestriction Layer 7) for the height formula.

**Checks.**
- `SL(2,3)`, `p = 2`, `D = Q₈`: heights `{0, 1} = {ν(1), ν(2)}`; the three-dimensional character
  restricts to the three nontrivial linear characters of `Q₈` (height `0`), the two-dimensional
  ones to `χ₂` (height `1`).
- `A₄`, `p = 2`, `D = V₄` abelian: heights `{0}`.
- `G = D × H` with `H` a `p'`-group: `B = Irr(D) × {ψ}` and `h(ξ × ψ) = ν(ξ(1))`.

### 8.4 Reynolds' theorem

Let `B` be a block of `G` with a normal defect group `D`. Prove that `Irr(B) = Irr₀(B)` exactly
when `D` is abelian (reynolds line 542, Theorem 9, a corollary of Theorem 8; martinez line 2328,
Theorem 9.8). Route: both directions come from §8.3. If all heights vanish, the bound
`h(χ) ≥ ν(ξ(1))` and the fact that every `θ_ξ` lies under some `χ ∈ Irr(B)` give `ν(ξ(1)) = 0` for
every `ξ ∈ Irr(D)`; since `ξ(1)` divides the `p`-power `|D|`, every `ξ` is linear, so `D` has
`|D|` irreducible characters, hence `|D|` conjugacy classes, and is abelian. If `D` is abelian, it
has `|D|` classes, so `|D|` irreducible characters whose squared degrees sum to `|D|`; every
`ξ ∈ Irr(D)` is linear and the height formula of §8.3 gives `h(χ) = ν(ξ(1)) = 0` for every
`χ ∈ Irr(B)`. The headline `reynolds` states it at an arbitrary splitting `p`-modular system: for
a block `b` of `O[G]` whose reduction has the normal defect group `D`, every member of
`blockCharacters b` has a degree `n` with `ν(n) = a − d` exactly when `IsMulCommutative D`.
*Needs:* §§6.3, 8.3; Tau Ceti `TauCeti.card_irreducibleCharacters`,
`TauCeti.Representation.finrank_dvd_card`; CharacterTheory §2.1 (the sum of the squares of the
degrees is `|D|`).

**Checks.**
- Blocks of defect zero (`D = 1`): `Irr(B) = {χ} = Irr₀(B)`.
- `G` a `p`-group: one block, `D = G`, and `Irr(G) = Irr₀(G)` exactly when every character is
  linear, exactly when `G` is abelian; for `D₈` the character of degree `2` has height `1`.
- `G` abelian: every block has the normal abelian Sylow subgroup as defect group and all heights
  `0`; `G = D × H` with `H` a `p'`-group: all heights `0` exactly when `D` is abelian; `SL(2,3)`
  at `p = 2`: `Q₈` is nonabelian and heights `1` occur; `A₄` at `p = 2`: `V₄` is abelian and all
  heights are `0`.

### Examples

`SL(2,3)` at `p = 2`: `N = Q₈ C_G(Q₈) = Q₈`, `b` the block of `Q₈`, `T = SL(2,3)` with
`|T : N| = 3`, and the heights of the single block are `{0, 1}`.

### Dependencies

Layers 6–7; base §§3.1, 4.2, 5.1, 6.2–6.3, 7.2, 8.1; Tau Ceti Clifford theory, character counts
and degrees; CharacterTheory §2.1; gap:clifford-multiplicity-dvd-index (InductionRestriction Layer
7).

## Layer 9: the height zero and Alperin–McKay conjectures

### 9.1 The height zero predicate

Define, for a prime `p`, **Brauer's height zero property** at `p` as the proposition: for every
finite group `G` (in a fixed universe), every place `v` of `ℚ(ζ_{exp G})` over `p`, with the
system of Conventions at `v`, and every block `B` of `k_v[G]` with defect group `D`,
`Irr(B) = Irr₀(B)` exactly when `D` is abelian (martinez line 2321, Conjecture 9.7; mnst line 48).
By the change of system of §6.1 it is equivalent to the same proposition for every splitting
`p`-modular system of every `G`. Prove its instances: blocks of defect zero, blocks with a normal
defect group (§8.4), hence `p`-groups, abelian groups and groups `D × H` with `H` a `p'`-group.
Cited and not planned: the implication from abelian defect groups for every `p` (kessar-malle line
25, Theorem 1.1), the converse for odd `p` (mnst line 70, Theorem A) and both directions for
`p = 2` (ruhstorfer line 33, Corollary B); together they give the property at every prime (mnst
line 73). *Needs:* §§6.1 (change of system), 6.3, 6.4, 8.4.

- For a given `G`, the equivalence holds for every block at one place over `p` exactly when it
  holds for every block at every place over `p`, by the change of place of §6.3, which preserves
  defect groups and heights.

**Checks.**
- `S₃` at `p = 2` and `p = 3`: all defect groups are cyclic and all heights are `0`.
- `S₄` at `p = 2` (not covered by §8.4, `D₈` not normal): the character of degree `2` has height
  `1` and `D₈` is nonabelian, as the cited theorems require.
- `G = 1`: one block of defect zero.
- `C₇ × C₂` at `p = 2`, at each of the two places over `2` (§6.3): every block has defect group
  `1 × C₂`, abelian, and all heights `0`.

### 9.2 The Alperin–McKay predicate

Define, for a block `B` with defect group `D` and Brauer correspondent `b'` in `N_G(D)`, the
Alperin–McKay property `|Irr₀(B)| = |Irr₀(b')|`, and the Alperin–McKay property at `p` as its
validity for every block of every finite group `G` (in a fixed universe) at every place of
`ℚ(ζ_{exp G})` over `p`, with the system of Conventions there (ruhstorfer line 16; martinez line
2360, Conjecture 9.9); by the change of system of §6.1 it is equivalent to the same proposition
for every splitting `p`-modular system of every `G`. Prove its instances: blocks of defect zero
and blocks with a normal defect group, where `N_G(D) = G` and `b' = B`. Cited and not planned: the
property at `p = 2` (ruhstorfer line 20, Theorem A). *Needs:* §§6.1 (change of system), 6.3 (with
its change of level, for `Irr₀(b')`), 6.4; base §§6.2, 7.1 (the Brauer correspondent,
Conventions).

- For a given `G`, the equality holds for every block at one place over `p` exactly when it holds
  for every block at every place over `p`, by the change of place of §6.3, which carries `B`, its
  Brauer correspondent and their height zero characters to `σB`, its Brauer correspondent and
  theirs.

**Checks.**
- `S₃`, `p = 2`, `B₀`: `N_G(C₂) = C₂`, and `|Irr₀(B₀)| = 2 = |Irr₀(b')|`.
- `A₅`, `p = 2`, `B₀`: `4 = 4` with `N_G(V₄) = A₄`.
- `SL(2,3)`, `p = 3`: `3 = 3` for the principal block and for the block of `χ₂`, the
  correspondents being the two blocks of `N_G(C₃) = C₆`.

### Examples

At `p = 2` the cited theorems give both properties for every finite group; at odd `p` they give
the height zero property.

### Dependencies

Layers 6 and 8; base §§6.2, 7.1.

## Downstream consumers

The intended consumers are roadmaps on the local–global conjectures for finite groups (the McKay
and Alperin–McKay conjectures and their inductive conditions, Dade's conjectures, the
Isaacs–Navarro refinements), stated in the vocabulary of Layers 6 and 9 and using Layer 4 as a
tool; a roadmap on blocks with cyclic defect groups; character-theoretic local analysis of finite
groups; and a further part on the Isaacs correspondence for groups of odd order and Turull's
theory above the Glauberman correspondence. GlaubermanZStar consumes the base only.

## References

- G. Glauberman, *Correspondences of characters for relatively prime operator groups*, Canad. J.
  Math. 20 (1968), 1465–1488: Theorem 1 (line 100), Theorem 2 (line 234), Lemmas 1–3 (lines 173,
  266, 287), Theorem 3 (line 299), Corollaries 4–6 (lines 364, 375, 454), Lemmas 4–5 (lines 481,
  524), the definition (line 503), Theorem 4 (line 537, the proof of (b) at line 562), Corollaries
  7–9 (lines 601, 607, 623), Theorem 5 (line 636).
- B. Hartley, A. Turull, *On characters of coprime operator groups and the Glauberman character
  correspondence*, J. reine angew. Math. 451 (1994), 175–219: Theorem A (line 84), the reduction
  to prime order (line 91), Definition 3.1 (line 304), Proposition 3.2 (line 306).
- M. Geck, *Green functions and Glauberman degree-divisibility*, Ann. of Math. 192 (2020),
  229–249, arXiv 1904.04586: the statement and its completion (lines 29–36).
- B. Späth, C. Vallejo Rodríguez, *Brauer characters and coprime action*, J. Algebra 457 (2016):
  the compatibility law (lines 118–130).
- W. F. Reynolds, *Blocks and normal subgroups of finite groups*, Nagoya Math. J. 22 (1963),
  15–32: height (line 60), Theorems 1–2 (lines 133, 149), Theorem 7 (line 509), Theorems 8–9
  (lines 531, 542), and the projective-degree step in the proof of Theorem 8 (line 538).
- J. M. Martínez, *Modular representation theory of finite groups*, course notes, Firenze 2024:
  §2.1 (lines 351–566), §3.1–3.2 (lines 696–831), Lemma 4.4 (line 984), Lecture 7 (lines
  1582–1870), Theorems 8.5, 8.8, 8.10, 8.11 and Corollary 8.12 (lines 1928–2131), Lecture 9 (lines
  2161–2360).
- B. Sambale, *Blocks of Finite Groups and Their Invariants*, LNM 2127: Chapter 1 (the `p`-modular
  system, line 312; the Brauer homomorphism and defect groups, Definitions 1.3–1.4, lines 341–351;
  covering, Definition 1.16, line 483; Theorems 1.18, 1.19, lines 499–512).
- R. Kessar, G. Malle, *Quasi-isolated blocks and Brauer's height zero conjecture*, Ann. of Math.
  178 (2013): Theorem 1.1 (line 25).
- G. Malle, G. Navarro, A. A. Schaeffer Fry, P. H. Tiep, *Brauer's height zero conjecture*, Ann.
  of Math. 200 (2024): Theorem A (line 70).
- L. Ruhstorfer, *The Alperin–McKay and Brauer's height zero conjecture for the prime 2*, Ann. of
  Math. 201 (2025): Theorem A (line 20), Corollary B (line 33).
- I. M. Isaacs, *Character Theory of Finite Groups*, 1976 (cited by locator: Theorems 3.12, 6.32,
  Corollaries 6.17, 11.29, Chapter 13).
- G. Navarro, *Characters and Blocks of Finite Groups*, 1998 (cited by locator: Chapter 3, Theorem
  5.9); *Character Theory and the McKay Conjecture*, 2018 (cited by locator: Chapter 2).
- W. Feit, *The Representation Theory of Finite Groups*, 1982 (cited by locator: Chapter IV).
- I. M. Isaacs, *Characters of solvable and symplectic groups*, Amer. J. Math. 95 (1973), named
  for the odd-order correspondence, which is outside the scope.

