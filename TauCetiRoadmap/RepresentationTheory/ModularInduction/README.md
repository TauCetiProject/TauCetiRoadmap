# Roadmap: induction theorems in Grothendieck groups of modular representations

Let `G` be a finite group and `k` a field. The Grothendieck group `G₀(k[G])` of finitely generated
`k[G]`-modules modulo short exact sequences (Serre's `R_k(G)`) is where a statement about every
finite-dimensional representation is proved by checking it on a generating family. The standard
instance is Tate's local Euler–Poincaré characteristic formula: both sides are additive in the
coefficient module, so they factor through `G₀(𝔽_ℓ[Gal(L/K)])`, and the proof (NSW (7.3.1), Milne
ADT I Theorem 2.8) reduces to modules induced from cyclic subgroups of order prime to `ℓ` by the
**modular Artin theorem** (NSW (7.3.4), Milne ADT I Lemma 2.10): if `k` has characteristic `ℓ`, a
positive multiple of every class in `G₀(k[G])` is a sum of classes induced from cyclic subgroups of
order prime to `ℓ`. When `ℓ` divides `|G|`, short exact sequences of representations need not split,
and `G₀(k[G])` is not the representation ring of ordinary character theory.

The published proofs deduce the modular Artin theorem from Artin's theorem in characteristic zero
and the surjectivity of Brauer's decomposition map (Serre, *Linear Representations*, §16.1
Theorem 33), which is where Brauer characters enter. This roadmap proves it without them. Artin's
identity `|G| · 1 = ∑_C m_C |C| · Ind_C^G 1` is an identity between *permutation* characters. Two
permutation lattices with the same character become isomorphic after tensoring with `ℚ`, so their
reductions modulo `ℓ` have the same class in `G₀` (a snake-lemma argument, NSW (7.3.3)); the
projection formula spreads the identity from the trivial module to all of `G₀`; and the `ℓ`-part of
each cyclic subgroup is removed because an element of `ℓ`-power order acts unipotently in
characteristic `ℓ`. For the `ℓ′`-part `D` of a cyclic `C`, this gives
`[C : D] · Ind_C^G Res_C x = Ind_D^G Res_D x`, and `[C : D]` divides the coefficient `m_C |C|`; so
`|G|` times every class is induced from cyclic subgroups of order prime to `ℓ`, the multiplier of
characteristic zero.

Mathlib has the categories `FDRep k G` and `Rep k G`, the equivalence of representations with
modules over the group algebra, and the snake lemma, but no Grothendieck group of representations
and no modular representation theory. Tau Ceti has the general machinery (exact `K₀`, the
simple-class basis over an Artinian ring, the Green ring, induction of finite-dimensional
representations, the projection formula, Artin's theorem in characteristic zero). What is missing,
and what this roadmap builds, is `G₀(k[G])` as a ring with restriction and induction, the reduction
of `G`-modules modulo `ℓ` with values in it, and Artin's induction theorem in it.

**Scope.** Grothendieck groups `G₀(k[G])` of finite groups over arbitrary fields, with their ring
structure, restriction, induction and permutation classes; the reduction of `G`-modules modulo a
prime `ℓ` in these groups; and Artin's induction theorem in them, in every characteristic. Brauer
characters, the decomposition map and the `cde` triangle, Cartan invariants of `k[G]`, blocks, and
Brauer's induction theorem in `G₀` (induction from elementary subgroups) are not part of this
roadmap.

**Consumer.** [ClassFieldTheory](../../ClassFieldTheory/README.md) consumes the export
`modularArtin_exists_nsmul_mem_indCyclicCoprime`, together with Layer 0 (`modRepK0` and its
universal property, through which the local Euler characteristic and `‖#A‖` descend to
`G₀(𝔽_ℓ[Gal(L/K)])`) and Layer 3 (the defects of the unit groups of `L`), in its Layer 5 proof of
the local Euler characteristic formula. Everything Galois-cohomological stays in ClassFieldTheory:
this roadmap contains no Galois cohomology and no arithmetic of fields.

Suggested home: `TauCeti/RepresentationTheory/GrothendieckGroup/GroupAlgebra/` for Layers 0–3,
beside the simple-class basis, and `TauCeti/RepresentationTheory/Induction/Artin/Modular.lean` for
Layer 4, beside Artin's theorem in characteristic zero.

## Dependencies and boundaries

- **[Grothendieck groups, Cartan maps, and Euler forms](../../GrothendieckEulerForms/README.md)**
  supplies, landed in Tau Ceti, exact `K₀` of a Quillen exact category, the exact structure of
  finitely generated modules, and the Jordan–Hölder coordinates and simple-class basis over an
  Artinian ring. It owns the general theory; this roadmap specializes it to group algebras and adds
  the group-theoretic operations, restating none of it.
- **[Induction, restriction, and Mackey theory](../InductionRestriction/README.md)** supplies,
  landed, induction of finite-dimensional representations, transitivity, the projection formula,
  permutation modules as induced modules, Artin's induction theorem in characteristic zero in
  class-function form, and the determination of a representation by its character in
  characteristic zero. It owns induction theorems at the level of representations and class
  functions; this roadmap owns their images in `G₀` and the positive-characteristic theorem.
- **[Character theory](../CharacterTheory/README.md)** supplies, landed, the Green ring
  `TauCeti.repRing` (split `K₀` of `FDRep k G`), which Layer 1 compares with `G₀`.
- **ClassFieldTheory** is the consumer described above.

## Standing conventions

- **Coefficients and groups.** `k` is a field and `G` a finite group (`[Field k] [Group G]
  [Finite G]`), in one universe `u`, as in Tau Ceti's `TauCeti.indFDRepProjection`; for `k = ZMod ℓ`
  this means `G : Type`. A subgroup `C : Subgroup G` is used as the group `↥C`. A prime `ℓ` enters
  as `(ℓ : ℕ) [Fact ℓ.Prime] [CharP k ℓ]` exactly where the characteristic matters: Layers 2 and 3
  and the second half of Layer 4. Every other statement is made over an arbitrary field.
- **`G₀` is exact `K₀` of finitely generated modules.** `modRepK0 k G` is
  `TauCeti.ExactK0 (TauCeti.finiteModulesExactStructure (MonoidAlgebra k G))`: finitely generated
  `k[G]`-modules, which for finite `G` are the finite-dimensional and the finite-length ones, with
  `[M₂] = [M₁] + [M₃]` for every short exact sequence. It is not the Green ring
  `TauCeti.repRing k G`, which imposes only the split relations; `ofRepRing` compares the two.
- **Representations enter through the dictionary.** `fdRepEquivalence k G :
  FDRep k G ≌ FGModuleCat (MonoidAlgebra k G)`, `V ↦ V.ρ.asModule`, and `modRepK0.of V` is the class
  of its image. The relations used are the short exact sequences of the abelian category
  `FDRep k G`. Operations are stated on `FDRep` objects, where Tau Ceti's induction lives.
- **Induction from subgroups, restriction along homomorphisms.** `modRepK0.ind S` for
  `S : Subgroup G` is Tau Ceti's `TauCeti.indFDRep` (along `S.subtype`); `modRepK0.res φ` for any
  `φ : H →* G` is Mathlib's `Action.res`, inflation included. A subgroup of a subgroup is
  `S.subgroupOf T`, identified with `S` by `Subgroup.subgroupOfEquivOfLe`.
- **Permutation modules.** `modRepK0.perm k G X` is the class of `Representation.ofMulAction k G X`
  for a finite `G`-set `X`. Cosets are Mathlib's left cosets `G ⧸ S`, with the orientation of
  `TauCeti.indTrivialIso`. Fixed points are `MulAction.fixedBy X g`, counted by `Nat.card`.
- **`G`-modules and lattices.** A `G`-module is `V` with `[AddCommGroup V] [DistribMulAction G V]`:
  a `ℤ[G]`-module for the same finite group `G`, neither localized nor completed at `ℓ`, whose
  `ℤ`-module structure is the canonical one. It is stated unbundled rather than as `Rep ℤ G`
  because the carrier of `Rep ℤ G` has its own `Module ℤ` field, not definitionally the canonical
  one, and `k ⊗_ℤ V` must be formed with one. `V/ℓV` is Mathlib's `ModN V ℓ`, `V[ℓ]` is Mathlib's
  `AddSubgroup.torsionBy V ℓ`, and a lattice is a `G`-module with `[Module.Free ℤ V]`
  `[Module.Finite ℤ V]`. The **reduction** of `V` to `k` is `k ⊗_ℤ V` with the representation
  `Representation.baseChange k (Representation.ofDistribMulAction ℤ G V)`; in characteristic `ℓ`
  it is `k ⊗_{𝔽_ℓ} (V/ℓV)`. The **rationalization** is `ℚ ⊗_ℤ V`, the same construction at `ℚ`.
- **Multiples and coprimality.** "Order prime to `ℓ`" is `¬ ℓ ∣ Nat.card C`; the `ℓ`-part `|C|_ℓ`
  of `|C|` is `ℓ ^ (Nat.card C).factorization ℓ`; multiples are the `ℕ`- or `ℤ`-scalar
  multiplication of the additive group; sums over subgroups are `∑ᶠ` over the finite type
  `Subgroup G`.
- **Induced subgroups.** `modRepK0.indClasses k G P` is the supremum of the ranges of
  `modRepK0.ind C` over the subgroups `C` with `P C`, mirroring Tau Ceti's
  `TauCeti.ClassFunction.indVirtualCharacters`; `indCyclic` and `indCyclicCoprime ℓ` are its two
  instances. It is induced from all of `G₀(k[C])`, not only from permutation modules: for
  `G = ℤ/7` and `ℓ = 2` the permutation modules span a subgroup of rank 2 in a `G₀` of rank 3.

## What Mathlib already has (consume)

- **Representations:** `FDRep k G` (`RepresentationTheory/FDRep.lean`), abelian as
  `Action (FGModuleCat k) G` (`CategoryTheory/Action/Limits.lean`, `Algebra/Category/FGModuleCat/
  Abelian.lean`), monoidal and braided; `Rep k G` and `Rep.equivalenceModuleMonoidAlgebra`
  (`RepresentationTheory/Rep/`); `Action.res`; `Representation.ofMulAction`,
  `Representation.ofDistribMulAction`, `Representation.asModule`
  (`RepresentationTheory/Basic.lean`); `Representation.character`.
- **Modules:** `FGModuleCat` (essentially small, abelian over a Noetherian ring);
  `IsArtinianRing.of_finite`; `Module.Finite.base_change`, `Module.Finite.of_finite`; `ModN`
  (`LinearAlgebra/FreeModule/ModN.lean`); `AddSubgroup.torsionBy`, `Submodule.torsionBy`
  (`Algebra/Module/Torsion/Basic.lean`); `Finsupp.comapDistribMulAction`.
- **The snake lemma:** `CategoryTheory.ShortComplex.SnakeInput`
  (`Algebra/Homology/ShortComplex/SnakeLemma.lean`) and, for modules, `SnakeLemma.δ'` with
  `SnakeLemma.exact_δ'_left`, `SnakeLemma.exact_δ'_right` (`Algebra/Module/SnakeLemma.lean`).
- **Groups and arithmetic:** `IsPGroup` (`GroupTheory/PGroup.lean`); `IsCyclic`,
  `Subgroup.isCyclic_of_le`, `Subgroup.zpowers`; `Subgroup.relIndex`, `Subgroup.relIndex_dvd_card`;
  `MulAction.fixedBy`; `ArithmeticFunction.moebius`;
  `Nat.factorization`; `sub_pow_char_pow_of_commute` (`Algebra/CharP/Lemmas.lean`); Maschke
  (`RepresentationTheory/Maschke.lean`).

## What Tau Ceti already has (consume)

- **Exact and split `K₀`:** `TauCeti.ExactK0` with `of`, `of_conflation`, `induction_on`, `lift`
  (`AdditiveInvariant`), `map`, `mapEquiv`, `fromSplit`, `BiadditiveInvariant.bilift`
  (`CategoryTheory/GrothendieckGroup/Exact.lean`); `TauCeti.SplitK0` with `SplitK0.map` and the
  ring `SplitK0.instCommRing` (`.../Split.lean`, `.../Monoidal.lean`).
- **Finitely generated modules:** `TauCeti.finiteModulesExactStructure` and
  `finiteModulesExactStructure_conflation_iff` (`Algebra/Category/ModuleCat/CartanMap/Basic.lean`);
  `TauCeti.jordanHolderCoordinate`, `TauCeti.simpleClassBasis`,
  `TauCeti.span_range_exactK0OfFamily_eq_top` (`RepresentationTheory/GrothendieckGroup/
  SimpleBasis.lean`).
- **The Green ring:** `TauCeti.repRing k G = SplitK0 (FDRep k G)` (`RepresentationRing/Basic.lean`),
  with `FDRep k G` essentially small (`CategoryTheory/Action/EssentiallySmall.lean`).
- **Induction:** `TauCeti.indFDRep`, the additive functor `TauCeti.indFDRepFunctor`,
  `TauCeti.finrank_indFDRep`, the coset model `TauCeti.Rep.indSubtypeEquivPi`
  (`Induction/FiniteDimensional/Basic.lean`); `TauCeti.indFDRepProjection`
  (`.../FiniteDimensional/Projection.lean`); `TauCeti.indProjection`; transitivity
  `TauCeti.Rep.indFunctorCompIso` (`Induction/Transitivity.lean`); `TauCeti.resFDRep`;
  `TauCeti.indTrivialIso`, `TauCeti.indResProjection`, `TauCeti.char_ofMulAction`
  (`Induction/Permutation.lean`).
- **Characteristic zero:**
  `TauCeti.ClassFunction.natCard_nsmul_one_mem_indVirtualCharacters_isCyclic`
  (`Induction/Artin/Basic.lean`), whose Möbius coefficients are private;
  `Representation.nonempty_equiv_of_character_eq` and `FDRep.nonempty_iso_of_character_eq`
  (`CharacterTable/Determined.lean`).
- **Base change and unipotence:** `Representation.baseChange`
  (`RepresentationTheory/BaseChange.lean`); Kolchin's theorem
  `Representation.exists_common_fixed_vector_of_isUnipotent`
  (`LinearAlgebra/Eigenspace/JointEigenvector/Kolchin.lean`).

`Suggested.lean` imports the Tau Ceti modules it uses and pins the load-bearing objects (`modRepK0`,
`fdRepEquivalence`, `modRepK0.of`, `lift`, the ring structure, `res`, `ind`, `perm`, `indClasses`,
`torsionByDistribMulAction`, `reduction`, `latticeDefect`, `artinCoeff`) and the milestones below as
`sorry`-targets. It closes `isArtinianRing_monoidAlgebra`, `nonempty_equiv_ofMulAction_rat` (the
characteristic-zero input applied as stated), Step 4 of Layer 4 from Artin's identity in `G₀`, the
projection formula and Layer 2, and the export from Step 4.

---

## The build, in layers

### Layer 0: the Grothendieck group of a group algebra

- **Artinian group algebra.** The instance `isArtinianRing_monoidAlgebra`:
  `IsArtinianRing (MonoidAlgebra k G)` by `IsArtinianRing.of_finite`, the hypothesis of the
  simple-class basis.
- **The dictionary.** `fdRepEquivalence k G : FDRep k G ≌ FGModuleCat (MonoidAlgebra k G)`, the
  restriction of `Rep.equivalenceModuleMonoidAlgebra` to finite objects (a `k[G]`-module is finitely
  generated exactly when it is finite-dimensional over `k`), with its object formula
  `V ↦ V.ρ.asModule`. It is an equivalence of abelian categories, so it carries the short exact
  sequences of `FDRep k G` to the conflations of `finiteModulesExactStructure`
  (`finiteModulesExactStructure_conflation_iff`) and back; record both directions.
- **`G₀` and classes.** `modRepK0 k G` with its additive group; `modRepK0.of`; `of_congr` for
  isomorphic representations; `of_shortExact`; `of_zero` and additivity on biproducts; generation
  by all classes (`induction_on`) and by the classes of simple representations
  (`closure_of_simple`, from `span_range_exactK0OfFamily_eq_top`).
- **The universal property.** `modRepK0.lift f hiso hses : modRepK0 k G →+ A` for a function
  `f : FDRep k G → A` invariant under isomorphism and additive on short exact sequences, with
  `lift_of` and uniqueness, from `TauCeti.ExactK0.lift` through the dictionary. ClassFieldTheory
  descends its local invariants to `G₀` in this form.
- **The simple-class basis.** `modRepK0.multiplicity S`, Tau Ceti's Jordan–Hölder coordinate
  through the dictionary, with `multiplicity_of` (the composition multiplicity of `S` in `V`) and
  `ext_multiplicity` (an element is determined by its coordinates at simple representations);
  `modRepK0.simpleBasis`, `TauCeti.simpleClassBasis` for a set of representatives of the simple
  `k[G]`-modules (finitely many: each is a quotient of `k[G]`); hence `Module.Free ℤ` and
  `Module.Finite ℤ`, of rank the number of isomorphism classes of simple `k[G]`-modules.
- **Dimension.** `modRepK0.finrank : modRepK0 k G →+ ℤ` with `finrank_of`; for the trivial group
  it is an isomorphism onto `ℤ`.

### Layer 1: ring structure, restriction, induction, and permutation classes

- **The ring.** `mulHom` from `ExactK0.BiadditiveInvariant.bilift` (over a field `V ⊗ −` and
  `− ⊗ W` are exact); the `Mul`, `One` and `CommRing` instances on the additive group of Layer 0,
  built as `TauCeti.SplitK0.instCommRing` is (associator, unitors, braiding of `FDRep k G`);
  `of_tensor`; `1 = of (𝟙_ (FDRep k G))`.
- **Restriction.** `res φ : modRepK0 k G →+* modRepK0 k H` for `φ : H →* G`, exact because it does
  not change the underlying spaces; `res_of`, `res_id`, `res_comp`.
- **Induction.** `ind S : modRepK0 k S →+ modRepK0 k G` with `ind_of`. Induction is exact: the
  coset model `TauCeti.Rep.indSubtypeEquivPi` identifies `Ind_S^G A` naturally with a finite product
  of copies of `A` as a vector space. `ind` is not a ring homomorphism.
- **The projection formula.** `ind_mul_res : ind S (y * res S.subtype x) = ind S y * x`, from
  `TauCeti.indFDRepProjection` on classes and generation. Consequently `indClasses k G P` is an
  ideal of the ring `modRepK0 k G` (`mul_mem_indClasses`).
- **Transitivity.** `ind_ind`: for `h : S ≤ T`, `ind T (ind (S.subgroupOf T) y)` equals
  `ind S (res (Subgroup.subgroupOfEquivOfLe h).symm.toMonoidHom y)`, from
  `TauCeti.Rep.indFunctorCompIso` through `TauCeti.indFDRepForgetIso`.
- **Permutation classes.** `perm k G X`; invariance under `G`-equivariant bijections; `perm_sum`
  for disjoint unions; the class of a one-point set is `1`; `ind_one : ind S 1 = perm k G (G ⧸ S)`
  (`TauCeti.indTrivialIso`); `ind_perm_quotient`: for `D ≤ C`,
  `ind C (perm k C (C ⧸ D.subgroupOf C)) = perm k G (G ⧸ D)`, from transitivity and `ind_one`.
- **The Green ring.** `ofRepRing : TauCeti.repRing k G →+* modRepK0 k G`, `SplitK0.map` along the
  dictionary followed by `ExactK0.fromSplit`, with `ofRepRing_of`, surjective, compatible with
  Tau Ceti's `repRingInd` and `repRingRes`, and bijective when `(Nat.card G : k) ≠ 0`
  (`ofRepRing_bijective`): by Maschke every short exact sequence then splits.
- **Base change.** For a field extension `k → k'`, the ring homomorphism
  `modRepK0.baseChange k' : modRepK0 k G →+* modRepK0 k' G`, `[V] ↦ [k' ⊗_k V]`
  (`Representation.baseChange`, exact because `k'` is flat over `k`), commuting with `res`, `ind`
  and `perm`.

### Layer 2: elements of `ℓ`-power order

In characteristic `ℓ`, an element acting with `ℓ`-power order acts unipotently, and every
composition factor of such a representation is trivial.

- **A fixed vector.** `exists_fixed_vector_of_pow_eq_one`: if `ρ g ^ ℓ ^ n = 1` for every `g` (with
  `n` depending on `g`) and `V` is nonzero and finite-dimensional, some nonzero vector is fixed.
  `(ρ g - 1) ^ ℓ ^ n = ρ g ^ ℓ ^ n - 1 = 0` by `sub_pow_char_pow_of_commute` (`Module.End k V` has
  characteristic `ℓ`), so each `ρ g` is unipotent and Kolchin's theorem applies; `k` may be
  infinite. In particular a simple representation on which every element acts with `ℓ`-power order
  is the trivial one-dimensional representation.
- **Trivial composition factors.** `modRepK0.of_eq_finrank_nsmul_one`: if `V.ρ (g ^ ℓ ^ n) = 1`
  for every `g`, then `of V = finrank k V • 1`, by induction along a composition series (the
  hypothesis passes to subquotients).
- **`ℓ`-groups.** `eq_finrank_nsmul_one_of_isPGroup`: for an `ℓ`-group `P` every class is
  `finrank x • 1`, so `finrank : modRepK0 k P ≃+ ℤ`.
- **The `ℓ′`-part of a cyclic subgroup.** `exists_coprimePart_of_isCyclic`: a cyclic `C` has a
  subgroup `D ≤ C` of order prime to `ℓ` with `c ^ ℓ ^ n ∈ D` for every `c ∈ C`, namely the
  subgroup generated by `g ^ (ℓ-part of |C|)` for a generator `g`; `D.relIndex C` is the `ℓ`-part
  of `|C|`, and `D` is normal in `C`.
- **Permutation classes along an `ℓ`-power quotient.** `relIndex_nsmul_ind_one`: for `D ≤ C` with
  `D.subgroupOf C` normal and `c ^ ℓ ^ n ∈ D` for every `c ∈ C`,
  `D.relIndex C • ind C 1 = ind D 1`. Every element of `C` acts on `k[C/D]` with `ℓ`-power order,
  so `[k[C/D]] = [C : D] · 1` in `G₀(k[C])`; apply `ind C` and `ind_perm_quotient`.

### Layer 3: reduction of `G`-modules modulo `ℓ`

This is NSW (7.3.3) in `G₀`, together with its consequence for lattices: the integral `ℤ[G]`
analogue of Milne ADT I Lemma 2.12, proved by the same snake-lemma argument (Milne states the lemma
for finitely generated `ℤ_p[H]`-modules with isomorphic `ℚ_p`-rationalizations). It is consumed by
Layer 4 for permutation lattices and by ClassFieldTheory for the unit groups of local fields.

- **Torsion and reduction.** `torsionByDistribMulAction G V n`, the action of `G` on `V[n]`;
  `reduction k G V : FDRep k G` for `k ⊗_ℤ V` finite-dimensional, functorial in equivariant
  additive maps and right exact; `finite_baseChange_of_finite_modN`: in characteristic `ℓ`,
  `k ⊗_ℤ V ≅ k ⊗_{ZMod ℓ} ModN V ℓ`, so finiteness of `V/ℓV` suffices.
- **The lattice defect.** `latticeDefect k G ℓ V = [k ⊗_ℤ V] - [k ⊗_ℤ V[ℓ]]` for `V/ℓV` and `V[ℓ]`
  finite. At `k = ZMod ℓ` it is `[V/ℓV] - [V[ℓ]]`; for a lattice it is `of (reduction k G V)`.
- **Additivity.** `latticeDefect_add_of_exact`: for `0 → A → B → C → 0` exact with equivariant
  maps, `latticeDefect B = latticeDefect A + latticeDefect C`. The snake lemma for multiplication
  by `ℓ` gives the exact sequence
  `0 → A[ℓ] → B[ℓ] → C[ℓ] → A/ℓA → B/ℓB → C/ℓC → 0` of `G`-modules killed by `ℓ` (the connecting
  map is equivariant by naturality); `k ⊗_ℤ −` is exact on modules killed by `ℓ`, where it is
  `k ⊗_{𝔽_ℓ} −`; and the alternating sum of classes along an exact sequence vanishes (split it
  into short exact sequences and use Layer 0).
- **Finite modules.** `latticeDefect_eq_zero_of_finite`: a finite `G`-module has a composition
  series as a `ℤ[G]`-module whose factors are simple, hence elementary abelian `p`-groups; a
  factor with `p ≠ ℓ` has `S/ℓS = 0 = S[ℓ]`, one with `p = ℓ` has `S/ℓS = S = S[ℓ]`; conclude by
  additivity.
- **Finite index.** `latticeDefect_eq_of_finiteIndex`: an injective equivariant `f : W →+[G] V`
  with finite cokernel gives `latticeDefect W = latticeDefect V`, by additivity and the previous
  item. ClassFieldTheory applies it to the principal unit groups `U^n_L ⊆ U^1_L`.
- **Lattices.** `of_reduction_eq_of_nonempty_equiv`: two lattices with isomorphic rationalizations
  have the same reduction class, in every characteristic. In characteristic zero, base change the
  rational isomorphism to `k`. In characteristic `ℓ`, clear denominators: some `N • φ` maps `V`
  injectively into `W` (both are finitely generated), with finite cokernel since the ranks agree;
  lattices have `V[ℓ] = 0`, so the finite-index item applies. Only `ℤ`-lattices are needed here,
  not lattices over a general discrete valuation ring.
- **Permutation lattices.** `ℤ[X]` is `X →₀ ℤ` with `Finsupp.comapDistribMulAction`; record
  `baseChangeOfMulActionEquiv`, `A ⊗_ℤ ℤ[X] ≅ Representation.ofMulAction A G X` for every
  commutative ring `A`, so the reduction of `ℤ[X]` is `k[X]` and its rationalization is `ℚ[X]`.

### Layer 4: Artin's identity and the modular Artin theorem

The proof has four steps: Artin's identity among permutation characters (Step 1), transferred to
`G₀` by lattices (Step 2), spread to all classes by the projection formula (Step 3), with the
`ℓ`-parts of the cyclic subgroups removed by Layer 2 (Step 4).

- **The Artin coefficient.** `artinCoeff C = ∑ᶠ` over cyclic `D ≥ C` of `μ([D : C])`, which is
  `0` unless `C` is cyclic (a subgroup of a cyclic group is cyclic). It agrees with the
  incidence-algebra Möbius sum over the poset of cyclic subgroups used privately in Tau Ceti's
  Artin theorem: the interval `[C, D]` of subgroups of a cyclic `D` is the divisor lattice of
  `[D : C]`.
- **Step 1: Artin's identity for fixed points.** `sum_artinCoeff_mul_card_fixedBy`: for every
  `g : G`, `∑ᶠ C, m_C · |C| · #(G/C)^g = |G|` in `ℤ`. Proof: `|C| · #(G/C)^g` counts the `x` with
  `x⁻¹ g x ∈ C`; exchange the sums; for `y = x⁻¹ g x` the sum of `μ([D : C])` over
  `⟨y⟩ ≤ C ≤ D` is `1` if `D = ⟨y⟩` and `0` otherwise. This is the pointwise identity inside the
  proof of `TauCeti.ClassFunction.natCard_nsmul_one_mem_indVirtualCharacters_isCyclic`, stated for
  fixed points in `ℤ` because Step 2 needs the integers, not their images in a field.
- **Step 2, rational half.** `nonempty_equiv_ofMulAction_rat`: finite `G`-sets with the same
  fixed-point counts have isomorphic permutation representations over `ℚ`, from
  `TauCeti.char_ofMulAction` and `Representation.nonempty_equiv_of_character_eq`.
- **Step 2.** `modRepK0.perm_eq_of_card_fixedBy_eq`: finite `G`-sets with the same fixed-point
  counts have the same permutation class over every field. In characteristic zero this is the
  character theorem over `k` itself; in characteristic `ℓ` apply `of_reduction_eq_of_nonempty_equiv`
  to `ℤ[X]` and `ℤ[Y]` with the rational half.
- **Artin's identity in `G₀`.** `natCard_nsmul_one_eq_sum_artinCoeff`:
  `|G| • 1 = ∑ᶠ C, (m_C · |C|) • ind C 1`, in every characteristic. Take `X` the disjoint union of
  `m_C |C|` copies of `G/C` over the `C` with `m_C > 0`, and `Y` the disjoint union of `|G|` points
  and `|m_C| |C|` copies of `G/C` over the `C` with `m_C < 0`; Step 1 says they have the same
  fixed-point counts; conclude with Step 2, `perm_sum` and `ind_one`.
- **Step 3: Artin's theorem in `G₀`.** `modularArtin_natCard_nsmul_mem_indCyclic`: `|G| • x` lies in
  `indCyclic k G` for every `x`, in every characteristic. Multiplying Artin's identity by `x` and
  using `ind C 1 * x = ind C (res C.subtype x)` (the projection formula) gives
  `|G| • x = ∑ᶠ C, (m_C · |C|) • ind C (res C.subtype x)`, where `m_C = 0` unless `C` is cyclic.
  In characteristic zero this is Artin's theorem in `G₀ = R(G)` (`ofRepRing_bijective`).
- **Step 4: the modular Artin theorem.** `modularArtin_natCard_nsmul_mem_indCyclicCoprime`: in
  characteristic `ℓ`, `|G| • x ∈ indCyclicCoprime k G ℓ` for every `x`. Rewrite the expansion of
  Step 3 term by term. For a cyclic `C` let `D ≤ C` be its `ℓ′`-part
  (`exists_coprimePart_of_isCyclic`) and `r = [C : D]`, the `ℓ`-part of `|C|`. Multiplying
  `relIndex_nsmul_ind_one`, `r • ind C 1 = ind D 1`, by `x` and applying the projection formula to
  both sides gives `r • ind C (res C.subtype x) = ind D (res D.subtype x)`. Since `D ≤ C`, `r`
  divides `|C|`, so `r` cancels against the factor `|C|` of the Artin coefficient:
  `(m_C · |C|) • ind C (res C.subtype x) = (m_C · (|C| / r)) • ind D (res D.subtype x)`, which is
  induced from the cyclic subgroup `D` of order prime to `ℓ`. Summing over `C` gives the theorem,
  with the same multiplier `|G|` as Step 3.
- **The export.** `modularArtin_exists_nsmul_mem_indCyclicCoprime`: in characteristic `ℓ`, for
  every `x : modRepK0 k G` there is `N > 0` with `N • x ∈ indCyclicCoprime k G ℓ`. It follows from
  Step 4 with `N = |G|`, positive because `G` is nonempty (`Nat.card_pos`), and it is the form
  ClassFieldTheory applies, with `k = ZMod ℓ` and `x = of A`.

---

## Worked examples (acceptance criteria)

- **Artin coefficients of `S₃`.** `m_1 = -3`, `m_C = 1` for each of the three subgroups of order 2
  and for `A₃`, and `m_{S₃} = 0`. Step 1 reads `6 = -3 · 6 + 2 · 3 · 3 + 3 · 2` at `1`,
  `6 = 2 · (1 + 1 + 1)` at a transposition and `6 = 3 · 2` at a 3-cycle.
- **`S₃` over `𝔽₂`.** The simple modules are `𝔽₂` and the two-dimensional `S`. Then
  `[𝔽₂[S₃]] = 2[𝔽₂] + 2[S]`, `[𝔽₂[S₃/C₂]] = [𝔽₂] + [S]` and `[𝔽₂[S₃/A₃]] = 2[𝔽₂]`, and Artin's
  identity in `G₀` is `6[𝔽₂] = -3[𝔽₂[S₃]] + 2 ∑_{C₂} [𝔽₂[S₃/C₂]] + 3[𝔽₂[S₃/A₃]]`. Layer 2 gives
  `2[𝔽₂[S₃/C₂]] = [𝔽₂[S₃]]`, so Step 4 rewrites each term `2[𝔽₂[S₃/C₂]]` (coefficient
  `m_{C₂} |C₂| = 2`, index `[C₂ : 1] = 2`) as `[𝔽₂[S₃]]`, leaving `6[𝔽₂] = 3[𝔽₂[S₃/A₃]]`, induced
  from `A₃`. The classes induced from the cyclic `2′`-subgroups `1` and `A₃` form `2 · G₀`:
  `2[𝔽₂] = [Ind 𝔽₂]` and `2[S] = [Ind 𝔽₄]` from `A₃` (`𝔽₄` the two-dimensional simple
  `𝔽₂[A₃]`-module), while `[𝔽₂]` is not induced.
- **`S₃` over `𝔽₃`.** The simple modules are `𝔽₃` and `sgn`. The cyclic `3′`-subgroups are `1` and
  the subgroups of order 2; from one of order 2, `[Ind 1] = 2[𝔽₃] + [sgn]` and
  `[Ind sgn] = [𝔽₃] + 2[sgn]`, and `[𝔽₃[S₃]]` is their sum. They span a subgroup of index 3, so
  `3[𝔽₃] = 2[Ind 1] - [Ind sgn]` is induced and `[𝔽₃]` is not: a positive multiple is necessary
  even for the trivial module. Artin's identity has the same form as over `𝔽₂`; here Layer 2 gives
  `3[𝔽₃[S₃/A₃]] = [𝔽₃[S₃]]`, so Step 4 rewrites the term `3[𝔽₃[S₃/A₃]]` (coefficient
  `m_{A₃} |A₃| = 3`, index `[A₃ : 1] = 3`) as `[𝔽₃[S₃]]`, leaving
  `6[𝔽₃] = -2[𝔽₃[S₃]] + 2 ∑_{C₂} [𝔽₃[S₃/C₂]]`.
- **The `ℓ`-part is necessary.** A class induced from a subgroup of order prime to `ℓ` has
  dimension divisible by `|G|_ℓ`, so `N • [k]` is induced only if `|G|_ℓ` divides `N`; the
  multiplier `|G|` of Step 4 is such an `N`. For an `ℓ`-group `P`, where `[k[P]] = |P| · [k]` and
  the only cyclic `ℓ′`-subgroup is trivial, `N • [k]` is induced exactly when `|P|` divides `N`, so
  for `ℓ`-groups `|G|` is the least multiplier.
- **Reduction, `C₂` at `ℓ = 2`.** The lattices `ℤ[C₂]` and `ℤ ⊕ ℤ_sgn` have isomorphic
  rationalizations; their reductions `𝔽₂[C₂]` (a non-split extension of `𝔽₂` by `𝔽₂`) and
  `𝔽₂ ⊕ 𝔽₂` are not isomorphic, and both have class `2[𝔽₂]`.
- **Defects.** For `ℤ/ℓ²` with trivial action, `V/ℓV` and `V[ℓ]` are both `𝔽_ℓ` and the defect is
  `0`; for `ℤ` it is `[k]`; `0 → ℤ → ℤ → ℤ/ℓ → 0` (multiplication by `ℓ`) checks additivity.

## Ordering

Layer 0 comes first. Layer 1 rests on Layer 0 and the landed induction API. Layer 2 needs Layers
0–1 and Kolchin's theorem. Layer 3 needs only Layer 0, Mathlib's snake lemma and
`Representation.baseChange`, and can proceed in parallel with Layers 1–2. Layer 4 needs all of
them; its export is its last item. ClassFieldTheory's local Euler characteristic needs Layers 0,
3 and 4.

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
