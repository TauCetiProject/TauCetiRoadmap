module

public import Mathlib
public import TauCeti.AlgebraicTopology.UniversalCover.Action

/-!
# AnalyticNumberTheoryPartII: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

Layer 4 states Lerch continuation on Tau Ceti's based path-class universal cover,
its invariance under the second derived subgroup, both completed Lerch functional
equations, complex Hurwitz continuation with Bernoulli values, and the Barnes
full-sector expansion with its sharp remainder and differentiated sector estimate.
Local holomorphy on the cover means local agreement with an analytic function of
the endpoint coordinates; it requires no replacement covering-space carrier.
The completed functional equations use entire extensions at Gamma poles.

Layer 5 states the quadratic large sieve, the primitive real-character fourth
moment, and the entire pole clearance, matrix equations and polynomial growth of
the sixteen quadratic double Dirichlet series. The reflection equation clears the Gamma and Euler denominators with
entire reciprocal-Gamma factors, so it holds on all of `ℂ²`. The cubic Shintani continuation,
residues, matrix equation and convexity bound need the arithmetic carrier of
locally free cubic orders, their discriminant ideals and weighted signature
coefficients. Those objects are absent at the pins and need the constructions of
§§5.5–5.6; arbitrary coefficient sequences would not state these theorems.

Layer 5 also states the adelic harmonic analysis this part owns for later roadmaps:
restricted products of Haar measures, the Pontryagin self-duality of the adeles with
`K^⊥ = K`, Weil's quotient measure and the `GL₂` class number (§§5.3f, 5.3h, 5.3k,
5.3m). The self-duality is stated for every nontrivial continuous character of `𝔸_K`
trivial on `K`, so it needs no standard character. The adelic Fourier transform and
Poisson summation (§5.3h) need an adelic Schwartz–Bruhat carrier; Siegel sets and the
`GL₂` Eisenstein series (§§5.3m, 5.3n) need adelic `GL₂` quotients with their Haar
measures. These carriers are absent at the pins.

Layer 6 states generation of the native rational torsion group algebra by first
Eisenstein functions, existence and uniqueness of critical scaling measures on
Mathlib's finite adeles, and the supercritical parametrization of scaling
measures by probability measures on the profinite units, which is the measure
form of both halves of the phase transition. The completed Bost–Connes algebra,
its dynamics and KMS state space are absent at the pins, so the KMS-state form
of the phase transition, the cyclotomic state values and the type III₁
classification have no signatures here. The compact scalar
Selberg determinant comparison and spectral zero theorem likewise need the
geometric scalar Laplacian realization, its spectrum and the primitive geodesic
product of §§6.11–6.12. No arbitrary spectrum substitutes for these objects.
-/

@[expose] public section

noncomputable section

open Filter Topology Complex MeasureTheory
open scoped BigOperators NumberField

namespace TauCetiRoadmap.AnalyticNumberTheoryPartII

/-! ## Layer 4: Lerch continuation, complex Hurwitz zeta and Barnes G -/

/-- The initial Lerch series, with principal logarithms (§4.1). -/
def lerchSeries (z s c : ℂ) : ℂ :=
  ∑' n : ℕ, z ^ n * Complex.exp (-s * Complex.log (n + c))

/-- The complex Hurwitz series on `re s > 1`, `re c > 0` (§4.2). -/
def complexHurwitzSeries (s c : ℂ) : ℂ :=
  ∑' n : ℕ, Complex.exp (-s * Complex.log (n + c))

/-- The punctured parameter domain `N#`, in coordinate order `(s,z,c)` (§4.5). -/
def lerchDomain : Set (ℂ × ℂ × ℂ) :=
  {p | p.2.1 ≠ 0 ∧ p.2.1 ≠ 1 ∧ ∀ n : ℕ, p.2.2 ≠ -(n : ℂ)}

/-- The based cover uses the principal integral germ at `(1/2,-1,1/2)`. -/
def lerchBasepoint : lerchDomain :=
  ⟨(1 / 2, -1, 1 / 2), by
    refine ⟨by norm_num, by norm_num, ?_⟩
    intro n h
    have h' := congrArg Complex.re h
    have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
    norm_num at h'
    linarith⟩

/-- Principal Lerch integral on `re s,re c > 0`, `z ∉ [1,∞)` (§4.5b). -/
def lerchIntegral (p : ℂ × ℂ × ℂ) : ℂ :=
  (Complex.Gamma p.1)⁻¹ * ∫ t : ℝ in Set.Ioi 0,
    (t : ℂ) ^ (p.1 - 1) * Complex.exp (-(p.2.2 * t)) /
      (1 - p.2.1 * Complex.exp (-t))

/-- The principal germ continues holomorphically to the universal cover and is
invariant under the second derived subgroup (§§4.5, 4.17). -/
theorem lerchContinuation_solvable :
    ∃ F : TauCeti.UniversalCover lerchBasepoint → ℂ,
      (∀ x, ∃ f : ℂ × ℂ × ℂ → ℂ,
        AnalyticAt ℂ f x.proj.val ∧
        F =ᶠ[𝓝 x] fun y => f y.proj.val) ∧
      (F =ᶠ[𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint :
        TauCeti.UniversalCover lerchBasepoint)] fun x => lerchIntegral x.proj.val) ∧
      ∀ g ∈ Subgroup.derivedSeries (FundamentalGroup lerchDomain lerchBasepoint) 2,
        ∀ x, F (g • x) = F x := by
  sorry

/-- The even and odd completed Lerch equations on the full fundamental
polycylinder, including the removable completed Gamma poles (§§4.9–4.10). -/
theorem lerch_completed_functional_equations :
    let D : Set (ℂ × ℂ × ℂ) :=
      {p | 0 < p.2.1.re ∧ p.2.1.re < 1 ∧ 0 < p.2.2.re ∧ p.2.2.re < 1}
    ∃ L : ℂ × ℂ × ℂ → ℂ, ∃ Λ : Fin 2 → (ℂ × ℂ × ℂ) → ℂ,
      DifferentiableOn ℂ L D ∧
      (∀ p ∈ D, 0 < p.2.1.im →
        L p = lerchSeries (Complex.exp (2 * Real.pi * I * p.2.1)) p.1 p.2.2) ∧
      ∀ k : Fin 2, DifferentiableOn ℂ (Λ k) D ∧
        (∀ p ∈ D, (∀ n : ℕ, (p.1 + k.val) / 2 ≠ -(n : ℂ)) →
          Λ k p = (Real.pi : ℂ) ^ (-(p.1 + k.val) / 2) *
            Complex.Gamma ((p.1 + k.val) / 2) *
              (L p + (-1 : ℂ) ^ k.val * Complex.exp (-2 * Real.pi * I * p.2.1) *
                L (p.1, 1 - p.2.1, 1 - p.2.2))) ∧
        ∀ p ∈ D, Λ k p = I ^ k.val * Complex.exp (-2 * Real.pi * I * p.2.1 * p.2.2) *
          Λ k (1 - p.1, 1 - p.2.2, p.2.1) := by
  sorry

/-- Joint complex Hurwitz continuation, simple residue one and all nonpositive
integral Bernoulli values (§§4.12, 4.16). -/
theorem complexHurwitzContinuation_exists :
    ∃ H R : ℂ × ℂ → ℂ,
      DifferentiableOn ℂ H {p | p.1 ≠ 1 ∧ 0 < p.2.re} ∧
      DifferentiableOn ℂ R {p | 0 < p.2.re} ∧
      ∀ c : ℂ, 0 < c.re →
        (∀ s : ℂ, 1 < s.re → H (s, c) = complexHurwitzSeries s c) ∧
        R (1, c) = 1 ∧
        (∀ s : ℂ, s ≠ 1 → R (s, c) = (s - 1) * H (s, c)) ∧
        (∀ m : ℕ, H (-(m : ℂ), c) =
          -((Polynomial.bernoulli (m + 1)).map (algebraMap ℚ ℂ)).eval c / (m + 1)) := by
  sorry

/-- Barnes G fixed by its canonical Weierstrass product (§4.3). -/
def barnesG (z : ℂ) : ℂ :=
  let w := z - 1
  (2 * Real.pi : ℂ) ^ (w / 2) *
    Complex.exp (-(w * (w + 1)) / 2 - Real.eulerMascheroniConstant * w ^ 2 / 2) *
    ∏' k : ℕ, (1 + w / (k + 1)) ^ (k + 1) * Complex.exp (-w + w ^ 2 / (2 * (k + 1)))

/-- The periodic Bernoulli integral remainder on the slit plane (§4.3a). -/
def barnesRemainder (N : ℕ) (z : ℂ) : ℂ :=
  (1 / ((2 * N + 1) * (2 * N + 2) : ℂ)) * ∫ t : ℝ in Set.Ioi 0,
    (((Polynomial.bernoulli (2 * N + 2)).eval 0 : ℚ) -
      ((Polynomial.bernoulli (2 * N + 2)).map (algebraMap ℚ ℝ)).eval (Int.fract t) : ℂ) /
        ((t : ℂ) + z) ^ (2 * N + 1)

/-- The normalized Barnes expansion on the whole slit plane, with the sharp
remainder and derivative estimate on every closed sector (§§4.3–4.3a).
Here `log A = 1/12 - ζ'(-1)` fixes Glaisher's constant. -/
theorem barnesG_asymptotic :
    ∃ LΓ LG : ℂ → ℂ,
      AnalyticOnNhd ℂ LΓ Complex.slitPlane ∧ AnalyticOnNhd ℂ LG Complex.slitPlane ∧
      (∀ z ∈ Complex.slitPlane,
        Complex.exp (LΓ z) = Complex.Gamma (z + 1) ∧
        Complex.exp (LG z) = barnesG (z + 1)) ∧
      (∀ x : ℝ, 0 < x → (LΓ x).im = 0 ∧ (LG x).im = 0) ∧
      ∀ N : ℕ, 1 ≤ N →
        (∀ z ∈ Complex.slitPlane,
          LG z = z ^ 2 / 4 + z * LΓ z -
            (z * (z + 1) / 2 + 1 / 12) * Complex.log z -
            (1 / 12 - deriv riemannZeta (-1)) +
            (∑ k ∈ Finset.Ico 1 N, (bernoulli (2 * k + 2) : ℂ) /
              ((2 * k : ℂ) * (2 * k + 1) * (2 * k + 2) * z ^ (2 * k))) +
            barnesRemainder N z) ∧
        (∀ z ∈ Complex.slitPlane,
          ‖barnesRemainder N z‖ ≤ |(bernoulli (2 * N + 2) : ℝ)| /
            ((2 * N : ℝ) * (2 * N + 1) * (2 * N + 2) *
              ‖z‖ ^ (2 * N) * Real.cos (Complex.arg z / 2) ^ (2 * N + 1))) ∧
        ∀ δ : ℝ, 0 < δ → δ < Real.pi → ∃ C > 0, ∃ R > 0, ∀ z : ℂ,
          R ≤ ‖z‖ → |Complex.arg z| ≤ Real.pi - δ →
          ‖deriv (barnesRemainder N) z‖ ≤ C / ‖z‖ ^ (2 * N + 1) := by
  sorry

/-! ## Layer 5: Double Dirichlet series and binary-cubic zeta functions -/

/-- Heath-Brown's quadratic large sieve with arbitrary complex coefficients
and both odd squarefree cutoffs (§5.29). -/
theorem quadratic_large_sieve (e : ℝ) (he : 0 < e) :
    ∃ C > 0, ∀ M N : ℕ, 0 < M → 0 < N → ∀ a : ℕ → ℂ,
      (∑ m ∈ (Finset.Icc 1 M).filter (fun m => Odd m ∧ Squarefree m),
        ‖∑ n ∈ (Finset.Icc 1 N).filter (fun n => Odd n ∧ Squarefree n),
          a n * (jacobiSym (n : ℤ) m : ℂ)‖ ^ 2) ≤
      C * ((M : ℝ) * N) ^ e * (M + N) *
        ∑ n ∈ (Finset.Icc 1 N).filter (fun n => Odd n ∧ Squarefree n), ‖a n‖ ^ 2 := by
  sorry

/-- The fourth moment for every finite subset of nonprincipal primitive real
characters, uniformly in conductor cutoff and height (§§5.29, 5.30g). -/
theorem quadratic_fourth_moment (sig e : ℝ) (hsig : sig ∈ Set.Icc (1 / 2 : ℝ) 1)
    (he : 0 < e) :
    ∃ C > 0, ∀ Q : ℝ, 1 ≤ Q → ∀ t : ℝ,
      ∀ S : Finset (Σ q : ℕ+, DirichletCharacter ℂ (q : ℕ)),
      (∀ chi ∈ S, (chi.1 : ℝ) ≤ Q ∧ chi.2.IsPrimitive ∧ chi.2 ≠ 1 ∧ chi.2 ^ 2 = 1) →
      (∑ chi ∈ S, ‖DirichletCharacter.LFunction chi.2 ((sig : ℂ) + t * I)‖ ^ 4) ≤
        C * (Q + (Q * (1 + |t|)) ^ (2 - 2 * sig)) * (Q * (1 + |t|)) ^ e := by
  sorry

/-- The sixteen quadratic double series, using the four native characters
modulo eight and retaining every square factor of `d` (§5.14). -/
def quadraticDoubleSeries (ψ ψ' : DirichletCharacter ℂ 8) (p : ℂ × ℂ) : ℂ :=
  (1 - (2 : ℂ) ^ (-(2 * p.1 + 2 * p.2 - 1))) * riemannZeta (2 * p.1 + 2 * p.2 - 1) *
    LSeries (fun d => if Odd d then ψ' d *
      LSeries (fun n => if Odd n then (jacobiSym (d : ℤ) n : ℂ) * ψ n else 0) p.1
      else 0) p.2

/-- The reciprocity matrix in native character coordinates (§5.15). -/
def quadraticReciprocity (ψ ψ' ρ ρ' : DirichletCharacter ℂ 8) : ℂ :=
  (1 / 16) * ∑ η : Fin 4, ∑ ν : Fin 4,
    ψ (2 * ν.val + 1) * ψ' (2 * η.val + 1) *
    ρ (2 * η.val + 1) * ρ' (2 * ν.val + 1) * (-1 : ℂ) ^ (η.val * ν.val)

/-- Entire numerator and denominator of the conductor-aware reflection ratio
(§§5.16, 5.23), using the entire reciprocal Gamma at its zeros. -/
def quadraticReflectionFactors (ψ : DirichletCharacter ℂ 8) (η : Fin 4) (s : ℂ) : ℂ × ℂ :=
  let q : ℂ := if ψ 5 ≠ 1 then 8 else if ψ (-1) = (-1 : ℂ) ^ η.val then 1 else 4
  let κ : ℂ := if ψ (-1) = 1 then 0 else 1
  let e : ℂ := if q = 1 then (-1 : ℂ) ^ (η.val * (η.val + 1) / 2) else 0
  ((q / Real.pi) ^ (1 / 2 - s) * (Complex.Gamma ((s + κ) / 2))⁻¹ *
    (1 - e * (2 : ℂ) ^ (-s)),
    (Complex.Gamma ((1 - s + κ) / 2))⁻¹ * (1 - e * (2 : ℂ) ^ (s - 1)))

/-- The reflection block multiplied by its common entire denominator (§5.26). -/
def quadraticReflection (ψ ψ' ρ' : DirichletCharacter ℂ 8) (s : ℂ) : ℂ :=
  (1 / 4) * ∑ η : Fin 4,
    ψ' (2 * η.val + 1) * (quadraticReflectionFactors ψ η s).1 *
      (∏ ν ∈ Finset.univ.erase η, (quadraticReflectionFactors ψ ν s).2) *
      ρ' (2 * η.val + 1)

local instance : Fintype (DirichletCharacter ℂ 8) := Fintype.ofFinite _

/-- Canonical pole-cleared double-series continuation, both matrix equations
and polynomial growth on every bounded real rectangle (§5.30). -/
theorem quadraticDoubleSeries_continuation :
    let P : ℂ × ℂ → ℂ := fun p => (p.1 - 1) * (p.2 - 1) * (p.1 + p.2 - 3 / 2)
    ∃! E : DirichletCharacter ℂ 8 → DirichletCharacter ℂ 8 → (ℂ × ℂ) → ℂ,
      ∀ ψ ψ', Differentiable ℂ (E ψ ψ') ∧
        (∀ p : ℂ × ℂ, 1 < p.1.re → 1 < p.2.re →
          E ψ ψ' p = P p * quadraticDoubleSeries ψ ψ' p) ∧
        (∀ p : ℂ × ℂ, E ψ ψ' p = ∑ ρ, ∑ ρ',
          quadraticReciprocity ψ ψ' ρ ρ' * E ρ ρ' (p.2, p.1)) ∧
        (∀ p : ℂ × ℂ,
          P (1 - p.1, p.1 + p.2 - 1 / 2) *
            (∏ η : Fin 4, (quadraticReflectionFactors ψ η p.1).2) * E ψ ψ' p =
            P p * ∑ ρ', quadraticReflection ψ ψ' ρ' p.1 *
              E ψ ρ' (1 - p.1, p.1 + p.2 - 1 / 2)) ∧
        ∀ a b c d : ℝ, a ≤ b → c ≤ d → ∃ C > 0, ∃ N : ℕ, ∀ p : ℂ × ℂ,
          p.1.re ∈ Set.Icc a b → p.2.re ∈ Set.Icc c d →
          ‖E ψ ψ' p‖ ≤ C * (1 + |p.1.im|) ^ N * (1 + |p.2.im|) ^ N := by
  sorry

/-! ### Harmonic analysis for the binary-cubic theory (§§5.3f–5.3m) -/

section RestrictedHaar

open scoped RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, AddGroup (G i)] [∀ i, TopologicalSpace (G i)]
  {B : ∀ i, AddSubgroup (G i)}

/-- Restricted products of Haar measures (§5.3f): when cofinitely many of the open subgroups
`B i` are compact and have mass one, exactly one Haar measure on the restricted product gives
each Borel box that is cofinitely `B i` the product of the local masses. -/
theorem exists_unique_restrictedAddHaar [Countable ι] [∀ i, IsTopologicalAddGroup (G i)]
    [∀ i, LocallyCompactSpace (G i)] [∀ i, T2Space (G i)] [∀ i, SecondCountableTopology (G i)]
    [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)] [Fact (∀ i, IsOpen (B i : Set (G i)))]
    [MeasurableSpace (Πʳ i, [G i, B i])] [BorelSpace (Πʳ i, [G i, B i])]
    (hB : ∀ᶠ i in Filter.cofinite, IsCompact (B i : Set (G i)))
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsAddHaarMeasure]
    (hμ : ∀ᶠ i in Filter.cofinite, μ i (B i) = 1) :
    ∃! ν : Measure (Πʳ i, [G i, B i]), ν.IsAddHaarMeasure ∧
      ∀ C : ∀ i, Set (G i), (∀ i, MeasurableSet (C i)) →
        (∀ᶠ i in Filter.cofinite, C i = B i) →
        ν {x | ∀ i, x i ∈ C i} = ∏ᶠ i, μ i (C i) := by
  sorry

end RestrictedHaar

section AdelicSelfDuality

open NumberField

/-- Self-duality of the adeles (§5.3h, the case `V = K` with `B(x,y) = xy`): `𝔸_K` has a
nontrivial continuous character trivial on `K` (the standard character of §5.3g), and for every
such character `ψ` the map `y ↦ ψ(· y)` is a topological isomorphism of `𝔸_K` onto its Pontryagin
dual under which the annihilator of `K` is `K` (Tate, *Fourier analysis in number fields*, §4.1). -/
theorem adeleRing_selfDual (K : Type*) [Field K] [NumberField K] :
    (∃ ψ : PontryaginDual (Multiplicative (AdeleRing (𝓞 K) K)), ψ ≠ 1 ∧
      ∀ ξ : K, ψ (Multiplicative.ofAdd (algebraMap K (AdeleRing (𝓞 K) K) ξ)) = 1) ∧
    ∀ ψ : PontryaginDual (Multiplicative (AdeleRing (𝓞 K) K)), ψ ≠ 1 →
      (∀ ξ : K, ψ (Multiplicative.ofAdd (algebraMap K (AdeleRing (𝓞 K) K) ξ)) = 1) →
      ∃ e : AdeleRing (𝓞 K) K ≃ₜ PontryaginDual (Multiplicative (AdeleRing (𝓞 K) K)),
        (∀ x y, e y (Multiplicative.ofAdd x) = ψ (Multiplicative.ofAdd (x * y))) ∧
        ∀ y, (∀ ξ : K, ψ (Multiplicative.ofAdd (algebraMap K (AdeleRing (𝓞 K) K) ξ * y)) = 1) ↔
          y ∈ Set.range (algebraMap K (AdeleRing (𝓞 K) K)) := by
  sorry

end AdelicSelfDuality

section QuotientMeasure

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [T2Space G] [SecondCountableTopology G]
  [MeasurableSpace G] [BorelSpace G]

/-- Weil's quotient measure (§5.3k): for right Haar measures on `G` and on a closed subgroup `H`
with matching modular characters, there is exactly one right-`G`-invariant Radon measure on
`H \ G` with `∫_G f = ∫_{H \ G} ∫_H f(h g) dh dġ` for compactly supported continuous `f`. -/
theorem exists_unique_quotientMeasure (H : Subgroup G) (hH : IsClosed (H : Set G))
    [LocallyCompactSpace H] [MeasurableSpace H] [BorelSpace H]
    [MeasurableSpace (MulAction.orbitRel.Quotient H G)]
    [BorelSpace (MulAction.orbitRel.Quotient H G)]
    (μG : Measure G) [μG.IsMulRightInvariant] [IsFiniteMeasureOnCompacts μG]
    [μG.IsOpenPosMeasure]
    (μH : Measure H) [μH.IsMulRightInvariant] [IsFiniteMeasureOnCompacts μH]
    [μH.IsOpenPosMeasure]
    (hmod : ∀ h : H, Measure.modularCharacter (G := G) h =
      Measure.modularCharacter (G := H) h) :
    ∃! ν : Measure (MulAction.orbitRel.Quotient H G), IsFiniteMeasureOnCompacts ν ∧
      (∀ g : G, Measure.map (fun q : MulAction.orbitRel.Quotient H G =>
        (Quotient.mk'' (q.out * g) : MulAction.orbitRel.Quotient H G)) ν = ν) ∧
      ∀ f : G → ℝ, Continuous f → HasCompactSupport f →
        ∫ g, f g ∂μG = ∫ q, (∫ h : H, f ((h : G) * q.out) ∂μH) ∂ν := by
  sorry

end QuotientMeasure

section GL2ClassNumber

open IsDedekindDomain

variable (K : Type*) [Field K] [NumberField K]

/-- `GL₂(K)`, embedded diagonally in `GL₂` of the finite adeles (§5.3m). -/
def gl2Rational : Set (GL (Fin 2) (FiniteAdeleRing (𝓞 K) K)) :=
  Set.range (Matrix.GeneralLinearGroup.map (algebraMap K (FiniteAdeleRing (𝓞 K) K)))

/-- `GL₂(Ô_K)`: the matrices whose entries and inverse entries are integral at every finite
place (§5.3m). -/
def gl2Integral : Set (GL (Fin 2) (FiniteAdeleRing (𝓞 K) K)) :=
  {g | ∀ v : HeightOneSpectrum (𝓞 K), ∀ i j : Fin 2,
    (g : Matrix (Fin 2) (Fin 2) (FiniteAdeleRing (𝓞 K) K)) i j v ∈
        v.adicCompletionIntegers K ∧
      ((g⁻¹ : GL (Fin 2) (FiniteAdeleRing (𝓞 K) K)) :
        Matrix (Fin 2) (Fin 2) (FiniteAdeleRing (𝓞 K) K)) i j v ∈ v.adicCompletionIntegers K}

/-- The double cosets `GL₂(K) \ GL₂(𝔸_{K,f}) / GL₂(Ô_K)` are as many as the ideal classes of
`K`: the determinant identifies them with `K^× \ 𝔸_{K,f}^× / Ô_K^×` (§5.3m). -/
theorem gl2_classNumber :
    Nat.card (DoubleCoset.Quotient (gl2Rational K) (gl2Integral K)) =
      NumberField.classNumber K := by
  sorry

end GL2ClassNumber

/-! ## Layer 6: The Bost–Connes system and compact spectral determinants -/

/-- First trigonometric Eisenstein functions in the rational torsion group
algebra; the annihilating level is the additive order (§6.26). -/
def firstEisenstein (a : AddCircle (1 : ℚ)) : AddMonoidAlgebra ℚ (AddCircle (1 : ℚ)) :=
  ∑ j ∈ Finset.Ico 1 (addOrderOf a),
    AddMonoidAlgebra.single (j • a) ((j : ℚ) / addOrderOf a - 1 / 2)

/-- The first Eisenstein functions generate the whole rational torsion group
algebra (§6.37, Connes–Marcolli Theorem 3.30). -/
theorem firstEisenstein_generate :
    Algebra.adjoin ℚ (Set.range firstEisenstein) = ⊤ := by
  sorry

local instance : MeasurableSpace (IsDedekindDomain.FiniteAdeleRing ℤ ℚ) :=
  borel (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)

/-- A normalized `β`-scaling Radon measure on the finite adeles: inner regular,
locally finite, of mass one on `Ẑ`, with `q_*μ = q^β μ` for every positive
rational `q` (§6.10). -/
def IsScalingMeasure (β : ℝ) (μ : Measure (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)) : Prop :=
  μ.InnerRegular ∧ IsLocallyFiniteMeasure μ ∧
    μ {a | ∀ v : IsDedekindDomain.HeightOneSpectrum ℤ,
      a v ∈ v.adicCompletionIntegers ℚ} = 1 ∧
    ∀ q : ℚ, 0 < q →
      Measure.map (fun x : IsDedekindDomain.FiniteAdeleRing ℤ ℚ => q • x) μ =
        ENNReal.ofReal ((q : ℝ) ^ β) • μ

/-- In the critical interval there is exactly one normalized Radon scaling
measure on the finite adeles (§6.40); no unit invariance is assumed. -/
theorem critical_scaling_measure_unique (β : ℝ) (hβ : 0 < β) (hβ' : β ≤ 1) :
    ∃! μ : Measure (IsDedekindDomain.FiniteAdeleRing ℤ ℚ), IsScalingMeasure β μ := by
  sorry

/-- The profinite units `W = Ẑ^×` inside the finite adeles: every coordinate has
valuation one (§6.48). -/
def finiteAdeleUnits : Set (IsDedekindDomain.FiniteAdeleRing ℤ ℚ) :=
  {a | ∀ v : IsDedekindDomain.HeightOneSpectrum ℤ, Valued.v (a v) = 1}

/-- The unit-orbit sum `ζ(β)⁻¹ Σ_{q ∈ ℚ_+^×} q^(−β) (q_*ν)` of a measure on the
finite adeles (§6.48b). -/
def unitOrbitSum (β : ℝ) (ν : Measure (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)) :
    Measure (IsDedekindDomain.FiniteAdeleRing ℤ ℚ) :=
  (ENNReal.ofReal (riemannZeta (β : ℂ)).re)⁻¹ •
    Measure.sum fun q : {q : ℚ // 0 < q} =>
      ENNReal.ofReal (((q : ℚ) : ℝ) ^ (-β)) •
        Measure.map (fun x : IsDedekindDomain.FiniteAdeleRing ℤ ℚ => (q : ℚ) • x) ν

/-- Above the critical inverse temperature the normalized scaling measures are
exactly the unit-orbit sums of the Borel probability measures carried by `Ẑ^×`,
and each gives `Ẑ^×` mass `1/ζ(β)` (§6.48b, the measure form of §6.50). -/
theorem supercritical_scaling_measures (β : ℝ) (hβ : 1 < β) :
    (∀ ν : Measure (IsDedekindDomain.FiniteAdeleRing ℤ ℚ),
      IsProbabilityMeasure ν → ν finiteAdeleUnitsᶜ = 0 →
        IsScalingMeasure β (unitOrbitSum β ν) ∧
        unitOrbitSum β ν finiteAdeleUnits = (ENNReal.ofReal (riemannZeta (β : ℂ)).re)⁻¹ ∧
        ENNReal.ofReal (riemannZeta (β : ℂ)).re •
          (unitOrbitSum β ν).restrict finiteAdeleUnits = ν) ∧
    ∀ μ : Measure (IsDedekindDomain.FiniteAdeleRing ℤ ℚ), IsScalingMeasure β μ →
      μ finiteAdeleUnits = (ENNReal.ofReal (riemannZeta (β : ℂ)).re)⁻¹ ∧
      ∃! ν : Measure (IsDedekindDomain.FiniteAdeleRing ℤ ℚ),
        IsProbabilityMeasure ν ∧ ν finiteAdeleUnitsᶜ = 0 ∧ μ = unitOrbitSum β ν := by
  sorry

end TauCetiRoadmap.AnalyticNumberTheoryPartII
