import Mathlib

/-!
# Schubert geometry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The simple-lowering obstruction of
S4.4a is statable on native polynomial and submodule carriers.

The other headlines are not statable at the pins:
* S1's relative Schubert/incidence comparison needs relative flag schemes with
  their determinantal Schubert subschemes; the native Grassmannian is a module carrier.
* S2/S5's all-word image and derived pushforward theorems need Bott–Samelson
  schemes, their multiplication maps and their associated invertible sheaves.
* S3's geometric Demazure and Weyl character theorems need those flag line bundles
  and their section representations.
* S4's LS-chain, character and tensor theorems need the rational path quotient,
  its root operators and the LS components of a finite root datum.
* S5's splitting, normality and vanishing theorems need the Schubert schemes
  and their Frobenius-module and coherent-cohomology constructions.
* S6's all-degree standard monomial theorem needs geometric path sections and
  the Schubert section ring, not just a polynomial ring with named minors.
* S7's Chevalley and cycle comparisons need Schubert cycles and their Chow classes.
* S8's flag K-ring presentation needs the flag's algebraic K-ring and characteristic map.
* S9's GAGA, holomorphic Lefschetz and moment–Morse comparisons need the flag
  and word analytifications, equivariant bundles and compatible cellular maps;
  S9.8's associated-line adapter needs their tensor-compatible analytification.
-/

noncomputable section

namespace TauCetiRoadmap.SchubertGeometry

universe u v

/-! ## Layer 4: finite-type paths and the simple-lowering obstruction -/

/-- The bidegree-(2,1) kernel of the differential contraction
`sum_i d/dx_i d/dy_i` in the polynomial model of `Sym^2(K^3) tensor (K^3)*`. -/
def contractionKernel (K : Type u) [Field K] :
    Submodule K (MvPolynomial (Fin 3 ⊕ Fin 3) K) :=
  MvPolynomial.weightedHomogeneousSubmodule K
      (fun z : Fin 3 ⊕ Fin 3 => Sum.elim (fun _ => (1, 0)) (fun _ => (0, 1)) z)
      ((2, 1) : ℕ × ℕ) ⊓
    LinearMap.ker (∑ i : Fin 3,
      (MvPolynomial.pderiv (R := K) (Sum.inl i)).toLinearMap.comp
        (MvPolynomial.pderiv (R := K) (Sum.inr i)).toLinearMap)

/-- The matrix unit `E_ab` acts on standard and dual variables as
`x_a d/dx_b - y_b d/dy_a`, including diagonal matrix units. -/
def matrixUnitAction (K : Type u) [Field K] (a b : Fin 3) :
    Module.End K (MvPolynomial (Fin 3 ⊕ Fin 3) K) :=
  (LinearMap.mulLeft K (MvPolynomial.X (Sum.inl a))).comp
      (MvPolynomial.pderiv (R := K) (Sum.inl b)).toLinearMap -
    (LinearMap.mulLeft K (MvPolynomial.X (Sum.inr b))).comp
      (MvPolynomial.pderiv (R := K) (Sum.inl a)).toLinearMap

/-- A basis of the contraction kernel consists of simultaneous eigenvectors
for the two simple diagonal differences of the diagonal Cartan of `sl_3`. -/
def IsCartanWeightBasis (K : Type u) [Field K] {ι : Type v}
    (b : Module.Basis ι K (contractionKernel K)) : Prop :=
  ∀ j, ∃ μ : Fin 2 → K, ∀ i,
    (matrixUnitAction K i.castSucc i.castSucc - matrixUnitAction K i.succ i.succ)
      (b j : MvPolynomial (Fin 3 ⊕ Fin 3) K) =
        μ i • (b j : MvPolynomial (Fin 3 ⊕ Fin 3) K)

/-- Each simple lowering sends a basis vector to a scalar multiple of one
basis vector; coefficient zero is allowed. These are actual Lie operators. -/
def HasSingleTargetLowerings (K : Type u) [Field K] {ι : Type v}
    (b : Module.Basis ι K (contractionKernel K)) : Prop :=
  ∀ i : Fin 2, ∀ j, ∃ c : K, ∃ j',
    matrixUnitAction K i.succ i.castSucc (b j : MvPolynomial (Fin 3 ⊕ Fin 3) K) =
      c • (b j' : MvPolynomial (Fin 3 ⊕ Fin 3) K)

/-- Over every characteristic-zero field, the contraction kernel admits no
Cartan weight basis on which both simple lowering operators are single-target.
The three chronological lowering words 1122, 1212 and 1221 force three distinct
basis lines inside its two-dimensional weight-(0,0,1) space. -/
theorem no_singleTargetLowerings (K : Type u) [Field K] [CharZero K]
    {ι : Type v} (b : Module.Basis ι K (contractionKernel K))
    (hb : IsCartanWeightBasis K b) : ¬ HasSingleTargetLowerings K b := by
  sorry

end TauCetiRoadmap.SchubertGeometry
