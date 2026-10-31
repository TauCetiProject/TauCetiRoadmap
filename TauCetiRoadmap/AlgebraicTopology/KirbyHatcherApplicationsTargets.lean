import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Group.TypeTags.Basic
import Mathlib.Topology.Algebra.ConstMulAction

/-!
The README is definitive; these signatures are representative and nonexhaustive.
This is a future theorem target, not an implementation or a claim that the geometric
comparison has been built. Use the existing native sphere subtype and MulAction.
The group is the multiplicative wrapper of the actual additive group (ZMod p)².
-/
namespace KirbyHatcherApplicationsTargets

/-- No continuous action of (C_p)² on S^n is free, including S^0.
For a finite group, continuity of each translation is the continuity required for
its action with the discrete group topology. No linearity or smoothness is assumed. -/
theorem elementaryAbelianPair_sphere_action_has_stabilizer
    (p n : ℕ) (hp : p.Prime)
    [MulAction (Multiplicative (ZMod p × ZMod p))
      ↥(Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)]
    (hcont : ∀ g : Multiplicative (ZMod p × ZMod p),
      Continuous fun x : ↥(Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) =>
        g • x) :
    ∃ g : Multiplicative (ZMod p × ZMod p), g ≠ 1 ∧
      ∃ x : ↥(Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1), g • x = x := by
  sorry

end KirbyHatcherApplicationsTargets
