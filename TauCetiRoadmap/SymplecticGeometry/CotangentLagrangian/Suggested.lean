import Mathlib
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Geometry.Symplectic.Lagrangian.Basic
import TauCeti.Geometry.Symplectic.Cotangent.Liouville
import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace

/-!
# Cotangent bundles and Lagrangian geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, with only the
simple definitions those statements need.

Not statable at the pins, and therefore absent:

* the identity `ω = −dλ` for the canonical two-form of `T*M`: Tau Ceti has no exterior
  derivative taking a one-form on a manifold to a `SmoothTwoForm`. Its content is stated as
  `canonicalForm_exists`: a symplectic `SmoothTwoForm` on `T*M` exists whose expression in
  every cotangent chart is `strongDualCotangentSymplecticForm`, and that expression determines
  the form;
* the C3 generating-function symplectomorphisms, the C3.1 chain dictionary and the convex
  billiard map: there is no carrier for a symplectomorphism between open cotangent domains;
* the C4 relative Moser and neighborhood-germ theorems: there is no carrier for a
  symplectomorphism germ along a submanifold or for a symplectic bundle isomorphism over an
  embedding. The linear step is stated in `RelativeDarbouxTargets.lean`.
-/
noncomputable section
open scoped Manifold ContDiff
open Bundle
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-! ## C1: Intrinsic cotangent phase space -/

/-- The cotangent bundle `T*M` as Mathlib's total space of the bundle of continuous linear
functionals on tangent spaces. -/
abbrev Cotangent (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] := TotalSpace (E →L[ℝ] ℝ) (fun x : M ↦ TangentSpace I x →L[ℝ] ℝ)

/-- The model with corners of `T*M`: the base model times the dual of the base model space. -/
abbrev cotangentModel := I.prod 𝓘(ℝ, E →L[ℝ] ℝ)

example : IsManifold (cotangentModel I) ∞ (Cotangent I M) := inferInstance

/-- The tautological covector evaluated on the derivative of projection. -/
def liouville (z : Cotangent I M) : TangentSpace (cotangentModel I) z →L[ℝ] ℝ :=
  z.2.comp (mfderiv (cotangentModel I) I (fun y : Cotangent I M ↦ y.1) z)

/-- The canonical symplectic form of the cotangent bundle: a smooth two-form on `T*M` exists
which is symplectic (closed and fiberwise nondegenerate) and whose expression in every cotangent
chart is the linear model `strongDualCotangentSymplecticForm`, that is `Σ dqᵢ ∧ dpᵢ` in the
family's `ω = −dλ` convention (Cannas da Silva, §§2.2–2.3). The chart expression determines the
form. -/
theorem canonicalForm_exists [FiniteDimensional ℝ E] :
    ∃ σ : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M), σ.IsSymplectic ∧
      ∀ (z₀ : Cotangent I M) (w : E × (E →L[ℝ] ℝ)),
        w ∈ (extChartAt (cotangentModel I) z₀).target →
        ∀ v : Fin 2 → (E × (E →L[ℝ] ℝ)),
          σ.inChartAt z₀ w v = TauCeti.strongDualCotangentSymplecticForm (v 0) (v 1) := by
  sorry

/-- Liouville read in cotangent chart coordinates is the existing linear Liouville form. -/
theorem liouville_inChart [I.Boundaryless] [FiniteDimensional ℝ E]
    (z₀ : Cotangent I M) (w : E × (E →L[ℝ] ℝ))
    (hw : w ∈ (extChartAt (cotangentModel I) z₀).target)
    (v : E × (E →L[ℝ] ℝ)) :
    liouville I ((extChartAt (cotangentModel I) z₀).symm w)
      (mfderiv 𝓘(ℝ, E × (E →L[ℝ] ℝ)) (cotangentModel I)
        (extChartAt (cotangentModel I) z₀).symm w v) =
      TauCeti.cotangentLiouvilleForm w (fun _ : Fin 1 ↦ v) := by
  sorry

variable {I}

/-- Adapter to the degree-one `SmoothForm`/`ContMDiffSection` carrier; the equivalence
is a C1 target, not a second one-form library. -/
def IsSmoothOneForm (α : (x : M) → TangentSpace I x →L[ℝ] ℝ) : Prop :=
  ContMDiff I (cotangentModel I) ∞
    (fun x ↦ (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x) : Cotangent I M))

/-- Pulling tautological Liouville back along a smooth section recovers its covector. -/
theorem liouville_section (α : (x : M) → TangentSpace I x →L[ℝ] ℝ)
    (hα : IsSmoothOneForm α) (x : M) (v : TangentSpace I x) :
    liouville I (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x))
      (mfderiv I (cotangentModel I)
        (fun x ↦ (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x) : Cotangent I M)) x v) = α x v := by
  sorry

/-! ## C2: Embedded Lagrangians -/

/-- Embedded Lagrangians reuse the pinned embedding and tangent-range APIs: the image of each
tangent space is a Lagrangian subspace for the symplectic form at that point. -/
def IsLagrangianEmbedding {F K Q : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    [TopologicalSpace K] (J : ModelWithCorners ℝ F K)
    [TopologicalSpace Q] [ChartedSpace K Q]
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsNondegenerate)
    (i : TauCeti.SmoothEmbedding J I ∞ Q M) : Prop :=
  ∀ q, (hσ.symplecticFormAt (i q)).IsLagrangian (i.tangentRange q (by simp))

end TauCetiRoadmap.SymplecticGeometry
