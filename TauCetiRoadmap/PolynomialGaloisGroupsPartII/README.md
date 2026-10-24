# Roadmap: Galois groups of polynomials, Part II — ramified merging and random partitions

**Summary.** A monic integral polynomial can have repeated factors modulo a prime even
when its characteristic-zero roots are distinct. This roadmap expresses that reduction
as a bounded merging of equal factor degrees, proves a criterion for arbitrary laws on
integer partitions that excludes transitive groups other than the alternating and
symmetric groups, and joins the two results by a deterministic Galois certificate.
A second interface identifies higher irreducibility with transitivity on ordered
root tuples. The probability theorem takes three explicit partition estimates; its
conclusion has constants uniform in both the law and the permitted merging exponent.
It continues PolynomialGaloisGroups, whose Layer 5 uses factorization/cycle-type
equality at primes not dividing the polynomial discriminant; bounded merging
extends that comparison to every prime.

## Scope and ownership

This continuation owns equal-part merging, the ramified specialization comparison,
ordered-root higher irreducibility, the three-premise partition law, five anatomy
events, minimum-support estimates, and the resulting group exclusions. Its arithmetic
comparison allows every prime and records collisions of distinct integral roots.
Its probability criterion applies to a measure on partitions without choosing a
polynomial coefficient distribution.

The prerequisites and boundaries are as follows.

- **PolynomialGaloisGroups, Layers 0 and 1** own faithful root actions, the
  orbit/factor dictionary, blocks, block-stabilizer correspondence, and the
  imprimitivity grid and wreath embedding. The grid supplies an equivariant
  quotient of a transitive imprimitive action into equal blocks.
  NumberFieldArithmetic, §3.10, owns the factorization/cycle-type equality
  for monic integral polynomials at primes not dividing their polynomial
  discriminant. PolynomialGaloisGroups, Layer 5, imports that equality and
  owns the factor-degree carrier and polynomial membership adapter; its Layer 9
  supplies the surrounding polynomial symmetric-group context. The equality is
  implemented by `TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`
  in `TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean`; this continuation
  extends its prime range by allowing collisions and bounded merging.
- **Mathlib and Tau Ceti** own the partition carrier, full permutation cycle
  type, reduction factor degrees, arithmetic Frobenius lifts, finite-field
  Frobenius orbits, and the simple-root stabilizer and double-transitivity
  quotient adapter. Tau Ceti also owns single-cycle fibre arithmetic
  for equivariant maps. This continuation assembles its occurrence-block witness
  and its invariant unions of whole blocks.
- **AnalyticNumberTheoryPartI, §0.26**, supplies the reciprocal prime product
  with its Euler-constant coefficient
  and constant-identification proof. **ErdosProgressionPowers, §0.9**, owns
  the eventual divisor-subpower bound. The unspecified-constant Euler-product bound
  does not suffice for the large-prime harmonic mass.
- Concrete coefficient laws, bounds for repeated reduction factors and quantitative
  irreducibility for random polynomials of growing degree are outside this roadmap.
  They consume 6.1 and 6.2 and motivate a continuation of ArithmeticStatistics;
  their distribution estimates are not prerequisites of the arbitrary-law theorem.

The suggested namespace is `TauCetiRoadmap.PolynomialGaloisGroupsPartII`.
`Suggested.lean` states the headline acceptance theorems and the simple definitions
needed to express them; this README specifies the complete API and proof obligations.

## Conventions

A permutation carrier `Ω` is finite, and `n = card Ω`. Write `S_Ω` for its
full permutation group and `A_Ω` for its alternating subgroup. When comparing a
polynomial Galois group with either, use its faithful image in `S_Ω`, with `Ω`
the distinct roots in a splitting field. An abstract group isomorphism alone
cannot identify the blocks of that action.
Permutation multiplication is function composition: `(σ * τ) x = σ (τ x)`.
Frobenius is arithmetic: reduction of its lift sends `z` to `z^p` at a
rational prime `p`.

**Checks for action conventions.**

- On `{0,1,2}`, `(0 1) * (1 2)` sends `0` to `1`, whereas reversing
  the product sends `0` to `2`. This fixes the composition direction used
  by conjugation and the commutator argument.
- In `F₈ = F₂[u]/(u³+u+1)`, arithmetic Frobenius sends `u` to `u²`;
  its inverse sends `u` to `u⁴ = u²+u`, a different element. The factor
  orbit is `u -> u² -> u²+u -> u`, fixing the direction in both the
  Frobenius-lift and finite-field-orbit supplier contracts.

A partition `ρ : Nat.Partition n` is a multiset of positive natural numbers
with sum `n`. Multiset containment, filtering, and cardinality count occurrences.
Thus `{k,k} ≤ ρ.parts` means two occurrences. Use
`Equiv.Perm.fullCycleType`, which includes fixed points as parts `1`, and
`Polynomial.factorDegrees`, which retains the exponents of normalized
irreducible reduction factors. Equal degrees from different irreducible factors
are separate occurrences, but they do not increase factor multiplicity.
For a swap on three points, the full cycle type is `{2,1}`, of sum three;
the ordinary cycle type is `{2}`. This two-part witness also fixes the
fixed-point convention used by the cycle-fibre and merging comparisons.

For a field `F` and `f : F[X]`, put `L = f.SplittingField`. An ordered
`j`-tuple of distinct roots is an embedding `Fin j ↪ f.rootSet L`.
Its generated field is an `IntermediateField F L`; the quotient polynomial
is formed over that field using monic polynomial division. The original `f`
need not be monic for the higher-irreducibility results. The integral
specialization theorem does require a monic polynomial.

Partition measures use the discrete measurable structure `partitionMeasurableSpace`.
`PartitionLaw` is a proposition about a measure with three quantitative fields; it does not
include probability normalization. Each probability theorem separately requires
`IsProbabilityMeasure ν`. This matters because `ν.real` alone does not enforce
finite total mass.

Reciprocal sums run over positive integers, with inclusive integer endpoints.
Powers and comparisons involving cutoffs are real. Natural divisibility and
multiset sums remain natural until explicitly cast. The asymptotic statements
have a threshold `N ≥ 3`, so `log n > 0` and all logarithmic cutoffs have their
usual meaning. The definitions themselves use Lean's total real logarithm and
division, including at small degrees; no small-degree interpretation is used
in an asymptotic proof.

The common parameter range is

```text
C ≥ 1,  0 < t < 1,  0 < κ ≤ 1,  0 < δ ≤ 1/10,
0 < ε < δ/2,  0 ≤ θ ≤ δ/2 − ε,
α = δ/4 − θ/2,  so ε/2 ≤ α ≤ 1/40.
```

Every probability constant `B` and threshold `N` depends only on
`C,t,κ,δ,ε`. It is chosen before `n`, `ν`, and `θ`; the law may vary with `n`.
The deterministic exclusions need only `t,κ,δ,ε` in their thresholds, with
`0 < t` and no upper restriction on `t`. The convention for minimum support
uses `Option ℕ`: a trivial group has `none`, never an artificial minimum zero.

A few letters are local to a layer. In Layers 0, 1 and 5, `m` is a merging
multiplicity or fibre size; in Layer 3 it is a harmonic cutoff; in Layer 4 it
is a minimum support. `r` is a map in 0.4 and 1.2 and a block count elsewhere.
`D` is a constant in the analytic contracts and a distinguisher set in Layer 4.
Each subsection fixes the meaning it uses.

## Exact supplier contracts

### From Mathlib

The library pin is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
The following are the interfaces consumed, with their required hypotheses.

- `Mathlib.Combinatorics.Enumerative.Partition.Basic`: `Nat.Partition`, with
  `parts`, positivity, `parts_sum`, extensionality, and a finite partition type.
- `Mathlib.FieldTheory.PolynomialGaloisGroup`: `Polynomial.Gal.galActionHom`
  and `galActionHom_injective` for a field extension in which the polynomial
  splits, recorded by the required `Fact`; `Polynomial.Gal.restrict_surjective`
  for a normal extension in which it splits. The intrinsic action on the roots
  in its own splitting field is also available. A quotient's splitting extension
  need not be its minimal splitting field.
- `Mathlib.RingTheory.Ideal.GoingUp`:
  `Ideal.exists_maximal_ideal_liesOver_of_isIntegral`, for an integral faithful
  algebra and a maximal base ideal. Apply it to the ring of integers above `(p)`.
- `Mathlib.Algebra.Polynomial.RingDivision`:
  `Polynomial.rootMultiplicity_mul`, over an integral domain with nonzero
  product, and `Polynomial.rootMultiplicity_X_sub_C`, whose value at `z`
  is `1` when the removed root equals `z` and `0` otherwise. Products of the
  monic linear factors used here are nonzero.
- `Mathlib.FieldTheory.IntermediateField.Adjoin.Defs`:
  `IntermediateField.adjoin`, `subset_adjoin`, `adjoin_le_iff`,
  `adjoin_empty`, and `IntermediateField.adjoin.mono`. These give the actual generated
  intermediate field, its generator inclusions and universal property.
- `Mathlib.GroupTheory.GroupAction.MultipleTransitivity`:
  `MulAction.isMultiplyPretransitive_iff` characterizes transport between
  embeddings of `Fin k`; `SubMulAction.ofStabilizer.isMultiplyPretransitive`
  gives the point-stabilizer recursion for an already pretransitive action;
  `MulAction.isMultiplyPretransitive_of_le` needs `l ≤ k ≤ Nat.card Ω`.
  `IsMultiplyPretransitive.alternatingGroup_le` recognizes the alternating
  subgroup at `card Ω − 2`, and `alternatingGroup.isMultiplyPretransitive`
  supplies the reverse implication. Passing from an action to its image does
  not change the orbits on tuples.
- `Mathlib.GroupTheory.GroupAction.Primitive`: `MulAction.IsPreprimitive`
  includes pretransitivity and triviality of all blocks. The multiple-transitivity
  module provides `MulAction.isPreprimitive_of_is_two_pretransitive`.
- `Mathlib.GroupTheory.GroupAction.Jordan`:
  `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem` and
  `Equiv.Perm.alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem`.
  They recognize a primitive subgroup containing a transposition or a 3-cycle.
  These pinned forms include the degrees needed here, in particular degree five.
- `Mathlib.NumberTheory.Harmonic.Bounds`: `harmonic_le_one_add_log` and
  `log_add_one_le_harmonic`, after casting the harmonic sum to `ℝ`.
  `Mathlib.NumberTheory.Harmonic.EulerMascheroni` provides
  `Real.eulerMascheroniConstant_lt_two_thirds`. Together with
  `2/3 < log 2`, which follows from `Real.log_two_gt_d9` in
  `Mathlib.Analysis.Complex.ExponentialBounds`, it gives `exp γ < 2`.

### From Tau Ceti

The signatures use Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

- `TauCeti.GroupTheory.Perm.Partition`: `Equiv.Perm.fullCycleType`,
  `sum_fullCycleType`, `fullCycleType_eq_of_isConj`, and
  `fullCycleType_permCongr`. Their contracts include the `1`-parts and preserve
  the full multiset under conjugacy and relabeling.
- `TauCeti.RingTheory.Polynomial.FactorDegrees`: `Polynomial.factorDegrees`
  for an integral polynomial and prime `p`, and
  `Polynomial.Monic.sum_factorDegrees`. A monic reduction is nonzero and has
  the same degree, so its factor degrees form a partition of that degree.
- `TauCeti.NumberTheory.NumberField.Frobenius`:
  `NumberField.exists_isArithFrobAt_int_of_liesOver`. A Galois number field,
  a prime `p`, and a prime ideal of its integers lying over `(p)` give an
  arithmetic Frobenius lift. There is no unramifiedness premise.
- `TauCeti.FieldTheory.GaloisGroups.FrobeniusOrbits`:
  `TauCeti.FiniteField.exists_orbit_eq_rootSet_factor`, for a nonzero
  finite-field polynomial splitting in an algebraic field extension. The roots
  of an irreducible factor form one Frobenius orbit of cardinality its degree.
- `TauCeti.FieldTheory.GaloisGroups.Orbits`:
  `TauCeti.isPretransitive_iff_irreducible`, for a separable positive-degree
  polynomial in a splitting extension. Without separability this equivalence
  is false: `(X²−2)²` has a transitive action on its two distinct roots but
  is reducible.
- `TauCeti.FieldTheory.GaloisGroups.Stabilizer`:
  `TauCeti.stabilizer_eq_fixingSubgroup_adjoin_simple`, identifying the
  stabilizer of one root with the fixing subgroup of its simple root field.
- `TauCeti.FieldTheory.GaloisGroups.MultipleTransitivity`:
  `TauCeti.is_two_pretransitive_iff_irreducible_divByMonic`. It requires an
  irreducible separable polynomial of degree greater than one and a chosen
  root, and tests the quotient over the field generated by that root.
- `TauCeti.RingTheory.Polynomial.Roots`:
  `Polynomial.rootSet_divByMonic_X_sub_C`. Over a field, division by
  `X - C a` at a simple base-field root removes exactly that root from
  the root set in an extension field.
- `TauCeti.GroupTheory.Perm.CyclePower`:
  `Equiv.Perm.IsCycle.pow_apply_eq_self_iff`. At a point moved by a cycle,
  a power fixes it exactly when the cycle order divides the exponent.

### From Tau Ceti, cycle-fibre arithmetic

`TauCeti.GroupTheory.Perm.Semiconj` supplies the single-cycle arithmetic:
`Function.Semiconj.minimalPeriod_dvd`,
`Function.Semiconj.setOf_sameCycle_and_eq`, and
`Function.Semiconj.ncard_sameCycle_and_eq_mul_minimalPeriod`.
For finite carriers and `r ∘ σ = ψ ∘ r`, the latter says

```text
#{y : σ.SameCycle x y and r y = r x} · minimalPeriod ψ (r x)
  = minimalPeriod σ x.
```

The set identity identifies this fibre intersection with the return orbit of
`σ^(minimalPeriod ψ (r x))`. Thus the bottom period divides the top period,
and every fibre intersection along that bottom orbit has the same cardinality.
The existing `TauCeti.orbitCount_le_mul_orbitCount_of_semiconj` also bounds the
number of top cycles by a fibre-size bound times the number of bottom cycles.
These interfaces are suppliers: Layer 0 assembles a global equal-part-merging
witness, while Layer 5 builds invariant unions of whole fibres and compares
those unions for different cycles. Neither layer asks to re-prove the
single-cycle formula.

### From PolynomialGaloisGroups, Layer 1

For a faithful transitive imprimitive action on `n` points, the imprimitivity
wreath-embedding target supplies `r,s > 1`, `n = rs`, and an equivariant
identification with `Fin r × Fin s` under which each element permutes rows.
Projection gives a surjection to `Fin r` with fibres of cardinality `s`.
Consequently `r ∣ n` and `1 < r < n`. The continuation requires precisely
this quotient, not a new construction of the general wreath product.
See [PolynomialGaloisGroups, Layer 1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PolynomialGaloisGroups/README.md#layer-1-permutation-groups-blocks-and-wreath-products).

### From ErdosProgressionPowers, §0.9

ErdosProgressionPowers, §0.9, supplies, for every real `η > 0`, the bound
`τ(n) ≤ n^η` for all sufficiently large positive integers, including
nonsquarefree integers. Enlarging a constant over the finitely many positive
exceptions gives `D_η ≥ 1` with `τ(n) ≤ D_η n^η` for every `n ≥ 1`.
The application uses `η = δ/4` and retains its dependence on `δ`.

### From AnalyticNumberTheoryPartI, §0.26

AnalyticNumberTheoryPartI, §0.26, Mertens's third theorem, supplies the following bound:
there exist real `D ≥ 0` and `x₀ ≥ 2` such that, for every real `x ≥ x₀`,
`|∏_{p prime, p ≤ x}(1−1/p)⁻¹ − exp(Real.eulerMascheroniConstant) log x| ≤ D`.

Prime endpoints are inclusive. Only the upper half is used in 3.4.
The supplier owns the constant-identification proof, including its analytic
Euler-product and Euler-constant comparison inputs. The need for this precise
coefficient is visible in BSKK, Lemma 12.5, pp.60–61. This contract requests
the general estimate rather than an unspecified multiple of `log x`.

## How to read the build

Layer 0 establishes occurrence-sensitive merging and assembles the global
cycle-type witness over a cyclic quotient. Layer 1 applies it to ramified reduction.
Layer 2 builds the independent ordered-root interface. Layer 3 obtains five
anatomy estimates from the partition law. Layer 4 supplies the primitive
minimum-support obstruction, and Layer 5 combines it with block arithmetic
to exclude both kinds of proper transitive groups. Layer 6 takes a finite
union of exceptional events and attaches the arithmetic certificate.

## Layer 0: bounded equal-part merging

### 0.1 Occurrence blocks

Define `EqualPartMerging y a b` for `y : ℝ` and natural multisets `a,b` by
requiring a multiset of nonempty occurrence blocks whose flattening is `a`
and whose multiset of sums is `b`. Every block has cardinality at most `y`
and all its entries are equal. A block containing `m` copies of `k` produces
one part `mk`. The intended partition relation uses `y ≥ 1`; the raw relation
also makes sense for arbitrary real bounds and empty multisets.
(BSKK, Definition 11.2 and example, §11.2, p.56.)

Its API consists of the following consequences of the definition
(BSKK, Lemma 12.9, pp.62–63).

- For `1 ≤ y`, every multiset merges into itself by singleton blocks.
- If `y ≤ z`, a merging at bound `y` is a merging at bound `z`.
- Every merging conserves the total sum: `a.sum = b.sum`.
- If `y < 2`, every merging has `a = b`, without a positivity assumption
  on the entries: a nonempty block then has cardinality one.
- If `v ≤ b`, selecting its occurrence blocks and flattening them gives
  `u ≤ a` with `u.sum = v.sum`. Selection retains occurrences even when
  several output sums are equal.

**Checks.**

- `{1,1,2,2,2,3}` merges at bound `2` into `{1,1,2,3,4}`: combine two of
  the three `2`-occurrences and leave every other occurrence alone.
- The same input cannot merge at bound `2` into `{2,3,6}`: producing `6`
  would require either three copies of `2` or two copies of `3`; neither
  is available under that bound. Conservation of total sum alone fails this test.
- The empty multiset merges into itself at bound `1`, with an empty collection
  of blocks. In fact it does so at every real bound.
- `{1,1,2}` merges at bound `2` into `{2,2}`, which merges at bound `2`
  into `{4}`. The original multiset cannot merge into `{4}` even at bound `4`,
  since its only possible block would mix `1` and `2`. The relation is not
  transitive with multiplied bounds.
- At bound `3/2`, `{0,2}` can merge only into `{0,2}`: every nonempty
  occurrence block has cardinality one. At bound `2`, `{0,0}` can merge
  into `{0}`, with equal sums zero, showing why the API cutoff is strict
  and why conservation of sum is distinct from conservation of cardinality.

*Needs:* `Nat.Partition`, multisets with occurrence containment and sum.

### 0.2 Merged full cycle types

Define `MergePerms y ρ` on any finite carrier `Ω` as the set of `σ` for which
`EqualPartMerging y ρ.parts σ.fullCycleType`. The degree of `ρ` may be stated
independently of `card Ω`; membership forces them equal. The use of the full
cycle multiset retains the fixed points. (BSKK, §12.2 notation, p.61.)

Its API is as follows.

- Membership is equivalent to the displayed full-cycle merging relation.
- If `y ≤ z`, membership at bound `y` implies membership at bound `z`.
- Every member forces the degree equality `n = card Ω`.
- Conjugation `gσg⁻¹` preserves membership.
- Any equivalence `Ω ≃ Ω'` transports membership to the relabeled permutation.

Sum conservation and the full-cycle sum prove the degree statement; conjugacy
and transport of the full cycle type prove the two invariance statements.

**Checks.**

- The identity lies in `MergePerms 1 ρ` precisely when `ρ.parts` consists
  of `card Ω` copies of `1`. A cycle type omitting fixed points fails this test.
- Every full `5`-cycle lies in `MergePerms 1` of the one-part partition `{5}`.
- On the empty carrier the unique permutation lies in `MergePerms 1` of
  the empty partition; degree conservation still gives `0 = 0`.

*Needs:* 0.1 and the full-cycle sum, conjugacy, and relabeling contracts.

### 0.3 The bad-transitive set

Define `BadTransitive Ω` as the union of the underlying sets of subgroups
`G ≤ S_Ω` whose action is pretransitive and which satisfy `G ≠ A_Ω` and
`G ≠ S_Ω`. This is an existential union, not a subgroup declaration. An even
permutation can belong through a smaller transitive witness. (BSKK,
Equation (11.1), §11, p.54; Proposition 12.1, p.59.)

Its API is as follows.

- Membership is equivalent to existence of a transitive subgroup unequal
  to alternating and symmetric that contains the permutation.
- Every such subgroup is contained in the union.
- Conjugation preserves the union.
- Relabeling by any equivalence of finite carriers preserves the union.

For the latter two, transport the whole subgroup,
its action, and the alternating/symmetric comparisons, not just the permutation.

**Checks.**

- `BadTransitive (Fin n)` is empty for `n ≤ 3`: the transitive subgroups
  in those degrees are already alternating or symmetric.
- The identity on five points belongs to the union, using the regular cyclic
  subgroup `C₅`.
  Thus testing whether the permutation lies outside the alternating group
  would give the wrong predicate.
- Every full `5`-cycle belongs to the union, using its generated cyclic subgroup.
  The witness is transitive and has order `5`, distinct from `A₅` and `S₅`.

*Needs:* finite permutation subgroups and `IsPretransitive`. It is used
together with 0.2 in Layer 6.

### 0.4 Cycles above a cyclic quotient

Prove `equivariant_cycle_fibres`: let `X,Y` be finite, let `σ,ψ` be permutations,
and let `r : X → Y` be a surjection with `r(σx) = ψ(r x)`. Suppose
`ψ.fullCycleType = {d}`, `d > 0`, and every fibre has cardinality `m > 0`.
Then each cycle of `σ` has length `d·m_i` with `1 ≤ m_i ≤ m` and meets every
fibre in exactly `m_i` points, the `m_i` of the different cycles sum to `m`, and
consequently `σ.fullCycleType` is an `m`-merging of `m` copies of `d`.
The target assembles all return orbits into one occurrence-block witness,
beyond the supplied single-cycle formula.
(BSKK, Claim 11.4 and proof, §11.2, p.57.)

Use the supplied return-orbit identity on one fibre. The return orbits
partition that fibre, with positive sizes `m_i` summing to `m`. The supplied
period formula gives upstairs lengths `d m_i`, with `m_i ≤ m`, and the
equal-intersection statement gives `m_i` points of the cycle in every fibre.
One block of `m_i` copies of `d` per cycle is the occurrence-block witness;
divisibility of the individual cycle lengths alone would not give it.

*Needs:* 0.1–0.2 and the cycle-fibre supplier contract.

### Examples

For a one-point quotient and a two-point fibre, the identity upstairs has
full cycle type `{1,1}` and a swap has `{2}`. Both are `2`-mergings of
`{1,1}`. For a three-point bottom cycle and a two-point fibre, a return
identity gives `{3,3}`, whereas a return swap gives `{6}`. The fibre-cardinality
sum is `2` in both cases, fixing the direction of the merging relation.

### Dependencies

This layer uses the existing finite partition, permutation, subgroup, orbit,
and full-cycle APIs. It has no analytic or arithmetic distribution input.

## Layer 1: ramified Frobenius merging

### 1.1 Maximum factor multiplicity

For a polynomial `f` over a field define `maxFactorMultiplicity f` as the
supremum of the count function on the finset of `normalizedFactors f`.
The empty supremum is zero. This measures repeated irreducible factors, not
repeated degrees. For a nonzero nonunit it is also the greatest exponent
`m` for which some irreducible `q` satisfies `q^m ∣ f`.
(BSKK, Lemma 11.3, §11.2, p.56.)

Its API is as follows.

- The value at zero and at every unit is zero.
- The count of every proposed normalized factor is at most the maximum,
  including an absent factor, whose count is zero.
- The maximum is at most `m` iff each occurring normalized factor has count
  at most `m`.
- For `f ≠ 0` and `¬ IsUnit f`, value `1` is equivalent to `Squarefree f`.
  A unit is squarefree but has value zero, so the nonunit hypothesis is necessary.

**Checks.**

- The constant polynomial `1` over `F₂` has value `0`.
- The zero polynomial over `F₂` also has value `0`, by the chosen normalized-factor
  convention. It is never used as a monic positive-degree reduction.
- `(X+1)^3` over `F₂` has value `3`.
- The value is `1` for `X(X−1)` over `F₃`, although its factor-degree multiset
  is `{1,1}`. Maximizing degree counts would fail this example.

*Needs:* normalized UFD factors, their counts, and the reduction factor-degree convention.

### 1.2 Fibre size is root multiplicity

Prove the fibre-cardinality identity: for a commutative ring `R`, a field `K`,
a ring homomorphism `r : R →+* K`, a finite set `S ⊆ R`, and `z : K`,

```text
rootMultiplicity z (∏_{x ∈ S} (X − C(r x))) = #{x ∈ S : r x = z}.
```

No injectivity of `r` is required. Each linear factor contributes either one
or zero to the multiplicity, and all finite products are monic and nonzero.
Apply the multiplicity product theorem inductively. (BSKK, proof of Lemma 11.3,
fibre construction before Claim 11.4, pp.56–57.)

In the arithmetic application, if an irreducible factor `q` occurs with exponent
`m` in `A mod p`, each residue root of `q` has exactly `m` integral roots of
`A` above it. Finite-field irreducibles are separable, and distinct factors
have disjoint root sets. Factoring the mapped root product therefore identifies
its root multiplicity with the exponent of `q`.

*Needs:* the two root-multiplicity supplier declarations, integral roots of a
monic polynomial, and finite-field separability.

### 1.3 The specialization theorem

Prove `ramified_merging` for a monic `A : ℤ[X]` with `n = A.natDegree > 0`,
separable image in `ℚ[X]`, and any prime `p`. Set
`M = maxFactorMultiplicity (A mod p)`. There is an element of the polynomial
Galois group whose action on the `n` roots has full cycle type an `M`-merging
of `A.factorDegrees p`. No discriminant, squarefree reduction, or unramifiedness
condition is imposed. (BSKK, Lemma 11.3 and Claim 11.4, pp.56–57.)

The splitting field over `ℚ` is a finite Galois number field. Monicity makes
all roots integral. Choose a maximal ideal of its ring of integers over `(p)`
and reduce those roots into the residue field. The reduced root product splits
`A mod p`, and 1.2 counts each reduction fibre. Lift the residue arithmetic
Frobenius using the exact supplier theorem. Reduction is equivariant for this
lift. Over each irreducible factor's one Frobenius orbit, apply 0.4 with `d`
its degree and `m` its exponent. The factor contributes `m` occurrences of `d`,
and each occurrence block has cardinality at most `m ≤ M`. Combine these
witnesses over all distinct factors, then identify the automorphism with the
intrinsic polynomial Galois action. Separability identifies the distinct-root
cardinality with `n`; monicity preserves the reduction degree.

*Needs:* 0.4, 1.1–1.2, maximal-ideal lying over, arithmetic Frobenius existence,
finite-field factor orbits, and the faithful polynomial root action.

### Examples

Reduction `ℤ → F₂` on `S = {0,2}` has a fibre of size two at zero, and
its mapped root product is `X²`, of root multiplicity two. An injective-reduction
assumption would incorrectly exclude this model.

For `A = X²−2` and `p = 2`, the reduction is `X²`: the factor degrees are
`{1,1}` and `M = 2`. The characteristic-zero root action contains both the
identity type `{1,1}` and the swap type `{2}`, each a permitted `2`-merging.
This tests a prime dividing the discriminant. At squarefree reduction `M = 1`,
the conclusion forces equality of the two full multisets. The positive-degree
hypothesis ensures `M ≥ 1`; the constant polynomial `A = 1` is outside 1.3,
although its empty factor and cycle multisets are consistent with raw merging.

### Dependencies

Layer 0 and the named number-field, finite-field, polynomial-action, and
multiplicity contracts suffice. There is no coefficient measure or irreducibility
hypothesis in 1.3.

## Layer 2: ordered roots and higher irreducibility

### 2.1 The tuple-generated field and remaining-root quotient

For `f : F[X]` over any field, `L = f.SplittingField`, and an embedding
`x : Fin j ↪ f.rootSet L`, define `TupleRootField f x` to be
`IntermediateField.adjoin F (range x)`, using the underlying elements of `L`.
Define `tupleRootQuotient f x` over this field by mapping `f` and dividing by
`∏ i (X−x_i)`. Every `x_i` belongs to the adjoin, so the linear-factor product
has its stated coefficient field. It is monic; division is the existing
`divByMonic` operation. (BSKK, Introduction, definition of higher irreducibility
and its Galois interpretation, p.5; the field construction extends the simple-root
argument in the cited Tau Ceti stabilizer and quotient modules.)

The field API is the generated-field universal property, specialized from
the adjoin supplier.

- Every selected root lies in the tuple-generated field.
- For any intermediate field `E`, the tuple-generated field is contained
  in `E` iff every selected root belongs to `E`.
- Enlarging the set of selected roots enlarges the generated field;
  reordering the same roots leaves it unchanged.

For separable `f`, the quotient API is as follows.

- After mapping to `L`, the quotient times the selected linear-factor
  product equals `f` mapped to `L`.
- The quotient has degree `f.natDegree − j` and is separable.
- The quotient splits in `L` and its roots are exactly the roots of `f`
  outside the selected set.
- These conclusions need no monicity of `f`; removing all roots leaves
  the leading coefficient.

Distinctness and separability make the product an exact divisor.

**Checks for the field.**

- An empty tuple generates the base intermediate field `⊥`.
- A one-root tuple generates precisely `F⟮x₀⟯`, agreeing with the simple-root
  supplier, rather than the whole splitting field by definition.
- For `X²−2` over `ℚ`, a one-root tuple field has degree two.
  For `X(X−1)` over `ℚ`, selecting either rational root still generates the
  base field. Using a free formal extension instead of the actual adjoin fails
  this distinction.

**Checks for the quotient.**

- At `j = 0`, its image in `L[X]` is `f` mapped to `L`; the empty product is `1`.
- The quotient is `1` for monic separable `f` and a tuple of all
  `f.natDegree` roots. For the nonmonic split quadratic `2X(X−1)` over `ℚ`,
  the quotient is `2`, so the monicity hypothesis in this check is necessary.
- At `j = 1` it is division by `X−x₀` over the simple root field, agreeing
  under the field identification with the existing double-transitivity adapter.

*Needs:* intermediate-field adjoin, its inclusion and universal property,
polynomial mapping and monic division, and the simple-root stabilizer and quotient
contracts. The supplied `Polynomial.rootSet_divByMonic_X_sub_C`, applied over
the tuple field where every selected root lies, gives the root-set statement
one root at a time.

### 2.2 Higher irreducibility

Define `IsKFoldIrreducible f k` by requiring separability, positive degree `n`,
`1 ≤ k ≤ n`, and irreducibility of `tupleRootQuotient f x` for every `j < k`
and every embedding of `j` distinct roots. This includes ordinary irreducibility
at `j = 0`. It does not define the predicate by the group-theoretic conclusion.
(BSKK, Introduction, p.5; the explicit degree and separability guards specify
the extension to all polynomials.)

Its API is as follows.

- For separable positive-degree `f`, the value at `k = 1` is equivalent
  to ordinary `Irreducible f`.
- If `1 ≤ l ≤ k`, `k`-fold irreducibility implies `l`-fold irreducibility.
- The predicate implies `1 ≤ k ≤ f.natDegree`.

The empty-tuple field comparison proves the first, and restricting the tuple quantifier proves
monotonicity.

**Checks.**

- No polynomial is `0`-fold irreducible, including a separable linear polynomial.
  A vacuous universal quantifier would give the wrong answer.
- No polynomial is `k`-fold irreducible when `k` exceeds its degree.
- `Φ₁₁` over `ℚ` is `1`-fold but not `2`-fold irreducible. Its root group
  is the regular abelian group of order ten; a root already generates the
  splitting field, so the remaining degree-nine quotient is reducible there.
- `(X²−2)²` over `ℚ` is not `1`-fold irreducible. Its transitive distinct-root
  action does not remove the separability guard or repeated polynomial factor.

*Needs:* 2.1 and the separable positive-degree irreducibility/orbit contract.

### 2.3 Tuple stabilizers and restriction

For every field `F`, polynomial `f`, and root embedding
`x : Fin j ↪ f.rootSet L`, prove that the stabilizer of the embedding
under the componentwise `f.Gal` action equals `(TupleRootField f x).fixingSubgroup`.
No separability hypothesis is needed for this equality: fixing a tuple is fixing
all its generators. (BSKK, Introduction, p.5, interpreted through the
simple-root fixing-subgroup argument.)

For separable `f` and `j < n`, identify the action of this stabilizer on the
unselected roots with the action of the quotient's Galois group via a surjective
restriction. The quotient splits in `L`, and `L` is normal over the tuple field;
`L` need not be the quotient's minimal splitting field. This yields the
transitivity equivalence needed below. At `j = 0` the stabilizer is the whole
group; at `j = 1` the equality agrees with the simple-root theorem.

*Needs:* 2.1, the simple-root fixing-subgroup contract, Galois correspondence,
and `Polynomial.Gal.restrict_surjective` in a normal splitting extension.

### 2.4 The multiple-transitivity adapter

Prove `kfold_iff_multiplyPretransitive`: for separable `f` of positive degree
`n` over any field and `1 ≤ k ≤ n`,

```text
IsKFoldIrreducible f k ↔
IsMultiplyPretransitive f.Gal (f.rootSet f.SplittingField) k.
```

(BSKK, Introduction, p.5; the arbitrary-field formulation follows the same
normal-extension argument.) Use induction and the point-stabilizer recursion
on embeddings of `Fin k`. At a `j`-tuple with `j < k ≤ n`, its quotient has
positive degree `n−j`, is separable, and has precisely the complement roots.
Apply 2.3 and the irreducibility/orbit equivalence over the tuple-generated
field. The empty tuple supplies ordinary transitivity. At `k = 2`, identify
the result with the named one-root quotient supplier rather than giving it
independent mathematical ownership.

*Needs:* 2.1–2.3, irreducibility/orbit transitivity, and the embedding transport,
stabilizer recursion, and bounded monotonicity contracts for multiple transitivity.

### 2.5 Alternating recognition

Prove `kfold_degree_sub_two`: for separable `f` of degree `n ≥ 3`,
`IsKFoldIrreducible f (n−2)` iff its faithful root image contains the
alternating subgroup. Equivalently, the image is alternating or symmetric.
(BSKK, Introduction, p.5, the `n−2` recognition consequence.)

Separability gives exactly `n` roots, and `n ≥ 3` makes `n−2` an admissible
positive value. Apply 2.4 to the image action and the alternating-containment
recognition theorem. Conversely the alternating action is `(n−2)`-pretransitive,
and enlarging the acting group preserves that property. The alternating group
has index two for `n ≥ 3`, so no third containing subgroup occurs.

*Needs:* 2.4, faithful root image and cardinality, alternating multiple transitivity,
and its index-two subgroup property.

### Examples

For a separable cubic, 2.5 tests `k = 1`: irreducibility gives root image `C₃ = A₃`
or `S₃`. A reducible split cubic fails that test. In degree two the value `n−2`
is zero and the recognition target is deliberately not invoked. For `2X(X−1)`,
removing both roots gives the constant `2`, illustrating that quotient monicity
is a conclusion only when the original polynomial is monic.

### Dependencies

This layer uses only field theory, root actions, and the multiple-transitivity
contracts. It does not use ramified reduction or the partition probability law.

## Layer 3: anatomy of an arbitrary partition law

### 3.1 The three-premise law

For a measure `ν` on `Nat.Partition n`, define `PartitionLaw n ν C t κ δ`
as a proposition recording the common ranges on `C,t,κ,δ` and the following
three conditions. Probability normalization is a separate premise in applications.
(BSKK, Proposition 12.1(a)–(c), §12, p.59.)

For integers `2 ≤ k,l ≤ n/4`, require

```text
ν({ρ : {k,l} ≤ ρ.parts}) ≤ C/(kl).
```

The diagonal requires two occurrences. For integers
`n^(1−δ/2) ≤ k ≤ n/2`, require

```text
ν({ρ : ∃ U ≤ ρ.parts, U.sum = k}) ≤ C k^(−δ).
```

For every Boolean indicator `f : ℕ → Bool` and integer `1 ≤ m ≤ n/log n`,
put `harmonicMass f m = L = Σ_{1≤k≤m, f(k)=true} 1/k` and require

```text
ν({ρ : #{k-occurrences in ρ : k ≤ m, f(k)=true} ≤ tL}) ≤ C exp(−κL).
```

This last condition concerns the number of occurrences, not the sum of their
sizes. Define `harmonicMass` by this finite reciprocal sum, using only positive
indices. Its API is as follows.

- The zero indicator has mass zero for every cutoff.
- The singleton indicator of `a` has mass `1/a` when `1 ≤ a ≤ m`.
- Enlarging the indicator or the cutoff increases the mass, because every
  summand is nonnegative.

The law API is as follows.

- Within `2 ≤ k ≤ n/4`, the event `countρ(k) ≥ 2` has measure at most `C/k²`.
- Enlarging `C` to `D ≥ C` preserves the law: all right-hand factors
  multiplying these constants are nonnegative.
- Replacing `κ` by `0 < κ' ≤ κ` preserves the law, since `L ≥ 0`
  makes the exponential right side increase.

The discrete structure `partitionMeasurableSpace` has the usual API.

- Every subset is measurable.
- Every map from this partition space into a measurable space is measurable.
- Finite unions of the displayed anatomy events are measurable without
  additional hypotheses on the parameters.

**Checks for the measurable structure.**

- At degree zero there is one partition, the empty multiset; its two subsets
  are both measurable. An empty carrier would give the wrong count.
- At degree two the partitions are `{2}` and `{1,1}`; all four subsets
  are measurable, including the singleton `{ {2} }`.
- The indicator of the singleton `{ {2} }` on degree-two partitions takes
  values `1,0` and is measurable. A sigma algebra containing only the empty
  and whole sets would reject this map.

**Checks for the harmonic sum.**

- The zero indicator gives `0`, for every `m`, including `m = 0`.
- The indicator of `2` through `4` gives `1/2`, not `2` or `1`.
- The indicator constantly true through `2` gives `1 + 1/2 = 3/2`;
  this tests reciprocal weights and the inclusive upper endpoint. Excluding zero
  is a domain convention: total real inversion makes an added zero term
  numerically invisible.

**Checks for the law.**

- For the zero indicator and `m = 7` in range, the lower-tail event is
  the whole space, so the field gives `ν(univ) ≤ C`. With probability
  normalization this reads `1 ≤ C`.
- For the indicator of `2` and `m = 4` in range, the lower-tail field gives
  `ν(countρ(2) ≤ t/2) ≤ C exp(−κ/2)`.
- For `n ≥ 8`, the diagonal pair field gives
  `ν(countρ(2) ≥ 2) ≤ C/4`. A law that bounds mere membership of `2`
  does not encode the stated occurrence event.

*Needs:* the finite partition carrier, its discrete measurable structure, and
real-valued event measures.

### 3.2 Five good anatomy events

Define `GoodEvent i n t κ δ α`, indexed by `i : Fin 5`, as the following
sets `E₁,E₂,E₃,E₄,E₅*`. Counts and subsums preserve all occurrences.
(BSKK, Lemmas 12.2–12.6, pp.59–61; the four-witness variant is the
strengthening of Lemma 12.6 used in the block argument of Lemma 12.9, p.63.)

- `E₁`: every occurrence pair `{k,l} ≤ ρ.parts` with `k,l ≤ n/4`
  has `gcd(k,l) < n^(κα)`.
- `E₂`: no `U ≤ ρ.parts` has sum `nj/r`, for `r ∣ n`,
  `2 ≤ r ≤ n^(δ/2)`, and `1 ≤ j < r`.
- `E₃`: at least `(αt/2) log n` occurrences lie in
  `[n^(1−α), n/log n]`.
- `E₄`: at least `(t/4) log n` occurrences are parts `k ≤ √n/3`
  divisible by a prime `p > n^(1/8)`.
- `E₅*`: for every integer `r ≥ 2`, at least **four** occurrences in
  `[n^(1−2α), n/log n]` are not divisible by `r`.

These are definitions for arbitrary displayed parameters; the common ranges
are imposed by the theorems. In particular the exponent in `E₂` remains `δ/2`,
not a substituted function of `α`. The fifth event strengthens the one-witness
source event, with the same asymptotic failure rate as proved in 3.9.

The anatomy API is as follows.

- Under `E₁`, `n^(κα) ≤ k ≤ n/4` implies `countρ(k) ≤ 1`.
  Both cutoff inequalities are needed; an uncontrolled companion part
  cannot be used in this consequence.
- For every `U ≤ ρ.parts`, `(ρ.parts−U).sum = n−U.sum`,
  independently of the good events.
- Under `E₅*`, four nondivisible occurrences can be extracted for each `r ≥ 2`.

**Checks.**

- The partition `{2,2,4}` of eight fails `E₁` at `κ = 1, α = 0`,
  since `gcd(2,2) = 2 ≥ 8^0 = 1`.
- At `n = 1, α = 0` the unique partition passes `E₃`: its required
  count is zero because `log 1 = 0`. The asymptotic theorem is not asserted here.
- The partition `{1,2}` of three at `α = 1` passes the one-witness
  variant for every `r ≥ 2`: the part `1` lies in `[1/3,3/log 3]` and
  `r ∤ 1`. It fails `E₅*` because it has only two occurrences. Thus this
  check distinguishes four witnesses from one, even outside the asymptotic ranges.
- `{3,3}` at `n = 6, δ = 2` fails `E₂` with `r = 2, j = 1` and
  sum `3`. This tests the definition outside the probability-law parameter range.
- `{2,6}` of eight passes `E₁` at `κ = 1, α = 0`: its only part at most
  `8/4 = 2` occurs once, so no pair of occurrences is constrained. A definition
  that pairs a part with itself on mere membership would reject it.

*Needs:* partition occurrence counts and subsums. With 3.1 it feeds the estimates 3.5–3.9.

### 3.3 Uniform harmonic intervals

Prove the uniform harmonic-interval estimates: for every `ε > 0` there are `B ≥ 0`
and `N ≥ 3` such that for every `n ≥ N` and every
`ε/2 ≤ α ≤ 1/40`, the reciprocal mass of
`[n^(1−α),n/log n]` differs from `α log n−log log n` by at most `B`.
For every integer `2 ≤ r ≤ n^α`, the mass in
`[n^(1−2α),n/log n]` of integers not divisible by `r` differs from
`(1−1/r)(2α log n−log log n)` by at most the same `B`.
(BSKK, proofs of Lemmas 12.4 and 12.6, pp.60–61.)

Subtract the harmonic bounds at the inclusive integer cutoffs. Rounding moves
the logarithmic comparison by a bounded amount. The divisible terms are
`(1/r)` times a harmonic interval after putting `k = rj`.
Because `r ≤ n^α`, its lower endpoint is at least `n^(1−3α)`, which grows
uniformly throughout the parameter range. One error and threshold therefore
work for every `α,r`. An error chosen separately for each `θ` is insufficient.

*Needs:* the two harmonic/logarithm inequalities, positivity of `log n`,
and finite-sum interval subtraction.

### 3.4 Reciprocal mass with a large prime factor

Prove `nonsmooth_harmonic_mass`: there is `N ≥ 3` such that for every `n ≥ N`,

```text
Σ_{1≤k≤√n/3, ∃ prime p>n^(1/8), p∣k} 1/k ≥ (log n)/4.
```

(BSKK, proof of Lemma 12.5, pp.60–61.) The total mass through `√n/3`
is `(1/2) log n + O(1)`. The smooth integers' reciprocal mass, even without
a size cutoff, is the positive finite-prime Euler product
`∏_{p≤n^(1/8)}(1−1/p)⁻¹`. It bounds the removed smooth contribution.
By the exact Mertens supplier this is `(exp γ/8) log n + O(1)`, so the
remaining mass is bounded below by
`(1/2−exp γ/8) log n + O(1)`. Since `γ < 2/3 < log 2`, this coefficient
is strictly greater than `1/4`; enlarge `N` to absorb the bounded error.
The empty-prime-factor integer `1` belongs to the removed smooth contribution.

*Needs:* AnalyticNumberTheoryPartI §0.26's exact Mertens product contract, harmonic bounds, and the
Euler–Mascheroni constant inequality. This is the analytic supplier boundary
on which 3.8 and the final criterion depend.

### 3.5 Large-gcd failure

Prove the large-gcd failure bound with the common parameter ranges, a probability
measure `ν`, and `PartitionLaw n ν C t κ δ`. There are uniform `B ≥ 0,N ≥ 3`
such that

```text
ν(E₁ᶜ) ≤ B (log n)² n^(−κα),  α = δ/4−θ/2.
```

(BSKK, Lemma 12.2 and proof, pp.59–60.) For each possible divisor
`r ≥ n^(κα)`, sum pair occurrence events `{ri,rj}` for positive
`i,j ≤ n/(4r)`, including `i = j`. The threshold is eventually at least two,
so the exact lower pair cutoff is respected. Premise (a) gives `C/r²`
times two harmonic sums. Summing `r⁻²` from the threshold gives the asserted
power; the harmonic factors supply `(log n)²`. Uniform `κα ≥ κε/2 > 0`
fixes the starting degree before choosing `θ`.

*Needs:* 3.1–3.2, harmonic bounds, and the reciprocal-square tail estimate.

### 3.6 Block-fraction subsum failure

Prove the block-fraction subsum failure bound, with the same law and parameter
quantifiers, giving uniform `ν(E₂ᶜ) ≤ B n^(−δ/4)` for all `n ≥ N`.
(BSKK, Lemma 12.3 and proof, p.60.)

If a forbidden sum is `nj/r`, replace its occurrence submultiset by its
complement to arrange `j ≤ r/2`. Since `r ∣ n`, this is an integer; and
`r ≤ n^(δ/2)` puts it between `n^(1−δ/2)` and `n/2`, exactly premise (b)'s
range. For a fixed `r`, summing `C·(nj/r)^(−δ)` over `1 ≤ j ≤ r/2` gives
`O(C n^(−δ) r)`, using `δ < 1`. Summing over divisors `r` gives
`O(n^(−δ/2) τ(n))`. Invoke ErdosProgressionPowers §0.9, the eventual
divisor-subpower bound, with exponent `δ/4`, enlarging its constant over finitely many positive exceptions,
to reach `n^(−δ/4)`.

*Needs:* 3.1–3.2, the complement API, and the uniform divisor subpower contract.

### 3.7 Long-part lower-tail failure

Prove the long-part lower-tail failure bound, with the same uniform quantifiers,
giving `ν(E₃ᶜ) ≤ B (log n)^κ n^(−κα)`.
(BSKK, Lemma 12.4 and proof, p.60.)

Use premise (c) with the indicator of the long interval and
`m = floor(n/log n)`. Its harmonic mass is
`L = α log n−log log n + O(1)` by 3.3. Uniformly for `α ≥ ε/2`, the failure
threshold `(αt/2)log n` is at most `tL` when `n` is sufficiently large.
The event with count strictly below that threshold is contained in the
non-strict lower-tail event. Exponentiation produces `n^(−κα)` and
`(log n)^κ`, with a bounded error factor independent of `θ`.

*Needs:* 3.1–3.3 and inclusive integer cutoff conversion.

### 3.8 Large-prime part failure

Prove the large-prime part failure bound, with the same uniform quantifiers,
giving `ν(E₄ᶜ) ≤ B n^(−κ/4)`.
(BSKK, Lemma 12.5 and proof, pp.60–61.)

Take the indicator of integers with a prime factor exceeding `n^(1/8)` and
`m = floor(√n/3)`. For large `n`, `1 ≤ m ≤ n/log n`. By 3.4 its mass
is at least `(log n)/4`. The failed count is below `(t/4)log n ≤ tL`,
so premise (c) yields the bound. The constants can be chosen independently
of `θ`, which does not enter this event.

*Needs:* 3.1–3.2 and 3.4, including its exact analytic supplier.

### 3.9 Four nondivisible long parts

Prove `four_nondivisible_parts_failure`, with the same uniform quantifiers,
giving `ν((E₅*)ᶜ) ≤ B (log n)² n^(−κα)`.
This is the four-occurrence strengthening of BSKK Lemma 12.6 and its proof,
p.61, used in the strengthened version of Lemma 12.9, pp.62–63.

On `E₁ ∩ E₃`, choose at least five distinct long parts for a uniformly large
starting `n`. They lie below `n/4`, and above `n^(κα)`, so `E₁` makes them
unique. For `r ≥ n^(κα)`, at most one is divisible by `r`; the other four
already meet the fifth event. For `2 ≤ r ≤ n^(κα) ≤ n^α`, use the indicator
of `[n^(1−2α),n/log n]` not divisible by `r`. Its harmonic mass is

```text
L_r = (1−1/r)(2α log n−log log n) + O(1).
```

The event of fewer than four qualifying parts has count at most `3`.
Uniformly in this range `3 ≤ tL_r` for large `n`, so premise (c) bounds
its probability by `O((log n)^κ n^(−2κα(1−1/r)))`.
Split the union over `r` into `r = 2`, `3 ≤ r ≤ log n`, and
`log n < r ≤ n^(κα)`. The first has exponent `−κα`. In the second, the
exponent is at most `−4κα/3`, and the extra logarithm is absorbed using
`κα ≥ κε/2`. In the third, `n^(2κα/r)` is bounded, and the number of
integers is at most `n^(κα)`. Add the exceptional probabilities of `E₁`
and `E₃`. Replacing the one-witness threshold by four changes the required
starting degree, not the final rate.

*Needs:* 3.1–3.3, 3.5, and 3.7. No polynomial coefficient distribution enters.

### Examples

The indicators `0`, `1_{k=2}`, and `1` through two integers have harmonic
masses `0`, `1/2`, and `3/2`, respectively; these fix both the occurrence
count and reciprocal normalization. For the diagonal pair event in degree
eight, the partition `{2,2,4}` is included, while `{2,6}` is excluded.
For `E₂`, complementing the subsum `3` in `{3,3}` gives another sum `3`,
fixing the direction of the complement identity. At `θ = δ/2−ε`,
`α = ε/2`, so the long-part count still grows and eventually supplies five
witnesses. The restriction `ε > 0` is essential to that uniform assertion.

### Dependencies

The three fields of 3.1 suffice for the probabilistic arguments: (a) supplies
3.5, (b) supplies 3.6, and (c) supplies 3.7–3.8; 3.9 uses (a) and (c).
The external analytic inputs are ErdosProgressionPowers §0.9 for 3.6 and
AnalyticNumberTheoryPartI §0.26 for 3.4 and, through 3.4,
for 3.8.
The harmonic interval comparisons otherwise use the pinned harmonic inequalities.

## Layer 4: primitive minimum support

### 4.1 Minimum support, valued in `Option ℕ`

Define `minSupport G : Option ℕ` for `G ≤ S_Ω` to be `none` if no
nonidentity element exists, and otherwise `some m`, where `m` is the least
support cardinality among those elements. The carrier is finite, so the
nonempty minimum is attained. (BSKK, §12.2 notation, p.61, and Lemma 12.7,
p.62; the value `none` for the trivial group is this roadmap's convention.)

Its API is as follows.

- The value is `none` iff `G = ⊥`.
- The value is `some m` iff a nonidentity element has support exactly `m`
  and every nonidentity `σ ∈ G` satisfies `m ≤ card(support σ)`.
- This minimum lower bound applies to each nonidentity group element.
- Every returned `m` is at least two, since no permutation moves exactly
  one point. Including the identity in the minimum would make every value zero.

**Checks.**

- `S_(Fin 0)` has `minSupport = none`; its unique permutation is the identity.
- The value is `some 2` for
  `S_(Fin 2)`, attained by the swap.
- The value is `some 3` for
  `A_(Fin 3)`, attained by either nonidentity 3-cycle.

*Needs:* finite permutation subgroups, support, and the attained natural minimum.

### 4.2 Orbital distinguishers

Define `orbitalDistinguishers G x y` as the finset of points `z` for which
no `g ∈ G` both fixes `z` and sends `x` to `y`. Equivalently `(x,z)` and
`(y,z)` lie in different diagonal pair orbits, or `x,y` lie in different
orbits of the point stabilizer at `z`. There is no new coherent-configuration
carrier. (Babai, §6, Definition 6.1, p.5, and Exercise 6.2, p.6.)

Its API is as follows, without transitivity or primitivity hypotheses.

- A point belongs to the finset iff `x,y` lie in different orbits of its
  point stabilizer.
- Interchanging `x,y` leaves the finset unchanged, by inverse transport.
- For `g ∈ G`, `D(x,gx) ⊆ support g`: a point fixed by that very `g`
  cannot distinguish the pair.

**Checks.**

- `D(x,x)` is empty for every group, since the identity transports the pair.
- For the trivial group and `x ≠ y`, `D(x,y)` is the whole carrier.
- `D(x,y) = {x,y}` for the full symmetric group and `x ≠ y`. At every
  other point a swap of `x,y` fixes that point; at `x` or `y`, fixing the
  point prevents transport. This also holds on a two-point carrier.

*Needs:* existing finite orbits, point stabilizers, diagonal pair actions, and support.

### 4.3 Primitive orbital connectivity

Prove primitive orbital connectivity: for `IsPreprimitive G Ω`, a distinct pair
`x ≠ y`, and any `a,b`, there is a walk in the undirected relation joining
`u,v` whenever `(u,v)` or `(v,u)` is in the diagonal orbit of `(x,y)`.
Equivalently its reflexive transitive closure relates every `a,b`.
(Babai, §§3–4, Exercise 3.4 and Exercises 4.4–4.8, pp.4–5.)

Connected components are a `G`-invariant block partition. Primitivity allows
only singleton components or one whole component. The non-diagonal edge
excludes the first alternative, and pretransitivity transports this exclusion
to every vertex. Orbit transport also gives the constant valencies and
intersection counts used in 4.4: translating a vertex or an ordered pair
induces the required bijections of neighbor and incidence sets. This proof
infrastructure concerns the actual pair orbits and does not promise double
transitivity of a primitive action.

*Needs:* `IsPreprimitive`, blocks, and diagonal orbit transport.

### 4.4 Babai's support obstruction

Prove `babai_distinguishers`: if `G` is primitive but not
`2`-pretransitive, `n = card Ω ≥ 5`, and `x ≠ y`, then
`card D(x,y) ≥ √n/2`. Thus every nonidentity element has support at least
`√n/2`, by choosing a moved point and using 4.2.
(Babai, Theorem 6.6, p.6; its proof in §8, from Lemma 8.5 to
Corollary 8.19, pp.7–9, with the closing comparison at the top of p.10;
the hypothesis `n ≥ 5` is that of Lemma 8.7, p.7; Exercise 9.5 and
Corollary 9.6, p.10.)

Use the diagonal pair orbits as colors, with non-diagonal valencies `v_i`
and distinguisher numbers `D(i)`. These numbers are constant under transport.
For a noncomplete symmetrized orbital graph, its **complement** has diameter
two, by Lemma 8.5. Applying the regular diameter-two count to that complement
bounds `v_i` by `n−1−√(n−1)`. If the symmetrization is complete, the two
paired non-diagonal colors each have valency `(n−1)/2`; the uniprimitive
assumption excludes a single complete color. Counting triples gives the
average distinguisher number at least `n−v_max > √n`, where `v_max` is the
largest non-diagonal valency.

Along an orbital walk the endpoint distinguisher set is contained in the
union of the edge distinguisher sets: if all adjacent color comparisons at a
point agree, so does the endpoint comparison. A symmetrized orbital of diameter
two therefore has `D(i) ≥ D_average/2 > √n/2`.

For diameter at least three, take a shortest three-edge path. Its endpoint
neighbor sets are disjoint and distinguish the endpoints, so the path union
bound gives `D(i) ≥ 2v_i/3`. The second lower bound needs the full suborbit
count. Fix `z` and form a weighted graph on its stabilizer suborbits, including
`{z}`. Join two suborbits when a color-`i` or inverse-color edge joins them;
use the number of such undirected edges as weight. The original orbital graph
is connected, so this quotient graph is connected. Stabilizer transitivity
and incidence counting show that a nonzero weight is at least the larger
of the two suborbit cardinalities. Choose a spanning tree and orient it away
from `{z}`. Its total weight is at least `n−1`, as each other suborbit
contributes its cardinality along its incoming edge. Edges joining distinct
suborbits are distinguished by `z`. Each contributes at least one ordered
color-`i` pair, including when the orbital is self-paired. Counting the triples
of such ordered pairs and distinguishers gives
`n v_i D(i) ≥ n(n−1)`, hence `D(i) ≥ (n−1)/v_i`.

Multiplying this bound by `2v_i/3` gives
`D(i)² ≥ 2(n−1)/3 > n/4`. This finishes the large-diameter case.
The complement diameter-two assertion and the weighted spanning-tree argument
are both essential; an order or base-size bound would not replace this support
statement.

*Needs:* 4.2–4.3 and finite orbit-incidence counts. All divisions use positive
non-diagonal valencies; `n ≥ 5` also makes `n−1` positive.

### 4.5 Bochert's doubly transitive obstruction

Prove `bochert_minSupport`: if `G` is `2`-pretransitive, does not contain
`A_Ω`, and `n ≥ 38`, then `minSupport G = some m` implies `m ≥ n/4`.
(Schomburg, Theorem 3.1 and proof, §3, pp.4–5; Lemmas 2.3–2.5,
pp.3–4; commutator support inclusion (2.1), pp.1–2.)

Primitive transposition and 3-cycle recognition exclude `m ≤ 3`; the
nontrivial minimum is attained by `u`. The case `m = n` is immediate.
Otherwise choose a moved point `a` and `b = u(a)`. Conjugate `u` by `G_a`,
forming a nonempty conjugacy orbit `E`. Double transitivity makes `G_a`
transitive on the other `n−1` points. Invariant incidence counts give the
fraction `(n−m)/(n−1)` of elements of `E` fixing `b`, and the fraction
`(m−1)/(n−1)` moving any given point different from `a`. These are counts
of distinct conjugates, not unsupported independence assumptions.

Every conjugate `v` fixing `b` moves `a` and fails to commute with `u`:
`v(u(a)) = b`, whereas `u(v(a)) ≠ b`. Put
`Δ = support u ∩ support v`. The commutator support lies in
`Δ ∪ u(Δ) ∪ v(Δ)`, so minimality forces `|Δ| ≥ m/3`. Sum over the
conjugates fixing `b`. The upper incidence bound is their number plus
`(m−2)|E|(m−1)/(n−1)`: the intersection always contains `a`, excludes `b`,
and the remaining points have the stated movement proportion in all of `E`.
Using the fixing proportion and canceling the nonzero `|E|` gives

```text
n ≤ 4m + 6/(m−3).
```

For `n ≥ 38`, checking `4 ≤ m ≤ 9` in this inequality excludes that range,
so `m ≥ 10`. Now `6/(m−3) ≤ 6/7 < 1`. Since `n` and `4m` are integers,
`n ≤ 4m`, giving the result. The denominator `m−3` is positive before
cancellation; the nonempty fixing class follows from `m < n`.

*Needs:* 4.1, double transitivity, primitive recognition, and invariant finite
incidence counts. The `n ≥ 38` hypothesis is part of the stated target.

### 4.6 The primitive minimum theorem

Prove `primitive_minSupport`: if `G` is primitive, `n ≥ 5`,
`G ≠ A_Ω`, `G ≠ S_Ω`, and `minSupport G = some m`, then
`m ≥ (√n−1)/2`. (BSKK, Lemma 12.7, p.62; Bary-Soroker–Kozma,
Claim 1 and proof, §3.1, pp.9–10; the explicit two branches above supply
the support proofs.)

A subgroup containing `A_Ω` would be `A_Ω` or `S_Ω`, by index two,
so the hypotheses exclude containment. If the action is not doubly transitive,
apply 4.4. In the doubly transitive case with `n ≥ 38`, apply 4.5 and
compare `n/4` with `(√n−1)/2`. For `5 ≤ n < 38`, primitive recognition
excludes support two and three, giving `m ≥ 4`; this exceeds the required
square-root expression throughout that finite range. This branch does not
use Bochert outside the degree range of its source. Jordan's prime-cycle
theorem alone would not suffice: an element of small support need not be a
prime cycle, and its prime-order powers are in general products of several
prime cycles.

*Needs:* 4.1, 4.4–4.5, the alternating index-two property, and primitive
transposition/3-cycle recognition.

### Examples

The swap on two points has support two, and the 3-cycle on three points has
support three. They fix the support convention used in `minSupport`.
For a regular `C₅` action, every nonidentity element moves all five points,
and every distinct pair has all five points as distinguishers because the
point stabilizers are trivial. It satisfies Babai's lower bound.
The full symmetric group instead has `D(x,y) = {x,y}` for distinct points;
for sufficiently large degree this would violate the square-root bound, which
is why 4.4 explicitly excludes double transitivity. The trivial group has no
nonidentity minimum and is outside all the primitive degree-at-least-five cases.

### Dependencies

The layer uses finite permutation and orbital mathematics, the parent block
vocabulary, and the pinned primitive and multiple-transitivity recognition
interfaces. Neither number-field ramification nor an analytic estimate enters.

## Layer 5: cycle arithmetic and group exclusions

### 5.1 A cycle's actual block orbit

Prove the block-orbit cycle-divisibility statement for a surjective equivariant quotient
`b : X → Fin r` with all fibres of cardinality `s > 0`, where `r > 0`,
`σ` acts on `X` and `ψ` on the quotient. For each point cycle of length `ℓ`,
let `r'` be the cardinality of the actual `ψ`-orbit of its block.
The target goes beyond the supplied single-cycle formula by constructing the
union `U` of those blocks: it is `σ`-invariant of cardinality `r's`, and every
point cycle in `U` has length divisible by `r'`. Block orbits of any two point cycles are equal
or disjoint. (BSKK, Lemma 12.9, observation preceding the case split, p.62.)

Use the cycle-fibre supplier: `ℓ = r's'` with `1 ≤ r' ≤ r` and
`1 ≤ s' ≤ s`, where `s'` is the number of the cycle's points in each block
it meets; this number is the same for all of these blocks.
Every cycle in `U` projects onto the same block orbit, so the supplied
period divisibility applies with the same `r'`. The equal-or-disjoint assertion
is orbit equivalence on the blocks. The target includes singleton cycles:
if `σx = x`, the cycle length is `1`, although `cycleOf x` has empty support.
Thus the length expression is `card(support(cycleOf x)) + if σx=x then 1 else 0`.
An arbitrary divisor of `ℓ` would not suffice in place of the actual orbit size.

*Needs:* the parent Layer 1 imprimitivity quotient and the cycle-fibre supplier contract.

### 5.2 Proper primitive exclusion

Prove `primitive_exclusion` for `0 < t`, `0 < κ ≤ 1`, `0 < δ ≤ 1/10`,
`0 < ε < δ/2`. There is `N ≥ 3` independent of
`0 ≤ θ ≤ δ/2−ε` such that for every `n ≥ N` and partition
`ρ ∈ E₁ ∩ E₄`, `MergePerms (n^(1/8)) ρ` is disjoint from every primitive
subgroup distinct from `A_n` and `S_n`. The good events use
`α = δ/4−θ/2`. (BSKK, Lemma 12.8 and proof, p.62, with the cutoff
comparison in the direction displayed below.)

At most three original parts exceed `n/4`. Each has at most eight distinct
prime divisors greater than `n^(1/8)`, so there are at most 24 exceptional
large primes. `E₁` permits at most one small occurrence divisible by each
such prime, since

```text
n^(κα) ≤ n^(1/40) < n^(1/8) < p.
```

For large `n`, `E₄` supplies more than 24 distinct parts `k ≤ √n/3`
with a large prime factor. Choose one avoiding all exceptional primes.
Its chosen prime `p` divides no other original part: for large parts this
is the choice, and for small parts it follows from `E₁`. The chosen `k`
occurs exactly once and survives every permitted equal-part merging.
Every other output cycle has length `m l` with `m ≤ n^(1/8) < p` and
`p ∤ l`, hence is prime to `p`.

Let `a = v_p(k) ≥ 1` and let `q` be the prime-to-`p` part of the least
common multiple of all output cycle lengths. Raise the output permutation
to `p^(a−1) q`. All other cycles die. The `k`-cycle does not die, since its
order does not divide the exponent, and every one of its `k` points remains
moved. Thus this nonidentity group element has support exactly
`k ≤ √n/3 < (√n−1)/2` for `n > 9`, contradicting 4.6.
It need not be a single `p`-cycle. Since `θ ≤ 1/20 < 1/8`, monotonicity
also excludes `n^θ`-mergings.

*Needs:* 0.1–0.2, 3.2, 4.6, and the cycle-power fixed-point contract.

### 5.3 Transitive imprimitive exclusion

Prove `imprimitive_exclusion` with the same deterministic parameter ranges
and uniform threshold: if `ρ` lies in all five good events, then
`MergePerms (n^θ) ρ` is disjoint from every transitive imprimitive subgroup
of `S_n`. The proof does not use `E₄`.
(BSKK, Lemma 12.9, pp.62–63; the argument below uses five middle-range
witnesses and four large-range witnesses so that every companion part invoked
in `E₁` is within its specified cutoff.)

Suppose an output permutation `σ` preserves `r` equal blocks of size `s`,
with `r,s > 1` and `n = rs`. For uniformly large `n`, the long intervals
lie below `n/log n ≤ n/4` and above `n^(κα)`. Every selected long part
is therefore unique by `E₁` and survives merging unchanged.

If `2 ≤ r ≤ n^(δ/2)`, choose via `E₅*` a long part `ℓ` not divisible
by `r`. Its block orbit has `1 ≤ r' < r`, since otherwise `r ∣ ℓ` by 5.1.
The union of these blocks is invariant of cardinality `nr'/r`. Its cycle
lengths form a submultiset of the output; pull it back through
the occurrence-selection API of 0.1 to a submultiset `V ≤ ρ.parts` with
`Σ_{v∈V} v = nr'/r`. This contradicts `E₂`. The identity sums the part
sizes in `V`; it does not count occurrences.

If `n^(δ/2) < r < n^(1−α)`, choose **five** distinct parts supplied by `E₃`.
For each selected cycle, 5.1 gives

```text
r' ≥ ℓ/s > n^(δ/2−α) ≥ n^(κα).
```

The last comparison holds because `δ/2−α = δ/4+θ/2 ≥ α ≥ κα`; it is an
equality when `θ = 0` and `κ = 1`, so the strict inequality comes from
`r > n^(δ/2)` in the middle step.

Two selected cycles cannot have the same block orbit, since their lengths
would have gcd at least `r'`, contradicting `E₁`. Their block unions are
therefore disjoint. At most one selected cycle fills its block union:
a filled union has `s ∣ ℓ`, while `s > n^α ≥ n^(κα)`, so two such
lengths would again violate `E₁`. A permutation has at most three cycles
longer than `n/4`. Among the five disjoint block unions choose one which
is not filled and contains no such long cycle. It contains a companion output
cycle of length `mk ≤ n/4`, with `k` an original part and `m ≤ n^θ`.
Since `r' ∣ mk` and `r' ∣ ℓ`,

```text
gcd(k,ℓ) ≥ r'/m > n^(δ/2−α−θ) = n^α ≥ n^(κα).
```

Both `k ≤ n/4` and `ℓ ≤ n/4` hold. The pair consists of actual occurrences;
uniqueness of the selected `ℓ` prevents the companion cycle from reusing it.
Thus `E₁` applies and gives the contradiction.

If `n^(1−α) ≤ r < n`, then `s ≥ 2`. Choose **four** long parts from `E₅*`
not divisible by `s`. None fills its block union. Their actual block orbits
have `r' > n^(1−3α)`: writing `ℓ = r's'`, non-filling gives `s' < s`,
so `r' = ℓ/s' > ℓ/s ≥ n^(1−3α)`. `E₁` again makes those unions disjoint.
At most three unions contain an output cycle longer than `n/4`, so the fourth
has a companion `mk ≤ n/4`. Now

```text
gcd(k,ℓ) ≥ r'/m > n^(1−3α−θ) ≥ n^(κα).
```

The last comparison follows from `α ≤ 1/40`, `θ ≤ 1/20`, and `κ ≤ 1`.
Both original parts are in the small-part range of `E₁`, giving the final
contradiction. This choice of short companions is why the four-witness event
and five middle-range cycles are retained.

*Needs:* 0.1–0.2, 3.2, 5.1, and the parent Layer 1 equal-block quotient.

### Examples

With two blocks of three points, a swap within one block has a point cycle
of length `2`, projected block-orbit size `1`, and two points of that cycle
in its block. A permutation interchanging corresponding points in the two
blocks has a cycle of length `2` with projected size `2` and one point in
each block. Equal cycle lengths alone do not specify the projected orbit.
A fixed point has `r' = s' = 1`, testing the support correction in 5.1.

In the middle-range counting step, discarding one filled block union and
three unions containing long cycles leaves one of five available unions.
In the largest range none is filled, so discarding three leaves one of four.
Choosing only one unrestricted companion would not justify the `k ≤ n/4`
hypothesis of `E₁`.

**Check.** At `n = 2^400`, `α = 1/40`, `r = 2^390`, and `s = 2^10`,
a cycle of length `ℓ = 2^380` filling its block union has
`r' = 2^370 = n^(1−3α)`. This shows that the strict inequality in the largest
range uses non-filling, rather than the block-count endpoint alone. Such a
cycle is excluded from the chosen witnesses because `s ∣ ℓ`.

### Dependencies

Primitive exclusion uses only `E₁,E₄` and Layer 4's support bound.
Imprimitive exclusion uses `E₁,E₂,E₃,E₅*`, Layer 0's occurrence pullback,
and the imported equal-block grid. These are deterministic statements;
no assumption that the partition arose from a polynomial or probability law
is used here.

## Layer 6: the arbitrary-law criterion and arithmetic certificate

### 6.1 Uniform generalized Łuczak–Pyber criterion

Prove `generalized_luczak_pyber`: fix the common ranges on
`C,t,κ,δ,ε`. There are `B ≥ 0,N ≥ 3` such that for every `n ≥ N`,
every probability measure `ν` on partitions of `n` satisfying
`PartitionLaw n ν C t κ δ`, and every `0 ≤ θ ≤ δ/2−ε`,

```text
ν({ρ : ∃ σ ∈ BadTransitive (Fin n), σ ∈ MergePerms (n^θ) ρ})
  ≤ B (log n)² n^(−κ(δ/4−θ/2)).
```

`B,N` depend only on the fixed five parameters, not on `ν,θ` or `n`.
(BSKK, Proposition 12.1, p.59, and proof, p.63, with the four-witness
version of the imprimitive exclusion.)

On the intersection of the five good events, 5.2 and 5.3 exclude any
bad-transitive witness subgroup, whether primitive or imprimitive. The bad
partition event is therefore contained in the union of the five complements.
All sets are measurable on the finite discrete partition space. Apply
3.5–3.9. Since `κα ≤ δ/4` and `κα ≤ κ/4`, both the subsum and
large-prime rates are at least as strong as `n^(−κα)`; and because
`κ ≤ 1`, the long-part logarithm is absorbed by `(log n)²` after
increasing `N`. Sum the five constants and take the maximum of their uniform
thresholds and the deterministic thresholds. The positive lower bound
`α ≥ ε/2` preserves uniformity at the top endpoint of `θ`.

*Needs:* 0.2–0.3, 3.1–3.9, and 5.2–5.3. In particular the exact Mertens
supplier enters through 3.4 and is not replaced by a generic Euler-product bound.

### 6.2 A polynomial bad-group certificate

Prove `galois_merging_certificate`: let `A : ℤ[X]` be monic with
irreducible image over `ℚ` (hence separable), and let `p` be prime. Suppose the faithful
root-action image is neither alternating nor symmetric, and
`maxFactorMultiplicity (A mod p) ≤ y` for `y : ℝ`. Then there is a
permutation in that image whose full cycle type is a `y`-merging of
`A.factorDegrees p` and which belongs to `BadTransitive` on the root carrier.
(BSKK, Lemma 11.3, pp.56–57, and §11.3, reduction following (11.2),
pp.57–58; the partition endpoint is Proposition 12.1.)

Irreducibility gives positive degree and transitivity, with separability making
the distinct-root cardinality equal to that degree. Apply 1.3 and increase
the merging bound from `M` to `y` by monotonicity. The image subgroup is
itself a permitted witness in `BadTransitive`. Transport its roots to `Fin n`
using 0.2–0.3's relabeling APIs, preserving both the full cycle type and the
alternating/symmetric subgroup comparisons.

For any coefficient probability space whose sampled polynomials satisfy these
monic and irreducible conditions and have fixed degree `n`, this gives
the pointwise event inclusion

```text
{bad root group} ⊆ {M > y} ∪ {bad partition at merging bound y}.
```

With a uniform choice `y = n^θ`, a consumer can combine a repeated-factor
tail estimate with 6.1 for the induced partition law. If monicity or
irreducibility is not imposed on every sample, include its failure event.
Separability follows from irreducibility over `ℚ`. This target supplies the deterministic inclusion, not the
coefficient-law estimates or their conditioning behavior.

*Needs:* 1.3, 0.1–0.3, the faithful root-action and irreducibility/orbit
contracts, and full-cycle relabeling. The deterministic certificate does not
need 6.1; using it for a probability estimate additionally needs 6.1 and
measurability of the consumer's coefficient events.

### Examples

At `θ = 0`, the merging bound is `1`, so only the original full cycle type
is allowed. At `θ = δ/2−ε`, the final exponent is `−κε/2 < 0`.
The criterion still decays uniformly at that endpoint. For a reducible repeated
polynomial such as `(X²−2)²`, transitivity on its distinct roots does not meet
the arithmetic certificate's irreducibility premise.
At a ramified prime, the certificate still uses the Frobenius lift; it never
adds squarefree reduction as an unstated assumption.

### Dependencies

The measure theorem depends on the partition anatomy and deterministic group
exclusions. The arithmetic certificate depends on ramified merging and root
transitivity. Higher irreducibility supplies a separate polynomial-facing
recognition interface; it is not required by the arbitrary partition law.

## Downstream consumers

A continuation of ArithmeticStatistics for random polynomials would use the
certificate and uniform partition theorem after establishing the three partition-law premises and
repeated-factor tails. Quantitative irreducibility provides the transitive
root-group input, and the tuple interface expresses stronger polynomial
irreducibility conclusions without changing the probability theorem's premises.
Any other finite partition model satisfying the same three bounds can use 6.1
directly. The criterion recognizes alternating or symmetric image; separating
the two requires an additional invariant such as the discriminant in the
parent polynomial roadmap.

## References

Page locators refer to the following public versions, rather than the journal
pagination. Statements and proof routes above use the roadmap's own notation.

- **Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma (BSKK)**,
  [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3),
  arXiv:2007.14567v3, June 2023, 65 pages; published in *Inventiones
  Mathematicae* 233 (2023), 1041–1120,
  [DOI 10.1007/s00222-023-01193-6](https://doi.org/10.1007/s00222-023-01193-6).
  Introduction pp.4–5; §11, Equation (11.1), p.54; §11.2,
  Definition 11.2, Lemma 11.3 and Claim 11.4, pp.56–57; §11.3,
  pp.57–58; §12, Proposition 12.1 and Lemmas 12.2–12.9, pp.59–63.
- **László Babai, original lecture scribe Tom Hayes**,
  [Primitive coherent configurations and the order of uniprimitive permutation groups](http://people.cs.uchicago.edu/~laci/papers/uni-update.pdf),
  author exposition of October 21, 2018. §§2–4, pp.3–5;
  Definition 6.1, Exercise 6.2 and Theorem 6.6, pp.5–6;
  Lemmas 8.5–8.18 and Corollary 8.19, pp.7–9;
  Exercise 9.5 and Corollary 9.6, p.10.
- **Bernd Schomburg**,
  [Bochert's results on the minimal degree of multiply transitive permutation groups](https://arxiv.org/pdf/2209.12049v1),
  arXiv:2209.12049v1, September 24, 2022. §2, commutator inclusion (2.1)
  and Lemmas 2.3–2.5, pp.1–4; §3, Theorem 3.1 and proof, pp.4–5.
- **Lior Bary-Soroker, Gady Kozma**,
  [Irreducible polynomials of bounded height](https://arxiv.org/pdf/1710.05165v2),
  arXiv:1710.05165v2, August 8, 2019; published in *Duke Mathematical
  Journal* 169 (2020), 579–598. §3.1, Claim 1 and proof, pp.9–10.
