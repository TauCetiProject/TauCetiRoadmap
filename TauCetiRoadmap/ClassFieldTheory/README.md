# Roadmap: class field theory

## Purpose

The central object of this roadmap is an **abstract class formation** in the sense of
Artin–Tate. The build is organised around the implication

```text
formation
  -> class-formation axioms
  -> fundamental classes
  -> Tate's theorem
  -> finite-level Artin maps.
```

An invariant map is *data*, so each arithmetic instance begins by constructing its invariant and
only then satisfies the axioms. The two instances therefore run

```text
local Brauer group, invariant, Hilbert symbol, local duality
  -> local class formation
  -> local reciprocity
  -> local existence
  -> the local Weil group
```

and

```text
Brauer exact sequence, sum of local invariants
  -> global class formation
  -> global reciprocity
  -> global existence and the class-field correspondence
  -> norm theorems, class fields, Hilbert reciprocity.
```

The global strand is for **number fields**: its carriers are the idele and idele-class groups of a
number field, and global class field theory for one-variable function fields over finite fields is
outside this roadmap (§1). Both strands end at a *correspondence*, not at an existence statement:
the class field attached to a norm subgroup is the unique **abelian** layer with that norm
subgroup, and the existence theorems below are stated so that they cannot return anything else.

The invariant never appears twice: the object a class formation is built from is not also a
theorem proved after it.

This is not a roadmap for constructing another cohomology theory. Finite-group Tate cohomology
already exists in Mathlib (`Mathlib/RepresentationTheory/Homological/TateCohomology`) and in the
`kbuzzard/ClassFieldTheory` development, and continuous cohomology of profinite groups is
supplied by `ProfiniteCohomology`. This roadmap must use those objects. Any missing cup product,
change-of-groups map, or low-degree comparison is to be added to the generic cohomology supplier,
in the appropriate Mathlib namespace, rather than introduced as a private class-field-theory
replacement.

The abstract formalism is not decorative. The local and global Artin maps constructed later in
the roadmap must be obtained from the same degree `-2` to degree `0` Tate isomorphism.
This fixes the map, its functoriality, and its sign convention before any arithmetic calculation
is made. Everything downstream — local duality, Hilbert symbols, conductors, the Hasse norm
theorem, class fields, Hilbert reciprocity — is then stated against that one map.

Suggested home:

```text
TauCeti/NumberTheory/ClassFieldTheory/
  Formation/
  TateTheorem/
  Reciprocity/
  LocalInvariants/
  Local/
  LocalExistence/
  WeilGroup/
  GlobalInvariants/
  Global/
  GlobalExistence/
  ClassFields/
```

The representative signatures are in `Suggested.lean`. That file pins the structures and maps on
which the rest of the development depends, the transparent definitions which fix the direction of
the Artin map, and the acceptance tests of §5; it does not try to list every theorem of local and
global class field theory.

---

## 1. Scope and ownership

### Owned here

This roadmap owns the following constructions and theorems.

1. The modern topological form of an Artin–Tate formation: a profinite group `G`, a discrete
   continuous `G`-module `A`, its levels `A^U` for open subgroups `U`, and finite normal layers
   `V ◁ U`.
2. The class-formation axioms on the finite layers: vanishing of `H¹`, invariant maps on `H²`,
   their normalization, and their compatibility under restriction, inflation, and conjugation.
3. The canonical fundamental class of every finite normal layer, characterized by invariant
   `1 / [U : V]`.
4. The application of Tate's theorem to a class formation, giving cup-product isomorphisms in
   every integer degree (Artin–Tate's Main Theorem).
5. The finite-level Artin equivalence

   ```text
   A^U / N_{U/V}(A^V)  ≃  (U / V)^ab
   ```

   and the Artin map on `A^U`. These are definitionally derived from the inverse of the
   Tate isomorphism in degrees `-2` and `0`.
6. Functoriality of the Artin map in towers, under conjugation, and under passage to a quotient.
7. The local Brauer group on the imported continuous carrier, its invariant map, and the
   cohomological local Hilbert symbol built from Kummer classes, the continuous cup product,
   and the invariant; bilinearity and the Steinberg relation.
8. Local Tate duality for the named evaluation pairing, finiteness of `H⁰`, `H¹`, `H²`, and
   the local Euler-characteristic formula, in cardinality and `𝔽_p`-rank form.
9. The local class formation — built *from* the invariant map of item 7 — local Artin
   reciprocity, and the arithmetic-Frobenius normalization; the absolute local Artin map into the
   topological abelianization of `G_K`, its unramified coordinate and cyclotomic-character
   normalization; local conductors.
10. The abelian-layer condition on an open normal subgroup, the canonical maximal abelian
    sublayer, and the norm limitation theorem saying that a layer and its maximal abelian sublayer
    have the same norm subgroup.
11. Local existence for a finite **abelian** layer, uniqueness of that layer, and the local
    class-field correspondence with its quotient isomorphism and degree equality — with the full
    correspondence in mixed characteristic and only the prime-to-residue-characteristic part in
    equal characteristic.
12. The local Weil group as a full development: its carrier inside `G_K`, its own locally compact
    topology, functoriality under finite extensions, the exact sequence `1 → I_K → W_K → ℤ → 1`,
    and the topological abelianization isomorphism `Kˣ ≃ W_K^ab`.
13. The archimedean local invariants, the exact sequence
    `0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0` in invariant coordinates, and the sum-of-local-invariants
    map on the idele layers.
14. The global idele-class formation — whose invariant *is* the sum-of-local-invariants map of
    item 13 — global Artin reciprocity, and comparison with the unique ideal-theoretic Artin map
    supplied by `NumberFieldArithmetic`.
15. Global existence for a finite **abelian** layer over a number field, uniqueness of that
    layer, the global class-field correspondence with its quotient isomorphism and degree
    equality, and the norm-index theorem.
16. The cyclic Hasse norm theorem; the Hilbert, narrow Hilbert and ray class fields, each
    obtained by applying the correspondence of item 15 to a named norm subgroup;
    Kronecker–Weber; the conductor–discriminant formula; and, for an order in a **quadratic**
    field, its ring class field and the isomorphism `Gal(H_O/K) ≃ Pic O`. No ring class field of a
    general nonmaximal order in a field of degree greater than two is asserted (§4, Layer 13).
17. Hilbert reciprocity (`hilbertProductFormula`), derived from item 13, with quadratic
    reciprocity as the explicit reciprocity law derived from it.

### Consumed, not redefined

| Material | Supplier |
|---|---|
| Integer-graded finite-group Tate cohomology, its long exact sequence, and its comparison with ordinary cohomology and homology | Mathlib `RepresentationTheory/Homological/TateCohomology` and the Richard Hill workshop development |
| Restriction, corestriction, inflation, cup products, and low-degree Tate descriptions | Generic Tate-cohomology files, porting usable material from `kbuzzard/ClassFieldTheory` where necessary |
| Continuous cohomology of profinite groups, continuous cup products, Kummer theory, degree casts, and the finite-quotient colimit | `ProfiniteCohomology` |
| Profinite groups, open subgroups, finite quotients, and abelianization | Mathlib and the profinite-group roadmaps |
| Local fields, valuations, unit filtrations, norms, ramification, and arithmetic Frobenius | `LocalFieldsRamification` |
| Number fields, places, completions, ideles, idele classes, moduli, ray classes, weak approximation, orders, and Picard groups | `GlobalNumberFields` |
| Frobenius classes and the ideal-theoretic Artin map away from ramified primes | `NumberFieldArithmetic` |

The existing files

```text
Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean
ClassFieldTheory/Cohomology/TateCohomology.lean
ClassFieldTheory/Cohomology/Functors/Restriction.lean
ClassFieldTheory/Cohomology/Functors/Corestriction.lean
ClassFieldTheory/Cohomology/Functors/Inflation.lean
```

are the starting point for the finite-group audit. The Edison Xie/Richard Hill continuous
cohomology and cup-product work, including the versions used in the FLT repository, is the
starting point for the profinite audit.

### Consumers and boundaries with neighbouring roadmaps

- `ProfiniteCohomology` owns continuous cohomology of profinite groups, its explicit low-degree
  models, continuous cups, change-of-group maps, Kummer theory, and the finite-quotient colimit;
- `LocalFieldsRamification` owns valuations, unit and ramification filtrations, arithmetic
  Frobenius, conductors that are purely ramification-theoretic, and the tame quotient;
- `GlobalNumberFields` owns places, mixed weak approximation, moduli, ray and narrow class
  groups, adeles, ideles, Hecke-character carriers, infinity types, number-field orders, `Pic`,
  and `NarrowPic`;
- `NumberFieldArithmetic` owns finite-place Frobenius and the ideal-theoretic Artin map
  `artinHomAway` on `idealsAway`;
- `LocalGaloisGroups` consumes the complete local-cohomological row of this roadmap —
  `normResidue`, `artinMap`, `unramifiedCoordinate`, `cyclotomicCharacter_artinMap`,
  `tateDualityPairing_perfect_mixed`, `finite_H`, `eulerCharacteristic_finrank_fp` — without
  constructing private stand-ins;
- `GlobalQuadraticForms` owns Hasse–Minkowski and the global classification of quadratic
  forms, and consumes `hilbertProductFormula`;
- `QuadraticFormInvariants` owns the norm-equation and quaternion presentations of local
  Hilbert symbols and proves that they agree with the cohomological `localSymbol` exported here.

Consequently this roadmap defines no modulus, ray-class carrier, idele carrier, Hecke character,
order, Picard group, local quadratic-form invariant, or global quadratic form. It has no
dependency on `QuadraticFormInvariants` or on pro-`p` group theory. The Hilbert pairing is defined
here from Kummer classes, the continuous cup product, and the local invariant map; the product
formula is proved cohomologically. This fixes the dependency direction
`ClassFieldTheory → QuadraticFormInvariants`, never the reverse.

### Explicitly outside this roadmap

- global Weil groups and Weil's construction of the Weil group of a class formation (Artin–Tate
  XV; the local Weil group is a full layer of this roadmap, §4 Layer 9);
- explicit power-reciprocity laws beyond quadratic reciprocity (Artin–Tate XII);
- Lubin–Tate theory, formal groups, and any construction of local class field theory not routed
  through the class formation. Local existence (§4, Layer 8) is proved from the norm topology, the
  norm-limitation theorem and the Kummer theory of Layer 5, never from Lubin–Tate formal groups;
  no target of this roadmap names a Lubin–Tate object;
- Artin–Schreier–Witt theory, hence `p`-primary local existence in equal characteristic `p`;
- global class field theory for one-variable function fields over finite fields. The global
  formation, ideles, reciprocity, existence, and class-field correspondence developed here are for
  **number fields**: every global target carries `NumberField K` and is stated on the number-field
  idele and idele-class carriers of `GlobalNumberFields`. Nothing here is to be read as covering
  all global fields;
- Hasse–Minkowski, the classification of global quadratic forms, and the norm-equation and
  quaternion presentations of Hilbert symbols;
- pro-`p` group theory and the Demushkin structure of local Galois groups.

---

## 2. Mathematical conventions

### 2.1 Formations

Artin–Tate describe a formation by a group `G`, a distinguished family of finite-index subgroups,
and a `G`-module `A` whose elements are fixed by sufficiently small subgroups. In the classical
applications the distinguished subgroups are the open subgroups of a profinite Galois group. The
Lean definition therefore uses the equivalent topological formulation:

- `G` is profinite;
- `A` is a discrete continuous additive `G`-module, i.e. a smooth discrete `TopRep ℤ G` in the
  sense of `ProfiniteCohomology`;
- for an open subgroup `U`, the level is `A^U`;
- a finite normal layer is a pair of open subgroups `V ≤ U` such that `V` is normal in `U`;
- its finite Galois group is `Γ = U / V`, finite because `V` is open in the compact group `U`;
- its coefficient module is `A^V`, with the induced `Γ`-action;
- its ground level is `(A^V)^Γ = A^U`.

The additive convention is used in the abstract theory. Multiplicative groups such as `Kˣ` and
idele class groups enter through `Additive` adapters. No theorem should depend on silently
switching between the two conventions.

**Universe.** Mathlib's `tateCohomology` requires the finite group and the coefficient ring `ℤ`
to live in one universe, so the whole development is stated at universe `0` (`G : Type`,
`K : Type`). This is the same restriction the previous version of the roadmap made for its private
Tate carrier; it disappears only if Mathlib generalizes the Tate complex.

### 2.2 Class formations

For every finite normal layer `V ◁ U`, put `Γ = U / V` and `C = A^V`. A class formation supplies
the following data and axioms.

1. `H¹(Γ, C) = 0`.
2. An injective invariant homomorphism

   ```text
   inv_{U,V} : H²(Γ, C) → ℚ/ℤ.
   ```

3. Its image is the unique subgroup of `ℚ/ℤ` of order `[U : V]`.
4. If the ground subgroup is replaced by an intermediate open subgroup, restriction multiplies
   the invariant by the relative degree.
5. Enlarging the top field, equivalently inflating to a refinement of the layer, does not change
   the invariant.
6. Conjugation carries the invariant map for one layer to that for the conjugate layer.

The fourth condition is the finite-layer form of

```text
inv_E (res_{F,E} x) = [E : F] · inv_F(x).
```

The fifth condition is made explicit in Lean even when it is suppressed in classical notation,
because the notation `inv_F` there comes from a single map on a direct-limit Brauer group.

These axioms stop at Tate's theorem and reciprocity. They do **not** imply an abstract existence
theorem. This roadmap therefore has no `ClassFormation`-level existence declaration: local and
global existence are separate arithmetic theorems whose proofs establish the relevant topology,
divisibility, and norm-limitation inputs in their own settings. In Artin–Tate's organization these
are the additional hypotheses IIIa–IIId, not consequences of the class-formation axioms.

### 2.3 Fundamental classes

If the layer has degree `n`, the invariant axioms imply that `H²(Γ,C)` is cyclic of order `n`.
Its **fundamental class** is the unique element

```text
u_{U,V} : H²(Γ,C)
```

with invariant `1/n` in `ℚ/ℤ`. It is derived from the invariant map; it is not an independent
field of `ClassFormation` and it is never chosen arbitrarily.

The first compatibility theorem is

```text
res(u_{U,V}) = u_{U',V}
```

for an intermediate ground subgroup `V ≤ U' ≤ U`. For a refinement of the top subgroup, the
inflation formula is scaled: `inf(u_{U,V}) = [V : V'] · u_{U,V'}`. Corestriction goes the other
way and is scaled by the relative degree: `cor(u_{U',V}) = [U : U'] · u_{U,V}`, while it preserves
invariants (`inv_cor`). ⚠ The index is `[U : U']`, not `[U' : U]`: `U'` is the *sub*group, so
`[U : U']` is the relative field degree `[E : F]`, which is what `fundamentalClass_cor` calls
`T.relativeDegree`. The invariant normalization forces it — `inv(u_{U',V}) = 1/[U' : V] =
[U : U']/[U : V]`, and corestriction preserves invariants. These statements are needed to apply Tate's theorem to every subgroup
of `Γ`.

### 2.4 Tate's theorem and its Tate–Nakayama generalization

The generic finite-group theorem to be supplied is Tate's theorem (J. Tate, *The higher
dimensional cohomology groups of class field theory*, Ann. of Math. 56, 1952). Let `Γ` be
finite, let `C` be a `Γ`-module, and let `u ∈ H²(Γ,C)`. Suppose that for every subgroup `H` of
`Γ`:

```text
H¹(H,C) = 0,
H²(H,C) is cyclic of order |H|,
res_H(u) generates H²(H,C).
```

Then, for every integer `r`, cup product with `u` gives an isomorphism

```text
Ĥ^r(Γ,ℤ)  ≃  Ĥ^{r+2}(Γ,C).
```

**The hypotheses are stated individually, not bundled.** `tateTheorem` takes each of the three as
a separate explicit argument, over the finite quotient system `H ↦ subgroupLayer H`; it never
takes a `ClassFormation`. This matters because the pieces are consumed separately downstream, and
a layer that satisfies only some of them — a cyclic layer of the local formation, an `S`-idele
layer of the global one — must still be able to use the theorem. The individual names, each of
which is a declaration in `Suggested.lean` rather than a clause of prose, are:

| Datum | Name |
|---|---|
| the finite quotient system `H ↦ subgroupLayer H`, with its Galois group, degree and restriction datum | `NormalLayer.subgroupLayer`, `subgroupGalEquiv`, `degree_subgroupLayer`, `subgroupRestriction`, `relativeDegree_subgroupRestriction` |
| compatible fundamental classes under restriction, corestriction, inflation and conjugation | `fundamentalClass_restrict`, `fundamentalClass_cor`, `fundamentalClass_infl`, `fundamentalClass_conj` |
| the two low-degree Tate identifications | `tateHMinusTwoEquivAbelianization`, `tateHZeroEquivNormQuotient` |
| restriction/corestriction normalization | `inv_restrict` (an axiom), `inv_cor` (a theorem), `LayerRestriction.cohomologyCor_cohomologyRes`, `tateCor_tateRes` |
| tower compatibility | `LayerRestriction.trans`, `relativeDegree_trans`, `cohomologyRes_trans`, `cohomologyCor_trans`, `tateRes_trans`, `tateCor_trans`, `LayerRefinement.trans`, `cohomologyInfl_trans`, `tateIso_res_trans` |
| the three hypotheses, verified for a class formation | `h1_subgroupLayer`, `card_H2_subgroupLayer`, `fundamentalClass_restrict_generates` |

⚠ `inv_cor` is a theorem, not a field of `ClassFormation`. Adding it as an axiom would let an
implementation satisfy it by fiat, and it is a consequence of `inv_restrict`, `inv_injective` and
`cor ∘ res = [E:F]`. ⚠ The restriction, corestriction and inflation squares do not have the same
shape: restriction multiplies invariants by the relative degree, corestriction preserves them, and
inflation of the fundamental class is scaled. A single "compatibility" clause covering all three
is false.

Artin–Tate prove it from their Preliminaries §2 Theorem A, the cup-product criterion (surjective,
bijective, injective in three consecutive degrees for every subgroup), and call the
class-formation specialization the **Main Theorem** (Chapter XIV §4, Theorem 1). The
generalization to an arbitrary coefficient module `M` with `Tor₁^ℤ(M,C) = 0`,

```text
Ĥ^r(Γ,M)  ≃  Ĥ^{r+2}(Γ, M ⊗ C),
```

is Nakayama's (Ann. of Math. 65, 1957) and is what the literature calls the **Tate–Nakayama
theorem**; it should be proved in the generic Tate-cohomology supplier if it is not already
available; its hypotheses are the same three, individually stated, plus the vanishing of `Tor₁`.
The class-field-theory application uses `M = ℤ`, i.e. Tate's theorem, and the roadmap names the
generic theorem `tateTheorem` and its application to a class formation `tateIso`. The explicit
degree `-2 → 0` map is Artin–Tate's *Nakayama map*, after Nakayama's 1935 explicit formula
(`nakayamaNegTwo`); it is not to be confused with the Tate–Nakayama theorem.

The public isomorphism is not merely an existential equivalence between two groups. Its
underlying homomorphism is the named cup-product map with the named fundamental class. This
identity is part of the API.

### 2.5 The direction of reciprocity

At `r = -2`, Tate's theorem gives

```text
Ĥ^{-2}(Γ,ℤ)  →  Ĥ^0(Γ,C).
```

The canonical low-degree identifications are

```text
Ĥ^{-2}(Γ,ℤ)  ≃  Γ^ab,
Ĥ^0(Γ,C)     ≃  A^U / N_{U/V}(A^V).
```

Thus cup product with the fundamental class gives the **Nakayama map**

```text
nakayamaNegTwo : Γ^ab ≃ A^U / N_{U/V}(A^V).
```

The Artin reciprocity direction used in this roadmap is its inverse:

```text
artinEquiv : A^U / N_{U/V}(A^V) ≃ Γ^ab.
```

The map on the ground level is

```text
artinMap : A^U → Γ^ab,
```

obtained by composing the quotient map with `artinEquiv`. Consequently its kernel is exactly the
norm subgroup. In `Suggested.lean`, `tateIso`, `nakayamaNegTwo`, `artinEquiv` and `artinMap` are
ordinary definitions with bodies: `tateIso` is `tateTheorem` applied to the fundamental class,
`artinEquiv` is `nakayamaNegTwo.symm` **definitionally**, `artinMap_apply` and
`artinEquiv_eq_tateIso` are proved by `rfl`, and `tateIso_toAddMonoidHom` is a closed proof.
Only the leaves — `tateTheorem`, the two low-degree identifications, and the generic cup-product
map `cupClass` — carry `sorry`.
A character formula provides an independent normalization check. An arbitrary equivalence of
groups does not satisfy the contract.

### 2.6 Frobenius convention

All local and global Artin maps use **arithmetic Frobenius**.

- For an unramified extension of nonarchimedean local fields, a uniformizer maps to the
  automorphism inducing `x ↦ x^q` on the residue field, and the unramified coordinate sends it to
  `1 ∈ ℤ̂`.
- For `K/ℚ_p` finite and a unit `u`, `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`. Omitting the field
  norm is ill-typed away from `ℚ_p`.
- For a number-field extension and an unramified prime `𝔭`, the ideal Artin symbol is the
  arithmetic Frobenius at `𝔭`.
- For `ℚ(ζ_m)/ℚ` and a prime `ℓ` not dividing `m`, the Artin symbol of `(ℓ)` sends `ζ_m` to
  `ζ_m^ℓ`.

Choosing geometric Frobenius would invert every one of these formulae. The unramified local and
cyclotomic regression tests of §5 are therefore mandatory. `geometricArtinMap` is defined only as
the precomposition of the arithmetic map with inversion, for interoperability.

### 2.7 Further pinned conventions

- The local invariant map sends the fundamental class of a degree-`n` extension to `1/n` in
  `ℚ/ℤ`. Restriction multiplies invariants by the degree (`inv_restrict`); corestriction preserves
  them (`inv_cor`). Both directions are named maps in every degree, not one map and its inverse.
- An invariant map is data, and it is constructed before the class formation that carries it:
  `invMap` before `localClassFormation` (`localClassFormation_inv`), and `globalInv` — the sum of
  local invariants — before `globalClassFormation` (`globalClassFormation_inv`). No object of this
  roadmap is both a prerequisite of a construction and a theorem proved after it.
- The local Weil group carries the **Weil topology**, in which inertia is open, and not the
  subspace topology from `G_K`; its reciprocity isomorphism is with the **topological**
  abelianization `W_K / closure ⁅W_K, W_K⁆`.
- A ring class field is asserted only for an order in a quadratic field, and the hypothesis
  `Module.finrank ℚ K = 2` is carried in the type.
- **Every class field lives inside the separable closure**, as `IntermediateField K
  (SeparableClosure K)`, because that is the closure whose automorphism group is the formation's
  `ProfiniteCohomology.AbsoluteGaloisGroup`. A class field is then literally
  `IntermediateField.fixedField` of the open normal subgroup the correspondence produces, with no
  intervening transport. For a number field the separable and algebraic closures agree, so nothing
  is lost.
- **A norm subgroup determines an abelian layer and only an abelian layer.** By norm limitation a
  nonabelian layer and its maximal abelian sublayer share a norm subgroup, so the final existence
  theorems return an abelian layer and are paired with uniqueness. The two order statements run in
  opposite directions and both are named: inclusion-preserving on subgroups of `G_K`,
  inclusion-reversing on the fields they cut out.
- Tate cohomology is Mathlib's, defined for every `r : ℤ`. Inflation is used only in positive
  degrees; Tate degree zero is a quotient by the norm and does not admit the naive inflation
  map.
- The global Artin map is a transport of the abstract Artin map and agrees with
  `NumberFieldArithmetic.artinHomAway`; there is one ideal-theoretic Artin map in the portfolio.
- A modulus's infinite part consists of real places. The modulus, ray subgroup and ray-class
  group are imported from `GlobalNumberFields`, never redefined here.
- The absolute Galois group of the formation is the separable-closure group
  `ProfiniteCohomology.AbsoluteGaloisGroup`; Mathlib's algebraic-closure
  `Field.absoluteGaloisGroup` and its topological abelianization are the carriers of the frozen
  local exports `artinMap` and `unramifiedCoordinate`, related by the named comparison
  `absoluteGaloisGroupComparison`.

---

## 3. Frozen public interface

The following names are the intended public contract. Exact universe parameters and adapter
names may change during implementation, but the mathematical direction of each map may not.

| Object or theorem | Intended declaration |
|---|---|
| formation | `Formation` |
| finite normal layer | `NormalLayer` |
| level fixed by an open subgroup | `Formation.level` |
| restriction, corestriction, and their normalization | `LayerRestriction.cohomologyRes`, `cohomologyCor`, `tateRes`, `tateCor`, `cohomologyCor_cohomologyRes`, `tateCor_tateRes` |
| towers | `LayerRestriction.trans`, `LayerRefinement.trans`, `relativeDegree_trans`, `cohomologyRes_trans`, `cohomologyCor_trans`, `tateRes_trans`, `tateCor_trans`, `cohomologyInfl_trans` |
| the finite quotient system | `NormalLayer.subgroupLayer`, `subgroupGalEquiv`, `subgroupRestriction`, `degree_subgroupLayer`, `relativeDegree_subgroupRestriction` |
| class-formation axioms | `ClassFormation` |
| invariant map | `ClassFormation.inv`, with `inv_cor` |
| fundamental class | `ClassFormation.fundamentalClass`, with `fundamentalClass_restrict`, `fundamentalClass_cor`, `fundamentalClass_infl`, `fundamentalClass_conj` |
| cup with a chosen class, and with the fundamental class | `cupClass`, `ClassFormation.cupFundamentalClass` |
| Tate's theorem, generic, hypotheses individually | `tateTheorem`, `tateTheorem_toAddMonoidHom` |
| its three hypotheses for a class formation | `ClassFormation.h1_subgroupLayer`, `card_H2_subgroupLayer`, `fundamentalClass_restrict_generates` |
| Tate's theorem for the class formation | `ClassFormation.tateIso`, with `tateIso_res`, `tateIso_cor`, `tateIso_res_trans` |
| degree `-2 → 0` Nakayama direction | `ClassFormation.nakayamaNegTwo` |
| quotient-form Artin reciprocity | `ClassFormation.artinEquiv` |
| Artin map on the ground level | `ClassFormation.artinMap` |
| character characterization | `ClassFormation.character_artinMap` |
| norm kernel | `ClassFormation.ker_artinMap` |
| four functoriality diagrams | `artinMap_groundInclusion`, `artinMap_groundNorm`, `artinMap_conj`, `artinMap_quotient` |
| abelian layers | `IsAbelianClassFieldLayer`, `isAbelianClassFieldLayer_iff_isMulCommutative`, `AbelianLayer`, `isMulCommutative_gal_ofOpenNormal`, `abelianizationGalEquiv` |
| maximal abelian sublayer | `maximalAbelianLayer`, `le_maximalAbelianLayer`, `isAbelianClassFieldLayer_maximalAbelianLayer`, `maximalAbelianLayer_le` |
| norm limitation | `ClassFormation.normSubgroup_maximalAbelianLayer` |
| class fields as subfields | `classField`, `classField_le_classField_iff` |
| local class formation | `localClassFormation` |
| finite local Artin equivalence | `localArtinEquiv`, with `normResidue` its multiplicative form |
| finite local Artin map | `localArtinMap` |
| unramified normalization | `localArtinMap_uniformizer`, `normResidue_uniformizer` |
| absolute local Artin map and coordinates | `artinMap`, `unramifiedCoordinate`, `cyclotomicCharacter_artinMap`, `cyclotomicCharacter_artinMap_padic` |
| local Weil group: carrier and topology | `localWeilGroup`, `inertia_le_localWeilGroup`, `dense_localWeilGroup`, `WeilGroup`, `weilToAbsolute`, `isOpen_inertia_weil`, `not_isOpen_inertia` |
| local Weil group: functoriality | `weilTransfer`, `isOpen_range_weilTransfer`, `index_range_weilTransfer`, `weilDegree_weilTransfer`, `weilRestrict`, `range_weilTransfer_eq_ker_weilRestrict` |
| local Weil group: inertia sequence | `weilDegree`, `surjective_weilDegree`, `ker_weilDegree`, `unramifiedCoordinate_weilDegree` |
| local Weil group: reciprocity | `localWeilArtinEquiv` (onto the topological abelianization), `localWeilArtinEquiv_compat`, `mem_range_artinMap_iff` |
| local norm subgroups | `localNormSubgroup`, `isOpen_localNormSubgroup`, `finiteIndex_localNormSubgroup`, `localNormSubgroup_mono`, `localNormSubgroup_maximalAbelianLayer`, `localNormSubgroup_top`, `LocalNormSubgroups` |
| local existence | `localAbelianExistence` (finite extensions of `ℚ_p`), `localAbelianExistence_primeToResidueCharacteristic` (index prime to the residue characteristic), with `localExistence` and `localExistence_primeToResidueCharacteristic` as their forgetful corollaries |
| the local class field and its uniqueness | `localClassField`, `localClassField_normSubgroup`, `localClassField_unique` |
| the local correspondence, two scopes | `localClassFieldCorrespondence`, `localClassField_le_iff`, `localClassField_orderReversing`; `LocalNormSubgroupsPrimeTo`, `AbelianLayerPrimeTo`, `localClassFieldPrimeToResidueCharacteristic`, `localClassFieldCorrespondence_primeToResidueCharacteristic`, `localClassFieldPrimeToResidueCharacteristic_orderReversing` |
| local quotient and degree | `localAbelianGaloisEquiv`, `localAbelianGaloisEquiv_artinMap`, `index_localNormSubgroup`, `localClassFieldGaloisEquiv`, `localClassField_index` |
| global Brauer sequence and local invariants | `brFinite`, `brInfinite`, `infiniteInvMap`, `finiteInvAt`, `infiniteInvAt`, `brauerSupport`, `sumLocalInv`, `eq_zero_of_localInv_eq_zero`, `sumLocalInv_eq_zero`, `exists_br_of_sum_eq_zero` |
| idele carrier and the global invariant | `ideleFormation`, `ideleToClassH2`, `ideleLocalInvAt`, `ideleInfiniteInvAt`, `ideleSumLocalInv`, `globalInv`, `globalInv_ideleToClassH2` |
| global idele-class formation | `globalClassFormation`, with `globalClassFormation_inv` |
| finite global Artin equivalence | `globalArtinEquiv` |
| global Artin map | `globalArtinMap` |
| comparison with ideal Artin | `globalArtinMap_ideal`, `abelianArtinHomAway` |
| local–global compatibility | `globalArtinMap_local`, `localArtinAt` |
| global norm subgroups | `globalNormSubgroup`, `isOpen_globalNormSubgroup`, `finiteIndex_globalNormSubgroup`, `globalNormSubgroup_mono`, `globalNormSubgroup_maximalAbelianLayer`, `globalNormSubgroup_top`, `GlobalNormSubgroups` |
| global existence and norm index | `globalAbelianExistence`, with `globalExistence` as its forgetful corollary; `card_ideleClassNormQuotient` |
| the global class field and its uniqueness | `globalClassField`, `globalClassField_normSubgroup`, `globalClassField_unique` |
| the global correspondence, number fields | `globalClassFieldCorrespondence`, `globalClassField_le_iff`, `globalClassField_orderReversing` |
| global quotient and degree | `globalAbelianGaloisEquiv`, `globalAbelianGaloisEquiv_artinMap`, `index_globalNormSubgroup`, `globalClassFieldGaloisEquiv`, `globalClassField_index`, `galClassFieldEquiv` |
| continuous local coefficients | `GalRep`, `H`, `muNRep`, `kummerClass`, `kummerEquiv_mixed` |
| Kummer transport and local Brauer group | `absoluteGaloisGroupComparison`, `muNRepCoeffDictionary`, `Br`, `invMap`, `brRes`, `brCor` |
| local invariant and Hilbert pairing | `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing`, `localSymbol` |
| local duality and Euler characteristic | `tateDualityPairing_perfect_mixed`, `finite_H`, `eulerCharacteristic_finrank_fp` |
| local conductors | `conductorExponent`, `conductorIdeal`, `characterConductorExp` |
| global norm and Hilbert reciprocity | `cyclicHasseNorm`, `hilbertProductFormula` |
| class fields, all applications of `globalClassField` | `rayNormSubgroup`, `rayClassField`, `hilbertClassField`, `narrowHilbertClassField`, `gal_rayClassField_equiv_rayClassGroup`, `rayClassArtinMap`, `kroneckerWeber` |
| ring class fields, **quadratic orders only** | `ringClassIdeleQuotient`, `ringClassNormSubgroup`, `ringClassField`, `ringClassArtinMap`, `ringClassArtinMap_eq_one_iff`, `gal_ringClassField_equiv_pic`, `ringClassField_maximal`, each carrying `Module.finrank ℚ K = 2` |

⚠ **The correspondence runs in one direction on subgroups and the opposite direction on fields.**
Inclusion of open normal subgroups of `G_K` is *reverse* inclusion of the fields they cut out, so
`localClassFieldCorrespondence` and `globalClassFieldCorrespondence` are order **isomorphisms**
onto `AbelianLayer G_K` — `N₁ ≤ N₂ ↔ V₁ ≤ V₂`, recorded as `localClassField_le_iff` and
`globalClassField_le_iff` — while the classical order-**reversing** statement is on fields,
`localClassField_orderReversing` and `globalClassField_orderReversing`, obtained from the Galois
dictionary `classField_le_classField_iff`. Writing the subgroup form with the inclusions reversed
would be false; `localNormSubgroup_top` and `globalNormSubgroup_top` are the acceptance tests that
pin the extreme case, `V = ⊤ ↦ K ↦ N = Kˣ`.

`cyclicHasseNorm` and `hilbertProductFormula` are frozen public names. Their statements use the
global and local carriers above; neither may be replaced with a proposition-valued interface
whose hypotheses simply assume the conclusion. `normResidue` is a compatibility form of
`localArtinEquiv`; it must not become a second independently constructed equivalence.

Two entries fix a direction of dependency rather than a map. `localClassFormation_inv` says that
the abstract invariant of a local layer is `invMap`, and `globalClassFormation_inv` says that the
invariant of the global class formation is `globalInv`, the sum of local invariants. Both are
equations between an object built earlier and the field of a structure built later; neither may be
turned around into a construction of the invariant out of the class formation.

---

## 4. Build plan

The layer order below **is** the dependency order. Every layer's prerequisites are Mathlib, one of
the four supplier roadmaps, or an *earlier* layer of this roadmap; no layer uses a name introduced
later, and the graph of §7 is the same graph. Three orderings are normative rather than editorial:

- the local Brauer group and its invariant map are built in Layer 5 and consumed by the local class
  formation in Layer 6, never the other way round;
- local existence is Layer 8, after the Kummer theory of Layer 5 that its proof uses;
- the sum-of-local-invariants map is built in Layer 10 and *is* the invariant of the global class
  formation of Layer 11, so it cannot also be a theorem proved after it.

### Layer 0: audit and complete the cohomology suppliers

*Prerequisites:* Mathlib; `ProfiniteCohomology`.

Do not begin by writing a new `tateH` definition.

1. Fix the exact Mathlib pin and inventory the declarations in
   `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean`: the Tate complex,
   `tateCohomology`, its functoriality, the connecting map `δ`, the long exact sequence, and the
   comparisons `isoGroupCohomology` and `isoGroupHomology`.
2. Inventory the Lean 4 files in `kbuzzard/ClassFieldTheory/ClassFieldTheory/Cohomology/`, in
   particular the Tate-cohomology, restriction, corestriction, inflation, and low-degree files.
3. Inventory the Richard Hill/Edison Xie continuous-cohomology and cup-product files, including
   the versions in FLT.
4. Port or prove, in the generic supplier, only what is genuinely missing:

   - coefficient functoriality in every Tate degree;
   - restriction and corestriction in every Tate degree, with `cor ∘ res = [G:H]`;
   - inflation in positive degrees and its comparison with ordinary inflation;
   - the Tate cup product in all integer bidegrees, associative, graded-commutative, natural,
     compatible with restriction and satisfying the projection formula;
   - `Ĥ^{-2}(G,ℤ) ≃ G^ab`;
   - `Ĥ^0(G,M) ≃ M^G / N_G M`;
   - two-periodicity for cyclic groups and the Herbrand quotient, with multiplicativity in short
     exact sequences and invariance under maps with finite kernel and cokernel;
   - the generic cup-product criterion of Tate's theorem (Artin–Tate, Preliminaries §2,
     Theorem A), and its Tate–Nakayama tensor-product generalization.

5. Give comparison theorems with ordinary cohomology in positive degrees and with the existing
   explicit cyclic Tate theory. Do not expose duplicate public carriers.
6. Audit `ClassFieldTheory/Cohomology/FiniteCyclic/HerbrandQuotient/`. The local and global
   proofs of the class-formation axioms use the Herbrand quotient, its multiplicativity in a short
   exact sequence, and its value on finite and trivial modules; this roadmap does not introduce a
   second numerical invariant with different conventions.

**Exit criterion.** `Suggested.lean` states `tateTheorem`, `tateIso`, `nakayamaNegTwo`, and
`artinEquiv` using imported Tate groups and imported cup products, with no locally defined
cohomology object.

### Layer 1: formations and finite normal layers

*Prerequisites:* Layer 0; `ProfiniteCohomology` (smooth discrete modules); Mathlib open subgroups.

Define the topological form of `Formation` and `NormalLayer`.

Required API:

- `Formation.level U = A^U`, the invariants of the restricted representation;
- the finite quotient `NormalLayer.Gal = U / V`, with the finiteness instance obtained from
  openness of `V` in the compact group `U`;
- the induced representation of `U / V` on `A^V` (`NormalLayer.rep`);
- the equality `(A^V)^(U/V) = A^U`;
- **the finite quotient system:** for every subgroup `H ≤ U/V`, the corresponding intermediate open
  subgroup (`subgroupLayer`), its Galois group (`subgroupGalEquiv`), its degree
  (`degree_subgroupLayer`), the restriction datum relating it to `L`
  (`NormalLayer.subgroupRestriction`) and its relative degree
  (`relativeDegree_subgroupRestriction`), together with the identification of the restricted
  representation with the coefficient module of that intermediate layer;
- the layers `V ◁ ⊤` of open normal subgroups (`NormalLayer.ofOpenNormal`), which are the
  finite Galois extensions of the ground field of the formation;
- **the abelian layers among them.** `IsAbelianClassFieldLayer V` says that `V` contains the
  **closed** commutator subgroup `(commutator G).topologicalClosure`, the subgroup Mathlib's
  `TopologicalAbelianization` and `Field.absoluteGaloisGroupAbelianization` already quotient by;
  no second closed commutator subgroup is defined here, and the algebraic `commutator G` is the
  wrong subgroup because it need not be closed. Prove the finite-quotient form
  `isAbelianClassFieldLayer_iff_isMulCommutative`, the layer form
  `isMulCommutative_gal_ofOpenNormal`, and the resulting identification
  `abelianizationGalEquiv : Abelianization L.Gal ≃ L.Gal`, which is what lets the
  abelianization-valued Artin equivalence of Layer 4 be read as an isomorphism onto `L.Gal`;
- **the canonical maximal abelian sublayer** `maximalAbelianLayer V = V · [G,G]‾`, with
  `le_maximalAbelianLayer`, `isAbelianClassFieldLayer_maximalAbelianLayer` and the universal
  property `maximalAbelianLayer_le`. It is data — a join of two named subgroups — never a choice
  of "some abelian layer with the same norm subgroup";
- the norm `A^V → A^U`, the norm subgroup and the norm quotient;
- restriction (`LayerRestriction`), refinement (`LayerRefinement`), and conjugation adapters
  between layer representations, on ordinary and Tate cohomology, together with the ground-level
  inclusion and norm, the transfer, inclusion, quotient and conjugation maps on abelianized Galois
  groups; tower objects remember the actual inclusions, not only equal cardinalities;
- **restriction and corestriction as separate named maps** in every degree
  (`LayerRestriction.cohomologyRes`, `cohomologyCor`, `tateRes`, `tateCor`, `trivialTateRes`,
  `trivialTateCor`) with the normalization `cor ∘ res = [E:F]`
  (`cohomologyCor_cohomologyRes`, `tateCor_tateRes`);
- **tower compatibility:** restrictions and refinements compose (`LayerRestriction.trans`,
  `LayerRefinement.trans`), the relative degree is multiplicative along a tower
  (`relativeDegree_trans` in both namespaces), and every one of the maps above is functorial along
  a composite (`cohomologyRes_trans`, `cohomologyCor_trans`, `tateRes_trans`, `tateCor_trans`,
  `cohomologyInfl_trans`).

The only role of continuous profinite cohomology at this stage is to connect the finite-layer
objects to the canonical continuous theory where required. All Tate groups in a finite layer are
the imported finite-group Tate groups of `U/V`.

**Exit criterion.** The expressions

```text
Ĥ^r(U/V,ℤ),
Ĥ^r(U/V,A^V),
A^U / N_{U/V}(A^V),
(U/V)^ab
```

are all represented by named types and canonical maps, and restriction, corestriction and towers
each have a name.

### Layer 2: class formations and fundamental classes

*Prerequisites:* Layer 1.

Define `ClassFormation` with the axioms in §2.2. Prove:

- `H²(U/V,A^V)` is cyclic of order `[U:V]`;
- existence and uniqueness of the class of invariant `1/[U:V]`;
- `fundamentalClass` generates `H²`;
- restriction of a fundamental class is the fundamental class of the restricted layer;
- corestriction preserves invariants (`inv_cor`) and carries the fundamental class to
  `[E:F] · u_{K/F}` (`fundamentalClass_cor`);
- the scaled inflation and the conjugation formulae.

Then prove, as separate named theorems, the three hypotheses Layer 3 consumes:

- `h1_subgroupLayer` — `H¹` vanishes on the layer of every subgroup;
- `card_H2_subgroupLayer` — that layer's `H²` has `#H` elements;
- `fundamentalClass_restrict_generates` — the restricted fundamental class generates it.

The invariant is data. The fundamental class is derived. A structure with an unrelated chosen
class for every subgroup is not an acceptable substitute.

**Exit criterion.** The hypotheses of Tate's theorem are available *individually* for the
restriction of the fundamental class to every subgroup of `U/V`.

### Layer 3: Tate's theorem for a class formation

*Prerequisites:* Layers 0, 1, 2.

State the generic theorem `tateTheorem` with its three hypotheses as separate explicit arguments
(§2.4), and prove that its underlying homomorphism is `cupClass` (`tateTheorem_toAddMonoidHom`).
Then obtain

```text
tateIso (r : ℤ) :
  Ĥ^r(U/V,ℤ) ≃ Ĥ^{r+2}(U/V,A^V)
```

as that theorem applied to the fundamental class and to the three Layer 2 theorems, so that
`tateIso_toAddMonoidHom` is a closed proof rather than a second assertion. Establish compatibility
with:

- restriction to a subgroup (`tateIso_res`);
- corestriction (`tateIso_cor`);
- a tower of ground fields (`tateIso_res_trans`);
- conjugation;
- the correct scaled inflation formula.

The scaled inflation formula matters: the fundamental class of a smaller layer inflates to a
degree multiple of the fundamental class of the larger layer. No roadmap statement should claim
unscaled commutativity in positive degrees, and the restriction, corestriction and inflation
squares do not all have the same shape.

**Exit criterion.** There is one named, cup-product-defined family of isomorphisms in all integer
degrees, obtained from a generic theorem whose hypotheses are visible in its type.

### Layer 4: the abstract Artin map

*Prerequisites:* Layer 3.

Construct the two low-degree identifications and define

```text
nakayamaNegTwo : (U/V)^ab ≃ A^U / N(A^V),
artinEquiv     : A^U / N(A^V) ≃ (U/V)^ab := nakayamaNegTwo.symm,
artinMap       : A^U → (U/V)^ab.
```

The transparent chain in `Suggested.lean` pins these definitions before their implementation
exists.

Prove:

1. `ker artinMap = N(A^V)` and the elementwise `artinMap_eq_zero_iff`;
2. `artinMap` is surjective;
3. the four Artin–Tate diagrams: inclusion of ground levels corresponds to group-theoretic
   transfer, the norm to inclusion of Galois groups, conjugation to conjugation, and passage to
   a quotient extension to the quotient map on Galois groups (`artinMap_groundInclusion`,
   `artinMap_groundNorm`, `artinMap_conj`, `artinMap_quotient`);
4. the character formula

   ```text
   χ (artinMap a)
     = inv (class(a) ∪ δ(χ))
   ```

   for every character `χ : (U/V)^ab → ℚ/ℤ`;
5. uniqueness: any homomorphism satisfying the character formula is `artinMap`
   (`eq_artinMap_of_character`);
6. **the norm limitation theorem** `ClassFormation.normSubgroup_maximalAbelianLayer`: a layer and
   its maximal abelian sublayer have the same norm subgroup. The inclusion `≤` is functoriality of
   the norm along `V ≤ V·[G,G]‾`; the reverse follows because `artinEquiv` identifies both norm
   quotients with `(G/V)^ab = G/(V·[G,G]‾)`, so the two subgroups have the same finite index. It
   is a consequence of reciprocity and never of existence.

The character formula is the second protection against accidentally using the inverse map or the
opposite fundamental class. Norm limitation is what forces Layers 8 and 12 to state existence with
an abelian layer: without it `∃ V, N(V) = N` would have two witnesses for every nonabelian `V`.

**Exit criterion.** Downstream files can refer to the Artin map without choosing an arbitrary
isomorphism or reopening a sign convention, and `normSubgroup_maximalAbelianLayer` is available to
the two existence layers.

### Layer 5: local coefficients, the Brauer group, the local invariant, and duality

*Prerequisites:* Layer 0; `ProfiniteCohomology`; `LocalFieldsRamification`. **Not** Layers 1–4,
and in particular not the local class formation, the local Artin map, or local existence.

Keep all continuous cohomology on the imported Mathlib carrier:

```text
GalRep n F = ProfiniteCohomology.TopRep (ZMod n) G_F,
H n F i A  = continuousCohomology i A.
```

The layer also records, once, the Galois dictionary that both arithmetic columns need in order to
state their class-field correspondence in fields: `classField F V` is the fixed field of an open
normal subgroup of `G_F` inside the separable closure, and `classField_le_classField_iff` is the
order-reversing half of the Galois correspondence. It is stated here, before Layer 8 and Layer 12,
because both use it and neither may restate it.

Build `muNRep n F`, the separable-closure roots of unity as a coefficient object, and transport
the imported Kummer map to `kummerClass`. For `F/ℚ_p` finite, `kummerEquiv_mixed` is valid for
every `n ≠ 0`, including `n = p`; this is not a consequence of the prime-to-`p` unit case. The
transport is explicit: `absoluteGaloisGroupComparison` relates the algebraic-closure and
separable-closure Galois groups, while `muNRepCoeffDictionary` is separately proved continuous
and equivariant.

The Brauer carrier is `Br F = H²(G_F,(Fˢ)ˣ)` on the same continuous theory, with invariant
`invMap` normalized by arithmetic Frobenius; `brRes` and `brCor` satisfy the degree-multiplying
restriction and degree-free corestriction squares. Construct the invariant first on unramified
layers, using the imported arithmetic Frobenius, and then on the full Brauer group. The
degree-`n` piece is the subgroup of `ℚ/ℤ` of order `n`, and the fundamental class of a degree-`n`
local layer is the class of invariant `1/n`.

For every `n ≠ 0` in mixed characteristic, prove `h2MuEquivZMod_mixed : H²(F,μ_n) ≃ ZMod n`. A
chosen primitive `p`-th root identifies the trivial `𝔽_p` module with `μ_p`, giving
`h2FpEquivZMod_of_mu`; without that coefficient identification the zero module is a
counterexample.

Define `kummerCupPairing ζ` from a chosen primitive root, then define `localSymbol` as Kummer cup
followed by the invariant. Prove bilinearity and the Steinberg relation. This is the canonical
owner of the cohomological local Hilbert pairing; no quadratic-form or quaternion symbol is
imported. Two Kummer classes naturally cup into `μ_n ⊗ μ_n`, not `μ_n`: multiplication of roots
of unity is not biadditive. A primitive root supplies the additional pairing, and the Steinberg
law is stated only for that named pairing. At exponent two the identification is canonical, which
is what lets Layer 6 read the quadratic Artin symbol off `localSymbol`
(`localArtinMap_quadratic_eq_hilbertSymbol`).

Construct local Tate duality from the evaluation pairing `Hom(A,μ_n) × A → μ_n`. The exported
theorem `tateDualityPairing_perfect_mixed` is stated for the named evaluation pairing;
quantifying over an arbitrary pairing would admit the zero pairing. Local duality uses the named
evaluation pairing and an eight-step Shapiro/coinduction dévissage. A general finite `G_K`-module
need not admit a filtration by trivial modules: over `ℚ_2`, the nontrivial unramified action on
`ℤ/3` is the regression example. For an unramified module and its dual, the two annihilator
orders are separately `#H⁰(K,M)` and `#H⁰(K,M')`; they need not agree (the same `ℚ_2`, `ℤ/3`
example gives orders `3` and `1`). Prove finiteness of `H⁰`, `H¹`, `H²` (`finite_H`), the
cardinality Euler characteristic, and the frozen `𝔽_p` finrank formula
`eulerCharacteristic_finrank_fp`.

Nothing in this layer may use local reciprocity, the norm-index theorem, local existence, or the
local class formation.

**Exit criterion.** `Br K`, `invMap`, `localSymbol`, `tateDualityPairing_perfect_mixed`,
`finite_H` and `eulerCharacteristic_finrank_fp` all exist and none of them mentions an Artin map.

### Layer 6: the local class formation and finite local reciprocity

*Prerequisites:* Layers 1–5; `LocalFieldsRamification`.

For a nonarchimedean local field `K`, construct the formation whose module is the multiplicative
group of a separable closure, written additively; its module is `unitsRep K` transported to the
separable-closure Galois group, so that the local Brauer group `Br K = H²(G_K, (Kˢ)ˣ)` of Layer 5
is the continuous `H²` of the same coefficients. Prove the class-formation axioms from:

- Hilbert 90;
- the Layer 5 local Brauer invariant `invMap`, transported to the finite layers through
  `brInfl` and recorded as `localClassFormation_inv`, so that Layers 5 and 6 carry one
  normalization;
- compatibility of restriction with multiplication by degree;
- the finite-layer description of the Brauer group;
- the cyclic Herbrand-quotient calculation needed to show that the degree-`n` layer contributes
  the subgroup of order `n`.

For local units, use a scaled normal-basis element to obtain an open stable lattice that is free
over the group ring, then pass through the finite quotient into the unit filtration; do not assume
that `𝒪_L` itself is free over `𝒪_K[Γ]`, which holds only in the tame case. The finite local
Galois group is first proved solvable from its ramification filtration, the cyclic `H²` bound is
then propagated by induction, and only afterwards are the fundamental classes and class formation
constructed. The proof of `localClassFormation` must not use local reciprocity, the norm-index
theorem, local existence, or local duality: each is downstream of Tate's theorem.

For a finite Galois extension `L/K` embedded by `iota : L →ₐ[K] Kˢ`, identify the abstract norm
quotient and Galois quotient with

```text
Kˣ / N_{L/K}(Lˣ),
Gal(L/K)^ab,
```

define `localArtinEquiv` by transporting `ClassFormation.artinEquiv`, prove that it does not
depend on `iota` (`localArtinEquiv_eq_of_iota`), and record `normResidue` as its multiplicative
form for the canonical embedding. Then prove the arithmetic normalization

```text
localArtinMap(π_K) = arithmeticFrobenius
```

for an unramified extension, using the Frobenius object exported by `LocalFieldsRamification`.
Units are norms in this case, so the local Artin map is determined by the valuation modulo
`[L:K]` (`localArtinMap_eq_frobenius_pow_valuation`). Prove the quadratic tests of §5.4, including
the comparison with the Layer 5 `localSymbol`.

**Exit criterion.** The finite local map is visibly the abstract Artin map, a uniformizer maps to
arithmetic Frobenius, and the kernel is the norm group.

### Layer 7: the absolute local Artin map, its normalizations, and conductors

*Prerequisites:* Layers 5, 6; `LocalFieldsRamification`.

Passing to the inverse limit over finite abelian extensions gives the absolute
`artinMap : Kˣ → G_K^ab` into the topological abelianization, with dense image and kernel the
intersection of the norm groups; it is not surjective, so no finite-cardinality statement about
its target is valid. Its finite restrictions are the finite maps (`artinMap_restrict`), its
unramified coordinate is the normalized valuation (`unramifiedCoordinate_artinMap`), and its
cyclotomic normalization is `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`, with the field norm
(`cyclotomicCharacter_artinMap`, and its `ℚ_p` specialization). These equations are consumed by
`LocalGaloisGroups` to identify the abstract Demushkin orientation. `geometricArtinMap` is defined
only as the precomposition of the arithmetic map with inversion.

The conductor targets are the attained minima `conductorExponent`, `conductorIdeal`, and
`characterConductorExp`, with minimality and the unramified criterion named. Character-conductor
attainment uses that `ℂˣ` has no small subgroups; continuity plus a neighbourhood basis alone is
insufficient, as the identity `Kˣ → Kˣ` is trivial on no unit-filtration subgroup.

**Exit criterion.** `LocalGaloisGroups` can consume the local-cohomological row of §3 by name.

### Layer 8: separate arithmetic local existence and the local class-field correspondence

*Prerequisites:* Layers 5, 6, 7. In particular the Kummer theory of Layer 5 (`kummerClass`,
`kummerEquiv_mixed`, `h2MuEquivZMod_mixed`), the local duality of Layer 5 and the Galois dictionary
`classField` of Layer 5 are prerequisites of this layer, not consequences of it.

The endpoint of the layer is a **correspondence**, not an existence statement. `∃ V, N(V) = N` on
its own names nothing: by the norm limitation theorem of Layer 4 a layer and its maximal abelian
sublayer have the same norm subgroup, so a nonabelian `V` and `maximalAbelianLayer V` are two
witnesses to the same existence statement. Every final target below therefore either constrains `V`
to be an abelian layer or is explicitly labelled a forgetful corollary.

After reciprocity is established, develop the topology of norm subgroups and prove:

- the norm subgroup `localNormSubgroup V ≤ Kˣ` of an open normal subgroup of `G_K` is open
  (`isOpen_localNormSubgroup`) and of finite index (`finiteIndex_localNormSubgroup`);
- it is monotone in `V` (`localNormSubgroup_mono`) — hence inclusion-reversing on fields — and
  respects composita and intersections; `localNormSubgroup_top` pins the extreme case
  `V = ⊤ ↦ K ↦ Kˣ`, which is what fixes the direction of the correspondence;
- the concrete forms of norm limitation, `localNormSubgroup_maximalAbelianLayer`;
- for `K/ℚ_p` finite, every open finite-index subgroup of `Kˣ` is the norm subgroup of a finite
  **abelian** layer (`localAbelianExistence`), with `localExistence` retained only as the
  corollary that forgets abelianity;
- for a general nonarchimedean local field of residue characteristic `p`, every open finite-index
  subgroup of `Kˣ` whose index is prime to `p` is the norm subgroup of a finite abelian layer
  (`localAbelianExistence_primeToResidueCharacteristic`), again with a forgetful corollary; no
  `p`-primary equal-characteristic claim is exported;
- **uniqueness**: distinct finite abelian extensions have distinct norm subgroups
  (`localClassField_unique`). This is the half that turns existence into *the* class field
  attached to `N`, and it is false without the abelianity hypotheses;
- **the class field** `localClassField K p N`, defined from existence and canonical by uniqueness,
  with its characterizing equation `localClassField_normSubgroup`;
- **the correspondence** at its two local scopes: `localClassFieldCorrespondence`, the full
  correspondence for finite extensions of `ℚ_p`, and
  `localClassFieldCorrespondence_primeToResidueCharacteristic`, whose two carriers
  `LocalNormSubgroupsPrimeTo` and `AbelianLayerPrimeTo` are cut down by the prime-to-`p` condition
  so that the excluded equal-characteristic `p`-primary case cannot be read off it. Each scope
  carries both order statements: `..._le_iff` on subgroups and `..._orderReversing` on fields;
- **the quotient isomorphism and the degree**: `localAbelianGaloisEquiv` is an isomorphism
  `Kˣ / N_{L/K}(Lˣ) ≃ Gal(L/K)` onto the Galois group of the layer itself, not onto an
  abelianization, and `localAbelianGaloisEquiv_artinMap` says it is the abstract Artin map of the
  layer read through `abelianizationGalEquiv`. `index_localNormSubgroup` and
  `localClassField_index` are the equality `[Kˣ : N] = [L : K]`;
- injectivity of the absolute `artinMap` and the comparison with the profinite completion, both of
  which follow from existence;
- the compatibility of the Layer 7 conductors with existence: the norm subgroup attached to an
  abelian extension of conductor exponent `n` contains `U(K,n)` and no smaller step of the unit
  filtration, and the extension attached by existence to `U(K,n)·⟨π⟩` has that conductor.

The construction order is normative: norm subgroups first define the normic topology and its
completion; norm limitation precedes `localAbelianExistence_primeToResidueCharacteristic`; the
Layer 5 Kummer theory then gives `localAbelianExistence` for finite extensions of `ℚ_p`, after
which uniqueness, the correspondence, injectivity and the comparison with the profinite completion
follow. Local class field theory here is routed through the class formation and Kummer theory,
never through Lubin–Tate theory, which §1 places outside this roadmap. Full equal-characteristic
`p`-primary existence requires the excluded Artin–Schreier–Witt theory and is not asserted here.

There is deliberately no abstract existence theorem for `ClassFormation`. This layer verifies its
arithmetic and topological inputs in the two stated ranges. Existence must not appear as a
hypothesis in a structure used to prove reciprocity. The two directions of local class field
theory are proved in the correct order.

**Exit criterion.** `localClassFieldCorrespondence` and
`localClassFieldCorrespondence_primeToResidueCharacteristic` are proved — which subsumes
`localAbelianExistence`, `localClassField_unique` and both order statements — and `artinMap` is
injective.

### Layer 9: the local Weil group

*Prerequisites:* Layers 5–8; `LocalFieldsRamification` (`inertia`, `maximalUnramified`, and the
exact sequence `1 → I_K → G_K → Ẑ → 1`).

A full layer, not a corollary of reciprocity. Build, in order:

- **the carrier.** `localWeilGroup K ≤ G_K`, the preimage of `ℤ ⊆ Ẑ` under the imported surjection
  `G_K → Gal(K^ur/K) ≅ Ẑ`; it contains inertia (`inertia_le_localWeilGroup`), is normal, is dense
  in `G_K` and is a proper subgroup;
- **the topology.** `WeilGroup K` is a type synonym for that subgroup carrying the **Weil
  topology**, the unique group topology in which inertia, *carrying the profinite topology it
  already has as a closed subgroup of `G_K`*, is an open subgroup — equivalently, the unique group
  topology making `I_K ↪ W_K` an open topological embedding
  (`isOpenEmbedding_inertiaToWeil`, `weilTopology_unique`). ⚠ Requiring only that the subgroup be
  open does **not** determine the topology: one could refine the topology on `I_K` itself and
  translate it across the cosets, so the fixed profinite topology on `I_K` is part of the
  characterization, and the later local compactness and topological abelianization results use
  that stronger form. ⚠ It is also not the subspace topology: inertia is *not* open in `G_K`,
  because its image in `Ẑ` is the non-open singleton. Prove that `W_K` is a locally compact, totally disconnected topological group, that
  it is not compact, and that the inclusion `W_K → G_K` is a continuous injection with dense
  image;
- **functoriality under finite extensions.** `weilTransfer` is a continuous injection
  `W_L → W_K` with open image of index `[L:K]`; the degree map is multiplied by the residue degree
  along it (`weilDegree_weilTransfer`), so `deg_K = f(L/K) · deg_L`, equal only in the totally
  ramified case. For `L/K` finite Galois, restriction `weilRestrict : W_K → Gal(L/K)` is surjective
  with kernel the image of `weilTransfer`;
- **the exact sequence with inertia.** `weilDegree : W_K → ℤ` is surjective with kernel inertia,
  giving `1 → I_K → W_K → ℤ → 1`, and it agrees with the frozen `unramifiedCoordinate`
  (`unramifiedCoordinate_weilDegree`), which fixes the arithmetic normalization;
- **the abelianization comparison.** `localWeilArtinEquiv : Kˣ ≃ₜ* W_K^ab` onto the **topological**
  abelianization `W_K / closure ⁅W_K, W_K⁆`. ⚠ The algebraic `Abelianization (W_K)` is the wrong
  target: the commutator subgroup of `W_K` need not be closed. Prove `localWeilArtinEquiv_compat`
  and `mem_range_artinMap_iff`, identifying the image of `artinMap` in `G_K^ab` with the image of
  the Weil group.

Injectivity of `artinMap`, hence Layer 8, is a prerequisite of the abelianization comparison.
Global Weil groups are outside this roadmap.

**Exit criterion.** `W_K` has a carrier, a topology, functoriality, an exact sequence and a
reciprocity isomorphism, each with a name.

### Layer 10: global carriers, the Brauer sequence, and the sum of local invariants

*Prerequisites:* Layers 1, 5; `GlobalNumberFields`; `ProfiniteCohomology`. **Not** the global
class formation and **not** the global Artin map: Layer 11 builds both out of this layer's
output.

Use the idele and idele-class carriers from `GlobalNumberFields` and assemble both the idele
formation and the idele-class formation for a fixed separable closure.

Build the archimedean half of the local package here, since the global sum needs it: the complex
Brauer group vanishes, the real Brauer group is cyclic of order two, and the nontrivial real class
has invariant `1/2` (`infiniteInvMap`, `infiniteInvMap_eq_zero_of_isComplex`,
`range_infiniteInvMap_of_isReal`). ⚠ Real places are not ignorable: dropping them already breaks
the sum formula for `ℚ(i)/ℚ`.

Prove that continuous cohomology of the absolute Galois group is the imported finite-quotient
colimit from `ProfiniteCohomology`; do not build a second continuous carrier here. Then prove the
exact sequence

```text
0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0
```

in invariant coordinates: `finiteInvAt` and `infiniteInvAt` are the local invariants,
`brauerSupport` is the finite ramification set, `sumLocalInv` is the middle map,
`eq_zero_of_localInv_eq_zero` is exactness at `Br K` (Albert–Brauer–Hasse–Noether),
`sumLocalInv_eq_zero` is exactness in the middle, and `exists_br_of_sum_eq_zero` is exactness on
the right.

The hard arithmetic input is separated from the abstract formalism. The classical route is to
establish the first and second fundamental inequalities for cyclic layers and deduce the required
`H¹`-vanishing and the order of `H²`. The required inputs are:

- the Herbrand quotient of the relevant `S`-idele and `S`-unit modules;
- the first fundamental inequality;
- the second fundamental inequality, reduced to cyclic extensions of prime degree by the usual
  Sylow and tower arguments;
- `H¹`-vanishing for idele classes, from which `surjective_ideleToClassH2` follows.

Finally define the layer invariant. On an idele layer, `H²(Gal(L/K), I_L)` is the direct sum of the
local Brauer groups, and `ideleSumLocalInv` is the sum of `ideleLocalInvAt` and
`ideleInfiniteInvAt` over the places, finitely supported by `ideleSupport`. Because
`sumLocalInv_eq_zero` kills the image of `H²(Gal(L/K), Lˣ)`, that sum descends along
`ideleToClassH2` to `globalInv`, with `globalInv_ideleToClassH2` recording the descent equation.
Prove `globalInv_injective` and `globalInv_range`.

Global reciprocity, global existence, Chebotarev, and the classification of norm subgroups are
forbidden inputs to this layer: each is downstream of the abstract Artin map, which is downstream
of the class formation, which is downstream of `globalInv`.

**Exit criterion.** `globalInv` exists, is the sum of local invariants by a named theorem, and no
declaration of this layer mentions `globalArtinMap`.

### Layer 11: the global class formation and global Artin reciprocity

*Prerequisites:* Layers 1–4, 6, 7, 10; `NumberFieldArithmetic`.

Package `globalInv` into `globalClassFormation`, and record `globalClassFormation_inv`: the
invariant of the global class formation *is* the sum-of-local-invariants map of Layer 10, not a
second normalization. The local–global compatibility of fundamental classes
(`ideleSumLocalInv_fundamentalClass`) is then a comparison theorem stated after the structure
exists, and may not be used in its construction.

For a finite Galois extension `L/K`, transport the abstract Artin equivalence to

```text
C_K / N_{L/K}(C_L) ≃ Gal(L/K)^ab.
```

The resulting `globalArtinMap` must satisfy:

- compatibility with every local Artin map, through the decomposition group at a place
  (`globalArtinMap_local`, with local factor `localArtinAt`, the completion instance of
  `artinMap`);
- triviality on principal ideles (`globalArtinMap_principal`, the reciprocity law), proved by the
  cyclotomic crossing argument;
- compatibility in towers;
- agreement, at every unramified finite prime, with `NumberFieldArithmetic.artinHomAway`
  (`globalArtinMap_ideal`), identified by its prime values and the supplier's uniqueness theorem;
- arithmetic Frobenius normalization (`globalArtinMap_isArithFrobAt`).

Adapt `[IsAbelianGalois K L]` to the explicit commutativity hypothesis of
`NumberFieldArithmetic.artinHomAway` through the single adapter
`algEquiv_commute_of_isAbelianGalois`. The archimedean Artin package belongs here: `Art_ℂ` is
trivial, and `Art_ℝ` has kernel `ℝ_{>0} = N_{ℂ/ℝ}(ℂˣ)` and sends a negative element to
conjugation; its invariant coordinates are the Layer 10 `infiniteInvMap`.

There is one ideal-theoretic Artin map in the portfolio. The class-field-theory map is compared to
it by a theorem, not duplicated.

**Exit criterion.** The global map is the transported abstract Artin map and its value on an
unramified prime is the existing Frobenius class.

### Layer 12: separate arithmetic global existence, the norm index, and the global correspondence

*Prerequisites:* Layers 10, 11; `GlobalNumberFields` (moduli and ray classes). Every target of this
layer is for a **number field**; global class field theory for function fields is outside this
roadmap (§1).

After global reciprocity is established, develop the topology of idele-class norm subgroups —
they are open, of finite index, distinct for distinct finite abelian extensions, and monotone in
the layer subgroup, hence inclusion-reversing on fields — and prove:

- `isOpen_globalNormSubgroup`, `finiteIndex_globalNormSubgroup`, `globalNormSubgroup_mono`, the
  concrete norm limitation `globalNormSubgroup_maximalAbelianLayer`, and the direction test
  `globalNormSubgroup_top`;
- every open finite-index subgroup of `C_K` is the norm subgroup of a finite **abelian** layer of
  the global formation (`globalAbelianExistence`), with `globalExistence` retained only as the
  corollary that forgets abelianity;
- **uniqueness**, `globalClassField_unique`, and hence the class field `globalClassField K N` with
  its characterizing equation `globalClassField_normSubgroup`;
- **the global class-field correspondence** `globalClassFieldCorrespondence`, together with both
  order statements, `globalClassField_le_iff` on subgroups and `globalClassField_orderReversing`
  on fields;
- **the quotient isomorphism and the degree**: `globalAbelianGaloisEquiv` is an isomorphism
  `C_K / N_{L/K}(C_L) ≃ Gal(L/K)` onto the Galois group itself, characterized as the abstract
  Artin map by `globalAbelianGaloisEquiv_artinMap`; `index_globalNormSubgroup` and
  `globalClassField_index` give `[C_K : N] = [L:K]`, and `galClassFieldEquiv` transports the
  layer's Galois group to `Gal(classField V / K)`;
- the norm-index theorem `[C_K : N C_L] = [L:K]` for finite abelian `L/K` in the concrete
  extension carrier (`card_ideleClassNormQuotient`);
- ray-class factorization of the global Artin map using the imported ray-class groups
  (`rayClassArtinMap`) and its splitting law.

As in the local case there is no abstract existence theorem: this layer verifies its own
idele-theoretic inputs, and existence never appears as a hypothesis in a structure used to prove
reciprocity.

**Exit criterion.** `globalClassFieldCorrespondence` is a theorem — an order isomorphism between
the open finite-index subgroups of `C_K` and the abelian layers of `G_K`, order-reversing when
read on fields — together with `globalAbelianGaloisEquiv` and `globalClassField_index`.

### Layer 13: norm theorems and class fields

*Prerequisites:* Layers 10, 11, 12; `GlobalNumberFields` (orders and `Pic`).

Develop the `S`-idele and unit-lattice Herbrand calculations on the imported idele carriers, as
already required for Layer 10, and prove the cyclic Hasse norm theorem
`cyclicHasseNorm`: for cyclic `L/K`, `x : Kˣ` is a global norm exactly when its principal idele is
an idele norm. Separately define the genuine placewise predicates `IsFiniteLocalNorm` and
`IsInfiniteLocalNorm` using the canonical local étale algebras
`K_v ⊗_K L` and `K_w ⊗_K L`, where finite places use `v.adicCompletion K` and infinite places use
Mathlib's `w.Completion`. Complex infinite places remain quantified and have a named theorem saying
that their norm condition is automatic. Then define `IsLocalNormEverywhere` as the conjunction of
the finite and infinite families; it is not an alias for an idelic range predicate.

Prove the named bridge `principalIdele_mem_range_ideleNormMap_iff`. Projection of an idelic norm
gives all local norm equations. In the converse direction, choose a preimage in every local étale
algebra, prove that outside a finite set the preimage may be chosen in the local unit subgroup
(using norm-surjectivity on units for unramified extensions), and assemble those choices in the
restricted product; treat real and complex factors explicitly. Export the consumer-facing composite
as `isGlobalNorm_iff_isLocalNormEverywhere`. The global half is the vanishing of
`Ĥ^{-1}(Γ, C_L)`, itself a consequence of the Layer 10 computation of the Herbrand quotient of the
idele classes; the cyclic hypothesis is essential. Record the biquadratic counterexample: for
`ℚ(√13,√17)/ℚ`, `25` is a local norm everywhere but not a global norm.

Every named class field of this layer is an **application** of the Layer 12 correspondence, never a
substitute for it: each one names its own norm subgroup and is then `classField` of
`globalClassField` at that subgroup. Prove that the ray subgroup of a modulus is open
(`isOpen_raySubgroup`) and of finite index (`finiteIndex_raySubgroup`), package it as
`rayNormSubgroup`, and define `rayClassField 𝔪` as its class field; `hilbertClassField` is
`rayClassField` at `GlobalNumberFields.Modulus.one` and `narrowHilbertClassField` is
`rayClassField` at `GlobalNumberFields.narrowModulus`. The Galois/class-group isomorphisms
(`gal_rayClassField_equiv_rayClassGroup`, `gal_hilbertClassField_equiv_classGroup`) are then the
composite of `galClassFieldEquiv`, `globalClassFieldGaloisEquiv` and
`GlobalNumberFields.ker_rayClassQuotient`, not independent computations. Prove also the maximal
unramified properties, splitting criteria, and the principal ideal theorem.

Derive Kronecker–Weber from global existence (`kroneckerWeber`) and prove that the least
cyclotomic level equals the abelian conductor, including the `n ≢ 2 mod 4` normalization. Prove
the abelian conductor–discriminant formula from the local formula and the character dictionary,
and the compatibility of conductors with ramification.

For an order `O` in a **quadratic** field, the arithmetic input is the idelic ring-class quotient
`ringClassIdeleQuotient : C_K → Pic O`, built from the imported conductor and the congruence
description of the group `O.invertibleProperFractionalIdeals`; quotient only by the principal
classes encoded by `O.mkPic`, obtaining `Pic O`. Raw proper ideals, including noninvertible ideals
in `IdealClassMonoid O`, never enter this construction. Its kernel is `ringClassNormSubgroup`, and
`ringClassField` is the class field of that subgroup — so the ring class field, like the Hilbert
and ray class fields, is an application of the Layer 12 correspondence, and
`gal_ringClassField_equiv_pic` follows from it rather than being assumed. Freeze
`ringClassArtinMap` on that invertible carrier and its principal-kernel criterion
`ringClassArtinMap_eq_one_iff`. Freeze also the isomorphism `Gal(H_O/K) ≃ Pic O`
(`gal_ringClassField_equiv_pic`), its ramification bound, the maximal-order comparison
`ringClassField_maximal` — which by `globalClassField_unique` reduces to identifying the two norm
subgroups — and the splitting criterion. Orders and Picard groups remain owned by
`GlobalNumberFields`.

⚠ The quadratic hypothesis `Module.finrank ℚ K = 2` is carried in the type of `ringClassField` and
of every theorem about it, and is load-bearing. The congruence description of `Pic O` as a
ray-class quotient `I_K(𝔣)/P_{K,ℤ}(𝔣)` needs `O = ℤ + 𝔣𝒪_K`, which holds for every order in a
quadratic field and fails in higher degree: in a cubic field `ℤ + f𝒪_K` has index `f²`, so an
order of index `f` is not of that form and `Pic O` is not cut out by the conductor alone. This
roadmap therefore asserts no ring class field for a general nonmaximal order and does not import
quadratic terminology into higher degrees. The Hilbert class field, by contrast, is defined in
every degree.

**Exit criterion.** `cyclicHasseNorm`, `rayClassField`, `hilbertClassField`,
`narrowHilbertClassField`, `ringClassField` for quadratic orders, and `kroneckerWeber` are all
stated against the imported carriers, and every class field among them is a value of `classField`
at a value of `globalClassField`.

### Layer 14: Hilbert reciprocity and quadratic reciprocity

*Prerequisites:* Layers 5, 10, 11, 13.

Define each finite local Hilbert invariant by applying `localSymbol` at the completion
(`finiteHilbertInvariantAt`) and each real invariant by the archimedean package of Layer 10
(`infiniteHilbertInvariantAt`). Prove finite support, then freeze

```text
ClassFieldTheory.hilbertProductFormula
```

in additive cohomological form: the sum of the local `ZMod 2` invariants is zero. It is the
Layer 10 sum-of-invariants theorem applied to the Brauer class of the quaternion symbol, not an
independent computation. The equivalent multiplicative statement is `∏_v (a,b)_v = 1`.
`QuadraticFormInvariants` later proves its norm-equation/quaternion symbol agrees with this one
and inherits the product formula.

Derive quadratic reciprocity for `ℚ`, including the real and dyadic factors, from
`hilbertProductFormula`. This is the explicit reciprocity law owned here; higher power
reciprocity laws (Artin–Tate XII) are follow-on work using the same symbols.

**Exit criterion.** `hilbertProductFormula` is proved from `sumLocalInv_eq_zero`, and quadratic
reciprocity is derived from it.

---

## 5. Required regression tests and worked examples

These are acceptance tests, not optional exposition. They pin the direction and normalization of
the Artin map in cases where the answer is elementary, and they are stated in `Suggested.lean`
under the names given below. They are intended to catch three errors which are easy to hide in
an abstract development:

1. using an arbitrary equivalence instead of cup product with the fundamental class;
2. using the cup-product direction `Γ^ab → A^U/N(A^V)` as the Artin map instead of its inverse;
3. normalizing the Artin map by geometric rather than arithmetic Frobenius;
4. reversing the class-field correspondence, i.e. attaching the maximal abelian extension to `Kˣ`
   rather than to the trivial subgroup.

The first versions may be proved for finite-level maps. They should not wait for the
inverse-limit absolute Artin map.

### 5.1 Trivial layer

For the layer `U/U`, the norm quotient, `(U/U)^ab`, and the Artin map are all trivial
(`ClassFormation.artinMap_trivialLayer`). This should reduce to the unique map between trivial
groups, not to a cardinality argument.

The trivial layer is also the direction test for the correspondence: `localNormSubgroup_top` and
`globalNormSubgroup_top` say that the layer `V = ⊤`, which cuts out the ground field itself, has
norm subgroup the whole of `Kˣ` resp. `C_K`. This is the extreme case of the fourth error above,
and it is the reason the subgroup form of the correspondence (`localClassField_le_iff`,
`globalClassField_le_iff`) preserves inclusions while the field form
(`localClassField_orderReversing`, `globalClassField_orderReversing`) reverses them.

### 5.2 Kernel, quotient, and cyclic layers

For every finite normal layer test the elementwise formulae `artinMap a = artinEquiv (class a)`
(`artinMap_apply`, by `rfl`) and `artinMap a = 0 ↔ a ∈ N(A^V)` (`artinMap_eq_zero_iff`). For a
cyclic layer, `Nat.card (A^U/N(A^V)) = [U:V]` (`card_normQuotient`), and the Artin symbol of `a`
generates `Γ` exactly when the class of `a` generates the norm quotient
(`isGenerator_artinMap_iff`). The character formula `character_artinMap` is the most sensitive
abstract test of the sign convention; it is proved from the definition of `artinEquiv`, not
postulated as a second normalization.

### 5.3 Unramified local extensions

Let `L/K` be unramified of degree `n`, let `π` be a uniformizer of `K`, and let `q` be the size of
the residue field. Prove:

```text
Kˣ / N(Lˣ) ≃ ℤ/nℤ, class(π) ↦ 1          (localNormQuotientEquivZMod_unramified)
localArtinMap(π) = Frob_arith              (localArtinMap_uniformizer)
localArtinMap(u) = 1 for every unit u      (localArtinMap_unit_of_unramified)
localArtinMap(x) = Frob_arith^{v(x)}        (localArtinMap_eq_frobenius_pow_valuation)
Frob_arith(x̄) = x̄^q.
```

The proof of `localArtinMap_uniformizer` must use the arithmetic Frobenius object exported by
`LocalFieldsRamification`; a new automorphism with the right residue-field action must not be
introduced. For `K = ℚ_p` this is the principal sign test for local reciprocity. The concrete
example `ℚ₂(ζ₅)/ℚ₂` is unramified of degree four, and `localArtinMap(2)(ζ₅) = ζ₅²`
(`localArtinMap_Q2_zeta5`); replacing arithmetic by geometric Frobenius changes the exponent from
`2` to `3` modulo `5`. The general local cyclotomic form is `localArtinMap(π)(ζ_m) = ζ_m^q`
(`localArtinMap_cyclotomic_uniformizer`).

At `ℚ_p`, verify further that the unramified coordinate of `Art(p)` is `1`, a unit has
coordinate `0`, and `χ_cyc(Art(u)) = u⁻¹`; at `p = 2`, test `u = -1, -3` and the uniformizer
separately.

### 5.4 Quadratic extensions

Let `L/K` be quadratic and let `τ` be its nontrivial automorphism. Prove

```text
localArtinMap(a) = 1    iff a is a norm from L,
localArtinMap(a) = τ    iff a is not a norm from L
```

(`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`), the smallest nontrivial test of the
norm-kernel theorem, and the Hilbert-symbol comparison
`localArtinMap(a) = τ iff (a,d)_K = -1` (`localArtinMap_quadratic_eq_hilbertSymbol`).

⚠ The Hilbert-symbol comparison must be stated about the extension `K(√d)` **exactly**, so its
hypotheses are: `d` a nonsquare in `Kˣ`, a chosen `s : L` with `s² = d`, `K(s) = L`, `[L:K] = 2`,
and `τ s = -s` for the nontrivial `τ`. A bare existential `∃ s : L, s² = d` does not pin `L`: it
also holds for `L = K(√d, √e)`, which has degree four and three nontrivial automorphisms, none of
which the symbol `(a,d)_K` determines. With only the existential hypothesis the statement is
false, not merely weak.

For a global quadratic field `L/ℚ` of discriminant `D` and a rational prime `ℓ ∤ D`, the Artin
symbol of `(ℓ)` is trivial exactly when `ℓ` splits, i.e. `Kronecker(D,ℓ) = 1`
(`globalArtinMap_quadratic_prime`). The special case `ℚ(i) = ℚ(ζ₄)` is mandatory:
`ℓ ≡ 1 mod 4` gives `Art((ℓ)) = 1` and `ℓ ≡ 3 mod 4` gives complex conjugation, i.e.
`Art((ℓ))(i) = i^ℓ` (`globalArtinMap_Qi_prime`). For `ℚ(√5)`, `ℓ ≡ ±1 mod 5` gives `1` and
`ℓ ≡ ±2 mod 5` gives `τ` (`globalArtinMap_Qsqrt5_prime`). Compute `ℚˣ/N_{ℚ(i)/ℚ}ℚ(i)ˣ` locally
and compare the sign at the real place; for `ℚ(√5)/ℚ`, check the norm index and the cyclic Hasse
norm theorem.

### 5.5 Cyclotomic fields

Let `m ≥ 1` and let `ℓ` be a prime not dividing `m`. Under the standard identification
`Gal(ℚ(ζ_m)/ℚ) ≃ (ℤ/mℤ)ˣ`, prove `Art((ℓ))(ζ_m) = ζ_m^ℓ` (`globalArtinMap_cyclotomic_prime`);
equivalently `Art((ℓ))` corresponds to `ℓ mod m`. This is a direct test that the roadmap uses
arithmetic rather than geometric Frobenius: a quadratic example alone cannot distinguish an
automorphism from its inverse. The proof should factor through `globalArtinMap_ideal`,
`NumberFieldArithmetic.artinHomAway_apply_prime` and `IsArithFrobAt`, and the action of arithmetic
Frobenius on roots of unity; it must not define a second cyclotomic Artin map.

Small numerical checks: for `ℚ(ζ₅)/ℚ`, `Art((2))(ζ₅) = ζ₅²` of order four
(`globalArtinMap_zeta5_two`), `Art((3))(ζ₅) = ζ₅³`, `Art((11))(ζ₅) = ζ₅`; for `ℚ(ζ₈)/ℚ`,
`Art((3))`, `Art((5))`, `Art((7))` send `ζ₈` to `ζ₈³`, `ζ₈⁵`, `ζ₈⁷`. Verify
`ℚ(i) ⊂ ℚ(ζ₄)`, `ℚ(√2) ⊂ ℚ(ζ₈)`, and `ℚ(√5) ⊂ ℚ(ζ₅)` with the correct conductor.

### 5.6 Compatibility and tower tests

For the quadratic subfield `ℚ(√5)` of `ℚ(ζ₅)`, restriction of the cyclotomic Artin symbol of
`(ℓ)` is trivial exactly when `ℓ` is a square modulo `5` (`globalArtinMap_zeta5_restrict_Qsqrt5`);
this tests the tower restriction square and the arithmetic formulae simultaneously.

For `K ≤ E ≤ L`, compare the three finite Artin maps and prove the norm/transfer squares from
Artin–Tate (`artinMap_groundInclusion`, `artinMap_groundNorm`), both when the Galois group is
cyclic of order four (`ℚ ≤ ℚ(√5) ≤ ℚ(ζ₅)`) and when it is the Klein four group
(`ℚ(√5,√13)/ℚ`, restricted to all three quadratic subfields). These two cases distinguish
inclusion, quotient, and group-theoretic transfer and catch several plausible but false
commutative diagrams. In a cyclic group of order four, transfer to the subgroup of order two is
not interchangeable with the quotient map; the statement must use the actual transfer.

### 5.7 Downstream worked examples

- Exhibit `25` as the standard failure of the Hasse norm principle in `ℚ(√13,√17)/ℚ`.
- Compute the Hilbert and narrow Hilbert class fields in small quadratic examples and test the
  principal ideal theorem.
- Derive quadratic reciprocity from `hilbertProductFormula`, including the real and dyadic
  factors.
- For a nonmaximal imaginary-quadratic order, compare `Gal(H_O/K)` with
  `GlobalNumberFields.Pic O`; do not reconstruct the order or its ideals locally. The worked
  example is an order in a quadratic field because `ringClassField` is stated only there; there is
  no higher-degree counterpart to test.

### 5.8 Minimal mandatory suite

The following are mandatory before the roadmap is complete: `artinMap_trivialLayer`;
`localNormSubgroup_top`; `localArtinMap_uniformizer` for an arbitrary finite unramified extension;
`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`; `globalArtinMap_Qi_prime`;
`globalArtinMap_cyclotomic_prime` with the explicit `ℚ(ζ₅)` value at `2`. Together they test
triviality, the direction of the class-field correspondence, the norm kernel, a nontrivial group
of order two, arithmetic Frobenius, and a non-involutive Artin symbol.

The arithmetic tests should be added only after the following supplier maps have stable names: a
chosen primitive root `ζ_m` and its generation theorem; the standard equivalence between the
cyclotomic Galois group and `(ZMod m)ˣ`; the Frobenius action on `ζ_m`; the quadratic conjugation
automorphism; the Kronecker/Legendre splitting criterion; the prime-idele adapter
`primeIdeleClass` used by `globalArtinMap_ideal`; and restriction of automorphisms to an
intermediate field. If one of these is absent, it is a named prerequisite in the relevant supplier
roadmap; the class-field-theory test must not introduce a private replacement merely to make the
example stateable.

---

## 6. Policy for `Suggested.lean`

`Suggested.lean` is a design contract, not a second implementation.

It contains:

- the structures `Formation`, `NormalLayer`, `LayerRestriction`, `LayerRefinement`, and
  `ClassFormation`;
- the finite-layer norm quotient, the layers of open normal subgroups, the abelian-layer predicate
  over Mathlib's closed commutator subgroup, and the canonical `maximalAbelianLayer`;
- restriction, corestriction, inflation and their tower laws;
- `fundamentalClass` and its defining invariant, with its restriction, corestriction, inflation
  and conjugation formulae;
- the generic `cupClass` and `tateTheorem`, whose three hypotheses are separate explicit
  arguments, together with the three `ClassFormation` theorems that discharge them and the
  transparent `tateIso` obtained by applying one to the others;
- the transparent definitions of `nakayamaNegTwo`, `artinEquiv`, and `artinMap`, with
  `artinMap_apply` and `artinEquiv_eq_tateIso` proved by `rfl`;
- the character formula, the norm-kernel theorem, and the four functoriality diagrams;
- transparent adapters showing that the local and global Artin maps are transports of the
  abstract map, `normResidue` as the multiplicative form of `localArtinEquiv`, and the absolute
  local `artinMap` with its normalizations;
- the local-invariant, duality, Euler-characteristic and conductor contracts of Layers 5 and 7;
- the Weil-group carrier, topology, functoriality, inertia sequence and reciprocity isomorphism of
  Layer 9;
- the Brauer sequence and sum-of-local-invariants contracts of Layer 10, stated before
  `globalClassFormation` consumes them;
- the class-field correspondences of Layers 8 and 12, each assembled transparently from its
  existence theorem, its uniqueness theorem and its order statement, with the class field itself
  *defined* from existence rather than pinned by an unproved equation;
- the Hasse-norm, class-field and Hilbert-reciprocity contracts of Layers 13 and 14, with
  `rayClassField`, `hilbertClassField`, `narrowHilbertClassField` and `ringClassField` written as
  applications of `classField ∘ globalClassField`;
- the acceptance tests of §5 as named theorem statements.

It does not contain:

- a new definition of Tate cohomology;
- a new continuous-cohomology complex;
- an arbitrary `Nonempty (X ≃ Y)` where a canonical map is required;
- an existence statement whose witness is not pinned: both final existence theorems constrain the
  layer to be abelian, and both are accompanied by the uniqueness theorem that makes the witness
  canonical;
- a reciprocity map whose relationship with cup product is only stated in prose;
- a forward reference: the file's section order is the layer order of §4, and no declaration
  mentions a name introduced below it;
- a `sorry` inside a statement: every missing map used in a statement is a named `sorry`
  definition with its own docstring.

The derived Artin definitions are ordinary definitions with bodies rather than opaque `sorry`
declarations. This makes the eventual target definitionally equal to the inverse of the
Tate isomorphism while the leaf constructions remain the recorded `sorry` targets. The file
imports the four supplier roadmaps; it type-checks against their `Suggested.lean` files at the
heads recorded in the pull request, and it will build in CI once those roadmaps merge.

---

## 7. Dependency order

The graph below is the layer order of §4, and it is acyclic: every arrow points from a layer to a
layer built later. Reading it upwards from any node gives that layer's prerequisites.

```text
Mathlib finite-group cohomology and Tate cohomology
                       |
  Richard Hill finite-Tate additions and change-of-groups maps
                       |
     Layer 0: generic Tate cohomology, cup product, res/cor, Tate's theorem
                       |
     Layer 1: formations, finite normal layers, res/cor, towers
                       |
     Layer 2: class formations and fundamental classes
                       |
     Layer 3: Tate's theorem for a class formation
                       |
     Layer 4: the abstract Artin map
                       |
        +--------------+--------------------------------+
        |                                               |
ProfiniteCohomology                              GlobalNumberFields
LocalFieldsRamification                          NumberFieldArithmetic
        |                                               |
        v                                               |
 Layer 5: local coefficients, Br K, invMap,              |
          localSymbol, local duality                     |
        |                                               |
        +-----------------------------+                 |
        |                             |                 |
        v                             |                 v
 Layer 6: local class formation,      +------> Layer 10: idele carriers,
          finite local reciprocity                      Brauer sequence,
        |                                               sum of local invariants
        v                                                       |
 Layer 7: absolute local Artin map,                             v
          normalizations, conductors                    Layer 11: global class
        |                                                        formation,
        v                                                        global reciprocity
 Layer 8: local existence,                                      |
          the local correspondence                                |
        |                                                        v
        v                                               Layer 12: global existence,
 Layer 9: local Weil group                                       the global
                                                                 correspondence,
                                                                 norm index
                                                                |
                                                                 v
                                                        Layer 13: Hasse norm theorem,
                                                                  class fields,
                                                                  Kronecker–Weber
                                                                |
                                                                 v
                                                        Layer 14: Hilbert reciprocity,
                                                                  quadratic reciprocity
```

Layer 5 feeds both the local and the global column: the local column consumes `invMap` on `K`
itself, the global column consumes it at every completion, and both consume the Galois dictionary
`classField` recorded there. Layer 4's norm limitation theorem also feeds both existence layers.
Layer 11 additionally consumes the absolute local Artin map of Layer 7 through `localArtinAt`.

The abstract layers 0–4 can be implemented and reviewed before any arithmetic instance. Within the
local column, Layer 5's coefficient dictionaries and Kummer transports can begin as soon as
`ProfiniteCohomology` is available, in parallel with Layers 1–4. Ring class fields wait for both
global existence and the `GlobalNumberFields` order/`Pic` API.

---

## 8. References and implementation sources

- E. Artin and J. Tate, *Class Field Theory*, AMS Chelsea, 2009: Chapter XIV
  (Sections 1–5: formations, field formations and Brauer groups, class formations, the Main
  Theorem, the reciprocity-law isomorphism, and the abstract existence theorem under the additional
  axioms IIIa–IIId); Chapters V–VIII
  for the fundamental inequalities, the global reciprocity law and the existence theorem;
  Chapter XI §5 for conductors; Chapter XII for explicit reciprocity laws; Chapter XV for Weil
  groups.
- J. Tate, *Global class field theory*, in Cassels–Fröhlich, *Algebraic Number Theory*: global
  class formations and cohomological class field theory.
- J.-P. Serre, *Local Fields*, Chapters XI–XIV: local class formations, the character formula
  for the reciprocity map, the local invariant, and normalization conventions; *Galois
  Cohomology* for local duality and Euler characteristics.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*: finite and profinite
  cohomology, local duality, and global formations.
- J. Neukirch, *Algebraic Number Theory*, Ch. VI–VII: local and global class field theory.
- J. S. Milne, *Class Field Theory*: the Tate–Nakayama theorem, idelic reciprocity, the Hasse
  norm theorem, and examples.
- D. A. Cox, *Primes of the Form x² + ny²*, §7 (Prop. 7.22, the ring class group of an order
  `ℤ + 𝔣𝒪_K` in a quadratic field as a ray-class quotient) and §9 (Thm. 9.18, `Gal(H_O/K) ≃ Pic O`):
  the source and the exact scope of the ring class field targets of Layer 13.
- A. Weil, *Sur la théorie du corps de classes*, J. Math. Soc. Japan 3 (1951); J. Tate,
  *Number theoretic background*, in *Automorphic Forms, Representations and L-functions* (Corvallis),
  Part 2, §1: the local Weil group, its topology, its functoriality and `Kˣ ≃ W_K^ab`.
- J. Tate, *The higher dimensional cohomology groups of class field theory*, Ann. of Math. 56
  (1952); T. Nakayama, *Cohomology of class field theory and tensor product modules I*, Ann. of
  Math. 65 (1957): the two theorems named in §2.4.
- `leanprover-community/mathlib4`, `Mathlib/RepresentationTheory/Homological/TateCohomology`
  and `Mathlib/RepresentationTheory/Homological/ContCohomology`.
- `kbuzzard/ClassFieldTheory`, especially `ClassFieldTheory/Cohomology/`.
- Richard Hill and Edison Xie's continuous-cohomology and cup-product work, including the FLT
  repository versions.

Implementation should cite exact theorem numbers and exact source commits in file docstrings as
the supplier audit is completed. The README records the mathematical contract; a private
provenance ledger is not a substitute for public, checkable source references.
