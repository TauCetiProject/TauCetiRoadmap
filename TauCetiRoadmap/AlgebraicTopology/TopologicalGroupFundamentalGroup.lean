import Mathlib.AlgebraicTopology.FundamentalGroupoid.FundamentalGroup
import Mathlib.Topology.Homotopy.Product
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.GroupTheory.EckmannHilton

/-! Suggested forms accompany the definitive roadmap prose; they are not an
exhaustive checklist. The constructions below use the native path quotient and
its existing group multiplication, whose order is reversed path composition. -/

namespace TauCetiRoadmap.AlgebraicTopology.TopologicalGroupFundamentalGroup

noncomputable section

variable {G : Type*} [TopologicalSpace G] [MulOneClass G] [ContinuousMul G]

/-- The native fundamental-group map induced by continuous multiplication. -/
def multiplicationMap : FundamentalGroup (G × G) (1, 1) →* FundamentalGroup G 1 :=
  FundamentalGroup.mapOfEq ⟨fun x => x.1 * x.2, continuous_mul⟩ (one_mul 1)

/-- Pointwise multiplication on actual homotopy classes of based loops. -/
def pointwise (p q : FundamentalGroup G 1) : FundamentalGroup G 1 :=
  multiplicationMap (FundamentalGroup.fromPath (Path.Homotopic.prod p.toPath q.toPath))

theorem pointwise_one_left (p : FundamentalGroup G 1) : pointwise 1 p = p := by
  obtain ⟨p⟩ := p
  induction p using Path.Homotopic.Quotient.ind with
  | mk p =>
    unfold pointwise multiplicationMap
    rw [FundamentalGroup.mapOfEq_apply]
    change FundamentalGroup.fromPath (Path.Homotopic.Quotient.mk _) =
      FundamentalGroup.fromPath (Path.Homotopic.Quotient.mk p)
    apply congrArg FundamentalGroup.fromPath
    apply congrArg Path.Homotopic.Quotient.mk
    ext t
    exact one_mul (p t)

theorem pointwise_one_right (p : FundamentalGroup G 1) : pointwise p 1 = p := by
  obtain ⟨p⟩ := p
  induction p using Path.Homotopic.Quotient.ind with
  | mk p =>
    unfold pointwise multiplicationMap
    rw [FundamentalGroup.mapOfEq_apply]
    change FundamentalGroup.fromPath (Path.Homotopic.Quotient.mk _) =
      FundamentalGroup.fromPath (Path.Homotopic.Quotient.mk p)
    apply congrArg FundamentalGroup.fromPath
    apply congrArg Path.Homotopic.Quotient.mk
    ext t
    exact mul_one (p t)

/-- Interchange uses only product paths and functoriality of the native map. -/
theorem pointwise_interchange (a b c d : FundamentalGroup G 1) :
    pointwise (a * b) (c * d) = pointwise a c * pointwise b d := by
  unfold pointwise
  rw [← map_mul]
  apply congrArg multiplicationMap
  change FundamentalGroup.fromPath
      (Path.Homotopic.prod (b.toPath.trans a.toPath) (d.toPath.trans c.toPath)) =
    FundamentalGroup.fromPath
      ((Path.Homotopic.prod b.toPath d.toPath).trans (Path.Homotopic.prod a.toPath c.toPath))
  exact congrArg FundamentalGroup.fromPath
    (Path.Homotopic.comp_prod_eq_prod_comp b.toPath d.toPath a.toPath c.toPath).symm

/-- The group already carried by the native fundamental group is commutative.
No connectedness, manifold, local-contractibility or covering hypothesis is used. -/
abbrev commGroup : CommGroup (FundamentalGroup G 1) :=
  EckmannHilton.commGroup
    (EckmannHilton.IsUnital.mk
      { left_id := pointwise_one_left, right_id := pointwise_one_right })
    pointwise_interchange

/-- The commutative refinement keeps the native group structure definitionally. -/
theorem commGroup_toGroup : (commGroup (G := G)).toGroup =
    (inferInstance : Group (FundamentalGroup G 1)) := rfl

theorem fundamentalGroup_mul_comm (a b : FundamentalGroup G 1) : a * b = b * a :=
  (commGroup (G := G)).mul_comm a b

/-- The pointwise operation agrees with the existing fundamental-group product. -/
theorem pointwise_eq_mul (a b : FundamentalGroup G 1) : pointwise a b = a * b :=
  congrFun (congrFun
    (EckmannHilton.mul
      (EckmannHilton.IsUnital.mk
        { left_id := pointwise_one_left, right_id := pointwise_one_right })
      EckmannHilton.MulOneClass.isUnital pointwise_interchange) a) b

/-- Naturality retains the actual continuous multiplicative map. -/
theorem mapOfEq_pointwise {H : Type*} [TopologicalSpace H] [MulOneClass H]
    [ContinuousMul H] (f : G →* H) (hf : Continuous f)
    (a b : FundamentalGroup G 1) :
    FundamentalGroup.mapOfEq ⟨f, hf⟩ f.map_one (pointwise a b) =
      pointwise (FundamentalGroup.mapOfEq ⟨f, hf⟩ f.map_one a)
        (FundamentalGroup.mapOfEq ⟨f, hf⟩ f.map_one b) := by
  rw [pointwise_eq_mul, pointwise_eq_mul, map_mul]

end

end TauCetiRoadmap.AlgebraicTopology.TopologicalGroupFundamentalGroup
