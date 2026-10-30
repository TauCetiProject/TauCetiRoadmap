import Mathlib

/-!
# Coleman power series: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline milestones; discharging
them finishes neither a layer nor the roadmap.

The statements are corrected-norm convergence with uniform integral precision over
finite unramified coefficient rings (Layer 1), and the all-prime logarithmic-derivative
image theorem and Frobenius boundary range (Layer 3). The scalar algebra, corrected
norm and logarithmic derivative have real bodies on Mathlib's power series and units.
Norm and trace are the native `Algebra.norm` and `Algebra.trace` for that scalar algebra.
The Layer 3 statements use `τ(g) = p*g` and `τ(g) = 0`: the comparison `τ = p*ψ`
in §§1.45–1.49 identifies these with the averaging fixed space and kernel, since
multiplication by `p` is injective. No averaging operator is assumed as an input.

The arithmetic interpolation and Frobenius/semilocal comparisons (Layers 0–1),
Bernoulli reciprocity (Layer 2), principal Coleman sequence (Layer 3), and real
cyclotomic-unit image and quotient (Layer 4) are deferred as Lean signatures.
The pins lack the chosen compatible cyclotomic integer-ring tower and its norm limit,
the arithmetic Coleman map, the normalized Bernoulli pseudomeasure and the global
circular-unit closures supplied by IntegralIwasawaTheory and PMIA. The independent
bounded averaging and convergent root-translation operators needed by the trace
and root-product comparisons are also absent. Native fields,
integer rings, measures and completed group algebras alone do not supply those
constructions; their stated arithmetic maps and quotient cannot be replaced by
arbitrary subgroups or linear maps.
-/

noncomputable section
open scoped PowerSeries.WithPiTopology Topology

namespace TauCetiRoadmap.ColemanPowerSeries.UnramifiedSeries

/-- The receiving power-series ring is an algebra over the base through substitution
by `(1 + X)^p - 1`, with coefficients fixed (§1.77). -/
@[instance_reducible]
def scalarAlgebra (O : Type*) [CommRing O] (p : ℕ) :
    Algebra (PowerSeries O) (PowerSeries O) :=
  (PowerSeries.substAlgHom
    (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp :
      PowerSeries.constantCoeff ((1 + PowerSeries.X : PowerSeries O) ^ p - 1) = 0))).toRingHom.toAlgebra

local notation "N[" O "," p "]" =>
  @Algebra.norm (PowerSeries O) (PowerSeries O) _ _ (scalarAlgebra O p)

/-- Undo coefficient Frobenius after the native determinant norm (§1.94). -/
def correctedNorm (p : ℕ) [Fact p.Prime] (O : Type*) [CommRing O]
    [Algebra ℤ_[p] O] (σ : O ≃ₐ[ℤ_[p]] O) : (PowerSeries O)ˣ →* (PowerSeries O)ˣ :=
  (Units.map (PowerSeries.map σ.symm.toAlgHom.toRingHom).toMonoidHom).comp
    (Units.map (N[O,p]))

section Coefficients
variable (p : ℕ) [Fact p.Prime] (O : Type*)
    [CommRing O] [IsDomain O] [Algebra ℤ_[p] O]
    [hFree : Module.Free ℤ_[p] O] [hFinite : Module.Finite ℤ_[p] O]
    [hComplete : IsAdicComplete (Ideal.span {(p : O)}) O]
    [hDVR : IsDiscreteValuationRing O]
    [UniformSpace O] [hUniform : IsUniformAddGroup O] [hRing : IsTopologicalRing O]
    [hLinear : IsLinearTopology O O] [hTopComplete : CompleteSpace O]
    [hT2 : T2Space O] [hCompact : CompactSpace O]
    (hO : IsLocalRing.maximalIdeal O = Ideal.span {(p : O)})
    (hAdic : IsAdic (Ideal.span {(p : O)}))
    (σ : O ≃ₐ[ℤ_[p]] O)
    (hσ : ∀ c : O, IsLocalRing.residue O (σ c) = IsLocalRing.residue O c ^ p)
    (hσc : Continuous σ) (hσic : Continuous σ.symm)
include hFree hFinite hComplete hDVR hUniform hRing hLinear hTopComplete hT2 hCompact
  hO hAdic hσ hσc hσic

/-- The corrected Coleman norm has a continuous multiplicative retraction, with uniform
precision at every iterate (§§1.95, 1.116, 1.122–1.123). -/
theorem correctedNorm_limit :
    ∃ L : (PowerSeries O)ˣ →* (PowerSeries O)ˣ,
      Continuous L ∧
      (∀ f, correctedNorm p O σ (L f) = L f) ∧
      (∀ f, correctedNorm p O σ f = f → L f = f) ∧
      (∀ f, Filter.Tendsto (fun n : ℕ => ((correctedNorm p O σ)^[n]) f)
        Filter.atTop (nhds (L f))) ∧
      (∀ f (n : ℕ), (L f : PowerSeries O) -
        (((correctedNorm p O σ)^[n]) f : PowerSeries O) ∈
          Ideal.span {(p : PowerSeries O)} ^ (n + 1)) := by
  sorry

end Coefficients

end TauCetiRoadmap.ColemanPowerSeries.UnramifiedSeries

namespace TauCetiRoadmap.ColemanPowerSeries.Series

local notation "N[" O "," p "]" =>
  @Algebra.norm (PowerSeries O) (PowerSeries O) _ _ (UnramifiedSeries.scalarAlgebra O p)
local notation "τ[" O "," p "]" =>
  @Algebra.trace (PowerSeries O) (PowerSeries O) _ _ (UnramifiedSeries.scalarAlgebra O p)
local notation "Φ[" O "," p "]" =>
  @algebraMap (PowerSeries O) (PowerSeries O) _ _ (UnramifiedSeries.scalarAlgebra O p)

/-- The weighted logarithmic derivative on native power-series units (§2.1). -/
def logDeriv {R : Type*} [CommRing R] (f : (PowerSeries R)ˣ) : PowerSeries R :=
  (1 + PowerSeries.X) * PowerSeries.derivative (f : PowerSeries R) *
    ((f⁻¹ : (PowerSeries R)ˣ) : PowerSeries R)

/-- Every integral series fixed by bounded averaging is the logarithmic derivative
of a norm-fixed unit, for every prime including two (§3.35). -/
theorem normFixedLogDeriv_surjective (p : ℕ) [Fact p.Prime]
    (g : PowerSeries ℤ_[p]) (hg : τ[ℤ_[p],p] g = (p : PowerSeries ℤ_[p]) * g) :
    ∃ f : (PowerSeries ℤ_[p])ˣ,
      N[ℤ_[p],p] (f : PowerSeries ℤ_[p]) = (f : PowerSeries ℤ_[p]) ∧ logDeriv f = g := by
  sorry

/-- The range of the Frobenius boundary on averaging-fixed series is exactly the
zero-constant-coefficient part of the averaging kernel, for every prime (§3.12). -/
theorem psiFixedBoundary_range (p : ℕ) [Fact p.Prime]
    (g : PowerSeries ℤ_[p]) (hg : τ[ℤ_[p],p] g = 0) :
    (∃ f : PowerSeries ℤ_[p],
      τ[ℤ_[p],p] f = (p : PowerSeries ℤ_[p]) * f ∧ f - Φ[ℤ_[p],p] f = g) ↔
      PowerSeries.constantCoeff g = 0 := by
  sorry

end TauCetiRoadmap.ColemanPowerSeries.Series

end
