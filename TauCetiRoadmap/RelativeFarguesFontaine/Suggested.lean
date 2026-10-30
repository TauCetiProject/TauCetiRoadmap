import Mathlib

/-!
# Relative Fargues–Fontaine curves: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`; discharging these statements does not complete the roadmap.

The statements are the ramified Dwork criterion (§0.2), existence and comparison of nonperfect
Cohen coefficient lifts (§0.23), and Beauville–Laszlo finite-projective effectivity and detection
of flatness and finite projectivity for general glueing pairs (§6.5). The ghost formula and the
quotient/torsion definition of a glueing pair use Mathlib's rings, ideals and modules directly.

The other geometric headlines need carriers absent from the pinned libraries. Layers 0–1 need
all-coefficient ramified Witt functors, weak period charts and the twelve relative Robba sheaves;
Layer 2 needs relative ringed period curves and diamonds. Tau Ceti's `spaX` is a topological
Frobenius quotient, without the curve structure sheaf needed here. Layers 3–4 need relative
Cartier legs, their symmetric orbit sheaves and ambient formal completions; Mathlib's
`BDeRhamPlus` alone does not supply those objects or their marked-untilt comparisons. Layer 5
needs the relative Frobenius bundle and Lubin–Tate period-section constructions. The geometric
results of Layers 6–7 — modification/lattice and meromorphic complement gluing, relative B-pair
cohomology and comparison, normalized one-leg shtuka recovery, punctured Witt algebraicity,
and exact tensor gluing and descent of G-bundles — need these analytic bundle, formal divisor,
shtuka and torsor categories. Their statements are deferred until those carriers exist.
-/

open scoped TensorProduct

universe u v

namespace TauCetiRoadmap.RelativeFarguesFontaine

section Coefficients

variable {O : Type v} [CommRing O]

/-- Evaluation of the ramified ghost polynomial; meaningful in any coefficient algebra. -/
def ramifiedGhost (π : O) (q : ℕ) (A : Type u) [CommRing A] [Algebra O A]
    (n : ℕ) (x : ℕ → A) : A :=
  ∑ i ∈ Finset.range (n + 1), algebraMap O A π ^ i * x i ^ (q ^ (n - i))

/-- The ramified Dwork criterion of README §0.2 gives injectivity and the exact ghost image
for a torsion-free algebra with a coefficient-linear Frobenius lift. -/
theorem ramifiedDworkCriterion [IsDomain O] [CharZero O] [IsDiscreteValuationRing O]
    [Finite (IsLocalRing.ResidueField O)] (π : O) (q : ℕ)
    (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
    (hq : q = Nat.card (IsLocalRing.ResidueField O))
    (A : Type u) [CommRing A] [Algebra O A]
    (hregular : algebraMap O A π ∈ nonZeroDivisors A) (σ : A →ₐ[O] A)
    (hσ : ∀ a : A, algebraMap O A π ∣ σ a - a ^ q) :
    Function.Injective (fun x : ℕ → A => fun n => ramifiedGhost π q A n x) ∧
      ∀ y : ℕ → A, (∃ x : ℕ → A, ∀ n, ramifiedGhost π q A n x = y n) ↔
        ∀ n, algebraMap O A π ^ (n + 1) ∣ y (n + 1) - σ (y n) := by
  sorry

end Coefficients

section Cohen

variable (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Finite (IsLocalRing.ResidueField O)] [hcomplete : IsAdicComplete (IsLocalRing.maximalIdeal O) O]
  (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
  (K : Type u) [Field K] [Algebra O K]
  (hK : RingHom.ker (algebraMap O K) = IsLocalRing.maximalIdeal O)

include hπ hK hcomplete

/-- README §0.23: every residue-field extension, including imperfect ones, has a flat
complete coefficient lift and a coefficient-linear lift of its residue q-Frobenius. -/
theorem cohenCoefficientLift_exists :
    ∃ (A : Type u) (_ : CommRing A) (_ : Algebra O A),
      Module.Flat O A ∧ IsAdicComplete (Ideal.span {algebraMap O A π}) A ∧
      ∃ ρ : A →ₐ[O] K, Function.Surjective ρ ∧
        RingHom.ker ρ.toRingHom = Ideal.span {algebraMap O A π} ∧
        ∃ σ : A →ₐ[O] A, ∀ x, ρ (σ x) = ρ x ^ Nat.card (IsLocalRing.ResidueField O) := by
  sorry

/-- README §0.23: any two marked flat complete coefficient lifts are isomorphic over O,
compatibly with the residue maps; no uniqueness of the isomorphism is asserted. -/
theorem cohenCoefficientLift_compare
    (A B : Type u) [CommRing A] [Algebra O A] [CommRing B] [Algebra O B]
    [Module.Flat O A] [Module.Flat O B]
    [IsAdicComplete (Ideal.span {algebraMap O A π}) A]
    [IsAdicComplete (Ideal.span {algebraMap O B π}) B]
    (ρA : A →ₐ[O] K) (ρB : B →ₐ[O] K)
    (hsA : Function.Surjective ρA) (hsB : Function.Surjective ρB)
    (hkA : RingHom.ker ρA.toRingHom = Ideal.span {algebraMap O A π})
    (hkB : RingHom.ker ρB.toRingHom = Ideal.span {algebraMap O B π}) :
    ∃ e : A ≃ₐ[O] B, ∀ a, ρB (e a) = ρA a := by
  sorry

end Cohen

section GlueingPair

variable {R : Type u} [CommRing R]

/-- Quotient bijectivity and power-torsion bijectivity together characterize a glueing pair. -/
structure GlueingPair (R' : Type u) [CommRing R'] [Algebra R R'] (f : R) : Prop where
  quotient_surjective : ∀ n : ℕ, ∀ y : R', ∃ x : R,
    y - algebraMap R R' x ∈ Ideal.span {algebraMap R R' f ^ n}
  quotient_injective : ∀ n : ℕ,
    (Ideal.span {algebraMap R R' f ^ n}).comap (algebraMap R R') = Ideal.span {f ^ n}
  torsion_bijOn : Set.BijOn (algebraMap R R')
    (Submodule.torsion' R R (Submonoid.powers f))
    (Submodule.torsion' R' R' (Submonoid.powers (algebraMap R R' f)))

/-- Flatness is detected by the two scalar extensions in README §6.5's glueing pair. -/
theorem beauvilleLaszlo_flat_iff {R' : Type u} [CommRing R'] [Algebra R R']
    {f : R} (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    Module.Flat R M ↔
      Module.Flat R' (R' ⊗[R] M) ∧
        Module.Flat (Localization.Away f) (Localization.Away f ⊗[R] M) := by
  sorry

/-- Finite-projective detection needs a glueing pair, and applies even to an arbitrary module.
Stacks Lemma 15.92.19; glueability is a consequence here rather than an extra hypothesis. -/
theorem beauvilleLaszlo_finiteProjective_iff {R' : Type u} [CommRing R'] [Algebra R R']
    {f : R} (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    (Module.Finite R M ∧ Module.Projective R M) ↔
      ((Module.Finite R' (R' ⊗[R] M) ∧ Module.Projective R' (R' ⊗[R] M)) ∧
        (Module.Finite (Localization.Away f) (Localization.Away f ⊗[R] M) ∧
          Module.Projective (Localization.Away f) (Localization.Away f ⊗[R] M))) := by
  sorry

/-- Algebraic effectivity with an explicit common puncture and transition compatibility. -/
theorem beauvilleLaszlo_effective {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (L : Type u) [CommRing L] [Algebra R L] [Algebra R' L]
    [Algebra (Localization.Away f) L] [IsScalarTower R R' L]
    [IsScalarTower R (Localization.Away f) L] [IsLocalization.Away (algebraMap R R' f) L]
    (M' M₁ : Type u) [AddCommGroup M'] [Module R' M']
    [Module.Finite R' M'] [Module.Projective R' M']
    [AddCommGroup M₁] [Module (Localization.Away f) M₁]
    [Module.Finite (Localization.Away f) M₁] [Module.Projective (Localization.Away f) M₁]
    (α : L ⊗[R'] M' ≃ₗ[L] L ⊗[Localization.Away f] M₁) :
    ∃ (M : Type u) (_ : AddCommGroup M) (_ : Module R M),
      Module.Finite R M ∧ Module.Projective R M ∧
      ∃ (e' : R' ⊗[R] M ≃ₗ[R'] M')
        (e₁ : Localization.Away f ⊗[R] M ≃ₗ[Localization.Away f] M₁),
        ∀ m : M, α (1 ⊗ₜ[R'] e' (1 ⊗ₜ[R] m)) =
          1 ⊗ₜ[Localization.Away f] e₁ (1 ⊗ₜ[R] m) := by
  sorry

end GlueingPair

end TauCetiRoadmap.RelativeFarguesFontaine
