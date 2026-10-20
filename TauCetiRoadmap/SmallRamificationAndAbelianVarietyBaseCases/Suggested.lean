/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.PositiveDefinite.AddGroup
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.ConstantGroup.Scheme
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Constant
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Quotient.Kernel.Exact
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.End.BaseChange
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.NumberTheory.LocalField.Different.Tower
import TauCeti.NumberTheory.LocalField.Discriminant.Basic
import TauCeti.NumberTheory.LocalField.Herbrand.Basic
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel

/-!
# SmallRamificationAndAbelianVarietyBaseCases: representative target signatures

The roadmap is `README.md`. This file records definitions and theorem signatures statable
against the pinned APIs and is not exhaustive. It uses finite discrete coefficient fields,
absolute irreducibility, the different normalised by the ramification index, and the
subobject-first convention for extensions. The integral finite-flat category and abelian
varieties are Tau Ceti's objects. Named boundary theorems distinguish absolute irreducibility,
the Ext direction and the excluded prime eleven. Representation constructions are specified
in the README.
Signatures needing unavailable supplier interfaces are named in the closing comment.
-/

noncomputable section

open NumberField NumberField.InfinitePlace Module Polynomial MeasureTheory Set Filter Topology
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open scoped Classical Real TensorProduct CategoryTheory.MonObj

namespace TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

/-- An element of `G_ℚ` as an automorphism of `ℚ̄`. -/
abbrev galAut (σ : Field.absoluteGaloisGroup ℚ) : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ :=
  σ

/-! ## Layer 1: local and global discriminant bounds -/

section LocalDifferent

variable (p : ℕ) [Fact p.Prime] (E : Type*) [Field E] [ValuativeRel E]
  [TopologicalSpace E] [IsNonarchimedeanLocalField E] [TauCeti.FinitePadicExtension E p]

/-- The different exponent divided by the ramification index over `ℚ_p`. -/
def localRootDiscrExp : ℚ :=
  (TauCeti.differentExponent (Padic p) E : ℚ) / TauCeti.ramificationIndex (Padic p) E

/-- The normalized different vanishes exactly for an unramified extension. -/
theorem localRootDiscrExp_eq_zero_iff :
    localRootDiscrExp p E = 0 ↔ TauCeti.IsUnramified (Padic p) E := sorry

/-- In a tame extension the normalized different is `1 − 1/e`. -/
theorem localRootDiscrExp_of_tame (ht : TauCeti.IsTamelyRamified (Padic p) E) :
    localRootDiscrExp p E = 1 - 1 / (TauCeti.ramificationIndex (Padic p) E : ℚ) := sorry

/-- The residue-degree factor converts the local discriminant exponent into the normalized different. -/
theorem localRootDiscrExp_eq_discriminantExponent_div [Algebra.IsSeparable (Padic p) E] :
    localRootDiscrExp p E =
      (TauCeti.discriminantExponent (Padic p) E : ℚ) / finrank (Padic p) E := sorry

/-- The upper-jump expression includes the tame jump at zero and uses right-limit groups. -/
theorem localRootDiscrExp_eq_sum_upper [IsGalois (Padic p) E] :
    let G : NNReal → Subgroup (E ≃ₐ[Padic p] E) := fun u =>
      TauCeti.LocalFieldsRamification.upperRamificationGroup (Padic p) E
        ⟨u, le_trans (by norm_num) u.property⟩
    (localRootDiscrExp p E : ℝ) = ∑ᶠ u : NNReal,
      (1 / (Nat.card (⨆ v : {v : NNReal // u < v}, G v.val : Subgroup (E ≃ₐ[Padic p] E)) : ℝ) -
        1 / (Nat.card (G u) : ℝ)) * ((u : ℝ) + 1) := sorry

/-- The normalized different in a tower adds the relative different with absolute denominator. -/
theorem localRootDiscrExp_tower (E' : Type*) [Field E'] [ValuativeRel E']
    [TopologicalSpace E'] [IsNonarchimedeanLocalField E'] [TauCeti.FinitePadicExtension E' p]
    [Algebra E E'] [ValuativeExtension E E'] [IsScalarTower (Padic p) E E'] :
    localRootDiscrExp p E' = localRootDiscrExp p E +
      (TauCeti.differentExponent E E' : ℚ) / TauCeti.ramificationIndex (Padic p) E' := sorry

/-- An unramified extension of the top field preserves the normalized different over `ℚ_p`. -/
theorem localRootDiscrExp_of_isUnramified (E' : Type*) [Field E'] [ValuativeRel E']
    [TopologicalSpace E'] [IsNonarchimedeanLocalField E'] [TauCeti.FinitePadicExtension E' p]
    [Algebra E E'] [ValuativeExtension E E'] [IsScalarTower (Padic p) E E']
    (hu : TauCeti.IsUnramified E E') :
    localRootDiscrExp p E' = localRootDiscrExp p E := sorry

/-- A base-preserving local field isomorphism preserves the normalized different. -/
theorem localRootDiscrExp_congr (E' : Type*) [Field E'] [ValuativeRel E']
    [TopologicalSpace E'] [IsNonarchimedeanLocalField E'] [TauCeti.FinitePadicExtension E' p]
    (e : E ≃ₐ[Padic p] E') : localRootDiscrExp p E = localRootDiscrExp p E' := sorry

end LocalDifferent

/-- A faithful rank-two characteristic-two local image has normalized different at most two,
and at most `3/2` when wild inertia has order at most two. -/
theorem localRootDiscrExp_le_two_of_char_two (E : Type*) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] [TauCeti.FinitePadicExtension E 2]
    [IsGalois (Padic 2) E]
    (ρ : (E ≃ₐ[Padic 2] E) →* GL (Fin 2) (AlgebraicClosure (ZMod 2)))
    (hρ : Function.Injective ρ) :
    localRootDiscrExp 2 E ≤ 2 ∧
      (Nat.card (TauCeti.LocalFieldsRamification.lowerRamificationGroup (Padic 2) E 1) ≤ 2 →
        localRootDiscrExp 2 E ≤ 3 / 2) := sorry

/-- A faithful rank-two characteristic-three local image with nontrivial wild inertia
has normalized different at most `13/6 − 1/|P|`. -/
theorem localRootDiscrExp_le_of_char_three (E : Type*) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] [TauCeti.FinitePadicExtension E 3]
    [IsGalois (Padic 3) E]
    (ρ : (E ≃ₐ[Padic 3] E) →* GL (Fin 2) (AlgebraicClosure (ZMod 3)))
    (hρ : Function.Injective ρ)
    (hw : 1 < Nat.card (TauCeti.LocalFieldsRamification.lowerRamificationGroup (Padic 3) E 1)) :
    localRootDiscrExp 3 E ≤ 13 / 6 -
      1 / (Nat.card (TauCeti.LocalFieldsRamification.lowerRamificationGroup (Padic 3) E 1) : ℚ) :=
  sorry

/-- For a Galois number field, any chosen completion at each ramified rational prime gives
the local exponent in the product formula for the root discriminant. -/
theorem rootDiscr_eq_prod_rpow_localRootDiscrExp (K : Type*) [Field K] [NumberField K]
    [IsGalois ℚ K]
    (w : (p : ℕ) → p.Prime → IsDedekindDomain.HeightOneSpectrum (𝓞 K))
    (hw : ∀ (p : ℕ) (hp : p.Prime), (p : 𝓞 K) ∈ (w p hp).asIdeal)
    (hlocal : ∀ (p : ℕ) (hp : p.Prime), letI : Fact p.Prime := ⟨hp⟩
      TauCeti.FinitePadicExtension ((w p hp).adicCompletion K) p) :
    rootDiscr K = ∏ p : ↥((discr K).natAbs.primeFactors),
      let hp := Nat.prime_of_mem_primeFactors p.property
      letI : Fact p.val.Prime := ⟨hp⟩
      letI := hlocal p.val hp
      (p.val : ℝ) ^ (localRootDiscrExp p.val ((w p.val hp).adicCompletion K) : ℝ) := sorry

section Minkowski

variable (K : Type*) [Field K] [NumberField K]

/-- A number field of degree at least three has root discriminant greater than two. -/
theorem two_lt_rootDiscr (h : 3 ≤ finrank ℚ K) : 2 < rootDiscr K := sorry

/-- A number field of degree at least six has root discriminant greater than three. -/
theorem three_lt_rootDiscr (h : 6 ≤ finrank ℚ K) : 3 < rootDiscr K := sorry

/-- A number field of degree at least twelve has root discriminant greater than four. -/
theorem four_lt_rootDiscr (h : 12 ≤ finrank ℚ K) : 4 < rootDiscr K := sorry

end Minkowski

/-- The kernel `g(x) = (1 − |x|) cos πx + sin π|x| / π` on `[−1, 1]`, zero outside. -/
def odlyzkoKernel (x : ℝ) : ℝ :=
  if |x| ≤ 1 then (1 - |x|) * Real.cos (π * x) + Real.sin (π * |x|) / π else 0

/-- The kernel is twice the convolution square of the truncated nonnegative cosine. -/
theorem odlyzkoKernel_eq_two_mul_convolution (x : ℝ) :
    odlyzkoKernel x = 2 * ∫ t : ℝ,
      (if |t| ≤ 1 / 2 then Real.cos (π * t) else 0) *
      (if |x - t| ≤ 1 / 2 then Real.cos (π * (x - t)) else 0) := sorry

/-- The kernel is nonnegative, as required to drop the prime terms of the explicit formula. -/
theorem odlyzkoKernel_nonneg (x : ℝ) : 0 ≤ odlyzkoKernel x := sorry

/-- The kernel has the normalization required by the explicit formula. -/
theorem odlyzkoKernel_zero : odlyzkoKernel 0 = 1 := sorry

/-- The kernel is even. -/
theorem odlyzkoKernel_neg (x : ℝ) : odlyzkoKernel (-x) = odlyzkoKernel x := sorry

/-- The kernel vanishes at and beyond both endpoints of its support. -/
theorem odlyzkoKernel_eq_zero_of_one_le_abs {x : ℝ} (hx : 1 ≤ |x|) :
    odlyzkoKernel x = 0 := sorry

/-- The kernel is continuously differentiable across zero and the support endpoints. -/
theorem contDiff_odlyzkoKernel : ContDiff ℝ 1 odlyzkoKernel := sorry

/-- The convolution-square kernel is positive definite. -/
theorem isPositiveDefiniteSub_odlyzkoKernel :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ => (odlyzkoKernel x : ℂ) := sorry

/-- The positive-half-line integral is `4 / π²`. -/
theorem integral_odlyzkoKernel_Ioi : (∫ x in Ioi (0 : ℝ), odlyzkoKernel x) = 4 / π ^ 2 := sorry

/-- `x ↦ cosh(ax)/cosh(x/2)` is positive definite for `|a| ≤ 1/2`. -/
theorem isPositiveDefiniteSub_cosh_div_cosh {a : ℝ} (ha : |a| ≤ 1 / 2) :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ =>
      ((Real.cosh (a * x) / Real.cosh (x / 2) : ℝ) : ℂ) := sorry

/-- Positivity of `F = f/cosh(x/2)` on the critical strip. -/
theorem re_poitouTransform_nonneg (f : ℝ → ℝ) (hf_even : ∀ x, f (-x) = f x)
    (hf_cont : Continuous f) (hf_supp : HasCompactSupport f) (hf_nonneg : ∀ x, 0 ≤ f x)
    (hf_pd : TauCeti.IsPositiveDefiniteSub fun x => (f x : ℂ)) {s : ℂ}
    (hs₀ : 0 ≤ s.re) (hs₁ : s.re ≤ 1) :
    0 ≤ (∫ x : ℝ, ((f x / Real.cosh (x / 2) : ℝ) : ℂ) * Complex.exp ((s - 1 / 2) * x)).re :=
  sorry

/-- The test function `F_b(x) = g(x/b)/cosh(x/2)`. -/
def poitouTestFunction (b x : ℝ) : ℝ := odlyzkoKernel (x / b) / Real.cosh (x / 2)

/-- Positive scaling gives an even, normalized, nonnegative `C¹` test function
supported in `[-b,b]`. -/
theorem poitouTestFunction_properties {b : ℝ} (hb : 0 < b) :
    (∀ x, poitouTestFunction b (-x) = poitouTestFunction b x) ∧
      poitouTestFunction b 0 = 1 ∧
      (∀ x, 0 ≤ poitouTestFunction b x) ∧
      (∀ x, b ≤ |x| → poitouTestFunction b x = 0) ∧
      ContDiff ℝ 1 (poitouTestFunction b) := sorry

/-- `P(n, r₁, b) = r₁π/2 + n(γ + log 8π) − n·I₁(b) − r₁·I₂(b) − 16b/π²`: the explicit-formula
lower bound with the zero and prime sums removed. Every integral is parenthesised. -/
def poitouLowerBound (n r₁ : ℕ) (b : ℝ) : ℝ :=
  r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
    - n * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
    - r₁ * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
    - 16 * b / π ^ 2

/-- The apparent sinh singularity at zero and the infinite tail are integrable. -/
theorem integrableOn_poitouIntegrand_sinh {b : ℝ} (hb : 0 < b) :
    IntegrableOn (fun x => (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
      (Ioi (0 : ℝ)) := sorry

/-- The cosh archimedean term is integrable on the positive half-line. -/
theorem integrableOn_poitouIntegrand_cosh {b : ℝ} (hb : 0 < b) :
    IntegrableOn (fun x => (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
      (Ioi (0 : ℝ)) := sorry

/-- The pole contribution in the explicit formula equals the negative term in the bound. -/
theorem poitouLowerBound_eq_explicit (n r₁ : ℕ) {b : ℝ} (hb : 0 < b) :
    poitouLowerBound n r₁ b =
      r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
        - n * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
        - r₁ * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
        - 4 * (∫ x in Ioi (0 : ℝ), poitouTestFunction b x * Real.cosh (x / 2)) := sorry

/-- The sinh integral splits into a compact integral and its exact hyperbolic tail. -/
theorem poitouIntegral_sinh_eq {b : ℝ} (hb : 0 < b) :
    (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))) =
      (∫ x in Ioc (0 : ℝ) b, (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
        - Real.log (Real.tanh (b / 4)) := sorry

/-- At fixed positive scale the totally complex bound divided by degree increases with degree. -/
theorem poitouLowerBound_div_mono {b : ℝ} (hb : 0 < b) {n m : ℕ}
    (hn : 0 < n) (hnm : n ≤ m) :
    poitouLowerBound n 0 b / n ≤ poitouLowerBound m 0 b / m := sorry

/-- Explicit upper bounds `I₁(13/2) < 1.04` and `I₁(8) < 0.94`. -/
theorem poitouIntegral_sinh_lt :
    (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction (13 / 2) x) / (2 * Real.sinh (x / 2))) <
        1.04 ∧
      (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction 8 x) / (2 * Real.sinh (x / 2))) < 0.94 :=
  sorry

/-- The Odlyzko–Poitou unconditional bound. -/
theorem poitouLowerBound_le_log_abs_discr (K : Type*) [Field K] [NumberField K] {b : ℝ}
    (hb : 0 < b) :
    poitouLowerBound (finrank ℚ K) (nrRealPlaces K) b ≤ Real.log |(discr K : ℝ)| := sorry

/-- The root discriminant exceeds ten for totally complex degree at least twenty-four. -/
theorem ten_lt_rootDiscr_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : 24 ≤ finrank ℚ K) : 10 < rootDiscr K := sorry

/-- The root discriminant exceeds twelve for totally complex degree at least thirty-six. -/
theorem twelve_lt_rootDiscr_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : 36 ≤ finrank ℚ K) : 12 < rootDiscr K := sorry

/-- The degree bounds (a)–(j) for totally complex fields used by Schoof's cases. -/
theorem finrank_le_of_rootDiscr_lt_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] :
    (rootDiscr K < 8.25 → finrank ℚ K ≤ 14) ∧ (rootDiscr K < 6.93 → finrank ℚ K ≤ 10) ∧
      (rootDiscr K < 8.95 → finrank ℚ K ≤ 19) ∧ (rootDiscr K < 19.02 → finrank ℚ K ≤ 287) ∧
      (rootDiscr K < 14.43 → finrank ℚ K ≤ 59) ∧ (rootDiscr K ≤ 5.72 → finrank ℚ K ≤ 8) ∧
      (rootDiscr K ≤ 4.48 → finrank ℚ K ≤ 5) ∧ (rootDiscr K ≤ 13.19 → finrank ℚ K ≤ 43) ∧
      (rootDiscr K ≤ 16.83 → finrank ℚ K ≤ 119) ∧ (rootDiscr K ≤ 10.199 → finrank ℚ K ≤ 23) :=
  sorry

/- Finite flat group schemes over arithmetic bases. -/

section GroupSchemes

/-- Finite flat commutative group schemes over `R` (Tau Ceti). -/
abbrev FFGroupSchemeOver (R : Type) [CommRing R] :=
  TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

/-- Finite flat commutative group schemes over `ℤ`. -/
abbrev FFGroupScheme := FFGroupSchemeOver ℤ

/-- Finite flat commutative group schemes over `ℤ[1/l]`. -/
abbrev FFGroupSchemeAway (l : ℕ) := FFGroupSchemeOver (Localization.Away (l : ℤ))

/-- `ℤ[1/l] → ℚ`; with Mathlib's instances it also makes `ℚ̄` a `ℤ[1/l]`-algebra. -/
instance algebraAwayRat (l : ℕ) [NeZero l] : Algebra (Localization.Away (l : ℤ)) ℚ :=
  (IsLocalization.Away.lift (l : ℤ) (g := Int.castRingHom ℚ)
    (isUnit_iff_ne_zero.mpr (by simpa using NeZero.ne l))).toAlgebra

variable {R : Type} [CommRing R] [IsDomain R]

/-- The constant rank over an arithmetic domain, expressed by the coordinate algebra. -/
def order (G : FFGroupSchemeOver R) : ℕ :=
  Module.finrank R (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G)

/-- Isomorphic finite flat group schemes have the same rank. -/
theorem order_congr {G H : FFGroupSchemeOver R} (e : G ≅ H) : order G = order H := sorry

/-- The rank of a constant finite group scheme is the cardinality of its group. -/
theorem order_constant (Γ : Type) [CommGroup Γ] [Finite Γ] :
    order (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme R Γ) = Nat.card Γ := sorry

/-- The rank of `μ_n` is `n`, including when the residue characteristic divides `n`. -/
theorem order_mu (n : ℕ) [NeZero n] :
    order (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme R
      (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod n)))) = n := sorry

/-- Ranks multiply in a native finite flat short exact sequence. -/
theorem order_exact {H G Q : FFGroupSchemeOver R} (i : H ⟶ G) (q : G ⟶ Q)
    (h : TauCeti.CommHopfAlgCat.IsShortExact
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        R).inverse.map q).unop.hom)
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        R).inverse.map i).unop.hom)) : order G = order H * order Q := sorry

/-- `G` is killed by `n`: the `n`-th convolution power of the identity of the coordinate Hopf
algebra is the counit. -/
def IsKilledBy (G : FFGroupSchemeOver R) (n : ℕ) : Prop :=
  WithConv.toConv (AlgHom.id R
    (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G)) ^ n = 1

/-- The underlying morphism of schemes. -/
abbrev schemeHom {G H : FFGroupSchemeOver R} (f : G ⟶ H) :
    G.obj.obj.X.left ⟶ H.obj.obj.X.left :=
  f.hom.hom.hom.hom.left

/-- The constant-rank simplicity condition of FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.1.23, unfolded on the native finite locally free carrier. -/
def IsSimpleGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  order G ≠ 1 ∧ ∀ (M : FFGroupSchemeOver R) (i : M ⟶ G),
    IsClosedImmersion (schemeHom i) → order M = 1 ∨ IsIso i

/-- `G` is constant: isomorphic to Tau Ceti's constant group scheme of a finite abelian group. -/
def IsConstantGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  ∃ (Γ : Type) (_ : CommGroup Γ) (_ : Finite Γ),
    Nonempty (G.obj.obj ≅ TauCeti.ConstantGroup.groupScheme R Γ)

/-- `G` is split diagonalizable: its Cartier dual is constant. -/
def IsDiagonalizableGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  IsConstantGroupScheme (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G)

/-- Every extension `0 → B → E → A → 0` splits. -/
def Ext1Vanishes (A B : FFGroupSchemeOver R) : Prop :=
  ∀ (E : FFGroupSchemeOver R) (i : B ⟶ E) (q : E ⟶ A), TauCeti.CommHopfAlgCat.IsShortExact
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        R).inverse.map q).unop.hom)
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        R).inverse.map i).unop.hom) →
    ∃ s : A ⟶ E, s ≫ q = 𝟙 A

variable [Algebra R ℚ]

/-- The points `G(ℚ̄)`, a commutative group under convolution (Tau Ceti). -/
abbrev points (G : FFGroupSchemeOver R) :=
  WithConv
    (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G →ₐ[R]
      AlgebraicClosure ℚ)

/-- Over a characteristic-zero arithmetic base, annihilation can be tested on geometric points. -/
theorem isKilledBy_iff_mul_zero [IsFractionRing R ℚ] (G : FFGroupSchemeOver R) (n : ℕ) :
    IsKilledBy G n ↔ ∀ x : points G, x ^ n = 1 := sorry

/-- Every multiple of an annihilator also annihilates the group scheme. -/
theorem isKilledBy_mul (G : FFGroupSchemeOver R) {n : ℕ} (hn : IsKilledBy G n) (m : ℕ) :
    IsKilledBy G (m * n) := sorry

/-- The action of `G_ℚ` on `G(ℚ̄)`. -/
def galoisAct (G : FFGroupSchemeOver R) (σ : Field.absoluteGaloisGroup ℚ) (x : points G) :
    points G :=
  WithConv.toConv (((galAut σ).toAlgHom.restrictScalars R).comp x.ofConv)

/-- The coordinate point action respects composition in the absolute Galois group. -/
theorem galoisAct_mul (G : FFGroupSchemeOver R) (σ τ : Field.absoluteGaloisGroup ℚ)
    (x : points G) : galoisAct G (σ * τ) x = galoisAct G σ (galoisAct G τ x) := sorry

omit [IsDomain R] in
/-- Over a Dedekind domain with fraction field `ℚ`, integral simplicity agrees with the
supplier's generic simplicity: nontrivial points and no proper nontrivial Galois-stable subgroup. -/
theorem isSimpleGroupScheme_iff_generic [IsDedekindDomain R] [IsFractionRing R ℚ]
    (G : FFGroupSchemeOver R) :
    IsSimpleGroupScheme G ↔ Nontrivial (points G) ∧
      ∀ H : Subgroup (points G),
        (∀ (σ : Field.absoluteGaloisGroup ℚ) (x : points G), x ∈ H → galoisAct G σ x ∈ H) →
        H = ⊥ ∨ H = ⊤ := sorry

/-- The field `ℚ(G(ℚ̄))` generated by the coordinates of the points of `G`. -/
def torsionField (G : FFGroupSchemeOver R) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ
    {x | ∃ f : TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G →ₐ[R]
      AlgebraicClosure ℚ, x ∈ Set.range f}

/-- The points generate a number field. A finite-image consequence. -/
theorem numberField_torsionField (G : FFGroupSchemeOver R) :
    NumberField (torsionField G) := sorry

/-- The coordinate field is normal and separable over `ℚ`. -/
theorem isGalois_torsionField (G : FFGroupSchemeOver R) : IsGalois ℚ (torsionField G) := sorry

/-- Fixing the coordinate field is equivalent to fixing every geometric point. -/
theorem torsionField_fixingSubgroup (G : FFGroupSchemeOver R)
    (σ : Field.absoluteGaloisGroup ℚ) :
    galAut σ ∈ (torsionField G).fixingSubgroup ↔ ∀ x : points G, galoisAct G σ x = x := sorry

/-- The reversed integral Ext direction has a nonsplit Katz–Mazur extension. -/
theorem ext_zModTwo_muTwo_nonzero : ¬ Ext1Vanishes
    (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ (Multiplicative (ZMod 2)))
    (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
      (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) := sorry

end GroupSchemes

/- The strict discriminant bound for finite-flat torsion fields. -/

/-- Fontaine's bound over `ℤ` (the case `N = 1`): `rd_L < p^{1 + 1/(p − 1)}` for the field of
points of a finite flat group scheme killed by `p`. -/
theorem rootDiscr_torsionField_lt (p : ℕ) [Fact p.Prime] (G : FFGroupScheme)
    [NumberField (torsionField G)] (hG : IsKilledBy G p) :
    rootDiscr (torsionField G) < (p : ℝ) ^ ((1 : ℝ) + 1 / ((p : ℝ) - 1)) := sorry

/-! ## Layer 2: residual representations and the Tate–Serre base case -/

/-- A residual representation: a continuous homomorphism `G_ℚ → GL₂(F)`. -/
abbrev ResidualRep (F : Type*) [Field F] [TopologicalSpace F] :=
  ContinuousMonoidHom (Field.absoluteGaloisGroup ℚ) (GL (Fin 2) F)

/-- Mathlib irreducibility for the natural two-dimensional representation of a subgroup. -/
abbrev IsIrreducibleSubgroup {K : Type*} [Field K] (G : Subgroup (GL (Fin 2) K)) : Prop :=
  Representation.IsIrreducible
    ((Units.coeHom (Module.End K (Fin 2 → K))).comp
      (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp G.subtype))

/-- The subfield `ℚ(ζ_n)` of `ℚ̄`. -/
def cyclotomicSubfield (n : ℕ) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ {x | x ^ n = 1}

/-- Adjoining all roots of a positive power equation in `ℚ̄` gives a number field. -/
theorem numberField_adjoin_roots {n : ℕ} (hn : 0 < n) (a : AlgebraicClosure ℚ) :
    NumberField (IntermediateField.adjoin ℚ {x : AlgebraicClosure ℚ | x ^ n = a}) := by
  have hs : Set.Finite {x : AlgebraicClosure ℚ | x ^ n = a} := by
    simpa only [Polynomial.IsRoot, eval_sub, eval_pow, eval_X, eval_C, sub_eq_zero] using
      (Polynomial.finite_setOfPred_isRoot (Polynomial.X_pow_sub_C_ne_zero hn a))
  let := hs.fintype
  let := IntermediateField.finiteDimensional_adjoin
    (K := ℚ) (S := {x : AlgebraicClosure ℚ | x ^ n = a})
    (fun x _ => Algebra.IsIntegral.isIntegral x)
  exact NumberField.of_module_finite ℚ _

/-- A positive-index cyclotomic subfield is a number field. -/
instance numberField_cyclotomicSubfield (n : ℕ) [NeZero n] :
    NumberField (cyclotomicSubfield n) :=
  numberField_adjoin_roots (Nat.pos_of_ne_zero (NeZero.ne n)) 1

/-- the union of the inertia groups of the primes of `ℚ̄` above `ℓ`; `σ` is in
the inertia group of `P` when `σ x − x ∈ P` for every algebraic integer `x`. -/
def inertiaAbove (ℓ : ℕ) : Set (Field.absoluteGaloisGroup ℚ) :=
  {σ | ∃ P : Ideal (integralClosure ℤ (AlgebraicClosure ℚ)), P.IsMaximal ∧
    (ℓ : integralClosure ℤ (AlgebraicClosure ℚ)) ∈ P ∧
    ∀ x : integralClosure ℤ (AlgebraicClosure ℚ), ∃ y ∈ P,
      (y : AlgebraicClosure ℚ) = galAut σ x - x}

/-- The specified generator matrix of order three over `𝔽₂`. -/
def cubicOrderThreeMatrix : GL (Fin 2) (ZMod 2) :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![0, 1; 1, 1] (by decide)

/-- The maximal real cyclotomic subfield, specified inside `ℚ̄` by sums `ζ + ζ⁻¹`. -/
def realCyclotomicSubfield (n : ℕ) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ {x | ∃ ζ : AlgebraicClosure ℚ, ζ ^ n = 1 ∧ x = ζ + ζ⁻¹}

/-- The specified conductor-eleven equation `y² + y = x³ - x² - 10x - 20`. -/
def x0Eleven : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := -1
  a₃ := 1
  a₄ := -10
  a₆ := -20

/-- The geometric two-torsion of the displayed equation, on Mathlib's existing point group. -/
abbrev X0ElevenTwoTorsion : Type :=
  ↥(AddSubgroup.torsionBy (x0Eleven.baseChange (AlgebraicClosure ℚ)).toAffine.Point 2)

/-- The native scalar action on a subgroup killed by two. -/
instance module_X0ElevenTwoTorsion : Module (ZMod 2) X0ElevenTwoTorsion :=
  AddSubgroup.torsionBy.zmodModule

/-- The specified geometric two-torsion has a two-element basis over `𝔽₂`. -/
theorem x0ElevenTwoTorsion_basis_exists :
    Nonempty (Basis (Fin 2) (ZMod 2) X0ElevenTwoTorsion) := sorry

/-- The coordinate Galois action on the geometric two-torsion, in the chosen basis. -/
def x0ElevenTwoTorsionRep (b : Basis (Fin 2) (ZMod 2) X0ElevenTwoTorsion) :
    ResidualRep (ZMod 2) where
  toFun σ := (Matrix.GeneralLinearGroup.toLin' b).symm
    (LinearMap.GeneralLinearGroup.ofLinearEquiv
      { toFun := fun P =>
          ⟨WeierstrassCurve.Affine.Point.map (W' := x0Eleven.toAffine)
            (galAut σ).toAlgHom P.val, by sorry⟩
        invFun := fun P =>
          ⟨WeierstrassCurve.Affine.Point.map (W' := x0Eleven.toAffine)
            (galAut σ⁻¹).toAlgHom P.val, by sorry⟩
        left_inv := by sorry
        right_inv := by sorry
        map_add' := by sorry
        map_smul' := by sorry })
  map_one' := by sorry
  map_mul' := by sorry
  continuous_toFun := by sorry

/-- The matrix action in the chosen basis agrees with the included coordinate Galois action. -/
theorem x0ElevenTwoTorsionRep_equivariant
    (b : Basis (Fin 2) (ZMod 2) X0ElevenTwoTorsion)
    (σ : Field.absoluteGaloisGroup ℚ) (P : X0ElevenTwoTorsion) :
    (((Matrix.GeneralLinearGroup.toLin' b) (x0ElevenTwoTorsionRep b σ)).toLinearEquiv P).val =
      WeierstrassCurve.Affine.Point.map (W' := x0Eleven.toAffine) (galAut σ).toAlgHom P.val := sorry

section Residual

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- The image of a subgroup `H ⊆ G_ℚ` in `GL₂(F̄)`. -/
def imageOver (ρ : ResidualRep F) (H : Subgroup (Field.absoluteGaloisGroup ℚ)) :
    Subgroup (GL (Fin 2) (AlgebraicClosure F)) :=
  H.map ((Matrix.GeneralLinearGroup.map (algebraMap F (AlgebraicClosure F))).comp
    ρ.toMonoidHom)

/-- `ρ` is irreducible after extending scalars to `F̄`. -/
def IsAbsolutelyIrreducible (ρ : ResidualRep F) : Prop :=
  IsIrreducibleSubgroup (imageOver ρ ⊤)

/-- `det ρ(c) = −1` for every `c ∈ G_ℚ` acting as complex conjugation under
some embedding `ℚ̄ → ℂ`. -/
def IsOdd (ρ : ResidualRep F) : Prop :=
  ∀ (j : AlgebraicClosure ℚ →+* ℂ) (c : Field.absoluteGaloisGroup ℚ),
    (∀ x, j (galAut c x) = starRingEnd ℂ (j x)) →
      ((ρ c : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F).det = -1

/-- the kernel field `ℚ̄^{ker ρ}`. -/
def kernelField (ρ : ResidualRep F) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.fixedField ρ.toMonoidHom.ker

/-- The fixed field of the open finite-image kernel is a number field. -/
theorem numberField_kernelField (ρ : ResidualRep F) : NumberField (kernelField ρ) := sorry

end Residual

section Residual

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- `ρ` is unramified at `ℓ` when every inertia element acts trivially. -/
def IsUnramifiedAt (ℓ : ℕ) (ρ : ResidualRep F) : Prop :=
  ∀ σ ∈ inertiaAbove ℓ, ρ σ = 1

/-- `ρ` is trivial on wild inertia at `p`, that is, the kernel field is tamely
ramified at `p`. -/
def IsTameAt (p : ℕ) (ρ : ResidualRep F) : Prop :=
  ∀ σ ∈ inertiaAbove p, ¬ p ∣ orderOf (ρ σ)

/-- Level one: absolutely irreducible, odd, and unramified outside `p`. -/
def IsLevelOneResidual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsAbsolutelyIrreducible ρ ∧ IsOdd ρ ∧ ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ

/-- The kernel-field form: unramified outside `p` means every prime above `ℓ ≠ p` has
ramification index `1` in the kernel field. -/
theorem isLevelOneResidual_iff_kernelField (p : ℕ) (ρ : ResidualRep F)
    [NumberField (kernelField ρ)] :
    IsLevelOneResidual p ρ ↔
      (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → ∀ P : Ideal (𝓞 (kernelField ρ)), P.IsPrime →
        (ℓ : 𝓞 (kernelField ρ)) ∈ P → P.ramificationIdx ℤ = 1) ∧
      IsAbsolutelyIrreducible ρ ∧ IsOdd ρ := sorry

/-- The level-one predicate is invariant under finite discrete coefficient-field extension. -/
theorem IsLevelOneResidual.map {F' : Type*} [Field F'] [Fintype F'] [TopologicalSpace F']
    [DiscreteTopology F'] (f : F →+* F') {p : ℕ} (ρ : ResidualRep F) (ρ' : ResidualRep F')
    (hmap : ∀ σ, ρ' σ = Matrix.GeneralLinearGroup.map f (ρ σ)) :
    IsLevelOneResidual p ρ' ↔ IsLevelOneResidual p ρ := sorry

/-- The level-one predicate is invariant under a change of basis. -/
theorem IsLevelOneResidual.conj {p : ℕ} {ρ ρ' : ResidualRep F} (g : GL (Fin 2) F)
    (hconj : ∀ σ, ρ' σ = g * ρ σ * g⁻¹) (hρ : IsLevelOneResidual p ρ) :
    IsLevelOneResidual p ρ' := sorry

/-- The conductor-eleven two-torsion is absolutely irreducible but ramified at eleven,
so it fails the level-one condition at two in every chosen basis. -/
theorem not_isLevelOneResidual_X0_eleven_two_torsion
    (b : Basis (Fin 2) (ZMod 2) X0ElevenTwoTorsion) :
    IsAbsolutelyIrreducible (x0ElevenTwoTorsionRep b) ∧
      ¬ IsUnramifiedAt 11 (x0ElevenTwoTorsionRep b) ∧
      ¬ IsLevelOneResidual 2 (x0ElevenTwoTorsionRep b) := sorry

/-- The determinant oddness condition is automatic in characteristic two. -/
theorem isOdd_of_ringChar_two (h : ringChar F = 2) (ρ : ResidualRep F) : IsOdd ρ := sorry

/-- For `p` odd the kernel field of a level-one residual representation is totally complex. -/
theorem IsLevelOneResidual.isTotallyComplex {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2) [CharP F p]
    {ρ : ResidualRep F} (hρ : IsLevelOneResidual p ρ) : IsTotallyComplex (kernelField ρ) :=
  sorry

/-- Every characteristic-two representation satisfies determinant oddness. -/
example [CharP F 2] (ρ : ResidualRep F) : IsOdd ρ := isOdd_of_ringChar_two (ringChar.eq F 2) ρ

/-- The cyclic cubic matrix has no eigenline over `𝔽₂`, but has one over its algebraic closure. -/
theorem cubicOrderThreeMatrix_irreducible_not_absolute : cubicOrderThreeMatrix ^ 3 = 1 ∧
    (∀ v : Fin 2 → ZMod 2, v ≠ 0 → ∀ c : ZMod 2,
      (cubicOrderThreeMatrix : Matrix (Fin 2) (Fin 2) (ZMod 2)).mulVec v ≠ c • v) ∧
    (∃ (v : Fin 2 → AlgebraicClosure (ZMod 2)) (c : AlgebraicClosure (ZMod 2)),
      v ≠ 0 ∧ ((cubicOrderThreeMatrix : Matrix (Fin 2) (Fin 2) (ZMod 2)).map
        (algebraMap (ZMod 2) (AlgebraicClosure (ZMod 2)))).mulVec v = c • v) := sorry

/-- The determinant character of a characteristic-two representation unramified outside two is trivial. -/
theorem det_eq_one_of_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) (σ : Field.absoluteGaloisGroup ℚ) :
    ((ρ σ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F).det = 1 := sorry

/-- A representation unramified outside `p ∈ {2,3}` and tame at `p` is not absolutely irreducible. -/
theorem not_isAbsolutelyIrreducible_of_tame {p : ℕ} (hp : p = 2 ∨ p = 3) [CharP F p]
    (ρ : ResidualRep F) (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ)
    (htame : IsTameAt p ρ) : ¬ IsAbsolutelyIrreducible ρ := sorry

/-- Tate's theorem (oddness is automatic in characteristic `2` and is not assumed). -/
theorem tate_no_levelOne_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) : ¬ IsAbsolutelyIrreducible ρ :=
  sorry

/-- Serre's mod-3 theorem. -/
theorem serre_no_levelOne_char_three [CharP F 3] (ρ : ResidualRep F) :
    ¬ IsLevelOneResidual 3 ρ := sorry

/-- The Tate–Serre base case (DP23, Theorem 1.1). -/
theorem not_isLevelOneResidual_of_le_three {p : ℕ} (hp : p = 2 ∨ p = 3) [CharP F p]
    (ρ : ResidualRep F) : ¬ IsLevelOneResidual p ρ := sorry

end Residual

/-- Irreducible finite subgroups of `SL₂(F̄₂)`: dihedral of order `2r`, `r ≥ 3` odd, with
self-normalising subgroups of order `2`, or conjugate to the embedded `SL₂(K)` for a finite
subfield `K ⊆ F̄₂` of order `q = 2^j ≥ 4`, with group order `q(q² − 1) ≥ 60`. -/
theorem dihedral_or_SL2_of_irreducible_char_two
    (G : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod 2)))) [Finite G]
    (hdet : ∀ g ∈ G, (g : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod 2))).det = 1)
    (hG : IsIrreducibleSubgroup G) :
    (∃ r : ℕ, Odd r ∧ 3 ≤ r ∧ Nonempty (G ≃* DihedralGroup r) ∧
        ∀ Q : Subgroup G, Nat.card Q = 2 → Subgroup.normalizer (Q : Set G) = Q) ∨
      ∃ (j : ℕ) (K : Subfield (AlgebraicClosure (ZMod 2))),
        2 ≤ j ∧ Nat.card K = 2 ^ j ∧ Nat.card G = 2 ^ j * (2 ^ (2 * j) - 1) ∧
        60 ≤ Nat.card G ∧
        ∃ g : GL (Fin 2) (AlgebraicClosure (ZMod 2)),
          ∀ h : GL (Fin 2) (AlgebraicClosure (ZMod 2)), h ∈ G ↔
            ∃ s : Matrix.SpecialLinearGroup (Fin 2) K,
              g * h * g⁻¹ = Matrix.GeneralLinearGroup.map K.subtype
                (Matrix.SpecialLinearGroup.toGL s) := sorry

/-- Irreducible finite subgroups of `GL₂(F̄₃)` with `3 ∣ |G|`. -/
theorem twentyFour_dvd_card_of_irreducible_char_three
    (G : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod 3)))) [Finite G]
    (hG : IsIrreducibleSubgroup G) (h3 : 3 ∣ Nat.card G) :
    (-1 : GL (Fin 2) (AlgebraicClosure (ZMod 3))) ∈ G ∧ 24 ∣ Nat.card G ∧
      (padicValNat 3 (Nat.card G) = 1 ∨ 720 ≤ Nat.card G) := sorry

/-! ## Layer 3: Fontaine's theorem -/

section Fontaine

open TauCeti.AlgebraicGeometry

/-- `A` extends to an abelian scheme over `ℤ`, i.e. a smooth proper group
scheme over `ℤ` with geometrically connected fibres and generic fibre `A`. -/
def HasGoodReductionEverywhere (A : AbelianVariety ℚ) : Prop :=
  ∃ (X : Over (Spec (.of ℤ))) (_ : GrpObj X), IsProper X.hom ∧ Smooth X.hom ∧ GeometricallyConnected X.hom ∧
    Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))).obj X ≅
      A.toOver)

/-- Every finite étale commutative group scheme over `ℤ` is constant. -/
theorem isConstant_of_etale_over_int (G : FFGroupScheme) (hG : Etale G.obj.obj.X.hom) :
    IsConstantGroupScheme G := sorry

/-- A two-ramified Galois field with root discriminant below four has a two-group as Galois group. -/
theorem isPGroup_two_of_rootDiscr_lt_four (L : IntermediateField ℚ (AlgebraicClosure ℚ))
    [NumberField L] [IsGalois ℚ L]
    (hL : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → ¬ (ℓ : ℤ) ∣ discr L)
    (hrd : rootDiscr L < 4) : ∃ k : ℕ, finrank ℚ L = 2 ^ k := sorry

/-- The nonzero simple finite flat 2-group schemes over `ℤ` are `ℤ/2ℤ` and `μ₂`. -/
theorem simple_two_groupScheme_over_int (G : FFGroupScheme) (h2 : ∃ k, order G = 2 ^ k)
    (h0 : order G ≠ 1) (hG : IsSimpleGroupScheme G) :
    Nonempty (G ≅ TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ (Multiplicative (ZMod 2))) ∨ Nonempty (G ≅ TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) := sorry

/-- Every extension `0 → ℤ/2ℤ → E → μ₂ → 0` over `ℤ` splits. -/
theorem ext_muTwo_zModTwo_eq_zero : Ext1Vanishes (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ (Multiplicative (ZMod 2))) := sorry

/-- A finite flat two-group scheme over `ℤ` has a diagonalizable subobject and constant quotient. -/
theorem exists_diagonalizable_constant_filtration (G : FFGroupScheme)
    (h2 : ∃ k, order G = 2 ^ k) :
    ∃ (M C : FFGroupScheme) (i : M ⟶ G) (q : G ⟶ C), TauCeti.CommHopfAlgCat.IsShortExact
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        ℤ).inverse.map q).unop.hom)
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        ℤ).inverse.map i).unop.hom) ∧
      IsDiagonalizableGroupScheme M ∧ IsConstantGroupScheme C ∧
      order M * order C = order G := sorry

/-- the number of `k`-rational points of `A`. -/
def numPoints {k : Type} [Field k] (A : AbelianVariety k) : ℕ :=
  Nat.card (Over.mk (𝟙 (Spec (.of k))) ⟶ A.toOver)

/-- Isogenous abelian varieties over a finite field have the same number of rational points. -/
theorem card_points_eq_of_isogeny {k : Type} [Field k] [Fintype k] {A B : AbelianVariety k}
    (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) : numPoints A = numPoints B := sorry

/-- Fontaine's theorem. -/
theorem dim_eq_zero_of_goodReduction_everywhere (A : AbelianVariety ℚ)
    (hA : HasGoodReductionEverywhere A) : A.dim = 0 := sorry

end Fontaine

/-! ## Layer 4: Schoof's category `D(p, l)` and the field criterion -/

section Schoof

/-- Schoof's category `D(p, l)`: finite flat `p`-group schemes over `ℤ[1/l]` on whose points
every inertia element above `l` satisfies `(σ − 1)² = 0`. -/
def SemistableCategory (p l : ℕ) [NeZero l] : ObjectProperty (FFGroupSchemeAway l) := fun G =>
  (∃ k, order G = p ^ k) ∧
    ∀ σ ∈ inertiaAbove l, ∀ x : points G,
      galoisAct G σ (galoisAct G σ x) * (galoisAct G σ x)⁻¹ ^ 2 * x = 1

variable {p l : ℕ} [hpPrime : Fact p.Prime] [hlPrime : Fact l.Prime]

include hpPrime hlPrime

/-- Closed flat subobjects and quotients inherit the inertia square-zero condition. -/
theorem SemistableCategory.subobject {M G C : FFGroupSchemeAway l} (i : M ⟶ G) (q : G ⟶ C)
    (h : TauCeti.CommHopfAlgCat.IsShortExact
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        (Localization.Away (l : ℤ))).inverse.map q).unop.hom)
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        (Localization.Away (l : ℤ))).inverse.map i).unop.hom)) (hG : SemistableCategory p l G) :
    SemistableCategory p l M ∧ SemistableCategory p l C := sorry

/-- Finite products inherit the inertia square-zero condition. -/
theorem SemistableCategory.prod {G G' P : FFGroupSchemeAway l} (π₁ : P ⟶ G) (π₂ : P ⟶ G')
    (hP : IsLimit (BinaryFan.mk π₁ π₂)) (hG : SemistableCategory p l G)
    (hG' : SemistableCategory p l G') : SemistableCategory p l P := sorry

/-- At distinct primes, Cartier duality preserves the inertia square-zero condition. -/
theorem SemistableCategory.cartierDual (hpl : p ≠ l) {G : FFGroupSchemeAway l}
    (hG : SemistableCategory p l G) :
    SemistableCategory p l
      (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual _ G) := sorry

/-- Inertia acts trivially after the power killing the geometric point module. -/
theorem SemistableCategory.inertia_pow {G : FFGroupSchemeAway l} (hG : SemistableCategory p l G)
    {k : ℕ} (hk : IsKilledBy G (p ^ k)) :
    ∀ σ ∈ inertiaAbove l, ∀ x : points G, galoisAct G (σ ^ p ^ k) x = x := sorry

/-- An extension with inertia-trivial endpoints has inertia square zero. -/
theorem SemistableCategory.of_extension {G₂ G G₁ : FFGroupSchemeAway l} (i : G₂ ⟶ G)
    (q : G ⟶ G₁) (h : TauCeti.CommHopfAlgCat.IsShortExact
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        (Localization.Away (l : ℤ))).inverse.map q).unop.hom)
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        (Localization.Away (l : ℤ))).inverse.map i).unop.hom)) (hord : ∃ k, order G = p ^ k)
    (h₁ : ∀ σ ∈ inertiaAbove l, ∀ x : points G₁, galoisAct G₁ σ x = x)
    (h₂ : ∀ σ ∈ inertiaAbove l, ∀ x : points G₂, galoisAct G₂ σ x = x) :
    SemistableCategory p l G := sorry

/- The two concrete integral examples `not_mem_semistableCategory_quadratic_twist` and
`X0_eleven_two_torsion_mem` are specified, with their absent construction interfaces, in the
closing comment. -/

/-- `Ext¹_{ℤ[1/l]}(μ_p, ℤ/pℤ) = 0` for `p ∈ {2, 3}`, `l ≠ p`, unless `l ≡ ±1 (mod 8)` when
`p = 2`, or `l ≡ ±1 (mod 9)` when `p = 3`; in particular for `(l, p) = (2, 3), (3, 2), (5, 2),
(7, 3), (13, 2)`. (The one-dimensional exceptional case is not stated.) -/
theorem ext_muP_zModP_eq_zero (hp : p = 2 ∨ p = 3) (hlp : l ≠ p)
    (hl : if p = 2 then l % 8 ≠ 1 ∧ l % 8 ≠ 7 else l % 9 ≠ 1 ∧ l % 9 ≠ 8) :
    Ext1Vanishes (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme (Localization.Away (l : ℤ)) (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod p))))
      (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme (Localization.Away (l : ℤ)) (Multiplicative (ZMod p))) := sorry

end Schoof

/-- Schoof's field criterion for `(l, p)`: with `F` the degree-`p` subfield of `ℚ(ζ_l)` if
`p ∣ l − 1` and `F = ℚ` otherwise, and `M = F(ζ_{2p}, l^{1/p})`, every finite Galois `L ⊇ M`
unramified over `M` outside `p` with `v_p(δ_L) < 1 + 1/(p − 1)` has `[L : ℚ(ζ_p)]` a power of
`p`. Unramifiedness of `L/M` at a prime is "inertia meets `G_M` inside `G_L`". -/
def FieldCriterion (l p : ℕ) : Prop :=
  ∀ (F M L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L],
    (if p ∣ l - 1 then F ≤ cyclotomicSubfield l ∧ finrank ℚ F = p else F = ⊥) →
    M = F ⊔ cyclotomicSubfield (2 * p) ⊔
      IntermediateField.adjoin ℚ {x | x ^ p = (l : AlgebraicClosure ℚ)} →
    IsGalois ℚ L → M ≤ L →
    (∀ q : ℕ, q.Prime → q ≠ p → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ M.fixingSubgroup → galAut σ ∈ L.fixingSubgroup) →
    (padicValInt p (discr L) : ℝ) / finrank ℚ L < 1 + 1 / ((p : ℝ) - 1) →
    ∃ k : ℕ, finrank ℚ L = (p - 1) * p ^ k

/-- Schoof's Proposition 5.1: the field criterion forces the simple objects of `D(p, l)` to be
`ℤ/pℤ` and `μ_p`. -/
theorem simple_eq_of_fieldCriterion (l p : ℕ) [Fact l.Prime] [Fact p.Prime] (hlp : l ≠ p)
    (h : FieldCriterion l p) (G : FFGroupSchemeAway l) (hG : SemistableCategory p l G)
    (hs : IsSimpleGroupScheme G) (h0 : order G ≠ 1) :
    Nonempty (G ≅ TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme _ (Multiplicative (ZMod p))) ∨ Nonempty (G ≅ TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme _ (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod p)))) := sorry

/-- Class number one for `ℚ(ζ₃, ∛2)`, `ℚ(ζ₁₂)`, `ℚ(i, √5)` and `ℚ(i, √13)`. -/
theorem classNumber_eq_one_small_fields :
    (∀ (K : Type) [Field K] [NumberField K] [IsSplittingField ℚ K (X ^ 3 - 2 : ℚ[X])],
        classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K] [IsCyclotomicExtension {12} ℚ K],
        classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K]
        [IsSplittingField ℚ K ((X ^ 2 + 1) * (X ^ 2 - 5) : ℚ[X])], classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K]
        [IsSplittingField ℚ K ((X ^ 2 + 1) * (X ^ 2 - 13) : ℚ[X])], classNumber K = 1) :=
  sorry

/-- The actual auxiliary field `ℚ(ζ₃, ∛2)`, as a subfield of `ℚ̄`. -/
def schoofFieldTwoThree : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  cyclotomicSubfield 3 ⊔ IntermediateField.adjoin ℚ {x | x ^ 3 = (2 : AlgebraicClosure ℚ)}

/-- The actual auxiliary field `ℚ(ζ₁₂)`. -/
def schoofFieldThreeTwo : IntermediateField ℚ (AlgebraicClosure ℚ) := cyclotomicSubfield 12

/-- The actual auxiliary field `ℚ(i, √5)`. -/
def schoofFieldFiveTwo : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  cyclotomicSubfield 4 ⊔ IntermediateField.adjoin ℚ {x | x ^ 2 = (5 : AlgebraicClosure ℚ)}

/-- The radical-cyclotomic compositum is finite over `ℚ`. -/
instance numberField_schoofFieldTwoThree : NumberField schoofFieldTwoThree := by
  let := numberField_adjoin_roots (by decide : 0 < 3) (2 : AlgebraicClosure ℚ)
  change NumberField ((cyclotomicSubfield 3 ⊔
    IntermediateField.adjoin ℚ {x | x ^ 3 = (2 : AlgebraicClosure ℚ)}) :
      IntermediateField ℚ (AlgebraicClosure ℚ))
  exact NumberField.of_module_finite ℚ _

/-- The twelfth cyclotomic auxiliary field is finite over `ℚ`. -/
instance numberField_schoofFieldThreeTwo : NumberField schoofFieldThreeTwo :=
  inferInstanceAs (NumberField (cyclotomicSubfield 12))

/-- The biquadratic auxiliary field is finite over `ℚ`. -/
instance numberField_schoofFieldFiveTwo : NumberField schoofFieldFiveTwo := by
  let := numberField_adjoin_roots (by decide : 0 < 2) (5 : AlgebraicClosure ℚ)
  change NumberField ((cyclotomicSubfield 4 ⊔
    IntermediateField.adjoin ℚ {x | x ^ 2 = (5 : AlgebraicClosure ℚ)}) :
      IntermediateField ℚ (AlgebraicClosure ℚ))
  exact NumberField.of_module_finite ℚ _

/-- `(l, p) = (2, 3)`: the criterion; its stronger field conclusion follows below. -/
theorem fieldCriterion_two_three : FieldCriterion 2 3 := sorry

/-- Every admissible Galois `L` equals the specified degree-six field `ℚ(ζ₃, ∛2)`.
The inertia premise is relative unramifiedness of `L/M` away from `3`. -/
theorem fieldCriterion_two_three_eq_auxiliaryField
    (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L]
    (hG : IsGalois ℚ L) (hM : schoofFieldTwoThree ≤ L)
    (hunram : ∀ q : ℕ, q.Prime → q ≠ 3 → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ schoofFieldTwoThree.fixingSubgroup → galAut σ ∈ L.fixingSubgroup)
    (hdisc : (padicValInt 3 (discr L) : ℝ) / finrank ℚ L < 3 / 2) :
    L = schoofFieldTwoThree ∧ finrank ℚ L = 6 := sorry

/-- `(l, p) = (3, 2)`: the criterion; its exact degree possibilities follow below. -/
theorem fieldCriterion_three_two : FieldCriterion 3 2 := sorry

/-- A finite Galois `L ⊇ ℚ(ζ₁₂)`, relatively unramified away from `2` with strict normalized
two-adic discriminant exponent below `2`, has absolute degree `4` or `8`. -/
theorem fieldCriterion_three_two_degree
    (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L]
    (hG : IsGalois ℚ L) (hM : schoofFieldThreeTwo ≤ L)
    (hunram : ∀ q : ℕ, q.Prime → q ≠ 2 → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ schoofFieldThreeTwo.fixingSubgroup → galAut σ ∈ L.fixingSubgroup)
    (hdisc : (padicValInt 2 (discr L) : ℝ) / finrank ℚ L < 2) :
    finrank ℚ L = 4 ∨ finrank ℚ L = 8 := sorry

/-- `(l, p) = (5, 2)`: the criterion; its exact degree possibilities follow below. -/
theorem fieldCriterion_five_two : FieldCriterion 5 2 := sorry

/-- A finite Galois `L ⊇ ℚ(i, √5)`, relatively unramified away from `2` with strict normalized
two-adic discriminant exponent below `2`, has absolute degree `4`, `8` or `16`. -/
theorem fieldCriterion_five_two_degree
    (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L]
    (hG : IsGalois ℚ L) (hM : schoofFieldFiveTwo ≤ L)
    (hunram : ∀ q : ℕ, q.Prime → q ≠ 2 → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ schoofFieldFiveTwo.fixingSubgroup → galAut σ ∈ L.fixingSubgroup)
    (hdisc : (padicValInt 2 (discr L) : ℝ) / finrank ℚ L < 2) :
    finrank ℚ L = 4 ∨ finrank ℚ L = 8 ∨ finrank ℚ L = 16 := sorry

/-- `(l, p) = (7, 3)`: `M = ℚ(ζ₃, ζ₇ + ζ₇⁻¹, ∛7)`, of degree `18`. -/
theorem fieldCriterion_seven_three : FieldCriterion 7 3 := sorry

/-- `(l, p) = (13, 2)`: `M = ℚ(i, √13)`. -/
theorem fieldCriterion_thirteen_two : FieldCriterion 13 2 := sorry

/-- The simple order-four torsion of J₀(11) rules out the field criterion at eleven. -/
theorem not_fieldCriterion_eleven_two : ¬ FieldCriterion 11 2 := sorry

/-! ## Layer 5: GL₂-type abelian varieties and the terminal weights -/

section Terminal

open TauCeti.AlgebraicGeometry

/-- `End⁰(A) = ℚ ⊗ End(A)`, on Tau Ceti's `AbelianVariety.End`. -/
abbrev endZeroAlgebra {F : Type} [Field F] (A : AbelianVariety F) : Type :=
  ℚ ⊗[ℤ] A.End

/-- A chosen F-rational unital K-action with degree equal to the dimension of A. -/
structure GL2TypeAction {F : Type} [Field F] [NumberField F] (A : AbelianVariety F)
    (K : Type) [Field K] [NumberField K] where
  action : K →+* endZeroAlgebra A
  dim_eq : (finrank ℚ K : WithBot ℕ∞) = A.dim

/-- A admits GL₂(K)-type data, without a chosen coefficient action. -/
def IsGL2Type {F : Type} [Field F] [NumberField F] (A : AbelianVariety F) (K : Type) [Field K]
    [NumberField K] : Prop := Nonempty (GL2TypeAction A K)

/-- An isogeny has a rational conjugation isomorphism, characterized by an integral
quasi-inverse whose two composites are multiplication by the same positive integer. -/
theorem endZeroIsogeny_exists {F : Type} [Field F] [NumberField F] {A B : AbelianVariety F}
    (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) :
    ∃ e : endZeroAlgebra A ≃+* endZeroAlgebra B,
      ∃ (n : ℕ) (g : B ⟶ A), 0 < n ∧
        f ≫ g = AbelianVariety.mulBy A (n : ℤ) ∧
        g ≫ f = AbelianVariety.mulBy B (n : ℤ) ∧
        ∀ x : A.End, e (1 ⊗ₜ[ℤ] x) =
          (1 / (n : ℚ)) ⊗ₜ[ℤ] AbelianVariety.End.ofHom (g ≫ x.toHom ≫ f) := sorry

/-- Conjugation by an F-isogeny on rational endomorphism algebras. -/
def endZeroIsogeny {F : Type} [Field F] [NumberField F] {A B : AbelianVariety F}
    (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) :
    endZeroAlgebra A ≃+* endZeroAlgebra B :=
  (endZeroIsogeny_exists f hf).choose

/-- The chosen conjugation map satisfies the quasi-inverse characterization. -/
theorem endZeroIsogeny_characterization {F : Type} [Field F] [NumberField F]
    {A B : AbelianVariety F} (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) :
    ∃ (n : ℕ) (g : B ⟶ A), 0 < n ∧
      f ≫ g = AbelianVariety.mulBy A (n : ℤ) ∧
      g ≫ f = AbelianVariety.mulBy B (n : ℤ) ∧
      ∀ x : A.End, endZeroIsogeny f hf (1 ⊗ₜ[ℤ] x) =
        (1 / (n : ℚ)) ⊗ₜ[ℤ] AbelianVariety.End.ofHom (g ≫ x.toHom ≫ f) :=
  (endZeroIsogeny_exists f hf).choose_spec

/-- Base change of rational endomorphisms to a finite extension. -/
def endZeroBaseChange {F : Type} [Field F] [NumberField F] (A : AbelianVariety F)
    (F' : Type) [Field F'] [NumberField F'] [Algebra F F'] :
    endZeroAlgebra A →+* endZeroAlgebra (A.baseChange F') :=
  (Algebra.TensorProduct.map (AlgHom.id ℤ ℚ)
    (AbelianVariety.End.baseChange A F').toIntAlgHom).toRingHom

/-- Rational base change sends a pure tensor to the tensor of its base-changed endomorphism. -/
theorem endZeroBaseChange_tmul {F : Type} [Field F] [NumberField F] (A : AbelianVariety F)
    (F' : Type) [Field F'] [NumberField F'] [Algebra F F'] (q : ℚ) (x : A.End) :
    endZeroBaseChange A F' (q ⊗ₜ[ℤ] x) =
      q ⊗ₜ[ℤ] AbelianVariety.End.baseChange A F' x := sorry

/-- The marked coefficient action transported by isogeny conjugation. -/
def GL2TypeAction.isogeny {F : Type} [Field F] [NumberField F] {A B : AbelianVariety F}
    {K : Type} [Field K] [NumberField K] (h : GL2TypeAction A K)
    (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) : GL2TypeAction B K where
  action := (endZeroIsogeny f hf).toRingHom.comp h.action
  dim_eq := sorry

/-- The marked coefficient action transported by base change. -/
def GL2TypeAction.baseChange {F : Type} [Field F] [NumberField F] {A : AbelianVariety F}
    {K : Type} [Field K] [NumberField K] (h : GL2TypeAction A K)
    (F' : Type) [Field F'] [NumberField F'] [Algebra F F'] : GL2TypeAction (A.baseChange F') K where
  action := (endZeroBaseChange A F').comp h.action
  dim_eq := sorry

/-- Existence of a GL₂(K)-type action is preserved by an F-isogeny. -/
theorem IsGL2Type.isogeny {F : Type} [Field F] [NumberField F] {A B : AbelianVariety F}
    {K : Type} [Field K] [NumberField K] (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f)
    (h : IsGL2Type A K) : IsGL2Type B K :=
  ⟨h.some.isogeny f hf⟩

/-- Existence of a GL₂(K)-type action is preserved by finite base change. -/
theorem IsGL2Type.baseChange {F : Type} [Field F] [NumberField F] {A : AbelianVariety F}
    {K : Type} [Field K] [NumberField K] (h : IsGL2Type A K) (F' : Type) [Field F']
    [NumberField F'] [Algebra F F'] : IsGL2Type (A.baseChange F') K :=
  ⟨h.some.baseChange F'⟩

/-- A dimension-one abelian variety over `ℚ` admits a GL₂(ℚ)-type action. -/
theorem isGL2Type_ellipticCurve (A : AbelianVariety ℚ) (hA : A.dim = 1) : IsGL2Type A ℚ := sorry

/- `isGL2Type_J0_23` needs the actual modular Jacobian and its Hecke action, as specified in
the closing comment.  -/

/-- A dimension-zero abelian variety admits no GL₂-type action by a number field. -/
theorem isGL2Type_zero (A : AbelianVariety ℚ) (hA : A.dim = 0) (K : Type) [Field K] [NumberField K] :
    ¬ IsGL2Type A K := sorry

/-- Class number one for the six non-cyclotomic quadratic cases `p ∈ {7,11,19,43,67,163}`. -/
theorem classNumber_sqrt_neg_prime_eq_one :
    ∀ p ∈ ({7, 11, 19, 43, 67, 163} : Finset ℕ), ∀ (K : Type) [Field K] [NumberField K]
      [IsSplittingField ℚ K (X ^ 2 + C (p : ℚ))], classNumber K = 1 := sorry

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- Snowden's (A1) for a residual representation: absolutely irreducible on `G_{ℚ(ζ_p)}`. -/
def SatisfiesA1Residual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsIrreducibleSubgroup (imageOver ρ (cyclotomicSubfield p).fixingSubgroup)

/-- Restriction to `ℚ(ζ₂) = ℚ` makes (A1) ordinary absolute irreducibility. -/
theorem satisfiesA1Residual_two_iff (ρ : ResidualRep F) :
    SatisfiesA1Residual 2 ρ ↔ IsAbsolutelyIrreducible ρ := sorry

open scoped MatrixGroups in
/-- The terminal weights have zero-dimensional level-one cusp spaces. -/
theorem terminal_cuspForm_rank_eq_zero (k : ℤ) (hk : k ∈ ({2, 4, 6, 8, 14} : Finset ℤ)) :
    Module.rank ℂ (CuspForm 𝒮ℒ k) = 0 := sorry

end Terminal

end TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

/-
Additional mathematical targets specified in the README:
* §1.0: dedekindZeta_explicitFormula, including zero location and grouped convergence for
  the trivial-character Dedekind-zeta function supplied by ArithmeticGaloisRepresentations §2.7;
  identify its Euler product with the ArithmeticDirichletSeries presentation.
* §§1.2–1.3: wild Borel normal form and the cubic power maps on local units.
* §1.10: ext1Vanishes_iff_all_split and the functoriality of the finite-flat predicates.
* §§2.0–2.1: the continuous cyclotomic characters, oneAddCyclotomic, realCubicModTwo,
  its coordinate action,
  and coefficient/twist specializations of ArithmeticGaloisRepresentations. The coefficient-invariance
  API specialization is isLevelOneResidual_map; its positive control is the conductor-eleven
  S₃ action after extension to 𝔽₄. The cubic and conductor-eleven negative controls are
  not_isAbsolutelyIrreducible_cyclic_cubic_mod_two and
  not_isLevelOneResidual_X0_eleven_two_torsion.
* §§4.1–4.2: torsion_mem_semistableCategory, the marked quadratic-twist and J₀(11)[2] controls,
  IsIteratedExtensionOf, isConstant_baseChange_cyclotomic, isDiagonalizable_baseChange_cyclotomic,
  no_semistable_of_simple_and_ext and no_semistable_abelianVariety_one_prime.
* §5.0d: AutomorphicSystemData for arbitrary number fields and ranks, with finite local
  realization fields and no compatibility asserted by the raw carrier; its coefficient extension,
  conjugation, restriction, sum, tensor, dual and Tate-twist operations and identity/composition laws.
  ArithmeticCompatibleFamily is its rank-two, base-ℚ specialization with chosen completion models
  and separate compatibility predicates. The normalized reciprocal polynomial converts geometric
  to arithmetic Frobenius; invert the WD Frobenius matrix while retaining inertia and N.
  Hodge-label sign conversion leaves the representation unchanged.
  The finite-exception WD condition does not imply the pairwise almost-strict condition without
  every required comparison, including the odd unramified coefficient-prime comparisons.
* §§5.0–5.4: minimal lifts and compatible families, potential modularity;
  weightTwo_solvable_descent for solvable Galois E/F of totally real number fields and a
  continuous rank-two p-adic representation with absolutely irreducible restriction matched
  by a cuspidal parallel weight-two Hilbert eigenform. Construct the intermediate weight-two
  Hilbert Galois attachments, coefficient descent, good-prime polynomials and restriction
  compatibility, and choose the finite quotient character matching the given representation
  at each step. The conditional family descent of R17.6.18–R17.6.19 additionally requires
  its compatible families and common twist index. The geometric Hecke
  eigensummand, shimuraCurve_picard_correspondences (unpointed Pic⁰ descent and
  push–pull after smooth proper compactification, using the curve–Jacobian Tate comparison
  of InverseGaloisAndArithmeticFundamentalGroups IG.0.T1) and Weil-restriction endomorphism comparison;
  GL2TypeAction.lambdaAdicRep and GL2TypeAction.finrank_lambdaAdicRep specialize
  ArithmeticGaloisRepresentations §6.4 / TateModule.lambdaTateModule; GL2TypeAction.free_tateModule
  specializes AbelianSchemesAndArithmeticModuli A6.12 / traceDegreeSubfield, all for the input
  h : GL2TypeAction A K and its chosen action. The lambda factor agrees K-equivariantly with
  TateModule.lambdaTateModule for that action and coefficient embedding, under the marked
  isogeny and base-change transports. The realization interfaces are
  ComesFromGL2Type and gl2Type_equivariant_weilDeligne, retaining the marked K-action and
  comparing inertia triviality and monodromy ranks in every conjugate factor, also at the
  residue characteristic;
  comesFromGL2Type_of_restrict, comesFromGL2Type_of_weightTwo and reduction_of_comesFromGL2Type.
* §§5.6–5.12: levelOne_dihedral_classification, no_levelOne_crystalline_of_reducible_terminal,
  not_levelOne_weight_two, not_levelOne_weight_succ_of_schoofPrime, weight_fourteen_eleven_twist,
  not_levelOne_small_weight; modularity_transfer_at_five for an odd continuous finitely
  ramified 5-adic representation, de Rham of weights {0,k−1}, k≥2, with a stable lattice,
  modular reduction and absolute irreducibility on G_{ℚ(ζ₅)}. The target paso_six carries
  those hypotheses for the original 5-adic member, obtains residual modularity from the
  new minimal lift's family, applies modularity_transfer_at_five, and only then propagates
  within the original family by common Frobenius polynomials. The local specialization
  ordinary_terminal_local applies LocalGaloisDeformationRings §0.3 / RankTwoOrdinaryEndpoints
  and §§5.4–5.5 at the five stated pairs. §6: the mathematical conjunction baseCases_holds.
-/
