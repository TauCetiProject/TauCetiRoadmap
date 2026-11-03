# Roadmap: Bhargava's mass formula for étale algebras over a local field

The [mass formula roadmap](../MassFormula/README.md) counts the totally ramified extensions of a
non-archimedean local field `K`: Serre's formula `∑_{L ∈ σ_K(n)} q^{-c(L)} = n`. This roadmap
removes the restriction to total ramification, and to fields. Its summit is the mass formula of
[Bhargava 2007, Thm. 1.1]: summed over the isomorphism classes of étale `K`-algebras `A` of degree
`n`,

```text
∑_{[A]} 1 / (#Aut_K(A) · q^{v(Disc A)}) = ∑_{k=0}^{n−1} q(k, n − k) · q^{−k},
```

where `q` is the residue cardinality, `v(Disc A)` the valuation in `K` of the discriminant of `A`,
and `q(k, m)` the number of partitions of `k` into at most `m` parts. Together with its
refinements by splitting type and by ramification partition, it is the local input to Bhargava's
heuristics for the density of number-field discriminants, and nothing like it is upstream.

The proof is Serre's formula applied over each unramified extension `K_f` and assembled by
combinatorics: the transitive pieces come from Serre over `K_f`, and the étale algebras are
products of transitive pieces. The roadmap's own material is the model of étale algebras as
**Galois sets** (finite sets with a continuous action of `Gal(K^sep/K)`), the decomposition of an
extension by its unramified part, and the counting that turns Serre's formula into Bhargava's.

Suggested home: `TauCeti/NumberTheory/LocalField/EtaleMassFormula/`.

## Scope

This roadmap owns the **mass of étale algebras over a non-archimedean local field**: Galois sets
and their discriminant weight; the bridge from Galois sets to étale algebras and to subextensions
of `SeparableClosure K`; the classification of finite extensions by their unramified part, with
its automorphism count; the transitive mass by residue degree; and Bhargava's mass formulas by
splitting type, by ramification partition, and in total.

It does not own:

- **Serre's mass formula**, the wild exponent, `σ_K(n)` and its orbit count: the
  [mass formula roadmap](../MassFormula/README.md), consumed below.
- **Unramified extensions, residue degree, ramification index, the discriminant exponent and its
  tower law**: the [local fields and ramification roadmap](../../Completed/LocalFieldsRamification/README.md),
  consumed below.
- **Krasner's count of totally ramified extensions by discriminant, Monge's count by
  ramification polygon, and the families of Hou–Keating and Sinclair**: the `p`-adic extension
  families roadmap (TauCetiProject/TauCetiRoadmap#1713), which consumes Layer 1 here.
- **Density conjectures and theorems for number-field discriminants**, Bhargava's `n ≤ 5` counts,
  and the archimedean mass: the arithmetic statistics roadmaps
  (TauCetiProject/TauCetiRoadmap#1171–#1175, TauCetiProject/TauCetiRoadmap#1531).
- **Archimedean local fields**, which `IsNonarchimedeanLocalField` excludes.

## Standing conventions

- **The base field** is as in the mass formula roadmap: `K` carries
  `[Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K] [IsNonarchimedeanLocalField K]`,
  spelled out. The residue cardinality is written inline as `Nat.card 𝓀[K]`; `q` abbreviates it
  in prose only. A weight `q^{−k}` is `1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ k`.
- **The Galois group is `SeparableClosure K ≃ₐ[K] SeparableClosure K`** with Mathlib's Krull
  topology (`krullTopology`). Not `Field.absoluteGaloisGroup K`, which is the automorphism group
  of `AlgebraicClosure K`: fixed fields must be subextensions of `SeparableClosure K`, where the
  consumed invariants live and inseparable extensions are excluded by construction.
- **The carrier is a Galois set.** A Galois set of size `n` is a homomorphism
  `ρ : Gal(K^sep/K) →* Equiv.Perm (Fin n)` with open kernel (`GaloisSet K n`). This is the
  carrier of every mass statement: the étale algebras are its isomorphism classes, and
  `1/n!` times a sum over Galois sets is the sum over classes weighted by `1/#Aut`
  (Layer 0). Do not state the mass formulas over a quotient type of étale algebras.
- **The weight is the orbit sum of discriminant exponents.** For a set `X` with an action of
  `Gal(K^sep/K)`, `orbitDiscriminantExponent K X` is the sum, over the orbits, of the discriminant
  exponent of the fixed field of the stabilizer of a point of the orbit, the discriminant exponent
  being the consumed `intermediateFieldDiscriminantExponent`. It is defined with `∑ᶠ` and
  `Quotient.out`; junk values on infinite or discontinuous actions are tolerated, and every
  statement is about Galois sets.
- **The étale discriminant is the weight of `A →ₐ[K] K^sep`.** For a `K`-algebra `A`,
  `etaleDiscriminantExponent K A` is the weight of the action of `Gal(K^sep/K)` by composition on
  `A →ₐ[K] SeparableClosure K`. Do not define a separate discriminant of an étale algebra;
  `etaleDiscriminantExponent_pi` is the comparison with the factors.
- **Residue degrees of subextensions** are the wrapper `intermediateFieldInertiaDegree`, the
  totalization of the consumed `inertiaDegree` over arbitrary subextensions of
  `SeparableClosure K` with junk value `0` on infinite ones, exactly as the mass formula roadmap
  totalizes the discriminant exponent. In Tau Ceti it is `IntermediateField.inertiaDegree`, beside
  `IntermediateField.discriminantExponent`.
- **Sums are in `ℝ≥0∞`.** In equal characteristic `p` there are infinitely many Galois sets of size
  `n ≥ p`, so every mass is a `∑'` valued in `ℝ≥0∞`, and equality with a finite value encodes
  convergence.
- **Splitting symbols are `Multiset (ℕ × ℕ)`**, a pair `(f, e)` per orbit; `#Aut(σ)`, the
  exponent `∑ f_i(e_i − 1)` and the ramification partition are functions of the multiset
  (`splittingSymbolAut`, `splittingSymbolExponent`, `ramificationPartition`). Partitions are
  Mathlib's `Nat.Partition`.

## What this roadmap consumes

### From the mass formula roadmap

- **Serre's Theorem 1**, `∑_{L ∈ σ_K(n)} q^{-c(L)} = n` in `ℝ≥0∞`, for every non-archimedean
  local field, in particular for each unramified extension `K_f` of `K`.
- **The discriminant exponent of a subextension**, `intermediateFieldDiscriminantExponent`, with
  its invariance under `K`-isomorphism.
- **The orbit count** for `σ_K(n)`, generalized in Layer 1 to every finite subextension.

These are implemented in Tau Ceti (`TauCeti/NumberTheory/LocalField/MassFormula/`):
`TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent`,
`IntermediateField.discriminantExponent`, `IntermediateField.discriminantExponent_eq_of_algEquiv`
and `TauCeti.ncard_isomorphic_mul_natCard_algEquiv`. Consume them by those names. The Tau Ceti
revision this repository pins predates them, so `Suggested.lean` imports the mass formula roadmap's
`Suggested.lean` and uses its names.

### From the local fields and ramification roadmap, implemented in Tau Ceti

- **Unramified extensions**: `TauCeti.unramifiedExtension K Ω f`, the unique unramified
  subextension of degree `f` of a separably closed `Ω` (`TauCeti.existsUnique_isUnramified_finrank_eq`),
  Galois over `K`; and `TauCeti.maximalUnramifiedExtension K Ω` with
  `IntermediateField.le_maximalUnramifiedExtension_iff` (`Unramified/Existence.lean`,
  `Unramified/Maximal.lean`).
- **The unramified–totally ramified factorization**: `eq_unramifiedExtension_inertiaDegree_iff`,
  `isTotallyRamified_unramifiedExtension_inertiaDegree` and
  `finrank_unramifiedExtension_inertiaDegree_eq_ramificationIndex`
  (`Unramified/Factorization.lean`).
- **The discriminant tower law** `δ(M/K) = [M:L] δ(L/K) + f(L/K) δ(M/L)`:
  `TauCeti.discriminantExponent_tower` (`Discriminant/Tower.lean`); and
  `discriminantExponent_eq_zero_iff` for the unramified step.
- **Residue degree**: `TauCeti.inertiaDegree`, with `ramificationIndex_mul_inertiaDegree`.
- **The structure adapters** `finiteIntermediateFieldValuativeRel`,
  `finiteIntermediateFieldTopology` and their companions, which make a finite subextension a local
  field.

### From Mathlib

- **Galois theory of `SeparableClosure K`**: `krullTopology`, `IntermediateField.fixedField`,
  `IntermediateField.fixingSubgroup` and the Galois correspondence
  (`Mathlib/FieldTheory/KrullTopology.lean`, `Mathlib/FieldTheory/Galois/Infinite.lean`);
  `IsSepClosure` and `IsSepClosure.equiv`.
- **Group actions**: `MulAction.orbitRel.Quotient`, `MulAction.stabilizer`,
  `MulAction.index_stabilizer` (orbit–stabilizer for an infinite group), `MulAction.compHom`.
- **Étale algebras over a field**: `Algebra.Etale`, and
  `Algebra.FormallyEtale.iff_exists_algEquiv_prod` (`Mathlib/RingTheory/Etale/Field.lean`): an
  étale algebra is a finite product of finite separable field extensions.
- **Permutations and partitions**: `Equiv.Perm.cycleType` and `Equiv.Perm.card_of_cycleType`
  (the centralizer count Layer 3 uses); `Nat.Partition`
  (`Mathlib/Combinatorics/Enumerative/Partition/Basic.lean`).

## What is missing (build here)

Galois sets and their discriminant weight; the bridges to subextensions and to étale algebras; the
subfield form of the unramified-part decomposition and the automorphism count; the orbit count for
every finite subextension; Serre's formula transported to the unramified extensions inside
`SeparableClosure K`; splitting symbols and ramification partitions; and Bhargava's formulas.
None of it is upstream, and none of it is claimed by the roadmaps this one consumes.

---

## The build, in layers

### Layer 0: Galois sets, their weight, and the mass

- **The orbit weight.** `orbitDiscriminantExponent K X` as in the conventions, with its
  well-definedness: the fixed field of the stabilizer of `σ • x` is the image of that of `x` under
  `σ`, hence `K`-isomorphic to it, so the discriminant exponent does not depend on the point
  chosen in the orbit (`intermediateFieldDiscriminantExponent_fixedField_stabilizer_smul`, from the
  consumed invariance under `K`-isomorphism).
- **Galois sets.** `GaloisSet K n`, its action `GaloisSet.mulAction` through `MulAction.compHom`,
  its weight `GaloisSet.discriminantExponent`, and `GaloisSet.IsTransitive`. For a Galois set the
  stabilizers are open, so their fixed fields are finite over `K`, of degree the orbit size
  (`GaloisSet.finrank_fixedField_stabilizer`, by the Galois correspondence and orbit–stabilizer).
- **The étale mass** `M_n(K) = (1/n!) ∑_ρ q^{−d(ρ)}` (`etaleMass`).
- **The transitive bridge** (`tsum_isTransitive`). The transitive Galois sets of size `n` with a
  given stabilizer `H` of `0` correspond to the bijections `G/H ≅ Fin n` sending `H` to `0`, of which
  there are `(n − 1)!`; the open subgroups of index `n` correspond to the subextensions of degree
  `n` through `fixedField`. Hence the transitive Galois sets weigh `(n − 1)!` times
  `∑_{[L:K] = n} q^{−d(L)}`, the sum over subextensions of `SeparableClosure K`.
- **The bridge to étale algebras.** `homMulAction` and `etaleDiscriminantExponent`; for a product
  of finite subextensions the weight is the sum of their discriminant exponents
  (`etaleDiscriminantExponent_pi`: the orbits of `∏ L_i →ₐ[K] K^sep` are indexed by the factors,
  and the stabilizer of the `i`-th projection followed by the inclusion is the fixing subgroup of
  `L_i`). Then **Bhargava's left-hand side is the étale mass** (`tsum_etaleDiscriminantExponent`):
  for any family of étale algebras of degree `n` with exactly one member in each isomorphism class,
  `∑ 1/(#Aut_K(A) · q^{d(A)}) = M_n(K)`. The route: `Equiv.Perm (Fin n)` acts on Galois sets by
  conjugation, without changing the weight; `A ↦ (A →ₐ[K] K^sep)` with a labelling of its `n`
  points is a bijection from isomorphism classes with labellings onto Galois sets (by
  `Algebra.FormallyEtale.iff_exists_algEquiv_prod` and the Galois correspondence), so the orbits
  are the isomorphism classes and the stabilizer of a Galois set is `Aut_K(A)`; orbit–stabilizer
  gives `n!/#Aut_K(A)` Galois sets per class.

### Layer 1: extensions by their unramified part

Fix `n ≥ 1` and `f ∣ n`, and let `K_f` be the unramified extension of `K` of degree `f`, unique up
to `K`-isomorphism and Galois with `Gal(K_f/K) ≅ ℤ/f` generated by Frobenius. Write `𝒯(K_f, n/f)`
for the set of `K_f`-isomorphism classes of totally ramified extensions of `K_f` of degree `n/f`;
`Gal(K_f/K)` acts on it by transport of structure, `τ · [L]` being the class of `L` with `K_f`
acting through `τ⁻¹`.

- **Classification.** Choosing a `K`-isomorphism `K_f ≅ L^ur` and viewing `L` over it induces a
  bijection from the set of `K`-isomorphism classes of extensions `L/K` of degree `n` with residue
  degree `f` onto the orbit set `𝒯(K_f, n/f)/Gal(K_f/K)`: two choices differ by an element of
  `Gal(K_f/K)`; a `K`-isomorphism `L ≅ L'` carries `L^ur` onto `L'^ur`; and a totally ramified
  `L/K_f` of degree `n/f` has `L^ur = K_f` over `K` (`eq_unramifiedExtension_inertiaDegree_iff`),
  which gives surjectivity. Two `K_f`-classes are `K`-isomorphic exactly when they lie in one
  orbit. Every degree-`n` class of `K` arises for exactly one `f ∣ n`. The classification covers
  inseparable finite extensions too; the separable classes in `𝒯(K_f, n/f)` are the classes of
  `σ_{K_f}(n/f)`.
- **The automorphism count** (`natCard_algEquiv_eq_mul`). Restriction
  `Aut_K(L) → Gal(L^ur/K) ≅ Gal(K_f/K)` has kernel `Aut_{K_f}(L)` and image the stabilizer
  `Stab([L])` of the class of `L`, the elements of `Gal(K_f/K)` that extend to automorphisms of
  `L`. So `#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])`, the orbit of `[L]` has `f / #Stab([L])`
  elements, and

  ```text
  Σ_{[L]_K : f(L/K) = f} 1/#Aut_K(L) = (1/f) · Σ_{[L] ∈ 𝒯(K_f, n/f)} 1/#Aut_{K_f}(L)
  ```

  in `ℝ≥0∞`, and likewise with each class weighted by any function of its `K`-isomorphism class.
- **The subfield form.** Inside `SeparableClosure K`, `L^ur` is `L ⊓ K^ur`, and it is
  `TauCeti.unramifiedExtension K K^sep f(L/K)` (`inf_maximalUnramifiedExtension`, from
  `IntermediateField.le_maximalUnramifiedExtension_iff` and
  `TauCeti.existsUnique_isUnramified_finrank_eq`). So the subextensions of degree `n` and residue
  degree `f` are exactly those that contain `K_f` and are totally ramified of degree `n/f` over
  it.
- **The orbit count for every finite subextension** (`ncard_isomorphic_mul_natCard_algEquiv`):
  `L/K` separable of degree `n` has `n` embeddings into `SeparableClosure K`, and those with a given
  image form an `Aut_K(L)`-torsor. The mass formula roadmap's orbit count is the totally ramified
  case. With it, a sum over `K`-isomorphism classes weighted by `1/#Aut_K` is `1/n` times the sum
  over subextensions, and the displayed identity above becomes the subfield form.

### Layer 2: the transitive mass by residue degree

- **Serre over `K_f`, inside `SeparableClosure K`.** `SeparableClosure K` is a separable closure
  of `K_f` (`IsSepClosure`), so `IsSepClosure.equiv` identifies it over `K_f` with
  `SeparableClosure K_f`. Transport the consumed Theorem 1 for `K_f` along this identification:
  the subextensions `L ⊇ K_f` of `SeparableClosure K` totally ramified of degree `e` over `K_f`
  satisfy `∑ (q^f)^{−c(L/K_f)} = e`. The transport needs that the identification preserves the
  degree, total ramification and the discriminant exponent over `K_f`, each a consequence of the
  consumed invariance under isomorphism.
- **The subfield count** (`tsum_inertiaDegree_eq`): for `f, e ≥ 1`,
  `∑_{[L:K] = fe, f(L/K) = f} q^{−d(L/K)} = e · q^{−f(e−1)}`. By Layer 1's subfield form each `L`
  is a totally ramified extension of `K_f` of degree `e`; `TauCeti.discriminantExponent_tower`
  with `d(K_f/K) = 0` gives `d(L/K) = f · d(L/K_f)`; and `c(L/K_f) = d(L/K_f) − e + 1` turns
  Serre's sum into this one.
- **Splitting symbols.** `GaloisSet.splittingSymbol`: the multiset over orbits of
  `(f, e)` for the fixed field of a point stabilizer, with `e = [F : K] / f`. Well defined on
  orbits by the invariance of `f` under `K`-isomorphism.
- **The transitive mass** (`etaleMass_isTransitive_splittingSymbol`): the transitive Galois sets
  of size `fe` with symbol `{(f, e)}` have mass `q^{−f(e−1)}/f`. This is the transitive bridge
  followed by the subfield count: `(1/(fe)!) · (fe − 1)! · e · q^{−f(e−1)}`.

### Layer 3: Bhargava's mass formulas

- **By splitting type** ([Bhargava 2007, Prop. 2.1]; `etaleMass_splittingSymbol`). For a symbol
  `σ = (f_1^{e_1} ⋯ f_r^{e_r})` of degree `n` (all `f_i, e_i ≥ 1`, `∑ f_i e_i = n`), the Galois sets
  with symbol `σ` have mass `1/(#Aut(σ) · q^{∑ f_i(e_i−1)})`, where `#Aut(σ)` is `∏ f_i` times the
  number of permutations of the factors preserving `σ` (`splittingSymbolAut`). The route: a Galois
  set is determined by its partition of `Fin n` into orbits and a transitive Galois set on each
  block; the weight is additive over blocks; choosing the blocks of sizes `f_i e_i` in order gives
  the multinomial `n!/∏(f_i e_i)!`, and unordering the blocks with equal `(f_i, e_i)` divides by
  the multiplicity factorials. Each block contributes its Layer 2 transitive mass.
- **By ramification partition** ([Bhargava 2007, Prop. 2.2]; `etaleMass_ramificationPartition`).
  The ramification partition of `σ` repeats each `e_i − 1` `f_i` times and drops zeros
  (`ramificationPartition`); for a symbol of exponent `k` it is a partition of `k` into at most
  `n − k` parts. For each such partition `π`, the Galois sets of size `n` whose symbol has
  ramification partition `π` have mass `q^{−k}`. Since every such `σ` has exponent `k`, this is
  `∑_{π(σ) = π} 1/#Aut(σ) = 1`. With `n_t` the number of parts of `π` equal to `t` for `t ≥ 1`,
  and `n_0 = n − k − (number of parts of π)`, the symbols with `π(σ) = π` correspond to the
  conjugacy classes of `S_{n_0} × S_{n_1} × ⋯ × S_{n_k}`: the cycle type of the `t`-th component
  lists the `f_i` of the factors with `e_i = t + 1`. Under this correspondence `#Aut(σ)` is the
  order of the centralizer, so the sum of `1/#Aut(σ)` is the sum over conjugacy classes of
  `#class / ∏ n_t!`, which is `1` (`Equiv.Perm.card_of_cycleType`). ⚠ The unramified factors form
  the component `t = 0`. [Bhargava 2007] writes the product from `t = 1`; the statement needs
  `S_{n_0}`, and the case `π = ∅` is exactly the count of its conjugacy classes.
- **The unramified mass** ([Bhargava 2007, (2.4)]; `etaleMass_unramified`): the Galois sets all of
  whose orbits are unramified have mass `1`, the case `k = 0`.
- **The summit** ([Bhargava 2007, Thm. 1.1 and Prop. 2.3, with §8 for an arbitrary
  non-archimedean local field]; `etaleMass_eq`): for `n ≥ 1`,
  `M_n(K) = ∑_{k=0}^{n−1} q(k, n − k) · q^{−k}`. Every Galois set has a ramification partition of
  some `k ≤ n − 1` into at most `n − k` parts (`k = n` would need `n − k = 0` parts with sum
  `n > 0`), and summing the previous mass over these partitions gives the formula. With
  `tsum_etaleDiscriminantExponent` it is Bhargava's statement over étale algebras.

## Worked examples (acceptance criteria)

- **`n = 1`:** one Galois set, weight `0`; `M_1 = 1`, and the right side is `q(0, 1) = 1`.
- **`n = 2`, `K = ℚ_2`:** `M_2 = 1 + 1/2 = 3/2`. By classes: `K × K` contributes `1/2` (two
  automorphisms, `d = 0`); `ℚ_4` contributes `1/2`; the six ramified quadratic fields contribute
  `(2 · 2^{−2} + 4 · 2^{−3}) / 2 = 1/2`, with `d = 2` for `ℚ_2(√−1)`, `ℚ_2(√−5)` and `d = 3` for
  `ℚ_2(√±2)`, `ℚ_2(√±10)`, the values the mass formula roadmap's worked examples fix. By
  ramification partition: `π = ∅` gives `1` (`K × K` and `ℚ_4`), `π = (1)` gives `2^{−1}`.
- **`n = 2`, `p` odd:** the ramified quadratic fields are two, each with `d = 1` and two
  automorphisms: mass `2 · (1/2) · p^{−1} = p^{−1}`.
- **`n = 3`:** `M_3 = 1 + q^{−1} + q^{−2}`, since `q(0, 3) = q(1, 2) = q(2, 1) = 1`.
- **Splitting type `(1^2 1)` in degree `3`** (a ramified quadratic times `K`): mass
  `1/(1 · 1 · q)`, with `#Aut(σ) = 1 · 1` (the two factors differ). Over `ℚ_2` this is the
  ramified quadratic mass `1/2` again: `#Aut_K(L × K) = #Aut_K(L)`.
- **Transitive mass, `f = 2, e = 1`:** the unramified quadratic `K_2` alone, `d = 0`, two
  automorphisms: `q^0/2 = 1/2`.
- **Layer 1, quartic over `ℚ_2` with `f = 2`:** `K_2 = ℚ_4 = ℚ_2(√−3)` has `16` square classes,
  hence `14` ramified quadratic extensions; Frobenius `√−3 ↦ −√−3` fixes `6` of their classes and
  swaps the other `8` in `4` pairs, giving `10` orbits. Counted inside the separable closure,
  `6 · 1 + 4 · 2 = 14 = #σ_{ℚ_4}(2)`.
- **Layer 1, automorphisms:** `ℚ_2(ζ_12) = ℚ_4(√−1)` has a fixed class and
  `#Aut_{ℚ_2} = 4 = 2 · 2`; `ℚ_2(∜−3) = ℚ_4(√(√−3))` has a moved class and
  `#Aut_{ℚ_2} = 2 = 2 · 1`: the roots of `x⁴ + 3` in it are `±∜−3` only, `−1` not being a square
  there.
- **Equal characteristic:** for `K = 𝔽_p((t))` and `n = p`, there are infinitely many Galois sets
  of size `p`, and `M_p(K)` is still the finite value of the formula.

## Ordering

Layer 0 rests on the consumed contracts. Layer 1 needs Layer 0 only for its statements over
subextensions. Layer 2 needs Layers 0 and 1 and Serre's formula. Layer 3 needs Layer 2; its
combinatorial core, `∑_{π(σ) = π} 1/#Aut(σ) = 1`, is independent of everything else and can be
built first.

## Long horizon (a roadmap for a future roadmap; do not attempt it here)

[Kedlaya 2007] reformulates the mass of Galois sets with values in a group `Γ ⊆ GL_n`, weighted
by the Artin conductor, and asks when it is uniform in `K`; uniform formulas hold for the
hyperoctahedral groups `W(B_n)`, and [Wood 2008] gives them for wreath and cross products. With
the Artin conductor of a general representation they generalize this roadmap's weight;
[Wood–Yasuda 2015, 2017] relate them to stringy invariants of quotient singularities, and [Yasuda
2025] gives motivic versions of Serre's and Bhargava's formulas over `k((t))`. They are named to
mark the direction, not to be worked on under this roadmap.

## References

- M. Bhargava, *Mass formulae for extensions of local fields, and conjectures on the density of
  number field discriminants*, IMRN **2007**, rnm052 — the summit: Thm. 1.1, Props. 2.1–2.3,
  eq. (2.4), and §8 for arbitrary local fields.
- J-P. Serre, *Une «formule de masse» pour les extensions totalement ramifiées de degré donné
  d'un corps local*, C. R. Acad. Sci. Paris **286** (1978), 1031–1036 — consumed through the mass
  formula roadmap.
- K. S. Kedlaya, *Mass formulas for local Galois representations*, IMRN **2007**, rnm021, with an
  appendix by D. Gulotta — the Galois-set formulation.
- M. M. Wood, *Mass formulas for local Galois representations to wreath products and cross
  products*, Algebra & Number Theory **2** (2008), 391–405.
- M. M. Wood and T. Yasuda, *Mass formulas for local Galois representations and quotient
  singularities I*, IMRN **2015**; *II*, Algebra & Number Theory **11** (2017).
- T. Yasuda, *Motivic mass formulas*, Forum Math. Sigma **13** (2025), e148.

## Acknowledgements

Layer 1's classification and automorphism count, with its quartic and automorphism examples, are
§0.6 of the `p`-adic extension families roadmap (TauCetiProject/TauCetiRoadmap#1713), which
consumes them from here.
