# Roadmap: invariants of finite groups

**Summary.** This roadmap builds the isomorphism invariants of finite groups that group databases
display and that neither Mathlib nor Tau Ceti states, on Mathlib's carriers (`Subgroup G`,
`ConjClasses G`, `MulAut G`, `Representation`, `Equiv.Perm`, `Matrix.GeneralLinearGroup`) and Tau
Ceti's character table (`TauCeti.irreducibleCharacters`). From the lattice of normal subgroups it
builds chief and composition series with their factor multisets, the socle, the solvable radical
and the invariant factors of a finite abelian group; it defines the classes of groups a database
filters on (supersolvable, metacyclic, A-groups, rational, almost simple, quasisimple, complete,
monomial) and proves the implications between them; it defines Hall subgroups, divisions and the
cyclotomic action on classes, commutator length, isoclinism and stem groups, the Möbius functions
of the subgroup and normal-subgroup lattices, Hall's Eulerian functions and the minimal faithful
permutation degree; rational characters, Schur indices and faithful character degrees; Gassmann
equivalence of finite-index subgroups and its arithmetic meaning; elusive permutation groups;
integral representations of orders and of cyclic groups of prime order, Galois-equivariant units
and the unit types of biquadratic fields; and the finite subgroups of `GL_n(ℤ)`, `GL_n(ℚ)`,
`GL_n(ℂ)`. The end theorems are Jordan–Hölder for chief and composition series, Huppert's
criterion, Hall's theorem and its converse, Brauer's permutation lemma with the rational character
basis, Brauer–Speiser, the classification of irreducible rational representations, Taketa's
theorem, Gaschütz's faithfulness criterion, Bauer's and Perlis' theorems, Jordan–Zassenhaus,
Diederichsen–Reiner, Herbrand's unit theorem, Kuroda's class number formula with Kuroda's list
and Kubota's theorem on unit types, Minkowski's theorem and the dimension `2`, `3`, `4` class
counts, and Jordan's theorem over every field of characteristic zero with the optimal constant.

## Scope and ownership

This roadmap owns the invariants named in the summary, in Layers 0–10 below. It consumes, by name
and section, and does not plan again:

- **InverseGaloisAndArithmeticFundamentalGroups** IG.4.3, target *The Fitting subgroup* (the
  Fitting subgroup `F(G)`, the join of the nilpotent normal subgroups; Fitting's theorem that the
  join of two nilpotent normal subgroups is nilpotent; `F(G)` is characteristic; every nilpotent
  normal subgroup lies in `F(G)`; `F(G)` is nilpotent for finite `G`). The Fitting subgroup
  displayed by a database is this `F(G)`.
- **RepresentationTheory/CharacterTheory** §4.4 (the Galois action of `Gal(ℚ(ζ_e)/ℚ)` on
  irreducible characters, its value law `(σ · χ)(g) = χ(g^j)`, preservation of irreducibility,
  and the field-of-values theorem `fieldOfValues_eq_map_fixedField_stabilizer`), §4.5 (every
  irreducible representation over an algebraically closed field of characteristic zero is realized
  over the cyclotomic subfield `ℚ(ζ_e)`) and Layer 7 (the Frobenius–Schur indicator and
  realizability over `ℝ`). This roadmap adds the orbit count, the rational characters, the
  character form of the Schur index over arbitrary subfields of `ℂ` with Brauer–Speiser, and the
  rational-group criterion.
- **ArithmeticGaloisRepresentations** §5.5 *Image algebra and Brauer class* (for an absolutely
  irreducible `ρ : Γ → GL_n(k̄)`, the trace field `k(ρ)` and the image algebra `B(ρ)`, central
  simple of dimension `n²` over `k(ρ)`; the Schur index `s(ρ)`, Tau Ceti's `TauCeti.Algebra.index`
  of `B(ρ)`, with `s(ρ) ∣ n`; realizability of `ρ` over a field `k(ρ) ⊆ k' ⊆ k̄` exactly when `k'`
  splits `B(ρ)`) and §5.6 *The descent obstruction* (over a perfect field `k`, a finite-dimensional
  simple `k[Γ]`-module `W` with image algebra `M_a(Δ)`, `Z` the centre of `Δ`, has
  `W ⊗ k̄ ≅ ⊕_τ ρ_τ^{⊕ s}` over the embeddings `τ : Z → k̄`, the `ρ_τ` pairwise non-isomorphic,
  absolutely irreducible, of trace field `τ(Z)` and Schur index `s`; simple `k[Γ]`-modules
  correspond to the `Gal(k̄/k)`-orbits of absolutely irreducible representations whose trace field
  is finite over `k`). The Schur index and the classification of irreducible rational
  representations are these sections' theorems at `Γ = G` finite; 6.4 and 6.5 translate them into
  irreducible complex characters (`TauCeti.irreducibleCharacters ℂ G`), their Galois orbits and
  `rationalCharacter`.
- **RepresentationTheory/InductionRestriction** §2.1 (almost-conjugacy of subgroups of a finite
  group, the fixed-coset criterion, `Gassmann.almostConjugate_iff_permutation_equiv`), §2.2 (the
  almost-conjugate, non-conjugate pair in `S₁₆` built from `C₄ × C₄` and `Q₈ × C₂`,
  `Gassmann.exists_S16_gassmann_pair`) and Layer 7 (projective representations, the Schur
  multiplier `TauCeti.schurMultiplier`, and representation groups, that is Schur covers, with
  their existence and lifting theorems); **InverseGaloisAndArithmeticFundamentalGroups** IG.3.4,
  target *Reduced Schur covers* (for a Schur cover `π : S → G` of a finite group, the class map is
  an isomorphism `M(G) ≅ ker π`, where `M(G) = H₂(G, ℤ)`); and **InductionRestrictionPartII**
  §RS.0.1 (the five-term exact sequence of a central extension and its stem corollaries: the class
  map `M(G) → ker π` of a stem extension is onto). The bound on the kernel of a stem extension is
  RS.0.1's; the Schur covers are InductionRestriction Layer 7's, with IG.3.4's identification of
  their kernel, and InductionRestrictionPartII consumes them without owning them. Layer 4 here
  owns isoclinism and stem groups.
- **ArithmeticStatisticsPartV** §3.9 *Malle invariants of a permutation group* (the index
  `ind(g)`, `ind(G)`, `a(G)` and `b(H, G)`). Malle's conjecture is that roadmap's.
- **ClassicalArithmeticCompletion** Layer 7: §7.4 (orders in finite-dimensional algebras,
  `IntegralOrder.IsOrder`, `IntegralOrder.groupRing_isOrder`), §7.10 (the reduced norm of a
  semisimple number-field algebra), §7.21 (maximal orders, `IntegralOrder.IsMaximalOrder`), §7.49
  (one trace-dual lattice bounds every overorder) and §7.56 (every order with nondegenerate regular
  trace lies in a maximal order), for Jordan–Zassenhaus.
- Mathlib and Tau Ceti as listed in the supplier contracts; in particular Mathlib's
  `commProb_def'` (the commuting probability is the class number over the order) and
  `IsCyclic.card_mulAut` (a cyclic group of order `n` has `φ(n)` automorphisms) are consumed, not
  restated, and so are Tau Ceti's double-coset law for the primes of a non-Galois subfield, its
  Frobenius splitting types, its complete-splitting criteria in composita and Galois closures and
  its Chebotarev density theorem, the arithmetic inputs of Bauer's and Perlis' theorems (the
  pinned declarations realizing Completed/NumberFieldArithmetic 1.4, 1.5 and 2.1–2.3 and
  Completed/Chebotarev Layer 10).

This roadmap is the owner of: series and factor multisets of finite groups (no roadmap on main or
among the open roadmaps defines chief or composition factors of a group, the socle or the solvable
radical); the group classes of Layer 1, including the supersolvable groups with Huppert's criterion
(InverseGaloisAndArithmeticFundamentalGroups IG.4.4, target *Supersolvable Grunwald prescriptions*,
states its Grunwald theorem with its own predicate `IsSupersolvable`, which 1.1 shows equivalent to
this one, and proves nothing about the class) and the quasisimple groups; Hall subgroups, Hall's
theorem and Hall's converse; divisions; commutator length, isoclinism and stem groups; the Möbius
functions, Eulerian functions and permutation degrees; rational characters, the character form of
Schur indices with Brauer–Speiser, and faithful character degrees; Gassmann equivalence of
finite-index subgroups of an arbitrary group, Bauer's theorem and both directions of Perlis'
theorem; elusive groups; the integral representation theory of Layer 9, including Jordan–Zassenhaus
for `ℤ`-orders in semisimple `ℚ`-algebras (no roadmap on main states it;
ClassicalArithmeticCompletion Layer 7 supplies orders and maximal orders but no finiteness of
lattice classes); and the finite subgroups of general linear groups of Layer 10.

Not owned: identifiers, orderings and stored lists of a database (labels beyond the intrinsic
prefix `Nat.card G`, the order of divisions or characters, hashes, presentations); character
tables and their computation (CharacterTheory); the finite simple groups (Tau Ceti's
`TauCeti.ClassificationStatement` is consumed as a hypothesis where a theorem needs it);
transitive groups of a given degree and their classification; the Galois-module structure of rings
of integers; continuous automorphisms of profinite groups (Completed/ProfiniteArithmetic).

## Conventions

- **Carrier.** `G` is a finite group: `[Group G] [Finite G]`; `[Fintype G]` appears only where a
  sum over `G` is written. Every definition and theorem carries its finiteness binder in its own
  signature. Order is `Nat.card G`, exponent `Monoid.exponent G`, "abelian" is `IsMulCommutative`,
  "perfect" is `Group.IsPerfect`, "Z-group" is `IsZGroup`, nilpotency class is
  `Group.nilpotencyClass`, the Frattini subgroup is `frattini G`.
- **Normal subgroups.** `NormalSubgroup G` is the subtype of normal subgroups with the complete
  lattice structure of `Subgroup G`; chief series are `CompositionSeries` in it, and composition
  series of a group are the separate structure `GroupCompositionSeries G`, because in
  `Subgroup G` Mathlib's covering relation means maximal subgroup, not maximal normal subgroup of
  the next term. Mathlib's `FiniteIndexNormalSubgroup G`
  (`Mathlib/GroupTheory/FiniteIndexNormalSubgroup.lean`) has the same elements when `G` is finite,
  but at the pin it carries only a `Lattice` instance, with no `⊥` and no complete lattice
  structure (for infinite `G` the trivial subgroup has infinite index); chief series need `⊥` and
  `⊤`, and `mobiusQuo` needs the bottom element, so `NormalSubgroup G` is used.
- **Factor multisets** are multisets of `IsoClass`, the isomorphism classes of objects of
  Mathlib's category `FiniteGrp` of finite groups in `Type`
  (`Mathlib/Algebra/Category/Grp/FiniteGrp.lean`) under `CategoryTheory.isIsomorphicSetoid`; an
  isomorphism in `FiniteGrp` is the same as a `MulEquiv` of the underlying groups. `IsoClass.mk`
  sends a finite group in any universe to its class through a copy on `Fin (Nat.card H)`
  (`FiniteGrp.of`).
- **Junk values.** Invariants defined as `sInf` on `ℕ` take the value `0` on the empty set: the
  derived length of a non-solvable group is `0`, and the theorems that use derived length carry a
  solvability hypothesis. Faithful character degrees are `ℕ∞`-valued with `⊤` for "none".
- **Divisions.** `x` and `y` are in the same division when some power `x^n` with `n` prime to the
  order of `x` is conjugate to `y` (`divisionSetoid`). The units of `ZMod (Monoid.exponent G)` act
  on `ConjClasses G` by `u • [g] = [g^(u.val)]`.
- **Commutators** are Mathlib's: `⁅g, h⁆ = g h g⁻¹ h⁻¹`, `commutatorSet G` is the set of
  commutators and `commutatorSet G ^ k` its `k`-th pointwise power, so `commutatorSet G ^ 0 = {1}`.
- **Möbius functions** are `IncidenceAlgebra.mu ℤ` on the finite lattices `Subgroup G` and
  `NormalSubgroup G`, with `Fintype.toLocallyFiniteOrder`: `mobiusSub H = μ(H, G)` and
  `mobiusQuo N = μ(1, N)`.
- **Characters.** `χ` ranges over `TauCeti.irreducibleCharacters ℂ G`. The Galois action is
  CharacterTheory §4.4's; `GaloisConj χ ψ` is its orbit relation written with a power of the
  argument. The Schur index over `F ⊆ ℂ` is a least degree `[E : F(χ)]`, computed by
  `IntermediateField.relfinrank`.
- **Gassmann equivalence.** For finite-index `H, K ≤ Γ`, `AlmostConjugateOfFiniteIndex H K`
  compares fixed-coset counts `#(Γ ⧸ H)^γ = #(Γ ⧸ K)^γ` for every `γ`; for finite `Γ` it is
  InductionRestriction §2.1's almost-conjugacy by that section's fixed-coset criterion.
- **Matrices.** `GL (Fin n) R` is `Matrix.GeneralLinearGroup (Fin n) R`; a `ℤ`-class (`ℚ`-class) is
  a `GL (Fin n) ℤ`- (`GL (Fin n) ℚ`-) conjugacy class of finite subgroups.
- **Permutations** compose right to left; `C_n` is `Multiplicative (ZMod n)`.

## Exact supplier contracts

### From Mathlib

| Use here | Declarations |
|---|---|
| subgroups and series | `Subgroup.Normal`, `Subgroup.normalCore`, `Subgroup.centralizer`, `Subgroup.normalClosure`, `Subgroup.IsSubnormal`, `Subgroup.mul_normal`, `Subgroup.mul_inf_assoc`, `derivedSeries`, `Group.IsSolvable`, `Group.IsNilpotent`, `Group.nilpotencyClass`, `Group.IsPerfect`, `IsSimpleGroup`, `frattini`, `commutator`, `commutatorSet`, `CompositionSeries`, `JordanHolderLattice`, `CompositionSeries.jordan_holder`, `IsModularLattice`, `IsCoatom`, `Subgroup.lowerCentralSeries` |
| isomorphism classes of finite groups | `FiniteGrp`, `FiniteGrp.of`, `CategoryTheory.isIsomorphicSetoid` |
| Sylow and Hall | `Sylow`, `IsPGroup`, `IsZGroup`, `IsZGroup.isCyclic_commutator`, `IsZGroup.isCyclic_abelianization`, `Subgroup.exists_right_complement'_of_coprime` |
| automorphisms and classes | `MulAut`, `MulAut.conj`, `ConjClasses`, `IsConj`, `MulAction.orbitRel.Quotient`, `MulAction.fixedBy`, `IsCyclic.card_mulAut`, `commProb_def'` |
| finite abelian groups | `AddCommGroup.equiv_directSum_zmod_of_finite`, `ZMod` |
| lattices and Möbius | `IncidenceAlgebra.mu`, `Fintype.toLocallyFiniteOrder` |
| representations | `Representation`, `Representation.character`, `Representation.IsIrreducible`, `IntermediateField.adjoin`, `IntermediateField.relfinrank`, `IsCyclotomicExtension.autEquivPow`, `MonoidAlgebra` |
| orders and lattices | `Subalgebra`, `Submodule.span`, `IsSemisimpleRing`, Maschke's theorem (`MonoidAlgebra.Submodule.exists_isCompl`, with the `IsSemisimpleRing` instance on `MonoidAlgebra k G` when `#G` is invertible in `k`), `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` |
| number fields | `NumberField.dedekindZeta`, `LSeries_eq_iff_of_abscissaOfAbsConv_lt_top`, `NumberField.discr`, `NumberField.InfinitePlace.nrRealPlaces`, `NumberField.classNumber`, `NumberField.Units.regulator`, `NumberField.Units.unitLattice_rank`, `NumberField.IsTotallyReal`, `NumberField.RingOfIntegers`, `NumberField.RingOfIntegers.mapAlgEquiv`, the action of `Gal(L/K)` on `NumberField.InfinitePlace L` (`NumberField.InfinitePlace.smul_eq_comap`: `σ • w = w.comap σ⁻¹`), `CyclotomicField`, `IntermediateField.fixedField`, `IntermediateField.normalClosure`, `AlgebraicClosure` |
| matrices | `Matrix.GeneralLinearGroup`, `Matrix.ProjGenLinGroup.mk`, `Matrix.SpecialLinearGroup`, `Matrix.unitaryGroup`, `RingHom.mapMatrix`, `Units.map`, `Module.Free`, `Module.Finite`, `Module.finrank`, `Subgroup.FiniteIndex`, `IsAlgClosed`, `IsAlgClosed.exists_pow_nat_eq`, `card_rootsOfUnity`, `Module.End.exists_eigenvalue`, `IsCyclotomicExtension.algEquiv`, `Real.sqrt` |
| permutations | `Equiv.Perm`, `Equiv.Perm.isConj_iff_cycleType_eq`, `MulAction.IsPretransitive`, `alternatingGroup` |

### From Tau Ceti

| Use here | Declarations |
|---|---|
| character table | `TauCeti.irreducibleCharacters`, `TauCeti.card_irreducibleCharacters`, `TauCeti.characterDegree`, `FDRep.mem_ker_iff_char_eq` |
| Galois action on characters | `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction`, `IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply` |
| realizability over `ℝ` | `Representation.frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal` |
| solvability | `TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow` (Burnside's `pᵃqᵇ`) |
| elementary groups | `TauCeti.IsPElementary`, `TauCeti.IsElementary`, `TauCeti.IsPHyperelementary`, `TauCeti.IsHyperelementary`, `TauCeti.isElementary_of_isCyclic` (`TauCeti/GroupTheory/Elementary.lean`: `p`-elementary, elementary, `p`-hyperelementary, hyperelementary) |
| indecomposable modules | `TauCeti.IsIndecomposableModule` |
| simple groups | `TauCeti.ClassificationStatement` (a proposition; used only as a hypothesis) |
| characters determine representations | `Representation.nonempty_equiv_of_character_eq` (`TauCeti/RepresentationTheory/CharacterTable/Determined.lean`: over a field of characteristic zero, finite-dimensional representations of a finite group with equal characters are equivalent) |
| cyclotomic realization | `FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension` (`TauCeti/RepresentationTheory/Induction/Cyclotomic/SplittingField.lean`: an irreducible representation over an algebraically closed field is the scalar extension of an absolutely irreducible one over a cyclotomic field of the exponent; CharacterTheory §4.5) |
| index of a central simple algebra | `TauCeti.Algebra.index`, `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index` (`TauCeti/Algebra/CentralSimple/Index.lean`: a central simple algebra has a finite splitting field whose degree is its index) |
| primes of a non-Galois subfield | `Ideal.doubleCosetQuotientEquivPrimesOverOfIsIntegralClosure`, `Ideal.ramificationIdx_mul_inertiaDeg_under_smul_eq_relIndex_of_isIntegralClosure`, `Ideal.ramificationIdx_under_smul_eq_relIndex_inertia_of_isIntegralClosure` (`TauCeti/NumberTheory/RamificationInertia/DoubleCoset/IntegralClosure.lean`: the primes of `M ^ H` above `p` are indexed by `H \ G / D`, with `e · f` and `e` as relative indices of the conjugated decomposition and inertia groups) |
| Frobenius splitting types | `NumberField.Chebotarev.frobeniusPrimeSet`, `NumberField.Chebotarev.map_inertiaDeg_eq_fullCycleType_of_mem_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/Density/SplittingType.lean`: at an unramified prime with Frobenius class `[σ]` the residue degrees of the primes of `L ^ H` are the cycle lengths of `σ` on `Gal(L/K) ⧸ H`) |
| complete splitting | `Ideal.ncard_primesOver_normalClosure_eq_finrank_iff`, `Ideal.ncard_primesOver_sup_eq_finrank_iff` (`TauCeti/NumberTheory/NumberField/SplitsCompletely/GaloisClosure.lean`: a prime splits completely in `E` iff in its normal closure, and in `E₁ ⊔ E₂` iff in both) |
| Chebotarev density | `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean`: each conjugacy class `C` is the Frobenius class of a set of primes of density `#C / #G`, in particular of infinitely many), `NumberField.Chebotarev.hasDirichletDensity_setOf_ncard_primesOver_eq_finrank` (`TauCeti/NumberTheory/Chebotarev/Density/SplitsCompletely.lean`: the primes splitting completely in `E` have density `1 / [N : K]` for `N` the normal closure of `E`) |

### From InverseGaloisAndArithmeticFundamentalGroups

IG.4.3, target *The Fitting subgroup*: the Fitting subgroup `F(G)` of a group `G`, the join of its
nilpotent normal subgroups, with Fitting's theorem (the join of two nilpotent normal subgroups is
nilpotent), `F(G)` characteristic, every nilpotent normal subgroup contained in `F(G)`, and `F(G)`
nilpotent for finite `G`. Used in 0.8. IG.4.4, target *Supersolvable Grunwald prescriptions*: its
predicate `IsSupersolvable` (a chain of normal subgroups of `G` from `⊥` to `⊤`, each the join of
the previous one with one cyclic subgroup), compared with 1.1's. IG.3.4, target *Reduced Schur
covers*: for a finite group `G` and a Schur cover `π : S → G` (a representation group of
InductionRestriction Layer 7), the class map `τ_S : M(G) ≅ ker π`, with `M(G)` Mathlib's
`groupHomology.H2 (Rep.trivial ℤ G ℤ)`. Used in 4.4.

### From RepresentationTheory/CharacterTheory

§4.4: the Galois action and `fieldOfValues_eq_map_fixedField_stabilizer`; §4.5: realization over
`ℚ(ζ_e)` inside any algebraically closed field of characteristic zero; Layer 7: the Frobenius–Schur
trichotomy.

### From ArithmeticGaloisRepresentations

§5.5 *Image algebra and Brauer class*: for `ρ : Γ → GL_n(k̄)` absolutely irreducible, the trace field
`k(ρ)` (`GaloisRep.traceField`), the image algebra `B(ρ)` (`GaloisRep.imageAlgebra`), central simple
of dimension `n²` over `k(ρ)`, the Schur index `s(ρ)` as `TauCeti.Algebra.index` of `B(ρ)`,
`s(ρ) ∣ n`, and realizability over `k(ρ) ⊆ k' ⊆ k̄` exactly when `k'` splits `B(ρ)`
(`GaloisRep.realizable_iff_imageAlgebra_split`). §5.6 *The descent obstruction*, simple modules over
a perfect field: the decomposition `W ⊗ k̄ ≅ ⊕_τ ρ_τ^{⊕ s}`, `dim_k W = m s [Z : k]`, and the
correspondence between simple `k[Γ]`-modules and `Gal(k̄/k)`-orbits of absolutely irreducible
representations with trace field finite over `k`. Used in 6.4 and 6.5, at `Γ = G` finite and
`k = F ⊆ ℂ`, with `k̄` the algebraic closure of `F` in `ℂ`.

### From RepresentationTheory/InductionRestriction and InductionRestrictionPartII

InductionRestriction §2.1 (`Gassmann.almostConjugate_iff_permutation_equiv`), §2.2
(`Gassmann.exists_S16_gassmann_pair`), Layer 7 (representation groups, that is Schur covers: their
existence and the lifting of every projective representation); InductionRestrictionPartII
§RS.0.1 (stem surjectivity of the class map).

### From ArithmeticStatisticsPartV

§3.9 *Malle invariants of a permutation group*: `ind(g)`, `ind(G)`, `a(G)`, `b(H, G)`.

### From ClassicalArithmeticCompletion

Layer 7: §7.4 (an `R`-order in a finite-dimensional `F`-algebra is a subring that is an `R`-lattice
spanning the algebra; `IntegralOrder.IsOrder`, `IntegralOrder.IsOrder.isIntegral`,
`IntegralOrder.groupRing_isOrder`), §7.10 (the reduced norm of a semisimple algebra over a number
field, multiplicative and compatible with completions), §7.21 (`IntegralOrder.IsMaximalOrder`),
§7.49 (for an order `Λ` in an algebra with nondegenerate regular trace there is `r ≠ 0` with
`r Λ' ⊆ Λ` for every overorder `Λ'`) and §7.56 (every such order lies in a maximal order). Used in
9.1.

## How to read the build

Layer 0 builds series and characteristic subgroups on the normal-subgroup lattice; Layer 1 the
group classes; Layer 2 Hall's theorem and its converse; Layer 3 automorphism invariants and
divisions; Layer 4 commutator length, isoclinism and stem groups; Layer 5 the lattice invariants
and permutation degrees; Layer 6 the rational character theory, resting on Layer 3's divisions and
Layer 1's classes; Layer 7 Gassmann and arithmetic equivalence; Layer 8 elusive groups and the
Malle bridge; Layer 9 integral representations; Layer 10 finite matrix groups, resting on Layer 9's
Jordan–Zassenhaus. Layers 0, 3, 4, 5 and 7 start in parallel. Each subsection says what it
defines and proves; its `*Needs:*` line lists what the statement and the indicated route use, item
by item, and a proof by another route is not bound by it. Backticked names of this roadmap are
declarations of `Suggested.lean`; everything else of this roadmap is named in prose.

## Layer 0: series and characteristic subgroups

### 0.1 The lattice of normal subgroups

Define `NormalSubgroup G` as the subtype of normal subgroups, with the complete lattice structure
inherited from `Subgroup G` (joins and meets of normal subgroups are normal), and prove it is a
modular lattice: for normal `A ≤ C` and normal `B`, `A ⊔ (B ⊓ C) = (A ⊔ B) ⊓ C`, from `A ⊔ B = A * B`
(`Subgroup.mul_normal`) and `Subgroup.mul_inf_assoc`. *Needs:* Mathlib `Subgroup.mul_normal`,
`Subgroup.mul_inf_assoc`.

- The coercion to `Subgroup G` is an order embedding preserving `⊔`, `⊓`, `⊥`, `⊤`.
- An atom of `NormalSubgroup G` is exactly a minimal normal subgroup (0.3); `N` is a coatom exactly
  when `N ≠ ⊤` and `G ⧸ N` is simple.

**Checks.**
- `S₃` has three normal subgroups `⊥ < A₃ < ⊤`, and `S₄` has the chain `⊥ < V₄ < A₄ < ⊤`; a model
  that took all subgroups would give `6` and `30`.
- In `Q₈` all six subgroups are normal, so `NormalSubgroup Q₈` and `Subgroup Q₈` have the same six
  elements.
- The modular law needs normality: in `Subgroup A₄` take `A = ⟨(12)(34)⟩ ≤ C = V₄` and
  `B = ⟨(123)⟩`; then `A ⊔ (B ⊓ C) = A` has order `2` while `(A ⊔ B) ⊓ C = A₄ ⊓ V₄ = V₄` has order `4`.

### 0.2 Jordan–Hölder for chief series

Define `ChiefSeries G` as `CompositionSeries (NormalSubgroup G)` for Mathlib's
`JordanHolderLattice` instance on the modular lattice of 0.1, `IsoClass` as in the conventions (a
quotient of Mathlib's `FiniteGrp`), and `chiefFactors s` as the multiset of the classes of the
successive quotients
`s (i+1) ⧸ s i`. Prove `chiefFactors_eq`: two chief series of a finite group from `⊥` to `⊤` have
the same factor multiset, from `CompositionSeries.jordan_holder` and the second isomorphism
theorem, which identifies isomorphic intervals of normal subgroups with isomorphic quotients
(milne-gt, Example 6.29(a), p. 98: Jordan–Hölder for `G` acting on itself by conjugation).
*Needs:* 0.1; Mathlib `CompositionSeries.jordan_holder`, `QuotientGroup` isomorphism theorems.

- Every finite group has a chief series from `⊥` to `⊤`; the chief length is the length of any of
  them.
- `IsoClass.mk H = IsoClass.mk H'` exactly when `H ≃* H'`.

**Checks.**
- `C₆` has the two chief series `⊥ < C₂ < C₆` and `⊥ < C₃ < C₆`; both give the multiset
  `{C₂, C₃}`, while the lists `[C₂, C₃]` and `[C₃, C₂]` differ, so the invariant is a multiset.
- `S₄`: the factors are `{V₄, C₃, C₂}`, three factors, one of order `4`; `Q₈`: `{C₂, C₂, C₂}`.
- The trivial group has the single series of length `0` and the empty multiset; `IsoClass.mk C₄`
  and `IsoClass.mk (C₂ × C₂)` differ although both groups have order `4`.

### 0.3 Minimal normal subgroups

Define `IsMinimalNormal N`: `N` is normal, nontrivial, and contains no normal subgroup of `G`
other than `⊥` and `N`. Prove `exists_mulEquiv_pi_of_isMinimalNormal`: a minimal normal subgroup
of a finite group is isomorphic to `S^k` for a simple group `S` and some `k` (robinson, 3.3.15).
Hence every chief factor is characteristically simple, and for solvable `G` every chief factor is
`(ZMod p)^k` for a prime `p`. *Needs:* 0.1; Mathlib `IsSimpleGroup`, `Subgroup.Characteristic`.

- `IsMinimalNormal N` iff `⟨N, _⟩` is an atom of `NormalSubgroup G`.
- Two distinct minimal normal subgroups intersect trivially and commute elementwise.

**Checks.**
- `V₄` is the unique minimal normal subgroup of `A₄` and of `S₄`, although it is not a minimal
  subgroup (it contains three subgroups of order `2`, none normal in `A₄`).
- `C₂ × C₂` has three minimal normal subgroups; `⊥` is never minimal normal.
- In `A₅ ≀ C₂` the base `A₅ × A₅` is minimal normal with `k = 2`, a non-simple minimal normal
  subgroup; a model "minimal normal subgroups are simple" fails here.

### 0.4 Composition series

Define `GroupCompositionSeries G`: a strictly increasing chain of subgroups from `⊥` to `⊤`, each
normal in the next with simple quotient. Prove `nonempty_groupCompositionSeries` for finite `G`,
by refining a chief series through 0.3. *Needs:* 0.2, 0.3.

- Every term of a composition series is subnormal (Mathlib `Subgroup.IsSubnormal`).
- A chief series refines to a composition series; the converse fails.

**Checks.**
- `S₄` has the composition series `⊥ < ⟨(12)(34)⟩ < V₄ < A₄ < S₄` of length `4`; its second term is
  not normal in `S₄`, so it is not a chief series (chief length `3`).
- The trivial group has the series of length `0`; `C₄` has the unique series `⊥ < C₂ < C₄`.
- `A₅` has the single series `⊥ < A₅` of length `1`.

### 0.5 Jordan–Hölder for composition series

Define `GroupCompositionSeries.factors`, the multiset of the classes of the simple successive
quotients. Prove `GroupCompositionSeries.factors_eq`: any two composition series of a finite group
have the same factor multiset (milne-gt, Theorem 6.2, p. 88). Prove
`GroupCompositionSeries.factors_add`: for a normal subgroup `N` of a finite group `G`, the factors
of a composition series of `G ⧸ N` together with those of a composition series of `N` are the
factors of a composition series of `G`; a composition series of `N` followed by the preimages of
the terms of one of `G ⧸ N` is a composition series of `G` (third isomorphism theorem), and
`factors_eq` compares it with any other. The composition factors of `G` are the factors of any
composition series and the composition length `ℓ(G)` is their number; both are well defined by
`factors_eq`, and `ℓ(G ⧸ N) + ℓ(N) = ℓ(G)` for normal `N`. *Needs:* 0.4; Mathlib isomorphism
theorems.

- `ℓ(G) = 0` iff `G` is trivial; for solvable `G` the factors are the cyclic groups of prime order
  over the prime factorization of `Nat.card G` with multiplicity.
- `ℓ(G)` is the sum of the exponents `k` of the chief factors `S^k` (0.3).

**Checks.**
- `C₁₂`: factors `{C₂, C₂, C₃}`, length `3`, the number of prime factors of `12` with multiplicity.
- `S₄` with `N = V₄`: the factors `{C₂, C₃}` of `S₄ ⧸ V₄ ≅ S₃` and `{C₂, C₂}` of `V₄` add up to
  `{C₂, C₂, C₂, C₃}`, the factors of `S₄`, and `ℓ`: `2 + 2 = 4`; a model taking the union of the
  supports would give `{C₂, C₃}`.
- `A₅ × C₂`: factors `{A₅, C₂}`, length `2`; a model counting prime factors of `120` with
  multiplicity would give `5`.
- `N = ⊤`: `G ⧸ ⊤` is trivial, its only series has no factors, and the identity reduces to
  `factors_eq` for `N ≅ G`.

### 0.6 Derived length

Define the derived length `d(G)` as the least `n` with `derivedSeries G n = ⊥` (an `sInf` on `ℕ`,
`0` for a non-solvable group). Prove:

- `d(G) = 0` iff `G` is trivial or not solvable; `d(G) = 1` iff `G` is nontrivial abelian; `d(G) = 2`
  iff `G` is metabelian and nonabelian.
- For solvable `G`: `derivedSeries G (d(G)) = ⊥`; `d(G) ≤ n ↔ derivedSeries G n = ⊥`; for `H ≤ G`,
  `d(H) ≤ d(G)`; for normal `N`, `d(G ⧸ N) ≤ d(G)`; `d(G) ≤ ℓ(G)`.
- For nilpotent `G` of class `c`, `d(G) ≤ ⌊log₂ c⌋ + 1`, because `G^(k) ≤ γ_{2^k}(G)`, where
  `γ_{j+1}(G)` is Mathlib's `(⊤ : Subgroup G).lowerCentralSeries j`.

*Needs:* Mathlib `derivedSeries`, `Group.nilpotencyClass`, `Subgroup.lowerCentralSeries`.

**Checks.**
- `d(1) = 0`, `d(C₂) = 1`, `d(S₃) = 2`, `d(S₄) = 3`, and the junk value `d(A₅) = 0`.
- Monotonicity fails without solvability of the ambient group: `C₂ ≤ A₅` has `d = 1` and `0`, and
  the quotient `A₅ × C₂ → C₂` has `d = 0` and `1`; with solvable ambient groups, `C₃ ≤ S₃` and
  `S₃ → C₂` give `1 ≤ 2`.
- The nilpotent bound at class `c = 3` gives `d ≤ 2`, attained by a group of class `3` and derived
  length `2` such as `D₈` (the dihedral group of order `16`).

### 0.7 The socle

Define `socle G` as the join of the minimal normal subgroups. Prove `isMulCommutative_socle`: the
socle of a finite solvable group is abelian. Route: in a solvable group every minimal normal
subgroup is abelian (0.3); two distinct minimal normal subgroups meet trivially, so they commute
elementwise, their commutator subgroup lying in both; a join of pairwise commuting abelian
subgroups is abelian. The route is the proof. *Needs:* 0.3.

- `socle G` is characteristic and is the internal direct product of a subfamily of the minimal
  normal subgroups; `socle G = ⊥` iff `G` is trivial; `socle G = ⊤` for simple `G`.
- For solvable `G` the socle has squarefree exponent.

**Checks.**
- `socle S₄ = V₄`, `socle Q₈ = Z(Q₈) ≅ C₂`, `socle C₆ = C₆`, `socle A₅ = A₅`.
- The trivial group has socle `⊥`.
- Solvability is needed in `isMulCommutative_socle`: `socle A₅ = A₅` is not abelian.

### 0.8 The solvable radical

Define the solvable radical `R(G)` as the join of the normal solvable subgroups. Prove that `R(G)`
is solvable and characteristic, `R(G) = ⊤` iff `G` is solvable, `R(G) = ⊥` iff no minimal normal
subgroup is abelian, and `R(G ⧸ R(G)) = ⊥`. The Fitting subgroup `F(G)` is
InverseGaloisAndArithmeticFundamentalGroups IG.4.3's (target *The Fitting subgroup*); prove
`F(G) ≤ R(G)` for finite `G`: `F(G)` is characteristic, hence normal, and nilpotent for finite `G`,
hence solvable, so it is one of the subgroups whose join is `R(G)`. Route: the product `MN` of two
normal solvable subgroups is solvable, as an extension of `MN ⧸ N ≅ M ⧸ (M ⊓ N)` by `N`, so `R(G)`
is a finite join of them and solvable; an automorphism permutes the normal solvable subgroups, so
`R(G)` is characteristic; a minimal normal subgroup inside `R(G) ≠ ⊥` is solvable and
characteristically simple, hence abelian (0.3), and an abelian minimal normal subgroup lies in
`R(G)`; the preimage of `R(G ⧸ R(G))` is an extension of solvable groups, hence `R(G)`. The route is
the proof. *Needs:* 0.3; Mathlib `Group.IsSolvable` closure under extensions;
InverseGaloisAndArithmeticFundamentalGroups IG.4.3 (*The Fitting subgroup*).

**Checks.**
- `R(S₄) = S₄`, `R(A₅) = ⊥`, `R(A₅ × C₂) = C₂`.
- `R(SL(2,5)) = Z ≅ C₂`, since the quotient by the centre is `A₅`.
- `R(G ⧸ R(G)) = ⊥` at `G = A₅ × C₂`: the quotient `A₅` has trivial radical.
- `F(S₄) = V₄ < R(S₄) = S₄` (`A₄` is not nilpotent), `F(S₃) = A₃ < S₃ = R(S₃)`, and
  `F(A₅) = ⊥ = R(A₅)`: the inclusion is strict for the first two and an equality for `A₅`.

### 0.9 Invariant factors of a finite abelian group

Prove `existsUnique_invariantFactors`: a finite additive abelian group `A` is `∏ ZMod dᵢ` for
exactly one list `d₁ ∣ d₂ ∣ ⋯` of integers `> 1`, the invariant factors of `A`, the empty list for
the trivial group. Existence follows from `AddCommGroup.equiv_directSum_zmod_of_finite` by
grouping prime powers (the largest power of each prime goes into the last factor, the next
largest into the one before, and so on); uniqueness by counting, for each integer `m`, the
elements killed by `m`, which determines the list. Mathlib has the prime-power decomposition and
Smith normal forms of submodules (`Submodule.smithNormalForm`) but not this divisibility-chain
form. *Needs:* Mathlib `AddCommGroup.equiv_directSum_zmod_of_finite`.

- The product of the invariant factors is `Nat.card A`; for nontrivial `A` the last one is the
  exponent of `A`; the list is invariant under `≃+`.
- The primary invariants (the prime powers) and the invariant factors determine each other.

**Checks.**
- `ZMod 6` has `[6]`, not `[2, 3]` (which is not a divisibility chain).
- `ZMod 2 × ZMod 2 × ZMod 3` has `[2, 6]`; `ZMod 2 × ZMod 4` has `[2, 4]`.
- The trivial group has `[]`, whose product is `1 = Nat.card` and which has no last entry: the
  exponent statement needs nontriviality.

### Examples

`S₄`: chief factors `{V₄, C₃, C₂}`, composition length `4`, derived length `3`, socle `V₄`, radical
`S₄`. `A₅`: one chief factor, composition length `1`, derived length `0` (junk), socle `A₅`,
radical `⊥`. `Q₈`: chief factors `{C₂, C₂, C₂}`, derived length `2`, socle `C₂`.

### Dependencies

Mathlib (lattices, series, isomorphism theorems, finite abelian groups);
InverseGaloisAndArithmeticFundamentalGroups IG.4.3 (0.8 only).

## Layer 1: classes of finite groups

Every class is a `Prop`-valued predicate on the type `G`, invariant under `≃*`. Closure and
non-closure under subgroups, quotients, products and extensions are stated for each class, each
non-closure with a named witness.

### 1.1 Supersolvable groups

Define `IsSupersolvable G`: a chain of subgroups normal in `G` from `⊥` to `⊤` with cyclic
successive quotients. Prove Huppert's criterion `isSupersolvable_iff_forall_isCoatom_index_prime`: a
finite group is supersolvable iff every maximal subgroup has prime index (huppert-1954, Satz 9,
p. 416; huppert-eg1, Kapitel VI, Hauptsatz 9.5; robinson, §5.4). *Needs:* 0.3, 0.6; Mathlib
`IsCoatom`, `Subgroup.index`.

- Supersolvable groups are solvable; finite nilpotent groups are supersolvable; every chief factor
  of a supersolvable group has prime order.
- InverseGaloisAndArithmeticFundamentalGroups IG.4.4 (target *Supersolvable Grunwald
  prescriptions*) states its Grunwald theorem with a predicate `IsSupersolvable` asking for a chain
  of subgroups normal in `G` from `⊥` to `⊤` in which each term is the join of the previous one with
  one cyclic subgroup `⟨g⟩`. It is equivalent to this definition for every group: over a term `N`
  normal in `G`, the quotient `(N ⊔ ⟨g⟩) ⧸ N` is generated by the image of `g`, and conversely a
  cyclic quotient `N' ⧸ N` generated by the image of `g ∈ N'` gives `N' = N ⊔ ⟨g⟩`.
- Closed under subgroups, quotients and finite products; not under extensions.
- A finite supersolvable group has a normal Sylow subgroup for its largest prime divisor, and its
  commutator subgroup is nilpotent.

**Checks.**
- `S₃` is supersolvable (`⊥ < A₃ < S₃`); `D₄` and `Q₈` are (nilpotent).
- `A₄` is not: it has no normal subgroup of order `2` or `3`, and its maximal subgroup `C₃` has
  index `4`; since `V₄` and `A₄ ⧸ V₄ ≅ C₃` are supersolvable, the class is not extension-closed.
- The trivial group is supersolvable and has no maximal subgroup, so both sides of Huppert's
  criterion hold.
- The two definitions agree on `S₃`, through `⊥ < A₃ = ⊥ ⊔ ⟨(123)⟩ < S₃ = A₃ ⊔ ⟨(12)⟩`, and on `A₄`,
  which satisfies neither: its only normal subgroups are `⊥`, `V₄` and `A₄`, neither `V₄` nor `A₄`
  is cyclic, so the first proper step `⊥ < N` of a chain neither has cyclic quotient nor is
  `⊥ ⊔ ⟨g⟩`.

### 1.2 Metacyclic groups

Define the metacyclic groups as the predicate on `G` asking for a cyclic normal subgroup with
cyclic quotient. A finite group with all Sylow subgroups cyclic is metacyclic (Hölder–Burnside–Zassenhaus; robinson, §10.1), and this is
consumed from Mathlib rather than proved here: `IsZGroup.isCyclic_commutator` and
`IsZGroup.isCyclic_abelianization` make `commutator G` a cyclic normal subgroup with cyclic
quotient. *Needs:* Mathlib `IsZGroup`, `IsZGroup.isCyclic_commutator`,
`IsZGroup.isCyclic_abelianization`.

- Finite metacyclic groups are supersolvable and metabelian.
- Closed under subgroups and quotients; not under products.

**Checks.**
- `S₃`, `Q₈` (via `⟨i⟩`) and every dihedral group are metacyclic.
- `C₂ × C₂ × C₂` is not: a cyclic normal subgroup has order at most `2` and the quotient is not
  cyclic; it is the product of the metacyclic `C₂ × C₂` and `C₂`.
- `A₄` is metabelian but not metacyclic (its normal subgroups are `⊥`, `V₄`, `A₄`, none cyclic with
  cyclic quotient); `Q₈` is metacyclic but not a Z-group.

### 1.3 A-groups

Define `IsAGroup G`: every Sylow subgroup is abelian. A Z-group is an A-group; abelian groups are
A-groups; the class is closed under subgroups, quotients and finite products. Route: a Sylow
`p`-subgroup of a subgroup `H` lies in a Sylow `p`-subgroup of `G`; the image of a Sylow subgroup in
a quotient is a Sylow subgroup of the quotient, and every Sylow subgroup of the quotient is such an
image; a Sylow `p`-subgroup of `G × H` is the product of Sylow `p`-subgroups of the factors. The
route is the proof. *Needs:* Mathlib `Sylow`, `IsZGroup`.

**Checks.**
- `S₃` and `A₄` are A-groups (Sylow subgroups `C₂, C₃` and `V₄, C₃`).
- `S₄` (Sylow `2`-subgroup `D₄`) and `Q₈` are not.
- `C₂ × C₂` is an A-group but not a Z-group.

### 1.4 Rational groups

Define `IsRationalGroup G`: every element is conjugate to each of its powers of exponent prime to
its order. Closed under quotients and finite products, not under subgroups; the character
criterion is 6.6. Route: for a quotient, an exponent prime to the order of `gN` is congruent,
modulo that order, to one prime to the order of `g` (Chinese remainder theorem), and conjugacy
passes to the quotient; in `G × H`, an exponent prime to `orderOf (g, h) = lcm` of the two orders is
prime to each, and conjugacy is coordinatewise. The route is the proof. *Needs:* Mathlib `IsConj`,
`orderOf`.

**Checks.**
- `Equiv.Perm α` is rational (powers coprime to the order preserve the cycle type,
  `Equiv.Perm.isConj_iff_cycleType_eq`); so is `Q₈`.
- `C₃` is not (`g` and `g²` are not conjugate), so `C₃ ≤ S₃` shows non-closure under subgroups;
  `A₄` is not ((123) and (132) are not conjugate in `A₄`).
- The trivial group is rational: the only `n` coprime to the order `1` of the identity give `1`.

### 1.5 Almost simple and quasisimple groups

Define `IsAlmostSimple G`: a nonabelian simple normal subgroup with trivial centralizer. Prove
`isAlmostSimple_iff`: equivalently `G` embeds in `MulAut S` for a nonabelian simple `S` with image
containing the inner automorphisms. Define the quasisimple groups as the predicate on `G` asking
that `G` be perfect (Mathlib `Group.IsPerfect`) with simple central quotient `G ⧸ Z(G)`
(`IsSimpleGroup`, which includes nontriviality). *Needs:* 0.3, 0.7; Mathlib `MulAut.conj`,
`Group.IsPerfect`, `IsSimpleGroup`, `Subgroup.center`.

- The simple normal subgroup is `socle G`; an almost simple group has trivial centre and trivial
  solvable radical.
- A quasisimple group is nontrivial and nonabelian; a nonabelian simple group is quasisimple with
  trivial centre; a quotient of a quasisimple group by a central subgroup is quasisimple.

**Checks.**
- `A₅` and `S₅` are almost simple (`S₅ ≅ MulAut A₅`).
- `SL(2,5)` is not almost simple: its normal subgroups are `1`, its centre and itself, none
  nonabelian simple; it is quasisimple, perfect with central quotient `A₅`.
- `A₅ × A₅` is not almost simple (each factor is centralized by the other) and not quasisimple
  (perfect with trivial centre, but not simple); the trivial group is neither (`IsSimpleGroup`
  requires nontriviality).
- `C₂` is not quasisimple: it is not perfect, and its central quotient is trivial; `S₅` is not
  quasisimple: its commutator subgroup is `A₅`.

### 1.6 Complete groups

Define `IsCompleteGroup G`: trivial centre and every automorphism inner. Prove Hölder's theorem
`isCompleteGroup_perm_fin`: `Sₙ` is complete for `n ∉ {2, 6}`, because an automorphism preserving
the class of transpositions is inner, and for `n ≠ 6` the transpositions form the only class of
involutions of their size (huppert-eg1, Kapitel II, §5, pp. 173–177; milne-gt, Definition 3.3 and
Example 3.4(a), p. 44). *Needs:* Mathlib `MulAut.conj`, `Equiv.Perm.isConj_iff_cycleType_eq`.

**Checks.**
- `S₃`, `S₄`, `S₅` and the trivial group (`n = 0, 1`) are complete.
- `S₂ = C₂` is not (nontrivial centre); `S₆` is not (an outer automorphism exchanges
  transpositions with triple transpositions, `|Out(S₆)| = 2`).
- `A₅` is not complete (`|Out(A₅)| = 2`), although it has trivial centre.

### 1.7 Elementary and hyperelementary products

Define `e(G)` as the product of the primes `p ∣ Nat.card G` for which `G` is `p`-elementary
(`TauCeti.IsPElementary`), and `h(G)` likewise for `p`-hyperelementary (`TauCeti.IsPHyperelementary`).
Prove `e(G) ∣ h(G)`, and
`e(G) = 1` iff `G` is trivial or not elementary (`TauCeti.IsElementary`): a nontrivial group that
is `p`-elementary for a prime `p` not dividing its order is cyclic, and a nontrivial cyclic group is
`q`-elementary for every prime `q` dividing its order. *Needs:* Tau Ceti `TauCeti.IsPElementary`,
`TauCeti.IsPHyperelementary`, `TauCeti.IsElementary`, `TauCeti.isElementary_of_isCyclic`.

**Checks.**
- The trivial group: no prime factors, product `1`, and it is elementary (cyclic); both sides of the
  criterion are true, while "`e(G) = 1` iff not elementary" would fail here (true and false).
- `C₃`: product `3`, elementary; `C₆`: product `6`.
- `S₃`: product `1` and not elementary (`C₃ × C₂` is abelian, `S₃` is not).

### 1.8 The implication diagram

Prove for finite groups: cyclic → abelian → nilpotent → supersolvable → solvable; cyclic → Z-group
→ metacyclic → metabelian → solvable; Z-group → A-group; elementary → nilpotent; elementary →
hyperelementary → solvable; nonabelian simple → perfect, quasisimple and almost simple; perfect and
nontrivial → not solvable; squarefree order → Z-group. *Needs:* 1.1–1.7; Tau Ceti elementary
groups.

**Checks.** Each non-implication has a witness:
- supersolvable, not nilpotent: `S₃` (order `6`); solvable, not supersolvable: `A₄` (order `12`);
  metabelian, not metacyclic: `C₂ × C₂ × C₂` (order `8`); A-group, not Z-group: `C₂ × C₂`;
  metacyclic, not Z-group: `Q₈`; rational, not supersolvable: `S₄` (order `24`).
- quasisimple, not almost simple: `SL(2,5)` (order `120`); almost simple, not quasisimple: `S₅`
  (order `120`); the smallest quasisimple and the smallest almost simple group is `A₅` (order `60`),
  whose subgroup of order `2` is neither, which witnesses non-closure of both classes under
  subgroups.
- perfect, not quasisimple: `A₅ × A₅` (order `3600`).

### Examples

`S₄`: supersolvable no, metabelian no, A-group no, rational yes, complete yes. `Q₈`: metacyclic
and supersolvable yes, A-group no, rational yes. `A₄`: A-group and metabelian yes, supersolvable and
rational no.

### Dependencies

Layer 0; Mathlib; Tau Ceti `TauCeti.GroupTheory.Elementary`;
InverseGaloisAndArithmeticFundamentalGroups IG.4.4 (the comparison of supersolvability predicates
in 1.1 only).

## Layer 2: Hall's theorem and its converse

### 2.1 Hall subgroups, Hall's theorem and Hall's converse

Define `IsHallFor π H` for a set of primes `π`: every prime dividing `Nat.card H` lies in `π` and
no prime dividing `H.index` does. Prove Hall's theorem `exists_isHallFor_of_isSolvable`: a finite
solvable group has a Hall `π`-subgroup for every `π` (robinson, §9.1). Route: induction on the
order. A minimal normal subgroup `N` of `G` is an elementary abelian `p`-group (0.3), and `G ⧸ N`
has a Hall `π`-subgroup `K ⧸ N` by induction. If `p ∈ π`, then `K` is a Hall `π`-subgroup of `G`.
If `p ∉ π`, then `N` is a normal subgroup of `K` whose order is prime to its index, so it has a
complement `H` in `K` (Mathlib `Subgroup.exists_right_complement'_of_coprime`), and `H ≅ K ⧸ N` is a
Hall `π`-subgroup of `G`. Conjugacy of Hall subgroups is not used here.

Prove Hall's converse `isSolvable_of_forall_exists_isHallFor_compl`: a finite group with a
`p`-complement for every prime `p` is solvable (robinson, §9.1). Route (Wielandt): induction on
the order. With at most two prime divisors, Burnside's `pᵃqᵇ` theorem applies. Otherwise take
complements `H₁, H₂, H₃` for three distinct primes; each `Hᵢ` inherits the hypothesis (its
intersections with the other complements are complements in it), so is solvable by induction; a
minimal normal subgroup `N` of `H₁` is a `q`-group, and as `G = H₁ Hⱼ` for a complement `Hⱼ` with
`q ∤ [G : Hⱼ]`, the normal closure of `N` lies in `Hⱼ`, giving a nontrivial solvable normal
subgroup of `G`; conclude by induction on `G` modulo it. Together with Hall's theorem at
`π = {q | q ≠ p}`: a finite group is solvable iff it has a `p`-complement for every prime `p`.
*Needs:* Mathlib `Subgroup.exists_right_complement'_of_coprime`; Tau Ceti
`TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow`; 0.3.

- `IsHallFor {p} H` iff `H` is a Sylow `p`-subgroup; `Nat.Coprime (Nat.card H) H.index` iff
  `IsHallFor π H` for some `π`.
- `IsHallFor π ⊤` iff every prime factor of `Nat.card G` lies in `π`; `IsHallFor π ⊥` iff none
  does.

**Checks.**
- In `S₃`, `A₃` is a Hall `{3}`-subgroup and each `⟨(ij)⟩` a Hall `{2}`-subgroup; `⊥` is a Hall
  `π`-subgroup exactly when no prime factor of `6` lies in `π`.
- Solvability is needed in Hall's theorem: `A₅` has no Hall `{3, 5}`-subgroup (no subgroup of order
  `15`) and no `3`-complement (no subgroup of order `20`), consistent with Hall's converse.
- `S₄` has a `2`-complement (order `3`) and a `3`-complement (order `8`), and is solvable.
- The trivial group: `⊥ = ⊤` is a Hall `π`-subgroup for every `π` (order and index `1`).

### Examples

`A₄`: complements of orders `3` and `4` exist. `A₅`: a `5`-complement exists (`A₄`, order `12`), a
`2`-complement (order `15`) and a `3`-complement (order `20`) do not.

### Dependencies

Layer 0; Mathlib (Schur–Zassenhaus); Tau Ceti (Burnside).

## Layer 3: automorphisms, autjugacy and divisions

### 3.1 Inner and outer automorphisms

Define `Inn(G)` as the range of `MulAut.conj` and `Out(G) = MulAut G ⧸ Inn(G)`. Prove `Inn(G)` is
normal and isomorphic to `G ⧸ Z(G)`, `|Out(G)| · |G ⧸ Z(G)| = |MulAut G|`, functoriality along
`≃*`, `Out(G)` trivial iff every automorphism is inner, and for abelian `G` `Out(G) ≅ MulAut G`.
The count `|MulAut C_n| = φ(n)` is Mathlib's `IsCyclic.card_mulAut`. *Needs:* Mathlib `MulAut`,
`IsCyclic.card_mulAut`.

**Checks.**
- `|Out(Q₈)| = 6`: `MulAut Q₈ ≅ S₄` has order `24` and `Inn(Q₈) ≅ V₄`.
- `|Out(S₆)| = 2`, `|Out(A₅)| = 2`, `|Out(S₄)| = 1`.
- `|Out(C₅)| = φ(5) = 4`, since `Inn` is trivial for abelian groups.

### 3.2 Automorphism groups as groups

The classes of Layer 1 and of Mathlib apply to `MulAut G` and `Out(G)`; nothing new is defined.
Prove `MulAut G` is finite and that solvability does not pass to automorphism groups:
`MulAut (C₂ × C₂ × C₂) ≅ GL₃(𝔽₂)` has order `168` and is not solvable. *Needs:* 3.1.

**Checks.**
- `MulAut (C₂ × C₂) ≅ S₃`, nonabelian although `C₂ × C₂` is abelian.
- `MulAut C₈ ≅ C₂ × C₂` is not cyclic although `C₈` is.
- `MulAut (C₂ × C₂ × C₂)` has order `168 = 7 · 6 · 4`.

### 3.3 Autjugacy classes

Define the autjugacy classes as the orbits of `MulAut G` on `G`. Prove that `ConjClasses G` maps
onto them, with fibres the orbits of `Out(G)` on classes; elements of one autjugacy class have the
same order and class size; there are at most as many autjugacy classes as conjugacy classes.
Autjugacy of subgroups is the orbit relation of `MulAut G` on `Subgroup G`. *Needs:* 3.1; Mathlib
`MulAction.orbitRel.Quotient`.

**Checks.**
- `C_n` has one autjugacy class per divisor of `n` (elements of equal order are autjugate).
- `Q₈` has `3`: `{1}`, `{−1}` and the six elements of order `4`.
- `A₄` has `4` conjugacy classes and `3` autjugacy classes: `MulAut A₄ ≅ S₄` merges the two classes
  of `3`-cycles.

### 3.4 Subgroup counts

Define the counts `s(G)` of subgroups (`Nat.card (Subgroup G)`), `c(G)` of conjugacy classes of
subgroups (orbits of `MulAut.conj` acting on `Subgroup G`), `n(G)` of normal subgroups
(`Nat.card (NormalSubgroup G)`) and `ch(G)` of characteristic subgroups. Prove
`ch(G) ≤ n(G) ≤ c(G) ≤ s(G)`: a characteristic subgroup is normal, a normal subgroup is a class
by itself, and the classes partition the subgroups. Prove that `n(G) = c(G)` iff `c(G) = s(G)` iff
every subgroup of `G` is normal: each equality says that every class is a single normal subgroup.
The four counts are invariant under `≃*`, which carries subgroups, classes, normal and
characteristic subgroups to the same of the other group. The route is the proof.
*Needs:* Mathlib `Subgroup.Normal`, `Subgroup.Characteristic`, `MulAut.conj`,
`MulAction.orbitRel.Quotient`.

**Checks.**
- The chain on `Q₈` is `3 ≤ 6 ≤ 6 ≤ 6` and on `S₃` it is `3 ≤ 3 ≤ 4 ≤ 6`; on the trivial group all
  four counts are `1`.
- `Q₈`: `6` subgroups in `6` classes, `6` normal, `3` characteristic (`⊥`, the centre, `⊤`;
  `MulAut Q₈` permutes `⟨i⟩, ⟨j⟩, ⟨k⟩`).
- `C_n`: each count is the number of divisors of `n`.
- `S₃`: `6` subgroups in `4` classes, `3` normal, `3` characteristic.

### 3.5 Power maps and order statistics

Define the power map `P_n : ConjClasses G → ConjClasses G`, `[g] ↦ [g^n]`, well defined because
conjugation commutes with powers, and the order statistics `o_G(m) = #{g : orderOf g = m}`. Prove:
`∑_m o_G(m) = |G|`; `o_G(1) = 1`; `o_G(m) = 0` unless `m ∣ Monoid.exponent G`, and the exponent is
the lcm of the `m` with `o_G(m) ≠ 0`; `φ(m) ∣ o_G(m)`, since the elements of order `m` are the
generators of the cyclic subgroups of order `m`; `P_n ∘ P_{n'} = P_{n n'}`, `P_n = P_{n'}` when
`n ≡ n'` modulo the exponent, and `P_n` is a bijection when `n` is prime to the exponent; `o_G` and
the power maps are invariant under `≃*`. *Needs:* Mathlib `orderOf`, `Monoid.exponent`, `IsConj`,
`Nat.totient`.

**Checks.**
- `φ(m) ∣ o_G(m)`: in `S₄`, `o(3) = 8` and `o(4) = 6` are even, and in `C₄ × C₄`, `o(4) = 12`; a
  model counting cyclic subgroups instead of elements gives `4`, `3` and `6`.
- `S₄`: orders `1¹ 2⁹ 3⁸ 4⁶` (`9 = 6` transpositions `+ 3` double transpositions).
- `Q₈`: `1¹ 2¹ 4⁶`; `C₄ × C₄`: `1¹ 2³ 4¹²`.
- The power map by `2` on `S₃` sends the class of `3`-cycles to itself and transpositions to `1`.

### 3.6 Divisions

Define `divisionSetoid` and `Division G`. Prove that element order and class size are constant on
a division, that `ConjClasses G` maps onto `Division G`, that `x` and `y` lie in one division iff
`⟨y⟩` is conjugate to `⟨x⟩`, and that `|Division G| ≤ |ConjClasses G|` with equality iff
`IsRationalGroup G` (1.4). Route: a power `x^n` with `n` prime to `orderOf x` generates `⟨x⟩`, so it
has the order of `x` and the same centralizer, hence a class of the same size; the generators of
`⟨x⟩` are exactly these powers, so `⟨y⟩` is conjugate to `⟨x⟩` iff `y` is conjugate to one of them;
the divisions are unions of classes, with equality of counts iff each division is one class, which
is 1.4's condition. The route is the proof. *Needs:* Mathlib `IsConj`, `orderOf`.

- A maximal division is one whose representatives generate maximal cyclic subgroups.

**Checks.**
- `C_n` has one division per divisor of `n`; `C₃` has `2` divisions and `3` classes.
- `A₄` has `3` divisions (the two classes of `3`-cycles merge, `(123)² = (132)`); `A₅` has `4` (the
  two classes of `5`-cycles merge).
- `S₄` has `5` divisions and `5` classes (rational).

### 3.7 Divisions as orbits of the cyclotomic action

Define the action of `(ZMod (Monoid.exponent G))ˣ` on `ConjClasses G` by powering,
`u • [g] = [g^(u.val)]`, and prove `divisionSetoid_iff_exists_smul`: for finite `G`, `x` and `y`
lie in one division iff some unit `u` carries the class of `x` to the class of `y`, so the
divisions are the orbits of the action and correspond to them class by class. Route: a unit
modulo the exponent `e` is prime to `orderOf x`, which divides `e`; conversely an exponent `n`
prime to `orderOf x` lifts, by the Chinese remainder theorem, to a unit modulo `e` with the same
residue modulo `orderOf x`. Hence the number of divisions is the number of orbits. The route is
the proof. Through `IsCyclotomicExtension.autEquivPow`, this is the action of `Gal(ℚ(ζ_e)/ℚ)` on
classes.
*Needs:* 3.6; Mathlib `ZMod`, `Monoid.exponent`.

**Checks.**
- `A₄`, `e = 6`: `(123)` and `(132)` lie in one division (`(123)² = (132)`) and the unit `5` sends
  `[(123)]` to `[(132)]`, true and true; `(123)` and `(12)(34)` have orders `3` and `2`, so they lie
  in different divisions and no unit relates their classes, false and false. The orbits are `{1}`,
  `{V₄ ∖ 1}` and the two `3`-cycle classes: `3`, the division count. A statement only equating the
  two counts would also hold for a bijection pairing the division `{1}` with the orbit of the
  `3`-cycle classes.
- `C₃`, `e = 3`: the unit `2` swaps `[g]` and `[g²]`.
- The trivial group: `e = 1`, `ZMod 1` has one unit, one orbit, one division.

### Examples

`S₄`: `|Out| = 1`, `5` classes, `5` divisions, `5` autjugacy classes. `Q₈`: `|Out| = 6`, `5`
classes, `5` divisions, `3` autjugacy classes. `A₅`: `|Out| = 2`, `5` classes, `4` divisions.

### Dependencies

Mathlib; Layer 1 (1.4) for 3.6.

## Layer 4: commutators, isoclinism and stem groups

### 4.1 Commutator length

Define `commutatorLength G` as the least `k` with `commutator G ⊆ commutatorSet G ^ k`. Prove:

- the `sInf` is attained for finite `G` (the powers increase and exhaust `commutator G`, since
  `commutatorSet G` generates and is closed under inverses);
- `commutatorLength G = 0` iff `G` is abelian;
- `commutatorLength G ≤ 1` iff every element of `commutator G` is a commutator, and
  `commutatorLength G = 1` iff moreover `G` is nonabelian;
- invariance under `≃*` and `commutatorLength (G × H) = max (commutatorLength G) (commutatorLength H)`;
- **Guralnick's theorem** `commutatorLength_le_one_of_card_lt`: a finite group of order less than
  `96` has `commutatorLength G ≤ 1`, and there are groups of order `96` with commutator length `2`
  (guralnick-1980, pp. 651–654; the threshold `96` and the two groups of that order are restated in
  kunyavskii-2020, §3, p. 6).

The route to Guralnick's theorem is his argument; a check over a classification of the groups of
each order below `96` would need that classification, which is not built here. *Needs:* Mathlib
`commutatorSet`, pointwise powers of sets.

**Checks.**
- `C₂`: `commutator C₂ = ⊥ = commutatorSet C₂ ^ 0`, so the length is `0`, not `1`; abelian groups
  have length `0`.
- `S₃`: the three elements of `A₃` are commutators (`⁅(12), (13)⁆` is a `3`-cycle), length `1`.
- `Q₈`: `commutator Q₈ = {±1}` and `−1 = ⁅i, j⁆`, length `1`.

### 4.2 The commutator map

Define `commutatorMap G : G ⧸ Z(G) → G ⧸ Z(G) → commutator G`, well defined because central factors
do not change a commutator. Its image is `commutatorSet G`, which generates `commutator G`; it is
natural along `≃*`, which carries centres, commutators and commutator subgroups to the same. The
route is the proof.
*Needs:* Mathlib `QuotientGroup`, `commutatorElement_def`.

**Checks.**
- `Q₈`: `G ⧸ Z ≅ C₂ × C₂` and `commutatorMap` sends `(ī, j̄)` to `ij(−i)(−j) = −1` and `(ī, ī)` to `1`.
- For abelian `G` the map is constant `1`.
- `S₃`: `Z = 1`, so the map is the commutator on `S₃` itself.

### 4.3 Isoclinism

Define `Isoclinism G H` (isomorphisms of central quotients and commutator subgroups compatible with
the commutator maps) and `Isoclinic G H`. Prove it is an equivalence relation, `G` is isoclinic to
`G × A` for abelian `A`, isoclinic groups have isomorphic central quotients and commutator
subgroups, and for nonabelian isoclinic `G, H` equal nilpotency classes and equal derived lengths
(hall-1940: the definition pp. 132–133, the equivalence relation p. 133, the terms of the lower
central and derived series from the second on as invariants of the class p. 134, `G` isoclinic to
`G × A` for abelian `A` p. 135). *Needs:* 4.2.

**Checks.**
- `C₂` and `C₄` are isoclinic (trivial central quotients and commutators), so the order is not an
  invariant.
- `D₄` and `Q₈` are isoclinic (central quotient `C₂ × C₂`, commutator `C₂`); `S₃` and `C₂` are not
  (commutator orders `3` and `1`).
- `C₂` and the trivial group are isoclinic with nilpotency classes `1` and `0`: the class
  statement needs nonabelian groups.

### 4.4 Stem groups

Define `IsStemGroup G`: the centre lies in the commutator subgroup. Prove
`exists_isoclinic_isStemGroup`: every finite group is isoclinic to a finite stem group, and the
stem groups of an isoclinism class are exactly its groups of least order (hall-1940, p. 135:
existence of stem groups in every class, and for finite groups their characterisation by least
order). The kernel of a stem extension of `G` is a quotient of the Schur multiplier by
InductionRestrictionPartII §RS.0.1, and the bound is attained: a Schur cover of `G`
(InductionRestriction Layer 7) is a stem extension whose kernel IG.3.4 identifies with `M(G)`.
Tau Ceti proves the existence of such a finite stem extension, lifting every projective
representation over an algebraically closed field
(`TauCeti.exists_finite_stem_factorSet_bijective_characterTransgression` and
`TauCeti.exists_finite_stem_extension_lifting_pgl`, in
`TauCeti/RepresentationTheory/ProjectiveRepresentation/RepresentationGroup/{Basic,Lifting}.lean`,
which landed after this repository's Tau Ceti pin).
*Needs:* 4.3; for the multiplier statements only, InductionRestrictionPartII §RS.0.1,
InductionRestriction Layer 7 and InverseGaloisAndArithmeticFundamentalGroups IG.3.4.

**Checks.**
- `Q₈`, `D₄`, `S₃` and the trivial group are stem groups; `C₂` is not.
- `D₄ × C₂` is not a stem group (centre `C₂ × C₂`, commutator `C₂`) and is isoclinic to the stem
  group `D₄` of half its order.
- The stem groups isoclinic to an abelian group are the trivial group only.

### Examples

`S₄`: commutator length `1`, stem. `Q₈`: commutator length `1`, stem, isoclinic to `D₄`.
`C₄ × C₄`: commutator length `0`, isoclinic to the trivial group.

### Dependencies

Mathlib; InductionRestrictionPartII §RS.0.1, InductionRestriction Layer 7 and
InverseGaloisAndArithmeticFundamentalGroups IG.3.4 (4.4).

## Layer 5: the subgroup lattice and faithful permutation degrees

### 5.1 The Möbius functions

Define `mobiusSub H = μ(H, G)` on `Subgroup G` and `mobiusQuo N = μ(1, N)` on `NormalSubgroup G`.
Prove the recursions `μ(G, G) = 1`, `μ(H, G) = −∑_{H < K ≤ G} μ(K, G)`, invariance under
automorphisms, `μ(1, C_n) = μ(n)` (the arithmetic Möbius function), and Hall's vanishing theorem:
`μ(H, G) = 0` unless `H` is an intersection of maximal subgroups, so `μ(H, G) = 0` when `H` does not
contain `frattini G` (hall-1936, pp. 134–151; the vanishing theorem is restated in
dallavolta-lucchini-2021, p. 3). Route for the vanishing: the coatoms of the
interval `[H, G]` of `Subgroup G` are the maximal subgroups containing `H`, and by the crosscut
theorem `μ(H, G) = ∑_k (−1)^k N_k`, with `N_k` the number of `k`-element sets of these coatoms whose
intersection is `H`; every `N_k` is `0` when `H` is no such intersection. *Needs:* Mathlib
`IncidenceAlgebra.mu`, `frattini`.

**Checks.**
- `A₄`: `μ(C₃) = μ(V₄) = −1`, `μ(C₂) = −(1 − 1) = 0`, `μ(1) = −(1 − 1 − 4 + 0) = 4`.
- `μ(1, S₄) = −12`, `μ(1, A₅) = −60`, `μ(1, Q₈) = 0` (the Frattini subgroup is nontrivial).
- `mobiusQuo`: `μ(1, C₂ × C₂) = −(1 − 3) = 2`; on the chain `⊥ < A₃ < S₃`, `μ(1, S₃) = 0`.

### 5.2 Eulerian functions

Define `eulerian G k`, the number of `k`-tuples generating `G`. Prove Hall's formula
`eulerian_eq_sum_mobiusSub`: `φ_k(G) = ∑_H μ(H, G) |H|^k`, by Möbius inversion on `Subgroup G` of
`|G|^k = ∑_H φ_k(H)`, which holds because every `k`-tuple generates exactly one subgroup
(hall-1936, pp. 134–151; the formula is (1.1) of dallavolta-lucchini-2021, p. 2; the route is the
proof). Also: `φ_k(G) ≠ 0` iff `G` is generated by at
most `k` elements, equivalently by the entries of some `k`-tuple (a tuple may repeat entries);
`MulAut G` acts freely on generating tuples, so `|MulAut G|` divides `φ_k(G)`. *Needs:* 5.1.

**Checks.**
- `S₃`, `k = 2`: `36 − 9 − 3 · 4 + 3 · 1 = 18 = 6 · 3`, divisible by `|MulAut S₃| = 6`.
- `C₂ × C₂`, `k = 2`: `16 − 3 · 4 + 2 · 1 = 6 = |GL₂(𝔽₂)|`.
- `k = 0`: `φ_0(G) = ∑_H μ(H, G) = 0` for nontrivial `G`, and `1` for the trivial group.
- `C₂`: `φ_0 = 0`, `φ_1 = 2 − 1 = 1` and `φ_5 = 2⁵ − 1 = 31`; `C₂` is generated by at most `1` and
  at most `5` elements but not by `0`, so the criterion gives true/true at `k = 1, 5` and
  false/false at `k = 0`, while "a generating set of exactly `k` elements" would fail at `k = 5`.

### 5.3 Faithful irreducible characters by Möbius inversion

Prove `card_faithful_irreducibleCharacters`: the number of faithful irreducible complex characters
is `∑_N μ(1, N) k(G ⧸ N)`, `k` the class number, by Möbius inversion of
`k(G ⧸ N) = ∑_{M ≥ N} #{χ : ker χ = M}` on `NormalSubgroup G`. *Needs:* 5.1; Tau Ceti
`TauCeti.card_irreducibleCharacters`, `FDRep.mem_ker_iff_char_eq`.

**Checks.**
- `C₂`: `2 − 1 = 1`, the sign character.
- `C₂ × C₂`: `4 − 3 · 2 + 2 · 1 = 0`, no faithful irreducible character.
- `S₃`: `3 − 2 + 0 = 1`, the two-dimensional character.

### 5.4 The minimal faithful permutation degree

Define `permutationDegree G`, the least `n` with an injective `G →* Equiv.Perm (Fin n)`. Prove
Johnson's formula `permutationDegree_eq_sInf_sum_index`: it is the least total index of a finite
family of subgroups whose cores intersect trivially (johnson-1971, pp. 857–866; the reformulation
through faithful collections of subgroups is est-2010, §2, p. 2). Route: an action
of `G` on `Fin n` is the disjoint union of its orbits `G ⧸ H_i`, `H_i` a point stabilizer, its
kernel is `⨅ core(H_i)` and `n = ∑ [G : H_i]`; dropping repeated stabilizers keeps the kernel and
does not increase the sum, and conversely the disjoint union of the `G ⧸ H`, `H` in a family with
trivially intersecting cores, is a faithful action on `∑ [G : H]` points. The route is the proof.
The transitive degree is the least index of a core-free subgroup; it is at least the permutation
degree, with equality when `G` has a unique minimal normal subgroup `N`, since a family of subgroups
none of which is core-free has all cores containing `N`. *Needs:* Mathlib `Subgroup.normalCore`,
`Subgroup.index`.

**Checks.**
- `C₆`: `2 + 3 = 5`, less than the transitive degree `6`; `C₄ × C₄`: `4 + 4 = 8`, transitive degree `16`.
- `Q₈`: `8` (every nontrivial subgroup contains the centre).
- The trivial group has degree `0` (the empty family, whose infimum `⊤` is `⊥`); `S_n` has degree `n`
  for `n ≥ 2`.

### Examples

`S₄`: `μ(1) = −12`, `φ₂ = 216` (`|MulAut S₄| = 24` divides it), two faithful irreducible characters
(`5 − 3 = 2`, both of degree `3`), permutation degree `4`. `Q₈`: `μ(1) = 0`, one faithful irreducible character,
permutation degree `8`.

### Dependencies

Mathlib; Tau Ceti character table (5.3).

## Layer 6: rational characters, Schur indices and faithful degrees

### 6.1 Character fields

Define `characterField G χ = ℚ(χ(g) : g ∈ G) ⊆ ℂ`. It lies in `ℚ(ζ_e)`, is Galois over `ℚ` with
abelian group, and is the fixed field of the stabilizer of `χ` (CharacterTheory §4.4,
`fieldOfValues_eq_map_fixedField_stabilizer`); its degree is the size of the Galois orbit of `χ`;
the conductor of `χ` is the least `n` with `characterField G χ ⊆ ℚ(ζ_n)`, a divisor of `e`.
*Needs:* CharacterTheory §4.4; Mathlib `IntermediateField.adjoin`.

**Checks.**
- `C₃`, `χ(g) = ω`: `ℚ(√−3)`, degree `2`, conductor `3`.
- Every character of `S_n` and of `Q₈` has field `ℚ`.
- The degree-three characters of `A₅` have field `ℚ(√5)`, conductor `5`.

### 6.2 Galois orbits and Brauer's permutation lemma

Define `GaloisConj χ ψ`: `ψ(g) = χ(g^n)` for some `n` prime to `e`; by CharacterTheory §4.4 and
`IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction_apply` its classes are the orbits of
`Gal(ℚ(ζ_e)/ℚ)`. Prove `card_quot_galoisConj_eq_card_division`: the number of Galois orbits of
irreducible characters equals the number of divisions (isaacs, Theorem 6.32). Route: the character
table intertwines the two permutation actions of `Gal(ℚ(ζ_e)/ℚ)` (on characters and, by 3.7, on classes) and is
invertible, so each element fixes as many characters as classes; count orbits by Burnside's lemma.
*Needs:* 3.7; CharacterTheory §4.4; Tau Ceti `TauCeti.irreducibleCharacters`.

**Checks.**
- `S₄`, `Q₈`, `SL(2,3)`: `5` orbits; `A₄`: `3`; `A₅`: `4` — the division counts.
- `C₃`: the two nontrivial characters form one orbit; `2` orbits, `2` divisions.
- A rational group has singleton orbits, so the orbit count equals the class count.

### 6.3 Rational characters

Define `rationalCharacter G o` as the sum of the characters in the orbit `o`. It is integer-valued,
its values being algebraic integers fixed by `Gal(ℚ(ζ_e)/ℚ)`, and constant on divisions, since
`χ(x^n)` is the value at `x` of the Galois conjugate of `χ` by `ζ_e ↦ ζ_e^n` (CharacterTheory §4.4)
and the orbit sum is unchanged. Prove `existsUnique_eq_sum_rationalCharacter`: every `ℚ`-valued
function on `G` constant on divisions is a unique `ℚ`-combination of the rational characters, so
the rational characters are a `ℚ`-basis of that space and the rational character table (orbits by
divisions) is square and invertible over `ℚ`. The space is of `ℚ`-valued functions: the constant
complex function `i` on the trivial group is constant on its one division and is not a rational
multiple of the trivial character. Route: the rational characters of distinct orbits are sums over
disjoint sets of irreducible characters, hence pairwise orthogonal and nonzero, hence linearly
independent; they lie in the space of `ℚ`-valued functions constant on divisions, whose dimension
is the number of divisions, which 6.2 equates with their number. The route is the proof.
*Needs:* 6.2, 3.6; CharacterTheory §4.4.

**Checks.**
- `C₃`: rational characters `(1, 1, 1)` and `(2, −1, −1)` on `1, g, g²`; the table on the divisions
  `{1}`, `{g, g²}` is `[[1, 1], [2, −1]]` with determinant `−3 ≠ 0`.
- `A₅`: the orbit of the degree-three characters gives `(6, −2, 0, 1, 1)` on the classes of `1`,
  double transpositions, `3`-cycles and the two classes of `5`-cycles (`(1 + √5)/2 + (1 − √5)/2 = 1`).
- The trivial group: one orbit, rational character `1`, and the space is `ℚ` with basis `[1]`.

### 6.4 The Schur index

Define `schurIndex F χ` for `F : IntermediateField ℚ ℂ`: the least `[E : F(χ)]` over finite
extensions `F(χ) ⊆ E ⊆ ℂ` carrying a representation with character `χ` (finite, since `ℚ(ζ_e)`
realizes every `χ`, Tau Ceti's Brauer splitting field through CharacterTheory §4.5). It is
ArithmeticGaloisRepresentations §5.5's Schur index written with characters:

- `schurIndex F χ` is the index `s(ρ)` (`TauCeti.Algebra.index`) of the image algebra `B(ρ)` over
  `F(χ)` of a realization `ρ` of `χ` over the algebraic closure `F̄` of `F` in `ℂ` (one exists by
  CharacterTheory §4.5, and it is absolutely irreducible); the trace field of `ρ` over `F` is `F(χ)`.
  Route: a finite extension of `F(χ)` inside `ℂ` lies in `F̄`, and such a field realizes `χ` exactly
  when it splits `B(ρ)` (§5.5); some splitting field has degree the index
  (`TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`; it embeds in `F̄` over `F(χ)`), and
  every finite splitting field `E` has degree divisible by the index `s`: for the division algebra
  `Δ` with `B(ρ) ≅ M_a(Δ)`, `Δ ⊗ E ≅ M_s(E)`, so the simple module `E^s` is a `Δ`-vector space of
  `F(χ)`-dimension `s [E : F(χ)]`, a multiple of `dim Δ = s²`.

Prove `schurIndex_dvd_degree`: the Schur index divides `χ(1)`; through the identification above it
is §5.5's `s(ρ) ∣ n` (isaacs, Corollary 10.2; curtis-reiner-1962, §70). Prove Brauer–Speiser
`schurIndex_le_two_of_real`: a real-valued `χ` has Schur index at most `2`
over `ℚ` (isaacs, Chapter 10, p. 171). Also: the Schur index over `ℂ` is `1`; over `ℝ` it is `1` iff
the Frobenius–Schur indicator is not `−1` (CharacterTheory Layer 7,
`Representation.frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal`); it divides `[E : F(χ)]`
for every realization field `E` (isaacs, Corollary 10.2); and Galois-conjugate characters have the
same Schur index over `ℚ`, since applying an embedding `τ : E → ℂ` extending
`σ ∈ Gal(ℚ(ζ_e)/ℚ)` to the matrices of a realization of `χ` over `E` realizes `σ · χ` over `τ(E)`,
with `[τ(E) : ℚ(σ · χ)] = [E : ℚ(χ)]`. *Needs:* 6.1; ArithmeticGaloisRepresentations §5.5; Tau Ceti
`TauCeti.Algebra.index`, `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`;
CharacterTheory §4.4, §4.5 and Layer 7.

**Checks.**
- The degree-two character of `Q₈` has Schur index `2` over `ℚ` and over `ℝ` (indicator `−1`;
  Hamilton's quaternions realize it).
- The degree-two character of `D₄` has Schur index `1` (indicator `+1`), although its table agrees
  with `Q₈`'s.
- Linear characters and all characters of `S_n` have Schur index `1` over `ℚ`.
- Agreement with §5.5: for `Q₈` over `ℚ` the image algebra of the degree-two realization is the
  rational quaternion algebra `(−1, −1)_ℚ`, a division algebra of index `2`, the value above; for
  `C₃` and `χ(g) = ω` over `ℚ`, `F(χ) = ℚ(√−3)` and the image algebra is `ℚ(√−3)` itself, of
  dimension `1` and index `1`. A model taking the index of the `ℚ`-span of the image, rather than of
  the algebra over `F(χ)`, fails on `C₃`: that span is `ℚ(√−3)`, which is not central over `ℚ`.

### 6.5 Irreducible rational representations

Prove `exists_character_eq_schurIndex_mul_rationalCharacter`: the character of an irreducible
`Representation ℚ G V` on a finite-dimensional `V` is `m_ℚ(χ) · ∑_{ψ ∈ o} ψ` for an irreducible
`χ` with orbit `o`. Prove the converse `exists_isIrreducible_character_eq_schurIndex_mul`: for
every irreducible `χ` there is an irreducible rational representation with character
`m_ℚ(χ) · ∑_{ψ ∈ o} ψ`, `o` the orbit of `χ`. Two irreducible rational representations with the
same orbit then have the same character and are equivalent (Tau Ceti
`Representation.nonempty_equiv_of_character_eq`), so irreducible rational representations
correspond to Galois orbits, with `dim V = m_ℚ(χ) · |o| · χ(1)` (curtis-reiner-1962, §70,
(70.15)).

Both theorems are ArithmeticGaloisRepresentations §5.6 at the perfect field `k = ℚ`, `Γ = G`, with
`ℚ̄` the algebraic closure of `ℚ` in `ℂ`; what this roadmap owns is their translation into
irreducible complex characters, their Galois orbits and `rationalCharacter`. Route: for a simple
`ℚ[G]`-module `V`, §5.6 gives `V ⊗ ℚ̄ ≅ ⊕_τ ρ_τ^{⊕ s}` with pairwise non-isomorphic absolutely
irreducible `ρ_τ`, all of Schur index `s`, forming one `Gal(ℚ̄/ℚ)`-orbit; every irreducible complex
character is the character of a representation over `ℚ(ζ_e) ⊆ ℚ̄` (CharacterTheory §4.5), and
`Gal(ℚ̄/ℚ)` acts on characters through `Gal(ℚ(ζ_e)/ℚ)`, whose orbits are those of 6.2
(CharacterTheory §4.4); so the characters of the `ρ_τ` are the orbit `o` of one `χ`, each once, and
`s = schurIndex ⊥ χ` by 6.4. For the converse, §5.6 puts a realization of `χ` over `ℚ̄`, whose trace
field `ℚ(χ) ⊆ ℚ(ζ_e)` is finite over `ℚ`, in the scalar extension of a simple `ℚ[G]`-module, and the
first part computes its character. *Needs:* 6.2, 6.3, 6.4; ArithmeticGaloisRepresentations §5.6;
CharacterTheory §4.4, §4.5; Tau Ceti `Representation.nonempty_equiv_of_character_eq`.

**Checks.**
- `Q₈`: the irreducible rational representation on the quaternions has dimension `4` and character
  `2 χ` (`χ` of degree `2`).
- `C₃`: rotation by `2π/3` on `ℚ²` has character `(2, −1, −1)`, Schur index `1`, orbit of size `2`.
- The trivial representation has character `1 · 1`; for the trivial group the converse gives the
  trivial representation of `ℚ`, with Schur index `1` and rational character `1`.
- `C₃`, `χ` the character with `χ(g) = ω`: the converse gives the rotation representation on `ℚ²`
  above, not a one-dimensional rational representation (there is none with character `χ`, whose
  values are not rational).

### 6.6 Rational groups by characters

Prove `isRationalGroup_iff_forall_mem_range`: `G` is rational iff every irreducible character is
`ℚ`-valued. Route: by 3.7 and 6.2, all classes are fixed by `Gal(ℚ(ζ_e)/ℚ)` iff all characters are
fixed. Corollary: `G` is rational iff the number of Galois orbits equals the class number.
*Needs:* 1.4, 3.7, 6.2.

**Checks.**
- `S₃`: rational, characters integer-valued (true/true).
- `C₃`: not rational, value `ω ∉ ℚ` (false/false); `A₄`: not rational, values `ω` (false/false).
- `Q₈`: rational and `ℚ`-valued, with a character of Schur index `2`: rationality does not mean
  realizability over `ℚ`.

### 6.7 Monomial groups

Define `IsMonomial G`: every irreducible character is induced from a linear character of a
subgroup, with the induced character written out. Prove Taketa's theorem
`isSolvable_of_isMonomial` (isaacs, Theorem 5.12 and Corollary 5.13),
`isMonomial_of_isSupersolvable` and Taunt's theorem `isMonomial_of_isAGroup` for solvable A-groups
(isaacs, Theorems 6.22–6.23). Routes: Taketa by induction showing `G^(i) ≤ ker χ` for every `χ` of
degree at most the `i`-th distinct degree; supersolvable groups by Clifford theory through an
abelian normal subgroup not central (InductionRestriction Layer 5). Closed under quotients and
finite products. *Needs:* 1.1, 1.3; InductionRestriction Layer 5.

**Checks.**
- `S₃`, `A₄` and `S₄` are monomial (the degree-three characters of `S₄` are induced from `D₄`).
- `SL(2,3)` (order `24`) is solvable and not monomial: its degree-two characters are not induced,
  since an induced degree-two character comes from a subgroup of index `2`, which `SL(2,3)` lacks.
- `A₅` is not monomial (no subgroup of index `3`), consistent with Taketa.

### 6.8 Faithful character degrees

Define `irrDegreeC G` as the least degree of a faithful irreducible complex character, `⊤` if none.
Prove Gaschütz's criterion `irrDegreeC_lt_top_iff`: `G` has a faithful irreducible complex
character iff its socle is the normal closure of one element (gaschutz, pp. 253–255; the criterion is
restated in szechtman-2015, p. 4, as `T(G)`, the product of the abelian minimal normal subgroups,
being a cyclic `ℤ[G]`-module; for finite `G` this is equivalent to the socle being the normal closure
of one element, since each nonabelian minimal normal subgroup is the normal closure of any of its
nontrivial elements and the socle is the direct product of `T(G)` with the nonabelian ones). The least
degree of a faithful representation (not necessarily irreducible) is the least total degree of a
set of characters whose kernels meet trivially; over `ℝ` and `ℚ` the degrees follow from 6.4–6.5.
*Needs:* 0.7, 5.3, 6.4, 6.5; Tau Ceti `FDRep.mem_ker_iff_char_eq`.

**Checks.**
- `irrDegreeC S₄ = 3` (the degree-two character has kernel `V₄`); `irrDegreeC Q₈ = 2`.
- `irrDegreeC (C₄ × C₄) = ⊤`: the socle `C₂ × C₂` is not the normal closure of one element.
- `irrDegreeC C_n = 1` and `irrDegreeC` of the trivial group is `1` (socle `⊥` is the normal closure
  of `1`).

### Examples

`Q₈`: `5` orbits, rational, Schur index `2` on the degree-two character, the faithful rational
representation of least dimension has dimension `4`. `A₅`: `4` orbits, the rational character of
degree `6`, not monomial. `SL(2,3)`: `5` orbits, not monomial.

### Dependencies

Layers 0, 1, 3, 5; CharacterTheory §§4.4–4.5 and Layer 7; ArithmeticGaloisRepresentations
§§5.5–5.6 (6.4–6.5); InductionRestriction Layer 5; Tau Ceti character table and
`TauCeti.Algebra.index`.

## Layer 7: Gassmann equivalence and arithmetic equivalence

### 7.1 Gassmann equivalence in a finite group

For a finite group, Gassmann equivalence is InductionRestriction §2.1's almost-conjugacy, and
`AlmostConjugateOfFiniteIndex` agrees with it by that section's fixed-coset criterion. Prove that a
Gassmann class determines `Nat.card H`, `H.index`, the permutation character on `G ⧸ H`, the full
cycle type of every element on `G ⧸ H`, and the core of `H` (the kernel of the permutation
character); Gassmann equivalent normal subgroups are equal. The Gassmann classes of `G` are the
classes of conjugacy classes of subgroups under Gassmann equivalence. *Needs:* InductionRestriction
§2.1.

**Checks.**
- Conjugate subgroups are Gassmann equivalent.
- The three subgroups of index `2` of `C₂ × C₂` are pairwise not: an element of `H ∖ K` fixes both
  cosets of `H` and no coset of `K`.
- The pair in `S₁₆` of InductionRestriction §2.2 is Gassmann equivalent and not conjugate.

### 7.2 Gassmann triples

A Gassmann triple is a group with two Gassmann equivalent, non-conjugate subgroups. Prove that in
`GL₃(𝔽₂)` the stabilizers of a point and of a line of the Fano plane form a Gassmann triple of
index `7`: they are not conjugate (one fixes a point, the other no point), and every `g` fixes as
many points as lines. The points fixed by `g` are the nonzero vectors of `ker(g − 1)`; a line is
the kernel of a nonzero functional `f`, and `g` fixes it iff `f ∘ g⁻¹ = f` (over `𝔽₂` the only
nonzero scalar is `1`), iff `gᵀ` fixes `f`; as `dim ker(gᵀ − 1) = dim ker(g − 1)`, both counts are
`2^(dim ker(g − 1)) − 1`, so the permutation characters agree. The inverse-transpose automorphism
exchanges the two actions but does not preserve every conjugacy class, so it does not by itself
give the equality. *Needs:* 7.1; Mathlib `Matrix.GeneralLinearGroup`, `Matrix.rank_transpose`.

**Checks.**
- Every element of `GL₃(𝔽₂)` fixes as many points as lines: for an element of order `7`,
  `dim ker(g − 1) = 0` and both counts are `0`; for a transvection, `dim ker(g − 1) = 2` and both
  counts are `3`.
- The inverse-transpose automorphism `g ↦ (gᵀ)⁻¹` exchanges the two classes of elements of order
  `7`: for `g` the companion matrix of `x³ + x + 1`, `gᵀ` is conjugate to `g`, so `(gᵀ)⁻¹` is
  conjugate to `g⁻¹`, whose characteristic polynomial is the reciprocal `x³ + x² + 1`; a route
  through "the automorphism fixes every class" fails here.
- The point and line stabilizers have order `24`, index `7`.
- For index `2` no triple exists: subgroups of index `2` are normal (7.1).

### 7.3 Finite-index subgroups of an arbitrary group

Define `AlmostConjugateOfFiniteIndex H K` for subgroups of an arbitrary group `Γ` by fixed-coset
counts. Prove `almostConjugateOfFiniteIndex_iff_map`: for a normal subgroup `N` of finite index
contained in `H` and `K`, the relation holds iff it holds for the images in `Γ ⧸ N`, because
`Γ ⧸ H ≃ (Γ ⧸ N) ⧸ (H ⧸ N)` equivariantly; the route is the proof. Hence for a profinite `Γ` and
open `H, K` any open normal `N ≤ H ⊓ K` tests the relation, for instance a principal congruence
subgroup of `GL₂(ẑ)`. *Needs:* Mathlib `QuotientGroup`, `MulAction.fixedBy`.

**Checks.**
- `Γ = ℤ` (written multiplicatively), `H = K = 2ℤ`, `N = 4ℤ`: both sides hold.
- `Γ = ℤ²`, `H = 2ℤ × ℤ`, `K = ℤ × 2ℤ`, `N = 2ℤ × 2ℤ`: `γ = (1, 0)` fixes no coset of `H` and both
  cosets of `K`, so neither side holds.
- For finite `Γ` and `N = ⊥` the statement is the identity.

### 7.4 Bauer's theorem and Perlis' theorem

Prove Bauer's theorem `normalClosure_eq_of_dedekindZeta_eq`: two number fields `F`, `F'` inside an
algebraic closure `ℚ̄` of `ℚ` with `ζ_F = ζ_{F'}` have the same Galois closure in `ℚ̄`
(perlis-1977, §1). Route: equal zeta functions have equal coefficients
(`LSeries_eq_iff_of_abscissaOfAbsConv_lt_top`, with `NumberField.dedekindZeta` the L-series of the
ideal-counting function); an ideal of prime norm `p` is a prime of residue degree one, so the
coefficient of `p^{−s}` is the number of degree-one primes above `p`, which is at most `[F : ℚ]`
with equality iff `p` splits completely (`Ideal.sum_ramification_inertia_eq_finrank`); hence
`[F : ℚ] = [F' : ℚ]` and the two fields have the same completely split primes. Complete splitting
in `F` is complete splitting in its Galois closure `F̃` (Tau Ceti
`Ideal.ncard_primesOver_normalClosure_eq_finrank_iff`), so `F̃` and `F̃'` have the same completely
split primes, and so does their compositum `F̃ F̃'` (`Ideal.ncard_primesOver_sup_eq_finrank_iff`);
the completely split primes of a field have Dirichlet density `1 / [N : ℚ]` for `N` its Galois
closure (`NumberField.Chebotarev.hasDirichletDensity_setOf_ncard_primesOver_eq_finrank`), so
`[F̃ F̃' : ℚ] = [F̃ : ℚ] = [F̃' : ℚ]` and `F̃ = F̃'`. In particular every field arithmetically
equivalent to `F` embeds in `F̃`, so arithmetic equivalence is tested among the subgroups of one
Galois group. *Needs:* Tau Ceti `Ideal.ncard_primesOver_normalClosure_eq_finrank_iff`,
`Ideal.ncard_primesOver_sup_eq_finrank_iff`,
`NumberField.Chebotarev.hasDirichletDensity_setOf_ncard_primesOver_eq_finrank`; Mathlib
`NumberField.dedekindZeta`, `LSeries_eq_iff_of_abscissaOfAbsConv_lt_top`,
`Ideal.sum_ramification_inertia_eq_finrank`, `IntermediateField.normalClosure`, `AlgebraicClosure`.

**Checks.**
- `ℚ(⁸√−15)` and `ℚ(⁸√−240)` have equal zeta functions and one Galois closure, of degree `32`
  (desmit-perlis lines 29–32); the degree-one primes of either field are the totally split primes
  of that closure.
- `ℚ(√2)` and `ℚ(√3)`: the coefficients of `2^{−s}` agree (`1` and `1`, both ramified) and those of
  `3^{−s}` differ (`0`: `3` is inert in `ℚ(√2)`; `1`: `3` ramifies in `ℚ(√3)`), so the hypothesis
  fails; their Galois closures are the two fields themselves, which differ, so the hypothesis
  cannot be dropped.
- `F = F'`: both sides hold trivially; a field and its image under an automorphism of `ℚ̄` have the
  same zeta function and the same Galois closure, which is normal.
- A Galois field `F` is its own Galois closure, so a field arithmetically equivalent to `F` is a
  subfield of `F` of the same degree, hence `F` itself: arithmetically equivalent Galois fields are
  isomorphic.

Prove `dedekindZeta_eq_iff_almostConjugate`: for `L/ℚ` finite Galois and subgroups `H, K` of its
Galois group, the fixed fields have the same Dedekind zeta function iff `H` and `K` are Gassmann
equivalent (perlis-1977, Theorem 1). Route (⇐): the Euler factor of `ζ_{L^H}` at a prime `p` with
decomposition group `D` and inertia `I` is `det(1 − φ p^{−s} | ℂ[G ⧸ H]^I)^{−1}`, `φ` a Frobenius:
the primes above `p` correspond to the double cosets `H \ G / D`, that is to the `D`-orbits on
`G ⧸ H`, with `e · f` and `e` the relative indices of the conjugated decomposition and inertia
groups (Tau Ceti `Ideal.doubleCosetQuotientEquivPrimesOverOfIsIntegralClosure`,
`Ideal.ramificationIdx_mul_inertiaDeg_under_smul_eq_relIndex_of_isIntegralClosure`,
`Ideal.ramificationIdx_under_smul_eq_relIndex_inertia_of_isIntegralClosure`), so each residue
degree is the number of `I`-orbits in the `D`-orbit, and the determinant is a function of the
permutation character restricted to `D`; equal Euler factors give equal coefficients. Route (⇒):
equal zeta functions have equal coefficients (`LSeries_eq_iff_of_abscissaOfAbsConv_lt_top`); at an
unramified `p` with Frobenius class `[σ]`, the residue degrees of the primes above `p` are the
cycle lengths of `σ` on `G ⧸ H` (Tau Ceti
`NumberField.Chebotarev.map_inertiaDeg_eq_fullCycleType_of_mem_frobeniusPrimeSet`), so the number
of primes of degree one is the number of fixed points of `σ`; every class is the Frobenius class
of infinitely many unramified primes (`NumberField.Chebotarev.infinite_frobeniusPrimeSet`).
*Needs:* 7.1, 7.3; Tau Ceti `Ideal.doubleCosetQuotientEquivPrimesOverOfIsIntegralClosure` and its
`e · f` and inertia formulas, `NumberField.Chebotarev.frobeniusPrimeSet`,
`NumberField.Chebotarev.map_inertiaDeg_eq_fullCycleType_of_mem_frobeniusPrimeSet`,
`NumberField.Chebotarev.infinite_frobeniusPrimeSet`; Mathlib `NumberField.dedekindZeta`,
`LSeries_eq_iff_of_abscissaOfAbsConv_lt_top`. Bauer's theorem is not an input of this equivalence,
whose two subgroups live in one Galois group; it is what lets 7.5 and 7.6 apply the equivalence to
two arbitrary arithmetically equivalent fields.

**Checks.**
- `H = K` gives equal fields and both sides true.
- Conjugate `H` and `σHσ⁻¹` give isomorphic fields, equal zeta functions and Gassmann equivalence.
- Normal `H ≠ K` of equal index (two distinct quadratic subfields of a biquadratic field) give
  different zeta functions and are not Gassmann equivalent.

### 7.5 Invariants of arithmetically equivalent fields

Prove `invariants_eq_of_dedekindZeta_eq`: number fields with the same Dedekind zeta function have
the same degree, discriminant, number of real places and product `h · R` of class number and
regulator (desmit-perlis lines 14–18; perlis-1977, Theorem 1). Route: degree and number of real
places from the gamma factors, discriminant from the functional equation, `h · R` from the residue
at `s = 1` (`NumberField.dedekindZeta_residue`: `2^{r₁} (2π)^{r₂} h R / (w √|d|)`) once the number
`w` of roots of unity is known to agree. That step is 7.4 twice: by Bauer's theorem `F'` embeds in
the Galois closure `F̃` of `F`, with group `G` and point stabilizers `H` and `K`; by Perlis' theorem
`H` and `K` are Gassmann equivalent, so they meet every conjugacy class, hence every normal
subgroup `N`, in the same number of elements, and `H ≤ N` iff `K ≤ N`; for `N = Gal(F̃ / ℚ(ζ_m))`
when `ℚ(ζ_m) ⊆ F̃` this says `ζ_m ∈ F` iff `ζ_m ∈ F'`, and when `ℚ(ζ_m) ⊄ F̃` neither field contains
`ζ_m`. The class number is not determined (desmit-perlis line 21). *Needs:* 7.4; Mathlib
`NumberField.dedekindZeta`, `NumberField.dedekindZeta_residue`, `NumberField.Units.torsionOrder`.

**Checks.**
- A field and itself: all four equalities hold.
- `ℚ(⁸√−15)` and `ℚ(⁸√−240)` are arithmetically equivalent and non-isomorphic, with class number
  ratio `2` (desmit-perlis line 21; the fields at lines 52–53, the ratio at lines 35–36
  numerically and lines 72–75 in the proof): the theorem cannot add the class number.
- `ℚ(√2)` and `ℚ(√3)` have equal degree and number of real places but discriminants `8` and `12`:
  different zeta functions.

### 7.6 Counting arithmetically equivalent fields

For a number field `F` with Galois closure `F̃`, group `G` and point stabilizer `H`, prove that the
number of isomorphism classes of number fields arithmetically equivalent to `F` and not isomorphic
to it is the number of conjugacy classes of subgroups Gassmann equivalent to `H` other than that of
`H`. Route: by Bauer's theorem (7.4) every field arithmetically equivalent to `F` is isomorphic to a
subfield of `F̃`, hence to the fixed field of a subgroup `K ≤ G` (Mathlib
`IsGalois.intermediateFieldEquivSubgroup`); by Perlis' theorem (7.4) `ζ_{F̃^K} = ζ_F` iff `K` is
Gassmann equivalent to `H`; and two fixed fields are isomorphic iff their subgroups are conjugate
in `G`. *Needs:* 7.4; Mathlib `IsGalois.intermediateFieldEquivSubgroup`.

**Checks.**
- A Galois field `F` (`H = 1`) has count `0`: the only subgroup Gassmann equivalent to `1` is `1`.
- A quadratic field has count `0` (index `2`, 7.2).
- A field with Galois group `GL₃(𝔽₂)` acting on `7` points has count at least `1` (7.2).

### Examples

The Fano triple in `GL₃(𝔽₂)` (index `7`) and the regular pair in `S₁₆` (index `16`) are Gassmann
triples; the corresponding fields share degree, discriminant, signature and `h · R`.

### Dependencies

InductionRestriction §§2.1–2.2; Tau Ceti (the double-coset law, Frobenius splitting types,
complete splitting in composita and Galois closures, Chebotarev density); Mathlib.

## Layer 8: elusive permutation groups and Malle invariants

`G ≤ Equiv.Perm α` with `α` finite, `G` transitive and nontrivial. The index `ind(g)`, `ind(G)`,
`a(G)` and `b(H, G)` are ArithmeticStatisticsPartV §3.9's.

### 8.1 `b(ℚ, G)` as a count of divisions

Prove that `b(ℚ, G)`, the number of orbits of `(ZMod e)ˣ` on the classes of minimal index, is the
number of divisions of minimal index, by 3.7 and the invariance of `ind` under conjugation and
under coprime powers (ArithmeticStatisticsPartV §3.9). *Needs:* 3.7; ArithmeticStatisticsPartV §3.9.

**Checks.**
- `S_n`, `n ≥ 2`: transpositions form the one division of index `1`; `b = 1`.
- `C₃ ≤ S₃`: two classes of index `2` forming one division; `b = 1`, while counting classes gives `2`.
- `C₂ × C₂` acting regularly: three divisions of index `2`; `b = 3`.

### 8.2 `d_ind(G)` and concentrated groups

Define `d_ind(G)` as the lcm of the orders of the nontrivial elements of minimal index, the
minimal-index subgroup as the subgroup they generate (normal in `G`), `G` concentrated when that
subgroup is proper, and semiconcentrated when some minimal-index element has proper normal
closure; concentrated implies semiconcentrated. *Needs:* 8.1.

**Checks.**
- `S_n`, `n ≥ 2`: `d_ind = 2`, neither concentrated nor semiconcentrated (transpositions generate).
- `C₃ ≀ C₂ ≤ S₆` (order `18`): minimal index `2`, attained by the elements `(a, 1)`, `(1, a)` with
  one `3`-cycle, which generate `C₃ × C₃`; concentrated, `d_ind = 3`.
- `A₄` on `4` points: minimal index `2`, attained by `3`-cycles and double transpositions;
  `d_ind = 6`, and they generate `A₄`: not concentrated.

### 8.3 Elusive groups

Define `IsElusive P`: no fixed-point-free element of prime order. Prove
`not_isElusive_of_card_eq_prime_pow`: a transitive group of degree `p^a`, `a ≥ 1`, is not elusive —
a Sylow `p`-subgroup is transitive, and a central element of order `p` of it fixes no point, since
fixing one point it would fix the whole orbit. Prove, assuming `TauCeti.ClassificationStatement`,
the Fein–Kantor–Schacher theorem `exists_fixedPointFree_isPrimePow_of_classification`: a transitive
group of degree `> 1` contains a fixed-point-free element of prime-power order (fks, Theorem 1).
Their proof reduces to almost simple groups and uses the classification there. *Needs:* Mathlib
`Sylow`, `MulAction.IsPretransitive`; Tau Ceti `TauCeti.ClassificationStatement`.

**Checks.**
- `S_n`, `n ≥ 2`, is not elusive: for a prime `p ∣ n`, a product of `n / p` disjoint `p`-cycles has
  order `p` and moves every point.
- The trivial group on one point is elusive (no element of prime order): Fein–Kantor–Schacher needs
  degree `> 1`.
- `C₂ × C₂` acting regularly (degree `4 = 2²`): every involution is fixed-point-free.

### Examples

`S₄` on `4` points: `ind = 1`, `b = 1`, `d_ind = 2`, not elusive. `C₃ ≀ C₂` on `6` points: `ind = 2`,
`b = 1`, `d_ind = 3`, concentrated, not elusive.

### Dependencies

Layer 3 (3.7); ArithmeticStatisticsPartV §3.9; Mathlib; Tau Ceti `TauCeti.ClassificationStatement`.

## Layer 9: integral representations

### 9.1 Orders, `ℤ[G]`-lattices and Jordan–Zassenhaus

A `ℤ`-order in a finite-dimensional `ℚ`-algebra `A` is a subring `Λ` (a `Subalgebra ℤ A`) that is
finitely generated over `ℤ` and spans `A` over `ℚ` (ClassicalArithmeticCompletion §7.4); a
`Λ`-lattice is a `Λ`-module free and finite over `ℤ`. A `ℤ[G]`-lattice is a
`Module (MonoidAlgebra ℤ G) L` that is free and finite over `ℤ`; indecomposability is
`TauCeti.IsIndecomposableModule`. Every lattice is a finite direct sum of indecomposables.

Prove Jordan–Zassenhaus `jordan_zassenhaus_order`: for a `ℤ`-order `Λ` in a finite-dimensional
semisimple `ℚ`-algebra `A` and each `n`, the `Λ`-lattices of rank `n` fall into finitely many
isomorphism classes (reiner-maximal-orders, §26). An order over the integers `𝓞_K` of a number
field `K` in a semisimple `K`-algebra is a `ℤ`-order in the same algebra viewed over `ℚ`, and its
lattices are the same modules, so the statement covers that case. Route:

- `A ⊗ ℚ`-modules: a `Λ`-lattice `M` of rank `n` is a full `Λ`-lattice in the `A`-module
  `V = ℚ ⊗ M` of dimension `n`, and a semisimple `A` has finitely many modules of each dimension.
- Reduction to a maximal order: `Λ` lies in a maximal order `Λ'` (ClassicalArithmeticCompletion
  §7.56; the regular trace of a semisimple `ℚ`-algebra is nondegenerate), and there is `r ≠ 0`
  with `r Λ' ⊆ Λ` (§7.49). For a `Λ`-lattice `M`, `Λ' M` is a `Λ'`-lattice with
  `r Λ' M ⊆ M ⊆ Λ' M`, and for a fixed `Λ'`-lattice `N` there are finitely many `Λ`-lattices
  between `r N` and `N`, as `N ⧸ r N` is finite.
- Maximal orders: a maximal order contains the central idempotents of `A` (adjoining one to it
  gives an order), so it is the product of maximal orders in the simple components and its
  lattices split accordingly; for a maximal order in a simple algebra, the lattices in `V` fall
  into finitely many classes by Minkowski's convex body theorem applied to the reduced norm
  (ClassicalArithmeticCompletion §7.10) on the lattices `Hom_Λ'(L₀, L)` of the simple algebra
  `End_A(V)`, for a fixed lattice `L₀`.

Semisimplicity is needed: in `A = ℚ[x] ⧸ (x²)` with `Λ = ℤ[x] ⧸ (x²)`, the lattices `ℤ²` with `x`
acting by `[[0, a], [0, 0]]`, `a ≥ 1`, are pairwise non-isomorphic (the cokernel of `x` is
`ℤ ⊕ ℤ ⧸ a`). Prove the group-ring case `jordan_zassenhaus`: for a finite group `Γ` and each `n`,
the `ℤ[Γ]`-lattices of rank `n` fall into finitely many isomorphism classes; `ℤ[Γ]` is a `ℤ`-order
in `ℚ[Γ]` (ClassicalArithmeticCompletion §7.4, `IntegralOrder.groupRing_isOrder`), which is
semisimple by Maschke's theorem. For `ℤ[Γ]` the bound of §7.49 can be taken to be `|Γ|`: the
regular trace of `λ g` lies in `ℤ` for `λ` in an overorder, and the coefficient of `λ` at `g⁻¹` is
that trace divided by `|Γ|`, so `|Γ| Λ' ⊆ ℤ[Γ]`. The statement covers all lattices, not only
locally free ones. *Needs:* ClassicalArithmeticCompletion §7.4, §7.10, §7.21, §7.49, §7.56; Mathlib
`Subalgebra`, `IsSemisimpleRing`, `MonoidAlgebra`, Maschke's theorem, `Module.Free`, Minkowski's
convex body theorem (`MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`).

**Checks.**
- Rank `1` over `ℤ[C₂]`: exactly two classes, the trivial and the sign lattice.
- The trivial rank-one `ℤ[C₂]`-lattice has generic rank `1` and is not a locally free
  `ℤ[C₂]`-lattice (those have rank divisible by `2`); Jordan–Zassenhaus covers it.
- Rank `0`: one class, the zero lattice; for the zero algebra `A = 0` every lattice is zero.
- The non-semisimple `ℤ[x] ⧸ (x²)` in `ℚ[x] ⧸ (x²)` has infinitely many classes in rank `2`, as
  above: the hypothesis that `A` be semisimple cannot be dropped.
- `ℤ[C₂] ⊆ ℤ × ℤ`, the maximal order of `ℚ[C₂] ≅ ℚ × ℚ` (by `g ↦ (1, −1)`), contains
  `2 (ℤ × ℤ)`, the bound `|C₂| = 2`; the maximal order is not unique in general (in
  `ℚ[S₃] ≅ ℚ × ℚ × M₂(ℚ)` the `GL₂(ℚ)`-conjugates of `ℤ × ℤ × M₂(ℤ)` are maximal), which is why the
  route takes a maximal order containing `Λ`.

### 9.2 Diederichsen–Reiner

Prove `diederichsen_reiner`: for a prime `p`, there are exactly `2 h + 1` isomorphism classes of
indecomposable `ℤ[C_p]`-lattices, `h` the class number of `ℚ(ζ_p)`: the trivial lattice `ℤ`, the
ideals `𝔞` of `ℤ[ζ_p]` (one per ideal class) with the generator acting by `ζ_p`, and one non-split
extension of `ℤ` by `𝔞` per ideal class (reiner-1957, Corollary, p. 145). Every `ℤ[C_p]`-lattice is
determined by the ideal class, the `ℤ[ζ_p]`-rank of its `N`-torsion part and two further ranks
(reiner-1957, Theorem, p. 145). *Needs:* 9.1; Mathlib `ClassGroup`, `CyclotomicField`,
`NumberField.classNumber`.

**Checks.**
- `p = 2`: `h = 1`, three classes: trivial `ℤ`, sign `ℤ`, and `ℤ[C₂]`; the trivial and the sign
  lattice both have rank `1` and are not isomorphic (generator acts by `+1` and `−1`).
- `p = 3`: `h = 1`, three classes: `ℤ`, `ℤ[ζ₃]`, `ℤ[C₃]`.
- `p = 23`: `h = 3`, seven classes; no bound on `p` enters the statement.

### 9.3 The unit lattice of a Galois number field and Herbrand's theorem

For a finite Galois extension `L/K` of number fields with group `G`, construct the `ℤ[G]`-module
structure on `(𝓞 L)ˣ ⧸ torsion` from the Galois action on `𝓞 L`
(`NumberField.RingOfIntegers.mapAlgEquiv`); it is a lattice of rank `r₁ + r₂ − 1`, the number of
infinite places of `L` minus one (`NumberField.Units.unitLattice_rank`). Prove Herbrand's unit
theorem `exists_herbrand_units` (sutherland-18785, Theorem 24.6): there are units `ε_w` of `𝓞 L`,
one for each infinite place `w` of `L`, with `σ(ε_w) = ε_{σ • w}` for `σ ∈ G` (Mathlib's action
`σ • w = w.comap σ⁻¹`), `∏_w ε_w = 1`, every relation `∏_w ε_w^{a_w} = 1` having all `a_w` equal,
and generating a subgroup of finite index. When `L` has at least two infinite places, the relation
clause makes `w ↦ ε_w` injective, so `σ(ε_w) = ε_{w'}` exactly when `σ • w = w'`, as in the source.
Corollary (the character form): the character of `(𝓞 L)ˣ ⊗ ℚ` is the permutation character of `G`
on the infinite places minus the trivial character, since the units `ε_w` span
`ℚ[places] ⧸ ℚ · ∑_w w`. Route (sutherland-18785, lines 128–194): for each `w` choose a unit `u_w`
with `‖u_w‖_{w'} < 1` for all `w' ≠ w` (the construction in Dirichlet's unit theorem); take the
product of the conjugates of `u_w` under the decomposition group of `w`, and transport it along
coset representatives to get units `β_w` with `σ(β_w) = β_{σ • w}`; any `r₁ + r₂ − 1` of them are
independent, because their logarithmic vectors form a matrix with positive diagonal, negative
off-diagonal entries and positive row sums, so their relations form a rank-one group with a
generator `(n_w)` whose entries are nonzero and constant on Galois orbits, and `ε_w = β_w^{n_w}`.
*Needs:* 9.1; Mathlib `NumberField.Units`, `NumberField.InfinitePlace` with its Galois action,
`NumberField.RingOfIntegers.mapAlgEquiv`, `NumberField.Units.unitLattice_rank`,
`NumberField.Units.logEmbedding`.

**Checks.**
- `L = K = ℚ`: one infinite place, `ε = 1`, which generates the subgroup `{1}` of index `2` in
  `{±1}`; all relations are multiples of the trivial one.
- `L` imaginary quadratic over `ℚ`: one infinite place fixed by `G`, `ε_w = 1`, finite unit group;
  rank `0`, and the permutation character minus the trivial character is `0`.
- `L = ℚ(√2)` over `ℚ`, `η = 1 + √2` with `σ(η) = −η⁻¹`: `ε_{w₁} = η²`, `ε_{w₂} = σ(η²) = η⁻²` has
  product `1`, generates `⟨η²⟩` of index `4` in `±η^ℤ`, and the relation `η^{2a₁ − 2a₂} = 1` forces
  `a₁ = a₂`; the choice `ε = (η, σ(η))` fails, with product `−1`. The character is the sign
  character of `C₂`.
- `L` totally real biquadratic over `ℚ`: `ρ_reg − 1`, the sum of the three nontrivial characters.

### 9.4 Biquadratic fields: Kuroda's formula and unit types

Define `unitIndex K k₁ k₂ k₃`, the index in `(𝓞 K)ˣ` of the subgroup generated by the unit groups of
three subfields. Prove Kuroda's class number formula `classNumber_mul_eq_unitIndex_mul`: for a
biquadratic `K/ℚ` (Galois of degree `4` with group of exponent `2`) with quadratic subfields
`k₁, k₂, k₃`, `4 h(K) = q(K) h₁ h₂ h₃` when `K` is totally real and `2 h(K) = q(K) h₁ h₂ h₃` when it is
totally complex (lemmermeyer line 102, Theorem 1, and lines 110–113).

For totally real `K` with fundamental units `εᵢ` of `kᵢ`, every unit squared lies in
`±⟨ε₁, ε₂, ε₃⟩`, because `u² = ± N_{K/k₁}(u) N_{K/k₂}(u) N_{K/k₃}(u)`. Define `unitType K k`, for
`k : Fin 3 → IntermediateField ℚ K`, as the set of parity vectors `a ∈ (ZMod 2)³` such that some unit
`u` of `K` has `u² = η₀ η₁ η₂` with `ηᵢ` a unit of `kᵢ` that is a square up to sign exactly when
`aᵢ = 0`. For totally real biquadratic `K` with its three quadratic subfields it is an additive
subgroup, `u ↦ a` identifies `(𝓞 K)ˣ ⧸ (E₁ E₂ E₃)` with it (the decomposition `u² = η₀ η₁ η₂` is
unique up to signs, the three unit groups being independent modulo `±1`), so
`unitIndex = #unitType`, and it records which of the products `±ε₁^{a₁} ε₂^{a₂} ε₃^{a₃}` are squares
in `K`: it is Kubota's type. Prove Kuroda's list `unitIndex_dvd_four`: for totally real
biquadratic `K`, `q(K)` divides `4`, so the type is a subgroup of `(ZMod 2)³` of order at most `4`;
up to permutation of the `kᵢ` these are exactly seven subgroups, Kubota's types i–vii (kubota
lines 13–19, citing Kuroda). Prove Kubota's theorem `infinite_setOf_unitType_eq`: every subgroup of
`(ZMod 2)³` of order at most `4` is the type, for a suitable labelling of the quadratic subfields,
of infinitely many real biquadratic subfields of `ℝ`, so each of the seven types occurs infinitely
often (kubota lines 19–21, proved in its §3). Distinct Galois subfields of `ℝ` are non-isomorphic,
so the statement counts fields up to isomorphism. The type determines the `ℤ[C₂ × C₂]`-module
structure of the unit lattice (9.3). *Needs:* 9.3; Mathlib `NumberField.classNumber`,
`NumberField.RingOfIntegers`, `NumberField.IsTotallyReal`, `Algebra.norm`.

**Checks.**
- `K = ℚ(√2, √3)`: `h(K) = h₁ = h₂ = h₃ = 1`, so `q = 4`; indeed `2 + √3 = ((1 + √3)/√2)²` and
  `5 + 2√6 = (√2 + √3)²` have square roots in `K`.
- `K = ℚ(i, √2)`: totally complex, all class numbers `1`, so `q = 2`, witnessed by `ζ₈`; interchanging
  the factors `4` and `2` would give `h(ℚ(√2, √3)) = 2` and `h(ℚ(i, √2)) = 1/2`.
- The seven orbits of subgroups of `(ZMod 2)³` of order at most `4` under coordinate permutations:
  `{0}`; three of order `2` (generated by `(1,0,0)`, `(1,1,0)`, `(1,1,1)`); three of order `4`; Kubota's
  types i–vii (kubota lines 17–18) with `q = 1, 2, 4, 2, 4, 4, 2`.
- `ℚ(√2, √3)` with `k = (ℚ(√2), ℚ(√3), ℚ(√6))`: `ε₁ = 1 + √2` has norm `−1`, so `±ε₁` is not a square
  in the real field `K`, while `ε₂ = 2 + √3` and `ε₃ = 5 + 2√6` are; the type is
  `{0, (0,1,0), (0,0,1), (0,1,1)}`, of order `4 = q`, which divides `4`. The whole group `(ZMod 2)³`
  is not a type (Kuroda's list), so Kubota's theorem is stated only for order at most `4`.

### Examples

`ℤ[C₂]`: three indecomposable lattices. `ℤ[C₂₃]`: seven. `ℚ(√2, √3)`: unit index `4`.

### Dependencies

ClassicalArithmeticCompletion §§7.4, 7.10, 7.21, 7.49, 7.56 (9.1); Mathlib; Tau Ceti
`TauCeti.IsIndecomposableModule`.

## Layer 10: finite subgroups of `GL_n(ℤ)`, `GL_n(ℚ)` and `GL_n(ℂ)`

### 10.1 Finite subgroups of `GL_n(ℚ)` stabilize lattices

Prove `exists_conj_le_range_int`: a finite `H ≤ GL (Fin n) ℚ` is conjugate in `GL (Fin n) ℚ` into
the image of `GL (Fin n) ℤ`, because `∑_{h ∈ H} h ℤ^n` is an `H`-stable full lattice
(serre-bounds, §1.3.1, p. 4, lines 189–192). Hence the
`ℚ`-classes of finite subgroups of `GL (Fin n) ℚ` are the `GL (Fin n) ℚ`-classes of finite subgroups
of `GL (Fin n) ℤ`, and each `ℚ`-class is a finite union of `ℤ`-classes (9.1). *Needs:* 9.1;
Mathlib `Matrix.GeneralLinearGroup`, `RingHom.mapMatrix`.

**Checks.**
- `n = 0`: the only subgroup is trivial; the identity conjugates.
- `H = ⟨[[0, 2], [1/2, 0]]⟩` (order `2`) is not integral; `diag(1, 2)` conjugates it to
  `⟨[[0, 1], [1, 0]]⟩`.
- `⟨diag(1, −1)⟩` and `⟨[[0, 1], [1, 0]]⟩` are `ℚ`-conjugate and not `ℤ`-conjugate: the first makes
  `ℤ²` the sum of the trivial and the sign lattice, the second the regular lattice `ℤ[C₂]`, distinct
  classes by 9.2.

### 10.2 Minkowski's lemma and bound

Prove `eq_one_of_isOfFinOrder_of_map_eq_one`: for `m ≥ 3`, a torsion element of `GL (Fin n) ℤ`
congruent to `1` modulo `m` is `1` (serre-bounds, §1.2, Lemma 1, p. 4). Define
`minkowskiBound n = ∏_ℓ ℓ^(∑_k ⌊n / (ℓ^k (ℓ − 1))⌋)` and prove `card_dvd_minkowskiBound`: the order of
a finite subgroup of `GL (Fin n) ℚ` divides it (serre-bounds, §1.1, Theorem 1 (i), p. 3; it is
the least such integer by part (ii) and Remark 1, lines 109–111). By 10.1 and the lemma at `m = 3`, each dimension
has finitely many `ℤ`-classes. *Needs:* 10.1; Mathlib `Matrix.GeneralLinearGroup`.

**Checks.**
- `m = 2` fails: `−1` has order `2` and is congruent to `1` modulo `2`.
- `minkowskiBound 0 = 1`, `minkowskiBound 1 = 2`, `minkowskiBound 2 = 2³ · 3 = 24`,
  `minkowskiBound 3 = 2⁴ · 3 = 48`, `minkowskiBound 4 = 2⁷ · 3² · 5 = 5760` (serre-bounds, lines
  113–116).
- The bound is attained in dimensions `1` and `3` (serre-bounds, Remark 2, line 132): `{±1}` in
  `GL₁(ℤ)`, and the signed permutation matrices `{±1}³ ⋊ S₃ ≤ GL₃(ℤ)` of order `8 · 6 = 48`.
- In dimension `4` it is not: the largest finite subgroup of `GL₄(ℤ)`, the Weyl group of `F₄`, has
  order `1152`, a proper divisor of `5760` with quotient `5` (bbnwz, Table 1C, pp. 79–260; 10.4); Serre's
  Remark 2 (lines 131–133) records only that no other dimension is expected to attain the bound.

### 10.3 Dimensions one, two and three

Define `IsConjSubgroup`, `FiniteSubgroupClasses Γ`, `ZClasses n` and `QClasses n`. Prove
`card_zClasses_two_qClasses_two` (`13` and `10`) and `card_zClasses_three_qClasses_three` (`73` and
`32`), the arithmetic and geometric crystal classes (bbnwz, the tables of dimensions two and three,
which precede the dimension-four Table 1C, pp. 79–260). Route: 10.2 bounds the
orders; the `ℚ`-classes are the faithful rational representations of dimension `n` of groups of
those orders, up to automorphisms (6.5). Inside the `ℚ`-class of a finite `G` acting faithfully on
`V = ℚⁿ`, two `G`-stable full lattices give the same `ℤ`-class exactly when an element of the
normalizer of `G` in `GL(V)` carries one to the other. Fix a maximal order `Λ'` of `ℚ[G]` containing
`ℤ[G]` and representatives `N₁, …, N_r` of the isomorphism classes of `Λ'`-lattices spanning `V`
(finitely many by `jordan_zassenhaus_order`, 9.1). The `ℤ`-classes in the `ℚ`-class are the
`G`-stable lattices `L` with `|G| · N_j ⊆ L ⊆ N_j` for some `j`, modulo the normalizer: for a
`G`-stable `L`, `|G| · Λ' ⊆ ℤ[G]` (9.1) gives `|G| · Λ'L ⊆ L ⊆ Λ'L`, and a `Λ'`-isomorphism
`Λ'L ≅ N_j` extends to a `G`-equivariant automorphism `φ` of `V`, which commutes with `G`, so `φ(L)`
lies between `|G| · N_j` and `N_j` and has the same `ℤ`-class as `L`. One lattice `N_j` does not
suffice when the `Λ'`-lattices in `V` form several classes (Check below). *Needs:* 6.5, 9.1
(`jordan_zassenhaus_order` and the bound `|G| · Λ' ⊆ ℤ[G]`), 10.1, 10.2.

**Checks.**
- `n = 1`: two `ℤ`-classes and two `ℚ`-classes, `{1}` and `{±1}`.
- `n = 2`: `C₁, C₂, C₃, C₄, C₆, D₄, D₆` once each and `D₁, D₂, D₃` twice each give `7 + 6 = 13`
  `ℤ`-classes in `10` `ℚ`-classes.
- `ℤ`-classes map onto `ℚ`-classes (10.1): `13 ≥ 10`, `73 ≥ 32`.
- A single sandwich `|G| · L₀ ⊆ L ⊆ L₀` misses `ℤ`-classes: `G = C₂₃` acting on
  `ℤ[ζ₂₃] ≅ ℤ²²` through multiplication by `ζ₂₃`. The `G`-stable lattices of `V = ℚ(ζ₂₃)` are the
  fractional ideals; those between `23 · ℤ[ζ₂₃]` and `ℤ[ζ₂₃]` are the powers `(1 − ζ₂₃)^k`,
  `0 ≤ k ≤ 22`, all principal; the normalizer acts by `x ↦ a σ(x)`, `a ∈ ℚ(ζ₂₃)ˣ`, `σ` a Galois
  automorphism, which preserves principality; and `h(ℚ(ζ₂₃)) = 3`, so the two non-principal ideal
  classes give `ℤ`-classes that the single sandwich misses. Here `Λ' = ℤ × ℤ[ζ₂₃]` in
  `ℚ[C₂₃] ≅ ℚ × ℚ(ζ₂₃)` acts on `V` through `ℤ[ζ₂₃]`, the `Λ'`-lattices spanning `V` are the
  fractional ideals, the `N_j` are `ℤ[ζ₂₃]`, `𝔞`, `𝔞²` for a non-principal ideal `𝔞`, and every
  class appears.

### 10.4 Dimension four

Prove `card_zClasses_four_qClasses_four`: `710` `ℤ`-classes and `227` `ℚ`-classes in dimension four
(bbnwz, Table 1C, pp. 79–260: the `227` `ℚ`-classes, each with its `ℤ`-classes; rastanawi-2022,
Appendix D, p. 97, reads the `227` from that table). Route: as in 10.3, with orders dividing
`minkowskiBound 4 = 5760`; the
rational representations of dimension `4` of groups of such order are determined by their
characters (6.5), and the `ℤ`-classes inside each `ℚ`-class are the `G`-stable lattices between
`|G| · N_j` and `N_j`, `N_j` running over representatives of the isomorphism classes of
`Λ'`-lattices spanning the representation space, modulo the normalizer of `G` (10.3). *Needs:* 6.5,
9.1, 10.1, 10.2, 10.3.

**Checks.**
- Every `ℚ`-class contains a `ℤ`-class, so `710 ≥ 227`.
- Every finite subgroup has order dividing `5760`; the largest order is `1152`.
- The pairs in dimensions `1`–`4` are `(2, 2)`, `(13, 10)`, `(73, 32)`, `(710, 227)`.

### 10.5 Finite subgroups of `GL_n(ℂ)` and Jordan's theorem

Conjugacy classes of finite subgroups of `GL (Fin n) ℂ` correspond to faithful characters of degree
`n` of finite groups up to automorphisms; `irrDegreeC G` (6.8) is the least `n` with an irreducible
embedding. Define `jordanBound n`, the least `J` such that every finite subgroup of `GL (Fin n) ℂ`
has an abelian normal subgroup of index at most `J`. Prove:

- `jordan_exists_abelian_normal_index_le`: over every field `F` of characteristic zero, every finite
  subgroup `H` of `GL (Fin n) F` has an abelian normal subgroup of index at most `jordanBound n`.
  Route: over `ℂ`, averaging a Hermitian form conjugates `H` into the unitary group, elements near
  `1` generate an abelian normal subgroup because commutators shrink
  (`‖⁅g, h⁆ − 1‖ ≤ 2 ‖g − 1‖ ‖h − 1‖`), and a packing count bounds the index (curtis-reiner-1962,
  §36); so the set whose least element is `jordanBound n` is nonempty and its least element bounds
  every finite subgroup of `GL (Fin n) ℂ`. For general `F`, let `F̄` be an algebraic closure and `e`
  the exponent of `H`: `F̄ⁿ` is a direct sum of irreducible representations of `H` (Maschke), each the
  scalar extension of one over the cyclotomic subfield `ℚ(ζ_e) ⊆ F̄` (CharacterTheory §4.5), so
  `F̄ⁿ ≅ W ⊗ F̄` for an `n`-dimensional `ℚ(ζ_e)`-representation `W`, faithful because `F̄ⁿ` is.
  Extending scalars along an embedding `ℚ(ζ_e) → ℂ` (any two cyclotomic fields of level `e` are
  isomorphic) gives a faithful complex representation of degree `n`, so `H` is isomorphic to a
  finite subgroup of `GL (Fin n) ℂ`; no embedding of `F` into `ℂ` is used. *Needs:* CharacterTheory
  §4.5 (Tau Ceti `FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension`); Mathlib
  `AlgebraicClosure`, Maschke's theorem, `IsCyclotomicExtension.algEquiv`, `Matrix.unitaryGroup`;
  curtis-reiner-1962, §36, for the case `F = ℂ`.
- `jordan_exists_abelian_normal_index_le_of_finite_map`: a subgroup `B ≤ GL (Fin n) F` with finite
  image under `Matrix.ProjGenLinGroup.mk` has an abelian normal subgroup of finite index at most
  `jordanBound n`. `B` itself may be infinite, and `Subgroup.index` is `0` on subgroups of infinite
  index, so the finiteness of the index is part of the conclusion. Route: over an algebraic
  closure, `Γ₁ = F̄ˣ B ∩ SL_n` is finite (its image in `PGL_n` is finite and its scalars are `n`-th
  roots of unity) and `F̄ˣ B = F̄ˣ Γ₁`, since `b = λ (λ⁻¹ b)` with `λⁿ = det b`; for `A₁ ⊴ Γ₁` abelian
  of index at most `jordanBound n`, `F̄ˣ A₁` is abelian and normal in `F̄ˣ B` of index at most
  `[Γ₁ : A₁]`, so `B ∩ F̄ˣ A₁` works. *Needs:* `jordan_exists_abelian_normal_index_le` (over `F̄`);
  Mathlib `Matrix.ProjGenLinGroup.mk`, `Matrix.SpecialLinearGroup`, `AlgebraicClosure`,
  `IsAlgClosed.exists_pow_nat_eq`, `card_rootsOfUnity`.
- `finrank_le_jordanBound`: over an algebraically closed field of characteristic zero, an
  irreducible representation of such `B` has dimension at most `jordanBound n`: the operators of the
  abelian normal subgroup commute, so they have a common eigenvector (induction on a finite family
  spanning them in `End W`, each step by `Module.End.exists_eigenvalue`), and its translates by
  coset representatives span a `B`-stable subspace, because the subgroup is normal. *Needs:*
  `jordan_exists_abelian_normal_index_le_of_finite_map`; Mathlib `IsAlgClosed`,
  `Module.End.exists_eigenvalue`.
- `jordanBound_le_schur`: `jordanBound n ≤ (√(8n) + 1)^(2n²) − (√(8n) − 1)^(2n²)` for `n ≥ 1`
  (curtis-reiner-1962, §36): the packing count of the first route made explicit. *Needs:*
  curtis-reiner-1962, §36; Mathlib `Matrix.unitaryGroup`, `Real.sqrt`.
- `jordanBound_eq_factorial_of_classification`: assuming `TauCeti.ClassificationStatement`,
  `jordanBound n = (n + 1)!` for `n ≥ 71`, attained by `S_{n+1}` on its standard representation
  (collins, Theorem); the lower bound holds because the only abelian normal subgroup of `S_{n+1}` is
  trivial for `n + 1 ≥ 5`. *Needs:* Tau Ceti `TauCeti.ClassificationStatement`; collins, Theorem;
  Mathlib `Equiv.Perm`, `alternatingGroup`.

**Checks.**
- `jordanBound 0 = 1` (the trivial group, abelian subgroup `⊤` of index `1`) and `jordanBound 1 = 1`
  (finite subgroups of `ℂˣ` are cyclic); at `n = 0` Schur's right side is `0`, hence `n ≥ 1`.
- `jordanBound 2 ≥ 60`: the binary icosahedral group `SL(2,5) ≤ GL₂(ℂ)` has abelian normal
  subgroups `1` and its centre only, of index `120` and `60`.
- Characteristic zero is needed: for `p ≥ 5` the abelian normal subgroups of `SL(2, p)` lie in
  `{±1}`, of index `p(p² − 1)/2`, unbounded in `p`.
- `B = GL₁(ℚ) ≅ ℚˣ` has trivial image in `PGL₁(ℚ)`; `⊥` is abelian and normal with
  `Subgroup.index ⊥ = 0 ≤ jordanBound 1` but has infinite index, so the finite-index clause of
  `jordan_exists_abelian_normal_index_le_of_finite_map` excludes it, and `A = B` (index
  `1 ≤ jordanBound 1 = 1`) satisfies it; without that clause `⊥` would satisfy the conclusion for
  every infinite `B`, whatever its image in `PGL_n`.

### Examples

`n = 2`: `13` `ℤ`-classes, `10` `ℚ`-classes, `minkowskiBound 2 = 24 = lcm(8, 12)`, the orders of
`D₄` and `D₆`, with no subgroup of order `24`; `jordanBound 2 ≥ 60`.

### Dependencies

Layers 6, 9; Mathlib; Tau Ceti `TauCeti.ClassificationStatement`.

## Downstream consumers

SatoTateGroups consumes `jordanBound` and Jordan's theorem 10.5; AdelicImagesAndModularCurves
consumes 7.1 and `AlmostConjugateOfFiniteIndex` (7.3); QuaternionArithmetic consumes 7.1; the
roadmaps that construct finite groups (HyperellipticCurves, PadicExtensionFamilies,
HypergeometricMotives, GroupActionsOnRiemannSurfaces, ArtinRepresentations) take the invariants of
the abstract group from here.

## References

- bbnwz: H. Brown, R. Bülow, J. Neubüser, H. Wondratschek, H. Zassenhaus, *Crystallographic Groups
  of Four-Dimensional Space*, Wiley, 1978: Table 1C, pp. 79–260 (the `ℚ`-classes and `ℤ`-classes of
  dimension four), and the tables of dimensions two and three preceding it.
- collins: M. J. Collins, *On Jordan's theorem for complex linear groups*, J. Group Theory 10
  (2007), 411–423 (Theorem).
- curtis-reiner-1962: C. W. Curtis, I. Reiner, *Representation Theory of Finite Groups and
  Associative Algebras*, Wiley, 1962, §36.
- dallavolta-lucchini-2021: F. Dalla Volta, A. Lucchini, *The A-Möbius function of a finite group*,
  arXiv:2109.05260v1: formula (1.1), p. 2 (Hall's formula); p. 3 (Hall's vanishing theorem).
- desmit-perlis: B. de Smit, R. Perlis, *Zeta functions do not determine class numbers*, Bull. AMS
  31 (1994), 213–215 (arXiv:math/9410216v1).
- est-2010: B. Elias, L. Silberman, R. Takloo-Bighash, *Minimal permutation representations of
  nilpotent groups*, Experiment. Math. 19 (2010), 121–128 (arXiv:0705.4122v3): §2, p. 2 (minimal
  faithful collections of subgroups).
- fks: B. Fein, W. M. Kantor, M. Schacher, *Relative Brauer groups II*, J. reine angew. Math. 328
  (1981), Theorem 1.
- gaschutz: W. Gaschütz, *Endliche Gruppen mit treuen absolut-irreduziblen Darstellungen*, Math.
  Nachr. 12 (1954), 253–255: the theorem of the paper (the criterion is restated in szechtman-2015).
- guralnick-1980: R. M. Guralnick, *Expressing group elements as commutators*, Rocky Mountain J.
  Math. 10 (1980), 651–654: the order-`96` threshold (restated in kunyavskii-2020).
- hall-1936: P. Hall, *The Eulerian functions of a group*, Quart. J. Math. 7 (1936), 134–151: the
  Möbius formula for `φ_n(G)` and the vanishing theorem (both restated in dallavolta-lucchini-2021).
- hall-1940: P. Hall, *The classification of prime-power groups*, J. reine angew. Math. 182 (1940),
  130–141.
- huppert-1954: B. Huppert, *Normalteiler und maximale Untergruppen endlicher Gruppen*, Math. Z. 60
  (1954), 409–434.
- huppert-eg1: B. Huppert, *Endliche Gruppen I*, Springer, 1967: Kapitel II, §5; Kapitel VI,
  Hauptsatz 9.5.
- isaacs: I. M. Isaacs, *Character Theory of Finite Groups*, Academic Press, 1976: Theorems 5.12,
  6.22, 6.23, 6.32, Corollaries 5.13, 10.2, p. 171.
- johnson-1971: D. L. Johnson, *Minimal permutation representations of finite groups*, Amer. J.
  Math. 93 (1971), 857–866: the minimal degree as the least total index of a faithful collection of
  subgroups (restated in est-2010).
- kubota: T. Kubota, *Über den bizyklischen biquadratischen Zahlkörper*, Nagoya Math. J. 10 (1956),
  65–85.
- kunyavskii-2020: B. Kunyavskiĭ, *Some new parallels between groups and Lie algebras, or What can
  be simpler than the multiplication table?*, EMS Newsletter, December 2020, 5–13: §3, p. 6 (the
  smallest groups whose derived subgroup is not the set of commutators have order `96`, and there
  are two of them).
- lemmermeyer: F. Lemmermeyer, *Kuroda's class number formula*, Acta Arith. 66 (1994), 245–260
  (arXiv v1), Theorem 1.
- milne-gt: J. S. Milne, *Group Theory*, course notes, version 4.01, 2025: Example 3.4(a), p. 44;
  Theorem 6.2, p. 88; Example 6.29(a), p. 98.
- perlis-1977: R. Perlis, *On the equation `ζ_K(s) = ζ_{K'}(s)`*, J. Number Theory 9 (1977),
  342–360: §1, Theorem 1.
- rastanawi-2022: L. Rastanawi, G. Rote, *Towards a geometric understanding of the 4-dimensional
  point groups*, arXiv:2205.04965v1: Appendix D, p. 97 (the `227` crystallographic point groups of
  dimension four, read from bbnwz, Table 1C).
- reiner-1957: I. Reiner, *Integral representations of cyclic groups of prime order*, Proc. AMS 8
  (1957), 142–146: Theorem and Corollary, p. 145.
- reiner-maximal-orders: I. Reiner, *Maximal Orders*, Academic Press, 1975, §26.
- robinson: D. J. S. Robinson, *A Course in the Theory of Groups*, 2nd ed., Springer, 1996: 3.3.15,
  §5.4, §9.1, §10.1.
- serre-bounds: J.-P. Serre, *Bounds for the orders of the finite subgroups of `G(k)`*,
  arXiv:1011.0346v1, §1: Theorem 1, p. 3; Remarks 1–2, p. 3; Lemma 1, p. 4; §1.3.1, p. 4.
- sutherland-18785: A. Sutherland, *18.785 Number Theory I, Lecture 24: the Herbrand unit theorem*,
  MIT, 2021, Theorem 24.6.
- szechtman-2015: F. Szechtman, *Groups having a faithful irreducible representation*,
  arXiv:1504.01343v9: p. 4 (Gaschütz's criterion, as `T(G)`, the product of the abelian minimal
  normal subgroups, being a cyclic `ℤ[G]`-module; p. 1 defines `T(G)`).
