# Roadmap: induction theorems in Grothendieck groups of modular representations

**Summary.** Let G be a finite group and k a field. The Grothendieck group G₀(k[G]) of finitely
generated k[G]-modules, with a relation [M] = [M′] + [M″] for every short exact sequence
0 → M′ → M → M″ → 0, is Serre's R_k(G). It is a commutative ring under the tensor product over k
with the diagonal action, with restriction along group homomorphisms, induction from subgroups
satisfying the projection formula, and a permutation class [k[X]] for every finite G-set X. When
the characteristic ℓ of k divides |G|, short exact sequences need not split and G₀(k[G]) is a
proper quotient of the Green ring, where only direct sums are relations. This roadmap proves
induction theorems in G₀(k[G]) in every characteristic, without Brauer characters.

The first main theorem is Artin's induction theorem in G₀(k[G]). For a subgroup C let m_C be the
sum of μ([D : C]) over the cyclic subgroups D containing C, μ the Möbius function; m_C = 0 unless C
is cyclic. Over every field, |G|·[k] = Σ m_C·|C|·[k[G/C]], the sum over all subgroups C, so |G|·x is
an integral combination of classes induced from cyclic subgroups for every x. The factor is needed
even over ℚ: for S₃ the trivial class is not so induced.

The second is the modular Artin theorem, the spanning lemma behind Tate's local Euler
characteristic formula: if k has characteristic ℓ > 0, then |G|·x is an integral combination of
classes induced from cyclic subgroups of order prime to ℓ, for every x. When ℓ divides |G| some
multiple is necessary, since such induced classes have dimension divisible by the ℓ-part of |G|.

The third is the lattice lemma: if two G-lattices, finitely generated torsion-free abelian groups
with an action of G, become isomorphic after tensoring with ℚ, their reductions k ⊗ V and k ⊗ W
have the same class in G₀(k[G]) over every field, though they need not be isomorphic. In
characteristic ℓ it rests on the lattice defect [V/ℓV] − [V[ℓ]], which is additive in short exact
sequences of G-modules and vanishes on finite ones. With it, Artin's identity between permutation
characters holds in G₀(k[G]); the projection formula spreads it to every class; and the ℓ-part of a
cyclic subgroup is eliminated because an element of ℓ-power order acts unipotently in characteristic ℓ.

[GrothendieckEulerForms](../../GrothendieckEulerForms/README.md) supplies exact Grothendieck groups
and the basis of simple classes; [InductionRestriction](../InductionRestriction/README.md) supplies
induction of representations, the projection formula and Artin's theorem for characters in
characteristic zero. The local Euler characteristic formula of
[ClassFieldTheory](../../ClassFieldTheory/README.md) is reduced to induced representations by the
modular Artin theorem and the lattice defect, and
[ModularCharactersAndBlocks](../ModularCharactersAndBlocks/README.md) builds the decomposition map
on these groups.

Layer 0 sets up G₀(k[G]) through the dictionary with finite-dimensional representations: classes,
the universal property, the simple-class basis and the dimension. Layer 1 adds the ring structure,
restriction, induction, the projection formula, permutation classes, the Green ring and base
change. Layer 2 treats elements of ℓ-power order, Layer 3 the reduction of G-modules modulo ℓ and
the lattice defect, and Layer 4 Artin's identity and the two induction theorems.

## Conventions

1. **Coefficients and groups.** `k` is a field and `G` a finite group (`[Field k] [Group G]
   [Finite G]`), in one universe `u`, as Tau Ceti's Grothendieck-group API requires; for
   `k = ZMod ℓ` this means `G : Type`. A subgroup `C : Subgroup G` is used as the group `↥C`. A prime
   `ℓ` enters as `(ℓ : ℕ) [Fact ℓ.Prime] [CharP k ℓ]` exactly where the characteristic matters:
   Layer 2, the comparisons of §§3.1–3.2 and §§4.6–4.7. Every other statement is made over an
   arbitrary field. `k[G]` is Mathlib's `MonoidAlgebra k G`, with its scoped notation.
2. **`G₀` is exact `K₀` of finitely generated modules.** `G₀(k[G])` is
   `TauCeti.ExactK0 (TauCeti.finiteModulesExactStructure k[G])`: the finitely generated
   `k[G]`-modules, which for finite `G` are the finite-dimensional and the finite-length ones, with
   `[M₂] = [M₁] + [M₃]` for every short exact sequence. It is not the Green ring `TauCeti.repRing k G`
   (split `K₀` of `FDRep k G`), which imposes only the split relations; §1.7 compares the two. No
   second carrier is introduced.
3. **Representations enter through the dictionary.** `TauCeti.fdRepEquivalence k G :
   FDRep k G ≌ FGModuleCat k[G]` sends `V` to `V.ρ.asModule`. The class of `V : FDRep k G` is
   `[V] = TauCeti.fdRepK0RingEquiv k G (TauCeti.ExactK0.of V)`, which is the class
   `TauCeti.ExactK0.of (FGModuleCat.of k[G] V.ρ.asModule)` of its module
   (`TauCeti.fdRepK0RingEquiv_of`). The relations used are the short exact sequences of the abelian
   category `FDRep k G`.
4. **Induction from subgroups, restriction along homomorphisms.** Induction from `S : Subgroup G` is
   `TauCeti.indK0 k S`; on the class of `A : FDRep k S` it is the class of Tau Ceti's induced
   representation `TauCeti.indFDRep A`. Restriction along any `φ : H →* G` is `TauCeti.resK0 k φ`,
   which on classes is Mathlib's `Action.res`, inflation included. A subgroup of a subgroup is
   `S.subgroupOf T`, identified with `S` by `Subgroup.subgroupOfEquivOfLe`.
5. **Permutation classes.** `TauCeti.permK0 k G X` is the class of `Representation.ofMulAction k G X`
   for a finite `G`-set `X`. Cosets are Mathlib's left cosets `G ⧸ S`. Fixed points are
   `MulAction.fixedBy X g`, counted by `Nat.card`.
6. **`G`-modules and lattices.** A `G`-module is `V` with `[AddCommGroup V] [DistribMulAction G V]`:
   a `ℤ[G]`-module for the same finite group `G`, neither localized nor completed at `ℓ`, whose
   `ℤ`-module structure is the canonical one. It is stated unbundled rather than as `Rep ℤ G`
   because the carrier of `Rep ℤ G` has its own `Module ℤ` field, not definitionally the canonical
   one, and `k ⊗_ℤ V` must be formed with one. `V/ℓV` is `QuotSMulTop (ℓ : ℤ) V` and `V[ℓ]` is
   `Submodule.torsionBy ℤ V ℓ`, with the actions `Representation.quotSMulTop` and
   `Representation.torsionBy` of `Representation.ofDistribMulAction ℤ G V`. A **lattice** is a
   `G`-module with `[Module.Finite ℤ V] [HasUniqueDiv V]`: finitely generated and torsion free,
   equivalently finitely generated and free over `ℤ`. The **reduction** of `V` to `k` is
   `k ⊗_ℤ V` with the representation `Representation.baseChange k (Representation.ofDistribMulAction ℤ G V)`;
   in characteristic `ℓ` it is `k ⊗_{𝔽_ℓ} (V/ℓV)`. The **rationalization** is `ℚ ⊗_ℤ V`, the same
   construction at `ℚ`.
7. **Multiples and coprimality.** For a prime `ℓ`, "order prime to `ℓ`" is `¬ ℓ ∣ Nat.card C`, which
   is `Nat.Coprime ℓ (Nat.card C)` by `Nat.Prime.coprime_iff_not_dvd`. The `ℓ`-part `|C|_ℓ` of
   `|C|` is `ordProj[ℓ] (Nat.card C)`, that is `ℓ ^ (Nat.card C).factorization ℓ`. Multiples are the
   `ℕ`- or `ℤ`-scalar multiplication of the additive group; sums over subgroups are `∑ᶠ` over the
   finite type `Subgroup G`.
8. **Induced classes.** For a predicate `P` on subgroups, `TauCeti.indClassesK0 k G P` is the
   supremum of the ranges of `TauCeti.indK0 k C` over the subgroups `C` with `P C`, the `G₀`
   counterpart of `TauCeti.ClassFunction.indVirtualCharacters`. Its two instances are
   `TauCeti.indCyclicK0 k G`, the classes induced from cyclic subgroups, and
   `TauCeti.indCyclicCoprimeK0 k G ℓ`, those induced from cyclic subgroups `C` with
   `Nat.Coprime ℓ (Nat.card C)`. They are induced from all of `G₀(k[C])`, not only from permutation
   modules: for `G = ℤ/7` and `k = 𝔽₂` the permutation modules `𝔽₂` and `𝔽₂[ℤ/7]` span a subgroup of
   rank 2 in a `G₀` of rank 3 (§0.5).
9. **Names.** The one statement of `Suggested.lean` lives in the namespace
   `TauCetiRoadmap.RepresentationTheory.ModularInduction`. A target of this roadmap without a
   declaration there is described in prose.

## Layer 0: the Grothendieck group of a group algebra

This layer is exact `K₀` of finitely generated modules, specialized to the group algebra and read
through the dictionary with `FDRep k G` (Serre, *Linear Representations of Finite Groups*, Part III,
§§14–18, for `R_k(G)`).

### 0.1 The group algebra is Artinian

`k[G]` is finite-dimensional over `k`, hence Artinian. Tau Ceti's instance
`MonoidAlgebra.isArtinianRing_of_finite` (a finite monoid over an Artinian coefficient ring) supplies
`IsArtinianRing k[G]`, the hypothesis of the simple-class basis of §0.5.

**Checks.**
- For the infinite group `ℤ`, `k[ℤ] = k[t, t⁻¹]` is Noetherian and not Artinian (the chain
  `(t − 1) ⊋ (t − 1)² ⊋ …` does not stop), and its finitely generated module `k[ℤ]` is
  infinite-dimensional over `k`: finiteness of `G` is what makes "finitely generated",
  "finite-dimensional" and "finite length" agree.

### 0.2 The dictionary

`TauCeti.fdRepEquivalence k G : FDRep k G ≌ FGModuleCat k[G]` is the restriction of Mathlib's
`Rep.equivalenceModuleMonoidAlgebra` to finite objects (a `k[G]`-module is finitely generated
exactly when it is finite-dimensional over `k`), with object formula
`TauCeti.fdRepEquivalence_functor_obj_obj`, `V ↦ V.ρ.asModule`. It is an equivalence of abelian
categories, so it carries the short exact sequences of `FDRep k G` to the conflations of
`TauCeti.finiteModulesExactStructure k[G]` and back: `TauCeti.isConflationExact_fdRepEquivalence_functor`
and `TauCeti.isConflationExact_fdRepEquivalence_inverse`. The induced isomorphism of Grothendieck
groups is the ring isomorphism `TauCeti.fdRepK0RingEquiv k G` from the exact `K₀` of `FDRep k G`.

### 0.3 Classes and generation

The class `[V]` of a finite-dimensional representation is that of Convention 3. Its API, all of it
read through the ring isomorphism `TauCeti.fdRepK0RingEquiv k G`:
- isomorphic representations have the same class (`TauCeti.ExactK0.of_congr`);
- for every short exact sequence `0 → V₁ → V₂ → V₃ → 0` in `FDRep k G`, `[V₂] = [V₁] + [V₃]`
  (`TauCeti.ExactK0.of_conflation` with `TauCeti.ExactStructure.abelian_conflation`);
- `[0] = 0` and `[V ⊞ W] = [V] + [W]` (`TauCeti.ExactK0.of_zero`, `TauCeti.ExactK0.of_biprod`);
- the classes `[V]` generate `G₀(k[G])` as an abelian group (`TauCeti.ExactK0.closure_range_of`,
  with the induction principle `TauCeti.ExactK0.induction_on`).

Prove that the classes of simple representations generate `G₀(k[G])`: the additive subgroup
generated by the `[V]` with `V : FDRep k G` simple (Mathlib's `Simple V`) is everything (Serre,
Part III, §§14–18). The route: every simple finitely generated `k[G]`-module is the module of a
representation that is simple in `FDRep k G`, so a finite exhaustive family of simple modules
consists of classes of simple representations, and the classes of such a family span.
*Needs:* §0.1; Tau Ceti `TauCeti.exists_isExhaustiveSimpleFamily`,
`TauCeti.span_range_exactK0OfFamily_eq_top`, `TauCeti.Representation.isIrreducible_ofModule'_iff`,
`FDRep.simple_iff_isIrreducible`, `TauCeti.fdRepK0RingEquiv_of`.

**Checks.**
- For `G = C₂` and `k = 𝔽₂`, the regular module `𝔽₂[C₂]` is a non-split extension of `𝔽₂` by `𝔽₂`
  (its fixed vectors form a line), so `𝔽₂[C₂] ≇ 𝔽₂ ⊕ 𝔽₂`, yet both have class `2[𝔽₂]`. A definition
  with only the split relations would keep the two classes apart.
- For `G = S₃` and `k = 𝔽₂` the simple modules are `𝔽₂` and the two-dimensional `S` (the natural
  action of `S₃ ≅ GL₂(𝔽₂)` on `𝔽₂²`), and `[𝔽₂[S₃]] = 2[𝔽₂] + 2[S]`; the indecomposable non-simple
  module `𝔽₂[S₃/A₃]` has class `2[𝔽₂]`.

### 0.4 The universal property

An integer-valued, or abelian-group-valued, invariant of representations that is additive on short
exact sequences descends to `G₀(k[G])`: for `f : FDRep k G → A` with `f V₂ = f V₁ + f V₃` on every
short exact sequence, `TauCeti.liftFDRepK0 f hf : G₀(k[G]) →+ A` satisfies
`TauCeti.liftFDRepK0_of` (its value on `[V]` is `f V`) and `TauCeti.liftFDRepK0_unique`, and
homomorphisms out of `G₀(k[G])` are determined by their values on classes of representations
(`TauCeti.hom_ext_fdRep`). Invariance of `f` under isomorphism is not a hypothesis: it follows from
additivity (`TauCeti.ExactK0.AdditiveInvariant.map_iso`).

### 0.5 The simple-class basis

- **Multiplicities.** For a module `S`, `TauCeti.jordanHolderCoordinate k[G] S : G₀(k[G]) →+ ℤ`
  sends the class of `M` to the multiplicity `TauCeti.jordanHolderMultiplicity k[G] M S` of `S` as a
  composition factor of `M` (`TauCeti.jordanHolderCoordinate_of`); through the dictionary, the
  coordinate at the module of a simple representation `S`, evaluated on `[V]`, is the number of
  composition factors of the module of `V` isomorphic to the module of `S`.
- **Determination by multiplicities.** An element of `G₀(k[G])` is determined by its coordinates at
  the simple modules (`TauCeti.ExactK0.ext_jordanHolderCoordinate`), and two modules have the same
  class exactly when they have the same composition multiplicities
  (`TauCeti.ExactK0.of_eq_of_iff_jordanHolderMultiplicity_eq`).
- **The basis.** There is a finite family of pairwise non-isomorphic simple `k[G]`-modules
  containing every simple module up to isomorphism (`TauCeti.exists_isExhaustiveSimpleFamily`;
  each simple module is a quotient of `k[G]`). For such a family, `TauCeti.simpleClassBasis` is a
  `ℤ`-basis of `G₀(k[G])` with basis vectors the simple classes and coordinates the multiplicities
  (`TauCeti.simpleClassBasis_apply`, `TauCeti.simpleClassBasis_repr_apply`). Hence `G₀(k[G])` is
  free and finitely generated over `ℤ` (`TauCeti.instFreeExactK0OfIsArtinianRing`,
  `TauCeti.instFiniteExactK0OfIsArtinianRing`), of rank the number of isomorphism classes of simple
  `k[G]`-modules (`TauCeti.finrank_exactK0_eq_card_of_isExhaustiveSimpleFamily`).

**Checks.**
- `G₀(𝔽₂[C₂])` has rank 1, while `𝔽₂[C₂]` has two indecomposable modules up to isomorphism, `𝔽₂`
  and `𝔽₂[C₂]`: a basis of indecomposable classes, as in the Green ring, would have rank 2.
- Over `𝔽₂`, `x⁷ − 1 = (x + 1)(x³ + x + 1)(x³ + x² + 1)`, so `𝔽₂[ℤ/7] ≅ 𝔽₂ × 𝔽₈ × 𝔽₈` has three
  simple modules and `G₀(𝔽₂[ℤ/7])` has rank 3; `G₀(𝔽₂[S₃])` and `G₀(𝔽₃[S₃])` have rank 2 and
  `G₀(ℚ[S₃])` rank 3.

### 0.6 Dimension

The dimension `TauCeti.finrankK0 k k[G] : G₀(k[G]) →+ ℤ` sends `[V]` to `dim_k V`
(`TauCeti.finrankK0_of`, `TauCeti.finrankK0_fdRepK0RingEquiv_of`) and the unit to `1`
(`TauCeti.finrankK0_one`).

Prove that for a group `G` with one element the dimension is an isomorphism `G₀(k[G]) ≃+ ℤ`, over
every field `k`. The route: every simple module over the group algebra of the trivial group is the
trivial line, so the one-member family of the trivial line is exhaustive and the dimension is
bijective; in characteristic `ℓ` this is also the case `P = 1` of §2.3.
*Needs:* §0.5; Tau Ceti `TauCeti.finrankK0Equiv`, `TauCeti.isExhaustiveSimpleFamily_of_forall_isIrreducible`.

**Checks.**
- For `G = C₂` over `ℚ`, `[ℚ] − [ℚ_sgn]` has dimension `0` and multiplicity `1` at the trivial
  module, so it is not zero: the dimension is not injective for a nontrivial group in general. Over
  `𝔽₂` the sign character is trivial and the dimension is injective, as §2.3 says for a `2`-group.

### Examples

- For `G = S₃` over `𝔽₂`, in the basis `([𝔽₂], [S])`: `[𝔽₂[S₃]] = (2, 2)`,
  `[𝔽₂[S₃/C₂]] = (1, 1)` (the three-point permutation module is `𝔽₂ ⊕ S`, since `3` is odd), and
  `[𝔽₂[S₃/A₃]] = (2, 0)`.
- For `G = S₃` over `𝔽₃`, with simple modules `𝔽₃` and the sign `sgn`: `[𝔽₃[S₃]] = 3[𝔽₃] + 3[sgn]`,
  `[𝔽₃[S₃/C₂]] = 2[𝔽₃] + [sgn]` and `[𝔽₃[S₃/A₃]] = [𝔽₃] + [sgn]`.

### Dependencies

Tau Ceti: exact `K₀` of finitely generated modules and of abelian categories, the dictionary
`TauCeti.fdRepEquivalence` with its ring isomorphism `TauCeti.fdRepK0RingEquiv`, the universal
property `TauCeti.liftFDRepK0`, the Jordan–Hölder coordinates and simple-class basis over an
Artinian ring, the dimension homomorphism, and the Artinian instance for finite monoid algebras.
Mathlib: `FDRep`, `FGModuleCat`, `Rep.equivalenceModuleMonoidAlgebra`, simple objects.

## Layer 1: ring structure, restriction, induction, and permutation classes

All of this layer is over an arbitrary field (Serre, Part III, §§14–18, for the ring `R_k(G)`).

### 1.1 The ring

`G₀(k[G])` is a commutative ring, `TauCeti.instCommRingExactK0MonoidAlgebra`, on the additive group
of Layer 0: `[V] · [W] = [V ⊗ W]`, the tensor product over `k` with the diagonal action
(`TauCeti.of_asModule_mul_of_asModule`), and `1 = [k]`, the class of the trivial line
(`TauCeti.exactK0_one_eq_of_trivial`). Over a field `V ⊗ −` and `− ⊗ W` are exact, which is why the
product descends; the ring structure is that of the exact Grothendieck ring of `FDRep k G`, carried
along `TauCeti.fdRepK0RingEquiv`.

**Checks.**
- For `G = C₂` over `ℚ`, `[ℚ] · [ℚ_sgn] = [ℚ_sgn]`, while the tensor product of the two modules over
  the commutative ring `ℚ[C₂]` is zero (on it `a ⊗ b = −a ⊗ b`): the product is the tensor product
  over `k` with the diagonal action, not over `k[G]`.
- For `G = S₃` over `𝔽₂`, `[S] · [S] = 2[𝔽₂] + [S]`: `S ⊗ S ≅ End(S)` has the scalars as a
  submodule, the trace as a quotient (the trace of the identity is `2 = 0`), and `S` between them.

### 1.2 Restriction

For `φ : H →* G` with `H` finite, restriction `TauCeti.resK0RingHom k φ : G₀(k[G]) →+* G₀(k[H])`
is a ring homomorphism, exact because it does not change the underlying spaces. On classes it is
`Action.res` (`TauCeti.resK0_fdRepK0RingEquiv_of`, and `TauCeti.resK0_of_asModule` in module
form); it is contravariantly functorial (`TauCeti.resK0_id`, `TauCeti.resK0_comp`) and preserves
dimension (`TauCeti.finrankK0_resK0`).

### 1.3 Induction

For `S : Subgroup G`, induction `TauCeti.indK0 k S : G₀(k[S]) →+ G₀(k[G])` sends `[A]` to
`[TauCeti.indFDRep A]` (`TauCeti.indK0_of_indFDRep`, `TauCeti.indK0_fdRepK0RingEquiv_of`). It is
well defined because induction is exact: it is coinduction `Hom_{k[S]}(k[G], −)`, which for a
subgroup of finite index is the induced representation (`TauCeti.indK0_of_asModule_of_equiv`), and
the coset model `TauCeti.Rep.indSubtypeEquivPi` identifies `Ind_S^G A` with a finite product of
copies of `A` as a vector space. Induction multiplies dimension by the index:
`dim (Ind_S^G y) = [G : S] · dim y` (`TauCeti.finrankK0_indK0`). For `S ≠ G` it is not a ring
homomorphism: `Ind_S^G 1 = [k[G/S]]` has dimension `[G : S] > 1`.

### 1.4 The projection formula and the induced classes

For `S : Subgroup G`, `y ∈ G₀(k[S])` and `x ∈ G₀(k[G])`,
`Ind_S^G (y · Res_S^G x) = (Ind_S^G y) · x` (`TauCeti.indK0_mul_resK0`), the class form of Tau
Ceti's `TauCeti.indFDRepProjection`; at `y = 1`, `Ind_S^G (Res_S^G x) = [k[G/S]] · x`
(`TauCeti.indK0_resK0`). Consequently the induced classes `TauCeti.indClassesK0 k G P` of
Convention 8 form an ideal of the ring `G₀(k[G])` (`TauCeti.mul_mem_indClassesK0`).

**Checks.**
- For `G = S₃` over `𝔽₂` and the trivial subgroup, `Res_1 [S] = 2[𝔽₂]`, so
  `Ind_1 Res_1 [S] = 2[𝔽₂[S₃]] = 4[𝔽₂] + 4[S]`; on the other side, with `[S]² = 2[𝔽₂] + [S]` from
  §1.1, `[𝔽₂[S₃]] · [S] = (2[𝔽₂] + 2[S]) · [S] = 2[S] + 2(2[𝔽₂] + [S]) = 4[𝔽₂] + 4[S]`.

### 1.5 Transitivity

For subgroups `S ≤ T` of `G`, `Ind_T^G (Ind_{S.subgroupOf T}^T y)` equals `Ind_S^G` of `y`
transported from `S.subgroupOf T` to `S` by restriction along the inverse of
`Subgroup.subgroupOfEquivOfLe` (`TauCeti.indK0_indK0`, and `TauCeti.indK0_comp_indK0` as an equality
of homomorphisms). It is the class form of `TauCeti.Rep.indFunctorCompIso`.

### 1.6 Permutation classes

`TauCeti.permK0 k G X` (Convention 5) depends on `X` only through its isomorphism class as a
`G`-set (`TauCeti.permK0_congr`), is additive in disjoint unions (`TauCeti.permK0_sum`,
`TauCeti.permK0_sigma`), is `0` on the empty set (`TauCeti.permK0_of_isEmpty`) and the class of the
trivial line, that is `1`, on a point (`TauCeti.permK0_of_subsingleton`). Inducing the unit gives the
coset class, `Ind_S^G 1 = [k[G/S]]` (`TauCeti.indK0_one`, from `TauCeti.indTrivialIso`), and for
`D ≤ C`, `Ind_C^G [k[C/D]] = [k[G/D]]` (`TauCeti.indK0_of_ofMulAction_quotient`, with `C/D` the
cosets of `D.subgroupOf C`).

**Checks.**
- For `G = S₃` over `𝔽₂`, the two-point set `S₃/A₃` and the two-point set with trivial action have
  the same class `2[𝔽₂]`, but over `ℚ` their classes `[ℚ] + [ℚ_sgn]` and `2[ℚ]` differ: the class
  of a `G`-set over a field of characteristic dividing `|G|` does not determine its fixed-point
  counts (compare §4.3, which goes the other way).

### 1.7 The Green ring

The comparison `TauCeti.repRingToGroupAlgebraK0 k G : TauCeti.repRing k G →+* G₀(k[G])` sends the
split class of a representation to its exact class (`TauCeti.repRingToGroupAlgebraK0_of`); it is
the map from split to exact `K₀` followed by the dictionary
(`TauCeti.repRingToGroupAlgebraK0_apply`), it is surjective
(`TauCeti.repRingToGroupAlgebraK0_surjective`), it commutes with Tau Ceti's `TauCeti.repRingRes`
and `TauCeti.repRingInd` (`TauCeti.repRingToGroupAlgebraK0_repRingRes`,
`TauCeti.repRingToGroupAlgebraK0_repRingInd`), and it is bijective when `(Nat.card G : k) ≠ 0`
(`TauCeti.repRingToGroupAlgebraK0_bijective`): by Maschke's theorem every short exact sequence then
splits.

**Checks.**
- For `G = C₂` over `𝔽₂`, the split classes of `𝔽₂[C₂]` and of `𝔽₂ ⊕ 𝔽₂` are different elements of
  the Green ring with the same image `2[𝔽₂]`: the comparison is not injective when the
  characteristic divides `|G|`.

### 1.8 Base change

For a field extension `k → K`, the ring homomorphism
`TauCeti.groupAlgebraBaseChangeK0 K : G₀(k[G]) →+* G₀(K[G])` sends `[V]` to `[K ⊗_k V]`
(`TauCeti.groupAlgebraBaseChangeK0_of_asModule`; `Representation.baseChange`, exact because `K` is
flat over `k`). It is the identity for `K = k` and transitive in towers
(`TauCeti.groupAlgebraBaseChangeK0_id`, `TauCeti.groupAlgebraBaseChangeK0_comp`), and it commutes
with restriction, induction and permutation classes (`TauCeti.groupAlgebraBaseChangeK0_resK0`,
`TauCeti.groupAlgebraBaseChangeK0_indK0`, `TauCeti.groupAlgebraBaseChangeK0_permK0`).

**Checks.**
- For `G = C₃` and `𝔽₂ ⊂ 𝔽₄`: `𝔽₂[C₃] ≅ 𝔽₂ × 𝔽₄` has simple modules `𝔽₂` and the two-dimensional
  `𝔽₄`, and `𝔽₄ ⊗_{𝔽₂} 𝔽₄` is the sum of the two nontrivial characters `χ`, `χ²` of `C₃` over `𝔽₄`.
  Base change sends the rank-2 group `G₀(𝔽₂[C₃])` onto a subgroup of rank 2 of the rank-3 group
  `G₀(𝔽₄[C₃])` that does not contain `[χ]`: base change does not preserve simplicity.

### Examples

- For `G = S₃` over `𝔽₂`, `[𝔽₂[S₃/C₂]] · [S] = ([𝔽₂] + [S]) · [S] = 2[𝔽₂] + 2[S] = [𝔽₂[S₃]]`, as
  the projection formula predicts: `[𝔽₂[S₃/C₂]] · [S] = Ind_{C₂} Res_{C₂} [S]`, and `Res_{C₂} [S]` is
  the regular module of `C₂` (a transposition acts on `𝔽₂²` as a transvection), so the right-hand
  side is `[Ind_1 𝔽₂] = [𝔽₂[S₃]]`.

### Dependencies

Layer 0. Tau Ceti: the commutative ring structure on `G₀(k[G])`, restriction and induction on
`G₀`, the projection formula, transitivity, permutation classes, induced classes, the comparison
with the Green ring and base change of coefficients, with the representation-level inputs
`TauCeti.indFDRep`, `TauCeti.indFDRepProjection`, `TauCeti.Rep.indFunctorCompIso` and
`TauCeti.indTrivialIso`, and the scalar extension `Representation.baseChange`. Mathlib:
`Action.res`, `Representation.ofMulAction`, Maschke's theorem.

## Layer 2: elements of ℓ-power order

In characteristic `ℓ`, an element acting with `ℓ`-power order acts unipotently, so every
composition factor of a representation in which every element acts with `ℓ`-power order is
trivial.

### 2.1 A fixed vector

If `k` has exponential characteristic `ℓ` (for a prime `ℓ`, characteristic `ℓ`), `V` is a nonzero
finite-dimensional representation of a monoid `H` and every `ρ h` satisfies `ρ h ^ ℓ ^ n = 1` for
some `n` depending on `h`, then some nonzero vector is fixed by `H`
(`Representation.exists_common_fixed_vector_of_forall_pow_expChar_pow_eq_one`). Indeed
`(ρ h − 1) ^ ℓ ^ n = ρ h ^ ℓ ^ n − 1 = 0`, so each `ρ h` is unipotent and Kolchin's theorem
`Representation.exists_common_fixed_vector_of_isUnipotent` applies; `k` may be infinite. In
particular an irreducible representation of a group on which every element acts with `ℓ`-power
order is the trivial representation of dimension one
(`Representation.IsIrreducible.eq_trivial_of_forall_pow_expChar_pow_eq_one`), and a simple
`k[G]`-module with this property is the trivial line
(`TauCeti.nonempty_linearEquiv_trivial_of_forall_pow_eq_one`).

**Checks.**
- Over `ℚ`, `C₂` acting on `ℚ` by `−1` has every element of order dividing `2` and no nonzero fixed
  vector: the hypothesis on the characteristic cannot be dropped.

### 2.2 Trivial composition factors

If `char k = ℓ` and `V` is a finite-dimensional representation of `G` in which every element acts
with `ℓ`-power order, then `[V] = dim V · 1` in `G₀(k[G])`
(`TauCeti.exactK0_asModule_eq_finrank_nsmul_of_forall_pow_eq_one`), by induction along a
composition series, the hypothesis passing to subquotients. No semisimplicity is assumed.

### 2.3 ℓ-groups

For a finite `ℓ`-group `P` (`IsPGroup ℓ P`) and `char k = ℓ`, every class is its dimension times the
unit, `x = dim x · 1` (`TauCeti.eq_finrankK0_smul_trivial_of_isPGroup`), so the dimension is an
isomorphism `G₀(k[P]) ≃+ ℤ` (`TauCeti.pGroupFinrankK0Equiv`).

**Checks.**
- `[𝔽₂[C₂]] = 2 · 1` in `G₀(𝔽₂[C₂])`, although `𝔽₂[C₂]` is indecomposable; over `𝔽₂` the group
  `C₃` is not a `2`-group and its two-dimensional simple module `𝔽₄` is not `2 · 1`.

### 2.4 The ℓ′-part of a cyclic subgroup

A finite cyclic subgroup `C` has a subgroup `D ≤ C`, normal in `C`, of order prime to `ℓ`, of index
`[C : D] = |C|_ℓ`, with `c ^ ℓ ^ n ∈ D` for every `c ∈ C` and some `n`
(`TauCeti.exists_coprimePart_of_isCyclic`): for a generator `g` of `C`, `D` is the subgroup generated
by `g ^ |C|_ℓ` (`TauCeti.zpowers_pFreePart_eq_zpowers_pow_ordProj`).

**Checks.**
- For `C = ℤ/12`: at `ℓ = 2`, `D` has order `3` and index `4`; at `ℓ = 3`, `D` has order `4` and
  index `3`.

### 2.5 Permutation classes along an ℓ-power quotient

If `char k = ℓ`, `D ≤ C` are subgroups of `G` with `D.subgroupOf C` normal and `c ^ ℓ ^ n ∈ D` for
every `c ∈ C` (with `n` depending on `c`), then `Ind_D^G 1 = [C : D] · Ind_C^G 1`
(`TauCeti.indK0_of_trivial_eq_relIndex_nsmul`), and more generally
`Ind_D^G Res_D^G x = [C : D] · Ind_C^G Res_C^G x` for every `x ∈ G₀(k[G])`
(`TauCeti.indK0_resK0_eq_relIndex_nsmul`). Every element of `C` acts on `k[C/D]` with `ℓ`-power
order, so `[k[C/D]] = [C : D] · 1` in `G₀(k[C])` by §2.2; apply `Ind_C^G`, §1.6 and the projection
formula.

**Checks.**
- For `G = C = C₂`, `D = 1` over `𝔽₂`: `Ind_1 1 = [𝔽₂[C₂]] = 2 · 1 = 2 · Ind_{C₂} 1`. Over `ℚ` the same
  identity fails, `[ℚ[C₂]] = [ℚ] + [ℚ_sgn] ≠ 2[ℚ]`: the characteristic must be `ℓ`.

### Examples

- For `G = S₃` over `𝔽₂`, with `C = C₂` and `D = 1`: `2 [𝔽₂[S₃/C₂]] = [𝔽₂[S₃]]`, that is
  `2 · (1, 1) = (2, 2)`. Over `𝔽₃`, with `C = A₃` and `D = 1`: `3 [𝔽₃[S₃/A₃]] = [𝔽₃[S₃]]`, that is
  `3([𝔽₃] + [sgn]) = 3[𝔽₃] + 3[sgn]`.

### Dependencies

Layers 0–1. Tau Ceti: Kolchin's theorem and its `ℓ`-power-order form, the classes of
representations with `ℓ`-power-order image, `ℓ`-groups, the `ℓ`-free part of a cyclic subgroup.
Mathlib: `IsPGroup`, `IsCyclic`, `Subgroup.relIndex`, `ExpChar`, `CharP`.

## Layer 3: reduction of G-modules modulo ℓ

This layer is Neukirch–Schmidt–Wingberg (7.3.3) in `G₀`, together with its consequence for
lattices, the integral `ℤ[G]` analogue of Milne, *Arithmetic Duality Theorems*, I, Lemma 2.12,
proved by the same snake-lemma argument; Milne states the lemma for finitely generated
`ℤ_p[H]`-modules with isomorphic `ℚ_p`-rationalizations. It is used in Layer 4 for permutation
lattices and by the local Euler characteristic for the unit groups of local fields.

### 3.1 Torsion and reduction

`V[n]` carries the action `Representation.torsionBy`, and `V/nV` the action
`Representation.quotSMulTop`. The reduction `TauCeti.reduction k G V : FDRep k G` is `k ⊗_ℤ V`,
defined when it is finite-dimensional; it is functorial in equivariant additive maps
(`TauCeti.reductionMap`, `TauCeti.reductionMap_id`, `TauCeti.reductionMap_comp`) and right exact
(`TauCeti.epi_reductionMap`, `TauCeti.exact_reductionMap`). Its class is
`TauCeti.reductionK0 k (Representation.ofDistribMulAction ℤ G V)`
(`TauCeti.fdRepK0RingEquiv_of_reduction`). In characteristic `ℓ`, finiteness of `V/ℓV` makes
`k ⊗_ℤ V` finite-dimensional (`TauCeti.finite_baseChange_of_finite_quotSMulTop`), because
`k ⊗_ℤ V ≅ k ⊗_ℤ (V/ℓV)` there.

### 3.2 The lattice defect

For `V/ℓV` and `V[ℓ]` finite, the lattice defect `TauCeti.latticeDefect k G ℓ V` is
`[k ⊗_ℤ (V/ℓV)] − [k ⊗_ℤ V[ℓ]]` (NSW (7.3.3)). If `k` has characteristic `ℓ`, it is
`[k ⊗_ℤ V] − [k ⊗_ℤ V[ℓ]]` (`TauCeti.latticeDefect_eq_reductionK0_sub`, and
`TauCeti.latticeDefect_eq_fdRepK0RingEquiv_reduction_sub` with the class of
`TauCeti.reduction k G V`), and if moreover `V` has no `ℓ`-torsion it is the reduction class
`[k ⊗_ℤ V]` (`TauCeti.latticeDefect_eq_reductionK0`). At `k = 𝔽_ℓ` it is `[V/ℓV] − [V[ℓ]]`, the
reduction class of an `𝔽_ℓ`-representation being its class (`TauCeti.reductionK0_restrictScalarsInt`).
If `ℓ` is invertible in `k`, both reductions vanish and so does the defect.

**Checks.**
- Over `k` of characteristic `ℓ`, with trivial actions: for `ℤ`, `V/ℓV = 𝔽_ℓ` and `V[ℓ] = 0`, so the
  defect is `[k] = 1`; for `ℤ/ℓ²`, `V/ℓV` and `V[ℓ]` are both `𝔽_ℓ` and the defect is `0`; for `ℤ/ℓ`
  it is `0` as well.
- The invariant `[k ⊗_ℤ (V/ℓV)]` alone is not additive: over `k` of characteristic `ℓ`, on
  `0 → ℤ → ℤ → ℤ/ℓ → 0` (multiplication by `ℓ`) it gives `[k]` in the middle and `[k] + [k]` on the
  ends. Subtracting `[k ⊗_ℤ V[ℓ]]` repairs this, as §3.3 says.

### 3.3 Additivity

For a prime `ℓ` and a short exact sequence `0 → A → B → C → 0` of `G`-modules with equivariant maps
whose reductions modulo `ℓ` and `ℓ`-torsion are finite, the defect of `B` is the sum of the defects
of `A` and `C` (`TauCeti.latticeDefect_add_of_exact`, NSW (7.3.3)). The snake lemma for
multiplication by `ℓ` gives the exact sequence
`0 → A[ℓ] → B[ℓ] → C[ℓ] → A/ℓA → B/ℓB → C/ℓC → 0` of `G`-modules killed by `ℓ`, the connecting map
being equivariant by naturality; `k ⊗_ℤ −` is exact on modules killed by `ℓ`; and the alternating
sum of classes along an exact sequence vanishes.

### 3.4 Finite modules

A finite `G`-module has defect zero (`TauCeti.latticeDefect_eq_zero_of_finite`, NSW (7.3.3)): it
has a composition series as a `ℤ[G]`-module whose factors are elementary abelian `p`-groups; a
factor with `p ≠ ℓ` has `S/ℓS = 0 = S[ℓ]`, one with `p = ℓ` has `S/ℓS = S = S[ℓ]`; conclude by
additivity. The defect also vanishes on every `G`-module on which multiplication by `ℓ` is
bijective (`TauCeti.latticeDefect_eq_zero_of_bijective_zsmul`).

### 3.5 Finite index

An injective equivariant `f : W →+[G] V` whose image has finite index gives
`latticeDefect W = latticeDefect V` (`TauCeti.latticeDefect_eq_of_finiteIndex`, NSW (7.3.3)), by
§§3.3–3.4; likewise when the cokernel is uniquely `ℓ`-divisible
(`TauCeti.latticeDefect_eq_of_bijective_zsmul_quotient`). The local Euler characteristic applies the
first to the principal unit groups `U^n_L ⊆ U^1_L` and to the rings of integers.

### 3.6 Lattices

Two lattices `V`, `W` with isomorphic rationalizations have the same reduction class over every
field `k`: `[k ⊗_ℤ V] = [k ⊗_ℤ W]` in `G₀(k[G])`
(`TauCeti.reductionK0_eq_of_nonempty_equiv_baseChange_rat`; Milne, I, Lemma 2.12, for the
`ℤ_p[H]` form). In characteristic zero, base change the rational isomorphism to `k`. In
characteristic `ℓ`, clear denominators: some multiple of the rational isomorphism maps `V`
injectively into `W` with finite cokernel, since the ranks agree; lattices have `V[ℓ] = 0`, so §3.5
applies. Only `ℤ`-lattices are needed here, not lattices over a general discrete valuation ring.

**Checks.**
- For `C₂` at `ℓ = 2`, the lattices `ℤ[C₂]` and `ℤ ⊕ ℤ_sgn` have isomorphic rationalizations
  `ℚ ⊕ ℚ_sgn`; their reductions `𝔽₂[C₂]` (a non-split extension of `𝔽₂` by `𝔽₂`) and `𝔽₂ ⊕ 𝔽₂` are
  not isomorphic, and both have class `2[𝔽₂]`.
- Torsion freeness cannot be dropped: `ℤ ⊕ ℤ/ℓ` and `ℤ` with trivial action have isomorphic
  rationalizations `ℚ`, but over a field of characteristic `ℓ` their reductions have classes `2[k]`
  and `[k]`.

### 3.7 Permutation lattices

The permutation lattice of a finite `G`-set `X` is `ℤ[X] = X →₀ ℤ` with
`Finsupp.comapDistribMulAction`. For every commutative ring `A`, `A ⊗_ℤ ℤ[X] ≅ A[X]` as
representations (`TauCeti.baseChangeComapEquiv`, built from `TauCeti.baseChangeOfMulActionEquiv`), so
the reduction of `ℤ[X]` is `k[X]` (`TauCeti.reductionK0_finsupp_int`) and its rationalization is
`ℚ[X]`; in characteristic `ℓ` its defect is the permutation class (`TauCeti.latticeDefect_finsupp_int`).

### Examples

- `0 → ℤ → ℤ → ℤ/ℓ → 0` (multiplication by `ℓ`, trivial action), over `k` of characteristic `ℓ`: the
  defects are `1`, `1` and `0`, and `1 = 1 + 0`.

### Dependencies

Layer 0. Tau Ceti: the torsion and quotient representations with the connecting map of the snake
lemma, reduction and its right exactness, the reduction class, the lattice defect and its
additivity, the finite and finite-index cases, the lattice comparison and the permutation lattices,
and the scalar extension `Representation.baseChange`. Mathlib: `QuotSMulTop`,
`Submodule.torsionBy`, `Finsupp.comapDistribMulAction`, the snake lemma
(`CategoryTheory.ShortComplex.SnakeInput`, `SnakeLemma.δ'`).

## Layer 4: Artin's identity and the modular Artin theorem

The proof has four steps: Artin's identity among permutation characters (§4.2), transferred to
`G₀` by lattices (§§4.3–4.4), spread to all classes by the projection formula (§4.5), with the
`ℓ`-parts of the cyclic subgroups eliminated by Layer 2 (§4.6).

### 4.1 The Artin coefficient

The Artin coefficient of `C : Subgroup G` is `Subgroup.artinCoeff C = ∑ᶠ` over the cyclic
`D ≥ C` of `μ([D : C])` (`Subgroup.artinCoeff_def`), written `m_C`. It is `0` unless `C` is cyclic,
a subgroup of a cyclic group being cyclic (`Subgroup.artinCoeff_eq_zero_of_not_isCyclic`). The
interval of subgroups between `C` and a cyclic `D` is the divisor lattice of `[D : C]`
(`TauCeti.sum_moebius_relIndex`, `Subgroup.sum_moebius_index`), which is what §4.2 uses. Tau Ceti's
Artin theorem for class functions in characteristic zero,
`TauCeti.ClassFunction.natCard_nsmul_one_mem_indVirtualCharacters_isCyclic`, is proved with the same
coefficients (Serre, §9.2, Theorem 17, for Artin's theorem in characteristic zero).

**Checks.**
- For `S₃`: `m_1 = μ(1) + 3μ(2) + μ(3) = −3`, `m_C = 1` for each of the three subgroups of order 2
  and for `A₃`, and `m_{S₃} = 0`.
- For a cyclic `G`, `m_G = 1` and `m_C = 0` for `C ≠ G`: for `G = ℤ/4`, `m_{ℤ/2} = μ(1) + μ(2) = 0`
  and `m_1 = μ(1) + μ(2) + μ(4) = 0`.

### 4.2 Artin's identity for fixed points

For every `g : G`, `∑ᶠ C, m_C · |C| · #(G/C)^g = |G|` in `ℤ` (`TauCeti.sum_artinCoeff_mul_card_fixedBy`;
Serre, §9.2, Theorem 17 and §12.5, Theorem 26, for Artin's theorem). Proof: `|C| · #(G/C)^g` counts
the `x` with `x⁻¹ g x ∈ C`; exchange the sums; the Artin coefficients of the subgroups containing a
fixed element sum to `1` (`TauCeti.sum_artinCoeff_of_mem`). It is stated for fixed points in `ℤ`
because §4.3 needs the integers, not their images in a field.

**Checks.**
- For `S₃`, at `1`: `−3 · 1 · 6 + 3 · (1 · 2 · 3) + 1 · 3 · 2 = 6`; at a transposition each subgroup
  of order 2 contributes `1 · 2 · 1` and the others `0`, total `6`; at a 3-cycle only `A₃`
  contributes, `1 · 3 · 2 = 6`. Without the factor `|C|` the sum would be `−7`, `3` and `2` at
  these three elements, not constant.

### 4.3 Permutation classes from fixed-point counts

Finite `G`-sets with the same fixed-point counts have isomorphic permutation representations over
every field of characteristic zero, in particular over `ℚ`
(`TauCeti.nonempty_equiv_ofMulAction_iff_forall_natCard_fixedBy_eq`, from `TauCeti.char_ofMulAction`
and `Representation.nonempty_equiv_of_character_eq`). Hence they have the same permutation class over
every field (`TauCeti.permK0_eq_of_forall_natCard_fixedBy_eq`): in characteristic `ℓ`, apply §3.6
to the permutation lattices `ℤ[X]` and `ℤ[Y]` of §3.7.

### 4.4 Artin's identity in G₀

Over every field `k`, `|G| · 1 = ∑ᶠ C, (m_C · |C|) · Ind_C^G 1` in `G₀(k[G])`
(`TauCeti.natCard_nsmul_one_eq_sum_artinCoeff_indK0`). Take `X` the disjoint union of `m_C |C|`
copies of `G/C` over the `C` with `m_C > 0`, and `Y` the disjoint union of `|G|` points and
`|m_C| |C|` copies of `G/C` over the `C` with `m_C < 0` (Tau Ceti's `TauCeti.ArtinPositiveSet` and
`TauCeti.ArtinNegativeSet`); §4.2 says they have the same fixed-point counts; conclude with §4.3,
§1.6 and `Ind_C^G 1 = [k[G/C]]`. Multiplying by `x` and using the projection formula gives
`|G| · x = ∑ᶠ C, (m_C · |C|) · Ind_C^G Res_C^G x` for every `x`
(`TauCeti.natCard_nsmul_eq_sum_artinCoeff_indK0_resK0`).

**Checks.**
- For `S₃` over `𝔽₂`, in the basis `([𝔽₂], [S])`:
  `−3 (2, 2) + 2 · 3 · (1, 1) + 3 · (2, 0) = (6, 0) = 6[𝔽₂]`. Over `𝔽₃`, in the basis
  `([𝔽₃], [sgn])`: `−3 (3, 3) + 2 · 3 · (2, 1) + 3 · (1, 1) = (6, 0)`.

### 4.5 Artin's theorem in G₀

Prove `modularArtin_natCard_nsmul_mem_indCyclic`: for every field `k` and every `x ∈ G₀(k[G])`,
`|G| · x` lies in `TauCeti.indCyclicK0 k G`, the subgroup generated by the classes induced from
cyclic subgroups (Serre, §9.2, Theorem 17 and §12.5, Theorem 26, in characteristic zero). The route:
in the expansion of §4.4, `m_C = 0` unless `C` is cyclic, and every other term is induced from the
cyclic subgroup `C`. In characteristic zero, through the bijection with the Green ring of §1.7,
this is Artin's theorem in the representation ring `R(G)`.
*Needs:* §§4.1, 4.4; Tau Ceti `TauCeti.natCard_nsmul_eq_sum_artinCoeff_indK0_resK0`,
`Subgroup.artinCoeff_eq_zero_of_not_isCyclic`, `TauCeti.indK0_mem_indCyclicK0`.

**Checks.**
- Over `ℚ` for `G = S₃`, with basis `([ℚ], [ℚ_sgn], [std])`, the classes induced from the cyclic
  subgroups are `(1, 1, 2)` from `1`, `(1, 0, 1)` and `(0, 1, 1)` from a subgroup of order 2, and
  `(1, 1, 0)` and `(0, 0, 2)` from `A₃`. All have even coordinate sum, so `[ℚ]` is not induced from
  cyclic subgroups, while `2[ℚ] = (1, 0, 1) + (1, 1, 0) − (0, 1, 1)` is: the multiplier cannot be
  dropped even in characteristic zero.

### 4.6 The modular Artin theorem

In characteristic `ℓ`, `|G| · x ∈ TauCeti.indCyclicCoprimeK0 k G ℓ` for every `x ∈ G₀(k[G])`
(`TauCeti.modularArtin_natCard_nsmul_mem_indCyclicCoprimeK0`; NSW (7.3.4), Milne, I, Lemma 2.10).
Rewrite the expansion of §4.4 term by term. For a cyclic `C` let `D ≤ C` be its `ℓ′`-part (§2.4)
and `r = [C : D] = |C|_ℓ`. By §2.5, `r · Ind_C^G Res_C^G x = Ind_D^G Res_D^G x`. Since `D ≤ C`, `r`
divides `|C|`, so `r` cancels against the factor `|C|` of the coefficient:
`(m_C · |C|) · Ind_C^G Res_C^G x = (m_C · |C| / r) · Ind_D^G Res_D^G x`, which is induced from the
cyclic subgroup `D` of order prime to `ℓ`. Summing over `C` gives the theorem, with the same
multiplier `|G|` as §4.5; one integral coefficient family works for every `x`
(`TauCeti.exists_linearCombination_indK0_resK0_eq_natCard_nsmul`). Some multiplier is needed when
`ℓ` divides `|G|`: a class induced from a subgroup of order prime to `ℓ` has dimension divisible by
`|G|_ℓ` (`Subgroup.ordProj_dvd_finrankK0_indK0`), so `N · [k]` is induced from such subgroups only
if `|G|_ℓ` divides `N` (`TauCeti.ordProj_dvd_of_nsmul_one_mem_indClassesK0`).

**Checks.**
- For `S₃` over `𝔽₃` the cyclic `3′`-subgroups are `1` and the subgroups of order 2. From one of
  order 2, `[Ind 1] = 2[𝔽₃] + [sgn]` and `[Ind sgn] = [𝔽₃] + 2[sgn]`, and `[𝔽₃[S₃]]` is their sum.
  They span a subgroup of index `3`, so `3[𝔽₃] = 2[Ind 1] − [Ind sgn]` is induced and `[𝔽₃]` is not:
  a positive multiple is necessary even for the trivial module.
- For `S₃` over `𝔽₃` the classes induced from cyclic `3′`-subgroups have dimensions `3` (from a
  subgroup of order 2) and `6` (from `1`), all divisible by `|S₃|_3 = 3`, while `[𝔽₃]` has dimension
  `1`.

### 4.7 The modular Artin theorem with an unspecified multiplier

In characteristic `ℓ`, for every `x ∈ G₀(k[G])` there is `N > 0` with
`N · x ∈ TauCeti.indCyclicCoprimeK0 k G ℓ` (`TauCeti.modularArtin_exists_nsmul_mem_indCyclicCoprimeK0`;
NSW (7.3.4), Milne, I, Lemma 2.10). It follows from §4.6 with `N = |G|`, positive because `G` is
nonempty. In the form applied to the local Euler characteristic, `k = ZMod ℓ`, `x = [A]`, and two
homomorphisms from `G₀(k[G])` to a torsion-free group agree once they agree after induction from
every cyclic subgroup of order prime to `ℓ` (`TauCeti.eq_of_comp_indK0_eq_of_cyclic_coprime`). For an
`ℓ`-group `P`, `N · [k]` is induced from the trivial subgroup exactly when `|P|` divides `N`
(`TauCeti.nsmul_one_mem_range_indK0_bot_iff_of_isPGroup`).

**Checks.**
- For an `ℓ`-group `P`, where `[k[P]] = |P| · [k]` and the only cyclic `ℓ′`-subgroup is trivial,
  `N · [k]` is induced exactly when `|P|` divides `N`, so for `ℓ`-groups `|G|` is the least
  multiplier; for `G = C₂` over `𝔽₂`, `[𝔽₂]` is not induced from `1` and `2[𝔽₂] = [𝔽₂[C₂]]` is.

### Examples

- For `S₃` over `𝔽₂`, the classes induced from the cyclic `2′`-subgroups `1` and `A₃` form `2 · G₀`:
  `Ind_{A₃} 𝔽₂ = [𝔽₂[S₃/A₃]] = 2[𝔽₂]` and `Ind_{A₃} 𝔽₄ = 2[S]`, with `𝔽₄` the two-dimensional simple
  `𝔽₂[A₃]`-module, while `[𝔽₂]` is not induced. The worked examples below carry out §4.6 for `S₃`.

### Dependencies

Layers 1–3. Tau Ceti: the Artin coefficient and its Möbius identities, Artin's fixed-point identity,
the two Artin `G`-sets, the comparison of permutation representations by fixed-point counts, Artin's
identity in `G₀`, the prime-part removal, the modular Artin theorem and its torsion-free form, the
dimension constraints on induced classes. Mathlib: `ArithmeticFunction.moebius`, `Subgroup.relIndex`,
`Subgroup.relIndex_dvd_card`, `Nat.factorization`, `MulAction.fixedBy`.

## Worked examples

- **Artin's identity for `S₃` over `𝔽₂`.** Artin's identity in `G₀` reads
  `6[𝔽₂] = −3[𝔽₂[S₃]] + 2 ∑_{C₂} [𝔽₂[S₃/C₂]] + 3[𝔽₂[S₃/A₃]]`. §2.5 gives
  `2[𝔽₂[S₃/C₂]] = [𝔽₂[S₃]]`, so §4.6 rewrites each term `2[𝔽₂[S₃/C₂]]` (coefficient `m_{C₂} |C₂| = 2`,
  index `[C₂ : 1] = 2`) as `[𝔽₂[S₃]]`. The three such terms cancel `−3[𝔽₂[S₃]]`, leaving
  `6[𝔽₂] = 3[𝔽₂[S₃/A₃]]`, induced from `A₃`.
- **Artin's identity for `S₃` over `𝔽₃`.** The identity has the same form; here §2.5 gives
  `3[𝔽₃[S₃/A₃]] = [𝔽₃[S₃]]`, so §4.6 rewrites the term `3[𝔽₃[S₃/A₃]]` (coefficient
  `m_{A₃} |A₃| = 3`, index `[A₃ : 1] = 3`) as `[𝔽₃[S₃]]`, leaving
  `6[𝔽₃] = −2[𝔽₃[S₃]] + 2 ∑_{C₂} [𝔽₃[S₃/C₂]]`, induced from `1` and the subgroups of order 2. In the
  basis `([𝔽₃], [sgn])` the right-hand side is `−2 (3, 3) + 6 (2, 1) = (6, 0)`.
- **The reduction of `ℤ[C₂]` at `ℓ = 2`** is §3.6's first Check: different reductions, one class.

## Downstream consumers

- [ClassFieldTheory](../../ClassFieldTheory/README.md) §5.1, the local Euler characteristic formula
  for a finite extension of `ℚ_p`: its proof in Tau Ceti descends the Euler characteristic and the
  normalized cardinality to `G₀(𝔽_ℓ[G])` by §0.4, reduces to representations induced from cyclic
  subgroups of order prime to `ℓ` by §4.7, and computes defects of unit groups and rings of integers
  by §§3.3–3.5.
- [ArithmeticGaloisDuality](../../ArithmeticGaloisDuality/README.md) §R02.4.4 uses Layers 0, 1 and 4
  for the decomposition map and the rationalized modular Artin theorem.
- [ModularCharactersAndBlocks](../ModularCharactersAndBlocks/README.md) §§1.2 and 2.1 use Layers 0, 1
  and 3: `G₀(k[G])`, its simple-class basis, restriction, induction, base change and the reduction of
  `ℤ`-forms.
- [LocalGaloisDeformationRings](../../LocalGaloisDeformationRings/README.md) §2.26.2 uses Layer 0.

## Scope and ownership

**This roadmap owns** the Grothendieck groups `G₀(k[G])` of finite groups over arbitrary fields as
the arena of induction theorems: their ring structure, restriction, induction and permutation
classes (Layers 0–1); elements of `ℓ`-power order (Layer 2); the reduction of `G`-modules modulo a
prime `ℓ` and the lattice defect (Layer 3); and Artin's induction theorem in `G₀(k[G])` in every
characteristic, including the modular Artin theorem (Layer 4). Brauer characters, the decomposition
map and the `cde` triangle, Cartan invariants of `k[G]`, blocks, and Brauer's induction theorem in
`G₀` (induction from elementary subgroups) are not part of it. It contains no Galois cohomology and
no arithmetic of fields.

**Targets of this roadmap.** Three statements of the layers above are targets here: generation of
`G₀(k[G])` by the classes of simple representations (§0.3), the dimension isomorphism for the
trivial group in every characteristic (§0.6), and Artin's induction theorem in `G₀(k[G])` over every
field (§4.5, `modularArtin_natCard_nsmul_mem_indCyclic`).

**Already in the library.** Every other statement of the layers above is a Tau Ceti declaration at
the pin, named where it is used and listed in the supplier contracts; the layers do not commission
second versions. In particular Tau Ceti has the carrier `G₀(k[G])` with its dictionary and universal
property (§§0.1–0.5), the ring, restriction, induction, projection formula, transitivity,
permutation classes, induced classes, Green-ring comparison and base change (Layer 1), all of
Layer 2, all of Layer 3, and Artin's identity in `G₀` and the modular Artin theorem with its
uniform-coefficient and torsion-free forms (§§4.1–4.4, 4.6–4.7).

**Owned elsewhere and consumed here.**
- *Exact `K₀`, the exact structure of finitely generated modules, the Jordan–Hölder coordinates and
  the simple-class basis over an Artinian ring*:
  [GrothendieckEulerForms](../../GrothendieckEulerForms/README.md) §§2.2 and 4.1, implemented in
  Tau Ceti. This roadmap specializes them to group algebras and adds the group-theoretic operations.
- *Induction of finite-dimensional representations, transitivity, the projection formula,
  permutation modules as induced modules, Artin's induction theorem in characteristic zero in
  class-function form, and the representation ring `R(G)`*:
  [InductionRestriction](../InductionRestriction/README.md) Layers 0 and 6, implemented in Tau
  Ceti. That roadmap owns induction theorems at the level of representations and class functions;
  this one owns their images in `G₀` and the positive-characteristic theorem.
- *The Green ring `TauCeti.repRing` and the determination of a representation by its character in
  characteristic zero*: Tau Ceti.
- *The decomposition map, Brauer characters and blocks*:
  [ModularCharactersAndBlocks](../ModularCharactersAndBlocks/README.md).
- *Everything Galois-cohomological, including the local Euler characteristic formula*:
  [ClassFieldTheory](../../ClassFieldTheory/README.md).

**Names used by citing roadmaps.** Other roadmaps cite the objects of this roadmap under the names
on the left; they are the Tau Ceti declarations on the right.

| Name | Tau Ceti declaration |
|---|---|
| *modRepK0 k G* | `TauCeti.ExactK0 (TauCeti.finiteModulesExactStructure k[G])` |
| *modRepK0.of V* | `TauCeti.fdRepK0RingEquiv k G (TauCeti.ExactK0.of V)` |
| *fdRepEquivalence*, *modRepK0.lift* | `TauCeti.fdRepEquivalence`, `TauCeti.liftFDRepK0` |
| *modRepK0.finrank*, *modRepK0.multiplicity*, *modRepK0.simpleBasis* | `TauCeti.finrankK0`, `TauCeti.jordanHolderCoordinate`, `TauCeti.simpleClassBasis` |
| *modRepK0.res*, *modRepK0.ind*, *modRepK0.perm* | `TauCeti.resK0RingHom`, `TauCeti.indK0`, `TauCeti.permK0` |
| *modRepK0.indClasses*, *indCyclic*, *indCyclicCoprime* | `TauCeti.indClassesK0`, `TauCeti.indCyclicK0`, `TauCeti.indCyclicCoprimeK0` |
| *modRepK0.ofRepRing*, *modRepK0.baseChange* | `TauCeti.repRingToGroupAlgebraK0`, `TauCeti.groupAlgebraBaseChangeK0` |
| *reduction*, *latticeDefect*, *artinCoeff* | `TauCeti.reduction`, `TauCeti.latticeDefect`, `Subgroup.artinCoeff` |
| *modularArtin_natCard_nsmul_mem_indCyclicCoprime* | `TauCeti.modularArtin_natCard_nsmul_mem_indCyclicCoprimeK0` |
| *modularArtin_exists_nsmul_mem_indCyclicCoprime* | `TauCeti.modularArtin_exists_nsmul_mem_indCyclicCoprimeK0` |

## Exact supplier contracts

### From Mathlib

- **Representations:** `FDRep k G`, abelian as `Action (FGModuleCat k) G`, monoidal and braided;
  `Rep k G` and
  `Rep.equivalenceModuleMonoidAlgebra` (representations are `k[G]`-modules); `Action.res`
  (restriction along a monoid homomorphism); `Representation.ofMulAction`,
  `Representation.ofDistribMulAction`, `Representation.asModule`, `Representation.character`.
  Assumed: their definitions.
- **Modules and groups:** `FGModuleCat` (essentially small, and abelian over a Noetherian ring);
  `MonoidAlgebra` with its notation `k[G]`; `Module.Finite.base_change` and `Module.Finite.of_finite`
  (finiteness of a base change and of a finite module); `QuotSMulTop` and `Submodule.torsionBy`, the
  carriers of `V/ℓV` and `V[ℓ]` (Mathlib's `ModN V ℓ` and `AddSubgroup.torsionBy V ℓ` are the same
  groups); `Finsupp.comapDistribMulAction`; `HasUniqueDiv` (torsion freeness);
  `IsPGroup`, `IsCyclic`, `Subgroup.isCyclic_of_le`, `Subgroup.zpowers`, `Subgroup.relIndex`,
  `Subgroup.relIndex_dvd_card`, `Subgroup.subgroupOfEquivOfLe`, `MulAction.fixedBy`;
  `ArithmeticFunction.moebius`, `Nat.factorization`, `Nat.Prime.coprime_iff_not_dvd`; `ExpChar`,
  `CharP`, and `sub_pow_char_pow_of_commute` (`(x − y)^(ℓⁿ) = x^(ℓⁿ) − y^(ℓⁿ)` for commuting `x`,
  `y` in a ring of characteristic `ℓ`), the input of unipotence in §2.1; Maschke's theorem
  `MonoidAlgebra.Submodule.exists_isCompl` (`Mathlib/RepresentationTheory/Maschke.lean`), the input of
  §1.7.
- **The snake lemma:** `CategoryTheory.ShortComplex.SnakeInput` and, for modules, `SnakeLemma.δ'`
  with `SnakeLemma.exact_δ'_left` and `SnakeLemma.exact_δ'_right`, the inputs of Tau Ceti's
  connecting map.
- **Finiteness:** `IsArtinianRing.of_finite`, the input of Tau Ceti's Artinian instance.

### From Tau Ceti

Paths are under `TauCeti/`. All the declarations below are proved at the pin. Unless stated, `k` is a
field and `G`, `H` finite groups in one universe.

- *Exact `K₀`* (`CategoryTheory/GrothendieckGroup/Exact.lean`, `CategoryTheory/Exact/Abelian.lean`,
  `Algebra/Category/ModuleCat/CartanMap/Basic.lean`): `TauCeti.ExactK0` with
  `TauCeti.ExactK0.of`, `TauCeti.ExactK0.of_congr`, `TauCeti.ExactK0.of_conflation`,
  `TauCeti.ExactK0.of_zero`, `TauCeti.ExactK0.of_biprod`, `TauCeti.ExactK0.closure_range_of`,
  `TauCeti.ExactK0.induction_on`, `TauCeti.ExactK0.lift` on `TauCeti.ExactK0.AdditiveInvariant`,
  `TauCeti.ExactK0.AdditiveInvariant.map_iso`, `TauCeti.ExactK0.map`, `TauCeti.ExactK0.mapEquiv`,
  `TauCeti.ExactK0.fromSplit` and `TauCeti.ExactK0.BiadditiveInvariant.bilift`; `TauCeti.SplitK0` with
  `TauCeti.SplitK0.map` and its ring structure `TauCeti.SplitK0.instCommRing`
  (`CategoryTheory/GrothendieckGroup/Split.lean`, `…/Monoidal/Basic.lean`);
  `TauCeti.ExactStructure.abelian_conflation` (the conflations of an abelian category are its short
  exact sequences); `TauCeti.finiteModulesExactStructure` with
  `TauCeti.finiteModulesExactStructure_conflation_iff` and, over a Noetherian ring,
  `TauCeti.finiteModulesExactStructure_eq_abelian`.
- *The Artinian instance* (`Algebra/MonoidAlgebra/TotalQuotient.lean`):
  `MonoidAlgebra.isArtinianRing_of_finite`, for an Artinian coefficient ring and a finite monoid.
- *The dictionary and the universal property* (`RepresentationTheory/GrothendieckGroup/GroupAlgebra/`
  `Equivalence.lean`, `Universal.lean`, `Ring.lean`): `TauCeti.fdRepEquivalence` (commutative ring
  `k`, finite monoid `G`), `TauCeti.fdRepEquivalence_functor_obj_obj`,
  `TauCeti.isConflationExact_fdRepEquivalence_functor`,
  `TauCeti.isConflationExact_fdRepEquivalence_inverse` (`k` Noetherian); `TauCeti.fdRepK0RingEquiv`
  with `TauCeti.fdRepK0RingEquiv_of`; `TauCeti.liftFDRepK0`, `TauCeti.liftFDRepK0_of`,
  `TauCeti.liftFDRepK0_unique`, `TauCeti.hom_ext_fdRep` (`k` Noetherian, `f` additive on short
  exact sequences).
- *Simple classes and dimension* (`RepresentationTheory/GrothendieckGroup/SimpleBasis.lean`,
  `Artinian.lean`, `CompositionFactors.lean`, `Finrank.lean`, `GroupAlgebra/Finrank.lean`,
  `GroupAlgebra/SimpleBasis.lean`; `RingTheory/CompositionSeries/Multiplicity.lean`):
  `TauCeti.jordanHolderCoordinate`, `TauCeti.jordanHolderCoordinate_of`,
  `TauCeti.jordanHolderMultiplicity`, `TauCeti.IsExhaustiveSimpleFamily`,
  `TauCeti.span_range_exactK0OfFamily_eq_top`, `TauCeti.simpleClassBasis`,
  `TauCeti.simpleClassBasis_apply`, `TauCeti.simpleClassBasis_repr_apply`,
  `TauCeti.finrank_exactK0_eq_card_of_isExhaustiveSimpleFamily`; for an Artinian ring
  `TauCeti.exists_isExhaustiveSimpleFamily`, the instances `TauCeti.instFreeExactK0OfIsArtinianRing`
  and `TauCeti.instFiniteExactK0OfIsArtinianRing`, `TauCeti.ExactK0.ext_jordanHolderCoordinate` and
  `TauCeti.ExactK0.of_eq_of_iff_jordanHolderMultiplicity_eq`;
  `TauCeti.isExhaustiveSimpleFamily_of_forall_isIrreducible`; `TauCeti.finrankK0`,
  `TauCeti.finrankK0_of`, `TauCeti.finrankK0Equiv` (when every simple module is isomorphic to one
  line), `TauCeti.finrankK0_fdRepK0RingEquiv_of`, `TauCeti.finrankK0_one`,
  `TauCeti.finrankK0_resK0`, `TauCeti.finrankK0_indK0`.
- *Simple representations* (`RepresentationTheory/Simple/Basic.lean`, `RepresentationTheory/OfModule.lean`):
  `FDRep.simple_iff_isIrreducible`, `TauCeti.Representation.isIrreducible_ofModule'_iff`.
- *Ring, restriction, induction, permutation classes*
  (`RepresentationTheory/GrothendieckGroup/GroupAlgebra/`: `Ring.lean`, `Restriction.lean`,
  `Induction.lean`, `Projection.lean`, `InducedClasses.lean`, `Permutation/Basic.lean`):
  `TauCeti.instCommRingExactK0MonoidAlgebra`, `TauCeti.of_asModule_mul_of_asModule`,
  `TauCeti.exactK0_one_eq_of_trivial`; `TauCeti.resK0` (for monoids and any ring `k`),
  `TauCeti.resK0RingHom`, `TauCeti.resK0_of_asModule`, `TauCeti.resK0_fdRepK0RingEquiv_of`,
  `TauCeti.resK0_id`, `TauCeti.resK0_comp`; `TauCeti.indK0` (any commutative ring `k`),
  `TauCeti.indK0_of_asModule_of_equiv`, `TauCeti.indK0_of_indFDRep`,
  `TauCeti.indK0_fdRepK0RingEquiv_of`, `TauCeti.indK0_mul_resK0`, `TauCeti.indK0_resK0`,
  `TauCeti.indK0_one`, `TauCeti.indK0_indK0`, `TauCeti.indK0_comp_indK0`,
  `TauCeti.indK0_of_trivial`, `TauCeti.indK0_of_ofMulAction_quotient`; `TauCeti.permK0`,
  `TauCeti.permK0_congr`, `TauCeti.permK0_sum`, `TauCeti.permK0_sigma`, `TauCeti.permK0_of_isEmpty`,
  `TauCeti.permK0_of_subsingleton`; `TauCeti.indClassesK0`, `TauCeti.indCyclicK0`,
  `TauCeti.indCyclicCoprimeK0`, `TauCeti.mul_mem_indClassesK0`, `TauCeti.indK0_mem_indCyclicK0`.
- *Green ring and base change* (`RepresentationTheory/RepresentationRing/`,
  `RepresentationTheory/GrothendieckGroup/GroupAlgebra/GreenRing.lean`, `GroupAlgebra/BaseChange.lean`):
  `TauCeti.repRing` (split `K₀` of `FDRep k G`, which is essentially small by the instance of
  `CategoryTheory/Action/EssentiallySmall.lean`), `TauCeti.repRingRes`, `TauCeti.repRingInd`;
  `TauCeti.repRingToGroupAlgebraK0`
  with `TauCeti.repRingToGroupAlgebraK0_of`, `TauCeti.repRingToGroupAlgebraK0_apply`,
  `TauCeti.repRingToGroupAlgebraK0_surjective`, `TauCeti.repRingToGroupAlgebraK0_repRingRes`,
  `TauCeti.repRingToGroupAlgebraK0_repRingInd`, `TauCeti.repRingToGroupAlgebraK0_bijective`
  (`|G|` invertible in `k`); `TauCeti.groupAlgebraBaseChangeK0` with
  `TauCeti.groupAlgebraBaseChangeK0_of_asModule`, `TauCeti.groupAlgebraBaseChangeK0_id`,
  `TauCeti.groupAlgebraBaseChangeK0_comp`, `TauCeti.groupAlgebraBaseChangeK0_resK0`,
  `TauCeti.groupAlgebraBaseChangeK0_indK0`, `TauCeti.groupAlgebraBaseChangeK0_permK0`.
- *Induction of representations* (`RepresentationTheory/Induction/`): `TauCeti.indFDRep`,
  `TauCeti.indFDRepFunctor`, `TauCeti.finrank_indFDRep`, `TauCeti.Rep.indSubtypeEquivPi`,
  `TauCeti.indFDRepProjection`, `TauCeti.indProjection`, `TauCeti.Rep.indFunctorCompIso`,
  `TauCeti.indFDRepForgetIso`, `Subgroup.resFDRep`, `TauCeti.indTrivialIso`,
  `TauCeti.indResProjection`, `TauCeti.char_ofMulAction`.
- *Elements of `ℓ`-power order* (`RepresentationTheory/Unipotent/PowerOrder.lean`,
  `LinearAlgebra/Eigenspace/JointEigenvector/Kolchin.lean`,
  `RepresentationTheory/GrothendieckGroup/GroupAlgebra/PowerOrder.lean`, `GroupAlgebra/PGroup.lean`,
  `GroupAlgebra/Permutation/PrimePower.lean`, `GroupTheory/SpecificGroups/Cyclic/CoprimePart.lean`,
  `RepresentationTheory/Induction/Artin/Modular.lean`):
  `Representation.exists_common_fixed_vector_of_isUnipotent` (Kolchin, over any field),
  `Representation.exists_common_fixed_vector_of_forall_pow_expChar_pow_eq_one`,
  `Representation.IsIrreducible.eq_trivial_of_forall_pow_expChar_pow_eq_one` (`ExpChar k ℓ`);
  `TauCeti.nonempty_linearEquiv_trivial_of_forall_pow_eq_one`,
  `TauCeti.exactK0_asModule_eq_finrank_nsmul_of_forall_pow_eq_one`,
  `TauCeti.eq_finrankK0_smul_trivial_of_isPGroup`, `TauCeti.pGroupFinrankK0Equiv`,
  `TauCeti.indK0_of_trivial_eq_relIndex_nsmul`, `TauCeti.indK0_resK0_eq_relIndex_nsmul` (`[Fact ℓ.Prime]
  [CharP k ℓ]`); `TauCeti.exists_coprimePart_of_isCyclic` and
  `TauCeti.zpowers_pFreePart_eq_zpowers_pow_ordProj` (`ℓ` prime).
- *Reduction and the lattice defect* (`RepresentationTheory/TorsionBy.lean`,
  `RepresentationTheory/QuotSMulTop.lean`, `RepresentationTheory/Reduction.lean`,
  `RepresentationTheory/BaseChange.lean`, `LinearAlgebra/TensorProduct/Quotient.lean`,
  `RepresentationTheory/GrothendieckGroup/GroupAlgebra/LatticeDefect/`): `Representation.baseChange`
  (scalar extension `A ⊗_R V` of a representation over `R`, for an `R`-algebra `A`),
  `Representation.torsionBy`,
  `Representation.quotSMulTop`; `TauCeti.reduction`, `TauCeti.reductionMap`,
  `TauCeti.reductionMap_id`, `TauCeti.reductionMap_comp`, `TauCeti.epi_reductionMap`,
  `TauCeti.exact_reductionMap`; `TauCeti.finite_baseChange_of_finite_quotSMulTop`;
  `TauCeti.reductionK0`, `TauCeti.fdRepK0RingEquiv_of_reduction`,
  `TauCeti.reductionK0_restrictScalarsInt`; `TauCeti.latticeDefect` (over any commutative ring `k`
  and monoid `G`), `TauCeti.latticeDefect_eq_reductionK0_sub`,
  `TauCeti.latticeDefect_eq_fdRepK0RingEquiv_reduction_sub`, `TauCeti.latticeDefect_eq_reductionK0`
  (`CharP k ℓ`), `TauCeti.latticeDefect_add_of_exact`, `TauCeti.latticeDefect_eq_zero_of_finite`,
  `TauCeti.latticeDefect_eq_zero_of_bijective_zsmul`, `TauCeti.latticeDefect_eq_of_finiteIndex`,
  `TauCeti.latticeDefect_eq_of_bijective_zsmul_quotient` (`[Fact ℓ.Prime]` except for the vanishing
  on modules where multiplication by `ℓ` is bijective; no hypothesis on the characteristic); `TauCeti.reductionK0_eq_of_nonempty_equiv_baseChange_rat` (lattices over any
  monoid, any field); `TauCeti.baseChangeOfMulActionEquiv`, `TauCeti.baseChangeComapEquiv`,
  `TauCeti.reductionK0_finsupp_int`, `TauCeti.latticeDefect_finsupp_int`.
- *Artin's identity and the modular Artin theorem* (`GroupTheory/ArtinCoefficient.lean`,
  `RepresentationTheory/CharacterTable/FixedPointCount.lean`,
  `RepresentationTheory/CharacterTable/Determined.lean`, `RepresentationTheory/Induction/Artin/`,
  `RepresentationTheory/GrothendieckGroup/GroupAlgebra/Artin.lean`, `Permutation/FixedPointCount.lean`,
  `PrimePart.lean`, `PGroup.lean`): `Subgroup.artinCoeff`, `Subgroup.artinCoeff_def`,
  `Subgroup.artinCoeff_eq_zero_of_not_isCyclic`, `Subgroup.sum_moebius_index`,
  `TauCeti.sum_moebius_relIndex`, `TauCeti.sum_artinCoeff_of_mem`,
  `TauCeti.sum_artinCoeff_mul_card_fixedBy`; `TauCeti.nonempty_equiv_ofMulAction_iff_forall_natCard_fixedBy_eq`
  (characteristic zero), `Representation.nonempty_equiv_of_character_eq`,
  `FDRep.nonempty_iso_of_character_eq`; `TauCeti.permK0_eq_of_forall_natCard_fixedBy_eq`;
  `TauCeti.ArtinPositiveSet`, `TauCeti.ArtinNegativeSet`;
  `TauCeti.natCard_nsmul_one_eq_sum_artinCoeff_indK0`,
  `TauCeti.natCard_nsmul_eq_sum_artinCoeff_indK0_resK0`;
  `TauCeti.exists_linearCombination_indK0_resK0_eq_natCard_nsmul`,
  `TauCeti.modularArtin_natCard_nsmul_mem_indCyclicCoprimeK0`,
  `TauCeti.modularArtin_exists_nsmul_mem_indCyclicCoprimeK0`,
  `TauCeti.eq_of_comp_indK0_eq_of_cyclic_coprime` (`[Fact ℓ.Prime] [CharP k ℓ]`);
  `Subgroup.ordProj_dvd_finrankK0_indK0`, `TauCeti.ordProj_dvd_of_nsmul_one_mem_indClassesK0`,
  `TauCeti.nsmul_one_mem_range_indK0_bot_iff_of_isPGroup`;
  `TauCeti.ClassFunction.natCard_nsmul_one_mem_indVirtualCharacters_isCyclic` and
  `TauCeti.ClassFunction.indVirtualCharacters` (Artin's theorem for class functions).

## References

- J.-P. Serre, *Linear Representations of Finite Groups*, Springer GTM 42 (1977): §9.2 Theorem 17
  and §12.5 Theorem 26 for Artin's theorem in characteristic zero; Part III (§§14–18: `R_k(G)`,
  `P_k(G)`, the `cde` triangle, the surjectivity of the decomposition map in §16.1 Theorem 33) as
  background, and as the classical route through Brauer characters that this roadmap does not take.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed., Springer (2008),
  §VII.3: (7.3.1) the Euler characteristic formula, (7.3.2) Serre's equivariant theorem, (7.3.3)
  the finite-index lemma, (7.3.4) the spanning lemma.
- J. S. Milne, *Arithmetic Duality Theorems*, 2nd ed. (2006), Chapter I §2: Theorem 2.8, Lemma 2.10
  (the spanning lemma) and Lemma 2.12 (the lattice lemma, for `ℤ_p[H]`-modules).
