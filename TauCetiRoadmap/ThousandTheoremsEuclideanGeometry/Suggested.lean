import Mathlib

/-!
# Classical Euclidean plane geometry from the 1000+ theorems list: suggested signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below suggest Lean forms for the few new definitions and for a sample of the
milestone statements, so that contributors and reviewers converge on names and shapes.
Discharging every declaration here finishes neither a milestone nor the roadmap. `sorry` is
allowed in this human-owned roadmap library: these are targets, not completed proofs.

The pinned choices illustrated here are:

- Points live in a Euclidean affine space `P` over `V`, as in Mathlib's `EuclideanGeometry`.
  Plane statements add `[Fact (finrank ℝ V = 2)]`; statements that need an orientation add
  `[Module.Oriented ℝ V (Fin 2)]` and use Mathlib's `EuclideanGeometry.o`.
- A triangle is an `Affine.Triangle ℝ P`, or three points with
  `AffineIndependent ℝ ![a, b, c]` when the statement names its points.
- Ratios along a side are `AffineMap.lineMap` parameters, as in Mathlib's Ceva theorem
  `Affine.Triangle.prod_eq_prod_one_sub_of_mem_line_point_lineMap`.
- Signed area is half the area form of the positive orientation, so a counterclockwise triangle
  has positive area.
-/

open EuclideanGeometry Module AffineMap
open scoped EuclideanGeometry Real RealInnerProductSpace LinearAlgebra.Projectivization

namespace TauCeti.ThousandTheorems

section Affine

variable {k V P : Type*} [Field k] [AddCommGroup V] [Module k V] [AddTorsor V P]

/-- **Menelaus's theorem**: points on the three side lines, given by `lineMap` parameters in
the convention of Mathlib's Ceva theorem, are collinear iff the product of the parameters is
minus the product of their complements. -/
theorem Affine.Triangle.collinear_lineMap_iff (t : Affine.Triangle k P) (r : Fin 3 → k) :
    Collinear k (Set.range fun i : Fin 3 ↦
        lineMap (t.points (i + 1)) (t.points (i + 2)) (r i)) ↔
      ∏ i, r i = -∏ i, (1 - r i) := by
  sorry

/-- **Varignon's theorem**: the midpoints of the sides of any quadrilateral, taken in order, form
a parallelogram. -/
theorem varignon (p : Fin 4 → P) [Invertible (2 : k)] :
    midpoint k (p 1) (p 2) -ᵥ midpoint k (p 0) (p 1) =
      midpoint k (p 2) (p 3) -ᵥ midpoint k (p 3) (p 0) := by
  sorry

end Affine

variable {V P : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [MetricSpace P]
  [NormedAddTorsor V P]

section Metric

/-- **Angle bisector theorem.** -/
theorem dist_mul_dist_eq_of_angle_eq {a b c d : P} (h : AffineIndependent ℝ ![a, b, c])
    (hd : Sbtw ℝ b d c) (hbis : ∠ b a d = ∠ d a c) :
    dist b d * dist a c = dist d c * dist a b := by
  sorry

/-- **Steiner–Lehmus theorem**: a triangle with two equal internal angle bisectors is isosceles. -/
theorem steiner_lehmus {a b c d e : P} (h : AffineIndependent ℝ ![a, b, c])
    (hd : Sbtw ℝ a d c) (hbd : ∠ a b d = ∠ d b c)
    (he : Sbtw ℝ a e b) (hce : ∠ a c e = ∠ e c b)
    (heq : dist b d = dist c e) : dist a b = dist a c := by
  sorry

/-- **Hinge theorem.** -/
theorem dist_lt_dist_of_angle_lt {a b c a' b' c' : P} (hab : dist a b = dist a' b')
    (hac : dist a c = dist a' c') (hb : b ≠ a) (hc : c ≠ a) (h : ∠ b a c < ∠ b' a' c') :
    dist b c < dist b' c' := by
  sorry

/-- **Viviani's theorem**: in an equilateral triangle, the distances from a point of the closed
triangle to the three side lines add up to the height. -/
theorem viviani {a b c p : P} [Fact (finrank ℝ V = 2)] (hab : dist a b = dist b c)
    (hbc : dist b c = dist c a) (hne : a ≠ b) (hp : ∃ q, Wbtw ℝ b q c ∧ Wbtw ℝ a p q) :
    Metric.infDist p (line[ℝ, b, c] : Set P) + Metric.infDist p (line[ℝ, c, a] : Set P) +
      Metric.infDist p (line[ℝ, a, b] : Set P) = √3 / 2 * dist a b := by
  sorry

/-- **Van Schooten's theorem**: for `p` on the arc `bc` of the circumcircle of an equilateral
triangle `abc` not containing `a`, `pa = pb + pc`. -/
theorem van_schooten {a b c p : P} (hab : dist a b = dist b c) (hbc : dist b c = dist c a)
    (hne : a ≠ b) (hp : Cospherical ({a, b, c, p} : Set P))
    (harc : ∃ x, Wbtw ℝ b x c ∧ Wbtw ℝ a x p) :
    dist p a = dist p b + dist p c := by
  sorry

/-- **Euler's theorem in geometry**: `OI² = R (R - 2r)`. -/
theorem Affine.Triangle.dist_circumcenter_incenter_sq (t : Affine.Triangle ℝ P) :
    dist t.circumcenter t.incenter ^ 2 = t.circumradius * (t.circumradius - 2 * t.inradius) := by
  sorry

/-- **Feuerbach's theorem**: the incircle is internally tangent to the nine-point circle, and the
nine-point circle is externally tangent to the three excircles. -/
theorem Affine.Triangle.feuerbach [Fact (finrank ℝ V = 2)] (t : Affine.Triangle ℝ P) :
    t.insphere.IsIntTangent t.ninePointCircle ∧
      ∀ i : Fin 3, t.ninePointCircle.IsExtTangent (t.exsphere {i}) := by
  sorry

/-- **Butterfly theorem.** `m` is the midpoint of the chord `pq`; the chords `ab` and `cd` pass
through `m`; `ad` and `bc` meet `pq` at `x` and `y`. Then `m` is the midpoint of `xy`. -/
theorem butterfly [Fact (finrank ℝ V = 2)] {s : Sphere P} {p q a b c d x y : P}
    (hp : p ∈ s) (hq : q ∈ s) (ha : a ∈ s) (hb : b ∈ s) (hc : c ∈ s) (hd : d ∈ s)
    (hpq : p ≠ q) (hab : Sbtw ℝ a (midpoint ℝ p q) b) (hcd : Sbtw ℝ c (midpoint ℝ p q) d)
    (hx : x ∈ line[ℝ, a, d]) (hx' : x ∈ line[ℝ, p, q])
    (hy : y ∈ line[ℝ, b, c]) (hy' : y ∈ line[ℝ, p, q]) :
    midpoint ℝ x y = midpoint ℝ p q := by
  sorry

/-- **Pitot theorem**: in a quadrilateral whose four side lines are tangent to a circle at
points of the sides, the sums of opposite sides are equal. -/
theorem pitot [Fact (finrank ℝ V = 2)] {s : Sphere P} (p t : Fin 4 → P)
    (ht : ∀ i, Wbtw ℝ (p i) (t i) (p (i + 1)))
    (htan : ∀ i, s.IsTangentAt (t i) line[ℝ, p i, p (i + 1)]) :
    dist (p 0) (p 1) + dist (p 2) (p 3) = dist (p 1) (p 2) + dist (p 3) (p 0) := by
  sorry

/-- **Euler's quadrilateral theorem**: the sum of the squares of the sides equals the sum of the
squares of the diagonals plus four times the square of the segment joining their midpoints. -/
theorem euler_quadrilateral (p : Fin 4 → P) :
    dist (p 0) (p 1) ^ 2 + dist (p 1) (p 2) ^ 2 + dist (p 2) (p 3) ^ 2 + dist (p 3) (p 0) ^ 2 =
      dist (p 0) (p 2) ^ 2 + dist (p 1) (p 3) ^ 2 +
        4 * dist (midpoint ℝ (p 0) (p 2)) (midpoint ℝ (p 1) (p 3)) ^ 2 := by
  sorry

/-- **Japanese theorem for concyclic quadrilaterals**: the incentres of the four triangles cut
out by the diagonals of a convex cyclic quadrilateral form a rectangle. The triangles are
`(p (i+1), p (i+2), p (i+3))`, omitting vertex `i`. -/
theorem japanese_quadrilateral [Fact (finrank ℝ V = 2)] (p : Fin 4 → P)
    (hcyc : Cospherical (Set.range p))
    (hconv : (∃ x, Sbtw ℝ (p 0) x (p 2) ∧ Sbtw ℝ (p 1) x (p 3)))
    (t : Fin 4 → Affine.Triangle ℝ P)
    (ht : ∀ i, (t i).points = ![p (i + 1), p (i + 2), p (i + 3)]) :
    (t 1).incenter -ᵥ (t 0).incenter = (t 2).incenter -ᵥ (t 3).incenter ∧
      ⟪(t 1).incenter -ᵥ (t 0).incenter, (t 3).incenter -ᵥ (t 0).incenter⟫ = 0 := by
  sorry

end Metric

section Oriented

variable [Fact (finrank ℝ V = 2)] [Module.Oriented ℝ V (Fin 2)]

/-- Signed area of the triangle `abc`: positive when `abc` is counterclockwise. -/
noncomputable def signedArea (a b c : P) : ℝ :=
  (1 / 2 : ℝ) * (o : Orientation ℝ V (Fin 2)).areaForm (b -ᵥ a) (c -ᵥ a)

/-- The apex of the equilateral triangle erected on the segment from `x` to `y`, on its right
(clockwise rotation of `y - x` by `π / 3` about `x`). On every side of a counterclockwise
triangle this is the outward apex. -/
noncomputable def equilateralApex (x y : P) : P :=
  (o : Orientation ℝ V (Fin 2)).rotation (-(π / 3 : ℝ)) (y -ᵥ x) +ᵥ x

/-- Centre of the equilateral triangle erected on the right of the segment from `x` to `y`. -/
noncomputable def napoleonCenter (x y : P) : P :=
  (1 / 3 : ℝ) • ((y -ᵥ x) + (equilateralApex x y -ᵥ x)) +ᵥ x

/-- **Napoleon's theorem** (outer form for counterclockwise triangles, inner form for clockwise
ones): the three centres form an equilateral triangle, for every triple of points. -/
theorem napoleon (a b c : P) :
    dist (napoleonCenter a b) (napoleonCenter b c) =
        dist (napoleonCenter b c) (napoleonCenter c a) ∧
      dist (napoleonCenter b c) (napoleonCenter c a) =
        dist (napoleonCenter c a) (napoleonCenter a b) := by
  sorry

/-- **Routh's theorem.** With `d = lineMap b c x`, `e = lineMap c a y`, `f = lineMap a b z` for
parameters in `(0, 1)`, the cevians `ad`, `be`, `cf` bound a triangle whose signed area is the
stated multiple of the signed area of `abc`. -/
theorem routh {a b c u v w : P} {x y z : ℝ} (h : AffineIndependent ℝ ![a, b, c])
    (hx : x ∈ Set.Ioo (0 : ℝ) 1) (hy : y ∈ Set.Ioo (0 : ℝ) 1) (hz : z ∈ Set.Ioo (0 : ℝ) 1)
    (hu : u ∈ line[ℝ, b, lineMap c a y] ∧ u ∈ line[ℝ, c, lineMap a b z])
    (hv : v ∈ line[ℝ, c, lineMap a b z] ∧ v ∈ line[ℝ, a, lineMap b c x])
    (hw : w ∈ line[ℝ, a, lineMap b c x] ∧ w ∈ line[ℝ, b, lineMap c a y]) :
    signedArea u v w =
      (x * y * z - (1 - x) * (1 - y) * (1 - z)) ^ 2 /
        ((1 - x + z * x) * (1 - y + x * y) * (1 - z + y * z)) * signedArea a b c := by
  sorry

end Oriented

section Projective

/-- **Pappus's hexagon theorem** in the projective plane over a field: if `a₀ a₁ a₂` lie on one
line and `b₀ b₁ b₂` on another, the six points are distinct and none of them is the common point
of the two lines, then the three cross-joins `cᵢⱼ = aᵢbⱼ ∩ aⱼbᵢ` are collinear. Collinearity is
Mathlib's `Projectivization.IsCollinear`. -/
theorem pappus {k : Type*} [Field k] {a b : Fin 3 → ℙ k (Fin 3 → k)}
    {c₀₁ c₀₂ c₁₂ : ℙ k (Fin 3 → k)}
    (ha : Projectivization.IsCollinear (Set.range a))
    (hb : Projectivization.IsCollinear (Set.range b))
    (ha' : Function.Injective a) (hb' : Function.Injective b)
    (hgen : ∀ i, ¬ Projectivization.IsCollinear (insert (b i) (Set.range a)) ∧
      ¬ Projectivization.IsCollinear (insert (a i) (Set.range b)))
    (h₀₁ : Projectivization.IsCollinear {a 0, b 1, c₀₁} ∧
      Projectivization.IsCollinear {a 1, b 0, c₀₁})
    (h₀₂ : Projectivization.IsCollinear {a 0, b 2, c₀₂} ∧
      Projectivization.IsCollinear {a 2, b 0, c₀₂})
    (h₁₂ : Projectivization.IsCollinear {a 1, b 2, c₁₂} ∧
      Projectivization.IsCollinear {a 2, b 1, c₁₂}) :
    Projectivization.IsCollinear {c₀₁, c₀₂, c₁₂} := by
  sorry

end Projective

end TauCeti.ThousandTheorems
