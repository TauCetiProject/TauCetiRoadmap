import Mathlib
import TauCeti.NumberTheory.NumberField.Index.Basic
import TauCeti.NumberTheory.NumberField.IntrinsicLabel
import TauCeti.NumberTheory.NumberField.Discriminant.Relative
import TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic

/-!
# Number fields of bounded discriminant: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
`T₂` norm and its candidate sets, the polredabs key and the canonical defining polynomial,
Hunter's theorem and its relative form, the Hunter candidate sets, and the complete lists of
canonical polynomials. The other targets (the relative candidate sets of 2.2 and the
composite-degree list of 2.3), with their definitions and Checks, are specified in `README.md`
only. Every `def` has its real body; the theorems are targets and are proved by `sorry`, which
this human-owned repository permits.

Three conventions are visible in the signatures. A number field is a type `K` with
`[Field K] [NumberField K]`, and its defining polynomials are the integer minimal polynomials of
Tau Ceti's `TauCeti.NumberField.IntegralPrimitiveElement K`. `t2 P` is the sum of `‖α‖ ^ 2` over
the complex roots of `P` with multiplicity, never the power sum `∑ α ^ 2`. The polredabs key is
`toLex (t2 P, toLex (|disc P|, S P))`, so the canonical polynomial minimizes `T₂` first, then
`|disc P|`, then `S P` lexicographically.

Hermite's constant is not declared here. Every theorem that needs it takes a real `Γ` with the
hypothesis that it bounds the Hermite invariant in the relevant rank, written out over Mathlib's
`Matrix.PosDef`: every positive definite real symmetric `m × m` matrix `A` has a nonzero integer
vector `x` with `x ⬝ᵥ A *ᵥ x ≤ Γ * (det A) ^ (1 / m)`. That hypothesis says `γ_m ≤ Γ`.

The exceptions to "every proof is `sorry`" are the bridge checks: `admissible_rank_one` (the
rank-one admissible constant `Γ = 1`) and `discr_pow_finrank_dvd_discr` (the subfield
discriminant divisibility, through Tau Ceti's `relDiscr_tower` and
`relDiscr_int_ringOfIntegers`) are proved. `polredabs` is a choice: the minimum of the key when
one exists, which `polredabs_mem` asserts always.
-/

namespace TauCetiRoadmap.NumberFieldEnumeration

open Polynomial NumberField Matrix

/-! ## Layer 1: `T₂`, the canonical polynomial and Hunter's theorem -/

/-- `README.md`, Layer 1, 1.1. The `T₂` norm of an integer polynomial: the sum of the squared
absolute values of its complex roots, with multiplicity. -/
noncomputable def t2 (P : ℤ[X]) : ℝ :=
  ((P.map (Int.castRingHom ℂ)).roots.map (fun α : ℂ => ‖α‖ ^ 2)).sum

/-- `README.md`, Layer 1, 1.1. `T₂` is nonnegative. -/
theorem t2_nonneg (P : ℤ[X]) : 0 ≤ t2 P := by
  sorry

/-- `README.md`, Layer 1, 1.1. Monic polynomials of degree `n` with bounded `T₂`. -/
def candidates (n : ℕ) (B : ℝ) : Set ℤ[X] := {P | P.Monic ∧ P.natDegree = n ∧ t2 P ≤ B}

/-- `README.md`, Layer 1, 1.1. The coefficient bound behind finiteness:
`|a_k| ≤ C(n,k) (T₂/n)^{k/2}` for `P = Xⁿ + a₁ Xⁿ⁻¹ + … + aₙ`. -/
theorem abs_coeff_le_of_t2 {P : ℤ[X]} (hP : P.Monic) {n : ℕ} (hn : P.natDegree = n)
    (hpos : 0 < n) (k : ℕ) (hk : k ≤ n) :
    (|P.coeff (n - k)| : ℝ) ≤ (n.choose k : ℝ) * (t2 P / n) ^ ((k : ℝ) / 2) := by
  sorry

/-- `README.md`, Layer 1, 1.1. The candidate set is finite. -/
theorem candidates_finite (n : ℕ) (B : ℝ) : (candidates n B).Finite := by
  sorry

/-- `README.md`, Layer 1, 1.1. For an algebraic integer `θ` of `K`, the sum of `‖σ θ‖ ^ 2` over
the embeddings of `K` is `[K : ℚ(θ)]` times `T₂` of its minimal polynomial. -/
theorem sum_norm_sq_eq_t2_minpoly (K : Type*) [Field K] [NumberField K] (θ : 𝓞 K) :
    ∑ σ : K →+* ℂ, ‖σ θ‖ ^ 2 =
      (Module.finrank ℚ K / (minpoly ℤ θ).natDegree : ℝ) * t2 (minpoly ℤ θ) := by
  sorry

/-- `README.md`, Layer 1, 1.2. The sign-interleaved coefficient vector
`S(P) = (|a₁|, a₁, …, |aₙ|, aₙ)` of `P = Xⁿ + a₁ Xⁿ⁻¹ + … + aₙ`. -/
def signVector (P : ℤ[X]) : List ℤ :=
  (List.range P.natDegree).flatMap fun i =>
    [|P.coeff (P.natDegree - (i + 1))|, P.coeff (P.natDegree - (i + 1))]

/-- `README.md`, Layer 1, 1.2. The polredabs key: minimal `T₂`, then minimal `|disc|`, then
lexicographically least `S(P)`, the rule of the LMFDB knowl `nf.polredabs`. -/
noncomputable def polredabsKey (P : ℤ[X]) : Lex (ℝ × Lex (ℕ × List ℤ)) :=
  toLex (t2 P, toLex ((P.discr).natAbs, signVector P))

/-- `README.md`, Layer 1, 1.2. The key determines a monic polynomial of given degree. -/
theorem polredabsKey_injective_of_natDegree_eq {P Q : ℤ[X]} (hP : P.Monic) (hQ : Q.Monic)
    (hdeg : P.natDegree = Q.natDegree) (h : polredabsKey P = polredabsKey Q) : P = Q := by
  sorry

/-- `README.md`, Layer 1, 1.2. The defining polynomials of `K`: the integer minimal polynomials
of its integral primitive elements. -/
def definingPolys (K : Type*) [Field K] [NumberField K] : Set ℤ[X] :=
  Set.range fun θ : TauCeti.NumberField.IntegralPrimitiveElement K => minpoly ℤ θ.1

/-- `README.md`, Layer 1, 1.2. A defining polynomial is monic, irreducible, of degree `[K : ℚ]`. -/
theorem monic_irreducible_natDegree_of_mem_definingPolys {K : Type*} [Field K] [NumberField K]
    {P : ℤ[X]} (hP : P ∈ definingPolys K) :
    P.Monic ∧ Irreducible P ∧ P.natDegree = Module.finrank ℚ K := by
  sorry

/-- `README.md`, Layer 1, 1.2. Defining polynomials are exactly the monic integer polynomials with
a root generating `K`. -/
theorem mem_definingPolys_iff {K : Type*} [Field K] [NumberField K] {P : ℤ[X]} :
    P ∈ definingPolys K ↔ P.Monic ∧ P.natDegree = Module.finrank ℚ K ∧
      ∃ θ : K, aeval θ P = 0 ∧ Algebra.adjoin ℚ {θ} = ⊤ := by
  sorry

open scoped Classical in
/-- `README.md`, Layer 1, 1.2. The canonical defining polynomial of `K`: the
`polredabsKey`-minimum of `definingPolys K`, which is unique because the key is injective in
fixed degree. The junk value `0` is never taken: the minimum exists (`polredabs_mem`). -/
noncomputable def polredabs (K : Type*) [Field K] [NumberField K] : ℤ[X] :=
  if h : ∃ P ∈ definingPolys K, ∀ Q ∈ definingPolys K, polredabsKey P ≤ polredabsKey Q then
    h.choose
  else 0

/-- `README.md`, Layer 1, 1.2. The canonical polynomial defines `K`. -/
theorem polredabs_mem (K : Type*) [Field K] [NumberField K] : polredabs K ∈ definingPolys K := by
  sorry

/-- `README.md`, Layer 1, 1.2. Minimality for the key. -/
theorem polredabsKey_polredabs_le (K : Type*) [Field K] [NumberField K] :
    ∀ P ∈ definingPolys K, polredabsKey (polredabs K) ≤ polredabsKey P := by
  sorry

/-- `README.md`, Layer 1, 1.2. The canonical polynomial is an isomorphism invariant. -/
theorem polredabs_eq_of_algEquiv {K K' : Type*} [Field K] [NumberField K] [Field K']
    [NumberField K'] (φ : K ≃ₐ[ℚ] K') : polredabs K = polredabs K' := by
  sorry

/-- `README.md`, Layer 1, 1.2. Equal canonical polynomials give isomorphic fields. -/
theorem nonempty_algEquiv_of_polredabs_eq {K K' : Type*} [Field K] [NumberField K] [Field K']
    [NumberField K'] (h : polredabs K = polredabs K') : Nonempty (K ≃ₐ[ℚ] K') := by
  sorry

/-- `README.md`, Layer 1, 1.2. The field `ℚ[X]/(P)` of a defining polynomial is `K`. -/
theorem nonempty_algEquiv_adjoinRoot {K : Type*} [Field K] [NumberField K] {P : ℤ[X]}
    (hP : P ∈ definingPolys K) (h : Irreducible (P.map (Int.castRingHom ℚ))) :
    haveI : Fact (Irreducible (P.map (Int.castRingHom ℚ))) := ⟨h⟩
    Nonempty (AdjoinRoot (P.map (Int.castRingHom ℚ)) ≃ₐ[ℚ] K) := by
  sorry

/-- `README.md`, Layer 1, 1.3. **Hunter's theorem.** If `Γ` bounds Hermite's constant in rank
`n - 1` (the hypothesis `hΓ`, written out), a number field of degree `n ≥ 2` has a non-rational
algebraic integer `θ` with `0 ≤ Tr θ ≤ n / 2` and
`∑_σ ‖σ θ‖² ≤ (Tr θ)² / n + Γ (|discr K| / n) ^ (1 / (n - 1))`. -/
theorem hunter (K : Type*) [Field K] [NumberField K] (hn : 2 ≤ Module.finrank ℚ K) {Γ : ℝ}
    (hΓ : ∀ A : Matrix (Fin (Module.finrank ℚ K - 1)) (Fin (Module.finrank ℚ K - 1)) ℝ,
      A.PosDef → ∃ x : Fin (Module.finrank ℚ K - 1) → ℤ, x ≠ 0 ∧
        (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤
          Γ * A.det ^ (1 / ((Module.finrank ℚ K : ℝ) - 1))) :
    ∃ θ : 𝓞 K, (θ : K) ∉ Set.range (algebraMap ℚ K) ∧
      0 ≤ Algebra.trace ℚ K (θ : K) ∧
      Algebra.trace ℚ K (θ : K) ≤ (Module.finrank ℚ K : ℚ) / 2 ∧
      ∑ σ : K →+* ℂ, ‖σ θ‖ ^ 2 ≤
        (Algebra.trace ℚ K (θ : K) : ℝ) ^ 2 / Module.finrank ℚ K +
          Γ * ((|discr K| : ℝ) / Module.finrank ℚ K) ^ (1 / ((Module.finrank ℚ K : ℝ) - 1)) := by
  sorry

/-- `README.md`, Layer 1, 1.3. The rank-one admissible constant: `Γ = 1` bounds Hermite's
constant in rank one. A bridge check, proved: it is the hypothesis of `hunter` for quadratic
fields. -/
theorem admissible_rank_one :
    ∀ A : Matrix (Fin 1) (Fin 1) ℝ, A.PosDef → ∃ x : Fin 1 → ℤ, x ≠ 0 ∧
      (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤ 1 * A.det ^ (1 / (1 : ℝ)) := by
  intro A _
  refine ⟨fun _ => 1, fun h => by simpa using congrFun h 0, ?_⟩
  simp [Matrix.det_unique, dotProduct, Matrix.mulVec]

/-! ## Layer 2: complete lists of number fields -/

/-- `README.md`, Layer 2, 2.1. Hunter's bound on `T₂` for degree `n` and `|discr| ≤ D`,
maximized over the integer traces `0 ≤ Tr θ ≤ ⌊n / 2⌋`. -/
noncomputable def hunterBound (n D : ℕ) (Γ : ℝ) : ℝ :=
  ((n / 2 : ℕ) : ℝ) ^ 2 / n + Γ * ((D : ℝ) / n) ^ (1 / ((n : ℝ) - 1))

/-- `README.md`, Layer 2, 2.1. The Hunter candidates: monic irreducible integer polynomials of
degree `n` with `T₂` at most Hunter's bound whose discriminant is a square times some `D' ≤ D`. -/
def hunterCandidates (n D : ℕ) (Γ : ℝ) : Set ℤ[X] :=
  {P | P ∈ candidates n (hunterBound n D Γ) ∧ Irreducible P ∧
    ∃ f D' : ℕ, D' ≤ D ∧ P.discr.natAbs = f ^ 2 * D'}

/-- `README.md`, Layer 2, 2.1. -/
theorem hunterCandidates_finite (n D : ℕ) (Γ : ℝ) : (hunterCandidates n D Γ).Finite := by
  sorry

/-- `README.md`, Layer 2, 2.1. **Completeness in prime degree**: a field of prime degree `n` and
`|discr| ≤ D` has a defining polynomial among the Hunter candidates. -/
theorem exists_mem_hunterCandidates_of_prime (K : Type*) [Field K] [NumberField K]
    (hp : (Module.finrank ℚ K).Prime) (D : ℕ) (hD : |discr K| ≤ D) {Γ : ℝ}
    (hΓ : ∀ A : Matrix (Fin (Module.finrank ℚ K - 1)) (Fin (Module.finrank ℚ K - 1)) ℝ,
      A.PosDef → ∃ x : Fin (Module.finrank ℚ K - 1) → ℤ, x ≠ 0 ∧
        (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤
          Γ * A.det ^ (1 / ((Module.finrank ℚ K : ℝ) - 1))) :
    ∃ P ∈ hunterCandidates (Module.finrank ℚ K) D Γ, P ∈ definingPolys K := by
  sorry

/-- `README.md`, Layer 2, 2.1. The same conclusion for every **primitive** field (no
intermediate field other than `⊥` and `⊤`), of any degree. -/
theorem exists_mem_hunterCandidates_of_primitive (K : Type*) [Field K] [NumberField K]
    (hn : 2 ≤ Module.finrank ℚ K) (hprim : ∀ F : IntermediateField ℚ K, F = ⊥ ∨ F = ⊤)
    (D : ℕ) (hD : |discr K| ≤ D) {Γ : ℝ}
    (hΓ : ∀ A : Matrix (Fin (Module.finrank ℚ K - 1)) (Fin (Module.finrank ℚ K - 1)) ℝ,
      A.PosDef → ∃ x : Fin (Module.finrank ℚ K - 1) → ℤ, x ≠ 0 ∧
        (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤
          Γ * A.det ^ (1 / ((Module.finrank ℚ K : ℝ) - 1))) :
    ∃ P ∈ hunterCandidates (Module.finrank ℚ K) D Γ, P ∈ definingPolys K := by
  sorry

/-- `README.md`, Layer 2, 2.2. **The subfield reduction**: `discr F ^ [K : F]` divides
`discr K`. A bridge check, proved from Tau Ceti's tower formula for the relative discriminant
over `ℤ`. -/
theorem discr_pow_finrank_dvd_discr (F K : Type*) [Field F] [NumberField F] [Field K]
    [NumberField K] [Algebra F K] :
    discr F ^ Module.finrank F K ∣ discr K := by
  have h := TauCeti.relDiscr_tower (A := ℤ) (B := 𝓞 F) (C := 𝓞 K)
  rw [TauCeti.NumberField.relDiscr_int_ringOfIntegers,
    TauCeti.NumberField.relDiscr_int_ringOfIntegers,
    ← IsFractionRing.finrank_eq (𝓞 F) F (𝓞 K) K, Ideal.span_singleton_pow] at h
  rw [← Ideal.span_singleton_dvd_span_singleton_iff_dvd, h]
  exact dvd_mul_right _ _

/-- `README.md`, Layer 2, 2.2. The dichotomy behind the composite-degree reduction: either some
Hunter candidate defines `K`, or the Hunter element generates an intermediate field `F` with
`1 < [F : ℚ] < [K : ℚ]`, and then `|discr F| ^ [K : F] ≤ D`. -/
theorem exists_mem_hunterCandidates_or_subfield (K : Type*) [Field K] [NumberField K]
    (hn : 2 ≤ Module.finrank ℚ K) (D : ℕ) (hD : |discr K| ≤ D) {Γ : ℝ}
    (hΓ : ∀ A : Matrix (Fin (Module.finrank ℚ K - 1)) (Fin (Module.finrank ℚ K - 1)) ℝ,
      A.PosDef → ∃ x : Fin (Module.finrank ℚ K - 1) → ℤ, x ≠ 0 ∧
        (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤
          Γ * A.det ^ (1 / ((Module.finrank ℚ K : ℝ) - 1))) :
    (∃ P ∈ hunterCandidates (Module.finrank ℚ K) D Γ, P ∈ definingPolys K) ∨
      ∃ F : IntermediateField ℚ K, 1 < Module.finrank ℚ F ∧
        Module.finrank ℚ F < Module.finrank ℚ K ∧ |discr F| ^ Module.finrank F K ≤ D := by
  sorry

/-- `README.md`, Layer 2, 2.2. **The relative Hunter theorem** (Martinet). For `K ⊃ F` with
`m' = [K : F] ≥ 2`, `m = [F : ℚ]`, `n = [K : ℚ]`, `Γ` bounding Hermite's constant in rank
`n - m`, and `R` a set of representatives of `𝓞 F / m' 𝓞 F`, there is `θ ∈ 𝓞 K ∖ F` with
`Tr_{K/F} θ ∈ R` and
`∑_σ ‖σ θ‖² ≤ (1/m') ∑_τ ‖τ (Tr_{K/F} θ)‖² + Γ (|discr K| / (m'^m |discr F|)) ^ (1/(n - m))`. -/
theorem hunter_relative (F K : Type*) [Field F] [NumberField F] [Field K] [NumberField K]
    [Algebra F K] (hm : 2 ≤ Module.finrank F K) {Γ : ℝ}
    (hΓ : ∀ A : Matrix (Fin (Module.finrank ℚ K - Module.finrank ℚ F))
        (Fin (Module.finrank ℚ K - Module.finrank ℚ F)) ℝ,
      A.PosDef → ∃ x : Fin (Module.finrank ℚ K - Module.finrank ℚ F) → ℤ, x ≠ 0 ∧
        (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤
          Γ * A.det ^ (1 / ((Module.finrank ℚ K : ℝ) - Module.finrank ℚ F)))
    (R : Finset (𝓞 F))
    (hR : ∀ a : 𝓞 F, ∃ r ∈ R, a - r ∈ Ideal.span {(Module.finrank F K : 𝓞 F)}) :
    ∃ θ : 𝓞 K, (θ : K) ∉ Set.range (algebraMap F K) ∧
      (∃ r ∈ R, Algebra.trace F K (θ : K) = (r : F)) ∧
      ∑ σ : K →+* ℂ, ‖σ θ‖ ^ 2 ≤
        (1 / Module.finrank F K : ℝ) * ∑ τ : F →+* ℂ, ‖τ (Algebra.trace F K (θ : K))‖ ^ 2 +
          Γ * ((|discr K| : ℝ) /
              ((Module.finrank F K : ℝ) ^ Module.finrank ℚ F * (|discr F| : ℝ))) ^
            (1 / ((Module.finrank ℚ K : ℝ) - Module.finrank ℚ F)) := by
  sorry

/-- `README.md`, Layer 2, 2.3. The canonical polynomials of the number fields of degree `n` and
`|discr| ≤ D`. Every number field has a model in `Type`, so the universe is no restriction. -/
def canonicalPolys (n D : ℕ) : Set ℤ[X] :=
  {Q | ∃ (K : Type) (_ : Field K) (_ : NumberField K),
    Module.finrank ℚ K = n ∧ |discr K| ≤ D ∧ polredabs K = Q}

/-- `README.md`, Layer 2, 2.3. The polredabs image of the Hunter candidates: the canonical
polynomials of the fields `ℚ[X]/(P)`, `P` a Hunter candidate, with `|discr| ≤ D`. -/
def hunterImage (n D : ℕ) (Γ : ℝ) : Set ℤ[X] :=
  {Q | ∃ P ∈ hunterCandidates n D Γ, ∃ h : Irreducible (P.map (Int.castRingHom ℚ)),
    haveI : Fact (Irreducible (P.map (Int.castRingHom ℚ))) := ⟨h⟩
    |discr (AdjoinRoot (P.map (Int.castRingHom ℚ)))| ≤ D ∧
      polredabs (AdjoinRoot (P.map (Int.castRingHom ℚ))) = Q}

/-- `README.md`, Layer 2, 2.3. The polredabs image is a finite set. -/
theorem hunterImage_finite (n D : ℕ) (Γ : ℝ) : (hunterImage n D Γ).Finite := by
  sorry

/-- `README.md`, Layer 2, 2.3. Every polynomial of the polredabs image is the canonical
polynomial of a field of degree `n` and `|discr| ≤ D`. -/
theorem hunterImage_subset_canonicalPolys (n D : ℕ) (Γ : ℝ) :
    hunterImage n D Γ ⊆ canonicalPolys n D := by
  sorry

/-- `README.md`, Layer 2, 2.3. **The complete list in prime degree**: the polredabs image of the
Hunter candidates is exactly the set of canonical polynomials of fields of degree `n` and
`|discr| ≤ D`. -/
theorem hunterImage_eq_canonicalPolys_of_prime {n : ℕ} (hn : n.Prime) (D : ℕ) {Γ : ℝ}
    (hΓ : ∀ A : Matrix (Fin (n - 1)) (Fin (n - 1)) ℝ, A.PosDef →
      ∃ x : Fin (n - 1) → ℤ, x ≠ 0 ∧
        (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤ Γ * A.det ^ (1 / ((n : ℝ) - 1))) :
    hunterImage n D Γ = canonicalPolys n D := by
  sorry

/-- `README.md`, Layer 2, 2.3. The canonical polynomials of fields of degree `n` and
`|discr| ≤ D` form a finite set, for every `n`. -/
theorem canonicalPolys_finite (n D : ℕ) : (canonicalPolys n D).Finite := by
  sorry

/-- `README.md`, Layer 2, 2.3. Comparison with Tau Ceti's effective Hermite–Minkowski count: the
number of fields of degree `n` and `|discr| ≤ D`, up to isomorphism, is at most the count
`NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` gives for subfields of `ℂ`. -/
theorem ncard_canonicalPolys_le (n D : ℕ) :
    (canonicalPolys n D).ncard ≤
      (2 * NumberField.coeffBoundOfDiscrBdd D + 1) ^
          (NumberField.hermiteTheorem.rankOfDiscrBdd D + 1) *
        NumberField.hermiteTheorem.rankOfDiscrBdd D := by
  sorry

/-- `README.md`, Layer 2, 2.3. The canonical polynomials of the fields with LMFDB prefix
`d.r.D` (Tau Ceti's `HasLMFDBIntrinsicLabel`) lie in `canonicalPolys d D`, hence form a finite
set by `canonicalPolys_finite`. -/
theorem setOf_hasLMFDBIntrinsicLabel_subset (d r D : ℕ) :
    {Q : ℤ[X] | ∃ (K : Type) (_ : Field K) (_ : NumberField K),
      TauCeti.NumberField.HasLMFDBIntrinsicLabel K d r D ∧ polredabs K = Q} ⊆
      canonicalPolys d D := by
  sorry

end TauCetiRoadmap.NumberFieldEnumeration
