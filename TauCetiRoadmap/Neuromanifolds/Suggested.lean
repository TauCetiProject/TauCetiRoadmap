/-
# Neuromanifolds: suggested interfaces

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for selected milestones; discharging them
finishes neither a milestone nor the roadmap. The `sorry` proofs are targets, not completed results.
-/

import Mathlib.Data.Setoid.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Algebra.MvPolynomial.Funext
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.Nullstellensatz
import Mathlib.Basic.Real.Basic
import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Image

open scoped BigOperators

noncomputable section

namespace TauCetiRoadmap.Neuromanifolds

universe u v w z

/-- The supplied realisation map is the general interface; no architecture record is required. -/
abbrev Model (W : Type u) (X : Type v) (Y : Type w) := W → X → Y

variable {W : Type u} {X : Type v} {Y : Type w}

def neuromanifold (f : Model W X Y) : Set (X → Y) := Set.range f

def parametrisation (f : Model W X Y) : W → neuromanifold f :=
  fun w => ⟨f w, ⟨w, rfl⟩⟩

def fiber (f : Model W X Y) (g : X → Y) : Set W := f ⁻¹' {g}

def parameterSetoid (f : Model W X Y) : Setoid W := Setoid.ker f

@[simp] theorem mem_neuromanifold (f : Model W X Y) (g : X → Y) :
    g ∈ neuromanifold f ↔ ∃ w, f w = g := Iff.rfl

@[simp] theorem parametrisation_coe (f : Model W X Y) (w : W) :
    (parametrisation f w : X → Y) = f w := rfl

theorem parametrisation_surjective (f : Model W X Y) :
    Function.Surjective (parametrisation f) := by
  sorry

theorem fiber_nonempty_iff (f : Model W X Y) (g : X → Y) :
    (fiber f g).Nonempty ↔ g ∈ neuromanifold f := by
  sorry

/-- Parameters modulo equality of realised functions, with no topology asserted. -/
def quotientEquiv (f : Model W X Y) : Quotient (parameterSetoid f) ≃ neuromanifold f := by
  sorry

theorem quotientEquiv_mk (f : Model W X Y) (w : W) :
    quotientEquiv f (Quotient.mk (parameterSetoid f) w) = parametrisation f w := by
  sorry

theorem factors_iff {Z : Type z} (f : Model W X Y) (h : W → Z) :
    (∃! h' : neuromanifold f → Z, h' ∘ parametrisation f = h) ↔
      ∀ w v, f w = f v → h w = h v := by
  sorry

theorem reparametrise_range {W' : Type*} (f : Model W X Y) (r : W' → W)
    (hr : Function.Surjective r) : neuromanifold (f ∘ r) = neuromanifold f := by
  sorry

def compose {V Z : Type*} (f : Model W X Y) (g : Model V Y Z) :
    Model (W × V) X Z := fun wv x => g wv.2 (f wv.1 x)

theorem compose_range {V Z : Type*} (f : Model W X Y) (g : Model V Y Z) :
    neuromanifold (compose f g) =
      {h | ∃ a ∈ neuromanifold f, ∃ b ∈ neuromanifold g, b ∘ a = h} := by
  sorry

/-- Identifiability at one parameter modulo a specified symmetry equivalence. -/
def IdentifiableAt (f : Model W X Y) (symmetry : Setoid W) (w : W) : Prop :=
  ∀ v, f v = f w ↔ symmetry.r v w

/-- An MLP-specific constructor of realisation maps, not a universal architecture interface.
The final activation is required to be `id`, following Finkel et al. -/
structure MLPArchitecture (K : Type*) where
  depth : ℕ
  width : Fin (depth + 1) → ℕ
  activation : Fin depth → K → K
  output_identity : ∀ i : Fin depth, i.val + 1 = depth → activation i = id

namespace MLPArchitecture

variable {K : Type*} [Field K]

abbrev Weights (A : MLPArchitecture K) :=
  (i : Fin A.depth) → Matrix (Fin (A.width i.succ)) (Fin (A.width i.castSucc)) K

abbrev Parameters (A : MLPArchitecture K) :=
  (i : Fin A.depth) →
    Matrix (Fin (A.width i.succ)) (Fin (A.width i.castSucc)) K ×
      (Fin (A.width i.succ) → K)

def zeroBias (A : MLPArchitecture K) (w : A.Weights) : A.Parameters :=
  fun i => (w i, 0)

/-- Construct by dependent recursion on the prefix length; the equations below are targets. -/
def evalPrefix (A : MLPArchitecture K) (θ : A.Parameters)
    (x : Fin (A.width 0) → K) (i : Fin (A.depth + 1)) : Fin (A.width i) → K := by
  sorry

theorem evalPrefix_zero (A : MLPArchitecture K) (θ : A.Parameters)
    (x : Fin (A.width 0) → K) : A.evalPrefix θ x 0 = x := by
  sorry

theorem evalPrefix_succ (A : MLPArchitecture K) (θ : A.Parameters)
    (x : Fin (A.width 0) → K) (i : Fin A.depth) :
    A.evalPrefix θ x i.succ = fun j => A.activation i
      (((θ i).1.mulVec (A.evalPrefix θ x i.castSucc)) j + (θ i).2 j) := by
  sorry

def realise (A : MLPArchitecture K) :
    Model A.Parameters (Fin (A.width 0) → K) (Fin (A.width (Fin.last A.depth)) → K) :=
  fun θ x => A.evalPrefix θ x (Fin.last A.depth)

def realiseWeights (A : MLPArchitecture K) :
    Model A.Weights (Fin (A.width 0) → K) (Fin (A.width (Fin.last A.depth)) → K) :=
  A.realise ∘ A.zeroBias

/-- Layer-dependent monomial activations, with output exponent fixed to one. -/
def monomial (L : ℕ) (d : Fin (L + 1) → ℕ) (r : Fin L → ℕ)
    (houtput : ∀ i : Fin L, i.val + 1 = L → r i = 1) : MLPArchitecture K where
  depth := L
  width := d
  activation := fun i t => t ^ r i
  output_identity := by
    intro i hi
    funext t
    simp [houtput i hi]

end MLPArchitecture

/- The concrete signatures below specialize the field-generic roadmap to the real field. -/
/-- A bias is supplied explicitly, so zero bias is a specialization. -/
def dense {ι ο : Type*} [Fintype ι] :
    Model (Matrix ο ι ℝ × (ο → ℝ)) (ι → ℝ) (ο → ℝ) :=
  fun w x => w.1.mulVec x + w.2

def activation {ι : Type*} (σ : ℝ → ℝ) : (ι → ℝ) → (ι → ℝ) :=
  fun x i => σ (x i)

theorem activation_id {ι : Type*} (x : ι → ℝ) : activation id x = x := rfl

/-- The strict bound is the indexing prerequisite of valid convolution. -/
theorem convolution_index_lt {n m k s : ℕ} (hm : 0 < m) (hk : 0 < k)
    (hs : 0 < s) (hlen : n = s * (m - 1) + k) (i : Fin m) (j : Fin k) :
    s * i.val + j.val < n := by
  sorry

def convolution {n m k s : ℕ} (hm : 0 < m) (hk : 0 < k) (hs : 0 < s)
    (hlen : n = s * (m - 1) + k) : Model (Fin k → ℝ) (Fin n → ℝ) (Fin m → ℝ) :=
  fun w x i => ∑ j : Fin k,
    w j * x ⟨s * i.val + j.val, convolution_index_lt hm hk hs hlen i j⟩

/-- Polynomial jointly in parameters (left variables) and inputs (right variables). -/
abbrev JointPolynomial (p n o : ℕ) := Fin o → MvPolynomial (Fin p ⊕ Fin n) ℝ

def JointPolynomial.toModel {p n o : ℕ} (P : JointPolynomial p n o) :
    Model (Fin p → ℝ) (Fin n → ℝ) (Fin o → ℝ) :=
  fun w x j => MvPolynomial.eval (Sum.elim w x) (P j)

/-- A finite faithful linear presentation of a model, polynomial in its parameters.
Milestone 3 constructs this data from joint polynomials; it is not an extra hypothesis there. -/
structure PolynomialPresentation (ι κ X Y : Type*) [Fintype ι] [Fintype κ]
    [AddCommGroup Y] [Module ℝ Y] (f : Model (ι → ℝ) X Y) where
  coefficients : κ → MvPolynomial ι ℝ
  decode : (κ → ℝ) →ₗ[ℝ] (X → Y)
  decode_injective : Function.Injective decode
  realizes : ∀ w, decode (fun k => MvPolynomial.eval w (coefficients k)) = f w

/-- Every jointly polynomial model admits the finite faithful presentation built in Milestone 3.
The README additionally requires the monomial construction and degree-bound transport API. -/
theorem exists_polynomialPresentation {p n o : ℕ} (P : JointPolynomial p n o) :
    ∃ k : ℕ, Nonempty (PolynomialPresentation (Fin p) (Fin k)
      (Fin n → ℝ) (Fin o → ℝ) P.toModel) := by
  sorry

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

def coefficientMap (c : κ → MvPolynomial ι ℝ) : (ι → ℝ) → (κ → ℝ) :=
  fun w k => MvPolynomial.eval w (c k)

theorem presentation_image {X Y : Type*} [AddCommGroup Y] [Module ℝ Y]
    {f : Model (ι → ℝ) X Y} (P : PolynomialPresentation ι κ X Y f) :
    P.decode '' Set.range (coefficientMap P.coefficients) = neuromanifold f := by
  sorry

theorem presentation_fibers {X Y : Type*} [AddCommGroup Y] [Module ℝ Y]
    {f : Model (ι → ℝ) X Y} (P : PolynomialPresentation ι κ X Y f)
    (w v : ι → ℝ) :
    coefficientMap P.coefficients w = coefficientMap P.coefficients v ↔ f w = f v := by
  sorry

/-- Closure on real points, using real-coefficient equations. -/
def algClosure (S : Set (κ → ℝ)) : Set (κ → ℝ) :=
  MvPolynomial.zeroLocus ℝ (MvPolynomial.vanishingIdeal ℝ S)

/-- The neurovariety is the closure, whether or not the realised image is closed. -/
def neurovariety {W : Type*} (c : W → (κ → ℝ)) : Set (κ → ℝ) :=
  algClosure (Set.range c)

/-- Closedness is a separate property of the realised image. -/
def IsAlgebraicImage (S : Set (κ → ℝ)) : Prop := algClosure S = S

theorem subset_algClosure (S : Set (κ → ℝ)) : S ⊆ algClosure S := by
  exact MvPolynomial.zeroLocus_vanishingIdeal_le S

theorem algClosure_idempotent (S : Set (κ → ℝ)) :
    algClosure (algClosure S) = algClosure S := by
  sorry

theorem isAlgebraicImage_iff (S : Set (κ → ℝ)) :
    IsAlgebraicImage S ↔ ∃ I : Ideal (MvPolynomial κ ℝ), S = MvPolynomial.zeroLocus ℝ I := by
  sorry

theorem algClosure_linearEquiv {τ : Type*} [Fintype τ]
    (e : (κ → ℝ) ≃ₗ[ℝ] (τ → ℝ)) (S : Set (κ → ℝ)) :
    algClosure (e '' S) = e '' algClosure S := by
  sorry

/-- The imported image API is conditional on this explicit projection theorem.
README Milestone 4 also requires the unconditional real specialization, using the named
RealAlgebraicGeometry Layer 6 supplier. -/
theorem coefficient_image_semialgebraic
    (hproj : ∀ (n : ℕ) (S : Set (Fin (n + 1) → ℝ)), TauCeti.IsSemialgebraic S →
      TauCeti.IsSemialgebraic (Fin.tail '' S))
    (c : κ → MvPolynomial ι ℝ) :
    TauCeti.IsSemialgebraic (Set.range (coefficientMap c)) := by
  sorry

/-- The square coefficient family is a basic non-closed polynomial image. -/
def squareCoefficients : ℝ → (Fin 1 → ℝ) := fun w _ => w ^ 2

theorem squareCoefficients_range :
    Set.range squareCoefficients = {z | 0 ≤ z 0} := by
  sorry

theorem squareCoefficients_closure :
    algClosure (Set.range squareCoefficients) = Set.univ := by
  sorry

theorem squareCoefficients_not_algebraicImage :
    ¬ IsAlgebraicImage (Set.range squareCoefficients) := by
  sorry

end TauCetiRoadmap.Neuromanifolds
