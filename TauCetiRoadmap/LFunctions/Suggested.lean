import Mathlib
import TauCeti.Analysis.Meromorphic.Continuation
import TauCeti.Analysis.SpecialFunctions.Exp.StretchedDecay
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Weight
import TauCeti.NumberTheory.ArithmeticDirichletSeries.NormCoeff
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Cancellation
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.Boundary
import TauCeti.NumberTheory.LSeries.FEPairWithLevel
import TauCeti.NumberTheory.NumberField.CanonicalEmbedding.PoissonSummation
import TauCeti.NumberTheory.LFunctions.Data.Basic
import TauCeti.NumberTheory.LFunctions.Data.Series
import TauCeti.NumberTheory.LFunctions.Data.Comparison
import TauCeti.NumberTheory.LFunctions.Theta.UnitFundamentalDomain
import TauCeti.NumberTheory.LFunctions.Theta.SurfaceCoordinates
import TauCeti.NumberTheory.LFunctions.DedekindZeta.PartialZeta
import TauCeti.NumberTheory.LFunctions.Hecke.Basic
import TauCeti.NumberTheory.LFunctions.Hecke.Primitive
import TauCeti.NumberTheory.LFunctions.PrimeIdealBoundary
import TauCeti.NumberTheory.NumberField.Global.RayClass.Modulus
import TauCeti.NumberTheory.NumberField.Global.RayClass.Basic
import TauCeti.NumberTheory.NumberField.Global.RayClass.Character.Basic
import TauCeti.NumberTheory.NumberField.Global.RayClass.Character.Weight
import TauCeti.NumberTheory.NumberField.Global.InfinityType.Basic
import TauCeti.NumberTheory.NumberField.Global.InfinityType.IdentityComponent
import TauCeti.NumberTheory.NumberField.Global.Ideles.Congruence
import TauCeti.NumberTheory.NumberField.Global.Ideles.Norm.Basic
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Basic
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Shift
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.InfinityType
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.FiniteOrder
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.FiniteComponent
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Ideal

/-!
# L-functions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib and Tau
Ceti: the continuation, functional equation, residues and value at zero of the Dedekind zeta
function and of the partial zeta functions, Hecke's theta transformation and the volume of a unit
fundamental domain that produce them, the quadratic and cyclotomic factorizations, the
continuation and functional equation of finite-order Hecke L-functions and of the L-functions of
algebraic Hecke characters with their Mellin presentations through Hecke's theta kernel, the
nonvanishing of these L-functions on the line `Re s = 1` with the boundary datum exported to
prime-distribution consumers, and Mertens' product over a number field. Every headline theorem
is statable at the pins, and every one is stated.

The carriers this roadmap builds on are imported, not restated: the completed L-function record
`TauCeti.LFunctions.AnalyticLFunctionData` with its predicates, dual, comparison and normalization
translation; the canonical continuation `TauCeti.meromorphicContinuation`; Mellin's principle with
a level `TauCeti.FEPairWithLevel`; the Euclidean pairing, Fourier transform, dual lattice and
Poisson summation of the mixed space (`TauCeti.NumberField.mixedEmbedding`); the unit action, the
norm-one hypersurface and unit fundamental domains; the ray class indicators and partial zeta
series; the presented Hecke L-function `TauCeti.LFunctions.heckeLFunctionC` and
`TauCeti.LFunctions.PrimitiveRayClassCharacter`. Generic ideal weights, Euler products and the
prime boundary datum are Tau Ceti's `ArithmeticDirichletSeries` modules; moduli, ray classes,
ray class characters, ideles, infinity types and Hecke characters are Tau Ceti's
`GlobalNumberFields` modules. A datum fixed by an existence-and-uniqueness theorem (a
presentation of a given Hecke character, a residue character) is taken as an argument together
with its characterizing property, not chosen.
-/

namespace TauCetiRoadmap.LFunctions

open Complex Filter NumberField NumberField.InfinitePlace Topology Asymptotics
open TauCeti (meromorphicContinuation)
open TauCeti.LFunctions
open TauCeti.NumberField.mixedEmbedding (mixedInner mixedFourier mixedDual)
open IsDedekindDomain (HeightOneSpectrum)
open scoped nonZeroDivisors SchwartzMap FourierTransform RealInnerProductSpace Pointwise

noncomputable section

universe u

namespace ADS
export TauCeti
  (IdealArithmeticFunction UnitaryIdealWeight normCoeff
    HasCancellation continuedLFunctionOfWeight PrimeBoundaryRemainder)
end ADS

namespace GNF
export TauCeti.GlobalNumberFields
  (Modulus RayClassGroup RayClassCharacter AlgebraicInfinityType
    HeckeCharacter ideleCongruenceSubgroup IsCongrOne
    idealClass integralIdealsPrimeTo idealsPrimeTo
    primeToSubgroup ideleNorm narrowModulus)
namespace Modulus
export TauCeti.GlobalNumberFields.Modulus (one)
end Modulus
namespace AlgebraicInfinityType
export TauCeti.GlobalNumberFields.AlgebraicInfinityType (toContinuous)
end AlgebraicInfinityType
namespace HeckeCharacter
export TauCeti.GlobalNumberFields.HeckeCharacter
  (ofRayClassCharacter isFiniteOrder_iff_exists_rayClassCharacter shift_ofRayClassCharacter)
end HeckeCharacter
end GNF

/-! ## Layer 1: the mixed-space specialization of Poisson summation, and theta

The Euclidean pairing `mixedInner`, the Fourier transform `mixedFourier`, the dual lattice
`mixedDual` and Poisson summation over a lattice of the mixed space are Tau Ceti's
(`TauCeti.NumberField.mixedEmbedding`), as are Mellin's principle with a level
(`TauCeti.FEPairWithLevel`) and the unit action, the norm-one hypersurface and the unit
fundamental domains (`TauCeti.LFunctions.unitScale`, `normOneSurface`, `IsUnitFundamentalDomain`).
This section states what Hecke's method adds: the Gaussians, the theta series of a lattice with
one parameter per infinite place and its transformation law, and the Haar measures of the
parameter space with the volume of a unit fundamental domain. -/

/-- The Gaussian `exp (-π t Q x)` of the Euclidean pairing. Hecke's method uses only this ray
`τ = i t` of the Gaussian, and the holomorphic upper-half-plane theta built from the rest of it
belongs to the Theta Series roadmap. -/
noncomputable def mixedGaussian (K : Type u) [Field K] [NumberField K] (t : ℝ)
    (x : mixedEmbedding.mixedSpace K) : ℂ :=
  Complex.exp ((-Real.pi * t * mixedInner K x x : ℝ) : ℂ)

/-! ### The archimedean parameter, the unit action, and the norm-one hypersurface

A Gaussian with **one** parameter, Mellin-transformed in that parameter, produces the Epstein zeta
function of the lattice `σ(𝔞)` — a sum over lattice *points* — and not the partial zeta function,
which is a sum over *ideals*, that is over lattice points modulo the unit group. The two agree
only when the unit group is finite (`radialMellin_eq_epsteinZeta` and
`not_summable_absNorm_of_rank_pos` in Layer 3). Hecke's construction (Neukirch VII §5) closes the
gap with a Gaussian carrying one positive parameter per infinite place: the unit group acts on the
parameters, a fundamental domain for that action on the norm-one hypersurface cuts the sum over
lattice points down to a sum over ideals, and the Mellin variable is the norm of the parameter.
Every object of that construction is named here — nothing is left to an existential. ⚠ Two
normalizations are fixed once and audited in the worked cases of Layer 3: the Gaussian uses the
Euclidean pairing `mixedInner`, in which a complex coordinate counts once, and the multiplicative
measure is the product `∏_w dy_w / y_w` over places.
Neukirch's canonical measure carries `e_𝔭 = 2` at a complex place and is `2^r₂` times it, so his
`vol(F) = 2^(r-1) R` reads `2^(r-1) R / 2^r₂` here; the compensating `2^r₂` sits in
`mellinKernel`, and the constant term of the kernel is his `2^(r-1) R / w` in both. -/

section ArchimedeanParameter

open scoped Classical

/-- The multi-parameter Gaussian `exp (-π ∑_w y_w |x_w|²)`: the Euclidean pairing `mixedInner`
weighted place by place, a complex coordinate counted once. At a constant parameter it is
`mixedGaussian`. -/
noncomputable def archGaussian (K : Type u) [Field K] [NumberField K]
    (y : mixedEmbedding.realSpace K)
    (x : mixedEmbedding.mixedSpace K) : ℂ :=
  Complex.exp ((-Real.pi *
    ∑ w : InfinitePlace K, y w * mixedEmbedding.normAtPlace w x ^ 2 : ℝ) : ℂ)

/-- The Gaussian at `u • x` is the Gaussian at `x` with the parameter moved by `unitScale u`,
`y_w ↦ |u|_w² y_w`: the square because the Gaussian is quadratic in `x`. -/
theorem archGaussian_unit_smul (K : Type u) [Field K] [NumberField K] (u : (𝓞 K)ˣ)
    (y : mixedEmbedding.realSpace K) (x : mixedEmbedding.mixedSpace K) :
    archGaussian K y (u • x) = archGaussian K (unitScale u y) x := sorry

/-- **The Fourier transform of the multi-parameter Gaussian**, `𝓕 G_y = N(y)^(-1/2) G_{y⁻¹}`: the
self-duality of `exp (-π ‖x‖²)` (Mathlib's `fourier_gaussian_innerProductSpace`) after the
coordinatewise change of variable `x ↦ √y • x`, whose Jacobian is `N(y)^(1/2)` because a complex
coordinate is two real ones. -/
theorem mixedFourier_archGaussian (K : Type u) [Field K] [NumberField K]
    (y : mixedEmbedding.realSpace K)
    (hy : ∀ w, 0 < y w) (ξ : mixedEmbedding.mixedSpace K) :
    mixedFourier K (archGaussian K y) ξ =
      (((Real.sqrt (archNorm y))⁻¹ : ℝ) : ℂ) * archGaussian K (fun w ↦ (y w)⁻¹) ξ := sorry

/-- The theta series of a lattice of the mixed space at the parameter `y`. -/
noncomputable def latticeTheta (K : Type u) [Field K] [NumberField K]
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) (y : mixedEmbedding.realSpace K) : ℂ :=
  ∑' ξ : L, archGaussian K y (ξ : mixedEmbedding.mixedSpace K)

/-- Absolute convergence of the theta series. `archGaussian K y` is a Gaussian composed with a
linear automorphism, so it decays faster than every power of the lattice points; it is what
licenses every exchange
of the sum with an integral below. -/
theorem summable_archGaussian (K : Type u) [Field K] [NumberField K]
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L]
    (y : mixedEmbedding.realSpace K) (hy : ∀ w, 0 < y w) :
    Summable fun ξ : L ↦ archGaussian K y (ξ : mixedEmbedding.mixedSpace K) := sorry

/-- **Unit invariance.** The ideal lattice is stable under `x ↦ u • x`, so its theta series is
invariant under the unit action on the parameters: reindex by `u`, then `archGaussian_unit_smul`.
⚠ This is the only place the unit group enters the theta series, and it is what a one-parameter
theta series cannot see: `unitScale u` moves a constant parameter off the diagonal. -/
theorem latticeTheta_unitScale (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (u : (𝓞 K)ˣ) (y : mixedEmbedding.realSpace K) :
    latticeTheta K (mixedEmbedding.idealLattice K I) (unitScale u y) =
      latticeTheta K (mixedEmbedding.idealLattice K I) y := sorry

/-- **The multi-parameter theta transformation**, Neukirch VII (3.6) on the imaginary axis:
Tau Ceti's Poisson summation over a lattice of the mixed space,
`tsum_eq_tsum_mixedDual_mixedFourier`, applied to
`archGaussian K y` with `mixedFourier_archGaussian`, for every lattice `L`:
`θ_L(y) = covol(L)⁻¹ N(y)^(-1/2) θ_{L^∨}(y⁻¹)`, the dual being the Euclidean dual `mixedDual`. -/
theorem latticeTheta_inv (K : Type u) [Field K] [NumberField K]
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L]
    (y : mixedEmbedding.realSpace K) (hy : ∀ w, 0 < y w) :
    latticeTheta K L y =
      ((ZLattice.covolume L : ℝ) : ℂ)⁻¹ * (((Real.sqrt (archNorm y))⁻¹ : ℝ) : ℂ) *
        latticeTheta K (mixedDual K L) (fun w ↦ (y w)⁻¹) := sorry

/-- The multiplicative Haar measure `dy/y = ∏_w dy_w / y_w` on the positive parameters. ⚠ This is
the product over *places*; Neukirch's canonical `dy/y` (VII §4, p. 454, and the proof of (5.6))
carries the factor `e_𝔭 = 2` at each complex place and is `2^r₂` times this one. -/
noncomputable def archHaar (K : Type u) [Field K] [NumberField K] :
    MeasureTheory.Measure (mixedEmbedding.realSpace K) :=
  (MeasureTheory.volume.restrict {y : mixedEmbedding.realSpace K | ∀ w, 0 < y w}).withDensity
    fun y ↦ ENNReal.ofReal (∏ w : InfinitePlace K, (y w)⁻¹)

/-- The Haar measure `dt/t` of `ℝ_+^*`. -/
noncomputable def multHaar : MeasureTheory.Measure ℝ :=
  (MeasureTheory.volume.restrict (Set.Ioi (0 : ℝ))).withDensity fun t ↦ ENNReal.ofReal t⁻¹

/-- Neukirch's `d*x`: the Haar measure of the group `S` for which `dy/y` is the product measure
`d*x × dt/t` along `(x, t) ↦ x t^(1/n)` (`archHaar_eq_map`). Since `∫_1^e dt/t = 1`, the mass of
a set `A ⊆ S` is the `dy/y`-mass of the parameters with surface part in `A` and norm in `[1, e]`:
the image of `archHaar` on that shell under `surfacePart`, read on `S`. -/
noncomputable def surfaceHaar (K : Type u) [Field K] [NumberField K] :
    MeasureTheory.Measure (normOneSurface K) :=
  MeasureTheory.Measure.comap Subtype.val
    (MeasureTheory.Measure.map surfacePart
      ((archHaar K).restrict {y | 1 ≤ archNorm y ∧ archNorm y ≤ Real.exp 1}))

/-- `dy/y` is the image of `d*x × dt/t` under `(x, t) ↦ x t^(1/n)`: the decomposition of the
positive parameters as the norm-one hypersurface times `ℝ_+^*` (Neukirch VII §5). -/
theorem archHaar_eq_map (K : Type u) [Field K] [NumberField K] :
    archHaar K = MeasureTheory.Measure.map
      (fun p : normOneSurface K × ℝ ↦ surfaceScale (p.1 : mixedEmbedding.realSpace K) p.2)
      ((surfaceHaar K).prod multHaar) := sorry

/-- **Neukirch VII (5.6), the volume of the fundamental domain**: `vol(F) = 2^(r-1) R` for his
measure, with `r = r₁ + r₂` the number of infinite places and `R` Mathlib's
`NumberField.Units.regulator`; for the product measure `archHaar` this is `2^(r-1) R / 2^r₂`.
Every fundamental domain has the same volume. ⚠ The `2^(r-1)` is the index of `2 log|𝔬ˣ|` in
`log|𝔬ˣ|` up to the `1/n` of the scaling direction, cancelled by the `n` of the last row of
Neukirch's determinant: it is where the action by `|ε|²` rather than `|ε|` enters. Over `ℚ` and
`ℚ(i)` the surface is a point of mass `1` and `1/2` respectively. -/
theorem surfaceHaar_of_isUnitFundamentalDomain (K : Type u) [Field K] [NumberField K]
    {D : Set (mixedEmbedding.realSpace K)} (hD : IsUnitFundamentalDomain K D) :
    surfaceHaar K (Subtype.val ⁻¹' D) =
      ENNReal.ofReal (2 ^ (nrRealPlaces K + nrComplexPlaces K - 1) *
        NumberField.Units.regulator K / 2 ^ nrComplexPlaces K) := sorry

end ArchimedeanParameter

/-! ## Layer 2: partial zeta functions -/

variable (K : Type u) [Field K] [NumberField K]

/-- The partial zeta function of the ray class `c`: the continuation of its Dirichlet series from
`Re s > 1` (`partialZeta_eq_lSeries`). -/
noncomputable def partialZeta
    (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) : ℂ → ℂ :=
  meromorphicContinuation 1 (LSeries (ADS.normCoeff K (rayClassCoeff 𝔪 c)))

/-- On `Re s > 1` the partial zeta function is its Dirichlet series: the series continues to a
meromorphic function on `ℂ`. -/
theorem partialZeta_eq_lSeries
    (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) {s : ℂ} (hs : 1 < s.re) :
    partialZeta K 𝔪 c s =
      LSeries (ADS.normCoeff K (rayClassCoeff 𝔪 c)) s := sorry

/-- **The sum over ray classes is not `ζ_K`.** Summing the class indicators gives the indicator of
the ideals prime to the finite part of the modulus, so the sum is `ζ_K` with the Euler factors at
those primes deleted. Equality with `ζ_K` holds exactly in the trivial-finite-part case, recorded
separately as `sum_partialZeta_one`. -/
theorem sum_partialZeta (𝔪 : GNF.Modulus K) [Fintype (GNF.RayClassGroup 𝔪)]
    {s : ℂ} (hs : 1 < s.re) :
    ∑ c : GNF.RayClassGroup 𝔪, partialZeta K 𝔪 c s =
      dedekindZeta K s * finiteEulerCorrection 𝔪 s := sorry

/-- The class-group specialization, a corollary of `sum_partialZeta`: for the trivial modulus the
correction is empty and the partial zeta functions of the ideal classes do sum to `ζ_K`. -/
theorem sum_partialZeta_one [Fintype (GNF.RayClassGroup (GNF.Modulus.one K))]
    {s : ℂ} (hs : 1 < s.re) :
    ∑ c : GNF.RayClassGroup (GNF.Modulus.one K), partialZeta K (GNF.Modulus.one K) c s =
      dedekindZeta K s := by
  simpa [finiteEulerCorrection_one] using sum_partialZeta K (GNF.Modulus.one K) hs

/-- **The common residue.** Every ray class contributes the same simple pole at `s = 1`, with
residue the Dedekind-zeta residue times the deleted finite Euler factors, divided by the ray class
number. ⚠ `κ_K / #Cl_𝔪` is wrong for a modulus with nontrivial finite part; the correction is the
same one that `sum_partialZeta` carries. This constant is the supplier's
`GlobalNumberFields.rayClassIdealMainTerm`, whose closed form is
`GlobalNumberFields.rayClassIdealMainTerm_eq`; it is not a second constant. -/
theorem tendsto_sub_one_mul_partialZeta (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) :
    Tendsto (fun s : ℂ ↦ (s - 1) * partialZeta K 𝔪 c s) (𝓝[≠] 1)
      (𝓝 ((dedekindZeta_residue K : ℂ) * finiteEulerCorrection 𝔪 1 /
        (Nat.card (GNF.RayClassGroup 𝔪) : ℂ))) := sorry

/-! ## Layer 3: Dedekind zeta -/

/-- The continued Dedekind zeta function: the continuation of Mathlib's `dedekindZeta` from
`Re s > 1`. -/
noncomputable def dedekindZetaC
    (K : Type u) [Field K] [NumberField K] : ℂ → ℂ :=
  meromorphicContinuation 1 (dedekindZeta K)

/-- On `Re s > 1` the continued Dedekind zeta function is Mathlib's `dedekindZeta`: the content of
the continuation. -/
theorem dedekindZetaC_eq {s : ℂ} (hs : 1 < s.re) :
    dedekindZetaC K s = dedekindZeta K s := sorry

/-- Meromorphy of `dedekindZetaC` holds for every canonical continuation, which is in
meromorphic normal form (Tau Ceti's `meromorphicNFOn_meromorphicContinuation`); the content of the
continuation is `dedekindZetaC_eq`. -/
theorem meromorphic_dedekindZetaC : Meromorphic (dedekindZetaC K) :=
  fun x ↦ (TauCeti.meromorphicNFOn_meromorphicContinuation _ _ (Set.mem_univ x)).meromorphicAt

/-- The continued Dedekind zeta function is analytic at every point other than `1`. -/
theorem analyticAt_dedekindZetaC {s : ℂ} (hs : s ≠ 1) :
    AnalyticAt ℂ (dedekindZetaC K) s := sorry

/-- The continued Dedekind zeta function has a simple pole at `1`. -/
theorem meromorphicOrderAt_dedekindZetaC_one :
    meromorphicOrderAt (dedekindZetaC K) 1 = (-1 : WithTop ℤ) := sorry

/-- **The analytic class number formula** for the named continuation: `(s - 1) ζ_K(s)` tends to
Mathlib's `dedekindZeta_residue K = 2^r₁ (2π)^r₂ h R / (w √|d_K|)` as `s → 1`. -/
theorem tendsto_sub_one_mul_dedekindZetaC :
    Tendsto (fun s : ℂ ↦ (s - 1) * dedekindZetaC K s) (𝓝[≠] 1)
      (𝓝 (dedekindZeta_residue K : ℂ)) := sorry

/-- **The value at zero** (Neukirch VII (5.11)): `ζ_K` has a zero at `s = 0` of order the unit rank
`r = r₁ + r₂ - 1`, with leading coefficient `-h R / w`, `h` the class number, `R` the regulator
and `w` the number of roots of unity, all three Mathlib's. Over `ℚ` it is `ζ(0) = -1/2`; over
`ℚ(i)` it is `-1/4`; over a real quadratic field the zero is simple. -/
theorem dedekindZetaC_leading_zero :
    meromorphicOrderAt (dedekindZetaC K) 0 = ((NumberField.Units.rank K : ℤ) : WithTop ℤ) ∧
      Tendsto (fun s : ℂ ↦ dedekindZetaC K s / s ^ NumberField.Units.rank K) (𝓝[≠] 0)
        (𝓝 (-((NumberField.classNumber K : ℝ) * NumberField.Units.regulator K /
          (NumberField.Units.torsionOrder K : ℝ)) : ℂ)) := sorry

/-- The completed Dedekind zeta function `|d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ ζ_K(s)`, continued from
`Re s > 1`. -/
noncomputable def completedDedekindZeta
    (K : Type u) [Field K] [NumberField K] : ℂ → ℂ :=
  meromorphicContinuation 1 fun s ↦
    ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
      Gammaℂ s ^ nrComplexPlaces K * dedekindZeta K s

/-- On `Re s > 1` the completed Dedekind zeta function is `|d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ ζ_K(s)`:
the content of the continuation. -/
theorem completedDedekindZeta_eq {s : ℂ} (hs : 1 < s.re) :
    completedDedekindZeta K s =
      ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
        Gammaℂ s ^ nrComplexPlaces K * dedekindZeta K s := sorry

/-- Meromorphy of `completedDedekindZeta` holds for every canonical continuation; the content of
the continuation is `completedDedekindZeta_eq`. -/
theorem meromorphic_completedDedekindZeta : Meromorphic (completedDedekindZeta K) :=
  fun x ↦ (TauCeti.meromorphicNFOn_meromorphicContinuation _ _ (Set.mem_univ x)).meromorphicAt

/-- The completed Dedekind zeta function has a simple pole at `0`. -/
theorem meromorphicOrderAt_completedDedekindZeta_zero :
    meromorphicOrderAt (completedDedekindZeta K) 0 = (-1 : WithTop ℤ) := sorry

/-- The completed Dedekind zeta function has a simple pole at `1`. -/
theorem meromorphicOrderAt_completedDedekindZeta_one :
    meromorphicOrderAt (completedDedekindZeta K) 1 = (-1 : WithTop ℤ) := sorry

/-- The completed Dedekind zeta function is analytic at every point other than `0` and `1`. -/
theorem analyticAt_completedDedekindZeta {s : ℂ} (h0 : s ≠ 0) (h1 : s ≠ 1) :
    AnalyticAt ℂ (completedDedekindZeta K) s := sorry

/-- The residue of the completed Dedekind zeta function at `1`:
`|d_K|^(1/2) Γ_ℝ(1)^r₁ Γ_ℂ(1)^r₂ κ_K`, which is `2^(r₁+r₂) h R / w` by the class number formula. -/
theorem tendsto_sub_one_mul_completedDedekindZeta :
    Tendsto (fun s : ℂ ↦ (s - 1) * completedDedekindZeta K s) (𝓝[≠] 1)
      (𝓝 (((|discr K| : ℤ) : ℂ) ^ ((1 : ℂ) / 2) *
        Gammaℝ 1 ^ nrRealPlaces K * Gammaℂ 1 ^ nrComplexPlaces K *
        (dedekindZeta_residue K : ℂ))) := sorry

/-- The residue of the completed Dedekind zeta function at `0` is the negative of its residue at
`1`. -/
theorem tendsto_mul_completedDedekindZeta_zero :
    Tendsto (fun s : ℂ ↦ s * completedDedekindZeta K s) (𝓝[≠] 0)
      (𝓝 (-(((|discr K| : ℤ) : ℂ) ^ ((1 : ℂ) / 2) *
        Gammaℝ 1 ^ nrRealPlaces K * Gammaℂ 1 ^ nrComplexPlaces K *
        (dedekindZeta_residue K : ℂ)))) := sorry

/-- **The functional equation of the Dedekind zeta function**, `Λ_K(1 - s) = Λ_K(s)`, off the poles
`0` and `1`. -/
theorem completedDedekindZeta_one_sub {s : ℂ} (h0 : s ≠ 0) (h1 : s ≠ 1) :
    completedDedekindZeta K (1 - s) = completedDedekindZeta K s := sorry

/-- The analytic card of `ζ_K`: coefficients the number of integral ideals of each norm (the
coefficients of Mathlib's `dedekindZeta`), conductor `|d_K|`, `r₁` real and `r₂` complex gamma
factors with shift `0`, root number `1`, completed function `completedDedekindZeta`, and simple
poles at `0` and `1`. -/
noncomputable def dedekindZetaData
    (K : Type u) [Field K] [NumberField K] : AnalyticLFunctionData where
  coeff n := Nat.card {I : Ideal (𝓞 K) // Ideal.absNorm I = n}
  conductor := ⟨(discr K).natAbs, Int.natAbs_pos.mpr (discr_ne_zero K)⟩
  gammaR := Multiset.replicate (nrRealPlaces K) 0
  gammaC := Multiset.replicate (nrComplexPlaces K) 0
  rootNumber := 1
  completed := completedDedekindZeta K
  polarOrder := Finsupp.single 0 1 + Finsupp.single 1 1

/-- The Dedekind card has meromorphic continuation with exact poles: its completed function is
meromorphic, has simple poles at `0` and `1`, and is analytic elsewhere. -/
theorem dedekindZetaData_hasContinuation :
    (dedekindZetaData K).HasMeromorphicContinuation := sorry

/-- The Dedekind card satisfies the functional equation of the record, with root number `1`. -/
theorem dedekindZetaData_hasFunctionalEquation :
    (dedekindZetaData K).HasFunctionalEquation := sorry

/-! ### The unit quotient and the Mellin kernel

Neukirch VII (5.3)–(5.9) in this roadmap's normalization: the completed partial zeta function of a
fractional ideal is the Mellin transform of the theta series of its lattice averaged over a
fundamental domain for the units. The Epstein regression comes first, because it is the reason
the construction is needed at all. -/

section UnitQuotient

open scoped Classical

/-- The Epstein zeta function of the Euclidean form `mixedInner` on the lattice `σ(𝔞)`: a sum
over lattice **points**. -/
noncomputable def epsteinZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (s : ℂ) : ℂ :=
  ∑' x : {x : mixedEmbedding.idealLattice K I // x ≠ 0},
    ((mixedInner K (x : mixedEmbedding.mixedSpace K) (x : mixedEmbedding.mixedSpace K) : ℝ) : ℂ) ^
      (-s)

/-- ⚠ **The radial Mellin transform of the one-parameter theta series is the Epstein zeta
function, not a partial zeta function.** The theta series minus its constant term `1`, the term of
the lattice point `0`, is transformed; term by term, `∫ e^{-π t Q(x)} t^s dt/t = π^{-s} Γ(s)
Q(x)^{-s}`, so the transform in the single parameter `t` sums `Q(x)^{-s}` over the nonzero lattice
points. That is a sum over points; it is the ideal sum only when the unit group is finite. ⚠ The
constant is subtracted from the sum, not from each term: `∑' x, (e^{-π t Q(x)} - 1)` is not
summable, so its `tsum` is Lean's junk value `0`. Over `ℚ` at `s = 1` the right side is
`π⁻¹ ∑_{n ≠ 0} n⁻² = π/3`. -/
theorem radialMellin_eq_epsteinZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ}
    (hs : (Module.finrank ℚ K : ℝ) / 2 < s.re) :
    mellin (fun t ↦ (∑' x : mixedEmbedding.idealLattice K I,
        mixedGaussian K t (x : mixedEmbedding.mixedSpace K)) - 1) s =
      (Real.pi : ℂ) ^ (-s) * Complex.Gamma s * epsteinZeta K I s := sorry

/-- ⚠ **Regression: in positive unit rank the lattice-point sum is not the ideal sum.** Every
nonzero ideal in the class is hit by infinitely many lattice points — one per unit modulo torsion
— so the series `∑_{a ∈ 𝔞, a ≠ 0} N((a))^(-s)` that a radial Mellin transform would have to
produce is not summable for any `s`, whereas `∑_{𝔟 ∈ 𝔎} N𝔟^(-s)` converges for `Re s > 1`. The
one-parameter theta series therefore does not supply the Dedekind zeta function of any field of
positive unit rank; `mellinKernel` below does. -/
theorem not_summable_absNorm_of_rank_pos (h : 0 < NumberField.Units.rank K)
    (𝔞 : Ideal (𝓞 K)) (h𝔞 : 𝔞 ≠ ⊥) (s : ℂ) :
    ¬ Summable fun a : {a : 𝔞 // a ≠ 0} ↦
      (Ideal.absNorm (Ideal.span {((a : 𝔞) : 𝓞 K)}) : ℂ) ^ (-s) := sorry

/-- A nonzero integral ideal as a unit of the fractional ideals. -/
noncomputable def idealUnit (𝔞 : Ideal (𝓞 K)) (h : 𝔞 ≠ ⊥) : (FractionalIdeal (𝓞 K)⁰ K)ˣ :=
  Units.mk0 (𝔞 : FractionalIdeal (𝓞 K)⁰ K) (FractionalIdeal.coeIdeal_ne_zero.mpr h)

/-- A system of integral representatives of the class group prime to a modulus: `rep c` is a
nonzero integral ideal prime to `𝔪` whose class is `c`. -/
def IsClassRepresentatives (𝔪 : GNF.Modulus K) (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K)) : Prop :=
  ∀ c, 𝔪.IsCoprimeTo (rep c) ∧ ∃ h : rep c ∈ (Ideal (𝓞 K))⁰, ClassGroup.mk0 ⟨rep c, h⟩ = c

/-- **The completed partial zeta function of a fractional ideal**, Neukirch VII (5.4) and (5.9):
`Z(𝔎, s) = |d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ ζ(𝔎, s)` for `𝔎` the class of `𝔞⁻¹`. By (5.3) the
integral ideals `𝔟` of that class are the `a 𝔞⁻¹` for `a ∈ 𝔞 ∖ 0` modulo units, so
`ζ(𝔎, s) = N(𝔞)^s ∑_{a ∈ 𝔞*/𝔬*} |N(a)|^(-s)`; Mathlib already has that bijection through its
fundamental cone (`fundamentalCone.idealSetEquiv`, `card_isPrincipal_norm_eq_mul_torsion`), which
is why that cone is also the fundamental domain of `unitFundamentalDomain`. Pinned on `Re s > 1`
by the two sums below and everywhere by `meromorphic_completedPartialZeta`. -/
noncomputable def completedPartialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : ℂ → ℂ :=
  meromorphicContinuation 1 fun s ↦
    ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
      Gammaℂ s ^ nrComplexPlaces K *
      ∑' 𝔟 : {𝔟 : Ideal (𝓞 K) // 𝔟 ≠ ⊥ ∧ ∃ x : Kˣ,
          (𝔟 : FractionalIdeal (𝓞 K)⁰ K) * (I : FractionalIdeal (𝓞 K)⁰ K) =
            FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K)},
        (Ideal.absNorm (𝔟 : Ideal (𝓞 K)) : ℂ) ^ (-s)

/-- On `Re s > 1` the completed partial zeta function is `|d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂` times
the sum of `N𝔟^(-s)` over the nonzero integral ideals `𝔟` with `𝔟 I` principal: the content of
the continuation. -/
theorem completedPartialZeta_eq_tsum (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ}
    (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
        Gammaℂ s ^ nrComplexPlaces K *
        ∑' 𝔟 : {𝔟 : Ideal (𝓞 K) // 𝔟 ≠ ⊥ ∧ ∃ x : Kˣ,
            (𝔟 : FractionalIdeal (𝓞 K)⁰ K) * (I : FractionalIdeal (𝓞 K)⁰ K) =
              FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K)},
          (Ideal.absNorm (𝔟 : Ideal (𝓞 K)) : ℂ) ^ (-s) := sorry

/-- (5.3)–(5.4) in Mathlib's vocabulary: the same sum over the nonzero points of `σ(𝔞)` in the
fundamental cone, each ideal being hit `w = #μ(K)` times, `|N(a)| = N(𝔞) N(a𝔞⁻¹)`. -/
theorem completedPartialZeta_eq_tsum_fundamentalCone (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ}
    (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
        Gammaℂ s ^ nrComplexPlaces K *
        ((FractionalIdeal.absNorm (I : FractionalIdeal (𝓞 K)⁰ K) : ℚ) : ℂ) ^ s /
        (NumberField.Units.torsionOrder K : ℂ) *
        ∑' x : {x : mixedEmbedding.idealLattice K I // x ≠ 0 ∧
            (x : mixedEmbedding.mixedSpace K) ∈ mixedEmbedding.fundamentalCone K},
          ((mixedEmbedding.norm (x : mixedEmbedding.mixedSpace K) : ℝ) : ℂ) ^ (-s) := sorry

/-- The link to Layer 2: `Z(𝔎, s)` is the completion of the partial zeta function of the ray
class `c` of the trivial modulus consisting of the ideals `𝔟` with `𝔟 𝔞` principal. -/
theorem completedPartialZeta_eq_partialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (c : GNF.RayClassGroup (GNF.Modulus.one K))
    (hc : ∀ 𝔟 : GNF.integralIdealsPrimeTo (GNF.Modulus.one K),
      GNF.idealClass (GNF.Modulus.one K) 𝔟 = c ↔ ∃ x : Kˣ,
        ((𝔟 : Ideal (𝓞 K)) : FractionalIdeal (𝓞 K)⁰ K) * (I : FractionalIdeal (𝓞 K)⁰ K) =
          FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K))
    {s : ℂ} (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
        Gammaℂ s ^ nrComplexPlaces K * partialZeta K (GNF.Modulus.one K) c s := sorry

/-- The completed Dedekind zeta function is the sum over a system of class representatives. -/
theorem completedDedekindZeta_eq_sum_completedPartialZeta
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (GNF.Modulus.one K) rep) {s : ℂ} (hs : 1 < s.re) :
    completedDedekindZeta K s =
      ∑ c : ClassGroup (𝓞 K), completedPartialZeta K (idealUnit K (rep c) (hrep c).1.1) s := sorry

/-- The cone over a fundamental domain, `D × ℝ_+^*` in the coordinates of `surfaceScale`: the
positive parameters whose surface part lies in `D`. On it the sum over the lattice points of
`σ(𝔞)` unfolds to a sum over the ideals of the class of `𝔞⁻¹`. -/
def unitCone (D : Set (mixedEmbedding.realSpace K)) : Set (mixedEmbedding.realSpace K) :=
  {y | (∀ w, 0 < y w) ∧ surfacePart y ∈ D}

/-- **The sum–integral interchange is licensed by absolute convergence.** Over the cone, the
gamma integrals of the lattice points sum to a convergent series: each unit orbit modulo torsion
contributes one full gamma integral `π^{-ns/2} Γ(s/2)^r₁ Γ(s)^r₂ |N(a)|^(-s)` (up to the `2`-powers
of the normalization), and `∑_𝔟 N𝔟^(-Re s)` converges for `Re s > 1`. ⚠ Over all of `R_+^*` the
same sum diverges as soon as the unit group is infinite: that divergence is the Epstein
regression seen from the integral side. -/
theorem summable_integral_unitCone {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {σ : ℝ} (hσ : 1 < σ) :
    Summable fun x : {x : mixedEmbedding.idealLattice K I // x ≠ 0} ↦
      ∫ y in unitCone K D,
        ‖archGaussian K y (x : mixedEmbedding.mixedSpace K)‖ * archNorm y ^ (σ / 2)
          ∂(archHaar K) := sorry

/-- **Unfolding**, Neukirch (5.5) before the Mellin substitution. On the cone over a fundamental
domain the theta series minus its constant term integrates, against `N(y)^(s/2)` and the
multiplicative measure, to the completed partial zeta function: the sum over the lattice points
of `σ(𝔞)`, cut down by the cone to one point per unit orbit, is the sum over the integral ideals
of the class of `𝔞⁻¹` with multiplicity `w`, and each term contributes its gamma integral. The
constants: `2^r₂` from the Euclidean normalization of the complex coordinates (the gamma integral
of `e^{-π y |z|²}` against `y^{2s} dy/y` is `π^{-2s} Γ(2s) |z|^{-4s} = 2^{2s-1} Γ_ℂ(2s) |z|^{-4s}`),
`1/w` from the torsion, and the covolume `V_𝔞 = N(𝔞) 2^(-r₂) √|d_K|`, whose square rescales the
parameter so that the discriminant power `|d_K|^(s/2)` and the factor `N(𝔞)^s` of (5.4) both come
out. -/
theorem completedPartialZeta_eq_integral_unitCone {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ} (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ((2 : ℂ) ^ nrComplexPlaces K / (NumberField.Units.torsionOrder K : ℂ)) *
        ∫ y in unitCone K D,
          (latticeTheta K (mixedEmbedding.idealLattice K I)
              (fun w ↦ y w / ZLattice.covolume (mixedEmbedding.idealLattice K I) ^
                ((2 : ℝ) / Module.finrank ℚ K)) - 1) *
            ((archNorm y : ℝ) : ℂ) ^ (s / 2) ∂(archHaar K) := sorry

/-- The constant term of the Mellin kernel, Neukirch (5.8): `a₀ = 2^r₂ vol(D) / w = 2^(r-1) R / w`
with `r = r₁ + r₂`, `R` the regulator and `w = #μ(K)`; the same for every fundamental domain, and
`1/2` over `ℚ`, `1/4` over `ℚ(i)`. -/
noncomputable def mellinConstant : ℝ :=
  2 ^ (nrRealPlaces K + nrComplexPlaces K - 1) * NumberField.Units.regulator K /
    NumberField.Units.torsionOrder K

/-- **Neukirch VII (5.5), the Mellin kernel** of a lattice `L` for a fundamental domain `D`:
`f_D(L, u) = (2^r₂ / w) ∫_D θ_L(x · (u / V_L²)^(1/n)) d*x`, the theta series averaged over the
fundamental domain at norm `u / V_L²`, with `V_L` the covolume. For `L = σ(𝔞)`: `2^r₂` is the
Euclidean normalization of the complex coordinates, `1/w` counts the torsion — the kernel of
`u ↦ |u|²` — and `V_𝔞² = N(𝔞)² |d_K| / 4^r₂` is the rescaling of the parameter that turns the
gamma integral's `N(𝔞)^(-s) 2^(r₂(s-1))` into the `|d_K|^(s/2)` of the completed function. It does
not depend on `D` when the theta series is unit-invariant (`latticeTheta_unitScale`). -/
noncomputable def mellinKernel (D : Set (mixedEmbedding.realSpace K))
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) (u : ℝ) : ℂ :=
  ((2 : ℂ) ^ nrComplexPlaces K / (NumberField.Units.torsionOrder K : ℂ)) *
    ∫ x in (Subtype.val ⁻¹' D : Set (normOneSurface K)),
      latticeTheta K L (surfaceScale (x : mixedEmbedding.realSpace K) (u / ZLattice.covolume L ^ 2))
        ∂(surfaceHaar K)

/-- **The Mellin transform**, Neukirch (5.5) `Z(𝔎, 2s) = L(f, s)`: for `Re s > 1`,
`Z(𝔎, s) = ∫_0^∞ (f_D(𝔞, u) - a₀) u^(s/2) du/u`, Mathlib's `mellin` at `s/2`. ⚠ The completed
function at `s` is the Mellin transform at `s/2`; Mathlib's `mellin f s = ∫ t^(s-1) f(t) dt` is
Neukirch's `L(f, s)` of (1.4), and it is the transform in Mathlib's `WeakFEPair.hasMellin`. -/
theorem completedPartialZeta_eq_mellin {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ} (hs : 1 < s.re) :
    completedPartialZeta K I s =
      mellin (fun u ↦ mellinKernel K D (mixedEmbedding.idealLattice K I) u - (mellinConstant K : ℂ))
        (s / 2) := sorry

/-- Neukirch (5.8), second half: the kernel is its constant term up to an exponentially small
error, `f_D(L, u) = a₀ + O(e^{-c u^(1/n)})`, because on the compact closure of `D` every parameter
is bounded below and the nonzero lattice points are bounded away from `0`. This is what licenses
the Mellin principle. -/
theorem mellinKernel_sub_const_isBigO {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (L : Submodule ℤ (mixedEmbedding.mixedSpace K))
    [DiscreteTopology L] [IsZLattice ℝ L] :
    ∃ c : ℝ, 0 < c ∧ (fun u : ℝ ↦ mellinKernel K D L u - (mellinConstant K : ℂ)) =O[atTop]
      fun u : ℝ ↦ Real.exp (-c * u ^ ((1 : ℝ) / Module.finrank ℚ K)) := sorry

/-- The kernel tends to its constant term `mellinConstant K` at `∞`. -/
theorem mellinKernel_tendsto {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D)
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L] :
    Tendsto (mellinKernel K D L) atTop (𝓝 (mellinConstant K : ℂ)) := sorry

/-- **The kernel is continuous on `(0, ∞)`.** For `u` in a compact subset of `(0, ∞)` the
parameters `x (u/V_L²)^(1/n)`, `x ∈ D`, stay in a compact subset of the open orthant, because `D`
is a bounded subset of `S`, and there the theta series converges uniformly. This is the local
integrability that Mathlib's pair takes (`dedekindFEPair`), and Neukirch's continuity hypothesis
in (1.4). -/
theorem continuousOn_mellinKernel {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D)
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L] :
    ContinuousOn (mellinKernel K D L) (Set.Ioi 0) := sorry

/-- **Neukirch (5.8), first half — the transformation law of the kernel.** From
`latticeTheta_inv` and the substitution `x ↦ x⁻¹` on `S`, which preserves `d*x` and carries `D`
to `D⁻¹`: `f_D(L, 1/u) = u^(1/2) f_{D⁻¹}(L^∨, u)`. It holds for every lattice, with the Euclidean
dual; the covolumes `V_L V_{L^∨} = 1` make the two rescalings `u / V²` match on the nose. -/
theorem mellinKernel_inv {D : Set (mixedEmbedding.realSpace K)} (hD : IsUnitFundamentalDomain K D)
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L]
    {u : ℝ} (hu : 0 < u) :
    mellinKernel K D L u⁻¹ =
      ((Real.sqrt u : ℝ) : ℂ) *
        mellinKernel K (D⁻¹) (mixedDual K L) u := sorry

/-- `(𝔞𝔡)⁻¹`, the trace dual of `𝔞`, as a unit: Mathlib's `FractionalIdeal.dual`. -/
noncomputable def dualUnit (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : (FractionalIdeal (𝓞 K)⁰ K)ˣ :=
  Units.mk0 (FractionalIdeal.dual ℤ ℚ (I : FractionalIdeal (𝓞 K)⁰ K))
    (FractionalIdeal.dual_ne_zero (A := ℤ) (K := ℚ) I.ne_zero)

/-- The point `c₀ = m² / N(m²)^(1/n)` of `S`, `m_w = mult w`, `N(m²) = 16^r₂`, by which the
parameter is translated when the Euclidean dual of an ideal lattice is read as the trace dual:
`traceToEuclidean` doubles the complex coordinates, and `|2 z|² = 4 |z|²`. -/
noncomputable def traceShift : mixedEmbedding.realSpace K :=
  fun w ↦ (mult w : ℝ) ^ 2 / (16 : ℝ) ^ ((nrComplexPlaces K : ℝ) / Module.finrank ℚ K)

/-- The dual side of `mellinKernel_inv` is again an ideal kernel: by Tau Ceti's
`mixedDual_idealLattice` the Euclidean dual of `σ(𝔞)` is `traceToEuclidean (σ((𝔞𝔡)⁻¹))`, and the
doubling of the complex coordinates is the translation of the parameter by `traceShift`, a point of
`S`, under which `d*x` is invariant. The covolumes agree: `V_{(𝔞𝔡)⁻¹} = V_𝔞⁻¹ 4^(-r₂)` absorbs the
`16^r₂`. -/
theorem mellinKernel_dualIdealLattice {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (u : ℝ) :
    mellinKernel K D (mixedDual K (mixedEmbedding.idealLattice K I)) u =
      mellinKernel K ((fun y : mixedEmbedding.realSpace K ↦ traceShift K * y) '' D)
        (mixedEmbedding.idealLattice K (dualUnit K I)) u := sorry

/-- **The Dedekind instance of the Mellin principle**: `f = f_D(𝔞, ·)`, `g = f_{D⁻¹}(𝔞^∨, ·)`,
level `1`, weight `1/2`, `ε = 1`, both constants `a₀`. Each hypothesis of Mathlib's pair is
discharged from a named property of the kernel: local integrability from its continuity
(`continuousOn_mellinKernel`), the law from `mellinKernel_inv`, and the rapid decay from the
exponential decay of `mellinKernel_sub_const_isBigO`; `k = 1/2 > 0` and `ε = 1 ≠ 0`. Its `Λ` at
`s/2` is `completedPartialZeta 𝔞` at `s` (`dedekindFEPair_completed`), which is how the partial
zeta functions are continued. -/
noncomputable def dedekindFEPair {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : TauCeti.FEPairWithLevel ℂ where
  f := (Set.Ioi 0).indicator (mellinKernel K D (mixedEmbedding.idealLattice K I))
  g := (Set.Ioi 0).indicator (mellinKernel K D⁻¹ (mixedDual K (mixedEmbedding.idealLattice K I)))
  k := 1 / 2
  ε := 1
  f₀ := mellinConstant K
  g₀ := mellinConstant K
  N := 1
  hN := one_pos
  hf_int := ((continuousOn_mellinKernel K hD _).congr
    fun _ ht ↦ Set.indicator_of_mem ht _).locallyIntegrableOn measurableSet_Ioi
  hg_int := ((continuousOn_mellinKernel K hD.inv _).congr
    fun _ ht ↦ Set.indicator_of_mem ht _).locallyIntegrableOn measurableSet_Ioi
  hf_nonpos t ht := Set.indicator_of_notMem (fun h ↦ (not_lt.mpr ht) h) _
  hg_nonpos t ht := Set.indicator_of_notMem (fun h ↦ (not_lt.mpr ht) h) _
  hk := one_half_pos
  hε := one_ne_zero
  h_feq t ht := by
    have ht' : (0 : ℝ) < t := ht
    rw [show (1 : ℝ) / (1 * t) = t⁻¹ by ring,
      Set.indicator_of_mem (show t⁻¹ ∈ Set.Ioi (0 : ℝ) from inv_pos.mpr ht'),
      Set.indicator_of_mem ht,
      mellinKernel_inv K hD (mixedEmbedding.idealLattice K I) ht', one_mul, ← Real.sqrt_eq_rpow,
      smul_eq_mul]
  hf_top r := by
    obtain ⟨c, hc, h⟩ := mellinKernel_sub_const_isBigO K hD (mixedEmbedding.idealLattice K I)
    refine (TauCeti.isBigO_rpow_of_isBigO_exp_neg hc
      (div_pos one_pos (Nat.cast_pos.mpr Module.finrank_pos)) h r).congr' ?_ EventuallyEq.rfl
    filter_upwards [eventually_gt_atTop 0] with u hu
    rw [Set.indicator_of_mem (show u ∈ Set.Ioi (0 : ℝ) from hu)]
  hg_top r := by
    obtain ⟨c, hc, h⟩ :=
      mellinKernel_sub_const_isBigO K hD.inv (mixedDual K (mixedEmbedding.idealLattice K I))
    refine (TauCeti.isBigO_rpow_of_isBigO_exp_neg hc
      (div_pos one_pos (Nat.cast_pos.mpr Module.finrank_pos)) h r).congr' ?_ EventuallyEq.rfl
    filter_upwards [eventually_gt_atTop 0] with u hu
    rw [Set.indicator_of_mem (show u ∈ Set.Ioi (0 : ℝ) from hu)]

/-- Mathlib's `WeakFEPair.hasMellin` for `dedekindFEPair`, read against
`completedPartialZeta_eq_mellin`: the Mellin transform only sees `(0, ∞)`, where the pair's `f` is
the kernel. -/
theorem dedekindFEPair_completed {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ} (hs : 1 < s.re) :
    (dedekindFEPair K hD I).Λ (s / 2) = completedPartialZeta K I s := by
  have hmellin :
      mellin (fun u ↦ (dedekindFEPair K hD I).f u - (mellinConstant K : ℂ)) (s / 2) =
        mellin (fun u ↦ mellinKernel K D (mixedEmbedding.idealLattice K I) u -
          (mellinConstant K : ℂ)) (s / 2) := by
    refine MeasureTheory.setIntegral_congr_fun measurableSet_Ioi fun u hu ↦ ?_
    simp only [dedekindFEPair, Set.indicator_of_mem hu]
  rw [completedPartialZeta_eq_mellin K hD I hs, ← hmellin]
  refine ((dedekindFEPair K hD I).toWeakFEPair.hasMellin ?_).2.symm
  show (1 / 2 : ℝ) < (s / 2).re
  rw [Complex.div_ofNat_re]
  linarith

/-- Meromorphy of `completedPartialZeta` holds for every canonical continuation; the content of
the continuation is `completedPartialZeta_eq_tsum`. -/
theorem meromorphic_completedPartialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    Meromorphic (completedPartialZeta K I) :=
  fun x ↦ (TauCeti.meromorphicNFOn_meromorphicContinuation _ _ (Set.mem_univ x)).meromorphicAt

/-- The completed partial zeta function is analytic at every point other than `0` and `1`. -/
theorem analyticAt_completedPartialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ}
    (h0 : s ≠ 0) (h1 : s ≠ 1) : AnalyticAt ℂ (completedPartialZeta K I) s := sorry

/-- **Neukirch (5.9)**: `Z(𝔎, s) = Z(𝔎', 1 - s)` with `𝔎 𝔎' = [𝔡]`, i.e. against the dual ideal
`(𝔞𝔡)⁻¹`; the Mellin principle `FEPairWithLevel.Λ_eq` for `dedekindFEPair`, with
`mellinKernel_dualIdealLattice` on the `g` side. Pointwise off the poles `0`, `1`, and as germs
everywhere (`FEPairWithLevel.Λ_eventuallyEq`). -/
theorem completedPartialZeta_one_sub (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ} (h0 : s ≠ 0)
    (h1 : s ≠ 1) :
    completedPartialZeta K I (1 - s) = completedPartialZeta K (dualUnit K I) s := sorry

/-- The functional equation `completedPartialZeta_one_sub` as an equality of punctured germs at
every point, the poles included. -/
theorem completedPartialZeta_one_sub_eventuallyEq (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (s : ℂ) :
    (fun z ↦ completedPartialZeta K I (1 - z)) =ᶠ[𝓝[≠] s]
      completedPartialZeta K (dualUnit K I) := sorry

/-- (5.9): the residue at `s = 1` is `2 a₀ = 2^r R / w`, from Mathlib's residue at `k = 1/2`
(Mathlib's `WeakFEPair.Λ_residue_k`) in the variable `s/2`; summed over the `h` classes this is the
residue `2^(r₁+r₂) h R / w` of `completedDedekindZeta` at `1`
(`tendsto_sub_one_mul_completedDedekindZeta`, with `Γ_ℝ(1) = 1`, `Γ_ℂ(1) = 1/π` and the class
number formula). -/
theorem tendsto_sub_one_mul_completedPartialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    Tendsto (fun s : ℂ ↦ (s - 1) * completedPartialZeta K I s) (𝓝[≠] 1)
      (𝓝 (2 * mellinConstant K : ℂ)) := sorry

end UnitQuotient

/-! ### The Poisson and Mellin normalization

Layer 1 fixes the Fourier conventions and Layer 3 the completed function; the single theorem
below and its two checks are stated together, after both, so that no convention is chosen twice.
-/

open scoped Classical in
/-- **The single normalization theorem.** Every choice the functional equation depends on is
visible here at once: the additive character and the Fourier sign (inside `mixedFourier`), the
self-dual measure and the Euclidean pairing (likewise), the covolume of the ideal lattice, the
discriminant power `|d_K| ^ (s/2)`, the two archimedean factors — including the factor `2` inside
Mathlib's `Gammaℂ s = 2 (2π) ^ (-s) Γ s` — and the Mellin kernel itself, `mellinKernel`, with its
constant term `mellinConstant` and Neukirch's convention (5.5), `Z(𝔎, s) = ∫ (f(u) - a₀) u^(s/2)
du/u`; the kernel is the theta series of the ideal lattice averaged over a fundamental domain for
the units, and the third conjunct is `completedPartialZeta_eq_mellin` for every fundamental
domain. ⚠ It is not an existential: an unnamed `θ` would hide the unit quotient, which is the
whole difficulty in positive unit rank. The last conjunct repeats
`completedDedekindZeta_eq` deliberately, so that the discriminant power and the gamma factors are
audited beside the Fourier and covolume conventions they come from: scattered convention remarks
do not prevent a factor-of-two or an inverse-discriminant error.

The first conjunct is the Gaussian Fourier transform on the imaginary axis `τ = I * t`, and the
second is Tau Ceti's `tsum_idealLattice_eq_tsum_mixedDual_mixedFourier` applied to it; both are
stated again here because the point of the theorem is that the four number-field constants — the
covolume, the discriminant power and the two archimedean factors — are audited against the Fourier
conventions in one place. -/
theorem gaussianTheta_mellin_normalization (K : Type u) [Field K] [NumberField K] :
    (∀ t : ℝ, 0 < t → ∀ y : mixedEmbedding.mixedSpace K,
        mixedFourier K (mixedGaussian K t) y =
          (t : ℂ) ^ (-(Module.finrank ℚ K : ℂ) / 2) * mixedGaussian K t⁻¹ y) ∧
      (∀ (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (t : ℝ), 0 < t →
        ∑' x : mixedEmbedding.idealLattice K I,
            mixedGaussian K t (x : mixedEmbedding.mixedSpace K) =
          ((ZLattice.covolume (mixedEmbedding.idealLattice K I) : ℝ) : ℂ)⁻¹ *
            (t : ℂ) ^ (-(Module.finrank ℚ K : ℂ) / 2) *
            ∑' y : mixedDual K (mixedEmbedding.idealLattice K I),
              mixedGaussian K t⁻¹ (y : mixedEmbedding.mixedSpace K)) ∧
      (∀ (D : Set (mixedEmbedding.realSpace K)), IsUnitFundamentalDomain K D →
        ∀ (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (s : ℂ), 1 < s.re →
          completedPartialZeta K I s =
            ∫ u in Set.Ioi (0 : ℝ),
              (mellinKernel K D (mixedEmbedding.idealLattice K I) u - (mellinConstant K : ℂ)) *
                (u : ℂ) ^ (s / 2) / (u : ℂ)) ∧
      (∀ s : ℂ, 1 < s.re →
        completedDedekindZeta K s =
          ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
            Gammaℂ s ^ nrComplexPlaces K * dedekindZeta K s) := sorry

/-! ## Layer 4: Dirichlet L-functions and factorizations -/

/-- Layer 4: the quadratic factorization. ⚠ Both sides have a simple pole at `s = 1`, where
Mathlib's value is junk, so the identity is stated on the half-plane of convergence, as an
equality of germs everywhere, and pointwise only off the polar locus. The germ statement is what
`eventuallyEq_of_meromorphic_of_eqOn_halfPlane` produces from the first. -/
theorem dedekindZetaC_quadratic
    (F : Type u) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2) :
    ∃ (N : ℕ) (_ : NeZero N) (χ : DirichletCharacter ℂ N), χ.IsPrimitive ∧
      (∀ s : ℂ, 1 < s.re →
        dedekindZetaC F s = riemannZeta s * DirichletCharacter.LFunction χ s) ∧
      (∀ s : ℂ, dedekindZetaC F =ᶠ[𝓝[≠] s]
        fun z ↦ riemannZeta z * DirichletCharacter.LFunction χ z) ∧
      (∀ s : ℂ, s ≠ 1 →
        dedekindZetaC F s = riemannZeta s * DirichletCharacter.LFunction χ s) := sorry

/-- Layer 4: cyclotomic factorization using primitive characters inducing the characters modulo
`n`.  There is no correction factor in this primitive form.  The trivial character contributes
`riemannZeta`, so both sides have a simple pole at `s = 1` and the same three-level statement is
required as in the quadratic case. -/
theorem dedekindZetaC_cyclotomic
    (n : ℕ) [NeZero n] (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {n} ℚ F]
    (m : DirichletCharacter ℂ n → ℕ+)
    (hdvd : ∀ χ, (m χ : ℕ) ∣ n)
    (χ' : ∀ χ : DirichletCharacter ℂ n, DirichletCharacter ℂ (m χ))
    (hprim : ∀ χ, (χ' χ).IsPrimitive)
    (hind : ∀ χ, DirichletCharacter.changeLevel (hdvd χ) (χ' χ) = χ) :
    (∀ s : ℂ, 1 < s.re →
        dedekindZetaC F s =
          ∏ χ : DirichletCharacter ℂ n, DirichletCharacter.LFunction (χ' χ) s) ∧
      (∀ s : ℂ, dedekindZetaC F =ᶠ[𝓝[≠] s]
        fun z ↦ ∏ χ : DirichletCharacter ℂ n, DirichletCharacter.LFunction (χ' χ) z) ∧
      (∀ s : ℂ, s ≠ 1 →
        dedekindZetaC F s =
          ∏ χ : DirichletCharacter ℂ n, DirichletCharacter.LFunction (χ' χ) s) := sorry

/-- Layer 4: the corresponding factorization in terms of level-`n` characters.  The extra Euler
factors occur on the denominator side, as recorded by the product multiplying `dedekindZetaC`. -/
theorem dedekindZetaC_cyclotomic_imprimitive
    (n : ℕ) [NeZero n] (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {n} ℚ F]
    (m : DirichletCharacter ℂ n → ℕ) (hdvd : ∀ χ, m χ ∣ n)
    (χ' : ∀ χ : DirichletCharacter ℂ n, DirichletCharacter ℂ (m χ))
    (hprim : ∀ χ, (χ' χ).IsPrimitive)
    (hind : ∀ χ, DirichletCharacter.changeLevel (hdvd χ) (χ' χ) = χ) :
    (∀ s : ℂ, 1 < s.re →
        dedekindZetaC F s * ∏ χ : DirichletCharacter ℂ n, ∏ p ∈ n.primeFactors,
            (if p ∣ m χ then (1 : ℂ) else 1 - χ' χ (p : ZMod (m χ)) * (p : ℂ) ^ (-s)) =
          ∏ χ : DirichletCharacter ℂ n, DirichletCharacter.LFunction χ s) ∧
      (∀ s : ℂ,
        (fun z ↦ dedekindZetaC F z * ∏ χ : DirichletCharacter ℂ n, ∏ p ∈ n.primeFactors,
            (if p ∣ m χ then (1 : ℂ) else 1 - χ' χ (p : ZMod (m χ)) * (p : ℂ) ^ (-z))) =ᶠ[𝓝[≠] s]
          fun z ↦ ∏ χ : DirichletCharacter ℂ n, DirichletCharacter.LFunction χ z) := sorry

/-! ## Layer 5: finite-order Hecke L-functions -/

/-- On `Re s > 1` the presented Hecke L-function of a ray class character is the norm-regrouped
series of its ray class weight: the series continues to a meromorphic function on `ℂ`. -/
theorem heckeLFunctionC_eq
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) {s : ℂ} (hs : 1 < s.re) :
    heckeLFunctionC χ s = LSeries
      (ADS.normCoeff K
        (TauCeti.UnitaryIdealWeight.toIdealArithmeticFunction
          (χ.toUnitaryIdealWeight))) s := sorry

/-- **Orthogonality reconstruction.** ⚠ Both sides run over the ideals prime to the modulus, so no
Euler correction appears here; it appears only when the principal-character term is rewritten as
`ζ_K` times `finiteEulerCorrection`. -/
theorem partialZeta_eq_sum_heckeLFunctionC (𝔪 : GNF.Modulus K)
    [Fintype (GNF.RayClassCharacter 𝔪)] (c : GNF.RayClassGroup 𝔪) {s : ℂ} (hs : 1 < s.re) :
    (Nat.card (GNF.RayClassGroup 𝔪) : ℂ) * partialZeta K 𝔪 c s =
      ∑ χ : GNF.RayClassCharacter 𝔪, (starRingEnd ℂ) ((χ c : ℂˣ) : ℂ) *
        heckeLFunctionC χ s := sorry

open scoped Classical in
/-- **The analytic card of a primitive ray-class character**: coefficients the norm-regrouped
ray-class weight, conductor `|d_K| N(𝔣₀)`, one real gamma factor per real place with shift the
parity there of the Hecke character `HeckeCharacter.ofRayClassCharacter`, one complex gamma factor
per complex place with shift `0`, and simple poles at `0` and `1` exactly for the trivial
character. -/
noncomputable def heckeData (χ : PrimitiveRayClassCharacter K) : AnalyticLFunctionData :=
  AnalyticLFunctionData.ofSeries
    (ADS.normCoeff K (TauCeti.UnitaryIdealWeight.toIdealArithmeticFunction
      (χ.character.toUnitaryIdealWeight)))
    (Nat.toPNat' ((discr K).natAbs * Ideal.absNorm χ.conductor.finitePart))
    ((Finset.univ : Finset {w : InfinitePlace K // w.IsReal}).val.map fun w ↦
      (((GNF.HeckeCharacter.ofRayClassCharacter χ.conductor χ.character).infinityType.realParity
        w).val : ℂ))
    (Multiset.replicate (nrComplexPlaces K) 0)
    (if χ.character = 1 then Finsupp.single 0 1 + Finsupp.single 1 1 else 0)

/-- The completed L-function of a primitive ray-class character: the completed function of
`heckeData`. -/
noncomputable def completedHeckeLFunction (χ : PrimitiveRayClassCharacter K) : ℂ → ℂ :=
  (heckeData K χ).completed

/-- The completed L-function of a nontrivial primitive ray class character is entire. -/
theorem differentiable_completedHeckeLFunction
    (χ : PrimitiveRayClassCharacter K) (hχ : χ.character ≠ 1) :
    Differentiable ℂ (completedHeckeLFunction K χ) := sorry

/-- The root number of a primitive ray-class character: the root number of `heckeData`. -/
noncomputable def heckeRootNumber (χ : PrimitiveRayClassCharacter K) : ℂ :=
  (heckeData K χ).rootNumber

/-- The root number of a primitive ray class character has absolute value `1`. -/
theorem norm_heckeRootNumber (χ : PrimitiveRayClassCharacter K) :
    ‖heckeRootNumber K χ‖ = 1 := sorry

/-- The functional equation of a nontrivial primitive character, whose completed function is
entire. -/
theorem completedHeckeLFunction_one_sub
    (χ : PrimitiveRayClassCharacter K) (hχ : χ.character ≠ 1) (s : ℂ) :
    completedHeckeLFunction K χ s =
      heckeRootNumber K χ *
        completedHeckeLFunction K (χ⁻¹) (1 - s) := sorry

/-- ⚠ The trivial primitive character is not excluded from the theory, only from the pointwise
statement: its completed function is `completedDedekindZeta`, which has poles at `0` and `1`. The
germ form covers it. -/
theorem completedHeckeLFunction_one_sub_eventuallyEq
    (χ : PrimitiveRayClassCharacter K) (s : ℂ) :
    completedHeckeLFunction K χ =ᶠ[𝓝[≠] s]
      fun z ↦ heckeRootNumber K χ *
        completedHeckeLFunction K (χ⁻¹) (1 - z) := sorry

/-- The Mellin presentation in the form the zeros roadmap consumes. ⚠ The witness is not left to
this existential: it is `Grossencharacter.heckeMellinTotal` of the finite-order presentation,
identified in `completedHeckeLFunction_eq_mellin` (Layer 6), with
`θ(t) = 2 t^(Tr p / n) (F(t²) - a₀)`. -/
theorem exists_mellin_completedHeckeLFunction (χ : PrimitiveRayClassCharacter K) :
    ∃ θ : ℝ → ℂ, ∀ s : ℂ, 1 < s.re →
      completedHeckeLFunction K χ s =
        ∫ t in Set.Ioi (0 : ℝ), θ t * (t : ℂ) ^ s / (t : ℂ) := sorry

/-- **Neukirch VII (6.3), the Gauss sum** of a character `ρ` of the residue ring `𝓞/𝔪₀` of the
conductor of a primitive ray-class character `ψ`, at `y ∈ 𝔪₀⁻¹𝔡⁻¹`:
`τ_𝔪(ρ, y) = ∑_{x ∈ (𝓞/𝔪₀)ˣ} ρ(x) e^(2πi Tr(xy))`, a finite sum (the quotient by a nonzero ideal
is finite, so the `finsum` is a sum). The character is read on the residue class itself; only the
trace needs a representative, and `Tr(xy) mod ℤ` depends only on `x mod 𝔪₀` for such `y`, so
`Quotient.out` may be used (`gaussSum_eq_sum`). The theorems below take for `ρ` the **residue
character of `ψ`**: `ρ(a mod 𝔪₀) = ψ([(a)]) ∏_{w ∈ 𝔪∞} sgn(w(a))` for `a` prime to `𝔪₀`. It exists
and is unique — it is Hecke's residue character `existsUnique_residueCharacter` of the
finite-order presentation of `ψ`, whose archimedean value at `a` is that product of signs — and
it is not the coefficient of the presented series at a representative: at conductor one the
representative of the one residue class may be `0`, where that coefficient is `0`, while the
Gauss sum is `1` (`gaussSum_of_finitePart_eq_top`). -/
noncomputable def gaussSum (ψ : PrimitiveRayClassCharacter K)
    (ρ : MulChar (𝓞 K ⧸ ψ.conductor.finitePart) ℂ) (y : K) : ℂ :=
  ∑ᶠ x : (𝓞 K ⧸ ψ.conductor.finitePart)ˣ,
    ρ (x : 𝓞 K ⧸ ψ.conductor.finitePart) *
      Complex.exp (2 * Real.pi * Complex.I *
        ((Algebra.trace ℚ K (algebraMap (𝓞 K) K (Quotient.out
          (x : 𝓞 K ⧸ ψ.conductor.finitePart)) * y) : ℚ) : ℂ))

/-- The Gauss sum does not depend on the representatives, for `y ∈ 𝔪₀⁻¹𝔡⁻¹`: changing `x` by an
element of `𝔪₀` changes `Tr(xy)` by an element of `Tr(𝔡⁻¹) = ℤ`, and the character is read on the
residue class. -/
theorem gaussSum_eq_sum (ψ : PrimitiveRayClassCharacter K)
    (ρ : MulChar (𝓞 K ⧸ ψ.conductor.finitePart) ℂ) (y : K)
    (hy : y ∈ FractionalIdeal.dual ℤ ℚ (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K))
    (rep : (𝓞 K ⧸ ψ.conductor.finitePart)ˣ → 𝓞 K)
    (hrep : ∀ x, Ideal.Quotient.mk ψ.conductor.finitePart (rep x) =
      (x : 𝓞 K ⧸ ψ.conductor.finitePart)) :
    gaussSum K ψ ρ y = ∑ᶠ x : (𝓞 K ⧸ ψ.conductor.finitePart)ˣ,
      ρ (x : 𝓞 K ⧸ ψ.conductor.finitePart) *
        Complex.exp (2 * Real.pi * Complex.I *
          ((Algebra.trace ℚ K (algebraMap (𝓞 K) K (rep x) * y) : ℚ) : ℂ)) := sorry

/-- **Neukirch (6.4), first half**, for `y ∈ 𝔪₀⁻¹𝔡⁻¹` and the residue character `ρ` of a primitive
character: `τ_𝔪(ρ, a y) = conj(ρ(a)) τ_𝔪(ρ, y)`, with `ρ(a)` the residue character at `a mod 𝔪₀`.
Reindexing the sum by `x ↦ x a⁻¹` produces the **inverse** value `ρ(a)⁻¹`, which is
`conj(ρ(a))` for a unit-modulus character — Mathlib's `gaussSum_mulShift_eq` states exactly this
convention — and for `(a, 𝔪₀) ≠ 1` both sides are `0` (primitivity; `a` is then not a unit mod
`𝔪₀`, where the `MulChar` vanishes), so one equation covers (6.4)'s two cases. ⚠ At conductor one
every `a`, `0` included, is a unit mod `𝔪₀` of character value `1`, and both sides are `1`; with
the coefficient of the presented series at `a` in place of the residue character the equation
would read `1 = 0` at `a = 0`.
⚠ Quadratic characters cannot detect the inverse; an even primitive character of order `3`
modulo `7` with `ρ(3) = ω` gives `τ(ρ, 3/7) = ω⁻¹ τ(ρ, 1/7)`. ⚠ The domain hypothesis is needed
for the vanishing case: over `ℚ` with the even character mod `5`, `a = 5` and `y = 1/25` (not in
`(1/5)ℤ`) would give `τ(ρ, 1/5) = 0`, against `norm_gaussSum`. -/
theorem gaussSum_mul (ψ : PrimitiveRayClassCharacter K)
    (ρ : MulChar (𝓞 K ⧸ ψ.conductor.finitePart) ℂ)
    (hρ : ∀ (a : 𝓞 K) (ha : ψ.conductor.IsCoprimeTo (Ideal.span {a})),
      ρ (Ideal.Quotient.mk ψ.conductor.finitePart a) =
        ((ψ.character (GNF.idealClass ψ.conductor ⟨Ideal.span {a}, ha⟩) : ℂˣ) : ℂ) *
          ∏ w ∈ ψ.conductor.infinitePart,
            ((Real.sign (InfinitePlace.embedding_of_isReal w.2 (algebraMap (𝓞 K) K a)) : ℝ) : ℂ))
    (y : K) (hy : y ∈ FractionalIdeal.dual ℤ ℚ (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K))
    (a : 𝓞 K) :
    gaussSum K ψ ρ (algebraMap (𝓞 K) K a * y) =
      starRingEnd ℂ (ρ (Ideal.Quotient.mk ψ.conductor.finitePart a)) * gaussSum K ψ ρ y := sorry

/-- Neukirch (6.4), second half: `|τ_𝔪(ρ, y)| = √N(𝔪₀)` for the residue character `ρ` of a
primitive character, when `y ∈ 𝔪₀⁻¹𝔡⁻¹` and the integral ideal `y 𝔪₀ 𝔡` is prime to `𝔪₀`.
Consistency check with `gaussSum_mul`: over `ℚ` with the even character mod `5`, `y = 1/5` gives
`y 𝔪₀ 𝔡 = ℤ`, so `|τ(ρ, 1/5)| = √5`. -/
theorem norm_gaussSum (ψ : PrimitiveRayClassCharacter K)
    (ρ : MulChar (𝓞 K ⧸ ψ.conductor.finitePart) ℂ)
    (hρ : ∀ (a : 𝓞 K) (ha : ψ.conductor.IsCoprimeTo (Ideal.span {a})),
      ρ (Ideal.Quotient.mk ψ.conductor.finitePart a) =
        ((ψ.character (GNF.idealClass ψ.conductor ⟨Ideal.span {a}, ha⟩) : ℂˣ) : ℂ) *
          ∏ w ∈ ψ.conductor.infinitePart,
            ((Real.sign (InfinitePlace.embedding_of_isReal w.2 (algebraMap (𝓞 K) K a)) : ℝ) : ℂ))
    (y : K) (hy : y ∈ FractionalIdeal.dual ℤ ℚ (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K))
    (hcop : ∃ 𝔟 : Ideal (𝓞 K), ψ.conductor.IsCoprimeTo 𝔟 ∧
      FractionalIdeal.spanSingleton (𝓞 K)⁰ y *
          (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K) *
          (differentIdeal ℤ (𝓞 K) : FractionalIdeal (𝓞 K)⁰ K) = 𝔟) :
    ‖gaussSum K ψ ρ y‖ = Real.sqrt (Ideal.absNorm ψ.conductor.finitePart) := sorry

/-- ⚠ **The Gauss sum at conductor one is `1`**, at every `y ∈ 𝔡⁻¹`: `(𝓞/𝓞)ˣ` has one element,
every character is `1` there, and `Tr(x y) ∈ ℤ`. Conductor-one characters, the trivial one
among them, stay in the programme through this value; it is the `τ(χ_f) = 1` in Neukirch's root
number of `ζ_K`. -/
theorem gaussSum_of_finitePart_eq_top (ψ : PrimitiveRayClassCharacter K)
    (ρ : MulChar (𝓞 K ⧸ ψ.conductor.finitePart) ℂ)
    (h : ψ.conductor.finitePart = ⊤) (y : K)
    (hy : y ∈ FractionalIdeal.dual ℤ ℚ (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K)) :
    gaussSum K ψ ρ y = 1 := sorry

/-! ## Layer 6: Grossencharacters -/

/-- **Analytic presentation of the imported Hecke-character carrier, at a modulus.** The idele
class character `toHeckeCharacter` is the primary object: every other field is pinned to it by an
equation, so a presentation is determined by its Hecke character (`Grossencharacter.ext`), and the
L-function, conductor, root number and completions below describe that one character.

* `unitaryWeight` is the ideal weight induced by `toHeckeCharacter.unitaryPart`. At a prime `v`
  not dividing the finite part of the modulus it is the supplier's local component
  `HeckeCharacter.finiteComponent` of the unitary part at any uniformizer of `K_v`, which by the
  supplier's `HeckeCharacter.idealCharacter_apply_prime` is the value of
  `unitaryPart.idealCharacter` at `v`; it vanishes at the ideals not prime to `𝔪`. Complete
  multiplicativity then fixes it everywhere, so it is the supplier's ideal character of the
  unitary part extended by zero at the primes of `𝔪`.
* `infinityType` is the archimedean restriction of `toHeckeCharacter`: the supplier's
  `HeckeCharacter.infinityType`, compared on the identity component by the supplier's own comparison
  `ContinuousInfinityType.AgreesOnIdentityComponent` — the comparison in Weil's type-`A₀` condition
  — and on the nose at the real places outside `𝔪`, where no sign twist is presented.
* `𝔪` is a modulus of definition: `toHeckeCharacter` is trivial on the finite part of the
  supplier's `ideleCongruenceSubgroup 𝔪`, the ideles of that subgroup whose archimedean
  coordinates are all `1`. ⚠ Not on the whole subgroup: that would force finite order.

⚠ The archimedean carrier is the supplier's `AlgebraicInfinityType`, so this presents an
**algebraic** Hecke character (Weil's type `A₀`): `infinityType_eq` is a witness of
`toHeckeCharacter.IsAlgebraic`. The continuous family is not presented here — `normCharacter K t`
for `t ≠ 0` is not algebraic (`not_isAlgebraic_normCharacter`) — and the imaginary norm twists of
Layer 7 enter through `UnitaryIdealWeight.imaginaryNormTwist` on the weight. There is no
finite-character field: a ray-class character is a presentation only in the finite-order case
(`exists_rayClassCharacter_of_isFiniteOrder`), and the real shift is not a field either: the
ideal-side shift `Grossencharacter.idealShift` is the negative of the supplier's
`HeckeCharacter.shift` of the primary object. -/
structure Grossencharacter
    (K : Type u) [Field K] [NumberField K] (𝔪 : GNF.Modulus K) where
  toHeckeCharacter : GNF.HeckeCharacter K
  unitaryWeight : ADS.UnitaryIdealWeight K
  infinityType : GNF.AlgebraicInfinityType K
  eq_one_of_mem : ∀ y ∈ GNF.ideleCongruenceSubgroup 𝔪,
    (∀ w : InfinitePlace K, w.ideleInfiniteCoord y = 1) →
      toHeckeCharacter (QuotientGroup.mk y) = 1
  infinityType_eq : (GNF.AlgebraicInfinityType.toContinuous infinityType).AgreesOnIdentityComponent
    toHeckeCharacter.infinityType
  realParity_eq : ∀ w : {w : InfinitePlace K // w.IsReal}, w ∉ 𝔪.infinitePart →
    toHeckeCharacter.infinityType.realParity w =
      (GNF.AlgebraicInfinityType.toContinuous infinityType).realParity w
  unitaryWeight_eq_zero : ∀ I : Ideal (𝓞 K), ¬ 𝔪.IsCoprimeTo I → unitaryWeight.1 I = 0
  unitaryWeight_apply : ∀ v : HeightOneSpectrum (𝓞 K), ¬ v.asIdeal ∣ 𝔪.finitePart →
    ∀ u : (v.adicCompletion K)ˣ, Valued.v (u : v.adicCompletion K) = WithZero.exp (-1) →
      unitaryWeight.1 v.asIdeal = ((toHeckeCharacter.unitaryPart.finiteComponent v u : ℂˣ) : ℂ)

namespace Grossencharacter

variable {K} in
/-- **The ideal-side shift** `σ` of the convention `χ = χ_u N^σ` on ideals, under which
`lFunctionC χ s` is the unitary series at `s - σ` (`lFunctionC_eq`) and the completion recenters at
`s - σ` (`completed`). It is read off the primary object, and it is the **negative** of the
supplier's `HeckeCharacter.shift`, which is fixed idelically by `|χ| = ‖·‖^shift` (Tau Ceti's
`HeckeCharacter.norm_apply_eq_rpow_shift`): a prime idele has `‖π_𝔭‖ = N𝔭⁻¹`, so
`|χ(π_𝔭)| = N𝔭^(-shift)`. For the idele class character `‖·‖^(-m)`, whose ideal-side values are
`N𝔞^m`, the supplier's shift is `-m` and this one is `m` (`ratNormPow_idealShift`). -/
noncomputable def idealShift {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℝ :=
  -χ.toHeckeCharacter.shift

variable {K} in
/-- **The Hecke character is primary.** Two presentations of one idele class character at one
modulus are equal: the weight is forced by `unitaryWeight_apply` and `unitaryWeight_eq_zero`
through complete multiplicativity, and the infinity type by `infinityType_eq` and the supplier's
`AlgebraicInfinityType.toContinuous_injective`. -/
theorem ext {𝔪 : GNF.Modulus K} {χ ψ : Grossencharacter K 𝔪}
    (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) : χ = ψ := sorry

/-- The L-function of a presented Grossencharacter: the continuation from `Re s > 1 + idealShift`
of the norm-regrouped series of its unitary weight at `s - idealShift` (`lFunctionC_eq`). -/
noncomputable def lFunctionC {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ → ℂ :=
  meromorphicContinuation (1 + χ.idealShift) fun s ↦
    LSeries (ADS.normCoeff K
      (TauCeti.UnitaryIdealWeight.toIdealArithmeticFunction χ.unitaryWeight))
      (s - (χ.idealShift : ℂ))

/-- **The coefficients of the presented L-function.** On its half-plane of convergence it is the
norm-regrouped series of the presented unitary weight recentered by the shift,
`∑ χ_u(𝔞) N𝔞^(shift - s)` over the ideals prime to `𝔪`: the convention `χ = χ_u N^shift` of the
recentering law `completed`. Its Euler factors are the supplier's `EulerProductData` for
that weight, evaluated at `s - shift`. -/
theorem lFunctionC_eq {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) {s : ℂ}
    (hs : 1 + χ.idealShift < s.re) :
    lFunctionC K χ s =
      LSeries (ADS.normCoeff K
        (TauCeti.UnitaryIdealWeight.toIdealArithmeticFunction
          χ.unitaryWeight)) (s - (χ.idealShift : ℂ)) := sorry

/-- Meromorphy of `lFunctionC` holds for every canonical continuation; the content of the
continuation is `lFunctionC_eq`. -/
theorem meromorphic_lFunctionC {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    Meromorphic (lFunctionC K χ) :=
  fun x ↦ (TauCeti.meromorphicNFOn_meromorphicContinuation _ _ (Set.mem_univ x)).meromorphicAt

open scoped Classical in
/-- **The conductor of a presented Grossencharacter.** Its finite part is the supplier's
`HeckeCharacter.finiteConductor` of the primary object, `∏_v v^(a_v)` with `a_v` the least `n`
for which the local component is trivial on the `n`-th unit group. Its infinite part is this
roadmap's: the real places at which the parity of the archimedean restriction differs from the
parity of the algebraic exponent, which are exactly the real places a presentation must contain
(`realParity_eq`). ⚠ This is the conductor of the presentation, not the ramification conductor at
the real places: `‖·‖^(-m)` over `ℚ` with `m` odd is unramified at `∞` (its archimedean component
`|x|^(-m)` is trivial on `±1`), yet `∞` divides its conductor here, because its algebraic exponent
is odd. -/
noncomputable def primitiveConductor
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : GNF.Modulus K where
  finitePart := χ.toHeckeCharacter.finiteConductor
  finitePart_ne_bot := χ.toHeckeCharacter.finiteConductor_ne_bot
  infinitePart := Finset.univ.filter fun w ↦ χ.toHeckeCharacter.infinityType.realParity w ≠
    (GNF.AlgebraicInfinityType.toContinuous χ.infinityType).realParity w

/-- **The universal property of the conductor.** A modulus presents the underlying Hecke
character exactly when it is a multiple of the conductor, so the conductor is a function of
`toHeckeCharacter` and not of the modulus the presentation was written at. The finite half is the
supplier's `pow_dvd_finiteConductor_iff`; the infinite half is `realParity_eq`. -/
theorem primitiveConductor_dvd_iff {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (𝔫 : GNF.Modulus K) :
    primitiveConductor K χ ∣ 𝔫 ↔
      ∃ ψ : Grossencharacter K 𝔫, ψ.toHeckeCharacter = χ.toHeckeCharacter := sorry

/-- The conductor divides the modulus of the presentation. -/
theorem primitiveConductor_dvd {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    primitiveConductor K χ ∣ 𝔪 :=
  (primitiveConductor_dvd_iff K χ 𝔪).mpr ⟨χ, rfl⟩

/-- The conductor is a function of the Hecke character alone. -/
theorem primitiveConductor_congr {𝔪 𝔫 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (ψ : Grossencharacter K 𝔫) (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) :
    primitiveConductor K χ = primitiveConductor K ψ := sorry

open scoped Classical in
/-- Every presentation is the primitive series times the Euler factors at the primes dividing the
presentation modulus but not the conductor, `∏ (1 - χ_u(𝔭) N𝔭^(shift - s))` with the primitive
weight; on the half-plane and as germs, since the trivial weight has a pole. The primitive
presentation `χ₀` is any presentation of the same Hecke character at `primitiveConductor K χ`; it
exists by `primitiveConductor_dvd_iff` and is unique by `Grossencharacter.ext`. -/
theorem lFunctionC_eq_primitive {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (χ₀ : Grossencharacter K (primitiveConductor K χ))
    (h₀ : χ₀.toHeckeCharacter = χ.toHeckeCharacter) :
    (∀ s : ℂ, 1 + χ.idealShift < s.re →
        lFunctionC K χ s = lFunctionC K χ₀ s *
          ∏ 𝔭 ∈ 𝔪.support \ (primitiveConductor K χ).support,
            (1 - χ₀.unitaryWeight.1 𝔭.asIdeal *
              (Ideal.absNorm 𝔭.asIdeal : ℂ) ^ ((χ.idealShift : ℂ) - s))) ∧
      (∀ s : ℂ, lFunctionC K χ =ᶠ[𝓝[≠] s]
        fun z ↦ lFunctionC K χ₀ z *
          ∏ 𝔭 ∈ 𝔪.support \ (primitiveConductor K χ).support,
            (1 - χ₀.unitaryWeight.1 𝔭.asIdeal *
              (Ideal.absNorm 𝔭.asIdeal : ℂ) ^ ((χ.idealShift : ℂ) - z))) := sorry

end Grossencharacter

open scoped Classical in
/-- **The analytic card of a Grossencharacter** is the card of its unitary part at the conductor:
coefficients the norm-regrouped primitive unitary weight — the supplier's ideal character
`HeckeCharacter.idealCharacter` of the unitary part on the ideals prime to the finite conductor
`𝔣₀`, extended by `0` at the primes dividing `𝔣₀`, which is the weight of the presentation at the
conductor — conductor `|d_K| N(𝔣₀)`, real gamma shifts the parities `ε_w` of the archimedean
restriction of the unitary part, complex gamma shifts `|n_σ - n_σ̄| / 2`;
`Grossencharacter.rootNumber` and `Grossencharacter.unitaryCompletion` are its root number and
completed function. It is a function of the Hecke character alone (`grossencharacterData_congr`)
and its functional equation is centered at `1/2`: the dual card is the conjugate, which is the
inverse of a unitary character. ⚠ The full completion `completed χ s = unitaryCompletion χ
(s - shift)` is not the completed function of an analytic card when the shift is nonzero: its
critical line is `Re s = 1/2 + shift`, and `completed_one_sub` relates it at `s` to the full
completion of the inverse, whose shift is `-shift` and whose critical line is
`Re s = 1/2 - shift`, at `1 - s`. So the polar divisor that restricts `completed_one_sub` is read
off this card at `s - shift`. The root number and the completed function are those of
`AnalyticLFunctionData.ofSeries`. The polar divisor is the simple poles at `0` and `1` exactly
when the unitary part is trivial. -/
noncomputable def grossencharacterData
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : AnalyticLFunctionData :=
  AnalyticLFunctionData.ofSeries
    (ADS.normCoeff K fun I ↦
      if h : idealUnit K (I : Ideal (𝓞 K)) (nonZeroDivisors.ne_zero I.2) ∈
          GNF.idealsPrimeTo (⟨χ.toHeckeCharacter.unitaryPart.finiteConductor,
            χ.toHeckeCharacter.unitaryPart.finiteConductor_ne_bot, ∅⟩ : GNF.Modulus K) then
        ((χ.toHeckeCharacter.unitaryPart.idealCharacter ⟨_, h⟩ : ℂˣ) : ℂ)
      else 0)
    (Nat.toPNat' ((discr K).natAbs *
      Ideal.absNorm χ.toHeckeCharacter.finiteConductor))
    ((Finset.univ : Finset {w : InfinitePlace K // w.IsReal}).val.map
      fun w ↦ ((χ.toHeckeCharacter.infinityType.realParity w).val : ℂ))
    ((Finset.univ : Finset {w : InfinitePlace K // w.IsComplex}).val.map
      fun w ↦ ((|(GNF.AlgebraicInfinityType.toContinuous χ.infinityType).complexAngularFrequency
        w| : ℤ) : ℂ) / 2)
    (if χ.toHeckeCharacter.unitaryPart = 1 then Finsupp.single 0 1 + Finsupp.single 1 1 else 0)

namespace Grossencharacter

/-- The root number of a presented Grossencharacter: the root number of `grossencharacterData`. -/
noncomputable def rootNumber {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ :=
  (grossencharacterData K χ).rootNumber

/-- The root number of a presented Grossencharacter has absolute value `1`. -/
theorem norm_rootNumber {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    ‖rootNumber K χ‖ = 1 := sorry

/-- The completed L-function of the unitary part `χ_u = χ N^(-shift)`, at the conductor: the
completed function of the analytic card `grossencharacterData`. -/
noncomputable def unitaryCompletion
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ → ℂ :=
  (grossencharacterData K χ).completed

/-- The full completion, defined by recentering: `Λ(χ, s) = Λ(χ_u, s - shift)`. -/
noncomputable def completed
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (s : ℂ) : ℂ :=
  unitaryCompletion K χ (s - (χ.idealShift : ℂ))

/-- **The inverse presentation**, at the same modulus, by its fields: the inverse Hecke character,
the conjugate unitary weight, and the negated infinity type. With `χ = χ_u N^σ` this is
`conj(χ_u) N^(-σ)`, so its shift is `-σ`; it is not the conjugate
presentation `conj(χ_u) N^σ`, and the functional equation reflects against it. By
`Grossencharacter.ext` it is the only presentation of `χ.toHeckeCharacter⁻¹` at `𝔪`, so the
theorems below take any presentation `ψ` of the inverse Hecke character. -/
theorem exists_inverse {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    ∃ ψ : Grossencharacter K 𝔪, ψ.toHeckeCharacter = χ.toHeckeCharacter⁻¹ ∧
      ψ.unitaryWeight = TauCeti.UnitaryIdealWeight.conj χ.unitaryWeight ∧
      ψ.infinityType = -χ.infinityType := sorry

/-- The root number of the inverse is the inverse root number. -/
theorem rootNumber_inv
    {𝔪 : GNF.Modulus K} (χ ψ : Grossencharacter K 𝔪)
    (hψ : ψ.toHeckeCharacter = χ.toHeckeCharacter⁻¹) :
    rootNumber K ψ = (rootNumber K χ)⁻¹ := sorry

/-- **The finite-order presentation of a ray-class character**, by its fields: the supplier's
`HeckeCharacter.ofRayClassCharacter`, the ray-class weight `RayClassCharacter.toUnitaryIdealWeight`
of Layer 5, and the zero infinity type. By `Grossencharacter.ext` it is the only presentation of
that Hecke character at `𝔪`, so the theorems below take any such presentation. -/
theorem exists_ofRayClassCharacter {𝔪 : GNF.Modulus K} (η : GNF.RayClassCharacter 𝔪) :
    ∃ χ : Grossencharacter K 𝔪, χ.toHeckeCharacter = GNF.HeckeCharacter.ofRayClassCharacter _ η ∧
      χ.unitaryWeight = η.toUnitaryIdealWeight ∧ χ.infinityType = 0 := sorry

/-- A presentation of a ray-class character has ideal-side shift `0`: closed by the supplier's
`HeckeCharacter.shift_ofRayClassCharacter`. -/
theorem ofRayClassCharacter_idealShift
    {𝔪 : GNF.Modulus K} (η : GNF.RayClassCharacter 𝔪) (χ : Grossencharacter K 𝔪)
    (hχ : χ.toHeckeCharacter = GNF.HeckeCharacter.ofRayClassCharacter _ η) :
    χ.idealShift = 0 := by
  rw [idealShift, hχ, GNF.HeckeCharacter.shift_ofRayClassCharacter, neg_zero]

/-- **The finite presentation at the stated modulus.** A presentation of a finite-order Hecke
character at `𝔪` is the presentation of a ray-class character of `𝔪`: the finite pin makes the
character trivial on the finite congruence subgroup, and finite order together with
`realParity_eq` makes it trivial on the archimedean part of `IdeleCongruenceSubgroup 𝔪`, so it
factors through `rayClassQuotient 𝔪`. ⚠ Only in this case: an infinite-order character has no
ray-class presentation at any modulus — the angular characters of `ℚ(i)` below are unramified
and nontrivial, while the only ray-class character of the trivial modulus of `ℚ(i)` is trivial. -/
theorem exists_rayClassCharacter_of_isFiniteOrder {𝔪 : GNF.Modulus K}
    (χ : Grossencharacter K 𝔪) (h : χ.toHeckeCharacter.IsFiniteOrder) :
    ∃ η : GNF.RayClassCharacter 𝔪,
      GNF.HeckeCharacter.ofRayClassCharacter _ η = χ.toHeckeCharacter := sorry

/-- The weight of a finite-order presentation is the ray-class weight of the ray-class character
presenting it: the two pins of `unitaryWeight`, the supplier's `ofRayClassCharacter_apply`, and
the supplier's evaluation of `RayClassCharacter.toUnitaryIdealWeight` at an ideal prime to the
modulus. -/
theorem unitaryWeight_eq_rayClassIdealWeight {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (η : GNF.RayClassCharacter 𝔪)
    (h : χ.toHeckeCharacter = GNF.HeckeCharacter.ofRayClassCharacter _ η) :
    χ.unitaryWeight = η.toUnitaryIdealWeight := sorry

/-- A finite-order character has zero exponents and zero angular frequency (the supplier's
`exists_finiteOrderInfinityType`), so `infinityType_eq` forces the zero infinity type. -/
theorem infinityType_eq_zero_of_isFiniteOrder {𝔪 : GNF.Modulus K}
    (χ : Grossencharacter K 𝔪) (h : χ.toHeckeCharacter.IsFiniteOrder) :
    χ.infinityType = 0 := sorry

/-- Closed by the supplier's `isFiniteOrder_iff_exists_rayClassCharacter` and
`shift_ofRayClassCharacter`. -/
theorem idealShift_eq_zero_of_isFiniteOrder {𝔪 : GNF.Modulus K}
    (χ : Grossencharacter K 𝔪) (h : χ.toHeckeCharacter.IsFiniteOrder) : χ.idealShift = 0 := by
  obtain ⟨𝔫, η, hη⟩ :=
    (GNF.HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter χ.toHeckeCharacter).mp h
  rw [idealShift, ← hη]
  exact neg_eq_zero.mpr (GNF.HeckeCharacter.shift_ofRayClassCharacter η)

/-- The finite-order presentation has the ray-class L-function of Layer 5, on the half-plane and
as germs. -/
theorem lFunctionC_ofRayClassCharacter {𝔪 : GNF.Modulus K} (η : GNF.RayClassCharacter 𝔪)
    (χ : Grossencharacter K 𝔪)
    (hχ : χ.toHeckeCharacter = GNF.HeckeCharacter.ofRayClassCharacter _ η) :
    (∀ s : ℂ, 1 < s.re → lFunctionC K χ s = heckeLFunctionC η s) ∧
      ∀ s : ℂ, lFunctionC K χ =ᶠ[𝓝[≠] s] heckeLFunctionC η := sorry

/-- **The sign of the shift.** At a uniformizer `π_v` of `K_v`, `v ∤ 𝔪₀`, the local component of
the primary object (the supplier's `HeckeCharacter.finiteComponent`, its value at the prime idele
`π_v`) is the unitary weight times the ideal norm to the ideal-side shift:
`χ(π_v) = χ_u(𝔭) N𝔭^idealShift`. This is the
convention `χ = χ_u N^idealShift` of `lFunctionC_eq` and `completed`, read at one prime.
It agrees with the supplier's sign: the unitary part is `χ ‖·‖^(-shift)` and `‖π_v‖ = N𝔭⁻¹`, so
`χ(π_v) = χ_u(π_v) N𝔭^(-shift)`, and `-shift = idealShift`. Everything below that mentions the
shift — the unit relation, the recentering, the inverse presentation and the angular characters —
is stated in this convention. ⚠ With the supplier's `shift` in place of `idealShift` this equation
is false already for `‖·‖` over `ℚ`, of shift `1` and trivial unitary part: it would read
`1/p = p`. -/
theorem toHeckeCharacter_primeIdele {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (v : HeightOneSpectrum (𝓞 K)) (hv : ¬ v.asIdeal ∣ 𝔪.finitePart) (u : (v.adicCompletion K)ˣ)
    (hu : Valued.v (u : v.adicCompletion K) = WithZero.exp (-1)) :
    ((χ.toHeckeCharacter.finiteComponent v u : ℂˣ) : ℂ) =
      χ.unitaryWeight.1 v.asIdeal * (Ideal.absNorm v.asIdeal : ℂ) ^ (χ.idealShift : ℂ) := sorry

/-- **Hecke's unit relation**, derived from the primary object rather than taken as a field, and
with the sign the primary object forces. On a principal ideal generated by `a ≡ 1 mod* 𝔪` — the
supplier's `IsCongrOne`, positivity at the real places of `𝔪` included — the full weight
`χ_u((a)) N(a)^shift` is the **inverse** of the archimedean value `∏_τ τ(a)^(n_τ)`: the principal
idele of `a` is trivial for `toHeckeCharacter`; its finite coordinates evaluate, by
`toHeckeCharacter_primeIdele` at the primes dividing `(a)` and `eq_one_of_mem` at the units, to
`χ_u((a)) N(a)^shift`; its archimedean coordinates evaluate, by `infinityType_eq` and
`realParity_eq` (with `a > 0` at the real places of `𝔪`), to `∏_τ τ(a)^(n_τ)`; and the product
of the two is `1`. This is Neukirch VII (6.13): the archimedean component of the idele class
character is `b ↦ b⁻¹` against Hecke's `χ_∞`, so Hecke's classical infinity type is `-n`, and his
`χ((a)) = χ_f(a) χ_∞(a)` of (6.1) reads `χ_u((a)) N(a)^shift = ∏_τ τ(a)^(-n_τ)` on
`a ≡ 1 mod* 𝔪`. ⚠ The law with `∏_τ τ(a)^(n_τ)` on the right-hand side is false for every
nonreal angular character, already at shift zero: over `ℚ(i)` at `a = 2 + i` the finite value is
`((3+4i)/5)^(2k)` and the archimedean value is its inverse, which is not equal to it.
⚠ For `a` not congruent to `1` the two sides differ by the finite character `finiteCharacter`,
which this relation determines; quantifying over all `a` would leave only the unramified
characters. -/
theorem compatibility {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (x : Kˣ)
    (hx : GNF.IsCongrOne 𝔪 x) (a : 𝓞 K) (ha : algebraMap (𝓞 K) K a = x) :
    χ.unitaryWeight.1 (Ideal.span {a}) *
        ((Ideal.absNorm (Ideal.span {a}) : ℕ) : ℂ) ^ (χ.idealShift : ℂ) *
      ∏ τ : K →+* ℂ, τ (x : K) ^ χ.infinityType τ = 1 := sorry

/-- The unit relation solved for the finite value: `χ_u((a)) N(a)^shift = (∏_τ τ(a)^(n_τ))⁻¹`. -/
theorem compatibility_inv {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (x : Kˣ)
    (hx : GNF.IsCongrOne 𝔪 x) (a : 𝓞 K) (ha : algebraMap (𝓞 K) K a = x) :
    χ.unitaryWeight.1 (Ideal.span {a}) *
        ((Ideal.absNorm (Ideal.span {a}) : ℕ) : ℂ) ^ (χ.idealShift : ℂ) =
      (∏ τ : K →+* ℂ, τ (x : K) ^ χ.infinityType τ)⁻¹ :=
  eq_inv_of_mul_eq_one_left (compatibility K χ x hx a ha)

end Grossencharacter

/-- The conductor of the card is `|d_K|` times the norm of the finite part of the conductor of the
presentation: a reading of the definition of `grossencharacterData`. -/
theorem grossencharacterData_conductor
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    ((grossencharacterData K χ).conductor : ℕ) =
      (discr K).natAbs *
        Ideal.absNorm (Grossencharacter.primitiveConductor K χ).finitePart := by
  have h : 0 < (discr K).natAbs * Ideal.absNorm χ.toHeckeCharacter.finiteConductor :=
    Nat.mul_pos (Int.natAbs_pos.mpr (discr_ne_zero K))
      (Nat.pos_of_ne_zero (Ideal.absNorm_eq_zero_iff.not.mpr
        (TauCeti.GlobalNumberFields.HeckeCharacter.finiteConductor_ne_bot _)))
  simpa only [grossencharacterData, AnalyticLFunctionData.ofSeries_conductor,
    Grossencharacter.primitiveConductor] using PNat.toPNat'_coe h

/-- The analytic card is a function of the Hecke character alone: it does not see the presentation
modulus. -/
theorem grossencharacterData_congr {𝔪 𝔫 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (ψ : Grossencharacter K 𝔫) (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) :
    grossencharacterData K χ = grossencharacterData K ψ := sorry

/-- The unitary completion, like the conductor, is a function of the Hecke character alone, a
corollary of `grossencharacterData_congr`: it does not see the presentation modulus.
`lFunctionC` does, by `lFunctionC_eq_primitive`. -/
theorem Grossencharacter.unitaryCompletion_congr {𝔪 𝔫 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (ψ : Grossencharacter K 𝔫) (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) :
    Grossencharacter.unitaryCompletion K χ = Grossencharacter.unitaryCompletion K ψ :=
  congrArg AnalyticLFunctionData.completed (grossencharacterData_congr K χ ψ h)

/-- The root number is a function of the Hecke character alone, a corollary of
`grossencharacterData_congr`. -/
theorem Grossencharacter.rootNumber_congr {𝔪 𝔫 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (ψ : Grossencharacter K 𝔫) (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) :
    Grossencharacter.rootNumber K χ = Grossencharacter.rootNumber K ψ :=
  congrArg AnalyticLFunctionData.rootNumber (grossencharacterData_congr K χ ψ h)

/-- On `Re s > 1` the completed function of the card is its conductor power times its gamma factor
times its Dirichlet series. -/
theorem grossencharacterData_hasDirichletAgreement
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).HasDirichletAgreement := sorry

/-- The card of a Grossencharacter has meromorphic continuation with exact poles: simple poles at
`0` and `1` when the unitary part is trivial, and none otherwise. -/
theorem grossencharacterData_hasContinuation
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).HasMeromorphicContinuation := sorry

/-- The card of a Grossencharacter satisfies the functional equation of the record: off the
poles, the unitary completion at `s` is the root number times the completed function of the dual
card at `1 - s`. -/
theorem grossencharacterData_hasFunctionalEquation
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).HasFunctionalEquation := sorry

/-- ⚠ The integral norm powers `N^m` show why the hypotheses are needed: `completed (N^m) s` is
`Λ_K(s - m)`, with poles at `m` and `1 + m`, so the values on the two sides are junk there. The
pointwise equation carries the polar divisors of the two analytic cards, read at `s - shift`
because the cards are those of the unitary parts; the germ equality below carries none. The
equation reflects against any presentation `ψ` of the inverse Hecke character
(`Grossencharacter.exists_inverse`). -/
theorem Grossencharacter.completed_one_sub
    {𝔪 : GNF.Modulus K} (χ ψ : Grossencharacter K 𝔪)
    (hψ : ψ.toHeckeCharacter = χ.toHeckeCharacter⁻¹) (s : ℂ)
    (hs : (grossencharacterData K χ).polarOrder (s - (χ.idealShift : ℂ)) = 0)
    (hs' : (grossencharacterData K ψ).polarOrder
      (1 - (s - (χ.idealShift : ℂ))) = 0) :
    Grossencharacter.completed K χ s = Grossencharacter.rootNumber K χ *
      Grossencharacter.completed K ψ (1 - s) := sorry

/-- The functional equation `Grossencharacter.completed_one_sub` as an equality of punctured germs
at every point, with no condition on the poles. -/
theorem Grossencharacter.completed_one_sub_eventuallyEq
    {𝔪 : GNF.Modulus K} (χ ψ : Grossencharacter K 𝔪)
    (hψ : ψ.toHeckeCharacter = χ.toHeckeCharacter⁻¹) (s : ℂ) :
    Grossencharacter.completed K χ =ᶠ[𝓝[≠] s]
      fun z ↦ Grossencharacter.rootNumber K χ *
        Grossencharacter.completed K ψ (1 - z) := sorry

/-! ### The theta kernel of a Grossencharacter

Neukirch VII (6.1)–(6.4), (7.4)–(7.8) and (8.2)–(8.5), in this roadmap's normalization: the
unitary completion of a Grossencharacter is the Mellin transform of a theta series twisted by
Hecke's finite character and by a harmonic polynomial, averaged over a fundamental domain for
the units. The finite character is derived from the primary object; the polynomial and the
parameter shift are read off the infinity type with the sign fixed by `compatibility`. -/

namespace Grossencharacter

open scoped Classical

/-- **The full archimedean value** of the primary object at `x ∈ K`: the algebraic part
`∏_τ τ(x)^(n_τ)` times, at each real place, the sign `sgn(τ_w x)^(ε_w - n_w)` by which the actual
parity `ε_w` of the archimedean restriction differs from the parity of the algebraic exponent. By
`realParity_eq` that correction is trivial outside `𝔪∞`; at the real places of `𝔪` it is the
presented sign twist. ⚠ The algebraic infinity type alone misses it: the odd character mod `4∞`
of `ℚ` has exponent `0` and parity `1`, so its archimedean value at `-1` is `-1`, not `1`. -/
noncomputable def archimedeanValue {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (x : K) : ℂ :=
  letI : Fintype {w : InfinitePlace K // w.IsReal} := Fintype.ofFinite _
  (∏ τ : K →+* ℂ, τ x ^ χ.infinityType τ) *
    ∏ w : {w : InfinitePlace K // w.IsReal},
      ((Real.sign (InfinitePlace.embedding_of_isReal w.2 x) : ℝ) : ℂ) ^
        (χ.toHeckeCharacter.infinityType.realParity w -
          (χ.infinityType w.1.embedding : ZMod 2)).val

/-- On `a ≡ 1 mod* 𝔪` the full archimedean value is the algebraic one: `a > 0` at the real places
of `𝔪`, and the parities agree outside them. -/
theorem archimedeanValue_eq_of_isCongrOne {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (x : Kˣ) (hx : GNF.IsCongrOne 𝔪 x) :
    archimedeanValue K χ x = ∏ τ : K →+* ℂ, τ (x : K) ^ χ.infinityType τ := sorry

/-- **Hecke's finite character on integers, derived from the primary object** rather than stored:
for `a ∈ 𝓞_K`, `χ_f(a) := χ_u((a)) N(a)^shift · χ_∞(a)` with `χ_∞` the **full** archimedean value —
signs at the real places included. It is `1` on `a ≡ 1 mod* 𝔪` by `compatibility`
(`finiteCharacter_eq_one_of_isCongrOne`); it is multiplicative, it vanishes exactly off the elements
prime to `𝔪₀`, and on nonzero elements it depends only on the residue mod `𝔪₀`
(`finiteCharacter_residue`) — no sign data survives, because the signs are exactly what
`archimedeanValue` strips off. This is Neukirch's `χ_f = χ((a)) χ_∞(a)⁻¹` of VII (6.1), read on
integers: the coefficient that the twisted theta series `heckeTheta` evaluates, and the finite
character of the unitary part. ⚠ It is not itself the residue character. It is `0` at the actual
element `0`, since `(0)` is not prime to `𝔪`, while at conductor one the residue of `0` is the unit
`1`. The character of `(𝓞/𝔪₀)ˣ` that the Gauss sum `gaussSum` evaluates is the residue character of
`existsUnique_residueCharacter`, which agrees with this coefficient on nonzero elements. ⚠ Built
from the algebraic exponents alone it would be even at `-1` for every finite-order character, and
the theta series of an odd character would vanish by pairing `a` with `-a`. -/
noncomputable def finiteCharacter {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (a : 𝓞 K) :
    ℂ :=
  χ.unitaryWeight.1 (Ideal.span {a}) *
    ((Ideal.absNorm (Ideal.span {a}) : ℕ) : ℂ) ^ (χ.idealShift : ℂ) *
    archimedeanValue K χ (algebraMap (𝓞 K) K a)

/-- `compatibility`, restated: the finite character is trivial on `a ≡ 1 mod* 𝔪`. -/
theorem finiteCharacter_eq_one_of_isCongrOne {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (x : Kˣ) (hx : GNF.IsCongrOne 𝔪 x) (a : 𝓞 K) (ha : algebraMap (𝓞 K) K a = x) :
    finiteCharacter K χ a = 1 := by
  unfold finiteCharacter
  rw [ha, archimedeanValue_eq_of_isCongrOne K χ x hx]
  exact compatibility K χ x hx a ha

/-- The finite character is multiplicative on `𝓞_K`. -/
theorem finiteCharacter_mul {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (a b : 𝓞 K) :
    finiteCharacter K χ (a * b) = finiteCharacter K χ a * finiteCharacter K χ b := sorry

/-- The finite character vanishes exactly at the elements whose principal ideal is not prime to the
modulus. -/
theorem finiteCharacter_eq_zero_iff {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (a : 𝓞 K) :
    finiteCharacter K χ a = 0 ↔ ¬ 𝔪.IsCoprimeTo (Ideal.span {a}) := sorry

/-- **The residue character exists and is unique**: a character of the residue ring `𝓞/𝔪₀` in
Mathlib's sense (`MulChar`: multiplicative, `1` at `1`, `0` off the units) that agrees with the
coefficient `finiteCharacter` on every nonzero element. It exists because on nonzero elements the
coefficient depends only on the residue: two integers `a`, `b` with `a = x b`, `x ≡ 1 mod 𝔪₀` at
the finite places only, differ at the finite idele coordinates by a principal unit at each
`v ∣ 𝔪₀`, on which the presented character is trivial, and the signs at `𝔪∞` are removed by
`archimedeanValue`. It vanishes exactly off the units mod `𝔪₀`, and it is unique because every
residue class has a nonzero representative (`𝔪₀ ≠ 0`). ⚠ The comparison is on nonzero elements
only, and this is needed at conductor one: there `𝓞/𝔪₀` has one element, the unit `1`, where every
character is `1`, while the coefficient is `0` at `0`. This is **Hecke's residue character**
`χ_f` of `(𝓞/𝔪₀)ˣ`, Neukirch VII (6.1); for the presentation of a primitive ray-class character it
is the character that the Gauss sum `gaussSum` evaluates and in which Neukirch's (6.4) is stated
(`gaussSum_mul`). -/
theorem existsUnique_residueCharacter {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    ∃! ρ : MulChar (𝓞 K ⧸ 𝔪.finitePart) ℂ,
      ∀ a : 𝓞 K, a ≠ 0 → ρ (Ideal.Quotient.mk 𝔪.finitePart a) = finiteCharacter K χ a := sorry

/-- **On nonzero elements the coefficient depends only on the residue mod `𝔪₀`**, with no condition
on signs: both values are the residue character's (`existsUnique_residueCharacter`). ⚠ Not at `0`:
at conductor one `0` and `1` have the same residue, while the coefficient is `0` at `0` and `1` at
`1`. -/
theorem finiteCharacter_residue {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (a b : 𝓞 K)
    (ha : a ≠ 0) (hb : b ≠ 0)
    (h : Ideal.Quotient.mk 𝔪.finitePart a = Ideal.Quotient.mk 𝔪.finitePart b) :
    finiteCharacter K χ a = finiteCharacter K χ b := by
  obtain ⟨ρ, hρ, -⟩ := existsUnique_residueCharacter K χ
  rw [← hρ a ha, ← hρ b hb, h]

/-- On a unit the finite character is the full archimedean value, since `(u) = 𝓞_K` and
`N(u) = 1`: Neukirch's `χ_f(ε) χ_∞(ε) = 1`, the input of (8.2). ⚠ With signs: at `u = -1` for the
odd character mod `4∞` this is `-1`. -/
theorem finiteCharacter_unit {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (u : (𝓞 K)ˣ) :
    finiteCharacter K χ u = archimedeanValue K χ (algebraMap (𝓞 K) K u) := by
  simp [finiteCharacter, Ideal.span_singleton_eq_top.mpr u.isUnit]

/-- The finite character extends uniquely and multiplicatively from the integers prime to `𝔪₀`
to the fractions prime to `𝔪₀` — Neukirch's `K^(𝔪)` (VII §6, p. 471), the supplier's
`primeToSubgroup 𝔪` — and by zero to the rest of `Kˣ`. -/
theorem existsUnique_finiteCharacterK {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    ∃! f : Kˣ → ℂ,
      (∀ x y : Kˣ, x ∈ GNF.primeToSubgroup 𝔪 → y ∈ GNF.primeToSubgroup 𝔪 →
        f (x * y) = f x * f y) ∧
      (∀ x : Kˣ, x ∉ GNF.primeToSubgroup 𝔪 → f x = 0) ∧
      ∀ (a : 𝓞 K) (x : Kˣ), algebraMap (𝓞 K) K a = x → f x = finiteCharacter K χ a := sorry

/-- The exponent `P_w` of `|x_w|` carried by the harmonic polynomial at the place `w`: the
parity of the archimedean restriction at a real place, the absolute angular frequency
`|n_τ - n_τ̄|` at a complex place. -/
noncomputable def harmonicExponent {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (w : InfinitePlace K) : ℕ :=
  if h : w.IsReal then (χ.toHeckeCharacter.infinityType.realParity ⟨w, h⟩).val
  else ((GNF.AlgebraicInfinityType.toContinuous χ.infinityType).complexAngularFrequency
    ⟨w, not_isReal_iff_isComplex.mp h⟩).natAbs

/-- Neukirch's `Tr(p)`, the total degree of the harmonic polynomial: the number of odd real places
plus the sum of `|n_τ - n_τ̄|` over the complex places. It is the amount by which the Mellin
variable is shifted in `unitaryCompletion_eq_mellin`, and it is invariant under passing to the
inverse presentation (`harmonicDegree_inverse`). -/
noncomputable def harmonicDegree {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℕ :=
  ∑ w : InfinitePlace K, harmonicExponent K χ w

/-- The inverse presentation has the same harmonic degree `Tr p`: inversion negates every angular
frequency and keeps every parity. -/
theorem harmonicDegree_inverse {𝔪 : GNF.Modulus K} (χ ψ : Grossencharacter K 𝔪)
    (hψ : ψ.toHeckeCharacter = χ.toHeckeCharacter⁻¹) :
    harmonicDegree K ψ = harmonicDegree K χ := sorry

/-- **The harmonic polynomial of the theta kernel**, Neukirch's `N(a^p)` (VII §7, p. 489) for the
admissible exponent `p` determined by the infinity type of the unitary part: the ideal-side
unitary archimedean value `∏_τ (τ(a)/|τ(a)|)^(-n_τ)` cleared of its denominators. At a real place
it is `x^(ε_w)`, `ε_w` the parity of the archimedean restriction; at a complex place with angular
frequency `k_w = n_τ - n_τ̄` it is `conj(z)^(k_w)` for `k_w ≥ 0` and `z^(-k_w)` for `k_w < 0`.
⚠ The sign follows `compatibility`: the ideal-side value is the inverse of the idelic archimedean
value, so a positive angular frequency puts the *conjugate* coordinate into the polynomial. -/
noncomputable def harmonicFactor {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (x : mixedEmbedding.mixedSpace K) : ℂ :=
  letI : Fintype {w : InfinitePlace K // w.IsReal} := Fintype.ofFinite _
  letI : Fintype {w : InfinitePlace K // w.IsComplex} := Fintype.ofFinite _
  (∏ w : {w : InfinitePlace K // w.IsReal},
      ((x.1 w : ℝ) : ℂ) ^ (χ.toHeckeCharacter.infinityType.realParity w).val) *
    ∏ w : {w : InfinitePlace K // w.IsComplex},
      if 0 ≤ (GNF.AlgebraicInfinityType.toContinuous χ.infinityType).complexAngularFrequency w then
        starRingEnd ℂ (x.2 w) ^
          ((GNF.AlgebraicInfinityType.toContinuous χ.infinityType).complexAngularFrequency w).toNat
      else x.2 w ^
        (-(GNF.AlgebraicInfinityType.toContinuous χ.infinityType).complexAngularFrequency w).toNat

/-- The polynomial is homogeneous under the unit action, and the finite character compensates:
`χ_f(u) N(u^p) = ∏_w |u_w|^(P_w)` for a unit `u`, by `finiteCharacter_unit`: the sign of
`u_w^(ε_w)` at a real place is cancelled by the sign in `archimedeanValue`. ⚠ At `u = -1` for the
odd character mod `4∞` both factors are `-1`; with a finite
character built from the algebraic exponents alone this theorem would read `-1 = 1`. -/
theorem finiteCharacter_mul_harmonicFactor_unit {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (u : (𝓞 K)ˣ) :
    finiteCharacter K χ u * harmonicFactor K χ (mixedEmbedding K (algebraMap (𝓞 K) K u)) =
      ((∏ w : InfinitePlace K,
        mixedEmbedding.normAtPlace w (mixedEmbedding K (algebraMap (𝓞 K) K u)) ^
          harmonicExponent K χ w : ℝ) : ℂ) := sorry

/-- **Hecke's lemma**, Neukirch VII (3.5)–(3.6) at `z = i y`: the harmonic polynomial times the
Gaussian is a Fourier eigenfunction up to the constant `(-i)^(Tr p)` and the weights
`y_w^(-P_w)`; in one real variable, `x^p e^{-π y x²} ↦ (-i)^p y^(-1/2 - p) ξ^p e^{-π ξ²/y}`, and a
complex coordinate contributes the holomorphic Hermite function `z^k e^{-π|z|²}` or its
conjugate. -/
theorem mixedFourier_harmonicFactor_mul_archGaussian {𝔪 : GNF.Modulus K}
    (χ : Grossencharacter K 𝔪) (y : mixedEmbedding.realSpace K) (hy : ∀ w, 0 < y w)
    (ξ : mixedEmbedding.mixedSpace K) :
    mixedFourier K (fun x ↦ harmonicFactor K χ x * archGaussian K y x) ξ =
      (-Complex.I) ^ harmonicDegree K χ * (((Real.sqrt (archNorm y))⁻¹ : ℝ) : ℂ) *
        ((∏ w : InfinitePlace K, (y w)⁻¹ ^ harmonicExponent K χ w : ℝ) : ℂ) *
        harmonicFactor K χ ξ * archGaussian K (fun w ↦ (y w)⁻¹) ξ := sorry

/-- The archimedean weight `N(x^(p/2)) = ∏_w x_w^(P_w/2)` of Neukirch (8.2)–(8.3), the factor
that makes the twisted kernel unit-invariant and shifts the Mellin variable by `Tr(p)/n`. -/
noncomputable def archWeight {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (y : mixedEmbedding.realSpace K) : ℝ :=
  ∏ w : InfinitePlace K, y w ^ ((harmonicExponent K χ w : ℝ) / 2)

/-- Neukirch's `ε(χ)`: the constant term of the twisted theta series, `1` exactly when the
finite conductor `𝔣₀` (the supplier's `HeckeCharacter.finiteConductor`) is trivial and the
polynomial is constant, `0` otherwise. It is the residue character at the class of `0` times the
polynomial at `0`: the class of `0` is a unit exactly when `𝔣₀ = 1`, and the polynomial is `1` at
`0` exactly when `Tr p = 0`. ⚠ Not the whole `primitiveConductor`: a real place divides it
whenever the parity of the archimedean restriction differs from the parity of the algebraic
exponent there, even when the character is unramified there and the polynomial is constant. The
odd norm powers of `ℚ` have presentation conductor `∞` and constant term `1`. -/
noncomputable def heckeEpsilon {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ :=
  if χ.toHeckeCharacter.finiteConductor = ⊤ ∧ harmonicDegree K χ = 0 then 1 else 0

/-- **The twisted theta series**, Neukirch's `θ^p(𝔎, χ_f, z)` (VII §7, p. 489) at `z = i y`, over
the nonzero integral ideal `𝔞`: `ε(χ) + ∑_{a ∈ 𝔞} χ_f(a) N(a^p) exp(-π ∑_w y_w |a_w|²)`, with the
finite character `finiteCharacter` of the presentation, which is `0` at `a = 0`. The kernel is
used at a presentation at its conductor (`unitaryCompletion_eq_mellin`), where the completion
lives, and at integral ideals prime to it, which represent every class. For the trivial character
it is `latticeTheta` of `σ(𝔞)`. -/
noncomputable def heckeTheta {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (𝔞 : Ideal (𝓞 K)) (y : mixedEmbedding.realSpace K) : ℂ :=
  heckeEpsilon K χ +
    ∑' a : 𝔞,
      finiteCharacter K χ (a : 𝓞 K) *
        harmonicFactor K χ (mixedEmbedding K (algebraMap (𝓞 K) K a)) *
        archGaussian K y (mixedEmbedding K (algebraMap (𝓞 K) K a))

/-- **Neukirch VII (8.2), unit invariance of the weighted kernel.** Reindexing by a unit `u`
multiplies the twisted theta series by `χ_f(u)⁻¹ N(u^p)⁻¹ = ∏_w |u_w|^(-P_w)`
(`finiteCharacter_mul_harmonicFactor_unit`), which is exactly what the archimedean weight gains
under `unitScale u`. -/
theorem archWeight_mul_heckeTheta_unitScale {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (𝔞 : Ideal (𝓞 K)) (u : (𝓞 K)ˣ) (y : mixedEmbedding.realSpace K) (hy : ∀ w, 0 < y w) :
    (archWeight K χ (unitScale u y) : ℂ) * heckeTheta K χ 𝔞 (unitScale u y) =
      (archWeight K χ y : ℂ) * heckeTheta K χ 𝔞 y := sorry

/-- The rescaling `λ_𝔞 = V_𝔞² N(𝔣₀)` of the parameter in the twisted kernel: the covolume of
`σ(𝔞)` squared times the norm of the finite conductor, which produces the conductor power
`(|d_K| N(𝔣₀))^(s/2)` of the completion. -/
noncomputable def heckeScale {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : ℝ :=
  ZLattice.covolume (mixedEmbedding.idealLattice K I) ^ 2 *
    Ideal.absNorm χ.toHeckeCharacter.finiteConductor

open scoped Classical in
/-- **Neukirch VII (8.3), the Mellin kernel of a Grossencharacter** for the nonzero integral ideal
`𝔞` and the fundamental domain `D`:
`(2^r₂ / w) · 2^(-(∑ P_w) / 2) · λ_𝔞^(-Tr p / 2n) ∫_D N(x^(p/2)) θ_χ(𝔞, x (u/λ_𝔞)^(1/n)) d*x`,
the sum over the complex places.
The three constants come from the gamma integral of the weighted Gaussian: at a complex place
`∫ e^{-π y |z|²} y^(2s + P/2) dy/y = π^(-(2s + P/2)) Γ(2s + P/2) |z|^(-4s - P)` is
`2^(2s + P/2 - 1) Γ_ℂ(2s + P/2) |z|^(-4s - P)`, whose `2^(2s)` and `2^(-1)` are the `V_𝔞²` and the
`2^r₂` of `mellinKernel`, and whose `2^(P/2)` is new; the polynomial weight `N(x^(p/2))` scales by
`λ^(Tr p / 2n)` under `u ↦ u/λ`. The `|z|^(-P)` cancels the `|a_w|^(P_w)` of
`χ_f(a) N(a^p) = χ_u((a)) ∏_w |a_w|^(P_w)`, which is why the gamma shifts of the card are
`ε_w` and `|k_w|/2` (`grossencharacterData`). -/
noncomputable def heckeMellinKernel {𝔪 : GNF.Modulus K} (D : Set (mixedEmbedding.realSpace K))
    (χ : Grossencharacter K 𝔪) (𝔞 : Ideal (𝓞 K)) (h𝔞 : 𝔞 ≠ ⊥) (u : ℝ) : ℂ :=
  ((2 : ℂ) ^ nrComplexPlaces K / (NumberField.Units.torsionOrder K : ℂ)) *
    (2 : ℂ) ^ (-((∑ w : {w : InfinitePlace K // w.IsComplex},
      (harmonicExponent K χ w : ℂ)) / 2)) *
    ((heckeScale K χ (idealUnit K 𝔞 h𝔞) ^
      (-(harmonicDegree K χ : ℝ) / (2 * Module.finrank ℚ K)) : ℝ) : ℂ) *
    ∫ x in (Subtype.val ⁻¹' D : Set (normOneSurface K)),
      (archWeight K χ (x : mixedEmbedding.realSpace K) : ℂ) *
        heckeTheta K χ 𝔞 (surfaceScale (x : mixedEmbedding.realSpace K)
          (u / heckeScale K χ (idealUnit K 𝔞 h𝔞)))
        ∂(surfaceHaar K)

/-- The kernel of the trivial character is the Dedekind kernel. -/
theorem heckeMellinKernel_one {D : Set (mixedEmbedding.realSpace K)}
    (χ : Grossencharacter K (GNF.Modulus.one K)) (hχ : χ.toHeckeCharacter = 1)
    (𝔞 : Ideal (𝓞 K)) (h𝔞 : 𝔞 ≠ ⊥) (u : ℝ) :
    heckeMellinKernel K D χ 𝔞 h𝔞 u =
      mellinKernel K D (mixedEmbedding.idealLattice K (idealUnit K 𝔞 h𝔞)) u := sorry

/-- The per-class completed unitary L-function, Neukirch's `Λ(𝔎, χ, s)` (VII §8, p. 497) for the
unitary part: `(|d_K| N𝔣₀)^(s/2) γ(s) ∑_{𝔟 𝔞 principal} χ_u(𝔟) N𝔟^(-s)`, with `γ` the gamma factor
of `grossencharacterData` and `χ_u` the unitary weight of the presentation. -/
noncomputable def unitaryPartialCompletion {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (𝔞 : Ideal (𝓞 K)) : ℂ → ℂ :=
  meromorphicContinuation 1 fun s ↦
    ((grossencharacterData K χ).conductor : ℂ) ^ (s / 2) *
      (grossencharacterData K χ).gammaFactor s *
      ∑' 𝔟 : {𝔟 : Ideal (𝓞 K) // 𝔟 ≠ ⊥ ∧ ∃ x : Kˣ,
          (𝔟 : FractionalIdeal (𝓞 K)⁰ K) * (𝔞 : FractionalIdeal (𝓞 K)⁰ K) =
            FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K)},
        χ.unitaryWeight.1 𝔟 * (Ideal.absNorm (𝔟 : Ideal (𝓞 K)) : ℂ) ^ (-s)

/-- On `Re s > 1`, for `𝔞` prime to the conductor, the per-class completion is the conductor power
and gamma factor of the card times `∑ χ_u(𝔟) N𝔟^(-s)` over the nonzero integral ideals `𝔟` with
`𝔟 𝔞` principal. -/
theorem unitaryPartialCompletion_eq_tsum {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (𝔞 : Ideal (𝓞 K)) (h𝔞 : (primitiveConductor K χ).IsCoprimeTo 𝔞) {s : ℂ} (hs : 1 < s.re) :
    unitaryPartialCompletion K χ 𝔞 s =
      ((grossencharacterData K χ).conductor : ℂ) ^ (s / 2) *
        (grossencharacterData K χ).gammaFactor s *
        ∑' 𝔟 : {𝔟 : Ideal (𝓞 K) // 𝔟 ≠ ⊥ ∧ ∃ x : Kˣ,
            (𝔟 : FractionalIdeal (𝓞 K)⁰ K) * (𝔞 : FractionalIdeal (𝓞 K)⁰ K) =
              FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K)},
          χ.unitaryWeight.1 𝔟 * (Ideal.absNorm (𝔟 : Ideal (𝓞 K)) : ℂ) ^ (-s) := sorry

/-- The unitary completion of a presentation at its conductor is the sum of the per-class
completions over a system of representatives prime to the conductor. At a presentation that is
not at its conductor the per-class sums miss the Euler factors at the primes dividing the
modulus and not the conductor, while `unitaryCompletion` does not (`unitaryCompletion_congr`). -/
theorem unitaryCompletion_eq_sum {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (hχ : primitiveConductor K χ = 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) {s : ℂ} (hs : 1 < s.re) :
    unitaryCompletion K χ s = ∑ c : ClassGroup (𝓞 K), unitaryPartialCompletion K χ (rep c) s :=
  sorry

/-- **Neukirch (8.3), the per-class Mellin identity**: for `Re s > 1`,
`Λ(𝔎, χ_u, s) = χ_u(𝔞)⁻¹ ∫_0^∞ (f_D(χ, 𝔞, u) - ε(χ) a₀) u^((s + Tr p / n)/2) du/u`, the class of
`𝔞` entering through `χ_u((a)) = χ_u(a 𝔞⁻¹) χ_u(𝔞)`; the Mellin variable is shifted by `Tr(p)/n`
because the weight `N(y^(p/2))` is `N(x^(p/2)) t^(Tr p / 2n)` in the coordinates of
`surfaceScale`. -/
theorem unitaryPartialCompletion_eq_mellin {𝔪 : GNF.Modulus K}
    {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪) (𝔞 : Ideal (𝓞 K))
    (h𝔞 : (primitiveConductor K χ).IsCoprimeTo 𝔞) {s : ℂ} (hs : 1 < s.re) :
    unitaryPartialCompletion K χ 𝔞 s =
      (χ.unitaryWeight.1 𝔞)⁻¹ *
        mellin (fun u ↦ heckeMellinKernel K D χ 𝔞 h𝔞.1 u -
            heckeEpsilon K χ * (mellinConstant K : ℂ))
          ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2) := sorry

/-- The total kernel over a system of class representatives, with the class factors
`χ_u(rep c)⁻¹`: the Mellin inverse of the unitary completion. It does not depend on the
representatives (`heckeMellinTotal_congr`): replacing `𝔞` by `c 𝔞` multiplies the kernel by
`χ_f(c) N(c^p) ∏_w |c_w|^(-P_w) = χ_u((c))` and the class factor by `χ_u((c))⁻¹`. -/
noncomputable def heckeMellinTotal {𝔪 : GNF.Modulus K} (D : Set (mixedEmbedding.realSpace K))
    (χ : Grossencharacter K 𝔪) (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) (u : ℝ) : ℂ :=
  ∑ c : ClassGroup (𝓞 K),
    (χ.unitaryWeight.1 (rep c))⁻¹ *
      heckeMellinKernel K D χ (rep c) (hrep c).1.1 u

/-- Its constant term: `ε(χ) a₀ ∑_c χ_u(rep c)⁻¹`, which vanishes unless `χ_u` is trivial. -/
noncomputable def heckeMellinConstant {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K)) : ℂ :=
  heckeEpsilon K χ * (mellinConstant K : ℂ) *
    ∑ c : ClassGroup (𝓞 K), (χ.unitaryWeight.1 (rep c))⁻¹

/-- The total kernel does not depend on the system of class representatives. -/
theorem heckeMellinTotal_congr {𝔪 : GNF.Modulus K} {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep rep' : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep)
    (hrep' : IsClassRepresentatives K (primitiveConductor K χ) rep') (u : ℝ) :
    heckeMellinTotal K D χ rep hrep u = heckeMellinTotal K D χ rep' hrep' u := sorry

/-- **The unitary completion is a Mellin transform**, with the kernel identified: for a
presentation at its conductor and `Re s > 1`,
`Λ(χ_u, s) = ∫_0^∞ (F_D(χ, u) - a₀(χ)) u^((s + Tr p / n)/2) du/u`, Mathlib's `mellin` at
`(s + Tr p / n)/2`. Every Hecke character has such a presentation (`primitiveConductor_dvd_iff`),
and `unitaryCompletion_congr` carries the identity to every other presentation. In the
finite-order case `exists_mellin_completedHeckeLFunction` abbreviates this statement. -/
theorem unitaryCompletion_eq_mellin {𝔪 : GNF.Modulus K} {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (hχ : primitiveConductor K χ = 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) {s : ℂ} (hs : 1 < s.re) :
    unitaryCompletion K χ s =
      mellin (fun u ↦ heckeMellinTotal K D χ rep hrep u - heckeMellinConstant K χ rep)
        ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2) :=
  sorry

/-- The total kernel is continuous on `(0, ∞)`, for the reason of `continuousOn_mellinKernel`: the
local integrability that Mathlib's pair takes (`grossencharacterFEPair`). -/
theorem continuousOn_heckeMellinTotal {𝔪 : GNF.Modulus K} {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) :
    ContinuousOn (heckeMellinTotal K D χ rep hrep) (Set.Ioi 0) := sorry

/-- Neukirch (8.4), second half: exponential decay to the constant term. -/
theorem heckeMellinTotal_sub_const_isBigO {𝔪 : GNF.Modulus K} {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) :
    ∃ c : ℝ, 0 < c ∧
      (fun u : ℝ ↦ heckeMellinTotal K D χ rep hrep u - heckeMellinConstant K χ rep) =O[atTop]
        fun u : ℝ ↦ Real.exp (-c * u ^ ((1 : ℝ) / Module.finrank ℚ K)) := sorry

/-- **Neukirch (8.4), the transformation law**, from Hecke's lemma and the theta transformation
(7.7) with its Gauss sum (`gaussSum`), for a presentation `χ` at its conductor and the
presentation `ψ` of the inverse Hecke character at the same modulus:
`F_D(χ, 1/u) = W(χ) u^(1/2 + Tr p / n) F_{D⁻¹}(χ⁻¹, u)`.
The constant is the root number: this law is what pins `Grossencharacter.rootNumber`, and
Neukirch's closed form `W(χ) = [i^(Tr p) N((md/|md|)^p)]⁻¹ τ(χ_f) / √N(𝔪)` of (8.5) is its
evaluation. ⚠ The right-hand side is the *inverse* character, which for a unitary character is
the conjugate; the exponent `1/2 + Tr p / n` is the weight of the functional-equation pair,
and `harmonicDegree_inverse` says the two sides shift the Mellin variable by the same amount. -/
theorem heckeMellinTotal_inv {𝔪 : GNF.Modulus K} {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (hχ : primitiveConductor K χ = 𝔪) (ψ : Grossencharacter K 𝔪)
    (hψ : ψ.toHeckeCharacter = χ.toHeckeCharacter⁻¹)
    (rep rep' : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep)
    (hrep' : IsClassRepresentatives K (primitiveConductor K ψ) rep')
    {u : ℝ} (hu : 0 < u) :
    heckeMellinTotal K D χ rep hrep u⁻¹ =
      rootNumber K χ *
        ((u : ℝ) : ℂ) ^ ((1 : ℂ) / 2 + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) *
        heckeMellinTotal K D⁻¹ ψ rep' hrep' u := sorry

/-- **The Grossencharacter instance of the Mellin principle**, for a presentation `χ` at its
conductor and the presentation `ψ` of the inverse Hecke character: `f = F_D(χ, ·)` and
`g = F_{D⁻¹}(ψ, ·)` on `(0, ∞)` (Tau Ceti's carrier takes them `0` on `t ≤ 0`), level `1`, weight
`1/2 + Tr p / n`, `ε = W(χ)`. Each hypothesis of the pair is discharged from a named property of
the kernel: local integrability from `continuousOn_heckeMellinTotal`, the law from
`heckeMellinTotal_inv`, the rapid decay from the exponential decay of
`heckeMellinTotal_sub_const_isBigO`, `ε ≠ 0` from `norm_rootNumber`, and the weight is positive.
Its `Λ` at `(s + Tr p / n)/2` is `unitaryCompletion χ` at `s` (`grossencharacterFEPair_completed`),
which is how the unitary completion is continued and `grossencharacterData_hasFunctionalEquation`
proved; `Grossencharacter.completed` then follows by recentering. -/
noncomputable def grossencharacterFEPair {𝔪 : GNF.Modulus K} {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (hχ : primitiveConductor K χ = 𝔪) (ψ : Grossencharacter K 𝔪)
    (hψ : ψ.toHeckeCharacter = χ.toHeckeCharacter⁻¹)
    (rep rep' : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep)
    (hrep' : IsClassRepresentatives K (primitiveConductor K ψ) rep') :
    TauCeti.FEPairWithLevel ℂ where
  f := (Set.Ioi 0).indicator (heckeMellinTotal K D χ rep hrep)
  g := (Set.Ioi 0).indicator (heckeMellinTotal K D⁻¹ ψ rep' hrep')
  k := 1 / 2 + (harmonicDegree K χ : ℝ) / Module.finrank ℚ K
  ε := rootNumber K χ
  f₀ := heckeMellinConstant K χ rep
  g₀ := heckeMellinConstant K ψ rep'
  N := 1
  hN := one_pos
  hf_int := ((continuousOn_heckeMellinTotal K hD χ rep hrep).congr
    fun _ ht ↦ Set.indicator_of_mem ht _).locallyIntegrableOn measurableSet_Ioi
  hg_int := ((continuousOn_heckeMellinTotal K hD.inv ψ rep' hrep').congr
    fun _ ht ↦ Set.indicator_of_mem ht _).locallyIntegrableOn measurableSet_Ioi
  hf_nonpos t ht := Set.indicator_of_notMem (fun h ↦ (not_lt.mpr ht) h) _
  hg_nonpos t ht := Set.indicator_of_notMem (fun h ↦ (not_lt.mpr ht) h) _
  hk := by positivity
  hε h := by
    have := norm_rootNumber K χ
    rw [h, norm_zero] at this
    exact zero_ne_one this
  h_feq t ht := by
    have ht' : (0 : ℝ) < t := ht
    rw [show (1 : ℝ) / (1 * t) = t⁻¹ by ring,
      Set.indicator_of_mem (show t⁻¹ ∈ Set.Ioi (0 : ℝ) from inv_pos.mpr ht'),
      Set.indicator_of_mem ht,
      heckeMellinTotal_inv K hD χ hχ ψ hψ rep rep' hrep hrep' ht',
      smul_eq_mul, Complex.ofReal_cpow (le_of_lt ht')]
    push_cast
    ring
  hf_top r := by
    obtain ⟨c, hc, h⟩ := heckeMellinTotal_sub_const_isBigO K hD χ rep hrep
    refine (TauCeti.isBigO_rpow_of_isBigO_exp_neg hc
      (div_pos one_pos (Nat.cast_pos.mpr Module.finrank_pos)) h r).congr' ?_ EventuallyEq.rfl
    filter_upwards [eventually_gt_atTop 0] with u hu
    rw [Set.indicator_of_mem (show u ∈ Set.Ioi (0 : ℝ) from hu)]
  hg_top r := by
    obtain ⟨c, hc, h⟩ := heckeMellinTotal_sub_const_isBigO K hD.inv ψ rep' hrep'
    refine (TauCeti.isBigO_rpow_of_isBigO_exp_neg hc
      (div_pos one_pos (Nat.cast_pos.mpr Module.finrank_pos)) h r).congr' ?_ EventuallyEq.rfl
    filter_upwards [eventually_gt_atTop 0] with u hu
    rw [Set.indicator_of_mem (show u ∈ Set.Ioi (0 : ℝ) from hu)]

/-- Mathlib's Mellin representation for `grossencharacterFEPair`, read against
`unitaryCompletion_eq_mellin`. With `Tr p = 0` it is `WeakFEPair.hasMellin`, since
`k = 1/2 < Re s / 2`. With `Tr p > 0` the half-plane `Re s > 1` reaches below `k`, but then
`ε(χ) = ε(χ⁻¹) = 0`, both constants vanish, and it is Mathlib's strong-pair
`IsStrongFEPair.hasMellin`, valid at every `s`. -/
theorem grossencharacterFEPair_completed {𝔪 : GNF.Modulus K} {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (hχ : primitiveConductor K χ = 𝔪) (ψ : Grossencharacter K 𝔪)
    (hψ : ψ.toHeckeCharacter = χ.toHeckeCharacter⁻¹)
    (rep rep' : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep)
    (hrep' : IsClassRepresentatives K (primitiveConductor K ψ) rep') {s : ℂ}
    (hs : 1 < s.re) :
    (grossencharacterFEPair K hD χ hχ ψ hψ rep rep' hrep hrep').Λ
        ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2) =
      unitaryCompletion K χ s := by
  have hmellin : ∀ z : ℂ,
      mellin (fun u ↦ (grossencharacterFEPair K hD χ hχ ψ hψ rep rep' hrep hrep').f u -
          heckeMellinConstant K χ rep) z =
        mellin (fun u ↦ heckeMellinTotal K D χ rep hrep u - heckeMellinConstant K χ rep) z := by
    intro z
    refine MeasureTheory.setIntegral_congr_fun measurableSet_Ioi fun u hu ↦ ?_
    simp only [grossencharacterFEPair, Set.indicator_of_mem hu]
  rw [unitaryCompletion_eq_mellin K hD χ hχ rep hrep hs, ← hmellin]
  by_cases hT : harmonicDegree K χ = 0
  · refine ((grossencharacterFEPair K hD χ hχ ψ hψ rep rep' hrep hrep').toWeakFEPair.hasMellin
      ?_).2.symm
    show 1 / 2 + (harmonicDegree K χ : ℝ) / Module.finrank ℚ K <
      ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2).re
    simp only [hT, Nat.cast_zero, zero_div, add_zero, Complex.div_ofNat_re]
    linarith
  · have hf₀ : heckeMellinConstant K χ rep = 0 := by
      simp [heckeMellinConstant, heckeEpsilon, hT]
    have hg₀ : heckeMellinConstant K ψ rep' = 0 := by
      simp [heckeMellinConstant, heckeEpsilon, harmonicDegree_inverse K χ ψ hψ, hT]
    have hM : HasMellin (grossencharacterFEPair K hD χ hχ ψ hψ rep rep' hrep hrep').f
        ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2)
        ((grossencharacterFEPair K hD χ hχ ψ hψ rep rep' hrep hrep').Λ
          ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2)) :=
      IsStrongFEPair.hasMellin
        (P := (grossencharacterFEPair K hD χ hχ ψ hψ rep rep' hrep hrep').toWeakFEPair)
        ⟨hf₀, hg₀⟩ _
    rw [← hM.2]
    congr 1
    funext u
    simp only [hf₀, sub_zero]

end Grossencharacter

/-- **The Layer 5 Mellin presentation, with its kernel identified.** For a primitive ray-class
character `ψ` and the presentation `χ` of its Hecke character at the conductor
(`Grossencharacter.exists_ofRayClassCharacter`), which has trivial angular frequencies and
`Tr(p)` equal to the number of odd real places, `completedHeckeLFunction ψ` is the Mellin
transform of `heckeMellinTotal` of `χ` at `(s + Tr p / n)/2`. The existential
`exists_mellin_completedHeckeLFunction` follows with `θ(t) = 2 t^(Tr p / n) (F(t²) - a₀)`. -/
theorem completedHeckeLFunction_eq_mellin {D : Set (mixedEmbedding.realSpace K)}
    (hD : IsUnitFundamentalDomain K D) (ψ : PrimitiveRayClassCharacter K)
    (χ : Grossencharacter K ψ.conductor)
    (hχ : χ.toHeckeCharacter = GNF.HeckeCharacter.ofRayClassCharacter _ ψ.character)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (Grossencharacter.primitiveConductor K χ) rep) {s : ℂ}
    (hs : 1 < s.re) :
    completedHeckeLFunction K ψ s =
      mellin (fun u ↦
          Grossencharacter.heckeMellinTotal K D χ rep hrep u -
            Grossencharacter.heckeMellinConstant K χ rep)
        ((s + (Grossencharacter.harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2) := sorry

/-- **The integral norm power `N^m` over `ℚ`**, presented at the narrow modulus `∞`: the idele
class character `‖·‖^(-m)`, whose value at a prime idele at `p` is `p^m`. The presentation exists
by this theorem and is unique by `Grossencharacter.ext`; the theorems below take any presentation
`χ` of `‖·‖^(-m)` at `∞`. ⚠ The real place is needed when `m` is odd: the archimedean restriction
`|x|^(-m)` is even while the algebraic exponent `-m` is odd, so `realParity_eq` fails at the
trivial modulus. -/
theorem exists_ratNormPow (m : ℤ) :
    ∃ χ : Grossencharacter ℚ (GNF.narrowModulus ℚ), ∀ y : IdeleGroup (𝓞 ℚ) ℚ,
      ((χ.toHeckeCharacter (QuotientGroup.mk y) : ℂˣ) : ℂ) =
        (((GNF.ideleNorm y : NNReal) : ℝ) : ℂ) ^ (-m) := sorry

/-- The supplier's shift of `‖·‖^(-m)` is `-m`, by Tau Ceti's
`HeckeCharacter.norm_apply_eq_rpow_shift`. -/
theorem ratNormPow_shift (m : ℤ) (χ : Grossencharacter ℚ (GNF.narrowModulus ℚ))
    (hχ : ∀ y : IdeleGroup (𝓞 ℚ) ℚ, ((χ.toHeckeCharacter (QuotientGroup.mk y) : ℂˣ) : ℂ) =
      (((GNF.ideleNorm y : NNReal) : ℝ) : ℂ) ^ (-m)) :
    χ.toHeckeCharacter.shift = -(m : ℝ) := sorry

/-- **The ideal-side shift of `N^m` is `m`**, the negative of the supplier's. -/
theorem ratNormPow_idealShift (m : ℤ) (χ : Grossencharacter ℚ (GNF.narrowModulus ℚ))
    (hχ : ∀ y : IdeleGroup (𝓞 ℚ) ℚ, ((χ.toHeckeCharacter (QuotientGroup.mk y) : ℂˣ) : ℂ) =
      (((GNF.ideleNorm y : NNReal) : ℝ) : ℂ) ^ (-m)) :
    χ.idealShift = m := by
  rw [Grossencharacter.idealShift, ratNormPow_shift m χ hχ, neg_neg]

/-- The L-function of `N^m` is `ζ(s - m)` on its half-plane: the unitary part is trivial, the
finite part of the modulus is `⊤`, and the series is recentered by the ideal-side shift `m`. -/
theorem lFunctionC_ratNormPow (m : ℤ) (χ : Grossencharacter ℚ (GNF.narrowModulus ℚ))
    (hχ : ∀ y : IdeleGroup (𝓞 ℚ) ℚ, ((χ.toHeckeCharacter (QuotientGroup.mk y) : ℂˣ) : ℂ) =
      (((GNF.ideleNorm y : NNReal) : ℝ) : ℂ) ^ (-m))
    {s : ℂ} (hs : 1 + (m : ℝ) < s.re) :
    Grossencharacter.lFunctionC ℚ χ s = riemannZeta (s - m) := sorry

/-! ## Layer 7: intrinsic nonvanishing -/

/-- The purely imaginary twist `χ * N^(it)` of a unitary weight, as the supplier's norm twist
`χ * N^(-z)` at `z = -it`. -/
noncomputable abbrev imaginaryNormTwist (χ : ADS.UnitaryIdealWeight K) (t : ℝ) :
    ADS.UnitaryIdealWeight K :=
  TauCeti.UnitaryIdealWeight.normTwist (-((t : ℂ) * Complex.I)) (by simp) χ

/-- Hypotheses for one possibly infinite-order unitary character. The square of a twist may be a
pure norm twist or may cancel; requiring cancellation in all cases excludes quadratic examples. -/
structure UnitaryCancelling (χ : ADS.UnitaryIdealWeight K) : Prop where
  not_normTwist : ∀ u : ℝ,
    ¬ TauCeti.MultiplicativeIdealWeight.IsNormTwistOnGood χ.1 u
  cancellation : ADS.HasCancellation χ
  cancellation_conj : ADS.HasCancellation
    (TauCeti.UnitaryIdealWeight.conj χ)
  cancellation_normTwist : ∀ t : ℝ, ADS.HasCancellation
    (imaginaryNormTwist K χ t)
  square_twist : ∀ t : ℝ,
    (∃ u : ℝ,
      TauCeti.MultiplicativeIdealWeight.IsNormTwistOnGood
        (imaginaryNormTwist K χ t * imaginaryNormTwist K χ t).1 u) ∨
      ADS.HasCancellation
        (imaginaryNormTwist K χ t * imaginaryNormTwist K χ t)

/-- A nontrivial primitive finite-order Hecke L-function has no zero on `Re s ≥ 1`: the `3-4-1`
argument, and Landau's argument in the exceptional quadratic case. -/
theorem heckeLFunction_ne_zero_of_one_le_re
    (χ : PrimitiveRayClassCharacter K) (hχ1 : χ.character ≠ 1) {s : ℂ} (hs : 1 ≤ s.re) :
    heckeLFunctionC χ.character s ≠ 0 := sorry

/-- The continued Dedekind zeta function has order `0` at `1 + it` for `t ≠ 0`: no zero and no pole
on the line `Re s = 1` away from `1`. -/
theorem meromorphicOrderAt_dedekindZetaC_one_add {t : ℝ} (ht : t ≠ 0) :
    meromorphicOrderAt (dedekindZetaC K) (1 + t * I) = (0 : WithTop ℤ) := sorry

/-- Outside the pure-norm-twist exception, the single-character premise holds for every
presentation. Cancellation of the unitary weight comes from the supplier's ray-class cancellation
in finite order and from the lattice-point count in the fundamental cone weighted by the
degree-zero archimedean character in infinite order; the conjugate and the imaginary norm twists
follow (over `ℚ` by periodicity of the partial sums), and the square of each twist is a norm twist
or cancels. -/
theorem Grossencharacter.unitaryCancelling
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (hexc : ∀ u : ℝ,
      ¬ TauCeti.MultiplicativeIdealWeight.IsNormTwistOnGood
        χ.unitaryWeight.1 u) :
    UnitaryCancelling K χ.unitaryWeight := sorry

/-- Under the premise `UnitaryCancelling` the presented L-function has order `0` at `1 + σ + it` for
every real `t`, `σ` the ideal-side shift: no zero and no pole on its boundary line. -/
theorem Grossencharacter.meromorphicOrderAt_lFunctionC
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (h : UnitaryCancelling K χ.unitaryWeight) (t : ℝ) :
    meromorphicOrderAt (Grossencharacter.lFunctionC K χ)
      ((1 : ℂ) + (χ.idealShift : ℂ) + t * I) = (0 : WithTop ℤ) := sorry

/-! ### The infinite-order acceptance test, and the analytic exports of this layer

Hecke's angular characters of `ℚ(i)` are the infinite-order test of the infinity-type interface:
an interface that merely typechecks cannot see `k`. The equidistribution of the angles of Gaussian
primes is a prime-distribution theorem and is not proved here; what such an argument consumes is
the analytic data below, which is intrinsic to the L-function.
-/

/-- **Hecke's angular characters of `ℚ(i)` exist**: for each `k` there is a presentation at the
trivial modulus whose algebraic infinity type has exponent `-2k` at an embedding `τ` and whose
ideal-side values are `χ_u((α)) = (τ α / conj (τ α))^(2k)`. The weight on every ideal is fixed
because `ℤ[i]` is principal; the unit relation `compatibility` then fixes the exponent `2k` at
`conj τ` and the shift `0`, and the Hecke character is determined by its values at almost all
prime ideles, so the presentation is unique (`Grossencharacter.ext`). -/
theorem exists_angularGrossencharacter (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {4} ℚ F] (k : ℤ) :
    ∃ χ : Grossencharacter F (GNF.Modulus.one F), ∃ τ : F →+* ℂ, χ.infinityType τ = -(2 * k) ∧
      ∀ α : 𝓞 F, α ≠ 0 →
        χ.unitaryWeight.1 (Ideal.span {α}) = (τ (α : F) / starRingEnd ℂ (τ (α : F))) ^ (2 * k) :=
  sorry

/-- The infinity-type interface test for Hecke's angular characters of `ℚ(i)`,
`𝔞 = (α) ↦ (α / |α|) ^ (4k) = (α / conj α)^(2k)`: of infinite order for `k ≠ 0`, unramified,
and unitary. The theorems below take any presentation `χ` with the two properties of
`exists_angularGrossencharacter`, which by `Grossencharacter.ext` is unique. ⚠ By
`compatibility` the idelic archimedean component is the inverse of the ideal-side value,
`z ↦ (z/|z|)^(-4k)`, so the algebraic infinity type has exponent `-2k` at the embedding through
which the ideal value is read and `2k` at its conjugate. The two exponents **sum** to zero — the
character is unitary, so its shift vanishes — and **differ** by `4k`, the angular frequency. An
interface that stores only a weight, or that adds the conjugate exponents, records `0` for every
`k` and cannot distinguish these characters from the trivial one. -/
theorem angularGrossencharacter_infinityType
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] (k : ℤ)
    (χ : Grossencharacter F (GNF.Modulus.one F)) (τ : F →+* ℂ)
    (hτ : χ.infinityType τ = -(2 * k))
    (hχ : ∀ α : 𝓞 F, α ≠ 0 →
      χ.unitaryWeight.1 (Ideal.span {α}) = (τ (α : F) / starRingEnd ℂ (τ (α : F))) ^ (2 * k))
    (w : {w : InfinitePlace F // w.IsComplex}) :
    ((GNF.AlgebraicInfinityType.toContinuous χ.infinityType).complexExponent w = 0) ∧
      ((GNF.AlgebraicInfinityType.toContinuous χ.infinityType).complexAngularFrequency w = 4 * k ∨
        (GNF.AlgebraicInfinityType.toContinuous χ.infinityType).complexAngularFrequency w =
          -(4 * k)) ∧
      χ.idealShift = 0 := sorry

/-- The angular card: no real gamma factor, one complex factor shifted by `2|k|`, conductor
`|d| N(𝔣) = 4`, degree two, and no pole for `k ≠ 0`. ⚠ The shift is `2|k|`, half the angular
frequency, not `4k` and not `k`. -/
theorem angularGrossencharacterData
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] {k : ℤ} (hk : k ≠ 0)
    (χ : Grossencharacter F (GNF.Modulus.one F)) (τ : F →+* ℂ)
    (hτ : χ.infinityType τ = -(2 * k))
    (hχ : ∀ α : 𝓞 F, α ≠ 0 →
      χ.unitaryWeight.1 (Ideal.span {α}) = (τ (α : F) / starRingEnd ℂ (τ (α : F))) ^ (2 * k)) :
    (grossencharacterData F χ).gammaR = 0 ∧
      (grossencharacterData F χ).gammaC = {(2 * (k.natAbs : ℂ))} ∧
      ((grossencharacterData F χ).conductor : ℕ) = 4 ∧
      (grossencharacterData F χ).degree = 2 ∧
      (grossencharacterData F χ).polarOrder = 0 := sorry

/-- ⚠ `k ≠ 0` is essential: the angular character with `k = 0` is trivial, its L-function is
`ζ_{ℚ(i)}`, and it has a pole at `s = 1`. For `k ≠ 0` the character is not a norm twist, which is
the exception clause of `Grossencharacter.unitaryCancelling`, so the nonvanishing of Layer 7
applies to it unconditionally. -/
theorem angularGrossencharacter_not_isNormTwist
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] {k : ℤ} (hk : k ≠ 0)
    (χ : Grossencharacter F (GNF.Modulus.one F)) (τ : F →+* ℂ)
    (hτ : χ.infinityType τ = -(2 * k))
    (hχ : ∀ α : 𝓞 F, α ≠ 0 →
      χ.unitaryWeight.1 (Ideal.span {α}) = (τ (α : F) / starRingEnd ℂ (τ (α : F))) ^ (2 * k))
    (u : ℝ) :
    ¬ TauCeti.MultiplicativeIdealWeight.IsNormTwistOnGood χ.unitaryWeight.1 u := sorry

/-- **The boundary datum exported to prime-distribution consumers.** For a Grossencharacter whose
unitary weight is not a pure imaginary norm twist on its good ideals, the logarithmic derivative of
the continued L-function of that weight extends continuously to the closed half-plane `Re s ≥ 1`
with no residue: there is no pole to cancel, because the weight is not a norm twist, and no zero on
the line. On `Re s > 1` the continued L-function is the recentered named function,
`continuedLFunctionOfWeight χ_u s = lFunctionC χ (s + idealShift)`, by `lFunctionC_eq` and Tau
Ceti's `continuedLFunctionOfWeight_eq_LSeries`; the zero-freeness is
`Grossencharacter.meromorphicOrderAt_lFunctionC`, with its premise from
`Grossencharacter.unitaryCancelling`. Its exceptional case, `χ_u²` trivial on good ideals at
`s = 1`, is Landau's argument on `ζ_K L(χ_u)`, not the `3-4-1` bound.
⚠ The weight must come from a Grossencharacter: cancellation of an arbitrary unitary weight
continues its series only to `Re s > 1 - 1/[K:ℚ]`, which for `[K:ℚ] ≥ 2` does not contain the
point `s = 1/2` that Landau's argument needs. A Tauberian consumer needs exactly this datum, and no
prime count is proved here. -/
theorem Grossencharacter.exists_continuousOn_logDeriv
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (hexc : ∀ u : ℝ,
      ¬ TauCeti.MultiplicativeIdealWeight.IsNormTwistOnGood
        χ.unitaryWeight.1 u) :
    ∃ G : ℂ → ℂ, ContinuousOn G {s : ℂ | 1 ≤ s.re} ∧
      ∀ s : ℂ, 1 < s.re →
        G s = -deriv (ADS.continuedLFunctionOfWeight χ.unitaryWeight) s /
          ADS.continuedLFunctionOfWeight χ.unitaryWeight s := sorry

/-- On `Re s > 1` the named continuation is Mathlib's `dedekindZeta` near the point, so the two
have the same logarithmic derivative there. -/
theorem dedekindZetaC_eventuallyEq {s : ℂ} (hs : 1 < s.re) :
    dedekindZetaC K =ᶠ[𝓝 s] dedekindZeta K :=
  Filter.eventually_of_mem ((isOpen_lt continuous_const Complex.continuous_re :
      IsOpen {z : ℂ | 1 < z.re}).mem_nhds hs)
    fun _ hz ↦ dedekindZetaC_eq K hz

/-- **The boundary datum named by Arithmetic Dirichlet Series** is Tau Ceti's
`TauCeti.LFunctions.primeIdealVonMangoldtBoundary : PrimeBoundaryRemainder K Set.univ 1`, built
from Mathlib's `dedekindZeta` and Tau Ceti's continuous extension of `-ζ_K'/ζ_K - 1/(s - 1)` to
`Re s ≥ 1`; the supplier's `primeIdealTheorem_of_boundary` applies to it directly. This roadmap
consumes it rather than rebuilding it: its series is the logarithmic derivative of the named
continuation `dedekindZetaC` on `Re s > 1`. -/
theorem primeIdealVonMangoldtBoundary_series_eq (s : {s : ℂ // 1 < s.re}) :
    (TauCeti.LFunctions.primeIdealVonMangoldtBoundary K).series s =
      -deriv (dedekindZetaC K) (s : ℂ) / dedekindZetaC K (s : ℂ) := by
  rw [TauCeti.LFunctions.primeIdealVonMangoldtBoundary_series,
    (dedekindZetaC_eventuallyEq K s.2).deriv_eq, (dedekindZetaC_eventuallyEq K s.2).eq_of_nhds]

/-! ## Layer 8: interoperability and examples -/

/-- **The ray-class comparison card**: the card of the presentation of a primitive ray-class
character at its conductor (`Grossencharacter.exists_ofRayClassCharacter`) agrees with
`heckeData` in every field, the coefficient at `0` aside. -/
theorem grossencharacterData_ofRayClassCharacter (ψ : PrimitiveRayClassCharacter K)
    (χ : Grossencharacter K ψ.conductor)
    (hχ : χ.toHeckeCharacter = GNF.HeckeCharacter.ofRayClassCharacter _ ψ.character) :
    (grossencharacterData K χ).EqOffZero (heckeData K ψ) := sorry

/-- **Mertens' product for a number field** (Rosen; Lebacque, *Generalised Mertens and
Brauer–Siegel theorems*, Theorem 5 (NF)): as `x → ∞`,
`∏_{N𝔭 ≤ x} (1 - N𝔭⁻¹)⁻¹ ~ e^γ κ_K log x`, the product over the nonzero prime ideals of `𝓞_K`
of absolute norm at most `x`, with `γ` Euler's constant and `κ_K` the residue of `ζ_K` at `s = 1`
(Mathlib's `dedekindZeta_residue`, the limit in `tendsto_sub_one_mul_dedekindZetaC`). The factor
is `1` at every prime of norm above `x`, so the finite product is a `finprod`. Over `ℚ` it is
Mertens' third theorem (`κ_ℚ = 1`); over `ℚ(√-5)` the constant is `e^γ π/√5`. -/
theorem tendsto_prod_one_sub_inv_absNorm_div_log :
    Tendsto (fun x : ℝ ↦
      (∏ᶠ 𝔭 : HeightOneSpectrum (𝓞 K),
        if (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ x then (1 - (Ideal.absNorm 𝔭.asIdeal : ℝ)⁻¹)⁻¹
        else 1) /
        (Real.exp Real.eulerMascheroniConstant * dedekindZeta_residue K * Real.log x))
      atTop (𝓝 1) := sorry

end

end TauCetiRoadmap.LFunctions
