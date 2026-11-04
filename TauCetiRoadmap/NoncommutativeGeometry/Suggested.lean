module
/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.Lie.Derivation.Basic

/-!
# Cyclic cohomology, spectral triples and noncommutative tori: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the torus cyclic two-cocycle theorem of N6 on Tau Ceti's
noncommutative derivation carrier, together with the cyclic 2-cocycle structure and the
ordered torus cochain its statement needs.

Headline theorems of the README that are not statable at the pins:

* the character index theorem of N3 lacks Schatten ideals and the conditional trace `Tr′`;
  the bounded Fredholm modules it is about are statable on native operators, but no
  headline about them is, so none is declared here;
* the Hochschild-class theorem of N5 lacks the logarithmic ideal, Dixmier traces and a
  periodic cyclic cohomology carrier;
* the cyclic SBI sequence and periodicity comparisons of N1–N2 and the torus computation
  `HP^even(𝒜_θ) ≃ ℂ²` of N6 lack cyclic and periodic cyclic cohomology;
* the Hochschild computation for Diophantine θ in N6 lacks continuous Hochschild cohomology
  with coefficients in the continuous dual of the smooth torus;
* the Heisenberg-module index and the K₀ range computation of N7 lack the smooth rotation
  algebra and its Hilbert-module completions.
-/

namespace TauCetiRoadmap.NoncommutativeGeometry
universe u

section Algebraic
variable {A : Type u} [Ring A] [Algebra ℂ A]

/-- A cyclic Hochschild 2-cocycle on `A`: a trilinear functional with
`φ(c,a,b)=φ(a,b,c)` and `bφ=0` for N1's pinned Hochschild coboundary. -/
structure CyclicTwoCocycle where
  cochain : MultilinearMap ℂ (fun _ : Fin 3 => A) ℂ
  cyclic : ∀ a b c : A, cochain ![a,b,c] = cochain ![c,a,b]
  cocycle : ∀ a b c d : A,
    cochain ![a*b,c,d] - cochain ![a,b*c,d] +
      cochain ![a,b,c*d] - cochain ![d*a,b,c] = 0

/-- The ordered torus cochain `φ(a₀,a₁,a₂)=(2πi)⁻¹τ(a₀(δ₁a₁δ₂a₂−δ₂a₁δ₁a₂))` of N6,
for a linear functional `τ` and two endomorphism-valued derivations. -/
noncomputable def torusTwoCochain (τ : A →ₗ[ℂ] ℂ)
    (δ₁ δ₂ : TauCeti.derivationLieAlgebra ℂ A) :
    MultilinearMap ℂ (fun _ : Fin 3 => A) ℂ :=
  (2 * (Real.pi : ℂ) * Complex.I)⁻¹ •
    (τ.compMultilinearMap ((MultilinearMap.mkPiAlgebraFin ℂ 3 A).compLinearMap
        ![LinearMap.id, (δ₁ : Module.End ℂ A), (δ₂ : Module.End ℂ A)]) -
      τ.compMultilinearMap ((MultilinearMap.mkPiAlgebraFin ℂ 3 A).compLinearMap
        ![LinearMap.id, (δ₂ : Module.End ℂ A), (δ₁ : Module.End ℂ A)]))

/-- On a triple the torus cochain is `(2πi)⁻¹τ(a₀(δ₁a₁δ₂a₂−δ₂a₁δ₁a₂))`. -/
example (τ : A →ₗ[ℂ] ℂ) (δ₁ δ₂ : TauCeti.derivationLieAlgebra ℂ A) (a b c : A) :
    torusTwoCochain τ δ₁ δ₂ ![a, b, c] = (2 * (Real.pi : ℂ) * Complex.I)⁻¹ *
      τ (a * ((δ₁ : Module.End ℂ A) b * (δ₂ : Module.End ℂ A) c -
        (δ₂ : Module.End ℂ A) b * (δ₁ : Module.End ℂ A) c)) := by
  simp [torusTwoCochain, MultilinearMap.mkPiAlgebraFin_apply, List.ofFn_succ, mul_sub,
    mul_assoc]
  ring

/-- For a trace `τ` killed by two commuting derivations, the torus cochain is a cyclic
2-cocycle; this is N6's torus character in the generality of README N6. -/
theorem exists_cyclicTwoCocycle_torusTwoCochain (τ : A →ₗ[ℂ] ℂ)
    (δ₁ δ₂ : TauCeti.derivationLieAlgebra ℂ A)
    (htrace : ∀ a b : A, τ (a*b) = τ (b*a))
    (h₁ : ∀ a : A, τ ((δ₁ : Module.End ℂ A) a) = 0)
    (h₂ : ∀ a : A, τ ((δ₂ : Module.End ℂ A) a) = 0)
    (hcomm : (δ₁ : Module.End ℂ A).comp (δ₂ : Module.End ℂ A) =
      (δ₂ : Module.End ℂ A).comp (δ₁ : Module.End ℂ A)) :
    ∃ φ : CyclicTwoCocycle (A := A), φ.cochain = torusTwoCochain τ δ₁ δ₂ := by
  sorry

end Algebraic

end TauCetiRoadmap.NoncommutativeGeometry
