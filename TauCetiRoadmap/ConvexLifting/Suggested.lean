import Mathlib

/-!
# Exact lifting and matched finite outer approximations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs; every headline theorem is statable at the pins.
These are suggested forms, not an exhaustive checklist. The markdown remains definitive.
-/

noncomputable section
open scoped BigOperators
open Set

namespace TauCetiRoadmap.ConvexLifting

/-! ## Layer 1: exact composition lifts -/

section Exact
variable {X Y : Type*} [Preorder Y]

/-- Points in the original domain satisfying the composed inequality. -/
def originalSet (D : Set X) (g : X → Y) (h : Y → ℝ) (b : ℝ) : Set X :=
  {x | x ∈ D ∧ h (g x) ≤ b}

/-- Admissible upper heights satisfying the outer budget, with the original domain retained. -/
def liftedSet (D : Set X) (E : Set Y) (g : X → Y) (h : Y → ℝ)
    (b : ℝ) : Set (X × Y) :=
  {p | p.1 ∈ D ∧ p.2 ∈ E ∧ g p.1 ≤ p.2 ∧ h p.2 ≤ b}

variable (D : Set X) (E : Set Y) (g : X → Y) (h : Y → ℝ) (b : ℝ)
    (hg : MapsTo g D E) (hm : MonotoneOn h E)
include hg hm

/-- Exact projection, using the canonical graph point for the reverse inclusion. -/
theorem projection_eq :
    Prod.fst '' liftedSet D E g h b = originalSet D g h b := by
  sorry

/-- Feasibility is explicit: `IsMinOn` alone does not include membership. -/
theorem feasible_minimum_iff (f : X → ℝ) (p : X × Y) :
    (p ∈ liftedSet D E g h b ∧ IsMinOn (f ∘ Prod.fst) (liftedSet D E g h b) p) ↔
      p ∈ liftedSet D E g h b ∧ p.1 ∈ originalSet D g h b ∧
        IsMinOn f (originalSet D g h b) p.1 := by
  sorry

/-- Existence of an attained feasible minimum transfers, without assuming it exists. -/
theorem attainment_iff (f : X → ℝ) :
    (∃ p ∈ liftedSet D E g h b, IsMinOn (f ∘ Prod.fst) (liftedSet D E g h b) p) ↔
      ∃ x ∈ originalSet D g h b, IsMinOn f (originalSet D g h b) x := by
  sorry

end Exact

/-! ## Layer 2: finite model formulations

Only the second coordinate block is integral; new argument and height coordinates
are appended to the first, continuous block. -/
/-- Continuous coordinates paired with real coordinates on which integrality can be imposed. -/
abbrev Point (n m : ℕ) := (Fin n → ℝ) × (Fin m → ℝ)

/-- Finite nonlinear residuals, affine rows, a linear objective, and bounds for integer coordinates. -/
structure FiniteModel (n m l r : ℕ) where
  g : Fin l → Point n m → ℝ
  A : Fin r → Fin n → ℝ
  B : Fin r → Fin m → ℝ
  rhs : Fin r → ℝ
  c1 : Fin n → ℝ
  c2 : Fin m → ℝ
  lo : Fin m → ℝ
  hi : Fin m → ℝ

/-- Forget the appended continuous coordinates and retain the original integer block. -/
def project {n m q : ℕ} (z : Point (n + q) m) : Point n m :=
  (fun i => z.1 (i.castAdd q), z.2)

/-- Read the appended continuous argument or height coordinates. -/
def height {n m q : ℕ} (z : Point (n + q) m) : Fin q → ℝ :=
  fun j => z.1 (j.natAdd n)

/-- An affine expression in the original continuous and integer coordinates. -/
def affineArgument {n m : ℕ} (a : Fin n → ℝ) (b : Fin m → ℝ)
    (offset : ℝ) (x : Point n m) : ℝ :=
  (∑ i, a i * x.1 i) + (∑ j, b j * x.2 j) + offset

namespace FiniteModel
variable {n m l r q : ℕ}

/-- The linear objective in the two original coordinate blocks. -/
def objective (d : FiniteModel n m l r) (x : Point n m) : ℝ :=
  (∑ i, d.c1 i * x.1 i) + ∑ j, d.c2 j * x.2 j

/-- Domain, nonlinear and affine feasibility with bounded integral second coordinates. -/
def feasibleOn (d : FiniteModel n m l r) (D : Set (Point n m)) : Set (Point n m) :=
  {x | x ∈ D ∧ (∀ j, d.g j x ≤ 0) ∧
    (∀ k, (∑ i, d.A k i * x.1 i) + (∑ j, d.B k j * x.2 j) ≤ d.rhs k) ∧
    ∃ y : Fin m → ℤ, (∀ j, d.lo j ≤ (y j : ℝ) ∧ (y j : ℝ) ≤ d.hi j) ∧
      x.2 = fun j => (y j : ℝ)}

/-- The same rows and bounds with real second coordinates. -/
def relaxationOn (d : FiniteModel n m l r) (D : Set (Point n m)) : Set (Point n m) :=
  {x | x ∈ D ∧ (∀ j, d.g j x ≤ 0) ∧
    (∀ k, (∑ i, d.A k i * x.1 i) + (∑ j, d.B k j * x.2 j) ≤ d.rhs k) ∧
    ∀ j, d.lo j ≤ x.2 j ∧ x.2 j ≤ d.hi j}

/-- Component residuals use zero aggregate budgets. Original affine rows,
integer bounds and objective are retained; new continuous heights are free. -/
def separableLift (d : FiniteModel n m l r)
    (component : Fin q → Point n m → ℝ) (weight : Fin l → Fin q → ℝ) :
    FiniteModel (n + q) m q (r + l) where
  g := fun j z => component j (project z) - height z j
  A := Fin.addCases (fun i => Fin.addCases (d.A i) (fun _ => 0))
    (fun i => Fin.addCases (fun _ => 0) (weight i))
  B := Fin.addCases d.B (fun _ _ => 0)
  rhs := Fin.addCases d.rhs (fun _ => 0)
  c1 := Fin.addCases d.c1 (fun _ => 0)
  c2 := d.c2
  lo := d.lo
  hi := d.hi

/-- Two opposite affine inequalities impose each argument equality. -/
def normalizedLift (d : FiniteModel n m l r)
    (a : Fin q → Fin n → ℝ) (b : Fin q → Fin m → ℝ) (offset : Fin q → ℝ)
    (phi : Fin q → ℝ → ℝ) (weight : Fin l → Fin q → ℝ) :
    FiniteModel (n + q) m l (r + (q + q)) where
  g := fun i z => ∑ j, weight i j * phi j (height z j)
  A := Fin.addCases (fun i => Fin.addCases (d.A i) (fun _ => 0))
    (Fin.addCases (fun j => Fin.addCases (-a j) (Pi.single j 1))
      (fun j => Fin.addCases (a j) (Pi.single j (-1))))
  B := Fin.addCases d.B (Fin.addCases (fun j => -b j) b)
  rhs := Fin.addCases d.rhs (Fin.addCases offset (-offset))
  c1 := Fin.addCases d.c1 (fun _ => 0)
  c2 := d.c2
  lo := d.lo
  hi := d.hi

/-- Mixed-integer feasible points project exactly under nonnegative weights. -/
theorem separable_projection (d : FiniteModel n m l r) (D : Set (Point n m))
    (component : Fin q → Point n m → ℝ) (weight : Fin l → Fin q → ℝ)
    (hw : ∀ i j, 0 ≤ weight i j)
    (hg : ∀ i x, d.g i x = ∑ j, weight i j * component j x) :
    project '' (d.separableLift component weight).feasibleOn (project ⁻¹' D) =
      d.feasibleOn D := by
  sorry

/-- A separate projection statement for the continuous relaxation. -/
theorem separable_relaxation_projection (d : FiniteModel n m l r) (D : Set (Point n m))
    (component : Fin q → Point n m → ℝ) (weight : Fin l → Fin q → ℝ)
    (hw : ∀ i j, 0 ≤ weight i j)
    (hg : ∀ i x, d.g i x = ∑ j, weight i j * component j x) :
    project '' (d.separableLift component weight).relaxationOn (project ⁻¹' D) =
      d.relaxationOn D := by
  sorry

/-- Heights carry zero objective coefficients and preserve feasible minima. -/
theorem separable_minimum_iff (d : FiniteModel n m l r) (D : Set (Point n m))
    (component : Fin q → Point n m → ℝ) (weight : Fin l → Fin q → ℝ)
    (hw : ∀ i j, 0 ≤ weight i j)
    (hg : ∀ i x, d.g i x = ∑ j, weight i j * component j x) (z : Point (n + q) m) :
    (z ∈ (d.separableLift component weight).feasibleOn (project ⁻¹' D) ∧
      IsMinOn (d.separableLift component weight).objective
        ((d.separableLift component weight).feasibleOn (project ⁻¹' D)) z) ↔
      z ∈ (d.separableLift component weight).feasibleOn (project ⁻¹' D) ∧
        project z ∈ d.feasibleOn D ∧ IsMinOn d.objective (d.feasibleOn D) (project z) := by
  sorry

/-- Affine normalization is exact substitution and does not need positive weights. -/
theorem normalization_projection (d : FiniteModel n m l r) (D : Set (Point n m))
    (a : Fin q → Fin n → ℝ) (b : Fin q → Fin m → ℝ) (offset : Fin q → ℝ)
    (phi : Fin q → ℝ → ℝ) (weight : Fin l → Fin q → ℝ)
    (hg : ∀ i x, d.g i x = ∑ j, weight i j *
      phi j (affineArgument (a j) (b j) (offset j) x)) :
    project '' (d.normalizedLift a b offset phi weight).feasibleOn (project ⁻¹' D) =
      d.feasibleOn D := by
  sorry

/-- Normalization also preserves the continuous relaxation exactly. -/
theorem normalization_relaxation_projection (d : FiniteModel n m l r) (D : Set (Point n m))
    (a : Fin q → Fin n → ℝ) (b : Fin q → Fin m → ℝ) (offset : Fin q → ℝ)
    (phi : Fin q → ℝ → ℝ) (weight : Fin l → Fin q → ℝ)
    (hg : ∀ i x, d.g i x = ∑ j, weight i j *
      phi j (affineArgument (a j) (b j) (offset j) x)) :
    project '' (d.normalizedLift a b offset phi weight).relaxationOn (project ⁻¹' D) =
      d.relaxationOn D := by
  sorry

/-- The normalized problem uses the original objective after projection. -/
theorem normalization_minimum_iff (d : FiniteModel n m l r) (D : Set (Point n m))
    (a : Fin q → Fin n → ℝ) (b : Fin q → Fin m → ℝ) (offset : Fin q → ℝ)
    (phi : Fin q → ℝ → ℝ) (weight : Fin l → Fin q → ℝ)
    (hg : ∀ i x, d.g i x = ∑ j, weight i j *
      phi j (affineArgument (a j) (b j) (offset j) x)) (z : Point (n + q) m) :
    (z ∈ (d.normalizedLift a b offset phi weight).feasibleOn (project ⁻¹' D) ∧
      IsMinOn (d.normalizedLift a b offset phi weight).objective
        ((d.normalizedLift a b offset phi weight).feasibleOn (project ⁻¹' D)) z) ↔
      z ∈ (d.normalizedLift a b offset phi weight).feasibleOn (project ⁻¹' D) ∧
        project z ∈ d.feasibleOn D ∧ IsMinOn d.objective (d.feasibleOn D) (project z) := by
  sorry

end FiniteModel

/-! ## Layer 3: matched actual-derivative approximations -/

section Approximation
variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X] {p k : ℕ}

/-- The affine component row formed from inner values and the supplied linear derivative. -/
def componentRow (g : X → Fin p → ℝ) (a : X) (Dg : X →L[ℝ] (Fin p → ℝ))
    (x : X) : Fin p → ℝ := g a + Dg (x - a)

/-- The outer affine row at the image of the same anchor. -/
def outerRow (g : X → Fin p → ℝ) (h : (Fin p → ℝ) → ℝ) (a : X)
    (Dh : (Fin p → ℝ) →L[ℝ] ℝ) (y : Fin p → ℝ) : ℝ :=
  h (g a) + Dh (y - g a)

/-- The composed affine row using continuous-linear-map composition. -/
def directRow (g : X → Fin p → ℝ) (h : (Fin p → ℝ) → ℝ) (a : X)
    (Dg : X →L[ℝ] (Fin p → ℝ)) (Dh : (Fin p → ℝ) →L[ℝ] ℝ) (x : X) : ℝ :=
  h (g a) + (Dh.comp Dg) (x - a)

/-- Original-domain points satisfying every direct row at the common anchors. -/
def directOA (D : Set X) (g : X → Fin p → ℝ) (h : (Fin p → ℝ) → ℝ)
    (a : Fin k → X) (Dg : Fin k → X →L[ℝ] (Fin p → ℝ))
    (Dh : Fin k → (Fin p → ℝ) →L[ℝ] ℝ) (b : ℝ) : Set X :=
  {x | x ∈ D ∧ ∀ i, directRow g h (a i) (Dg i) (Dh i) x ≤ b}

/-- One admissible height vector satisfying all component and outer rows. -/
def sharedOA (D : Set X) (E : Set (Fin p → ℝ)) (g : X → Fin p → ℝ)
    (h : (Fin p → ℝ) → ℝ) (a : Fin k → X)
    (Dg : Fin k → X →L[ℝ] (Fin p → ℝ)) (Dh : Fin k → (Fin p → ℝ) →L[ℝ] ℝ)
    (b : ℝ) : Set (X × (Fin p → ℝ)) :=
  {z | z.1 ∈ D ∧ z.2 ∈ E ∧ ∀ i,
    componentRow g (a i) (Dg i) z.1 ≤ z.2 ∧ outerRow g h (a i) (Dh i) z.2 ≤ b}

/-- Restricted outer domains retain component convexity, anchor membership,
actual derivatives, and monotonicity of each outer linear derivative. -/
theorem analytic_comparison (D : Set X) (E : Set (Fin p → ℝ)) (g : X → Fin p → ℝ)
    (h : (Fin p → ℝ) → ℝ) (a : Fin k → X)
    (Dg : Fin k → X →L[ℝ] (Fin p → ℝ)) (Dh : Fin k → (Fin p → ℝ) →L[ℝ] ℝ)
    (b : ℝ) (hgE : MapsTo g D E)
    (hc : ∀ j, ConvexOn ℝ D (fun x => g x j)) (hhc : ConvexOn ℝ E h)
    (ha : ∀ i, a i ∈ D) (hg : ∀ i, HasFDerivAt g (Dg i) (a i))
    (hh : ∀ i, HasFDerivAt h (Dh i) (g (a i))) (hD : ∀ i, Monotone (Dh i)) :
    originalSet D g h b ⊆ Prod.fst '' sharedOA D E g h a Dg Dh b ∧
      Prod.fst '' sharedOA D E g h a Dg Dh b ⊆ directOA D g h a Dg Dh b := by
  sorry

/-- Full-space monotonicity supplies the outer derivative condition for both weak containments. -/
theorem fullspace_analytic_comparison (D : Set X) (g : X → Fin p → ℝ)
    (h : (Fin p → ℝ) → ℝ) (a : Fin k → X)
    (Dg : Fin k → X →L[ℝ] (Fin p → ℝ)) (Dh : Fin k → (Fin p → ℝ) →L[ℝ] ℝ)
    (b : ℝ) (hm : Monotone h) (hc : ∀ j, ConvexOn ℝ D (fun x => g x j))
    (hhc : ConvexOn ℝ Set.univ h) (ha : ∀ i, a i ∈ D)
    (hg : ∀ i, HasFDerivAt g (Dg i) (a i))
    (hh : ∀ i, HasFDerivAt h (Dh i) (g (a i))) :
    originalSet D g h b ⊆ Prod.fst '' sharedOA D Set.univ g h a Dg Dh b ∧
      Prod.fst '' sharedOA D Set.univ g h a Dg Dh b ⊆ directOA D g h a Dg Dh b := by
  sorry

end Approximation

/-! ## Layer 4: finite support elimination -/

section FiniteRows
variable {X I : Type*} {p k : ℕ}

/-- One free height per component dominating its finite support rows and satisfying a sum budget. -/
def sharedRows (D : Set X) (row : Fin p → I → X → ℝ)
    (H : Fin p → Finset I) (b : ℝ) : Set (X × (Fin p → ℝ)) :=
  {z | z.1 ∈ D ∧ (∀ j, ∀ i ∈ H j, row j i z.1 ≤ z.2 j) ∧ ∑ j, z.2 j ≤ b}

/-- Separate free height vectors for each anchor, with a separate sum budget at each anchor. -/
def independentRows (D : Set X) (row : Fin k → Fin p → X → ℝ)
    (b : Fin k → ℝ) : Set (X × (Fin k → Fin p → ℝ)) :=
  {z | z.1 ∈ D ∧ ∀ a, (∀ j, row a j z.1 ≤ z.2 a j) ∧ ∑ j, z.2 a j ≤ b a}

/-- Free shared heights are eliminated by attained component maxima, equivalently
by every mixed choice of one support row per component. -/
theorem shared_rows_projection (D : Set X) (row : Fin p → I → X → ℝ)
    (H : Fin p → Finset I) (hne : ∀ j, (H j).Nonempty) (b : ℝ) (x : X) :
    ((∃ y, (x, y) ∈ sharedRows D row H b) ↔
      x ∈ D ∧ (∑ j, (H j).sup' (hne j) (fun i => row j i x)) ≤ b) ∧
    ((∃ y, (x, y) ∈ sharedRows D row H b) ↔
      x ∈ D ∧ ∀ choice : Fin p → I, (∀ j, choice j ∈ H j) →
        (∑ j, row j (choice j) x) ≤ b) := by
  sorry

/-- Independent free height vectors retain only the same-anchor sum rows. -/
theorem independent_rows_projection (D : Set X) (row : Fin k → Fin p → X → ℝ)
    (b : Fin k → ℝ) (x : X) :
    (∃ y, (x, y) ∈ independentRows D row b) ↔
      x ∈ D ∧ ∀ a, (∑ j, row a j x) ≤ b a := by
  sorry

end FiniteRows
end TauCetiRoadmap.ConvexLifting
