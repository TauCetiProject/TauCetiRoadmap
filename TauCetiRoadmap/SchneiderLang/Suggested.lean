import Mathlib

/-!
# The Schneider–Lang criterion and Baker's theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the layers, the conventions, the worked examples and the references) is
in `README.md`. Mathlib has power series in the sense of `FormalMultilinearSeries`, the one-variable
Cauchy and Schwarz estimates, the house of an algebraic number and Siegel's lemma; it has no
multi-index Taylor coefficients, no estimates on polydiscs, and no transcendence theorem for the
exponential function. We build those here in `TauCeti/`.

The two definitions below fix the conventions of Layer 0: `coeff` is the multi-index coefficient
of a formal series on `ι → 𝕜`, and `taylorCoeff` is the Taylor coefficient of a function at a
point, `0` where the function is not analytic. Every later statement is phrased through them.
The targets elaborate against the pinned Mathlib and are stated with `sorry` (allowed in this
human-owned roadmap library).
-/

open scoped NNReal

namespace TauCetiRoadmap.SchneiderLang

/-! ## Layer 0: multi-index power series -/

section Layer0

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜] {ι : Type*} [Fintype ι] [DecidableEq ι]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F]

/-- **Layer 0.3, the multi-index coefficient** of a formal series on `ι → 𝕜`: the sum of
`p (∑ i, α i)` over the tuples of basis vectors in which each basis vector `Pi.single i 1`
occurs `α i` times. -/
noncomputable def coeff (p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F) (α : ι → ℕ) : F :=
  ∑ g ∈ Finset.univ.filter (fun g : Fin (∑ i, α i) → ι =>
      ∀ i, (Finset.univ.filter fun j => g j = i).card = α i),
    p (∑ i, α i) fun j => Pi.single (g j) (1 : 𝕜)

/-- **Layer 0.3, the degree-`k` term in multi-index form.** -/
example (p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F) (k : ℕ) (z : ι → 𝕜) :
    p k (fun _ => z) = ∑ α ∈ Finset.univ.piAntidiag k, (∏ i, z i ^ α i) • coeff p α :=
  sorry

/-- **Layer 0.3, an analytic function is the sum of its multi-index series** wherever the
homogeneous terms converge normally. -/
example [CompleteSpace F] {f : (ι → 𝕜) → F} {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F}
    {r : ℝ≥0} (hf : HasFPowerSeriesOnBall f p 0 r) {z : ι → 𝕜} (hz : ‖z‖ < r)
    (h : Summable fun k => (Fintype.card ι : ℝ) ^ k * ‖p k‖ * ‖z‖ ^ k) :
    HasSum (fun α : ι → ℕ => (∏ i, z i ^ α i) • coeff p α) (f z) :=
  sorry

/-- **Layer 0.3, a normally convergent multi-index series has a power series** on the polydisc,
whose multi-index coefficients are the given ones. -/
example [CompleteSpace F] (c : (ι → ℕ) → F) {r : ℝ≥0} (hr : 0 < r)
    (hsum : Summable fun α : ι → ℕ => ‖c α‖ * (r : ℝ) ^ (∑ i, α i)) :
    ∃ p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F,
      HasFPowerSeriesOnBall (fun z : ι → 𝕜 => ∑' α : ι → ℕ, (∏ i, z i ^ α i) • c α) p 0 r ∧
        ∀ α, coeff p α = c α :=
  sorry

/-- **Layer 0.3, the identity theorem in coefficient form.** -/
example {f : (ι → 𝕜) → F} {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F} {x : ι → 𝕜}
    (hf : HasFPowerSeriesAt f p x) (h0 : f =ᶠ[nhds x] 0) (α : ι → ℕ) : coeff p α = 0 :=
  sorry

/-- **Layer 0.4, the Taylor coefficient** of `f` at `x`: the coefficient of `(z - x) ^ α` in the
expansion of `f` about `x`, and `0` where `f` is not analytic at `x`. -/
noncomputable def taylorCoeff (f : (ι → 𝕜) → F) (x : ι → 𝕜) (α : ι → ℕ) : F :=
  open Classical in if h : AnalyticAt 𝕜 f x then coeff h.choose α else 0

/-- **Layer 0.4, independence of the chosen series.** -/
example {f : (ι → 𝕜) → F} {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F} {x : ι → 𝕜}
    (hp : HasFPowerSeriesAt f p x) (α : ι → ℕ) : taylorCoeff f x α = coeff p α :=
  sorry

/-- **Layer 0.4, agreement with iterated derivatives**: `D^α f (x) = α! • taylorCoeff f x α`,
for any tuple of basis vectors with counts `α`. -/
example [CompleteSpace F] {f : (ι → 𝕜) → F} {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x) (α : ι → ℕ)
    (v : Fin (∑ i, α i) → ι) (hv : ∀ i, (Finset.univ.filter fun j => v j = i).card = α i) :
    (∏ i, (α i).factorial) • taylorCoeff f x α =
      iteratedFDeriv 𝕜 (∑ i, α i) f x (fun j => Pi.single (v j) 1) :=
  sorry

/-- **Layer 0.4, the local expansion** of an analytic function, normally convergent on a
polydisc. -/
example [CompleteSpace F] {f : (ι → 𝕜) → F} {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x) :
    ∃ ρ : ℝ≥0, 0 < ρ ∧
      Summable (fun α : ι → ℕ => ‖taylorCoeff f x α‖ * (ρ : ℝ) ^ (∑ i, α i)) ∧
      ∀ y : ι → 𝕜, ‖y‖ < ρ →
        HasSum (fun α : ι → ℕ => (∏ i, y i ^ α i) • taylorCoeff f x α) (f (x + y)) :=
  sorry

/-- **Layer 0.4, coefficients from an expansion.** -/
example [CompleteSpace F] {f : (ι → 𝕜) → F} {x : ι → 𝕜} {c : (ι → ℕ) → F} {ρ : ℝ≥0}
    (hρ : 0 < ρ) (hsum : Summable fun α : ι → ℕ => ‖c α‖ * (ρ : ℝ) ^ (∑ i, α i))
    (h : ∀ y : ι → 𝕜, ‖y‖ < ρ →
      HasSum (fun α : ι → ℕ => (∏ i, y i ^ α i) • c α) (f (x + y)))
    (α : ι → ℕ) : taylorCoeff f x α = c α :=
  sorry

/-- **Layer 0.4, a linear change of variables preserves vanishing in each total degree.** -/
example {κ : Type*} [Fintype κ] [DecidableEq κ] {G : (ι → 𝕜) → F}
    (A : (κ → 𝕜) →L[𝕜] (ι → 𝕜)) {x : κ → 𝕜} (hG : AnalyticAt 𝕜 G (A x)) {k : ℕ}
    (h : ∀ α : ι → ℕ, ∑ i, α i = k → taylorCoeff G (A x) α = 0) :
    ∀ β : κ → ℕ, ∑ j, β j = k → taylorCoeff (G ∘ A) x β = 0 :=
  sorry

/-- **Layer 0.5, the divided difference in one coordinate is analytic**, across the hyperplane
`z i = ζ` as well as off it. -/
example [CompleteSpace F] {f : (ι → 𝕜) → F} (i : ι) (ζ : 𝕜) {x : ι → 𝕜}
    (hf : AnalyticAt 𝕜 f x) (hres : AnalyticAt 𝕜 f (Function.update x i ζ)) :
    AnalyticAt 𝕜 (fun z : ι → 𝕜 => dslope (fun w => f (Function.update z i w)) ζ (z i)) x :=
  sorry

end Layer0

/-! ## Layer 1: estimates on polydiscs -/

section Layer1

variable {ι : Type*} [Fintype ι] [DecidableEq ι]
  {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]

/-- **Layer 1.4, Cauchy's inequality on a polydisc.** -/
example {f : (ι → ℂ) → V} {p : FormalMultilinearSeries ℂ (ι → ℂ) V} {R : ℝ≥0}
    (hf : HasFPowerSeriesOnBall f p 0 R) {M : ℝ} (hM : ∀ y : ι → ℂ, ‖y‖ < R → ‖f y‖ ≤ M)
    (α : ι → ℕ) {ρ : ℝ} (hρ0 : 0 ≤ ρ) (hρ : ρ < R) :
    ‖coeff p α‖ * ρ ^ (∑ i, α i) ≤ M :=
  sorry

/-- **Layer 1.5, the Taylor remainder** (Waldschmidt, Lemma 4.13, with the constant `1 + T`). -/
example {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] {f : E → V}
    {p : FormalMultilinearSeries ℂ E V} {R : ℝ≥0} (hf : HasFPowerSeriesOnBall f p 0 R) {M : ℝ}
    (hM : ∀ y : E, ‖y‖ < R → ‖f y‖ ≤ M) (T : ℕ) {z : E} (hz : ‖z‖ < R) :
    ‖f z - p.partialSum T z‖ ≤ (1 + T) * M * (‖z‖ / R) ^ T :=
  sorry

/-- **Layer 1.6, Schwarz's lemma for Cartesian products** (Waldschmidt, Proposition 4.7), in the
form used by the criterion. -/
example [Nonempty ι] {f : (ι → ℂ) → V} {E : ι → Finset ℂ} {S m : ℕ} (hE : ∀ i, (E i).card = S)
    {r R M : ℝ} (hr : 0 ≤ r) (hR : 0 < R) (h5 : 5 * r ≤ R) (hEr : ∀ i, ∀ ζ ∈ E i, ‖ζ‖ ≤ r)
    (hf : ∀ y : ι → ℂ, ‖y‖ ≤ R → AnalyticAt ℂ f y)
    (hM : ∀ y : ι → ℂ, ‖y‖ ≤ R → ‖f y‖ ≤ M)
    (hvan : ∀ ξ : ι → ℂ, (∀ i, ξ i ∈ E i) → ∀ κ : ι → ℕ, (∀ i, κ i < m) →
      taylorCoeff f ξ κ = 0)
    {z : ι → ℂ} (hz : ‖z‖ ≤ r) :
    ‖f z‖ ≤ Fintype.card ι * (5 * 3 ^ Fintype.card ι * r / R) ^ (m * S) * M :=
  sorry

end Layer1

/-! ## Layer 2: exponential polynomials -/

section Layer2

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- **Layer 2.1, Taylor coefficients of an exponential monomial** (Waldschmidt, Lemma 4.9). -/
example (τ σ : ι → ℕ) (w ξ : ι → ℂ) :
    taylorCoeff (fun z : ι → ℂ => (∏ v, z v ^ τ v) * Complex.exp (∑ v, w v * z v)) ξ σ =
      Complex.exp (∑ v, w v * ξ v) * ∏ v, ∑ j ∈ Finset.range (σ v + 1),
        ((τ v).choose j : ℂ) * ξ v ^ (τ v - j) * (w v ^ (σ v - j) / (σ v - j).factorial) :=
  sorry

/-- **Layer 2.3, linear independence of exponential polynomials** with distinct frequencies. -/
example (T : Finset (ι → ℂ)) (P : (ι → ℂ) → MvPolynomial ι ℂ)
    (hP : ∀ z : ι → ℂ, ∑ w ∈ T, MvPolynomial.eval z (P w) * Complex.exp (∑ v, w v * z v) = 0) :
    ∀ w ∈ T, P w = 0 :=
  sorry

end Layer2

/-! ## Layer 3: arithmetic -/

section Layer3

open NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 3.1, Liouville's inequality** for an algebraic integer. -/
example {α : 𝓞 K} (hα : α ≠ 0) (σ : K →+* ℂ) :
    1 ≤ ‖σ (α : K)‖ * house (α : K) ^ (Module.finrank ℚ K - 1) :=
  sorry

/-- **Layer 3.2, Liouville's inequality for a number of known size**: `δ ^ a * α` is a nonzero
algebraic integer of house at most `H`. -/
example {δ a : ℕ} (hδ : δ ≠ 0) {α : K} (hα : α ≠ 0) {H : ℝ}
    (hint : IsIntegral ℤ ((δ : K) ^ a * α)) (hH : house ((δ : K) ^ a * α) ≤ H) (σ : K →+* ℂ) :
    1 ≤ (δ : ℝ) ^ a * ‖σ α‖ * H ^ (Module.finrank ℚ K - 1) :=
  sorry

/-- **Layer 3.4, Thue–Siegel's lemma for complex linear forms** (Waldschmidt, Lemma 4.12). -/
example {ι κ : Type*} [Fintype ι] [Fintype κ] (u : ι → κ → ℂ) {U V : ℝ}
    (hU : ∀ j, ∑ i, ‖u i j‖ ≤ Real.exp U) {X : ℕ} (hX : 0 < X) (hι : 0 < Fintype.card ι)
    (hcard : (Real.sqrt 2 * X * Real.exp (U + V) + 1) ^ (2 * Fintype.card κ) ≤
      ((X : ℝ) + 1) ^ Fintype.card ι) :
    ∃ ξ : ι → ℤ, ξ ≠ 0 ∧ (∀ i, |ξ i| ≤ (X : ℤ)) ∧
      ∀ j, ‖∑ i, u i j * (ξ i : ℂ)‖ ≤ Real.exp (-V) :=
  sorry

end Layer3

/-! ## Layer 4: the auxiliary function -/

/-- **Layer 4.1, the auxiliary function** (Waldschmidt, Proposition 4.10). -/
example {ι Λ : Type*} [Fintype ι] [Fintype Λ] (hι : 0 < Fintype.card ι)
    {φ : Λ → (ι → ℂ) → ℂ} {P : Λ → FormalMultilinearSeries ℂ (ι → ℂ) ℂ} {R : ℝ≥0}
    (hφ : ∀ l, HasFPowerSeriesOnBall (φ l) (P l) 0 R)
    {M : Λ → ℝ} (hM : ∀ l (y : ι → ℂ), ‖y‖ < R → ‖φ l y‖ ≤ M l)
    {N U V r : ℝ} (hN : 0 < N) (hr : 0 < r) (hMU : ∑ l, M l ≤ Real.exp U)
    (hW : 12 * (Fintype.card ι : ℝ) ^ 2 ≤ N + U + V)
    (hRr : Real.exp 1 ≤ R / r) (hRr' : R / r ≤ Real.exp ((N + U + V) / 6))
    (hL : (2 * (N + U + V)) ^ (Fintype.card ι + 1) ≤
      Fintype.card Λ * N * Real.log (R / r) ^ Fintype.card ι) :
    ∃ p : Λ → ℤ, p ≠ 0 ∧ (∀ l, |(p l : ℝ)| ≤ Real.exp N) ∧
      ∀ z : ι → ℂ, ‖z‖ ≤ r → ‖∑ l, (p l : ℂ) * φ l z‖ ≤ Real.exp (-V) :=
  sorry

/-! ## Layer 5: the criterion of Schneider–Lang for `ℂ^{d₀} × (ℂˣ)^{d₁}` -/

/-- **Layer 5.1, the criterion** (Waldschmidt, Corollary 4.2). -/
example {d₀ d₁ n : ℕ} (hd₀ : d₀ ≤ n) (hn : n < d₀ + d₁)
    (x : Fin d₁ → Fin n → ℂ) (hx : ∀ i v, IsAlgebraic ℚ (x i v)) (hxli : LinearIndependent ℚ x)
    (y : Fin n → Fin n → ℂ) (hyli : LinearIndependent ℂ y) :
    (∃ (h : Fin d₀) (j : Fin n), Transcendental ℚ (y j (Fin.castLE hd₀ h))) ∨
      ∃ (i : Fin d₁) (j : Fin n), Transcendental ℚ (Complex.exp (∑ v, x i v * y j v)) :=
  sorry

/-- **Layer 5.4, Hermite–Lindemann**, branch-free. -/
example {x : ℂ} (hx : x ≠ 0) (h : IsAlgebraic ℚ (Complex.exp x)) : Transcendental ℚ x :=
  sorry

/-- **Layer 5.4, Hermite–Lindemann**, for the exponential of an algebraic number. -/
example {β : ℂ} (hβ : IsAlgebraic ℚ β) (hβ0 : β ≠ 0) : Transcendental ℚ (Complex.exp β) :=
  sorry

/-- **Layer 5.5, Gelfond–Schneider**, branch-free. -/
example {x b : ℂ} (hx : x ≠ 0) (h : IsAlgebraic ℚ (Complex.exp x)) (hb : IsAlgebraic ℚ b)
    (hb' : ∀ q : ℚ, b ≠ q) : Transcendental ℚ (Complex.exp (b * x)) :=
  sorry

/-- **Layer 5.5, Gelfond–Schneider**, in Mathlib's principal branch. This is the statement of
`GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational` in Mathlib PR #42911, whose
name and form the Tau Ceti theorem takes. -/
example (α β : ℂ) (hα : IsAlgebraic ℚ α) (hβ : IsAlgebraic ℚ β) (htriv : α ≠ 0 ∧ α ≠ 1)
    (hirr : ∀ i j : ℤ, β ≠ i / j) : Transcendental ℚ (α ^ β) :=
  sorry

/-- **Layer 5.5, quotients of logarithms** are rational or transcendental. -/
example {x y : ℂ} (hx : IsAlgebraic ℚ (Complex.exp x)) (hy : IsAlgebraic ℚ (Complex.exp y))
    (hx0 : x ≠ 0) : (∃ q : ℚ, y / x = q) ∨ Transcendental ℚ (y / x) :=
  sorry

/-! ## Layer 6: Baker's theorem -/

/-- **Layer 6.1** (Waldschmidt, Theorem 4.5). -/
example (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K] {d : ℕ}
    (hd : Module.finrank ℚ K = d) (β : Fin d → K) (hβ : LinearIndependent ℚ β)
    (l : Fin d → ℂ) (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    (hsum : IsAlgebraic ℚ (∑ i, (β i : ℂ) * l i)) : ∀ i, l i = 0 :=
  sorry

/-- **Layer 6.2, Baker's theorem** (Waldschmidt, Theorem 1.6). -/
example {ι : Type*} [Fintype ι] {l : ι → ℂ} (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    (hli : LinearIndependent ℚ l) {β₀ : ℂ} {β : ι → ℂ} (hβ₀ : IsAlgebraic ℚ β₀)
    (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hrel : β₀ + ∑ i, β i * l i = 0) :
    β₀ = 0 ∧ ∀ i, β i = 0 :=
  sorry

/-- **Layer 6.3** (Baker, Theorem 2.1): no independence hypothesis is needed when `β₀ ≠ 0`. -/
example {ι : Type*} [Fintype ι] {l : ι → ℂ} (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    {β₀ : ℂ} {β : ι → ℂ} (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hβ₀0 : β₀ ≠ 0) : β₀ + ∑ i, β i * l i ≠ 0 :=
  sorry

/-- **Layer 6.3** (Baker, Theorem 2.2): a nonzero linear form in logarithms is transcendental. -/
example {ι : Type*} [Fintype ι] {l : ι → ℂ} (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    {β : ι → ℂ} (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hΛ : ∑ i, β i * l i ≠ 0) :
    Transcendental ℚ (∑ i, β i * l i) :=
  sorry

/-- **Layer 6.3** (Baker, Theorem 2.3). -/
example {ι : Type*} [Fintype ι] {l : ι → ℂ} (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    {β₀ : ℂ} {β : ι → ℂ} (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hβ₀0 : β₀ ≠ 0) : Transcendental ℚ (Complex.exp (β₀ + ∑ i, β i * l i)) :=
  sorry

/-- **Layer 6.3** (Baker, Theorem 2.4), in Mathlib's principal branch. -/
example {ι : Type*} [Fintype ι] [Nonempty ι] {α β : ι → ℂ} (hα : ∀ i, IsAlgebraic ℚ (α i))
    (hα0 : ∀ i, α i ≠ 0) (hα1 : ∀ i, α i ≠ 1) (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hβli : LinearIndependent ℚ (fun o : Option ι => o.elim 1 β)) :
    Transcendental ℚ (∏ i, α i ^ β i) :=
  sorry

/-! ## Worked examples -/

example : Transcendental ℚ (Real.exp 1) := sorry

example : Transcendental ℚ Real.pi := sorry

example : Transcendental ℚ (Real.exp Real.pi) := sorry

example : Transcendental ℚ ((2 : ℂ) ^ (Real.sqrt 2 : ℂ)) := sorry

example : Transcendental ℚ (Real.log 2) := sorry

example : Transcendental ℚ (Real.log 2 / Real.log 3) := sorry

example : Transcendental ℚ (Real.pi + Real.log 2) := sorry

end TauCetiRoadmap.SchneiderLang
