import Mathlib
import TauCeti.Algebra.Category.ModuleCat.FiniteProjective.Monoidal
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic

/-!
# KTheoryLowDegrees: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements give the headline theorems against the pinned APIs; discharging
all of them finishes neither a layer nor the roadmap.

The statements cover the rank splitting and semilocal rank classification (Layer 2),
Steinitz decomposition and the Dedekind rank–Picard ring classification (Layer 5),
Euclidean elementary generation and stable nonvanishing of the real circle rotation
(Layer 8), and, over S-integers of a number field, elementary generation in ranks at
least three, its relative form at every ideal level, the congruence subgroup property
with its failure for totally imaginary rings of integers, the rank-two counterparts
under positive S-unit rank, and finite generation of the
arithmetic SL₂ groups and their finite-index subgroups (Layer 11). The circle statement
uses finite identity-padded matrices, so it does not require a stable K₁ carrier, and the
congruence statements use only principal congruence subgroups, so they need no completion.

The other headline signatures need objects absent from these pins: projective λ/Adams
operations, the γ-filtration and the determinant on K₀ (Layers 3–4); Milnor patching,
stable and relative K₁ and Mennicke symbols (Layers 1, 7 and 9–10); the congruence
completions, the Mennicke defect groups and the relative metaplectic classification of
Layer 11; vector-bundle K₀ and coherent G₀ of schemes for the regular-curve
classification (Layer 12); plus-construction K-spaces, Steinberg groups and their based
boundary maps (Layer 13); and graded-line spectra, enhanced perfect-complex K-theory and
Witt-supported K-theory for the determinant and finite-length filtration theorems
(Layer 14). Their constructions are specified in the README and its supplier contracts;
no signatures for those results are given here.
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

/-- The right integer action on the additive Picard group is the same integer scalar
action. It equips Mathlib's square-zero extension with its native commutative ring
structure. -/
noncomputable local instance picardIntOpModule (R : Type u) [CommRing R] :
    Module ℤᵐᵒᵖ (Additive (CommRing.Pic R)) :=
  Module.compHom _ ((RingHom.id ℤ).fromOpposite (fun a b => mul_comm a b))

/-- The two integer actions on the additive Picard group agree, so the square-zero
extension's multiplication is commutative. -/
local instance picardIntCentralScalar (R : Type u) [CommRing R] :
    IsCentralScalar ℤ (Additive (CommRing.Pic R)) where
  op_smul_eq_smul _ _ := rfl

/-- The ring enhancement of the additive Dedekind classification supplied by
ClassicalArithmeticCompletion §7.84: rank and determinant give an equivalence to the
trivial square-zero extension, normalized on free modules and lines
(Weibel II.2.6.2–2.6.3, p. 75). -/
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

/-- Over a Euclidean domain, every determinant-one matrix of every size is elementary;
in size zero the group is trivial (Weibel Exercise III.1.5, p. 190). -/
theorem euclidean_elementary_generation (R : Type u) [EuclideanDomain R]
    (n : ℕ) (g : Matrix.GeneralLinearGroup (Fin n) R)
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

/-! ## Layer 11: arithmetic elementary generation, congruence subgroups and finite generation -/

/-- The principal congruence subgroup of level `I` in `SL_n(A)`: the kernel of reduction
modulo `I`. For `A = ℤ` and `I = (N)` it is Mathlib's `CongruenceSubgroup.Gamma N` up to
the identification of `ℤ ⧸ (N)` with `ZMod N`. -/
def principalCongruence (A : Type u) [CommRing A] (n : ℕ) (I : Ideal A) :
    Subgroup (Matrix.SpecialLinearGroup (Fin n) A) :=
  (Matrix.SpecialLinearGroup.map (Ideal.Quotient.mk I)).ker

/-- The relative elementary subgroup `E_n(A, I)`: the subgroup of `GL_n(A)` generated by the
conjugates, by elements of `E_n(A)`, of the elementary matrices `1 + a E_ij` with `a ∈ I`,
that is, the normal closure in `E_n(A)` of the level-`I` elementary matrices. -/
def relativeElementaryGroup (A : Type u) [CommRing A] (n : ℕ) (I : Ideal A) :
    Subgroup (Matrix.GeneralLinearGroup (Fin n) A) :=
  Subgroup.closure {g | ∃ (e t : Matrix.GeneralLinearGroup (Fin n) A) (i j : Fin n) (a : A),
    e ∈ finiteElementaryGroup A n ∧ i ≠ j ∧ a ∈ I ∧
    (t : Matrix (Fin n) (Fin n) A) = 1 + Matrix.single i j a ∧ g = e * t * e⁻¹}

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

/-- Over S-integers with `S` nonempty or `F` having a real place, every determinant-one
matrix of size at least three that is congruent to `1` modulo `I` lies in `E_n(A, I)`:
`SL_n(A, I) = E_n(A, I)` (BMS Theorem 4.1 with Theorem 3.6, pp. 77–78 and 94). -/
theorem sinteger_relative_elementary_generation (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (NumberField.RingOfIntegers F))) [Finite S]
    (hFS : S.Nonempty ∨ ∃ v : NumberField.InfinitePlace F, v.IsReal)
    (n : ℕ) (hn : 3 ≤ n) (I : Ideal (S.integer F))
    (g : Matrix.GeneralLinearGroup (Fin n) (S.integer F))
    (hg : Matrix.GeneralLinearGroup.det g = 1)
    (hI : ∀ i j, (g : Matrix (Fin n) (Fin n) (S.integer F)) i j -
      (1 : Matrix (Fin n) (Fin n) (S.integer F)) i j ∈ I) :
    g ∈ relativeElementaryGroup (S.integer F) n I := by
  sorry

/-- The congruence subgroup property for `SL_n` of S-integers, `n ≥ 3`, when `S` is nonempty
or `F` has a real place: every finite-index subgroup contains a principal congruence
subgroup of nonzero level (BMS Corollary 4.3(d), p. 96; Theorem 14.1, pp. 129–130). -/
theorem congruence_subgroup_property (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (NumberField.RingOfIntegers F))) [Finite S]
    (hFS : S.Nonempty ∨ ∃ v : NumberField.InfinitePlace F, v.IsReal)
    (n : ℕ) (hn : 3 ≤ n)
    (H : Subgroup (Matrix.SpecialLinearGroup (Fin n) (S.integer F))) [H.FiniteIndex] :
    ∃ I : Ideal (S.integer F), I ≠ ⊥ ∧ principalCongruence (S.integer F) n I ≤ H := by
  sorry

/-- Failure of the congruence subgroup property for the ring of integers of a totally
imaginary number field, `n ≥ 3`: some finite-index subgroup of `SL_n(O_F)` contains no
principal congruence subgroup of nonzero level, the congruence kernel being `μ(F)`
(BMS Corollary 4.3(d), p. 96; Theorem 14.1, pp. 129–130). -/
theorem congruence_subgroup_failure (F : Type u) [Field F] [NumberField F]
    (hF : ∀ v : NumberField.InfinitePlace F, v.IsComplex)
    (n : ℕ) (hn : 3 ≤ n) :
    ∃ H : Subgroup (Matrix.SpecialLinearGroup (Fin n) (NumberField.RingOfIntegers F)),
      H.FiniteIndex ∧ ∀ I : Ideal (NumberField.RingOfIntegers F), I ≠ ⊥ →
        ¬ principalCongruence (NumberField.RingOfIntegers F) n I ≤ H := by
  sorry

/-- Every finite-index subgroup of SL₂ over S-integers is finitely generated,
without a unit-rank restriction (Serre 1970, §1.2, p. 490). -/
theorem arithmeticSL2_finitelyGenerated (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (NumberField.RingOfIntegers F))) [Finite S]
    (H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) (S.integer F)))
    [H.FiniteIndex] : Group.FG H := by
  sorry

/-- Under positive S-unit rank, every finite-index subgroup of SL₂ over S-integers
contains a principal congruence subgroup of nonzero level when S is nonempty or the
field has a real place (Serre 1970, Theorem 2 and Corollary 3, pp. 498–499). -/
theorem rankTwo_congruence_subgroup_property (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (NumberField.RingOfIntegers F))) [Finite S]
    (hRank : 2 ≤ Nat.card (NumberField.InfinitePlace F) + Nat.card S)
    (hFS : S.Nonempty ∨ ∃ v : NumberField.InfinitePlace F, v.IsReal)
    (H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) (S.integer F))) [H.FiniteIndex] :
    ∃ I : Ideal (S.integer F), I ≠ ⊥ ∧ principalCongruence (S.integer F) 2 I ≤ H := by
  sorry

/-- For a totally imaginary number field with positive unit rank, some finite-index
subgroup of SL₂ of its integers contains no nonzero principal congruence level
(Serre 1970, Theorem 2 and Corollaries 1–4, pp. 498–500). -/
theorem rankTwo_congruence_subgroup_failure (F : Type u) [Field F] [NumberField F]
    (hRank : 2 ≤ Nat.card (NumberField.InfinitePlace F))
    (hF : ∀ v : NumberField.InfinitePlace F, v.IsComplex) :
    ∃ H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) (NumberField.RingOfIntegers F)),
      H.FiniteIndex ∧ ∀ I : Ideal (NumberField.RingOfIntegers F), I ≠ ⊥ →
        ¬ principalCongruence (NumberField.RingOfIntegers F) 2 I ≤ H := by
  sorry

end TauCetiRoadmap.KTheoryLowDegrees
