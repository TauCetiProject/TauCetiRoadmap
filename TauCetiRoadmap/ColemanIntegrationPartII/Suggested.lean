import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Albanese

/-!
# ColemanIntegrationPartII: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs. The full
rational-length multigraph harmonic/exact decomposition (§1.2) and proper
Albanese existence (§4.0b) are statable, with only the two elementary edge maps
needed for the former.

The following headline theorems are not statable at the pins:

* Metric subdivision (§1.3) needs the subdivision maps between metric graph
  cochain complexes; native graph incidence alone does not supply these maps.
* Analytic double-index transport (§2.3) needs oriented analytic annuli, their
  Laurent/logarithmic function spaces and finite-map pullback. Formal Laurent
  series alone do not carry the analytic functions on a general open annulus.
* The full analytic de Rham comparison, full analytic Coleman extension and
  semistable de Rham comparison (§§3.0b–3.0c) need the overconvergent analytic
  de Rham complex of a wide open, the Coleman function/one-form algebra, the
  component-annulus Cech complex and curve de Rham comparison carriers.
* Wide-open reciprocity and the corrected cup/Frobenius/monodromy comparisons
  (§§3.1a,3.4–3.5) need those cohomology carriers, Coleman end restrictions and
  their constructed comparison operators.
* Geometric abelian logarithms, abelian primitives, Albanese rational-form
  reduction and natural single integration (§§4.0–4.0e, apart from Albanese
  existence) need the analytic point/Lie-space comparison, rational differential
  forms on the native varieties and the natural log-meromorphic primitive theory.
* Harmonic realization, annular interpolation and the global point-sum formula
  (§§4.2–4.4) need that integration theory and the semistable Coleman domains.
* Local triple-index characterization, choice, simple-pole and transport laws
  (§§5.2–5.5) need the differential polynomial-logarithm algebra with compatible
  labelled auxiliary primitives; degree-one Laurent/scalar pairs do not contain
  these primitive data.
* Actual-form relations, global triple-index laws, Frobenius vanishing and the
  Coleman one-form pairing (§§6.0–6.4) need the actual Coleman algebra and its
  one-form module, rather than a free module of symbols.
* Tate differential charts, branch independence, coefficient trace, divisor
  evaluation and independence of models (§§7.0–7.7) need the Tate analytic
  uniformization/differential comparison and the single-integral, closed-point
  divisor and traced-end carriers above. Scalar affine polynomials do not state
  branch transport or holomorphic branch independence on a curve.
-/

namespace TauCetiRoadmap.ColemanIntegrationPartII

universe u

/-! ## Layer 1: Finite graph cochains and harmonic normalization -/

namespace Graph

/-- The edge differential in one chosen orientation of each actual multigraph
edge is the tail value minus the head value (README §1.1). Reverse flags carry
the negative value, including the second flag of a loop. -/
def edgeDifferential {V E k : Type*} [AddCommGroup k]
    (G : _root_.Graph V E) (tail head : G.edgeSet → G.vertexSet)
    (f : G.vertexSet → k) : G.edgeSet → k :=
  fun e ↦ f (tail e) - f (head e)

/-- Weighted divergence adds the current at the tail and subtracts it at the
head, using positive rational edge lengths. A loop contributes both terms,
which cancel (README §1.1). Only actual edges are summed. -/
noncomputable def edgeDivergence {V E k : Type*} [Field k] [CharZero k]
    (G : _root_.Graph V E) [Fintype G.edgeSet]
    (tail head : G.edgeSet → G.vertexSet)
    (length : G.edgeSet → {q : ℚ // 0 < q})
    (c : G.edgeSet → k) (v : G.vertexSet) : k := by
  classical
  exact ∑ e : G.edgeSet,
    ((if tail e = v then c e / (length e).1 else 0) -
      (if head e = v then c e / (length e).1 else 0))

/-- Every cochain on a finite multigraph with positive rational lengths over a
characteristic-zero field has a unique harmonic/exact decomposition. The
incidence hypothesis ties the chosen orientation to the native graph; the
decomposition itself holds for any two endpoint maps, since its rank argument
never consults incidence. Loops, parallel edges and disconnected or empty graphs
are allowed. Uniqueness is of the two cochains, not of an exact potential
(Besser, Theorem 4.4; README §1.2 gives the rational-length extension). -/
theorem harmonic_exact_decomposition {V E k : Type*} [Field k] [CharZero k]
    (G : _root_.Graph V E) [Fintype G.vertexSet] [Fintype G.edgeSet]
    (tail head : G.edgeSet → G.vertexSet)
    (hIncidence : ∀ e : G.edgeSet, G.IsLink e.1 (tail e).1 (head e).1)
    (length : G.edgeSet → {q : ℚ // 0 < q}) (c : G.edgeSet → k) :
    ∃! hr : (G.edgeSet → k) × (G.edgeSet → k),
      (∀ v, edgeDivergence G tail head length hr.1 v = 0) ∧
      (∃ f : G.vertexSet → k, hr.2 = edgeDifferential G tail head f) ∧
      c = hr.1 + hr.2 := sorry

end Graph

/-! ## Layer 4: Harmonic realization of arbitrary-reduction single integration -/

open CategoryTheory MonoidalCategory
open AlgebraicGeometry

namespace NaturalIntegration

/-- Every pointed smooth geometrically connected separated finite-type variety
over a characteristic-zero field has a proper Albanese variety. The source
need not be proper (Serre, Exposé 10, §4, Theorems 5–6; README §4.0b). -/
theorem properAlbanese_exists {k : Type u} [Field k] [CharZero k]
    (X : Over (Spec (.of k)))
    [Smooth X.hom] [LocallyOfFiniteType X.hom] [QuasiCompact X.hom]
    [IsSeparated X.hom] [GeometricallyConnected X.hom]
    (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
    ∃ (A : TauCeti.AlgebraicGeometry.AbelianVariety k)
      (a : X ⟶ A.toOver),
      TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese x₀ a := sorry

end NaturalIntegration

end TauCetiRoadmap.ColemanIntegrationPartII
