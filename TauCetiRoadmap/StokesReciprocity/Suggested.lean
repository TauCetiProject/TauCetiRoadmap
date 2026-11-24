import Mathlib
import TauCeti.Analysis.BoundedVariation.ReducedBoundary
import TauCeti.Analysis.Sobolev.LipschitzDomain.Basic

/-!
# Stokes flow — stress, reciprocal work, and dissipation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. The headlines stated here are:

* Layer 1: the reciprocal and dissipative contractions of Newtonian stress
  (`reciprocal_contraction`, `dissipation_contraction`);
* Layer 2: the local reciprocal identity (`local_reciprocity`);
* Layer 3: the general box boundary-work identity and box reciprocity (`box_boundary_work`,
  `box_reciprocity`);
* Layer 4: the box dissipation identity, and symmetry, positive semidefiniteness and the
  quadratic-form identity of the boundary-response matrix (`box_dissipation`,
  `boxResponseMatrix_isSymm`, `boxResponseMatrix_posSemidef`, `boxResponseMatrix_quadratic`);
* Layer 5: reciprocity on a bounded Lipschitz domain (`domain_reciprocity`). `C¹` domains are a
  special case through `TauCeti.isLipschitzDomainWith_of_contDiffAt`.

The README's remaining targets, API lists and worked examples are not restated. In
particular, Layer 5's dissipation, gauge and response-matrix results are the statements of
Layers 3–4 with `domainBoundaryWork` in place of `boxBoundaryWork`.

Layers 1–4 use coordinates `Fin d → ℝ`, matching Mathlib's box divergence theorem. Layer 5 uses the
carrier of the domain supplier, `WithLp 2 (ℝ × E)`, coordinate-free. Suppliers used by the
statements: Mathlib `Matrix.trace`, `Matrix.PosSemidef`, `fderiv`, `ContDiffAt`, `LinearMap.trace`,
`ContinuousLinearMap.adjoint` and `MeasureTheory.Measure.euclideanHausdorffMeasure`; Tau Ceti
`Set.IsLipschitzDomainWith` (PDE §1.6) and `TauCeti.outerNormal` (GeometricMeasureTheory §6.1).
-/

noncomputable section

open MeasureTheory
open scoped RealInnerProductSpace NNReal

namespace TauCetiRoadmap.StokesReciprocity

/-! ## Layer 1: stress and contraction (coordinates) -/

variable {d : ℕ}

/-- Layer 1: the Frobenius contraction `A:B = tr(Aᵀ B)`. -/
def contraction (A B : Matrix (Fin d) (Fin d) ℝ) : ℝ :=
  Matrix.trace (A.transpose * B)

/-- Layer 1 sanity check, not a target: the trace spelling of `contraction` is the component sum. -/
theorem contraction_eq_sum (A B : Matrix (Fin d) (Fin d) ℝ) :
    contraction A B = ∑ i, ∑ j, A i j * B i j := by
  simpa [contraction, Matrix.trace, Matrix.mul_apply] using Finset.sum_comm

/-- Layer 1: the symmetric part `e = (A + Aᵀ)/2` of a velocity gradient `A`. -/
def symGradientMatrix (A : Matrix (Fin d) (Fin d) ℝ) :
    Matrix (Fin d) (Fin d) ℝ := fun i j => (A i j + A j i) / 2

/-- Layer 1: Newtonian stress `σ = −p I + μ (A + Aᵀ)` for viscosity `μ`, pressure `p` and velocity
gradient `A`. -/
def stressMatrix (μ p : ℝ) (A : Matrix (Fin d) (Fin d) ℝ) :
    Matrix (Fin d) (Fin d) ℝ :=
  fun i j => -(p * (if i = j then 1 else 0)) + μ * (A i j + A j i)

/-- Layer 1: `σμ(A,p):B − σμ(B,q):A = −p tr B + q tr A`, for arbitrary matrices and real `μ`. -/
theorem reciprocal_contraction (μ p q : ℝ) (A B : Matrix (Fin d) (Fin d) ℝ) :
    contraction (stressMatrix μ p A) B - contraction (stressMatrix μ q B) A =
      -p * Matrix.trace B + q * Matrix.trace A := by
  sorry

/-- Layer 1: `σμ(A,p):A = 2μ e(A):e(A)` for trace-free `A`. -/
theorem dissipation_contraction (μ p : ℝ) (A : Matrix (Fin d) (Fin d) ℝ)
    (hA : Matrix.trace A = 0) :
    contraction (stressMatrix μ p A) A =
      2 * μ * contraction (symGradientMatrix A) (symGradientMatrix A) := by
  sorry

/-! ## Layer 2: differential identities (coordinates) -/

/-- Layer 2: the velocity gradient `(Du)ᵢⱼ = ∂ⱼuᵢ` in the standard basis. -/
def velocityGradient (u : (Fin d → ℝ) → (Fin d → ℝ)) (x : Fin d → ℝ) :
    Matrix (Fin d) (Fin d) ℝ :=
  fun i j => fderiv ℝ u x (Pi.single j 1) i

/-- Layer 2: the divergence `div u = tr (Du)`. -/
def velocityDivergence (u : (Fin d → ℝ) → (Fin d → ℝ)) (x : Fin d → ℝ) : ℝ :=
  Matrix.trace (velocityGradient u x)

/-- Layer 2: the stress field `σ(u,p)(x)` of a velocity `u` and pressure `p`. -/
def stress (μ : ℝ) (u : (Fin d → ℝ) → (Fin d → ℝ))
    (p : (Fin d → ℝ) → ℝ) (x : Fin d → ℝ) : Matrix (Fin d) (Fin d) ℝ :=
  stressMatrix μ (p x) (velocityGradient u x)

/-- Layer 2: the traction `σ(u,p)(x) n` on a surface with normal `n`. -/
def traction (μ : ℝ) (u : (Fin d → ℝ) → (Fin d → ℝ))
    (p : (Fin d → ℝ) → ℝ) (x n : Fin d → ℝ) : Fin d → ℝ :=
  (stress μ u p x).mulVec n

/-- Layer 2: the row divergence `(Div σ)ᵢ = Σⱼ ∂ⱼσᵢⱼ` of a matrix field. -/
def stressDivergence (σ : (Fin d → ℝ) → Matrix (Fin d) (Fin d) ℝ)
    (x : Fin d → ℝ) : Fin d → ℝ :=
  fun i => ∑ j, fderiv ℝ (fun y => σ y i j) x (Pi.single j 1)

/-- Layer 2: the reciprocal flux `J = σ(u,p)ᵀv − σ(v,q)ᵀu`. -/
def reciprocalFlux (μ : ℝ) (u v : (Fin d → ℝ) → (Fin d → ℝ))
    (p q : (Fin d → ℝ) → ℝ) (x : Fin d → ℝ) : Fin d → ℝ :=
  fun j => ∑ i, (stress μ u p x i j * v x i - stress μ v q x i j * u x i)

/-- Layer 2, local reciprocity: for incompressible solutions of `Div σ + f = 0` and `Div σ + g = 0`
at `x`, with forces as volume densities, `div J = u·g − v·f`. -/
theorem local_reciprocity (μ : ℝ)
    (u v f g : (Fin d → ℝ) → (Fin d → ℝ)) (p q : (Fin d → ℝ) → ℝ)
    (x : Fin d → ℝ) (hu : ContDiffAt ℝ 2 u x) (hv : ContDiffAt ℝ 2 v x)
    (hp : ContDiffAt ℝ 1 p x) (hq : ContDiffAt ℝ 1 q x)
    (hu0 : velocityDivergence u x = 0) (hv0 : velocityDivergence v x = 0)
    (huf : stressDivergence (stress μ u p) x + f x = 0)
    (hvg : stressDivergence (stress μ v q) x + g x = 0) :
    velocityDivergence (reciprocalFlux μ u v p q) x =
      (∑ i, u x i * g x i) - ∑ i, v x i * f x i := by
  sorry

/-! ## Layer 3: box boundary work and reciprocity

The face parametrizations match Mathlib's box divergence theorem
`MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable`, with `d = n + 1`. -/

/-- Layer 3: the boundary work `B_Q(v;u,p)` of the traction of `(u,p)` against `v` over the faces of
the box `Q = Icc a b`, with outward face normals `±eᵢ`. -/
def boxBoundaryWork {n : ℕ} (a b : Fin (n + 1) → ℝ) (μ : ℝ)
    (v u : (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p : (Fin (n + 1) → ℝ) → ℝ) : ℝ :=
  ∑ i : Fin (n + 1),
    ((∫ y in Set.Icc (a ∘ i.succAbove) (b ∘ i.succAbove),
        ∑ j, v (i.insertNth (b i) y) j *
          stress μ u p (i.insertNth (b i) y) j i) -
      ∫ y in Set.Icc (a ∘ i.succAbove) (b ∘ i.succAbove),
        ∑ j, v (i.insertNth (a i) y) j *
          stress μ u p (i.insertNth (a i) y) j i)

/-- Layer 3, general boundary work: `B_Q(v;u,p) + ∫ v·f = ∫ (2μ e(u):e(v) − p div v)`.
Only `(u,p,f)` solves the momentum equation; there is no incompressibility, and no PDE for the
`C¹` field `v`. -/
theorem box_boundary_work {n : ℕ}
    (a b : Fin (n + 1) → ℝ) (hab : ∀ i, a i < b i) (μ : ℝ)
    (u v f : (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p : (Fin (n + 1) → ℝ) → ℝ)
    (hu : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 u x)
    (hv : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 v x)
    (hp : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 p x)
    (hf : ContinuousOn f (Set.Icc a b))
    (huf : ∀ x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ u p) x + f x = 0) :
    boxBoundaryWork a b μ v u p + (∫ x in Set.Icc a b, ∑ i, v x i * f x i) =
      ∫ x in Set.Icc a b,
        2 * μ * contraction (symGradientMatrix (velocityGradient u x))
          (symGradientMatrix (velocityGradient v x)) - p x * velocityDivergence v x := by
  sorry

/-- Layer 3, Lorentz reciprocity on a box: `B_Q(v;u,p) + ∫ v·f = B_Q(u;v,q) + ∫ u·g`.
Regularity is expressed at every point of the closed box; the PDE hypotheses are needed only in
its coordinatewise interior. This includes dimension one and arbitrary constant real
viscosity. -/
theorem box_reciprocity {n : ℕ}
    (a b : Fin (n + 1) → ℝ) (hab : ∀ i, a i < b i)
    (μ : ℝ)
    (u v f g : (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p q : (Fin (n + 1) → ℝ) → ℝ)
    (hu : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 u x)
    (hv : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 v x)
    (hp : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 p x)
    (hq : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 q x)
    (hf : ContinuousOn f (Set.Icc a b)) (hg : ContinuousOn g (Set.Icc a b))
    (hu0 : ∀ x, (∀ i, a i < x i ∧ x i < b i) → velocityDivergence u x = 0)
    (hv0 : ∀ x, (∀ i, a i < x i ∧ x i < b i) → velocityDivergence v x = 0)
    (huf : ∀ x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ u p) x + f x = 0)
    (hvg : ∀ x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ v q) x + g x = 0) :
    boxBoundaryWork a b μ v u p + (∫ x in Set.Icc a b, ∑ i, v x i * f x i) =
      boxBoundaryWork a b μ u v q + (∫ x in Set.Icc a b, ∑ i, u x i * g x i) := by
  sorry

/-! ## Layer 4: box dissipation and finite boundary response -/

/-- Layer 4, dissipation on a box: for an incompressible solution `(u,p)` with force `f`,
`B_Q(u;u,p) + ∫ u·f = 2μ ∫ e(u):e(u)`, for arbitrary real `μ`. -/
theorem box_dissipation {n : ℕ}
    (a b : Fin (n + 1) → ℝ) (hab : ∀ i, a i < b i) (μ : ℝ)
    (u f : (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p : (Fin (n + 1) → ℝ) → ℝ)
    (hu : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 u x)
    (hp : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 p x)
    (hf : ContinuousOn f (Set.Icc a b))
    (hu0 : ∀ x, (∀ i, a i < x i ∧ x i < b i) → velocityDivergence u x = 0)
    (huf : ∀ x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ u p) x + f x = 0) :
    boxBoundaryWork a b μ u u p + (∫ x in Set.Icc a b, ∑ i, u x i * f x i) =
      2 * μ * ∫ x in Set.Icc a b,
        contraction (symGradientMatrix (velocityGradient u x))
          (symGradientMatrix (velocityGradient u x)) := by
  sorry

/-- Layer 4: the boundary-response matrix `Rₐᵦ = B_Q(uₐ;uᵦ,pᵦ)` of a finite family of flows. -/
def boxResponseMatrix {n : ℕ} {ι : Type*} (a b : Fin (n + 1) → ℝ) (μ : ℝ)
    (u : ι → (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p : ι → (Fin (n + 1) → ℝ) → ℝ) : Matrix ι ι ℝ :=
  Matrix.of fun α β => boxBoundaryWork a b μ (u α) (u β) (p β)

/-- Layer 4: the response matrix of zero-force incompressible solutions is symmetric, for every real
viscosity `μ`. -/
theorem boxResponseMatrix_isSymm {n : ℕ} {ι : Type*}
    (a b : Fin (n + 1) → ℝ) (hab : ∀ i, a i < b i) (μ : ℝ)
    (u : ι → (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p : ι → (Fin (n + 1) → ℝ) → ℝ)
    (hu : ∀ α, ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 (u α) x)
    (hp : ∀ α, ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 (p α) x)
    (hu0 : ∀ α x, (∀ i, a i < x i ∧ x i < b i) → velocityDivergence (u α) x = 0)
    (huf : ∀ α x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ (u α) (p α)) x = 0) :
    (boxResponseMatrix a b μ u p).IsSymm := by
  sorry

/-- Layer 4, quadratic form: `cᵀ R c = 2μ ∫ e(Σₐ cₐuₐ):e(Σₐ cₐuₐ)` for zero-force incompressible
solutions and every real `μ`. -/
theorem boxResponseMatrix_quadratic {n : ℕ} {ι : Type*} [Fintype ι]
    (a b : Fin (n + 1) → ℝ) (hab : ∀ i, a i < b i) (μ : ℝ)
    (u : ι → (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p : ι → (Fin (n + 1) → ℝ) → ℝ)
    (hu : ∀ α, ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 (u α) x)
    (hp : ∀ α, ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 (p α) x)
    (hu0 : ∀ α x, (∀ i, a i < x i ∧ x i < b i) → velocityDivergence (u α) x = 0)
    (huf : ∀ α x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ (u α) (p α)) x = 0)
    (c : ι → ℝ) :
    c ⬝ᵥ (boxResponseMatrix a b μ u p).mulVec c =
      2 * μ * ∫ x in Set.Icc a b,
        contraction (symGradientMatrix (velocityGradient (fun y => ∑ α, c α • u α y) x))
          (symGradientMatrix (velocityGradient (fun y => ∑ α, c α • u α y) x)) := by
  sorry

/-- Layer 4: for `μ ≥ 0` the response matrix of zero-force incompressible solutions is positive
semidefinite. -/
theorem boxResponseMatrix_posSemidef {n : ℕ} {ι : Type*} [Fintype ι]
    (a b : Fin (n + 1) → ℝ) (hab : ∀ i, a i < b i) (μ : ℝ) (hμ : 0 ≤ μ)
    (u : ι → (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p : ι → (Fin (n + 1) → ℝ) → ℝ)
    (hu : ∀ α, ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 (u α) x)
    (hp : ∀ α, ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 (p α) x)
    (hu0 : ∀ α x, (∀ i, a i < x i ∧ x i < b i) → velocityDivergence (u α) x = 0)
    (huf : ∀ α x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ (u α) (p α)) x = 0) :
    (boxResponseMatrix a b μ u p).PosSemidef := by
  sorry

/-! ## Layer 5: bounded Lipschitz domains (coordinate-free)

The carrier is `X = WithLp 2 (ℝ × E)`, the space on which PDE §1.6 defines
`Set.IsLipschitzDomainWith`. The boundary measure is `μHE[finrank ℝ E]`, which is `Hᵈ⁻¹` for
`d = finrank ℝ X`, restricted to `frontier Ω`; the normal is the measure-theoretic outer normal
`TauCeti.outerNormal volume ⊤ Ω`, which GeometricMeasureTheory §6.2 identifies with the
classical outward normal almost everywhere on `∂Ω`. -/

section Domain

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

local notation "X" => WithLp 2 (ℝ × E)

/-- Layer 5: the divergence `div u = tr (Du)`, coordinate-free. -/
def divergence (u : X → X) (x : X) : ℝ :=
  LinearMap.trace ℝ X (fderiv ℝ u x : X →ₗ[ℝ] X)

/-- Layer 5: Newtonian stress `−p I + μ (Du + Du*)` of a velocity `u` and pressure `p`,
coordinate-free. -/
def stressField (μ : ℝ) (u : X → X) (p : X → ℝ) (x : X) : X →L[ℝ] X :=
  -p x • ContinuousLinearMap.id ℝ X +
    μ • (fderiv ℝ u x + ContinuousLinearMap.adjoint (fderiv ℝ u x))

/-- Layer 5: the boundary work `B_Ω(v;u,p) = ∫_{∂Ω} v·σ(u,p)n dHᵈ⁻¹` with the outer normal `n`. -/
def domainBoundaryWork (Ω : Set X) (μ : ℝ) (v u : X → X) (p : X → ℝ) : ℝ :=
  ∫ y in frontier Ω,
    ⟪v y, stressField μ u p y (TauCeti.outerNormal volume ⊤ Ω y)⟫ ∂μHE[Module.finrank ℝ E]

/-- Layer 5, Lorentz reciprocity on a bounded Lipschitz domain. The momentum equation
`Div σ(u,p) + f = 0` is stated through its components along constant vectors `a`: for the
symmetric stress, `(Div σ)·a = div (σ a)`. -/
theorem domain_reciprocity {L : ℝ≥0} {Ω : Set X} (hΩ : Ω.IsLipschitzDomainWith L)
    (hbdd : Bornology.IsBounded Ω) (μ : ℝ) (u v f g : X → X) (p q : X → ℝ)
    (hu : ∀ x ∈ closure Ω, ContDiffAt ℝ 2 u x) (hv : ∀ x ∈ closure Ω, ContDiffAt ℝ 2 v x)
    (hp : ∀ x ∈ closure Ω, ContDiffAt ℝ 1 p x) (hq : ∀ x ∈ closure Ω, ContDiffAt ℝ 1 q x)
    (hf : ContinuousOn f (closure Ω)) (hg : ContinuousOn g (closure Ω))
    (hu0 : ∀ x ∈ Ω, divergence u x = 0) (hv0 : ∀ x ∈ Ω, divergence v x = 0)
    (huf : ∀ x ∈ Ω, ∀ a : X, divergence (fun y => stressField μ u p y a) x + ⟪f x, a⟫ = 0)
    (hvg : ∀ x ∈ Ω, ∀ a : X, divergence (fun y => stressField μ v q y a) x + ⟪g x, a⟫ = 0) :
    domainBoundaryWork Ω μ v u p + ∫ x in Ω, ⟪v x, f x⟫ =
      domainBoundaryWork Ω μ u v q + ∫ x in Ω, ⟪u x, g x⟫ := by
  sorry

end Domain

end TauCetiRoadmap.StokesReciprocity
