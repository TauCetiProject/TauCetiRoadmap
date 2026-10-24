# Roadmap: invariants of finite groups

This roadmap specifies the finite-group vocabulary that group databases display and that neither
Mathlib nor Tau Ceti states: the characteristic subgroups and series beyond centre, commutator and
Frattini subgroup (radical, Fitting and generalized Fitting subgroups, socle, chief and composition
series with factor multisets); the classes of groups a database filters on (supersolvable,
metacyclic, A-groups, rational, quasisimple, almost simple, complete, monomial) with the
implications between them; Hall subgroups and Hall's theorems; the outer automorphism group,
autjugacy classes, divisions, commutator length, isoclinism and stem groups; the Möbius function of
the subgroup lattice, Hall's Eulerian functions and the minimal faithful permutation degrees;
rational characters, the rational character table, Schur indices and the minimal faithful linear
degrees over `ℂ`, `ℝ`, `ℚ`; Gassmann classes and Perlis' theorem; the Malle invariants a transitive
group determines; indecomposable `ℤ[C_p]`-lattices and the unit modules of biquadratic fields; and
the finite subgroups of `GL_n(ℤ)`, `GL_n(ℚ)`, `GL_n(ℂ)`.

Every object here is an isomorphism invariant of a finite group, of a finite permutation group, or of
a pair of subgroups. The roadmap serves the LMFDB sections **Groups → Abstract** (`group.abstract`),
**Galois groups** (`gg`: Malle constants, arithmetic equivalence, Galois modules), the
arithmetic-equivalence and unit-module data of **Number fields** (`nf`), and **Groups → GL(n,ℚ)**,
**GL(n,ℂ)**. Like the [completed number-field roadmap](../../Completed/NumberFieldArithmetic/README.md),
it turns each displayed invariant into a Lean definition with the theorems that make it well defined
and the API that makes it usable.


**Carrier.** Throughout, `G` is a finite group: `[Group G] [Finite G]`, with `[Fintype G]` and
`[DecidableEq G]` added only where something is computed. Its order is `Nat.card G`, its exponent
`Monoid.exponent G`, "abelian" is `IsMulCommutative G` and, for a subgroup `H`, `IsMulCommutative H`.
Nothing here introduces a second carrier for groups, subgroups (`Subgroup G`), conjugacy classes
(`ConjClasses G`), automorphisms (`MulAut G`), representations (`Representation k G V`, `FDRep k G`)
or permutation groups (`Subgroup (Equiv.Perm α)`).

**Suggested home.** `TauCeti/GroupTheory/Invariants/` for Layers 0–5 (subdirectories `Series`,
`Classes`, `Hall`, `Automorphisms`, `Commutators`, `Lattice`),
`TauCeti/RepresentationTheory/RationalCharacter/` for Layer 6,
`TauCeti/NumberTheory/ArithmeticEquivalence/` for Layer 7, `TauCeti/GroupTheory/Perm/Malle/` for
Layer 8, `TauCeti/RepresentationTheory/Integral/` for Layer 9 and
`TauCeti/LinearAlgebra/Matrix/FiniteSubgroup/` for Layer 10.

## Prerequisites

- Mathlib's finite group theory (`Subgroup`, `Sylow`, `commutator`, `derivedSeries`, nilpotency,
  solvability, `Group.IsPerfect`, `IsZGroup`, `frattini`, `MulAut`, `ConjClasses`, `Group.rank`,
  `IncidenceAlgebra.mu`, `CompositionSeries`), its character theory (`Representation.character`,
  `FDRep`), `Matrix.GeneralLinearGroup`, `Equiv.Perm.cycleType`, `MulAction.IsPreprimitive`,
  `LSeries_eq_zero_iff`, `NumberField.dedekindZeta`.
- Tau Ceti's character-table library, built to [character theory](../RepresentationTheory/CharacterTheory/README.md)
  A–D, its induction library, built to [induction and restriction](../RepresentationTheory/InductionRestriction/README.md)
  Layers 0–7 (including `Subgroup.AlmostConjugate`, the Schur multiplier), and its permutation and
  Galois-label library, built to [polynomial Galois groups](../PolynomialGaloisGroups/README.md).
- [Stating CFSG](../CFSGStatement/README.md) (the proposition `CFSG`, for two implications);
  [arithmetic statistics, Part V](../ArithmeticStatisticsPartV/README.md) §3.9 (the Malle invariants);
  the [completed number-field roadmap](../../Completed/NumberFieldArithmetic/README.md) Layers 1–2,
  the [Chebotarev density theorem](../Chebotarev/README.md) and the sibling `ArtinRepresentations`
  (for Layer 7); [classical arithmetic completion](../ClassicalArithmeticCompletion/README.md) Layer 7
  and the [multiquadratic roadmap](../../Completed/Multiquadratic/README.md) (for Layer 9).

## Scope and ownership

The LMFDB boundary rule applies throughout: a predicate invariant under isomorphism belongs to the
object roadmap (this one, for abstract finite groups). This roadmap states the intrinsic **label
prefixes** (the invariants a label is built from) and never an enumerative index.

### Owned here

- **Series and characteristic subgroups** (Layer 0): the normal-subgroup lattice as a
  `JordanHolderLattice`, chief and composition series with their factor multisets and lengths,
  derived length, minimal normal subgroups, socle, radical, the Fitting subgroup,
  the invariant factors of a finite abelian group.
- **Classes of finite groups** (Layer 1): supersolvable, metacyclic, A-groups, rational,
  quasisimple, almost simple, complete, the implication diagram with witnessed non-implications,
  components and the generalized Fitting subgroup.
- **Hall subgroups** (Layer 2): Hall's existence-and-conjugacy theorem, its converse, Sylow systems.
- **Automorphisms and classes** (Layer 3): `Out G`, autjugacy, characteristic-subgroup counts,
  divisions, power maps, order statistics, the `φ`-ratio.
- **Commutators and isoclinism** (Layer 4): commutator length, isoclinism, stem groups and stem
  extensions against the Schur multiplier.
- **Lattice invariants** (Layer 5): the Möbius functions of the subgroup and normal-subgroup
  lattices, Eulerian functions, the faithful-character count, minimal faithful permutation and
  transitive degrees.
- **Rational characters and faithful degrees** (Layer 6): character fields, rational characters and
  the rational character table, Schur indices with Brauer–Speiser, the rational-group criterion,
  monomial groups with Taketa's theorem, minimal faithful linear degrees over `ℂ`, `ℝ`, `ℚ`.
- **Gassmann classes and arithmetic equivalence** (Layer 7): Gassmann classes and triples, the
  finite-index reduction, Perlis' theorem and its corollaries, the sibling count.
- **Malle invariants** (Layer 8): `b(ℚ, G)` as a division count, `d(G)`, concentrated,
  semiconcentrated and elusive groups.
- **Integral representations** (Layer 9): `ℤ[G]`-lattices, Jordan–Zassenhaus, Diederichsen–Reiner,
  the unit lattice as a `ℤ[G]`-module, Kuroda's unit index and the biquadratic module types.
- **Finite matrix groups** (Layer 10): Minkowski's lemma and bound, the classifications for `n ≤ 3`,
  the class counts and certificate interface for `n ≥ 4`, the `GL_n(ℂ)` dictionary, and Jordan's theorem over every
  field of characteristic zero with the optimal constant `jordanBound`, the corollary for subgroups
  finite modulo scalars, Schur's bound and Collins' value.

### Consumed, not redefined

- From Mathlib, everything under *What Mathlib supplies*. In particular "abelian" is
  `IsMulCommutative`, "metabelian" is `IsMulCommutative ↥(commutator G)`, "perfect" is
  `Group.IsPerfect`, "Z-group" is `IsZGroup`, "nilpotency class" is `Group.nilpotencyClass`,
  "Frattini subgroup" is `frattini G`, "Hall subgroup" is the hypothesis `Nat.Coprime (Nat.card H)
  H.index`, "rank" is `Group.rank`, and the Möbius function is `IncidenceAlgebra.mu`. None is wrapped
  in a new predicate.
- From Tau Ceti, everything under *What Tau Ceti supplies*: elementary and hyperelementary groups,
  the character table and its Galois action, kernels of characters, realizability over a subfield,
  the Frobenius–Schur indicator, Burnside's `p^a q^b`, the Schur multiplier `TauCeti.schurMultiplier`,
  `DerivedCentralQuotient`, `fullCycleType`, the transitive-group labels, `MulAut.mapQuotient`.
- From Tau Ceti beyond this repository's pin, in prose only: `Subgroup.AlmostConjugate` with
  `almostConjugate_iff_forall_natCard_fixedBy_eq`, `almostConjugate_iff_forall_natCard_cycleType_eq`,
  `AlmostConjugate.natCard_eq`, `AlmostConjugate.index_eq`, `AlmostConjugate.map`,
  `AlmostConjugate.comap` (module `TauCeti.GroupTheory.AlmostConjugate`, built to Induction and
  Restriction 2.1). This is Gassmann equivalence; Layer 7 states its laws on this object.
- [Induction and restriction](../RepresentationTheory/InductionRestriction/README.md) Layers 2.1
  (`Gassmann.almostConjugate_iff_permutation_equiv`, `Gassmann.not_conj_comap`), 2.2
  (`Gassmann.exists_S16_gassmann_pair`), 5 (Clifford), 6 (Artin and Brauer induction), 7 (projective
  representations, the Schur multiplier) and its Part II (Schur covers, integral homology).
- [Character theory](../RepresentationTheory/CharacterTheory/README.md) Layers 0–4 and 7; its
  executable table (Layers 5–6) is the computational substrate for every table-valued invariant here.
- [Polynomial Galois groups](../PolynomialGaloisGroups/README.md): the `nTj` data model, Layer 1,
  Layer 6 and Layers 1C–1D (reference transitive groups to degree 11), Layer 9 (the degree-16
  arithmetically equivalent pair). Transitive groups are never classified here.
- [Stating CFSG](../CFSGStatement/README.md): the simple groups and the proposition `CFSG`.
- [Arithmetic statistics, Part V](../ArithmeticStatisticsPartV/README.md) §3.9: `malleIndex`,
  `malleIndexGroup`, `malleA`, `malleB`, `malleIndex_conj`, `malleIndex_pow_of_isUnit`. Malle's
  conjecture and its refinements live there.
- [Number field arithmetic](../../Completed/NumberFieldArithmetic/README.md) 1.4 (the double-coset
  splitting law), 2.1–2.3 (Frobenius, the Artin symbol), 8.1; the
  [Chebotarev density theorem](../Chebotarev/README.md) (every class is a Frobenius class); the
  sibling `ArtinRepresentations` (Artin `L`-functions, the Artin formalism, the Dedekind zeta function
  as the `L`-function of a permutation representation). Layer 7 consumes these by name.
- [Classical arithmetic completion](../ClassicalArithmeticCompletion/README.md) 7.40, 7.54, 7.77
  (the maximal order of `ℚ[C_p]`, locally free lattices, the locally free class group) and the
  [multiquadratic roadmap](../../Completed/Multiquadratic/README.md) Layer 0 (the biquadratic field
  and its quadratic subfields), for Layer 9.

### Not owned here

- **Identifiers, orderings, hashes, normal forms, stored lists** are not targets: label components
  beyond the intrinsic prefix, such as the small-group index `i` of a label `N.i` (this roadmap
  states the prefix `N = Nat.card G`), `nTj` for `n ≥ 6` and the Gassmann letter; the orderings of
  divisions, rational characters and chief factors; `hash`, `pc_code`, `elt_rep_type`, `tex_name`;
  the "small"/"large" partition of divisions; every "number of stored X"; the completeness of
  database tables; and every match of a certificate against a stored group.
- **Character tables and the arithmetic of character values**: Character Theory. Layer 6 adds only
  the rational-character and Schur-index layer.
- **The Schur multiplier as a group, Schur covers, projective representations, group homology**:
  Induction and Restriction Layer 7 and Part II. Layer 4 states stem extensions against that object.
- **The finite simple groups and their simplicity proofs**: the CFSG roadmaps. "Quasisimple" and
  "almost simple" are predicates on an arbitrary finite group.
- **Transitive groups, blocks, wreath products, Galois groups of polynomials**: Polynomial Galois
  Groups. Layer 8 is stated for an arbitrary `G ≤ Equiv.Perm α`.
- **Malle's conjecture, Türkelli's and Wang's `b`, the heuristic `malle_c`**: Arithmetic Statistics
  Part V §3.9.
- **Continuous automorphisms and `ContinuousOut` of a profinite group**:
  [profinite arithmetic](../ProfiniteArithmetic/README.md) Layer 2. The discrete `Out G` is 3.1 here;
  the comparison for a finite discrete group is a milestone there.
- **Galois-module structure of rings of integers, associated orders**: Classical Arithmetic
  Completion Layer 7. **Unit groups, regulators, fundamental units**: Mathlib and
  [heights and units](../HeightsAndUnits/README.md); Layer 9 consumes the unit group and states its
  module type.
- **Groups constructed by the siblings** — inertia, wild inertia and automorphism groups of `p`-adic
  extensions (`PadicExtensionFamilies`), automorphism groups of Riemann surfaces
  (`GroupActionsOnRiemannSurfaces`), component groups (`SatoTateGroups`), image groups of Artin
  representations (`ArtinRepresentations`), Galois images (`AdelicImagesAndModularCurves`): those
  roadmaps build the groups and this one supplies the invariants of the abstract group; no
  milestone of either side names the other, and identifiers of the groups are not targets. The
  Gassmann equivalence of open subgroups of `GL₂(ẑ)` is 7.3 applied to `GL₂(ẑ)`.
- **Finite subgroups of `U(d)` as Sato–Tate groups**: `SatoTateGroups`, `ArtinRepresentations`;
  Layer 10 classifies conjugacy in `GL_n(ℂ)`, which they consume, and `SatoTateGroups` 7.1
  consumes Jordan's theorem 10.5.
- **Families with parameters** (Lie type, Chevalley, Weyl, Coxeter): the CFSG roadmaps and
  [reflection groups](../ReflectionInvariantTheory/README.md). **Presentations and generators**
  (`ngens`, `pseudo_random_elements`): data about a presentation, not a target.


## Pinned conventions

- **Finiteness.** Definitions are stated for `[Group G]` with `[Finite G]` wherever the mathematics
  needs it; counting theorems carry `[Finite G]` explicitly. Only 7.3 concerns infinite groups.
- **Abelian, metabelian, perfect.** `IsMulCommutative G`; `IsMulCommutative ↥(commutator G)`;
  `Group.IsPerfect G`. No new names.
- **Normal subgroups as a lattice.** `NormalSubgroup G := {N : Subgroup G // N.Normal}` with the
  lattice structure inherited from `Subgroup G`. Chief series are `CompositionSeries (NormalSubgroup G)`
  for Mathlib's `JordanHolderLattice` instance on a modular lattice (`IsMaximal` is the covering
  relation `⋖`); its interval relation `JordanHolderLattice.Iso (A, B) (C, D)` implies
  `Nonempty ((B ⧸ A) ≃* (D ⧸ C))`, where `B ⧸ A` abbreviates `↥B ⧸ A.subgroupOf B`. Composition series are the separate structure `GroupCompositionSeries G`
  (0.4), since `IsMaximal` in `Subgroup G` means maximal *subgroup*, not maximal normal in the next term.
- **Factor multisets.** Chief and composition factors are `Multiset`s of isomorphism classes of
  finite groups, the quotient of `{H : Type // Group H ∧ Finite H}` by `Nonempty (· ≃* ·)`; the
  universe is `Type` because every finite group is isomorphic to one there.
- **Derived length.** `derivedLength G := sInf {n | derivedSeries G n = ⊥}`: `0` for the trivial
  group, `1` for a nontrivial abelian group, and the junk value `0` for a non-solvable group, with
  `derivedLength_eq_zero_iff` stated so the junk value is never read as data. Nilpotency class is
  Mathlib's `Group.nilpotencyClass`, with the same `sInf` convention.
- **Fitting, radical, socle** are defined as suprema (`sSup` of the normal nilpotent, normal
  solvable, resp. minimal normal subgroups); their structural properties are theorems.
  `IsMinimalNormal N := N.Normal ∧ N ≠ ⊥ ∧ ∀ M ≤ N, M.Normal → M = ⊥ ∨ M = N`.
- **Group classes** are `Prop`-valued predicates on the type `G`: a `class` where Mathlib's nearest
  neighbour is a class (`IsSupersolvable`, `IsAGroup`, mirroring `IsZGroup`), a `def` otherwise. Each
  definition is the most elementary of the equivalent forms, fixed in Layer 1 (and 6.7 for
  `IsMonomial`); the other forms are `…_iff_…` theorems.
- **Outer automorphisms.** `Inn G := (MulAut.conj : G →* MulAut G).range`; `Out G := MulAut G ⧸ Inn G`.
- **Autjugacy and divisions.** An autjugacy class is an orbit of `MulAut G` acting on `G` by
  evaluation; `AutjugacyClasses G := MulAction.orbitRel.Quotient (MulAut G) G`. Divisions:
  `x ∼ y ↔ ∃ n, n.Coprime (orderOf x) ∧ IsConj (x ^ n) y`, `Division G` its quotient; the description
  as orbits of `(ZMod (Monoid.exponent G))ˣ` on `ConjClasses G` is theorem 3.7, not the definition.
- **Commutator length.** With `open Pointwise`, `commutatorLength G := sInf {k | (commutator G : Set G)
  ⊆ commutatorSet G ^ k}`: `0` exactly for abelian `G`, `1` exactly when every element of `G'` is a
  commutator. This is the LMFDB `commutator_count`.
- **Isoclinism.** An `Isoclinism G H` is a pair `(φ : G ⧸ center G ≃* H ⧸ center H, σ : commutator G
  ≃* commutator H)` compatible with the commutator maps; `Isoclinic G H := Nonempty (Isoclinism G H)`;
  `IsStemGroup G := center G ≤ commutator G`.
- **Möbius functions.** `mobiusSub G H := IncidenceAlgebra.mu ℤ H (⊤ : Subgroup G)` (so
  `mobiusSub G ⊤ = 1`, and for `H < ⊤`, `mobiusSub G H = -∑ H' ∈ Finset.Ioi H, mobiusSub G H'`)
  and `mobiusQuo G N := IncidenceAlgebra.mu ℤ (⊥ : NormalSubgroup G) N` (so `mobiusQuo G ⊥ = 1`,
  and for `⊥ < N`, `mobiusQuo G N = -∑ N' ∈ Finset.Iio N, mobiusQuo G N'`), with
  `Fintype.toLocallyFiniteOrder` and classical decidability.
  `eulerian G k := Nat.card {v : Fin k → G // Subgroup.closure (Set.range v) = ⊤}`.
- **Faithful degrees** are `ℕ∞`-valued `sInf`s, `⊤` when no faithful (irreducible) representation
  exists; the LMFDB's `-1` is a database convention, not a target. For `k ⊆ ℂ`,
  `linDegree k G` is the least `Module.finrank k V` of a faithful `Representation k G V`, `irrDegree k G`
  the least over faithful `k`-irreducible ones; `permutationDegree G`, `transitiveDegree G` are the
  least degree of a faithful, resp. faithful transitive, action on some `Fin n`.
- **Rational characters.** For `χ ∈ irreducibleCharacters ℂ G`, `characterField χ :=
  IntermediateField.adjoin ℚ (Set.range χ)`; the rational irreducible character attached to `χ` is
  the sum of its orbit under `(ZMod (Monoid.exponent G))ˣ` acting by `χ ↦ (g ↦ χ (g ^ n))`. That this
  is the Galois orbit and the sum is `ℤ`-valued are theorems 6.2–6.3. The rational character table is
  indexed by these orbits (rows) and `Division G` (columns).
- **Schur index.** For `F : IntermediateField ℚ ℂ` and irreducible `χ`, `schurIndex F χ` is the least
  `[E : F(χ)]` over `F(χ) ≤ E ≤ ℂ` such that some `W : FDRep E G` has character `χ` after base change.
- **Gassmann.** "Gassmann equivalent" is `Subgroup.AlmostConjugate`; a Gassmann triple is a group
  with two non-conjugate almost-conjugate subgroups.
- **Malle.** `malleIndex`, `malleIndexGroup`, `malleA`, `malleB` are Arithmetic Statistics Part V's;
  `b(ℚ, G) = malleB ⊤ G`; `malleD G` is the lcm of the orders of the minimal-index elements.
- **Lattices.** A `ℤ[G]`-lattice is a `Module (MonoidAlgebra ℤ G) L` that is `Module.Free ℤ` and
  `Module.Finite ℤ`; `C_p` is `Multiplicative (ZMod p)`; indecomposable is Tau Ceti's
  `IsIndecomposableModule (MonoidAlgebra ℤ G) L`.
- **Finite matrix groups.** `GL (Fin n) R` is `Matrix.GeneralLinearGroup (Fin n) R`; a `ℤ`-class
  (`ℚ`-class) is a conjugacy class of finite subgroups under `GL (Fin n) ℤ` (`GL (Fin n) ℚ`).

## What Mathlib supplies

`Subgroup.Normal`, `Subgroup.Characteristic` (instances for `center`, `commutator`, `frattini`,
`derivedSeries`, `upperCentralSeries`), `Subgroup.normalCore`, `Subgroup.centralizer`,
`Subgroup.normalizer`, `Subgroup.IsSubnormal`, `derivedSeries` (`derivedSeries_normal`,
`map_derivedSeries_eq`), `upperCentralSeries`, `lowerCentralSeries`, `Group.IsNilpotent`,
`Group.nilpotencyClass` (`upperCentralSeries_nilpotencyClass`, `lowerCentralSeries_eq_bot_iff_nilpotencyClass_le`),
`Group.IsSolvable` (`isSolvable_iff_subgroup_quotient`), `Group.IsPerfect` (`isPerfect_def`,
`derivedSeries_eq_top`), `IsSimpleGroup`, `frattini` (`frattini_le_coatom`, `frattini_nilpotent`),
`IsCoatom`, `IsAtom`, `commutator`, `commutatorSet`, `Abelianization`; `IsPGroup`, `Sylow`
(`card_eq_card_quotient_normalizer`, `card_dvd_index`, `Sylow.equiv`, `exists_subgroup_card_pow_prime_le`),
`Subgroup.IsComplement'`, Schur–Zassenhaus (`exists_right_complement'_of_coprime`), `IsZGroup`
(`of_squarefree`, `isZGroup_iff_exists_mulEquiv`, `exponent_eq_card`), `Group.isNilpotent_of_finite_tfae`;
`MulAut`, `MulAut.conj`, `ConjAct`, `MulAction.orbitRel`, `MulAction.orbitRel.Quotient`,
`MulAction.fixedBy`, `ConjClasses`, `IsConj`, `Subgroup.map`; `Subgroup.closure`, `Group.rank`;
`IncidenceAlgebra.mu` (`mu_eq_neg_sum_Ico_of_ne`, `mu_eq_neg_sum_Ioc_of_ne`, `moebius_inversion_top`,
`moebius_inversion_bot`), `Fintype.toLocallyFiniteOrder`, `CompositionSeries`, `JordanHolderLattice`,
`CompositionSeries.jordan_holder`; `Equiv.Perm.cycleType`, `Equiv.Perm.isConj_iff_cycleType_eq`,
`MulAction.toPermHom`, `MulAction.IsPretransitive`, `MulAction.IsPreprimitive`, `alternatingGroup`;
`Representation.character`, `Representation.IsIrreducible`, `FDRep`, `FDRep.character`,
`char_orthonormal`, `char_iso`, `isIntegral_character`, Maschke, `Representation.ofMulAction`;
`AddCommGroup.equiv_directSum_zmod_of_finite`, `ZMod`, `Monoid.exponent`, `Nat.card`,
`Subgroup.index_mul_card`; `Module.Free`, `Module.Finite`, `Basis.SmithNormalForm`,
`Matrix.GeneralLinearGroup`, `Matrix.card_GL_field`, `Matrix.ProjGenLinGroup` and
`Matrix.ProjGenLinGroup.mk` (`PGL(n, R)`, the quotient by the centre, which
`Matrix.GeneralLinearGroup.center_eq_range_scalar` identifies with the scalars), `LinearMap.charpoly`, `Polynomial.cyclotomic`,
`IsCyclotomicExtension.autEquivPow`, `MonoidAlgebra`, `NumberField`, `ClassGroup`; `LSeries`,
`LSeries_eq_zero_iff`.

## What Tau Ceti supplies

- `TauCeti.GroupTheory.Elementary` (`IsPElementary`, `IsPHyperelementary`, `IsElementary`,
  `IsHyperelementary`), `….DerivedCentralQuotient`, `….FiniteGroupClass` (`finiteGroupClassSolvable`),
  `….Frattini`, `….Sylow`, `….PGroup` (`IsPGroup.index_eq_prime_of_isCoatom`), `….Nilpotent`,
  `….Solvable` (`Group.IsSolvable.exists_normal_index_prime`), `….Commutator`, `….Gaschutz`,
  `….QuotientGroup.MulAut` (`MulAut.mapQuotient`), `….Perm.*` (`Equiv.Perm.fullCycleType`,
  `Subgroup.classesOfFullCycleType`, Jordan's prime-cycle theorem, recognition of `Sₙ`, `Aₙ`).
- `TauCeti.RepresentationTheory.CharacterTable.*`: `irreducibleCharacters`, `irreducibleCharacter`,
  `characterDegree`, `characterTable`, `card_irreducibleCharacters`, `characterDegree_dvd_card`;
  `FDRep.map_character_eq_character_pow`, `FDRep.character_pow_eq_character_of_coprime`;
  `FDRep.intCharacter`, `char_mem_adjoin_of_isPrimitiveRoot`; `FDRep.mem_ker_iff_char_eq`,
  `FDRep.ker_eq_bot_iff`, `FDRep.coe_iInf_ker`; `FDRep.exists_nonempty_iso_baseChange_iff`;
  `frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal`; `isSolvable_of_card_eq_prime_pow_mul_prime_pow`
  (Burnside); `nonempty_equiv_ofMulAction_iff_forall_natCard_fixedBy_eq`; the executable Dixon–Schneider
  tables.
- `TauCeti.RepresentationTheory.Induction.*` (induced class functions, Frobenius reciprocity, Mackey,
  Clifford, Artin, Brauer, `LinearCharacter`, `Monomial`:
  `exists_nonempty_iso_indFDRep_ofLinearCharacter_of_isNilpotent`),
  `….ProjectiveRepresentation.SchurMultiplier` (`schurMultiplier k G`),
  `TauCeti.FieldTheory.GaloisGroups.*` (`TransitiveGroupLabel`, `referenceSubgroup`, `HasGaloisLabel`),
  `TauCeti.Topology.Algebra.Group.WreathProduct.*`,
  `TauCeti.RingTheory.KrullSchmidt.Indecomposable` (`IsIndecomposableModule`).
- Beyond the pin, in prose only: `Subgroup.AlmostConjugate` (`TauCeti.GroupTheory.AlmostConjugate`).

## What is missing

Everything named under *Owned here* above. None of it exists in Mathlib or Tau Ceti: the only
pieces of this vocabulary either library has are the ones listed as consumed (perfect, Z-group,
elementary, hyperelementary, the Schur multiplier, almost-conjugacy, the character table).

**The build, in layers.** Each milestone names what it rests on. "Mathlib" and "Tau Ceti" mean
the material listed above; a bare number is an earlier milestone of this roadmap. Hypotheses not
restated are the standing `[Group G] [Finite G]`. Suggested.lean states the milestones whose
statements need only Mathlib and the pinned Tau Ceti; the others (6.2 and 6.3 among them) are
specified here only, with their definitions in prose and their Checks.

## Layer 0: series and characteristic subgroups

### 0.1 The lattice of normal subgroups

`NormalSubgroup G := {N : Subgroup G // N.Normal}` with `CompleteLattice`, `BoundedOrder`, the
coercion to `Subgroup G` as an order embedding preserving `⊔`, `⊓`, `⊥`, `⊤`, and
`IsModularLattice (NormalSubgroup G)` (Dedekind's law `A ≤ C → A ⊔ (B ⊓ C) = (A ⊔ B) ⊓ C` for normal
subgroups, from `Subgroup.mul_inf_assoc`/`Subgroup.inf_mul_assoc`-type product descriptions of
`A ⊔ B = A * B` when one factor is normal). `IsAtom N ↔ IsMinimalNormal N` and
`IsCoatom N ↔ (N ≠ ⊤ ∧ IsSimpleGroup (G ⧸ N))`. *Rests on:* Mathlib.

### 0.2 Jordan–Hölder for normal subgroups

`JordanHolderLattice (NormalSubgroup G)` is Mathlib's instance for the modular lattice of 0.1, with
`IsMaximal` the covering relation; its interval relation `Iso` implies `Nonempty (B ⧸ A ≃* D ⧸ C)`
(by `JordanHolderLattice.Iso.rel` and the second isomorphism theorem for normal `A, B`).
`ChiefSeries G := CompositionSeries (NormalSubgroup G)`; every finite group has one from `⊥` to
`⊤`; `CompositionSeries.jordan_holder` gives equal length and `Iso`-equivalent factors up to
permutation. `chiefFactors (s : ChiefSeries G) : Multiset IsoClass` (the classes of the successive
quotients) and `chiefFactors_eq` for two series with the same ends. *Rests on:* 0.1, Mathlib.

### 0.3 Chief factors are characteristically simple

For a chief series `N₀ < N₁ < ⋯`, each factor `Nᵢ₊₁ ⧸ Nᵢ` is a minimal normal subgroup of `G ⧸ Nᵢ`
(0.1), hence has no proper nontrivial subgroup invariant under the induced `G`-action; it is a
direct product of pairwise isomorphic simple groups: there are a simple group `S : Type` and
`k : ℕ` with `Nonempty (Nᵢ₊₁ ⧸ Nᵢ ≃* (Fin k → S))`. For solvable `G`, every chief factor is `Fin k → ZMod p`
for a prime `p`. *Rests on:* 0.2; the proof is by minimality of the normal subgroup (a minimal normal subgroup of a
finite group is a direct product of isomorphic simple groups, Robinson 3.3.15).

### 0.4 Composition series of a group

`structure GroupCompositionSeries G` : `length : ℕ`, `series : Fin (length + 1) → Subgroup G`,
`strictMono`, `head : series 0 = ⊥`, `last : series (Fin.last _) = ⊤`, `normal : ∀ i,
((series i.castSucc).subgroupOf (series i.succ)).Normal`, `simple : ∀ i,
IsSimpleGroup (series i.succ ⧸ (series i.castSucc).subgroupOf (series i.succ))`. Existence for
finite `G` (refine a chief series through 0.3). Every term is `IsSubnormal` (Mathlib). *Rests on:*
0.3, Mathlib.

### 0.5 Jordan–Hölder for composition series

Two composition series of `G` have the same length and the same multiset of isomorphism classes of
factors (induction on `Nat.card G` through the second isomorphism theorem; Kurzweil–Stellmacher,
Chapter 1). `compositionFactors G : Multiset IsoClass`, `compositionLength G := (compositionFactors
G).card`; `compositionLength G = ∑ k_i` over the chief factors `Fin k_i → S_i` of 0.3;
`compositionLength_eq_zero_iff : … ↔ Subsingleton G`; for `N` normal, `compositionFactors (G ⧸ N) +
compositionFactors N = compositionFactors G`; for solvable `G` the factors are `ZMod p` over the prime
factorization of `Nat.card G` with multiplicity, so `compositionLength G = (Nat.card
G).primeFactorsList.length`. *Rests on:* 0.4.

### 0.6 Derived length

`derivedLength G := sInf {n | derivedSeries G n = ⊥}` with `derivedSeries_derivedLength`,
`derivedLength_eq_zero_iff`, `derivedLength G ≤ n ↔ derivedSeries G n = ⊥` (for solvable `G`),
`derivedLength_eq_one_iff : derivedLength G = 1 ↔ IsMulCommutative G ∧ Nontrivial G`,
derived length `2` exactly for metabelian nonabelian groups, monotonicity under subgroups and
quotients, `derivedLength G ≤ compositionLength G` for solvable `G`, and `Group.nilpotencyClass_lt_two_pow`-type
comparison `derivedLength G ≤ Nat.log 2 (Group.nilpotencyClass G) + 1` for nilpotent `G`. The LMFDB
`derived_length` and `nilpotency_class` are these two numbers. *Rests on:* Mathlib.

### 0.7 Minimal normal subgroups and the socle

`IsMinimalNormal` (*Pinned conventions*), equivalent to being an atom of `NormalSubgroup G`; a minimal normal subgroup is
characteristically simple (0.3). `socle G := sSup {N | IsMinimalNormal N}`, characteristic, the
internal direct product of an independent subfamily of the minimal normal subgroups;
`socle_eq_bot_iff : … ↔ Subsingleton G`; for solvable `G` the socle is abelian of squarefree exponent;
`IsSimpleGroup G → socle G = ⊤`. *Rests on:* 0.3, Mathlib (Kurzweil–Stellmacher, Chapter 1).

### 0.8 The Fitting subgroup and the radical

`fittingSubgroup G := sSup {N | N.Normal ∧ Group.IsNilpotent N}`. Fitting's theorem: the join of two
normal nilpotent subgroups is nilpotent (Kurzweil–Stellmacher, Chapter 6; via Mathlib's Sylow
characterization of finite nilpotent groups), hence `Group.IsNilpotent (fittingSubgroup G)`;
characteristic; `le_fittingSubgroup_iff` for normal `N`; `fittingSubgroup_eq_top_iff : … ↔
Group.IsNilpotent G`; `frattini_le_fittingSubgroup`, `center_le_fittingSubgroup`; the Sylow description
`fittingSubgroup G = ⨆ p, pCore p G` with `pCore p G := ⨅ P : Sylow p G, (P : Subgroup G)`.
`solvableRadical G := sSup {N | N.Normal ∧ Group.IsSolvable N}`, solvable, characteristic,
`solvableRadical_eq_top_iff : … ↔ Group.IsSolvable G`, `fittingSubgroup G ≤ solvableRadical G`,
`solvableRadical_eq_bot_iff : … ↔ ∀ N, IsMinimalNormal N → ¬ IsMulCommutative N`. For solvable
nontrivial `G`, `centralizer (fittingSubgroup G) ≤ fittingSubgroup G`. *Rests on:* 0.7, Mathlib.

### 0.9 Invariant factors of a finite abelian group

For a finite `[AddCommGroup A]`: there is a unique list `d₁ ∣ d₂ ∣ ⋯ ∣ d_k` of integers `> 1` with
`A ≃+ ⨁ i, ZMod (d i)`; `smithInvariants A : List ℕ`, with `smithInvariants_eq_nil_iff :
smithInvariants A = [] ↔ Subsingleton A`, `(smithInvariants A).prod = Nat.card A`,
the last invariant is `AddMonoid.exponent A`, and
`primaryInvariants A : List ℕ` (the multiset of prime powers of `AddCommGroup.equiv_directSum_zmod_of_finite`,
listed by prime then by exponent), with the mutual reconstruction of the two lists. Transport along
`≃+` and the multiplicative versions for `[CommGroup A]`. These are the LMFDB
`smith_abelian_invariants` and `primary_abelian_invariants`, both canonical (no ordering choice
beyond the stated divisibility chain). *Rests on:* Mathlib's `AddCommGroup.equiv_directSum_zmod_of_finite`
and `Basis.SmithNormalForm`.

## Layer 1: classes of finite groups

Each predicate comes with: closure or non-closure under subgroups, quotients, finite products and
extensions (each non-closure witnessed by a group of order `≤ 24`); invariance under `≃*`; a
decidable instance for `[Fintype G] [DecidableEq G]` where the definition is a bounded search; and
its place in the implication diagram 1.9.

### 1.1 Supersolvable groups

`class IsSupersolvable G` (*Pinned conventions*). Equivalently, every chief factor has prime order
(0.3). `isSolvable_of_isSupersolvable`; `Group.IsNilpotent → IsSupersolvable`
for finite groups; closed under subgroups, quotients and finite products, not under extensions
(`A₄`); Huppert's criterion `IsSupersolvable G ↔ ∀ H, IsCoatom H → H.index.Prime` (Robinson §5.4); a
supersolvable group has a normal Sylow subgroup for its largest prime divisor and nilpotent
`commutator G`. *Rests on:* 0.3, 0.6, Mathlib.

### 1.2 Metacyclic groups

`IsMetacyclic G` (*Pinned conventions*). `IsMetacyclic.isSupersolvable`, hence metabelian; closed
under subgroups and quotients, not under products (`C₂³`); `IsZGroup G → IsMetacyclic G` (Mathlib's
`isZGroup_iff_exists_mulEquiv`); `IsMetacyclic (DihedralGroup n)`, `IsMetacyclic (QuaternionGroup n)`;
the smallest nonabelian metabelian non-metacyclic group is `A₄` (its normal subgroups are `⊥`, `V₄`,
`⊤`, none cyclic with cyclic quotient). *Rests on:* 1.1,
Mathlib.

### 1.3 A-groups and Z-groups

`class IsAGroup G` (*Pinned conventions*). `IsZGroup G → IsAGroup G`; abelian groups are A-groups;
closed under subgroups, quotients and finite products; `IsAGroup (alternatingGroup (Fin 4))`,
`¬ IsAGroup (Equiv.Perm (Fin 4))`, `¬ IsAGroup (QuaternionGroup 2)`. The LMFDB `Agroup`, `Zgroup` are
`IsAGroup G`, `IsZGroup G`. *Rests on:* Mathlib.

### 1.4 Rational groups

`IsRationalGroup G` (*Pinned conventions*): every element is conjugate to each of its powers of
exponent coprime to its order. `IsRationalGroup (Equiv.Perm α)` (`Equiv.Perm.isConj_iff_cycleType_eq`),
`IsRationalGroup (QuaternionGroup 2)`, `¬ IsRationalGroup (Multiplicative (ZMod 3))`; invariance under
`≃*`; closed under quotients and finite products, not under subgroups (`C₃ ≤ S₃`); decidable for
`[Fintype G] [DecidableEq G]`. *Rests on:* Mathlib.

### 1.5 Quasisimple groups

`IsQuasisimple G := Group.IsPerfect G ∧ IsSimpleGroup (G ⧸ center G)`: equivalently a perfect central
extension of a nonabelian simple group; nontrivial and non-solvable; every normal subgroup is central
or everything; quotients by central subgroups are quasisimple; nonabelian simple groups are
quasisimple; `IsQuasisimple (SpecialLinearGroup (Fin 2) (ZMod 5))`. Tau Ceti's
`DerivedCentralQuotient G` is the simple quotient. *Rests on:* Mathlib, Tau Ceti.

### 1.6 Almost simple groups

`IsAlmostSimple G` (*Pinned conventions*); `isAlmostSimple_iff`: a nonabelian simple `S` and an
injective `G →* MulAut S` whose range contains `Inn S`. The simple normal subgroup is `socle G`;
`IsAlmostSimple G → center G = ⊥ ∧ solvableRadical G = ⊥`; nonabelian simple groups are almost simple;
`IsAlmostSimple (Equiv.Perm (Fin 5))`; `¬ IsAlmostSimple (SpecialLinearGroup (Fin 2) (ZMod 5))`.
*Rests on:* 0.7, 0.8, Mathlib.

### 1.7 Complete groups

`IsComplete G := center G = ⊥ ∧ Function.Surjective (MulAut.conj : G →* MulAut G)`; equivalently
`MulAut.conj` is a `≃*`, equivalently (Hölder) every normal embedding of `G` splits as a direct
factor. `IsComplete (Equiv.Perm (Fin n))` for `n ∉ {2, 6}` (an automorphism preserves the class of
transpositions, by counting involutions); `¬ IsComplete (Equiv.Perm (Fin 6))` (an automorphism carrying
transpositions to triple transpositions). *Rests on:* Mathlib.

### 1.8 Elementary and hyperelementary products

`elementaryPrimes G := ∏ p ∈ (Nat.card G).primeFactors, if TauCeti.IsPElementary p G then p else 1`
and `hyperelementaryPrimes G` likewise; `elementaryPrimes G ∣ hyperelementaryPrimes G`;
`elementaryPrimes G = 1 ↔ ¬ TauCeti.IsElementary G`; for `p`-groups and cyclic groups the full
product. These are the stored `elementary` and `hyperelementary` columns. *Rests on:* Tau Ceti.

### 1.9 The implication diagram

One-line theorems over `[Group G] [Finite G]`: cyclic → abelian → nilpotent → supersolvable →
solvable; cyclic → Z-group → metacyclic → metabelian → solvable; Z-group → A-group;
`p`-group → nilpotent; elementary → nilpotent; elementary → hyperelementary → solvable; nonabelian
simple → perfect, quasisimple, almost simple; perfect ∧ nontrivial → ¬ solvable; `Squarefree (Nat.card
G) → IsZGroup G`. Non-implications, each by a named group: supersolvable ∧ ¬ nilpotent (`S₃`),
solvable ∧ ¬ supersolvable (`A₄`), metabelian ∧ ¬ metacyclic and supersolvable ∧ ¬ metacyclic (`C₂³`),
A-group ∧ ¬ Z-group (`C₂²`), metacyclic ∧ ¬ Z-group (`Q₈`), quasisimple ∧ ¬ almost simple (`SL(2,5)`),
almost simple ∧ ¬ quasisimple (`S₅`), perfect ∧ ¬ quasisimple (`A₅ × A₅`), rational ∧ ¬ supersolvable
(`S₄`). Solvable groups form a `TauCeti.FiniteGroupClass` (`finiteGroupClassSolvable`); supersolvable
and metacyclic groups do not (not extension-closed). *Rests on:* 1.1–1.8, Mathlib, Tau Ceti.

### 1.10 Components and the generalized Fitting subgroup

A **component** of `G` is a subnormal quasisimple subgroup (`IsComponent K := K.IsSubnormal ∧
IsQuasisimple K`, 1.5). `layer G := sSup {K | IsComponent K}` (`E(G)`), and
`generalizedFitting G := fittingSubgroup G ⊔ layer G` (`F*(G)`). Theorems: distinct components
commute, `⁅fittingSubgroup G, layer G⁆ = ⊥`, `centralizer (generalizedFitting G) ≤ generalizedFitting G`
(Bender; Aschbacher, *Finite Group Theory*, (31.13)), and `generalizedFitting G = fittingSubgroup G`
for solvable `G`. *Rests on:* 0.8, 1.5, Mathlib's `Subgroup.IsSubnormal`.

## Layer 2: Hall subgroups

### 2.1 Hall subgroups

"Hall" is `Nat.Coprime (Nat.card H) H.index`. For a set of primes `π`, `IsHallFor π H`: every prime
dividing `Nat.card H` lies in `π` and no prime dividing `H.index` does; `IsHallFor {p} H ↔ ∃ P : Sylow
p G, (P : Subgroup G) = H`; `Nat.Coprime (Nat.card H) H.index ↔ ∃ π, IsHallFor π H`; a normal Hall
subgroup is characteristic and has a complement (Schur–Zassenhaus, Mathlib), so `G ≃* H ⋊ K`. *Rests
on:* Mathlib.

### 2.2 Hall's theorem for solvable groups

For `Group.IsSolvable G` and every `π`: there is `H` with `IsHallFor π H`; any two are conjugate
(`∃ g, H.map (MulAut.conj g) = K`); every `π`-subgroup (`∀ p ∣ Nat.card L, p ∈ π`) is contained in
one. Proof by induction on `Nat.card G` through a minimal normal subgroup (0.7, an elementary
abelian `p`-group for solvable `G`) and Schur–Zassenhaus (Hall 1928; Isaacs *FGT* Theorem 3.13 is
the statement; Kurzweil–Stellmacher 6.4.1). Also `Sylow systems`: a family `P p : Sylow p G` over
the prime factors with pairwise permutable members (`(P p : Subgroup G) ⊔ P q = P p * P q` as sets),
existing for solvable `G` and all conjugate. *Rests on:* 0.7, 2.1, Mathlib.

### 2.3 Hall's converse

If for every prime `p ∣ Nat.card G` there is a subgroup `H` with `IsHallFor {q | q ≠ p} H` (a
`p`-complement), then `Group.IsSolvable G` (Hall 1937). The proof uses Burnside's `p^a q^b` theorem
(Tau Ceti `isSolvable_of_card_eq_prime_pow_mul_prime_pow`) for the base case and Wielandt's
argument on a minimal counterexample. Corollary: `Group.IsSolvable G ↔ ∀ p, ∃ H, IsHallFor {q | q ≠ p} H`.
*Rests on:* 2.2, Tau Ceti.

### 2.4 Sylow-structure characterizations

`IsZGroup G ↔ ∀ p (P : Sylow p G), IsCyclic P` with `G ≃* ZMod m ⋊ ZMod n`, `Nat.Coprime m n`
(Mathlib); `IsAGroup G ↔ ∀ p (P : Sylow p G), IsMulCommutative P`; `Group.IsNilpotent G ↔ ∀ p (P :
Sylow p G), (P : Subgroup G).Normal` (Mathlib `Group.isNilpotent_of_finite_tfae`); `Nat.card (Sylow p G) =
(normalizer P).index` (Mathlib). *Rests on:* Mathlib.

## Layer 3: automorphisms, autjugacy and divisions

### 3.1 Inner and outer automorphism groups

`Inn G := (MulAut.conj : G →* MulAut G).range`, normal, `≃* G ⧸ center G`; `Out G := MulAut G ⧸ Inn G`,
finite, `Nat.card (Out G) * Nat.card (G ⧸ center G) = Nat.card (MulAut G)`, `Out.congr (e : G ≃* H)`,
`Subsingleton (Out G) ↔ Function.Surjective MulAut.conj`, `Inn G = ⊥ ↔ IsMulCommutative G`. Values:
`Nat.card (Out (QuaternionGroup 2)) = 6`, `Nat.card (Out (Equiv.Perm (Fin 6))) = 2`, `Nat.card (Out
(alternatingGroup (Fin 5))) = 2`, `Nat.card (MulAut (Multiplicative (ZMod n))) = Nat.totient n` for
`0 < n`. The `φ`-ratio `Nat.card (MulAut G) / Nat.totient (Nat.card G) : ℚ`, equal to `1` for cyclic
`G`. The LMFDB `aut_order` and `outer_order` are the two orders. *Rests on:* Mathlib.

### 3.2 Automorphism-group and outer-group classes

For the boolean columns `aut_cyclic`, …, `outer_solvable`: nothing new is defined; the predicates
of Layer 1 and Mathlib are applied to `MulAut G` and `Out G`. Theorems that make this usable:
`Finite (MulAut G)`; solvability of `G` says nothing about `MulAut G` (`MulAut (Multiplicative (Fin 3 → ZMod 2)) ≃*
GL (Fin 3) (ZMod 2)`, order `168`, nonsolvable); for abelian `G`, `Out G ≃* MulAut G`. *Rests on:* 3.1.

### 3.3 Autjugacy classes

`AutjugacyClasses G := MulAction.orbitRel.Quotient (MulAut G) G`; `ConjClasses G → AutjugacyClasses G`
is surjective with fibres the orbits of `Out G` on `ConjClasses G`; classes in one autjugacy class have
equal cardinality and element order; `Nat.card (AutjugacyClasses G) ≤ Nat.card (ConjClasses G)`;
`Nat.card (AutjugacyClasses (Multiplicative (ZMod n))) = (Nat.divisors n).card` for `0 < n`,
`Nat.card (AutjugacyClasses (QuaternionGroup 2)) = 3`. Autjugate subgroups: the orbit relation of `MulAut G` on `Subgroup G` via
`Subgroup.map`; conjugate subgroups are autjugate. `number_subgroup_classes` is `Nat.card
(MulAction.orbitRel.Quotient (ConjAct G) (Subgroup G))`, `number_autjugacy_classes` is `Nat.card
(AutjugacyClasses G)`, and `aut_stats`/`cc_stats` are the fibre counts of the element-order map on
these quotients. *Rests on:* 3.1, Mathlib.

### 3.4 Subgroup counts

`Nat.card (Subgroup G)`, the conjugacy-class count of 3.3, `Nat.card {N : Subgroup G // N.Normal}`,
`Nat.card {N : Subgroup G // N.Characteristic}`; the inequalities between the four; the values for
`Multiplicative (ZMod n)`, `0 < n` (all `(Nat.divisors n).card`) and `QuaternionGroup 2` (`6, 6, 6, 3`:
only `⊥`, the centre and `⊤` are characteristic, since `Aut(Q₈) ≅ S₄` permutes `⟨i⟩, ⟨j⟩, ⟨k⟩`).
*Rests on:* Mathlib.

### 3.5 Power maps and order statistics

`ConjClasses.pow (C : ConjClasses G) (n : ℕ)` (`ConjClasses.mk g ↦ ConjClasses.mk (g ^ n)`), with
`pow_mul`, `pow_one`, the class order `ConjClasses.orderOf`. `orderStats G : Multiset ℕ :=
Multiset.map orderOf univ` with `(orderStats G).card = Nat.card G`, `count 1 = 1`, `count d = ∑ C
with orderOf C = d, C.carrier.ncard`, `Nat.totient` on divisors for cyclic `G`, and `Monoid.exponent
G` as the lcm of its support. *Rests on:* Mathlib.

### 3.6 Divisions

The relation `x ∼ y ↔ ∃ n, n.Coprime (orderOf x) ∧ IsConj (x ^ n) y` is an equivalence relation
(symmetry by an inverse of `n` modulo `orderOf x`); `Division G` is its quotient; `ConjClasses G →
Division G` is surjective, and `Division.mk x = Division.mk y ↔ ∃ g, zpowers (g * x * g⁻¹) = zpowers y`.
Element order and class size are constant on a division; `Nat.card (Division G) ≤ Nat.card
(ConjClasses G)` with equality iff `IsRationalGroup G` (1.4); `Nat.card (Division (Multiplicative (ZMod
n))) = (Nat.divisors n).card` for `0 < n`, `Nat.card (Division (alternatingGroup (Fin 4))) = 3`, `= 4`
for `A₅`. `div_stats` is the
fibre count of the order map on `Division G`. A **maximal division** is one whose representative
generates a maximal cyclic subgroup. *Rests on:* Mathlib.

### 3.7 Divisions as orbits of the cyclotomic action

With `e := Monoid.exponent G`, `(ZMod e)ˣ` acts on `ConjClasses G` by `u • C := C.pow u.val`
(3.5), and `Division G ≃ MulAction.orbitRel.Quotient (ZMod e)ˣ (ConjClasses G)`. Consequently the
Galois group `Gal(ℚ(ζ_e)/ℚ) ≃* (ZMod e)ˣ` (Mathlib `IsCyclotomicExtension.autEquivPow`) acts on
`ConjClasses G` with orbits the divisions, and `Nat.card (Division G)` is the number of
`ℚ`-conjugacy classes. This is the bridge to 6.3 and 8.1. *Rests on:* 3.5, 3.6, Mathlib.

## Layer 4: commutators, isoclinism and stem groups

### 4.1 Commutator length

With `open Pointwise`, `commutatorSet G ^ k` (products of `k` commutators);
`commutatorLength G := sInf {k | (commutator G : Set G) ⊆ commutatorSet G ^ k}`. Theorems: the
`sInf` is attained (`commutatorSet G ^ k` is increasing in `k` and exhausts `commutator G` for
finite `G`, since `commutatorSet G` generates and is closed under inverses);
`commutatorLength_eq_zero_iff : commutatorLength G = 0 ↔ IsMulCommutative G`;
`commutatorLength_le_one_iff : commutatorLength G ≤ 1 ↔ ∀ g ∈ commutator G, g ∈ commutatorSet G`;
`commutatorLength G = 2` for the two groups of order `96` with a non-commutator in `G'` (`96.3` of the
worked examples and `96.203`, each given by an explicit presentation; in each, `commutator G` has order
`32` and exactly `29` of its elements are commutators); **Guralnick's theorem**
`commutatorLength_le_one_of_card_lt`: every finite group `G` with `Nat.card G < 96` has
`commutatorLength G ≤ 1` (*Commutators and commutator subgroups*, Adv. Math. 45 (1982)), so the two
groups above are the smallest with a non-commutator in `G'`; invariance under `≃*`;
`commutatorLength (G × H) = max (commutatorLength G) (commutatorLength H)`. Also the connection to
Mathlib's `commProb`: `commProb G = Nat.card (ConjClasses G) / Nat.card G`. The proof route for
Guralnick's theorem is open: his argument, or a check over a proved classification of the groups
of each order `< 96`, which Tau Ceti does not have. *Rests on:* Mathlib.

### 4.2 The commutator map on the central quotient

`commutatorMap G : G ⧸ center G → G ⧸ center G → commutator G`, `commutatorMap (mk x) (mk y) =
⟨⁅x, y⁆, _⟩`, well defined because `⁅xz, y⁆ = ⁅x, y⁆` for central `z`. Its image generates
`commutator G`; naturality along `≃*`. *Rests on:* Mathlib.

### 4.3 Isoclinism

`structure Isoclinism G H` (*Pinned conventions*), `Isoclinic G H := Nonempty (Isoclinism G H)`,
an equivalence relation on finite groups (`refl`, `symm`, `trans` with the explicit composites);
`Isoclinic G (G × A)` for abelian `A`; `Isoclinic G H → Group.nilpotencyClass G =
Group.nilpotencyClass H` and `derivedLength G = derivedLength H` when both are nontrivial;
isoclinic groups have `Nat.card (commutator G) = Nat.card (commutator H)` and isomorphic central
quotients, but `Nat.card` is not an invariant (`C₂` and `C₄`). Every finite group is isoclinic to
a stem group (4.4). *Rests on:* 4.2, Mathlib.

### 4.4 Stem groups and stem extensions

`IsStemGroup G := center G ≤ commutator G`. In each isoclinism class the stem groups are exactly
the groups of minimal order, and `Nat.card G ∣ Nat.card H` for a stem `G` isoclinic to `H`
(Hall 1940). A **stem extension** of `G` is a surjective `π : E →* G` with `π.ker ≤ center E ⊓
commutator E`; `Nat.card π.ker` is bounded in terms of `G` and, for a stem extension of maximal
order, `π.ker` is isomorphic to the Schur multiplier: `Nonempty (π.ker ≃* Additive
(TauCeti.schurMultiplier ℂ G))`-type statement against the Schur multiplier as Tau Ceti and
Induction and Restriction Layer 7 (and Part II's Schur covers) define it; for perfect `G` the
maximal stem extension is unique up to `≃*`. Any two stem extensions of `G` of maximal order are
isoclinic. *Rests on:* 4.3, Tau Ceti, Induction and Restriction
Layer 7; Karpilovsky, *The Schur Multiplier*, Chapter 2.

## Layer 5: the subgroup lattice and faithful permutation degrees

### 5.1 The Möbius functions

`mobiusSub G H` and `mobiusQuo G N` (*Pinned conventions*) with the defining recursions
(Mathlib `mu_eq_neg_sum_Ioc_of_ne`, `mu_eq_neg_sum_Ico_of_ne`), `mobiusSub G ⊤ = 1`,
`mobiusSub_bot_cyclic : mobiusSub (⊥ : Subgroup (Multiplicative (ZMod n))) = ArithmeticFunction.moebius n`
for `0 < n`, invariance of `mobiusSub G H` under conjugation and automorphisms, Hall's vanishing
theorem `mobiusSub G H = 0` unless `H` is an intersection of maximal subgroups of `G` (hence
`mobiusSub G H = 0` whenever `¬ frattini G ≤ H`), and the
values `mobiusSub (Equiv.Perm (Fin 4)) ⊥ = -12`, `mobiusSub (alternatingGroup (Fin 5)) ⊥ = -60`,
`mobiusSub (alternatingGroup (Fin 4)) ⊥ = 4`, `mobiusSub (QuaternionGroup 2) ⊥ = 0`. *Rests on:*
Mathlib.

### 5.2 Eulerian functions and generating tuples

`eulerian G k` (*Pinned conventions*); Hall's formula `(eulerian G k : ℤ) = ∑ H : Subgroup G,
mobiusSub G H * (Nat.card H) ^ k` (Möbius inversion of `Nat.card G ^ k = ∑ H, eulerian H k` over
the lattice; Hall 1936, *Eulerian functions of a group*); `eulerian G k ≠ 0 ↔ Group.rank G ≤ k`
(Mathlib `Group.rank`); `MulAut G` acts freely on generating tuples, hence `Nat.card (MulAut G) ∣
eulerian G k`; `eulerianRatio G := eulerian G (Group.rank G) / Nat.card (MulAut G) : ℕ`, the LMFDB
Eulerian-function column (the number of `Aut`-orbits of minimal generating tuples). For `p`-groups,
`Group.rank G = Module.finrank (ZMod p) (G ⧸ frattini G)` (Burnside's basis theorem, from Mathlib's
`frattini_nongenerating` and Tau Ceti's `IsPGroup.index_eq_prime_of_isCoatom`). *Rests on:* 5.1,
Mathlib, Tau Ceti.

### 5.3 Faithful irreducible characters by Möbius inversion

With `k(G) := Nat.card (ConjClasses G)`: the number of irreducible complex characters with kernel
exactly `N` is given by Möbius inversion; in particular the number of faithful
irreducible characters of `G` is `∑ N : NormalSubgroup G, mobiusQuo G N * k(G ⧸ N)` (Möbius
inversion of `k(G ⧸ N) = ∑_{M ≥ N} #{χ | ker χ = M}` on `NormalSubgroup G`, using Tau Ceti's
`card_irreducibleCharacters` and the kernel API). Corollary: `G` has a faithful irreducible
character iff this sum is positive; for abelian `G` iff `IsCyclic G` (Gaschütz). *Rests on:* 5.1,
Tau Ceti.

### 5.4 Minimal faithful permutation and transitive degrees

`permutationDegree G := sInf {n | ∃ f : G →* Equiv.Perm (Fin n), Function.Injective f}`,
`transitiveDegree G := sInf {H.index | H.normalCore = ⊥}`, both attained and `≤ Nat.card G`
(Cayley). `transitiveDegree G` is the least degree of a faithful transitive action;
`permutationDegree G = sInf {∑ H ∈ s, H.index | s : Finset (Subgroup G), ⨅ H ∈ s, H.normalCore = ⊥}`
(Johnson 1971); `permutationDegree G ≤ transitiveDegree G`, with equality when `G` has a unique minimal
normal subgroup; for cyclic `G` of order `∏ pᵢ^aᵢ`, `permutationDegree G = ∑ pᵢ^aᵢ`;
`permutationDegree (Multiplicative (Fin n → ZMod p)) = n * p` for prime `p`; `permutationDegree (QuaternionGroup 2) = 8`;
`permutationDegree (alternatingGroup (Fin n)) = permutationDegree (Equiv.Perm (Fin n)) = n` for
`n ≥ 3`; `permutationDegree (Multiplicative (ZMod 4 × ZMod 4)) = 8` with `transitiveDegree = 16`.
*Rests on:* Mathlib.

## Layer 6: rational characters, Schur indices and faithful linear degrees

All representations here are over subfields of `ℂ`; `χ` ranges over `irreducibleCharacters ℂ G`
(Tau Ceti) and `e := Monoid.exponent G`.

### 6.1 Character fields

`characterField χ : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ (Set.range χ)`;
`characterField χ ≤ ℚ(ζ_e)` (Tau Ceti `char_mem_adjoin_of_isPrimitiveRoot`), hence
`IsGalois ℚ (characterField χ)` with abelian Galois group; `characterConductor χ : ℕ := sInf {n |
characterField χ ≤ ℚ(ζ_n)}` (the LMFDB `cyclotomic_n`), `characterConductor χ ∣ e`;
`Module.finrank ℚ (characterField χ) = ` the size of the orbit of `χ` under `(ZMod e)ˣ` (6.2).
*Rests on:* Tau Ceti, Mathlib.

### 6.2 The cyclotomic action and Galois orbits of characters

**Definition.** For `u : (ZMod e)ˣ` and `χ ∈ irreducibleCharacters ℂ G`, `u • χ` is the function
`g ↦ χ (g ^ u.val)`. It is again an irreducible character: it is the character of the Galois
conjugate `σ ∘ ρ` of a representation `ρ` affording `χ`, for any field automorphism `σ` of `ℂ`
acting as `ζ ↦ ζ ^ u.val` on the `e`-th roots of unity (Tau Ceti
`FDRep.map_character_eq_character_pow`; this is the action of `Gal(ℚ(ζₑ)/ℚ)` through
`IsCyclotomicExtension.autEquivPow`). That membership is the milestone's first theorem; given it,
`1 • χ = χ` and `(u * v) • χ = u • (v • χ)` hold because `g ^ e = 1`, so `(ZMod e)ˣ` acts on the
set `irreducibleCharacters ℂ G`. Its orbits are the Galois orbits, and `galoisOrbits G` is the
orbit quotient `MulAction.orbitRel.Quotient (ZMod e)ˣ (irreducibleCharacters ℂ G)`. Theorems:
`Nat.card (galoisOrbits G) = Nat.card (Division G)` (Brauer's permutation lemma, from the
character table being invertible and the two actions being permutation-isomorphic through it;
3.7); the stabilizer of `χ` is the kernel of `(ZMod e)ˣ → Gal(characterField χ/ℚ)`. *Rests on:*
3.7, 6.1, Tau Ceti.

**Checks.**

- (count) `Nat.card (galoisOrbits G)` is `5` for `S₄ = 24.12`, `Q₈ = 8.4` and `SL(2,3) = 24.3`,
  `3` for `A₄ = 12.3`, `4` for `A₅ = 60.5` and `7` for `SL(2,5) = 120.5`: the division counts of
  the worked examples.
- (trivial action) for a rational group (`Equiv.Perm (Fin 4)`, `QuaternionGroup 2`) every orbit is
  a singleton, so the orbit count equals `Nat.card (ConjClasses G)`.
- (nontrivial orbit) for `C₃ = Multiplicative (ZMod 3)` (`e = 3`), `u = -1` sends the character
  with `χ g = ω` to the one with value `ω²`: two orbits, matching the two divisions of `C₃`.
- (A₅) the two degree-`3` characters of `alternatingGroup (Fin 5)` form the only orbit of size
  `2`; the other three orbits are singletons.

### 6.3 Rational irreducible characters and the rational character table

**Definition.** For an orbit `o : galoisOrbits G` (6.2), `rationalCharacter o : G → ℂ` is the
pointwise sum of the irreducible characters in `o`, a finite set: `g ↦ ∑ χ ∈ o, χ g`. It takes
values in `ℤ` (a sum over a full Galois orbit of algebraic integers in an abelian extension is a
rational integer), is constant on divisions (3.6), and the family is a `ℚ`-basis of the `ℚ`-span of
class functions constant on divisions. `rationalCharacterTable G : Matrix (galoisOrbits G)
(Division G) ℤ` has entry `rationalCharacter o g` at a representative `g` of the division, is
square by 6.2 and invertible over `ℚ`; `rationalDegree o := rationalCharacter o 1`, which is the
orbit size times `characterDegree χ`. The LMFDB `ratchars`, `ratrep_stats` (`(d, m)` = number of
orbits of rational degree `d`) read off this table; the row/column *orderings* are database
conventions, not targets. *Rests on:* 6.2, 3.7, Tau Ceti.

**Checks.**

- (C₃) the orbit of the two nontrivial characters of `Multiplicative (ZMod 3)` has rational
  character `2, -1, -1` on `1, g, g²` (`ω + ω² = -1`); the trivial orbit gives `1, 1, 1`.
- (A₅) the orbit of the two degree-`3` characters has rational character `6, -2, 0, 1, 1` on the
  classes of `1`, double transpositions, `3`-cycles and the two classes of `5`-cycles (the values
  `(1 ± √5)/2` add to `1`), so `rationalDegree = 6`.
- (rational group) for `QuaternionGroup 2` the rational characters are the five irreducible
  characters themselves, with rational degrees `1, 1, 1, 1, 2`.
- (shape) the rational character table of `A₄ = 12.3` is `3 × 3`, one row and column per division.

### 6.4 The Schur index

`schurIndex F χ` (*Pinned conventions*) for `F : IntermediateField ℚ ℂ`, realizability being decided
from the character by Tau Ceti's `FDRep.exists_nonempty_iso_baseChange_iff`. Theorems: `schurIndex ℂ χ
= 1`; `schurIndex F χ ∣ characterDegree χ`; `schurIndex F χ ∣ [E : F(χ)]` for every realization field
`E` (Isaacs, *Character Theory*, Chapter 10); the minimal `F`-irreducible representation containing
`χ` has character `schurIndex F χ • ∑_{σ ∈ Gal(F(χ)/F)} σχ`; **Brauer–Speiser**: real-valued `χ` has
`schurIndex ℚ χ ≤ 2` (Isaacs Chapter 10); `schurIndex ℝ χ = 1 ↔ frobeniusSchurIndicator χ ≠ -1`
(Character Theory Layer 7); `schurIndex ℚ χ = 2` for the degree-two character of `QuaternionGroup 2`,
`= 1` for every character of `DihedralGroup 4` and of `Equiv.Perm α`
([Schur–Weyl](../RepresentationTheory/SchurWeyl/README.md)). *Rests on:* 6.1, Tau Ceti.

### 6.5 Rational representations

For `W : FDRep ℚ G` irreducible, its character is `schurIndex ℚ χ • rationalCharacter o` for a
unique orbit `o ∋ χ`, and `Module.finrank ℚ W = schurIndex ℚ χ * rationalDegree o`; conversely every
orbit arises. The map `galoisOrbits G ≃ {irreducible ℚ-representations}/≅` (Tau Ceti `Realization`
for existence; Schur's lemma and `char_iso` for uniqueness). `FDRep.intCharacter` (Tau Ceti) is the
character of `W`. *Rests on:* 6.3, 6.4, Tau Ceti.

### 6.6 Rational groups by characters

`IsRationalGroup G ↔ ∀ χ ∈ irreducibleCharacters ℂ G, ∀ g, χ g ∈ (algebraMap ℚ ℂ).range`
(via 3.7 and 6.2: all divisions are classes iff `(ZMod e)ˣ` fixes every class iff it fixes every
character). Corollary: `IsRationalGroup G ↔ Nat.card (galoisOrbits G) = Nat.card (ConjClasses G)`.
*Rests on:* 1.4, 3.7, 6.2.

### 6.7 Monomial groups

`IsMonomial G := ∀ χ ∈ irreducibleCharacters ℂ G, ∃ (H : Subgroup G) (λ : H →* ℂˣ), χ =
TauCeti.indClassFun (ofLinearCharacter λ)` (induced class function of a degree-one character, Tau
Ceti `Induction.LinearCharacter`/`Induction.Monomial`). Theorems: `IsSupersolvable G → IsMonomial G`
(Isaacs *Character Theory*, Chapter 6: a supersolvable group is an M-group, via the normal cyclic
series and Clifford theory, Induction and Restriction Layer 5); `Group.IsNilpotent G → IsMonomial G`
(Tau Ceti `exists_nonempty_iso_indFDRep_ofLinearCharacter_of_isNilpotent`); solvable A-groups are
monomial (Taunt; Isaacs Chapter 6); **Taketa**: `IsMonomial G → Group.IsSolvable G` (Isaacs
Chapter 5, Taketa's theorem, proved from the degree bound on the derived length); closed under
quotients and finite products (not under subgroups, by Dade's example, which is not constructed
here); `¬ IsMonomial (SpecialLinearGroup (Fin 2) (ZMod 3))` (order `24`, the smallest solvable
non-M-group: its degree-two characters are not induced); `IsMonomial (alternatingGroup (Fin 4))` while
`A₄` is not supersolvable (1.1). With `SL(2,3)` this extends the diagram 1.9 by supersolvable →
monomial → solvable, both arrows strict. *Rests on:* 1.1, 1.3, 1.9, Tau Ceti, Induction and Restriction
Layers 2, 5.

### 6.8 Minimal faithful linear degrees

`linDegree k G`, `irrDegree k G : ℕ∞` for `k ∈ {ℂ, ℝ, ℚ}` (*Pinned conventions*). Character-table
characterizations: `irrDegree ℂ G = sInf {characterDegree χ | ker χ = ⊥}`, faithfulness being
decidable from the table by `FDRep.mem_ker_iff_char_eq` (`χ g = χ 1 ↔ g ∈ ker`); `linDegree ℂ G =
sInf {∑ χ ∈ s, characterDegree χ | ⨅ χ ∈ s, ker χ = ⊥}` (`FDRep.coe_iInf_ker`); `G` has a faithful
irreducible character iff `socle G` is generated by one conjugacy class (for abelian `G`: iff `IsCyclic
G`; 5.3 gives the count); over `ℝ` through the Frobenius–Schur indicator (a real irreducible
representation is a real-type `χ` or `χ + χ̄`; Character Theory Layer 7); `irrDegree ℚ G = sInf
{schurIndex ℚ χ * rationalDegree o | o faithful}` and `linDegree ℚ G` the corresponding sum (6.5).
Values: `irrDegree ℂ (Equiv.Perm (Fin 4)) = 3`, `irrDegree ℂ (QuaternionGroup 2) = 2`, `irrDegree ℚ
(QuaternionGroup 2) = 4`, `irrDegree ℂ (Multiplicative (ZMod 4 × ZMod 4)) = ⊤` with `linDegree ℂ = 2`.
The LMFDB `irrC_degree`, `linC_degree`, `irrR_degree`, `linR_degree`, `irrQ_dim`, `linQ_dim`,
`faithful_reps` (triples degree, indicator, count over faithful `χ`) and `smallrep` are these.
*Rests on:* 0.7, 5.3, 6.4, 6.5, Tau Ceti.

## Layer 7: Gassmann classes and arithmetic equivalence

### 7.1 Gassmann classes of subgroups

Gassmann equivalence is `Subgroup.AlmostConjugate` (Tau Ceti). `GassmannClasses G :=
Quotient` of `MulAction.orbitRel.Quotient (ConjAct G) (Subgroup G)` by the relation induced by
`AlmostConjugate` (well defined by `almostConjugate_conj_smul_iff`); the map `(conjugacy classes of
subgroups) → GassmannClasses G` is surjective; a Gassmann class determines `Nat.card H`, `H.index`,
the intersection numbers with every conjugacy class, the permutation character `g ↦ Nat.card
(fixedBy (G ⧸ H) g)`, and the full cycle type of every `g` on `G ⧸ H` (the fixed-point counts of all
powers determine `fullCycleType`); `gassmannCount G H : ℕ := ` the number of conjugacy classes of
subgroups almost conjugate to `H` **other than** that of `H`. *Rests on:* Tau Ceti.

### 7.2 Gassmann triples: existence and small degrees

A **Gassmann triple** is `(G, H, K)` with `AlmostConjugate H K` and `¬ ∃ g, H.map (MulAut.conj g) =
K`. Existence: Induction and Restriction 2.2 (`C₄ × C₄`, `Q₈ × C₂` in `S₁₆`) and
`GL (Fin 3) (ZMod 2)` with the stabilizers of a point and of a line of the Fano plane (index `7`,
not conjugate, almost conjugate: both actions have the same permutation character since the
inverse-transpose automorphism interchanges them). Non-existence in small index: for every
transitive `G ≤ Equiv.Perm (Fin n)` with `n ≤ 6`, `gassmannCount G (stabilizer 0) = 0`, as a
decidable check over the reference groups of Polynomial Galois Groups Layers 6 and 1C–1D; for
`n = 7` exactly one reference group (`7T5 = GL(3,2)`) has `gassmannCount = 1`, and for `n = 8`
exactly `8T15` and `8T23 = GL(2,3)` do. *Rests on:* 7.1, Tau Ceti, Polynomial Galois Groups.

### 7.3 Finite-index subgroups through a common quotient

For a group `Γ` (no finiteness) and finite-index subgroups `H, K` with a common normal subgroup `N
≤ H ⊓ K` of finite index: `AlmostConjugate (H.map (mk' N)) (K.map (mk' N))` in `Γ ⧸ N` is
independent of the choice of `N` (passing to a smaller `N'` preserves it, by the fixed-coset
criterion `almostConjugate_iff_forall_natCard_fixedBy_eq` applied to `Γ ⧸ H ≃ (Γ ⧸ N) ⧸ (H ⧸ N)`),
and is equivalent to `∀ γ : Γ, Nat.card (fixedBy (Γ ⧸ H) γ) = Nat.card (fixedBy (Γ ⧸ K) γ)`. Define
`Subgroup.AlmostConjugateOfFiniteIndex H K` by the latter and prove the reduction. For a profinite
`Γ` and open `H, K`, the common quotient is `Γ ⧸ N` for any open normal `N ≤ H ⊓ K`; for `Γ = GL₂(ẑ)`
and `N` the kernel of reduction modulo a common level `M`, this is almost conjugacy in `GL₂(ℤ/M)`.
This milestone is what the modular-curve `gassmann_class` of the sibling
`AdelicImagesAndModularCurves` consumes. *Rests on:* Tau Ceti, Mathlib.

### 7.4 Perlis' theorem

For `L/ℚ` finite Galois with group `G`, `H, K ≤ G`, `F = L^H`, `F' = L^K`: `NumberField.dedekindZeta F
= NumberField.dedekindZeta F'` iff `AlmostConjugate H K`. (⇐) `ζ_F` is the Artin `L`-function of the
permutation representation on `G ⧸ H` (sibling `ArtinRepresentations`), and almost conjugate subgroups
have isomorphic permutation representations (`Gassmann.almostConjugate_iff_permutation_equiv`). (⇒)
Equal zeta functions have equal Dirichlet coefficients (`LSeries_eq_zero_iff`); for `p` unramified
in `L` with Frobenius `g`, the number of degree-one primes of `F` above `p` is `Nat.card (fixedBy (G ⧸
H) g)` (Number Field Arithmetic 1.4); Chebotarev supplies every `g`; conclude by
`almostConjugate_iff_forall_natCard_fixedBy_eq`. Name: `dedekindZeta_eq_iff_almostConjugate`. *Rests
on:* 7.1, Number Field Arithmetic 1.4, 2.1–2.3, Chebotarev, the sibling `ArtinRepresentations`, Tau
Ceti, Mathlib; Perlis 1977.

### 7.5 Invariants of arithmetically equivalent fields

For `F, F'` as in 7.4 with `AlmostConjugate H K`: equal degree (`AlmostConjugate.index_eq`), equal
discriminant (the conductor–discriminant formula for the permutation representation, sibling
`ArtinRepresentations`), equal signature (fixed points of complex conjugation on `G ⧸ H`), equal
Galois closure, equal unit rank and roots-of-unity order, equal splitting type at every unramified
prime, and equal products `h · R` of class number and regulator (the class number formula, consumed
as the identity it states). Class numbers alone need not agree: the existence of such a pair is
stated, resting on de Smit–Perlis' degree-`8` example. *Rests on:* 7.4, the sibling
`ArtinRepresentations`, Number Field Arithmetic.

### 7.6 The count of arithmetically equivalent fields

For a number field `F` of degree `n` with Galois closure group `G ≤ Equiv.Perm (Fin n)` (Polynomial
Galois Groups' permutation image) and point stabilizer `H`: the number of isomorphism classes of
number fields arithmetically equivalent to and not isomorphic to `F` is `gassmannCount G H` (7.1), by
7.4 and the Galois correspondence (conjugate subgroups ↔ isomorphic fields). This is the LMFDB
`arith_equiv` of `nTj` and the `nf` "arithmetically equivalent fields" datum; it is `0` for every `F`
of degree `≤ 6` (7.2), and `1` for degree `7` fields with group `7T5`. *Rests on:* 7.2, 7.4.

## Layer 8: Malle invariants of a permutation group

`G ≤ Equiv.Perm α`, `α` finite, `G` transitive and nontrivial; `malleIndex`, `malleIndexGroup`,
`malleA`, `malleB` are Arithmetic Statistics Part V §3.9's.

### 8.1 `b` over `ℚ` as a count of divisions

`malleB ⊤ G = Nat.card {D : Division G | malleIndex D = malleIndexGroup G}` (index is constant on
divisions by `malleIndex_pow_of_isUnit` and `malleIndex_conj`, and the `(ZMod e)ˣ`-orbits on classes
are the divisions, 3.7). Also `malleIndex g = Nat.card α - (g.fullCycleType).card`
(Tau Ceti `fullCycleType`) and `malleIndex g = ∑ over cycleType of (length - 1)`. *Rests on:* 3.7,
Arithmetic Statistics Part V, Tau Ceti.

### 8.2 `d(G)` and the minimal-index subgroup

`malleD G := (Finset.univ.filter (fun g ↦ g ≠ 1 ∧ malleIndex g = malleIndexGroup G)).lcm orderOf`
(`d(G)`); `minIndexSubgroup G := Subgroup.closure {g | g ≠ 1 ∧ malleIndex g =
malleIndexGroup G}`, normal in `G`. `IsConcentrated G := minIndexSubgroup G < ⊤`;
`IsSemiconcentrated G := ∃ g ≠ 1, malleIndex g = malleIndexGroup G ∧ Subgroup.normalClosure {g} < ⊤`;
`IsConcentrated G → IsSemiconcentrated G`; neither holds for `Equiv.Perm (Fin n)` (`n ≥ 2`, the
transpositions generate); `IsConcentrated` holds for `C₃ ≀ C₂ ≤ S₆` (`6T5`: minimal index `2`, the
minimal-index elements lie in `C₃ × C₃`). *Rests on:* 8.1, Mathlib.

### 8.3 Elusive groups

`IsElusive G := ¬ ∃ g ∈ G, (orderOf g).Prime ∧ ∀ x, g x ≠ x` for transitive `G` (every transitive
group has a fixed-point-free element of prime-power order, Fein–Kantor–Schacher, so only prime order
is at stake). `¬ IsElusive G` for `Nat.card α` prime (a transitive group of prime degree contains a
`p`-cycle); the degree-`12` Mathieu group `M₁₁` is elusive (not constructed here); for `n ≤ 11` no
transitive group is elusive, a decidable check over the reference groups (Polynomial Galois Groups
1C–1D). *Rests on:* Polynomial Galois Groups, Mathlib.

## Layer 9: integral representations and unit modules

### 9.1 `ℤ[G]`-lattices and indecomposability

A `ℤ[G]`-lattice (*Pinned conventions*); indecomposability is Tau Ceti's `IsIndecomposableModule`
(*What Tau Ceti supplies*); `ℤ[G]`, the trivial lattice, the
augmentation ideal, permutation lattices `ℤ[G ⧸ H]`, duals, tensor products, `Module.finrank ℤ L`,
`L ⊗ ℚ` with its character (6.5); every lattice is a finite direct sum of indecomposables.
**Jordan–Zassenhaus**: finitely many isomorphism classes of `ℤ[G]`-lattices of each rank
(Curtis–Reiner, *Methods I*, via the finiteness of the class group of a maximal order and of the
lattices between `L` and `(Nat.card G) • L`). *Rests on:* Mathlib, Classical Arithmetic Completion
7.54, 7.77.

### 9.2 Diederichsen–Reiner: `ℤ[C_p]`-lattices

With `ℤ[C_p] ≃ ℤ[X]/(X^p - 1)` and maximal order `ℤ × ℤ[ζ_p]` (Classical Arithmetic Completion 7.40):
the indecomposable `ℤ[C_p]`-lattices are the trivial lattice `ℤ`, the ideals `𝔞 ≤ ℤ[ζ_p]` (one per
class of `ClassGroup ℤ[ζ_p]`) and one non-split extension `(𝔞, ℤ)` per class: `2 h_p + 1` classes
(Reiner 1957; Curtis–Reiner 1962, §74). For `p ≤ 19` (`h_p = 1`) exactly three: `ℤ`, `ℤ[C_p]/(N)`
(`N` the norm element), `ℤ[C_p]`. Every `ℤ[C_p]`-lattice is a direct sum of these with multiplicities
determined by the lattice. The LMFDB `gg.int_modules` lists these decompositions. *Rests on:* 9.1,
Classical Arithmetic Completion 7.40.

### 9.3 The unit lattice of a Galois extension as a `ℤ[G]`-lattice

For a finite Galois extension `K/ℚ` with group `G`, `unitLattice K := Additive ((𝓞 K)ˣ ⧸
NumberField.Units.torsion K)`, a free `ℤ`-module of rank `NumberField.Units.rank K = r₁ + r₂ - 1`
(Mathlib's Dirichlet unit theorem; Mathlib's `NumberField.Units.unitLattice K` is its image under the
logarithmic embedding), is a `ℤ[G]`-lattice through the Galois action on `(𝓞 K)ˣ`. Herbrand's unit
theorem: the character of `unitLattice K ⊗ ℚ` is `π_∞ - 1`, where `π_∞` is the permutation character
of `G` on the set of infinite places of `K` (the `G`-set `G ⧸ G_∞`, `G_∞` the decomposition group of one
infinite place). *Rests on:* 9.1, Mathlib.

### 9.4 Biquadratic fields: Kuroda's unit index and the module types

For `K` biquadratic (Multiquadratic Layer 0) with quadratic subfields `k₁, k₂, k₃` and `G = C₂ × C₂`:
`unitIndex K := (Subgroup.closure ((𝓞 k₁)ˣ ∪ (𝓞 k₂)ˣ ∪ (𝓞 k₃)ˣ)).index` in `(𝓞 K)ˣ`, with
`unitIndex K ∈ {1, 2, 4}` for totally real `K` and `∈ {1, 2}` for imaginary `K` (Kuroda; Lemmermeyer
1994); for totally real `K` with fundamental units `εᵢ` of the `kᵢ` and `L₀ := ⟨ε₁, ε₂, ε₃⟩ ≤
unitLattice K` (character `ρ_reg - 1`, each `εᵢ` spanning the `χᵢ`-isotypic line), `ε² ∈ L₀` for every
unit `ε`, so `unitLattice K ⧸ L₀` is a subgroup of `½L₀ ⧸ L₀ ≃+ (Fin 3 → ZMod 2)` of order `unitIndex K`;
the `ℤ[C₂ × C₂]`-isomorphism type of `unitLattice K` is determined by this subgroup (every
`ℤ[C₂ × C₂]`-automorphism of `L₀` is diagonal `±1`), so at most `15` types occur, `7` up to
`MulAut (C₂ × C₂)`, and Kubota's theorem (Kubota 1956) is the list of those that do; the class-number
formula `h(K) = unitIndex K · h(k₁) h(k₂) h(k₃) / 4` (totally real; `/ 2` imaginary) is consumed from
the class-group roadmaps. The LMFDB "Galois module structure of units" for biquadratic fields is this
type. *Rests on:* 9.3, Multiquadratic Layer 0, Mathlib.

## Layer 10: finite subgroups of `GL_n(ℤ)`, `GL_n(ℚ)` and `GL_n(ℂ)`

### 10.1 Finite subgroups of `GL_n(ℚ)` stabilize lattices

For a finite `G ≤ GL (Fin n) ℚ`: `∑ g ∈ G, g • ℤ^n` is a `G`-stable full lattice, so `G` is
conjugate in `GL (Fin n) ℚ` to a subgroup of `GL (Fin n) ℤ`; `ℚ`-classes of finite subgroups of
`GL (Fin n) ℚ` are in bijection with `GL (Fin n) ℚ`-conjugacy classes of finite subgroups of
`GL (Fin n) ℤ`, and each `ℚ`-class is a finite union of `ℤ`-classes (Jordan–Zassenhaus 9.1 applied to
the `ℤ[G]`-lattice `ℤ^n`). *Rests on:* 9.1, Mathlib.

### 10.2 Minkowski's reduction lemma and order bound

For a prime `p ≥ 3`, the kernel of `GL (Fin n) ℤ →* GL (Fin n) (ZMod p)` has no nontrivial element of
finite order (for `p = 2` only `2`-torsion); hence every finite `G ≤ GL (Fin n) ℤ` embeds in `GL (Fin
n) (ZMod 3)` and `Nat.card G ∣ Nat.card (GL (Fin n) (ZMod 3))` (Mathlib `Matrix.card_GL_field`); the
sharp Minkowski bound `Nat.card G ∣ M(n) := ∏_p p^{⌊n/(p-1)⌋ + ⌊n/(p(p-1))⌋ + ⋯}` (Serre 2007, §1),
`M(n)` being the lcm of the orders of the finite subgroups of `GL_n(ℚ)`. With 10.1, each dimension
has finitely many `ℤ`-classes. *Rests on:* 10.1, Mathlib.

### 10.3 The classifications in dimensions one, two and three

Theorems with explicit lists of generating integer matrices, proved complete and irredundant:
`n = 1`: two `ℤ`-classes, two `ℚ`-classes. `n = 2`: thirteen `ℤ`-classes (`C₁, C₂, C₃, C₄, C₆, D₄, D₆`
once each, `D₁, D₂, D₃` twice each) and ten `ℚ`-classes. `n = 3`: `73` `ℤ`-classes and `32`
`ℚ`-classes (the arithmetic and geometric crystal classes). Route: 10.2 bounds the orders and element
orders, 6.5 enumerates the `ℚ`-classes from integral characters, and the `ℤ`-classes inside a
`ℚ`-class are the finitely many `G`-stable lattices between `L` and `|G| · L`, a decidable
enumeration. *Rests on:* 10.2, 6.5; Newman, Chapter IX; Brown et al. 1978.

### 10.4 The certificate interface for `n ≥ 4`

`IsZClassList n (L : List (Finset (GL (Fin n) ℤ)))`: every entry generates a finite subgroup, no two
are conjugate, and every finite subgroup is conjugate to an entry; likewise `IsQClassList` for
conjugacy in `GL (Fin n) ℚ`. The first two clauses are decidable (10.2; conjugacy by a bounded search
over lattice bases). In dimension four the counts are theorems (Brown et al. 1978):
`card_zClasses_four : Nat.card (ZClasses 4) = 710`, and there are `227` `ℚ`-classes, the
`GL (Fin 4) ℚ`-conjugacy classes of finite subgroups of `GL (Fin 4) ℚ`. With them the third clause
for `n = 4` follows from the first two and the length of the list: a list of `710` pairwise
non-conjugate finite subgroups satisfies `IsZClassList 4`, and a list of `227` satisfies
`IsQClassList 4`. The proof route for the counts is open: the route of 10.3 (10.2 bounds the orders,
6.5 enumerates the `ℚ`-classes from integral characters, and the `ℤ`-classes inside a `ℚ`-class are the
`G`-stable lattices between `L` and `|G| · L`) is a decidable but large enumeration.
*Rests on:* 10.3.

**Checks.**

- (refinement) by 10.1 every `ℚ`-class contains a `ℤ`-class, so `ℤ`-classes map onto `ℚ`-classes and
  `710 ≥ 227`; in dimensions `1, 2, 3` the pairs are `(2, 2)`, `(13, 10)`, `(73, 32)` (10.3).
- (Minkowski) every finite subgroup of `GL (Fin 4) ℤ` has order dividing `M(4) = 2⁷ · 3² · 5 = 5760`
  (10.2); the largest order attained is `1152`, the Weyl group of `F₄`, which divides `5760`.

### 10.5 Finite subgroups of `GL_n(ℂ)` and Jordan's theorem in characteristic zero

Conjugacy classes of finite subgroups of `GL (Fin n) ℂ` correspond to faithful degree-`n` characters
of finite groups modulo `MulAut G` and isomorphism (Maschke, `char_iso`, 6.8). A finite subgroup of
`GL (Fin n) ℂ` is conjugate into `U(n)`; `irrDegree ℂ G`, `linDegree ℂ G` are the least `n` with an
irreducible, resp. any, embedding. The LMFDB `glnC` `dimension` and `irreducible` columns are `n`
and `Representation.IsIrreducible`.

**Jordan's theorem.** `jordanBound n : ℕ` is the least `J` such that every finite subgroup of
`GL (Fin n) ℂ` has an abelian normal subgroup of index at most `J` (an `sInf` on `ℕ`, the optimal
Jordan constant). Prove:
- `jordan_exists_abelian_normal_index_le`: for every field `F` of characteristic zero, every finite
  `G ≤ GL (Fin n) F` has an abelian normal subgroup of index at most `jordanBound n`. Route: the
  entries of the elements of `G` generate a finitely generated subfield of `F`, which embeds in `ℂ`,
  so `F = ℂ`; there, averaging a Hermitian form conjugates `G` into `U(n)`, the elements of `G`
  within a fixed small distance of `1` generate an abelian normal subgroup because commutators
  shrink (`‖[g, h] − 1‖ ≤ 2 ‖g − 1‖ ‖h − 1‖` in `U(n)`), and a packing count of its cosets in
  `U(n)` bounds the index by a function of `n` (Curtis–Reiner 1962, §36). Characteristic zero is
  necessary: for `p ≥ 5` the abelian normal subgroups of `SL(2, p) ≤ GL (Fin 2) (ZMod p)` lie in
  the centre `{±1}`, of index `p(p² − 1)/2`, unbounded in `p`.
- `jordan_exists_abelian_normal_index_le_of_finite_map` (**finite modulo scalars**): if
  `B ≤ GL (Fin n) F`, `F` of characteristic zero, has finite image under
  `Matrix.ProjGenLinGroup.mk`, then `B` has an abelian normal subgroup of index at most
  `jordanBound n`. Route: over an algebraic closure `F̄` (the image of `B` in `PGL(n, F̄)` is still
  finite), `Γ₁ := F̄^× B ∩ SL_n(F̄)` is finite (its image in `PGL` is finite and its scalars are the
  `n`-th roots of unity) and `F̄^× B = F̄^× Γ₁` (take `n`-th roots of determinants); for
  `A₁ ⊴ Γ₁` abelian of index at most `jordanBound n`, `B ∩ F̄^× A₁` is abelian, normal in `B`, and of
  index at most `[Γ₁ : A₁]`.
- `finrank_le_jordanBound`: if moreover `F` is algebraically closed, every irreducible
  finite-dimensional representation of such a `B` over `F` has dimension at most `jordanBound n`.
  Route: a common eigenvector of that abelian normal subgroup and its translates by coset
  representatives span a `B`-stable subspace.
- `jordanBound_le_schur`: Schur's explicit bound
  `jordanBound n ≤ (√(8n) + 1)^{2n²} − (√(8n) − 1)^{2n²}` for `n ≥ 1` (Curtis–Reiner 1962, §36;
  at `n = 0` the right side is `0` while `jordanBound 0 = 1`).
- Collins' value: `jordanBound n = (n + 1)!` for `n ≥ 71`, attained by `S_{n+1}` on its
  `n`-dimensional standard representation (Collins 2007), stated as the implication from `CFSG`.
- `jordanBound 1 = 1` (finite subgroups of `ℂ^×` are abelian) and `jordanBound 2 ≥ 60` (the
  worked example `SL(2,5)`).

`SatoTateGroups` 7.1 consumes `jordanBound` and `jordan_exists_abelian_normal_index_le` as stated
here. *Rests on:* 6.8, Mathlib, CFSGStatement.

## Explicit scope exclusions

- No classification of groups of a given order, of transitive groups or of `p`-groups, and no list
  of the finite subgroups of `GL_n(ℤ)` for `n ≥ 4` (10.4 states the counts in dimension four and
  the certificate interface only). Stored tables and their completeness are not targets.
- No identifiers, hashes, orderings or normal forms; no `pc_code`, `elt_rep_type`, `tex_name`,
  chosen matrix or permutation models, or "known"/"complete" flags.
- No character-table computation, no modular representation theory, no Brauer characters or blocks.
- No profinite or infinite groups beyond 7.3; no topological `Out`.
- No families with parameters; `direct_product`, `semidirect_product`, `central_product` and
  `wreath_product` are the one-line Mathlib statements `∃ N K, IsComplement' N K ∧ N.Normal ∧
  K.Normal`, `∃ N K, IsComplement' N K ∧ N.Normal`, `∃ N K, N.Normal ∧ K.Normal ∧ N ⊔ K = ⊤ ∧
  ⁅N, K⁆ = ⊥` and "isomorphic to a nontrivial wreath product", recorded without a milestone.
- No Malle conjecture, field counting, `malle_c`, `malle_turkelli_b`, `malle_wang_b`.
- No Artin `L`-functions or conductors, no class number formula, no computation of unit groups.
- No Galois-module structure of rings of integers or class groups; no `ℤ[G]`-lattices beyond 9.1 and
  the cases `C_p`, `C₂ × C₂`.

## Coverage map (LMFDB column → milestone)

Mathlib: `order`, `exponent`, `abelian`, `cyclic`, `nilpotent`, `nilpotency_class`, `solvable`,
`simple`, `perfect`, `Zgroup`, `pgroup`, `metabelian`, `center`, `commutator`, `frattini`,
`abelian_quotient`, `central_quotient`, `number_conjugacy_classes`, `hall`, `sylow`. 0.2–0.5:
`chief_series`, `composition_factors`, `composition_length`. 0.6: `derived_length`. 0.7–0.8:
`socle`, `fitting`, `radical`. 0.9: `smith_abelian_invariants`, `primary_abelian_invariants`.
1.1–1.8, 6.7: `supersolvable`, `metacyclic`, `Agroup`, `rational`, `quasisimple`, `almost_simple`,
`complete`, `elementary`, `hyperelementary`, `monomial`. 3.1–3.2: `aut_order`, `outer_order`,
`aut_group`, `outer_group`, `aut_*`, `outer_*`. 3.3–3.7: `number_autjugacy_classes`,
`aut_stats`, `cc_stats`, `number_subgroups`, `number_subgroup_classes`, `number_normal_subgroups`,
`number_characteristic_subgroups`, `order_stats`, `number_divisions`, `div_stats`. 4.1–4.4:
`commutator_count`, isoclinism, stem. Induction and Restriction 7 with 0.9: `schur_multiplier`.
5.1–5.4: `mobius_sub`, `mobius_quo`, `rank`, the Eulerian function, `permutation_degree`,
`transitive_degree`. 6.1–6.8: `cyclotomic_n`, `ratchars`, `ratrep_stats`, `schur_index`,
`irrC_degree`, `linC_degree`, `irrR_degree`, `linR_degree`, `irrQ_dim`, `linQ_dim`, `faithful_reps`,
`smallrep` (`irrep_stats`, `indicator`, `type`: Character Theory). 7.3–7.6: `gassmann_class`
(modcurve), `arith_equiv`, arithmetically equivalent fields. 8.1–8.3: `b(ℚ, G)`, `d(G)`,
concentrated, semiconcentrated, elusive (`malle_a`: Arithmetic Statistics Part V). 9.2, 9.4:
`int_modules`, unit module types. 10.1–10.5: the `glnQ`, `glnC` sections and `gps_zrep`.

## Worked examples (acceptance criteria)

Every number was recomputed in GAP; LMFDB labels are `order.index`.

- **`S₄ = 24.12`** (`Equiv.Perm (Fin 4)`): `fittingSubgroup = socle = V₄` (order `4`),
  `solvableRadical = ⊤`, chief factors `[C₂, C₃, V₄]` with `compositionLength = 4`,
  `derivedLength = 3`; not supersolvable, not metabelian, monomial, rational, not an A-group;
  `Nat.card (MulAut) = 24`, `Nat.card Out = 1`, complete; `5` classes, `5` divisions, `5` autjugacy
  classes; `commutatorLength = 1`; `Group.rank = 2`; `30` subgroups in `11` classes, `4` normal,
  `4` characteristic; `mobiusSub ⊥ = -12`; Schur multiplier `C₂`; `permutationDegree =
  transitiveDegree = 4`; `irrDegree ℂ = 3`; all Frobenius–Schur indicators `1`; order statistics
  `1¹ 2⁹ 3⁸ 4⁶`; `malleIndexGroup = 1`, `malleB ⊤ = 1`, `malleD = 2` as `4T5`.
- **`Q₈ = 8.4`** (`QuaternionGroup 2`): centre, commutator and Frattini subgroup all `C₂`,
  `fittingSubgroup = ⊤`, `socle = C₂`, chief factors `[C₂, C₂, C₂]`; nilpotency class `2`,
  `derivedLength = 2`; metacyclic, supersolvable, rational, not an A-group; `Nat.card (MulAut) = 24`,
  `Nat.card Out = 6`; `5` classes, `5` divisions, `3` autjugacy classes; `commutatorLength = 1`;
  rank `2`; `6` subgroups, all normal, `3` characteristic; `mobiusSub ⊥ = 0`; trivial Schur
  multiplier; `permutationDegree = transitiveDegree = 8`; `irrDegree ℂ = 2`, `irrDegree ℚ = 4`
  (Schur index `2`); indicators `-1` once, `1` four times; order statistics `1¹ 2¹ 4⁶`.
- **`A₄ = 12.3`**: `fittingSubgroup = socle = V₄`, chief factors `[C₃, V₄]`, `compositionLength = 3`,
  `derivedLength = 2`; metabelian, monomial, an A-group, not supersolvable (the smallest solvable
  non-supersolvable group), not rational; `Nat.card Out = 2`; `4` classes, `3` divisions, `3`
  autjugacy classes; `mobiusSub ⊥ = 4`; Schur multiplier `C₂`; `permutationDegree = 4`;
  `irrDegree ℂ = 3`; `malleIndexGroup = 2`, `malleB ⊤ = 2`, `malleD = 6` as `4T4`.
- **`SL(2,3) = 24.3`**: centre `C₂`, `commutator = fittingSubgroup = Q₈`, `socle = C₂`, chief
  factors `[C₃, V₄, C₂]`, `derivedLength = 3`; solvable, **not monomial** (the smallest), not
  supersolvable, not metabelian; `Nat.card Out = 2`; `7` classes, `5` divisions, `5` autjugacy
  classes; trivial Schur multiplier; `permutationDegree = 8`; `irrDegree ℂ = 2`; indicators `-1`
  once, `0` four times, `1` twice.
- **`A₅ = 60.5`**: `fittingSubgroup = solvableRadical = ⊥`, `socle = ⊤`, one chief factor,
  `compositionLength = 1`; simple, perfect, quasisimple and almost simple, not rational;
  `Nat.card (MulAut) = 120`, `Nat.card Out = 2`; `5` classes, `4` divisions; `mobiusSub ⊥ = -60`;
  Schur multiplier `C₂`; `permutationDegree = 5`; `irrDegree ℂ = 3`; `malleIndexGroup = 2`,
  `malleB ⊤ = 2`, `malleD = 6` as `5T4`.
- **`SL(2,5) = 120.5`**: perfect, quasisimple, not almost simple; centre `C₂`, chief factors
  `[A₅, C₂]`; `Nat.card Out = 2`; `9` classes, `7` divisions; `permutationDegree = 24`; `irrDegree ℂ = 2`.
  Its abelian normal subgroups are `⊥` and the centre (the quotient by the centre is `A₅`), so
  its degree-`2` embedding in `GL (Fin 2) ℂ` (the binary icosahedral group) gives
  `jordanBound 2 ≥ 60` (10.5).
- **`96.3`**: `commutatorLength = 2`: `commutator G` has order `32` and exactly `29` of its elements
  are commutators. `fittingSubgroup = commutator G` (order `32`), `socle` of order `8`, chief factors
  of orders `[3, 4, 4, 2]`, `derivedLength = 3`, `Nat.card Out = 8`, `12` classes, `8` divisions, `7`
  autjugacy classes, `permutationDegree = 12`, `irrDegree ℂ = 6`.
- **The Gassmann pair `16.2`, `16.12`** (`C₄ × C₄`, `Q₈ × C₂`; Induction and Restriction 2.2):
  both have order statistics `1¹ 2³ 4¹²`, `permutationDegree = 8` resp. `10`, `transitiveDegree =
  16` for both, no faithful irreducible character (`irrDegree ℂ = ⊤`, `linDegree ℂ = 2` resp. `3`, the
  latter by `ρ ⊗ 1 ⊕ 1 ⊗ sgn` with `ρ` the degree-two character of `Q₈`),
  `Nat.card (MulAut) = 96` resp. `192`, `3` resp. `4` autjugacy classes, Schur multiplier `C₄` resp.
  `C₂ × C₂`; `commutatorLength = 0` resp. `1`.
- **Gassmann triples in small degree** (7.2, 7.6): `gassmannCount = 0` for every transitive group of
  degree `≤ 6`; `7T5 = GL(3,2)` (order `168`, `mobiusSub ⊥ = 0`, `permutationDegree = 7`) has
  `gassmannCount = 1`, as do `8T15` (order `32`) and `8T23 = GL(2,3)` (order `48`).
- **`6T5 = C₃ ≀ C₂ ≅ C₃ × S₃`** (order `18`): `malleIndexGroup = 2`, `malleB ⊤ = 1`, `malleD = 3`,
  concentrated (the minimal-index elements generate `C₃ × C₃`), not elusive. **`4T2 = V₄`**:
  `malleIndexGroup = 2`, `malleB ⊤ = 3`. **`3T2 = S₃`**: `malleIndexGroup = 1`, `malleB ⊤ = 1`,
  `malleD = 2`; centralizer in `S₃` trivial.
- **Boundary checks.** `IsSupersolvable (alternatingGroup (Fin 4))` is false (1.1's witness for
  non-extension-closure); `IsMetacyclic (Multiplicative (Fin 3 → ZMod 2))` is false while it is metabelian;
  `IsAGroup (Equiv.Perm (Fin 4))` is false; `IsQuasisimple (Equiv.Perm (Fin 5))` is false while
  `IsAlmostSimple` holds, and the reverse for `SL(2,5)`; `IsRationalGroup (Multiplicative (ZMod 3))`
  is false; `IsComplete (Equiv.Perm (Fin 6))` is false (`Nat.card Out = 2`); `derivedLength
  (alternatingGroup (Fin 5)) = 0` is the junk value and `derivedLength_eq_zero_iff` applies;
  `irrDegree ℂ (Multiplicative (ZMod 4 × ZMod 4)) = ⊤`; `commutatorLength (Equiv.Perm (Fin 3)) = 1`
  and `= 0` for every abelian group; the degree-`7` Gassmann triple is **not** a counterexample to
  7.5: the two septic fields have equal discriminants.

## Ordering

```text
Layer 0 ──► Layer 1 ──► Layer 2          Layer 3 ──► Layer 8 (needs 3.7)
   │           └──► Layer 6 (needs 3.7, 5.3) ──► Layer 9 (needs 6.5) ──► Layer 10 (needs 9.1, 6.8)
   ├──► Layer 4        Layer 5 ──► 6.8          Layer 7 (Tau Ceti and cited roadmaps only; 7.6 needs 7.2)
```

Layers 0, 3, 4, 5 and 7 start in parallel; Layer 1 for 0.3 and 0.6 (1.10 also for 0.8); Layer 2 for
0.7; Layer 6 for 3.7 and 5.3 (within it 6.1 → 6.2 → 6.3 → 6.4 → 6.5 → {6.6, 6.7, 6.8}); Layer 8 for
3.7; Layer 9 for 6.5; Layer 10 for 9.1 and 6.8.

## References

- M. Aschbacher, *Finite Group Theory*, 2nd ed., Cambridge, 2000: §31 (components, `F*(G)`, (31.13)).
- H. Brown, R. Bülow, J. Neubüser, H. Wondratschek, H. Zassenhaus, *Crystallographic Groups of
  Four-Dimensional Space*, Wiley, 1978 (the class counts in dimensions `≤ 4`).
- M. J. Collins, *On Jordan's theorem for complex linear groups*, J. Group Theory 10 (2007), 411–423.
- C. W. Curtis, I. Reiner, *Representation Theory of Finite Groups and Associative Algebras*, Wiley,
  1962: §36 (Jordan), §§73–74 (integral representations of cyclic groups); *Methods of Representation
  Theory I*, Wiley, 1981 (Schur indices; Jordan–Zassenhaus).
- F. E. Diederichsen, Abh. Math. Sem. Hamburg 13 (1940), 357–412; I. Reiner, *Integral representations
  of cyclic groups of prime order*, Proc. AMS 8 (1957), 142–146.
- B. de Smit, R. Perlis, *Zeta functions do not determine class numbers*, Bull. AMS 31 (1994), 213–215.
- R. M. Guralnick, *Commutators and commutator subgroups*, Adv. Math. 45 (1982), 319–330.
- P. Hall, *The classification of prime-power groups*, J. reine angew. Math. 182 (1940), 130–141
  (isoclinism); *The Eulerian functions of a group*, Quart. J. Math. 7 (1936), 134–151; J. LMS 3 (1928),
  98–105 and J. LMS 12 (1937), 198–200 (Hall's theorems).
- I. M. Isaacs, *Character Theory of Finite Groups*, 1976: Chapters 5, 6, 10; *Finite Group Theory*,
  AMS, 2008: Chapters 1–3, 9.
- D. L. Johnson, *Minimal permutation representations of finite groups*, Amer. J. Math. 93 (1971), 857–866.
- G. Karpilovsky, *The Schur Multiplier*, Oxford, 1987: Chapter 2.
- T. Kubota, *Über den bizyklischen biquadratischen Zahlkörper*, Nagoya Math. J. 10 (1956), 65–85.
- H. Kurzweil, B. Stellmacher, *The Theory of Finite Groups*, Springer, 2004: Chapters 1, 6.
- F. Lemmermeyer, *Kuroda's class number formula*, Acta Arith. 66 (1994), 245–260.
- G. Malle, *On the distribution of Galois groups*, J. Number Theory 92 (2002), 315–329, and II,
  Experiment. Math. 13 (2004), 129–135.
- M. Newman, *Integral Matrices*, Academic Press, 1972: Chapter IX.
- R. Perlis, *On the equation `ζ_K(s) = ζ_{K'}(s)`*, J. Number Theory 9 (1977), 342–360.
- D. J. S. Robinson, *A Course in the Theory of Groups*, 2nd ed., Springer, 1996: §3.3 (3.3.15), §5.4, §9.1.
- J.-P. Serre, *Bounds for the orders of the finite subgroups of `G(k)`*, in *Group Representation
  Theory*, EPFL Press, 2007, §1.
- The knowls `group.*`, `gg.*`, `nf.arithmetically_equivalent`, `modcurve.gassmann_class` of the
  LMFDB, whose definitions are the ones formalized here.
