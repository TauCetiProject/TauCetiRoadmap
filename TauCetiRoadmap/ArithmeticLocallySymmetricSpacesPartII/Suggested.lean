module

public import Mathlib
public import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower

/-!
# Arithmetic locally symmetric spaces, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the two simple definitions they need: the standard representation of a subgroup of
`SL₂(𝓞_F)` through a complex embedding of `F`, and the algebraic coefficient system
`⊗_σ Sym^{t_σ}(ℂ²)` indexed by the complex embeddings `σ` of `F`.

Stated here (README §4.2 and §5.8):

* the ordinary-cohomology form of Fu's sharp bound: for a number field with a complex place
  and every subgroup of `SL₂(𝓞_F)` containing a principal congruence kernel, the group
  cohomology with coefficients `⊗_σ Sym^{t_σ}(ℂ²)` has dimension at most a constant times
  `∏_σ (t_σ + 1) / min_σ (t_σ + 1)`;
* two-sided linear growth of `dim H^i(Γ, Sym^n(ℂ²) ⊗ conj Sym^n(ℂ²))`, `i = 1, 2`, for every
  congruence subgroup `Γ` of a Bianchi group.

Headline theorems of the README that are not statable at the pins:

* Fu's local homology theorem (README §2.6). It needs the classical Ore division ring of the
  rational Iwasawa algebra `ℚ_p ⊗ ℤ_p[[G]]` and the skew rank it defines, and rational completed
  Iwasawa homology `H_i(G, M ⊗ W_k)` with the diagonal action of `G`. Tau Ceti has the completed
  group algebra and the module structure on a compact module, but neither the Ore rank nor
  this homology.
* The sharp bound for cusp forms, `dim S_κ(K_f) ≤ C Δ(κ) / min_v κ_v` at an arbitrary compact
  open `K_f ⊂ SL₂(𝔸_F^∞)` (README §4.2), and its parallel-weight and Bianchi corollaries
  (§§4.3–4.4). Its carrier `S_κ(K_f)` (README §4.1), the multiplicity space of the archimedean
  type that is holomorphic at every real place in the `K_f`-invariant cuspidal spectrum of
  `SL₂(F)\SL₂(𝔸_F)`, does not exist at the pins: neither the cuspidal spectrum nor the discrete
  series and principal series of `SL₂(ℝ)` and `SL₂(ℂ)` do.
* The cuspidal, interior and compact-support forms of the Bianchi two-sided bound (README §5.8).
  The Borel–Serre quotient, its compactly supported cohomology, the interior image and the
  cuspidal subspace do not exist at the pins.
-/

@[expose] public section

namespace TauCetiRoadmap.ArithmeticLocallySymmetricSpacesPartII

open NumberField Matrix
open scoped MatrixGroups TensorProduct

/-- The standard representation on `ℂ²` of a subgroup `Γ` of `SL₂(𝓞_F)` through the complex
embedding `σ : F →+* ℂ`: a matrix acts by applying `σ` to its entries (README §3.1). -/
noncomputable def embeddingStdRep {F : Type} [Field F] [NumberField F] (σ : F →+* ℂ)
    (Γ : Subgroup (SL(2, 𝓞 F))) : Γ →* GL (Fin 2) ℂ :=
  SpecialLinearGroup.toGL.comp
    ((SpecialLinearGroup.map (σ.comp (algebraMap (𝓞 F) F))).comp Γ.subtype)

/-- The algebraic coefficient system `V_t = ⊗_σ Sym^{t_σ}(ℂ²)` of README §3.1, indexed by the
complex embeddings `σ` of `F`, on which `Γ ≤ SL₂(𝓞_F)` acts on the factor at `σ` through `σ`.
At a real embedding `t_σ = κ_v − 2`; at the two conjugate embeddings of a complex place
`t_σ = κ_v / 2 − 1`, so that the factor pair is `Sym^n(ℂ²) ⊗ conj Sym^n(ℂ²)`. The tuple `t` is
arbitrary: conjugate embeddings may carry different exponents. -/
noncomputable def weightRep {F : Type} [Field F] [NumberField F] (Γ : Subgroup (SL(2, 𝓞 F)))
    (t : (F →+* ℂ) → ℕ) : Rep ℂ Γ :=
  Rep.of (X := PiTensorProduct ℂ fun σ : F →+* ℂ => Sym[ℂ]^(t σ) (Fin 2 → ℂ))
    (PiTensorProduct.mapMonoidHom.comp
      (MonoidHom.pi fun σ => (TauCeti.symPowerRep ℂ 2 (t σ)).comp (embeddingStdRep σ Γ)))

/-! ## Layer 4: Cuspidal dimensions in weight aspect -/

/-- **Fu's sharp bound, ordinary-cohomology form** (README §4.2; fu24, Theorem 1.2 and §7).
Let `F` be a number field that is not totally real and `Γ ≤ SL₂(𝓞_F)` a subgroup containing the
principal congruence kernel of a nonzero ideal `𝔞`. There is a constant `C` such that for every
embedding weight `t`, every degree `i` and every integer `1 ≤ a ≤ min_σ (t_σ + 1)`, the group
cohomology `H^i(Γ, V_t)` is finite dimensional and `a · dim H^i(Γ, V_t) ≤ C ∏_σ (t_σ + 1)`. -/
theorem finrank_groupCohomology_weightRep_le (F : Type) [Field F] [NumberField F]
    (hF : ¬ IsTotallyReal F) (Γ : Subgroup (SL(2, 𝓞 F))) (𝔞 : Ideal (𝓞 F)) (h𝔞 : 𝔞 ≠ ⊥)
    (hΓ : (SpecialLinearGroup.map (Ideal.Quotient.mk 𝔞) :
      SL(2, 𝓞 F) →* SL(2, 𝓞 F ⧸ 𝔞)).ker ≤ Γ) :
    ∃ C : ℝ, ∀ (t : (F →+* ℂ) → ℕ) (i : ℕ),
      FiniteDimensional ℂ (groupCohomology (weightRep Γ t) i) ∧
      ∀ a : ℕ, 1 ≤ a → (∀ σ, a ≤ t σ + 1) →
        (a : ℝ) * Module.finrank ℂ (groupCohomology (weightRep Γ t) i) ≤
          C * ∏ σ, ((t σ : ℝ) + 1) := by
  sorry

/-! ## Layer 5: Bianchi boundary and sharpness -/

/-- **Two-sided linear Bianchi growth** (README §5.8; fu24, Corollary 1.3; fgt10, Theorem 4.17
and Corollary 4.20). Let `F` be an imaginary quadratic field and `Γ ≤ SL₂(𝓞_F)` a subgroup
containing the principal congruence kernel of a nonzero ideal. Its two complex embeddings are
conjugate, so `V_{(n,n)} = Sym^n(ℂ²) ⊗ conj Sym^n(ℂ²)` is the coefficient system `E_n`. There are
`0 < c`, `C` and `n₀` such that for `n ≥ n₀` and `i ∈ {1, 2}` the group cohomology `H^i(Γ, E_n)`
is finite dimensional with `c (n + 1) ≤ dim H^i(Γ, E_n) ≤ C (n + 1)`. -/
theorem bianchi_groupCohomology_linear_growth (F : Type) [Field F] [NumberField F]
    [IsTotallyComplex F] (hd : Module.finrank ℚ F = 2) (Γ : Subgroup (SL(2, 𝓞 F)))
    (𝔞 : Ideal (𝓞 F)) (h𝔞 : 𝔞 ≠ ⊥)
    (hΓ : (SpecialLinearGroup.map (Ideal.Quotient.mk 𝔞) :
      SL(2, 𝓞 F) →* SL(2, 𝓞 F ⧸ 𝔞)).ker ≤ Γ) :
    ∃ c C : ℝ, 0 < c ∧ ∃ n₀ : ℕ, ∀ n, n₀ ≤ n → ∀ i ∈ ({1, 2} : Finset ℕ),
      FiniteDimensional ℂ (groupCohomology (weightRep Γ fun _ => n) i) ∧
      c * ((n : ℝ) + 1) ≤ Module.finrank ℂ (groupCohomology (weightRep Γ fun _ => n) i) ∧
      (Module.finrank ℂ (groupCohomology (weightRep Γ fun _ => n) i) : ℝ) ≤
        C * ((n : ℝ) + 1) := by
  sorry

end TauCetiRoadmap.ArithmeticLocallySymmetricSpacesPartII
