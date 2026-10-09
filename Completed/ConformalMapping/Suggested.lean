import Mathlib
import TauCeti.Analysis.Complex.Conformal.Biholomorph
import TauCeti.Analysis.Complex.Conformal.BoundaryCorrespondence
import TauCeti.Analysis.Complex.Conformal.Caratheodory
import TauCeti.Analysis.Complex.Conformal.Hurwitz
import TauCeti.Analysis.Complex.Conformal.Jordan.Approach
import TauCeti.Analysis.Complex.Conformal.LocalDegree
import TauCeti.Analysis.Complex.Conformal.Monodromy
import TauCeti.Analysis.Complex.Conformal.Montel.Basic
import TauCeti.Analysis.Complex.Conformal.Morera
import TauCeti.Analysis.Complex.Conformal.Poincare.MetricSpace
import TauCeti.Analysis.Complex.Conformal.Reflection.Arc
import TauCeti.Analysis.Complex.Conformal.Reflection.Basic
import TauCeti.Analysis.Complex.Conformal.Reflection.Circle.Conjugate
import TauCeti.Analysis.Complex.Conformal.Reflection.Circle.Principle
import TauCeti.Analysis.Complex.Conformal.Reflection.Principle
import TauCeti.Analysis.Complex.Conformal.Removability.Arc
import TauCeti.Analysis.Complex.Conformal.RiemannMapping.Conformal
import TauCeti.Analysis.Complex.Conformal.RiemannMapping.Existence
import TauCeti.Analysis.Complex.Conformal.RiemannMapping.Uniqueness
import TauCeti.Analysis.Complex.Conformal.Rouche
import TauCeti.Analysis.Complex.Conformal.SchwarzChristoffel.Integrand
import TauCeti.Analysis.Complex.Conformal.SchwarzChristoffel.JordanPolygon
import TauCeti.Analysis.Complex.Conformal.SchwarzChristoffel.Primitive
import TauCeti.Analysis.Complex.Conformal.SchwarzChristoffel.Vertex
import TauCeti.Analysis.Complex.Conformal.SchwarzPick.Basic
import TauCeti.Analysis.Complex.Conformal.UnitDisc.Automorphism.Group
import TauCeti.Analysis.Complex.Conformal.Vitali

/-!
# Conformal mapping and geometric function theory: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for the milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

Every milestone of `README.md`, layers L0 to L6 with their named companions and the conventions
of its generality bar, has a statement here in the form the roadmap asks for, closed by the Tau
Ceti declaration that realizes it, so the correspondence is checked by the Lean kernel rather
than asserted in prose. No statement is left as `sorry`. That is evidence for completion, not its
criterion: completion is judged by a milestone-by-milestone audit against `README.md`, which a
`sorry`-free file of suggested forms cannot replace.

The earlier version of this file stated six milestones with `sorry` (Hurwitz, Montel,
Schwarz-Pick, the Riemann mapping theorem, the antiholomorphic-composition lemma L4.0 and Schwarz
reflection across the real axis) and gave no signatures for L5 and L6. All six are carried over
below in their original form, except that the Riemann mapping theorem now takes exactly the
README's hypotheses (`Ω.Nonempty` in place of the old `IsConnected Ω`, which simple connectivity
already implies). L5 and L6 are now stated against the Tau Ceti vocabulary (`IsJordanDomain`,
`schwarzChristoffelPrimitive`) that did not exist when that file was written. The following
differences from the README's wording are deliberate.

* Tau Ceti's Hurwitz and Vitali take `IsPreconnected` rather than `IsConnected` domains, and
  Hurwitz is stated along an arbitrary nontrivial filter. Both are generalizations; the sequence
  form over a connected `Ω` is recovered below.
* Montel is proved in Tau Ceti for maps into any proper complex normed space, and the monodromy
  theorem for germs valued in any complex Banach space. The README asks for scalar `ℂ`; both are
  stated here at `ℂ`, which is a specialization of the Tau Ceti theorems.
* Simple connectivity is Mathlib's `IsSimplyConnected Ω`, which is by definition
  `SimplyConnectedSpace ↥Ω`, the class the README names. It already implies `Ω` nonempty.
* Reflection across an analytic arc is stated through a biholomorphic chart straightening the
  arc (`chartedSchwarzReflection`), and reflection across a circle through Euclidean inversion
  (`circleSchwarzReflection`); the README's "Möbius reduction" is the special case where the
  chart is a Möbius map. Painlevé removability across an arc uses the same charts.
* Carathéodory (L5) is for bounded Jordan domains, the README's "Jordan-domain case". Tau Ceti's
  `IsJordanDomain` builds boundedness into the definition, as the interior of a Jordan curve.
* Schwarz-Christoffel (L6) is certified for bounded polygonal Jordan domains, with corner angles
  in `(0, 2π)`, together with the angle sum and the forms with one vertex at infinity (a sector
  end or a half-strip end) that Tau Ceti also proves.

Not part of the completion judgment, by the README's own text: the general prime-ends
correspondence ("not part of the L5 milestone"), the modular `λ`-uniformization (owned by the
`ModularForms` roadmap), and the argument principle, residues and winding numbers (owned by the
completed `ContourIntegration` roadmap, which L0 consumes). Also outside the milestones are the
items the generated `STATUS.md` lists as open: Schwarz-Christoffel ends at infinity with parallel
sides (the half-strip case has since been proved, see below) or with several vertices at
infinity, and a univalence criterion for the converse direction (when a given primitive is
injective); the README's L6 asks for neither. The README's commitment to
delete `TauCeti.riemannMapping` if Mathlib's Riemann mapping theorem (mathlib4#33505) lands is
conditional; at the pinned Mathlib, `Mathlib/Analysis/Complex/RiemannMapping.lean` still holds
only the partial results, so it is not triggered.
-/

namespace TauCetiRoadmap.ConformalMapping

open Complex Filter Metric Set Topology UpperHalfPlane TauCeti
open scoped OnePoint

/-! ## L0: the local-mapping engine -/

/-- **L0: Hurwitz.** A locally-uniform limit of nowhere-zero holomorphic functions on a connected
open set is either nowhere zero or identically zero. -/
example {Ω : Set ℂ} (hΩ : IsOpen Ω) (hconn : IsConnected Ω) {f : ℕ → ℂ → ℂ} {g : ℂ → ℂ}
    (hf : ∀ n, DifferentiableOn ℂ (f n) Ω) (_hg : DifferentiableOn ℂ g Ω)
    (hconv : TendstoLocallyUniformlyOn f g atTop Ω)
    (hne : ∀ n, ∀ z ∈ Ω, f n z ≠ 0) :
    (∀ z ∈ Ω, g z ≠ 0) ∨ (∀ z ∈ Ω, g z = 0) :=
  hurwitz hΩ hconn.isPreconnected (.of_forall hf) hconv (.of_forall hne)

/-- **Hurwitz, injective form** (the form the Riemann mapping proof consumes). A locally-uniform
limit of injective holomorphic maps on a connected open set is injective or constant. -/
example {Ω : Set ℂ} (hΩ : IsOpen Ω) (hconn : IsConnected Ω) {f : ℕ → ℂ → ℂ} {g : ℂ → ℂ}
    (hf : ∀ n, DifferentiableOn ℂ (f n) Ω) (hconv : TendstoLocallyUniformlyOn f g atTop Ω)
    (hinj : ∀ n, InjOn (f n) Ω) :
    InjOn g Ω ∨ ∃ v, ∀ z ∈ Ω, g z = v :=
  hurwitz_injOn hΩ hconn.isPreconnected (.of_forall hf) hconv (.of_forall hinj)

/-- **L0: Rouché.** If `‖f - g‖ < ‖f‖` on the circle, then `f` and `g` have the same number of
zeros, counted with multiplicity, in the open disc. -/
example {f g : ℂ → ℂ} {c : ℂ} {R : ℝ} (hR : 0 < R)
    (hf : AnalyticOnNhd ℂ f (closedBall c R)) (hg : AnalyticOnNhd ℂ g (closedBall c R))
    (hs : ∀ z ∈ sphere c R, ‖f z - g z‖ < ‖f z‖) :
    (∑ᶠ z ∈ ball c R, analyticOrderNatAt f z) = ∑ᶠ z ∈ ball c R, analyticOrderNatAt g z :=
  rouche hR hf hg hs

/-- **L0: Morera, as a named theorem.** A continuous function whose rectangle integrals vanish
on an open set (Mathlib's `IsConservativeOn`) is holomorphic there. -/
example {U : Set ℂ} {f : ℂ → ℂ} (hU : IsOpen U) (hcont : ContinuousOn f U)
    (hcons : ∀ z w, Rectangle z w ⊆ U → wedgeIntegral z w f = -wedgeIntegral w z f) :
    DifferentiableOn ℂ f U :=
  morera hU hcont hcons

/-- **L0: the open-mapping degree.** Near an isolated value `f z₀` of an analytic `f`, every
nearby value `w` is attained in a small disc exactly as often, with multiplicity, as `f z₀` is,
namely the order of vanishing of `f - f z₀` at `z₀`. -/
example {f : ℂ → ℂ} {z₀ : ℂ} (hf : AnalyticAt ℂ f z₀)
    (hisol : ∀ᶠ z in 𝓝[≠] z₀, f z ≠ f z₀) :
    ∃ r > 0, AnalyticOnNhd ℂ f (closedBall z₀ r) ∧
      ∃ δ > 0, ∀ w : ℂ, ‖w - f z₀‖ < δ →
        (∑ᶠ z ∈ ball z₀ r, analyticOrderNatAt (fun ζ => f ζ - w) z)
          = analyticOrderNatAt (fun ζ => f ζ - f z₀) z₀ :=
  exists_localDegree hf hisol

/-- A holomorphic map is locally injective exactly where its derivative does not vanish, the
degree-one case of the local degree. -/
example {f : ℂ → ℂ} {z₀ : ℂ} (hf : AnalyticAt ℂ f z₀) :
    (∃ V ∈ 𝓝 z₀, InjOn f V) ↔ deriv f z₀ ≠ 0 :=
  exists_injOn_nhds_iff_deriv_ne_zero hf

/-! ## L1: normal families -/

/-- **L1: Montel / normal families.** A sequence of holomorphic functions, uniformly bounded on
every compact subset of an open set, has a subsequence converging locally uniformly to a
holomorphic limit. -/
example {Ω : Set ℂ} (hΩ : IsOpen Ω) {f : ℕ → ℂ → ℂ}
    (hf : ∀ n, DifferentiableOn ℂ (f n) Ω)
    (hb : ∀ K ⊆ Ω, IsCompact K → ∃ C, ∀ n, ∀ z ∈ K, ‖f n z‖ ≤ C) :
    ∃ (φ : ℕ → ℕ) (g : ℂ → ℂ), StrictMono φ ∧ DifferentiableOn ℂ g Ω ∧
      TendstoLocallyUniformlyOn (fun n => f (φ n)) g atTop Ω :=
  montel hΩ hf hb

/-- Local boundedness in Tau Ceti is exactly the README's "bounded on each compact `K ⊆ Ω`". -/
example {Ω : Set ℂ} {f : ℕ → ℂ → ℂ} :
    IsLocallyBoundedOn f Ω ↔ ∀ K ⊆ Ω, IsCompact K → ∃ C, ∀ n, ∀ z ∈ K, ‖f n z‖ ≤ C :=
  Iff.rfl

/-- **L1: Vitali.** A locally bounded sequence of holomorphic functions on a connected open set
that converges pointwise on a set with an accumulation point in `Ω` converges locally uniformly
on `Ω` to a holomorphic limit. -/
example {Ω A : Set ℂ} {f : ℕ → ℂ → ℂ} (hΩ : IsOpen Ω) (hconn : IsConnected Ω)
    (hf : ∀ n, DifferentiableOn ℂ (f n) Ω)
    (hb : ∀ K ⊆ Ω, IsCompact K → ∃ C, ∀ n, ∀ z ∈ K, ‖f n z‖ ≤ C)
    (hAΩ : A ⊆ Ω) {z₀ : ℂ} (hz₀ : z₀ ∈ Ω) (hacc : AccPt z₀ (𝓟 A))
    (hpoint : ∀ z ∈ A, ∃ w, Tendsto (fun n => f n z) atTop (𝓝 w)) :
    ∃ g : ℂ → ℂ, DifferentiableOn ℂ g Ω ∧ TendstoLocallyUniformlyOn f g atTop Ω :=
  vitali hΩ hconn.isPreconnected hf hb hAΩ hz₀ hacc hpoint

/-! ## L2: Schwarz lemma extensions -/

/-- **L2: Schwarz-Pick.** A holomorphic self-map of the unit disc does not increase the
pseudo-hyperbolic distance `|(z - w) / (1 - w̄ z)|`. -/
example {f : ℂ → ℂ} (hf : DifferentiableOn ℂ f (ball 0 1))
    (hmaps : MapsTo f (ball 0 1) (ball 0 1))
    {z w : ℂ} (hz : z ∈ ball (0 : ℂ) 1) (hw : w ∈ ball (0 : ℂ) 1) :
    ‖(f z - f w) / (1 - (starRingEnd ℂ) (f w) * f z)‖
      ≤ ‖(z - w) / (1 - (starRingEnd ℂ) w * z)‖ :=
  pseudoHyperbolicExpr_map_le hf hmaps hz hw

/-- **L2: the hyperbolic (Poincaré) metric on `𝔻`.** `PoincareDisc` is the unit disc with a
`MetricSpace` instance whose distance is `artanh |(z - w) / (1 - w̄ z)|`. -/
example (z w : PoincareDisc) :
    dist z w = Real.artanh
      ‖((PoincareDisc.toUnitDisc z : ℂ) - PoincareDisc.toUnitDisc w) /
        (1 - (starRingEnd ℂ) (PoincareDisc.toUnitDisc w : ℂ) * PoincareDisc.toUnitDisc z)‖ :=
  rfl

/-- Holomorphic self-maps of the disc are nonexpanding for the hyperbolic distance. -/
example {f : ℂ → ℂ} (hf : DifferentiableOn ℂ f (ball 0 1))
    (hmaps : MapsTo f (ball 0 1) (ball 0 1))
    {z w : ℂ} (hz : z ∈ ball (0 : ℂ) 1) (hw : w ∈ ball (0 : ℂ) 1) :
    hyperbolicDist (f z) (f w) ≤ hyperbolicDist z w :=
  hyperbolicDist_map_le hf hmaps hz hw

/-- The standard disc automorphisms are isometries of the Poincaré disc. -/
example (u : Circle) (a : Complex.UnitDisc) :
    Isometry (Complex.UnitDisc.toPoincare ∘ unitDiscStandardAutomorphismEquiv u a ∘
      PoincareDisc.toUnitDisc) :=
  PoincareDisc.isometry_unitDiscStandardAutomorphismEquiv u a

/-- **`Aut(𝔻)` is a group of holomorphic automorphisms.** A permutation of the disc lies in
`unitDiscAut` exactly when it and its inverse are restrictions of maps holomorphic on the disc. -/
example {e : Equiv.Perm Complex.UnitDisc} :
    e ∈ unitDiscAut ↔
      (∃ f : ℂ → ℂ, DifferentiableOn ℂ f (ball 0 1) ∧ ∀ z : Complex.UnitDisc, (e z : ℂ) = f z) ∧
      (∃ f : ℂ → ℂ, DifferentiableOn ℂ f (ball 0 1) ∧
        ∀ z : Complex.UnitDisc, (e.symm z : ℂ) = f z) :=
  Iff.rfl

/-- **L2: `Aut(𝔻) = {e^{iθ}(z - a)/(1 - āz)}`.** -/
example {e : Equiv.Perm Complex.UnitDisc} :
    e ∈ unitDiscAut ↔ ∃ (θ : ℝ) (a : Complex.UnitDisc), ∀ z : Complex.UnitDisc,
      (e z : ℂ) = exp (θ * Complex.I) * (((z : ℂ) - a) / (1 - (starRingEnd ℂ) (a : ℂ) * z)) := by
  rw [mem_unitDiscAut_iff]
  constructor
  · rintro ⟨u, a, rfl⟩
    obtain ⟨θ, rfl⟩ := Circle.exp_surjective u
    exact ⟨θ, a, fun z => by rw [coe_unitDiscStandardAutomorphismEquiv_apply, Circle.coe_exp]⟩
  · rintro ⟨θ, a, h⟩
    refine ⟨Circle.exp θ, a, Equiv.ext fun z => Complex.UnitDisc.coe_injective ?_⟩
    rw [h z, coe_unitDiscStandardAutomorphismEquiv_apply, Circle.coe_exp]

/-! ## L3: the Riemann mapping theorem -/

/-- **L3: the Riemann mapping theorem (summit).** Every nonempty, simply connected, open proper
subset of `ℂ` admits a holomorphic injection onto the unit disc. -/
example {Ω : Set ℂ} (hopen : IsOpen Ω) (hsc : SimplyConnectedSpace Ω) (hne_univ : Ω ≠ univ)
    (_hne : Ω.Nonempty) :
    ∃ f : ℂ → ℂ, DifferentiableOn ℂ f Ω ∧ InjOn f Ω ∧ f '' Ω = ball 0 1 := by
  obtain ⟨f, hbij, hf, -⟩ := riemannMapping hopen hsc hne_univ
  exact ⟨f, hf, hbij.injOn, hbij.image_eq⟩

/-- **Companion: the biholomorphism.** The Riemann map has a holomorphic two-sided inverse on the
disc. -/
example {Ω : Set ℂ} (hopen : IsOpen Ω) (hsc : SimplyConnectedSpace Ω) (hne_univ : Ω ≠ univ) :
    ∃ f : ℂ → ℂ, BijOn f Ω (ball 0 1) ∧ DifferentiableOn ℂ f Ω ∧
      DifferentiableOn ℂ (Function.invFunOn f Ω) (ball 0 1) ∧
      LeftInvOn (Function.invFunOn f Ω) f Ω ∧
      RightInvOn (Function.invFunOn f Ω) f (ball 0 1) :=
  exists_bijOn_ball_differentiableOn_invFunOn hopen hsc hne_univ

/-- **Companion: the packaged equivalence, related to Mathlib's `ConformalAt`.** -/
example {Ω : Set ℂ} (hopen : IsOpen Ω) (hsc : SimplyConnectedSpace Ω) (hne_univ : Ω ≠ univ) :
    ∃ e : OpenPartialHomeomorph ℂ ℂ,
      e.source = Ω ∧ e.target = ball (0 : ℂ) 1 ∧
      DifferentiableOn ℂ e Ω ∧ DifferentiableOn ℂ e.symm (ball (0 : ℂ) 1) ∧
      (∀ z ∈ Ω, ConformalAt e z) ∧ ∀ w ∈ ball (0 : ℂ) 1, ConformalAt e.symm w :=
  riemannMapping_openPartialHomeomorph hopen hsc hne_univ

example {Ω : Set ℂ} (hopen : IsOpen Ω) (hsc : SimplyConnectedSpace Ω) (hne_univ : Ω ≠ univ) :
    Nonempty (Ω ≃ₜ Complex.UnitDisc) :=
  riemannMapping_homeomorph hopen hsc hne_univ

/-- An injective holomorphic map on an open set is conformal in Mathlib's sense at every point. -/
example {U : Set ℂ} {f : ℂ → ℂ} (hf : DifferentiableOn ℂ f U) (hU : IsOpen U) (hinj : InjOn f U)
    {z : ℂ} (hz : z ∈ U) : ConformalAt f z :=
  hf.conformalAt_of_isOpen_of_injOn hU hinj hz

/-- **L3: uniqueness up to `Aut(𝔻)`.** Two Riemann maps of the same domain differ by a disc
automorphism `w ↦ u (w - a) / (1 - ā w)`. -/
example {U : Set ℂ} (hU : IsOpen U) {f g : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f U) (hg : DifferentiableOn ℂ g U)
    (hfi : InjOn f U) (hgi : InjOn g U)
    (hfimage : f '' U = ball (0 : ℂ) 1) (hgimage : g '' U = ball (0 : ℂ) 1) :
    ∃ (u : Circle) (a : Complex.UnitDisc),
      EqOn g (fun z => (u : ℂ) * ((f z - a) / (1 - (starRingEnd ℂ) (a : ℂ) * f z))) U :=
  exists_eqOn_unitDiscStandardAutomorphismFormula_comp hU hf hg hfi hgi hfimage hgimage

/-! ## L4: analytic continuation and the reflection principle -/

/-- **L4.0: antiholomorphic composition.** If `f` is holomorphic on `S`, then
`z ↦ conj (f (conj z))` is holomorphic on `conj '' S`. -/
example {f : ℂ → ℂ} {S : Set ℂ} (hf : DifferentiableOn ℂ f S) :
    DifferentiableOn ℂ (fun z => (starRingEnd ℂ) (f ((starRingEnd ℂ) z)))
      ((starRingEnd ℂ) '' S) :=
  differentiableOn_conj_conj hf

/-- **L4: the Schwarz reflection principle (real axis).** On a conjugation-symmetric open `Ω`,
a function continuous on the closed upper part, holomorphic on the open upper part, and real on
`Ω ∩ ℝ` extends holomorphically to all of `Ω` with the reflection symmetry. -/
example {Ω : Set ℂ} (hΩ : IsOpen Ω) (hsymm : ∀ z, z ∈ Ω ↔ (starRingEnd ℂ) z ∈ Ω)
    {f : ℂ → ℂ}
    (hcont : ContinuousOn f (Ω ∩ {z | 0 ≤ z.im}))
    (hholo : DifferentiableOn ℂ f (Ω ∩ {z | 0 < z.im}))
    (hreal : ∀ z ∈ Ω, z.im = 0 → (f z).im = 0) :
    ∃ F : ℂ → ℂ,
      DifferentiableOn ℂ F Ω ∧
      EqOn F f (Ω ∩ {z | 0 ≤ z.im}) ∧
      ∀ z ∈ Ω, F ((starRingEnd ℂ) z) = (starRingEnd ℂ) (F z) :=
  exists_differentiableOn_eqOn_conj_of_symmetric hΩ (fun z hz => (hsymm z).1 hz) hcont hholo
    hreal

/-- **The explicit witness.** The extension is
`F z = if 0 ≤ z.im then f z else conj (f (conj z))`. -/
example {Ω : Set ℂ} (hΩ : IsOpen Ω) (hsymm : MapsTo (starRingEnd ℂ) Ω Ω) {f : ℂ → ℂ}
    (hcont : ContinuousOn f (Ω ∩ {z | 0 ≤ z.im}))
    (hholo : DifferentiableOn ℂ f (Ω ∩ {z | 0 < z.im}))
    (hreal : ∀ z ∈ Ω, z.im = 0 → (f z).im = 0) :
    DifferentiableOn ℂ
      (fun z => if 0 ≤ z.im then f z else (starRingEnd ℂ) (f ((starRingEnd ℂ) z))) Ω :=
  differentiableOn_schwarzReflection_of_symmetric hΩ hsymm hcont hholo hreal

/-- **L4: reflection across an analytic arc.** The arc is the real locus of a biholomorphic
chart `e`, and the target arc that of a chart `d`; the extension is the real-axis reflection
transported through the charts, `d⁻¹ ∘ (reflection of d ∘ f ∘ e⁻¹) ∘ e`. -/
example (e d : OpenPartialHomeomorph ℂ ℂ) (f : ℂ → ℂ) (z : ℂ) :
    chartedSchwarzReflection e d f z =
      d.symm (schwarzReflection (fun w => d (f (e.symm w))) (e z)) :=
  chartedSchwarzReflection_def e d f z

example (e d : OpenPartialHomeomorph ℂ ℂ) (f : ℂ → ℂ)
    (he : DifferentiableOn ℂ e e.source) (hd : DifferentiableOn ℂ d d.source)
    (he_symm : MapsTo (starRingEnd ℂ) e.target e.target)
    (hd_symm : MapsTo (starRingEnd ℂ) d.target d.target)
    (hf_maps : MapsTo f (e.source ∩ {z : ℂ | 0 ≤ (e z).im}) d.source)
    (hf_cont : ContinuousOn f (e.source ∩ {z : ℂ | 0 ≤ (e z).im}))
    (hf_diff : DifferentiableOn ℂ f (e.source ∩ {z : ℂ | 0 < (e z).im}))
    (hf_real : ∀ z ∈ e.source, (e z).im = 0 → (d (f z)).im = 0) :
    ∃ F : ℂ → ℂ,
      DifferentiableOn ℂ F e.source ∧
      EqOn F f (e.source ∩ {z : ℂ | 0 ≤ (e z).im}) ∧
      ∀ z ∈ e.source,
        F (e.symm ((starRingEnd ℂ) (e z))) = d.symm ((starRingEnd ℂ) (d (F z))) :=
  exists_differentiableOn_eqOn_chartedReflection_of_symmetric e d f he hd he_symm hd_symm
    hf_maps hf_cont hf_diff hf_real

open scoped Classical in
/-- **L4: reflection across a circle.** Inside the closed source disc the extension is `f`;
outside it is `f` conjugated by inversion in the source and target circles. -/
example (c : ℂ) (r : ℝ) (d : ℂ) (s : ℝ) (f : ℂ → ℂ) (z : ℂ) :
    circleSchwarzReflection c r d s f z =
      if z ∈ closedBall c r then f z
      else EuclideanGeometry.inversion d s (f (EuclideanGeometry.inversion c r z)) := by
  simp only [circleSchwarzReflection_def, piecewise, circleReflectionConjugate_apply]

example {Ω : Set ℂ} {c d : ℂ} {r s : ℝ} {f : ℂ → ℂ}
    (hr : 0 < r) (hs : 0 < s) (hΩ : IsOpen Ω)
    (hsymm : MapsTo (EuclideanGeometry.inversion c r) Ω Ω)
    (hcont : ContinuousOn f (Ω ∩ closedBall c r))
    (hholo : DifferentiableOn ℂ f (Ω ∩ ball c r))
    (hboundary : MapsTo f (Ω ∩ sphere c r) (sphere d s))
    (havoid : ∀ z ∈ Ω ∩ ball c r, z ≠ c → f z ≠ d) :
    DifferentiableOn ℂ (circleSchwarzReflection c r d s f) Ω :=
  differentiableOn_circleSchwarzReflection_of_symmetric hr hs hΩ hsymm hcont hholo hboundary
    havoid

/-- **L4: Painlevé removability across an analytic arc.** A function continuous on `Ω` and
holomorphic off the real locus of a holomorphic chart is holomorphic on `Ω`. -/
example (e : OpenPartialHomeomorph ℂ ℂ) {Ω S : Set ℂ} {F : ℂ → ℂ}
    (he : DifferentiableOn ℂ e Ω) (hΩ : IsOpen Ω) (hΩe : Ω ⊆ e.source)
    (hcont : ContinuousOn F Ω) (hdiff : DifferentiableOn ℂ F (Ω \ S))
    (hS : Ω ∩ S ⊆ {z : ℂ | (e z).im = 0}) :
    DifferentiableOn ℂ F Ω :=
  differentiableOn_of_continuousOn_of_differentiableOn_diff_of_subset_coord_im_eq_zero e he hΩ
    hΩe hcont hdiff hS

/-- **Analytic continuation along a path**: the carried function is analytic at each point of
the path, and the carried germ is locally constant in the parameter. -/
example {X : Type*} [TopologicalSpace X] {f : X → ℂ → ℂ} {γ : X → ℂ} {s : Set X} :
    IsAnalyticContinuationAlong f γ s ↔
      ContinuousOn γ s ∧ (∀ t ∈ s, AnalyticAt ℂ (f t) (γ t)) ∧
        ∀ t ∈ s, ∀ᶠ u in 𝓝[s] t, f u =ᶠ[𝓝 (γ u)] f t :=
  ⟨fun h => ⟨h.continuousOn, h.analyticAt, h.locallyEq⟩, fun ⟨h₁, h₂, h₃⟩ => ⟨h₁, h₂, h₃⟩⟩

/-- **L4: the monodromy theorem.** Continuations of one germ along homotopic paths (rel
endpoints) end at the same germ. -/
example {z₀ z₁ : ℂ} {p₀ p₁ : Path z₀ z₁} (h : p₀.Homotopy p₁)
    {f : unitInterval → unitInterval → ℂ → ℂ}
    (hf : ∀ t, IsAnalyticContinuationAlong (f t) (fun x => h (t, x)) univ)
    (hstart : ∀ t, f t 0 =ᶠ[𝓝 z₀] f 0 0) (t : unitInterval) :
    f t 1 =ᶠ[𝓝 z₁] f 0 1 :=
  monodromy_theorem h hf hstart t

/-! ## L5: the Carathéodory boundary correspondence (Jordan-domain case) -/

/-- **A Jordan domain** is a bounded domain whose frontier is homeomorphic to the circle. -/
example {U : Set ℂ} :
    IsJordanDomain U ↔
      IsOpen U ∧ IsConnected U ∧ Bornology.IsBounded U ∧ Nonempty (frontier U ≃ₜ Circle) :=
  ⟨fun h => ⟨h.isOpen, h.isConnected, h.isBounded, h.isJordanCurve_frontier⟩,
    fun ⟨h₁, h₂, h₃, h₄⟩ => ⟨h₁, h₂, h₃, h₄⟩⟩

/-- **L5: Carathéodory.** A Riemann map of a Jordan domain extends to a homeomorphism of the
closures. -/
example {Ω : Set ℂ} (hΩ : IsJordanDomain Ω) :
    ∃ g : ℂ → ℂ, ContinuousOn g (closedBall 0 1) ∧ DifferentiableOn ℂ g (ball 0 1) ∧
      BijOn g (ball 0 1) Ω ∧
      ∃ e : closedBall (0 : ℂ) 1 ≃ₜ closure Ω, ∀ z : closedBall (0 : ℂ) 1, (e z : ℂ) = g z :=
  exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier hΩ.isOpen hΩ.isConnected
    hΩ.isBounded hΩ.isJordanCurve_frontier

/-- **L5, for every Riemann map.** Any conformal map of the disc onto a Jordan domain has a
continuous extension to the closed disc, and that extension is injective there, so it is a
homeomorphism of the closed disc onto the closure of the domain. -/
example {f : ℂ → ℂ} (hf : DifferentiableOn ℂ f (ball 0 1)) (hinj : InjOn f (ball 0 1))
    (hJ : IsJordanDomain (f '' ball 0 1)) :
    ∃ F : ℂ → ℂ, ContinuousOn F (closedBall 0 1) ∧ EqOn F f (ball 0 1) ∧
      BijOn F (closedBall 0 1) (closure (f '' ball 0 1)) := by
  obtain ⟨F, hFc, hFf⟩ := exists_continuousOn_closedBall_eqOn_of_isJordanCurve_frontier one_pos
    hf hinj hJ.isBounded hJ.isJordanCurve_frontier
  have hcl : closure (ball (0 : ℂ) 1) = closedBall 0 1 := closure_ball 0 one_ne_zero
  refine ⟨F, hFc, hFf, ?_⟩
  have hFi := injOn_closedBall_of_isJordanCurve_frontier one_pos hf hinj hJ.isBounded
    hJ.isJordanCurve_frontier hFc hFf
  rw [← hcl] at hFc hFi ⊢
  exact bijOn_closure_closure_image isBounded_ball hFc hFf hFi

/-! ## L6: Schwarz-Christoffel -/

/-- **The Schwarz-Christoffel integrand** `∏ i, (z - a i) ^ e i`. -/
example {ι : Type*} [Fintype ι] (a e : ι → ℝ) (z : ℂ) :
    schwarzChristoffelIntegrand a e z = ∏ i, (z - (a i : ℂ)) ^ (e i : ℂ) :=
  schwarzChristoffelIntegrand_def a e z

/-- **The Schwarz-Christoffel primitive** is the primitive of the integrand on the upper
half-plane that vanishes at the base point `z₀`: it is characterized by these two properties. -/
example {ι : Type*} [Fintype ι] (a e : ι → ℝ) (z₀ : UpperHalfPlane) :
    schwarzChristoffelPrimitive a e z₀ z₀ = 0 ∧
      ∀ z ∈ upperHalfPlaneSet,
        HasDerivAt (schwarzChristoffelPrimitive a e z₀) (schwarzChristoffelIntegrand a e z) z :=
  ⟨schwarzChristoffelPrimitive_apply_base a e z₀,
    fun _ hz => hasDerivAt_schwarzChristoffelPrimitive a e z₀ hz⟩

example {ι : Type*} [Fintype ι] (a e : ι → ℝ) (z₀ : UpperHalfPlane) {g : ℂ → ℂ}
    (hg : ∀ z ∈ upperHalfPlaneSet, HasDerivAt g (schwarzChristoffelIntegrand a e z) z)
    (hg₀ : g z₀ = 0) :
    EqOn g (schwarzChristoffelPrimitive a e z₀) upperHalfPlaneSet :=
  eqOn_schwarzChristoffelPrimitive a e z₀ hg hg₀

/-- **The Schwarz-Christoffel vertex** at `a j` is the boundary limit of the primitive. -/
example {ι : Type*} [Fintype ι] (a e : ι → ℝ) (z₀ : UpperHalfPlane) (j : ι)
    (he : -1 < ∑ i with a i = a j, e i) :
    Tendsto (schwarzChristoffelPrimitive a e z₀) (𝓝[upperHalfPlaneSet] (a j : ℂ))
      (𝓝 (schwarzChristoffelVertex a e z₀ j)) :=
  tendsto_schwarzChristoffelPrimitive a e z₀ j he

/-- **L6: the Schwarz-Christoffel theorem for polygons.** Let `U` be a bounded domain whose
frontier is a Jordan curve, which near each frontier point other than the distinct vertices
`v i` is an open half-plane and near `v i` is a sector of opening `(e i + 1) π ∈ (0, 2π)`. Then
an affine image of the Schwarz-Christoffel primitive, for suitable distinct real prevertices,
maps the upper half-plane bijectively onto `U` and sends the prevertices to the vertices. -/
example {ι : Type*} [Fintype ι] (e : ι → ℝ) (he : ∀ i, e i ∈ Ioo (-1 : ℝ) 1)
    (z₀ : UpperHalfPlane) {U : Set ℂ} (hU : IsJordanDomain U) {v : ι → ℂ}
    (hv : Function.Injective v)
    (hside : ∀ w ∈ frontier U, (∀ i, w ≠ v i) → ∃ ρ > 0, ∃ q b : ℂ, b ≠ 0 ∧
      ∀ z ∈ ball w ρ, (z ∈ U ↔ 0 < ((z - q) / b).im))
    (hcorner : ∀ i, ∃ ρ > 0, ∃ b : ℂ, b ≠ 0 ∧ ∀ z ∈ ball (v i) ρ, z ≠ v i →
      (z ∈ U ↔ |((z - v i) / b).arg| < (e i + 1) * Real.pi / 2)) :
    ∃ a : ι → ℝ, Function.Injective a ∧ ∃ A : ℂ, A ≠ 0 ∧ ∃ B : ℂ,
      BijOn (fun z => A * schwarzChristoffelPrimitive a e z₀ z + B) upperHalfPlaneSet U ∧
      ∀ i, A * schwarzChristoffelVertex a e z₀ i + B = v i :=
  exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier e he z₀
    hU.isOpen hU.isConnected hU.isBounded hU.isJordanCurve_frontier hv hside hcorner

/-- **The angle sum.** The turning exponents of a bounded polygonal Jordan domain sum to `-2`,
so its interior angles sum to `(n - 2) π`. -/
example {ι : Type*} [Fintype ι] (e : ι → ℝ) (he : ∀ i, e i ∈ Ioo (-1 : ℝ) 1)
    {U : Set ℂ} (hU : IsJordanDomain U) {v : ι → ℂ} (hv : Function.Injective v)
    (hside : ∀ w ∈ frontier U, (∀ i, w ≠ v i) → ∃ ρ > 0, ∃ q b : ℂ, b ≠ 0 ∧
      ∀ z ∈ ball w ρ, (z ∈ U ↔ 0 < ((z - q) / b).im))
    (hcorner : ∀ i, ∃ ρ > 0, ∃ b : ℂ, b ≠ 0 ∧ ∀ z ∈ ball (v i) ρ, z ≠ v i →
      (z ∈ U ↔ |((z - v i) / b).arg| < (e i + 1) * Real.pi / 2)) :
    ∑ i, e i = -2 :=
  exponent_sum_eq_neg_two_of_isJordanCurve_frontier e he hU.isOpen hU.isConnected hU.isBounded
    hU.isJordanCurve_frontier hv hside hcorner

/-- **Beyond the milestone: a vertex at infinity with a sector end.** The same representation
holds for an unbounded polygonal domain whose frontier, with `∞` added, is a Jordan curve on the
Riemann sphere, and which far out is a sector of opening `β π` with `0 < β < 2`. -/
example {ι : Type*} [Fintype ι] (e : ι → ℝ) (he : ∀ i, e i ∈ Ioo (-1 : ℝ) 1)
    (z₀ : UpperHalfPlane) {β : ℝ} (hβ : β ∈ Ioo (0 : ℝ) 2) {U : Set ℂ} (hUo : IsOpen U)
    (hUc : IsConnected U)
    (hUJ : IsJordanCurve (insert ∞ (((↑) : ℂ → OnePoint ℂ) '' frontier U))) {v : ι → ℂ}
    (hv : Function.Injective v)
    (hside : ∀ w ∈ frontier U, (∀ i, w ≠ v i) → ∃ ρ > 0, ∃ q b : ℂ, b ≠ 0 ∧
      ∀ z ∈ ball w ρ, (z ∈ U ↔ 0 < ((z - q) / b).im))
    (hcorner : ∀ i, ∃ ρ > 0, ∃ b : ℂ, b ≠ 0 ∧ ∀ z ∈ ball (v i) ρ, z ≠ v i →
      (z ∈ U ↔ |((z - v i) / b).arg| < (e i + 1) * Real.pi / 2))
    (hinfty : ∃ ρ : ℝ, ∃ c b : ℂ, b ≠ 0 ∧ ∀ z : ℂ, ρ < ‖z - c‖ →
      (z ∈ U ↔ |((z - c) / b).arg| < β * Real.pi / 2)) :
    ∃ a : ι → ℝ, Function.Injective a ∧ ∃ A : ℂ, A ≠ 0 ∧ ∃ B : ℂ,
      BijOn (fun z => A * schwarzChristoffelPrimitive a e z₀ z + B) upperHalfPlaneSet U ∧
      ∀ i, A * schwarzChristoffelVertex a e z₀ i + B = v i :=
  exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty e he z₀
    hβ hUo hUc hUJ hv hside hcorner hinfty

/-- **Beyond the milestone: a vertex at infinity with a half-strip end** (two parallel sides). -/
example {ι : Type*} [Fintype ι] (e : ι → ℝ) (he : ∀ i, e i ∈ Ioo (-1 : ℝ) 1)
    (z₀ : UpperHalfPlane) {U : Set ℂ} (hUo : IsOpen U) (hUc : IsConnected U)
    (hUJ : IsJordanCurve (insert ∞ (((↑) : ℂ → OnePoint ℂ) '' frontier U))) {v : ι → ℂ}
    (hv : Function.Injective v)
    (hside : ∀ w ∈ frontier U, (∀ i, w ≠ v i) → ∃ ρ > 0, ∃ q b : ℂ, b ≠ 0 ∧
      ∀ z ∈ ball w ρ, (z ∈ U ↔ 0 < ((z - q) / b).im))
    (hcorner : ∀ i, ∃ ρ > 0, ∃ b : ℂ, b ≠ 0 ∧ ∀ z ∈ ball (v i) ρ, z ≠ v i →
      (z ∈ U ↔ |((z - v i) / b).arg| < (e i + 1) * Real.pi / 2))
    (hinfty : ∃ ρ : ℝ, ∃ c b : ℂ, b ≠ 0 ∧ ∀ z : ℂ, ρ < ‖z - c‖ →
      (z ∈ U ↔ 0 < ((z - c) / b).re ∧ ((z - c) / b).im ∈ Ioo 0 Real.pi)) :
    ∃ a : ι → ℝ, Function.Injective a ∧ ∃ A : ℂ, A ≠ 0 ∧ ∃ B : ℂ,
      BijOn (fun z => A * schwarzChristoffelPrimitive a e z₀ z + B) upperHalfPlaneSet U ∧
      ∀ i, A * schwarzChristoffelVertex a e z₀ i + B = v i :=
  exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_of_halfStrip e he z₀
    hUo hUc hUJ hv hside hcorner hinfty

end TauCetiRoadmap.ConformalMapping
