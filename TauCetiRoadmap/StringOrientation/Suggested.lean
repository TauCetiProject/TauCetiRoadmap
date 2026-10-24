import Mathlib.Topology.Homotopy.Basic

/-!
These are suggested forms, not an exhaustive checklist. README.md is definitive.
This native nullhomotopy interface records the chosen classifier and endpoint.
The mapping-path fibre, its subspace topology, lift data and exponential-law
comparison remain the S1 targets on GeneralizedCohomology's specified carriers.
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
