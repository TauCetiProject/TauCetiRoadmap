import Mathlib
import TauCeti.AlgebraicGeometry.Curves.NodalGluing.AuxiliaryMarks
import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
import TauCeti.Analysis.Complex.RiemannSurface.ComplexTorus
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic
import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Conformal

/-!
# Analytic families and moduli of complex curves: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each admitted,
and keeps a small proved prototype of the topological carrier of the node chart `xy = s(b)`.

Stated here:

* the existence of a hyperbolic metric in the conformal class of every Riemannian metric on a
  closed surface of negative Euler characteristic (README §0.4);
* the classification of compact Riemann surfaces of genus one as complex tori (README §0.3);
* pointed stability as finiteness of the automorphism group of a marked nodal curve
  (README §§0.5 and 1.2).

The Euler characteristic is Tau Ceti's `TauCeti.eulerChar` of a space of finite CW type; a
component of genus `g` has `χ = 2 − 2g`, so `2g − 2 + n > 0` reads `χ < n`.

Proved at the Tau Ceti pin and cited by the README instead of restated: the uniqueness of the
hyperbolic metric in a conformal class of a closed surface
(`TauCeti.HyperbolicMetric.eq_of_metric_eq_rescale`), the nonlinear Hardy graph theorem at a
plumbing node (`TauCeti.CircleSobolev.exists_analyticAt_hardyGraph`, README §4.3), and the
reduction of finiteness of automorphisms of a marked nodal curve to its components
(`TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff`).

Not statable at the pins, each for want of the carrier named:

* the universal unfolding of a stable curve and its universality for every restricted analytic
  nodal family, and the miniversal unfolding of a prestable curve (README §§4.1, 4.5, 4.7): there
  is no carrier of restricted analytic nodal families over a complex manifold, and no complex
  analytic space in which the node charts `xy = s(b)` live;
* compactness, Hausdorffness and second countability of the coarse moduli space of stable curves,
  properness of the chart groupoid and the finite action charts (README §§6.3–6.4): there is no
  groupoid of stable curves and their isomorphisms with a topology;
* uniformization of punctured and bordered components (README §0.4): there is no relation between
  a complex structure and the conformal class of a Riemannian metric on a punctured or bordered
  Riemann surface;
* Riemann–Roch for Cauchy–Riemann operators on line bundles and the index of the Robbin–Salamon
  operator (README §§0.2, 3.4): there are no holomorphic line bundles on a compact Riemann surface
  and no Cauchy–Riemann operators on their sections;
* the dimension `3g − 3 + n` of the first-order deformation space (README §3.3): there is no
  deformation space of a nodal curve;
* the low-genus moduli spaces of README §8.3: there is no coarse moduli space.
-/

namespace TauCetiRoadmap.ComplexCurveModuli

open Module Topology TauCeti
open scoped Manifold ContDiff

/-! ## Layer 0: smooth surfaces, compact Riemann surfaces and uniformization -/

/-- **Classification of compact Riemann surfaces of genus one** (README §0.3). A compact connected
Riemann surface of Euler characteristic zero, that is of genus one, is biholomorphic to a complex
torus `ℂ ⧸ L` for a lattice `L ⊂ ℂ`. -/
theorem exists_zlattice_nonempty_diffeomorph_of_eulerChar_eq_zero {X : Type*}
    [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X] [CompactSpace X]
    [ConnectedSpace X] [T2Space X] [FiniteCWType X] (hχ : eulerChar X = 0) :
    ∃ (L : Submodule ℤ ℂ) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
      Nonempty (X ≃ₘ⟮𝓘(ℂ), 𝓘(ℂ)⟯ AddAction.orbitRel.Quotient L ℂ) := by
  sorry

/-- **Hyperbolic metrics on closed surfaces** (README §0.4). On a closed connected surface of
negative Euler characteristic, every smooth Riemannian metric `g` is conformal to a hyperbolic
metric: there is a smooth positive function `f` and a complete metric of constant curvature `−1`
equal to `f g`. With `TauCeti.HyperbolicMetric.eq_of_metric_eq_rescale` this metric is unique. -/
theorem exists_hyperbolicMetric_metric_eq_rescale_of_eulerChar_neg
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {M : Type*} [TopologicalSpace M] [T3Space M] [PreconnectedSpace M] [CompactSpace M]
    [ChartedSpace H M] [IsManifold I ∞ M] [FiniteCWType M]
    (hE : finrank ℝ E = 2) (hχ : eulerChar M < 0)
    (g : Bundle.ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) :
    ∃ (G : HyperbolicMetric (I := I) (M := M)) (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
      (hf_pos : ∀ x, 0 < f x), G.metric = g.rescale f hf hf_pos := by
  sorry

/-! ## Layer 1: nodal curves, node rings and their isomorphisms -/

/-- **Pointed stability is finiteness of automorphisms** (README §§0.5 and 1.2). Let a marked
nodal curve have compact connected Riemann surfaces `X i` as normalization components, finitely
many node flags and finitely many marks. Its group of automorphisms fixing every mark is finite
exactly when every component is stable: `2g_i − 2 + n_i > 0`, where `n_i` counts the flag points
and marks on `X i`, that is `χ(X i) < n_i`. -/
theorem finite_ordered_iff_forall_eulerChar_lt {ι Flag : Type*} {X : ι → Type*}
    [∀ i, TopologicalSpace (X i)] [∀ i, ChartedSpace ℂ (X i)] [∀ i, IsManifold 𝓘(ℂ) ω (X i)]
    [∀ i, CompactSpace (X i)] [∀ i, ConnectedSpace (X i)] [∀ i, T2Space (X i)]
    [∀ i, FiniteCWType (X i)] [Finite ι] [Finite Flag] {N R : Type*} [Finite N] [Finite R]
    {d : NodalGluing.FlagPairData ι Flag X} (m : NodalGluing.Marking d (N ⊕ R)) :
    Finite (NodalGluing.AuxiliaryAut.ordered 𝓘(ℂ) ω m) ↔
      ∀ i, eulerChar (X i) < ((m.specialPoints i).ncard : ℤ) := by
  sorry

/-! ## Layer 2: restricted analytic nodal families and the local algebra of nodes -/

/-- The underlying points of the node chart `xy = s(b)` over a base `B`, with global coordinates
`(x, y) ∈ ℂ²`; the README's chart `N_s` is its restriction to discs. -/
abbrev NodeChart (B : Type*) [TopologicalSpace B] (s : B → ℂ) :=
  {p : B × (ℂ × ℂ) // p.2.1 * p.2.2 = s p.1}

/-- Projection of the node chart to its base. -/
def nodeProjection {B : Type*} [TopologicalSpace B] {s : B → ℂ} (p : NodeChart B s) : B :=
  p.1.1

/-- The projection of the node chart to its base is continuous. -/
theorem continuous_nodeProjection {B : Type*} [TopologicalSpace B] {s : B → ℂ} :
    Continuous (@nodeProjection B _ s) := by
  exact continuous_fst.comp continuous_subtype_val

/-- The equation defining `NodeChart` is closed when `s` is continuous (the target `ℂ` is
Hausdorff). -/
theorem isClosed_nodeEquation {B : Type*} [TopologicalSpace B]
    {s : B → ℂ} (hs : Continuous s) :
    IsClosed {p : B × (ℂ × ℂ) | p.2.1 * p.2.2 = s p.1} := by
  have hxy : Continuous (fun p : B × (ℂ × ℂ) => p.2.1 * p.2.2) :=
    (continuous_fst.comp continuous_snd).mul (continuous_snd.comp continuous_snd)
  have hbase : Continuous (fun p : B × (ℂ × ℂ) => s p.1) := hs.comp continuous_fst
  exact isClosed_eq hxy hbase

/-- The fibre of `NodeChart` over `b`, the plane curve `xy = s(b)`. -/
abbrev NodeFiber {B : Type*} [TopologicalSpace B] (s : B → ℂ) (b : B) :=
  {z : ℂ × ℂ // z.1 * z.2 = s b}

/-- The points of the node chart over `b` are the points of the plane curve `xy = s(b)`. -/
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

/-- The topological fibre product of a base map `f : C → B` with the projection of the node chart
over `B`. -/
abbrev NodePullback {B C : Type*} [TopologicalSpace B] [TopologicalSpace C]
    (s : B → ℂ) (f : C → B) :=
  {q : C × NodeChart B s // f q.1 = nodeProjection q.2}

/-- Base change of the node chart: the fibre product of a continuous `f : C → B` with the node
chart of `s` is homeomorphic to the node chart of `s ∘ f`. -/
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

/-- The first branch of the fibre over `b`: its points on the axis `y = 0`. -/
def leftNodeBranch {B : Type*} [TopologicalSpace B] {s : B → ℂ} (b : B)
    : Set (NodeFiber s b) :=
  {z | z.1.2 = 0}

/-- The second branch of the fibre over `b`: its points on the axis `x = 0`. -/
def rightNodeBranch {B : Type*} [TopologicalSpace B] {s : B → ℂ} (b : B)
    : Set (NodeFiber s b) :=
  {z | z.1.1 = 0}

/-- The set-level pullback identification is the underlying equivalence of the homeomorphism. -/
abbrev nodePullbackEquiv {B C : Type*} [TopologicalSpace B] [TopologicalSpace C]
    {s : B → ℂ} (f : C → B) (hf : Continuous f) :
    NodePullback s f ≃ NodeChart C (s ∘ f) :=
  (nodePullbackHomeomorph f hf).toEquiv

/-- Over a zero of the smoothing function, the two branches cover the fibre. -/
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

/-- The two branches meet only in the node `(0, 0)`. -/
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

/-- Compatible maps to the two legs induce a map to the topological fibre product. -/
def nodePullbackLift {B C P : Type*} [TopologicalSpace B] [TopologicalSpace C]
    {s : B → ℂ} {f : C → B} (g : P → C) (h : P → NodeChart B s)
    (comm : ∀ p, f (g p) = nodeProjection (h p)) : P → NodePullback s f :=
  fun p => ⟨(g p, h p), comm p⟩

/-- The induced map to the fibre product is continuous when its two components are. -/
theorem continuous_nodePullbackLift {B C P : Type*} [TopologicalSpace B]
    [TopologicalSpace C] [TopologicalSpace P] {s : B → ℂ} {f : C → B}
    {g : P → C} {h : P → NodeChart B s}
    (comm : ∀ p, f (g p) = nodeProjection (h p))
    (hg : Continuous g) (hh : Continuous h) :
    Continuous (nodePullbackLift g h comm) := by
  exact (hg.prodMk hh).subtype_mk _

/-- The induced map is the only map with the two given projections. -/
theorem nodePullbackLift_unique {B C P : Type*} [TopologicalSpace B] [TopologicalSpace C]
    {s : B → ℂ} {f : C → B} (g : P → C) (h : P → NodeChart B s)
    (comm : ∀ p, f (g p) = nodeProjection (h p))
    (q : P → NodePullback s f)
    (hfirst : ∀ p, (q p).1.1 = g p) (hsecond : ∀ p, (q p).1.2 = h p) :
    q = nodePullbackLift g h comm := by
  funext p
  apply Subtype.ext
  exact Prod.ext (hfirst p) (hsecond p)

/-! ## Layer 3: linear deformation theory, fractional Sobolev spaces and slices -/

/-- The Fourier coefficient sequences of `H^s` on a boundary circle: `a : ℤ → ℂ` with
`Σ_n (1 + |n|)^(2s) |a_n|² < ∞`. This is the coefficient condition of Tau Ceti's
`TauCeti.CircleSobolev s ℂ`, which carries the Hilbert space structure. -/
abbrev CircleSobolevCoefficients (s : ℝ) :=
  {a : ℤ → ℂ // Summable (fun n : ℤ =>
    Real.rpow (1 + |(n : ℝ)|) (2 * s) * Complex.normSq (a n))}

end TauCetiRoadmap.ComplexCurveModuli
