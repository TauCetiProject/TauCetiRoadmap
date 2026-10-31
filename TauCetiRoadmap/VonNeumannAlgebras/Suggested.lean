/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Von Neumann algebras, operator foundations and measurable fields: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib, each with `sorry`, together with the few
definitions (Murray–von Neumann equivalence and subequivalence, cyclic and separating vectors) that
those statements need. Concrete von Neumann algebras are Mathlib's `VonNeumannAlgebra H` on a
complete complex Hilbert space `H`, abstract ones are Mathlib's `WStarAlgebra`, and the weak and
strong operator topologies are Mathlib's `H →WOT[ℂ] H` and `H →Lₚₜ[ℂ] H`.

Headline theorems of the README that are not statable at the pin, and the carrier each lacks:

* V1: the ultraweak and ultrastrong forms of the bicommutant theorem and of Kaplansky density.
  Mathlib has no ultraweak or ultrastrong topology on `H →L[ℂ] H`.
* V2: the `L∞` comparison `L∞(σ(a), μ) ≅ W*(a)` and the classification of abelian von Neumann
  algebras on separable spaces. Mathlib has no bounded Borel functional calculus or spectral
  projection-valued measure of a normal operator, and `MeasureTheory.Lp ℂ ∞ μ` carries no
  star-algebra structure.
* V2: the commutation theorem for `B(K)` tensor factors and the factoriality of a tensor product of
  factors. There is no completed Hilbert tensor product of Hilbert spaces and no spatial tensor
  product of von Neumann algebras.
* V3: the spatial form `B(K) ⊗ 1_L` of a type I factor and the classification of finite-dimensional
  von Neumann algebras with multiplicity spaces (the same missing tensor product).
* V4: the positive spanning of the predual, the normality criterion (ultraweak continuity,
  normality and complete additivity of a positive functional coincide) and the structure of normal
  representations. There are no trace-class operators, no ultraweak topology and no normal
  functionals. The predual theorem and Sakai's theorem are statable through `WStarAlgebra`'s
  conjugate-linear predual and are stated below.
* V4.0.Fields: the decomposable-operator theorem and the change-of-measure unitaries. There is no
  measurable field of Hilbert spaces and no direct integral.
-/

universe u

noncomputable section

namespace TauCetiRoadmap.VonNeumannAlgebras

variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-! ## V0: C*-algebra and state prerequisites -/

/-- **Gelfand–Naimark.** Every unital C*-algebra `A` has a faithful representation on a complete
complex Hilbert space: the direct sum of the GNS representations of its states (README, V0.2). For
the zero algebra the Hilbert space is `0`. -/
theorem exists_faithful_representation (A : Type u) [CStarAlgebra A] :
    ∃ (K : Type u) (_ : NormedAddCommGroup K) (_ : InnerProductSpace ℂ K) (_ : CompleteSpace K)
      (π : A →⋆ₐ[ℂ] (K →L[ℂ] K)), Function.Injective π := by
  sorry

/-! ## V1: Operator topologies and the bicommutant theorem -/

/-- **Von Neumann's bicommutant theorem.** A unital star subalgebra of `B(H)` equals its double
commutant exactly when its image in the weak operator topology `H →WOT[ℂ] H` is closed
(README, V1.3). -/
theorem bicommutant_eq_iff_isClosed_wot (A : StarSubalgebra ℂ (H →L[ℂ] H)) :
    Set.centralizer (Set.centralizer (A : Set (H →L[ℂ] H))) = A ↔
      IsClosed (ContinuousLinearMapWOT.ofCLM '' (A : Set (H →L[ℂ] H))) := by
  sorry

/-- **Kaplansky density.** For a unital star subalgebra `A` of `B(H)`, the closure in the strong
operator topology `H →Lₚₜ[ℂ] H` of the closed unit ball of `A` is the closed unit ball of its double
commutant `A''` (README, V1.4). The inclusion `⊆` is the lower semicontinuity of the norm under
strong limits; `⊇` is Kaplansky's theorem. -/
theorem kaplansky_closure_unitBall (A : StarSubalgebra ℂ (H →L[ℂ] H)) :
    closure (ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H ''
        {x | x ∈ A ∧ ‖x‖ ≤ 1}) =
      ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H ''
        {x | x ∈ Set.centralizer (Set.centralizer (A : Set (H →L[ℂ] H))) ∧ ‖x‖ ≤ 1} := by
  sorry

/-! ## V2: Elementary algebra, corners, and tensors -/

/-- Murray–von Neumann equivalence `p ∼ q` in `M`, oriented from the initial to the final
projection: some `v ∈ M` has `v* v = p` and `v v* = q` (README, V2.2). -/
def MurrayVonNeumannEquiv (M : VonNeumannAlgebra H) (p q : H →L[ℂ] H) : Prop :=
  IsStarProjection p ∧ IsStarProjection q ∧ p ∈ M ∧ q ∈ M ∧
  ∃ v : H →L[ℂ] H, v ∈ M ∧ star v * v = p ∧ v * star v = q

/-- Murray–von Neumann subequivalence `p ≼ q` in `M`: some `v ∈ M` has `v* v = p` and `v v* ≤ q`
in the Loewner order of `B(H)` (README, V2.2). -/
def MurrayVonNeumannSubequiv (M : VonNeumannAlgebra H) (p q : H →L[ℂ] H) : Prop :=
  IsStarProjection p ∧ IsStarProjection q ∧ p ∈ M ∧ q ∈ M ∧
  ∃ v : H →L[ℂ] H, v ∈ M ∧ star v * v = p ∧ v * star v ≤ q

/-- **Projection Schröder–Bernstein.** Subequivalence is antisymmetric up to equivalence:
`p ≼ q` and `q ≼ p` give `p ∼ q`; the projections themselves need not be equal (README, V2.2). -/
theorem murrayVonNeumannEquiv_of_subequiv {M : VonNeumannAlgebra H} {p q : H →L[ℂ] H}
    (hpq : MurrayVonNeumannSubequiv M p q) (hqp : MurrayVonNeumannSubequiv M q p) :
    MurrayVonNeumannEquiv M p q := by
  sorry

/-! ## V4: Preduals, normality, and normal representations -/

/-- **The predual theorem.** A concrete von Neumann algebra `N` on `H` has a Banach predual in
Mathlib's sense: a Banach space `X` with a conjugate-linear isometric isomorphism
`StrongDual ℂ X ≃ₗᵢ⋆[ℂ] N`. `X` is the conjugate Banach space of the ultraweakly continuous
functionals `N_* = S₁(H)/N_⊥`, so that `N` satisfies the axiom of `WStarAlgebra` (README,
V4.Core). -/
theorem exists_predual (N : VonNeumannAlgebra H) :
    ∃ (X : Type u) (_ : NormedAddCommGroup X) (_ : NormedSpace ℂ X) (_ : CompleteSpace X),
      Nonempty (StrongDual ℂ X ≃ₗᵢ⋆[ℂ] N.toStarSubalgebra) := by
  sorry

/-- **Sakai's theorem.** Every abstract W*-algebra, a C*-algebra `M` with `WStarAlgebra M`, is
star-isomorphic to a concrete von Neumann algebra `N` on some complete complex Hilbert space: the
direct sum of the GNS representations of the states lying in the predual (README, V4.Core). -/
theorem exists_vonNeumannAlgebra_starAlgEquiv (M : Type u) [CStarAlgebra M] [WStarAlgebra M] :
    ∃ (K : Type u) (_ : NormedAddCommGroup K) (_ : InnerProductSpace ℂ K) (_ : CompleteSpace K)
      (N : VonNeumannAlgebra K), Nonempty (M ≃⋆ₐ[ℂ] N.toStarSubalgebra) := by
  sorry

/-- A vector `ξ` is cyclic for `M` when the orbit `Mξ` is dense in `H`; no separability or nonzero
hypothesis is made (README, V4.Normality). -/
def IsCyclicVector (M : VonNeumannAlgebra H) (ξ : H) : Prop :=
  Dense (Set.range (fun x : M => (x : H →L[ℂ] H) ξ))

/-- A vector `ξ` is separating for `M` when `xξ = 0` forces `x = 0` for `x ∈ M`
(README, V4.Normality). -/
def IsSeparatingVector (M : VonNeumannAlgebra H) (ξ : H) : Prop :=
  ∀ x : M, (x : H →L[ℂ] H) ξ = 0 → x = 0

/-- **Cyclic versus separating.** A vector is cyclic for `M` exactly when it is separating for the
commutant `M'` (README, V4.Normality). -/
theorem isCyclicVector_iff_isSeparatingVector_commutant (M : VonNeumannAlgebra H) (ξ : H) :
    IsCyclicVector M ξ ↔ IsSeparatingVector M.commutant ξ := by
  sorry

end TauCetiRoadmap.VonNeumannAlgebras
