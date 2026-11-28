import Mathlib
import TauCeti.Geometry.Neuromanifold.MLP.Basic

/-!
# Threshold functions and margins: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

The single neuron is the depth-one multilayer perceptron of the Tau Ceti library
(`TauCeti.Neuromanifold.MLPSpec`) with widths `n` and `1`; its output is the affine map
`x ↦ ⟪a, x⟫ + b` of its parameters, and a Boolean function is computed by it when its value at
`x` is `true` exactly where that output is positive. Boolean inputs enter in two encodings: as
`0`/`1` vectors through `boolVec` (copied from DecisionTreeComplexity 2.1), for threshold degree,
and as `±1` vectors through the Walsh characters of single coordinates (copied from
BooleanFunctionAnalysis 1.1), for Fourier coefficients. A polynomial sign-represents a Boolean
function when it is nonzero at every point of the cube with the sign of the function there.

Margins live in a real inner product space. The margin of a direction `w` on a finite family is
its least inner product with a member of the family, and directions range over the closed unit
ball. The perceptron (copied from OnlineLearningAndLittlestoneDimension 3.1) is a sequence of
weight vectors.
-/

noncomputable section

open Finset TauCeti.Neuromanifold
open scoped BigOperators Pointwise

namespace TauCetiRoadmap.ThresholdFunctionsAndMargins

/-! ## Layer 1: the single neuron and threshold degree -/

section Layer1

variable {n : ℕ}

/-- 1.1 Copied verbatim from DecisionTreeComplexity 2.1: the point of `ℝⁿ` attached to an input:
`true` becomes `1` and `false` becomes `0`. -/
def boolVec (x : Fin n → Bool) : Fin n → ℝ :=
  fun i => if x i then 1 else 0

/-- 1.1 The single neuron on `n` inputs: the Tau Ceti multilayer perceptron of depth one with
widths `n` and `1`. It has no hidden layer, so it has no activation, and its parameters are a
`1 × n` weight matrix and a bias. -/
def neuron (n : ℕ) : MLPSpec ℝ 1 :=
  MLPSpec.linear ![n, 1]

/-- 1.1 The output of the single neuron with parameters `θ` at `x`: the only coordinate of its
realization. -/
def neuronOutput (θ : (neuron n).Parameters) (x : Fin n → ℝ) : ℝ :=
  (neuron n).realize θ x ⟨0, Nat.one_pos⟩

/-- 1.1 A Boolean function is a linear threshold function when some single neuron computes it on
the points of `{0, 1}ⁿ`: the value is `true` exactly where the output is positive. -/
def IsLinearThreshold (f : (Fin n → Bool) → Bool) : Prop :=
  ∃ θ : (neuron n).Parameters, ∀ x, f x = decide (0 < neuronOutput θ (boolVec x))

/-- 1.2 A real polynomial sign-represents `f` when, at every input, it is positive where `f` is
true and negative where `f` is false. -/
def SignRepresents (p : MvPolynomial (Fin n) ℝ) (f : (Fin n → Bool) → Bool) : Prop :=
  ∀ x, 0 < (if f x then 1 else -1) * MvPolynomial.eval (boolVec x) p

/-- 1.2 The threshold degree of `f`: the least total degree of a real polynomial that
sign-represents it. -/
def thresholdDegree (f : (Fin n → Bool) → Bool) : ℕ :=
  sInf {d | ∃ p : MvPolynomial (Fin n) ℝ, p.totalDegree ≤ d ∧ SignRepresents p f}

/-- 1.3 The functions computed by the single neuron are exactly the functions of threshold
degree at most one. -/
theorem isLinearThreshold_iff_thresholdDegree_le_one (f : (Fin n → Bool) → Bool) :
    IsLinearThreshold f ↔ thresholdDegree f ≤ 1 := by
  sorry

end Layer1

/-! ## Layer 2: threshold degree of symmetric functions -/

section Layer2

variable {n : ℕ}

/-- 2.1 A symmetric Boolean function `x ↦ F |x|` has threshold degree equal to the number of
`j < n` with `F j ≠ F (j + 1)`, the number of sign changes of `F` on `0, …, n`. With
`F j = decide (Odd j)` it gives the theorem of Minsky and Papert (2.2): the parity of `n` bits has
threshold degree `n`. -/
theorem thresholdDegree_symmetric (F : ℕ → Bool) :
    thresholdDegree (fun x : Fin n → Bool => F #{i | x i = true}) =
      #{j ∈ range n | F j ≠ F (j + 1)} := by
  sorry

end Layer2

/-! ## Layer 3: Chow's theorem -/

section Walsh

variable {ι : Type*}

/-- 3.1 Copied verbatim from BooleanFunctionAnalysis 1.1: the Walsh character of a finite set `S`
of coordinates: `x ↦ ∏ i ∈ S, (-1) ^ x i`. -/
def walsh (S : Finset ι) (x : ι → ZMod 2) : ℝ :=
  ∏ i ∈ S, (-1 : ℝ) ^ (x i).val

variable [Fintype ι] [DecidableEq ι]

/-- 3.1 Copied verbatim from BooleanFunctionAnalysis 1.2: the Fourier coefficient of `f` at `S`:
the average of `f` against the Walsh character of `S`. -/
def walshCoeff (f : (ι → ZMod 2) → ℝ) (S : Finset ι) : ℝ :=
  𝔼 x, f x * walsh S x

/-- 3.2 Chow's theorem for polynomial threshold functions of degree `k`: if `f` takes the values
`±1` and has the sign of a function `ℓ` whose Fourier coefficients vanish above degree `k`, and
`g` takes the values `±1` and has the Fourier coefficients of `f` up to degree `k`, then
`g = f`. -/
theorem eq_of_walshCoeff_eq (k : ℕ) {f g ℓ : (ι → ZMod 2) → ℝ}
    (hf : ∀ x, f x = 1 ∨ f x = -1) (hg : ∀ x, g x = 1 ∨ g x = -1)
    (hℓ : ∀ S : Finset ι, k < S.card → walshCoeff ℓ S = 0) (hsign : ∀ x, 0 < f x * ℓ x)
    (h : ∀ S : Finset ι, S.card ≤ k → walshCoeff g S = walshCoeff f S) :
    g = f := by
  sorry

end Walsh

section Chow

variable {n : ℕ}

/-- 3.3 The `±1`-valued function computed by the single neuron on the cube `Fin n → ZMod 2`: the
input is the vector of the `±1` coordinates `walsh {i} x`, and the value is `1` where the output
is positive and `-1` elsewhere. -/
def neuronSign (θ : (neuron n).Parameters) (x : Fin n → ZMod 2) : ℝ :=
  if 0 < neuronOutput θ (fun i => walsh {i} x) then 1 else -1

/-- 3.3 Chow's theorem: a linear threshold function is determined, among all `±1`-valued
functions on the cube, by its Fourier coefficients of degree at most one. -/
theorem eq_neuronSign_of_walshCoeff_eq (θ : (neuron n).Parameters)
    (g : (Fin n → ZMod 2) → ℝ) (hg : ∀ x, g x = 1 ∨ g x = -1)
    (h : ∀ S : Finset (Fin n), S.card ≤ 1 → walshCoeff g S = walshCoeff (neuronSign θ) S) :
    g = neuronSign θ := by
  sorry

end Chow

/-! ## Layer 4: maximum margins and the perceptron -/

section Margins

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- 4.1 The margin of the direction `w` on a nonempty finite family `a`: the least inner product
`⟪w, a i⟫`. -/
def margin {ι : Type*} [Fintype ι] [Nonempty ι] (a : ι → E) (w : E) : ℝ :=
  univ.inf' univ_nonempty fun i => inner ℝ w (a i)

/-- 4.1 The maximum margin over the closed unit ball is the distance from the origin to the
convex hull of the family; when it is positive, the only maximizing direction is the nearest
point of the hull divided by its norm. -/
theorem isGreatest_margin {ι : Type*} [Fintype ι] [Nonempty ι] (a : ι → E) :
    IsGreatest (margin a '' Metric.closedBall 0 1)
        (Metric.infDist 0 (convexHull ℝ (Set.range a))) ∧
      ∀ c ∈ convexHull ℝ (Set.range a), ‖c‖ = Metric.infDist 0 (convexHull ℝ (Set.range a)) →
        0 < ‖c‖ → ∀ w ∈ Metric.closedBall (0 : E) 1, margin a w = ‖c‖ → w = ‖c‖⁻¹ • c := by
  sorry

/-- 4.2 The margin of the affine classifier `x ↦ ⟪w, x⟫ + b` on a labelled family: the least
value of `y i * (⟪w, x i⟫ + b)`. -/
def affineMargin {ι : Type*} [Fintype ι] [Nonempty ι] (x : ι → E) (y : ι → ℝ) (w : E) (b : ℝ) :
    ℝ :=
  univ.inf' univ_nonempty fun i => y i * (inner ℝ w (x i) + b)

/-- 4.2 With labels `±1` and both classes nonempty, the maximum affine margin over directions in
the closed unit ball and all offsets is half the distance between the convex hulls of the two
classes. -/
theorem isGreatest_affineMargin {ι : Type*} [Fintype ι] [Nonempty ι] (x : ι → E) (y : ι → ℝ)
    (hy : ∀ i, y i = 1 ∨ y i = -1) (hpos : ∃ i, y i = 1) (hneg : ∃ i, y i = -1) :
    IsGreatest {m | ∃ w b, ‖w‖ ≤ 1 ∧ affineMargin x y w b = m}
      (Metric.infDist 0
        (convexHull ℝ (x '' {i | y i = 1}) - convexHull ℝ (x '' {i | y i = -1})) / 2) := by
  sorry

end Margins

section Perceptron

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- 4.3 Copied verbatim from OnlineLearningAndLittlestoneDimension 3.1: the perceptron weights for
instances `x` and labels `y`: `w 0 = 0`, and `w (t + 1) = w t + y t • x t` when
`y t * ⟪w t, x t⟫ ≤ 0`, `w (t + 1) = w t` otherwise. -/
def perceptronWeight (x : ℕ → E) (y : ℕ → ℝ) : ℕ → E
  | 0 => 0
  | t + 1 =>
    if y t * inner ℝ (perceptronWeight x y t) (x t) ≤ 0 then perceptronWeight x y t + y t • x t
    else perceptronWeight x y t

/-- 4.3 Copied verbatim from OnlineLearningAndLittlestoneDimension 3.1: the update rounds among
the first `T`: the `t < T` with `y t * ⟪w t, x t⟫ ≤ 0`. -/
def perceptronUpdates (x : ℕ → E) (y : ℕ → ℝ) (T : ℕ) : Finset ℕ :=
  {t ∈ range T | y t * inner ℝ (perceptronWeight x y t) (x t) ≤ 0}

/-- 4.3 The perceptron on a finite sample. Let the labels be `±1`, the instances have norm at
most `R`, and `γ⋆`, the distance from the origin to the convex hull of the points `y i • x i`, be
positive. On every sequence of examples drawn from the sample the perceptron makes at most
`(R / γ⋆)²` updates, and `R / γ⋆` is at most `R ‖u‖ / γ` for every `u` that separates the sample
with margin `γ > 0`. -/
theorem card_perceptronUpdates_le_sq_div_infDist {ι : Type*} [Fintype ι] [Nonempty ι]
    (x : ι → E) (y : ι → ℝ) (hy : ∀ i, y i = 1 ∨ y i = -1) (R : ℝ) (hR : ∀ i, ‖x i‖ ≤ R)
    (hsep : 0 < Metric.infDist 0 (convexHull ℝ (Set.range fun i => y i • x i))) :
    (∀ (s : ℕ → ι) (T : ℕ), ((perceptronUpdates (x ∘ s) (y ∘ s) T).card : ℝ) ≤
        (R / Metric.infDist 0 (convexHull ℝ (Set.range fun i => y i • x i))) ^ 2) ∧
      ∀ (u : E) (γ : ℝ), 0 < γ → (∀ i, γ ≤ y i * inner ℝ u (x i)) →
        R / Metric.infDist 0 (convexHull ℝ (Set.range fun i => y i • x i)) ≤ R * ‖u‖ / γ := by
  sorry

end Perceptron

end TauCetiRoadmap.ThresholdFunctionsAndMargins
