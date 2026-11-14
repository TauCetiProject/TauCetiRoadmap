import Mathlib

/-!
# Relative Fargues–Fontaine curves: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`; discharging these statements does not complete the roadmap.

The statements are the ramified Dwork criterion (§0.2), existence and comparison of nonperfect
Cohen coefficient lifts (§0.23), exact-square finite-projective and finite-étale patching
(§§6.2–6.3), and Beauville–Laszlo effectivity, recovery and morphism descent for glueable
modules, flat exactness and detection of flatness and finite projectivity (§6.5). These are
the roadmap's headline theorems stated against the pinned APIs. The definitions use native
rings, ideals, modules, tensor products and linear maps; no geometric carrier is simulated.

The other geometric headlines need carriers absent from the pinned libraries. Layers 0–1 need
all-coefficient ramified Witt functors, weak period charts and the twelve relative Robba sheaves;
Layer 2 needs relative ringed period curves and diamonds. Tau Ceti's `spaX` is a topological
Frobenius quotient, without the curve structure sheaf needed here. Layers 3–4 need relative
Cartier legs, their symmetric orbit sheaves and ambient formal completions; Mathlib's
`BDeRhamPlus` alone does not supply those objects or their marked-untilt comparisons. Layer 5
needs the relative Frobenius bundle and Lubin–Tate period-section constructions. The geometric
results of Layers 6–7 — modification/lattice and meromorphic complement gluing, relative B-pair
cohomology and comparison, normalized one-leg comparison and compatibility of the supplied shtuka reconstruction
with curve modifications, punctured Witt algebraicity,
and exact tensor gluing and descent of G-bundles — need these analytic bundle, formal divisor,
shtuka and torsor categories. These headlines are not statable at the pins without those carriers.
-/

open scoped TensorProduct

universe u v

namespace TauCetiRoadmap.RelativeFarguesFontaine

/-! ## Layer 0: coefficients and integral period geometry -/

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

/-! ## Layer 6: linear patching and modifications -/

section ExactSquares

variable (R R₁ R₂ L : Type u) [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing L]
  [Algebra R R₁] [Algebra R R₂] [Algebra R L] [Algebra R₁ L] [Algebra R₂ L]
  [IsScalarTower R R₁ L] [IsScalarTower R R₂ L]

/-- An algebraic square is exact with the difference map at its right end (README §6.1). -/
structure ExactSquare : Prop where
  injective : Function.Injective (fun r : R => (algebraMap R R₁ r, algebraMap R R₂ r))
  kernel : ∀ x : R₁ × R₂, algebraMap R₁ L x.1 = algebraMap R₂ L x.2 ↔
    ∃ r : R, algebraMap R R₁ r = x.1 ∧ algebraMap R R₂ r = x.2
  surjective : Function.Surjective (fun x : R₁ × R₂ =>
    algebraMap R₁ L x.1 - algebraMap R₂ L x.2)

/-- Two modules with their actual overlap identification and restricted scalar actions. -/
structure PatchingData where
  left : Type u
  right : Type u
  [leftAdd : AddCommGroup left]
  [rightAdd : AddCommGroup right]
  [leftModule : Module R₁ left]
  [rightModule : Module R₂ right]
  [leftBase : Module R left]
  [rightBase : Module R right]
  [leftTower : IsScalarTower R R₁ left]
  [rightTower : IsScalarTower R R₂ right]
  transition : L ⊗[R₁] left ≃ₗ[L] L ⊗[R₂] right

attribute [instance] PatchingData.leftAdd PatchingData.rightAdd
  PatchingData.leftModule PatchingData.rightModule PatchingData.leftBase
  PatchingData.rightBase PatchingData.leftTower PatchingData.rightTower

variable {R R₁ R₂ L}

/-- The equalizer of the two maps to the common overlap is the module of sections. -/
def PatchingData.sections (D : PatchingData R R₁ R₂ L) : Submodule R (D.left × D.right) :=
  LinearMap.ker
    (((D.transition.toLinearMap.restrictScalars R).comp
      (((TensorProduct.mk R₁ L D.left) 1).restrictScalars R)).comp
        (LinearMap.fst R D.left D.right) -
      (((TensorProduct.mk R₂ L D.right) 1).restrictScalars R).comp
        (LinearMap.snd R D.left D.right))

/-- Scalar extension of the first projection from the equalizer. -/
def PatchingData.compareLeft (D : PatchingData R R₁ R₂ L) :
    R₁ ⊗[R] D.sections →ₗ[R₁] D.left :=
  ((LinearMap.fst R D.left D.right).comp D.sections.subtype).liftBaseChange R₁

/-- Scalar extension of the second projection from the equalizer. -/
def PatchingData.compareRight (D : PatchingData R R₁ R₂ L) :
    R₂ ⊗[R] D.sections →ₗ[R₂] D.right :=
  ((LinearMap.snd R D.left D.right).comp D.sections.subtype).liftBaseChange R₂

/-- The universal comparison-surjectivity hypothesis in Kedlaya–Liu Lemma 1.3.9. -/
def UniversalPatching (R R₁ R₂ L : Type u) [CommRing R] [CommRing R₁] [CommRing R₂]
    [CommRing L] [Algebra R R₁] [Algebra R R₂] [Algebra R L]
    [Algebra R₁ L] [Algebra R₂ L] [IsScalarTower R R₁ L] [IsScalarTower R R₂ L] : Prop :=
  ∀ D : PatchingData R R₁ R₂ L,
    Module.Finite R₁ D.left → Module.Projective R₁ D.left →
    Module.Finite R₂ D.right → Module.Projective R₂ D.right →
    Function.Surjective D.compareLeft

/-- Finite-projective data have finitely presented sections and recover both pieces;
maximal-ideal covering makes those sections projective (README §6.2). -/
theorem exactSquare_finiteProjective (h : ExactSquare R R₁ R₂ L)
    (hs : UniversalPatching R R₁ R₂ L) (D : PatchingData R R₁ R₂ L)
    [Module.Finite R₁ D.left] [Module.Projective R₁ D.left]
    [Module.Finite R₂ D.right] [Module.Projective R₂ D.right] :
    Module.FinitePresentation R D.sections ∧ Function.Bijective D.compareLeft ∧
      Function.Bijective D.compareRight ∧
      ((∀ m : Ideal R, m.IsMaximal →
        (∃ p : Ideal R₁, p.IsPrime ∧ p.comap (algebraMap R R₁) = m) ∨
        (∃ p : Ideal R₂, p.IsPrime ∧ p.comap (algebraMap R R₂) = m)) →
        Module.Projective R D.sections) := by
  sorry

/-- Under the exact-square patching hypotheses, compatible finite étale algebras are
scalar extensions of a finite étale algebra with the specified transition (README §6.3). -/
theorem exactSquare_finiteEtale (h : ExactSquare R R₁ R₂ L)
    (hs : UniversalPatching R R₁ R₂ L)
    (hc : ∀ m : Ideal R, m.IsMaximal →
      (∃ p : Ideal R₁, p.IsPrime ∧ p.comap (algebraMap R R₁) = m) ∨
      (∃ p : Ideal R₂, p.IsPrime ∧ p.comap (algebraMap R R₂) = m))
    (A₁ A₂ : Type u) [CommRing A₁] [CommRing A₂] [Algebra R₁ A₁] [Algebra R₂ A₂]
    [Module.Finite R₁ A₁] [Module.Finite R₂ A₂] [Algebra.Etale R₁ A₁] [Algebra.Etale R₂ A₂]
    (α : L ⊗[R₁] A₁ ≃ₐ[L] L ⊗[R₂] A₂) :
    ∃ (A : Type u) (_ : CommRing A) (_ : Algebra R A),
      Module.Finite R A ∧ Algebra.Etale R A ∧
      ∃ (e₁ : R₁ ⊗[R] A ≃ₐ[R₁] A₁) (e₂ : R₂ ⊗[R] A ≃ₐ[R₂] A₂),
        ∀ a : A, α (1 ⊗ₜ[R₁] e₁ (1 ⊗ₜ[R] a)) = 1 ⊗ₜ[R₂] e₂ (1 ⊗ₜ[R] a) := by
  sorry

/-- Compatible morphisms between the scalar extensions of finite-projective modules
recover a unique base morphism. Together with effectivity this is the equivalence in §6.2. -/
theorem exactSquare_hom (h : ExactSquare R R₁ R₂ L)
    (M N : Type u) [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    [Module.Finite R M] [Module.Projective R M]
    [Module.Finite R N] [Module.Projective R N]
    (g₁ : R₁ ⊗[R] M →ₗ[R₁] R₁ ⊗[R] N)
    (g₂ : R₂ ⊗[R] M →ₗ[R₂] R₂ ⊗[R] N)
    (hg : ∀ m : M,
      TensorProduct.map (IsScalarTower.toAlgHom R R₁ L).toLinearMap (LinearMap.id : N →ₗ[R] N)
        (g₁ (1 ⊗ₜ[R] m)) =
      TensorProduct.map (IsScalarTower.toAlgHom R R₂ L).toLinearMap (LinearMap.id : N →ₗ[R] N)
        (g₂ (1 ⊗ₜ[R] m))) :
    ∃! g : M →ₗ[R] N, (∀ m, g₁ (1 ⊗ₜ[R] m) = 1 ⊗ₜ[R] g m) ∧
      (∀ m, g₂ (1 ⊗ₜ[R] m) = 1 ⊗ₜ[R] g m) := by
  sorry

/-- Compatible algebra homomorphisms between finite étale scalar extensions descend
uniquely; this supplies the morphisms in the equivalence of README §6.3. -/
theorem exactSquare_finiteEtale_hom (h : ExactSquare R R₁ R₂ L)
    (A B : Type u) [CommRing A] [CommRing B] [Algebra R A] [Algebra R B]
    [Module.Finite R A] [Module.Finite R B] [Algebra.Etale R A] [Algebra.Etale R B]
    (g₁ : R₁ ⊗[R] A →ₐ[R₁] R₁ ⊗[R] B)
    (g₂ : R₂ ⊗[R] A →ₐ[R₂] R₂ ⊗[R] B)
    (hg : ∀ a : A,
      TensorProduct.map (IsScalarTower.toAlgHom R R₁ L).toLinearMap (LinearMap.id : B →ₗ[R] B)
        (g₁ (1 ⊗ₜ[R] a)) =
      TensorProduct.map (IsScalarTower.toAlgHom R R₂ L).toLinearMap (LinearMap.id : B →ₗ[R] B)
        (g₂ (1 ⊗ₜ[R] a))) :
    ∃! g : A →ₐ[R] B, (∀ a, g₁ (1 ⊗ₜ[R] a) = 1 ⊗ₜ[R] g a) ∧
      (∀ a, g₂ (1 ⊗ₜ[R] a) = 1 ⊗ₜ[R] g a) := by
  sorry

end ExactSquares

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

section GeneralGlueing

variable {R R' L : Type u} [CommRing R] [CommRing R'] [CommRing L]
  [Algebra R R'] [Algebra R L] [Algebra R' L] [IsScalarTower R R' L]
  {f : R} [Algebra (Localization.Away f) L] [IsScalarTower R (Localization.Away f) L]
  [IsLocalization.Away (algebraMap R R' f) L]

/-- A module is glueable when its power-torsion embeds into its first scalar extension.
For a glueing pair this is Stacks Tag 0BNW's criterion, without flatness or finiteness. -/
def IsGlueable (R' : Type u) [CommRing R'] [Algebra R R'] (f : R)
    (M : Type u) [AddCommGroup M] [Module R M] : Prop :=
  Set.InjOn (fun m : M => (1 : R') ⊗ₜ[R] m)
    (Submodule.torsion' R M (Submonoid.powers f))

/-- Every module datum over a glueing pair has glueable equalizer sections recovering
both pieces by the canonical comparison maps (Stacks Tag 0BP2; README §6.5(a)). -/
theorem beauvilleLaszlo_sections (h : GlueingPair R' f)
    (D : PatchingData R R' (Localization.Away f) L) :
    IsGlueable R' f D.sections ∧ Function.Bijective D.compareLeft ∧
      Function.Bijective D.compareRight ∧
      Function.Surjective (fun x : D.left × D.right =>
        D.transition (1 ⊗ₜ[R'] x.1) - 1 ⊗ₜ[Localization.Away f] x.2) := by
  sorry

/-- The canonical map from a module to its two scalar extensions. -/
def patchingDiagonal (R R₁ R₂ M : Type u) [CommRing R] [CommRing R₁] [CommRing R₂]
    [Algebra R R₁] [Algebra R R₂] [AddCommGroup M] [Module R M] :
    M →ₗ[R] (R₁ ⊗[R] M) × (R₂ ⊗[R] M) :=
  ((TensorProduct.mk R R₁ M) 1).prod ((TensorProduct.mk R R₂ M) 1)

/-- The difference of the canonical maps to the common overlap, with the first leg positive. -/
def patchingDifference (R R₁ R₂ L M : Type u) [CommRing R] [CommRing R₁] [CommRing R₂]
    [CommRing L] [Algebra R R₁] [Algebra R R₂] [Algebra R L]
    [Algebra R₁ L] [Algebra R₂ L] [IsScalarTower R R₁ L] [IsScalarTower R R₂ L]
    [AddCommGroup M] [Module R M] :
    (R₁ ⊗[R] M) × (R₂ ⊗[R] M) →ₗ[R] L ⊗[R] M :=
  (TensorProduct.map (IsScalarTower.toAlgHom R R₁ L).toLinearMap LinearMap.id).comp
    (LinearMap.fst R (R₁ ⊗[R] M) (R₂ ⊗[R] M)) -
  (TensorProduct.map (IsScalarTower.toAlgHom R R₂ L).toLinearMap LinearMap.id).comp
    (LinearMap.snd R (R₁ ⊗[R] M) (R₂ ⊗[R] M))

/-- A glueable module is recovered as the equalizer of its canonical datum, and the
sequence is also surjective at the overlap (README §6.5(a), Stacks Tags 0BNW and 0BP2). -/
theorem beauvilleLaszlo_recovery (h : GlueingPair R' f)
    (M : Type u) [AddCommGroup M] [Module R M] (hM : IsGlueable R' f M) :
    Function.Injective (patchingDiagonal R R' (Localization.Away f) M) ∧
      Function.Exact (patchingDiagonal R R' (Localization.Away f) M)
        (patchingDifference R R' (Localization.Away f) L M) ∧
      Function.Surjective (patchingDifference R R' (Localization.Away f) L M) := by
  sorry

/-- Flat modules have the short exact glueing sequence without a separate glueability
assumption (README §6.5(c); Stacks Remark 15.92.11(2)). -/
theorem beauvilleLaszlo_flat_exact (h : GlueingPair R' f)
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Flat R M] :
    Function.Injective (patchingDiagonal R R' (Localization.Away f) M) ∧
      Function.Exact (patchingDiagonal R R' (Localization.Away f) M)
        (patchingDifference R R' (Localization.Away f) L M) ∧
      Function.Surjective (patchingDifference R R' (Localization.Away f) L M) := by
  sorry

/-- Compatible morphisms between canonical data of glueable modules descend uniquely;
together with sections and recovery this gives the full equivalence of README §6.5(a). -/
theorem beauvilleLaszlo_hom (h : GlueingPair R' f)
    (M N : Type u) [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (hM : IsGlueable R' f M) (hN : IsGlueable R' f N)
    (g' : R' ⊗[R] M →ₗ[R'] R' ⊗[R] N)
    (g₁ : Localization.Away f ⊗[R] M →ₗ[Localization.Away f] Localization.Away f ⊗[R] N)
    (hg : ∀ m : M, patchingDifference R R' (Localization.Away f) L N
      (g' (1 ⊗ₜ[R] m), g₁ (1 ⊗ₜ[R] m)) = 0) :
    ∃! g : M →ₗ[R] N, (∀ m, g' (1 ⊗ₜ[R] m) = 1 ⊗ₜ[R] g m) ∧
      (∀ m, g₁ (1 ⊗ₜ[R] m) = 1 ⊗ₜ[R] g m) := by
  sorry

end GeneralGlueing

end TauCetiRoadmap.RelativeFarguesFontaine
