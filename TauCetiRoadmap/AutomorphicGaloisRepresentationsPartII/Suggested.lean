import Mathlib
import TauCeti.NumberTheory.NumberField.AutomorphismAction

/-!
# Automorphic Galois representations, part II: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

Two headline results can be stated against the pinned libraries:
* AG2.4's `hlttFactorSeparation` (HLTT Proposition 7.12) extracts two continuous
  semisimple rank-`n` representations from the varying-twist rank-`2n` boundary family.
* AG2.7's `infinitelyManyDecomposedGenericPrimes` (ACC+ Lemma 4.3.2) produces infinitely
  many completely split generic rational primes from one witness. Its definition uses
  a finite Galois realization `Gal(L/F)`, native inertia and Frobenius, and characteristic
  polynomials over the algebraic closure of the finite coefficient field. Every continuous
  finite-coefficient representation of `G_F` factors through such a realization.

The automorphic existence theorems of AG2.2–AG2.4, including the unrestricted polarized
and HLTT theorems, cannot be stated at the pins: the regular algebraic cuspidal
`GL_n` automorphic-representation carrier and its local Hecke parameters are absent.
The compact-unitary constituent theorems of AG2.1 and the geometric comparisons need
PEL/Kuga–Sato cohomology with its coefficient projectors, Hecke and Galois actions.
AG2.P's arithmetic p-adic monodromy and AG2.5–AG2.6's local compatibility, purity and
Hodge theorems need period rings, admissibility functors and Weil–Deligne parameters.
The relative Fargues–Fontaine, Hecke-category and spectral-action theorems in AG2.6 need
relative curve, bundle-stack and sheaf-category carriers. These objects are absent too.
Compatible-system assembly and uniform strong realization additionally need the supplied
`AutomorphicSystemData` carrier; the polarized, residual and discrete automorphic exports
of AG2.7 need these constructions and the polarized-extension and lattice-reduction APIs.
Those headline statements are deferred until their mathematical objects are available.
-/

namespace TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

open Polynomial
open scoped BigOperators NumberField

/-- HLTT factor separation constructs both rank-`n` semisimple representations with the
prescribed dense-set Frobenius polynomials from the rank-`2n` boundary family. -/
theorem hlttFactorSeparation
    {G K : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [Field K] [CharZero K] [IsAlgClosed K] [TopologicalSpace K]
    [IsTopologicalDivisionRing K] [T2Space K]
    (n : ℕ) (hn : 0 < n) (D : Set G) (hD : Dense D)
    (μ : G →* Kˣ) (hμ : Continuous μ)
    (horder : ∀ g : D, ¬ IsOfFinOrder (μ g))
    (α β : D → Fin n → Kˣ) (M : Set ℤ) (hM : M.Infinite)
    (R : M → G →* Matrix.GeneralLinearGroup (Fin (2 * n)) K)
    (hR : ∀ m, Continuous (R m))
    (hss : ∀ m, Representation.IsSemisimpleRepresentation
      (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp (R m))) :
        Representation K G (Fin (2 * n) → K)))
    (hpoly : ∀ (m : M) (g : D), ((R m g).val).charpoly =
      (∏ i, (X - C (α g i : K))) *
        ∏ i, (X - C ((β g i * μ g ^ (m : ℤ) : Kˣ) : K))) :
    ∃ r₁ r₂ : G →* Matrix.GeneralLinearGroup (Fin n) K,
      Continuous r₁ ∧ Continuous r₂ ∧
      Representation.IsSemisimpleRepresentation
        (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp r₁)) :
          Representation K G (Fin n → K)) ∧
      Representation.IsSemisimpleRepresentation
        (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp r₂)) :
          Representation K G (Fin n → K)) ∧
      ∀ g : D, ((r₁ g).val).charpoly = ∏ i, (X - C (α g i : K)) ∧
        ((r₂ g).val).charpoly = ∏ i, (X - C (β g i : K)) := sorry

/-- ACC+ decomposed genericity in a finite Galois realization: complete splitting in `F`,
trivial inertia at every prime above `p`, and the ordered nonratio condition with multiplicities.
Arithmetic Frobenius gives the same condition as geometric Frobenius, since inversion
exchanges the ordered pairs. No distinctness or irreducibility condition is imposed. -/
def FiniteModelDecomposedGenericPrime
    {F L k : Type*} [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}
    (r : (L ≃ₐ[F] L) →* Matrix.GeneralLinearGroup (Fin n) k) (p : ℕ) : Prop :=
  p.Prime ∧ p ≠ ringChar k ∧
  (Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 F)).ncard = Module.finrank ℚ F ∧
  ∀ (Q : Ideal (𝓞 L)), Q.IsPrime → Q.LiesOver (Ideal.span {(p : ℤ)}) →
    (∀ σ ∈ Q.toAddSubgroup.inertia (L ≃ₐ[F] L), r σ = 1) ∧
    ∀ σ : L ≃ₐ[F] L, IsArithFrobAt (𝓞 F) σ Q →
      ∃ α : Fin n → (AlgebraicClosure k)ˣ,
        ((r σ).val.map (algebraMap k (AlgebraicClosure k))).charpoly =
          ∏ i, (X - C (α i : AlgebraicClosure k)) ∧
        ∀ i j, i ≠ j → (α i : AlgebraicClosure k) / (α j : AlgebraicClosure k) ≠ (p : AlgebraicClosure k)

/-- AG2.7 (ACC+ Lemma 4.3.2): a decomposed-generic residual representation has infinitely
many decomposed-generic rational primes, hence witnesses outside every finite set. -/
theorem infinitelyManyDecomposedGenericPrimes
    {F L k : Type*} [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [IsGalois F L] [Field k] [Finite k]
    (n : ℕ) (hn : 0 < n)
    (r : (L ≃ₐ[F] L) →* Matrix.GeneralLinearGroup (Fin n) k)
    (h : ∃ p, FiniteModelDecomposedGenericPrime r p) :
    {p : ℕ | FiniteModelDecomposedGenericPrime r p}.Infinite := sorry

end TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII
