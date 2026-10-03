# Roadmap: peripheral actions on free pro-`p` groups

A free pro-`p` group `F` of finite rank `r` with a basis `x_1, …, x_r` carries one more
distinguished element, the *cusp* `z := (x_1 ⋯ x_r)⁻¹`, and the `r + 1` conjugacy classes of
`x_1, …, x_r, z` are its *peripheral classes*. For `r = 2` this is the pro-`p` fundamental group
of the thrice-punctured line, with the three classes of loops around `0`, `1` and `∞`. The
roadmap builds the theory of the automorphisms of `F` that preserve this structure up to a
common exponent: a continuous automorphism `φ` is *peripheral of exponent* `u ∈ ℤ_pˣ` when it
carries each of `x_1, …, x_r, z` to a conjugate of its `u`-th power. The headline theorem is that
such an automorphism exists for **every** unit `u`, by a self-contained group-theoretic argument
that lifts a solution of one equation through the closed lower central series of `F` and passes
to the limit by compactness.

The classical route to that theorem is arithmetic: `Gal(ℚ̄/ℚ)` acts on the profinite fundamental
group of `ℙ¹ ∖ {0, 1, ∞}`, cuspidal inertia is acted on through the cyclotomic character, and the
cyclotomic character is surjective. That route produces a *homomorphism* from the Galois group
into the peripheral automorphisms, together with much finer information; it is the subject of
the arithmetic successor of **BelyiMaps** (its Layers 12 and 13), and it is not built here. What
is built here is exactly the existence statement those layers reach in their peripheral-power
theorem, without the fundamental group, together with the group of all peripheral automorphisms,
its exponent character, its closedness, its explicit elements of exponent `-1`, its permutation
symmetries, and its continuous section over the principal units. The dyadic instance, for
`p = 2` and `r = 2`, is stated in the exact shape a consumer needs: an automorphism and three
conjugators, one for each of `P`, `T` and `C = (PT)⁻¹`.

## Scope and ownership

The roadmap owns:

- the peripheral system of a free pro-`p` group of finite rank: the cusp element, the peripheral
  tuple, and the predicate `IsPeripheralAut` for a continuous automorphism and an exponent;
- the **peripheral product identity**: for every unit `u` there are conjugators `c_1, …, c_r, d`
  with `∏_i c_i⁻¹ (x_i ^[p] u) c_i · d⁻¹ (z ^[p] u) d = 1`, with `c_1 = 1`, proved by
  central-series lifting and compactness;
- the **peripheral-power theorem**: for every unit `u` a continuous automorphism `φ_u` with
  `φ_u x_1 = x_1 ^[p] u`, `φ_u x_i = c_i⁻¹ (x_i ^[p] u) c_i` and `φ_u z = d⁻¹ (z ^[p] u) d`;
- the group `peripheralAut` of all peripheral automorphisms, its exponent character to `ℤ_pˣ`,
  closedness in the congruence topology, continuity and surjectivity of the exponent, the inner
  automorphisms as its exponent-one elements, the reflection of exponent `-1`, the permutation
  symmetries of the peripheral tuple, and the continuous homomorphic section of the exponent over
  the group of principal units;
- the dyadic instance on the free pro-`2` group of rank two, in both conventions for the third
  peripheral element, and the identity form that the `G_{ℚ_2}` formalization consumes.

It does not own, and consumes by name:

- free pro-`p` groups with their universal property, pro-`p` groups, topological finite
  generation, the Frattini quotient, the Burnside surjectivity criterion and the Hopf property:
  **ProfiniteProPGroups** specifies them and Tau Ceti implements them (`TauCeti.freeProP`,
  `TauCeti.IsProP`, `TauCeti.IsTopologicallyFinitelyGenerated`, `TauCeti.proPFrattini` and the
  theorems in the contract below). This roadmap uses the Tau Ceti declarations directly, and
  nothing from that roadmap's `Suggested.lean`;
- the `ℤ_p`-power `padicPow`, which is Tau Ceti's `TauCeti.IsProP.padicPow`, and the closed lower
  central series with its graded pieces and bracket, which are Tau Ceti's lower `p`-series at
  `p = 0` (`TauCeti.pLowerCentralSeries 0`, `TauCeti.gradedPiece`, `TauCeti.gradedBracket`), both
  under the names **ProfiniteArithmetic** gives them;
- from **ProfiniteArithmetic** itself: the groups `ContinuousAut` and `ContinuousOut` with the
  congruence topology, the unit-exponent lemmas for `padicPow`, the `ℤ_p`-linearity of the
  bracket, the spanning theorem, and the exterior-square description of `gr_1` of a free pro-`p`
  group;
- from **BelyiMaps**, the conjugation-transfer lemma `conjugation_transfer`, which moves a
  conjugator across a change of convention, and the word identity `opposite_third_peripheral`.
  Both are generic group lemmas in its §Pinned conventions, which precedes its Layer 13 and does
  not depend on it or on this roadmap. BelyiMaps' Layer 13 cites the existence theorems here, so
  there is no cycle;
- every arithmetic object. There is no Galois group, no fundamental group, no cyclotomic
  character and no branch-cycle theorem in this roadmap, and no milestone asserts that the
  automorphisms constructed here are the ones the Galois action produces.

## Conventions

- `p : ℕ` is prime, carried as `[Fact p.Prime]`, and `r : ℕ` is the rank.
- **The carrier is abstract.** Statements are about a profinite group `F` with the unbundled
  profinite stack, a proof `hF : TauCeti.IsProP p F`, and a marked isomorphism
  `e : F ≃ₜ* TauCeti.freeProP p (Fin r)` to Tau Ceti's standard model. The basis is
  `x i := e.symm (TauCeti.freeProP.of i)`. This keeps every theorem applicable to any group
  presented as free pro-`p` on `r` generators, including the maximal pro-`2` quotient of Tau
  Ceti's free profinite group on two generators, which is definitionally
  `TauCeti.freeProP 2 (Fin 2)`.
- **The cusp** is `cusp x := ((List.ofFn x).prod)⁻¹`, the inverse of the product of the basis
  **in order**, so that `x_1 ⋯ x_r · cusp x = 1`. The product is `List.prod`, not a `Finset`
  product, because the group is not commutative.
- **Conjugation and conjugacy.** A conjugator is written on the right, `c⁻¹ * y * c`, matching the
  peripheral-power theorem of BelyiMaps and the `G_{ℚ_2}` formalization; conjugacy without a
  named conjugator is Mathlib's `IsConj`. `IsConj a b` is `∃ c, c * a * c⁻¹ = b`, so a conjugate
  `c⁻¹ * y * c` witnesses `IsConj y (c⁻¹ * y * c)` with `c⁻¹`.
- **Powers** are ProfiniteArithmetic's `padicPow p hF x u`, written `x ^[p] u` in prose; this is
  Tau Ceti's `TauCeti.IsProP.padicPow`. For a unit `u : ℤ_pˣ` the exponent is the coercion
  `(u : ℤ_[p])`.
- **The peripheral tuple** is the map `Fin (r + 1) → F` that lists `x_0, …, x_{r-1}, cusp x`
  (Lean indexes from `0`; prose indexes from `1`).
- **Automorphisms** are `ContinuousAut F` from ProfiniteArithmetic, multiplying by composition,
  with the congruence topology.
- **Exactness at the first generator.** The constructed automorphism satisfies
  `φ_u x_1 = x_1 ^[p] u` on the nose. Nothing forces a consumer to use it; the conjugator `c_1 = 1`
  is recorded so that the identity form has `r + 1` conjugators of which one is trivial.

## Exact supplier contracts

### From Tau Ceti

ProfiniteProPGroups specifies free pro-`p` groups and the pro-`p` foundations, and Tau Ceti
implements them; this roadmap consumes the implementation directly. The principal units
`1 + p^k ℤ_p` are Tau Ceti's generic `TauCeti.unitsPrincipal p k`; ProfiniteProPGroups' dyadic
`unitsPrincipal 2` is its case `p = 2`.

| Use here | Exact declarations |
|---|---|
| the standard model | `TauCeti.freeProP`, `TauCeti.freeProP.of`, `TauCeti.freeProP.lift`, `TauCeti.freeProP.lift_of`, `TauCeti.freeProP.lift_unique`, `TauCeti.freeProP.hom_ext`, `TauCeti.isProP_freeProP`, `TauCeti.freeProP.topologicalClosure_closure_range_of_eq_top` |
| pro-`p` and generation | `TauCeti.IsProP`, `TauCeti.IsTopologicallyFinitelyGenerated`, `TauCeti.isTopologicallyFinitelyGenerated_freeProP`, `TauCeti.isTopologicallyFinitelyGenerated_congr`, `TauCeti.proPFrattini`, `TauCeti.topologicallyGenerates_iff_frattiniQuotient` |
| principal units | `TauCeti.unitsPrincipal`, `TauCeti.mem_unitsPrincipal_iff`, `TauCeti.isOpen_unitsPrincipal`, `TauCeti.isClosed_unitsPrincipal`, `TauCeti.isProP_unitsPrincipal`, `TauCeti.topologicalClosure_zpowers_eq_unitsPrincipal`, `TauCeti.exists_topologicalClosure_zpowers_eq_unitsPrincipal`, `TauCeti.pow_pow_mem_unitsPrincipal`, `TauCeti.pow_pow_notMem_unitsPrincipal` |
| Burnside and Hopf | `TauCeti.IsProP.eq_top_of_sup_proPFrattini_eq_top`, `TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective` |
| the `ℤ_p`-power as a continuous homomorphism | `TauCeti.IsProP.padicPowHom` |

### From `TauCetiRoadmap.ProfiniteArithmetic`

| Use here | Exact declarations |
|---|---|
| `ℤ_p`-powers | `padicPow` (Tau Ceti's `TauCeti.IsProP.padicPow`), `padicPow_one`, `padicPow_add`, `padicPow_padicPow`, `map_padicPow`, `padicPow_conj`, `inv_padicPow`, `continuous_padicPow`, `padicPow_units_inv`, `padicPow_units_injective`, `closedZpowers_padicPow_units` |
| profinite powers | `zpowHat` (Tau Ceti's `TauCeti.zHat.lift`, applied to an exponent in `ẑ = Additive TauCeti.zHat`), `map_zpowHat`, the idempotent `zHat.idem`, `closedZpowers`, `isProP_closedZpowers_zpowHat_idem`, `zpowHat_idem_of_isProP` |
| automorphisms | `ContinuousAut`, `ContinuousAut.conj`, `ContinuousAut.conj_apply`, `ContinuousOut`, the congruence topology, `ContinuousAut.compactSpace`, `ContinuousAut.t2Space`, `ContinuousAut.continuous_eval`, and the closed conjugacy relation `isClosed_isConj_pair` on `F × F` |
| the closed lower central series | `closedLowerCentralSeries` (Tau Ceti's `pLowerCentralSeries 0`), `isClosed_closedLowerCentralSeries`, `iInf_closedLowerCentralSeries_eq_bot`, `commutator_mem_closedLowerCentralSeries`, `lcsGradedPiece`, `lcsGradedMk`, `lcsGradedMk_conj`, `lcsBracket`, `lcsBracket_mk`, `lcsBracket_add_left`, `lcsBracket_add_right`, `lcsBracket_padicPow_left`, `lcsBracket_padicPow_right`, `lcsGradedPiece_eq_sum_bracket`, `lcsGradedPiece_zero_freeProP_bijective`, `lcsGradedPiece_one_freeProP_bijective`, `lcsBracket_freeProP_ne_zero` |

### From `TauCetiRoadmap.BelyiMaps`

| Use here | Exact declarations |
|---|---|
| change of convention for the third peripheral element (§Pinned conventions) | `conjugation_transfer`, `opposite_third_peripheral` |

### From Mathlib

`IsConj`, `isConj_iff`, `ConjClasses`, `List.ofFn`, `List.prod`, `Subgroup.zpowers`,
`Subgroup.topologicalClosure`, `IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`,
`IsCompact.image`, `IsCompact.isClosed`, `IsClosed.preimage`, `isClosed_iInter`,
`PadicInt.toZModPow`, `PadicInt.toZMod`, `PadicInt.unitCoeff`, `PadicInt.unitCoeff_spec`,
`Units.map`, `MonoidHom.ker`, `Equiv.Perm`.

## How to read the build

`README.md` is normative; `Suggested.lean` pins names and signatures for the central objects and is
not exhaustive. In prerequisite annotations, `M` means Mathlib, `L0` through `L4` mean an earlier
layer here, `PA-<layer>` an export of ProfiniteArithmetic, `BM-PC` a helper lemma of BelyiMaps'
§Pinned conventions, and `TC` a Tau Ceti declaration.

## Layer 0: peripheral systems

- **The basis and the cusp.** For `e : F ≃ₜ* TauCeti.freeProP p (Fin r)`, `basis e : Fin r → F`
  is `i ↦ e.symm (TauCeti.freeProP.of i)`, and `cusp (basis e) := ((List.ofFn (basis e)).prod)⁻¹`.
  The relation `(List.ofFn (basis e)).prod * cusp (basis e) = 1` holds by definition. The basis
  generates `F` topologically, and a continuous homomorphism out of `F` is determined by its
  values on the basis: both are Tau Ceti's theorems for the standard model
  (`TauCeti.freeProP.topologicalClosure_closure_range_of_eq_top`, `TauCeti.freeProP.hom_ext`),
  transported along `e`. So is topological finite generation: `F` is topologically finitely
  generated by `TauCeti.isTopologicallyFinitelyGenerated_freeProP` and
  `TauCeti.isTopologicallyFinitelyGenerated_congr`.
- **The peripheral tuple.** `peripheralTuple (basis e) : Fin (r + 1) → F` is `Fin.snoc` of the
  basis and the cusp. Its product in order is `1`.
- **The predicate.** For `φ : ContinuousAut F` and `u : ℤ_pˣ`, `IsPeripheralAut x u φ` says
  `∀ i : Fin (r + 1), IsConj (peripheralTuple x i ^[p] u) (φ (peripheralTuple x i))`. It is
  stated with `IsConj`, not with named conjugators, so that it is closed under composition and
  inversion (Layer 3); the constructive theorem of Layer 2 supplies conjugators explicitly.
- **The exponent is determined.** For `r ≥ 1`, if `IsPeripheralAut x u φ` and
  `IsPeripheralAut x v φ` then `u = v`: the induced automorphism of the topological
  abelianization `gr_0(F) ≅ ℤ_p^r` is multiplication by `u` on the classes of the basis, and the
  classes of the basis are `ℤ_p`-independent (PA-3.4 `lcsGradedPiece_zero_freeProP_bijective`).
- **Inner automorphisms are peripheral of exponent one**, and `IsPeripheralAut x 1 φ` holds for
  `φ = 1`.
  *Needs:* TC `TauCeti.freeProP.of`, `TauCeti.freeProP.lift`, `TauCeti.freeProP.hom_ext`,
  `TauCeti.freeProP.topologicalClosure_closure_range_of_eq_top`,
  `TauCeti.isTopologicallyFinitelyGenerated_freeProP`,
  `TauCeti.isTopologicallyFinitelyGenerated_congr`; PA-1 `padicPow`; PA-2
  `ContinuousAut`, `ContinuousAut.conj`; PA-3 `lcsGradedPiece` at degree zero and
  `lcsGradedPiece_zero_freeProP_bijective`; M `List.ofFn`,
  `Fin.snoc`, `IsConj`.

  ⚠ *Nearby false statement:* the peripheral condition on `x_1, …, x_r` alone does not imply it
  for the cusp. The automorphism `x_i ↦ x_i ^[p] u` for every `i` (the "diagonal" power map, an
  automorphism by Layer 2's criterion) is peripheral on the basis, and for `r = 3` and every unit
  `u ≠ 1` it is not peripheral on the cusp: `x_1^u x_2^u x_3^u` is not conjugate to
  `(x_1 x_2 x_3)^u`, already in `F ⧸ γ_2(F)`. There `(x_1 x_2 x_3)^u` is `x_1^u x_2^u x_3^u` times
  a central element of class `(u(u-1)/2) · ([x̄_2, x̄_1] + [x̄_3, x̄_1] + [x̄_3, x̄_2])` in
  `gr_1(F) ≅ Λ² ℤ_p^3` (PA-3.4 `lcsGradedPiece_one_freeProP_bijective`), while conjugating by `g`
  changes the class only by `[x̄_1 + x̄_2 + x̄_3, ḡ] = Σ_{i<k} (a_k - a_i) [x̄_i, x̄_k]` for
  `ḡ = Σ_k a_k x̄_k`. In the basis
  `[x̄_i, x̄_k]`, `i < k`, a vector `t · (1, 1, 1)` has that form only for `t = 0`, and
  `u(u-1)/2 ≠ 0`. The same computation on the pairs among `x_1, x_2, x_3` works for every
  `r ≥ 3`. ⚠ It proves nothing for `r = 2`, where `[x̄_1 + x̄_2, ḡ]` already sweeps out all of
  `gr_1(F) = ℤ_p [x̄_1, x̄_2]`, and the rank-two statement is false as it stands: at `u = -1` the
  diagonal map is the inversion of Layer 3.3, which is peripheral.

## Layer 1: the peripheral product identity

### 1.1 The statement

For every unit `u : ℤ_pˣ` there exist `c : Fin r → F` and `d : F` with `c 0 = 1` (when `r ≥ 1`)
and

```text
(∏_{i} (c i)⁻¹ * (x i ^[p] u) * c i) * (d⁻¹ * (cusp x ^[p] u) * d) = 1 ,
```

the product over `i` taken in order. Equivalently, for `r ≥ 1`,

```text
(x_1 ^[p] u) * ∏_{i ≥ 2} (c i)⁻¹ * (x_i ^[p] u) * c i  =  d⁻¹ * ((x_1 ⋯ x_r) ^[p] u) * d ,
```

the form in which Layer 2 reads it.

*Source:* no published source states this theorem for a free pro-`p` group without the arithmetic
detour; the classical statement (Belyi, Deligne, Ihara) obtains the automorphisms of Layer 2 from
the Galois action on the fundamental group and is recorded in Layer 5. The proof below is
self-contained and is the mathematical content of this roadmap.

### 1.2 The defect and its levels

Fix `u`. Write `Ψ (c, d) : F` for the left-hand side of the identity. `Ψ` is continuous in
`(c, d) ∈ F^r × F`, because it is a word in `c`, `d` and the fixed elements `x i ^[p] u`,
`cusp x ^[p] u`. Define the level sets

```text
S n := {(c, d) | Ψ (c, d) ∈ γ_n(F)} ,
```

with `γ_n` the closed lower central series of ProfiniteArithmetic Layer 3. Each `S n` is closed,
because `γ_n(F)` is closed and `Ψ` is continuous, and `S (n + 1) ⊆ S n`.

- **Level one.** `S 1` is everything: the image of `Ψ (c, d)` in `gr_0(F)`, the topological
  abelianization, is `u · (x̄_1 + ⋯ + x̄_r) + u · z̄ = 0`, because the abelianization kills
  conjugation, turns `^[p] u` into `u • ·` (PA-1.3, the class of a `ℤ_p`-power), and
  `z̄ = -(x̄_1 + ⋯ + x̄_r)`.
  *Needs:* PA-1.3; PA-3.2 `lcsGradedMk_conj`.

### 1.3 The correction step

**Claim.** If `(c, d) ∈ S n` with `n ≥ 1`, there are `c' : Fin r → γ_{n-1}(F)` with `c' 0 = 1` and
`d' ∈ γ_{n-1}(F)` such that `(c * c', d * d') ∈ S (n + 1)`, where `(c * c') i := c i * c' i`.

*Proof.* Write `w i := (c i)⁻¹ * (x i ^[p] u) * c i` and `w_z := d⁻¹ * (cusp x ^[p] u) * d`.
Replacing `c i` by `c i * c' i` replaces `w i` by
`(c' i)⁻¹ * w i * c' i = w i * ⁅(w i)⁻¹, (c' i)⁻¹⁆`, and the commutator lies in `γ_n(F)` because
`(c' i)⁻¹ ∈ γ_{n-1}(F)` (PA-3.1 `commutator_mem_closedLowerCentralSeries` at degrees `0` and
`n - 1`). Its class in `gr_n(F)` is `lcsBracket (lcsGradedMk (w i)⁻¹) (lcsGradedMk (c' i)⁻¹)`. The
class of `(w i)⁻¹` in `gr_0(F)` is `-(u • x̄_i)`, by `lcsGradedMk_conj` and the class of a
`ℤ_p`-power, and the class of `(c' i)⁻¹` is `-c̄'_i`, so by biadditivity the correction has class
`u • [x̄_i, c̄'_i]`. The same computation for `d` gives a correction of class `u • [z̄, d̄']`. Since
`γ_n(F)` is central modulo `γ_{n+1}(F)`, inserting these corrections into the product changes
`Ψ (c, d)` by their product modulo `γ_{n+1}(F)`, so in `gr_n(F)`

```text
class Ψ (c * c', d * d')  =  class Ψ (c, d)  +  Σ_{i ≥ 2} u • [x̄_i, c̄'_i]  +  u • [z̄, d̄'] ,
```

with `[·, ·]` the bracket `gr_0 × gr_{n-1} → gr_n` and `u •` the `ℤ_p`-action, using
`ℤ_p`-bilinearity (PA-3.2 `lcsBracket_padicPow_left`, `lcsBracket_padicPow_right`). As
`(c̄'_i)_{i ≥ 2}` and `d̄'` range over `gr_{n-1}(F)`, the right-hand correction ranges over
`u • (Σ_{i ≥ 2} [x̄_i, gr_{n-1}] + [z̄, gr_{n-1}])`.
Because `z̄ = -(x̄_1 + ⋯ + x̄_r)` and the bracket is biadditive, that submodule is
`Σ_{i} [x̄_i, gr_{n-1}]`, which is all of `gr_n(F)` by the spanning theorem in its finite form
(PA-3.3 `lcsGradedPiece_eq_sum_bracket` with the basis as generating set), and `u` is a unit.
So `c'`, `d'` can be chosen to make the class of `Ψ (c * c', d * d')` vanish, that is
`(c * c', d * d') ∈ S (n + 1)`. Lifting the classes `c̄'_i`, `d̄'` to elements of `γ_{n-1}(F)` uses
only that `lcsGradedMk` is surjective. ∎

*Needs:* PA-3.1, PA-3.2, PA-3.3; PA-1.3; M `commutatorElement_mul_left_eq_conj_mul` for the
bookkeeping of the inserted commutators.

### 1.4 Compactness and the limit

Let `T n := S n ∩ {(c, d) | c 0 = 1}` for `r ≥ 1`, and `T n := S n` for `r = 0`. Every `T n` is
closed, and nonempty by induction from 1.2 and 1.3: `T 1` contains `(1, 1)`, and the correction
step multiplies `c 0` by `c' 0 = 1`, so it carries `T n` into `T (n + 1)`. The family is
decreasing and `F^r × F` is compact, so `⋂_n T n` is nonempty
(M `IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`). For `(c, d)` in the
intersection, `c 0 = 1` and `Ψ (c, d) ∈ ⋂_n γ_n(F) = ⊥` (PA-3.1
`iInf_closedLowerCentralSeries_eq_bot`, `F` being pro-`p`), so `Ψ (c, d) = 1`. Intersecting with
`{c 0 = 1}` is what makes the limit keep the normalization; a point of `⋂_n S n` alone need not.

*Needs:* PA-3.1; M compactness of products, `IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`.

⚠ *Nearby false statement:* the identity fails for a non-unit exponent, and the failure is
visible at the second level. For `p = 2`, `r = 2` and `u = 2` the required equation
`x_1^2 * c⁻¹ x_2^2 c = d⁻¹ (x_1 x_2)^2 d` is unsolvable already in `F ⧸ γ_2(F)`: in `gr_1(F)`,
which is `ℤ_2 · [x̄_1, x̄_2]` (PA-3.4 `lcsGradedPiece_one_freeProP_bijective`), the two sides
differ by the class `[x̄_2, x̄_1]` of `(x_1 x_2)^2 (x_1^2 x_2^2)⁻¹`, which is not divisible by
`2`, while every correction lies in
`2 · gr_1(F)`. The unit hypothesis is load-bearing in 1.3, where `u • gr_n = gr_n` is used.

⚠ *Nearby false statement:* the correction step does not terminate at a finite level. `γ_n(F)`
is never trivial for `r ≥ 2`, and a solution modulo `γ_n(F)` need not lift to an exact solution
without further correction; the compactness argument of 1.4 is what produces an exact solution
from the tower of approximate ones.

## Layer 2: the peripheral-power theorem

### 2.1 The endomorphism and its values

Given `u` and the conjugators `c`, `d` of Layer 1, let `φ_u : F →* F` be the continuous
homomorphism with `φ_u (x i) = (c i)⁻¹ * (x i ^[p] u) * c i` for every `i`. It is `e.symm ∘ ψ ∘ e`,
where `ψ` is the continuous endomorphism of `TauCeti.freeProP p (Fin r)` that
`TauCeti.freeProP.lift` (with `TauCeti.isProP_freeProP`) gives on the values
`e ((c i)⁻¹ * (x i ^[p] u) * c i)`. The lift is taken into the standard model, which lies in the
universe of `Fin r`, so the universe of `F` plays no role. Since `c 0 = 1`,
`φ_u (x 0) = x 0 ^[p] u`. Then

```text
φ_u ((List.ofFn x).prod) = ∏_i (c i)⁻¹ * (x i ^[p] u) * c i = (d⁻¹ * (cusp x ^[p] u) * d)⁻¹
```

by the identity, so `φ_u (cusp x) = d⁻¹ * ((cusp x)⁻¹ ^[p] u)⁻¹ * d = d⁻¹ * (cusp x ^[p] u) * d`,
using `inv_padicPow`.

### 2.2 The endomorphism is an automorphism

The induced endomorphism of the Frattini quotient `F ⧸ proPFrattini p F ≅ (ℤ/p)^r` sends the
class of `x i` to `(toZMod u) •` its class, since conjugation is trivial modulo
`proPFrattini p F` and `x ^[p] u ≡ x ^ (u mod p)` there (PA-1.3, the class of a `ℤ_p`-power in
an elementary abelian quotient). `toZMod u` is a unit of `ZMod p`, so the induced map is
bijective; hence `φ_u` is surjective by the Burnside surjectivity criterion, bijective by the
Hopf property (`F` is topologically finitely generated), and a homeomorphism because `F` is
compact Hausdorff. So `φ_u : ContinuousAut F`.

**Theorem (peripheral power).** For every `u : ℤ_pˣ` there are `φ : ContinuousAut F`,
`c : Fin r → F` with `c 0 = 1`, and `d : F` such that
`φ (x i) = (c i)⁻¹ * (x i ^[p] u) * c i` for every `i` and
`φ (cusp x) = d⁻¹ * (cusp x ^[p] u) * d`. In particular `IsPeripheralAut x u φ`.

*Needs:* L1; TC `TauCeti.freeProP.lift`, `TauCeti.freeProP.lift_of`, `TauCeti.isProP_freeProP`,
the Burnside criterion in hom form and the Hopf property
(`TauCeti.IsProP.eq_top_of_sup_proPFrattini_eq_top`,
`TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective`); PA-1.3.

### 2.3 Transfer to other conventions

For any `q : F`, `conjugation_transfer` (BM-PC) turns `φ y = c⁻¹ * pow y * c` into the same
statement for `q * y * q⁻¹` with the computed conjugator `q * c * (φ q)⁻¹`. Applied with
`y = cusp x`, it gives the peripheral statement for every conjugate of the cusp, in particular for
the opposite-convention third element `(x_2 x_1)⁻¹ = x_1⁻¹ * (x_1 x_2)⁻¹ * x_1` when `r = 2`. The
`hpow` hypothesis of that lemma is `padicPow_conj`.

*Needs:* BM-PC `conjugation_transfer`; PA-1.3 `padicPow_conj`.

⚠ The `r + 1` conjugators are independent, and nothing asserts they coincide. For `r ≥ 2` and
`u ≠ 1` they cannot all be equal: a common conjugator `g` would make
`ψ := ContinuousAut.conj F g * φ_u` carry every `x_i` to `x_i ^[p] u` and the cusp to
`cusp x ^[p] u` exactly, so `x_1^u ⋯ x_r^u = (x_1 ⋯ x_r)^u`. Modulo `γ_2(F)` the two sides differ
by the central element of class `(u(u-1)/2) · Σ_{i<j} [x̄_j, x̄_i]`, which is nonzero in the free
`ℤ_p`-module `gr_1(F)`.

⚠ The assignment `u ↦ φ_u` of this layer is not a homomorphism, not continuous, and not
canonical: it depends on a choice of solution in Layer 1. The homomorphic statement that does
hold, on the principal units, is Layer 3.5.

## Layer 3: the group of peripheral automorphisms

### 3.1 The subgroup and its exponent

- **Closure under the group operations.** If `IsPeripheralAut x u φ` and `IsPeripheralAut x v ψ`
  then `IsPeripheralAut x (u * v) (φ * ψ)`, by naturality of the power under `φ`
  (`map_padicPow`) and transitivity of `IsConj`; and `IsPeripheralAut x u⁻¹ φ⁻¹`, by applying
  `φ⁻¹` to `φ y = c⁻¹ * (y ^[p] u) * c`, taking `u⁻¹`-th powers (`padicPow_units_inv`) and using
  that a `u`-th power determines its base (`padicPow_units_injective`).
- **The subgroup.** `peripheralAut x : Subgroup (ContinuousAut F)` is the set of `φ` for which some
  `u` has `IsPeripheralAut x u φ`; it contains the range of `ContinuousAut.conj`.
- **The exponent.** `exponent x : peripheralAut x →* ℤ_pˣ` sends `φ` to the unique `u` of Layer 0;
  it is a homomorphism by the closure computation, and its kernel is the subgroup of peripheral
  automorphisms of exponent one, which contains the inner automorphisms.
- **Surjectivity.** `exponent x` is surjective, by Layer 2.
  *Needs:* L0, L2; PA-1.3 `map_padicPow`, `padicPow_units_inv`, `padicPow_units_injective`;
  M `IsConj.trans`, `isConj_iff`.

### 3.2 Topology

- **The graph.** The set `R` of pairs `(φ, u)` with `IsPeripheralAut x u φ` is closed in
  `ContinuousAut F × ℤ_pˣ` (`isClosed_peripheralGraph`). For each element `y` of the peripheral
  tuple, the condition `IsConj (y ^[p] u) (φ y)` is the preimage of the set of conjugate pairs of
  `F`, closed in `F × F` (PA-2.2 `isClosed_isConj_pair`), under the map
  `(φ, u) ↦ (y ^[p] u, φ y)`, which is continuous (PA-2.2 `ContinuousAut.continuous_eval`, PA-1.3
  `continuous_padicPow`). Both coordinates vary with `(φ, u)`, which is why the binary relation is
  the input. `R` is the intersection of these `r + 1` closed sets. Since `ContinuousAut F` is
  profinite (PA-2.2 `ContinuousAut.compactSpace`) and `ℤ_pˣ` is compact, `R` is compact.
- **Closedness.** `peripheralAut x` is the image of `R` under the first projection, a compact and
  hence closed subset of the Hausdorff space `ContinuousAut F` (`isClosed_peripheralAut`). So
  `peripheralAut x` is a profinite group.
- **Continuity of the exponent.** For `r > 0` the first projection `R → peripheralAut x` is a
  continuous bijection, surjective by the definition of `peripheralAut x` and injective by the
  uniqueness of the exponent (Layer 0). Its source is compact and its target Hausdorff, so it is a
  homeomorphism, and `exponent x` is the second projection composed with its inverse, hence
  continuous (`continuous_exponent`). No finite quotient of `F` is needed.
  *Needs:* L0 `exponent_unique`; PA-2.2 `ContinuousAut.compactSpace`, `ContinuousAut.t2Space`,
  `ContinuousAut.continuous_eval`, `isClosed_isConj_pair`, each applied with the topological
  finite generation of `F` (TC `TauCeti.isTopologicallyFinitelyGenerated_freeProP`, transported
  along `e` by `TauCeti.isTopologicallyFinitelyGenerated_congr`); PA-1.3
  `continuous_padicPow`; M `IsClosed.preimage`, `isClosed_iInter`, `IsCompact.image`,
  `IsCompact.isClosed`, `Continuous.homeoOfEquivCompactToT2`.

### 3.3 The reflection

- **Exponent `-1`.** `reflect x : ContinuousAut F` is the automorphism with
  `x_i ↦ (x_1 ⋯ x_{i-1}) * x_i⁻¹ * (x_1 ⋯ x_{i-1})⁻¹` for every `i` (so `x_1 ↦ x_1⁻¹`). Then
  `(x_1 ⋯ x_r) ↦ (x_1 ⋯ x_r)⁻¹` exactly, so `reflect x (cusp x) = (cusp x)⁻¹`, and
  `IsPeripheralAut x (-1) (reflect x)` with every conjugator explicit. It is an involution.
- **The rank-two inversion.** For `r = 2`, the automorphism `x_1 ↦ x_1⁻¹`, `x_2 ↦ x_2⁻¹` is also
  peripheral of exponent `-1`, with `cusp x = (x_1 x_2)⁻¹ ↦ x_2 x_1 = x_1⁻¹ * (x_1 x_2) * x_1`, so
  the conjugator on the cusp is `x_1`. This is the element that the arithmetic theory attaches to
  complex conjugation.
  *Needs:* L0; L2.2 for the automorphism property; M `List.ofFn`.

  ⚠ *Nearby false statement:* for `r ≥ 3` the inversion `x_i ↦ x_i⁻¹` of every generator is not
  peripheral. It sends `x_1 x_2 x_3` to `(x_3 x_2 x_1)⁻¹`, and `x_3 x_2 x_1` is not conjugate to
  `x_1 x_2 x_3` even in `F ⧸ γ_2(F)`: their classes differ in `gr_1(F) ≅ Λ² ℤ_p^3` by
  `[x̄_1, x̄_2] + [x̄_1, x̄_3] + [x̄_2, x̄_3]`, and no element of the form `[x̄_1 + x̄_2 + x̄_3, ḡ]` has
  those coefficients. The reflection above is the correct general form.

### 3.4 Permutation symmetries

- **The predicate with a permutation.** `IsPeripheralPermAut x σ u φ`, for
  `σ : Equiv.Perm (Fin (r + 1))`, says `IsConj (peripheralTuple x (σ i) ^[p] u) (φ (peripheralTuple x i))`
  for every `i`. The automorphisms satisfying it for some `(σ, u)` form a subgroup
  `peripheralPermAut x`: if `φ` has data `(σ, u)` and `ψ` has `(τ, v)`, then `φ * ψ` has
  `(σ * τ, u * v)` and `φ⁻¹` has `(σ⁻¹, u⁻¹)`.
- **The data is determined in rank at least two.** For `r ≥ 2`, `φ` determines `σ` and `u`
  (`IsPeripheralPermAut.unique`). In `gr_0(F) ≅ ℤ_p ^ r` (PA-3.4
  `lcsGradedPiece_zero_freeProP_bijective`) two sets of data give `u · t̄_{σ i} = u' · t̄_{σ' i}`
  for every `i`, where `t̄_0, …, t̄_r` are the classes of the peripheral tuple; and when `r ≥ 2`
  any two distinct classes among `x̄_1, …, x̄_r` and `z̄ = -(x̄_1 + ⋯ + x̄_r)` are
  `ℤ_p`-independent, so `σ = σ'`, and then `u = u'`. Hence the data define a homomorphism
  `permData : peripheralPermAut x →* Equiv.Perm (Fin (r + 1)) × ℤ_pˣ`
  (`isPeripheralPermAut_permData`), whose kernel is the exponent-one, permutation-free part.

  ⚠ *Nearby false statement:* in rank one the data is not determined, and there is no such
  homomorphism. For `r = 1` the peripheral tuple is `(x, x⁻¹)`, and the automorphism
  `x ↦ x ^[p] u` of `F ≅ ℤ_p` is permutation-peripheral both for `(1, u)` and for
  `(swap 0 1, -u)` (`exists_isPeripheralPermAut_swap_rank_one`).
- **Rank two.** The swap `x_1 ↦ x_2`, `x_2 ↦ x_1` is peripheral for the transposition of the
  first two classes, with `cusp x = (x_1 x_2)⁻¹ ↦ (x_2 x_1)⁻¹ = x_1⁻¹ * cusp x * x_1`. The rotation
  `x_1 ↦ x_2`, `x_2 ↦ cusp x` sends `cusp x` to `x_1` exactly and is peripheral for the
  three-cycle. Both have exponent `1`, and together with the inner automorphisms and the
  reflection they generate the image of the discrete mapping class group of the thrice-punctured
  sphere.
  *Needs:* L0; L2.2; PA-3.4 `lcsGradedPiece_zero_freeProP_bijective`; M `Equiv.Perm`, `Fin.snoc`.

### 3.5 The section over the principal units

- **The principal units.** Let `k = 1` for `p` odd and `k = 2` for `p = 2`, and let
  `U := TauCeti.unitsPrincipal p k`, the subgroup `1 + p^k ℤ_p` of `ℤ_pˣ`: Tau Ceti's generic
  principal units, of which ProfiniteProPGroups' dyadic `unitsPrincipal 2` is the case `p = 2`.
  `U` is closed, open and pro-`p` (`TauCeti.isClosed_unitsPrincipal`,
  `TauCeti.isOpen_unitsPrincipal`, `TauCeti.isProP_unitsPrincipal`).
- **Its parameterization.** The unit `w := 1 + p^k` has exact level `k`: `p^k` divides `w - 1` and
  `p^(k+1)` does not (`TauCeti.mem_unitsPrincipal_iff`), because `w - 1 = p` for odd `p` and
  `w - 1 = 4` for `p = 2`, where `w = 5`. So `w` topologically generates `U`
  (`TauCeti.topologicalClosure_zpowers_eq_unitsPrincipal`, whose hypotheses `0 < k` and
  `p = 2 → 2 ≤ k` hold), and `l ↦ w ^[p] l` is a topological isomorphism
  `principalUnitsEquiv : Multiplicative ℤ_[p] ≃ₜ* U` with `ofAdd 1 ↦ w`
  (`principalUnitsEquiv_ofAdd_one`). It is onto because `w` generates `U`. It is injective because
  a nonzero exponent is `p ^ j v` with `v` a unit (`PadicInt.unitCoeff`, `PadicInt.unitCoeff_spec`,
  with `j` the valuation), and `w ^ p ^ j` lies in `U^(k+j)` but not in
  `U^(k+j+1)` (`TauCeti.pow_pow_mem_unitsPrincipal`, `TauCeti.pow_pow_notMem_unitsPrincipal`), so
  it is not `1`, while `u`-th powers for a unit `u` are injective (PA-1.3). A continuous bijection
  from the compact group `ℤ_p` onto the Hausdorff group `U`, it is a homeomorphism. Its inverse `λ`
  is a continuous homomorphism with `w ^[p] λ(v) = v`.
-  **The carrier.** `peripheralAut x` is profinite (3.2) but not pro-`p` for odd `p`: the exponent
  maps it onto `ℤ_pˣ`, which contains `μ_{p-1}`. So `^[p]` is not available in it. Choose one
  peripheral automorphism `φ` of exponent `w` (Layer 2) and let `q := φ ^ᶻ ω_p` be its `p`-part in
  the profinite group `peripheralAut x` (PA-1.2), where `ω_p = zHat.idem p` is the `p`-adic
  idempotent of `ẑ = Additive TauCeti.zHat` (PA-0.3) and `^ᶻ` is `TauCeti.zHat.lift` (PA-1.1). The
  closed procyclic subgroup `Q := closedZpowers q` is pro-`p` (PA-1.2
  `isProP_closedZpowers_zpowHat_idem`) and lies in `peripheralAut x`, which is closed. All
  `ℤ_p`-powers below are taken in `Q`.
-  **The section.** By naturality of `^ᶻ` under the continuous homomorphism `exponent` (PA-1.1
  `map_zpowHat`), `exponent q = w ^ᶻ ω_p = w`, the last step because `w` lies in the pro-`p` group
  `U` (PA-1.2 `zpowHat_idem_of_isProP`). So `exponent` restricts to a continuous homomorphism
  `Q → U` between pro-`p` groups. Define `section x : U →* peripheralAut x` as the composite of
  three continuous homomorphisms: `λ : U → Multiplicative ℤ_[p]`; `l ↦ q ^[p] l` into `Q` (Tau
  Ceti's `TauCeti.IsProP.padicPowHom` for `Q`); and the inclusion `Q → peripheralAut x`. Then
  `exponent (section x v) = w ^[p] λ(v) = v`, by naturality of `^[p]` under `Q → U` (PA-1.3
  `map_padicPow`). This is `exists_section_principalUnits`.
  *Needs:* L2, L3.1, L3.2; PA-0.3 `zHat.idem`; PA-1.1 `zpowHat`, `map_zpowHat`;
  PA-1.2 `closedZpowers`, `isProP_closedZpowers_zpowHat_idem`, `zpowHat_idem_of_isProP`;
  PA-1.3 `padicPow`, `map_padicPow`; TC `TauCeti.unitsPrincipal` and the API above,
  `TauCeti.IsProP.padicPowHom`; M `PadicInt.unitCoeff`, `PadicInt.unitCoeff_spec`.

  ⚠ No milestone asserts a homomorphic section over all of `ℤ_pˣ`. Over the torsion subgroup
  `μ_{p-1}` (for `p` odd) or `{±1}` (for `p = 2`) a section is a peripheral automorphism of finite
  order with the given exponent; the reflection provides one for `-1`, and nothing here claims
  compatibility between that choice and the section over `U`.

## Layer 4: the dyadic instance

- **The carrier.** `p = 2`, `r = 2`, `F` with `e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)`, and
  `P := basis e 0`, `T := basis e 1`, `C := (P * T)⁻¹ = cusp (basis e)`, so that `P * T * C = 1`.
  The maximal pro-`2` quotient of Tau Ceti's free profinite group on two generators,
  `TauCeti.maximalProPQuotient 2 (TauCeti.freeProfiniteGroup (Fin 2))`, is
  `TauCeti.freeProP 2 (Fin 2)` by definition, so `e` may be the identity for that carrier.
- **The theorem, in consumer shape.** For every `u : ℤ_[2]ˣ` there are `φ : ContinuousAut F` and
  `cP cT cC : F` with
  `φ P = cP⁻¹ * (P ^[2] u) * cP`, `φ T = cT⁻¹ * (T ^[2] u) * cT`, `φ C = cC⁻¹ * (C ^[2] u) * cC`,
  and moreover `cP = 1`. This is Layer 2 at `r = 2`.
- **The identity form.** For every `u : ℤ_[2]ˣ` there are `cP cT cC : F` with
  `cP⁻¹ * (P ^[2] u) * cP * (cT⁻¹ * (T ^[2] u) * cT) * (cC⁻¹ * (C ^[2] u) * cC) = 1`. This is
  Layer 1 at `r = 2`, and it is the statement the `G_{ℚ_2}` formalization consumes from its
  peripheral input; that formalization states it with a profinite exponent `ι(u) ∈ ẑ` whose
  `2`-adic component is `u`, which ProfiniteArithmetic's comparison `zpowHat_eq_padicPow_component`
  converts to the form here.
- **The opposite convention.** For `C' := (T * P)⁻¹ = P⁻¹ * C * P`, the same `φ` satisfies
  `φ C' = cC'⁻¹ * (C' ^[2] u) * cC'` with `cC' := P⁻¹ * cC * (φ P⁻¹)⁻¹`, by `conjugation_transfer`
  at `q = P⁻¹`, `y = C`. Both conventions are stated, so that neither consumer needs new
  mathematics.
- **The dyadic section.** Layer 3.5 at `p = 2`: a continuous homomorphic section of the exponent
  over `TauCeti.unitsPrincipal 2 2 = 1 + 4ℤ₂`, topologically generated by `5`.
  *Needs:* L1, L2, L3.5; TC `TauCeti.freeProP`, `TauCeti.unitsPrincipal`; BM-PC
  `conjugation_transfer`, `opposite_third_peripheral`.

  ⚠ The three conjugators are independent, and the theorem is stated for every unit; both
  points are inherited from Layer 2, and neither is weakened here.

## Layer 5: what the arithmetic route adds, and where it lives

This section is a roadmap-for-a-roadmap. **Contributors should not attempt it here**; it records
the boundary with the arithmetic successor of BelyiMaps so that the two roadmaps stay consistent.

The arithmetic theory attaches to every `σ ∈ Gal(ℚ̄/ℚ)` a peripheral automorphism of the
profinite fundamental group of `ℙ¹ ∖ {0, 1, ∞}`, well defined up to inner automorphisms, of
exponent the cyclotomic character `χ(σ)`. Descending to the maximal pro-`p` quotient gives a
homomorphism `Gal(ℚ̄/ℚ) →* ContinuousOut F` landing in the image of `peripheralAut x`, with
`exponent ∘ ρ = χ_p`; surjectivity of `χ_p` then recovers Layer 2 by choosing a representative,
which is BelyiMaps' peripheral-power theorem (its Layer 13.3). That route supplies what Layer 2
does not: a homomorphism in `σ`, its compatibility with the whole tower of covers, and the
Grothendieck–Teichmüller relations satisfied by the conjugators. None of that is a target here,
and Layer 2 is not a substitute for it where a consumer needs the Galois action itself.

## Worked examples

- `r = 1`: `F = ℤ_p`, `cusp x = x_1⁻¹`, and every unit power map is peripheral with trivial
  conjugators; `peripheralAut x = ContinuousAut F ≅ ℤ_pˣ`.
- `r = 2`, `u = -1`: the inversion `x_1 ↦ x_1⁻¹`, `x_2 ↦ x_2⁻¹` with cusp conjugator `x_1`, and
  the reflection with `x_2 ↦ x_1 x_2⁻¹ x_1⁻¹` and cusp conjugator `1`.
- `r = 2`, `p = 2`, `u = 3`, modulo `γ_2(F)`: the correction step of Layer 1.3 solved by hand in
  `gr_1(F) = ℤ_2 [x̄_1, x̄_2]`, with the coefficient `u(u-1)/2 = 3` absorbed by `c̄'_2`.
- The dyadic instance with `F = TauCeti.freeProP 2 (Fin 2)` and `e` the identity.

## Ordering and parallel work

Layer 0 needs Tau Ceti's free pro-`p` groups and ProfiniteArithmetic Layers 1 and 2. Layer 1 needs
Layer 0 and ProfiniteArithmetic Layer 3; its three parts are sequential. Layer 2 needs Layer 1 and
Tau Ceti's Frattini, Burnside and Hopf theorems. Layer 3.1 needs Layer 2; 3.2 needs 3.1 and
ProfiniteArithmetic 2.2; 3.3 and 3.4 need only Layer 0 and the automorphism criterion of 2.2, and
can be done alongside Layer 1; 3.5 needs 3.1, 3.2 and ProfiniteArithmetic 1.2. Layer 4 is the
specialization of Layers 1, 2 and 3.5 and needs nothing further. Layer 5 is not work.

## Acceptance checklist

- The cusp is the inverse of the ordered product of the basis, and the relation
  `(List.ofFn x).prod * cusp x = 1` is definitional.
- `IsPeripheralAut` is stated with `IsConj`; the constructive theorems of Layers 2 and 4 state
  their conjugators explicitly and record `c 0 = 1`.
- The peripheral product identity is proved by the closed lower central series of
  ProfiniteArithmetic, with the correction step and the compactness step as separate theorems, and
  with the unit hypothesis used exactly in the correction step.
- The automorphism property in Layer 2.2 is derived from the Burnside surjectivity criterion and
  the Hopf property, as ProfiniteProPGroups specifies them and Tau Ceti implements them, applied
  to Tau Ceti's declarations directly and not restated.
- Free pro-`p` groups, pro-`p` groups and topological finite generation are Tau Ceti's
  declarations (`TauCeti.freeProP`, `TauCeti.IsProP`, `TauCeti.IsTopologicallyFinitelyGenerated`),
  and the finite generation of `F` is Tau Ceti's theorem for the standard model transported along
  `e`, not an assumption.
- `peripheralAut x` is a subgroup with a closed proof of closure under composition and inversion,
  `exponent x` is a homomorphism with a closed proof of well-definedness for `r ≥ 1`, and
  closedness in the congruence topology is a theorem.
- The reflection is defined for every rank with explicit conjugators, and the rank-three failure
  of plain inversion is a proved nearby-false statement.
- The section over the principal units is a composite of named continuous homomorphisms: the
  inverse of `principalUnitsEquiv` on Tau Ceti's `unitsPrincipal`, the `ℤ_p`-power taken in the
  pro-`p` subgroup `closedZpowers q`, and the inclusion. No `ℤ_p`-power is taken in
  `peripheralAut x` itself, and no section over all of `ℤ_pˣ` is claimed.
- The continuity of the exponent is proved from the closed graph `isClosed_peripheralGraph` and
  compactness, with no finite quotient of `F`.
- The permutation-and-exponent homomorphism `permData` is defined only for `r ≥ 2`, where
  `IsPeripheralPermAut.unique` holds; the rank-one failure is a stated nearby-false statement.
- There is no local principal-unit subgroup: `U` is Tau Ceti's `TauCeti.unitsPrincipal`.
- The dyadic instance states both conventions for the third element and the identity form, and
  imports `conjugation_transfer` from BelyiMaps rather than reproving it.
- Nothing in the roadmap mentions a Galois group, a fundamental group or a cyclotomic character
  except in Layer 5, which is marked as not for contributors.

## References

- G. V. Belyi, "On Galois extensions of a maximal cyclotomic field", Izv. Akad. Nauk SSSR 43
  (1979), for the embedding of `Gal(ℚ̄/ℚ)` into the outer automorphisms of the free profinite
  group of rank two through the peripheral structure.
- P. Deligne, "Le groupe fondamental de la droite projective moins trois points", in *Galois
  Groups over ℚ*, MSRI Publ. 16 (1989), for the arithmetic origin of the peripheral action.
- Y. Ihara, "Braids, Galois groups, and some arithmetic functions", Proc. ICM Kyoto 1990,
  99–120, for the normalization `x ↦ x^λ`, `y ↦ f⁻¹ y^λ f` of a peripheral automorphism and the
  role of the third conjugacy class.
- V. G. Drinfeld, "On quasitriangular quasi-Hopf algebras and on a group that is closely
  connected with `Gal(ℚ̄/ℚ)`", Leningrad Math. J. 2 (1991), 829–860, for the
  Grothendieck–Teichmüller relations, which Layer 5 names and this roadmap does not build.
- H. Nakamura, "Galois rigidity of pure sphere braid groups and profinite calculus", J. Math.
  Sci. Univ. Tokyo 1 (1994), 71–136, for the profinite calculus of peripheral elements in the
  rank-two case.
- J. Stix, "On cuspidal sections of algebraic fundamental groups", in *Galois–Teichmüller Theory
  and Arithmetic Geometry*, ASPM 63 (2012), 519–563, Definition 37, for the cyclotomic action on
  cuspidal inertia in the arithmetic route.
- T. Szamuely, *Galois Groups and Fundamental Groups*, CSAM 117, CUP 2009, §4.7, for the
  arithmetic exact sequence and the outer action, the subject of the BelyiMaps successor.
- L. Ribes, P. Zalesskii, *Profinite Groups*, 2nd ed., §4.5 for the automorphism group of a free
  pro-`p` group, Prop. 2.5.2 for the Hopf property, and Prop. 2.8.7 for the Frattini generation
  criterion, both consumed from Tau Ceti.
- M. Lazard, "Sur les groupes nilpotents et les anneaux de Lie", Ann. Sci. École Norm. Sup. 71
  (1954), and J.-P. Serre, *Lie Algebras and Lie Groups*, Part I, Chapter IV, for the graded Lie
  ring of the lower central series used in Layer 1.
