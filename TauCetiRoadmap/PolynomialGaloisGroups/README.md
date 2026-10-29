# Roadmap: Galois groups of polynomials, part III — transitive groups through degree eleven, radicals and arithmetic equivalence

**Summary.** This roadmap continues
[Galois groups of polynomials](../../Completed/PolynomialGaloisGroups/README.md) (the *base
roadmap* below), which is complete. The base roadmap classifies the transitive subgroups of
`Sₙ` for `n ≤ 5`, attaches the labels `nTj` to polynomials of degree at most five, builds
resolvents and Frobenius specialization, and realizes `Sₙ` over `ℚ`. Part III adds three things
that the base roadmap places outside its scope or does not state. First, it classifies the
transitive subgroups of `Sₙ` for `6 ≤ n ≤ 11`: they fall into `16, 7, 50, 34, 45, 8` conjugacy
classes, and the native reference family and polynomial labels are extended through degree
eleven. Second, it proves the converse of Mathlib's half of Abel–Ruffini: in characteristic zero
a finite Galois extension has solvable Galois group exactly when all of its elements are
expressible by radicals, with the polynomial forms and Dummit's criterion for quintics, whose
separation hypothesis Chapman's argument removes. Third, it proves Gassmann's theorem that
almost-conjugate subgroups of a Galois group have fixed fields with the same Dedekind zeta
function, and realizes a nonconjugate almost-conjugate pair to obtain two nonisomorphic number
fields with the same zeta function.

| Layer | Title | What it builds |
|---|---|---|
| 1 | Transitive subgroups of `Sₙ` in degrees six to eleven | the class count through degree eleven, the descent criterion for completeness, the native reference family and labels through degree eleven |
| 2 | Galois labels through degree eleven | the unique label of a separable irreducible polynomial of degree at most eleven |
| 3 | Radicals in characteristic zero | the radical criterion for finite Galois extensions and polynomials; Dummit's quintic criterion without a separation hypothesis |
| 4 | Arithmetic equivalence | Gassmann's theorem, the conjugacy criterion for isomorphic fixed fields, and nonisomorphic number fields with equal zeta functions |

## Scope and ownership

**Where the base roadmap stops.** The base roadmap proves its Layers 0–6 and 9: the faithful
root action and the orbit/factor dictionary (Layer 0); blocks, the wreath embedding and the
recognition theorems (Layer 1); the block/intermediate-field dictionary (Layer 2); the
discriminant test (Layer 3); resolvents, including the quintic `F₂₀` resolvent sextic and the
quintic solvability criterion under a separation hypothesis (Layer 4); Frobenius specialization
(Layer 5); the classification and labels for `n ≤ 5` (Layer 6); and `Sₙ` over `ℚ` (Layer 9). Its
scope section excludes the classification of transitive subgroups in degrees 6 to 11, and for
radicals it records only the implication from radicals to a solvable group, which Mathlib proves.
Nothing of the base roadmap is planned again here: its results are consumed by section and by
native declaration.

**This roadmap owns:**

- the number of conjugacy classes of transitive subgroups of `Sₙ` for `1 ≤ n ≤ 11`, the descent
  criterion that proves completeness, and the pairwise nonconjugacy of the reference rows;
- the extension of the native reference family `TauCeti.numTransitiveGroups`,
  `TauCeti.referenceSubgroup` and its label predicate `TauCeti.TransitiveGroupLabel` to degrees
  six through eleven, with the restriction of the base roadmap's degree-at-most-five column
  theorems that the extension makes necessary;
- the unique Galois label of a separable irreducible polynomial of degree at most eleven;
- the radical criterion in characteristic zero for finite Galois extensions and for polynomials;
- the separation of the quintic `F₂₀` resolvent for irreducible quintics, and Dummit's criterion
  without a separation hypothesis;
- the sufficient direction of Gassmann's theorem, stated coefficient by coefficient for
  `TauCeti.dedekindZetaCoeff` (almost-conjugate subgroups have fixed fields with the same number
  of ideals of every norm, 4.1), the conjugacy criterion for isomorphic fixed fields (4.2), and the
  existence of nonisomorphic arithmetically equivalent number fields (4.3).

**Imported, not planned again.** The wreath embedding, blocks and recognition theorems (base
roadmap Layer 1); the quintic `F₂₀` resolvent and its criterion under separation (base roadmap
Layer 4); the label predicates and classification for `n ≤ 5` (base roadmap Layer 6); the
realization of `Sₙ` over `ℚ` (base roadmap Layer 9); almost-conjugacy, its transport along group
isomorphisms, the orbit-sum and determinant adapters and the nonconjugate almost-conjugate pair in
`S₁₆` (RepresentationTheory, Induction–Restriction Layers 2.1 and 2.2); the double-coset law for
primes of a fixed field (Number Field Arithmetic Layer 1.4). Galois groups of polynomials, part II
(ramified merging and random partitions) is a separate continuation of the same base; neither part
uses the other.

**Outside this roadmap.**

- Classification of transitive groups above degree eleven.
- Programs, searches, stored certificates and claims that a search terminates. The theorems below
  are statements about explicit finite groups; how an implementation proves a finite statement is
  its own choice and is not a target.
- Names of abstract groups (the name column of the TransGrp library and of Conway–Hulpke–McKay)
  beyond the identifications that a Check states.
- The converse of Gassmann's theorem (equal zeta functions force almost-conjugacy), which needs
  Chebotarev density, the invariants that arithmetically equivalent fields share, and the number
  of fields arithmetically equivalent to a given one: Finite Group Invariants Layer 7 (7.4, 7.5
  and 7.6). That roadmap is a consumer of Layer 4, not a supplier: its 7.4 takes the sufficient
  direction from 4.1, and its 7.6 passes from conjugacy of subgroups to isomorphism of fields by
  4.2.
- Radicals in positive characteristic, Hilbert irreducibility, and the realization of `Aₙ` over
  `ℚ`.

## Conventions

- **Permutations.** `Equiv.Perm (Fin n)` multiplies by composition, `(σ * τ) x = σ (τ x)`. Points
  are zero-based. A subgroup `G` is conjugated by `τ` as
  `Subgroup.map (MulAut.conj τ).toMonoidHom G`, the subgroup `τ G τ⁻¹`; this is the convention of
  `TauCeti.TransitiveGroupLabel`, and it agrees with the pointwise action of
  `ConjAct (Equiv.Perm (Fin n))` on `Subgroup (Equiv.Perm (Fin n))` (scoped `Pointwise`).
- **Labels.** An index `j : TauCeti.TransitiveGroupIndex n = Fin (TauCeti.numTransitiveGroups n)`
  displays as the label `nT(j+1)`. The rows of degree six to eleven are those of the TransGrp
  library at commit `165fc21` (file `lib/trans.grp` for degrees six and seven,
  `data/trans8.grp` to `data/trans11.grp` for degrees eight to eleven), in the library's order. Its
  one-based cycles are translated to zero-based ones by subtracting one from every point.
- **Classes.** "Conjugacy class of transitive subgroups" always means conjugacy in the full
  `Equiv.Perm (Fin n)`, never in a smaller normalizer.
- **Radicals.** The radical closure of `F` is `solvableByRad F (AlgebraicClosure F)`. A
  polynomial is solvable by radicals when **all** of its roots in `AlgebraicClosure F` lie in it;
  this is the notion of Milne's Theorem 5.34 (a radical tower containing a splitting field).
- **Almost-conjugacy.** Subgroups `H, K` of a finite group `G` are almost conjugate when they meet
  every conjugacy class of `G` in the same number of elements. This is
  Induction–Restriction's `Gassmann.AlmostConjugate`, which quantifies over Mathlib's
  `ConjClasses G`; Sutherland calls the same relation rational or Gassmann equivalence (Proposition
  2.6 (ii)).
- **Zeta coefficients.** `TauCeti.dedekindZetaCoeff K n` is the number of ideals of `𝓞 K` of
  absolute norm `n`, the coefficient sequence of Mathlib's `NumberField.dedekindZeta K`. It counts
  the zero ideal, so its value at `n = 0` is `1`.

**Checks for the conventions.**

- On `Fin 3`, `((0 1) * (1 2)) 0 = (0 1) ((1 2) 0) = 1`, while `((1 2) * (0 1)) 0 = 2`: the product
  is composition, applied right to left.
- Conjugating the subgroup `⟨(0 1)⟩ ≤ Equiv.Perm (Fin 3)` by `τ = (1 2)` gives `⟨(0 2)⟩`, since
  `τ (0 1) τ⁻¹ = (τ 0 τ 1) = (0 2)`. Conjugating by `τ⁻¹` gives the same subgroup here, so the
  direction is pinned by the next Check instead.
- The TransGrp row `6T6` has one-based generators `(3,6)` and `(1,3,5)(2,4,6)`; zero-based they are
  `(2 5)` and `(0 2 4)(1 3 5)`. Conjugating `(2 5)` by `r = (0 2 4)(1 3 5)` gives
  `(r(2) r(5)) = (4 1)`, and by `r²` gives `(0 3)`: a direction error would exchange these two.
- `TauCeti.dedekindZetaCoeff ℚ 0 = 1` (the zero ideal) and `TauCeti.dedekindZetaCoeff ℚ n = 1` for
  every `n ≥ 1` (the ideal `nℤ`); for `ℚ(i)` the coefficient at `5` is `2`, from `(2 + i)` and
  `(2 − i)`.

## Exact supplier contracts

### From Mathlib

- `Mathlib/FieldTheory/AbelRuffini.lean`: `solvableByRad`, `solvableByRad.rad_mem`,
  `isSolvable_gal_minpoly` and `isSolvable_gal_of_irreducible` (an irreducible polynomial with a
  root in `solvableByRad F E` has solvable Galois group); the converse is absent and is owned
  here.
- `Mathlib/FieldTheory/KummerExtension.lean`: `isCyclic_tfae`, the equivalence between cyclic
  Galois extensions of degree `n` and radical extensions `K(α)/K` with `αⁿ ∈ K`, assuming the base
  contains a primitive `n`-th root of unity.
- `Mathlib/RingTheory/RootsOfUnity/`: `AlgebraicClosure.hasEnoughRootsOfUnity` and
  `HasEnoughRootsOfUnity.exists_primitiveRoot`.
- `Mathlib/FieldTheory/Galois/Basic.lean`: `IsGalois.normalAutEquivQuotient`,
  `IsGalois.sup_right`, `IntermediateField.restrictRestrictAlgEquivMapHom_injective`,
  `IntermediateField.fixingSubgroup_fixedField`, `IntermediateField.finrank_eq_fixingSubgroup_index`,
  `IsGalois.map_fixingSubgroup` (the fixing subgroup of `σ(E)` is `σ (Fix E) σ⁻¹`) and
  `IsGalois.of_separable_splitting_field`; `Field.exists_primitive_element`;
  `AlgHom.liftNormal` (`Mathlib/FieldTheory/Normal/Basic.lean`).
- `Mathlib/Analysis/Complex/Polynomial/Basic.lean`:
  `Polynomial.Gal.galActionHom_bijective_of_prime_degree` (an irreducible rational polynomial of
  prime degree with exactly two nonreal roots has the full symmetric group);
  `Equiv.Perm.not_isSolvable` (`Mathlib/GroupTheory/Solvable.lean`).
- Permutation groups: `MulAction.IsBlock`, `MulAction.IsPreprimitive`, `Subgroup.closure`,
  `ConjAct`, `MulAction.orbitRel`, `Equiv.Perm.cycleType`, `Equiv.Perm.sign`, `alternatingGroup`,
  and `Finite.to_isCoatomic` (`Mathlib/Order/Atoms/Finite.lean`), which puts every proper subgroup
  of a finite group inside a maximal one.
- Number fields: `NumberField.dedekindZeta`, `Ideal.absNorm` with its multiplicativity (bundled as
  a monoid-with-zero homomorphism in `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean`).

### From Tau Ceti

- `GroupTheory/Perm/TransitiveGroupLabel/Basic.lean`: `TauCeti.numTransitiveGroups` (values `0, 1,
  1, 2, 5, 5` in degrees `0` to `5`, then `0`), `TauCeti.TransitiveGroupIndex`,
  `TauCeti.referenceSubgroup`, `TauCeti.TransitiveGroupLabel` (ambient conjugacy to the reference
  row) and `TauCeti.numTransitiveGroups_eq_zero_of_five_lt`.
- The column theorems `TauCeti.isPreprimitive_referenceSubgroup_iff` (`Primitive.lean`, line 114:
  primitive iff `n ≠ 4 ∨ 3 ≤ j`), `TauCeti.isSolvable_referenceSubgroup_iff` (`Solvable.lean`,
  line 142: solvable iff `n ≠ 5 ∨ j < 3`) and `TauCeti.referenceSubgroup_le_alternatingGroup_iff`
  (`Parity.lean`, line 37), each quantified over every degree `n`.
- `Classification.lean`: `TauCeti.existsUnique_transitiveGroupLabel_three`,
  `TauCeti.existsUnique_transitiveGroupLabel_four`, `TauCeti.existsUnique_transitiveGroupLabel_five`.
- `FieldTheory/GaloisGroups/Label.lean`: `TauCeti.HasGaloisLabel` (separable, of degree `n`, and
  some numbering of the roots carries the Galois image to a group with label `j`) and
  `TauCeti.isPretransitive_map_range_galActionHom_iff` (the image is transitive iff the separable
  polynomial of positive degree is irreducible).
- `GroupTheory/Perm/Imprimitivity.lean`: `MulAction.IsBlock.toWreathProduct_injective_iff`, the
  wreath embedding of a transitive group with a block system.
- `FieldTheory/GaloisGroups/Resolvent/`: `TauCeti.quinticF20Invariant` (Dummit's invariant
  `Σ_a x_a² (x_{a+1} x_{a−1} + x_{a+2} x_{a−2})` on `ℤ/5`), `TauCeti.quinticF20Spec`, its
  specialization `TauCeti.ResolventSpec.specialize` (the orbit product with the elementary
  symmetric polynomials replaced by signed coefficients, meaningful for monic input),
  `TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` (monic, separable,
  irreducible, degree five, **specialized sextic separable**: solvable iff the sextic has a root in
  the base field) and the collision example
  `TauCeti.not_forall_exists_le_map_conj_of_isRoot_specialize_quinticF20Spec`.
- `GroupTheory/Solvable.lean`: `Group.IsSolvable.exists_normal_index_prime` (a nontrivial finite
  solvable group has a normal subgroup of prime index).
- `NumberTheory/ArithmeticDirichletSeries/Trivial.lean`: `TauCeti.dedekindZetaCoeff` and
  `TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff`.
- `NumberTheory/RamificationInertia/DoubleCoset/`: `Ideal.doubleCosetQuotientEquivPrimesOver` (the
  primes of `M^H` over `p` are indexed by `H\G/D`) and
  `Ideal.map_card_orbit_stabilizer_eq_map_ramificationIdx_mul_inertiaDeg` (the orbit sizes of the
  decomposition group on `G ⧸ H` are the products `e·f` over those primes).
- `NumberTheory/NumberField/SplittingField.lean`: `Polynomial.SplittingField.instNumberField`;
  `FieldTheory/GaloisGroups/Symmetric/`: `Polynomial.HasFullSymmetricGaloisGroup` and
  `TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`.

### From TauCetiRoadmap.PolynomialGaloisGroups

The completed base roadmap, by layer: Layer 1 (blocks, the wreath embedding of Dixon–Mortimer
Theorem 2.6A, recognition theorems), Layer 4 (the quintic `F₂₀` resolvent and its criterion under
separation), Layer 6 (the reference family and labels for `n ≤ 5`, with their classification) and
Layer 9 (`Sₙ` over `ℚ`). Each is implemented by the Tau Ceti declarations listed above, and this
roadmap uses them in that form.

### From TauCetiRoadmap.RepresentationTheory

Induction–Restriction Layer 2.1: `Gassmann.AlmostConjugate`, `Gassmann.almostConjugate_comap` and
`Gassmann.not_conj_comap` (transport of almost-conjugacy and of nonconjugacy along a group
isomorphism), `Gassmann.almostConjugate_iff_permutation_equiv` (almost-conjugacy iff equivalent
permutation representations over `ℂ`), `Gassmann.restrictEquiv`, `Gassmann.normalInvariantEquiv`,
`Gassmann.invariantOrbitSumBasis`, `Gassmann.orbitSumEquivariant` and
`Gassmann.charpoly_reverse_eq_prod_fullCycleType` (the reversed characteristic polynomial of a
permutation matrix is `∏ (1 − Zᵈ)` over its full cycle type). Layer 2.2:
`Gassmann.exists_S16_gassmann_pair`, two subgroups of `Equiv.Perm (Fin 16)` of order 16 (the
regular actions of `C₄ × C₄` and `Q₈ × C₂`) that are almost conjugate and not conjugate.

### From TauCetiRoadmap.NumberFieldArithmetic

The completed Layer 1.4, the double-coset law for primes of a fixed field, with its `e·f` formula;
it is implemented by the Tau Ceti declarations listed above.

## How to read the build

Layer 1 is pure finite group theory: it counts the conjugacy classes of transitive subgroups,
proves completeness by descent through transitive maximal subgroups, and extends the native
reference family. Layer 2 transports the classification to polynomials and needs Layer 1 only.
Layer 3 (radicals) and Layer 4 (arithmetic equivalence) are independent of Layers 1–2 and of each
other; Layer 3 uses the base roadmap's quintic resolvent, and Layer 4 uses the base roadmap's
realization of `S₁₆` and Induction–Restriction's `S₁₆` pair.

## Layer 1: transitive subgroups of `Sₙ` in degrees six to eleven

### 1.1 Conjugacy classes of transitive subgroups

Define `TransitiveSubgroupClass n` as the set of orbits of `ConjAct (Equiv.Perm (Fin n))`, acting
pointwise on `Subgroup (Equiv.Perm (Fin n))`, that contain a subgroup acting transitively on
`Fin n`.

- Transitivity is a conjugation invariant, so an orbit that contains one transitive subgroup
  consists of transitive subgroups.
- For a finite type `α` with `Nat.card α = n`, an equivalence `α ≃ Fin n` induces a bijection
  between the conjugacy classes of transitive subgroups of `Equiv.Perm α` and
  `TransitiveSubgroupClass n`, and the bijection does not depend on the equivalence, since two
  equivalences differ by an element of `Equiv.Perm (Fin n)`.
- For `1 ≤ n ≤ 5`, sending a label `j` to the class of `TauCeti.referenceSubgroup n j` is a
  bijection from `TauCeti.TransitiveGroupIndex n` onto `TransitiveSubgroupClass n`; this is the
  native classification of the base roadmap (Layer 6) in counting form.
- **The count** (`card_transitiveSubgroupClass`). For `n = 1, …, 11`,
  `Nat.card (TransitiveSubgroupClass n)` is `1, 1, 2, 5, 5, 16, 7, 50, 34, 45, 8` (Butler–McKay,
  the classification through degree eleven, uncertified; the numbers for degrees 2 to 11 are Table
  2 of Conway–Hulpke–McKay, p. 7, `conway-hulpke-mckay` lines 282–285). The proof is 1.2 applied to the
  rows of 1.3, together with their pairwise nonconjugacy.

*Needs:* Mathlib `ConjAct`, `MulAction.orbitRel`, `MulAction.IsPretransitive`; the native
classification for `n ≤ 5` (Tau Ceti `TauCeti.existsUnique_transitiveGroupLabel_five` and its
degree-three and degree-four forms); 1.2 and 1.3 for `6 ≤ n ≤ 11`.

**Checks.**

- `n = 4`: the transitive subgroups of `S₄` are the three conjugates of `C₄`, the normal Klein
  group, the three conjugates of `D₄`, `A₄` and `S₄`, nine subgroups in five classes. A definition
  counting subgroups instead of classes gives 9.
- `n = 0`: `Fin 0` is empty, the trivial subgroup acts transitively vacuously, and there is one
  class, whereas `TauCeti.numTransitiveGroups 0 = 0`. The count is therefore stated from `n = 1`,
  and the class count is not the native row count at `n = 0`.
- `n = 2`: the trivial subgroup does not act transitively on two points, so the only class is
  `S₂`. A definition that dropped the transitivity condition would count 2.
- Conjugacy, not abstract isomorphism: the two subgroups `6T7` and `6T8` are isomorphic to
  `S₄` and have different parity (1.3), so they are not conjugate and count twice; abstract
  isomorphism types would count them once.

### 1.2 Completeness by descent through transitive maximal subgroups

Let `α` be finite and let `𝓡` be a finite set of transitive subgroups of `Equiv.Perm α` containing
`⊤`, such that for every `R ∈ 𝓡` every maximal subgroup of `R` that acts transitively on `α` is
conjugate in `Equiv.Perm α` to a member of `𝓡`. Prove that every transitive subgroup of
`Equiv.Perm α` is conjugate to a member of `𝓡`. The proof is a strong induction on `|R|` over the
members `R` that contain a conjugate of the given group `G`: if that conjugate is `R` there is
nothing to prove; otherwise it lies in a maximal subgroup `M` of `R` (`Finite.to_isCoatomic`),
`M` acts transitively because it contains a transitive group, and `M` is conjugate to a member
of `𝓡` of smaller order.

Prove the invariants that separate rows: conjugate subgroups of `Equiv.Perm α` have the same
order, the same parity (containment in `alternatingGroup α`), the same primitivity, and the same
number of elements of each full cycle type.

For each degree `6 ≤ n ≤ 11`, the rows of 1.3 satisfy the hypothesis of the descent criterion,
and any two distinct rows of the same degree are not conjugate. Both are finite statements about
explicitly generated subgroups; for each row they consist of the list of its transitive maximal
subgroups up to conjugacy in the row, each matched by an explicit conjugating permutation to a
row of smaller order, and, for each pair of rows, a separating invariant or a direct argument.
How a finite statement is proved is not prescribed.

*Needs:* Mathlib `Finite.to_isCoatomic`, `Subgroup.closure`, `alternatingGroup`,
`MulAction.IsPreprimitive`, `Equiv.Perm.cycleType`; 1.3 for the rows.

**Checks.**

- Degree 3 with `𝓡 = {S₃, A₃}`: the maximal subgroups of `S₃` are `A₃` and three subgroups of order
  2, which fix a point; the only maximal subgroup of `A₃` is trivial. The hypothesis holds and the
  criterion classifies degree three, the orders descending `6 → 3`.
- Degree 4 with `𝓡 = {S₄, A₄, D₄, C₄}`: the hypothesis fails at `A₄` and at `D₄`, which both have
  the normal Klein group as a transitive maximal subgroup, conjugate to no member. Adding it gives the five
  classes of 1.1; the omitted class is exactly the one the failed hypothesis points at.
- Separation by invariants in degree 6: `6T1` and `6T2` have order 6 and differ in cycle types
  (`6T1` contains a 6-cycle); `6T3`/`6T4` and `6T9`/`6T10` are separated by parity; among the
  three rows of order 24, `6T7` is even, and `6T6 ≅ A₄ × C₂` has no element of order 4 while
  `6T8 ≅ S₄` does.

### 1.3 The reference family through degree eleven

Extend the native family in place, without a second index type or subgroup family:

- `TauCeti.numTransitiveGroups n` takes the values `16, 7, 50, 34, 45, 8` for `n = 6, …, 11` and
  stays `0` for `n > 11`; the values for `n ≤ 5` do not change.
- For `6 ≤ n ≤ 11` and `j : TauCeti.TransitiveGroupIndex n`, `TauCeti.referenceSubgroup n j` is the
  closure of the zero-based translations of the generators of row `j + 1` of degree `n` in the
  TransGrp library at commit `165fc21`. The rows of degree at most five, and every native theorem
  about them, do not change.
- `TauCeti.TransitiveGroupLabel` keeps its definition, ambient conjugacy to the reference row.

Its API:

- every row acts transitively; its order, parity, primitivity and solvability are theorems row by
  row (the values for degrees 6, 7 and 11 are the Checks below; for degrees 8 to 10 they are
  computed from the generators);
- the column theorems `TauCeti.isPreprimitive_referenceSubgroup_iff`,
  `TauCeti.isSolvable_referenceSubgroup_iff` and `TauCeti.referenceSubgroup_le_alternatingGroup_iff`
  are restricted to `n ≤ 5`, and `TauCeti.numTransitiveGroups_eq_zero_of_five_lt` is replaced by
  the vanishing of the count above eleven; their consumers are refactored. Unrestricted, the
  primitivity column would assert that `6T6` is primitive (it has `n ≠ 4`) and the solvability
  column that `6T16 = S₆` is solvable (it has `n ≠ 5`); both are false;
- **the labelled classification**: for `1 ≤ n ≤ 11`, every transitive subgroup of
  `Equiv.Perm (Fin n)` has exactly one label `j`, and distinct labels are not conjugate. With 1.1
  this is the count read through the rows;
- **the `6T6` comparison**: for `r = (0 2 4)(1 3 5)` and `t = (2 5)`, the closure of `{r, t}` is
  `TauCeti.referenceSubgroup 6 5` (the label `6T6`). It has order 24, acts transitively, preserves
  the block system `{{0,3},{1,4},{2,5}}`, acts on the three blocks through the cyclic group of
  order 3 (the label `3T1`), and is isomorphic to `A₄ × C₂`: the conjugates `(2 5), (1 4), (0 3)`
  of `t` generate an elementary abelian group of order 8 that `r` permutes cyclically, its
  diagonal `(0 3)(1 4)(2 5)` is central, and the even part with `r` is `V₄ ⋊ C₃ ≅ A₄`.

These statements are not expressible at the pinned Tau Ceti, where
`TauCeti.TransitiveGroupIndex n` is empty for `n > 5`; they are targets of the evolved family.

*Needs:* the TransGrp generator input; Mathlib `Subgroup.closure`, `alternatingGroup`,
`MulAction.IsBlock`, `MulAction.IsPreprimitive`; Tau Ceti's native family and its degree-at-most-five
theorems; 1.2 for completeness and separation.

**Checks.** The degree-six rows, computed from the TransGrp generators (order, parity `+` for even,
primitive, solvable):

| label | group | order | parity | primitive | solvable |
|---|---|---|---|---|---|
| `6T1` | `C₆` | 6 | − | no | yes |
| `6T2` | `S₃` (regular) | 6 | − | no | yes |
| `6T3` | `D₆` | 12 | − | no | yes |
| `6T4` | `A₄` | 12 | + | no | yes |
| `6T5` | `C₃ × S₃` | 18 | − | no | yes |
| `6T6` | `A₄ × C₂` | 24 | − | no | yes |
| `6T7` | `S₄` | 24 | + | no | yes |
| `6T8` | `S₄` | 24 | − | no | yes |
| `6T9` | `S₃ × S₃` | 36 | − | no | yes |
| `6T10` | `C₃² ⋊ C₄` | 36 | + | no | yes |
| `6T11` | `S₄ × C₂` | 48 | − | no | yes |
| `6T12` | `A₅` | 60 | + | yes | no |
| `6T13` | `C₃² ⋊ D₄` | 72 | − | no | yes |
| `6T14` | `S₅` | 120 | − | yes | no |
| `6T15` | `A₆` | 360 | + | yes | no |
| `6T16` | `S₆` | 720 | − | yes | no |

- Four rows are primitive, matching the primitive count 4 of Conway–Hulpke–McKay Table 2; five
  are even and twelve solvable.
- Degree 7: `7T1 = C₇` (7, +), `7T2 = D₇` (14, −), `7T3 = F₂₁` (21, +), `7T4 = F₄₂` (42, −),
  `7T5 = PSL(3,2)` (168, +), `7T6 = A₇` (+), `7T7 = S₇` (−); all primitive, the first four
  solvable.
- Degree 11: `11T1 = C₁₁`, `11T2 = D₁₁`, `11T3 = F₅₅`, `11T4 = F₁₁₀`, `11T5 = PSL(2,11)` (order
  660), `11T6 = M₁₁` (order 7920), `11T7 = A₁₁`, `11T8 = S₁₁`; all primitive, the first four
  solvable; `11T2`, `11T4` and `11T8` are odd (a reflection is a product of five transpositions,
  and `x ↦ 2x` is a 10-cycle) and the other five are even (`F₅₅` is generated by an 11-cycle and a
  product of two 5-cycles; `PSL(2,11)` and `M₁₁` are simple).
- The primitive rows number `7, 7, 11, 9, 8` in degrees `7, 8, 9, 10, 11` (Conway–Hulpke–McKay
  Table 2); a primitivity column that kept the degree-five formula would make every row of degree
  6 to 11 primitive and give `16, 7, 50, 34, 45, 8`.
- `6T6` is odd, imprimitive and solvable; `6T16` is odd, primitive and not solvable. These are the
  two rows at which the unrestricted degree-five columns fail.

### Examples

- `6T6`, with its blocks and quotient `3T1`, as above.
- `6T7` and `6T8`: the two faithful transitive actions of `S₄` on six points, on the six edges of a
  tetrahedron (point stabilizer a non-normal Klein group; every element acts evenly) and on the
  cosets of a cyclic subgroup of order 4. They are not conjugate in `S₆`.

### Dependencies

Mathlib permutation groups and group actions; Tau Ceti `TauCeti.numTransitiveGroups`,
`TauCeti.referenceSubgroup`, `TauCeti.TransitiveGroupLabel` and their degree-at-most-five theorems;
the base roadmap Layers 1 and 6; the TransGrp generator input.

## Layer 2: Galois labels through degree eleven

### 2.1 The unique label

For a field `F` and a separable irreducible `f : F[X]` with `1 ≤ f.natDegree ≤ 11`, prove that
there is exactly one `j : TauCeti.TransitiveGroupIndex f.natDegree` with
`TauCeti.HasGaloisLabel f j`. The Galois image, read through any numbering of the roots, is
transitive (`TauCeti.isPretransitive_map_range_galActionHom_iff`); its label exists and is unique
by the labelled classification of 1.3; independence of the numbering is the native API. The label
determines the order of `f.Gal`, the parity of its action on the roots, primitivity and
solvability, by the comparison lemmas of `TauCeti.HasGaloisLabel` extended to the new rows. Like
1.3, this is not expressible at the pinned Tau Ceti for `f.natDegree ≥ 6`.

*Needs:* Tau Ceti `TauCeti.HasGaloisLabel`, `TauCeti.isPretransitive_map_range_galActionHom_iff`;
1.3.

**Checks.**

- `X⁶ − 2` over `ℚ` is irreducible (Eisenstein at 2); its splitting field `ℚ(2^{1/6}, ζ₆)` has
  degree 12, the Galois group acts on the six roots `2^{1/6} ζ₆^k` as the symmetries of a hexagon,
  and its discriminant `−6⁶ · (−2)⁵ = 2¹¹ · 3⁶` is not a square: the label is `6T3`, not the
  even `6T4` of the same order.
- `X⁶ + X⁵ + X⁴ + X³ + X² + X + 1 = Φ₇` over `ℚ`: the Galois group `(ℤ/7)ˣ ≅ C₆` acts regularly, so
  the label is `6T1`.
- `(X² − 2)(X⁴ + 1)` is separable and reducible, so it has no label: the image is intransitive.
- `(X² − 2)³` has two distinct roots and is not separable; it has no label of degree 6.

### Examples

`X⁶ − 2` and `Φ₇` as above.

### Dependencies

Layer 1; Tau Ceti's polynomial label API (the base roadmap Layer 6).

## Layer 3: radicals in characteristic zero

### 3.1 The radical criterion for finite Galois extensions

Let `F` have characteristic zero, let `E/F` be finite Galois, and let
`ι : E →ₐ[F] AlgebraicClosure F`. Prove (`isSolvable_iff_forall_mem_solvableByRad`)

```text
Group.IsSolvable (E ≃ₐ[F] E) ↔ ∀ x : E, ι x ∈ solvableByRad F (AlgebraicClosure F)
```

(Milne, *Fields and Galois Theory* v5.10, Theorem 5.34, p. 77, `milne-ft` line 3409). The radical
closure is taken in the algebraic closure: adjoining roots of unity can leave `E`, and
`solvableByRad F E` can be smaller.

Route. For the forward direction put `N = Nat.card (E ≃ₐ[F] E)` and choose a primitive `N`-th root
of unity `ζ` in `Ω = AlgebraicClosure F` (`HasEnoughRootsOfUnity.exists_primitiveRoot`; `N ≠ 0` in
`F` by characteristic zero); `ζ ∈ solvableByRad F Ω` by `solvableByRad.rad_mem`. In
`L = ι(E) ⊔ F(ζ)` the extension `L/F(ζ)` is Galois (`IsGalois.sup_right`) and its group embeds in
`E ≃ₐ[F] E` (`IntermediateField.restrictRestrictAlgEquivMapHom_injective`), so it is solvable.
Induct on `[L : K]` over intermediate fields `F(ζ) ⊆ K ⊆ L` contained in the radical closure: a
nontrivial solvable `Gal(L/K)` has a normal subgroup of prime index `p`
(`Group.IsSolvable.exists_normal_index_prime`), `p` divides `N`, so `K` contains a primitive `p`-th
root of unity, and the fixed field `M` is cyclic of degree `p` over `K`
(`IsGalois.normalAutEquivQuotient`), hence `M = K(α)` with `αᵖ ∈ K` (`isCyclic_tfae`) and
`M` lies in the radical closure. For the reverse direction take a primitive element of `E/F`
(`Field.exists_primitive_element`); `E` is the splitting field of its minimal polynomial, and
`isSolvable_gal_minpoly` gives solvability.

*Needs:* Mathlib `solvableByRad`, `solvableByRad.rad_mem`, `isSolvable_gal_minpoly`,
`isCyclic_tfae`, `HasEnoughRootsOfUnity.exists_primitiveRoot`,
`AlgebraicClosure.hasEnoughRootsOfUnity`, `IsGalois.sup_right`,
`IntermediateField.restrictRestrictAlgEquivMapHom_injective`, `IsGalois.normalAutEquivQuotient`,
`Field.exists_primitive_element`; Tau Ceti `Group.IsSolvable.exists_normal_index_prime`.

**Checks.**

- `E = F`: the group is trivial and every element of `F` is in the radical closure; both sides
  hold.
- `E` the splitting field of `X⁵ − 2` over `ℚ`: the group is the Frobenius group of order 20,
  solvable, and `E = ℚ(2^{1/5}, ζ₅)` is generated by radicals.
- `E` the splitting field of `X⁵ − 4X + 2` over `ℚ`: the group is `S₅` (three real roots, prime
  degree), not solvable, and no root of this polynomial is in the radical closure.
- The statement is false with `solvableByRad F E` in place of the radical closure in the algebraic
  closure. For the cyclic cubic field `E` of `X³ − 3X + 1` over `ℚ` the group is `C₃`, solvable;
  but `E` is real and cubic, so no `x ∈ E ∖ ℚ` has a power in `ℚ` (its conjugates `ζx` would need
  nonreal roots of unity `ζ`), hence `solvableByRad ℚ E = ℚ` contains no root, while the radical
  closure in the algebraic closure contains all three.

### 3.2 Polynomial forms

- **All roots** (`isSolvable_gal_iff_forall_rootSet_mem_solvableByRad`). For `F` of characteristic
  zero and any `q : F[X]`, `Group.IsSolvable q.Gal` holds exactly when every root of `q` in
  `AlgebraicClosure F` lies in `solvableByRad F (AlgebraicClosure F)`. Route: the splitting field
  of `q` is normal (`Normal.of_isSplittingField`) and separable because the characteristic is zero
  (`Algebra.IsSeparable.of_integral`), even when `q` has repeated factors, so it is finite Galois;
  it embeds in the algebraic closure with image generated by the roots of `q`, and 3.1 applies.
- **Some root, for irreducible polynomials.** If `q` is irreducible, the condition holds as soon as
  one root lies in the radical closure, by `isSolvable_gal_of_irreducible`.
- **Prime degree.** If `q ∈ ℚ[X]` is irreducible of prime degree `p ≥ 5` and has exactly two
  nonreal roots, no root of `q` lies in `solvableByRad ℚ (AlgebraicClosure ℚ)`
  (`Polynomial.Gal.galActionHom_bijective_of_prime_degree`, `Equiv.Perm.not_isSolvable`).

*Needs:* 3.1; Mathlib `Normal.of_isSplittingField`, `Algebra.IsSeparable.of_integral`,
`isSolvable_gal_of_irreducible`, `Polynomial.Gal.galActionHom_bijective_of_prime_degree`,
`Equiv.Perm.not_isSolvable`.

**Checks.**

- `q = 0` and constant `q`: `q.Gal` is trivial and there are no roots; both sides hold.
- `(X⁵ − 4X + 2)(X − 1)` over `ℚ`: the root `1` is in the radical closure but the Galois group
  contains `S₅`, so a some-root form fails for reducible polynomials.
- `X⁵ − 4X + 2` has three real and two nonreal roots, so none of its roots is a radical expression;
  `X³ − 2` (prime degree 3, two nonreal roots) is solvable, which is why the prime-degree
  statement needs `p ≥ 5`.

### 3.3 The quintic resolvent: separation and Dummit's criterion

- **Separation.** Let `F` be a field in which `5 ≠ 0` and `f : F[X]` monic, separable and
  irreducible of degree five. Prove that the specialized sextic
  `TauCeti.quinticF20Spec.specialize F f` is separable, so that the base roadmap's criterion
  `TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` applies with no separation
  hypothesis. Route (Chapman's note, `chapman-quintics` lines 16–30, written over `ℚ`; the
  argument uses only `5 ≠ 0`). The six roots of the sextic are the values `θ₁, …, θ₆` of Dummit's
  invariant on the six cosets of `F₂₀` in `S₅`. The Galois group contains a 5-cycle `c`; number the
  roots `x₁, …, x₅` so that `c = (1 2 3 4 5)`. Then `c` fixes `θ₁` and permutes `θ₂, …, θ₆` in one
  cycle, so a coincidence `θᵢ = θⱼ` with `i ≠ j` propagates under powers of `c` to
  `θ₂ = θ₃ = θ₄ = θ₅ = θ₆`. The polynomial identities
  `θ₂ − θ₃ = (x₁ − x₄)(x₃ − x₅)[(x₂ − x₁)(x₂ − x₄) − (x₂ − x₃)(x₂ − x₅)]` and
  `θ₄ − θ₅ = (x₃ − x₄)(x₁ − x₅)[(x₂ − x₃)(x₂ − x₄) − (x₂ − x₁)(x₂ − x₅)]` (with Dummit's
  `θ₂ = (1 2 3)θ₁`, `θ₃ = (1 3 2)θ₁`, `θ₄ = (1 2)θ₁`, `θ₅ = (2 3)θ₁`, `θ₆ = (1 3)θ₁`, `dummit-quintics`
  lines 53–70) and the distinctness of the roots then force `2x₂ = x₁ + x₃ = x₄ + x₅` (in
  characteristic 2 they force `x₁ = x₃` or `x₄ = x₅` directly), so `5x₂` is the sum of the roots, an
  element of `F`, and `x₂ ∈ F` contradicts irreducibility.
- **Dummit's criterion, group form.** Under the same hypotheses, `Group.IsSolvable f.Gal` holds
  exactly when the sextic has a root in `F`: the native criterion with the separation just proved.
- **Dummit's criterion, radical form**
  (`forall_rootSet_mem_solvableByRad_iff_exists_isRoot_quinticF20`). For `F` of characteristic zero
  and `f` monic irreducible of degree five, the roots of `f` lie in
  `solvableByRad F (AlgebraicClosure F)` exactly when `TauCeti.quinticF20Spec.specialize F f` has
  a root in `F` (Dummit, Theorem 1, p. 389, `dummit-quintics` lines 100–103, stated over `ℚ`; the
  proof uses only characteristic zero). When it does, the sextic is a linear factor times an
  irreducible quintic: the 5-cycle permutes the other five roots transitively and they are
  distinct.

*Needs:* Tau Ceti `TauCeti.quinticF20Spec`, `TauCeti.ResolventSpec.specialize`,
`TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec`; the base roadmap Layer 4;
Mathlib Cauchy's theorem (`exists_prime_orderOf_dvd_card`); 3.2.

**Checks.**

- The two identities above hold in `ℤ[x₁, …, x₅]`, and the stabilizer of `θ₁` in `S₅` has order 20,
  generated by `(1 2 3 4 5)` and `(2 3 5 4)`; under the substitution action `(1 2 3 4 5)` sends
  `θ₂ ↦ θ₆ ↦ θ₃ ↦ θ₄ ↦ θ₅ ↦ θ₂`.
- `X⁵ − 2`: the sextic is `X⁶ − 50000 X` (Dummit's (2′) with `a = 0`, `b = −2`), separable, with the
  rational root `0`; the roots `2^{1/5} ζ₅^k` are radical.
- `X⁵ − 5X − 12`: the sextic has the rational root `40`; the Galois group is `D₅`.
- `X⁵ − X − 1`: the sextic has constant term `256 + 9375 = 9631`, which is prime, and neither
  `±1` nor `±9631` is a root; the group is `S₅` and the roots are not radical.
- `X⁵ − X` is separable and reducible; its sextic is `(X − 2)⁴ (X² + 16)`, which is not separable,
  and its rational root `2` does not put the Galois group (generated by a transposition) in a
  conjugate of `F₂₀`. The separation theorem is false without irreducibility; this is the native
  collision example.

### Examples

The quintics `X⁵ − 2` (`F₂₀`, radical), `X⁵ − 5X − 12` (`D₅`, radical) and `X⁵ − X − 1` (`S₅`, not
radical), and the reducible `(X⁵ − 4X + 2)(X − 1)`.

### Dependencies

Mathlib Abel–Ruffini, Kummer theory, roots of unity and Galois correspondence; Tau Ceti
`Group.IsSolvable.exists_normal_index_prime` and the quintic resolvent; the base roadmap Layer 4.

## Layer 4: arithmetic equivalence

### 4.1 Gassmann's theorem

Let `E` be a number field, Galois over `ℚ`, and let `H, K ≤ Gal(E/ℚ)` be almost conjugate. Prove
(`dedekindZetaCoeff_fixedField_eq_of_almostConjugate`) that for every `n`,

```text
TauCeti.dedekindZetaCoeff (fixedField H) n = TauCeti.dedekindZetaCoeff (fixedField K) n,
```

hence `NumberField.dedekindZeta` of the two fixed fields agree (Perlis, Theorem 1, sufficient
direction, uncertified; the theorem is restated as Sutherland's Theorem 2.10, p. 7,
`sutherland-arith-equiv` lines 252–256).

Route. Prove two lemmas first.

- *Local counts.* For a number field `L` the coefficient `TauCeti.dedekindZetaCoeff L` is
  multiplicative on coprime arguments, and its value at `p^k` is the number of families
  `(k_𝔮)` of natural numbers, indexed by the primes `𝔮` of `L` above `p`, with
  `Σ f(𝔮/p) k_𝔮 = k`. So the coefficients are determined, prime by prime, by the multiset of
  residue degrees above `p`.
- *Residue degrees from the Galois group.* Fix a prime `Q` of `E` above `p` with decomposition
  group `D` and inertia group `I`. The primes of `E^H` above `p` correspond to the `D`-orbits on
  `Gal(E/ℚ) ⧸ H`, with `e·f` the orbit size (`Ideal.doubleCosetQuotientEquivPrimesOver`,
  `Ideal.map_card_orbit_stabilizer_eq_map_ramificationIdx_mul_inertiaDeg`); the residue degree of
  the prime of an orbit is the number of `I`-orbits it contains, so the multiset of residue
  degrees is the full cycle type of a Frobenius element of `D/I` acting on the `I`-orbits of
  `Gal(E/ℚ) ⧸ H`.

Almost-conjugacy gives equivalent complex permutation representations of `Gal(E/ℚ)` on the cosets
of `H` and of `K` (`Gassmann.almostConjugate_iff_permutation_equiv`); restricting to `D`
(`Gassmann.restrictEquiv`) and taking `I`-invariants (`Gassmann.normalInvariantEquiv`) gives
equivalent representations of `D/I` on the permutation modules of the `I`-orbits
(`Gassmann.invariantOrbitSumBasis`, `Gassmann.orbitSumEquivariant`). Equal characteristic
polynomials of Frobenius give equal products `∏ (1 − Zᵈ)` over the full cycle types
(`Gassmann.charpoly_reverse_eq_prod_fullCycleType`), and such a product determines its multiset of
exponents (strip the factor of least degree and induct). So the residue degrees above every `p`
agree, and the local counts finish.

*Needs:* Tau Ceti `TauCeti.dedekindZetaCoeff`, `Ideal.doubleCosetQuotientEquivPrimesOver`,
`Ideal.map_card_orbit_stabilizer_eq_map_ramificationIdx_mul_inertiaDeg`; Mathlib `Ideal.absNorm`,
`NumberField.dedekindZeta`; Number Field Arithmetic Layer 1.4; Induction–Restriction Layer 2.1
(`Gassmann.AlmostConjugate`, `Gassmann.almostConjugate_iff_permutation_equiv`,
`Gassmann.restrictEquiv`, `Gassmann.normalInvariantEquiv`, `Gassmann.invariantOrbitSumBasis`,
`Gassmann.orbitSumEquivariant`, `Gassmann.charpoly_reverse_eq_prod_fullCycleType`).

**Checks.**

- `n = 0`: both coefficients are `1`, the zero ideal.
- Equal order is not enough. In `Gal(ℚ(√2, √3)/ℚ) ≅ V₄` the three subgroups of order 2 are
  pairwise not almost conjugate (the group is abelian, so its conjugacy classes are points and
  almost-conjugate subgroups are equal), and their fixed fields `ℚ(√2)`, `ℚ(√3)`, `ℚ(√6)` have
  coefficients `0, 1, 1` at 3 (3 is inert, ramified, ramified) and `0, 0, 2` at 5 (inert, inert,
  split).
- Residue degrees from the Galois group: for `E = ℚ(i)`, `H = 1` and `p = 5`, `D = I = 1`, the two
  `D`-orbits on `Gal(E/ℚ)` give two primes of residue degree 1, and the coefficient of `ℚ(i)` at 5
  is 2.

### 4.2 Isomorphic fixed fields and conjugate subgroups

For a finite Galois extension `E/F` and subgroups `H, K ≤ E ≃ₐ[F] E`, prove that `fixedField H`
and `fixedField K` are isomorphic as `F`-algebras exactly when `H` and `K` are conjugate (stated
for number fields with a common Galois closure in Sutherland, introduction, p. 1,
`sutherland-arith-equiv` lines 30–31). An `F`-isomorphism `fixedField H → fixedField K` extends to an automorphism `g` of `E`
(`AlgHom.liftNormal`), `g` carries `fixedField H` onto `fixedField (g H g⁻¹)`
(`IsGalois.map_fixingSubgroup`), and the Galois correspondence is injective
(`IntermediateField.fixingSubgroup_fixedField`).

*Needs:* Mathlib `AlgHom.liftNormal`, `IsGalois.map_fixingSubgroup`,
`IntermediateField.fixingSubgroup_fixedField`.

**Checks.**

- `E` the splitting field of `X³ − 2` over `ℚ`, `H, K` two distinct subgroups of order 2: they are
  conjugate, and `ℚ(∛2) ≅ ℚ(ζ₃ ∛2)` although the fields are distinct.
- `H = 1`, `K = E ≃ₐ[F] E` for `E ≠ F`: not conjugate, and `E ≇ F` as `F`-algebras, by degree.
- Isomorphic subgroups are not enough. For the splitting field `E` of `X⁴ + X + 1` over `ℚ`
  (group `S₄`), the normal Klein group and a non-normal Klein group are isomorphic and not
  conjugate; the first fixes a Galois sextic field and the second a non-Galois one, so the fixed
  fields are not isomorphic.

### 4.3 Nonisomorphic number fields with the same zeta function

Prove (`exists_dedekindZetaCoeff_eq_not_isomorphic`) that there are number fields `K` and `L` with
`TauCeti.dedekindZetaCoeff K n = TauCeti.dedekindZetaCoeff L n` for every `n` and no ring
isomorphism `K ≃+* L` (Gassmann's phenomenon, recounted in Sutherland, introduction, p. 1,
`sutherland-arith-equiv` lines 22–29). Route:
take a monic `f : ℤ[X]` of degree 16 whose image in `ℚ[X]` is irreducible and satisfies
`Polynomial.HasFullSymmetricGaloisGroup` (`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`),
let `E` be the splitting field of that image (a number field by `Polynomial.SplittingField.instNumberField`, Galois by
`IsGalois.of_separable_splitting_field`), and identify `E ≃ₐ[ℚ] E` with `Equiv.Perm (Fin 16)` by
the root action and a numbering of the roots. Pull back the pair of
`Gassmann.exists_S16_gassmann_pair` along this isomorphism (`Gassmann.almostConjugate_comap`,
`Gassmann.not_conj_comap`), take `K` and `L` to be the two fixed fields, and apply 4.1 and 4.2; a
ring isomorphism of number fields is a `ℚ`-algebra isomorphism.

*Needs:* 4.1, 4.2; Tau Ceti `TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`,
`Polynomial.HasFullSymmetricGaloisGroup`, `Polynomial.SplittingField.instNumberField`; Mathlib
`IsGalois.of_separable_splitting_field`, `IntermediateField.finrank_eq_fixingSubgroup_index`;
Induction–Restriction Layers 2.1 and 2.2 (`Gassmann.exists_S16_gassmann_pair`,
`Gassmann.almostConjugate_comap`, `Gassmann.not_conj_comap`); the base roadmap Layer 9.

**Checks.**

- Degree: both fields have degree `[S₁₆ : H] = 16!/16 = 15! = 1307674368000` over `ℚ`
  (`IntermediateField.finrank_eq_fixingSubgroup_index`).
- In the regular representations of `C₄ × C₄` and `Q₈ × C₂` on 16 points, both groups have one
  element of full cycle type `1¹⁶`, three of type `2⁸` and twelve of type `4⁴`, so they are almost
  conjugate in `S₁₆`; `C₄ × C₄` is abelian and `Q₈ × C₂` is not, so they are not conjugate.
- The pair is not a pair of isomorphic fields in disguise: by 4.2 an isomorphism would conjugate
  the two subgroups of `S₁₆`, and nonconjugacy is part of the supplier's statement.

### Examples

The fixed fields of the `S₁₆` pair; the conjugate cubic fields `ℚ(∛2)` and `ℚ(ζ₃ ∛2)` as the
trivial case of 4.1.

### Dependencies

Tau Ceti number-field and Dirichlet-series API; Induction–Restriction Layers 2.1 and 2.2; Number
Field Arithmetic Layer 1.4; the base roadmap Layer 9.

## Downstream consumers

- BelyiMaps Layer 1.6 and its `6T6` record comparison use the reference family through degree
  eleven and the `6T6` comparison of 1.3.
- Finite Group Invariants Layers 7 and 8: 7.2 and 8.3 are finite checks over the reference rows
  of 1.3; 7.4 (Perlis' theorem, both
  directions) takes its sufficient direction from 4.1; 7.6 (the number of fields arithmetically
  equivalent to a given one) uses 4.2 to pass from conjugacy of subgroups to isomorphism of fields.

## References

- G. Butler and J. McKay, *The transitive groups of degree up to eleven*, Comm. Algebra 11 (1983)
  863–911: the whole article is the list of transitive groups of degree at most eleven (1.1,
  1.3). Uncertified (paywalled): cited by its locator, not read; the counts used are those of
  Conway–Hulpke–McKay, Table 2.
- J. H. Conway, A. Hulpke and J. McKay, *On transitive permutation groups*, LMS J. Comput. Math. 1
  (1998) 1–8, `conway-hulpke-mckay`. Table 2, p. 7 (lines 282–285): the numbers of transitive and
  of primitive groups of each degree up to 31, in particular `1, 2, 5, 5, 16, 7, 50, 34, 45, 8`
  and `1, 2, 2, 5, 4, 7, 7, 11, 9, 8` in degrees 2 to 11.
- A. Hulpke, the TransGrp library for GAP, files `lib/trans.grp` and `data/trans8.grp` to
  `data/trans11.grp` at commit
  [`165fc21`](https://github.com/hulpke/transgrp/tree/165fc21ff497b24b7a5975582b331e6692ba04f1)
  (`transgrp`, `transgrp-11`): the generator input of 1.3. The file is an input; none of its
  classification assertions is used as a proof.
- [LMFDB, transitive group `6T6`](https://www.lmfdb.org/GaloisGroup/6T6): the same group, as a
  comparison for the Checks of 1.3.
- J. D. Dixon and B. Mortimer, *Permutation Groups*, GTM 163, Springer, 1996. Theorem 2.6A: the
  wreath embedding of an imprimitive group, consumed through the base roadmap's Layer 1.
- J. S. Milne, *Fields and Galois Theory*, v5.10 (2022), `milne-ft`. Theorem 5.34, p. 77 (line
  3409): in characteristic zero a polynomial is solvable in radicals iff its Galois group is
  solvable (3.1, 3.2).
- D. S. Dummit, *Solving solvable quintics*, Math. Comp. 57 (1991) 387–401, `dummit-quintics`.
  §2, p. 388 (lines 45–70): the invariant `θ₁`, its stabilizer `F₂₀` and the conjugates
  `θ₂, …, θ₆`; equation (2′), p. 389 (lines 97–99): the sextic of `x⁵ + ax + b`; Theorem 1, p. 389
  (lines 100–103): an irreducible rational quintic is solvable by radicals iff the sextic has a
  rational root, and then the sextic is a linear factor times an irreducible quintic (3.3).
- R. Chapman, *Note on "Solving solvable quintics" by D. Dummit* (1992), on Dummit's author page,
  `chapman-quintics`, lines 16–30: the two factorizations of `θ₂ − θ₃` and `θ₄ − θ₅` and the
  argument that the sextic of an irreducible quintic has distinct roots (3.3).
- R. Perlis, *On the equation ζ_K(s) = ζ_K′(s)*, J. Number Theory 9 (1977) 342–360. Theorem 1:
  the fields are arithmetically equivalent iff the subgroups are almost conjugate (4.1, sufficient
  direction). Uncertified: cited by its locator, through Sutherland.
- A. V. Sutherland, *Stronger arithmetic equivalence*, Discrete Analysis 2021:23,
  arXiv:2104.01956, `sutherland-arith-equiv`. Introduction, p. 1 (lines 22–31): Gassmann's first
  nonisomorphic arithmetically equivalent fields and his group-theoretic criterion, and
  isomorphism of the fields iff conjugacy of the subgroups (4.2, 4.3); Proposition 2.6, p. 5
  (lines 195–201): equivalent forms of almost-conjugacy; Theorem 2.10, p. 7 (lines 252–256): equal
  zeta functions iff almost conjugate Galois groups, citing Perlis's Theorem 1 (4.1).
