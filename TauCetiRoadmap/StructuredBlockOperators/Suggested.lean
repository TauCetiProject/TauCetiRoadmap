import Mathlib.LinearAlgebra.Matrix.DotProduct

/-!
# Structured block operators: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These signatures pin the rectangular block predicate and the exact application
algorithm. They deliberately distinguish block constancy from the weaker equitable-row-sum
condition.
-/

namespace TauCetiRoadmap.StructuredBlockOperators

variable {M N D : Type*} {𝕜 : Type*}
variable [Fintype M] [DecidableEq M] [Fintype N] [DecidableEq N]

/-- A matrix whose entries factor exactly through row and column cell maps. -/
def IsBlockConstant [Semiring 𝕜] {I J : Type*}
    (A : Matrix M N 𝕜) (rowCell : M → I) (colCell : N → J) (B : Matrix I J 𝕜) : Prop :=
  ∀ i j, A i j = B (rowCell i) (colCell j)

/-- Dense matrix application to a family of feature columns. -/
def fullApply [Semiring 𝕜] (A : Matrix M N 𝕜) (X : N → D → 𝕜) : M → D → 𝕜 :=
  fun i e => ∑ j, A i j * X j e

/-- Sum features inside each input cell. -/
def cellSum [AddCommMonoid 𝕜] {J : Type*} [Fintype J] [DecidableEq J]
    (colCell : N → J) (X : N → D → 𝕜) : J → D → 𝕜 :=
  fun c e => ∑ j, if colCell j = c then X j e else 0

/-- Apply the small block matrix after aggregating each input cell. -/
def blockApply [Semiring 𝕜] {I J : Type*} [Fintype J] [DecidableEq J]
    (B : Matrix I J 𝕜) (rowCell : M → I) (colCell : N → J)
    (X : N → D → 𝕜) : M → D → 𝕜 :=
  fun i e => ∑ c, B (rowCell i) c * cellSum colCell X c e

/-- Fiberwise regrouping proves correctness of the exact block algorithm. -/
theorem blockApply_eq_fullApply [CommSemiring 𝕜] {I J : Type*}
    [Fintype J] [DecidableEq J] (A : Matrix M N 𝕜) (B : Matrix I J 𝕜)
    (rowCell : M → I) (colCell : N → J) (X : N → D → 𝕜)
    (hblock : IsBlockConstant A rowCell colCell B) :
    blockApply B rowCell colCell X = fullApply A X := sorry

/-- The pinned scalar-multiplication count for the dense reference program. -/
def denseMulCount (m n d : ℕ) : ℕ := m * n * d

/-- The pinned count for aggregation plus block contraction. -/
def blockArithmeticCount (m n r d : ℕ) : ℕ := n * d + m * r * d

end TauCetiRoadmap.StructuredBlockOperators
