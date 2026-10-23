import Mathlib

/-!
# Ordinary projectors and perfect ordinary factors: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones; discharging
all of them finishes neither a layer nor the roadmap.

Layer 0a's locally finite ordinary decomposition (§0a.22), ordinary idempotent and perfect
splitting (§0a.17), and independence of the perfect ordinary factor (§0a.25) are stated on
Mathlib's modules, cochain complexes, homotopy category and derived category. Local finiteness,
complete-flatness and existence of a finite projective model have explicit definitions below.

The arithmetic headlines require carriers absent from the pins: the Katz/Igusa and integral
ordinary Hecke towers for ordinary control (Layer 0); trace-compatible integral family homology,
period lattices and family measures for period freeness and interpolation (Layer 1); Fredholm
spectral spaces, linked family distribution modules and their Hecke-image sheaves for the
Buzzard eigenvariety, global symbol eigencurve and classicality comparisons (Layers 2a–2);
and refined family eigensymbols, Selmer local conditions and Mellin transforms for Bellaïche's
critical-eigensymbol and secondary L-function theorems, including Eisenstein refinements
(Layer 3). Layer 4's family Galois modules, modular zeta classes, Iwasawa/Selmer cohomology,
period regulators and relative Robba modules are also absent, as are Layer 5's quaternionic
ordinary towers, the imported positive-coefficient and standard-constant-integral Hilbert family
lattices with their full and restricted Hecke pairings, constant obstruction and specialization
sequence, their geometric tower comparisons, and quaternionic period modules. The family
reciprocity, Euler-system divisibility, Coleman
triangulation and totally real control/period theorems
therefore have no signatures here. Classical forms and single-weight symbols alone do not
provide these family carriers.

The coefficient-tower gluing theorem (§0a.18) requires the coherent derived reduction diagrams
and compatible minimal-model comparisons of §0a.0.3; those interfaces are absent at the pins.
-/

namespace TauCetiRoadmap.PadicFamilies

open CategoryTheory

universe u v w

section Modules

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- Every orbit lies in a finitely generated submodule modulo each adic power (§0a.19). -/
def IsLocallyFiniteEnd (I : Ideal R) (T : Module.End R M) : Prop :=
  ∀ n : ℕ, ∀ v : M, ∃ s : Finset M, ∀ k : ℕ,
    (T ^ k) v ∈ Submodule.span R (s : Set M) ⊔ (I ^ n) • (⊤ : Submodule R M)

/-- Pilloni's locally finite ordinary decomposition (README §0a.22): factorial powers
converge pointwise to the unique ordinary projector, without finite generation of `M`. -/
theorem locally_finite_ordinary_milestone
    [IsNoetherianRing R] [IsLocalRing R]
    [Finite (IsLocalRing.ResidueField R)]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) M]
    (T : Module.End R M)
    (hT : IsLocallyFiniteEnd (IsLocalRing.maximalIdeal R) T) :
    ∃! e : Module.End R M, IsIdempotentElem e ∧ Commute T e ∧
      Set.BijOn T (LinearMap.range e) (LinearMap.range e) ∧
      (∀ x : M, ∀ n : ℕ, ∃ b : ℕ, ∀ k : ℕ, b ≤ k →
        (T ^ (Nat.factorial k)) x - e x ∈
          (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R M)) ∧
      (∀ x ∈ LinearMap.ker e, ∀ n : ℕ, ∃ b : ℕ, ∀ k : ℕ, b ≤ k →
        (T ^ k) x ∈ (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R M)) := by
  sorry

end Modules

variable {R : Type u} [CommRing R] [IsLocalRing R]
variable [HasDerivedCategory.{w} (ModuleCat.{v} R)]

/-- Bounded cochain complexes with flat, separated complete maximal-adic terms (§0a.0.2). -/
def CompleteFlatComplex (C : CochainComplex (ModuleCat.{v} R) ℤ) : Prop :=
  (∃ a b : ℤ, C.IsStrictlyGE a ∧ C.IsStrictlyLE b) ∧
    ∀ i : ℤ, Module.Flat R (C.X i) ∧
      IsAdicComplete (IsLocalRing.maximalIdeal R) (C.X i)

/-- Perfectness of a native derived object, expressed by a bounded finite projective model. -/
def HasFiniteProjectiveModel (X : DerivedCategory (ModuleCat.{v} R)) : Prop :=
  ∃ (P : CochainComplex (ModuleCat.{v} R) ℤ) (a b : ℤ),
    P.IsStrictlyGE a ∧ P.IsStrictlyLE b ∧
      (∀ i : ℤ, Module.Finite R (P.X i) ∧ Module.Projective R (P.X i)) ∧
      Nonempty (DerivedCategory.Q.obj P ≅ X)

/-- Khare–Thorne ordinary projection for a perfect complex (README §0a.17): the
factorial-limit idempotent lies in `R[t]` and splits within the same finite term interval. -/
theorem perfect_complex_ordinary_projector
    [IsNoetherianRing R] [Finite (IsLocalRing.ResidueField R)]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    (C : CochainComplex (ModuleCat.{v} R) ℤ) (a b : ℤ)
    [C.IsStrictlyGE a] [C.IsStrictlyLE b]
    [∀ i : ℤ, Module.Finite R (C.X i)]
    [∀ i : ℤ, Module.Projective R (C.X i)]
    (t : End ((HomotopyCategory.quotient (ModuleCat.{v} R) (.up ℤ)).obj C)) :
    ∃! e : End ((HomotopyCategory.quotient (ModuleCat.{v} R) (.up ℤ)).obj C),
      IsIdempotentElem e ∧ e ∈ Algebra.adjoin R {t} ∧
      (∀ n : ℕ, ∃ B : ℕ, ∀ k ≥ B,
        t ^ (Nat.factorial k) - e ∈ (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R
          (End ((HomotopyCategory.quotient (ModuleCat.{v} R) (.up ℤ)).obj C)))) ∧
      ∃ (D : CochainComplex (ModuleCat.{v} R) ℤ),
        D.IsStrictlyGE a ∧ D.IsStrictlyLE b ∧
        (∀ i : ℤ, Module.Finite R (D.X i) ∧ Module.Projective R (D.X i)) ∧
        ∃ (ι : (HomotopyCategory.quotient _ _).obj D ⟶
            (HomotopyCategory.quotient _ _).obj C)
          (π : (HomotopyCategory.quotient _ _).obj C ⟶
            (HomotopyCategory.quotient _ _).obj D),
          π ≫ ι = e ∧ ι ≫ π = 𝟙 _ := by
  sorry

/-- Pilloni's representative independence (README §0a.25): a derived comparison of locally
finite complete-flat representatives restricts to an isomorphism of their ordinary factors
when one factor is perfect. The other factor is then perfect as well. -/
theorem locally_finite_derived_ordinary_independence
    [IsNoetherianRing R] [Finite (IsLocalRing.ResidueField R)]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    (C₀ C₁ D₀ D₁ : CochainComplex (ModuleCat.{v} R) ℤ)
    (hC₀ : CompleteFlatComplex C₀) (hC₁ : CompleteFlatComplex C₁)
    (T₀ e₀ : C₀ ⟶ C₀) (T₁ e₁ : C₁ ⟶ C₁)
    (hT₀ : ∀ i : ℤ, IsLocallyFiniteEnd (IsLocalRing.maximalIdeal R) (T₀.f i).hom)
    (hT₁ : ∀ i : ℤ, IsLocallyFiniteEnd (IsLocalRing.maximalIdeal R) (T₁.f i).hom)
    (he₀ : ∀ (i : ℤ) (x : C₀.X i) (n : ℕ), ∃ b : ℕ, ∀ k ≥ b,
      (((T₀.f i).hom ^ (Nat.factorial k)) x - (e₀.f i).hom x) ∈
        (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R (C₀.X i)))
    (he₁ : ∀ (i : ℤ) (x : C₁.X i) (n : ℕ), ∃ b : ℕ, ∀ k ≥ b,
      (((T₁.f i).hom ^ (Nat.factorial k)) x - (e₁.f i).hom x) ∈
        (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R (C₁.X i)))
    (ι₀ : D₀ ⟶ C₀) (π₀ : C₀ ⟶ D₀) (ι₁ : D₁ ⟶ C₁) (π₁ : C₁ ⟶ D₁)
    (h₀ : π₀ ≫ ι₀ = e₀ ∧ ι₀ ≫ π₀ = 𝟙 D₀)
    (h₁ : π₁ ≫ ι₁ = e₁ ∧ ι₁ ≫ π₁ = 𝟙 D₁)
    (α : DerivedCategory.Q.obj C₀ ≅ DerivedCategory.Q.obj C₁)
    (hα : DerivedCategory.Q.map T₀ ≫ α.hom = α.hom ≫ DerivedCategory.Q.map T₁)
    (hD₀ : HasFiniteProjectiveModel (DerivedCategory.Q.obj D₀)) :
    HasFiniteProjectiveModel (DerivedCategory.Q.obj D₁) ∧
      IsIso (DerivedCategory.Q.map ι₀ ≫ α.hom ≫ DerivedCategory.Q.map π₁) := by
  sorry

end TauCetiRoadmap.PadicFamilies
