import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
The scalar control lemma constructs a cofinal radial coordinate for the two
proper end deformations in the point-flattening argument. Its admission is
an unimplemented theorem target, not an assumed chart or product structure.
-/
namespace TauCetiRoadmap.FourManifolds
open Filter Set
open scoped Topology

/-- Radial squeezing for the point case, relative to a fixed outer radius. -/
theorem exists_radial_control_reparametrization
    (a b c d : ℝ → ℝ)
    (ha : ContinuousOn a (Ioi 0)) (hb : ContinuousOn b (Ioi 0))
    (hc : ContinuousOn c (Ioi 0))
    (hmono_a : MonotoneOn a (Ioi 0)) (hmono_b : MonotoneOn b (Ioi 0))
    (hmono_c : MonotoneOn c (Ioi 0))
    (ha0 : Tendsto a (𝓝[>] (0 : ℝ)) (𝓝 0))
    (hb0 : Tendsto b (𝓝[>] (0 : ℝ)) (𝓝 0))
    (hc0 : Tendsto c (𝓝[>] (0 : ℝ)) (𝓝 0))
    (hbounds : ∀ t > 0, 0 ≤ a t ∧ 0 < b t ∧ b t ≤ t ∧ t ≤ c t)
    (hd : ContinuousOn d (Ioi 0)) (hdpos : ∀ t > 0, 0 < d t)
    (R : ℝ) (hR : 0 < R) :
    ∃ (h : ℝ ≃o ℝ) (η : ℝ),
      0 < η ∧ η < R ∧ h 0 = 0 ∧
      (∀ t, t ≤ 0 ∨ R ≤ t → h t = t) ∧
      ∀ t ∈ Ioo 0 η,
        max (a t) (h (c t) - h (b t)) < d (h t) := by
  sorry

end TauCetiRoadmap.FourManifolds
