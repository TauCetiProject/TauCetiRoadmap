import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Isometry.Group
import TauCeti.LinearAlgebra.IntegralLattice.PosDef.Finite
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Unimodular

/-!
# Orthogonal Tamagawa comparison and lattice masses: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the positive-definite even-unimodular lane: the mass
formula, its exhaustion and counting consequences, over a small Gram-matrix presentation of
native integral-lattice isometry classes (no second lattice or orthogonal-group carrier).

Not statable at the pins, and therefore not stated here:
* the structure theorems of 0.2 (Spin of an arbitrary nondegenerate form is a semisimple simply
  connected central μ₂-cover of SO for rank at least three): Tau Ceti has the form-preserving
  and standard special orthogonal group schemes, but no Spin group scheme;
* the arbitrary-genus mass formula of 1.3 and the orthogonal quotient comparison of 1.1–1.2:
  there is no adelic orthogonal quotient with its Tamagawa measure, and no local density;
* Cho's smooth dyadic model and density formula of 2.1–2.2: there is no smooth integral model
  attached to a Jordan splitting over an unramified extension of `ℤ₂`.
-/

noncomputable section
open scoped BigOperators
open TauCeti

namespace TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass

abbrev GramMatrix (n : ℕ) := Matrix (Fin n) (Fin n) ℤ

/-- Integral positive Gram presentations, including the empty rank-zero matrix. -/
abbrev PositiveGram (n : ℕ) :=
  {G : GramMatrix n // G.IsSymm ∧ (G.map (algebraMap ℤ ℚ)).PosDef}

def nativeLattice {n : ℕ} (G : PositiveGram n) :
    IntegralLattice (Fin n → ℚ) :=
  IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin n)) G.1 G.2.1

/-- Integral basis changes, with invertibility retained even before definiteness is used. -/
def GramEquivalent {n : ℕ} (G H : PositiveGram n) : Prop :=
  ∃ A : GramMatrix n, IsUnit A.det ∧ A.transpose * G.1 * A = H.1

/-- Integral congruence of Gram matrices is an equivalence relation. -/
def gramSetoid (n : ℕ) : Setoid (PositiveGram n) where
  r := GramEquivalent
  iseqv :=
    { refl := fun G => ⟨1, by simp, by simp⟩
      symm := fun {G H} ⟨A, hA, hAGH⟩ => by
        refine ⟨A⁻¹, Matrix.isUnit_nonsing_inv_det A hA, ?_⟩
        rw [← hAGH, Matrix.transpose_nonsing_inv]
        calc A.transpose⁻¹ * (A.transpose * G.1 * A) * A⁻¹
            = (A.transpose⁻¹ * A.transpose) * G.1 * (A * A⁻¹) := by
              simp only [Matrix.mul_assoc]
          _ = G.1 := by
              rw [Matrix.nonsing_inv_mul _ (by rwa [Matrix.det_transpose]),
                Matrix.mul_nonsing_inv _ hA, Matrix.one_mul, Matrix.mul_one]
      trans := fun {G H K} ⟨A, hA, hAGH⟩ ⟨B, hB, hBHK⟩ => by
        refine ⟨A * B, by rw [Matrix.det_mul]; exact hA.mul hB, ?_⟩
        rw [← hBHK, ← hAGH, Matrix.transpose_mul]
        simp only [Matrix.mul_assoc] }

abbrev GramClass (n : ℕ) := Quotient (gramSetoid n)

def classOf {n : ℕ} (G : PositiveGram n) : GramClass n :=
  Quotient.mk (gramSetoid n) G

/-- The comparison includes both directions and respects the actual native lattice carrier. -/
theorem gramEquivalent_iff_native_isometry {n : ℕ} (G H : PositiveGram n) :
    GramEquivalent G H ↔ Nonempty (IntegralLattice.Isometry (nativeLattice G) (nativeLattice H)) := by
  sorry

/-- Preservation of a nondegenerate integral Gram form forces determinant ±1. -/
theorem determinant_eq_one_or_neg_one {n : ℕ} (G : PositiveGram n) (A : GramMatrix n)
    (hA : A.transpose * G.1 * A = G.1) : A.det = 1 ∨ A.det = -1 := by
  sorry

abbrev GramAutomorphism {n : ℕ} (G : PositiveGram n) :=
  {A : GramMatrix n // A.transpose * G.1 * A = G.1}

/-- Matrix enumeration counts the full O group, with no determinant-one restriction: the
integral matrices preserving `G` are exactly the native self-isometries of its lattice. -/
theorem card_gramAutomorphism {n : ℕ} (G : PositiveGram n) :
    Nat.card (GramAutomorphism G) =
      Nat.card (IntegralLattice.Isometry (nativeLattice G) (nativeLattice G)) := by
  sorry

/-- A finite box covers every automorphism; its construction uses positive definiteness. -/
theorem exists_automorphism_box {n : ℕ} (G : PositiveGram n) :
    ∃ b : Fin n → Fin n → ℕ, ∀ A : GramAutomorphism G,
      ∀ i j, Int.natAbs (A.1 i j) ≤ b i j := by
  sorry

theorem gramAutomorphism_finite {n : ℕ} (G : PositiveGram n) :
    Finite (GramAutomorphism G) := by
  sorry

def fullAutomorphismOrder {n : ℕ} (G : PositiveGram n) : ℕ :=
  Nat.card (IntegralLattice.Isometry (nativeLattice G) (nativeLattice G))

theorem fullAutomorphismOrder_pos {n : ℕ} (G : PositiveGram n) :
    0 < fullAutomorphismOrder G := by
  sorry

/-- Descent is justified by conjugation under actual integral isometries. -/
def classAutomorphismOrder {n : ℕ} (c : GramClass n) : ℕ :=
  fullAutomorphismOrder (Quotient.out c)

theorem classAutomorphismOrder_classOf {n : ℕ} (G : PositiveGram n) :
    classAutomorphismOrder (classOf G) = fullAutomorphismOrder G := by
  sorry

/-- Evenness and unimodularity use the native lattice predicates. -/
def evenUnimodularClasses (n : ℕ) : Set (GramClass n) :=
  {c | ∃ G : PositiveGram n, classOf G = c ∧
    (nativeLattice G).IsEven ∧ (nativeLattice G).IsUnimodular}

theorem finite_evenUnimodularClasses (n : ℕ) : (evenUnimodularClasses n).Finite := by
  sorry

def evenUnimodularMass (n : ℕ) : ℚ :=
  ∑' c : evenUnimodularClasses n, (classAutomorphismOrder c.1 : ℚ)⁻¹

/-- The Bernoulli convention is the native one with B₁=-1/2; rank zero is separate. -/
def bernoulliFullMass (m : ℕ) : ℚ :=
  |bernoulli m / (2 * (m : ℚ))| *
    ∏ j ∈ Finset.Ico 1 m, |bernoulli (2 * j) / (4 * (j : ℚ))|

theorem evenUnimodularMass_eq (n : ℕ) (hn : 0 < n) (h8 : 8 ∣ n) :
    evenUnimodularMass n = bernoulliFullMass (n / 2) := by
  sorry

theorem rankZero_mass : evenUnimodularMass 0 = 1 := by
  sorry

theorem bernoulliFullMass_four : bernoulliFullMass 4 = (696729600 : ℚ)⁻¹ := by
  sorry

/-- A mass-saturating injective list is exhaustive because every omitted term is positive. -/
theorem complete_of_mass_eq {n : ℕ} {ι : Type*} [Fintype ι]
    (f : ι → evenUnimodularClasses n) (hf : Function.Injective f)
    (hmass : (∑ i, (classAutomorphismOrder (f i).1 : ℚ)⁻¹) = evenUnimodularMass n) :
    Function.Surjective f := by
  sorry

theorem two_mul_mass_le_classNumber (n : ℕ) (hn : 0 < n) :
    2 * evenUnimodularMass n ≤ (Nat.card (evenUnimodularClasses n) : ℚ) := by
  sorry

/-- Exact rational arithmetic; the separate mass and single-genus comparisons remain required. -/
theorem rank32_arithmetic_bound : (10 : ℚ) ^ 7 < 2 * bernoulliFullMass 16 := by
  sorry

theorem rank40_arithmetic_bound : (10 : ℚ) ^ 51 < 2 * bernoulliFullMass 20 := by
  sorry

end TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass
