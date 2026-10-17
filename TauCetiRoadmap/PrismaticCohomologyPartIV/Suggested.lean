import Mathlib

/-!
# PrismaticCohomologyPartIV: representative target signatures

The roadmap is README.md; references of the form §8.n are to its subsections. This file records
the light definitions and representative theorem signatures of Layer 8 (logarithmic prismatic
cohomology) that can be stated against the pinned Mathlib. These are suggested forms, not an exhaustive checklist.
The README is the definitive specification.

Design choices made explicit here:
* A δ_log-structure (§8.1) is recorded relative to a given function `δ : A → A` and a prelog
  structure `α : M →* A`. In the roadmap `δ` is the delta operation of a δ-ring
  (PrismaticCohomology, Layer 0); here it is a parameter, and a
  statement that needs the δ-ring product rule assumes that rule explicitly.
* Monoid tilts (§8.14) use Mathlib's `Perfection M p` directly. Unique p-divisibility uses
  `PerfectRing M p`, and pseudo-perfectoidness uses `PerfectRing (Associates M) p`.
  The perfectoid condition is stated through Mathlib's `Associated`.
* The additive chart monoid `ℕ` appears as `Multiplicative ℕ`. Kummer homomorphisms of monoids
  are CrystallineCohomology's `LogCrystalline.IsKummerHom` and are not restated here.
* Log prisms, the log prismatic and log q-crystalline sites, Kummer-étale and
  quasi-pro-Kummer-étale sites, log diamonds and the comparison theorems need carriers that are
  not at the pins. They are README targets, listed in the closing comment.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartIV

/-! ## Layer 8: Logarithmic prismatic cohomology -/

/-! ### §8.1–8.2 δ_log-structures and the logarithmic Frobenius -/

namespace Log

variable {A M : Type*} [CommRing A] [CommMonoid M]

/-- A δ_log-structure on the prelog ring `α : M →* A`, relative to the delta operation `δ` of
`A` (Koshikawa, Definition 2.2): a map `deltaLog : M → A` that vanishes at the unit, satisfies
`α(m)^p · δ_log(m) = δ(α(m))`, and obeys the twisted additivity rule. No integrality or log-ring
condition is imposed on `M`. -/
structure DeltaLogStructure (p : ℕ) (δ : A → A) (α : M →* A) where
  /-- The logarithmic delta map `δ_log : M → A`. -/
  deltaLog : M → A
  deltaLog_one : deltaLog 1 = 0
  compat : ∀ m, α m ^ p * deltaLog m = δ (α m)
  deltaLog_mul : ∀ m n,
    deltaLog (m * n) = deltaLog m + deltaLog n + (p : A) * deltaLog m * deltaLog n

/-- The logarithmic Frobenius correction factor `m ↦ 1 + p · δ_log(m)`. -/
def unitFactor (p : ℕ) (deltaLog : M → A) (m : M) : A := 1 + (p : A) * deltaLog m

namespace DeltaLogStructure

variable {p : ℕ} {δ : A → A} {α : M →* A}

/-- Rank one means `δ_log = 0`. -/
def IsRankOne (s : DeltaLogStructure p δ α) : Prop := s.deltaLog = 0

/-- If `δ` vanishes on the image of `α` (Teichmüller charts, the Breuil–Kisin chart `n ↦ u^n`
with `φ(u) = u^p`), then `δ_log = 0` is a δ_log-structure, of rank one. -/
def rankOne (h : ∀ m, δ (α m) = 0) : DeltaLogStructure p δ α where
  deltaLog _ := 0
  deltaLog_one := rfl
  compat m := by simp [h m]
  deltaLog_mul _ _ := by simp

/-- On a chart of nonzerodivisors a δ_log-structure is unique (Koshikawa, after
Definition 2.2). -/
theorem deltaLog_unique_of_nonZeroDivisor (hα : ∀ m, α m ∈ nonZeroDivisors A)
    (s t : DeltaLogStructure p δ α) : s.deltaLog = t.deltaLog := by
  funext m
  have hpow : α m ^ p ∈ nonZeroDivisors A := pow_mem (hα m) p
  have h0 : (s.deltaLog m - t.deltaLog m) * α m ^ p = 0 := by
    linear_combination (s.compat m) - (t.compat m)
  exact sub_eq_zero.mp ((mem_nonZeroDivisors_iff.mp hpow).2 _ h0)

/-- On a chart of nonzerodivisors, a δ_log-structure exists exactly when `α(m)^p` divides
`δ(α(m))` for every `m`. The δ-ring rules `δ(1) = 0` and the product rule are assumed; no
`p`-torsion-freeness is needed, since one cancels `α(mn)^p`. -/
theorem exists_iff_dvd (hα : ∀ m, α m ∈ nonZeroDivisors A) (hδ_one : δ 1 = 0)
    (hδ_mul : ∀ x y, δ (x * y) = x ^ p * δ y + y ^ p * δ x + (p : A) * δ x * δ y) :
    Nonempty (DeltaLogStructure p δ α) ↔ ∀ m, α m ^ p ∣ δ (α m) := by
  sorry

/-- The rank-one structure has zero logarithmic delta and satisfies the rank-one predicate. -/
example (h : ∀ m, δ (α m) = 0) :
    (rankOne (p := p) h).IsRankOne ∧ ∀ m, (rankOne (p := p) h).deltaLog m = 0 := by
  exact ⟨rfl, fun _ => rfl⟩

/-- `Log.DeltaLogStructure.nonzero_logDelta_witness` provides a zero chart on `ℤ`
with a nonzero logarithmic delta at `p = 2`:
`δ_log(ofAdd n) = (3^n - 1)/2` has values one and four on the first two powers. -/
example : ∃ s : DeltaLogStructure 2
    (fun z : ℤ ↦ (z - z ^ 2) / 2) (powersHom ℤ 0),
    s.deltaLog (Multiplicative.ofAdd 1) = 1 ∧
    s.deltaLog (Multiplicative.ofAdd 2) = 4 := by
  sorry

end DeltaLogStructure

/-- The correction factor is multiplicative: the cross term `p·δ_log(m)·δ_log(n)` is what makes
`m ↦ 1 + p·δ_log(m)` a monoid map (§8.1, `Log.unitFactor_mul`). -/
theorem unitFactor_mul {p : ℕ} {δ : A → A} {α : M →* A} (s : DeltaLogStructure p δ α)
    (m n : M) :
    unitFactor p s.deltaLog (m * n) = unitFactor p s.deltaLog m * unitFactor p s.deltaLog n := by
  simp only [unitFactor, s.deltaLog_mul]
  ring

/-- For the unit chart at `p = 2` with identity Frobenius, compatibility forces
`δ_log(3) = −1/3 ≠ 0`. This is the unit calculation in §8.15: the Teichmüller chart has
rank one, while its logification contains units with nonzero logarithmic delta. -/
example (s : DeltaLogStructure 2 (fun x : ℚ ↦ (x - x ^ 2) / 2) (Units.coeHom ℚ)) :
    s.deltaLog (Units.mk0 (3 : ℚ) (by norm_num)) = -(1 / 3 : ℚ) ∧
      s.deltaLog (Units.mk0 (3 : ℚ) (by norm_num)) ≠ 0 := by
  have h := s.compat (Units.mk0 (3 : ℚ) (by norm_num))
  change (3 : ℚ) ^ 2 * s.deltaLog (Units.mk0 (3 : ℚ) (by norm_num)) = (3 - 3 ^ 2) / 2 at h
  constructor <;> linarith

/-- On the chart, the Frobenius `φ(x) = x^p + p·δ(x)` is `α(m)^p` times the correction factor
(§8.1, `Log.frobenius_chart`). It is an equality; `α(m)^p` is never cancelled. -/
theorem frobenius_chart {p : ℕ} {δ : A → A} {α : M →* A} (s : DeltaLogStructure p δ α)
    (m : M) : α m ^ p + (p : A) * δ (α m) = α m ^ p * unitFactor p s.deltaLog m := by
  rw [← s.compat m]
  simp only [unitFactor]
  ring

/-- The unit section has correction factor one. -/
example {p : ℕ} {δ : A → A} {α : M →* A} (s : DeltaLogStructure p δ α) :
    unitFactor p s.deltaLog 1 = 1 := by
  simp [unitFactor, s.deltaLog_one]

/-- For the trivial monoid every δ_log-structure is the zero one: the structure is unique. -/
example {p : ℕ} {δ : A → A} {α : PUnit →* A} (s t : DeltaLogStructure p δ α) :
    s.deltaLog = t.deltaLog := by
  funext u
  exact s.deltaLog_one.trans t.deltaLog_one.symm

/-- On `ℤ[x]` with `δ(x) = 1` and the chart `n ↦ x^n` there is no δ_log-structure: `x^2` does
not divide `1`. A δ_log-structure is not an arbitrary choice of values. -/
example (δ : Polynomial ℤ → Polynomial ℤ) (hδ : δ Polynomial.X = 1) :
    IsEmpty (DeltaLogStructure 2 δ (powersHom (Polynomial ℤ) Polynomial.X)) := by
  refine ⟨fun s => ?_⟩
  have h := congrArg (Polynomial.eval 0) (s.compat (Multiplicative.ofAdd 1))
  simp [hδ] at h

/-- At `p = 2`, a δ_log value one gives correction factor three, and the square has δ_log value
four and factor nine, not an additive value two. -/
example {δ : ℤ → ℤ} {α : M →* ℤ} (s : DeltaLogStructure 2 δ α) (m : M) (h : s.deltaLog m = 1) :
    unitFactor 2 s.deltaLog m = 3 ∧ s.deltaLog (m * m) = 4 ∧
      unitFactor 2 s.deltaLog (m * m) = 9 := by
  have hh : s.deltaLog (m * m) = 4 := by rw [s.deltaLog_mul, h]; norm_num
  exact ⟨by norm_num [unitFactor, h], hh, by norm_num [unitFactor, hh]⟩

/-- For a zero chart section, compatibility does not determine δ_log: the values zero and one
satisfy `0^2 · δ_log = δ(0)` alike but give different correction factors. -/
example : (0 : ℤ) ^ 2 * unitFactor 2 (fun _ : ℕ ↦ (0 : ℤ)) 2 =
    0 ^ 2 * unitFactor 2 (fun _ : ℕ ↦ (1 : ℤ)) 2 ∧
    unitFactor 2 (fun _ : ℕ ↦ (0 : ℤ)) 2 ≠ unitFactor 2 (fun _ : ℕ ↦ (1 : ℤ)) 2 := by
  norm_num [unitFactor]

end Log

/-! ### §8.14 Perfectoid monoids -/

namespace Monoid

variable (M : Type*) [CommMonoid M] (p : ℕ)

/-- `M` is perfectoid: the zeroth projection `M♭ → M` induces a bijection
`M♭/(M♭)^× → M/M^×`, stated through `Associated`. -/
def IsPerfectoid : Prop :=
  (∀ m : M, ∃ f : Perfection M p, Associated (f.1 0) m) ∧
    ∀ f g : Perfection M p, Associated (f.1 0) (g.1 0) → Associated f g

variable {M p}

/-- Perfect monoids are perfectoid. -/
theorem perfectRing_isPerfectoid [PerfectRing M p] : IsPerfectoid M p := by
  sorry

/-- Unique p-divisibility descends to the associates quotient: the inverse power
map preserves units and induces the inverse on the quotient. -/
theorem perfectRing_associates [PerfectRing M p] : PerfectRing (Associates M) p := by
  sorry

/-- Quotienting a commutative group by its units leaves a single associate class. -/
example (G : Type*) [CommGroup G] : Subsingleton (Associates G) := by
  sorry

/-- With no nontrivial units, the associates quotient identifies no distinct elements. -/
example (M : Type*) [CommMonoid M] (hM : ∀ u : Mˣ, (u : M) = 1) :
    Function.Injective (Associates.mk : M → Associates M) := by
  sorry

/-- The associates quotient of a product with a group removes exactly the group factor. -/
example (G M : Type*) [CommGroup G] [CommMonoid M] :
    Nonempty (Associates (G × M) ≃* Associates M) := by
  sorry

/-- Perfectoid monoids are pseudo-perfectoid. -/
theorem IsPerfectoid.perfectRing_associates (h : IsPerfectoid M p) : PerfectRing (Associates M) p := by
  sorry

/-- Every commutative group is perfectoid: both quotients by units are trivial. -/
theorem isPerfectoid_units (G : Type*) [CommGroup G] : IsPerfectoid G p := by
  sorry

/-- The additive monoid `ℕ` is not `2`-divisible, hence not perfect: `1` has no half. -/
example : ¬ PerfectRing (Multiplicative ℕ) 2 := by
  intro h
  obtain ⟨m, hm⟩ := h.bijective_frobenius.2 (Multiplicative.ofAdd 1)
  have h1 := congrArg Multiplicative.toAdd hm
  simp only [toAdd_pow, toAdd_ofAdd, smul_eq_mul] at h1
  omega

/-- The trivial monoid is perfectoid for every exponent. -/
example (p : ℕ) : IsPerfectoid PUnit p := by
  exact isPerfectoid_units (p := p) PUnit

/-- The monoid `ℕ` has trivial tilt at exponent two; it is not perfectoid. -/
example : ¬ IsPerfectoid (Multiplicative ℕ) 2 := by
  sorry

end Monoid

/-! ### §8.40 Log q-de Rham coefficients -/

namespace LogQDeRham

variable {R : Type*} [CommRing R]

/-- The ordered merge telescopes, retaining its `q`-dependent coefficient:
`[2]_q + q^2 [2]_q = [4]_q`. -/
example (q : R) : (1 + q) + q ^ 2 * (1 + q) = 1 + q + q ^ 2 + q ^ 3 := by ring

/-- Merging two coordinates of `X₀X₁` gives `(1 + q)X²`, the differential of `X²`; ordinary
pullback would give `2X²`, which differs by `(q - 1)X²`. -/
example (q : R) : (1 + q) - 2 = q - 1 := by ring

/-- For `d¹(u, v) = Bu − Av`, the swapped merge minus the original is `H²d¹`, where
`H²(w) = (q − 1)w`. This fixes the homotopy sign without cancelling `q − 1`. -/
example (q A B u v : R) (hA : q ^ 2 - 1 = (q - 1) * A) (hB : q - 1 = (q - 1) * B) :
    (q - 1) * u + (1 - q ^ 2) * v = (q - 1) * (B * u - A * v) := by
  calc
    (q - 1) * u + (1 - q ^ 2) * v = (q - 1) * B * u - (q - 1) * A * v := by
      rw [← hA, ← hB]; ring
    _ = (q - 1) * (B * u - A * v) := by ring

/-- The negative exponent: `[−1]_q (q − 1) = q⁻¹ − 1` with `[−1]_q = −q⁻¹`, so
`D(X⁻¹) = −q⁻¹ X⁻¹`; a formula using only nonnegative exponents misses this chart. -/
example (q : Rˣ) : ((q⁻¹ : Rˣ) : R) - 1 = -((q⁻¹ : Rˣ) : R) * ((q : R) - 1) := by
  linear_combination (Units.inv_mul q)

/-- The intrinsic generator of `2ℕ ⊂ ℤ` is kept at `p = 2`: `2` lies in `2ℤ` and `1` does
not, so no ambient `dlog X` is an integral form on that chart. -/
example : (2 : ℤ) ∈ AddSubgroup.zmultiples (2 : ℤ) ∧
    (1 : ℤ) ∉ AddSubgroup.zmultiples (2 : ℤ) := by
  simp [Int.mem_zmultiples_iff]

end LogQDeRham

/-! ### §§8.70–8.72 Disconnected ranks and small-prime inertia controls -/

/-- The ranks one and two on two clopen components admit no single constant rank
(§§8.70–8.71). Their trivial-log local system satisfies the p-Kummer test piecewise. -/
example : ¬ ∃ r : ℕ, ∀ b : Bool, (if b then 2 else 1 : ℕ) = r := by
  rintro ⟨r, hr⟩
  have h₁ := hr false
  have h₂ := hr true
  simp only [Bool.false_eq_true, ↓reduceIte] at h₁
  simp only [↓reduceIte] at h₂
  omega

/-- At `p = 3`, the sign character retains order two modulo `p`. -/
example : (-1 : ZMod 3) ^ 2 = 1 ∧ (-1 : ZMod 3) ≠ 1 := by
  decide

/-- A determinant-one integer matrix has order three; scalar extension gives an
integral order-three action on `ℤ₂²`. -/
example : let a : Matrix (Fin 2) (Fin 2) ℤ := !![0, -1; 1, -1]
    a.det = 1 ∧ a ^ 3 = 1 ∧ a ≠ 1 := by
  sorry

/-- Reduction modulo two retains order three, so its image is not a two-group. -/
example : let a : Matrix (Fin 2) (Fin 2) (ZMod 2) := !![0, -1; 1, -1]
    a.det = 1 ∧ a ^ 3 = 1 ∧ a ≠ 1 := by
  sorry

/-! ### §8.76a The divided-power contraction exponent -/

namespace LogPDDeformation

-- Legendre: the `p`-adic valuation of `(p^n)!` is `e(n) = 1 + p + ⋯ + p^(n-1)`; with
-- `Nat.Prime.emultiplicity_factorial_mul` this gives `v_p((r p^n)!/r!) = r·e(n)`.
#check @Nat.Prime.multiplicity_factorial_pow

/-- For a positive chart monomial `t`, at `p = 2` the first two contraction exponents are
one and three: `φ(t) = 2γ₂(t)` and
`φ²(t) = 24γ₄(t)`. The exponent grows like `2^n - 1`, not like `n`. -/
example : 2 ∣ Nat.factorial 2 ∧ ¬ 4 ∣ Nat.factorial 2 ∧
    8 ∣ Nat.factorial 4 ∧ ¬ 16 ∣ Nat.factorial 4 := by decide

end LogPDDeformation

/-! ### §8.0 The periodic coefficient reduction -/

/-- Multiplication by two over `ℤ/4` has kernel equal to its image, giving the exact
periodic free resolution of `ℤ/2` in §8.0. Reduction to `ℤ/2` makes every differential zero. -/
example : (∀ x : ZMod 4, 2 * x = 0 ↔ ∃ y : ZMod 4, x = 2 * y) ∧
    (∀ x : ZMod 2, 2 * x = 0) := by
  decide

end TauCetiRoadmap.PrismaticCohomologyPartIV

/-!
## Layer 8 targets this file does not type

These are stated in README.md with their hypotheses, APIs and Checks; their carriers (δ-rings
with completions, prisms, log formal schemes, sites and topoi, derived categories of sheaves,
diamonds and condensed coefficients) are not at the pins.

* §§8.0–8.0d: algebraic Witt–Frobenius modules and the solution functor, formal integral
  logarithmic charts, `FormalLog.IsSmooth`, the completed log cotangent complex, completed log PD
  envelopes and the big formal log crystalline site, including its continuous compatible PD
  data. Derived complete flatness of smooth charts uses the stated completion comparison
  (bounded base p-power torsion in the p-adic case).
  `LogRH.algebraicDerived` and `LogRH.solution_equivalence` retain all bounded algebraic
  objects and arbitrary bounded sheaf complexes. For `n ≥ 2`, `LogRH.wittReduction`
  compares derived coefficient change only when both reductions are bounded; finite Tor
  amplitude on both sides suffices. On Frobenius modules it uses derived Witt truncation
  over the perfected base and restriction back to the original base. Ordinary p-filtration,
  p-torsion and quotient exact sequences give bounded triangles without this hypothesis.
* §§8.3–8.13: free δ_log-rings, completions, associated log structures, extension to `M^gp`,
  exactification of δ_log-triples, prelog and log prisms, the standard prelog prisms, prelog and
  log prismatic envelopes and their flatness.
* §§8.15–8.17: perfect log prisms, perfectoid log rings and the equivalence with perfect log
  prisms; log cotangent complexes of perfectoid pre-log rings.
  `LogPrism.ainfPerfect` gives a rank-one Teichmüller prelog prism for a perfectoid integral
  pre-log ring, and a perfect associated log prism admitting that specified rank-one chart.
  It does not assert that logarithmic delta vanishes on all units after logification.
* §§8.18–8.35: the relative and absolute log prismatic sites, log prismatic cohomology,
  Čech–Alexander complexes, the log Hodge–Tate comparison, base change, the δ_log-crystalline
  site and the log crystalline comparison. In §8.24a,
  `LogPrismaticSite.hodgeTateMap_degree0`, `LogPrismaticSite.hodgeTateMap_degree1`,
  `LogPrismaticSite.hodgeTateMap_cotangent` and
  `LogPrismaticSite.hodgeTateMap_degree01_natural` construct the low-degree maps before
  the log-line calculation. `LogPrismaticSite.hodgeTate_logLine` identifies these maps
  with `H⁰ = R` and `H¹{1} = R·dlog X₀` and gives vanishing in degrees at least two;
  §8.27 extends them to a cdga map using that calculation. The crystalline comparison
  over `(W(k), (p), N → 0)` takes qcqs smooth Cartier-type log schemes over `(k, N → 0)`,
  for a perfect characteristic-p field k.
* §§8.36–8.42: log q-PD triples and envelopes, the log q-crystalline site, the log q-de Rham
  complexes, and the comparisons with semistable `AΩ` and the `C_st` diagram.
* §§8.43–8.58: log quasisyntomic sites and log quasiregular semiperfectoid rings (supplied by
  CrystallineCohomology §§CR.DDR.6.15–CR.DDR.6.17), derived log prismatic cohomology, initial log prisms, the log
  Nygaard filtration and its comparisons, and Breuil–Kisin log cohomology.
  `DerivedLogPrismatic.logificationCotangent` supplies unrestricted cotangent logification
  through the free resolutions.
* §§8.59–8.75: Kummer-étale sites of fs log schemes and log adic spaces, completed untilt sheaves
  and profinite coefficients, log diamonds, the quasi-pro-Kummer-étale site, the Kummer-étale
  comparison, Kummer-étale and p-Kummer local systems, Laurent F-crystals and the corrected
  Laurent realization, and proper smooth saturated pushforward with the Cartier-type mod-p
  hypothesis in applications of the global comparison. The scheme Kummer-étale site is
  small. Section 8.60 supplies the shared `TauCeti.LogAdic.LogStructure`,
  `TauCeti.LogAdic.logification`, `TauCeti.LogAdic.logPullback`,
  `TauCeti.LogAdic.IntegralChart` and `TauCeti.LogAdic.KummerEtaleSite`, with finite-free
  local systems `NoetherianFsLogAdicSpace.LocalSystem`.
  `PKummerLocalSystem.stdisc_iff` tests all compatible-chart maps from saturated log diamonds
  whose underlying perfectoid is strictly totally disconnected and whose characteristic is
  p-divisible. Pullbacks are constant on a finite clopen partition, with ranks allowed to vary.
  This condition uses no all-integer divisibility predicate on the log structure. For locally
  perfect complexes, the universal and p-root-chart criteria require ordinary quasi-pro-étale
  locally perfect pullbacks, allowing different perfect fibres and amplitudes on different pieces.
* §§8.76–8.79: the étale comparison over `A_inf[1/φ⁻¹(μ)]`, the log PD deformation base and
  Frobenius rigidity, the Hyodo–Kato isomorphism over `A_crys`, Breuil–Kisin–Fargues modules,
  and the standard semistable chart.

Named README targets and Checks whose carriers require the constructions above:

* §§8.1–8.6:
  `Log.DeltaLogStructure.alpha_frobeniusMonoid`
  `Log.DeltaLogStructure.alpha_rankOneFrobeniusMonoid`
  `Log.DeltaLogStructure.extend_universal`
  `Log.DeltaLogStructure.freeOnMonoid_trivial`
  `Log.DeltaLogStructure.freeOneGenerator_equiv_mvPolynomial`
  `Log.DeltaLogStructure.freeOneGenerator_frobenius_faithfullyFlat`
  `Log.DeltaLogStructure.freeOneGenerator_frobenius_x`
  `Log.DeltaLogStructure.freeOneGenerator_not_monoidAlgebra`
  `Log.DeltaLogStructure.frobeniusMonoid_bk`
  `Log.DeltaLogStructure.frobeniusMonoid_eq_pow_of_rankOne`
  `Log.DeltaLogStructure.frobeniusMonoid_natural`
  `Log.DeltaLogStructure.frobeniusMonoid_not_pow`
  `Log.DeltaLogStructure.frobeniusMonoid_trivial`
  `Log.DeltaLogStructure.frobeniusMonoid_units`
  `Log.DeltaLogStructure.frobenius_iterate_alpha`
  `Log.DeltaLogStructure.invertGenerator_completion`
  `Log.DeltaLogStructure.monoidAlgebra_rankOne`
  `Log.DeltaLogStructure.not_any_map`
  `Log.DeltaLogStructure.pdivisible_rankOne`
  `Log.DeltaLogStructure.trivialLog_deltaLog`
  `Log.DeltaLogStructure.zero_monoid`
  `Log.frobenius_chart_example`

* §8.14:
  `Monoid.nat_not_perfect`
  `Monoid.pseudoPerfectoid_not_perfectoid`
  `Monoid.valuationMonoid_perfectoid_not_perfect`

* §8.40:
  `LogQDeRham.affineLine_monomial`
  `LogQDeRham.coordinate_merge`
  `LogQDeRham.frobenius_dlog`
  `LogQDeRham.frobenius_l_eta`
  `LogQDeRham.intrinsic_lattice`
  `LogQDeRham.merge_order_homotopy`
  `LogQDeRham.missing_coordinate`
  `LogQDeRham.mod_q_sub_one`
  `LogQDeRham.not_nonlog_derivative`
  `LogQDeRham.q_one_limit`
  `LogQDeRham.refinement_cocycle`

* §8.76a:
  `LogPDDeformation.empty_chart`
  `LogPDDeformation.frobenius_bound`
  `LogPDDeformation.nonfree_chart`
  `LogPDDeformation.nonzero_parameter`
  `LogPDDeformation.one_parameter`
  `LogPDDeformation.two_parameters`
  `LogPDDeformation.zero_complex`

-/
