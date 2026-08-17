# Roadmap: class field theory

## Purpose

The central object of this roadmap is an **abstract class formation** in the sense of
Artin–Tate. The build is organised around the implication

```text
formation
  -> class-formation axioms
  -> fundamental classes
  -> Tate's theorem
  -> finite-level Artin maps
  -> local and global Artin reciprocity
  -> existence theorems
  -> local invariants, duality, conductors, and the Weil group
  -> norm theorems, class fields, and Hilbert reciprocity.
```

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
  Local/
  Global/
  Existence/
  LocalInvariants/
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
7. The local class formation, local Artin reciprocity, and the arithmetic-Frobenius
   normalization; the absolute local Artin map into the topological abelianization of `G_K`, its
   unramified coordinate and cyclotomic-character normalization; local conductors.
8. The global idele-class formation, global Artin reciprocity, and comparison with the unique
   ideal-theoretic Artin map supplied by `NumberFieldArithmetic`.
9. The norm-group correspondence and the local and global existence theorems.
10. The local Brauer group on the imported continuous carrier, its invariant map, and the
    cohomological local Hilbert symbol built from Kummer classes, the continuous cup product,
    and the invariant; bilinearity and the Steinberg relation.
11. Local Tate duality for the named evaluation pairing, finiteness of `H⁰`, `H¹`, `H²`, and
    the local Euler-characteristic formula, in cardinality and `𝔽_p`-rank form.
12. The local Weil group and the isomorphism `Kˣ ≃ W_K^ab`.
13. The cyclic Hasse norm theorem and the norm-index theorem.
14. The Hilbert, narrow Hilbert, ray, and ring class fields; Kronecker–Weber; the
    conductor–discriminant formula.
15. The global class formation packaged with its fundamental classes, the sum of local
    invariants, and Hilbert reciprocity (`hilbertProductFormula`), with quadratic reciprocity as
    the explicit reciprocity law derived from it.

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
  XV; the local Weil group is included);
- explicit power-reciprocity laws beyond quadratic reciprocity (Artin–Tate XII);
- Lubin–Tate theory and any construction of local class field theory not routed through the
  class formation;
- Artin–Schreier–Witt theory, hence `p`-primary local existence in equal characteristic `p`;
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
inflation formula is scaled: `inf(u_{U,V}) = [V : V'] · u_{U,V'}`. These statements are needed
to apply Tate's theorem to every subgroup of `Γ`.

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

Artin–Tate prove it from their Preliminaries §2 Theorem A, the cup-product criterion (surjective,
bijective, injective in three consecutive degrees for every subgroup), and call the
class-formation specialization the **Main Theorem** (Chapter XIV §4, Theorem 1). The
generalization to an arbitrary coefficient module `M` with `Tor₁^ℤ(M,C) = 0`,

```text
Ĥ^r(Γ,M)  ≃  Ĥ^{r+2}(Γ, M ⊗ C),
```

is Nakayama's (Ann. of Math. 65, 1957) and is what the literature calls the **Tate–Nakayama
theorem**; it should be proved in the generic Tate-cohomology supplier if it is not already
available. The class-field-theory application uses `M = ℤ`, i.e. Tate's theorem, and the roadmap
names it accordingly: `tateIso`. The explicit degree `-2 → 0` map is Artin–Tate's *Nakayama
map*, after Nakayama's 1935 explicit formula (`nakayamaNegTwo`); it is not to be confused with
the Tate–Nakayama theorem.

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
norm subgroup. In `Suggested.lean`, `nakayamaNegTwo`, `artinEquiv` and `artinMap` are ordinary
definitions with bodies: `artinEquiv` is `nakayamaNegTwo.symm` **definitionally**, and
`artinMap_apply` and `artinEquiv_eq_tateIso` are proved by `rfl`. Only the leaves — `tateIso`,
the two low-degree identifications, and the cup-product map — carry `sorry`.
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
  `ℚ/ℤ`. Restriction multiplies invariants by the degree; corestriction preserves them.
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
| class-formation axioms | `ClassFormation` |
| invariant map | `ClassFormation.inv` |
| fundamental class | `ClassFormation.fundamentalClass` |
| cup with the fundamental class | `ClassFormation.cupFundamentalClass` |
| Tate's theorem for the class formation | `ClassFormation.tateIso` |
| degree `-2 → 0` Nakayama direction | `ClassFormation.nakayamaNegTwo` |
| quotient-form Artin reciprocity | `ClassFormation.artinEquiv` |
| Artin map on the ground level | `ClassFormation.artinMap` |
| character characterization | `ClassFormation.character_artinMap` |
| norm kernel | `ClassFormation.ker_artinMap` |
| four functoriality diagrams | `artinMap_groundInclusion`, `artinMap_groundNorm`, `artinMap_conj`, `artinMap_quotient` |
| local class formation | `localClassFormation` |
| finite local Artin equivalence | `localArtinEquiv`, with `normResidue` its multiplicative form |
| finite local Artin map | `localArtinMap` |
| unramified normalization | `localArtinMap_uniformizer`, `normResidue_uniformizer` |
| absolute local Artin map and coordinates | `artinMap`, `unramifiedCoordinate`, `cyclotomicCharacter_artinMap`, `cyclotomicCharacter_artinMap_padic` |
| local Weil group | `localWeilGroup`, `localWeilArtinEquiv` |
| local existence | `localExistence` |
| global idele-class formation | `globalClassFormation` |
| finite global Artin equivalence | `globalArtinEquiv` |
| global Artin map | `globalArtinMap` |
| comparison with ideal Artin | `globalArtinMap_ideal`, `abelianArtinHomAway` |
| local–global compatibility | `globalArtinMap_local`, `localArtinAt` |
| global existence and norm index | `globalExistence`, `card_ideleClassNormQuotient` |
| continuous local coefficients | `GalRep`, `H`, `muNRep`, `kummerClass`, `kummerEquiv_mixed` |
| Kummer transport and local Brauer group | `absoluteGaloisGroupComparison`, `muNRepCoeffDictionary`, `Br`, `invMap`, `brRes`, `brCor` |
| local invariant and Hilbert pairing | `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing`, `localSymbol` |
| local duality and Euler characteristic | `tateDualityPairing_perfect_mixed`, `finite_H`, `eulerCharacteristic_finrank_fp` |
| local conductors | `conductorExponent`, `conductorIdeal`, `characterConductorExp` |
| global norm and Hilbert reciprocity | `cyclicHasseNorm`, `hilbertProductFormula` |
| class fields | `hilbertClassField`, `ringClassField`, `gal_ringClassField_equiv_pic`, `rayClassArtinMap`, `kroneckerWeber` |

`cyclicHasseNorm` and `hilbertProductFormula` are frozen public names. Their statements use the
global and local carriers above; neither may be replaced with a proposition-valued interface
whose hypotheses simply assume the conclusion. `normResidue` is a compatibility form of
`localArtinEquiv`; it must not become a second independently constructed equivalence.

---

## 4. Build plan

### Layer 0: audit and complete the cohomology suppliers

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

**Exit criterion.** `Suggested.lean` states `tateIso`, `nakayamaNegTwo`, and
`artinEquiv` using imported Tate groups and imported cup products, with no locally defined
cohomology object.

### Layer 1: formations and finite normal layers

Define the topological form of `Formation` and `NormalLayer`.

Required API:

- `Formation.level U = A^U`, the invariants of the restricted representation;
- the finite quotient `NormalLayer.Gal = U / V`, with the finiteness instance obtained from
  openness of `V` in the compact group `U`;
- the induced representation of `U / V` on `A^V` (`NormalLayer.rep`);
- the equality `(A^V)^(U/V) = A^U`;
- for every subgroup `H ≤ U/V`, the corresponding intermediate open subgroup
  (`subgroupLayer`) and the identification of the restricted representation with the
  coefficient module of that intermediate layer;
- the layers `V ◁ ⊤` of open normal subgroups (`NormalLayer.ofOpenNormal`), which are the
  finite Galois extensions of the ground field of the formation;
- the norm `A^V → A^U`, the norm subgroup and the norm quotient;
- restriction (`LayerRestriction`), refinement (`LayerRefinement`), and conjugation adapters
  between layer representations, on ordinary and Tate cohomology, together with the ground-level
  inclusion and norm, the transfer, inclusion, quotient and conjugation maps on abelianized Galois
  groups; tower objects remember the actual inclusions, not only equal cardinalities.

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

are all represented by named types and canonical maps.

### Layer 2: class formations and fundamental classes

Define `ClassFormation` with the axioms in §2.2. Prove:

- `H²(U/V,A^V)` is cyclic of order `[U:V]`;
- existence and uniqueness of the class of invariant `1/[U:V]`;
- `fundamentalClass` generates `H²`;
- restriction of a fundamental class is the fundamental class of the restricted layer;
- the scaled inflation and the conjugation formulae.

The invariant is data. The fundamental class is derived. A structure with an unrelated chosen
class for every subgroup is not an acceptable substitute.

**Exit criterion.** The hypotheses of Tate's theorem are available for the
restriction of the fundamental class to every subgroup of `U/V`.

### Layer 3: Tate's theorem for a class formation

Apply the generic theorem with `M = ℤ` and use the tensor-unit equivalence to obtain

```text
tateIso (r : ℤ) :
  Ĥ^r(U/V,ℤ) ≃ Ĥ^{r+2}(U/V,A^V).
```

Prove that the forward homomorphism is exactly `cupFundamentalClass`. Establish compatibility
with:

- restriction to a subgroup (`tateIso_res`);
- corestriction/transfer;
- conjugation;
- the correct scaled inflation formula.

The scaled inflation formula matters: the fundamental class of a smaller layer inflates to a
degree multiple of the fundamental class of the larger layer. No roadmap statement should claim
unscaled commutativity in positive degrees.

**Exit criterion.** There is one named, cup-product-defined family of isomorphisms in all integer
degrees.

### Layer 4: the abstract Artin map

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
   (`eq_artinMap_of_character`).

The character formula is the second protection against accidentally using the inverse map or the
opposite fundamental class.

**Exit criterion.** Downstream files can refer to the Artin map without choosing an arbitrary
isomorphism or reopening a sign convention.

### Layer 5: the local class formation and finite local reciprocity

For a nonarchimedean local field `K`, construct the formation whose module is the multiplicative
group of a separable closure, written additively; its module is `unitsRep K` transported to the
separable-closure Galois group, so that the local Brauer group `Br K = H²(G_K, (Kˢ)ˣ)` of Layer 8
is the continuous `H²` of the same coefficients. Prove the class-formation axioms from:

- Hilbert 90;
- the local Brauer invariant, first on unramified layers and then on the full Brauer group;
- compatibility of restriction with multiplication by degree;
- the finite-layer description of the Brauer group;
- the cyclic Herbrand-quotient calculation needed to show that the degree-`n` layer contributes
  the subgroup of order `n`.

For local units, use a scaled normal-basis element to obtain an open stable lattice that is free
over the group ring, then pass through the finite quotient into the unit filtration; do not assume
that `𝒪_L` itself is free over `𝒪_K[Γ]`, which holds only in the tame case. The finite local
Galois group is first proved solvable from its ramification filtration, the cyclic `H²` bound is
then propagated by induction, and only afterwards are the invariant, fundamental classes, and
class formation constructed. The proof of `localClassFormation` must not use local reciprocity,
the norm-index theorem, local existence, or local duality: each is downstream of Tate's theorem.

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
`[L:K]` (`localArtinMap_eq_frobenius_pow_valuation`).

Passing to the inverse limit over finite abelian extensions gives the absolute
`artinMap : Kˣ → G_K^ab` into the topological abelianization, with dense image and kernel the
intersection of the norm groups; it is not surjective, so no finite-cardinality statement about
its target is valid. Its finite restrictions are the finite maps (`artinMap_restrict`), its
unramified coordinate is the normalized valuation (`unramifiedCoordinate_artinMap`), and its
cyclotomic normalization is `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`, with the field norm
(`cyclotomicCharacter_artinMap`, and its `ℚ_p` specialization). These equations are consumed by
`LocalGaloisGroups` to identify the abstract Demushkin orientation.

**Exit criterion.** The finite local map is visibly the abstract Artin map, a uniformizer maps to
arithmetic Frobenius, the kernel is the norm group, and the absolute map with its two
normalizations exists.

### Layer 6: the global idele-class formation and global reciprocity

Use the idele and idele-class carriers from `GlobalNumberFields`. For a fixed separable closure,
assemble the idele class groups of finite extensions into the formation module and prove the
class-formation axioms.

The hard arithmetic input is separated from the abstract formalism. The classical proof route is
to establish the first and second fundamental inequalities for cyclic layers, deduce the required
`H¹`-vanishing and the order of `H²`, and only then construct the global class formation. The
required inputs are:

- the Herbrand quotient of the relevant `S`-idele and `S`-unit modules;
- the first fundamental inequality;
- the second fundamental inequality, reduced to cyclic extensions of prime degree by the usual
  Sylow and tower arguments;
- `H¹`-vanishing for idele classes;
- the global invariant theorem;
- compatibility of the global fundamental class with the local fundamental classes;
- the sum of local invariants.

Global reciprocity, global existence, Chebotarev, and the classification of norm subgroups are
forbidden inputs to `globalClassFormation`: each is downstream of the abstract Artin map.

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
`algEquiv_commute_of_isAbelianGalois`. Build the archimedean package here: `Art_ℂ` is trivial;
`Art_ℝ` has kernel `ℝ_{>0} = N_{ℂ/ℝ}(ℂˣ)` and sends a negative element to conjugation; the complex
invariant is zero and the real nontrivial class has invariant `1/2`.

There is one ideal-theoretic Artin map in the portfolio. The class-field-theory map is compared to
it by a theorem, not duplicated.

**Exit criterion.** The global map is the transported abstract Artin map and its value on an
unramified prime is the existing Frobenius class.

### Layer 7: the existence theorems

After reciprocity is established, develop the topology of norm subgroups and prove:

- norm subgroups are open and of finite index;
- finite abelian extensions give distinct norm subgroups;
- the norm subgroup reverses inclusions and respects composita and intersections;
- every open finite-index subgroup of `Kˣ`, respectively of `C_K`, is the norm subgroup of a
  finite normal layer of the local, respectively global, formation (`localExistence`,
  `globalExistence`);
- the norm-index theorem `[C_K : N C_L] = [L:K]` for finite abelian `L/K`
  (`card_ideleClassNormQuotient`);
- the local and global class-field correspondences;
- ray-class factorization of the global Artin map using the imported ray-class groups
  (`rayClassArtinMap`), the ray class field and its splitting law.

Locally, the construction order is normative: norm subgroups first define the normic topology and
its completion; norm limitation precedes the prime-to-residue existence theorem; Kummer theory
then gives full existence for finite extensions of `ℚ_p`, after which injectivity and the
comparison with the profinite completion follow. Equal-characteristic `p`-primary existence is
not obtained by this route: it requires the excluded Artin–Schreier–Witt theory.

The existence theorem must not appear as a hypothesis in a structure used to prove reciprocity.
The two directions of class field theory are proved in the correct order.

### Layer 8: local invariants, Hilbert symbols, duality, conductors, and the Weil group

Keep all continuous cohomology on the imported Mathlib carrier:

```text
GalRep n F = ProfiniteCohomology.TopRep (ZMod n) G_F,
H n F i A  = continuousCohomology i A.
```

Build `muNRep n F`, the separable-closure roots of unity as a coefficient object, and transport
the imported Kummer map to `kummerClass`. For `F/ℚ_p` finite, `kummerEquiv_mixed` is valid for
every `n ≠ 0`, including `n = p`; this is not a consequence of the prime-to-`p` unit case. The
transport is explicit: `absoluteGaloisGroupComparison` relates the algebraic-closure and
separable-closure Galois groups, while `muNRepCoeffDictionary` is separately proved continuous
and equivariant.

The Brauer carrier is `Br F = H²(G_F,(Fˢ)ˣ)` on the same continuous theory, with invariant
`invMap` normalized by arithmetic Frobenius; `brRes` and `brCor` satisfy the degree-multiplying
restriction and degree-free corestriction squares. Prove that the abstract invariant of a finite
layer of the local formation is `invMap` after inflation (`localClassFormation_inv`), so that
Layers 5 and 8 carry one normalization.

For every `n ≠ 0` in mixed characteristic, prove `h2MuEquivZMod_mixed : H²(F,μ_n) ≃ ZMod n`. A
chosen primitive `p`-th root identifies the trivial `𝔽_p` module with `μ_p`, giving
`h2FpEquivZMod_of_mu`; without that coefficient identification the zero module is a
counterexample.

Define `kummerCupPairing ζ` from a chosen primitive root, then define `localSymbol` as Kummer cup
followed by the invariant. Prove bilinearity and the Steinberg relation. This is the canonical
owner of the cohomological local Hilbert pairing; no quadratic-form or quaternion symbol is
imported. Two Kummer classes naturally cup into `μ_n ⊗ μ_n`, not `μ_n`: multiplication of roots
of unity is not biadditive. A primitive root supplies the additional pairing, and the Steinberg
law is stated only for that named pairing. At exponent two the identification is canonical, and
the quadratic Artin symbol is read off from `localSymbol`
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

The conductor targets are the attained minima `conductorExponent`, `conductorIdeal`, and
`characterConductorExp`, with minimality and the unramified criterion named. Character-conductor
attainment uses that `ℂˣ` has no small subgroups; continuity plus a neighbourhood basis alone is
insufficient, as the identity `Kˣ → Kˣ` is trivial on no unit-filtration subgroup. Prove the
conductor/existence compatibility.

Define the local Weil group `W_K ⊆ G_K` as the preimage of the powers of arithmetic Frobenius,
and prove that reciprocity becomes an isomorphism `Kˣ ≃ W_K^ab` (`localWeilArtinEquiv`), whose
image in `G_K^ab` is the range of `artinMap` (`localWeilArtinEquiv_compat`,
`mem_range_artinMap_iff`). Global Weil groups are outside this roadmap.

**Exit criterion.** `LocalGaloisGroups` can consume the local-cohomological row of §3 by name.

### Layer 9: norm theorems and class fields

Develop the `S`-idele and unit-lattice Herbrand calculations on the imported idele carriers, as
already required for Layer 6, and prove the cyclic Hasse norm theorem
`cyclicHasseNorm`: for cyclic `L/K`, `x : Kˣ` is a global norm exactly when its principal idele is
an idele norm, equivalently when `x` is a norm at every place. Export that second formulation as
`isGlobalNorm_iff_isLocalNormEverywhere`, with `IsLocalNormEverywhere` identified by the local
coordinates of `ideleNormMap`, so consumers need not unpack an idele-range predicate. Its proof is the vanishing of
`Ĥ^{-1}(Γ, C_L)`, itself a consequence of the Layer 6 computation of the Herbrand quotient of the
idele classes; the cyclic hypothesis is essential. Record the biquadratic counterexample: for
`ℚ(√13,√17)/ℚ`, `25` is a local norm everywhere but not a global norm.

Construct the Hilbert class field as the class field of the trivial modulus and the narrow
Hilbert class field using `GlobalNumberFields.narrowModulus`. Prove the Galois/class-group
isomorphisms (`gal_hilbertClassField_equiv_classGroup`), maximal unramified properties,
splitting criteria, and the principal ideal theorem.

Derive Kronecker–Weber from global existence (`kroneckerWeber`) and prove that the least
cyclotomic level equals the abelian conductor, including the `n ≢ 2 mod 4` normalization. Prove
the abelian conductor–discriminant formula from the local formula and the character dictionary,
and the compatibility of conductors with ramification.

For a `GlobalNumberFields.NumberFieldOrder O`, construct its ring class field from the imported
conductor, proper ideal group and `Pic O`. Freeze the isomorphism `Gal(H_O/K) ≃ Pic O`
(`gal_ringClassField_equiv_pic`), its ramification bound, the maximal-order comparison, and the
splitting criterion. Orders and Picard groups remain owned by `GlobalNumberFields`.

### Layer 10: the global class formation, local invariants, and Hilbert reciprocity

Package the global idele-class formation with its fundamental classes. Prove that continuous
cohomology of the absolute Galois group is the imported finite-quotient colimit from
`ProfiniteCohomology`; do not build a second continuous carrier here.

Prove the exact sequence

```text
0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0
```

in invariant coordinates and the sum-of-local-invariants theorem. Define each finite local
Hilbert invariant by applying `localSymbol` at the completion (`finiteHilbertInvariantAt`) and
each real invariant by the archimedean package of Layer 6 (`infiniteHilbertInvariantAt`). Prove
finite support, then freeze

```text
ClassFieldTheory.hilbertProductFormula
```

in additive cohomological form: the sum of the local `ZMod 2` invariants is zero. The equivalent
multiplicative statement is `∏_v (a,b)_v = 1`. `QuadraticFormInvariants` later proves its
norm-equation/quaternion symbol agrees with this one and inherits the product formula.

Derive quadratic reciprocity for `ℚ`, including the real and dyadic factors, from
`hilbertProductFormula`. This is the explicit reciprocity law owned here; higher power
reciprocity laws (Artin–Tate XII) are follow-on work using the same symbols.

---

## 5. Required regression tests and worked examples

These are acceptance tests, not optional exposition. They pin the direction and normalization of
the Artin map in cases where the answer is elementary, and they are stated in `Suggested.lean`
under the names given below. They are intended to catch three errors which are easy to hide in
an abstract development:

1. using an arbitrary equivalence instead of cup product with the fundamental class;
2. using the cup-product direction `Γ^ab → A^U/N(A^V)` as the Artin map instead of its inverse;
3. normalizing the Artin map by geometric rather than arithmetic Frobenius.

The first versions may be proved for finite-level maps. They should not wait for the
inverse-limit absolute Artin map.

### 5.1 Trivial layer

For the layer `U/U`, the norm quotient, `(U/U)^ab`, and the Artin map are all trivial
(`ClassFormation.artinMap_trivialLayer`). This should reduce to the unique map between trivial
groups, not to a cardinality argument.

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
norm-kernel theorem, and, once the local Hilbert symbol is available, for `L = K(√d)`,
`localArtinMap(a)|_L = τ iff (a,d)_K = -1` (`localArtinMap_quadratic_eq_hilbertSymbol`).

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
  `GlobalNumberFields.Pic O`; do not reconstruct the order or its ideals locally.

### 5.8 Minimal mandatory suite

The following are mandatory before the roadmap is complete: `artinMap_trivialLayer`;
`localArtinMap_uniformizer` for an arbitrary finite unramified extension;
`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`; `globalArtinMap_Qi_prime`;
`globalArtinMap_cyclotomic_prime` with the explicit `ℚ(ζ₅)` value at `2`. Together they test
triviality, the norm kernel, a nontrivial group of order two, arithmetic Frobenius, and a
non-involutive Artin symbol.

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
- the finite-layer norm quotient and the layers of open normal subgroups;
- `fundamentalClass` and its defining invariant;
- the cup-product map and `tateIso`;
- the transparent definitions of `nakayamaNegTwo`, `artinEquiv`, and `artinMap`, with
  `artinMap_apply` and `artinEquiv_eq_tateIso` proved by `rfl`;
- the character formula, the norm-kernel theorem, and the four functoriality diagrams;
- transparent adapters showing that the local and global Artin maps are transports of the
  abstract map, `normResidue` as the multiplicative form of `localArtinEquiv`, and the absolute
  local `artinMap` with its normalizations;
- the restored local-invariant, duality, Euler-characteristic, conductor, Weil-group, Hasse-norm,
  class-field and Hilbert-reciprocity contracts of Layers 8–10;
- the acceptance tests of §5 as named theorem statements.

It does not contain:

- a new definition of Tate cohomology;
- a new continuous-cohomology complex;
- an arbitrary `Nonempty (X ≃ Y)` where a canonical map is required;
- a reciprocity map whose relationship with cup product is only stated in prose;
- a `sorry` inside a statement: every missing map used in a statement is a named `sorry`
  definition with its own docstring.

The derived Artin definitions are ordinary definitions with bodies rather than opaque `sorry`
declarations. This makes the eventual target definitionally equal to the inverse of the
Tate isomorphism while the leaf constructions remain the recorded `sorry` targets. The file
imports the four supplier roadmaps; it type-checks against their `Suggested.lean` files at the
heads recorded in the pull request, and it will build in CI once those roadmaps merge.

---

## 7. Dependency order

```text
Mathlib finite-group cohomology and Tate cohomology
                      |
Richard Hill finite-Tate additions and change-of-groups maps
                      |
ProfiniteCohomology --+-- LocalFieldsRamification
                      |              |
                      v              v
             abstract class formations
                      |
               Tate's theorem
                      |
             abstract finite Artin map
                      |
          +-----------+-----------+
          |                       |
 local class formation      global idele-class formation
          |                       |
 local reciprocity          global reciprocity
          |                       |
 local existence            global existence
          |                       |
 local invariants,          Hasse norm, class fields,
 duality, conductors,       Kronecker–Weber
 Weil group                       |
          +-----------+-----------+
                      |
      global class formation, sum of local invariants,
              Hilbert reciprocity
```

The abstract layers can be implemented and reviewed before the arithmetic instances. Local and
global work can then proceed in parallel, sharing the same exported Artin map; the local
coefficient dictionaries and Kummer transports of Layer 8 can begin alongside Layer 5, and the
archimedean package alongside the nonarchimedean local theory. Ring class fields wait for both
global existence and the `GlobalNumberFields` order/`Pic` API.

---

## 8. References and implementation sources

- E. Artin and J. Tate, *Class Field Theory*, AMS Chelsea, 2009: Chapter XIV
  (Sections 1–5: formations, field formations and Brauer groups, class formations, the Main
  Theorem, the reciprocity-law isomorphism, and the abstract existence theorem); Chapters V–VIII
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
