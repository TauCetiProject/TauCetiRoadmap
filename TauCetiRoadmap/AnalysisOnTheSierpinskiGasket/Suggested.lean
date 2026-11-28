import Mathlib

/-!
# Analysis on the Sierpiński gasket: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the few definitions they
need, every one with a real body. The gasket is an attractor `K` of the Sierpiński system of the
three maps `x ↦ midpoint (pᵢ, x)` of the plane, built on the iterated function systems of
FractalGeometry 1.1 (whose structure and attractor predicate are copied verbatim below). The
level-`m` graph is the finite set `vertices m` of images of the three corners under words of
length `m`, with the edge set `edges m` of sides of level-`m` cells; it is turned into a network,
in the sense of ElectricalNetworksAndRandomWalks 1.1, with conductance `(5/3)^m` on every edge
(that structure, its Laplacian, Dirichlet energy and effective resistance are copied verbatim
below). Functions are real functions on the plane; only their values on the vertices, or on `K`,
enter the statements. Every headline theorem of the README's summary is statable at the pins and
is stated here.
-/

noncomputable section

open MeasureTheory Filter Set
open scoped ENNReal NNReal Topology Matrix

namespace TauCetiRoadmap.AnalysisOnTheSierpinskiGasket

/-! ## Layer 1: The gasket and its approximating graphs -/

/-- 1.1 (copied verbatim from FractalGeometry 1.1): an iterated function system on a metric
space `X` indexed by `ι`: a family of maps `toFun i : X → X` together with a Lipschitz bound
`ratio i ∈ (0, 1)` for each of them. -/
structure IFS (ι : Type*) (X : Type*) [MetricSpace X] where
  /-- The maps of the system. -/
  toFun : ι → X → X
  /-- The prescribed contraction ratios. -/
  ratio : ι → ℝ≥0
  /-- Every ratio is positive. -/
  ratio_pos : ∀ i, 0 < ratio i
  /-- Every ratio is less than one. -/
  ratio_lt_one : ∀ i, ratio i < 1
  /-- Each map is Lipschitz with its prescribed ratio. -/
  lipschitz : ∀ i, LipschitzWith (ratio i) (toFun i)

namespace IFS

variable {ι : Type*} {X : Type*} [MetricSpace X]

/-- 1.1 (copied verbatim from FractalGeometry 1.1): an iterated function system is used as the
family of its maps. -/
instance : CoeFun (IFS ι X) fun _ => ι → X → X := ⟨IFS.toFun⟩

/-- 1.1 (copied verbatim from FractalGeometry 1.1): an attractor of `F` is a nonempty compact
set `K` with `⋃ i, F i '' K = K`. -/
def IsAttractor (F : IFS ι X) (K : Set X) : Prop :=
  IsCompact K ∧ K.Nonempty ∧ ⋃ i, F i '' K = K

end IFS

/-- 1.1 The Euclidean plane. -/
abbrev Plane := EuclideanSpace ℝ (Fin 2)

/-- 1.1 The corners `p₀ = (0, 0)`, `p₁ = (1, 0)`, `p₂ = (1/2, √3/2)` of the unit equilateral
triangle; they form the boundary `V₀` of the gasket. -/
def corner : Fin 3 → Plane := ![!₂[0, 0], !₂[1, 0], !₂[1 / 2, √3 / 2]]

/-- 1.1 The contraction `Fᵢ x = midpoint (pᵢ, x)` of ratio `1/2` towards the corner `pᵢ`. -/
def cellMap (i : Fin 3) (x : Plane) : Plane := midpoint ℝ (corner i) x

/-- 1.1 The Sierpiński system: the three maps `Fᵢ`, each with ratio `1/2`. -/
def sierpinskiIFS : IFS (Fin 3) Plane where
  toFun := cellMap
  ratio := fun _ => 1 / 2
  ratio_pos := fun _ => by norm_num
  ratio_lt_one := fun _ => by
    rw [← NNReal.coe_lt_coe]
    norm_num
  lipschitz := fun i => LipschitzWith.of_dist_le_mul fun x y => by
    have h := dist_midpoint_midpoint_le (corner i) x (corner i) y
    simp only [dist_self, zero_add] at h
    simp only [cellMap, NNReal.coe_div, NNReal.coe_one, NNReal.coe_ofNat]
    linarith

/-- 1.1 The map `F_w = F_{w 0} ∘ ⋯ ∘ F_{w (m - 1)}` of a word `w` of length `m`; the first
letter is applied last, and the empty word gives the identity. -/
def wordMap : (m : ℕ) → (Fin m → Fin 3) → Plane → Plane
  | 0, _ => id
  | m + 1, w => cellMap (w 0) ∘ wordMap m (Fin.tail w)

open Classical in
/-- 1.1 The vertex set `V_m`: the images `F_w pᵢ` of the corners under the words of length `m`.
A junction point, the image of two different pairs `(w, i)`, is one point of this set. -/
def vertices (m : ℕ) : Finset Plane :=
  Finset.univ.image fun p : (Fin m → Fin 3) × Fin 3 => wordMap m p.1 (corner p.2)

open Classical in
/-- 1.1 The edge set of the level-`m` graph: the three sides `{F_w pᵢ, F_w pᵢ₊₁}` of every
level-`m` cell, as unordered pairs of points, so that every edge appears once. -/
def edges (m : ℕ) : Finset (Sym2 Plane) :=
  Finset.univ.image fun p : (Fin m → Fin 3) × Fin 3 =>
    s(wordMap m p.1 (corner p.2), wordMap m p.1 (corner (p.2 + 1)))

/-- 1.1 The set `V_* = ⋃ₘ V_m` of all vertices. -/
def vertexSet : Set Plane := ⋃ m, (vertices m : Set Plane)

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) A network on `V`: a symmetric
nonnegative conductance function. Loops `cond x x` are allowed; a pair `x ≠ y` with
`cond x y = 0` is not an edge. -/
structure Network (V : Type*) where
  /-- The conductance `c(x, y)` between `x` and `y`. -/
  cond : V → V → ℝ
  /-- Conductances are symmetric. -/
  symm : ∀ x y, cond x y = cond y x
  /-- Conductances are nonnegative. -/
  nonneg : ∀ x y, 0 ≤ cond x y

namespace Network

variable {V : Type*} [Fintype V] (N : Network V)

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The weight
`c(x) = ∑ y, c(x, y)` of a vertex, a loop counted once. -/
def weight (x : V) : ℝ := ∑ y, N.cond x y

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The graph of the network:
`x` and `y` are adjacent when `x ≠ y` and `0 < c(x, y)`. -/
def graph : SimpleGraph V := SimpleGraph.fromRel fun x y => 0 < N.cond x y

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 1.2) `f` is harmonic at `x`:
`∑ y, c(x, y) (f y − f x) = 0`, that is, `f x` is the average of `f` over one step of the walk
when `c(x) > 0`. -/
def IsHarmonicAt (f : V → ℝ) (x : V) : Prop := ∑ y, N.cond x y * (f y - f x) = 0

variable [DecidableEq V]

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian
`diag(c(x)) − (c(x, y))`. Loops cancel on the diagonal. -/
def laplacian : Matrix V V ℝ := Matrix.diagonal N.weight - Matrix.of N.cond

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian with the row
and column of `z` deleted. -/
def groundedLaplacian (z : V) : Matrix {x // x ≠ z} {x // x ≠ z} ℝ :=
  N.laplacian.submatrix Subtype.val Subtype.val

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The voltage of the unit
current from `a` to `z`, grounded at `z`: the column of `a` of the inverse of the grounded
Laplacian, extended by `0` at `z`; it is `0` when `a = z`. -/
def voltage (a z : V) (x : V) : ℝ :=
  if ha : a = z then 0 else if hx : x = z then 0 else (N.groundedLaplacian z)⁻¹ ⟨x, hx⟩ ⟨a, ha⟩

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The effective resistance
`R(a ↔ z)`: the voltage at `a` of the unit current from `a` to `z`. -/
def effResistance (a z : V) : ℝ := N.voltage a z a

/-- 1.3 (copied verbatim from ElectricalNetworksAndRandomWalks 2.2) The Dirichlet energy
`½ ∑ x, ∑ y, c(x, y) (f x − f y)²`, each edge counted once. -/
def dirichletEnergy (f : V → ℝ) : ℝ := (1 / 2) * ∑ x, ∑ y, N.cond x y * (f x - f y) ^ 2

end Network

open Classical in
/-- 1.3 The level-`m` network on `V_m`: conductance `(5/3)^m` on every edge of `edges m`, and `0`
on every other pair. -/
def levelNetwork (m : ℕ) : Network (vertices m) where
  cond x y := if s(x.1, y.1) ∈ edges m then (5 / 3 : ℝ) ^ m else 0
  symm x y := by rw [Sym2.eq_swap]
  nonneg x y := by split_ifs <;> positivity

/-- 1.3 Every level graph is connected. -/
theorem connected_levelNetwork (m : ℕ) : (levelNetwork m).graph.Connected := by
  sorry

/-- 1.2 The vertices are dense in the gasket: for every attractor `K` of the Sierpiński system,
`K` is the closure of `V_*`. -/
theorem closure_vertexSet {K : Set Plane} (hK : sierpinskiIFS.IsAttractor K) :
    closure vertexSet = K := by
  sorry

/-! ## Layer 2: Renormalised energies and harmonic extension -/

/-- 2.1 The renormalised energy `E_m(f) = (5/3)^m ∑_{x ∼_m y} (f x − f y)²` of the values of `f`
on `V_m`: the Dirichlet energy of the level-`m` network. -/
def energy (m : ℕ) (f : Plane → ℝ) : ℝ := (levelNetwork m).dirichletEnergy fun x => f x

/-- 2.2 **Renormalisation.** Among the functions that agree with `f` on `V_m`, the least level
`m + 1` energy is `E_m(f)`. -/
theorem isLeast_energy_succ (m : ℕ) (f : Plane → ℝ) :
    IsLeast (energy (m + 1) '' {g | ∀ x ∈ vertices m, g x = f x}) (energy m f) := by
  sorry

/-- 2.3 **The `(2/5, 2/5, 1/5)` rule.** `E_{m+1}(g) = E_m(g)` exactly when, on every level-`m`
cell `F_w`, the value of `g` at the midpoint of the side opposite `F_w pᵢ` is `2/5` of the sum
of its values at the two ends of that side plus `1/5` of its value at `F_w pᵢ`. -/
theorem energy_succ_eq_iff (m : ℕ) (g : Plane → ℝ) :
    energy (m + 1) g = energy m g ↔
      ∀ (w : Fin m → Fin 3) (i : Fin 3),
        g (wordMap m w (midpoint ℝ (corner (i + 1)) (corner (i + 2)))) =
          2 / 5 * (g (wordMap m w (corner (i + 1))) + g (wordMap m w (corner (i + 2)))) +
            1 / 5 * g (wordMap m w (corner i)) := by
  sorry

/-- 2.4 The energy `E(f) = sup_m E_m(f) = lim_m E_m(f)`, with values in `[0, ∞]`. -/
def energyLimit (f : Plane → ℝ) : ℝ≥0∞ := ⨆ m, ENNReal.ofReal (energy m f)

/-- 2.4 **Self-similarity of the energy.** `E(f) = (5/3) ∑ᵢ E(f ∘ Fᵢ)`. -/
theorem energyLimit_eq_sum (f : Plane → ℝ) :
    energyLimit f = 5 / 3 * ∑ i, energyLimit (f ∘ cellMap i) := by
  sorry

/-! ## Layer 3: Harmonic functions -/

/-- 3.1 `f` is harmonic on the gasket: at every level `m`, it is harmonic in the level-`m`
network at every vertex of `V_m` outside `V₀`. -/
def IsHarmonic (f : Plane → ℝ) : Prop :=
  ∀ (m : ℕ) (x : vertices m), x.1 ∉ vertices 0 → (levelNetwork m).IsHarmonicAt (fun y => f y) x

/-- 3.2 **Harmonic means energy-minimising.** `f` is harmonic exactly when `E_m(f) = E_0(f)` for
every `m`. -/
theorem isHarmonic_iff (f : Plane → ℝ) : IsHarmonic f ↔ ∀ m, energy m f = energy 0 f := by
  sorry

/-- 3.3 **The boundary value problem.** For all values `b` on the corners there is a harmonic
function continuous on the gasket with these values; two harmonic functions with the same
corner values agree on `V_*`. -/
theorem existsUnique_isHarmonic {K : Set Plane} (hK : sierpinskiIFS.IsAttractor K)
    (b : Fin 3 → ℝ) :
    (∃ f : Plane → ℝ, IsHarmonic f ∧ ContinuousOn f K ∧ ∀ i, f (corner i) = b i) ∧
      ∀ f g : Plane → ℝ, IsHarmonic f → IsHarmonic g → (∀ i, f (corner i) = g (corner i)) →
        EqOn f g vertexSet := by
  sorry

/-- 3.4 **The maximum principle.** A harmonic function continuous on the gasket takes its values
on the gasket between its least and its greatest corner value. -/
theorem inf'_le_and_le_sup'_of_isHarmonic {K : Set Plane} (hK : sierpinskiIFS.IsAttractor K)
    {f : Plane → ℝ} (hf : IsHarmonic f) (hc : ContinuousOn f K) {x : Plane} (hx : x ∈ K) :
    Finset.univ.inf' Finset.univ_nonempty (f ∘ corner) ≤ f x ∧
      f x ≤ Finset.univ.sup' Finset.univ_nonempty (f ∘ corner) := by
  sorry

/-- 3.5 **Oscillation decay.** On a level-`m` cell `F_w(K)` a harmonic function continuous on
the gasket oscillates by at most `(3/5)^m` times its oscillation on the corners. -/
theorem abs_sub_le_of_isHarmonic {K : Set Plane} (hK : sierpinskiIFS.IsAttractor K)
    {f : Plane → ℝ} (hf : IsHarmonic f) (hc : ContinuousOn f K) (m : ℕ) (w : Fin m → Fin 3)
    {x y : Plane} (hx : x ∈ wordMap m w '' K) (hy : y ∈ wordMap m w '' K) :
    |f x - f y| ≤ (3 / 5) ^ m * (Finset.univ.sup' Finset.univ_nonempty (f ∘ corner) -
      Finset.univ.inf' Finset.univ_nonempty (f ∘ corner)) := by
  sorry

/-- 3.6 **Hölder continuity of harmonic functions.** There is a constant `C` such that every
harmonic function continuous on the gasket is Hölder on the gasket with exponent
`log (5/3) / log 2` in the Euclidean metric and constant `C` times its oscillation on the
corners. -/
theorem exists_abs_sub_le_of_isHarmonic {K : Set Plane} (hK : sierpinskiIFS.IsAttractor K) :
    ∃ C : ℝ, ∀ f : Plane → ℝ, IsHarmonic f → ContinuousOn f K → ∀ x ∈ K, ∀ y ∈ K,
      |f x - f y| ≤ C * (Finset.univ.sup' Finset.univ_nonempty (f ∘ corner) -
        Finset.univ.inf' Finset.univ_nonempty (f ∘ corner)) *
          dist x y ^ (Real.log (5 / 3) / Real.log 2) := by
  sorry

/-! ## Layer 4: The resistance metric -/

/-- 4.1 The resistance between two points: the inverse of the least energy of a function equal
to `1` at `x` and `0` at `y`. It is `0` when `x = y`. -/
def resistance (x y : Plane) : ℝ≥0∞ :=
  (⨅ (f : Plane → ℝ) (_ : f x = 1 ∧ f y = 0), energyLimit f)⁻¹

/-- 4.1 **Consistency.** For two vertices of `V_m`, the resistance is the effective resistance
of the level-`m` network; in particular this effective resistance does not depend on `m`. -/
theorem resistance_eq_effResistance (m : ℕ) {x y : Plane} (hx : x ∈ vertices m)
    (hy : y ∈ vertices m) :
    resistance x y = ENNReal.ofReal ((levelNetwork m).effResistance ⟨x, hx⟩ ⟨y, hy⟩) := by
  sorry

/-- 4.2 **Comparison with the Euclidean metric.** There is `C` with
`R(x, y) ≤ C |x − y|^(log (5/3) / log 2)` for all vertices `x`, `y`. -/
theorem exists_resistance_le :
    ∃ C : ℝ, ∀ x ∈ vertexSet, ∀ y ∈ vertexSet,
      resistance x y ≤ ENNReal.ofReal (C * dist x y ^ (Real.log (5 / 3) / Real.log 2)) := by
  sorry

/-- 4.3 **Finite energy implies Hölder continuity.** There is `C` such that every `f` of finite
energy satisfies `|f x − f y| ≤ C √E(f) |x − y|^(log (5/3) / (2 log 2))` on `V_*`. -/
theorem exists_abs_sub_le_of_energyLimit_ne_top :
    ∃ C : ℝ, ∀ f : Plane → ℝ, energyLimit f ≠ ⊤ → ∀ x ∈ vertexSet, ∀ y ∈ vertexSet,
      |f x - f y| ≤
        C * √(energyLimit f).toReal * dist x y ^ (Real.log (5 / 3) / (2 * Real.log 2)) := by
  sorry

/-- 4.4 **Functions of finite energy are continuous on the gasket**: the values on `V_*` of a
function of finite energy are those of a function continuous on the gasket. -/
theorem exists_continuousOn_eqOn_of_energyLimit_ne_top {K : Set Plane}
    (hK : sierpinskiIFS.IsAttractor K) {f : Plane → ℝ} (hf : energyLimit f ≠ ⊤) :
    ∃ g : Plane → ℝ, ContinuousOn g K ∧ EqOn g f vertexSet := by
  sorry

/-! ## Layer 5: The Laplacian -/

/-- 5.1 The corner `pᵢ` as a vertex of `V_m`. -/
def cornerVertex (m : ℕ) (i : Fin 3) : vertices m :=
  ⟨corner i, by
    classical
    refine Finset.mem_image.2 ⟨(fun _ => i, i), Finset.mem_univ _, ?_⟩
    induction m with
    | zero => rfl
    | succ m ih =>
      change cellMap i (wordMap m (fun _ => i) (corner i)) = corner i
      rw [ih]
      exact midpoint_self ℝ (corner i)⟩

/-- 5.1 `Δf = u` on the gasket: `f` and `u` are continuous on `K`, and
`(3/2) 5^m ∑_{y ∼_m x} (f y − f x) → u x` uniformly in `x ∈ V_m \ V₀`; in terms of the level
network, `(3/2) 5^m ∑_{y ∼_m x} (f y − f x) = −(3/2) 3^m (L_m f)(x)`. -/
def IsLaplacianOn (K : Set Plane) (f u : Plane → ℝ) : Prop :=
  ContinuousOn f K ∧ ContinuousOn u K ∧
    ∀ ε > 0, ∃ M : ℕ, ∀ m ≥ M, ∀ x : vertices m, x.1 ∉ vertices 0 →
      |-(3 / 2 * 3 ^ m) * ((levelNetwork m).laplacian *ᵥ fun y => f y) x - u x| ≤ ε

/-- 5.2 **Normal derivatives and the Gauss–Green formula.** Let `μ` be the self-similar
probability measure with weights `1/3`. If `Δv = φ` on the gasket, the normal derivatives
`(L_m v)(pᵢ) = (5/3)^m ∑_{y ∼_m pᵢ} (v pᵢ − v y)` converge to numbers `d i`, and for every `u`
continuous on the gasket the level forms `E_m(u, v) = ∑_{x ∈ V_m} u x (L_m v)(x)` converge to
`∑ᵢ u(pᵢ) d i − ∫_K u φ dμ`. -/
theorem exists_tendsto_energyForm {K : Set Plane} (hK : sierpinskiIFS.IsAttractor K)
    (μ : Measure Plane) [IsProbabilityMeasure μ]
    (hμ : ∑ i, (1 / 3 : ℝ≥0∞) • μ.map (sierpinskiIFS i) = μ) {v φ : Plane → ℝ}
    (hv : IsLaplacianOn K v φ) :
    ∃ d : Fin 3 → ℝ,
      (∀ i, Tendsto (fun m => ((levelNetwork m).laplacian *ᵥ fun y => v y) (cornerVertex m i))
        atTop (𝓝 (d i))) ∧
      ∀ u : Plane → ℝ, ContinuousOn u K →
        Tendsto (fun m => (fun y : vertices m => u y) ⬝ᵥ
            ((levelNetwork m).laplacian *ᵥ fun y => v y))
          atTop (𝓝 (∑ i, u (corner i) * d i - ∫ x in K, u x * φ x ∂μ)) := by
  sorry

/-- 5.3 **The Dirichlet problem for Poisson's equation.** For `φ` continuous on the gasket and
corner values `b`, there is `f` with `Δf = φ` and `f(pᵢ) = bᵢ`, and two such functions agree on
the gasket. -/
theorem existsUnique_isLaplacianOn {K : Set Plane} (hK : sierpinskiIFS.IsAttractor K)
    {φ : Plane → ℝ} (hφ : ContinuousOn φ K) (b : Fin 3 → ℝ) :
    (∃ f : Plane → ℝ, IsLaplacianOn K f φ ∧ ∀ i, f (corner i) = b i) ∧
      ∀ f g : Plane → ℝ, IsLaplacianOn K f φ → IsLaplacianOn K g φ →
        (∀ i, f (corner i) = g (corner i)) → EqOn f g K := by
  sorry

/-- 5.4 **Harmonic functions are the solutions of `Δf = 0`.** For `f` continuous on a set `K`,
`Δf = 0` on `K` holds exactly when `f` is harmonic; the gasket is the case of interest, but
`IsLaplacianOn K f 0` refers to `K` only through continuity, so `K` is arbitrary. -/
theorem isLaplacianOn_zero_iff {K : Set Plane} {f : Plane → ℝ} (hc : ContinuousOn f K) :
    IsLaplacianOn K f 0 ↔ IsHarmonic f := by
  sorry

end TauCetiRoadmap.AnalysisOnTheSierpinskiGasket
