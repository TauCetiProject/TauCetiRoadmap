# Roadmap: Bhargava's mass formula for étale algebras over a local field

The [mass formula roadmap](../MassFormula/README.md) counts the totally ramified extensions of a
non-archimedean local field `K`: Serre's formula `∑_{L ∈ σ_K(n)} q^{-c(L)} = n`. This roadmap
removes the restriction to total ramification, and to fields. Its summit is the mass formula of
[Bhargava 2007, Thm. 1.1]: summed over the isomorphism classes of étale `K`-algebras `A` of degree
`n`, `∑_{[A]} 1/(#Aut_K(A) · q^{v(Disc A)}) = ∑_{k=0}^{n−1} q(k, n − k) · q^{−k}`, where `q` is the
residue cardinality, `v(Disc A)` the valuation in `K` of the discriminant of `A`, and `q(k, m)` the
number of partitions of `k` into at most `m` parts. Together with its refinements by splitting type
and by ramification partition, it is the local input to Bhargava's heuristics for the density of
number-field discriminants, and nothing like it is upstream.

The proof is Serre's formula applied over each unramified extension `K_f` and assembled by
combinatorics: the transitive pieces come from Serre over `K_f`, and the étale algebras are
products of transitive pieces. The roadmap's own material is the model of étale algebras as
**Galois sets** (finite sets with a continuous action of `Gal(K^sep/K)`), the decomposition of an
extension by its unramified part, and the counting that turns Serre's formula into Bhargava's.

Suggested home: `TauCeti/NumberTheory/LocalField/EtaleMassFormula/`.

## Scope and ownership

This roadmap owns the **mass of étale algebras over a non-archimedean local field**: Galois sets
and their discriminant weight; the bridges from Galois sets to étale algebras and to subextensions
of `SeparableClosure K`; the classification of finite extensions by their unramified part, with its
automorphism count; the transitive mass by residue degree; and Bhargava's mass formulas by
splitting type, by ramification partition, and in total.

It does not own:

- **Serre's mass formula**, the wild exponent, `σ_K(n)` and its orbit count: the
  [mass formula roadmap](../MassFormula/README.md).
- **Unramified extensions, residue degree, ramification index, the discriminant exponent and its
  tower law**: the
  [local fields and ramification roadmap](../../Completed/LocalFieldsRamification/README.md),
  implemented in Tau Ceti.
- **Krasner's count of totally ramified extensions by discriminant, Monge's count by ramification
  polygon, and the families of Hou–Keating and Sinclair**: the `p`-adic extension families roadmap
  (PadicExtensionFamilies).
- **Density conjectures and theorems for number-field discriminants**, Bhargava's `n ≤ 5` counts,
  and the archimedean mass: the arithmetic statistics roadmaps (ArithmeticStatistics and
  ArithmeticStatisticsPartI to ArithmeticStatisticsPartV).
- **Archimedean local fields**, which `IsNonarchimedeanLocalField` excludes, and **Galois sets with
  values in a subgroup of `Equiv.Perm (Fin n)` weighted by a general Artin conductor**, named under
  *Long horizon*.

## Conventions

- **The base field.** `K` carries
  `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`, the binders of
  Tau Ceti's local-field API, spelled out. The residue cardinality is written inline as
  `Nat.card 𝓀[K]`; `q` abbreviates it in prose only. A weight `q^{−k}` is
  `1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ k`.
- **The Galois group is `SeparableClosure K ≃ₐ[K] SeparableClosure K`** with Mathlib's
  `krullTopology`, not `Field.absoluteGaloisGroup K`, which is the automorphism group of
  `AlgebraicClosure K`: fixed fields must be subextensions of `SeparableClosure K`, where the
  invariants below live and inseparable extensions are excluded by construction.
- **The carrier is a Galois set.** A Galois set of size `n` is a homomorphism
  `ρ : Gal(K^sep/K) →* Equiv.Perm (Fin n)` with open kernel (`GaloisSet K n`). It is the carrier of
  every mass statement: the étale algebras are its isomorphism classes, and `1/n!` times a sum over
  Galois sets is the sum over classes weighted by `1/#Aut` (§0.4). Do not state the mass formulas
  over a quotient type of étale algebras.
- **Invariants of subextensions are totalized.** For `L : IntermediateField K (SeparableClosure K)`,
  `intermediateFieldDiscriminantExponent L` and `intermediateFieldInertiaDegree L` are
  `TauCeti.discriminantExponent K L` and `TauCeti.inertiaDegree K L` for the local-field structure
  of the `TauCeti.finiteIntermediateField*` adapters when `L / K` is finite, and `0` otherwise. The
  first is Tau Ceti's `IntermediateField.discriminantExponent`; the second goes beside it as
  `IntermediateField.inertiaDegree`.
- **Sums are in `ℝ≥0∞`.** In equal characteristic `p` there are infinitely many Galois sets of size
  `n ≥ p`, so every mass is a `∑'` valued in `ℝ≥0∞`, and equality with a finite value encodes
  convergence.
- **Splitting symbols are `Multiset (ℕ × ℕ)`**, a pair `(f, e)` per orbit; partitions are Mathlib's
  `Nat.Partition`.

## Exact supplier contracts

### From [MassFormula, layer 4 the mass formulas](../MassFormula/README.md#layer-4-the-mass-formulas)

- **Serre's Theorem 1**, `∑_{L ∈ σ_K(n)} q^{−c(L)} = n` in `ℝ≥0∞` for every non-archimedean local
  field and `0 < n`; Lean form `MassFormula.tsum_one_div_natCard_residueField_pow_wildExponent`.
  Applied in §2.1 to each unramified extension `K_f`.
- **The orbit count** for `σ_K(n)`, `MassFormula.ncard_isomorphic_mul_natCard_algEquiv`, which
  §1.3 generalizes to every finite subextension.
- **The discriminant exponent of a subextension** and its invariance under `K`-isomorphism
  (MassFormula Layer 0).

On Tau Ceti `main`, beyond the pinned revision, these are `TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent`
(`MassFormula/Main.lean`), `TauCeti.ncard_isomorphic_mul_natCard_algEquiv` (`MassFormula/Orbit.lean`),
`IntermediateField.discriminantExponent` and `IntermediateField.discriminantExponent_eq_of_algEquiv`
(`MassFormula/Basic.lean`). Consume them by those names. At the pin, `Suggested.lean` defines
`intermediateFieldDiscriminantExponent` with the body of the Tau Ceti declaration and cites
Theorem 1 from the README.

### From [LocalFieldsRamification, layer 2 unramified extensions and Frobenius](../../Completed/LocalFieldsRamification/README.md), implemented in Tau Ceti

- **Unramified extensions**: `TauCeti.unramifiedExtension K Ω f`, the unique unramified
  subextension of degree `f ≥ 1` of a separably closed `Ω` (`TauCeti.existsUnique_isUnramified_finrank_eq`,
  `Unramified/Existence.lean`), Galois over `K` (`TauCeti.isGalois_unramifiedExtension`); and
  `TauCeti.maximalUnramifiedExtension K Ω` with `IntermediateField.le_maximalUnramifiedExtension_iff`
  (`Unramified/Maximal.lean`).
- **The unramified–totally ramified factorization**: `TauCeti.eq_unramifiedExtension_inertiaDegree_iff`,
  `TauCeti.isTotallyRamified_unramifiedExtension_inertiaDegree` and
  `TauCeti.finrank_unramifiedExtension_inertiaDegree_eq_ramificationIndex`
  (`Unramified/Factorization.lean`).
- **The discriminant tower law** `δ(M/K) = [M:L] δ(L/K) + f(L/K) δ(M/L)` for a separable tower:
  `TauCeti.discriminantExponent_tower` (`Discriminant/Tower.lean`); its vanishing on unramified
  extensions, `TauCeti.discriminantExponent_eq_zero_iff`; and its invariance,
  `TauCeti.discriminantExponent_eq_of_algEquiv` (`Discriminant/Basic.lean`).
- **Residue degree**: `TauCeti.inertiaDegree` with `TauCeti.ramificationIndex_mul_inertiaDegree`
  (`InertiaDegree.lean`).
- **The structure adapters** `TauCeti.finiteIntermediateFieldValuativeRel`,
  `TauCeti.finiteIntermediateFieldTopology`, `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`
  and `TauCeti.finiteIntermediateField_valuativeExtension` (`FiniteExtension/IntermediateField.lean`).

### From Mathlib

- **Galois theory of `SeparableClosure K`**: `krullTopology`, `IntermediateField.fixedField`,
  `IntermediateField.fixingSubgroup` and the infinite Galois correspondence
  (`Mathlib/FieldTheory/KrullTopology.lean`, `Mathlib/FieldTheory/Galois/Infinite.lean`);
  `IsSepClosure` and `IsSepClosure.equiv`; `IntermediateField.extendScalars`.
- **Group actions**: `MulAction.orbitRel.Quotient`, `MulAction.stabilizer`,
  `MulAction.index_stabilizer` (orbit–stabilizer for an infinite group), `MulAction.compHom`.
- **Étale algebras over a field**: `Algebra.Etale`, and
  `Algebra.FormallyEtale.iff_exists_algEquiv_prod` (`Mathlib/RingTheory/Etale/Field.lean`): an
  étale algebra is a finite product of finite separable field extensions.
- **Permutations and partitions**: `Equiv.Perm.cycleType`, `Equiv.Perm.card_of_cycleType`
  (`Mathlib/GroupTheory/Perm/Centralizer.lean`), and `Nat.Partition`
  (`Mathlib/Combinatorics/Enumerative/Partition/Basic.lean`).

## How to read the build

Layer 0 builds the carrier: Galois sets, their weight, the mass, and the two bridges, to
subextensions of `SeparableClosure K` and to étale algebras. Layer 1 classifies finite extensions
by their unramified part and supplies the subfield form and the orbit count Layer 2 needs. Layer 2
computes the transitive mass by residue degree from Serre's formula over `K_f`. Layer 3 assembles
Bhargava's formulas. A target's `*Needs:*` line names the earlier subsections, supplier contracts
and library declarations it rests on. `Suggested.lean` states the definitions and the headline
theorems of every layer; the classification of §1.1 and the transport of §2.1 are README only.

## Layer 0: Galois sets, their weight, and the mass

### 0.1 the orbit weight

For a set `X` with an action of `Gal(K^sep/K)`, `orbitDiscriminantExponent K X` is the sum, over the
orbits, of `intermediateFieldDiscriminantExponent` of the fixed field of the stabilizer of a point of
the orbit, defined with `∑ᶠ` over `MulAction.orbitRel.Quotient` and `Quotient.out`. The choice of
point does not matter: the fixed field of the stabilizer of `σ • x` is the image of that of `x`
under `σ`, hence `K`-isomorphic to it
(`intermediateFieldDiscriminantExponent_fixedField_stabilizer_smul`). *Needs:* the MassFormula
contract (invariance under `K`-isomorphism); Mathlib `IntermediateField.fixedField`,
`MulAction.stabilizer`.

**Checks.**

- The one-point set with the trivial action has weight `0`: the stabilizer is everything and its
  fixed field is `⊥`.
- For `X = Gal(K^sep/K)/H` with `H` the fixing subgroup of `ℚ_2(i)` over `K = ℚ_2`, the weight is
  `2`, the discriminant exponent of `ℚ_2(i)`.
- A disjoint union of two actions has the sum of the weights.

### 0.2 Galois sets

`GaloisSet K n` is the subtype of homomorphisms `Gal(K^sep/K) →* Equiv.Perm (Fin n)` with open
kernel; `GaloisSet.mulAction` is its action through `MulAction.compHom`,
`GaloisSet.discriminantExponent` its weight, and `GaloisSet.IsTransitive` transitivity. For a Galois
set the stabilizers contain the kernel, so they are open, their fixed fields are finite over `K`,
and the degree is the orbit size (`GaloisSet.finrank_fixedField_stabilizer`, by the Galois
correspondence and `MulAction.index_stabilizer`). *Needs:* 0.1; Mathlib `krullTopology`,
`Mathlib/FieldTheory/Galois/Infinite.lean`.

**Checks.**

- `GaloisSet K 0` has exactly one element, of weight `0`.
- The trivial homomorphism to `Equiv.Perm (Fin n)` is a Galois set with `n` orbits, each with
  fixed field `⊥`; weight `0`.
- A homomorphism onto `Equiv.Perm (Fin 2)` with kernel the fixing subgroup of `ℚ_2(i)` is a
  transitive Galois set of weight `2`; its stabilizers have fixed field `ℚ_2(i)`, of degree `2`.

### 0.3 the étale mass and the transitive bridge

The étale mass is `M_n(K) = (1/n!) ∑_ρ q^{−d(ρ)}` over `GaloisSet K n` (`etaleMass`). **The
transitive bridge** (`tsum_isTransitive`): for `n ≥ 1`, the transitive Galois sets with stabilizer
`H` of `0` correspond to the bijections `G/H ≅ Fin n` sending `H` to `0`, of which there are
`(n − 1)!`, and the open subgroups of index `n` correspond to the subextensions of degree `n`
through `fixedField`; so the transitive Galois sets weigh `(n − 1)!` times
`∑_{[L:K] = n} q^{−d(L)}`, summed over subextensions of `SeparableClosure K`. *Needs:* 0.2.

**Checks.**

- `M_0(K) = 1`, from the single Galois set of size `0`.
- `n = 1`: one Galois set, `1 = 0! · 1`.
- `n = 2`, `K = ℚ_2`: each quadratic subextension carries `1! = 1` labelling, so the transitive
  side is `1 + 2 · 2^{−2} + 4 · 2^{−3} = 2`, from `ℚ_4` and the six ramified quadratic fields.

### 0.4 the bridge to étale algebras

`homMulAction` is the action of `Gal(K^sep/K)` by composition on `A →ₐ[K] SeparableClosure K`, and
`etaleDiscriminantExponent K A` its weight. For a finite product of finite subextensions the weight
is the sum of their discriminant exponents (`etaleDiscriminantExponent_pi`): a map from a product of
fields to a field factors through one projection, so the orbits are indexed by the factors, and the
stabilizer of the `i`-th projection followed by the inclusion is the fixing subgroup of the `i`-th
factor. **Bhargava's left-hand side is the étale mass** (`tsum_etaleDiscriminantExponent`): for any
family of étale algebras of degree `n` with exactly one member in each `K`-isomorphism class,
`∑ 1/(#Aut_K(A) · q^{d(A)}) = M_n(K)`. `Equiv.Perm (Fin n)` acts on Galois sets by conjugation
without changing the weight; `A ↦ (A →ₐ[K] K^sep)` with a labelling of its `n` points is a bijection
from isomorphism classes with labellings onto Galois sets, by
`Algebra.FormallyEtale.iff_exists_algEquiv_prod` and the Galois correspondence; so the orbits are
the isomorphism classes, the stabilizer of a Galois set is `Aut_K(A)`, and orbit–stabilizer gives
`n!/#Aut_K(A)` Galois sets per class. *Needs:* 0.1–0.3; Mathlib
`Algebra.FormallyEtale.iff_exists_algEquiv_prod`.

**Checks.**

- The empty product (the zero algebra) has weight `0`, and for `n = 0` both sides are `1`.
- `ℚ_2(i) × ℚ_2` has orbits of sizes `2` and `1` with fixed fields `ℚ_2(i)` and `ℚ_2`: weight
  `2 + 0 = 2`.
- `n = 2`, `K = ℚ_2`: `K × K` contributes `1/2`, `ℚ_4` contributes `1/2`, the six ramified fields
  `(2 · 2^{−2} + 4 · 2^{−3})/2 = 1/2`; total `3/2 = M_2(ℚ_2)`.

### Dependencies

The MassFormula contract (invariance of the discriminant exponent); Mathlib's infinite Galois
theory, group actions and étale algebras over a field.

## Layer 1: extensions by their unramified part

### 1.1 the classification

Fix `n ≥ 1` and `f ∣ n`, and let `K_f` be the unramified extension of `K` of degree `f`, unique up
to `K`-isomorphism and Galois with `Gal(K_f/K) ≅ ℤ/f` generated by Frobenius. Write `𝒯(K_f, n/f)`
for the set of `K_f`-isomorphism classes of totally ramified extensions of `K_f` of degree `n/f`;
`Gal(K_f/K)` acts on it by transport of structure, `τ · [L]` being the class of `L` with `K_f`
acting through `τ⁻¹`. Choosing a `K`-isomorphism `K_f ≅ L^ur` and viewing `L` over it induces a
bijection from the set of `K`-isomorphism classes of extensions `L/K` of degree `n` with residue
degree `f` onto the orbit set `𝒯(K_f, n/f)/Gal(K_f/K)`: two choices differ by an element of
`Gal(K_f/K)`; a `K`-isomorphism `L ≅ L'` carries `L^ur` onto `L'^ur`; and a totally ramified
`L/K_f` of degree `n/f` has `L^ur = K_f` over `K` (`TauCeti.eq_unramifiedExtension_inertiaDegree_iff`),
which gives surjectivity. Two `K_f`-classes are `K`-isomorphic exactly when they lie in one orbit,
and every degree-`n` class arises for exactly one `f ∣ n`. The classification covers inseparable
finite extensions too; the separable classes in `𝒯(K_f, n/f)` are the classes of `σ_{K_f}(n/f)`.
README only. *Needs:* the LocalFieldsRamification contract (unramified extensions, the
factorization).

**Checks.**

- Quadratic over `ℚ_2`: `f = 1` gives the six ramified classes, and `f = 2` gives the single class
  `ℚ_4`, a fixed point; `7` classes in all.
- Cubic over `ℚ_3`: `9` ramified classes and the unramified cubic, `10` in all.
- Quartic over `ℚ_2` with `f = 2`: `K_2 = ℚ_4 = ℚ_2(√−3)` has `16` square classes, hence `14`
  ramified quadratic extensions; Frobenius `√−3 ↦ −√−3` fixes `6` of their classes and swaps the
  other `8` in `4` pairs, giving `10` orbits.

### 1.2 the automorphism count

Restriction `Aut_K(L) → Gal(L^ur/K) ≅ Gal(K_f/K)` has kernel `Aut_{K_f}(L)` and image the
stabilizer `Stab([L])` of the class of `L`, the elements of `Gal(K_f/K)` that extend to
automorphisms of `L`. So `#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])`, the orbit of `[L]` has
`f / #Stab([L])` elements, and, in `ℝ≥0∞`,
`Σ_{[L]_K : f(L/K) = f} 1/#Aut_K(L) = (1/f) · Σ_{[L] ∈ 𝒯(K_f, n/f)} 1/#Aut_{K_f}(L)`, likewise
with each class weighted by any function of its `K`-isomorphism class. The Lean form
`natCard_algEquiv_eq_mul` reads the count on `IntermediateField K (SeparableClosure K)`, with
`Aut_{K_f}(L)` the automorphisms of `IntermediateField.extendScalars` over `K_f`. *Needs:* 1.1;
Mathlib `IntermediateField.extendScalars`.

**Checks.**

- `ℚ_2(ζ_12) = ℚ_4(√−1)` has a fixed class and `#Aut_{ℚ_2} = 4 = 2 · 2`.
- `ℚ_2(∜−3) = ℚ_4(√(√−3))` has a moved class and `#Aut_{ℚ_2} = 2 = 2 · 1`: the roots of `x⁴ + 3`
  in it are `±∜−3` only, `−1` not being a square there.
- `ℚ_4` itself: `2 = 1 · 2`; and `⊥`: `1 = 1 · 1`.

### 1.3 the subfield form and the orbit count

Inside `SeparableClosure K`, `L^ur` is `L ⊓ K^ur`, and for `L` finite over `K` it is
`TauCeti.unramifiedExtension K K^sep f(L/K)` (`inf_maximalUnramifiedExtension`). So the
subextensions of degree `n` and residue degree `f` are exactly those containing `K_f` that are
totally ramified of degree `n/f` over it. **The orbit count for every finite subextension**
(`ncard_isomorphic_mul_natCard_algEquiv`): `L/K` separable of degree `n` has `n` embeddings into
`SeparableClosure K`, and those with a given image form an `Aut_K(L)`-torsor; MassFormula's orbit
count is the totally ramified case. With it a sum over `K`-isomorphism classes weighted by
`1/#Aut_K` is `1/n` times the sum over subextensions, and 1.2's identity becomes the subfield
form. *Needs:* 1.1; the LocalFieldsRamification contract
(`IntermediateField.le_maximalUnramifiedExtension_iff`, `TauCeti.existsUnique_isUnramified_finrank_eq`).

**Checks.**

- `L = ⊥`, `ℚ_2(i)`: the intersection is `⊥ = K_1`; `L = ℚ_4`: it is `ℚ_4 = K_2`.
- `L = K^ur` is infinite over `K`, and `K^ur ≠ K_0 = ⊥`: the finiteness hypothesis is necessary.
- Orbit count: `ℚ_4` gives `1 · 2 = 2`; `ℚ_2(∜−3)` gives `2 · 2 = 4`, its class being
  `{ℚ_4(θ), ℚ_4(iθ)}`; the quartic subfield form counts `6 · 1 + 4 · 2 = 14 = #σ_{ℚ_4}(2)`.

### Dependencies

Layer 0 for the carrier; the LocalFieldsRamification contract.

## Layer 2: the transitive mass by residue degree

### 2.1 Serre over `K_f`, inside `SeparableClosure K`

`SeparableClosure K` is a separable closure of `K_f` (`IsSepClosure`), so `IsSepClosure.equiv`
identifies it over `K_f` with `SeparableClosure K_f`. Transport Serre's Theorem 1 for `K_f` along
this identification: the subextensions `L ⊇ K_f` of `SeparableClosure K` totally ramified of degree
`e` over `K_f` satisfy `∑ (q^f)^{−c(L/K_f)} = e`. The identification preserves the degree, total
ramification and the discriminant exponent over `K_f`, each by invariance under isomorphism. README
only. *Needs:* the MassFormula contract (Theorem 1); Mathlib `IsSepClosure.equiv`.

**Checks.**

- `f = 1`: the statement is Theorem 1 itself.
- `e = 1`: the only `L` is `K_f`, with `c = 0`, and the sum is `1`.
- `K = ℚ_2`, `f = 2`, `e = 2`: the fourteen members of `σ_{ℚ_4}(2)` sit inside `SeparableClosure ℚ_2`.

### 2.2 the subfield count

For `f, e ≥ 1`, `∑_{[L:K] = fe, f(L/K) = f} q^{−d(L/K)} = e · q^{−f(e−1)}` (`tsum_inertiaDegree_eq`).
By 1.3 each `L` is a totally ramified extension of `K_f` of degree `e`; the tower law with
`d(K_f/K) = 0` gives `d(L/K) = f · d(L/K_f)`; and `c(L/K_f) = d(L/K_f) − e + 1` turns 2.1's sum into
this one. *Needs:* 1.3, 2.1; `TauCeti.discriminantExponent_tower`,
`TauCeti.discriminantExponent_eq_zero_iff`.

**Checks.**

- `(f, e) = (2, 1)`: `ℚ_4` alone, `1 = 1 · q^0`.
- `(1, 2)` over `ℚ_2`: `2 · 2^{−2} + 4 · 2^{−3} = 1 = 2 · 2^{−1}`.
- `(1, 2)` over `ℚ_p`, `p` odd: two fields with `d = 1`, `2/p = 2 · p^{−1}`.

### 2.3 splitting symbols and the transitive mass

`GaloisSet.splittingSymbol` is the multiset, over the orbits, of `(f, e)` for the fixed field `F` of
a point stabilizer, with `f = intermediateFieldInertiaDegree F` and `e = [F : K] / f` ([Bhargava
2007, (2.1)]); well defined on orbits by invariance of `f` under `K`-isomorphism. **The transitive
mass** (`etaleMass_isTransitive_splittingSymbol`): the Galois sets of size `fe` with symbol
`{(f, e)}`, which are transitive, have mass `q^{−f(e−1)}/f`; it is 0.3's bridge followed by 2.2,
`(1/(fe)!) · (fe − 1)! · e · q^{−f(e−1)}`. *Needs:* 0.3, 2.2.

**Checks.**

- The trivial Galois set of size `n` has symbol `n · {(1, 1)}`.
- `(f, e) = (2, 1)`: `(1/2!) · 1! · 1 = 1/2 = 1/(2 q^0)`, the mass of `ℚ_4`.
- `(1, 2)` over `ℚ_2`: `(1/2) · 1 = 1/2 = 1/(1 · 2)`.

### Dependencies

Layers 0 and 1; the MassFormula contract (Theorem 1); the discriminant tower law.

## Layer 3: Bhargava's mass formulas

### 3.1 by splitting type

For `σ = (f_1^{e_1} ⋯ f_r^{e_r})` of degree `n` (all `f_i, e_i ≥ 1`, `∑ f_i e_i = n`), `#Aut(σ)` is
`∏ f_i` times the number of permutations of the factors preserving `σ` (`splittingSymbolAut`), and
`Disc(σ) = q^{∑ f_i(e_i − 1)}` (`splittingSymbolExponent`). The Galois sets with symbol `σ` have mass
`1/(#Aut(σ) · q^{∑ f_i(e_i−1)})` ([Bhargava 2007, Prop. 2.1]; `etaleMass_splittingSymbol`). A Galois
set is determined by its partition of `Fin n` into orbits and a transitive Galois set on each block;
the weight is additive over blocks; choosing the blocks of sizes `f_i e_i` in order gives the
multinomial `n!/∏(f_i e_i)!`, and unordering the blocks with equal `(f_i, e_i)` divides by the
multiplicity factorials; each block contributes its transitive mass from 2.3. *Needs:* 2.3.

**Checks.**

- `{(1, 1), (1, 1)}` (`K × K`): `1/2 = 1/(1 · 2!)`.
- `{(1, 2), (1, 1)}` (a ramified quadratic times `K`): `#Aut(σ) = 1`, mass `q^{−1}`; over `ℚ_2`,
  `1/2`, since `#Aut_K(L × K) = #Aut_K(L)`.
- `{(1, 2), (1, 2)}`: `3 · (2/q)² / 4! = 1/(2q²) = 1/(1 · 2! · q²)`.

### 3.2 by ramification partition

The ramification partition of `σ` repeats each `e_i − 1` `f_i` times and drops zeros
(`ramificationPartition`); for a symbol of exponent `k` it is a partition of `k` into at most `n − k`
parts. For each such partition `π`, the Galois sets of size `n` whose symbol has ramification
partition `π` have mass `q^{−k}` ([Bhargava 2007, Prop. 2.2]; `etaleMass_ramificationPartition`).
Since every such `σ` has exponent `k`, this is `∑_{π(σ) = π} 1/#Aut(σ) = 1`. With `n_t` the number of
parts of `π` equal to `t ≥ 1` and `n_0 = n − k − (number of parts of π)`, the symbols with
`π(σ) = π` correspond to the conjugacy classes of `S_{n_0} × S_{n_1} × ⋯ × S_{n_k}`: the cycle type of
the `t`-th component lists the `f_i` of the factors with `e_i = t + 1`. Under this correspondence
`#Aut(σ)` is the order of the centralizer, so the sum is the sum over conjugacy classes of
`#class / ∏ n_t!`, which is `1` (`Equiv.Perm.card_of_cycleType`). ⚠ The unramified factors form the
component `t = 0`. [Bhargava 2007] writes the product from `t = 1`; the statement needs `S_{n_0}`,
and the case `π = ∅` is exactly the count of its conjugacy classes. *Needs:* 3.1;
Mathlib `Equiv.Perm.card_of_cycleType`.

**Checks.**

- `π = ∅` (the unramified mass, [Bhargava 2007, (2.4)]): the Galois sets all of whose orbits have
  `e = 1` have mass `1`; for `n = 2`, `K × K` and `K_2` give `1/2 + 1/2`.
- `n = 4`, `π = (1, 1)`: symbols `{(1, 2), (1, 2)}` and `{(2, 2)}`, `1/2 + 1/2 = 1`, mass `q^{−2}`.
- `n = 3`, `k = 2`, `π = (1, 1)`: two parts exceed `n − k = 1`, no symbol has `n_0 = −1`, and the
  mass is `0`; the bound on the number of parts is necessary.

### 3.3 the summit

For `n ≥ 1`, `M_n(K) = ∑_{k=0}^{n−1} q(k, n − k) · q^{−k}` ([Bhargava 2007, Thm. 1.1 and Prop. 2.3,
with §8 for an arbitrary non-archimedean local field]; `etaleMass_eq`). Every Galois set has a
ramification partition of some `k ≤ n − 1` into at most `n − k` parts (`k = n` would need `0` parts
summing to `n > 0`), and summing 3.2 over these partitions gives the formula. With 0.4 it is
Bhargava's statement over étale algebras. *Needs:* 0.4, 3.2; Mathlib `Nat.Partition`.

**Checks.**

- `n = 1`: `M_1 = 1 = q(0, 1)`.
- `n = 2`: `M_2 = 1 + q^{−1}`; over `ℚ_2`, `3/2`, the value of 0.4.
- `n = 3`: `M_3 = 1 + q^{−1} + q^{−2}`; `n = 4`: `M_4 = 1 + q^{−1} + 2q^{−2} + q^{−3}`.
- `K = 𝔽_p((t))`, `n = p`: infinitely many Galois sets of size `p`, and `M_p(K)` is still the finite
  value of the formula.
- `n = 0` is excluded: `M_0 = 1` while the right side is the empty sum.

### Dependencies

Layer 2; Mathlib's cycle-type counts and partitions. The combinatorial core of 3.2,
`∑_{π(σ) = π} 1/#Aut(σ) = 1`, is independent of the arithmetic and can be built first.

## Long horizon (a roadmap for a future roadmap; do not attempt it here)

[Kedlaya 2007] reformulates the mass of Galois sets with values in a group `Γ ⊆ GL_n`, weighted by
the Artin conductor, and asks when it is uniform in `K`; uniform formulas hold for the
hyperoctahedral groups `W(B_n)`, and [Wood 2008] gives them for wreath and cross products. With the
Artin conductor of a general representation they generalize this roadmap's weight; [Wood–Yasuda
2015, 2017] relate them to stringy invariants of quotient singularities, and [Yasuda 2025] gives
motivic versions of Serre's and Bhargava's formulas over `k((t))`. They are named to mark the
direction, not to be worked on under this roadmap.

## References

- M. Bhargava, *Mass formulae for extensions of local fields, and conjectures on the density of
  number field discriminants*, IMRN **2007**, rnm052, doi:10.1093/imrn/rnm052. Numbering of the
  published article: Thm. 1.1, Props. 2.1–2.3, eqs. (2.1)–(2.4), and §8 for arbitrary local fields
  (the preprint numbers them Theorem 1 and Propositions 1–3).
- J-P. Serre, *Une «formule de masse» pour les extensions totalement ramifiées de degré donné
  d'un corps local*, C. R. Acad. Sci. Paris **286** (1978), 1031–1036, through the mass formula
  roadmap.
- K. S. Kedlaya, *Mass formulas for local Galois representations*, IMRN **2007**, rnm021, with an
  appendix by D. Gulotta: the Galois-set formulation.
- M. M. Wood, *Mass formulas for local Galois representations to wreath products and cross
  products*, Algebra & Number Theory **2** (2008), 391–405.
- M. M. Wood and T. Yasuda, *Mass formulas for local Galois representations and quotient
  singularities I*, IMRN **2015**; *II*, Algebra & Number Theory **11** (2017).
- T. Yasuda, *Motivic mass formulas*, Forum Math. Sigma **13** (2025), e148.
