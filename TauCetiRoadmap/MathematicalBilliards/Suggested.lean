module

import Mathlib
import TauCeti.Analysis.Semigroups.Group.Unitary

/-!
# Mathematical billiards: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, the headline theorems that the finished roadmap
proves, each with `sorry`, together with the few simple definitions those statements need.

Stated here:

* Layer 3: the billiard ball map of every convex table (of class `C^k`, `k ≥ 1`) preserves the
  measure `sin δ dδ ds` (`ConvexTable.measurePreserving_billiardMap`);
* Layer 5: Birkhoff's theorem that a rotational invariant curve of a twist homeomorphism of the
  closed annulus all of whose interior points are non-wandering is the graph of a continuous
  function (`isGraph_of_isRotationalInvariantCurve`), and its billiard form, with the Lipschitz
  conclusion (`ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve`);
* Layer 6: Birkhoff's theorem that every convex table of class `C^k`, `k ≥ 1`, has two
  geometrically distinct periodic billiard trajectories of every rotation type `(p, q)`
  (`ConvexTable.exists_two_periodic_orbits`);
* Layer 12: strong continuity of the Koopman representation on `L²` of a jointly measurable
  measure-preserving action of `ℝ` on a probability space, with no topology on the space
  (`continuous_compMeasurePreserving_vadd`), Wiener's lemma for finite measures on `ℝ`
  (`tendsto_average_norm_charFun_sq`), the continuous-time mean ergodic projection theorem for
  strongly continuous unitary groups, with the atomic-mass identity
  (`exists_tendsto_twistedAverage`), the eigenfunction criterion for weak mixing of
  measure-preserving actions of `ℝ` (`isWeaklyMixing_iff`), and the multiplier property of weak
  mixing: the product of a weakly mixing action with an ergodic one is ergodic
  (`ergodicVAdd_prod_of_isWeaklyMixing`).

Not statable at the pins, and therefore absent:

* Layer 8, measure preservation and reversibility of the billiard flow of a polygonal table: the
  pins have no carrier for the billiard flow of a polygon. The flow is the construction of
  Layers 7–8 (the phase space glued along the sides, trajectories through specular reflections,
  the singular set of states that reach a vertex, and the identity extension across it), not a
  simple definition over native data;
* Layer 9, non-ergodicity of the billiard flow of a rational polygon: it lacks the same flow;
* Layer 11, the Katok–Zemlyakov unfolding conjugacy between the billiard flow of a rational
  polygon in a direction class and the directional flow of its translation surface (for a
  direction fixed by a reflection of the reflection group, of the quotient of that surface by the
  reflection): it lacks the polygonal billiard flow, the glued translation surface of the polygon
  with its atlas, and the directional flows of translation surfaces (Layer 10), all constructions
  of this roadmap;
* Layer 11, the Euler characteristic and genus of the Katok–Zemlyakov surface: Tau Ceti's
  `TauCeti.eulerChar` needs a finite CW type on the glued surface, whose construction is part of
  the target.
-/

namespace TauCetiRoadmap.MathematicalBilliards

open MeasureTheory Filter Topology
open scoped InnerProductSpace

/-! ## Layer 1: Convex billiard tables -/

/-- A convex billiard table of class `C^k` (`1 ≤ k`) with perimeter `ℓ > 0`: an arclength
parametrisation `γ : ℝ → ℂ` of class `C^k`, `ℓ`-periodic, of unit speed, such that every point
`γ t` with `t − s ∉ ℓℤ` lies strictly to the left of the tangent line at `γ s`, that is
`Im (conj (γ' s) · (γ t − γ s)) > 0`. The strict inequality makes the curve strictly convex,
positively oriented and injective on `[0, ℓ)`; the curvature may vanish (Tabachnikov2005,
Chapter 3). -/
structure ConvexTable (k : ℕ∞) (ℓ : ℝ) [Fact (0 < ℓ)] where
  /-- The arclength parametrisation of the boundary. -/
  toFun : ℝ → ℂ
  /-- The regularity is at least `C¹`. -/
  one_le : 1 ≤ k
  /-- The parametrisation is of class `C^k`. -/
  contDiff : ContDiff ℝ k toFun
  /-- The parametrisation is `ℓ`-periodic. -/
  periodic : Function.Periodic toFun ℓ
  /-- The parametrisation has unit speed. -/
  norm_deriv : ∀ s, ‖deriv toFun s‖ = 1
  /-- Every other point of the curve lies strictly to the left of each tangent line. -/
  left_of_tangent : ∀ s t : ℝ, (∀ m : ℤ, t - s ≠ m * ℓ) →
    0 < (starRingEnd ℂ (deriv toFun s) * (toFun t - toFun s)).im

/-- The unit circle `s ↦ exp(is)`, of perimeter `2π`, is a convex table of class `C^∞`: the
defining quantity is `1 − cos(t − s)`, positive off `2πℤ`. So the carrier is inhabited and the
statements about tables below are not vacuous. (The clockwise circle `s ↦ exp(−is)` gives
`cos(t − s) − 1 < 0` and is not a table; README, §1.1.) -/
noncomputable example [Fact (0 < 2 * Real.pi)] : ConvexTable ⊤ (2 * Real.pi) where
  toFun s := Complex.exp (s * Complex.I)
  one_le := le_top
  contDiff := Complex.contDiff_exp.comp (Complex.ofRealCLM.contDiff.mul contDiff_const)
  periodic s := by
    simp only
    rw [show ((s + 2 * Real.pi : ℝ) : ℂ) * Complex.I = s * Complex.I + 2 * Real.pi * Complex.I by
      push_cast; ring, Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]
  norm_deriv s := by
    have : deriv (fun s : ℝ => Complex.exp (s * Complex.I)) s =
        Complex.I * Complex.exp (s * Complex.I) := by
      have h := ((hasDerivAt_id (s : ℂ)).mul_const Complex.I).cexp.comp_ofReal
      simp only [id, one_mul] at h
      rw [h.deriv, mul_comm]
    rw [this, norm_mul, Complex.norm_I, one_mul, Complex.norm_exp_ofReal_mul_I]
  left_of_tangent s t hst := by
    have hd : deriv (fun s : ℝ => Complex.exp (s * Complex.I)) s =
        Complex.I * Complex.exp (s * Complex.I) := by
      have h := ((hasDerivAt_id (s : ℂ)).mul_const Complex.I).cexp.comp_ofReal
      simp only [id, one_mul] at h
      rw [h.deriv, mul_comm]
    rw [hd]
    have key : (starRingEnd ℂ (Complex.I * Complex.exp (s * Complex.I)) *
        (Complex.exp (t * Complex.I) - Complex.exp (s * Complex.I))).im =
          1 - Real.cos (t - s) := by
      rw [map_mul, Complex.conj_I, ← Complex.exp_conj, map_mul, Complex.conj_ofReal, Complex.conj_I]
      rw [show -Complex.I * Complex.exp (↑s * -Complex.I) *
            (Complex.exp (↑t * Complex.I) - Complex.exp (↑s * Complex.I)) =
          -Complex.I * (Complex.exp (((t - s : ℝ) : ℂ) * Complex.I) - 1) by
        rw [mul_assoc, mul_sub, ← Complex.exp_add, ← Complex.exp_add]
        congr 2
        · congr 1; push_cast; ring
        · rw [show (s : ℂ) * -Complex.I + s * Complex.I = 0 by ring, Complex.exp_zero]]
      rw [Complex.exp_mul_I]
      simp [Complex.mul_im]
      rw [← Complex.ofReal_sub, Complex.cos_ofReal_re, Complex.sin_ofReal_im]
      ring
    rw [key, sub_pos]
    refine lt_of_le_of_ne (Real.cos_le_one _) fun h => ?_
    obtain ⟨n, hn⟩ := (Real.cos_eq_one_iff _).1 h
    exact hst n hn.symm

/-! ## Layer 2: The billiard ball map -/

/-- The lift of the billiard ball map to `ℝ × ℝ`, in the coordinates `(s, δ)`: for the unit
vector `e = exp(iδ) γ'(s)` at `γ s`, the exit parameter `s₁` is the infimum of the
`t ∈ (s, s + ℓ)` such that `γ t` lies on or to the left of the oriented line through `γ s` in
direction `e`, and the outgoing angle is `δ₁ = arccos ⟨e, γ'(s₁)⟩`. On the strip `0 < δ < π` that
set is `[s₁, s + ℓ)` and this is the billiard map `(s, δ) ↦ (s₁, δ₁)` normalised by
`s < s₁ < s + ℓ`; off the strip its values carry no meaning (at `δ = π` the set is empty). -/
noncomputable def ConvexTable.billiardLift {k : ℕ∞} {ℓ : ℝ} [Fact (0 < ℓ)]
    (T : ConvexTable k ℓ) (p : ℝ × ℝ) : ℝ × ℝ :=
  let e : ℂ := Complex.exp (p.2 * Complex.I) * deriv T.toFun p.1
  let s₁ : ℝ := sInf {t : ℝ | t ∈ Set.Ioo p.1 (p.1 + ℓ) ∧
    0 ≤ (starRingEnd ℂ e * (T.toFun t - T.toFun p.1)).im}
  (s₁, Real.arccos (starRingEnd ℂ e * deriv T.toFun s₁).re)

/-- The billiard ball map on `AddCircle ℓ × ℝ`, the quotient of `ConvexTable.billiardLift` by
`(s, δ) ↦ (s + ℓ, δ)`, computed through the representative of `s` in `[0, ℓ)`. The phase cylinder
is the open subset `AddCircle ℓ × (0, π)`. -/
noncomputable def ConvexTable.billiardMap {k : ℕ∞} {ℓ : ℝ} [Fact (0 < ℓ)]
    (T : ConvexTable k ℓ) (x : AddCircle ℓ × ℝ) : AddCircle ℓ × ℝ :=
  let q := T.billiardLift ((AddCircle.equivIco ℓ 0 x.1 : ℝ), x.2)
  ((q.1 : AddCircle ℓ), q.2)

/-! ## Layer 3: Generating function and invariant measure -/

/-- The invariant measure of the billiard map: the product of the Haar measure of `AddCircle ℓ`
(total mass `ℓ`) with `sin δ dδ` on `(0, π)`, as a measure on `AddCircle ℓ × ℝ` concentrated on the
phase cylinder; its total mass is `2ℓ`. -/
noncomputable def phaseMeasure (ℓ : ℝ) [Fact (0 < ℓ)] : Measure (AddCircle ℓ × ℝ) :=
  (volume : Measure (AddCircle ℓ)).prod
    ((volume.restrict (Set.Ioo 0 Real.pi)).withDensity fun δ => ENNReal.ofReal (Real.sin δ))

/-- The billiard ball map of every convex table (of class `C^k`, `k ≥ 1`, so possibly not
differentiable) preserves the measure `sin δ dδ ds` on the phase cylinder: through the oriented
lines it is a reversal of orientation composed with the time reversal `(s, δ) ↦ (s, π − δ)`, and
`sin δ dδ ds` is the invariant measure `dθ dc` on the space of oriented lines
(KatokHasselblatt1995, Section 9.2; BialyMironov2022, Section 2, p. 4, for smooth tables of
positive curvature). -/
theorem ConvexTable.measurePreserving_billiardMap {k : ℕ∞} {ℓ : ℝ} [Fact (0 < ℓ)]
    (T : ConvexTable k ℓ) :
    MeasurePreserving T.billiardMap (phaseMeasure ℓ) (phaseMeasure ℓ) := by
  sorry

/-! ## Layer 4: Twist maps of the annulus -/

/-- A positive twist lift with period `ℓ` on the closed strip `ℝ × [a, b]`: a homeomorphism `F`
commuting with `(x, y) ↦ (x + ℓ, y)`, mapping each boundary line into itself, with
`y ↦ F₁(x, y)` strictly increasing for every `x` (KatokHasselblatt1995, Section 9.2; Herman1983,
Chapitre I, 1.2, for the differentiable form). -/
def IsTwistLift (ℓ : ℝ) {a b : ℝ} (F : ℝ × Set.Icc a b ≃ₜ ℝ × Set.Icc a b) : Prop :=
  (∀ p : ℝ × Set.Icc a b, F (p.1 + ℓ, p.2) = ((F p).1 + ℓ, (F p).2)) ∧
  (∀ p : ℝ × Set.Icc a b, (p.2 : ℝ) = a → ((F p).2 : ℝ) = a) ∧
  (∀ p : ℝ × Set.Icc a b, (p.2 : ℝ) = b → ((F p).2 : ℝ) = b) ∧
  ∀ x : ℝ, StrictMono fun y : Set.Icc a b => (F (x, y)).1

/-- The non-wandering set of a self-map `f` of a topological space: the points `x` such that every
neighbourhood `U` of `x` meets its image under some iterate `f^[n]`, `n ≥ 1` (the standard
definition; Herman1983, Chapitre I, 3.4.3, works under the hypothesis that every point is
non-wandering). -/
def nonwanderingSet {X : Type*} [TopologicalSpace X] (f : X → X) : Set X :=
  {x | ∀ U ∈ 𝓝 x, ∃ n : ℕ, 0 < n ∧ (f^[n] '' U ∩ U).Nonempty}

/-! ## Layer 5: Rotational invariant curves -/

/-- A rotational invariant curve of a self-map `f` of the annulus `AddCircle ℓ × Y`: a set `C`
with `f '' C = C` that is the image of a continuous injective map from `Circle` which is not
null-homotopic (BialyMironov2022, Theorem 1.1, for the billiard setting). -/
def IsRotationalInvariantCurve {ℓ : ℝ} {Y : Type*} [TopologicalSpace Y]
    (f : AddCircle ℓ × Y → AddCircle ℓ × Y) (C : Set (AddCircle ℓ × Y)) : Prop :=
  f '' C = C ∧
    ∃ c : C(Circle, AddCircle ℓ × Y), Function.Injective c ∧ Set.range c = C ∧ ¬ c.Nullhomotopic

/-- Birkhoff's graph theorem: let `H` be a homeomorphism of the closed annulus
`AddCircle ℓ × [a, b]` with a lift `F` that is a positive twist lift or whose inverse is one, such
that every point of the open annulus is non-wandering for `H`. Then every rotational invariant
curve of `H` in the open annulus is the graph of a continuous function
`AddCircle ℓ → (a, b)` (Herman1983, Appendice au Chapitre I, Théorème de Birkhoff, p. 41;
KatokHasselblatt1995, Chapter 13). -/
theorem isGraph_of_isRotationalInvariantCurve {ℓ a b : ℝ} (hℓ : 0 < ℓ) (hab : a < b)
    (H : AddCircle ℓ × Set.Icc a b ≃ₜ AddCircle ℓ × Set.Icc a b)
    (F : ℝ × Set.Icc a b ≃ₜ ℝ × Set.Icc a b)
    (hHF : ∀ p : ℝ × Set.Icc a b, H ((p.1 : AddCircle ℓ), p.2) = (((F p).1 : AddCircle ℓ), (F p).2))
    (hF : IsTwistLift ℓ F ∨ IsTwistLift ℓ F.symm)
    (hnw : ∀ x : AddCircle ℓ × Set.Icc a b, (x.2 : ℝ) ∈ Set.Ioo a b → x ∈ nonwanderingSet H)
    {C : Set (AddCircle ℓ × Set.Icc a b)} (hCo : ∀ x ∈ C, (x.2 : ℝ) ∈ Set.Ioo a b)
    (hC : IsRotationalInvariantCurve H C) :
    ∃ ψ : AddCircle ℓ → ℝ, Continuous ψ ∧ (∀ x, ψ x ∈ Set.Ioo a b) ∧
      C = {x | (x.2 : ℝ) = ψ x.1} := by
  sorry

/-- Birkhoff's theorem for billiards: for a convex table of class `C^k`, `k ≥ 2`, every rotational
invariant curve of the billiard map in the phase cylinder `AddCircle ℓ × (0, π)` is the graph of a
Lipschitz function of `s` (Herman1983, Chapitre I, 2.2 and 5.2; BialyMironov2022, Section 3,
p. 6). -/
theorem ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve {k : ℕ∞} {ℓ : ℝ}
    [Fact (0 < ℓ)] (T : ConvexTable k ℓ) (hk : 2 ≤ k) {C : Set (AddCircle ℓ × ℝ)}
    (hCA : C ⊆ Set.univ ×ˢ Set.Ioo 0 Real.pi) (hC : IsRotationalInvariantCurve T.billiardMap C) :
    ∃ (K : NNReal) (ψ : AddCircle ℓ → ℝ), LipschitzWith K ψ ∧ C = {x | x.2 = ψ x.1} := by
  sorry

/-! ## Layer 6: Birkhoff periodic orbits -/

/-- A periodic configuration of type `(p, q)` of a convex table: for `q ≥ 1`, a sequence of
parameters `s : ℤ → ℝ` with `s (j + q) = s j + p ℓ` and `0 < s (j + 1) − s j < ℓ` (which force
`0 < p < q`), satisfying the reflection law at every vertex: the unit chords `u (j − 1)` and `u j`,
where `u j` points from `γ (s j)` to `γ (s (j + 1))`, have equal components along the tangent
`γ' (s j)`. These are the vertex sequences of the billiard trajectories of rotation type
`(p, q)`. -/
def ConvexTable.IsPeriodicConfiguration {k : ℕ∞} {ℓ : ℝ} [Fact (0 < ℓ)] (T : ConvexTable k ℓ)
    (p q : ℕ) (s : ℤ → ℝ) : Prop :=
  let u : ℤ → ℂ := fun j =>
    ‖T.toFun (s (j + 1)) - T.toFun (s j)‖⁻¹ • (T.toFun (s (j + 1)) - T.toFun (s j))
  0 < q ∧ (∀ j : ℤ, s (j + q) = s j + p * ℓ) ∧
    (∀ j : ℤ, s j < s (j + 1) ∧ s (j + 1) < s j + ℓ) ∧
    ∀ j : ℤ, inner ℝ (u (j - 1)) (deriv T.toFun (s j)) = inner ℝ (u j) (deriv T.toFun (s j))

/-- Birkhoff's theorem on periodic orbits: for a convex table of class `C^k`, `k ≥ 1`, and integers
`0 < p < q`, there are two periodic configurations of type `(p, q)` that are not related by a shift
of the index and a translation by a multiple of `ℓ`, that is, two geometrically distinct periodic
billiard orbits of rotation type `(p, q)` (KatokHasselblatt1995, Section 9.3, for coprime `p`,
`q`). The coprime case is the content: for `d = gcd(p, q)` a configuration of type
`(p / d, q / d)` is one of type `(p, q)`. -/
theorem ConvexTable.exists_two_periodic_orbits {k : ℕ∞} {ℓ : ℝ} [Fact (0 < ℓ)]
    (T : ConvexTable k ℓ) {p q : ℕ} (hp : 0 < p) (hpq : p < q) :
    ∃ s s' : ℤ → ℝ, T.IsPeriodicConfiguration p q s ∧ T.IsPeriodicConfiguration p q s' ∧
      ∀ m n : ℤ, ∃ j : ℤ, s' j ≠ s (j + m) + n * ℓ := by
  sorry

/-! ## Layer 12: Weak mixing of flows -/

/-- Weak mixing of an action of `ℝ` on a measure space: for all measurable `A` and `B`, the time
average over `[0, T]` of `|μ((t +ᵥ ·)⁻¹' A ∩ B) − μ(A) μ(B)|` tends to `0` as `T → ∞` (Hochman2012,
Theorem 6.1.7, for `ℤ`-actions; ChaikaForni2026, abstract and Theorem 1.1, p. 1, for billiard
flows). -/
def IsWeaklyMixing {X : Type*} [MeasurableSpace X] [AddAction ℝ X] (μ : Measure X) : Prop :=
  ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
    Tendsto (fun T : ℝ => T⁻¹ * ∫ t in (0 : ℝ)..T,
        |μ.real ((fun x => t +ᵥ x) ⁻¹' A ∩ B) - μ.real A * μ.real B|) atTop (𝓝 0)

/-- Strong continuity of the Koopman representation: for a jointly measurable action of `ℝ` on a
probability space preserving the measure, and every `f` in complex `L²(μ)`, the map
`t ↦ f ∘ (t +ᵥ ·)`, the pullback of `f` along the measure-preserving translate, is continuous from
`ℝ` to `L²(μ)`. No topology on the space and no separability of `L²(μ)` is assumed; for counting
measure on `ℝ` acting on itself the statement fails (Hochman2012, Section 6.6, for `ℤ`-actions,
where no continuity is needed). -/
theorem continuous_compMeasurePreserving_vadd {X : Type*} [MeasurableSpace X] [AddAction ℝ X]
    [MeasurableVAdd₂ ℝ X] (μ : Measure X) [IsProbabilityMeasure μ] [VAddInvariantMeasure ℝ X μ]
    (f : Lp ℂ 2 μ) :
    Continuous fun t : ℝ =>
      Lp.compMeasurePreserving (fun x : X => t +ᵥ x) (measurePreserving_vadd t μ) f := by
  sorry

/-- Wiener's lemma on the line: for a finite Borel measure `σ` on `ℝ`, the time averages
`T⁻¹ ∫₀ᵀ |charFun σ t|² dt` of the squared modulus of its characteristic function
`charFun σ t = ∫ exp(itξ) dσ(ξ)` converge, as `T → ∞`, to the sum `Σ_ξ σ({ξ})²` of the squared
masses of its atoms; all but countably many terms of the sum vanish and it is at most `σ(ℝ)²`
(Hochman2012, Proposition 6.6.3, for the atomless discrete analogue on the circle). -/
theorem tendsto_average_norm_charFun_sq (σ : Measure ℝ) [IsFiniteMeasure σ] :
    Tendsto (fun T : ℝ => T⁻¹ * ∫ t in (0 : ℝ)..T, ‖charFun σ t‖ ^ 2)
      atTop (𝓝 (∑' ξ : ℝ, σ.real {ξ} ^ 2)) := by
  sorry

/-- The continuous-time mean ergodic projection theorem: for a strongly continuous unitary group
`U` on a complex Hilbert space, a frequency `a` and a vector `v`, the twisted averages
`T⁻¹ ∫₀ᵀ exp(−2πiat) U_t v dt` converge to the orthogonal projection `w` of `v` onto the common
eigenspace `{u | ∀ t, U_t u = exp(2πiat) u}`; and `‖w‖²` is the mass at `2πa` of every finite
measure `σ` on `ℝ` whose characteristic function `charFun σ t = ∫ exp(itξ) dσ(ξ)` is
`t ↦ ⟪v, U_t v⟫` (Hochman2012, Lemma 6.6.2 and Proposition 6.6.3, for the discrete analogues). -/
theorem exists_tendsto_twistedAverage {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (U : TauCeti.Semigroups.StronglyContinuousGroup H) (hU : U.IsUnitary)
    (a : ℝ) (v : H) :
    ∃ w : H, (∀ t : ℝ, U t w = Complex.exp (2 * Real.pi * a * t * Complex.I) • w) ∧
      (∀ u : H, (∀ t : ℝ, U t u = Complex.exp (2 * Real.pi * a * t * Complex.I) • u) →
        ⟪u, v - w⟫_ℂ = 0) ∧
      Tendsto (fun T : ℝ => (T⁻¹ : ℂ) •
          ∫ t in (0 : ℝ)..T, Complex.exp (-(2 * Real.pi * a * t * Complex.I)) • U t v)
        atTop (𝓝 w) ∧
      ∀ σ : Measure ℝ, IsFiniteMeasure σ →
        (∀ t : ℝ, ⟪v, U t v⟫_ℂ = charFun σ t) →
        ‖w‖ ^ 2 = σ.real {2 * Real.pi * a} := by
  sorry

/-- The eigenfunction criterion: a jointly measurable measure-preserving action of `ℝ` on a
probability space is weakly mixing exactly when every measurable eigenfunction, a function `f`
with `f (t +ᵥ x) = exp(2πiat) f x` almost everywhere for every `t`, is almost everywhere constant
(Hochman2012, Theorem 6.4.7 and Corollary 6.6.4, for `ℤ`-actions; ChaikaForni2026, Theorem 1.3,
p. 3, works with eigenvalues of directional flows). -/
theorem isWeaklyMixing_iff {X : Type*} [MeasurableSpace X] [AddAction ℝ X] [MeasurableVAdd₂ ℝ X]
    (μ : Measure X) [IsProbabilityMeasure μ] [VAddInvariantMeasure ℝ X μ] :
    IsWeaklyMixing μ ↔ ∀ (f : X → ℂ) (a : ℝ), Measurable f →
      (∀ t : ℝ, (fun x => f (t +ᵥ x)) =ᵐ[μ]
        fun x => Complex.exp (2 * Real.pi * a * t * Complex.I) * f x) →
      ∃ c : ℂ, f =ᵐ[μ] fun _ => c := by
  sorry

/-- The multiplier property of weak mixing: let `ℝ` act jointly measurably on `X` and on `Y`,
preserving probability measures `μ` and `ν`. If the action on `X` is weakly mixing and the action
on `Y` is ergodic, then the diagonal action `t +ᵥ (x, y) = (t +ᵥ x, t +ᵥ y)` on `X × Y` is ergodic
for `μ.prod ν` (Hochman2012, Proposition 6.2.1, for `ℤ`-actions). -/
theorem ergodicVAdd_prod_of_isWeaklyMixing {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    [AddAction ℝ X] [AddAction ℝ Y] [MeasurableVAdd₂ ℝ X] [MeasurableVAdd₂ ℝ Y]
    (μ : Measure X) (ν : Measure Y) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    [VAddInvariantMeasure ℝ X μ] [ErgodicVAdd ℝ Y ν] (hμ : IsWeaklyMixing μ) :
    ErgodicVAdd ℝ (X × Y) (μ.prod ν) := by
  sorry

end TauCetiRoadmap.MathematicalBilliards
