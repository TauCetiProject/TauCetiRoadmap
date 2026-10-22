import Mathlib

/-!
# Crystalline local–global compatibility over CM fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The finite-image reducibility theorem of §9.2 is stated on Mathlib's matrix groups,
projective quotient and submodules. It applies over every algebraically closed field
of odd positive characteristic, without assuming irreducibility of the original
representation, and includes the determinant-order-three tetrahedral exception.

The arithmetic headline statements require objects absent from the pinned libraries:

* CL.0's integral evaluation and lattice stability need integral dual Weyl modules;
  its positive-parahoric Hecke isomorphism needs the local monoid Hecke algebras.
* CL.1–CL.3's derived P-ordinary comparisons, weight independence, Bruhat
  subquotients and deep unipotent splitting need smooth positive-monoid derived
  categories, their ordinary functors and the arithmetic coefficient towers.
* CL.4's Newton–Hodge equality and crystalline Galois blocks need semistable
  Galois representations, filtered (φ,N)-modules and unitary automorphic representations.
* CL.5–CL.6's completed boundary summand and integral/torsion degree shifting need
  completed arithmetic cohomology, its boundary coefficients and its Hecke actions.
* CL.7's local crystalline lifts, deformation-ring factorizations and totally real
  spherical crystallinity need crystalline/semistable-ordinary representation
  predicates, local deformation rings and attached automorphic Galois representations.
* CL.8's component propagation needs common-residual patched perfect complexes
  with finite derived Hecke actions and support; its Galois and perfectness theorems
  need the non-neat PGL₂ arithmetic cohomology complexes.
* CL.9's prepared and qualified potentially Barsotti–Tate lifting theorems need
  those arithmetic objects, Barsotti–Tate local conditions and Taylor–Wiles
  deformation problems.

These headline signatures are deferred until their mathematical objects are available.
Abstract representations, derived categories and algebra-homomorphism ranges alone
supply none of the missing arithmetic constructions.
-/

namespace TauCetiRoadmap.CrystallineLocalGlobalCompatibilityCM
namespace CrystallineCM

/-- The projective matrix image, with precisely the ambient scalar kernel. -/
abbrev projectiveMatrixImage {K G : Type*} [Field K] [Group G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) :=
  (Matrix.ProjGenLinGroup.mk.comp ρ).range

/-- Reducibility on the determinant kernel means that it preserves a line. -/
def determinantKernelHasLine {K G : Type*} [Field K] [Group G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) : Prop :=
  ∃ W : Submodule K (Fin 2 → K), Module.finrank K W = 1 ∧
    ∀ g : G, Matrix.GeneralLinearGroup.det (ρ g) = 1 →
      ∀ v ∈ W, (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec v ∈ W

/-- The trace-square condition gives a determinant-kernel line except for
determinant order three with tetrahedral projective image. In that case the
kernel has Klein-four projective image and no invariant line; the qualified
form of CN Lemma 5.6.5, pp.85–86 (README §9.2). -/
theorem determinant_kernel_reducible_except_tetrahedral
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {K G : Type*}
    [Field K] [IsAlgClosed K] [CharP K p] [Group G] [Finite G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K)
    (hd : 1 < Nat.card (Matrix.GeneralLinearGroup.det.comp ρ).range)
    (htrace : ∀ g : G, Matrix.GeneralLinearGroup.det (ρ g) ≠ 1 →
      Matrix.trace (ρ g : Matrix (Fin 2) (Fin 2) K) ^ 2 =
        (1 + (Matrix.GeneralLinearGroup.det (ρ g) : K)) ^ 2) :
    determinantKernelHasLine ρ ∨
      (Nat.card (Matrix.GeneralLinearGroup.det.comp ρ).range = 3 ∧
        Nonempty (projectiveMatrixImage ρ ≃* alternatingGroup (Fin 4)) ∧
        ¬ determinantKernelHasLine ρ ∧
        Nonempty (projectiveMatrixImage
          (ρ.comp (Matrix.GeneralLinearGroup.det.comp ρ).ker.subtype) ≃*
            Multiplicative (ZMod 2 × ZMod 2))) := by
  sorry

end CrystallineCM
end TauCetiRoadmap.CrystallineLocalGlobalCompatibilityCM
