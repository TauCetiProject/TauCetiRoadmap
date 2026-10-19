import Mathlib

/-!
# Arakelov geometry and heights of abelian varieties: representative target signatures

The roadmap is `README.md`, which is definitive. This file is not exhaustive: it records light
definitions and representative theorem signatures over carriers available in Mathlib and Tau Ceti.
The theorems and examples below are suggestions, not claims of formalization.

The divisor coefficients include infinite-place multiplicities; the projective comparison uses
Mathlib's relative height. The elliptic term uses the normalized discriminant `Δ = η²⁴`, with
the separate `(2π)^12` conversion to the lattice discriminant. The one-variable logarithmic
predicate includes eventual positivity and a positive bound constant, and concerns a fixed frame
of the fixed boundary extension. Hermitian arithmetic bundles, Néron Hodge lines, compactified
moduli and their heights are specified in the README.
-/

namespace TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

open NumberField
open scoped nonZeroDivisors

noncomputable section

/-! ## Layer 1: Hermitian bundles, arithmetic divisors and heights -/

variable (K : Type*) [Field K] [NumberField K]

/-- An Arakelov divisor is an invertible fractional ideal and one real coefficient per infinite
place. Addition multiplies the ideals and adds the coefficients (README §1.7). -/
abbrev ArakelovDivisor : Type _ :=
  Additive (FractionalIdeal (𝓞 K)⁰ K)ˣ × (InfinitePlace K → ℝ)

namespace ArakelovDivisor

variable {K}

/-- The finite ideal `∏𝔭^(n_𝔭)`, with its divisor rather than its line-bundle sign. -/
def finitePart (D : ArakelovDivisor K) : FractionalIdeal (𝓞 K)⁰ K :=
  ((Additive.toMul D.1 : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K)

/-- The infinite-place coefficient, already weighted by multiplicity. -/
def infinitePart (D : ArakelovDivisor K) (v : InfinitePlace K) : ℝ := D.2 v

/-- The finite logarithmic norm plus the infinite coefficients (README §1.7). -/
def degree (D : ArakelovDivisor K) : ℝ :=
  Real.log |((FractionalIdeal.absNorm (finitePart D) : ℚ) : ℝ)| +
    ∑ v : InfinitePlace K, infinitePart D v

/-- The principal divisor of `f∈Kˣ`; complex-place coefficients have multiplicity two. -/
def principal (f : Kˣ) : ArakelovDivisor K :=
  (Additive.ofMul (Units.mk0 (FractionalIdeal.spanSingleton (𝓞 K)⁰ (f : K))
      (FractionalIdeal.spanSingleton_ne_zero_iff.mpr f.ne_zero)),
    fun v => -((v.mult : ℕ) : ℝ) * Real.log (v (f : K)))

/-- Degree is an additive function on divisors (README §1.7). -/
theorem degree_add (D D' : ArakelovDivisor K) : degree (D + D') = degree D + degree D' :=
  sorry

/-- The product formula gives degree zero for every principal divisor (README §§1.4, 1.7). -/
theorem degree_principal (f : Kˣ) : degree (principal f) = 0 := sorry

/-- The zero divisor has degree zero (README §1.7). -/
theorem degree_zero : degree (0 : ArakelovDivisor K) = 0 := sorry

/-- The principal divisors generate the subgroup used for the compactified Picard quotient
(README §1.7). -/
def principalSubgroup : AddSubgroup (ArakelovDivisor K) :=
  AddSubgroup.closure (Set.range (principal (K := K)))

/-- Degree is constant on divisor classes modulo principal divisors (README §1.7). -/
theorem degree_eq_of_sub_mem (D D' : ArakelovDivisor K)
    (h : D - D' ∈ principalSubgroup (K := K)) : degree D = degree D' := sorry

/-- Forgetting the complex-place multiplicity in an imaginary quadratic field leaves
`log 2` rather than zero (README §1.7). -/
theorem mult_nonexample (L : Type*) [Field L] [NumberField L] (hL : Module.finrank ℚ L = 2)
    (v : InfinitePlace L) (hv : v.IsComplex) (h1 : ∀ w : InfinitePlace L, w = v) :
    degree ((principal (Units.mk0 (2 : L) two_ne_zero)).1,
      fun w => -Real.log (w (2 : L))) = Real.log 2 := sorry

variable {ι : Type*} [Fintype ι]

/-- The divisor of the pulled-back sup-metrized `O(1)`: inverse coordinate ideal and logarithmic
maxima at infinity. The nonzero tuple condition gives an invertible ideal (README §1.14). -/
def ofTuple (x : ι → K) (hx : x ≠ 0) : ArakelovDivisor K :=
  (Additive.ofMul (Units.mk0 (FractionalIdeal.spanFinset (𝓞 K) Finset.univ x)⁻¹
      (by
        obtain ⟨i, hi⟩ := Function.ne_iff.mp hx
        exact inv_ne_zero (FractionalIdeal.spanFinset_ne_zero.mpr ⟨i, Finset.mem_univ i, hi⟩))),
    fun v => ((v.mult : ℕ) : ℝ) * Real.log (⨆ i, v (x i)))

/-- The sup-metrized degree equals Mathlib's relative logarithmic tuple height (README §1.14).
Dividing either side by `[K:ℚ]` gives the absolute logarithmic height, invariant under finite
extension of the containing number field. -/
theorem degree_ofTuple (x : ι → K) (hx : x ≠ 0) : degree (ofTuple x hx) = Height.logHeight x :=
  sorry

/-- Scaling changes the divisor by the negative of the principal divisor, retaining its degree. -/
theorem ofTuple_smul (x : ι → K) (hx : x ≠ 0) (c : Kˣ) :
    ofTuple ((c : K) • x) (smul_ne_zero c.ne_zero hx) = ofTuple x hx - principal c := sorry

/-- Coprime integral coordinates recover the classical projective height (README §1.14). -/
theorem ofTuple_coprime (a b : ℤ) (hab : Int.gcd a b = 1) (h : ![(a : ℚ), b] ≠ 0) :
    degree (ofTuple ![(a : ℚ), b] h) = Real.log (max |(a : ℝ)| |(b : ℝ)|) := sorry

end ArakelovDivisor

/-! ## Layer 2: The Hodge line and the Faltings metric -/

/-! The integral dual Hodge-line comparison of README §2.6 is over a locally Noetherian
normal base, with semi-abelian models dual and abelian on a dense open meeting every component.
Its codimension-one extension uses the trait degeneration and reflexive-sheaf supplier contracts.
-/

open UpperHalfPlane
open scoped MatrixGroups

/-- The standard period lattice has covolume `Im τ` (README §2.2), for the standard Lebesgue
measure on `ℂ`. Its identification with the Faltings norm of `dz` is stated in the README. -/
theorem covolume_periodLattice (τ : ℍ) :
    ZLattice.covolume (Submodule.span ℤ {(1 : ℂ), (τ : ℂ)}) = τ.im := sorry

/-- The positive invariant elliptic term, using `Δ=η²⁴` rather than `(2π)^12Δ` (README §2.9). -/
def EllipticCurve.faltingsArchimedeanTerm (τ : ℍ) : ℝ :=
  ‖ModularForm.discriminant τ‖ * τ.im ^ 6

/-- Nonvanishing of `Δ` and positivity of `Im τ` make the logarithmic term well defined. -/
theorem EllipticCurve.faltingsArchimedeanTerm_pos (τ : ℍ) :
    0 < EllipticCurve.faltingsArchimedeanTerm τ := sorry

/-- Weight twelve of `Δ` cancels the sixth power of `Im τ` under `SL₂(ℤ)`. -/
theorem EllipticCurve.faltingsArchimedeanTerm_smul (γ : SL(2, ℤ)) (τ : ℍ) :
    EllipticCurve.faltingsArchimedeanTerm (γ • τ) = EllipticCurve.faltingsArchimedeanTerm τ :=
  sorry

/-- Invariance under inversion of the period ratio. -/
example (τ : ℍ) :
    EllipticCurve.faltingsArchimedeanTerm (ModularGroup.S • τ) =
      EllipticCurve.faltingsArchimedeanTerm τ :=
  EllipticCurve.faltingsArchimedeanTerm_smul _ _

/-! ## Layer 3: Relative and stable Faltings heights

The metrized Néron Hodge line and its height are the README's arithmetic targets.
-/

/-! ## Layer 4: Isogenies, differents and component heights

The determinant different, isogeny formula and squared dual-line theorem use the README's
Néron-model interface and the local abelian-variety pairing and dual isogeny sequences supplied
by ArithmeticGaloisDuality §D7.6. `Isogeny.localKummer_exact` is their corollary for every isogeny
over a finite extension of `ℚ_p`, including degree divisible by `p`, and every finite unramified
extension. `Isogeny.localCokernel_asymptotic` is the uniform `Lie`-filtration estimate of README §4.3.
-/

/-! ## Layer 5: Logarithmic metrics, moduli and theta heights -/

open Filter Topology

/-- A positive frame norm has logarithmic growth on a punctured neighbourhood of zero.
The condition is local and requires no compact ambient space. The boundary extension and frame
are fixed; the value at zero itself is irrelevant (README §5.1).
Strict positivity rules out zero and negative functions even with Lean's total inverse. -/
def HermitianMetric.LogSingularAtZero (f : ℂ → ℝ) : Prop :=
  ∃ C : ℝ, 0 < C ∧ ∃ n : ℕ, ∀ᶠ q in 𝓝[≠] (0 : ℂ),
    0 < f q ∧ max (f q) (f q)⁻¹ ≤ C * (1 + |Real.log ‖q‖|) ^ n

/-- The local logarithmic condition is preserved under tensor powers, including the unit power. -/
theorem HermitianMetric.LogSingularAtZero.pow {f : ℂ → ℝ}
    (hf : HermitianMetric.LogSingularAtZero f) (k : ℕ) :
    HermitianMetric.LogSingularAtZero (fun q => f q ^ k) := sorry

/-- Inverting a frame norm preserves logarithmic growth on the fixed dual extension
(README §5.1). -/
theorem HermitianMetric.LogSingularAtZero.inv {f : ℂ → ℝ}
    (hf : HermitianMetric.LogSingularAtZero f) :
    HermitianMetric.LogSingularAtZero (fun q => (f q)⁻¹) := sorry

/-- Logarithmic growth of a fixed frame norm is equivalent to growth after the finite ramified
map `u ↦ u^e` for `e > 0`. The frame upstairs belongs to the pullback of the same boundary extension
(README §5.1). -/
theorem HermitianMetric.LogSingularAtZero.comp_pow_iff {f : ℂ → ℝ} {e : ℕ}
    (he : 0 < e) :
    HermitianMetric.LogSingularAtZero (fun u => f (u ^ e)) ↔
      HermitianMetric.LogSingularAtZero f := sorry

/-- The constant unit frame norm satisfies the local condition on the affine line
(README §§5.1, 5.3). -/
example : HermitianMetric.LogSingularAtZero (fun _ => 1) := by
  refine ⟨1, by norm_num, 0, Filter.Eventually.of_forall ?_⟩
  intro q
  norm_num

/-- The cusp Hodge squared norm has logarithmic growth for the fixed trivial extension
(README §5.1). -/
theorem HermitianMetric.logSing_cusp : HermitianMetric.LogSingularAtZero
    (fun q => -(1 / (2 * Real.pi)) * Real.log ‖q‖) := sorry

/-- A power pole violates logarithmic growth for the fixed trivial extension (README §5.1). -/
theorem HermitianMetric.logSing_polynomial_nonexample :
    ¬ HermitianMetric.LogSingularAtZero (fun q => ‖q‖ ^ (-(1 / 2 : ℝ))) := sorry

/-- Eventual strict positivity excludes the zero function even with a total inverse
(README §5.1). -/
example : ¬ HermitianMetric.LogSingularAtZero (fun _ => 0) := by
  rintro ⟨C, hC, n, h⟩
  obtain ⟨q, hq⟩ := h.exists
  exact (lt_irrefl (0 : ℝ)) hq.1

/-! ## Layer 6: Finiteness and uniform height bounds

The product supplied with Zarhin's principal polarization has its arithmetic height identity,
field-degree bounds, moduli finiteness and the lower bound specified in the README.
-/

/-! The README also specifies `HermitianBundle` (module, inner, conjugation, rank, trivial,
`ofFractionalIdeal`, isometry and `normAt`), `sum/tensor/dual/det/restrict/quotient/baseChange/rescale`,
`arakelovDegree/normalizedDegree/slope`; the divisor–Picard equivalence, `principalSubgroup` and `PicHat`;
`ArithmeticDivisor`, principal and `ofGreen`, `ArithmeticChow1`, its restriction, pairing and
`pointHeight`; `StackDegree.arakelovDegree`; `Height.ofMetrized`; and `PicHat.rat` and norm.

The imported Hodge line is metrized by
`AbelianVariety.faltingsInner`, `AbelianVariety.metrizedHodgeLine`,
`GroupScheme.metrizedHodgeLine`, `AbelianFamily.faltingsMetric`, and the Deligne/unscaled adapters.
The other arithmetic definitions are `AbelianVariety.faltingsHeight`,
`GroupScheme.faltingsHeight`, `AbelianVariety.stableFaltingsHeight`, `Isogeny.different`,
`AbelianVariety.componentQuotient`, `componentLine` and `componentHeight`,
`HermitianMetric.HasLogSingularities`, `SiegelModuli.modularLineBundle` and `modularMetric`,
`AbelianVariety.thetaNullPoint` and `thetaHeight`, and `Z(A)`. Their full hypotheses, API and checks,
and the associated end theorems, are in the numbered README sections.

The divisor quotient targets of §1.7 are `ArakelovDivisor.degree_eq_of_sub_mem`,
`ArakelovDivisor.picHat_exact` and `ArakelovDivisor.picHat_rat`; its sign and multiplicity
checks are `ArakelovDivisor.degree_principal_two`, `ArakelovDivisor.degree_zero`,
`ArakelovDivisor.mult_nonexample` and `ArakelovDivisor.principal_trivialization`.
Section 1.14 also specifies `ArakelovDivisor.ofTuple_FS`, `ArakelovDivisor.ofTuple_coprime`,
`ArakelovDivisor.ofTuple_scaling` and `ArakelovDivisor.ofTuple_zero_nonexample`.

The elliptic model comparison in §2.9 is `EllipticCurve.faltingsHeight_formula`, with
`EllipticCurve.faltingsHeight_11a2`, `EllipticCurve.faltingsHeight_basechange`,
`EllipticCurve.faltingsHeight_lattice_disc_nonexample` and
`EllipticCurve.faltingsArchimedeanTerm_S` as its normalization checks.
The boundary-extension API in §5.1 is `HermitianMetric.hasLogSingularities_iff_distance`,
`HermitianMetric.hasLogSingularities_of_continuous`,
`HermitianMetric.hasLogSingularities_of_modification`,
`HermitianMetric.hasLogSingularities_iff_pullback_of_finite_surjective`,
`HermitianMetric.hasLogSingularities_pullback` and `HermitianMetric.hasLogSingularities_tensor`.
Its checks are `HermitianMetric.logSing_cusp`, `HermitianMetric.logSing_empty_boundary`,
`HermitianMetric.logSing_extension_nonexample`, `HermitianMetric.logSing_negative_nonexample`,
`HermitianMetric.logSing_polynomial_nonexample`, `HermitianMetric.logSing_power` and
`HermitianMetric.logSing_zero_nonexample`.
The finite-surjective equivalence is for normal complex analytic varieties `q : Ȳ → X̄`,
a closed analytic boundary `Z` with dense complement `U` and dense `q⁻¹(U)`, and a continuous
metric on `L|_U` for a fixed line `L` on `X̄`. The upstairs extension is `q^*L` and its boundary is
the reduced inverse image of `Z`, including at ramification. Section 5.4 uses
`SiegelModuli.minimalLevelMap`, finite surjective with inverse-image open `A_{g,n}`, and
`SiegelModuli.minimalLevel_hodgePower` on the whole minimal compactification.
`SiegelModuli.modularMetric_logSing` provides growth relative to `L` on the coarse minimal
space: §5.3 gives growth on `π_n^*q_n^*L`, modification descent gives growth on `q_n^*L`,
and finite-surjective descent gives growth on `L`, with the metric identified by the
universal-family isometries. For `g = 1` and `j ≠ 0, 1728, [−1]` remains nonidentity inertia
after the twelfth Hodge power descends.

The arithmetic cycle quotient (§1.10), projective Weil-height class (§1.13), semi-abelian
family and extension theorem (§2.0), strict differential-lattice comparison (§3.6),
Cartier-dual length identity (§4.3) and integral Siegel compactifications (§§5.0a–5.0b)
are specified in the README, with their intended carriers, hypotheses, API and checks.
-/

end

end TauCetiRoadmap.ArakelovGeometryAndAbelianHeights
