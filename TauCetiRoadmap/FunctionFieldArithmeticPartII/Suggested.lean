module

public import Mathlib

/-!
# Function field arithmetic, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs, using affine root-chart and tensor-product carriers.

The following headline theorems are not statable at the pins with a few simple definitions:
* Relative regular root geometry lacks the finite-root stack and its morphism properties.
* The coherent infinite root stack, its fpqc quotient and arbitrary base change lack the
  coherent root pseudofunctor and the represented band-action quotient.
* Infinite affine coinvariants (README §3.385) lack the factorial root colimit `C_A(f)` and its
  left coaction `η_f` by the group algebra `A[ℚ/ℤ]`; both are constructions of Layer 3
  (§§3.58, 3.148, 3.324), not simple definitions.
* The infinite DVR zero-section gerbe, fpqc Kummer classification and non-fppf torsor lack the
  relative infinite gerbe and fpqc torsor groupoid carriers.
* The root Picard square quotient and signed adelic equivalence lack the root Picard stack,
  its degree components and the completed-lattice gluing functor.
* The proper quasi-finite intermediate-extension comparison on rational Deligne–Mumford
  stacks lacks a constructible derived category of stacks and its perverse heart.
* Symmetric lisse lines across collisions and their multiplication lack the root symmetric-power
  stack and its adic lisse coefficient category.
* Exterior-power cohomology of root symmetric powers lacks stack étale cohomology with these
  coefficients and its Frobenius action.
* High-degree Abel–Jacobi descent lacks the root Abel–Jacobi morphism and stack lisse descent.
* The normalized character sheaf in every integer degree lacks the graded root Picard stack
  and its lisse category with Frobenius.
* The ramified norm complex and its torsor obstructions lack the root multiplicative sheaf,
  its norm and their compatible torsor groupoids.
* Quadratic Frobenius trace comparison lacks the root Picard character sheaf and its trace.
-/

@[expose] public section

namespace TauCetiRoadmap.FunctionFieldArithmeticPartII

open scoped TensorProduct Polynomial

universe u

/-! ## Layer 1: Root coordinates and affine comparison -/

/-- The affine root-chart algebra `A[t]/(tⁿ - f)` (README §1.7), for an arbitrary commutative ring
`A` and an arbitrary parameter `f`, including nonunit and nilpotent parameters. At `f = 1` and
positive `n` it models the character Hopf algebra `A[ℤ/n]` of `μ_n`, the root corresponding to
the character `e₁`. -/
abbrev rootChart (A : Type u) [CommRing A] (f : A) (n : ℕ) :=
  AdjoinRoot ((Polynomial.X : A[X]) ^ n - Polynomial.C f)

/-- The universal root-chart coaction `δ : A[t]/(tⁿ - f) → A[h]/(hⁿ - 1) ⊗ A[t]/(tⁿ - f)`
(README §1.7): the `A`-algebra map fixing coefficients with `δ(t) = h ⊗ t`. For positive `n`,
`A[h]/(hⁿ - 1)` is the character Hopf algebra of `μ_n` and `δ` is its left coaction (Talpo–Vistoli,
§3.1); for `n = 0` it is only the displayed quotient-algebra map. -/
noncomputable def rootChartCoaction (A : Type u) [CommRing A] (f : A) (n : ℕ) :
    rootChart A f n →ₐ[A] (rootChart A 1 n) ⊗[A] (rootChart A f n) := by
  let h := AdjoinRoot.root ((Polynomial.X : A[X]) ^ n - Polynomial.C (1 : A))
  let t := AdjoinRoot.root ((Polynomial.X : A[X]) ^ n - Polynomial.C f)
  have hh : h ^ n = 1 := by
    have e := AdjoinRoot.eval₂_root ((Polynomial.X : A[X]) ^ n - Polynomial.C (1 : A))
    simpa only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
      Polynomial.eval₂_C, Polynomial.eval₂_one, map_one, sub_eq_zero] using e
  have ht : t ^ n = algebraMap A (rootChart A f n) f := by
    have e := AdjoinRoot.eval₂_root ((Polynomial.X : A[X]) ^ n - Polynomial.C f)
    simpa only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
      Polynomial.eval₂_C, AdjoinRoot.algebraMap_eq, sub_eq_zero] using e
  refine AdjoinRoot.liftAlgHom _ (Algebra.ofId A _) (h ⊗ₜ[A] t) ?_
  simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
    Polynomial.eval₂_C]
  rw [Algebra.TensorProduct.tmul_pow, hh, ht]
  change 1 ⊗ₜ[A] algebraMap A (rootChart A f n) f -
    algebraMap A (rootChart A 1 n ⊗[A] rootChart A f n) f = 0
  rw [Algebra.TensorProduct.algebraMap_apply']
  exact sub_self _

/-- The affine action comparison `Θ : B ⊗ B → A[h]/(hⁿ - 1) ⊗ B`, `b ⊗ c ↦ δ(b) (1 ⊗ c)`, for
`B = A[t]/(tⁿ - f)` (README §1.26). For positive `n` it is the coordinate ring map of the action
comparison `μ_n × Spec B → Spec B ×_{Spec A} Spec B`. -/
noncomputable def rootChartComparison (A : Type u) [CommRing A] (f : A) (n : ℕ) :
    (rootChart A f n) ⊗[A] (rootChart A f n) →ₐ[A]
      (rootChart A 1 n) ⊗[A] (rootChart A f n) :=
  Algebra.TensorProduct.lift (rootChartCoaction A f n)
    Algebra.TensorProduct.includeRight (fun _ _ => Commute.all _ _)

/-- Sharp injectivity criterion (README §1.190): for positive `n` the affine action comparison is
injective exactly when `n = 1` or `f` is a nonzerodivisor of `A`. -/
theorem rootChartComparison_injective_iff (A : Type u) [CommRing A] (f : A)
    (n : ℕ) (hn : 0 < n) :
    Function.Injective (rootChartComparison A f n) ↔
      n = 1 ∨ Function.Injective (fun a : A => f * a) := by
  sorry

/-- Sharp surjectivity criterion (README §1.191): for positive `n` the affine action comparison is
surjective exactly when `n = 1` or `f` is a unit of `A` (compare Stacks, Tag 040N). -/
theorem rootChartComparison_surjective_iff (A : Type u) [CommRing A] (f : A)
    (n : ℕ) (hn : 0 < n) :
    Function.Surjective (rootChartComparison A f n) ↔ n = 1 ∨ IsUnit f := by
  sorry

/-! ## Layer 2: Relative finite-root geometry -/

/-- Invariants of the affine root chart (README §2.3): for every commutative ring `A`, every
`f ∈ A` and every positive `n`, including `n` divisible by a residue characteristic, an element of
`A[t]/(tⁿ - f)` is fixed by the universal root-chart coaction exactly when it is a coefficient. -/
theorem rootChartCoaction_eq_includeRight_iff (A : Type u) [CommRing A] (f : A) (n : ℕ)
    (hn : 0 < n) (b : rootChart A f n) :
    rootChartCoaction A f n b = Algebra.TensorProduct.includeRight b ↔
      b ∈ (algebraMap A (rootChart A f n)).range := by
  sorry

end TauCetiRoadmap.FunctionFieldArithmeticPartII
