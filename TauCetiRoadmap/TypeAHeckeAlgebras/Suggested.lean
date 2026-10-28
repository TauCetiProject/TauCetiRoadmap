/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The Tau Ceti contributors
-/
module

public import TauCeti.KnotTheory.Jimbo.Basic
public import TauCeti.KnotTheory.Jimbo.Trace
public import TauCeti.Algebra.TemperleyLieb.MarkovTrace
public import Mathlib.Algebra.FreeAlgebra
public import Mathlib.Algebra.RingQuot
public import Mathlib.Algebra.Algebra.Subalgebra.Lattice

/-!
# Type-A Hecke supplier interfaces

**This file is not the roadmap and is not exhaustive.** The README is definitive.

This file prototypes finite and infinite relation quotients with their basic API. The existing Jimbo representation is a
representation of the braid group which satisfies the finite Hecke quadratic relation; it is not
the universal type-A Hecke algebra. The weighted trace is Turaev's finite-color trace, and the
native Markov trace is on the ordinary Temperley–Lieb algebra. No target below assumes that either
is the general Ocneanu trace or proves positivity for a q-Hecke tower.

The proposed algebraic supplier fixes a unit parameter `q`, the relation
`(Tᵢ−q)(Tᵢ+q⁻¹)=0`, and tower maps. This file currently prototypes quotient carriers and selected
universal-map interfaces; it does not define or prove the compatible algebraic Ocneanu trace.
PBW and injectivity, the algebraic trace and its Markov rule, and positivity on a specified
involutive quotient remain separate README targets. The p. 88 source tuple and the native skein convention must be compared by an explicit theorem.
The source parameter line prints `tan θ`; the stabilization identity derived from its two
projection eigenvalues uses `tanh θ`. Keep the literal source convention and derived target distinct.
-/

public section

namespace TauCetiRoadmap.TypeAHeckePrototype

variable {R : Type*} [CommRing R]

/-- The free associative algebra on generators `T_i`, `i : ℕ`. -/
abbrev HeckeRaw := FreeAlgebra R ℕ

/-- A formal generator before quotienting. -/
def rawT (i : ℕ) : HeckeRaw (R := R) := FreeAlgebra.ι R i

/-- Quadratic, braid, and distant-commutation equations. `RingQuot` closes these under ring
operations and provides the quotient universal property. -/
def heckeRelation (q : Rˣ) (x y : HeckeRaw (R := R)) : Prop :=
  (∃ i, x = rawT i * rawT i ∧
      y = (((q : R) - ((q⁻¹ : Rˣ) : R)) • rawT i) + 1) ∨
  (∃ i, x = rawT i * rawT (i + 1) * rawT i ∧
      y = rawT (i + 1) * rawT i * rawT (i + 1)) ∨
  (∃ i j, (i + 2 ≤ j ∨ j + 2 ≤ i) ∧ x = rawT i * rawT j ∧
      y = rawT j * rawT i)

/-- Universal algebraic type-A Hecke algebra on all braid-generator indices. -/
abbrev HeckeAlgebra (q : Rˣ) := RingQuot (heckeRelation (R := R) q)

/-- The image of `T_i` in the relation quotient. -/
def heckeT (q : Rˣ) (i : ℕ) : HeckeAlgebra (R := R) q :=
  RingQuot.mkAlgHom R (heckeRelation (R := R) q) (FreeAlgebra.ι R i)

/-- The first `n` generators, corresponding to braids on `n+1` strands. -/
def heckeStage (q : Rˣ) (n : ℕ) : Subalgebra R (HeckeAlgebra (R := R) q) :=
  Algebra.adjoin R (Set.range fun i : Fin n => heckeT (R := R) q i.val)

/-- The stage inclusion induced by enlarging the initial generator range. -/
theorem heckeStage_le_succ (q : Rˣ) (n : ℕ) :
    heckeStage (R := R) q n ≤ heckeStage (R := R) q (n + 1) := by
  apply Algebra.adjoin_mono
  rintro _ ⟨i, rfl⟩
  exact ⟨i.castSucc, rfl⟩

/-- The quotient map realizes the quadratic relation. -/
theorem heckeT_mul_self (q : Rˣ) (i : ℕ) :
    heckeT q i * heckeT q i =
      ((q : R) - ((q⁻¹ : Rˣ) : R)) • heckeT q i + 1 := by
  have h := RingQuot.mkAlgHom_rel R (s := heckeRelation q)
    (Or.inl ⟨i, rfl, rfl⟩)
  simpa [rawT, heckeT] using h

/-- Adjacent generators satisfy the braid relation. -/
theorem heckeT_braid (q : Rˣ) (i : ℕ) :
    heckeT q i * heckeT q (i+1) * heckeT q i =
      heckeT q (i+1) * heckeT q i * heckeT q (i+1) := by
  have h := RingQuot.mkAlgHom_rel R (s := heckeRelation q)
    (Or.inr (Or.inl ⟨i, rfl, rfl⟩))
  simpa [rawT, heckeT] using h

/-- Distant generators commute. -/
theorem heckeT_distant (q : Rˣ) (i j : ℕ) (hij : i+2 ≤ j ∨ j+2 ≤ i) :
    heckeT q i * heckeT q j = heckeT q j * heckeT q i := by
  have h := RingQuot.mkAlgHom_rel R (s := heckeRelation q)
    (Or.inr (Or.inr ⟨i, j, hij, rfl, rfl⟩))
  simpa [rawT, heckeT] using h

/-- The inverse polynomial is already defined in the quotient. -/
def heckeInv (q : Rˣ) (i : ℕ) : HeckeAlgebra (R := R) q :=
  heckeT q i - algebraMap R _ ((q : R) - ((q⁻¹ : Rˣ) : R))

theorem heckeT_mul_inv (q : Rˣ) (i : ℕ) : heckeT q i * heckeInv q i = 1 := by
  rw [heckeInv, mul_sub, ← (Algebra.commutes (R := R)
    ((q : R) - ((q⁻¹ : Rˣ) : R)) (heckeT q i)),
    ← Algebra.smul_def, heckeT_mul_self]
  exact add_sub_cancel_left _ _

theorem heckeInv_mul (q : Rˣ) (i : ℕ) : heckeInv q i * heckeT q i = 1 := by
  rw [heckeInv, sub_mul, ← Algebra.smul_def, heckeT_mul_self]
  exact add_sub_cancel_left _ _

/-- Each generator is a unit, before any star operation is considered. -/
def heckeUnit (q : Rˣ) (i : ℕ) : (HeckeAlgebra (R := R) q)ˣ where
  val := heckeT q i
  inv := heckeInv q i
  val_inv := heckeT_mul_inv q i
  inv_val := heckeInv_mul q i

section Universal
variable {A : Type*} [Ring A] [Algebra R A]

/-- Universal algebra map for a family satisfying the three defining relations. -/
def heckeLift (q : Rˣ) (f : ℕ → A)
    (hq : ∀ i, f i * f i = ((q : R) - ((q⁻¹ : Rˣ) : R)) • f i + 1)
    (hb : ∀ i, f i * f (i+1) * f i = f (i+1) * f i * f (i+1))
    (hd : ∀ i j, (i+2 ≤ j ∨ j+2 ≤ i) → f i * f j = f j * f i) :
    HeckeAlgebra (R := R) q →ₐ[R] A :=
  RingQuot.liftAlgHom R ⟨FreeAlgebra.lift R f, by
    rintro x y (⟨i, rfl, rfl⟩ | ⟨i, rfl, rfl⟩ | ⟨i, j, hij, rfl, rfl⟩)
    · simpa [rawT] using hq i
    · simpa [rawT] using hb i
    · simpa [rawT] using hd i j hij⟩

@[simp] theorem heckeLift_T (q : Rˣ) (f : ℕ → A) (hq hb hd) (i : ℕ) :
    heckeLift q f hq hb hd (heckeT q i) = f i := by
  simp [heckeLift, heckeT]

/-- Algebra maps from the quotient are determined by generator values. -/
@[ext] theorem hecke_hom_ext (q : Rˣ) (f g : HeckeAlgebra (R := R) q →ₐ[R] A)
    (h : ∀ i, f (heckeT q i) = g (heckeT q i)) : f = g := by
  apply RingQuot.ringQuot_ext'
  apply FreeAlgebra.hom_ext
  funext i
  exact h i
end Universal

/-- The scalar root `q` gives a character of the full algebra. -/
def heckeCharacterPos (q : Rˣ) : HeckeAlgebra (R := R) q →ₐ[R] R :=
  heckeLift q (fun _ => (q : R))
    (by intro i; simp [smul_eq_mul, sub_mul])
    (by intro i; rfl) (by intro i j h; rfl)

/-- The scalar root `-q⁻¹` gives the other character. -/
def heckeCharacterNeg (q : Rˣ) : HeckeAlgebra (R := R) q →ₐ[R] R :=
  heckeLift q (fun _ => -((q⁻¹ : Rˣ) : R))
    (by intro i; simp [smul_eq_mul, sub_mul, mul_neg])
    (by intro i; rfl) (by intro i j h; rfl)

@[simp] theorem heckeCharacterPos_T (q : Rˣ) (i : ℕ) :
    heckeCharacterPos q (heckeT q i) = (q : R) := by
  simp [heckeCharacterPos]

@[simp] theorem heckeCharacterNeg_T (q : Rˣ) (i : ℕ) :
    heckeCharacterNeg q (heckeT q i) = -((q⁻¹ : Rˣ) : R) := by
  simp [heckeCharacterNeg]

/-- A scalar character splits the coefficient map, so no coefficients collapse. -/
theorem hecke_algebraMap_injective (q : Rˣ) :
    Function.Injective (algebraMap R (HeckeAlgebra (R := R) q)) := by
  apply Function.LeftInverse.injective (g := heckeCharacterPos q)
  intro r
  exact (heckeCharacterPos q).commutes r

/-- Over a nontrivial coefficient ring the universal algebra is nontrivial for every unit q. -/
instance hecke_nontrivial [Nontrivial R] (q : Rˣ) : Nontrivial (HeckeAlgebra (R := R) q) :=
  Function.Injective.nontrivial (hecke_algebraMap_injective q)

/-- The no-generator stage contains exactly the scalars. -/
theorem heckeStage_zero (q : Rˣ) : heckeStage (R := R) q 0 = ⊥ := by
  simp [heckeStage]

/-- Finite presentation on precisely the `n-1` braid generators, independent of the
embedding into the infinite quotient. -/
abbrev FiniteRaw (n : ℕ) := FreeAlgebra R (Fin (n-1))

def finiteRelation (q : Rˣ) (n : ℕ) (x y : FiniteRaw (R := R) n) : Prop :=
  (∃ i, x = FreeAlgebra.ι R i * FreeAlgebra.ι R i ∧
    y = ((q : R) - ((q⁻¹ : Rˣ) : R)) • FreeAlgebra.ι R i + 1) ∨
  (∃ i j, i.val+1 = j.val ∧
    x = FreeAlgebra.ι R i * FreeAlgebra.ι R j * FreeAlgebra.ι R i ∧
    y = FreeAlgebra.ι R j * FreeAlgebra.ι R i * FreeAlgebra.ι R j) ∨
  (∃ i j, (i.val+2 ≤ j.val ∨ j.val+2 ≤ i.val) ∧
    x = FreeAlgebra.ι R i * FreeAlgebra.ι R j ∧
    y = FreeAlgebra.ι R j * FreeAlgebra.ι R i)

abbrev FiniteHecke (q : Rˣ) (n : ℕ) := RingQuot (finiteRelation (R := R) q n)

def finiteT (q : Rˣ) (n : ℕ) (i : Fin (n-1)) : FiniteHecke (R := R) q n :=
  RingQuot.mkAlgHom R (finiteRelation q n) (FreeAlgebra.ι R i)

theorem finiteT_mul_self (q : Rˣ) (n : ℕ) (i : Fin (n-1)) :
    finiteT q n i * finiteT q n i =
      ((q : R) - ((q⁻¹ : Rˣ) : R)) • finiteT q n i + 1 := by
  have h := RingQuot.mkAlgHom_rel R (s := finiteRelation q n)
    (Or.inl ⟨i, rfl, rfl⟩)
  simpa [finiteT] using h

theorem finiteT_braid (q : Rˣ) (n : ℕ) (i j : Fin (n-1)) (hij : i.val+1=j.val) :
    finiteT q n i * finiteT q n j * finiteT q n i =
      finiteT q n j * finiteT q n i * finiteT q n j := by
  have h := RingQuot.mkAlgHom_rel R (s := finiteRelation q n)
    (Or.inr (Or.inl ⟨i,j,hij,rfl,rfl⟩))
  simpa [finiteT] using h

theorem finiteT_distant (q : Rˣ) (n : ℕ) (i j : Fin (n-1))
    (hij : i.val+2 ≤ j.val ∨ j.val+2 ≤ i.val) :
    finiteT q n i * finiteT q n j = finiteT q n j * finiteT q n i := by
  have h := RingQuot.mkAlgHom_rel R (s := finiteRelation q n)
    (Or.inr (Or.inr ⟨i,j,hij,rfl,rfl⟩))
  simpa [finiteT] using h

def finiteInv (q : Rˣ) (n : ℕ) (i : Fin (n-1)) : FiniteHecke (R := R) q n :=
  finiteT q n i - algebraMap R _ ((q : R) - ((q⁻¹ : Rˣ) : R))

theorem finiteT_mul_inv (q : Rˣ) (n : ℕ) (i : Fin (n-1)) :
    finiteT q n i * finiteInv q n i = 1 := by
  rw [finiteInv, mul_sub, ← Algebra.commutes, ← Algebra.smul_def, finiteT_mul_self]
  exact add_sub_cancel_left _ _

theorem finiteInv_mul (q : Rˣ) (n : ℕ) (i : Fin (n-1)) :
    finiteInv q n i * finiteT q n i = 1 := by
  rw [finiteInv, sub_mul, ← Algebra.smul_def, finiteT_mul_self]
  exact add_sub_cancel_left _ _

def finiteUnit (q : Rˣ) (n : ℕ) (i : Fin (n-1)) : (FiniteHecke (R := R) q n)ˣ where
  val := finiteT q n i
  inv := finiteInv q n i
  val_inv := finiteT_mul_inv q n i
  inv_val := finiteInv_mul q n i

def finiteBraid (q : Rˣ) (n : ℕ) : TauCeti.BraidGroup n →* (FiniteHecke (R := R) q n)ˣ :=
  TauCeti.BraidGroup.lift (finiteUnit q n)
    (fun {i j} h => Units.ext (finiteT_distant q n i j h))
    (fun {i j} h => Units.ext (by
      rcases h with h | h
      · exact finiteT_braid q n i j h
      · exact (finiteT_braid q n j i h).symm))

@[simp] theorem finiteBraid_sigma (q : Rˣ) (n : ℕ) (i : Fin (n-1)) :
    finiteBraid q n (TauCeti.BraidGroup.sigma i) = finiteUnit q n i := by
  simp [finiteBraid]

section FiniteUniversal
variable {A : Type*} [Ring A] [Algebra R A]

def finiteLift (q : Rˣ) (n : ℕ) (f : Fin (n-1) → A)
    (hq : ∀ i, f i * f i = ((q : R) - ((q⁻¹ : Rˣ) : R)) • f i + 1)
    (hb : ∀ i j, i.val+1 = j.val → f i * f j * f i = f j * f i * f j)
    (hd : ∀ i j, (i.val+2 ≤ j.val ∨ j.val+2 ≤ i.val) → f i * f j = f j * f i) :
    FiniteHecke (R := R) q n →ₐ[R] A :=
  RingQuot.liftAlgHom R ⟨FreeAlgebra.lift R f, by
    rintro x y (⟨i, rfl, rfl⟩ | ⟨i, j, hij, rfl, rfl⟩ | ⟨i, j, hij, rfl, rfl⟩)
    · simpa using hq i
    · simpa using hb i j hij
    · simpa using hd i j hij⟩

@[simp] theorem finiteLift_T (q : Rˣ) (n : ℕ) (f : Fin (n-1) → A) (hq hb hd)
    (i : Fin (n-1)) : finiteLift q n f hq hb hd (finiteT q n i) = f i := by
  simp [finiteLift, finiteT]

@[ext] theorem finite_hom_ext (q : Rˣ) (n : ℕ)
    (f g : FiniteHecke (R := R) q n →ₐ[R] A)
    (h : ∀ i, f (finiteT q n i) = g (finiteT q n i)) : f = g := by
  apply RingQuot.ringQuot_ext'
  apply FreeAlgebra.hom_ext
  funext i
  exact h i
end FiniteUniversal

/-- The finite presentation maps to the infinite quotient. Injectivity is a separate PBW target. -/
def finiteToInfinity (q : Rˣ) (n : ℕ) :
    FiniteHecke (R := R) q n →ₐ[R] HeckeAlgebra (R := R) q :=
  finiteLift q n (fun i => heckeT q i.val)
    (fun i => heckeT_mul_self q i.val)
    (fun i j hij => by simpa only [hij] using heckeT_braid q i.val)
    (fun i j hij => heckeT_distant q i.val j.val hij)

@[simp] theorem finiteToInfinity_T (q : Rˣ) (n : ℕ) (i : Fin (n-1)) :
    finiteToInfinity q n (finiteT q n i) = heckeT q i.val := by
  simp [finiteToInfinity]

/-- The finite-presentation strand map; injectivity is a separate PBW target in the README. -/
def finiteStrandIncl (q : Rˣ) (n : ℕ) :
    FiniteHecke (R := R) q (n+1) →ₐ[R] FiniteHecke (R := R) q (n+2) :=
  finiteLift q (n+1) (fun i => finiteT q (n+2) i.castSucc)
    (fun i => finiteT_mul_self q (n+2) i.castSucc)
    (fun i j hij => finiteT_braid q (n+2) i.castSucc j.castSucc hij)
    (fun i j hij => finiteT_distant q (n+2) i.castSucc j.castSucc hij)

@[simp] theorem finiteStrandIncl_T (q : Rˣ) (n : ℕ) (i : Fin n) :
    finiteStrandIncl q n (finiteT q (n+1) i) = finiteT q (n+2) i.castSucc := by
  simp [finiteStrandIncl]

/-- The actual native Jimbo representation factors through the finite Hecke presentation.
No faithfulness, PBW basis or infinite-tower representation is assumed. -/
noncomputable def finiteJimbo (q : Rˣ) (n : ℕ) (ι : Type*) [LinearOrder ι] :
    FiniteHecke (R := R) q n →ₐ[R] Module.End R ((Fin n → ι) →₀ R) :=
  finiteLift q n (fun i => (TauCeti.KnotTheory.jimbo ι q (TauCeti.BraidGroup.sigma i) :
      Module.End R ((Fin n → ι) →₀ R)))
    (by
      intro i
      simpa only [TauCeti.KnotTheory.jimbo_sigma, TauCeti.KnotTheory.jimboUnit_val] using
        TauCeti.KnotTheory.jimboGenerator_mul_self (ι := ι) q
          (TauCeti.BraidGroup.strand_ne_strandSucc i))
    (by
      intro i j hij
      have h := congrArg (fun b => ((TauCeti.KnotTheory.jimbo ι q b :
        (Module.End R ((Fin n → ι) →₀ R))ˣ) : Module.End R ((Fin n → ι) →₀ R)))
        (TauCeti.BraidGroup.sigma_braid (Or.inl hij))
      simpa only [map_mul, Units.val_mul] using h)
    (by
      intro i j hij
      have h := congrArg (fun b => ((TauCeti.KnotTheory.jimbo ι q b :
        (Module.End R ((Fin n → ι) →₀ R))ˣ) : Module.End R ((Fin n → ι) →₀ R)))
        (TauCeti.BraidGroup.sigma_mul_sigma_comm hij)
      simpa only [map_mul, Units.val_mul] using h)

@[simp] theorem finiteJimbo_T (q : Rˣ) (n : ℕ) (ι : Type*) [LinearOrder ι]
    (i : Fin (n-1)) : finiteJimbo q n ι (finiteT q n i) =
      TauCeti.KnotTheory.jimboGenerator q (TauCeti.BraidGroup.strand i)
        (TauCeti.BraidGroup.strandSucc i) := by
  simp [finiteJimbo]

def finiteCharacterPos (q : Rˣ) (n : ℕ) : FiniteHecke (R := R) q n →ₐ[R] R :=
  (heckeCharacterPos q).comp (finiteToInfinity q n)

def finiteCharacterNeg (q : Rˣ) (n : ℕ) : FiniteHecke (R := R) q n →ₐ[R] R :=
  (heckeCharacterNeg q).comp (finiteToInfinity q n)

@[simp] theorem finiteCharacterPos_T (q : Rˣ) (n : ℕ) (i : Fin (n-1)) :
    finiteCharacterPos q n (finiteT q n i) = (q : R) := by
  simp [finiteCharacterPos]

@[simp] theorem finiteCharacterNeg_T (q : Rˣ) (n : ℕ) (i : Fin (n-1)) :
    finiteCharacterNeg q n (finiteT q n i) = -((q⁻¹ : Rˣ) : R) := by
  simp [finiteCharacterNeg]

theorem finite_algebraMap_injective (q : Rˣ) (n : ℕ) :
    Function.Injective (algebraMap R (FiniteHecke (R := R) q n)) := by
  apply Function.LeftInverse.injective (g := finiteCharacterPos q n)
  intro r
  exact (finiteCharacterPos q n).commutes r

instance finite_nontrivial [Nontrivial R] (q : Rˣ) (n : ℕ) :
    Nontrivial (FiniteHecke (R := R) q n) :=
  Function.Injective.nontrivial (finite_algebraMap_injective q n)

/-- Factoring through the presentation recovers the full native braid representation. -/
theorem finiteJimbo_comp_braid (q : Rˣ) (n : ℕ) (ι : Type*) [LinearOrder ι] :
    (Units.map (finiteJimbo q n ι).toMonoidHom).comp (finiteBraid q n) =
      TauCeti.KnotTheory.jimbo ι q := by
  apply TauCeti.BraidGroup.hom_ext
  intro i
  apply Units.ext
  simp [finiteUnit]

/-- The finite presentation's image is exactly the intended adjoined stage;
this statement does not assert that the map is injective. -/
theorem finiteToInfinity_range (q : Rˣ) (n : ℕ) :
    (finiteToInfinity (R := R) q n).range = heckeStage q (n-1) := by
  have hcomp : (finiteToInfinity q n).comp (RingQuot.mkAlgHom R (finiteRelation q n)) =
      FreeAlgebra.lift R (fun i : Fin (n-1) => heckeT q i.val) := by
    apply FreeAlgebra.hom_ext
    funext i
    simpa [Function.comp_def, finiteT] using finiteToInfinity_T q n i
  rw [heckeStage, Algebra.adjoin_range_eq_range_freeAlgebra_lift]
  ext x
  constructor
  · rintro ⟨y,rfl⟩
    obtain ⟨a,rfl⟩ := RingQuot.mkAlgHom_surjective R (finiteRelation q n) y
    exact ⟨a,(DFunLike.congr_fun hcomp a).symm⟩
  · rintro ⟨a,rfl⟩
    exact ⟨RingQuot.mkAlgHom R (finiteRelation q n) a, DFunLike.congr_fun hcomp a⟩

/-- Both presentation maps send each old generator to the same infinite generator. -/
theorem finiteToInfinity_comp_strand (q : Rˣ) (n : ℕ) :
    (finiteToInfinity (R := R) q (n+2)).comp (finiteStrandIncl q n) =
      finiteToInfinity q (n+1) := by
  apply finite_hom_ext
  intro i
  simp

/-- Every element of the infinite quotient lies in the supremum of its finite stages. -/
theorem iSup_heckeStage (q : Rˣ) : (⨆ n, heckeStage (R := R) q n) = ⊤ := by
  have hlift : FreeAlgebra.lift R (heckeT q) =
      RingQuot.mkAlgHom R (heckeRelation q) := by
    apply FreeAlgebra.hom_ext
    funext i
    simp [heckeT]
  have htop : Algebra.adjoin R (Set.range (heckeT q)) = ⊤ := by
    rw [Algebra.adjoin_range_eq_range_freeAlgebra_lift,hlift]
    ext x
    constructor
    · intro _; trivial
    · intro _
      exact RingQuot.mkAlgHom_surjective R (heckeRelation q) x
  apply top_unique
  rw [← htop]
  apply Algebra.adjoin_le
  rintro _ ⟨i,rfl⟩
  apply (le_iSup (fun n => heckeStage q n) (i+1))
  exact Algebra.subset_adjoin ⟨⟨i,Nat.lt_succ_self i⟩,rfl⟩

-- Existing, pinned native interfaces. These checks deliberately avoid a private stand-in algebra.
#check TauCeti.KnotTheory.jimboGenerator
#check TauCeti.KnotTheory.jimboGenerator_mul_self
#check TauCeti.KnotTheory.jimboGenerator_braid
#check TauCeti.KnotTheory.jimbo
#check TauCeti.KnotTheory.jimboWeightedTrace
#check TauCeti.KnotTheory.jimboWeightedTrace_conj
#check TauCeti.KnotTheory.jimboWeightedTrace_skein
#check TauCeti.TemperleyLieb.markovTrace
#check TauCeti.TemperleyLieb.markovTrace_mul_comm
#check TauCeti.TemperleyLieb.markovTrace_strandIncl
#check TauCeti.TemperleyLieb.markovTrace_strandIncl_mul_e_last

/-
Target inventory (specified in README; these are not fake declarations):

* `HeckeTower R q`, finite stages `Hₙ(q)`, universal maps, `T_w` basis and multiplication rule;
* generic split-semisimple simple modules and one-box branching, with exact parameter hypotheses;
* root-of-unity cellular forms, trace radicals, simple heads and quotient maps;
* the algebraic normalized Ocneanu trace on the tower union for arbitrary `z`;
* a separate specified involutive quotient, positive state, GNS tower and radical quotient;
* braid closure, stabilization normalization and corrected HOMFLY parameter map;
* the root-of-unity Wenzl subfactor consumer and separately stated relative entropy theorem.

The positive-trace classification is intentionally not compressed into a single “nonzero iff”
proposition about an unspecified universal C*-algebra. It needs a stated carrier, involution,
normalized state, positivity form and null ideal. The projection characters `eᵢ ↦ 0,1` are
distinct from Hecke characters: for the declared Hecke relation the scalar characters are
`Tᵢ ↦ −q⁻¹` and `Tᵢ ↦ q` at the two endpoints if `Tᵢ=q eᵢ−q⁻¹(1−eᵢ)`. Prove that presentation
map before transporting the endpoint states. These representations do not establish a nontrivial
compatible positive Markov trace.
-/

end TauCetiRoadmap.TypeAHeckePrototype
