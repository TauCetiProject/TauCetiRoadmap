module

public import Mathlib
public import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic
public import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
public import TauCeti.AlgebraicGeometry.Modules.TensorProduct
public import TauCeti.AlgebraicGeometry.Cohomology.Module.Base

/-!
# Automorphic bundles and classical automorphic forms, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It records whether the
roadmap's headline theorems can be stated against the pinned Mathlib and Tau Ceti
APIs. Finite-coefficient coherent Serre duality in Layer 1 is stated below using
the native sheaf exterior power, relative differentials, internal Hom and
base-linear cohomology. Its trace naturality and equivariant refinements need
the coherent duality trace. The following other headlines are not statable at
the pins:
* Equivariant finite perfect coherent models and derived deck descent (Layer 2): lacks a scheme finite-étale torsor with descended coherent coefficient, equivariant derived global sections and their finite perfect realization.
* Derived coherent correspondence composition, base change and transpose (Layer 3): lacks coherent upper shriek, its trace and the enhanced coefficient correspondence carrier.
* Solid completion and the equivariant compact-support filtration spectral sequence (Layer 3): lacks solid sheaves on schemes, completed locales and their six operations.
* Normalized higher coherent Hecke action and GAGA/tower comparison (Layers 3–4): lacks Shimura towers, canonical/subcanonical automorphic coefficients, analytic coherent cohomology and geometric Hecke spans.
* Lan relative subcanonical vanishing on the specified models (Layer 5): lacks toroidal-to-minimal PEL contractions and their formally canonical coefficient sheaves.
* General PEL Lan-Suh small-weight vanishing, its three integral GSp4 ranges and singular mod-p consequences (Layer 5): lacks the integral Siegel model, Hodge bundle, boundary ideal and automorphic symmetric-power coefficients.
* Integral hyperspecial Hecke convolution relations and coherent local factors (Layer 5): lacks Hilbert–Siegel EO geometry and its coherent Cousin/Hecke complexes.
* Su canonical coherent/automorphic comparison (Layer 6): lacks a Shimura compactification with its automorphic coefficient, growth resolution, and the relative parabolic/K_h cohomology of automorphic forms.
* Harris cusp/interior comparison and multiplicity-counted coherent contribution (Layer 6): lacks the canonical/subcanonical coefficient map, the cuspidal and L2 spectral occurrence maps, and the fixed Hermitian pair.
* Tempered-image chamber restriction and large singular interior decomposition (Layer 7): lacks archimedean discrete-series/limit representations, their coherent occurrence maps and the geometric interior image.
* All-degree rational non-Eisenstein boundary vanishing (Layer 8): lacks the toroidal Siegel boundary, its Hecke-linearized coefficients and residual ideal.
* Totally real degree-zero boundary vanishing and the degree-zero/one interior comparison (Layer 8): lacks Hilbert–Siegel compactified models and normalized boundary coefficient/Satake maps.
* Localized cuspidal injections, large-gap equality and conditional all-weight rational exhaustion (Layer 8): lacks automorphic spectral multiplicity spaces, coherent coefficients, congruence localization and the precise packet comparison.
* Conditional dimension equality h1 = l0 * h0 (and rational h1 = h0 for a >= 2) (Layer 8): lacks the same geometric cohomology spaces and packet occurrence/multiplicity data.

The pinned scheme-module cohomology has base-ring module structures, linear
coefficient and connecting maps, and a natural linear H0/global-sections
identification. It does not supply the comparison with scalar-linear derived
global sections or the automorphic carriers above. A generic image
of an additive map, an integer chamber predicate, a scalar normalization identity,
or the K-projective lifting theorem does not state any of the headlines above.
This file introduces only the quotient coefficient ring and the extension of
sheaf cohomology by zero to negative integer degrees needed by the duality
headline; it introduces no substitute predicates or admitted data.
-/

open CategoryTheory AlgebraicGeometry

namespace TauCetiRoadmap.AutomorphicBundlesPartII

@[expose] public section

/-! ## Layer 1: integral coefficients and coherent duality -/

/-- The quotient O/(ϖ^n). The duality theorem below is stated for a DVR O, an
irreducible ϖ and every n; at n = 0 the quotient is the zero ring. -/
abbrev dvrCoefficientRing (O : Type u) [CommRing O] (ϖ : O) (n : ℕ) :=
  O ⧸ Ideal.span ({ϖ ^ n} : Set O)

/-- Base-linear scheme-module cohomology, extended by the zero module to
negative integer degrees. No finiteness or properness is needed for this definition. -/
noncomputable def integerCoherentCohomology (R : Type u) [CommRing R]
    (X : Scheme.{u}) [X.Over (Spec (.of R))] (F : X.Modules) (i : ℤ) : ModuleCat.{u} R :=
  if 0 ≤ i then ModuleCat.of R (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology F i.toNat)
  else ModuleCat.of R (ULift.{u} PUnit)

/-- For a DVR O, an irreducible ϖ and a smooth proper scheme of pure relative
dimension d over O/(ϖ^n),
the coefficient-ring dual of H^i(Hom(F, det Ω)) is H^(d-i)(F), for a finite
locally free coefficient F and every integer i. The quotient is Artinian
Gorenstein; its chosen uniformizer identifies this dual with O-linear Matlis
duality. Completeness of O is not needed (O/(ϖ^n) is unchanged by completion),
and at n = 0 both sides vanish over the zero ring. This is the finite-coefficient duality of README §1.6
(CG18 §7.2, pp. 395–396, 399–400), not a trace isomorphism RΓ(ω)[d] ≃ A. -/
theorem finiteCoefficientSerreDuality
    (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (ϖ : O) (hϖ : Irreducible ϖ) (n : ℕ)
    (X : Scheme.{u}) [X.Over (Spec (.of (dvrCoefficientRing O ϖ n)))]
    (d : ℕ) [SmoothOfRelativeDimension d (X ↘ Spec (.of (dvrCoefficientRing O ϖ n)))]
    [IsProper (X ↘ Spec (.of (dvrCoefficientRing O ϖ n)))]
    (F : X.Modules) [F.IsLocallyFree] [F.IsFinitePresentation] (i : ℤ) :
    Nonempty
      (Module.Dual (dvrCoefficientRing O ϖ n)
        (integerCoherentCohomology (dvrCoefficientRing O ϖ n) X
          ((ihom F).obj ((SheafOfModules.exteriorPower X.sheaf d).obj
            (X.relativeDifferentials (dvrCoefficientRing O ϖ n)))) i) ≃ₗ[dvrCoefficientRing O ϖ n]
        integerCoherentCohomology (dvrCoefficientRing O ϖ n) X F ((d : ℤ) - i)) := by
  sorry

end

end TauCetiRoadmap.AutomorphicBundlesPartII
