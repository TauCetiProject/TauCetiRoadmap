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

/-- The finite-dimensional real original or residual space, with pointwise operations. -/
abbrev Vec (n : ℕ) := Fin n → ℝ
/-- A family of weights paired with a family of disaggregated original-space vectors. -/
abbrev LiftPoint (ι : Type*) (n : ℕ) := (ι → ℝ) × (ι → Vec n)

/-- Linear residual maps, offsets and a common coordinate box for a branch family. -/
structure Data (ι : Type*) (n : ℕ) where
  dim : ι → ℕ
  map : (i : ι) → Vec n →ₗ[ℝ] Vec (dim i)
  offset : (i : ι) → Vec (dim i)
  lower : Vec n
  upper : Vec n

variable {ι : Type*} [Fintype ι] {n : ℕ}

/-! ## Layer 1: scaled boxes and branch interfaces -/

/-- A branch consists of points in the common box whose affine residual lies in the set `K i`. -/
def branch (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) (i : ι) : Set (Vec n) :=
  {x | x ∈ Icc D.lower D.upper ∧ D.map i x - D.offset i ∈ K i}

/-- The union of all boxed branches. -/
def boundedUnion (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) : Set (Vec n) :=
  ⋃ i, branch D K i

/-- Nonnegative simplex weights and disaggregated vectors satisfying scaled residual conditions and box bounds. -/
def lift (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) : Set (LiftPoint ι n) :=
  {p | (∀ i, 0 ≤ p.1 i) ∧ (∑ i, p.1 i) = 1 ∧
    (∀ i, D.map i (p.2 i) - p.1 i • D.offset i ∈ K i) ∧
    (∀ i j, D.lower j * p.1 i ≤ p.2 i j ∧ p.2 i j ≤ D.upper j * p.1 i)}

/-- The original-space vector obtained by summing the disaggregated branch vectors. -/
def sumBlocks (p : LiftPoint ι n) : Vec n := ∑ i, p.2 i

/-- The original-space image of the scaled-box lift under summation. -/
def projection (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) : Set (Vec n) :=
  {x | ∃ p ∈ lift D K, x = sumBlocks p}

/-- The lift together with the original-space coordinate equal to the sum of its blocks. -/
def fullLift (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i))) : Set (Vec n × LiftPoint ι n) :=
  {p | p.2 ∈ lift D K ∧ p.1 = sumBlocks p.2}

/-! ## Layer 2: exact finite-union hull -/

/-- For pointed cones, the projected scaled-box lift equals the convex hull of the boxed union;
branches may be empty. -/
theorem hull_exact (D : Data ι n) (K : (i : ι) → PointedCone ℝ (Vec (D.dim i))) :
    projection D (fun i => (K i : Set _)) =
      convexHull ℝ (boundedUnion D (fun i => (K i : Set _))) := by
  sorry

/-! ## Layer 3: compact lift and closed hull -/

/-- Closed sets `K i` make the scaled-box lift compact in the finite weight and block space. -/
theorem isCompact_lift (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i)))
    (hK : ∀ i, IsClosed (K i)) : IsCompact (lift D K) := by
  sorry

/-- For closed sets `K i`, retaining the original-space sum coordinate preserves compactness. -/
theorem isCompact_fullLift (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i)))
    (hK : ∀ i, IsClosed (K i)) : IsCompact (fullLift D K) := by
  sorry

/-- The projection of the scaled-box lift is compact when every set `K i` is closed. -/
theorem isCompact_projection (D : Data ι n) (K : (i : ι) → Set (Vec (D.dim i)))
    (hK : ∀ i, IsClosed (K i)) : IsCompact (projection D K) := by
  sorry

/-- For closed pointed cones, the closed convex hull of the boxed union equals
the projected lift. -/
theorem closed_hull_exact (D : Data ι n)
    (K : (i : ι) → PointedCone ℝ (Vec (D.dim i)))
    (hK : ∀ i, IsClosed (K i : Set (Vec (D.dim i)))) :
    closure (convexHull ℝ (boundedUnion D (fun i => (K i : Set _)))) =
      projection D (fun i => (K i : Set _)) := by
  sorry

end TauCetiRoadmap.BoundedConicHulls
