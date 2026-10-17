/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.PositiveDefinite.AddGroup
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.ConstantGroup.Scheme
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Constant
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Quotient.Kernel.Exact
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic

/-!
# SmallRamificationAndAbelianVarietyBaseCases: representative target signatures

The roadmap is `README.md`. This file records definitions and theorem signatures statable
against the pinned APIs and is not exhaustive. It uses finite discrete coefficient fields,
absolute irreducibility, the different normalised by the ramification index, and the
subobject-first convention for extensions. The integral finite-flat category and abelian
varieties are Tau Ceti's objects. The examples distinguish the native constant and multiplicative models, the cubic matrix,
and the analytic normalisations. Representation constructions are specified in the README.
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

/-- The convolution-square kernel is positive definite. -/
theorem isPositiveDefiniteSub_odlyzkoKernel :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ => (odlyzkoKernel x : ℂ) := sorry

/-- The positive-half-line integral is `4 / π²`. -/
theorem integral_odlyzkoKernel_Ioi : (∫ x in Ioi (0 : ℝ), odlyzkoKernel x) = 4 / π ^ 2 := sorry

/-- `odlyzkoKernel_zero` (computation): `g(0) = 1`, the normalisation `F(0) = 1`. -/
example : odlyzkoKernel 0 = 1 := sorry

/-- `odlyzkoKernel_half` (computation): `g(1/2) = 1/π`. -/
example : odlyzkoKernel (1 / 2) = 1 / π := sorry

/-- `odlyzkoKernel_three_quarters_pos` (non-example): `g(3/4) > 0`; the variant without the
sine term is negative there. -/
example : 0 < odlyzkoKernel (3 / 4) := sorry

/-- `odlyzkoKernel_one` (degenerate): the support is `[−1, 1]`. -/
example : odlyzkoKernel 1 = 0 ∧ odlyzkoKernel 2 = 0 := sorry

/-- `integral_odlyzkoKernel_Ioi` (computation): `∫₀^∞ g = 4/π²`; the variant with `sin π|x|` in
place of `sin π|x| / π` integrates to `2/π² + 2/π`. -/
example : (∫ x in Ioi (0 : ℝ), odlyzkoKernel x) = 4 / π ^ 2 := sorry

/-- `odlyzkoKernel_neg_half` (non-example): `g(−1/2) = 1/π`; the variant with `sin πx / π` is
not even and gives `−1/π`. -/
example : odlyzkoKernel (-(1 / 2)) = 1 / π := sorry

/-- `x ↦ cosh(ax)/cosh(x/2)` is positive definite for `|a| ≤ 1/2`. -/
theorem isPositiveDefiniteSub_cosh_div_cosh {a : ℝ} (ha : |a| ≤ 1 / 2) :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ =>
      ((Real.cosh (a * x) / Real.cosh (x / 2) : ℝ) : ℂ) := sorry

/-- The Fourier-normalized exponential density has total mass one. -/
example {c : ℝ} (hc : 0 < c) :
    (∫ t : ℝ, π * c * Real.exp (-(2 * π * c * |t|))) = 1 := sorry

/-- Its Fourier integral at zero is one. -/
example {c : ℝ} (hc : 0 < c) :
    (∫ t : ℝ, Complex.exp (-2 * (π : ℂ) * Complex.I * t * 0) *
      ((π * c * Real.exp (-(2 * π * c * |t|)) : ℝ) : ℂ)) = 1 := sorry

/-- At frequency `c` the normalized Fourier integral is one half. -/
example {c : ℝ} (hc : 0 < c) :
    (∫ t : ℝ, Complex.exp (-2 * (π : ℂ) * Complex.I * t * c) *
      ((π * c * Real.exp (-(2 * π * c * |t|)) : ℝ) : ℂ)) = 1 / 2 := sorry

/-- Both endpoint cosh quotients are the constant one. -/
example (x : ℝ) : Real.cosh ((1 / 2) * x) / Real.cosh (x / 2) = 1 ∧
    Real.cosh ((-(1 / 2)) * x) / Real.cosh (x / 2) = 1 := sorry

/-- Positivity of `F = f/cosh(x/2)` on the critical strip. -/
theorem re_poitouTransform_nonneg (f : ℝ → ℝ) (hf_even : ∀ x, f (-x) = f x)
    (hf_cont : Continuous f) (hf_supp : HasCompactSupport f) (hf_nonneg : ∀ x, 0 ≤ f x)
    (hf_pd : TauCeti.IsPositiveDefiniteSub fun x => (f x : ℂ)) {s : ℂ}
    (hs₀ : 0 ≤ s.re) (hs₁ : s.re ≤ 1) :
    0 ≤ (∫ x : ℝ, ((f x / Real.cosh (x / 2) : ℝ) : ℂ) * Complex.exp ((s - 1 / 2) * x)).re :=
  sorry

/-- The test function `F_b(x) = g(x/b)/cosh(x/2)`. -/
def poitouTestFunction (b x : ℝ) : ℝ := odlyzkoKernel (x / b) / Real.cosh (x / 2)

/-- For positive scale the test function is one at zero. -/
example {b : ℝ} (hb : 0 < b) : poitouTestFunction b 0 = 1 := sorry

/-- The scaled endpoint and exterior point both vanish. -/
example {b : ℝ} (hb : 0 < b) : poitouTestFunction b b = 0 ∧
    poitouTestFunction b (2 * b) = 0 := sorry

/-- The half-scale value fixes the denominator and sine normalisation. -/
example {b : ℝ} (hb : 0 < b) :
    poitouTestFunction b (b / 2) = 1 / (π * Real.cosh (b / 4)) := sorry


/-- `P(n, r₁, b) = r₁π/2 + n(γ + log 8π) − n·I₁(b) − r₁·I₂(b) − 16b/π²`: the explicit-formula
lower bound with the zero and prime sums removed. Every integral is parenthesised. -/
def poitouLowerBound (n r₁ : ℕ) (b : ℝ) : ℝ :=
  r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
    - n * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
    - r₁ * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
    - 16 * b / π ^ 2

/-- Explicit upper bounds `I₁(13/2) < 1.04` and `I₁(8) < 0.94`. -/
theorem poitouIntegral_sinh_lt :
    (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction (13 / 2) x) / (2 * Real.sinh (x / 2))) <
        1.04 ∧
      (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction 8 x) / (2 * Real.sinh (x / 2))) < 0.94 :=
  sorry

/-- `poitouLowerBound_rat_nonpos` (computation): for `ℚ` the bound is nonpositive at
`b ∈ {1/2, 1, 2}` (numerically `−0.051`, `−0.083`, `−0.883`). -/
example : ∀ b ∈ ({1 / 2, 1, 2} : Set ℝ), poitouLowerBound 1 1 b ≤ 0 := sorry

/-- `poitouLowerBound_sqrt_neg_three` (computation): `ℚ(√−3)` has `|d| = 3`; the reversed pole
sign would violate this. -/
example : poitouLowerBound 2 0 1 ≤ Real.log 3 := sorry

/-- `poitouLowerBound_sqrt_five` (computation): `ℚ(√5)` has `|d| = 5`; this checks the `r₁`
terms. -/
example : poitouLowerBound 2 2 (3 / 2) ≤ Real.log 5 := sorry

/-- `poitouLowerBound_div_mono` (degenerate): at fixed `b > 0` the normalised bound tends to
`γ + log 8π − I₁(b)`, which lies below `log(4πe^γ)`. -/
example {b : ℝ} (hb : 0 < b) :
    Tendsto (fun n : ℕ => poitouLowerBound n 0 b / n) atTop
      (𝓝 (Real.eulerMascheroniConstant + Real.log (8 * π) -
        (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))))) ∧
    Real.eulerMascheroniConstant + Real.log (8 * π) -
        (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))) <
      Real.log (4 * π * Real.exp Real.eulerMascheroniConstant) := sorry

/-- `poitouLowerBound_one_one_one_bounds` (computation): `−0.09 < P(1, 1, 1) < −0.08`; the
variants with `log 4π` or without `r₁π/2` fail the lower bound. -/
example : -0.09 < poitouLowerBound 1 1 1 ∧ poitouLowerBound 1 1 1 < -0.08 := sorry

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

/-- `G` is diagonalizable: its Cartier dual is constant. -/
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

/-- The action of `G_ℚ` on `G(ℚ̄)`. -/
def galoisAct (G : FFGroupSchemeOver R) (σ : Field.absoluteGaloisGroup ℚ) (x : points G) :
    points G :=
  WithConv.toConv (((galAut σ).toAlgHom.restrictScalars R).comp x.ofConv)

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

/-- The trivial group scheme is excluded by the nonzero simple-object convention. -/
example : ¬ IsSimpleGroupScheme (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ (Multiplicative (ZMod 1))) := sorry

/-- The two order-two group schemes over `ℤ` are nonzero simple objects. -/
example : IsSimpleGroupScheme (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ (Multiplicative (ZMod 2))) ∧ IsSimpleGroupScheme (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) := sorry

/-- Rank is distinct from the number of characteristic-two geometric points. -/
example : order (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
    (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) = 2 := sorry

/-- The identity group has rank one, and the constant Klein four group has rank four. -/
example : order (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
    (Multiplicative (ZMod 1))) = 1 ∧
    order (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
      (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) = 4 := sorry

/-- The constant Klein four group has a proper nontrivial closed flat subgroup. -/
example : ¬ IsSimpleGroupScheme (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
    (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) := sorry

/-- Multiplication by two kills both integral order-two models. -/
example : IsKilledBy (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
    (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) 2 ∧
    IsKilledBy (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
      (Multiplicative (ZMod 2))) 2 := sorry

/-- Multiplication by zero kills every finite flat commutative group scheme. -/
example (G : FFGroupSchemeOver R) : IsKilledBy G 0 := by
  simp [IsKilledBy]

/-- The identity group is killed by every natural number. -/
example (n : ℕ) : IsKilledBy (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
    (Multiplicative (ZMod 1))) n := sorry

/-- Prime-square constant torsion is killed by the square, but not by the prime. -/
example : IsKilledBy (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
    (Multiplicative (ZMod 4))) 4 ∧
    ¬ IsKilledBy (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
      (Multiplicative (ZMod 4))) 2 := sorry

/-- The constant and multiplicative integral order-two models are different. -/
example : IsConstantGroupScheme (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
    (Multiplicative (ZMod 2))) ∧
    ¬ IsConstantGroupScheme (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
      (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) := sorry

/-- Cartier duality reverses the two models in the diagonalizable predicate. -/
example : IsDiagonalizableGroupScheme (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
    (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) ∧
    ¬ IsDiagonalizableGroupScheme (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
      (Multiplicative (ZMod 2))) := sorry

/-- The identity group is diagonalizable with trivial character group. -/
example : IsDiagonalizableGroupScheme (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
    (Multiplicative (ZMod 1))) := sorry

/-- Inverting two makes the multiplicative order-two model constant. -/
example : IsConstantGroupScheme (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme
    (Localization.Away (2 : ℤ)) (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) := sorry

/-- An extension with either endpoint the identity group splits. -/
example (G : FFGroupSchemeOver R) :
    Ext1Vanishes (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme R
      (Multiplicative (ZMod 1))) G ∧
    Ext1Vanishes G (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme R
      (Multiplicative (ZMod 1))) := sorry

/-- Over characteristic zero, μ₂ has two geometric points and the identity group has one. -/
example : Nat.card (points (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
    (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2))))) = 2 ∧
    Nat.card (points (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
      (Multiplicative (ZMod 1)))) = 1 := sorry

/-- Constant geometric points retain their cardinality and have trivial Galois action. -/
example (σ : Field.absoluteGaloisGroup ℚ) :
    Nat.card (points (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
      (Multiplicative (ZMod 3)))) = 3 ∧
    ∀ x : points (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
      (Multiplicative (ZMod 3))),
      galoisAct _ σ x = x := sorry

/-- Complex conjugation inverts μ₃ and exchanges its two nonidentity geometric points. -/
example (j : AlgebraicClosure ℚ →+* ℂ) (c : Field.absoluteGaloisGroup ℚ)
    (hc : ∀ z, j (galAut c z) = starRingEnd ℂ (j z))
    (x : points (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
      (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 3))))) :
    galoisAct _ c x = x⁻¹ ∧ (x ≠ 1 → galoisAct _ c x ≠ x) := sorry

/-- Complex conjugation fixes every geometric point of μ₂. -/
example (j : AlgebraicClosure ℚ →+* ℂ) (c : Field.absoluteGaloisGroup ℚ)
    (hc : ∀ z, j (galAut c z) = starRingEnd ℂ (j z))
    (x : points (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
      (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2))))) :
    galoisAct _ c x = x := sorry

/-- The constant order-three model has rational torsion field. -/
example : torsionField (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
    (Multiplicative (ZMod 3))) = ⊥ := sorry

/-- The reversed integral Ext direction has a nonsplit Katz–Mazur extension. -/
example : ¬ Ext1Vanishes
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

/-- The third and fourth roots generate their respective cyclotomic torsion fields. -/
example : torsionField (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
    (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 3)))) = cyclotomicSubfield 3 ∧
    torsionField (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
      (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 4)))) = cyclotomicSubfield 4 ∧
    torsionField (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
      (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) = ⊥ := sorry

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

/-- Two-torsion has four geometric points, and multiplication by two annihilates it. -/
example : Nat.card X0ElevenTwoTorsion = 4 ∧
    ∀ P : X0ElevenTwoTorsion, (2 : ℕ) • P = 0 := sorry

/-- The first two cyclotomic fields are rational, whereas the third is quadratic. -/
example : cyclotomicSubfield 1 = ⊥ ∧ cyclotomicSubfield 2 = ⊥ ∧
    finrank ℚ (cyclotomicSubfield 3) = 2 := sorry

/-- The real ninth cyclotomic field has degree three, not six. -/
example : finrank ℚ (realCyclotomicSubfield 9) = 3 ∧
    finrank ℚ (cyclotomicSubfield 9) = 6 := sorry

/-- The fourth cyclotomic field is generated by square roots of −1; the twelfth has degree four. -/
example : cyclotomicSubfield 4 =
    IntermediateField.adjoin ℚ {x : AlgebraicClosure ℚ | x ^ 2 = -1} ∧
    finrank ℚ (cyclotomicSubfield 4) = 2 ∧
    finrank ℚ (cyclotomicSubfield 12) = 4 ∧ discr (cyclotomicSubfield 12) = 144 := sorry

/-- The first four real cyclotomic subfields are rational, and the fifth is quadratic. -/
example : realCyclotomicSubfield 1 = ⊥ ∧ realCyclotomicSubfield 2 = ⊥ ∧
    realCyclotomicSubfield 3 = ⊥ ∧ realCyclotomicSubfield 4 = ⊥ ∧
    realCyclotomicSubfield 5 =
      IntermediateField.adjoin ℚ {x : AlgebraicClosure ℚ | x ^ 2 = 5} ∧
    finrank ℚ (realCyclotomicSubfield 5) = 2 := sorry

/-- The displayed coefficients determine `b₂` and the cubic two-torsion polynomial. -/
example : x0Eleven.b₂ = -4 ∧
    x0Eleven.twoTorsionPolynomial.toPoly = 4 * X ^ 3 - 4 * X ^ 2 - 40 * X - 79 := sorry

/-- The displayed conductor-eleven equation has the signed discriminant `-11^5`. -/
example : x0Eleven.Δ = -(11 : ℚ) ^ 5 := sorry

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

/-- Restriction to the trivial subgroup has trivial scalar-extended image. -/
example (ρ : ResidualRep F) : imageOver ρ ⊥ = ⊥ := sorry

/-- A trivial rank-two action is reducible, including in characteristic two. -/
example : ¬ IsAbsolutelyIrreducible (F := ZMod 2) (1 : ResidualRep (ZMod 2)) ∧
    ¬ IsIrreducibleSubgroup (⊥ : Subgroup (GL (Fin 2) (ZMod 2))) := sorry

/-- The kernel field of the trivial action is rational. -/
example : kernelField (F := ZMod 2) (1 : ResidualRep (ZMod 2)) = ⊥ := sorry

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

/-- The trivial representation is unramified and tame, but fails level one. -/
example (p : ℕ) (hp : p.Prime) :
    (∀ l, IsUnramifiedAt (F := ZMod 2) l (1 : ResidualRep (ZMod 2))) ∧
    IsTameAt (F := ZMod 2) p (1 : ResidualRep (ZMod 2)) ∧
    ¬ IsLevelOneResidual (F := ZMod 2) p (1 : ResidualRep (ZMod 2)) := sorry

/-- The level-one predicate is invariant under finite discrete coefficient-field extension. -/
theorem IsLevelOneResidual.map {F' : Type*} [Field F'] [Fintype F'] [TopologicalSpace F']
    [DiscreteTopology F'] (f : F →+* F') {p : ℕ} (ρ : ResidualRep F) (ρ' : ResidualRep F')
    (hmap : ∀ σ, ρ' σ = Matrix.GeneralLinearGroup.map f (ρ σ)) :
    IsLevelOneResidual p ρ' ↔ IsLevelOneResidual p ρ := sorry

/-- The level-one predicate is invariant under a change of basis. -/
theorem IsLevelOneResidual.conj {p : ℕ} {ρ ρ' : ResidualRep F} (g : GL (Fin 2) F)
    (hconj : ∀ σ, ρ' σ = g * ρ σ * g⁻¹) (hρ : IsLevelOneResidual p ρ) :
    IsLevelOneResidual p ρ' := sorry

/-- The `𝔽₂` to `𝔽₄` specialization of the coefficient-invariance API for level one. -/
example {F' : Type*} [Field F'] [Fintype F'] [TopologicalSpace F'] [DiscreteTopology F']
    (_hF : Fintype.card F = 2) (_hF' : Fintype.card F' = 4) (f : F →+* F')
    (ρ : ResidualRep F) (ρ' : ResidualRep F')
    (hmap : ∀ σ, ρ' σ = Matrix.GeneralLinearGroup.map f (ρ σ)) :
    IsLevelOneResidual 2 ρ' ↔ IsLevelOneResidual 2 ρ := sorry

/-- The conductor-eleven S₃ action stays absolutely irreducible over `𝔽₄` and keeps its field. -/
example (b : Basis (Fin 2) (ZMod 2) X0ElevenTwoTorsion)
    {F' : Type*} [Field F'] [Fintype F'] [TopologicalSpace F'] [DiscreteTopology F']
    (_hF' : Fintype.card F' = 4) (f : ZMod 2 →+* F') (ρ' : ResidualRep F')
    (hmap : ∀ σ, ρ' σ = Matrix.GeneralLinearGroup.map f (x0ElevenTwoTorsionRep b σ)) :
    IsAbsolutelyIrreducible (x0ElevenTwoTorsionRep b) ∧ IsAbsolutelyIrreducible ρ' ∧
      kernelField ρ' = kernelField (x0ElevenTwoTorsionRep b) := sorry

/-- The determinant oddness condition is automatic in characteristic two. -/
theorem isOdd_of_ringChar_two (h : ringChar F = 2) (ρ : ResidualRep F) : IsOdd ρ := sorry

/-- For `p` odd the kernel field of a level-one residual representation is totally complex. -/
theorem IsLevelOneResidual.isTotallyComplex {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2) [CharP F p]
    {ρ : ResidualRep F} (hρ : IsLevelOneResidual p ρ) : IsTotallyComplex (kernelField ρ) :=
  sorry

/-- `isOdd_of_ringChar_two` (degenerate): in characteristic `2` every `ρ̄` is odd. -/
example [CharP F 2] (ρ : ResidualRep F) : IsOdd ρ := isOdd_of_ringChar_two (ringChar.eq F 2) ρ

/-- The cyclic cubic matrix has no eigenline over `𝔽₂`, but has one over its algebraic closure. -/
example : cubicOrderThreeMatrix ^ 3 = 1 ∧
    (∀ v : Fin 2 → ZMod 2, v ≠ 0 → ∀ c : ZMod 2,
      (cubicOrderThreeMatrix : Matrix (Fin 2) (Fin 2) (ZMod 2)).mulVec v ≠ c • v) ∧
    (∃ (v : Fin 2 → AlgebraicClosure (ZMod 2)) (c : AlgebraicClosure (ZMod 2)),
      v ≠ 0 ∧ ((cubicOrderThreeMatrix : Matrix (Fin 2) (Fin 2) (ZMod 2)).map
        (algebraMap (ZMod 2) (AlgebraicClosure (ZMod 2)))).mulVec v = c • v) := sorry

/-- The trivial action in odd characteristic fails determinant oddness. -/
example : ¬ IsOdd (F := ZMod 3) (1 : ResidualRep (ZMod 3)) := sorry

/-- The inertia set contains the identity at an actual rational prime. -/
example : (1 : Field.absoluteGaloisGroup ℚ) ∈ inertiaAbove 2 := sorry

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

/-- At three, `diag(1,-1)` is odd, and scalar `-1` has nonzero inertia square. -/
example : Matrix.det (!![(1 : ZMod 3), 0; 0, -1]) = -1 ∧
    ((-1 : ZMod 3) - 1) ^ 2 = 1 := by decide

/-- A characteristic-two complex conjugation has determinant `1 = -1`. -/
example (c : Field.absoluteGaloisGroup ℚ) (hc : c ^ 2 = 1)
    (ρ : ResidualRep (ZMod 2)) :
    ((ρ c : GL (Fin 2) (ZMod 2)) : Matrix (Fin 2) (Fin 2) (ZMod 2)).det = 1 ∧
      (1 : ZMod 2) = -1 := sorry

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

/-- The diagonal-ratio convention sends the unipotent entry `1` to `-1` under `diag(-1,1)`. -/
example : (!![-1, 0; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 3)) *
    !![1, 1; 0, 1] * !![-1, 0; 0, 1] = !![1, -1; 0, 1] := by decide

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

/-- The trivial abelian variety contributes its single identity point. -/
example {k : Type} [Field k] [Fintype k] (A : AbelianVariety k) (hA : A.dim = 0) :
    numPoints A = 1 := sorry

/-- Isogenous abelian varieties over a finite field have the same number of rational points. -/
theorem card_points_eq_of_isogeny {k : Type} [Field k] [Fintype k] {A B : AbelianVariety k}
    (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) : numPoints A = numPoints B := sorry

/-- The dimension-zero variety has a trivial smooth proper integral model. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 0) : HasGoodReductionEverywhere A := sorry

/-- The two geometrically isomorphic curves over 𝔽₅ have different rational point counts. -/
example :
    Nat.card (WeierstrassCurve.toAffine
      (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve (ZMod 5))).Point = 8 ∧
    Nat.card (WeierstrassCurve.toAffine
      (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 5))).Point = 4 := sorry

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

/-- `zModP_mem_semistableCategory` (degenerate): `ℤ/pℤ` and `μ_p` are objects of `D(p, l)`. -/
example (hpl : p ≠ l) :
    SemistableCategory p l (TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme _ (Multiplicative (ZMod p))) ∧ SemistableCategory p l (TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme _ (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod p)))) :=
  sorry

/-- `katzMazur_mem_semistableCategory` (computation): every extension of `ℤ/pℤ` by `μ_p` over
`ℤ[1/l]`, in particular the Katz–Mazur `G_ε`, is in `D`: inertia acts by `(1 x; 0 1)`. -/
example (hpl : p ≠ l) (G : FFGroupSchemeAway l) (i : TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme _ (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod p))) ⟶ G)
    (q : G ⟶ TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme _ (Multiplicative (ZMod p)))
    (h : TauCeti.CommHopfAlgCat.IsShortExact
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        (Localization.Away (l : ℤ))).inverse.map q).unop.hom)
      (((TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat
        (Localization.Away (l : ℤ))).inverse.map i).unop.hom)) : SemistableCategory p l G := sorry

/- The two concrete integral examples `not_mem_semistableCategory_quadratic_twist` and
`X0_eleven_two_torsion_mem` are specified, with their absent construction interfaces, in the
closing comment. -/

/-- A length-three unipotent extension fails inertia square zero, so trivial endpoints matter. -/
example : ((!![1, 1, 0; 0, 1, 1; 0, 0, 1] : Matrix (Fin 3) (Fin 3) (ZMod 3)) - 1) ^ 2 ≠ 0 :=
  by decide

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
example : ¬ FieldCriterion 11 2 := sorry

/-- The radical-cyclotomic auxiliary field is Galois of degree six. -/
example : finrank ℚ schoofFieldTwoThree = 6 ∧ cyclotomicSubfield 3 ≤ schoofFieldTwoThree := sorry

/-- The twelfth cyclotomic auxiliary field has degree four and contains the fourth roots. -/
example : finrank ℚ schoofFieldThreeTwo = 4 ∧ cyclotomicSubfield 4 ≤ schoofFieldThreeTwo := sorry

/-- The fifth-prime auxiliary field has degree four and contains the fourth roots. -/
example : finrank ℚ schoofFieldFiveTwo = 4 ∧ cyclotomicSubfield 4 ≤ schoofFieldFiveTwo := sorry

/-- The three auxiliary discriminants are absolute field discriminants. -/
example : discr schoofFieldTwoThree = -(2 : ℤ) ^ 4 * 3 ^ 7 ∧
    discr schoofFieldThreeTwo = 144 ∧ discr schoofFieldFiveTwo = 400 := sorry

/-- The radical-cyclotomic field contains all cubic roots and has residue field `𝔽₃` at three. -/
example (P : Ideal (𝓞 schoofFieldTwoThree)) [P.IsMaximal]
    (hP : (3 : 𝓞 schoofFieldTwoThree) ∈ P) :
    (∀ x : AlgebraicClosure ℚ, x ^ 3 = 2 → x ∈ schoofFieldTwoThree) ∧
    Nat.card (𝓞 schoofFieldTwoThree ⧸ P) = 3 := sorry

/-- The twelfth cyclotomic field has ramification index two at three. -/
example (P : Ideal (𝓞 schoofFieldThreeTwo)) [P.IsMaximal]
    (hP : (3 : 𝓞 schoofFieldThreeTwo) ∈ P) : P.ramificationIdx ℤ = 2 := sorry

/-- At two the biquadratic field has four residue elements, and its golden-ratio unit has order three. -/
example (P : Ideal (𝓞 schoofFieldFiveTwo)) [P.IsMaximal]
    (hP : (2 : 𝓞 schoofFieldFiveTwo) ∈ P) :
    Nat.card (𝓞 schoofFieldFiveTwo ⧸ P) = 4 ∧
    ∃ u : 𝓞 schoofFieldFiveTwo, u ^ 2 = u + 1 ∧
      orderOf (Ideal.Quotient.mk P u) = 3 ∧
      (Ideal.Quotient.mk P u) ^ 2 = Ideal.Quotient.mk P u + 1 := sorry

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

/-- Conjugation by an F-isogeny on rational endomorphism algebras. -/
def endZeroIsogeny {F : Type} [Field F] [NumberField F] {A B : AbelianVariety F}
    (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) :
    endZeroAlgebra A ≃+* endZeroAlgebra B := sorry

/-- Base change of rational endomorphisms to a finite extension. -/
def endZeroBaseChange {F : Type} [Field F] [NumberField F] (A : AbelianVariety F)
    (F' : Type) [Field F'] [NumberField F'] [Algebra F F'] :
    endZeroAlgebra A →+* endZeroAlgebra (A.baseChange F') := sorry

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

/-- `isGL2Type_ellipticCurve` (computation): an elliptic curve over `ℚ` is of GL₂(ℚ)-type. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 1) : IsGL2Type A ℚ := sorry

/- `isGL2Type_J0_23` needs the actual modular Jacobian and its Hecke action, as specified in
the closing comment.  -/

/-- `not_isGL2Type_prod_rat` (non-example): a surface such as `E × E` is not of GL₂(ℚ)-type. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 2) : ¬ IsGL2Type A ℚ := sorry

/-- `isGL2Type_zero` (degenerate): the zero abelian variety is of GL₂-type for no number field. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 0) (K : Type) [Field K] [NumberField K] :
    ¬ IsGL2Type A K := sorry

/-- Class number one for the six non-cyclotomic quadratic cases `p ∈ {7,11,19,43,67,163}`. -/
theorem classNumber_sqrt_neg_prime_eq_one :
    ∀ p ∈ ({7, 11, 19, 43, 67, 163} : Finset ℕ), ∀ (K : Type) [Field K] [NumberField K]
      [IsSplittingField ℚ K (X ^ 2 + C (p : ℚ))], classNumber K = 1 := sorry

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- Snowden's (A1) for a residual representation: absolutely irreducible on `G_{ℚ(ζ_p)}`. -/
def SatisfiesA1Residual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsIrreducibleSubgroup (imageOver ρ (cyclotomicSubfield p).fixingSubgroup)

/-- A trivial rank-two representation fails (A1) at every cyclotomic index. -/
example (p : ℕ) : ¬ SatisfiesA1Residual (F := ZMod 2) p (1 : ResidualRep (ZMod 2)) := sorry

/-- Restriction to the second cyclotomic field imposes no new condition. -/
example (ρ : ResidualRep F) : SatisfiesA1Residual 2 ρ ↔ IsAbsolutelyIrreducible ρ := sorry

/-- The natural SL₂(𝔽₃) image remains irreducible over the algebraic closure. -/
example : IsIrreducibleSubgroup
    (((Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin 2) (ZMod 3) →*
      GL (Fin 2) (ZMod 3)).range).map
        (Matrix.GeneralLinearGroup.map (algebraMap (ZMod 3) (AlgebraicClosure (ZMod 3))))) :=
  sorry

open scoped MatrixGroups in
/-- Check: the terminal weights `2, 4, 6, 8` carry no level-one cusp forms (Mathlib). -/
example (k : ℤ) (hk : k < 12) : Module.rank ℂ (CuspForm 𝒮ℒ k) = 0 :=
  CuspForm.rank_eq_zero_of_weight_lt_twelve hk

open scoped MatrixGroups in
/-- Check: `S₁₄(SL₂(ℤ)) = 0`, through `S₁₄ ≅ M₂ = 0`. -/
example : Module.rank ℂ (CuspForm 𝒮ℒ 14) = 0 := sorry

end Terminal

end TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

/-
Additional mathematical targets specified in the README:
* §1.0: dedekindZeta_explicitFormula, including zero location and grouped convergence for
  the trivial-character Dedekind-zeta function supplied by ArithmeticGaloisRepresentations §2.7;
  identify its Euler product with the ArithmeticDirichletSeries presentation.
* §§1.1–1.3: localRootDiscrExp and its normalized different API, local-to-global root
  discriminants, wild Borel normal form and the two sharp small-characteristic bounds.
* §§1.5–1.7: the analytic API odlyzkoKernel_eq_two_mul_convolution, odlyzkoKernel_nonneg,
  odlyzkoKernel_zero, odlyzkoKernel_neg, odlyzkoKernel_eq_zero_of_one_le_abs,
  contDiff_odlyzkoKernel, integrableOn_poitouIntegrand_sinh, poitouLowerBound_eq_explicit,
  poitouIntegral_sinh_eq and poitouLowerBound_div_mono, and the cosh integrability counterpart.
* §1.10: order_congr, order_constant, order_mu, order_exact; isKilledBy_iff_mul_zero,
  isKilledBy_mul; ext1Vanishes_iff_all_split and the functoriality of the finite-flat predicates.
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
