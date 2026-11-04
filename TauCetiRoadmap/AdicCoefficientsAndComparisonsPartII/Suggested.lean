module

import Mathlib

/-!
# Adic coefficients and the comparison of schemes with v-sheaves, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
roadmap’s headline theorems against the pinned Mathlib and
Tau Ceti APIs. PA.5.2b(ii), analytic uniformization and perturbation stability,
is stated below on native complete ultrametric normed fields. The residue
coordinate clause is stated separately. The following remaining headline
statements are not statable at these pins using only a few simple definitions
on native carriers.

- PA.0.6 — Finite-type flattening by admissible blow-ups: not statable. The admissible blow-up and strict-transform carrier for qcqs schemes is not supplied at the pins.

- PA.0.7 — Non-separated Chow lemma: not statable. Projective morphisms, modifications and pseudo-projective factorizations lack pinned geometric carriers.

- PA.0.10–PA.0.12 — Universal resolvability of quasi-excellent schemes of dimension at most two (projective sense) and of separated quasi-excellent threefolds (proper sense): not statable. Quasi-excellence, projective morphisms and SNC boundaries lack pinned carriers.

- PA.1.4 — Compactness and valuative description of pointed Riemann–Zariski spaces: not statable. The pointed locally ringed limit and its valuative-point comparison are heavy constructions absent at the pins.

- PA.1.6 — Openness of pointed Riemann–Zariski restriction: not statable. The relative pointed Riemann–Zariski and valuative-centre carriers are absent; the absolute valuation spectrum is insufficient for this statement.

- PA.2.5 — Tame distillation for finite field extensions: not statable. Arbitrary-rank henselized tameness, wild loci and prime-supported closed extensions lack pinned carriers.

- PA.2.6 — Separable tame distillation for finite separable extensions: not statable. The same valued-field tameness and maximal separable prime-supported extension carriers are absent.

- PA.3.6 — Tame distillation of alterations: not statable. Tameness of valued-field extensions after henselization, which defines the wild primes set, and universally Japanese schemes are absent.

- PA.3.7 — Separable tame distillation of alterations: not statable. Separable scheme alterations and the arbitrary-rank tame-covering carrier are absent.

- PA.4.2 — Normalized monoidal blow-up comparison: not statable. Fine/fs log schemes, coherent log ideals and log blow-ups are absent.

- PA.4.3 — Functorial saturated monoidal desingularization: not statable. Log schemes, fans and functorial towers of saturated log blow-ups are absent.

- PA.4.4 — Gabber modification for inertia specializing actions: not statable. Log regular schemes, very tame actions and the normalized modification construction are absent.

- PA.4.5 — Gabber preparation for equivariant log smooth maps: not statable. The log-scheme, characteristic-monoid chart and log smoothness interfaces are absent.

- PA.4.6 — Relative Gabber modification without separatedness: not statable. Log smooth pairs, very tame quotient and projective modification carriers are absent.

- PA.5.2 — Projectivity of stable modifications: not statable. Non-proper multipointed semistable curves, their dualizing sheaf and relative-ampleness comparison are absent.

- PA.5.2b(i), (iii) — General uniformization of one-dimensional valued and analytic fields: not statable. Arbitrary-rank unramifiedness, tame extensions, special cosets, analytic types and the normal projective curve model are absent. These missing carriers do not obstruct the algebraically closed analytic theorem PA.5.2b(ii).

- PA.5.3–PA.5.4 — Existence, uniqueness and equivariance of stable modification: not statable. The multipointed curve, stable modification and generically étale alteration carriers are absent.

- PA.5.6 — Resolution of relative curves by prime-supported alterations: not statable. Universal resolvability, scheme alterations, strict transforms and log smooth pairs are absent.

- PA.6.1–PA.6.2 — Prime-supported desingularization of morphisms and inheritance: not statable. Projective morphisms, quasi-excellence, SNC supports, universal resolvability and log smooth pairs are absent.

- PA.6.3 — Separable desingularization over a perfect field: not statable. Separable scheme alterations, SNC supports and the log smooth resolution diagram are absent.

- PA.6.4 — Desingularization by residue-characteristic alterations: not statable. Quasi-excellence, projective morphisms and SNC boundaries are absent.

- PA.6.5–PA.6.6 — Residue-characteristic desingularization of morphisms and source refinement: not statable. The prime-supported alteration diagram, SNC boundaries and log smoothness carriers are absent; scheme-theoretic images exist (`AlgebraicGeometry.Scheme.Hom.image`, `AlgebraicGeometry.Scheme.Hom.imageι`, `AlgebraicGeometry.Scheme.Hom.toImage`).

- PA.6.7 — Gabber prime-to-ell alteration theorem over a field: not statable. Projective and quasi-projective morphisms and relative strict normal crossings divisors are absent; residue degrees exist (`AlgebraicGeometry.Scheme.Hom.residueDegree`).

- PA.6.8 — Gabber prime-to-ell alteration theorem over a one-dimensional base: not statable. The alteration and projectivity predicates, SNC divisor and log monomial local model interfaces are absent.

- PA.6.9 — Prime-to-ell smooth variety alteration with boundary: not statable. Quasi-projectivity and strict normal crossings divisors are absent; properness, smoothness and the function-field degree exist (`AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Scheme.functionField`, `Module.finrank`).

- PA.6.10 — Odd-degree regular alteration of a henselian DVR model: not statable. Excellence of the discrete valuation ring and projective morphisms are absent; regular local rings exist (`IsRegularLocalRing`).

- PA.6.11 — de Jong equivariant Galois alteration with projective compactification: not statable. Geometric finite-group alterations, projective compactification and G-strict SNC boundaries lack pinned interfaces.

- PA.6.11a — Rumely's theorem on integral points after a finite extension: not statable. Excellent rings are absent.

- PA.6.11b — Sections and linear projections over a global Dedekind base: not statable. Projective space over a base scheme, its linear subspaces and linear projections, and projective morphisms are absent.

- PA.6.12 — de Jong arithmetic semistable alteration over a global Dedekind base: not statable. Scheme alterations, projective compactifications, strict semistable pairs and their completed local models lack pinned interfaces.

The native scheme, field, valuation-subring and valuation-spectrum objects
do not replace the missing geometric constructions. In particular, an
absolute valuation-spectrum theorem would not state the relative pointed
restriction theorem, and a prime-degree field identity would not state a
scheme alteration theorem. No substitute geometric carrier or admitted data is used. In PA.5.2b(ii),
the constant field is a subfield of K with its induced norm, so its inclusion
is isometric. Its completeness and nontrivial norm are explicit hypotheses.
The integer-ring inclusion is literal inclusion of an inverse image; finite
unramifiedness is finite field degree together with étaleness of that ring map
(temkin10, Lemma 2.1.6).
-/

namespace TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII

/-! ## Layer PA.5: Stable modification and resolution of relative curves -/

/-- The closure inside K of the rational field generated by k and x. -/
noncomputable def completedRationalSubfield {K : Type*} [NormedField K]
    (k : Subfield K) (x : K) : Subfield K :=
  (IntermediateField.adjoin k {x}).toSubfield.topologicalClosure

/-- The inclusion of the inverse-image valuation ring of H into the valuation ring of K. -/
def analyticIntegerInclusion {K : Type*} [NormedField K] [IsUltrametricDist K]
    (H : Subfield K) :
    ((NormedField.valuation (K := K)).valuationSubring.comap H.subtype) →+*
      (NormedField.valuation (K := K)).valuationSubring where
  toFun a := ⟨((a : H) : K), a.property⟩
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl

/-- K is finite unramified over the completed rational subfield generated by x. -/
def finiteUnramifiedOverCompleted {K : Type*} [NormedField K] [IsUltrametricDist K]
    (k : Subfield K) (x : K) : Prop :=
  let H := completedRationalSubfield k x
  letI := (analyticIntegerInclusion H).toAlgebra
  Module.Finite H K ∧
    Algebra.Etale ((NormedField.valuation (K := K)).valuationSubring.comap H.subtype)
      (NormedField.valuation (K := K)).valuationSubring

/-- The image of the residue field of k inside the residue field of K. -/
noncomputable def residueConstants {K : Type*} [NormedField K] [IsUltrametricDist K]
    (k : Subfield K) : Subfield
      (IsLocalRing.ResidueField (NormedField.valuation (K := K)).valuationSubring) :=
  Subfield.closure ((IsLocalRing.residue (NormedField.valuation (K := K)).valuationSubring) ''
    {a : (NormedField.valuation (K := K)).valuationSubring | (a : K) ∈ k})

/-- Analytic uniformization over an algebraically closed analytic constant field,
including stability of finite unramifiedness under small perturbations
(temkin10, Theorem 2.1.10(i)–(ii)). -/
theorem analytic_uniformization {K : Type*} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] (k : Subfield K)
    [IsAlgClosed k] [CompleteSpace k] (hk : ∃ a : k, 1 < ‖a‖)
    (hfinite : ∃ y : K, Module.Finite (completedRationalSubfield k y) K) :
    ∃ x : K, finiteUnramifiedOverCompleted k x ∧
      ∃ ε : ℝ, 0 < ε ∧ ∀ x' : K, ‖x - x'‖ < ε → finiteUnramifiedOverCompleted k x' := by
  sorry

/-- A separating transcendental residue coordinate is an unramified analytic generator
(temkin10, Theorem 2.1.10(iii)). -/
theorem analytic_uniformization_residue {K : Type*} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] (k : Subfield K)
    [IsAlgClosed k] [CompleteSpace k] (hk : ∃ a : k, 1 < ‖a‖)
    (hfinite : ∃ y : K, Module.Finite (completedRationalSubfield k y) K)
    (x : (NormedField.valuation (K := K)).valuationSubring)
    (htrans : Transcendental (residueConstants k)
      (IsLocalRing.residue (NormedField.valuation (K := K)).valuationSubring x))
    (hsep : Algebra.IsSeparable
      (IntermediateField.adjoin (residueConstants k)
        {IsLocalRing.residue (NormedField.valuation (K := K)).valuationSubring x})
      (IsLocalRing.ResidueField (NormedField.valuation (K := K)).valuationSubring)) :
    finiteUnramifiedOverCompleted k (x : K) := by
  sorry

end TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII
