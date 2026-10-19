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

/-- README §8.1, `Log.DeltaLogStructure.equivWittSection`: logarithmic delta structures
are length-two Witt monoid sections with first coordinate one and the chart compatibility. -/
theorem equivWittSection [Fact p.Prime] :
    Nonempty (DeltaLogStructure p δ α ≃
      {w : M →* TruncatedWittVector p 2 A //
        (∀ m, (w m).coeff 0 = 1) ∧
        ∀ m, TruncatedWittVector.mk p ![α m, δ (α m)] =
          TruncatedWittVector.mk p ![α m, 0] * w m}) := by
  sorry

/-- README §8.1, `Log.DeltaLogStructure.trivialLog`: the unit chart has a unique
logarithmic delta structure, with value `δ(u) / u^p`. Only the unit and product delta
rules are needed. -/
theorem trivialLog (hδ_one : δ 1 = 0)
    (hδ_mul : ∀ x y, δ (x * y) = x ^ p * δ y + y ^ p * δ x + (p : A) * δ x * δ y) :
    ∃! s : DeltaLogStructure p δ (Units.coeHom A),
      ∀ u : Aˣ, s.deltaLog u = δ (u : A) * ((u⁻¹ : Aˣ) : A) ^ p := by
  sorry

/-- README §8.1, `Log.DeltaLogStructure.baseChange`: a delta-compatible ring map
transports the logarithmic delta values and the prelog chart to its codomain. -/
theorem baseChange {B : Type*} [CommRing B] (f : A →+* B) (δB : B → B)
    (hδ : ∀ x, δB (f x) = f (δ x)) (s : DeltaLogStructure p δ α) :
    ∃ t : DeltaLogStructure p δB (f.toMonoidHom.comp α),
      t.deltaLog = f ∘ s.deltaLog := by
  sorry

/-- README §8.2, `Log.DeltaLogStructure.alpha_rankOneFrobeniusMonoid`: the power map
on a rank-one prelog chart lifts ring Frobenius, without a log-ring hypothesis. -/
theorem alpha_rankOneFrobeniusMonoid (s : DeltaLogStructure p δ α) (h : s.IsRankOne)
    (m : M) : α (m ^ p) = α m ^ p + (p : A) * δ (α m) := by
  sorry

/-- README §8.1, `Log.DeltaLogStructure.frobenius_iterate_alpha`: every Frobenius
iterate on a chart section is its corresponding power times a factor in `1 + pA`. -/
theorem frobenius_iterate_alpha (s : DeltaLogStructure p δ α) (φ : A →+* A)
    (hφ : ∀ x, φ x = x ^ p + (p : A) * δ x) (n : ℕ) (m : M) :
    ∃ a : A, φ^[n] (α m) = α m ^ (p ^ n) * (1 + (p : A) * a) := by
  sorry

/-- README §8.6, `Log.DeltaLogStructure.groupification`: logarithmic delta extends
uniquely to the group completion of an integral chart when `p` is in the Jacobson radical. -/
theorem groupification [IsCancelMul M] (s : DeltaLogStructure p δ α)
    (hp : (p : A) ∈ (⊥ : Ideal A).jacobson) :
    ∃! d : Algebra.GrothendieckGroup M → A,
      (∀ m, d (Algebra.GrothendieckGroup.of m) = s.deltaLog m) ∧ d 1 = 0 ∧
      ∀ m n, d (m * n) = d m + d n + (p : A) * d m * d n := by
  sorry

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

/-- README §8.1, `Log.DeltaLogStructure.nonzero_logDelta_witness`: a zero chart
admits a structure with nonzero logarithmic delta despite its vanishing positive
chart values. The integer model extends to the p-local example. -/
theorem nonzero_logDelta_witness : ∃ s : DeltaLogStructure 2
    (fun z : ℤ ↦ (z - z ^ 2) / 2) (powersHom ℤ 0),
    ¬ s.IsRankOne ∧ s.deltaLog (Multiplicative.ofAdd 1) = 1 ∧
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

/-- On the chart, the Frobenius `φ(x) = x^p + p·δ(x)` is `α(m)^p` times the correction factor
(§8.1, `Log.frobenius_chart`). It is an equality; `α(m)^p` is never cancelled. -/
theorem frobenius_chart {p : ℕ} {δ : A → A} {α : M →* A} (s : DeltaLogStructure p δ α)
    (m : M) : α m ^ p + (p : A) * δ (α m) = α m ^ p * unitFactor p s.deltaLog m := by
  rw [← s.compat m]
  simp only [unitFactor]
  ring

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

/-- Perfectoid monoids are pseudo-perfectoid. -/
theorem IsPerfectoid.perfectRing_associates (h : IsPerfectoid M p) : PerfectRing (Associates M) p := by
  sorry

/-- Every commutative group is perfectoid: both quotients by units are trivial. -/
theorem isPerfectoid_units (G : Type*) [CommGroup G] : IsPerfectoid G p := by
  sorry

/-- Perfectoidness ignores unit directions: the group `ℤ` is perfectoid as a monoid
although its power map at two is not surjective. -/
example : IsPerfectoid (Multiplicative ℤ) 2 ∧ ¬ PerfectRing (Multiplicative ℤ) 2 := by
  refine ⟨isPerfectoid_units (Multiplicative ℤ), ?_⟩
  intro h
  obtain ⟨m, hm⟩ := h.bijective_frobenius.2 (Multiplicative.ofAdd 1)
  have h1 := congrArg Multiplicative.toAdd hm
  change (2 : ℕ) • Multiplicative.toAdd m = (1 : ℤ) at h1
  simp only [two_smul] at h1
  omega

/-- README §8.14, `Monoid.nat_not_perfect`: the sharp monoid `ℕ` is neither perfect
nor perfectoid at two; its tilt is trivial and the zeroth projection misses its generator. -/
theorem nat_not_perfect :
    ¬ PerfectRing (Multiplicative ℕ) 2 ∧ ¬ IsPerfectoid (Multiplicative ℕ) 2 := by
  sorry

end Monoid

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
  `FormalLog.Chart.exact_neighbourhood` takes an existing relatively fine chart over the
  integral base chart `M`, another integral chart `M′` of the same base log structure, and
  a geometric point `x`. The abelian group `G` contains `M′^gp` and is finitely generated
  over it. A compatible homomorphism `h : G → M_X,x^gp` surjects after quotienting by units;
  the kernel on `M′^gp` is finitely generated modulo `M′^×`. The inverse image of the
  characteristic monoid is relatively finitely presented over `M′`, and its map induced
  by `h` extends to an étale neighbourhood chart exact at `x`.
  `LogRH.algebraicDerived` and `LogRH.solution_equivalence` retain all bounded algebraic
  objects and arbitrary bounded sheaf complexes. For `n ≥ 2`, `LogRH.wittReduction`
  compares derived coefficient change only when both reductions are bounded; finite Tor
  amplitude on both sides suffices. On Frobenius modules it uses derived Witt truncation
  over the perfected base and restriction back to the original base. Ordinary p-filtration,
  p-torsion and quotient exact sequences give bounded triangles without this hypothesis.
* §§8.3–8.13: free δ_log-rings, completions, associated log structures, delta-ring extensions
  along submonoids of `M^gp`, exactification of δ_log-triples, prelog and log prisms, the
  standard prelog prisms, prelog and log prismatic envelopes and their flatness.
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
  `Log.DeltaLogStructure.invertGenerator_completion`
  `Log.DeltaLogStructure.monoidAlgebra_rankOne`
  `Log.DeltaLogStructure.not_any_map`
  `Log.DeltaLogStructure.pdivisible_rankOne`
  `Log.DeltaLogStructure.trivialLog_deltaLog`
  `Log.DeltaLogStructure.zero_monoid`
  `Log.frobenius_chart_example`

* §8.14:
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
