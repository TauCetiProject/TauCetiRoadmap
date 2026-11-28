module

import Mathlib

/-!
# Completed cohomology and local–global compatibility, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test:
it states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with
`sorry`, using only the simple definitions such a statement needs.

The headline theorems of the roadmap are:

* local faithfulness (README §4.2; Böckle–Iyengar–Paškūnas, Theorem 6.8): for `p ∤ 2d`, the
  unrestricted framed local deformation ring `R□_ρ̄` acts faithfully on the patched module `M∞`;
* density of crystalline points at every prime (README §5.2; Böckle–Iyengar–Paškūnas, Zariski
  density of crystalline points, Corollary 5.2): regular crystalline points are Zariski dense
  in `Spec R□_ρ̄` and in its rigid generic fibre;
* density of potentially crystabelline points of one fixed regular weight (README §5.3) and of
  supercuspidal points of one fixed regular weight with unramified degree-`d` inducing field
  (README §5.4), both for `p ∤ 2d` (Böckle–Iyengar–Paškūnas, Theorem 6.1);
* density of benign crystalline points at every prime (README §6.1);
* density of potentially crystalline points of every prescribed inertial type with regular
  weights varying (README §6.3), for `p ∤ 2d`;
* density of supercuspidal points of fixed regular weight containing a minimal simple stratum
  with prescribed inducing field (README §6.5), for `p ∤ 2d`.

None of them is statable at the pins, so nothing is stated in their place:

* all seven need the universal framed local Galois deformation ring of a continuous residual
  representation `G_F → GL_d(k)` of a `p`-adic field, together with the representation attached
  to each of its arithmetic points; neither exists in pinned Mathlib or Tau Ceti;
* the six density theorems also need the crystalline, potentially semistable and
  Weil–Deligne predicates of `p`-adic Hodge theory on such representations, absent at the pins;
  the fixed-weight and typed ones further need the local Langlands correspondence for `GL_d(F)`,
  inertial types and their `K`-types, and the simple strata and simple characters of
  hereditary orders, all absent at the pins; benign density needs the benign predicate on
  crystalline Frobenius eigenvalues and refinements; rigid density needs the Berthelot generic
  fibre `(Spf R)^rig`;
* local faithfulness needs the patched module `M∞` with its commuting actions of the patched
  ring and of `GL_d(F)`; the pinned Tau Ceti has the completed group algebra
  `TauCeti.completedGroupAlgebra` and its action on compact modules, but no patched module.
-/

namespace TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibilityPartII

end TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibilityPartII
