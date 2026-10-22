import Mathlib

/-!
# Integral A_inf cohomology: headline theorem signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification; discharging these statements finishes neither a layer nor the roadmap.

The statements on the pinned carriers are the cyclotomic Fontaine kernel, the infinite-Witt
kernel intersection and finite-Witt coherence (AI.0), flatness of the map to Mathlib's `BDeRhamPlus` (AI.0:period-comparison),
and p-local projective freeness and the integral freeness criterion from the module structure
theorem (AI.2.1). The definitions below give the valuation ring, the polynomial cyclotomic
kernel generators and their finite Frobenius products, and the canonical localization/completion
map used in these statements.

The other headline results require objects absent from the pins:
* AI.0:integral: Fontaine's dlog and the completed cotangent description require the intrinsic
  Breuil–Kisin line, its Tate-module realization, and the completed cotangent complex.
* AI.1: the cohomology, monoidal, Bockstein and completion theorems require derived décalage
  along invertible ideal sheaves on a ringed topos. A divisibility submodule alone does not
  supply this functor or its comparison maps.
* AI.2: Fargues' classification requires BKF modules, their lattice pairs and the realization
  functor; the analytic annulus classification also requires its Frobenius vector bundles.
* AI.3–AI.5: the q-de Rham computation, local specializations, proper perfectness, cohomological
  BKF structure and étale/crystalline torsion bounds require smooth p-adic formal schemes,
  integral pro-étale period sheaves and AΩ. The crystalline and continuous de Rham–Witt
  cohomology objects are also absent.
* AI.6: the semistable comparisons, canonical B_dR⁺ deformation, torsion inequalities and
  model-independent de Rham lattice additionally require logarithmic formal schemes, log
  crystalline cohomology and the canonical infinitesimal cohomology of the rigid generic fibre.
* AI.7: Breuil–Kisin descent, its Frobenius and its A_inf, de Rham and crystalline comparisons
  require cyclotomic spectra, relative THH, TC⁻ and TP, and the Breuil–Kisin cohomology complex.

These results have no substitute statements here. Their constructions and full mathematical
specifications are the corresponding README targets.
-/

noncomputable section

namespace TauCetiRoadmap.AInfCohomology

open scoped BigOperators

/-- The valuation ring `O_C` of `C`. -/
abbrev integers (C : Type*) [NontriviallyNormedField C] [IsUltrametricDist C] : Subring C :=
  (NormedField.valuation (K := C)).integer

section Cyclotomic

variable (p : ℕ) [Fact p.Prime]
variable {S : Type*} [CommRing S] [CharP S p] [PerfectRing S p]

/-- The cyclotomic element μ = [ε] − 1. -/
def mu (ε : S) : WittVector p S :=
  WittVector.teichmuller p ε - 1

/-- The element `ξ = Σ_{j<p} [ε^{1/p}]^j`; it is defined without division in the Witt ring. -/
def xi (ε : S) : WittVector p S :=
  ∑ j ∈ Finset.range p, (WittVector.teichmuller p ((_root_.frobeniusEquiv S p).symm ε)) ^ j

/-- The finite Fontaine kernel generator ξ_r = ∏_{j<r} φ^{−j}(ξ). -/
def xiLevel (ε : S) (r : ℕ) : WittVector p S :=
  ∏ j ∈ Finset.range r, ((WittVector.frobeniusEquiv p S).symm^[j]) (xi p ε)

end Cyclotomic

section Coefficients

variable (p : ℕ) [Fact p.Prime]
variable (C : Type*) [NontriviallyNormedField C] [IsUltrametricDist C]
  [hcomplete : CompleteSpace C] [halgclosed : IsAlgClosed C] [hcharzero : CharZero C]
variable [hpnonunit : Fact (¬IsUnit (p : integers C))]
  [hadic : IsAdicComplete (Ideal.span {(p : integers C)}) (integers C)]

include hcomplete halgclosed hcharzero hpnonunit hadic

/-- AI.0.1: the cyclotomic polynomial ξ generates the Fontaine kernel
(BMS1, Example 3.16 and Proposition 3.17, p.25). -/
theorem ker_fontaineTheta_eq_span_xi (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p) :
    RingHom.ker (WittVector.fontaineTheta (integers C) p) = Ideal.span {xi p ε} := by
  sorry

/-- AI.0.2: the infinite-Witt specialization kernel is the intersection of the finite
Fontaine kernels, equal to (μ) (BMS1, Lemma 3.23, p.27). -/
theorem iInf_span_xiLevel_eq_span_mu (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p) :
    (⨅ (r : ℕ) (_ : 1 ≤ r), Ideal.span {xiLevel p ε r}) = Ideal.span {mu p ε} := by
  sorry

/-- Finite-Witt coherence (AI.0.3, `AInf.witt_coherence`): relation modules of maps between
finite free modules are finitely generated, over both `W_r(O_C)` and `W_r(O_C^♭)`
(BMS1, Proposition 3.24). -/
theorem finite_witt_coherence (r : ℕ) (hr : 1 ≤ r) :
    (∀ (m n : ℕ) (f : (Fin m → TruncatedWittVector p r (integers C)) →ₗ[
        TruncatedWittVector p r (integers C)] (Fin n → TruncatedWittVector p r (integers C))),
      (LinearMap.ker f).FG) ∧
    (∀ (m n : ℕ) (f : (Fin m → TruncatedWittVector p r (PreTilt (integers C) p)) →ₗ[
        TruncatedWittVector p r (PreTilt (integers C) p)]
        (Fin n → TruncatedWittVector p r (PreTilt (integers C) p))),
      (LinearMap.ker f).FG) := by sorry

/-- The canonical map A_inf → B_dR⁺: localize at p, then complete at the Fontaine kernel. -/
def deRhamMap : WittVector p (PreTilt (integers C) p) →+* BDeRhamPlus (integers C) p :=
  algebraMap (WittVector p (PreTilt (integers C) p))
    (AdicCompletion (RingHom.ker (fontaineThetaInvertP (integers C) p))
      (Localization.Away (p : WittVector p (PreTilt (integers C) p))))

/-- AI.0:period-comparison.1: the canonical A_inf → B_dR⁺ map is flat
(ČK, §6.1, p.60; BMS1, §13.1, p.105). -/
theorem ainf_deRhamPlus_flat : (deRhamMap p C).Flat := by
  sorry

/-- The p-local freeness conclusion of AI.2.1, `AInf.punctured_vector_bundle_criterion`:
every finite projective `A_inf[1/p]`-module is free (BMS1, Corollary 4.12). -/
theorem ainf_invert_p_projective_free (M : Type*) [AddCommGroup M]
    [Module (Localization.Away (p : WittVector p (PreTilt (integers C) p))) M]
    [Module.Finite (Localization.Away (p : WittVector p (PreTilt (integers C) p))) M]
    [Module.Projective (Localization.Away (p : WittVector p (PreTilt (integers C) p))) M] :
    Module.Free (Localization.Away (p : WittVector p (PreTilt (integers C) p))) M := by sorry

/-- The mixed-characteristic freeness criterion in AI.2.1, `AInf.ainf_module_structure`:
a finitely presented module with projective p-inversion is free when its `θ` reduction
is p-torsion-free. Reduction is expressed as `M/ξM` (BMS1, Proposition 4.13). -/
theorem ainf_free_of_torsionFree_reduction (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p)
    (M : Type*) [AddCommGroup M] [Module (WittVector p (PreTilt (integers C) p)) M]
    [Module.FinitePresentation (WittVector p (PreTilt (integers C) p)) M]
    (hproj : Module.Projective (Localization.Away (p : WittVector p (PreTilt (integers C) p)))
      (LocalizedModule (Submonoid.powers (p : WittVector p (PreTilt (integers C) p))) M))
    (hred : Function.Injective (fun x : M ⧸
        LinearMap.range (LinearMap.lsmul (WittVector p (PreTilt (integers C) p)) M (xi p ε)) =>
      (p : WittVector p (PreTilt (integers C) p)) • x)) :
    Module.Free (WittVector p (PreTilt (integers C) p)) M := by sorry

end Coefficients

end TauCetiRoadmap.AInfCohomology
