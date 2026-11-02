/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Banach algebras: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs, with simple definitions only where a headline needs them.

The headline inventory follows the README layers: radical/simple-module theory and positive
functionals (1); holomorphic, finite-spectrum and jet calculi, normality and the Ritt bound (2);
characters, Wiener inversion and the absolutely continuous calculus (3); multiplier extension,
Cohen–Hewitt, balanced tensors and Arens regularity (4); automatic continuity and Singer–Wermer (5);
extension classification and the diagonal/cohomology characterizations of amenability (6);
representation correspondence, faithful regular action, Fourier uniqueness, Wendel and Johnson (7); compact Riesz theory, Schauder and
Lomonosov (8).

Construction-dependent headlines not stated here are holomorphic germ calculus (the holomorphic
subalgebra of germs with its compatible neighborhood topologies), jet calculus (the complete
C^r derivative-tuple algebra), the nonunital Gelfand comparison (the nonunital character-space
structure), the Wiener convolution and transform comparisons (the ℓ¹(ℤ) convolution algebra and
its Gelfand transform; the inversion theorem itself is stated below on absolutely summable
coefficient sequences), balanced tensors (the completed balanced quotient), Arens
characterizations (the two extended multiplication maps), extension classification (the bounded
Hochschild complex and extension equivalences), diagonal characterizations (the completed
projective algebra tensor with its actions), and Johnson's theorem (Banach-algebra amenability
and the general locally compact group convolution algebra). These constructions are README
targets, not admitted data or free predicates here. Representation correspondence and Wendel
also require that convolution-algebra structure and the finite regular complex-measure algebra.
The faithful integrated regular action and L¹ semisimplicity require the localized L¹/L²
convolution comparison and the convolution Banach algebra; finite-complex-measure Fourier
uniqueness additionally requires the regular complex-measure algebra and its L¹ action.
-/

noncomputable section
open Filter Topology

namespace TauCetiRoadmap.BanachAlgebras

universe u

/-! ## Layer 1: Constructions, ideals and the radical -/

/-- An algebraic square-positive functional on a unital Banach *-algebra is continuous;
no C*-identity or normalization of the identity norm is assumed. -/
theorem positive_continuous {A : Type*} [NormedRing A] [NormedAlgebra ℂ A]
    [CompleteSpace A] [StarRing A] [NormedStarGroup A] [StarModule ℂ A]
    (φ : A →ₗ[ℂ] ℂ)
    (hφ : ∀ a, (φ (star a * a)).im = 0 ∧ 0 ≤ (φ (star a * a)).re) :
    Continuous φ := by
  sorry

/-- A square-positive functional on a unital Banach *-algebra has a contractive cyclic
Hilbert-space representation with its prescribed vector functional. -/
theorem exists_gns {A : Type u} [NormedRing A] [NormedAlgebra ℂ A]
    [CompleteSpace A] [StarRing A] [NormedStarGroup A] [StarModule ℂ A]
    (φ : A →ₗ[ℂ] ℂ)
    (hφ : ∀ a, (φ (star a * a)).im = 0 ∧ 0 ≤ (φ (star a * a)).re) :
    ∃ (H : Type u) (_ : NormedAddCommGroup H) (_ : InnerProductSpace ℂ H)
      (_ : CompleteSpace H) (π : A →⋆ₐ[ℂ] (H →L[ℂ] H)) (ξ : H),
      (∀ a, ‖π a‖ ≤ ‖a‖) ∧
      (∀ a, φ a = inner ℂ ξ (π a ξ)) ∧
      closure (Set.range fun a : A => π a ξ) = Set.univ := by
  sorry

/-- The nonunital Jacobson radical is the inverse image of the unitization radical. -/
def nonUnitalRadical {A : Type*} [NonUnitalRing A] [Module ℂ A]
    [IsScalarTower ℂ A A] [SMulCommClass ℂ A A] : Set A :=
  {a | Unitization.inr a ∈ Ring.jacobson (Unitization ℂ A)}

/-! ## Layer 2: Spectral calculus -/

/-- An isometric unital complex calculus on the spectrum forces a Hilbert operator to be normal. -/
theorem normal_of_isometric_calculus {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (T : H →L[ℂ] H)
    (φ : C(spectrum ℂ T, ℂ) →ₐ[ℂ] (H →L[ℂ] H))
    (hφ : Isometry φ)
    (hid : φ ⟨fun z => z.val, continuous_subtype_val⟩ = T) : IsStarNormal T := by
  sorry

/-- A finite-dimensional complex operator admits a unique continuous calculus on its spectrum
exactly when its eigenspaces span the whole space, including the zero-dimensional case. -/
theorem finite_spectrum_calculus_iff {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] [FiniteDimensional ℂ E] (T : E →L[ℂ] E) :
    (⨆ z : ℂ, Module.End.eigenspace T.toLinearMap z) = ⊤ ↔
      ∃! φ : C(spectrum ℂ T, ℂ) →ₐ[ℂ] (E →L[ℂ] E),
        φ ⟨fun z => z.val, continuous_subtype_val⟩ = T ∧ Continuous φ := by
  sorry

section Ritt
variable {A : Type*} [NormedRing A] [NormedAlgebra ℂ A] [CompleteSpace A]

/-- A2: the denominator is |z−1|, with inverse existence stated separately. -/
theorem ritt_power_bound (a : A) (C : ℝ) (hC : 0 < C)
    (hres : ∀ z : ℂ, 1 < ‖z‖ → z ∈ resolventSet ℂ a)
    (hbound : ∀ z : ℂ, 1 < ‖z‖ → ‖resolvent a z‖ ≤ C / ‖z - 1‖) :
    ∀ n : ℕ, ‖a ^ n‖ ≤ 3 * C ^ 2 := by
  sorry
end Ritt

/-! ## Layer 3: Characters and examples -/

/-- Wiener's inversion theorem on the Wiener algebra `ℓ¹(ℤ)`: an absolutely convergent Fourier
series vanishing nowhere on the unit circle has an absolutely convergent reciprocal. -/
theorem wiener_inversion (f : lp (fun _ : ℤ ↦ ℂ) 1)
    (h : ∀ z : Circle, (∑' n : ℤ, f n * (z : ℂ) ^ n) ≠ 0) :
    ∃ g : lp (fun _ : ℤ ↦ ℂ) 1,
      ∀ z : Circle, (∑' n : ℤ, f n * (z : ℂ) ^ n) * (∑' n : ℤ, g n * (z : ℂ) ^ n) = 1 := by
  sorry

section AbsolutelyContinuous
open MeasureTheory
open scoped Interval

/-- Lebesgue measure restricted to the closed unit interval. -/
abbrev intervalLebesgue : Measure ℝ := volume.restrict (Set.Icc (0 : ℝ) 1)

/-- Integrable complex functions on the unit interval, modulo almost-everywhere equality. -/
abbrev IntervalL1 := Lp ℂ 1 intervalLebesgue

/-- Initial value and integrable derivative, with their sum norm. -/
abbrev ACData := WithLp 1 (ℂ × IntervalL1)

/-- The absolutely continuous function determined by its initial value and derivative. -/
def acFunction (f : ACData) (x : unitInterval) : ℂ :=
  f.ofLp.1 + ∫ t in (0 : ℝ)..(x : ℝ), f.ofLp.2 t

/-- The AC calculus of multiplication by the coordinate plus Volterra integration has its
prescribed formula and norm bound, is injective, satisfies spectral mapping, and has no bounded
linear extension to all continuous functions. -/
theorem exists_ac_calculus :
    ∃ F : ACData →L[ℂ] C(unitInterval, ℂ),
    ∃ Ψ : ACData →L[ℂ] (IntervalL1 →L[ℂ] IntervalL1),
      (∀ f x, F f x = acFunction f x) ∧
      (∀ f h, ∀ᵐ x ∂intervalLebesgue,
        Ψ f h x = (f.ofLp.1 + ∫ t in (0 : ℝ)..x, f.ofLp.2 t) * h x +
          f.ofLp.2 x * ∫ t in (0 : ℝ)..x, h t) ∧
      (∀ f, ‖Ψ f‖ ≤ ‖f‖) ∧ Function.Injective Ψ ∧
      (∀ f, spectrum ℂ (Ψ f) = Set.range (F f)) ∧
      ¬ ∃ Φ : C(unitInterval, ℂ) →L[ℂ] (IntervalL1 →L[ℂ] IntervalL1),
        ∀ f, Φ (F f) = Ψ f := by
  sorry

end AbsolutelyContinuous

/-! ## Layer 4: Modules, factorization and bidual products -/

section Factorization

variable {A E : Type*} [NonUnitalNormedRing A] [NormedSpace ℂ A]
  [IsScalarTower ℂ A A] [SMulCommClass ℂ A A] [CompleteSpace A]
  [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- A bounded essential representation of a Banach algebra with a two-sided approximate identity
bounded by `C` extends uniquely to a unital bounded representation of its double centralizer
algebra `𝓜(ℂ, A)`, through the left component `S_m = m.fst`, with norm bound `C‖π‖‖m‖`. -/
theorem multiplier_extension (π : A →L[ℂ] E →L[ℂ] E)
    (hπ : ∀ a b x, π (a * b) x = π a (π b x))
    (hess : (Submodule.span ℂ {y : E | ∃ a z, y = π a z}).topologicalClosure = ⊤)
    (l : Filter A) [l.NeBot]
    (hl : ∀ a : A, Tendsto (fun e ↦ e * a) l (𝓝 a))
    (hr : ∀ a : A, Tendsto (fun e ↦ a * e) l (𝓝 a))
    (C : ℝ) (hC : 0 < C) (hbound : ∀ᶠ e in l, ‖e‖ ≤ C) :
    ∃! Φ : DoubleCentralizer ℂ A →L[ℂ] (E →L[ℂ] E),
      (∀ m n, Φ (m * n) = Φ m * Φ n) ∧ Φ 1 = 1 ∧
      (∀ m a x, Φ m (π a x) = π (m.toProd.1 a) x) ∧
      ∀ m, ‖Φ m‖ ≤ C * ‖π‖ * ‖m‖ := by
  sorry

/-- A bounded associative left action, without a unit or a contractivity assumption. -/
theorem cohen_hewitt (L : A →L[ℂ] E →L[ℂ] E)
    (hL : ∀ a b x, L (a * b) x = L a (L b x))
    (l : Filter A) [l.NeBot]
    (hl : ∀ a : A, Tendsto (fun e ↦ e * a) l (𝓝 a))
    (C : ℝ) (hC : 0 < C) (hbound : ∀ᶠ e in l, ‖e‖ ≤ C)
    (x : E)
    (hx : x ∈ (Submodule.span ℂ {y : E | ∃ a z, y = L a z}).topologicalClosure)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ a : A, ∃ y : E, ‖a‖ ≤ C ∧ L a y = x ∧ ‖y - x‖ < ε ∧
      y ∈ (Submodule.span ℂ (Set.range (fun b : A ↦ L b x))).topologicalClosure := by
  sorry

end Factorization


/-! ## Layer 5: Automatic continuity -/

section SeparatingSpace

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
  [NormedAddCommGroup F] [NormedSpace ℂ F]

/-- The vertical fibre at zero of the closure of the graph. -/
def separatingSpace (T : E →ₗ[ℂ] F) : Submodule ℂ F :=
  T.graph.topologicalClosure.comap (LinearMap.inr ℂ E F)

/-- A linear map between Banach spaces is continuous exactly when its separating space is zero. -/
theorem continuous_iff_separatingSpace_eq_bot [CompleteSpace E] [CompleteSpace F]
    (T : E →ₗ[ℂ] F) : Continuous T ↔ separatingSpace T = ⊥ := by
  sorry

end SeparatingSpace

section AutomaticContinuity

variable {A B : Type*} [NormedRing A] [NormedAlgebra ℂ A] [CompleteSpace A]

/-- Surjectivity is essential for a general noncommutative target. -/
theorem continuous_of_surjective_of_semisimple [NormedRing B] [NormedAlgebra ℂ B]
    [CompleteSpace B] (φ : A →ₐ[ℂ] B) (hφ : Function.Surjective φ)
    (hB : Ring.jacobson B = ⊥) : Continuous φ := by
  sorry

/-- Every algebra homomorphism into a commutative semisimple Banach algebra is continuous. -/
theorem continuous_of_commutative_semisimple [NormedCommRing B] [NormedAlgebra ℂ B]
    [CompleteSpace B] (φ : A →ₐ[ℂ] B) (hB : Ring.jacobson B = ⊥) :
    Continuous φ := by
  sorry

/-- The unbounded input map has the ordinary noncommutative Leibniz identity. -/
theorem derivation_continuous (D : A →ₗ[ℂ] A)
    (hD : ∀ a b, D (a * b) = a * D b + D a * b)
    (hA : Ring.jacobson A = ⊥) : Continuous D := by
  sorry

end AutomaticContinuity

section NonUnitalAutomaticContinuity

/-- A surjective homomorphism onto a nonunital semisimple Banach algebra is continuous. -/
theorem nonunital_continuous_of_surjective {A B : Type*}
    [NonUnitalNormedRing A] [NormedSpace ℂ A] [IsScalarTower ℂ A A]
    [SMulCommClass ℂ A A] [CompleteSpace A]
    [NonUnitalNormedRing B] [NormedSpace ℂ B] [IsScalarTower ℂ B B]
    [SMulCommClass ℂ B B] [CompleteSpace B]
    (φ : A →ₙₐ[ℂ] B) (hφ : Function.Surjective φ)
    (hB : nonUnitalRadical (A := B) = {0}) : Continuous φ := by
  sorry

/-- Every homomorphism into a nonunital commutative semisimple Banach algebra is continuous. -/
theorem nonunital_continuous_of_commutative_semisimple {A B : Type*}
    [NonUnitalNormedRing A] [NormedSpace ℂ A] [IsScalarTower ℂ A A]
    [SMulCommClass ℂ A A] [CompleteSpace A]
    [NonUnitalNormedCommRing B] [NormedSpace ℂ B] [IsScalarTower ℂ B B]
    [SMulCommClass ℂ B B] [CompleteSpace B]
    (φ : A →ₙₐ[ℂ] B) (hB : nonUnitalRadical (A := B) = {0}) : Continuous φ := by
  sorry

/-- Derivations on semisimple nonunital Banach algebras are automatically continuous. -/
theorem nonunital_derivation_continuous {A : Type*}
    [NonUnitalNormedRing A] [NormedSpace ℂ A] [IsScalarTower ℂ A A]
    [SMulCommClass ℂ A A] [CompleteSpace A]
    (D : A →ₗ[ℂ] A) (hD : ∀ a b, D (a * b) = a * D b + D a * b)
    (hA : nonUnitalRadical (A := A) = {0}) : Continuous D := by
  sorry

/-- A continuous derivation of a commutative Banach algebra takes values in its radical. -/
theorem singer_wermer {A : Type*} [NonUnitalNormedCommRing A] [NormedSpace ℂ A]
    [IsScalarTower ℂ A A] [SMulCommClass ℂ A A] [CompleteSpace A]
    (D : A →L[ℂ] A) (hD : ∀ a b, D (a * b) = a * D b + D a * b) :
    ∀ a, D a ∈ nonUnitalRadical (A := A) := by
  sorry

end NonUnitalAutomaticContinuity

/-! ## Layer 8: Compact operators, transitive algebras and invariant subspaces -/

/-- A nonzero spectral shift of a compact operator has complementary stable generalized
kernel and range; the kernel is finite dimensional and both subspaces are closed. -/
theorem compact_riesz_decomposition {𝕜 E : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [NormedSpace 𝕜 E] [CompleteSpace E]
    (T : E →L[𝕜] E) (hT : IsCompactOperator T) (z : 𝕜) (hz : z ≠ 0) :
    ∃ n : ℕ, ∀ m : ℕ, n ≤ m →
      let S : Module.End 𝕜 E := (T - z • ContinuousLinearMap.id 𝕜 E).toLinearMap
      IsCompl (LinearMap.ker (S ^ m)) (LinearMap.range (S ^ m)) ∧
      FiniteDimensional 𝕜 (LinearMap.ker (S ^ m)) ∧
      IsClosed (LinearMap.ker (S ^ m) : Set E) ∧
      IsClosed (LinearMap.range (S ^ m) : Set E) ∧
      LinearMap.ker (S ^ m) = LinearMap.ker (S ^ n) ∧
      LinearMap.range (S ^ m) = LinearMap.range (S ^ n) := by
  sorry

/-- A8: the compact-map fixed-point theorem does not assume linear approximation. -/
theorem schauder_fixedPoint {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    [CompleteSpace F] (C : Set F) (hC : C.Nonempty) (hclosed : IsClosed C)
    (hbounded : Bornology.IsBounded C) (hconvex : Convex ℝ C)
    (f : F → F) (hf : ContinuousOn f C) (hmap : Set.MapsTo f C C)
    (hcompact : IsCompact (closure (f '' C))) :
    ∃ x ∈ C, f x = x := by
  sorry

/-- A8: Lomonosov's lemma is stated on the existing bounded algebra carrier. -/
theorem lomonosov_lemma {𝕜 E : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [NormedSpace 𝕜 E] [CompleteSpace E]
    (A : Subalgebra 𝕜 (E →L[𝕜] E))
    (htrans : ∀ x : E, x ≠ 0 →
      closure (Set.range (fun a : A => a.val x)) = Set.univ)
    (K : E →L[𝕜] E) (hK : IsCompactOperator K) (hK0 : K ≠ 0) :
    ∃ a : A, ∃ x : E, x ≠ 0 ∧ a.val (K x) = x := by
  sorry

section InvariantSubspaces
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- A8: nonscalarity is needed for the hyperinvariant conclusion. -/
theorem lomonosov_hyperinvariant (T K : E →L[ℂ] E)
    (hT : ∀ c : ℂ, T ≠ c • ContinuousLinearMap.id ℂ E)
    (hK : IsCompactOperator K) (hK0 : K ≠ 0) (hcomm : Commute T K) :
    ∃ U : Submodule ℂ E, IsClosed (U : Set E) ∧ U ≠ ⊥ ∧ U ≠ ⊤ ∧
      ∀ S : E →L[ℂ] E, Commute S T → U ∈ Module.End.invtSubmodule S.toLinearMap := by
  sorry

end InvariantSubspaces

end TauCetiRoadmap.BanachAlgebras
