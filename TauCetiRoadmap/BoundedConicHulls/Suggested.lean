import Mathlib

/-!
# Finite boxed conic-union hulls: target signatures

The roadmap is `README.md`; this file is not the roadmap. These are suggested forms of its
headline targets, together with complete data definitions, against the pinned Mathlib. The
README is definitive and also specifies the basic membership, image, bounds and empty-case
API. Every theorem here is intentionally admitted with `sorry`; compilation checks signatures,
not mathematical truth or completion of the roadmap.
-/

noncomputable section
open scoped BigOperators
open Set

namespace TauCetiRoadmap.BoundedConicHulls

abbrev Vec (n : ℕ) := Fin n → ℝ
abbrev LiftPoint (ι : Type*) (n : ℕ) := (ι → ℝ) × (ι → Vec n)

/-- Only data: no nonemptiness, consistent bounds, closedness or cone assumptions. -/
structure Data (ι : Type*) (n : ℕ) where
  dim : ι → ℕ
  map : (i : ι) → Vec n →ₗ[ℝ] Vec (dim i)
  offset : (i : ι) → Vec (dim i)
  lower : Vec n
  upper : Vec n

variable {ι : Type*} [Fintype ι] {n : ℕ}

/-- Raw row sets are used by the definitions and the compactness targets. -/
def branch (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) (i : ι) : Set (Vec n) :=
  {x | x ∈ Icc D.lower D.upper ∧ D.map i x - D.offset i ∈ K i}

def boundedUnion (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) : Set (Vec n) :=
  ⋃ i, branch D K i

def lift (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) : Set (LiftPoint ι n) :=
  {p | (∀ i, 0 ≤ p.1 i) ∧ (∑ i, p.1 i) = 1 ∧
    (∀ i, D.map i (p.2 i) - p.1 i • D.offset i ∈ K i) ∧
    (∀ i j, D.lower j * p.1 i ≤ p.2 i j ∧ p.2 i j ≤ D.upper j * p.1 i)}

def sumBlocks (p : LiftPoint ι n) : Vec n := ∑ i, p.2 i

def projection (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) : Set (Vec n) :=
  {x | ∃ p ∈ lift D K, x = sumBlocks p}

/-- The displayed physical coordinate is retained, rather than implicitly projected away. -/
def fullLift (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) : Set (Vec n × LiftPoint ι n) :=
  {p | p.2 ∈ lift D K ∧ p.1 = sumBlocks p.2}

/-! ## Layer 1: scaled boxes and branch interfaces -/

theorem zero_block (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i)))
    {p : LiftPoint ι n} (hp : p ∈ lift D K) (i : ι) (hi : p.1 i = 0) :
    p.2 i = 0 := by
  sorry

theorem normalized_block (D : Data ι n) (K : (i : ι) → PointedCone ℝ (Vec (D.dim i)))
    {p : LiftPoint ι n} (hp : p ∈ lift D (fun i => (K i : Set _)))
    (i : ι) (hi : 0 < p.1 i) :
    (p.1 i)⁻¹ • p.2 i ∈ branch D (fun i => (K i : Set _)) i := by
  sorry

theorem empty_branch_weight_block (D : Data ι n)
    (K : (i : ι) → PointedCone ℝ (Vec (D.dim i)))
    {p : LiftPoint ι n} (hp : p ∈ lift D (fun i => (K i : Set _)))
    (i : ι) (hi : branch D (fun i => (K i : Set _)) i = ∅) :
    p.1 i = 0 ∧ p.2 i = 0 := by
  sorry

/-! ## Layer 2: exact finite-union hull -/

theorem convex_lift (D : Data ι n) (K : (i : ι) → PointedCone ℝ (Vec (D.dim i))) :
    Convex ℝ (lift D (fun i => (K i : Set _))) := by
  sorry

theorem convex_projection (D : Data ι n)
    (K : (i : ι) → PointedCone ℝ (Vec (D.dim i))) :
    Convex ℝ (projection D (fun i => (K i : Set _))) := by
  sorry

theorem hull_exact (D : Data ι n) (K : (i : ι) → PointedCone ℝ (Vec (D.dim i))) :
    projection D (fun i => (K i : Set _)) =
      convexHull ℝ (boundedUnion D (fun i => (K i : Set _))) := by
  sorry

/-! ## Layer 3: compact lift and closed hull -/

theorem isCompact_lift (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i)))
    (hK : ∀ i, IsClosed (K i)) : IsCompact (lift D K) := by
  sorry

theorem isCompact_fullLift (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i)))
    (hK : ∀ i, IsClosed (K i)) : IsCompact (fullLift D K) := by
  sorry

theorem isCompact_projection (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i)))
    (hK : ∀ i, IsClosed (K i)) : IsCompact (projection D K) := by
  sorry

theorem closed_hull_exact (D : Data ι n)
    (K : (i : ι) → PointedCone ℝ (Vec (D.dim i)))
    (hK : ∀ i, IsClosed (K i : Set (Vec (D.dim i)))) :
    closure (convexHull ℝ (boundedUnion D (fun i => (K i : Set _)))) =
      projection D (fun i => (K i : Set _)) := by
  sorry

end TauCetiRoadmap.BoundedConicHulls
