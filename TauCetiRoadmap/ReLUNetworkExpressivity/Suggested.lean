import Mathlib
import TauCeti.Geometry.Neuromanifold.MLP.Basic
import TauCeti.Topology.PL.Map

/-!
# ReLU network expressivity: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Networks are Tau Ceti's multilayer perceptron specifications `MLPSpec ℝ L` with every hidden
activation `t ↦ max 0 t`: `L` is the number of affine maps, so a network of depth `L` has `L - 1`
hidden layers, and the output layer is affine. Continuous piecewise linear functions on `ℝⁿ` are
the functions that are piecewise affine on the whole space in Tau Ceti's sense
(`TauCeti.IsPiecewiseAffineOn f Set.univ`): finitely many convex polyhedra cover `ℝⁿ` and the
function agrees with a continuous affine map on each.
-/

noncomputable section

open Set TauCeti TauCeti.Neuromanifold

namespace TauCetiRoadmap.ReLUNetworkExpressivity

/-! ## Layer 1: ReLU networks compute continuous piecewise linear functions -/

/-- 1.1 The ReLU multilayer perceptron specification with widths `d 0, …, d L`: every hidden layer
applies `t ↦ max 0 t` coordinatewise, the scalar function of Tau Ceti's `reluActivation`, and the
output layer is affine. -/
def reluSpec {L : ℕ} (d : Fin (L + 1) → ℕ) : MLPSpec ℝ L where
  width := d
  activation _ t := max 0 t

/-- 1.1 The ReLU network with widths `d` computes `f : ℝⁿ → ℝ`: its input width is `n`, its output
width is `1`, and for some parameters its realization agrees with `f` at every input. -/
def ReLUNetComputes {n L : ℕ} (d : Fin (L + 1) → ℕ) (f : (Fin n → ℝ) → ℝ) : Prop :=
  ∃ (h0 : d 0 = n) (hL : d (Fin.last L) = 1) (θ : (reluSpec d).Parameters),
    ∀ x, (reluSpec d).realize θ (fun i => x (Fin.cast h0 i)) (Fin.cast hL.symm 0) = f x

/-- 1.1 The hidden layers of a network of depth `L`: the indices other than the input `0` and the
output `L`. -/
def hiddenLayers (L : ℕ) : Finset (Fin (L + 1)) :=
  Finset.univ.filter fun i => i ≠ 0 ∧ i ≠ Fin.last L

/-- 1.3 Every function computed by a ReLU network is continuous piecewise linear: it is piecewise
affine on the whole space in Tau Ceti's sense. -/
theorem isPiecewiseAffineOn_of_reluNetComputes {n L : ℕ} {d : Fin (L + 1) → ℕ}
    {f : (Fin n → ℝ) → ℝ} (hf : ReLUNetComputes d f) :
    IsPiecewiseAffineOn f (univ : Set (Fin n → ℝ)) := by
  sorry

/-! ## Layer 2: continuous piecewise linear functions as sums of maxima -/

/-- 2.1 Convex case: the maximum of `p ≥ 1` affine functions on `ℝⁿ` is an integer combination of
the maxima of its subfamilies with at most `n + 1` members. -/
theorem exists_int_combination_sup'_card_le {n p : ℕ} (hp : 0 < p)
    (ℓ : Fin p → ((Fin n → ℝ) →ᴬ[ℝ] ℝ)) :
    ∃ c : Finset (Fin p) → ℤ, (∀ S, c S ≠ 0 → S.card ≤ n + 1) ∧ ∀ x,
      (Finset.univ.sup' (Finset.univ_nonempty_iff.mpr ⟨⟨0, hp⟩⟩) fun i => ℓ i x) =
        ∑ S : Finset (Fin p), if h : S.Nonempty then (c S : ℝ) * S.sup' h (fun i => ℓ i x)
          else 0 := by
  sorry

/-- 2.3 Wang–Sun representation: every continuous piecewise linear `f : ℝⁿ → ℝ` is a finite
signed sum of maxima of `n + 1` affine functions (repetitions allowed). -/
theorem exists_signed_sum_sup'_of_isPiecewiseAffineOn {n : ℕ} {f : (Fin n → ℝ) → ℝ}
    (hf : IsPiecewiseAffineOn f (univ : Set (Fin n → ℝ))) :
    ∃ (k : ℕ) (s : Fin k → ℝ) (ℓ : Fin k → Fin (n + 1) → ((Fin n → ℝ) →ᴬ[ℝ] ℝ)),
      (∀ j, s j = 1 ∨ s j = -1) ∧
        ∀ x, f x = ∑ j, s j * Finset.univ.sup' Finset.univ_nonempty (fun i => ℓ j i x) := by
  sorry

/-! ## Layer 3: logarithmic depth suffices -/

/-- 3.2 Arora–Basu–Mianjy–Mukherjee: every continuous piecewise linear `f : ℝⁿ → ℝ` is computed
by a ReLU network of every depth `L ≥ ⌈log₂ (n + 1)⌉ + 1`. -/
theorem exists_reluNetComputes_of_isPiecewiseAffineOn {n : ℕ} {f : (Fin n → ℝ) → ℝ}
    (hf : IsPiecewiseAffineOn f (univ : Set (Fin n → ℝ))) {L : ℕ}
    (hL : Nat.clog 2 (n + 1) + 1 ≤ L) :
    ∃ d : Fin (L + 1) → ℕ, ReLUNetComputes d f := by
  sorry

/-! ## Layer 4: breakpoints of univariate networks -/

/-- 4.1 `g : ℝ → ℝ` is affine on every open interval that contains no point of `s`. With `s` of
size `p - 1`, `g` has at most `p` affine pieces. -/
def AffineOffFinset (g : ℝ → ℝ) (s : Finset ℝ) : Prop :=
  ∀ a b : ℝ, (∀ z ∈ s, z ∉ Ioo a b) → ∃ c e : ℝ, ∀ x ∈ Ioo a b, g x = c * x + e

/-- 4.2 A univariate ReLU network with hidden widths `d i` has at most `∏ (d i + 1)` affine
pieces: some set of at most `∏ (d i + 1) - 1` points contains all its breakpoints. -/
theorem exists_affineOffFinset_card_lt_prod {L : ℕ} {d : Fin (L + 1) → ℕ} {g : ℝ → ℝ}
    (hg : ReLUNetComputes d (fun x : Fin 1 → ℝ => g (x 0))) :
    ∃ s : Finset ℝ, AffineOffFinset g s ∧ s.card < ∏ i ∈ hiddenLayers L, (d i + 1) := by
  sorry

/-- 4.3 Arora et al., Theorem 2.2: a continuous `g : ℝ → ℝ` that is affine off a nonempty finite
set `s` is computed by a ReLU network with one hidden layer of `s.card + 1` units. For `s = ∅` and
`g x = x` one unit does not suffice. -/
theorem reluNetComputes_of_affineOffFinset {g : ℝ → ℝ} (hg : Continuous g) {s : Finset ℝ}
    (hs₀ : s.Nonempty) (hs : AffineOffFinset g s) :
    ReLUNetComputes ![1, s.card + 1, 1] (fun x : Fin 1 → ℝ => g (x 0)) := by
  sorry

/-! ## Layer 5: the tent map and depth separation -/

/-- 5.1 The tent map `2σ(x) - 4σ(x - 1/2) + 2σ(x - 1)` with `σ(t) = max 0 t`: it rises from `0` to
`1` on `[0, 1/2]`, falls back to `0` on `[1/2, 1]` and vanishes off `[0, 1]`. -/
def tent (x : ℝ) : ℝ :=
  2 * max 0 x - 4 * max 0 (x - 1 / 2) + 2 * max 0 (x - 1)

/-- 5.1 The `m`-fold iterate of the tent map is computed by a ReLU network of depth `m + 1` whose
hidden layers have width `3`. -/
theorem reluNetComputes_tent_iterate (m : ℕ) :
    ReLUNetComputes (fun i : Fin (m + 2) => if i = 0 ∨ i = Fin.last (m + 1) then 1 else 3)
      (fun x : Fin 1 → ℝ => tent^[m] (x 0)) := by
  sorry

/-- 5.2 Counting lemma: a function `g` affine off a finite set `s` stays at `L¹([0, 1])` distance
at least `(2 ^ (m - 1) - 1 - 2 |s|) / 2 ^ (m + 3)` from the `m`-fold tent map; for `m = 0` the
bound is not positive. -/
theorem integral_abs_tent_iterate_sub_ge {m : ℕ} {g : ℝ → ℝ} {s : Finset ℝ}
    (hs : AffineOffFinset g s) :
    ((2 : ℝ) ^ (m - 1) - 1 - 2 * s.card) / 2 ^ (m + 3) ≤
      ∫ x in (0 : ℝ)..1, |tent^[m] x - g x| := by
  sorry

/-- 5.3 Telgarsky's depth separation: a ReLU network of depth at most `L` with at most `2 ^ L`
hidden units in total stays at `L¹([0, 1])` distance at least `1/32` from the
`(L ^ 2 + 2)`-fold tent map, which a network of depth `L ^ 2 + 3` and width `3` computes. -/
theorem one_div_32_le_integral_abs_tent_iterate_sub {L L' : ℕ} (hL' : L' ≤ L)
    {d : Fin (L' + 1) → ℕ} (hd : ∑ i ∈ hiddenLayers L', d i ≤ 2 ^ L) {g : ℝ → ℝ}
    (hg : ReLUNetComputes d (fun x : Fin 1 → ℝ => g (x 0))) :
    (1 : ℝ) / 32 ≤ ∫ x in (0 : ℝ)..1, |tent^[L ^ 2 + 2] x - g x| := by
  sorry

/-! ## Layer 6: Yarotsky's approximation of the square and of products -/

/-- 6.1 Yarotsky's approximation `x - ∑_{s = 1}^{m} tent^[s] x / 4 ^ s` of `x ↦ x ^ 2`. -/
def yarotskyApprox (m : ℕ) (x : ℝ) : ℝ :=
  x - ∑ s ∈ Finset.range m, tent^[s + 1] x / 4 ^ (s + 1)

/-- 6.1 Yarotsky's error bound: on `[0, 1]`, `yarotskyApprox m` lies above `x ^ 2` by at most
`4 ^ (-(m + 1))`. -/
theorem yarotskyApprox_sub_sq_mem_Icc (m : ℕ) {x : ℝ} (hx : x ∈ Icc (0 : ℝ) 1) :
    yarotskyApprox m x - x ^ 2 ∈ Icc (0 : ℝ) (1 / 4 ^ (m + 1)) := by
  sorry

/-- 6.2 `yarotskyApprox m` is computed by a ReLU network of depth `m + 1` whose hidden layers have
width `5`. -/
theorem reluNetComputes_yarotskyApprox (m : ℕ) :
    ReLUNetComputes (fun i : Fin (m + 2) => if i = 0 ∨ i = Fin.last (m + 1) then 1 else 5)
      (fun x : Fin 1 → ℝ => yarotskyApprox m (x 0)) := by
  sorry

/-- 6.3 Approximate multiplication: for `M > 0` and every `m`, a ReLU network of depth `m + 2`
with hidden widths at most `15` computes `F` with `|F(x, y) - x y| ≤ M ^ 2 / 4 ^ m` whenever
`|x|, |y| ≤ M`, and `F(x, 0) = F(0, y) = 0` for all `x`, `y`. -/
theorem exists_reluNetComputes_mul {M : ℝ} (hM : 0 < M) (m : ℕ) :
    ∃ (d : Fin (m + 3) → ℕ) (F : (Fin 2 → ℝ) → ℝ), (∀ i ∈ hiddenLayers (m + 2), d i ≤ 15) ∧
      ReLUNetComputes d F ∧
      (∀ x y : ℝ, |x| ≤ M → |y| ≤ M → |F ![x, y] - x * y| ≤ M ^ 2 / 4 ^ m) ∧
      ∀ x : ℝ, F ![x, 0] = 0 ∧ F ![0, x] = 0 := by
  sorry

end TauCetiRoadmap.ReLUNetworkExpressivity
