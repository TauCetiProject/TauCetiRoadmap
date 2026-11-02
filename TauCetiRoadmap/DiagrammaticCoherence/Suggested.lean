/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Diagrammatic coherence: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs when their carriers can be expressed
using those APIs and a few simple definitions.

The following headline theorems are not statable at the pins:

* Layer 2 (C1), monoidal coherence: the free monoidal category on an arbitrary
  tensor signature with coupon generators and the independently defined category
  of progressive planar diagrams modulo relative isotopy are missing.
  Mathlib's object-generated `FreeMonoidalCategory` supplies neither carrier.
* Layer 3 (C2), braided coherence and the geometric braid comparison: the free
  braided category on a tensor signature and the progressive spatial coupon-diagram
  quotient with front-facing coupons are missing. The native Artin braid groups
  do not supply this geometric quotient or its colored categorical comparison.
* Layer 4 (C3), rigid coherence: the free autonomous category with integer dual
  levels and the independently defined winding-labelled planar-isotopy category
  are missing. Lists of integer-labelled objects alone do not supply these carriers.
* Layer 5 (C4), pivotal coherence: the free pivotal category and the marked-coupon
  planar-isotopy category with mate transport are missing, as is the pivotal
  structure supplied by PivotalSpherical Layers 0–2.
* Layer 6 (C5), braided-pivotal coherence: the free braided-pivotal category and the
  projection-regular, front-facing coupon-diagram quotient are missing, together
  with the pivotal structure and derived twist of PivotalSpherical Layer 10.
* Layer 7 (C6), ribbon coherence, including Shum's one-object specialization:
  the free ribbon category and the independently defined framed oriented tangle
  category with boundary collars, marked coupons and normal fields are missing.
  The ribbon structure is supplied by PivotalSpherical Layer 10. Native smooth
  link embeddings have no boundary ports, coupons or framing fields.
* Layer 8 (C7), evaluation and the general Reshetikhin–Turaev functor: the six
  source diagram categories, their geometric relations and, in the ribbon case,
  the ribbon target structure are missing. The closure, mirror and normalized
  ordinary-knot endpoints additionally need these evaluation and framing
  comparisons; bare scalar identities would not state those endpoints.

Layer 0's functor-level twist/pivotal comparison also needs the supplier's
pivotal, twist and double-dual structures. The generic monoidal presentation
belongs to TemperleyLieb Layer 2. Neither a second syntax development nor
winding-word cancellation substitutes for a geometric headline here.
-/

namespace TauCetiRoadmap.DiagrammaticCoherence

end TauCetiRoadmap.DiagrammaticCoherence
