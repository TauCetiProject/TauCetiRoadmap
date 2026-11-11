module
import Mathlib

/-!
# Yang–Mills connections and the caloric gauge: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti. None of them is statable at the pins with only a few
simple definitions on native carriers, so the file states nothing; each headline and the carrier
it lacks are listed below.

The connections and gauge transformations of Layers 3–7 have coefficients in the vector-valued
local Sobolev classes `W^{k,p}_loc(X; V)` of maps into a finite-dimensional space, and the gauges
in the class of matrix-valued maps of class `W^{2,d/2}_loc` with values in `G` almost everywhere.
The pins have the weak-derivative predicate `TauCeti.HasWeakFDerivOn` and the scalar classes
`TauCeti.W1p` and `TauCeti.Wkp`, but not these classes (the README requests the vector-valued
classes of PDE); writing their membership out as raw weak-derivative hypotheses inside each
headline would be an ad hoc encoding of a missing carrier.

* Layer 3, gauge invariance of curvature and of finite energy (§3.2): missing the rough
  connection class and the critical gauge class above, on which the gauge action
  `O·A = Ad(O)A − (∂O)O⁻¹` and the curvature of a rough connection are defined.
  Mathlib's covariant derivatives on smooth vector bundles do not supply them.
* Layer 4, Uhlenbeck's Coulomb gauge with uniqueness and continuity (§4.1) and Uhlenbeck's
  lemma on the punctured ball (§4.2): missing the same rough connection and gauge classes on
  the ball and the punctured ball.
* Layer 5, the good global gauge (§5.2), well-definedness, gauge invariance and locality of the
  topological class (§5.4) and the trivial-class characterisation (§5.5): missing rough
  connections, their gauges at infinity, and the topological class built from them. The
  homogeneous space `Ẇ^{1,d/2}` is coefficientwise `TauCeti.D1p0` with `p = d/2`, and free
  homotopy classes are Mathlib's `ContinuousMap.Homotopic`; neither is the class of a rough
  connection, and `HomotopyGroup` alone is not the quotient by the two-sided action of `G × G`
  that the class needs for disconnected `G`.
* Layer 6, topological invariance of characteristic numbers (§6.2), the integrated
  Bogomol'nyi bound with its equality case (§6.3), and integrality and completeness of the
  `SU(2)` instanton number (§6.4): missing the curvature of a finite-energy rough connection,
  its evaluated invariant polynomial forms, and its topological class. An inequality on
  arbitrary integrable functions or on six arbitrary coefficient fields would not state these
  theorems on connections.
* Layer 7, regularity, removable singularities and decay of harmonic Yang–Mills connections
  (§§7.2–7.3), the sharp energy gap (§7.5) and the attained ground state (§7.7): missing weak
  harmonic Yang–Mills connections, which are rough connections of class `W^{1,2}_loc`. A
  smooth-only potential would drop the critical weak hypotheses of these headlines.
* Layer 8, solvability for the covariant Laplacian (§8.2) and the covariant parabolic estimates
  with decay (§§8.3–8.4): `TauCeti.D1p0` supplies the scalar first-order space `Ḣ¹(ℝ⁴)`, but the
  realised fractional spaces `Ḣ^σ` and `Ẇ^{σ,p}`, the Besov spaces `ℓ¹L²` and `ℓ²L¹Ḣ^σ`, the
  homogeneous product maps and the covariant operators on these spaces are missing. Mathlib's
  inhomogeneous Bessel-potential scale, the scalar `TauCeti.Wkp` and an abstract semigroup do
  not identify these spaces or these operators.
* Layer 9, local well-posedness, stability and continuation (§§9.3–9.4), flat limits of the
  nonlinear and linearised flows (§9.5), the Dichotomy Theorem (§9.6) and the Threshold Theorem
  (§9.7): missing the solution carrier of the heat flow in the local caloric gauge on `Ḣ¹`
  (limits of regular solutions in `Ḣ¹ ∩ Ḣ³`), its maximal lifespan and caloric size, the
  linearised limit operators with their operator-norm topology, and the convergence of rescaled
  flows to a harmonic bubble.
* Layer 10, flat connections as pure gauges and the caloric gauge (§§10.1–10.2), caloric bounds
  and the `C¹` split caloric manifold (§§10.3–10.4), and its tangent spaces with the nonlinear
  div–curl decomposition (§10.5): missing the Banach space `ℋ` (which needs `ℓ¹L²`), the
  caloric subset, the Banach space of continuous matrix functions vanishing at infinity with
  derivative in `Ḣ¹` used for normalised gauges, and the linearised heat-flow solution and limit
  operators. `Manifold.IsSmoothEmbedding` supplies the chart predicate, not these carriers.

The README states all these targets with their hypotheses, supplier contracts, APIs and Checks.
No abstract surrogate or restricted special case is substituted for a headline here.
-/

namespace TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge

end TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge
