import Mathlib

/-!
# Stating the classification of finite simple groups: target signatures

The roadmap is README.md; this file is not the roadmap. It records the statability of the
roadmap's headline theorems against the pinned APIs.

The headlines are the character compatibility of the indexed canonical Steinberg maps
(Layer 2), the root-, torus-, and Steinberg-compatible comparisons from every represented
model to the canonical Chevalley points (Layer 3), their fixed-point and derived-central-quotient
comparisons (Layer 4), the canonical Suzuki comparison (Layer 5), and the equivalence of the
canonical and represented-model classification propositions (Layer 6). The endpoint is the
construction of the canonical classification proposition, not a proof of CFSG.

None of these headlines is statable at the pins: the uniform simply connected
Chevalley–Demazure point carrier of ChevalleyGroups C2, with its numbered root subgroups,
torus, and C5 endomorphisms, is missing. Layer 2 also needs C5's character-map interface.
Layers 3–6 all mention that canonical carrier or its fixed-point quotient. The existing
Tau Ceti represented-model carrier and classification proposition do not supply it; using
them on both sides would erase the comparison being requested.

The indices, datum Steinberg maps, presentation syntax and all sporadic presentation data,
generic fixed-quotient transport, and universe transport are native supplier APIs, not
additional headline targets. There are no stand-in carriers or admitted data here.
-/

namespace TauCetiRoadmap.CFSGStatement

end TauCetiRoadmap.CFSGStatement
