import Mathlib
import TauCeti.Analysis.Sobolev.W1p.Basic

/-!
# Sobolev spaces of differential forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular items, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a milestone nor the roadmap.

The pinned Tau Ceti revision does not contain `TestFunction.extDerivCLM` or the Lipschitz-domain
predicate of PDE Lane A.6, so the codifferential of test forms (item 1) and Milestones 4 and 6 are
not prototyped here.
-/

noncomputable section

open MeasureTheory TopologicalSpace
open scoped ENNReal Distributions InnerProductSpace

namespace TauCetiRoadmap.SobolevDifferentialForms

/-- The Euclidean space `ℝⁿ` of the roadmap. -/
abbrev E (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-! ### Covectors (Standing setting) -/

/-- `k`-covectors on `ℝⁿ`: a type wrapper around Mathlib's continuous alternating maps, in the
shape of Mathlib's `WithLp`, carrying the Hilbert structure transported from `⋀[ℝ]^k (E n)`. -/
structure Covector (n k : ℕ) where
  /-- Wrap an alternating map as a covector. -/
  toCovector ::
  /-- The underlying alternating map. -/
  ofCovector : E n [⋀^Fin k]→L[ℝ] ℝ

namespace Covector

variable {n k l : ℕ}

/-- The Hilbert structure, transported along `Covector.toExteriorPower`. -/
instance : NormedAddCommGroup (Covector n k) := sorry

/-- The Hilbert structure, transported along `Covector.toExteriorPower`. -/
instance : InnerProductSpace ℝ (Covector n k) := sorry

instance : FiniteDimensional ℝ (Covector n k) := sorry

/-- The linear equivalence with the underlying alternating maps. -/
def equivL : (E n [⋀^Fin k]→L[ℝ] ℝ) ≃L[ℝ] Covector n k := sorry

theorem equivL_apply (α : E n [⋀^Fin k]→L[ℝ] ℝ) : equivL α = toCovector α := sorry

/-- The musical isomorphism with Mathlib's inner product space `⋀[ℝ]^k (E n)`: a covector is a
functional on `⋀[ℝ]^k (E n)` by `exteriorPower.alternatingMapLinearEquiv`, turned into a
multivector by the bijection `(innerₗ (E n)).exteriorPower k`. -/
def toExteriorPower : Covector n k ≃ₗᵢ[ℝ] ⋀[ℝ]^k (E n) := sorry

/-- The coordinate formula for the inner product, over the index type of
`OrthonormalBasis.exteriorPower`. -/
theorem inner_eq_sum (α β : Covector n k) :
    ⟪α, β⟫_ℝ = ∑ I : Set.powersetCard (Fin n) k,
      α.ofCovector (fun i => EuclideanSpace.single (Set.powersetCard.ofFinEmbEquiv.symm I i) 1) *
        β.ofCovector (fun i => EuclideanSpace.single (Set.powersetCard.ofFinEmbEquiv.symm I i) 1) :=
  sorry

/-- The Hodge star for the standard orientation and unit volume element. -/
def hodgeStar (hkl : k + l = n) : Covector n k ≃ₗᵢ[ℝ] Covector n l := sorry

theorem hodgeStar_hodgeStar (hkl : k + l = n) (hlk : l + k = n) (α : Covector n k) :
    hodgeStar hlk (hodgeStar hkl α) = ((-1 : ℝ) ^ (k * l)) • α := sorry

/-- `hodgeStar` is Mathlib's `exteriorPower.hodgeStar`, conjugated by the musical isomorphism,
for the volume element sending the wedge of the standard basis to `1`. -/
theorem toExteriorPower_hodgeStar (hB : Function.Bijective (innerₗ (E n)))
    (vol : ⋀[ℝ]^(Module.finrank ℝ (E n)) (E n) ≃ₗ[ℝ] ℝ)
    (hvol : vol (EuclideanSpace.basisFun (Fin n) ℝ).toBasis.topVector = 1)
    (hkl : k + l = n) (hkl' : k + l = Module.finrank ℝ (E n)) (α : Covector n k) :
    toExteriorPower (hodgeStar hkl α) =
      exteriorPower.hodgeStar (innerₗ (E n)) hB vol hkl' (toExteriorPower α) := sorry

end Covector

open Covector

/-! ### The weak exterior derivative (Milestone 1) -/

/-- `u` has weak exterior derivative `w` on `Ω` (README, item 1). -/
def HasWeakExtDerivOn {n k : ℕ} (Ω : Opens (E n)) (u : E n → Covector n k)
    (w : E n → Covector n (k + 1)) : Prop :=
  LocallyIntegrableOn u Ω ∧ LocallyIntegrableOn w Ω ∧
    ∀ (ψ : 𝓓(Ω, ℝ)) (v : Fin (k + 1) → E n),
      ∫ x, (ψ : E n → ℝ) x * (w x).ofCovector v =
        -∑ j : Fin (k + 1), (-1 : ℝ) ^ (j : ℕ) *
          ∫ x, (u x).ofCovector (Fin.removeNth j v) * fderiv ℝ (ψ : E n → ℝ) x (v j)

/-- A weak Fréchet derivative alternatizes to a weak exterior derivative (README, item 1). -/
theorem hasWeakExtDerivOn_of_hasWeakFDerivOn {n k : ℕ} {Ω : Opens (E n)}
    {u : E n → Covector n k} {U : E n → E n →L[ℝ] Covector n k}
    (h : TauCeti.HasWeakFDerivOn volume Ω u U) :
    HasWeakExtDerivOn Ω u fun x => toCovector (ContinuousAlternatingMap.alternatizeUncurryFin
      (((equivL (n := n) (k := k)).symm.toContinuousLinearMap).comp (U x))) := sorry

/-- `d ∘ d = 0` (README, item 2). -/
theorem HasWeakExtDerivOn.ae_eq_zero {n k : ℕ} {Ω : Opens (E n)} {u : E n → Covector n k}
    {w : E n → Covector n (k + 1)} {z : E n → Covector n (k + 2)}
    (hu : HasWeakExtDerivOn Ω u w) (hw : HasWeakExtDerivOn Ω w z) :
    z =ᵐ[volume.restrict (Ω : Set (E n))] 0 := sorry

/-! ### The spaces `WᵖΛᵏ(Ω)` (Milestone 2) -/

/-- The fibre of a form jet `(u, du)`, with the Euclidean product norm of `TauCeti.Sobolev1Jet`. -/
abbrev FormJet (n k : ℕ) := WithLp 2 (Covector n k × Covector n (k + 1))

/-- The closed graph of the weak exterior derivative in `Lᵖ` jets. -/
def wpΛSubmodule (n : ℕ) (Ω : Opens (E n)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (k : ℕ) :
    Submodule ℝ (Lp (FormJet n k) p (volume.restrict (Ω : Set (E n)))) where
  carrier := {J | HasWeakExtDerivOn Ω (fun x => (J x).fst) (fun x => (J x).snd)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem isClosed_wpΛSubmodule (n : ℕ) (Ω : Opens (E n)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (k : ℕ) :
    IsClosed (wpΛSubmodule n Ω p k : Set (Lp (FormJet n k) p (volume.restrict (Ω : Set (E n))))) :=
  sorry

/-- `WᵖΛᵏ(Ω)` (README, item 4), written `TauCeti.WpΛ Ω p k` there. -/
abbrev WpΛ (n : ℕ) (Ω : Opens (E n)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (k : ℕ) :=
  wpΛSubmodule n Ω p k

/-- `HΛᵏ(Ω) := W²Λᵏ(Ω)`; its inner product space structure is the graph inner product. -/
abbrev HΛ (n : ℕ) (Ω : Opens (E n)) (k : ℕ) := WpΛ n Ω 2 k

example (n : ℕ) (Ω : Opens (E n)) (k : ℕ) : InnerProductSpace ℝ (HΛ n Ω k) := inferInstance

namespace WpΛ

variable {n : ℕ} {Ω : Opens (E n)} {p : ℝ≥0∞} [Fact (1 ≤ p)] {k : ℕ}

instance : CompleteSpace (WpΛ n Ω p k) := sorry

/-- The `Lᵖ` value component. -/
def valueL : WpΛ n Ω p k →L[ℝ] Lp (Covector n k) p (volume.restrict (Ω : Set (E n))) := sorry

/-- The weak exterior derivative as a bounded operator (README, item 4). -/
def dL : WpΛ n Ω p k →L[ℝ] Lp (Covector n (k + 1)) p (volume.restrict (Ω : Set (E n))) := sorry

/-- The range of `d` lies in the kernel of `d` (README, item 4). -/
theorem exists_valueL_eq_dL (u : WpΛ n Ω p k) :
    ∃ v : WpΛ n Ω p (k + 1), valueL v = dL u ∧ dL v = 0 := sorry

/-- Degree zero is `W^{1,p}(Ω)` with equal norms (README, item 8). -/
def equivW1p : TauCeti.W1p volume Ω p ≃ₗᵢ[ℝ] WpΛ n Ω p 0 := sorry

end WpΛ

end TauCetiRoadmap.SobolevDifferentialForms
