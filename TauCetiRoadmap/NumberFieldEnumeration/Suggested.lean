module

public import Mathlib
public import TauCeti.NumberTheory.NumberField.Index.Basic
public import TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic

/-!
# Number fields of bounded discriminant: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs: complex coefficient bounds and finite
candidate sets, canonical defining polynomials and their classification property, absolute and
relative Hunter bounds, relative completeness, and complete canonical lists in every degree.
All these headlines are statable at the pins. Relative polynomials use `(𝓞 F)[X]`; their images
are described by integral generating roots in number fields, without a new tower carrier.

The root norm sums squared absolute values with multiplicity. The canonical polynomial minimizes
that norm, then absolute discriminant, then the sign-interleaved coefficient list. Hermite bounds
are explicit hypotheses on positive definite matrices of positive rank. The composite equality
uses any chosen finite covering sets of residue classes, with their covering property explicit.
-/

public section

namespace TauCetiRoadmap.NumberFieldEnumeration

open Polynomial NumberField Matrix

/-! ## Layer 1: `T₂`, the canonical polynomial and Hunter's theorem -/

/-- The sum of the squared norms of all complex roots, counted with multiplicity. -/
noncomputable def complexT2 (P : ℂ[X]) : ℝ :=
  (P.roots.map (fun z : ℂ => ‖z‖ ^ 2)).sum

/-- For a monic complex polynomial of positive degree, each coefficient is bounded by
its root norm and the corresponding binomial coefficient. -/
theorem norm_coeff_le_of_complexT2 {P : ℂ[X]} (hP : P.Monic) {n : ℕ}
    (hn : P.natDegree = n) (hpos : 0 < n) (k : ℕ) (hk : k ≤ n) :
    ‖P.coeff (n - k)‖ ≤ (n.choose k : ℝ) * (complexT2 P / n) ^ ((k : ℝ) / 2) := by
  sorry

/-- `README.md`, Layer 1, 1.1. The `T₂` norm of an integer polynomial: the sum of the squared
absolute values of its complex roots, with multiplicity. -/
noncomputable def t2 (P : ℤ[X]) : ℝ :=
  complexT2 (P.map (Int.castRingHom ℂ))

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

/-- `README.md`, Layer 1, 1.2. The sign-interleaved coefficient vector
`S(P) = (|a₁|, a₁, …, |aₙ|, aₙ)` of `P = Xⁿ + a₁ Xⁿ⁻¹ + … + aₙ`. -/
def signVector (P : ℤ[X]) : List ℤ :=
  (List.range P.natDegree).flatMap fun i =>
    [|P.coeff (P.natDegree - (i + 1))|, P.coeff (P.natDegree - (i + 1))]

/-- `README.md`, Layer 1, 1.2. The polredabs key: minimal `T₂`, then minimal `|disc|`, then
lexicographically least `S(P)`, the rule of the LMFDB knowl `nf.polredabs`. -/
noncomputable def polredabsKey (P : ℤ[X]) : Lex (ℝ × Lex (ℕ × List ℤ)) :=
  toLex (t2 P, toLex ((P.discr).natAbs, signVector P))

/-- `README.md`, Layer 1, 1.2. The defining polynomials of `K`: the integer minimal polynomials
of its integral primitive elements. -/
def definingPolys (K : Type*) [Field K] [NumberField K] : Set ℤ[X] :=
  Set.range fun θ : TauCeti.NumberField.IntegralPrimitiveElement K => minpoly ℤ θ.1

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

/-- The relative root norm sums the complex polynomial norms over all embeddings of the base. -/
noncomputable def relT2 (F : Type*) [Field F] [NumberField F] (P : (𝓞 F)[X]) : ℝ :=
  ∑ τ : F →+* ℂ, complexT2 (P.map (τ.comp (algebraMap (𝓞 F) F)))

/-- Monic polynomials over the integers of the base field, of fixed degree and bounded root norm. -/
def relCandidates (F : Type*) [Field F] [NumberField F] (r : ℕ) (B : ℝ) : Set (𝓞 F)[X] :=
  {P | P.Monic ∧ P.natDegree = r ∧ relT2 F P ≤ B}

/-- Bounded relative root norm leaves only finitely many monic polynomials of fixed degree. -/
theorem relCandidates_finite (F : Type*) [Field F] [NumberField F] (r : ℕ) (B : ℝ) :
    (relCandidates F r B).Finite := by
  sorry

/-- The relative Hunter bound, maximized over a finite covering set of trace residues.
The real supremum of the empty set is zero; completeness only uses covering sets, which are
nonempty, and relative degrees at least two. -/
noncomputable def relativeBound (F : Type*) [Field F] [NumberField F]
    (r D : ℕ) (Γ : ℝ) (R : Finset (𝓞 F)) : ℝ :=
  sSup ((fun a : 𝓞 F => (1 / r : ℝ) * ∑ τ : F →+* ℂ, ‖τ a‖ ^ 2) '' (R : Set (𝓞 F))) +
    Γ * ((D : ℝ) / ((r : ℝ) ^ Module.finrank ℚ F * (|discr F| : ℝ))) ^
      (1 / ((Module.finrank ℚ F : ℝ) * ((r : ℝ) - 1)))

/-- A primitive extension of number fields has an integral generating root whose relative
minimal polynomial lies in the relative Hunter candidate set. -/
theorem exists_mem_relCandidates_of_maximal (F K : Type*) [Field F] [NumberField F]
    [Field K] [NumberField K] [Algebra F K]
    (hr : 2 ≤ Module.finrank F K)
    (hmax : ∀ E : IntermediateField F K, E = ⊥ ∨ E = ⊤)
    (D : ℕ) (hD : |discr K| ≤ D) (Γ : ℝ)
    (hΓ : ∀ A : Matrix (Fin (Module.finrank ℚ K - Module.finrank ℚ F))
        (Fin (Module.finrank ℚ K - Module.finrank ℚ F)) ℝ,
      A.PosDef → ∃ x : Fin (Module.finrank ℚ K - Module.finrank ℚ F) → ℤ, x ≠ 0 ∧
        (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤
          Γ * A.det ^ (1 / ((Module.finrank ℚ K : ℝ) - Module.finrank ℚ F)))
    (R : Finset (𝓞 F))
    (hR : ∀ a : 𝓞 F, ∃ b ∈ R, a - b ∈ Ideal.span {(Module.finrank F K : 𝓞 F)}) :
    ∃ (θ : 𝓞 K) (P : (𝓞 F)[X]),
      IntermediateField.adjoin F {(θ : K)} = ⊤ ∧ aeval (θ : K) P = 0 ∧
      P ∈ relCandidates F (Module.finrank F K)
        (relativeBound F (Module.finrank F K) D Γ R) := by
  sorry

/-- Canonical polynomials of degree-r extensions of F generated by integral roots of the
bounded relative candidates, with the absolute field discriminant checked. -/
def relativeImage (F : Type) [Field F] [NumberField F]
    (r D : ℕ) (Γ : ℝ) (R : Finset (𝓞 F)) : Set ℤ[X] :=
  {Q | ∃ (K : Type) (_ : Field K) (_ : NumberField K) (_ : Algebra F K),
    Module.finrank F K = r ∧ |discr K| ≤ D ∧ polredabs K = Q ∧
    ∃ (θ : 𝓞 K) (P : (𝓞 F)[X]),
      P ∈ relCandidates F r (relativeBound F r D Γ R) ∧
      aeval (θ : K) P = 0 ∧ IntermediateField.adjoin F {(θ : K)} = ⊤}

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

/-- `README.md`, Layer 2, 2.3. **The complete list in prime degree**: the polredabs image of the
Hunter candidates is exactly the set of canonical polynomials of fields of degree `n` and
`|discr| ≤ D`. -/
theorem hunterImage_eq_canonicalPolys_of_prime {n : ℕ} (hn : n.Prime) (D : ℕ) {Γ : ℝ}
    (hΓ : ∀ A : Matrix (Fin (n - 1)) (Fin (n - 1)) ℝ, A.PosDef →
      ∃ x : Fin (n - 1) → ℤ, x ≠ 0 ∧
        (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤ Γ * A.det ^ (1 / ((n : ℝ) - 1))) :
    hunterImage n D Γ = canonicalPolys n D := by
  sorry

/-- The complete list in every degree at least two: absolute Hunter images together with
relative images over canonical models of proper subfields with the discriminant power bound.
Only positive ranks below n are required. -/
theorem hunter_relativeImage_eq_canonicalPolys {n : ℕ} (hn : 2 ≤ n) (D : ℕ)
    (Γ : ℕ → ℝ)
    (hΓ : ∀ k, 1 ≤ k → k < n →
      ∀ A : Matrix (Fin k) (Fin k) ℝ, A.PosDef →
        ∃ x : Fin k → ℤ, x ≠ 0 ∧
          (fun i => (x i : ℝ)) ⬝ᵥ A *ᵥ (fun i => (x i : ℝ)) ≤
            Γ k * A.det ^ (1 / (k : ℝ)))
    (R : ∀ (F : Type) [Field F] [NumberField F], ℕ → Finset (𝓞 F))
    (hR : ∀ (F : Type) [Field F] [NumberField F] (r : ℕ), 2 ≤ r →
      ∀ a : 𝓞 F, ∃ b ∈ R F r, a - b ∈ Ideal.span {(r : 𝓞 F)}) :
    canonicalPolys n D = hunterImage n D (Γ (n - 1)) ∪
      {Q | ∃ m : ℕ, 1 < m ∧ m < n ∧ m ∣ n ∧
        ∃ D' : ℕ, D' ^ (n / m) ≤ D ∧
        ∃ P ∈ canonicalPolys m D', ∃ h : Irreducible (P.map (Int.castRingHom ℚ)),
          haveI : Fact (Irreducible (P.map (Int.castRingHom ℚ))) := ⟨h⟩
          Q ∈ relativeImage (AdjoinRoot (P.map (Int.castRingHom ℚ))) (n / m) D
            (Γ (n - m)) (R (AdjoinRoot (P.map (Int.castRingHom ℚ))) (n / m))} := by
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

end TauCetiRoadmap.NumberFieldEnumeration
