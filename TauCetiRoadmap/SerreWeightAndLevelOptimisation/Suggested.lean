import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Eigenform

/-!
# Weight and level optimisation: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; discharging these statements finishes neither a layer nor the roadmap.

The statements are Ribet's weight-two level lowering (§2.10), removal of
coefficient-prime level (§4.2), and congruent-nebentypus replacement (§4.1).
They use native full eigenforms and rank-two representations of a finite Galois
extension of ℚ. Every continuous residual representation has such a finite model.
The coefficient field k is algebraically closed, so irreducibility is absolute and
finite coefficient extensions are allowed. A single ring homomorphism from
`integralClosure ℤ ℂ` to k fixes compatible reductions on the algebraic integers
in all finite coefficient fields. Equality of both Frobenius coordinates expresses
attachment without assuming an attached Galois representation construction.

The full conductor-level and Serre-weight conclusions (§§2.13, 3.7, 4.8, 5.9,
6.12) are deferred because the pins lack the residual Artin conductor and the
extension-sensitive Serre-weight recipe. Companion forms, minimum Katz weight and
the Hasse injection (§§3.5–3.7, 3.13–3.14a), including the dihedral Katz export
(§5.10), require Katz/coherent modular forms. The integral eigenvalue-support and
Eisenstein comparisons (§§1.1–1.4), and the ordinary Tate and multiplicity theorems
(§§3.10–3.12, 5.2, 5.6), require integral modular-curve cohomology, modular
Jacobians and their full Hecke actions. The elliptic exports (§§6.2–6.4) also need
elliptic conductors and minimal discriminants; finite-flat optimisation and the
scalar dyadic model (§§4.8, 6.5) require finite-flat local models. The
finite-set determinant alignment (§6.6) needs arithmetic p-adic characters with
local-unit restrictions; the KW minimal and prescribed-type lifts (§§6.7–6.11)
need quaternionic automorphic modules, modular Galois attachment and crystalline,
semistable and Weil–Deligne local types. These missing objects require the
supplier developments specified in the README, beyond a few supporting definitions.
-/

namespace TauCetiRoadmap.SerreWeightAndLevelOptimisation
open UpperHalfPlane
open scoped NumberField

variable {L k : Type*} [Field L] [NumberField L] [Field k]

/-- A finite Galois model is unramified at a rational prime when its representation
kills every inertia subgroup above that prime. The model field itself may ramify. -/
def UnramifiedAt (ρ : Representation k (L ≃ₐ[ℚ] L) (Fin 2 → k)) (q : ℕ) : Prop :=
  ∀ P : Ideal (𝓞 L), P.IsPrime → P.LiesOver (Ideal.span {(q : ℤ)}) →
    ∀ σ ∈ P.inertia (L ≃ₐ[ℚ] L), ρ σ = 1

/-- Attachment to a classical full eigenform, with a single reduction of complex
algebraic integers: inertia vanishes at every good prime, and arithmetic Frobenius
has the reduced Hecke trace and determinant. -/
def IsResidualEigenform (ℓ : ℕ)
    (ρ : Representation k (L ≃ₐ[ℚ] L) (Fin 2 → k))
    (red : integralClosure ℤ ℂ →+* k) {N : ℕ} [NeZero N] {w : ℤ}
    (f : HeckeRing.GL2.Eigenform N w) : Prop :=
  ∀ (r : ℕ) (hr : r.Prime), ¬ r ∣ N * ℓ →
    UnramifiedAt ρ r ∧
    ∀ P : Ideal (𝓞 L), P.IsPrime → P.LiesOver (Ideal.span {(r : ℤ)}) →
      ∀ σ : L ≃ₐ[ℚ] L, IsArithFrobAt ℤ σ P →
        ∃ a b : integralClosure ℤ ℂ,
          (a : ℂ) = f.eigenvalue ⟨r, hr.pos⟩ ∧
          (b : ℂ) = (MulChar.ofUnitHom f.χ : DirichletCharacter ℂ N) r *
            (r : ℂ) ^ (w - 1) ∧
          red a = LinearMap.trace k (Fin 2 → k) (ρ σ) ∧
          red b = LinearMap.det (ρ σ)

variable [hGalois : IsGalois ℚ L]

include hGalois

/-- Ribet's weight-two, trivial-character lowering theorem (README §2.10;
Ribet, Theorem 1.5): no congruence condition on the removed prime and no
multiplicity-one assumption. The level M may contain coefficient-prime powers. -/
theorem ribet_level_lowering
    (ℓ q M : ℕ) [Fact q.Prime] [NeZero M] [NeZero (M * q)]
    [CharP k ℓ] [IsAlgClosed k]
    (hℓ : 3 ≤ ℓ) (hq : ¬ q ∣ M * ℓ)
    (ρ : Representation k (L ≃ₐ[ℚ] L) (Fin 2 → k))
    [Representation.IsIrreducible ρ]
    (red : integralClosure ℤ ℂ →+* k)
    (f : HeckeRing.GL2.Eigenform (M * q) 2)
    (hχ : f.χ = 1)
    (hnorm : (qExpansion 1 f.toCuspForm).coeff 1 = 1)
    (hf : IsResidualEigenform ℓ ρ red f) (hunr : UnramifiedAt ρ q) :
    ∃ g : HeckeRing.GL2.Eigenform M 2,
      g.χ = 1 ∧ (qExpansion 1 g.toCuspForm).coeff 1 = 1 ∧
        IsResidualEigenform ℓ ρ red g := by
  sorry

/-- Removal of coefficient-prime level (README §4.2; Ribet, Theorem 2.1).
The residual representation and tame level persist; weight and character may change. -/
theorem strip_coefficient_prime_powers
    (ℓ N r : ℕ) [NeZero N] [NeZero (N * ℓ ^ r)]
    [CharP k ℓ] [IsAlgClosed k] (hℓ : 3 ≤ ℓ) (hN : ¬ ℓ ∣ N)
    (ρ : Representation k (L ≃ₐ[ℚ] L) (Fin 2 → k))
    [Representation.IsIrreducible ρ]
    (red : integralClosure ℤ ℂ →+* k) {w : ℤ}
    (f : HeckeRing.GL2.Eigenform (N * ℓ ^ r) w)
    (hnorm : (qExpansion 1 f.toCuspForm).coeff 1 = 1)
    (hf : IsResidualEigenform ℓ ρ red f) :
    ∃ w' : ℤ, 2 ≤ w' ∧ ∃ g : HeckeRing.GL2.Eigenform N w',
      (qExpansion 1 g.toCuspForm).coeff 1 = 1 ∧ IsResidualEigenform ℓ ρ red g := by
  sorry

/-- Congruent-character replacement at fixed weight and level (README §4.1;
Ribet, Theorem 1.3), in arbitrary character and weight at least two. -/
theorem congruent_nebentypus
    (ℓ N : ℕ) [NeZero N] [CharP k ℓ] [IsAlgClosed k] (hℓ : 5 ≤ ℓ)
    (ρ : Representation k (L ≃ₐ[ℚ] L) (Fin 2 → k))
    [Representation.IsIrreducible ρ]
    (red : integralClosure ℤ ℂ →+* k) {w : ℤ} (hw : 2 ≤ w)
    (f : HeckeRing.GL2.Eigenform N w)
    (hnorm : (qExpansion 1 f.toCuspForm).coeff 1 = 1)
    (hf : IsResidualEigenform ℓ ρ red f)
    (ε' : (ZMod N)ˣ →* ℂˣ)
    (hε : ∀ u, ∃ a b : integralClosure ℤ ℂ,
      (a : ℂ) = (f.χ u : ℂ) ∧ (b : ℂ) = (ε' u : ℂ) ∧ red a = red b) :
    ∃ g : HeckeRing.GL2.Eigenform N w,
      g.χ = ε' ∧ (qExpansion 1 g.toCuspForm).coeff 1 = 1 ∧
        IsResidualEigenform ℓ ρ red g := by
  sorry
end TauCetiRoadmap.SerreWeightAndLevelOptimisation
