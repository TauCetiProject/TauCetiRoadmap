/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Constant
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.NumberTheory.LocalField.Different.Basic
import TauCeti.NumberTheory.LocalField.RamificationGroup

/-!
# Small ramification and abelian-variety base cases: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`; these statements suggest Lean forms for its headline results.

The statements cover the sharp two-adic and three-adic different bounds (§1.3), the
unconditional Poitou–Odlyzko inequality (§1.7), Tate's and Serre's exclusions (§§2.4–2.5),
the simple finite flat two-group classification (§3.2), Fontaine's theorem (§3.5), the
five arithmetic field criteria (§§4.6–4.8), and the unrestricted characteristic-2,3,5,7
corollary of the small-weight theorem (§5.11). The definitions use native local fields,
representations, group schemes and abelian varieties. Fontaine's hypothesis is an integral
smooth proper group model with geometrically connected fibres and an identified generic fibre.

Schoof's geometric theorem (§4.9) needs general semistable reduction of abelian varieties,
including semiabelian special fibres; that interface is absent at the pins. Elliptic-curve
reduction alone does not express its all-dimensional statement. Snowden's realization and
descent (§§5.2–5.4) need rational abelian-variety Tate modules with their marked coefficient
factors and p-adic Hodge/Weil–Deligne predicates. The terminal weight exclusions and twisting
dichotomy (§§5.7–5.11) additionally need the Serre-weight recipe. The lifting, automorphic
transfer and Paso 6 statements (§5.0 and §5.12) need Hilbert eigenform attachments and
arithmetic compatible families. Those objects are absent at the pins, so these results and
the full nine-row conjunction (§6) have no signatures here. The Dedekind-zeta explicit
formula (§1.0) also awaits the meromorphic extension on the whole plane: the pinned
Dedekind zeta is an L-series, with extension only to a right half-plane.
-/

noncomputable section

open NumberField NumberField.InfinitePlace Module MeasureTheory Set
open CategoryTheory AlgebraicGeometry
open scoped Classical Real CategoryTheory.MonObj

namespace TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

section LocalDifferent

variable (p : ℕ) [Fact p.Prime] (E : Type*) [Field E] [ValuativeRel E]
  [TopologicalSpace E] [IsNonarchimedeanLocalField E] [TauCeti.FinitePadicExtension E p]

/-- The different exponent divided by the ramification index over `ℚ_p`. -/
def localRootDiscrExp : ℚ :=
  (TauCeti.differentExponent (Padic p) E : ℚ) / TauCeti.ramificationIndex (Padic p) E

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

/-- The kernel `g(x) = (1 − |x|) cos πx + sin π|x| / π` on `[−1, 1]`, zero outside. -/
def odlyzkoKernel (x : ℝ) : ℝ :=
  if |x| ≤ 1 then (1 - |x|) * Real.cos (π * x) + Real.sin (π * |x|) / π else 0

/-- The test function `F_b(x) = g(x/b)/cosh(x/2)`. -/
def poitouTestFunction (b x : ℝ) : ℝ := odlyzkoKernel (x / b) / Real.cosh (x / 2)

/-- `P(n, r₁, b) = r₁π/2 + n(γ + log 8π) − n·I₁(b) − r₁·I₂(b) − 16b/π²`: the explicit-formula
lower bound with the zero and prime sums removed. Every integral is parenthesised. -/
def poitouLowerBound (n r₁ : ℕ) (b : ℝ) : ℝ :=
  r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
    - n * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
    - r₁ * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
    - 16 * b / π ^ 2

/-- The Odlyzko–Poitou unconditional bound. -/
theorem poitouLowerBound_le_log_abs_discr (K : Type*) [Field K] [NumberField K] {b : ℝ}
    (hb : 0 < b) :
    poitouLowerBound (finrank ℚ K) (nrRealPlaces K) b ≤ Real.log |(discr K : ℝ)| := sorry

/-- A residual representation: a continuous homomorphism `G_ℚ → GL₂(F)`. -/
abbrev ResidualRep (F : Type*) [Field F] [TopologicalSpace F] :=
  ContinuousMonoidHom (Field.absoluteGaloisGroup ℚ) (GL (Fin 2) F)

/-- Absolute irreducibility on the natural module after extending coefficients to `F̄`. -/
def IsAbsolutelyIrreducible {F : Type*} [Field F] [TopologicalSpace F]
    (ρ : ResidualRep F) : Prop :=
  Representation.IsIrreducible
    ((Units.coeHom (Module.End (AlgebraicClosure F) (Fin 2 → AlgebraicClosure F))).comp
      (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp
        ((Matrix.GeneralLinearGroup.map (algebraMap F (AlgebraicClosure F))).comp
          ρ.toMonoidHom)))

/-- the union of the inertia groups of the primes of `ℚ̄` above `ℓ`; `σ` is in
the inertia group of `P` when `σ x − x ∈ P` for every algebraic integer `x`. -/
def inertiaAbove (ℓ : ℕ) : Set (Field.absoluteGaloisGroup ℚ) :=
  {σ | ∃ P : Ideal (integralClosure ℤ (AlgebraicClosure ℚ)), P.IsMaximal ∧
    (ℓ : integralClosure ℤ (AlgebraicClosure ℚ)) ∈ P ∧
    ∀ x : integralClosure ℤ (AlgebraicClosure ℚ), ∃ y ∈ P,
      (y : AlgebraicClosure ℚ) = (σ : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ).toAlgHom x - x}

section Residual

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- `ρ` is unramified at `ℓ` when every inertia element acts trivially. -/
def IsUnramifiedAt (ℓ : ℕ) (ρ : ResidualRep F) : Prop :=
  ∀ σ ∈ inertiaAbove ℓ, ρ σ = 1

/-- `det ρ(c) = −1` for every `c ∈ G_ℚ` acting as complex conjugation under
some embedding `ℚ̄ → ℂ`. -/
def IsOdd (ρ : ResidualRep F) : Prop :=
  ∀ (j : AlgebraicClosure ℚ →+* ℂ) (c : Field.absoluteGaloisGroup ℚ),
    (∀ x, j ((c : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ).toAlgHom x) = starRingEnd ℂ (j x)) →
      ((ρ c : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F).det = -1

/-- Level one: absolutely irreducible, odd, and unramified outside `p`. -/
def IsLevelOneResidual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsAbsolutelyIrreducible ρ ∧ IsOdd ρ ∧ ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ

/-- Tate's theorem (oddness is automatic in characteristic `2` and is not assumed). -/
theorem tate_no_levelOne_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) : ¬ IsAbsolutelyIrreducible ρ :=
  sorry

/-- Serre's mod-3 theorem. -/
theorem serre_no_levelOne_char_three [CharP F 3] (ρ : ResidualRep F) :
    ¬ IsLevelOneResidual 3 ρ := sorry

/-- The small-weight theorem's unrestricted corollary: level one is impossible in
characteristics `2`, `3`, `5` and `7`, over every finite coefficient field. -/
theorem not_isLevelOneResidual_of_mem_two_three_five_seven {p : ℕ}
    (hp : p ∈ ({2, 3, 5, 7} : Finset ℕ)) [CharP F p] (ρ : ResidualRep F) :
    ¬ IsLevelOneResidual p ρ := sorry

end Residual

/-- Finite flat commutative group schemes over `R` (Tau Ceti). -/
abbrev FFGroupSchemeOver (R : Type) [CommRing R] :=
  TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

/-- Finite flat commutative group schemes over `ℤ`. -/
abbrev FFGroupScheme := FFGroupSchemeOver ℤ

section FiniteFlat

variable {R : Type} [CommRing R] [IsDomain R]

/-- The constant rank over an arithmetic domain, expressed by the coordinate algebra. -/
def order (G : FFGroupSchemeOver R) : ℕ :=
  Module.finrank R (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G)

/-- The underlying morphism of schemes. -/
abbrev schemeHom {G H : FFGroupSchemeOver R} (f : G ⟶ H) :
    G.obj.obj.X.left ⟶ H.obj.obj.X.left :=
  f.hom.hom.hom.hom.left

/-- The constant-rank simplicity condition of FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.1.23, unfolded on the native finite locally free carrier. -/
def IsSimpleGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  order G ≠ 1 ∧ ∀ (M : FFGroupSchemeOver R) (i : M ⟶ G),
    IsClosedImmersion (schemeHom i) → order M = 1 ∨ IsIso i

end FiniteFlat

/-- The nonzero simple finite flat two-group schemes over `ℤ` are `ℤ/2ℤ` and `μ₂`. -/
theorem simple_two_groupScheme_over_int (G : FFGroupScheme) (h2 : ∃ k, order G = 2 ^ k)
    (hG : IsSimpleGroupScheme G) :
    Nonempty (G ≅ TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme ℤ
      (Multiplicative (ZMod 2))) ∨
    Nonempty (G ≅ TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
      (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))) := sorry

open TauCeti.AlgebraicGeometry

/-- `A` is the generic fibre of a smooth proper group scheme over `ℤ` with
geometrically connected fibres, with the generic-fibre group structure identified. -/
def HasGoodReductionEverywhere (A : AbelianVariety ℚ) : Prop :=
  ∃ (X : Over (Spec (.of ℤ))) (_ : GrpObj X),
    IsProper X.hom ∧ Smooth X.hom ∧ GeometricallyConnected X.hom ∧
      Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))).mapGrp.obj
        (Grp.mk X) ≅ Grp.mk A.toOver)

/-- Fontaine's theorem. -/
theorem dim_eq_zero_of_goodReduction_everywhere (A : AbelianVariety ℚ)
    (hA : HasGoodReductionEverywhere A) : A.dim = 0 := sorry

/-- The subfield `ℚ(ζ_n)` of `ℚ̄`. -/
def cyclotomicSubfield (n : ℕ) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ {x | x ^ n = 1}

/-- Schoof's field criterion for `(l, p)`: with `F` the degree-`p` subfield of `ℚ(ζ_l)` if
`p ∣ l − 1` and `F = ℚ` otherwise, and `M = F(ζ_{2p}, l^{1/p})`, every finite Galois `L ⊇ M`
unramified over `M` outside `p` with `v_p(d_L)/[L:ℚ] < 1 + 1/(p − 1)` has `[L : ℚ(ζ_p)]` a power of
`p`. Unramifiedness of `L/M` at a prime is "inertia meets `G_M` inside `G_L`". -/
def FieldCriterion (l p : ℕ) : Prop :=
  ∀ (F M L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L],
    (if p ∣ l - 1 then F ≤ cyclotomicSubfield l ∧ finrank ℚ F = p else F = ⊥) →
    M = F ⊔ cyclotomicSubfield (2 * p) ⊔
      IntermediateField.adjoin ℚ {x | x ^ p = (l : AlgebraicClosure ℚ)} →
    IsGalois ℚ L → M ≤ L →
    (∀ q : ℕ, q.Prime → q ≠ p → ∀ σ ∈ inertiaAbove q,
      σ ∈ M.fixingSubgroup → σ ∈ L.fixingSubgroup) →
    (padicValInt p (discr L) : ℝ) / finrank ℚ L < 1 + 1 / ((p : ℝ) - 1) →
    ∃ k : ℕ, finrank ℚ L = (p - 1) * p ^ k

/-- Schoof's field criterion for `(ℓ,p) = (2,3)`. -/
theorem fieldCriterion_two_three : FieldCriterion 2 3 := sorry

/-- Schoof's field criterion for `(ℓ,p) = (3,2)`. -/
theorem fieldCriterion_three_two : FieldCriterion 3 2 := sorry

/-- Schoof's field criterion for `(ℓ,p) = (5,2)`. -/
theorem fieldCriterion_five_two : FieldCriterion 5 2 := sorry

/-- `(l, p) = (7, 3)`: `M = ℚ(ζ₃, ζ₇ + ζ₇⁻¹, ∛7)`, of degree `18`. -/
theorem fieldCriterion_seven_three : FieldCriterion 7 3 := sorry

/-- `(l, p) = (13, 2)`: `M = ℚ(i, √13)`. -/
theorem fieldCriterion_thirteen_two : FieldCriterion 13 2 := sorry

end TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases
