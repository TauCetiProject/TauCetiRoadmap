import Mathlib

/-!
# Partial differential equations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap, the build lanes (A–F), and the acceptance criteria are in
`README.md`. Mathlib already carries a substantial prerequisite stack: distributions and
test functions, the Schwartz space, the Fourier transform, convolution and mollifiers,
the Gagliardo–Nirenberg–Sobolev inequality, the **Bessel-potential** Sobolev scale
(`TemperedDistribution.memSobolev`), the Laplacian and harmonic-function theory,
**Lax–Milgram** (`InnerProductSpace.continuousLinearEquivOfBilin`), the **Fredholm
alternative** for compact operators, and the spectral theorem for symmetric operators.

What is missing is the PDE theory on top: weak-derivative Sobolev spaces `W^{k,p}(Ω)` on
a domain with their embedding/trace/compactness package (Lane A), the harmonic-analysis
estimates (Lane B), maximum principles and potential theory (Lane C), elliptic existence
via the energy method (Lane D), elliptic regularity (Schauder and De Giorgi–Nash–Moser;
Lane E), and parabolic/evolution equations (Lane F). These live in
`TauCeti/Analysis/PDE/`, with supporting theories under `TauCeti/Analysis/Sobolev/` and
`TauCeti/Analysis/HarmonicAnalysis/`.

As each lane makes the next lane's *types* expressible in `TauCeti/`, state that lane's
milestones here with `sorry` (human-owned roadmap territory, so `sorry` is allowed). The
natural first targets, in order:

* Lane A: `Wkp k p Ω` (weak-derivative Sobolev space) is complete; Meyers–Serrin `H = W`;
  Poincaré on `Wkp0 1 p Ω`; Rellich–Kondrachov compactness `W^{1,p}(Ω) ↪↪ L^p(Ω)`.
* Lane D: existence and uniqueness of the weak solution of `−Δu = f`, `u|∂Ω = 0`, on a
  bounded domain, via `IsCoercive` + `continuousLinearEquivOfBilin` (Lax–Milgram).
* Lane E: De Giorgi–Nash–Moser, showing that a weak `H¹` solution of a divergence-form
  equation with bounded measurable coefficients is locally Hölder continuous.

The first end-to-end milestone (Lane D.17) is the shortest path to a genuine PDE existence
theorem, because Lax–Milgram is already in Mathlib; it only awaits `Wkp0` and Poincaré
from Lane A.
-/

namespace TauCetiRoadmap.PDE

/-! ### Parabolic metric carrier

The time coordinate is Mathlib's half-power snowflake copy of `ℝ`. The space-time
carrier is Mathlib's `WithLp 1` copy of the product of Euclidean space and that snowflake;
its native metric is the sum of the factor distances and its topology is the ordinary
product topology. This leaves Mathlib's metric on `EuclideanSpace × ℝ` unchanged.
-/

/-- Real time with the parabolic half-power metric. -/
abbrev ParabolicTime := Metric.Snowflaking ℝ (1 / 2 : ℝ) (by norm_num) (by norm_num)

/-- A distinct copy of Euclidean space-time with Mathlib's native `L¹` product metric. -/
abbrev ParabolicSpaceTime (n : ℕ) :=
  WithLp 1 (EuclideanSpace ℝ (Fin n) × ParabolicTime)

namespace ParabolicSpaceTime

variable {n : ℕ}

/-- Construct the parabolic point represented by spatial position `x` and time `t`. -/
def ofCoords (x : EuclideanSpace ℝ (Fin n)) (t : ℝ) : ParabolicSpaceTime n :=
  WithLp.toLp 1 (x, ⟨t⟩)

/-- The Euclidean-space coordinate of a parabolic point. -/
def space (p : ParabolicSpaceTime n) : EuclideanSpace ℝ (Fin n) := p.fst

/-- The snowflaked time coordinate of a parabolic point. -/
def time (p : ParabolicSpaceTime n) : ParabolicTime := p.snd

/-- Coordinates in the product whose time factor retains the snowflake metric. -/
def toProd (p : ParabolicSpaceTime n) : EuclideanSpace ℝ (Fin n) × ParabolicTime :=
  WithLp.ofLp p

/-- Ordinary Euclidean-space and real-time coordinates, as a homeomorphism. -/
noncomputable def coordsHomeomorph : ParabolicSpaceTime n ≃ₜ EuclideanSpace ℝ (Fin n) × ℝ :=
  (WithLp.homeomorphProd 1 (EuclideanSpace ℝ (Fin n)) ParabolicTime).trans
    ((Homeomorph.refl _).prodCongr
      (Metric.Snowflaking.homeomorph : ParabolicTime ≃ₜ ℝ))

/-- Ordinary coordinates of a parabolic point. This is intentionally not a simp lemma:
the `ofCoords` specialization below is the canonical simplification rule. -/
theorem coordsHomeomorph_apply (p : ParabolicSpaceTime n) :
    coordsHomeomorph p = (p.space, p.time.val) := rfl

@[simp] theorem coordsHomeomorph_ofCoords (x : EuclideanSpace ℝ (Fin n)) (t : ℝ) :
    coordsHomeomorph (ofCoords x t) = (x, t) := rfl

@[simp] theorem coordsHomeomorph_symm_apply (z : EuclideanSpace ℝ (Fin n) × ℝ) :
    coordsHomeomorph.symm z = ofCoords z.1 z.2 := rfl

@[simp] theorem ofCoords_space (x : EuclideanSpace ℝ (Fin n)) (t : ℝ) :
    (ofCoords x t).space = x := rfl

@[simp] theorem ofCoords_time_val (x : EuclideanSpace ℝ (Fin n)) (t : ℝ) :
    (ofCoords x t).time.val = t := rfl

@[simp] theorem toProd_fst (p : ParabolicSpaceTime n) : (toProd p).1 = p.space := rfl

@[simp] theorem toProd_snd (p : ParabolicSpaceTime n) : (toProd p).2 = p.time := rfl

/-- Mathlib's `WithLp 1` metric gives exactly the sum of spatial and time distances. -/
@[simp] theorem dist_eq_parabolicDist (p q : ParabolicSpaceTime n) :
    dist p q = dist p.space q.space + dist p.time q.time :=
  by
    simpa [space, time] using
      (WithLp.prod_dist_eq_add (by norm_num : 0 < (1 : ENNReal).toReal) p q)

theorem spatial_dist_le (p q : ParabolicSpaceTime n) :
    dist p.space q.space ≤ dist p q := by
  rw [dist_eq_parabolicDist]
  exact le_add_of_nonneg_right dist_nonneg

theorem time_dist_le (p q : ParabolicSpaceTime n) :
    dist p.time q.time ≤ dist p q := by
  rw [dist_eq_parabolicDist]
  exact le_add_of_nonneg_left dist_nonneg

@[simp] theorem dist_time_formula (p q : ParabolicSpaceTime n) :
    dist p.time q.time = |p.time.val - q.time.val| ^ (1 / 2 : ℝ) := by
  change dist p.time.val q.time.val ^ (1 / 2 : ℝ) = _
  simp [Real.dist_eq]

/-- On ordinary coordinates the distance is `|x-y| + sqrt |t-s|`. -/
theorem dist_ofCoords (x y : EuclideanSpace ℝ (Fin n)) (t s : ℝ) :
    dist (ofCoords x t) (ofCoords y s) = dist x y + Real.sqrt |t - s| := by
  rw [dist_eq_parabolicDist]
  simp only [ofCoords_space]
  rw [dist_time_formula, Real.sqrt_eq_rpow]
  simp

/-- Reverse time about `T`, leaving the spatial coordinate fixed. -/
def timeReverse (T : ℝ) (p : ParabolicSpaceTime n) : ParabolicSpaceTime n :=
  ofCoords p.space (T - p.time.val)

@[simp] theorem timeReverse_space (T : ℝ) (p : ParabolicSpaceTime n) :
    (timeReverse T p).space = p.space := rfl

@[simp] theorem timeReverse_time_val (T : ℝ) (p : ParabolicSpaceTime n) :
    (timeReverse T p).time.val = T - p.time.val := rfl

theorem timeReverse_involutive (T : ℝ) (p : ParabolicSpaceTime n) :
    timeReverse T (timeReverse T p) = p := by
  apply (WithLp.ext_iff 1).2
  change (p.space, ⟨T - (T - p.time.val)⟩) = (p.space, p.time)
  apply Prod.ext
  · rfl
  · apply Metric.Snowflaking.ext
    ring

theorem timeReverse_dist (T : ℝ) (p q : ParabolicSpaceTime n) :
    dist (timeReverse T p) (timeReverse T q) = dist p q := by
  rw [dist_eq_parabolicDist, dist_eq_parabolicDist]
  simp only [timeReverse_space, timeReverse_time_val, dist_time_formula]
  congr 1
  have habs : |(T - p.time.val) - (T - q.time.val)| = |p.time.val - q.time.val| := by
    rw [show (T - p.time.val) - (T - q.time.val) = q.time.val - p.time.val by ring]
    rw [abs_sub_comm]
  exact congrArg (fun x : ℝ => x ^ (1 / 2 : ℝ)) habs

theorem timeReverse_isometry (T : ℝ) :
    Isometry (timeReverse T : ParabolicSpaceTime n → ParabolicSpaceTime n) :=
  fun p q => by simp only [edist_dist, timeReverse_dist]

/-- Time reversal as a bijective isometry, using its involutive inverse. -/
noncomputable def timeReverseIsometryEquiv (T : ℝ) :
    ParabolicSpaceTime n ≃ᵢ ParabolicSpaceTime n :=
  IsometryEquiv.mk' (timeReverse T) (timeReverse T)
    (timeReverse_involutive T) (timeReverse_isometry T)

end ParabolicSpaceTime

/-- The closed parabolic time slab `[a,b]` in the distinct metric carrier. -/
def parabolicSlab {n : ℕ} (a b : ℝ) : Set (ParabolicSpaceTime n) :=
  {p | p.snd.val ∈ Set.Icc a b}

/-- In ordinary space-time coordinates, the closed parabolic slab is the preimage of
`univ ×ˢ Icc a b`. -/
@[simp] theorem coordsHomeomorph_preimage_prod_Icc {n : ℕ} (a b : ℝ) :
    (ParabolicSpaceTime.coordsHomeomorph : ParabolicSpaceTime n ≃ₜ
      EuclideanSpace ℝ (Fin n) × ℝ) ⁻¹' (Set.univ ×ˢ Set.Icc a b) = parabolicSlab a b := by
  ext p
  change ((ParabolicSpaceTime.coordsHomeomorph p).1 ∈ Set.univ ∧
    (ParabolicSpaceTime.coordsHomeomorph p).2 ∈ Set.Icc a b) ↔
      p.snd.val ∈ Set.Icc a b
  simp only [Set.mem_univ, true_and]
  rw [ParabolicSpaceTime.coordsHomeomorph_apply]
  rfl

/-- Restrict a space-time function to a closed time slab. -/
def restrictToParabolicSlab {n : ℕ} (a b : ℝ)
    (u : ParabolicSpaceTime n → ℝ) : parabolicSlab (n := n) a b → ℝ :=
  (parabolicSlab (n := n) a b).domRestrict u

/-- Reversal about `T` maps the slab `[a,b]` into `[T-b,T-a]`. -/
theorem timeReverse_mem_parabolicSlab {n : ℕ} (T a b : ℝ)
    (p : ParabolicSpaceTime n) (hp : p ∈ parabolicSlab a b) :
    ParabolicSpaceTime.timeReverse T p ∈ parabolicSlab (T - b) (T - a) := by
  change (ParabolicSpaceTime.time p).val ∈ Set.Icc a b at hp
  change (ParabolicSpaceTime.time (ParabolicSpaceTime.timeReverse T p)).val ∈
    Set.Icc (T - b) (T - a)
  simp only [ParabolicSpaceTime.timeReverse_time_val]
  rcases hp with ⟨ha, hb⟩
  constructor <;> linarith

/-- The explicit uniform bound on a closed slab is equivalent to the same estimate
on its subtype. -/
theorem boundedOnParabolicSlab_iff_subtype {n : ℕ} {a b : ℝ}
    {u : ParabolicSpaceTime n → ℝ} :
    (∃ B : ℝ, 0 ≤ B ∧ ∀ p, p ∈ parabolicSlab (n := n) a b → ‖u p‖ ≤ B) ↔
      ∃ B : ℝ, 0 ≤ B ∧ ∀ p : parabolicSlab (n := n) a b,
        ‖restrictToParabolicSlab a b u p‖ ≤ B := by
  constructor
  · rintro ⟨B, hB, hbound⟩
    refine ⟨B, hB, ?_⟩
    intro p
    exact hbound p.1 p.2
  · rintro ⟨B, hB, hbound⟩
    refine ⟨B, hB, ?_⟩
    intro p hp
    exact hbound ⟨p, hp⟩

/-- Hölder regularity on the ambient parabolic space is exactly native Hölder regularity
of the restriction to the closed-slab subtype. -/
theorem holderOnParabolicSlab_iff_subtype {n : ℕ} {a b : ℝ}
    {u : ParabolicSpaceTime n → ℝ} {C α : NNReal} :
    HolderOnWith C α u (parabolicSlab (n := n) a b) ↔
      HolderOnWith C α (restrictToParabolicSlab a b u) Set.univ := by
  constructor
  · intro h
    have h' : HolderWith C α ((parabolicSlab (n := n) a b).domRestrict u) :=
      HolderWith.restrict_iff.mpr h
    have h'' : HolderWith C α (restrictToParabolicSlab a b u) := h'
    exact HolderWith.holderOnWith h'' Set.univ
  · intro h
    have h' : HolderWith C α (restrictToParabolicSlab a b u) :=
      holderOnWith_univ.mp h
    have h'' : HolderWith C α ((parabolicSlab (n := n) a b).domRestrict u) := h'
    exact HolderWith.restrict_iff.mp h''

end TauCetiRoadmap.PDE
