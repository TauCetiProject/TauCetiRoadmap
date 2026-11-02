# Roadmap: number fields of bounded discriminant — Hunter's theorem and complete tables

**Summary.** This roadmap builds sharp finite polynomial families for number fields of bounded
discriminant, starting from root norms, geometry of numbers and integral primitive elements.
It proves existence and uniqueness of canonical defining polynomials, absolute and relative
Hunter bounds, and equality between the resulting finite canonical lists and all fields of the
specified degree and discriminant bound. The objects are number fields and monic polynomials;
the targets are mathematical completeness theorems.


## Scope and ownership

### Owned here

- The `T₂` norm of a complex polynomial and its integer specialization, Maclaurin's coefficient bounds, and the finite sets of
  monic polynomials of bounded degree and `T₂` (1.1).
- The defining polynomials of a number field, the polredabs key, and the canonical polynomial
  `polredabs K` with its existence, uniqueness and isomorphism invariance (1.2).
- Hunter's theorem (1.3) and Martinet's relative form (2.2), each stated for any constant `Γ`
  satisfying the Hermite hypothesis of *Conventions*.
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
- From Mathlib: the polynomial, number-field and lattice APIs in the supplier contracts below.

### Not owned here

- **The qualitative and effective finiteness theorems.** Hermite's theorem is Mathlib's; the
  explicit count and finite families of bounded generating polynomials are Effective Bounds
  Layer 2, including `NumberField.exists_mem_rootSet_eq_adjoin_of_abs_discr_le`.
  This roadmap sharpens the bounds using absolute and relative Hunter theory and chooses canonical
  representatives. Section 2.3 compares the count without re-planning that construction.
- **Hermite's constant.** `γ_m`, its values and the bounds on it (Hermite's inequality
  `γ_m ≤ (4/3)^((m−1)/2)`, Minkowski's bound) belong to geometry of numbers.
  Hunter's statements retain the positive-definite-matrix hypothesis explicitly.
- **General projected lattices.** GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3 owns
  adapted bases and the covolume quotient for an orthogonal projection. This roadmap applies
  those results to the integer lattices of number fields and proves their trace-form identities.
  Hunter's theorem holds for every admissible constant `Γ`.
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

## Conventions

| Object | Convention |
|---|---|
| `T₂` of a polynomial | `t2 P := ∑ ‖α‖ ^ 2` over the roots `α` of `P.map (Int.castRingHom ℂ)` in `ℂ`, with multiplicity (`Polynomial.roots`). It is the sum of squared **absolute values**, not the power sum `∑ α ^ 2`; the two agree exactly when every root is real. `t2` belongs to the polynomial: two polynomials defining one field have different `t2` in general. |
| `T₂` of an element | For `θ ∈ 𝓞 K`, `T₂(θ) := ∑_{σ : K →+* ℂ} ‖σ θ‖ ^ 2`, over all `n = [K : ℚ]` complex embeddings. `T₂(θ) = [K : ℚ(θ)] · t2 (minpoly ℤ θ)` (1.1). |
| Coefficients | `P = Xⁿ + a₁ Xⁿ⁻¹ + ⋯ + aₙ`, with `a_k = P.coeff (n − k)` only for `0 ≤ k ≤ n`, and `a_k = 0` for `k > n`. For monic `P`, this makes the power-sum formula valid in every degree. |
| Defining polynomials | `definingPolys K` is the set of `minpoly ℤ θ` for `θ : TauCeti.NumberField.IntegralPrimitiveElement K`: the monic irreducible integer polynomials of degree `[K : ℚ]` with a root generating `K`. |
| The polredabs key | `polredabsKey P := toLex (t2 P, toLex ((P.discr).natAbs, S P))` in `Lex (ℝ × Lex (ℕ × List ℤ))`, with `S P := [|a₁|, a₁, |a₂|, a₂, …, |aₙ|, aₙ]` under Mathlib's lexicographic order on `List ℤ`. Smaller is better: minimal `T₂`, then minimal `|disc P|`, then lexicographically least `S(P)`. This is the LMFDB knowl `nf.polredabs` and the specification PARI's `polredabs` meets. |
| The canonical polynomial | `polredabs K` is the `polredabsKey`-minimum of `definingPolys K` (1.2). |
| Discriminant bounds | `|discr K| ≤ D` in `ℤ`, with `D : ℕ`; the prefix uses `(discr K).natAbs = D`. |
| Hermite hypothesis | A real `Γ` is **admissible in rank `m`** when every positive definite real symmetric `m × m` matrix `A` (Mathlib's `Matrix.PosDef`) has a nonzero `x : Fin m → ℤ` with `x ⬝ᵥ A *ᵥ x ≤ Γ · (det A) ^ (1/m)`. This says `γ_m ≤ Γ`, without naming `γ_m`. It is written out in each theorem that needs it and never wrapped in a predicate. `Γ = 1` is admissible in rank `1` (1.3). The examples use admissible constants `1`, `2/√3`, `4/3` in ranks `1`, `2`, `3`, respectively (Martinet, corrected author version, §1, p. 3, table of Hermite constants; the rank-three value `2^(1/3)` is at most `4/3`). Rank zero is excluded whenever admissibility is required. |
| Trace normalization | Hunter's element satisfies `0 ≤ Tr θ ≤ n/2`; since `Tr θ ∈ ℤ`, `Tr θ ≤ ⌊n/2⌋`, and `hunterBound` uses `⌊n/2⌋² / n`. |
| Relative norm of the discriminant | For `K ⊃ F` with `m = [F : ℚ]` and `m' = [K : F]`, `|discr K| = |discr F| ^ m' · N(𝔡_{K/F})` (Number Field Arithmetic 4.2). The relative Hunter bound uses `|discr K| / (m' ^ m · |discr F|)`, the determinant of the lattice `𝓞 K / 𝓞 F` in the `T₂` form (2.2). |
| Universe | `canonicalPolys n D` quantifies over fields `K : Type`; every number field is isomorphic to one in `Type` (e.g. `AdjoinRoot` of a defining polynomial), so nothing is lost. |


## Exact supplier contracts

### From Mathlib

- Polynomials: `Polynomial.roots`, `Polynomial.map`, `Polynomial.Monic`, `Polynomial.natDegree`,
  `Polynomial.discr` (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`),
  `Polynomial.coeff_eq_esymm_roots_of_card` (Vieta, `Mathlib/RingTheory/Polynomial/Vieta.lean`),
  `Multiset.esymm`, `minpoly`, `minpoly.isIntegrallyClosed_eq_field_fractions'`, `AdjoinRoot` with
  its `NumberField (AdjoinRoot f)` instance for `[Fact (Irreducible f)]`, `f : ℚ[X]`.
- Prefix comparison: `AdjoinRoot.equiv` (`Mathlib/RingTheory/AdjoinRoot.lean`) identifies
  algebra homomorphisms from the quotient by a nonzero polynomial with its roots in a domain;
  `NumberField.InfinitePlace.card_real_embeddings`
  (`Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`) counts the real complex
  embeddings. Separability of a number-field defining polynomial makes its root multiplicities one.
- Number fields: `NumberField`, `NumberField.RingOfIntegers` (`𝓞 K`), `NumberField.discr`,
  `Algebra.trace`, `Algebra.adjoin`, `IntermediateField`, `IntermediateField.adjoin.finrank`,
  `NumberField.Embeddings.coeff_bdd_of_norm_le` (coefficient bounds from bounds on the
  conjugates), `NumberField.Embeddings.finite_of_norm_le` (finitely many algebraic integers of
  this fixed number field with uniformly bounded conjugates), `NumberField.finite_of_discr_bdd` (Hermite),
  `NumberField.abs_discr_ge` (Minkowski), `NumberField.hermiteTheorem.rankOfDiscrBdd`,
  `NumberField.mixedEmbedding`.
- Geometry of numbers: `ZLattice`, `ZLattice.covolume`,
  `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` (Minkowski's
  convex-body theorem).
- Linear algebra and orders: `Matrix.PosDef`, `Matrix.det`, `dotProduct`, `Matrix.mulVec`,
  `Prod.Lex`, the lexicographic `LinearOrder` on `List ℤ`, `Ideal.span`,
  `Ideal.span_singleton_dvd_span_singleton_iff_dvd`.

### From Tau Ceti

The acceptance file imports `TauCeti.NumberTheory.NumberField.Index.Basic`,
`TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic` and
`TauCeti.NumberTheory.NumberField.IntrinsicLabel`. The following contracts also name
modules used by the README proof routes and worked examples; those modules need not be imported
by the acceptance file.

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
  `NumberField.hermiteCountBound` and
  `NumberField.exists_mem_rootSet_eq_adjoin_of_abs_discr_le`
  (`TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic`). The last theorem takes a
  finite-dimensional subfield of a characteristic-zero field, with `|discr| ≤ D`, and supplies a
  generating root of an integer polynomial of degree at most
  `NumberField.hermiteTheorem.rankOfDiscrBdd D` and coefficients bounded by
  `NumberField.coeffBoundOfDiscrBdd D`.
- The worked number fields `3.1.23.1`, `3.1.503.1` and `4.0.125.1` with their prefixes
  (`TauCeti.NumberTheory.NumberField.WorkedExamples.{Cubic23,DedekindCubic,FifthCyclotomic}.Invariants`),
  which the Checks below can use as concrete fields.

### From TauCetiRoadmap.NumberFieldArithmetic

Use [Number Field Arithmetic](../../Completed/NumberFieldArithmetic/README.md), §§3.1 and 3.3,
for integral primitive elements and the index-discriminant identity; §§4.1–4.2 for relative
discriminants and the tower formula; §8.1 for the intrinsic LMFDB prefix. The precise native
declarations and their modules are listed above.

### From TauCetiRoadmap.EffectiveBounds

Use [Effective Bounds](../../Completed/EffectiveBounds/README.md), Layer 2, for the explicit
Hermite–Minkowski generating family and count, with the native contracts above.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Sections 0.2.1 and 0.2.2 supply adapted and projected integral bases; §0.3.1 supplies
`covolume_projection` for a full discrete lattice Δ, a real subspace W with Δ∩W spanning W,
and the projected lattice in W-perp: `covol(proj Δ)=covol(Δ)/covol(Δ∩W)`, in intrinsic
Euclidean volume. Sections 1.3 and 2.2 here apply the squared identity to `𝓞 K∩ℝ·1=ℤ`
and to the saturated subfield lattice `𝓞 F`, respectively.

## How to read the build

Section 1.1 gives coefficient bounds and finiteness. Sections 1.2 and 1.3 use it independently
to construct canonical representatives and Hunter's bound. Section 2.1 proves absolute
completeness for primitive fields; §2.2 supplies relative completeness over maximal proper
subfields. Section 2.3 combines these into a complete list by induction on degree, using only
smaller-degree instances of its own statement.

## Layer 1: T₂, the canonical polynomial and Hunter's theorem

### 1.1 The T₂ norm and coefficient bounds

Define `complexT2 P` for every `P : ℂ[X]` as the sum of `‖α‖²` over its complex roots with
multiplicity; define `t2 P` on `ℤ[X]` by mapping to `ℂ[X]`. These are root norms, including
`complexT2 0 = 0` by the empty multiset convention (LMFDB, knowl nf.polredabs, root-norm
paragraph; the zero-polynomial extension is our convention). For `n : ℕ` and `B : ℝ`, define
`candidates n B := {P : ℤ[X] | P.Monic ∧ P.natDegree = n ∧ t2 P ≤ B}`.

**API for candidates.** Membership is monicity, degree and the norm bound; the sets increase
with `B` and have empty intersection for distinct prescribed degrees. The finite-cardinality
bound below uses the coefficient intervals.

**Theorems.**

- The two root norms are nonnegative, invariant under nonzero scalar multiplication, and
  additive on products of nonzero polynomials. The integer norm agrees with the complex norm
  after coefficient mapping. *Needs:* `Polynomial.roots`, root multiplicities.
- `norm_coeff_le_of_complexT2`: for monic `P : ℂ[X]` of degree `n > 0` and `k ≤ n`,
  `‖P.coeff (n-k)‖ ≤ C(n,k) · (complexT2 P / n)^(k/2)`.
  For monic integer polynomials of degree `n > 0` and `k ≤ n`, coefficient mapping gives
  the specialization `|P.coeff (n-k)| ≤ C(n,k) · (t2 P / n)^(k/2)`.
  These are deductions from Vieta, the following symmetric-mean inequality and Cauchy–Schwarz.
  *Needs:* `Polynomial.coeff_eq_esymm_roots_of_card`, `Multiset.esymm`, the next target.
- Prove Maclaurin's bound for a multiset of `n > 0` nonnegative reals and `0 ≤ k ≤ n`:
  `e_k(x) / C(n,k) ≤ (e_1(x)/n)^k`. One route maximizes the continuous symmetric polynomial
  on the compact simplex of fixed sum. Replacing a pair `(a,b)` by their average changes
  `e_k` by `(a-b)² e_(k-2)(remaining)/4 ≥ 0`; among maximizers choose one of least sum of
  squares, which must have all coordinates equal. Treat `k=0,1` directly. This proves the
  stated symmetric-mean inequality. *Needs:* finite elementary symmetric
  polynomials, compactness of a closed bounded simplex and attainment of continuous extrema.
  Applying it to root absolute values and then Cauchy–Schwarz gives the coefficient target.
- `candidates_finite`: `candidates n B` is finite. Each coefficient lies in an explicit integer
  interval, so the set is contained in a finite product of intervals; the milestone also gives the
  bound `card ≤ ∏_{k=1}^n (2⌊C(n,k)(B/n)^(k/2)⌋ + 1)` when `n > 0`, `B ≥ 0`.
  For negative `B` the set is empty; for `n=0` it is `{1}` precisely when `B ≥ 0`.
  *Needs:* the coefficient bound, finite integer intervals, coefficient extensionality.
- For `θ : 𝓞 K`,
  `∑_{σ : K →+* ℂ} ‖σ θ‖ ^ 2 = ([K : ℚ] / deg(minpoly ℤ θ)) · t2 (minpoly ℤ θ)`; each complex root
  of the minimal polynomial is `σ θ` for exactly `[K : ℚ(θ)]` embeddings `σ`.
- For a monic polynomial all of whose complex roots are real, `T₂(P) = a₁² − 2a₂`,
  with the zero-extended coefficients of Conventions. The root power-sum identity is valid
  in every degree; the direct expression using `P.coeff (n-2)` requires `n ≥ 2`.
  *Needs:* Vieta and the identity `(∑ α)² = ∑ α² + 2∑_{i<j} α_i α_j`.

The root norm is not the power sum `∑ αᵢ² = a₁² − 2a₂` for monic polynomials (the roots are complex and `|α|² ≠ α²`); the two
agree only when every root is real.

*Needs:* Mathlib `Polynomial.roots`, `Polynomial.coeff_eq_esymm_roots_of_card`,
`Multiset.esymm`, `NumberField.Embeddings.coeff_bdd_of_norm_le` for the shape of the coefficient
bound, `minpoly`.

**Checks.**

- (values) `t2 (X² − X − 1) = 3`, `t2 (X² − 5) = 10`, `t2 (X² + 1) = 2`, `t2 (X² + 4) = 8`.
- (rejection) For `X² + 1` the power sum `a₁² − 2a₂` is `−2`; a definition of `T₂` as `∑ α²`
  gives `−2` and must be rejected.
- (sharpness) `P = X² + 2` has `t2 P = 4` and `|a₂| = 2 = C(2, 2) · (4/2) ^ 1`: Maclaurin's bound
  is sharp for the constant coefficient. At `k=1` it gives `0 < 2√2`; cancellation in
  Vieta's sum prevents equality despite equal root absolute values.
- (count) `candidates 2 2` has exactly nine elements: `X²`, `X² ± X`, `X² ± 1`, `X² ± X + 1`,
  `X² ± 2X + 1`.
- (elements) for `θ = (1 + √5)/2` in `ℚ(√5)`, `∑_σ ‖σ θ‖² = 3 = t2 (X² − X − 1)`.

- (indexing) `X−1` has `T₂=1`, `a₁=−1`, `a₂=0`, hence `1=1`; truncating `1−2` to zero
  would instead give `1=3`. The monic constant `1` has `T₂=0` and `a₁=a₂=0`.
- (monicity) `2X²−2` has root norm `2`, whereas its unnormalized coefficient expression is `4`;
  the all-real formula is asserted for monic polynomials.
- (complex coefficients) for `ω=(1+√−3)/2`, each conjugate of `X²−(2+ω)` has norm
  `2√7` and constant-coefficient absolute value `√7`, giving `√7 ≤ √7`.
- (symmetric mean) `(1,3)`, `k=2` gives `3 ≤ 4`; `(2,2)` gives `4=4`; `(0,0)` gives `0=0`.
- (candidate boundaries) `candidates 0 (−1)=∅`, `candidates 0 0={1}` and
  `candidates 1 1={X−1,X,X+1}`; zero is never a candidate since it is not monic.

### 1.2 The canonical defining polynomial

**Definitions.** For a number field `K` of degree `n`,
`definingPolys K := {minpoly ℤ θ | θ : TauCeti.NumberField.IntegralPrimitiveElement K}`, and

```text
signVector P := [|a₁|, a₁, |a₂|, a₂, …, |aₙ|, aₙ]          for P = Xⁿ + a₁Xⁿ⁻¹ + … + aₙ
polredabsKey P := toLex (t2 P, toLex (|disc P|, signVector P))
                 : Lex (ℝ × Lex (ℕ × List ℤ))
polredabs K := the polredabsKey-minimum of definingPolys K
```

The following are deductions from this ordering and §1.1 finiteness (LMFDB, knowl
nf.polredabs, definition of the three successive minimizations).

**Theorems.**

- A polynomial `P` is a
  defining polynomial if and only if it is monic of degree `[K : ℚ]` with a root `θ ∈ K` such that
  `Algebra.adjoin ℚ {θ} = ⊤`; it is then irreducible over `ℤ` and over `ℚ`.
- For `P ∈ definingPolys K`, `ℚ[X]/(P) ≃ₐ[ℚ] K`
  (`AdjoinRoot (P.map (Int.castRingHom ℚ))`).
- The key is injective on monic polynomials of a fixed
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

The ordering follows LMFDB, knowl nf.polredabs, three-stage definition: minimal `T₂`, then minimal `|disc|`, then
lexicographically least `S(P)`. ⚠ `T₂` ties are real: `x⁴ − 5x² + 7` and `x⁴ + 5x² + 7` have
equal `t2` and define different fields (*Worked examples*), and within one field a `T₂`-minimal
polynomial is in general not unique (`X² − X − 1` and `X² + X − 1`), so the discriminant and
`S(P)` tie-breaks are part of the definition, not decoration.

*Needs:* 1.1; Number Field Arithmetic 3.1 (`TauCeti.NumberField.IntegralPrimitiveElement`);
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

**API for the coefficient vector and key.** The vector has length `2n`, recovers each of
the `n` lower coefficients, and is preserved by equality of monic polynomials. The key compares
norm, then discriminant, then that vector; it determines a monic polynomial of fixed degree.
*Needs:* polynomial coefficient extensionality and the lexicographic orders.

**Checks.**

- `signVector (X²−X−1)=[1,−1,1,−1]` and `signVector (X²+X−1)=[1,1,1,−1]`; their keys
  are `(3,5,[1,−1,1,−1])` and `(3,5,[1,1,1,−1])`, fixing the sign and ordering direction.
- `signVector X=[0,0]`, with key `(0,1,[0,0])`; deleting zero coefficients would lose degree.
- `signVector 1=signVector 2=[]`, and both constant-polynomial keys are `(0,1,[])`;
  injectivity must retain monicity as well as fixed degree.

**API for defining polynomials.** They are nonempty and preserved under rational algebra
isomorphism; membership is exactly the monic, full-degree, generating-root condition above.
**Checks.**

- `X²−5` and `X²−X−1` both define `ℚ(√5)`; this set includes nonmaximal orders.
- `X−1` does not define `ℚ(√5)`, since its degree is `1`, not `2`; `X²+1` has no root there.
- `X` defines `ℚ` although its root is zero; `X²−1` does not, despite having the root `1`.

**API for the canonical choice.** Membership and minimality exclude its fallback value `0`;
uniqueness, monicity, irreducibility and invariance follow as above.
**Checks.**

- For `ℚ`, the choice is `X`, with norm `0`; `X−1` has norm `1` and loses.
- For `ℚ(√5)`, the choice is `X²−X−1`, key `(3,5,[1,−1,1,−1])`, not `X²−5` of norm `10`.
- The two quartics `X⁴∓5X²+7` both have norm `4√7` but different keys and nonisomorphic
  fields; minimizing only the norm does not classify them.

### 1.3 Hunter's theorem

**Theorem** (`hunter`). Let `K` be a number field of degree `n ≥ 2` and let `Γ` be admissible in
rank `n − 1` (*Conventions*; Martinet, Corollary 2.9, corrected author version p. 8). There exists `θ ∈ 𝓞 K` with `θ ∉ ℚ`, `0 ≤ Tr θ ≤ n/2` and

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

The rank-one check is elementary: `Γ = 1` is admissible in rank `1`: a positive definite
`1 × 1` matrix `(a)` has `1 · a · 1 = a = det`. This is the hypothesis of `hunter` for quadratic
fields.

The theorem takes any admissible `Γ` and never names Hermite's constant: the admissible constants
themselves are lattice theory, not this roadmap's.

*Needs:* §1.1; GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3; Mathlib `NumberField.mixedEmbedding`, `ZLattice`, `Algebra.trace`,
`Matrix.PosDef`, `NumberField.discr`. (Martinet, corrected author version, Corollary 2.9, p. 8, and trace reduction on p. 9;
Hunter, Theorem 1, p. 57, is the historical quintic case.)

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

### Examples

For `ℚ(√5)`, the integral generator `(1+√5)/2` has trace `1` and norm `3`, attaining Hunter's
bound. Its canonical polynomial `X²−X−1` beats `X²+X−1` at the signed-coefficient tie-break.
For `ℚ(i)`, the polynomial `X²+1` has norm `2 ≤ 5/2`; `X²+4` defines the same field with norm `8`.

### Dependencies

Section 1.1 uses Mathlib polynomial roots, Vieta, elementary symmetric functions, compactness
and finite integer intervals. Section 1.2 uses §1.1 and Number Field Arithmetic §3.1. Section 1.3
uses §1.1, the native mixed embedding, trace and positive-definite-matrix APIs, and
GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3 for the projected lattice. Its arithmetic
Gram-determinant and trace identities are proved here
(Martinet, Proposition 2.3, p. 6, Theorem 2.6, p. 7, Corollary 2.9, p. 8).

## Layer 2: complete lists of number fields

### 2.1 Completeness in prime degree

**Definitions.** For `n, D : ℕ` and `Γ : ℝ`,

```text
hunterBound n D Γ := ⌊n/2⌋² / n + Γ · (D / n) ^ (1/(n−1))
hunterCandidates n D Γ := {P ∈ candidates n (hunterBound n D Γ) |
    Irreducible P ∧ ∃ f D' : ℕ, D' ≤ D ∧ |disc P| = f² · D'}
```

**Theorems.**

- The Hunter candidates form a finite set, as a subset of the finite set in §1.1.
- **Completeness** (`exists_mem_hunterCandidates_of_prime`): if `[K : ℚ] = n` is prime,
  `|discr K| ≤ D` and `Γ` is admissible in rank `n − 1`, then some `P ∈ hunterCandidates n D Γ`
  lies in `definingPolys K`. Proof: Hunter's `θ` is not rational, so for prime `n` it generates
  `K`; `P := minpoly ℤ θ` has `t2 P = ∑_σ ‖σ θ‖² ≤ hunterBound n D Γ` (1.1, 1.3, with
  `Tr θ ∈ ℤ`, and `Γ ≥ 1` because admissibility applied to the identity matrix forces it); and `disc P = (index θ)² · discr K` (Number Field Arithmetic 3.3),
  so `D' = |discr K|`. This is a deduction from Martinet, Corollary 2.9, corrected author
  version p. 8, and the native index formula. *Needs:* §1.1, §1.3, Number Field Arithmetic §3.3.
- **Primitive fields** (`exists_mem_hunterCandidates_of_primitive`): the same conclusion for any
  `n ≥ 2` when `K` is primitive, that is, its only intermediate fields are `⊥` and `⊤`; the proof
  is the same, since `ℚ(θ) ≠ ⊥`. *Needs:* the preceding proof with the intermediate-field hypothesis.

*Needs:* 1.1–1.3; Number Field Arithmetic 3.3
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

**API for the absolute bound and candidates.** For `n ≥ 2`, `Γ ≥ 0`, the bound increases
with `D`; for `D ≥ 0` it increases with `Γ`. Candidate sets inherit these inclusions for
`n ≥ 2`, and their discriminant square factor is a necessary condition, not a replacement for
the field-discriminant filter in §2.3. *Needs:* real-power monotonicity, §1.1 and the index formula.
**Checks.**

- `hunterBound 2 0 1=1/2`, `hunterBound 2 5 1=3`, `hunterBound 2 8 1=9/2`.
- `hunterBound 0 D Γ=0` under total real division and powers, and
  `hunterBound 1 D Γ=Γ`; neither value is used in Hunter completeness.
- The bound `5` in degree `3`, discriminant `49`, retains the equality case of §1.3;
  taking an open interval would lose it. At `(n,D,Γ)=(2,0,1)` no irreducible candidate exists.

### 2.2 Completeness in composite degree

For composite `n`, Hunter's `θ` may generate a proper subfield `F = ℚ(θ)` of degree `m ∣ n`,
`1 < m < n`. Three milestones close the gap.

- **The subfield reduction.** For number fields `F ⊆ K`,
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
  `∑_τ complexT2 (τ P) ≤ B`, where `τ P` is the image of `P` under `τ : F →+* ℂ` and `complexT2` is the
  sum of `‖β‖²` over its complex roots. It is finite: by §1.1 `norm_coeff_le_of_complexT2` each coefficient of each
  `τ P` is bounded, and Mathlib's `NumberField.Embeddings.finite_of_norm_le` leaves finitely many
  elements of `𝓞 F`. **Completeness in composite degree:** let `K` have degree `n`,
  `|discr K| ≤ D`, and a proper intermediate field; let `F` be a maximal one (no field strictly
  between `F` and `K`), `m = [F : ℚ]`, `m' = n / m`, and `Γ` admissible in rank `n − m`. Then
  `K = F(θ)` with the relative minimal polynomial of `θ` in `relCandidates F m' B_F`, where
  `B_F := max_{r ∈ R} (1/m') ∑_τ ‖τ r‖² + Γ · (D / (m'^m · |discr F|)) ^ (1/(n−m))`: the
  relative Hunter element is not in `F`, so it generates `K` over `F` by maximality, and its
  `T₂` is `∑_τ complexT2 (τ P)` for its relative minimal polynomial `P`.

Define `relT2 F P := ∑_τ complexT2 (τ P)` and `relCandidates F r B` as above for every
`r : ℕ` and `B : ℝ`. Define `relativeBound F r D Γ R` as `B_F`, with the maximum interpreted
as the real supremum of the finite image of `R` (zero for the empty set). A covering set `R` is
nonempty. For `r ≥ 2`, all denominators are positive: `[F:ℚ] ≥ 1`, `|discr F| ≥ 1` and
`[F:ℚ](r−1) > 0`.

- The relative norm is nonnegative and additive on products of nonzero polynomials; over `ℚ`
  it agrees with the integer norm under `𝓞 ℚ ≃ ℤ`. Its value on a relative minimal polynomial
  of a generator is the sum over all embeddings of the extension. *Needs:* §1.1 and extension
  of embeddings in finite separable field extensions.
- `relCandidates_finite` holds for every degree and bound; the sets increase with the bound,
  and negative bounds give the empty set. *Needs:* §1.1 `norm_coeff_le_of_complexT2`,
  nonnegativity of each summand and `NumberField.Embeddings.finite_of_norm_le`.
- The bound increases with `D` for `Γ ≥ 0`, `r ≥ 2`, and with the set `R`; replacing `R`
  can change its value. *Needs:* finite real suprema and monotonicity of positive real powers.
- `exists_mem_relCandidates_of_maximal` states the completeness claim on native carriers:
  for number fields `F ⊆ K`, `r=[K:F] ≥ 2`, no intermediate field strictly between them,
  `|discr K| ≤ D`, rank `n−m` admissibility and finite `R` covering `𝓞 F/r𝓞 F`, there exist
  `θ : 𝓞 K` and `P : (𝓞 F)[X]` with `F(θ)=K`, `P(θ)=0`, and
  `P ∈ relCandidates F r (relativeBound F r D Γ R)`. Monicity and degree `r` identify `P`
  as the relative minimal polynomial. *Needs:* relative Hunter, extension of embeddings,
  `minpoly` over the integrally closed ring `𝓞 F`, and the degree formula.

The relative Hunter inequality and projection route use Martinet, corrected author version,
Proposition 2.3, p. 6, Theorem 2.6, p. 7, Theorem 2.8, p. 8, and the residue reduction on p. 9.
Relative candidate finiteness and maximal-subfield completeness are deductions here from that
inequality and §1.1. The discriminant reduction consumes Number Field Arithmetic §§4.1–4.2.

*Needs:* §1.1, §1.3, §2.1; GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3; `TauCeti.relDiscr_tower`,
`TauCeti.NumberField.relDiscr_int_ringOfIntegers`; Mathlib `ZLattice`, `Algebra.trace`,
`IntermediateField`, `NumberField.Embeddings.finite_of_norm_le`.

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

**Checks for the relative norm and candidates.**

- Over `ℚ`, `relT2 (X²+1)=2` and `relCandidates ℚ 2 2` is the nine-element integer set
  of §1.1, after identifying `𝓞 ℚ` with `ℤ`.
- Over any number field, `relT2 1=0`, degree-zero candidates at bound `0` are `{1}`, and
  all relative candidate sets at bound `−1` are empty. The zero polynomial is not monic.
- Over `F=ℚ(√−3)`, `relT2 (X²−(2+ω))=4√7`; it is in the degree-two candidate set at
  bound `4√7`, but not at bound `10`. Each complex image has norm `2√7`, not `4√7`.

**Checks for the representative-dependent bound.**

- For `F=ℚ`, `r=2`, `D=5`, `Γ=1`, `R={0,1}`, the trace term is `1/2` and the quotient
  term is `5/2`, so `relativeBound=3`; the polynomial `X²−X−1` attains it.
- Changing to the equally valid representatives `{0,3}` gives `9/2+5/2=7`; the bound is
  intentionally dependent on the representatives. The relative Hunter element can have trace `3`.
- For `F=ℚ(√−3)`, `r=2`, `D=1008`, `Γ=2/√3`, `R={0,1,ω,1+ω}`, the trace term is
  `3` and the quotient term is `4√7`, so the uniform bound is `3+4√7`. The trace-zero
  generator has norm `4√7`; the element-specific equality does not assert that the uniform
  maximum is zero. The empty set would have trace supremum `0` but fails the covering condition.

### 2.3 The complete list of fields of bounded discriminant

**Definitions.**

```text
canonicalPolys n D := {polredabs K | K a number field, [K : ℚ] = n, |discr K| ≤ D}
hunterImage n D Γ  := {polredabs (ℚ[X]/(P)) | P ∈ hunterCandidates n D Γ, |discr ℚ[X]/(P)| ≤ D}
```

with `ℚ[X]/(P) = AdjoinRoot (P.map (Int.castRingHom ℚ))`, a number field since `P` is monic and
irreducible.

**Theorems.**

- The Hunter image is finite and contained in `canonicalPolys n D`, for every `n`.
- **The complete list in prime degree** (`hunterImage_eq_canonicalPolys_of_prime`): for `n`
  prime and `Γ` admissible in rank `n − 1`, `hunterImage n D Γ = canonicalPolys n D`. Each field
  appears exactly once, by 1.2. This is a plain theorem about two sets of polynomials: the left
  side is a stated finite set, computed by applying `polredabs` to the elements of a finite set of
  polynomials and filtering by the discriminant.
- **The complete list in every degree `n ≥ 2`** (`hunter_relativeImage_eq_canonicalPolys`).
  Choose `Γ_k` admissible for each **positive** rank `1 ≤ k < n` and, for every number field
  `F` and `r ≥ 2`, a finite covering set `R(F,r)` for `𝓞 F/r𝓞 F`. Define
  `relativeImage F r D Γ R` as the canonical polynomials of extensions `K/F` with `[K:F]=r`
  and `|discr K| ≤ D`, generated by an integral root of a polynomial in
  `relCandidates F r (relativeBound F r D Γ R)`. This is a set of integer polynomials, with
  both the evaluation and generation conditions required. Then

  ```text
  canonicalPolys n D = hunterImage n D Γₙ₋₁
      ∪ ⋃ (m ∣ n, 1 < m < n) ⋃ (D' : ℕ, D'^(n/m) ≤ D)
          ⋃ (Q ∈ canonicalPolys m D') relativeImage F_Q (n/m) D Γₙ₋ₘ R(F_Q,n/m)
  ```

  Here `F_Q = AdjoinRoot (Q.map (Int.castRingHom ℚ))`; irreducibility follows from canonical
  membership, and is an explicit witness in the Lean set. The integral condition
  `D'^(n/m) ≤ D` is equivalent to the bound `D' ≤ ⌊D^(m/n)⌋` without real rounding.
  Choose a maximal proper subfield for the forward inclusion and transport it to its canonical
  model; §2.2 supplies a relative generating candidate. For the reverse inclusion, the degree
  formula and discriminant filter suffice. Finiteness follows by strong induction, relative
  candidate finiteness, and uniqueness up to `F`-isomorphism of the field generated by a root
  of each monic irreducible polynomial. No maximality is required for the reverse inclusion.
  *Needs:* §1.2 canonical classification, §2.1 primitive completeness, §2.2 relative completeness
  and discriminant reduction, and the smaller-degree cases of this equality.
- The starting cases are `canonicalPolys 0 D=∅`, `canonicalPolys 1 0=∅`, and
  `canonicalPolys 1 D={X}` when `D ≥ 1`.
- `canonicalPolys_finite`: `canonicalPolys n D` is finite for every `n` (also from Mathlib's
  `NumberField.finite_of_discr_bdd` through `polredabs`).
- **Comparison with the effective count** (`ncard_canonicalPolys_le`): `(canonicalPolys n D).ncard`
  is at most Tau Ceti's bound `(2 · coeffBoundOfDiscrBdd D + 1) ^ (rankOfDiscrBdd D + 1) ·
  rankOfDiscrBdd D` for the subfields of `ℂ` of discriminant `≤ D`: sending a canonical polynomial
  to the subfield of `ℂ` generated by one of its roots is injective, since distinct canonical
  polynomials define non-isomorphic fields. The count bounds the number of fields; the list
  identifies them.
- **The prefix version** (`prefix_characterization`): for every `d, r, D : ℕ`, the set
  `{polredabs K | HasLMFDBIntrinsicLabel K d r D}` equals the subset of `canonicalPolys d D`
  consisting of polynomials `Q` with `(Q.map (Int.castRingHom ℝ)).roots.card = r` and
  `(discr (AdjoinRoot (Q.map (Int.castRingHom ℚ)))).natAbs = D`.
  Canonical membership supplies irreducibility over `ℚ`, the explicit witness used to form
  the quotient field. This is the **field** discriminant; `Q.discr` may differ by an index
  square. Separability identifies real-root multiplicity with the number of real embeddings,
  and §1.2 identifies the quotient field with the field represented by `Q`, proving both
  inclusions. The set is finite; for prime `d` and `Γ` admissible in rank `d−1`, it is also
  the subset of `hunterImage d D Γ` cut out by these same two conditions.
  These are deductions from §1.2, the complete-list theorem and Number Field Arithmetic §8.1
  (LMFDB, knowls nf.label and nf.discriminant, definitions of the intrinsic coordinates).
  *Needs:* §1.2 canonical membership and quotient-field comparison, §2.3 canonical finiteness
  and prime-degree equality, Number Field Arithmetic §8.1, Mathlib `AdjoinRoot.equiv`,
  `NumberField.InfinitePlace.card_real_embeddings`, and separability in characteristic zero.

*Needs:* 1.2, 2.1, 2.2; Number Field Arithmetic 8.1
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
- (prefix filters) prefix `2.2.5` gives `{X²−X−1}`, prefix `2.0.4` gives `{X²+1}`,
  and prefix `2.1.5` gives the empty set: a quadratic field has either two or zero real roots.
- (field discriminant) `Q=X³−X²+2X+8` has one real root and polynomial discriminant
  `−2012=2²·(−503)`; its field has discriminant `−503`, so it belongs to prefix `3.1.503`.
  Filtering by `Q.discr.natAbs=503` would incorrectly discard it.
- (admissibility) for `d=2`, `D=5`, `Γ=0`, the Hunter bound is `1/2` and the Hunter image
  is empty, while prefix `2.2.5` contains `X²−X−1` of norm `3`. The rank-one matrix `(1)`
  has minimum `1>0`, excluding `Γ=0` from the prime-degree corollary.

**API for the three images.** Canonical sets increase with `D`. The absolute and relative
images are invariant under isomorphism of the presented extension, are finite, and lie in the
canonical set of the corresponding absolute degree. For fixed base, candidates and bounds,
there is at most one output for each relative polynomial admitting a generating root in the
specified degree. *Needs:* §1.2 classification, §2.1–§2.2 candidate finiteness and the degree formula.

**Checks.**

- `canonicalPolys 0 D=∅`, `canonicalPolys 1 0=∅`, and `canonicalPolys 1 1={X}`:
  the zero ring is not a number field, and the degree-one field has discriminant `1`.
- `hunterImage 2 0 1=∅`, whereas `hunterImage 2 8 1` contains exactly the six displayed
  quadratics; eleven input polynomials produce six canonical outputs.
- `hunterImage 4 1008 (4/3)` omits the two quartics of prefix `4.0.1008` despite their
  membership in `canonicalPolys 4 1008`, so the absolute image is not complete in all degrees.
- `relativeImage ℚ 2 5 1 {0,1}` contains the canonical polynomial `X²−X−1` with norm `3`.
  At discriminant bound `0` every relative image is empty, even if a candidate polynomial exists.
- Over `ℚ(√−3)`, the degree-two relative image with `D=1008`, `Γ=2/√3` and
  `R={0,1,ω,1+ω}` contains the quartics `X⁴∓5X²+7`. Their roots satisfy the relative
  norm bound `4√7 ≤ 3+4√7`. A scalar root `θ∈F` cannot qualify: it generates degree `1`, not `2`.
- In the composite equality at `n=4`, the Hermite ranks required are exactly `1,2,3`; the
  relative step over a quadratic field uses rank `2`. In rank `0`, the empty Gram matrix has
  determinant `1` and only the zero integer vector, so no admissible constant exists.

### Examples

The degree-two list at bound `8` has six canonical elements from eleven Hunter candidates.
In degree four at bound `1008`, the two fields with canonical polynomials `X⁴∓5X²+7` require
the relative step over `ℚ(√−3)`; the rank-two relative bound is `4√7`.

### Dependencies

Section 2.1 uses §1.1–§1.3 and Number Field Arithmetic §3.3. Section 2.2 uses §1.1's complex
coefficient bound, §1.3's projection method, §2.1 and Number Field Arithmetic §§4.1–4.2.
Section 2.3 uses §1.2, §2.1–§2.2 and induction on smaller degrees; its count comparison uses
Effective Bounds Layer 2 and its prefix corollary uses Number Field Arithmetic §8.1.
The list equalities are deductions from these inputs, not theorems quoted from a database article
(Jones–Roberts, arXiv:1404.0266v1, §3, concerns database completeness criteria).

## Worked examples (acceptance criteria)

The examples specify values and distinguish the polynomial, field and relative-extension bounds.

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

## Downstream consumers

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
  de Théorie des Nombres, Paris 1983–84, Progr. Math. 59, Birkhäuser 1985, 147–179. Use the corrected author version, §1 p. 3 (Hermite constants), Proposition 2.3
  p. 6, Theorem 2.6 p. 7, Theorem 2.8 and Corollary 2.9 p. 8, and trace reduction p. 9;
  its page numbers differ from the published pagination. (1.3, 2.2)
- **M. Pohst**, *On the computation of number fields of small discriminants including the minimum
  discriminants of sixth degree fields*, J. Number Theory 14 (1982), 99–117. §§2–3: Hunter's
  theorem and its relative form in practice. (1.3, 2.2)
- **J. W. Jones, D. P. Roberts**, *A database of number fields*, LMS J. Comput. Math. 17 (2014),
  595–618; arXiv:1404.0266v1, §3 (database completeness background). (2.3)
- **C. Hermite**, *Extraits de lettres de M. Ch. Hermite à M. Jacobi sur différents objets de la
  théorie des nombres*, J. Reine Angew. Math. 40 (1850), 261–315. Hermite's inequality, the source
  of Hermite bounds (historical background to 1.3; the examples use the Martinet table).
- **G. H. Hardy, J. E. Littlewood, G. Pólya**, *Inequalities*, 2nd ed., Cambridge 1952, Ch. II.
  Symmetric-mean inequalities (background to 1.1; the averaging proof route is specified there).
- **The LMFDB Collaboration**, knowls nf.polredabs (canonical ordering), nf.label (prefix and quartic example),
  and nf.discriminant (integral-basis discriminant). (1.2, 2.3)
- **The PARI Group**, *PARI/GP User's Guide*, `polredabs`. (1.2)
