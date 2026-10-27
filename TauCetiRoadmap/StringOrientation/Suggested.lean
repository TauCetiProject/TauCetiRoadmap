import Mathlib

/-!
# String structures, connections and the Witten genus: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the
pinned Mathlib, what of the roadmap is statable there: the S1 classifier
nullhomotopy data, on Mathlib's `ContinuousMap.Homotopy`.

Not statable at the pins:
* Stolz's positive-dimensional Witten-genus vanishing conjecture under `Ric > 0`
  and the S6 counterexamples (framed `SU(3)` and `S³`) to refined tmf/TMF vanishing:
  Mathlib has no Ricci curvature of a Riemannian manifold, no String bordism or
  Thom spectrum `MString`, and no spectra `tmf` or `TMF`.
* The S4 integrality and modularity of the Witten genus and the S5 Cayley-plane
  kernel theorem: Mathlib has no String bordism ring and no Witten genus.
-/

noncomputable section
namespace TauCetiRoadmap.StringOrientation

open scoped unitInterval Topology

variable {X B K : Type*} [TopologicalSpace X] [TopologicalSpace B]
  [TopologicalSpace K]

/-- S1: chosen classifier nullhomotopies use the native homotopy data. -/
abbrev ClassifierNullhomotopy (c : C(X, B)) (lambdaMap : C(B, K)) (k : K) :=
  ContinuousMap.Homotopy (lambdaMap.comp c) (ContinuousMap.const X k)

/-- The starting endpoint retains the actual composite classifier. -/
theorem ClassifierNullhomotopy.start (c : C(X, B)) (lambdaMap : C(B, K))
    (k : K) (H : ClassifierNullhomotopy c lambdaMap k) (x : X) :
    H (0, x) = lambdaMap (c x) :=
  H.map_zero_left x

/-- The terminal endpoint is the chosen point, not an unspecified constant. -/
theorem ClassifierNullhomotopy.finish (c : C(X, B)) (lambdaMap : C(B, K))
    (k : K) (H : ClassifierNullhomotopy c lambdaMap k) (x : X) :
    H (1, x) = k :=
  H.map_one_left x

end TauCetiRoadmap.StringOrientation
