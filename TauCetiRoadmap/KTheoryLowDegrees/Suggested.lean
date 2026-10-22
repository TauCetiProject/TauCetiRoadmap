import Mathlib
import TauCeti.Algebra.Category.ModuleCat.FiniteProjective.Monoidal
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic

/-!
# KTheoryLowDegrees: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline results; discharging
all of them finishes neither a layer nor the roadmap.

The statements cover the rank splitting and semilocal rank classification (Layer 2),
Steinitz decomposition and the Dedekind rank–Picard ring classification (Layer 5),
Euclidean elementary generation and stable nonvanishing of the real circle rotation
(Layer 8), and elementary generation over S-integers and finite generation of their
arithmetic SL₂ groups and finite-index subgroups (Layer 11). The circle statement uses
finite identity-padded matrices, so it does not require a stable K₁ carrier.

The other headline signatures need objects absent from these pins: projective λ/Adams
operations and integral algebraic representation Grothendieck rings (Layers 3–4);
Milnor patching, stable and relative K₁, Mennicke symbols, arithmetic defect groups
and congruence completions (Layers 1 and 7–11); vector-bundle K₀ and coherent G₀ of
schemes for the regular-curve classification (Layer 12); plus-construction K-spaces,
Steinberg groups and their based boundary maps (Layer 13); and graded-line spectra,
enhanced perfect-complex K-theory and Witt-supported K-theory for the determinant
and finite-length filtration theorems (Layer 14). Their constructions are specified
in the README and its supplier contracts; no signatures for those results are given here.
-/

namespace TauCetiRoadmap.KTheoryLowDegrees

open IsDedekindDomain

universe u

/-- The native full subcategory of finitely generated projective left modules. -/
abbrev FiniteProjectives (R : Type u) [Ring R] :=
  (TauCeti.finiteProjectiveModules R).FullSubcategory

/-- AlgebraicKTheory A0's split K₀ in the left-module convention, using the existing
categorical carrier and the canonical double-opposite module equivalence. -/
abbrev RingK0 (R : Type u) [Ring R] :=
  TauCeti.SplitK0.{u} (FiniteProjectives R)

/-- The finite free object of the projective category, including rank zero. -/
def freeProjective (R : Type u) [Ring R] (n : ℕ) : FiniteProjectives R :=
  ⟨ModuleCat.of R (Fin n → R), ⟨inferInstance, inferInstance⟩⟩

/-- The class of a projective object in the categorical split K₀ specialization. -/
noncomputable def projectiveClass {R : Type u} [Ring R]
    (P : FiniteProjectives R) : RingK0 R :=
  TauCeti.SplitK0.of P

/-! ## Layer 2: rank splitting and semilocal classification -/

/-- The locally constant rank is a split surjection of rings, without a connectedness
or nonzero-ring hypothesis (Weibel II.2, pp. 71–72). -/
theorem rank_exists_split (R : Type u) [CommRing R] :
    ∃ (ρ : RingK0 R →+* LocallyConstant (PrimeSpectrum R) ℤ)
      (σ : LocallyConstant (PrimeSpectrum R) ℤ →+* RingK0 R),
      (∀ (P : FiniteProjectives R) (p : PrimeSpectrum R),
        ρ (projectiveClass P) p = (Module.rankAtStalk P.obj p : ℤ)) ∧
      (∀ f, ρ (σ f) = f) := by
  sorry

/-- Over a commutative semilocal ring, rank completely classifies virtual projectives,
with one coordinate per connected component (Weibel Exercise II.2.6, p. 79). -/
theorem semilocal_rank_equiv_exists (R : Type u) [CommRing R]
    [Finite (MaximalSpectrum R)] :
    ∃ e : RingK0 R ≃+* LocallyConstant (PrimeSpectrum R) ℤ,
      ∀ (P : FiniteProjectives R) (p : PrimeSpectrum R),
        e (projectiveClass P) p = (Module.rankAtStalk P.obj p : ℤ) := by
  sorry

/-! ## Layer 5: Steinitz and the Dedekind rank–Picard classification -/

/-- A positive-rank projective over a Dedekind domain is a free module plus its actual
top exterior power (Weibel I.3, Proposition 3.4, pp. 19–20). -/
theorem steinitz_decomposition {R : Type u} [CommRing R]
    [IsDedekindDomain R] (P : FiniteProjectives R) (r : ℕ)
    (hr : Module.finrank R P.obj = r + 1) :
    Nonempty (P.obj ≃ₗ[R]
      ((Fin r → R) × (⋀[R]^(r + 1) P.obj))) := by
  sorry

/-- The native invertible module representing a Picard class, as a finite projective. -/
noncomputable def lineProjective (R : Type u) [CommRing R] (L : CommRing.Pic R) :
    FiniteProjectives R :=
  ⟨ModuleCat.of R L, ⟨inferInstance, inferInstance⟩⟩

/- The right integer action is the same integer scalar action. It equips Mathlib's
square-zero extension with its native commutative ring structure. -/
noncomputable local instance picardIntOpModule (R : Type u) [CommRing R] :
    Module ℤᵐᵒᵖ (Additive (CommRing.Pic R)) :=
  Module.compHom _ ((RingHom.id ℤ).fromOpposite (fun a b => mul_comm a b))

local instance picardIntCentralScalar (R : Type u) [CommRing R] :
    IsCentralScalar ℤ (Additive (CommRing.Pic R)) where
  op_smul_eq_smul _ _ := rfl

/-- The rank–Picard classification as a ring equivalence to the trivial square-zero
extension, normalized on free modules and lines (Weibel II.2.6.2–2.6.3, p. 75). -/
theorem rank_pic_equiv_exists (R : Type u) [CommRing R]
    [IsDedekindDomain R] :
    ∃ e : RingK0 R ≃+* TrivSqZeroExt ℤ (Additive (CommRing.Pic R)),
      (∀ n : ℕ, e (projectiveClass (freeProjective R n)) = ⟨(n : ℤ), 0⟩) ∧
      (∀ L : CommRing.Pic R,
        e (projectiveClass (lineProjective R L)) = ⟨1, Additive.ofMul L⟩) := by
  sorry

/-! ## Layer 8: elementary generation and circle nonvanishing -/

/-- AlgebraicKTheory A1's elementary subgroup on the native finite GL carrier. -/
abbrev finiteElementaryGroup (R : Type u) [Ring R] (n : ℕ) :
    Subgroup (Matrix.GeneralLinearGroup (Fin n) R) :=
  Subgroup.closure {g | ∃ (i j : Fin n) (a : R), i ≠ j ∧
    (g : Matrix (Fin n) (Fin n) R) = 1 + Matrix.single i j a}

/-- Over a Euclidean domain, every determinant-one matrix of positive size is
elementary (Weibel Exercise III.1.5, p. 190). -/
theorem euclidean_elementary_generation (R : Type u) [EuclideanDomain R]
    (n : ℕ) (hn : 1 ≤ n) (g : Matrix.GeneralLinearGroup (Fin n) R)
    (hg : Matrix.GeneralLinearGroup.det g = 1) :
    g ∈ finiteElementaryGroup R n := by
  sorry

/-- The coordinate ring of the real algebraic circle. -/
abbrev CircleRing :=
  MvPolynomial (Fin 2) ℝ ⧸ Ideal.span
    {MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2 - (1 : MvPolynomial (Fin 2) ℝ)}

/-- The determinant-one rotation matrix over the circle coordinate ring. -/
noncomputable def circleRotation : Matrix.SpecialLinearGroup (Fin 2) CircleRing := by
  let q : MvPolynomial (Fin 2) ℝ →+* CircleRing := Ideal.Quotient.mk _
  let x := q (MvPolynomial.X 0)
  let y := q (MvPolynomial.X 1)
  have h : q (MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2 - 1) = 0 :=
    Ideal.Quotient.eq_zero_iff_mem.mpr (Ideal.subset_span (Set.mem_singleton _))
  have hxy : x ^ 2 + y ^ 2 = 1 := by
    apply sub_eq_zero.mp
    simpa only [map_sub, map_add, map_pow, map_one] using h
  refine ⟨!![x, -y; y, x], ?_⟩
  simp only [Matrix.det_fin_two]
  dsimp
  linear_combination hxy

/-- The circle rotation remains non-elementary after every identity stabilization,
so it gives a nonzero stable SK₁ class (Weibel III.1.5.4, p. 185). -/
theorem circle_rotation_not_stably_elementary (n : ℕ) :
    ¬ ∃ g ∈ finiteElementaryGroup CircleRing (2 + n),
      g.val =
        Matrix.reindex finSumFinEquiv finSumFinEquiv
          (Matrix.fromBlocks (circleRotation : Matrix (Fin 2) (Fin 2) CircleRing)
            0 0 (1 : Matrix (Fin n) (Fin n) CircleRing)) := by
  sorry

/-! ## Layer 11: arithmetic elementary generation and finite generation -/

/-- All determinant-one matrices over S-integers are elementary in ranks at least
three, for every number field and finite S (BMS Theorem 4.1 and Corollary 4.3,
pp. 94–96). In particular their stable SK₁ vanishes. -/
theorem sinteger_elementary_generation (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (NumberField.RingOfIntegers F))) [Finite S]
    (n : ℕ) (hn : 3 ≤ n)
    (g : Matrix.GeneralLinearGroup (Fin n) (S.integer F))
    (hg : Matrix.GeneralLinearGroup.det g = 1) :
    g ∈ finiteElementaryGroup (S.integer F) n := by
  sorry

/-- Every finite-index subgroup of SL₂ over S-integers is finitely generated,
without a unit-rank restriction (Serre 1970, §1.2, p. 490). -/
theorem arithmeticSL2_finitelyGenerated (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (NumberField.RingOfIntegers F))) [Finite S]
    (H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) (S.integer F)))
    [H.FiniteIndex] : Group.FG H := by
  sorry

end TauCetiRoadmap.KTheoryLowDegrees
