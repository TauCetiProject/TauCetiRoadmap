# Roadmap: the Feit–Thompson odd order theorem

**Summary.** This roadmap proves that every finite group of odd order is solvable, following the
Bender–Glauberman local analysis and Part I of Peterfalvi's character theory, and it builds the
reusable libraries that proof needs: the minimal-counterexample reduction (Layer 0), the local
theorems special to solvable groups of odd order (Layer 1), the Dade isometry, coherence and the
cyclic trivial-intersection isometry on native class functions (Layer 2), the `α`, `β`, `σ` and
`τ` prime sets of a maximal subgroup with Thompson transitivity, uniqueness, the Hall cores and
the five types of maximal subgroup (Layer 3), the character analysis of the five types and of the
supporting pair (Layer 4), Bender–Glauberman's Appendix C finite-field comparison and the final
contradiction (Layer 5), and the assembly (Layer 6). The end theorem is
`isSolvable_of_odd_natCard`, with its two equivalent forms `not_isMinimalOddSimple` and
`even_natCard_of_nonabelian_simple`; the reusable exports consumed elsewhere are the Dade
isometry `exists_dadeExtension`, its agreement with induction when every complement is trivial,
`isDadeExtension_eq_indClassFunction`, and the Appendix C theorem `appendixC_prime_le`. The final
solvability theorem has no hypothesis asserting a local structure theorem, a coherence theorem or
the nonexistence of a minimal counterexample: each of those is a theorem of an earlier layer.

Suggested homes: `TauCeti/GroupTheory/OddOrder/` for the local analysis and the assembly,
`TauCeti/RepresentationTheory/CharacterTable/Dade/` for the general character theory of Layer 2,
`TauCeti/GroupTheory/OddOrder/FiniteFieldComparison/` for Appendix C, and
`TauCeti/GroupTheory/OddOrder.lean` for the public endpoint.

## Scope and ownership

The roadmap owns:

- the reduction of a nonsolvable group of odd order to a **minimal odd simple group** (a
  nonabelian simple group of odd order all of whose proper subgroups are solvable), the predicate
  `IsMinimalOddSimple`, and its elementary properties (Layer 0);
- the odd-order local tools of Bender–Glauberman Chapter I that are not general local analysis:
  `p`-length at most one and its formulations, the rank-two `p`-length theorem (Bender–Glauberman
  Theorem 4.18), the `p`-stability of solvable groups of odd order (Theorem 6.1) and the Z-group
  prime-length theorem (Theorem 3.6) (Layer 1);
- Peterfalvi Part I §§1–6 on native class functions: the preliminary lemmas of §1, **Dade data**,
  the **Dade isometry** and its comparison with induction (§2), the **cyclic trivial-intersection
  isometry** (§3), the prime trivial-intersection configurations (§4), **coherence** with its
  uniqueness, restriction and gluing laws (§5) and the coherence theorems of §§5–6 (Layer 2).
  Layer 2 imports nothing from Layers 0–1 and 3–6, nothing from LocalFiniteGroupTheory or
  FiniteGroupExtensionSplitting, and no odd-order hypothesis beyond those the cited theorems
  carry; GlaubermanZStar consumes the trivial-complement comparison from it;
- the prime sets `α(M)`, `β(M)`, `σ(M)`, `τ₁(M)`, `τ₂(M)`, `τ₃(M)`, `κ(M)` of a maximal subgroup,
  the cores `M_α`, `M_β`, `M_σ`, the `σ`-support and its multiplicities, Thompson transitivity,
  the uniqueness theorems, the Hall-core theorems, the proper-subgroup `p`-length theorem, the
  `σ`-complement `E = E₁E₂E₃`, `H(M)`, Frobenius-type data, P-configurations, the **five types**
  and the supporting-pair alternative (Bender–Glauberman Chapters II–III and Peterfalvi §8)
  (Layer 3);
- the character analysis of Peterfalvi §§7 and 9–13: induced families and their Dade data, the
  type-I Frobenius theorem (12.7), the exclusion of the all-type-I case (12.17) and the reciprocal
  supporting maxima of §13 (Layer 4);
- Bender–Glauberman Appendix C, Theorem C, the identification of the norm-one subgroup of a finite
  field with `rootsOfUnity`, and the final comparison of Peterfalvi §14 (Layer 5);
- the assembly and the public corollaries (Layer 6).

The roadmap leaves to named suppliers:

- Mathlib: finite groups, Sylow theory, solvability, nilpotence, commutators, centralizers and
  normalizers, Z-groups, semidirect products and complements, fixed-point-free endomorphisms,
  finite fields, roots of unity and the field norm (`## Exact supplier contracts`);
- Tau Ceti: class functions and their pairing, virtual and irreducible characters, induction of
  class functions, trivial-intersection sets and subgroups, Frobenius complements and kernels,
  Burnside's `pᵃqᵇ` theorem and the norm-one virtual-character theorem;
- CharacterTheory (`TauCetiRoadmap/RepresentationTheory/CharacterTheory`): the Galois action on
  characters, cyclotomic values and degree divisibility; InductionRestriction
  (`TauCetiRoadmap/RepresentationTheory/InductionRestriction`): Frobenius reciprocity, Mackey and
  Clifford theory. Ordinary character theory is not redeveloped here;
- LocalFiniteGroupTheory L1–L7: `p`-cores and `π`-cores, Hall subgroups, the Fitting subgroup,
  coprime action, elementary abelian groups and `p`-rank, extraspecial groups, the Thompson
  subgroup and the replacement theorems, normal `p`-complements, `p`-stability as a predicate
  and the `ZJ` theorem, Thompson's fixed-point-free automorphism theorem and solvable signalizer
  functors. Layer 1 proves the odd-order-specific theorems from those exports and never assumes
  them;
- FiniteGroupExtensionSplitting §2.4 (Gaschütz) and §3.1 (Sylow detection): the splitting of an
  abelian normal subgroup after restriction to a Sylow subgroup, consumed by Layer 1.

Out of scope, and never an input: the classification of finite simple groups or of minimal simple
groups, Glauberman's `Z*` theorem, modular block theory, and Peterfalvi Part II on groups of rank
one. The Brauer–Suzuki argument of GlaubermanZStar consumes Layer 2 and is not consumed here.

## Conventions

- Groups are `[Group G] [Finite G]` with `Nat.card G`; a theorem whose statement has sums over
  `G` takes `[Fintype G]` instead. "Odd order" is `Odd (Nat.card G)`.
- A **minimal odd simple group** is the conjunction `IsMinimalOddSimple G`: odd order, simple,
  nonabelian, every proper subgroup solvable. It is a hypothesis, never a class carrying any of
  the conclusions to be proved; Layer 0 produces one from a counterexample of minimal order.
  "Maximal subgroup" means maximal proper subgroup, and in a minimal odd simple group `M` always
  denotes one.
- Class functions are the native `TauCeti.ClassFunction ℂ G`; `Irr G` is
  `TauCeti.irreducibleCharacters ℂ G` and `ℤ[Irr G]` is `TauCeti.virtualCharacters ℂ G`. The
  **normalized Hermitian pairing** is `⟨f, h⟩ = (Nat.card G)⁻¹ ∑ g, f g · conj (h g)`. On virtual
  characters it equals the native bilinear `TauCeti.ClassFunction.characterPairing f h =
  (Nat.card G)⁻¹ ∑ g, f g · h g⁻¹`, by `TauCeti.conj_apply_of_mem_virtualCharacters`; Layer 2
  proves that comparison once and every isometry statement is read in the Hermitian form. The
  witness of the convention: for `G = C₃` and the character `χ(g) = ω`, `⟨χ, χ⟩ = (1 + ω·ω̄ +
  ω²·ω̄²)/3 = 1`, whereas the unconjugated sum `(1 + ω² + ω⁴)/3 = 0`.
- For `L ≤ G` and `A ⊆ L`, `CF(L, A)` is `supportedClassFunctions L A`, the class functions of `L`
  vanishing outside `A`. For a set `S` of class functions of `L`, `ℤ[S]` is the integral span and
  `ℤ[S, A] = ℤ[S] ∩ CF(L, A)`. A **coherent extension** of a map `τ` defined on `ℤ[S, A]` is an
  additive isometry `ℤ[S] → ℤ[Irr G]` agreeing with `τ` on `ℤ[S, A]`. When a source describes
  `ℤ[S, A]` through degree zero, the theorem that every degree-zero element of `ℤ[S]` vanishes
  off `A` is proved for the family in hand (Layer 2 §2.5); the two domains differ for an arbitrary
  family.
- Dade data write the complement at `a` as `H a`; the coset `a · H a` is written `a H_a`; its
  conjugacy saturation `(a H_a)^G` is the **Dade support at `a`**, and the Dade support is their
  union over `a ∈ A`. Conjugation is `g⁻¹ x g`, as in `IsDadeExtension`.
- For a maximal subgroup `M`, `σ(M)` is the set of primes `p ∣ |M|` such that `N_G(P) ≤ M` for a
  Sylow `p`-subgroup `P` of `M` (independent of `P`, Layer 3 §3.1), and `M_σ = O_{σ(M)}(M)`.
  Cores `O_π`, Hall subgroups, the Fitting subgroup `F(M)` and `p`-rank `m_p` are the
  LocalFiniteGroupTheory objects, formed inside `↥M` and mapped into `G` along `M.subtype`.
- `H(M)` is the product of the normal Sylow subgroups of `M` (Peterfalvi's `H(M)`, math-comp's
  `M`_\F`); it is contained in `F(M)` and differs from it in general (Layer 3 §3.4).
- "T.I. with exact normalizer `N`" for a nonempty set `D` with `1 ∉ D` means `TauCeti.IsTISet D N`
  together with `N_G(D) = N`; Layer 3 §3.4 proves that `N_G(D) = N` follows from the data.
- Universes: `G : Type u` is arbitrary in every statement; the final theorem is proved for every
  universe without a `ULift` detour, because every step is internal to subgroups of `G`.

## Exact supplier contracts

### From Mathlib

| Use here | Exact declarations |
|---|---|
| orders, indices, Lagrange | `Nat.card`, `Subgroup.card_subgroup_dvd_card`, `Subgroup.index`, `Subgroup.card_mul_index`, `Subgroup.FiniteIndex`, `Subgroup.finiteIndex_of_finite` |
| simplicity, commutativity, solvability | `IsSimpleGroup` (extends `Nontrivial`), `IsMulCommutative`, `Group.IsSolvable`, `derivedSeries`, `commutator`, `Group.isSolvable_of_comm`, `Group.isSolvable_of_isSolvable_injective`, `Group.isSolvable_of_surjective`, `Group.isSolvable_iff_subgroup_quotient`, `Group.isSolvable_of_subgroup_quotient`, `IsSimpleGroup.comm_iff_isSolvable`, `Group.IsSolvable.commutator_lt_top_of_nontrivial` |
| nilpotence and `p`-groups | `Group.IsNilpotent`, `IsPGroup`, `IsPGroup.le_sylow_of_normal`, `Sylow`, `Sylow.card_eq_multiplicity`, `Sylow.not_dvd_index`, `IsZGroup` (every Sylow subgroup cyclic), `IsZGroup.coprime_commutator_index` |
| subgroup lattice | `Subgroup.Normal`, `Subgroup.Characteristic`, `Subgroup.normal_of_characteristic`, `Subgroup.normalizer (S : Set G)`, `Subgroup.centralizer`, `Subgroup.center`, `Subgroup.subgroupOf`, `Subgroup.map`, `Subgroup.comap`, `Subgroup.IsComplement'`, `SemidirectProduct`, `IsConj`, `ConjClasses` |
| fixed points and exponents | `MonoidHom.FixedPointFree`, `Monoid.exponent`, `orderOf` |
| finite fields and the norm | `GaloisField`, `GaloisField.card`, `FiniteField.card`, `ZMod`, `CharP`, `rootsOfUnity`, `mem_rootsOfUnity`, `Algebra.norm`, `FiniteField.algebraMap_norm_eq_pow` (the norm of `x` is `x ^ ((|K'| − 1)/(|K| − 1))`), `FiniteField.unitsMap_norm_surjective` |
| arithmetic | `Nat.Prime`, `Nat.Coprime`, `Nat.ModEq` |

### From Tau Ceti

| Use here | Exact declarations |
|---|---|
| class functions and the pairing | `TauCeti.ClassFunction` (`CharacterTable/ClassFunction.lean`), `TauCeti.ClassFunction.characterPairing`, `TauCeti.ClassFunction.characterPairing_apply` (`CharacterTable/Pairing.lean`), `TauCeti.ClassFunction.powMap` |
| irreducible and virtual characters | `TauCeti.irreducibleCharacters`, `TauCeti.irreducibleCharacter`, `TauCeti.virtualCharacters` (`CharacterTable/VirtualCharacter.lean`), `TauCeti.conj_apply_of_mem_virtualCharacters`, `TauCeti.exists_eq_irreducibleCharacter_or_neg` (a norm-one virtual character is `±χᵢ`), `TauCeti.mem_irreducibleCharacters_of_characterPairing_self_eq_one`, `TauCeti.Representation.finrank_dvd_card` |
| Burnside | `TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow` (`CharacterTable/Solvable.lean`) |
| induction of class functions | `Subgroup.indClassFunction : ClassFunction k S →ₗ[k] ClassFunction k G` for `[S.FiniteIndex]`, `Subgroup.indClassFunction_apply` (`Induction/ClassFunction.lean`), `TauCeti.characterPairing_ind_ind`, `TauCeti.characterPairing_ind_ind_of_isTISet`, `TauCeti.isometry_ind_of_isTISet` (`Induction/TrivialIntersection.lean`; these three carry `IsTISubgroup H` and `H ≠ ⊤`, hypotheses Layer 2 §2.4 does without) |
| trivial-intersection sets and Frobenius groups | `TauCeti.IsTISubgroup`, `TauCeti.IsTISet` (fields `subset`, `conj_mem`, `disjoint_conj`; `GroupTheory/TrivialIntersection.lean`), `TauCeti.IsFrobeniusComplement` (`ne_bot ∧ ne_top ∧ isTISubgroup`), `TauCeti.frobeniusKernel`, `TauCeti.frobeniusKernelSubgroup`, `TauCeti.coe_frobeniusKernelSubgroup`, `TauCeti.frobeniusKernelSubgroup_normal`, `TauCeti.frobeniusKernel_isComplement'`, `TauCeti.ClassFunction.indExtend`, `TauCeti.characterPairing_indExtend_indExtend` |

### From `TauCetiRoadmap.RepresentationTheory.CharacterTheory`

| Use here | Section |
|---|---|
| values of characters are cyclotomic integers; the Galois action on `ℤ[Irr G]` and its action on values; the field of values | Layer 4 (§4.2, §4.4) |
| central characters and degree divisibility `χ(1) ∣ |G|` | Layer 4 (§4.3) |
| Burnside's `pᵃqᵇ` theorem as background, with the pinned name above | Layer 4 (§4.6) |

### From `TauCetiRoadmap.RepresentationTheory.InductionRestriction`

| Use here | Section |
|---|---|
| induced characters, the induced-character formula, Frobenius reciprocity | Layer 2 |
| the Mackey decomposition and the intertwining-number criterion | Layers 3–4 |
| Clifford theory over a normal subgroup: restriction of an irreducible to the conjugates of a constituent, inertia groups, induction from the inertia group | Layer 5 |
| the virtual-character ring | Layer 6 |

### From `TauCetiRoadmap.LocalFiniteGroupTheory`

| Use here | Section |
|---|---|
| `pCore p H`, `piCore π H`, `pPrimeCore p H`, `O_π(N) = O_π(H) ⊓ N` for `N ⊴ H`; Hall subgroups of solvable groups, their existence, conjugacy and the containment of every `π`-subgroup in one; Schur–Zassenhaus conjugacy | L1 |
| the Fitting subgroup `fitting H`, its nilpotence and characteristic property, `fitting_eq_iSup_pCore`, `C_G(F(G)) ≤ F(G)` for solvable `G` | L2 |
| coprime action: invariant Sylow subgroups, fixed points modulo a normal subgroup, `G = C_G(A)[G, A]`, generation by centralizers for a noncyclic elementary abelian `A`, Thompson's `A × B` lemma | L3 |
| `IsElementaryAbelian p E`, `pRank p G` (`m_p`), rank-one `p`-groups are cyclic for odd `p`, `IsExtraspecial p P`, the Thompson subgroup `J(P)`, Thompson's and Glauberman's replacement theorems | L4 |
| `HasNormalPComplement p G`, Frobenius's normal `p`-complement theorem, the predicate `IsPStable p G` (used here as a definition, never as an assumption), the `ZJ` theorem, the Glauberman–Thompson and Thompson normal `p`-complement theorems | L5 |
| Thompson's fixed-point-free automorphism theorem `isNilpotent_of_fixedPointFree`, nilpotence of Frobenius kernels `isNilpotent_of_coe_eq_frobeniusKernel` | L6 |
| signalizer functors, `IsSignalizerFunctor p A θ`, `signalizerCompletion`, Glauberman's solvable signalizer functor theorem `signalizerCompletion_complete` for `m_p(A) ≥ 3` | L7 |

All of L3's theorems marked † assume that `A` or `G` is solvable; in Layer 3 that hypothesis is
discharged by `IsMinimalOddSimple.proper_solvable`, never by the theorem being proved.

### From `TauCetiRoadmap.FiniteGroupExtensionSplitting`

| Use here | Section |
|---|---|
| Gaschütz's splitting theorem `exists_isComplement'_of_coprime_index`: an abelian normal `N` with a local complement in `H` of index prime to `|N|` has a global complement | §2.4 |
| Sylow detection `exists_isComplement'_iff_sylow`: an abelian normal `p`-subgroup splits iff it splits in a Sylow `p`-subgroup | §3.1 |

## How to read the build

Layer 0 reduces the theorem to the nonexistence of a minimal odd simple group and records what
such a group satisfies. Layer 1 proves the solvable odd-order local theorems that Chapter I of
Bender–Glauberman adds to general local analysis. Layer 2 is independent of Layers 0, 1 and 3–6 and of the local-analysis suppliers: it
builds the Dade isometry, coherence and the cyclic trivial-intersection isometry for an arbitrary
finite group, and is the part other developments consume. Layer 3 applies Layers 1–2's group
theory inside a minimal odd simple group: prime sets, transitivity, uniqueness, Hall cores, the
proper-subgroup `p`-length theorem and the five types, ending with the supporting-pair
alternative. Layer 4 is the character analysis: coherence of the local families, the type-I
Frobenius theorem, the exclusion of the all-type-I case and the orientation of the supporting
pair. Layer 5 proves Appendix C and runs Peterfalvi §14 to a contradiction; Layer 6 assembles.
`README.md` is normative; `Suggested.lean` states the headline theorems (the three forms of the
odd order theorem, the Dade isometry and its comparison with induction, and Appendix C) against
the pinned APIs with the four definitions they need, and nothing else.

---

## Layer 0: minimal counterexamples (F0)

### 0.1 Odd order under subgroups, quotients and sections

Prove that odd order passes to subgroups (`Subgroup.card_subgroup_dvd_card`: an odd number has
only odd divisors), to quotients by normal subgroups (`Subgroup.card_mul_index`) and hence to
sections, with the strict inequalities `Nat.card H < Nat.card G` for `H ≠ ⊤` and
`Nat.card (G ⧸ N) < Nat.card G` for `N ≠ ⊥`. Prove the extension step: if `N ⊴ G` and both `N`
and `G ⧸ N` are solvable then `G` is solvable (`Group.isSolvable_of_subgroup_quotient`), and its
contrapositive for a nonsolvable `G`: some proper normal subgroup or some proper quotient is
nonsolvable, or `G` is simple. *Needs:* Mathlib `Subgroup.card_subgroup_dvd_card`,
`Subgroup.card_mul_index`, `Group.isSolvable_of_subgroup_quotient`, `Group.isSolvable_of_surjective`,
`Group.isSolvable_of_isSolvable_injective`.

**Checks.**
- `C₆ = C₂ × C₃` has even order while its subgroup `C₃` has odd order: oddness passes down, not
  up; a wrong statement "a group with an odd-order subgroup has odd order" fails here.
- The quotient `S₃ ⧸ A₃ ≅ C₂` has even order although `A₃` has odd order: oddness of a quotient
  needs oddness of the whole group, not of the kernel.
- `G = C₇ ⋊ C₃` (order `21`): every subgroup has order `1`, `3`, `7` or `21`, all odd, and the
  quotient by `C₇` has order `3`; the extension step recovers solvability of `G` from `C₇` and
  `G ⧸ C₇ ≅ C₃`.

### 0.2 Minimal odd simple groups and the reduction

Define `IsMinimalOddSimple G` as the conjunction of `Odd (Nat.card G)`, `IsSimpleGroup G`,
`¬ IsMulCommutative G` and `∀ H : Subgroup G, H ≠ ⊤ → Group.IsSolvable H`. Prove that a
nonsolvable finite group of odd order has a section (a quotient of a subgroup) that is a minimal
odd simple group: take a nonsolvable section of least order; by §0.1 it is simple, and it is
nonabelian because an abelian group is solvable (`Group.isSolvable_of_comm`); its proper
subgroups are sections of smaller order, hence solvable. Prove the equivalence of the three
public forms: `isSolvable_of_odd_natCard` (every finite group of odd order is solvable),
`not_isMinimalOddSimple` (no minimal odd simple group exists) and
`even_natCard_of_nonabelian_simple` (a finite nonabelian simple group has even order), without
assuming any of them in the local analysis. *Needs:* §0.1, Mathlib `IsSimpleGroup`,
`IsMulCommutative`, `Group.isSolvable_of_comm`, `IsSimpleGroup.comm_iff_isSolvable`.

**Checks.**
- The trivial group is not a minimal odd simple group: `IsSimpleGroup` extends `Nontrivial`.
- `C₃` has odd order and is simple, but `IsMulCommutative C₃` holds, so it is not minimal odd
  simple; a wrong definition omitting `nonabelian` would admit every group of prime order and
  make `not_isMinimalOddSimple` false.
- `C₇ ⋊ C₃` has odd order and is nonabelian, but `C₇` is a proper nontrivial normal subgroup, so
  it is not simple.
- `A₅` is nonabelian simple with all proper subgroups solvable, but `Nat.card A₅ = 60` is even.
- An infinite group `G` has `Nat.card G = 0`, which is not odd, so `IsMinimalOddSimple G` is
  false without a separate finiteness field.

### 0.3 Elementary properties of a minimal odd simple group

For a minimal odd simple group `G`, prove: `Subgroup.center G = ⊥`; `commutator G = ⊤`
(`Group.IsSolvable.commutator_lt_top_of_nontrivial` in contrapositive); `Subgroup.centralizer {x}
≠ ⊤` for `x ≠ 1`; every maximal subgroup `M` satisfies `Subgroup.normalizer (M : Set G) = M`;
every proper subgroup lies in a maximal subgroup (finiteness); and the instance
`Group.IsSolvable ↥H` for every proper subgroup `H`, exposed so that the L3 theorems apply inside
`H` (Bender–Glauberman §7, the observations following Hypothesis 7.1). *Needs:* §0.2, Mathlib
`Subgroup.center`, `Subgroup.normalizer`, `commutator`.

**Checks.**
- In `C₇ ⋊ C₃` (not simple) the normalizer of the maximal subgroup `C₇` is the whole group:
  self-normalization of maximal subgroups uses simplicity.
- In `A₅` (simple, even order) the center is trivial and every maximal subgroup (`A₄`, `D₁₀`,
  `S₃`) is self-normalizing: the statements hold, and only the odd-order hypothesis fails.
- In `S₃` the centralizer of a transposition is proper and the centralizer of the identity is
  `⊤`: the hypothesis `x ≠ 1` is needed.

### Examples

The reduction applied to `C₇ ⋊ C₃` produces no minimal odd simple section, because the group is
solvable. The three endpoint forms are equivalent for every ambient universe.

### Dependencies

Mathlib `Subgroup.card_subgroup_dvd_card`, `Subgroup.card_mul_index`, `Group.IsSolvable` and its
transfer lemmas, `IsSimpleGroup`, `IsMulCommutative`.

## Layer 1: odd-order local tools (F1)

### 1.1 `p`-length at most one

For a finite solvable group `H` and a prime `p`, define **`p`-length at most one** as: a Sylow
`p`-subgroup of `H ⧸ O_{p'}(H)` is normal, equivalently `O_{p',p,p'}(H) = H` (Bender–Glauberman
§1, the definition before Lemma 1.1). Prove invariance under isomorphism, passage to subgroups
and to quotients, and the normal-complement formulations: `H` has `p`-length at most one iff
`O_{p',p}(H)` contains a Sylow `p`-subgroup of `H` iff `H ⧸ O_{p',p}(H)` is a `p'`-group.
*Needs:* LocalFiniteGroupTheory L1 (`pPrimeCore`, `piCore` of a quotient), Mathlib `Sylow`,
`IsPGroup`.

**Checks.**
- `S₃`, `p = 2`: `O_{2'}(S₃) = A₃` and `S₃ ⧸ A₃ ≅ C₂` is a `2`-group, so the `2`-length is one,
  although no Sylow `2`-subgroup of `S₃` is normal; a wrong definition "a Sylow `p`-subgroup of
  `H` is normal" rejects this instance.
- `S₃`, `p = 3`: `O_{3'}(S₃) = 1` and `A₃` is a normal Sylow `3`-subgroup: `3`-length one.
- `S₄`, `p = 2`: `O_{2'}(S₄) = 1`, `O_{2',2}(S₄) = V₄`, `S₄ ⧸ V₄ ≅ S₃` is not a `2'`-group, so the
  `2`-length is two: a negative control.
- `S₄`, `p = 3`: `O_{3'}(S₄) = V₄` and the Sylow `3`-subgroup of `S₄ ⧸ V₄ ≅ S₃` is normal:
  `3`-length one.

### 1.2 Rank at most two forces `p`-length at most one

Prove: a finite solvable group `H` of odd order with `m_p(H) ≤ 2` has `p`-length at most one;
more precisely `O_{p'}(H')` is a Hall `p'`-subgroup of `H'` and `H ⧸ O_{p',p}(H)` is an abelian
`p'`-group (Bender–Glauberman, Theorem 4.18(c), (e)). The route is the chief-factor and
faithful-module analysis of Bender–Glauberman §4 on a minimal counterexample: a faithful
irreducible module for `H ⧸ O_{p',p}(H)` over `𝔽_p` on which a `p`-element acts quadratically,
the fixed-space estimates of Theorems 4.16–4.17, and the extraspecial-module estimate for
`O_p(H ⧸ O_{p'}(H))`. Build those faithful chief-factor representations and the coprime
fixed-space and extraspecial-module estimates as targets of this subsection, with their odd-order
and solvability hypotheses explicit. The unrestricted statement for every proper subgroup of a
minimal odd simple group is Layer 3 §3.3; it needs the large-rank core theory and is not assumed
here. *Needs:* §1.1, LocalFiniteGroupTheory L3 (coprime action), L4 (`pRank`,
`IsExtraspecial`, the nondegenerate commutator form on `P ⧸ Z(P)`), FiniteGroupExtensionSplitting
§2.4 and §3.1 (an abelian normal subgroup that splits in a Sylow subgroup splits globally, used
to split a chief factor off its centralizer).

**Checks.**
- A `p`-group has `p`-length at most one for every rank: the theorem is only informative when
  `|H|` has at least two prime divisors.
- `C₇ ⋊ C₃` with `p = 3`: `m_3 = 1`, `O_{3'} = C₇`, quotient `C₃`: `3`-length one, consistent.
- Negative control for the rank hypothesis: with `V = 𝔽₃⁶` the faithful irreducible module of
  `C₇ ⋊ C₃` (the order of `3` modulo `7` is `6`), the group `V ⋊ (C₇ ⋊ C₃)` of order `3⁷ · 7` is
  solvable of odd order with `3`-length two (`O_{3'} = 1`, `O_3 = V`, then `C₇`, then `C₃`); its
  `3`-rank is at least `6`, so the hypothesis `m_3 ≤ 2` is what excludes it.
- Negative control for the odd-order hypothesis: `S₄` has `2`-rank `2` and `2`-length two (§1.1).

### 1.3 `p`-stability of solvable groups of odd order

Prove: a finite solvable group of odd order is `p`-stable for every odd prime `p`, in the sense
of LocalFiniteGroupTheory L5's `IsPStable p G` (Bender–Glauberman, Theorem 6.1 and Theorem
A.4(b): the Hall–Higman quadratic-action argument). State the quadratic-action criterion
explicitly: if a `p'`-element `x` of a solvable group of odd order acts on a faithful
`𝔽_p`-module `V` with `[V, x, x] = 0`, then `x` acts trivially. The route is the faithful
chief-factor representation of §1.2 and the estimate that a quadratic `p'`-element of odd order
on an irreducible module over `𝔽_p` is trivial. *Needs:* §1.2, LocalFiniteGroupTheory L5
(`IsPStable`, the equivalence of its two forms), L3 (coprime action).

**Checks.**
- `S₄` is not `2`-stable: for `P = V₄ ⊴ S₄` a transposition `x` satisfies `[V₄, x, x] = 1`, but
  its image in `S₄ ⧸ C(V₄) ≅ S₃` is not in `O_2(S₃) = 1`; the odd-order hypothesis excludes it.
- In `C₇ ⋊ C₃` with `p = 3`, the Sylow `3`-subgroup is self-normalizing and self-centralizing,
  so the condition holds vacuously.
- A `p`-group is `p`-stable: `N_G(P) ⧸ C_G(P)` is a `p`-group for every `P`.

### 1.4 The Z-group prime-length theorem

Prove: let `Y = J ⋊ A` be a finite solvable group of odd order with `gcd(|J|, |A|) = 1`, let
`A₀ ≤ A` have prime order, and suppose `C_J(A₀)` satisfies Mathlib's `IsZGroup`; then `[J, A]`
has `p`-length at most one for every prime `p` (Bender–Glauberman, Theorem 3.6). The route is
induction on `|Y|` through the Frobenius-type actions of Theorems 3.4–3.5 on chief factors.
*Needs:* §1.1, §1.3, LocalFiniteGroupTheory L3 (`G = C_G(A)[G, A]`, invariant Sylow subgroups),
L6 (Thompson's theorem), Mathlib `IsZGroup`.

**Checks.**
- `Y = C₇ ⋊ C₃`, `J = C₇`, `A = A₀ = C₃`: `C_J(A₀) = 1` is a Z-group and `[J, A] = C₇` has
  `p`-length at most one for every `p`.
- `Y = C₅ × (C₇ ⋊ C₃)`, `J = C₅ × C₇`, `A = A₀ = C₃` acting trivially on `C₅`: `C_J(A₀) = C₅` is
  cyclic, hence a Z-group, and `[J, A] = C₇ ≠ J`; the conclusion is about `[J, A]`, not `J`.
- `J = C₇ × C₁₃`, `A = A₀ = C₃` acting without fixed points on both factors: `C_J(A₀) = 1` and
  `[J, A] = J` is abelian.
- The coprimality hypothesis is not implied by the others: `S₃ = C₃ ⋊ C₂` has `gcd = 1`, while
  `C₉ ⋊ C₃` (with `C₃` acting through the automorphism `x ↦ x⁴`) is of the form `J ⋊ A` only with
  `gcd(|J|, |A|) = 3`.

### Examples

The `2`-length of `S₄` (two) against the `3`-length of `S₄` (one); the groups
`𝔽₃³ ⋊ (C₁₃ ⋊ C₃)` of order `1053` (`C₁₃ ⋊ C₃` acts faithfully and irreducibly on `𝔽₂₇`, `C₁₃` by
multiplication by an element of order `13` and `C₃` by the Frobenius `x ↦ x³`, so `O_{3'} = 1`,
`O_3 = 𝔽₃³`, `O_{3,3'} = 𝔽₃³ ⋊ C₁₃` and the quotient is `C₃`: `3`-length two) and the
`𝔽₃⁶ ⋊ (C₇ ⋊ C₃)` of §1.2 as odd-order witnesses that `p`-length two occurs, and why their
`3`-ranks (`3`, and at least `6`) exclude them from §1.2.

### Dependencies

Layer 0 (solvability of proper subgroups when applied in Layer 3); LocalFiniteGroupTheory
L1, L3, L4, L5, L6; FiniteGroupExtensionSplitting §2.4, §3.1; Mathlib `Sylow`, `IsPGroup`,
`IsZGroup`.

## Layer 2: Dade isometries and coherent families (F2)

Everything in this layer is stated for an arbitrary finite group `G` on native class functions
and imports nothing from Layers 0–1 and 3–6; its suppliers are Mathlib, Tau Ceti, CharacterTheory
and InductionRestriction only, so it does not wait for LocalFiniteGroupTheory or
FiniteGroupExtensionSplitting.

### 2.1 Preliminaries from Peterfalvi §1

Prove, on `TauCeti.ClassFunction ℂ G`: an irreducible character of a group of odd order is real
iff it is trivial (Peterfalvi (1.1)); an irreducible character whose kernel does not contain the
normal subgroup `H` vanishes at every `g` with `C_H(g) = 1` (1.2); the restriction–induction
dictionary for a basis of `CF(H, A)` with `A ⊴ H`: a class function of `G` agrees on `A` with a
combination `∑ dᵢ χᵢ` iff its pairings with the induced basis elements are the corresponding
coefficient sums, and the orthonormal consequence (1.3)(a), (b); the **norm-two decomposition**
`τ(χᵢ − χ₀) = ±(ψᵢ − ψ₀)` for an isometry `τ` from `ℤ[Χ, A]` into `ℤ[Irr G, G^#]`, where `Χ` is a
free family of at least two irreducibles of equal degree with the differences supported on `A`
(1.4); Clifford's restriction formula for an induced irreducible (1.5)(a) and the kernel
comparison for induced irreducibles (1.6)(a); and the degree bound `χ(1) ≤ |G : C| · √|C : D|`
for `B ⊴ C ≤ G`, `B ≤ ker χ`, `B ≤ D ≤ C` with `D ⧸ B` central in `C ⧸ B` (1.8). Each carries its
hypotheses as stated; none is quantified over an arbitrary family. *Needs:* Tau Ceti
`TauCeti.exists_eq_irreducibleCharacter_or_neg`,
`TauCeti.mem_irreducibleCharacters_of_characterPairing_self_eq_one`,
`TauCeti.conj_apply_of_mem_virtualCharacters`; InductionRestriction Layer 2 (Frobenius
reciprocity), Layer 5 (Clifford); CharacterTheory §4.3 (degree divisibility).

**Checks.**
- (1.1) on `C₃`: the two nontrivial characters `ω, ω²` are complex conjugates of each other and
  neither is real; on `S₃` (even order) the sign character is real and nontrivial, so the
  odd-order hypothesis is needed.
- (1.4) on `H = C₃`, `A = C₃^#`, `Χ = {ω, ω²}` and `G = C₇ ⋊ C₃` with `τ = Ind`: `‖ω − ω²‖² = 2`,
  `Ind ω − Ind ω² = μ_ω − μ_{ω²}` is the difference of the two distinct linear characters of `G`
  restricting to `ω` and `ω²`, of norm `2`: each of the two degree-`3` irreducibles of `G`
  restricts to `L` as `1 + ω + ω²` (it vanishes off `C₇`), so it occurs once in `Ind ω` and once
  in `Ind ω²` and cancels in the difference.
- (1.8) on `G = S₃`, `C = D = A₃`, `B = 1` (`D ⧸ B = A₃` is central in the abelian `C ⧸ B`):
  `χ(1) ≤ |G : C| · √|C : D| = 2 · 1 = 2`, attained by the two-dimensional character; with
  `D = 1` instead the bound is only `2 · √3`.

### 2.2 Dade data and the Dade support

Define `DadeDatum L A H` for `L ≤ G`, `A ⊆ L \ {1}` and `H : G → Subgroup G` by: `A` is
`L`-invariant; `L` controls `G`-fusion in `A` (two elements of `A` conjugate in `G` are conjugate
in `L`); for each `a ∈ A`, `H a ≤ C_G(a)` is normal in `C_G(a)`, meets `C_L(a)` trivially and
satisfies `(H a) · C_L(a) = C_G(a)`; and `gcd(|H a|, |C_L(b)|) = 1` for all `a, b ∈ A` (Peterfalvi
Definition (2.2); Feit–Thompson Definition 9.1, "tamely imbedded subset", whose `H_i` are the
complements). Define `CF(L, A) = supportedClassFunctions L A`. Prove: `H (l a l⁻¹) = l (H a) l⁻¹`
for `l ∈ L` (2.4)(a); the Dade supports `(a H_a)^G`, `a ∈ A`, are disjoint unless `a` and `b` are
`L`-conjugate, in which case they coincide (2.4)(b); `N_G(a H_a) = C_G(a)` and `a H_a` is a
trivial-intersection set for `C_G(a)` (2.4)(c); `1` is not in the Dade support; `H a` is the
unique normal complement to `C_L(a)` in `C_G(a)` of order prime to `|C_L(a)|`, so the data
determine `H` on `A` (a second such complement `K` maps into `C_G(a) ⧸ H a ≅ C_L(a)` with image of
order dividing both `|K| = |H a|` and `|C_L(a)|`, hence trivial, so `K ≤ H a` and the orders
agree); and
`CF(L, A)` has dimension the number of `L`-classes contained in `A` when `A` is a union of
`L`-classes. *Needs:* Mathlib `Subgroup.centralizer`, `Subgroup.IsComplement'`,
`Subgroup.IsComplement'.card_mul_card`, `Subgroup.card_map_dvd`, `Subgroup.card_dvd_of_le`,
`QuotientGroup.mk'`, `IsConj`; Tau Ceti `TauCeti.ClassFunction`.

**Checks.**
- `G = S₃`, `L = A₃`, `A = A₃^#`, `H a = ⊥`: the two `3`-cycles are conjugate in `S₃` by a
  transposition but not in the abelian `L`, so the fusion clause fails and this is not a Dade
  datum. (The map it would define is not an isometry: see §2.4.)
- `G = S₃`, `L = ⟨(1 2)⟩`, `A = {(1 2)}`, `H a = ⊥`: `C_G((1 2)) = L`, fusion and invariance are
  trivial, so this is a Dade datum with trivial complements, and `A` is a T.I. set with normalizer
  `L`.
- `G = C₃ × S₃`, `L = S₃`, `A` the three transpositions, `H a = C₃`: `C_G((1 2)) = C₃ × ⟨(1 2)⟩ =
  H a ⋊ C_L(a)`, `H a` is normal and central, `gcd(3, 2) = 1`: a Dade datum with nontrivial
  complements; the Dade support is `C₃ × {transpositions}`, nine elements.
- Negative control for coprimality: `G = S₄`, `L = S₃ = Stab(4)`, `A` the transpositions of `L`,
  `H a = ⟨(3 4)⟩` for `a = (1 2)`: `C_G((1 2)) = ⟨(1 2), (3 4)⟩ = H a × C_L(a)`, every clause
  holds except coprimality, `gcd(|H a|, |C_L(b)|) = gcd(2, 2) = 2`; the complement is not
  determined (`⟨(3 4)⟩` and `⟨(1 2)(3 4)⟩` are both normal complements to `C_L(a)` in the Klein
  four-group `C_G(a)`), and the map of §2.3 would send the indicator
  of the transpositions of `L` (norm `3/6`) to the indicator of the nine elements of order two of
  `S₄` (norm `9/24`), so the coprimality clause is what makes §2.3 true.
- `CF(L, A)` for `L = S₃` and `A = {(1 2)}` is zero: a class function nonzero at `(1 2)` is
  nonzero at `(1 3) ∉ A`; a wrong definition on arbitrary functions would give dimension one.

### 2.3 The Dade isometry

Define `IsDadeExtension L A H T`, for a `ℂ`-linear `T : CF(L, A) → ClassFunction ℂ G`, by three
clauses: `T` preserves the normalized Hermitian pairing; `(T f)(g⁻¹ (a u) g) = f a` for `a ∈ A`,
`u ∈ H a`, `g ∈ G`; and `T` carries virtual characters of `L` to virtual characters of `G`. Prove
`exists_dadeExtension`: for every Dade datum there is such a `T` (Peterfalvi Definition (2.5),
whose well-definedness is (2.4)(b); the isometry is (2.6)(a); integrality is (2.6)(b)). Prove the
uniqueness: a map satisfying the first two clauses vanishes off the Dade support (its norm equals
that of the Dade map, with which it agrees on the support, and the two supports are disjoint),
hence equals the Dade map; so `T` is determined and the third clause is a theorem about it, not a
choice. Prove also Dade reciprocity `⟨T f, φ⟩ = ⟨f, Res_L φ⟩` for `φ` constant on each coset
`a H_a` (2.7); the restriction of the datum to an `L`-invariant subset `A₁ ⊆ A` and the
compatibility of the two Dade maps (2.11); and the expansion of `T f` as a signed sum of
inductions from the normalizers `M(B) = H(B) ⋊ N_L(B)` of nonempty subsets `B ⊆ A` (2.8),
(2.10). *Needs:* §2.2, Tau Ceti `TauCeti.virtualCharacters`,
`TauCeti.conj_apply_of_mem_virtualCharacters`, `Subgroup.indClassFunction`; InductionRestriction
Layer 2.

**Checks.**
- `L = G`, `A` any `G`-invariant subset of `G^#`, `H a = ⊥`: `T` is the identity of `CF(G, A)`.
- `G = C₃ × S₃`, `L = S₃`, `A` the transpositions, `H a = C₃`, `f` the indicator of `A`:
  `T f` is the indicator of the nine elements `z · (i j)`, `‖f‖² = 3/6 = 1/2 = 9/18 = ‖T f‖²`;
  the induced function `Ind f` is `3` on the transpositions and `0` on `z · (i j)` for `z ≠ 1`,
  of norm `27/18 = 3/2`, so `T` is not induction when the complements are nontrivial.
- The second clause pins the value `f a`, not `|H a| · f a` or `f a / |H a|`: in the previous
  instance the rescaled models have norm `9/2` and `1/18`.
- `G = C₇ ⋊ C₃`, `L = C₃`, `A = C₃^#`, `H a = ⊥`, `f = ω − ω²`: `T f = Ind ω − Ind ω²` is the
  difference of the two linear characters of `G` restricting to `ω` and `ω²` (the (1.4) Check of
  §2.1) and `(T f)(a) = f a` for `a ∈ A`, since an element
  of `L^#` is conjugated into `L` only by elements of `L`.

### 2.4 Trivial complements and ordinary induction

Prove: for a Dade datum with `A ≠ ∅` and `H a = ⊥` for every `a ∈ A`, the set `A` is a
trivial-intersection set with normalizer `L` (`TauCeti.IsTISet A L` and `N_G(A) = L`), and
conversely a nonempty T.I. set `A ⊆ L \ {1}` with normalizer `L` is a Dade datum with trivial
complements (Peterfalvi (2.3)).
Prove `isDadeExtension_eq_indClassFunction`: under such a datum the Dade isometry agrees on
`CF(L, A)` with the native `Subgroup.indClassFunction L` (the supplement to (2.3) and (2.6)(a);
Isaacs, Lemma 7.7), so induction is an isometry on `CF(L, A)` and `(Ind f) a = f a` for `a ∈ A`.
This comparison asks nothing of `L` beyond the datum: the pinned
`TauCeti.characterPairing_ind_ind_of_isTISet` assumes in addition `IsTISubgroup L` and `L ≠ ⊤`,
hypotheses that fail for the sets used in Layer 4 and in the Brauer–Suzuki argument. *Needs:*
§2.2, §2.3, Tau Ceti `TauCeti.IsTISet`, `Subgroup.indClassFunction`,
`Subgroup.indClassFunction_apply`.

**Checks.**
- `G = S₃`, `L = ⟨(1 2)⟩`, `A = {(1 2)}`, `f` with `f (1 2) = 1`, `f 1 = 0`: `(Ind f)(1 2) =
  |C_G((1 2))| / |C_L((1 2))| · 1 = 1` and `Ind f` vanishes on the `3`-cycles; `‖f‖² = 1/2 = 3/6 =
  ‖Ind f‖²`.
- `G = S₃`, `L = A₃`, `A = A₃^#` (not a Dade datum, §2.2): `f = ω − ω²` has norm `2` while
  `Ind ω = Ind ω² = ρ`, so `Ind f = 0`; induction is not an isometry on `CF(L, A)` when fusion is
  not controlled by `L`.
- `L = G`: the comparison reads `T = Ind_G^G = id`.
- `A = ∅` is a Dade datum for every `L` (each clause is vacuous) and `TauCeti.IsTISet ∅ L` holds,
  but `N_G(∅) = G ≠ L` for `L ≠ ⊤`: the forward direction needs `A ≠ ∅`, while the comparison
  `T = Ind` is unaffected since `CF(L, ∅) = 0`.
- `G = C₇ ⋊ C₃`, `L = C₃`, `A = L^#`: `L` is a T.I. subgroup, so the pinned
  `TauCeti.isometry_ind_of_isTISet` applies too and the two isometry statements agree.

### 2.5 Integral spans, coherence, uniqueness and gluing

For a set `S` of class functions of `L` define `ℤ[S] = Submodule.span ℤ S` and
`ℤ[S, A] = ℤ[S] ⊓ CF(L, A)`. For a map `τ : ℤ[S, A] → ClassFunction ℂ G`, say that `ν : ℤ[S] →+
ClassFunction ℂ G` is a **coherent extension** of `τ` when `ν` lands in `ℤ[Irr G]`, preserves the
Hermitian pairing and agrees with `τ` on `ℤ[S, A]`; `S` is **coherent** when one exists
(Peterfalvi Definition (5.1); the additive form, from which a `ℂ`-linear extension follows when
`S` consists of virtual characters, is the one used). Prove: the degree-zero theorem, that for
each family used in Layer 4 (the induced families of §4.1 with `A = L^#`) every degree-zero
element of `ℤ[S]` vanishes off `A`, so `ℤ[S, A]` is the degree-zero subspace; that `ν` carries an
irreducible of `S` to a signed irreducible (`TauCeti.exists_eq_irreducibleCharacter_or_neg`) and
conjugate pairs to conjugate pairs; the uniqueness of a coherent extension on `ℤ[S, A]` and, when
`|S| ≥ 2` and `S` is closed under conjugation, up to the stated sign laws on `ℤ[S]`; restriction
of a coherent extension to a subfamily; and the gluing of coherent extensions of two families
that agree on the intersection of their domains (5.3)(a), (b). *Needs:* §2.1 (1.4), Tau Ceti
`TauCeti.exists_eq_irreducibleCharacter_or_neg`, `TauCeti.virtualCharacters`.

**Checks.**
- `L = S₃`, `S = {ε, ρ}` (sign and the two-dimensional character), `A = S₃^#`: `ρ − 2ε` has
  degree zero and vanishes at `1`, so it lies in `ℤ[S, A]`; for `A` the set of `3`-cycles,
  `(ρ − 2ε)(1 2) = 0 − 2 · (−1) = 2 ≠ 0`, so the degree-zero subspace is not inside `CF(L, A)`:
  the two domains differ, and the degree-zero theorem is a theorem about specific families.
- `L = G`, `τ = id`: the inclusion `ℤ[S] → ℤ[Irr G]` is a coherent extension for every `S` of
  virtual characters.
- A family with `ℤ[S, A] = 0` (for instance `S = {1}` with `A = L^#`): coherence then asks only
  for an isometry `ℤ[S] → ℤ[Irr G]`, which always exists; the content of coherence is the
  agreement on `ℤ[S, A]`, which is why every coherence theorem below carries a hypothesis making
  `ℤ[S, A]` large.
- Sign law: if `ν` is a coherent extension so is `−ν` only when `ℤ[S, A] = 0`; otherwise `ν` is
  pinned by `τ` on `ℤ[S, A]`.

### 2.6 The cyclic trivial-intersection isometry (§3)

Let `W = W₁ × W₂` be cyclic of odd order with `W₁, W₂ ≠ 1`, and let `V = W \ (W₁ ∪ W₂)` be a T.I.
set with normalizer `W` (`TauCeti.IsTISet V W` and `N_G(V) = W`; Peterfalvi Hypothesis (3.1)).
For `αᵢ ∈ Irr W₁` and `βⱼ ∈ Irr W₂` write `w_ij` for the character of `W` restricting to `αᵢ` and
`βⱼ`, and `a_ij = (1 − w_i0)(1 − w_0j) = 1 − w_i0 − w_0j + w_ij`. Prove that `a_ij` vanishes on
`W₁ ∪ W₂` and that the `a_ij` with `i, j ≠ 0` form a basis of `CF(W, V)`. Prove (3.5): there is
an array `ξ_ij ∈ ℤ[Irr G]`, orthonormal, with `ξ_00 = 1` and `Ind_W^G a_ij = 1 − ξ_i0 − ξ_0j +
ξ_ij` for `i, j ≠ 0`. Deduce Theorem (3.2): there is a linear `σ : CF(W) → CF(G)` that is an
isometry from `ℤ[Irr W]` into `ℤ[Irr G]`, with `σ 1 = 1`, `σ = Ind_W^G` on `CF(W, V)`, and
`σ(w_ij) = ξ_ij` a signed irreducible for every `(i, j)`; `σ φ` agrees with `φ` on `V`
(3.2)(d); and a class function of `G` orthogonal to the image of `σ` vanishes on `V` (3.2)(e).
Prove the exchange identity (3.7), the bound (3.8) on the number of `ξ_ij` a virtual character of
bounded norm can involve, and the power-map compatibility (3.9): `σ` commutes with the Galois
action `TauCeti.ClassFunction.powMap` of CharacterTheory §4.4. Prove that `W` cyclic forces
`gcd(|W₁|, |W₂|) = 1`. *Needs:* §2.3, §2.4, §2.5, Tau Ceti `TauCeti.IsTISet`,
`Subgroup.indClassFunction`; CharacterTheory §4.4; InductionRestriction Layer 2.

**Checks.**
- `|W₁| = 3`, `|W₂| = 5`: `|V| = 15 − 3 − 5 + 1 = 8 = (3 − 1)(5 − 1)`, and `CF(W, V)` has
  dimension `8 = 2 · 4`, the number of pairs `(i, j)` with `i, j ≠ 0`.
- `a_ij` at `x ∈ W₁`: `w_0j(x) = 1`, so `a_ij(x) = (1 − w_i0(x))(1 − 1) = 0`; the factorization
  is what makes the vanishing on `W₁ ∪ W₂` visible.
- `‖a_ij‖² = 4` for `i, j ≠ 0` (four distinct irreducibles with coefficients `±1`), and
  `‖Ind a_ij‖² = 4` by §2.4, consistent with `1 − ξ_i0 − ξ_0j + ξ_ij` orthonormal.
- `σ 1 = 1` pins the sign: `−σ` satisfies every other clause of (3.2) and is excluded.
- `W₁ = 1` gives `V = ∅`, excluded by the nonemptiness in Hypothesis (3.1); `W = C₃ × C₃` is not
  cyclic, excluded by the cyclicity hypothesis rather than by a separate coprimality clause.

### 2.7 Prime trivial-intersection configurations (§4)

Define a **prime T.I. configuration** `(L, K, W₁, W₂)` (Peterfalvi Hypothesis (4.2)): `L = K ⋊
W₁` with `W₁ ≠ 1` cyclic and Hall in `L`, `W₂ ≠ 1` cyclic with `W₂ ≤ K`, `C_K(x) = W₂` for every
`x ∈ W₁^#`, and `W = W₁ × W₂` of odd order. Prove that `V = W \ (W₁ ∪ W₂)` is then a T.I. set
with normalizer `W` in `L`, so §2.6 applies inside `L`; prove Theorem (4.3): for the cyclic
isometry `σ` of §2.6 inside `L`, each `σ(w_ij)` is a signed irreducible `δ_j μ_ij` of `L`, the
map `(i, j) ↦ μ_ij` is injective and `Ind_W^L (w_ij − w_0j) = δ_j (μ_ij − μ_0j)` ((4.3)(b));
`μ_ij = δ_j w_ij` on `W \ W₂`, and every irreducible of `L` not of the form `μ_ij` vanishes on
`W \ W₂` ((4.3)(c)); the degree congruence `μ_ij(1) ≡ δ_j (mod |W₁|)` ((4.3)(d)), with `μ_ij(1)`
independent of `i` (math-comp `prTIirr_1`); the reducible sums `μ_j = ∑ᵢ μ_ij`; and the
restriction formulas (4.4), (4.5). Define the **prime Dade configuration** (4.6): a cyclic T.I.
configuration for `(G, W)`, a prime T.I. configuration for `(L, K, W₁, W₂)`, a Dade datum for
`(L, A₀)` with `A₀ = A ∪ V^L`, `H ⊴ L` with `W₂ ≤ H ≤ K`, and an `L`-invariant subset
`A ⊆ K \ {1}` containing `C_K(h) \ {1}` for every `h ∈ H^#`. Prove (4.7)–(4.10): the Dade
isometry of `A₀` restricted to `CF(L, V^L)` is the cyclic isometry of §2.6, the degree and
support identities for the `μ_ij`, and the inequality (4.9). *Needs:* §2.3, §2.6, Tau Ceti
`TauCeti.IsTISet`; InductionRestriction Layer 5.

**Checks.**
- `L = C₇ ⋊ C₃`, `K = C₇`, `W₁ = C₃`: `C_K(x) = 1` for `x ∈ W₁^#`, so no `W₂ ≠ 1` exists and
  the Frobenius group of order `21` carries no prime T.I. configuration; the hypothesis
  `C_K(x) = W₂ ≠ 1` is the difference between a Frobenius complement and a prime T.I. complement.
- `L = C₃ × C₅` with `K = C₅`, `W₁ = C₃`, `W₂ = C₅`: `C_K(x) = C₅ = W₂`, `W = L` cyclic of odd
  order, `W₁` Hall: a prime T.I. configuration in which `V = L \ (C₃ ∪ C₅)` (eight elements) is
  T.I. with normalizer `L` in `L`.
- In that instance `σ` is the identity of `CF(L)` (induction from `W = L` is the identity and
  the `ξ_ij` are forced by linear independence), so `δ_j = 1` and `μ_ij = w_ij` has degree
  `1 ≡ δ_j = 1 (mod 3)`; a wrong statement giving `μ_ij` the degree `|W₁| = 3` fails here, as
  does one making `μ_ij(1)` depend on `i`.
- The clause `A ⊆ K \ {1}` of (4.6) is not implied by the others: replacing `A` by `A ∪ V^L`
  leaves `A₀`, the `L`-invariance and the containment of the sets `C_K(h) \ {1}` intact, while
  `V^L ⊄ K` (an element of `V` has nontrivial `W₁`-part and `W₁ ∩ K = 1`).

### 2.8 The coherence theorems of §§5–6

State and prove, with every numerical hypothesis explicit: the **subcoherence** hypothesis
(5.2) for a family `S` of characters closed under conjugation with no real member, an isometry
`τ` on `ℤ[S, L^#]`, and a choice of orthonormal sets `R(ξ)` with `τ(ξ − ξ̄) = ∑ R(ξ)`; the norm
estimate (5.4); the coherence criterion (5.5); Feit's extension theorem (5.6): a coherent
subfamily of a subcoherent `S` extends to `S` when the degree inequality it states holds; the
extension theorem (5.7) for families with a character of larger degree; the inequality (5.8); and
the Dade-restricted forms (5.9). Then the §6 theorems, under Peterfalvi's standing hypothesis
(6.1): `K ⊴ L` with `K` solvable; for `X ⊴ L` with `X ≤ K`, the family `S_K(X)` of the distinct
`Ind_K^L χ` for `χ ∈ Irr K` with `X ≤ ker χ` and `K ⊄ ker χ` (math-comp `seqIndD K L K X`; it
grows as `X` shrinks, and `S_K(1)` is the family of §4.1 with `H₁ = K`); and an isometry `τ` on
`ℤ[S_K(1), L^#]` for which `S_K(1)` is subcoherent. The quotient criterion (6.2): for `A < K` and
`B ≤ D ≤ C ≤ K`, all normal in `L`, with `D ⧸ B` central in `C ⧸ B`, coherence of `S_K(A)` gives
coherence of `S_K(B)` unless `|K : A| − 1 ≤ 2 |L : C| · √|C : D|`. Theorem (6.3): if
`M ≤ H₁ ≤ H ≤ K`, all normal in `L`, `H ⧸ M` is nilpotent, `S_K(H₁)` is coherent and
`|H : H₁| > 4 |L : K|² + 1`, then `S_K(M)` is coherent: the coherence of the smaller family
`S_K(H₁)` is the input and the larger family `S_K(M)` the output. Sibley's theorem (6.8): for
`L ≤ G` of odd order with `H ⊴ L` nilpotent and `H \ {1}` a T.I. set with normalizer `L` in `G`,
and either `L = H ⋊ W₁` Frobenius with kernel `H`, or a prime Dade configuration (§2.7) for
`(G, L, H, H, H \ {1})` (that is, `K = H`, `A = H \ {1}` and `A₀ = A ∪ V^L`) whose `W₂` has
prime order and lies in `H'`, the family `S_H(1)` induced from `Irr(H) \ {1}` is coherent with
`τ = Ind_L^G`. *Needs:* §2.3, §2.5, §2.7, Tau Ceti `TauCeti.IsTISet`,
`TauCeti.IsFrobeniusComplement`; InductionRestriction Layer 5 (Clifford); CharacterTheory §4.3.

**Checks.**
- (6.3) on `L = C₇ ⋊ C₃`, `K = H = H₁ = C₇`, `M = 1`: `S_K(C₇)` is empty (no irreducible of
  `C₇` has kernel containing `C₇` but not `C₇`), hence coherent, and `|H : H₁| = 1 > 4 · 9 + 1 =
  37` fails, so (6.3) does not extend it to `S_K(1)`, the two induced characters of degree `3`.
  Their coherence with `τ = Ind` (for `G = L` trivially, and for `L` embedded in a `G` in which
  `C₇ \ {1}` is T.I. with normalizer `L`) is (6.8), `L` being Frobenius with kernel `C₇`. The
  content of (6.3) is the passage from `S_K(H₁)` to the larger `S_K(M)`, so an instance with
  `H₁ = M` tests nothing.
- The threshold of (6.3) at `|L : K| = 3` is `4 · 9 + 1 = 37`: `|H : H₁| = 43` satisfies it and
  `|H : H₁| = 37` does not; at `|L : K| = 1` the threshold is `5`.
- The "no real member" clause of (5.2) holds for families of a group of odd order by (1.1), and
  fails for `S = {ε}` in `S₃`.
- The two alternatives of (6.8) are not exhaustive for nilpotent `H ⊴ L`: `L = C₃ × C₅` with
  `H = C₅` is not Frobenius, and `H' = 1` contains no `W₂` of prime order, so (6.8) makes no
  claim about it.

### Examples

The Dade isometry of `(C₃ × S₃, S₃, {transpositions}, C₃)` computed in §2.3; induction as the
Dade map for the T.I. subgroup `⟨(1 2)⟩ ≤ S₃` in §2.4; the cyclic isometry for `W = C₁₅` in §2.6.

### Dependencies

Tau Ceti class functions, pairing, virtual characters, induction, T.I. sets and Frobenius
complements; InductionRestriction Layers 2 and 5; CharacterTheory §4.3–§4.4; Mathlib
`Subgroup.centralizer`, `Subgroup.IsComplement'`.

## Layer 3: maximal subgroups and local structure (F3)

Throughout, `G` is a minimal odd simple group and `M` a maximal subgroup; the solvability of
every proper subgroup comes from Layer 0 §0.3 and is what the L3 and L7 theorems need.

### 3.1 Prime sets and core-family support (F3a)

For a finite group `X` define `α(X) = {p prime | m_p(X) ≥ 3}` (Bender–Glauberman §10, the
definition of `α`). A `p`-group `P` is **narrow** when `m_p(P) ≤ 2` or `P` has an elementary
abelian subgroup of order `p²` that is maximal among the elementary abelian subgroups of `P`
(Bender–Glauberman define narrow `p`-groups through a subgroup `S` of order `p` with
`C_P(S) = S × C`, `C` cyclic; the rank-two formulation used here is their characterization for
odd `p`: §5, Theorem 5.3); define `β(X)` as the primes `p` for which no Sylow `p`-subgroup
of `X` is narrow, and `X_α = O_{α(X)}(X)`, `X_β = O_{β(X)}(X)`. For `M` maximal in `G` define
`σ(M)` as in the Conventions and `M_σ = O_{σ(M)}(M)` (§10, the definition of `σ`). Prove: the
transport of these objects from `↥M` to `G`, their normality and characteristic property in `M`
and their behaviour under conjugation `σ(M^g) = σ(M)`; independence of `σ(M)` from the Sylow
subgroup chosen (conjugation inside `M`); `β(X) ⊆ α(X)`; and that for `p ∈ σ(M)` a Sylow
`p`-subgroup of `M` is a Sylow `p`-subgroup of `G` (the remark before Theorem 10.1). Define, for
primes `p ∣ |M|` outside `σ(M)`, `τ₁(M)`: `m_p(M) = 1` and `p ∤ |M'|`; `τ₂(M)`: `m_p(M) = 2`;
`τ₃(M)`: `m_p(M) = 1` and `p ∣ |M'|` (§12, the definitions of `τ₁, τ₂, τ₃`); and `κ(M)`: the
primes of `τ₁(M) ∪ τ₃(M)` with a subgroup of order `p` of `M` centralizing a nonidentity element
of `M_σ` (§14, the definition of `κ`). Define the **`σ`-support** as the union of `M_σ \ {1}`
over maximal `M`, the supporting maximal subgroups of `x` as `M_σ[x] = {M maximal | x ∈ M_σ}`
and the **multiplicity** of `x` as `|M_σ[x]|` (§14, `sigma_mmax_of`). Define separately the
**`σ`-length** `ℓ_σ(x)` as the number of distinct nonidentity `σ(M)`-parts `x_{σ(M)}` of `x` over
maximal `M` (§14, `sigma_length`); it is not the multiplicity, and Theorem 14.4 relates the two
only when `ℓ_σ(x) = 1`, where the signalizer `R[x]` acts transitively on `M_σ[x]` with
`|R[x]| = |M_σ[x]|` (§3.3). Prove the conjugation, support and counting formulas before any
signalizer or Dade datum is defined on them. *Needs:* §0.3, LocalFiniteGroupTheory L1
(`piCore`), L4 (`pRank`, `IsElementaryAbelian`), Mathlib `Sylow`, `Subgroup.normalizer`.

**Checks.**
- `α(C₃³) = {3}`, `α(C₃² × C₅) = ∅`; `β(C₃³) = {3}` (the only maximal elementary abelian
  subgroup has order `27`), so `β ⊆ α` is an equality here.
- `C₃ ≀ C₃` (order `81`) has `3`-rank `3` and is narrow: for an element `x` outside the base
  `C₃³`, `C_base(x)` is the diagonal `C₃`, and `⟨x, diagonal⟩ ≅ C₃²` is a maximal elementary
  abelian subgroup. So `3 ∈ α` and `3 ∉ β` for this group; narrowness is not "rank at most two".
- `σ` on an illustrative pair outside the minimal-simple setting, `G = S₄`, `M = S₃ = Stab(4)`:
  `N_G(A₃) = S₃ = M`, so `3 ∈ σ(M)`; `N_G(⟨(1 2)⟩) = ⟨(1 2), (3 4)⟩ ⊄ M`, so `2 ∉ σ(M)`, and the
  Sylow `2`-subgroup `⟨(1 2)⟩` of `M` is not Sylow in `G`.
- `τ` on `M = C₇ ⋊ C₃` with `σ(M) = {7}`: `m_3 = 1` and `3 ∤ |M'| = 7`, so `3 ∈ τ₁(M)`; on
  `M = C₅ × (C₇ ⋊ C₃)` with `σ(M) = {5, 7}` the prime `3` is in `τ₁(M)` and, since `C₃` centralizes
  `C₅ ≤ M_σ`, in `κ(M)`, whereas for `C₇ ⋊ C₃` alone `3 ∉ κ(M)` because `C₃` acts without fixed
  points on `M_σ = C₇`.
- Independence of the Sylow choice: `N_G(P^m) = N_G(P)^m ≤ M^m = M` for `m ∈ M`.
- An `x` of `σ`-length one with `|M_σ[x]| > 1` is the second case of Theorem 14.4, where the
  two numbers differ; a definition taking `ℓ_σ(x)` for the multiplicity gives `1` there.

### 3.2 Transitivity and uniqueness (F3b)

Prove **Thompson transitivity** (Bender–Glauberman, Theorem 7.6): let `P` be a Sylow
`p`-subgroup of `G`, `A ⊴ P` abelian with `C_P(A) = A` and `m_p(A) ≥ 3` (that is,
`A ∈ SCN₃(P)`); then for every prime `q ≠ p` the group `O_{p'}(C_G(A))` acts transitively by
conjugation on the maximal `A`-invariant `q`-subgroups of `G`, maximality being among all
`q`-subgroups normalized by `A`. The route is the solvable signalizer functor theorem of L7 for
the functor `a ↦ O_{p'}(C_G(a))` on `A^#`, whose solvability comes from §0.3. Construct the
members of `SCN₃(P)` needed later: when `m_p(P) ≥ 3` there is `A ∈ SCN₃(P)` (L3's `A × B` lemma
and L4's replacement theorems). Prove the **uniqueness theorems** (Theorem 8.1 and §9): for `M`
maximal with `m_p(F(M)) ≥ 3` the Fitting subgroup lies in a unique maximal subgroup, and every
elementary abelian `p`-subgroup `B` of `M` of rank at least three with `C_G(b) ≤ M` for all
`b ∈ B^#` lies in a unique maximal subgroup (Theorem 9.1(a)); the variant with `B` noncyclic
whose `p'`-subgroups normalized by `B` all lie in `M` (9.1(b)); and the rank-two centralizer and
normalizer alternatives used when no rank-three subgroup is available (§9, Lemmas 9.4–9.5,
Theorem 9.6). Build the constrained-centralizer core and generation lemmas of §7 (Lemma 7.1,
Theorems 7.2–7.4) with their normality and coprimality hypotheses. *Needs:* §0.3, §1.1,
LocalFiniteGroupTheory L3, L4, L7, Mathlib `Sylow`.

**Checks.**
- `SCN₃(P)` is empty when `m_p(P) ≤ 2`: for `P = C₃²` the only self-centralizing normal abelian
  subgroup is `P` itself, of rank `2`; the theorem is then vacuous and the rank-two
  alternatives of §9 take over.
- `P = C₃³`: `A = P ∈ SCN₃(P)`; a maximal `A`-invariant `q`-subgroup for `q = 7` in a group where
  `A` acts on a `7`-group `Q` is `Q` itself, and transitivity is the statement that any two such
  are conjugate by an element of `O_{3'}(C_G(A))`.
- Uniqueness needs the rank hypothesis: in `S₄` (illustration only) the rank-two subgroup
  `V₄` lies in the two maximal subgroups `A₄` and `D₈`.

### 3.3 Hall cores and the general prime-length theorem (F3c)

For every maximal `M` prove: `α(M) ⊆ σ(M)` (the remark before Theorem 10.1); `M_α` is a normal
Hall `α(M)`-subgroup of `M` and a Hall `α(M)`-subgroup of `G` (Theorem 10.2(a1), (a2)); `M_σ` is
a normal Hall `σ(M)`-subgroup of `M` and of `G` (10.2(b1), (b2)); `M_σ ≤ M'` (10.2(c));
`m(M ⧸ M_α) ≤ 2` and `M' ⧸ M_α` is nilpotent (10.2(d)); `M_σ ≠ 1` (10.2(e)); no prime of `σ(M)`
divides `|M : M'|`; the cyclic-Sylow centralizer criteria for primes outside `σ(M)` (Lemma
10.4) and the comparison of `β` for `M` and `G` at a `σ`-prime (Lemma 10.8); and `M_β ≤ M_α ≤
M_σ` with the normality and transport of §3.1. Then prove the **proper-subgroup `p`-length
theorem** (Theorem 10.6): every proper subgroup of `G` has `p`-length at most one for every
prime `p`; the route is §1.2 when `m_p(M) ≤ 2`, and otherwise the normal Hall `α`-core, its
containment in `M'`, the outside-`σ` centralizer criterion and §1.4 applied to `[M_α, K]` for a
Hall `α(M)'`-subgroup `K`. This statement is never an assumption in §3.1–§3.2. Prove that each
maximal `M` has fusion control on `M_σ^#`, the normalizer and centralizer formulas needed for
Dade data (§14, Theorem 14.4 and Lemma 14.5), the separation theorems for nonconjugate maxima
and the `σ`-support multiplicity and signalizer identities (§14, Lemma 14.1 and the `σ`-length
bound). Outside `σ(M)` prove that `τ₁(M)`, `τ₂(M)`, `τ₃(M)` partition the prime divisors of
`|M|` not in `σ(M)` (Lemma 12.1) and construct a **`σ`-complement** `E = E₁E₂E₃`: a Hall
`σ(M)'`-subgroup `E` of `M` with `Eᵢ` a Hall `τᵢ(M)`-subgroup of `E` and `E₂E₁` a subgroup (§12,
`sigma_complement`), with its order, intersection, action and conjugation formulas (Theorems
12.5, 12.7, 12.8). *Needs:* §1.2, §1.4, §3.1, §3.2, LocalFiniteGroupTheory L1 (Hall subgroups),
L3, L5, L7.

**Checks.**
- The partition of the primes outside `σ(M)` by `τ₁, τ₂, τ₃` uses `α(M) ⊆ σ(M)`: a prime `p ∉
  σ(M)` has `m_p(M) ≤ 2`, so exactly one of the three defining conditions holds.
- `M_σ ≤ M'` and `M_σ ≠ 1` are theorems about a minimal odd simple group, not consequences of
  the definitions: in `S₄` (illustration only) the maximal subgroup `M = S₃` has `σ(M) = {3}`
  and `M_σ = A₃ = M'`, while `M = A₄` has `σ(A₄) = ∅` (`N_{S₄}(V₄) = S₄` and `N_{S₄}(C₃) = S₃`
  are not inside `A₄`), so `M_σ = 1 ≠ V₄ = M'`.
- Theorem 10.6 on the subgroup `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)` of §1.2 would fail (`3`-length two): such a
  subgroup cannot occur in a minimal odd simple group, and the proof excludes it through `M_α`.

### 3.4 The five types and the supporting pair (F3d)

Define `H(M)` as the product of the normal Sylow subgroups of `M` and `F(M)` as its Fitting
subgroup. Prove `H(M)` is characteristic and nilpotent, `H(M) ≤ F(M)`, and `H(M) ≠ 1` with
`H(M) ≤ M_σ ≤ M'` and `M' < M` for every maximal `M` (Bender–Glauberman, Theorem 15.2). Say
that `M` has **Frobenius-type data with complement `E`** when `1 < H(M) < M`, `M = H(M) ⋊ E`,
there is an abelian normal `E₁ ⊴ E` containing `C_E(h)` for every `h ∈ H(M)^#`, and there is
`E₀ ≤ E` with `exp E₀ = exp E` acting without fixed points on `H(M)` (Peterfalvi Definition
(8.1); math-comp `of_typeF`). This is weaker than `E` itself acting without fixed points. For
nontrivial cyclic `W₁, W₂` define a **P-configuration** `(M, E, W₁, W₂)` (Peterfalvi Definition
(8.4); math-comp `of_typeP`) by: `W₁` is Hall in `M` and `M = M' ⋊ W₁`; `E` is nilpotent,
normalized by `W₁`, and `M' = H(M) ⋊ E`; `H(M)` is not cyclic, `M'' ≤ F(M) ≤ M'` and
`F(M) = H(M) · C_M(H(M))`; `W₂ ≤ H(M) ∩ M''` and `C_{M'}(w) = W₂` for every `w ∈ W₁^#`;
`W = W₁ × W₂` is an internal direct product and `W \ (W₁ ∪ W₂)` is T.I. with exact normalizer
`W`. Prove that for a nonempty `D` with `TauCeti.IsTISet D N` the normalizer `N_G(D)` equals `N`
(`N ≤ N_G(D)` by `conj_mem`; an element outside `N` moves `D` off itself by `disjoint_conj`, so
it normalizes no nonempty `D`), as the Conventions state, and use that equality wherever "T.I.
with exact normalizer" occurs. Define the **types** of a maximal subgroup (Peterfalvi Definitions (8.3),
(8.6), (8.7); math-comp `of_typeI`, `of_typeII_IV`, `of_typeII`, `of_typeIII`, `of_typeIV`,
`of_typeV`):

| Type | Defining data |
| --- | --- |
| I | Frobenius-type data with complement `E`, and either `H(M) \ {1}` is T.I. with exact normalizer `M`, or `H(M)` is abelian of rank two, or `exp E ∣ r − 1` for every prime `r ∣ |H(M)|` and `O_{r'}(H(M))` is cyclic for at least one such `r` |
| II | a P-configuration with `E ≠ 1`, `|W₁|` prime and `F(M) \ {1}` T.I. with exact normalizer `M`; `E` is abelian, `N_G(E) ⊄ M`, and `M'` has Frobenius-type data with complement `E` and `H(M') = H(M)` |
| III | a P-configuration with `E ≠ 1`, `|W₁|` prime and `F(M) \ {1}` T.I. with exact normalizer `M`; `E` is abelian and `N_G(E) ≤ M` |
| IV | a P-configuration with `E ≠ 1`, `|W₁|` prime and `F(M) \ {1}` T.I. with exact normalizer `M`; `E` is nonabelian and `N_G(E) ≤ M` |
| V | a P-configuration with `E = 1`, and either `H(M) \ {1}` is T.I. with exact normalizer `M`, or for some prime `r ∣ |H(M)|`, `O_{r'}(H(M))` is cyclic and `|W₁| ∣ r − 1`, or for some prime `r ∣ |H(M)|`, `O_{r'}(H(M))` is cyclic, `|O_r(H(M))| = r³` and `|W₁| ∣ r + 1` |

Prove the **five-type theorem**: every maximal subgroup of `G` has exactly one of the five types
(Bender–Glauberman, Theorems I and II as summarized in §16; Peterfalvi (8.8), (8.9)). Prove its
**alternative** (Peterfalvi, Theorem (8.8)): either every maximal subgroup has type I, or there
are maximal subgroups `S, T` and nontrivial cyclic `W₁, W₂` with `W = W₁ × W₂` cyclic,
`S = S' ⋊ W₁`, `T = T' ⋊ W₂`, `S ∩ T = W`, `W \ (W₁ ∪ W₂)` T.I. with exact normalizer `W`, at
least one of `S, T` of type II, both of types II–V, and every maximal subgroup not of type I
conjugate to `S` or to `T`. Deduce `gcd(|W₁|, |W₂|) = 1` from the cyclicity of `W`. Layer 4
supplies the character-theoretic properties of this pair and the P-configuration witnesses
`U, V`. *Needs:* §3.1, §3.3, LocalFiniteGroupTheory L2 (`fitting`), L6, Tau Ceti
`TauCeti.IsTISet`, Mathlib `Monoid.exponent`, `MonoidHom.FixedPointFree`.

**Checks.**
- `H(S₃) = A₃`, `H(C₇ ⋊ C₃) = C₇`, and `H(S₄) = 1` although `F(S₄) = V₄`: `V₄` is normal but
  not Sylow, so `H(M)` is not the Fitting subgroup.
- Frobenius-type data for `C₇ ⋊ C₃`: `H = C₇`, `E = E₁ = E₀ = C₃` (`C_E(h) = 1 ⊆ E₁`, `E₀` acts
  without fixed points). For `C₅ × (C₇ ⋊ C₃)`: `H = C₅ × C₇`, `E = C₃` centralizes `C₅`, so no
  `E₀ ≤ E` of exponent `3` acts without fixed points, and the data fail.
- Frobenius-type data with `E` not acting freely: `H = C₇²` and `E = C₃² = ⟨e₁⟩ × ⟨e₂⟩`, with
  `e₁` acting as an order-three automorphism on both factors and `e₂` on the first factor only:
  `E₁ = E` is abelian and contains every `C_E(h)`, and `E₀ = ⟨e₁⟩` has exponent `3 = exp E` and
  acts without fixed points, while `e₂` fixes the second `C₇`.
- A P-configuration needs `M'' ≠ 1`: in the Frobenius group of order `21` the derived group is
  abelian, so `W₂ ≤ M''` forces `W₂ = 1`, excluded. No group with `H(M)` cyclic is a
  P-configuration.
- Exclusivity of type I against types II–V: a P-configuration has an element `w ∈ W₁` of prime
  order with `C_{M'}(w) = W₂ ≠ 1`, and `W₁` is Hall in `M`, so every subgroup `E₀ ≤ E W₁` of the
  same exponent as `E W₁` contains a conjugate of `w`, which has a fixed point on `H(M) ⊇ W₂`;
  so no Frobenius-type data exist. Types II and III differ at `N_G(E) ⊄ M`, III and IV at
  `IsMulCommutative E`, V at `E = 1`.

### Examples

`σ`, `τ`, `κ` on `C₇ ⋊ C₃` and `C₅ × (C₇ ⋊ C₃)` (§3.1); `C₃ ≀ C₃` as a narrow `3`-group of rank
three; the three-way exclusivity argument of §3.4.

### Dependencies

Layers 0–1; LocalFiniteGroupTheory L1–L7; Tau Ceti `TauCeti.IsTISet`; Mathlib `Sylow`,
`Subgroup.normalizer`, `Monoid.exponent`, `MonoidHom.FixedPointFree`.

## Layer 4: the character analysis (F4)

### 4.1 Local character families (F4a, Peterfalvi §§7, 9–11)

For a maximal `M` with `K = M'` or `K = H(M)` as the type dictates, and `H₁ ⊴ M` with `H₁ ≤ K`,
define the **induced family** `S(H₁)` as the set of distinct characters `Ind_K^M χ` for
`χ ∈ Irr K` whose kernel does not contain `H₁` (Peterfalvi §5, `seqIndD`), and identify its
constituents and multiplicities through Clifford theory (InductionRestriction Layer 5): `Ind_K^M χ`
is irreducible iff the inertia group `I_M(χ)` is `K`, and in general its restriction to `K` is
`|I_M(χ) : K|` times the sum over the `M`-orbit of `χ` (Peterfalvi (1.5)(a)). Prove, for each
maximal `M`, the Dade datum of `(M, A(M))` with `A(M)` the support of Peterfalvi Definition
(8.10) and complements the signalizers of §3.3 (Peterfalvi (8.11)–(8.13), Theorem (8.17)); the
degree-zero theorem of §2.5 for `S(H₁)`; the integrality and the coherence or noncoherence
conclusions with the full type hypotheses: the inverse Dade isometry and its norm expansion
(7.1)–(7.3), the covering inequality (7.5) and the Frobenius bound (7.10); the structure of
`H(M)` and the Galois and non-Galois cases of a P-configuration (9.4)–(9.10); the noncoherence of
types III–V (Theorem (10.8)) and the exclusion of type V (Theorem (10.10)); and the type-II
estimates of §11 (11.3)–(11.9). The ordinary irreducible basis, degree divisibility and the
norm-one classification are consumed from Tau Ceti and CharacterTheory. *Needs:* §2.3, §2.5,
§2.6, §2.7, §2.8, §3.3, §3.4, InductionRestriction Layer 5, CharacterTheory §4.3, Tau Ceti
`TauCeti.Representation.finrank_dvd_card`.

**Checks.**
- `M = S₃`, `K = A₃`, `H₁ = A₃`: `Irr(A₃) \ {1} = {ω, ω²}`, `Ind ω = Ind ω² = ρ`, so `S(A₃) =
  {ρ}` has one element and `ρ` is irreducible (inertia group `A₃`); a wrong definition counting
  `Ind χ` with multiplicity would list `ρ` twice.
- `M = C₃ × C₃`, `K = C₃ × 1`: every `Ind χ` has inertia group `M` and is the sum of the three
  extensions of `χ` to `M`, reducible of degree `3`, while its restriction to `K` is
  `|I : K| · χ = 3χ`, the orbit sum with its single term; so "induction is irreducible" is not
  assumed, and (1.5)(a) is a statement about the restriction, not about `Ind χ` itself.
- The degree-zero theorem for `S(H₁)` with `A = M^#`: every member has degree `|M : K| · χ(1)`
  and vanishes nowhere in general; a degree-zero combination vanishes at `1`, which is all that
  `A = M^#` asks.

### 4.2 The type-I Frobenius theorem (F4b, §12)

Prove: for every maximal `M` of type I there is a nontrivial complement `E` with `M = H(M) ⋊ E`
such that every nonidentity `e ∈ E` fixes only the identity of `H(M)`; state the conclusion as
`TauCeti.IsFrobeniusComplement (E.map M.subtype)` inside `M` together with the identification of
`TauCeti.frobeniusKernelSubgroup` with `H(M)`, so that the native Frobenius character API
applies (Peterfalvi, Theorem (12.7); math-comp `FTtype1_Frobenius`). This strengthens the
Frobenius-type data of §3.4 and is not true by definition of type I: the route is §4.1's
coherence for the type-I families and the degree estimates (12.2)–(12.6). *Needs:* §3.4, §4.1,
Tau Ceti `TauCeti.IsFrobeniusComplement`, `TauCeti.frobeniusKernelSubgroup`,
`TauCeti.coe_frobeniusKernelSubgroup`.

**Checks.**
- The Frobenius-type datum `H = C₇²`, `E = C₃²` of §3.4 is not a Frobenius group (`e₂` has fixed
  points): the theorem asserts that this configuration does not occur as a maximal subgroup of
  type I in a minimal odd simple group, which is a theorem and not a definition.
- For `M = C₇ ⋊ C₃` the conclusion holds with `E = C₃`, and `TauCeti.frobeniusKernel E` is `C₇`.
- The statement is about some complement `E`, not every complement: all complements of `H(M)`
  are conjugate (Schur–Zassenhaus), so the choice is immaterial.

### 4.3 Exclusion of the all-type-I case (F4c, §12)

Prove the endpoint `∃ M maximal, ¬ TypeI M` (Peterfalvi, Theorem (12.17); math-comp
`not_all_FTtype1`): under the assumption that every maximal subgroup has type I, construct the
type-I Dade families and their disjoint supports (Theorem (8.17), the partition of `G^#` by the
Dade supports), prove the counting and orthogonality identities of (12.14)–(12.16) and derive a
contradiction from the Frobenius bound (7.10) and the covering inequality (7.11). This
establishes the premise selecting the second alternative of §3.4. *Needs:* §3.4, §4.1, §4.2.

**Checks.**
- The Frobenius bound (7.10) holds for at least one, not for each, of the `k ≥ 2` Frobenius
  maximal subgroups of its hypothesis: for that subgroup, with kernel of order `h` and
  complement of order `e`, it reads `(e − 1)·((h − 2e − 1)/(e h) + 2/(h (h + 2))) ≤ (|G₀| − 1)/|G|`,
  where `G₀` is the complement of the Dade supports; at `e = 3`, `h = 7` the left side is
  `2 · (0/21 + 2/63) = 4/63`. The contradiction of (12.17) needs at least two conjugacy classes of
  maximal subgroups, which §3.3's separation theorem provides.
- With exactly one class of maximal subgroups the Dade supports would cover `G^#` by a single
  Frobenius kernel's conjugates, contradicting simplicity: the case `k = 1` is excluded first.

### 4.4 Reciprocal supporting maxima (F4d, §13)

For the pair `(S, T, W₁, W₂)` of §3.4, construct nilpotent subgroups `U ≤ S'` and `V ≤ T'` such
that `(S, U, W₁, W₂)` and `(T, V, W₂, W₁)` are P-configurations, with the structure `S' = H(S) ⋊
U`, `T' = H(T) ⋊ V` (Peterfalvi (8.8)(b) and Hypothesis (13.1)). Prove (13.2): `S` has type II or
III; if `|W₁| < |W₂|` then `S` has type II; `U ⋊ W₁` is Frobenius with abelian `U`; `H(S) = P` is
elementary abelian of order `p^q` for `p = |W₂|`, `q = |W₁|`; `|U| ≤ (p^q − 1)/(p − 1)`; the family
of §4.1 for `S` is coherent; and the Dade isometry of `(S, A₀(S))` is induction on `CF(S,
A₀(S))`. Prove the Galois alternative (13.3), the degree inequalities (13.5)–(13.9) and the
order formula (13.15): when `U` acts irreducibly on `P` (the Galois case), `|U| = (p^q − 1)/(p −
1)` if `p ≢ 1 (mod q)` and `q · |U| = (p^q − 1)/(p − 1)` if `p ≡ 1 (mod q)`. Use §3.4's
coprimality so that `|W₁| ≠ |W₂|`, and orient the pair by `|W₁| < |W₂|`; that `T` is also of
type II is Layer 5 §5.3, which needs the overgroup `L` of §5.2. *Needs:* §2.6, §2.7, §2.8, §3.4,
§4.1, §4.2.

**Checks.**
- `p = 5`, `q = 3`: `(p^q − 1)/(p − 1) = 31`, `5 ≢ 1 (mod 3)`, so `|U| = 31` in the Galois case;
  `p = 7`, `q = 3`: `7 ≡ 1 (mod 3)`, so `|U| = 57/3 = 19`.
- `|P| = p^q` with `p = 5`, `q = 3` is `125`, elementary abelian, and the norm-one subgroup of
  `𝔽₁₂₅ˣ` over `𝔽₅` has order `31`: the bound `|U| ≤ 31` is attained exactly in the Galois case.
- The orientation uses `gcd(|W₁|, |W₂|) = 1`: `|W₁| = |W₂|` is excluded, so `<` or `>` holds,
  and the roles of `S` and `T` are exchanged by symmetry (`typeP_pair_sym`).

### Examples

The families `S(A₃)` for `S₃` and `S(C₃)` for `C₃ × C₃` in §4.1; the order formula (13.15) at
`(p, q) = (5, 3)` and `(7, 3)`.

### Dependencies

Layer 2, Layer 3; InductionRestriction Layer 5; CharacterTheory §4.3–§4.4; Tau Ceti
`TauCeti.IsFrobeniusComplement`, `TauCeti.frobeniusKernelSubgroup`.

## Layer 5: finite-field comparison and contradiction (F5)

### 5.1 The Appendix C comparison theorem

Prove `appendixC_prime_le` (Bender–Glauberman, Appendix C, Theorem C; math-comp
`prime_dim_normed_finField`): let `p, q` be primes, `F` a field with `Nat.card F = p^q`, and
suppose `gcd((p^q − 1)/(p − 1), p − 1) = 1`. In a finite group `G` let `P` be the image of a group
isomorphism from `Multiplicative F`, `U` the image of a group isomorphism from
`rootsOfUnity ((p^q − 1)/(p − 1)) F`, with `P ⊓ U = ⊥` and `u⁻¹ (Pe z) u = Pe (z · u)` for `u ∈ U`
(hypothesis (A): `H = P ⋊ U` with `U` acting as multiplication by norm-one scalars). Let `Q` be
an abelian subgroup of order prime to `p` normalized by the prime-field line `P₀ = Pe(𝔽_p)`, and
let `y ∈ Q` satisfy `y⁻¹ P₀ y ≤ N_G(U)` (hypothesis (B)). Then `p ≤ q`. Prove the field-side
lemmas it needs: `rootsOfUnity ((p^q − 1)/(p − 1)) F` is the kernel of the norm `Fˣ → 𝔽_pˣ`, by
`FiniteField.algebraMap_norm_eq_pow` (the norm is `x ↦ x^{(p^q − 1)/(p − 1)}`) and
`FiniteField.unitsMap_norm_surjective`, so it has order `(p^q − 1)/(p − 1)`; the action of `U` on
`P` is faithful and fixed-point-free; the norm fibres and the field-automorphism and word
identities of Appendix C, Remarks X–XII, none supplied as a configuration field. Put this
subsection in `TauCeti/GroupTheory/OddOrder/FiniteFieldComparison/`, independent of the
assembly. *Needs:* Mathlib `rootsOfUnity`, `mem_rootsOfUnity`, `Algebra.norm`,
`FiniteField.algebraMap_norm_eq_pow`, `FiniteField.unitsMap_norm_surjective`, `GaloisField`,
`GaloisField.card`, `CharP`, `Subgroup.normalizer`.

**Checks.**
- `p = 3`, `q = 2`, `F = 𝔽₉`: `(9 − 1)/2 = 4`, the norm is `x ↦ x⁴`, its kernel `{±1, ±i}` is
  `rootsOfUnity 4 𝔽₉` of order `4 = 8/2`; the coprimality `gcd(4, 2) = 1` fails, so the theorem
  makes no claim for this pair.
- `p = 5`, `q = 3`: `(125 − 1)/4 = 31`, `gcd(31, 4) = 1`, and `p ≤ q` is false: the theorem says
  that no `Q, y` as in (B) exist in any finite group containing `𝔽₁₂₅ ⋊ C₃₁`.
- `p = 3`, `q = 5`: `(243 − 1)/2 = 121`, `gcd(121, 2) = 1`, conclusion `3 ≤ 5` true; the
  hypotheses are then consistent, and (B) is substantive even here: with `Q = 1` and `y = 1`,
  `P₀ ≤ N_G(U)` would need `P₀ ≤ C_P(U) = 1` since `U` acts freely, so `y` must lie outside `P`.
- The action convention `u⁻¹ (Pe z) u = Pe (z u)`: in `SemidirectProduct F Fˣ` with the
  multiplication action, conjugation of `(z, 1)` by `(0, u)` gives `(u⁻¹ z, 1)`; the two
  conventions differ by `u ↦ u⁻¹`, which preserves `U`, so either is satisfiable and the trivial
  action (`Pe z` for all `u`) is excluded for `z ≠ 0`, `u ≠ 1`.
- `p = 2`: `(2^q − 1)/1` is prime to `1`, `U = 𝔽_{2^q}ˣ`, and `2 ≤ q` holds for every prime `q`:
  the theorem is vacuous at `p = 2`, as it is at `p = q`.

### 5.2 Supporting overgroups

For the oriented pair of §4.4 put `q = |W₁| < p = |W₂|`, `P = H(S)`, `Q = H(T)`, and let `L` be a
maximal subgroup containing `N_G(U)` (it exists by §0.3, and `U ≠ 1` by type II). Prove
(Peterfalvi (14.3)–(14.5), math-comp `FTtypeII_support_facts` and `compl_of_typeII`): `L` has
type I, `U ≤ H(L)`, `L` is Frobenius with kernel `H(L)` by §4.2, and `L = H(L) ⋊ (W₁ W₂^y)` for
some `y ∈ Q`; the complement `W₁` alone is excluded by the family inequalities of §4.1 (Theorem
(14.4) and the type-I bridge of §13), so the Frobenius complement has order `pq` and acts without
fixed points on `H(L)`. The coherence of the family `S(H(L))` of `L` and a character `φ` of
degree `|L : H(L)|` in it (Hypothesis (14.3)) come from §2.8 and §4.1. *Needs:* §0.3, §3.3, §3.4,
§4.1, §4.2, §4.4.

**Checks.**
- The complement `W₁ W₂^y` of (14.5) equals `W^y`: `y ∈ Q = H(T)`, which is abelian and
  contains `W₁` (the P-configuration `(T, V, W₂, W₁)` puts `W₁ ≤ H(T)`), so `W₁^y = W₁`; hence
  the complement is cyclic of order `pq`, the order the Frobenius divisibility
  `|H(L)| ≡ 1 (mod pq)` of §5.5 uses.
- The alternative `L = H(L) ⋊ W₁` of (13.17) is excluded by the bridge (13.19): either
  `p ≤ |L : H(L)| = q`, against `q < p`, or `(|H(L)| − 1)/q ≤ (|U| − 1)/q`, whence `H(L) = U`
  (as `U ≤ H(L)`) and `L = U ⋊ W₁ ≤ S`, so `L = S` by maximality and `N_G(U) ≤ S`, against the
  type II condition `N_G(U) ⊄ S`.

### 5.3 The second maximum is of type II

Prove that `T` has type II (Peterfalvi (14.9); math-comp `FTtypeP_min_typeII`): the inequalities
(14.8)(a) `q^{p+1} > p^{q+1}` for odd primes `q < p` with `p ≥ 5`, and (14.8)(b) `(|V| − 1)/p >
(|U| − 1)/q` with `|V| = (q^p − 1)/(q − 1)` from the Galois alternative (14.4), contradict the
type III–IV structure (10.8)-type estimate for `T` (math-comp `FTtype34_structure`). This needs
the overgroup `L`, its coherent family and the inequalities of §5.2, which is why it is placed
after §5.2 and not with (13.2). The symmetric statement for `M ≥ N_G(V)` in §5.5 cites this
subsection with the roles of `S, T` exchanged. *Needs:* §4.4, §5.2.

**Checks.**
- (14.8)(a) at `(p, q) = (5, 3)`: `3⁶ = 729 > 5⁴ = 625`; at `(7, 3)`: `3⁸ = 6561 > 7⁴ = 2401`;
  at `(7, 5)`: `5⁸ = 390625 > 7⁶ = 117649`. At `(3, 2)`: `2⁴ = 16 < 3³ = 27`, so the inequality
  needs `p ≥ 5`, which oddness and `q < p` with `q ≥ 3` give.
- (14.8)(b) at `(5, 3)`: `|V| = (3⁵ − 1)/2 = 121`, `(121 − 1)/5 = 24`; `|U| ≤ 31`,
  `(31 − 1)/3 = 10`; `24 > 10`.

### 5.4 The Appendix C obstruction

Prove `|P| = p^q`, that `Q` is abelian of order prime to `p`, and `W₂ ≤ N_G(Q)` (from (13.2) for
`T`); that the conjugation action of `U` on the elementary abelian `P` is faithful and
irreducible (the Galois case (13.3) forced by `q < p`, Peterfalvi (14.4)). Analyze whether `U` is
characteristic in `H(L)`: if it is, then `W₂^y ≤ N_G(U)`. The order formula (13.15) gives either
`p ≡ 1 (mod q)` with `q |U| = (p^q − 1)/(p − 1)`, or `|U| = (p^q − 1)/(p − 1)`; exclude the first
branch by the free action of `W₂^y` on `U` (`|U| ≡ 1 (mod p)`) against `(p^q − 1)/(p − 1) ≡ 1
(mod p)`; in the remaining branch prove `q ∤ p − 1` and `gcd((p^q − 1)/(p − 1), p − 1) = 1`.
Construct `F = 𝔽_{p^q}` (`GaloisField p q`), the additive equivalence `Multiplicative F ≃* P`
(from the irreducible action of the cyclic group `U` on `P`, which makes `P` a one-dimensional
vector space over the field `𝔽_p[U]`), identify `U` with the norm-one scalars and `W₂` with the
prime-field line, and verify every hypothesis of §5.1 with `P₀ = W₂`, `Q = H(T)` and this `y`.
Appendix C gives `p ≤ q`, contradicting `q < p`; so `U` is not characteristic in `H(L)`
(Peterfalvi, Theorem (14.2) and (14.7); math-comp `no_full_FT_Galois_structure`,
`not_charUH`). *Needs:* §4.4, §5.1, §5.2, §5.3, Mathlib `GaloisField`, `Subgroup.Characteristic`.

**Checks.**
- The branch `p ≡ 1 (mod q)`: at `(p, q) = (7, 3)`, `|U| = 19` and `19 ≡ 5 (mod 7)`, not `1`,
  so `W₂^y ≅ C₇` cannot act freely on `U` (free action forces `|U| ≡ 1 (mod 7)`): the branch is
  excluded exactly as stated.
- The remaining branch at `(5, 3)`: `|U| = 31 ≡ 1 (mod 5)`, `3 ∤ 4`, `gcd(31, 4) = 1`: every
  arithmetic hypothesis of §5.1 holds, and Appendix C's `5 ≤ 3` is the contradiction.
- Appendix C's hypothesis (B) is on an abelian `p'`-group `Q`; the elementary abelian `Q = H(T)`
  of (13.2) is a special case, and only "abelian, order prime to `p`" is used (Appendix C, the
  remark deriving (B) from Theorem (14.2)).

### 5.5 Kernel comparison and exclusion

Choose a maximal `M ≥ N_G(V)` and construct its opposite supporting configuration: by §5.2 and
§5.3 with `S, T` exchanged, `M` has type I, is Frobenius with kernel `H(M)`, carries a coherent
family with a character of degree `|M : H(M)|` (Hypothesis (14.10)), and satisfies `H(M) = V`
and `|M : H(M)| = pq` (Peterfalvi (14.11)); `L` and `M` are not conjugate (14.12)–(14.13).
Build the core-character families for `L` and `M`: the families `S(H(L))`, `S(H(M))` and their Dade data; prove the induced-family
separation, the nonconjugacy of `L` and `M` (14.11), and the action-kernel ratio comparison
(14.14)–(14.15); from the matching index `pq` and the character inequalities of §4.1 force
`H(L) = U` (Peterfalvi (14.16); math-comp `defH`): with `h = |H(L)| = |U| · |H(L) : U|`, both
`h ≡ 1 (mod pq)` (Frobenius kernel) and `|U| ≡ 1 (mod pq)` (from `U ⋊ W₁` Frobenius and the free
action of `W₂^y`), so `|H(L) : U| ≡ 1 (mod pq)`, which the degree inequalities bound below
`pq + 1`. Then `U = H(L)` is characteristic in `H(L)`, contradicting §5.4. This excludes the
second alternative of §3.4 and, with §4.3, completes Peterfalvi §14. *Needs:* §2.8, §4.1, §4.4,
§5.2, §5.3, §5.4.

**Checks.**
- `h ≡ 1 (mod pq)` for a Frobenius group with kernel of order `h` and complement of order `pq`:
  for `C₇ ⋊ C₃`, `7 ≡ 1 (mod 3)`; the congruence modulo the product `pq` uses that `W₁ W₂^y` is
  the whole complement.
- `|H(L) : U| ≡ 1 (mod pq)` with `|H(L) : U| > 1` forces `|H(L) : U| ≥ pq + 1`, and `|U| ≥ pq
  + 1` likewise, so `|H(L)| ≥ (pq + 1)²`; the first branch of (14.14) gives `|H(L)| − 1 ≤
  pq (pq − 1)`, and at `(p, q) = (5, 3)` this reads `|H(L)| ≥ 256` against `|H(L)| ≤ 211`. The
  second branch of (14.14), `(p, q) = (5, 3)` with the other nonorthogonality, is closed by the
  explicit bound of (14.16). At `|H(L) : U| = 1` the equality `H(L) = U` is the conclusion.

### Examples

Appendix C at `(p, q) = (5, 3)` and `(7, 3)`; the norm kernel of `𝔽₉` over `𝔽₃`; the
inequalities (14.8) at the three smallest admissible pairs.

### Dependencies

Layers 2–4; Mathlib `rootsOfUnity`, `Algebra.norm`, `FiniteField.algebraMap_norm_eq_pow`,
`FiniteField.unitsMap_norm_surjective`, `GaloisField`, `Subgroup.Characteristic`.

## Layer 6: assembly and reusable consequences (F6)

### 6.1 Assembly

Prove `not_isMinimalOddSimple`: §4.3 excludes the first alternative of §3.4 and §5.5 the second.
Deduce `isSolvable_of_odd_natCard` through §0.2 and `even_natCard_of_nonabelian_simple` through
§0.2's equivalence, for an arbitrary universe. Expose solvability of odd-order subgroups and
quotients through Mathlib's `Group.IsSolvable` transfer lemmas. Keep Layer 1, Layer 2 and §5.1
importable without the assembly: no file of those layers imports the file proving
`not_isMinimalOddSimple`. *Needs:* §0.2, §3.4, §4.3, §5.5.

**Checks.**
- The final theorem's hypotheses are `[Group G] [Finite G]` and `Odd (Nat.card G)` only; its
  axioms are those of Mathlib. No Layer 1–5 target survives as an assumption.
- The import graph of the endpoint contains no module of CFSGStatement, CFSGBasicProperties or
  GlaubermanZStar.
- `C₇ ⋊ C₃` and `C₃ ≀ C₃` are solvable by the theorem, in agreement with their derived series
  computed directly.

### Examples

The three endpoint forms on `C₇ ⋊ C₃` (solvable, not simple, odd) and `A₅` (simple, even).

### Dependencies

Layers 0–5.

## Downstream consumers

- GlaubermanZStar Z2 (the Brauer–Suzuki case) consumes Layer 2 §2.4: the Dade isometry with
  trivial complements is induction, for the T.I. set of elements of order divisible by `4` in
  the centralizer of a cyclic subgroup of order four. It does not consume Layers 0–1 or 3–6.
- A roadmap that needs the solvability of groups of odd order, or that a nonabelian simple
  group has even order, may consume `isSolvable_of_odd_natCard` and
  `even_natCard_of_nonabelian_simple` from Layer 6; CFSGStatement and CFSGBasicProperties state
  the classification without citing either.
- Any later roadmap on the Bender–Suzuki strongly embedded theorem consumes Layer 1 and the Dade
  library of Layer 2.

## References

- W. Feit and J. G. Thompson, *Solvability of groups of odd order*, Pacific Journal of
  Mathematics 13 (1963), 775–1029. Definition 9.1 (tamely imbedded subsets, pp. 803–804) is the
  origin of the Dade data of §2.2; Chapters IV–VI are superseded here by Peterfalvi Part I.
- H. Bender and G. Glauberman, *Local Analysis for the Odd Order Theorem*, LMS Lecture Note
  Series 188, Cambridge University Press, 1994: Chapter I (Theorems 3.6, 4.18, 6.1 for Layer 1),
  Chapters II–III (§§7–16 for Layer 3) and Appendix C, Theorem C (§5.1).
- T. Peterfalvi, *Character Theory for the Odd Order Theorem*, LMS Lecture Note Series 272,
  Cambridge University Press, 2000, Part I §§1–14: §§1–6 for Layer 2, §8 for Layer 3, §§7 and
  9–13 for Layer 4, §14 for Layer 5.
- The Mathematical Components odd-order development (`math-comp/odd-order`, files `BGsection1.v`
  to `BGsection16.v`, `BGappendixC.v`, `PFsection1.v` to `PFsection14.v`) is an independently
  organized formal proof whose comments record the theorem numbers of the two books cited above;
  every locator above was checked against it. Its finite-group and character types require
  mathematical comparison with Lean's native objects; it is a provenance source, not a
  specification.
- I. M. Isaacs, *Character Theory of Finite Groups*, Lemma 7.7 (induction from a
  trivial-intersection set), for §2.4.
