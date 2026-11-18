import Mathlib
import TauCeti.Analysis.Complex.RiemannSurface.Degree

/-!
This file suggests forms for the roadmap in this directory. The README is definitive, and this
file is not an exhaustive checklist.

The small prototype below constructs only the topological hypersurface carrier for one node
function on global ℂ² coordinates (disc restriction remains a target). It does not define an analytic space, holomorphic structure sheaf, flat family, or nodal
curve. Those remain README targets. The Fourier coefficient subtype has no asserted Hilbert
instance.
-/

namespace TauCeti.ComplexCurveModuli

open Topology

/-- The underlying points of the local topological hypersurface `xy = s(b)`. -/
abbrev NodeChart (B : Type*) [TopologicalSpace B] (s : B → ℂ) :=
  {p : B × (ℂ × ℂ) // p.2.1 * p.2.2 = s p.1}

/-- Projection of the hypersurface to its base. -/
def nodeProjection {B : Type*} [TopologicalSpace B] {s : B → ℂ} (p : NodeChart B s) : B :=
  p.1.1

theorem continuous_nodeProjection {B : Type*} [TopologicalSpace B] {s : B → ℂ} :
    Continuous (@nodeProjection B _ s) := by
  exact continuous_fst.comp continuous_subtype_val

/-- The equation defining `NodeChart` is closed when `s` is continuous (the target `ℂ` is Hausdorff). -/
theorem isClosed_nodeEquation {B : Type*} [TopologicalSpace B]
    {s : B → ℂ} (hs : Continuous s) :
    IsClosed {p : B × (ℂ × ℂ) | p.2.1 * p.2.2 = s p.1} := by
  have hxy : Continuous (fun p : B × (ℂ × ℂ) => p.2.1 * p.2.2) :=
    (continuous_fst.comp continuous_snd).mul (continuous_snd.comp continuous_snd)
  have hbase : Continuous (fun p : B × (ℂ × ℂ) => s p.1) := hs.comp continuous_fst
  exact isClosed_eq hxy hbase

/-- The fiber of `NodeChart` over `b`, expressed as a subset of the coordinate plane. -/
abbrev NodeFiber {B : Type*} [TopologicalSpace B] (s : B → ℂ) (b : B) :=
  {z : ℂ × ℂ // z.1 * z.2 = s b}

def nodeFiberEquiv {B : Type*} [TopologicalSpace B] {s : B → ℂ} (b : B) :
    {p : NodeChart B s // nodeProjection p = b} ≃ NodeFiber s b where
  toFun p := by
    rcases p with ⟨⟨⟨b', z⟩, hz⟩, hp⟩
    change b' = b at hp
    subst b'
    exact ⟨z, hz⟩
  invFun z := ⟨⟨(b, z.1), z.2⟩, rfl⟩
  left_inv p := by
    rcases p with ⟨⟨⟨b', z⟩, hz⟩, hp⟩
    change b' = b at hp
    subst b'
    rfl
  right_inv z := by cases z; rfl

/-- The pullback carrier along `f` is the usual node equation for `s ∘ f`. -/
abbrev NodePullback {B C : Type*} [TopologicalSpace B] [TopologicalSpace C]
    (s : B → ℂ) (f : C → B) :=
  {q : C × NodeChart B s // f q.1 = nodeProjection q.2}

/-- Continuous pullback-base-change identification of the hypersurface carriers. -/
def nodePullbackHomeomorph {B C : Type*} [TopologicalSpace B] [TopologicalSpace C]
    {s : B → ℂ} (f : C → B) (hf : Continuous f) :
    NodePullback s f ≃ₜ NodeChart C (s ∘ f) where
  toFun q := ⟨(q.1.1, q.1.2.1.2), by
    have hb : f q.1.1 = q.1.2.1.1 := by simpa [nodeProjection] using q.2
    have hz := q.1.2.2
    rw [← hb] at hz
    exact hz⟩
  invFun p := ⟨(p.1.1, ⟨(f p.1.1, p.1.2), by simpa using p.2⟩), rfl⟩
  left_inv q := by
    rcases q with ⟨⟨c, p⟩, h⟩
    rcases p with ⟨⟨b, z⟩, hz⟩
    change f c = b at h
    subst b
    rfl
  right_inv p := by apply Subtype.ext; rfl
  continuous_toFun := by fun_prop
  continuous_invFun := by fun_prop

/-- The two nodal branches in the central fiber are the coordinate axes. -/
def leftNodeBranch {B : Type*} [TopologicalSpace B] {s : B → ℂ} (b : B)
    : Set (NodeFiber s b) :=
  {z | z.1.2 = 0}

def rightNodeBranch {B : Type*} [TopologicalSpace B] {s : B → ℂ} (b : B)
    : Set (NodeFiber s b) :=
  {z | z.1.1 = 0}

/-- The set-level pullback identification is the underlying equivalence of the homeomorphism. -/
abbrev nodePullbackEquiv {B C : Type*} [TopologicalSpace B] [TopologicalSpace C]
    {s : B → ℂ} (f : C → B) (hf : Continuous f) :
    NodePullback s f ≃ NodeChart C (s ∘ f) :=
  (nodePullbackHomeomorph f hf).toEquiv

/-- At an actual zero of the smoothing function, the two branches cover the fibre. -/
theorem centralNodeBranches_cover {B : Type*} [TopologicalSpace B] {s : B → ℂ}
    (b : B) (hs : s b = 0) :
    leftNodeBranch (s := s) b ∪ rightNodeBranch (s := s) b = Set.univ := by
  ext z
  simp only [Set.mem_union, leftNodeBranch, rightNodeBranch, Set.mem_ofPred_eq,
    Set.mem_univ, iff_true]
  have hz : z.1.1 * z.1.2 = 0 := z.2.trans hs
  rcases mul_eq_zero.mp hz with hx | hy
  · exact Or.inr hx
  · exact Or.inl hy

/-- The branch intersection has only the nodal coordinate pair, rather than an extra component. -/
theorem centralNodeBranches_inter {B : Type*} [TopologicalSpace B] {s : B → ℂ}
    (b : B) :
    leftNodeBranch (s := s) b ∩ rightNodeBranch (s := s) b =
      {z : NodeFiber s b | z.1 = (0, 0)} := by
  ext z
  change (z.1.2 = 0 ∧ z.1.1 = 0) ↔ z.1 = (0, 0)
  constructor
  · rintro ⟨hy, hx⟩
    exact Prod.ext hx hy
  · intro h
    constructor
    · exact congrArg Prod.snd h
    · exact congrArg Prod.fst h

/-- Actual compatible maps to the two legs induce a map to the topological fibre product. -/
def nodePullbackLift {B C P : Type*} [TopologicalSpace B] [TopologicalSpace C]
    {s : B → ℂ} {f : C → B} (g : P → C) (h : P → NodeChart B s)
    (comm : ∀ p, f (g p) = nodeProjection (h p)) : P → NodePullback s f :=
  fun p => ⟨(g p, h p), comm p⟩

/-- Continuity is preserved by the genuine topological fibre-product lift. -/
theorem continuous_nodePullbackLift {B C P : Type*} [TopologicalSpace B]
    [TopologicalSpace C] [TopologicalSpace P] {s : B → ℂ} {f : C → B}
    {g : P → C} {h : P → NodeChart B s}
    (comm : ∀ p, f (g p) = nodeProjection (h p))
    (hg : Continuous g) (hh : Continuous h) :
    Continuous (nodePullbackLift g h comm) := by
  exact (hg.prodMk hh).subtype_mk _

/-- The induced map is uniquely determined by its two actual projections. -/
theorem nodePullbackLift_unique {B C P : Type*} [TopologicalSpace B] [TopologicalSpace C]
    {s : B → ℂ} {f : C → B} (g : P → C) (h : P → NodeChart B s)
    (comm : ∀ p, f (g p) = nodeProjection (h p))
    (q : P → NodePullback s f)
    (hfirst : ∀ p, (q p).1.1 = g p) (hsecond : ∀ p, (q p).1.2 = h p) :
    q = nodePullbackLift g h comm := by
  funext p
  apply Subtype.ext
  exact Prod.ext (hfirst p) (hsecond p)

/-- A genuine Fourier coefficient carrier; its weighted Hilbert topology is a README target.
No analytic family or Hardy submanifold is asserted by this subtype. -/
abbrev CircleSobolevCoefficients (s : ℝ) :=
  {a : ℤ → ℂ // Summable (fun n : ℤ =>
    Real.rpow (1 + |(n : ℝ)|) (2 * s) * Complex.normSq (a n))}

end TauCeti.ComplexCurveModuli

#print axioms TauCeti.ComplexCurveModuli.continuous_nodeProjection
#print axioms TauCeti.ComplexCurveModuli.isClosed_nodeEquation
#print axioms TauCeti.ComplexCurveModuli.nodeFiberEquiv
#print axioms TauCeti.ComplexCurveModuli.nodePullbackHomeomorph
#print axioms TauCeti.ComplexCurveModuli.centralNodeBranches_cover
#print axioms TauCeti.ComplexCurveModuli.centralNodeBranches_inter
#print axioms TauCeti.ComplexCurveModuli.continuous_nodePullbackLift
#print axioms TauCeti.ComplexCurveModuli.nodePullbackLift_unique
