import Mathlib
import TauCeti.AlgebraicTopology.Cohomology.Basic

/-!
# Complex comparison: target statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for particular milestones; discharging
all of them finishes neither a layer nor the roadmap.

The statements on the pinned carriers are the several-variable Montel theorem and
Schwartz's compact-perturbation finiteness theorem for Fréchet spaces (C1.6), and the
additive constant-sheaf/singular-cohomology comparison for arbitrary abelian coefficients
on semilocally contractible spaces, without separation assumptions (C5.1). The last
statement asserts existence of an additive isomorphism; the construction of the canonical
map and its naturality are specified in the README.

The other headline results require mathematical objects absent from the pins:

* C−1/C0's completed-stalk comparison and exact coherent analytification require complex
  analytic spaces with their nonreduced holomorphic structure sheaves and the scheme/space
  analytification functors. Native locally ringed spaces and finitely presented module
  sheaves alone do not supply these objects.
* C1/C2's Cartan A/B, Cartan–Serre finiteness, analytic Serre theorems, proper coherent
  GAGA, base change and geometric dictionaries require those analytic spaces and functors.
* C3's proper-support existence, coherent/Picard algebraicity, Picard components and
  formal parameters, and derived GAGA require algebraic spaces, their ringed étale sites,
  quasi-coherent derived categories and moduli stacks.
* C4's Remmert and Remmert–Stein theorems, Chow algebraization with nilpotents,
  proper-support and morphism algebraization, and affine-curve connectedness comparison
  require analytic subspaces and analytification.
* C5's proper, relative and Artin-base de Rham–Betti comparison, geometric Hodge theorems,
  cycle integration and Chern comparison, Riemann–Hilbert and regular-singular comparison,
  and proper logarithmic comparison require global algebraic/holomorphic form complexes,
  sheaf connections, geometric currents and log schemes, together with analytification.
  The abstract pure Hodge carrier does not supply the geometric cohomology or its filtration.
* C6's stratified topology, Riemann existence and finite, compact-support, relative and
  adic Artin comparison require the classical space of complex points of a general scheme,
  constructible étale coefficient categories and normalized adic systems. The native
  topological local-system carrier alone does not supply these comparisons.

These missing carriers are constructions specified in the README; none is replaced here
by a predicate parameter or an arbitrary comparison map.
-/

namespace TauCetiRoadmap.ComplexComparisonPartII

open CategoryTheory

universe u

/-- C1.6: locally bounded holomorphic sequences in several variables have holomorphic
locally uniform subsequential limits. This is the compactness input to Cartan–Serre
finiteness, on finite-dimensional complex domains. -/
theorem montelTheorem {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [FiniteDimensional ℂ E] {Ω : Set E} (hΩ : IsOpen Ω) (f : ℕ → E → ℂ)
    (hf : ∀ n, DifferentiableOn ℂ (f n) Ω)
    (hb : ∀ K ⊆ Ω, IsCompact K → ∃ C : ℝ, ∀ n, ∀ z ∈ K, ‖f n z‖ ≤ C) :
    ∃ (φ : ℕ → ℕ) (g : E → ℂ), StrictMono φ ∧ DifferentiableOn ℂ g Ω ∧
      TendstoLocallyUniformlyOn (fun n => f (φ n)) g Filter.atTop Ω := by
  sorry

/-- C1.6 (Schwartz): a compact perturbation of a surjection between complex Fréchet spaces
has closed image of finite codimension. No finite-dimensional-kernel hypothesis is imposed;
this is the functional-analytic finiteness theorem for coherent cohomology. -/
theorem schwartzFiniteness {E F : Type*}
    [AddCommGroup E] [UniformSpace E] [IsUniformAddGroup E] [Module ℂ E]
    [Module ℝ E] [IsScalarTower ℝ ℂ E] [ContinuousSMul ℂ E]
    [LocallyConvexSpace ℝ E] [TopologicalSpace.MetrizableSpace E] [T2Space E] [CompleteSpace E]
    [AddCommGroup F] [UniformSpace F] [IsUniformAddGroup F] [Module ℂ F]
    [Module ℝ F] [IsScalarTower ℝ ℂ F] [ContinuousSMul ℂ F]
    [LocallyConvexSpace ℝ F] [TopologicalSpace.MetrizableSpace F] [T2Space F] [CompleteSpace F]
    (g h : E →L[ℂ] F) (hg : Function.Surjective g) (hh : IsCompactOperator h) :
    IsClosed (LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F) : Set F) ∧
      FiniteDimensional ℂ (F ⧸ LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F)) := by
  sorry

/-- C5.1: constant-sheaf and singular cohomology agree for arbitrary abelian coefficients
on a semilocally contractible space. No Hausdorff or paracompactness assumption is imposed.
The singular chain coefficient object `ULift ℤ` is free of rank one in the space's universe. -/
theorem sheafSingularComparison (T : TopCat.{u}) (hT : LocallyContractibleSpace T)
    (A : AddCommGrpCat.{u}) (q : ℕ) :
    Nonempty
      (Sheaf.H.{u}
        ((constantSheaf (Opens.grothendieckTopology T) AddCommGrpCat.{u}).obj A) q
        ≃+ T.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) q) := by
  sorry

end TauCetiRoadmap.ComplexComparisonPartII
