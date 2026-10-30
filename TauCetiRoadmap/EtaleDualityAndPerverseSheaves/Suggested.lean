import Mathlib

/-!
# Étale duality, perverse decomposition and local traces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones; discharging
all of them finishes neither a layer nor the roadmap.

The stated results are self-injectivity and finite-module biduality (§0.1), the abelian
heart theorem (§2.1), the finite-length splitting lemma underlying the perverse weight
filtration (§5.4), and the similitude signs and graded Frobenius reciprocity of §§8.1–8.2.
The latter include generalized-eigenspace multiplicities, reciprocal polynomials, the
middle-degree signs and the global determinant relation, without semisimplicity.

The geometric headlines require objects absent at the pins: bounded constructible étale
coefficient categories and their six operations for Verdier/Poincaré duality and flat
traces (Layer 0); supported étale cycle classes and Chow groups for Chern classes and
Chow descent (Layer 1); perverse categories, recollement and intersection complexes for
the perverse calculus (Layer 2); normalized ramified adic systems and supported Betti,
analytic and diamond realization functors for comparison (Layer 3); geometric cohomology,
Gysin and cup-product maps for the refined Lefschetz, blow-up and complete-intersection
results (Layer 4); mixed perverse objects, weights, coherent Tate-twisted Lefschetz objects
and geometric-origin specialization for weight filtrations, primitive decomposition,
decomposition and relative hard Lefschetz (Layer 5); and cohomological correspondences,
trace classes, nearby cycles, normal cones and ULA specialization for the contracting,
Fujiwara–Varshavsky and tubular local-term theorems (Layers 6–7). Mathlib's
`Scheme.ellAdicSheaf` and `Scheme.EllAdicCohomology` do not supply these constructible
categories, compact supports, twists or operations. The geometric Poincaré realization
of the graded linear data in §8.2 also needs those objects. These headlines therefore
have no signatures here.
-/

noncomputable section

open CategoryTheory Limits Pretriangulated Triangulated

universe u v

namespace TauCetiRoadmap.EtaleDualityAndPerverseSheaves

/-- Every positive uniformizer-power quotient of a DVR is self-injective.
This includes equal-characteristic DVRs and ramified mixed-characteristic DVRs. -/
theorem uniformizerQuotient_selfInjective
    (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (π : O) (hπ : Irreducible π) (m : ℕ) (hm : 0 < m) :
    Module.Injective (O ⧸ Ideal.span {π ^ m}) (O ⧸ Ideal.span {π ^ m}) := by
  sorry

/-- Finite biduality over a Noetherian self-injective coefficient ring requires
finite generation, but does not require projectivity. -/
theorem finiteModule_eval_bijective
    (R : Type u) [CommRing R] [IsNoetherianRing R] [Module.Injective R R]
    (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M] :
    Function.Bijective (Module.Dual.eval R M) := by
  sorry

/-- The heart of a t-structure on a triangulated category admits an abelian structure.
No boundedness or nondegeneracy of the t-structure is assumed. -/
theorem heart_abelian {C : Type*} [Category C] [Preadditive C] [HasZeroObject C]
    [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive]
    [Pretriangulated C] [IsTriangulated C] (t : TStructure C) :
    Nonempty (Abelian t.heart.FullSubcategory) := by
  sorry

section SplittingLemma
variable {C : Type u} [Category.{v} C] [Abelian C]

/-- The simple subquotients of `X` all satisfy `P`: for subobjects `A ≤ B` with `B / A` simple,
`P (B / A)`. -/
def SimpleSubquotientsIn (P : C → Prop) (X : C) : Prop :=
  ∀ (A B : Subobject X) (h : A ≤ B), Simple (cokernel (Subobject.ofLE A B h)) →
    P (cokernel (Subobject.ofLE A B h))

/-- BBD Lemme 5.3.6: for a partition of the simple
objects into `P` and `¬ P` with every extension of a `¬ P`-simple by a `P`-simple split, every
finite-length object has a unique subobject with all simple subquotients in `¬ P` and quotient
with all simple subquotients in `P`. -/
theorem exists_unique_torsion_subobject (P : C → Prop)
    (hP : ∀ {X Y : C}, Nonempty (X ≅ Y) → (P X ↔ P Y))
    (hsplit : ∀ S : ShortComplex C, S.ShortExact → Simple S.X₁ → Simple S.X₃ → P S.X₁ →
      ¬ P S.X₃ → Nonempty S.Splitting)
    (F : C) [IsArtinianObject F] [IsNoetherianObject F] :
    ∃! W : Subobject F, SimpleSubquotientsIn (fun Z => ¬ P Z) (W : C) ∧
      SimpleSubquotientsIn P (cokernel W.arrow) := sorry

end SplittingLemma

section FormSimilitude

variable {F : Type u} [Field F] {V : Type v} [AddCommGroup V] [Module F V]
  [FiniteDimensional F V]

/-- §8.1: an alternating similitude has determinant `c^(b/2)` and even multiplicities at
both square roots of its multiplier, computed after extension to an algebraic closure. -/
theorem form_similitude_det_alt (h2 : (2 : F) ≠ 0) (B : LinearMap.BilinForm F V)
    (hB : B.Nondegenerate) (halt : B.IsAlt) (φ : V ≃ₗ[F] V) (c : Fˣ)
    (h : ∀ x y, B (φ x) (φ y) = (c : F) * B x y)
    (K : Type*) [Field K] [Algebra F K] [IsAlgClosed K]
    (s : K) (hs : s * s = algebraMap F K (c : F)) :
    Even (Module.finrank F V) ∧
      Even (Module.finrank K (Module.End.maxGenEigenspace (φ.toLinearMap.baseChange K) s)) ∧
      Even (Module.finrank K (Module.End.maxGenEigenspace (φ.toLinearMap.baseChange K) (-s))) ∧
      LinearMap.det φ.toLinearMap = (c : F) ^ (Module.finrank F V / 2) := by
  sorry

/-- §8.1: the sign of a symmetric similitude is the parity of its generalized `-s`
eigenspace. The formula retains `s^b` in odd rank and permits nonsplit coefficient fields. -/
theorem form_similitude_det_symm (h2 : (2 : F) ≠ 0) (B : LinearMap.BilinForm F V)
    (hB : B.Nondegenerate) (hsymm : B.IsSymm) (φ : V ≃ₗ[F] V) (c : Fˣ)
    (h : ∀ x y, B (φ x) (φ y) = (c : F) * B x y)
    (K : Type*) [Field K] [Algebra F K] [IsAlgClosed K]
    (s : K) (hs : s * s = algebraMap F K (c : F)) :
    let mPlus := Module.finrank K (Module.End.maxGenEigenspace (φ.toLinearMap.baseChange K) s)
    let mMinus := Module.finrank K (Module.End.maxGenEigenspace (φ.toLinearMap.baseChange K) (-s))
    Even ((Module.finrank F V : ℤ) - mPlus - mMinus) ∧
      algebraMap F K (LinearMap.det φ.toLinearMap) = (-1) ^ mMinus * s ^ Module.finrank F V ∧
      algebraMap F K (LinearMap.det φ.toLinearMap) =
        (-1) ^ (Module.finrank F V - mPlus) * s ^ Module.finrank F V := by
  sorry

end FormSimilitude

section GradedReciprocity

variable {E : Type u} [Field E]

/-- The bounded Euler sum uses integer degrees, with no truncated natural subtraction. -/
def gradedEulerChar (d : ℕ) (b : ℤ → ℕ) : ℤ :=
  ∑ i ∈ Finset.Icc (0 : ℤ) (2 * (d : ℤ)), (-1 : ℤ) ^ i.toNat * (b i : ℤ)

variable (H : ℤ → Type v) [∀ i, AddCommGroup (H i)] [∀ i, Module E (H i)]
  [∀ i, FiniteDimensional E (H i)]

/-- The alternating product of Frobenius determinants, in the unit group. -/
def gradedDelta (d : ℕ) (F : ∀ i, H i ≃ₗ[E] H i) : Eˣ :=
  ∏ i ∈ Finset.Icc (0 : ℤ) (2 * (d : ℤ)), LinearEquiv.det (F i) ^ ((-1 : ℤ) ^ i.toNat)

/-- The Frobenius polynomial `det(1 - t F)`, using the reverse of the characteristic
polynomial of an automorphism. -/
def frobPoly {V : Type*} [AddCommGroup V] [Module E V] [FiniteDimensional E V]
    (F : V ≃ₗ[E] V) : Polynomial E :=
  F.toLinearMap.charpoly.reverse

/-- §8.2: perfect complementary pairings with the Poincaré multiplier and Koszul sign
imply reciprocal Frobenius polynomials, the middle determinant signs, and `Δ² = q^(dχ)`.
Complementary integer degrees are indexed by the relation `i + j = 2d`. -/
theorem poincareReciprocityExport [CharZero E] (d : ℕ) (q : Eˣ)
    (F : ∀ i, H i ≃ₗ[E] H i)
    (B : ∀ i j : ℤ, i + j = 2 * (d : ℤ) → H i →ₗ[E] H j →ₗ[E] E)
    (hB : ∀ i j (hij : i + j = 2 * (d : ℤ)), (B i j hij).IsPerfPair)
    (hsim : ∀ i j (hij : i + j = 2 * (d : ℤ)) (x : H i) (y : H j),
      B i j hij (F i x) (F j y) = (q : E) ^ d * B i j hij x y)
    (hKoszul : ∀ i j (hij : i + j = 2 * (d : ℤ)) (x : H i) (y : H j),
      B i j hij x y = (-1 : E) ^ i * B j i (by omega) y x) :
    (∀ i j : ℤ, i + j = 2 * (d : ℤ) → 0 ≤ i → 0 ≤ j →
      Module.finrank E (H i) = Module.finrank E (H j) ∧
      (frobPoly (F j)).eval₂ RatFunc.C RatFunc.X * RatFunc.C (LinearMap.det (F i).toLinearMap) =
        (-RatFunc.C ((q : E) ^ d) * RatFunc.X) ^ Module.finrank E (H i) *
          (frobPoly (F i)).eval₂ RatFunc.C ((RatFunc.C ((q : E) ^ d) * RatFunc.X)⁻¹) ∧
      LinearEquiv.det (F i) * LinearEquiv.det (F j) = q ^ (d * Module.finrank E (H i))) ∧
    (Odd d → Even (Module.finrank E (H d)) ∧
      LinearMap.det (F d).toLinearMap = (q : E) ^ (d * Module.finrank E (H d) / 2)) ∧
    (Even d →
      LinearMap.det (F d).toLinearMap =
        (-1) ^ Module.finrank E
          (Module.End.maxGenEigenspace (F d).toLinearMap (-((q : E) ^ (d / 2)))) *
          (q : E) ^ ((d / 2) * Module.finrank E (H d)) ∧
      LinearMap.det (F d).toLinearMap =
        (-1) ^ (Module.finrank E (H d) - Module.finrank E
          (Module.End.maxGenEigenspace (F d).toLinearMap ((q : E) ^ (d / 2)))) *
          (q : E) ^ ((d / 2) * Module.finrank E (H d))) ∧
    gradedDelta H d F ^ 2 =
      q ^ ((d : ℤ) * gradedEulerChar d (fun i => Module.finrank E (H i))) ∧
    Even ((d : ℤ) * gradedEulerChar d (fun i => Module.finrank E (H i))) := by
  sorry

end GradedReciprocity

end TauCetiRoadmap.EtaleDualityAndPerverseSheaves
