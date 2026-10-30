# Roadmap: number fields of bounded discriminant — Hunter's theorem and complete tables

A number field of degree `n` and discriminant at most `D` in absolute value is one of finitely
many: Mathlib proves this (`NumberField.finite_of_discr_bdd`, Hermite's theorem), and Tau Ceti
bounds how many (`NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`, the effective
Hermite–Minkowski count of the completed
[Effective Bounds roadmap](../../Completed/EffectiveBounds/README.md)). Neither says *which* fields
they are. Tables of number fields, the LMFDB's among them, rest on two further theorems that make
a finite list of polynomials provably complete:

- **a canonical defining polynomial** for each field, so that a list of polynomials is a list of
  fields without repetition: the polredabs polynomial, minimal for the `T₂` norm of its roots and
  then for two tie-breaks;
- **Hunter's theorem**, which bounds the `T₂` norm of some non-rational algebraic integer of every
  field of degree `n` and discriminant `≤ D`, and so confines a defining polynomial of every such
  field of prime degree to an explicit finite set; together with its **relative form** and the
  **subfield reduction**, which do the same in composite degree.

This roadmap builds both, in two layers.

| Layer | Title | What it builds |
|---|---|---|
| 1 | `T₂`, the canonical polynomial and Hunter's theorem | the `T₂` norm and Maclaurin's coefficient bounds; the polredabs key and the canonical polynomial, an isomorphism invariant; Hunter's theorem |
| 2 | Complete lists of number fields | completeness in prime degree; the subfield reduction and the relative Hunter theorem in composite degree; the complete list of canonical polynomials of fields of degree `n` and `|discr| ≤ D` |

The carrier is a number field `K` (`[Field K] [NumberField K]`) and the monic integer polynomials
`P : ℤ[X]` that define it. Every statement about a polynomial is intrinsic to the polynomial;
every statement about a field is invariant under `ℚ`-algebra isomorphism. What is proved is that
a stated finite set of polynomials is exactly the set of canonical polynomials of the fields in
question; producing that set is a computation, not a target.

Suggested home: `TauCeti/NumberTheory/NumberField/Enumeration/`, with files `T2.lean`,
`Polredabs.lean`, `Hunter.lean`, `RelativeHunter.lean` and `Complete.lean`.

## Prerequisites

Every milestone names its direct prerequisites, each of one of four kinds: a Mathlib declaration
at the pin, a Tau Ceti declaration at the pin, an earlier milestone of this roadmap, or a named
milestone of another roadmap in this repository, cited by its own numbering.

- [Number Field Arithmetic](../../Completed/NumberFieldArithmetic/README.md) (completed): 3.1, the
  integral primitive elements, landed as `TauCeti.NumberField.IntegralPrimitiveElement` with
  `IntegralPrimitiveElement.index`; 3.3, the index formula, landed as
  `TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr`; 4.1–4.2,
  the relative discriminant and its tower formula, landed as `TauCeti.relDiscr`,
  `TauCeti.NumberField.relDiscr_tower` and `TauCeti.NumberField.relDiscr_int_ringOfIntegers`;
  8.1, the intrinsic prefix `d.r.D`, landed as `TauCeti.NumberField.HasLMFDBIntrinsicLabel`.
- [Effective Bounds](../../Completed/EffectiveBounds/README.md) (completed): Layer 2, the
  effective Hermite–Minkowski count, landed as
  `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` with `NumberField.coeffBoundOfDiscrBdd`.
- Mathlib at the pin, as listed under *What Mathlib supplies*.

## Scope and ownership

### Owned here

- The `T₂` norm of an integer polynomial, Maclaurin's coefficient bounds, and the finite sets of
  monic polynomials of bounded degree and `T₂` (1.1).
- The defining polynomials of a number field, the polredabs key, and the canonical polynomial
  `polredabs K` with its existence, uniqueness and isomorphism invariance (1.2).
- Hunter's theorem (1.3) and Martinet's relative form (2.2), each stated for any constant `Γ`
  satisfying the Hermite hypothesis of *Pinned conventions*.
- The Hunter candidate sets and completeness in prime degree and for primitive fields (2.1); the
  subfield reduction, the relative candidate sets and completeness in composite degree (2.2).
- The complete list: the theorem that a stated finite set of canonical polynomials, built from the
  Hunter candidates, is exactly the set of canonical polynomials of the fields of degree `n` and
  `|discr| ≤ D`, and its specialization to an LMFDB prefix `d.r.D` (2.3).

### Consumed, not redefined

- `TauCeti.NumberField.IntegralPrimitiveElement K` (the subtype of `θ : 𝓞 K` with
  `Algebra.adjoin ℚ {(θ : K)} = ⊤`) and its `index`; the index formula
  `discr_minpoly_eq_index_sq_mul_discr`: `(minpoly ℤ θ).discr = index θ ^ 2 * discr K`.
- `TauCeti.relDiscr`, `TauCeti.NumberField.relDiscr_tower`,
  `TauCeti.NumberField.relDiscr_int_ringOfIntegers`.
- `TauCeti.NumberField.HasLMFDBIntrinsicLabel K d r D`, which says `finrank ℚ K = d`,
  `nrRealPlaces K = r` and `(discr K).natAbs = D`.
- `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`, `NumberField.coeffBoundOfDiscrBdd`.
- From Mathlib: everything under *What Mathlib supplies*.

### Not owned here

- **The qualitative and effective finiteness theorems.** Hermite's theorem is Mathlib's; the
  explicit count of fields of bounded discriminant is Effective Bounds Layer 2. That roadmap's
  effective Hermite–Minkowski theorem is the nearest neighbour of this one: it bounds the number of
  fields, and this roadmap identifies them. 2.3 compares the two and reproves neither.
- **Hermite's constant.** `γ_m`, its values and the bounds on it (Hermite's inequality
  `γ_m ≤ (4/3)^((m−1)/2)`, Minkowski's bound) belong to the lattice roadmaps, such as
  LatticePackingsAndPerfectForms. Hunter's theorem here takes an admissible constant `Γ` as a
  hypothesis and is a theorem for every such `Γ`.
- **Searching for fields and storing tables.** A procedure that finds all fields of a given degree
  and discriminant bound, a claim that it terminates or how fast, and a stored table of fields are
  not targets. A completeness theorem here says that a stated finite set is exactly the set of
  canonical polynomials of the fields in question; it does not produce the set.
- **Label components beyond the intrinsic prefix.** The prefix `d.r.D` is Number Field Arithmetic
  8.1. The index `i` of a label `d.r.D.i`, the order of the fields sharing a prefix, ideal labels,
  and the choice of one field among several (a stem field, a displayed field) are database
  conventions, not targets.
- **Isomorphism invariants of the fields.** Galois groups, class groups, units, ramification and
  subfield lattices belong to the roadmaps that define them; this roadmap uses only `finrank`,
  `discr`, `Algebra.trace`, the complex embeddings and Mathlib's `IntermediateField`.

## Pinned conventions

| Object | Convention |
|---|---|
| `T₂` of a polynomial | `t2 P := ∑ ‖α‖ ^ 2` over the roots `α` of `P.map (Int.castRingHom ℂ)` in `ℂ`, with multiplicity (`Polynomial.roots`). It is the sum of squared **absolute values**, not the power sum `∑ α ^ 2 = a₁² − 2a₂`; the two agree exactly when every root is real. `t2` belongs to the polynomial: two polynomials defining one field have different `t2` in general. |
| `T₂` of an element | For `θ ∈ 𝓞 K`, `T₂(θ) := ∑_{σ : K →+* ℂ} ‖σ θ‖ ^ 2`, over all `n = [K : ℚ]` complex embeddings. `T₂(θ) = [K : ℚ(θ)] · t2 (minpoly ℤ θ)` (1.1). |
| Coefficients | `P = Xⁿ + a₁ Xⁿ⁻¹ + ⋯ + aₙ`, so `a_k = P.coeff (n − k)`. |
| Defining polynomials | `definingPolys K` is the set of `minpoly ℤ θ` for `θ : TauCeti.NumberField.IntegralPrimitiveElement K`: the monic irreducible integer polynomials of degree `[K : ℚ]` with a root generating `K`. |
| The polredabs key | `polredabsKey P := toLex (t2 P, toLex ((P.discr).natAbs, S P))` in `Lex (ℝ × Lex (ℕ × List ℤ))`, with `S P := [|a₁|, a₁, |a₂|, a₂, …, |aₙ|, aₙ]` under Mathlib's lexicographic order on `List ℤ`. Smaller is better: minimal `T₂`, then minimal `|disc P|`, then lexicographically least `S(P)`. This is the LMFDB knowl `nf.polredabs` and the specification PARI's `polredabs` meets. |
| The canonical polynomial | `polredabs K` is the `polredabsKey`-minimum of `definingPolys K` (1.2). |
| Discriminant bounds | `|discr K| ≤ D` in `ℤ`, with `D : ℕ`; the prefix uses `(discr K).natAbs = D`. |
| Hermite hypothesis | A real `Γ` is **admissible in rank `m`** when every positive definite real symmetric `m × m` matrix `A` (Mathlib's `Matrix.PosDef`) has a nonzero `x : Fin m → ℤ` with `x ⬝ᵥ A *ᵥ x ≤ Γ · (det A) ^ (1/m)`. This says `γ_m ≤ Γ`, without naming `γ_m`. It is written out in each theorem that needs it and never wrapped in a predicate. `Γ = 1` is admissible in rank `1` (1.3); Hermite's inequality makes `Γ = (4/3)^((m−1)/2)` admissible in every rank `m ≥ 1`, and the worked examples use that value. |
| Trace normalization | Hunter's element satisfies `0 ≤ Tr θ ≤ n/2`; since `Tr θ ∈ ℤ`, `Tr θ ≤ ⌊n/2⌋`, and `hunterBound` uses `⌊n/2⌋² / n`. |
| Relative norm of the discriminant | For `K ⊃ F` with `m = [F : ℚ]` and `m' = [K : F]`, `|discr K| = |discr F| ^ m' · N(𝔡_{K/F})` (Number Field Arithmetic 4.2). The relative Hunter bound uses `|discr K| / (m' ^ m · |discr F|)`, the determinant of the lattice `𝓞 K / 𝓞 F` in the `T₂` form (2.2). |
| Universe | `canonicalPolys n D` quantifies over fields `K : Type`; every number field is isomorphic to one in `Type` (e.g. `AdjoinRoot` of a defining polynomial), so nothing is lost. |
| Targets | Each milestone below is a definition, construction, theorem or comparison, with its hypotheses in the sentence, its source in parentheses, and its **Checks**: acceptance values taken from *Worked examples*. Backticked names are the names the declarations take when formalised. `Suggested.lean` states the declarations of 1.1–1.3 and 2.1–2.3 that can be stated over Mathlib and the pinned Tau Ceti; the relative candidate sets of 2.2 and the composite-degree list of 2.3 are specified in this README only. |

## What Mathlib supplies

- Polynomials: `Polynomial.roots`, `Polynomial.map`, `Polynomial.Monic`, `Polynomial.natDegree`,
  `Polynomial.discr` (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`),
  `Polynomial.coeff_eq_esymm_roots_of_card` (Vieta, `Mathlib/RingTheory/Polynomial/Vieta.lean`),
  `Multiset.esymm`, `minpoly`, `minpoly.isIntegrallyClosed_eq_field_fractions'`, `AdjoinRoot` with
  its `NumberField (AdjoinRoot f)` instance for `[Fact (Irreducible f)]`, `f : ℚ[X]`.
- Number fields: `NumberField`, `NumberField.RingOfIntegers` (`𝓞 K`), `NumberField.discr`,
  `Algebra.trace`, `Algebra.adjoin`, `IntermediateField`, `IntermediateField.adjoin.finrank`,
  `NumberField.Embeddings.coeff_bdd_of_norm_le` (coefficient bounds from bounds on the
  conjugates), `NumberField.Embeddings.finite_of_norm_le` (finitely many algebraic integers of
  bounded degree with bounded conjugates), `NumberField.finite_of_discr_bdd` (Hermite),
  `NumberField.abs_discr_ge` (Minkowski), `NumberField.hermiteTheorem.rankOfDiscrBdd`,
  `NumberField.mixedEmbedding`.
- Geometry of numbers: `ZLattice`, `ZLattice.covolume`,
  `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` (Minkowski's
  convex-body theorem).
- Linear algebra and orders: `Matrix.PosDef`, `Matrix.det`, `dotProduct`, `Matrix.mulVec`,
  `Prod.Lex`, the lexicographic `LinearOrder` on `List ℤ`, `Ideal.span`,
  `Ideal.span_singleton_dvd_span_singleton_iff_dvd`.

Mathlib has no Maclaurin inequality for elementary symmetric functions, no `T₂` of a polynomial,
no canonical defining polynomial and no Hunter theorem.

## What Tau Ceti supplies

At the pin, all imported by `Suggested.lean`:

- `TauCeti.NumberField.IntegralPrimitiveElement`, `IntegralPrimitiveElement.index`
  (`TauCeti.NumberTheory.NumberField.Index.Basic`) and
  `IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr`
  (`TauCeti.NumberTheory.NumberField.Index.Discriminant`).
- `TauCeti.NumberField.HasLMFDBIntrinsicLabel` with `hasLMFDBIntrinsicLabel_iff`,
  `HasLMFDBIntrinsicLabel.unique`, `HasLMFDBIntrinsicLabel.discr_eq`
  (`TauCeti.NumberTheory.NumberField.IntrinsicLabel`).
- `TauCeti.relDiscr` (`TauCeti.RingTheory.DedekindDomain.Discriminant.Basic`),
  `TauCeti.relDiscr_tower`, `TauCeti.NumberField.relDiscr_tower`,
  `TauCeti.NumberField.relDiscr_int_ringOfIntegers`
  (`TauCeti.NumberTheory.NumberField.Discriminant.Relative`).
- `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`, `NumberField.coeffBoundOfDiscrBdd`,
  `NumberField.hermiteCountBound` (`TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic`).
- The worked number fields `3.1.23.1`, `3.1.503.1` and `4.0.125.1` with their prefixes
  (`TauCeti.NumberTheory.NumberField.WorkedExamples.{Cubic23,DedekindCubic,FifthCyclotomic}.Invariants`),
  which the Checks below can use as concrete fields.

## What is missing

Nothing in Mathlib or Tau Ceti states the `T₂` norm of a polynomial, Maclaurin's inequality, a
canonical defining polynomial, Hunter's theorem or its relative form, a finite candidate set for
fields of bounded discriminant, or a theorem that a finite list of polynomials is the complete
list of fields of given degree and discriminant bound. Every one is a milestone below.

## Layer 1: T₂, the canonical polynomial and Hunter's theorem

### 1.1 The T₂ norm and coefficient bounds

**Definition.** For `P : ℤ[X]`, `t2 P := ∑ ‖α‖ ^ 2`, the sum over the roots of
`P.map (Int.castRingHom ℂ)` with multiplicity. For `n : ℕ` and `B : ℝ`,
`candidates n B := {P : ℤ[X] | P.Monic ∧ P.natDegree = n ∧ t2 P ≤ B}`.

**Theorems.**

- `t2_nonneg`: `0 ≤ t2 P`.
- `abs_coeff_le_of_t2` (Maclaurin's bound): for `P` monic of degree `n ≥ 1` and `0 ≤ k ≤ n`,
  `|a_k| ≤ C(n, k) · (t2 P / n) ^ (k/2)`. Proof: by Vieta, `|a_k| = |e_k(α)| ≤ e_k(|α₁|, …, |αₙ|)`;
  Maclaurin's inequality `e_k(x) / C(n, k) ≤ (e_1(x) / n) ^ k` for nonnegative reals `x` (proved
  here, from Newton's inequalities); and `e_1(|α|) / n ≤ (t2 P / n) ^ (1/2)` by Cauchy–Schwarz.
  Maclaurin's inequality is a lemma of this milestone, stated for a `Multiset ℝ≥0` with
  `Multiset.esymm`.
- `candidates_finite`: `candidates n B` is finite. Each coefficient lies in an explicit integer
  interval, so the set is contained in a finite product of intervals; the milestone also gives the
  explicit bound on `card` that the product yields.
- `sum_norm_sq_eq_t2_minpoly`: for `θ : 𝓞 K`,
  `∑_{σ : K →+* ℂ} ‖σ θ‖ ^ 2 = ([K : ℚ] / deg(minpoly ℤ θ)) · t2 (minpoly ℤ θ)`; each complex root
  of the minimal polynomial is `σ θ` for exactly `[K : ℚ(θ)]` embeddings `σ`.
- For `P` all of whose complex roots are real, `t2 P = a₁² − 2a₂`.

⚠ `t2` is not the power sum `∑ αᵢ² = a₁² − 2a₂` (the roots are complex and `|α|² ≠ α²`); the two
agree only when every root is real.

*Prerequisites:* Mathlib `Polynomial.roots`, `Polynomial.coeff_eq_esymm_roots_of_card`,
`Multiset.esymm`, `NumberField.Embeddings.coeff_bdd_of_norm_le` for the shape of the coefficient
bound, `minpoly`.

**Checks.**

- (values) `t2 (X² − X − 1) = 3`, `t2 (X² − 5) = 10`, `t2 (X² + 1) = 2`, `t2 (X² + 4) = 8`.
- (rejection) For `X² + 1` the power sum `a₁² − 2a₂` is `−2`; a definition of `T₂` as `∑ α²`
  gives `−2` and must be rejected.
- (sharpness) `P = X² + 2` has `t2 P = 4` and `|a₂| = 2 = C(2, 2) · (4/2) ^ 1`: Maclaurin's bound
  is an equality when all roots have the same absolute value.
- (count) `candidates 2 2` has exactly nine elements: `X²`, `X² ± X`, `X² ± 1`, `X² ± X + 1`,
  `X² ± 2X + 1`.
- (elements) for `θ = (1 + √5)/2` in `ℚ(√5)`, `∑_σ ‖σ θ‖² = 3 = t2 (X² − X − 1)`.

### 1.2 The canonical defining polynomial

**Definitions.** For a number field `K` of degree `n`,
`definingPolys K := {minpoly ℤ θ | θ : TauCeti.NumberField.IntegralPrimitiveElement K}`, and

```text
signVector P := [|a₁|, a₁, |a₂|, a₂, …, |aₙ|, aₙ]          for P = Xⁿ + a₁Xⁿ⁻¹ + … + aₙ
polredabsKey P := toLex (t2 P, toLex (|disc P|, signVector P))
                 : Lex (ℝ × Lex (ℕ × List ℤ))
polredabs K := the polredabsKey-minimum of definingPolys K
```

**Theorems.**

- `monic_irreducible_natDegree_of_mem_definingPolys` and `mem_definingPolys_iff`: `P` is a
  defining polynomial if and only if it is monic of degree `[K : ℚ]` with a root `θ ∈ K` such that
  `Algebra.adjoin ℚ {θ} = ⊤`; it is then irreducible over `ℤ` and over `ℚ`.
- `nonempty_algEquiv_adjoinRoot`: for `P ∈ definingPolys K`, `ℚ[X]/(P) ≃ₐ[ℚ] K`
  (`AdjoinRoot (P.map (Int.castRingHom ℚ))`).
- `polredabsKey_injective_of_natDegree_eq`: the key is injective on monic polynomials of a fixed
  degree, since `signVector P` determines `a₁, …, aₙ`.
- **Existence**, `polredabs_mem` and `polredabsKey_polredabs_le`: the minimum exists and lies in
  `definingPolys K`. `definingPolys K` is nonempty (a primitive element, scaled into `𝓞 K`), and
  for each `B` its elements with `t2 ≤ B` lie in `candidates n B`, finite by 1.1; so the least
  `T₂` is attained on a finite set, within which the other two components are discrete.
- **Uniqueness**: by injectivity of the key, `polredabs K` is the unique key-minimal element.
- **Isomorphism invariance**: `polredabs_eq_of_algEquiv` (`K ≃ₐ[ℚ] K'` gives
  `polredabs K = polredabs K'`, since an isomorphism carries `definingPolys K` onto
  `definingPolys K'`) and the converse `nonempty_algEquiv_of_polredabs_eq`.
- `polredabs K` is monic and irreducible of degree `[K : ℚ]`, by `polredabs_mem`.

The rule is the LMFDB knowl `nf.polredabs` verbatim: minimal `T₂`, then minimal `|disc|`, then
lexicographically least `S(P)`. ⚠ `T₂` ties are real: `x⁴ − 5x² + 7` and `x⁴ + 5x² + 7` have
equal `t2` and define different fields (*Worked examples*), and within one field a `T₂`-minimal
polynomial is in general not unique (`X² − X − 1` and `X² + X − 1`), so the discriminant and
`S(P)` tie-breaks are part of the definition, not decoration.

*Prerequisites:* 1.1; Number Field Arithmetic 3.1 (`TauCeti.NumberField.IntegralPrimitiveElement`);
Mathlib `minpoly`, `Polynomial.discr`, `AdjoinRoot`, `Prod.Lex`.

**Checks.**

- (`2.2.5.1`) `polredabs ℚ(√5) = X² − X − 1`, with `t2 = 3` and `disc = 5`. `X² − 5` (`t2 = 10`)
  defines the same field and is not canonical; `X² + X − 1` ties on `t2` and `|disc|` and loses on
  `S`: `(1, −1, 1, −1) < (1, 1, 1, −1)`.
- (`4.0.125.1`) `polredabs ℚ(ζ₅) = X⁴ − X³ + X² − X + 1`; the cyclotomic polynomial
  `X⁴ + X³ + X² + X + 1` has the same `t2 = 4` and the same `|disc| = 125`, and loses on `S`:
  `(1, −1, …) < (1, 1, …)`.
- (`3.1.23.1`) `polredabs = X³ − X² + 1` with `t2 = 3.2192…`; `X³ − X − 1` defines the same field
  with `t2 = 3.2646…` and is not canonical.
- (`3.1.503.1`) `polredabs = X³ − X² + 2X + 8`, `t2 = 13.158…`; Dedekind's `X³ − X² − 2X − 8`
  defines the same field, has index `2` (Tau Ceti's Dedekind cubic) and `t2 = 13.439…`.
- (invariance) the two quartics `X⁴ ∓ 5X² + 7` have equal `t2 = 4√7 = 10.583…`, define
  non-isomorphic fields, and are each the canonical polynomial of their field: equal `T₂` does not
  identify fields.

### 1.3 Hunter's theorem

**Theorem** (`hunter`). Let `K` be a number field of degree `n ≥ 2` and let `Γ` be admissible in
rank `n − 1` (*Pinned conventions*). There exists `θ ∈ 𝓞 K` with `θ ∉ ℚ`, `0 ≤ Tr θ ≤ n/2` and

```text
∑_σ ‖σ θ‖²  ≤  Tr(θ)² / n  +  Γ · (|discr K| / n) ^ (1/(n−1)).
```

**Proof.** The lattice `L := 𝓞 K / ℤ` has rank `n − 1`. On `K ⊗ ℝ` the `T₂` form
`⟨x, y⟩ = ∑_σ σ x · conj(σ y)` is real and positive definite, with `⟨x, 1⟩ = Tr x` and
`T₂(1) = n`, so `Q(x) := T₂(x) − Tr(x)² / n` is `T₂` of the orthogonal projection of `x` away
from `1`. `Q` is a positive definite form on `L`, and its Gram determinant in a `ℤ`-basis is
`|discr K| / n`: the Gram determinant of `𝓞 K` in `T₂` is `|discr K|` (the complex embeddings
come in conjugate pairs, so the Hermitian Gram matrix is real), and `ℤ · 1` is a saturated
sublattice of `T₂`-norm `n`. The hypothesis on `Γ` gives `x ∈ L ∖ {0}` with
`Q(x) ≤ Γ · (|discr K| / n) ^ (1/(n−1))`. Lift `x` to `θ ∈ 𝓞 K ∖ ℤ`; replacing `θ` by `±θ + k`
with `k ∈ ℤ` replaces `Tr θ` by `±Tr θ + n k` and leaves `Q` unchanged, so we may take
`0 ≤ Tr θ ≤ n/2`. Then `T₂(θ) = Q(θ) + Tr(θ)² / n`. Finally `θ ∉ ℚ` because
`𝓞 K ∩ ℚ = ℤ`.

**Theorem** (`admissible_rank_one`). `Γ = 1` is admissible in rank `1`: a positive definite
`1 × 1` matrix `(a)` has `1 · a · 1 = a = det`. This is the hypothesis of `hunter` for quadratic
fields.

The theorem takes any admissible `Γ` and never names Hermite's constant: the admissible constants
themselves are lattice theory, not this roadmap's.

*Prerequisites:* 1.1; Mathlib `NumberField.mixedEmbedding`, `ZLattice`, `Algebra.trace`,
`Matrix.PosDef`, `NumberField.discr`. (Source: Hunter 1957; Cohen 1993, §6.4.1; Pohst 1982, §2.)

**Checks.**

- (`2.2.5.1`, equality) `n = 2`, `Γ = 1`, `|discr| = 5`: for `θ = (1 + √5)/2`, `Tr θ = 1` and
  `∑_σ ‖σ θ‖² = 3 = 1/2 + 1 · (5/2)`; the bound is attained.
- (`3.3.49.1`, equality) `n = 3`, `Γ = (4/3)^(1/2)`, `|discr| = 49`: the bound is
  `1/3 + (2/√3) · (49/3)^(1/2) = 5`, and a root `θ` of `X³ − X² − 2X + 1` has `Tr θ = 1` and
  `∑_σ ‖σ θ‖² = 5`. A version of the theorem with a strict inequality is false.
- (`3.1.23.1`) `n = 3`, `Γ = (4/3)^(1/2)`: the root of `X³ − X² + 1` has `Tr θ = 1` and
  `∑_σ ‖σ θ‖² = 3.2192… ≤ 1/3 + (2/√3) · (23/3)^(1/2) = 3.5305…`.
- (rejection) `Γ = 1` is **not** admissible in rank `2`: the matrix `A = [[2, 1], [1, 2]]` has
  `det A = 3` and minimum `2 > 1 · 3^(1/2)` over nonzero integer vectors.
- (non-generator) in `4.0.1008`, Hunter's element lies in the quadratic subfield: see 2.2.

## Layer 2: complete lists of number fields

### 2.1 Completeness in prime degree

**Definitions.** For `n, D : ℕ` and `Γ : ℝ`,

```text
hunterBound n D Γ := ⌊n/2⌋² / n + Γ · (D / n) ^ (1/(n−1))
hunterCandidates n D Γ := {P ∈ candidates n (hunterBound n D Γ) |
    Irreducible P ∧ ∃ f D' : ℕ, D' ≤ D ∧ |disc P| = f² · D'}
```

**Theorems.**

- `hunterCandidates_finite`: a subset of the finite set of 1.1.
- **Completeness** (`exists_mem_hunterCandidates_of_prime`): if `[K : ℚ] = n` is prime,
  `|discr K| ≤ D` and `Γ` is admissible in rank `n − 1`, then some `P ∈ hunterCandidates n D Γ`
  lies in `definingPolys K`. Proof: Hunter's `θ` is not rational, so for prime `n` it generates
  `K`; `P := minpoly ℤ θ` has `t2 P = ∑_σ ‖σ θ‖² ≤ hunterBound n D Γ` (1.1, 1.3, with
  `Tr θ ∈ ℤ`, and `Γ ≥ 1` because admissibility applied to the identity matrix forces it); and `disc P = (index θ)² · discr K` (Number Field Arithmetic 3.3),
  so `D' = |discr K|`.
- **Primitive fields** (`exists_mem_hunterCandidates_of_primitive`): the same conclusion for any
  `n ≥ 2` when `K` is primitive, that is, its only intermediate fields are `⊥` and `⊤`; the proof
  is the same, since `ℚ(θ) ≠ ⊥`.

*Prerequisites:* 1.1–1.3; Number Field Arithmetic 3.3
(`IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr`); Mathlib `IntermediateField`,
`IntermediateField.adjoin.finrank`.

**Checks.**

- (`n = 2`, `D = 8`, `Γ = 1`) `hunterBound = 9/2`; `hunterCandidates 2 8 1` has eleven elements,
  `X² ± X − 1`, `X² ± X + 1`, `X² ± X + 2`, `X² ± 2X + 2`, `X² + 1`, `X² − 2`, `X² + 2`, defining
  the six quadratic fields of discriminant `5`, `−3`, `−7`, `−4`, `8` and `−8`.
- (`n = 3`, `D = 23`, `Γ = (4/3)^(1/2)`) `hunterBound = 3.5305…`; the candidates are
  `X³ ± X² ∓ 1` and `X³ − X ± 1`, four polynomials, all defining `3.1.23.1`.
- (boundary) for `n = 3`, `D = 49`, `Γ = (4/3)^(1/2)`: `hunterBound = 5` and `X³ ∓ X² − 2X ± 1`
  (the field `3.3.49.1`) have `t2 = 5`; they are candidates only because the bound is `≤`.
- (rejection) for `n = 3`, `D = 23`, `X³ + X − 1` has `t2 = 3.3967… ≤ hunterBound` but is not a
  candidate: `|disc| = 31` is squarefree and `31 > 23` (its field is `3.1.31.1`). The same holds
  for `X³ + X + 1`, `X³ − X² − 1` and `X³ + X² + 1`. The prime-degree theorem fails in degree `4`:
  see 2.2.

### 2.2 Completeness in composite degree

For composite `n`, Hunter's `θ` may generate a proper subfield `F = ℚ(θ)` of degree `m ∣ n`,
`1 < m < n`. Three milestones close the gap.

- **The subfield reduction** (`discr_pow_finrank_dvd_discr`). For number fields `F ⊆ K`,
  `discr F ^ [K : F]` divides `discr K`: Tau Ceti's `relDiscr_tower` over `ℤ`, with
  `relDiscr_int_ringOfIntegers`, is `(discr K) = (discr F) ^ [K : F] · N(𝔡_{K/F})` as ideals of
  `ℤ`. Hence `|discr F| ≤ D ^ (m/n)`, and `F` is one of finitely many fields of degree `m`: by 2.1
  if `m` is prime, and by induction on `n` through 2.3 in general.
  The dichotomy `exists_mem_hunterCandidates_or_subfield`: for `[K : ℚ] = n ≥ 2`,
  `|discr K| ≤ D` and `Γ` admissible in rank `n − 1`, either some Hunter candidate defines `K`, or
  `K` has an intermediate field `F` with `1 < [F : ℚ] < n` and `|discr F| ^ [K : F] ≤ D`.
- **The relative Hunter theorem** (`hunter_relative`, Martinet). Let `F ⊆ K` with `m = [F : ℚ]`,
  `m' = [K : F] ≥ 2`, `n = m m'`, let `Γ` be admissible in rank `n − m`, and let `R` be a finite
  set of representatives of `𝓞 F / m' 𝓞 F`. There is `θ ∈ 𝓞 K ∖ F` with `Tr_{K/F} θ ∈ R` and

  ```text
  ∑_σ ‖σ θ‖²  ≤  (1/m') ∑_τ ‖τ (Tr_K/F θ)‖²  +  Γ · (|discr K| / (m'^m · |discr F|)) ^ (1/(n−m)),
  ```

  `σ` over the `n` embeddings of `K` and `τ` over the `m` embeddings of `F`. Proof: the same
  argument as 1.3 on the lattice `𝓞 K / 𝓞 F` of rank `n − m`, with the form
  `T₂(x) − (1/m') T₂_F(Tr_{K/F} x)`, which is `T₂` of the orthogonal projection of `x` away from
  `F ⊗ ℝ` (the projection onto `F ⊗ ℝ` is `x ↦ Tr_{K/F}(x) / m'`). `𝓞 F` is saturated in `𝓞 K`,
  and on it `T₂_K = m' · T₂_F`, so its Gram determinant is `m'^m · |discr F|` and the quotient
  has determinant `|discr K| / (m'^m · |discr F|)`. Shifting `θ` by `a ∈ 𝓞 F` changes
  `Tr_{K/F} θ` by `m' a` and leaves the form unchanged, which puts the trace in `R`. ⚠ The
  denominator is `m'^m · |discr F|`, the `T₂`-determinant of `𝓞 F` inside `K`; it is not
  `|discr F| ^ m'`, and `|discr K| / |discr F| ^ m' = N(𝔡_{K/F})` is not the determinant of
  `𝓞 K / 𝓞 F`. For `F = ℚ` the theorem is 1.3 with `Tr θ` reduced modulo `n`.
- **Relative candidates and completeness.** For `F`, `m' ≥ 2` and `B : ℝ`, the relative candidate
  set `relCandidates F m' B` is the set of monic `P ∈ (𝓞 F)[X]` of degree `m'` with
  `∑_τ t2_ℂ (τ P) ≤ B`, where `τ P` is the image of `P` under `τ : F →+* ℂ` and `t2_ℂ` is the
  sum of `‖β‖²` over its complex roots. It is finite: by 1.1 (over `ℂ`) each coefficient of each
  `τ P` is bounded, and Mathlib's `NumberField.Embeddings.finite_of_norm_le` leaves finitely many
  elements of `𝓞 F`. **Completeness in composite degree:** let `K` have degree `n`,
  `|discr K| ≤ D`, and a proper intermediate field; let `F` be a maximal one (no field strictly
  between `F` and `K`), `m = [F : ℚ]`, `m' = n / m`, and `Γ` admissible in rank `n − m`. Then
  `K = F(θ)` with the relative minimal polynomial of `θ` in `relCandidates F m' B_F`, where
  `B_F := max_{r ∈ R} (1/m') ∑_τ ‖τ r‖² + Γ · (D / (m'^m · |discr F|)) ^ (1/(n−m))`: the
  relative Hunter element is not in `F`, so it generates `K` over `F` by maximality, and its
  `T₂` is `∑_τ t2_ℂ (τ P)` for its relative minimal polynomial `P`.

No Lean declaration here states the relative candidate sets: the relative `T₂` of a polynomial
over `𝓞 F` and the field `F(θ)` of a relative polynomial need the instance plumbing of a tower of
`AdjoinRoot`s, and the README is the specification. `relT2`, `relCandidates`,
`relCandidates_finite` and `exists_mem_relCandidates_of_maximal` are the names these targets take.

*Prerequisites:* 1.1, 1.3, 2.1; Number Field Arithmetic 4.1–4.2 (`TauCeti.relDiscr_tower`,
`TauCeti.NumberField.relDiscr_int_ringOfIntegers`); Mathlib `ZLattice`, `Algebra.trace`,
`IntermediateField`, `NumberField.Embeddings.finite_of_norm_le`. (Source: Martinet 1985; Pohst
1982, §§2–3; Cohen 1993, §6.4.1.)

**Checks.**

- (`4.0.1008`, the absolute bound fails) for `n = 4`, `D = 1008`, `Γ = 4/3`,
  `hunterBound = 1 + (4/3) · 252^(1/3) = 9.42…`, while every defining polynomial of either field
  of prefix `4.0.1008` has `t2 ≥ 4√7 = 10.583…` (their canonical polynomials `X⁴ ∓ 5X² + 7`
  attain it). So neither field is defined by a Hunter candidate; Hunter's element lies in the
  common quadratic subfield `F = ℚ(√−3)` (for instance `ω = (1 + √−3)/2`, with `Tr ω = 2` and
  `∑_σ ‖σ ω‖² = 4`).
- (subfield reduction) for these fields `|discr F|² = 9` divides `1008 = 2⁴ · 3² · 7`, and
  `3 ≤ 1008^(1/2)`.
- (relative bound, equality) over `F = ℚ(√−3)`, `m = m' = 2`, `Γ = (4/3)^(1/2)`: a root `x` of
  `X⁴ − 5X² + 7` has relative minimal polynomial `X² − (2 + ω)`, so `Tr_{K/F} x = 0`, and
  `∑_σ ‖σ x‖² = 4√7 = (2/√3) · (1008 / (2² · 3))^(1/2)`; the relative bound is attained.
- (rejection) `4.0.1008` is not primitive, so `exists_mem_hunterCandidates_of_primitive` does not
  apply to it, and the conclusion of `exists_mem_hunterCandidates_of_prime` is false for it: the
  prime-degree theorem must not be stated in composite degree.

### 2.3 The complete list of fields of bounded discriminant

**Definitions.**

```text
canonicalPolys n D := {polredabs K | K a number field, [K : ℚ] = n, |discr K| ≤ D}
hunterImage n D Γ  := {polredabs (ℚ[X]/(P)) | P ∈ hunterCandidates n D Γ, |discr ℚ[X]/(P)| ≤ D}
```

with `ℚ[X]/(P) = AdjoinRoot (P.map (Int.castRingHom ℚ))`, a number field since `P` is monic and
irreducible.

**Theorems.**

- `hunterImage_finite` and `hunterImage_subset_canonicalPolys`, for every `n`.
- **The complete list in prime degree** (`hunterImage_eq_canonicalPolys_of_prime`): for `n`
  prime and `Γ` admissible in rank `n − 1`, `hunterImage n D Γ = canonicalPolys n D`. Each field
  appears exactly once, by 1.2. This is a plain theorem about two sets of polynomials: the left
  side is a stated finite set, computed by applying `polredabs` to the elements of a finite set of
  polynomials and filtering by the discriminant.
- **The complete list in composite degree.** By strong induction on `n`, with `Γ_k` admissible in
  each rank `k < n`:

  ```text
  canonicalPolys n D = hunterImage n D Γₙ₋₁
      ∪ ⋃ (m ∣ n, 1 < m < n) ⋃ (Q ∈ canonicalPolys m ⌊D^(m/n)⌋)
          {polredabs (F_Q(θ)) | θ a root of some P ∈ relCandidates F_Q (n/m) B(F_Q),
                               [F_Q(θ) : ℚ] = n, |discr F_Q(θ)| ≤ D}
  ```

  where `F_Q = ℚ[X]/(Q)` and `B(F_Q)` is the bound `B_F` of 2.2 for `F = F_Q`. The right side is finite (2.1, 2.2 and
  the induction hypothesis) and stated; the equality is 2.1 for primitive `K` and 2.2 for the
  rest. No Lean declaration here states it, for the reason given in 2.2.
- `canonicalPolys_finite`: `canonicalPolys n D` is finite for every `n` (also from Mathlib's
  `NumberField.finite_of_discr_bdd` through `polredabs`).
- **Comparison with the effective count** (`ncard_canonicalPolys_le`): `(canonicalPolys n D).ncard`
  is at most Tau Ceti's bound `(2 · coeffBoundOfDiscrBdd D + 1) ^ (rankOfDiscrBdd D + 1) ·
  rankOfDiscrBdd D` for the subfields of `ℂ` of discriminant `≤ D`: sending a canonical polynomial
  to the subfield of `ℂ` generated by one of its roots is injective, since distinct canonical
  polynomials define non-isomorphic fields. The count bounds the number of fields; the list
  identifies them.
- **The prefix version** (`setOf_hasLMFDBIntrinsicLabel_subset`): the canonical polynomials of the
  fields with prefix `d.r.D` (`HasLMFDBIntrinsicLabel K d r D`) form the subset of
  `canonicalPolys d D` cut out by `r` real roots and `|discr| = D`; in particular they are a
  finite set, and for prime `d` it is a subset of `hunterImage d D Γ` computed from finitely many
  polynomials. This is the completeness statement behind the LMFDB's `nf` table for one prefix;
  the order in which the table lists the fields of a prefix is not a target.

*Prerequisites:* 1.2, 2.1, 2.2; Number Field Arithmetic 8.1
(`TauCeti.NumberField.HasLMFDBIntrinsicLabel`); Effective Bounds Layer 2
(`NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`); Mathlib `AdjoinRoot`,
`NumberField.finite_of_discr_bdd`.

**Checks.**

- (`n = 2`, `D = 8`) `canonicalPolys 2 8 = {X² − X − 1, X² − X + 1, X² + 1, X² − X + 2, X² − 2,
  X² + 2}`, the fields `2.2.5.1`, `2.0.3.1`, `2.0.4.1`, `2.0.7.1`, `2.2.8.1`, `2.0.8.1`; with
  `Γ = 1` it equals `hunterImage 2 8 1`.
- (`n = 3`, `D = 23`) `canonicalPolys 3 23 = {X³ − X² + 1}`: `3.1.23.1` is the only cubic field
  of `|discr| ≤ 23`, and the four Hunter candidates all have this polredabs image.
- (`n = 3`, `D = 49`) `canonicalPolys 3 49` has four elements: `X³ − X² + 1` (`−23`), `X³ + X − 1`
  (`−31`), `X³ − X² + X + 1` (`−44`), `X³ − X² − 2X + 1` (`49`), and it equals
  `hunterImage 3 49 (4/3)^(1/2)`; the last is found only because the `T₂` bound is not strict.
- (prefix) the fields with prefix `4.0.1008` have the two canonical polynomials `X⁴ − 5X² + 7` and
  `X⁴ + 5X² + 7` (the example of the LMFDB knowl `nf.label`), both with Galois group `D₄` and
  quadratic subfield `ℚ(√−3)`; they lie in `canonicalPolys 4 1008` and not in
  `hunterImage 4 1008 (4/3)`, and the composite-degree list finds them over `F = ℚ(√−3)`.
- (Tau Ceti fields) for the worked fields of Tau Ceti, `polredabs` of `3.1.23.1`, `3.1.503.1` and
  `4.0.125.1` is `X³ − X² + 1`, `X³ − X² + 2X + 8` and `X⁴ − X³ + X² − X + 1`.

## Worked examples (acceptance criteria)

Every number below was checked with PARI/GP (`polredabs`, `polroots`, `nfdisc`, `nfisisom`,
`polgalois`, `nfsubfields`) or is quoted from the cited source; each names the milestone that
produces it.

**Quadratic fields (1.1–1.3, 2.1, 2.3).** `2.2.5.1`: `polredabs = X² − X − 1`, `t2 = 3`,
`disc = 5`; `X² − 5` defines the same field with `t2 = 10` and is not canonical. Hunter's bound for
`n = 2`, `|discr| = 5`, `Tr θ = 1`, `Γ = 1`: `1/2 + 1 · (5/2) = 3`, attained by
`θ = (1 + √5)/2`. `2.0.4.1`: `X² + 1`, `t2 = 2`; `X² + 4` has `t2 = 8`. The six quadratic fields of
`|discr| ≤ 8` are found from the eleven elements of `hunterCandidates 2 8 1`.

**Cubic fields (1.2, 1.3, 2.1, 2.3).** `3.1.23.1`: `X³ − X² + 1`, `t2 = 3.2192…`, Hunter's bound
`1/3 + (2/√3) · (23/3)^(1/2) = 3.5305…`; `X³ − X − 1` defines it with `t2 = 3.2646…`.
`3.1.503.1`: `X³ − X² + 2X + 8`, the polredabs of Dedekind's `X³ − X² − 2X − 8` (which has
`t2 = 13.439…` and index `2`); `t2 = 13.158…`, bound `1/3 + (2/√3) · (503/3)^(1/2) = 15.285…`.
`3.3.49.1`: `X³ − X² − 2X + 1`, `t2 = 5`, equal to Hunter's bound `1/3 + (2/√3) · (49/3)^(1/2) = 5`.
The cubic fields of `|discr| ≤ 49` are `3.1.23.1`, `3.1.31.1`, `3.1.44.1`, `3.3.49.1`, found from
the twenty-eight elements of `hunterCandidates 3 49 (4/3)^(1/2)`.

**Quartic fields (1.2, 2.2, 2.3).** `4.0.125.1`: `polredabs = X⁴ − X³ + X² − X + 1` (`t2 = 4`; the
cyclotomic polynomial `X⁴ + X³ + X² + X + 1` has the same `t2`, equal `|disc| = 125`, and loses on
`S(P)`: `(1, −1, …) < (1, 1, …)`). Prefix `4.0.1008`: two fields, with canonical polynomials
`X⁴ − 5X² + 7` and `X⁴ + 5X² + 7`, equal `t2 = 4√7 = 10.583…`, not isomorphic, both `4T3 = D₄`,
both containing `ℚ(√−3)`. Hunter's absolute bound `9.42…` (`Γ = 4/3`) is below `4√7`, so the
absolute candidates miss both; the relative bound over `ℚ(√−3)` is `(2/√3) · 84^(1/2) = 4√7`
exactly.

**Boundary and off-hypothesis checks.**

- `t2` is not the power sum: for `X² + 1` the power sum is `−2` and `t2 = 2` (1.1).
- Equal `t2` does not identify fields: `X⁴ − 5X² + 7` and `X⁴ + 5X² + 7` (1.2).
- Hunter's inequality is attained (`2.2.5.1` with `Γ = 1`, `3.3.49.1` with `Γ = (4/3)^(1/2)`), so
  every bound here is `≤`, never `<` (1.3, 2.1).
- `Γ = 1` is not admissible in rank `2` (`A₂`: minimum `2`, determinant `3`) (1.3).
- The prime-degree completeness theorem is false in degree `4` (`4.0.1008`) (2.2).

## Ordering

Layer numbering is a dependency order.

- **1.1** first. **1.2** and **1.3** both need only 1.1 and proceed in parallel.
- **2.1** needs 1.1–1.3. **2.2** needs 1.3 and 2.1, and Number Field Arithmetic 4.1–4.2.
- **2.3** needs 1.2, 2.1 and 2.2; its composite-degree statement is by induction on the degree, so
  its instances in degree `n` use those in the proper divisors of `n`.

### Downstream consumers

| Supplied here | What | Consumer |
| --- | --- | --- |
| 1.2 | the canonical polynomial `polredabs K` and `polredabsKey`, an isomorphism invariant | `ArtinRepresentations` (the canonical polynomials of the fields an Artin representation cuts out), `BianchiModularForms` (the polredabs normalization of Hecke fields) |
| 1.2, 2.3 | the canonical polynomial of each field and the completeness of the fields of a prefix `d.r.D` | the LMFDB `nf` section (the `coeffs` column is `polredabs K`) |

## References

- **H. Cohen**, *A Course in Computational Algebraic Number Theory*, GTM 138, Springer 1993.
  §4.4.12 (`POLRED`), §6.4.1 (Hunter's theorem and tables of number fields; the relative version
  attributed to Martinet). (1.2, 1.3, 2.1, 2.2)
- **J. Hunter**, *The minimum discriminants of quintic fields*, Proc. Glasgow Math. Assoc. 3
  (1957), 57–67. Hunter's theorem. (1.3)
- **J. Martinet**, *Méthodes géométriques dans la recherche des petits discriminants*, Séminaire
  de Théorie des Nombres, Paris 1983–84, Progr. Math. 59, Birkhäuser 1985, 147–179. The relative
  form. (2.2)
- **M. Pohst**, *On the computation of number fields of small discriminants including the minimum
  discriminants of sixth degree fields*, J. Number Theory 14 (1982), 99–117. §§2–3: Hunter's
  theorem and its relative form in practice. (1.3, 2.2)
- **J. W. Jones, D. P. Roberts**, *A database of number fields*, LMS J. Comput. Math. 17 (2014),
  595–618. Complete tables by Hunter searches. (2.3)
- **C. Hermite**, *Extraits de lettres de M. Ch. Hermite à M. Jacobi sur différents objets de la
  théorie des nombres*, J. Reine Angew. Math. 40 (1850), 261–315. Hermite's inequality, the source
  of the admissible constants `(4/3)^((m−1)/2)` used in the worked examples. (1.3)
- **G. H. Hardy, J. E. Littlewood, G. Pólya**, *Inequalities*, 2nd ed., Cambridge 1952, Ch. II.
  Newton's and Maclaurin's inequalities. (1.1)
- **The LMFDB Collaboration**, knowls `nf.polredabs`, `nf.label`, `nf.defining_polynomial`,
  `nf.discriminant`, and `lmfdb/number_fields/number_field.py`. (1.2, 2.3)
- **The PARI Group**, *PARI/GP User's Guide*, `polredabs`. (1.2)
